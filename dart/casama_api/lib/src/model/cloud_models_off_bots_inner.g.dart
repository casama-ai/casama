// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_off_bots_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsOffBotsInnerCWProxy {
  CloudModelsOffBotsInner id(String id);

  CloudModelsOffBotsInner name(String name);

  CloudModelsOffBotsInner to(CloudModelsOffBotsInnerTo? to);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsOffBotsInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsOffBotsInner(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsOffBotsInner call({
    String id,
    String name,
    CloudModelsOffBotsInnerTo? to,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsOffBotsInner.copyWith(...)` or call `instanceOfCloudModelsOffBotsInner.copyWith.fieldName(value)` for a single field.
class _$CloudModelsOffBotsInnerCWProxyImpl
    implements _$CloudModelsOffBotsInnerCWProxy {
  const _$CloudModelsOffBotsInnerCWProxyImpl(this._value);

  final CloudModelsOffBotsInner _value;

  @override
  CloudModelsOffBotsInner id(String id) => call(id: id);

  @override
  CloudModelsOffBotsInner name(String name) => call(name: name);

  @override
  CloudModelsOffBotsInner to(CloudModelsOffBotsInnerTo? to) => call(to: to);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsOffBotsInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsOffBotsInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsOffBotsInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? to = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsOffBotsInner(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      to: to == const $CopyWithPlaceholder()
          ? _value.to
          // ignore: cast_nullable_to_non_nullable
          : to as CloudModelsOffBotsInnerTo?,
    );
  }
}

extension $CloudModelsOffBotsInnerCopyWith on CloudModelsOffBotsInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsOffBotsInner.copyWith(...)` or `instanceOfCloudModelsOffBotsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsOffBotsInnerCWProxy get copyWith =>
      _$CloudModelsOffBotsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsOffBotsInner _$CloudModelsOffBotsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsOffBotsInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'to']);
  final val = CloudModelsOffBotsInner(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    to: $checkedConvert(
      'to',
      (v) => v == null
          ? null
          : CloudModelsOffBotsInnerTo.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CloudModelsOffBotsInnerToJson(
  CloudModelsOffBotsInner instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'to': instance.to?.toJson(),
};
