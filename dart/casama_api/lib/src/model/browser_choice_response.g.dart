// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_choice_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrowserChoiceResponseCWProxy {
  BrowserChoiceResponse id(String id);

  BrowserChoiceResponse runId(String runId);

  BrowserChoiceResponse host(String host);

  BrowserChoiceResponse status(BrowserChoiceResponseStatusEnum status);

  BrowserChoiceResponse choice(BrowserChoiceResponseChoiceEnum? choice);

  BrowserChoiceResponse remember(bool remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  BrowserChoiceResponse call({
    String id,
    String runId,
    String host,
    BrowserChoiceResponseStatusEnum status,
    BrowserChoiceResponseChoiceEnum? choice,
    bool remember,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBrowserChoiceResponse.copyWith(...)` or call `instanceOfBrowserChoiceResponse.copyWith.fieldName(value)` for a single field.
class _$BrowserChoiceResponseCWProxyImpl
    implements _$BrowserChoiceResponseCWProxy {
  const _$BrowserChoiceResponseCWProxyImpl(this._value);

  final BrowserChoiceResponse _value;

  @override
  BrowserChoiceResponse id(String id) => call(id: id);

  @override
  BrowserChoiceResponse runId(String runId) => call(runId: runId);

  @override
  BrowserChoiceResponse host(String host) => call(host: host);

  @override
  BrowserChoiceResponse status(BrowserChoiceResponseStatusEnum status) =>
      call(status: status);

  @override
  BrowserChoiceResponse choice(BrowserChoiceResponseChoiceEnum? choice) =>
      call(choice: choice);

  @override
  BrowserChoiceResponse remember(bool remember) => call(remember: remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `BrowserChoiceResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// BrowserChoiceResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  BrowserChoiceResponse call({
    Object? id = const $CopyWithPlaceholder(),
    Object? runId = const $CopyWithPlaceholder(),
    Object? host = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? choice = const $CopyWithPlaceholder(),
    Object? remember = const $CopyWithPlaceholder(),
  }) {
    return BrowserChoiceResponse(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      runId: runId == const $CopyWithPlaceholder() || runId == null
          ? _value.runId
          // ignore: cast_nullable_to_non_nullable
          : runId as String,
      host: host == const $CopyWithPlaceholder() || host == null
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BrowserChoiceResponseStatusEnum,
      choice: choice == const $CopyWithPlaceholder()
          ? _value.choice
          // ignore: cast_nullable_to_non_nullable
          : choice as BrowserChoiceResponseChoiceEnum?,
      remember: remember == const $CopyWithPlaceholder() || remember == null
          ? _value.remember
          // ignore: cast_nullable_to_non_nullable
          : remember as bool,
    );
  }
}

extension $BrowserChoiceResponseCopyWith on BrowserChoiceResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBrowserChoiceResponse.copyWith(...)` or `instanceOfBrowserChoiceResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrowserChoiceResponseCWProxy get copyWith =>
      _$BrowserChoiceResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowserChoiceResponse _$BrowserChoiceResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BrowserChoiceResponse', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'run_id',
      'host',
      'status',
      'choice',
      'remember',
    ],
  );
  final val = BrowserChoiceResponse(
    id: $checkedConvert('id', (v) => v as String),
    runId: $checkedConvert('run_id', (v) => v as String),
    host: $checkedConvert('host', (v) => v as String),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$BrowserChoiceResponseStatusEnumEnumMap, v),
    ),
    choice: $checkedConvert(
      'choice',
      (v) => $enumDecodeNullable(_$BrowserChoiceResponseChoiceEnumEnumMap, v),
    ),
    remember: $checkedConvert('remember', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'runId': 'run_id'});

Map<String, dynamic> _$BrowserChoiceResponseToJson(
  BrowserChoiceResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'run_id': instance.runId,
  'host': instance.host,
  'status': _$BrowserChoiceResponseStatusEnumEnumMap[instance.status]!,
  'choice': _$BrowserChoiceResponseChoiceEnumEnumMap[instance.choice],
  'remember': instance.remember,
};

const _$BrowserChoiceResponseStatusEnumEnumMap = {
  BrowserChoiceResponseStatusEnum.pending: 'pending',
  BrowserChoiceResponseStatusEnum.answered: 'answered',
  BrowserChoiceResponseStatusEnum.expired: 'expired',
  BrowserChoiceResponseStatusEnum.cancelled: 'cancelled',
};

const _$BrowserChoiceResponseChoiceEnumEnumMap = {
  BrowserChoiceResponseChoiceEnum.app: 'app',
  BrowserChoiceResponseChoiceEnum.mine: 'mine',
  BrowserChoiceResponseChoiceEnum.computer: 'computer',
};
