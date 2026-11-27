import 'package:casama/core/server_address.dart';
import 'package:casama/l10n/generated/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:casama/l10n/delegates.dart';

void main() {
  group('ServerAddress.parse', () {
    test(
      'accepts http and https addresses, adding the scheme when missing',
      () {
        expect(
          ServerAddress.parse('https://casama.example.com/'),
          'https://casama.example.com',
        );
        expect(
          ServerAddress.parse(' casama.example.com '),
          'https://casama.example.com',
        );
        expect(
          ServerAddress.parse('http://192.168.1.20:8080'),
          'http://192.168.1.20:8080',
        );
        expect(
          ServerAddress.parse('192.168.1.20:8080'),
          'http://192.168.1.20:8080',
        );
        expect(ServerAddress.parse('localhost:8080'), 'http://localhost:8080');
        expect(
          ServerAddress.parse('HTTPS://Casama.Example.com:8443/casama'),
          'https://Casama.Example.com:8443/casama',
        );
        expect(ServerAddress.parse('http://[::1]:8080'), 'http://[::1]:8080');
      },
    );

    test('refuses badly formed addresses', () {
      for (final bad in [
        '',
        '   ',
        'htp:/foo',
        'http:/foo',
        'ftp://casama.example.com',
        'localhost:abc',
        'http://',
        'https://',
        'http://localhost:0',
        'http://localhost:70000',
        'http://localhost:',
        'casama example.com',
        'https://casama.example.com/a b',
        'https://user:pw@casama.example.com',
        'https://casama.example.com?x=1',
        'https://-bad-.example.com',
        'https://casama..example.com',
      ]) {
        expect(ServerAddress.parse(bad), isNull, reason: bad);
      }
    });
  });

  group('changeServerDialog', () {
    tearDown(() => onChangeServer = null);

    Future<void> open(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: testLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => changeServerDialog(
                  context,
                  '',
                  title: 'Server',
                  label: 'Server address',
                  cancel: 'Cancel',
                  connect: 'Connect',
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets(
      'shows an inline error and keeps the dialog open for a bad address',
      (tester) async {
        final connected = <String>[];
        onChangeServer = (u) async => connected.add(u);
        await open(tester);
        await tester.enterText(find.byKey(const Key('serverUrl')), 'htp:/foo');
        await tester.tap(find.byKey(const Key('serverConnect')));
        await tester.pumpAndSettle();
        expect(
          find.textContaining('Enter a server address like'),
          findsOneWidget,
        );
        expect(find.byKey(const Key('serverUrl')), findsOneWidget);
        expect(connected, isEmpty);

        // Typing clears the error; a good address connects, normalized.
        await tester.enterText(
          find.byKey(const Key('serverUrl')),
          '192.168.1.20:8080/',
        );
        await tester.pump();
        expect(
          find.textContaining('Enter a server address like'),
          findsNothing,
        );
        await tester.tap(find.byKey(const Key('serverConnect')));
        await tester.pumpAndSettle();
        expect(connected, ['http://192.168.1.20:8080']);
        expect(find.byKey(const Key('serverUrl')), findsNothing);
      },
    );
  });
}
