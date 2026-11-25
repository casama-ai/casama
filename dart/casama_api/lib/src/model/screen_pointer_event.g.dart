// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_pointer_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScreenPointerEventCWProxy {
  ScreenPointerEvent v(int v);

  ScreenPointerEvent runId(String runId);

  ScreenPointerEvent seq(int seq);

  ScreenPointerEvent ts(DateTime ts);

  ScreenPointerEvent botId(String botId);

  ScreenPointerEvent type(ScreenPointerEventTypeEnum type);

  ScreenPointerEvent payload(ScreenPointerEventPayload payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ScreenPointerEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ScreenPointerEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  ScreenPointerEvent call({
    int v,
    String runId,
    int seq,
    DateTime ts,
    String botId,
    ScreenPointerEventTypeEnum type,
    ScreenPointerEventPayload payload,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfScreenPointerEvent.copyWith(...)` or call `instanceOfScreenPointerEvent.copyWith.fieldName(value)` for a single field.
class _$ScreenPointerEventCWProxyImpl implements _$ScreenPointerEventCWProxy {
  const _$ScreenPointerEventCWProxyImpl(this._value);

  final ScreenPointerEvent _value;

  @override
  ScreenPointerEvent v(int v) => call(v: v);

  @override
  ScreenPointerEvent runId(String runId) => call(runId: runId);

  @override
  ScreenPointerEvent seq(int seq) => call(seq: seq);

  @override
  ScreenPointerEvent ts(DateTime ts) => call(ts: ts);

  @override
  ScreenPointerEvent botId(String botId) => call(botId: botId);

  @override
  ScreenPointerEvent type(ScreenPointerEventTypeEnum type) => call(type: type);

  @override
  ScreenPointerEvent payload(ScreenPointerEventPayload payload) =>
      call(payload: payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ScreenPointerEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ScreenPointerEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ScreenPointerEvent call({
    Object? v = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? seq = const $CopyWithPlaceholder(),
    Object? ts = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
  }) {
    return ScreenPointerEvent(
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
          : type as ScreenPointerEventTypeEnum,
      payload: payload == const $CopyWithPlaceholder() || payload == null
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as ScreenPointerEventPayload,
    );
  }
}

extension $ScreenPointerEventCopyWith on ScreenPointerEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfScreenPointerEvent.copyWith(...)` or `instanceOfScreenPointerEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScreenPointerEventCWProxy get copyWith =>
      _$ScreenPointerEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenPointerEvent _$ScreenPointerEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ScreenPointerEvent', json, ($checkedConvert) {
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
      final val = ScreenPointerEvent(
        v: $checkedConvert('v', (v) => (v as num).toInt()),
        runId: $checkedConvert('run_id', (v) => v as String),
        seq: $checkedConvert('seq', (v) => (v as num).toInt()),
        ts: $checkedConvert('ts', (v) => DateTime.parse(v as String)),
        botId: $checkedConvert('bot_id', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$ScreenPointerEventTypeEnumEnumMap, v),
        ),
        payload: $checkedConvert(
          'payload',
          (v) => ScreenPointerEventPayload.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'runId': 'run_id', 'botId': 'bot_id'});

Map<String, dynamic> _$ScreenPointerEventToJson(ScreenPointerEvent instance) =>
    <String, dynamic>{
      'v': instance.v,
      'run_id': instance.runId,
      'seq': instance.seq,
      'ts': instance.ts.toIso8601String(),
      'bot_id': instance.botId,
      'type': _$ScreenPointerEventTypeEnumEnumMap[instance.type]!,
      'payload': instance.payload.toJson(),
    };

const _$ScreenPointerEventTypeEnumEnumMap = {
  ScreenPointerEventTypeEnum.screenPeriodPointer: 'screen.pointer',
};
