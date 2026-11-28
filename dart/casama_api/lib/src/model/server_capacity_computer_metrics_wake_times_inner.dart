//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_capacity_computer_metrics_wake_times_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServerCapacityComputerMetricsWakeTimesInner {
  /// Returns a new [ServerCapacityComputerMetricsWakeTimesInner] instance.
  ServerCapacityComputerMetricsWakeTimesInner({

    required  this.mode,

    required  this.count,

    required  this.p50Ms,

    required  this.p90Ms,
  });

  @JsonKey(
    
    name: r'mode',
    required: true,
    includeIfNull: false,
  )


  final String mode;



  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;



  @JsonKey(
    
    name: r'p50_ms',
    required: true,
    includeIfNull: false,
  )


  final int p50Ms;



  @JsonKey(
    
    name: r'p90_ms',
    required: true,
    includeIfNull: false,
  )


  final int p90Ms;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServerCapacityComputerMetricsWakeTimesInner &&
      other.mode == mode &&
      other.count == count &&
      other.p50Ms == p50Ms &&
      other.p90Ms == p90Ms;

    @override
    int get hashCode =>
        mode.hashCode +
        count.hashCode +
        p50Ms.hashCode +
        p90Ms.hashCode;

  factory ServerCapacityComputerMetricsWakeTimesInner.fromJson(Map<String, dynamic> json) => _$ServerCapacityComputerMetricsWakeTimesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ServerCapacityComputerMetricsWakeTimesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

