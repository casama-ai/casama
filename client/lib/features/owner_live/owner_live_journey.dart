import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import 'owner_live_models.dart';

/// Live activity v2 (D-537, docs/LIVE-ACTIVITY-V2-PLAN.md): a row that shows where someone came
/// from and how far they got, and a sheet with their whole path from click to paying.

/// "PH" → "🇵🇭"; anything else gives null.
String? liveFlag(String? country) {
  final cc = country?.toUpperCase();
  if (cc == null || !RegExp(r'^[A-Z]{2}$').hasMatch(cc)) return null;
  return String.fromCharCodes(cc.codeUnits.map((c) => 0x1f1e6 + c - 65));
}

const _platformNames = {
  'ios': 'iPhone',
  'android': 'Android',
  'macos': 'Mac',
  'windows': 'Windows',
  'linux': 'Linux',
  'web': 'Web',
  'mac': 'Mac',
  'mac-dmg': 'Mac',
  'android-apk': 'Android',
  'android-play': 'Android',
  'windows-zip': 'Windows',
  'linux-arm64': 'Linux',
  'chrome': 'Chrome',
  'edge': 'Edge',
  'firefox': 'Firefox',
};

const _distributionNames = {
  'app_store': 'App Store',
  'testflight': 'TestFlight',
  'google_play': 'Google Play',
  'play': 'Google Play',
  'mac_app_store': 'Mac App Store',
  'android_apk': 'APK',
  'galaxy_store': 'Galaxy Store',
  'fdroid': 'F-Droid',
  'direct': 'Direct download',
  'web': 'app.casama.ai',
};

String livePlatformName(String p) => _platformNames[p] ?? p;
String liveDistributionName(String d) =>
    _distributionNames[d] ?? d.replaceAll('_', ' ');

IconData livePlatformIcon(String? p) => switch (p) {
  'ios' ||
  'android' ||
  'android-apk' ||
  'android-play' => LucideIcons.smartphone,
  'macos' || 'mac' || 'mac-dmg' => LucideIcons.laptop,
  'windows' || 'windows-zip' => LucideIcons.monitor,
  'linux' || 'linux-arm64' => LucideIcons.terminal,
  'chrome' || 'edge' || 'firefox' => LucideIcons.puzzle,
  _ => LucideIcons.globe,
};

/// The platform an event was on: the app's, else the clicked one.
String? livePlatformOf(LiveEvent e) =>
    e.journey?.platform ?? e.fact('platform') ?? e.journey?.clickPlatform;

String? liveCountryOf(LiveEvent e) => e.fact('country') ?? e.journey?.country;

String? liveSourceOf(LiveEvent e) {
  final j = e.journey;
  if (j?.from != null) return j!.from;
  final s = e.fact('source')?.toLowerCase();
  if (s == null || s == 'casama.ai' || s == 'direct') return null;
  return s;
}

/// "4 min", "3 h", "2 days".
String liveGap(BuildContext context, Duration d) {
  final l10n = context.l10n;
  if (d.inMinutes < 1) return l10n.liveNow;
  if (d.inMinutes < 60) return l10n.liveMinutesAgo(d.inMinutes);
  if (d.inHours < 48) return l10n.liveHoursAgo(d.inHours);
  return '${d.inDays} d';
}

/// Small facts under a row: platform, country, source, app version.
class LiveMetaChips extends StatelessWidget {
  const LiveMetaChips({super.key, required this.event});
  final LiveEvent event;

  @override
  Widget build(BuildContext context) {
    final platform = livePlatformOf(event);
    final country = liveCountryOf(event);
    final source = liveSourceOf(event);
    final version = event.fact('version');
    final chips = <Widget>[
      if (platform != null)
        _chip(
          context,
          livePlatformName(platform),
          icon: livePlatformIcon(platform),
        ),
      if (country != null)
        _chip(context, '${liveFlag(country) ?? ''} $country'.trim()),
      if (source != null) _chip(context, source, icon: LucideIcons.link),
      if (version != null) _chip(context, 'v$version'),
      if (event.journey?.likely == true || event.detail['match'] == 'likely')
        _chip(context, context.l10n.liveLikely, icon: LucideIcons.circleHelp),
    ];
    if (chips.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: AppSpace.xxs,
      runSpacing: AppSpace.xxs,
      children: chips,
    );
  }

  Widget _chip(BuildContext context, String text, {IconData? icon}) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(
          alpha: context.isDark ? 0.6 : 0.8,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: scheme.onSurfaceVariant),
            const SizedBox(width: 3),
          ],
          Text(
            text,
            style: context.textTheme.labelSmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Five dots: clicked, opened the app, made an account, first chat, paying.
class LiveJourneyDots extends StatelessWidget {
  const LiveJourneyDots({super.key, required this.steps});
  final LiveJourneySteps steps;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final names = [
      l10n.liveStepClick,
      l10n.liveStepOpen,
      l10n.liveStepSignup,
      l10n.liveStepChat,
      l10n.liveStepPaying,
    ];
    final done = steps.all;
    return Semantics(
      label: [
        for (var i = 0; i < 5; i++)
          if (done[i]) names[i],
      ].join(', '),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 5; i++) ...[
            if (i > 0)
              Container(
                width: 6,
                height: 1.5,
                color: (done[i] && done[i - 1]
                    ? scheme.primary
                    : scheme.outlineVariant),
              ),
            Tooltip(
              message: names[i],
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done[i]
                      ? (i == 4 ? context.appColors.positive : scheme.primary)
                      : Colors.transparent,
                  border: Border.all(
                    color: done[i] ? Colors.transparent : scheme.outlineVariant,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Opens the sheet for [event]: its journey when it has one, else the event alone.
Future<void> showLiveJourney(
  BuildContext context, {
  LiveEvent? event,
  String? journeyId,
}) {
  return showAdaptiveSheet<void>(
    context: context,
    heightFactor: 0.9,
    contentPadsBottom: true,
    builder: (_) => LiveJourneySheet(
      event: event,
      journeyId: journeyId ?? event?.journeyId,
    ),
  );
}

class LiveJourneySheet extends ConsumerStatefulWidget {
  const LiveJourneySheet({super.key, this.event, this.journeyId});
  final LiveEvent? event;
  final String? journeyId;

  @override
  ConsumerState<LiveJourneySheet> createState() => _LiveJourneySheetState();
}

class _LiveJourneySheetState extends ConsumerState<LiveJourneySheet> {
  LiveJourneyDetail? _detail;
  Object? _error;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    if (widget.journeyId != null) _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final d = await ref.read(backendProvider).ownerJourney(widget.journeyId!);
      if (mounted) setState(() => _detail = d);
    } catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final d = _detail;
    final events = d?.events ?? [?widget.event];
    final journey = d?.journey ?? widget.event?.journey;
    final person = d?.person;
    final title =
        person?.email ??
        widget.event?.label ??
        (journey?.country != null
            ? '${l10n.liveJourneyVisitor} ${liveFlag(journey!.country) ?? journey.country}'
            : l10n.liveJourneyVisitor);
    return ListView(
      key: const Key('liveJourneySheet'),
      padding: EdgeInsets.fromLTRB(
        AppSpace.md,
        AppSpace.md,
        AppSpace.md,
        AppSpace.xl + MediaQuery.paddingOf(context).bottom,
      ),
      children: [
        Text(
          l10n.liveJourneyTitle,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpace.xxs),
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        if (person?.name != null)
          Text(
            person!.name!,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        if (journey != null) ...[
          const SizedBox(height: AppSpace.sm),
          LiveJourneyDots(steps: journey.steps),
        ],
        if (_loading)
          const Padding(
            padding: EdgeInsets.all(AppSpace.lg),
            child: Center(child: CircularProgressIndicator()),
          ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpace.md),
            child: Text(
              l10n.liveJourneyGone,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        if (journey != null) ..._journeyFacts(context, journey),
        if (person != null) ..._personFacts(context, person),
        if (events.isNotEmpty) ...[
          SectionHeader(title: l10n.liveJourneyTimeline),
          GroupedCard(children: _timeline(context, events)),
        ],
        if (journey == null &&
            person == null &&
            widget.event != null &&
            widget.event!.detail.isNotEmpty) ...[
          SectionHeader(title: l10n.liveJourneyFrom),
          GroupedCard(
            children: [
              for (final e in widget.event!.detail.entries)
                if (e.value != null)
                  _fact(context, e.key.replaceAll('_', ' '), '${e.value}'),
            ],
          ),
        ],
        if (person?.email != null) ...[
          const SizedBox(height: AppSpace.md),
          Wrap(
            spacing: AppSpace.sm,
            children: [
              OutlinedButton.icon(
                key: const Key('liveCopyEmail'),
                icon: const Icon(LucideIcons.copy, size: 16),
                label: Text(l10n.liveJourneyCopyEmail),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: person!.email!));
                  if (context.mounted) {
                    showToast(
                      context,
                      l10n.liveJourneyCopied,
                      kind: ToastKind.success,
                    );
                  }
                },
              ),
              OutlinedButton.icon(
                key: const Key('liveOpenAdmin'),
                icon: const Icon(LucideIcons.shieldCheck, size: 16),
                label: Text(l10n.liveJourneyOpenAdmin),
                onPressed: () {
                  Navigator.of(context).pop();
                  GoRouter.of(context).push('/settings/admin?tab=users');
                },
              ),
            ],
          ),
        ],
      ],
    );
  }

  List<Widget> _journeyFacts(BuildContext context, LiveJourney j) {
    final l10n = context.l10n;
    final from = [
      if (j.source != null)
        _fact(
          context,
          l10n.liveJourneySource,
          [j.source, j.medium].whereType<String>().join(' · '),
        ),
      if (j.campaign != null)
        _fact(context, l10n.liveJourneyCampaign, j.campaign!),
      if (j.page != null) _fact(context, l10n.liveJourneyClickedFrom, j.page!),
      if (j.landing != null)
        _fact(context, l10n.liveJourneyLanding, j.landing!),
    ];
    final device = [
      if (j.platform != null || j.clickPlatform != null)
        _fact(
          context,
          l10n.liveJourneyPlatform,
          livePlatformName(j.platform ?? j.clickPlatform!),
        ),
      if (j.distribution != null)
        _fact(
          context,
          l10n.liveJourneyStore,
          liveDistributionName(j.distribution!),
        ),
      if (j.appVersion != null)
        _fact(context, l10n.liveJourneyVersion, j.appVersion!),
      if (j.country != null)
        _fact(
          context,
          l10n.liveJourneyCountry,
          '${liveFlag(j.country) ?? ''} ${j.country}'.trim(),
        ),
    ];
    return [
      if (j.likely)
        Padding(
          padding: const EdgeInsets.only(top: AppSpace.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                LucideIcons.circleHelp,
                size: 16,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: Text(
                  l10n.liveJourneyLikelyHelp,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      if (from.isNotEmpty) ...[
        SectionHeader(title: l10n.liveJourneyFrom),
        GroupedCard(children: from),
      ],
      if (device.isNotEmpty) ...[
        SectionHeader(title: l10n.liveJourneyDevice),
        GroupedCard(children: device),
      ],
    ];
  }

  List<Widget> _personFacts(BuildContext context, LiveJourneyPerson p) {
    final l10n = context.l10n;
    return [
      SectionHeader(title: l10n.liveJourneyNow),
      GroupedCard(
        children: [
          if (p.createdAt != null)
            _fact(
              context,
              l10n.liveJourneyJoined,
              p.createdAt!.formattedExact(context),
            ),
          if (p.plan != null)
            _fact(
              context,
              l10n.liveJourneyPlan,
              [p.plan, p.planStatus].whereType<String>().join(' · '),
            ),
          _fact(context, l10n.liveJourneyMessages, '${p.messages}'),
          _fact(context, l10n.liveJourneyBots, '${p.bots}'),
          if (p.devices.isNotEmpty)
            _fact(
              context,
              l10n.liveJourneyDevices,
              p.devices.map(livePlatformName).join(', '),
            ),
          if (p.lastActiveAt != null)
            _fact(
              context,
              l10n.liveJourneyLastActive,
              p.lastActiveAt!.formattedExact(context),
            ),
        ],
      ),
    ];
  }

  List<Widget> _timeline(BuildContext context, List<LiveEvent> events) {
    final l10n = context.l10n;
    final out = <Widget>[];
    for (var i = 0; i < events.length; i++) {
      final e = events[i];
      final gap = i == 0
          ? null
          : e.createdAt.difference(events[i - 1].createdAt);
      out.add(
        Padding(
          key: ValueKey('liveStep-${e.id}'),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.md,
            vertical: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (e.body.isNotEmpty)
                      Text(
                        e.body,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpace.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    e.createdAt.formattedExact(context),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (gap != null)
                    Text(
                      l10n.liveJourneyAfter(liveGap(context, gap)),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return out;
  }

  Widget _fact(BuildContext context, String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(
          child: SelectableText(value, style: context.textTheme.bodyMedium),
        ),
      ],
    ),
  );
}
