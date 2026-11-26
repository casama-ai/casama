//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move_progress_progress.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoveProgressProgress {
  /// Returns a new [MoveProgressProgress] instance.
  MoveProgressProgress({

    required  this.doneBytes,

    required  this.totalBytes,
  });

  @JsonKey(
    
    name: r'done_bytes',
    required: true,
    includeIfNull: false,
  )


  final num doneBytes;



  @JsonKey(
    
    name: r'total_bytes',
    required: true,
    includeIfNull: false,
  )


  final num totalBytes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoveProgressProgress &&
      other.doneBytes == doneBytes &&
      other.totalBytes == totalBytes;

    @override
    int get hashCode =>
        doneBytes.hashCode +
        totalBytes.hashCode;

  factory MoveProgressProgress.fromJson(Map<String, dynamic> json) => _$MoveProgressProgressFromJson(json);

  Map<String, dynamic> toJson() => _$MoveProgressProgressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

