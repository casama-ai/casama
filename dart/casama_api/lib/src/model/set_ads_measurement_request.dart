//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_ads_measurement_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetAdsMeasurementRequest {
  /// Returns a new [SetAdsMeasurementRequest] instance.
  SetAdsMeasurementRequest({

    required  this.on_,
  });

  @JsonKey(
    
    name: r'on',
    required: true,
    includeIfNull: false,
  )


  final bool on_;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetAdsMeasurementRequest &&
      other.on_ == on_;

    @override
    int get hashCode =>
        on_.hashCode;

  factory SetAdsMeasurementRequest.fromJson(Map<String, dynamic> json) => _$SetAdsMeasurementRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetAdsMeasurementRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

