// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_event_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SiteEventRequestCWProxy {
  SiteEventRequest kind(SiteEventRequestKindEnum kind);

  SiteEventRequest platform(String? platform);

  SiteEventRequest page(String? page);

  SiteEventRequest country(String? country);

  SiteEventRequest mobile(bool? mobile);

  SiteEventRequest clickId(String? clickId);

  SiteEventRequest source_(String? source_);

  SiteEventRequest medium(String? medium);

  SiteEventRequest campaign(String? campaign);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SiteEventRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SiteEventRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SiteEventRequest call({
    SiteEventRequestKindEnum kind,
    String? platform,
    String? page,
    String? country,
    bool? mobile,
    String? clickId,
    String? source_,
    String? medium,
    String? campaign,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSiteEventRequest.copyWith(...)` or call `instanceOfSiteEventRequest.copyWith.fieldName(value)` for a single field.
class _$SiteEventRequestCWProxyImpl implements _$SiteEventRequestCWProxy {
  const _$SiteEventRequestCWProxyImpl(this._value);

  final SiteEventRequest _value;

  @override
  SiteEventRequest kind(SiteEventRequestKindEnum kind) => call(kind: kind);

  @override
  SiteEventRequest platform(String? platform) => call(platform: platform);

  @override
  SiteEventRequest page(String? page) => call(page: page);

  @override
  SiteEventRequest country(String? country) => call(country: country);

  @override
  SiteEventRequest mobile(bool? mobile) => call(mobile: mobile);

  @override
  SiteEventRequest clickId(String? clickId) => call(clickId: clickId);

  @override
  SiteEventRequest source_(String? source_) => call(source_: source_);

  @override
  SiteEventRequest medium(String? medium) => call(medium: medium);

  @override
  SiteEventRequest campaign(String? campaign) => call(campaign: campaign);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SiteEventRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SiteEventRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SiteEventRequest call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? mobile = const $CopyWithPlaceholder(),
    Object? clickId = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? medium = const $CopyWithPlaceholder(),
    Object? campaign = const $CopyWithPlaceholder(),
  }) {
    return SiteEventRequest(
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as SiteEventRequestKindEnum,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
      mobile: mobile == const $CopyWithPlaceholder()
          ? _value.mobile
          // ignore: cast_nullable_to_non_nullable
          : mobile as bool?,
      clickId: clickId == const $CopyWithPlaceholder()
          ? _value.clickId
          // ignore: cast_nullable_to_non_nullable
          : clickId as String?,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String?,
      medium: medium == const $CopyWithPlaceholder()
          ? _value.medium
          // ignore: cast_nullable_to_non_nullable
          : medium as String?,
      campaign: campaign == const $CopyWithPlaceholder()
          ? _value.campaign
          // ignore: cast_nullable_to_non_nullable
          : campaign as String?,
    );
  }
}

extension $SiteEventRequestCopyWith on SiteEventRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSiteEventRequest.copyWith(...)` or `instanceOfSiteEventRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SiteEventRequestCWProxy get copyWith => _$SiteEventRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteEventRequest _$SiteEventRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SiteEventRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['kind']);
      final val = SiteEventRequest(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$SiteEventRequestKindEnumEnumMap, v),
        ),
        platform: $checkedConvert('platform', (v) => v as String?),
        page: $checkedConvert('page', (v) => v as String?),
        country: $checkedConvert('country', (v) => v as String?),
        mobile: $checkedConvert('mobile', (v) => v as bool?),
        clickId: $checkedConvert('click_id', (v) => v as String?),
        source_: $checkedConvert('source', (v) => v as String?),
        medium: $checkedConvert('medium', (v) => v as String?),
        campaign: $checkedConvert('campaign', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'clickId': 'click_id', 'source_': 'source'});

Map<String, dynamic> _$SiteEventRequestToJson(SiteEventRequest instance) =>
    <String, dynamic>{
      'kind': _$SiteEventRequestKindEnumEnumMap[instance.kind]!,
      'platform': ?instance.platform,
      'page': ?instance.page,
      'country': ?instance.country,
      'mobile': ?instance.mobile,
      'click_id': ?instance.clickId,
      'source': ?instance.source_,
      'medium': ?instance.medium,
      'campaign': ?instance.campaign,
    };

const _$SiteEventRequestKindEnumEnumMap = {
  SiteEventRequestKindEnum.downloadClick: 'download_click',
  SiteEventRequestKindEnum.qrOpen: 'qr_open',
  SiteEventRequestKindEnum.startClick: 'start_click',
  SiteEventRequestKindEnum.inviteOpen: 'invite_open',
  SiteEventRequestKindEnum.partnerInterest: 'partner_interest',
  SiteEventRequestKindEnum.creatorOpen: 'creator_open',
  SiteEventRequestKindEnum.giftOpen: 'gift_open',
  SiteEventRequestKindEnum.newsletterConfirmed: 'newsletter_confirmed',
};
