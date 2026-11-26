//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/move_check_after_reconnect_inner.dart';
import 'package:casama_api/src/model/move_check_after_keys.dart';
import 'package:casama_api/src/model/move_check_after_invites_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_check_after.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveCheckAfter {
  /// Returns a new [MoveCheckAfter] instance.
  MoveCheckAfter({

    required  this.reconnect,

    required  this.invites,

    required  this.keys,

    required  this.computers,

    required  this.chatgptPlans,
  });

  @JsonKey(
    
    name: r'reconnect',
    required: true,
    includeIfNull: false,
  )


  final List<MoveCheckAfterReconnectInner> reconnect;



  @JsonKey(
    
    name: r'invites',
    required: true,
    includeIfNull: false,
  )


  final List<MoveCheckAfterInvitesInner> invites;



  @JsonKey(
    
    name: r'keys',
    required: true,
    includeIfNull: false,
  )


  final MoveCheckAfterKeys keys;



  @JsonKey(
    
    name: r'computers',
    required: true,
    includeIfNull: false,
  )


  final num computers;



  @JsonKey(
    
    name: r'chatgpt_plans',
    required: true,
    includeIfNull: false,
  )


  final num chatgptPlans;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveCheckAfter &&
      other.reconnect == reconnect &&
      other.invites == invites &&
      other.keys == keys &&
      other.computers == computers &&
      other.chatgptPlans == chatgptPlans;

    @override
    int get hashCode =>
        reconnect.hashCode +
        invites.hashCode +
        keys.hashCode +
        computers.hashCode +
        chatgptPlans.hashCode;

  factory MoveCheckAfter.fromJson(Map<String, dynamic> json) => _$MoveCheckAfterFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCheckAfterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

