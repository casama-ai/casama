//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/chat_link_list_offered_telegram.dart';
import 'package:casama_api/src/model/chat_link_list_offered_discord.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_link_list_offered.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatLinkListOffered {
  /// Returns a new [ChatLinkListOffered] instance.
  ChatLinkListOffered({

    required  this.telegram,

    required  this.discord,
  });

  @JsonKey(
    
    name: r'telegram',
    required: true,
    includeIfNull: true,
  )


  final ChatLinkListOfferedTelegram? telegram;



  @JsonKey(
    
    name: r'discord',
    required: true,
    includeIfNull: true,
  )


  final ChatLinkListOfferedDiscord? discord;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChatLinkListOffered &&
      other.telegram == telegram &&
      other.discord == discord;

    @override
    int get hashCode =>
        (telegram == null ? 0 : telegram.hashCode) +
        (discord == null ? 0 : discord.hashCode);

  factory ChatLinkListOffered.fromJson(Map<String, dynamic> json) => _$ChatLinkListOfferedFromJson(json);

  Map<String, dynamic> toJson() => _$ChatLinkListOfferedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

