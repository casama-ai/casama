//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum LicenseEdition {
      @JsonValue(r'personal')
      personal(r'personal'),
      @JsonValue(r'trial')
      trial(r'trial'),
      @JsonValue(r'business')
      business(r'business');

  const LicenseEdition(this.value);

  final String value;

  @override
  String toString() => value;
}
