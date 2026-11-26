// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_move_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateMoveRequestCWProxy {
  CreateMoveRequest orgId(String orgId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateMoveRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateMoveRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateMoveRequest call({String orgId});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateMoveRequest.copyWith(...)` or call `instanceOfCreateMoveRequest.copyWith.fieldName(value)` for a single field.
class _$CreateMoveRequestCWProxyImpl implements _$CreateMoveRequestCWProxy {
  const _$CreateMoveRequestCWProxyImpl(this._value);

  final CreateMoveRequest _value;

  @override
  CreateMoveRequest orgId(String orgId) => call(orgId: orgId);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateMoveRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateMoveRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateMoveRequest call({Object? orgId = const $CopyWithPlaceholder()}) {
    return CreateMoveRequest(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
    );
  }
}

extension $CreateMoveRequestCopyWith on CreateMoveRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateMoveRequest.copyWith(...)` or `instanceOfCreateMoveRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateMoveRequestCWProxy get copyWith =>
      _$CreateMoveRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMoveRequest _$CreateMoveRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateMoveRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['org_id']);
      final val = CreateMoveRequest(
        orgId: $checkedConvert('org_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'orgId': 'org_id'});

Map<String, dynamic> _$CreateMoveRequestToJson(CreateMoveRequest instance) =>
    <String, dynamic>{'org_id': instance.orgId};
