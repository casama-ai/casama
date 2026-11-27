// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_agent_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminAgentRequestCWProxy {
  AdminAgentRequest id(String id);

  AdminAgentRequest keyId(String keyId);

  AdminAgentRequest keyName(String keyName);

  AdminAgentRequest reason(String reason);

  AdminAgentRequest minutes(int minutes);

  AdminAgentRequest status(AdminAgentRequestStatusEnum status);

  AdminAgentRequest createdAt(DateTime createdAt);

  AdminAgentRequest expiresAt(DateTime expiresAt);

  AdminAgentRequest answeredAt(DateTime? answeredAt);

  AdminAgentRequest validUntil(DateTime? validUntil);

  AdminAgentRequest endedAt(DateTime? endedAt);

  AdminAgentRequest changes(int changes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAgentRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAgentRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminAgentRequest call({
    String id,
    String keyId,
    String keyName,
    String reason,
    int minutes,
    AdminAgentRequestStatusEnum status,
    DateTime createdAt,
    DateTime expiresAt,
    DateTime? answeredAt,
    DateTime? validUntil,
    DateTime? endedAt,
    int changes,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminAgentRequest.copyWith(...)` or call `instanceOfAdminAgentRequest.copyWith.fieldName(value)` for a single field.
class _$AdminAgentRequestCWProxyImpl implements _$AdminAgentRequestCWProxy {
  const _$AdminAgentRequestCWProxyImpl(this._value);

  final AdminAgentRequest _value;

  @override
  AdminAgentRequest id(String id) => call(id: id);

  @override
  AdminAgentRequest keyId(String keyId) => call(keyId: keyId);

  @override
  AdminAgentRequest keyName(String keyName) => call(keyName: keyName);

  @override
  AdminAgentRequest reason(String reason) => call(reason: reason);

  @override
  AdminAgentRequest minutes(int minutes) => call(minutes: minutes);

  @override
  AdminAgentRequest status(AdminAgentRequestStatusEnum status) =>
      call(status: status);

  @override
  AdminAgentRequest createdAt(DateTime createdAt) => call(createdAt: createdAt);

  @override
  AdminAgentRequest expiresAt(DateTime expiresAt) => call(expiresAt: expiresAt);

  @override
  AdminAgentRequest answeredAt(DateTime? answeredAt) =>
      call(answeredAt: answeredAt);

  @override
  AdminAgentRequest validUntil(DateTime? validUntil) =>
      call(validUntil: validUntil);

  @override
  AdminAgentRequest endedAt(DateTime? endedAt) => call(endedAt: endedAt);

  @override
  AdminAgentRequest changes(int changes) => call(changes: changes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAgentRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAgentRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminAgentRequest call({
    Object? id = const $CopyWithPlaceholder(),
    Object? keyId = const $CopyWithPlaceholder(),
    Object? keyName = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? minutes = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? answeredAt = const $CopyWithPlaceholder(),
    Object? validUntil = const $CopyWithPlaceholder(),
    Object? endedAt = const $CopyWithPlaceholder(),
    Object? changes = const $CopyWithPlaceholder(),
  }) {
    return AdminAgentRequest(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      keyId: keyId == const $CopyWithPlaceholder() || keyId == null
          ? _value.keyId
          // ignore: cast_nullable_to_non_nullable
          : keyId as String,
      keyName: keyName == const $CopyWithPlaceholder() || keyName == null
          ? _value.keyName
          // ignore: cast_nullable_to_non_nullable
          : keyName as String,
      reason: reason == const $CopyWithPlaceholder() || reason == null
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String,
      minutes: minutes == const $CopyWithPlaceholder() || minutes == null
          ? _value.minutes
          // ignore: cast_nullable_to_non_nullable
          : minutes as int,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AdminAgentRequestStatusEnum,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      answeredAt: answeredAt == const $CopyWithPlaceholder()
          ? _value.answeredAt
          // ignore: cast_nullable_to_non_nullable
          : answeredAt as DateTime?,
      validUntil: validUntil == const $CopyWithPlaceholder()
          ? _value.validUntil
          // ignore: cast_nullable_to_non_nullable
          : validUntil as DateTime?,
      endedAt: endedAt == const $CopyWithPlaceholder()
          ? _value.endedAt
          // ignore: cast_nullable_to_non_nullable
          : endedAt as DateTime?,
      changes: changes == const $CopyWithPlaceholder() || changes == null
          ? _value.changes
          // ignore: cast_nullable_to_non_nullable
          : changes as int,
    );
  }
}

extension $AdminAgentRequestCopyWith on AdminAgentRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminAgentRequest.copyWith(...)` or `instanceOfAdminAgentRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminAgentRequestCWProxy get copyWith =>
      _$AdminAgentRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAgentRequest _$AdminAgentRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminAgentRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'key_id',
            'key_name',
            'reason',
            'minutes',
            'status',
            'created_at',
            'expires_at',
            'answered_at',
            'valid_until',
            'ended_at',
            'changes',
          ],
        );
        final val = AdminAgentRequest(
          id: $checkedConvert('id', (v) => v as String),
          keyId: $checkedConvert('key_id', (v) => v as String),
          keyName: $checkedConvert('key_name', (v) => v as String),
          reason: $checkedConvert('reason', (v) => v as String),
          minutes: $checkedConvert('minutes', (v) => (v as num).toInt()),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$AdminAgentRequestStatusEnumEnumMap, v),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          expiresAt: $checkedConvert(
            'expires_at',
            (v) => DateTime.parse(v as String),
          ),
          answeredAt: $checkedConvert(
            'answered_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          validUntil: $checkedConvert(
            'valid_until',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          endedAt: $checkedConvert(
            'ended_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          changes: $checkedConvert('changes', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'keyId': 'key_id',
        'keyName': 'key_name',
        'createdAt': 'created_at',
        'expiresAt': 'expires_at',
        'answeredAt': 'answered_at',
        'validUntil': 'valid_until',
        'endedAt': 'ended_at',
      },
    );

Map<String, dynamic> _$AdminAgentRequestToJson(AdminAgentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key_id': instance.keyId,
      'key_name': instance.keyName,
      'reason': instance.reason,
      'minutes': instance.minutes,
      'status': _$AdminAgentRequestStatusEnumEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'expires_at': instance.expiresAt.toIso8601String(),
      'answered_at': instance.answeredAt?.toIso8601String(),
      'valid_until': instance.validUntil?.toIso8601String(),
      'ended_at': instance.endedAt?.toIso8601String(),
      'changes': instance.changes,
    };

const _$AdminAgentRequestStatusEnumEnumMap = {
  AdminAgentRequestStatusEnum.pending: 'pending',
  AdminAgentRequestStatusEnum.approved: 'approved',
  AdminAgentRequestStatusEnum.denied: 'denied',
  AdminAgentRequestStatusEnum.expired: 'expired',
  AdminAgentRequestStatusEnum.ended: 'ended',
};
