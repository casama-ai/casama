// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_browser_choice_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerBrowserChoiceRequestCWProxy {
  AnswerBrowserChoiceRequest choice(
    AnswerBrowserChoiceRequestChoiceEnum choice,
  );

  AnswerBrowserChoiceRequest remember(bool? remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AnswerBrowserChoiceRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AnswerBrowserChoiceRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AnswerBrowserChoiceRequest call({
    AnswerBrowserChoiceRequestChoiceEnum choice,
    bool? remember,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAnswerBrowserChoiceRequest.copyWith(...)` or call `instanceOfAnswerBrowserChoiceRequest.copyWith.fieldName(value)` for a single field.
class _$AnswerBrowserChoiceRequestCWProxyImpl
    implements _$AnswerBrowserChoiceRequestCWProxy {
  const _$AnswerBrowserChoiceRequestCWProxyImpl(this._value);

  final AnswerBrowserChoiceRequest _value;

  @override
  AnswerBrowserChoiceRequest choice(
    AnswerBrowserChoiceRequestChoiceEnum choice,
  ) => call(choice: choice);

  @override
  AnswerBrowserChoiceRequest remember(bool? remember) =>
      call(remember: remember);

  /// Creates a new instance with the provided field values.
  /// Omitted fields keep their values; explicit `null` clears nullable fields.
  /// The public API rejects `null` for non-nullable fields. To update a single field use `AnswerBrowserChoiceRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AnswerBrowserChoiceRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AnswerBrowserChoiceRequest call({
    Object? choice = const $CopyWithPlaceholder(),
    Object? remember = const $CopyWithPlaceholder(),
  }) {
    return AnswerBrowserChoiceRequest(
      choice: choice == const $CopyWithPlaceholder() || choice == null
          ? _value.choice
          // ignore: cast_nullable_to_non_nullable
          : choice as AnswerBrowserChoiceRequestChoiceEnum,
      remember: remember == const $CopyWithPlaceholder()
          ? _value.remember
          // ignore: cast_nullable_to_non_nullable
          : remember as bool?,
    );
  }
}

extension $AnswerBrowserChoiceRequestCopyWith on AnswerBrowserChoiceRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAnswerBrowserChoiceRequest.copyWith(...)` or `instanceOfAnswerBrowserChoiceRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerBrowserChoiceRequestCWProxy get copyWith =>
      _$AnswerBrowserChoiceRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerBrowserChoiceRequest _$AnswerBrowserChoiceRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AnswerBrowserChoiceRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['choice']);
  final val = AnswerBrowserChoiceRequest(
    choice: $checkedConvert(
      'choice',
      (v) => $enumDecode(_$AnswerBrowserChoiceRequestChoiceEnumEnumMap, v),
    ),
    remember: $checkedConvert('remember', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$AnswerBrowserChoiceRequestToJson(
  AnswerBrowserChoiceRequest instance,
) => <String, dynamic>{
  'choice': _$AnswerBrowserChoiceRequestChoiceEnumEnumMap[instance.choice]!,
  'remember': ?instance.remember,
};

const _$AnswerBrowserChoiceRequestChoiceEnumEnumMap = {
  AnswerBrowserChoiceRequestChoiceEnum.app: 'app',
  AnswerBrowserChoiceRequestChoiceEnum.mine: 'mine',
  AnswerBrowserChoiceRequestChoiceEnum.computer: 'computer',
};
