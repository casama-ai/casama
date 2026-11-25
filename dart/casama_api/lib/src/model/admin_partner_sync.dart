//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_partner_sync.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminPartnerSync {
  /// Returns a new [AdminPartnerSync] instance.
  AdminPartnerSync({

    required  this.partners,

    required  this.paid,

    required  this.pushed,
  });

  @JsonKey(
    
    name: r'partners',
    required: true,
    includeIfNull: false,
  )


  final int partners;



  @JsonKey(
    
    name: r'paid',
    required: true,
    includeIfNull: false,
  )


  final int paid;



  @JsonKey(
    
    name: r'pushed',
    required: true,
    includeIfNull: false,
  )


  final int pushed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminPartnerSync &&
      other.partners == partners &&
      other.paid == paid &&
      other.pushed == pushed;

    @override
    int get hashCode =>
        partners.hashCode +
        paid.hashCode +
        pushed.hashCode;

  factory AdminPartnerSync.fromJson(Map<String, dynamic> json) => _$AdminPartnerSyncFromJson(json);

  Map<String, dynamic> toJson() => _$AdminPartnerSyncToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

