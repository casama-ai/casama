import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../l10n/generated/app_localizations.dart';

/// Focus Filter state (docs/APPLE-INTEGRATIONS-PLAN.md §6.1).
/// Driven by `CasamaFocusFilter` (`SetFocusFilterIntent`) over `casama/siri` `focusFilter`.
@immutable
class FocusFilterState {
  const FocusFilterState({
    this.active = false,
    this.botIds = const {},
    this.holdCheckIns = false,
    this.showAllOverride = false,
  });

  final bool active;
  final Set<String> botIds;
  final bool holdCheckIns;
  final bool showAllOverride;

  bool get isFilteringBots => active && botIds.isNotEmpty && !showAllOverride;

  List<T> filterBots<T>(List<T> bots, String Function(T) idOf) {
    if (!isFilteringBots) return bots;
    return bots.where((b) => botIds.contains(idOf(b))).toList(growable: false);
  }

  /// Chats with several bots (group chats): kept when any of their bots is one the Focus chose.
  List<T> filterGroups<T>(List<T> groups, Iterable<String> Function(T) botIdsOf) {
    if (!isFilteringBots) return groups;
    return groups
        .where((g) => botIdsOf(g).any(botIds.contains))
        .toList(growable: false);
  }

  FocusFilterState copyWith({
    bool? active,
    Set<String>? botIds,
    bool? holdCheckIns,
    bool? showAllOverride,
  }) {
    return FocusFilterState(
      active: active ?? this.active,
      botIds: botIds ?? this.botIds,
      holdCheckIns: holdCheckIns ?? this.holdCheckIns,
      showAllOverride: showAllOverride ?? this.showAllOverride,
    );
  }
}

class FocusFilterNotifier extends Notifier<FocusFilterState> {
  @override
  FocusFilterState build() => const FocusFilterState();

  void applyNativePayload(Map<String, Object?> payload) {
    final active = payload['active'] == true;
    final rawIds = payload['bot_ids'];
    final ids = <String>{};
    if (rawIds is List) {
      for (final item in rawIds) {
        if (item is String && item.isNotEmpty) ids.add(item);
      }
    }
    final hold = payload['hold_check_ins'] == true;
    state = FocusFilterState(
      active: active,
      botIds: ids,
      holdCheckIns: hold,
      showAllOverride: false,
    );
  }

  void toggleShowAll() {
    state = state.copyWith(showAllOverride: !state.showAllOverride);
  }

  void clear() {
    state = const FocusFilterState();
  }
}

final focusFilterProvider =
    NotifierProvider<FocusFilterNotifier, FocusFilterState>(
      FocusFilterNotifier.new,
    );

/// How long a failed hold or release waits before it is tried again, in order. After the last one
/// it waits for the next Focus change or sign-in.
const focusHoldRetryDelays = [
  Duration(seconds: 5),
  Duration(seconds: 30),
  Duration(minutes: 2),
  Duration(minutes: 10),
];

/// How long one hold lasts on the server, and how often it is renewed while the Focus stays on: a
/// phone that dies mid-Focus doesn't hold check-ins for long.
const focusHoldFor = Duration(hours: 4);
const focusHoldRenewEvery = Duration(hours: 2);

/// Syncs `FocusFilterState.holdCheckIns` to `PATCH /v1/devices/{id}` (`quiet_until`), holding
/// proactive check-in pushes while a Focus mode is active and releasing them when Focus ends. A
/// failed hold or release (offline, or this device not registered for pushes yet) is logged and
/// tried again, a few times with growing waits.
final focusFilterSyncProvider = Provider<void>((ref) {
  Timer? refreshTimer;
  Timer? retryTimer;
  var hadHold = false;
  // Each change starts a new round; a retry or renewal from an older round does nothing.
  var round = 0;

  Future<void> send(DateTime? Function() until, int forRound, int attempt) async {
    if (forRound != round || !ref.mounted) return;
    final backend = ref.read(backendProvider);
    if (backend.userId == null) return;
    Object? failure;
    try {
      if (await backend.updateCurrentDeviceQuiet(until())) return;
      failure = 'this device is not registered for pushes yet';
    } catch (e) {
      failure = e;
    }
    if (forRound != round || !ref.mounted) return;
    if (attempt >= focusHoldRetryDelays.length) {
      debugPrint('focus hold failed, giving up until the next change: $failure');
      return;
    }
    final wait = focusHoldRetryDelays[attempt];
    debugPrint('focus hold failed, trying again in ${wait.inSeconds}s: $failure');
    retryTimer?.cancel();
    retryTimer = Timer(wait, () => unawaited(send(until, forRound, attempt + 1)));
  }

  Future<void> sync(FocusFilterState filter) async {
    final current = ++round;
    refreshTimer?.cancel();
    refreshTimer = null;
    retryTimer?.cancel();
    retryTimer = null;
    final backend = ref.read(backendProvider);
    if (backend.userId == null) return;
    final shouldHold = filter.active && filter.holdCheckIns;
    if (shouldHold) {
      hadHold = true;
      DateTime holdUntil() => DateTime.now().toUtc().add(focusHoldFor);
      await send(holdUntil, current, 0);
      if (current != round || !ref.mounted) return;
      refreshTimer = Timer.periodic(focusHoldRenewEvery, (_) {
        unawaited(send(holdUntil, current, 0));
      });
    } else if (hadHold) {
      hadHold = false;
      await send(() => null, current, 0);
    }
  }

  ref.listen<FocusFilterState>(focusFilterProvider, (_, next) {
    unawaited(sync(next));
  }, fireImmediately: true);

  ref.listen(signedInProvider, (_, next) {
    if (next.value == true) {
      unawaited(sync(ref.read(focusFilterProvider)));
    }
  });

  ref.onDispose(() {
    refreshTimer?.cancel();
    retryTimer?.cancel();
  });
});

/// Chip shown at the top of the Bots / Chats list while a Focus Filter is active.
class FocusFilterChip extends ConsumerWidget {
  const FocusFilterChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(focusFilterProvider);
    if (!filter.active || filter.botIds.isEmpty) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context);
    final label = filter.showAllOverride
        ? l10n.focusFilterShowingAll
        : l10n.focusFilterShown(filter.botIds.length);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ActionChip(
          key: const Key('focusFilterChip'),
          avatar: Icon(
            filter.showAllOverride ? Icons.visibility : Icons.filter_list,
            size: 16,
          ),
          label: Text(label),
          onPressed: () =>
              ref.read(focusFilterProvider.notifier).toggleShowAll(),
        ),
      ),
    );
  }
}
