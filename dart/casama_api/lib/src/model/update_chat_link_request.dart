//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_chat_link_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateChatLinkRequest {
  /// Returns a new [UpdateChatLinkRequest] instance.
  UpdateChatLinkRequest({

    required  this.defaultBotId,
  });

  @JsonKey(
    
    name: r'default_bot_id',
    required: true,
    includeIfNull: false,
  )


  final String defaultBotId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateChatLinkRequest &&
      other.defaultBotId == defaultBotId;

    @override
    int get hashCode =>
        defaultBotId.hashCode;

  factory UpdateChatLinkRequest.fromJson(Map<String, dynamic> json) => _$UpdateChatLinkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateChatLinkRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

