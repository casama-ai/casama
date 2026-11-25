//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_failure.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthFailure {
  /// Returns a new [AdminGrowthFailure] instance.
  AdminGrowthFailure({

    required  this.code,

    required  this.runs,

    required  this.message,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'runs',
    required: true,
    includeIfNull: false,
  )


  final int runs;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: true,
  )


  final String? message;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthFailure &&
      other.code == code &&
      other.runs == runs &&
      other.message == message;

    @override
    int get hashCode =>
        code.hashCode +
        runs.hashCode +
        (message == null ? 0 : message.hashCode);

  factory AdminGrowthFailure.fromJson(Map<String, dynamic> json) => _$AdminGrowthFailureFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthFailureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

