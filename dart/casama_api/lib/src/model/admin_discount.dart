//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_discount_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_discount.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminDiscount {
  /// Returns a new [AdminDiscount] instance.
  AdminDiscount({

    required  this.id,

    required  this.code,

    required  this.percent,

    required  this.cycles,

    required  this.maxUses,

    required  this.used,

    required  this.perPerson,

    required  this.plans,

    required  this.startsAt,

    required  this.endsAt,

    required  this.who,

    required  this.keepOnPlanChange,

    required  this.state,

    required  this.note,

    required  this.channel,

    required  this.madeBy,

    required  this.madeInCasama,

    required  this.createdAt,

    required  this.link,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



      /// Percentage off (from basis points, e.g. 50 or 12.5); null for flat codes
  @JsonKey(
    
    name: r'percent',
    required: true,
    includeIfNull: true,
  )


  final num? percent;



      /// Subscription renewals covered; null means every renewal
  @JsonKey(
    
    name: r'cycles',
    required: true,
    includeIfNull: true,
  )


  final int? cycles;



  @JsonKey(
    
    name: r'max_uses',
    required: true,
    includeIfNull: true,
  )


  final int? maxUses;



  @JsonKey(
    
    name: r'used',
    required: true,
    includeIfNull: false,
  )


  final int used;



  @JsonKey(
    
    name: r'per_person',
    required: true,
    includeIfNull: true,
  )


  final int? perPerson;



      /// Plan codes; Dodo product ids unknown to this server appear as 'other'
  @JsonKey(
    
    name: r'plans',
    required: true,
    includeIfNull: false,
  )


  final List<String> plans;



  @JsonKey(
    
    name: r'starts_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? startsAt;



  @JsonKey(
    
    name: r'ends_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? endsAt;



      /// any, first_time, existing or specific
  @JsonKey(
    
    name: r'who',
    required: true,
    includeIfNull: false,
  )


  final String who;



  @JsonKey(
    
    name: r'keep_on_plan_change',
    required: true,
    includeIfNull: false,
  )


  final bool keepOnPlanChange;



  @JsonKey(
    
    name: r'state',
    required: true,
    includeIfNull: false,
  )


  final AdminDiscountState state;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



  @JsonKey(
    
    name: r'channel',
    required: true,
    includeIfNull: true,
  )


  final String? channel;



      /// Masked email of the owner who made the code, or null if made in Dodo
  @JsonKey(
    
    name: r'made_by',
    required: true,
    includeIfNull: true,
  )


  final String? madeBy;



  @JsonKey(
    
    name: r'made_in_casama',
    required: true,
    includeIfNull: false,
  )


  final bool madeInCasama;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? createdAt;



      /// Share link when pricing page reads ?code=; null in v1
  @JsonKey(
    
    name: r'link',
    required: true,
    includeIfNull: true,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminDiscount &&
      other.id == id &&
      other.code == code &&
      other.percent == percent &&
      other.cycles == cycles &&
      other.maxUses == maxUses &&
      other.used == used &&
      other.perPerson == perPerson &&
      other.plans == plans &&
      other.startsAt == startsAt &&
      other.endsAt == endsAt &&
      other.who == who &&
      other.keepOnPlanChange == keepOnPlanChange &&
      other.state == state &&
      other.note == note &&
      other.channel == channel &&
      other.madeBy == madeBy &&
      other.madeInCasama == madeInCasama &&
      other.createdAt == createdAt &&
      other.link == link;

    @override
    int get hashCode =>
        id.hashCode +
        code.hashCode +
        (percent == null ? 0 : percent.hashCode) +
        (cycles == null ? 0 : cycles.hashCode) +
        (maxUses == null ? 0 : maxUses.hashCode) +
        used.hashCode +
        (perPerson == null ? 0 : perPerson.hashCode) +
        plans.hashCode +
        (startsAt == null ? 0 : startsAt.hashCode) +
        (endsAt == null ? 0 : endsAt.hashCode) +
        who.hashCode +
        keepOnPlanChange.hashCode +
        state.hashCode +
        (note == null ? 0 : note.hashCode) +
        (channel == null ? 0 : channel.hashCode) +
        (madeBy == null ? 0 : madeBy.hashCode) +
        madeInCasama.hashCode +
        (createdAt == null ? 0 : createdAt.hashCode) +
        (link == null ? 0 : link.hashCode);

  factory AdminDiscount.fromJson(Map<String, dynamic> json) => _$AdminDiscountFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDiscountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

