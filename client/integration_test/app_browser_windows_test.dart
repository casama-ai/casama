// The Windows in-app browser end to end (docs/WINDOWS-BROWSER-PLAN.md): the real WebView2 runtime
// and the native code in client/windows/app_browser, driven through the real method channel,
// against pages served from this test. Needs the browser compiled in:
//
//   CASAMA_APP_BROWSER=1 flutter test integration_test/app_browser_windows_test.dart -d windows \
//     --dart-define=CASAMA_APP_BROWSER=true
//
// Skips itself on other platforms.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:casama/features/app_browser/app_browser_channel.dart';
import 'package:casama/features/app_browser/app_browser_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';

/// The page under test. `__seen` records, from the page's own scripts, anything of Casama's they
/// could reach; the title carries it out.
String _form(String other) =>
    '''
<!doctype html><html><head><title>Form page</title>
<script>
window.addEventListener('load', () => {
  const seen = Object.getOwnPropertyNames(window).filter((n) => /casama/i.test(n));
  document.title = 'Form page|' + (seen.join(',') || 'nothing') + '|' + typeof window.__casamaPageAgent;
});
</script></head><body>
<h1>Order</h1>
<label for="name">Your name</label><input id="name" type="text">
<label for="pw">Password</label><input id="pw" type="password" value="hunter2">
<button id="go" onclick="document.getElementById('out').textContent='Hello, '+document.getElementById('name').value">Say hello</button>
<p id="out"></p>
<a href="/second">Next page</a>
<button id="al" onclick="alert('Careful!')">Alert me</button>
<iframe src="/frame" width="300" height="80"></iframe>
<iframe src="$other/cross" width="300" height="80"></iframe>
<p><a href="/file">Get file</a> <a href="/file" download="saved.zip">Save file</a></p>
</body></html>''';

const _frame = '''
<!doctype html><html><body><button>Inside frame</button></body></html>''';

/// Served from another site (localhost, not 127.0.0.1), so Chromium runs it in its own process.
const _cross = '''
<!doctype html><html><body><label for="zip">Postcode</label><input id="zip"></body></html>''';

const _second = '''
<!doctype html><html><head><title>Second page</title></head><body><p>Arrived</p>
<script>document.cookie = "visited=yes; max-age=3600";</script></body></html>''';

/// Something sized to the viewport's width, like many sites' headers; the title reports
/// `scrollWidth clientWidth` so the test can see sideways overflow.
const _wide = '''
<!doctype html><html><head><title>wide</title><script>
function r() { const d = document.documentElement; document.title = d.scrollWidth + ' ' + d.clientWidth; }
addEventListener('load', r); addEventListener('resize', r);
</script></head><body style="margin:0"><div style="width:100vw;height:40px;background:#eee"></div>
<div style="height:3000px"></div></body></html>''';

/// A blank white page, so the bot's cursor is the only colour on it.
const _white = '''
<!doctype html><html><head><title>white</title></head><body style="margin:0;background:#fff"></body></html>''';

class _Events implements AppBrowserNativeEvents {
  final log = <String>[];
  final finished = StreamController<String>.broadcast();
  final dialogs = StreamController<String>.broadcast();
  bool Function(String url) allow = (_) => true;

  @override
  Future<bool> navigate(
    String url, {
    required bool redirect,
    required bool user,
  }) async {
    log.add('navigate $url redirect=$redirect user=$user');
    return allow(url);
  }

  @override
  Future<bool> landed(String url) async {
    log.add('landed $url');
    return allow(url);
  }

  @override
  void pageStarted(String url) => log.add('started $url');

  @override
  void pageFinished(String url, String title) {
    log.add('finished $url "$title"');
    finished.add(url);
  }

  @override
  void urlChanged(String url, String title) => log.add('url $url "$title"');

  @override
  void backgroundStarted({required int battery, required bool notificationsEnabled}) {}

  @override
  void backgroundStopped({required String reason, required int battery}) {}

  @override
  void reminderOpened({required String source, required String link}) {}

  @override
  void userTouched() => log.add('touched');

  @override
  void dialog(String kind, String message) {
    log.add('dialog $kind $message');
    dialogs.add('$kind:$message');
  }

  @override
  void gone(String reason) => log.add('gone $reason');

  @override
  void windowHidden() => log.add('windowHidden');

  @override
  void windowShown() => log.add('windowShown');

  @override
  void pageWindowClosed() => log.add('pageWindowClosed');
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final windows = Platform.isWindows;

  late HttpServer server;
  late String base;
  late String other;
  final channel = MethodAppBrowserChannel();
  final events = _Events();
  final requests = <String>[];

  setUpAll(() async {
    // Both families: `localhost` (the other site) may resolve to ::1.
    server = await HttpServer.bind(InternetAddress.anyIPv6, 0, v6Only: false);
    // Dart sends X-Frame-Options: SAMEORIGIN by default, which keeps the other site's page out
    // of its frame.
    server.defaultResponseHeaders.clear();
    base = 'http://127.0.0.1:${server.port}';
    other = 'http://localhost:${server.port}';
    server.listen((req) {
      requests.add('${req.headers.host}${req.uri.path}');
      final body = switch (req.uri.path) {
        '/form' => _form(other),
        '/frame' => _frame,
        '/cross' => _cross,
        '/second' => _second,
        '/wide' => _wide,
        '/white' => _white,
        '/blocked' => '<p>should never show</p>',
        '/redirect' => null,
        '/file' => 'file',
        _ => '<p>404</p>',
      };
      if (body == 'file') {
        req.response
          ..headers.contentType = ContentType('application', 'zip')
          ..headers.set(
            'content-disposition',
            'attachment; filename="casama-test.zip"',
          )
          ..add(List<int>.filled(2048, 7))
          ..close();
        return;
      }
      if (body == null) {
        req.response
          ..statusCode = 302
          ..headers.set('location', '/blocked')
          ..close();
        return;
      }
      req.response
        ..headers.contentType = ContentType.html
        ..write(body)
        ..close();
    });
    channel.setHandler(events);
  });

  tearDownAll(() async {
    await server.close(force: true);
  });

  Future<void> loadAndWait(String path) async {
    final done = events.finished.stream.firstWhere(
      (u) => u.startsWith('$base$path'),
    );
    events.log.add('load $path');
    channel.setHandler(events);
    await channel.load('$base$path');
    try {
      await done.timeout(const Duration(seconds: 20));
    } on TimeoutException {
      final page = await channel.url();
      fail(
        'no pageFinished for $path; now at ${page.url} loading=${page.loading}\n'
        '${events.log.skip(events.log.length > 30 ? events.log.length - 30 : 0).join('\n')}',
      );
    }
  }

  /// A snapshot once the page (and its out-of-process frame) have had time to settle.
  Future<String> snapshot(String id, {bool wantCross = true}) async {
    var text = '';
    for (var i = 0; i < 20; i++) {
      final snap = await channel.command({
        'id': id,
        'cmd': 'snapshot',
        'args': {},
      });
      expect(snap['ok'], isTrue, reason: '$snap');
      text = snap['text'] as String;
      if (!wantCross || text.contains('Postcode')) break;
      await Future<void>.delayed(const Duration(milliseconds: 250));
    }
    return text;
  }

  String ref(String text, String label, {String role = ''}) =>
      RegExp('$role"$label" \\[ref=([a-z0-9]+)\\]').firstMatch(text)!.group(1)!;

  testWidgets('the WebView2 runtime is there and new enough', (tester) async {
    final s = await channel.supported();
    expect(s.supported, isTrue, reason: 'reason: ${s.reason}');
    expect(s.liveOverlay, isTrue);
    expect(s.realTaps, isFalse);
  }, skip: !windows);

  testWidgets(
    'loads a page and the page script reads it, frames from other sites too',
    (tester) async {
      events.log.clear();
      await loadAndWait('/form');
      expect(
        events.log.where(
          (l) =>
              l.startsWith('navigate') &&
              (l.contains('/frame') || l.contains('/cross')),
        ),
        isEmpty,
        reason: 'iframes load without asking Dart: ${events.log}',
      );
      final page = await channel.url();
      expect(page.url, '$base/form');
      final text = await snapshot('c1');
      final shotPath = Platform.environment['CASAMA_TEST_SHOT'];
      if (shotPath != null) {
        File(shotPath)
            .writeAsBytesSync(base64Decode((await channel.screenshot())!));
      }
      expect(text, contains('textbox "Your name"'));
      expect(text, contains('button "Say hello"'));
      expect(
        text,
        isNot(contains('hunter2')),
        reason: 'password values never show',
      );
      expect(
        text,
        contains('Inside frame'),
        reason: 'same-site frames are read:\n$text',
      );
      expect(
        text,
        contains('Postcode'),
        reason: 'out-of-process frames are read:\n$text\nrequests: $requests',
      );
    },
    skip: !windows,
  );

  testWidgets("the page's own scripts can't see the page script", (
    tester,
  ) async {
    await loadAndWait('/form');
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final title = (await channel.url()).title;
    expect(
      title,
      'Form page|nothing|undefined',
      reason: 'what the page saw: $title',
    );
  }, skip: !windows);

  testWidgets(
    "fills and clicks through the page script, in another site's frame too",
    (tester) async {
      await loadAndWait('/form');
      final text = await snapshot('c2');
      final fill = await channel.command({
        'id': 'c3',
        'cmd': 'fill',
        'args': {'ref': ref(text, 'Your name'), 'text': 'Ada'},
      });
      expect(fill['ok'], isTrue, reason: '$fill');
      final click = await channel.command({
        'id': 'c4',
        'cmd': 'click',
        'args': {'ref': ref(text, 'Say hello')},
      });
      expect(click['ok'], isTrue, reason: '$click');
      final read = await channel.command({
        'id': 'c5',
        'cmd': 'read',
        'args': {},
      });
      expect(read['text'], contains('Hello, Ada'));
      final zip = await channel.command({
        'id': 'c5b',
        'cmd': 'fill',
        'args': {'ref': ref(text, 'Postcode'), 'text': '1630'},
      });
      expect(zip['ok'], isTrue, reason: '$zip');
    },
    skip: !windows,
  );

  testWidgets('Chinese, emoji and accents survive the trip, in both frames', (
    tester,
  ) async {
    // Characters outside the Basic Multilingual Plane (😀) are surrogate pairs in UTF-16 and four
    // bytes in UTF-8: both conversions in the native code, and its JSON, must keep them whole.
    const words = '李小龙 😀👍🏽 Zoë “quoted” \\ /  end';
    await loadAndWait('/form');
    final text = await snapshot('u1');
    final fill = await channel.command({
      'id': 'u2',
      'cmd': 'fill',
      'args': {'ref': ref(text, 'Your name'), 'text': '李'},
    });
    expect(fill['ok'], isTrue, reason: '$fill');
    final typed = await channel.command({
      'id': 'u3',
      'cmd': 'type',
      'args': {'text': words.substring(1)},
    });
    expect(typed['ok'], isTrue, reason: '$typed');
    final click = await channel.command({
      'id': 'u4',
      'cmd': 'click',
      'args': {'ref': ref(text, 'Say hello')},
    });
    expect(click['ok'], isTrue, reason: '$click');
    final read = await channel.command({'id': 'u5', 'cmd': 'read', 'args': {}});
    // The reader folds runs of white space (the no-break space too) into one space.
    expect(
      read['text'],
      contains('Hello, ${words.replaceAll(RegExp(r'\s+'), ' ')}'),
    );
    final zip = await channel.command({
      'id': 'u6',
      'cmd': 'fill',
      'args': {'ref': ref(text, 'Postcode'), 'text': '邮编 😀'},
    });
    expect(zip['ok'], isTrue, reason: '$zip');
    final again = await snapshot('u7');
    expect(again, contains('邮编 😀'));
  }, skip: !windows);

  testWidgets('a bad command answers with an error, not a hang', (
    tester,
  ) async {
    await loadAndWait('/form');
    final bad = await channel.command({
      'id': 'c6',
      'cmd': 'click',
      'args': {'ref': 'e999'},
    });
    expect(bad['ok'], isFalse);
    expect(bad['code'], 'stale_ref');
  }, skip: !windows);

  testWidgets('screenshots come back as JPEG', (tester) async {
    await loadAndWait('/form');
    final b64 = await channel.screenshot();
    expect(b64, isNotNull);
    final bytes = base64Decode(b64!);
    expect(bytes.length, greaterThan(1000));
    expect(bytes.sublist(0, 2), [0xFF, 0xD8]);
  }, skip: !windows);

  testWidgets('page dialogs go to Dart and wait for an answer', (tester) async {
    await loadAndWait('/form');
    final text = await snapshot('c7', wantCross: false);
    final dialog = events.dialogs.stream.first;
    final click = channel.command({
      'id': 'c8',
      'cmd': 'click',
      'args': {'ref': ref(text, 'Alert me')},
    });
    expect(await dialog.timeout(const Duration(seconds: 10)), 'alert:Careful!');
    await channel.answerDialog(accept: true);
    expect((await click.timeout(const Duration(seconds: 10)))['ok'], isTrue);
  }, skip: !windows);

  testWidgets('links ask Dart first, and back works', (tester) async {
    await loadAndWait('/form');
    events.log.clear();
    final text = await snapshot('c9', wantCross: false);
    final arrived = events.finished.stream.firstWhere(
      (u) => u.endsWith('/second'),
    );
    await channel.command({
      'id': 'c10',
      'cmd': 'click',
      'args': {'ref': ref(text, 'Next page', role: 'link ')},
    });
    await arrived.timeout(const Duration(seconds: 10));
    expect(events.log, contains(startsWith('navigate $base/second')));
    expect(
      events.log.where((l) => l.startsWith('navigate') && l.contains('/frame')),
      isEmpty,
      reason: 'only main-frame navigations ask Dart: ${events.log}',
    );
    final backHome = events.finished.stream.firstWhere(
      (u) => u.endsWith('/form'),
    );
    events.log.add('back canGoBack=${(await channel.url()).canGoBack}');
    await channel.back();
    try {
      await backHome.timeout(const Duration(seconds: 10));
    } on TimeoutException {
      final page = await channel.url();
      fail(
        'no pageFinished after back; at ${page.url}\n${events.log.join('\n')}',
      );
    }
  }, skip: !windows);

  testWidgets('pages can never save files on this computer', (tester) async {
    final dl = '${Platform.environment['USERPROFILE']}\\Downloads';
    List<String> files() => Directory(dl).existsSync()
        ? Directory(dl)
              .listSync()
              .map((e) => e.path)
              .where(
                (p) => p.contains('casama-test') || p.contains('saved.zip'),
              )
              .toList()
        : const [];
    expect(files(), isEmpty);
    await loadAndWait('/form');
    final text = await snapshot('c30', wantCross: false);
    for (final label in ['Get file', 'Save file']) {
      await channel.command({
        'id': 'c31',
        'cmd': 'click',
        'args': {'ref': ref(text, label, role: 'link ')},
      });
      await Future<void>.delayed(const Duration(seconds: 2));
    }
    expect((await channel.url()).url, '$base/form');
    expect(files(), isEmpty, reason: 'nothing saved in $dl');
  }, skip: !windows);

  testWidgets(
    'a navigation Dart refuses never loads, including after a redirect',
    (tester) async {
      await loadAndWait('/form');
      events.allow = (u) => !u.contains('/blocked') && !u.contains('/second');
      try {
        await channel.load('$base/redirect');
        await Future<void>.delayed(const Duration(seconds: 3));
        var page = await channel.url();
        // Refused means the person stays where they were: no error page in its place.
        expect(page.url, '$base/form', reason: events.log.join('\n'));
        expect(events.log, contains(startsWith('navigate $base/blocked')));
        // A link the bot clicks, refused: still on the form, and the page still answers.
        final text = await snapshot('r1', wantCross: false);
        final click = await channel.command({
          'id': 'r2',
          'cmd': 'click',
          'args': {'ref': ref(text, 'Next page')},
        });
        expect(click['ok'], isTrue, reason: '$click');
        await Future<void>.delayed(const Duration(seconds: 2));
        page = await channel.url();
        expect(page.url, '$base/form', reason: events.log.join('\n'));
        expect(events.log, contains(startsWith('navigate $base/second')));
        final read = await channel.command({
          'id': 'r3',
          'cmd': 'read',
          'args': {},
        });
        expect(read['text'], contains('Order'));
      } finally {
        events.allow = (_) => true;
      }
    },
    skip: !windows,
  );

  testWidgets(
    'the web area sits over the window where Flutter puts it, and keeps rendering parked',
    (tester) async {
      await loadAndWait('/form');
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 40, top: 60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 400,
                    height: 300,
                    child: const AppBrowserWebArea(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      final shown = await channel.url();
      expect(
        shown.size.width,
        400,
        reason: "the page is laid out at the area's size",
      );
      expect(shown.size.height, 300);
      expect(await channel.screenshot(), isNotNull);
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 300));
      expect(
        await channel.screenshot(),
        isNotNull,
        reason: 'parked offscreen, still rendering',
      );
    },
    skip: !windows,
  );

  testWidgets("a page sized to the viewport doesn't scroll sideways", (
    tester,
  ) async {
    await loadAndWait('/wide');
    await channel.setOverlayBounds(
      visible: true,
      x: 20,
      y: 20,
      width: 400,
      height: 300,
    );
    var parts = <int>[];
    for (var i = 0; i < 20; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 150));
      parts = (await channel.url()).title
          .split(' ')
          .map(int.tryParse)
          .whereType<int>()
          .toList();
      if (parts.length == 2 && parts[1] == 400) break;
    }
    await channel.setOverlayBounds(visible: false);
    expect(parts.length, 2, reason: 'title: ${(await channel.url()).title}');
    // Overlay scrollbars: the page keeps all 400 points and nothing overflows.
    expect(
      parts[1],
      400,
      reason: 'clientWidth (a classic scrollbar takes ~17)',
    );
    expect(
      parts[0],
      lessThanOrEqualTo(parts[1]),
      reason: 'scrollWidth > clientWidth',
    );
  }, skip: !windows);

  // Counts the cursor's colour inside this app's own window (nothing else on screen is read), so
  // it runs only when asked: CASAMA_TEST_PIXELS_SCRIPT=<PowerShell script taking r g b>.
  final pixelsScript = Platform.environment['CASAMA_TEST_PIXELS_SCRIPT'];
  testWidgets("the bot's cursor is drawn over the live page, and goes away", (
    tester,
  ) async {
    Future<int> magenta() async {
      final r = await Process.run('powershell', [
        '-NoProfile',
        '-ExecutionPolicy',
        'Bypass',
        '-File',
        pixelsScript!,
        '255',
        '0',
        '255',
      ]);
      expect(r.exitCode, 0, reason: '${r.stdout}${r.stderr}');
      return int.parse((r.stdout as String).trim());
    }

    await loadAndWait('/white');
    await channel.setOverlayBounds(
      visible: true,
      x: 20,
      y: 20,
      width: 400,
      height: 300,
    );
    await Future<void>.delayed(const Duration(milliseconds: 800));
    final before = await magenta();
    await channel.setCursor(
      visible: true,
      x: 200,
      y: 150,
      step: 1,
      label: 'Test bot',
      color: 0xFFFF00FF,
    );
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    final shown = await magenta();
    await channel.setCursor(visible: false);
    await Future<void>.delayed(const Duration(milliseconds: 800));
    final hidden = await magenta();
    await channel.setOverlayBounds(visible: false);
    expect(before, lessThan(5));
    expect(shown, greaterThan(40), reason: 'magenta pixels with the cursor up');
    expect(hidden, lessThan(5), reason: 'magenta pixels after hiding it');
  }, skip: !windows || pixelsScript == null);

  // Changes this screen's scaling for a few seconds, so it runs only when asked:
  // CASAMA_TEST_DPI_SCRIPT=<path to a PowerShell script taking `get` | `set <percent>`>.
  final dpiScript = Platform.environment['CASAMA_TEST_DPI_SCRIPT'];
  testWidgets('the page keeps its logical size when the screen scale changes', (
    tester,
  ) async {
    Future<String> dpi(List<String> args) async {
      final r = await Process.run('powershell', [
        '-NoProfile',
        '-ExecutionPolicy',
        'Bypass',
        '-File',
        dpiScript!,
        ...args,
      ]);
      expect(r.exitCode, 0, reason: '${r.stdout}${r.stderr}');
      return (r.stdout as String).trim();
    }

    final before = int.parse((await dpi(['get'])).split(' ').first);
    final other = before == 100 ? 125 : 100;
    await loadAndWait('/form');
    await channel.setOverlayBounds(
      visible: true,
      x: 20,
      y: 20,
      width: 400,
      height: 300,
    );
    expect((await channel.url()).size, const Size(400, 300));
    try {
      await dpi(['set', '$other']);
      Size size = Size.zero;
      for (var i = 0; i < 30; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        size = (await channel.url()).size;
        if (size == const Size(400, 300) && i > 5) break;
      }
      expect(size, const Size(400, 300), reason: 'at $other%');
    } finally {
      await dpi(['set', '$before']);
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    expect((await channel.url()).size, const Size(400, 300));
    await channel.setOverlayBounds(visible: false);
  }, skip: !windows || dpiScript == null);

  testWidgets('cookies for one site clear, and signing out wipes the profile', (
    tester,
  ) async {
    await loadAndWait('/second');
    await channel.clearData(host: '127.0.0.1');
    final page = await channel.command({
      'id': 'c40',
      'cmd': 'read',
      'args': {},
    });
    expect(page['ok'], isTrue);
    await channel.dispose(wipeData: true);
    final dir = Directory(
      '${Platform.environment['LOCALAPPDATA']}\\Casama\\app-browser',
    );
    expect(
      dir.existsSync(),
      isFalse,
      reason: 'the profile folder is gone after sign-out',
    );
    // The next page starts a fresh browser.
    await loadAndWait('/form');
  }, skip: !windows);
}
