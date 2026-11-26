//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status_today.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatusToday {
  /// Returns a new [CloudLinkStatusToday] instance.
  CloudLinkStatusToday({

    required  this.spendUsd,

    required  this.capUsd,

    required  this.resetsAt,
  });

  @JsonKey(
    
    name: r'spend_usd',
    required: true,
    includeIfNull: false,
  )


  final num spendUsd;



  @JsonKey(
    
    name: r'cap_usd',
    required: true,
    includeIfNull: true,
  )


  final num? capUsd;



  @JsonKey(
    
    name: r'resets_at',
    required: true,
    includeIfNull: true,
  )


  final String? resetsAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatusToday &&
      other.spendUsd == spendUsd &&
      other.capUsd == capUsd &&
      other.resetsAt == resetsAt;

    @override
    int get hashCode =>
        spendUsd.hashCode +
        (capUsd == null ? 0 : capUsd.hashCode) +
        (resetsAt == null ? 0 : resetsAt.hashCode);

  factory CloudLinkStatusToday.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusTodayFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusTodayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

