// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_away_suggestions_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PutAwaySuggestionsRequestCWProxy {
  PutAwaySuggestionsRequest ids(List<String> ids);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PutAwaySuggestionsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PutAwaySuggestionsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  PutAwaySuggestionsRequest call({List<String> ids});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPutAwaySuggestionsRequest.copyWith(...)` or call `instanceOfPutAwaySuggestionsRequest.copyWith.fieldName(value)` for a single field.
class _$PutAwaySuggestionsRequestCWProxyImpl
    implements _$PutAwaySuggestionsRequestCWProxy {
  const _$PutAwaySuggestionsRequestCWProxyImpl(this._value);

  final PutAwaySuggestionsRequest _value;

  @override
  PutAwaySuggestionsRequest ids(List<String> ids) => call(ids: ids);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PutAwaySuggestionsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PutAwaySuggestionsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PutAwaySuggestionsRequest call({Object? ids = const $CopyWithPlaceholder()}) {
    return PutAwaySuggestionsRequest(
      ids: ids == const $CopyWithPlaceholder() || ids == null
          ? _value.ids
          // ignore: cast_nullable_to_non_nullable
          : ids as List<String>,
    );
  }
}

extension $PutAwaySuggestionsRequestCopyWith on PutAwaySuggestionsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPutAwaySuggestionsRequest.copyWith(...)` or `instanceOfPutAwaySuggestionsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PutAwaySuggestionsRequestCWProxy get copyWith =>
      _$PutAwaySuggestionsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutAwaySuggestionsRequest _$PutAwaySuggestionsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PutAwaySuggestionsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['ids']);
  final val = PutAwaySuggestionsRequest(
    ids: $checkedConvert(
      'ids',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$PutAwaySuggestionsRequestToJson(
  PutAwaySuggestionsRequest instance,
) => <String, dynamic>{'ids': instance.ids};
