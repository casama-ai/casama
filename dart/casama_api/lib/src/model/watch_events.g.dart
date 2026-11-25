// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_events.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WatchEventsCWProxy {
  WatchEvents events(List<WatchEventsEventsInner> events);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `WatchEvents(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WatchEvents(...).copyWith(id: 12, name: "My name")
  /// ```
  WatchEvents call({List<WatchEventsEventsInner> events});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWatchEvents.copyWith(...)` or call `instanceOfWatchEvents.copyWith.fieldName(value)` for a single field.
class _$WatchEventsCWProxyImpl implements _$WatchEventsCWProxy {
  const _$WatchEventsCWProxyImpl(this._value);

  final WatchEvents _value;

  @override
  WatchEvents events(List<WatchEventsEventsInner> events) =>
      call(events: events);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `WatchEvents(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WatchEvents(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  WatchEvents call({Object? events = const $CopyWithPlaceholder()}) {
    return WatchEvents(
      events: events == const $CopyWithPlaceholder() || events == null
          ? _value.events
          // ignore: cast_nullable_to_non_nullable
          : events as List<WatchEventsEventsInner>,
    );
  }
}

extension $WatchEventsCopyWith on WatchEvents {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWatchEvents.copyWith(...)` or `instanceOfWatchEvents.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WatchEventsCWProxy get copyWith => _$WatchEventsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchEvents _$WatchEventsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WatchEvents', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['events']);
      final val = WatchEvents(
        events: $checkedConvert(
          'events',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    WatchEventsEventsInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WatchEventsToJson(WatchEvents instance) =>
    <String, dynamic>{
      'events': instance.events.map((e) => e.toJson()).toList(),
    };
