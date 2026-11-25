//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/owner_journey_steps.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_journey.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerJourney {
  /// Returns a new [OwnerJourney] instance.
  OwnerJourney({

    required  this.id,

    required  this.likely,

    required  this.clickPlatform,

    required  this.platform,

    required  this.distribution,

    required  this.appVersion,

    required  this.country,

    required  this.source_,

    required  this.medium,

    required  this.campaign,

    required  this.landing,

    required  this.page,

    required  this.firstClickAt,

    required  this.firstOpenAt,

    required  this.signinStartedAt,

    required  this.signupAt,

    required  this.steps,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'likely',
    required: true,
    includeIfNull: false,
  )


  final bool likely;



  @JsonKey(
    
    name: r'click_platform',
    required: true,
    includeIfNull: true,
  )


  final String? clickPlatform;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: true,
  )


  final String? platform;



  @JsonKey(
    
    name: r'distribution',
    required: true,
    includeIfNull: true,
  )


  final String? distribution;



  @JsonKey(
    
    name: r'app_version',
    required: true,
    includeIfNull: true,
  )


  final String? appVersion;



  @JsonKey(
    
    name: r'country',
    required: true,
    includeIfNull: true,
  )


  final String? country;



  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: true,
  )


  final String? source_;



  @JsonKey(
    
    name: r'medium',
    required: true,
    includeIfNull: true,
  )


  final String? medium;



  @JsonKey(
    
    name: r'campaign',
    required: true,
    includeIfNull: true,
  )


  final String? campaign;



  @JsonKey(
    
    name: r'landing',
    required: true,
    includeIfNull: true,
  )


  final String? landing;



  @JsonKey(
    
    name: r'page',
    required: true,
    includeIfNull: true,
  )


  final String? page;



  @JsonKey(
    
    name: r'first_click_at',
    required: true,
    includeIfNull: true,
  )


  final String? firstClickAt;



  @JsonKey(
    
    name: r'first_open_at',
    required: true,
    includeIfNull: true,
  )


  final String? firstOpenAt;



  @JsonKey(
    
    name: r'signin_started_at',
    required: true,
    includeIfNull: true,
  )


  final String? signinStartedAt;



  @JsonKey(
    
    name: r'signup_at',
    required: true,
    includeIfNull: true,
  )


  final String? signupAt;



  @JsonKey(
    
    name: r'steps',
    required: true,
    includeIfNull: false,
  )


  final OwnerJourneySteps steps;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerJourney &&
      other.id == id &&
      other.likely == likely &&
      other.clickPlatform == clickPlatform &&
      other.platform == platform &&
      other.distribution == distribution &&
      other.appVersion == appVersion &&
      other.country == country &&
      other.source_ == source_ &&
      other.medium == medium &&
      other.campaign == campaign &&
      other.landing == landing &&
      other.page == page &&
      other.firstClickAt == firstClickAt &&
      other.firstOpenAt == firstOpenAt &&
      other.signinStartedAt == signinStartedAt &&
      other.signupAt == signupAt &&
      other.steps == steps;

    @override
    int get hashCode =>
        id.hashCode +
        likely.hashCode +
        (clickPlatform == null ? 0 : clickPlatform.hashCode) +
        (platform == null ? 0 : platform.hashCode) +
        (distribution == null ? 0 : distribution.hashCode) +
        (appVersion == null ? 0 : appVersion.hashCode) +
        (country == null ? 0 : country.hashCode) +
        (source_ == null ? 0 : source_.hashCode) +
        (medium == null ? 0 : medium.hashCode) +
        (campaign == null ? 0 : campaign.hashCode) +
        (landing == null ? 0 : landing.hashCode) +
        (page == null ? 0 : page.hashCode) +
        (firstClickAt == null ? 0 : firstClickAt.hashCode) +
        (firstOpenAt == null ? 0 : firstOpenAt.hashCode) +
        (signinStartedAt == null ? 0 : signinStartedAt.hashCode) +
        (signupAt == null ? 0 : signupAt.hashCode) +
        steps.hashCode;

  factory OwnerJourney.fromJson(Map<String, dynamic> json) => _$OwnerJourneyFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerJourneyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

