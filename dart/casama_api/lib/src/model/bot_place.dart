//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/place_where.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bot_place.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BotPlace {
  /// Returns a new [BotPlace] instance.
  BotPlace({

    required  this.where,

    required  this.computerId,

    required  this.deviceId,

    required  this.name,

    required  this.kind,

    required  this.platform,

    required  this.online,

    required  this.capabilities,

    required  this.selected,
  });

  @JsonKey(
    
    name: r'where',
    required: true,
    includeIfNull: false,
  )


  final PlaceWhere where;



  @JsonKey(
    
    name: r'computer_id',
    required: true,
    includeIfNull: false,
  )


  final String computerId;



  @JsonKey(
    
    name: r'device_id',
    required: true,
    includeIfNull: true,
  )


  final String? deviceId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final BotPlaceKindEnum kind;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: true,
  )


  final String? platform;



  @JsonKey(
    
    name: r'online',
    required: true,
    includeIfNull: false,
  )


  final bool online;



  @JsonKey(
    
    name: r'capabilities',
    required: true,
    includeIfNull: false,
  )


  final Map<String, bool> capabilities;



  @JsonKey(
    
    name: r'selected',
    required: true,
    includeIfNull: false,
  )


  final bool selected;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BotPlace &&
      other.where == where &&
      other.computerId == computerId &&
      other.deviceId == deviceId &&
      other.name == name &&
      other.kind == kind &&
      other.platform == platform &&
      other.online == online &&
      other.capabilities == capabilities &&
      other.selected == selected;

    @override
    int get hashCode =>
        where.hashCode +
        computerId.hashCode +
        (deviceId == null ? 0 : deviceId.hashCode) +
        name.hashCode +
        kind.hashCode +
        (platform == null ? 0 : platform.hashCode) +
        online.hashCode +
        capabilities.hashCode +
        selected.hashCode;

  factory BotPlace.fromJson(Map<String, dynamic> json) => _$BotPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$BotPlaceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum BotPlaceKindEnum {
@JsonValue(r'private')
private(r'private'),
@JsonValue(r'team')
team(r'team'),
@JsonValue(r'local')
local(r'local');

const BotPlaceKindEnum(this.value);

final String value;

@override
String toString() => value;
}


