//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_check_after_reconnect_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveCheckAfterReconnectInner {
  /// Returns a new [MoveCheckAfterReconnectInner] instance.
  MoveCheckAfterReconnectInner({

    required  this.id,

    required  this.name,

    required  this.kind,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final String kind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveCheckAfterReconnectInner &&
      other.id == id &&
      other.name == name &&
      other.kind == kind;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        kind.hashCode;

  factory MoveCheckAfterReconnectInner.fromJson(Map<String, dynamic> json) => _$MoveCheckAfterReconnectInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCheckAfterReconnectInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

