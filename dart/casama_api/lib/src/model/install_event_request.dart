//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'install_event_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InstallEventRequest {
  /// Returns a new [InstallEventRequest] instance.
  InstallEventRequest({

    required  this.event,

    required  this.installId,

     this.clickId,

     this.reinstall,

    required  this.platform,

     this.distribution,

     this.version,

     this.locale,

     this.source_,

     this.medium,

     this.campaign,

     this.landing,
  });

  @JsonKey(
    
    name: r'event',
    required: true,
    includeIfNull: false,
  )


  final InstallEventRequestEventEnum event;



  @JsonKey(
    
    name: r'install_id',
    required: true,
    includeIfNull: false,
  )


  final String installId;



  @JsonKey(
    
    name: r'click_id',
    required: false,
    includeIfNull: false,
  )


  final String? clickId;



  @JsonKey(
    
    name: r'reinstall',
    required: false,
    includeIfNull: false,
  )


  final bool? reinstall;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final InstallEventRequestPlatformEnum platform;



  @JsonKey(
    
    name: r'distribution',
    required: false,
    includeIfNull: false,
  )


  final String? distribution;



  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



  @JsonKey(
    
    name: r'locale',
    required: false,
    includeIfNull: false,
  )


  final String? locale;



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



  @JsonKey(
    
    name: r'landing',
    required: false,
    includeIfNull: false,
  )


  final String? landing;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InstallEventRequest &&
      other.event == event &&
      other.installId == installId &&
      other.clickId == clickId &&
      other.reinstall == reinstall &&
      other.platform == platform &&
      other.distribution == distribution &&
      other.version == version &&
      other.locale == locale &&
      other.source_ == source_ &&
      other.medium == medium &&
      other.campaign == campaign &&
      other.landing == landing;

    @override
    int get hashCode =>
        event.hashCode +
        installId.hashCode +
        clickId.hashCode +
        reinstall.hashCode +
        platform.hashCode +
        distribution.hashCode +
        version.hashCode +
        locale.hashCode +
        source_.hashCode +
        medium.hashCode +
        campaign.hashCode +
        landing.hashCode;

  factory InstallEventRequest.fromJson(Map<String, dynamic> json) => _$InstallEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InstallEventRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum InstallEventRequestEventEnum {
@JsonValue(r'first_open')
firstOpen(r'first_open'),
@JsonValue(r'signin_started')
signinStarted(r'signin_started');

const InstallEventRequestEventEnum(this.value);

final String value;

@override
String toString() => value;
}



enum InstallEventRequestPlatformEnum {
@JsonValue(r'ios')
ios(r'ios'),
@JsonValue(r'android')
android(r'android'),
@JsonValue(r'macos')
macos(r'macos'),
@JsonValue(r'windows')
windows(r'windows'),
@JsonValue(r'linux')
linux(r'linux'),
@JsonValue(r'web')
web(r'web');

const InstallEventRequestPlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


