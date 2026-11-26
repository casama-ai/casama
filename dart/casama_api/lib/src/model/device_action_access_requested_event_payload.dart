//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_action_access_requested_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceActionAccessRequestedEventPayload {
  /// Returns a new [DeviceActionAccessRequestedEventPayload] instance.
  DeviceActionAccessRequestedEventPayload({

    required  this.kind,

    required  this.reason,

    required  this.botId,
  });

  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final DeviceActionAccessRequestedEventPayloadKindEnum kind;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;



  @JsonKey(
    
    name: r'bot_id',
    required: true,
    includeIfNull: false,
  )


  final String botId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeviceActionAccessRequestedEventPayload &&
      other.kind == kind &&
      other.reason == reason &&
      other.botId == botId;

    @override
    int get hashCode =>
        kind.hashCode +
        reason.hashCode +
        botId.hashCode;

  factory DeviceActionAccessRequestedEventPayload.fromJson(Map<String, dynamic> json) => _$DeviceActionAccessRequestedEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceActionAccessRequestedEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DeviceActionAccessRequestedEventPayloadKindEnum {
@JsonValue(r'alarm')
alarm(r'alarm'),
@JsonValue(r'home')
home(r'home');

const DeviceActionAccessRequestedEventPayloadKindEnum(this.value);

final String value;

@override
String toString() => value;
}


