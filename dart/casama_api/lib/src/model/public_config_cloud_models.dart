//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_config_cloud_models.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublicConfigCloudModels {
  /// Returns a new [PublicConfigCloudModels] instance.
  PublicConfigCloudModels({

    required  this.available,

    required  this.connected,
  });

  @JsonKey(
    
    name: r'available',
    required: true,
    includeIfNull: false,
  )


  final bool available;



  @JsonKey(
    
    name: r'connected',
    required: true,
    includeIfNull: false,
  )


  final bool connected;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PublicConfigCloudModels &&
      other.available == available &&
      other.connected == connected;

    @override
    int get hashCode =>
        available.hashCode +
        connected.hashCode;

  factory PublicConfigCloudModels.fromJson(Map<String, dynamic> json) => _$PublicConfigCloudModelsFromJson(json);

  Map<String, dynamic> toJson() => _$PublicConfigCloudModelsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

