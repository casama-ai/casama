//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_user_team_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetUserTeamRequest {
  /// Returns a new [SetUserTeamRequest] instance.
  SetUserTeamRequest({

    required  this.team,
  });

  @JsonKey(
    
    name: r'team',
    required: true,
    includeIfNull: false,
  )


  final bool team;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetUserTeamRequest &&
      other.team == team;

    @override
    int get hashCode =>
        team.hashCode;

  factory SetUserTeamRequest.fromJson(Map<String, dynamic> json) => _$SetUserTeamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetUserTeamRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

