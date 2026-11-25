//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_preview.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PartnerPreview {
  /// Returns a new [PartnerPreview] instance.
  PartnerPreview({

    required  this.code,

    required  this.name,

    required  this.picture,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is PartnerPreview &&
      other.code == code &&
      other.name == name &&
      other.picture == picture;

    @override
    int get hashCode =>
        code.hashCode +
        name.hashCode +
        (picture == null ? 0 : picture.hashCode);

  factory PartnerPreview.fromJson(Map<String, dynamic> json) => _$PartnerPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerPreviewToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

