//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'waitlist_entry_invited_by.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WaitlistEntryInvitedBy {
  /// Returns a new [WaitlistEntryInvitedBy] instance.
  WaitlistEntryInvitedBy({

    required  this.name,

    required  this.invitesLeft,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: true,
  )


  final String? name;



  @JsonKey(
    
    name: r'invites_left',
    required: true,
    includeIfNull: false,
  )


  final int invitesLeft;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WaitlistEntryInvitedBy &&
      other.name == name &&
      other.invitesLeft == invitesLeft;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        invitesLeft.hashCode;

  factory WaitlistEntryInvitedBy.fromJson(Map<String, dynamic> json) => _$WaitlistEntryInvitedByFromJson(json);

  Map<String, dynamic> toJson() => _$WaitlistEntryInvitedByToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

