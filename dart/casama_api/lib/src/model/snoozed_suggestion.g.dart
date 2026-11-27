// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snoozed_suggestion.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SnoozedSuggestionCWProxy {
  SnoozedSuggestion ok(bool ok);

  SnoozedSuggestion snoozedUntil(DateTime? snoozedUntil);

  SnoozedSuggestion expired(bool? expired);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SnoozedSuggestion(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SnoozedSuggestion(...).copyWith(id: 12, name: "My name")
  /// ```
  SnoozedSuggestion call({bool ok, DateTime? snoozedUntil, bool? expired});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSnoozedSuggestion.copyWith(...)` or call `instanceOfSnoozedSuggestion.copyWith.fieldName(value)` for a single field.
class _$SnoozedSuggestionCWProxyImpl implements _$SnoozedSuggestionCWProxy {
  const _$SnoozedSuggestionCWProxyImpl(this._value);

  final SnoozedSuggestion _value;

  @override
  SnoozedSuggestion ok(bool ok) => call(ok: ok);

  @override
  SnoozedSuggestion snoozedUntil(DateTime? snoozedUntil) =>
      call(snoozedUntil: snoozedUntil);

  @override
  SnoozedSuggestion expired(bool? expired) => call(expired: expired);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SnoozedSuggestion(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SnoozedSuggestion(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SnoozedSuggestion call({
    Object? ok = const $CopyWithPlaceholder(),
    Object? snoozedUntil = const $CopyWithPlaceholder(),
    Object? expired = const $CopyWithPlaceholder(),
  }) {
    return SnoozedSuggestion(
      ok: ok == const $CopyWithPlaceholder() || ok == null
          ? _value.ok
          // ignore: cast_nullable_to_non_nullable
          : ok as bool,
      snoozedUntil: snoozedUntil == const $CopyWithPlaceholder()
          ? _value.snoozedUntil
          // ignore: cast_nullable_to_non_nullable
          : snoozedUntil as DateTime?,
      expired: expired == const $CopyWithPlaceholder()
          ? _value.expired
          // ignore: cast_nullable_to_non_nullable
          : expired as bool?,
    );
  }
}

extension $SnoozedSuggestionCopyWith on SnoozedSuggestion {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSnoozedSuggestion.copyWith(...)` or `instanceOfSnoozedSuggestion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SnoozedSuggestionCWProxy get copyWith =>
      _$SnoozedSuggestionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnoozedSuggestion _$SnoozedSuggestionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SnoozedSuggestion', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['ok', 'snoozed_until']);
      final val = SnoozedSuggestion(
        ok: $checkedConvert('ok', (v) => v as bool),
        snoozedUntil: $checkedConvert(
          'snoozed_until',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        expired: $checkedConvert('expired', (v) => v as bool? ?? false),
      );
      return val;
    }, fieldKeyMap: const {'snoozedUntil': 'snoozed_until'});

Map<String, dynamic> _$SnoozedSuggestionToJson(SnoozedSuggestion instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'snoozed_until': instance.snoozedUntil?.toIso8601String(),
      'expired': ?instance.expired,
    };
