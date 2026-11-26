// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_selfhost_license_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetSelfhostLicenseRequestCWProxy {
  SetSelfhostLicenseRequest license(String license);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetSelfhostLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetSelfhostLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetSelfhostLicenseRequest call({String license});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetSelfhostLicenseRequest.copyWith(...)` or call `instanceOfSetSelfhostLicenseRequest.copyWith.fieldName(value)` for a single field.
class _$SetSelfhostLicenseRequestCWProxyImpl
    implements _$SetSelfhostLicenseRequestCWProxy {
  const _$SetSelfhostLicenseRequestCWProxyImpl(this._value);

  final SetSelfhostLicenseRequest _value;

  @override
  SetSelfhostLicenseRequest license(String license) => call(license: license);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetSelfhostLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetSelfhostLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetSelfhostLicenseRequest call({
    Object? license = const $CopyWithPlaceholder(),
  }) {
    return SetSelfhostLicenseRequest(
      license: license == const $CopyWithPlaceholder() || license == null
          ? _value.license
          // ignore: cast_nullable_to_non_nullable
          : license as String,
    );
  }
}

extension $SetSelfhostLicenseRequestCopyWith on SetSelfhostLicenseRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetSelfhostLicenseRequest.copyWith(...)` or `instanceOfSetSelfhostLicenseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetSelfhostLicenseRequestCWProxy get copyWith =>
      _$SetSelfhostLicenseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSelfhostLicenseRequest _$SetSelfhostLicenseRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetSelfhostLicenseRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['license']);
  final val = SetSelfhostLicenseRequest(
    license: $checkedConvert('license', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$SetSelfhostLicenseRequestToJson(
  SetSelfhostLicenseRequest instance,
) => <String, dynamic>{'license': instance.license};
