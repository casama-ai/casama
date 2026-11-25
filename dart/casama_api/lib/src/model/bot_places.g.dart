// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_places.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BotPlacesCWProxy {
  BotPlaces botId(String botId);

  BotPlaces places(List<BotPlace> places);

  BotPlaces mode(PlaceMode mode);

  BotPlaces deviceId(String? deviceId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BotPlaces(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BotPlaces(...).copyWith(id: 12, name: "My name")
  /// ```
  BotPlaces call({
    String botId,
    List<BotPlace> places,
    PlaceMode mode,
    String? deviceId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBotPlaces.copyWith(...)` or call `instanceOfBotPlaces.copyWith.fieldName(value)` for a single field.
class _$BotPlacesCWProxyImpl implements _$BotPlacesCWProxy {
  const _$BotPlacesCWProxyImpl(this._value);

  final BotPlaces _value;

  @override
  BotPlaces botId(String botId) => call(botId: botId);

  @override
  BotPlaces places(List<BotPlace> places) => call(places: places);

  @override
  BotPlaces mode(PlaceMode mode) => call(mode: mode);

  @override
  BotPlaces deviceId(String? deviceId) => call(deviceId: deviceId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BotPlaces(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BotPlaces(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BotPlaces call({
    Object? botId = const $CopyWithPlaceholder(),
    Object? places = const $CopyWithPlaceholder(),
    Object? mode = const $CopyWithPlaceholder(),
    Object? deviceId = const $CopyWithPlaceholder(),
  }) {
    return BotPlaces(
      botId: botId == const $CopyWithPlaceholder() || botId == null
          ? _value.botId
          // ignore: cast_nullable_to_non_nullable
          : botId as String,
      places: places == const $CopyWithPlaceholder() || places == null
          ? _value.places
          // ignore: cast_nullable_to_non_nullable
          : places as List<BotPlace>,
      mode: mode == const $CopyWithPlaceholder() || mode == null
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as PlaceMode,
      deviceId: deviceId == const $CopyWithPlaceholder()
          ? _value.deviceId
          // ignore: cast_nullable_to_non_nullable
          : deviceId as String?,
    );
  }
}

extension $BotPlacesCopyWith on BotPlaces {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBotPlaces.copyWith(...)` or `instanceOfBotPlaces.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BotPlacesCWProxy get copyWith => _$BotPlacesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotPlaces _$BotPlacesFromJson(Map<String, dynamic> json) => $checkedCreate(
  'BotPlaces',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['bot_id', 'places', 'mode', 'device_id'],
    );
    final val = BotPlaces(
      botId: $checkedConvert('bot_id', (v) => v as String),
      places: $checkedConvert(
        'places',
        (v) => (v as List<dynamic>)
            .map((e) => BotPlace.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      mode: $checkedConvert('mode', (v) => $enumDecode(_$PlaceModeEnumMap, v)),
      deviceId: $checkedConvert('device_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'botId': 'bot_id', 'deviceId': 'device_id'},
);

Map<String, dynamic> _$BotPlacesToJson(BotPlaces instance) => <String, dynamic>{
  'bot_id': instance.botId,
  'places': instance.places.map((e) => e.toJson()).toList(),
  'mode': _$PlaceModeEnumMap[instance.mode]!,
  'device_id': instance.deviceId,
};

const _$PlaceModeEnumMap = {
  PlaceMode.auto: 'auto',
  PlaceMode.botComputer: 'bot_computer',
  PlaceMode.myComputer: 'my_computer',
};
