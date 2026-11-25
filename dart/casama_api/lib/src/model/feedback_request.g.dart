// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FeedbackRequestCWProxy {
  FeedbackRequest orgId(String? orgId);

  FeedbackRequest kind(FeedbackKind kind);

  FeedbackRequest message(String message);

  FeedbackRequest contactOk(bool? contactOk);

  FeedbackRequest appVersion(String? appVersion);

  FeedbackRequest platform(String? platform);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  FeedbackRequest call({
    String? orgId,
    FeedbackKind kind,
    String message,
    bool? contactOk,
    String? appVersion,
    String? platform,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFeedbackRequest.copyWith(...)` or call `instanceOfFeedbackRequest.copyWith.fieldName(value)` for a single field.
class _$FeedbackRequestCWProxyImpl implements _$FeedbackRequestCWProxy {
  const _$FeedbackRequestCWProxyImpl(this._value);

  final FeedbackRequest _value;

  @override
  FeedbackRequest orgId(String? orgId) => call(orgId: orgId);

  @override
  FeedbackRequest kind(FeedbackKind kind) => call(kind: kind);

  @override
  FeedbackRequest message(String message) => call(message: message);

  @override
  FeedbackRequest contactOk(bool? contactOk) => call(contactOk: contactOk);

  @override
  FeedbackRequest appVersion(String? appVersion) =>
      call(appVersion: appVersion);

  @override
  FeedbackRequest platform(String? platform) => call(platform: platform);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `FeedbackRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FeedbackRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FeedbackRequest call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? contactOk = const $CopyWithPlaceholder(),
    Object? appVersion = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
  }) {
    return FeedbackRequest(
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String?,
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as FeedbackKind,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      contactOk: contactOk == const $CopyWithPlaceholder()
          ? _value.contactOk
          // ignore: cast_nullable_to_non_nullable
          : contactOk as bool?,
      appVersion: appVersion == const $CopyWithPlaceholder()
          ? _value.appVersion
          // ignore: cast_nullable_to_non_nullable
          : appVersion as String?,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as String?,
    );
  }
}

extension $FeedbackRequestCopyWith on FeedbackRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFeedbackRequest.copyWith(...)` or `instanceOfFeedbackRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FeedbackRequestCWProxy get copyWith => _$FeedbackRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackRequest _$FeedbackRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FeedbackRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['kind', 'message']);
        final val = FeedbackRequest(
          orgId: $checkedConvert('org_id', (v) => v as String?),
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecode(_$FeedbackKindEnumMap, v),
          ),
          message: $checkedConvert('message', (v) => v as String),
          contactOk: $checkedConvert('contact_ok', (v) => v as bool? ?? true),
          appVersion: $checkedConvert('app_version', (v) => v as String?),
          platform: $checkedConvert('platform', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'orgId': 'org_id',
        'contactOk': 'contact_ok',
        'appVersion': 'app_version',
      },
    );

Map<String, dynamic> _$FeedbackRequestToJson(FeedbackRequest instance) =>
    <String, dynamic>{
      'org_id': ?instance.orgId,
      'kind': _$FeedbackKindEnumMap[instance.kind]!,
      'message': instance.message,
      'contact_ok': ?instance.contactOk,
      'app_version': ?instance.appVersion,
      'platform': ?instance.platform,
    };

const _$FeedbackKindEnumMap = {
  FeedbackKind.idea: 'idea',
  FeedbackKind.like: 'like',
  FeedbackKind.dislike: 'dislike',
  FeedbackKind.confusing: 'confusing',
};
