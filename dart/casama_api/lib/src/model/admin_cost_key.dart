//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cost_row_billing.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_cost_key.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCostKey {
  /// Returns a new [AdminCostKey] instance.
  AdminCostKey({

    required  this.keyRef,

    required  this.vendor,

    required  this.vendorLabel,

    required  this.label,

    required  this.purpose,

    required  this.setIn,

    required  this.vaultItem,

    required  this.billingUrl,

    required  this.configured,

    required  this.spentUsd,

     this.paidUsd,

     this.billing,

    required  this.calls,

    required  this.lastUsedAt,

    required  this.reportedUsd,

    required  this.limitUsd,

    required  this.limitRemainingUsd,
  });

      /// The setting's name, e.g. CLOUD_MODEL_UPSTREAM_KEY
  @JsonKey(
    
    name: r'key_ref',
    required: true,
    includeIfNull: false,
  )


  final String keyRef;



  @JsonKey(
    
    name: r'vendor',
    required: true,
    includeIfNull: false,
  )


  final String vendor;



  @JsonKey(
    
    name: r'vendor_label',
    required: true,
    includeIfNull: false,
  )


  final String vendorLabel;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: false,
  )


  final String label;



  @JsonKey(
    
    name: r'purpose',
    required: true,
    includeIfNull: false,
  )


  final String purpose;



      /// Where the value lives, e.g. the server's env
  @JsonKey(
    
    name: r'set_in',
    required: true,
    includeIfNull: false,
  )


  final String setIn;



  @JsonKey(
    
    name: r'vault_item',
    required: true,
    includeIfNull: true,
  )


  final String? vaultItem;



  @JsonKey(
    
    name: r'billing_url',
    required: true,
    includeIfNull: true,
  )


  final String? billingUrl;



  @JsonKey(
    
    name: r'configured',
    required: true,
    includeIfNull: false,
  )


  final bool configured;



  @JsonKey(
    
    name: r'spent_usd',
    required: true,
    includeIfNull: false,
  )


  final num spentUsd;



  @JsonKey(
    
    name: r'paid_usd',
    required: false,
    includeIfNull: false,
  )


  final num? paidUsd;



  @JsonKey(
    
    name: r'billing',
    required: false,
    includeIfNull: false,
  )


  final CostRowBilling? billing;



  @JsonKey(
    
    name: r'calls',
    required: true,
    includeIfNull: false,
  )


  final int calls;



  @JsonKey(
    
    name: r'last_used_at',
    required: true,
    includeIfNull: true,
  )


  final String? lastUsedAt;



  @JsonKey(
    
    name: r'reported_usd',
    required: true,
    includeIfNull: true,
  )


  final num? reportedUsd;



  @JsonKey(
    
    name: r'limit_usd',
    required: true,
    includeIfNull: true,
  )


  final num? limitUsd;



  @JsonKey(
    
    name: r'limit_remaining_usd',
    required: true,
    includeIfNull: true,
  )


  final num? limitRemainingUsd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCostKey &&
      other.keyRef == keyRef &&
      other.vendor == vendor &&
      other.vendorLabel == vendorLabel &&
      other.label == label &&
      other.purpose == purpose &&
      other.setIn == setIn &&
      other.vaultItem == vaultItem &&
      other.billingUrl == billingUrl &&
      other.configured == configured &&
      other.spentUsd == spentUsd &&
      other.paidUsd == paidUsd &&
      other.billing == billing &&
      other.calls == calls &&
      other.lastUsedAt == lastUsedAt &&
      other.reportedUsd == reportedUsd &&
      other.limitUsd == limitUsd &&
      other.limitRemainingUsd == limitRemainingUsd;

    @override
    int get hashCode =>
        keyRef.hashCode +
        vendor.hashCode +
        vendorLabel.hashCode +
        label.hashCode +
        purpose.hashCode +
        setIn.hashCode +
        (vaultItem == null ? 0 : vaultItem.hashCode) +
        (billingUrl == null ? 0 : billingUrl.hashCode) +
        configured.hashCode +
        spentUsd.hashCode +
        paidUsd.hashCode +
        billing.hashCode +
        calls.hashCode +
        (lastUsedAt == null ? 0 : lastUsedAt.hashCode) +
        (reportedUsd == null ? 0 : reportedUsd.hashCode) +
        (limitUsd == null ? 0 : limitUsd.hashCode) +
        (limitRemainingUsd == null ? 0 : limitRemainingUsd.hashCode);

  factory AdminCostKey.fromJson(Map<String, dynamic> json) => _$AdminCostKeyFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCostKeyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

