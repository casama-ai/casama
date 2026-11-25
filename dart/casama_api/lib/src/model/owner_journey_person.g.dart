// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_journey_person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerJourneyPersonCWProxy {
  OwnerJourneyPerson email(String? email);

  OwnerJourneyPerson name(String? name);

  OwnerJourneyPerson createdAt(String? createdAt);

  OwnerJourneyPerson plan(String? plan);

  OwnerJourneyPerson planStatus(String? planStatus);

  OwnerJourneyPerson messages(int messages);

  OwnerJourneyPerson bots(int bots);

  OwnerJourneyPerson devices(List<String> devices);

  OwnerJourneyPerson lastActiveAt(String? lastActiveAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerJourneyPerson(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerJourneyPerson(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerJourneyPerson call({
    String? email,
    String? name,
    String? createdAt,
    String? plan,
    String? planStatus,
    int messages,
    int bots,
    List<String> devices,
    String? lastActiveAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerJourneyPerson.copyWith(...)` or call `instanceOfOwnerJourneyPerson.copyWith.fieldName(value)` for a single field.
class _$OwnerJourneyPersonCWProxyImpl implements _$OwnerJourneyPersonCWProxy {
  const _$OwnerJourneyPersonCWProxyImpl(this._value);

  final OwnerJourneyPerson _value;

  @override
  OwnerJourneyPerson email(String? email) => call(email: email);

  @override
  OwnerJourneyPerson name(String? name) => call(name: name);

  @override
  OwnerJourneyPerson createdAt(String? createdAt) => call(createdAt: createdAt);

  @override
  OwnerJourneyPerson plan(String? plan) => call(plan: plan);

  @override
  OwnerJourneyPerson planStatus(String? planStatus) =>
      call(planStatus: planStatus);

  @override
  OwnerJourneyPerson messages(int messages) => call(messages: messages);

  @override
  OwnerJourneyPerson bots(int bots) => call(bots: bots);

  @override
  OwnerJourneyPerson devices(List<String> devices) => call(devices: devices);

  @override
  OwnerJourneyPerson lastActiveAt(String? lastActiveAt) =>
      call(lastActiveAt: lastActiveAt);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerJourneyPerson(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerJourneyPerson(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerJourneyPerson call({
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? plan = const $CopyWithPlaceholder(),
    Object? planStatus = const $CopyWithPlaceholder(),
    Object? messages = const $CopyWithPlaceholder(),
    Object? bots = const $CopyWithPlaceholder(),
    Object? devices = const $CopyWithPlaceholder(),
    Object? lastActiveAt = const $CopyWithPlaceholder(),
  }) {
    return OwnerJourneyPerson(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      plan: plan == const $CopyWithPlaceholder()
          ? _value.plan
          // ignore: cast_nullable_to_non_nullable
          : plan as String?,
      planStatus: planStatus == const $CopyWithPlaceholder()
          ? _value.planStatus
          // ignore: cast_nullable_to_non_nullable
          : planStatus as String?,
      messages: messages == const $CopyWithPlaceholder() || messages == null
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as int,
      bots: bots == const $CopyWithPlaceholder() || bots == null
          ? _value.bots
          // ignore: cast_nullable_to_non_nullable
          : bots as int,
      devices: devices == const $CopyWithPlaceholder() || devices == null
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as List<String>,
      lastActiveAt: lastActiveAt == const $CopyWithPlaceholder()
          ? _value.lastActiveAt
          // ignore: cast_nullable_to_non_nullable
          : lastActiveAt as String?,
    );
  }
}

extension $OwnerJourneyPersonCopyWith on OwnerJourneyPerson {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerJourneyPerson.copyWith(...)` or `instanceOfOwnerJourneyPerson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerJourneyPersonCWProxy get copyWith =>
      _$OwnerJourneyPersonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerJourneyPerson _$OwnerJourneyPersonFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OwnerJourneyPerson',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'email',
            'name',
            'created_at',
            'plan',
            'plan_status',
            'messages',
            'bots',
            'devices',
            'last_active_at',
          ],
        );
        final val = OwnerJourneyPerson(
          email: $checkedConvert('email', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          plan: $checkedConvert('plan', (v) => v as String?),
          planStatus: $checkedConvert('plan_status', (v) => v as String?),
          messages: $checkedConvert('messages', (v) => (v as num).toInt()),
          bots: $checkedConvert('bots', (v) => (v as num).toInt()),
          devices: $checkedConvert(
            'devices',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          lastActiveAt: $checkedConvert('last_active_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'planStatus': 'plan_status',
        'lastActiveAt': 'last_active_at',
      },
    );

Map<String, dynamic> _$OwnerJourneyPersonToJson(OwnerJourneyPerson instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'created_at': instance.createdAt,
      'plan': instance.plan,
      'plan_status': instance.planStatus,
      'messages': instance.messages,
      'bots': instance.bots,
      'devices': instance.devices,
      'last_active_at': instance.lastActiveAt,
    };
