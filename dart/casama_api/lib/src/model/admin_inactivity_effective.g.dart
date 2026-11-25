// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_inactivity_effective.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminInactivityEffectiveCWProxy {
  AdminInactivityEffective rest(InactivityStepMode rest);

  AdminInactivityEffective files(InactivityStepMode files);

  AdminInactivityEffective removal(InactivityStepMode removal);

  AdminInactivityEffective unconfirmed(InactivityStepMode unconfirmed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminInactivityEffective(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminInactivityEffective(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminInactivityEffective call({
    InactivityStepMode rest,
    InactivityStepMode files,
    InactivityStepMode removal,
    InactivityStepMode unconfirmed,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminInactivityEffective.copyWith(...)` or call `instanceOfAdminInactivityEffective.copyWith.fieldName(value)` for a single field.
class _$AdminInactivityEffectiveCWProxyImpl
    implements _$AdminInactivityEffectiveCWProxy {
  const _$AdminInactivityEffectiveCWProxyImpl(this._value);

  final AdminInactivityEffective _value;

  @override
  AdminInactivityEffective rest(InactivityStepMode rest) => call(rest: rest);

  @override
  AdminInactivityEffective files(InactivityStepMode files) =>
      call(files: files);

  @override
  AdminInactivityEffective removal(InactivityStepMode removal) =>
      call(removal: removal);

  @override
  AdminInactivityEffective unconfirmed(InactivityStepMode unconfirmed) =>
      call(unconfirmed: unconfirmed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminInactivityEffective(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminInactivityEffective(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminInactivityEffective call({
    Object? rest = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
    Object? removal = const $CopyWithPlaceholder(),
    Object? unconfirmed = const $CopyWithPlaceholder(),
  }) {
    return AdminInactivityEffective(
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
    );
  }
}

extension $AdminInactivityEffectiveCopyWith on AdminInactivityEffective {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminInactivityEffective.copyWith(...)` or `instanceOfAdminInactivityEffective.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminInactivityEffectiveCWProxy get copyWith =>
      _$AdminInactivityEffectiveCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminInactivityEffective _$AdminInactivityEffectiveFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminInactivityEffective', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['rest', 'files', 'removal', 'unconfirmed'],
  );
  final val = AdminInactivityEffective(
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
  );
  return val;
});

Map<String, dynamic> _$AdminInactivityEffectiveToJson(
  AdminInactivityEffective instance,
) => <String, dynamic>{
  'rest': _$InactivityStepModeEnumMap[instance.rest]!,
  'files': _$InactivityStepModeEnumMap[instance.files]!,
  'removal': _$InactivityStepModeEnumMap[instance.removal]!,
  'unconfirmed': _$InactivityStepModeEnumMap[instance.unconfirmed]!,
};

const _$InactivityStepModeEnumMap = {
  InactivityStepMode.off: 'off',
  InactivityStepMode.report: 'report',
  InactivityStepMode.on_: 'on',
};
