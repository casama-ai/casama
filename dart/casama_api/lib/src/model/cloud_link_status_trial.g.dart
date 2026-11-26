// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status_trial.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusTrialCWProxy {
  CloudLinkStatusTrial remainingUsd(num remainingUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusTrial(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusTrial(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatusTrial call({num remainingUsd});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatusTrial.copyWith(...)` or call `instanceOfCloudLinkStatusTrial.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusTrialCWProxyImpl
    implements _$CloudLinkStatusTrialCWProxy {
  const _$CloudLinkStatusTrialCWProxyImpl(this._value);

  final CloudLinkStatusTrial _value;

  @override
  CloudLinkStatusTrial remainingUsd(num remainingUsd) =>
      call(remainingUsd: remainingUsd);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusTrial(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusTrial(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatusTrial call({
    Object? remainingUsd = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatusTrial(
      remainingUsd:
          remainingUsd == const $CopyWithPlaceholder() || remainingUsd == null
          ? _value.remainingUsd
          // ignore: cast_nullable_to_non_nullable
          : remainingUsd as num,
    );
  }
}

extension $CloudLinkStatusTrialCopyWith on CloudLinkStatusTrial {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatusTrial.copyWith(...)` or `instanceOfCloudLinkStatusTrial.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusTrialCWProxy get copyWith =>
      _$CloudLinkStatusTrialCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatusTrial _$CloudLinkStatusTrialFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudLinkStatusTrial', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['remaining_usd']);
  final val = CloudLinkStatusTrial(
    remainingUsd: $checkedConvert('remaining_usd', (v) => v as num),
  );
  return val;
}, fieldKeyMap: const {'remainingUsd': 'remaining_usd'});

Map<String, dynamic> _$CloudLinkStatusTrialToJson(
  CloudLinkStatusTrial instance,
) => <String, dynamic>{'remaining_usd': instance.remainingUsd};
