//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provider_account.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ProviderAccount {
  /// Returns a new [ProviderAccount] instance.
  ProviderAccount({

    required  this.app,

    required  this.status,

     this.reconnectRecommended,
  });

  @JsonKey(
    
    name: r'app',
    required: true,
    includeIfNull: false,
  )


  final String app;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final ProviderAccountStatusEnum status;



      /// True when this app can switch to Casama's own OAuth sign-in (lower call cost); reconnecting replaces the older managed sign-in.
  @JsonKey(
    
    name: r'reconnect_recommended',
    required: false,
    includeIfNull: false,
  )


  final bool? reconnectRecommended;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ProviderAccount &&
      other.app == app &&
      other.status == status &&
      other.reconnectRecommended == reconnectRecommended;

    @override
    int get hashCode =>
        app.hashCode +
        status.hashCode +
        reconnectRecommended.hashCode;

  factory ProviderAccount.fromJson(Map<String, dynamic> json) => _$ProviderAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderAccountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum ProviderAccountStatusEnum {
@JsonValue(r'connected')
connected(r'connected'),
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'error')
error(r'error');

const ProviderAccountStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


