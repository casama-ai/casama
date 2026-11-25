import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/widgets.dart';
import '../../theme/app_tokens.dart';
import '../chat/chat_controller.dart';
import 'app_browser_controller.dart';
import 'app_browser_flag.dart';
import 'app_browser_pane.dart';
import 'app_browser_linux.dart';

/// The phone browser full size (plan §8.7): the site's name with a lock for https, the bot's name
/// while it works, Stop, Take Over and Hand Back, "Your turn" for a handoff, and the asks over the
/// page. With [person] it's the person's own browsing (Sign In to a Site): an address field,
/// back, forward, reload and "Let My Bots Use This Site".
class AppBrowserScreen extends ConsumerStatefulWidget {
  const AppBrowserScreen({super.key, this.person = false, this.startUrl});
  final bool person;
  final String? startUrl;

  @override
  ConsumerState<AppBrowserScreen> createState() => _AppBrowserScreenState();
}

class _AppBrowserScreenState extends ConsumerState<AppBrowserScreen> {
  final _address = TextEditingController();
  late final AppBrowserController _controller;
  VoidCallback? _releaseAskOverlay;

  void _syncAskOverlay(bool hasAsk) {
    if (hasAsk && _releaseAskOverlay == null) {
      _releaseAskOverlay = AppBrowserOverlayGuard.suppress();
    } else if (!hasAsk && _releaseAskOverlay != null) {
      _releaseAskOverlay!.call();
      _releaseAskOverlay = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ref.read(appBrowserProvider.notifier);
    // After this frame: a provider can't change while the tree builds.
    if (widget.person) {
      Future.microtask(() => _controller.openForPerson(widget.startUrl));
    }
  }

  @override
  void dispose() {
    _releaseAskOverlay?.call();
    _releaseAskOverlay = null;
    if (widget.person) Future.microtask(_controller.closePerson);
    _address.dispose();
    super.dispose();
  }

  Future<void> _go(String text) async {
    final ok = await _controller.loadForPerson(text);
    if (!ok && mounted) {
      showWarning(context, context.l10n.appBrowserAddressRefused);
    }
  }

  Future<void> _allowSite() async {
    final host = await runGuarded(context, _controller.allowCurrentSite);
    if (host != null && mounted) {
      showSuccess(context, context.l10n.appBrowserSiteAdded(host));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!kAppBrowserCode || !ref.watch(appBrowserOnProvider)) {
      return const Scaffold();
    }
    final s = ref.watch(appBrowserProvider);
    _syncAskOverlay(s.ask != null);
    ref.listen(appBrowserProvider.select((v) => v.url), (_, url) {
      if (widget.person &&
          url != null &&
          url != 'about:blank' &&
          !_address.selection.isValid) {
        _address.text = url;
      }
    });
    // The chat underneath is covered while this is open, so its overlay may not see the reply
    // end; without this a run that finished during Take Over left the page "paused" for good.
    final run = s.run;
    if (run != null && run.botId.isNotEmpty && run.conversationId != null) {
      ref.listen(
        chatControllerProvider(run.botId).select(
          (c) => c.conversationId == run.conversationId && c.running,
        ),
        (was, now) {
          if ((was ?? false) && !now) {
            Future.microtask(() => _controller.runOver(run.conversationId));
          }
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: const Key('appBrowserClose'),
          tooltip: l10n.close,
          icon: const Icon(LucideIcons.x),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        titleSpacing: 0,
        title: AppBrowserSiteTitle(session: s),
        actions: [
          ...appBrowserRunActions(context, s, _controller),
          const SizedBox(width: AppSpace.xs),
        ],
        bottom: s.loading
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(minHeight: 2),
              )
            : null,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            if (widget.person)
              _AddressBar(
                controller: _address,
                session: s,
                onGo: _go,
                browser: _controller,
              ),
            const Expanded(child: AppBrowserPageArea()),
            // Not while typing: the keyboard leaves little room, and the page needs it.
            if (widget.person && MediaQuery.viewInsetsOf(context).bottom == 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpace.md,
                  AppSpace.xs,
                  AppSpace.md,
                  AppSpace.xs,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    key: const Key('appBrowserAllowSite'),
                    onPressed: s.host == null ? null : _allowSite,
                    icon: const Icon(LucideIcons.check, size: 18),
                    label: Text(l10n.appBrowserAllowSite),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AddressBar extends StatelessWidget {
  const _AddressBar({
    required this.controller,
    required this.session,
    required this.onGo,
    required this.browser,
  });
  final TextEditingController controller;
  final AppBrowserSession session;
  final ValueChanged<String> onGo;
  final AppBrowserController browser;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpace.xs,
        0,
        AppSpace.xs,
        AppSpace.xs,
      ),
      child: Row(
        children: [
          IconButton(
            key: const Key('appBrowserBack'),
            tooltip: l10n.appBrowserBack,
            icon: const Icon(LucideIcons.chevronLeft),
            onPressed: session.canGoBack ? browser.back : null,
          ),
          IconButton(
            key: const Key('appBrowserForward'),
            tooltip: l10n.appBrowserForward,
            icon: const Icon(LucideIcons.chevronRight),
            onPressed: session.canGoForward ? browser.forward : null,
          ),
          Expanded(
            child: TextField(
              key: const Key('appBrowserAddress'),
              controller: controller,
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.go,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: l10n.appBrowserAddress,
                isDense: true,
                prefixIcon: const Icon(LucideIcons.globe, size: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: onGo,
            ),
          ),
          IconButton(
            key: const Key('appBrowserReload'),
            tooltip: l10n.appBrowserReload,
            icon: const Icon(LucideIcons.rotateCw),
            onPressed: session.url == null ? null : browser.reload,
          ),
        ],
      ),
    );
  }
}
