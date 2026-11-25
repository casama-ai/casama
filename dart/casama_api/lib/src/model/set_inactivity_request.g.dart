// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_inactivity_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetInactivityRequestCWProxy {
  SetInactivityRequest rest(InactivityStepMode? rest);

  SetInactivityRequest files(InactivityStepMode? files);

  SetInactivityRequest removal(InactivityStepMode? removal);

  SetInactivityRequest unconfirmed(InactivityStepMode? unconfirmed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetInactivityRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetInactivityRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetInactivityRequest call({
    InactivityStepMode? rest,
    InactivityStepMode? files,
    InactivityStepMode? removal,
    InactivityStepMode? unconfirmed,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetInactivityRequest.copyWith(...)` or call `instanceOfSetInactivityRequest.copyWith.fieldName(value)` for a single field.
class _$SetInactivityRequestCWProxyImpl
    implements _$SetInactivityRequestCWProxy {
  const _$SetInactivityRequestCWProxyImpl(this._value);

  final SetInactivityRequest _value;

  @override
  SetInactivityRequest rest(InactivityStepMode? rest) => call(rest: rest);

  @override
  SetInactivityRequest files(InactivityStepMode? files) => call(files: files);

  @override
  SetInactivityRequest removal(InactivityStepMode? removal) =>
      call(removal: removal);

  @override
  SetInactivityRequest unconfirmed(InactivityStepMode? unconfirmed) =>
      call(unconfirmed: unconfirmed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetInactivityRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetInactivityRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetInactivityRequest call({
    Object? rest = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
    Object? removal = const $CopyWithPlaceholder(),
    Object? unconfirmed = const $CopyWithPlaceholder(),
  }) {
    return SetInactivityRequest(
      rest: rest == const $CopyWithPlaceholder()
          ? _value.rest
          // ignore: cast_nullable_to_non_nullable
          : rest as InactivityStepMode?,
      files: files == const $CopyWithPlaceholder()
          ? _value.files
          // ignore: cast_nullable_to_non_nullable
          : files as InactivityStepMode?,
      removal: removal == const $CopyWithPlaceholder()
          ? _value.removal
          // ignore: cast_nullable_to_non_nullable
          : removal as InactivityStepMode?,
      unconfirmed: unconfirmed == const $CopyWithPlaceholder()
          ? _value.unconfirmed
          // ignore: cast_nullable_to_non_nullable
          : unconfirmed as InactivityStepMode?,
    );
  }
}

extension $SetInactivityRequestCopyWith on SetInactivityRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetInactivityRequest.copyWith(...)` or `instanceOfSetInactivityRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetInactivityRequestCWProxy get copyWith =>
      _$SetInactivityRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetInactivityRequest _$SetInactivityRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetInactivityRequest', json, ($checkedConvert) {
  final val = SetInactivityRequest(
    rest: $checkedConvert(
      'rest',
      (v) => $enumDecodeNullable(_$InactivityStepModeEnumMap, v),
    ),
    files: $checkedConvert(
      'files',
      (v) => $enumDecodeNullable(_$InactivityStepModeEnumMap, v),
    ),
    removal: $checkedConvert(
      'removal',
      (v) => $enumDecodeNullable(_$InactivityStepModeEnumMap, v),
    ),
    unconfirmed: $checkedConvert(
      'unconfirmed',
      (v) => $enumDecodeNullable(_$InactivityStepModeEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$SetInactivityRequestToJson(
  SetInactivityRequest instance,
) => <String, dynamic>{
  'rest': ?_$InactivityStepModeEnumMap[instance.rest],
  'files': ?_$InactivityStepModeEnumMap[instance.files],
  'removal': ?_$InactivityStepModeEnumMap[instance.removal],
  'unconfirmed': ?_$InactivityStepModeEnumMap[instance.unconfirmed],
};

const _$InactivityStepModeEnumMap = {
  InactivityStepMode.off: 'off',
  InactivityStepMode.report: 'report',
  InactivityStepMode.on_: 'on',
};
