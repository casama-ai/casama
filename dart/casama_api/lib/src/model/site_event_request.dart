//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_event_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SiteEventRequest {
  /// Returns a new [SiteEventRequest] instance.
  SiteEventRequest({

    required  this.kind,

     this.platform,

     this.page,

     this.country,

     this.mobile,

     this.clickId,

     this.source_,

     this.medium,

     this.campaign,
  });

  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final SiteEventRequestKindEnum kind;



  @JsonKey(
    
    name: r'platform',
    required: false,
    includeIfNull: false,
  )


  final String? platform;



  @JsonKey(
    
    name: r'page',
    required: false,
    includeIfNull: false,
  )


  final String? page;



  @JsonKey(
    
    name: r'country',
    required: false,
    includeIfNull: false,
  )


  final String? country;



  @JsonKey(
    
    name: r'mobile',
    required: false,
    includeIfNull: false,
  )


  final bool? mobile;



  @JsonKey(
    
    name: r'click_id',
    required: false,
    includeIfNull: false,
  )


  final String? clickId;



  @JsonKey(
    
    name: r'source',
    required: false,
    includeIfNull: false,
  )


  final String? source_;



  @JsonKey(
    
    name: r'medium',
    required: false,
    includeIfNull: false,
  )


  final String? medium;



  @JsonKey(
    
    name: r'campaign',
    required: false,
    includeIfNull: false,
  )


  final String? campaign;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SiteEventRequest &&
      other.kind == kind &&
      other.platform == platform &&
      other.page == page &&
      other.country == country &&
      other.mobile == mobile &&
      other.clickId == clickId &&
      other.source_ == source_ &&
      other.medium == medium &&
      other.campaign == campaign;

    @override
    int get hashCode =>
        kind.hashCode +
        platform.hashCode +
        page.hashCode +
        country.hashCode +
        mobile.hashCode +
        clickId.hashCode +
        source_.hashCode +
        medium.hashCode +
        campaign.hashCode;

  factory SiteEventRequest.fromJson(Map<String, dynamic> json) => _$SiteEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SiteEventRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SiteEventRequestKindEnum {
@JsonValue(r'download_click')
downloadClick(r'download_click'),
@JsonValue(r'qr_open')
qrOpen(r'qr_open'),
@JsonValue(r'start_click')
startClick(r'start_click'),
@JsonValue(r'invite_open')
inviteOpen(r'invite_open'),
@JsonValue(r'partner_interest')
partnerInterest(r'partner_interest'),
@JsonValue(r'creator_open')
creatorOpen(r'creator_open'),
@JsonValue(r'gift_open')
giftOpen(r'gift_open'),
@JsonValue(r'newsletter_confirmed')
newsletterConfirmed(r'newsletter_confirmed');

const SiteEventRequestKindEnum(this.value);

final String value;

@override
String toString() => value;
}


