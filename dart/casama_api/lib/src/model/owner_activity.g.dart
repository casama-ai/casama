// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_activity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerActivityCWProxy {
  OwnerActivity items(List<OwnerEvent> items);

  OwnerActivity today(Map<String, int> today);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerActivity(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerActivity(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerActivity call({List<OwnerEvent> items, Map<String, int> today});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerActivity.copyWith(...)` or call `instanceOfOwnerActivity.copyWith.fieldName(value)` for a single field.
class _$OwnerActivityCWProxyImpl implements _$OwnerActivityCWProxy {
  const _$OwnerActivityCWProxyImpl(this._value);

  final OwnerActivity _value;

  @override
  OwnerActivity items(List<OwnerEvent> items) => call(items: items);

  @override
  OwnerActivity today(Map<String, int> today) => call(today: today);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerActivity(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerActivity(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerActivity call({
    Object? items = const $CopyWithPlaceholder(),
    Object? today = const $CopyWithPlaceholder(),
  }) {
    return OwnerActivity(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<OwnerEvent>,
      today: today == const $CopyWithPlaceholder() || today == null
          ? _value.today
          // ignore: cast_nullable_to_non_nullable
          : today as Map<String, int>,
    );
  }
}

extension $OwnerActivityCopyWith on OwnerActivity {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerActivity.copyWith(...)` or `instanceOfOwnerActivity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerActivityCWProxy get copyWith => _$OwnerActivityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerActivity _$OwnerActivityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OwnerActivity', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'today']);
      final val = OwnerActivity(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => OwnerEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        today: $checkedConvert('today', (v) => Map<String, int>.from(v as Map)),
      );
      return val;
    });

Map<String, dynamic> _$OwnerActivityToJson(OwnerActivity instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'today': instance.today,
    };
