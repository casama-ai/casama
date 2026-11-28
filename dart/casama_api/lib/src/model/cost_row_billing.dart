//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum CostRowBilling {
      @JsonValue(r'free')
      free(r'free'),
      @JsonValue(r'metered')
      metered(r'metered'),
      @JsonValue(r'own_servers')
      ownServers(r'own_servers');

  const CostRowBilling(this.value);

  final String value;

  @override
  String toString() => value;
}
