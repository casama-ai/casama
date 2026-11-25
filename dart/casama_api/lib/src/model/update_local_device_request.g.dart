// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_local_device_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateLocalDeviceRequestCWProxy {
  UpdateLocalDeviceRequest name(String? name);

  UpdateLocalDeviceRequest capabilities(LocalCapabilities? capabilities);

  UpdateLocalDeviceRequest allowedRoots(List<String>? allowedRoots);

  UpdateLocalDeviceRequest allowedBotIds(List<String>? allowedBotIds);

  UpdateLocalDeviceRequest allBots(bool? allBots);

  UpdateLocalDeviceRequest browserMode(
    UpdateLocalDeviceRequestBrowserModeEnum? browserMode,
  );

  UpdateLocalDeviceRequest allowedSites(List<String>? allowedSites);

  UpdateLocalDeviceRequest blockedSites(List<String>? blockedSites);

  UpdateLocalDeviceRequest neverAskSites(List<String>? neverAskSites);

  UpdateLocalDeviceRequest allowedKinds(List<SiteKind>? allowedKinds);

  UpdateLocalDeviceRequest allowedCodingAgents(
    List<String>? allowedCodingAgents,
  );

  UpdateLocalDeviceRequest enabled(bool? enabled);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateLocalDeviceRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateLocalDeviceRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateLocalDeviceRequest call({
    String? name,
    LocalCapabilities? capabilities,
    List<String>? allowedRoots,
    List<String>? allowedBotIds,
    bool? allBots,
    UpdateLocalDeviceRequestBrowserModeEnum? browserMode,
    List<String>? allowedSites,
    List<String>? blockedSites,
    List<String>? neverAskSites,
    List<SiteKind>? allowedKinds,
    List<String>? allowedCodingAgents,
    bool? enabled,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateLocalDeviceRequest.copyWith(...)` or call `instanceOfUpdateLocalDeviceRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateLocalDeviceRequestCWProxyImpl
    implements _$UpdateLocalDeviceRequestCWProxy {
  const _$UpdateLocalDeviceRequestCWProxyImpl(this._value);

  final UpdateLocalDeviceRequest _value;

  @override
  UpdateLocalDeviceRequest name(String? name) => call(name: name);

  @override
  UpdateLocalDeviceRequest capabilities(LocalCapabilities? capabilities) =>
      call(capabilities: capabilities);

  @override
  UpdateLocalDeviceRequest allowedRoots(List<String>? allowedRoots) =>
      call(allowedRoots: allowedRoots);

  @override
  UpdateLocalDeviceRequest allowedBotIds(List<String>? allowedBotIds) =>
      call(allowedBotIds: allowedBotIds);

  @override
  UpdateLocalDeviceRequest allBots(bool? allBots) => call(allBots: allBots);

  @override
  UpdateLocalDeviceRequest browserMode(
    UpdateLocalDeviceRequestBrowserModeEnum? browserMode,
  ) => call(browserMode: browserMode);

  @override
  UpdateLocalDeviceRequest allowedSites(List<String>? allowedSites) =>
      call(allowedSites: allowedSites);

  @override
  UpdateLocalDeviceRequest blockedSites(List<String>? blockedSites) =>
      call(blockedSites: blockedSites);

  @override
  UpdateLocalDeviceRequest neverAskSites(List<String>? neverAskSites) =>
      call(neverAskSites: neverAskSites);

  @override
  UpdateLocalDeviceRequest allowedKinds(List<SiteKind>? allowedKinds) =>
      call(allowedKinds: allowedKinds);

  @override
  UpdateLocalDeviceRequest allowedCodingAgents(
    List<String>? allowedCodingAgents,
  ) => call(allowedCodingAgents: allowedCodingAgents);

  @override
  UpdateLocalDeviceRequest enabled(bool? enabled) => call(enabled: enabled);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateLocalDeviceRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateLocalDeviceRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateLocalDeviceRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? capabilities = const $CopyWithPlaceholder(),
    Object? allowedRoots = const $CopyWithPlaceholder(),
    Object? allowedBotIds = const $CopyWithPlaceholder(),
    Object? allBots = const $CopyWithPlaceholder(),
    Object? browserMode = const $CopyWithPlaceholder(),
    Object? allowedSites = const $CopyWithPlaceholder(),
    Object? blockedSites = const $CopyWithPlaceholder(),
    Object? neverAskSites = const $CopyWithPlaceholder(),
    Object? allowedKinds = const $CopyWithPlaceholder(),
    Object? allowedCodingAgents = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return UpdateLocalDeviceRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      capabilities: capabilities == const $CopyWithPlaceholder()
          ? _value.capabilities
          // ignore: cast_nullable_to_non_nullable
          : capabilities as LocalCapabilities?,
      allowedRoots: allowedRoots == const $CopyWithPlaceholder()
          ? _value.allowedRoots
          // ignore: cast_nullable_to_non_nullable
          : allowedRoots as List<String>?,
      allowedBotIds: allowedBotIds == const $CopyWithPlaceholder()
          ? _value.allowedBotIds
          // ignore: cast_nullable_to_non_nullable
          : allowedBotIds as List<String>?,
      allBots: allBots == const $CopyWithPlaceholder()
          ? _value.allBots
          // ignore: cast_nullable_to_non_nullable
          : allBots as bool?,
      browserMode: browserMode == const $CopyWithPlaceholder()
          ? _value.browserMode
          // ignore: cast_nullable_to_non_nullable
          : browserMode as UpdateLocalDeviceRequestBrowserModeEnum?,
      allowedSites: allowedSites == const $CopyWithPlaceholder()
          ? _value.allowedSites
          // ignore: cast_nullable_to_non_nullable
          : allowedSites as List<String>?,
      blockedSites: blockedSites == const $CopyWithPlaceholder()
          ? _value.blockedSites
          // ignore: cast_nullable_to_non_nullable
          : blockedSites as List<String>?,
      neverAskSites: neverAskSites == const $CopyWithPlaceholder()
          ? _value.neverAskSites
          // ignore: cast_nullable_to_non_nullable
          : neverAskSites as List<String>?,
      allowedKinds: allowedKinds == const $CopyWithPlaceholder()
          ? _value.allowedKinds
          // ignore: cast_nullable_to_non_nullable
          : allowedKinds as List<SiteKind>?,
      allowedCodingAgents: allowedCodingAgents == const $CopyWithPlaceholder()
          ? _value.allowedCodingAgents
          // ignore: cast_nullable_to_non_nullable
          : allowedCodingAgents as List<String>?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $UpdateLocalDeviceRequestCopyWith on UpdateLocalDeviceRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateLocalDeviceRequest.copyWith(...)` or `instanceOfUpdateLocalDeviceRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateLocalDeviceRequestCWProxy get copyWith =>
      _$UpdateLocalDeviceRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLocalDeviceRequest _$UpdateLocalDeviceRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateLocalDeviceRequest',
  json,
  ($checkedConvert) {
    final val = UpdateLocalDeviceRequest(
      name: $checkedConvert('name', (v) => v as String?),
      capabilities: $checkedConvert(
        'capabilities',
        (v) => v == null
            ? null
            : LocalCapabilities.fromJson(v as Map<String, dynamic>),
      ),
      allowedRoots: $checkedConvert(
        'allowed_roots',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      allowedBotIds: $checkedConvert(
        'allowed_bot_ids',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      allBots: $checkedConvert('all_bots', (v) => v as bool?),
      browserMode: $checkedConvert(
        'browser_mode',
        (v) => $enumDecodeNullable(
          _$UpdateLocalDeviceRequestBrowserModeEnumEnumMap,
          v,
        ),
      ),
      allowedSites: $checkedConvert(
        'allowed_sites',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      blockedSites: $checkedConvert(
        'blocked_sites',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      neverAskSites: $checkedConvert(
        'never_ask_sites',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      allowedKinds: $checkedConvert(
        'allowed_kinds',
        (v) => (v as List<dynamic>?)
            ?.map((e) => $enumDecode(_$SiteKindEnumMap, e))
            .toList(),
      ),
      allowedCodingAgents: $checkedConvert(
        'allowed_coding_agents',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      enabled: $checkedConvert('enabled', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'allowedRoots': 'allowed_roots',
    'allowedBotIds': 'allowed_bot_ids',
    'allBots': 'all_bots',
    'browserMode': 'browser_mode',
    'allowedSites': 'allowed_sites',
    'blockedSites': 'blocked_sites',
    'neverAskSites': 'never_ask_sites',
    'allowedKinds': 'allowed_kinds',
    'allowedCodingAgents': 'allowed_coding_agents',
  },
);

Map<String, dynamic> _$UpdateLocalDeviceRequestToJson(
  UpdateLocalDeviceRequest instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'capabilities': ?instance.capabilities?.toJson(),
  'allowed_roots': ?instance.allowedRoots,
  'allowed_bot_ids': ?instance.allowedBotIds,
  'all_bots': ?instance.allBots,
  'browser_mode':
      ?_$UpdateLocalDeviceRequestBrowserModeEnumEnumMap[instance.browserMode],
  'allowed_sites': ?instance.allowedSites,
  'blocked_sites': ?instance.blockedSites,
  'never_ask_sites': ?instance.neverAskSites,
  'allowed_kinds': ?instance.allowedKinds
      ?.map((e) => _$SiteKindEnumMap[e]!)
      .toList(),
  'allowed_coding_agents': ?instance.allowedCodingAgents,
  'enabled': ?instance.enabled,
};

const _$UpdateLocalDeviceRequestBrowserModeEnumEnumMap = {
  UpdateLocalDeviceRequestBrowserModeEnum.ask: 'ask',
  UpdateLocalDeviceRequestBrowserModeEnum.computer: 'computer',
  UpdateLocalDeviceRequestBrowserModeEnum.device: 'device',
};

const _$SiteKindEnumMap = {
  SiteKind.banking: 'banking',
  SiteKind.health: 'health',
  SiteKind.passwords: 'passwords',
  SiteKind.government: 'government',
};
