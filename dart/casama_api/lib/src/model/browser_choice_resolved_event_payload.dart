//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'browser_choice_resolved_event_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrowserChoiceResolvedEventPayload {
  /// Returns a new [BrowserChoiceResolvedEventPayload] instance.
  BrowserChoiceResolvedEventPayload({

    required  this.choiceId,

    required  this.outcome,

    required  this.choice,

     this.remember,
  });

  @JsonKey(
    
    name: r'choice_id',
    required: true,
    includeIfNull: false,
  )


  final String choiceId;



  @JsonKey(
    
    name: r'outcome',
    required: true,
    includeIfNull: false,
  )


  final BrowserChoiceResolvedEventPayloadOutcomeEnum outcome;



  @JsonKey(
    
    name: r'choice',
    required: true,
    includeIfNull: true,
  )


  final BrowserChoiceResolvedEventPayloadChoiceEnum? choice;



  @JsonKey(
    
    name: r'remember',
    required: false,
    includeIfNull: false,
  )


  final bool? remember;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BrowserChoiceResolvedEventPayload &&
      other.choiceId == choiceId &&
      other.outcome == outcome &&
      other.choice == choice &&
      other.remember == remember;

    @override
    int get hashCode =>
        choiceId.hashCode +
        outcome.hashCode +
        (choice == null ? 0 : choice.hashCode) +
        remember.hashCode;

  factory BrowserChoiceResolvedEventPayload.fromJson(Map<String, dynamic> json) => _$BrowserChoiceResolvedEventPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$BrowserChoiceResolvedEventPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum BrowserChoiceResolvedEventPayloadOutcomeEnum {
@JsonValue(r'answered')
answered(r'answered'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'cancelled')
cancelled(r'cancelled');

const BrowserChoiceResolvedEventPayloadOutcomeEnum(this.value);

final String value;

@override
String toString() => value;
}



enum BrowserChoiceResolvedEventPayloadChoiceEnum {
@JsonValue(r'app')
app(r'app'),
@JsonValue(r'mine')
mine(r'mine'),
@JsonValue(r'computer')
computer(r'computer');

const BrowserChoiceResolvedEventPayloadChoiceEnum(this.value);

final String value;

@override
String toString() => value;
}


