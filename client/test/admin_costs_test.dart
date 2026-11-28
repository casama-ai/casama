// The admin's Costs tab (docs/COST-BREAKDOWN-PLAN.md §5): tiles, chart, grouping, filters,
// sorting, the detail beside the table and as a page, every state, and what a screen reader hears.
import 'dart:async';

import 'package:casama/core/backend.dart';
import 'package:casama/features/admin/admin_screen.dart';
import 'package:casama/features/admin/admin_nav.dart';
import 'package:casama/features/admin/costs/cost_colors.dart';
import 'package:casama/features/admin/costs/cost_controls.dart';
import 'package:casama/features/admin/costs/cost_format.dart';
import 'package:casama/features/admin/costs/cost_view.dart';
import 'package:casama/features/admin/costs/costs_tab.dart';
import 'package:casama/features/admin/vendors_tab.dart';
import 'package:casama/l10n/generated/app_localizations_en.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'admin_costs_fixtures.dart';
import 'admin_test_helpers.dart';
import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

const _wide = Size(1400, 2400);
const _phone = Size(390, 2400);

/// Answers only when [gate] is opened, so a test can look at what shows while a view loads.
class _Gated extends FakeBackend {
  Completer<void>? gate;

  @override
  Future<AdminCosts> adminCosts(CostQuery query) async {
    await gate?.future;
    return super.adminCosts(query);
  }
}

/// The everyday month as a server with real costs sends it (REAL-COSTS-PLAN): Composio is on its
/// free plan, so it costs nothing paid; everything else is paid as recorded.
AdminCosts _withPaid(CostQuery q) {
  final c = everydayCosts(q);
  num paidOf(AdminCostRow r) => r.id == 'composio' ? 0 : r.spentUsd;
  final free = c.rows
      .where((r) => r.id == 'composio')
      .fold<num>(0, (n, r) => n + r.spentUsd);
  final freeIndex = c.series.indexWhere((s) => s.id == 'composio');
  return c.copyWith(
    totals: c.totals.copyWith(paidUsd: c.totals.spentUsd - free),
    previous: c.previous?.copyWith(paidUsd: c.previous!.spentUsd),
    rows: [
      for (final r in c.rows)
        r.copyWith(
          paidUsd: paidOf(r),
          previousPaidUsd: r.previousSpentUsd,
          billing: r.id == 'composio' ? CostRowBilling.free : CostRowBilling.metered,
        ),
    ],
    byDay: [
      for (final d in c.byDay)
        d.copyWith(
          paidValues: [
            for (final (i, v) in d.values.indexed) i == freeIndex ? 0 : v,
          ],
        ),
    ],
  );
}

FakeBackend _backend([AdminCosts Function(CostQuery)? costs]) => FakeBackend()
  ..costs = costs ?? everydayCosts
  ..costKeys = everydayKeys();

/// Opens the tab. Most tests here check the list-price view the tab had before REAL-COSTS-PLAN,
/// so they start in Estimated (no fixed bills), with only that view's requests recorded.
Future<void> _open(
  WidgetTester tester,
  FakeBackend backend,
  Size size, {
  bool estimated = true,
}) async {
  await setSize(tester, size);
  await tester.pumpWidget(harness(backend, const Scaffold(body: CostsTab())));
  await tester.pumpAndSettle();
  if (!estimated) return;
  ProviderScope.containerOf(tester.element(find.byType(CostsTab)))
      .read(costBasisProvider.notifier)
      .set(CostBasis.estimated);
  await tester.pumpAndSettle();
  backend.costQueries.removeWhere((q) => q.includeFixed);
}

CostViewNotifier _view(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(CostsTab)))
        .read(costViewProvider.notifier);

double _top(WidgetTester tester, String id) =>
    tester.getTopLeft(find.byKey(Key('costRow-$id'))).dy;

void main() {
  test(
    'money: two decimals, under a cent, and a dash for what is not known',
    () {
      expect(costUsd(4.444, 'en'), r'$4.44');
      expect(costUsd(0.42, 'en'), r'$0.42');
      expect(costUsd(0.004, 'en'), r'<$0.01');
      expect(costUsd(0, 'en'), r'$0.00');
      expect(costUsd(null, 'en'), '—');
      expect(costUsd(1842.17, 'en'), r'$1,842.17');
      expect(costUsdOrDash(0, 'en'), '—');
      expect(costShare(0.004, 5.91), '<1%');
      expect(costShare(1, 0), '—');
      expect(marginShare(0, 3), isNull);
      expect(costPercent(marginShare(8.03, 5.91)), '26%');
    },
  );

  test(
    'change: an arrow and a sign, or a word when there is nothing to compare',
    () {
      final l10n = AppLocalizationsEn();
      expect(CostChange.of(l10n, 4.44, 3.89).text, '+14%');
      expect(CostChange.of(l10n, 4.44, 3.89).direction, 1);
      expect(CostChange.of(l10n, 0.81, 0.835).text, '−3%');
      expect(CostChange.of(l10n, 0.19, 0.19).text, '0%');
      expect(CostChange.of(l10n, 0.19, null).text, '—');
      expect(CostChange.of(l10n, 0.19, 0).text, 'New');
      expect(CostChange.of(l10n, 100, 0.001).text, '+>999%');
      expect(CostChange.points(l10n, 0.26, 0.28).text, '−2 pts');
      expect(CostChange.points(l10n, 0.26, 0.28).spoken, 'down 2 pts');
    },
  );

  test('a name keeps its colour, and the chart\'s stacks never share one', () {
    final book = CostColorBook();
    final ids = [
      'openrouter',
      'gemini',
      'composio',
      'own_servers',
      'zeptomail',
      'serper',
    ];
    book.register(CostGroup.service, ids);
    final slots = [for (final id in ids) book.slot(CostGroup.service, id)];
    expect(slots.toSet().length, ids.length);
    // The same again in any order, and in a book of its own that met the names differently.
    expect([
      for (final id in ids.reversed) book.slot(CostGroup.service, id),
    ], slots.reversed.toList());
    expect(
      CostColorBook().slot(CostGroup.service, 'openrouter'),
      CostColorBook().slot(CostGroup.service, 'openrouter'),
    );
  });

  test('the request carries the grouping, the period and the filters', () {
    // Paid is the default, and fixed bills are real money: the first view includes them.
    const view = CostView();
    expect(view.query, const CostQuery(includeFixed: true));
    final q = costFiltered(
      view.query,
      CostGroup.service,
      'openrouter',
      CostGroup.key,
    );
    expect(q.group, CostGroup.key);
    expect(q.filters, {CostGroup.service: 'openrouter'});
    expect(
      q,
      const CostQuery(
        group: CostGroup.key,
        filters: {CostGroup.service: 'openrouter'},
        includeFixed: true,
      ),
    );
    expect(q == view.query, isFalse);
  });

  testWidgets('wide: tiles, chart, table and the honest small print', (
    tester,
  ) async {
    final backend = _backend();
    await _open(tester, backend, _wide);
    expect(backend.costQueries.first, const CostQuery());

    // Spent is the headline; margin is charged against spent; two services report more.
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-spent')),
        matching: find.text(r'$5.91'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-charged')),
        matching: find.text(r'$8.02'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-margin')),
        matching: find.text('26%'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-notRecorded')),
        matching: find.text(r'$0.40'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-notRecorded')),
        matching: find.text('2 services'),
      ),
      findsOneWidget,
    );

    expect(find.byKey(const Key('costUtcNote')), findsOneWidget);
    expect(find.text('Days are in UTC.'), findsOneWidget);
    expect(find.textContaining('Oct 24 – Nov 22, 2026'), findsOneWidget);

    final row = find.byKey(const Key('costRow-openrouter'));
    expect(
      find.descendant(of: row, matching: find.text('OpenRouter')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: row, matching: find.text(r'$4.44')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: row, matching: find.text('75%')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: row, matching: find.textContaining('+14%')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: row, matching: find.text('9,769')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: row, matching: find.text(r'$6.16')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: row, matching: find.text('Metered')),
      findsOneWidget,
    );

    // Under a cent, nothing charged, nothing to compare, and what couldn't be placed.
    final small = find.byKey(const Key('costRow-serper'));
    expect(
      find.descendant(of: small, matching: find.text(r'<$0.01')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: small, matching: find.text('<1%')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: small, matching: find.text('—')),
      findsNWidgets(2),
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costRow-zeptomail')),
        matching: find.text('Counted'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costRow-')),
        matching: find.text('Not labelled'),
      ),
      findsOneWidget,
    );
    expect(find.text(r'$0.00'), findsNothing);

    // Fixed bills and own-key usage are said, not silently folded in or dropped.
    expect(find.textContaining(r'$31.50 in fixed bills'), findsOneWidget);
    expect(
      find.textContaining(r'Workspaces paid $2.18 on their own keys'),
      findsOneWidget,
    );
  });

  testWidgets(
    'regrouping keeps the period, filters and sort, and the last result stays while it loads',
    (tester) async {
      final backend = _Gated()
        ..costs = everydayCosts
        ..costKeys = everydayKeys();
      await _open(tester, backend, _wide);
      await tester.tap(find.text('7 days'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('costSort-calls')));
      await tester.pumpAndSettle();
      expect(backend.costQueries.last.days, 7);

      backend.gate = Completer<void>();
      await tester.tap(
        find.descendant(
          of: find.byKey(const Key('costGroup')),
          matching: find.text('Feature'),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      // Still the services, dimmed under a progress line: no blank page, no skeleton.
      expect(find.byKey(const Key('costsLoading')), findsOneWidget);
      expect(find.byKey(const Key('costRow-openrouter')), findsOneWidget);
      expect(find.byKey(const Key('costsSkeleton')), findsNothing);

      backend.gate!.complete();
      await tester.pumpAndSettle();
      expect(backend.costQueries.last.group, CostGroup.feature);
      expect(backend.costQueries.last.days, 7);
      expect(find.byKey(const Key('costRow-chat')), findsOneWidget);
      expect(find.byKey(const Key('costRow-openrouter')), findsNothing);
      expect(find.byKey(const Key('costsLoading')), findsNothing);
      // Still sorted by calls, biggest first.
      expect(_top(tester, 'chat'), lessThan(_top(tester, 'routines')));
      expect(_top(tester, 'web_search'), lessThan(_top(tester, 'voice')));
    },
  );

  testWidgets('every grouping asks the server for itself', (tester) async {
    final backend = _backend();
    await _open(tester, backend, _wide);
    for (final (label, group) in [
      ('Key', CostGroup.key),
      ('Apps & MCP', CostGroup.app),
      ('Model', CostGroup.model),
      ('Workspace', CostGroup.workspace),
    ]) {
      await tester.tap(
        find.descendant(
          of: find.byKey(const Key('costGroup')),
          matching: find.text(label),
        ),
      );
      await tester.pumpAndSettle();
      expect(backend.costQueries.last.group, group, reason: label);
    }
  });

  testWidgets(
    'apps and MCP: calls, failure rate, fees and a token cost that says estimated',
    (tester) async {
      final backend = _backend();
      await _open(tester, backend, _wide);
      _view(tester).setGroup(CostGroup.app);
      await tester.pumpAndSettle();
      expect(find.text('Vendor fees'), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
      final github = find.byKey(const Key('costRow-github'));
      expect(
        find.descendant(of: github, matching: find.text('60')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: github, matching: find.text('15%')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: github, matching: find.text(r'$0.12')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: github, matching: find.text(r'$0.18')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: github, matching: find.text('estimated')),
        findsOneWidget,
      );
      expect(find.textContaining('Token cost is an estimate'), findsOneWidget);
    },
  );

  testWidgets(
    'sorting: a header sorts by its column, a second click turns it around',
    (tester) async {
      await _open(tester, _backend(), _wide);
      // Spent, biggest first, to begin with.
      expect(_top(tester, 'openrouter'), lessThan(_top(tester, 'gemini')));
      expect(_top(tester, 'gemini'), lessThan(_top(tester, 'composio')));

      await tester.tap(find.byKey(const Key('costSort-calls')));
      await tester.pumpAndSettle();
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'gemini')));
      expect(
        find.bySemanticsLabel('Calls, sorted high to low'),
        findsOneWidget,
      );

      await tester.tap(find.byKey(const Key('costSort-calls')));
      await tester.pumpAndSettle();
      expect(_top(tester, 'gemini'), lessThan(_top(tester, 'composio')));
      expect(
        find.bySemanticsLabel('Calls, sorted low to high'),
        findsOneWidget,
      );

      await tester.tap(find.byKey(const Key('costSort-name')));
      await tester.pumpAndSettle();
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'gemini')));
      expect(_top(tester, 'gemini'), lessThan(_top(tester, 'openrouter')));

      // No earlier period: last, whichever way the change column runs.
      await tester.tap(find.byKey(const Key('costSort-change')));
      await tester.pumpAndSettle();
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'openrouter')));
      expect(_top(tester, 'zeptomail'), lessThan(_top(tester, 'serper')));
      await tester.tap(find.byKey(const Key('costSort-change')));
      await tester.pumpAndSettle();
      expect(_top(tester, 'openrouter'), lessThan(_top(tester, 'composio')));
      expect(_top(tester, 'zeptomail'), lessThan(_top(tester, 'serper')));
    },
  );

  testWidgets(
    'wide: a row opens its detail beside the table; Show in the table makes it a filter chip',
    (tester) async {
      final backend = _backend();
      await _open(tester, backend, _wide);
      await tester.tap(find.byKey(const Key('costRow-openrouter')));
      await tester.pumpAndSettle();

      final panel = find.byKey(const Key('costPanel'));
      expect(panel, findsOneWidget);
      // The table is still there, to its left.
      expect(find.byKey(const Key('costRow-gemini')), findsOneWidget);
      expect(
        tester.getTopRight(find.byKey(const Key('costRow-gemini'))).dx,
        lessThan(tester.getTopLeft(panel).dx),
      );
      expect(
        find.descendant(of: panel, matching: find.text('OpenRouter')),
        findsWidgets,
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-spent'))).data,
        r'$4.44',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-charged'))).data,
        r'$6.16',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-margin'))).data,
        '28%',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costReported'))).data,
        r'They say $4.61 · we recorded $4.44 · $0.17 not recorded',
      );
      expect(find.byKey(const Key('costOpenBilling')), findsOneWidget);

      // Its days and its keys: the same request, narrowed to the row and split by key.
      expect(
        backend.costQueries.last,
        const CostQuery(
          group: CostGroup.key,
          filters: {CostGroup.service: 'openrouter'},
        ),
      );
      expect(
        find.byKey(const Key('costSplitRow-CLOUD_MODEL_UPSTREAM_KEY')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('costSplitRow-HELP_MODEL_KEY')),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key('costSplitRow-GEMINI_API_KEY')),
        findsNothing,
      );
      expect(
        find.descendant(
          of: panel,
          matching: find.textContaining('last used 2 minutes ago'),
        ),
        findsOneWidget,
      );

      await tester.tap(
        find.descendant(
          of: find.byKey(const Key('costSplit')),
          matching: find.text('Feature'),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        backend.costQueries.last,
        const CostQuery(
          group: CostGroup.feature,
          filters: {CostGroup.service: 'openrouter'},
        ),
      );

      await tester.tap(find.byKey(const Key('costShowInTable')));
      await tester.pumpAndSettle();
      expect(panel, findsNothing);
      expect(find.byKey(const Key('costFilter-service')), findsOneWidget);
      expect(find.text('Service: OpenRouter'), findsOneWidget);
      expect(find.byKey(const Key('costRow-chat')), findsOneWidget);

      // The chip's button takes the filter off again; the grouping stays.
      await tester.tap(find.byTooltip('Remove filter OpenRouter'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costFilter-service')), findsNothing);
      expect(
        backend.costQueries.last,
        const CostQuery(group: CostGroup.feature),
      );
    },
  );

  testWidgets(
    'wide: the panel closes with its button, and a second click on the row',
    (tester) async {
      await _open(tester, _backend(), _wide);
      await tester.tap(find.byKey(const Key('costRow-gemini')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costPanel')), findsOneWidget);
      await tester.tap(find.byKey(const Key('costDetailClose')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costPanel')), findsNothing);
      await tester.tap(find.byKey(const Key('costRow-gemini')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('costRow-gemini')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costPanel')), findsNothing);
    },
  );

  testWidgets(
    'a key\'s detail: what it is for, where it lives, its cap and the billing page',
    (tester) async {
      await _open(tester, _backend(), _wide);
      _view(tester).setGroup(CostGroup.key);
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('costRow-CLOUD_MODEL_UPSTREAM_KEY')),
      );
      await tester.pumpAndSettle();
      final facts = find.byKey(const Key('costKeyFacts'));
      for (final text in [
        'Cloud models for every workspace on Casama Cloud',
        'OpenRouter',
        'CLOUD_MODEL_UPSTREAM_KEY',
        "The server's env file",
        'Casama · OpenRouter server key',
        'Set',
        '2 minutes ago',
        r'$58.20 left of $100.00',
      ]) {
        expect(
          find.descendant(of: facts, matching: find.text(text)),
          findsOneWidget,
          reason: text,
        );
      }
      expect(
        tester.widget<Text>(find.byKey(const Key('costReported'))).data,
        r'They say $4.47 · we recorded $4.30 · $0.17 not recorded',
      );
      expect(find.byKey(const Key('costOpenBilling')), findsOneWidget);

      // A key that isn't set, has no vault item, no cap and no figure from its vendor.
      await tester.tap(find.byKey(const Key('costRow-HELP_MODEL_KEY')));
      await tester.pumpAndSettle();
      expect(
        find.descendant(of: facts, matching: find.text('Not set')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: facts, matching: find.text('None')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: facts, matching: find.text('—')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('costReportedMissing')), findsOneWidget);
    },
  );

  testWidgets(
    'phone: two-line rows, groups that wrap, and a row pushes its page',
    (tester) async {
      final backend = _backend();
      await _open(tester, backend, _phone);
      // Two tiles a row.
      expect(
        tester.getTopLeft(find.byKey(const Key('costTile-spent'))).dy,
        tester.getTopLeft(find.byKey(const Key('costTile-charged'))).dy,
      );
      expect(
        tester.getTopLeft(find.byKey(const Key('costTile-margin'))).dy,
        greaterThan(
          tester.getTopLeft(find.byKey(const Key('costTile-spent'))).dy,
        ),
      );
      expect(find.byKey(const Key('costSort-calls')), findsNothing);
      expect(find.byKey(const Key('costGroupChips')), findsOneWidget);
      final row = find.byKey(const Key('costRow-openrouter'));
      expect(
        find.descendant(of: row, matching: find.text(r'$4.44')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: row, matching: find.textContaining('75%')),
        findsOneWidget,
      );
      expect(tester.getSize(row).height, lessThan(80));

      await tester.ensureVisible(find.byKey(const Key('costGroup-workspace')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('costGroup-workspace')));
      await tester.pumpAndSettle();
      expect(backend.costQueries.last.group, CostGroup.workspace);
      expect(find.text('Acme'), findsWidgets);

      await tester.tap(
        find.byKey(const Key('costRow-11111111-1111-4111-8111-111111111111')),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costPanel')), findsNothing);
      expect(find.byKey(const Key('costDetail')), findsOneWidget);
      expect(find.text('Acme'), findsWidgets);
      expect(find.textContaining('Pro'), findsWidgets);
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-spent'))).data,
        r'$2.90',
      );

      // From the page, Show in the table goes back and narrows the list.
      await tester.tap(find.byKey(const Key('costShowInTable')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costDetail')), findsNothing);
      expect(find.text('Workspace: Acme'), findsOneWidget);
      expect(backend.costQueries.last.filters, {
        CostGroup.workspace: '11111111-1111-4111-8111-111111111111',
      });
      expect(backend.costQueries.last.group, CostGroup.service);
    },
  );

  testWidgets(
    'phone: an app\'s page has calls, failure rate, fees and the estimated token cost',
    (tester) async {
      await _open(tester, _backend(), _phone);
      _view(tester).setGroup(CostGroup.app);
      await tester.pumpAndSettle();
      expect(find.textContaining('15% failed'), findsOneWidget);
      expect(find.textContaining(r'$0.18 tokens, estimated'), findsOneWidget);
      await tester.tap(find.byKey(const Key('costRow-github')));
      await tester.pumpAndSettle();
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-calls'))).data,
        '60',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-failed'))).data,
        '15%',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-spent'))).data,
        r'$0.12',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-tokens'))).data,
        r'$0.18',
      );
      expect(find.text('estimated'), findsOneWidget);
    },
  );

  testWidgets(
    'phone at 360: the grouping chips wrap, and nothing scrolls sideways',
    (tester) async {
      await _open(tester, _backend(), const Size(360, 2400));
      final chips = find.byKey(const Key('costGroupChips'));
      expect(chips, findsOneWidget);
      // Every grouping chip is on screen, inside the page's width, without scrolling.
      for (final g in CostGroup.values) {
        final rect = tester.getRect(find.byKey(Key('costGroup-${g.value}')));
        expect(rect.left, greaterThanOrEqualTo(0));
        expect(rect.right, lessThanOrEqualTo(360));
      }
      expect(
        find.descendant(
          of: find.byType(CostsTab),
          matching: find.byWidgetPredicate(
            (w) => w is Scrollable && w.axisDirection == AxisDirection.right,
          ),
        ),
        findsNothing,
      );
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('phone: the period, filters and fixed bills live in one sheet', (
    tester,
  ) async {
    final backend = _backend();
    await _open(tester, backend, const Size(390, 1000));
    expect(find.text('Last 30 days'), findsOneWidget);
    await tester.tap(find.byKey(const Key('costOptions')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('90 days'));
    await tester.pumpAndSettle();
    expect(backend.costQueries.last.days, 90);
    await tester.tap(find.text('Include fixed bills'));
    await tester.pumpAndSettle();
    expect(backend.costQueries.last.includeFixed, isTrue);
    expect(backend.costQueries.last.days, 90);
    await tester.tap(find.byKey(const Key('costOptionsDone')));
    await tester.pumpAndSettle();
    expect(find.text('Last 90 days'), findsOneWidget);
    expect(find.textContaining('in fixed bills'), findsNothing);
  });

  testWidgets('wide: include fixed bills and export', (tester) async {
    final backend = _backend()
      ..costsCsv = 'service,spent_usd\nopenrouter,4.44\n';
    await _open(tester, backend, _wide);
    await tester.tap(find.byKey(const Key('costIncludeFixed')));
    await tester.pumpAndSettle();
    // That view was already loaded for Paid, so it is shown without asking again.
    expect(
      ProviderScope.containerOf(
        tester.element(find.byType(CostsTab)),
      ).read(costViewProvider).query.includeFixed,
      isTrue,
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-spent')),
        matching: find.text(r'$37.41'),
      ),
      findsOneWidget,
    );

    final shared = <(String, String)>[];
    debugCostShare = (name, csv) async => shared.add((name, csv));
    addTearDown(() => debugCostShare = null);
    await tester.tap(find.byKey(const Key('costExport')));
    await tester.pumpAndSettle();
    expect(shared.single.$1, 'casama-costs-service-2026-10-24_2026-11-22.csv');
    expect(shared.single.$2, contains('openrouter,4.44'));
  });

  testWidgets('a custom range is sent as UTC days', (tester) async {
    final backend = _backend();
    await _open(tester, backend, _wide);
    _view(tester).setRange('2026-11-01', '2026-11-10');
    await tester.pumpAndSettle();
    expect(backend.costQueries.last.from, '2026-11-01');
    expect(backend.costQueries.last.to, '2026-11-10');
    expect(backend.costQueries.last.isCustom, isTrue);
    expect(find.textContaining('Nov 1 – Nov 10, 2026'), findsOneWidget);
    expect(find.text('Change dates'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const Key('costTile-spent')),
        matching: find.textContaining('vs the 10 days before'),
      ),
      findsOneWidget,
    );
    // Regrouping keeps the range.
    _view(tester).setGroup(CostGroup.model);
    await tester.pumpAndSettle();
    expect(backend.costQueries.last.from, '2026-11-01');
  });

  testWidgets('not recorded: the tile explains itself and lists the services', (
    tester,
  ) async {
    await _open(tester, _backend(), _wide);
    await tester.tap(find.byKey(const Key('costTile-notRecorded')));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Some services report their own total'),
      findsOneWidget,
    );
    expect(find.byKey(const Key('costGap-composio')), findsOneWidget);
    expect(find.byKey(const Key('costGap-openrouter')), findsOneWidget);
    expect(find.byKey(const Key('costGap-gemini')), findsNothing);
    expect(find.text(r'They say $0.65 · we recorded $0.42'), findsOneWidget);
    // The bigger gap first.
    expect(
      tester.getTopLeft(find.byKey(const Key('costGap-composio'))).dy,
      lessThan(
        tester.getTopLeft(find.byKey(const Key('costGap-openrouter'))).dy,
      ),
    );
    expect(
      find.textContaining('No total from: Own servers, Serper'),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const Key('costNotRecordedClose')));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Some services report their own total'),
      findsNothing,
    );
  });

  testWidgets(
    'an app\'s detail lists its top tools and splits by workspace only',
    (tester) async {
      final backend = _backend();
      await _open(tester, backend, _wide);
      _view(tester).setGroup(CostGroup.app);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('costRow-github')));
      await tester.pumpAndSettle();

      const tools = CostQuery(
        group: CostGroup.app,
        filters: {CostGroup.app: 'github'},
      );
      expect(backend.costQueries, contains(tools));
      expect(
        backend.costQueries,
        contains(
          const CostQuery(
            group: CostGroup.workspace,
            filters: {CostGroup.app: 'github'},
          ),
        ),
      );
      // Nothing else is asked with an app filter: the server has no rows for it.
      expect(
        backend.costQueries
            .where((q) => q.filters.containsKey(CostGroup.app))
            .map((q) => q.group)
            .toSet(),
        {CostGroup.app, CostGroup.workspace},
      );

      final card = find.byKey(const Key('costTools'));
      expect(find.text('Top tools'), findsOneWidget);
      // Eight of the ten, busiest first, then the tool list itself.
      expect(
        find.descendant(
          of: card,
          matching: find.byWidgetPredicate(
            (w) =>
                w.key is ValueKey<String> &&
                (w.key! as ValueKey<String>).value.startsWith(
                  'costTool-GITHUB',
                ),
          ),
        ),
        findsNWidgets(8),
      );
      expect(find.byKey(const Key('costTool-GITHUB_TOOL_9')), findsNothing);
      expect(find.text('And 2 more tools.'), findsOneWidget);
      expect(
        tester.getTopLeft(find.byKey(const Key('costTool-GITHUB_TOOL_1'))).dy,
        lessThan(
          tester.getTopLeft(find.byKey(const Key('costTool-GITHUB_TOOL_2'))).dy,
        ),
      );
      expect(
        find.descendant(
          of: find.byKey(const Key('costTool-GITHUB_TOOL_1')),
          matching: find.text(
            r'40 calls · 0% failed · $0.05 tokens, estimated',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(const Key('costTool-GITHUB_TOOL_2')),
          matching: find.text(
            r'36 calls · 25% failed · $0.03 tokens, estimated',
          ),
        ),
        findsOneWidget,
      );
      final list = find.byKey(const Key('costTool-'));
      expect(
        find.descendant(
          of: list,
          matching: find.text('Tool list sent to the model'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: list,
          matching: find.text(r'$0.03 tokens, estimated'),
        ),
        findsOneWidget,
      );
      expect(
        tester.getTopLeft(list).dy,
        greaterThan(
          tester.getTopLeft(find.byKey(const Key('costTool-GITHUB_TOOL_8'))).dy,
        ),
      );

      // One way to split: a title, no choice.
      expect(find.byKey(const Key('costSplit')), findsNothing);
      expect(find.text('By workspace'), findsOneWidget);
      expect(find.text('Split by'), findsNothing);
      expect(find.byKey(const Key('costSplitRows')), findsOneWidget);

      // Custom servers name no tools: no list, and nothing asked for one.
      await tester.tap(find.byKey(const Key('costRow-custom')));
      await tester.pumpAndSettle();
      expect(find.text('Top tools'), findsNothing);
      expect(find.byKey(const Key('costTools')), findsNothing);
      expect(
        backend.costQueries.any(
          (q) =>
              q.group == CostGroup.app && q.filters[CostGroup.app] == 'custom',
        ),
        isFalse,
      );
      expect(find.text('By workspace'), findsOneWidget);
    },
  );

  testWidgets(
    'phone: the sheet sorts the list by spent, change, calls or name',
    (tester) async {
      await _open(tester, _backend(), _phone);
      expect(_top(tester, 'openrouter'), lessThan(_top(tester, 'gemini')));
      expect(_top(tester, 'gemini'), lessThan(_top(tester, 'composio')));

      Future<void> sort(String label) async {
        await tester.tap(find.byKey(const Key('costOptions')));
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.byKey(const Key('costSort')));
        await tester.tap(
          find.descendant(
            of: find.byKey(const Key('costSort')),
            matching: find.text(label),
          ),
        );
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.byKey(const Key('costOptionsDone')));
        await tester.tap(find.byKey(const Key('costOptionsDone')));
        await tester.pumpAndSettle();
      }

      await sort('Calls');
      expect(_top(tester, 'openrouter'), lessThan(_top(tester, 'composio')));
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'zeptomail')));
      expect(_top(tester, 'zeptomail'), lessThan(_top(tester, 'gemini')));

      await sort('Name');
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'gemini')));
      expect(_top(tester, 'gemini'), lessThan(_top(tester, 'openrouter')));

      await sort('Change');
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'openrouter')));
      expect(_top(tester, 'openrouter'), lessThan(_top(tester, 'gemini')));

      await sort('Estimated');
      expect(_top(tester, 'openrouter'), lessThan(_top(tester, 'gemini')));
      // Regrouping keeps the sort.
      await sort('Calls');
      _view(tester).setGroup(CostGroup.feature);
      await tester.pumpAndSettle();
      expect(_top(tester, 'web_search'), lessThan(_top(tester, 'voice')));
    },
  );

  group('states', () {
    testWidgets('loading: a skeleton in the shape of the page', (tester) async {
      final backend = _Gated()
        ..costs = everydayCosts
        ..gate = Completer<void>();
      await setSize(tester, _wide);
      await tester.pumpWidget(
        harness(backend, const Scaffold(body: CostsTab())),
      );
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byKey(const Key('costsSkeleton')), findsOneWidget);
      expect(find.byKey(const Key('costsList')), findsNothing);
      backend.gate!.complete();
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costsSkeleton')), findsNothing);
      expect(find.byKey(const Key('costRow-openrouter')), findsOneWidget);
    });

    testWidgets('an empty period says so, in its own days', (tester) async {
      final backend = _backend((q) => costsOf(q, const [], noPrevious: true));
      await _open(tester, backend, _wide);
      expect(find.text('Nothing was spent in these 30 days'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byKey(const Key('costTile-spent')),
          matching: find.text(r'$0.00'),
        ),
        findsOneWidget,
      );
      // Nothing charged and no vendor figure: unknown, so a dash and not "$0.00".
      expect(
        find.descendant(
          of: find.byKey(const Key('costTile-margin')),
          matching: find.text('—'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(const Key('costTile-notRecorded')),
          matching: find.text('—'),
        ),
        findsOneWidget,
      );
      await tester.tap(find.text('7 days'));
      await tester.pumpAndSettle();
      expect(find.text('Nothing was spent in these 7 days'), findsOneWidget);
    });

    testWidgets(
      'all zeros: the same message, with the services still listed at zero',
      (tester) async {
        await _open(tester, _backend(zeroCosts), _wide);
        expect(find.text('Nothing was spent in these 30 days'), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(const Key('costRow-openrouter')),
            matching: find.text(r'$0.00'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(const Key('costRow-openrouter')),
            matching: find.text('0%'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets('filters that match nothing offer to clear them', (
      tester,
    ) async {
      final backend = _backend(
        (q) => q.filters.isEmpty ? everydayCosts(q) : costsOf(q, const []),
      );
      await _open(tester, backend, _wide);
      _view(tester).showService('openrouter', 'OpenRouter');
      await tester.pumpAndSettle();
      expect(
        find.text('Nothing was spent that matches these filters'),
        findsOneWidget,
      );
      await tester.tap(find.byKey(const Key('costClearFilters')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costFilter-service')), findsNothing);
      expect(backend.costQueries.last.filters, isEmpty);
    });

    testWidgets(
      'partial: a vendor that gave no figure greys out instead of showing zero',
      (tester) async {
        await _open(tester, _backend(noFigureCosts), _wide);
        final tile = find.byKey(const Key('costTile-notRecorded'));
        expect(
          find.descendant(of: tile, matching: find.text('—')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tile,
            matching: find.text('No service reported a total'),
          ),
          findsOneWidget,
        );
        await tester.tap(find.byKey(const Key('costRow-openrouter')));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('costReported')), findsNothing);
        final missing = find.byKey(const Key('costReportedMissing'));
        expect(missing, findsOneWidget);
        expect(tester.widget<Opacity>(missing).opacity, lessThan(1));
        expect(
          find.descendant(
            of: missing,
            matching: find.textContaining('gave no total of its own'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: missing,
            matching: find.textContaining('Updated 5 minutes ago'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets('error: said plainly, and Try again asks again', (
      tester,
    ) async {
      final backend = _backend()..costsError = StateError('offline');
      await _open(tester, backend, _wide);
      expect(find.byKey(const Key('costsError')), findsOneWidget);
      expect(find.text('Something went wrong'), findsOneWidget);
      expect(backend.costQueries.length, 1);
      backend.costsError = null;
      await tester.tap(find.byKey(const Key('costsRetry')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costsError')), findsNothing);
      expect(find.byKey(const Key('costRow-openrouter')), findsOneWidget);
    });

    testWidgets(
      'an error after a good view keeps that view under a retry line',
      (tester) async {
        final backend = _backend();
        await _open(tester, backend, _wide);
        backend.costsError = StateError('offline');
        _view(tester).setGroup(CostGroup.key);
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('costsStaleError')), findsOneWidget);
        expect(find.byKey(const Key('costRow-openrouter')), findsOneWidget);
        // What is on screen isn't the grouping asked for, so its rows don't open.
        await tester.tap(find.byKey(const Key('costRow-openrouter')));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('costPanel')), findsNothing);
        backend.costsError = null;
        await tester.tap(
          find.descendant(
            of: find.byKey(const Key('costsStaleError')),
            matching: find.text('Try Again'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('costsStaleError')), findsNothing);
        expect(
          find.byKey(const Key('costRow-CLOUD_MODEL_UPSTREAM_KEY')),
          findsOneWidget,
        );
      },
    );

    testWidgets('an older server: the tab says the server needs an update', (
      tester,
    ) async {
      final backend = _backend()..costsError = const CostsNotSupported();
      await _open(tester, backend, _phone);
      expect(find.byKey(const Key('costsOlderServer')), findsOneWidget);
      expect(find.text('This server needs an update'), findsOneWidget);
      expect(
        find.textContaining('come with a newer server version'),
        findsOneWidget,
      );
      backend.costsError = null;
      await tester.tap(find.text('Check again'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costsOlderServer')), findsNothing);
      expect(find.byKey(const Key('costRow-openrouter')), findsOneWidget);
    });
  });

  group('awkward data', () {
    for (final (name, size) in [
      ('wide', _wide),
      ('tablet', Size(800, 2400)),
      ('phone', _phone),
      ('small phone', Size(320, 2400)),
    ]) {
      testWidgets(
        '$name: one giant service, long names and forty rows lay out without overflow',
        (tester) async {
          for (final costs in [giantCosts, longNameCosts, fortyCosts]) {
            await setSize(
              tester,
              costs == fortyCosts ? Size(size.width, 5000) : size,
            );
            await tester.pumpWidget(
              harness(
                _backend(costs),
                Scaffold(key: UniqueKey(), body: const CostsTab()),
              ),
            );
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
            await tester.tap(
              find.byKey(
                Key('costRow-${costs(const CostQuery()).rows.first.id}'),
              ),
            );
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
            expect(find.byKey(const Key('costDetail')), findsOneWidget);
            await tester.pumpWidget(const SizedBox.shrink());
          }
        },
      );
    }

    testWidgets(
      'one giant service: the small ones keep a sliver of bar and their own numbers',
      (tester) async {
        await _open(tester, _backend(giantCosts), _wide);
        expect(
          find.descendant(
            of: find.byKey(const Key('costRow-openrouter')),
            matching: find.text(r'$1,842.17'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(const Key('costRow-openrouter')),
            matching: find.text('1,204,311'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(const Key('costRow-serper')),
            matching: find.text(r'<$0.01'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(const Key('costRow-serper')),
            matching: find.textContaining('+100%'),
          ),
          findsOneWidget,
        );
        final bar = find.descendant(
          of: find.byKey(const Key('costRow-serper')),
          matching: find.byType(FractionallySizedBox),
        );
        expect(tester.getSize(bar).width, greaterThan(1));
      },
    );

    testWidgets('forty rows are all there, and sort like any others', (
      tester,
    ) async {
      await setSize(tester, const Size(1400, 5000));
      await tester.pumpWidget(
        harness(_backend(fortyCosts), const Scaffold(body: CostsTab())),
      );
      await tester.pumpAndSettle();
      expect(
        find.byWidgetPredicate(
          (w) =>
              w.key is ValueKey<String> &&
              (w.key! as ValueKey<String>).value.startsWith('costRow-'),
        ),
        findsNWidgets(40),
      );
      expect(find.text('Workspace 40'), findsWidgets);
      await tester.tap(find.byKey(const Key('costSort-spent')));
      await tester.pumpAndSettle();
      expect(
        _top(tester, '00000000-0000-4000-8000-000000000039'),
        lessThan(_top(tester, '00000000-0000-4000-8000-000000000000')),
      );
    });

    testWidgets('a very long name is cut, not wrapped over the numbers', (
      tester,
    ) async {
      await _open(tester, _backend(longNameCosts), _wide);
      final row = find.byKey(const Key('costRow-long-1'));
      final name = find.descendant(of: row, matching: find.text(kLongName));
      expect(tester.getSize(row).height, lessThan(64));
      expect(
        tester.getTopRight(name).dx,
        lessThan(
          tester
              .getTopLeft(
                find.descendant(of: row, matching: find.text(r'$6.20')),
              )
              .dx,
        ),
      );
      expect(
        find.descendant(
          of: find.byKey(const Key('costRow-long-3')),
          matching: find.text('Estimated'),
        ),
        findsOneWidget,
      );
    });
  });

  group('for everyone', () {
    testWidgets(
      'a screen reader hears the tiles, the chart, the rows and the headers',
      (tester) async {
        final handle = tester.ensureSemantics();
        await _open(tester, _backend(), _wide);
        expect(
          find.bySemanticsLabel(
            RegExp(r'^Estimated, \$5\.91, up 12% vs the 30 days before$'),
          ),
          findsOneWidget,
        );
        expect(
          find.bySemanticsLabel(RegExp(r'^Margin at list prices, 26%, ')),
          findsOneWidget,
        );
        expect(
          find.bySemanticsLabel(RegExp(r'^Not recorded, \$0\.40, 2 services$')),
          findsOneWidget,
        );
        expect(
          find.bySemanticsLabel(
            RegExp(
              r'^Daily spend chart, 30 days, \$5\.91 in all\. The highest day was .+ with \$0\.\d\d\.$',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.bySemanticsLabel(
            r'OpenRouter, estimated $4.44, 75% of the total, up 14%, 9,769 calls, charged $6.16, Metered',
          ),
          findsOneWidget,
        );
        expect(
          find.bySemanticsLabel(
            RegExp(r'^Not labelled, estimated \$0\.02, <1% of the total, down 60%'),
          ),
          findsOneWidget,
        );
        expect(
          find.bySemanticsLabel('Estimated, sorted high to low'),
          findsOneWidget,
        );
        expect(find.bySemanticsLabel('Sort by Calls'), findsOneWidget);
        expect(
          find.bySemanticsLabel(RegExp(r'^OpenRouter, \$4\.44$')),
          findsOneWidget,
        );

        final row = tester.getSemantics(
          find.bySemanticsLabel(RegExp(r'^OpenRouter, estimated')),
        );
        expect(row.flagsCollection.isButton, isTrue);
        expect(row.getSemanticsData().hasAction(SemanticsAction.tap), isTrue);
        expect(row.hint, 'Opens the details');
        final tile = tester.getSemantics(
          find.bySemanticsLabel(RegExp(r'^Not recorded,')),
        );
        expect(tile.getSemanticsData().hasAction(SemanticsAction.tap), isTrue);
        handle.dispose();
      },
    );

    testWidgets('keyboard: Tab reaches a row and Enter opens it', (
      tester,
    ) async {
      await _open(tester, _backend(), _wide);
      final row = find.byKey(const Key('costRow-gemini'));
      Focus.of(
        tester.element(find.descendant(of: row, matching: find.text('Gemini'))),
      ).requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('costPanel')), findsOneWidget);
      expect(
        tester.widget<Text>(find.byKey(const Key('costDetail-spent'))).data,
        r'$0.81',
      );

      // A header is a button too.
      Focus.of(
        tester.element(
          find.descendant(
            of: find.byKey(const Key('costSort-name')),
            matching: find.text('Service'),
          ),
        ),
      ).requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(_top(tester, 'composio'), lessThan(_top(tester, 'gemini')));
    });

    for (final (name, size) in [
      ('wide', Size(1400, 4000)),
      ('phone', Size(390, 4000)),
      ('small phone', Size(320, 4000)),
    ]) {
      testWidgets('$name: twice the text size clips no number', (tester) async {
        tester.platformDispatcher.textScaleFactorTestValue = 2;
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
        await _open(tester, _backend(), size);
        expect(tester.takeException(), isNull);
        for (final key in ['spent', 'charged', 'margin', 'notRecorded']) {
          final tile = tester.getRect(find.byKey(Key('costTile-$key')));
          for (final e
              in find
                  .descendant(
                    of: find.byKey(Key('costTile-$key')),
                    matching: find.byType(RichText),
                  )
                  .evaluate()) {
            final r = tester.getRect(find.byWidget(e.widget));
            expect(
              r.left >= tile.left - 0.5 && r.right <= tile.right + 0.5,
              isTrue,
              reason: '$key at $name',
            );
            // Words may wrap or shorten (the test font is twice as wide as the real one);
            // a number never does.
            if (!(e.widget as RichText).text.toPlainText().contains(
              RegExp(r'\d'),
            )) {
              continue;
            }
            expect(
              (e.renderObject! as RenderParagraph).didExceedMaxLines,
              isFalse,
              reason:
                  '$key at $name: ${(e.widget as RichText).text.toPlainText()}',
            );
          }
        }
        // The amount on each row is whole.
        final amount = find.descendant(
          of: find.byKey(const Key('costRow-openrouter')),
          matching: find.text(r'$4.44'),
        );
        expect(
          (tester.renderObject(amount) as RenderParagraph).didExceedMaxLines,
          isFalse,
        );
        _view(tester).setGroup(CostGroup.app);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.tap(find.byKey(const Key('costRow-github')));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('the rest of the console', () {
    testWidgets(
      'Costs leads the Money group, and the spend card opens it',
      (tester) async {
        await setSize(tester, const Size(900, 2400));
        final backend = _backend();
        await tester.pumpWidget(harness(backend, const AdminScreen()));
        await tester.pumpAndSettle();
        await unlockAdmin(tester);
        // 900 wide is a phone layout: the sections are listed under the overview.
        expect(
          tester.getTopLeft(find.byKey(const Key('adminNav-costs'))).dy,
          lessThan(tester.getTopLeft(find.byKey(const Key('adminNav-pricing'))).dy),
        );

        final card = find.byKey(const Key('spendCard'));
        await tester.ensureVisible(card);
        await tester.pumpAndSettle();
        expect(find.text('Spend, last 30 days'), findsOneWidget);
        expect(
          // Paid, with the fixed bills: real money.
          tester.widget<Text>(find.byKey(const Key('spendCard-spent'))).data,
          r'$37.41',
        );
        expect(
          tester.widget<Text>(find.byKey(const Key('spendCard-charged'))).data,
          r'$8.02',
        );
        expect(
          tester.widget<Text>(find.byKey(const Key('spendCard-margin'))).data,
          '26%',
        );
        expect(find.byKey(const Key('marginCard')), findsNothing);

        await tester.tap(card);
        await tester.pumpAndSettle();
        expect(find.byType(CostsTab), findsOneWidget);
        expect(find.byKey(const Key('costTile-spent')), findsOneWidget);
        // The card's request is the tab's first view: nothing is fetched twice.
        expect(
          backend.costQueries
              .where((q) => q == const CostQuery(includeFixed: true))
              .length,
          1,
        );
      },
    );

    testWidgets('?tab=costs opens the tab', (tester) async {
      await setSize(tester, const Size(900, 2400));
      await tester.pumpWidget(
        harness(_backend(), const AdminScreen(tab: 'costs')),
      );
      await tester.pumpAndSettle();
      await unlockAdmin(tester);
      expect(find.byKey(const Key('costTile-spent')), findsOneWidget);
    });

    testWidgets(
      'no spend card on an older server or for someone who is not the owner',
      (tester) async {
        await setSize(tester, const Size(900, 2400));
        await tester.pumpWidget(
          harness(
            _backend()..costsError = const CostsNotSupported(),
            const AdminScreen(),
          ),
        );
        await tester.pumpAndSettle();
        await unlockAdmin(tester);
        expect(find.byKey(const Key('spendCard')), findsNothing);
        expect(find.text('Users'), findsWidgets);
      },
    );

    testWidgets(
      'a renewal vendor saves what a renewal costs and its months, and links to its spend',
      (tester) async {
        await setSize(tester, const Size(900, 2400));
        final backend = _RenewalVendor()
          ..costs = everydayCosts
          ..costKeys = everydayKeys();
        await tester.pumpWidget(
          harness(
            backend,
            const _VendorsThenCosts(),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Apple Developer'));
        await tester.pumpAndSettle();
        expect(
          tester
              .widget<TextField>(find.byKey(const Key('vendorRenewalUsd')))
              .controller!
              .text,
          '99',
        );
        await tester.enterText(
          find.byKey(const Key('vendorRenewalUsd')),
          '119.5',
        );
        await tester.enterText(
          find.byKey(const Key('vendorRenewalMonths')),
          '12',
        );
        await tester.ensureVisible(find.text('Save'));
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();
        expect(backend.saved!.renewalUsd, 119.5);
        expect(backend.saved!.renewalMonths, 12);

        // Months that make no sense are refused before anything is sent.
        backend.saved = null;
        await tester.enterText(
          find.byKey(const Key('vendorRenewalMonths')),
          '0',
        );
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();
        expect(backend.saved, isNull);

        await tester.ensureVisible(find.byKey(const Key('vendorSeeSpend')));
        await tester.tap(find.byKey(const Key('vendorSeeSpend')));
        await tester.pumpAndSettle();
        expect(find.byType(CostsTab), findsOneWidget);
        expect(find.text('Service: Apple Developer'), findsOneWidget);
        expect(
          backend.costQueries,
          contains(
            const CostQuery(
              group: CostGroup.key,
              filters: {CostGroup.service: 'apple_developer'},
              includeFixed: true,
            ),
          ),
        );
      },
    );

    testWidgets(
      'a vendor saves its plan: included credit while metered, none on a free plan',
      (tester) async {
        await setSize(tester, const Size(900, 2400));
        final backend = _RenewalVendor()..kind = 'quota';
        await tester.pumpWidget(
          harness(backend, const Scaffold(body: VendorsTab())),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Apple Developer'));
        await tester.pumpAndSettle();
        // A quota can carry a paid plan's bill too (Composio Pro: $29 a month).
        expect(find.byKey(const Key('vendorRenewalUsd')), findsOneWidget);
        await tester.ensureVisible(find.byKey(const Key('vendorIncludedUsd')));
        await tester.enterText(find.byKey(const Key('vendorIncludedUsd')), '29');
        await tester.ensureVisible(find.text('Save'));
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();
        expect(backend.saved!.billing, VendorBilling.metered);
        expect(backend.saved!.includedUsd, 29);

        await tester.ensureVisible(find.byKey(const Key('vendorFreePlan')));
        await tester.tap(find.byKey(const Key('vendorFreePlan')));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('vendorIncludedUsd')), findsNothing);
        await tester.ensureVisible(find.text('Save'));
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();
        expect(backend.saved!.billing, VendorBilling.free);
        expect(backend.saved!.includedUsd, isNull);
      },
    );

    testWidgets('a prepaid balance has no renewal fields', (tester) async {
      await setSize(tester, const Size(900, 2400));
      final backend = _RenewalVendor()..kind = 'balance';
      await tester.pumpWidget(
        harness(backend, const Scaffold(body: VendorsTab())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Apple Developer'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('vendorRenewalUsd')), findsNothing);
      // Opened outside the console's tabs: nowhere to go, so no link.
      expect(find.byKey(const Key('vendorSeeSpend')), findsNothing);
    });
  });

  testWidgets(
    'paid by default: free plans cost nothing, Estimated shows list prices',
    (tester) async {
      final backend = _backend(_withPaid);
      await _open(tester, backend, _wide, estimated: false);
      final costs = _withPaid(const CostView().query);
      String tile(String key) => tester
          .widgetList<Text>(
            find.descendant(
              of: find.byKey(Key(key)),
              matching: find.byType(Text),
            ),
          )
          .map((t) => t.data ?? '')
          .join(' | ');

      expect(backend.costQueries.last.includeFixed, isTrue);
      expect(tile('costTile-spent'), contains('Paid'));
      expect(
        tile('costTile-spent'),
        contains(costUsd(costs.totals.paidUsd!, 'en')),
      );
      expect(tile('costTile-margin'), contains('Margin at list prices'));
      expect(find.textContaining('Free plan ·'), findsWidgets);

      await tester.tap(
        find.descendant(
          of: find.byKey(const Key('costBasis')),
          matching: find.text('Estimated'),
        ),
      );
      await tester.pumpAndSettle();
      // Estimated starts without fixed bills, as before.
      expect(backend.costQueries.last.includeFixed, isFalse);
      final estimated = _withPaid(const CostView(includeFixed: false).query);
      expect(tile('costTile-spent'), contains('Estimated'));
      expect(
        tile('costTile-spent'),
        contains(costUsd(estimated.totals.spentUsd, 'en')),
      );

      // Back to Paid: that view is known, so nothing is asked again.
      final before = backend.costQueries.length;
      await tester.tap(
        find.descendant(
          of: find.byKey(const Key('costBasis')),
          matching: find.text('Paid'),
        ),
      );
      await tester.pumpAndSettle();
      expect(backend.costQueries.length, before);
      expect(
        tile('costTile-spent'),
        contains(costUsd(costs.totals.paidUsd!, 'en')),
      );
    },
  );
}

class _RenewalVendor extends FakeBackend {
  var kind = 'renewal';
  VendorSettings? saved;

  AdminVendor _vendor({num? usd = 99, int? months = 12}) =>
      AdminVendor.fromJson({
        'vendor': 'apple_developer',
        'label': 'Apple Developer',
        'kind': kind,
        'unit': 'days',
        'limit_value': null,
        'period': null,
        'period_start': null,
        'expires_at': '2027-06-01T00:00:00Z',
        'warn_at': 0.8,
        'enabled': true,
        'balance_warn_below': 5,
        'renewal_usd': usd,
        'renewal_months': months,
        'billing_url': null,
        'impact': null,
        'latest': null,
        'history': [],
      });

  @override
  Future<List<AdminVendor>> adminVendors() async => [_vendor()];

  @override
  Future<AdminVendor> setAdminVendor(
    String vendor,
    VendorSettings settings,
  ) async {
    saved = settings;
    return _vendor(usd: settings.renewalUsd, months: settings.renewalMonths);
  }
}

/// Vendors with a working "See spend": the console's section switch, cut down to two sections.
class _VendorsThenCosts extends StatefulWidget {
  const _VendorsThenCosts();

  @override
  State<_VendorsThenCosts> createState() => _VendorsThenCostsState();
}

class _VendorsThenCostsState extends State<_VendorsThenCosts> {
  var _section = AdminSection.vendors;

  @override
  Widget build(BuildContext context) => AdminNav(
    current: _section,
    onOpen: (s) => setState(() => _section = s),
    child: Scaffold(body: _section == AdminSection.costs ? const CostsTab() : const VendorsTab()),
  );
}
