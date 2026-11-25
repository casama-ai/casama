//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminUser {
  /// Returns a new [AdminUser] instance.
  AdminUser({

    required  this.id,

    required  this.email,

    required  this.createdAt,

    required  this.lastSignInAt,

    required  this.orgs,

     this.lastActiveAt,

     this.inactivityState,

     this.keep,

     this.team,

     this.owner,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'last_sign_in_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastSignInAt;



  @JsonKey(
    
    name: r'orgs',
    required: true,
    includeIfNull: false,
  )


  final int orgs;



  @JsonKey(
    
    name: r'last_active_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? lastActiveAt;



  @JsonKey(
    
    name: r'inactivity_state',
    required: false,
    includeIfNull: false,
  )


  final AdminUserInactivityStateEnum? inactivityState;



  @JsonKey(
    
    name: r'keep',
    required: false,
    includeIfNull: false,
  )


  final bool? keep;



  @JsonKey(
    
    name: r'team',
    required: false,
    includeIfNull: false,
  )


  final bool? team;



  @JsonKey(
    
    name: r'owner',
    required: false,
    includeIfNull: false,
  )


  final bool? owner;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminUser &&
      other.id == id &&
      other.email == email &&
      other.createdAt == createdAt &&
      other.lastSignInAt == lastSignInAt &&
      other.orgs == orgs &&
      other.lastActiveAt == lastActiveAt &&
      other.inactivityState == inactivityState &&
      other.keep == keep &&
      other.team == team &&
      other.owner == owner;

    @override
    int get hashCode =>
        id.hashCode +
        (email == null ? 0 : email.hashCode) +
        createdAt.hashCode +
        (lastSignInAt == null ? 0 : lastSignInAt.hashCode) +
        orgs.hashCode +
        (lastActiveAt == null ? 0 : lastActiveAt.hashCode) +
        inactivityState.hashCode +
        keep.hashCode +
        team.hashCode +
        owner.hashCode;

  factory AdminUser.fromJson(Map<String, dynamic> json) => _$AdminUserFromJson(json);

  Map<String, dynamic> toJson() => _$AdminUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminUserInactivityStateEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'resting')
resting(r'resting'),
@JsonValue(r'files_soon')
filesSoon(r'files_soon'),
@JsonValue(r'removal_soon')
removalSoon(r'removal_soon'),
@JsonValue(r'removing')
removing(r'removing');

const AdminUserInactivityStateEnum(this.value);

final String value;

@override
String toString() => value;
}


