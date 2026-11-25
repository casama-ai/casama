//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_partner_commission.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminPartnerCommission {
  /// Returns a new [AdminPartnerCommission] instance.
  AdminPartnerCommission({

    required  this.id,

    required  this.partnerId,

    required  this.partnerName,

    required  this.kind,

    required  this.source_,

    required  this.baseUsd,

    required  this.rate,

    required  this.amountUsd,

    required  this.status,

    required  this.holdUntil,

    required  this.note,

    required  this.syncState,

    required  this.syncError,

    required  this.paidAt,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'partner_id',
    required: true,
    includeIfNull: false,
  )


  final String partnerId;



  @JsonKey(
    
    name: r'partner_name',
    required: true,
    includeIfNull: false,
  )


  final String partnerName;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final AdminPartnerCommissionKindEnum kind;



  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: true,
  )


  final String? source_;



  @JsonKey(
    
    name: r'base_usd',
    required: true,
    includeIfNull: false,
  )


  final num baseUsd;



  @JsonKey(
    
    name: r'rate',
    required: true,
    includeIfNull: false,
  )


  final num rate;



  @JsonKey(
    
    name: r'amount_usd',
    required: true,
    includeIfNull: false,
  )


  final num amountUsd;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final AdminPartnerCommissionStatusEnum status;



  @JsonKey(
    
    name: r'hold_until',
    required: true,
    includeIfNull: false,
  )


  final DateTime holdUntil;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



  @JsonKey(
    
    name: r'sync_state',
    required: true,
    includeIfNull: false,
  )


  final String syncState;



  @JsonKey(
    
    name: r'sync_error',
    required: true,
    includeIfNull: true,
  )


  final String? syncError;



  @JsonKey(
    
    name: r'paid_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? paidAt;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminPartnerCommission &&
      other.id == id &&
      other.partnerId == partnerId &&
      other.partnerName == partnerName &&
      other.kind == kind &&
      other.source_ == source_ &&
      other.baseUsd == baseUsd &&
      other.rate == rate &&
      other.amountUsd == amountUsd &&
      other.status == status &&
      other.holdUntil == holdUntil &&
      other.note == note &&
      other.syncState == syncState &&
      other.syncError == syncError &&
      other.paidAt == paidAt &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        partnerId.hashCode +
        partnerName.hashCode +
        kind.hashCode +
        (source_ == null ? 0 : source_.hashCode) +
        baseUsd.hashCode +
        rate.hashCode +
        amountUsd.hashCode +
        status.hashCode +
        holdUntil.hashCode +
        (note == null ? 0 : note.hashCode) +
        syncState.hashCode +
        (syncError == null ? 0 : syncError.hashCode) +
        (paidAt == null ? 0 : paidAt.hashCode) +
        createdAt.hashCode;

  factory AdminPartnerCommission.fromJson(Map<String, dynamic> json) => _$AdminPartnerCommissionFromJson(json);

  Map<String, dynamic> toJson() => _$AdminPartnerCommissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminPartnerCommissionKindEnum {
@JsonValue(r'sale')
sale(r'sale'),
@JsonValue(r'reversal')
reversal(r'reversal'),
@JsonValue(r'manual')
manual(r'manual');

const AdminPartnerCommissionKindEnum(this.value);

final String value;

@override
String toString() => value;
}



enum AdminPartnerCommissionStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'payable')
payable(r'payable'),
@JsonValue(r'paid')
paid(r'paid'),
@JsonValue(r'held_for_review')
heldForReview(r'held_for_review'),
@JsonValue(r'void')
void_(r'void');

const AdminPartnerCommissionStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


