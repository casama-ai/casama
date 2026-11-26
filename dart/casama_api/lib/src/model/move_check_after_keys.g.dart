// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_check_after_keys.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoveCheckAfterKeysCWProxy {
  MoveCheckAfterKeys models(num models);

  MoveCheckAfterKeys chatApps(num chatApps);

  MoveCheckAfterKeys secrets(num secrets);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfterKeys(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfterKeys(...).copyWith(id: 12, name: "My name")
  /// ```
  MoveCheckAfterKeys call({num models, num chatApps, num secrets});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMoveCheckAfterKeys.copyWith(...)` or call `instanceOfMoveCheckAfterKeys.copyWith.fieldName(value)` for a single field.
class _$MoveCheckAfterKeysCWProxyImpl implements _$MoveCheckAfterKeysCWProxy {
  const _$MoveCheckAfterKeysCWProxyImpl(this._value);

  final MoveCheckAfterKeys _value;

  @override
  MoveCheckAfterKeys models(num models) => call(models: models);

  @override
  MoveCheckAfterKeys chatApps(num chatApps) => call(chatApps: chatApps);

  @override
  MoveCheckAfterKeys secrets(num secrets) => call(secrets: secrets);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `MoveCheckAfterKeys(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MoveCheckAfterKeys(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  MoveCheckAfterKeys call({
    Object? models = const $CopyWithPlaceholder(),
    Object? chatApps = const $CopyWithPlaceholder(),
    Object? secrets = const $CopyWithPlaceholder(),
  }) {
    return MoveCheckAfterKeys(
      models: models == const $CopyWithPlaceholder() || models == null
          ? _value.models
          // ignore: cast_nullable_to_non_nullable
          : models as num,
      chatApps: chatApps == const $CopyWithPlaceholder() || chatApps == null
          ? _value.chatApps
          // ignore: cast_nullable_to_non_nullable
          : chatApps as num,
      secrets: secrets == const $CopyWithPlaceholder() || secrets == null
          ? _value.secrets
          // ignore: cast_nullable_to_non_nullable
          : secrets as num,
    );
  }
}

extension $MoveCheckAfterKeysCopyWith on MoveCheckAfterKeys {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMoveCheckAfterKeys.copyWith(...)` or `instanceOfMoveCheckAfterKeys.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoveCheckAfterKeysCWProxy get copyWith =>
      _$MoveCheckAfterKeysCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCheckAfterKeys _$MoveCheckAfterKeysFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveCheckAfterKeys', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['models', 'chat_apps', 'secrets']);
      final val = MoveCheckAfterKeys(
        models: $checkedConvert('models', (v) => v as num),
        chatApps: $checkedConvert('chat_apps', (v) => v as num),
        secrets: $checkedConvert('secrets', (v) => v as num),
      );
      return val;
    }, fieldKeyMap: const {'chatApps': 'chat_apps'});

Map<String, dynamic> _$MoveCheckAfterKeysToJson(MoveCheckAfterKeys instance) =>
    <String, dynamic>{
      'models': instance.models,
      'chat_apps': instance.chatApps,
      'secrets': instance.secrets,
    };
