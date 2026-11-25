// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FeedbackListCWProxy {
  FeedbackList items(List<FeedbackRow> items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackList(...).copyWith(id: 12, name: "My name")
  /// ```
  FeedbackList call({List<FeedbackRow> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFeedbackList.copyWith(...)` or call `instanceOfFeedbackList.copyWith.fieldName(value)` for a single field.
class _$FeedbackListCWProxyImpl implements _$FeedbackListCWProxy {
  const _$FeedbackListCWProxyImpl(this._value);

  final FeedbackList _value;

  @override
  FeedbackList items(List<FeedbackRow> items) => call(items: items);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FeedbackList call({Object? items = const $CopyWithPlaceholder()}) {
    return FeedbackList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<FeedbackRow>,
    );
  }
}

extension $FeedbackListCopyWith on FeedbackList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFeedbackList.copyWith(...)` or `instanceOfFeedbackList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FeedbackListCWProxy get copyWith => _$FeedbackListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackList _$FeedbackListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FeedbackList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = FeedbackList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => FeedbackRow.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FeedbackListToJson(FeedbackList instance) =>
    <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
