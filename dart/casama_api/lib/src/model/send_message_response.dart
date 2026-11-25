//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendMessageResponse {
  /// Returns a new [SendMessageResponse] instance.
  SendMessageResponse({

    required  this.messageId,

    required  this.runId,

    required  this.conversationId,

     this.runIds,

     this.joined,

     this.text,
  });

  @JsonKey(
    
    name: r'message_id',
    required: true,
    includeIfNull: false,
  )


  final String messageId;



  @JsonKey(
    
    name: r'run_id',
    required: true,
    includeIfNull: false,
  )


  final String runId;



  @JsonKey(
    
    name: r'conversation_id',
    required: true,
    includeIfNull: false,
  )


  final String conversationId;



      /// Group chats: every bot's run
  @JsonKey(
    
    name: r'run_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? runIds;



      /// The bot was already working here: the message joined that run (run_id), which sees it before its next step
  @JsonKey(
    
    name: r'joined',
    required: false,
    includeIfNull: false,
  )


  final bool? joined;



      /// Set when the server stored different text than was sent: a two-step code typed in the chat is kept as dots (D-497). Show this in the sent bubble.
  @JsonKey(
    
    name: r'text',
    required: false,
    includeIfNull: false,
  )


  final String? text;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SendMessageResponse &&
      other.messageId == messageId &&
      other.runId == runId &&
      other.conversationId == conversationId &&
      other.runIds == runIds &&
      other.joined == joined &&
      other.text == text;

    @override
    int get hashCode =>
        messageId.hashCode +
        runId.hashCode +
        conversationId.hashCode +
        runIds.hashCode +
        joined.hashCode +
        text.hashCode;

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) => _$SendMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

