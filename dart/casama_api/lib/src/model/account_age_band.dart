//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum AccountAgeBand {
      @JsonValue(r'under13')
      under13(r'under13'),
      @JsonValue(r'13to15')
      n13to15(r'13to15'),
      @JsonValue(r'16to17')
      n16to17(r'16to17'),
      @JsonValue(r'18plus')
      n18plus(r'18plus'),
      @JsonValue(r'declined')
      declined(r'declined');

  const AccountAgeBand(this.value);

  final String value;

  @override
  String toString() => value;
}
