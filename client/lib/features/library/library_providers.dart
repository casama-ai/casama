import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/providers.dart';

/// How the Library orders things (Phase 4): newest first, recently opened by this person, or A to Z.
enum LibrarySort { newest, opened, name }

/// What the Library shows: one kind (null for all), one bot (null for any), one project (null for
/// any), the words typed, the order, and whether only what was made for this person ([mine]).
typedef LibraryQuery = ({
  CreationKind? kind,
  String? botId,
  String? projectId,
  String q,
  LibrarySort sort,
  bool mine,
});

/// One loaded run of the Library: the items so far, the workspace's kinds (for the chips), and
/// the cursor for the next page.
class LibraryPage {
  const LibraryPage({
    required this.items,
    required this.kinds,
    this.next,
    this.loadingMore = false,
  });
  final List<Creation> items;
  final List<CreationKind> kinds;
  final String? next;
  final bool loadingMore;

  LibraryPage copyWith({
    List<Creation>? items,
    List<CreationKind>? kinds,
    String? next,
    bool clearNext = false,
    bool? loadingMore,
  }) => LibraryPage(
    items: items ?? this.items,
    kinds: kinds ?? this.kinds,
    next: clearNext ? null : (next ?? this.next),
    loadingMore: loadingMore ?? this.loadingMore,
  );
}

/// The Library's list for a [LibraryQuery], 60 at a time (D-274's `GET /v1/creations`).
class LibraryNotifier extends AsyncNotifier<LibraryPage> {
  LibraryNotifier(this.query);
  final LibraryQuery query;

  static const pageSize = 60;

  @override
  Future<LibraryPage> build() async {
    final orgId = ref.watch(currentOrgIdProvider);
    if (orgId == null) return const LibraryPage(items: [], kinds: []);
    final list = await ref
        .watch(backendProvider)
        .creations(
          orgId,
          kind: query.kind,
          botId: query.botId,
          projectId: query.projectId,
          q: query.q,
          recentlyOpened: query.sort == LibrarySort.opened,
          byName: query.sort == LibrarySort.name,
          mine: query.mine,
          limit: pageSize,
        );
    return LibraryPage(
      items: list.items,
      kinds: list.kinds,
      next: list.nextCursor,
    );
  }

  /// The next page, when there is one and none is loading.
  Future<void> loadMore() async {
    final current = state.value;
    final orgId = ref.read(currentOrgIdProvider);
    if (current == null ||
        current.next == null ||
        current.loadingMore ||
        orgId == null) {
      return;
    }
    state = AsyncData(current.copyWith(loadingMore: true));
    try {
      final list = await ref
          .read(backendProvider)
          .creations(
            orgId,
            kind: query.kind,
            botId: query.botId,
            projectId: query.projectId,
            q: query.q,
          recentlyOpened: query.sort == LibrarySort.opened,
          byName: query.sort == LibrarySort.name,
          mine: query.mine,
            cursor: current.next,
            limit: pageSize,
          );
      final seen = {for (final c in current.items) c.id};
      state = AsyncData(
        current.copyWith(
          items: [
            ...current.items,
            for (final c in list.items)
              if (!seen.contains(c.id)) c,
          ],
          next: list.nextCursor,
          clearNext: list.nextCursor == null,
          loadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(loadingMore: false));
    }
  }

  /// Puts a changed creation in place (renamed, pinned), takes it out (deleted), or puts it back
  /// where it belongs, newest first (Undo).
  void replace(Creation c, {bool removed = false}) {
    final current = state.value;
    if (current == null) return;
    final List<Creation> items;
    if (removed) {
      items = [
        for (final x in current.items)
          if (x.id != c.id) x,
      ];
    } else if (current.items.any((x) => x.id == c.id)) {
      items = [for (final x in current.items) x.id == c.id ? c : x];
    } else {
      items = [...current.items, c]
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
    state = AsyncData(current.copyWith(items: items));
  }
}

final libraryProvider = AsyncNotifierProvider.autoDispose
    .family<LibraryNotifier, LibraryPage, LibraryQuery>(LibraryNotifier.new);

/// One creation with the others from the same run.
final creationProvider = FutureProvider.autoDispose
    .family<CreationDetail, String>(
      (ref, id) => ref.watch(backendProvider).creation(id),
    );

/// Whether the workspace has more than one person, so the Library offers Mine or Workspace.
final libraryHasTeamProvider = FutureProvider.autoDispose<bool>((ref) async {
  final orgId = ref.watch(currentOrgIdProvider);
  if (orgId == null) return false;
  try {
    return (await ref.watch(backendProvider).members(orgId)).length > 1;
  } catch (_) {
    return false;
  }
});

/// When this person last had the Library open on this device (LIBRARY-PLAN §5.1, "a dot, not a
/// count"). Null until it has been opened once, so a first launch shows no dot.
class LibrarySeen extends Notifier<DateTime?> {
  static const _key = 'library.lastSeen';

  @override
  DateTime? build() {
    SharedPreferences.getInstance()
        .then((p) {
          final v = DateTime.tryParse(p.getString(_key) ?? '');
          if (v != null && (state == null || v.isAfter(state!))) state = v;
        })
        .catchError((Object _) {});
    return null;
  }

  /// The Library is open now: nothing made until this moment is new.
  void markNow() {
    final now = DateTime.now().toUtc();
    state = now;
    SharedPreferences.getInstance()
        .then((p) => p.setString(_key, now.toIso8601String()))
        .catchError((Object _) => false);
  }
}

final librarySeenProvider = NotifierProvider<LibrarySeen, DateTime?>(
  LibrarySeen.new,
);

/// Whether something was made since the Library was last open: the dot on its tab. Checks the
/// newest item again every two minutes while the app runs.
final libraryHasNewProvider = FutureProvider<bool>((ref) async {
  final seen = ref.watch(librarySeenProvider);
  final orgId = ref.watch(currentOrgIdProvider);
  if (seen == null || orgId == null) return false;
  final timer = Timer(const Duration(minutes: 2), ref.invalidateSelf);
  ref.onDispose(timer.cancel);
  try {
    final newest = (await ref
            .watch(backendProvider)
            .creations(orgId, limit: 1))
        .items
        .firstOrNull;
    return newest != null && newest.createdAt.toUtc().isAfter(seen);
  } catch (_) {
    return false;
  }
});
