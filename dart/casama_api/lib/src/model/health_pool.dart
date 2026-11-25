//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'health_pool.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HealthPool {
  /// Returns a new [HealthPool] instance.
  HealthPool({

    required  this.max,

    required  this.inUse,

    required  this.waiting,
  });

  @JsonKey(
    
    name: r'max',
    required: true,
    includeIfNull: false,
  )


  final int max;



  @JsonKey(
    
    name: r'in_use',
    required: true,
    includeIfNull: false,
  )


  final int inUse;



  @JsonKey(
    
    name: r'waiting',
    required: true,
    includeIfNull: false,
  )


  final int waiting;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HealthPool &&
      other.max == max &&
      other.inUse == inUse &&
      other.waiting == waiting;

    @override
    int get hashCode =>
        max.hashCode +
        inUse.hashCode +
        waiting.hashCode;

  factory HealthPool.fromJson(Map<String, dynamic> json) => _$HealthPoolFromJson(json);

  Map<String, dynamic> toJson() => _$HealthPoolToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

