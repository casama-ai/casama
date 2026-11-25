//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/landing_labels.dart';
import 'package:casama_api/src/model/attribution_platform.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_attribution_install_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PostAttributionInstallRequest {
  /// Returns a new [PostAttributionInstallRequest] instance.
  PostAttributionInstallRequest({

    required  this.installId,

    required  this.platform,

     this.distribution,

     this.appVersion,

     this.appPackage,

     this.osVersion,

     this.deviceModel,

     this.locale,

     this.timezone,

     this.screenWidth,

     this.screenHeight,

     this.screenDensity,

     this.cpuCores,

     this.metaAnonId,

     this.ga4AppInstanceId,

     this.playReferrer,

     this.landing,
  });

  @JsonKey(
    
    name: r'install_id',
    required: true,
    includeIfNull: false,
  )


  final String installId;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final AttributionPlatform platform;



  @JsonKey(
    
    name: r'distribution',
    required: false,
    includeIfNull: false,
  )


  final String? distribution;



  @JsonKey(
    
    name: r'app_version',
    required: false,
    includeIfNull: false,
  )


  final String? appVersion;



  @JsonKey(
    
    name: r'app_package',
    required: false,
    includeIfNull: false,
  )


  final String? appPackage;



  @JsonKey(
    
    name: r'os_version',
    required: false,
    includeIfNull: false,
  )


  final String? osVersion;



  @JsonKey(
    
    name: r'device_model',
    required: false,
    includeIfNull: false,
  )


  final String? deviceModel;



  @JsonKey(
    
    name: r'locale',
    required: false,
    includeIfNull: false,
  )


  final String? locale;



  @JsonKey(
    
    name: r'timezone',
    required: false,
    includeIfNull: false,
  )


  final String? timezone;



          // minimum: 0
          // maximum: 20000
  @JsonKey(
    
    name: r'screen_width',
    required: false,
    includeIfNull: false,
  )


  final int? screenWidth;



          // minimum: 0
          // maximum: 20000
  @JsonKey(
    
    name: r'screen_height',
    required: false,
    includeIfNull: false,
  )


  final int? screenHeight;



          // minimum: 0
          // maximum: 20
  @JsonKey(
    
    name: r'screen_density',
    required: false,
    includeIfNull: false,
  )


  final num? screenDensity;



          // minimum: 0
          // maximum: 1024
  @JsonKey(
    
    name: r'cpu_cores',
    required: false,
    includeIfNull: false,
  )


  final int? cpuCores;



  @JsonKey(
    
    name: r'meta_anon_id',
    required: false,
    includeIfNull: false,
  )


  final String? metaAnonId;



  @JsonKey(
    
    name: r'ga4_app_instance_id',
    required: false,
    includeIfNull: false,
  )


  final String? ga4AppInstanceId;



  @JsonKey(
    
    name: r'play_referrer',
    required: false,
    includeIfNull: false,
  )


  final String? playReferrer;



  @JsonKey(
    
    name: r'landing',
    required: false,
    includeIfNull: false,
  )


  final LandingLabels? landing;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PostAttributionInstallRequest &&
      other.installId == installId &&
      other.platform == platform &&
      other.distribution == distribution &&
      other.appVersion == appVersion &&
      other.appPackage == appPackage &&
      other.osVersion == osVersion &&
      other.deviceModel == deviceModel &&
      other.locale == locale &&
      other.timezone == timezone &&
      other.screenWidth == screenWidth &&
      other.screenHeight == screenHeight &&
      other.screenDensity == screenDensity &&
      other.cpuCores == cpuCores &&
      other.metaAnonId == metaAnonId &&
      other.ga4AppInstanceId == ga4AppInstanceId &&
      other.playReferrer == playReferrer &&
      other.landing == landing;

    @override
    int get hashCode =>
        installId.hashCode +
        platform.hashCode +
        distribution.hashCode +
        appVersion.hashCode +
        appPackage.hashCode +
        osVersion.hashCode +
        deviceModel.hashCode +
        locale.hashCode +
        timezone.hashCode +
        screenWidth.hashCode +
        screenHeight.hashCode +
        screenDensity.hashCode +
        cpuCores.hashCode +
        metaAnonId.hashCode +
        ga4AppInstanceId.hashCode +
        playReferrer.hashCode +
        landing.hashCode;

  factory PostAttributionInstallRequest.fromJson(Map<String, dynamic> json) => _$PostAttributionInstallRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostAttributionInstallRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

