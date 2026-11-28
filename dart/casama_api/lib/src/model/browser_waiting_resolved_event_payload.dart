//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'browser_waiting_resolved_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrowserWaitingResolvedEventPayload {
  /// Returns a new [BrowserWaitingResolvedEventPayload] instance.
  BrowserWaitingResolvedEventPayload({

    required  this.outcome,

     this.visibleAtEnd,
  });

  @JsonKey(
    
    name: r'outcome',
    required: true,
    includeIfNull: false,
  )


  final BrowserWaitingResolvedEventPayloadOutcomeEnum outcome;



  @JsonKey(
    
    name: r'visible_at_end',
    required: false,
    includeIfNull: false,
  )


  final bool? visibleAtEnd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BrowserWaitingResolvedEventPayload &&
      other.outcome == outcome &&
      other.visibleAtEnd == visibleAtEnd;

    @override
    int get hashCode =>
        outcome.hashCode +
        visibleAtEnd.hashCode;

  factory BrowserWaitingResolvedEventPayload.fromJson(Map<String, dynamic> json) => _$BrowserWaitingResolvedEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$BrowserWaitingResolvedEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum BrowserWaitingResolvedEventPayloadOutcomeEnum {
@JsonValue(r'back')
back(r'back'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'cancelled')
cancelled(r'cancelled');

const BrowserWaitingResolvedEventPayloadOutcomeEnum(this.value);

final String value;

@override
String toString() => value;
}


