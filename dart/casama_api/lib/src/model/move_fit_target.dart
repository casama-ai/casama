//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_fit_target.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveFitTarget {
  /// Returns a new [MoveFitTarget] instance.
  MoveFitTarget({

    required  this.orgId,

    required  this.name,

    required  this.empty,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'empty',
    required: true,
    includeIfNull: false,
  )


  final bool empty;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveFitTarget &&
      other.orgId == orgId &&
      other.name == name &&
      other.empty == empty;

    @override
    int get hashCode =>
        orgId.hashCode +
        name.hashCode +
        empty.hashCode;

  factory MoveFitTarget.fromJson(Map<String, dynamic> json) => _$MoveFitTargetFromJson(json);

  Map<String, dynamic> toJson() => _$MoveFitTargetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

