// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_admin_agent_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AskAdminAgentRequestCWProxy {
  AskAdminAgentRequest reason(String reason);

  AskAdminAgentRequest minutes(int? minutes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AskAdminAgentRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AskAdminAgentRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AskAdminAgentRequest call({String reason, int? minutes});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAskAdminAgentRequest.copyWith(...)` or call `instanceOfAskAdminAgentRequest.copyWith.fieldName(value)` for a single field.
class _$AskAdminAgentRequestCWProxyImpl
    implements _$AskAdminAgentRequestCWProxy {
  const _$AskAdminAgentRequestCWProxyImpl(this._value);

  final AskAdminAgentRequest _value;

  @override
  AskAdminAgentRequest reason(String reason) => call(reason: reason);

  @override
  AskAdminAgentRequest minutes(int? minutes) => call(minutes: minutes);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AskAdminAgentRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AskAdminAgentRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AskAdminAgentRequest call({
    Object? reason = const $CopyWithPlaceholder(),
    Object? minutes = const $CopyWithPlaceholder(),
  }) {
    return AskAdminAgentRequest(
      reason: reason == const $CopyWithPlaceholder() || reason == null
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String,
      minutes: minutes == const $CopyWithPlaceholder()
          ? _value.minutes
          // ignore: cast_nullable_to_non_nullable
          : minutes as int?,
    );
  }
}

extension $AskAdminAgentRequestCopyWith on AskAdminAgentRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAskAdminAgentRequest.copyWith(...)` or `instanceOfAskAdminAgentRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AskAdminAgentRequestCWProxy get copyWith =>
      _$AskAdminAgentRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AskAdminAgentRequest _$AskAdminAgentRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AskAdminAgentRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['reason']);
  final val = AskAdminAgentRequest(
    reason: $checkedConvert('reason', (v) => v as String),
    minutes: $checkedConvert('minutes', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$AskAdminAgentRequestToJson(
  AskAdminAgentRequest instance,
) => <String, dynamic>{'reason': instance.reason, 'minutes': ?instance.minutes};
