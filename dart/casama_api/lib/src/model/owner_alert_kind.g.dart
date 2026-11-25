// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_alert_kind.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnerAlertKindCWProxy {
  OwnerAlertKind kind(String kind);

  OwnerAlertKind on_(bool on_);

  OwnerAlertKind defaultOn(bool defaultOn);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerAlertKind(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerAlertKind(...).copyWith(id: 12, name: "My name")
  /// ```
  OwnerAlertKind call({String kind, bool on_, bool defaultOn});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfOwnerAlertKind.copyWith(...)` or call `instanceOfOwnerAlertKind.copyWith.fieldName(value)` for a single field.
class _$OwnerAlertKindCWProxyImpl implements _$OwnerAlertKindCWProxy {
  const _$OwnerAlertKindCWProxyImpl(this._value);

  final OwnerAlertKind _value;

  @override
  OwnerAlertKind kind(String kind) => call(kind: kind);

  @override
  OwnerAlertKind on_(bool on_) => call(on_: on_);

  @override
  OwnerAlertKind defaultOn(bool defaultOn) => call(defaultOn: defaultOn);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `OwnerAlertKind(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// OwnerAlertKind(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  OwnerAlertKind call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? on_ = const $CopyWithPlaceholder(),
    Object? defaultOn = const $CopyWithPlaceholder(),
  }) {
    return OwnerAlertKind(
      kind: kind == const $CopyWithPlaceholder() || kind == null
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as String,
      on_: on_ == const $CopyWithPlaceholder() || on_ == null
          ? _value.on_
          // ignore: cast_nullable_to_non_nullable
          : on_ as bool,
      defaultOn: defaultOn == const $CopyWithPlaceholder() || defaultOn == null
          ? _value.defaultOn
          // ignore: cast_nullable_to_non_nullable
          : defaultOn as bool,
    );
  }
}

extension $OwnerAlertKindCopyWith on OwnerAlertKind {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfOwnerAlertKind.copyWith(...)` or `instanceOfOwnerAlertKind.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OwnerAlertKindCWProxy get copyWith => _$OwnerAlertKindCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerAlertKind _$OwnerAlertKindFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OwnerAlertKind', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['kind', 'on', 'default_on']);
      final val = OwnerAlertKind(
        kind: $checkedConvert('kind', (v) => v as String),
        on_: $checkedConvert('on', (v) => v as bool),
        defaultOn: $checkedConvert('default_on', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'on_': 'on', 'defaultOn': 'default_on'});

Map<String, dynamic> _$OwnerAlertKindToJson(OwnerAlertKind instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'on': instance.on_,
      'default_on': instance.defaultOn,
    };
