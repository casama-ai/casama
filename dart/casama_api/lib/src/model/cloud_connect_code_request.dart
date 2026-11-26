//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_connect_code_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudConnectCodeRequest {
  /// Returns a new [CloudConnectCodeRequest] instance.
  CloudConnectCodeRequest({

    required  this.orgId,

    required  this.instanceId,

     this.instanceName,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'instance_id',
    required: true,
    includeIfNull: false,
  )


  final String instanceId;



  @JsonKey(
    
    name: r'instance_name',
    required: false,
    includeIfNull: false,
  )


  final String? instanceName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudConnectCodeRequest &&
      other.orgId == orgId &&
      other.instanceId == instanceId &&
      other.instanceName == instanceName;

    @override
    int get hashCode =>
        orgId.hashCode +
        instanceId.hashCode +
        instanceName.hashCode;

  factory CloudConnectCodeRequest.fromJson(Map<String, dynamic> json) => _$CloudConnectCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CloudConnectCodeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

