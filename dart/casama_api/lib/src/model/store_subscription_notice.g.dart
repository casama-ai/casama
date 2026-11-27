// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_subscription_notice.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StoreSubscriptionNoticeCWProxy {
  StoreSubscriptionNotice source_(StoreSubscriptionNoticeSource_Enum source_);

  StoreSubscriptionNotice planName(String planName);

  StoreSubscriptionNotice manageUrl(String manageUrl);

  StoreSubscriptionNotice notice(String notice);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `StoreSubscriptionNotice(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// StoreSubscriptionNotice(...).copyWith(id: 12, name: "My name")
  /// ```
  StoreSubscriptionNotice call({
    StoreSubscriptionNoticeSource_Enum source_,
    String planName,
    String manageUrl,
    String notice,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfStoreSubscriptionNotice.copyWith(...)` or call `instanceOfStoreSubscriptionNotice.copyWith.fieldName(value)` for a single field.
class _$StoreSubscriptionNoticeCWProxyImpl
    implements _$StoreSubscriptionNoticeCWProxy {
  const _$StoreSubscriptionNoticeCWProxyImpl(this._value);

  final StoreSubscriptionNotice _value;

  @override
  StoreSubscriptionNotice source_(StoreSubscriptionNoticeSource_Enum source_) =>
      call(source_: source_);

  @override
  StoreSubscriptionNotice planName(String planName) => call(planName: planName);

  @override
  StoreSubscriptionNotice manageUrl(String manageUrl) =>
      call(manageUrl: manageUrl);

  @override
  StoreSubscriptionNotice notice(String notice) => call(notice: notice);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `StoreSubscriptionNotice(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// StoreSubscriptionNotice(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  StoreSubscriptionNotice call({
    Object? source_ = const $CopyWithPlaceholder(),
    Object? planName = const $CopyWithPlaceholder(),
    Object? manageUrl = const $CopyWithPlaceholder(),
    Object? notice = const $CopyWithPlaceholder(),
  }) {
    return StoreSubscriptionNotice(
      source_: source_ == const $CopyWithPlaceholder() || source_ == null
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as StoreSubscriptionNoticeSource_Enum,
      planName: planName == const $CopyWithPlaceholder() || planName == null
          ? _value.planName
          // ignore: cast_nullable_to_non_nullable
          : planName as String,
      manageUrl: manageUrl == const $CopyWithPlaceholder() || manageUrl == null
          ? _value.manageUrl
          // ignore: cast_nullable_to_non_nullable
          : manageUrl as String,
      notice: notice == const $CopyWithPlaceholder() || notice == null
          ? _value.notice
          // ignore: cast_nullable_to_non_nullable
          : notice as String,
    );
  }
}

extension $StoreSubscriptionNoticeCopyWith on StoreSubscriptionNotice {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfStoreSubscriptionNotice.copyWith(...)` or `instanceOfStoreSubscriptionNotice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StoreSubscriptionNoticeCWProxy get copyWith =>
      _$StoreSubscriptionNoticeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreSubscriptionNotice _$StoreSubscriptionNoticeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StoreSubscriptionNotice',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['source', 'plan_name', 'manage_url', 'notice'],
    );
    final val = StoreSubscriptionNotice(
      source_: $checkedConvert(
        'source',
        (v) => $enumDecode(_$StoreSubscriptionNoticeSource_EnumEnumMap, v),
      ),
      planName: $checkedConvert('plan_name', (v) => v as String),
      manageUrl: $checkedConvert('manage_url', (v) => v as String),
      notice: $checkedConvert('notice', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'source_': 'source',
    'planName': 'plan_name',
    'manageUrl': 'manage_url',
  },
);

Map<String, dynamic> _$StoreSubscriptionNoticeToJson(
  StoreSubscriptionNotice instance,
) => <String, dynamic>{
  'source': _$StoreSubscriptionNoticeSource_EnumEnumMap[instance.source_]!,
  'plan_name': instance.planName,
  'manage_url': instance.manageUrl,
  'notice': instance.notice,
};

const _$StoreSubscriptionNoticeSource_EnumEnumMap = {
  StoreSubscriptionNoticeSource_Enum.appStore: 'app_store',
  StoreSubscriptionNoticeSource_Enum.googlePlay: 'google_play',
};
