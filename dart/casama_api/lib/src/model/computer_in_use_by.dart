//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'computer_in_use_by.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComputerInUseBy {
  /// Returns a new [ComputerInUseBy] instance.
  ComputerInUseBy({

    required  this.botId,

    required  this.botName,

    required  this.runId,

    required  this.conversationId,
  });

  @JsonKey(
    
    name: r'bot_id',
    required: true,
    includeIfNull: false,
  )


  final String botId;



  @JsonKey(
    
    name: r'bot_name',
    required: true,
    includeIfNull: false,
  )


  final String botName;



  @JsonKey(
    
    name: r'run_id',
    required: true,
    includeIfNull: false,
  )


  final String runId;



  @JsonKey(
    
    name: r'conversation_id',
    required: true,
    includeIfNull: true,
  )


  final String? conversationId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ComputerInUseBy &&
      other.botId == botId &&
      other.botName == botName &&
      other.runId == runId &&
      other.conversationId == conversationId;

    @override
    int get hashCode =>
        botId.hashCode +
        botName.hashCode +
        runId.hashCode +
        (conversationId == null ? 0 : conversationId.hashCode);

  factory ComputerInUseBy.fromJson(Map<String, dynamic> json) => _$ComputerInUseByFromJson(json);

  Map<String, dynamic> toJson() => _$ComputerInUseByToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

