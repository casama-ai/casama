import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/analytics.dart';
import '../../../core/billing.dart';
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../billing/out_of_credits.dart';
import '../../billing/paywall.dart';
import '../chat_controller.dart';

/// Error codes that should render as a calm, plain limit card instead of a raw failure notice
/// (docs/CONVERSION-FUNNEL-PLAN.md §5).
const limitCardCodes = {
  'max_steps',
  'max_steps_exceeded',
  'budget_exceeded',
  'cloud_daily_cap',
  'out_of_credits',
  'computer_hours_exceeded',
  'quota_exceeded',
  'plan_limit',
};

final _shownLimitCards = <String>{};

/// A clear, calm explanation card when a run stops on a plan or usage limit: what happened, when
/// the limit resets in the person's own time zone, "Keep going" where it works, and "See plans".
class LimitCard extends ConsumerWidget {
  const LimitCard({
    super.key,
    required this.entry,
    required this.canKeepGoing,
    this.onKeepGoing,
    this.canRetry = false,
    this.onRetry,
  });

  final NoticeEntry entry;
  final bool canKeepGoing;
  final VoidCallback? onKeepGoing;
  final bool canRetry;
  final VoidCallback? onRetry;

  String _title(String code) => switch (code) {
    'max_steps' || 'max_steps_exceeded' => 'Paused at this run\'s step limit',
    'cloud_daily_cap' => 'Reached today\'s free limit',
    'out_of_credits' || 'budget_exceeded' => 'Out of credits for now',
    'computer_hours_exceeded' => 'Reached this month\'s computer hours',
    _ => 'Reached your plan limit',
  };

  String? _resetLine(BuildContext context, String code, DateTime? dailyResetsAt) {
    if (dailyResetsAt != null &&
        (code == 'cloud_daily_cap' || code == 'budget_exceeded')) {
      final local = DateFormat.jm(context.l10n.localeName).format(dailyResetsAt.toLocal());
      return 'Resets at $local in your time zone. Your progress is saved so you can pick right back up.';
    }
    if (code == 'max_steps' || code == 'max_steps_exceeded') {
      return 'Your progress is saved. Tap Keep going to continue from where it stopped, or upgrade for longer runs.';
    }
    if (code == 'out_of_credits') {
      return 'Add credits or switch plans to keep going right away.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = entry.errorCode ?? 'plan_limit';
    final runKey = '${entry.refId ?? entry.text}|$code';
    if (_shownLimitCards.add(runKey)) {
      Analytics.log('limit_card_shown', {'code': code, 'surface': 'chat'});
    }
    final scheme = context.colorScheme;
    final billing = ref.watch(billingProvider).value;
    final reset = _resetLine(context, code, billing?.daily?.resetsAt);
    final showKeepGoing = canKeepGoing && onKeepGoing != null;
    final showRetry = canRetry && onRetry != null;

    void seePlans() {
      Analytics.log('limit_card_action', {'code': code, 'action': 'see_plans'});
      if (code == 'out_of_credits') {
        openOutOfCredits(context);
      } else {
        openPaywall(context, reason: entry.text, source: 'limit');
      }
    }

    return Container(
      key: Key('limitCard-$code'),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: AppSpace.xs),
      padding: const EdgeInsets.all(AppSpace.md),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: AppRadius.cardAll,
        border: Border.all(color: context.appColors.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.gauge, size: 18, color: scheme.primary),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: Text(
                  _title(code),
                  style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            entry.text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          if (reset != null) ...[
            const SizedBox(height: 4),
            Text(
              reset,
              style: context.textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.xs,
            runSpacing: AppSpace.xs,
            children: [
              if (showKeepGoing)
                FilledButton.icon(
                  key: const Key('noticeKeepGoing'),
                  onPressed: () {
                    Analytics.log('limit_card_action', {'code': code, 'action': 'keep_going'});
                    onKeepGoing?.call();
                  },
                  icon: const Icon(LucideIcons.play, size: 16),
                  label: Text(context.l10n.keepGoing),
                ),
              if (showKeepGoing)
                OutlinedButton.icon(
                  key: const Key('noticeFix'),
                  onPressed: seePlans,
                  icon: const Icon(LucideIcons.sparkles, size: 16),
                  label: Text(context.l10n.seePlans),
                )
              else
                FilledButton.tonalIcon(
                  key: const Key('noticeFix'),
                  onPressed: seePlans,
                  icon: const Icon(LucideIcons.sparkles, size: 16),
                  label: Text(context.l10n.seePlans),
                ),
              if (showRetry)
                TextButton.icon(
                  key: const Key('noticeRetry'),
                  onPressed: onRetry,
                  icon: const Icon(LucideIcons.rotateCw, size: 16),
                  label: Text(showKeepGoing ? context.l10n.startOver : context.l10n.retry),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
