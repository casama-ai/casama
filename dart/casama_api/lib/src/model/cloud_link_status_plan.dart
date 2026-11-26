//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status_plan.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatusPlan {
  /// Returns a new [CloudLinkStatusPlan] instance.
  CloudLinkStatusPlan({

    required  this.code,

    required  this.name,

    required  this.paid,

     this.ended,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'paid',
    required: true,
    includeIfNull: false,
  )


  final bool paid;



      /// The payer had a paid plan and it ended (not just never paid)
  @JsonKey(
    
    name: r'ended',
    required: false,
    includeIfNull: false,
  )


  final bool? ended;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatusPlan &&
      other.code == code &&
      other.name == name &&
      other.paid == paid &&
      other.ended == ended;

    @override
    int get hashCode =>
        code.hashCode +
        name.hashCode +
        paid.hashCode +
        ended.hashCode;

  factory CloudLinkStatusPlan.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusPlanFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusPlanToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

