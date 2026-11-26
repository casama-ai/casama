//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_start_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveStartRequest {
  /// Returns a new [MoveStartRequest] instance.
  MoveStartRequest({

    required  this.targetUrl,

    required  this.token,

     this.bringKeys = true,
  });

  @JsonKey(
    
    name: r'target_url',
    required: true,
    includeIfNull: false,
  )


  final String targetUrl;



  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



  @JsonKey(
    defaultValue: true,
    name: r'bring_keys',
    required: false,
    includeIfNull: false,
  )


  final bool? bringKeys;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveStartRequest &&
      other.targetUrl == targetUrl &&
      other.token == token &&
      other.bringKeys == bringKeys;

    @override
    int get hashCode =>
        targetUrl.hashCode +
        token.hashCode +
        bringKeys.hashCode;

  factory MoveStartRequest.fromJson(Map<String, dynamic> json) => _$MoveStartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MoveStartRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

