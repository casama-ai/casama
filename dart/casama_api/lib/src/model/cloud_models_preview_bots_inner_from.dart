//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_preview_bots_inner_from.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsPreviewBotsInnerFrom {
  /// Returns a new [CloudModelsPreviewBotsInnerFrom] instance.
  CloudModelsPreviewBotsInnerFrom({

    required  this.credentialId,

    required  this.provider,

    required  this.model,

    required  this.label,

    required  this.working,
  });

  @JsonKey(
    
    name: r'credential_id',
    required: true,
    includeIfNull: true,
  )


  final String? credentialId;



  @JsonKey(
    
    name: r'provider',
    required: true,
    includeIfNull: true,
  )


  final String? provider;



  @JsonKey(
    
    name: r'model',
    required: true,
    includeIfNull: true,
  )


  final String? model;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: true,
  )


  final String? label;



  @JsonKey(
    
    name: r'working',
    required: true,
    includeIfNull: false,
  )


  final bool working;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsPreviewBotsInnerFrom &&
      other.credentialId == credentialId &&
      other.provider == provider &&
      other.model == model &&
      other.label == label &&
      other.working == working;

    @override
    int get hashCode =>
        (credentialId == null ? 0 : credentialId.hashCode) +
        (provider == null ? 0 : provider.hashCode) +
        (model == null ? 0 : model.hashCode) +
        (label == null ? 0 : label.hashCode) +
        working.hashCode;

  factory CloudModelsPreviewBotsInnerFrom.fromJson(Map<String, dynamic> json) => _$CloudModelsPreviewBotsInnerFromFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsPreviewBotsInnerFromToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

