//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_growth_revenue_day.dart';
import 'package:casama_api/src/model/admin_growth_revenue_source.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_revenue.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthRevenue {
  /// Returns a new [AdminGrowthRevenue] instance.
  AdminGrowthRevenue({

    required  this.charges,

    required  this.grossUsd,

    required  this.netUsd,

    required  this.refundedUsd,

    required  this.unpricedCharges,

    required  this.bySource,

    required  this.byDay,
  });

  @JsonKey(
    
    name: r'charges',
    required: true,
    includeIfNull: false,
  )


  final int charges;



  @JsonKey(
    
    name: r'gross_usd',
    required: true,
    includeIfNull: false,
  )


  final num grossUsd;



  @JsonKey(
    
    name: r'net_usd',
    required: true,
    includeIfNull: false,
  )


  final num netUsd;



  @JsonKey(
    
    name: r'refunded_usd',
    required: true,
    includeIfNull: false,
  )


  final num refundedUsd;



  @JsonKey(
    
    name: r'unpriced_charges',
    required: true,
    includeIfNull: false,
  )


  final int unpricedCharges;



  @JsonKey(
    
    name: r'by_source',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthRevenueSource> bySource;



  @JsonKey(
    
    name: r'by_day',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthRevenueDay> byDay;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthRevenue &&
      other.charges == charges &&
      other.grossUsd == grossUsd &&
      other.netUsd == netUsd &&
      other.refundedUsd == refundedUsd &&
      other.unpricedCharges == unpricedCharges &&
      other.bySource == bySource &&
      other.byDay == byDay;

    @override
    int get hashCode =>
        charges.hashCode +
        grossUsd.hashCode +
        netUsd.hashCode +
        refundedUsd.hashCode +
        unpricedCharges.hashCode +
        bySource.hashCode +
        byDay.hashCode;

  factory AdminGrowthRevenue.fromJson(Map<String, dynamic> json) => _$AdminGrowthRevenueFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthRevenueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

