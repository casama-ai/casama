//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_key.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FileKey {
  /// Returns a new [FileKey] instance.
  FileKey({

    required  this.id,

    required  this.orgId,

    required  this.platform,

    required  this.label,

    required  this.lastUsedAt,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



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


  final FileKeyPlatformEnum platform;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: true,
  )


  final String? label;



  @JsonKey(
    
    name: r'last_used_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastUsedAt;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FileKey &&
      other.id == id &&
      other.orgId == orgId &&
      other.platform == platform &&
      other.label == label &&
      other.lastUsedAt == lastUsedAt &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        platform.hashCode +
        (label == null ? 0 : label.hashCode) +
        (lastUsedAt == null ? 0 : lastUsedAt.hashCode) +
        createdAt.hashCode;

  factory FileKey.fromJson(Map<String, dynamic> json) => _$FileKeyFromJson(json);

  Map<String, dynamic> toJson() => _$FileKeyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum FileKeyPlatformEnum {
@JsonValue(r'ios')
ios(r'ios'),
@JsonValue(r'macos')
macos(r'macos');

const FileKeyPlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


