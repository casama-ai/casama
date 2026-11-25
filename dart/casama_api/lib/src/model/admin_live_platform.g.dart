// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_live_platform.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminLivePlatformCWProxy {
  AdminLivePlatform platform(String platform);

  AdminLivePlatform users(int users);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLivePlatform(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLivePlatform(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminLivePlatform call({String platform, int users});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminLivePlatform.copyWith(...)` or call `instanceOfAdminLivePlatform.copyWith.fieldName(value)` for a single field.
class _$AdminLivePlatformCWProxyImpl implements _$AdminLivePlatformCWProxy {
  const _$AdminLivePlatformCWProxyImpl(this._value);

  final AdminLivePlatform _value;

  @override
  AdminLivePlatform platform(String platform) => call(platform: platform);

  @override
  AdminLivePlatform users(int users) => call(users: users);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLivePlatform(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLivePlatform(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminLivePlatform call({
    Object? platform = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
  }) {
    return AdminLivePlatform(
      platform: platform == const $CopyWithPlaceholder() || platform == null
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String,
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as int,
    );
  }
}

extension $AdminLivePlatformCopyWith on AdminLivePlatform {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminLivePlatform.copyWith(...)` or `instanceOfAdminLivePlatform.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminLivePlatformCWProxy get copyWith =>
      _$AdminLivePlatformCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLivePlatform _$AdminLivePlatformFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminLivePlatform', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['platform', 'users']);
      final val = AdminLivePlatform(
        platform: $checkedConvert('platform', (v) => v as String),
        users: $checkedConvert('users', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$AdminLivePlatformToJson(AdminLivePlatform instance) =>
    <String, dynamic>{'platform': instance.platform, 'users': instance.users};
