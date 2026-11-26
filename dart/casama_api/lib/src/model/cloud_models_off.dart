//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_off_bots_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_off.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsOff {
  /// Returns a new [CloudModelsOff] instance.
  CloudModelsOff({

    required  this.bots,
  });

  @JsonKey(
    
    name: r'bots',
    required: true,
    includeIfNull: false,
  )


  final List<CloudModelsOffBotsInner> bots;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsOff &&
      other.bots == bots;

    @override
    int get hashCode =>
        bots.hashCode;

  factory CloudModelsOff.fromJson(Map<String, dynamic> json) => _$CloudModelsOffFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsOffToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

