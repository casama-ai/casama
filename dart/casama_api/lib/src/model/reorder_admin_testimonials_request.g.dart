// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_admin_testimonials_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReorderAdminTestimonialsRequestCWProxy {
  ReorderAdminTestimonialsRequest ids(List<String> ids);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ReorderAdminTestimonialsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ReorderAdminTestimonialsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ReorderAdminTestimonialsRequest call({List<String> ids});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfReorderAdminTestimonialsRequest.copyWith(...)` or call `instanceOfReorderAdminTestimonialsRequest.copyWith.fieldName(value)` for a single field.
class _$ReorderAdminTestimonialsRequestCWProxyImpl
    implements _$ReorderAdminTestimonialsRequestCWProxy {
  const _$ReorderAdminTestimonialsRequestCWProxyImpl(this._value);

  final ReorderAdminTestimonialsRequest _value;

  @override
  ReorderAdminTestimonialsRequest ids(List<String> ids) => call(ids: ids);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ReorderAdminTestimonialsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ReorderAdminTestimonialsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ReorderAdminTestimonialsRequest call({
    Object? ids = const $CopyWithPlaceholder(),
  }) {
    return ReorderAdminTestimonialsRequest(
      ids: ids == const $CopyWithPlaceholder() || ids == null
          ? _value.ids
          // ignore: cast_nullable_to_non_nullable
          : ids as List<String>,
    );
  }
}

extension $ReorderAdminTestimonialsRequestCopyWith
    on ReorderAdminTestimonialsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfReorderAdminTestimonialsRequest.copyWith(...)` or `instanceOfReorderAdminTestimonialsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReorderAdminTestimonialsRequestCWProxy get copyWith =>
      _$ReorderAdminTestimonialsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReorderAdminTestimonialsRequest _$ReorderAdminTestimonialsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReorderAdminTestimonialsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['ids']);
  final val = ReorderAdminTestimonialsRequest(
    ids: $checkedConvert(
      'ids',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ReorderAdminTestimonialsRequestToJson(
  ReorderAdminTestimonialsRequest instance,
) => <String, dynamic>{'ids': instance.ids};
