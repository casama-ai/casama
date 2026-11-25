// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_link.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatLinkCWProxy {
  ChatLink id(String id);

  ChatLink provider(ChatLinkProvider provider);

  ChatLink externalName(String? externalName);

  ChatLink orgId(String orgId);

  ChatLink defaultBotId(String? defaultBotId);

  ChatLink linkedAt(DateTime linkedAt);

  ChatLink lastSeenAt(DateTime? lastSeenAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLink(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLink(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatLink call({
    String id,
    ChatLinkProvider provider,
    String? externalName,
    String orgId,
    String? defaultBotId,
    DateTime linkedAt,
    DateTime? lastSeenAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatLink.copyWith(...)` or call `instanceOfChatLink.copyWith.fieldName(value)` for a single field.
class _$ChatLinkCWProxyImpl implements _$ChatLinkCWProxy {
  const _$ChatLinkCWProxyImpl(this._value);

  final ChatLink _value;

  @override
  ChatLink id(String id) => call(id: id);

  @override
  ChatLink provider(ChatLinkProvider provider) => call(provider: provider);

  @override
  ChatLink externalName(String? externalName) =>
      call(externalName: externalName);

  @override
  ChatLink orgId(String orgId) => call(orgId: orgId);

  @override
  ChatLink defaultBotId(String? defaultBotId) =>
      call(defaultBotId: defaultBotId);

  @override
  ChatLink linkedAt(DateTime linkedAt) => call(linkedAt: linkedAt);

  @override
  ChatLink lastSeenAt(DateTime? lastSeenAt) => call(lastSeenAt: lastSeenAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ChatLink(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatLink(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatLink call({
    Object? id = const $CopyWithPlaceholder(),
    Object? provider = const $CopyWithPlaceholder(),
    Object? externalName = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? defaultBotId = const $CopyWithPlaceholder(),
    Object? linkedAt = const $CopyWithPlaceholder(),
    Object? lastSeenAt = const $CopyWithPlaceholder(),
  }) {
    return ChatLink(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      provider: provider == const $CopyWithPlaceholder() || provider == null
          ? _value.provider
          // ignore: cast_nullable_to_non_nullable
          : provider as ChatLinkProvider,
      externalName: externalName == const $CopyWithPlaceholder()
          ? _value.externalName
          // ignore: cast_nullable_to_non_nullable
          : externalName as String?,
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      defaultBotId: defaultBotId == const $CopyWithPlaceholder()
          ? _value.defaultBotId
          // ignore: cast_nullable_to_non_nullable
          : defaultBotId as String?,
      linkedAt: linkedAt == const $CopyWithPlaceholder() || linkedAt == null
          ? _value.linkedAt
          // ignore: cast_nullable_to_non_nullable
          : linkedAt as DateTime,
      lastSeenAt: lastSeenAt == const $CopyWithPlaceholder()
          ? _value.lastSeenAt
          // ignore: cast_nullable_to_non_nullable
          : lastSeenAt as DateTime?,
    );
  }
}

extension $ChatLinkCopyWith on ChatLink {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatLink.copyWith(...)` or `instanceOfChatLink.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatLinkCWProxy get copyWith => _$ChatLinkCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatLink _$ChatLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ChatLink',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'provider',
        'external_name',
        'org_id',
        'default_bot_id',
        'linked_at',
        'last_seen_at',
      ],
    );
    final val = ChatLink(
      id: $checkedConvert('id', (v) => v as String),
      provider: $checkedConvert(
        'provider',
        (v) => $enumDecode(_$ChatLinkProviderEnumMap, v),
      ),
      externalName: $checkedConvert('external_name', (v) => v as String?),
      orgId: $checkedConvert('org_id', (v) => v as String),
      defaultBotId: $checkedConvert('default_bot_id', (v) => v as String?),
      linkedAt: $checkedConvert(
        'linked_at',
        (v) => DateTime.parse(v as String),
      ),
      lastSeenAt: $checkedConvert(
        'last_seen_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'externalName': 'external_name',
    'orgId': 'org_id',
    'defaultBotId': 'default_bot_id',
    'linkedAt': 'linked_at',
    'lastSeenAt': 'last_seen_at',
  },
);

Map<String, dynamic> _$ChatLinkToJson(ChatLink instance) => <String, dynamic>{
  'id': instance.id,
  'provider': _$ChatLinkProviderEnumMap[instance.provider]!,
  'external_name': instance.externalName,
  'org_id': instance.orgId,
  'default_bot_id': instance.defaultBotId,
  'linked_at': instance.linkedAt.toIso8601String(),
  'last_seen_at': instance.lastSeenAt?.toIso8601String(),
};

const _$ChatLinkProviderEnumMap = {
  ChatLinkProvider.telegram: 'telegram',
  ChatLinkProvider.discord: 'discord',
};
