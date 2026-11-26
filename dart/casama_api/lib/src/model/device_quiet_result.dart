//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_quiet_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceQuietResult {
  /// Returns a new [DeviceQuietResult] instance.
  DeviceQuietResult({

    required  this.id,

    required  this.quietUntil,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'quiet_until',
    required: true,
    includeIfNull: true,
  )


  final DateTime? quietUntil;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeviceQuietResult &&
      other.id == id &&
      other.quietUntil == quietUntil;

    @override
    int get hashCode =>
        id.hashCode +
        (quietUntil == null ? 0 : quietUntil.hashCode);

  factory DeviceQuietResult.fromJson(Map<String, dynamic> json) => _$DeviceQuietResultFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceQuietResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

