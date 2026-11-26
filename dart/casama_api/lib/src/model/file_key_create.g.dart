// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_key_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileKeyCreateCWProxy {
  FileKeyCreate orgId(String orgId);

  FileKeyCreate platform(FileKeyCreatePlatformEnum platform);

  FileKeyCreate label(String? label);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKeyCreate(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKeyCreate(...).copyWith(id: 12, name: "My name")
  /// ```
  FileKeyCreate call({
    String orgId,
    FileKeyCreatePlatformEnum platform,
    String? label,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFileKeyCreate.copyWith(...)` or call `instanceOfFileKeyCreate.copyWith.fieldName(value)` for a single field.
class _$FileKeyCreateCWProxyImpl implements _$FileKeyCreateCWProxy {
  const _$FileKeyCreateCWProxyImpl(this._value);

  final FileKeyCreate _value;

  @override
  FileKeyCreate orgId(String orgId) => call(orgId: orgId);

  @override
  FileKeyCreate platform(FileKeyCreatePlatformEnum platform) =>
      call(platform: platform);

  @override
  FileKeyCreate label(String? label) => call(label: label);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKeyCreate(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKeyCreate(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FileKeyCreate call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return FileKeyCreate(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      platform: platform == const $CopyWithPlaceholder() || platform == null
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as FileKeyCreatePlatformEnum,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
    );
  }
}

extension $FileKeyCreateCopyWith on FileKeyCreate {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFileKeyCreate.copyWith(...)` or `instanceOfFileKeyCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileKeyCreateCWProxy get copyWith => _$FileKeyCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileKeyCreate _$FileKeyCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FileKeyCreate', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['org_id', 'platform']);
      final val = FileKeyCreate(
        orgId: $checkedConvert('org_id', (v) => v as String),
        platform: $checkedConvert(
          'platform',
          (v) => $enumDecode(_$FileKeyCreatePlatformEnumEnumMap, v),
        ),
        label: $checkedConvert('label', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'orgId': 'org_id'});

Map<String, dynamic> _$FileKeyCreateToJson(FileKeyCreate instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'platform': _$FileKeyCreatePlatformEnumEnumMap[instance.platform]!,
      'label': ?instance.label,
    };

const _$FileKeyCreatePlatformEnumEnumMap = {
  FileKeyCreatePlatformEnum.ios: 'ios',
  FileKeyCreatePlatformEnum.macos: 'macos',
};
