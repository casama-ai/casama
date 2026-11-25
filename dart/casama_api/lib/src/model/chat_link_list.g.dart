// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_link_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatLinkListCWProxy {
  ChatLinkList items(List<ChatLink> items);

  ChatLinkList offered(ChatLinkListOffered offered);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkList(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatLinkList call({List<ChatLink> items, ChatLinkListOffered offered});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatLinkList.copyWith(...)` or call `instanceOfChatLinkList.copyWith.fieldName(value)` for a single field.
class _$ChatLinkListCWProxyImpl implements _$ChatLinkListCWProxy {
  const _$ChatLinkListCWProxyImpl(this._value);

  final ChatLinkList _value;

  @override
  ChatLinkList items(List<ChatLink> items) => call(items: items);

  @override
  ChatLinkList offered(ChatLinkListOffered offered) => call(offered: offered);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatLinkList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? offered = const $CopyWithPlaceholder(),
  }) {
    return ChatLinkList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<ChatLink>,
      offered: offered == const $CopyWithPlaceholder() || offered == null
          ? _value.offered
          // ignore: cast_nullable_to_non_nullable
          : offered as ChatLinkListOffered,
    );
  }
}

extension $ChatLinkListCopyWith on ChatLinkList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatLinkList.copyWith(...)` or `instanceOfChatLinkList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatLinkListCWProxy get copyWith => _$ChatLinkListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatLinkList _$ChatLinkListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChatLinkList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'offered']);
      final val = ChatLinkList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => ChatLink.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        offered: $checkedConvert(
          'offered',
          (v) => ChatLinkListOffered.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChatLinkListToJson(ChatLinkList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'offered': instance.offered.toJson(),
    };
