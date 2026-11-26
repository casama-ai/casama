// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_policy.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsPolicyCWProxy {
  CloudModelsPolicy allowed(Object? allowed);

  CloudModelsPolicy dailyUsdPerMember(num? dailyUsdPerMember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPolicy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPolicy(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsPolicy call({Object? allowed, num? dailyUsdPerMember});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsPolicy.copyWith(...)` or call `instanceOfCloudModelsPolicy.copyWith.fieldName(value)` for a single field.
class _$CloudModelsPolicyCWProxyImpl implements _$CloudModelsPolicyCWProxy {
  const _$CloudModelsPolicyCWProxyImpl(this._value);

  final CloudModelsPolicy _value;

  @override
  CloudModelsPolicy allowed(Object? allowed) => call(allowed: allowed);

  @override
  CloudModelsPolicy dailyUsdPerMember(num? dailyUsdPerMember) =>
      call(dailyUsdPerMember: dailyUsdPerMember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPolicy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPolicy(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsPolicy call({
    Object? allowed = const $CopyWithPlaceholder(),
    Object? dailyUsdPerMember = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsPolicy(
      allowed: allowed == const $CopyWithPlaceholder()
          ? _value.allowed
          // ignore: cast_nullable_to_non_nullable
          : allowed as Object?,
      dailyUsdPerMember: dailyUsdPerMember == const $CopyWithPlaceholder()
          ? _value.dailyUsdPerMember
          // ignore: cast_nullable_to_non_nullable
          : dailyUsdPerMember as num?,
    );
  }
}

extension $CloudModelsPolicyCopyWith on CloudModelsPolicy {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsPolicy.copyWith(...)` or `instanceOfCloudModelsPolicy.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsPolicyCWProxy get copyWith =>
      _$CloudModelsPolicyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsPolicy _$CloudModelsPolicyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudModelsPolicy', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['allowed', 'daily_usd_per_member']);
      final val = CloudModelsPolicy(
        allowed: $checkedConvert('allowed', (v) => v),
        dailyUsdPerMember: $checkedConvert(
          'daily_usd_per_member',
          (v) => v as num?,
        ),
      );
      return val;
    }, fieldKeyMap: const {'dailyUsdPerMember': 'daily_usd_per_member'});

Map<String, dynamic> _$CloudModelsPolicyToJson(CloudModelsPolicy instance) =>
    <String, dynamic>{
      'allowed': instance.allowed,
      'daily_usd_per_member': instance.dailyUsdPerMember,
    };
