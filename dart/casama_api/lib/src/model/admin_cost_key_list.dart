//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_cost_key.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_cost_key_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCostKeyList {
  /// Returns a new [AdminCostKeyList] instance.
  AdminCostKeyList({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<AdminCostKey> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCostKeyList &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory AdminCostKeyList.fromJson(Map<String, dynamic> json) => _$AdminCostKeyListFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostKeyListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

