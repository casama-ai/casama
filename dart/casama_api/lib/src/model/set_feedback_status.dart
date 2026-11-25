//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/feedback_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_feedback_status.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetFeedbackStatus {
  /// Returns a new [SetFeedbackStatus] instance.
  SetFeedbackStatus({

    required  this.status,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final FeedbackStatus status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetFeedbackStatus &&
      other.status == status;

    @override
    int get hashCode =>
        status.hashCode;

  factory SetFeedbackStatus.fromJson(Map<String, dynamic> json) => _$SetFeedbackStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SetFeedbackStatusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

