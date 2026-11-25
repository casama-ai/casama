//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_costs_series_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCostsSeriesInner {
  /// Returns a new [AdminCostsSeriesInner] instance.
  AdminCostsSeriesInner({

    required  this.id,

    required  this.label,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: false,
  )


  final String label;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCostsSeriesInner &&
      other.id == id &&
      other.label == label;

    @override
    int get hashCode =>
        id.hashCode +
        label.hashCode;

  factory AdminCostsSeriesInner.fromJson(Map<String, dynamic> json) => _$AdminCostsSeriesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostsSeriesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

