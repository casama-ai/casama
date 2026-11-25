//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tool_started_event_payload_place.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ToolStartedEventPayloadPlace {
  /// Returns a new [ToolStartedEventPayloadPlace] instance.
  ToolStartedEventPayloadPlace({

    required  this.computerId,

    required  this.kind,

    required  this.name,
  });

  @JsonKey(
    
    name: r'computer_id',
    required: true,
    includeIfNull: false,
  )


  final String computerId;



      /// private, team or local (a person's own computer)
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final String kind;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ToolStartedEventPayloadPlace &&
      other.computerId == computerId &&
      other.kind == kind &&
      other.name == name;

    @override
    int get hashCode =>
        computerId.hashCode +
        kind.hashCode +
        name.hashCode;

  factory ToolStartedEventPayloadPlace.fromJson(Map<String, dynamic> json) => _$ToolStartedEventPayloadPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$ToolStartedEventPayloadPlaceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

