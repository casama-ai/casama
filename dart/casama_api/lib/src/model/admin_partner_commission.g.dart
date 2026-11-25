// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_partner_commission.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminPartnerCommissionCWProxy {
  AdminPartnerCommission id(String id);

  AdminPartnerCommission partnerId(String partnerId);

  AdminPartnerCommission partnerName(String partnerName);

  AdminPartnerCommission kind(AdminPartnerCommissionKindEnum kind);

  AdminPartnerCommission source_(String? source_);

  AdminPartnerCommission baseUsd(num baseUsd);

  AdminPartnerCommission rate(num rate);

  AdminPartnerCommission amountUsd(num amountUsd);

  AdminPartnerCommission status(AdminPartnerCommissionStatusEnum status);

  AdminPartnerCommission holdUntil(DateTime holdUntil);

  AdminPartnerCommission note(String? note);

  AdminPartnerCommission syncState(String syncState);

  AdminPartnerCommission syncError(String? syncError);

  AdminPartnerCommission paidAt(DateTime? paidAt);

  AdminPartnerCommission createdAt(DateTime createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnerCommission(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnerCommission(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminPartnerCommission call({
    String id,
    String partnerId,
    String partnerName,
    AdminPartnerCommissionKindEnum kind,
    String? source_,
    num baseUsd,
    num rate,
    num amountUsd,
    AdminPartnerCommissionStatusEnum status,
    DateTime holdUntil,
    String? note,
    String syncState,
    String? syncError,
    DateTime? paidAt,
    DateTime createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminPartnerCommission.copyWith(...)` or call `instanceOfAdminPartnerCommission.copyWith.fieldName(value)` for a single field.
class _$AdminPartnerCommissionCWProxyImpl
    implements _$AdminPartnerCommissionCWProxy {
  const _$AdminPartnerCommissionCWProxyImpl(this._value);

  final AdminPartnerCommission _value;

  @override
  AdminPartnerCommission id(String id) => call(id: id);

  @override
  AdminPartnerCommission partnerId(String partnerId) =>
      call(partnerId: partnerId);

  @override
  AdminPartnerCommission partnerName(String partnerName) =>
      call(partnerName: partnerName);

  @override
  AdminPartnerCommission kind(AdminPartnerCommissionKindEnum kind) =>
      call(kind: kind);

  @override
  AdminPartnerCommission source_(String? source_) => call(source_: source_);

  @override
  AdminPartnerCommission baseUsd(num baseUsd) => call(baseUsd: baseUsd);

  @override
  AdminPartnerCommission rate(num rate) => call(rate: rate);

  @override
  AdminPartnerCommission amountUsd(num amountUsd) => call(amountUsd: amountUsd);

  @override
  AdminPartnerCommission status(AdminPartnerCommissionStatusEnum status) =>
      call(status: status);

  @override
  AdminPartnerCommission holdUntil(DateTime holdUntil) =>
      call(holdUntil: holdUntil);

  @override
  AdminPartnerCommission note(String? note) => call(note: note);

  @override
  AdminPartnerCommission syncState(String syncState) =>
      call(syncState: syncState);

  @override
  AdminPartnerCommission syncError(String? syncError) =>
      call(syncError: syncError);

  @override
  AdminPartnerCommission paidAt(DateTime? paidAt) => call(paidAt: paidAt);

  @override
  AdminPartnerCommission createdAt(DateTime createdAt) =>
      call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnerCommission(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnerCommission(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminPartnerCommission call({
    Object? id = const $CopyWithPlaceholder(),
    Object? partnerId = const $CopyWithPlaceholder(),
    Object? partnerName = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? baseUsd = const $CopyWithPlaceholder(),
    Object? rate = const $CopyWithPlaceholder(),
    Object? amountUsd = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? holdUntil = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? syncState = const $CopyWithPlaceholder(),
    Object? syncError = const $CopyWithPlaceholder(),
    Object? paidAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return AdminPartnerCommission(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      partnerId: partnerId == const $CopyWithPlaceholder() || partnerId == null
          ? _value.partnerId
          // ignore: cast_nullable_to_non_nullable
          : partnerId as String,
      partnerName:
          partnerName == const $CopyWithPlaceholder() || partnerName == null
          ? _value.partnerName
          // ignore: cast_nullable_to_non_nullable
          : partnerName as String,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as AdminPartnerCommissionKindEnum,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String?,
      baseUsd: baseUsd == const $CopyWithPlaceholder() || baseUsd == null
          ? _value.baseUsd
          // ignore: cast_nullable_to_non_nullable
          : baseUsd as num,
      rate: rate == const $CopyWithPlaceholder() || rate == null
          ? _value.rate
          // ignore: cast_nullable_to_non_nullable
          : rate as num,
      amountUsd: amountUsd == const $CopyWithPlaceholder() || amountUsd == null
          ? _value.amountUsd
          // ignore: cast_nullable_to_non_nullable
          : amountUsd as num,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AdminPartnerCommissionStatusEnum,
      holdUntil: holdUntil == const $CopyWithPlaceholder() || holdUntil == null
          ? _value.holdUntil
          // ignore: cast_nullable_to_non_nullable
          : holdUntil as DateTime,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      syncState: syncState == const $CopyWithPlaceholder() || syncState == null
          ? _value.syncState
          // ignore: cast_nullable_to_non_nullable
          : syncState as String,
      syncError: syncError == const $CopyWithPlaceholder()
          ? _value.syncError
          // ignore: cast_nullable_to_non_nullable
          : syncError as String?,
      paidAt: paidAt == const $CopyWithPlaceholder()
          ? _value.paidAt
          // ignore: cast_nullable_to_non_nullable
          : paidAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $AdminPartnerCommissionCopyWith on AdminPartnerCommission {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminPartnerCommission.copyWith(...)` or `instanceOfAdminPartnerCommission.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminPartnerCommissionCWProxy get copyWith =>
      _$AdminPartnerCommissionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPartnerCommission _$AdminPartnerCommissionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminPartnerCommission',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'partner_id',
        'partner_name',
        'kind',
        'source',
        'base_usd',
        'rate',
        'amount_usd',
        'status',
        'hold_until',
        'note',
        'sync_state',
        'sync_error',
        'paid_at',
        'created_at',
      ],
    );
    final val = AdminPartnerCommission(
      id: $checkedConvert('id', (v) => v as String),
      partnerId: $checkedConvert('partner_id', (v) => v as String),
      partnerName: $checkedConvert('partner_name', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(_$AdminPartnerCommissionKindEnumEnumMap, v),
      ),
      source_: $checkedConvert('source', (v) => v as String?),
      baseUsd: $checkedConvert('base_usd', (v) => v as num),
      rate: $checkedConvert('rate', (v) => v as num),
      amountUsd: $checkedConvert('amount_usd', (v) => v as num),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$AdminPartnerCommissionStatusEnumEnumMap, v),
      ),
      holdUntil: $checkedConvert(
        'hold_until',
        (v) => DateTime.parse(v as String),
      ),
      note: $checkedConvert('note', (v) => v as String?),
      syncState: $checkedConvert('sync_state', (v) => v as String),
      syncError: $checkedConvert('sync_error', (v) => v as String?),
      paidAt: $checkedConvert(
        'paid_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'partnerId': 'partner_id',
    'partnerName': 'partner_name',
    'source_': 'source',
    'baseUsd': 'base_usd',
    'amountUsd': 'amount_usd',
    'holdUntil': 'hold_until',
    'syncState': 'sync_state',
    'syncError': 'sync_error',
    'paidAt': 'paid_at',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$AdminPartnerCommissionToJson(
  AdminPartnerCommission instance,
) => <String, dynamic>{
  'id': instance.id,
  'partner_id': instance.partnerId,
  'partner_name': instance.partnerName,
  'kind': _$AdminPartnerCommissionKindEnumEnumMap[instance.kind]!,
  'source': instance.source_,
  'base_usd': instance.baseUsd,
  'rate': instance.rate,
  'amount_usd': instance.amountUsd,
  'status': _$AdminPartnerCommissionStatusEnumEnumMap[instance.status]!,
  'hold_until': instance.holdUntil.toIso8601String(),
  'note': instance.note,
  'sync_state': instance.syncState,
  'sync_error': instance.syncError,
  'paid_at': instance.paidAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};

const _$AdminPartnerCommissionKindEnumEnumMap = {
  AdminPartnerCommissionKindEnum.sale: 'sale',
  AdminPartnerCommissionKindEnum.reversal: 'reversal',
  AdminPartnerCommissionKindEnum.manual: 'manual',
};

const _$AdminPartnerCommissionStatusEnumEnumMap = {
  AdminPartnerCommissionStatusEnum.pending: 'pending',
  AdminPartnerCommissionStatusEnum.payable: 'payable',
  AdminPartnerCommissionStatusEnum.paid: 'paid',
  AdminPartnerCommissionStatusEnum.heldForReview: 'held_for_review',
  AdminPartnerCommissionStatusEnum.void_: 'void',
};
