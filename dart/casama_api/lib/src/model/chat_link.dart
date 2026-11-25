//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/chat_link_provider.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_link.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatLink {
  /// Returns a new [ChatLink] instance.
  ChatLink({

    required  this.id,

    required  this.provider,

    required  this.externalName,

    required  this.orgId,

    required  this.defaultBotId,

    required  this.linkedAt,

    required  this.lastSeenAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'provider',
    required: true,
    includeIfNull: false,
  )


  final ChatLinkProvider provider;



  @JsonKey(
    
    name: r'external_name',
    required: true,
    includeIfNull: true,
  )


  final String? externalName;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'default_bot_id',
    required: true,
    includeIfNull: true,
  )


  final String? defaultBotId;



  @JsonKey(
    
    name: r'linked_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime linkedAt;



  @JsonKey(
    
    name: r'last_seen_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastSeenAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChatLink &&
      other.id == id &&
      other.provider == provider &&
      other.externalName == externalName &&
      other.orgId == orgId &&
      other.defaultBotId == defaultBotId &&
      other.linkedAt == linkedAt &&
      other.lastSeenAt == lastSeenAt;

    @override
    int get hashCode =>
        id.hashCode +
        provider.hashCode +
        (externalName == null ? 0 : externalName.hashCode) +
        orgId.hashCode +
        (defaultBotId == null ? 0 : defaultBotId.hashCode) +
        linkedAt.hashCode +
        (lastSeenAt == null ? 0 : lastSeenAt.hashCode);

  factory ChatLink.fromJson(Map<String, dynamic> json) => _$ChatLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ChatLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

