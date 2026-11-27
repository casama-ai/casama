// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_suggestion_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AcceptSuggestionRequestCWProxy {
  AcceptSuggestionRequest said(String? said);

  AcceptSuggestionRequest choice(String? choice);

  AcceptSuggestionRequest remindAt(DateTime? remindAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AcceptSuggestionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AcceptSuggestionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AcceptSuggestionRequest call({
    String? said,
    String? choice,
    DateTime? remindAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAcceptSuggestionRequest.copyWith(...)` or call `instanceOfAcceptSuggestionRequest.copyWith.fieldName(value)` for a single field.
class _$AcceptSuggestionRequestCWProxyImpl
    implements _$AcceptSuggestionRequestCWProxy {
  const _$AcceptSuggestionRequestCWProxyImpl(this._value);

  final AcceptSuggestionRequest _value;

  @override
  AcceptSuggestionRequest said(String? said) => call(said: said);

  @override
  AcceptSuggestionRequest choice(String? choice) => call(choice: choice);

  @override
  AcceptSuggestionRequest remindAt(DateTime? remindAt) =>
      call(remindAt: remindAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AcceptSuggestionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AcceptSuggestionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AcceptSuggestionRequest call({
    Object? said = const $CopyWithPlaceholder(),
    Object? choice = const $CopyWithPlaceholder(),
    Object? remindAt = const $CopyWithPlaceholder(),
  }) {
    return AcceptSuggestionRequest(
      said: said == const $CopyWithPlaceholder()
          ? _value.said
          // ignore: cast_nullable_to_non_nullable
          : said as String?,
      choice: choice == const $CopyWithPlaceholder()
          ? _value.choice
          // ignore: cast_nullable_to_non_nullable
          : choice as String?,
      remindAt: remindAt == const $CopyWithPlaceholder()
          ? _value.remindAt
          // ignore: cast_nullable_to_non_nullable
          : remindAt as DateTime?,
    );
  }
}

extension $AcceptSuggestionRequestCopyWith on AcceptSuggestionRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAcceptSuggestionRequest.copyWith(...)` or `instanceOfAcceptSuggestionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AcceptSuggestionRequestCWProxy get copyWith =>
      _$AcceptSuggestionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptSuggestionRequest _$AcceptSuggestionRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AcceptSuggestionRequest', json, ($checkedConvert) {
  final val = AcceptSuggestionRequest(
    said: $checkedConvert('said', (v) => v as String?),
    choice: $checkedConvert('choice', (v) => v as String?),
    remindAt: $checkedConvert(
      'remind_at',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
}, fieldKeyMap: const {'remindAt': 'remind_at'});

Map<String, dynamic> _$AcceptSuggestionRequestToJson(
  AcceptSuggestionRequest instance,
) => <String, dynamic>{
  'said': ?instance.said,
  'choice': ?instance.choice,
  'remind_at': ?instance.remindAt?.toIso8601String(),
};
