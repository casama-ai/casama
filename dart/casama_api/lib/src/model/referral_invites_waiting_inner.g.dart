// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_invites_waiting_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReferralInvitesWaitingInnerCWProxy {
  ReferralInvitesWaitingInner id(String id);

  ReferralInvitesWaitingInner emailHint(String emailHint);

  ReferralInvitesWaitingInner since(DateTime since);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ReferralInvitesWaitingInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ReferralInvitesWaitingInner(...).copyWith(id: 12, name: "My name")
  /// ```
  ReferralInvitesWaitingInner call({
    String id,
    String emailHint,
    DateTime since,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfReferralInvitesWaitingInner.copyWith(...)` or call `instanceOfReferralInvitesWaitingInner.copyWith.fieldName(value)` for a single field.
class _$ReferralInvitesWaitingInnerCWProxyImpl
    implements _$ReferralInvitesWaitingInnerCWProxy {
  const _$ReferralInvitesWaitingInnerCWProxyImpl(this._value);

  final ReferralInvitesWaitingInner _value;

  @override
  ReferralInvitesWaitingInner id(String id) => call(id: id);

  @override
  ReferralInvitesWaitingInner emailHint(String emailHint) =>
      call(emailHint: emailHint);

  @override
  ReferralInvitesWaitingInner since(DateTime since) => call(since: since);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ReferralInvitesWaitingInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ReferralInvitesWaitingInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ReferralInvitesWaitingInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? emailHint = const $CopyWithPlaceholder(),
    Object? since = const $CopyWithPlaceholder(),
  }) {
    return ReferralInvitesWaitingInner(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      emailHint: emailHint == const $CopyWithPlaceholder() || emailHint == null
          ? _value.emailHint
          // ignore: cast_nullable_to_non_nullable
          : emailHint as String,
      since: since == const $CopyWithPlaceholder() || since == null
          ? _value.since
          // ignore: cast_nullable_to_non_nullable
          : since as DateTime,
    );
  }
}

extension $ReferralInvitesWaitingInnerCopyWith on ReferralInvitesWaitingInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfReferralInvitesWaitingInner.copyWith(...)` or `instanceOfReferralInvitesWaitingInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReferralInvitesWaitingInnerCWProxy get copyWith =>
      _$ReferralInvitesWaitingInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralInvitesWaitingInner _$ReferralInvitesWaitingInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReferralInvitesWaitingInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'email_hint', 'since']);
  final val = ReferralInvitesWaitingInner(
    id: $checkedConvert('id', (v) => v as String),
    emailHint: $checkedConvert('email_hint', (v) => v as String),
    since: $checkedConvert('since', (v) => DateTime.parse(v as String)),
  );
  return val;
}, fieldKeyMap: const {'emailHint': 'email_hint'});

Map<String, dynamic> _$ReferralInvitesWaitingInnerToJson(
  ReferralInvitesWaitingInner instance,
) => <String, dynamic>{
  'id': instance.id,
  'email_hint': instance.emailHint,
  'since': instance.since.toIso8601String(),
};
