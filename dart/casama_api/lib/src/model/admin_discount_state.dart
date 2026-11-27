//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum AdminDiscountState {
      @JsonValue(r'live')
      live(r'live'),
      @JsonValue(r'scheduled')
      scheduled(r'scheduled'),
      @JsonValue(r'used_up')
      usedUp(r'used_up'),
      @JsonValue(r'ended')
      ended(r'ended'),
      @JsonValue(r'off')
      off(r'off');

  const AdminDiscountState(this.value);

  final String value;

  @override
  String toString() => value;
}
