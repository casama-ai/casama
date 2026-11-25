// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_takeover_login_body.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShareTakeoverLoginBodyCWProxy {
  ShareTakeoverLoginBody username(String username);

  ShareTakeoverLoginBody password(String password);

  ShareTakeoverLoginBody remember(bool? remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ShareTakeoverLoginBody(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ShareTakeoverLoginBody(...).copyWith(id: 12, name: "My name")
  /// ```
  ShareTakeoverLoginBody call({
    String username,
    String password,
    bool? remember,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfShareTakeoverLoginBody.copyWith(...)` or call `instanceOfShareTakeoverLoginBody.copyWith.fieldName(value)` for a single field.
class _$ShareTakeoverLoginBodyCWProxyImpl
    implements _$ShareTakeoverLoginBodyCWProxy {
  const _$ShareTakeoverLoginBodyCWProxyImpl(this._value);

  final ShareTakeoverLoginBody _value;

  @override
  ShareTakeoverLoginBody username(String username) => call(username: username);

  @override
  ShareTakeoverLoginBody password(String password) => call(password: password);

  @override
  ShareTakeoverLoginBody remember(bool? remember) => call(remember: remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ShareTakeoverLoginBody(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ShareTakeoverLoginBody(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ShareTakeoverLoginBody call({
    Object? username = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? remember = const $CopyWithPlaceholder(),
  }) {
    return ShareTakeoverLoginBody(
      username: username == const $CopyWithPlaceholder() || username == null
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      remember: remember == const $CopyWithPlaceholder()
          ? _value.remember
          // ignore: cast_nullable_to_non_nullable
          : remember as bool?,
    );
  }
}

extension $ShareTakeoverLoginBodyCopyWith on ShareTakeoverLoginBody {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfShareTakeoverLoginBody.copyWith(...)` or `instanceOfShareTakeoverLoginBody.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShareTakeoverLoginBodyCWProxy get copyWith =>
      _$ShareTakeoverLoginBodyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareTakeoverLoginBody _$ShareTakeoverLoginBodyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShareTakeoverLoginBody', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['username', 'password']);
  final val = ShareTakeoverLoginBody(
    username: $checkedConvert('username', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
    remember: $checkedConvert('remember', (v) => v as bool? ?? true),
  );
  return val;
});

Map<String, dynamic> _$ShareTakeoverLoginBodyToJson(
  ShareTakeoverLoginBody instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
  'remember': ?instance.remember,
};
