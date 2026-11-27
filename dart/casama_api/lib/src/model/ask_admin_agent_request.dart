//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ask_admin_agent_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AskAdminAgentRequest {
  /// Returns a new [AskAdminAgentRequest] instance.
  AskAdminAgentRequest({

    required  this.reason,

     this.minutes,
  });

  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;



          // minimum: 1
          // maximum: 30
  @JsonKey(
    
    name: r'minutes',
    required: false,
    includeIfNull: false,
  )


  final int? minutes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AskAdminAgentRequest &&
      other.reason == reason &&
      other.minutes == minutes;

    @override
    int get hashCode =>
        reason.hashCode +
        minutes.hashCode;

  factory AskAdminAgentRequest.fromJson(Map<String, dynamic> json) => _$AskAdminAgentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AskAdminAgentRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

