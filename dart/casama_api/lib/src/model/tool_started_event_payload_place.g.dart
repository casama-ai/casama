// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_started_event_payload_place.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ToolStartedEventPayloadPlaceCWProxy {
  ToolStartedEventPayloadPlace computerId(String computerId);

  ToolStartedEventPayloadPlace kind(String kind);

  ToolStartedEventPayloadPlace name(String name);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ToolStartedEventPayloadPlace(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ToolStartedEventPayloadPlace(...).copyWith(id: 12, name: "My name")
  /// ```
  ToolStartedEventPayloadPlace call({
    String computerId,
    String kind,
    String name,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfToolStartedEventPayloadPlace.copyWith(...)` or call `instanceOfToolStartedEventPayloadPlace.copyWith.fieldName(value)` for a single field.
class _$ToolStartedEventPayloadPlaceCWProxyImpl
    implements _$ToolStartedEventPayloadPlaceCWProxy {
  const _$ToolStartedEventPayloadPlaceCWProxyImpl(this._value);

  final ToolStartedEventPayloadPlace _value;

  @override
  ToolStartedEventPayloadPlace computerId(String computerId) =>
      call(computerId: computerId);

  @override
  ToolStartedEventPayloadPlace kind(String kind) => call(kind: kind);

  @override
  ToolStartedEventPayloadPlace name(String name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ToolStartedEventPayloadPlace(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ToolStartedEventPayloadPlace(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ToolStartedEventPayloadPlace call({
    Object? computerId = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ToolStartedEventPayloadPlace(
      computerId:
          computerId == const $CopyWithPlaceholder() || computerId == null
          ? _value.computerId
          // ignore: cast_nullable_to_non_nullable
          : computerId as String,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $ToolStartedEventPayloadPlaceCopyWith
    on ToolStartedEventPayloadPlace {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfToolStartedEventPayloadPlace.copyWith(...)` or `instanceOfToolStartedEventPayloadPlace.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ToolStartedEventPayloadPlaceCWProxy get copyWith =>
      _$ToolStartedEventPayloadPlaceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolStartedEventPayloadPlace _$ToolStartedEventPayloadPlaceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ToolStartedEventPayloadPlace', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['computer_id', 'kind', 'name']);
  final val = ToolStartedEventPayloadPlace(
    computerId: $checkedConvert('computer_id', (v) => v as String),
    kind: $checkedConvert('kind', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'computerId': 'computer_id'});

Map<String, dynamic> _$ToolStartedEventPayloadPlaceToJson(
  ToolStartedEventPayloadPlace instance,
) => <String, dynamic>{
  'computer_id': instance.computerId,
  'kind': instance.kind,
  'name': instance.name,
};
