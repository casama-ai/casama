import 'package:casama/core/providers.dart';
import 'package:casama/features/admin/reports_tab.dart';
import 'package:casama/features/moderation/report_sheet.dart';
import 'package:casama/features/notifications/email_tips.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';

Widget _app(FakeBackend backend, Widget home) => ProviderScope(
  overrides: [backendProvider.overrideWithValue(backend)],
  child: MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: home,
  ),
);

Widget _opener(void Function(BuildContext) open) => Builder(
  builder: (c) => Scaffold(
    body: Center(child: TextButton(onPressed: () => open(c), child: const Text('open'))),
  ),
);

void main() {
  testWidgets('reporting a bot reply needs a reason and sends it (D-301)', (tester) async {
    await setSize(tester, const Size(800, 1200));
    final backend = FakeBackend();
    await tester.pumpWidget(
      _app(
        backend,
        _opener((c) => showReportSheet(c, kind: ReportTarget.message, targetId: 'm-1')),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Report reply'), findsWidgets);
    expect(tester.widget<FilledButton>(find.byKey(const Key('reportSend'))).onPressed, isNull);
    await tester.tap(find.byKey(const Key('reportReason-violence')));
    await tester.enterText(find.byKey(const Key('reportNote')), 'it threatened me');
    await tester.pump();
    await tester.tap(find.byKey(const Key('reportSend')));
    await tester.pumpAndSettle();
    expect(backend.reports.single, (ReportTarget.message, 'm-1', ReportReason.violence, 'it threatened me'));
    expect(find.text('Thanks. Your report was sent for review.'), findsOneWidget);
  });

  testWidgets('a person can be blocked, shows in Blocked people, and can be unblocked', (tester) async {
    await setSize(tester, const Size(800, 1200));
    final backend = FakeBackend();
    await tester.pumpWidget(
      _app(backend, _opener((c) => showPersonActions(c, userId: 'u-ben', name: 'Ben'))),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('personBlock')));
    await tester.pumpAndSettle();
    expect(backend.blocked.keys, ['u-ben']);
    expect(find.text('Ben is blocked'), findsOneWidget);

    await tester.pumpWidget(_app(backend, const BlockedPeopleScreen()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('blocked-u-ben')), findsOneWidget);
    await tester.tap(find.byKey(const Key('unblock-u-ben')));
    await tester.pumpAndSettle();
    expect(backend.blocked, isEmpty);
    expect(find.text('No one is blocked'), findsOneWidget);
  });

  testWidgets('the admin Reports tab acts on a report and takes down a public link', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()
      ..contentReports = [
        ContentReport(
          id: 'r-1',
          targetKind: ReportTargetKind.message,
          targetId: 'm-1',
          targetOrgId: 'o-1',
          targetOrgName: 'Acme',
          reason: ReportReason.spam,
          note: 'scam link',
          snapshot: 'Helper: buy cheap pills',
          reporterEmail: 'ana@example.com',
          sameTarget: 3,
          status: ContentReportStatusEnum.open,
          createdAt: DateTime.utc(2026, 11, 15),
        ),
      ]
      ..reportedLinks = [
        ReportedCreation(
          id: 'c-1',
          orgId: 'o-1',
          orgName: 'Acme',
          title: 'Landing page',
          kind: 'page',
          reports: 2,
          reporters: 2,
          lastReason: 'phishing',
          takenDown: false,
          lastReportedAt: DateTime.utc(2026, 11, 15),
        ),
      ];
    await tester.pumpWidget(_app(backend, const Scaffold(body: ReportsTab())));
    await tester.pumpAndSettle();
    expect(find.textContaining('buy cheap pills'), findsOneWidget);
    expect(find.textContaining('3 reports'), findsOneWidget);
    expect(find.byKey(const Key('contentReport-r-1')), findsOneWidget);
    // Suspending the workspace asks first.
    await tester.tap(find.byKey(const Key('reviewSuspend-r-1')));
    await tester.pumpAndSettle();
    expect(backend.reviewed, isEmpty);
    await tester.tap(find.byKey(const Key('confirmReportSuspend')));
    await tester.pumpAndSettle();
    expect(backend.reviewed.single, ('r-1', true, true));
    // So does taking a link down.
    await tester.tap(find.text('Take down'));
    await tester.pumpAndSettle();
    expect(backend.takenDown, isEmpty);
    await tester.tap(find.byKey(const Key('confirmTakeDown')));
    await tester.pumpAndSettle();
    expect(backend.takenDown, ['c-1']);
  });

  testWidgets('the admin Reports tab shows a held page with what the check saw, and approves it (D-550)', (tester) async {
    await setSize(tester, const Size(900, 1400));
    final backend = FakeBackend()
      ..reportedLinks = [
        ReportedCreation(
          id: 'c-held',
          orgId: 'o-1',
          orgName: 'Acme',
          title: 'PayPal - Confirm your account',
          kind: 'page',
          reports: 1,
          reporters: 0,
          lastReason: 'Automatic check: a password field on a page made in the last 7 days',
          takenDown: false,
          lastReportedAt: DateTime.utc(2026, 11, 25),
          held: true,
          heldReason: 'a password field on a page made in the last 7 days',
        ),
      ];
    await tester.pumpWidget(_app(backend, const Scaffold(body: ReportsTab())));
    await tester.pumpAndSettle();
    expect(find.text('On hold'), findsOneWidget);
    expect(find.byKey(const Key('reportedLinkHeld-c-held')), findsOneWidget);
    expect(find.textContaining('Automatic check:'), findsNothing);
    expect(find.byKey(const Key('reportedLinkToggle-c-held')), findsOneWidget);
    await tester.tap(find.byKey(const Key('reportedLinkApprove-c-held')));
    await tester.pumpAndSettle();
    expect(backend.approvedHeld, ['c-held']);
  });

  testWidgets('the admin Reports tab filters by kind', (tester) async {
    await setSize(tester, const Size(900, 1400));
    ContentReport report(String id, ReportTargetKind kind) => ContentReport(
      id: id,
      targetKind: kind,
      targetId: 't-$id',
      targetOrgId: null,
      targetOrgName: null,
      reason: ReportReason.spam,
      note: null,
      snapshot: null,
      reporterEmail: null,
      sameTarget: 1,
      status: ContentReportStatusEnum.open,
      createdAt: DateTime.utc(2026, 11, 15),
    );
    final backend = FakeBackend()
      ..contentReports = [report('r-1', ReportTargetKind.message), report('r-2', ReportTargetKind.bot), report('r-3', ReportTargetKind.bot)];
    await tester.pumpWidget(_app(backend, const Scaffold(body: ReportsTab())));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('contentReport-r-1')), findsOneWidget);
    await tester.tap(find.byKey(const Key('adminFilter-bot')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('contentReport-r-1')), findsNothing);
    expect(find.byKey(const Key('contentReport-r-2')), findsOneWidget);
    expect(find.byKey(const Key('contentReport-r-3')), findsOneWidget);
    // Without a workspace there's no suspend, and dismissing needs no confirm.
    expect(find.byKey(const Key('reviewSuspend-r-2')), findsNothing);
    await tester.tap(find.byKey(const Key('reviewDismiss-r-2')));
    await tester.pumpAndSettle();
    expect(backend.reviewed.single, ('r-2', false, false));
  });

  testWidgets('the admin Support tab closes a ticket (D-303)', (tester) async {
    await setSize(tester, const Size(900, 1200));
    final backend = FakeBackend()
      ..tickets = [
        SupportTicketRow(
          reference: 'C-ABC234',
          topic: 'billing',
          subject: 'Charged twice',
          status: SupportTicketRowStatusEnum.open,
          userEmail: 'ana@example.com',
          orgId: null,
          orgName: null,
          createdAt: DateTime.utc(2026, 11, 15),
          closedAt: null,
        ),
      ];
    await tester.pumpWidget(_app(backend, const Scaffold(body: SupportTicketsTab())));
    await tester.pumpAndSettle();
    expect(find.text('Charged twice'), findsOneWidget);
    expect(find.textContaining('C-ABC234'), findsOneWidget);
    // Close sits in the row's menu and asks first.
    await tester.tap(find.byKey(const Key('ticketMenu-C-ABC234')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('ticketToggle-C-ABC234')));
    await tester.pumpAndSettle();
    expect(find.text('Close C-ABC234?'), findsOneWidget);
    expect(backend.closedTickets, isEmpty);
    await tester.tap(find.byKey(const Key('confirmTicketToggle')));
    await tester.pumpAndSettle();
    expect(backend.closedTickets, ['C-ABC234']);
  });

  testWidgets('the admin Support tab searches by reference, subject or email', (tester) async {
    await setSize(tester, const Size(900, 1200));
    SupportTicketRow ticket(String ref, String subject, String email) => SupportTicketRow(
      reference: ref,
      topic: 'billing',
      subject: subject,
      status: SupportTicketRowStatusEnum.open,
      userEmail: email,
      orgId: null,
      orgName: null,
      createdAt: DateTime.utc(2026, 11, 15),
      closedAt: null,
    );
    final backend = FakeBackend()
      ..tickets = [ticket('C-ABC234', 'Charged twice', 'ana@example.com'), ticket('C-XYZ789', 'App crashes', 'ben@example.com')];
    await tester.pumpWidget(_app(backend, const Scaffold(body: SupportTicketsTab())));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('ticket-C-XYZ789')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('ticketSearch')), 'ana@');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('ticket-C-ABC234')), findsOneWidget);
    expect(find.byKey(const Key('ticket-C-XYZ789')), findsNothing);
    await tester.enterText(find.byKey(const Key('ticketSearch')), 'xyz7');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('ticket-C-ABC234')), findsNothing);
    expect(find.byKey(const Key('ticket-C-XYZ789')), findsOneWidget);
    // Topics show as words.
    expect(find.textContaining('billing'), findsNothing);
  });

  testWidgets('tips and news emails can be turned off (D-302)', (tester) async {
    final backend = FakeBackend();
    await tester.pumpWidget(_app(backend, const Scaffold(body: EmailTipsTile())));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('emailTipsSwitch')));
    await tester.pumpAndSettle();
    expect(backend.tipsEmails, isFalse);
  });
}
