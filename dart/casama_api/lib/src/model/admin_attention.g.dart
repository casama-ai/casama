// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_attention.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminAttentionCWProxy {
  AdminAttention openTickets(int openTickets);

  AdminAttention newReports(int newReports);

  AdminAttention waitlistWaiting(int waitlistWaiting);

  AdminAttention abuse24h(int abuse24h);

  AdminAttention domainOrdersPending(int domainOrdersPending);

  AdminAttention failedRuns24h(int failedRuns24h);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAttention(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAttention(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminAttention call({
    int openTickets,
    int newReports,
    int waitlistWaiting,
    int abuse24h,
    int domainOrdersPending,
    int failedRuns24h,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminAttention.copyWith(...)` or call `instanceOfAdminAttention.copyWith.fieldName(value)` for a single field.
class _$AdminAttentionCWProxyImpl implements _$AdminAttentionCWProxy {
  const _$AdminAttentionCWProxyImpl(this._value);

  final AdminAttention _value;

  @override
  AdminAttention openTickets(int openTickets) => call(openTickets: openTickets);

  @override
  AdminAttention newReports(int newReports) => call(newReports: newReports);

  @override
  AdminAttention waitlistWaiting(int waitlistWaiting) =>
      call(waitlistWaiting: waitlistWaiting);

  @override
  AdminAttention abuse24h(int abuse24h) => call(abuse24h: abuse24h);

  @override
  AdminAttention domainOrdersPending(int domainOrdersPending) =>
      call(domainOrdersPending: domainOrdersPending);

  @override
  AdminAttention failedRuns24h(int failedRuns24h) =>
      call(failedRuns24h: failedRuns24h);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAttention(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAttention(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminAttention call({
    Object? openTickets = const $CopyWithPlaceholder(),
    Object? newReports = const $CopyWithPlaceholder(),
    Object? waitlistWaiting = const $CopyWithPlaceholder(),
    Object? abuse24h = const $CopyWithPlaceholder(),
    Object? domainOrdersPending = const $CopyWithPlaceholder(),
    Object? failedRuns24h = const $CopyWithPlaceholder(),
  }) {
    return AdminAttention(
      openTickets:
          openTickets == const $CopyWithPlaceholder() || openTickets == null
          ? _value.openTickets
          // ignore: cast_nullable_to_non_nullable
          : openTickets as int,
      newReports:
          newReports == const $CopyWithPlaceholder() || newReports == null
          ? _value.newReports
          // ignore: cast_nullable_to_non_nullable
          : newReports as int,
      waitlistWaiting:
          waitlistWaiting == const $CopyWithPlaceholder() ||
              waitlistWaiting == null
          ? _value.waitlistWaiting
          // ignore: cast_nullable_to_non_nullable
          : waitlistWaiting as int,
      abuse24h: abuse24h == const $CopyWithPlaceholder() || abuse24h == null
          ? _value.abuse24h
          // ignore: cast_nullable_to_non_nullable
          : abuse24h as int,
      domainOrdersPending:
          domainOrdersPending == const $CopyWithPlaceholder() ||
              domainOrdersPending == null
          ? _value.domainOrdersPending
          // ignore: cast_nullable_to_non_nullable
          : domainOrdersPending as int,
      failedRuns24h:
          failedRuns24h == const $CopyWithPlaceholder() || failedRuns24h == null
          ? _value.failedRuns24h
          // ignore: cast_nullable_to_non_nullable
          : failedRuns24h as int,
    );
  }
}

extension $AdminAttentionCopyWith on AdminAttention {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminAttention.copyWith(...)` or `instanceOfAdminAttention.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminAttentionCWProxy get copyWith => _$AdminAttentionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAttention _$AdminAttentionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminAttention',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'open_tickets',
            'new_reports',
            'waitlist_waiting',
            'abuse_24h',
            'domain_orders_pending',
            'failed_runs_24h',
          ],
        );
        final val = AdminAttention(
          openTickets: $checkedConvert(
            'open_tickets',
            (v) => (v as num).toInt(),
          ),
          newReports: $checkedConvert('new_reports', (v) => (v as num).toInt()),
          waitlistWaiting: $checkedConvert(
            'waitlist_waiting',
            (v) => (v as num).toInt(),
          ),
          abuse24h: $checkedConvert('abuse_24h', (v) => (v as num).toInt()),
          domainOrdersPending: $checkedConvert(
            'domain_orders_pending',
            (v) => (v as num).toInt(),
          ),
          failedRuns24h: $checkedConvert(
            'failed_runs_24h',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'openTickets': 'open_tickets',
        'newReports': 'new_reports',
        'waitlistWaiting': 'waitlist_waiting',
        'abuse24h': 'abuse_24h',
        'domainOrdersPending': 'domain_orders_pending',
        'failedRuns24h': 'failed_runs_24h',
      },
    );

Map<String, dynamic> _$AdminAttentionToJson(AdminAttention instance) =>
    <String, dynamic>{
      'open_tickets': instance.openTickets,
      'new_reports': instance.newReports,
      'waitlist_waiting': instance.waitlistWaiting,
      'abuse_24h': instance.abuse24h,
      'domain_orders_pending': instance.domainOrdersPending,
      'failed_runs_24h': instance.failedRuns24h,
    };
