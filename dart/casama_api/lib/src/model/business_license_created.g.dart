// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_license_created.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BusinessLicenseCreatedCWProxy {
  BusinessLicenseCreated id(String id);

  BusinessLicenseCreated license(String license);

  BusinessLicenseCreated expiresAt(DateTime expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BusinessLicenseCreated(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BusinessLicenseCreated(...).copyWith(id: 12, name: "My name")
  /// ```
  BusinessLicenseCreated call({String id, String license, DateTime expiresAt});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBusinessLicenseCreated.copyWith(...)` or call `instanceOfBusinessLicenseCreated.copyWith.fieldName(value)` for a single field.
class _$BusinessLicenseCreatedCWProxyImpl
    implements _$BusinessLicenseCreatedCWProxy {
  const _$BusinessLicenseCreatedCWProxyImpl(this._value);

  final BusinessLicenseCreated _value;

  @override
  BusinessLicenseCreated id(String id) => call(id: id);

  @override
  BusinessLicenseCreated license(String license) => call(license: license);

  @override
  BusinessLicenseCreated expiresAt(DateTime expiresAt) =>
      call(expiresAt: expiresAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BusinessLicenseCreated(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BusinessLicenseCreated(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BusinessLicenseCreated call({
    Object? id = const $CopyWithPlaceholder(),
    Object? license = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return BusinessLicenseCreated(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
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

extension $BusinessLicenseCreatedCopyWith on BusinessLicenseCreated {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBusinessLicenseCreated.copyWith(...)` or `instanceOfBusinessLicenseCreated.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BusinessLicenseCreatedCWProxy get copyWith =>
      _$BusinessLicenseCreatedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessLicenseCreated _$BusinessLicenseCreatedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BusinessLicenseCreated', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'license', 'expires_at']);
  final val = BusinessLicenseCreated(
    id: $checkedConvert('id', (v) => v as String),
    license: $checkedConvert('license', (v) => v as String),
    expiresAt: $checkedConvert(
      'expires_at',
      (v) => DateTime.parse(v as String),
    ),
  );
  return val;
}, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$BusinessLicenseCreatedToJson(
  BusinessLicenseCreated instance,
) => <String, dynamic>{
  'id': instance.id,
  'license': instance.license,
  'expires_at': instance.expiresAt.toIso8601String(),
};
