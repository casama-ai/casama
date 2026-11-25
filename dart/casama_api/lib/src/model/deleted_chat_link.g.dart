// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_chat_link.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeletedChatLinkCWProxy {
  DeletedChatLink deleted(String deleted);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeletedChatLink(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeletedChatLink(...).copyWith(id: 12, name: "My name")
  /// ```
  DeletedChatLink call({String deleted});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDeletedChatLink.copyWith(...)` or call `instanceOfDeletedChatLink.copyWith.fieldName(value)` for a single field.
class _$DeletedChatLinkCWProxyImpl implements _$DeletedChatLinkCWProxy {
  const _$DeletedChatLinkCWProxyImpl(this._value);

  final DeletedChatLink _value;

  @override
  DeletedChatLink deleted(String deleted) => call(deleted: deleted);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `DeletedChatLink(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DeletedChatLink(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DeletedChatLink call({Object? deleted = const $CopyWithPlaceholder()}) {
    return DeletedChatLink(
      deleted: deleted == const $CopyWithPlaceholder() || deleted == null
          ? _value.deleted
          // ignore: cast_nullable_to_non_nullable
          : deleted as String,
    );
  }
}

extension $DeletedChatLinkCopyWith on DeletedChatLink {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDeletedChatLink.copyWith(...)` or `instanceOfDeletedChatLink.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeletedChatLinkCWProxy get copyWith => _$DeletedChatLinkCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedChatLink _$DeletedChatLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeletedChatLink', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['deleted']);
      final val = DeletedChatLink(
        deleted: $checkedConvert('deleted', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$DeletedChatLinkToJson(DeletedChatLink instance) =>
    <String, dynamic>{'deleted': instance.deleted};
