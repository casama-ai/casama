//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum LicenseFeature {
      @JsonValue(r'audit_export')
      auditExport(r'audit_export'),
      @JsonValue(r'sso')
      sso(r'sso'),
      @JsonValue(r'advanced_roles')
      advancedRoles(r'advanced_roles'),
      @JsonValue(r'audit_forwarding')
      auditForwarding(r'audit_forwarding');

  const LicenseFeature(this.value);

  final String value;

  @override
  String toString() => value;
}
