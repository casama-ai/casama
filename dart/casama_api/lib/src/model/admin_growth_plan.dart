//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_plan.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthPlan {
  /// Returns a new [AdminGrowthPlan] instance.
  AdminGrowthPlan({

    required  this.planCode,

    required  this.subscribers,

    required  this.monthlyUsd,
  });

  @JsonKey(
    
    name: r'plan_code',
    required: true,
    includeIfNull: false,
  )


  final String planCode;



  @JsonKey(
    
    name: r'subscribers',
    required: true,
    includeIfNull: false,
  )


  final int subscribers;



  @JsonKey(
    
    name: r'monthly_usd',
    required: true,
    includeIfNull: true,
  )


  final num? monthlyUsd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthPlan &&
      other.planCode == planCode &&
      other.subscribers == subscribers &&
      other.monthlyUsd == monthlyUsd;

    @override
    int get hashCode =>
        planCode.hashCode +
        subscribers.hashCode +
        (monthlyUsd == null ? 0 : monthlyUsd.hashCode);

  factory AdminGrowthPlan.fromJson(Map<String, dynamic> json) => _$AdminGrowthPlanFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthPlanToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

