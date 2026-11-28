import 'package:casama/features/admin/admin_screen.dart';
import 'package:casama/features/admin/ui/admin_ui.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';
import 'admin_test_helpers.dart';

void main() {
  testWidgets(
    'the owner sees the server filling up and when it will be full (D-252)',
    (tester) async {
      await setSize(tester, const Size(900, 1600));
      final backend = FakeBackend()
        ..capacity = ServerCapacity(
          budgetMb: 9216,
          latest: ServerCapacityLatest(
            at: '2026-11-13T10:00:00Z',
            memTotalMb: 11960,
            memAvailableMb: 5000,
            load1: 1.2,
            cpus: 6,
            diskUsedPct: 41,
            computersRunning: 2,
            computersMemMb: 6144,
          ),
          days: [
            for (var i = 0; i < 10; i++)
              ServerCapacityDaysInner(
                day: '2026-11-0$i',
                peakComputersMemMb: 2048 + i * 400,
                peakComputers: 1,
                minAvailableMb: 5000,
                peakLoad1: 1,
              ),
          ],
          refusals30d: 2,
          fullInWeeks: 3.4,
          alerts: const [],
        );
      await tester.pumpWidget(harness(backend, const AdminScreen()));
      await tester.pumpAndSettle();
      await unlockAdmin(tester);
      await tester.ensureVisible(find.byKey(const Key('capacityCard')));
      await tester.pumpAndSettle();
      expect(find.text('Server capacity'), findsOneWidget);
      expect(find.text('Computers: 6.0 GB of 9.0 GB'), findsOneWidget);
      expect(find.text('Full in about 3 weeks at this trend'), findsOneWidget);
      expect(find.text('2 computer starts refused in 30 days'), findsOneWidget);
      // The memory gauge is the console's shared meter, amber at two thirds full.
      final meter = tester.widget<AdminMeter>(find.byKey(const Key('capacityMeter')));
      expect(meter.fraction, closeTo(6144 / 9216, 0.001));
      expect(meter.tone, AdminTone.warning);
    },
  );

  testWidgets(
    'the alarm shows its level and snoozes for an hour or while upgrading (D-601)',
    (tester) async {
      await setSize(tester, const Size(900, 1600));
      final backend = FakeBackend()
        ..capacity = ServerCapacity(
          budgetMb: 9216,
          latest: ServerCapacityLatest(
            at: '2026-11-27T10:00:00Z',
            memTotalMb: 11960,
            memAvailableMb: 2500,
            load1: 2.1,
            cpus: 6,
            diskUsedPct: 41,
            computersRunning: 2,
            computersMemMb: 8300,
          ),
          days: const [],
          refusals30d: 0,
          fullInWeeks: null,
          alerts: const [],
          alarm: CapacityAlarm(
            level: 90,
            startedAt: '2026-11-27T09:50:00Z',
            levelSince: '2026-11-27T09:50:00Z',
            lastPushAt: '2026-11-27T09:50:00Z',
            snoozedUntil: null,
            endedAt: null,
          ),
        );
      await tester.pumpWidget(harness(backend, const AdminScreen()));
      await tester.pumpAndSettle();
      await unlockAdmin(tester);
      await tester.ensureVisible(find.byKey(const Key('capacityAlarm')));
      await tester.pumpAndSettle();
      expect(find.text('Alarm: 90% full. Upgrade today'), findsOneWidget);
      expect(find.text('A push every 15 minutes until it drops back'), findsOneWidget);

      await tester.tap(find.byKey(const Key('capacityUpgrading')));
      await tester.pumpAndSettle();
      expect(backend.capacitySnoozes, [120]);
      expect(find.textContaining('Snoozed until'), findsOneWidget);

      await tester.ensureVisible(find.byKey(const Key('capacitySnoozeHour')));
      await tester.tap(find.byKey(const Key('capacitySnoozeHour')));
      await tester.pumpAndSettle();
      expect(backend.capacitySnoozes, [120, 60]);
    },
  );

  testWidgets('no alarm, no banner', (tester) async {
    await setSize(tester, const Size(900, 1600));
    final backend = FakeBackend()
      ..capacity = ServerCapacity(
        budgetMb: 9216,
        latest: null,
        days: const [],
        refusals30d: 0,
        fullInWeeks: null,
        alerts: const [],
        alarm: CapacityAlarm(
          level: 0,
          startedAt: null,
          levelSince: null,
          lastPushAt: null,
          snoozedUntil: null,
          endedAt: null,
        ),
      );
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await tester.ensureVisible(find.byKey(const Key('capacityCard')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('capacityAlarm')), findsNothing);
  });

  testWidgets('before the first sample, the card says when one arrives', (tester) async {
    await setSize(tester, const Size(900, 1600));
    final backend = FakeBackend();
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await tester.ensureVisible(find.byKey(const Key('capacityCard')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('capacityNoData')), findsOneWidget);
    expect(find.byKey(const Key('capacityMeter')), findsNothing);
  });

  testWidgets('shows Phase 0 computer wake, OOM, shell program, and file-job metrics (D-629/D-630)', (
    tester,
  ) async {
    await setSize(tester, const Size(900, 1600));
    final backend = FakeBackend()
      ..capacity = ServerCapacity(
        budgetMb: 9216,
        latest: ServerCapacityLatest(
          at: '2026-11-28T10:00:00Z',
          memTotalMb: 11960,
          memAvailableMb: 5000,
          load1: 0.8,
          cpus: 6,
          diskUsedPct: 35,
          computersRunning: 1,
          computersMemMb: 1024,
        ),
        days: const [],
        refusals30d: 0,
        fullInWeeks: null,
        alerts: const [],
        computerMetrics: ServerCapacityComputerMetrics(
          wakeTimes: [
            ServerCapacityComputerMetricsWakeTimesInner(
              mode: 'warm',
              count: 14,
              p50Ms: 1200,
              p90Ms: 2400,
            ),
          ],
          browserOoms7d: 2,
          wakesByCaller7d: [
            ServerCapacityComputerMetricsWakesByCaller7dInner(
              caller: 'browser.open',
              count: 9,
            ),
          ],
          shellPrograms7d: [
            ServerCapacityComputerMetricsShellPrograms7dInner(
              program: 'ffmpeg',
              count: 6,
            ),
            ServerCapacityComputerMetricsShellPrograms7dInner(
              program: 'qpdf',
              count: 3,
            ),
          ],
          jobBoxes7d: ServerCapacityComputerMetricsJobBoxes7d(
            count: 12,
            p50Ms: 850,
            p90Ms: 1900,
          ),
        ),
      );
    await tester.pumpWidget(harness(backend, const AdminScreen()));
    await tester.pumpAndSettle();
    await unlockAdmin(tester);
    await tester.ensureVisible(find.byKey(const Key('capacityComputerMetrics')));
    await tester.pumpAndSettle();
    expect(find.text('Computers & file jobs (7 days)'), findsOneWidget);
    expect(find.text('warm wake: 1.2s p50 / 2.4s p90 (14)'), findsOneWidget);
    expect(find.text('File jobs: 12 (850ms p50 / 1.9s p90)'), findsOneWidget);
    expect(find.text('Browser out-of-memory restarts: 2'), findsOneWidget);
    expect(find.text('Wakes by caller: browser.open (9)'), findsOneWidget);
    expect(find.text('Top shell programs: ffmpeg (6), qpdf (3)'), findsOneWidget);
  });
}
