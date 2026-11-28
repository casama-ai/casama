//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_capacity_computer_metrics_shell_programs7d_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServerCapacityComputerMetricsShellPrograms7dInner {
  /// Returns a new [ServerCapacityComputerMetricsShellPrograms7dInner] instance.
  ServerCapacityComputerMetricsShellPrograms7dInner({

    required  this.program,

    required  this.count,
  });

  @JsonKey(
    
    name: r'program',
    required: true,
    includeIfNull: false,
  )


  final String program;



  @JsonKey(
    
    name: r'count',
    required: true,
    includeIfNull: false,
  )


  final int count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServerCapacityComputerMetricsShellPrograms7dInner &&
      other.program == program &&
      other.count == count;

    @override
    int get hashCode =>
        program.hashCode +
        count.hashCode;

  factory ServerCapacityComputerMetricsShellPrograms7dInner.fromJson(Map<String, dynamic> json) => _$ServerCapacityComputerMetricsShellPrograms7dInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ServerCapacityComputerMetricsShellPrograms7dInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

