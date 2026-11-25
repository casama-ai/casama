//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'acquisition.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Acquisition {
  /// Returns a new [Acquisition] instance.
  Acquisition({

    required  this.source_,

    required  this.medium,

    required  this.campaign,

    required  this.adSet,

    required  this.ad,

    required  this.network,

    required  this.kind,
  });

  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final String source_;



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
    
    name: r'ad_set',
    required: true,
    includeIfNull: true,
  )


  final String? adSet;



  @JsonKey(
    
    name: r'ad',
    required: true,
    includeIfNull: true,
  )


  final String? ad;



  @JsonKey(
    
    name: r'network',
    required: true,
    includeIfNull: true,
  )


  final String? network;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final String kind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Acquisition &&
      other.source_ == source_ &&
      other.medium == medium &&
      other.campaign == campaign &&
      other.adSet == adSet &&
      other.ad == ad &&
      other.network == network &&
      other.kind == kind;

    @override
    int get hashCode =>
        source_.hashCode +
        (medium == null ? 0 : medium.hashCode) +
        (campaign == null ? 0 : campaign.hashCode) +
        (adSet == null ? 0 : adSet.hashCode) +
        (ad == null ? 0 : ad.hashCode) +
        (network == null ? 0 : network.hashCode) +
        kind.hashCode;

  factory Acquisition.fromJson(Map<String, dynamic> json) => _$AcquisitionFromJson(json);

  Map<String, dynamic> toJson() => _$AcquisitionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

