//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_change_preview_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlanChangePreviewRequest {
  /// Returns a new [PlanChangePreviewRequest] instance.
  PlanChangePreviewRequest({

    required  this.planCode,

     this.discountCode,
  });

  @JsonKey(
    
    name: r'plan_code',
    required: true,
    includeIfNull: false,
  )


  final String planCode;



      /// Discount code (case-insensitive, 3–64 letters, digits, hyphens or underscores)
  @JsonKey(
    
    name: r'discount_code',
    required: false,
    includeIfNull: false,
  )


  final String? discountCode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PlanChangePreviewRequest &&
      other.planCode == planCode &&
      other.discountCode == discountCode;

    @override
    int get hashCode =>
        planCode.hashCode +
        discountCode.hashCode;

  factory PlanChangePreviewRequest.fromJson(Map<String, dynamic> json) => _$PlanChangePreviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlanChangePreviewRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

