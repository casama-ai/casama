import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/floating_tab_chrome.dart';

/// The sound engine behind the mini player, so tests can stand in for the platform player.
abstract class MiniAudio {
  Future<void> load(Uri url, Map<String, String> headers);
  Future<void> play();
  Future<void> pause();
  Future<void> seek(Duration to);
  Future<void> dispose();
  Stream<bool> get playing;
  Stream<bool> get completed;
  Stream<Duration> get position;
  Stream<Duration?> get duration;
}

class _JustAudio implements MiniAudio {
  final _player = AudioPlayer();

  @override
  Future<void> load(Uri url, Map<String, String> headers) =>
      _player.setUrl(url.toString(), headers: headers);
  @override
  Future<void> play() async => unawaited(_player.play());
  @override
  Future<void> pause() => _player.pause();
  @override
  Future<void> seek(Duration to) => _player.seek(to);
  @override
  Future<void> dispose() => _player.dispose();
  @override
  Stream<bool> get playing => _player.playerStateStream.map(
    (s) => s.playing && s.processingState != ProcessingState.completed,
  );
  @override
  Stream<bool> get completed =>
      _player.processingStateStream.map((s) => s == ProcessingState.completed);
  @override
  Stream<Duration> get position => _player.positionStream;
  @override
  Stream<Duration?> get duration => _player.durationStream;
}

final miniAudioProvider = Provider<MiniAudio Function()>((_) => _JustAudio.new);

/// What the mini player is playing.
@immutable
class NowPlayingState {
  const NowPlayingState({
    required this.creation,
    this.playing = false,
    this.loading = true,
    this.position = Duration.zero,
    this.duration,
  });
  final Creation creation;
  final bool playing;
  final bool loading;
  final Duration position;
  final Duration? duration;

  NowPlayingState copyWith({
    bool? playing,
    bool? loading,
    Duration? position,
    Duration? duration,
  }) => NowPlayingState(
    creation: creation,
    playing: playing ?? this.playing,
    loading: loading ?? this.loading,
    position: position ?? this.position,
    duration: duration ?? this.duration,
  );
}

/// One sound from the Library playing while the person moves around the app (LIBRARY-PLAN §5.3,
/// Phase 4). Starting another replaces it; closing the bar stops it.
class NowPlaying extends Notifier<NowPlayingState?> {
  MiniAudio? _audio;
  final _subs = <StreamSubscription<Object?>>[];

  @override
  NowPlayingState? build() {
    ref.onDispose(_release);
    return null;
  }

  void _release() {
    for (final s in _subs) {
      unawaited(s.cancel());
    }
    _subs.clear();
    final a = _audio;
    _audio = null;
    if (a != null) unawaited(a.dispose().catchError((Object _) {}));
  }

  /// Plays [c] from the start (a picture or video is ignored).
  Future<void> play(Creation c) async {
    if (c.kind != CreationKind.audio) return;
    if (state?.creation.id == c.id) {
      if (!(state?.playing ?? false)) await toggle();
      return;
    }
    _release();
    final backend = ref.read(backendProvider);
    final audio = ref.read(miniAudioProvider)();
    _audio = audio;
    final seconds = c.durationS;
    state = NowPlayingState(
      creation: c,
      duration: seconds == null
          ? null
          : Duration(milliseconds: (seconds * 1000).round()),
    );
    _subs
      ..add(
        audio.playing.listen((p) {
          if (_audio == audio) state = state?.copyWith(playing: p);
        }),
      )
      ..add(
        audio.position.listen((p) {
          if (_audio == audio) state = state?.copyWith(position: p);
        }),
      )
      ..add(
        audio.duration.listen((d) {
          if (_audio == audio && d != null) {
            state = state?.copyWith(duration: d);
          }
        }),
      )
      ..add(
        audio.completed.listen((done) {
          if (_audio != audio || !done) return;
          // Finished: back to the start, paused, still on the bar to play again.
          unawaited(audio.pause().then((_) => audio.seek(Duration.zero)));
        }),
      );
    try {
      final url = c.mediaId != null
          ? backend.chatMediaUrl(c.mediaId!)
          : backend.creationContentUrl(c.id);
      await audio.load(Uri.parse(url), backend.authHeaders);
      if (_audio != audio) return;
      state = state?.copyWith(loading: false);
      await audio.play();
    } catch (_) {
      if (_audio == audio) stop();
    }
  }

  Future<void> toggle() async {
    final audio = _audio;
    final s = state;
    if (audio == null || s == null) return;
    s.playing ? await audio.pause() : await audio.play();
  }

  Future<void> seek(Duration to) async => _audio?.seek(to);

  void stop() {
    _release();
    state = null;
  }
}

final nowPlayingProvider = NotifierProvider<NowPlaying, NowPlayingState?>(
  NowPlaying.new,
);

String _clock(Duration d) =>
    '${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';

/// The mini player: the sound's title and bot, play or pause, how far along, and close. A tap on
/// the title opens the item in the Library. Draws nothing when nothing plays.
class MiniPlayerBar extends ConsumerWidget {
  const MiniPlayerBar({
    super.key,
    this.inline = false,
    this.padding = EdgeInsets.zero,
  });

  /// Space around the bar, only while it shows.
  final EdgeInsetsGeometry padding;

  /// Inside a page (the item's own detail) rather than floating over the app.
  final bool inline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(nowPlayingProvider);
    if (s == null) return const SizedBox.shrink();
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final player = ref.read(nowPlayingProvider.notifier);
    final total = s.duration;
    final progress = total == null || total.inMilliseconds == 0
        ? 0.0
        : (s.position.inMilliseconds / total.inMilliseconds).clamp(0.0, 1.0);
    return Padding(
      padding: padding,
      child: Material(
        key: const Key('miniPlayer'),
        color: inline
            ? scheme.surfaceContainerLow
            : scheme.surfaceContainerHigh,
        elevation: inline ? 0 : 6,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardAll,
          side: BorderSide(color: context.appColors.hairline),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: AppSpace.xs),
                IconButton(
                  key: const Key('miniPlayerToggle'),
                  tooltip: s.playing ? l10n.pause : l10n.playMedia,
                  onPressed: s.loading ? null : player.toggle,
                  icon: s.loading
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Icon(
                          s.playing ? LucideIcons.pause : LucideIcons.play,
                          size: 20,
                        ),
                ),
                Expanded(
                  child: InkWell(
                    key: const Key('miniPlayerOpen'),
                    onTap: inline
                        ? null
                        : () => context.pushOnce('/library/${s.creation.id}'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpace.xs,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            s.creation.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            [
                              if ((s.creation.botName ?? '').isNotEmpty)
                                s.creation.botName!,
                              total == null
                                  ? _clock(s.position)
                                  : '${_clock(s.position)} / ${_clock(total)}',
                            ].join(' · '),
                            maxLines: 1,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                              fontFeatures: AppText.tabular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  key: const Key('miniPlayerClose'),
                  tooltip: l10n.close,
                  onPressed: player.stop,
                  icon: const Icon(LucideIcons.x, size: 18),
                ),
              ],
            ),
            LinearProgressIndicator(
              value: progress,
              minHeight: 2,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

/// Where the mini player floats on phones and tablets: above the tab pill on a tab's list, out
/// of the way (hidden) on pages opened from it, where a composer or a form sits at the bottom.
class MiniPlayerDock extends ConsumerWidget {
  const MiniPlayerDock({
    super.key,
    required this.show,
    required this.aboveTabs,
  });
  final bool show;
  final bool aboveTabs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playing = ref.watch(nowPlayingProvider) != null;
    if (!playing || !show) return const SizedBox.shrink();
    final media = MediaQuery.of(context);
    final bottom = aboveTabs
        ? FloatingTabChrome.bottomInset(context) + AppSpace.xs
        : media.padding.bottom + AppSpace.md;
    return Positioned(
      left: AppSpace.gutter,
      right: AppSpace.gutter,
      bottom: bottom,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: const MiniPlayerBar(),
        ),
      ),
    );
  }
}
