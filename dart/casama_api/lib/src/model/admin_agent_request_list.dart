//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_agent_log_entry.dart';
import 'package:casama_api/src/model/admin_agent_request.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_agent_request_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminAgentRequestList {
  /// Returns a new [AdminAgentRequestList] instance.
  AdminAgentRequestList({

    required  this.items,

    required  this.log,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<AdminAgentRequest> items;



  @JsonKey(
    
    name: r'log',
    required: true,
    includeIfNull: false,
  )


  final List<AdminAgentLogEntry> log;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminAgentRequestList &&
      other.items == items &&
      other.log == log;

    @override
    int get hashCode =>
        items.hashCode +
        log.hashCode;

  factory AdminAgentRequestList.fromJson(Map<String, dynamic> json) => _$AdminAgentRequestListFromJson(json);

  Map<String, dynamic> toJson() => _$AdminAgentRequestListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

