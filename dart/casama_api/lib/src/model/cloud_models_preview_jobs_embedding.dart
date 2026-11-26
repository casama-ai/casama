//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_preview_jobs_embedding.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsPreviewJobsEmbedding {
  /// Returns a new [CloudModelsPreviewJobsEmbedding] instance.
  CloudModelsPreviewJobsEmbedding({

    required  this.hasOwn,
  });

  @JsonKey(
    
    name: r'has_own',
    required: true,
    includeIfNull: false,
  )


  final bool hasOwn;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsPreviewJobsEmbedding &&
      other.hasOwn == hasOwn;

    @override
    int get hashCode =>
        hasOwn.hashCode;

  factory CloudModelsPreviewJobsEmbedding.fromJson(Map<String, dynamic> json) => _$CloudModelsPreviewJobsEmbeddingFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsPreviewJobsEmbeddingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

