// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_choice_resolved_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserChoiceResolvedEventCWProxy {
  BrowserChoiceResolvedEvent v(int v);

  BrowserChoiceResolvedEvent runId(String runId);

  BrowserChoiceResolvedEvent seq(int seq);

  BrowserChoiceResolvedEvent ts(DateTime ts);

  BrowserChoiceResolvedEvent botId(String botId);

  BrowserChoiceResolvedEvent type(BrowserChoiceResolvedEventTypeEnum type);

  BrowserChoiceResolvedEvent payload(BrowserChoiceResolvedEventPayload payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceResolvedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceResolvedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserChoiceResolvedEvent call({
    int v,
    String runId,
    int seq,
    DateTime ts,
    String botId,
    BrowserChoiceResolvedEventTypeEnum type,
    BrowserChoiceResolvedEventPayload payload,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserChoiceResolvedEvent.copyWith(...)` or call `instanceOfBrowserChoiceResolvedEvent.copyWith.fieldName(value)` for a single field.
class _$BrowserChoiceResolvedEventCWProxyImpl
    implements _$BrowserChoiceResolvedEventCWProxy {
  const _$BrowserChoiceResolvedEventCWProxyImpl(this._value);

  final BrowserChoiceResolvedEvent _value;

  @override
  BrowserChoiceResolvedEvent v(int v) => call(v: v);

  @override
  BrowserChoiceResolvedEvent runId(String runId) => call(runId: runId);

  @override
  BrowserChoiceResolvedEvent seq(int seq) => call(seq: seq);

  @override
  BrowserChoiceResolvedEvent ts(DateTime ts) => call(ts: ts);

  @override
  BrowserChoiceResolvedEvent botId(String botId) => call(botId: botId);

  @override
  BrowserChoiceResolvedEvent type(BrowserChoiceResolvedEventTypeEnum type) =>
      call(type: type);

  @override
  BrowserChoiceResolvedEvent payload(
    BrowserChoiceResolvedEventPayload payload,
  ) => call(payload: payload);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceResolvedEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceResolvedEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserChoiceResolvedEvent call({
    Object? v = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? seq = const $CopyWithPlaceholder(),
    Object? ts = const $CopyWithPlaceholder(),
    Object? botId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
  }) {
    return BrowserChoiceResolvedEvent(
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
          : type as BrowserChoiceResolvedEventTypeEnum,
      payload: payload == const $CopyWithPlaceholder() || payload == null
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as BrowserChoiceResolvedEventPayload,
    );
  }
}

extension $BrowserChoiceResolvedEventCopyWith on BrowserChoiceResolvedEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserChoiceResolvedEvent.copyWith(...)` or `instanceOfBrowserChoiceResolvedEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserChoiceResolvedEventCWProxy get copyWith =>
      _$BrowserChoiceResolvedEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserChoiceResolvedEvent _$BrowserChoiceResolvedEventFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BrowserChoiceResolvedEvent', json, ($checkedConvert) {
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
  final val = BrowserChoiceResolvedEvent(
    v: $checkedConvert('v', (v) => (v as num).toInt()),
    runId: $checkedConvert('run_id', (v) => v as String),
    seq: $checkedConvert('seq', (v) => (v as num).toInt()),
    ts: $checkedConvert('ts', (v) => DateTime.parse(v as String)),
    botId: $checkedConvert('bot_id', (v) => v as String),
    type: $checkedConvert(
      'type',
      (v) => $enumDecode(_$BrowserChoiceResolvedEventTypeEnumEnumMap, v),
    ),
    payload: $checkedConvert(
      'payload',
      (v) =>
          BrowserChoiceResolvedEventPayload.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
}, fieldKeyMap: const {'runId': 'run_id', 'botId': 'bot_id'});

Map<String, dynamic> _$BrowserChoiceResolvedEventToJson(
  BrowserChoiceResolvedEvent instance,
) => <String, dynamic>{
  'v': instance.v,
  'run_id': instance.runId,
  'seq': instance.seq,
  'ts': instance.ts.toIso8601String(),
  'bot_id': instance.botId,
  'type': _$BrowserChoiceResolvedEventTypeEnumEnumMap[instance.type]!,
  'payload': instance.payload.toJson(),
};

const _$BrowserChoiceResolvedEventTypeEnumEnumMap = {
  BrowserChoiceResolvedEventTypeEnum.browserPeriodChoiceResolved:
      'browser.choice_resolved',
};
