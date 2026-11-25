//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screen_pointer_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ScreenPointerEventPayload {
  /// Returns a new [ScreenPointerEventPayload] instance.
  ScreenPointerEventPayload({

    required  this.callId,

    required  this.computerId,

    required  this.action,

    required  this.x,

    required  this.y,

    required  this.width,

    required  this.height,
  });

  @JsonKey(
    
    name: r'call_id',
    required: true,
    includeIfNull: false,
  )


  final String callId;



  @JsonKey(
    
    name: r'computer_id',
    required: true,
    includeIfNull: false,
  )


  final String computerId;



      /// click or type; later servers may add more
  @JsonKey(
    
    name: r'action',
    required: true,
    includeIfNull: false,
  )


  final String action;



      /// In the screen picture's own pixels
  @JsonKey(
    
    name: r'x',
    required: true,
    includeIfNull: false,
  )


  final num x;



  @JsonKey(
    
    name: r'y',
    required: true,
    includeIfNull: false,
  )


  final num y;



      /// The size x and y are measured against
          // minimum: 0
  @JsonKey(
    
    name: r'width',
    required: true,
    includeIfNull: false,
  )


  final num width;



          // minimum: 0
  @JsonKey(
    
    name: r'height',
    required: true,
    includeIfNull: false,
  )


  final num height;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ScreenPointerEventPayload &&
      other.callId == callId &&
      other.computerId == computerId &&
      other.action == action &&
      other.x == x &&
      other.y == y &&
      other.width == width &&
      other.height == height;

    @override
    int get hashCode =>
        callId.hashCode +
        computerId.hashCode +
        action.hashCode +
        x.hashCode +
        y.hashCode +
        width.hashCode +
        height.hashCode;

  factory ScreenPointerEventPayload.fromJson(Map<String, dynamic> json) => _$ScreenPointerEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenPointerEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

