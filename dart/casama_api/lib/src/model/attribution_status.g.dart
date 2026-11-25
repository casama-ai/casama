// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribution_status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AttributionStatusCWProxy {
  AttributionStatus offered(bool offered);

  AttributionStatus measureAds(bool measureAds);

  AttributionStatus metaSdkAllowed(bool metaSdkAllowed);

  AttributionStatus heardFromAsked(bool heardFromAsked);

  AttributionStatus acquisition(Acquisition? acquisition);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AttributionStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AttributionStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  AttributionStatus call({
    bool offered,
    bool measureAds,
    bool metaSdkAllowed,
    bool heardFromAsked,
    Acquisition? acquisition,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAttributionStatus.copyWith(...)` or call `instanceOfAttributionStatus.copyWith.fieldName(value)` for a single field.
class _$AttributionStatusCWProxyImpl implements _$AttributionStatusCWProxy {
  const _$AttributionStatusCWProxyImpl(this._value);

  final AttributionStatus _value;

  @override
  AttributionStatus offered(bool offered) => call(offered: offered);

  @override
  AttributionStatus measureAds(bool measureAds) => call(measureAds: measureAds);

  @override
  AttributionStatus metaSdkAllowed(bool metaSdkAllowed) =>
      call(metaSdkAllowed: metaSdkAllowed);

  @override
  AttributionStatus heardFromAsked(bool heardFromAsked) =>
      call(heardFromAsked: heardFromAsked);

  @override
  AttributionStatus acquisition(Acquisition? acquisition) =>
      call(acquisition: acquisition);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AttributionStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AttributionStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AttributionStatus call({
    Object? offered = const $CopyWithPlaceholder(),
    Object? measureAds = const $CopyWithPlaceholder(),
    Object? metaSdkAllowed = const $CopyWithPlaceholder(),
    Object? heardFromAsked = const $CopyWithPlaceholder(),
    Object? acquisition = const $CopyWithPlaceholder(),
  }) {
    return AttributionStatus(
      offered: offered == const $CopyWithPlaceholder() || offered == null
          ? _value.offered
          // ignore: cast_nullable_to_non_nullable
          : offered as bool,
      measureAds:
          measureAds == const $CopyWithPlaceholder() || measureAds == null
          ? _value.measureAds
          // ignore: cast_nullable_to_non_nullable
          : measureAds as bool,
      metaSdkAllowed:
          metaSdkAllowed == const $CopyWithPlaceholder() ||
              metaSdkAllowed == null
          ? _value.metaSdkAllowed
          // ignore: cast_nullable_to_non_nullable
          : metaSdkAllowed as bool,
      heardFromAsked:
          heardFromAsked == const $CopyWithPlaceholder() ||
              heardFromAsked == null
          ? _value.heardFromAsked
          // ignore: cast_nullable_to_non_nullable
          : heardFromAsked as bool,
      acquisition: acquisition == const $CopyWithPlaceholder()
          ? _value.acquisition
          // ignore: cast_nullable_to_non_nullable
          : acquisition as Acquisition?,
    );
  }
}

extension $AttributionStatusCopyWith on AttributionStatus {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAttributionStatus.copyWith(...)` or `instanceOfAttributionStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AttributionStatusCWProxy get copyWith =>
      _$AttributionStatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributionStatus _$AttributionStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttributionStatus',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'offered',
            'measure_ads',
            'meta_sdk_allowed',
            'heard_from_asked',
            'acquisition',
          ],
        );
        final val = AttributionStatus(
          offered: $checkedConvert('offered', (v) => v as bool),
          measureAds: $checkedConvert('measure_ads', (v) => v as bool),
          metaSdkAllowed: $checkedConvert('meta_sdk_allowed', (v) => v as bool),
          heardFromAsked: $checkedConvert('heard_from_asked', (v) => v as bool),
          acquisition: $checkedConvert(
            'acquisition',
            (v) => v == null
                ? null
                : Acquisition.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'measureAds': 'measure_ads',
        'metaSdkAllowed': 'meta_sdk_allowed',
        'heardFromAsked': 'heard_from_asked',
      },
    );

Map<String, dynamic> _$AttributionStatusToJson(AttributionStatus instance) =>
    <String, dynamic>{
      'offered': instance.offered,
      'measure_ads': instance.measureAds,
      'meta_sdk_allowed': instance.metaSdkAllowed,
      'heard_from_asked': instance.heardFromAsked,
      'acquisition': instance.acquisition?.toJson(),
    };
