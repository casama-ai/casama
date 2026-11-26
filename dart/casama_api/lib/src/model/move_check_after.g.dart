// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_check_after.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveCheckAfterCWProxy {
  MoveCheckAfter reconnect(List<MoveCheckAfterReconnectInner> reconnect);

  MoveCheckAfter invites(List<MoveCheckAfterInvitesInner> invites);

  MoveCheckAfter keys(MoveCheckAfterKeys keys);

  MoveCheckAfter computers(num computers);

  MoveCheckAfter chatgptPlans(num chatgptPlans);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfter(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfter(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveCheckAfter call({
    List<MoveCheckAfterReconnectInner> reconnect,
    List<MoveCheckAfterInvitesInner> invites,
    MoveCheckAfterKeys keys,
    num computers,
    num chatgptPlans,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveCheckAfter.copyWith(...)` or call `instanceOfMoveCheckAfter.copyWith.fieldName(value)` for a single field.
class _$MoveCheckAfterCWProxyImpl implements _$MoveCheckAfterCWProxy {
  const _$MoveCheckAfterCWProxyImpl(this._value);

  final MoveCheckAfter _value;

  @override
  MoveCheckAfter reconnect(List<MoveCheckAfterReconnectInner> reconnect) =>
      call(reconnect: reconnect);

  @override
  MoveCheckAfter invites(List<MoveCheckAfterInvitesInner> invites) =>
      call(invites: invites);

  @override
  MoveCheckAfter keys(MoveCheckAfterKeys keys) => call(keys: keys);

  @override
  MoveCheckAfter computers(num computers) => call(computers: computers);

  @override
  MoveCheckAfter chatgptPlans(num chatgptPlans) =>
      call(chatgptPlans: chatgptPlans);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfter(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfter(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveCheckAfter call({
    Object? reconnect = const $CopyWithPlaceholder(),
    Object? invites = const $CopyWithPlaceholder(),
    Object? keys = const $CopyWithPlaceholder(),
    Object? computers = const $CopyWithPlaceholder(),
    Object? chatgptPlans = const $CopyWithPlaceholder(),
  }) {
    return MoveCheckAfter(
      reconnect: reconnect == const $CopyWithPlaceholder() || reconnect == null
          ? _value.reconnect
          // ignore: cast_nullable_to_non_nullable
          : reconnect as List<MoveCheckAfterReconnectInner>,
      invites: invites == const $CopyWithPlaceholder() || invites == null
          ? _value.invites
          // ignore: cast_nullable_to_non_nullable
          : invites as List<MoveCheckAfterInvitesInner>,
      keys: keys == const $CopyWithPlaceholder() || keys == null
          ? _value.keys
          // ignore: cast_nullable_to_non_nullable
          : keys as MoveCheckAfterKeys,
      computers: computers == const $CopyWithPlaceholder() || computers == null
          ? _value.computers
          // ignore: cast_nullable_to_non_nullable
          : computers as num,
      chatgptPlans:
          chatgptPlans == const $CopyWithPlaceholder() || chatgptPlans == null
          ? _value.chatgptPlans
          // ignore: cast_nullable_to_non_nullable
          : chatgptPlans as num,
    );
  }
}

extension $MoveCheckAfterCopyWith on MoveCheckAfter {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveCheckAfter.copyWith(...)` or `instanceOfMoveCheckAfter.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveCheckAfterCWProxy get copyWith => _$MoveCheckAfterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCheckAfter _$MoveCheckAfterFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveCheckAfter', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'reconnect',
          'invites',
          'keys',
          'computers',
          'chatgpt_plans',
        ],
      );
      final val = MoveCheckAfter(
        reconnect: $checkedConvert(
          'reconnect',
          (v) => (v as List<dynamic>)
              .map(
                (e) => MoveCheckAfterReconnectInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        invites: $checkedConvert(
          'invites',
          (v) => (v as List<dynamic>)
              .map(
                (e) => MoveCheckAfterInvitesInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        keys: $checkedConvert(
          'keys',
          (v) => MoveCheckAfterKeys.fromJson(v as Map<String, dynamic>),
        ),
        computers: $checkedConvert('computers', (v) => v as num),
        chatgptPlans: $checkedConvert('chatgpt_plans', (v) => v as num),
      );
      return val;
    }, fieldKeyMap: const {'chatgptPlans': 'chatgpt_plans'});

Map<String, dynamic> _$MoveCheckAfterToJson(MoveCheckAfter instance) =>
    <String, dynamic>{
      'reconnect': instance.reconnect.map((e) => e.toJson()).toList(),
      'invites': instance.invites.map((e) => e.toJson()).toList(),
      'keys': instance.keys.toJson(),
      'computers': instance.computers,
      'chatgpt_plans': instance.chatgptPlans,
    };
