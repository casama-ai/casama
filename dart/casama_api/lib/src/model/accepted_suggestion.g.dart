// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accepted_suggestion.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AcceptedSuggestionCWProxy {
  AcceptedSuggestion conversationId(String? conversationId);

  AcceptedSuggestion runId(String? runId);

  AcceptedSuggestion routineId(String? routineId);

  AcceptedSuggestion direct(bool? direct);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AcceptedSuggestion(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AcceptedSuggestion(...).copyWith(id: 12, name: "My name")
  /// ```
  AcceptedSuggestion call({
    String? conversationId,
    String? runId,
    String? routineId,
    bool? direct,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAcceptedSuggestion.copyWith(...)` or call `instanceOfAcceptedSuggestion.copyWith.fieldName(value)` for a single field.
class _$AcceptedSuggestionCWProxyImpl implements _$AcceptedSuggestionCWProxy {
  const _$AcceptedSuggestionCWProxyImpl(this._value);

  final AcceptedSuggestion _value;

  @override
  AcceptedSuggestion conversationId(String? conversationId) =>
      call(conversationId: conversationId);

  @override
  AcceptedSuggestion runId(String? runId) => call(runId: runId);

  @override
  AcceptedSuggestion routineId(String? routineId) => call(routineId: routineId);

  @override
  AcceptedSuggestion direct(bool? direct) => call(direct: direct);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AcceptedSuggestion(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AcceptedSuggestion(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AcceptedSuggestion call({
    Object? conversationId = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? routineId = const $CopyWithPlaceholder(),
    Object? direct = const $CopyWithPlaceholder(),
  }) {
    return AcceptedSuggestion(
      conversationId: conversationId == const $CopyWithPlaceholder()
          ? _value.conversationId
          // ignore: cast_nullable_to_non_nullable
          : conversationId as String?,
      runId: runId == const $CopyWithPlaceholder()
          ? _value.runId
          // ignore: cast_nullable_to_non_nullable
          : runId as String?,
      routineId: routineId == const $CopyWithPlaceholder()
          ? _value.routineId
          // ignore: cast_nullable_to_non_nullable
          : routineId as String?,
      direct: direct == const $CopyWithPlaceholder()
          ? _value.direct
          // ignore: cast_nullable_to_non_nullable
          : direct as bool?,
    );
  }
}

extension $AcceptedSuggestionCopyWith on AcceptedSuggestion {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAcceptedSuggestion.copyWith(...)` or `instanceOfAcceptedSuggestion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AcceptedSuggestionCWProxy get copyWith =>
      _$AcceptedSuggestionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptedSuggestion _$AcceptedSuggestionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AcceptedSuggestion',
      json,
      ($checkedConvert) {
        final val = AcceptedSuggestion(
          conversationId: $checkedConvert(
            'conversation_id',
            (v) => v as String?,
          ),
          runId: $checkedConvert('run_id', (v) => v as String?),
          routineId: $checkedConvert('routine_id', (v) => v as String?),
          direct: $checkedConvert('direct', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'conversationId': 'conversation_id',
        'runId': 'run_id',
        'routineId': 'routine_id',
      },
    );

Map<String, dynamic> _$AcceptedSuggestionToJson(AcceptedSuggestion instance) =>
    <String, dynamic>{
      'conversation_id': ?instance.conversationId,
      'run_id': ?instance.runId,
      'routine_id': ?instance.routineId,
      'direct': ?instance.direct,
    };
