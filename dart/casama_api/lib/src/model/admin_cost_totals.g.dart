// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_cost_totals.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminCostTotalsCWProxy {
  AdminCostTotals spentUsd(num spentUsd);

  AdminCostTotals chargedUsd(num chargedUsd);

  AdminCostTotals chargedTrackedUsd(num chargedTrackedUsd);

  AdminCostTotals ownUsd(num ownUsd);

  AdminCostTotals fixedUsd(num fixedUsd);

  AdminCostTotals notRecordedUsd(num notRecordedUsd);

  AdminCostTotals calls(int calls);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostTotals(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostTotals(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminCostTotals call({
    num spentUsd,
    num chargedUsd,
    num chargedTrackedUsd,
    num ownUsd,
    num fixedUsd,
    num notRecordedUsd,
    int calls,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminCostTotals.copyWith(...)` or call `instanceOfAdminCostTotals.copyWith.fieldName(value)` for a single field.
class _$AdminCostTotalsCWProxyImpl implements _$AdminCostTotalsCWProxy {
  const _$AdminCostTotalsCWProxyImpl(this._value);

  final AdminCostTotals _value;

  @override
  AdminCostTotals spentUsd(num spentUsd) => call(spentUsd: spentUsd);

  @override
  AdminCostTotals chargedUsd(num chargedUsd) => call(chargedUsd: chargedUsd);

  @override
  AdminCostTotals chargedTrackedUsd(num chargedTrackedUsd) =>
      call(chargedTrackedUsd: chargedTrackedUsd);

  @override
  AdminCostTotals ownUsd(num ownUsd) => call(ownUsd: ownUsd);

  @override
  AdminCostTotals fixedUsd(num fixedUsd) => call(fixedUsd: fixedUsd);

  @override
  AdminCostTotals notRecordedUsd(num notRecordedUsd) =>
      call(notRecordedUsd: notRecordedUsd);

  @override
  AdminCostTotals calls(int calls) => call(calls: calls);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostTotals(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostTotals(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminCostTotals call({
    Object? spentUsd = const $CopyWithPlaceholder(),
    Object? chargedUsd = const $CopyWithPlaceholder(),
    Object? chargedTrackedUsd = const $CopyWithPlaceholder(),
    Object? ownUsd = const $CopyWithPlaceholder(),
    Object? fixedUsd = const $CopyWithPlaceholder(),
    Object? notRecordedUsd = const $CopyWithPlaceholder(),
    Object? calls = const $CopyWithPlaceholder(),
  }) {
    return AdminCostTotals(
      spentUsd: spentUsd == const $CopyWithPlaceholder() || spentUsd == null
          ? _value.spentUsd
          // ignore: cast_nullable_to_non_nullable
          : spentUsd as num,
      chargedUsd:
          chargedUsd == const $CopyWithPlaceholder() || chargedUsd == null
          ? _value.chargedUsd
          // ignore: cast_nullable_to_non_nullable
          : chargedUsd as num,
      chargedTrackedUsd:
          chargedTrackedUsd == const $CopyWithPlaceholder() ||
              chargedTrackedUsd == null
          ? _value.chargedTrackedUsd
          // ignore: cast_nullable_to_non_nullable
          : chargedTrackedUsd as num,
      ownUsd: ownUsd == const $CopyWithPlaceholder() || ownUsd == null
          ? _value.ownUsd
          // ignore: cast_nullable_to_non_nullable
          : ownUsd as num,
      fixedUsd: fixedUsd == const $CopyWithPlaceholder() || fixedUsd == null
          ? _value.fixedUsd
          // ignore: cast_nullable_to_non_nullable
          : fixedUsd as num,
      notRecordedUsd:
          notRecordedUsd == const $CopyWithPlaceholder() ||
              notRecordedUsd == null
          ? _value.notRecordedUsd
          // ignore: cast_nullable_to_non_nullable
          : notRecordedUsd as num,
      calls: calls == const $CopyWithPlaceholder() || calls == null
          ? _value.calls
          // ignore: cast_nullable_to_non_nullable
          : calls as int,
    );
  }
}

extension $AdminCostTotalsCopyWith on AdminCostTotals {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminCostTotals.copyWith(...)` or `instanceOfAdminCostTotals.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminCostTotalsCWProxy get copyWith => _$AdminCostTotalsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCostTotals _$AdminCostTotalsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminCostTotals',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'spent_usd',
            'charged_usd',
            'charged_tracked_usd',
            'own_usd',
            'fixed_usd',
            'not_recorded_usd',
            'calls',
          ],
        );
        final val = AdminCostTotals(
          spentUsd: $checkedConvert('spent_usd', (v) => v as num),
          chargedUsd: $checkedConvert('charged_usd', (v) => v as num),
          chargedTrackedUsd: $checkedConvert(
            'charged_tracked_usd',
            (v) => v as num,
          ),
          ownUsd: $checkedConvert('own_usd', (v) => v as num),
          fixedUsd: $checkedConvert('fixed_usd', (v) => v as num),
          notRecordedUsd: $checkedConvert('not_recorded_usd', (v) => v as num),
          calls: $checkedConvert('calls', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'spentUsd': 'spent_usd',
        'chargedUsd': 'charged_usd',
        'chargedTrackedUsd': 'charged_tracked_usd',
        'ownUsd': 'own_usd',
        'fixedUsd': 'fixed_usd',
        'notRecordedUsd': 'not_recorded_usd',
      },
    );

Map<String, dynamic> _$AdminCostTotalsToJson(AdminCostTotals instance) =>
    <String, dynamic>{
      'spent_usd': instance.spentUsd,
      'charged_usd': instance.chargedUsd,
      'charged_tracked_usd': instance.chargedTrackedUsd,
      'own_usd': instance.ownUsd,
      'fixed_usd': instance.fixedUsd,
      'not_recorded_usd': instance.notRecordedUsd,
      'calls': instance.calls,
    };
