//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_state_me.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsStateMe {
  /// Returns a new [CloudModelsStateMe] instance.
  CloudModelsStateMe({

    required  this.allowed,

    required  this.todayUsd,

    required  this.limitUsd,
  });

  @JsonKey(
    
    name: r'allowed',
    required: true,
    includeIfNull: false,
  )


  final bool allowed;



  @JsonKey(
    
    name: r'today_usd',
    required: true,
    includeIfNull: false,
  )


  final num todayUsd;



  @JsonKey(
    
    name: r'limit_usd',
    required: true,
    includeIfNull: true,
  )


  final num? limitUsd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsStateMe &&
      other.allowed == allowed &&
      other.todayUsd == todayUsd &&
      other.limitUsd == limitUsd;

    @override
    int get hashCode =>
        allowed.hashCode +
        todayUsd.hashCode +
        (limitUsd == null ? 0 : limitUsd.hashCode);

  factory CloudModelsStateMe.fromJson(Map<String, dynamic> json) => _$CloudModelsStateMeFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsStateMeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

