// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status_today.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusTodayCWProxy {
  CloudLinkStatusToday spendUsd(num spendUsd);

  CloudLinkStatusToday capUsd(num? capUsd);

  CloudLinkStatusToday resetsAt(String? resetsAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusToday(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusToday(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatusToday call({num spendUsd, num? capUsd, String? resetsAt});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatusToday.copyWith(...)` or call `instanceOfCloudLinkStatusToday.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusTodayCWProxyImpl
    implements _$CloudLinkStatusTodayCWProxy {
  const _$CloudLinkStatusTodayCWProxyImpl(this._value);

  final CloudLinkStatusToday _value;

  @override
  CloudLinkStatusToday spendUsd(num spendUsd) => call(spendUsd: spendUsd);

  @override
  CloudLinkStatusToday capUsd(num? capUsd) => call(capUsd: capUsd);

  @override
  CloudLinkStatusToday resetsAt(String? resetsAt) => call(resetsAt: resetsAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusToday(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusToday(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatusToday call({
    Object? spendUsd = const $CopyWithPlaceholder(),
    Object? capUsd = const $CopyWithPlaceholder(),
    Object? resetsAt = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatusToday(
      spendUsd: spendUsd == const $CopyWithPlaceholder() || spendUsd == null
          ? _value.spendUsd
          // ignore: cast_nullable_to_non_nullable
          : spendUsd as num,
      capUsd: capUsd == const $CopyWithPlaceholder()
          ? _value.capUsd
          // ignore: cast_nullable_to_non_nullable
          : capUsd as num?,
      resetsAt: resetsAt == const $CopyWithPlaceholder()
          ? _value.resetsAt
          // ignore: cast_nullable_to_non_nullable
          : resetsAt as String?,
    );
  }
}

extension $CloudLinkStatusTodayCopyWith on CloudLinkStatusToday {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatusToday.copyWith(...)` or `instanceOfCloudLinkStatusToday.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusTodayCWProxy get copyWith =>
      _$CloudLinkStatusTodayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatusToday _$CloudLinkStatusTodayFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CloudLinkStatusToday',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['spend_usd', 'cap_usd', 'resets_at']);
    final val = CloudLinkStatusToday(
      spendUsd: $checkedConvert('spend_usd', (v) => v as num),
      capUsd: $checkedConvert('cap_usd', (v) => v as num?),
      resetsAt: $checkedConvert('resets_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'spendUsd': 'spend_usd',
    'capUsd': 'cap_usd',
    'resetsAt': 'resets_at',
  },
);

Map<String, dynamic> _$CloudLinkStatusTodayToJson(
  CloudLinkStatusToday instance,
) => <String, dynamic>{
  'spend_usd': instance.spendUsd,
  'cap_usd': instance.capUsd,
  'resets_at': instance.resetsAt,
};
