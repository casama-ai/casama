// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_labels.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LandingLabelsCWProxy {
  LandingLabels utmSource(String? utmSource);

  LandingLabels utmMedium(String? utmMedium);

  LandingLabels utmCampaign(String? utmCampaign);

  LandingLabels utmId(String? utmId);

  LandingLabels utmTerm(String? utmTerm);

  LandingLabels utmContent(String? utmContent);

  LandingLabels fbclid(String? fbclid);

  LandingLabels fbclidAt(int? fbclidAt);

  LandingLabels refHost(String? refHost);

  LandingLabels landing(String? landing);

  LandingLabels via(String? via);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `LandingLabels(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LandingLabels(...).copyWith(id: 12, name: "My name")
  /// ```
  LandingLabels call({
    String? utmSource,
    String? utmMedium,
    String? utmCampaign,
    String? utmId,
    String? utmTerm,
    String? utmContent,
    String? fbclid,
    int? fbclidAt,
    String? refHost,
    String? landing,
    String? via,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLandingLabels.copyWith(...)` or call `instanceOfLandingLabels.copyWith.fieldName(value)` for a single field.
class _$LandingLabelsCWProxyImpl implements _$LandingLabelsCWProxy {
  const _$LandingLabelsCWProxyImpl(this._value);

  final LandingLabels _value;

  @override
  LandingLabels utmSource(String? utmSource) => call(utmSource: utmSource);

  @override
  LandingLabels utmMedium(String? utmMedium) => call(utmMedium: utmMedium);

  @override
  LandingLabels utmCampaign(String? utmCampaign) =>
      call(utmCampaign: utmCampaign);

  @override
  LandingLabels utmId(String? utmId) => call(utmId: utmId);

  @override
  LandingLabels utmTerm(String? utmTerm) => call(utmTerm: utmTerm);

  @override
  LandingLabels utmContent(String? utmContent) => call(utmContent: utmContent);

  @override
  LandingLabels fbclid(String? fbclid) => call(fbclid: fbclid);

  @override
  LandingLabels fbclidAt(int? fbclidAt) => call(fbclidAt: fbclidAt);

  @override
  LandingLabels refHost(String? refHost) => call(refHost: refHost);

  @override
  LandingLabels landing(String? landing) => call(landing: landing);

  @override
  LandingLabels via(String? via) => call(via: via);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `LandingLabels(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LandingLabels(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  LandingLabels call({
    Object? utmSource = const $CopyWithPlaceholder(),
    Object? utmMedium = const $CopyWithPlaceholder(),
    Object? utmCampaign = const $CopyWithPlaceholder(),
    Object? utmId = const $CopyWithPlaceholder(),
    Object? utmTerm = const $CopyWithPlaceholder(),
    Object? utmContent = const $CopyWithPlaceholder(),
    Object? fbclid = const $CopyWithPlaceholder(),
    Object? fbclidAt = const $CopyWithPlaceholder(),
    Object? refHost = const $CopyWithPlaceholder(),
    Object? landing = const $CopyWithPlaceholder(),
    Object? via = const $CopyWithPlaceholder(),
  }) {
    return LandingLabels(
      utmSource: utmSource == const $CopyWithPlaceholder()
          ? _value.utmSource
          // ignore: cast_nullable_to_non_nullable
          : utmSource as String?,
      utmMedium: utmMedium == const $CopyWithPlaceholder()
          ? _value.utmMedium
          // ignore: cast_nullable_to_non_nullable
          : utmMedium as String?,
      utmCampaign: utmCampaign == const $CopyWithPlaceholder()
          ? _value.utmCampaign
          // ignore: cast_nullable_to_non_nullable
          : utmCampaign as String?,
      utmId: utmId == const $CopyWithPlaceholder()
          ? _value.utmId
          // ignore: cast_nullable_to_non_nullable
          : utmId as String?,
      utmTerm: utmTerm == const $CopyWithPlaceholder()
          ? _value.utmTerm
          // ignore: cast_nullable_to_non_nullable
          : utmTerm as String?,
      utmContent: utmContent == const $CopyWithPlaceholder()
          ? _value.utmContent
          // ignore: cast_nullable_to_non_nullable
          : utmContent as String?,
      fbclid: fbclid == const $CopyWithPlaceholder()
          ? _value.fbclid
          // ignore: cast_nullable_to_non_nullable
          : fbclid as String?,
      fbclidAt: fbclidAt == const $CopyWithPlaceholder()
          ? _value.fbclidAt
          // ignore: cast_nullable_to_non_nullable
          : fbclidAt as int?,
      refHost: refHost == const $CopyWithPlaceholder()
          ? _value.refHost
          // ignore: cast_nullable_to_non_nullable
          : refHost as String?,
      landing: landing == const $CopyWithPlaceholder()
          ? _value.landing
          // ignore: cast_nullable_to_non_nullable
          : landing as String?,
      via: via == const $CopyWithPlaceholder()
          ? _value.via
          // ignore: cast_nullable_to_non_nullable
          : via as String?,
    );
  }
}

extension $LandingLabelsCopyWith on LandingLabels {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLandingLabels.copyWith(...)` or `instanceOfLandingLabels.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LandingLabelsCWProxy get copyWith => _$LandingLabelsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingLabels _$LandingLabelsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LandingLabels',
      json,
      ($checkedConvert) {
        final val = LandingLabels(
          utmSource: $checkedConvert('utm_source', (v) => v as String?),
          utmMedium: $checkedConvert('utm_medium', (v) => v as String?),
          utmCampaign: $checkedConvert('utm_campaign', (v) => v as String?),
          utmId: $checkedConvert('utm_id', (v) => v as String?),
          utmTerm: $checkedConvert('utm_term', (v) => v as String?),
          utmContent: $checkedConvert('utm_content', (v) => v as String?),
          fbclid: $checkedConvert('fbclid', (v) => v as String?),
          fbclidAt: $checkedConvert('fbclid_at', (v) => (v as num?)?.toInt()),
          refHost: $checkedConvert('ref_host', (v) => v as String?),
          landing: $checkedConvert('landing', (v) => v as String?),
          via: $checkedConvert('via', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'utmSource': 'utm_source',
        'utmMedium': 'utm_medium',
        'utmCampaign': 'utm_campaign',
        'utmId': 'utm_id',
        'utmTerm': 'utm_term',
        'utmContent': 'utm_content',
        'fbclidAt': 'fbclid_at',
        'refHost': 'ref_host',
      },
    );

Map<String, dynamic> _$LandingLabelsToJson(LandingLabels instance) =>
    <String, dynamic>{
      'utm_source': ?instance.utmSource,
      'utm_medium': ?instance.utmMedium,
      'utm_campaign': ?instance.utmCampaign,
      'utm_id': ?instance.utmId,
      'utm_term': ?instance.utmTerm,
      'utm_content': ?instance.utmContent,
      'fbclid': ?instance.fbclid,
      'fbclid_at': ?instance.fbclidAt,
      'ref_host': ?instance.refHost,
      'landing': ?instance.landing,
      'via': ?instance.via,
    };
