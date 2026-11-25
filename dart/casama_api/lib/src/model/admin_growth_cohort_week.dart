//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_cohort_week.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthCohortWeek {
  /// Returns a new [AdminGrowthCohortWeek] instance.
  AdminGrowthCohortWeek({

    required  this.eligible,

    required  this.active,
  });

  @JsonKey(
    
    name: r'eligible',
    required: true,
    includeIfNull: false,
  )


  final int eligible;



  @JsonKey(
    
    name: r'active',
    required: true,
    includeIfNull: false,
  )


  final int active;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthCohortWeek &&
      other.eligible == eligible &&
      other.active == active;

    @override
    int get hashCode =>
        eligible.hashCode +
        active.hashCode;

  factory AdminGrowthCohortWeek.fromJson(Map<String, dynamic> json) => _$AdminGrowthCohortWeekFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthCohortWeekToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

