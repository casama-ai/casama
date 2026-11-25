// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_admin_testimonial_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateAdminTestimonialRequestCWProxy {
  CreateAdminTestimonialRequest quote(String quote);

  CreateAdminTestimonialRequest nameShown(String nameShown);

  CreateAdminTestimonialRequest roleShown(String? roleShown);

  CreateAdminTestimonialRequest source_(TestimonialSource source_);

  CreateAdminTestimonialRequest sourceUrl(String? sourceUrl);

  CreateAdminTestimonialRequest consentText(String? consentText);

  CreateAdminTestimonialRequest consentAt(DateTime? consentAt);

  CreateAdminTestimonialRequest userEmail(String? userEmail);

  CreateAdminTestimonialRequest rating(int? rating);

  CreateAdminTestimonialRequest incentiveNote(String? incentiveNote);

  CreateAdminTestimonialRequest places(List<TestimonialPlace>? places);

  CreateAdminTestimonialRequest sort(int? sort);

  CreateAdminTestimonialRequest state(TestimonialState? state);

  CreateAdminTestimonialRequest notes(String? notes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminTestimonialRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminTestimonialRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateAdminTestimonialRequest call({
    String quote,
    String nameShown,
    String? roleShown,
    TestimonialSource source_,
    String? sourceUrl,
    String? consentText,
    DateTime? consentAt,
    String? userEmail,
    int? rating,
    String? incentiveNote,
    List<TestimonialPlace>? places,
    int? sort,
    TestimonialState? state,
    String? notes,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateAdminTestimonialRequest.copyWith(...)` or call `instanceOfCreateAdminTestimonialRequest.copyWith.fieldName(value)` for a single field.
class _$CreateAdminTestimonialRequestCWProxyImpl
    implements _$CreateAdminTestimonialRequestCWProxy {
  const _$CreateAdminTestimonialRequestCWProxyImpl(this._value);

  final CreateAdminTestimonialRequest _value;

  @override
  CreateAdminTestimonialRequest quote(String quote) => call(quote: quote);

  @override
  CreateAdminTestimonialRequest nameShown(String nameShown) =>
      call(nameShown: nameShown);

  @override
  CreateAdminTestimonialRequest roleShown(String? roleShown) =>
      call(roleShown: roleShown);

  @override
  CreateAdminTestimonialRequest source_(TestimonialSource source_) =>
      call(source_: source_);

  @override
  CreateAdminTestimonialRequest sourceUrl(String? sourceUrl) =>
      call(sourceUrl: sourceUrl);

  @override
  CreateAdminTestimonialRequest consentText(String? consentText) =>
      call(consentText: consentText);

  @override
  CreateAdminTestimonialRequest consentAt(DateTime? consentAt) =>
      call(consentAt: consentAt);

  @override
  CreateAdminTestimonialRequest userEmail(String? userEmail) =>
      call(userEmail: userEmail);

  @override
  CreateAdminTestimonialRequest rating(int? rating) => call(rating: rating);

  @override
  CreateAdminTestimonialRequest incentiveNote(String? incentiveNote) =>
      call(incentiveNote: incentiveNote);

  @override
  CreateAdminTestimonialRequest places(List<TestimonialPlace>? places) =>
      call(places: places);

  @override
  CreateAdminTestimonialRequest sort(int? sort) => call(sort: sort);

  @override
  CreateAdminTestimonialRequest state(TestimonialState? state) =>
      call(state: state);

  @override
  CreateAdminTestimonialRequest notes(String? notes) => call(notes: notes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminTestimonialRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminTestimonialRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateAdminTestimonialRequest call({
    Object? quote = const $CopyWithPlaceholder(),
    Object? nameShown = const $CopyWithPlaceholder(),
    Object? roleShown = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? sourceUrl = const $CopyWithPlaceholder(),
    Object? consentText = const $CopyWithPlaceholder(),
    Object? consentAt = const $CopyWithPlaceholder(),
    Object? userEmail = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? incentiveNote = const $CopyWithPlaceholder(),
    Object? places = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? notes = const $CopyWithPlaceholder(),
  }) {
    return CreateAdminTestimonialRequest(
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
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as TestimonialSource,
      sourceUrl: sourceUrl == const $CopyWithPlaceholder()
          ? _value.sourceUrl
          // ignore: cast_nullable_to_non_nullable
          : sourceUrl as String?,
      consentText: consentText == const $CopyWithPlaceholder()
          ? _value.consentText
          // ignore: cast_nullable_to_non_nullable
          : consentText as String?,
      consentAt: consentAt == const $CopyWithPlaceholder()
          ? _value.consentAt
          // ignore: cast_nullable_to_non_nullable
          : consentAt as DateTime?,
      userEmail: userEmail == const $CopyWithPlaceholder()
          ? _value.userEmail
          // ignore: cast_nullable_to_non_nullable
          : userEmail as String?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int?,
      incentiveNote: incentiveNote == const $CopyWithPlaceholder()
          ? _value.incentiveNote
          // ignore: cast_nullable_to_non_nullable
          : incentiveNote as String?,
      places: places == const $CopyWithPlaceholder()
          ? _value.places
          // ignore: cast_nullable_to_non_nullable
          : places as List<TestimonialPlace>?,
      sort: sort == const $CopyWithPlaceholder()
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as int?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as TestimonialState?,
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as String?,
    );
  }
}

extension $CreateAdminTestimonialRequestCopyWith
    on CreateAdminTestimonialRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateAdminTestimonialRequest.copyWith(...)` or `instanceOfCreateAdminTestimonialRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateAdminTestimonialRequestCWProxy get copyWith =>
      _$CreateAdminTestimonialRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdminTestimonialRequest _$CreateAdminTestimonialRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateAdminTestimonialRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['quote', 'name_shown', 'source']);
    final val = CreateAdminTestimonialRequest(
      quote: $checkedConvert('quote', (v) => v as String),
      nameShown: $checkedConvert('name_shown', (v) => v as String),
      roleShown: $checkedConvert('role_shown', (v) => v as String?),
      source_: $checkedConvert(
        'source',
        (v) => $enumDecode(_$TestimonialSourceEnumMap, v),
      ),
      sourceUrl: $checkedConvert('source_url', (v) => v as String?),
      consentText: $checkedConvert('consent_text', (v) => v as String?),
      consentAt: $checkedConvert(
        'consent_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      userEmail: $checkedConvert('user_email', (v) => v as String?),
      rating: $checkedConvert('rating', (v) => (v as num?)?.toInt()),
      incentiveNote: $checkedConvert('incentive_note', (v) => v as String?),
      places: $checkedConvert(
        'places',
        (v) => (v as List<dynamic>?)
            ?.map((e) => $enumDecode(_$TestimonialPlaceEnumMap, e))
            .toList(),
      ),
      sort: $checkedConvert('sort', (v) => (v as num?)?.toInt()),
      state: $checkedConvert(
        'state',
        (v) => $enumDecodeNullable(_$TestimonialStateEnumMap, v),
      ),
      notes: $checkedConvert('notes', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'nameShown': 'name_shown',
    'roleShown': 'role_shown',
    'source_': 'source',
    'sourceUrl': 'source_url',
    'consentText': 'consent_text',
    'consentAt': 'consent_at',
    'userEmail': 'user_email',
    'incentiveNote': 'incentive_note',
  },
);

Map<String, dynamic> _$CreateAdminTestimonialRequestToJson(
  CreateAdminTestimonialRequest instance,
) => <String, dynamic>{
  'quote': instance.quote,
  'name_shown': instance.nameShown,
  'role_shown': ?instance.roleShown,
  'source': _$TestimonialSourceEnumMap[instance.source_]!,
  'source_url': ?instance.sourceUrl,
  'consent_text': ?instance.consentText,
  'consent_at': ?instance.consentAt?.toIso8601String(),
  'user_email': ?instance.userEmail,
  'rating': ?instance.rating,
  'incentive_note': ?instance.incentiveNote,
  'places': ?instance.places
      ?.map((e) => _$TestimonialPlaceEnumMap[e]!)
      .toList(),
  'sort': ?instance.sort,
  'state': ?_$TestimonialStateEnumMap[instance.state],
  'notes': ?instance.notes,
};

const _$TestimonialSourceEnumMap = {
  TestimonialSource.email: 'email',
  TestimonialSource.inApp: 'in_app',
  TestimonialSource.toolradar: 'toolradar',
  TestimonialSource.appStore: 'app_store',
  TestimonialSource.play: 'play',
  TestimonialSource.other: 'other',
};

const _$TestimonialPlaceEnumMap = {
  TestimonialPlace.siteHome: 'site_home',
  TestimonialPlace.sitePricing: 'site_pricing',
  TestimonialPlace.appPaywall: 'app_paywall',
  TestimonialPlace.appSignin: 'app_signin',
};

const _$TestimonialStateEnumMap = {
  TestimonialState.draft: 'draft',
  TestimonialState.live: 'live',
  TestimonialState.hidden: 'hidden',
  TestimonialState.withdrawn: 'withdrawn',
};
