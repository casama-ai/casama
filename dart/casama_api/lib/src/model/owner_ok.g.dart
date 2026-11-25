// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_ok.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerOkCWProxy {
  OwnerOk ok(bool ok);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerOk(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerOk(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerOk call({bool ok});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerOk.copyWith(...)` or call `instanceOfOwnerOk.copyWith.fieldName(value)` for a single field.
class _$OwnerOkCWProxyImpl implements _$OwnerOkCWProxy {
  const _$OwnerOkCWProxyImpl(this._value);

  final OwnerOk _value;

  @override
  OwnerOk ok(bool ok) => call(ok: ok);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerOk(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerOk(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerOk call({Object? ok = const $CopyWithPlaceholder()}) {
    return OwnerOk(
      ok: ok == const $CopyWithPlaceholder() || ok == null
          ? _value.ok
          // ignore: cast_nullable_to_non_nullable
          : ok as bool,
    );
  }
}

extension $OwnerOkCopyWith on OwnerOk {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerOk.copyWith(...)` or `instanceOfOwnerOk.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerOkCWProxy get copyWith => _$OwnerOkCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerOk _$OwnerOkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OwnerOk', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['ok']);
      final val = OwnerOk(ok: $checkedConvert('ok', (v) => v as bool));
      return val;
    });

Map<String, dynamic> _$OwnerOkToJson(OwnerOk instance) => <String, dynamic>{
  'ok': instance.ok,
};
