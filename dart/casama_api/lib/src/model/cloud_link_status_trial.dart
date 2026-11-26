//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status_trial.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatusTrial {
  /// Returns a new [CloudLinkStatusTrial] instance.
  CloudLinkStatusTrial({

    required  this.remainingUsd,
  });

  @JsonKey(
    
    name: r'remaining_usd',
    required: true,
    includeIfNull: false,
  )


  final num remainingUsd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatusTrial &&
      other.remainingUsd == remainingUsd;

    @override
    int get hashCode =>
        remainingUsd.hashCode;

  factory CloudLinkStatusTrial.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusTrialFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusTrialToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

