//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum VendorBilling {
      @JsonValue(r'free')
      free(r'free'),
      @JsonValue(r'metered')
      metered(r'metered');

  const VendorBilling(this.value);

  final String value;

  @override
  String toString() => value;
}
