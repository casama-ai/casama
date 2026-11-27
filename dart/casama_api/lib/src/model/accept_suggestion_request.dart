//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accept_suggestion_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AcceptSuggestionRequest {
  /// Returns a new [AcceptSuggestionRequest] instance.
  AcceptSuggestionRequest({

     this.said,

     this.choice,

     this.remindAt,
  });

  @JsonKey(
    
    name: r'said',
    required: false,
    includeIfNull: false,
  )


  final String? said;



  @JsonKey(
    
    name: r'choice',
    required: false,
    includeIfNull: false,
  )


  final String? choice;



  @JsonKey(
    
    name: r'remind_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? remindAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AcceptSuggestionRequest &&
      other.said == said &&
      other.choice == choice &&
      other.remindAt == remindAt;

    @override
    int get hashCode =>
        said.hashCode +
        choice.hashCode +
        remindAt.hashCode;

  factory AcceptSuggestionRequest.fromJson(Map<String, dynamic> json) => _$AcceptSuggestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptSuggestionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

