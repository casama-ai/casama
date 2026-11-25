//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_user_keep_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetUserKeepRequest {
  /// Returns a new [SetUserKeepRequest] instance.
  SetUserKeepRequest({

    required  this.keep,

     this.note,
  });

  @JsonKey(
    
    name: r'keep',
    required: true,
    includeIfNull: false,
  )


  final bool keep;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetUserKeepRequest &&
      other.keep == keep &&
      other.note == note;

    @override
    int get hashCode =>
        keep.hashCode +
        note.hashCode;

  factory SetUserKeepRequest.fromJson(Map<String, dynamic> json) => _$SetUserKeepRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetUserKeepRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

