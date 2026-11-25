// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_journey_steps.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerJourneyStepsCWProxy {
  OwnerJourneySteps click(bool click);

  OwnerJourneySteps open(bool open);

  OwnerJourneySteps signup(bool signup);

  OwnerJourneySteps chat(bool chat);

  OwnerJourneySteps paying(bool paying);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerJourneySteps(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerJourneySteps(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerJourneySteps call({
    bool click,
    bool open,
    bool signup,
    bool chat,
    bool paying,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerJourneySteps.copyWith(...)` or call `instanceOfOwnerJourneySteps.copyWith.fieldName(value)` for a single field.
class _$OwnerJourneyStepsCWProxyImpl implements _$OwnerJourneyStepsCWProxy {
  const _$OwnerJourneyStepsCWProxyImpl(this._value);

  final OwnerJourneySteps _value;

  @override
  OwnerJourneySteps click(bool click) => call(click: click);

  @override
  OwnerJourneySteps open(bool open) => call(open: open);

  @override
  OwnerJourneySteps signup(bool signup) => call(signup: signup);

  @override
  OwnerJourneySteps chat(bool chat) => call(chat: chat);

  @override
  OwnerJourneySteps paying(bool paying) => call(paying: paying);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerJourneySteps(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerJourneySteps(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerJourneySteps call({
    Object? click = const $CopyWithPlaceholder(),
    Object? open = const $CopyWithPlaceholder(),
    Object? signup = const $CopyWithPlaceholder(),
    Object? chat = const $CopyWithPlaceholder(),
    Object? paying = const $CopyWithPlaceholder(),
  }) {
    return OwnerJourneySteps(
      click: click == const $CopyWithPlaceholder() || click == null
          ? _value.click
          // ignore: cast_nullable_to_non_nullable
          : click as bool,
      open: open == const $CopyWithPlaceholder() || open == null
          ? _value.open
          // ignore: cast_nullable_to_non_nullable
          : open as bool,
      signup: signup == const $CopyWithPlaceholder() || signup == null
          ? _value.signup
          // ignore: cast_nullable_to_non_nullable
          : signup as bool,
      chat: chat == const $CopyWithPlaceholder() || chat == null
          ? _value.chat
          // ignore: cast_nullable_to_non_nullable
          : chat as bool,
      paying: paying == const $CopyWithPlaceholder() || paying == null
          ? _value.paying
          // ignore: cast_nullable_to_non_nullable
          : paying as bool,
    );
  }
}

extension $OwnerJourneyStepsCopyWith on OwnerJourneySteps {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerJourneySteps.copyWith(...)` or `instanceOfOwnerJourneySteps.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerJourneyStepsCWProxy get copyWith =>
      _$OwnerJourneyStepsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerJourneySteps _$OwnerJourneyStepsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OwnerJourneySteps', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['click', 'open', 'signup', 'chat', 'paying'],
      );
      final val = OwnerJourneySteps(
        click: $checkedConvert('click', (v) => v as bool),
        open: $checkedConvert('open', (v) => v as bool),
        signup: $checkedConvert('signup', (v) => v as bool),
        chat: $checkedConvert('chat', (v) => v as bool),
        paying: $checkedConvert('paying', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$OwnerJourneyStepsToJson(OwnerJourneySteps instance) =>
    <String, dynamic>{
      'click': instance.click,
      'open': instance.open,
      'signup': instance.signup,
      'chat': instance.chat,
      'paying': instance.paying,
    };
