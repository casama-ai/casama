// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_state_me.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsStateMeCWProxy {
  CloudModelsStateMe allowed(bool allowed);

  CloudModelsStateMe todayUsd(num todayUsd);

  CloudModelsStateMe limitUsd(num? limitUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStateMe(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStateMe(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsStateMe call({bool allowed, num todayUsd, num? limitUsd});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsStateMe.copyWith(...)` or call `instanceOfCloudModelsStateMe.copyWith.fieldName(value)` for a single field.
class _$CloudModelsStateMeCWProxyImpl implements _$CloudModelsStateMeCWProxy {
  const _$CloudModelsStateMeCWProxyImpl(this._value);

  final CloudModelsStateMe _value;

  @override
  CloudModelsStateMe allowed(bool allowed) => call(allowed: allowed);

  @override
  CloudModelsStateMe todayUsd(num todayUsd) => call(todayUsd: todayUsd);

  @override
  CloudModelsStateMe limitUsd(num? limitUsd) => call(limitUsd: limitUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStateMe(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStateMe(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsStateMe call({
    Object? allowed = const $CopyWithPlaceholder(),
    Object? todayUsd = const $CopyWithPlaceholder(),
    Object? limitUsd = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsStateMe(
      allowed: allowed == const $CopyWithPlaceholder() || allowed == null
          ? _value.allowed
          // ignore: cast_nullable_to_non_nullable
          : allowed as bool,
      todayUsd: todayUsd == const $CopyWithPlaceholder() || todayUsd == null
          ? _value.todayUsd
          // ignore: cast_nullable_to_non_nullable
          : todayUsd as num,
      limitUsd: limitUsd == const $CopyWithPlaceholder()
          ? _value.limitUsd
          // ignore: cast_nullable_to_non_nullable
          : limitUsd as num?,
    );
  }
}

extension $CloudModelsStateMeCopyWith on CloudModelsStateMe {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsStateMe.copyWith(...)` or `instanceOfCloudModelsStateMe.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsStateMeCWProxy get copyWith =>
      _$CloudModelsStateMeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsStateMe _$CloudModelsStateMeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudModelsStateMe', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['allowed', 'today_usd', 'limit_usd'],
      );
      final val = CloudModelsStateMe(
        allowed: $checkedConvert('allowed', (v) => v as bool),
        todayUsd: $checkedConvert('today_usd', (v) => v as num),
        limitUsd: $checkedConvert('limit_usd', (v) => v as num?),
      );
      return val;
    }, fieldKeyMap: const {'todayUsd': 'today_usd', 'limitUsd': 'limit_usd'});

Map<String, dynamic> _$CloudModelsStateMeToJson(CloudModelsStateMe instance) =>
    <String, dynamic>{
      'allowed': instance.allowed,
      'today_usd': instance.todayUsd,
      'limit_usd': instance.limitUsd,
    };
