// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_preview_bots_inner_from.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsPreviewBotsInnerFromCWProxy {
  CloudModelsPreviewBotsInnerFrom credentialId(String? credentialId);

  CloudModelsPreviewBotsInnerFrom provider(String? provider);

  CloudModelsPreviewBotsInnerFrom model(String? model);

  CloudModelsPreviewBotsInnerFrom label(String? label);

  CloudModelsPreviewBotsInnerFrom working(bool working);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewBotsInnerFrom(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewBotsInnerFrom(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsPreviewBotsInnerFrom call({
    String? credentialId,
    String? provider,
    String? model,
    String? label,
    bool working,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsPreviewBotsInnerFrom.copyWith(...)` or call `instanceOfCloudModelsPreviewBotsInnerFrom.copyWith.fieldName(value)` for a single field.
class _$CloudModelsPreviewBotsInnerFromCWProxyImpl
    implements _$CloudModelsPreviewBotsInnerFromCWProxy {
  const _$CloudModelsPreviewBotsInnerFromCWProxyImpl(this._value);

  final CloudModelsPreviewBotsInnerFrom _value;

  @override
  CloudModelsPreviewBotsInnerFrom credentialId(String? credentialId) =>
      call(credentialId: credentialId);

  @override
  CloudModelsPreviewBotsInnerFrom provider(String? provider) =>
      call(provider: provider);

  @override
  CloudModelsPreviewBotsInnerFrom model(String? model) => call(model: model);

  @override
  CloudModelsPreviewBotsInnerFrom label(String? label) => call(label: label);

  @override
  CloudModelsPreviewBotsInnerFrom working(bool working) =>
      call(working: working);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewBotsInnerFrom(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewBotsInnerFrom(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsPreviewBotsInnerFrom call({
    Object? credentialId = const $CopyWithPlaceholder(),
    Object? provider = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? working = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsPreviewBotsInnerFrom(
      credentialId: credentialId == const $CopyWithPlaceholder()
          ? _value.credentialId
          // ignore: cast_nullable_to_non_nullable
          : credentialId as String?,
      provider: provider == const $CopyWithPlaceholder()
          ? _value.provider
          // ignore: cast_nullable_to_non_nullable
          : provider as String?,
      model: model == const $CopyWithPlaceholder()
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String?,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      working: working == const $CopyWithPlaceholder() || working == null
          ? _value.working
          // ignore: cast_nullable_to_non_nullable
          : working as bool,
    );
  }
}

extension $CloudModelsPreviewBotsInnerFromCopyWith
    on CloudModelsPreviewBotsInnerFrom {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsPreviewBotsInnerFrom.copyWith(...)` or `instanceOfCloudModelsPreviewBotsInnerFrom.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsPreviewBotsInnerFromCWProxy get copyWith =>
      _$CloudModelsPreviewBotsInnerFromCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsPreviewBotsInnerFrom _$CloudModelsPreviewBotsInnerFromFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsPreviewBotsInnerFrom', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'credential_id',
      'provider',
      'model',
      'label',
      'working',
    ],
  );
  final val = CloudModelsPreviewBotsInnerFrom(
    credentialId: $checkedConvert('credential_id', (v) => v as String?),
    provider: $checkedConvert('provider', (v) => v as String?),
    model: $checkedConvert('model', (v) => v as String?),
    label: $checkedConvert('label', (v) => v as String?),
    working: $checkedConvert('working', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'credentialId': 'credential_id'});

Map<String, dynamic> _$CloudModelsPreviewBotsInnerFromToJson(
  CloudModelsPreviewBotsInnerFrom instance,
) => <String, dynamic>{
  'credential_id': instance.credentialId,
  'provider': instance.provider,
  'model': instance.model,
  'label': instance.label,
  'working': instance.working,
};
