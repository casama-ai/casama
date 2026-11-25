//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_platform.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthPlatform {
  /// Returns a new [AdminGrowthPlatform] instance.
  AdminGrowthPlatform({

    required  this.platform,

    required  this.signups,
  });

  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final String platform;



  @JsonKey(
    
    name: r'signups',
    required: true,
    includeIfNull: false,
  )


  final int signups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthPlatform &&
      other.platform == platform &&
      other.signups == signups;

    @override
    int get hashCode =>
        platform.hashCode +
        signups.hashCode;

  factory AdminGrowthPlatform.fromJson(Map<String, dynamic> json) => _$AdminGrowthPlatformFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthPlatformToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

