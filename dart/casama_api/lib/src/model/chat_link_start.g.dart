// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_link_start.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatLinkStartCWProxy {
  ChatLinkStart url(String url);

  ChatLinkStart expiresAt(DateTime expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkStart(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkStart(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatLinkStart call({String url, DateTime expiresAt});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatLinkStart.copyWith(...)` or call `instanceOfChatLinkStart.copyWith.fieldName(value)` for a single field.
class _$ChatLinkStartCWProxyImpl implements _$ChatLinkStartCWProxy {
  const _$ChatLinkStartCWProxyImpl(this._value);

  final ChatLinkStart _value;

  @override
  ChatLinkStart url(String url) => call(url: url);

  @override
  ChatLinkStart expiresAt(DateTime expiresAt) => call(expiresAt: expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLinkStart(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLinkStart(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatLinkStart call({
    Object? url = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return ChatLinkStart(
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $ChatLinkStartCopyWith on ChatLinkStart {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatLinkStart.copyWith(...)` or `instanceOfChatLinkStart.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatLinkStartCWProxy get copyWith => _$ChatLinkStartCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatLinkStart _$ChatLinkStartFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChatLinkStart', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['url', 'expires_at']);
      final val = ChatLinkStart(
        url: $checkedConvert('url', (v) => v as String),
        expiresAt: $checkedConvert(
          'expires_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$ChatLinkStartToJson(ChatLinkStart instance) =>
    <String, dynamic>{
      'url': instance.url,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
