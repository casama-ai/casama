// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SendMessageRequestCWProxy {
  SendMessageRequest text(String? text);

  SendMessageRequest attachments(List<MessageAttachment>? attachments);

  SendMessageRequest uiAction(UiActionPart? uiAction);

  SendMessageRequest skills(List<String>? skills);

  SendMessageRequest apps(List<AppMentionRef>? apps);

  SendMessageRequest clientId(String? clientId);

  SendMessageRequest clientBuild(
    SendMessageRequestClientBuildEnum? clientBuild,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SendMessageRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SendMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SendMessageRequest call({
    String? text,
    List<MessageAttachment>? attachments,
    UiActionPart? uiAction,
    List<String>? skills,
    List<AppMentionRef>? apps,
    String? clientId,
    SendMessageRequestClientBuildEnum? clientBuild,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSendMessageRequest.copyWith(...)` or call `instanceOfSendMessageRequest.copyWith.fieldName(value)` for a single field.
class _$SendMessageRequestCWProxyImpl implements _$SendMessageRequestCWProxy {
  const _$SendMessageRequestCWProxyImpl(this._value);

  final SendMessageRequest _value;

  @override
  SendMessageRequest text(String? text) => call(text: text);

  @override
  SendMessageRequest attachments(List<MessageAttachment>? attachments) =>
      call(attachments: attachments);

  @override
  SendMessageRequest uiAction(UiActionPart? uiAction) =>
      call(uiAction: uiAction);

  @override
  SendMessageRequest skills(List<String>? skills) => call(skills: skills);

  @override
  SendMessageRequest apps(List<AppMentionRef>? apps) => call(apps: apps);

  @override
  SendMessageRequest clientId(String? clientId) => call(clientId: clientId);

  @override
  SendMessageRequest clientBuild(
    SendMessageRequestClientBuildEnum? clientBuild,
  ) => call(clientBuild: clientBuild);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SendMessageRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SendMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SendMessageRequest call({
    Object? text = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
    Object? uiAction = const $CopyWithPlaceholder(),
    Object? skills = const $CopyWithPlaceholder(),
    Object? apps = const $CopyWithPlaceholder(),
    Object? clientId = const $CopyWithPlaceholder(),
    Object? clientBuild = const $CopyWithPlaceholder(),
  }) {
    return SendMessageRequest(
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
      attachments: attachments == const $CopyWithPlaceholder()
          ? _value.attachments
          // ignore: cast_nullable_to_non_nullable
          : attachments as List<MessageAttachment>?,
      uiAction: uiAction == const $CopyWithPlaceholder()
          ? _value.uiAction
          // ignore: cast_nullable_to_non_nullable
          : uiAction as UiActionPart?,
      skills: skills == const $CopyWithPlaceholder()
          ? _value.skills
          // ignore: cast_nullable_to_non_nullable
          : skills as List<String>?,
      apps: apps == const $CopyWithPlaceholder()
          ? _value.apps
          // ignore: cast_nullable_to_non_nullable
          : apps as List<AppMentionRef>?,
      clientId: clientId == const $CopyWithPlaceholder()
          ? _value.clientId
          // ignore: cast_nullable_to_non_nullable
          : clientId as String?,
      clientBuild: clientBuild == const $CopyWithPlaceholder()
          ? _value.clientBuild
          // ignore: cast_nullable_to_non_nullable
          : clientBuild as SendMessageRequestClientBuildEnum?,
    );
  }
}

extension $SendMessageRequestCopyWith on SendMessageRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSendMessageRequest.copyWith(...)` or `instanceOfSendMessageRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SendMessageRequestCWProxy get copyWith =>
      _$SendMessageRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequest _$SendMessageRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SendMessageRequest',
  json,
  ($checkedConvert) {
    final val = SendMessageRequest(
      text: $checkedConvert('text', (v) => v as String? ?? ''),
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      uiAction: $checkedConvert(
        'ui_action',
        (v) =>
            v == null ? null : UiActionPart.fromJson(v as Map<String, dynamic>),
      ),
      skills: $checkedConvert(
        'skills',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      apps: $checkedConvert(
        'apps',
        (v) => (v as List<dynamic>?)
            ?.map((e) => AppMentionRef.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      clientId: $checkedConvert('client_id', (v) => v as String?),
      clientBuild: $checkedConvert(
        'client_build',
        (v) =>
            $enumDecodeNullable(_$SendMessageRequestClientBuildEnumEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'uiAction': 'ui_action',
    'clientId': 'client_id',
    'clientBuild': 'client_build',
  },
);

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      'text': ?instance.text,
      'attachments': ?instance.attachments?.map((e) => e.toJson()).toList(),
      'ui_action': ?instance.uiAction?.toJson(),
      'skills': ?instance.skills,
      'apps': ?instance.apps?.map((e) => e.toJson()).toList(),
      'client_id': ?instance.clientId,
      'client_build':
          ?_$SendMessageRequestClientBuildEnumEnumMap[instance.clientBuild],
    };

const _$SendMessageRequestClientBuildEnumEnumMap = {
  SendMessageRequestClientBuildEnum.direct: 'direct',
  SendMessageRequestClientBuildEnum.store: 'store',
};
