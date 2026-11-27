//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_discount_plan.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminDiscountPlan {
  /// Returns a new [AdminDiscountPlan] instance.
  AdminDiscountPlan({

    required  this.code,

    required  this.name,

    required  this.interval,

    required  this.priceLabel,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'interval',
    required: true,
    includeIfNull: false,
  )


  final AdminDiscountPlanIntervalEnum interval;



  @JsonKey(
    
    name: r'price_label',
    required: true,
    includeIfNull: true,
  )


  final String? priceLabel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminDiscountPlan &&
      other.code == code &&
      other.name == name &&
      other.interval == interval &&
      other.priceLabel == priceLabel;

    @override
    int get hashCode =>
        code.hashCode +
        name.hashCode +
        interval.hashCode +
        (priceLabel == null ? 0 : priceLabel.hashCode);

  factory AdminDiscountPlan.fromJson(Map<String, dynamic> json) => _$AdminDiscountPlanFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDiscountPlanToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminDiscountPlanIntervalEnum {
@JsonValue(r'month')
month(r'month'),
@JsonValue(r'year')
year(r'year'),
@JsonValue(r'week')
week(r'week');

const AdminDiscountPlanIntervalEnum(this.value);

final String value;

@override
String toString() => value;
}


