// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_in_use_by.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComputerInUseByCWProxy {
  ComputerInUseBy botId(String botId);

  ComputerInUseBy botName(String botName);

  ComputerInUseBy runId(String runId);

  ComputerInUseBy conversationId(String? conversationId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ComputerInUseBy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ComputerInUseBy(...).copyWith(id: 12, name: "My name")
  /// ```
  ComputerInUseBy call({
    String botId,
    String botName,
    String runId,
    String? conversationId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfComputerInUseBy.copyWith(...)` or call `instanceOfComputerInUseBy.copyWith.fieldName(value)` for a single field.
class _$ComputerInUseByCWProxyImpl implements _$ComputerInUseByCWProxy {
  const _$ComputerInUseByCWProxyImpl(this._value);

  final ComputerInUseBy _value;

  @override
  ComputerInUseBy botId(String botId) => call(botId: botId);

  @override
  ComputerInUseBy botName(String botName) => call(botName: botName);

  @override
  ComputerInUseBy runId(String runId) => call(runId: runId);

  @override
  ComputerInUseBy conversationId(String? conversationId) =>
      call(conversationId: conversationId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ComputerInUseBy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ComputerInUseBy(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ComputerInUseBy call({
    Object? botId = const $CopyWithPlaceholder(),
    Object? botName = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? conversationId = const $CopyWithPlaceholder(),
  }) {
    return ComputerInUseBy(
      botId: botId == const $CopyWithPlaceholder() || botId == null
          ? _value.botId
          // ignore: cast_nullable_to_non_nullable
          : botId as String,
      botName: botName == const $CopyWithPlaceholder() || botName == null
          ? _value.botName
          // ignore: cast_nullable_to_non_nullable
          : botName as String,
      runId: runId == const $CopyWithPlaceholder() || runId == null
          ? _value.runId
          // ignore: cast_nullable_to_non_nullable
          : runId as String,
      conversationId: conversationId == const $CopyWithPlaceholder()
          ? _value.conversationId
          // ignore: cast_nullable_to_non_nullable
          : conversationId as String?,
    );
  }
}

extension $ComputerInUseByCopyWith on ComputerInUseBy {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfComputerInUseBy.copyWith(...)` or `instanceOfComputerInUseBy.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComputerInUseByCWProxy get copyWith => _$ComputerInUseByCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComputerInUseBy _$ComputerInUseByFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ComputerInUseBy',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['bot_id', 'bot_name', 'run_id', 'conversation_id'],
    );
    final val = ComputerInUseBy(
      botId: $checkedConvert('bot_id', (v) => v as String),
      botName: $checkedConvert('bot_name', (v) => v as String),
      runId: $checkedConvert('run_id', (v) => v as String),
      conversationId: $checkedConvert('conversation_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'botId': 'bot_id',
    'botName': 'bot_name',
    'runId': 'run_id',
    'conversationId': 'conversation_id',
  },
);

Map<String, dynamic> _$ComputerInUseByToJson(ComputerInUseBy instance) =>
    <String, dynamic>{
      'bot_id': instance.botId,
      'bot_name': instance.botName,
      'run_id': instance.runId,
      'conversation_id': instance.conversationId,
    };
