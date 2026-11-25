// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announce_inactivity_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnounceInactivityResultCWProxy {
  AnnounceInactivityResult queued(int queued);

  AnnounceInactivityResult settings(AdminInactivity settings);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AnnounceInactivityResult(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AnnounceInactivityResult(...).copyWith(id: 12, name: "My name")
  /// ```
  AnnounceInactivityResult call({int queued, AdminInactivity settings});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAnnounceInactivityResult.copyWith(...)` or call `instanceOfAnnounceInactivityResult.copyWith.fieldName(value)` for a single field.
class _$AnnounceInactivityResultCWProxyImpl
    implements _$AnnounceInactivityResultCWProxy {
  const _$AnnounceInactivityResultCWProxyImpl(this._value);

  final AnnounceInactivityResult _value;

  @override
  AnnounceInactivityResult queued(int queued) => call(queued: queued);

  @override
  AnnounceInactivityResult settings(AdminInactivity settings) =>
      call(settings: settings);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AnnounceInactivityResult(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AnnounceInactivityResult(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AnnounceInactivityResult call({
    Object? queued = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
  }) {
    return AnnounceInactivityResult(
      queued: queued == const $CopyWithPlaceholder() || queued == null
          ? _value.queued
          // ignore: cast_nullable_to_non_nullable
          : queued as int,
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as AdminInactivity,
    );
  }
}

extension $AnnounceInactivityResultCopyWith on AnnounceInactivityResult {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAnnounceInactivityResult.copyWith(...)` or `instanceOfAnnounceInactivityResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnounceInactivityResultCWProxy get copyWith =>
      _$AnnounceInactivityResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnounceInactivityResult _$AnnounceInactivityResultFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AnnounceInactivityResult', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['queued', 'settings']);
  final val = AnnounceInactivityResult(
    queued: $checkedConvert('queued', (v) => (v as num).toInt()),
    settings: $checkedConvert(
      'settings',
      (v) => AdminInactivity.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AnnounceInactivityResultToJson(
  AnnounceInactivityResult instance,
) => <String, dynamic>{
  'queued': instance.queued,
  'settings': instance.settings.toJson(),
};
