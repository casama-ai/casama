//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snooze_capacity_alarm_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SnoozeCapacityAlarmRequest {
  /// Returns a new [SnoozeCapacityAlarmRequest] instance.
  SnoozeCapacityAlarmRequest({

    required  this.minutes,
  });

      /// 60 = snooze an hour; 120 = \"I'm upgrading\"
  @JsonKey(
    
    name: r'minutes',
    required: true,
    includeIfNull: true,
  )


  final Object? minutes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SnoozeCapacityAlarmRequest &&
      other.minutes == minutes;

    @override
    int get hashCode =>
        (minutes == null ? 0 : minutes.hashCode);

  factory SnoozeCapacityAlarmRequest.fromJson(Map<String, dynamic> json) => _$SnoozeCapacityAlarmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SnoozeCapacityAlarmRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

