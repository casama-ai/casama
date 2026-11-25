// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_testimonial_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubmitTestimonialRequestCWProxy {
  SubmitTestimonialRequest quote(String quote);

  SubmitTestimonialRequest consent(bool consent);

  SubmitTestimonialRequest orgId(String? orgId);

  SubmitTestimonialRequest platform(String? platform);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SubmitTestimonialRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SubmitTestimonialRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SubmitTestimonialRequest call({
    String quote,
    bool consent,
    String? orgId,
    String? platform,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSubmitTestimonialRequest.copyWith(...)` or call `instanceOfSubmitTestimonialRequest.copyWith.fieldName(value)` for a single field.
class _$SubmitTestimonialRequestCWProxyImpl
    implements _$SubmitTestimonialRequestCWProxy {
  const _$SubmitTestimonialRequestCWProxyImpl(this._value);

  final SubmitTestimonialRequest _value;

  @override
  SubmitTestimonialRequest quote(String quote) => call(quote: quote);

  @override
  SubmitTestimonialRequest consent(bool consent) => call(consent: consent);

  @override
  SubmitTestimonialRequest orgId(String? orgId) => call(orgId: orgId);

  @override
  SubmitTestimonialRequest platform(String? platform) =>
      call(platform: platform);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SubmitTestimonialRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SubmitTestimonialRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SubmitTestimonialRequest call({
    Object? quote = const $CopyWithPlaceholder(),
    Object? consent = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
  }) {
    return SubmitTestimonialRequest(
      quote: quote == const $CopyWithPlaceholder() || quote == null
          ? _value.quote
          // ignore: cast_nullable_to_non_nullable
          : quote as String,
      consent: consent == const $CopyWithPlaceholder() || consent == null
          ? _value.consent
          // ignore: cast_nullable_to_non_nullable
          : consent as bool,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String?,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
    );
  }
}

extension $SubmitTestimonialRequestCopyWith on SubmitTestimonialRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSubmitTestimonialRequest.copyWith(...)` or `instanceOfSubmitTestimonialRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubmitTestimonialRequestCWProxy get copyWith =>
      _$SubmitTestimonialRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitTestimonialRequest _$SubmitTestimonialRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SubmitTestimonialRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['quote', 'consent']);
  final val = SubmitTestimonialRequest(
    quote: $checkedConvert('quote', (v) => v as String),
    consent: $checkedConvert('consent', (v) => v as bool),
    orgId: $checkedConvert('org_id', (v) => v as String?),
    platform: $checkedConvert('platform', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'orgId': 'org_id'});

Map<String, dynamic> _$SubmitTestimonialRequestToJson(
  SubmitTestimonialRequest instance,
) => <String, dynamic>{
  'quote': instance.quote,
  'consent': instance.consent,
  'org_id': ?instance.orgId,
  'platform': ?instance.platform,
};
