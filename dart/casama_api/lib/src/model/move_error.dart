//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_error.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveError {
  /// Returns a new [MoveError] instance.
  MoveError({

    required  this.code,

    required  this.message,

     this.step,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



  @JsonKey(
    
    name: r'step',
    required: false,
    includeIfNull: false,
  )


  final String? step;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveError &&
      other.code == code &&
      other.message == message &&
      other.step == step;

    @override
    int get hashCode =>
        code.hashCode +
        message.hashCode +
        (step == null ? 0 : step.hashCode);

  factory MoveError.fromJson(Map<String, dynamic> json) => _$MoveErrorFromJson(json);

  Map<String, dynamic> toJson() => _$MoveErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

