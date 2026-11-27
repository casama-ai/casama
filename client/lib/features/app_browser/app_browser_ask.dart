import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../ui/action_buttons.dart';
import '../../ui/glow_button.dart';
import '../chat/widgets/chat_look.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';

/// The name of an off-by-default kind of site, as the settings and the asks say it.
String appBrowserKindLabel(AppLocalizations l10n, String kind) =>
    switch (kind) {
      'banking' => l10n.appBrowserKindBanking,
      'health' => l10n.appBrowserKindHealth,
      'passwords' => l10n.appBrowserKindPasswords,
      'government' => l10n.appBrowserKindGovernment,
      _ => kind,
    };

/// A site ask (Once, Always, Never) or a step ask (Allow, Don't Allow), in the look of the chat's
/// ask cards (`DeviceAccessPrompt`). The same card sits in the chat and over the full browser.
class AppBrowserAskCard extends ConsumerWidget {
  const AppBrowserAskCard({super.key, required this.ask});
  final AppBrowserAsk ask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final controller = ref.read(appBrowserProvider.notifier);
    final site = ask.kind == AppBrowserAskKind.site;
    final title = site
        ? l10n.appBrowserSiteAskTitle(ask.botName, ask.host ?? '')
        : l10n.appBrowserStepAskTitle(ask.botName);
    // Named after the device it is on: the phone, the Mac, this (Linux) computer or this PC.
    final system = appBrowserSystem;
    final subtitle = switch ((site, system)) {
      (true, 'macos') => l10n.appBrowserSiteAskHelpMac,
      (true, 'linux') => l10n.appBrowserSiteAskHelpLinux,
      (true, 'windows') => l10n.appBrowserSiteAskHelpWindows,
      (true, _) => l10n.appBrowserSiteAskHelp,
      (false, 'macos') => l10n.appBrowserStepAskHelpMac,
      (false, 'linux') => l10n.appBrowserStepAskHelpLinux,
      (false, 'windows') => l10n.appBrowserStepAskHelpWindows,
      (false, _) => l10n.appBrowserStepAskHelp,
    };
    final label = switch (system) {
      'macos' => l10n.appBrowserTitleMac,
      'linux' => l10n.appBrowserTitleLinux,
      'windows' => l10n.appBrowserTitleWindows,
      _ => l10n.appBrowserCardLabel,
    };
    final body = <Widget>[
      if (site && ask.siteKind != null)
        Text(
          l10n.appBrowserSiteKindAsks(ask.siteKind!),
        ),
      if (!site && (ask.reason ?? '').isNotEmpty)
        Text(
          ask.reason!,
          style: context.textTheme.bodyMedium?.copyWith(height: 1.4),
        ),
      if (!site && (ask.name ?? '').isNotEmpty)
        Text(
          switch (ask.step) {
            'click' => l10n.appBrowserStepClick(ask.name!),
            'fill' || 'type' => l10n.appBrowserStepType(ask.name!),
            'press' => l10n.appBrowserStepPress(ask.name!),
            'upload' => l10n.appBrowserStepUpload(ask.name!),
            _ => l10n.appBrowserStepOn(ask.step ?? '', ask.name!),
          },
          style: context.textTheme.bodySmall?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
    ];
    return Container(
      key: const Key('appBrowserAsk'),
      padding: ChatLook.cardPadding,
      decoration: ChatLook.card(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: ChatLook.fieldFill(context),
                  borderRadius: BorderRadius.circular(9),
                ),
                alignment: Alignment.center,
                child: Icon(
                  site ? LucideIcons.globe : LucideIcons.mousePointerClick,
                  size: 17,
                  color: context.appColors.working,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              subtitle,
              style: context.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ),
          if (body.isNotEmpty) ...[const SizedBox(height: 14), ...body],
          const SizedBox(height: 14),
          if (site)
            ActionButtons(
              actions: [
                OutlinedButton(
                  key: const Key('appBrowserNever'),
                  onPressed: () =>
                      controller.answerSite(AppBrowserSiteAnswer.never),
                  child: Text(l10n.appBrowserNever),
                ),
                GlowButton(
                  key: const Key('appBrowserOnce'),
                  onPressed: () =>
                      controller.answerSite(AppBrowserSiteAnswer.once),
                  child: Text(l10n.appBrowserOnce),
                ),
              ],
              extra: [
                TextButton(
                  key: const Key('appBrowserAlways'),
                  onPressed: () =>
                      controller.answerSite(AppBrowserSiteAnswer.always),
                  child: Text(l10n.appBrowserAlways),
                ),
              ],
            )
          else
            ActionButtons(
              actions: [
                OutlinedButton(
                  key: const Key('appBrowserDeny'),
                  onPressed: () => controller.answerStep(false),
                  child: Text(l10n.appBrowserDontAllow),
                ),
                GlowButton.icon(
                  key: const Key('appBrowserAllow'),
                  onPressed: () => controller.answerStep(true),
                  icon: const Icon(LucideIcons.check, size: 18),
                  label: Text(l10n.allow),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
