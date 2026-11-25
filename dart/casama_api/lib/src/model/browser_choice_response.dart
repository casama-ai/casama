//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'browser_choice_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrowserChoiceResponse {
  /// Returns a new [BrowserChoiceResponse] instance.
  BrowserChoiceResponse({

    required  this.id,

    required  this.runId,

    required  this.host,

    required  this.status,

    required  this.choice,

    required  this.remember,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'run_id',
    required: true,
    includeIfNull: false,
  )


  final String runId;



  @JsonKey(
    
    name: r'host',
    required: true,
    includeIfNull: false,
  )


  final String host;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final BrowserChoiceResponseStatusEnum status;



  @JsonKey(
    
    name: r'choice',
    required: true,
    includeIfNull: true,
  )


  final BrowserChoiceResponseChoiceEnum? choice;



  @JsonKey(
    
    name: r'remember',
    required: true,
    includeIfNull: false,
  )


  final bool remember;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BrowserChoiceResponse &&
      other.id == id &&
      other.runId == runId &&
      other.host == host &&
      other.status == status &&
      other.choice == choice &&
      other.remember == remember;

    @override
    int get hashCode =>
        id.hashCode +
        runId.hashCode +
        host.hashCode +
        status.hashCode +
        (choice == null ? 0 : choice.hashCode) +
        remember.hashCode;

  factory BrowserChoiceResponse.fromJson(Map<String, dynamic> json) => _$BrowserChoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrowserChoiceResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum BrowserChoiceResponseStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'answered')
answered(r'answered'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'cancelled')
cancelled(r'cancelled');

const BrowserChoiceResponseStatusEnum(this.value);

final String value;

@override
String toString() => value;
}



enum BrowserChoiceResponseChoiceEnum {
@JsonValue(r'app')
app(r'app'),
@JsonValue(r'mine')
mine(r'mine'),
@JsonValue(r'computer')
computer(r'computer');

const BrowserChoiceResponseChoiceEnum(this.value);

final String value;

@override
String toString() => value;
}


