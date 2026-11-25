// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_journey_detail.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerJourneyDetailCWProxy {
  OwnerJourneyDetail journey(OwnerJourney? journey);

  OwnerJourneyDetail events(List<OwnerEvent> events);

  OwnerJourneyDetail person(OwnerJourneyPerson? person);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerJourneyDetail(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerJourneyDetail(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerJourneyDetail call({
    OwnerJourney? journey,
    List<OwnerEvent> events,
    OwnerJourneyPerson? person,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerJourneyDetail.copyWith(...)` or call `instanceOfOwnerJourneyDetail.copyWith.fieldName(value)` for a single field.
class _$OwnerJourneyDetailCWProxyImpl implements _$OwnerJourneyDetailCWProxy {
  const _$OwnerJourneyDetailCWProxyImpl(this._value);

  final OwnerJourneyDetail _value;

  @override
  OwnerJourneyDetail journey(OwnerJourney? journey) => call(journey: journey);

  @override
  OwnerJourneyDetail events(List<OwnerEvent> events) => call(events: events);

  @override
  OwnerJourneyDetail person(OwnerJourneyPerson? person) => call(person: person);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerJourneyDetail(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerJourneyDetail(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerJourneyDetail call({
    Object? journey = const $CopyWithPlaceholder(),
    Object? events = const $CopyWithPlaceholder(),
    Object? person = const $CopyWithPlaceholder(),
  }) {
    return OwnerJourneyDetail(
      journey: journey == const $CopyWithPlaceholder()
          ? _value.journey
          // ignore: cast_nullable_to_non_nullable
          : journey as OwnerJourney?,
      events: events == const $CopyWithPlaceholder() || events == null
          ? _value.events
          // ignore: cast_nullable_to_non_nullable
          : events as List<OwnerEvent>,
      person: person == const $CopyWithPlaceholder()
          ? _value.person
          // ignore: cast_nullable_to_non_nullable
          : person as OwnerJourneyPerson?,
    );
  }
}

extension $OwnerJourneyDetailCopyWith on OwnerJourneyDetail {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerJourneyDetail.copyWith(...)` or `instanceOfOwnerJourneyDetail.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerJourneyDetailCWProxy get copyWith =>
      _$OwnerJourneyDetailCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerJourneyDetail _$OwnerJourneyDetailFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OwnerJourneyDetail', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['journey', 'events', 'person']);
      final val = OwnerJourneyDetail(
        journey: $checkedConvert(
          'journey',
          (v) => v == null
              ? null
              : OwnerJourney.fromJson(v as Map<String, dynamic>),
        ),
        events: $checkedConvert(
          'events',
          (v) => (v as List<dynamic>)
              .map((e) => OwnerEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        person: $checkedConvert(
          'person',
          (v) => v == null
              ? null
              : OwnerJourneyPerson.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OwnerJourneyDetailToJson(OwnerJourneyDetail instance) =>
    <String, dynamic>{
      'journey': instance.journey?.toJson(),
      'events': instance.events.map((e) => e.toJson()).toList(),
      'person': instance.person?.toJson(),
    };
