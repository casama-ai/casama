//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_policy.dart';
import 'package:casama_api/src/model/cloud_models_fallback.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_cloud_models_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApplyCloudModelsRequest {
  /// Returns a new [ApplyCloudModelsRequest] instance.
  ApplyCloudModelsRequest({

    required  this.bots,

     this.workspaceDefault,

     this.embedding,

     this.fallback,

     this.policy,
  });

  @JsonKey(
    
    name: r'bots',
    required: true,
    includeIfNull: false,
  )


  final List<String> bots;



  @JsonKey(
    
    name: r'workspace_default',
    required: false,
    includeIfNull: false,
  )


  final bool? workspaceDefault;



  @JsonKey(
    
    name: r'embedding',
    required: false,
    includeIfNull: false,
  )


  final bool? embedding;



  @JsonKey(
    
    name: r'fallback',
    required: false,
    includeIfNull: false,
  )


  final CloudModelsFallback? fallback;



  @JsonKey(
    
    name: r'policy',
    required: false,
    includeIfNull: false,
  )


  final CloudModelsPolicy? policy;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ApplyCloudModelsRequest &&
      other.bots == bots &&
      other.workspaceDefault == workspaceDefault &&
      other.embedding == embedding &&
      other.fallback == fallback &&
      other.policy == policy;

    @override
    int get hashCode =>
        bots.hashCode +
        workspaceDefault.hashCode +
        embedding.hashCode +
        fallback.hashCode +
        policy.hashCode;

  factory ApplyCloudModelsRequest.fromJson(Map<String, dynamic> json) => _$ApplyCloudModelsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyCloudModelsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

