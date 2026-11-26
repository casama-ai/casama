import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

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
/// framework on iOS every 30 days when supported.
final ageBandSyncProvider = Provider<void>((ref) {
  Future<void> sync() async {
    final backend = ref.read(backendProvider);
    if (backend.userId == null) {
      ref.read(ageBandProvider.notifier).setBand(AgeBand.unknown);
      return;
    }
    DateTime? updatedAt;
    try {
      final me = await backend.getMe();
      if (!ref.mounted) return;
      final existing = AgeBand.fromApi(me?.accountAgeBand?.value);
      ref.read(ageBandProvider.notifier).setBand(existing);
      updatedAt = me?.accountAgeBandUpdatedAt;
    } catch (_) {}

    final service = ref.read(ageRangeServiceProvider);
    if (!AgeRangeService.needsRefresh(updatedAt)) return;
    if (!await service.isSupported()) return;
    final band = await service.requestAgeRange();
    if (!ref.mounted || band == null || band == AgeBand.unknown) return;
    ref.read(ageBandProvider.notifier).setBand(band);
    try {
      await backend.setMyAgeBand(band.toApi());
    } catch (_) {}
  }

  ref.listen(signedInProvider, (_, next) {
    if (next.value == true) {
      unawaited(sync());
    } else if (next.value == false) {
      ref.read(ageBandProvider.notifier).setBand(AgeBand.unknown);
    }
  }, fireImmediately: true);
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
                    'Casama is for people 13 and older',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'This account cannot use Casama based on its declared age range. You can sign out or export your data from another account.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    key: const Key('under13SignOut'),
                    onPressed: () => unawaited(ref.read(backendProvider).signOut()),
                    child: const Text('Sign out'),
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
