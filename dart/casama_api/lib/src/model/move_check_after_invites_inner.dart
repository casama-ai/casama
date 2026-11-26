//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_check_after_invites_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveCheckAfterInvitesInner {
  /// Returns a new [MoveCheckAfterInvitesInner] instance.
  MoveCheckAfterInvitesInner({

    required  this.name,

    required  this.email,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveCheckAfterInvitesInner &&
      other.name == name &&
      other.email == email;

    @override
    int get hashCode =>
        name.hashCode +
        email.hashCode;

  factory MoveCheckAfterInvitesInner.fromJson(Map<String, dynamic> json) => _$MoveCheckAfterInvitesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCheckAfterInvitesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

