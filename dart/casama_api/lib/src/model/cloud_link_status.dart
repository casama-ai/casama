//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_link_status_included.dart';
import 'package:casama_api/src/model/cloud_link_status_seats.dart';
import 'package:casama_api/src/model/cloud_link_status_plan.dart';
import 'package:casama_api/src/model/cloud_link_status_jobs.dart';
import 'package:casama_api/src/model/cloud_link_status_today.dart';
import 'package:casama_api/src/model/cloud_models_state_payer.dart';
import 'package:casama_api/src/model/cloud_link_status_trial.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatus {
  /// Returns a new [CloudLinkStatus] instance.
  CloudLinkStatus({

     this.scopes,

     this.payer,

     this.plan,

     this.modelsAllowed,

     this.creditsUsd,

     this.included,

     this.today,

     this.seats,

     this.trial,

     this.jobs,
  });

  @JsonKey(
    
    name: r'scopes',
    required: false,
    includeIfNull: false,
  )


  final List<String>? scopes;



  @JsonKey(
    
    name: r'payer',
    required: false,
    includeIfNull: false,
  )


  final CloudModelsStatePayer? payer;



  @JsonKey(
    
    name: r'plan',
    required: false,
    includeIfNull: false,
  )


  final CloudLinkStatusPlan? plan;



  @JsonKey(
    
    name: r'models_allowed',
    required: false,
    includeIfNull: false,
  )


  final bool? modelsAllowed;



  @JsonKey(
    
    name: r'credits_usd',
    required: false,
    includeIfNull: false,
  )


  final num? creditsUsd;



  @JsonKey(
    
    name: r'included',
    required: false,
    includeIfNull: false,
  )


  final CloudLinkStatusIncluded? included;



  @JsonKey(
    
    name: r'today',
    required: false,
    includeIfNull: false,
  )


  final CloudLinkStatusToday? today;



  @JsonKey(
    
    name: r'seats',
    required: false,
    includeIfNull: false,
  )


  final CloudLinkStatusSeats? seats;



  @JsonKey(
    
    name: r'trial',
    required: false,
    includeIfNull: false,
  )


  final CloudLinkStatusTrial? trial;



  @JsonKey(
    
    name: r'jobs',
    required: false,
    includeIfNull: false,
  )


  final CloudLinkStatusJobs? jobs;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatus &&
      other.scopes == scopes &&
      other.payer == payer &&
      other.plan == plan &&
      other.modelsAllowed == modelsAllowed &&
      other.creditsUsd == creditsUsd &&
      other.included == included &&
      other.today == today &&
      other.seats == seats &&
      other.trial == trial &&
      other.jobs == jobs;

    @override
    int get hashCode =>
        scopes.hashCode +
        (payer == null ? 0 : payer.hashCode) +
        (plan == null ? 0 : plan.hashCode) +
        modelsAllowed.hashCode +
        creditsUsd.hashCode +
        (included == null ? 0 : included.hashCode) +
        today.hashCode +
        (seats == null ? 0 : seats.hashCode) +
        (trial == null ? 0 : trial.hashCode) +
        jobs.hashCode;

  factory CloudLinkStatus.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

