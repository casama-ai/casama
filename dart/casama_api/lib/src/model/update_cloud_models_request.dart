//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_policy.dart';
import 'package:casama_api/src/model/cloud_models_fallback.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_cloud_models_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCloudModelsRequest {
  /// Returns a new [UpdateCloudModelsRequest] instance.
  UpdateCloudModelsRequest({

     this.policy,

     this.fallback,
  });

  @JsonKey(
    
    name: r'policy',
    required: false,
    includeIfNull: false,
  )


  final CloudModelsPolicy? policy;



  @JsonKey(
    
    name: r'fallback',
    required: false,
    includeIfNull: false,
  )


  final CloudModelsFallback? fallback;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCloudModelsRequest &&
      other.policy == policy &&
      other.fallback == fallback;

    @override
    int get hashCode =>
        policy.hashCode +
        fallback.hashCode;

  factory UpdateCloudModelsRequest.fromJson(Map<String, dynamic> json) => _$UpdateCloudModelsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCloudModelsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

