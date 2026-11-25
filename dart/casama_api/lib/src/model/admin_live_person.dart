//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_live_person.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminLivePerson {
  /// Returns a new [AdminLivePerson] instance.
  AdminLivePerson({

    required  this.userId,

    required  this.displayName,

    required  this.email,

    required  this.platform,

    required  this.inChat,

    required  this.devices,

    required  this.lastSeenAt,

    required  this.onlineSince,

     this.team,
  });

  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: true,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final String platform;



  @JsonKey(
    
    name: r'in_chat',
    required: true,
    includeIfNull: false,
  )


  final bool inChat;



  @JsonKey(
    
    name: r'devices',
    required: true,
    includeIfNull: false,
  )


  final int devices;



  @JsonKey(
    
    name: r'last_seen_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime lastSeenAt;



  @JsonKey(
    
    name: r'online_since',
    required: true,
    includeIfNull: true,
  )


  final DateTime? onlineSince;



  @JsonKey(
    
    name: r'team',
    required: false,
    includeIfNull: false,
  )


  final bool? team;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminLivePerson &&
      other.userId == userId &&
      other.displayName == displayName &&
      other.email == email &&
      other.platform == platform &&
      other.inChat == inChat &&
      other.devices == devices &&
      other.lastSeenAt == lastSeenAt &&
      other.onlineSince == onlineSince &&
      other.team == team;

    @override
    int get hashCode =>
        userId.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        (email == null ? 0 : email.hashCode) +
        platform.hashCode +
        inChat.hashCode +
        devices.hashCode +
        lastSeenAt.hashCode +
        (onlineSince == null ? 0 : onlineSince.hashCode) +
        team.hashCode;

  factory AdminLivePerson.fromJson(Map<String, dynamic> json) => _$AdminLivePersonFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLivePersonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

