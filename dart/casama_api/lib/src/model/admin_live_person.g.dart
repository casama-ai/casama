// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_live_person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminLivePersonCWProxy {
  AdminLivePerson userId(String userId);

  AdminLivePerson displayName(String? displayName);

  AdminLivePerson email(String? email);

  AdminLivePerson platform(String platform);

  AdminLivePerson inChat(bool inChat);

  AdminLivePerson devices(int devices);

  AdminLivePerson lastSeenAt(DateTime lastSeenAt);

  AdminLivePerson onlineSince(DateTime? onlineSince);

  AdminLivePerson team(bool? team);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLivePerson(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLivePerson(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminLivePerson call({
    String userId,
    String? displayName,
    String? email,
    String platform,
    bool inChat,
    int devices,
    DateTime lastSeenAt,
    DateTime? onlineSince,
    bool? team,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminLivePerson.copyWith(...)` or call `instanceOfAdminLivePerson.copyWith.fieldName(value)` for a single field.
class _$AdminLivePersonCWProxyImpl implements _$AdminLivePersonCWProxy {
  const _$AdminLivePersonCWProxyImpl(this._value);

  final AdminLivePerson _value;

  @override
  AdminLivePerson userId(String userId) => call(userId: userId);

  @override
  AdminLivePerson displayName(String? displayName) =>
      call(displayName: displayName);

  @override
  AdminLivePerson email(String? email) => call(email: email);

  @override
  AdminLivePerson platform(String platform) => call(platform: platform);

  @override
  AdminLivePerson inChat(bool inChat) => call(inChat: inChat);

  @override
  AdminLivePerson devices(int devices) => call(devices: devices);

  @override
  AdminLivePerson lastSeenAt(DateTime lastSeenAt) =>
      call(lastSeenAt: lastSeenAt);

  @override
  AdminLivePerson onlineSince(DateTime? onlineSince) =>
      call(onlineSince: onlineSince);

  @override
  AdminLivePerson team(bool? team) => call(team: team);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLivePerson(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLivePerson(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminLivePerson call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? inChat = const $CopyWithPlaceholder(),
    Object? devices = const $CopyWithPlaceholder(),
    Object? lastSeenAt = const $CopyWithPlaceholder(),
    Object? onlineSince = const $CopyWithPlaceholder(),
    Object? team = const $CopyWithPlaceholder(),
  }) {
    return AdminLivePerson(
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      platform: platform == const $CopyWithPlaceholder() || platform == null
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String,
      inChat: inChat == const $CopyWithPlaceholder() || inChat == null
          ? _value.inChat
          // ignore: cast_nullable_to_non_nullable
          : inChat as bool,
      devices: devices == const $CopyWithPlaceholder() || devices == null
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as int,
      lastSeenAt:
          lastSeenAt == const $CopyWithPlaceholder() || lastSeenAt == null
          ? _value.lastSeenAt
          // ignore: cast_nullable_to_non_nullable
          : lastSeenAt as DateTime,
      onlineSince: onlineSince == const $CopyWithPlaceholder()
          ? _value.onlineSince
          // ignore: cast_nullable_to_non_nullable
          : onlineSince as DateTime?,
      team: team == const $CopyWithPlaceholder()
          ? _value.team
          // ignore: cast_nullable_to_non_nullable
          : team as bool?,
    );
  }
}

extension $AdminLivePersonCopyWith on AdminLivePerson {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminLivePerson.copyWith(...)` or `instanceOfAdminLivePerson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminLivePersonCWProxy get copyWith => _$AdminLivePersonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLivePerson _$AdminLivePersonFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminLivePerson',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'user_id',
            'display_name',
            'email',
            'platform',
            'in_chat',
            'devices',
            'last_seen_at',
            'online_since',
          ],
        );
        final val = AdminLivePerson(
          userId: $checkedConvert('user_id', (v) => v as String),
          displayName: $checkedConvert('display_name', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          platform: $checkedConvert('platform', (v) => v as String),
          inChat: $checkedConvert('in_chat', (v) => v as bool),
          devices: $checkedConvert('devices', (v) => (v as num).toInt()),
          lastSeenAt: $checkedConvert(
            'last_seen_at',
            (v) => DateTime.parse(v as String),
          ),
          onlineSince: $checkedConvert(
            'online_since',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          team: $checkedConvert('team', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'displayName': 'display_name',
        'inChat': 'in_chat',
        'lastSeenAt': 'last_seen_at',
        'onlineSince': 'online_since',
      },
    );

Map<String, dynamic> _$AdminLivePersonToJson(AdminLivePerson instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'email': instance.email,
      'platform': instance.platform,
      'in_chat': instance.inChat,
      'devices': instance.devices,
      'last_seen_at': instance.lastSeenAt.toIso8601String(),
      'online_since': instance.onlineSince?.toIso8601String(),
      'team': ?instance.team,
    };
