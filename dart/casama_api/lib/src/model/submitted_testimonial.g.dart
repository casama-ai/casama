// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submitted_testimonial.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubmittedTestimonialCWProxy {
  SubmittedTestimonial ok(bool ok);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SubmittedTestimonial(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SubmittedTestimonial(...).copyWith(id: 12, name: "My name")
  /// ```
  SubmittedTestimonial call({bool ok});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSubmittedTestimonial.copyWith(...)` or call `instanceOfSubmittedTestimonial.copyWith.fieldName(value)` for a single field.
class _$SubmittedTestimonialCWProxyImpl
    implements _$SubmittedTestimonialCWProxy {
  const _$SubmittedTestimonialCWProxyImpl(this._value);

  final SubmittedTestimonial _value;

  @override
  SubmittedTestimonial ok(bool ok) => call(ok: ok);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SubmittedTestimonial(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SubmittedTestimonial(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SubmittedTestimonial call({Object? ok = const $CopyWithPlaceholder()}) {
    return SubmittedTestimonial(
      ok: ok == const $CopyWithPlaceholder() || ok == null
          ? _value.ok
          // ignore: cast_nullable_to_non_nullable
          : ok as bool,
    );
  }
}

extension $SubmittedTestimonialCopyWith on SubmittedTestimonial {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSubmittedTestimonial.copyWith(...)` or `instanceOfSubmittedTestimonial.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubmittedTestimonialCWProxy get copyWith =>
      _$SubmittedTestimonialCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmittedTestimonial _$SubmittedTestimonialFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SubmittedTestimonial', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['ok']);
  final val = SubmittedTestimonial(ok: $checkedConvert('ok', (v) => v as bool));
  return val;
});

Map<String, dynamic> _$SubmittedTestimonialToJson(
  SubmittedTestimonial instance,
) => <String, dynamic>{'ok': instance.ok};
