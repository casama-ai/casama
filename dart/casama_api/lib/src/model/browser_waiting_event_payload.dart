//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'browser_waiting_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrowserWaitingEventPayload {
  /// Returns a new [BrowserWaitingEventPayload] instance.
  BrowserWaitingEventPayload({

    required  this.deviceSystem,

    required  this.host,

    required  this.expiresAt,

     this.handBack,
  });

  @JsonKey(
    
    name: r'device_system',
    required: true,
    includeIfNull: true,
  )


  final BrowserWaitingEventPayloadDeviceSystemEnum? deviceSystem;



  @JsonKey(
    
    name: r'host',
    required: true,
    includeIfNull: true,
  )


  final String? host;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'hand_back',
    required: false,
    includeIfNull: false,
  )


  final bool? handBack;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BrowserWaitingEventPayload &&
      other.deviceSystem == deviceSystem &&
      other.host == host &&
      other.expiresAt == expiresAt &&
      other.handBack == handBack;

    @override
    int get hashCode =>
        (deviceSystem == null ? 0 : deviceSystem.hashCode) +
        (host == null ? 0 : host.hashCode) +
        expiresAt.hashCode +
        handBack.hashCode;

  factory BrowserWaitingEventPayload.fromJson(Map<String, dynamic> json) => _$BrowserWaitingEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$BrowserWaitingEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum BrowserWaitingEventPayloadDeviceSystemEnum {
@JsonValue(r'ios')
ios(r'ios'),
@JsonValue(r'android')
android(r'android'),
@JsonValue(r'macos')
macos(r'macos'),
@JsonValue(r'linux')
linux(r'linux'),
@JsonValue(r'windows')
windows(r'windows');

const BrowserWaitingEventPayloadDeviceSystemEnum(this.value);

final String value;

@override
String toString() => value;
}


