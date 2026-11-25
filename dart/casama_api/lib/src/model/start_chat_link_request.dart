//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_chat_link_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StartChatLinkRequest {
  /// Returns a new [StartChatLinkRequest] instance.
  StartChatLinkRequest({

    required  this.botId,
  });

  @JsonKey(
    
    name: r'bot_id',
    required: true,
    includeIfNull: false,
  )


  final String botId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StartChatLinkRequest &&
      other.botId == botId;

    @override
    int get hashCode =>
        botId.hashCode;

  factory StartChatLinkRequest.fromJson(Map<String, dynamic> json) => _$StartChatLinkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StartChatLinkRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

