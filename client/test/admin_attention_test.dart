import 'package:casama/features/admin/admin_attention.dart';
import 'package:casama/features/admin/admin_nav.dart';
import 'package:casama/features/admin/overview_tab.dart';
import 'package:casama/features/admin/ui/admin_ui.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

FakeBackend _withCounts() => FakeBackend()
  ..attention = AdminAttention(
    openTickets: 2,
    newReports: 3,
    waitlistWaiting: 40,
    abuse24h: 1,
    domainOrdersPending: 0,
    failedRuns24h: 5,
  );

Future<Map<AdminSection, AdminBadge>> _badges(
  WidgetTester tester,
  FakeBackend backend,
) async {
  late Map<AdminSection, AdminBadge> badges;
  await tester.pumpWidget(
    harness(
      backend,
      Consumer(
        builder: (context, ref, _) {
          badges = ref.watch(adminBadgesProvider);
          return const SizedBox();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return badges;
}

void main() {
  testWidgets('the server counts become section badges', (tester) async {
    final badges = await _badges(tester, _withCounts());
    expect(badges[AdminSection.support]?.count, 2);
    expect(badges[AdminSection.support]?.tone, AdminTone.warning);
    expect(badges[AdminSection.reports]?.count, 3);
    expect(badges[AdminSection.reports]?.tone, AdminTone.warning);
    expect(badges[AdminSection.waitlist]?.count, 40);
    expect(badges[AdminSection.waitlist]?.tone, AdminTone.info);
    expect(badges[AdminSection.abuse]?.count, 1);
    expect(badges[AdminSection.abuse]?.tone, AdminTone.negative);
    // Zero gives no badge, and failed runs stay with the overview.
    expect(badges.containsKey(AdminSection.domains), isFalse);
    expect(badges[AdminSection.overview]?.count, 46);
    expect(badges[AdminSection.overview]?.tone, AdminTone.negative);
  });

  testWidgets('all zeros give no badges', (tester) async {
    final badges = await _badges(tester, FakeBackend());
    expect(badges, isEmpty);
  });

  testWidgets('an older server without the call gives no badges', (
    tester,
  ) async {
    final badges = await _badges(
      tester,
      _withCounts()..attentionError = Exception('404'),
    );
    expect(badges, isEmpty);
  });

  testWidgets('the overview lists what needs attention from the counts', (
    tester,
  ) async {
    await setSize(tester, const Size(1200, 1600));
    await tester.pumpWidget(
      harness(_withCounts(), const Scaffold(body: OverviewTab())),
    );
    await tester.pumpAndSettle();
    for (final key in ['support', 'reports', 'waitlist', 'abuse', 'runs']) {
      expect(
        find.byKey(Key('adminAttention-$key')),
        findsOneWidget,
        reason: key,
      );
    }
    expect(find.byKey(const Key('adminAttention-domains')), findsNothing);
    expect(find.text('2 open help requests'), findsOneWidget);
    expect(find.text('40 people waiting to get in'), findsOneWidget);
  });

  testWidgets('the overview shows no count rows when the call fails', (
    tester,
  ) async {
    await setSize(tester, const Size(1200, 1600));
    await tester.pumpWidget(
      harness(
        _withCounts()..attentionError = Exception('404'),
        const Scaffold(body: OverviewTab()),
      ),
    );
    await tester.pumpAndSettle();
    for (final key in ['support', 'reports', 'waitlist', 'abuse', 'domains']) {
      expect(find.byKey(Key('adminAttention-$key')), findsNothing, reason: key);
    }
    // The overview's own failed-run count still shows.
    expect(find.byKey(const Key('adminAttention-runs')), findsOneWidget);
  });
}
