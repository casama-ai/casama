//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/place_mode.dart';
import 'package:casama_api/src/model/bot_place.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bot_places.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BotPlaces {
  /// Returns a new [BotPlaces] instance.
  BotPlaces({

    required  this.botId,

    required  this.places,

    required  this.mode,

    required  this.deviceId,
  });

  @JsonKey(
    
    name: r'bot_id',
    required: true,
    includeIfNull: false,
  )


  final String botId;



  @JsonKey(
    
    name: r'places',
    required: true,
    includeIfNull: false,
  )


  final List<BotPlace> places;



  @JsonKey(
    
    name: r'mode',
    required: true,
    includeIfNull: false,
  )


  final PlaceMode mode;



  @JsonKey(
    
    name: r'device_id',
    required: true,
    includeIfNull: true,
  )


  final String? deviceId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BotPlaces &&
      other.botId == botId &&
      other.places == places &&
      other.mode == mode &&
      other.deviceId == deviceId;

    @override
    int get hashCode =>
        botId.hashCode +
        places.hashCode +
        mode.hashCode +
        (deviceId == null ? 0 : deviceId.hashCode);

  factory BotPlaces.fromJson(Map<String, dynamic> json) => _$BotPlacesFromJson(json);

  Map<String, dynamic> toJson() => _$BotPlacesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

