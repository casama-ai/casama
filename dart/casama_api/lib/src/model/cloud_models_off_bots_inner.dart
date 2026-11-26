//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_off_bots_inner_to.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_off_bots_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsOffBotsInner {
  /// Returns a new [CloudModelsOffBotsInner] instance.
  CloudModelsOffBotsInner({

    required  this.id,

    required  this.name,

    required  this.to,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'to',
    required: true,
    includeIfNull: true,
  )


  final CloudModelsOffBotsInnerTo? to;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsOffBotsInner &&
      other.id == id &&
      other.name == name &&
      other.to == to;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        (to == null ? 0 : to.hashCode);

  factory CloudModelsOffBotsInner.fromJson(Map<String, dynamic> json) => _$CloudModelsOffBotsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsOffBotsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

