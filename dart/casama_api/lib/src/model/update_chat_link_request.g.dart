// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_chat_link_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateChatLinkRequestCWProxy {
  UpdateChatLinkRequest defaultBotId(String defaultBotId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateChatLinkRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateChatLinkRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateChatLinkRequest call({String defaultBotId});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateChatLinkRequest.copyWith(...)` or call `instanceOfUpdateChatLinkRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateChatLinkRequestCWProxyImpl
    implements _$UpdateChatLinkRequestCWProxy {
  const _$UpdateChatLinkRequestCWProxyImpl(this._value);

  final UpdateChatLinkRequest _value;

  @override
  UpdateChatLinkRequest defaultBotId(String defaultBotId) =>
      call(defaultBotId: defaultBotId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateChatLinkRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateChatLinkRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateChatLinkRequest call({
    Object? defaultBotId = const $CopyWithPlaceholder(),
  }) {
    return UpdateChatLinkRequest(
      defaultBotId:
          defaultBotId == const $CopyWithPlaceholder() || defaultBotId == null
          ? _value.defaultBotId
          // ignore: cast_nullable_to_non_nullable
          : defaultBotId as String,
    );
  }
}

extension $UpdateChatLinkRequestCopyWith on UpdateChatLinkRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateChatLinkRequest.copyWith(...)` or `instanceOfUpdateChatLinkRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateChatLinkRequestCWProxy get copyWith =>
      _$UpdateChatLinkRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateChatLinkRequest _$UpdateChatLinkRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateChatLinkRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['default_bot_id']);
  final val = UpdateChatLinkRequest(
    defaultBotId: $checkedConvert('default_bot_id', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'defaultBotId': 'default_bot_id'});

Map<String, dynamic> _$UpdateChatLinkRequestToJson(
  UpdateChatLinkRequest instance,
) => <String, dynamic>{'default_bot_id': instance.defaultBotId};
