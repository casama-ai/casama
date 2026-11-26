//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_policy.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsPolicy {
  /// Returns a new [CloudModelsPolicy] instance.
  CloudModelsPolicy({

    required  this.allowed,

    required  this.dailyUsdPerMember,
  });

      /// \"all\", or the user ids who may use Casama Cloud
  @JsonKey(
    
    name: r'allowed',
    required: true,
    includeIfNull: true,
  )


  final Object? allowed;



          // minimum: 0
          // maximum: 100000
  @JsonKey(
    
    name: r'daily_usd_per_member',
    required: true,
    includeIfNull: true,
  )


  final num? dailyUsdPerMember;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsPolicy &&
      other.allowed == allowed &&
      other.dailyUsdPerMember == dailyUsdPerMember;

    @override
    int get hashCode =>
        (allowed == null ? 0 : allowed.hashCode) +
        (dailyUsdPerMember == null ? 0 : dailyUsdPerMember.hashCode);

  factory CloudModelsPolicy.fromJson(Map<String, dynamic> json) => _$CloudModelsPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsPolicyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

