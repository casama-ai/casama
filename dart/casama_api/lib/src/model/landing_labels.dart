//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'landing_labels.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LandingLabels {
  /// Returns a new [LandingLabels] instance.
  LandingLabels({

     this.utmSource,

     this.utmMedium,

     this.utmCampaign,

     this.utmId,

     this.utmTerm,

     this.utmContent,

     this.fbclid,

     this.fbclidAt,

     this.refHost,

     this.landing,

     this.via,
  });

  @JsonKey(
    
    name: r'utm_source',
    required: false,
    includeIfNull: false,
  )


  final String? utmSource;



  @JsonKey(
    
    name: r'utm_medium',
    required: false,
    includeIfNull: false,
  )


  final String? utmMedium;



  @JsonKey(
    
    name: r'utm_campaign',
    required: false,
    includeIfNull: false,
  )


  final String? utmCampaign;



  @JsonKey(
    
    name: r'utm_id',
    required: false,
    includeIfNull: false,
  )


  final String? utmId;



  @JsonKey(
    
    name: r'utm_term',
    required: false,
    includeIfNull: false,
  )


  final String? utmTerm;



  @JsonKey(
    
    name: r'utm_content',
    required: false,
    includeIfNull: false,
  )


  final String? utmContent;



  @JsonKey(
    
    name: r'fbclid',
    required: false,
    includeIfNull: false,
  )


  final String? fbclid;



          // minimum: 0
  @JsonKey(
    
    name: r'fbclid_at',
    required: false,
    includeIfNull: false,
  )


  final int? fbclidAt;



  @JsonKey(
    
    name: r'ref_host',
    required: false,
    includeIfNull: false,
  )


  final String? refHost;



  @JsonKey(
    
    name: r'landing',
    required: false,
    includeIfNull: false,
  )


  final String? landing;



  @JsonKey(
    
    name: r'via',
    required: false,
    includeIfNull: false,
  )


  final String? via;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LandingLabels &&
      other.utmSource == utmSource &&
      other.utmMedium == utmMedium &&
      other.utmCampaign == utmCampaign &&
      other.utmId == utmId &&
      other.utmTerm == utmTerm &&
      other.utmContent == utmContent &&
      other.fbclid == fbclid &&
      other.fbclidAt == fbclidAt &&
      other.refHost == refHost &&
      other.landing == landing &&
      other.via == via;

    @override
    int get hashCode =>
        utmSource.hashCode +
        utmMedium.hashCode +
        utmCampaign.hashCode +
        utmId.hashCode +
        utmTerm.hashCode +
        utmContent.hashCode +
        fbclid.hashCode +
        fbclidAt.hashCode +
        refHost.hashCode +
        landing.hashCode +
        via.hashCode;

  factory LandingLabels.fromJson(Map<String, dynamic> json) => _$LandingLabelsFromJson(json);

  Map<String, dynamic> toJson() => _$LandingLabelsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

