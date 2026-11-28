//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_growth_connection_failure.dart';
import 'package:casama_api/src/model/admin_growth_paywall_source.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_conversion.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthConversion {
  /// Returns a new [AdminGrowthConversion] instance.
  AdminGrowthConversion({

    required  this.hitLimit,

    required  this.sawPaywall,

    required  this.selectedPlan,

    required  this.startedCheckout,

    required  this.startedTrial,

    required  this.paid,

    required  this.bySource,

    required  this.connectionFailures,
  });

  @JsonKey(
    
    name: r'hit_limit',
    required: true,
    includeIfNull: false,
  )


  final int hitLimit;



  @JsonKey(
    
    name: r'saw_paywall',
    required: true,
    includeIfNull: false,
  )


  final int sawPaywall;



  @JsonKey(
    
    name: r'selected_plan',
    required: true,
    includeIfNull: false,
  )


  final int selectedPlan;



  @JsonKey(
    
    name: r'started_checkout',
    required: true,
    includeIfNull: false,
  )


  final int startedCheckout;



  @JsonKey(
    
    name: r'started_trial',
    required: true,
    includeIfNull: false,
  )


  final int startedTrial;



  @JsonKey(
    
    name: r'paid',
    required: true,
    includeIfNull: false,
  )


  final int paid;



  @JsonKey(
    
    name: r'by_source',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthPaywallSource> bySource;



  @JsonKey(
    
    name: r'connection_failures',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthConnectionFailure> connectionFailures;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthConversion &&
      other.hitLimit == hitLimit &&
      other.sawPaywall == sawPaywall &&
      other.selectedPlan == selectedPlan &&
      other.startedCheckout == startedCheckout &&
      other.startedTrial == startedTrial &&
      other.paid == paid &&
      other.bySource == bySource &&
      other.connectionFailures == connectionFailures;

    @override
    int get hashCode =>
        hitLimit.hashCode +
        sawPaywall.hashCode +
        selectedPlan.hashCode +
        startedCheckout.hashCode +
        startedTrial.hashCode +
        paid.hashCode +
        bySource.hashCode +
        connectionFailures.hashCode;

  factory AdminGrowthConversion.fromJson(Map<String, dynamic> json) => _$AdminGrowthConversionFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthConversionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

