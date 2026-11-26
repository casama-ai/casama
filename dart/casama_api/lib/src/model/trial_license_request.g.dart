// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trial_license_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TrialLicenseRequestCWProxy {
  TrialLicenseRequest email(String email);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `TrialLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TrialLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  TrialLicenseRequest call({String email});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTrialLicenseRequest.copyWith(...)` or call `instanceOfTrialLicenseRequest.copyWith.fieldName(value)` for a single field.
class _$TrialLicenseRequestCWProxyImpl implements _$TrialLicenseRequestCWProxy {
  const _$TrialLicenseRequestCWProxyImpl(this._value);

  final TrialLicenseRequest _value;

  @override
  TrialLicenseRequest email(String email) => call(email: email);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `TrialLicenseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TrialLicenseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  TrialLicenseRequest call({Object? email = const $CopyWithPlaceholder()}) {
    return TrialLicenseRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $TrialLicenseRequestCopyWith on TrialLicenseRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTrialLicenseRequest.copyWith(...)` or `instanceOfTrialLicenseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TrialLicenseRequestCWProxy get copyWith =>
      _$TrialLicenseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrialLicenseRequest _$TrialLicenseRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TrialLicenseRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email']);
      final val = TrialLicenseRequest(
        email: $checkedConvert('email', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TrialLicenseRequestToJson(
  TrialLicenseRequest instance,
) => <String, dynamic>{'email': instance.email};
