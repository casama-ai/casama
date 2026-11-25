//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:casama_api/src/model/health_pool.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'health.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Health {
  /// Returns a new [Health] instance.
  Health({

    required  this.status,

     this.checks,

     this.pool,

     this.slowPool,

     this.httpP95Ms,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final HealthStatusEnum status;



  @JsonKey(
    
    name: r'checks',
    required: false,
    includeIfNull: false,
  )


  final Map<String, String>? checks;



  @JsonKey(
    
    name: r'pool',
    required: false,
    includeIfNull: false,
  )


  final HealthPool? pool;



  @JsonKey(
    
    name: r'slow_pool',
    required: false,
    includeIfNull: false,
  )


  final HealthPool? slowPool;



  @JsonKey(
    
    name: r'http_p95_ms',
    required: false,
    includeIfNull: false,
  )


  final num? httpP95Ms;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Health &&
      other.status == status &&
      other.checks == checks &&
      other.pool == pool &&
      other.slowPool == slowPool &&
      other.httpP95Ms == httpP95Ms;

    @override
    int get hashCode =>
        status.hashCode +
        checks.hashCode +
        pool.hashCode +
        slowPool.hashCode +
        (httpP95Ms == null ? 0 : httpP95Ms.hashCode);

  factory Health.fromJson(Map<String, dynamic> json) => _$HealthFromJson(json);

  Map<String, dynamic> toJson() => _$HealthToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum HealthStatusEnum {
@JsonValue(r'ok')
ok(r'ok'),
@JsonValue(r'degraded')
degraded(r'degraded');

const HealthStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


