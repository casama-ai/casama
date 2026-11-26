//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/move_fit_plan.dart';
import 'package:casama_api/src/model/move_over.dart';
import 'package:casama_api/src/model/move_fit_target.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_fit.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveFit {
  /// Returns a new [MoveFit] instance.
  MoveFit({

    required  this.fits,

    required  this.plan,

    required  this.over,

    required  this.needsPlan,

    required  this.accepts,

    required  this.engineVersion,

    required  this.moveKey,

    required  this.target,
  });

  @JsonKey(
    
    name: r'fits',
    required: true,
    includeIfNull: false,
  )


  final bool fits;



  @JsonKey(
    
    name: r'plan',
    required: true,
    includeIfNull: true,
  )


  final MoveFitPlan? plan;



  @JsonKey(
    
    name: r'over',
    required: true,
    includeIfNull: false,
  )


  final List<MoveOver> over;



  @JsonKey(
    
    name: r'needs_plan',
    required: true,
    includeIfNull: true,
  )


  final MoveFitPlan? needsPlan;



  @JsonKey(
    
    name: r'accepts',
    required: true,
    includeIfNull: false,
  )


  final List<int> accepts;



  @JsonKey(
    
    name: r'engine_version',
    required: true,
    includeIfNull: false,
  )


  final String engineVersion;



  @JsonKey(
    
    name: r'move_key',
    required: true,
    includeIfNull: false,
  )


  final String moveKey;



  @JsonKey(
    
    name: r'target',
    required: true,
    includeIfNull: false,
  )


  final MoveFitTarget target;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveFit &&
      other.fits == fits &&
      other.plan == plan &&
      other.over == over &&
      other.needsPlan == needsPlan &&
      other.accepts == accepts &&
      other.engineVersion == engineVersion &&
      other.moveKey == moveKey &&
      other.target == target;

    @override
    int get hashCode =>
        fits.hashCode +
        (plan == null ? 0 : plan.hashCode) +
        over.hashCode +
        (needsPlan == null ? 0 : needsPlan.hashCode) +
        accepts.hashCode +
        engineVersion.hashCode +
        moveKey.hashCode +
        target.hashCode;

  factory MoveFit.fromJson(Map<String, dynamic> json) => _$MoveFitFromJson(json);

  Map<String, dynamic> toJson() => _$MoveFitToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

