// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_link_list_offered_telegram.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatLinkListOfferedTelegramCWProxy {
  ChatLinkListOfferedTelegram username(String username);

  ChatLinkListOfferedTelegram url(String url);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkListOfferedTelegram(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkListOfferedTelegram(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatLinkListOfferedTelegram call({String username, String url});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatLinkListOfferedTelegram.copyWith(...)` or call `instanceOfChatLinkListOfferedTelegram.copyWith.fieldName(value)` for a single field.
class _$ChatLinkListOfferedTelegramCWProxyImpl
    implements _$ChatLinkListOfferedTelegramCWProxy {
  const _$ChatLinkListOfferedTelegramCWProxyImpl(this._value);

  final ChatLinkListOfferedTelegram _value;

  @override
  ChatLinkListOfferedTelegram username(String username) =>
      call(username: username);

  @override
  ChatLinkListOfferedTelegram url(String url) => call(url: url);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkListOfferedTelegram(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkListOfferedTelegram(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatLinkListOfferedTelegram call({
    Object? username = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return ChatLinkListOfferedTelegram(
      username: username == const $CopyWithPlaceholder() || username == null
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
    );
  }
}

extension $ChatLinkListOfferedTelegramCopyWith on ChatLinkListOfferedTelegram {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatLinkListOfferedTelegram.copyWith(...)` or `instanceOfChatLinkListOfferedTelegram.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatLinkListOfferedTelegramCWProxy get copyWith =>
      _$ChatLinkListOfferedTelegramCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatLinkListOfferedTelegram _$ChatLinkListOfferedTelegramFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ChatLinkListOfferedTelegram', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['username', 'url']);
  final val = ChatLinkListOfferedTelegram(
    username: $checkedConvert('username', (v) => v as String),
    url: $checkedConvert('url', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ChatLinkListOfferedTelegramToJson(
  ChatLinkListOfferedTelegram instance,
) => <String, dynamic>{'username': instance.username, 'url': instance.url};
