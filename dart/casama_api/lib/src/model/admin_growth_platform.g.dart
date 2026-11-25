// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_platform.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthPlatformCWProxy {
  AdminGrowthPlatform platform(String platform);

  AdminGrowthPlatform signups(int signups);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthPlatform(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthPlatform(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthPlatform call({String platform, int signups});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthPlatform.copyWith(...)` or call `instanceOfAdminGrowthPlatform.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthPlatformCWProxyImpl implements _$AdminGrowthPlatformCWProxy {
  const _$AdminGrowthPlatformCWProxyImpl(this._value);

  final AdminGrowthPlatform _value;

  @override
  AdminGrowthPlatform platform(String platform) => call(platform: platform);

  @override
  AdminGrowthPlatform signups(int signups) => call(signups: signups);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthPlatform(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthPlatform(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthPlatform call({
    Object? platform = const $CopyWithPlaceholder(),
    Object? signups = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthPlatform(
      platform: platform == const $CopyWithPlaceholder() || platform == null
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String,
      signups: signups == const $CopyWithPlaceholder() || signups == null
          ? _value.signups
          // ignore: cast_nullable_to_non_nullable
          : signups as int,
    );
  }
}

extension $AdminGrowthPlatformCopyWith on AdminGrowthPlatform {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthPlatform.copyWith(...)` or `instanceOfAdminGrowthPlatform.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthPlatformCWProxy get copyWith =>
      _$AdminGrowthPlatformCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthPlatform _$AdminGrowthPlatformFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminGrowthPlatform', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['platform', 'signups']);
      final val = AdminGrowthPlatform(
        platform: $checkedConvert('platform', (v) => v as String),
        signups: $checkedConvert('signups', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$AdminGrowthPlatformToJson(
  AdminGrowthPlatform instance,
) => <String, dynamic>{
  'platform': instance.platform,
  'signups': instance.signups,
};
