import 'package:casama/features/computer/computer_screen.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

/// Warm sleep (D-574): a computer waking from its archive says "Restoring files…", because that
/// takes a minute or more; one waking on files kept on disk just says Starting.
Computer _computer({
  ComputerState state = ComputerState.starting,
  bool hasSnapshot = true,
  bool? homeKept,
  ComputerKindEnum kind = ComputerKindEnum.team,
}) => Computer(
  id: '11111111-1111-4111-8111-111111111111',
  orgId: '22222222-2222-4222-8222-222222222222',
  kind: kind,
  name: 'Team computer',
  ownerBotId: null,
  lastActiveAt: null,
  error: null,
  provider: kind == ComputerKindEnum.local ? 'local' : 'docker',
  profile: ComputerProfileEnum.desktop,
  state: state,
  size: ComputerSize(cpus: 4),
  hasSnapshot: hasSnapshot,
  homeKept: homeKept,
  maxDesktops: 1,
  createdAt: DateTime(2026),
);

void main() {
  test(
    'restoring only when waking from the archive, never from a kept home',
    () {
      expect(computerRestoring(_computer(homeKept: false)), isTrue);
      expect(
        computerRestoring(
          _computer(state: ComputerState.provisioning, homeKept: false),
        ),
        isTrue,
      );
      // Its files are still on disk: a few seconds, plain Starting.
      expect(computerRestoring(_computer(homeKept: true)), isFalse);
      // An older server doesn't say: no guess.
      expect(computerRestoring(_computer()), isFalse);
      // Nothing to restore.
      expect(
        computerRestoring(_computer(hasSnapshot: false, homeKept: false)),
        isFalse,
      );
      // Running, or asleep: not waking.
      expect(
        computerRestoring(
          _computer(state: ComputerState.running, homeKept: false),
        ),
        isFalse,
      );
      expect(
        computerRestoring(
          _computer(state: ComputerState.sleeping, homeKept: false),
        ),
        isFalse,
      );
      // A person's own computer never restores.
      expect(
        computerRestoring(
          _computer(kind: ComputerKindEnum.local, homeKept: false),
        ),
        isFalse,
      );
    },
  );
}
