import 'package:flutter/foundation.dart';

/// Moving a workspace between servers ships behind the Casama Cloud for self-hosters build switch
/// (docs/SELFHOST-CLOUD-MODELS-PLAN.md §13): compiled in with
/// `--dart-define=CASAMA_CLOUD_MODELS=true`, off in store builds until the plan's release.
const bool kMoveSwitch = bool.fromEnvironment(
  'CASAMA_CLOUD_MODELS',
  defaultValue: kReleaseMode || kProfileMode,
);

/// Tests turn it on without a build define.
bool? debugMoveOn;

bool get moveOn => debugMoveOn ?? kMoveSwitch;

/// How long the old server passes webhooks on after a move (MOVE_FORWARD_DAYS on the server).
const moveForwardDays = 30;
