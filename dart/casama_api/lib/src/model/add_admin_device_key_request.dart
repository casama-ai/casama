//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_admin_device_key_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddAdminDeviceKeyRequest {
  /// Returns a new [AddAdminDeviceKeyRequest] instance.
  AddAdminDeviceKeyRequest({

    required  this.name,

    required  this.publicKey,

     this.scope,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'public_key',
    required: true,
    includeIfNull: false,
  )


  final String publicKey;



  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final AddAdminDeviceKeyRequestScopeEnum? scope;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddAdminDeviceKeyRequest &&
      other.name == name &&
      other.publicKey == publicKey &&
      other.scope == scope;

    @override
    int get hashCode =>
        name.hashCode +
        publicKey.hashCode +
        scope.hashCode;

  factory AddAdminDeviceKeyRequest.fromJson(Map<String, dynamic> json) => _$AddAdminDeviceKeyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddAdminDeviceKeyRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AddAdminDeviceKeyRequestScopeEnum {
@JsonValue(r'full')
full(r'full'),
@JsonValue(r'read')
read(r'read');

const AddAdminDeviceKeyRequestScopeEnum(this.value);

final String value;

@override
String toString() => value;
}


