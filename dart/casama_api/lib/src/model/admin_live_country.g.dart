// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_live_country.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminLiveCountryCWProxy {
  AdminLiveCountry country(String country);

  AdminLiveCountry users(int users);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLiveCountry(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLiveCountry(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminLiveCountry call({String country, int users});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminLiveCountry.copyWith(...)` or call `instanceOfAdminLiveCountry.copyWith.fieldName(value)` for a single field.
class _$AdminLiveCountryCWProxyImpl implements _$AdminLiveCountryCWProxy {
  const _$AdminLiveCountryCWProxyImpl(this._value);

  final AdminLiveCountry _value;

  @override
  AdminLiveCountry country(String country) => call(country: country);

  @override
  AdminLiveCountry users(int users) => call(users: users);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLiveCountry(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLiveCountry(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminLiveCountry call({
    Object? country = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
  }) {
    return AdminLiveCountry(
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as int,
    );
  }
}

extension $AdminLiveCountryCopyWith on AdminLiveCountry {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminLiveCountry.copyWith(...)` or `instanceOfAdminLiveCountry.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminLiveCountryCWProxy get copyWith => _$AdminLiveCountryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLiveCountry _$AdminLiveCountryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminLiveCountry', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['country', 'users']);
      final val = AdminLiveCountry(
        country: $checkedConvert('country', (v) => v as String),
        users: $checkedConvert('users', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$AdminLiveCountryToJson(AdminLiveCountry instance) =>
    <String, dynamic>{'country': instance.country, 'users': instance.users};
