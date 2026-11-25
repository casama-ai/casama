// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_testimonials.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PublicTestimonialsCWProxy {
  PublicTestimonials items(List<PublicTestimonial> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublicTestimonials(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublicTestimonials(...).copyWith(id: 12, name: "My name")
  /// ```
  PublicTestimonials call({List<PublicTestimonial> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPublicTestimonials.copyWith(...)` or call `instanceOfPublicTestimonials.copyWith.fieldName(value)` for a single field.
class _$PublicTestimonialsCWProxyImpl implements _$PublicTestimonialsCWProxy {
  const _$PublicTestimonialsCWProxyImpl(this._value);

  final PublicTestimonials _value;

  @override
  PublicTestimonials items(List<PublicTestimonial> items) => call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublicTestimonials(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublicTestimonials(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PublicTestimonials call({Object? items = const $CopyWithPlaceholder()}) {
    return PublicTestimonials(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<PublicTestimonial>,
    );
  }
}

extension $PublicTestimonialsCopyWith on PublicTestimonials {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPublicTestimonials.copyWith(...)` or `instanceOfPublicTestimonials.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PublicTestimonialsCWProxy get copyWith =>
      _$PublicTestimonialsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicTestimonials _$PublicTestimonialsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PublicTestimonials', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = PublicTestimonials(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => PublicTestimonial.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PublicTestimonialsToJson(PublicTestimonials instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
