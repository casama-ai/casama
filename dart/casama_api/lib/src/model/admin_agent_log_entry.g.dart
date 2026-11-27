// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_agent_log_entry.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminAgentLogEntryCWProxy {
  AdminAgentLogEntry at(DateTime at);

  AdminAgentLogEntry action(String action);

  AdminAgentLogEntry keyName(String? keyName);

  AdminAgentLogEntry method(String? method);

  AdminAgentLogEntry path(String? path);

  AdminAgentLogEntry status(int? status);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAgentLogEntry(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAgentLogEntry(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminAgentLogEntry call({
    DateTime at,
    String action,
    String? keyName,
    String? method,
    String? path,
    int? status,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminAgentLogEntry.copyWith(...)` or call `instanceOfAdminAgentLogEntry.copyWith.fieldName(value)` for a single field.
class _$AdminAgentLogEntryCWProxyImpl implements _$AdminAgentLogEntryCWProxy {
  const _$AdminAgentLogEntryCWProxyImpl(this._value);

  final AdminAgentLogEntry _value;

  @override
  AdminAgentLogEntry at(DateTime at) => call(at: at);

  @override
  AdminAgentLogEntry action(String action) => call(action: action);

  @override
  AdminAgentLogEntry keyName(String? keyName) => call(keyName: keyName);

  @override
  AdminAgentLogEntry method(String? method) => call(method: method);

  @override
  AdminAgentLogEntry path(String? path) => call(path: path);

  @override
  AdminAgentLogEntry status(int? status) => call(status: status);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminAgentLogEntry(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminAgentLogEntry(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminAgentLogEntry call({
    Object? at = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
    Object? keyName = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return AdminAgentLogEntry(
      at: at == const $CopyWithPlaceholder() || at == null
          ? _value.at
          // ignore: cast_nullable_to_non_nullable
          : at as DateTime,
      action: action == const $CopyWithPlaceholder() || action == null
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as String,
      keyName: keyName == const $CopyWithPlaceholder()
          ? _value.keyName
          // ignore: cast_nullable_to_non_nullable
          : keyName as String?,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String?,
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
    );
  }
}

extension $AdminAgentLogEntryCopyWith on AdminAgentLogEntry {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminAgentLogEntry.copyWith(...)` or `instanceOfAdminAgentLogEntry.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminAgentLogEntryCWProxy get copyWith =>
      _$AdminAgentLogEntryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAgentLogEntry _$AdminAgentLogEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminAgentLogEntry', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'at',
          'action',
          'key_name',
          'method',
          'path',
          'status',
        ],
      );
      final val = AdminAgentLogEntry(
        at: $checkedConvert('at', (v) => DateTime.parse(v as String)),
        action: $checkedConvert('action', (v) => v as String),
        keyName: $checkedConvert('key_name', (v) => v as String?),
        method: $checkedConvert('method', (v) => v as String?),
        path: $checkedConvert('path', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'keyName': 'key_name'});

Map<String, dynamic> _$AdminAgentLogEntryToJson(AdminAgentLogEntry instance) =>
    <String, dynamic>{
      'at': instance.at.toIso8601String(),
      'action': instance.action,
      'key_name': instance.keyName,
      'method': instance.method,
      'path': instance.path,
      'status': instance.status,
    };
