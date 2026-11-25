// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_pointer_event_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScreenPointerEventPayloadCWProxy {
  ScreenPointerEventPayload callId(String callId);

  ScreenPointerEventPayload computerId(String computerId);

  ScreenPointerEventPayload action(String action);

  ScreenPointerEventPayload x(num x);

  ScreenPointerEventPayload y(num y);

  ScreenPointerEventPayload width(num width);

  ScreenPointerEventPayload height(num height);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ScreenPointerEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ScreenPointerEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  ScreenPointerEventPayload call({
    String callId,
    String computerId,
    String action,
    num x,
    num y,
    num width,
    num height,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfScreenPointerEventPayload.copyWith(...)` or call `instanceOfScreenPointerEventPayload.copyWith.fieldName(value)` for a single field.
class _$ScreenPointerEventPayloadCWProxyImpl
    implements _$ScreenPointerEventPayloadCWProxy {
  const _$ScreenPointerEventPayloadCWProxyImpl(this._value);

  final ScreenPointerEventPayload _value;

  @override
  ScreenPointerEventPayload callId(String callId) => call(callId: callId);

  @override
  ScreenPointerEventPayload computerId(String computerId) =>
      call(computerId: computerId);

  @override
  ScreenPointerEventPayload action(String action) => call(action: action);

  @override
  ScreenPointerEventPayload x(num x) => call(x: x);

  @override
  ScreenPointerEventPayload y(num y) => call(y: y);

  @override
  ScreenPointerEventPayload width(num width) => call(width: width);

  @override
  ScreenPointerEventPayload height(num height) => call(height: height);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ScreenPointerEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ScreenPointerEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ScreenPointerEventPayload call({
    Object? callId = const $CopyWithPlaceholder(),
    Object? computerId = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
    Object? x = const $CopyWithPlaceholder(),
    Object? y = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
  }) {
    return ScreenPointerEventPayload(
      callId: callId == const $CopyWithPlaceholder() || callId == null
          ? _value.callId
          // ignore: cast_nullable_to_non_nullable
          : callId as String,
      computerId:
          computerId == const $CopyWithPlaceholder() || computerId == null
          ? _value.computerId
          // ignore: cast_nullable_to_non_nullable
          : computerId as String,
      action: action == const $CopyWithPlaceholder() || action == null
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as String,
      x: x == const $CopyWithPlaceholder() || x == null
          ? _value.x
          // ignore: cast_nullable_to_non_nullable
          : x as num,
      y: y == const $CopyWithPlaceholder() || y == null
          ? _value.y
          // ignore: cast_nullable_to_non_nullable
          : y as num,
      width: width == const $CopyWithPlaceholder() || width == null
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as num,
      height: height == const $CopyWithPlaceholder() || height == null
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as num,
    );
  }
}

extension $ScreenPointerEventPayloadCopyWith on ScreenPointerEventPayload {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfScreenPointerEventPayload.copyWith(...)` or `instanceOfScreenPointerEventPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScreenPointerEventPayloadCWProxy get copyWith =>
      _$ScreenPointerEventPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenPointerEventPayload _$ScreenPointerEventPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ScreenPointerEventPayload', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'call_id',
      'computer_id',
      'action',
      'x',
      'y',
      'width',
      'height',
    ],
  );
  final val = ScreenPointerEventPayload(
    callId: $checkedConvert('call_id', (v) => v as String),
    computerId: $checkedConvert('computer_id', (v) => v as String),
    action: $checkedConvert('action', (v) => v as String),
    x: $checkedConvert('x', (v) => v as num),
    y: $checkedConvert('y', (v) => v as num),
    width: $checkedConvert('width', (v) => v as num),
    height: $checkedConvert('height', (v) => v as num),
  );
  return val;
}, fieldKeyMap: const {'callId': 'call_id', 'computerId': 'computer_id'});

Map<String, dynamic> _$ScreenPointerEventPayloadToJson(
  ScreenPointerEventPayload instance,
) => <String, dynamic>{
  'call_id': instance.callId,
  'computer_id': instance.computerId,
  'action': instance.action,
  'x': instance.x,
  'y': instance.y,
  'width': instance.width,
  'height': instance.height,
};
