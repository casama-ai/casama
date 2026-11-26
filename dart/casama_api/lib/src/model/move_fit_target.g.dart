// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_fit_target.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveFitTargetCWProxy {
  MoveFitTarget orgId(String orgId);

  MoveFitTarget name(String name);

  MoveFitTarget empty(bool empty);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFitTarget(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFitTarget(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveFitTarget call({String orgId, String name, bool empty});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveFitTarget.copyWith(...)` or call `instanceOfMoveFitTarget.copyWith.fieldName(value)` for a single field.
class _$MoveFitTargetCWProxyImpl implements _$MoveFitTargetCWProxy {
  const _$MoveFitTargetCWProxyImpl(this._value);

  final MoveFitTarget _value;

  @override
  MoveFitTarget orgId(String orgId) => call(orgId: orgId);

  @override
  MoveFitTarget name(String name) => call(name: name);

  @override
  MoveFitTarget empty(bool empty) => call(empty: empty);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFitTarget(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFitTarget(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveFitTarget call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? empty = const $CopyWithPlaceholder(),
  }) {
    return MoveFitTarget(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      empty: empty == const $CopyWithPlaceholder() || empty == null
          ? _value.empty
          // ignore: cast_nullable_to_non_nullable
          : empty as bool,
    );
  }
}

extension $MoveFitTargetCopyWith on MoveFitTarget {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveFitTarget.copyWith(...)` or `instanceOfMoveFitTarget.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveFitTargetCWProxy get copyWith => _$MoveFitTargetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFitTarget _$MoveFitTargetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveFitTarget', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['org_id', 'name', 'empty']);
      final val = MoveFitTarget(
        orgId: $checkedConvert('org_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        empty: $checkedConvert('empty', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'orgId': 'org_id'});

Map<String, dynamic> _$MoveFitTargetToJson(MoveFitTarget instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'name': instance.name,
      'empty': instance.empty,
    };
