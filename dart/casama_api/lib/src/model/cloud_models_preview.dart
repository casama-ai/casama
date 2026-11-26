//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_preview_bots_inner.dart';
import 'package:casama_api/src/model/cloud_models_preview_jobs.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_preview.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsPreview {
  /// Returns a new [CloudModelsPreview] instance.
  CloudModelsPreview({

    required  this.bots,

    required  this.jobs,
  });

  @JsonKey(
    
    name: r'bots',
    required: true,
    includeIfNull: false,
  )


  final List<CloudModelsPreviewBotsInner> bots;



  @JsonKey(
    
    name: r'jobs',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPreviewJobs jobs;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsPreview &&
      other.bots == bots &&
      other.jobs == jobs;

    @override
    int get hashCode =>
        bots.hashCode +
        jobs.hashCode;

  factory CloudModelsPreview.fromJson(Map<String, dynamic> json) => _$CloudModelsPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsPreviewToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

