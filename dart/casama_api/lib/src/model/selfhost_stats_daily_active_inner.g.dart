// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfhost_stats_daily_active_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelfhostStatsDailyActiveInnerCWProxy {
  SelfhostStatsDailyActiveInner day(String day);

  SelfhostStatsDailyActiveInner count(int count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatsDailyActiveInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatsDailyActiveInner(...).copyWith(id: 12, name: "My name")
  /// ```
  SelfhostStatsDailyActiveInner call({String day, int count});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelfhostStatsDailyActiveInner.copyWith(...)` or call `instanceOfSelfhostStatsDailyActiveInner.copyWith.fieldName(value)` for a single field.
class _$SelfhostStatsDailyActiveInnerCWProxyImpl
    implements _$SelfhostStatsDailyActiveInnerCWProxy {
  const _$SelfhostStatsDailyActiveInnerCWProxyImpl(this._value);

  final SelfhostStatsDailyActiveInner _value;

  @override
  SelfhostStatsDailyActiveInner day(String day) => call(day: day);

  @override
  SelfhostStatsDailyActiveInner count(int count) => call(count: count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatsDailyActiveInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatsDailyActiveInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SelfhostStatsDailyActiveInner call({
    Object? day = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return SelfhostStatsDailyActiveInner(
      day: day == const $CopyWithPlaceholder() || day == null
          ? _value.day
          // ignore: cast_nullable_to_non_nullable
          : day as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
    );
  }
}

extension $SelfhostStatsDailyActiveInnerCopyWith
    on SelfhostStatsDailyActiveInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelfhostStatsDailyActiveInner.copyWith(...)` or `instanceOfSelfhostStatsDailyActiveInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelfhostStatsDailyActiveInnerCWProxy get copyWith =>
      _$SelfhostStatsDailyActiveInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfhostStatsDailyActiveInner _$SelfhostStatsDailyActiveInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SelfhostStatsDailyActiveInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['day', 'count']);
  final val = SelfhostStatsDailyActiveInner(
    day: $checkedConvert('day', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$SelfhostStatsDailyActiveInnerToJson(
  SelfhostStatsDailyActiveInner instance,
) => <String, dynamic>{'day': instance.day, 'count': instance.count};
