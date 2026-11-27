//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum SuggestionKind {
      @JsonValue(r'do')
      do_(r'do'),
      @JsonValue(r'answer')
      answer(r'answer'),
      @JsonValue(r'turn_on')
      turnOn(r'turn_on'),
      @JsonValue(r'remind')
      remind(r'remind'),
      @JsonValue(r'look')
      look(r'look');

  const SuggestionKind(this.value);

  final String value;

  @override
  String toString() => value;
}
