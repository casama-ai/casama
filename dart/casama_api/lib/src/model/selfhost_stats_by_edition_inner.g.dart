// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfhost_stats_by_edition_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelfhostStatsByEditionInnerCWProxy {
  SelfhostStatsByEditionInner edition(
    SelfhostStatsByEditionInnerEditionEnum edition,
  );

  SelfhostStatsByEditionInner active(int active);

  SelfhostStatsByEditionInner total(int total);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatsByEditionInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatsByEditionInner(...).copyWith(id: 12, name: "My name")
  /// ```
  SelfhostStatsByEditionInner call({
    SelfhostStatsByEditionInnerEditionEnum edition,
    int active,
    int total,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelfhostStatsByEditionInner.copyWith(...)` or call `instanceOfSelfhostStatsByEditionInner.copyWith.fieldName(value)` for a single field.
class _$SelfhostStatsByEditionInnerCWProxyImpl
    implements _$SelfhostStatsByEditionInnerCWProxy {
  const _$SelfhostStatsByEditionInnerCWProxyImpl(this._value);

  final SelfhostStatsByEditionInner _value;

  @override
  SelfhostStatsByEditionInner edition(
    SelfhostStatsByEditionInnerEditionEnum edition,
  ) => call(edition: edition);

  @override
  SelfhostStatsByEditionInner active(int active) => call(active: active);

  @override
  SelfhostStatsByEditionInner total(int total) => call(total: total);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStatsByEditionInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStatsByEditionInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SelfhostStatsByEditionInner call({
    Object? edition = const $CopyWithPlaceholder(),
    Object? active = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return SelfhostStatsByEditionInner(
      edition: edition == const $CopyWithPlaceholder() || edition == null
          ? _value.edition
          // ignore: cast_nullable_to_non_nullable
          : edition as SelfhostStatsByEditionInnerEditionEnum,
      active: active == const $CopyWithPlaceholder() || active == null
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as int,
      total: total == const $CopyWithPlaceholder() || total == null
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
    );
  }
}

extension $SelfhostStatsByEditionInnerCopyWith on SelfhostStatsByEditionInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelfhostStatsByEditionInner.copyWith(...)` or `instanceOfSelfhostStatsByEditionInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelfhostStatsByEditionInnerCWProxy get copyWith =>
      _$SelfhostStatsByEditionInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfhostStatsByEditionInner _$SelfhostStatsByEditionInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SelfhostStatsByEditionInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['edition', 'active', 'total']);
  final val = SelfhostStatsByEditionInner(
    edition: $checkedConvert(
      'edition',
      (v) => $enumDecode(_$SelfhostStatsByEditionInnerEditionEnumEnumMap, v),
    ),
    active: $checkedConvert('active', (v) => (v as num).toInt()),
    total: $checkedConvert('total', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$SelfhostStatsByEditionInnerToJson(
  SelfhostStatsByEditionInner instance,
) => <String, dynamic>{
  'edition': _$SelfhostStatsByEditionInnerEditionEnumEnumMap[instance.edition]!,
  'active': instance.active,
  'total': instance.total,
};

const _$SelfhostStatsByEditionInnerEditionEnumEnumMap = {
  SelfhostStatsByEditionInnerEditionEnum.personal: 'personal',
  SelfhostStatsByEditionInnerEditionEnum.trial: 'trial',
  SelfhostStatsByEditionInnerEditionEnum.business: 'business',
};
