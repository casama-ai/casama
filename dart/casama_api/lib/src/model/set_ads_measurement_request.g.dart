// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_ads_measurement_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetAdsMeasurementRequestCWProxy {
  SetAdsMeasurementRequest on_(bool on_);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetAdsMeasurementRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetAdsMeasurementRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetAdsMeasurementRequest call({bool on_});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetAdsMeasurementRequest.copyWith(...)` or call `instanceOfSetAdsMeasurementRequest.copyWith.fieldName(value)` for a single field.
class _$SetAdsMeasurementRequestCWProxyImpl
    implements _$SetAdsMeasurementRequestCWProxy {
  const _$SetAdsMeasurementRequestCWProxyImpl(this._value);

  final SetAdsMeasurementRequest _value;

  @override
  SetAdsMeasurementRequest on_(bool on_) => call(on_: on_);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetAdsMeasurementRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetAdsMeasurementRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetAdsMeasurementRequest call({Object? on_ = const $CopyWithPlaceholder()}) {
    return SetAdsMeasurementRequest(
      on_: on_ == const $CopyWithPlaceholder() || on_ == null
          ? _value.on_
          // ignore: cast_nullable_to_non_nullable
          : on_ as bool,
    );
  }
}

extension $SetAdsMeasurementRequestCopyWith on SetAdsMeasurementRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetAdsMeasurementRequest.copyWith(...)` or `instanceOfSetAdsMeasurementRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetAdsMeasurementRequestCWProxy get copyWith =>
      _$SetAdsMeasurementRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAdsMeasurementRequest _$SetAdsMeasurementRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetAdsMeasurementRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['on']);
  final val = SetAdsMeasurementRequest(
    on_: $checkedConvert('on', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'on_': 'on'});

Map<String, dynamic> _$SetAdsMeasurementRequestToJson(
  SetAdsMeasurementRequest instance,
) => <String, dynamic>{'on': instance.on_};
