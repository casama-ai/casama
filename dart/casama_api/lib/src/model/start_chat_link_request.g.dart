// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_chat_link_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StartChatLinkRequestCWProxy {
  StartChatLinkRequest botId(String botId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `StartChatLinkRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// StartChatLinkRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  StartChatLinkRequest call({String botId});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfStartChatLinkRequest.copyWith(...)` or call `instanceOfStartChatLinkRequest.copyWith.fieldName(value)` for a single field.
class _$StartChatLinkRequestCWProxyImpl
    implements _$StartChatLinkRequestCWProxy {
  const _$StartChatLinkRequestCWProxyImpl(this._value);

  final StartChatLinkRequest _value;

  @override
  StartChatLinkRequest botId(String botId) => call(botId: botId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `StartChatLinkRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// StartChatLinkRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  StartChatLinkRequest call({Object? botId = const $CopyWithPlaceholder()}) {
    return StartChatLinkRequest(
      botId: botId == const $CopyWithPlaceholder() || botId == null
          ? _value.botId
          // ignore: cast_nullable_to_non_nullable
          : botId as String,
    );
  }
}

extension $StartChatLinkRequestCopyWith on StartChatLinkRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfStartChatLinkRequest.copyWith(...)` or `instanceOfStartChatLinkRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StartChatLinkRequestCWProxy get copyWith =>
      _$StartChatLinkRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartChatLinkRequest _$StartChatLinkRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StartChatLinkRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['bot_id']);
  final val = StartChatLinkRequest(
    botId: $checkedConvert('bot_id', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'botId': 'bot_id'});

Map<String, dynamic> _$StartChatLinkRequestToJson(
  StartChatLinkRequest instance,
) => <String, dynamic>{'bot_id': instance.botId};
