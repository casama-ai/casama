//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_discount.dart';
import 'package:casama_api/src/model/admin_discount_plan.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_discounts_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminDiscountsResponse {
  /// Returns a new [AdminDiscountsResponse] instance.
  AdminDiscountsResponse({

    required  this.discounts,

    required  this.plans,
  });

  @JsonKey(
    
    name: r'discounts',
    required: true,
    includeIfNull: false,
  )


  final List<AdminDiscount> discounts;



  @JsonKey(
    
    name: r'plans',
    required: true,
    includeIfNull: false,
  )


  final List<AdminDiscountPlan> plans;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminDiscountsResponse &&
      other.discounts == discounts &&
      other.plans == plans;

    @override
    int get hashCode =>
        discounts.hashCode +
        plans.hashCode;

  factory AdminDiscountsResponse.fromJson(Map<String, dynamic> json) => _$AdminDiscountsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDiscountsResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

