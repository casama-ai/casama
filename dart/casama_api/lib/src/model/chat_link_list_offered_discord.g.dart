// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_link_list_offered_discord.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatLinkListOfferedDiscordCWProxy {
  ChatLinkListOfferedDiscord url(String? url);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkListOfferedDiscord(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkListOfferedDiscord(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatLinkListOfferedDiscord call({String? url});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatLinkListOfferedDiscord.copyWith(...)` or call `instanceOfChatLinkListOfferedDiscord.copyWith.fieldName(value)` for a single field.
class _$ChatLinkListOfferedDiscordCWProxyImpl
    implements _$ChatLinkListOfferedDiscordCWProxy {
  const _$ChatLinkListOfferedDiscordCWProxyImpl(this._value);

  final ChatLinkListOfferedDiscord _value;

  @override
  ChatLinkListOfferedDiscord url(String? url) => call(url: url);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkListOfferedDiscord(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkListOfferedDiscord(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatLinkListOfferedDiscord call({
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return ChatLinkListOfferedDiscord(
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
    );
  }
}

extension $ChatLinkListOfferedDiscordCopyWith on ChatLinkListOfferedDiscord {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatLinkListOfferedDiscord.copyWith(...)` or `instanceOfChatLinkListOfferedDiscord.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatLinkListOfferedDiscordCWProxy get copyWith =>
      _$ChatLinkListOfferedDiscordCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatLinkListOfferedDiscord _$ChatLinkListOfferedDiscordFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ChatLinkListOfferedDiscord', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['url']);
  final val = ChatLinkListOfferedDiscord(
    url: $checkedConvert('url', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ChatLinkListOfferedDiscordToJson(
  ChatLinkListOfferedDiscord instance,
) => <String, dynamic>{'url': instance.url};
