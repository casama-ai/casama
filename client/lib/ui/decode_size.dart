import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

/// Decode a picture no larger than the box it fills (BoxFit.cover), so a 4000 px photo shown
/// as a 40 px avatar holds ~6 KB of pixels in memory instead of ~64 MB.
///
/// [width] and [height] are logical pixels; the device pixel ratio comes from [context]. A box
/// that isn't finite (unbounded layout) decodes the picture as it is.
ImageProvider coverDecode(
  BuildContext context,
  ImageProvider image, {
  required double width,
  required double height,
}) {
  if (!width.isFinite || !height.isFinite || width <= 0 || height <= 0) {
    return image;
  }
  final dpr = MediaQuery.maybeDevicePixelRatioOf(context) ?? 1;
  return CoverResizeImage(
    image,
    width: (width * dpr).ceil(),
    height: (height * dpr).ceil(),
  );
}

/// Decode a picture no wider than [width] logical pixels (BoxFit.fitWidth, or a box whose width
/// is known and whose height follows the picture).
ImageProvider widthDecode(
  BuildContext context,
  ImageProvider image, {
  required double width,
}) {
  if (!width.isFinite || width <= 0) return image;
  final dpr = MediaQuery.maybeDevicePixelRatioOf(context) ?? 1;
  return ResizeImage.resizeIfNeeded((width * dpr).ceil(), null, image);
}

/// Like [ResizeImage], but scaled so the picture still covers a [width] × [height] box
/// (BoxFit.cover): the shorter side matches the box, the aspect ratio is kept, and it is never
/// scaled up. [ResizeImage] with both sides stretches the picture; with one side, a picture of
/// the other shape ends up smaller than the box and blurry.
@immutable
class CoverResizeImage extends ImageProvider<CoverResizeKey> {
  const CoverResizeImage(
    this.imageProvider, {
    required this.width,
    required this.height,
  });

  final ImageProvider imageProvider;

  /// The box, in physical pixels.
  final int width, height;

  @override
  Future<CoverResizeKey> obtainKey(ImageConfiguration configuration) {
    // Kept synchronous when the inner key is, as ResizeImage does, so a picture already in the
    // cache shows on the first frame instead of flashing.
    Completer<CoverResizeKey>? completer;
    SynchronousFuture<CoverResizeKey>? result;
    imageProvider.obtainKey(configuration).then((Object key) {
      final k = CoverResizeKey._(key, width, height);
      if (completer == null) {
        result = SynchronousFuture<CoverResizeKey>(k);
      } else {
        completer.complete(k);
      }
    });
    if (result != null) return result!;
    completer = Completer<CoverResizeKey>();
    return completer.future;
  }

  @override
  ImageStreamCompleter loadImage(
    CoverResizeKey key,
    ImageDecoderCallback decode,
  ) {
    Future<ui.Codec> decodeCover(
      ui.ImmutableBuffer buffer, {
      ui.TargetImageSizeCallback? getTargetSize,
    }) {
      return decode(
        buffer,
        getTargetSize: (int w, int h) {
          final size = coverTargetSize(w, h, width, height);
          return ui.TargetImageSize(width: size.$1, height: size.$2);
        },
      );
    }

    return imageProvider.loadImage(key._inner, decodeCover);
  }

  @override
  bool operator ==(Object other) =>
      other is CoverResizeImage &&
      other.imageProvider == imageProvider &&
      other.width == width &&
      other.height == height;

  @override
  int get hashCode => Object.hash(imageProvider, width, height);
}

/// The decoded size of a [w] × [h] picture that covers a [boxW] × [boxH] box, never larger
/// than the picture itself.
@visibleForTesting
(int, int) coverTargetSize(int w, int h, int boxW, int boxH) {
  if (w <= 0 || h <= 0) return (w, h);
  final scale = math.max(boxW / w, boxH / h);
  if (scale >= 1) return (w, h);
  return (math.max(1, (w * scale).ceil()), math.max(1, (h * scale).ceil()));
}

@immutable
class CoverResizeKey {
  const CoverResizeKey._(this._inner, this._width, this._height);
  final Object _inner;
  final int _width, _height;

  @override
  bool operator ==(Object other) =>
      other is CoverResizeKey &&
      other._inner == _inner &&
      other._width == _width &&
      other._height == _height;

  @override
  int get hashCode => Object.hash(_inner, _width, _height);
}
