// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_events_events_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WatchEventsEventsInnerCWProxy {
  WatchEventsEventsInner screen(WatchEventsEventsInnerScreenEnum screen);

  WatchEventsEventsInner surface(WatchEventsEventsInnerSurfaceEnum? surface);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `WatchEventsEventsInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WatchEventsEventsInner(...).copyWith(id: 12, name: "My name")
  /// ```
  WatchEventsEventsInner call({
    WatchEventsEventsInnerScreenEnum screen,
    WatchEventsEventsInnerSurfaceEnum? surface,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWatchEventsEventsInner.copyWith(...)` or call `instanceOfWatchEventsEventsInner.copyWith.fieldName(value)` for a single field.
class _$WatchEventsEventsInnerCWProxyImpl
    implements _$WatchEventsEventsInnerCWProxy {
  const _$WatchEventsEventsInnerCWProxyImpl(this._value);

  final WatchEventsEventsInner _value;

  @override
  WatchEventsEventsInner screen(WatchEventsEventsInnerScreenEnum screen) =>
      call(screen: screen);

  @override
  WatchEventsEventsInner surface(WatchEventsEventsInnerSurfaceEnum? surface) =>
      call(surface: surface);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `WatchEventsEventsInner(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WatchEventsEventsInner(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  WatchEventsEventsInner call({
    Object? screen = const $CopyWithPlaceholder(),
    Object? surface = const $CopyWithPlaceholder(),
  }) {
    return WatchEventsEventsInner(
      screen: screen == const $CopyWithPlaceholder() || screen == null
          ? _value.screen
          // ignore: cast_nullable_to_non_nullable
          : screen as WatchEventsEventsInnerScreenEnum,
      surface: surface == const $CopyWithPlaceholder()
          ? _value.surface
          // ignore: cast_nullable_to_non_nullable
          : surface as WatchEventsEventsInnerSurfaceEnum?,
    );
  }
}

extension $WatchEventsEventsInnerCopyWith on WatchEventsEventsInner {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWatchEventsEventsInner.copyWith(...)` or `instanceOfWatchEventsEventsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WatchEventsEventsInnerCWProxy get copyWith =>
      _$WatchEventsEventsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchEventsEventsInner _$WatchEventsEventsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WatchEventsEventsInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['screen']);
  final val = WatchEventsEventsInner(
    screen: $checkedConvert(
      'screen',
      (v) => $enumDecode(_$WatchEventsEventsInnerScreenEnumEnumMap, v),
    ),
    surface: $checkedConvert(
      'surface',
      (v) => $enumDecodeNullable(_$WatchEventsEventsInnerSurfaceEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$WatchEventsEventsInnerToJson(
  WatchEventsEventsInner instance,
) => <String, dynamic>{
  'screen': _$WatchEventsEventsInnerScreenEnumEnumMap[instance.screen]!,
  'surface': ?_$WatchEventsEventsInnerSurfaceEnumEnumMap[instance.surface],
};

const _$WatchEventsEventsInnerScreenEnumEnumMap = {
  WatchEventsEventsInnerScreenEnum.now: 'now',
  WatchEventsEventsInnerScreenEnum.needs: 'needs',
  WatchEventsEventsInnerScreenEnum.request: 'request',
  WatchEventsEventsInnerScreenEnum.suggestion: 'suggestion',
  WatchEventsEventsInnerScreenEnum.elsewhere: 'elsewhere',
  WatchEventsEventsInnerScreenEnum.ask: 'ask',
  WatchEventsEventsInnerScreenEnum.run: 'run',
  WatchEventsEventsInnerScreenEnum.chat: 'chat',
  WatchEventsEventsInnerScreenEnum.bots: 'bots',
  WatchEventsEventsInnerScreenEnum.upNext: 'up_next',
  WatchEventsEventsInnerScreenEnum.brief: 'brief',
  WatchEventsEventsInnerScreenEnum.talk: 'talk',
  WatchEventsEventsInnerScreenEnum.settings: 'settings',
};

const _$WatchEventsEventsInnerSurfaceEnumEnumMap = {
  WatchEventsEventsInnerSurfaceEnum.app: 'app',
  WatchEventsEventsInnerSurfaceEnum.notification: 'notification',
  WatchEventsEventsInnerSurfaceEnum.complication: 'complication',
  WatchEventsEventsInnerSurfaceEnum.smartStack: 'smart_stack',
  WatchEventsEventsInnerSurfaceEnum.tile: 'tile',
  WatchEventsEventsInnerSurfaceEnum.control: 'control',
  WatchEventsEventsInnerSurfaceEnum.siri: 'siri',
};
