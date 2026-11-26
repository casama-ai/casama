// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_check_after_invites_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveCheckAfterInvitesInnerCWProxy {
  MoveCheckAfterInvitesInner name(String name);

  MoveCheckAfterInvitesInner email(String email);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfterInvitesInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfterInvitesInner(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveCheckAfterInvitesInner call({String name, String email});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveCheckAfterInvitesInner.copyWith(...)` or call `instanceOfMoveCheckAfterInvitesInner.copyWith.fieldName(value)` for a single field.
class _$MoveCheckAfterInvitesInnerCWProxyImpl
    implements _$MoveCheckAfterInvitesInnerCWProxy {
  const _$MoveCheckAfterInvitesInnerCWProxyImpl(this._value);

  final MoveCheckAfterInvitesInner _value;

  @override
  MoveCheckAfterInvitesInner name(String name) => call(name: name);

  @override
  MoveCheckAfterInvitesInner email(String email) => call(email: email);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfterInvitesInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfterInvitesInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveCheckAfterInvitesInner call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return MoveCheckAfterInvitesInner(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $MoveCheckAfterInvitesInnerCopyWith on MoveCheckAfterInvitesInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveCheckAfterInvitesInner.copyWith(...)` or `instanceOfMoveCheckAfterInvitesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveCheckAfterInvitesInnerCWProxy get copyWith =>
      _$MoveCheckAfterInvitesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCheckAfterInvitesInner _$MoveCheckAfterInvitesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MoveCheckAfterInvitesInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name', 'email']);
  final val = MoveCheckAfterInvitesInner(
    name: $checkedConvert('name', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$MoveCheckAfterInvitesInnerToJson(
  MoveCheckAfterInvitesInner instance,
) => <String, dynamic>{'name': instance.name, 'email': instance.email};
