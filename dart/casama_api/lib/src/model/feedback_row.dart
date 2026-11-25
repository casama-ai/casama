//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/feedback_status.dart';
import 'package:casama_api/src/model/feedback_kind.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_row.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FeedbackRow {
  /// Returns a new [FeedbackRow] instance.
  FeedbackRow({

    required  this.id,

    required  this.kind,

    required  this.message,

    required  this.contactOk,

    required  this.status,

    required  this.userEmail,

    required  this.orgId,

    required  this.orgName,

    required  this.appVersion,

    required  this.platform,

    required  this.plan,

    required  this.ideasPostUrl,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final FeedbackKind kind;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



  @JsonKey(
    
    name: r'contact_ok',
    required: true,
    includeIfNull: false,
  )


  final bool contactOk;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final FeedbackStatus status;



  @JsonKey(
    
    name: r'user_email',
    required: true,
    includeIfNull: true,
  )


  final String? userEmail;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: true,
  )


  final String? orgId;



  @JsonKey(
    
    name: r'org_name',
    required: true,
    includeIfNull: true,
  )


  final String? orgName;



  @JsonKey(
    
    name: r'app_version',
    required: true,
    includeIfNull: true,
  )


  final String? appVersion;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: true,
  )


  final String? platform;



  @JsonKey(
    
    name: r'plan',
    required: true,
    includeIfNull: true,
  )


  final String? plan;



  @JsonKey(
    
    name: r'ideas_post_url',
    required: true,
    includeIfNull: true,
  )


  final String? ideasPostUrl;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FeedbackRow &&
      other.id == id &&
      other.kind == kind &&
      other.message == message &&
      other.contactOk == contactOk &&
      other.status == status &&
      other.userEmail == userEmail &&
      other.orgId == orgId &&
      other.orgName == orgName &&
      other.appVersion == appVersion &&
      other.platform == platform &&
      other.plan == plan &&
      other.ideasPostUrl == ideasPostUrl &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        kind.hashCode +
        message.hashCode +
        contactOk.hashCode +
        status.hashCode +
        (userEmail == null ? 0 : userEmail.hashCode) +
        (orgId == null ? 0 : orgId.hashCode) +
        (orgName == null ? 0 : orgName.hashCode) +
        (appVersion == null ? 0 : appVersion.hashCode) +
        (platform == null ? 0 : platform.hashCode) +
        (plan == null ? 0 : plan.hashCode) +
        (ideasPostUrl == null ? 0 : ideasPostUrl.hashCode) +
        createdAt.hashCode;

  factory FeedbackRow.fromJson(Map<String, dynamic> json) => _$FeedbackRowFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackRowToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

