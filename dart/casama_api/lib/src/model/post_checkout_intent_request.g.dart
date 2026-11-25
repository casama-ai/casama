// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_checkout_intent_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostCheckoutIntentRequestCWProxy {
  PostCheckoutIntentRequest orgId(String orgId);

  PostCheckoutIntentRequest installId(String? installId);

  PostCheckoutIntentRequest productId(String? productId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PostCheckoutIntentRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PostCheckoutIntentRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  PostCheckoutIntentRequest call({
    String orgId,
    String? installId,
    String? productId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPostCheckoutIntentRequest.copyWith(...)` or call `instanceOfPostCheckoutIntentRequest.copyWith.fieldName(value)` for a single field.
class _$PostCheckoutIntentRequestCWProxyImpl
    implements _$PostCheckoutIntentRequestCWProxy {
  const _$PostCheckoutIntentRequestCWProxyImpl(this._value);

  final PostCheckoutIntentRequest _value;

  @override
  PostCheckoutIntentRequest orgId(String orgId) => call(orgId: orgId);

  @override
  PostCheckoutIntentRequest installId(String? installId) =>
      call(installId: installId);

  @override
  PostCheckoutIntentRequest productId(String? productId) =>
      call(productId: productId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PostCheckoutIntentRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PostCheckoutIntentRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PostCheckoutIntentRequest call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? installId = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
  }) {
    return PostCheckoutIntentRequest(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      installId: installId == const $CopyWithPlaceholder()
          ? _value.installId
          // ignore: cast_nullable_to_non_nullable
          : installId as String?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as String?,
    );
  }
}

extension $PostCheckoutIntentRequestCopyWith on PostCheckoutIntentRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPostCheckoutIntentRequest.copyWith(...)` or `instanceOfPostCheckoutIntentRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostCheckoutIntentRequestCWProxy get copyWith =>
      _$PostCheckoutIntentRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCheckoutIntentRequest _$PostCheckoutIntentRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PostCheckoutIntentRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['org_id']);
    final val = PostCheckoutIntentRequest(
      orgId: $checkedConvert('org_id', (v) => v as String),
      installId: $checkedConvert('install_id', (v) => v as String?),
      productId: $checkedConvert('product_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'installId': 'install_id',
    'productId': 'product_id',
  },
);

Map<String, dynamic> _$PostCheckoutIntentRequestToJson(
  PostCheckoutIntentRequest instance,
) => <String, dynamic>{
  'org_id': instance.orgId,
  'install_id': ?instance.installId,
  'product_id': ?instance.productId,
};
