// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfhost_stats.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelfhostStatsCWProxy {
  SelfhostStats dailyActive(List<SelfhostStatsDailyActiveInner> dailyActive);

  SelfhostStats newInstalls(List<SelfhostStatsDailyActiveInner> newInstalls);

  SelfhostStats active24h(int active24h);

  SelfhostStats byEdition(List<SelfhostStatsByEditionInner> byEdition);

  SelfhostStats byEngineVersion(
    List<SelfhostStatsByEngineVersionInner> byEngineVersion,
  );

  SelfhostStats lapsed(int lapsed);

  SelfhostStats members(int members);

  SelfhostStats bots(int bots);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStats(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStats(...).copyWith(id: 12, name: "My name")
  /// ```
  SelfhostStats call({
    List<SelfhostStatsDailyActiveInner> dailyActive,
    List<SelfhostStatsDailyActiveInner> newInstalls,
    int active24h,
    List<SelfhostStatsByEditionInner> byEdition,
    List<SelfhostStatsByEngineVersionInner> byEngineVersion,
    int lapsed,
    int members,
    int bots,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelfhostStats.copyWith(...)` or call `instanceOfSelfhostStats.copyWith.fieldName(value)` for a single field.
class _$SelfhostStatsCWProxyImpl implements _$SelfhostStatsCWProxy {
  const _$SelfhostStatsCWProxyImpl(this._value);

  final SelfhostStats _value;

  @override
  SelfhostStats dailyActive(List<SelfhostStatsDailyActiveInner> dailyActive) =>
      call(dailyActive: dailyActive);

  @override
  SelfhostStats newInstalls(List<SelfhostStatsDailyActiveInner> newInstalls) =>
      call(newInstalls: newInstalls);

  @override
  SelfhostStats active24h(int active24h) => call(active24h: active24h);

  @override
  SelfhostStats byEdition(List<SelfhostStatsByEditionInner> byEdition) =>
      call(byEdition: byEdition);

  @override
  SelfhostStats byEngineVersion(
    List<SelfhostStatsByEngineVersionInner> byEngineVersion,
  ) => call(byEngineVersion: byEngineVersion);

  @override
  SelfhostStats lapsed(int lapsed) => call(lapsed: lapsed);

  @override
  SelfhostStats members(int members) => call(members: members);

  @override
  SelfhostStats bots(int bots) => call(bots: bots);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `SelfhostStats(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelfhostStats(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SelfhostStats call({
    Object? dailyActive = const $CopyWithPlaceholder(),
    Object? newInstalls = const $CopyWithPlaceholder(),
    Object? active24h = const $CopyWithPlaceholder(),
    Object? byEdition = const $CopyWithPlaceholder(),
    Object? byEngineVersion = const $CopyWithPlaceholder(),
    Object? lapsed = const $CopyWithPlaceholder(),
    Object? members = const $CopyWithPlaceholder(),
    Object? bots = const $CopyWithPlaceholder(),
  }) {
    return SelfhostStats(
      dailyActive:
          dailyActive == const $CopyWithPlaceholder() || dailyActive == null
          ? _value.dailyActive
          // ignore: cast_nullable_to_non_nullable
          : dailyActive as List<SelfhostStatsDailyActiveInner>,
      newInstalls:
          newInstalls == const $CopyWithPlaceholder() || newInstalls == null
          ? _value.newInstalls
          // ignore: cast_nullable_to_non_nullable
          : newInstalls as List<SelfhostStatsDailyActiveInner>,
      active24h: active24h == const $CopyWithPlaceholder() || active24h == null
          ? _value.active24h
          // ignore: cast_nullable_to_non_nullable
          : active24h as int,
      byEdition: byEdition == const $CopyWithPlaceholder() || byEdition == null
          ? _value.byEdition
          // ignore: cast_nullable_to_non_nullable
          : byEdition as List<SelfhostStatsByEditionInner>,
      byEngineVersion:
          byEngineVersion == const $CopyWithPlaceholder() ||
              byEngineVersion == null
          ? _value.byEngineVersion
          // ignore: cast_nullable_to_non_nullable
          : byEngineVersion as List<SelfhostStatsByEngineVersionInner>,
      lapsed: lapsed == const $CopyWithPlaceholder() || lapsed == null
          ? _value.lapsed
          // ignore: cast_nullable_to_non_nullable
          : lapsed as int,
      members: members == const $CopyWithPlaceholder() || members == null
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as int,
      bots: bots == const $CopyWithPlaceholder() || bots == null
          ? _value.bots
          // ignore: cast_nullable_to_non_nullable
          : bots as int,
    );
  }
}

extension $SelfhostStatsCopyWith on SelfhostStats {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelfhostStats.copyWith(...)` or `instanceOfSelfhostStats.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelfhostStatsCWProxy get copyWith => _$SelfhostStatsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfhostStats _$SelfhostStatsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SelfhostStats',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'daily_active',
            'new_installs',
            'active_24h',
            'by_edition',
            'by_engine_version',
            'lapsed',
            'members',
            'bots',
          ],
        );
        final val = SelfhostStats(
          dailyActive: $checkedConvert(
            'daily_active',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => SelfhostStatsDailyActiveInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
          newInstalls: $checkedConvert(
            'new_installs',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => SelfhostStatsDailyActiveInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
          active24h: $checkedConvert('active_24h', (v) => (v as num).toInt()),
          byEdition: $checkedConvert(
            'by_edition',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => SelfhostStatsByEditionInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
          byEngineVersion: $checkedConvert(
            'by_engine_version',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => SelfhostStatsByEngineVersionInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
          lapsed: $checkedConvert('lapsed', (v) => (v as num).toInt()),
          members: $checkedConvert('members', (v) => (v as num).toInt()),
          bots: $checkedConvert('bots', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'dailyActive': 'daily_active',
        'newInstalls': 'new_installs',
        'active24h': 'active_24h',
        'byEdition': 'by_edition',
        'byEngineVersion': 'by_engine_version',
      },
    );

Map<String, dynamic> _$SelfhostStatsToJson(
  SelfhostStats instance,
) => <String, dynamic>{
  'daily_active': instance.dailyActive.map((e) => e.toJson()).toList(),
  'new_installs': instance.newInstalls.map((e) => e.toJson()).toList(),
  'active_24h': instance.active24h,
  'by_edition': instance.byEdition.map((e) => e.toJson()).toList(),
  'by_engine_version': instance.byEngineVersion.map((e) => e.toJson()).toList(),
  'lapsed': instance.lapsed,
  'members': instance.members,
  'bots': instance.bots,
};
