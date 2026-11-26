//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_state_payer.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsStatePayer {
  /// Returns a new [CloudModelsStatePayer] instance.
  CloudModelsStatePayer({

    required  this.orgId,

    required  this.name,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsStatePayer &&
      other.orgId == orgId &&
      other.name == name;

    @override
    int get hashCode =>
        orgId.hashCode +
        name.hashCode;

  factory CloudModelsStatePayer.fromJson(Map<String, dynamic> json) => _$CloudModelsStatePayerFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsStatePayerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

