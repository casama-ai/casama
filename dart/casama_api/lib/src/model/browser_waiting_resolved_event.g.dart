// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_waiting_resolved_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserWaitingResolvedEventCWProxy {
  BrowserWaitingResolvedEvent v(int v);

  BrowserWaitingResolvedEvent runId(String runId);

  BrowserWaitingResolvedEvent seq(int seq);

  BrowserWaitingResolvedEvent ts(DateTime ts);

  BrowserWaitingResolvedEvent botId(String botId);

  BrowserWaitingResolvedEvent type(BrowserWaitingResolvedEventTypeEnum type);

  BrowserWaitingResolvedEvent payload(
    BrowserWaitingResolvedEventPayload payload,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingResolvedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingResolvedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserWaitingResolvedEvent call({
    int v,
    String runId,
    int seq,
    DateTime ts,
    String botId,
    BrowserWaitingResolvedEventTypeEnum type,
    BrowserWaitingResolvedEventPayload payload,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserWaitingResolvedEvent.copyWith(...)` or call `instanceOfBrowserWaitingResolvedEvent.copyWith.fieldName(value)` for a single field.
class _$BrowserWaitingResolvedEventCWProxyImpl
    implements _$BrowserWaitingResolvedEventCWProxy {
  const _$BrowserWaitingResolvedEventCWProxyImpl(this._value);

  final BrowserWaitingResolvedEvent _value;

  @override
  BrowserWaitingResolvedEvent v(int v) => call(v: v);

  @override
  BrowserWaitingResolvedEvent runId(String runId) => call(runId: runId);

  @override
  BrowserWaitingResolvedEvent seq(int seq) => call(seq: seq);

  @override
  BrowserWaitingResolvedEvent ts(DateTime ts) => call(ts: ts);

  @override
  BrowserWaitingResolvedEvent botId(String botId) => call(botId: botId);

  @override
  BrowserWaitingResolvedEvent type(BrowserWaitingResolvedEventTypeEnum type) =>
      call(type: type);

  @override
  BrowserWaitingResolvedEvent payload(
    BrowserWaitingResolvedEventPayload payload,
  ) => call(payload: payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingResolvedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingResolvedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserWaitingResolvedEvent call({
    Object? v = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? seq = const $CopyWithPlaceholder(),
    Object? ts = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
  }) {
    return BrowserWaitingResolvedEvent(
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
          : type as BrowserWaitingResolvedEventTypeEnum,
      payload: payload == const $CopyWithPlaceholder() || payload == null
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as BrowserWaitingResolvedEventPayload,
    );
  }
}

extension $BrowserWaitingResolvedEventCopyWith on BrowserWaitingResolvedEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserWaitingResolvedEvent.copyWith(...)` or `instanceOfBrowserWaitingResolvedEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserWaitingResolvedEventCWProxy get copyWith =>
      _$BrowserWaitingResolvedEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserWaitingResolvedEvent _$BrowserWaitingResolvedEventFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BrowserWaitingResolvedEvent', json, ($checkedConvert) {
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
  final val = BrowserWaitingResolvedEvent(
    v: $checkedConvert('v', (v) => (v as num).toInt()),
    runId: $checkedConvert('run_id', (v) => v as String),
    seq: $checkedConvert('seq', (v) => (v as num).toInt()),
    ts: $checkedConvert('ts', (v) => DateTime.parse(v as String)),
    botId: $checkedConvert('bot_id', (v) => v as String),
    type: $checkedConvert(
      'type',
      (v) => $enumDecode(_$BrowserWaitingResolvedEventTypeEnumEnumMap, v),
    ),
    payload: $checkedConvert(
      'payload',
      (v) => BrowserWaitingResolvedEventPayload.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
  );
  return val;
}, fieldKeyMap: const {'runId': 'run_id', 'botId': 'bot_id'});

Map<String, dynamic> _$BrowserWaitingResolvedEventToJson(
  BrowserWaitingResolvedEvent instance,
) => <String, dynamic>{
  'v': instance.v,
  'run_id': instance.runId,
  'seq': instance.seq,
  'ts': instance.ts.toIso8601String(),
  'bot_id': instance.botId,
  'type': _$BrowserWaitingResolvedEventTypeEnumEnumMap[instance.type]!,
  'payload': instance.payload.toJson(),
};

const _$BrowserWaitingResolvedEventTypeEnumEnumMap = {
  BrowserWaitingResolvedEventTypeEnum.browserPeriodWaitingResolved:
      'browser.waiting_resolved',
};
