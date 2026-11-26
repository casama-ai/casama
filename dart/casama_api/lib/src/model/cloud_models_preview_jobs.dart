//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_preview_jobs_embedding.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_preview_jobs.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsPreviewJobs {
  /// Returns a new [CloudModelsPreviewJobs] instance.
  CloudModelsPreviewJobs({

    required  this.embedding,

    required  this.image,

    required  this.tts,

    required  this.stt,
  });

  @JsonKey(
    
    name: r'embedding',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPreviewJobsEmbedding embedding;



  @JsonKey(
    
    name: r'image',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPreviewJobsEmbedding image;



  @JsonKey(
    
    name: r'tts',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPreviewJobsEmbedding tts;



  @JsonKey(
    
    name: r'stt',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPreviewJobsEmbedding stt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsPreviewJobs &&
      other.embedding == embedding &&
      other.image == image &&
      other.tts == tts &&
      other.stt == stt;

    @override
    int get hashCode =>
        embedding.hashCode +
        image.hashCode +
        tts.hashCode +
        stt.hashCode;

  factory CloudModelsPreviewJobs.fromJson(Map<String, dynamic> json) => _$CloudModelsPreviewJobsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsPreviewJobsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

