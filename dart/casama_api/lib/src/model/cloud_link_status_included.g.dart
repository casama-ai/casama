// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status_included.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusIncludedCWProxy {
  CloudLinkStatusIncluded usedUsd(num usedUsd);

  CloudLinkStatusIncluded limitUsd(num limitUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusIncluded(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusIncluded(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatusIncluded call({num usedUsd, num limitUsd});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatusIncluded.copyWith(...)` or call `instanceOfCloudLinkStatusIncluded.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusIncludedCWProxyImpl
    implements _$CloudLinkStatusIncludedCWProxy {
  const _$CloudLinkStatusIncludedCWProxyImpl(this._value);

  final CloudLinkStatusIncluded _value;

  @override
  CloudLinkStatusIncluded usedUsd(num usedUsd) => call(usedUsd: usedUsd);

  @override
  CloudLinkStatusIncluded limitUsd(num limitUsd) => call(limitUsd: limitUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusIncluded(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusIncluded(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatusIncluded call({
    Object? usedUsd = const $CopyWithPlaceholder(),
    Object? limitUsd = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatusIncluded(
      usedUsd: usedUsd == const $CopyWithPlaceholder() || usedUsd == null
          ? _value.usedUsd
          // ignore: cast_nullable_to_non_nullable
          : usedUsd as num,
      limitUsd: limitUsd == const $CopyWithPlaceholder() || limitUsd == null
          ? _value.limitUsd
          // ignore: cast_nullable_to_non_nullable
          : limitUsd as num,
    );
  }
}

extension $CloudLinkStatusIncludedCopyWith on CloudLinkStatusIncluded {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatusIncluded.copyWith(...)` or `instanceOfCloudLinkStatusIncluded.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusIncludedCWProxy get copyWith =>
      _$CloudLinkStatusIncludedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatusIncluded _$CloudLinkStatusIncludedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudLinkStatusIncluded', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['used_usd', 'limit_usd']);
  final val = CloudLinkStatusIncluded(
    usedUsd: $checkedConvert('used_usd', (v) => v as num),
    limitUsd: $checkedConvert('limit_usd', (v) => v as num),
  );
  return val;
}, fieldKeyMap: const {'usedUsd': 'used_usd', 'limitUsd': 'limit_usd'});

Map<String, dynamic> _$CloudLinkStatusIncludedToJson(
  CloudLinkStatusIncluded instance,
) => <String, dynamic>{
  'used_usd': instance.usedUsd,
  'limit_usd': instance.limitUsd,
};
