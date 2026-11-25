import 'package:casama/features/admin/admin_attention.dart';
import 'package:casama/features/admin/admin_nav.dart';
import 'package:casama/features/admin/ui/admin_ui.dart';
import 'package:casama/features/admin/vendors_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_test.dart' show harness, setSize;
import 'fake_backend.dart';

Map<String, Object?> _vendorJson({
  required String vendor,
  required String label,
  String kind = 'quota',
  String unit = 'emails',
  String status = 'low',
  num? used = 82,
  num? remaining = 18,
  num? limit = 100,
  String? error,
  bool enabled = true,
  bool reading = true,
  String? expiresAt,
  List<Map<String, Object?>> history = const [],
}) => {
  'vendor': vendor,
  'label': label,
  'kind': kind,
  'unit': unit,
  'limit_value': limit,
  'period': 'day',
  'period_start': null,
  'expires_at': expiresAt,
  'warn_at': 0.8,
  'enabled': enabled,
  'balance_warn_below': 5,
  'billing_url': null,
  'impact': null,
  'latest': reading
      ? {
          'checked_at': '2026-11-20T00:00:00Z',
          'used': used,
          'remaining': remaining,
          'limit_value': limit,
          'resets_at': null,
          'status': status,
          'source': 'own_count',
          'error': error,
        }
      : null,
  'history': history,
};

class _Vendors extends FakeBackend {
  _Vendors([List<Map<String, Object?>>? vendors])
    : vendors = vendors ?? [_vendorJson(vendor: 'resend', label: 'Resend')];
  final List<Map<String, Object?>> vendors;
  VendorSettings? saved;
  final checked = <String>[];

  AdminVendor _find(String id) => AdminVendor.fromJson(vendors.firstWhere((v) => v['vendor'] == id));

  @override
  Future<List<AdminVendor>> adminVendors() async => [for (final v in vendors) AdminVendor.fromJson(v)];

  @override
  Future<AdminVendor> setAdminVendor(String vendor, VendorSettings settings) async {
    saved = settings;
    return _find(vendor);
  }

  @override
  Future<AdminVendor> checkAdminVendor(String vendor) async {
    checked.add(vendor);
    return _find(vendor);
  }
}

/// Three services, one in each state that needs (or doesn't need) attention, listed out of order.
List<Map<String, Object?>> _mixed() => [
  _vendorJson(vendor: 'fine', label: 'Fine Co', status: 'ok', used: 10),
  _vendorJson(vendor: 'low', label: 'Low Co', status: 'low', used: 85),
  _vendorJson(vendor: 'out', label: 'Out Co', status: 'out', used: 100),
  _vendorJson(vendor: 'idle', label: 'Idle Co', status: 'unknown', error: 'not_configured', used: null),
];

void main() {
  testWidgets('a low vendor gets a badge for the side list and the overview', (tester) async {
    late Map<AdminSection, AdminBadge> badges;
    await tester.pumpWidget(
      harness(
        _Vendors(),
        Consumer(
          builder: (context, ref, _) {
            badges = ref.watch(adminBadgesProvider);
            return const SizedBox();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(badges[AdminSection.vendors]?.count, 1);
    expect(badges[AdminSection.overview]?.count, 1);
  });

  testWidgets('shows vendor reading and warning, opens details', (tester) async {
    await tester.pumpWidget(harness(_Vendors(), const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    expect(find.text('Resend'), findsOneWidget);
    expect(find.textContaining('82 / 100 emails'), findsOneWidget);
    await tester.tap(find.text('Resend'));
    await tester.pumpAndSettle();
    expect(find.text('Check now'), findsOneWidget);
    expect(find.text('Monitoring enabled'), findsOneWidget);
  });

  testWidgets('a low quota shows an amber meter and the share used in its pill', (tester) async {
    await setSize(tester, const Size(390, 1600));
    await tester.pumpWidget(harness(_Vendors(), const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    expect(find.text('Low · 82%'), findsOneWidget);
    final pill = tester.widget<AdminStatusPill>(find.byKey(const Key('vendorPill-resend')));
    expect(pill.tone, AdminTone.warning);
    final meter = tester.widget<AdminMeter>(find.byKey(const Key('vendorMeter-resend')));
    expect(meter.fraction, closeTo(0.82, 0.001));
    expect(meter.tone, AdminTone.warning);
    expect(find.text('Counted by Casama'), findsOneWidget);
  });

  testWidgets('groups put out before low before healthy, and hide services not set up', (tester) async {
    await setSize(tester, const Size(390, 2400));
    await tester.pumpWidget(harness(_Vendors(_mixed()), const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    final out = tester.getTopLeft(find.text('Out Co')).dy;
    final low = tester.getTopLeft(find.text('Low Co')).dy;
    final fine = tester.getTopLeft(find.text('Fine Co')).dy;
    expect(out, lessThan(low));
    expect(low, lessThan(fine));
    expect(find.textContaining('Needs attention', findRichText: true), findsOneWidget);
    expect(find.text('2 need attention · 1 OK · 1 not set up'), findsOneWidget);
    // Not set up: tucked away behind "Show 1 more".
    expect(find.text('Idle Co'), findsNothing);
    await tester.tap(find.text('Show 1 more'));
    await tester.pumpAndSettle();
    expect(find.text('Idle Co'), findsOneWidget);
  });

  testWidgets('Check all checks every service that is set up', (tester) async {
    await setSize(tester, const Size(390, 2400));
    final backend = _Vendors(_mixed());
    await tester.pumpWidget(harness(backend, const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('vendorCheckAll')));
    await tester.pumpAndSettle();
    expect(backend.checked, unorderedEquals(['fine', 'low', 'out']));
  });

  testWidgets('the date picker sets the expiry', (tester) async {
    await setSize(tester, const Size(1300, 1400));
    final backend = _Vendors([_vendorJson(vendor: 'resend', label: 'Resend', expiresAt: '2027-06-01T00:00:00Z')]);
    await tester.pumpWidget(harness(backend, const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Resend'));
    await tester.pumpAndSettle();
    // Wide: the detail sits beside the list.
    expect(find.byType(VendorDetail), findsOneWidget);
    await tester.ensureVisible(find.byKey(const Key('vendorExpiry')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('vendorExpiry')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('15'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(backend.saved!.expiresAt, DateTime.utc(2027, 6, 15));

    // Cleared: saved as no expiry.
    await tester.ensureVisible(find.byKey(const Key('vendorExpiry-clear')));
    await tester.tap(find.byKey(const Key('vendorExpiry-clear')));
    await tester.pump();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(backend.saved!.expiresAt, isNull);
  });

  testWidgets('the warn-at slider saves 0.9', (tester) async {
    await setSize(tester, const Size(390, 1400));
    final backend = _Vendors();
    await tester.pumpWidget(harness(backend, const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Resend'));
    await tester.pumpAndSettle();
    final slider = find.byKey(const Key('vendorWarnAt'));
    await tester.ensureVisible(slider);
    await tester.pumpAndSettle();
    tester.widget<Slider>(slider).onChanged!(0.9);
    await tester.pump();
    expect(find.text('Warn at 90% used'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(backend.saved!.warnAt, 0.9);
  });

  testWidgets('a limit of zero is refused on its field', (tester) async {
    await setSize(tester, const Size(390, 1400));
    final backend = _Vendors();
    await tester.pumpWidget(harness(backend, const Scaffold(body: VendorsTab())));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Resend'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('vendorLimit')));
    await tester.enterText(find.byKey(const Key('vendorLimit')), '0');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(backend.saved, isNull);
    expect(find.text('Enter a number above 0.'), findsOneWidget);
  });

  for (final width in [360.0, 1300.0]) {
    testWidgets('no overflow at ${width.toInt()} wide, list and detail', (tester) async {
      await setSize(tester, Size(width, 900));
      final vendors = _mixed()
        ..add(
          _vendorJson(
            vendor: 'balance',
            label: 'A balance service with a long name',
            kind: 'balance',
            unit: 'usd',
            status: 'ok',
            used: null,
            remaining: 9.1,
            limit: 50,
            history: [
              for (var i = 0; i < 5; i++)
                {
                  'checked_at': '2026-11-1${i}T00:00:00Z',
                  'used': null,
                  'remaining': 20 - i * 2,
                  'limit_value': 50,
                  'resets_at': null,
                  'status': 'ok',
                  'source': 'api',
                  'error': null,
                },
            ],
          ),
        );
      await tester.pumpWidget(harness(_Vendors(vendors), const Scaffold(body: VendorsTab())));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text(r'$9.10 left'), findsWidgets);
      await tester.ensureVisible(find.text('A balance service with a long name'));
      await tester.tap(find.text('A balance service with a long name'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byKey(const Key('vendorSparkline')), findsOneWidget);
    });
  }
}
