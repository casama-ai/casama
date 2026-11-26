import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Apple Foundation Models on-device bridge (docs/APPLE-INTEGRATIONS-PLAN.md §7.3, §12.4).
/// Generates chat titles on-device when `SystemLanguageModel.default.availability` is `.available`;
/// returns null on older OS versions or non-Apple platforms so the server fallback runs unchanged.
class OnDeviceModelService {
  OnDeviceModelService({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/on_device_model');

  final MethodChannel _channel;

  bool get _isApple =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  Future<bool> isAvailable() async {
    if (!_isApple) return false;
    try {
      return await _channel.invokeMethod<bool>('isAvailable') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<String?> generateTitle(String firstMessage) async {
    final trimmed = firstMessage.trim();
    if (!_isApple || trimmed.isEmpty) return null;
    try {
      final title = await _channel.invokeMethod<String>('generateTitle', {
        'message': trimmed,
      });
      final clean = title?.trim();
      return (clean != null && clean.isNotEmpty) ? clean : null;
    } catch (_) {
      return null;
    }
  }
}

final onDeviceModelProvider = Provider<OnDeviceModelService>(
  (ref) => OnDeviceModelService(),
);
