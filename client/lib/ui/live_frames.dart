import 'package:material_ui/material_ui.dart';

/// Keeps live pictures (a computer's screen fetched every second or few) from piling up in
/// Flutter's image cache.
///
/// Each new frame is a new image provider, so the cache gives it an entry of its own. Nothing asks
/// for an old frame again, but the cache keeps finished images until it holds 1,000 of them or
/// 100 MB, and a full-screen frame decodes to about 9 MB. With screen cards refreshing every
/// second while bots work, the cache filled with dead frames and stayed full after the work ended
/// (the customer's build 117 report: 806 MB grew to 1,225 MB on Windows, 612 MB after a relaunch).
///
/// [track] the provider each build; once a different one is shown, the ones before it are evicted
/// after the frame (the widget showing the old picture keeps it until the new one is decoded, so
/// gapless playback still works). [dispose] evicts what's left when the widget goes.
class LiveFrames {
  final _shown = <ImageProvider>[];
  var _scheduled = false;

  /// The provider to show, remembered so it can be evicted once replaced.
  ImageProvider track(ImageProvider provider) {
    if (_shown.isNotEmpty && _shown.last == provider) return _shown.last;
    _shown.add(provider);
    if (_shown.length > 1 && !_scheduled) {
      _scheduled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scheduled = false;
        while (_shown.length > 1) {
          _shown.removeAt(0).evict();
        }
      });
    }
    return provider;
  }

  /// How many providers are remembered (the one shown, and any waiting to be evicted).
  @visibleForTesting
  int get tracked => _shown.length;

  void dispose() {
    for (final p in _shown) {
      p.evict();
    }
    _shown.clear();
  }
}
