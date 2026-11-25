//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_live_platform.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminLivePlatform {
  /// Returns a new [AdminLivePlatform] instance.
  AdminLivePlatform({

    required  this.platform,

    required  this.users,
  });

  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final String platform;



  @JsonKey(
    
    name: r'users',
    required: true,
    includeIfNull: false,
  )


  final int users;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminLivePlatform &&
      other.platform == platform &&
      other.users == users;

    @override
    int get hashCode =>
        platform.hashCode +
        users.hashCode;

  factory AdminLivePlatform.fromJson(Map<String, dynamic> json) => _$AdminLivePlatformFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLivePlatformToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

