// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_away_suggestions_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PutAwaySuggestionsResponseCWProxy {
  PutAwaySuggestionsResponse ok(bool ok);

  PutAwaySuggestionsResponse count(int count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PutAwaySuggestionsResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PutAwaySuggestionsResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  PutAwaySuggestionsResponse call({bool ok, int count});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPutAwaySuggestionsResponse.copyWith(...)` or call `instanceOfPutAwaySuggestionsResponse.copyWith.fieldName(value)` for a single field.
class _$PutAwaySuggestionsResponseCWProxyImpl
    implements _$PutAwaySuggestionsResponseCWProxy {
  const _$PutAwaySuggestionsResponseCWProxyImpl(this._value);

  final PutAwaySuggestionsResponse _value;

  @override
  PutAwaySuggestionsResponse ok(bool ok) => call(ok: ok);

  @override
  PutAwaySuggestionsResponse count(int count) => call(count: count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PutAwaySuggestionsResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PutAwaySuggestionsResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PutAwaySuggestionsResponse call({
    Object? ok = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return PutAwaySuggestionsResponse(
      ok: ok == const $CopyWithPlaceholder() || ok == null
          ? _value.ok
          // ignore: cast_nullable_to_non_nullable
          : ok as bool,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
    );
  }
}

extension $PutAwaySuggestionsResponseCopyWith on PutAwaySuggestionsResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPutAwaySuggestionsResponse.copyWith(...)` or `instanceOfPutAwaySuggestionsResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PutAwaySuggestionsResponseCWProxy get copyWith =>
      _$PutAwaySuggestionsResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutAwaySuggestionsResponse _$PutAwaySuggestionsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PutAwaySuggestionsResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['ok', 'count']);
  final val = PutAwaySuggestionsResponse(
    ok: $checkedConvert('ok', (v) => v as bool),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$PutAwaySuggestionsResponseToJson(
  PutAwaySuggestionsResponse instance,
) => <String, dynamic>{'ok': instance.ok, 'count': instance.count};
