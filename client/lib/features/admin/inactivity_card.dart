import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/motion.dart';
import '../../ui/segmented.dart';

/// The inactive-account steps (docs/INACTIVE-ACCOUNTS-PLAN.md): null on an older server.
final adminInactivityProvider = FutureProvider.autoDispose<AdminInactivity?>(
  (ref) => ref
      .watch(backendProvider)
      .adminInactivity()
      .then<AdminInactivity?>((a) => a, onError: (_) => null),
);

String _size(num bytes) {
  if (bytes >= 1 << 30) return '${(bytes / (1 << 30)).toStringAsFixed(1)} GB';
  if (bytes >= 1 << 20) return '${(bytes / (1 << 20)).toStringAsFixed(0)} MB';
  return '${(bytes / 1024).toStringAsFixed(0)} KB';
}

/// Admin → Overview: each step's mode (Off, Report, On), the announcement that has to go out 14
/// days before a step can act, and what the last daily run did or would have done.
class InactivityCard extends ConsumerStatefulWidget {
  const InactivityCard({super.key});

  @override
  ConsumerState<InactivityCard> createState() => _InactivityCardState();
}

class _InactivityCardState extends ConsumerState<InactivityCard> {
  bool _busy = false;

  Future<void> _set(SetInactivityRequest request) async {
    setState(() => _busy = true);
    await runGuarded(
      context,
      () => ref.read(backendProvider).setAdminInactivity(request),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    ref.invalidate(adminInactivityProvider);
  }

  Future<void> _announce() async {
    final l10n = context.l10n;
    final ok = await showConfirm(
      context: context,
      title: l10n.adminInactivityAnnounceQuestion,
      message: l10n.adminInactivityAnnounceConfirm,
      confirmLabel: l10n.adminInactivityAnnounce,
      icon: LucideIcons.mail,
      confirmKey: const Key('confirmAnnounceInactivity'),
    );
    if (!ok || !mounted) return;
    final n = await runGuarded(
      context,
      () => ref.read(backendProvider).announceInactivity(),
    );
    if (!mounted || n == null) return;
    showSuccess(context, l10n.adminInactivityAnnounceDone(n));
    ref.invalidate(adminInactivityProvider);
  }

  // Its data loads after the screen: it slides in rather than pushing what's around it.
  @override
  Widget build(BuildContext context) => ShowHide(child: _card(context));

  Widget? _card(BuildContext context) {
    final a = ref.watch(adminInactivityProvider).value;
    if (a == null) return null;
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(
      color: scheme.onSurfaceVariant,
    );
    final date = DateFormat.yMMMd(l10n.localeName);
    final s = a.settings;
    final announced = s.announcedAt;
    final actsFrom = announced?.add(const Duration(days: 14));
    final waiting = announced == null || actsFrom!.isAfter(DateTime.now());
    final r = a.report;
    Widget step(
      String key,
      String title,
      String help,
      InactivityStepMode mode,
      SetInactivityRequest Function(InactivityStepMode) patch,
    ) => Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(help, style: muted),
          const SizedBox(height: AppSpace.xs),
          AppSegmentedControl<InactivityStepMode>(
            key: Key('inactivity-$key'),
            values: const [
              InactivityStepMode.off,
              InactivityStepMode.report,
              InactivityStepMode.on_,
            ],
            labels: {
              InactivityStepMode.off: l10n.inactivityModeOff,
              InactivityStepMode.report: l10n.inactivityModeReport,
              InactivityStepMode.on_: l10n.inactivityModeOn,
            },
            groupValue: mode,
            onValueChanged: _busy ? null : (v) => _set(patch(v)),
          ),
        ],
      ),
    );
    // The announcement: what has to happen before an On step acts, or when it went out.
    Widget notice(IconData icon, Color color, String text) => Container(
      padding: const EdgeInsets.all(AppSpace.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.16 : 0.1),
        borderRadius: BorderRadius.circular(AppRadius.tile),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(height: 1.35),
            ),
          ),
        ],
      ),
    );
    final divider = Divider(height: 1, color: context.appColors.hairline);
    return Column(
      key: const Key('inactivityCard'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.adminInactivityTitle),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              step(
                'rest',
                l10n.adminInactivityRest,
                l10n.adminInactivityRestHelp,
                s.rest,
                (m) => SetInactivityRequest(rest: m),
              ),
              divider,
              step(
                'files',
                l10n.adminInactivityFiles,
                l10n.adminInactivityFilesHelp,
                s.files,
                (m) => SetInactivityRequest(files: m),
              ),
              divider,
              step(
                'removal',
                l10n.adminInactivityRemoval,
                l10n.adminInactivityRemovalHelp,
                s.removal,
                (m) => SetInactivityRequest(removal: m),
              ),
              divider,
              step(
                'unconfirmed',
                l10n.adminInactivityUnconfirmed,
                l10n.adminInactivityUnconfirmedHelp,
                s.unconfirmed,
                (m) => SetInactivityRequest(unconfirmed: m),
              ),
              const SizedBox(height: AppSpace.sm),
              if (announced == null) ...[
                notice(
                  LucideIcons.megaphone,
                  context.appColors.warning,
                  l10n.adminInactivityNotAnnounced,
                ),
                const SizedBox(height: AppSpace.sm),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: OutlinedButton.icon(
                    key: const Key('announceInactivity'),
                    onPressed: _announce,
                    icon: const Icon(LucideIcons.mail, size: 18),
                    label: Text(l10n.adminInactivityAnnounce),
                  ),
                ),
              ] else
                notice(
                  waiting ? LucideIcons.hourglass : LucideIcons.circleCheck,
                  waiting ? context.appColors.info : context.appColors.positive,
                  [
                    l10n.adminInactivityAnnounced(date.format(announced)),
                    if (waiting)
                      l10n.adminInactivityWaiting(date.format(actsFrom!)),
                  ].join('\n'),
                ),
              if (r != null) ...[
                const Divider(height: AppSpace.lg),
                Text(
                  l10n.adminInactivityLastRun(relativeTime(r.ranAt, context)),
                  style: context.textTheme.titleSmall,
                ),
                Text(
                  l10n.adminInactivityReportLine(
                    r.resting,
                    r.filesRemoved,
                    _size(r.filesBytes),
                    r.filesWarned + r.removalWarned,
                    r.removalsScheduled,
                    r.unconfirmed,
                  ),
                  style: muted,
                ),
                Text(
                  l10n.adminInactivityNow(r.restingNow, r.removalsPending),
                  style: muted,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
