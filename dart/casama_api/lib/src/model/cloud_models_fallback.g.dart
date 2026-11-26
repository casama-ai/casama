// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_fallback.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsFallbackCWProxy {
  CloudModelsFallback toOwn(bool toOwn);

  CloudModelsFallback fromOwn(bool fromOwn);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsFallback(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsFallback(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsFallback call({bool toOwn, bool fromOwn});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsFallback.copyWith(...)` or call `instanceOfCloudModelsFallback.copyWith.fieldName(value)` for a single field.
class _$CloudModelsFallbackCWProxyImpl implements _$CloudModelsFallbackCWProxy {
  const _$CloudModelsFallbackCWProxyImpl(this._value);

  final CloudModelsFallback _value;

  @override
  CloudModelsFallback toOwn(bool toOwn) => call(toOwn: toOwn);

  @override
  CloudModelsFallback fromOwn(bool fromOwn) => call(fromOwn: fromOwn);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsFallback(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsFallback(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsFallback call({
    Object? toOwn = const $CopyWithPlaceholder(),
    Object? fromOwn = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsFallback(
      toOwn: toOwn == const $CopyWithPlaceholder() || toOwn == null
          ? _value.toOwn
          // ignore: cast_nullable_to_non_nullable
          : toOwn as bool,
      fromOwn: fromOwn == const $CopyWithPlaceholder() || fromOwn == null
          ? _value.fromOwn
          // ignore: cast_nullable_to_non_nullable
          : fromOwn as bool,
    );
  }
}

extension $CloudModelsFallbackCopyWith on CloudModelsFallback {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsFallback.copyWith(...)` or `instanceOfCloudModelsFallback.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsFallbackCWProxy get copyWith =>
      _$CloudModelsFallbackCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsFallback _$CloudModelsFallbackFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CloudModelsFallback', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['to_own', 'from_own']);
      final val = CloudModelsFallback(
        toOwn: $checkedConvert('to_own', (v) => v as bool),
        fromOwn: $checkedConvert('from_own', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'toOwn': 'to_own', 'fromOwn': 'from_own'});

Map<String, dynamic> _$CloudModelsFallbackToJson(
  CloudModelsFallback instance,
) => <String, dynamic>{'to_own': instance.toOwn, 'from_own': instance.fromOwn};
