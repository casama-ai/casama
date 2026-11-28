//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_capacity_computer_metrics_job_boxes7d.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServerCapacityComputerMetricsJobBoxes7d {
  /// Returns a new [ServerCapacityComputerMetricsJobBoxes7d] instance.
  ServerCapacityComputerMetricsJobBoxes7d({

    required  this.count,

    required  this.p50Ms,

    required  this.p90Ms,
  });

  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;



  @JsonKey(
    
    name: r'p50_ms',
    required: true,
    includeIfNull: true,
  )


  final int? p50Ms;



  @JsonKey(
    
    name: r'p90_ms',
    required: true,
    includeIfNull: true,
  )


  final int? p90Ms;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServerCapacityComputerMetricsJobBoxes7d &&
      other.count == count &&
      other.p50Ms == p50Ms &&
      other.p90Ms == p90Ms;

    @override
    int get hashCode =>
        count.hashCode +
        (p50Ms == null ? 0 : p50Ms.hashCode) +
        (p90Ms == null ? 0 : p90Ms.hashCode);

  factory ServerCapacityComputerMetricsJobBoxes7d.fromJson(Map<String, dynamic> json) => _$ServerCapacityComputerMetricsJobBoxes7dFromJson(json);

  Map<String, dynamic> toJson() => _$ServerCapacityComputerMetricsJobBoxes7dToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

