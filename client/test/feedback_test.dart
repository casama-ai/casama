import 'package:casama/core/providers.dart';
import 'package:casama/features/admin/reports_tab.dart';
import 'package:casama/features/owner_live/owner_live_screen.dart';
import 'package:casama/features/settings/support_screen.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'app_test.dart' show setSize;
import 'fake_backend.dart';

/// Feedback from the app (D-536): Help & support → Send feedback, and the owners' list.
Widget _app(FakeBackend backend, Widget home) => ProviderScope(
  overrides: [backendProvider.overrideWithValue(backend)],
  child: MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: home,
  ),
);

FeedbackRow _row(
  String id,
  String message, {
  FeedbackKind kind = FeedbackKind.idea,
  FeedbackStatus status = FeedbackStatus.new_,
  String email = 'ana@example.com',
  bool contactOk = true,
}) => FeedbackRow(
  id: id,
  kind: kind,
  message: message,
  contactOk: contactOk,
  status: status,
  userEmail: email,
  orgId: null,
  orgName: 'Ana Co',
  appVersion: '0.1.0 (90)',
  platform: 'iOS',
  plan: 'plus',
  ideasPostUrl: null,
  createdAt: DateTime.utc(2026, 11, 24),
);

void main() {
  testWidgets(
    'Help & support sends feedback with its kind, text and contact choice',
    (tester) async {
      await setSize(tester, const Size(390, 1400));
      final backend = FakeBackend();
      await tester.pumpWidget(_app(backend, const SupportScreen()));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('supportFeedback')));
      await tester.tap(find.byKey(const Key('supportFeedback')));
      await tester.pumpAndSettle();

      // Send stays off until there's something to send.
      await tester.ensureVisible(find.byKey(const Key('feedbackSend')));
      await tester.tap(find.byKey(const Key('feedbackSend')));
      await tester.pumpAndSettle();
      expect(backend.feedbackSent, isEmpty);

      await tester.tap(find.byKey(const Key('feedbackKind-confusing')));
      await tester.enterText(
        find.byKey(const Key('feedbackMessage')),
        '  I could not find where routines live.  ',
      );
      await tester.ensureVisible(find.byKey(const Key('feedbackContactOk')));
      await tester.tap(find.byKey(const Key('feedbackContactOk')));
      await tester.pump();
      await tester.ensureVisible(find.byKey(const Key('feedbackSend')));
      await tester.tap(find.byKey(const Key('feedbackSend')));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final sent = backend.feedbackSent.single;
      expect(sent.kind, FeedbackKind.confusing);
      expect(sent.message, 'I could not find where routines live.');
      expect(sent.contactOk, isFalse);
      expect(find.byKey(const Key('feedbackSend')), findsNothing);
      expect(find.text('Thanks! We read every one.'), findsOneWidget);
    },
  );

  testWidgets('an older server without feedback shows no Send feedback row', (
    tester,
  ) async {
    await setSize(tester, const Size(390, 1400));
    final backend = FakeBackend()
      ..support = SupportConfig(
        assistant: true,
        tickets: true,
        email: 'support@casama.ai',
        docsUrl: 'https://docs.casama.ai',
      );
    await tester.pumpWidget(_app(backend, const SupportScreen()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('supportFeedback')), findsNothing);
  });

  testWidgets(
    'owners read feedback, open it in full, search it and mark it done',
    (tester) async {
      await setSize(tester, const Size(1100, 1600));
      final backend = FakeBackend()
        ..feedbackRows = [
          _row('f1', 'Let me pin a chat to the top.'),
          _row(
            'f2',
            'The wallpapers are lovely.',
            kind: FeedbackKind.like,
            email: 'ben@example.com',
            contactOk: false,
          ),
        ];
      await tester.pumpWidget(
        _app(backend, const Scaffold(body: SupportTicketsTab())),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('adminFeedback')));
      expect(find.byKey(const Key('feedback-f1')), findsOneWidget);
      expect(find.byKey(const Key('feedback-f2')), findsOneWidget);
      expect(find.textContaining("Don't contact"), findsWidgets);

      await tester.enterText(find.byKey(const Key('feedbackSearch')), 'ben@');
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('feedback-f1')), findsNothing);
      expect(find.byKey(const Key('feedback-f2')), findsOneWidget);
      await tester.enterText(find.byKey(const Key('feedbackSearch')), '');
      await tester.pumpAndSettle();

      // Opening new feedback marks it read; Mark as done from the dialog.
      await tester.tap(find.byKey(const Key('feedback-f1')));
      await tester.pumpAndSettle();
      expect(backend.feedbackStatusChanges['f1'], FeedbackStatus.read);
      await tester.tap(find.byKey(const Key('feedbackDone')));
      await tester.pumpAndSettle();
      expect(backend.feedbackStatusChanges['f1'], FeedbackStatus.done);
      // The New filter no longer has it.
      expect(find.byKey(const Key('feedback-f1')), findsNothing);
    },
  );

  testWidgets('Help & support links the server\'s own ideas board when it has one', (
    tester,
  ) async {
    await setSize(tester, const Size(390, 1400));
    final launched = <Uri>[];
    final backend = FakeBackend()
      ..support = SupportConfig(
        assistant: true,
        tickets: true,
        feedback: true,
        ideasUrl: 'https://ideas.example.org',
        email: 'support@casama.ai',
        docsUrl: 'https://docs.casama.ai',
      );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          backendProvider.overrideWithValue(backend),
          supportLaunchProvider.overrideWithValue((uri) async {
            launched.add(uri);
            return true;
          }),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const SupportScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('supportIdeas')));
    await tester.tap(find.byKey(const Key('supportIdeas')));
    await tester.pumpAndSettle();
    expect(launched.single.toString(), 'https://ideas.example.org');
  });

  testWidgets('owners post feedback to the ideas board in their own words', (
    tester,
  ) async {
    await setSize(tester, const Size(1100, 1600));
    final backend = FakeBackend()
      ..feedbackRows = [_row('f1', 'pls let me pin chats!!')];
    await tester.pumpWidget(
      _app(backend, const Scaffold(body: SupportTicketsTab())),
    );
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('feedbackMenu-f1')));
    await tester.tap(find.byKey(const Key('feedbackMenu-f1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('feedbackPublish-f1')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('feedbackPublishTitle')),
      'Pin chats to the top',
    );
    await tester.enterText(
      find.byKey(const Key('feedbackPublishText')),
      'Keep important chats above the rest.',
    );
    await tester.tap(find.byKey(const Key('feedbackPublishGo')));
    await tester.pumpAndSettle();
    expect(backend.feedbackPublished['f1'], (
      title: 'Pin chats to the top',
      description: 'Keep important chats above the rest.',
    ));
    expect(find.text('Posted to the ideas board'), findsOneWidget);
  });

  testWidgets('owner live activity names feedback and files it under Support', (
    tester,
  ) async {
    late BuildContext ctx;
    await tester.pumpWidget(
      _app(
        FakeBackend(),
        Builder(
          builder: (c) {
            ctx = c;
            return const SizedBox();
          },
        ),
      ),
    );
    expect(liveKindLabel(ctx, 'feedback'), 'Feedback');
    expect(LiveGroup.support.kinds, contains('feedback'));
  });
}
