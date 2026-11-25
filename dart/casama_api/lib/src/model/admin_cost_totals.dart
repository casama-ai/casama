//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_cost_totals.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCostTotals {
  /// Returns a new [AdminCostTotals] instance.
  AdminCostTotals({

    required  this.spentUsd,

    required  this.chargedUsd,

    required  this.chargedTrackedUsd,

    required  this.ownUsd,

    required  this.fixedUsd,

    required  this.notRecordedUsd,

    required  this.calls,
  });

      /// What the server paid, fees included
  @JsonKey(
    
    name: r'spent_usd',
    required: true,
    includeIfNull: false,
  )


  final num spentUsd;



      /// Taken from credits for usage
  @JsonKey(
    
    name: r'charged_usd',
    required: true,
    includeIfNull: false,
  )


  final num chargedUsd;



      /// The charged part whose cost is known per row: the margin's base
  @JsonKey(
    
    name: r'charged_tracked_usd',
    required: true,
    includeIfNull: false,
  )


  final num chargedTrackedUsd;



      /// Paid by workspaces on their own keys: not the server's money
  @JsonKey(
    
    name: r'own_usd',
    required: true,
    includeIfNull: false,
  )


  final num ownUsd;



      /// Fixed bills in the period; inside spent_usd only when asked for
  @JsonKey(
    
    name: r'fixed_usd',
    required: true,
    includeIfNull: false,
  )


  final num fixedUsd;



      /// What vendors report above what the server recorded
  @JsonKey(
    
    name: r'not_recorded_usd',
    required: true,
    includeIfNull: false,
  )


  final num notRecordedUsd;



  @JsonKey(
    
    name: r'calls',
    required: true,
    includeIfNull: false,
  )


  final int calls;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCostTotals &&
      other.spentUsd == spentUsd &&
      other.chargedUsd == chargedUsd &&
      other.chargedTrackedUsd == chargedTrackedUsd &&
      other.ownUsd == ownUsd &&
      other.fixedUsd == fixedUsd &&
      other.notRecordedUsd == notRecordedUsd &&
      other.calls == calls;

    @override
    int get hashCode =>
        spentUsd.hashCode +
        chargedUsd.hashCode +
        chargedTrackedUsd.hashCode +
        ownUsd.hashCode +
        fixedUsd.hashCode +
        notRecordedUsd.hashCode +
        calls.hashCode;

  factory AdminCostTotals.fromJson(Map<String, dynamic> json) => _$AdminCostTotalsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostTotalsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

