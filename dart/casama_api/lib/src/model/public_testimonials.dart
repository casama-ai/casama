//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/public_testimonial.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_testimonials.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublicTestimonials {
  /// Returns a new [PublicTestimonials] instance.
  PublicTestimonials({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<PublicTestimonial> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PublicTestimonials &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory PublicTestimonials.fromJson(Map<String, dynamic> json) => _$PublicTestimonialsFromJson(json);

  Map<String, dynamic> toJson() => _$PublicTestimonialsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

