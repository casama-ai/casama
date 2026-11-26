//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selfhost_stats_by_edition_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfhostStatsByEditionInner {
  /// Returns a new [SelfhostStatsByEditionInner] instance.
  SelfhostStatsByEditionInner({

    required  this.edition,

    required  this.active,

    required  this.total,
  });

  @JsonKey(
    
    name: r'edition',
    required: true,
    includeIfNull: false,
  )


  final SelfhostStatsByEditionInnerEditionEnum edition;



  @JsonKey(
    
    name: r'active',
    required: true,
    includeIfNull: false,
  )


  final int active;



  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfhostStatsByEditionInner &&
      other.edition == edition &&
      other.active == active &&
      other.total == total;

    @override
    int get hashCode =>
        edition.hashCode +
        active.hashCode +
        total.hashCode;

  factory SelfhostStatsByEditionInner.fromJson(Map<String, dynamic> json) => _$SelfhostStatsByEditionInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SelfhostStatsByEditionInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SelfhostStatsByEditionInnerEditionEnum {
@JsonValue(r'personal')
personal(r'personal'),
@JsonValue(r'trial')
trial(r'trial'),
@JsonValue(r'business')
business(r'business');

const SelfhostStatsByEditionInnerEditionEnum(this.value);

final String value;

@override
String toString() => value;
}


