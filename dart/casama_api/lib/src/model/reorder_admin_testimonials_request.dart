//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reorder_admin_testimonials_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReorderAdminTestimonialsRequest {
  /// Returns a new [ReorderAdminTestimonialsRequest] instance.
  ReorderAdminTestimonialsRequest({

    required  this.ids,
  });

  @JsonKey(
    
    name: r'ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> ids;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReorderAdminTestimonialsRequest &&
      other.ids == ids;

    @override
    int get hashCode =>
        ids.hashCode;

  factory ReorderAdminTestimonialsRequest.fromJson(Map<String, dynamic> json) => _$ReorderAdminTestimonialsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReorderAdminTestimonialsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

