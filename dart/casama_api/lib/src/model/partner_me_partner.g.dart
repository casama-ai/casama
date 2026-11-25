// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_me_partner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartnerMePartnerCWProxy {
  PartnerMePartner code(String code);

  PartnerMePartner link(String link);

  PartnerMePartner status(String status);

  PartnerMePartner portalUrl(String portalUrl);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerMePartner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerMePartner(...).copyWith(id: 12, name: "My name")
  /// ```
  PartnerMePartner call({
    String code,
    String link,
    String status,
    String portalUrl,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPartnerMePartner.copyWith(...)` or call `instanceOfPartnerMePartner.copyWith.fieldName(value)` for a single field.
class _$PartnerMePartnerCWProxyImpl implements _$PartnerMePartnerCWProxy {
  const _$PartnerMePartnerCWProxyImpl(this._value);

  final PartnerMePartner _value;

  @override
  PartnerMePartner code(String code) => call(code: code);

  @override
  PartnerMePartner link(String link) => call(link: link);

  @override
  PartnerMePartner status(String status) => call(status: status);

  @override
  PartnerMePartner portalUrl(String portalUrl) => call(portalUrl: portalUrl);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerMePartner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerMePartner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PartnerMePartner call({
    Object? code = const $CopyWithPlaceholder(),
    Object? link = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? portalUrl = const $CopyWithPlaceholder(),
  }) {
    return PartnerMePartner(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      link: link == const $CopyWithPlaceholder() || link == null
          ? _value.link
          // ignore: cast_nullable_to_non_nullable
          : link as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      portalUrl: portalUrl == const $CopyWithPlaceholder() || portalUrl == null
          ? _value.portalUrl
          // ignore: cast_nullable_to_non_nullable
          : portalUrl as String,
    );
  }
}

extension $PartnerMePartnerCopyWith on PartnerMePartner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPartnerMePartner.copyWith(...)` or `instanceOfPartnerMePartner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartnerMePartnerCWProxy get copyWith => _$PartnerMePartnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerMePartner _$PartnerMePartnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PartnerMePartner', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['code', 'link', 'status', 'portal_url'],
      );
      final val = PartnerMePartner(
        code: $checkedConvert('code', (v) => v as String),
        link: $checkedConvert('link', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        portalUrl: $checkedConvert('portal_url', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'portalUrl': 'portal_url'});

Map<String, dynamic> _$PartnerMePartnerToJson(PartnerMePartner instance) =>
    <String, dynamic>{
      'code': instance.code,
      'link': instance.link,
      'status': instance.status,
      'portal_url': instance.portalUrl,
    };
