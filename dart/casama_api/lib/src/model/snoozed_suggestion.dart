//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snoozed_suggestion.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SnoozedSuggestion {
  /// Returns a new [SnoozedSuggestion] instance.
  SnoozedSuggestion({

    required  this.ok,

    required  this.snoozedUntil,

     this.expired = false,
  });

  @JsonKey(
    
    name: r'ok',
    required: true,
    includeIfNull: false,
  )


  final bool ok;



  @JsonKey(
    
    name: r'snoozed_until',
    required: true,
    includeIfNull: true,
  )


  final DateTime? snoozedUntil;



  @JsonKey(
    defaultValue: false,
    name: r'expired',
    required: false,
    includeIfNull: false,
  )


  final bool? expired;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SnoozedSuggestion &&
      other.ok == ok &&
      other.snoozedUntil == snoozedUntil &&
      other.expired == expired;

    @override
    int get hashCode =>
        ok.hashCode +
        (snoozedUntil == null ? 0 : snoozedUntil.hashCode) +
        expired.hashCode;

  factory SnoozedSuggestion.fromJson(Map<String, dynamic> json) => _$SnoozedSuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SnoozedSuggestionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

