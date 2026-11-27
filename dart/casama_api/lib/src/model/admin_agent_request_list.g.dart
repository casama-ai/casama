// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_agent_request_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminAgentRequestListCWProxy {
  AdminAgentRequestList items(List<AdminAgentRequest> items);

  AdminAgentRequestList log(List<AdminAgentLogEntry> log);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAgentRequestList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAgentRequestList(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminAgentRequestList call({
    List<AdminAgentRequest> items,
    List<AdminAgentLogEntry> log,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminAgentRequestList.copyWith(...)` or call `instanceOfAdminAgentRequestList.copyWith.fieldName(value)` for a single field.
class _$AdminAgentRequestListCWProxyImpl
    implements _$AdminAgentRequestListCWProxy {
  const _$AdminAgentRequestListCWProxyImpl(this._value);

  final AdminAgentRequestList _value;

  @override
  AdminAgentRequestList items(List<AdminAgentRequest> items) =>
      call(items: items);

  @override
  AdminAgentRequestList log(List<AdminAgentLogEntry> log) => call(log: log);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAgentRequestList(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAgentRequestList(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminAgentRequestList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? log = const $CopyWithPlaceholder(),
  }) {
    return AdminAgentRequestList(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AdminAgentRequest>,
      log: log == const $CopyWithPlaceholder() || log == null
          ? _value.log
          // ignore: cast_nullable_to_non_nullable
          : log as List<AdminAgentLogEntry>,
    );
  }
}

extension $AdminAgentRequestListCopyWith on AdminAgentRequestList {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminAgentRequestList.copyWith(...)` or `instanceOfAdminAgentRequestList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminAgentRequestListCWProxy get copyWith =>
      _$AdminAgentRequestListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAgentRequestList _$AdminAgentRequestListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminAgentRequestList', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['items', 'log']);
  final val = AdminAgentRequestList(
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => AdminAgentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    log: $checkedConvert(
      'log',
      (v) => (v as List<dynamic>)
          .map((e) => AdminAgentLogEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminAgentRequestListToJson(
  AdminAgentRequestList instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'log': instance.log.map((e) => e.toJson()).toList(),
};
