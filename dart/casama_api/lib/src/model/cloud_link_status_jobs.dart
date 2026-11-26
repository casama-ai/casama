//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status_jobs.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatusJobs {
  /// Returns a new [CloudLinkStatusJobs] instance.
  CloudLinkStatusJobs({

     this.chat,

     this.background,

     this.embedding,

     this.image,

     this.tts,

     this.stt,
  });

  @JsonKey(
    
    name: r'chat',
    required: false,
    includeIfNull: false,
  )


  final String? chat;



  @JsonKey(
    
    name: r'background',
    required: false,
    includeIfNull: false,
  )


  final String? background;



  @JsonKey(
    
    name: r'embedding',
    required: false,
    includeIfNull: false,
  )


  final String? embedding;



  @JsonKey(
    
    name: r'image',
    required: false,
    includeIfNull: false,
  )


  final String? image;



  @JsonKey(
    
    name: r'tts',
    required: false,
    includeIfNull: false,
  )


  final String? tts;



  @JsonKey(
    
    name: r'stt',
    required: false,
    includeIfNull: false,
  )


  final String? stt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatusJobs &&
      other.chat == chat &&
      other.background == background &&
      other.embedding == embedding &&
      other.image == image &&
      other.tts == tts &&
      other.stt == stt;

    @override
    int get hashCode =>
        (chat == null ? 0 : chat.hashCode) +
        (background == null ? 0 : background.hashCode) +
        (embedding == null ? 0 : embedding.hashCode) +
        (image == null ? 0 : image.hashCode) +
        (tts == null ? 0 : tts.hashCode) +
        (stt == null ? 0 : stt.hashCode);

  factory CloudLinkStatusJobs.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusJobsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusJobsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

