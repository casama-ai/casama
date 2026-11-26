// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_state_payer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsStatePayerCWProxy {
  CloudModelsStatePayer orgId(String orgId);

  CloudModelsStatePayer name(String name);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStatePayer(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStatePayer(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsStatePayer call({String orgId, String name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsStatePayer.copyWith(...)` or call `instanceOfCloudModelsStatePayer.copyWith.fieldName(value)` for a single field.
class _$CloudModelsStatePayerCWProxyImpl
    implements _$CloudModelsStatePayerCWProxy {
  const _$CloudModelsStatePayerCWProxyImpl(this._value);

  final CloudModelsStatePayer _value;

  @override
  CloudModelsStatePayer orgId(String orgId) => call(orgId: orgId);

  @override
  CloudModelsStatePayer name(String name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsStatePayer(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsStatePayer(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsStatePayer call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsStatePayer(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $CloudModelsStatePayerCopyWith on CloudModelsStatePayer {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsStatePayer.copyWith(...)` or `instanceOfCloudModelsStatePayer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsStatePayerCWProxy get copyWith =>
      _$CloudModelsStatePayerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsStatePayer _$CloudModelsStatePayerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsStatePayer', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['org_id', 'name']);
  final val = CloudModelsStatePayer(
    orgId: $checkedConvert('org_id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'orgId': 'org_id'});

Map<String, dynamic> _$CloudModelsStatePayerToJson(
  CloudModelsStatePayer instance,
) => <String, dynamic>{'org_id': instance.orgId, 'name': instance.name};
