import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../l10n/generated/app_localizations.dart';
import 'backend.dart';
import 'providers.dart';

/// Declared Age Range band (docs/APPLE-INTEGRATIONS-PLAN.md §5.2, §12.1).
/// Never stores a birth date; enforces teen mode (13–17: no adult content, no computers)
/// and blocks under-13 accounts uniformly across platforms.
enum AgeBand {
  under13('under13'),
  teen13to15('13to15'),
  teen16to17('16to17'),
  adult18plus('18plus'),
  declined('declined'),
  unknown('unknown');

  const AgeBand(this.apiValue);
  final String apiValue;

  bool get isUnder13 => this == AgeBand.under13;
  bool get isTeen => this == AgeBand.teen13to15 || this == AgeBand.teen16to17;
  bool get isRestricted => isUnder13 || isTeen;

  /// Lower is stricter. A band nobody has stated counts as the least strict.
  int get strictness => switch (this) {
    AgeBand.under13 => 0,
    AgeBand.teen13to15 => 1,
    AgeBand.teen16to17 => 2,
    AgeBand.adult18plus => 3,
    AgeBand.declined || AgeBand.unknown => 4,
  };

  AccountAgeBand? toApi() => switch (this) {
    AgeBand.under13 => AccountAgeBand.under13,
    AgeBand.teen13to15 => AccountAgeBand.n13to15,
    AgeBand.teen16to17 => AccountAgeBand.n16to17,
    AgeBand.adult18plus => AccountAgeBand.n18plus,
    AgeBand.declined => AccountAgeBand.declined,
    AgeBand.unknown => null,
  };

  static AgeBand fromApi(String? value) {
    for (final band in AgeBand.values) {
      if (band.apiValue == value) return band;
    }
    return AgeBand.unknown;
  }
}

class AgeRangeService {
  AgeRangeService({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/age_range');

  final MethodChannel _channel;
  static const Duration refreshInterval = Duration(days: 30);

  bool get _isAppleMobile =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  Future<bool> isSupported() async {
    if (!_isAppleMobile) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Returns true when the band has never been checked or is older than 30 days.
  static bool needsRefresh(DateTime? updatedAt, {DateTime? now}) {
    if (updatedAt == null) return true;
    final current = now ?? DateTime.now().toUtc();
    return current.difference(updatedAt.toUtc()) >= refreshInterval;
  }

  Future<AgeBand?> requestAgeRange() async {
    if (!_isAppleMobile) return null;
    try {
      final raw = await _channel.invokeMapMethod<String, dynamic>(
        'requestAgeRange',
      );
      final band = raw?['band'] as String?;
      if (band == null || band == 'unavailable') return null;
      return AgeBand.fromApi(band);
    } catch (_) {
      return null;
    }
  }
}

class AgeBandNotifier extends Notifier<AgeBand> {
  @override
  AgeBand build() => AgeBand.unknown;

  void setBand(AgeBand band) {
    state = band;
  }
}

final ageRangeServiceProvider = Provider<AgeRangeService>(
  (ref) => AgeRangeService(),
);

final ageBandProvider = NotifierProvider<AgeBandNotifier, AgeBand>(
  AgeBandNotifier.new,
);

/// True when the signed-in person is in teen mode (13–17): no adult sites, no computers.
final isTeenModeProvider = Provider<bool>(
  (ref) => ref.watch(ageBandProvider).isTeen,
);

/// True when the signed-in person is under 13 and blocked from using Casama.
final isUnder13BlockedProvider = Provider<bool>(
  (ref) => ref.watch(ageBandProvider).isUnder13,
);

/// Syncs `account_age_band` from `/v1/me` on sign-in and refreshes via Apple's Declared Age Range
/// framework on iOS every 30 days when supported. A failed check or send is logged and tried again
/// the next time the app comes to the front (or launches); nothing counts as checked until the
/// server has the band. Public for tests: [AgeBandSync].
class AgeBandSync {
  AgeBandSync(this._ref);

  final Ref _ref;

  /// A band Apple gave this session that the server hasn't taken yet: sent again without asking
  /// Apple twice.
  AgeBand? _unsent;
  var _retry = false;
  Future<void>? _running;

  /// Whether a failed check or send waits for the next resume.
  bool get needsRetry => _retry;

  Future<void> sync() => _running ??= _sync().whenComplete(() => _running = null);

  void signedOut() {
    _unsent = null;
    _retry = false;
    _ref.read(ageBandProvider.notifier).setBand(AgeBand.unknown);
  }

  Future<void> _sync() async {
    _retry = false;
    final backend = _ref.read(backendProvider);
    if (backend.userId == null) {
      signedOut();
      return;
    }
    final unsent = _unsent;
    if (unsent != null) {
      await _send(backend, unsent);
      return;
    }
    final Me? me;
    try {
      me = await backend.getMe();
    } catch (e) {
      // Without the server's answer the band can't be judged stale or fresh: try again later
      // rather than asking Apple every time.
      debugPrint('age band check failed: $e');
      _retry = true;
      return;
    }
    if (!_ref.mounted) return;
    _ref
        .read(ageBandProvider.notifier)
        .setBand(AgeBand.fromApi(me?.accountAgeBand?.value));
    if (!AgeRangeService.needsRefresh(me?.accountAgeBandUpdatedAt)) return;
    final service = _ref.read(ageRangeServiceProvider);
    if (!await service.isSupported()) return;
    final band = await service.requestAgeRange();
    if (!_ref.mounted || band == null || band == AgeBand.unknown) return;
    // A stricter band applies at once, even before the server has it; a looser one waits for
    // the server's answer.
    if (band.strictness < _ref.read(ageBandProvider).strictness) {
      _ref.read(ageBandProvider.notifier).setBand(band);
    }
    await _send(backend, band);
  }

  Future<void> _send(Backend backend, AgeBand band) async {
    try {
      final result = await backend.setMyAgeBand(band.toApi());
      _unsent = null;
      // The server decides which band is in force (it may keep a stricter one; rules in
      // apps/server/src/api/age-band.ts), so the app follows its answer, not Apple's raw one.
      if (_ref.mounted) {
        _ref.read(ageBandProvider.notifier).setBand(AgeBand.fromApi(result.accountAgeBand?.value));
      }
    } catch (e) {
      debugPrint('age band send failed: $e');
      _unsent = band;
      _retry = true;
    }
  }
}

final ageBandSyncProvider = Provider<AgeBandSync>((ref) {
  final sync = AgeBandSync(ref);
  ref.listen(signedInProvider, (_, next) {
    if (next.value == true) {
      unawaited(sync.sync());
    } else if (next.value == false) {
      sync.signedOut();
    }
  }, fireImmediately: true);
  final lifecycle = AppLifecycleListener(
    onResume: () {
      if (sync.needsRetry) unawaited(sync.sync());
    },
  );
  ref.onDispose(lifecycle.dispose);
  return sync;
});

/// Covers the app when the signed-in account is declared under 13 (docs/APPLE-INTEGRATIONS-PLAN.md §5.2).
class Under13BlockedGate extends ConsumerWidget {
  const Under13BlockedGate({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocked = ref.watch(isUnder13BlockedProvider);
    final signedIn = ref.watch(signedInProvider).value == true;
    if (!blocked || !signedIn) return child;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      key: const Key('under13BlockedGate'),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shield_outlined, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    l10n.under13Title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.under13Body,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    key: const Key('under13SignOut'),
                    onPressed: () => unawaited(ref.read(backendProvider).signOut()),
                    child: Text(l10n.signOut),
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
