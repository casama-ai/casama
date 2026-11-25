//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_alert_kind.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerAlertKind {
  /// Returns a new [OwnerAlertKind] instance.
  OwnerAlertKind({

    required  this.kind,

    required  this.on_,

    required  this.defaultOn,
  });

  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final String kind;



  @JsonKey(
    
    name: r'on',
    required: true,
    includeIfNull: false,
  )


  final bool on_;



  @JsonKey(
    
    name: r'default_on',
    required: true,
    includeIfNull: false,
  )


  final bool defaultOn;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerAlertKind &&
      other.kind == kind &&
      other.on_ == on_ &&
      other.defaultOn == defaultOn;

    @override
    int get hashCode =>
        kind.hashCode +
        on_.hashCode +
        defaultOn.hashCode;

  factory OwnerAlertKind.fromJson(Map<String, dynamic> json) => _$OwnerAlertKindFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerAlertKindToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

