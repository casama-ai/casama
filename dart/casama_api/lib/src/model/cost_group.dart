//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum CostGroup {
      @JsonValue(r'service')
      service(r'service'),
      @JsonValue(r'key')
      key(r'key'),
      @JsonValue(r'app')
      app(r'app'),
      @JsonValue(r'feature')
      feature(r'feature'),
      @JsonValue(r'model')
      model(r'model'),
      @JsonValue(r'workspace')
      workspace(r'workspace');

  const CostGroup(this.value);

  final String value;

  @override
  String toString() => value;
}
