//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submitted_testimonial.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubmittedTestimonial {
  /// Returns a new [SubmittedTestimonial] instance.
  SubmittedTestimonial({

    required  this.ok,
  });

  @JsonKey(
    
    name: r'ok',
    required: true,
    includeIfNull: false,
  )


  final bool ok;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SubmittedTestimonial &&
      other.ok == ok;

    @override
    int get hashCode =>
        ok.hashCode;

  factory SubmittedTestimonial.fromJson(Map<String, dynamic> json) => _$SubmittedTestimonialFromJson(json);

  Map<String, dynamic> toJson() => _$SubmittedTestimonialToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

