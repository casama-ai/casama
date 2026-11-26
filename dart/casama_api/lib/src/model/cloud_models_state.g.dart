// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_models_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CloudModelsStateCWProxy {
  CloudModelsState available(bool available);

  CloudModelsState connected(bool connected);

  CloudModelsState canManage(bool canManage);

  CloudModelsState payer(CloudModelsStatePayer? payer);

  CloudModelsState status(CloudLinkStatus? status);

  CloudModelsState policy(CloudModelsPolicy policy);

  CloudModelsState fallback(CloudModelsFallback fallback);

  CloudModelsState embedding(bool embedding);

  CloudModelsState me(CloudModelsStateMe me);

  CloudModelsState memoryReindex(CloudModelsStateMemoryReindex? memoryReindex);

  CloudModelsState statusError(CloudModelsStateStatusError? statusError);

  CloudModelsState hasOwnKey(bool hasOwnKey);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsState(...).copyWith(id: 12, name: "My name")
  /// ```
  CloudModelsState call({
    bool available,
    bool connected,
    bool canManage,
    CloudModelsStatePayer? payer,
    CloudLinkStatus? status,
    CloudModelsPolicy policy,
    CloudModelsFallback fallback,
    bool embedding,
    CloudModelsStateMe me,
    CloudModelsStateMemoryReindex? memoryReindex,
    CloudModelsStateStatusError? statusError,
    bool hasOwnKey,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCloudModelsState.copyWith(...)` or call `instanceOfCloudModelsState.copyWith.fieldName(value)` for a single field.
class _$CloudModelsStateCWProxyImpl implements _$CloudModelsStateCWProxy {
  const _$CloudModelsStateCWProxyImpl(this._value);

  final CloudModelsState _value;

  @override
  CloudModelsState available(bool available) => call(available: available);

  @override
  CloudModelsState connected(bool connected) => call(connected: connected);

  @override
  CloudModelsState canManage(bool canManage) => call(canManage: canManage);

  @override
  CloudModelsState payer(CloudModelsStatePayer? payer) => call(payer: payer);

  @override
  CloudModelsState status(CloudLinkStatus? status) => call(status: status);

  @override
  CloudModelsState policy(CloudModelsPolicy policy) => call(policy: policy);

  @override
  CloudModelsState fallback(CloudModelsFallback fallback) =>
      call(fallback: fallback);

  @override
  CloudModelsState embedding(bool embedding) => call(embedding: embedding);

  @override
  CloudModelsState me(CloudModelsStateMe me) => call(me: me);

  @override
  CloudModelsState memoryReindex(
    CloudModelsStateMemoryReindex? memoryReindex,
  ) => call(memoryReindex: memoryReindex);

  @override
  CloudModelsState statusError(CloudModelsStateStatusError? statusError) =>
      call(statusError: statusError);

  @override
  CloudModelsState hasOwnKey(bool hasOwnKey) => call(hasOwnKey: hasOwnKey);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `CloudModelsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CloudModelsState(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CloudModelsState call({
    Object? available = const $CopyWithPlaceholder(),
    Object? connected = const $CopyWithPlaceholder(),
    Object? canManage = const $CopyWithPlaceholder(),
    Object? payer = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? policy = const $CopyWithPlaceholder(),
    Object? fallback = const $CopyWithPlaceholder(),
    Object? embedding = const $CopyWithPlaceholder(),
    Object? me = const $CopyWithPlaceholder(),
    Object? memoryReindex = const $CopyWithPlaceholder(),
    Object? statusError = const $CopyWithPlaceholder(),
    Object? hasOwnKey = const $CopyWithPlaceholder(),
  }) {
    return CloudModelsState(
      available: available == const $CopyWithPlaceholder() || available == null
          ? _value.available
          // ignore: cast_nullable_to_non_nullable
          : available as bool,
      connected: connected == const $CopyWithPlaceholder() || connected == null
          ? _value.connected
          // ignore: cast_nullable_to_non_nullable
          : connected as bool,
      canManage: canManage == const $CopyWithPlaceholder() || canManage == null
          ? _value.canManage
          // ignore: cast_nullable_to_non_nullable
          : canManage as bool,
      payer: payer == const $CopyWithPlaceholder()
          ? _value.payer
          // ignore: cast_nullable_to_non_nullable
          : payer as CloudModelsStatePayer?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CloudLinkStatus?,
      policy: policy == const $CopyWithPlaceholder() || policy == null
          ? _value.policy
          // ignore: cast_nullable_to_non_nullable
          : policy as CloudModelsPolicy,
      fallback: fallback == const $CopyWithPlaceholder() || fallback == null
          ? _value.fallback
          // ignore: cast_nullable_to_non_nullable
          : fallback as CloudModelsFallback,
      embedding: embedding == const $CopyWithPlaceholder() || embedding == null
          ? _value.embedding
          // ignore: cast_nullable_to_non_nullable
          : embedding as bool,
      me: me == const $CopyWithPlaceholder() || me == null
          ? _value.me
          // ignore: cast_nullable_to_non_nullable
          : me as CloudModelsStateMe,
      memoryReindex: memoryReindex == const $CopyWithPlaceholder()
          ? _value.memoryReindex
          // ignore: cast_nullable_to_non_nullable
          : memoryReindex as CloudModelsStateMemoryReindex?,
      statusError: statusError == const $CopyWithPlaceholder()
          ? _value.statusError
          // ignore: cast_nullable_to_non_nullable
          : statusError as CloudModelsStateStatusError?,
      hasOwnKey: hasOwnKey == const $CopyWithPlaceholder() || hasOwnKey == null
          ? _value.hasOwnKey
          // ignore: cast_nullable_to_non_nullable
          : hasOwnKey as bool,
    );
  }
}

extension $CloudModelsStateCopyWith on CloudModelsState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCloudModelsState.copyWith(...)` or `instanceOfCloudModelsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CloudModelsStateCWProxy get copyWith => _$CloudModelsStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModelsState _$CloudModelsStateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CloudModelsState',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'available',
        'connected',
        'can_manage',
        'payer',
        'status',
        'policy',
        'fallback',
        'embedding',
        'me',
        'memory_reindex',
        'status_error',
        'has_own_key',
      ],
    );
    final val = CloudModelsState(
      available: $checkedConvert('available', (v) => v as bool),
      connected: $checkedConvert('connected', (v) => v as bool),
      canManage: $checkedConvert('can_manage', (v) => v as bool),
      payer: $checkedConvert(
        'payer',
        (v) => v == null
            ? null
            : CloudModelsStatePayer.fromJson(v as Map<String, dynamic>),
      ),
      status: $checkedConvert(
        'status',
        (v) => v == null
            ? null
            : CloudLinkStatus.fromJson(v as Map<String, dynamic>),
      ),
      policy: $checkedConvert(
        'policy',
        (v) => CloudModelsPolicy.fromJson(v as Map<String, dynamic>),
      ),
      fallback: $checkedConvert(
        'fallback',
        (v) => CloudModelsFallback.fromJson(v as Map<String, dynamic>),
      ),
      embedding: $checkedConvert('embedding', (v) => v as bool),
      me: $checkedConvert(
        'me',
        (v) => CloudModelsStateMe.fromJson(v as Map<String, dynamic>),
      ),
      memoryReindex: $checkedConvert(
        'memory_reindex',
        (v) => v == null
            ? null
            : CloudModelsStateMemoryReindex.fromJson(v as Map<String, dynamic>),
      ),
      statusError: $checkedConvert(
        'status_error',
        (v) => v == null
            ? null
            : CloudModelsStateStatusError.fromJson(v as Map<String, dynamic>),
      ),
      hasOwnKey: $checkedConvert('has_own_key', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'canManage': 'can_manage',
    'memoryReindex': 'memory_reindex',
    'statusError': 'status_error',
    'hasOwnKey': 'has_own_key',
  },
);

Map<String, dynamic> _$CloudModelsStateToJson(CloudModelsState instance) =>
    <String, dynamic>{
      'available': instance.available,
      'connected': instance.connected,
      'can_manage': instance.canManage,
      'payer': instance.payer?.toJson(),
      'status': instance.status?.toJson(),
      'policy': instance.policy.toJson(),
      'fallback': instance.fallback.toJson(),
      'embedding': instance.embedding,
      'me': instance.me.toJson(),
      'memory_reindex': instance.memoryReindex?.toJson(),
      'status_error': instance.statusError?.toJson(),
      'has_own_key': instance.hasOwnKey,
    };
