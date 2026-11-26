// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_cloud_models_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConnectCloudModelsRequestCWProxy {
  ConnectCloudModelsRequest code(String code);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ConnectCloudModelsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ConnectCloudModelsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ConnectCloudModelsRequest call({String code});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfConnectCloudModelsRequest.copyWith(...)` or call `instanceOfConnectCloudModelsRequest.copyWith.fieldName(value)` for a single field.
class _$ConnectCloudModelsRequestCWProxyImpl
    implements _$ConnectCloudModelsRequestCWProxy {
  const _$ConnectCloudModelsRequestCWProxyImpl(this._value);

  final ConnectCloudModelsRequest _value;

  @override
  ConnectCloudModelsRequest code(String code) => call(code: code);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ConnectCloudModelsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ConnectCloudModelsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ConnectCloudModelsRequest call({
    Object? code = const $CopyWithPlaceholder(),
  }) {
    return ConnectCloudModelsRequest(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
    );
  }
}

extension $ConnectCloudModelsRequestCopyWith on ConnectCloudModelsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfConnectCloudModelsRequest.copyWith(...)` or `instanceOfConnectCloudModelsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConnectCloudModelsRequestCWProxy get copyWith =>
      _$ConnectCloudModelsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectCloudModelsRequest _$ConnectCloudModelsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConnectCloudModelsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['code']);
  final val = ConnectCloudModelsRequest(
    code: $checkedConvert('code', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ConnectCloudModelsRequestToJson(
  ConnectCloudModelsRequest instance,
) => <String, dynamic>{'code': instance.code};
