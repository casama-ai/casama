//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/acquisition.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attribution_status.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AttributionStatus {
  /// Returns a new [AttributionStatus] instance.
  AttributionStatus({

    required  this.offered,

    required  this.measureAds,

    required  this.metaSdkAllowed,

    required  this.heardFromAsked,

    required  this.acquisition,
  });

  @JsonKey(
    
    name: r'offered',
    required: true,
    includeIfNull: false,
  )


  final bool offered;



  @JsonKey(
    
    name: r'measure_ads',
    required: true,
    includeIfNull: false,
  )


  final bool measureAds;



  @JsonKey(
    
    name: r'meta_sdk_allowed',
    required: true,
    includeIfNull: false,
  )


  final bool metaSdkAllowed;



  @JsonKey(
    
    name: r'heard_from_asked',
    required: true,
    includeIfNull: false,
  )


  final bool heardFromAsked;



  @JsonKey(
    
    name: r'acquisition',
    required: true,
    includeIfNull: true,
  )


  final Acquisition? acquisition;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AttributionStatus &&
      other.offered == offered &&
      other.measureAds == measureAds &&
      other.metaSdkAllowed == metaSdkAllowed &&
      other.heardFromAsked == heardFromAsked &&
      other.acquisition == acquisition;

    @override
    int get hashCode =>
        offered.hashCode +
        measureAds.hashCode +
        metaSdkAllowed.hashCode +
        heardFromAsked.hashCode +
        (acquisition == null ? 0 : acquisition.hashCode);

  factory AttributionStatus.fromJson(Map<String, dynamic> json) => _$AttributionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AttributionStatusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

