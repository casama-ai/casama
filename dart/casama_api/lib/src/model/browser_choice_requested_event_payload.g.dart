// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_choice_requested_event_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserChoiceRequestedEventPayloadCWProxy {
  BrowserChoiceRequestedEventPayload choiceId(String choiceId);

  BrowserChoiceRequestedEventPayload host(String host);

  BrowserChoiceRequestedEventPayload reason(
    BrowserChoiceRequestedEventPayloadReasonEnum reason,
  );

  BrowserChoiceRequestedEventPayload deviceSystem(
    BrowserChoiceRequestedEventPayloadDeviceSystemEnum? deviceSystem,
  );

  BrowserChoiceRequestedEventPayload hasChrome(bool hasChrome);

  BrowserChoiceRequestedEventPayload expiresAt(DateTime expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceRequestedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceRequestedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserChoiceRequestedEventPayload call({
    String choiceId,
    String host,
    BrowserChoiceRequestedEventPayloadReasonEnum reason,
    BrowserChoiceRequestedEventPayloadDeviceSystemEnum? deviceSystem,
    bool hasChrome,
    DateTime expiresAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserChoiceRequestedEventPayload.copyWith(...)` or call `instanceOfBrowserChoiceRequestedEventPayload.copyWith.fieldName(value)` for a single field.
class _$BrowserChoiceRequestedEventPayloadCWProxyImpl
    implements _$BrowserChoiceRequestedEventPayloadCWProxy {
  const _$BrowserChoiceRequestedEventPayloadCWProxyImpl(this._value);

  final BrowserChoiceRequestedEventPayload _value;

  @override
  BrowserChoiceRequestedEventPayload choiceId(String choiceId) =>
      call(choiceId: choiceId);

  @override
  BrowserChoiceRequestedEventPayload host(String host) => call(host: host);

  @override
  BrowserChoiceRequestedEventPayload reason(
    BrowserChoiceRequestedEventPayloadReasonEnum reason,
  ) => call(reason: reason);

  @override
  BrowserChoiceRequestedEventPayload deviceSystem(
    BrowserChoiceRequestedEventPayloadDeviceSystemEnum? deviceSystem,
  ) => call(deviceSystem: deviceSystem);

  @override
  BrowserChoiceRequestedEventPayload hasChrome(bool hasChrome) =>
      call(hasChrome: hasChrome);

  @override
  BrowserChoiceRequestedEventPayload expiresAt(DateTime expiresAt) =>
      call(expiresAt: expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceRequestedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceRequestedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserChoiceRequestedEventPayload call({
    Object? choiceId = const $CopyWithPlaceholder(),
    Object? host = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? deviceSystem = const $CopyWithPlaceholder(),
    Object? hasChrome = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return BrowserChoiceRequestedEventPayload(
      choiceId: choiceId == const $CopyWithPlaceholder() || choiceId == null
          ? _value.choiceId
          // ignore: cast_nullable_to_non_nullable
          : choiceId as String,
      host: host == const $CopyWithPlaceholder() || host == null
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as String,
      reason: reason == const $CopyWithPlaceholder() || reason == null
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as BrowserChoiceRequestedEventPayloadReasonEnum,
      deviceSystem: deviceSystem == const $CopyWithPlaceholder()
          ? _value.deviceSystem
          // ignore: cast_nullable_to_non_nullable
          : deviceSystem as BrowserChoiceRequestedEventPayloadDeviceSystemEnum?,
      hasChrome: hasChrome == const $CopyWithPlaceholder() || hasChrome == null
          ? _value.hasChrome
          // ignore: cast_nullable_to_non_nullable
          : hasChrome as bool,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $BrowserChoiceRequestedEventPayloadCopyWith
    on BrowserChoiceRequestedEventPayload {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserChoiceRequestedEventPayload.copyWith(...)` or `instanceOfBrowserChoiceRequestedEventPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserChoiceRequestedEventPayloadCWProxy get copyWith =>
      _$BrowserChoiceRequestedEventPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserChoiceRequestedEventPayload _$BrowserChoiceRequestedEventPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BrowserChoiceRequestedEventPayload',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'choice_id',
        'host',
        'reason',
        'device_system',
        'has_chrome',
        'expires_at',
      ],
    );
    final val = BrowserChoiceRequestedEventPayload(
      choiceId: $checkedConvert('choice_id', (v) => v as String),
      host: $checkedConvert('host', (v) => v as String),
      reason: $checkedConvert(
        'reason',
        (v) => $enumDecode(
          _$BrowserChoiceRequestedEventPayloadReasonEnumEnumMap,
          v,
        ),
      ),
      deviceSystem: $checkedConvert(
        'device_system',
        (v) => $enumDecodeNullable(
          _$BrowserChoiceRequestedEventPayloadDeviceSystemEnumEnumMap,
          v,
        ),
      ),
      hasChrome: $checkedConvert('has_chrome', (v) => v as bool),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'choiceId': 'choice_id',
    'deviceSystem': 'device_system',
    'hasChrome': 'has_chrome',
    'expiresAt': 'expires_at',
  },
);

Map<String, dynamic> _$BrowserChoiceRequestedEventPayloadToJson(
  BrowserChoiceRequestedEventPayload instance,
) => <String, dynamic>{
  'choice_id': instance.choiceId,
  'host': instance.host,
  'reason':
      _$BrowserChoiceRequestedEventPayloadReasonEnumEnumMap[instance.reason]!,
  'device_system':
      _$BrowserChoiceRequestedEventPayloadDeviceSystemEnumEnumMap[instance
          .deviceSystem],
  'has_chrome': instance.hasChrome,
  'expires_at': instance.expiresAt.toIso8601String(),
};

const _$BrowserChoiceRequestedEventPayloadReasonEnumEnumMap = {
  BrowserChoiceRequestedEventPayloadReasonEnum.signIn: 'sign_in',
  BrowserChoiceRequestedEventPayloadReasonEnum.blocked: 'blocked',
};

const _$BrowserChoiceRequestedEventPayloadDeviceSystemEnumEnumMap = {
  BrowserChoiceRequestedEventPayloadDeviceSystemEnum.ios: 'ios',
  BrowserChoiceRequestedEventPayloadDeviceSystemEnum.android: 'android',
  BrowserChoiceRequestedEventPayloadDeviceSystemEnum.macos: 'macos',
  BrowserChoiceRequestedEventPayloadDeviceSystemEnum.linux: 'linux',
  BrowserChoiceRequestedEventPayloadDeviceSystemEnum.windows: 'windows',
};
