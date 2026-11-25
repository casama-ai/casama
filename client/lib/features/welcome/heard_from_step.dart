import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart' show HeardFrom;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads_attribution.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/bottom_padding.dart';
import '../../ui/mascot.dart';
import '../../ui/progressive_fade.dart';
import '../settings/name_step.dart';

/// A new account's first run started in this session (the welcome flow made its space). Only
/// then is "How did you hear about us?" asked: never for people who joined long ago.
class HeardFromFirstRun extends Notifier<bool> {
  @override
  bool build() {
    ref.watch(signedInProvider);
    return false;
  }

  void mark() => state = true;
}

final heardFromFirstRunProvider = NotifierProvider<HeardFromFirstRun, bool>(
  HeardFromFirstRun.new,
);

/// Answered or skipped in this session, so the step hides at once.
class _HeardFromDone extends Notifier<bool> {
  @override
  bool build() {
    ref.watch(signedInProvider);
    return false;
  }

  void finish() => state = true;
}

final _heardFromDoneProvider = NotifierProvider<_HeardFromDone, bool>(
  _HeardFromDone.new,
);

/// Whether "How did you hear about us?" shows (docs/ADS-ATTRIBUTION-PLAN.md §6.3, Decision 9):
/// once, on a new account's first run, after the name step, on Casama Cloud, while the server
/// says it was never asked. Hidden whenever the server can't say.
final heardFromNeededProvider = Provider.autoDispose<bool>((ref) {
  if (!ref.watch(signInFinishedProvider)) return false;
  if (!ref.watch(heardFromFirstRunProvider)) return false;
  if (ref.watch(nameStepNeededProvider) != false) return false;
  if (ref.watch(_heardFromDoneProvider)) return false;
  final status = ref.watch(attributionStatusProvider).value;
  return status != null && !status.heardFromAsked;
});

/// The choices, in the order they show.
const heardFromChoices = [
  HeardFrom.instagram,
  HeardFrom.facebook,
  HeardFrom.tiktok,
  HeardFrom.youtube,
  HeardFrom.friend,
  HeardFrom.search,
  HeardFrom.aiAssistant,
  HeardFrom.other,
];

/// "How did you hear about us?": one optional tap, or Skip. Either way it's asked only once.
class HeardFromStep extends ConsumerStatefulWidget {
  const HeardFromStep({super.key});

  @override
  ConsumerState<HeardFromStep> createState() => _HeardFromStepState();
}

class _HeardFromStepState extends ConsumerState<HeardFromStep> {
  var _busy = false;

  /// Hides the step at once; the answer goes in the background, and a failure never brings the
  /// question back in this session.
  void _finish(HeardFrom? answer) {
    if (_busy) return;
    setState(() => _busy = true);
    final backend = ref.read(backendProvider);
    ref.read(_heardFromDoneProvider.notifier).finish();
    ref.read(attributionStatusProvider.notifier).markHeardFromAsked();
    unawaited(backend.postHeardFrom(answer).catchError((Object _) {}));
  }

  String _label(BuildContext context, HeardFrom h) {
    final l10n = context.l10n;
    return switch (h) {
      HeardFrom.instagram => l10n.heardFromInstagram,
      HeardFrom.facebook => l10n.heardFromFacebook,
      HeardFrom.tiktok => l10n.heardFromTiktok,
      HeardFrom.youtube => l10n.heardFromYoutube,
      HeardFrom.friend => l10n.heardFromFriend,
      HeardFrom.search => l10n.heardFromSearch,
      HeardFrom.aiAssistant => l10n.heardFromAiAssistant,
      HeardFrom.other => l10n.heardFromOther,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final statusBar = MediaQuery.paddingOf(context).top;
    return Scaffold(
      key: const Key('heardFromStep'),
      backgroundColor: scheme.surface,
      body: ProgressiveFade(
        child: SafeArea(
          top: false,
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.xl,
                  statusBar + AppSpace.xl,
                  AppSpace.xl,
                  BottomPadding.of(context, minimum: AppSpace.md),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        color: scheme.primary.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const MascotImage(Mascot.winky, size: 88),
                    ),
                    const SizedBox(height: AppSpace.xl),
                    Text(
                      l10n.heardFromTitle,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: AppSpace.sm),
                    Text(
                      l10n.heardFromHelp,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: AppSpace.xl),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: AppSpace.sm,
                      runSpacing: AppSpace.sm,
                      children: [
                        for (final h in heardFromChoices)
                          ActionChip(
                            key: Key('heardFrom_${h.value}'),
                            label: Text(_label(context, h)),
                            onPressed: _busy ? null : () => _finish(h),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppSpace.xl),
                    TextButton(
                      key: const Key('heardFromSkip'),
                      onPressed: _busy ? null : () => _finish(null),
                      child: Text(
                        l10n.heardFromSkip,
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
