//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selfhost_stats_by_engine_version_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfhostStatsByEngineVersionInner {
  /// Returns a new [SelfhostStatsByEngineVersionInner] instance.
  SelfhostStatsByEngineVersionInner({

    required  this.engineVersion,

    required  this.servers,
  });

  @JsonKey(
    
    name: r'engine_version',
    required: true,
    includeIfNull: false,
  )


  final String engineVersion;



  @JsonKey(
    
    name: r'servers',
    required: true,
    includeIfNull: false,
  )


  final int servers;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfhostStatsByEngineVersionInner &&
      other.engineVersion == engineVersion &&
      other.servers == servers;

    @override
    int get hashCode =>
        engineVersion.hashCode +
        servers.hashCode;

  factory SelfhostStatsByEngineVersionInner.fromJson(Map<String, dynamic> json) => _$SelfhostStatsByEngineVersionInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SelfhostStatsByEngineVersionInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

