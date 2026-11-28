//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_routine_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateRoutineRequest {
  /// Returns a new [UpdateRoutineRequest] instance.
  UpdateRoutineRequest({

     this.name,

     this.instructions,

     this.scheduleCron,

     this.runAt,

     this.timezone,

     this.notify,

     this.enabled,

     this.endsAt,

     this.maxRuns,

     this.browser,

     this.computer,

     this.usesComputer,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'instructions',
    required: false,
    includeIfNull: false,
  )


  final String? instructions;



      /// A once routine given a cron becomes a repeating one
  @JsonKey(
    
    name: r'schedule_cron',
    required: false,
    includeIfNull: false,
  )


  final String? scheduleCron;



      /// A repeating routine given run_at becomes a once one
  @JsonKey(
    
    name: r'run_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? runAt;



  @JsonKey(
    
    name: r'timezone',
    required: false,
    includeIfNull: false,
  )


  final String? timezone;



  @JsonKey(
    
    name: r'notify',
    required: false,
    includeIfNull: false,
  )


  final bool? notify;



  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;



      /// When it switches itself off; null removes the end time
  @JsonKey(
    
    name: r'ends_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? endsAt;



      /// Runs left before it switches itself off, counted from now; null removes it
          // minimum: 1
          // maximum: 10000
  @JsonKey(
    
    name: r'max_runs',
    required: false,
    includeIfNull: false,
  )


  final int? maxRuns;



      /// Where its browser work happens (D-323 C13): \"computer\" (the bot's own), \"mine\" (your Chrome; waits until it's online) or \"mine_or_computer\"
  @JsonKey(
    
    name: r'browser',
    required: false,
    includeIfNull: false,
  )


  final UpdateRoutineRequestBrowserEnum? browser;



      /// Where its computer work happens (computer places): \"bot_computer\" (the bot's own, the default) or \"my_computer\" (your own computer, when it is on and lets the bot in)
  @JsonKey(
    
    name: r'computer',
    required: false,
    includeIfNull: false,
  )


  final UpdateRoutineRequestComputerEnum? computer;



      /// Whether its runs may use a computer at all (D-627). Off: no files, shell or computer browser, and no computer is started. Defaults to off for briefs and check-ins, on otherwise
  @JsonKey(
    
    name: r'uses_computer',
    required: false,
    includeIfNull: false,
  )


  final bool? usesComputer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateRoutineRequest &&
      other.name == name &&
      other.instructions == instructions &&
      other.scheduleCron == scheduleCron &&
      other.runAt == runAt &&
      other.timezone == timezone &&
      other.notify == notify &&
      other.enabled == enabled &&
      other.endsAt == endsAt &&
      other.maxRuns == maxRuns &&
      other.browser == browser &&
      other.computer == computer &&
      other.usesComputer == usesComputer;

    @override
    int get hashCode =>
        name.hashCode +
        instructions.hashCode +
        scheduleCron.hashCode +
        runAt.hashCode +
        timezone.hashCode +
        notify.hashCode +
        enabled.hashCode +
        (endsAt == null ? 0 : endsAt.hashCode) +
        (maxRuns == null ? 0 : maxRuns.hashCode) +
        browser.hashCode +
        computer.hashCode +
        usesComputer.hashCode;

  factory UpdateRoutineRequest.fromJson(Map<String, dynamic> json) => _$UpdateRoutineRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRoutineRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Where its browser work happens (D-323 C13): \"computer\" (the bot's own), \"mine\" (your Chrome; waits until it's online) or \"mine_or_computer\"
enum UpdateRoutineRequestBrowserEnum {
    /// Where its browser work happens (D-323 C13): \"computer\" (the bot's own), \"mine\" (your Chrome; waits until it's online) or \"mine_or_computer\"
@JsonValue(r'computer')
computer(r'computer'),
    /// Where its browser work happens (D-323 C13): \"computer\" (the bot's own), \"mine\" (your Chrome; waits until it's online) or \"mine_or_computer\"
@JsonValue(r'mine')
mine(r'mine'),
    /// Where its browser work happens (D-323 C13): \"computer\" (the bot's own), \"mine\" (your Chrome; waits until it's online) or \"mine_or_computer\"
@JsonValue(r'mine_or_computer')
mineOrComputer(r'mine_or_computer');

const UpdateRoutineRequestBrowserEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Where its computer work happens (computer places): \"bot_computer\" (the bot's own, the default) or \"my_computer\" (your own computer, when it is on and lets the bot in)
enum UpdateRoutineRequestComputerEnum {
    /// Where its computer work happens (computer places): \"bot_computer\" (the bot's own, the default) or \"my_computer\" (your own computer, when it is on and lets the bot in)
@JsonValue(r'bot_computer')
botComputer(r'bot_computer'),
    /// Where its computer work happens (computer places): \"bot_computer\" (the bot's own, the default) or \"my_computer\" (your own computer, when it is on and lets the bot in)
@JsonValue(r'my_computer')
myComputer(r'my_computer');

const UpdateRoutineRequestComputerEnum(this.value);

final String value;

@override
String toString() => value;
}


