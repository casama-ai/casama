//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/ui_action_part.dart';
import 'package:casama_api/src/model/app_mention_ref.dart';
import 'package:casama_api/src/model/message_attachment.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendMessageRequest {
  /// Returns a new [SendMessageRequest] instance.
  SendMessageRequest({

     this.text = '',

     this.attachments,

     this.uiAction,

     this.skills,

     this.apps,

     this.clientId,

     this.clientBuild,
  });

  @JsonKey(
    defaultValue: '',
    name: r'text',
    required: false,
    includeIfNull: false,
  )


  final String? text;



  @JsonKey(
    
    name: r'attachments',
    required: false,
    includeIfNull: false,
  )


  final List<MessageAttachment>? attachments;



  @JsonKey(
    
    name: r'ui_action',
    required: false,
    includeIfNull: false,
  )


  final UiActionPart? uiAction;



      /// Skills picked with / in the composer; the run loads them up front
  @JsonKey(
    
    name: r'skills',
    required: false,
    includeIfNull: false,
  )


  final List<String>? skills;



      /// Connected apps picked with @ in the composer; the run preloads their tools
  @JsonKey(
    
    name: r'apps',
    required: false,
    includeIfNull: false,
  )


  final List<AppMentionRef>? apps;



      /// The sending app install's id (the one it reports chat focus with). The bot's in-app browser opens on the device that sent the last message when the chat is open on several.
  @JsonKey(
    
    name: r'client_id',
    required: false,
    includeIfNull: false,
  )


  final String? clientId;



      /// What kind of build sent it: direct (web, desktop downloads, direct APK) or store (App Store, Google Play, Galaxy Store, Mac App Store). Adult sites only work from direct builds (D-522); recorded with client_id.
  @JsonKey(
    
    name: r'client_build',
    required: false,
    includeIfNull: false,
  )


  final SendMessageRequestClientBuildEnum? clientBuild;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SendMessageRequest &&
      other.text == text &&
      other.attachments == attachments &&
      other.uiAction == uiAction &&
      other.skills == skills &&
      other.apps == apps &&
      other.clientId == clientId &&
      other.clientBuild == clientBuild;

    @override
    int get hashCode =>
        text.hashCode +
        attachments.hashCode +
        uiAction.hashCode +
        skills.hashCode +
        apps.hashCode +
        clientId.hashCode +
        clientBuild.hashCode;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) => _$SendMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// What kind of build sent it: direct (web, desktop downloads, direct APK) or store (App Store, Google Play, Galaxy Store, Mac App Store). Adult sites only work from direct builds (D-522); recorded with client_id.
enum SendMessageRequestClientBuildEnum {
    /// What kind of build sent it: direct (web, desktop downloads, direct APK) or store (App Store, Google Play, Galaxy Store, Mac App Store). Adult sites only work from direct builds (D-522); recorded with client_id.
@JsonValue(r'direct')
direct(r'direct'),
    /// What kind of build sent it: direct (web, desktop downloads, direct APK) or store (App Store, Google Play, Galaxy Store, Mac App Store). Adult sites only work from direct builds (D-522); recorded with client_id.
@JsonValue(r'store')
store(r'store');

const SendMessageRequestClientBuildEnum(this.value);

final String value;

@override
String toString() => value;
}


