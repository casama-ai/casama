//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/watch_events_events_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watch_events.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WatchEvents {
  /// Returns a new [WatchEvents] instance.
  WatchEvents({

    required  this.events,
  });

  @JsonKey(
    
    name: r'events',
    required: true,
    includeIfNull: false,
  )


  final List<WatchEventsEventsInner> events;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WatchEvents &&
      other.events == events;

    @override
    int get hashCode =>
        events.hashCode;

  factory WatchEvents.fromJson(Map<String, dynamic> json) => _$WatchEventsFromJson(json);

  Map<String, dynamic> toJson() => _$WatchEventsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

