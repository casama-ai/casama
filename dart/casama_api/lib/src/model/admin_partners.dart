//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_partner.dart';
import 'package:casama_api/src/model/admin_partners_totals.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_partners.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminPartners {
  /// Returns a new [AdminPartners] instance.
  AdminPartners({

    required  this.enabled,

    required  this.platform,

    required  this.rate,

    required  this.holdDays,

    required  this.totals,

    required  this.partners,
  });

  @JsonKey(
    
    name: r'enabled',
    required: true,
    includeIfNull: false,
  )


  final bool enabled;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: true,
  )


  final String? platform;



  @JsonKey(
    
    name: r'rate',
    required: true,
    includeIfNull: false,
  )


  final num rate;



  @JsonKey(
    
    name: r'hold_days',
    required: true,
    includeIfNull: false,
  )


  final int holdDays;



  @JsonKey(
    
    name: r'totals',
    required: true,
    includeIfNull: false,
  )


  final AdminPartnersTotals totals;



  @JsonKey(
    
    name: r'partners',
    required: true,
    includeIfNull: false,
  )


  final List<AdminPartner> partners;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminPartners &&
      other.enabled == enabled &&
      other.platform == platform &&
      other.rate == rate &&
      other.holdDays == holdDays &&
      other.totals == totals &&
      other.partners == partners;

    @override
    int get hashCode =>
        enabled.hashCode +
        (platform == null ? 0 : platform.hashCode) +
        rate.hashCode +
        holdDays.hashCode +
        totals.hashCode +
        partners.hashCode;

  factory AdminPartners.fromJson(Map<String, dynamic> json) => _$AdminPartnersFromJson(json);

  Map<String, dynamic> toJson() => _$AdminPartnersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

