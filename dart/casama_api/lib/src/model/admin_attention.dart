//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_attention.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminAttention {
  /// Returns a new [AdminAttention] instance.
  AdminAttention({

    required  this.openTickets,

    required  this.newReports,

    required  this.waitlistWaiting,

    required  this.abuse24h,

    required  this.domainOrdersPending,

    required  this.failedRuns24h,
  });

      /// Support tickets still open
  @JsonKey(
    
    name: r'open_tickets',
    required: true,
    includeIfNull: false,
  )


  final int openTickets;



      /// Content reports nobody has reviewed yet
  @JsonKey(
    
    name: r'new_reports',
    required: true,
    includeIfNull: false,
  )


  final int newReports;



      /// Waitlist entries waiting and not yet queued to be let in
  @JsonKey(
    
    name: r'waitlist_waiting',
    required: true,
    includeIfNull: false,
  )


  final int waitlistWaiting;



      /// Abuse events in the last 24 hours, unsuspensions left out
  @JsonKey(
    
    name: r'abuse_24h',
    required: true,
    includeIfNull: false,
  )


  final int abuse24h;



      /// Domain orders that need the owner: approval, a retry, or a stuck refund
  @JsonKey(
    
    name: r'domain_orders_pending',
    required: true,
    includeIfNull: false,
  )


  final int domainOrdersPending;



      /// As in the admin overview
  @JsonKey(
    
    name: r'failed_runs_24h',
    required: true,
    includeIfNull: false,
  )


  final int failedRuns24h;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminAttention &&
      other.openTickets == openTickets &&
      other.newReports == newReports &&
      other.waitlistWaiting == waitlistWaiting &&
      other.abuse24h == abuse24h &&
      other.domainOrdersPending == domainOrdersPending &&
      other.failedRuns24h == failedRuns24h;

    @override
    int get hashCode =>
        openTickets.hashCode +
        newReports.hashCode +
        waitlistWaiting.hashCode +
        abuse24h.hashCode +
        domainOrdersPending.hashCode +
        failedRuns24h.hashCode;

  factory AdminAttention.fromJson(Map<String, dynamic> json) => _$AdminAttentionFromJson(json);

  Map<String, dynamic> toJson() => _$AdminAttentionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

