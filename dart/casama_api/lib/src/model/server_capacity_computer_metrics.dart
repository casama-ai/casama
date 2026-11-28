//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/server_capacity_computer_metrics_wake_times_inner.dart';
import 'package:casama_api/src/model/server_capacity_computer_metrics_job_boxes7d.dart';
import 'package:casama_api/src/model/server_capacity_computer_metrics_wakes_by_caller7d_inner.dart';
import 'package:casama_api/src/model/server_capacity_computer_metrics_shell_programs7d_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_capacity_computer_metrics.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServerCapacityComputerMetrics {
  /// Returns a new [ServerCapacityComputerMetrics] instance.
  ServerCapacityComputerMetrics({

    required  this.wakeTimes,

    required  this.browserOoms7d,

    required  this.wakesByCaller7d,

    required  this.shellPrograms7d,

    required  this.jobBoxes7d,
  });

  @JsonKey(
    
    name: r'wake_times',
    required: true,
    includeIfNull: false,
  )


  final List<ServerCapacityComputerMetricsWakeTimesInner> wakeTimes;



  @JsonKey(
    
    name: r'browser_ooms_7d',
    required: true,
    includeIfNull: false,
  )


  final int browserOoms7d;



  @JsonKey(
    
    name: r'wakes_by_caller_7d',
    required: true,
    includeIfNull: false,
  )


  final List<ServerCapacityComputerMetricsWakesByCaller7dInner> wakesByCaller7d;



  @JsonKey(
    
    name: r'shell_programs_7d',
    required: true,
    includeIfNull: false,
  )


  final List<ServerCapacityComputerMetricsShellPrograms7dInner> shellPrograms7d;



  @JsonKey(
    
    name: r'job_boxes_7d',
    required: true,
    includeIfNull: false,
  )


  final ServerCapacityComputerMetricsJobBoxes7d jobBoxes7d;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServerCapacityComputerMetrics &&
      other.wakeTimes == wakeTimes &&
      other.browserOoms7d == browserOoms7d &&
      other.wakesByCaller7d == wakesByCaller7d &&
      other.shellPrograms7d == shellPrograms7d &&
      other.jobBoxes7d == jobBoxes7d;

    @override
    int get hashCode =>
        wakeTimes.hashCode +
        browserOoms7d.hashCode +
        wakesByCaller7d.hashCode +
        shellPrograms7d.hashCode +
        jobBoxes7d.hashCode;

  factory ServerCapacityComputerMetrics.fromJson(Map<String, dynamic> json) => _$ServerCapacityComputerMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$ServerCapacityComputerMetricsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

