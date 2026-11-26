// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_preview_bots_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsPreviewBotsInnerCWProxy {
  CloudModelsPreviewBotsInner id(String id);

  CloudModelsPreviewBotsInner name(String name);

  CloudModelsPreviewBotsInner from(CloudModelsPreviewBotsInnerFrom from);

  CloudModelsPreviewBotsInner suggested(bool suggested);

  CloudModelsPreviewBotsInner stepDown(bool stepDown);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewBotsInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewBotsInner(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsPreviewBotsInner call({
    String id,
    String name,
    CloudModelsPreviewBotsInnerFrom from,
    bool suggested,
    bool stepDown,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsPreviewBotsInner.copyWith(...)` or call `instanceOfCloudModelsPreviewBotsInner.copyWith.fieldName(value)` for a single field.
class _$CloudModelsPreviewBotsInnerCWProxyImpl
    implements _$CloudModelsPreviewBotsInnerCWProxy {
  const _$CloudModelsPreviewBotsInnerCWProxyImpl(this._value);

  final CloudModelsPreviewBotsInner _value;

  @override
  CloudModelsPreviewBotsInner id(String id) => call(id: id);

  @override
  CloudModelsPreviewBotsInner name(String name) => call(name: name);

  @override
  CloudModelsPreviewBotsInner from(CloudModelsPreviewBotsInnerFrom from) =>
      call(from: from);

  @override
  CloudModelsPreviewBotsInner suggested(bool suggested) =>
      call(suggested: suggested);

  @override
  CloudModelsPreviewBotsInner stepDown(bool stepDown) =>
      call(stepDown: stepDown);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsPreviewBotsInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsPreviewBotsInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsPreviewBotsInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? from = const $CopyWithPlaceholder(),
    Object? suggested = const $CopyWithPlaceholder(),
    Object? stepDown = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsPreviewBotsInner(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      from: from == const $CopyWithPlaceholder() || from == null
          ? _value.from
          // ignore: cast_nullable_to_non_nullable
          : from as CloudModelsPreviewBotsInnerFrom,
      suggested: suggested == const $CopyWithPlaceholder() || suggested == null
          ? _value.suggested
          // ignore: cast_nullable_to_non_nullable
          : suggested as bool,
      stepDown: stepDown == const $CopyWithPlaceholder() || stepDown == null
          ? _value.stepDown
          // ignore: cast_nullable_to_non_nullable
          : stepDown as bool,
    );
  }
}

extension $CloudModelsPreviewBotsInnerCopyWith on CloudModelsPreviewBotsInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsPreviewBotsInner.copyWith(...)` or `instanceOfCloudModelsPreviewBotsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsPreviewBotsInnerCWProxy get copyWith =>
      _$CloudModelsPreviewBotsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsPreviewBotsInner _$CloudModelsPreviewBotsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsPreviewBotsInner', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'from', 'suggested', 'step_down'],
  );
  final val = CloudModelsPreviewBotsInner(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    from: $checkedConvert(
      'from',
      (v) =>
          CloudModelsPreviewBotsInnerFrom.fromJson(v as Map<String, dynamic>),
    ),
    suggested: $checkedConvert('suggested', (v) => v as bool),
    stepDown: $checkedConvert('step_down', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'stepDown': 'step_down'});

Map<String, dynamic> _$CloudModelsPreviewBotsInnerToJson(
  CloudModelsPreviewBotsInner instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'from': instance.from.toJson(),
  'suggested': instance.suggested,
  'step_down': instance.stepDown,
};
