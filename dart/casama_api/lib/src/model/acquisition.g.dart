// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acquisition.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AcquisitionCWProxy {
  Acquisition source_(String source_);

  Acquisition medium(String? medium);

  Acquisition campaign(String? campaign);

  Acquisition adSet(String? adSet);

  Acquisition ad(String? ad);

  Acquisition network(String? network);

  Acquisition kind(String kind);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `Acquisition(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Acquisition(...).copyWith(id: 12, name: "My name")
  /// ```
  Acquisition call({
    String source_,
    String? medium,
    String? campaign,
    String? adSet,
    String? ad,
    String? network,
    String kind,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAcquisition.copyWith(...)` or call `instanceOfAcquisition.copyWith.fieldName(value)` for a single field.
class _$AcquisitionCWProxyImpl implements _$AcquisitionCWProxy {
  const _$AcquisitionCWProxyImpl(this._value);

  final Acquisition _value;

  @override
  Acquisition source_(String source_) => call(source_: source_);

  @override
  Acquisition medium(String? medium) => call(medium: medium);

  @override
  Acquisition campaign(String? campaign) => call(campaign: campaign);

  @override
  Acquisition adSet(String? adSet) => call(adSet: adSet);

  @override
  Acquisition ad(String? ad) => call(ad: ad);

  @override
  Acquisition network(String? network) => call(network: network);

  @override
  Acquisition kind(String kind) => call(kind: kind);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `Acquisition(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Acquisition(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  Acquisition call({
    Object? source_ = const $CopyWithPlaceholder(),
    Object? medium = const $CopyWithPlaceholder(),
    Object? campaign = const $CopyWithPlaceholder(),
    Object? adSet = const $CopyWithPlaceholder(),
    Object? ad = const $CopyWithPlaceholder(),
    Object? network = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return Acquisition(
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String,
      medium: medium == const $CopyWithPlaceholder()
          ? _value.medium
          // ignore: cast_nullable_to_non_nullable
          : medium as String?,
      campaign: campaign == const $CopyWithPlaceholder()
          ? _value.campaign
          // ignore: cast_nullable_to_non_nullable
          : campaign as String?,
      adSet: adSet == const $CopyWithPlaceholder()
          ? _value.adSet
          // ignore: cast_nullable_to_non_nullable
          : adSet as String?,
      ad: ad == const $CopyWithPlaceholder()
          ? _value.ad
          // ignore: cast_nullable_to_non_nullable
          : ad as String?,
      network: network == const $CopyWithPlaceholder()
          ? _value.network
          // ignore: cast_nullable_to_non_nullable
          : network as String?,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as String,
    );
  }
}

extension $AcquisitionCopyWith on Acquisition {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAcquisition.copyWith(...)` or `instanceOfAcquisition.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AcquisitionCWProxy get copyWith => _$AcquisitionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Acquisition _$AcquisitionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Acquisition', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'source',
          'medium',
          'campaign',
          'ad_set',
          'ad',
          'network',
          'kind',
        ],
      );
      final val = Acquisition(
        source_: $checkedConvert('source', (v) => v as String),
        medium: $checkedConvert('medium', (v) => v as String?),
        campaign: $checkedConvert('campaign', (v) => v as String?),
        adSet: $checkedConvert('ad_set', (v) => v as String?),
        ad: $checkedConvert('ad', (v) => v as String?),
        network: $checkedConvert('network', (v) => v as String?),
        kind: $checkedConvert('kind', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'source_': 'source', 'adSet': 'ad_set'});

Map<String, dynamic> _$AcquisitionToJson(Acquisition instance) =>
    <String, dynamic>{
      'source': instance.source_,
      'medium': instance.medium,
      'campaign': instance.campaign,
      'ad_set': instance.adSet,
      'ad': instance.ad,
      'network': instance.network,
      'kind': instance.kind,
    };
