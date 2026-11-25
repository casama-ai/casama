// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_waiting_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserWaitingEventCWProxy {
  BrowserWaitingEvent v(int v);

  BrowserWaitingEvent runId(String runId);

  BrowserWaitingEvent seq(int seq);

  BrowserWaitingEvent ts(DateTime ts);

  BrowserWaitingEvent botId(String botId);

  BrowserWaitingEvent type(BrowserWaitingEventTypeEnum type);

  BrowserWaitingEvent payload(BrowserWaitingEventPayload payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserWaitingEvent call({
    int v,
    String runId,
    int seq,
    DateTime ts,
    String botId,
    BrowserWaitingEventTypeEnum type,
    BrowserWaitingEventPayload payload,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserWaitingEvent.copyWith(...)` or call `instanceOfBrowserWaitingEvent.copyWith.fieldName(value)` for a single field.
class _$BrowserWaitingEventCWProxyImpl implements _$BrowserWaitingEventCWProxy {
  const _$BrowserWaitingEventCWProxyImpl(this._value);

  final BrowserWaitingEvent _value;

  @override
  BrowserWaitingEvent v(int v) => call(v: v);

  @override
  BrowserWaitingEvent runId(String runId) => call(runId: runId);

  @override
  BrowserWaitingEvent seq(int seq) => call(seq: seq);

  @override
  BrowserWaitingEvent ts(DateTime ts) => call(ts: ts);

  @override
  BrowserWaitingEvent botId(String botId) => call(botId: botId);

  @override
  BrowserWaitingEvent type(BrowserWaitingEventTypeEnum type) =>
      call(type: type);

  @override
  BrowserWaitingEvent payload(BrowserWaitingEventPayload payload) =>
      call(payload: payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserWaitingEvent call({
    Object? v = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? seq = const $CopyWithPlaceholder(),
    Object? ts = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
  }) {
    return BrowserWaitingEvent(
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
          : type as BrowserWaitingEventTypeEnum,
      payload: payload == const $CopyWithPlaceholder() || payload == null
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as BrowserWaitingEventPayload,
    );
  }
}

extension $BrowserWaitingEventCopyWith on BrowserWaitingEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserWaitingEvent.copyWith(...)` or `instanceOfBrowserWaitingEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserWaitingEventCWProxy get copyWith =>
      _$BrowserWaitingEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserWaitingEvent _$BrowserWaitingEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BrowserWaitingEvent', json, ($checkedConvert) {
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
      final val = BrowserWaitingEvent(
        v: $checkedConvert('v', (v) => (v as num).toInt()),
        runId: $checkedConvert('run_id', (v) => v as String),
        seq: $checkedConvert('seq', (v) => (v as num).toInt()),
        ts: $checkedConvert('ts', (v) => DateTime.parse(v as String)),
        botId: $checkedConvert('bot_id', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$BrowserWaitingEventTypeEnumEnumMap, v),
        ),
        payload: $checkedConvert(
          'payload',
          (v) => BrowserWaitingEventPayload.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'runId': 'run_id', 'botId': 'bot_id'});

Map<String, dynamic> _$BrowserWaitingEventToJson(
  BrowserWaitingEvent instance,
) => <String, dynamic>{
  'v': instance.v,
  'run_id': instance.runId,
  'seq': instance.seq,
  'ts': instance.ts.toIso8601String(),
  'bot_id': instance.botId,
  'type': _$BrowserWaitingEventTypeEnumEnumMap[instance.type]!,
  'payload': instance.payload.toJson(),
};

const _$BrowserWaitingEventTypeEnumEnumMap = {
  BrowserWaitingEventTypeEnum.browserPeriodWaiting: 'browser.waiting',
};
