//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_check_after_keys.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveCheckAfterKeys {
  /// Returns a new [MoveCheckAfterKeys] instance.
  MoveCheckAfterKeys({

    required  this.models,

    required  this.chatApps,

    required  this.secrets,
  });

  @JsonKey(
    
    name: r'models',
    required: true,
    includeIfNull: false,
  )


  final num models;



  @JsonKey(
    
    name: r'chat_apps',
    required: true,
    includeIfNull: false,
  )


  final num chatApps;



  @JsonKey(
    
    name: r'secrets',
    required: true,
    includeIfNull: false,
  )


  final num secrets;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveCheckAfterKeys &&
      other.models == models &&
      other.chatApps == chatApps &&
      other.secrets == secrets;

    @override
    int get hashCode =>
        models.hashCode +
        chatApps.hashCode +
        secrets.hashCode;

  factory MoveCheckAfterKeys.fromJson(Map<String, dynamic> json) => _$MoveCheckAfterKeysFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCheckAfterKeysToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

