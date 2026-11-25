//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_live_country.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminLiveCountry {
  /// Returns a new [AdminLiveCountry] instance.
  AdminLiveCountry({

    required  this.country,

    required  this.users,
  });

  @JsonKey(
    
    name: r'country',
    required: true,
    includeIfNull: false,
  )


  final String country;



  @JsonKey(
    
    name: r'users',
    required: true,
    includeIfNull: false,
  )


  final int users;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminLiveCountry &&
      other.country == country &&
      other.users == users;

    @override
    int get hashCode =>
        country.hashCode +
        users.hashCode;

  factory AdminLiveCountry.fromJson(Map<String, dynamic> json) => _$AdminLiveCountryFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLiveCountryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

