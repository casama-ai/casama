// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_user_team_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetUserTeamRequestCWProxy {
  SetUserTeamRequest team(bool team);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetUserTeamRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetUserTeamRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SetUserTeamRequest call({bool team});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSetUserTeamRequest.copyWith(...)` or call `instanceOfSetUserTeamRequest.copyWith.fieldName(value)` for a single field.
class _$SetUserTeamRequestCWProxyImpl implements _$SetUserTeamRequestCWProxy {
  const _$SetUserTeamRequestCWProxyImpl(this._value);

  final SetUserTeamRequest _value;

  @override
  SetUserTeamRequest team(bool team) => call(team: team);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SetUserTeamRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SetUserTeamRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SetUserTeamRequest call({Object? team = const $CopyWithPlaceholder()}) {
    return SetUserTeamRequest(
      team: team == const $CopyWithPlaceholder() || team == null
          ? _value.team
          // ignore: cast_nullable_to_non_nullable
          : team as bool,
    );
  }
}

extension $SetUserTeamRequestCopyWith on SetUserTeamRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSetUserTeamRequest.copyWith(...)` or `instanceOfSetUserTeamRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetUserTeamRequestCWProxy get copyWith =>
      _$SetUserTeamRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetUserTeamRequest _$SetUserTeamRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SetUserTeamRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['team']);
      final val = SetUserTeamRequest(
        team: $checkedConvert('team', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$SetUserTeamRequestToJson(SetUserTeamRequest instance) =>
    <String, dynamic>{'team': instance.team};
