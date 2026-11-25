//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/feedback_kind.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FeedbackRequest {
  /// Returns a new [FeedbackRequest] instance.
  FeedbackRequest({

     this.orgId,

    required  this.kind,

    required  this.message,

     this.contactOk = true,

     this.appVersion,

     this.platform,
  });

  @JsonKey(
    
    name: r'org_id',
    required: false,
    includeIfNull: false,
  )


  final String? orgId;



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
    defaultValue: true,
    name: r'contact_ok',
    required: false,
    includeIfNull: false,
  )


  final bool? contactOk;



  @JsonKey(
    
    name: r'app_version',
    required: false,
    includeIfNull: false,
  )


  final String? appVersion;



  @JsonKey(
    
    name: r'platform',
    required: false,
    includeIfNull: false,
  )


  final String? platform;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FeedbackRequest &&
      other.orgId == orgId &&
      other.kind == kind &&
      other.message == message &&
      other.contactOk == contactOk &&
      other.appVersion == appVersion &&
      other.platform == platform;

    @override
    int get hashCode =>
        orgId.hashCode +
        kind.hashCode +
        message.hashCode +
        contactOk.hashCode +
        appVersion.hashCode +
        platform.hashCode;

  factory FeedbackRequest.fromJson(Map<String, dynamic> json) => _$FeedbackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

