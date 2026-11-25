// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_source.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthSourceCWProxy {
  AdminGrowthSource source_(String source_);

  AdminGrowthSource signups(int signups);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthSource(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthSource(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthSource call({String source_, int signups});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthSource.copyWith(...)` or call `instanceOfAdminGrowthSource.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthSourceCWProxyImpl implements _$AdminGrowthSourceCWProxy {
  const _$AdminGrowthSourceCWProxyImpl(this._value);

  final AdminGrowthSource _value;

  @override
  AdminGrowthSource source_(String source_) => call(source_: source_);

  @override
  AdminGrowthSource signups(int signups) => call(signups: signups);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthSource(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthSource(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthSource call({
    Object? source_ = const $CopyWithPlaceholder(),
    Object? signups = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthSource(
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String,
      signups: signups == const $CopyWithPlaceholder() || signups == null
          ? _value.signups
          // ignore: cast_nullable_to_non_nullable
          : signups as int,
    );
  }
}

extension $AdminGrowthSourceCopyWith on AdminGrowthSource {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthSource.copyWith(...)` or `instanceOfAdminGrowthSource.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthSourceCWProxy get copyWith =>
      _$AdminGrowthSourceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthSource _$AdminGrowthSourceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminGrowthSource', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['source', 'signups']);
      final val = AdminGrowthSource(
        source_: $checkedConvert('source', (v) => v as String),
        signups: $checkedConvert('signups', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'source_': 'source'});

Map<String, dynamic> _$AdminGrowthSourceToJson(AdminGrowthSource instance) =>
    <String, dynamic>{'source': instance.source_, 'signups': instance.signups};
