// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_admin_discount_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateAdminDiscountRequestCWProxy {
  UpdateAdminDiscountRequest maxUses(int? maxUses);

  UpdateAdminDiscountRequest perPerson(int? perPerson);

  UpdateAdminDiscountRequest endsAt(DateTime? endsAt);

  UpdateAdminDiscountRequest plans(List<String>? plans);

  UpdateAdminDiscountRequest note(String? note);

  UpdateAdminDiscountRequest channel(String? channel);

  UpdateAdminDiscountRequest off(bool? off);

  UpdateAdminDiscountRequest confirmLarge(bool? confirmLarge);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminDiscountRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminDiscountRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateAdminDiscountRequest call({
    int? maxUses,
    int? perPerson,
    DateTime? endsAt,
    List<String>? plans,
    String? note,
    String? channel,
    bool? off,
    bool? confirmLarge,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateAdminDiscountRequest.copyWith(...)` or call `instanceOfUpdateAdminDiscountRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateAdminDiscountRequestCWProxyImpl
    implements _$UpdateAdminDiscountRequestCWProxy {
  const _$UpdateAdminDiscountRequestCWProxyImpl(this._value);

  final UpdateAdminDiscountRequest _value;

  @override
  UpdateAdminDiscountRequest maxUses(int? maxUses) => call(maxUses: maxUses);

  @override
  UpdateAdminDiscountRequest perPerson(int? perPerson) =>
      call(perPerson: perPerson);

  @override
  UpdateAdminDiscountRequest endsAt(DateTime? endsAt) => call(endsAt: endsAt);

  @override
  UpdateAdminDiscountRequest plans(List<String>? plans) => call(plans: plans);

  @override
  UpdateAdminDiscountRequest note(String? note) => call(note: note);

  @override
  UpdateAdminDiscountRequest channel(String? channel) => call(channel: channel);

  @override
  UpdateAdminDiscountRequest off(bool? off) => call(off: off);

  @override
  UpdateAdminDiscountRequest confirmLarge(bool? confirmLarge) =>
      call(confirmLarge: confirmLarge);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminDiscountRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminDiscountRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateAdminDiscountRequest call({
    Object? maxUses = const $CopyWithPlaceholder(),
    Object? perPerson = const $CopyWithPlaceholder(),
    Object? endsAt = const $CopyWithPlaceholder(),
    Object? plans = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? off = const $CopyWithPlaceholder(),
    Object? confirmLarge = const $CopyWithPlaceholder(),
  }) {
    return UpdateAdminDiscountRequest(
      maxUses: maxUses == const $CopyWithPlaceholder()
          ? _value.maxUses
          // ignore: cast_nullable_to_non_nullable
          : maxUses as int?,
      perPerson: perPerson == const $CopyWithPlaceholder()
          ? _value.perPerson
          // ignore: cast_nullable_to_non_nullable
          : perPerson as int?,
      endsAt: endsAt == const $CopyWithPlaceholder()
          ? _value.endsAt
          // ignore: cast_nullable_to_non_nullable
          : endsAt as DateTime?,
      plans: plans == const $CopyWithPlaceholder()
          ? _value.plans
          // ignore: cast_nullable_to_non_nullable
          : plans as List<String>?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as String?,
      off: off == const $CopyWithPlaceholder()
          ? _value.off
          // ignore: cast_nullable_to_non_nullable
          : off as bool?,
      confirmLarge: confirmLarge == const $CopyWithPlaceholder()
          ? _value.confirmLarge
          // ignore: cast_nullable_to_non_nullable
          : confirmLarge as bool?,
    );
  }
}

extension $UpdateAdminDiscountRequestCopyWith on UpdateAdminDiscountRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateAdminDiscountRequest.copyWith(...)` or `instanceOfUpdateAdminDiscountRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateAdminDiscountRequestCWProxy get copyWith =>
      _$UpdateAdminDiscountRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAdminDiscountRequest _$UpdateAdminDiscountRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateAdminDiscountRequest',
  json,
  ($checkedConvert) {
    final val = UpdateAdminDiscountRequest(
      maxUses: $checkedConvert('max_uses', (v) => (v as num?)?.toInt()),
      perPerson: $checkedConvert('per_person', (v) => (v as num?)?.toInt()),
      endsAt: $checkedConvert(
        'ends_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      plans: $checkedConvert(
        'plans',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      note: $checkedConvert('note', (v) => v as String?),
      channel: $checkedConvert('channel', (v) => v as String?),
      off: $checkedConvert('off', (v) => v as bool?),
      confirmLarge: $checkedConvert(
        'confirm_large',
        (v) => v as bool? ?? false,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxUses': 'max_uses',
    'perPerson': 'per_person',
    'endsAt': 'ends_at',
    'confirmLarge': 'confirm_large',
  },
);

Map<String, dynamic> _$UpdateAdminDiscountRequestToJson(
  UpdateAdminDiscountRequest instance,
) => <String, dynamic>{
  'max_uses': ?instance.maxUses,
  'per_person': ?instance.perPerson,
  'ends_at': ?instance.endsAt?.toIso8601String(),
  'plans': ?instance.plans,
  'note': ?instance.note,
  'channel': ?instance.channel,
  'off': ?instance.off,
  'confirm_large': ?instance.confirmLarge,
};
