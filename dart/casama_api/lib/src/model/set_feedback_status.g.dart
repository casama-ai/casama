// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_feedback_status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetFeedbackStatusCWProxy {
  SetFeedbackStatus status(FeedbackStatus status);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetFeedbackStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetFeedbackStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  SetFeedbackStatus call({FeedbackStatus status});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetFeedbackStatus.copyWith(...)` or call `instanceOfSetFeedbackStatus.copyWith.fieldName(value)` for a single field.
class _$SetFeedbackStatusCWProxyImpl implements _$SetFeedbackStatusCWProxy {
  const _$SetFeedbackStatusCWProxyImpl(this._value);

  final SetFeedbackStatus _value;

  @override
  SetFeedbackStatus status(FeedbackStatus status) => call(status: status);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetFeedbackStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetFeedbackStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetFeedbackStatus call({Object? status = const $CopyWithPlaceholder()}) {
    return SetFeedbackStatus(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as FeedbackStatus,
    );
  }
}

extension $SetFeedbackStatusCopyWith on SetFeedbackStatus {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetFeedbackStatus.copyWith(...)` or `instanceOfSetFeedbackStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetFeedbackStatusCWProxy get copyWith =>
      _$SetFeedbackStatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetFeedbackStatus _$SetFeedbackStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SetFeedbackStatus', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['status']);
      final val = SetFeedbackStatus(
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$FeedbackStatusEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SetFeedbackStatusToJson(SetFeedbackStatus instance) =>
    <String, dynamic>{'status': _$FeedbackStatusEnumMap[instance.status]!};

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.new_: 'new',
  FeedbackStatus.read: 'read',
  FeedbackStatus.done: 'done',
};
