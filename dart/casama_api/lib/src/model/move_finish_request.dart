//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_finish_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveFinishRequest {
  /// Returns a new [MoveFinishRequest] instance.
  MoveFinishRequest({

    required  this.manifest,

    required  this.signature,
  });

  @JsonKey(
    
    name: r'manifest',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object?> manifest;



  @JsonKey(
    
    name: r'signature',
    required: true,
    includeIfNull: false,
  )


  final String signature;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveFinishRequest &&
      other.manifest == manifest &&
      other.signature == signature;

    @override
    int get hashCode =>
        manifest.hashCode +
        signature.hashCode;

  factory MoveFinishRequest.fromJson(Map<String, dynamic> json) => _$MoveFinishRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MoveFinishRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

