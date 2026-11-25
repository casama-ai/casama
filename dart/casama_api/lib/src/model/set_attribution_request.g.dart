// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_attribution_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetAttributionRequestCWProxy {
  SetAttributionRequest platform(SetAttributionRequestPlatformEnum? platform);

  SetAttributionRequest source_(String? source_);

  SetAttributionRequest medium(String? medium);

  SetAttributionRequest campaign(String? campaign);

  SetAttributionRequest landing(String? landing);

  SetAttributionRequest installId(String? installId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetAttributionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetAttributionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetAttributionRequest call({
    SetAttributionRequestPlatformEnum? platform,
    String? source_,
    String? medium,
    String? campaign,
    String? landing,
    String? installId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetAttributionRequest.copyWith(...)` or call `instanceOfSetAttributionRequest.copyWith.fieldName(value)` for a single field.
class _$SetAttributionRequestCWProxyImpl
    implements _$SetAttributionRequestCWProxy {
  const _$SetAttributionRequestCWProxyImpl(this._value);

  final SetAttributionRequest _value;

  @override
  SetAttributionRequest platform(SetAttributionRequestPlatformEnum? platform) =>
      call(platform: platform);

  @override
  SetAttributionRequest source_(String? source_) => call(source_: source_);

  @override
  SetAttributionRequest medium(String? medium) => call(medium: medium);

  @override
  SetAttributionRequest campaign(String? campaign) => call(campaign: campaign);

  @override
  SetAttributionRequest landing(String? landing) => call(landing: landing);

  @override
  SetAttributionRequest installId(String? installId) =>
      call(installId: installId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetAttributionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetAttributionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetAttributionRequest call({
    Object? platform = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? medium = const $CopyWithPlaceholder(),
    Object? campaign = const $CopyWithPlaceholder(),
    Object? landing = const $CopyWithPlaceholder(),
    Object? installId = const $CopyWithPlaceholder(),
  }) {
    return SetAttributionRequest(
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as SetAttributionRequestPlatformEnum?,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String?,
      medium: medium == const $CopyWithPlaceholder()
          ? _value.medium
          // ignore: cast_nullable_to_non_nullable
          : medium as String?,
      campaign: campaign == const $CopyWithPlaceholder()
          ? _value.campaign
          // ignore: cast_nullable_to_non_nullable
          : campaign as String?,
      landing: landing == const $CopyWithPlaceholder()
          ? _value.landing
          // ignore: cast_nullable_to_non_nullable
          : landing as String?,
      installId: installId == const $CopyWithPlaceholder()
          ? _value.installId
          // ignore: cast_nullable_to_non_nullable
          : installId as String?,
    );
  }
}

extension $SetAttributionRequestCopyWith on SetAttributionRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetAttributionRequest.copyWith(...)` or `instanceOfSetAttributionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetAttributionRequestCWProxy get copyWith =>
      _$SetAttributionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAttributionRequest _$SetAttributionRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetAttributionRequest', json, ($checkedConvert) {
  final val = SetAttributionRequest(
    platform: $checkedConvert(
      'platform',
      (v) => $enumDecodeNullable(_$SetAttributionRequestPlatformEnumEnumMap, v),
    ),
    source_: $checkedConvert('source', (v) => v as String?),
    medium: $checkedConvert('medium', (v) => v as String?),
    campaign: $checkedConvert('campaign', (v) => v as String?),
    landing: $checkedConvert('landing', (v) => v as String?),
    installId: $checkedConvert('install_id', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'source_': 'source', 'installId': 'install_id'});

Map<String, dynamic> _$SetAttributionRequestToJson(
  SetAttributionRequest instance,
) => <String, dynamic>{
  'platform': ?_$SetAttributionRequestPlatformEnumEnumMap[instance.platform],
  'source': ?instance.source_,
  'medium': ?instance.medium,
  'campaign': ?instance.campaign,
  'landing': ?instance.landing,
  'install_id': ?instance.installId,
};

const _$SetAttributionRequestPlatformEnumEnumMap = {
  SetAttributionRequestPlatformEnum.ios: 'ios',
  SetAttributionRequestPlatformEnum.android: 'android',
  SetAttributionRequestPlatformEnum.macos: 'macos',
  SetAttributionRequestPlatformEnum.windows: 'windows',
  SetAttributionRequestPlatformEnum.linux: 'linux',
  SetAttributionRequestPlatformEnum.web: 'web',
  SetAttributionRequestPlatformEnum.extension_: 'extension',
};
