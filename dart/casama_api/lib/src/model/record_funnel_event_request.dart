//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'record_funnel_event_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RecordFunnelEventRequest {
  /// Returns a new [RecordFunnelEventRequest] instance.
  RecordFunnelEventRequest({

    required  this.event,

     this.orgId,

     this.source_,

     this.detail,
  });

  @JsonKey(
    
    name: r'event',
    required: true,
    includeIfNull: false,
  )


  final RecordFunnelEventRequestEventEnum event;



  @JsonKey(
    
    name: r'org_id',
    required: false,
    includeIfNull: false,
  )


  final String? orgId;



  @JsonKey(
    
    name: r'source',
    required: false,
    includeIfNull: false,
  )


  final String? source_;



  @JsonKey(
    
    name: r'detail',
    required: false,
    includeIfNull: false,
  )


  final String? detail;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RecordFunnelEventRequest &&
      other.event == event &&
      other.orgId == orgId &&
      other.source_ == source_ &&
      other.detail == detail;

    @override
    int get hashCode =>
        event.hashCode +
        orgId.hashCode +
        source_.hashCode +
        detail.hashCode;

  factory RecordFunnelEventRequest.fromJson(Map<String, dynamic> json) => _$RecordFunnelEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RecordFunnelEventRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum RecordFunnelEventRequestEventEnum {
@JsonValue(r'paywall_view')
paywallView(r'paywall_view'),
@JsonValue(r'paywall_plan_select')
paywallPlanSelect(r'paywall_plan_select'),
@JsonValue(r'purchase_started')
purchaseStarted(r'purchase_started');

const RecordFunnelEventRequestEventEnum(this.value);

final String value;

@override
String toString() => value;
}


