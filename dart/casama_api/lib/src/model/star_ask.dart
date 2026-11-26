//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'star_ask.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarAsk {
  /// Returns a new [StarAsk] instance.
  StarAsk({

    required  this.ask,

    required  this.developer,
  });

  @JsonKey(
    
    name: r'ask',
    required: true,
    includeIfNull: false,
  )


  final bool ask;



  @JsonKey(
    
    name: r'developer',
    required: true,
    includeIfNull: false,
  )


  final bool developer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarAsk &&
      other.ask == ask &&
      other.developer == developer;

    @override
    int get hashCode =>
        ask.hashCode +
        developer.hashCode;

  factory StarAsk.fromJson(Map<String, dynamic> json) => _$StarAskFromJson(json);

  Map<String, dynamic> toJson() => _$StarAskToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

