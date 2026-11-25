//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_costs_by_day_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCostsByDayInner {
  /// Returns a new [AdminCostsByDayInner] instance.
  AdminCostsByDayInner({

    required  this.date,

    required  this.values,
  });

  @JsonKey(
    
    name: r'date',
    required: true,
    includeIfNull: false,
  )


  final String date;



  @JsonKey(
    
    name: r'values',
    required: true,
    includeIfNull: false,
  )


  final List<num> values;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCostsByDayInner &&
      other.date == date &&
      other.values == values;

    @override
    int get hashCode =>
        date.hashCode +
        values.hashCode;

  factory AdminCostsByDayInner.fromJson(Map<String, dynamic> json) => _$AdminCostsByDayInnerFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostsByDayInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

