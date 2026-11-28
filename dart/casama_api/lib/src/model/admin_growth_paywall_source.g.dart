// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_paywall_source.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthPaywallSourceCWProxy {
  AdminGrowthPaywallSource source_(String source_);

  AdminGrowthPaywallSource views(int views);

  AdminGrowthPaywallSource checkouts(int checkouts);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthPaywallSource(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthPaywallSource(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthPaywallSource call({String source_, int views, int checkouts});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthPaywallSource.copyWith(...)` or call `instanceOfAdminGrowthPaywallSource.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthPaywallSourceCWProxyImpl
    implements _$AdminGrowthPaywallSourceCWProxy {
  const _$AdminGrowthPaywallSourceCWProxyImpl(this._value);

  final AdminGrowthPaywallSource _value;

  @override
  AdminGrowthPaywallSource source_(String source_) => call(source_: source_);

  @override
  AdminGrowthPaywallSource views(int views) => call(views: views);

  @override
  AdminGrowthPaywallSource checkouts(int checkouts) =>
      call(checkouts: checkouts);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthPaywallSource(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthPaywallSource(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthPaywallSource call({
    Object? source_ = const $CopyWithPlaceholder(),
    Object? views = const $CopyWithPlaceholder(),
    Object? checkouts = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthPaywallSource(
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String,
      views: views == const $CopyWithPlaceholder() || views == null
          ? _value.views
          // ignore: cast_nullable_to_non_nullable
          : views as int,
      checkouts: checkouts == const $CopyWithPlaceholder() || checkouts == null
          ? _value.checkouts
          // ignore: cast_nullable_to_non_nullable
          : checkouts as int,
    );
  }
}

extension $AdminGrowthPaywallSourceCopyWith on AdminGrowthPaywallSource {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthPaywallSource.copyWith(...)` or `instanceOfAdminGrowthPaywallSource.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthPaywallSourceCWProxy get copyWith =>
      _$AdminGrowthPaywallSourceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthPaywallSource _$AdminGrowthPaywallSourceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminGrowthPaywallSource', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['source', 'views', 'checkouts']);
  final val = AdminGrowthPaywallSource(
    source_: $checkedConvert('source', (v) => v as String),
    views: $checkedConvert('views', (v) => (v as num).toInt()),
    checkouts: $checkedConvert('checkouts', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'source_': 'source'});

Map<String, dynamic> _$AdminGrowthPaywallSourceToJson(
  AdminGrowthPaywallSource instance,
) => <String, dynamic>{
  'source': instance.source_,
  'views': instance.views,
  'checkouts': instance.checkouts,
};
