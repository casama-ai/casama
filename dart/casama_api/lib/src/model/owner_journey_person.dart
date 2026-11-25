//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_journey_person.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerJourneyPerson {
  /// Returns a new [OwnerJourneyPerson] instance.
  OwnerJourneyPerson({

    required  this.email,

    required  this.name,

    required  this.createdAt,

    required  this.plan,

    required  this.planStatus,

    required  this.messages,

    required  this.bots,

    required  this.devices,

    required  this.lastActiveAt,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: true,
  )


  final String? name;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: true,
  )


  final String? createdAt;



  @JsonKey(
    
    name: r'plan',
    required: true,
    includeIfNull: true,
  )


  final String? plan;



  @JsonKey(
    
    name: r'plan_status',
    required: true,
    includeIfNull: true,
  )


  final String? planStatus;



  @JsonKey(
    
    name: r'messages',
    required: true,
    includeIfNull: false,
  )


  final int messages;



  @JsonKey(
    
    name: r'bots',
    required: true,
    includeIfNull: false,
  )


  final int bots;



  @JsonKey(
    
    name: r'devices',
    required: true,
    includeIfNull: false,
  )


  final List<String> devices;



  @JsonKey(
    
    name: r'last_active_at',
    required: true,
    includeIfNull: true,
  )


  final String? lastActiveAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerJourneyPerson &&
      other.email == email &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.plan == plan &&
      other.planStatus == planStatus &&
      other.messages == messages &&
      other.bots == bots &&
      other.devices == devices &&
      other.lastActiveAt == lastActiveAt;

    @override
    int get hashCode =>
        (email == null ? 0 : email.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (createdAt == null ? 0 : createdAt.hashCode) +
        (plan == null ? 0 : plan.hashCode) +
        (planStatus == null ? 0 : planStatus.hashCode) +
        messages.hashCode +
        bots.hashCode +
        devices.hashCode +
        (lastActiveAt == null ? 0 : lastActiveAt.hashCode);

  factory OwnerJourneyPerson.fromJson(Map<String, dynamic> json) => _$OwnerJourneyPersonFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerJourneyPersonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

