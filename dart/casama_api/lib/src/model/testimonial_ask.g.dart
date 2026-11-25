// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial_ask.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestimonialAskCWProxy {
  TestimonialAsk canSend(bool canSend);

  TestimonialAsk nameShown(String? nameShown);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `TestimonialAsk(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TestimonialAsk(...).copyWith(id: 12, name: "My name")
  /// ```
  TestimonialAsk call({bool canSend, String? nameShown});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTestimonialAsk.copyWith(...)` or call `instanceOfTestimonialAsk.copyWith.fieldName(value)` for a single field.
class _$TestimonialAskCWProxyImpl implements _$TestimonialAskCWProxy {
  const _$TestimonialAskCWProxyImpl(this._value);

  final TestimonialAsk _value;

  @override
  TestimonialAsk canSend(bool canSend) => call(canSend: canSend);

  @override
  TestimonialAsk nameShown(String? nameShown) => call(nameShown: nameShown);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `TestimonialAsk(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TestimonialAsk(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  TestimonialAsk call({
    Object? canSend = const $CopyWithPlaceholder(),
    Object? nameShown = const $CopyWithPlaceholder(),
  }) {
    return TestimonialAsk(
      canSend: canSend == const $CopyWithPlaceholder() || canSend == null
          ? _value.canSend
          // ignore: cast_nullable_to_non_nullable
          : canSend as bool,
      nameShown: nameShown == const $CopyWithPlaceholder()
          ? _value.nameShown
          // ignore: cast_nullable_to_non_nullable
          : nameShown as String?,
    );
  }
}

extension $TestimonialAskCopyWith on TestimonialAsk {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTestimonialAsk.copyWith(...)` or `instanceOfTestimonialAsk.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestimonialAskCWProxy get copyWith => _$TestimonialAskCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestimonialAsk _$TestimonialAskFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TestimonialAsk', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['can_send', 'name_shown']);
      final val = TestimonialAsk(
        canSend: $checkedConvert('can_send', (v) => v as bool),
        nameShown: $checkedConvert('name_shown', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'canSend': 'can_send', 'nameShown': 'name_shown'});

Map<String, dynamic> _$TestimonialAskToJson(TestimonialAsk instance) =>
    <String, dynamic>{
      'can_send': instance.canSend,
      'name_shown': instance.nameShown,
    };
