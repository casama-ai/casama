// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_partner_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClaimPartnerRequestCWProxy {
  ClaimPartnerRequest code(String code);

  ClaimPartnerRequest via(ClaimPartnerRequestViaEnum? via);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ClaimPartnerRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ClaimPartnerRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ClaimPartnerRequest call({String code, ClaimPartnerRequestViaEnum? via});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfClaimPartnerRequest.copyWith(...)` or call `instanceOfClaimPartnerRequest.copyWith.fieldName(value)` for a single field.
class _$ClaimPartnerRequestCWProxyImpl implements _$ClaimPartnerRequestCWProxy {
  const _$ClaimPartnerRequestCWProxyImpl(this._value);

  final ClaimPartnerRequest _value;

  @override
  ClaimPartnerRequest code(String code) => call(code: code);

  @override
  ClaimPartnerRequest via(ClaimPartnerRequestViaEnum? via) => call(via: via);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ClaimPartnerRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ClaimPartnerRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ClaimPartnerRequest call({
    Object? code = const $CopyWithPlaceholder(),
    Object? via = const $CopyWithPlaceholder(),
  }) {
    return ClaimPartnerRequest(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      via: via == const $CopyWithPlaceholder()
          ? _value.via
          // ignore: cast_nullable_to_non_nullable
          : via as ClaimPartnerRequestViaEnum?,
    );
  }
}

extension $ClaimPartnerRequestCopyWith on ClaimPartnerRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfClaimPartnerRequest.copyWith(...)` or `instanceOfClaimPartnerRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClaimPartnerRequestCWProxy get copyWith =>
      _$ClaimPartnerRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimPartnerRequest _$ClaimPartnerRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClaimPartnerRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code']);
      final val = ClaimPartnerRequest(
        code: $checkedConvert('code', (v) => v as String),
        via: $checkedConvert(
          'via',
          (v) => $enumDecodeNullable(_$ClaimPartnerRequestViaEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClaimPartnerRequestToJson(
  ClaimPartnerRequest instance,
) => <String, dynamic>{
  'code': instance.code,
  'via': ?_$ClaimPartnerRequestViaEnumEnumMap[instance.via],
};

const _$ClaimPartnerRequestViaEnumEnumMap = {
  ClaimPartnerRequestViaEnum.linkWeb: 'link_web',
  ClaimPartnerRequestViaEnum.playReferrer: 'play_referrer',
  ClaimPartnerRequestViaEnum.typed: 'typed',
};
