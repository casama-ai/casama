// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status_jobs.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusJobsCWProxy {
  CloudLinkStatusJobs chat(String? chat);

  CloudLinkStatusJobs background(String? background);

  CloudLinkStatusJobs embedding(String? embedding);

  CloudLinkStatusJobs image(String? image);

  CloudLinkStatusJobs tts(String? tts);

  CloudLinkStatusJobs stt(String? stt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusJobs(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusJobs(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatusJobs call({
    String? chat,
    String? background,
    String? embedding,
    String? image,
    String? tts,
    String? stt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatusJobs.copyWith(...)` or call `instanceOfCloudLinkStatusJobs.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusJobsCWProxyImpl implements _$CloudLinkStatusJobsCWProxy {
  const _$CloudLinkStatusJobsCWProxyImpl(this._value);

  final CloudLinkStatusJobs _value;

  @override
  CloudLinkStatusJobs chat(String? chat) => call(chat: chat);

  @override
  CloudLinkStatusJobs background(String? background) =>
      call(background: background);

  @override
  CloudLinkStatusJobs embedding(String? embedding) =>
      call(embedding: embedding);

  @override
  CloudLinkStatusJobs image(String? image) => call(image: image);

  @override
  CloudLinkStatusJobs tts(String? tts) => call(tts: tts);

  @override
  CloudLinkStatusJobs stt(String? stt) => call(stt: stt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatusJobs(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatusJobs(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatusJobs call({
    Object? chat = const $CopyWithPlaceholder(),
    Object? background = const $CopyWithPlaceholder(),
    Object? embedding = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? tts = const $CopyWithPlaceholder(),
    Object? stt = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatusJobs(
      chat: chat == const $CopyWithPlaceholder()
          ? _value.chat
          // ignore: cast_nullable_to_non_nullable
          : chat as String?,
      background: background == const $CopyWithPlaceholder()
          ? _value.background
          // ignore: cast_nullable_to_non_nullable
          : background as String?,
      embedding: embedding == const $CopyWithPlaceholder()
          ? _value.embedding
          // ignore: cast_nullable_to_non_nullable
          : embedding as String?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      tts: tts == const $CopyWithPlaceholder()
          ? _value.tts
          // ignore: cast_nullable_to_non_nullable
          : tts as String?,
      stt: stt == const $CopyWithPlaceholder()
          ? _value.stt
          // ignore: cast_nullable_to_non_nullable
          : stt as String?,
    );
  }
}

extension $CloudLinkStatusJobsCopyWith on CloudLinkStatusJobs {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatusJobs.copyWith(...)` or `instanceOfCloudLinkStatusJobs.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusJobsCWProxy get copyWith =>
      _$CloudLinkStatusJobsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatusJobs _$CloudLinkStatusJobsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudLinkStatusJobs', json, ($checkedConvert) {
      final val = CloudLinkStatusJobs(
        chat: $checkedConvert('chat', (v) => v as String?),
        background: $checkedConvert('background', (v) => v as String?),
        embedding: $checkedConvert('embedding', (v) => v as String?),
        image: $checkedConvert('image', (v) => v as String?),
        tts: $checkedConvert('tts', (v) => v as String?),
        stt: $checkedConvert('stt', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CloudLinkStatusJobsToJson(
  CloudLinkStatusJobs instance,
) => <String, dynamic>{
  'chat': ?instance.chat,
  'background': ?instance.background,
  'embedding': ?instance.embedding,
  'image': ?instance.image,
  'tts': ?instance.tts,
  'stt': ?instance.stt,
};
