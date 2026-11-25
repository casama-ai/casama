//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/owner_journey.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_event.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerEvent {
  /// Returns a new [OwnerEvent] instance.
  OwnerEvent({

    required  this.id,

    required  this.kind,

    required  this.label,

    required  this.userId,

    required  this.detail,

    required  this.journeyId,

    required  this.journey,

    required  this.title,

    required  this.body,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final String kind;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: true,
  )


  final String? label;



  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: true,
  )


  final String? userId;



  @JsonKey(
    
    name: r'detail',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object?> detail;



  @JsonKey(
    
    name: r'journey_id',
    required: true,
    includeIfNull: true,
  )


  final String? journeyId;



  @JsonKey(
    
    name: r'journey',
    required: true,
    includeIfNull: true,
  )


  final OwnerJourney? journey;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final String createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerEvent &&
      other.id == id &&
      other.kind == kind &&
      other.label == label &&
      other.userId == userId &&
      other.detail == detail &&
      other.journeyId == journeyId &&
      other.journey == journey &&
      other.title == title &&
      other.body == body &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        kind.hashCode +
        (label == null ? 0 : label.hashCode) +
        (userId == null ? 0 : userId.hashCode) +
        detail.hashCode +
        (journeyId == null ? 0 : journeyId.hashCode) +
        (journey == null ? 0 : journey.hashCode) +
        title.hashCode +
        body.hashCode +
        createdAt.hashCode;

  factory OwnerEvent.fromJson(Map<String, dynamic> json) => _$OwnerEventFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerEventToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

