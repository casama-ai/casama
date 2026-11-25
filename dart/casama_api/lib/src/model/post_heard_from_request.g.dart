// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_heard_from_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostHeardFromRequestCWProxy {
  PostHeardFromRequest answer(HeardFrom? answer);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PostHeardFromRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PostHeardFromRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  PostHeardFromRequest call({HeardFrom? answer});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPostHeardFromRequest.copyWith(...)` or call `instanceOfPostHeardFromRequest.copyWith.fieldName(value)` for a single field.
class _$PostHeardFromRequestCWProxyImpl
    implements _$PostHeardFromRequestCWProxy {
  const _$PostHeardFromRequestCWProxyImpl(this._value);

  final PostHeardFromRequest _value;

  @override
  PostHeardFromRequest answer(HeardFrom? answer) => call(answer: answer);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PostHeardFromRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PostHeardFromRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PostHeardFromRequest call({Object? answer = const $CopyWithPlaceholder()}) {
    return PostHeardFromRequest(
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as HeardFrom?,
    );
  }
}

extension $PostHeardFromRequestCopyWith on PostHeardFromRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPostHeardFromRequest.copyWith(...)` or `instanceOfPostHeardFromRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostHeardFromRequestCWProxy get copyWith =>
      _$PostHeardFromRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostHeardFromRequest _$PostHeardFromRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PostHeardFromRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['answer']);
  final val = PostHeardFromRequest(
    answer: $checkedConvert(
      'answer',
      (v) => $enumDecodeNullable(_$HeardFromEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$PostHeardFromRequestToJson(
  PostHeardFromRequest instance,
) => <String, dynamic>{'answer': _$HeardFromEnumMap[instance.answer]};

const _$HeardFromEnumMap = {
  HeardFrom.instagram: 'instagram',
  HeardFrom.facebook: 'facebook',
  HeardFrom.tiktok: 'tiktok',
  HeardFrom.youtube: 'youtube',
  HeardFrom.friend: 'friend',
  HeardFrom.search: 'search',
  HeardFrom.aiAssistant: 'ai_assistant',
  HeardFrom.other: 'other',
};
