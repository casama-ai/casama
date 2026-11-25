//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_journey_steps.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerJourneySteps {
  /// Returns a new [OwnerJourneySteps] instance.
  OwnerJourneySteps({

    required  this.click,

    required  this.open,

    required  this.signup,

    required  this.chat,

    required  this.paying,
  });

  @JsonKey(
    
    name: r'click',
    required: true,
    includeIfNull: false,
  )


  final bool click;



  @JsonKey(
    
    name: r'open',
    required: true,
    includeIfNull: false,
  )


  final bool open;



  @JsonKey(
    
    name: r'signup',
    required: true,
    includeIfNull: false,
  )


  final bool signup;



  @JsonKey(
    
    name: r'chat',
    required: true,
    includeIfNull: false,
  )


  final bool chat;



  @JsonKey(
    
    name: r'paying',
    required: true,
    includeIfNull: false,
  )


  final bool paying;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerJourneySteps &&
      other.click == click &&
      other.open == open &&
      other.signup == signup &&
      other.chat == chat &&
      other.paying == paying;

    @override
    int get hashCode =>
        click.hashCode +
        open.hashCode +
        signup.hashCode +
        chat.hashCode +
        paying.hashCode;

  factory OwnerJourneySteps.fromJson(Map<String, dynamic> json) => _$OwnerJourneyStepsFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerJourneyStepsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

