//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_part_received.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MovePartReceived {
  /// Returns a new [MovePartReceived] instance.
  MovePartReceived({

    required  this.n,

    required  this.size,

    required  this.sha256,
  });

  @JsonKey(
    
    name: r'n',
    required: true,
    includeIfNull: false,
  )


  final int n;



  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;



  @JsonKey(
    
    name: r'sha256',
    required: true,
    includeIfNull: false,
  )


  final String sha256;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MovePartReceived &&
      other.n == n &&
      other.size == size &&
      other.sha256 == sha256;

    @override
    int get hashCode =>
        n.hashCode +
        size.hashCode +
        sha256.hashCode;

  factory MovePartReceived.fromJson(Map<String, dynamic> json) => _$MovePartReceivedFromJson(json);

  Map<String, dynamic> toJson() => _$MovePartReceivedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

