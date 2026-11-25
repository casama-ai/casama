// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_row.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FeedbackRowCWProxy {
  FeedbackRow id(String id);

  FeedbackRow kind(FeedbackKind kind);

  FeedbackRow message(String message);

  FeedbackRow contactOk(bool contactOk);

  FeedbackRow status(FeedbackStatus status);

  FeedbackRow userEmail(String? userEmail);

  FeedbackRow orgId(String? orgId);

  FeedbackRow orgName(String? orgName);

  FeedbackRow appVersion(String? appVersion);

  FeedbackRow platform(String? platform);

  FeedbackRow plan(String? plan);

  FeedbackRow ideasPostUrl(String? ideasPostUrl);

  FeedbackRow createdAt(DateTime createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackRow(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackRow(...).copyWith(id: 12, name: "My name")
  /// ```
  FeedbackRow call({
    String id,
    FeedbackKind kind,
    String message,
    bool contactOk,
    FeedbackStatus status,
    String? userEmail,
    String? orgId,
    String? orgName,
    String? appVersion,
    String? platform,
    String? plan,
    String? ideasPostUrl,
    DateTime createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFeedbackRow.copyWith(...)` or call `instanceOfFeedbackRow.copyWith.fieldName(value)` for a single field.
class _$FeedbackRowCWProxyImpl implements _$FeedbackRowCWProxy {
  const _$FeedbackRowCWProxyImpl(this._value);

  final FeedbackRow _value;

  @override
  FeedbackRow id(String id) => call(id: id);

  @override
  FeedbackRow kind(FeedbackKind kind) => call(kind: kind);

  @override
  FeedbackRow message(String message) => call(message: message);

  @override
  FeedbackRow contactOk(bool contactOk) => call(contactOk: contactOk);

  @override
  FeedbackRow status(FeedbackStatus status) => call(status: status);

  @override
  FeedbackRow userEmail(String? userEmail) => call(userEmail: userEmail);

  @override
  FeedbackRow orgId(String? orgId) => call(orgId: orgId);

  @override
  FeedbackRow orgName(String? orgName) => call(orgName: orgName);

  @override
  FeedbackRow appVersion(String? appVersion) => call(appVersion: appVersion);

  @override
  FeedbackRow platform(String? platform) => call(platform: platform);

  @override
  FeedbackRow plan(String? plan) => call(plan: plan);

  @override
  FeedbackRow ideasPostUrl(String? ideasPostUrl) =>
      call(ideasPostUrl: ideasPostUrl);

  @override
  FeedbackRow createdAt(DateTime createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackRow(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackRow(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FeedbackRow call({
    Object? id = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? contactOk = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? userEmail = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? orgName = const $CopyWithPlaceholder(),
    Object? appVersion = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? plan = const $CopyWithPlaceholder(),
    Object? ideasPostUrl = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return FeedbackRow(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as FeedbackKind,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      contactOk: contactOk == const $CopyWithPlaceholder() || contactOk == null
          ? _value.contactOk
          // ignore: cast_nullable_to_non_nullable
          : contactOk as bool,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as FeedbackStatus,
      userEmail: userEmail == const $CopyWithPlaceholder()
          ? _value.userEmail
          // ignore: cast_nullable_to_non_nullable
          : userEmail as String?,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String?,
      orgName: orgName == const $CopyWithPlaceholder()
          ? _value.orgName
          // ignore: cast_nullable_to_non_nullable
          : orgName as String?,
      appVersion: appVersion == const $CopyWithPlaceholder()
          ? _value.appVersion
          // ignore: cast_nullable_to_non_nullable
          : appVersion as String?,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
      plan: plan == const $CopyWithPlaceholder()
          ? _value.plan
          // ignore: cast_nullable_to_non_nullable
          : plan as String?,
      ideasPostUrl: ideasPostUrl == const $CopyWithPlaceholder()
          ? _value.ideasPostUrl
          // ignore: cast_nullable_to_non_nullable
          : ideasPostUrl as String?,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $FeedbackRowCopyWith on FeedbackRow {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFeedbackRow.copyWith(...)` or `instanceOfFeedbackRow.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FeedbackRowCWProxy get copyWith => _$FeedbackRowCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackRow _$FeedbackRowFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FeedbackRow',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'kind',
        'message',
        'contact_ok',
        'status',
        'user_email',
        'org_id',
        'org_name',
        'app_version',
        'platform',
        'plan',
        'ideas_post_url',
        'created_at',
      ],
    );
    final val = FeedbackRow(
      id: $checkedConvert('id', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(_$FeedbackKindEnumMap, v),
      ),
      message: $checkedConvert('message', (v) => v as String),
      contactOk: $checkedConvert('contact_ok', (v) => v as bool),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$FeedbackStatusEnumMap, v),
      ),
      userEmail: $checkedConvert('user_email', (v) => v as String?),
      orgId: $checkedConvert('org_id', (v) => v as String?),
      orgName: $checkedConvert('org_name', (v) => v as String?),
      appVersion: $checkedConvert('app_version', (v) => v as String?),
      platform: $checkedConvert('platform', (v) => v as String?),
      plan: $checkedConvert('plan', (v) => v as String?),
      ideasPostUrl: $checkedConvert('ideas_post_url', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'contactOk': 'contact_ok',
    'userEmail': 'user_email',
    'orgId': 'org_id',
    'orgName': 'org_name',
    'appVersion': 'app_version',
    'ideasPostUrl': 'ideas_post_url',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$FeedbackRowToJson(FeedbackRow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$FeedbackKindEnumMap[instance.kind]!,
      'message': instance.message,
      'contact_ok': instance.contactOk,
      'status': _$FeedbackStatusEnumMap[instance.status]!,
      'user_email': instance.userEmail,
      'org_id': instance.orgId,
      'org_name': instance.orgName,
      'app_version': instance.appVersion,
      'platform': instance.platform,
      'plan': instance.plan,
      'ideas_post_url': instance.ideasPostUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$FeedbackKindEnumMap = {
  FeedbackKind.idea: 'idea',
  FeedbackKind.like: 'like',
  FeedbackKind.dislike: 'dislike',
  FeedbackKind.confusing: 'confusing',
};

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.new_: 'new',
  FeedbackStatus.read: 'read',
  FeedbackStatus.done: 'done',
};
