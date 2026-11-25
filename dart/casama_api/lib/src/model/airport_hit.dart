//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'airport_hit.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AirportHit {
  /// Returns a new [AirportHit] instance.
  AirportHit({

    required  this.label,

    required  this.codes,

    required  this.country,

     this.name,

    required  this.kind,
  });

  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: false,
  )


  final String label;



  @JsonKey(
    
    name: r'codes',
    required: true,
    includeIfNull: false,
  )


  final List<String> codes;



  @JsonKey(
    
    name: r'country',
    required: true,
    includeIfNull: false,
  )


  final String country;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final AirportHitKindEnum kind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AirportHit &&
      other.label == label &&
      other.codes == codes &&
      other.country == country &&
      other.name == name &&
      other.kind == kind;

    @override
    int get hashCode =>
        label.hashCode +
        codes.hashCode +
        country.hashCode +
        name.hashCode +
        kind.hashCode;

  factory AirportHit.fromJson(Map<String, dynamic> json) => _$AirportHitFromJson(json);

  Map<String, dynamic> toJson() => _$AirportHitToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AirportHitKindEnum {
@JsonValue(r'city')
city(r'city'),
@JsonValue(r'airport')
airport(r'airport');

const AirportHitKindEnum(this.value);

final String value;

@override
String toString() => value;
}


