// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_testimonials.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminTestimonialsCWProxy {
  AdminTestimonials items(List<AdminTestimonial> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminTestimonials(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminTestimonials(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminTestimonials call({List<AdminTestimonial> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminTestimonials.copyWith(...)` or call `instanceOfAdminTestimonials.copyWith.fieldName(value)` for a single field.
class _$AdminTestimonialsCWProxyImpl implements _$AdminTestimonialsCWProxy {
  const _$AdminTestimonialsCWProxyImpl(this._value);

  final AdminTestimonials _value;

  @override
  AdminTestimonials items(List<AdminTestimonial> items) => call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminTestimonials(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminTestimonials(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminTestimonials call({Object? items = const $CopyWithPlaceholder()}) {
    return AdminTestimonials(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AdminTestimonial>,
    );
  }
}

extension $AdminTestimonialsCopyWith on AdminTestimonials {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminTestimonials.copyWith(...)` or `instanceOfAdminTestimonials.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminTestimonialsCWProxy get copyWith =>
      _$AdminTestimonialsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTestimonials _$AdminTestimonialsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminTestimonials', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = AdminTestimonials(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => AdminTestimonial.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminTestimonialsToJson(AdminTestimonials instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
