// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inactivity_report.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InactivityReportCWProxy {
  InactivityReport ranAt(DateTime ranAt);

  InactivityReport modes(AdminInactivityEffective modes);

  InactivityReport resting(int resting);

  InactivityReport filesWarned(int filesWarned);

  InactivityReport filesRemoved(int filesRemoved);

  InactivityReport filesBytes(num filesBytes);

  InactivityReport removalWarned(int removalWarned);

  InactivityReport removalsScheduled(int removalsScheduled);

  InactivityReport unconfirmed(int unconfirmed);

  InactivityReport restingNow(int restingNow);

  InactivityReport removalsPending(int removalsPending);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InactivityReport(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InactivityReport(...).copyWith(id: 12, name: "My name")
  /// ```
  InactivityReport call({
    DateTime ranAt,
    AdminInactivityEffective modes,
    int resting,
    int filesWarned,
    int filesRemoved,
    num filesBytes,
    int removalWarned,
    int removalsScheduled,
    int unconfirmed,
    int restingNow,
    int removalsPending,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInactivityReport.copyWith(...)` or call `instanceOfInactivityReport.copyWith.fieldName(value)` for a single field.
class _$InactivityReportCWProxyImpl implements _$InactivityReportCWProxy {
  const _$InactivityReportCWProxyImpl(this._value);

  final InactivityReport _value;

  @override
  InactivityReport ranAt(DateTime ranAt) => call(ranAt: ranAt);

  @override
  InactivityReport modes(AdminInactivityEffective modes) => call(modes: modes);

  @override
  InactivityReport resting(int resting) => call(resting: resting);

  @override
  InactivityReport filesWarned(int filesWarned) =>
      call(filesWarned: filesWarned);

  @override
  InactivityReport filesRemoved(int filesRemoved) =>
      call(filesRemoved: filesRemoved);

  @override
  InactivityReport filesBytes(num filesBytes) => call(filesBytes: filesBytes);

  @override
  InactivityReport removalWarned(int removalWarned) =>
      call(removalWarned: removalWarned);

  @override
  InactivityReport removalsScheduled(int removalsScheduled) =>
      call(removalsScheduled: removalsScheduled);

  @override
  InactivityReport unconfirmed(int unconfirmed) =>
      call(unconfirmed: unconfirmed);

  @override
  InactivityReport restingNow(int restingNow) => call(restingNow: restingNow);

  @override
  InactivityReport removalsPending(int removalsPending) =>
      call(removalsPending: removalsPending);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InactivityReport(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InactivityReport(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InactivityReport call({
    Object? ranAt = const $CopyWithPlaceholder(),
    Object? modes = const $CopyWithPlaceholder(),
    Object? resting = const $CopyWithPlaceholder(),
    Object? filesWarned = const $CopyWithPlaceholder(),
    Object? filesRemoved = const $CopyWithPlaceholder(),
    Object? filesBytes = const $CopyWithPlaceholder(),
    Object? removalWarned = const $CopyWithPlaceholder(),
    Object? removalsScheduled = const $CopyWithPlaceholder(),
    Object? unconfirmed = const $CopyWithPlaceholder(),
    Object? restingNow = const $CopyWithPlaceholder(),
    Object? removalsPending = const $CopyWithPlaceholder(),
  }) {
    return InactivityReport(
      ranAt: ranAt == const $CopyWithPlaceholder() || ranAt == null
          ? _value.ranAt
          // ignore: cast_nullable_to_non_nullable
          : ranAt as DateTime,
      modes: modes == const $CopyWithPlaceholder() || modes == null
          ? _value.modes
          // ignore: cast_nullable_to_non_nullable
          : modes as AdminInactivityEffective,
      resting: resting == const $CopyWithPlaceholder() || resting == null
          ? _value.resting
          // ignore: cast_nullable_to_non_nullable
          : resting as int,
      filesWarned:
          filesWarned == const $CopyWithPlaceholder() || filesWarned == null
          ? _value.filesWarned
          // ignore: cast_nullable_to_non_nullable
          : filesWarned as int,
      filesRemoved:
          filesRemoved == const $CopyWithPlaceholder() || filesRemoved == null
          ? _value.filesRemoved
          // ignore: cast_nullable_to_non_nullable
          : filesRemoved as int,
      filesBytes:
          filesBytes == const $CopyWithPlaceholder() || filesBytes == null
          ? _value.filesBytes
          // ignore: cast_nullable_to_non_nullable
          : filesBytes as num,
      removalWarned:
          removalWarned == const $CopyWithPlaceholder() || removalWarned == null
          ? _value.removalWarned
          // ignore: cast_nullable_to_non_nullable
          : removalWarned as int,
      removalsScheduled:
          removalsScheduled == const $CopyWithPlaceholder() ||
              removalsScheduled == null
          ? _value.removalsScheduled
          // ignore: cast_nullable_to_non_nullable
          : removalsScheduled as int,
      unconfirmed:
          unconfirmed == const $CopyWithPlaceholder() || unconfirmed == null
          ? _value.unconfirmed
          // ignore: cast_nullable_to_non_nullable
          : unconfirmed as int,
      restingNow:
          restingNow == const $CopyWithPlaceholder() || restingNow == null
          ? _value.restingNow
          // ignore: cast_nullable_to_non_nullable
          : restingNow as int,
      removalsPending:
          removalsPending == const $CopyWithPlaceholder() ||
              removalsPending == null
          ? _value.removalsPending
          // ignore: cast_nullable_to_non_nullable
          : removalsPending as int,
    );
  }
}

extension $InactivityReportCopyWith on InactivityReport {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInactivityReport.copyWith(...)` or `instanceOfInactivityReport.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InactivityReportCWProxy get copyWith => _$InactivityReportCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InactivityReport _$InactivityReportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'InactivityReport',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'ran_at',
        'modes',
        'resting',
        'files_warned',
        'files_removed',
        'files_bytes',
        'removal_warned',
        'removals_scheduled',
        'unconfirmed',
        'resting_now',
        'removals_pending',
      ],
    );
    final val = InactivityReport(
      ranAt: $checkedConvert('ran_at', (v) => DateTime.parse(v as String)),
      modes: $checkedConvert(
        'modes',
        (v) => AdminInactivityEffective.fromJson(v as Map<String, dynamic>),
      ),
      resting: $checkedConvert('resting', (v) => (v as num).toInt()),
      filesWarned: $checkedConvert('files_warned', (v) => (v as num).toInt()),
      filesRemoved: $checkedConvert('files_removed', (v) => (v as num).toInt()),
      filesBytes: $checkedConvert('files_bytes', (v) => v as num),
      removalWarned: $checkedConvert(
        'removal_warned',
        (v) => (v as num).toInt(),
      ),
      removalsScheduled: $checkedConvert(
        'removals_scheduled',
        (v) => (v as num).toInt(),
      ),
      unconfirmed: $checkedConvert('unconfirmed', (v) => (v as num).toInt()),
      restingNow: $checkedConvert('resting_now', (v) => (v as num).toInt()),
      removalsPending: $checkedConvert(
        'removals_pending',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ranAt': 'ran_at',
    'filesWarned': 'files_warned',
    'filesRemoved': 'files_removed',
    'filesBytes': 'files_bytes',
    'removalWarned': 'removal_warned',
    'removalsScheduled': 'removals_scheduled',
    'restingNow': 'resting_now',
    'removalsPending': 'removals_pending',
  },
);

Map<String, dynamic> _$InactivityReportToJson(InactivityReport instance) =>
    <String, dynamic>{
      'ran_at': instance.ranAt.toIso8601String(),
      'modes': instance.modes.toJson(),
      'resting': instance.resting,
      'files_warned': instance.filesWarned,
      'files_removed': instance.filesRemoved,
      'files_bytes': instance.filesBytes,
      'removal_warned': instance.removalWarned,
      'removals_scheduled': instance.removalsScheduled,
      'unconfirmed': instance.unconfirmed,
      'resting_now': instance.restingNow,
      'removals_pending': instance.removalsPending,
    };
