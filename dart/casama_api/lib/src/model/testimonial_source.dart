//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TestimonialSource {
      @JsonValue(r'email')
      email(r'email'),
      @JsonValue(r'in_app')
      inApp(r'in_app'),
      @JsonValue(r'toolradar')
      toolradar(r'toolradar'),
      @JsonValue(r'app_store')
      appStore(r'app_store'),
      @JsonValue(r'play')
      play(r'play'),
      @JsonValue(r'other')
      other(r'other');

  const TestimonialSource(this.value);

  final String value;

  @override
  String toString() => value;
}
