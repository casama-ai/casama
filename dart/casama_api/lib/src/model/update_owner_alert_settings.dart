//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_owner_alert_settings.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateOwnerAlertSettings {
  /// Returns a new [UpdateOwnerAlertSettings] instance.
  UpdateOwnerAlertSettings({

     this.paused,

     this.kinds,
  });

  @JsonKey(
    
    name: r'paused',
    required: false,
    includeIfNull: false,
  )


  final bool? paused;



  @JsonKey(
    
    name: r'kinds',
    required: false,
    includeIfNull: false,
  )


  final Map<String, bool>? kinds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateOwnerAlertSettings &&
      other.paused == paused &&
      other.kinds == kinds;

    @override
    int get hashCode =>
        paused.hashCode +
        kinds.hashCode;

  factory UpdateOwnerAlertSettings.fromJson(Map<String, dynamic> json) => _$UpdateOwnerAlertSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateOwnerAlertSettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

