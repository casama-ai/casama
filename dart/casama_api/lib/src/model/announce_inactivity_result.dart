//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_inactivity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announce_inactivity_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnounceInactivityResult {
  /// Returns a new [AnnounceInactivityResult] instance.
  AnnounceInactivityResult({

    required  this.queued,

    required  this.settings,
  });

  @JsonKey(
    
    name: r'queued',
    required: true,
    includeIfNull: false,
  )


  final int queued;



  @JsonKey(
    
    name: r'settings',
    required: true,
    includeIfNull: false,
  )


  final AdminInactivity settings;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnnounceInactivityResult &&
      other.queued == queued &&
      other.settings == settings;

    @override
    int get hashCode =>
        queued.hashCode +
        settings.hashCode;

  factory AnnounceInactivityResult.fromJson(Map<String, dynamic> json) => _$AnnounceInactivityResultFromJson(json);

  Map<String, dynamic> toJson() => _$AnnounceInactivityResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

