// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_growth_first_steps.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminGrowthFirstStepsCWProxy {
  AdminGrowthFirstSteps signedUp(int signedUp);

  AdminGrowthFirstSteps madeBot(int madeBot);

  AdminGrowthFirstSteps sentMessage(int sentMessage);

  AdminGrowthFirstSteps firstValue(int firstValue);

  AdminGrowthFirstSteps cameBack(int cameBack);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthFirstSteps(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthFirstSteps(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminGrowthFirstSteps call({
    int signedUp,
    int madeBot,
    int sentMessage,
    int firstValue,
    int cameBack,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminGrowthFirstSteps.copyWith(...)` or call `instanceOfAdminGrowthFirstSteps.copyWith.fieldName(value)` for a single field.
class _$AdminGrowthFirstStepsCWProxyImpl
    implements _$AdminGrowthFirstStepsCWProxy {
  const _$AdminGrowthFirstStepsCWProxyImpl(this._value);

  final AdminGrowthFirstSteps _value;

  @override
  AdminGrowthFirstSteps signedUp(int signedUp) => call(signedUp: signedUp);

  @override
  AdminGrowthFirstSteps madeBot(int madeBot) => call(madeBot: madeBot);

  @override
  AdminGrowthFirstSteps sentMessage(int sentMessage) =>
      call(sentMessage: sentMessage);

  @override
  AdminGrowthFirstSteps firstValue(int firstValue) =>
      call(firstValue: firstValue);

  @override
  AdminGrowthFirstSteps cameBack(int cameBack) => call(cameBack: cameBack);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminGrowthFirstSteps(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminGrowthFirstSteps(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminGrowthFirstSteps call({
    Object? signedUp = const $CopyWithPlaceholder(),
    Object? madeBot = const $CopyWithPlaceholder(),
    Object? sentMessage = const $CopyWithPlaceholder(),
    Object? firstValue = const $CopyWithPlaceholder(),
    Object? cameBack = const $CopyWithPlaceholder(),
  }) {
    return AdminGrowthFirstSteps(
      signedUp: signedUp == const $CopyWithPlaceholder() || signedUp == null
          ? _value.signedUp
          // ignore: cast_nullable_to_non_nullable
          : signedUp as int,
      madeBot: madeBot == const $CopyWithPlaceholder() || madeBot == null
          ? _value.madeBot
          // ignore: cast_nullable_to_non_nullable
          : madeBot as int,
      sentMessage:
          sentMessage == const $CopyWithPlaceholder() || sentMessage == null
          ? _value.sentMessage
          // ignore: cast_nullable_to_non_nullable
          : sentMessage as int,
      firstValue:
          firstValue == const $CopyWithPlaceholder() || firstValue == null
          ? _value.firstValue
          // ignore: cast_nullable_to_non_nullable
          : firstValue as int,
      cameBack: cameBack == const $CopyWithPlaceholder() || cameBack == null
          ? _value.cameBack
          // ignore: cast_nullable_to_non_nullable
          : cameBack as int,
    );
  }
}

extension $AdminGrowthFirstStepsCopyWith on AdminGrowthFirstSteps {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminGrowthFirstSteps.copyWith(...)` or `instanceOfAdminGrowthFirstSteps.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminGrowthFirstStepsCWProxy get copyWith =>
      _$AdminGrowthFirstStepsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminGrowthFirstSteps _$AdminGrowthFirstStepsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminGrowthFirstSteps',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'signed_up',
        'made_bot',
        'sent_message',
        'first_value',
        'came_back',
      ],
    );
    final val = AdminGrowthFirstSteps(
      signedUp: $checkedConvert('signed_up', (v) => (v as num).toInt()),
      madeBot: $checkedConvert('made_bot', (v) => (v as num).toInt()),
      sentMessage: $checkedConvert('sent_message', (v) => (v as num).toInt()),
      firstValue: $checkedConvert('first_value', (v) => (v as num).toInt()),
      cameBack: $checkedConvert('came_back', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'signedUp': 'signed_up',
    'madeBot': 'made_bot',
    'sentMessage': 'sent_message',
    'firstValue': 'first_value',
    'cameBack': 'came_back',
  },
);

Map<String, dynamic> _$AdminGrowthFirstStepsToJson(
  AdminGrowthFirstSteps instance,
) => <String, dynamic>{
  'signed_up': instance.signedUp,
  'made_bot': instance.madeBot,
  'sent_message': instance.sentMessage,
  'first_value': instance.firstValue,
  'came_back': instance.cameBack,
};
