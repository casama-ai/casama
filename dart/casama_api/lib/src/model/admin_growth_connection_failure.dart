//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_connection_failure.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthConnectionFailure {
  /// Returns a new [AdminGrowthConnectionFailure] instance.
  AdminGrowthConnectionFailure({

    required  this.detail,

    required  this.count,
  });

  @JsonKey(
    
    name: r'detail',
    required: true,
    includeIfNull: false,
  )


  final String detail;



  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthConnectionFailure &&
      other.detail == detail &&
      other.count == count;

    @override
    int get hashCode =>
        detail.hashCode +
        count.hashCode;

  factory AdminGrowthConnectionFailure.fromJson(Map<String, dynamic> json) => _$AdminGrowthConnectionFailureFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthConnectionFailureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

