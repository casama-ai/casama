//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_day.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthDay {
  /// Returns a new [AdminGrowthDay] instance.
  AdminGrowthDay({

    required  this.date,

    required  this.signups,

    required  this.activePeople,

    required  this.messages,

    required  this.runsChat,

    required  this.runsRoutine,

    required  this.runsChannel,

    required  this.runsVoice,

    required  this.runsOther,

    required  this.runsFailed,

    required  this.ttftP50Ms,

    required  this.ttftP90Ms,
  });

  @JsonKey(
    
    name: r'date',
    required: true,
    includeIfNull: false,
  )


  final String date;



  @JsonKey(
    
    name: r'signups',
    required: true,
    includeIfNull: false,
  )


  final int signups;



  @JsonKey(
    
    name: r'active_people',
    required: true,
    includeIfNull: false,
  )


  final int activePeople;



  @JsonKey(
    
    name: r'messages',
    required: true,
    includeIfNull: false,
  )


  final int messages;



  @JsonKey(
    
    name: r'runs_chat',
    required: true,
    includeIfNull: false,
  )


  final int runsChat;



  @JsonKey(
    
    name: r'runs_routine',
    required: true,
    includeIfNull: false,
  )


  final int runsRoutine;



  @JsonKey(
    
    name: r'runs_channel',
    required: true,
    includeIfNull: false,
  )


  final int runsChannel;



  @JsonKey(
    
    name: r'runs_voice',
    required: true,
    includeIfNull: false,
  )


  final int runsVoice;



  @JsonKey(
    
    name: r'runs_other',
    required: true,
    includeIfNull: false,
  )


  final int runsOther;



  @JsonKey(
    
    name: r'runs_failed',
    required: true,
    includeIfNull: false,
  )


  final int runsFailed;



  @JsonKey(
    
    name: r'ttft_p50_ms',
    required: true,
    includeIfNull: true,
  )


  final int? ttftP50Ms;



  @JsonKey(
    
    name: r'ttft_p90_ms',
    required: true,
    includeIfNull: true,
  )


  final int? ttftP90Ms;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthDay &&
      other.date == date &&
      other.signups == signups &&
      other.activePeople == activePeople &&
      other.messages == messages &&
      other.runsChat == runsChat &&
      other.runsRoutine == runsRoutine &&
      other.runsChannel == runsChannel &&
      other.runsVoice == runsVoice &&
      other.runsOther == runsOther &&
      other.runsFailed == runsFailed &&
      other.ttftP50Ms == ttftP50Ms &&
      other.ttftP90Ms == ttftP90Ms;

    @override
    int get hashCode =>
        date.hashCode +
        signups.hashCode +
        activePeople.hashCode +
        messages.hashCode +
        runsChat.hashCode +
        runsRoutine.hashCode +
        runsChannel.hashCode +
        runsVoice.hashCode +
        runsOther.hashCode +
        runsFailed.hashCode +
        (ttftP50Ms == null ? 0 : ttftP50Ms.hashCode) +
        (ttftP90Ms == null ? 0 : ttftP90Ms.hashCode);

  factory AdminGrowthDay.fromJson(Map<String, dynamic> json) => _$AdminGrowthDayFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthDayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

