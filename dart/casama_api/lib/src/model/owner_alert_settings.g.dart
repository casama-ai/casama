// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_alert_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerAlertSettingsCWProxy {
  OwnerAlertSettings paused(bool paused);

  OwnerAlertSettings kinds(List<OwnerAlertKind> kinds);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerAlertSettings(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerAlertSettings(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerAlertSettings call({bool paused, List<OwnerAlertKind> kinds});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerAlertSettings.copyWith(...)` or call `instanceOfOwnerAlertSettings.copyWith.fieldName(value)` for a single field.
class _$OwnerAlertSettingsCWProxyImpl implements _$OwnerAlertSettingsCWProxy {
  const _$OwnerAlertSettingsCWProxyImpl(this._value);

  final OwnerAlertSettings _value;

  @override
  OwnerAlertSettings paused(bool paused) => call(paused: paused);

  @override
  OwnerAlertSettings kinds(List<OwnerAlertKind> kinds) => call(kinds: kinds);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerAlertSettings(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerAlertSettings(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerAlertSettings call({
    Object? paused = const $CopyWithPlaceholder(),
    Object? kinds = const $CopyWithPlaceholder(),
  }) {
    return OwnerAlertSettings(
      paused: paused == const $CopyWithPlaceholder() || paused == null
          ? _value.paused
          // ignore: cast_nullable_to_non_nullable
          : paused as bool,
      kinds: kinds == const $CopyWithPlaceholder() || kinds == null
          ? _value.kinds
          // ignore: cast_nullable_to_non_nullable
          : kinds as List<OwnerAlertKind>,
    );
  }
}

extension $OwnerAlertSettingsCopyWith on OwnerAlertSettings {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerAlertSettings.copyWith(...)` or `instanceOfOwnerAlertSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerAlertSettingsCWProxy get copyWith =>
      _$OwnerAlertSettingsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerAlertSettings _$OwnerAlertSettingsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OwnerAlertSettings', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['paused', 'kinds']);
      final val = OwnerAlertSettings(
        paused: $checkedConvert('paused', (v) => v as bool),
        kinds: $checkedConvert(
          'kinds',
          (v) => (v as List<dynamic>)
              .map((e) => OwnerAlertKind.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OwnerAlertSettingsToJson(OwnerAlertSettings instance) =>
    <String, dynamic>{
      'paused': instance.paused,
      'kinds': instance.kinds.map((e) => e.toJson()).toList(),
    };
