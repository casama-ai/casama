//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_growth_cohort_week.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_cohort.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthCohort {
  /// Returns a new [AdminGrowthCohort] instance.
  AdminGrowthCohort({

    required  this.week,

    required  this.size,

    required  this.weeks,
  });

  @JsonKey(
    
    name: r'week',
    required: true,
    includeIfNull: false,
  )


  final String week;



  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;



  @JsonKey(
    
    name: r'weeks',
    required: true,
    includeIfNull: false,
  )


  final List<AdminGrowthCohortWeek> weeks;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthCohort &&
      other.week == week &&
      other.size == size &&
      other.weeks == weeks;

    @override
    int get hashCode =>
        week.hashCode +
        size.hashCode +
        weeks.hashCode;

  factory AdminGrowthCohort.fromJson(Map<String, dynamic> json) => _$AdminGrowthCohortFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthCohortToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

