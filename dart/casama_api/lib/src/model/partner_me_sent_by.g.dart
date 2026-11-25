// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_me_sent_by.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartnerMeSentByCWProxy {
  PartnerMeSentBy code(String code);

  PartnerMeSentBy name(String name);

  PartnerMeSentBy picture(String? picture);

  PartnerMeSentBy claimedAt(DateTime claimedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerMeSentBy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerMeSentBy(...).copyWith(id: 12, name: "My name")
  /// ```
  PartnerMeSentBy call({
    String code,
    String name,
    String? picture,
    DateTime claimedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPartnerMeSentBy.copyWith(...)` or call `instanceOfPartnerMeSentBy.copyWith.fieldName(value)` for a single field.
class _$PartnerMeSentByCWProxyImpl implements _$PartnerMeSentByCWProxy {
  const _$PartnerMeSentByCWProxyImpl(this._value);

  final PartnerMeSentBy _value;

  @override
  PartnerMeSentBy code(String code) => call(code: code);

  @override
  PartnerMeSentBy name(String name) => call(name: name);

  @override
  PartnerMeSentBy picture(String? picture) => call(picture: picture);

  @override
  PartnerMeSentBy claimedAt(DateTime claimedAt) => call(claimedAt: claimedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `PartnerMeSentBy(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PartnerMeSentBy(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PartnerMeSentBy call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? picture = const $CopyWithPlaceholder(),
    Object? claimedAt = const $CopyWithPlaceholder(),
  }) {
    return PartnerMeSentBy(
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
      claimedAt: claimedAt == const $CopyWithPlaceholder() || claimedAt == null
          ? _value.claimedAt
          // ignore: cast_nullable_to_non_nullable
          : claimedAt as DateTime,
    );
  }
}

extension $PartnerMeSentByCopyWith on PartnerMeSentBy {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPartnerMeSentBy.copyWith(...)` or `instanceOfPartnerMeSentBy.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartnerMeSentByCWProxy get copyWith => _$PartnerMeSentByCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerMeSentBy _$PartnerMeSentByFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PartnerMeSentBy', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['code', 'name', 'picture', 'claimed_at'],
      );
      final val = PartnerMeSentBy(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        picture: $checkedConvert('picture', (v) => v as String?),
        claimedAt: $checkedConvert(
          'claimed_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'claimedAt': 'claimed_at'});

Map<String, dynamic> _$PartnerMeSentByToJson(PartnerMeSentBy instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'picture': instance.picture,
      'claimed_at': instance.claimedAt.toIso8601String(),
    };
