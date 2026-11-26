import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/analytics.dart';
import '../../core/providers.dart';
import '../../core/remote_config.dart';
import '../../core/review_prompt.dart';
import '../../core/router.dart';
import '../../core/share.dart';
import '../../core/widgets.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/form_sheet.dart';
import '../../ui/shell_header.dart';
import '../community/community.dart' show casamaCloudProvider;
import 'invite_friends.dart' show creditLabel, referralProvider;

/// Invites that spread (D-588, docs/INVITE-GROWTH-PLAN.md §4.5), while Casama Cloud is invite-only:
/// - the share text: "I saved you one of my 3 Casama invites";
/// - **Send an Invite**: "Who's it for?" (a first name, optional), then the share sheet;
/// - the one-time ask after a finished reply ([InviteAskPrompt]);
/// - the invites button on the Chats screen ([InvitesButton]).
///
/// Every line is about letting someone else in, never about getting in yourself (App Store 3.2.2).

/// Where an invite was sent from, sent with `referral_shared`.
enum InvitePlace { settings, ask }

/// The invites this person can give right now while Casama Cloud is invite-only (D-427): null when
/// the gate is open, the server has no invites, they're still locked, or none are left.
ReferralInvites? invitesToGive(Referral? r) {
  final invites = r?.invites;
  if (r == null || !r.enabled || r.link == null || r.code == null) return null;
  if (invites == null || !invites.unlocked || invites.left <= 0) return null;
  return invites;
}

final _nameShape = RegExp(r"^\p{L}[\p{L}\p{M} .'’-]*$", unicode: true);

/// A first name the invite page will greet (the website's own rule: 1 to 30 letters, spaces, dots,
/// hyphens or apostrophes, starting with a letter), or null.
String? invitedName(String? value) {
  final s = (value ?? '').trim().replaceAll(RegExp(r'\s+'), ' ');
  if (s.isEmpty || s.length > 30 || !_nameShape.hasMatch(s)) return null;
  return s;
}

/// The invite link, with the friend's first name for the page's greeting (`?to=`) when there is one.
String invitedLink(String link, String? name) {
  final to = invitedName(name);
  if (to == null) return link;
  final uri = Uri.parse(link);
  return uri
      .replace(queryParameters: {...uri.queryParameters, 'to': to})
      .toString();
}

/// What gets shared: while invites are scarce, "I saved you one of my 3 Casama invites"; otherwise
/// D-211's text. A first name goes in front ("Maya, I saved you…") and on the link.
String inviteShareText(BuildContext context, Referral r, {String? name}) {
  final l10n = context.l10n;
  final link = invitedLink(r.link!, name);
  final invites = r.invites;
  final bonus = r.welcomeUsd > 0 ? creditLabel(context, r.welcomeUsd) : null;
  final text = invites != null
      ? (bonus != null
            ? l10n.inviteShareSavedBonus(invites.total, link, bonus)
            : l10n.inviteShareSaved(invites.total, link))
      : (bonus != null
            ? l10n.inviteFriendsShareTextBonus(link, r.code!, bonus)
            : l10n.inviteFriendsShareText(link, r.code!));
  final to = invitedName(name);
  return to == null ? text : l10n.inviteShareNamed(to, text);
}

/// Send an Invite: while invites are scarce, asks who it's for first; otherwise shares straight away.
/// [origin] places the share sheet on iPad and macOS.
Future<void> sendInvite(
  BuildContext context,
  Referral r,
  InvitePlace place, {
  Rect? origin,
}) async {
  String? name;
  if (r.invites != null) {
    name = await showAdaptiveSheet<String>(
      context: context,
      dialogMaxWidth: 460,
      builder: (_) => const InviteNameSheet(),
    );
    // Closing the sheet sends nothing.
    if (name == null || !context.mounted) return;
  }
  Analytics.log('referral_shared', {
    'method': 'share',
    'place': place.name,
    'named': invitedName(name) != null,
  });
  await shareText(
    inviteShareText(context, r, name: name),
    origin: origin ?? shareOrigin(context),
  );
}

/// "Who's it for?": an optional first name. Pops with the name ('' for none), or null when closed.
class InviteNameSheet extends StatefulWidget {
  const InviteNameSheet({super.key});

  @override
  State<InviteNameSheet> createState() => _InviteNameSheetState();
}

class _InviteNameSheetState extends State<InviteNameSheet> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _done() => Navigator.of(context).pop(_name.text.trim());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.ticket,
      title: l10n.inviteNameTitle,
      subtitle: l10n.inviteNameHelp,
      submitLabel: l10n.inviteNameShare,
      submitIcon: LucideIcons.share2,
      submitKey: const Key('inviteNameShare'),
      onSubmit: _done,
      children: [
        TextField(
          key: const Key('inviteNameField'),
          controller: _name,
          autofocus: true,
          maxLength: 30,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.givenName],
          decoration: InputDecoration(hintText: l10n.inviteNameHint),
          onSubmitted: (_) => _done(),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------------------- the one-time ask

/// "Who else would use this?" (D-588 #7): after a finished reply the person asked for, once per
/// device, ever. "Not Now" (or closing it) is final.
///
/// Asks when: Casama Cloud, the remote flag `invite_ask` not off, no error showed this session, at
/// least [minReplies] finished replies on this device, the store's rating sheet, the testimonial ask
/// and the star ask not shown in the last [gapDays] days (they wait after this one too), and the
/// server says invites are unlocked and left while new accounts are by invitation. The store's sheet
/// keeps first place: a reply that showed another ask only counts here.
class InviteAskPrompt {
  InviteAskPrompt(
    this._ref, {
    DateTime Function()? now,
    Duration delay = const Duration(seconds: 3),
    Future<bool?> Function(BuildContext context, Referral r)? show,
    BuildContext? Function()? context,
  }) : _now = now ?? DateTime.now,
       // ignore: prefer_initializing_formals
       _delay = delay,
       _show = show ?? showInviteAskSheet,
       // ignore: prefer_initializing_formals
       _context = context;

  final Ref _ref;
  final DateTime Function() _now;
  final Duration _delay;
  final Future<bool?> Function(BuildContext context, Referral r) _show;

  /// Where the sheet opens; the app's navigator unless a test gives one.
  final BuildContext? Function()? _context;

  static const minReplies = 3;
  static const gapDays = 7;

  static const repliesKey = 'casama.inviteAsk.replies';
  static const askedKey = 'casama.inviteAsk.asked';
  // The other asks' records (review_prompt.dart, testimonials.dart, community.dart).
  static const _otherAskedKeys = [
    'casama.review.asked',
    'casama.testimonial.asked',
    'casama.starAsk.asked',
  ];

  var _busy = false;

  /// Whether this device's rules hold at reply number [replies] (the stored count when null).
  /// Doesn't count or ask the server.
  @visibleForTesting
  Future<bool> due({int? replies}) async {
    final p = await SharedPreferences.getInstance();
    if (p.getString(askedKey) != null) return false;
    final n = replies ?? (p.getInt(repliesKey) ?? 0);
    if (n < minReplies) return false;
    final now = _now();
    for (final key in _otherAskedKeys) {
      final at = DateTime.tryParse(p.getString(key) ?? '');
      if (at != null && now.difference(at) < const Duration(days: gapDays)) {
        return false;
      }
    }
    return true;
  }

  /// A reply the person asked for finished. [anotherShown]: another ask showed for it, so this one
  /// only counts the reply. Returns whether the ask showed.
  Future<bool> moment({
    bool Function()? stillIdle,
    bool anotherShown = false,
  }) async {
    if (_busy || !_ref.mounted) return false;
    _busy = true;
    try {
      final p = await SharedPreferences.getInstance();
      final n = (p.getInt(repliesKey) ?? 0) + 1;
      await p.setInt(repliesKey, n);
      if (anotherShown || ReviewPrompt.errorThisSession) return false;
      if (_ref.read(casamaCloudProvider) != true) return false;
      final flags = _ref.read(remoteConfigProvider).value?.flags ?? const {};
      if (flags['invite_ask'] == false) return false;
      if (!await due(replies: n)) return false;
      if (!_ref.mounted) return false;
      final r = await _ref.read(backendProvider).referral();
      if (!_ref.mounted) return false;
      // The Chats button follows what the server says now (invites unlock after a first chat).
      final cached = _ref.read(referralProvider).value;
      if (cached?.invites?.left != r.invites?.left ||
          cached?.invites?.unlocked != r.invites?.unlocked) {
        _ref.invalidate(referralProvider);
      }
      final invites = invitesToGive(r);
      if (invites == null) return false;
      await Future<void>.delayed(_delay);
      if (ReviewPrompt.errorThisSession ||
          (stillIdle != null && !stillIdle()) ||
          !_ref.mounted) {
        return false;
      }
      final context =
          _context?.call() ??
          _ref.read(routerProvider).routerDelegate.navigatorKey.currentContext;
      if (context == null || !context.mounted) return false;
      // Once per device, ever: recorded before it shows, so nothing can show it twice.
      await p.setString(askedKey, _now().toIso8601String());
      unawaited(
        Analytics.capture(
          'invite_ask_shown',
          properties: {'invites_left': invites.left},
        ),
      );
      if (!context.mounted) return false;
      final send = await _show(context, r);
      if (send == true) {
        if (context.mounted) await sendInvite(context, r, InvitePlace.ask);
      } else {
        unawaited(Analytics.capture('invite_ask_dismissed'));
      }
      return true;
    } catch (_) {
      return false;
    } finally {
      _busy = false;
    }
  }
}

final inviteAskProvider = Provider<InviteAskPrompt>(
  (ref) => InviteAskPrompt(ref),
);

/// The ask itself: true when Send an Invite was tapped; false or null for Not Now or closing it.
Future<bool?> showInviteAskSheet(BuildContext context, Referral r) =>
    showAdaptiveSheet<bool>(
      context: context,
      dialogMaxWidth: 460,
      builder: (_) => InviteAskSheet(referral: r),
    );

class InviteAskSheet extends StatelessWidget {
  const InviteAskSheet({super.key, required this.referral});

  final Referral referral;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final r = referral;
    final left = r.invites?.left ?? 0;
    final reward = r.rewardUsd > 0 && r.rewardUsd == r.welcomeUsd
        ? l10n.inviteAskRewardBoth(creditLabel(context, r.rewardUsd))
        : r.rewardUsd > 0
        ? l10n.inviteAskReward(creditLabel(context, r.rewardUsd))
        : null;
    return FormSheet(
      icon: LucideIcons.ticket,
      title: l10n.inviteAskTitle,
      subtitle: [l10n.inviteAskBody(left), ?reward].join(' '),
      submitLabel: l10n.inviteAskSend,
      submitIcon: LucideIcons.send,
      submitKey: const Key('inviteAskSend'),
      cancelLabel: l10n.inviteAskNotNow,
      onSubmit: () => Navigator.of(context).pop(true),
      onCancel: () => Navigator.of(context).pop(false),
      children: const [],
    );
  }
}

// ------------------------------------------------------------------------- the Chats button

/// A ticket on the Chats screen while this person has invites to give (D-588 #8). Opens Invite
/// Friends; the tooltip says how many are left.
class InvitesButton extends ConsumerWidget {
  const InvitesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invites = invitesToGive(ref.watch(referralProvider).value);
    if (invites == null) return const SizedBox.shrink();
    return HeaderIconButton(
      key: const Key('chatsInvites'),
      icon: LucideIcons.ticket,
      badge: true,
      tooltip: context.l10n.inviteFriendsInvitesLeft(invites.left),
      onPressed: () => context.push('/settings/invite'),
    );
  }
}
