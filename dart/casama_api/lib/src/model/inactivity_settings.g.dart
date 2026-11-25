// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inactivity_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InactivitySettingsCWProxy {
  InactivitySettings rest(InactivityStepMode rest);

  InactivitySettings files(InactivityStepMode files);

  InactivitySettings removal(InactivityStepMode removal);

  InactivitySettings unconfirmed(InactivityStepMode unconfirmed);

  InactivitySettings announcedAt(DateTime? announcedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InactivitySettings(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InactivitySettings(...).copyWith(id: 12, name: "My name")
  /// ```
  InactivitySettings call({
    InactivityStepMode rest,
    InactivityStepMode files,
    InactivityStepMode removal,
    InactivityStepMode unconfirmed,
    DateTime? announcedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInactivitySettings.copyWith(...)` or call `instanceOfInactivitySettings.copyWith.fieldName(value)` for a single field.
class _$InactivitySettingsCWProxyImpl implements _$InactivitySettingsCWProxy {
  const _$InactivitySettingsCWProxyImpl(this._value);

  final InactivitySettings _value;

  @override
  InactivitySettings rest(InactivityStepMode rest) => call(rest: rest);

  @override
  InactivitySettings files(InactivityStepMode files) => call(files: files);

  @override
  InactivitySettings removal(InactivityStepMode removal) =>
      call(removal: removal);

  @override
  InactivitySettings unconfirmed(InactivityStepMode unconfirmed) =>
      call(unconfirmed: unconfirmed);

  @override
  InactivitySettings announcedAt(DateTime? announcedAt) =>
      call(announcedAt: announcedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `InactivitySettings(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InactivitySettings(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InactivitySettings call({
    Object? rest = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
    Object? removal = const $CopyWithPlaceholder(),
    Object? unconfirmed = const $CopyWithPlaceholder(),
    Object? announcedAt = const $CopyWithPlaceholder(),
  }) {
    return InactivitySettings(
      rest: rest == const $CopyWithPlaceholder() || rest == null
          ? _value.rest
          // ignore: cast_nullable_to_non_nullable
          : rest as InactivityStepMode,
      files: files == const $CopyWithPlaceholder() || files == null
          ? _value.files
          // ignore: cast_nullable_to_non_nullable
          : files as InactivityStepMode,
      removal: removal == const $CopyWithPlaceholder() || removal == null
          ? _value.removal
          // ignore: cast_nullable_to_non_nullable
          : removal as InactivityStepMode,
      unconfirmed:
          unconfirmed == const $CopyWithPlaceholder() || unconfirmed == null
          ? _value.unconfirmed
          // ignore: cast_nullable_to_non_nullable
          : unconfirmed as InactivityStepMode,
      announcedAt: announcedAt == const $CopyWithPlaceholder()
          ? _value.announcedAt
          // ignore: cast_nullable_to_non_nullable
          : announcedAt as DateTime?,
    );
  }
}

extension $InactivitySettingsCopyWith on InactivitySettings {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInactivitySettings.copyWith(...)` or `instanceOfInactivitySettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InactivitySettingsCWProxy get copyWith =>
      _$InactivitySettingsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InactivitySettings _$InactivitySettingsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InactivitySettings', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'rest',
          'files',
          'removal',
          'unconfirmed',
          'announced_at',
        ],
      );
      final val = InactivitySettings(
        rest: $checkedConvert(
          'rest',
          (v) => $enumDecode(_$InactivityStepModeEnumMap, v),
        ),
        files: $checkedConvert(
          'files',
          (v) => $enumDecode(_$InactivityStepModeEnumMap, v),
        ),
        removal: $checkedConvert(
          'removal',
          (v) => $enumDecode(_$InactivityStepModeEnumMap, v),
        ),
        unconfirmed: $checkedConvert(
          'unconfirmed',
          (v) => $enumDecode(_$InactivityStepModeEnumMap, v),
        ),
        announcedAt: $checkedConvert(
          'announced_at',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'announcedAt': 'announced_at'});

Map<String, dynamic> _$InactivitySettingsToJson(InactivitySettings instance) =>
    <String, dynamic>{
      'rest': _$InactivityStepModeEnumMap[instance.rest]!,
      'files': _$InactivityStepModeEnumMap[instance.files]!,
      'removal': _$InactivityStepModeEnumMap[instance.removal]!,
      'unconfirmed': _$InactivityStepModeEnumMap[instance.unconfirmed]!,
      'announced_at': instance.announcedAt?.toIso8601String(),
    };

const _$InactivityStepModeEnumMap = {
  InactivityStepMode.off: 'off',
  InactivityStepMode.report: 'report',
  InactivityStepMode.on_: 'on',
};
