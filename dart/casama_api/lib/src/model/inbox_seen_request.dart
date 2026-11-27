//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inbox_seen_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InboxSeenRequest {
  /// Returns a new [InboxSeenRequest] instance.
  InboxSeenRequest({

    required  this.itemKind,

    required  this.itemId,
  });

  @JsonKey(
    
    name: r'item_kind',
    required: true,
    includeIfNull: false,
  )


  final InboxSeenRequestItemKindEnum itemKind;



  @JsonKey(
    
    name: r'item_id',
    required: true,
    includeIfNull: false,
  )


  final String itemId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InboxSeenRequest &&
      other.itemKind == itemKind &&
      other.itemId == itemId;

    @override
    int get hashCode =>
        itemKind.hashCode +
        itemId.hashCode;

  factory InboxSeenRequest.fromJson(Map<String, dynamic> json) => _$InboxSeenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InboxSeenRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum InboxSeenRequestItemKindEnum {
@JsonValue(r'page')
page(r'page'),
@JsonValue(r'brief')
brief(r'brief'),
@JsonValue(r'notification')
notification(r'notification');

const InboxSeenRequestItemKindEnum(this.value);

final String value;

@override
String toString() => value;
}


