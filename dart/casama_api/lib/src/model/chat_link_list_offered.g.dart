// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_link_list_offered.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatLinkListOfferedCWProxy {
  ChatLinkListOffered telegram(ChatLinkListOfferedTelegram? telegram);

  ChatLinkListOffered discord(ChatLinkListOfferedDiscord? discord);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkListOffered(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkListOffered(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatLinkListOffered call({
    ChatLinkListOfferedTelegram? telegram,
    ChatLinkListOfferedDiscord? discord,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatLinkListOffered.copyWith(...)` or call `instanceOfChatLinkListOffered.copyWith.fieldName(value)` for a single field.
class _$ChatLinkListOfferedCWProxyImpl implements _$ChatLinkListOfferedCWProxy {
  const _$ChatLinkListOfferedCWProxyImpl(this._value);

  final ChatLinkListOffered _value;

  @override
  ChatLinkListOffered telegram(ChatLinkListOfferedTelegram? telegram) =>
      call(telegram: telegram);

  @override
  ChatLinkListOffered discord(ChatLinkListOfferedDiscord? discord) =>
      call(discord: discord);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkListOffered(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkListOffered(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatLinkListOffered call({
    Object? telegram = const $CopyWithPlaceholder(),
    Object? discord = const $CopyWithPlaceholder(),
  }) {
    return ChatLinkListOffered(
      telegram: telegram == const $CopyWithPlaceholder()
          ? _value.telegram
          // ignore: cast_nullable_to_non_nullable
          : telegram as ChatLinkListOfferedTelegram?,
      discord: discord == const $CopyWithPlaceholder()
          ? _value.discord
          // ignore: cast_nullable_to_non_nullable
          : discord as ChatLinkListOfferedDiscord?,
    );
  }
}

extension $ChatLinkListOfferedCopyWith on ChatLinkListOffered {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatLinkListOffered.copyWith(...)` or `instanceOfChatLinkListOffered.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatLinkListOfferedCWProxy get copyWith =>
      _$ChatLinkListOfferedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatLinkListOffered _$ChatLinkListOfferedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChatLinkListOffered', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['telegram', 'discord']);
      final val = ChatLinkListOffered(
        telegram: $checkedConvert(
          'telegram',
          (v) => v == null
              ? null
              : ChatLinkListOfferedTelegram.fromJson(v as Map<String, dynamic>),
        ),
        discord: $checkedConvert(
          'discord',
          (v) => v == null
              ? null
              : ChatLinkListOfferedDiscord.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChatLinkListOfferedToJson(
  ChatLinkListOffered instance,
) => <String, dynamic>{
  'telegram': instance.telegram?.toJson(),
  'discord': instance.discord?.toJson(),
};
