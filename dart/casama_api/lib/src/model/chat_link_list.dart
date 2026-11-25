//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/chat_link.dart';
import 'package:casama_api/src/model/chat_link_list_offered.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_link_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatLinkList {
  /// Returns a new [ChatLinkList] instance.
  ChatLinkList({

    required  this.items,

    required  this.offered,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<ChatLink> items;



  @JsonKey(
    
    name: r'offered',
    required: true,
    includeIfNull: false,
  )


  final ChatLinkListOffered offered;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChatLinkList &&
      other.items == items &&
      other.offered == offered;

    @override
    int get hashCode =>
        items.hashCode +
        offered.hashCode;

  factory ChatLinkList.fromJson(Map<String, dynamic> json) => _$ChatLinkListFromJson(json);

  Map<String, dynamic> toJson() => _$ChatLinkListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

