import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_language.dart';
import '../../core/haptics.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';

/// Settings → Language. A pick changes the app at once, is kept on this device and is saved to
/// the profile for the server and bots; "Device language" saves null. Nothing else writes the
/// profile's language: a saved one would override the device's.
Future<void> chooseLanguage(BuildContext context, WidgetRef ref) async {
  final tag = await showAdaptiveSheet<String>(context: context, builder: (_) => const LanguageSheet());
  if (tag == null || !context.mounted) return;
  final locale = tag.isEmpty ? null : AppLanguage.parseTag(tag);
  final app = ref.read(appLocaleProvider.notifier);
  final backend = ref.read(backendProvider);
  await runGuarded(context, () async {
    await app.set(locale);
    await backend.setProfileLocale(locale?.toLanguageTag());
  });
}

/// The device's language, or one of the shipped ones, each written in its own language
/// (docs/LOCALIZATION-PLAN.md §4.1). Closes with the picked tag, empty for the device's.
class LanguageSheet extends ConsumerWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosen = ref.watch(appLocaleProvider);
    final supported = ref.watch(supportedAppLocalesProvider);
    // The device is the empty value: a RadioGroup's null means nothing is picked.
    final value = chosen?.toLanguageTag() ?? '';
    void pick(String tag) {
      Haptic.select();
      Navigator.of(context).pop(tag);
    }

    // Tapping the picked one picks it again, which saves it again after a save that failed.
    Widget row(String tag, String name) => RadioListTile<String>(key: Key('language-$tag'), value: tag, toggleable: true, title: Text(name));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg, vertical: AppSpace.sm),
            child: Text(context.l10n.language, style: context.textTheme.titleLarge),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: RadioGroup<String>(
                groupValue: value,
                onChanged: (v) => pick(v ?? value),
                child: Column(
                  children: [
                    row('', context.l10n.languageDevice),
                    for (final l in supported) row(l.toLanguageTag(), AppLanguage.nameOf(l)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
