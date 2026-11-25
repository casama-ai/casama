//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_first_steps.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthFirstSteps {
  /// Returns a new [AdminGrowthFirstSteps] instance.
  AdminGrowthFirstSteps({

    required  this.signedUp,

    required  this.madeBot,

    required  this.sentMessage,

    required  this.firstValue,

    required  this.cameBack,
  });

  @JsonKey(
    
    name: r'signed_up',
    required: true,
    includeIfNull: false,
  )


  final int signedUp;



  @JsonKey(
    
    name: r'made_bot',
    required: true,
    includeIfNull: false,
  )


  final int madeBot;



  @JsonKey(
    
    name: r'sent_message',
    required: true,
    includeIfNull: false,
  )


  final int sentMessage;



  @JsonKey(
    
    name: r'first_value',
    required: true,
    includeIfNull: false,
  )


  final int firstValue;



  @JsonKey(
    
    name: r'came_back',
    required: true,
    includeIfNull: false,
  )


  final int cameBack;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthFirstSteps &&
      other.signedUp == signedUp &&
      other.madeBot == madeBot &&
      other.sentMessage == sentMessage &&
      other.firstValue == firstValue &&
      other.cameBack == cameBack;

    @override
    int get hashCode =>
        signedUp.hashCode +
        madeBot.hashCode +
        sentMessage.hashCode +
        firstValue.hashCode +
        cameBack.hashCode;

  factory AdminGrowthFirstSteps.fromJson(Map<String, dynamic> json) => _$AdminGrowthFirstStepsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthFirstStepsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

