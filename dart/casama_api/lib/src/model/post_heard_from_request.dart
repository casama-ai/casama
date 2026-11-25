//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/heard_from.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_heard_from_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PostHeardFromRequest {
  /// Returns a new [PostHeardFromRequest] instance.
  PostHeardFromRequest({

    required  this.answer,
  });

  @JsonKey(
    
    name: r'answer',
    required: true,
    includeIfNull: true,
  )


  final HeardFrom? answer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PostHeardFromRequest &&
      other.answer == answer;

    @override
    int get hashCode =>
        (answer == null ? 0 : answer.hashCode);

  factory PostHeardFromRequest.fromJson(Map<String, dynamic> json) => _$PostHeardFromRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostHeardFromRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

