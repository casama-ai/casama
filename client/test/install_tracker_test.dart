import 'package:casama/core/install_tracker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The app's first open and first sign-in attempt on an install (D-537).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    InstallTracker.reset();
    SharedPreferences.setMockInitialValues({});
  });

  test('sends the first open once, with the Play click id', () async {
    final sent = <Map<String, Object?>>[];
    final prefs = await SharedPreferences.getInstance();
    Future<void> send(Map<String, Object?> b) async => sent.add(b);

    await InstallTracker.start(
      cloud: true,
      send: send,
      prefs: prefs,
      keychain: false,
      playReferrer: () async => 'utm_source=reddit&utm_medium=referral&utm_campaign=home&cv=abc12345abc12345',
    );
    expect(sent, hasLength(1));
    expect(sent.single['event'], 'first_open');
    expect(sent.single['install_id'], matches(RegExp(r'^[a-z0-9]{26}$')));
    expect(sent.single['click_id'], 'abc12345abc12345');
    expect(sent.single['source'], 'reddit');
    expect(sent.single.containsKey('reinstall'), isFalse);
    final id = InstallTracker.installId;

    // A later launch keeps the id and sends nothing.
    InstallTracker.reset();
    await InstallTracker.start(
      cloud: true,
      send: send,
      prefs: prefs,
      keychain: false,
      playReferrer: () async => null,
    );
    expect(sent, hasLength(1));
    expect(InstallTracker.installId, id);

    // The first sign-in attempt, once.
    await InstallTracker.signinStarted(prefs: prefs);
    await InstallTracker.signinStarted(prefs: prefs);
    expect(sent.where((b) => b['event'] == 'signin_started'), hasLength(1));
    expect(sent.last['install_id'], id);
  });

  test('a failed send tries again next launch', () async {
    final prefs = await SharedPreferences.getInstance();
    await InstallTracker.start(
      cloud: true,
      send: (_) async => throw Exception('offline'),
      prefs: prefs,
      keychain: false,
      playReferrer: () async => null,
    );
    final sent = <Map<String, Object?>>[];
    InstallTracker.reset();
    await InstallTracker.start(
      cloud: true,
      send: (b) async => sent.add(b),
      prefs: prefs,
      keychain: false,
      playReferrer: () async => null,
    );
    expect(sent, hasLength(1));
    expect(sent.single.containsKey('click_id'), isFalse);
  });
}
