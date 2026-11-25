//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_inactivity_effective.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inactivity_report.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InactivityReport {
  /// Returns a new [InactivityReport] instance.
  InactivityReport({

    required  this.ranAt,

    required  this.modes,

    required  this.resting,

    required  this.filesWarned,

    required  this.filesRemoved,

    required  this.filesBytes,

    required  this.removalWarned,

    required  this.removalsScheduled,

    required  this.unconfirmed,

    required  this.restingNow,

    required  this.removalsPending,
  });

  @JsonKey(
    
    name: r'ran_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime ranAt;



  @JsonKey(
    
    name: r'modes',
    required: true,
    includeIfNull: false,
  )


  final AdminInactivityEffective modes;



  @JsonKey(
    
    name: r'resting',
    required: true,
    includeIfNull: false,
  )


  final int resting;



  @JsonKey(
    
    name: r'files_warned',
    required: true,
    includeIfNull: false,
  )


  final int filesWarned;



  @JsonKey(
    
    name: r'files_removed',
    required: true,
    includeIfNull: false,
  )


  final int filesRemoved;



  @JsonKey(
    
    name: r'files_bytes',
    required: true,
    includeIfNull: false,
  )


  final num filesBytes;



  @JsonKey(
    
    name: r'removal_warned',
    required: true,
    includeIfNull: false,
  )


  final int removalWarned;



  @JsonKey(
    
    name: r'removals_scheduled',
    required: true,
    includeIfNull: false,
  )


  final int removalsScheduled;



  @JsonKey(
    
    name: r'unconfirmed',
    required: true,
    includeIfNull: false,
  )


  final int unconfirmed;



  @JsonKey(
    
    name: r'resting_now',
    required: true,
    includeIfNull: false,
  )


  final int restingNow;



  @JsonKey(
    
    name: r'removals_pending',
    required: true,
    includeIfNull: false,
  )


  final int removalsPending;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InactivityReport &&
      other.ranAt == ranAt &&
      other.modes == modes &&
      other.resting == resting &&
      other.filesWarned == filesWarned &&
      other.filesRemoved == filesRemoved &&
      other.filesBytes == filesBytes &&
      other.removalWarned == removalWarned &&
      other.removalsScheduled == removalsScheduled &&
      other.unconfirmed == unconfirmed &&
      other.restingNow == restingNow &&
      other.removalsPending == removalsPending;

    @override
    int get hashCode =>
        ranAt.hashCode +
        modes.hashCode +
        resting.hashCode +
        filesWarned.hashCode +
        filesRemoved.hashCode +
        filesBytes.hashCode +
        removalWarned.hashCode +
        removalsScheduled.hashCode +
        unconfirmed.hashCode +
        restingNow.hashCode +
        removalsPending.hashCode;

  factory InactivityReport.fromJson(Map<String, dynamic> json) => _$InactivityReportFromJson(json);

  Map<String, dynamic> toJson() => _$InactivityReportToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

