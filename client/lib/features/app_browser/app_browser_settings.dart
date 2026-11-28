import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/haptics.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../../ui/page.dart';
import 'app_browser_ask.dart';
import 'app_browser_background.dart';
import 'app_browser_channel.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';
import 'app_browser_linux.dart';
import 'app_browser_screen.dart';
import 'app_browser_service.dart';

/// Why the in-app browser isn't available, in plain words (`GET /v1/app-browser`'s `reason`).
String appBrowserReasonText(
  AppLocalizations l10n,
  String? reason, {
  String? linuxInstallCmd,
}) => switch (reason) {
  'not_a_tester' => l10n.appBrowserReasonNotTester,
  'system_off' => l10n.appBrowserReasonSystemOff,
  'workspace_off' => l10n.appBrowserReasonWorkspaceOff,
  'unavailable' => l10n.appBrowserReasonUnavailable,
  'needs_macos_14' => l10n.appBrowserReasonNeedsMacos14,
  'needs_webview2' => l10n.appBrowserReasonNeedsWebview2,
  'needs_webkitgtk' => l10n.appBrowserReasonNeedsWebkitgtk(
    linuxInstallCmd ?? currentLinuxWebKitInstallCommand(),
  ),
  'unsupported' => l10n.appBrowserReasonUnsupported,
  _ => l10n.appBrowserReasonOff,
};

String _titleForDevice(AppLocalizations l10n) => appBrowserTitleFor(l10n);

/// Microsoft's page for the WebView2 runtime that the Windows browser needs
/// (docs/WINDOWS-BROWSER-PLAN.md §2).
const webView2DownloadUrl = 'https://developer.microsoft.com/microsoft-edge/webview2/';

const _kinds = ['banking', 'health', 'passwords', 'government'];

final _supportProvider = FutureProvider.autoDispose<AppBrowserSupport>(
  (ref) => ref.read(appBrowserProvider.notifier).support(),
);
final _hasTokenProvider = FutureProvider.autoDispose.family<bool, String>(
  (ref, id) async =>
      await ref.read(appBrowserTokenStoreProvider).read(id) != null,
);

/// The row in Settings → Device connections (plan §1.3, §4): only in a build with the in-app
/// browser, on a phone or Mac, and when the server offers it or this device already has a row.
class AppBrowserDeviceTile extends ConsumerWidget {
  const AppBrowserDeviceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) {
      return const SizedBox.shrink();
    }
    final st = ref.watch(appBrowserStatusProvider).value;
    if (st == null || (!st.available && st.device == null)) {
      return const SizedBox.shrink();
    }
    final l10n = context.l10n;
    final d = st.device;
    final support = ref.watch(_supportProvider).value;
    final needsWebkit = support != null &&
        !support.supported &&
        (support.reason == 'needs_webkitgtk' || support.reason == 'needs_webview2');
    final subtitle = needsWebkit
        ? appBrowserReasonText(l10n, support.reason)
        : !st.available
        ? l10n.appBrowserSwitchedOff(appBrowserReasonText(l10n, st.reason))
        : d != null && d.enabled
        ? l10n.appBrowserOn
        : l10n.appBrowserOff;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.md),
      child: GroupedCard(
        children: [
          GroupedTile(
            key: const Key('appBrowserDeviceTile'),
            icon: LucideIcons.globe,
            title: _titleForDevice(l10n),
            subtitle: subtitle,
            onTap: () => context.push('/settings/phone-browser'),
          ),
        ],
      ),
    );
  }
}

/// Whether the person can open the browser by hand here: built in, on this kind of device, and
/// switched on and paired for this phone or computer.
final appBrowserReadyProvider = Provider<bool>((ref) {
  if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) return false;
  final st = ref.watch(appBrowserStatusProvider).value;
  final d = st?.device;
  return st != null && st.available && d != null && d.enabled;
});

/// The chat's menu: the page a bot is using, or else the person's own browsing (the page the bot
/// left, or a blank one with an address field).
Future<void> openAppBrowserByHand(BuildContext context, WidgetRef ref) =>
    openAppBrowser(context, person: !ref.read(appBrowserProvider).botActive);

/// Opens the full browser: a bot's page, or with [person] the person's own browsing.
Future<void> openAppBrowser(BuildContext context, {bool person = false}) =>
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => AppBrowserScreen(person: person),
      ),
    );

/// Settings → Device connections → Browser on This Phone / Mac (plan §1.3, §1.4, §3, §4).
class AppBrowserSettingsScreen extends ConsumerStatefulWidget {
  const AppBrowserSettingsScreen({super.key});

  @override
  ConsumerState<AppBrowserSettingsScreen> createState() =>
      _AppBrowserSettingsScreenState();
}

class _AppBrowserSettingsScreenState
    extends ConsumerState<AppBrowserSettingsScreen> {
  var _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    setState(() => _busy = true);
    await runGuarded(context, action);
    if (!mounted) return;
    ref.invalidate(appBrowserStatusProvider);
    setState(() => _busy = false);
  }

  Future<void> _turn(
    AppBrowserState st,
    bool on, {
    required bool hasToken,
  }) async {
    Haptic.toggle(on);
    final l10n = context.l10n;
    final service = ref.read(appBrowserServiceProvider);
    final d = st.device;
    if (!on) {
      if (d != null) {
        await _run(
          () =>
              ref.read(backendProvider).updateAppBrowser(d.id, enabled: false),
        );
      }
      return;
    }
    final name = switch (appBrowserSystem) {
      'ios' => l10n.appBrowserDeviceIos,
      'macos' => l10n.appBrowserDeviceMac,
      'linux' => l10n.appBrowserDeviceLinux,
      'windows' => l10n.appBrowserDeviceWindows,
      _ => l10n.appBrowserDeviceAndroid,
    };
    await _run(() async {
      if (d == null) {
        await service.pair(name: name);
      } else if (!hasToken) {
        // Paired on an earlier install: this one has no token, so pair again.
        await service.unpair(d.id, manual: false);
        await service.pair(name: name);
      } else {
        await ref.read(backendProvider).updateAppBrowser(d.id, enabled: true);
      }
    });
  }

  Future<void> _update(
    LocalDevice d, {
    List<String>? bots,
    bool? allBots,
    String? browserMode,
    List<String>? allowed,
    List<String>? blocked,
    List<String>? neverAsk,
    List<String>? kinds,
  }) => _run(
    () => ref
        .read(backendProvider)
        .updateAppBrowser(
          d.id,
          botIds: bots,
          allBots: allBots,
          browserMode: browserMode,
          allowedSites: allowed,
          blockedSites: blocked,
          neverAskSites: neverAsk,
          allowedKinds: kinds,
        ),
  );

  Future<void> _clearData() async {
    final l10n = context.l10n;
    final ok = await showConfirm(
      context: context,
      title: l10n.appBrowserClearDataConfirm,
      confirmLabel: l10n.appBrowserClearData,
      confirmKey: const Key('appBrowserClearDataConfirm'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () async {
      await ref.read(appBrowserProvider.notifier).clearData();
      return true;
    });
    if (done == true && mounted) {
      showSuccess(context, l10n.appBrowserClearDataDone);
    }
  }

  Future<void> _unpair(LocalDevice d) async {
    final l10n = context.l10n;
    final ok = await showConfirm(
      context: context,
      title: l10n.appBrowserUnpair,
      message: l10n.appBrowserUnpairConfirm,
      confirmLabel: l10n.appBrowserUnpair,
      confirmKey: const Key('appBrowserUnpairConfirm'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    await _run(() => ref.read(appBrowserServiceProvider).unpair(d.id));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final system = appBrowserSystem;
    final isMac = system == 'macos';
    final isLinux = system == 'linux';
    final isWindows = system == 'windows';
    final title = _titleForDevice(l10n);
    if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) {
      return SubPage(title: title, children: const []);
    }
    return SubPage(
      title: title,
      body: AsyncView<AppBrowserState?>(
        value: ref.watch(appBrowserStatusProvider),
        onRetry: () => ref.invalidate(appBrowserStatusProvider),
        data: (st) {
          if (st == null) return const SizedBox.shrink();
          final d = st.device;
          final support = ref.watch(_supportProvider).value;
          final hasToken = d == null
              ? false
              : ref.watch(_hasTokenProvider(d.id)).value ?? true;
          final unsupported = support != null && !support.supported;
          final on =
              d != null &&
              d.enabled &&
              st.available &&
              hasToken &&
              !unsupported;
          final canSwitch = !_busy && (on || (st.available && !unsupported));
          final subtitle = unsupported
              ? (support.reason == 'needs_webkitgtk' ||
                        support.reason == 'needs_webview2')
                    ? appBrowserReasonText(l10n, support.reason)
                    : l10n.appBrowserSwitchedOff(
                        appBrowserReasonText(
                          l10n,
                          support.reason ?? 'unsupported',
                        ),
                      )
              : !st.available
              ? l10n.appBrowserSwitchedOff(
                  appBrowserReasonText(l10n, st.reason),
                )
              : d != null && !hasToken
              ? l10n.appBrowserReasonNoToken
              : isMac
              ? l10n.appBrowserSwitchHelpMac
              : isLinux
              ? l10n.appBrowserSwitchHelpLinux
              : isWindows
              ? l10n.appBrowserSwitchHelpWindows
              : l10n.appBrowserSwitchHelp;
          return PageColumn(
            children: [
              FormNote(
                isMac
                    ? l10n.appBrowserHelpMac
                    : isLinux
                    ? l10n.appBrowserHelpLinux
                    : isWindows
                    ? l10n.appBrowserHelpWindows
                    : l10n.appBrowserHelp,
                icon: LucideIcons.shieldCheck,
              ),
              const SizedBox(height: AppSpace.md),
              GroupedCard(
                children: [
                  GroupedTile(
                    icon: LucideIcons.globe,
                    title: title,
                    subtitle: subtitle,
                    onTap: canSwitch
                        ? () => _turn(st, !on, hasToken: hasToken)
                        : null,
                    trailing: Switch(
                      key: const Key('appBrowserSwitch'),
                      value: on,
                      onChanged: canSwitch
                          ? (v) => _turn(st, v, hasToken: hasToken)
                          : null,
                    ),
                  ),
                  if (system == 'android' && on && kAppBrowserBg)
                    GroupedTile(
                      icon: LucideIcons.play,
                      title: context.l10n.appBrowserKeepGoing,
                      subtitle: context.l10n.appBrowserKeepGoingHelp,
                      onTap: () {
                        final next = !ref.read(appBrowserKeepGoingProvider);
                        Haptic.toggle(next);
                        ref.read(appBrowserKeepGoingProvider.notifier).set(next);
                      },
                      trailing: Switch(
                        key: const Key('appBrowserKeepGoingSwitch'),
                        value: ref.watch(appBrowserKeepGoingProvider),
                        onChanged: (v) {
                          Haptic.toggle(v);
                          ref.read(appBrowserKeepGoingProvider.notifier).set(v);
                        },
                      ),
                    ),
                ],
              ),
              // Windows without the WebView2 runtime (or an old one): Microsoft's download page.
              if (unsupported && support.reason == 'needs_webview2')
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    key: const Key('appBrowserGetWebview2'),
                    icon: const Icon(LucideIcons.externalLink, size: 16),
                    label: Text(l10n.appBrowserGetWebview2),
                    onPressed: () => launchUrl(
                      Uri.parse(webView2DownloadUrl),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                ),
              if (d != null) ..._deviceSections(context, d, on),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _deviceSections(BuildContext context, LocalDevice d, bool on) {
    final l10n = context.l10n;
    final bots = ref.watch(botsProvider).value ?? const <Bot>[];
    final allBots = d.allBots ?? true;
    final mode = d.browserMode?.value ?? 'ask';
    final allowed = d.allowedSites ?? const <String>[];
    final blocked = d.blockedSites ?? const <String>[];
    final neverAsk = d.neverAskSites ?? const <String>[];
    final kinds = [
      for (final k in d.allowedKinds ?? const <SiteKind>[]) k.value,
    ];
    Widget siteRow(String site, String kind) {
      final (icon, color, label) = switch (kind) {
        'always' => (
          LucideIcons.circleCheck,
          context.appColors.positive,
          l10n.appBrowserAlways,
        ),
        'never_ask' => (
          LucideIcons.monitor,
          context.colorScheme.onSurfaceVariant,
          l10n.appBrowserNeverAsk,
        ),
        _ => (
          LucideIcons.ban,
          context.appColors.negative,
          l10n.appBrowserNever,
        ),
      };
      return GroupedTile(
        key: Key('appBrowserSite-$site'),
        icon: icon,
        iconColor: color,
        title: site,
        subtitle: label,
        trailing: IconButton(
          key: Key('appBrowserRemoveSite-$site'),
          tooltip: l10n.appBrowserRemoveSite(site),
          icon: const Icon(LucideIcons.x, size: 18),
          onPressed: _busy
              ? null
              : () => switch (kind) {
                  'always' => _update(d, allowed: [...allowed]..remove(site)),
                  'never_ask' => _update(
                    d,
                    neverAsk: [...neverAsk]..remove(site),
                  ),
                  _ => _update(d, blocked: [...blocked]..remove(site)),
                },
        ),
      );
    }

    return [
      const SizedBox(height: AppSpace.md),
      SectionHeader(title: l10n.appBrowserModeHeader),
      GroupedCard(
        children: [
          for (final (value, title, subtitle) in [
            // Every page here while the chat is open (APP-BROWSER-ALWAYS-PLAN §3 B).
            (
              'always',
              l10n.appBrowserModeAlways,
              l10n.appBrowserModeAlwaysHelp,
            ),
            ('ask', l10n.appBrowserModeAsk, l10n.appBrowserModeAskHelp),
            (
              'computer',
              l10n.appBrowserModeComputer,
              l10n.appBrowserModeComputerHelp,
            ),
            (
              'device',
              l10n.appBrowserModeDevice,
              l10n.appBrowserModeDeviceHelp,
            ),
          ])
            GroupedTile(
              key: Key('appBrowserMode-$value'),
              icon: value == 'always'
                  ? LucideIcons.globe
                  : value == 'ask'
                  ? LucideIcons.circleHelp
                  : value == 'computer'
                  ? LucideIcons.monitor
                  : LucideIcons.smartphone,
              title: title,
              subtitle: subtitle,
              onTap: _busy || mode == value
                  ? null
                  : () {
                      Haptic.select();
                      _update(d, browserMode: value);
                    },
              trailing: Icon(
                mode == value ? LucideIcons.circleCheck : LucideIcons.circle,
                size: 20,
                color: mode == value
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.4,
                      ),
              ),
            ),
        ],
      ),
      const SizedBox(height: AppSpace.md),
      SectionHeader(title: l10n.appBrowserBots),
      GroupedCard(
        children: [
          GroupedTile(
            key: const Key('appBrowserAllBotsRow'),
            icon: LucideIcons.users,
            title: l10n.appBrowserAllBots,
            subtitle: l10n.appBrowserAllBotsHelp,
            onTap: _busy
                ? null
                : () {
                    Haptic.toggle(!allBots);
                    _update(d, allBots: !allBots);
                  },
            trailing: Switch(
              key: const Key('appBrowserAllBots'),
              value: allBots,
              onChanged: _busy
                  ? null
                  : hapticOnChanged((v) => _update(d, allBots: v)),
            ),
          ),
          if (!allBots) ...[
            if (bots.isEmpty)
              Padding(
                padding: const EdgeInsets.all(AppSpace.md),
                child: Text(l10n.appBrowserNoBots),
              )
            else
              for (final b in bots)
                GroupedTile(
                  key: Key('appBrowserBotRow-${b.id}'),
                  icon: LucideIcons.bot,
                  title: b.name,
                  // The whole row switches it, not only the small switch.
                  onTap: _busy
                      ? null
                      : () => _update(
                          d,
                          bots: d.allowedBotIds.contains(b.id)
                              ? [...d.allowedBotIds.where((id) => id != b.id)]
                              : [...d.allowedBotIds, b.id],
                        ),
                  trailing: Switch(
                    key: Key('appBrowserBot-${b.id}'),
                    value: d.allowedBotIds.contains(b.id),
                    onChanged: _busy
                        ? null
                        : hapticOnChanged(
                            (v) => _update(
                              d,
                              bots: v
                                  ? [...d.allowedBotIds, b.id]
                                  : [
                                      ...d.allowedBotIds.where(
                                        (id) => id != b.id,
                                      ),
                                    ],
                            ),
                          ),
                  ),
                ),
          ],
        ],
      ),
      if (!allBots)
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.xxs,
            AppSpace.xs,
            AppSpace.xxs,
            0,
          ),
          child: FormNote(l10n.appBrowserBotsHelp),
        ),
      const SizedBox(height: AppSpace.md),
      SectionHeader(title: l10n.appBrowserSites),
      if (allowed.isEmpty && blocked.isEmpty && neverAsk.isEmpty)
        FormNote(l10n.appBrowserNoSites)
      else ...[
        GroupedCard(
          children: [
            for (final s in allowed) siteRow(s, 'always'),
            for (final s in neverAsk) siteRow(s, 'never_ask'),
            for (final s in blocked) siteRow(s, 'never'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.xxs,
            AppSpace.xs,
            AppSpace.xxs,
            0,
          ),
          child: FormNote(l10n.appBrowserSitesHelp),
        ),
      ],
      const SizedBox(height: AppSpace.md),
      SectionHeader(title: l10n.appBrowserKinds),
      GroupedCard(
        children: [
          for (final k in _kinds)
            GroupedTile(
              icon: switch (k) {
                'banking' => LucideIcons.landmark,
                'health' => LucideIcons.heartPulse,
                'passwords' => LucideIcons.keyRound,
                _ => LucideIcons.idCard,
              },
              title: appBrowserKindLabel(l10n, k),
              onTap: _busy
                  ? null
                  : () => _update(
                      d,
                      kinds: kinds.contains(k)
                          ? [...kinds.where((x) => x != k)]
                          : [...kinds, k],
                    ),
              trailing: Switch(
                key: Key('appBrowserKind-$k'),
                value: kinds.contains(k),
                onChanged: _busy
                    ? null
                    : hapticOnChanged(
                        (v) => _update(
                          d,
                          kinds: v
                              ? [...kinds, k]
                              : [...kinds.where((x) => x != k)],
                        ),
                      ),
              ),
            ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpace.xxs,
          AppSpace.xs,
          AppSpace.xxs,
          0,
        ),
        child: FormNote(l10n.appBrowserKindsHelp),
      ),
      const SizedBox(height: AppSpace.md),
      GroupedCard(
        children: [
          GroupedTile(
            key: const Key('appBrowserSignIn'),
            icon: LucideIcons.logIn,
            title: l10n.appBrowserSignIn,
            subtitle: l10n.appBrowserSignInHelp,
            onTap: on ? () => openAppBrowser(context, person: true) : null,
          ),
          GroupedTile(
            key: const Key('appBrowserClearData'),
            icon: LucideIcons.eraser,
            title: l10n.appBrowserClearData,
            subtitle: l10n.appBrowserClearDataHelp,
            onTap: _clearData,
          ),
          GroupedTile(
            key: const Key('appBrowserUnpair'),
            icon: LucideIcons.unlink,
            title: l10n.appBrowserUnpair,
            destructive: true,
            onTap: _busy ? null : () => _unpair(d),
          ),
        ],
      ),
    ];
  }
}
