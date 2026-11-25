// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_partner_sync.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminPartnerSyncCWProxy {
  AdminPartnerSync partners(int partners);

  AdminPartnerSync paid(int paid);

  AdminPartnerSync pushed(int pushed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnerSync(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnerSync(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminPartnerSync call({int partners, int paid, int pushed});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminPartnerSync.copyWith(...)` or call `instanceOfAdminPartnerSync.copyWith.fieldName(value)` for a single field.
class _$AdminPartnerSyncCWProxyImpl implements _$AdminPartnerSyncCWProxy {
  const _$AdminPartnerSyncCWProxyImpl(this._value);

  final AdminPartnerSync _value;

  @override
  AdminPartnerSync partners(int partners) => call(partners: partners);

  @override
  AdminPartnerSync paid(int paid) => call(paid: paid);

  @override
  AdminPartnerSync pushed(int pushed) => call(pushed: pushed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminPartnerSync(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminPartnerSync(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminPartnerSync call({
    Object? partners = const $CopyWithPlaceholder(),
    Object? paid = const $CopyWithPlaceholder(),
    Object? pushed = const $CopyWithPlaceholder(),
  }) {
    return AdminPartnerSync(
      partners: partners == const $CopyWithPlaceholder() || partners == null
          ? _value.partners
          // ignore: cast_nullable_to_non_nullable
          : partners as int,
      paid: paid == const $CopyWithPlaceholder() || paid == null
          ? _value.paid
          // ignore: cast_nullable_to_non_nullable
          : paid as int,
      pushed: pushed == const $CopyWithPlaceholder() || pushed == null
          ? _value.pushed
          // ignore: cast_nullable_to_non_nullable
          : pushed as int,
    );
  }
}

extension $AdminPartnerSyncCopyWith on AdminPartnerSync {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminPartnerSync.copyWith(...)` or `instanceOfAdminPartnerSync.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminPartnerSyncCWProxy get copyWith => _$AdminPartnerSyncCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPartnerSync _$AdminPartnerSyncFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminPartnerSync', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['partners', 'paid', 'pushed']);
      final val = AdminPartnerSync(
        partners: $checkedConvert('partners', (v) => (v as num).toInt()),
        paid: $checkedConvert('paid', (v) => (v as num).toInt()),
        pushed: $checkedConvert('pushed', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$AdminPartnerSyncToJson(AdminPartnerSync instance) =>
    <String, dynamic>{
      'partners': instance.partners,
      'paid': instance.paid,
      'pushed': instance.pushed,
    };
