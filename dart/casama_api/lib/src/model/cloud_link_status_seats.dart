//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_link_status_seats.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudLinkStatusSeats {
  /// Returns a new [CloudLinkStatusSeats] instance.
  CloudLinkStatusSeats({

    required  this.plan,

    required  this.used,
  });

  @JsonKey(
    
    name: r'plan',
    required: true,
    includeIfNull: false,
  )


  final num plan;



  @JsonKey(
    
    name: r'used',
    required: true,
    includeIfNull: false,
  )


  final num used;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudLinkStatusSeats &&
      other.plan == plan &&
      other.used == used;

    @override
    int get hashCode =>
        plan.hashCode +
        used.hashCode;

  factory CloudLinkStatusSeats.fromJson(Map<String, dynamic> json) => _$CloudLinkStatusSeatsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudLinkStatusSeatsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

