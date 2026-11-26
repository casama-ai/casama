//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_off_bots_inner_to.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsOffBotsInnerTo {
  /// Returns a new [CloudModelsOffBotsInnerTo] instance.
  CloudModelsOffBotsInnerTo({

    required  this.label,
  });

  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: false,
  )


  final String label;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsOffBotsInnerTo &&
      other.label == label;

    @override
    int get hashCode =>
        label.hashCode;

  factory CloudModelsOffBotsInnerTo.fromJson(Map<String, dynamic> json) => _$CloudModelsOffBotsInnerToFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsOffBotsInnerToToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

