//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cost_source.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_cost_row.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCostRow {
  /// Returns a new [AdminCostRow] instance.
  AdminCostRow({

    required  this.id,

    required  this.label,

    required  this.spentUsd,

    required  this.chargedUsd,

    required  this.chargedTrackedUsd,

    required  this.calls,

    required  this.previousSpentUsd,

    required  this.source_,

     this.reportedUsd,

     this.vendor,

     this.lastUsedAt,

     this.planCode,

     this.integrationKind,

     this.failed,

     this.tokenUsdEst,
  });

      /// The group's key; empty for rows that carry no label
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: false,
  )


  final String label;



  @JsonKey(
    
    name: r'spent_usd',
    required: true,
    includeIfNull: false,
  )


  final num spentUsd;



  @JsonKey(
    
    name: r'charged_usd',
    required: true,
    includeIfNull: false,
  )


  final num chargedUsd;



  @JsonKey(
    
    name: r'charged_tracked_usd',
    required: true,
    includeIfNull: false,
  )


  final num chargedTrackedUsd;



  @JsonKey(
    
    name: r'calls',
    required: true,
    includeIfNull: false,
  )


  final int calls;



  @JsonKey(
    
    name: r'previous_spent_usd',
    required: true,
    includeIfNull: true,
  )


  final num? previousSpentUsd;



  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final CostSource source_;



  @JsonKey(
    
    name: r'reported_usd',
    required: false,
    includeIfNull: false,
  )


  final num? reportedUsd;



  @JsonKey(
    
    name: r'vendor',
    required: false,
    includeIfNull: false,
  )


  final String? vendor;



  @JsonKey(
    
    name: r'last_used_at',
    required: false,
    includeIfNull: false,
  )


  final String? lastUsedAt;



  @JsonKey(
    
    name: r'plan_code',
    required: false,
    includeIfNull: false,
  )


  final String? planCode;



  @JsonKey(
    
    name: r'integration_kind',
    required: false,
    includeIfNull: false,
  )


  final String? integrationKind;



  @JsonKey(
    
    name: r'failed',
    required: false,
    includeIfNull: false,
  )


  final int? failed;



  @JsonKey(
    
    name: r'token_usd_est',
    required: false,
    includeIfNull: false,
  )


  final num? tokenUsdEst;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCostRow &&
      other.id == id &&
      other.label == label &&
      other.spentUsd == spentUsd &&
      other.chargedUsd == chargedUsd &&
      other.chargedTrackedUsd == chargedTrackedUsd &&
      other.calls == calls &&
      other.previousSpentUsd == previousSpentUsd &&
      other.source_ == source_ &&
      other.reportedUsd == reportedUsd &&
      other.vendor == vendor &&
      other.lastUsedAt == lastUsedAt &&
      other.planCode == planCode &&
      other.integrationKind == integrationKind &&
      other.failed == failed &&
      other.tokenUsdEst == tokenUsdEst;

    @override
    int get hashCode =>
        id.hashCode +
        label.hashCode +
        spentUsd.hashCode +
        chargedUsd.hashCode +
        chargedTrackedUsd.hashCode +
        calls.hashCode +
        (previousSpentUsd == null ? 0 : previousSpentUsd.hashCode) +
        source_.hashCode +
        (reportedUsd == null ? 0 : reportedUsd.hashCode) +
        (vendor == null ? 0 : vendor.hashCode) +
        (lastUsedAt == null ? 0 : lastUsedAt.hashCode) +
        (planCode == null ? 0 : planCode.hashCode) +
        (integrationKind == null ? 0 : integrationKind.hashCode) +
        (failed == null ? 0 : failed.hashCode) +
        (tokenUsdEst == null ? 0 : tokenUsdEst.hashCode);

  factory AdminCostRow.fromJson(Map<String, dynamic> json) => _$AdminCostRowFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostRowToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

