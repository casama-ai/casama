// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trial_license_accepted.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TrialLicenseAcceptedCWProxy {
  TrialLicenseAccepted ok(bool ok);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `TrialLicenseAccepted(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TrialLicenseAccepted(...).copyWith(id: 12, name: "My name")
  /// ```
  TrialLicenseAccepted call({bool ok});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTrialLicenseAccepted.copyWith(...)` or call `instanceOfTrialLicenseAccepted.copyWith.fieldName(value)` for a single field.
class _$TrialLicenseAcceptedCWProxyImpl
    implements _$TrialLicenseAcceptedCWProxy {
  const _$TrialLicenseAcceptedCWProxyImpl(this._value);

  final TrialLicenseAccepted _value;

  @override
  TrialLicenseAccepted ok(bool ok) => call(ok: ok);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `TrialLicenseAccepted(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TrialLicenseAccepted(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  TrialLicenseAccepted call({Object? ok = const $CopyWithPlaceholder()}) {
    return TrialLicenseAccepted(
      ok: ok == const $CopyWithPlaceholder() || ok == null
          ? _value.ok
          // ignore: cast_nullable_to_non_nullable
          : ok as bool,
    );
  }
}

extension $TrialLicenseAcceptedCopyWith on TrialLicenseAccepted {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTrialLicenseAccepted.copyWith(...)` or `instanceOfTrialLicenseAccepted.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TrialLicenseAcceptedCWProxy get copyWith =>
      _$TrialLicenseAcceptedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrialLicenseAccepted _$TrialLicenseAcceptedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TrialLicenseAccepted', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['ok']);
  final val = TrialLicenseAccepted(ok: $checkedConvert('ok', (v) => v as bool));
  return val;
});

Map<String, dynamic> _$TrialLicenseAcceptedToJson(
  TrialLicenseAccepted instance,
) => <String, dynamic>{'ok': instance.ok};
