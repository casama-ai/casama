// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_testimonial.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PublicTestimonialCWProxy {
  PublicTestimonial quote(String quote);

  PublicTestimonial nameShown(String nameShown);

  PublicTestimonial roleShown(String? roleShown);

  PublicTestimonial rating(int? rating);

  PublicTestimonial source_(TestimonialSource source_);

  PublicTestimonial sourceUrl(String? sourceUrl);

  PublicTestimonial incentiveNote(String? incentiveNote);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublicTestimonial(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublicTestimonial(...).copyWith(id: 12, name: "My name")
  /// ```
  PublicTestimonial call({
    String quote,
    String nameShown,
    String? roleShown,
    int? rating,
    TestimonialSource source_,
    String? sourceUrl,
    String? incentiveNote,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPublicTestimonial.copyWith(...)` or call `instanceOfPublicTestimonial.copyWith.fieldName(value)` for a single field.
class _$PublicTestimonialCWProxyImpl implements _$PublicTestimonialCWProxy {
  const _$PublicTestimonialCWProxyImpl(this._value);

  final PublicTestimonial _value;

  @override
  PublicTestimonial quote(String quote) => call(quote: quote);

  @override
  PublicTestimonial nameShown(String nameShown) => call(nameShown: nameShown);

  @override
  PublicTestimonial roleShown(String? roleShown) => call(roleShown: roleShown);

  @override
  PublicTestimonial rating(int? rating) => call(rating: rating);

  @override
  PublicTestimonial source_(TestimonialSource source_) =>
      call(source_: source_);

  @override
  PublicTestimonial sourceUrl(String? sourceUrl) => call(sourceUrl: sourceUrl);

  @override
  PublicTestimonial incentiveNote(String? incentiveNote) =>
      call(incentiveNote: incentiveNote);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublicTestimonial(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublicTestimonial(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PublicTestimonial call({
    Object? quote = const $CopyWithPlaceholder(),
    Object? nameShown = const $CopyWithPlaceholder(),
    Object? roleShown = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? sourceUrl = const $CopyWithPlaceholder(),
    Object? incentiveNote = const $CopyWithPlaceholder(),
  }) {
    return PublicTestimonial(
      quote: quote == const $CopyWithPlaceholder() || quote == null
          ? _value.quote
          // ignore: cast_nullable_to_non_nullable
          : quote as String,
      nameShown: nameShown == const $CopyWithPlaceholder() || nameShown == null
          ? _value.nameShown
          // ignore: cast_nullable_to_non_nullable
          : nameShown as String,
      roleShown: roleShown == const $CopyWithPlaceholder()
          ? _value.roleShown
          // ignore: cast_nullable_to_non_nullable
          : roleShown as String?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int?,
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as TestimonialSource,
      sourceUrl: sourceUrl == const $CopyWithPlaceholder()
          ? _value.sourceUrl
          // ignore: cast_nullable_to_non_nullable
          : sourceUrl as String?,
      incentiveNote: incentiveNote == const $CopyWithPlaceholder()
          ? _value.incentiveNote
          // ignore: cast_nullable_to_non_nullable
          : incentiveNote as String?,
    );
  }
}

extension $PublicTestimonialCopyWith on PublicTestimonial {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPublicTestimonial.copyWith(...)` or `instanceOfPublicTestimonial.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PublicTestimonialCWProxy get copyWith =>
      _$PublicTestimonialCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicTestimonial _$PublicTestimonialFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PublicTestimonial',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'quote',
            'name_shown',
            'role_shown',
            'rating',
            'source',
            'source_url',
            'incentive_note',
          ],
        );
        final val = PublicTestimonial(
          quote: $checkedConvert('quote', (v) => v as String),
          nameShown: $checkedConvert('name_shown', (v) => v as String),
          roleShown: $checkedConvert('role_shown', (v) => v as String?),
          rating: $checkedConvert('rating', (v) => (v as num?)?.toInt()),
          source_: $checkedConvert(
            'source',
            (v) => $enumDecode(_$TestimonialSourceEnumMap, v),
          ),
          sourceUrl: $checkedConvert('source_url', (v) => v as String?),
          incentiveNote: $checkedConvert('incentive_note', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'nameShown': 'name_shown',
        'roleShown': 'role_shown',
        'source_': 'source',
        'sourceUrl': 'source_url',
        'incentiveNote': 'incentive_note',
      },
    );

Map<String, dynamic> _$PublicTestimonialToJson(PublicTestimonial instance) =>
    <String, dynamic>{
      'quote': instance.quote,
      'name_shown': instance.nameShown,
      'role_shown': instance.roleShown,
      'rating': instance.rating,
      'source': _$TestimonialSourceEnumMap[instance.source_]!,
      'source_url': instance.sourceUrl,
      'incentive_note': instance.incentiveNote,
    };

const _$TestimonialSourceEnumMap = {
  TestimonialSource.email: 'email',
  TestimonialSource.inApp: 'in_app',
  TestimonialSource.toolradar: 'toolradar',
  TestimonialSource.appStore: 'app_store',
  TestimonialSource.play: 'play',
  TestimonialSource.other: 'other',
};
