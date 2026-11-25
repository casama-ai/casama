// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_partners_totals.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminPartnersTotalsCWProxy {
  AdminPartnersTotals pendingUsd(num pendingUsd);

  AdminPartnersTotals payableUsd(num payableUsd);

  AdminPartnersTotals paidUsd(num paidUsd);

  AdminPartnersTotals unreadCharges(int unreadCharges);

  AdminPartnersTotals syncFailed(int syncFailed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnersTotals(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnersTotals(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminPartnersTotals call({
    num pendingUsd,
    num payableUsd,
    num paidUsd,
    int unreadCharges,
    int syncFailed,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminPartnersTotals.copyWith(...)` or call `instanceOfAdminPartnersTotals.copyWith.fieldName(value)` for a single field.
class _$AdminPartnersTotalsCWProxyImpl implements _$AdminPartnersTotalsCWProxy {
  const _$AdminPartnersTotalsCWProxyImpl(this._value);

  final AdminPartnersTotals _value;

  @override
  AdminPartnersTotals pendingUsd(num pendingUsd) =>
      call(pendingUsd: pendingUsd);

  @override
  AdminPartnersTotals payableUsd(num payableUsd) =>
      call(payableUsd: payableUsd);

  @override
  AdminPartnersTotals paidUsd(num paidUsd) => call(paidUsd: paidUsd);

  @override
  AdminPartnersTotals unreadCharges(int unreadCharges) =>
      call(unreadCharges: unreadCharges);

  @override
  AdminPartnersTotals syncFailed(int syncFailed) =>
      call(syncFailed: syncFailed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnersTotals(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnersTotals(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminPartnersTotals call({
    Object? pendingUsd = const $CopyWithPlaceholder(),
    Object? payableUsd = const $CopyWithPlaceholder(),
    Object? paidUsd = const $CopyWithPlaceholder(),
    Object? unreadCharges = const $CopyWithPlaceholder(),
    Object? syncFailed = const $CopyWithPlaceholder(),
  }) {
    return AdminPartnersTotals(
      pendingUsd:
          pendingUsd == const $CopyWithPlaceholder() || pendingUsd == null
          ? _value.pendingUsd
          // ignore: cast_nullable_to_non_nullable
          : pendingUsd as num,
      payableUsd:
          payableUsd == const $CopyWithPlaceholder() || payableUsd == null
          ? _value.payableUsd
          // ignore: cast_nullable_to_non_nullable
          : payableUsd as num,
      paidUsd: paidUsd == const $CopyWithPlaceholder() || paidUsd == null
          ? _value.paidUsd
          // ignore: cast_nullable_to_non_nullable
          : paidUsd as num,
      unreadCharges:
          unreadCharges == const $CopyWithPlaceholder() || unreadCharges == null
          ? _value.unreadCharges
          // ignore: cast_nullable_to_non_nullable
          : unreadCharges as int,
      syncFailed:
          syncFailed == const $CopyWithPlaceholder() || syncFailed == null
          ? _value.syncFailed
          // ignore: cast_nullable_to_non_nullable
          : syncFailed as int,
    );
  }
}

extension $AdminPartnersTotalsCopyWith on AdminPartnersTotals {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminPartnersTotals.copyWith(...)` or `instanceOfAdminPartnersTotals.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminPartnersTotalsCWProxy get copyWith =>
      _$AdminPartnersTotalsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPartnersTotals _$AdminPartnersTotalsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminPartnersTotals',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'pending_usd',
            'payable_usd',
            'paid_usd',
            'unread_charges',
            'sync_failed',
          ],
        );
        final val = AdminPartnersTotals(
          pendingUsd: $checkedConvert('pending_usd', (v) => v as num),
          payableUsd: $checkedConvert('payable_usd', (v) => v as num),
          paidUsd: $checkedConvert('paid_usd', (v) => v as num),
          unreadCharges: $checkedConvert(
            'unread_charges',
            (v) => (v as num).toInt(),
          ),
          syncFailed: $checkedConvert('sync_failed', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'pendingUsd': 'pending_usd',
        'payableUsd': 'payable_usd',
        'paidUsd': 'paid_usd',
        'unreadCharges': 'unread_charges',
        'syncFailed': 'sync_failed',
      },
    );

Map<String, dynamic> _$AdminPartnersTotalsToJson(
  AdminPartnersTotals instance,
) => <String, dynamic>{
  'pending_usd': instance.pendingUsd,
  'payable_usd': instance.payableUsd,
  'paid_usd': instance.paidUsd,
  'unread_charges': instance.unreadCharges,
  'sync_failed': instance.syncFailed,
};
