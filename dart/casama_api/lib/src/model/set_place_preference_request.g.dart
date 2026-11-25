// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_place_preference_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetPlacePreferenceRequestCWProxy {
  SetPlacePreferenceRequest mode(PlaceMode? mode);

  SetPlacePreferenceRequest deviceId(String? deviceId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetPlacePreferenceRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetPlacePreferenceRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetPlacePreferenceRequest call({PlaceMode? mode, String? deviceId});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetPlacePreferenceRequest.copyWith(...)` or call `instanceOfSetPlacePreferenceRequest.copyWith.fieldName(value)` for a single field.
class _$SetPlacePreferenceRequestCWProxyImpl
    implements _$SetPlacePreferenceRequestCWProxy {
  const _$SetPlacePreferenceRequestCWProxyImpl(this._value);

  final SetPlacePreferenceRequest _value;

  @override
  SetPlacePreferenceRequest mode(PlaceMode? mode) => call(mode: mode);

  @override
  SetPlacePreferenceRequest deviceId(String? deviceId) =>
      call(deviceId: deviceId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetPlacePreferenceRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetPlacePreferenceRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetPlacePreferenceRequest call({
    Object? mode = const $CopyWithPlaceholder(),
    Object? deviceId = const $CopyWithPlaceholder(),
  }) {
    return SetPlacePreferenceRequest(
      mode: mode == const $CopyWithPlaceholder()
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as PlaceMode?,
      deviceId: deviceId == const $CopyWithPlaceholder()
          ? _value.deviceId
          // ignore: cast_nullable_to_non_nullable
          : deviceId as String?,
    );
  }
}

extension $SetPlacePreferenceRequestCopyWith on SetPlacePreferenceRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetPlacePreferenceRequest.copyWith(...)` or `instanceOfSetPlacePreferenceRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetPlacePreferenceRequestCWProxy get copyWith =>
      _$SetPlacePreferenceRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPlacePreferenceRequest _$SetPlacePreferenceRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetPlacePreferenceRequest', json, ($checkedConvert) {
  final val = SetPlacePreferenceRequest(
    mode: $checkedConvert(
      'mode',
      (v) => $enumDecodeNullable(_$PlaceModeEnumMap, v),
    ),
    deviceId: $checkedConvert('device_id', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'deviceId': 'device_id'});

Map<String, dynamic> _$SetPlacePreferenceRequestToJson(
  SetPlacePreferenceRequest instance,
) => <String, dynamic>{
  'mode': ?_$PlaceModeEnumMap[instance.mode],
  'device_id': ?instance.deviceId,
};

const _$PlaceModeEnumMap = {
  PlaceMode.auto: 'auto',
  PlaceMode.botComputer: 'bot_computer',
  PlaceMode.myComputer: 'my_computer',
};
