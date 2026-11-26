//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_token.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveToken {
  /// Returns a new [MoveToken] instance.
  MoveToken({

    required  this.moveId,

    required  this.token,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'move_id',
    required: true,
    includeIfNull: false,
  )


  final String moveId;



  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveToken &&
      other.moveId == moveId &&
      other.token == token &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        moveId.hashCode +
        token.hashCode +
        expiresAt.hashCode;

  factory MoveToken.fromJson(Map<String, dynamic> json) => _$MoveTokenFromJson(json);

  Map<String, dynamic> toJson() => _$MoveTokenToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

