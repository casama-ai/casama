// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capacity_alarm.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CapacityAlarmCWProxy {
  CapacityAlarm level(int level);

  CapacityAlarm startedAt(String? startedAt);

  CapacityAlarm levelSince(String? levelSince);

  CapacityAlarm lastPushAt(String? lastPushAt);

  CapacityAlarm snoozedUntil(String? snoozedUntil);

  CapacityAlarm endedAt(String? endedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CapacityAlarm(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CapacityAlarm(...).copyWith(id: 12, name: "My name")
  /// ```
  CapacityAlarm call({
    int level,
    String? startedAt,
    String? levelSince,
    String? lastPushAt,
    String? snoozedUntil,
    String? endedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCapacityAlarm.copyWith(...)` or call `instanceOfCapacityAlarm.copyWith.fieldName(value)` for a single field.
class _$CapacityAlarmCWProxyImpl implements _$CapacityAlarmCWProxy {
  const _$CapacityAlarmCWProxyImpl(this._value);

  final CapacityAlarm _value;

  @override
  CapacityAlarm level(int level) => call(level: level);

  @override
  CapacityAlarm startedAt(String? startedAt) => call(startedAt: startedAt);

  @override
  CapacityAlarm levelSince(String? levelSince) => call(levelSince: levelSince);

  @override
  CapacityAlarm lastPushAt(String? lastPushAt) => call(lastPushAt: lastPushAt);

  @override
  CapacityAlarm snoozedUntil(String? snoozedUntil) =>
      call(snoozedUntil: snoozedUntil);

  @override
  CapacityAlarm endedAt(String? endedAt) => call(endedAt: endedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CapacityAlarm(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CapacityAlarm(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CapacityAlarm call({
    Object? level = const $CopyWithPlaceholder(),
    Object? startedAt = const $CopyWithPlaceholder(),
    Object? levelSince = const $CopyWithPlaceholder(),
    Object? lastPushAt = const $CopyWithPlaceholder(),
    Object? snoozedUntil = const $CopyWithPlaceholder(),
    Object? endedAt = const $CopyWithPlaceholder(),
  }) {
    return CapacityAlarm(
      level: level == const $CopyWithPlaceholder() || level == null
          ? _value.level
          // ignore: cast_nullable_to_non_nullable
          : level as int,
      startedAt: startedAt == const $CopyWithPlaceholder()
          ? _value.startedAt
          // ignore: cast_nullable_to_non_nullable
          : startedAt as String?,
      levelSince: levelSince == const $CopyWithPlaceholder()
          ? _value.levelSince
          // ignore: cast_nullable_to_non_nullable
          : levelSince as String?,
      lastPushAt: lastPushAt == const $CopyWithPlaceholder()
          ? _value.lastPushAt
          // ignore: cast_nullable_to_non_nullable
          : lastPushAt as String?,
      snoozedUntil: snoozedUntil == const $CopyWithPlaceholder()
          ? _value.snoozedUntil
          // ignore: cast_nullable_to_non_nullable
          : snoozedUntil as String?,
      endedAt: endedAt == const $CopyWithPlaceholder()
          ? _value.endedAt
          // ignore: cast_nullable_to_non_nullable
          : endedAt as String?,
    );
  }
}

extension $CapacityAlarmCopyWith on CapacityAlarm {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCapacityAlarm.copyWith(...)` or `instanceOfCapacityAlarm.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CapacityAlarmCWProxy get copyWith => _$CapacityAlarmCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CapacityAlarm _$CapacityAlarmFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CapacityAlarm',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'level',
            'started_at',
            'level_since',
            'last_push_at',
            'snoozed_until',
            'ended_at',
          ],
        );
        final val = CapacityAlarm(
          level: $checkedConvert('level', (v) => (v as num).toInt()),
          startedAt: $checkedConvert('started_at', (v) => v as String?),
          levelSince: $checkedConvert('level_since', (v) => v as String?),
          lastPushAt: $checkedConvert('last_push_at', (v) => v as String?),
          snoozedUntil: $checkedConvert('snoozed_until', (v) => v as String?),
          endedAt: $checkedConvert('ended_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'startedAt': 'started_at',
        'levelSince': 'level_since',
        'lastPushAt': 'last_push_at',
        'snoozedUntil': 'snoozed_until',
        'endedAt': 'ended_at',
      },
    );

Map<String, dynamic> _$CapacityAlarmToJson(CapacityAlarm instance) =>
    <String, dynamic>{
      'level': instance.level,
      'started_at': instance.startedAt,
      'level_since': instance.levelSince,
      'last_push_at': instance.lastPushAt,
      'snoozed_until': instance.snoozedUntil,
      'ended_at': instance.endedAt,
    };
