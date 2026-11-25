//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/inactivity_step_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_inactivity_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetInactivityRequest {
  /// Returns a new [SetInactivityRequest] instance.
  SetInactivityRequest({

     this.rest,

     this.files,

     this.removal,

     this.unconfirmed,
  });

  @JsonKey(
    
    name: r'rest',
    required: false,
    includeIfNull: false,
  )


  final InactivityStepMode? rest;



  @JsonKey(
    
    name: r'files',
    required: false,
    includeIfNull: false,
  )


  final InactivityStepMode? files;



  @JsonKey(
    
    name: r'removal',
    required: false,
    includeIfNull: false,
  )


  final InactivityStepMode? removal;



  @JsonKey(
    
    name: r'unconfirmed',
    required: false,
    includeIfNull: false,
  )


  final InactivityStepMode? unconfirmed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetInactivityRequest &&
      other.rest == rest &&
      other.files == files &&
      other.removal == removal &&
      other.unconfirmed == unconfirmed;

    @override
    int get hashCode =>
        rest.hashCode +
        files.hashCode +
        removal.hashCode +
        unconfirmed.hashCode;

  factory SetInactivityRequest.fromJson(Map<String, dynamic> json) => _$SetInactivityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetInactivityRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

