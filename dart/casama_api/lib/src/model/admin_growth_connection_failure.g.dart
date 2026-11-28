// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_connection_failure.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthConnectionFailureCWProxy {
  AdminGrowthConnectionFailure detail(String detail);

  AdminGrowthConnectionFailure count(int count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthConnectionFailure(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthConnectionFailure(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthConnectionFailure call({String detail, int count});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthConnectionFailure.copyWith(...)` or call `instanceOfAdminGrowthConnectionFailure.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthConnectionFailureCWProxyImpl
    implements _$AdminGrowthConnectionFailureCWProxy {
  const _$AdminGrowthConnectionFailureCWProxyImpl(this._value);

  final AdminGrowthConnectionFailure _value;

  @override
  AdminGrowthConnectionFailure detail(String detail) => call(detail: detail);

  @override
  AdminGrowthConnectionFailure count(int count) => call(count: count);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthConnectionFailure(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthConnectionFailure(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthConnectionFailure call({
    Object? detail = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthConnectionFailure(
      detail: detail == const $CopyWithPlaceholder() || detail == null
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
    );
  }
}

extension $AdminGrowthConnectionFailureCopyWith
    on AdminGrowthConnectionFailure {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthConnectionFailure.copyWith(...)` or `instanceOfAdminGrowthConnectionFailure.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthConnectionFailureCWProxy get copyWith =>
      _$AdminGrowthConnectionFailureCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthConnectionFailure _$AdminGrowthConnectionFailureFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminGrowthConnectionFailure', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['detail', 'count']);
  final val = AdminGrowthConnectionFailure(
    detail: $checkedConvert('detail', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$AdminGrowthConnectionFailureToJson(
  AdminGrowthConnectionFailure instance,
) => <String, dynamic>{'detail': instance.detail, 'count': instance.count};
