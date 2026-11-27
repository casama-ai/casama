//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_agent_log_entry.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminAgentLogEntry {
  /// Returns a new [AdminAgentLogEntry] instance.
  AdminAgentLogEntry({

    required  this.at,

    required  this.action,

    required  this.keyName,

    required  this.method,

    required  this.path,

    required  this.status,
  });

  @JsonKey(
    
    name: r'at',
    required: true,
    includeIfNull: false,
  )


  final DateTime at;



  @JsonKey(
    
    name: r'action',
    required: true,
    includeIfNull: false,
  )


  final String action;



  @JsonKey(
    
    name: r'key_name',
    required: true,
    includeIfNull: true,
  )


  final String? keyName;



  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: true,
  )


  final String? method;



  @JsonKey(
    
    name: r'path',
    required: true,
    includeIfNull: true,
  )


  final String? path;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: true,
  )


  final int? status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminAgentLogEntry &&
      other.at == at &&
      other.action == action &&
      other.keyName == keyName &&
      other.method == method &&
      other.path == path &&
      other.status == status;

    @override
    int get hashCode =>
        at.hashCode +
        action.hashCode +
        (keyName == null ? 0 : keyName.hashCode) +
        (method == null ? 0 : method.hashCode) +
        (path == null ? 0 : path.hashCode) +
        (status == null ? 0 : status.hashCode);

  factory AdminAgentLogEntry.fromJson(Map<String, dynamic> json) => _$AdminAgentLogEntryFromJson(json);

  Map<String, dynamic> toJson() => _$AdminAgentLogEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

