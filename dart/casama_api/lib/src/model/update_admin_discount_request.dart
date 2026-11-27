//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_admin_discount_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateAdminDiscountRequest {
  /// Returns a new [UpdateAdminDiscountRequest] instance.
  UpdateAdminDiscountRequest({

     this.maxUses,

     this.perPerson,

     this.endsAt,

     this.plans,

     this.note,

     this.channel,

     this.off,

     this.confirmLarge = false,
  });

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
    
    name: r'ends_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? endsAt;



  @JsonKey(
    
    name: r'plans',
    required: false,
    includeIfNull: false,
  )


  final List<String>? plans;



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
    
    name: r'off',
    required: false,
    includeIfNull: false,
  )


  final bool? off;



  @JsonKey(
    defaultValue: false,
    name: r'confirm_large',
    required: false,
    includeIfNull: false,
  )


  final bool? confirmLarge;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateAdminDiscountRequest &&
      other.maxUses == maxUses &&
      other.perPerson == perPerson &&
      other.endsAt == endsAt &&
      other.plans == plans &&
      other.note == note &&
      other.channel == channel &&
      other.off == off &&
      other.confirmLarge == confirmLarge;

    @override
    int get hashCode =>
        (maxUses == null ? 0 : maxUses.hashCode) +
        (perPerson == null ? 0 : perPerson.hashCode) +
        (endsAt == null ? 0 : endsAt.hashCode) +
        plans.hashCode +
        (note == null ? 0 : note.hashCode) +
        (channel == null ? 0 : channel.hashCode) +
        off.hashCode +
        confirmLarge.hashCode;

  factory UpdateAdminDiscountRequest.fromJson(Map<String, dynamic> json) => _$UpdateAdminDiscountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAdminDiscountRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

