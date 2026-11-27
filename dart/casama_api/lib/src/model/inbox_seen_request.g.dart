// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_seen_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InboxSeenRequestCWProxy {
  InboxSeenRequest itemKind(InboxSeenRequestItemKindEnum itemKind);

  InboxSeenRequest itemId(String itemId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InboxSeenRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InboxSeenRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  InboxSeenRequest call({InboxSeenRequestItemKindEnum itemKind, String itemId});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInboxSeenRequest.copyWith(...)` or call `instanceOfInboxSeenRequest.copyWith.fieldName(value)` for a single field.
class _$InboxSeenRequestCWProxyImpl implements _$InboxSeenRequestCWProxy {
  const _$InboxSeenRequestCWProxyImpl(this._value);

  final InboxSeenRequest _value;

  @override
  InboxSeenRequest itemKind(InboxSeenRequestItemKindEnum itemKind) =>
      call(itemKind: itemKind);

  @override
  InboxSeenRequest itemId(String itemId) => call(itemId: itemId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InboxSeenRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InboxSeenRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InboxSeenRequest call({
    Object? itemKind = const $CopyWithPlaceholder(),
    Object? itemId = const $CopyWithPlaceholder(),
  }) {
    return InboxSeenRequest(
      itemKind: itemKind == const $CopyWithPlaceholder() || itemKind == null
          ? _value.itemKind
          // ignore: cast_nullable_to_non_nullable
          : itemKind as InboxSeenRequestItemKindEnum,
      itemId: itemId == const $CopyWithPlaceholder() || itemId == null
          ? _value.itemId
          // ignore: cast_nullable_to_non_nullable
          : itemId as String,
    );
  }
}

extension $InboxSeenRequestCopyWith on InboxSeenRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInboxSeenRequest.copyWith(...)` or `instanceOfInboxSeenRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InboxSeenRequestCWProxy get copyWith => _$InboxSeenRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InboxSeenRequest _$InboxSeenRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InboxSeenRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['item_kind', 'item_id']);
      final val = InboxSeenRequest(
        itemKind: $checkedConvert(
          'item_kind',
          (v) => $enumDecode(_$InboxSeenRequestItemKindEnumEnumMap, v),
        ),
        itemId: $checkedConvert('item_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'itemKind': 'item_kind', 'itemId': 'item_id'});

Map<String, dynamic> _$InboxSeenRequestToJson(InboxSeenRequest instance) =>
    <String, dynamic>{
      'item_kind': _$InboxSeenRequestItemKindEnumEnumMap[instance.itemKind]!,
      'item_id': instance.itemId,
    };

const _$InboxSeenRequestItemKindEnumEnumMap = {
  InboxSeenRequestItemKindEnum.page: 'page',
  InboxSeenRequestItemKindEnum.brief: 'brief',
  InboxSeenRequestItemKindEnum.notification: 'notification',
};
