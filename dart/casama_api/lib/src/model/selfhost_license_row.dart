//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/license_edition.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selfhost_license_row.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfhostLicenseRow {
  /// Returns a new [SelfhostLicenseRow] instance.
  SelfhostLicenseRow({

    required  this.id,

    required  this.edition,

    required  this.accountId,

    required  this.customer,

    required  this.email,

    required  this.instanceId,

    required  this.seats,

    required  this.features,

    required  this.offline,

    required  this.issuedAt,

    required  this.expiresAt,

    required  this.validUntil,

    required  this.lastRenewedAt,

    required  this.engineVersion,

    required  this.lastCheckinAt,

    required  this.members,

    required  this.bots,

    required  this.revoked,

    required  this.revokedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'edition',
    required: true,
    includeIfNull: false,
  )


  final LicenseEdition edition;



  @JsonKey(
    
    name: r'account_id',
    required: true,
    includeIfNull: true,
  )


  final String? accountId;



  @JsonKey(
    
    name: r'customer',
    required: true,
    includeIfNull: true,
  )


  final String? customer;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'instance_id',
    required: true,
    includeIfNull: true,
  )


  final String? instanceId;



  @JsonKey(
    
    name: r'seats',
    required: true,
    includeIfNull: false,
  )


  final int seats;



  @JsonKey(
    
    name: r'features',
    required: true,
    includeIfNull: false,
  )


  final List<String> features;



  @JsonKey(
    
    name: r'offline',
    required: true,
    includeIfNull: false,
  )


  final bool offline;



  @JsonKey(
    
    name: r'issued_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime issuedAt;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'valid_until',
    required: true,
    includeIfNull: true,
  )


  final DateTime? validUntil;



  @JsonKey(
    
    name: r'last_renewed_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastRenewedAt;



  @JsonKey(
    
    name: r'engine_version',
    required: true,
    includeIfNull: true,
  )


  final String? engineVersion;



  @JsonKey(
    
    name: r'last_checkin_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastCheckinAt;



  @JsonKey(
    
    name: r'members',
    required: true,
    includeIfNull: true,
  )


  final int? members;



  @JsonKey(
    
    name: r'bots',
    required: true,
    includeIfNull: true,
  )


  final int? bots;



  @JsonKey(
    
    name: r'revoked',
    required: true,
    includeIfNull: false,
  )


  final bool revoked;



  @JsonKey(
    
    name: r'revoked_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? revokedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfhostLicenseRow &&
      other.id == id &&
      other.edition == edition &&
      other.accountId == accountId &&
      other.customer == customer &&
      other.email == email &&
      other.instanceId == instanceId &&
      other.seats == seats &&
      other.features == features &&
      other.offline == offline &&
      other.issuedAt == issuedAt &&
      other.expiresAt == expiresAt &&
      other.validUntil == validUntil &&
      other.lastRenewedAt == lastRenewedAt &&
      other.engineVersion == engineVersion &&
      other.lastCheckinAt == lastCheckinAt &&
      other.members == members &&
      other.bots == bots &&
      other.revoked == revoked &&
      other.revokedAt == revokedAt;

    @override
    int get hashCode =>
        id.hashCode +
        edition.hashCode +
        (accountId == null ? 0 : accountId.hashCode) +
        (customer == null ? 0 : customer.hashCode) +
        (email == null ? 0 : email.hashCode) +
        (instanceId == null ? 0 : instanceId.hashCode) +
        seats.hashCode +
        features.hashCode +
        offline.hashCode +
        issuedAt.hashCode +
        expiresAt.hashCode +
        (validUntil == null ? 0 : validUntil.hashCode) +
        (lastRenewedAt == null ? 0 : lastRenewedAt.hashCode) +
        (engineVersion == null ? 0 : engineVersion.hashCode) +
        (lastCheckinAt == null ? 0 : lastCheckinAt.hashCode) +
        (members == null ? 0 : members.hashCode) +
        (bots == null ? 0 : bots.hashCode) +
        revoked.hashCode +
        (revokedAt == null ? 0 : revokedAt.hashCode);

  factory SelfhostLicenseRow.fromJson(Map<String, dynamic> json) => _$SelfhostLicenseRowFromJson(json);

  Map<String, dynamic> toJson() => _$SelfhostLicenseRowToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

