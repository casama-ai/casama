//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publish_feedback_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublishFeedbackRequest {
  /// Returns a new [PublishFeedbackRequest] instance.
  PublishFeedbackRequest({

    required  this.title,

     this.description = '',

     this.tag,
  });

  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    defaultValue: '',
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'tag',
    required: false,
    includeIfNull: false,
  )


  final String? tag;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PublishFeedbackRequest &&
      other.title == title &&
      other.description == description &&
      other.tag == tag;

    @override
    int get hashCode =>
        title.hashCode +
        description.hashCode +
        tag.hashCode;

  factory PublishFeedbackRequest.fromJson(Map<String, dynamic> json) => _$PublishFeedbackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PublishFeedbackRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

