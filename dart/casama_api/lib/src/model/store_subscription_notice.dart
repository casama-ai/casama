//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_subscription_notice.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StoreSubscriptionNotice {
  /// Returns a new [StoreSubscriptionNotice] instance.
  StoreSubscriptionNotice({

    required  this.source_,

    required  this.planName,

    required  this.manageUrl,

    required  this.notice,
  });

  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  )


  final StoreSubscriptionNoticeSource_Enum source_;



  @JsonKey(
    
    name: r'plan_name',
    required: true,
    includeIfNull: false,
  )


  final String planName;



      /// The store's page to cancel it
  @JsonKey(
    
    name: r'manage_url',
    required: true,
    includeIfNull: false,
  )


  final String manageUrl;



      /// In the person's language: this must be cancelled in the store, with the link
  @JsonKey(
    
    name: r'notice',
    required: true,
    includeIfNull: false,
  )


  final String notice;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StoreSubscriptionNotice &&
      other.source_ == source_ &&
      other.planName == planName &&
      other.manageUrl == manageUrl &&
      other.notice == notice;

    @override
    int get hashCode =>
        source_.hashCode +
        planName.hashCode +
        manageUrl.hashCode +
        notice.hashCode;

  factory StoreSubscriptionNotice.fromJson(Map<String, dynamic> json) => _$StoreSubscriptionNoticeFromJson(json);

  Map<String, dynamic> toJson() => _$StoreSubscriptionNoticeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum StoreSubscriptionNoticeSource_Enum {
@JsonValue(r'app_store')
appStore(r'app_store'),
@JsonValue(r'google_play')
googlePlay(r'google_play');

const StoreSubscriptionNoticeSource_Enum(this.value);

final String value;

@override
String toString() => value;
}


