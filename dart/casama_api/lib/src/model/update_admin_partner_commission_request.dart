//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_admin_partner_commission_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateAdminPartnerCommissionRequest {
  /// Returns a new [UpdateAdminPartnerCommissionRequest] instance.
  UpdateAdminPartnerCommissionRequest({

    required  this.action,

     this.note,
  });

  @JsonKey(
    
    name: r'action',
    required: true,
    includeIfNull: false,
  )


  final UpdateAdminPartnerCommissionRequestActionEnum action;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateAdminPartnerCommissionRequest &&
      other.action == action &&
      other.note == note;

    @override
    int get hashCode =>
        action.hashCode +
        note.hashCode;

  factory UpdateAdminPartnerCommissionRequest.fromJson(Map<String, dynamic> json) => _$UpdateAdminPartnerCommissionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAdminPartnerCommissionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum UpdateAdminPartnerCommissionRequestActionEnum {
@JsonValue(r'hold')
hold(r'hold'),
@JsonValue(r'release')
release(r'release'),
@JsonValue(r'void')
void_(r'void');

const UpdateAdminPartnerCommissionRequestActionEnum(this.value);

final String value;

@override
String toString() => value;
}


