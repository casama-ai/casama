// Settings reads the month's spend again each time it opens, as the Usage page does, so the two
// agree (the customer's build 108 Windows showed $18.99 beside $19.41).
import 'package:casama/features/settings/settings_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

void main() {
  testWidgets('opening Settings again reads the month again', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await setSize(tester, const Size(430, 2400));
    final backend = FakeBackend();
    final open = ValueNotifier(true);
    await tester.pumpWidget(
      harness(
        backend,
        ValueListenableBuilder<bool>(
          valueListenable: open,
          builder: (_, on, _) => on ? const SettingsScreen() : const SizedBox(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final first = backend.usageCalls;
    expect(first, greaterThan(0));
    open.value = false;
    await tester.pumpAndSettle();
    open.value = true;
    await tester.pumpAndSettle();
    expect(backend.usageCalls, greaterThan(first));
  });
}
