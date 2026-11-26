// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_key_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileKeyListCWProxy {
  FileKeyList items(List<FileKey> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKeyList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKeyList(...).copyWith(id: 12, name: "My name")
  /// ```
  FileKeyList call({List<FileKey> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFileKeyList.copyWith(...)` or call `instanceOfFileKeyList.copyWith.fieldName(value)` for a single field.
class _$FileKeyListCWProxyImpl implements _$FileKeyListCWProxy {
  const _$FileKeyListCWProxyImpl(this._value);

  final FileKeyList _value;

  @override
  FileKeyList items(List<FileKey> items) => call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKeyList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKeyList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FileKeyList call({Object? items = const $CopyWithPlaceholder()}) {
    return FileKeyList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<FileKey>,
    );
  }
}

extension $FileKeyListCopyWith on FileKeyList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFileKeyList.copyWith(...)` or `instanceOfFileKeyList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileKeyListCWProxy get copyWith => _$FileKeyListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileKeyList _$FileKeyListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FileKeyList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = FileKeyList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => FileKey.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FileKeyListToJson(FileKeyList instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
