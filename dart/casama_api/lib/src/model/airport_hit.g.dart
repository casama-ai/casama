// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_hit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AirportHitCWProxy {
  AirportHit label(String label);

  AirportHit codes(List<String> codes);

  AirportHit country(String country);

  AirportHit name(String? name);

  AirportHit kind(AirportHitKindEnum kind);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AirportHit(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AirportHit(...).copyWith(id: 12, name: "My name")
  /// ```
  AirportHit call({
    String label,
    List<String> codes,
    String country,
    String? name,
    AirportHitKindEnum kind,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAirportHit.copyWith(...)` or call `instanceOfAirportHit.copyWith.fieldName(value)` for a single field.
class _$AirportHitCWProxyImpl implements _$AirportHitCWProxy {
  const _$AirportHitCWProxyImpl(this._value);

  final AirportHit _value;

  @override
  AirportHit label(String label) => call(label: label);

  @override
  AirportHit codes(List<String> codes) => call(codes: codes);

  @override
  AirportHit country(String country) => call(country: country);

  @override
  AirportHit name(String? name) => call(name: name);

  @override
  AirportHit kind(AirportHitKindEnum kind) => call(kind: kind);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AirportHit(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AirportHit(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AirportHit call({
    Object? label = const $CopyWithPlaceholder(),
    Object? codes = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return AirportHit(
      label: label == const $CopyWithPlaceholder() || label == null
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
      codes: codes == const $CopyWithPlaceholder() || codes == null
          ? _value.codes
          // ignore: cast_nullable_to_non_nullable
          : codes as List<String>,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as AirportHitKindEnum,
    );
  }
}

extension $AirportHitCopyWith on AirportHit {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAirportHit.copyWith(...)` or `instanceOfAirportHit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AirportHitCWProxy get copyWith => _$AirportHitCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportHit _$AirportHitFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AirportHit',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['label', 'codes', 'country', 'kind']);
    final val = AirportHit(
      label: $checkedConvert('label', (v) => v as String),
      codes: $checkedConvert(
        'codes',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      country: $checkedConvert('country', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String?),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(_$AirportHitKindEnumEnumMap, v),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$AirportHitToJson(AirportHit instance) =>
    <String, dynamic>{
      'label': instance.label,
      'codes': instance.codes,
      'country': instance.country,
      'name': ?instance.name,
      'kind': _$AirportHitKindEnumEnumMap[instance.kind]!,
    };

const _$AirportHitKindEnumEnumMap = {
  AirportHitKindEnum.city: 'city',
  AirportHitKindEnum.airport: 'airport',
};
