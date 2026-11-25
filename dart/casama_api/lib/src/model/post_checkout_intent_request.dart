//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_checkout_intent_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PostCheckoutIntentRequest {
  /// Returns a new [PostCheckoutIntentRequest] instance.
  PostCheckoutIntentRequest({

    required  this.orgId,

     this.installId,

     this.productId,
  });

  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'install_id',
    required: false,
    includeIfNull: false,
  )


  final String? installId;



  @JsonKey(
    
    name: r'product_id',
    required: false,
    includeIfNull: false,
  )


  final String? productId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PostCheckoutIntentRequest &&
      other.orgId == orgId &&
      other.installId == installId &&
      other.productId == productId;

    @override
    int get hashCode =>
        orgId.hashCode +
        installId.hashCode +
        productId.hashCode;

  factory PostCheckoutIntentRequest.fromJson(Map<String, dynamic> json) => _$PostCheckoutIntentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostCheckoutIntentRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

