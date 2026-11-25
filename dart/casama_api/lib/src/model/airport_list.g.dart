// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AirportListCWProxy {
  AirportList items(List<AirportHit> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AirportList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AirportList(...).copyWith(id: 12, name: "My name")
  /// ```
  AirportList call({List<AirportHit> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAirportList.copyWith(...)` or call `instanceOfAirportList.copyWith.fieldName(value)` for a single field.
class _$AirportListCWProxyImpl implements _$AirportListCWProxy {
  const _$AirportListCWProxyImpl(this._value);

  final AirportList _value;

  @override
  AirportList items(List<AirportHit> items) => call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AirportList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AirportList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AirportList call({Object? items = const $CopyWithPlaceholder()}) {
    return AirportList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AirportHit>,
    );
  }
}

extension $AirportListCopyWith on AirportList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAirportList.copyWith(...)` or `instanceOfAirportList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AirportListCWProxy get copyWith => _$AirportListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportList _$AirportListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AirportList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = AirportList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => AirportHit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AirportListToJson(AirportList instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
