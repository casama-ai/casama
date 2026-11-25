// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_owner_alert_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateOwnerAlertSettingsCWProxy {
  UpdateOwnerAlertSettings paused(bool? paused);

  UpdateOwnerAlertSettings kinds(Map<String, bool>? kinds);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateOwnerAlertSettings(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateOwnerAlertSettings(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateOwnerAlertSettings call({bool? paused, Map<String, bool>? kinds});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateOwnerAlertSettings.copyWith(...)` or call `instanceOfUpdateOwnerAlertSettings.copyWith.fieldName(value)` for a single field.
class _$UpdateOwnerAlertSettingsCWProxyImpl
    implements _$UpdateOwnerAlertSettingsCWProxy {
  const _$UpdateOwnerAlertSettingsCWProxyImpl(this._value);

  final UpdateOwnerAlertSettings _value;

  @override
  UpdateOwnerAlertSettings paused(bool? paused) => call(paused: paused);

  @override
  UpdateOwnerAlertSettings kinds(Map<String, bool>? kinds) =>
      call(kinds: kinds);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateOwnerAlertSettings(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateOwnerAlertSettings(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateOwnerAlertSettings call({
    Object? paused = const $CopyWithPlaceholder(),
    Object? kinds = const $CopyWithPlaceholder(),
  }) {
    return UpdateOwnerAlertSettings(
      paused: paused == const $CopyWithPlaceholder()
          ? _value.paused
          // ignore: cast_nullable_to_non_nullable
          : paused as bool?,
      kinds: kinds == const $CopyWithPlaceholder()
          ? _value.kinds
          // ignore: cast_nullable_to_non_nullable
          : kinds as Map<String, bool>?,
    );
  }
}

extension $UpdateOwnerAlertSettingsCopyWith on UpdateOwnerAlertSettings {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateOwnerAlertSettings.copyWith(...)` or `instanceOfUpdateOwnerAlertSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateOwnerAlertSettingsCWProxy get copyWith =>
      _$UpdateOwnerAlertSettingsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateOwnerAlertSettings _$UpdateOwnerAlertSettingsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateOwnerAlertSettings', json, ($checkedConvert) {
  final val = UpdateOwnerAlertSettings(
    paused: $checkedConvert('paused', (v) => v as bool?),
    kinds: $checkedConvert(
      'kinds',
      (v) =>
          (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool)),
    ),
  );
  return val;
});

Map<String, dynamic> _$UpdateOwnerAlertSettingsToJson(
  UpdateOwnerAlertSettings instance,
) => <String, dynamic>{'paused': ?instance.paused, 'kinds': ?instance.kinds};
