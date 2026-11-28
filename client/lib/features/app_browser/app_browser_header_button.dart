import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/haptics.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/shell_header.dart';
import 'app_browser_flag.dart';
import 'app_browser_service.dart';
import 'app_browser_settings.dart' show openAppBrowserByHand;

// The browser button in a chat's header (docs/APP-BROWSER-ALWAYS-PLAN.md §3 C): on every platform,
// while this device's in-app browser is paired and allowed in this workspace. A tap opens the
// browser (the bot's page while one works there, else the person's own browsing); a long press or
// a right click offers "Bots browse here", the same switch as Settings' "Always this device".

/// The mode a device had before "Bots browse here" was switched on, so switching it off puts it
/// back. Kept for this app session only; without it, "ask" (the default).
class _ModeBeforeAlways extends Notifier<String?> {
  @override
  String? build() => null;
  void set(String? mode) => state = mode;
}

final _modeBeforeAlwaysProvider = NotifierProvider<_ModeBeforeAlways, String?>(
  _ModeBeforeAlways.new,
);

/// This device's paired in-app browser in the current workspace, while it may be used.
final appBrowserHereProvider = Provider<({String id, String mode})?>((ref) {
  if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) return null;
  final status = ref.watch(appBrowserStatusProvider).value;
  final d = status?.device;
  if (status == null || !status.available || d == null || !d.enabled) {
    return null;
  }
  return (id: d.id, mode: d.browserMode?.value ?? 'ask');
});

class AppBrowserHeaderButton extends ConsumerWidget {
  const AppBrowserHeaderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final here = ref.watch(appBrowserHereProvider);
    if (here == null) return const SizedBox.shrink();
    final always = here.mode == 'always';
    return HeaderIconButton(
      key: const Key('appBrowserHeaderButton'),
      icon: LucideIcons.globe,
      tooltip: context.l10n.appBrowserOpenTooltip,
      // Tinted while bots browse here, so the choice shows without opening Settings.
      selected: always,
      onPressed: () {
        Haptic.select();
        unawaited(openAppBrowserByHand(context, ref));
      },
      onLongPress: () => _showMenu(context, ref),
    );
  }

  Future<void> _showMenu(BuildContext context, WidgetRef ref) async {
    Haptic.select();
    await showAdaptiveSheet<void>(
      context: context,
      builder: (sheetContext) => const _BrowserMenu(),
    );
  }
}

class _BrowserMenu extends ConsumerStatefulWidget {
  const _BrowserMenu();

  @override
  ConsumerState<_BrowserMenu> createState() => _BrowserMenuState();
}

class _BrowserMenuState extends ConsumerState<_BrowserMenu> {
  var _busy = false;

  Future<void> _setAlways(({String id, String mode}) here, bool on) async {
    final before = ref.read(_modeBeforeAlwaysProvider);
    final mode = on ? 'always' : (before ?? 'ask');
    if (on && here.mode != 'always') {
      ref.read(_modeBeforeAlwaysProvider.notifier).set(here.mode);
    }
    setState(() => _busy = true);
    await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .updateAppBrowser(here.id, browserMode: mode),
    );
    if (!mounted) return;
    ref.invalidate(appBrowserStatusProvider);
    setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final here = ref.watch(appBrowserHereProvider);
    return Padding(
      padding: const EdgeInsets.all(AppSpace.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GroupedCard(
            children: [
              GroupedTile(
                key: const Key('appBrowserMenuOpen'),
                icon: LucideIcons.globe,
                title: l10n.appBrowserOpenTooltip,
                onTap: () {
                  Navigator.of(context).pop();
                  unawaited(openAppBrowserByHand(context, ref));
                },
              ),
              if (here != null)
                GroupedTile(
                  key: const Key('appBrowserMenuAlwaysRow'),
                  icon: LucideIcons.mousePointerClick,
                  title: l10n.appBrowserBotsBrowseHere,
                  subtitle: l10n.appBrowserBotsBrowseHereHelp,
                  onTap: _busy
                      ? null
                      : () => _setAlways(here, here.mode != 'always'),
                  trailing: Switch(
                    key: const Key('appBrowserMenuAlways'),
                    value: here.mode == 'always',
                    onChanged: _busy
                        ? null
                        : hapticOnChanged((v) => _setAlways(here, v)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
