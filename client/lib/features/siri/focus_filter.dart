import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';

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

/// Syncs `FocusFilterState.holdCheckIns` to `PATCH /v1/devices/{id}` (`quiet_until`), holding
/// proactive check-in pushes while a Focus mode is active and releasing them when Focus ends.
final focusFilterSyncProvider = Provider<void>((ref) {
  Timer? refreshTimer;
  var hadHold = false;

  Future<void> sync(FocusFilterState filter) async {
    refreshTimer?.cancel();
    refreshTimer = null;
    final backend = ref.read(backendProvider);
    if (backend.userId == null) return;
    final shouldHold = filter.active && filter.holdCheckIns;
    if (shouldHold) {
      hadHold = true;
      final until = DateTime.now().toUtc().add(const Duration(hours: 4));
      try {
        await backend.updateCurrentDeviceQuiet(until);
      } catch (_) {}
      refreshTimer = Timer.periodic(const Duration(hours: 2), (_) {
        final next = DateTime.now().toUtc().add(const Duration(hours: 4));
        unawaited(backend.updateCurrentDeviceQuiet(next).catchError((_) {}));
      });
    } else if (hadHold) {
      hadHold = false;
      try {
        await backend.updateCurrentDeviceQuiet(null);
      } catch (_) {}
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
    final label = filter.showAllOverride
        ? 'Focus filter · Showing all'
        : 'Focus filter · ${filter.botIds.length} shown';
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
