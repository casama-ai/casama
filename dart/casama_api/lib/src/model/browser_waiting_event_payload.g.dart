// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_waiting_event_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserWaitingEventPayloadCWProxy {
  BrowserWaitingEventPayload deviceSystem(
    BrowserWaitingEventPayloadDeviceSystemEnum? deviceSystem,
  );

  BrowserWaitingEventPayload host(String? host);

  BrowserWaitingEventPayload expiresAt(DateTime expiresAt);

  BrowserWaitingEventPayload handBack(bool? handBack);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserWaitingEventPayload call({
    BrowserWaitingEventPayloadDeviceSystemEnum? deviceSystem,
    String? host,
    DateTime expiresAt,
    bool? handBack,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserWaitingEventPayload.copyWith(...)` or call `instanceOfBrowserWaitingEventPayload.copyWith.fieldName(value)` for a single field.
class _$BrowserWaitingEventPayloadCWProxyImpl
    implements _$BrowserWaitingEventPayloadCWProxy {
  const _$BrowserWaitingEventPayloadCWProxyImpl(this._value);

  final BrowserWaitingEventPayload _value;

  @override
  BrowserWaitingEventPayload deviceSystem(
    BrowserWaitingEventPayloadDeviceSystemEnum? deviceSystem,
  ) => call(deviceSystem: deviceSystem);

  @override
  BrowserWaitingEventPayload host(String? host) => call(host: host);

  @override
  BrowserWaitingEventPayload expiresAt(DateTime expiresAt) =>
      call(expiresAt: expiresAt);

  @override
  BrowserWaitingEventPayload handBack(bool? handBack) =>
      call(handBack: handBack);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserWaitingEventPayload call({
    Object? deviceSystem = const $CopyWithPlaceholder(),
    Object? host = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? handBack = const $CopyWithPlaceholder(),
  }) {
    return BrowserWaitingEventPayload(
      deviceSystem: deviceSystem == const $CopyWithPlaceholder()
          ? _value.deviceSystem
          // ignore: cast_nullable_to_non_nullable
          : deviceSystem as BrowserWaitingEventPayloadDeviceSystemEnum?,
      host: host == const $CopyWithPlaceholder()
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as String?,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      handBack: handBack == const $CopyWithPlaceholder()
          ? _value.handBack
          // ignore: cast_nullable_to_non_nullable
          : handBack as bool?,
    );
  }
}

extension $BrowserWaitingEventPayloadCopyWith on BrowserWaitingEventPayload {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserWaitingEventPayload.copyWith(...)` or `instanceOfBrowserWaitingEventPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserWaitingEventPayloadCWProxy get copyWith =>
      _$BrowserWaitingEventPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserWaitingEventPayload _$BrowserWaitingEventPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BrowserWaitingEventPayload',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['device_system', 'host', 'expires_at'],
    );
    final val = BrowserWaitingEventPayload(
      deviceSystem: $checkedConvert(
        'device_system',
        (v) => $enumDecodeNullable(
          _$BrowserWaitingEventPayloadDeviceSystemEnumEnumMap,
          v,
        ),
      ),
      host: $checkedConvert('host', (v) => v as String?),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      handBack: $checkedConvert('hand_back', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'deviceSystem': 'device_system',
    'expiresAt': 'expires_at',
    'handBack': 'hand_back',
  },
);

Map<String, dynamic> _$BrowserWaitingEventPayloadToJson(
  BrowserWaitingEventPayload instance,
) => <String, dynamic>{
  'device_system':
      _$BrowserWaitingEventPayloadDeviceSystemEnumEnumMap[instance
          .deviceSystem],
  'host': instance.host,
  'expires_at': instance.expiresAt.toIso8601String(),
  'hand_back': ?instance.handBack,
};

const _$BrowserWaitingEventPayloadDeviceSystemEnumEnumMap = {
  BrowserWaitingEventPayloadDeviceSystemEnum.ios: 'ios',
  BrowserWaitingEventPayloadDeviceSystemEnum.android: 'android',
  BrowserWaitingEventPayloadDeviceSystemEnum.macos: 'macos',
  BrowserWaitingEventPayloadDeviceSystemEnum.linux: 'linux',
  BrowserWaitingEventPayloadDeviceSystemEnum.windows: 'windows',
};
