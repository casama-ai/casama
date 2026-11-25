//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TestimonialState {
      @JsonValue(r'draft')
      draft(r'draft'),
      @JsonValue(r'live')
      live(r'live'),
      @JsonValue(r'hidden')
      hidden(r'hidden'),
      @JsonValue(r'withdrawn')
      withdrawn(r'withdrawn');

  const TestimonialState(this.value);

  final String value;

  @override
  String toString() => value;
}
