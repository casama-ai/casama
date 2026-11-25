// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_feedback_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PublishFeedbackRequestCWProxy {
  PublishFeedbackRequest title(String title);

  PublishFeedbackRequest description(String? description);

  PublishFeedbackRequest tag(String? tag);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublishFeedbackRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublishFeedbackRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  PublishFeedbackRequest call({String title, String? description, String? tag});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPublishFeedbackRequest.copyWith(...)` or call `instanceOfPublishFeedbackRequest.copyWith.fieldName(value)` for a single field.
class _$PublishFeedbackRequestCWProxyImpl
    implements _$PublishFeedbackRequestCWProxy {
  const _$PublishFeedbackRequestCWProxyImpl(this._value);

  final PublishFeedbackRequest _value;

  @override
  PublishFeedbackRequest title(String title) => call(title: title);

  @override
  PublishFeedbackRequest description(String? description) =>
      call(description: description);

  @override
  PublishFeedbackRequest tag(String? tag) => call(tag: tag);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PublishFeedbackRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PublishFeedbackRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PublishFeedbackRequest call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? tag = const $CopyWithPlaceholder(),
  }) {
    return PublishFeedbackRequest(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      tag: tag == const $CopyWithPlaceholder()
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String?,
    );
  }
}

extension $PublishFeedbackRequestCopyWith on PublishFeedbackRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPublishFeedbackRequest.copyWith(...)` or `instanceOfPublishFeedbackRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PublishFeedbackRequestCWProxy get copyWith =>
      _$PublishFeedbackRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishFeedbackRequest _$PublishFeedbackRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PublishFeedbackRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['title']);
  final val = PublishFeedbackRequest(
    title: $checkedConvert('title', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String? ?? ''),
    tag: $checkedConvert('tag', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$PublishFeedbackRequestToJson(
  PublishFeedbackRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': ?instance.description,
  'tag': ?instance.tag,
};
