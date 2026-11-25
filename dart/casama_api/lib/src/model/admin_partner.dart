//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_partner_code.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_partner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminPartner {
  /// Returns a new [AdminPartner] instance.
  AdminPartner({

    required  this.id,

    required  this.displayName,

    required  this.email,

    required  this.pictureUrl,

    required  this.channelUrl,

    required  this.country,

    required  this.status,

    required  this.rate,

    required  this.toltPartnerId,

    required  this.userId,

    required  this.notes,

    required  this.codes,

    required  this.referred,

    required  this.paying,

    required  this.pendingUsd,

    required  this.payableUsd,

    required  this.paidUsd,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'picture_url',
    required: true,
    includeIfNull: true,
  )


  final String? pictureUrl;



  @JsonKey(
    
    name: r'channel_url',
    required: true,
    includeIfNull: true,
  )


  final String? channelUrl;



  @JsonKey(
    
    name: r'country',
    required: true,
    includeIfNull: true,
  )


  final String? country;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final AdminPartnerStatusEnum status;



  @JsonKey(
    
    name: r'rate',
    required: true,
    includeIfNull: true,
  )


  final num? rate;



  @JsonKey(
    
    name: r'tolt_partner_id',
    required: true,
    includeIfNull: true,
  )


  final String? toltPartnerId;



  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: true,
  )


  final String? userId;



  @JsonKey(
    
    name: r'notes',
    required: true,
    includeIfNull: true,
  )


  final String? notes;



  @JsonKey(
    
    name: r'codes',
    required: true,
    includeIfNull: false,
  )


  final List<AdminPartnerCode> codes;



  @JsonKey(
    
    name: r'referred',
    required: true,
    includeIfNull: false,
  )


  final int referred;



  @JsonKey(
    
    name: r'paying',
    required: true,
    includeIfNull: false,
  )


  final int paying;



  @JsonKey(
    
    name: r'pending_usd',
    required: true,
    includeIfNull: false,
  )


  final num pendingUsd;



  @JsonKey(
    
    name: r'payable_usd',
    required: true,
    includeIfNull: false,
  )


  final num payableUsd;



  @JsonKey(
    
    name: r'paid_usd',
    required: true,
    includeIfNull: false,
  )


  final num paidUsd;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminPartner &&
      other.id == id &&
      other.displayName == displayName &&
      other.email == email &&
      other.pictureUrl == pictureUrl &&
      other.channelUrl == channelUrl &&
      other.country == country &&
      other.status == status &&
      other.rate == rate &&
      other.toltPartnerId == toltPartnerId &&
      other.userId == userId &&
      other.notes == notes &&
      other.codes == codes &&
      other.referred == referred &&
      other.paying == paying &&
      other.pendingUsd == pendingUsd &&
      other.payableUsd == payableUsd &&
      other.paidUsd == paidUsd &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        displayName.hashCode +
        (email == null ? 0 : email.hashCode) +
        (pictureUrl == null ? 0 : pictureUrl.hashCode) +
        (channelUrl == null ? 0 : channelUrl.hashCode) +
        (country == null ? 0 : country.hashCode) +
        status.hashCode +
        (rate == null ? 0 : rate.hashCode) +
        (toltPartnerId == null ? 0 : toltPartnerId.hashCode) +
        (userId == null ? 0 : userId.hashCode) +
        (notes == null ? 0 : notes.hashCode) +
        codes.hashCode +
        referred.hashCode +
        paying.hashCode +
        pendingUsd.hashCode +
        payableUsd.hashCode +
        paidUsd.hashCode +
        createdAt.hashCode;

  factory AdminPartner.fromJson(Map<String, dynamic> json) => _$AdminPartnerFromJson(json);

  Map<String, dynamic> toJson() => _$AdminPartnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminPartnerStatusEnum {
@JsonValue(r'applied')
applied(r'applied'),
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'paused')
paused(r'paused'),
@JsonValue(r'banned')
banned(r'banned'),
@JsonValue(r'left')
left(r'left');

const AdminPartnerStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


