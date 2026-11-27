//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_agent_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminAgentRequest {
  /// Returns a new [AdminAgentRequest] instance.
  AdminAgentRequest({

    required  this.id,

    required  this.keyId,

    required  this.keyName,

    required  this.reason,

    required  this.minutes,

    required  this.status,

    required  this.createdAt,

    required  this.expiresAt,

    required  this.answeredAt,

    required  this.validUntil,

    required  this.endedAt,

    required  this.changes,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'key_id',
    required: true,
    includeIfNull: false,
  )


  final String keyId;



  @JsonKey(
    
    name: r'key_name',
    required: true,
    includeIfNull: false,
  )


  final String keyName;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;



  @JsonKey(
    
    name: r'minutes',
    required: true,
    includeIfNull: false,
  )


  final int minutes;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final AdminAgentRequestStatusEnum status;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'answered_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? answeredAt;



  @JsonKey(
    
    name: r'valid_until',
    required: true,
    includeIfNull: true,
  )


  final DateTime? validUntil;



  @JsonKey(
    
    name: r'ended_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? endedAt;



  @JsonKey(
    
    name: r'changes',
    required: true,
    includeIfNull: false,
  )


  final int changes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminAgentRequest &&
      other.id == id &&
      other.keyId == keyId &&
      other.keyName == keyName &&
      other.reason == reason &&
      other.minutes == minutes &&
      other.status == status &&
      other.createdAt == createdAt &&
      other.expiresAt == expiresAt &&
      other.answeredAt == answeredAt &&
      other.validUntil == validUntil &&
      other.endedAt == endedAt &&
      other.changes == changes;

    @override
    int get hashCode =>
        id.hashCode +
        keyId.hashCode +
        keyName.hashCode +
        reason.hashCode +
        minutes.hashCode +
        status.hashCode +
        createdAt.hashCode +
        expiresAt.hashCode +
        (answeredAt == null ? 0 : answeredAt.hashCode) +
        (validUntil == null ? 0 : validUntil.hashCode) +
        (endedAt == null ? 0 : endedAt.hashCode) +
        changes.hashCode;

  factory AdminAgentRequest.fromJson(Map<String, dynamic> json) => _$AdminAgentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AdminAgentRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminAgentRequestStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'approved')
approved(r'approved'),
@JsonValue(r'denied')
denied(r'denied'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'ended')
ended(r'ended');

const AdminAgentRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


