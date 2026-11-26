// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveProgressCWProxy {
  MoveProgress moveId(String moveId);

  MoveProgress role(MoveProgressRoleEnum role);

  MoveProgress state(MoveState state);

  MoveProgress step(String? step);

  MoveProgress orgId(String? orgId);

  MoveProgress remoteUrl(String? remoteUrl);

  MoveProgress bringKeys(bool bringKeys);

  MoveProgress counts(Map<String, Object?> counts);

  MoveProgress progress(MoveProgressProgress progress);

  MoveProgress parts(List<int>? parts);

  MoveProgress report(Map<String, Object?> report);

  MoveProgress error(MoveError? error);

  MoveProgress movedTo(MovedTo? movedTo);

  MoveProgress createdAt(DateTime createdAt);

  MoveProgress updatedAt(DateTime updatedAt);

  MoveProgress finishedAt(DateTime? finishedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveProgress call({
    String moveId,
    MoveProgressRoleEnum role,
    MoveState state,
    String? step,
    String? orgId,
    String? remoteUrl,
    bool bringKeys,
    Map<String, Object?> counts,
    MoveProgressProgress progress,
    List<int>? parts,
    Map<String, Object?> report,
    MoveError? error,
    MovedTo? movedTo,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? finishedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveProgress.copyWith(...)` or call `instanceOfMoveProgress.copyWith.fieldName(value)` for a single field.
class _$MoveProgressCWProxyImpl implements _$MoveProgressCWProxy {
  const _$MoveProgressCWProxyImpl(this._value);

  final MoveProgress _value;

  @override
  MoveProgress moveId(String moveId) => call(moveId: moveId);

  @override
  MoveProgress role(MoveProgressRoleEnum role) => call(role: role);

  @override
  MoveProgress state(MoveState state) => call(state: state);

  @override
  MoveProgress step(String? step) => call(step: step);

  @override
  MoveProgress orgId(String? orgId) => call(orgId: orgId);

  @override
  MoveProgress remoteUrl(String? remoteUrl) => call(remoteUrl: remoteUrl);

  @override
  MoveProgress bringKeys(bool bringKeys) => call(bringKeys: bringKeys);

  @override
  MoveProgress counts(Map<String, Object?> counts) => call(counts: counts);

  @override
  MoveProgress progress(MoveProgressProgress progress) =>
      call(progress: progress);

  @override
  MoveProgress parts(List<int>? parts) => call(parts: parts);

  @override
  MoveProgress report(Map<String, Object?> report) => call(report: report);

  @override
  MoveProgress error(MoveError? error) => call(error: error);

  @override
  MoveProgress movedTo(MovedTo? movedTo) => call(movedTo: movedTo);

  @override
  MoveProgress createdAt(DateTime createdAt) => call(createdAt: createdAt);

  @override
  MoveProgress updatedAt(DateTime updatedAt) => call(updatedAt: updatedAt);

  @override
  MoveProgress finishedAt(DateTime? finishedAt) => call(finishedAt: finishedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveProgress(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveProgress(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveProgress call({
    Object? moveId = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? step = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? remoteUrl = const $CopyWithPlaceholder(),
    Object? bringKeys = const $CopyWithPlaceholder(),
    Object? counts = const $CopyWithPlaceholder(),
    Object? progress = const $CopyWithPlaceholder(),
    Object? parts = const $CopyWithPlaceholder(),
    Object? report = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? movedTo = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? finishedAt = const $CopyWithPlaceholder(),
  }) {
    return MoveProgress(
      moveId: moveId == const $CopyWithPlaceholder() || moveId == null
          ? _value.moveId
          // ignore: cast_nullable_to_non_nullable
          : moveId as String,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as MoveProgressRoleEnum,
      state: state == const $CopyWithPlaceholder() || state == null
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as MoveState,
      step: step == const $CopyWithPlaceholder()
          ? _value.step
          // ignore: cast_nullable_to_non_nullable
          : step as String?,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String?,
      remoteUrl: remoteUrl == const $CopyWithPlaceholder()
          ? _value.remoteUrl
          // ignore: cast_nullable_to_non_nullable
          : remoteUrl as String?,
      bringKeys: bringKeys == const $CopyWithPlaceholder() || bringKeys == null
          ? _value.bringKeys
          // ignore: cast_nullable_to_non_nullable
          : bringKeys as bool,
      counts: counts == const $CopyWithPlaceholder() || counts == null
          ? _value.counts
          // ignore: cast_nullable_to_non_nullable
          : counts as Map<String, Object?>,
      progress: progress == const $CopyWithPlaceholder() || progress == null
          ? _value.progress
          // ignore: cast_nullable_to_non_nullable
          : progress as MoveProgressProgress,
      parts: parts == const $CopyWithPlaceholder()
          ? _value.parts
          // ignore: cast_nullable_to_non_nullable
          : parts as List<int>?,
      report: report == const $CopyWithPlaceholder() || report == null
          ? _value.report
          // ignore: cast_nullable_to_non_nullable
          : report as Map<String, Object?>,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as MoveError?,
      movedTo: movedTo == const $CopyWithPlaceholder()
          ? _value.movedTo
          // ignore: cast_nullable_to_non_nullable
          : movedTo as MovedTo?,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      finishedAt: finishedAt == const $CopyWithPlaceholder()
          ? _value.finishedAt
          // ignore: cast_nullable_to_non_nullable
          : finishedAt as DateTime?,
    );
  }
}

extension $MoveProgressCopyWith on MoveProgress {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveProgress.copyWith(...)` or `instanceOfMoveProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveProgressCWProxy get copyWith => _$MoveProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveProgress _$MoveProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MoveProgress',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'move_id',
            'role',
            'state',
            'step',
            'org_id',
            'remote_url',
            'bring_keys',
            'counts',
            'progress',
            'report',
            'error',
            'created_at',
            'updated_at',
            'finished_at',
          ],
        );
        final val = MoveProgress(
          moveId: $checkedConvert('move_id', (v) => v as String),
          role: $checkedConvert(
            'role',
            (v) => $enumDecode(_$MoveProgressRoleEnumEnumMap, v),
          ),
          state: $checkedConvert(
            'state',
            (v) => $enumDecode(_$MoveStateEnumMap, v),
          ),
          step: $checkedConvert('step', (v) => v as String?),
          orgId: $checkedConvert('org_id', (v) => v as String?),
          remoteUrl: $checkedConvert('remote_url', (v) => v as String?),
          bringKeys: $checkedConvert('bring_keys', (v) => v as bool),
          counts: $checkedConvert('counts', (v) => v as Map<String, dynamic>),
          progress: $checkedConvert(
            'progress',
            (v) => MoveProgressProgress.fromJson(v as Map<String, dynamic>),
          ),
          parts: $checkedConvert(
            'parts',
            (v) =>
                (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
          ),
          report: $checkedConvert('report', (v) => v as Map<String, dynamic>),
          error: $checkedConvert(
            'error',
            (v) => v == null
                ? null
                : MoveError.fromJson(v as Map<String, dynamic>),
          ),
          movedTo: $checkedConvert(
            'moved_to',
            (v) =>
                v == null ? null : MovedTo.fromJson(v as Map<String, dynamic>),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
          finishedAt: $checkedConvert(
            'finished_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'moveId': 'move_id',
        'orgId': 'org_id',
        'remoteUrl': 'remote_url',
        'bringKeys': 'bring_keys',
        'movedTo': 'moved_to',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'finishedAt': 'finished_at',
      },
    );

Map<String, dynamic> _$MoveProgressToJson(MoveProgress instance) =>
    <String, dynamic>{
      'move_id': instance.moveId,
      'role': _$MoveProgressRoleEnumEnumMap[instance.role]!,
      'state': _$MoveStateEnumMap[instance.state]!,
      'step': instance.step,
      'org_id': instance.orgId,
      'remote_url': instance.remoteUrl,
      'bring_keys': instance.bringKeys,
      'counts': instance.counts,
      'progress': instance.progress.toJson(),
      'parts': ?instance.parts,
      'report': instance.report,
      'error': instance.error?.toJson(),
      'moved_to': ?instance.movedTo?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'finished_at': instance.finishedAt?.toIso8601String(),
    };

const _$MoveProgressRoleEnumEnumMap = {
  MoveProgressRoleEnum.source_: 'source',
  MoveProgressRoleEnum.target: 'target',
};

const _$MoveStateEnumMap = {
  MoveState.created: 'created',
  MoveState.copying: 'copying',
  MoveState.pausing: 'pausing',
  MoveState.finishing: 'finishing',
  MoveState.importing: 'importing',
  MoveState.done: 'done',
  MoveState.failed: 'failed',
  MoveState.cancelled: 'cancelled',
};
