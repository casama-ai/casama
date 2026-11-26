//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_state_memory_reindex.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsStateMemoryReindex {
  /// Returns a new [CloudModelsStateMemoryReindex] instance.
  CloudModelsStateMemoryReindex({

    required  this.done,

    required  this.total,
  });

  @JsonKey(
    
    name: r'done',
    required: true,
    includeIfNull: false,
  )


  final int done;



  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsStateMemoryReindex &&
      other.done == done &&
      other.total == total;

    @override
    int get hashCode =>
        done.hashCode +
        total.hashCode;

  factory CloudModelsStateMemoryReindex.fromJson(Map<String, dynamic> json) => _$CloudModelsStateMemoryReindexFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsStateMemoryReindexToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

