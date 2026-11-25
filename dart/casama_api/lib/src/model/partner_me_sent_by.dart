//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_me_sent_by.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PartnerMeSentBy {
  /// Returns a new [PartnerMeSentBy] instance.
  PartnerMeSentBy({

    required  this.code,

    required  this.name,

    required  this.picture,

    required  this.claimedAt,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'picture',
    required: true,
    includeIfNull: true,
  )


  final String? picture;



  @JsonKey(
    
    name: r'claimed_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime claimedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PartnerMeSentBy &&
      other.code == code &&
      other.name == name &&
      other.picture == picture &&
      other.claimedAt == claimedAt;

    @override
    int get hashCode =>
        code.hashCode +
        name.hashCode +
        (picture == null ? 0 : picture.hashCode) +
        claimedAt.hashCode;

  factory PartnerMeSentBy.fromJson(Map<String, dynamic> json) => _$PartnerMeSentByFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerMeSentByToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

