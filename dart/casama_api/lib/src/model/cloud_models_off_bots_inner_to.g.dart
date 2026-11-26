// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_off_bots_inner_to.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsOffBotsInnerToCWProxy {
  CloudModelsOffBotsInnerTo label(String label);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsOffBotsInnerTo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsOffBotsInnerTo(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsOffBotsInnerTo call({String label});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsOffBotsInnerTo.copyWith(...)` or call `instanceOfCloudModelsOffBotsInnerTo.copyWith.fieldName(value)` for a single field.
class _$CloudModelsOffBotsInnerToCWProxyImpl
    implements _$CloudModelsOffBotsInnerToCWProxy {
  const _$CloudModelsOffBotsInnerToCWProxyImpl(this._value);

  final CloudModelsOffBotsInnerTo _value;

  @override
  CloudModelsOffBotsInnerTo label(String label) => call(label: label);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsOffBotsInnerTo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsOffBotsInnerTo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsOffBotsInnerTo call({
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsOffBotsInnerTo(
      label: label == const $CopyWithPlaceholder() || label == null
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
    );
  }
}

extension $CloudModelsOffBotsInnerToCopyWith on CloudModelsOffBotsInnerTo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsOffBotsInnerTo.copyWith(...)` or `instanceOfCloudModelsOffBotsInnerTo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsOffBotsInnerToCWProxy get copyWith =>
      _$CloudModelsOffBotsInnerToCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsOffBotsInnerTo _$CloudModelsOffBotsInnerToFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CloudModelsOffBotsInnerTo', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['label']);
  final val = CloudModelsOffBotsInnerTo(
    label: $checkedConvert('label', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CloudModelsOffBotsInnerToToJson(
  CloudModelsOffBotsInnerTo instance,
) => <String, dynamic>{'label': instance.label};
