// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_key_created.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileKeyCreatedCWProxy {
  FileKeyCreated id(String id);

  FileKeyCreated orgId(String orgId);

  FileKeyCreated platform(FileKeyCreatedPlatformEnum platform);

  FileKeyCreated label(String? label);

  FileKeyCreated lastUsedAt(DateTime? lastUsedAt);

  FileKeyCreated createdAt(DateTime createdAt);

  FileKeyCreated key(String key);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKeyCreated(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKeyCreated(...).copyWith(id: 12, name: "My name")
  /// ```
  FileKeyCreated call({
    String id,
    String orgId,
    FileKeyCreatedPlatformEnum platform,
    String? label,
    DateTime? lastUsedAt,
    DateTime createdAt,
    String key,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFileKeyCreated.copyWith(...)` or call `instanceOfFileKeyCreated.copyWith.fieldName(value)` for a single field.
class _$FileKeyCreatedCWProxyImpl implements _$FileKeyCreatedCWProxy {
  const _$FileKeyCreatedCWProxyImpl(this._value);

  final FileKeyCreated _value;

  @override
  FileKeyCreated id(String id) => call(id: id);

  @override
  FileKeyCreated orgId(String orgId) => call(orgId: orgId);

  @override
  FileKeyCreated platform(FileKeyCreatedPlatformEnum platform) =>
      call(platform: platform);

  @override
  FileKeyCreated label(String? label) => call(label: label);

  @override
  FileKeyCreated lastUsedAt(DateTime? lastUsedAt) =>
      call(lastUsedAt: lastUsedAt);

  @override
  FileKeyCreated createdAt(DateTime createdAt) => call(createdAt: createdAt);

  @override
  FileKeyCreated key(String key) => call(key: key);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FileKeyCreated(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FileKeyCreated(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FileKeyCreated call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? lastUsedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
  }) {
    return FileKeyCreated(
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
          : platform as FileKeyCreatedPlatformEnum,
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
      key: key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
    );
  }
}

extension $FileKeyCreatedCopyWith on FileKeyCreated {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFileKeyCreated.copyWith(...)` or `instanceOfFileKeyCreated.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileKeyCreatedCWProxy get copyWith => _$FileKeyCreatedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileKeyCreated _$FileKeyCreatedFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FileKeyCreated',
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
            'key',
          ],
        );
        final val = FileKeyCreated(
          id: $checkedConvert('id', (v) => v as String),
          orgId: $checkedConvert('org_id', (v) => v as String),
          platform: $checkedConvert(
            'platform',
            (v) => $enumDecode(_$FileKeyCreatedPlatformEnumEnumMap, v),
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
          key: $checkedConvert('key', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'orgId': 'org_id',
        'lastUsedAt': 'last_used_at',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$FileKeyCreatedToJson(FileKeyCreated instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'platform': _$FileKeyCreatedPlatformEnumEnumMap[instance.platform]!,
      'label': instance.label,
      'last_used_at': instance.lastUsedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'key': instance.key,
    };

const _$FileKeyCreatedPlatformEnumEnumMap = {
  FileKeyCreatedPlatformEnum.ios: 'ios',
  FileKeyCreatedPlatformEnum.macos: 'macos',
};
