import 'package:flutter/foundation.dart';
import 'package:flutter/semantics.dart';

/// Keeps Flutter's accessibility tree on for the life of the Windows app (D-616).
///
/// Flutter builds the tree only when a screen reader asks for it. UI Automation clients such as
/// Inspect, test tools and some assistive apps never ask, so they saw one bare "FLUTTERVIEW"
/// (the customer's build 108 round, L16). Elsewhere the platform asks as it should, so this
/// returns null.
SemanticsHandle? keepWindowsSemanticsOn() {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.windows) return null;
  return SemanticsBinding.instance.ensureSemantics();
}
