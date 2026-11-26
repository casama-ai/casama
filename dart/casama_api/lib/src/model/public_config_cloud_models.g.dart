// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_config_cloud_models.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PublicConfigCloudModelsCWProxy {
  PublicConfigCloudModels available(bool available);

  PublicConfigCloudModels connected(bool connected);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublicConfigCloudModels(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublicConfigCloudModels(...).copyWith(id: 12, name: "My name")
  /// ```
  PublicConfigCloudModels call({bool available, bool connected});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPublicConfigCloudModels.copyWith(...)` or call `instanceOfPublicConfigCloudModels.copyWith.fieldName(value)` for a single field.
class _$PublicConfigCloudModelsCWProxyImpl
    implements _$PublicConfigCloudModelsCWProxy {
  const _$PublicConfigCloudModelsCWProxyImpl(this._value);

  final PublicConfigCloudModels _value;

  @override
  PublicConfigCloudModels available(bool available) =>
      call(available: available);

  @override
  PublicConfigCloudModels connected(bool connected) =>
      call(connected: connected);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublicConfigCloudModels(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublicConfigCloudModels(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PublicConfigCloudModels call({
    Object? available = const $CopyWithPlaceholder(),
    Object? connected = const $CopyWithPlaceholder(),
  }) {
    return PublicConfigCloudModels(
      available: available == const $CopyWithPlaceholder() || available == null
          ? _value.available
          // ignore: cast_nullable_to_non_nullable
          : available as bool,
      connected: connected == const $CopyWithPlaceholder() || connected == null
          ? _value.connected
          // ignore: cast_nullable_to_non_nullable
          : connected as bool,
    );
  }
}

extension $PublicConfigCloudModelsCopyWith on PublicConfigCloudModels {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPublicConfigCloudModels.copyWith(...)` or `instanceOfPublicConfigCloudModels.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PublicConfigCloudModelsCWProxy get copyWith =>
      _$PublicConfigCloudModelsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicConfigCloudModels _$PublicConfigCloudModelsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PublicConfigCloudModels', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['available', 'connected']);
  final val = PublicConfigCloudModels(
    available: $checkedConvert('available', (v) => v as bool),
    connected: $checkedConvert('connected', (v) => v as bool),
  );
  return val;
});

Map<String, dynamic> _$PublicConfigCloudModelsToJson(
  PublicConfigCloudModels instance,
) => <String, dynamic>{
  'available': instance.available,
  'connected': instance.connected,
};
