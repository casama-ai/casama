// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_live_ga4.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminLiveGa4CWProxy {
  AdminLiveGa4 configured(bool configured);

  AdminLiveGa4 error(String? error);

  AdminLiveGa4 activeUsers(int activeUsers);

  AdminLiveGa4 activeUsers5m(int activeUsers5m);

  AdminLiveGa4 byPlatform(List<AdminLivePlatform> byPlatform);

  AdminLiveGa4 byCountry(List<AdminLiveCountry> byCountry);

  AdminLiveGa4 byMinute(List<int> byMinute);

  AdminLiveGa4 fetchedAt(DateTime fetchedAt);

  AdminLiveGa4 cached(bool cached);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLiveGa4(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLiveGa4(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminLiveGa4 call({
    bool configured,
    String? error,
    int activeUsers,
    int activeUsers5m,
    List<AdminLivePlatform> byPlatform,
    List<AdminLiveCountry> byCountry,
    List<int> byMinute,
    DateTime fetchedAt,
    bool cached,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminLiveGa4.copyWith(...)` or call `instanceOfAdminLiveGa4.copyWith.fieldName(value)` for a single field.
class _$AdminLiveGa4CWProxyImpl implements _$AdminLiveGa4CWProxy {
  const _$AdminLiveGa4CWProxyImpl(this._value);

  final AdminLiveGa4 _value;

  @override
  AdminLiveGa4 configured(bool configured) => call(configured: configured);

  @override
  AdminLiveGa4 error(String? error) => call(error: error);

  @override
  AdminLiveGa4 activeUsers(int activeUsers) => call(activeUsers: activeUsers);

  @override
  AdminLiveGa4 activeUsers5m(int activeUsers5m) =>
      call(activeUsers5m: activeUsers5m);

  @override
  AdminLiveGa4 byPlatform(List<AdminLivePlatform> byPlatform) =>
      call(byPlatform: byPlatform);

  @override
  AdminLiveGa4 byCountry(List<AdminLiveCountry> byCountry) =>
      call(byCountry: byCountry);

  @override
  AdminLiveGa4 byMinute(List<int> byMinute) => call(byMinute: byMinute);

  @override
  AdminLiveGa4 fetchedAt(DateTime fetchedAt) => call(fetchedAt: fetchedAt);

  @override
  AdminLiveGa4 cached(bool cached) => call(cached: cached);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLiveGa4(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLiveGa4(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminLiveGa4 call({
    Object? configured = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? activeUsers = const $CopyWithPlaceholder(),
    Object? activeUsers5m = const $CopyWithPlaceholder(),
    Object? byPlatform = const $CopyWithPlaceholder(),
    Object? byCountry = const $CopyWithPlaceholder(),
    Object? byMinute = const $CopyWithPlaceholder(),
    Object? fetchedAt = const $CopyWithPlaceholder(),
    Object? cached = const $CopyWithPlaceholder(),
  }) {
    return AdminLiveGa4(
      configured:
          configured == const $CopyWithPlaceholder() || configured == null
          ? _value.configured
          // ignore: cast_nullable_to_non_nullable
          : configured as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
      activeUsers:
          activeUsers == const $CopyWithPlaceholder() || activeUsers == null
          ? _value.activeUsers
          // ignore: cast_nullable_to_non_nullable
          : activeUsers as int,
      activeUsers5m:
          activeUsers5m == const $CopyWithPlaceholder() || activeUsers5m == null
          ? _value.activeUsers5m
          // ignore: cast_nullable_to_non_nullable
          : activeUsers5m as int,
      byPlatform:
          byPlatform == const $CopyWithPlaceholder() || byPlatform == null
          ? _value.byPlatform
          // ignore: cast_nullable_to_non_nullable
          : byPlatform as List<AdminLivePlatform>,
      byCountry: byCountry == const $CopyWithPlaceholder() || byCountry == null
          ? _value.byCountry
          // ignore: cast_nullable_to_non_nullable
          : byCountry as List<AdminLiveCountry>,
      byMinute: byMinute == const $CopyWithPlaceholder() || byMinute == null
          ? _value.byMinute
          // ignore: cast_nullable_to_non_nullable
          : byMinute as List<int>,
      fetchedAt: fetchedAt == const $CopyWithPlaceholder() || fetchedAt == null
          ? _value.fetchedAt
          // ignore: cast_nullable_to_non_nullable
          : fetchedAt as DateTime,
      cached: cached == const $CopyWithPlaceholder() || cached == null
          ? _value.cached
          // ignore: cast_nullable_to_non_nullable
          : cached as bool,
    );
  }
}

extension $AdminLiveGa4CopyWith on AdminLiveGa4 {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminLiveGa4.copyWith(...)` or `instanceOfAdminLiveGa4.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminLiveGa4CWProxy get copyWith => _$AdminLiveGa4CWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLiveGa4 _$AdminLiveGa4FromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AdminLiveGa4',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'configured',
        'error',
        'active_users',
        'active_users_5m',
        'by_platform',
        'by_country',
        'by_minute',
        'fetched_at',
        'cached',
      ],
    );
    final val = AdminLiveGa4(
      configured: $checkedConvert('configured', (v) => v as bool),
      error: $checkedConvert('error', (v) => v as String?),
      activeUsers: $checkedConvert('active_users', (v) => (v as num).toInt()),
      activeUsers5m: $checkedConvert(
        'active_users_5m',
        (v) => (v as num).toInt(),
      ),
      byPlatform: $checkedConvert(
        'by_platform',
        (v) => (v as List<dynamic>)
            .map((e) => AdminLivePlatform.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      byCountry: $checkedConvert(
        'by_country',
        (v) => (v as List<dynamic>)
            .map((e) => AdminLiveCountry.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      byMinute: $checkedConvert(
        'by_minute',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      fetchedAt: $checkedConvert(
        'fetched_at',
        (v) => DateTime.parse(v as String),
      ),
      cached: $checkedConvert('cached', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'activeUsers': 'active_users',
    'activeUsers5m': 'active_users_5m',
    'byPlatform': 'by_platform',
    'byCountry': 'by_country',
    'byMinute': 'by_minute',
    'fetchedAt': 'fetched_at',
  },
);

Map<String, dynamic> _$AdminLiveGa4ToJson(AdminLiveGa4 instance) =>
    <String, dynamic>{
      'configured': instance.configured,
      'error': instance.error,
      'active_users': instance.activeUsers,
      'active_users_5m': instance.activeUsers5m,
      'by_platform': instance.byPlatform.map((e) => e.toJson()).toList(),
      'by_country': instance.byCountry.map((e) => e.toJson()).toList(),
      'by_minute': instance.byMinute,
      'fetched_at': instance.fetchedAt.toIso8601String(),
      'cached': instance.cached,
    };
