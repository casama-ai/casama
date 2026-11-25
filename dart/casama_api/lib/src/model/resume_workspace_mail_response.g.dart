// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_workspace_mail_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResumeWorkspaceMailResponseCWProxy {
  ResumeWorkspaceMailResponse orgId(String orgId);

  ResumeWorkspaceMailResponse resumed(bool resumed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ResumeWorkspaceMailResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ResumeWorkspaceMailResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  ResumeWorkspaceMailResponse call({String orgId, bool resumed});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfResumeWorkspaceMailResponse.copyWith(...)` or call `instanceOfResumeWorkspaceMailResponse.copyWith.fieldName(value)` for a single field.
class _$ResumeWorkspaceMailResponseCWProxyImpl
    implements _$ResumeWorkspaceMailResponseCWProxy {
  const _$ResumeWorkspaceMailResponseCWProxyImpl(this._value);

  final ResumeWorkspaceMailResponse _value;

  @override
  ResumeWorkspaceMailResponse orgId(String orgId) => call(orgId: orgId);

  @override
  ResumeWorkspaceMailResponse resumed(bool resumed) => call(resumed: resumed);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `ResumeWorkspaceMailResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ResumeWorkspaceMailResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ResumeWorkspaceMailResponse call({
    Object? orgId = const $CopyWithPlaceholder(),
    Object? resumed = const $CopyWithPlaceholder(),
  }) {
    return ResumeWorkspaceMailResponse(
      orgId: orgId == const $CopyWithPlaceholder() || orgId == null
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      resumed: resumed == const $CopyWithPlaceholder() || resumed == null
          ? _value.resumed
          // ignore: cast_nullable_to_non_nullable
          : resumed as bool,
    );
  }
}

extension $ResumeWorkspaceMailResponseCopyWith on ResumeWorkspaceMailResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfResumeWorkspaceMailResponse.copyWith(...)` or `instanceOfResumeWorkspaceMailResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResumeWorkspaceMailResponseCWProxy get copyWith =>
      _$ResumeWorkspaceMailResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeWorkspaceMailResponse _$ResumeWorkspaceMailResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResumeWorkspaceMailResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['org_id', 'resumed']);
  final val = ResumeWorkspaceMailResponse(
    orgId: $checkedConvert('org_id', (v) => v as String),
    resumed: $checkedConvert('resumed', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'orgId': 'org_id'});

Map<String, dynamic> _$ResumeWorkspaceMailResponseToJson(
  ResumeWorkspaceMailResponse instance,
) => <String, dynamic>{'org_id': instance.orgId, 'resumed': instance.resumed};
