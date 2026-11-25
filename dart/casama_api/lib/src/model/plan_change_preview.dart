//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_change_preview.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlanChangePreview {
  /// Returns a new [PlanChangePreview] instance.
  PlanChangePreview({

    required  this.planCode,

    required  this.planName,

    required  this.interval,

    required  this.currency,

    required  this.immediateTotal,

    required  this.immediateTax,

    required  this.credit,

    required  this.recurringPreTax,

    required  this.nextBillingDate,

    required  this.discountApplied,

     this.discountCode,

     this.discountPercent,

     this.discountAmount,

     this.discountCycles,

     this.discountPreserved,

     this.replacesDiscount,

     this.replacedDiscountPercent,
  });

  @JsonKey(
    
    name: r'plan_code',
    required: true,
    includeIfNull: false,
  )


  final String planCode;



  @JsonKey(
    
    name: r'plan_name',
    required: true,
    includeIfNull: false,
  )


  final String planName;



  @JsonKey(
    
    name: r'interval',
    required: true,
    includeIfNull: false,
  )


  final PlanChangePreviewIntervalEnum interval;



      /// ISO 4217 currency code (e.g. USD)
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



      /// Total charged now including tax, in minor units (e.g. cents)
  @JsonKey(
    
    name: r'immediate_total',
    required: true,
    includeIfNull: false,
  )


  final int immediateTotal;



      /// Tax included in immediate_total, in minor units
  @JsonKey(
    
    name: r'immediate_tax',
    required: true,
    includeIfNull: false,
  )


  final int immediateTax;



      /// Credit for the unused part of the current period, in minor units
  @JsonKey(
    
    name: r'credit',
    required: true,
    includeIfNull: false,
  )


  final int credit;



      /// Renewal price before tax, in minor units
  @JsonKey(
    
    name: r'recurring_pre_tax',
    required: true,
    includeIfNull: false,
  )


  final int recurringPreTax;



  @JsonKey(
    
    name: r'next_billing_date',
    required: true,
    includeIfNull: true,
  )


  final DateTime? nextBillingDate;



  @JsonKey(
    
    name: r'discount_applied',
    required: true,
    includeIfNull: false,
  )


  final bool discountApplied;



  @JsonKey(
    
    name: r'discount_code',
    required: false,
    includeIfNull: false,
  )


  final String? discountCode;



      /// Percentage off (e.g. 25 for 25% off) when a percentage code applies
  @JsonKey(
    
    name: r'discount_percent',
    required: false,
    includeIfNull: false,
  )


  final num? discountPercent;



      /// What a flat code takes off the renewal price, in minor units of `currency` (the difference between the renewal price without and with it)
  @JsonKey(
    
    name: r'discount_amount',
    required: false,
    includeIfNull: false,
  )


  final int? discountAmount;



      /// Number of renewals the code applies to; null means every renewal
  @JsonKey(
    
    name: r'discount_cycles',
    required: false,
    includeIfNull: false,
  )


  final int? discountCycles;



      /// Whether the discount stays on later plan changes. When false, it ends if the plan changes again
  @JsonKey(
    
    name: r'discount_preserved',
    required: false,
    includeIfNull: false,
  )


  final bool? discountPreserved;



      /// The code replaces a discount the subscription keeps today (Dodo's `discount_codes` replaces them)
  @JsonKey(
    
    name: r'replaces_discount',
    required: false,
    includeIfNull: false,
  )


  final bool? replacesDiscount;



      /// The replaced discount's percentage, when it was a percentage discount
  @JsonKey(
    
    name: r'replaced_discount_percent',
    required: false,
    includeIfNull: false,
  )


  final num? replacedDiscountPercent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PlanChangePreview &&
      other.planCode == planCode &&
      other.planName == planName &&
      other.interval == interval &&
      other.currency == currency &&
      other.immediateTotal == immediateTotal &&
      other.immediateTax == immediateTax &&
      other.credit == credit &&
      other.recurringPreTax == recurringPreTax &&
      other.nextBillingDate == nextBillingDate &&
      other.discountApplied == discountApplied &&
      other.discountCode == discountCode &&
      other.discountPercent == discountPercent &&
      other.discountAmount == discountAmount &&
      other.discountCycles == discountCycles &&
      other.discountPreserved == discountPreserved &&
      other.replacesDiscount == replacesDiscount &&
      other.replacedDiscountPercent == replacedDiscountPercent;

    @override
    int get hashCode =>
        planCode.hashCode +
        planName.hashCode +
        interval.hashCode +
        currency.hashCode +
        immediateTotal.hashCode +
        immediateTax.hashCode +
        credit.hashCode +
        recurringPreTax.hashCode +
        (nextBillingDate == null ? 0 : nextBillingDate.hashCode) +
        discountApplied.hashCode +
        (discountCode == null ? 0 : discountCode.hashCode) +
        (discountPercent == null ? 0 : discountPercent.hashCode) +
        (discountAmount == null ? 0 : discountAmount.hashCode) +
        (discountCycles == null ? 0 : discountCycles.hashCode) +
        discountPreserved.hashCode +
        replacesDiscount.hashCode +
        (replacedDiscountPercent == null ? 0 : replacedDiscountPercent.hashCode);

  factory PlanChangePreview.fromJson(Map<String, dynamic> json) => _$PlanChangePreviewFromJson(json);

  Map<String, dynamic> toJson() => _$PlanChangePreviewToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum PlanChangePreviewIntervalEnum {
@JsonValue(r'week')
week(r'week'),
@JsonValue(r'month')
month(r'month'),
@JsonValue(r'year')
year(r'year');

const PlanChangePreviewIntervalEnum(this.value);

final String value;

@override
String toString() => value;
}


