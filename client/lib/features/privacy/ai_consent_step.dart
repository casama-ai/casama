import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/analytics.dart';
import '../../core/providers.dart';
import '../../core/remote_content.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/bottom_padding.dart';
import '../../ui/mascot.dart';
import '../../ui/progressive_fade.dart';
import '../../core/distribution.dart';
import '../billing/billing_screen.dart' show openUrlProvider, platformProvider;
import '../billing/purchase_terms.dart' show casamaPrivacyUrl;

/// Current version of the AI data sharing disclosure (2 adds web pages, D-508).
const kAiConsentVersion = 2;

/// When the person agreed to share what they give bots with outside AI providers (App Store
/// 5.1.2(i), D-421), or null. Read from the account; [AiConsent.set] changes it.
class AiConsent extends Notifier<DateTime?> {
  @override
  DateTime? build() {
    ref.watch(signedInProvider);
    return ref.watch(backendProvider).aiConsentAt;
  }

  Future<void> set(bool allowed) async {
    await ref.read(backendProvider).setAiConsent(allowed);
    // Stopping also takes back the call screen's own yes for voice (it asks again).
    if (!allowed) {
      try {
        (await SharedPreferences.getInstance()).remove('voice.aiConsent.v1');
      } catch (_) {}
    }
    state = allowed ? DateTime.now() : null;
  }
}

final aiConsentProvider = NotifierProvider<AiConsent, DateTime?>(AiConsent.new);

/// Version of the consent text agreed to on this account (0 = none, 1 = pre-web-pages, 2 = current).
final aiConsentVersionProvider = Provider<int>((ref) {
  final at = ref.watch(aiConsentProvider);
  if (at == null) return 0;
  return ref.watch(backendProvider).aiConsentVersion;
});

/// True when the person agreed to an earlier version and needs one tap to accept the web pages update.
final aiConsentNeedsUpdateProvider = Provider<bool>(
  (ref) =>
      ref.watch(aiConsentProvider) != null &&
      ref.watch(aiConsentVersionProvider) < kAiConsentVersion,
);

/// Whether this app asks at all: only iOS and the sandboxed Mac App Store build (App Store
/// 5.1.2(i), D-421). Web, Android, Linux, Windows and the Mac direct download never show the step.
final aiConsentAskedHereProvider = Provider<bool>((ref) {
  if (kIsWeb) return false;
  final platform = ref.watch(platformProvider);
  return platform == TargetPlatform.iOS ||
      (platform == TargetPlatform.macOS && kDistribution == 'appstore');
});

/// Whether the consent step covers the app: an app that asks ([aiConsentAskedHereProvider]),
/// signed in all the way and never agreed, withdrawn, or agreed to an older version. Every other
/// first-run step, and the welcome chat, wait for it.
final aiConsentNeededProvider = Provider<bool>((ref) {
  if (!ref.watch(aiConsentAskedHereProvider)) return false;
  if (!ref.watch(signInFinishedProvider)) return false;
  return ref.watch(aiConsentProvider) == null ||
      ref.watch(aiConsentVersionProvider) < kAiConsentVersion;
});

/// "Your chats go to AI companies": full screen, before the first message can reach a model.
/// It says what is sent and to whom, and nothing goes out until "Agree and Continue". The only
/// other way out is signing out.
class AiConsentStep extends StatelessWidget {
  const AiConsentStep({super.key});

  @override
  Widget build(BuildContext context) => Overlay(
    initialEntries: [OverlayEntry(builder: (_) => const _ConsentPage())],
  );
}

class _ConsentPage extends ConsumerStatefulWidget {
  const _ConsentPage();

  @override
  ConsumerState<_ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends ConsumerState<_ConsentPage> {
  var _busy = false;

  Future<void> _agree() async {
    if (_busy) return;
    setState(() => _busy = true);
    final ok = await runGuarded(context, () async {
      await ref.read(aiConsentProvider.notifier).set(true);
      return true;
    });
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok == true) {
      Analytics.log('onboarding_step_done', {
        'step': 'ai_consent',
        'action': 'agreed',
      });
    }
  }

  Future<void> _signOut() async {
    if (_busy) return;
    setState(() => _busy = true);
    await runGuarded(context, () => ref.read(backendProvider).signOut());
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final statusBar = MediaQuery.paddingOf(context).top;
    Widget section(IconData icon, String title, String body) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: scheme.onSurfaceVariant),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  body,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // What it says: the mascot, the title, optional re-ask notice, and the three answers on one card.
    final isUpdate = ref.watch(aiConsentNeedsUpdateProvider);
    final content = Column(
      children: [
        const MascotImage(Mascot.winky, size: 88),
        const SizedBox(height: AppSpace.lg),
        if (isUpdate) ...[
          Container(
            key: const Key('aiConsentUpdatedNotice'),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.md,
              vertical: AppSpace.xs,
            ),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              l10n.aiConsentUpdatedNotice,
              textAlign: TextAlign.center,
              style: context.textTheme.labelMedium?.copyWith(
                color: scheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppSpace.md),
        ],
        Text(
          l10n.aiConsentTitle,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: AppSpace.sm),
        Text(
          l10n.aiConsentBody,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium?.copyWith(
            color: scheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        const SizedBox(height: AppSpace.xl),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            AppSpace.lg,
            AppSpace.lg,
            AppSpace.lg,
            0,
          ),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHigh,
            borderRadius: AppRadius.cardAll,
          ),
          child: Column(
            children: [
              section(
                LucideIcons.messageSquare,
                l10n.aiConsentWhatTitle,
                l10n.aiConsentWhat,
              ),
              section(
                LucideIcons.building2,
                l10n.aiConsentWhoTitle,
                l10n.aiConsentWho,
              ),
              section(
                LucideIcons.shieldCheck,
                l10n.aiConsentWhyTitle,
                l10n.aiConsentWhy,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpace.sm),
        TextButton(
          key: const Key('aiConsentPrivacy'),
          onPressed: () => ref.read(openUrlProvider)(
            remoteLink('privacy', casamaPrivacyUrl),
          ),
          child: Text(l10n.privacyPolicy),
        ),
      ],
    );
    final actions = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            key: const Key('aiConsentAgree'),
            style: FilledButton.styleFrom(
              backgroundColor: scheme.onSurface,
              foregroundColor: scheme.surface,
              shape: const StadiumBorder(),
              minimumSize: const Size.fromHeight(56),
              textStyle: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: _busy ? null : _agree,
            child: Text(l10n.aiConsentAgree),
          ),
        ),
        const SizedBox(height: AppSpace.xs),
        TextButton(
          key: const Key('aiConsentSignOut'),
          onPressed: _busy ? null : _signOut,
          child: Text(
            l10n.signOut,
            style: TextStyle(color: scheme.onSurfaceVariant),
          ),
        ),
      ],
    );
    final bottom = BottomPadding.of(context, minimum: AppSpace.md);
    return Scaffold(
      key: const Key('aiConsentStep'),
      backgroundColor: scheme.surface,
      body: ProgressiveFade(
        child: SafeArea(
          top: false,
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // A phone keeps the answer pinned at the bottom while the text scrolls. A big
              // window (Mac, iPad) shows it all as one block in the middle, buttons right under
              // the text, instead of a gap the height of the window between them.
              final roomy = constraints.maxWidth >= 600;
              if (roomy) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            AppSpace.xl,
                            statusBar + AppSpace.xl,
                            AppSpace.xl,
                            bottom + AppSpace.lg,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              content,
                              const SizedBox(height: AppSpace.lg),
                              actions,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    children: [
                      // What it says scrolls; the answer stays in reach at the bottom.
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(
                            AppSpace.xl,
                            statusBar + AppSpace.xl,
                            AppSpace.xl,
                            AppSpace.md,
                          ),
                          child: content,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          AppSpace.xl,
                          AppSpace.md,
                          AppSpace.xl,
                          bottom,
                        ),
                        child: actions,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
