// Numbers for the admin's Costs tab, shaped like the server's answers, with the awkward cases:
// one giant service, forty rows, all zeros, a vendor that gave no figure, very long names and
// amounts under a cent.
import 'dart:math' as math;

import 'package:casama/core/backend.dart';
import 'package:casama_sdk/casama_sdk.dart';

const kCostsTo = '2026-11-22';

String _ago(Duration d) => DateTime.now().toUtc().subtract(d).toIso8601String();

AdminCostRow costRow(
  String id,
  String label,
  num spent, {
  num charged = 0,
  num? tracked,
  int calls = 0,
  num? previous,
  bool noPrevious = false,
  CostSource source = CostSource.metered,
  num? reported,
  String? vendor,
  Duration? lastUsed,
  String? plan,
  String? kind,
  int? failed,
  num? tokenEst,
}) => AdminCostRow(
  id: id,
  label: label,
  spentUsd: spent,
  chargedUsd: charged,
  chargedTrackedUsd: tracked ?? charged,
  calls: calls,
  previousSpentUsd: noPrevious ? null : previous ?? spent,
  source_: source,
  reportedUsd: reported,
  vendor: vendor,
  lastUsedAt: lastUsed == null ? null : _ago(lastUsed),
  planCode: plan,
  integrationKind: kind,
  failed: failed,
  tokenUsdEst: tokenEst,
);

/// The everyday month, by grouping: the numbers of the plan's own sketch.
List<AdminCostRow> everydayRows(CostGroup group) => switch (group) {
  CostGroup.service => [
    costRow(
      'openrouter',
      'OpenRouter',
      4.44,
      charged: 6.16,
      calls: 9769,
      previous: 3.89,
      reported: 4.61,
    ),
    costRow(
      'gemini',
      'Gemini',
      0.81,
      charged: 1.19,
      calls: 46,
      previous: 0.835,
      reported: 0.81,
    ),
    costRow(
      'composio',
      'Composio',
      0.42,
      charged: 0.58,
      calls: 208,
      previous: 0.30,
      reported: 0.65,
    ),
    costRow(
      'own_servers',
      'Own servers',
      0.19,
      charged: 0.09,
      calls: 111,
      previous: 0.19,
    ),
    costRow(
      'zeptomail',
      'ZeptoMail',
      0.03,
      calls: 120,
      previous: 0.0286,
      source: CostSource.counted,
    ),
    costRow('serper', 'Serper', 0.004, calls: 12, noPrevious: true),
    costRow('', '', 0.02, calls: 9, previous: 0.05),
  ],
  CostGroup.key => [
    costRow(
      'CLOUD_MODEL_UPSTREAM_KEY',
      'Casama server',
      4.30,
      charged: 6.02,
      calls: 9512,
      previous: 3.80,
      vendor: 'openrouter',
      lastUsed: const Duration(minutes: 2),
      reported: 4.47,
    ),
    costRow(
      'GEMINI_API_KEY',
      'Gemini (voice and images)',
      0.81,
      charged: 1.19,
      calls: 46,
      previous: 0.835,
      vendor: 'gemini',
      lastUsed: const Duration(hours: 1),
    ),
    costRow(
      'COMPOSIO_API_KEY',
      'Composio (apps)',
      0.42,
      charged: 0.58,
      calls: 208,
      previous: 0.30,
      vendor: 'composio',
      lastUsed: const Duration(minutes: 20),
    ),
    costRow(
      'HELP_MODEL_KEY',
      'Casama Help (websites)',
      0.14,
      charged: 0.14,
      calls: 257,
      previous: 0.09,
      vendor: 'openrouter',
      lastUsed: const Duration(hours: 3),
    ),
    costRow(
      'ZEPTOMAIL_TOKEN',
      'ZeptoMail (app mail)',
      0.03,
      calls: 120,
      previous: 0.0286,
      vendor: 'zeptomail',
      source: CostSource.counted,
      lastUsed: const Duration(hours: 5),
    ),
    costRow('', '', 0.21, calls: 120, previous: 0.24),
  ],
  CostGroup.app => [
    costRow(
      'gmail',
      'Gmail',
      0.21,
      calls: 120,
      previous: 0.15,
      kind: 'composio',
      failed: 4,
      tokenEst: 0.42,
      source: CostSource.metered,
    ),
    costRow(
      'github',
      'GitHub',
      0.12,
      calls: 60,
      previous: 0.20,
      kind: 'composio',
      failed: 9,
      tokenEst: 0.18,
    ),
    costRow(
      'linear-mcp',
      'Linear (MCP server)',
      0,
      calls: 38,
      noPrevious: true,
      kind: 'mcp',
      failed: 0,
      tokenEst: 0.07,
      source: CostSource.estimated,
    ),
    costRow(
      'notion',
      'Notion',
      0.09,
      calls: 28,
      previous: 0.09,
      kind: 'composio',
      failed: 1,
      tokenEst: 0.004,
    ),
    costRow(
      'custom',
      'Custom servers',
      0,
      calls: 14,
      previous: 0,
      kind: 'mcp',
      failed: 2,
      tokenEst: 0.02,
      source: CostSource.estimated,
    ),
  ],
  CostGroup.feature => [
    costRow(
      'chat',
      'Chat replies',
      3.61,
      charged: 5.10,
      calls: 7120,
      previous: 3.05,
    ),
    costRow(
      'routines',
      'Routines',
      1.02,
      charged: 1.44,
      calls: 1410,
      previous: 0.92,
    ),
    costRow(
      'voice',
      'Voice calls',
      0.62,
      charged: 0.94,
      calls: 31,
      previous: 0.71,
    ),
    costRow('web_search', 'Web search', 0.31, calls: 402, previous: 0.22),
    costRow(
      'help_site',
      'Casama Help on the website',
      0.14,
      calls: 257,
      previous: 0.09,
    ),
    costRow('images', 'Images', 0.19, charged: 0.25, calls: 15, previous: 0.12),
    costRow('', '', 0.02, calls: 9, previous: 0.05),
  ],
  CostGroup.model => [
    costRow(
      'anthropic/claude-sonnet-5.5',
      'Claude Sonnet 5.5',
      2.71,
      charged: 3.80,
      calls: 3120,
      previous: 2.20,
    ),
    costRow(
      'google/gemini-4-flash',
      'Gemini 4 Flash',
      1.12,
      charged: 1.61,
      calls: 5210,
      previous: 1.31,
    ),
    costRow(
      'openai/gpt-6-mini',
      'GPT-6 mini',
      0.61,
      charged: 0.75,
      calls: 1439,
      previous: 0.38,
    ),
    costRow('', '', 1.47, charged: 1.87, calls: 497, previous: 1.38),
  ],
  CostGroup.workspace => [
    costRow(
      '11111111-1111-4111-8111-111111111111',
      'Acme',
      2.90,
      charged: 4.10,
      calls: 5120,
      previous: 2.40,
      plan: 'pro',
    ),
    costRow(
      '22222222-2222-4222-8222-222222222222',
      'Globex',
      1.75,
      charged: 2.60,
      calls: 3110,
      previous: 1.90,
      plan: 'plus',
    ),
    costRow(
      '33333333-3333-4333-8333-333333333333',
      'Initech',
      0.72,
      charged: 1.33,
      calls: 1650,
      previous: 0.61,
      plan: 'max',
    ),
    costRow('', '', 0.54, calls: 386, previous: 0.36),
  ],
};

/// Rows of the everyday month as the server would narrow them: a service's keys are its own;
/// any other filter leaves the first three rows at a share of their size.
List<AdminCostRow> _narrowed(CostQuery q) {
  final rows = everydayRows(q.group);
  final app = q.filters[CostGroup.app];
  // An app narrowed to itself: its tools, then the tool list sent to the model. Custom servers
  // name no tools.
  if (q.group == CostGroup.app && app != null) {
    if (app == 'custom') return const [];
    return [
      for (var i = 0; i < 10; i++)
        costRow(
          '${app.toUpperCase()}_TOOL_${i + 1}',
          '',
          0,
          calls: 40 - i * 4,
          failed: i == 1 ? 9 : 0,
          tokenEst: 0.05 / (i + 1),
          source: CostSource.estimated,
        ),
      costRow('', '', 0, tokenEst: 0.031, source: CostSource.estimated),
    ];
  }
  if (q.filters.isEmpty) return rows;
  final service = q.filters[CostGroup.service];
  if (q.group == CostGroup.key && service != null) {
    return rows.where((r) => r.vendor == service).toList();
  }
  final key = q.filters[CostGroup.key];
  if (q.group == CostGroup.service && key != null) return rows.take(1).toList();
  return [
    for (final r in rows.where((r) => r.id.isNotEmpty).take(3))
      costRow(
        r.id,
        r.label,
        r.spentUsd * 0.6,
        charged: r.chargedUsd * 0.6,
        calls: (r.calls * 0.6).round(),
        previous: (r.previousSpentUsd ?? 0) * 0.6,
        source: r.source_,
        vendor: r.vendor,
        plan: r.planCode,
      ),
  ];
}

/// A whole answer built from [rows]: totals added up, the six biggest as the chart's stacks with
/// the rest as "other", and each stack spread over the days in a steady, uneven pattern.
AdminCosts costsOf(
  CostQuery q,
  List<AdminCostRow> rows, {
  num notRecorded = 0,
  num fixed = 0,
  num own = 0,
  bool noPrevious = false,
  int stacks = 6,
}) {
  final days = q.isCustom
      ? DateTime.parse('${q.to}T00:00:00Z')
                .difference(DateTime.parse('${q.from}T00:00:00Z'))
                .inDays +
            1
      : q.days;
  final to = DateTime.parse('${q.isCustom ? q.to : kCostsTo}T00:00:00Z');
  final from = to.subtract(Duration(days: days - 1));
  String ymd(DateTime d) => d.toIso8601String().substring(0, 10);
  final ranked = [...rows]..sort((a, b) => b.spentUsd.compareTo(a.spentUsd));
  final top = ranked.where((r) => r.spentUsd > 0).take(stacks).toList();
  final rest = ranked.skip(top.length).fold<num>(0, (n, r) => n + r.spentUsd);
  // Weights that add up to one: busier on weekdays, with a rise toward the end of the period.
  List<double> spread(int seed) {
    final raw = [
      for (var d = 0; d < days; d++)
        (0.55 + 0.45 * math.sin((d + seed * 3) * 0.9).abs()) *
            (from.add(Duration(days: d)).weekday >= 6 ? 0.45 : 1) *
            (1 + d / days * 0.6),
    ];
    final sum = raw.fold<double>(0, (a, b) => a + b);
    return [for (final v in raw) v / sum];
  }

  final weights = [for (var i = 0; i <= top.length; i++) spread(i)];
  num sum(num Function(AdminCostRow r) f) =>
      rows.fold<num>(0, (n, r) => n + f(r));
  final spent = sum((r) => r.spentUsd) + (q.includeFixed ? fixed : 0);
  return AdminCosts(
    from: ymd(from),
    to: ymd(to),
    group: q.group,
    includeFixed: q.includeFixed,
    totals: AdminCostTotals(
      spentUsd: spent,
      chargedUsd: sum((r) => r.chargedUsd),
      chargedTrackedUsd: sum((r) => r.chargedTrackedUsd),
      ownUsd: own,
      fixedUsd: fixed,
      notRecordedUsd: notRecorded,
      calls: sum((r) => r.calls).toInt(),
    ),
    previous: noPrevious
        ? null
        : AdminCostTotals(
            spentUsd: sum((r) => r.previousSpentUsd ?? 0),
            chargedUsd: sum((r) => r.chargedUsd) * 0.92,
            chargedTrackedUsd: sum((r) => r.chargedTrackedUsd) * 0.9,
            ownUsd: 0,
            fixedUsd: fixed,
            notRecordedUsd: 0,
            calls: (sum((r) => r.calls) * 0.9).toInt(),
          ),
    series: [
      for (final r in top) AdminCostsSeriesInner(id: r.id, label: r.label),
      if (rest > 0) AdminCostsSeriesInner(id: '__other', label: 'Other'),
    ],
    byDay: [
      for (var d = 0; d < days; d++)
        AdminCostsByDayInner(
          date: ymd(from.add(Duration(days: d))),
          values: [
            for (final (i, r) in top.indexed) r.spentUsd * weights[i][d],
            if (rest > 0) rest * weights[top.length][d],
          ],
        ),
    ],
    rows: rows,
    updatedAt: _ago(const Duration(minutes: 5)),
  );
}

/// The everyday month for any query: what the fake server answers unless a test says otherwise.
AdminCosts everydayCosts(CostQuery q) => costsOf(
  q,
  _narrowed(q),
  notRecorded: q.filters.isEmpty ? 0.40 : 0,
  fixed: 31.5,
  own: 2.18,
);

/// One service dwarfs the rest: their bars and stacks must still show.
AdminCosts giantCosts(CostQuery q) => costsOf(q, [
  costRow(
    'openrouter',
    'OpenRouter',
    1842.17,
    charged: 2410.03,
    calls: 1204311,
    previous: 911.02,
    reported: 1842.17,
  ),
  costRow('gemini', 'Gemini', 3.11, charged: 4.02, calls: 310, previous: 2.90),
  costRow(
    'composio',
    'Composio',
    1.02,
    charged: 1.40,
    calls: 508,
    previous: 1.00,
  ),
  costRow(
    'zeptomail',
    'ZeptoMail',
    0.04,
    calls: 160,
    previous: 0.03,
    source: CostSource.counted,
  ),
  costRow('serper', 'Serper', 0.002, calls: 3, previous: 0.001),
]);

/// Forty workspaces, the long tail in fractions of a cent.
AdminCosts fortyCosts(CostQuery q) => costsOf(q, [
  for (var i = 0; i < 40; i++)
    costRow(
      '00000000-0000-4000-8000-${i.toString().padLeft(12, '0')}',
      'Workspace ${i + 1}',
      i < 25 ? 12 / (i + 1) : 0.009 / (i - 23),
      charged: i < 25 ? 17 / (i + 1) : 0,
      calls: 4000 ~/ (i + 1),
      previous: i.isEven ? 10 / (i + 1) : 14 / (i + 1),
      plan: const ['pro', 'plus', 'max', null][i % 4],
    ),
]);

/// Every service is there and nothing was spent: zeros, not dashes.
AdminCosts zeroCosts(CostQuery q) => costsOf(q, [
  costRow('openrouter', 'OpenRouter', 0, previous: 0),
  costRow('gemini', 'Gemini', 0, previous: 0),
  costRow('zeptomail', 'ZeptoMail', 0, previous: 0, source: CostSource.counted),
]);

/// No vendor gave a figure of its own (their checks failed): "not recorded" isn't known.
AdminCosts noFigureCosts(CostQuery q) => costsOf(q, [
  costRow(
    'openrouter',
    'OpenRouter',
    4.44,
    charged: 6.16,
    calls: 9769,
    previous: 3.89,
  ),
  costRow('gemini', 'Gemini', 0.81, charged: 1.19, calls: 46, previous: 0.835),
]);

const kLongName =
    'Customer support assistant for the northern European wholesale division (staging, do not delete)';

/// Names that don't fit, in the table, the legend, the chips and the detail.
AdminCosts longNameCosts(CostQuery q) => costsOf(q, [
  costRow(
    'long-1',
    kLongName,
    6.20,
    charged: 8.10,
    calls: 4100,
    previous: 5.0,
    reported: 6.9,
  ),
  costRow(
    'long-2',
    'anthropic/claude-sonnet-5.5-20261101-extended-thinking-preview-with-a-very-long-suffix',
    2.05,
    charged: 2.60,
    calls: 900,
    previous: 2.6,
  ),
  costRow(
    'long-3',
    'Zweihundertfünfundfünfzigtausendsiebenhundert Rechnungen GmbH & Co. KG',
    0.0004,
    calls: 2,
    noPrevious: true,
    source: CostSource.estimated,
  ),
], notRecorded: 0.70);

/// The server's own keys, as the key list reports them.
List<AdminCostKey> everydayKeys() => [
  AdminCostKey(
    keyRef: 'CLOUD_MODEL_UPSTREAM_KEY',
    vendor: 'openrouter',
    vendorLabel: 'OpenRouter',
    label: 'Casama server',
    purpose: 'Cloud models for every workspace on Casama Cloud',
    setIn: "The server's env file",
    vaultItem: 'Casama · OpenRouter server key',
    billingUrl: 'https://openrouter.ai/settings/credits',
    configured: true,
    spentUsd: 4.30,
    calls: 9512,
    lastUsedAt: _ago(const Duration(minutes: 2)),
    reportedUsd: 4.47,
    limitUsd: 100,
    limitRemainingUsd: 58.2,
  ),
  AdminCostKey(
    keyRef: 'HELP_MODEL_KEY',
    vendor: 'openrouter',
    vendorLabel: 'OpenRouter',
    label: 'Casama Help (websites)',
    purpose: 'The help bot on casama.ai and the docs',
    setIn: 'A Worker secret',
    vaultItem: null,
    billingUrl: 'https://openrouter.ai/settings/credits',
    configured: false,
    spentUsd: 0.14,
    calls: 257,
    lastUsedAt: null,
    reportedUsd: null,
    limitUsd: null,
    limitRemainingUsd: null,
  ),
];
