import 'dart:async';
import 'dart:math' as math;

import 'package:casama_sdk/casama_sdk.dart' show HeardFrom;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/ads_attribution.dart';
import '../../core/haptics.dart';
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

/// The choices. Everything but "Other" is shuffled each time the step opens, so no source wins
/// answers just by being first in the list; "Other" always comes last.
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

/// [heardFromChoices] in a fresh random order, "Other" last.
@visibleForTesting
List<HeardFrom> shuffledHeardFromChoices([math.Random? random]) => [
  ...[...heardFromChoices.where((h) => h != HeardFrom.other)]..shuffle(random),
  HeardFrom.other,
];

/// "How did you hear about us?": pick one card, then Continue, or Skip. Either way it's asked
/// only once. Picking doesn't send at once, so a stray tap can still be changed.
class HeardFromStep extends ConsumerStatefulWidget {
  const HeardFromStep({super.key});

  @override
  ConsumerState<HeardFromStep> createState() => _HeardFromStepState();
}

class _HeardFromStepState extends ConsumerState<HeardFromStep> {
  final _order = shuffledHeardFromChoices();
  HeardFrom? _selected;
  var _busy = false;

  /// Hides the step at once; the answer goes in the background, and a failure never brings the
  /// question back in this session.
  void _finish(HeardFrom? answer) {
    if (_busy) return;
    setState(() => _busy = true);
    if (answer != null) Haptic.confirm();
    final backend = ref.read(backendProvider);
    ref.read(_heardFromDoneProvider.notifier).finish();
    ref.read(attributionStatusProvider.notifier).markHeardFromAsked();
    unawaited(backend.postHeardFrom(answer).catchError((Object _) {}));
  }

  void _pick(HeardFrom h) {
    if (_busy || _selected == h) return;
    Haptic.select();
    setState(() => _selected = h);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final statusBar = MediaQuery.paddingOf(context).top;
    final short = MediaQuery.sizeOf(context).height < 700;
    return Scaffold(
      key: const Key('heardFromStep'),
      backgroundColor: scheme.surface,
      body: ProgressiveFade(
        child: SafeArea(
          top: false,
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(
                        AppSpace.xl,
                        statusBar + AppSpace.xl,
                        AppSpace.xl,
                        AppSpace.lg,
                      ),
                      child: Column(
                        children: [
                          // Short screens keep the room for the choices.
                          if (!short) ...[
                            Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                color: scheme.primary.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const MascotImage(Mascot.winky, size: 76),
                            ),
                            const SizedBox(height: AppSpace.lg),
                          ],
                          Semantics(
                            header: true,
                            child: Text(
                              l10n.heardFromTitle,
                              textAlign: TextAlign.center,
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpace.xs),
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
                          _ChoiceGrid(
                            order: _order,
                            selected: _selected,
                            onPick: _busy ? null : _pick,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpace.xl,
                      0,
                      AppSpace.xl,
                      BottomPadding.of(context, minimum: AppSpace.md),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            key: const Key('heardFromContinue'),
                            style: FilledButton.styleFrom(
                              backgroundColor: scheme.onSurface,
                              foregroundColor: scheme.surface,
                              disabledBackgroundColor: scheme.onSurface
                                  .withValues(alpha: 0.10),
                              disabledForegroundColor: scheme.onSurface
                                  .withValues(alpha: 0.38),
                              shape: const StadiumBorder(),
                              minimumSize: const Size.fromHeight(56),
                              textStyle: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            onPressed: _busy || _selected == null
                                ? null
                                : () => _finish(_selected),
                            child: Text(l10n.continueLabel),
                          ),
                        ),
                        const SizedBox(height: AppSpace.xs),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Two cards a row (one on very narrow screens), each row as tall as its longest label.
class _ChoiceGrid extends StatelessWidget {
  const _ChoiceGrid({
    required this.order,
    required this.selected,
    required this.onPick,
  });

  final List<HeardFrom> order;
  final HeardFrom? selected;
  final ValueChanged<HeardFrom>? onPick;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 300 ? 1 : 2;
        final rows = <Widget>[];
        for (var i = 0; i < order.length; i += columns) {
          if (i > 0) rows.add(const SizedBox(height: AppSpace.sm));
          rows.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var c = 0; c < columns; c++) ...[
                    if (c > 0) const SizedBox(width: AppSpace.sm),
                    Expanded(
                      child: i + c < order.length
                          ? _ChoiceCard(
                              choice: order[i + c],
                              selected: selected == order[i + c],
                              onTap: onPick == null
                                  ? null
                                  : () => onPick!(order[i + c]),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
          );
        }
        return Semantics(
          explicitChildNodes: true,
          child: Column(children: rows),
        );
      },
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    required this.choice,
    required this.selected,
    required this.onTap,
  });

  final HeardFrom choice;
  final bool selected;
  final VoidCallback? onTap;

  String _label(BuildContext context) {
    final l10n = context.l10n;
    return switch (choice) {
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
    final scheme = context.colorScheme;
    final duration = AppMotion.of(context, AppMotion.fast);
    final radius = BorderRadius.circular(AppRadius.tile);
    return Semantics(
      key: Key('heardFrom_${choice.value}'),
      container: true,
      button: true,
      selected: selected,
      inMutuallyExclusiveGroup: true,
      child: AnimatedContainer(
        duration: duration,
        curve: AppMotion.curve,
        decoration: BoxDecoration(
          color: selected
              ? scheme.primary.withValues(alpha: 0.10)
              : scheme.surfaceContainerLow,
          borderRadius: radius,
          border: Border.all(
            width: 1.5,
            color: selected ? scheme.primary : context.appColors.hairline,
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 64),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpace.sm,
                  vertical: AppSpace.sm,
                ),
                child: Row(
                  children: [
                    _SourceMark(choice),
                    const SizedBox(width: AppSpace.sm),
                    Expanded(
                      child: Text(
                        _label(context),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w600,
                        ),
                      ),
                    ),
                    AnimatedScale(
                      duration: duration,
                      curve: Curves.easeOutBack,
                      scale: selected ? 1 : 0,
                      child: Icon(
                        LucideIcons.circleCheck,
                        size: 20,
                        color: scheme.primary,
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

/// A brand mark on its brand color (assets/apps, Simple Icons), or an icon for the rest.
class _SourceMark extends StatelessWidget {
  const _SourceMark(this.choice);

  final HeardFrom choice;

  static const _size = 36.0;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final dark = scheme.brightness == Brightness.dark;
    final (String? asset, Color? brand) = switch (choice) {
      HeardFrom.instagram => ('instagram', const Color(0xFFE4405F)),
      HeardFrom.facebook => ('facebook', const Color(0xFF0866FF)),
      HeardFrom.tiktok => ('tiktok', const Color(0xFF000000)),
      HeardFrom.youtube => ('youtube', const Color(0xFFFF0000)),
      _ => (null, null),
    };
    final icon = switch (choice) {
      HeardFrom.friend => LucideIcons.usersRound,
      HeardFrom.search => LucideIcons.search,
      HeardFrom.aiAssistant => LucideIcons.sparkles,
      _ => LucideIcons.ellipsis,
    };
    return ExcludeSemantics(
      child: Container(
        width: _size,
        height: _size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: brand ?? scheme.secondaryContainer,
          borderRadius: BorderRadius.circular(AppRadius.icon),
          // TikTok's black would vanish on a dark page without an edge.
          border: dark && brand == const Color(0xFF000000)
              ? Border.all(color: Colors.white24)
              : null,
        ),
        child: asset != null
            ? SvgPicture.asset(
                'assets/apps/$asset.svg',
                width: _size * 0.5,
                height: _size * 0.5,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              )
            : Icon(icon, size: _size * 0.5, color: scheme.onSecondaryContainer),
      ),
    );
  }
}
