// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_place.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BotPlaceCWProxy {
  BotPlace where(PlaceWhere where);

  BotPlace computerId(String computerId);

  BotPlace deviceId(String? deviceId);

  BotPlace name(String name);

  BotPlace kind(BotPlaceKindEnum kind);

  BotPlace platform(String? platform);

  BotPlace online(bool online);

  BotPlace capabilities(Map<String, bool> capabilities);

  BotPlace selected(bool selected);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BotPlace(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BotPlace(...).copyWith(id: 12, name: "My name")
  /// ```
  BotPlace call({
    PlaceWhere where,
    String computerId,
    String? deviceId,
    String name,
    BotPlaceKindEnum kind,
    String? platform,
    bool online,
    Map<String, bool> capabilities,
    bool selected,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBotPlace.copyWith(...)` or call `instanceOfBotPlace.copyWith.fieldName(value)` for a single field.
class _$BotPlaceCWProxyImpl implements _$BotPlaceCWProxy {
  const _$BotPlaceCWProxyImpl(this._value);

  final BotPlace _value;

  @override
  BotPlace where(PlaceWhere where) => call(where: where);

  @override
  BotPlace computerId(String computerId) => call(computerId: computerId);

  @override
  BotPlace deviceId(String? deviceId) => call(deviceId: deviceId);

  @override
  BotPlace name(String name) => call(name: name);

  @override
  BotPlace kind(BotPlaceKindEnum kind) => call(kind: kind);

  @override
  BotPlace platform(String? platform) => call(platform: platform);

  @override
  BotPlace online(bool online) => call(online: online);

  @override
  BotPlace capabilities(Map<String, bool> capabilities) =>
      call(capabilities: capabilities);

  @override
  BotPlace selected(bool selected) => call(selected: selected);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BotPlace(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BotPlace(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BotPlace call({
    Object? where = const $CopyWithPlaceholder(),
    Object? computerId = const $CopyWithPlaceholder(),
    Object? deviceId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? online = const $CopyWithPlaceholder(),
    Object? capabilities = const $CopyWithPlaceholder(),
    Object? selected = const $CopyWithPlaceholder(),
  }) {
    return BotPlace(
      where: where == const $CopyWithPlaceholder() || where == null
          ? _value.where
          // ignore: cast_nullable_to_non_nullable
          : where as PlaceWhere,
      computerId:
          computerId == const $CopyWithPlaceholder() || computerId == null
          ? _value.computerId
          // ignore: cast_nullable_to_non_nullable
          : computerId as String,
      deviceId: deviceId == const $CopyWithPlaceholder()
          ? _value.deviceId
          // ignore: cast_nullable_to_non_nullable
          : deviceId as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as BotPlaceKindEnum,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
      online: online == const $CopyWithPlaceholder() || online == null
          ? _value.online
          // ignore: cast_nullable_to_non_nullable
          : online as bool,
      capabilities:
          capabilities == const $CopyWithPlaceholder() || capabilities == null
          ? _value.capabilities
          // ignore: cast_nullable_to_non_nullable
          : capabilities as Map<String, bool>,
      selected: selected == const $CopyWithPlaceholder() || selected == null
          ? _value.selected
          // ignore: cast_nullable_to_non_nullable
          : selected as bool,
    );
  }
}

extension $BotPlaceCopyWith on BotPlace {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBotPlace.copyWith(...)` or `instanceOfBotPlace.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BotPlaceCWProxy get copyWith => _$BotPlaceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotPlace _$BotPlaceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BotPlace', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'where',
      'computer_id',
      'device_id',
      'name',
      'kind',
      'platform',
      'online',
      'capabilities',
      'selected',
    ],
  );
  final val = BotPlace(
    where: $checkedConvert('where', (v) => $enumDecode(_$PlaceWhereEnumMap, v)),
    computerId: $checkedConvert('computer_id', (v) => v as String),
    deviceId: $checkedConvert('device_id', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String),
    kind: $checkedConvert(
      'kind',
      (v) => $enumDecode(_$BotPlaceKindEnumEnumMap, v),
    ),
    platform: $checkedConvert('platform', (v) => v as String?),
    online: $checkedConvert('online', (v) => v as bool),
    capabilities: $checkedConvert(
      'capabilities',
      (v) => Map<String, bool>.from(v as Map),
    ),
    selected: $checkedConvert('selected', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'computerId': 'computer_id', 'deviceId': 'device_id'});

Map<String, dynamic> _$BotPlaceToJson(BotPlace instance) => <String, dynamic>{
  'where': _$PlaceWhereEnumMap[instance.where]!,
  'computer_id': instance.computerId,
  'device_id': instance.deviceId,
  'name': instance.name,
  'kind': _$BotPlaceKindEnumEnumMap[instance.kind]!,
  'platform': instance.platform,
  'online': instance.online,
  'capabilities': instance.capabilities,
  'selected': instance.selected,
};

const _$PlaceWhereEnumMap = {
  PlaceWhere.botComputer: 'bot_computer',
  PlaceWhere.myComputer: 'my_computer',
};

const _$BotPlaceKindEnumEnumMap = {
  BotPlaceKindEnum.private: 'private',
  BotPlaceKindEnum.team: 'team',
  BotPlaceKindEnum.local: 'local',
};
