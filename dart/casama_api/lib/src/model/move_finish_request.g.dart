// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_finish_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveFinishRequestCWProxy {
  MoveFinishRequest manifest(Map<String, Object?> manifest);

  MoveFinishRequest signature(String signature);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFinishRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFinishRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveFinishRequest call({Map<String, Object?> manifest, String signature});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveFinishRequest.copyWith(...)` or call `instanceOfMoveFinishRequest.copyWith.fieldName(value)` for a single field.
class _$MoveFinishRequestCWProxyImpl implements _$MoveFinishRequestCWProxy {
  const _$MoveFinishRequestCWProxyImpl(this._value);

  final MoveFinishRequest _value;

  @override
  MoveFinishRequest manifest(Map<String, Object?> manifest) =>
      call(manifest: manifest);

  @override
  MoveFinishRequest signature(String signature) => call(signature: signature);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveFinishRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveFinishRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveFinishRequest call({
    Object? manifest = const $CopyWithPlaceholder(),
    Object? signature = const $CopyWithPlaceholder(),
  }) {
    return MoveFinishRequest(
      manifest: manifest == const $CopyWithPlaceholder() || manifest == null
          ? _value.manifest
          // ignore: cast_nullable_to_non_nullable
          : manifest as Map<String, Object?>,
      signature: signature == const $CopyWithPlaceholder() || signature == null
          ? _value.signature
          // ignore: cast_nullable_to_non_nullable
          : signature as String,
    );
  }
}

extension $MoveFinishRequestCopyWith on MoveFinishRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveFinishRequest.copyWith(...)` or `instanceOfMoveFinishRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveFinishRequestCWProxy get copyWith =>
      _$MoveFinishRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFinishRequest _$MoveFinishRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveFinishRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['manifest', 'signature']);
      final val = MoveFinishRequest(
        manifest: $checkedConvert('manifest', (v) => v as Map<String, dynamic>),
        signature: $checkedConvert('signature', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MoveFinishRequestToJson(MoveFinishRequest instance) =>
    <String, dynamic>{
      'manifest': instance.manifest,
      'signature': instance.signature,
    };
