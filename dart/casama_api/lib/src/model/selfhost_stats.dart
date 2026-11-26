//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/selfhost_stats_daily_active_inner.dart';
import 'package:casama_api/src/model/selfhost_stats_by_edition_inner.dart';
import 'package:casama_api/src/model/selfhost_stats_by_engine_version_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selfhost_stats.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfhostStats {
  /// Returns a new [SelfhostStats] instance.
  SelfhostStats({

    required  this.dailyActive,

    required  this.newInstalls,

    required  this.active24h,

    required  this.byEdition,

    required  this.byEngineVersion,

    required  this.lapsed,

    required  this.members,

    required  this.bots,
  });

  @JsonKey(
    
    name: r'daily_active',
    required: true,
    includeIfNull: false,
  )


  final List<SelfhostStatsDailyActiveInner> dailyActive;



  @JsonKey(
    
    name: r'new_installs',
    required: true,
    includeIfNull: false,
  )


  final List<SelfhostStatsDailyActiveInner> newInstalls;



  @JsonKey(
    
    name: r'active_24h',
    required: true,
    includeIfNull: false,
  )


  final int active24h;



  @JsonKey(
    
    name: r'by_edition',
    required: true,
    includeIfNull: false,
  )


  final List<SelfhostStatsByEditionInner> byEdition;



  @JsonKey(
    
    name: r'by_engine_version',
    required: true,
    includeIfNull: false,
  )


  final List<SelfhostStatsByEngineVersionInner> byEngineVersion;



  @JsonKey(
    
    name: r'lapsed',
    required: true,
    includeIfNull: false,
  )


  final int lapsed;



  @JsonKey(
    
    name: r'members',
    required: true,
    includeIfNull: false,
  )


  final int members;



  @JsonKey(
    
    name: r'bots',
    required: true,
    includeIfNull: false,
  )


  final int bots;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfhostStats &&
      other.dailyActive == dailyActive &&
      other.newInstalls == newInstalls &&
      other.active24h == active24h &&
      other.byEdition == byEdition &&
      other.byEngineVersion == byEngineVersion &&
      other.lapsed == lapsed &&
      other.members == members &&
      other.bots == bots;

    @override
    int get hashCode =>
        dailyActive.hashCode +
        newInstalls.hashCode +
        active24h.hashCode +
        byEdition.hashCode +
        byEngineVersion.hashCode +
        lapsed.hashCode +
        members.hashCode +
        bots.hashCode;

  factory SelfhostStats.fromJson(Map<String, dynamic> json) => _$SelfhostStatsFromJson(json);

  Map<String, dynamic> toJson() => _$SelfhostStatsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

