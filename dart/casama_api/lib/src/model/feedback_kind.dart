//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum FeedbackKind {
      @JsonValue(r'idea')
      idea(r'idea'),
      @JsonValue(r'like')
      like(r'like'),
      @JsonValue(r'dislike')
      dislike(r'dislike'),
      @JsonValue(r'confusing')
      confusing(r'confusing');

  const FeedbackKind(this.value);

  final String value;

  @override
  String toString() => value;
}
