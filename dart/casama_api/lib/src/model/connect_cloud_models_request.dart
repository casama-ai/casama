//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'connect_cloud_models_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConnectCloudModelsRequest {
  /// Returns a new [ConnectCloudModelsRequest] instance.
  ConnectCloudModelsRequest({

    required  this.code,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConnectCloudModelsRequest &&
      other.code == code;

    @override
    int get hashCode =>
        code.hashCode;

  factory ConnectCloudModelsRequest.fromJson(Map<String, dynamic> json) => _$ConnectCloudModelsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectCloudModelsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

