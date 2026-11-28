//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_capacity_computer_metrics_wakes_by_caller7d_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServerCapacityComputerMetricsWakesByCaller7dInner {
  /// Returns a new [ServerCapacityComputerMetricsWakesByCaller7dInner] instance.
  ServerCapacityComputerMetricsWakesByCaller7dInner({

    required  this.caller,

    required  this.count,
  });

  @JsonKey(
    
    name: r'caller',
    required: true,
    includeIfNull: false,
  )


  final String caller;



  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServerCapacityComputerMetricsWakesByCaller7dInner &&
      other.caller == caller &&
      other.count == count;

    @override
    int get hashCode =>
        caller.hashCode +
        count.hashCode;

  factory ServerCapacityComputerMetricsWakesByCaller7dInner.fromJson(Map<String, dynamic> json) => _$ServerCapacityComputerMetricsWakesByCaller7dInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ServerCapacityComputerMetricsWakesByCaller7dInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

