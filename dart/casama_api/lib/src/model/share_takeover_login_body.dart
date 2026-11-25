//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'share_takeover_login_body.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShareTakeoverLoginBody {
  /// Returns a new [ShareTakeoverLoginBody] instance.
  ShareTakeoverLoginBody({

    required  this.username,

    required  this.password,

     this.remember = true,
  });

      /// Email or username. Stored in Vault; never returned or shown to the bot
  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;



      /// Stored in Vault; never returned, logged or shown to the bot
  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



      /// Keep it for this bot's later runs; false deletes it when this run ends
  @JsonKey(
    defaultValue: true,
    name: r'remember',
    required: false,
    includeIfNull: false,
  )


  final bool? remember;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShareTakeoverLoginBody &&
      other.username == username &&
      other.password == password &&
      other.remember == remember;

    @override
    int get hashCode =>
        username.hashCode +
        password.hashCode +
        remember.hashCode;

  factory ShareTakeoverLoginBody.fromJson(Map<String, dynamic> json) => _$ShareTakeoverLoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ShareTakeoverLoginBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

