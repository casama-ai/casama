//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'takeover_requested_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TakeoverRequestedEventPayload {
  /// Returns a new [TakeoverRequestedEventPayload] instance.
  TakeoverRequestedEventPayload({

    required  this.computerId,

    required  this.reason,

     this.takeoverId,

     this.loginHost,
  });

  @JsonKey(
    
    name: r'computer_id',
    required: true,
    includeIfNull: false,
  )


  final String computerId;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;



  @JsonKey(
    
    name: r'takeover_id',
    required: false,
    includeIfNull: false,
  )


  final String? takeoverId;



  @JsonKey(
    
    name: r'login_host',
    required: false,
    includeIfNull: false,
  )


  final String? loginHost;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TakeoverRequestedEventPayload &&
      other.computerId == computerId &&
      other.reason == reason &&
      other.takeoverId == takeoverId &&
      other.loginHost == loginHost;

    @override
    int get hashCode =>
        computerId.hashCode +
        reason.hashCode +
        takeoverId.hashCode +
        (loginHost == null ? 0 : loginHost.hashCode);

  factory TakeoverRequestedEventPayload.fromJson(Map<String, dynamic> json) => _$TakeoverRequestedEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$TakeoverRequestedEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

