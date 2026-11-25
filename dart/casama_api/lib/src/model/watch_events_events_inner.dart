//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watch_events_events_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WatchEventsEventsInner {
  /// Returns a new [WatchEventsEventsInner] instance.
  WatchEventsEventsInner({

    required  this.screen,

     this.surface,
  });

  @JsonKey(
    
    name: r'screen',
    required: true,
    includeIfNull: false,
  )


  final WatchEventsEventsInnerScreenEnum screen;



  @JsonKey(
    
    name: r'surface',
    required: false,
    includeIfNull: false,
  )


  final WatchEventsEventsInnerSurfaceEnum? surface;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WatchEventsEventsInner &&
      other.screen == screen &&
      other.surface == surface;

    @override
    int get hashCode =>
        screen.hashCode +
        surface.hashCode;

  factory WatchEventsEventsInner.fromJson(Map<String, dynamic> json) => _$WatchEventsEventsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$WatchEventsEventsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum WatchEventsEventsInnerScreenEnum {
@JsonValue(r'now')
now(r'now'),
@JsonValue(r'needs')
needs(r'needs'),
@JsonValue(r'request')
request(r'request'),
@JsonValue(r'suggestion')
suggestion(r'suggestion'),
@JsonValue(r'elsewhere')
elsewhere(r'elsewhere'),
@JsonValue(r'ask')
ask(r'ask'),
@JsonValue(r'run')
run(r'run'),
@JsonValue(r'chat')
chat(r'chat'),
@JsonValue(r'bots')
bots(r'bots'),
@JsonValue(r'up_next')
upNext(r'up_next'),
@JsonValue(r'brief')
brief(r'brief'),
@JsonValue(r'talk')
talk(r'talk'),
@JsonValue(r'settings')
settings(r'settings');

const WatchEventsEventsInnerScreenEnum(this.value);

final String value;

@override
String toString() => value;
}



enum WatchEventsEventsInnerSurfaceEnum {
@JsonValue(r'app')
app(r'app'),
@JsonValue(r'notification')
notification(r'notification'),
@JsonValue(r'complication')
complication(r'complication'),
@JsonValue(r'smart_stack')
smartStack(r'smart_stack'),
@JsonValue(r'tile')
tile(r'tile'),
@JsonValue(r'control')
control(r'control'),
@JsonValue(r'siri')
siri(r'siri');

const WatchEventsEventsInnerSurfaceEnum(this.value);

final String value;

@override
String toString() => value;
}


