//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/feedback_row.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FeedbackList {
  /// Returns a new [FeedbackList] instance.
  FeedbackList({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<FeedbackRow> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FeedbackList &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory FeedbackList.fromJson(Map<String, dynamic> json) => _$FeedbackListFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

