//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_preview_bots_inner_from.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_preview_bots_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsPreviewBotsInner {
  /// Returns a new [CloudModelsPreviewBotsInner] instance.
  CloudModelsPreviewBotsInner({

    required  this.id,

    required  this.name,

    required  this.from,

    required  this.suggested,

    required  this.stepDown,
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
    
    name: r'from',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPreviewBotsInnerFrom from;



  @JsonKey(
    
    name: r'suggested',
    required: true,
    includeIfNull: false,
  )


  final bool suggested;



  @JsonKey(
    
    name: r'step_down',
    required: true,
    includeIfNull: false,
  )


  final bool stepDown;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsPreviewBotsInner &&
      other.id == id &&
      other.name == name &&
      other.from == from &&
      other.suggested == suggested &&
      other.stepDown == stepDown;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        from.hashCode +
        suggested.hashCode +
        stepDown.hashCode;

  factory CloudModelsPreviewBotsInner.fromJson(Map<String, dynamic> json) => _$CloudModelsPreviewBotsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsPreviewBotsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

