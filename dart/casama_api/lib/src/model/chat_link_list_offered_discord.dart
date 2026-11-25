//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_link_list_offered_discord.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatLinkListOfferedDiscord {
  /// Returns a new [ChatLinkListOfferedDiscord] instance.
  ChatLinkListOfferedDiscord({

    required  this.url,
  });

  @JsonKey(
    
    name: r'url',
    required: true,
    includeIfNull: true,
  )


  final String? url;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChatLinkListOfferedDiscord &&
      other.url == url;

    @override
    int get hashCode =>
        (url == null ? 0 : url.hashCode);

  factory ChatLinkListOfferedDiscord.fromJson(Map<String, dynamic> json) => _$ChatLinkListOfferedDiscordFromJson(json);

  Map<String, dynamic> toJson() => _$ChatLinkListOfferedDiscordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

