// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_issued.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LicenseIssuedCWProxy {
  LicenseIssued license(String license);

  LicenseIssued expiresAt(DateTime expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `LicenseIssued(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LicenseIssued(...).copyWith(id: 12, name: "My name")
  /// ```
  LicenseIssued call({String license, DateTime expiresAt});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLicenseIssued.copyWith(...)` or call `instanceOfLicenseIssued.copyWith.fieldName(value)` for a single field.
class _$LicenseIssuedCWProxyImpl implements _$LicenseIssuedCWProxy {
  const _$LicenseIssuedCWProxyImpl(this._value);

  final LicenseIssued _value;

  @override
  LicenseIssued license(String license) => call(license: license);

  @override
  LicenseIssued expiresAt(DateTime expiresAt) => call(expiresAt: expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `LicenseIssued(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LicenseIssued(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  LicenseIssued call({
    Object? license = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return LicenseIssued(
      license: license == const $CopyWithPlaceholder() || license == null
          ? _value.license
          // ignore: cast_nullable_to_non_nullable
          : license as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder() || expiresAt == null
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $LicenseIssuedCopyWith on LicenseIssued {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLicenseIssued.copyWith(...)` or `instanceOfLicenseIssued.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LicenseIssuedCWProxy get copyWith => _$LicenseIssuedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicenseIssued _$LicenseIssuedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LicenseIssued', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['license', 'expires_at']);
      final val = LicenseIssued(
        license: $checkedConvert('license', (v) => v as String),
        expiresAt: $checkedConvert(
          'expires_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$LicenseIssuedToJson(LicenseIssued instance) =>
    <String, dynamic>{
      'license': instance.license,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
