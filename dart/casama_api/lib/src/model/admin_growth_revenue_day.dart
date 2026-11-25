//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_revenue_day.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthRevenueDay {
  /// Returns a new [AdminGrowthRevenueDay] instance.
  AdminGrowthRevenueDay({

    required  this.date,

    required  this.dodoUsd,

    required  this.appStoreUsd,

    required  this.googlePlayUsd,
  });

  @JsonKey(
    
    name: r'date',
    required: true,
    includeIfNull: false,
  )


  final String date;



  @JsonKey(
    
    name: r'dodo_usd',
    required: true,
    includeIfNull: false,
  )


  final num dodoUsd;



  @JsonKey(
    
    name: r'app_store_usd',
    required: true,
    includeIfNull: false,
  )


  final num appStoreUsd;



  @JsonKey(
    
    name: r'google_play_usd',
    required: true,
    includeIfNull: false,
  )


  final num googlePlayUsd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthRevenueDay &&
      other.date == date &&
      other.dodoUsd == dodoUsd &&
      other.appStoreUsd == appStoreUsd &&
      other.googlePlayUsd == googlePlayUsd;

    @override
    int get hashCode =>
        date.hashCode +
        dodoUsd.hashCode +
        appStoreUsd.hashCode +
        googlePlayUsd.hashCode;

  factory AdminGrowthRevenueDay.fromJson(Map<String, dynamic> json) => _$AdminGrowthRevenueDayFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthRevenueDayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

