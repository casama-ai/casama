// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfhost_status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelfhostStatusCWProxy {
  SelfhostStatus licensing(bool licensing);

  SelfhostStatus state(SelfhostStatusStateEnum? state);

  SelfhostStatus edition(SelfhostStatusEditionEnum? edition);

  SelfhostStatus instanceId(String? instanceId);

  SelfhostStatus expiresAt(DateTime? expiresAt);

  SelfhostStatus graceUntil(DateTime? graceUntil);

  SelfhostStatus members(int? members);

  SelfhostStatus seats(int? seats);

  SelfhostStatus engineVersion(String? engineVersion);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  SelfhostStatus call({
    bool licensing,
    SelfhostStatusStateEnum? state,
    SelfhostStatusEditionEnum? edition,
    String? instanceId,
    DateTime? expiresAt,
    DateTime? graceUntil,
    int? members,
    int? seats,
    String? engineVersion,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelfhostStatus.copyWith(...)` or call `instanceOfSelfhostStatus.copyWith.fieldName(value)` for a single field.
class _$SelfhostStatusCWProxyImpl implements _$SelfhostStatusCWProxy {
  const _$SelfhostStatusCWProxyImpl(this._value);

  final SelfhostStatus _value;

  @override
  SelfhostStatus licensing(bool licensing) => call(licensing: licensing);

  @override
  SelfhostStatus state(SelfhostStatusStateEnum? state) => call(state: state);

  @override
  SelfhostStatus edition(SelfhostStatusEditionEnum? edition) =>
      call(edition: edition);

  @override
  SelfhostStatus instanceId(String? instanceId) => call(instanceId: instanceId);

  @override
  SelfhostStatus expiresAt(DateTime? expiresAt) => call(expiresAt: expiresAt);

  @override
  SelfhostStatus graceUntil(DateTime? graceUntil) =>
      call(graceUntil: graceUntil);

  @override
  SelfhostStatus members(int? members) => call(members: members);

  @override
  SelfhostStatus seats(int? seats) => call(seats: seats);

  @override
  SelfhostStatus engineVersion(String? engineVersion) =>
      call(engineVersion: engineVersion);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SelfhostStatus call({
    Object? licensing = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? edition = const $CopyWithPlaceholder(),
    Object? instanceId = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? graceUntil = const $CopyWithPlaceholder(),
    Object? members = const $CopyWithPlaceholder(),
    Object? seats = const $CopyWithPlaceholder(),
    Object? engineVersion = const $CopyWithPlaceholder(),
  }) {
    return SelfhostStatus(
      licensing: licensing == const $CopyWithPlaceholder() || licensing == null
          ? _value.licensing
          // ignore: cast_nullable_to_non_nullable
          : licensing as bool,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as SelfhostStatusStateEnum?,
      edition: edition == const $CopyWithPlaceholder()
          ? _value.edition
          // ignore: cast_nullable_to_non_nullable
          : edition as SelfhostStatusEditionEnum?,
      instanceId: instanceId == const $CopyWithPlaceholder()
          ? _value.instanceId
          // ignore: cast_nullable_to_non_nullable
          : instanceId as String?,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime?,
      graceUntil: graceUntil == const $CopyWithPlaceholder()
          ? _value.graceUntil
          // ignore: cast_nullable_to_non_nullable
          : graceUntil as DateTime?,
      members: members == const $CopyWithPlaceholder()
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as int?,
      seats: seats == const $CopyWithPlaceholder()
          ? _value.seats
          // ignore: cast_nullable_to_non_nullable
          : seats as int?,
      engineVersion: engineVersion == const $CopyWithPlaceholder()
          ? _value.engineVersion
          // ignore: cast_nullable_to_non_nullable
          : engineVersion as String?,
    );
  }
}

extension $SelfhostStatusCopyWith on SelfhostStatus {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelfhostStatus.copyWith(...)` or `instanceOfSelfhostStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelfhostStatusCWProxy get copyWith => _$SelfhostStatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfhostStatus _$SelfhostStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SelfhostStatus',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['licensing']);
        final val = SelfhostStatus(
          licensing: $checkedConvert('licensing', (v) => v as bool),
          state: $checkedConvert(
            'state',
            (v) => $enumDecodeNullable(_$SelfhostStatusStateEnumEnumMap, v),
          ),
          edition: $checkedConvert(
            'edition',
            (v) => $enumDecodeNullable(_$SelfhostStatusEditionEnumEnumMap, v),
          ),
          instanceId: $checkedConvert('instance_id', (v) => v as String?),
          expiresAt: $checkedConvert(
            'expires_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          graceUntil: $checkedConvert(
            'grace_until',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          members: $checkedConvert('members', (v) => (v as num?)?.toInt()),
          seats: $checkedConvert('seats', (v) => (v as num?)?.toInt()),
          engineVersion: $checkedConvert('engine_version', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'instanceId': 'instance_id',
        'expiresAt': 'expires_at',
        'graceUntil': 'grace_until',
        'engineVersion': 'engine_version',
      },
    );

Map<String, dynamic> _$SelfhostStatusToJson(SelfhostStatus instance) =>
    <String, dynamic>{
      'licensing': instance.licensing,
      'state': ?_$SelfhostStatusStateEnumEnumMap[instance.state],
      'edition': ?_$SelfhostStatusEditionEnumEnumMap[instance.edition],
      'instance_id': ?instance.instanceId,
      'expires_at': ?instance.expiresAt?.toIso8601String(),
      'grace_until': ?instance.graceUntil?.toIso8601String(),
      'members': ?instance.members,
      'seats': ?instance.seats,
      'engine_version': ?instance.engineVersion,
    };

const _$SelfhostStatusStateEnumEnumMap = {
  SelfhostStatusStateEnum.setup: 'setup',
  SelfhostStatusStateEnum.active: 'active',
  SelfhostStatusStateEnum.grace: 'grace',
  SelfhostStatusStateEnum.expired: 'expired',
};

const _$SelfhostStatusEditionEnumEnumMap = {
  SelfhostStatusEditionEnum.personal: 'personal',
  SelfhostStatusEditionEnum.trial: 'trial',
  SelfhostStatusEditionEnum.business: 'business',
};
