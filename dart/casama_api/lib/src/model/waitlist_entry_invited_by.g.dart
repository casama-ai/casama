// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitlist_entry_invited_by.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WaitlistEntryInvitedByCWProxy {
  WaitlistEntryInvitedBy name(String? name);

  WaitlistEntryInvitedBy invitesLeft(int invitesLeft);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `WaitlistEntryInvitedBy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WaitlistEntryInvitedBy(...).copyWith(id: 12, name: "My name")
  /// ```
  WaitlistEntryInvitedBy call({String? name, int invitesLeft});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWaitlistEntryInvitedBy.copyWith(...)` or call `instanceOfWaitlistEntryInvitedBy.copyWith.fieldName(value)` for a single field.
class _$WaitlistEntryInvitedByCWProxyImpl
    implements _$WaitlistEntryInvitedByCWProxy {
  const _$WaitlistEntryInvitedByCWProxyImpl(this._value);

  final WaitlistEntryInvitedBy _value;

  @override
  WaitlistEntryInvitedBy name(String? name) => call(name: name);

  @override
  WaitlistEntryInvitedBy invitesLeft(int invitesLeft) =>
      call(invitesLeft: invitesLeft);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `WaitlistEntryInvitedBy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WaitlistEntryInvitedBy(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  WaitlistEntryInvitedBy call({
    Object? name = const $CopyWithPlaceholder(),
    Object? invitesLeft = const $CopyWithPlaceholder(),
  }) {
    return WaitlistEntryInvitedBy(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      invitesLeft:
          invitesLeft == const $CopyWithPlaceholder() || invitesLeft == null
          ? _value.invitesLeft
          // ignore: cast_nullable_to_non_nullable
          : invitesLeft as int,
    );
  }
}

extension $WaitlistEntryInvitedByCopyWith on WaitlistEntryInvitedBy {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWaitlistEntryInvitedBy.copyWith(...)` or `instanceOfWaitlistEntryInvitedBy.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WaitlistEntryInvitedByCWProxy get copyWith =>
      _$WaitlistEntryInvitedByCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaitlistEntryInvitedBy _$WaitlistEntryInvitedByFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WaitlistEntryInvitedBy', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name', 'invites_left']);
  final val = WaitlistEntryInvitedBy(
    name: $checkedConvert('name', (v) => v as String?),
    invitesLeft: $checkedConvert('invites_left', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'invitesLeft': 'invites_left'});

Map<String, dynamic> _$WaitlistEntryInvitedByToJson(
  WaitlistEntryInvitedBy instance,
) => <String, dynamic>{
  'name': instance.name,
  'invites_left': instance.invitesLeft,
};
