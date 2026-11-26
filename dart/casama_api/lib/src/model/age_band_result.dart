//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/account_age_band.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'age_band_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AgeBandResult {
  /// Returns a new [AgeBandResult] instance.
  AgeBandResult({

    required  this.accountAgeBand,

    required  this.accountAgeBandUpdatedAt,
  });

  @JsonKey(
    
    name: r'account_age_band',
    required: true,
    includeIfNull: true,
  )


  final AccountAgeBand? accountAgeBand;



  @JsonKey(
    
    name: r'account_age_band_updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime accountAgeBandUpdatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AgeBandResult &&
      other.accountAgeBand == accountAgeBand &&
      other.accountAgeBandUpdatedAt == accountAgeBandUpdatedAt;

    @override
    int get hashCode =>
        (accountAgeBand == null ? 0 : accountAgeBand.hashCode) +
        accountAgeBandUpdatedAt.hashCode;

  factory AgeBandResult.fromJson(Map<String, dynamic> json) => _$AgeBandResultFromJson(json);

  Map<String, dynamic> toJson() => _$AgeBandResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

