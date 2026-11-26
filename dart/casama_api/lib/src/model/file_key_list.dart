//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/file_key.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_key_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FileKeyList {
  /// Returns a new [FileKeyList] instance.
  FileKeyList({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<FileKey> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FileKeyList &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory FileKeyList.fromJson(Map<String, dynamic> json) => _$FileKeyListFromJson(json);

  Map<String, dynamic> toJson() => _$FileKeyListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

