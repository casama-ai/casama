// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_costs_series_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminCostsSeriesInnerCWProxy {
  AdminCostsSeriesInner id(String id);

  AdminCostsSeriesInner label(String label);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostsSeriesInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostsSeriesInner(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminCostsSeriesInner call({String id, String label});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminCostsSeriesInner.copyWith(...)` or call `instanceOfAdminCostsSeriesInner.copyWith.fieldName(value)` for a single field.
class _$AdminCostsSeriesInnerCWProxyImpl
    implements _$AdminCostsSeriesInnerCWProxy {
  const _$AdminCostsSeriesInnerCWProxyImpl(this._value);

  final AdminCostsSeriesInner _value;

  @override
  AdminCostsSeriesInner id(String id) => call(id: id);

  @override
  AdminCostsSeriesInner label(String label) => call(label: label);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostsSeriesInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostsSeriesInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminCostsSeriesInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AdminCostsSeriesInner(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      label: label == const $CopyWithPlaceholder() || label == null
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
    );
  }
}

extension $AdminCostsSeriesInnerCopyWith on AdminCostsSeriesInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminCostsSeriesInner.copyWith(...)` or `instanceOfAdminCostsSeriesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminCostsSeriesInnerCWProxy get copyWith =>
      _$AdminCostsSeriesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCostsSeriesInner _$AdminCostsSeriesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminCostsSeriesInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'label']);
  final val = AdminCostsSeriesInner(
    id: $checkedConvert('id', (v) => v as String),
    label: $checkedConvert('label', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$AdminCostsSeriesInnerToJson(
  AdminCostsSeriesInner instance,
) => <String, dynamic>{'id': instance.id, 'label': instance.label};
