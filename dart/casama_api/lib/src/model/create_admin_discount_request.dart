//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_admin_discount_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateAdminDiscountRequest {
  /// Returns a new [CreateAdminDiscountRequest] instance.
  CreateAdminDiscountRequest({

    required  this.code,

    required  this.percent,

    required  this.plans,

     this.cycles,

     this.maxUses,

     this.perPerson,

     this.startsAt,

     this.endsAt,

     this.who,

     this.note,

     this.channel,

     this.confirmLarge = false,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



          // minimum: 1
          // maximum: 100
  @JsonKey(
    
    name: r'percent',
    required: true,
    includeIfNull: false,
  )


  final num percent;



  @JsonKey(
    
    name: r'plans',
    required: true,
    includeIfNull: false,
  )


  final List<String> plans;



          // minimum: 1
          // maximum: 36
  @JsonKey(
    
    name: r'cycles',
    required: false,
    includeIfNull: false,
  )


  final int? cycles;



          // minimum: 1
          // maximum: 100000
  @JsonKey(
    
    name: r'max_uses',
    required: false,
    includeIfNull: false,
  )


  final int? maxUses;



          // minimum: 1
          // maximum: 100
  @JsonKey(
    
    name: r'per_person',
    required: false,
    includeIfNull: false,
  )


  final int? perPerson;



  @JsonKey(
    
    name: r'starts_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? startsAt;



  @JsonKey(
    
    name: r'ends_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? endsAt;



  @JsonKey(
    
    name: r'who',
    required: false,
    includeIfNull: false,
  )


  final CreateAdminDiscountRequestWhoEnum? who;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



  @JsonKey(
    
    name: r'channel',
    required: false,
    includeIfNull: false,
  )


  final String? channel;



  @JsonKey(
    defaultValue: false,
    name: r'confirm_large',
    required: false,
    includeIfNull: false,
  )


  final bool? confirmLarge;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateAdminDiscountRequest &&
      other.code == code &&
      other.percent == percent &&
      other.plans == plans &&
      other.cycles == cycles &&
      other.maxUses == maxUses &&
      other.perPerson == perPerson &&
      other.startsAt == startsAt &&
      other.endsAt == endsAt &&
      other.who == who &&
      other.note == note &&
      other.channel == channel &&
      other.confirmLarge == confirmLarge;

    @override
    int get hashCode =>
        code.hashCode +
        percent.hashCode +
        plans.hashCode +
        (cycles == null ? 0 : cycles.hashCode) +
        (maxUses == null ? 0 : maxUses.hashCode) +
        (perPerson == null ? 0 : perPerson.hashCode) +
        (startsAt == null ? 0 : startsAt.hashCode) +
        (endsAt == null ? 0 : endsAt.hashCode) +
        who.hashCode +
        (note == null ? 0 : note.hashCode) +
        (channel == null ? 0 : channel.hashCode) +
        confirmLarge.hashCode;

  factory CreateAdminDiscountRequest.fromJson(Map<String, dynamic> json) => _$CreateAdminDiscountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdminDiscountRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum CreateAdminDiscountRequestWhoEnum {
@JsonValue(r'any')
any(r'any'),
@JsonValue(r'first_time')
firstTime(r'first_time');

const CreateAdminDiscountRequestWhoEnum(this.value);

final String value;

@override
String toString() => value;
}


