// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_choice_requested_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserChoiceRequestedEventCWProxy {
  BrowserChoiceRequestedEvent v(int v);

  BrowserChoiceRequestedEvent runId(String runId);

  BrowserChoiceRequestedEvent seq(int seq);

  BrowserChoiceRequestedEvent ts(DateTime ts);

  BrowserChoiceRequestedEvent botId(String botId);

  BrowserChoiceRequestedEvent type(BrowserChoiceRequestedEventTypeEnum type);

  BrowserChoiceRequestedEvent payload(
    BrowserChoiceRequestedEventPayload payload,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceRequestedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceRequestedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserChoiceRequestedEvent call({
    int v,
    String runId,
    int seq,
    DateTime ts,
    String botId,
    BrowserChoiceRequestedEventTypeEnum type,
    BrowserChoiceRequestedEventPayload payload,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserChoiceRequestedEvent.copyWith(...)` or call `instanceOfBrowserChoiceRequestedEvent.copyWith.fieldName(value)` for a single field.
class _$BrowserChoiceRequestedEventCWProxyImpl
    implements _$BrowserChoiceRequestedEventCWProxy {
  const _$BrowserChoiceRequestedEventCWProxyImpl(this._value);

  final BrowserChoiceRequestedEvent _value;

  @override
  BrowserChoiceRequestedEvent v(int v) => call(v: v);

  @override
  BrowserChoiceRequestedEvent runId(String runId) => call(runId: runId);

  @override
  BrowserChoiceRequestedEvent seq(int seq) => call(seq: seq);

  @override
  BrowserChoiceRequestedEvent ts(DateTime ts) => call(ts: ts);

  @override
  BrowserChoiceRequestedEvent botId(String botId) => call(botId: botId);

  @override
  BrowserChoiceRequestedEvent type(BrowserChoiceRequestedEventTypeEnum type) =>
      call(type: type);

  @override
  BrowserChoiceRequestedEvent payload(
    BrowserChoiceRequestedEventPayload payload,
  ) => call(payload: payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceRequestedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceRequestedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserChoiceRequestedEvent call({
    Object? v = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? seq = const $CopyWithPlaceholder(),
    Object? ts = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
  }) {
    return BrowserChoiceRequestedEvent(
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
          : type as BrowserChoiceRequestedEventTypeEnum,
      payload: payload == const $CopyWithPlaceholder() || payload == null
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as BrowserChoiceRequestedEventPayload,
    );
  }
}

extension $BrowserChoiceRequestedEventCopyWith on BrowserChoiceRequestedEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserChoiceRequestedEvent.copyWith(...)` or `instanceOfBrowserChoiceRequestedEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserChoiceRequestedEventCWProxy get copyWith =>
      _$BrowserChoiceRequestedEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserChoiceRequestedEvent _$BrowserChoiceRequestedEventFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BrowserChoiceRequestedEvent', json, ($checkedConvert) {
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
  final val = BrowserChoiceRequestedEvent(
    v: $checkedConvert('v', (v) => (v as num).toInt()),
    runId: $checkedConvert('run_id', (v) => v as String),
    seq: $checkedConvert('seq', (v) => (v as num).toInt()),
    ts: $checkedConvert('ts', (v) => DateTime.parse(v as String)),
    botId: $checkedConvert('bot_id', (v) => v as String),
    type: $checkedConvert(
      'type',
      (v) => $enumDecode(_$BrowserChoiceRequestedEventTypeEnumEnumMap, v),
    ),
    payload: $checkedConvert(
      'payload',
      (v) => BrowserChoiceRequestedEventPayload.fromJson(
        v as Map<String, dynamic>,
      ),
    ),
  );
  return val;
}, fieldKeyMap: const {'runId': 'run_id', 'botId': 'bot_id'});

Map<String, dynamic> _$BrowserChoiceRequestedEventToJson(
  BrowserChoiceRequestedEvent instance,
) => <String, dynamic>{
  'v': instance.v,
  'run_id': instance.runId,
  'seq': instance.seq,
  'ts': instance.ts.toIso8601String(),
  'bot_id': instance.botId,
  'type': _$BrowserChoiceRequestedEventTypeEnumEnumMap[instance.type]!,
  'payload': instance.payload.toJson(),
};

const _$BrowserChoiceRequestedEventTypeEnumEnumMap = {
  BrowserChoiceRequestedEventTypeEnum.browserPeriodChoiceRequested:
      'browser.choice_requested',
};
