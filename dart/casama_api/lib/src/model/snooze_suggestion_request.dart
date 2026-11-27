//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snooze_suggestion_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SnoozeSuggestionRequest {
  /// Returns a new [SnoozeSuggestionRequest] instance.
  SnoozeSuggestionRequest({

     this.until,
  });

  @JsonKey(
    
    name: r'until',
    required: false,
    includeIfNull: false,
  )


  final DateTime? until;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SnoozeSuggestionRequest &&
      other.until == until;

    @override
    int get hashCode =>
        until.hashCode;

  factory SnoozeSuggestionRequest.fromJson(Map<String, dynamic> json) => _$SnoozeSuggestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SnoozeSuggestionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

