//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'browser_choice_requested_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrowserChoiceRequestedEventPayload {
  /// Returns a new [BrowserChoiceRequestedEventPayload] instance.
  BrowserChoiceRequestedEventPayload({

    required  this.choiceId,

    required  this.host,

    required  this.reason,

    required  this.deviceSystem,

    required  this.hasChrome,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'choice_id',
    required: true,
    includeIfNull: false,
  )


  final String choiceId;



  @JsonKey(
    
    name: r'host',
    required: true,
    includeIfNull: false,
  )


  final String host;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final BrowserChoiceRequestedEventPayloadReasonEnum reason;



  @JsonKey(
    
    name: r'device_system',
    required: true,
    includeIfNull: true,
  )


  final BrowserChoiceRequestedEventPayloadDeviceSystemEnum? deviceSystem;



  @JsonKey(
    
    name: r'has_chrome',
    required: true,
    includeIfNull: false,
  )


  final bool hasChrome;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BrowserChoiceRequestedEventPayload &&
      other.choiceId == choiceId &&
      other.host == host &&
      other.reason == reason &&
      other.deviceSystem == deviceSystem &&
      other.hasChrome == hasChrome &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        choiceId.hashCode +
        host.hashCode +
        reason.hashCode +
        (deviceSystem == null ? 0 : deviceSystem.hashCode) +
        hasChrome.hashCode +
        expiresAt.hashCode;

  factory BrowserChoiceRequestedEventPayload.fromJson(Map<String, dynamic> json) => _$BrowserChoiceRequestedEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$BrowserChoiceRequestedEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum BrowserChoiceRequestedEventPayloadReasonEnum {
@JsonValue(r'sign_in')
signIn(r'sign_in'),
@JsonValue(r'blocked')
blocked(r'blocked');

const BrowserChoiceRequestedEventPayloadReasonEnum(this.value);

final String value;

@override
String toString() => value;
}



enum BrowserChoiceRequestedEventPayloadDeviceSystemEnum {
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

const BrowserChoiceRequestedEventPayloadDeviceSystemEnum(this.value);

final String value;

@override
String toString() => value;
}


