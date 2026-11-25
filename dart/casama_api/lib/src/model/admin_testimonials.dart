//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_testimonial.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_testimonials.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTestimonials {
  /// Returns a new [AdminTestimonials] instance.
  AdminTestimonials({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<AdminTestimonial> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminTestimonials &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory AdminTestimonials.fromJson(Map<String, dynamic> json) => _$AdminTestimonialsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTestimonialsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

