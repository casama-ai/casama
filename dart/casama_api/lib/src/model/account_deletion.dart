//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/store_subscription_notice.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_deletion.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccountDeletion {
  /// Returns a new [AccountDeletion] instance.
  AccountDeletion({

    required  this.purgeAfter,

    required  this.workspacesDeleted,

     this.storeSubscriptions,
  });

  @JsonKey(
    
    name: r'purge_after',
    required: true,
    includeIfNull: false,
  )


  final DateTime purgeAfter;



      /// Workspaces you are the only owner of; they are deleted with you
  @JsonKey(
    
    name: r'workspaces_deleted',
    required: true,
    includeIfNull: false,
  )


  final List<String> workspacesDeleted;



      /// App Store and Google Play subscriptions of those workspaces that still renew. Deleting the account doesn't cancel them: only the buyer can, in the store
  @JsonKey(
    
    name: r'store_subscriptions',
    required: false,
    includeIfNull: false,
  )


  final List<StoreSubscriptionNotice>? storeSubscriptions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AccountDeletion &&
      other.purgeAfter == purgeAfter &&
      other.workspacesDeleted == workspacesDeleted &&
      other.storeSubscriptions == storeSubscriptions;

    @override
    int get hashCode =>
        purgeAfter.hashCode +
        workspacesDeleted.hashCode +
        storeSubscriptions.hashCode;

  factory AccountDeletion.fromJson(Map<String, dynamic> json) => _$AccountDeletionFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDeletionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

