//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_source.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthSource {
  /// Returns a new [AdminGrowthSource] instance.
  AdminGrowthSource({

    required  this.source_,

    required  this.signups,
  });

  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final String source_;



  @JsonKey(
    
    name: r'signups',
    required: true,
    includeIfNull: false,
  )


  final int signups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthSource &&
      other.source_ == source_ &&
      other.signups == signups;

    @override
    int get hashCode =>
        source_.hashCode +
        signups.hashCode;

  factory AdminGrowthSource.fromJson(Map<String, dynamic> json) => _$AdminGrowthSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthSourceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

