//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'testimonial_ask.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TestimonialAsk {
  /// Returns a new [TestimonialAsk] instance.
  TestimonialAsk({

    required  this.canSend,

    required  this.nameShown,
  });

  @JsonKey(
    
    name: r'can_send',
    required: true,
    includeIfNull: false,
  )


  final bool canSend;



  @JsonKey(
    
    name: r'name_shown',
    required: true,
    includeIfNull: true,
  )


  final String? nameShown;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TestimonialAsk &&
      other.canSend == canSend &&
      other.nameShown == nameShown;

    @override
    int get hashCode =>
        canSend.hashCode +
        (nameShown == null ? 0 : nameShown.hashCode);

  factory TestimonialAsk.fromJson(Map<String, dynamic> json) => _$TestimonialAskFromJson(json);

  Map<String, dynamic> toJson() => _$TestimonialAskToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

