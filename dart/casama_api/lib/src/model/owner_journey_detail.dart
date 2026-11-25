//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/owner_journey_person.dart';
import 'package:casama_api/src/model/owner_event.dart';
import 'package:casama_api/src/model/owner_journey.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_journey_detail.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerJourneyDetail {
  /// Returns a new [OwnerJourneyDetail] instance.
  OwnerJourneyDetail({

    required  this.journey,

    required  this.events,

    required  this.person,
  });

  @JsonKey(
    
    name: r'journey',
    required: true,
    includeIfNull: true,
  )


  final OwnerJourney? journey;



  @JsonKey(
    
    name: r'events',
    required: true,
    includeIfNull: false,
  )


  final List<OwnerEvent> events;



  @JsonKey(
    
    name: r'person',
    required: true,
    includeIfNull: true,
  )


  final OwnerJourneyPerson? person;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerJourneyDetail &&
      other.journey == journey &&
      other.events == events &&
      other.person == person;

    @override
    int get hashCode =>
        (journey == null ? 0 : journey.hashCode) +
        events.hashCode +
        (person == null ? 0 : person.hashCode);

  factory OwnerJourneyDetail.fromJson(Map<String, dynamic> json) => _$OwnerJourneyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerJourneyDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

