//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_growth_paywall_source.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminGrowthPaywallSource {
  /// Returns a new [AdminGrowthPaywallSource] instance.
  AdminGrowthPaywallSource({

    required  this.source_,

    required  this.views,

    required  this.checkouts,
  });

  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final String source_;



  @JsonKey(
    
    name: r'views',
    required: true,
    includeIfNull: false,
  )


  final int views;



  @JsonKey(
    
    name: r'checkouts',
    required: true,
    includeIfNull: false,
  )


  final int checkouts;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminGrowthPaywallSource &&
      other.source_ == source_ &&
      other.views == views &&
      other.checkouts == checkouts;

    @override
    int get hashCode =>
        source_.hashCode +
        views.hashCode +
        checkouts.hashCode;

  factory AdminGrowthPaywallSource.fromJson(Map<String, dynamic> json) => _$AdminGrowthPaywallSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AdminGrowthPaywallSourceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

