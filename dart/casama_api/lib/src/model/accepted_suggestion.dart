//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accepted_suggestion.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AcceptedSuggestion {
  /// Returns a new [AcceptedSuggestion] instance.
  AcceptedSuggestion({

     this.conversationId,

     this.runId,

     this.routineId,

     this.direct,
  });

  @JsonKey(
    
    name: r'conversation_id',
    required: false,
    includeIfNull: false,
  )


  final String? conversationId;



  @JsonKey(
    
    name: r'run_id',
    required: false,
    includeIfNull: false,
  )


  final String? runId;



  @JsonKey(
    
    name: r'routine_id',
    required: false,
    includeIfNull: false,
  )


  final String? routineId;



  @JsonKey(
    
    name: r'direct',
    required: false,
    includeIfNull: false,
  )


  final bool? direct;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AcceptedSuggestion &&
      other.conversationId == conversationId &&
      other.runId == runId &&
      other.routineId == routineId &&
      other.direct == direct;

    @override
    int get hashCode =>
        (conversationId == null ? 0 : conversationId.hashCode) +
        (runId == null ? 0 : runId.hashCode) +
        (routineId == null ? 0 : routineId.hashCode) +
        direct.hashCode;

  factory AcceptedSuggestion.fromJson(Map<String, dynamic> json) => _$AcceptedSuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptedSuggestionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

