//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/owner_alert_kind.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_alert_settings.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerAlertSettings {
  /// Returns a new [OwnerAlertSettings] instance.
  OwnerAlertSettings({

    required  this.paused,

    required  this.kinds,
  });

  @JsonKey(
    
    name: r'paused',
    required: true,
    includeIfNull: false,
  )


  final bool paused;



  @JsonKey(
    
    name: r'kinds',
    required: true,
    includeIfNull: false,
  )


  final List<OwnerAlertKind> kinds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerAlertSettings &&
      other.paused == paused &&
      other.kinds == kinds;

    @override
    int get hashCode =>
        paused.hashCode +
        kinds.hashCode;

  factory OwnerAlertSettings.fromJson(Map<String, dynamic> json) => _$OwnerAlertSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerAlertSettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

