//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_attribution_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetAttributionRequest {
  /// Returns a new [SetAttributionRequest] instance.
  SetAttributionRequest({

     this.platform,

     this.source_,

     this.medium,

     this.campaign,

     this.landing,

     this.installId,
  });

  @JsonKey(
    
    name: r'platform',
    required: false,
    includeIfNull: false,
  )


  final SetAttributionRequestPlatformEnum? platform;



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



  @JsonKey(
    
    name: r'install_id',
    required: false,
    includeIfNull: false,
  )


  final String? installId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetAttributionRequest &&
      other.platform == platform &&
      other.source_ == source_ &&
      other.medium == medium &&
      other.campaign == campaign &&
      other.landing == landing &&
      other.installId == installId;

    @override
    int get hashCode =>
        platform.hashCode +
        source_.hashCode +
        medium.hashCode +
        campaign.hashCode +
        landing.hashCode +
        installId.hashCode;

  factory SetAttributionRequest.fromJson(Map<String, dynamic> json) => _$SetAttributionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetAttributionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SetAttributionRequestPlatformEnum {
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
web(r'web'),
@JsonValue(r'extension')
extension_(r'extension');

const SetAttributionRequestPlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


