import 'dart:async';
import 'dart:convert';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/providers.dart';
import '../../core/remote_config.dart';
import '../../core/review_prompt.dart';
import '../../core/router.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/form_sheet.dart';

/// Testimonials (D-545, docs/TESTIMONIALS-PLAN.md): short quotes from real people, chosen by the
/// server's owner. The app reads the same public list as casama.ai and shows one quote at a time on
/// the paywall and the sign-in screen. And, behind the remote flag `testimonial_ask` (off unless the
/// owner turns it on), it can ask "Enjoying Casama? Tell us in a sentence." after a good moment.

/// Fewer live quotes than this and the app shows none (CONVERSION-FUNNEL-PLAN §5.2).
const kMinTestimonials = 1;

/// How long a fetched list is kept before it's asked for again.
const kTestimonialsCacheFor = Duration(days: 1);

/// One copy per server and place, so switching servers never shows the last server's quotes.
@visibleForTesting
String testimonialsCacheKey(String server, TestimonialPlace place) {
  // A short stable fingerprint of the address (FNV-1a), not the address itself.
  var h = 0x811c9dc5;
  for (final c in server.codeUnits) {
    h = ((h ^ c) * 0x01000193) & 0xffffffff;
  }
  return 'casama.testimonials.${h.toRadixString(36)}.${place.value}';
}

/// The live quotes for [place]: cached on the device for a day, empty when the server has none, is
/// offline with nothing fresh kept, or answers with an error.
final testimonialsProvider = FutureProvider.autoDispose
    .family<List<PublicTestimonial>, TestimonialPlace>((ref, place) async {
      final backend = ref.watch(backendProvider);
      String server;
      try {
        server = backend.apiUrl;
      } catch (_) {
        server = '';
      }
      final key = testimonialsCacheKey(server, place);
      SharedPreferences? prefs;
      try {
        prefs = await SharedPreferences.getInstance();
        final raw = prefs.getString(key);
        if (raw != null) {
          final saved = jsonDecode(raw) as Map<String, dynamic>;
          final at = DateTime.tryParse(saved['at'] as String? ?? '');
          if (at != null &&
              DateTime.now().difference(at) < kTestimonialsCacheFor) {
            return [
              for (final item in saved['items'] as List<dynamic>)
                PublicTestimonial.fromJson(item as Map<String, dynamic>),
            ];
          }
        }
      } catch (_) {
        // A broken saved copy is fetched again.
      }
      try {
        final items = await backend.testimonials(place: place);
        try {
          await prefs?.setString(
            key,
            jsonEncode({
              'at': DateTime.now().toIso8601String(),
              'items': [for (final t in items) t.toJson()],
            }),
          );
        } catch (_) {}
        return items;
      } catch (_) {
        return const [];
      }
    });

/// "Matt W., Max plan, UK"
String testimonialByline(PublicTestimonial t) => [
  t.nameShown,
  if ((t.roleShown ?? '').trim().isNotEmpty) t.roleShown!.trim(),
].join(', ');

/// One quote at a time from [place], changing every few seconds (not with reduced motion). Draws
/// nothing until there are at least [kMinTestimonials] live quotes.
class TestimonialQuote extends ConsumerStatefulWidget {
  const TestimonialQuote({
    super.key,
    required this.place,
    this.padding = EdgeInsets.zero,
    this.interval = const Duration(seconds: 8),
  });

  final TestimonialPlace place;

  /// Space around it, only when it shows.
  final EdgeInsetsGeometry padding;
  final Duration interval;

  @override
  ConsumerState<TestimonialQuote> createState() => _TestimonialQuoteState();
}

class _TestimonialQuoteState extends ConsumerState<TestimonialQuote> {
  Timer? _timer;
  var _index = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _schedule(int count, bool still) {
    if (count < 2 || still) {
      _timer?.cancel();
      _timer = null;
      return;
    }
    _timer ??= Timer.periodic(widget.interval, (_) {
      if (mounted) setState(() => _index++);
    });
  }

  @override
  Widget build(BuildContext context) {
    final items =
        ref.watch(testimonialsProvider(widget.place)).value ??
        const <PublicTestimonial>[];
    if (items.length < kMinTestimonials) {
      _schedule(0, true);
      return const SizedBox.shrink();
    }
    final still = MediaQuery.disableAnimationsOf(context);
    _schedule(items.length, still);
    final t = items[_index % items.length];
    final scheme = context.colorScheme;
    final rating = t.rating;
    final incentive = (t.incentiveNote ?? '').trim();
    final card = Column(
      key: ValueKey('${t.nameShown}|${t.quote}'),
      mainAxisSize: MainAxisSize.min,
      children: [
        if (rating != null)
          Semantics(
            label: context.l10n.testimonialStars(rating),
            excludeSemantics: true,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < 5; i++)
                  Icon(
                    LucideIcons.star,
                    size: 14,
                    color: i < rating ? scheme.primary : scheme.outlineVariant,
                  ),
              ],
            ),
          ),
        if (rating != null) const SizedBox(height: AppSpace.xs),
        Text(
          '“${t.quote}”',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge?.copyWith(
            fontStyle: FontStyle.italic,
            height: 1.4,
            color: scheme.onSurface,
          ),
        ),
        const SizedBox(height: AppSpace.xs),
        Text(
          testimonialByline(t),
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall?.copyWith(
            color: scheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (incentive.isNotEmpty)
          Text(
            incentive,
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
      ],
    );
    return Padding(
      padding: widget.padding,
      child: Semantics(
        container: true,
        label: context.l10n.testimonialsLabel,
        child: AnimatedSwitcher(
          duration: AppMotion.of(context, AppMotion.duration),
          child: KeyedSubtree(
            key: Key(
              'testimonial-${widget.place.value}-${_index % items.length}',
            ),
            child: card,
          ),
        ),
      ),
    );
  }
}

/// The app's own ask (plan §4.5): "Enjoying Casama? Tell us in a sentence." Separate from the store's
/// rating sheet: its own flag and schedule, it never offers anything back, and what people answer
/// never decides whether the store's sheet shows. What they send is a draft the owner reads.
///
/// Asks when: the flag `testimonial_ask` is on, no error showed this session, at least [minDays]
/// days of use and [minReplies] finished replies, nothing asked on this device in [gapDays] days,
/// the store's sheet didn't show in the last two days, the GitHub star ask (D-577) didn't show in the
/// last seven, and the server says this person may send one.
class TestimonialAskPrompt {
  TestimonialAskPrompt(
    this._ref, {
    DateTime Function()? now,
    Duration delay = const Duration(seconds: 3),
  }) : _now = now ?? DateTime.now,
       // ignore: prefer_initializing_formals
       _delay = delay;

  final Ref _ref;
  final DateTime Function() _now;
  final Duration _delay;

  static const minDays = 5;
  static const minReplies = 15;
  static const gapDays = 90;

  static const _repliesKey = 'casama.testimonial.replies';
  static const _askedKey = 'casama.testimonial.asked';
  // The store prompt's own records (review_prompt.dart): days of use, and when it last asked.
  static const _reviewDaysKey = 'casama.review.days';
  static const _reviewAskedKey = 'casama.review.asked';
  // The GitHub star ask's (community.dart): it keeps seven days from every other ask (D-577).
  static const _starAskedKey = 'casama.starAsk.asked';
  // The one-time invite ask's (invite_ask.dart, D-588): seven days apart too.
  static const _inviteAskedKey = 'casama.inviteAsk.asked';

  var _busy = false;

  /// Whether every rule on this device holds; counts this reply. Doesn't ask the server.
  @visibleForTesting
  Future<bool> due() async {
    final p = await SharedPreferences.getInstance();
    final n = (p.getInt(_repliesKey) ?? 0) + 1;
    await p.setInt(_repliesKey, n);
    if (n < minReplies) return false;
    if ((p.getStringList(_reviewDaysKey) ?? const []).length < minDays) {
      return false;
    }
    final now = _now();
    final asked = DateTime.tryParse(p.getString(_askedKey) ?? '');
    if (asked != null && now.difference(asked).inDays < gapDays) return false;
    final store = DateTime.tryParse(p.getString(_reviewAskedKey) ?? '');
    if (store != null && now.difference(store).inHours < 48) return false;
    for (final key in [_starAskedKey, _inviteAskedKey]) {
      final at = DateTime.tryParse(p.getString(key) ?? '');
      if (at != null && now.difference(at) < const Duration(days: 7)) {
        return false;
      }
    }
    return true;
  }

  /// A reply the person asked for finished. Returns whether the sheet showed.
  Future<bool> moment({bool Function()? stillIdle}) async {
    if (_busy || ReviewPrompt.errorThisSession || !_ref.mounted) return false;
    _busy = true;
    try {
      final flags = _ref.read(remoteConfigProvider).value?.flags ?? const {};
      if (flags['testimonial_ask'] != true) return false;
      if (!await due()) return false;
      if (!_ref.mounted) return false;
      final ask = await _ref.read(backendProvider).testimonialAsk();
      if (!ask.canSend || !_ref.mounted) return false;
      await Future<void>.delayed(_delay);
      if (ReviewPrompt.errorThisSession ||
          (stillIdle != null && !stillIdle())) {
        return false;
      }
      if (!_ref.mounted) return false;
      final context = _ref
          .read(routerProvider)
          .routerDelegate
          .navigatorKey
          .currentContext;
      if (context == null || !context.mounted) return false;
      final p = await SharedPreferences.getInstance();
      await p.setString(_askedKey, _now().toIso8601String());
      if (!context.mounted) return false;
      await showTestimonialAskSheet(context, name: ask.nameShown);
      return true;
    } catch (_) {
      return false;
    } finally {
      _busy = false;
    }
  }
}

final testimonialAskProvider = Provider<TestimonialAskPrompt>(
  (ref) => TestimonialAskPrompt(ref),
);

Future<void> showTestimonialAskSheet(BuildContext context, {String? name}) =>
    showAdaptiveSheet<void>(
      context: context,
      dialogMaxWidth: 460,
      builder: (_) => TestimonialAskSheet(name: name),
    );

/// A text box and a consent tick (unticked until the person ticks it).
class TestimonialAskSheet extends ConsumerStatefulWidget {
  const TestimonialAskSheet({super.key, this.name});

  /// What the quote would show (first name and last initial); null shows "a Casama user".
  final String? name;

  @override
  ConsumerState<TestimonialAskSheet> createState() =>
      _TestimonialAskSheetState();
}

class _TestimonialAskSheetState extends ConsumerState<TestimonialAskSheet> {
  final _text = TextEditingController();
  var _consent = false;
  var _busy = false;

  @override
  void initState() {
    super.initState();
    _text.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final quote = _text.text.trim();
    if (quote.length < 3) return;
    setState(() => _busy = true);
    final ok = await runGuarded(context, () async {
      await ref
          .read(backendProvider)
          .submitTestimonial(
            quote: quote,
            consent: _consent,
            orgId: ref.read(currentOrgIdProvider),
            platform: remotePlatform(),
          );
      return true;
    });
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok == true) {
      final l10n = context.l10n;
      Navigator.pop(context);
      showSuccess(context, l10n.testimonialAskThanks);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final name = widget.name;
    return FormSheet(
      icon: LucideIcons.messageCircleHeart,
      title: l10n.testimonialAskTitle,
      subtitle: l10n.testimonialAskSubtitle,
      submitLabel: l10n.testimonialAskSend,
      submitKey: const Key('testimonialAskSend'),
      cancelLabel: l10n.testimonialAskNotNow,
      busy: _busy,
      onSubmit: _text.text.trim().length < 3 ? null : _send,
      children: [
        TextField(
          key: const Key('testimonialAskText'),
          controller: _text,
          autofocus: true,
          minLines: 2,
          maxLines: 5,
          maxLength: 280,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(hintText: l10n.testimonialAskHint),
        ),
        CheckboxListTile(
          key: const Key('testimonialAskConsent'),
          value: _consent,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (v) => setState(() => _consent = v ?? false),
          title: Text(
            name == null ? l10n.testimonialAskConsentAnonymous : l10n.testimonialAskConsent(name),
            style: context.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
