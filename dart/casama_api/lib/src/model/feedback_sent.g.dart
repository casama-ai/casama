// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_sent.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FeedbackSentCWProxy {
  FeedbackSent id(String id);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackSent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackSent(...).copyWith(id: 12, name: "My name")
  /// ```
  FeedbackSent call({String id});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFeedbackSent.copyWith(...)` or call `instanceOfFeedbackSent.copyWith.fieldName(value)` for a single field.
class _$FeedbackSentCWProxyImpl implements _$FeedbackSentCWProxy {
  const _$FeedbackSentCWProxyImpl(this._value);

  final FeedbackSent _value;

  @override
  FeedbackSent id(String id) => call(id: id);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackSent(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackSent(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FeedbackSent call({Object? id = const $CopyWithPlaceholder()}) {
    return FeedbackSent(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
    );
  }
}

extension $FeedbackSentCopyWith on FeedbackSent {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFeedbackSent.copyWith(...)` or `instanceOfFeedbackSent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FeedbackSentCWProxy get copyWith => _$FeedbackSentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackSent _$FeedbackSentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FeedbackSent', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id']);
      final val = FeedbackSent(id: $checkedConvert('id', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$FeedbackSentToJson(FeedbackSent instance) =>
    <String, dynamic>{'id': instance.id};
