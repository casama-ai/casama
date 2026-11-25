// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerEventCWProxy {
  OwnerEvent id(int id);

  OwnerEvent kind(String kind);

  OwnerEvent label(String? label);

  OwnerEvent userId(String? userId);

  OwnerEvent detail(Map<String, Object?> detail);

  OwnerEvent journeyId(String? journeyId);

  OwnerEvent journey(OwnerJourney? journey);

  OwnerEvent title(String title);

  OwnerEvent body(String body);

  OwnerEvent createdAt(String createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerEvent call({
    int id,
    String kind,
    String? label,
    String? userId,
    Map<String, Object?> detail,
    String? journeyId,
    OwnerJourney? journey,
    String title,
    String body,
    String createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerEvent.copyWith(...)` or call `instanceOfOwnerEvent.copyWith.fieldName(value)` for a single field.
class _$OwnerEventCWProxyImpl implements _$OwnerEventCWProxy {
  const _$OwnerEventCWProxyImpl(this._value);

  final OwnerEvent _value;

  @override
  OwnerEvent id(int id) => call(id: id);

  @override
  OwnerEvent kind(String kind) => call(kind: kind);

  @override
  OwnerEvent label(String? label) => call(label: label);

  @override
  OwnerEvent userId(String? userId) => call(userId: userId);

  @override
  OwnerEvent detail(Map<String, Object?> detail) => call(detail: detail);

  @override
  OwnerEvent journeyId(String? journeyId) => call(journeyId: journeyId);

  @override
  OwnerEvent journey(OwnerJourney? journey) => call(journey: journey);

  @override
  OwnerEvent title(String title) => call(title: title);

  @override
  OwnerEvent body(String body) => call(body: body);

  @override
  OwnerEvent createdAt(String createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerEvent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerEvent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerEvent call({
    Object? id = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? journeyId = const $CopyWithPlaceholder(),
    Object? journey = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return OwnerEvent(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as String,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
      detail: detail == const $CopyWithPlaceholder() || detail == null
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as Map<String, Object?>,
      journeyId: journeyId == const $CopyWithPlaceholder()
          ? _value.journeyId
          // ignore: cast_nullable_to_non_nullable
          : journeyId as String?,
      journey: journey == const $CopyWithPlaceholder()
          ? _value.journey
          // ignore: cast_nullable_to_non_nullable
          : journey as OwnerJourney?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String,
    );
  }
}

extension $OwnerEventCopyWith on OwnerEvent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerEvent.copyWith(...)` or `instanceOfOwnerEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerEventCWProxy get copyWith => _$OwnerEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerEvent _$OwnerEventFromJson(Map<String, dynamic> json) => $checkedCreate(
  'OwnerEvent',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'kind',
        'label',
        'user_id',
        'detail',
        'journey_id',
        'journey',
        'title',
        'body',
        'created_at',
      ],
    );
    final val = OwnerEvent(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      kind: $checkedConvert('kind', (v) => v as String),
      label: $checkedConvert('label', (v) => v as String?),
      userId: $checkedConvert('user_id', (v) => v as String?),
      detail: $checkedConvert('detail', (v) => v as Map<String, dynamic>),
      journeyId: $checkedConvert('journey_id', (v) => v as String?),
      journey: $checkedConvert(
        'journey',
        (v) =>
            v == null ? null : OwnerJourney.fromJson(v as Map<String, dynamic>),
      ),
      title: $checkedConvert('title', (v) => v as String),
      body: $checkedConvert('body', (v) => v as String),
      createdAt: $checkedConvert('created_at', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'journeyId': 'journey_id',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$OwnerEventToJson(OwnerEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'label': instance.label,
      'user_id': instance.userId,
      'detail': instance.detail,
      'journey_id': instance.journeyId,
      'journey': instance.journey?.toJson(),
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt,
    };
