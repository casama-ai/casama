//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_link_start.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatLinkStart {
  /// Returns a new [ChatLinkStart] instance.
  ChatLinkStart({

    required  this.url,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'url',
    required: true,
    includeIfNull: false,
  )


  final String url;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChatLinkStart &&
      other.url == url &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        url.hashCode +
        expiresAt.hashCode;

  factory ChatLinkStart.fromJson(Map<String, dynamic> json) => _$ChatLinkStartFromJson(json);

  Map<String, dynamic> toJson() => _$ChatLinkStartToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

