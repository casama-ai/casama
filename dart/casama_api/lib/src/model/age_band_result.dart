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

     this.accepted,
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



      /// Whether the band sent was saved; account_age_band is the band in force either way. A higher band is saved only one step at a time and only once the current band is 30 days old; declining keeps a band already known. Always sent; missing only from servers before this rule, which saved every band.
  @JsonKey(
    
    name: r'accepted',
    required: false,
    includeIfNull: false,
  )


  final bool? accepted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AgeBandResult &&
      other.accountAgeBand == accountAgeBand &&
      other.accountAgeBandUpdatedAt == accountAgeBandUpdatedAt &&
      other.accepted == accepted;

    @override
    int get hashCode =>
        (accountAgeBand == null ? 0 : accountAgeBand.hashCode) +
        accountAgeBandUpdatedAt.hashCode +
        accepted.hashCode;

  factory AgeBandResult.fromJson(Map<String, dynamic> json) => _$AgeBandResultFromJson(json);

  Map<String, dynamic> toJson() => _$AgeBandResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

