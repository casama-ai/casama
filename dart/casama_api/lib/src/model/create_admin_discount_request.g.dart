// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_admin_discount_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateAdminDiscountRequestCWProxy {
  CreateAdminDiscountRequest code(String code);

  CreateAdminDiscountRequest percent(num percent);

  CreateAdminDiscountRequest plans(List<String> plans);

  CreateAdminDiscountRequest cycles(int? cycles);

  CreateAdminDiscountRequest maxUses(int? maxUses);

  CreateAdminDiscountRequest perPerson(int? perPerson);

  CreateAdminDiscountRequest startsAt(DateTime? startsAt);

  CreateAdminDiscountRequest endsAt(DateTime? endsAt);

  CreateAdminDiscountRequest who(CreateAdminDiscountRequestWhoEnum? who);

  CreateAdminDiscountRequest note(String? note);

  CreateAdminDiscountRequest channel(String? channel);

  CreateAdminDiscountRequest confirmLarge(bool? confirmLarge);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminDiscountRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminDiscountRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateAdminDiscountRequest call({
    String code,
    num percent,
    List<String> plans,
    int? cycles,
    int? maxUses,
    int? perPerson,
    DateTime? startsAt,
    DateTime? endsAt,
    CreateAdminDiscountRequestWhoEnum? who,
    String? note,
    String? channel,
    bool? confirmLarge,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateAdminDiscountRequest.copyWith(...)` or call `instanceOfCreateAdminDiscountRequest.copyWith.fieldName(value)` for a single field.
class _$CreateAdminDiscountRequestCWProxyImpl
    implements _$CreateAdminDiscountRequestCWProxy {
  const _$CreateAdminDiscountRequestCWProxyImpl(this._value);

  final CreateAdminDiscountRequest _value;

  @override
  CreateAdminDiscountRequest code(String code) => call(code: code);

  @override
  CreateAdminDiscountRequest percent(num percent) => call(percent: percent);

  @override
  CreateAdminDiscountRequest plans(List<String> plans) => call(plans: plans);

  @override
  CreateAdminDiscountRequest cycles(int? cycles) => call(cycles: cycles);

  @override
  CreateAdminDiscountRequest maxUses(int? maxUses) => call(maxUses: maxUses);

  @override
  CreateAdminDiscountRequest perPerson(int? perPerson) =>
      call(perPerson: perPerson);

  @override
  CreateAdminDiscountRequest startsAt(DateTime? startsAt) =>
      call(startsAt: startsAt);

  @override
  CreateAdminDiscountRequest endsAt(DateTime? endsAt) => call(endsAt: endsAt);

  @override
  CreateAdminDiscountRequest who(CreateAdminDiscountRequestWhoEnum? who) =>
      call(who: who);

  @override
  CreateAdminDiscountRequest note(String? note) => call(note: note);

  @override
  CreateAdminDiscountRequest channel(String? channel) => call(channel: channel);

  @override
  CreateAdminDiscountRequest confirmLarge(bool? confirmLarge) =>
      call(confirmLarge: confirmLarge);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CreateAdminDiscountRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateAdminDiscountRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateAdminDiscountRequest call({
    Object? code = const $CopyWithPlaceholder(),
    Object? percent = const $CopyWithPlaceholder(),
    Object? plans = const $CopyWithPlaceholder(),
    Object? cycles = const $CopyWithPlaceholder(),
    Object? maxUses = const $CopyWithPlaceholder(),
    Object? perPerson = const $CopyWithPlaceholder(),
    Object? startsAt = const $CopyWithPlaceholder(),
    Object? endsAt = const $CopyWithPlaceholder(),
    Object? who = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? confirmLarge = const $CopyWithPlaceholder(),
  }) {
    return CreateAdminDiscountRequest(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      percent: percent == const $CopyWithPlaceholder() || percent == null
          ? _value.percent
          // ignore: cast_nullable_to_non_nullable
          : percent as num,
      plans: plans == const $CopyWithPlaceholder() || plans == null
          ? _value.plans
          // ignore: cast_nullable_to_non_nullable
          : plans as List<String>,
      cycles: cycles == const $CopyWithPlaceholder()
          ? _value.cycles
          // ignore: cast_nullable_to_non_nullable
          : cycles as int?,
      maxUses: maxUses == const $CopyWithPlaceholder()
          ? _value.maxUses
          // ignore: cast_nullable_to_non_nullable
          : maxUses as int?,
      perPerson: perPerson == const $CopyWithPlaceholder()
          ? _value.perPerson
          // ignore: cast_nullable_to_non_nullable
          : perPerson as int?,
      startsAt: startsAt == const $CopyWithPlaceholder()
          ? _value.startsAt
          // ignore: cast_nullable_to_non_nullable
          : startsAt as DateTime?,
      endsAt: endsAt == const $CopyWithPlaceholder()
          ? _value.endsAt
          // ignore: cast_nullable_to_non_nullable
          : endsAt as DateTime?,
      who: who == const $CopyWithPlaceholder()
          ? _value.who
          // ignore: cast_nullable_to_non_nullable
          : who as CreateAdminDiscountRequestWhoEnum?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as String?,
      confirmLarge: confirmLarge == const $CopyWithPlaceholder()
          ? _value.confirmLarge
          // ignore: cast_nullable_to_non_nullable
          : confirmLarge as bool?,
    );
  }
}

extension $CreateAdminDiscountRequestCopyWith on CreateAdminDiscountRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateAdminDiscountRequest.copyWith(...)` or `instanceOfCreateAdminDiscountRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateAdminDiscountRequestCWProxy get copyWith =>
      _$CreateAdminDiscountRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdminDiscountRequest _$CreateAdminDiscountRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateAdminDiscountRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['code', 'percent', 'plans']);
    final val = CreateAdminDiscountRequest(
      code: $checkedConvert('code', (v) => v as String),
      percent: $checkedConvert('percent', (v) => v as num),
      plans: $checkedConvert(
        'plans',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      cycles: $checkedConvert('cycles', (v) => (v as num?)?.toInt()),
      maxUses: $checkedConvert('max_uses', (v) => (v as num?)?.toInt()),
      perPerson: $checkedConvert('per_person', (v) => (v as num?)?.toInt()),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert(
        'ends_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      who: $checkedConvert(
        'who',
        (v) =>
            $enumDecodeNullable(_$CreateAdminDiscountRequestWhoEnumEnumMap, v),
      ),
      note: $checkedConvert('note', (v) => v as String?),
      channel: $checkedConvert('channel', (v) => v as String?),
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
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'confirmLarge': 'confirm_large',
  },
);

Map<String, dynamic> _$CreateAdminDiscountRequestToJson(
  CreateAdminDiscountRequest instance,
) => <String, dynamic>{
  'code': instance.code,
  'percent': instance.percent,
  'plans': instance.plans,
  'cycles': ?instance.cycles,
  'max_uses': ?instance.maxUses,
  'per_person': ?instance.perPerson,
  'starts_at': ?instance.startsAt?.toIso8601String(),
  'ends_at': ?instance.endsAt?.toIso8601String(),
  'who': ?_$CreateAdminDiscountRequestWhoEnumEnumMap[instance.who],
  'note': ?instance.note,
  'channel': ?instance.channel,
  'confirm_large': ?instance.confirmLarge,
};

const _$CreateAdminDiscountRequestWhoEnumEnumMap = {
  CreateAdminDiscountRequestWhoEnum.any: 'any',
  CreateAdminDiscountRequestWhoEnum.firstTime: 'first_time',
};
