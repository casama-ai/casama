//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_live_person.dart';
import 'package:casama_api/src/model/admin_live_platform.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_live_online.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminLiveOnline {
  /// Returns a new [AdminLiveOnline] instance.
  AdminLiveOnline({

    required  this.windowSeconds,

    required  this.onlineNow,

    required  this.inChat,

    required  this.teamOnline,

    required  this.byPlatform,

    required  this.people,

    required  this.fetchedAt,
  });

  @JsonKey(
    
    name: r'window_seconds',
    required: true,
    includeIfNull: false,
  )


  final int windowSeconds;



  @JsonKey(
    
    name: r'online_now',
    required: true,
    includeIfNull: false,
  )


  final int onlineNow;



  @JsonKey(
    
    name: r'in_chat',
    required: true,
    includeIfNull: false,
  )


  final int inChat;



  @JsonKey(
    
    name: r'team_online',
    required: true,
    includeIfNull: false,
  )


  final int teamOnline;



  @JsonKey(
    
    name: r'by_platform',
    required: true,
    includeIfNull: false,
  )


  final List<AdminLivePlatform> byPlatform;



  @JsonKey(
    
    name: r'people',
    required: true,
    includeIfNull: false,
  )


  final List<AdminLivePerson> people;



  @JsonKey(
    
    name: r'fetched_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime fetchedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminLiveOnline &&
      other.windowSeconds == windowSeconds &&
      other.onlineNow == onlineNow &&
      other.inChat == inChat &&
      other.teamOnline == teamOnline &&
      other.byPlatform == byPlatform &&
      other.people == people &&
      other.fetchedAt == fetchedAt;

    @override
    int get hashCode =>
        windowSeconds.hashCode +
        onlineNow.hashCode +
        inChat.hashCode +
        teamOnline.hashCode +
        byPlatform.hashCode +
        people.hashCode +
        fetchedAt.hashCode;

  factory AdminLiveOnline.fromJson(Map<String, dynamic> json) => _$AdminLiveOnlineFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLiveOnlineToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

