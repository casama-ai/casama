// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_inactivity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminInactivityCWProxy {
  AdminInactivity settings(InactivitySettings settings);

  AdminInactivity effective(AdminInactivityEffective effective);

  AdminInactivity report(InactivityReport? report);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminInactivity(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminInactivity(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminInactivity call({
    InactivitySettings settings,
    AdminInactivityEffective effective,
    InactivityReport? report,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminInactivity.copyWith(...)` or call `instanceOfAdminInactivity.copyWith.fieldName(value)` for a single field.
class _$AdminInactivityCWProxyImpl implements _$AdminInactivityCWProxy {
  const _$AdminInactivityCWProxyImpl(this._value);

  final AdminInactivity _value;

  @override
  AdminInactivity settings(InactivitySettings settings) =>
      call(settings: settings);

  @override
  AdminInactivity effective(AdminInactivityEffective effective) =>
      call(effective: effective);

  @override
  AdminInactivity report(InactivityReport? report) => call(report: report);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminInactivity(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminInactivity(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminInactivity call({
    Object? settings = const $CopyWithPlaceholder(),
    Object? effective = const $CopyWithPlaceholder(),
    Object? report = const $CopyWithPlaceholder(),
  }) {
    return AdminInactivity(
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as InactivitySettings,
      effective: effective == const $CopyWithPlaceholder() || effective == null
          ? _value.effective
          // ignore: cast_nullable_to_non_nullable
          : effective as AdminInactivityEffective,
      report: report == const $CopyWithPlaceholder()
          ? _value.report
          // ignore: cast_nullable_to_non_nullable
          : report as InactivityReport?,
    );
  }
}

extension $AdminInactivityCopyWith on AdminInactivity {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminInactivity.copyWith(...)` or `instanceOfAdminInactivity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminInactivityCWProxy get copyWith => _$AdminInactivityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminInactivity _$AdminInactivityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminInactivity', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['settings', 'effective', 'report']);
      final val = AdminInactivity(
        settings: $checkedConvert(
          'settings',
          (v) => InactivitySettings.fromJson(v as Map<String, dynamic>),
        ),
        effective: $checkedConvert(
          'effective',
          (v) => AdminInactivityEffective.fromJson(v as Map<String, dynamic>),
        ),
        report: $checkedConvert(
          'report',
          (v) => v == null
              ? null
              : InactivityReport.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminInactivityToJson(AdminInactivity instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
      'effective': instance.effective.toJson(),
      'report': instance.report?.toJson(),
    };
