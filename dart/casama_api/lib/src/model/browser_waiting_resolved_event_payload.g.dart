// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_waiting_resolved_event_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserWaitingResolvedEventPayloadCWProxy {
  BrowserWaitingResolvedEventPayload outcome(
    BrowserWaitingResolvedEventPayloadOutcomeEnum outcome,
  );

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingResolvedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingResolvedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserWaitingResolvedEventPayload call({
    BrowserWaitingResolvedEventPayloadOutcomeEnum outcome,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserWaitingResolvedEventPayload.copyWith(...)` or call `instanceOfBrowserWaitingResolvedEventPayload.copyWith.fieldName(value)` for a single field.
class _$BrowserWaitingResolvedEventPayloadCWProxyImpl
    implements _$BrowserWaitingResolvedEventPayloadCWProxy {
  const _$BrowserWaitingResolvedEventPayloadCWProxyImpl(this._value);

  final BrowserWaitingResolvedEventPayload _value;

  @override
  BrowserWaitingResolvedEventPayload outcome(
    BrowserWaitingResolvedEventPayloadOutcomeEnum outcome,
  ) => call(outcome: outcome);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserWaitingResolvedEventPayload(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserWaitingResolvedEventPayload(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserWaitingResolvedEventPayload call({
    Object? outcome = const $CopyWithPlaceholder(),
  }) {
    return BrowserWaitingResolvedEventPayload(
      outcome: outcome == const $CopyWithPlaceholder() || outcome == null
          ? _value.outcome
          // ignore: cast_nullable_to_non_nullable
          : outcome as BrowserWaitingResolvedEventPayloadOutcomeEnum,
    );
  }
}

extension $BrowserWaitingResolvedEventPayloadCopyWith
    on BrowserWaitingResolvedEventPayload {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserWaitingResolvedEventPayload.copyWith(...)` or `instanceOfBrowserWaitingResolvedEventPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserWaitingResolvedEventPayloadCWProxy get copyWith =>
      _$BrowserWaitingResolvedEventPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserWaitingResolvedEventPayload _$BrowserWaitingResolvedEventPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BrowserWaitingResolvedEventPayload', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['outcome']);
  final val = BrowserWaitingResolvedEventPayload(
    outcome: $checkedConvert(
      'outcome',
      (v) => $enumDecode(
        _$BrowserWaitingResolvedEventPayloadOutcomeEnumEnumMap,
        v,
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$BrowserWaitingResolvedEventPayloadToJson(
  BrowserWaitingResolvedEventPayload instance,
) => <String, dynamic>{
  'outcome':
      _$BrowserWaitingResolvedEventPayloadOutcomeEnumEnumMap[instance.outcome]!,
};

const _$BrowserWaitingResolvedEventPayloadOutcomeEnumEnumMap = {
  BrowserWaitingResolvedEventPayloadOutcomeEnum.back: 'back',
  BrowserWaitingResolvedEventPayloadOutcomeEnum.expired: 'expired',
  BrowserWaitingResolvedEventPayloadOutcomeEnum.cancelled: 'cancelled',
};
