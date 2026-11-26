//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_move_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateMoveRequest {
  /// Returns a new [CreateMoveRequest] instance.
  CreateMoveRequest({

    required  this.orgId,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateMoveRequest &&
      other.orgId == orgId;

    @override
    int get hashCode =>
        orgId.hashCode;

  factory CreateMoveRequest.fromJson(Map<String, dynamic> json) => _$CreateMoveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMoveRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

