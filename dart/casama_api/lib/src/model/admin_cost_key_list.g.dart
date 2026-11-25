// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_cost_key_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminCostKeyListCWProxy {
  AdminCostKeyList items(List<AdminCostKey> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostKeyList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostKeyList(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminCostKeyList call({List<AdminCostKey> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminCostKeyList.copyWith(...)` or call `instanceOfAdminCostKeyList.copyWith.fieldName(value)` for a single field.
class _$AdminCostKeyListCWProxyImpl implements _$AdminCostKeyListCWProxy {
  const _$AdminCostKeyListCWProxyImpl(this._value);

  final AdminCostKeyList _value;

  @override
  AdminCostKeyList items(List<AdminCostKey> items) => call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminCostKeyList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminCostKeyList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminCostKeyList call({Object? items = const $CopyWithPlaceholder()}) {
    return AdminCostKeyList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AdminCostKey>,
    );
  }
}

extension $AdminCostKeyListCopyWith on AdminCostKeyList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminCostKeyList.copyWith(...)` or `instanceOfAdminCostKeyList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminCostKeyListCWProxy get copyWith => _$AdminCostKeyListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCostKeyList _$AdminCostKeyListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminCostKeyList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = AdminCostKeyList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => AdminCostKey.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminCostKeyListToJson(AdminCostKeyList instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
