// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_action_access_requested_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceActionAccessRequestedEventCWProxy {
  DeviceActionAccessRequestedEvent v(int v);

  DeviceActionAccessRequestedEvent runId(String runId);

  DeviceActionAccessRequestedEvent seq(int seq);

  DeviceActionAccessRequestedEvent ts(DateTime ts);

  DeviceActionAccessRequestedEvent botId(String botId);

  DeviceActionAccessRequestedEvent type(
    DeviceActionAccessRequestedEventTypeEnum type,
  );

  DeviceActionAccessRequestedEvent payload(
    DeviceActionAccessRequestedEventPayload payload,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeviceActionAccessRequestedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeviceActionAccessRequestedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  DeviceActionAccessRequestedEvent call({
    int v,
    String runId,
    int seq,
    DateTime ts,
    String botId,
    DeviceActionAccessRequestedEventTypeEnum type,
    DeviceActionAccessRequestedEventPayload payload,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDeviceActionAccessRequestedEvent.copyWith(...)` or call `instanceOfDeviceActionAccessRequestedEvent.copyWith.fieldName(value)` for a single field.
class _$DeviceActionAccessRequestedEventCWProxyImpl
    implements _$DeviceActionAccessRequestedEventCWProxy {
  const _$DeviceActionAccessRequestedEventCWProxyImpl(this._value);

  final DeviceActionAccessRequestedEvent _value;

  @override
  DeviceActionAccessRequestedEvent v(int v) => call(v: v);

  @override
  DeviceActionAccessRequestedEvent runId(String runId) => call(runId: runId);

  @override
  DeviceActionAccessRequestedEvent seq(int seq) => call(seq: seq);

  @override
  DeviceActionAccessRequestedEvent ts(DateTime ts) => call(ts: ts);

  @override
  DeviceActionAccessRequestedEvent botId(String botId) => call(botId: botId);

  @override
  DeviceActionAccessRequestedEvent type(
    DeviceActionAccessRequestedEventTypeEnum type,
  ) => call(type: type);

  @override
  DeviceActionAccessRequestedEvent payload(
    DeviceActionAccessRequestedEventPayload payload,
  ) => call(payload: payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeviceActionAccessRequestedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeviceActionAccessRequestedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DeviceActionAccessRequestedEvent call({
    Object? v = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? seq = const $CopyWithPlaceholder(),
    Object? ts = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
  }) {
    return DeviceActionAccessRequestedEvent(
      v: v == const $CopyWithPlaceholder() || v == null
          ? _value.v
          // ignore: cast_nullable_to_non_nullable
          : v as int,
      runId: runId == const $CopyWithPlaceholder() || runId == null
          ? _value.runId
          // ignore: cast_nullable_to_non_nullable
          : runId as String,
      seq: seq == const $CopyWithPlaceholder() || seq == null
          ? _value.seq
          // ignore: cast_nullable_to_non_nullable
          : seq as int,
      ts: ts == const $CopyWithPlaceholder() || ts == null
          ? _value.ts
          // ignore: cast_nullable_to_non_nullable
          : ts as DateTime,
      botId: botId == const $CopyWithPlaceholder() || botId == null
          ? _value.botId
          // ignore: cast_nullable_to_non_nullable
          : botId as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as DeviceActionAccessRequestedEventTypeEnum,
      payload: payload == const $CopyWithPlaceholder() || payload == null
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as DeviceActionAccessRequestedEventPayload,
    );
  }
}

extension $DeviceActionAccessRequestedEventCopyWith
    on DeviceActionAccessRequestedEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDeviceActionAccessRequestedEvent.copyWith(...)` or `instanceOfDeviceActionAccessRequestedEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceActionAccessRequestedEventCWProxy get copyWith =>
      _$DeviceActionAccessRequestedEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceActionAccessRequestedEvent _$DeviceActionAccessRequestedEventFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('DeviceActionAccessRequestedEvent', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'v',
          'run_id',
          'seq',
          'ts',
          'bot_id',
          'type',
          'payload',
        ],
      );
      final val = DeviceActionAccessRequestedEvent(
        v: $checkedConvert('v', (v) => (v as num).toInt()),
        runId: $checkedConvert('run_id', (v) => v as String),
        seq: $checkedConvert('seq', (v) => (v as num).toInt()),
        ts: $checkedConvert('ts', (v) => DateTime.parse(v as String)),
        botId: $checkedConvert('bot_id', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) =>
              $enumDecode(_$DeviceActionAccessRequestedEventTypeEnumEnumMap, v),
        ),
        payload: $checkedConvert(
          'payload',
          (v) => DeviceActionAccessRequestedEventPayload.fromJson(
            v as Map<String, dynamic>,
          ),
        ),
      );
      return val;
    }, fieldKeyMap: const {'runId': 'run_id', 'botId': 'bot_id'});

Map<String, dynamic> _$DeviceActionAccessRequestedEventToJson(
  DeviceActionAccessRequestedEvent instance,
) => <String, dynamic>{
  'v': instance.v,
  'run_id': instance.runId,
  'seq': instance.seq,
  'ts': instance.ts.toIso8601String(),
  'bot_id': instance.botId,
  'type': _$DeviceActionAccessRequestedEventTypeEnumEnumMap[instance.type]!,
  'payload': instance.payload.toJson(),
};

const _$DeviceActionAccessRequestedEventTypeEnumEnumMap = {
  DeviceActionAccessRequestedEventTypeEnum.devicePeriodActionAccessRequested:
      'device.action_access_requested',
};
