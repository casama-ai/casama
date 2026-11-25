//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_growth_revenue.dart';
import 'package:casama_api/src/model/admin_growth_plan.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_money.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthMoney {
  /// Returns a new [AdminGrowthMoney] instance.
  AdminGrowthMoney({

    required  this.paidSubscribers,

    required  this.monthlyUsd,

    required  this.lifetimeUsd,

    required  this.lifetimeNetUsd,

    required  this.newPaid,

    required  this.compActive,

    required  this.testActive,

    required  this.byPlan,

    required  this.revenue,
  });

  @JsonKey(
    
    name: r'paid_subscribers',
    required: true,
    includeIfNull: false,
  )


  final int paidSubscribers;



  @JsonKey(
    
    name: r'monthly_usd',
    required: true,
    includeIfNull: false,
  )


  final num monthlyUsd;



  @JsonKey(
    
    name: r'lifetime_usd',
    required: true,
    includeIfNull: false,
  )


  final num lifetimeUsd;



  @JsonKey(
    
    name: r'lifetime_net_usd',
    required: true,
    includeIfNull: false,
  )


  final num lifetimeNetUsd;



  @JsonKey(
    
    name: r'new_paid',
    required: true,
    includeIfNull: false,
  )


  final int newPaid;



  @JsonKey(
    
    name: r'comp_active',
    required: true,
    includeIfNull: false,
  )


  final int compActive;



  @JsonKey(
    
    name: r'test_active',
    required: true,
    includeIfNull: false,
  )


  final int testActive;



  @JsonKey(
    
    name: r'by_plan',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthPlan> byPlan;



  @JsonKey(
    
    name: r'revenue',
    required: true,
    includeIfNull: false,
  )


  final AdminGrowthRevenue revenue;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthMoney &&
      other.paidSubscribers == paidSubscribers &&
      other.monthlyUsd == monthlyUsd &&
      other.lifetimeUsd == lifetimeUsd &&
      other.lifetimeNetUsd == lifetimeNetUsd &&
      other.newPaid == newPaid &&
      other.compActive == compActive &&
      other.testActive == testActive &&
      other.byPlan == byPlan &&
      other.revenue == revenue;

    @override
    int get hashCode =>
        paidSubscribers.hashCode +
        monthlyUsd.hashCode +
        lifetimeUsd.hashCode +
        lifetimeNetUsd.hashCode +
        newPaid.hashCode +
        compActive.hashCode +
        testActive.hashCode +
        byPlan.hashCode +
        revenue.hashCode;

  factory AdminGrowthMoney.fromJson(Map<String, dynamic> json) => _$AdminGrowthMoneyFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthMoneyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

