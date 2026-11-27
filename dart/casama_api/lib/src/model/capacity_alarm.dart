//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'capacity_alarm.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CapacityAlarm {
  /// Returns a new [CapacityAlarm] instance.
  CapacityAlarm({

    required  this.level,

    required  this.startedAt,

    required  this.levelSince,

    required  this.lastPushAt,

    required  this.snoozedUntil,

    required  this.endedAt,
  });

      /// 0 = no alarm; 70, 80, 90 or 95 = percent of the memory budget; 100 = full (a start refused or the host low on memory)
  @JsonKey(
    
    name: r'level',
    required: true,
    includeIfNull: false,
  )


  final int level;



  @JsonKey(
    
    name: r'started_at',
    required: true,
    includeIfNull: true,
  )


  final String? startedAt;



  @JsonKey(
    
    name: r'level_since',
    required: true,
    includeIfNull: true,
  )


  final String? levelSince;



  @JsonKey(
    
    name: r'last_push_at',
    required: true,
    includeIfNull: true,
  )


  final String? lastPushAt;



  @JsonKey(
    
    name: r'snoozed_until',
    required: true,
    includeIfNull: true,
  )


  final String? snoozedUntil;



  @JsonKey(
    
    name: r'ended_at',
    required: true,
    includeIfNull: true,
  )


  final String? endedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CapacityAlarm &&
      other.level == level &&
      other.startedAt == startedAt &&
      other.levelSince == levelSince &&
      other.lastPushAt == lastPushAt &&
      other.snoozedUntil == snoozedUntil &&
      other.endedAt == endedAt;

    @override
    int get hashCode =>
        level.hashCode +
        (startedAt == null ? 0 : startedAt.hashCode) +
        (levelSince == null ? 0 : levelSince.hashCode) +
        (lastPushAt == null ? 0 : lastPushAt.hashCode) +
        (snoozedUntil == null ? 0 : snoozedUntil.hashCode) +
        (endedAt == null ? 0 : endedAt.hashCode);

  factory CapacityAlarm.fromJson(Map<String, dynamic> json) => _$CapacityAlarmFromJson(json);

  Map<String, dynamic> toJson() => _$CapacityAlarmToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

