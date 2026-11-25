// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_user_keep_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetUserKeepRequestCWProxy {
  SetUserKeepRequest keep(bool keep);

  SetUserKeepRequest note(String? note);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetUserKeepRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetUserKeepRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetUserKeepRequest call({bool keep, String? note});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetUserKeepRequest.copyWith(...)` or call `instanceOfSetUserKeepRequest.copyWith.fieldName(value)` for a single field.
class _$SetUserKeepRequestCWProxyImpl implements _$SetUserKeepRequestCWProxy {
  const _$SetUserKeepRequestCWProxyImpl(this._value);

  final SetUserKeepRequest _value;

  @override
  SetUserKeepRequest keep(bool keep) => call(keep: keep);

  @override
  SetUserKeepRequest note(String? note) => call(note: note);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetUserKeepRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetUserKeepRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetUserKeepRequest call({
    Object? keep = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return SetUserKeepRequest(
      keep: keep == const $CopyWithPlaceholder() || keep == null
          ? _value.keep
          // ignore: cast_nullable_to_non_nullable
          : keep as bool,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $SetUserKeepRequestCopyWith on SetUserKeepRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetUserKeepRequest.copyWith(...)` or `instanceOfSetUserKeepRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetUserKeepRequestCWProxy get copyWith =>
      _$SetUserKeepRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetUserKeepRequest _$SetUserKeepRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SetUserKeepRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['keep']);
      final val = SetUserKeepRequest(
        keep: $checkedConvert('keep', (v) => v as bool),
        note: $checkedConvert('note', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SetUserKeepRequestToJson(SetUserKeepRequest instance) =>
    <String, dynamic>{'keep': instance.keep, 'note': ?instance.note};
