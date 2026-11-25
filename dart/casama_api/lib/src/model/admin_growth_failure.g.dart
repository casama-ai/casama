// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_failure.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthFailureCWProxy {
  AdminGrowthFailure code(String code);

  AdminGrowthFailure runs(int runs);

  AdminGrowthFailure message(String? message);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthFailure(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthFailure(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthFailure call({String code, int runs, String? message});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthFailure.copyWith(...)` or call `instanceOfAdminGrowthFailure.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthFailureCWProxyImpl implements _$AdminGrowthFailureCWProxy {
  const _$AdminGrowthFailureCWProxyImpl(this._value);

  final AdminGrowthFailure _value;

  @override
  AdminGrowthFailure code(String code) => call(code: code);

  @override
  AdminGrowthFailure runs(int runs) => call(runs: runs);

  @override
  AdminGrowthFailure message(String? message) => call(message: message);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthFailure(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthFailure(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthFailure call({
    Object? code = const $CopyWithPlaceholder(),
    Object? runs = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthFailure(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      runs: runs == const $CopyWithPlaceholder() || runs == null
          ? _value.runs
          // ignore: cast_nullable_to_non_nullable
          : runs as int,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $AdminGrowthFailureCopyWith on AdminGrowthFailure {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthFailure.copyWith(...)` or `instanceOfAdminGrowthFailure.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthFailureCWProxy get copyWith =>
      _$AdminGrowthFailureCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthFailure _$AdminGrowthFailureFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminGrowthFailure', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'runs', 'message']);
      final val = AdminGrowthFailure(
        code: $checkedConvert('code', (v) => v as String),
        runs: $checkedConvert('runs', (v) => (v as num).toInt()),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AdminGrowthFailureToJson(AdminGrowthFailure instance) =>
    <String, dynamic>{
      'code': instance.code,
      'runs': instance.runs,
      'message': instance.message,
    };
