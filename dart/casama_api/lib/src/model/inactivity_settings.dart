//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/inactivity_step_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inactivity_settings.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InactivitySettings {
  /// Returns a new [InactivitySettings] instance.
  InactivitySettings({

    required  this.rest,

    required  this.files,

    required  this.removal,

    required  this.unconfirmed,

    required  this.announcedAt,
  });

  @JsonKey(
    
    name: r'rest',
    required: true,
    includeIfNull: false,
  )


  final InactivityStepMode rest;



  @JsonKey(
    
    name: r'files',
    required: true,
    includeIfNull: false,
  )


  final InactivityStepMode files;



  @JsonKey(
    
    name: r'removal',
    required: true,
    includeIfNull: false,
  )


  final InactivityStepMode removal;



  @JsonKey(
    
    name: r'unconfirmed',
    required: true,
    includeIfNull: false,
  )


  final InactivityStepMode unconfirmed;



  @JsonKey(
    
    name: r'announced_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? announcedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InactivitySettings &&
      other.rest == rest &&
      other.files == files &&
      other.removal == removal &&
      other.unconfirmed == unconfirmed &&
      other.announcedAt == announcedAt;

    @override
    int get hashCode =>
        rest.hashCode +
        files.hashCode +
        removal.hashCode +
        unconfirmed.hashCode +
        (announcedAt == null ? 0 : announcedAt.hashCode);

  factory InactivitySettings.fromJson(Map<String, dynamic> json) => _$InactivitySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InactivitySettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

