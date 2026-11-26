import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/analytics.dart';
import '../../core/link_browser.dart';
import '../../core/providers.dart';
import '../../core/remote_config.dart';
import '../../core/remote_content.dart';
import '../../core/review_prompt.dart';
import '../../core/router.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';

/// Casama's open-source community in the app (D-577, docs/GITHUB-STARS-PLAN.md §5.3):
/// - Settings → Help & support → **Community**: Star on GitHub, Discord, Ideas board, Status. Always
///   there, on every platform.
/// - Casama Cloud: one ask after a finished reply, once per device ([StarAskPrompt]).
///
/// Every one of them is only a link to the repo. Nothing stars for anyone, nothing uses a person's
/// GitHub connection, and nothing is given for a star (GitHub Acceptable Use Policies §4).

/// The repo, through casama.ai's short link (it counts the click and redirects to the public repo),
/// so the repo can move without an app build. The server can also replace it (`remoteUri`).
const kGitHubUrl = 'https://casama.ai/github';
const kDiscordUrl = 'https://discord.gg/e86XbXFHwz';
const kIdeasUrl = 'https://ideas.casama.ai';
const kStatusUrl = 'https://status.casama.ai';

/// Where a Star on GitHub tap came from, sent with `github_star_tap`.
enum StarPlace { settings, ask }

/// Whether the app is connected to Casama Cloud: true or false once main knows from the server's
/// config (the same rule as `server_kind`), null when it can't say. The Cloud ask needs true.
final casamaCloudProvider = Provider<bool?>((ref) => null);

Uri get _repo => remoteUri('github', kGitHubUrl);

/// Opens a community link. Starring needs the person's GitHub sign-in, so like other sign-in links
/// (D-352) the repo opens in the default browser, or the GitHub app where one takes the link; the
/// others follow Settings → App → Open links in the app. Says whether something opened it.
/// Overridable in tests.
final communityOpenProvider = Provider<Future<bool> Function(Uri uri)>(
  (ref) => (uri) async {
    if (uri != _repo && uri.host != 'github.com') return openWebLink(uri);
    try {
      return await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (_) {
      return false;
    }
  },
);

/// Star on GitHub: counts the tap with where it came from, then opens the repo page with [open].
Future<void> openGitHubStar(
  Future<bool> Function(Uri uri) open,
  StarPlace place,
) async {
  unawaited(
    Analytics.capture('github_star_tap', properties: {'place': place.name}),
  );
  await open(_repo);
}

/// Settings → Help & support → Community.
class CommunityGroup extends ConsumerWidget {
  const CommunityGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final open = ref.read(communityOpenProvider);
    final external = Icon(
      LucideIcons.externalLink,
      size: 18,
      color: scheme.onSurfaceVariant,
    );
    return Column(
      key: const Key('communityGroup'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(title: l10n.communityTitle),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('communityStar'),
              icon: LucideIcons.star,
              title: l10n.communityStarOnGitHub,
              subtitle: l10n.communitySentence,
              trailing: external,
              onTap: () => openGitHubStar(open, StarPlace.settings),
            ),
            GroupedTile(
              key: const Key('communityDiscord'),
              icon: LucideIcons.messagesSquare,
              title: l10n.communityDiscord,
              subtitle: l10n.communityDiscordHelp,
              trailing: external,
              onTap: () => open(remoteUri('discord', kDiscordUrl)),
            ),
            GroupedTile(
              key: const Key('communityIdeas'),
              icon: LucideIcons.lightbulb,
              title: l10n.supportIdeasBoard,
              subtitle: l10n.supportIdeasBoardHelp,
              trailing: external,
              onTap: () => open(remoteUri('ideas', kIdeasUrl)),
            ),
            GroupedTile(
              key: const Key('communityStatus'),
              icon: LucideIcons.activity,
              title: l10n.supportStatus,
              subtitle: l10n.supportStatusHelp,
              trailing: external,
              onTap: () => open(remoteUri('status', kStatusUrl)),
            ),
          ],
        ),
      ],
    );
  }
}

// ------------------------------------------------------------------------- the Cloud ask

/// The one ask on Casama Cloud (D-577 #1, #2): "Casama is open source", after a finished reply the
/// person asked for, once per device, ever. "Not now" (or closing it) is final.
///
/// Asks when: the server says yes (`GET /v1/me/star-ask`: Casama Cloud, flag `github_star_ask` not
/// off), no error showed this session, enough days of use and finished replies ([devDays] and
/// [devReplies] for people with a developer signal, else [minDays] and [minReplies]), and neither the
/// store's rating sheet nor the testimonial ask showed on this device in the last [gapDays] days.
/// It works both ways: after this ask, those two wait seven days as well. The store's sheet keeps
/// first place on a reply: it's tried first, and a reply that showed another ask only counts here.
class StarAskPrompt {
  StarAskPrompt(
    this._ref, {
    DateTime Function()? now,
    Duration delay = const Duration(seconds: 3),
    Future<bool?> Function(BuildContext context)? show,
    BuildContext? Function()? context,
  }) : _now = now ?? DateTime.now,
       // ignore: prefer_initializing_formals
       _delay = delay,
       _show = show ?? showStarAskSheet,
       // ignore: prefer_initializing_formals
       _context = context;

  final Ref _ref;
  final DateTime Function() _now;
  final Duration _delay;
  final Future<bool?> Function(BuildContext context) _show;

  /// Where the sheet opens; the app's navigator unless a test gives one.
  final BuildContext? Function()? _context;

  static const devDays = 7;
  static const devReplies = 20;
  static const minDays = 14;
  static const minReplies = 40;
  static const gapDays = 7;

  static const repliesKey = 'casama.starAsk.replies';
  static const askedKey = 'casama.starAsk.asked';
  // The other asks' records: days of use and the store sheet (review_prompt.dart), the testimonial
  // ask (testimonials.dart).
  static const _reviewDaysKey = 'casama.review.days';
  static const _reviewAskedKey = 'casama.review.asked';
  static const _testimonialAskedKey = 'casama.testimonial.asked';
  // The one-time invite ask's (features/referrals/invite_ask.dart, D-588).
  static const _inviteAskedKey = 'casama.inviteAsk.asked';

  var _busy = false;
  StarAsk? _server;
  DateTime? _serverAt;

  /// Counts a finished reply the person asked for.
  Future<int> _count(SharedPreferences p) async {
    final n = (p.getInt(repliesKey) ?? 0) + 1;
    await p.setInt(repliesKey, n);
    return n;
  }

  /// Whether this device's rules hold for someone with ([developer]) or without a developer signal,
  /// at reply number [replies] (the stored count when null). Doesn't count or ask the server.
  @visibleForTesting
  Future<bool> due({required bool developer, int? replies}) async {
    final p = await SharedPreferences.getInstance();
    if (p.getString(askedKey) != null) return false;
    final n = replies ?? (p.getInt(repliesKey) ?? 0);
    if (n < (developer ? devReplies : minReplies)) return false;
    final days = (p.getStringList(_reviewDaysKey) ?? const []).length;
    if (days < (developer ? devDays : minDays)) return false;
    final now = _now();
    for (final key in [_reviewAskedKey, _testimonialAskedKey, _inviteAskedKey]) {
      final at = DateTime.tryParse(p.getString(key) ?? '');
      if (at != null && now.difference(at) < const Duration(days: gapDays)) {
        return false;
      }
    }
    return true;
  }

  /// The server's answer, kept for a day so a long session asks once.
  Future<StarAsk> _serverAnswer() async {
    final at = _serverAt;
    if (_server != null &&
        at != null &&
        _now().difference(at) < const Duration(days: 1)) {
      return _server!;
    }
    final answer = await _ref.read(backendProvider).starAsk();
    _server = answer;
    _serverAt = _now();
    return answer;
  }

  /// A reply the person asked for finished. [anotherShown]: the store's sheet or the testimonial
  /// ask showed for it, so this one only counts the reply. Returns whether the ask showed.
  Future<bool> moment({
    bool Function()? stillIdle,
    bool anotherShown = false,
  }) async {
    if (_busy || !_ref.mounted) return false;
    _busy = true;
    try {
      final p = await SharedPreferences.getInstance();
      final n = await _count(p);
      if (anotherShown || ReviewPrompt.errorThisSession) return false;
      if (_ref.read(casamaCloudProvider) != true) return false;
      final flags = _ref.read(remoteConfigProvider).value?.flags ?? const {};
      if (flags['github_star_ask'] == false) return false;
      // The looser (developer) rules first, so most replies never ask the server.
      if (!await due(developer: true, replies: n)) return false;
      if (!_ref.mounted) return false;
      final server = await _serverAnswer();
      if (!server.ask) return false;
      if (!server.developer && !await due(developer: false, replies: n)) {
        return false;
      }
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
          'github_star_ask_shown',
          properties: {'developer': server.developer},
        ),
      );
      if (!context.mounted) return false;
      final starred = await _show(context);
      if (starred == true) {
        if (_ref.mounted) {
          await openGitHubStar(_ref.read(communityOpenProvider), StarPlace.ask);
        }
      } else {
        unawaited(Analytics.capture('github_star_ask_dismissed'));
      }
      return true;
    } catch (_) {
      return false;
    } finally {
      _busy = false;
    }
  }
}

final starAskProvider = Provider<StarAskPrompt>((ref) => StarAskPrompt(ref));

/// The ask itself: true when Star on GitHub was tapped; false or null for Not now or closing it.
Future<bool?> showStarAskSheet(BuildContext context) => showAdaptiveSheet<bool>(
  context: context,
  dialogMaxWidth: 460,
  builder: (_) => const StarAskSheet(),
);

class StarAskSheet extends StatelessWidget {
  const StarAskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.star,
      title: l10n.starAskTitle,
      subtitle: l10n.communitySentence,
      submitLabel: l10n.communityStarOnGitHub,
      submitKey: const Key('starAskStar'),
      cancelLabel: l10n.starAskNotNow,
      onSubmit: () => Navigator.of(context).pop(true),
      onCancel: () => Navigator.of(context).pop(false),
      children: const [],
    );
  }
}
