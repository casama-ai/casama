// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_link_status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudLinkStatusCWProxy {
  CloudLinkStatus scopes(List<String>? scopes);

  CloudLinkStatus payer(CloudModelsStatePayer? payer);

  CloudLinkStatus plan(CloudLinkStatusPlan? plan);

  CloudLinkStatus modelsAllowed(bool? modelsAllowed);

  CloudLinkStatus creditsUsd(num? creditsUsd);

  CloudLinkStatus included(CloudLinkStatusIncluded? included);

  CloudLinkStatus today(CloudLinkStatusToday? today);

  CloudLinkStatus seats(CloudLinkStatusSeats? seats);

  CloudLinkStatus trial(CloudLinkStatusTrial? trial);

  CloudLinkStatus jobs(CloudLinkStatusJobs? jobs);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudLinkStatus call({
    List<String>? scopes,
    CloudModelsStatePayer? payer,
    CloudLinkStatusPlan? plan,
    bool? modelsAllowed,
    num? creditsUsd,
    CloudLinkStatusIncluded? included,
    CloudLinkStatusToday? today,
    CloudLinkStatusSeats? seats,
    CloudLinkStatusTrial? trial,
    CloudLinkStatusJobs? jobs,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudLinkStatus.copyWith(...)` or call `instanceOfCloudLinkStatus.copyWith.fieldName(value)` for a single field.
class _$CloudLinkStatusCWProxyImpl implements _$CloudLinkStatusCWProxy {
  const _$CloudLinkStatusCWProxyImpl(this._value);

  final CloudLinkStatus _value;

  @override
  CloudLinkStatus scopes(List<String>? scopes) => call(scopes: scopes);

  @override
  CloudLinkStatus payer(CloudModelsStatePayer? payer) => call(payer: payer);

  @override
  CloudLinkStatus plan(CloudLinkStatusPlan? plan) => call(plan: plan);

  @override
  CloudLinkStatus modelsAllowed(bool? modelsAllowed) =>
      call(modelsAllowed: modelsAllowed);

  @override
  CloudLinkStatus creditsUsd(num? creditsUsd) => call(creditsUsd: creditsUsd);

  @override
  CloudLinkStatus included(CloudLinkStatusIncluded? included) =>
      call(included: included);

  @override
  CloudLinkStatus today(CloudLinkStatusToday? today) => call(today: today);

  @override
  CloudLinkStatus seats(CloudLinkStatusSeats? seats) => call(seats: seats);

  @override
  CloudLinkStatus trial(CloudLinkStatusTrial? trial) => call(trial: trial);

  @override
  CloudLinkStatus jobs(CloudLinkStatusJobs? jobs) => call(jobs: jobs);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudLinkStatus(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudLinkStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudLinkStatus call({
    Object? scopes = const $CopyWithPlaceholder(),
    Object? payer = const $CopyWithPlaceholder(),
    Object? plan = const $CopyWithPlaceholder(),
    Object? modelsAllowed = const $CopyWithPlaceholder(),
    Object? creditsUsd = const $CopyWithPlaceholder(),
    Object? included = const $CopyWithPlaceholder(),
    Object? today = const $CopyWithPlaceholder(),
    Object? seats = const $CopyWithPlaceholder(),
    Object? trial = const $CopyWithPlaceholder(),
    Object? jobs = const $CopyWithPlaceholder(),
  }) {
    return CloudLinkStatus(
      scopes: scopes == const $CopyWithPlaceholder()
          ? _value.scopes
          // ignore: cast_nullable_to_non_nullable
          : scopes as List<String>?,
      payer: payer == const $CopyWithPlaceholder()
          ? _value.payer
          // ignore: cast_nullable_to_non_nullable
          : payer as CloudModelsStatePayer?,
      plan: plan == const $CopyWithPlaceholder()
          ? _value.plan
          // ignore: cast_nullable_to_non_nullable
          : plan as CloudLinkStatusPlan?,
      modelsAllowed: modelsAllowed == const $CopyWithPlaceholder()
          ? _value.modelsAllowed
          // ignore: cast_nullable_to_non_nullable
          : modelsAllowed as bool?,
      creditsUsd: creditsUsd == const $CopyWithPlaceholder()
          ? _value.creditsUsd
          // ignore: cast_nullable_to_non_nullable
          : creditsUsd as num?,
      included: included == const $CopyWithPlaceholder()
          ? _value.included
          // ignore: cast_nullable_to_non_nullable
          : included as CloudLinkStatusIncluded?,
      today: today == const $CopyWithPlaceholder()
          ? _value.today
          // ignore: cast_nullable_to_non_nullable
          : today as CloudLinkStatusToday?,
      seats: seats == const $CopyWithPlaceholder()
          ? _value.seats
          // ignore: cast_nullable_to_non_nullable
          : seats as CloudLinkStatusSeats?,
      trial: trial == const $CopyWithPlaceholder()
          ? _value.trial
          // ignore: cast_nullable_to_non_nullable
          : trial as CloudLinkStatusTrial?,
      jobs: jobs == const $CopyWithPlaceholder()
          ? _value.jobs
          // ignore: cast_nullable_to_non_nullable
          : jobs as CloudLinkStatusJobs?,
    );
  }
}

extension $CloudLinkStatusCopyWith on CloudLinkStatus {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudLinkStatus.copyWith(...)` or `instanceOfCloudLinkStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudLinkStatusCWProxy get copyWith => _$CloudLinkStatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudLinkStatus _$CloudLinkStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CloudLinkStatus',
      json,
      ($checkedConvert) {
        final val = CloudLinkStatus(
          scopes: $checkedConvert(
            'scopes',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          payer: $checkedConvert(
            'payer',
            (v) => v == null
                ? null
                : CloudModelsStatePayer.fromJson(v as Map<String, dynamic>),
          ),
          plan: $checkedConvert(
            'plan',
            (v) => v == null
                ? null
                : CloudLinkStatusPlan.fromJson(v as Map<String, dynamic>),
          ),
          modelsAllowed: $checkedConvert('models_allowed', (v) => v as bool?),
          creditsUsd: $checkedConvert('credits_usd', (v) => v as num?),
          included: $checkedConvert(
            'included',
            (v) => v == null
                ? null
                : CloudLinkStatusIncluded.fromJson(v as Map<String, dynamic>),
          ),
          today: $checkedConvert(
            'today',
            (v) => v == null
                ? null
                : CloudLinkStatusToday.fromJson(v as Map<String, dynamic>),
          ),
          seats: $checkedConvert(
            'seats',
            (v) => v == null
                ? null
                : CloudLinkStatusSeats.fromJson(v as Map<String, dynamic>),
          ),
          trial: $checkedConvert(
            'trial',
            (v) => v == null
                ? null
                : CloudLinkStatusTrial.fromJson(v as Map<String, dynamic>),
          ),
          jobs: $checkedConvert(
            'jobs',
            (v) => v == null
                ? null
                : CloudLinkStatusJobs.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'modelsAllowed': 'models_allowed',
        'creditsUsd': 'credits_usd',
      },
    );

Map<String, dynamic> _$CloudLinkStatusToJson(CloudLinkStatus instance) =>
    <String, dynamic>{
      'scopes': ?instance.scopes,
      'payer': ?instance.payer?.toJson(),
      'plan': ?instance.plan?.toJson(),
      'models_allowed': ?instance.modelsAllowed,
      'credits_usd': ?instance.creditsUsd,
      'included': ?instance.included?.toJson(),
      'today': ?instance.today?.toJson(),
      'seats': ?instance.seats?.toJson(),
      'trial': ?instance.trial?.toJson(),
      'jobs': ?instance.jobs?.toJson(),
    };
