//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/cloud_models_policy.dart';
import 'package:casama_api/src/model/cloud_models_fallback.dart';
import 'package:casama_api/src/model/cloud_link_status.dart';
import 'package:casama_api/src/model/cloud_models_state_status_error.dart';
import 'package:casama_api/src/model/cloud_models_state_memory_reindex.dart';
import 'package:casama_api/src/model/cloud_models_state_payer.dart';
import 'package:casama_api/src/model/cloud_models_state_me.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_state.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsState {
  /// Returns a new [CloudModelsState] instance.
  CloudModelsState({

    required  this.available,

    required  this.connected,

    required  this.canManage,

    required  this.payer,

    required  this.status,

    required  this.policy,

    required  this.fallback,

    required  this.embedding,

    required  this.me,

    required  this.memoryReindex,

    required  this.statusError,

    required  this.hasOwnKey,
  });

      /// False on Casama Cloud itself and on a server without a license in force
  @JsonKey(
    
    name: r'available',
    required: true,
    includeIfNull: false,
  )


  final bool available;



  @JsonKey(
    
    name: r'connected',
    required: true,
    includeIfNull: false,
  )


  final bool connected;



  @JsonKey(
    
    name: r'can_manage',
    required: true,
    includeIfNull: false,
  )


  final bool canManage;



  @JsonKey(
    
    name: r'payer',
    required: true,
    includeIfNull: true,
  )


  final CloudModelsStatePayer? payer;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: true,
  )


  final CloudLinkStatus? status;



  @JsonKey(
    
    name: r'policy',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsPolicy policy;



  @JsonKey(
    
    name: r'fallback',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsFallback fallback;



  @JsonKey(
    
    name: r'embedding',
    required: true,
    includeIfNull: false,
  )


  final bool embedding;



  @JsonKey(
    
    name: r'me',
    required: true,
    includeIfNull: false,
  )


  final CloudModelsStateMe me;



  @JsonKey(
    
    name: r'memory_reindex',
    required: true,
    includeIfNull: true,
  )


  final CloudModelsStateMemoryReindex? memoryReindex;



  @JsonKey(
    
    name: r'status_error',
    required: true,
    includeIfNull: true,
  )


  final CloudModelsStateStatusError? statusError;



      /// A working own chat key exists on this server
  @JsonKey(
    
    name: r'has_own_key',
    required: true,
    includeIfNull: false,
  )


  final bool hasOwnKey;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsState &&
      other.available == available &&
      other.connected == connected &&
      other.canManage == canManage &&
      other.payer == payer &&
      other.status == status &&
      other.policy == policy &&
      other.fallback == fallback &&
      other.embedding == embedding &&
      other.me == me &&
      other.memoryReindex == memoryReindex &&
      other.statusError == statusError &&
      other.hasOwnKey == hasOwnKey;

    @override
    int get hashCode =>
        available.hashCode +
        connected.hashCode +
        canManage.hashCode +
        (payer == null ? 0 : payer.hashCode) +
        (status == null ? 0 : status.hashCode) +
        policy.hashCode +
        fallback.hashCode +
        embedding.hashCode +
        me.hashCode +
        (memoryReindex == null ? 0 : memoryReindex.hashCode) +
        (statusError == null ? 0 : statusError.hashCode) +
        hasOwnKey.hashCode;

  factory CloudModelsState.fromJson(Map<String, dynamic> json) => _$CloudModelsStateFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

