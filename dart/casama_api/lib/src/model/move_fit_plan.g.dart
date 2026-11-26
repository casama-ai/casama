// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_fit_plan.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveFitPlanCWProxy {
  MoveFitPlan code(String code);

  MoveFitPlan name(String name);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFitPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFitPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveFitPlan call({String code, String name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveFitPlan.copyWith(...)` or call `instanceOfMoveFitPlan.copyWith.fieldName(value)` for a single field.
class _$MoveFitPlanCWProxyImpl implements _$MoveFitPlanCWProxy {
  const _$MoveFitPlanCWProxyImpl(this._value);

  final MoveFitPlan _value;

  @override
  MoveFitPlan code(String code) => call(code: code);

  @override
  MoveFitPlan name(String name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFitPlan(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFitPlan(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveFitPlan call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return MoveFitPlan(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $MoveFitPlanCopyWith on MoveFitPlan {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveFitPlan.copyWith(...)` or `instanceOfMoveFitPlan.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveFitPlanCWProxy get copyWith => _$MoveFitPlanCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFitPlan _$MoveFitPlanFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveFitPlan', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'name']);
      final val = MoveFitPlan(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MoveFitPlanToJson(MoveFitPlan instance) =>
    <String, dynamic>{'code': instance.code, 'name': instance.name};
