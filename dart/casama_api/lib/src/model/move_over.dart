//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_over.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveOver {
  /// Returns a new [MoveOver] instance.
  MoveOver({

    required  this.what,

    required  this.have,

    required  this.limit,
  });

  @JsonKey(
    
    name: r'what',
    required: true,
    includeIfNull: false,
  )


  final MoveOverWhatEnum what;



  @JsonKey(
    
    name: r'have',
    required: true,
    includeIfNull: false,
  )


  final num have;



  @JsonKey(
    
    name: r'limit',
    required: true,
    includeIfNull: false,
  )


  final num limit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveOver &&
      other.what == what &&
      other.have == have &&
      other.limit == limit;

    @override
    int get hashCode =>
        what.hashCode +
        have.hashCode +
        limit.hashCode;

  factory MoveOver.fromJson(Map<String, dynamic> json) => _$MoveOverFromJson(json);

  Map<String, dynamic> toJson() => _$MoveOverToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum MoveOverWhatEnum {
@JsonValue(r'people')
people(r'people'),
@JsonValue(r'bots')
bots(r'bots'),
@JsonValue(r'computers')
computers(r'computers'),
@JsonValue(r'storage')
storage(r'storage');

const MoveOverWhatEnum(this.value);

final String value;

@override
String toString() => value;
}


