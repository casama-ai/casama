//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// auto: the bot picks per action, its own computer unless it says otherwise. bot_computer: only the bot's own computer; yours isn't offered. my_computer: your computer unless the bot names its own
enum PlaceMode {
          /// auto: the bot picks per action, its own computer unless it says otherwise. bot_computer: only the bot's own computer; yours isn't offered. my_computer: your computer unless the bot names its own
      @JsonValue(r'auto')
      auto(r'auto'),
          /// auto: the bot picks per action, its own computer unless it says otherwise. bot_computer: only the bot's own computer; yours isn't offered. my_computer: your computer unless the bot names its own
      @JsonValue(r'bot_computer')
      botComputer(r'bot_computer'),
          /// auto: the bot picks per action, its own computer unless it says otherwise. bot_computer: only the bot's own computer; yours isn't offered. my_computer: your computer unless the bot names its own
      @JsonValue(r'my_computer')
      myComputer(r'my_computer');

  const PlaceMode(this.value);

  final String value;

  @override
  String toString() => value;
}
