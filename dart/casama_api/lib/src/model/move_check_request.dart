//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_check_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveCheckRequest {
  /// Returns a new [MoveCheckRequest] instance.
  MoveCheckRequest({

    required  this.targetUrl,

    required  this.token,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveCheckRequest &&
      other.targetUrl == targetUrl &&
      other.token == token;

    @override
    int get hashCode =>
        targetUrl.hashCode +
        token.hashCode;

  factory MoveCheckRequest.fromJson(Map<String, dynamic> json) => _$MoveCheckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCheckRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

