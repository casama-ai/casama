// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_admin_partner_commission_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateAdminPartnerCommissionRequestCWProxy {
  UpdateAdminPartnerCommissionRequest action(
    UpdateAdminPartnerCommissionRequestActionEnum action,
  );

  UpdateAdminPartnerCommissionRequest note(String? note);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminPartnerCommissionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminPartnerCommissionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateAdminPartnerCommissionRequest call({
    UpdateAdminPartnerCommissionRequestActionEnum action,
    String? note,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateAdminPartnerCommissionRequest.copyWith(...)` or call `instanceOfUpdateAdminPartnerCommissionRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateAdminPartnerCommissionRequestCWProxyImpl
    implements _$UpdateAdminPartnerCommissionRequestCWProxy {
  const _$UpdateAdminPartnerCommissionRequestCWProxyImpl(this._value);

  final UpdateAdminPartnerCommissionRequest _value;

  @override
  UpdateAdminPartnerCommissionRequest action(
    UpdateAdminPartnerCommissionRequestActionEnum action,
  ) => call(action: action);

  @override
  UpdateAdminPartnerCommissionRequest note(String? note) => call(note: note);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `UpdateAdminPartnerCommissionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateAdminPartnerCommissionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateAdminPartnerCommissionRequest call({
    Object? action = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return UpdateAdminPartnerCommissionRequest(
      action: action == const $CopyWithPlaceholder() || action == null
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as UpdateAdminPartnerCommissionRequestActionEnum,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $UpdateAdminPartnerCommissionRequestCopyWith
    on UpdateAdminPartnerCommissionRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateAdminPartnerCommissionRequest.copyWith(...)` or `instanceOfUpdateAdminPartnerCommissionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateAdminPartnerCommissionRequestCWProxy get copyWith =>
      _$UpdateAdminPartnerCommissionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAdminPartnerCommissionRequest
_$UpdateAdminPartnerCommissionRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateAdminPartnerCommissionRequest', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['action']);
      final val = UpdateAdminPartnerCommissionRequest(
        action: $checkedConvert(
          'action',
          (v) => $enumDecode(
            _$UpdateAdminPartnerCommissionRequestActionEnumEnumMap,
            v,
          ),
        ),
        note: $checkedConvert('note', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UpdateAdminPartnerCommissionRequestToJson(
  UpdateAdminPartnerCommissionRequest instance,
) => <String, dynamic>{
  'action':
      _$UpdateAdminPartnerCommissionRequestActionEnumEnumMap[instance.action]!,
  'note': ?instance.note,
};

const _$UpdateAdminPartnerCommissionRequestActionEnumEnumMap = {
  UpdateAdminPartnerCommissionRequestActionEnum.hold: 'hold',
  UpdateAdminPartnerCommissionRequestActionEnum.release: 'release',
  UpdateAdminPartnerCommissionRequestActionEnum.void_: 'void',
};
