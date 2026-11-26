// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_off.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsOffCWProxy {
  CloudModelsOff bots(List<CloudModelsOffBotsInner> bots);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsOff(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsOff(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsOff call({List<CloudModelsOffBotsInner> bots});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsOff.copyWith(...)` or call `instanceOfCloudModelsOff.copyWith.fieldName(value)` for a single field.
class _$CloudModelsOffCWProxyImpl implements _$CloudModelsOffCWProxy {
  const _$CloudModelsOffCWProxyImpl(this._value);

  final CloudModelsOff _value;

  @override
  CloudModelsOff bots(List<CloudModelsOffBotsInner> bots) => call(bots: bots);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsOff(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsOff(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsOff call({Object? bots = const $CopyWithPlaceholder()}) {
    return CloudModelsOff(
      bots: bots == const $CopyWithPlaceholder() || bots == null
          ? _value.bots
          // ignore: cast_nullable_to_non_nullable
          : bots as List<CloudModelsOffBotsInner>,
    );
  }
}

extension $CloudModelsOffCopyWith on CloudModelsOff {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsOff.copyWith(...)` or `instanceOfCloudModelsOff.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsOffCWProxy get copyWith => _$CloudModelsOffCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsOff _$CloudModelsOffFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudModelsOff', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['bots']);
      final val = CloudModelsOff(
        bots: $checkedConvert(
          'bots',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    CloudModelsOffBotsInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CloudModelsOffToJson(CloudModelsOff instance) =>
    <String, dynamic>{'bots': instance.bots.map((e) => e.toJson()).toList()};
