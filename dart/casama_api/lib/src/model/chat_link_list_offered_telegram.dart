//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_link_list_offered_telegram.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatLinkListOfferedTelegram {
  /// Returns a new [ChatLinkListOfferedTelegram] instance.
  ChatLinkListOfferedTelegram({

    required  this.username,

    required  this.url,
  });

  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;



  @JsonKey(
    
    name: r'url',
    required: true,
    includeIfNull: false,
  )


  final String url;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChatLinkListOfferedTelegram &&
      other.username == username &&
      other.url == url;

    @override
    int get hashCode =>
        username.hashCode +
        url.hashCode;

  factory ChatLinkListOfferedTelegram.fromJson(Map<String, dynamic> json) => _$ChatLinkListOfferedTelegramFromJson(json);

  Map<String, dynamic> toJson() => _$ChatLinkListOfferedTelegramToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

