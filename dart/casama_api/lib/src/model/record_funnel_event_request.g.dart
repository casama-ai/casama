// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_funnel_event_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RecordFunnelEventRequestCWProxy {
  RecordFunnelEventRequest event(RecordFunnelEventRequestEventEnum event);

  RecordFunnelEventRequest orgId(String? orgId);

  RecordFunnelEventRequest source_(String? source_);

  RecordFunnelEventRequest detail(String? detail);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `RecordFunnelEventRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RecordFunnelEventRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  RecordFunnelEventRequest call({
    RecordFunnelEventRequestEventEnum event,
    String? orgId,
    String? source_,
    String? detail,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRecordFunnelEventRequest.copyWith(...)` or call `instanceOfRecordFunnelEventRequest.copyWith.fieldName(value)` for a single field.
class _$RecordFunnelEventRequestCWProxyImpl
    implements _$RecordFunnelEventRequestCWProxy {
  const _$RecordFunnelEventRequestCWProxyImpl(this._value);

  final RecordFunnelEventRequest _value;

  @override
  RecordFunnelEventRequest event(RecordFunnelEventRequestEventEnum event) =>
      call(event: event);

  @override
  RecordFunnelEventRequest orgId(String? orgId) => call(orgId: orgId);

  @override
  RecordFunnelEventRequest source_(String? source_) => call(source_: source_);

  @override
  RecordFunnelEventRequest detail(String? detail) => call(detail: detail);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `RecordFunnelEventRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RecordFunnelEventRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RecordFunnelEventRequest call({
    Object? event = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
  }) {
    return RecordFunnelEventRequest(
      event: event == const $CopyWithPlaceholder() || event == null
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as RecordFunnelEventRequestEventEnum,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String?,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String?,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as String?,
    );
  }
}

extension $RecordFunnelEventRequestCopyWith on RecordFunnelEventRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRecordFunnelEventRequest.copyWith(...)` or `instanceOfRecordFunnelEventRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RecordFunnelEventRequestCWProxy get copyWith =>
      _$RecordFunnelEventRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordFunnelEventRequest _$RecordFunnelEventRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RecordFunnelEventRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['event']);
  final val = RecordFunnelEventRequest(
    event: $checkedConvert(
      'event',
      (v) => $enumDecode(_$RecordFunnelEventRequestEventEnumEnumMap, v),
    ),
    orgId: $checkedConvert('org_id', (v) => v as String?),
    source_: $checkedConvert('source', (v) => v as String?),
    detail: $checkedConvert('detail', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'orgId': 'org_id', 'source_': 'source'});

Map<String, dynamic> _$RecordFunnelEventRequestToJson(
  RecordFunnelEventRequest instance,
) => <String, dynamic>{
  'event': _$RecordFunnelEventRequestEventEnumEnumMap[instance.event]!,
  'org_id': ?instance.orgId,
  'source': ?instance.source_,
  'detail': ?instance.detail,
};

const _$RecordFunnelEventRequestEventEnumEnumMap = {
  RecordFunnelEventRequestEventEnum.paywallView: 'paywall_view',
  RecordFunnelEventRequestEventEnum.paywallPlanSelect: 'paywall_plan_select',
  RecordFunnelEventRequestEventEnum.purchaseStarted: 'purchase_started',
};
