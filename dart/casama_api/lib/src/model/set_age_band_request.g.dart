// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_age_band_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetAgeBandRequestCWProxy {
  SetAgeBandRequest ageBand(AccountAgeBand? ageBand);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetAgeBandRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetAgeBandRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetAgeBandRequest call({AccountAgeBand? ageBand});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetAgeBandRequest.copyWith(...)` or call `instanceOfSetAgeBandRequest.copyWith.fieldName(value)` for a single field.
class _$SetAgeBandRequestCWProxyImpl implements _$SetAgeBandRequestCWProxy {
  const _$SetAgeBandRequestCWProxyImpl(this._value);

  final SetAgeBandRequest _value;

  @override
  SetAgeBandRequest ageBand(AccountAgeBand? ageBand) => call(ageBand: ageBand);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetAgeBandRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetAgeBandRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetAgeBandRequest call({Object? ageBand = const $CopyWithPlaceholder()}) {
    return SetAgeBandRequest(
      ageBand: ageBand == const $CopyWithPlaceholder()
          ? _value.ageBand
          // ignore: cast_nullable_to_non_nullable
          : ageBand as AccountAgeBand?,
    );
  }
}

extension $SetAgeBandRequestCopyWith on SetAgeBandRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetAgeBandRequest.copyWith(...)` or `instanceOfSetAgeBandRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetAgeBandRequestCWProxy get copyWith =>
      _$SetAgeBandRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAgeBandRequest _$SetAgeBandRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SetAgeBandRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['age_band']);
      final val = SetAgeBandRequest(
        ageBand: $checkedConvert(
          'age_band',
          (v) => $enumDecodeNullable(_$AccountAgeBandEnumMap, v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'ageBand': 'age_band'});

Map<String, dynamic> _$SetAgeBandRequestToJson(SetAgeBandRequest instance) =>
    <String, dynamic>{'age_band': _$AccountAgeBandEnumMap[instance.ageBand]};

const _$AccountAgeBandEnumMap = {
  AccountAgeBand.under13: 'under13',
  AccountAgeBand.n13to15: '13to15',
  AccountAgeBand.n16to17: '16to17',
  AccountAgeBand.n18plus: '18plus',
  AccountAgeBand.declined: 'declined',
};
