// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snooze_suggestion_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SnoozeSuggestionRequestCWProxy {
  SnoozeSuggestionRequest until(DateTime? until);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SnoozeSuggestionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SnoozeSuggestionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SnoozeSuggestionRequest call({DateTime? until});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSnoozeSuggestionRequest.copyWith(...)` or call `instanceOfSnoozeSuggestionRequest.copyWith.fieldName(value)` for a single field.
class _$SnoozeSuggestionRequestCWProxyImpl
    implements _$SnoozeSuggestionRequestCWProxy {
  const _$SnoozeSuggestionRequestCWProxyImpl(this._value);

  final SnoozeSuggestionRequest _value;

  @override
  SnoozeSuggestionRequest until(DateTime? until) => call(until: until);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SnoozeSuggestionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SnoozeSuggestionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SnoozeSuggestionRequest call({Object? until = const $CopyWithPlaceholder()}) {
    return SnoozeSuggestionRequest(
      until: until == const $CopyWithPlaceholder()
          ? _value.until
          // ignore: cast_nullable_to_non_nullable
          : until as DateTime?,
    );
  }
}

extension $SnoozeSuggestionRequestCopyWith on SnoozeSuggestionRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSnoozeSuggestionRequest.copyWith(...)` or `instanceOfSnoozeSuggestionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SnoozeSuggestionRequestCWProxy get copyWith =>
      _$SnoozeSuggestionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnoozeSuggestionRequest _$SnoozeSuggestionRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SnoozeSuggestionRequest', json, ($checkedConvert) {
  final val = SnoozeSuggestionRequest(
    until: $checkedConvert(
      'until',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$SnoozeSuggestionRequestToJson(
  SnoozeSuggestionRequest instance,
) => <String, dynamic>{'until': ?instance.until?.toIso8601String()};
