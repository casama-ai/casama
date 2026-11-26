import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AlarmKit Dart client (docs/APPLE-INTEGRATIONS-PLAN.md §7.1).
class AlarmKitClient {
  AlarmKitClient({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/alarm_kit');

  final MethodChannel _channel;

  bool get _isIos => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  Future<bool> isSupported() async {
    if (!_isIos) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> requestPermission() async {
    if (!_isIos) return false;
    try {
      return await _channel.invokeMethod<bool>('requestPermission') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<Map<String, Object?>> execute(
    String action,
    Map<String, Object?> params,
  ) async {
    final method = switch (action) {
      'alarm.set' => 'set',
      'alarm.list' => 'list',
      'alarm.cancel' => 'cancel',
      _ => throw UnsupportedError('Unknown alarm action: $action'),
    };
    final res = await _channel.invokeMapMethod<String, Object?>(method, params);
    return res ?? const {'ok': true};
  }
}

/// HomeKit Dart client (docs/APPLE-INTEGRATIONS-PLAN.md §7.4).
class HomeKitClient {
  HomeKitClient({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('casama/home_kit');

  final MethodChannel _channel;

  bool get _isIos => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  Future<bool> isSupported() async {
    if (!_isIos) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> requestPermission() async {
    if (!_isIos) return false;
    try {
      return await _channel.invokeMethod<bool>('requestPermission') ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<Map<String, Object?>> execute(
    String action,
    Map<String, Object?> params,
  ) async {
    final method = switch (action) {
      'home.list' => 'list',
      'home.read' => 'read',
      'home.set' => 'set',
      _ => throw UnsupportedError('Unknown home action: $action'),
    };
    final res = await _channel.invokeMapMethod<String, Object?>(method, params);
    return res ?? const {'ok': true};
  }
}

final alarmKitClientProvider = Provider<AlarmKitClient>(
  (ref) => AlarmKitClient(),
);
final homeKitClientProvider = Provider<HomeKitClient>((ref) => HomeKitClient());
