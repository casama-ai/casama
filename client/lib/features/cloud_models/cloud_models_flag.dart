import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Casama Cloud models' build switch (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.4.1): on only in builds
/// made with `--dart-define=CASAMA_CLOUD_MODELS=true` (`scripts/cloud-models-switch.sh on` prints
/// it). Both stores forbid hidden features switched on later, so store builds stay off until the
/// release whose review notes describe it. Never a remote flag.
// On by default in release and profile builds (D-633); `--dart-define=CASAMA_CLOUD_MODELS=false`
// leaves it out. Debug runs and tests stay off unless they pass the define.
const kCloudModels = bool.fromEnvironment(
  'CASAMA_CLOUD_MODELS',
  defaultValue: kReleaseMode || kProfileMode,
);

/// Whether the Cloud models code is in this build at all. Every entry point checks this first, as
/// a constant, so a release build without [kCloudModels] drops the whole folder. Debug builds (and
/// so tests) keep the code; [cloudModelsBuildProvider] still says no unless a test overrides it.
const kCloudModelsCode = kCloudModels || kDebugMode;

/// Whether this build has Casama Cloud models ([kCloudModels]); tests override it.
final cloudModelsBuildProvider = Provider<bool>((ref) => kCloudModels);
