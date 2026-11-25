//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/inactivity_settings.dart';
import 'package:casama_api/src/model/inactivity_report.dart';
import 'package:casama_api/src/model/admin_inactivity_effective.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_inactivity.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminInactivity {
  /// Returns a new [AdminInactivity] instance.
  AdminInactivity({

    required  this.settings,

    required  this.effective,

    required  this.report,
  });

  @JsonKey(
    
    name: r'settings',
    required: true,
    includeIfNull: false,
  )


  final InactivitySettings settings;



  @JsonKey(
    
    name: r'effective',
    required: true,
    includeIfNull: false,
  )


  final AdminInactivityEffective effective;



  @JsonKey(
    
    name: r'report',
    required: true,
    includeIfNull: true,
  )


  final InactivityReport? report;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminInactivity &&
      other.settings == settings &&
      other.effective == effective &&
      other.report == report;

    @override
    int get hashCode =>
        settings.hashCode +
        effective.hashCode +
        (report == null ? 0 : report.hashCode);

  factory AdminInactivity.fromJson(Map<String, dynamic> json) => _$AdminInactivityFromJson(json);

  Map<String, dynamic> toJson() => _$AdminInactivityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

