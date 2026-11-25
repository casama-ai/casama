// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_preview.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartnerPreviewCWProxy {
  PartnerPreview code(String code);

  PartnerPreview name(String name);

  PartnerPreview picture(String? picture);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerPreview(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerPreview(...).copyWith(id: 12, name: "My name")
  /// ```
  PartnerPreview call({String code, String name, String? picture});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPartnerPreview.copyWith(...)` or call `instanceOfPartnerPreview.copyWith.fieldName(value)` for a single field.
class _$PartnerPreviewCWProxyImpl implements _$PartnerPreviewCWProxy {
  const _$PartnerPreviewCWProxyImpl(this._value);

  final PartnerPreview _value;

  @override
  PartnerPreview code(String code) => call(code: code);

  @override
  PartnerPreview name(String name) => call(name: name);

  @override
  PartnerPreview picture(String? picture) => call(picture: picture);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerPreview(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerPreview(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PartnerPreview call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? picture = const $CopyWithPlaceholder(),
  }) {
    return PartnerPreview(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      picture: picture == const $CopyWithPlaceholder()
          ? _value.picture
          // ignore: cast_nullable_to_non_nullable
          : picture as String?,
    );
  }
}

extension $PartnerPreviewCopyWith on PartnerPreview {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPartnerPreview.copyWith(...)` or `instanceOfPartnerPreview.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartnerPreviewCWProxy get copyWith => _$PartnerPreviewCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerPreview _$PartnerPreviewFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PartnerPreview', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'name', 'picture']);
      final val = PartnerPreview(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        picture: $checkedConvert('picture', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PartnerPreviewToJson(PartnerPreview instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'picture': instance.picture,
    };
