//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/airport_hit.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'airport_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AirportList {
  /// Returns a new [AirportList] instance.
  AirportList({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<AirportHit> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AirportList &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory AirportList.fromJson(Map<String, dynamic> json) => _$AirportListFromJson(json);

  Map<String, dynamic> toJson() => _$AirportListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

