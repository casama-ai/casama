// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_ask.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StarAskCWProxy {
  StarAsk ask(bool ask);

  StarAsk developer(bool developer);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `StarAsk(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// StarAsk(...).copyWith(id: 12, name: "My name")
  /// ```
  StarAsk call({bool ask, bool developer});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfStarAsk.copyWith(...)` or call `instanceOfStarAsk.copyWith.fieldName(value)` for a single field.
class _$StarAskCWProxyImpl implements _$StarAskCWProxy {
  const _$StarAskCWProxyImpl(this._value);

  final StarAsk _value;

  @override
  StarAsk ask(bool ask) => call(ask: ask);

  @override
  StarAsk developer(bool developer) => call(developer: developer);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `StarAsk(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// StarAsk(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  StarAsk call({
    Object? ask = const $CopyWithPlaceholder(),
    Object? developer = const $CopyWithPlaceholder(),
  }) {
    return StarAsk(
      ask: ask == const $CopyWithPlaceholder() || ask == null
          ? _value.ask
          // ignore: cast_nullable_to_non_nullable
          : ask as bool,
      developer: developer == const $CopyWithPlaceholder() || developer == null
          ? _value.developer
          // ignore: cast_nullable_to_non_nullable
          : developer as bool,
    );
  }
}

extension $StarAskCopyWith on StarAsk {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfStarAsk.copyWith(...)` or `instanceOfStarAsk.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StarAskCWProxy get copyWith => _$StarAskCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarAsk _$StarAskFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StarAsk', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['ask', 'developer']);
      final val = StarAsk(
        ask: $checkedConvert('ask', (v) => v as bool),
        developer: $checkedConvert('developer', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$StarAskToJson(StarAsk instance) => <String, dynamic>{
  'ask': instance.ask,
  'developer': instance.developer,
};
