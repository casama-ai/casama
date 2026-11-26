// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_band_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AgeBandResultCWProxy {
  AgeBandResult accountAgeBand(AccountAgeBand? accountAgeBand);

  AgeBandResult accountAgeBandUpdatedAt(DateTime accountAgeBandUpdatedAt);

  AgeBandResult accepted(bool? accepted);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AgeBandResult(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AgeBandResult(...).copyWith(id: 12, name: "My name")
  /// ```
  AgeBandResult call({
    AccountAgeBand? accountAgeBand,
    DateTime accountAgeBandUpdatedAt,
    bool? accepted,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAgeBandResult.copyWith(...)` or call `instanceOfAgeBandResult.copyWith.fieldName(value)` for a single field.
class _$AgeBandResultCWProxyImpl implements _$AgeBandResultCWProxy {
  const _$AgeBandResultCWProxyImpl(this._value);

  final AgeBandResult _value;

  @override
  AgeBandResult accountAgeBand(AccountAgeBand? accountAgeBand) =>
      call(accountAgeBand: accountAgeBand);

  @override
  AgeBandResult accountAgeBandUpdatedAt(DateTime accountAgeBandUpdatedAt) =>
      call(accountAgeBandUpdatedAt: accountAgeBandUpdatedAt);

  @override
  AgeBandResult accepted(bool? accepted) => call(accepted: accepted);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AgeBandResult(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AgeBandResult(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AgeBandResult call({
    Object? accountAgeBand = const $CopyWithPlaceholder(),
    Object? accountAgeBandUpdatedAt = const $CopyWithPlaceholder(),
    Object? accepted = const $CopyWithPlaceholder(),
  }) {
    return AgeBandResult(
      accountAgeBand: accountAgeBand == const $CopyWithPlaceholder()
          ? _value.accountAgeBand
          // ignore: cast_nullable_to_non_nullable
          : accountAgeBand as AccountAgeBand?,
      accountAgeBandUpdatedAt:
          accountAgeBandUpdatedAt == const $CopyWithPlaceholder() ||
              accountAgeBandUpdatedAt == null
          ? _value.accountAgeBandUpdatedAt
          // ignore: cast_nullable_to_non_nullable
          : accountAgeBandUpdatedAt as DateTime,
      accepted: accepted == const $CopyWithPlaceholder()
          ? _value.accepted
          // ignore: cast_nullable_to_non_nullable
          : accepted as bool?,
    );
  }
}

extension $AgeBandResultCopyWith on AgeBandResult {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAgeBandResult.copyWith(...)` or `instanceOfAgeBandResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AgeBandResultCWProxy get copyWith => _$AgeBandResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgeBandResult _$AgeBandResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AgeBandResult',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'account_age_band',
            'account_age_band_updated_at',
          ],
        );
        final val = AgeBandResult(
          accountAgeBand: $checkedConvert(
            'account_age_band',
            (v) => $enumDecodeNullable(_$AccountAgeBandEnumMap, v),
          ),
          accountAgeBandUpdatedAt: $checkedConvert(
            'account_age_band_updated_at',
            (v) => DateTime.parse(v as String),
          ),
          accepted: $checkedConvert('accepted', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'accountAgeBand': 'account_age_band',
        'accountAgeBandUpdatedAt': 'account_age_band_updated_at',
      },
    );

Map<String, dynamic> _$AgeBandResultToJson(AgeBandResult instance) =>
    <String, dynamic>{
      'account_age_band': _$AccountAgeBandEnumMap[instance.accountAgeBand],
      'account_age_band_updated_at': instance.accountAgeBandUpdatedAt
          .toIso8601String(),
      'accepted': ?instance.accepted,
    };

const _$AccountAgeBandEnumMap = {
  AccountAgeBand.under13: 'under13',
  AccountAgeBand.n13to15: '13to15',
  AccountAgeBand.n16to17: '16to17',
  AccountAgeBand.n18plus: '18plus',
  AccountAgeBand.declined: 'declined',
};
