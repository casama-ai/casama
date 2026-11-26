// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_action_access_requested_event_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceActionAccessRequestedEventPayloadCWProxy {
  DeviceActionAccessRequestedEventPayload kind(
    DeviceActionAccessRequestedEventPayloadKindEnum kind,
  );

  DeviceActionAccessRequestedEventPayload reason(String reason);

  DeviceActionAccessRequestedEventPayload botId(String botId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeviceActionAccessRequestedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeviceActionAccessRequestedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  DeviceActionAccessRequestedEventPayload call({
    DeviceActionAccessRequestedEventPayloadKindEnum kind,
    String reason,
    String botId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDeviceActionAccessRequestedEventPayload.copyWith(...)` or call `instanceOfDeviceActionAccessRequestedEventPayload.copyWith.fieldName(value)` for a single field.
class _$DeviceActionAccessRequestedEventPayloadCWProxyImpl
    implements _$DeviceActionAccessRequestedEventPayloadCWProxy {
  const _$DeviceActionAccessRequestedEventPayloadCWProxyImpl(this._value);

  final DeviceActionAccessRequestedEventPayload _value;

  @override
  DeviceActionAccessRequestedEventPayload kind(
    DeviceActionAccessRequestedEventPayloadKindEnum kind,
  ) => call(kind: kind);

  @override
  DeviceActionAccessRequestedEventPayload reason(String reason) =>
      call(reason: reason);

  @override
  DeviceActionAccessRequestedEventPayload botId(String botId) =>
      call(botId: botId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeviceActionAccessRequestedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeviceActionAccessRequestedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DeviceActionAccessRequestedEventPayload call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
  }) {
    return DeviceActionAccessRequestedEventPayload(
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as DeviceActionAccessRequestedEventPayloadKindEnum,
      reason: reason == const $CopyWithPlaceholder() || reason == null
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String,
      botId: botId == const $CopyWithPlaceholder() || botId == null
          ? _value.botId
          // ignore: cast_nullable_to_non_nullable
          : botId as String,
    );
  }
}

extension $DeviceActionAccessRequestedEventPayloadCopyWith
    on DeviceActionAccessRequestedEventPayload {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDeviceActionAccessRequestedEventPayload.copyWith(...)` or `instanceOfDeviceActionAccessRequestedEventPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceActionAccessRequestedEventPayloadCWProxy get copyWith =>
      _$DeviceActionAccessRequestedEventPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceActionAccessRequestedEventPayload
_$DeviceActionAccessRequestedEventPayloadFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeviceActionAccessRequestedEventPayload', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['kind', 'reason', 'bot_id']);
      final val = DeviceActionAccessRequestedEventPayload(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(
            _$DeviceActionAccessRequestedEventPayloadKindEnumEnumMap,
            v,
          ),
        ),
        reason: $checkedConvert('reason', (v) => v as String),
        botId: $checkedConvert('bot_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'botId': 'bot_id'});

Map<String, dynamic> _$DeviceActionAccessRequestedEventPayloadToJson(
  DeviceActionAccessRequestedEventPayload instance,
) => <String, dynamic>{
  'kind':
      _$DeviceActionAccessRequestedEventPayloadKindEnumEnumMap[instance.kind]!,
  'reason': instance.reason,
  'bot_id': instance.botId,
};

const _$DeviceActionAccessRequestedEventPayloadKindEnumEnumMap = {
  DeviceActionAccessRequestedEventPayloadKindEnum.alarm: 'alarm',
  DeviceActionAccessRequestedEventPayloadKindEnum.home: 'home',
};
