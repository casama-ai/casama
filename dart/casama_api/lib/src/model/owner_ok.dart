//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_ok.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OwnerOk {
  /// Returns a new [OwnerOk] instance.
  OwnerOk({

    required  this.ok,
  });

  @JsonKey(
    
    name: r'ok',
    required: true,
    includeIfNull: false,
  )


  final bool ok;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OwnerOk &&
      other.ok == ok;

    @override
    int get hashCode =>
        ok.hashCode;

  factory OwnerOk.fromJson(Map<String, dynamic> json) => _$OwnerOkFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerOkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

