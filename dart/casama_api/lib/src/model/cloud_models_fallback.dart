//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cloud_models_fallback.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CloudModelsFallback {
  /// Returns a new [CloudModelsFallback] instance.
  CloudModelsFallback({

    required  this.toOwn,

    required  this.fromOwn,
  });

      /// Casama Cloud refused or can't be reached: use an own key
  @JsonKey(
    
    name: r'to_own',
    required: true,
    includeIfNull: false,
  )


  final bool toOwn;



      /// An own key failed: use Casama Cloud
  @JsonKey(
    
    name: r'from_own',
    required: true,
    includeIfNull: false,
  )


  final bool fromOwn;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CloudModelsFallback &&
      other.toOwn == toOwn &&
      other.fromOwn == fromOwn;

    @override
    int get hashCode =>
        toOwn.hashCode +
        fromOwn.hashCode;

  factory CloudModelsFallback.fromJson(Map<String, dynamic> json) => _$CloudModelsFallbackFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelsFallbackToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

