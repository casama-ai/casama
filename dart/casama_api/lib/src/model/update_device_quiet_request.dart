//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_device_quiet_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateDeviceQuietRequest {
  /// Returns a new [UpdateDeviceQuietRequest] instance.
  UpdateDeviceQuietRequest({

    required  this.quietUntil,
  });

      /// Hold proactive check-in pushes to this device until this time; null clears the hold
  @JsonKey(
    
    name: r'quiet_until',
    required: true,
    includeIfNull: true,
  )


  final DateTime? quietUntil;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateDeviceQuietRequest &&
      other.quietUntil == quietUntil;

    @override
    int get hashCode =>
        (quietUntil == null ? 0 : quietUntil.hashCode);

  factory UpdateDeviceQuietRequest.fromJson(Map<String, dynamic> json) => _$UpdateDeviceQuietRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDeviceQuietRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

