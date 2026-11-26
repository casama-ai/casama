//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum MoveState {
      @JsonValue(r'created')
      created(r'created'),
      @JsonValue(r'copying')
      copying(r'copying'),
      @JsonValue(r'pausing')
      pausing(r'pausing'),
      @JsonValue(r'finishing')
      finishing(r'finishing'),
      @JsonValue(r'importing')
      importing(r'importing'),
      @JsonValue(r'done')
      done(r'done'),
      @JsonValue(r'failed')
      failed(r'failed'),
      @JsonValue(r'cancelled')
      cancelled(r'cancelled');

  const MoveState(this.value);

  final String value;

  @override
  String toString() => value;
}
