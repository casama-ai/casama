//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/place_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_place_preference_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetPlacePreferenceRequest {
  /// Returns a new [SetPlacePreferenceRequest] instance.
  SetPlacePreferenceRequest({

     this.mode,

     this.deviceId,
  });

  @JsonKey(
    
    name: r'mode',
    required: false,
    includeIfNull: false,
  )


  final PlaceMode? mode;



      /// Which of your computers the bot uses when several let it in; null goes back to the one last seen
  @JsonKey(
    
    name: r'device_id',
    required: false,
    includeIfNull: false,
  )


  final String? deviceId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetPlacePreferenceRequest &&
      other.mode == mode &&
      other.deviceId == deviceId;

    @override
    int get hashCode =>
        mode.hashCode +
        (deviceId == null ? 0 : deviceId.hashCode);

  factory SetPlacePreferenceRequest.fromJson(Map<String, dynamic> json) => _$SetPlacePreferenceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetPlacePreferenceRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

