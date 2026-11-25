//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_partners_totals.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminPartnersTotals {
  /// Returns a new [AdminPartnersTotals] instance.
  AdminPartnersTotals({

    required  this.pendingUsd,

    required  this.payableUsd,

    required  this.paidUsd,

    required  this.unreadCharges,

    required  this.syncFailed,
  });

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
    
    name: r'unread_charges',
    required: true,
    includeIfNull: false,
  )


  final int unreadCharges;



  @JsonKey(
    
    name: r'sync_failed',
    required: true,
    includeIfNull: false,
  )


  final int syncFailed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminPartnersTotals &&
      other.pendingUsd == pendingUsd &&
      other.payableUsd == payableUsd &&
      other.paidUsd == paidUsd &&
      other.unreadCharges == unreadCharges &&
      other.syncFailed == syncFailed;

    @override
    int get hashCode =>
        pendingUsd.hashCode +
        payableUsd.hashCode +
        paidUsd.hashCode +
        unreadCharges.hashCode +
        syncFailed.hashCode;

  factory AdminPartnersTotals.fromJson(Map<String, dynamic> json) => _$AdminPartnersTotalsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminPartnersTotalsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

