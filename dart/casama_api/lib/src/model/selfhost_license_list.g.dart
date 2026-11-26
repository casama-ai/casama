// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfhost_license_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelfhostLicenseListCWProxy {
  SelfhostLicenseList items(List<SelfhostLicenseRow> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostLicenseList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostLicenseList(...).copyWith(id: 12, name: "My name")
  /// ```
  SelfhostLicenseList call({List<SelfhostLicenseRow> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelfhostLicenseList.copyWith(...)` or call `instanceOfSelfhostLicenseList.copyWith.fieldName(value)` for a single field.
class _$SelfhostLicenseListCWProxyImpl implements _$SelfhostLicenseListCWProxy {
  const _$SelfhostLicenseListCWProxyImpl(this._value);

  final SelfhostLicenseList _value;

  @override
  SelfhostLicenseList items(List<SelfhostLicenseRow> items) =>
      call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostLicenseList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostLicenseList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SelfhostLicenseList call({Object? items = const $CopyWithPlaceholder()}) {
    return SelfhostLicenseList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<SelfhostLicenseRow>,
    );
  }
}

extension $SelfhostLicenseListCopyWith on SelfhostLicenseList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelfhostLicenseList.copyWith(...)` or `instanceOfSelfhostLicenseList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelfhostLicenseListCWProxy get copyWith =>
      _$SelfhostLicenseListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfhostLicenseList _$SelfhostLicenseListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SelfhostLicenseList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = SelfhostLicenseList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) => SelfhostLicenseRow.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SelfhostLicenseListToJson(
  SelfhostLicenseList instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
