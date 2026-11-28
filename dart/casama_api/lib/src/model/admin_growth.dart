//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_growth_platform.dart';
import 'package:casama_api/src/model/admin_growth_money.dart';
import 'package:casama_api/src/model/admin_growth_first_steps.dart';
import 'package:casama_api/src/model/admin_growth_day.dart';
import 'package:casama_api/src/model/admin_growth_failure.dart';
import 'package:casama_api/src/model/admin_growth_source.dart';
import 'package:casama_api/src/model/admin_growth_conversion.dart';
import 'package:casama_api/src/model/admin_growth_cohort.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowth {
  /// Returns a new [AdminGrowth] instance.
  AdminGrowth({

    required  this.days,

    required  this.from,

    required  this.to,

    required  this.people,

    required  this.team,

    required  this.newPeople,

    required  this.active1d,

    required  this.active7d,

    required  this.active30d,

    required  this.openedApp7d,

    required  this.byDay,

    required  this.firstSteps,

    required  this.comingBack,

    required  this.money,

    required  this.failures,

     this.byPlatform,

     this.bySource,

     this.conversion,
  });

  @JsonKey(
    
    name: r'days',
    required: true,
    includeIfNull: false,
  )


  final int days;



  @JsonKey(
    
    name: r'from',
    required: true,
    includeIfNull: false,
  )


  final String from;



  @JsonKey(
    
    name: r'to',
    required: true,
    includeIfNull: false,
  )


  final String to;



  @JsonKey(
    
    name: r'people',
    required: true,
    includeIfNull: false,
  )


  final int people;



  @JsonKey(
    
    name: r'team',
    required: true,
    includeIfNull: false,
  )


  final int team;



  @JsonKey(
    
    name: r'new_people',
    required: true,
    includeIfNull: false,
  )


  final int newPeople;



  @JsonKey(
    
    name: r'active_1d',
    required: true,
    includeIfNull: false,
  )


  final int active1d;



  @JsonKey(
    
    name: r'active_7d',
    required: true,
    includeIfNull: false,
  )


  final int active7d;



  @JsonKey(
    
    name: r'active_30d',
    required: true,
    includeIfNull: false,
  )


  final int active30d;



  @JsonKey(
    
    name: r'opened_app_7d',
    required: true,
    includeIfNull: false,
  )


  final int openedApp7d;



  @JsonKey(
    
    name: r'by_day',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthDay> byDay;



  @JsonKey(
    
    name: r'first_steps',
    required: true,
    includeIfNull: false,
  )


  final AdminGrowthFirstSteps firstSteps;



  @JsonKey(
    
    name: r'coming_back',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthCohort> comingBack;



  @JsonKey(
    
    name: r'money',
    required: true,
    includeIfNull: false,
  )


  final AdminGrowthMoney money;



  @JsonKey(
    
    name: r'failures',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthFailure> failures;



  @JsonKey(
    
    name: r'by_platform',
    required: false,
    includeIfNull: false,
  )


  final List<AdminGrowthPlatform>? byPlatform;



  @JsonKey(
    
    name: r'by_source',
    required: false,
    includeIfNull: false,
  )


  final List<AdminGrowthSource>? bySource;



  @JsonKey(
    
    name: r'conversion',
    required: false,
    includeIfNull: false,
  )


  final AdminGrowthConversion? conversion;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowth &&
      other.days == days &&
      other.from == from &&
      other.to == to &&
      other.people == people &&
      other.team == team &&
      other.newPeople == newPeople &&
      other.active1d == active1d &&
      other.active7d == active7d &&
      other.active30d == active30d &&
      other.openedApp7d == openedApp7d &&
      other.byDay == byDay &&
      other.firstSteps == firstSteps &&
      other.comingBack == comingBack &&
      other.money == money &&
      other.failures == failures &&
      other.byPlatform == byPlatform &&
      other.bySource == bySource &&
      other.conversion == conversion;

    @override
    int get hashCode =>
        days.hashCode +
        from.hashCode +
        to.hashCode +
        people.hashCode +
        team.hashCode +
        newPeople.hashCode +
        active1d.hashCode +
        active7d.hashCode +
        active30d.hashCode +
        openedApp7d.hashCode +
        byDay.hashCode +
        firstSteps.hashCode +
        comingBack.hashCode +
        money.hashCode +
        failures.hashCode +
        byPlatform.hashCode +
        bySource.hashCode +
        conversion.hashCode;

  factory AdminGrowth.fromJson(Map<String, dynamic> json) => _$AdminGrowthFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

