import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/analytics.dart';
import '../../core/haptics.dart';
import '../../core/widgets.dart';
import '../../theme/app_tokens.dart';
import '../chat/chat_controller.dart';
import 'app_browser_controller.dart';
import 'app_browser_done.dart';
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
  // While the person is typing an address, a page change doesn't overwrite it.
  final _addressFocus = FocusNode();
  late final AppBrowserController _controller;
  VoidCallback? _releaseAskOverlay;
  // The done card showing now, so closing the view with it up counts as an answer.
  bool _doneShowing = false;

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
    // Leaving the field without going anywhere shows where the page really is again.
    _addressFocus.addListener(() {
      if (_addressFocus.hasFocus || !mounted) return;
      final url = ref.read(appBrowserProvider).url;
      if (url != null && url != 'about:blank') _address.text = url;
    });
    // After this frame: a provider can't change while the tree builds.
    if (widget.person) {
      Future.microtask(() => _controller.openForPerson(widget.startUrl));
    } else {
      // The done card is for a finish watched here; one from before this opened is old news.
      Future.microtask(_controller.dismissDone);
    }
  }

  void _answerDone(String choice) {
    if (!_doneShowing) return;
    _doneShowing = false;
    Analytics.log('app_browser_done_answered', {
      'choice': choice,
      'system': ?appBrowserSystem,
    });
  }

  void _backToChat() {
    Haptic.tap();
    _answerDone('back_to_chat');
    _controller.dismissDone();
    Navigator.of(context).maybePop();
  }

  void _stay() {
    Haptic.tap();
    _answerDone('stay');
    _controller.dismissDone();
  }

  @override
  void dispose() {
    if (_doneShowing) {
      _answerDone('closed');
      Future.microtask(_controller.dismissDone);
    }
    _releaseAskOverlay?.call();
    _releaseAskOverlay = null;
    if (widget.person) Future.microtask(_controller.closePerson);
    _address.dispose();
    _addressFocus.dispose();
    super.dispose();
  }

  Future<void> _go(String text) async {
    // Hand the field back so later page changes show in it.
    _addressFocus.unfocus();
    final ok = await _controller.loadForPerson(text);
    if (!ok && mounted) {
      showWarning(context, context.l10n.appBrowserAddressRefused);
    }
  }

  Future<void> _allowSite() async {
    final host = await runGuarded(context, _controller.allowCurrentSite);
    if (host != null && mounted) {
      // The button gives way to "added" for this site.
      setState(() {});
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
          !_addressFocus.hasFocus) {
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
    // The bot finished with the page while the person watched: say so, with the way back.
    final done = widget.person ? null : s.doneRun;
    final outcome = done == null || done.botId.isEmpty
        ? (failed: false, preview: null)
        : appBrowserDoneOutcome(
            ref.watch(chatControllerProvider(done.botId)),
            done,
          );
    ref.listen(appBrowserProvider.select((v) => v.doneRun), (was, now) {
      if (widget.person || now == null || was != null) return;
      // Read after the frame: the chat's last reply may land in the same moment.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || ref.read(appBrowserProvider).doneRun == null) return;
        final o = now.botId.isEmpty
            ? (failed: false, preview: null)
            : appBrowserDoneOutcome(
                ref.read(chatControllerProvider(now.botId)),
                now,
              );
        _doneShowing = true;
        o.failed ? Haptic.warn() : Haptic.confirm();
        Analytics.log('app_browser_done_shown', {
          'outcome': o.failed ? 'failed' : 'done',
          'with_preview': o.preview != null,
          'system': ?appBrowserSystem,
        });
      });
    });
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
                focusNode: _addressFocus,
                session: s,
                onGo: _go,
                browser: _controller,
              ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const AppBrowserPageArea(),
                  Positioned(
                    left: AppSpace.sm,
                    right: AppSpace.sm,
                    bottom: AppSpace.sm,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, a) => FadeTransition(
                        opacity: a,
                        child: SlideTransition(
                          position: Tween(
                            begin: const Offset(0, 0.25),
                            end: Offset.zero,
                          ).animate(a),
                          child: child,
                        ),
                      ),
                      child: done == null
                          ? const SizedBox.shrink()
                          : Material(
                              type: MaterialType.transparency,
                              child: AppBrowserDoneCard(
                                botName: done.botName,
                                outcome: outcome,
                                onBackToChat: _backToChat,
                                onStay: _stay,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            // Not while typing: the keyboard leaves little room, and the page needs it.
            if (widget.person && MediaQuery.viewInsetsOf(context).bottom == 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpace.md,
                  AppSpace.xs,
                  AppSpace.md,
                  AppSpace.xs,
                ),
                // A site bots may already use says so instead of offering the button again.
                child: s.host != null && _controller.siteAllowed(s.host!)
                    ? Row(
                        key: const Key('appBrowserSiteAllowed'),
                        children: [
                          Icon(
                            LucideIcons.check,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: AppSpace.xs),
                          Expanded(
                            child: Text(
                              l10n.appBrowserSiteAdded(s.host!),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
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
    required this.focusNode,
    required this.session,
    required this.onGo,
    required this.browser,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
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
              focusNode: focusNode,
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
