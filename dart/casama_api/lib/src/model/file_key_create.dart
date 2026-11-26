//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_key_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FileKeyCreate {
  /// Returns a new [FileKeyCreate] instance.
  FileKeyCreate({

    required  this.orgId,

    required  this.platform,

     this.label,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final FileKeyCreatePlatformEnum platform;



  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FileKeyCreate &&
      other.orgId == orgId &&
      other.platform == platform &&
      other.label == label;

    @override
    int get hashCode =>
        orgId.hashCode +
        platform.hashCode +
        label.hashCode;

  factory FileKeyCreate.fromJson(Map<String, dynamic> json) => _$FileKeyCreateFromJson(json);

  Map<String, dynamic> toJson() => _$FileKeyCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum FileKeyCreatePlatformEnum {
@JsonValue(r'ios')
ios(r'ios'),
@JsonValue(r'macos')
macos(r'macos');

const FileKeyCreatePlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


