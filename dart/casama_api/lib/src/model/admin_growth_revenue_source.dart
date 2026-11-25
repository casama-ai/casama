//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_revenue_source.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthRevenueSource {
  /// Returns a new [AdminGrowthRevenueSource] instance.
  AdminGrowthRevenueSource({

    required  this.source_,

    required  this.charges,

    required  this.grossUsd,

    required  this.netUsd,

    required  this.refundedUsd,
  });

  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final String source_;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthRevenueSource &&
      other.source_ == source_ &&
      other.charges == charges &&
      other.grossUsd == grossUsd &&
      other.netUsd == netUsd &&
      other.refundedUsd == refundedUsd;

    @override
    int get hashCode =>
        source_.hashCode +
        charges.hashCode +
        grossUsd.hashCode +
        netUsd.hashCode +
        refundedUsd.hashCode;

  factory AdminGrowthRevenueSource.fromJson(Map<String, dynamic> json) => _$AdminGrowthRevenueSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthRevenueSourceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

