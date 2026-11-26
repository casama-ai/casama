// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_key.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileKeyCWProxy {
  FileKey id(String id);

  FileKey orgId(String orgId);

  FileKey platform(FileKeyPlatformEnum platform);

  FileKey label(String? label);

  FileKey lastUsedAt(DateTime? lastUsedAt);

  FileKey createdAt(DateTime createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKey(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKey(...).copyWith(id: 12, name: "My name")
  /// ```
  FileKey call({
    String id,
    String orgId,
    FileKeyPlatformEnum platform,
    String? label,
    DateTime? lastUsedAt,
    DateTime createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFileKey.copyWith(...)` or call `instanceOfFileKey.copyWith.fieldName(value)` for a single field.
class _$FileKeyCWProxyImpl implements _$FileKeyCWProxy {
  const _$FileKeyCWProxyImpl(this._value);

  final FileKey _value;

  @override
  FileKey id(String id) => call(id: id);

  @override
  FileKey orgId(String orgId) => call(orgId: orgId);

  @override
  FileKey platform(FileKeyPlatformEnum platform) => call(platform: platform);

  @override
  FileKey label(String? label) => call(label: label);

  @override
  FileKey lastUsedAt(DateTime? lastUsedAt) => call(lastUsedAt: lastUsedAt);

  @override
  FileKey createdAt(DateTime createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKey(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKey(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FileKey call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? lastUsedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return FileKey(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      platform: platform == const $CopyWithPlaceholder() || platform == null
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as FileKeyPlatformEnum,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      lastUsedAt: lastUsedAt == const $CopyWithPlaceholder()
          ? _value.lastUsedAt
          // ignore: cast_nullable_to_non_nullable
          : lastUsedAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $FileKeyCopyWith on FileKey {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFileKey.copyWith(...)` or `instanceOfFileKey.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileKeyCWProxy get copyWith => _$FileKeyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileKey _$FileKeyFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FileKey',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'platform',
        'label',
        'last_used_at',
        'created_at',
      ],
    );
    final val = FileKey(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      platform: $checkedConvert(
        'platform',
        (v) => $enumDecode(_$FileKeyPlatformEnumEnumMap, v),
      ),
      label: $checkedConvert('label', (v) => v as String?),
      lastUsedAt: $checkedConvert(
        'last_used_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'lastUsedAt': 'last_used_at',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$FileKeyToJson(FileKey instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'platform': _$FileKeyPlatformEnumEnumMap[instance.platform]!,
  'label': instance.label,
  'last_used_at': instance.lastUsedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};

const _$FileKeyPlatformEnumEnumMap = {
  FileKeyPlatformEnum.ios: 'ios',
  FileKeyPlatformEnum.macos: 'macos',
};
