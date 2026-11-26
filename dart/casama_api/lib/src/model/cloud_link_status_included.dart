//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status_included.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatusIncluded {
  /// Returns a new [CloudLinkStatusIncluded] instance.
  CloudLinkStatusIncluded({

    required  this.usedUsd,

    required  this.limitUsd,
  });

  @JsonKey(
    
    name: r'used_usd',
    required: true,
    includeIfNull: false,
  )


  final num usedUsd;



  @JsonKey(
    
    name: r'limit_usd',
    required: true,
    includeIfNull: false,
  )


  final num limitUsd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatusIncluded &&
      other.usedUsd == usedUsd &&
      other.limitUsd == limitUsd;

    @override
    int get hashCode =>
        usedUsd.hashCode +
        limitUsd.hashCode;

  factory CloudLinkStatusIncluded.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusIncludedFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusIncludedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

