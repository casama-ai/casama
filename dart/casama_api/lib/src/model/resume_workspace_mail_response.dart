//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resume_workspace_mail_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResumeWorkspaceMailResponse {
  /// Returns a new [ResumeWorkspaceMailResponse] instance.
  ResumeWorkspaceMailResponse({

    required  this.orgId,

    required  this.resumed,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'resumed',
    required: true,
    includeIfNull: false,
  )


  final bool resumed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResumeWorkspaceMailResponse &&
      other.orgId == orgId &&
      other.resumed == resumed;

    @override
    int get hashCode =>
        orgId.hashCode +
        resumed.hashCode;

  factory ResumeWorkspaceMailResponse.fromJson(Map<String, dynamic> json) => _$ResumeWorkspaceMailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeWorkspaceMailResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

