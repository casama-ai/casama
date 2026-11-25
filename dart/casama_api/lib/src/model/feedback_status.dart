//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum FeedbackStatus {
      @JsonValue(r'new')
      new_(r'new'),
      @JsonValue(r'read')
      read(r'read'),
      @JsonValue(r'done')
      done(r'done');

  const FeedbackStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
