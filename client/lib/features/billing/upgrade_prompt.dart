import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/analytics.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import 'paywall.dart';

/// Opens a calm, contextual sheet when a person taps a paid feature (4th bot, 2nd proactive bot,
/// faster check-ins, 2nd computer, custom domain, outbound mail — docs/CONVERSION-FUNNEL-PLAN.md §6).
/// Never shown unprompted.
Future<void> showUpgradePrompt(
  BuildContext context, {
  required String feature,
  required String title,
  required String description,
  required String planName,
  String? tier,
}) async {
  Analytics.log('upgrade_prompt_shown', {'feature': feature, 'plan': planName});
  final acted = await showAdaptiveSheet<bool>(
    context: context,
    dialogMaxWidth: 440,
    builder: (ctx) {
      final scheme = ctx.colorScheme;
      return Padding(
        padding: const EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.sm, AppSpace.xl, AppSpace.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(LucideIcons.sparkles, size: 22, color: scheme.primary),
                const SizedBox(width: AppSpace.sm),
                Expanded(
                  child: Text(
                    title,
                    style: ctx.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpace.sm),
            Text(
              description,
              style: ctx.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
            const SizedBox(height: AppSpace.xs),
            Text(
              ctx.l10n.upgradePromptIncludedIn(planName),
              style: ctx.textTheme.labelLarge?.copyWith(color: scheme.primary),
            ),
            const SizedBox(height: AppSpace.lg),
            FilledButton.icon(
              key: Key('upgradePromptSeePlans-$feature'),
              onPressed: () {
                Analytics.log('upgrade_prompt_action', {
                  'feature': feature,
                  'action': 'see_plans',
                });
                Navigator.of(ctx).pop(true);
              },
              icon: const Icon(LucideIcons.gem, size: 18),
              label: Text(ctx.l10n.seePlans),
            ),
            const SizedBox(height: AppSpace.xs),
            TextButton(
              key: Key('upgradePromptDismiss-$feature'),
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(ctx.l10n.notNow),
            ),
          ],
        ),
      );
    },
  );
  if (acted == true && context.mounted) {
    await openPaywall(context, reason: title, source: 'feature_$feature', tier: tier);
  } else {
    Analytics.log('upgrade_prompt_action', {'feature': feature, 'action': 'dismiss'});
  }
}

/// Tracks distinct days a person has typed on this device so we can ask "What would you pay for?"
/// once after they've used Casama on 2+ days (docs/CONVERSION-FUNNEL-PLAN.md §6).
class PayFeedbackTracker {
  PayFeedbackTracker._();

  static const _daysKey = 'casama.payFeedback.typedDays';
  static const _askedKey = 'casama.payFeedback.asked';

  static Future<int> recordTypedToday({DateTime? now}) async {
    final prefs = await SharedPreferences.getInstance();
    final today = (now ?? DateTime.now().toUtc()).toIso8601String().substring(0, 10);
    final days = (prefs.getStringList(_daysKey) ?? const <String>[]).toSet()..add(today);
    await prefs.setStringList(_daysKey, days.toList());
    return days.length;
  }

  static Future<bool> shouldAsk() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_askedKey) == true) return false;
    final days = prefs.getStringList(_daysKey) ?? const <String>[];
    return days.length >= 2;
  }

  static Future<void> markAsked() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_askedKey, true);
  }
}

/// One-time in-app question ("What would you pay for?") for people who typed on 2+ days
/// (docs/CONVERSION-FUNNEL-PLAN.md §6). Answers go straight to Admin -> Feedback.
Future<void> showPayFeedbackSheet(BuildContext context, WidgetRef ref) async {
  Analytics.log('pay_feedback_shown');
  await PayFeedbackTracker.markAsked();
  if (!context.mounted) return;
  final controller = TextEditingController();
  final answer = await showAdaptiveSheet<String>(
    context: context,
    dialogMaxWidth: 440,
    builder: (ctx) => Padding(
      padding: const EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.sm, AppSpace.xl, AppSpace.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ctx.l10n.payFeedbackTitle,
            style: ctx.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            ctx.l10n.payFeedbackPrompt,
            style: ctx.textTheme.bodyMedium?.copyWith(
              color: ctx.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: AppSpace.md),
          TextField(
            key: const Key('payFeedbackInput'),
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: ctx.l10n.payFeedbackHint,
            ),
          ),
          const SizedBox(height: AppSpace.md),
          FilledButton(
            key: const Key('payFeedbackSubmit'),
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: Text(ctx.l10n.send),
          ),
          const SizedBox(height: AppSpace.xs),
          TextButton(
            key: const Key('payFeedbackDismiss'),
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(ctx.l10n.notNow),
          ),
        ],
      ),
    ),
  );
  controller.dispose();
  if (answer != null && answer.isNotEmpty) {
    Analytics.log('pay_feedback_submitted', {'action': 'submitted'});
    try {
      await ref.read(backendProvider).sendFeedback(
        FeedbackRequest(
          orgId: ref.read(currentOrgProvider)?.id,
          kind: FeedbackKind.idea,
          // l10n-ok: English category prefix for Admin -> Feedback
          message: '[What would you pay for?] $answer',
        ),
      );
    } catch (_) {}
  } else {
    Analytics.log('pay_feedback_submitted', {'action': 'dismissed'});
  }
}
