//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_browser_choice_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnswerBrowserChoiceRequest {
  /// Returns a new [AnswerBrowserChoiceRequest] instance.
  AnswerBrowserChoiceRequest({

    required  this.choice,

     this.remember,
  });

  @JsonKey(
    
    name: r'choice',
    required: true,
    includeIfNull: false,
  )


  final AnswerBrowserChoiceRequestChoiceEnum choice;



  @JsonKey(
    
    name: r'remember',
    required: false,
    includeIfNull: false,
  )


  final bool? remember;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnswerBrowserChoiceRequest &&
      other.choice == choice &&
      other.remember == remember;

    @override
    int get hashCode =>
        choice.hashCode +
        remember.hashCode;

  factory AnswerBrowserChoiceRequest.fromJson(Map<String, dynamic> json) => _$AnswerBrowserChoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerBrowserChoiceRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AnswerBrowserChoiceRequestChoiceEnum {
@JsonValue(r'app')
app(r'app'),
@JsonValue(r'mine')
mine(r'mine'),
@JsonValue(r'computer')
computer(r'computer');

const AnswerBrowserChoiceRequestChoiceEnum(this.value);

final String value;

@override
String toString() => value;
}


