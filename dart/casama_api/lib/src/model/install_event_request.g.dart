// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'install_event_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InstallEventRequestCWProxy {
  InstallEventRequest event(InstallEventRequestEventEnum event);

  InstallEventRequest installId(String installId);

  InstallEventRequest clickId(String? clickId);

  InstallEventRequest reinstall(bool? reinstall);

  InstallEventRequest platform(InstallEventRequestPlatformEnum platform);

  InstallEventRequest distribution(String? distribution);

  InstallEventRequest version(String? version);

  InstallEventRequest locale(String? locale);

  InstallEventRequest source_(String? source_);

  InstallEventRequest medium(String? medium);

  InstallEventRequest campaign(String? campaign);

  InstallEventRequest landing(String? landing);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InstallEventRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InstallEventRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  InstallEventRequest call({
    InstallEventRequestEventEnum event,
    String installId,
    String? clickId,
    bool? reinstall,
    InstallEventRequestPlatformEnum platform,
    String? distribution,
    String? version,
    String? locale,
    String? source_,
    String? medium,
    String? campaign,
    String? landing,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInstallEventRequest.copyWith(...)` or call `instanceOfInstallEventRequest.copyWith.fieldName(value)` for a single field.
class _$InstallEventRequestCWProxyImpl implements _$InstallEventRequestCWProxy {
  const _$InstallEventRequestCWProxyImpl(this._value);

  final InstallEventRequest _value;

  @override
  InstallEventRequest event(InstallEventRequestEventEnum event) =>
      call(event: event);

  @override
  InstallEventRequest installId(String installId) => call(installId: installId);

  @override
  InstallEventRequest clickId(String? clickId) => call(clickId: clickId);

  @override
  InstallEventRequest reinstall(bool? reinstall) => call(reinstall: reinstall);

  @override
  InstallEventRequest platform(InstallEventRequestPlatformEnum platform) =>
      call(platform: platform);

  @override
  InstallEventRequest distribution(String? distribution) =>
      call(distribution: distribution);

  @override
  InstallEventRequest version(String? version) => call(version: version);

  @override
  InstallEventRequest locale(String? locale) => call(locale: locale);

  @override
  InstallEventRequest source_(String? source_) => call(source_: source_);

  @override
  InstallEventRequest medium(String? medium) => call(medium: medium);

  @override
  InstallEventRequest campaign(String? campaign) => call(campaign: campaign);

  @override
  InstallEventRequest landing(String? landing) => call(landing: landing);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InstallEventRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InstallEventRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InstallEventRequest call({
    Object? event = const $CopyWithPlaceholder(),
    Object? installId = const $CopyWithPlaceholder(),
    Object? clickId = const $CopyWithPlaceholder(),
    Object? reinstall = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? distribution = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? medium = const $CopyWithPlaceholder(),
    Object? campaign = const $CopyWithPlaceholder(),
    Object? landing = const $CopyWithPlaceholder(),
  }) {
    return InstallEventRequest(
      event: event == const $CopyWithPlaceholder() || event == null
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as InstallEventRequestEventEnum,
      installId: installId == const $CopyWithPlaceholder() || installId == null
          ? _value.installId
          // ignore: cast_nullable_to_non_nullable
          : installId as String,
      clickId: clickId == const $CopyWithPlaceholder()
          ? _value.clickId
          // ignore: cast_nullable_to_non_nullable
          : clickId as String?,
      reinstall: reinstall == const $CopyWithPlaceholder()
          ? _value.reinstall
          // ignore: cast_nullable_to_non_nullable
          : reinstall as bool?,
      platform: platform == const $CopyWithPlaceholder() || platform == null
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as InstallEventRequestPlatformEnum,
      distribution: distribution == const $CopyWithPlaceholder()
          ? _value.distribution
          // ignore: cast_nullable_to_non_nullable
          : distribution as String?,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String?,
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
    );
  }
}

extension $InstallEventRequestCopyWith on InstallEventRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInstallEventRequest.copyWith(...)` or `instanceOfInstallEventRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InstallEventRequestCWProxy get copyWith =>
      _$InstallEventRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstallEventRequest _$InstallEventRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'InstallEventRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['event', 'install_id', 'platform'],
        );
        final val = InstallEventRequest(
          event: $checkedConvert(
            'event',
            (v) => $enumDecode(_$InstallEventRequestEventEnumEnumMap, v),
          ),
          installId: $checkedConvert('install_id', (v) => v as String),
          clickId: $checkedConvert('click_id', (v) => v as String?),
          reinstall: $checkedConvert('reinstall', (v) => v as bool?),
          platform: $checkedConvert(
            'platform',
            (v) => $enumDecode(_$InstallEventRequestPlatformEnumEnumMap, v),
          ),
          distribution: $checkedConvert('distribution', (v) => v as String?),
          version: $checkedConvert('version', (v) => v as String?),
          locale: $checkedConvert('locale', (v) => v as String?),
          source_: $checkedConvert('source', (v) => v as String?),
          medium: $checkedConvert('medium', (v) => v as String?),
          campaign: $checkedConvert('campaign', (v) => v as String?),
          landing: $checkedConvert('landing', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'installId': 'install_id',
        'clickId': 'click_id',
        'source_': 'source',
      },
    );

Map<String, dynamic> _$InstallEventRequestToJson(
  InstallEventRequest instance,
) => <String, dynamic>{
  'event': _$InstallEventRequestEventEnumEnumMap[instance.event]!,
  'install_id': instance.installId,
  'click_id': ?instance.clickId,
  'reinstall': ?instance.reinstall,
  'platform': _$InstallEventRequestPlatformEnumEnumMap[instance.platform]!,
  'distribution': ?instance.distribution,
  'version': ?instance.version,
  'locale': ?instance.locale,
  'source': ?instance.source_,
  'medium': ?instance.medium,
  'campaign': ?instance.campaign,
  'landing': ?instance.landing,
};

const _$InstallEventRequestEventEnumEnumMap = {
  InstallEventRequestEventEnum.firstOpen: 'first_open',
  InstallEventRequestEventEnum.signinStarted: 'signin_started',
};

const _$InstallEventRequestPlatformEnumEnumMap = {
  InstallEventRequestPlatformEnum.ios: 'ios',
  InstallEventRequestPlatformEnum.android: 'android',
  InstallEventRequestPlatformEnum.macos: 'macos',
  InstallEventRequestPlatformEnum.windows: 'windows',
  InstallEventRequestPlatformEnum.linux: 'linux',
  InstallEventRequestPlatformEnum.web: 'web',
};
