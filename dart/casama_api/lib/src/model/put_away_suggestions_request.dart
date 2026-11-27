//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'put_away_suggestions_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PutAwaySuggestionsRequest {
  /// Returns a new [PutAwaySuggestionsRequest] instance.
  PutAwaySuggestionsRequest({

    required  this.ids,
  });

  @JsonKey(
    
    name: r'ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> ids;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PutAwaySuggestionsRequest &&
      other.ids == ids;

    @override
    int get hashCode =>
        ids.hashCode;

  factory PutAwaySuggestionsRequest.fromJson(Map<String, dynamic> json) => _$PutAwaySuggestionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutAwaySuggestionsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

