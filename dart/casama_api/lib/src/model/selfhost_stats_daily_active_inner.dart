//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selfhost_stats_daily_active_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfhostStatsDailyActiveInner {
  /// Returns a new [SelfhostStatsDailyActiveInner] instance.
  SelfhostStatsDailyActiveInner({

    required  this.day,

    required  this.count,
  });

  @JsonKey(
    
    name: r'day',
    required: true,
    includeIfNull: false,
  )


  final String day;



  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfhostStatsDailyActiveInner &&
      other.day == day &&
      other.count == count;

    @override
    int get hashCode =>
        day.hashCode +
        count.hashCode;

  factory SelfhostStatsDailyActiveInner.fromJson(Map<String, dynamic> json) => _$SelfhostStatsDailyActiveInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SelfhostStatsDailyActiveInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

