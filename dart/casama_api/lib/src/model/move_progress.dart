//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/move_progress_progress.dart';
import 'package:casama_api/src/model/move_error.dart';
import 'package:casama_api/src/model/move_state.dart';
import 'package:casama_api/src/model/moved_to.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_progress.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveProgress {
  /// Returns a new [MoveProgress] instance.
  MoveProgress({

    required  this.moveId,

    required  this.role,

    required  this.state,

    required  this.step,

    required  this.orgId,

    required  this.remoteUrl,

    required  this.bringKeys,

    required  this.counts,

    required  this.progress,

     this.parts,

    required  this.report,

    required  this.error,

     this.movedTo,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.finishedAt,
  });

  @JsonKey(
    
    name: r'move_id',
    required: true,
    includeIfNull: false,
  )


  final String moveId;



  @JsonKey(
    
    name: r'role',
    required: true,
    includeIfNull: false,
  )


  final MoveProgressRoleEnum role;



  @JsonKey(
    
    name: r'state',
    required: true,
    includeIfNull: false,
  )


  final MoveState state;



  @JsonKey(
    
    name: r'step',
    required: true,
    includeIfNull: true,
  )


  final String? step;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: true,
  )


  final String? orgId;



  @JsonKey(
    
    name: r'remote_url',
    required: true,
    includeIfNull: true,
  )


  final String? remoteUrl;



  @JsonKey(
    
    name: r'bring_keys',
    required: true,
    includeIfNull: false,
  )


  final bool bringKeys;



  @JsonKey(
    
    name: r'counts',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object?> counts;



  @JsonKey(
    
    name: r'progress',
    required: true,
    includeIfNull: false,
  )


  final MoveProgressProgress progress;



  @JsonKey(
    
    name: r'parts',
    required: false,
    includeIfNull: false,
  )


  final List<int>? parts;



  @JsonKey(
    
    name: r'report',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object?> report;



  @JsonKey(
    
    name: r'error',
    required: true,
    includeIfNull: true,
  )


  final MoveError? error;



  @JsonKey(
    
    name: r'moved_to',
    required: false,
    includeIfNull: false,
  )


  final MovedTo? movedTo;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



  @JsonKey(
    
    name: r'finished_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? finishedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveProgress &&
      other.moveId == moveId &&
      other.role == role &&
      other.state == state &&
      other.step == step &&
      other.orgId == orgId &&
      other.remoteUrl == remoteUrl &&
      other.bringKeys == bringKeys &&
      other.counts == counts &&
      other.progress == progress &&
      other.parts == parts &&
      other.report == report &&
      other.error == error &&
      other.movedTo == movedTo &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.finishedAt == finishedAt;

    @override
    int get hashCode =>
        moveId.hashCode +
        role.hashCode +
        state.hashCode +
        (step == null ? 0 : step.hashCode) +
        (orgId == null ? 0 : orgId.hashCode) +
        (remoteUrl == null ? 0 : remoteUrl.hashCode) +
        bringKeys.hashCode +
        counts.hashCode +
        progress.hashCode +
        parts.hashCode +
        report.hashCode +
        (error == null ? 0 : error.hashCode) +
        (movedTo == null ? 0 : movedTo.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        (finishedAt == null ? 0 : finishedAt.hashCode);

  factory MoveProgress.fromJson(Map<String, dynamic> json) => _$MoveProgressFromJson(json);

  Map<String, dynamic> toJson() => _$MoveProgressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum MoveProgressRoleEnum {
@JsonValue(r'source')
source_(r'source'),
@JsonValue(r'target')
target(r'target');

const MoveProgressRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


