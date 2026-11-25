// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_live_online.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminLiveOnlineCWProxy {
  AdminLiveOnline windowSeconds(int windowSeconds);

  AdminLiveOnline onlineNow(int onlineNow);

  AdminLiveOnline inChat(int inChat);

  AdminLiveOnline teamOnline(int teamOnline);

  AdminLiveOnline byPlatform(List<AdminLivePlatform> byPlatform);

  AdminLiveOnline people(List<AdminLivePerson> people);

  AdminLiveOnline fetchedAt(DateTime fetchedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLiveOnline(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLiveOnline(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminLiveOnline call({
    int windowSeconds,
    int onlineNow,
    int inChat,
    int teamOnline,
    List<AdminLivePlatform> byPlatform,
    List<AdminLivePerson> people,
    DateTime fetchedAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminLiveOnline.copyWith(...)` or call `instanceOfAdminLiveOnline.copyWith.fieldName(value)` for a single field.
class _$AdminLiveOnlineCWProxyImpl implements _$AdminLiveOnlineCWProxy {
  const _$AdminLiveOnlineCWProxyImpl(this._value);

  final AdminLiveOnline _value;

  @override
  AdminLiveOnline windowSeconds(int windowSeconds) =>
      call(windowSeconds: windowSeconds);

  @override
  AdminLiveOnline onlineNow(int onlineNow) => call(onlineNow: onlineNow);

  @override
  AdminLiveOnline inChat(int inChat) => call(inChat: inChat);

  @override
  AdminLiveOnline teamOnline(int teamOnline) => call(teamOnline: teamOnline);

  @override
  AdminLiveOnline byPlatform(List<AdminLivePlatform> byPlatform) =>
      call(byPlatform: byPlatform);

  @override
  AdminLiveOnline people(List<AdminLivePerson> people) => call(people: people);

  @override
  AdminLiveOnline fetchedAt(DateTime fetchedAt) => call(fetchedAt: fetchedAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AdminLiveOnline(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminLiveOnline(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminLiveOnline call({
    Object? windowSeconds = const $CopyWithPlaceholder(),
    Object? onlineNow = const $CopyWithPlaceholder(),
    Object? inChat = const $CopyWithPlaceholder(),
    Object? teamOnline = const $CopyWithPlaceholder(),
    Object? byPlatform = const $CopyWithPlaceholder(),
    Object? people = const $CopyWithPlaceholder(),
    Object? fetchedAt = const $CopyWithPlaceholder(),
  }) {
    return AdminLiveOnline(
      windowSeconds:
          windowSeconds == const $CopyWithPlaceholder() || windowSeconds == null
          ? _value.windowSeconds
          // ignore: cast_nullable_to_non_nullable
          : windowSeconds as int,
      onlineNow: onlineNow == const $CopyWithPlaceholder() || onlineNow == null
          ? _value.onlineNow
          // ignore: cast_nullable_to_non_nullable
          : onlineNow as int,
      inChat: inChat == const $CopyWithPlaceholder() || inChat == null
          ? _value.inChat
          // ignore: cast_nullable_to_non_nullable
          : inChat as int,
      teamOnline:
          teamOnline == const $CopyWithPlaceholder() || teamOnline == null
          ? _value.teamOnline
          // ignore: cast_nullable_to_non_nullable
          : teamOnline as int,
      byPlatform:
          byPlatform == const $CopyWithPlaceholder() || byPlatform == null
          ? _value.byPlatform
          // ignore: cast_nullable_to_non_nullable
          : byPlatform as List<AdminLivePlatform>,
      people: people == const $CopyWithPlaceholder() || people == null
          ? _value.people
          // ignore: cast_nullable_to_non_nullable
          : people as List<AdminLivePerson>,
      fetchedAt: fetchedAt == const $CopyWithPlaceholder() || fetchedAt == null
          ? _value.fetchedAt
          // ignore: cast_nullable_to_non_nullable
          : fetchedAt as DateTime,
    );
  }
}

extension $AdminLiveOnlineCopyWith on AdminLiveOnline {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminLiveOnline.copyWith(...)` or `instanceOfAdminLiveOnline.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminLiveOnlineCWProxy get copyWith => _$AdminLiveOnlineCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLiveOnline _$AdminLiveOnlineFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminLiveOnline',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'window_seconds',
            'online_now',
            'in_chat',
            'team_online',
            'by_platform',
            'people',
            'fetched_at',
          ],
        );
        final val = AdminLiveOnline(
          windowSeconds: $checkedConvert(
            'window_seconds',
            (v) => (v as num).toInt(),
          ),
          onlineNow: $checkedConvert('online_now', (v) => (v as num).toInt()),
          inChat: $checkedConvert('in_chat', (v) => (v as num).toInt()),
          teamOnline: $checkedConvert('team_online', (v) => (v as num).toInt()),
          byPlatform: $checkedConvert(
            'by_platform',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => AdminLivePlatform.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          people: $checkedConvert(
            'people',
            (v) => (v as List<dynamic>)
                .map((e) => AdminLivePerson.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          fetchedAt: $checkedConvert(
            'fetched_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'windowSeconds': 'window_seconds',
        'onlineNow': 'online_now',
        'inChat': 'in_chat',
        'teamOnline': 'team_online',
        'byPlatform': 'by_platform',
        'fetchedAt': 'fetched_at',
      },
    );

Map<String, dynamic> _$AdminLiveOnlineToJson(AdminLiveOnline instance) =>
    <String, dynamic>{
      'window_seconds': instance.windowSeconds,
      'online_now': instance.onlineNow,
      'in_chat': instance.inChat,
      'team_online': instance.teamOnline,
      'by_platform': instance.byPlatform.map((e) => e.toJson()).toList(),
      'people': instance.people.map((e) => e.toJson()).toList(),
      'fetched_at': instance.fetchedAt.toIso8601String(),
    };
