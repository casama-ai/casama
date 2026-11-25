//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'takeover_resolved_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TakeoverResolvedEventPayload {
  /// Returns a new [TakeoverResolvedEventPayload] instance.
  TakeoverResolvedEventPayload({

    required  this.computerId,

    required  this.outcome,

    required  this.note,

     this.loginHost,
  });

  @JsonKey(
    
    name: r'computer_id',
    required: true,
    includeIfNull: false,
  )


  final String computerId;



  @JsonKey(
    
    name: r'outcome',
    required: true,
    includeIfNull: false,
  )


  final TakeoverResolvedEventPayloadOutcomeEnum outcome;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



  @JsonKey(
    
    name: r'login_host',
    required: false,
    includeIfNull: false,
  )


  final String? loginHost;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TakeoverResolvedEventPayload &&
      other.computerId == computerId &&
      other.outcome == outcome &&
      other.note == note &&
      other.loginHost == loginHost;

    @override
    int get hashCode =>
        computerId.hashCode +
        outcome.hashCode +
        (note == null ? 0 : note.hashCode) +
        (loginHost == null ? 0 : loginHost.hashCode);

  factory TakeoverResolvedEventPayload.fromJson(Map<String, dynamic> json) => _$TakeoverResolvedEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$TakeoverResolvedEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum TakeoverResolvedEventPayloadOutcomeEnum {
@JsonValue(r'completed')
completed(r'completed'),
@JsonValue(r'dismissed')
dismissed(r'dismissed'),
@JsonValue(r'expired')
expired(r'expired');

const TakeoverResolvedEventPayloadOutcomeEnum(this.value);

final String value;

@override
String toString() => value;
}


