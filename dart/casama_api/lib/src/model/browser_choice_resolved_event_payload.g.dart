// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_choice_resolved_event_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserChoiceResolvedEventPayloadCWProxy {
  BrowserChoiceResolvedEventPayload choiceId(String choiceId);

  BrowserChoiceResolvedEventPayload outcome(
    BrowserChoiceResolvedEventPayloadOutcomeEnum outcome,
  );

  BrowserChoiceResolvedEventPayload choice(
    BrowserChoiceResolvedEventPayloadChoiceEnum? choice,
  );

  BrowserChoiceResolvedEventPayload remember(bool? remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceResolvedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceResolvedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserChoiceResolvedEventPayload call({
    String choiceId,
    BrowserChoiceResolvedEventPayloadOutcomeEnum outcome,
    BrowserChoiceResolvedEventPayloadChoiceEnum? choice,
    bool? remember,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserChoiceResolvedEventPayload.copyWith(...)` or call `instanceOfBrowserChoiceResolvedEventPayload.copyWith.fieldName(value)` for a single field.
class _$BrowserChoiceResolvedEventPayloadCWProxyImpl
    implements _$BrowserChoiceResolvedEventPayloadCWProxy {
  const _$BrowserChoiceResolvedEventPayloadCWProxyImpl(this._value);

  final BrowserChoiceResolvedEventPayload _value;

  @override
  BrowserChoiceResolvedEventPayload choiceId(String choiceId) =>
      call(choiceId: choiceId);

  @override
  BrowserChoiceResolvedEventPayload outcome(
    BrowserChoiceResolvedEventPayloadOutcomeEnum outcome,
  ) => call(outcome: outcome);

  @override
  BrowserChoiceResolvedEventPayload choice(
    BrowserChoiceResolvedEventPayloadChoiceEnum? choice,
  ) => call(choice: choice);

  @override
  BrowserChoiceResolvedEventPayload remember(bool? remember) =>
      call(remember: remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceResolvedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceResolvedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserChoiceResolvedEventPayload call({
    Object? choiceId = const $CopyWithPlaceholder(),
    Object? outcome = const $CopyWithPlaceholder(),
    Object? choice = const $CopyWithPlaceholder(),
    Object? remember = const $CopyWithPlaceholder(),
  }) {
    return BrowserChoiceResolvedEventPayload(
      choiceId: choiceId == const $CopyWithPlaceholder() || choiceId == null
          ? _value.choiceId
          // ignore: cast_nullable_to_non_nullable
          : choiceId as String,
      outcome: outcome == const $CopyWithPlaceholder() || outcome == null
          ? _value.outcome
          // ignore: cast_nullable_to_non_nullable
          : outcome as BrowserChoiceResolvedEventPayloadOutcomeEnum,
      choice: choice == const $CopyWithPlaceholder()
          ? _value.choice
          // ignore: cast_nullable_to_non_nullable
          : choice as BrowserChoiceResolvedEventPayloadChoiceEnum?,
      remember: remember == const $CopyWithPlaceholder()
          ? _value.remember
          // ignore: cast_nullable_to_non_nullable
          : remember as bool?,
    );
  }
}

extension $BrowserChoiceResolvedEventPayloadCopyWith
    on BrowserChoiceResolvedEventPayload {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserChoiceResolvedEventPayload.copyWith(...)` or `instanceOfBrowserChoiceResolvedEventPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserChoiceResolvedEventPayloadCWProxy get copyWith =>
      _$BrowserChoiceResolvedEventPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserChoiceResolvedEventPayload _$BrowserChoiceResolvedEventPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BrowserChoiceResolvedEventPayload', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['choice_id', 'outcome', 'choice']);
  final val = BrowserChoiceResolvedEventPayload(
    choiceId: $checkedConvert('choice_id', (v) => v as String),
    outcome: $checkedConvert(
      'outcome',
      (v) =>
          $enumDecode(_$BrowserChoiceResolvedEventPayloadOutcomeEnumEnumMap, v),
    ),
    choice: $checkedConvert(
      'choice',
      (v) => $enumDecodeNullable(
        _$BrowserChoiceResolvedEventPayloadChoiceEnumEnumMap,
        v,
      ),
    ),
    remember: $checkedConvert('remember', (v) => v as bool?),
  );
  return val;
}, fieldKeyMap: const {'choiceId': 'choice_id'});

Map<String, dynamic> _$BrowserChoiceResolvedEventPayloadToJson(
  BrowserChoiceResolvedEventPayload instance,
) => <String, dynamic>{
  'choice_id': instance.choiceId,
  'outcome':
      _$BrowserChoiceResolvedEventPayloadOutcomeEnumEnumMap[instance.outcome]!,
  'choice':
      _$BrowserChoiceResolvedEventPayloadChoiceEnumEnumMap[instance.choice],
  'remember': ?instance.remember,
};

const _$BrowserChoiceResolvedEventPayloadOutcomeEnumEnumMap = {
  BrowserChoiceResolvedEventPayloadOutcomeEnum.answered: 'answered',
  BrowserChoiceResolvedEventPayloadOutcomeEnum.expired: 'expired',
  BrowserChoiceResolvedEventPayloadOutcomeEnum.cancelled: 'cancelled',
};

const _$BrowserChoiceResolvedEventPayloadChoiceEnumEnumMap = {
  BrowserChoiceResolvedEventPayloadChoiceEnum.app: 'app',
  BrowserChoiceResolvedEventPayloadChoiceEnum.mine: 'mine',
  BrowserChoiceResolvedEventPayloadChoiceEnum.computer: 'computer',
};
