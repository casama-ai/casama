// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_file_key.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeletedFileKeyCWProxy {
  DeletedFileKey deleted(String deleted);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeletedFileKey(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeletedFileKey(...).copyWith(id: 12, name: "My name")
  /// ```
  DeletedFileKey call({String deleted});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDeletedFileKey.copyWith(...)` or call `instanceOfDeletedFileKey.copyWith.fieldName(value)` for a single field.
class _$DeletedFileKeyCWProxyImpl implements _$DeletedFileKeyCWProxy {
  const _$DeletedFileKeyCWProxyImpl(this._value);

  final DeletedFileKey _value;

  @override
  DeletedFileKey deleted(String deleted) => call(deleted: deleted);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeletedFileKey(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeletedFileKey(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DeletedFileKey call({Object? deleted = const $CopyWithPlaceholder()}) {
    return DeletedFileKey(
      deleted: deleted == const $CopyWithPlaceholder() || deleted == null
          ? _value.deleted
          // ignore: cast_nullable_to_non_nullable
          : deleted as String,
    );
  }
}

extension $DeletedFileKeyCopyWith on DeletedFileKey {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDeletedFileKey.copyWith(...)` or `instanceOfDeletedFileKey.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeletedFileKeyCWProxy get copyWith => _$DeletedFileKeyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedFileKey _$DeletedFileKeyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeletedFileKey', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['deleted']);
      final val = DeletedFileKey(
        deleted: $checkedConvert('deleted', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$DeletedFileKeyToJson(DeletedFileKey instance) =>
    <String, dynamic>{'deleted': instance.deleted};
