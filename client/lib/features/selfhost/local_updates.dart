import 'dart:async';
import 'dart:convert';

import 'package:casama_selfhost/casama_selfhost.dart' as sh;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/form_sheet.dart';
import 'guided_setup.dart';
import 'local_server.dart';

/// Updates for the server this app installed on this computer (docs/SELF-HOSTING-PLAN.md §6.4):
/// the app reads the newest release at most once a day and offers "Update" when it is newer than
/// the install and this app is new enough for it (`min_app_build`).
abstract final class LocalUpdatePrefs {
  static const checkedAt = 'casama.selfhost.update_checked_at';
  static const manifest = 'casama.selfhost.update_manifest';
  static const later = 'casama.selfhost.update_later';
}

/// This app's build number (the `+N` in pubspec), or null when it can't be read. Tests replace it.
Future<int?> Function() selfhostAppBuild = () async {
  try {
    return int.tryParse((await PackageInfo.fromPlatform()).buildNumber);
  } catch (_) {
    return null;
  }
};

/// The clock (tests move it).
@visibleForTesting
DateTime Function() updateClock = DateTime.now;

/// Whether release [next] is newer than [current] (`YYYY.M.D-<commit>`): a later day, or the
/// same day with a different commit. Anything that doesn't parse counts as newer when different.
bool isNewerRelease(String next, String? current) {
  if (current == null || current.isEmpty) return true;
  if (next == current) return false;
  List<int>? day(String v) {
    final parts = v.split('-').first.split('.');
    if (parts.length != 3) return null;
    final n = parts.map(int.tryParse).toList();
    return n.contains(null) ? null : n.cast<int>();
  }

  final a = day(next), b = day(current);
  if (a == null || b == null) return true;
  for (var i = 0; i < 3; i++) {
    if (a[i] != b[i]) return a[i] > b[i];
  }
  return true;
}

/// The release to offer, or null.
class LocalUpdateNotifier extends AsyncNotifier<sh.SelfhostManifest?> {
  @override
  Future<sh.SelfhostManifest?> build() async {
    if (!localServerSupported) return null;
    if (!await ref.watch(usingLocalServerProvider.future)) return null;
    final manager = ref.watch(localServerManagerProvider);
    final local = await manager.installed();
    if (local == null) return null;
    final manifest = await _daily(manager);
    if (manifest == null || !isNewerRelease(manifest.version, manager.installedVersion(local.dir))) return null;
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(LocalUpdatePrefs.later) == manifest.version) return null;
    final build = await selfhostAppBuild();
    if (build != null && manifest.minAppBuild > build) return null;
    return manifest;
  }

  /// The newest release, read from the network at most once a day.
  Future<sh.SelfhostManifest?> _daily(LocalServerManager manager) async {
    final prefs = await SharedPreferences.getInstance();
    final at = DateTime.tryParse(prefs.getString(LocalUpdatePrefs.checkedAt) ?? '');
    final cached = prefs.getString(LocalUpdatePrefs.manifest);
    if (at != null && cached != null && updateClock().difference(at) < const Duration(days: 1)) {
      try {
        return sh.SelfhostManifest.fromJson(jsonDecode(cached) as Map<String, dynamic>);
      } catch (_) {}
    }
    try {
      final m = await manager.latest();
      await prefs.setString(LocalUpdatePrefs.checkedAt, updateClock().toIso8601String());
      await prefs.setString(LocalUpdatePrefs.manifest, jsonEncode(m.toJson()));
      return m;
    } catch (_) {
      return null;
    }
  }

  /// "Later": not offered again until a newer release than [version].
  Future<void> later(String version) async {
    try {
      await (await SharedPreferences.getInstance()).setString(LocalUpdatePrefs.later, version);
    } catch (_) {}
    state = const AsyncData(null);
  }
}

final localUpdateProvider = AsyncNotifierProvider.autoDispose<LocalUpdateNotifier, sh.SelfhostManifest?>(LocalUpdateNotifier.new);

/// Runs the update in a sheet with its progress, and says plainly how it ended.
Future<void> showLocalUpdate(BuildContext context, WidgetRef ref, sh.SelfhostManifest manifest) async {
  await showAdaptiveSheet<void>(
    context: context,
    builder: (_) => LocalUpdateSheet(manifest: manifest),
  );
  ref.invalidate(localUpdateProvider);
}

class LocalUpdateSheet extends ConsumerStatefulWidget {
  const LocalUpdateSheet({super.key, required this.manifest});
  final sh.SelfhostManifest manifest;

  @override
  ConsumerState<LocalUpdateSheet> createState() => _LocalUpdateSheetState();
}

class _LocalUpdateSheetState extends ConsumerState<LocalUpdateSheet> {
  LocalServerProgress? _p;
  StreamSubscription<LocalServerProgress>? _sub;

  bool get _running => _p != null && _p!.step != LocalServerStep.ready && _p!.step != LocalServerStep.failed;

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    super.dispose();
  }

  void _start() {
    setState(() => _p = const LocalServerProgress(LocalServerStep.checking));
    _sub = ref.read(localServerManagerProvider).update(widget.manifest).listen((p) {
      if (mounted) setState(() => _p = p);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final p = _p;
    final done = p?.step == LocalServerStep.ready;
    final failed = p?.step == LocalServerStep.failed;
    return PopScope(
      canPop: !_running,
      child: SingleChildScrollView(
        key: const Key('localUpdateSheet'),
        padding: EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xs, AppSpace.xl, AppSpace.lg + MediaQuery.paddingOf(context).bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpace.md,
          children: [
            Text(l10n.localUpdateTitle(widget.manifest.version), style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            if (p == null) ...[
              Text(l10n.localUpdateBody, style: context.textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant)),
              FilledButton.icon(
                key: const Key('localUpdateRun'),
                onPressed: _start,
                icon: const Icon(LucideIcons.download, size: 18),
                label: Text(l10n.localUpdateButton),
              ),
            ] else if (done)
              FormNote(
                l10n.localUpdateDone(widget.manifest.version),
                key: const Key('localUpdateDone'),
                icon: LucideIcons.circleCheck,
                color: context.appColors.positive,
              )
            else if (failed) ...[
              FormNote(
                p.rolledBack ? l10n.localUpdateRolledBack : l10n.localUpdateFailed(p.detail ?? ''),
                key: Key(p.rolledBack ? 'localUpdateRolledBack' : 'localUpdateFailed'),
                icon: p.rolledBack ? LucideIcons.undo2 : LucideIcons.triangleAlert,
                color: p.rolledBack ? context.appColors.warning : scheme.error,
              ),
              if (p.rolledBack && p.detail != null) Text(p.detail!, style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
            ] else ...[
              LinearProgressIndicator(key: const Key('localUpdateBar'), value: p.step == LocalServerStep.downloading ? p.fraction : null),
              Text(
                (p.detail ?? '').replaceFirst('==> ', ''),
                key: const Key('localUpdateStep'),
                style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
              ),
              Text(
                l10n.setupServerKeepOpen,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ],
            if (done || failed) OutlinedButton(key: const Key('localUpdateClose'), onPressed: () => Navigator.pop(context), child: Text(l10n.close)),
          ],
        ),
      ),
    );
  }
}
