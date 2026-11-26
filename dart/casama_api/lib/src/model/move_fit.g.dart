// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_fit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveFitCWProxy {
  MoveFit fits(bool fits);

  MoveFit plan(MoveFitPlan? plan);

  MoveFit over(List<MoveOver> over);

  MoveFit needsPlan(MoveFitPlan? needsPlan);

  MoveFit accepts(List<int> accepts);

  MoveFit engineVersion(String engineVersion);

  MoveFit moveKey(String moveKey);

  MoveFit target(MoveFitTarget target);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFit(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFit(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveFit call({
    bool fits,
    MoveFitPlan? plan,
    List<MoveOver> over,
    MoveFitPlan? needsPlan,
    List<int> accepts,
    String engineVersion,
    String moveKey,
    MoveFitTarget target,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveFit.copyWith(...)` or call `instanceOfMoveFit.copyWith.fieldName(value)` for a single field.
class _$MoveFitCWProxyImpl implements _$MoveFitCWProxy {
  const _$MoveFitCWProxyImpl(this._value);

  final MoveFit _value;

  @override
  MoveFit fits(bool fits) => call(fits: fits);

  @override
  MoveFit plan(MoveFitPlan? plan) => call(plan: plan);

  @override
  MoveFit over(List<MoveOver> over) => call(over: over);

  @override
  MoveFit needsPlan(MoveFitPlan? needsPlan) => call(needsPlan: needsPlan);

  @override
  MoveFit accepts(List<int> accepts) => call(accepts: accepts);

  @override
  MoveFit engineVersion(String engineVersion) =>
      call(engineVersion: engineVersion);

  @override
  MoveFit moveKey(String moveKey) => call(moveKey: moveKey);

  @override
  MoveFit target(MoveFitTarget target) => call(target: target);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFit(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFit(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveFit call({
    Object? fits = const $CopyWithPlaceholder(),
    Object? plan = const $CopyWithPlaceholder(),
    Object? over = const $CopyWithPlaceholder(),
    Object? needsPlan = const $CopyWithPlaceholder(),
    Object? accepts = const $CopyWithPlaceholder(),
    Object? engineVersion = const $CopyWithPlaceholder(),
    Object? moveKey = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
  }) {
    return MoveFit(
      fits: fits == const $CopyWithPlaceholder() || fits == null
          ? _value.fits
          // ignore: cast_nullable_to_non_nullable
          : fits as bool,
      plan: plan == const $CopyWithPlaceholder()
          ? _value.plan
          // ignore: cast_nullable_to_non_nullable
          : plan as MoveFitPlan?,
      over: over == const $CopyWithPlaceholder() || over == null
          ? _value.over
          // ignore: cast_nullable_to_non_nullable
          : over as List<MoveOver>,
      needsPlan: needsPlan == const $CopyWithPlaceholder()
          ? _value.needsPlan
          // ignore: cast_nullable_to_non_nullable
          : needsPlan as MoveFitPlan?,
      accepts: accepts == const $CopyWithPlaceholder() || accepts == null
          ? _value.accepts
          // ignore: cast_nullable_to_non_nullable
          : accepts as List<int>,
      engineVersion:
          engineVersion == const $CopyWithPlaceholder() || engineVersion == null
          ? _value.engineVersion
          // ignore: cast_nullable_to_non_nullable
          : engineVersion as String,
      moveKey: moveKey == const $CopyWithPlaceholder() || moveKey == null
          ? _value.moveKey
          // ignore: cast_nullable_to_non_nullable
          : moveKey as String,
      target: target == const $CopyWithPlaceholder() || target == null
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as MoveFitTarget,
    );
  }
}

extension $MoveFitCopyWith on MoveFit {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveFit.copyWith(...)` or `instanceOfMoveFit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveFitCWProxy get copyWith => _$MoveFitCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFit _$MoveFitFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MoveFit',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'fits',
        'plan',
        'over',
        'needs_plan',
        'accepts',
        'engine_version',
        'move_key',
        'target',
      ],
    );
    final val = MoveFit(
      fits: $checkedConvert('fits', (v) => v as bool),
      plan: $checkedConvert(
        'plan',
        (v) =>
            v == null ? null : MoveFitPlan.fromJson(v as Map<String, dynamic>),
      ),
      over: $checkedConvert(
        'over',
        (v) => (v as List<dynamic>)
            .map((e) => MoveOver.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      needsPlan: $checkedConvert(
        'needs_plan',
        (v) =>
            v == null ? null : MoveFitPlan.fromJson(v as Map<String, dynamic>),
      ),
      accepts: $checkedConvert(
        'accepts',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      engineVersion: $checkedConvert('engine_version', (v) => v as String),
      moveKey: $checkedConvert('move_key', (v) => v as String),
      target: $checkedConvert(
        'target',
        (v) => MoveFitTarget.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'needsPlan': 'needs_plan',
    'engineVersion': 'engine_version',
    'moveKey': 'move_key',
  },
);

Map<String, dynamic> _$MoveFitToJson(MoveFit instance) => <String, dynamic>{
  'fits': instance.fits,
  'plan': instance.plan?.toJson(),
  'over': instance.over.map((e) => e.toJson()).toList(),
  'needs_plan': instance.needsPlan?.toJson(),
  'accepts': instance.accepts,
  'engine_version': instance.engineVersion,
  'move_key': instance.moveKey,
  'target': instance.target.toJson(),
};
