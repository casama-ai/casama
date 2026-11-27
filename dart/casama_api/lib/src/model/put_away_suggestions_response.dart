//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'put_away_suggestions_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PutAwaySuggestionsResponse {
  /// Returns a new [PutAwaySuggestionsResponse] instance.
  PutAwaySuggestionsResponse({

    required  this.ok,

    required  this.count,
  });

  @JsonKey(
    
    name: r'ok',
    required: true,
    includeIfNull: false,
  )


  final bool ok;



          // minimum: 0
  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PutAwaySuggestionsResponse &&
      other.ok == ok &&
      other.count == count;

    @override
    int get hashCode =>
        ok.hashCode +
        count.hashCode;

  factory PutAwaySuggestionsResponse.fromJson(Map<String, dynamic> json) => _$PutAwaySuggestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PutAwaySuggestionsResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

