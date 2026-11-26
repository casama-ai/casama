//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'referral_invites_waiting_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReferralInvitesWaitingInner {
  /// Returns a new [ReferralInvitesWaitingInner] instance.
  ReferralInvitesWaitingInner({

    required  this.id,

    required  this.emailHint,

    required  this.since,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'email_hint',
    required: true,
    includeIfNull: false,
  )


  final String emailHint;



  @JsonKey(
    
    name: r'since',
    required: true,
    includeIfNull: false,
  )


  final DateTime since;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReferralInvitesWaitingInner &&
      other.id == id &&
      other.emailHint == emailHint &&
      other.since == since;

    @override
    int get hashCode =>
        id.hashCode +
        emailHint.hashCode +
        since.hashCode;

  factory ReferralInvitesWaitingInner.fromJson(Map<String, dynamic> json) => _$ReferralInvitesWaitingInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralInvitesWaitingInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

