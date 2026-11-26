//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/move_check_after.dart';
import 'package:casama_api/src/model/move_fit.dart';
import 'package:casama_api/src/model/moved_to.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_check.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveCheck {
  /// Returns a new [MoveCheck] instance.
  MoveCheck({

    required  this.sizeBytes,

    required  this.estimateSeconds,

    required  this.pauseSeconds,

    required  this.longPause,

    required  this.counts,

    required  this.fit,

    required  this.updateFirst,

    required  this.comes,

    required  this.after,

    required  this.target,

    required  this.alreadyMoved,
  });

  @JsonKey(
    
    name: r'size_bytes',
    required: true,
    includeIfNull: false,
  )


  final num sizeBytes;



  @JsonKey(
    
    name: r'estimate_seconds',
    required: true,
    includeIfNull: false,
  )


  final num estimateSeconds;



  @JsonKey(
    
    name: r'pause_seconds',
    required: true,
    includeIfNull: false,
  )


  final num pauseSeconds;



  @JsonKey(
    
    name: r'long_pause',
    required: true,
    includeIfNull: false,
  )


  final bool longPause;



  @JsonKey(
    
    name: r'counts',
    required: true,
    includeIfNull: false,
  )


  final Map<String, num> counts;



  @JsonKey(
    
    name: r'fit',
    required: true,
    includeIfNull: false,
  )


  final MoveFit fit;



  @JsonKey(
    
    name: r'update_first',
    required: true,
    includeIfNull: true,
  )


  final MoveCheckUpdateFirstEnum? updateFirst;



  @JsonKey(
    
    name: r'comes',
    required: true,
    includeIfNull: false,
  )


  final List<String> comes;



  @JsonKey(
    
    name: r'after',
    required: true,
    includeIfNull: false,
  )


  final MoveCheckAfter after;



  @JsonKey(
    
    name: r'target',
    required: true,
    includeIfNull: false,
  )


  final MoveCheckTargetEnum target;



  @JsonKey(
    
    name: r'already_moved',
    required: true,
    includeIfNull: true,
  )


  final MovedTo? alreadyMoved;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveCheck &&
      other.sizeBytes == sizeBytes &&
      other.estimateSeconds == estimateSeconds &&
      other.pauseSeconds == pauseSeconds &&
      other.longPause == longPause &&
      other.counts == counts &&
      other.fit == fit &&
      other.updateFirst == updateFirst &&
      other.comes == comes &&
      other.after == after &&
      other.target == target &&
      other.alreadyMoved == alreadyMoved;

    @override
    int get hashCode =>
        sizeBytes.hashCode +
        estimateSeconds.hashCode +
        pauseSeconds.hashCode +
        longPause.hashCode +
        counts.hashCode +
        fit.hashCode +
        (updateFirst == null ? 0 : updateFirst.hashCode) +
        comes.hashCode +
        after.hashCode +
        target.hashCode +
        (alreadyMoved == null ? 0 : alreadyMoved.hashCode);

  factory MoveCheck.fromJson(Map<String, dynamic> json) => _$MoveCheckFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCheckToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum MoveCheckUpdateFirstEnum {
@JsonValue(r'source')
source_(r'source'),
@JsonValue(r'target')
target(r'target');

const MoveCheckUpdateFirstEnum(this.value);

final String value;

@override
String toString() => value;
}



enum MoveCheckTargetEnum {
@JsonValue(r'cloud')
cloud(r'cloud'),
@JsonValue(r'server')
server(r'server');

const MoveCheckTargetEnum(this.value);

final String value;

@override
String toString() => value;
}


