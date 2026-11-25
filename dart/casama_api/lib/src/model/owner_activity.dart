//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/owner_event.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_activity.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerActivity {
  /// Returns a new [OwnerActivity] instance.
  OwnerActivity({

    required  this.items,

    required  this.today,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<OwnerEvent> items;



  @JsonKey(
    
    name: r'today',
    required: true,
    includeIfNull: false,
  )


  final Map<String, int> today;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerActivity &&
      other.items == items &&
      other.today == today;

    @override
    int get hashCode =>
        items.hashCode +
        today.hashCode;

  factory OwnerActivity.fromJson(Map<String, dynamic> json) => _$OwnerActivityFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerActivityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

