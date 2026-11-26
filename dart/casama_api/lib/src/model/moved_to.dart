//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moved_to.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MovedTo {
  /// Returns a new [MovedTo] instance.
  MovedTo({

    required  this.url,

    required  this.at,

    required  this.moveId,

    required  this.target,

    required  this.message,
  });

  @JsonKey(
    
    name: r'url',
    required: true,
    includeIfNull: false,
  )


  final String url;



  @JsonKey(
    
    name: r'at',
    required: true,
    includeIfNull: false,
  )


  final DateTime at;



  @JsonKey(
    
    name: r'move_id',
    required: true,
    includeIfNull: false,
  )


  final String moveId;



  @JsonKey(
    
    name: r'target',
    required: true,
    includeIfNull: false,
  )


  final MovedToTargetEnum target;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MovedTo &&
      other.url == url &&
      other.at == at &&
      other.moveId == moveId &&
      other.target == target &&
      other.message == message;

    @override
    int get hashCode =>
        url.hashCode +
        at.hashCode +
        moveId.hashCode +
        target.hashCode +
        message.hashCode;

  factory MovedTo.fromJson(Map<String, dynamic> json) => _$MovedToFromJson(json);

  Map<String, dynamic> toJson() => _$MovedToToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum MovedToTargetEnum {
@JsonValue(r'cloud')
cloud(r'cloud'),
@JsonValue(r'server')
server(r'server');

const MovedToTargetEnum(this.value);

final String value;

@override
String toString() => value;
}


