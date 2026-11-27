import 'package:flutter/foundation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/haptics.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';

/// Opens the Haptics Lab sheet (docs/HAPTICS-PLAN.md §7.5). Available only in debug builds and
/// the owner-only admin console.
Future<void> showHapticsLab(BuildContext context) => showAdaptiveSheet<void>(
  context: context,
  heightFactor: 0.92,
  dialogMaxWidth: 680,
  builder: (_) => const HapticsLabSheet(),
);

/// A row in the owner-only admin console (Services → Advanced) that opens the Haptics Lab.
class HapticsLabAdminTile extends StatelessWidget {
  const HapticsLabAdminTile({super.key});

  @override
  Widget build(BuildContext context) => GroupedTile(
    key: const Key('adminHapticsLab'),
    icon: LucideIcons.vibrate,
    title: 'Haptics Lab',
    subtitle: 'Feel and tune every haptic in the vocabulary on this device.',
    onTap: () => showHapticsLab(context),
  );
}

class _HapticEntry {
  const _HapticEntry(this.kind, this.name, this.meaning, {this.signature = false});
  final HapticKind kind;
  final String name;
  final String meaning;
  final bool signature;
}

const _vocabulary = <_HapticEntry>[
  _HapticEntry(HapticKind.tap, 'tap', 'You pressed something that does a thing (send, start, copy).'),
  _HapticEntry(HapticKind.press, 'press', 'A firm command (stop, restart, end the call).'),
  _HapticEntry(HapticKind.select, 'select', 'You moved between choices (tabs, segments, menus, pickers, chips, reactions, chart points).'),
  _HapticEntry(HapticKind.toggleOn, 'toggle(true)', 'A switch or checkbox turned on.'),
  _HapticEntry(HapticKind.toggleOff, 'toggle(false)', 'A switch or checkbox turned off.'),
  _HapticEntry(HapticKind.threshold, 'threshold', 'A gesture crossed the point where letting go acts (long-press menu, pull to refresh, drag to dismiss).'),
  _HapticEntry(HapticKind.thresholdBack, 'thresholdBack', 'You pulled back before letting go.'),
  _HapticEntry(HapticKind.lift, 'lift', 'A drag picked something up.'),
  _HapticEntry(HapticKind.drop, 'drop', 'A drag put something down, or the bot hung up.'),
  _HapticEntry(HapticKind.snap, 'snap', 'A dragged thing settled into place (bubble to edge, pane width stop, slider stop).'),
  _HapticEntry(HapticKind.confirm, 'confirm', 'What you asked for worked.'),
  _HapticEntry(HapticKind.reject, 'reject', "It didn't (wrong code, failed)."),
  _HapticEntry(HapticKind.warn, 'warn', 'Careful, or fix this first.'),
  _HapticEntry(HapticKind.destroy, 'destroy', "You confirmed something you can't undo (delete, remove)."),
  _HapticEntry(HapticKind.attention, 'attention', 'A bot is waiting on you (approval, takeover, a question).', signature: true),
  _HapticEntry(HapticKind.arrive, 'arrive', 'The first words of a reply you waited for.', signature: true),
  _HapticEntry(HapticKind.done, 'done', 'A long task finished while you watched.', signature: true),
  _HapticEntry(HapticKind.celebrate, 'celebrate', 'A rare milestone (first purchase, first bot).', signature: true),
];

/// Haptics Lab (docs/HAPTICS-PLAN.md §7.5): one button per haptic in §4, each with its name and
/// meaning, plus sliders for the four signatures' intensity and timing.
class HapticsLabSheet extends StatefulWidget {
  const HapticsLabSheet({super.key});

  @override
  State<HapticsLabSheet> createState() => _HapticsLabSheetState();
}

class _HapticsLabSheetState extends State<HapticsLabSheet> {
  HapticKind? _lastPlayed;

  void _play(HapticKind kind) {
    setState(() => _lastPlayed = kind);
    Haptic.playKind(kind, bypassThrottle: true);
  }

  void _updateTuning(HapticSignatureTuning next) {
    setState(() => Haptic.tuning = next);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final text = context.textTheme;
    final t = Haptic.tuning;
    final signatures = _vocabulary.where((e) => e.signature).toList();
    final standard = _vocabulary.where((e) => !e.signature).toList();

    Widget entryTile(_HapticEntry e) {
      final active = _lastPlayed == e.kind;
      return GroupedTile(
        key: Key('hapticLab-${e.kind.wireName}'),
        icon: e.signature ? LucideIcons.sparkles : LucideIcons.vibrate,
        iconColor: active ? scheme.primary : scheme.onSurfaceVariant,
        title: e.name,
        subtitle: e.meaning,
        trailing: FilledButton.tonal(
          key: Key('hapticLabPlay-${e.kind.wireName}'),
          onPressed: () => _play(e.kind),
          child: const Text('Play'),
        ),
        onTap: () => _play(e.kind),
      );
    }

    Widget sliderRow({
      required Key key,
      required String label,
      required String valueText,
      required double value,
      required double min,
      required double max,
      required ValueChanged<double> onChanged,
    }) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
              Text(
                valueText,
                style: text.labelMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          Slider(
            key: key,
            value: value.clamp(min, max),
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Haptics Lab'),
        actions: [
          TextButton.icon(
            key: const Key('hapticLabReset'),
            onPressed: () {
              Haptic.resetTuning();
              setState(() {});
              _play(HapticKind.confirm);
            },
            icon: const Icon(LucideIcons.rotateCcw, size: 16),
            label: const Text('Reset'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpace.md, 0, AppSpace.md, AppSpace.xl),
        children: [
          if (!Haptic.enabled)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.sm),
              child: AppCard(
                padding: const EdgeInsets.all(AppSpace.sm),
                child: Row(
                  children: [
                    Icon(LucideIcons.triangleAlert, color: scheme.error, size: 18),
                    const SizedBox(width: AppSpace.sm),
                    const Expanded(
                      child: Text('Haptics are turned off in Appearance. Lab buttons still play so you can test.'),
                    ),
                  ],
                ),
              ),
            ),
          const SectionHeader(title: 'Casama Signatures (4)'),
          GroupedCard(children: [for (final e in signatures) entryTile(e)]),
          const SectionHeader(title: 'Signature Tuning'),
          GroupedCard(
            children: [
              sliderRow(
                key: const Key('tune-attentionIntensity'),
                label: 'attention · intensity',
                valueText: t.attentionIntensity.toStringAsFixed(2),
                value: t.attentionIntensity,
                min: 0.2,
                max: 1.0,
                onChanged: (v) => _updateTuning(t.copyWith(attentionIntensity: v)),
              ),
              sliderRow(
                key: const Key('tune-attentionGapMs'),
                label: 'attention · gap',
                valueText: '${t.attentionGapMs} ms',
                value: t.attentionGapMs.toDouble(),
                min: 40,
                max: 220,
                onChanged: (v) => _updateTuning(t.copyWith(attentionGapMs: v.round())),
              ),
              sliderRow(
                key: const Key('tune-arriveIntensity'),
                label: 'arrive · intensity',
                valueText: t.arriveIntensity.toStringAsFixed(2),
                value: t.arriveIntensity,
                min: 0.2,
                max: 1.0,
                onChanged: (v) => _updateTuning(t.copyWith(arriveIntensity: v)),
              ),
              sliderRow(
                key: const Key('tune-arriveSharpness'),
                label: 'arrive · sharpness',
                valueText: t.arriveSharpness.toStringAsFixed(2),
                value: t.arriveSharpness,
                min: 0.0,
                max: 1.0,
                onChanged: (v) => _updateTuning(t.copyWith(arriveSharpness: v)),
              ),
              sliderRow(
                key: const Key('tune-doneFirstIntensity'),
                label: 'done · first tap',
                valueText: t.doneFirstIntensity.toStringAsFixed(2),
                value: t.doneFirstIntensity,
                min: 0.2,
                max: 1.0,
                onChanged: (v) => _updateTuning(t.copyWith(doneFirstIntensity: v)),
              ),
              sliderRow(
                key: const Key('tune-doneSecondIntensity'),
                label: 'done · second tap',
                valueText: t.doneSecondIntensity.toStringAsFixed(2),
                value: t.doneSecondIntensity,
                min: 0.2,
                max: 1.0,
                onChanged: (v) => _updateTuning(t.copyWith(doneSecondIntensity: v)),
              ),
              sliderRow(
                key: const Key('tune-doneGapMs'),
                label: 'done · gap',
                valueText: '${t.doneGapMs} ms',
                value: t.doneGapMs.toDouble(),
                min: 30,
                max: 180,
                onChanged: (v) => _updateTuning(t.copyWith(doneGapMs: v.round())),
              ),
              sliderRow(
                key: const Key('tune-celebrateIntensity'),
                label: 'celebrate · intensity',
                valueText: t.celebrateIntensity.toStringAsFixed(2),
                value: t.celebrateIntensity,
                min: 0.2,
                max: 1.0,
                onChanged: (v) => _updateTuning(t.copyWith(celebrateIntensity: v)),
              ),
              sliderRow(
                key: const Key('tune-celebrateGapMs'),
                label: 'celebrate · gap',
                valueText: '${t.celebrateGapMs} ms',
                value: t.celebrateGapMs.toDouble(),
                min: 20,
                max: 150,
                onChanged: (v) => _updateTuning(t.copyWith(celebrateGapMs: v.round())),
              ),
            ],
          ),
          const SectionHeader(title: 'Platform Feedback (14)'),
          GroupedCard(children: [for (final e in standard) entryTile(e)]),
          if (kDebugMode)
            Padding(
              padding: const EdgeInsets.only(top: AppSpace.md),
              child: Text(
                'Platform: ${defaultTargetPlatform.name}',
                textAlign: TextAlign.center,
                style: text.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ),
        ],
      ),
    );
  }
}
