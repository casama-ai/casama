//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_sent.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FeedbackSent {
  /// Returns a new [FeedbackSent] instance.
  FeedbackSent({

    required  this.id,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FeedbackSent &&
      other.id == id;

    @override
    int get hashCode =>
        id.hashCode;

  factory FeedbackSent.fromJson(Map<String, dynamic> json) => _$FeedbackSentFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackSentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

