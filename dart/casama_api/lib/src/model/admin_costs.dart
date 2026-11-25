//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cost_group.dart';
import 'package:casama_api/src/model/admin_costs_series_inner.dart';
import 'package:casama_api/src/model/admin_costs_by_day_inner.dart';
import 'package:casama_api/src/model/admin_cost_totals.dart';
import 'package:casama_api/src/model/admin_cost_row.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_costs.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCosts {
  /// Returns a new [AdminCosts] instance.
  AdminCosts({

    required  this.from,

    required  this.to,

    required  this.group,

    required  this.includeFixed,

    required  this.totals,

    required  this.previous,

    required  this.series,

    required  this.byDay,

    required  this.rows,

    required  this.updatedAt,
  });

      /// First UTC day, YYYY-MM-DD
  @JsonKey(
    
    name: r'from',
    required: true,
    includeIfNull: false,
  )


  final String from;



      /// Last UTC day, YYYY-MM-DD
  @JsonKey(
    
    name: r'to',
    required: true,
    includeIfNull: false,
  )


  final String to;



  @JsonKey(
    
    name: r'group',
    required: true,
    includeIfNull: false,
  )


  final CostGroup group;



  @JsonKey(
    
    name: r'include_fixed',
    required: true,
    includeIfNull: false,
  )


  final bool includeFixed;



  @JsonKey(
    
    name: r'totals',
    required: true,
    includeIfNull: false,
  )


  final AdminCostTotals totals;



  @JsonKey(
    
    name: r'previous',
    required: true,
    includeIfNull: true,
  )


  final AdminCostTotals? previous;



  @JsonKey(
    
    name: r'series',
    required: true,
    includeIfNull: false,
  )


  final List<AdminCostsSeriesInner> series;



  @JsonKey(
    
    name: r'by_day',
    required: true,
    includeIfNull: false,
  )


  final List<AdminCostsByDayInner> byDay;



  @JsonKey(
    
    name: r'rows',
    required: true,
    includeIfNull: false,
  )


  final List<AdminCostRow> rows;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: true,
  )


  final String? updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCosts &&
      other.from == from &&
      other.to == to &&
      other.group == group &&
      other.includeFixed == includeFixed &&
      other.totals == totals &&
      other.previous == previous &&
      other.series == series &&
      other.byDay == byDay &&
      other.rows == rows &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        from.hashCode +
        to.hashCode +
        group.hashCode +
        includeFixed.hashCode +
        totals.hashCode +
        (previous == null ? 0 : previous.hashCode) +
        series.hashCode +
        byDay.hashCode +
        rows.hashCode +
        (updatedAt == null ? 0 : updatedAt.hashCode);

  factory AdminCosts.fromJson(Map<String, dynamic> json) => _$AdminCostsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

