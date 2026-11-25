//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/admin_live_country.dart';
import 'package:casama_api/src/model/admin_live_platform.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_live_ga4.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminLiveGa4 {
  /// Returns a new [AdminLiveGa4] instance.
  AdminLiveGa4({

    required  this.configured,

    required  this.error,

    required  this.activeUsers,

    required  this.activeUsers5m,

    required  this.byPlatform,

    required  this.byCountry,

    required  this.byMinute,

    required  this.fetchedAt,

    required  this.cached,
  });

  @JsonKey(
    
    name: r'configured',
    required: true,
    includeIfNull: false,
  )


  final bool configured;



  @JsonKey(
    
    name: r'error',
    required: true,
    includeIfNull: true,
  )


  final String? error;



  @JsonKey(
    
    name: r'active_users',
    required: true,
    includeIfNull: false,
  )


  final int activeUsers;



  @JsonKey(
    
    name: r'active_users_5m',
    required: true,
    includeIfNull: false,
  )


  final int activeUsers5m;



  @JsonKey(
    
    name: r'by_platform',
    required: true,
    includeIfNull: false,
  )


  final List<AdminLivePlatform> byPlatform;



  @JsonKey(
    
    name: r'by_country',
    required: true,
    includeIfNull: false,
  )


  final List<AdminLiveCountry> byCountry;



  @JsonKey(
    
    name: r'by_minute',
    required: true,
    includeIfNull: false,
  )


  final List<int> byMinute;



  @JsonKey(
    
    name: r'fetched_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime fetchedAt;



  @JsonKey(
    
    name: r'cached',
    required: true,
    includeIfNull: false,
  )


  final bool cached;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminLiveGa4 &&
      other.configured == configured &&
      other.error == error &&
      other.activeUsers == activeUsers &&
      other.activeUsers5m == activeUsers5m &&
      other.byPlatform == byPlatform &&
      other.byCountry == byCountry &&
      other.byMinute == byMinute &&
      other.fetchedAt == fetchedAt &&
      other.cached == cached;

    @override
    int get hashCode =>
        configured.hashCode +
        (error == null ? 0 : error.hashCode) +
        activeUsers.hashCode +
        activeUsers5m.hashCode +
        byPlatform.hashCode +
        byCountry.hashCode +
        byMinute.hashCode +
        fetchedAt.hashCode +
        cached.hashCode;

  factory AdminLiveGa4.fromJson(Map<String, dynamic> json) => _$AdminLiveGa4FromJson(json);

  Map<String, dynamic> toJson() => _$AdminLiveGa4ToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

