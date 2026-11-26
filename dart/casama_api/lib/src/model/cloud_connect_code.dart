//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_connect_code.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudConnectCode {
  /// Returns a new [CloudConnectCode] instance.
  CloudConnectCode({

    required  this.code,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudConnectCode &&
      other.code == code &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        code.hashCode +
        expiresAt.hashCode;

  factory CloudConnectCode.fromJson(Map<String, dynamic> json) => _$CloudConnectCodeFromJson(json);

  Map<String, dynamic> toJson() => _$CloudConnectCodeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

