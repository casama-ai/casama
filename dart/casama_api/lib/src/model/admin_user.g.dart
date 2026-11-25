// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminUserCWProxy {
  AdminUser id(String id);

  AdminUser email(String? email);

  AdminUser createdAt(DateTime createdAt);

  AdminUser lastSignInAt(DateTime? lastSignInAt);

  AdminUser orgs(int orgs);

  AdminUser lastActiveAt(DateTime? lastActiveAt);

  AdminUser inactivityState(AdminUserInactivityStateEnum? inactivityState);

  AdminUser keep(bool? keep);

  AdminUser team(bool? team);

  AdminUser owner(bool? owner);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminUser(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminUser(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminUser call({
    String id,
    String? email,
    DateTime createdAt,
    DateTime? lastSignInAt,
    int orgs,
    DateTime? lastActiveAt,
    AdminUserInactivityStateEnum? inactivityState,
    bool? keep,
    bool? team,
    bool? owner,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminUser.copyWith(...)` or call `instanceOfAdminUser.copyWith.fieldName(value)` for a single field.
class _$AdminUserCWProxyImpl implements _$AdminUserCWProxy {
  const _$AdminUserCWProxyImpl(this._value);

  final AdminUser _value;

  @override
  AdminUser id(String id) => call(id: id);

  @override
  AdminUser email(String? email) => call(email: email);

  @override
  AdminUser createdAt(DateTime createdAt) => call(createdAt: createdAt);

  @override
  AdminUser lastSignInAt(DateTime? lastSignInAt) =>
      call(lastSignInAt: lastSignInAt);

  @override
  AdminUser orgs(int orgs) => call(orgs: orgs);

  @override
  AdminUser lastActiveAt(DateTime? lastActiveAt) =>
      call(lastActiveAt: lastActiveAt);

  @override
  AdminUser inactivityState(AdminUserInactivityStateEnum? inactivityState) =>
      call(inactivityState: inactivityState);

  @override
  AdminUser keep(bool? keep) => call(keep: keep);

  @override
  AdminUser team(bool? team) => call(team: team);

  @override
  AdminUser owner(bool? owner) => call(owner: owner);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminUser(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminUser(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? lastSignInAt = const $CopyWithPlaceholder(),
    Object? orgs = const $CopyWithPlaceholder(),
    Object? lastActiveAt = const $CopyWithPlaceholder(),
    Object? inactivityState = const $CopyWithPlaceholder(),
    Object? keep = const $CopyWithPlaceholder(),
    Object? team = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
  }) {
    return AdminUser(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      lastSignInAt: lastSignInAt == const $CopyWithPlaceholder()
          ? _value.lastSignInAt
          // ignore: cast_nullable_to_non_nullable
          : lastSignInAt as DateTime?,
      orgs: orgs == const $CopyWithPlaceholder() || orgs == null
          ? _value.orgs
          // ignore: cast_nullable_to_non_nullable
          : orgs as int,
      lastActiveAt: lastActiveAt == const $CopyWithPlaceholder()
          ? _value.lastActiveAt
          // ignore: cast_nullable_to_non_nullable
          : lastActiveAt as DateTime?,
      inactivityState: inactivityState == const $CopyWithPlaceholder()
          ? _value.inactivityState
          // ignore: cast_nullable_to_non_nullable
          : inactivityState as AdminUserInactivityStateEnum?,
      keep: keep == const $CopyWithPlaceholder()
          ? _value.keep
          // ignore: cast_nullable_to_non_nullable
          : keep as bool?,
      team: team == const $CopyWithPlaceholder()
          ? _value.team
          // ignore: cast_nullable_to_non_nullable
          : team as bool?,
      owner: owner == const $CopyWithPlaceholder()
          ? _value.owner
          // ignore: cast_nullable_to_non_nullable
          : owner as bool?,
    );
  }
}

extension $AdminUserCopyWith on AdminUser {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminUser.copyWith(...)` or `instanceOfAdminUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminUserCWProxy get copyWith => _$AdminUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminUser _$AdminUserFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AdminUser',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'email',
        'created_at',
        'last_sign_in_at',
        'orgs',
      ],
    );
    final val = AdminUser(
      id: $checkedConvert('id', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      lastSignInAt: $checkedConvert(
        'last_sign_in_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      orgs: $checkedConvert('orgs', (v) => (v as num).toInt()),
      lastActiveAt: $checkedConvert(
        'last_active_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      inactivityState: $checkedConvert(
        'inactivity_state',
        (v) => $enumDecodeNullable(_$AdminUserInactivityStateEnumEnumMap, v),
      ),
      keep: $checkedConvert('keep', (v) => v as bool?),
      team: $checkedConvert('team', (v) => v as bool?),
      owner: $checkedConvert('owner', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'lastSignInAt': 'last_sign_in_at',
    'lastActiveAt': 'last_active_at',
    'inactivityState': 'inactivity_state',
  },
);

Map<String, dynamic> _$AdminUserToJson(AdminUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'created_at': instance.createdAt.toIso8601String(),
  'last_sign_in_at': instance.lastSignInAt?.toIso8601String(),
  'orgs': instance.orgs,
  'last_active_at': ?instance.lastActiveAt?.toIso8601String(),
  'inactivity_state':
      ?_$AdminUserInactivityStateEnumEnumMap[instance.inactivityState],
  'keep': ?instance.keep,
  'team': ?instance.team,
  'owner': ?instance.owner,
};

const _$AdminUserInactivityStateEnumEnumMap = {
  AdminUserInactivityStateEnum.active: 'active',
  AdminUserInactivityStateEnum.resting: 'resting',
  AdminUserInactivityStateEnum.filesSoon: 'files_soon',
  AdminUserInactivityStateEnum.removalSoon: 'removal_soon',
  AdminUserInactivityStateEnum.removing: 'removing',
};
