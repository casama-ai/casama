import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/link_browser.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart' show isCasamaCloud;
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/page.dart';
import '../files/file_preview.dart' show formatBytes;
import 'move_api.dart';
import 'move_switch.dart';
import 'moved_screen.dart';

/// Where a move goes: the receiving server and its one-time code.
class MoveTarget {
  const MoveTarget({required this.url, required this.code});
  final String url;
  final String code;
}

/// The check (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.5): size and time, the pause, whether it fits
/// the plan there, versions, what comes along and what needs the person afterwards.
class MoveCheckScreen extends ConsumerStatefulWidget {
  const MoveCheckScreen({super.key, required this.orgId, required this.target});
  final String orgId;
  final MoveTarget target;

  @override
  ConsumerState<MoveCheckScreen> createState() => _MoveCheckScreenState();
}

class _MoveCheckScreenState extends ConsumerState<MoveCheckScreen> {
  late Future<MoveCheck> _check = _load();
  var _bringKeys = true;
  var _starting = false;

  Future<MoveCheck> _load() => ref
      .read(moveApiProvider)
      .check(
        orgId: widget.orgId,
        targetUrl: widget.target.url,
        code: widget.target.code,
      );

  Future<void> _start() async {
    if (_starting) return;
    setState(() => _starting = true);
    final started = await runGuarded(
      context,
      () => ref
          .read(moveApiProvider)
          .start(
            orgId: widget.orgId,
            targetUrl: widget.target.url,
            code: widget.target.code,
            bringKeys: _bringKeys,
          ),
    );
    if (!mounted) return;
    setState(() => _starting = false);
    if (started == null) return;
    ref.invalidate(workspaceMoveProvider(widget.orgId));
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => MoveProgressScreen(
          orgId: widget.orgId,
          target: widget.target,
          bringKeys: _bringKeys,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SubPage(
      title: l10n.wsMoveCheckTitle,
      body: FutureBuilder<MoveCheck>(
        future: _check,
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpace.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      errorText(context, snap.error!),
                      key: const Key('moveCheckError'),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpace.md),
                    OutlinedButton(
                      onPressed: () => setState(() => _check = _load()),
                      child: Text(l10n.wsMoveCheckAgain),
                    ),
                  ],
                ),
              ),
            );
          }
          final c = snap.data;
          if (c == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return _details(context, c);
        },
      ),
    );
  }

  Widget _details(BuildContext context, MoveCheck c) {
    final l10n = context.l10n;
    final text = context.textTheme;
    final colors = context.appColors;
    final minutes = (c.estimateSeconds / 60).ceil().clamp(1, 1 << 30);
    final pause = (c.pauseSeconds / 60).ceil().clamp(1, 1 << 30);
    final keys = c.modelKeys + c.chatAppKeys + c.secretKeys;
    final blocked = !c.fits || c.updateFirst != null;
    final counts = <String>[
      if ((c.counts['bots'] ?? 0) > 0)
        l10n.wsMoveCountBots(c.counts['bots']!.toInt()),
      if ((c.counts['conversations'] ?? 0) > 0)
        l10n.wsMoveCountChats(c.counts['conversations']!.toInt()),
      if ((c.counts['memories'] ?? 0) > 0)
        l10n.wsMoveCountMemories(c.counts['memories']!.toInt()),
      if ((c.counts['routines'] ?? 0) > 0)
        l10n.wsMoveCountRoutines(c.counts['routines']!.toInt()),
      if ((c.counts['files'] ?? 0) > 0)
        l10n.wsMoveCountFiles(c.counts['files']!.toInt()),
      if ((c.counts['computers'] ?? 0) > 0)
        l10n.wsMoveCountComputers(c.counts['computers']!.toInt()),
      if ((c.counts['members'] ?? 0) > 0)
        l10n.wsMoveCountPeople(c.counts['members']!.toInt()),
    ];
    String overWhat(String w) => switch (w) {
      'people' => l10n.wsMoveOverPeople,
      'bots' => l10n.wsMoveOverBots,
      'computers' => l10n.wsMoveOverComputers,
      _ => l10n.wsMoveOverStorage,
    };
    String amount(MoveOver o) => o.what == 'storage'
        ? formatBytes(o.have.toInt(), l10n.localeName)
        : '${o.have}';
    String limit(MoveOver o) => o.what == 'storage'
        ? formatBytes(o.limit.toInt(), l10n.localeName)
        : '${o.limit}';
    return PageColumn(
      children: [
        Text(
          l10n.wsMoveCheckTo(
            c.toCloud
                ? 'Casama Cloud'
                : moveServerName(context, widget.target.url),
          ),
          style: text.titleMedium,
        ),
        const SizedBox(height: AppSpace.xs),
        Text(
          l10n.wsMoveCheckSize(
            formatBytes(c.sizeBytes, l10n.localeName),
            minutes,
          ),
          key: const Key('moveCheckSize'),
        ),
        Text(l10n.wsMoveCheckPause(pause)),
        if (c.longPause)
          Text(
            l10n.wsMoveCheckLongPause,
            key: const Key('moveCheckLongPause'),
            style: TextStyle(color: colors.warning),
          ),
        if (c.updateFirst != null) ...[
          const SizedBox(height: AppSpace.md),
          _Notice(
            key: const Key('moveUpdateFirst'),
            icon: LucideIcons.refreshCw,
            text: c.updateFirst == 'source'
                ? l10n.wsMoveUpdateSource
                : l10n.wsMoveUpdateTarget,
          ),
        ],
        if (!c.fits) ...[
          const SizedBox(height: AppSpace.md),
          _Notice(
            key: const Key('moveDoesntFit'),
            icon: LucideIcons.gauge,
            text: [
              l10n.wsMoveDoesntFit,
              for (final o in c.over)
                l10n.wsMoveOverLine(overWhat(o.what), amount(o), limit(o)),
              if (c.needsPlanName != null)
                l10n.wsMoveNeedsPlan(c.needsPlanName!),
            ].join('\n'),
          ),
        ],
        const SizedBox(height: AppSpace.lg),
        Text(l10n.wsMoveCheckComes, style: text.titleSmall),
        const SizedBox(height: AppSpace.xs),
        Text(counts.join(' · '), key: const Key('moveCheckCounts')),
        const SizedBox(height: AppSpace.lg),
        Text(l10n.wsMoveCheckAfter, style: text.titleSmall),
        const SizedBox(height: AppSpace.xs),
        if (c.reconnect.isNotEmpty)
          _Bullet(l10n.wsMoveReconnect(c.reconnect.join(', '))),
        if (c.invites.isNotEmpty) _Bullet(l10n.wsMoveInvites(c.invites.length)),
        if (c.chatgptPlans > 0) _Bullet(l10n.wsMoveChatgptPlans),
        if (c.computers > 0) _Bullet(l10n.wsMoveComputersNote(c.computers)),
        _Bullet(l10n.wsMoveResetNote),
        if (keys > 0) ...[
          const SizedBox(height: AppSpace.md),
          AppCard(
            padding: EdgeInsets.zero,
            child: SwitchListTile.adaptive(
              key: const Key('moveBringKeys'),
              value: _bringKeys,
              onChanged: (v) => setState(() => _bringKeys = v),
              title: Text(l10n.wsMoveBringKeys),
              subtitle: Text(
                _bringKeys
                    ? l10n.wsMoveBringKeysHelp(keys)
                    : l10n.wsMoveNoKeysHelp,
              ),
            ),
          ),
        ],
        const SizedBox(height: AppSpace.lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (blocked)
              OutlinedButton(
                key: const Key('moveCheckAgain'),
                onPressed: () => setState(() => _check = _load()),
                child: Text(l10n.wsMoveCheckAgain),
              )
            else
              FilledButton.icon(
                key: const Key('moveStart'),
                icon: _starting
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(LucideIcons.truck),
                label: Text(l10n.wsMoveStart),
                onPressed: _starting ? null : _start,
              ),
          ],
        ),
      ],
    );
  }
}

/// The move as it goes: the step and bytes, read from this server every two seconds. It carries on
/// without the app, so opening Settings › Move again comes back here. A failed move says so and
/// offers "Try again" (it resumes, keeping what the other server already has); a finished one
/// shows what's left to do.
class MoveProgressScreen extends ConsumerStatefulWidget {
  const MoveProgressScreen({
    super.key,
    required this.orgId,
    this.target,
    this.bringKeys = true,
    this.poll = const Duration(seconds: 2),
  });
  final String orgId;

  /// Known when this run of the app started the move: "Try again" can reuse the code.
  final MoveTarget? target;
  final bool bringKeys;
  final Duration poll;

  @override
  ConsumerState<MoveProgressScreen> createState() => _MoveProgressScreenState();
}

class _MoveProgressScreenState extends ConsumerState<MoveProgressScreen> {
  MoveProgress? _p;
  Timer? _timer;
  var _retrying = false;

  @override
  void initState() {
    super.initState();
    unawaited(_read());
    _timer = Timer.periodic(widget.poll, (_) => _read());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _read() async {
    try {
      final p = await ref.read(moveApiProvider).progress(widget.orgId);
      if (!mounted || p == null) return;
      final finishedNow =
          _p != null && _p!.running && p.state == MoveState.done;
      if (finishedNow) {
        movesWatched.value = {...movesWatched.value, widget.orgId};
      }
      setState(() => _p = p);
      if (!p.running) {
        _timer?.cancel();
        ref.invalidate(workspaceMoveProvider(widget.orgId));
      }
    } catch (_) {
      // A blip; the next read tries again.
    }
  }

  Future<void> _retry() async {
    final t = widget.target;
    if (t == null || _retrying) return;
    setState(() => _retrying = true);
    final p = await runGuarded(
      context,
      () => ref
          .read(moveApiProvider)
          .start(
            orgId: widget.orgId,
            targetUrl: t.url,
            code: t.code,
            bringKeys: widget.bringKeys,
          ),
    );
    if (!mounted) return;
    setState(() {
      _retrying = false;
      if (p != null) _p = p;
    });
    if (p != null) {
      _timer?.cancel();
      _timer = Timer.periodic(widget.poll, (_) => _read());
    }
  }

  String _step(BuildContext context, MoveProgress p) {
    final l10n = context.l10n;
    return switch (p.state) {
      MoveState.pausing => l10n.wsMoveStepPausing,
      MoveState.finishing => l10n.wsMoveStepFinishing,
      MoveState.importing => l10n.wsMoveStepImporting,
      MoveState.copying when p.step == 'starting' => l10n.wsMoveStepStarting,
      MoveState.copying when p.step == 'finish' || p.step == 'cutover' =>
        l10n.wsMoveStepImporting,
      MoveState.copying
          when p.step == 'tables' || p.step == 'keys' || p.step == 'members' =>
        l10n.wsMoveStepFinishing,
      _ => l10n.wsMoveStepCopying,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final p = _p;
    if (p == null) {
      return SubPage(
        title: l10n.wsMoveProgressTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (p.state == MoveState.done) {
      return SubPage(
        title: l10n.wsMoveDoneTitle,
        children: [MoveAfterView(progress: p, bringKeys: widget.bringKeys)],
      );
    }
    if (p.state == MoveState.failed || p.state == MoveState.cancelled) {
      return SubPage(
        title: l10n.wsMoveProgressTitle,
        children: [
          _Notice(
            key: const Key('moveFailed'),
            icon: LucideIcons.circleAlert,
            text: [
              l10n.wsMoveFailedTitle,
              l10n.wsMoveFailedBody,
              if (p.errorMessage != null) p.errorMessage!,
            ].join('\n'),
          ),
          const SizedBox(height: AppSpace.lg),
          if (widget.target != null)
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                key: const Key('moveTryAgain'),
                onPressed: _retrying ? null : _retry,
                child: Text(l10n.wsMoveTryAgain),
              ),
            )
          else
            Text(l10n.wsMoveNewCodeNeeded, key: const Key('moveNewCode')),
        ],
      );
    }
    final total = p.totalBytes;
    return SubPage(
      title: l10n.wsMoveProgressTitle,
      children: [
        Text(
          _step(context, p),
          key: const Key('moveStep'),
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpace.md),
        LinearProgressIndicator(
          key: const Key('moveProgressBar'),
          value: total > 0 ? p.fraction : null,
        ),
        const SizedBox(height: AppSpace.xs),
        if (total > 0)
          Text(
            l10n.wsMoveProgressBytes(
              formatBytes(p.doneBytes, l10n.localeName),
              formatBytes(total, l10n.localeName),
            ),
          ),
        const SizedBox(height: AppSpace.lg),
        Text(l10n.wsMoveProgressLeave, style: context.textTheme.bodyMedium),
      ],
    );
  }
}

/// After the move (§7.5 "the after checklist"): what arrived, what needs the person there, and a
/// reminder about subscriptions on the side the workspace left.
class MoveAfterView extends ConsumerWidget {
  const MoveAfterView({
    super.key,
    required this.progress,
    this.bringKeys = true,
  });
  final MoveProgress progress;
  final bool bringKeys;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final r = progress.report;
    final url = progress.movedTo?.url ?? progress.remoteUrl ?? '';
    final toCloud = progress.movedTo?.cloud ?? isCasamaCloud(url);
    List<Map<String, dynamic>> list(Object? v) => [
      for (final e in (v as List? ?? const []).whereType<Map>())
        e.cast<String, dynamic>(),
    ];
    final reconnect = list(r['reconnect']);
    final invited = list(r['invited']);
    final chatApps = list((r['chat_apps'] as Map?)?['needs_you']);
    final webhooks = list(r['webhooks']);
    final reset = list((r['reset'] as Map?)?['bots']);
    final renamed = list(r['renamed']);
    final cloudBots = ((r['cloud_models_needed'] as Map?)?['bots'] as num?)?.toInt() ?? 0;
    final keysBrought = (r['keys'] as Map?)?['brought'] == true || bringKeys;
    final items = <Widget>[
      for (final a in reconnect)
        _Check(l10n.wsMoveAfterReconnect('${a['name']}')),
      if (invited.isNotEmpty) _Check(l10n.wsMoveAfterInvited(invited.length)),
      for (final a in chatApps) _Check(l10n.wsMoveAfterChatApp('${a['name']}')),
      for (final w in webhooks) _Check(l10n.wsMoveAfterWebhook('${w['name']}')),
      if (reset.isNotEmpty) _Check(l10n.wsMoveAfterReset(reset.length)),
      if (cloudBots > 0) _Check(l10n.wsMoveAfterCloudModels(cloudBots)),
      if (renamed.isNotEmpty) _Check(l10n.wsMoveAfterRenamed(renamed.length)),
      if (!keysBrought) _Check(l10n.wsMoveAfterKeys),
    ];
    final onCloudNow = isCasamaCloud(ref.watch(backendProvider).apiUrl);
    return Column(
      key: const Key('moveAfter'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.wsMoveDoneBody(moveServerName(context, url)),
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpace.md),
        if (items.isEmpty)
          Text(l10n.wsMoveAfterNothing)
        else ...[
          Text(l10n.wsMoveDoneNeeds),
          const SizedBox(height: AppSpace.xs),
          ...items,
        ],
        if (webhooks.isNotEmpty || chatApps.isNotEmpty) ...[
          const SizedBox(height: AppSpace.sm),
          Text(
            l10n.wsMoveAfterForward(moveForwardDays),
            style: context.textTheme.bodySmall,
          ),
        ],
        if (r['reindexing'] == true) ...[
          const SizedBox(height: AppSpace.sm),
          Text(l10n.wsMoveAfterReindex, style: context.textTheme.bodySmall),
        ],
        const SizedBox(height: AppSpace.lg),
        SubscriptionReminder(toCloud: toCloud, fromCloud: onCloudNow),
        const SizedBox(height: AppSpace.lg),
        if (url.isNotEmpty)
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              key: const Key('moveOpenThere'),
              icon: const Icon(LucideIcons.externalLink),
              label: Text(l10n.wsMoveOpenThere),
              onPressed: () => openWebLink(
                Uri.parse(toCloud ? 'https://casama.ai/open' : url),
              ),
            ),
          ),
      ],
    );
  }
}

/// Subscriptions don't move (§4.5): moving to Cloud, a business license for the old server may no
/// longer be needed; moving away from Cloud, the Cloud plan keeps renewing until it's cancelled.
class SubscriptionReminder extends StatelessWidget {
  const SubscriptionReminder({
    super.key,
    required this.toCloud,
    required this.fromCloud,
  });
  final bool toCloud;
  final bool fromCloud;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      key: const Key('moveSubscriptionReminder'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.receipt,
                size: 18,
                color: context.colorScheme.primary,
              ),
              const SizedBox(width: AppSpace.xs),
              Text(l10n.wsMoveSubTitle, style: context.textTheme.titleSmall),
            ],
          ),
          const SizedBox(height: AppSpace.xs),
          Text(fromCloud ? l10n.wsMoveSubFromCloud : l10n.wsMoveSubToCloud),
          if (fromCloud)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                key: const Key('moveManagePlan'),
                onPressed: () => context.push('/settings/billing'),
                child: Text(l10n.wsMoveSubManage),
              ),
            ),
        ],
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => AppCard(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: context.appColors.warning),
        const SizedBox(width: AppSpace.sm),
        Expanded(child: Text(text)),
      ],
    ),
  );
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpace.xs),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 7, right: AppSpace.sm),
          child: Icon(Icons.circle, size: 6),
        ),
        Expanded(child: Text(text)),
      ],
    ),
  );
}

class _Check extends StatelessWidget {
  const _Check(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpace.xs),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpace.sm),
          child: Icon(
            LucideIcons.square,
            size: 18,
            color: context.colorScheme.outline,
          ),
        ),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
