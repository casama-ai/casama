//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/account_age_band.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_age_band_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetAgeBandRequest {
  /// Returns a new [SetAgeBandRequest] instance.
  SetAgeBandRequest({

    required  this.ageBand,
  });

  @JsonKey(
    
    name: r'age_band',
    required: true,
    includeIfNull: true,
  )


  final AccountAgeBand? ageBand;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetAgeBandRequest &&
      other.ageBand == ageBand;

    @override
    int get hashCode =>
        (ageBand == null ? 0 : ageBand.hashCode);

  factory SetAgeBandRequest.fromJson(Map<String, dynamic> json) => _$SetAgeBandRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetAgeBandRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

