//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selfhost_status.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfhostStatus {
  /// Returns a new [SelfhostStatus] instance.
  SelfhostStatus({

    required  this.licensing,

     this.state,

     this.edition,

     this.instanceId,

     this.expiresAt,

     this.graceUntil,

     this.members,

     this.seats,

     this.engineVersion,
  });

  @JsonKey(
    
    name: r'licensing',
    required: true,
    includeIfNull: false,
  )


  final bool licensing;



  @JsonKey(
    
    name: r'state',
    required: false,
    includeIfNull: false,
  )


  final SelfhostStatusStateEnum? state;



  @JsonKey(
    
    name: r'edition',
    required: false,
    includeIfNull: false,
  )


  final SelfhostStatusEditionEnum? edition;



  @JsonKey(
    
    name: r'instance_id',
    required: false,
    includeIfNull: false,
  )


  final String? instanceId;



  @JsonKey(
    
    name: r'expires_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? expiresAt;



  @JsonKey(
    
    name: r'grace_until',
    required: false,
    includeIfNull: false,
  )


  final DateTime? graceUntil;



  @JsonKey(
    
    name: r'members',
    required: false,
    includeIfNull: false,
  )


  final int? members;



  @JsonKey(
    
    name: r'seats',
    required: false,
    includeIfNull: false,
  )


  final int? seats;



  @JsonKey(
    
    name: r'engine_version',
    required: false,
    includeIfNull: false,
  )


  final String? engineVersion;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfhostStatus &&
      other.licensing == licensing &&
      other.state == state &&
      other.edition == edition &&
      other.instanceId == instanceId &&
      other.expiresAt == expiresAt &&
      other.graceUntil == graceUntil &&
      other.members == members &&
      other.seats == seats &&
      other.engineVersion == engineVersion;

    @override
    int get hashCode =>
        licensing.hashCode +
        state.hashCode +
        (edition == null ? 0 : edition.hashCode) +
        instanceId.hashCode +
        (expiresAt == null ? 0 : expiresAt.hashCode) +
        (graceUntil == null ? 0 : graceUntil.hashCode) +
        members.hashCode +
        (seats == null ? 0 : seats.hashCode) +
        engineVersion.hashCode;

  factory SelfhostStatus.fromJson(Map<String, dynamic> json) => _$SelfhostStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SelfhostStatusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SelfhostStatusStateEnum {
@JsonValue(r'setup')
setup(r'setup'),
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'grace')
grace(r'grace'),
@JsonValue(r'expired')
expired(r'expired');

const SelfhostStatusStateEnum(this.value);

final String value;

@override
String toString() => value;
}



enum SelfhostStatusEditionEnum {
@JsonValue(r'personal')
personal(r'personal'),
@JsonValue(r'trial')
trial(r'trial'),
@JsonValue(r'business')
business(r'business');

const SelfhostStatusEditionEnum(this.value);

final String value;

@override
String toString() => value;
}


