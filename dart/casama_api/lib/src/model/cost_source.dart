//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum CostSource {
      @JsonValue(r'metered')
      metered(r'metered'),
      @JsonValue(r'counted')
      counted(r'counted'),
      @JsonValue(r'fixed')
      fixed(r'fixed'),
      @JsonValue(r'estimated')
      estimated(r'estimated');

  const CostSource(this.value);

  final String value;

  @override
  String toString() => value;
}
