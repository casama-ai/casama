// The Linux in-app browser end to end (docs/LINUX-BROWSER-PLAN.md): the real
// `libcasama_app_browser.so` and WebKitGTK, driven through the real method channel, against
// pages served from this test. Needs the browser compiled in and a display:
//
//   CASAMA_APP_BROWSER=1 flutter test integration_test/app_browser_linux_test.dart -d linux
//
// Skips itself on other platforms and in builds without the native library.
//
// Chinese input on Wayland (IBus through GNOME Shell, IBus's GTK module, fcitx5) runs inside a
// private headless GNOME Shell that `integration_test/linux/ime_session.sh` starts:
//
//   CASAMA_APP_BROWSER=1 CASAMA_TEST_IME=1 integration_test/linux/ime_session.sh fcitx5 -- \
//     flutter test integration_test/app_browser_linux_test.dart -d linux \
//       --plain-name 'on Wayland an input method'
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:casama/features/app_browser/app_browser_channel.dart';
import 'package:casama/features/app_browser/app_browser_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';

const _form = '''
<!doctype html><html><head><title>Form page</title></head><body>
<h1>Order</h1>
<label for="name">Your name</label><input id="name" type="text">
<label for="pw">Password</label><input id="pw" type="password" value="hunter2">
<button id="go" onclick="document.getElementById('out').textContent='Hello, '+document.getElementById('name').value">Say hello</button>
<p id="out"></p>
<a href="/second">Next page</a>
<button id="al" onclick="alert('Careful!')">Alert me</button>
<iframe src="/frame" width="300" height="80"></iframe>
<p><a href="/file">Get file</a> <a href="/file" download="saved.zip">Save file</a></p>
</body></html>''';

const _frame = '''
<!doctype html><html><body><button>Inside frame</button></body></html>''';

const _second = '''
<!doctype html><html><head><title>Second page</title></head><body><p>Arrived</p>
<script>document.cookie = "visited=yes; max-age=3600";</script></body></html>''';

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
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final linux = Platform.isLinux;
  // xdotool and `import` drive X11 only; on Wayland those tests skip.
  final x11 = linux && Platform.environment['GDK_BACKEND'] == 'x11';

  late HttpServer server;
  late String base;
  final channel = MethodAppBrowserChannel();
  final events = _Events();

  setUpAll(() async {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    base = 'http://127.0.0.1:${server.port}';
    server.listen((req) {
      final body = switch (req.uri.path) {
        '/form' => _form,
        '/frame' => _frame,
        '/second' => _second,
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
    // A widget test above may have created the app's controller, which takes the handler.
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

  testWidgets('the native library is there and WebKitGTK is new enough', (
    tester,
  ) async {
    final s = await channel.supported();
    expect(s.supported, isTrue, reason: 'reason: ${s.reason}');
  }, skip: !linux);

  testWidgets('loads a page and the page script reads it', (tester) async {
    events.log.clear();
    await loadAndWait('/form');
    expect(
      events.log.where((l) => l.startsWith('navigate') && l.contains('/frame')),
      isEmpty,
      reason: 'iframes load without asking Dart: ${events.log}',
    );
    final page = await channel.url();
    expect(page.url, '$base/form');
    expect(page.title, 'Form page');

    final snap = await channel.command({
      'id': 'c1',
      'cmd': 'snapshot',
      'args': {},
    });
    expect(snap['ok'], isTrue, reason: '$snap');
    final text = snap['text'] as String;
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
      reason: 'child frames are read too:\n$text',
    );
  }, skip: !linux);

  testWidgets('fills and clicks through the page script', (tester) async {
    await loadAndWait('/form');
    final snap = await channel.command({
      'id': 'c2',
      'cmd': 'snapshot',
      'args': {},
    });
    final text = snap['text'] as String;
    String ref(String label) =>
        RegExp('"$label" \\[ref=(e\\d+)\\]').firstMatch(text)!.group(1)!;

    final fill = await channel.command({
      'id': 'c3',
      'cmd': 'fill',
      'args': {'ref': ref('Your name'), 'text': 'Ada'},
    });
    expect(fill['ok'], isTrue, reason: '$fill');
    final click = await channel.command({
      'id': 'c4',
      'cmd': 'click',
      'args': {'ref': ref('Say hello')},
    });
    expect(click['ok'], isTrue, reason: '$click');
    final read = await channel.command({'id': 'c5', 'cmd': 'read', 'args': {}});
    expect(read['text'], contains('Hello, Ada'));
  }, skip: !linux);

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
  }, skip: !linux);

  testWidgets('screenshots come back as JPEG', (tester) async {
    await loadAndWait('/form');
    final b64 = await channel.screenshot();
    expect(b64, isNotNull);
    final bytes = base64Decode(b64!);
    expect(bytes.length, greaterThan(1000));
    expect(bytes.sublist(0, 2), [0xFF, 0xD8]);
  }, skip: !linux);

  testWidgets('page dialogs go to Dart and wait for an answer', (tester) async {
    await loadAndWait('/form');
    final snap = await channel.command({
      'id': 'c7',
      'cmd': 'snapshot',
      'args': {},
    });
    final alertRef = RegExp(r'"Alert me" \[ref=(e\d+)\]')
        .firstMatch(snap['text'] as String)!
        .group(1)!;
    final dialog = events.dialogs.stream.first;
    final click = channel.command({
      'id': 'c8',
      'cmd': 'click',
      'args': {'ref': alertRef},
    });
    expect(await dialog.timeout(const Duration(seconds: 10)), 'alert:Careful!');
    await channel.answerDialog(accept: true);
    expect((await click.timeout(const Duration(seconds: 10)))['ok'], isTrue);
  }, skip: !linux);

  testWidgets('links ask Dart first, and back works', (tester) async {
    await loadAndWait('/form');
    events.log.clear();
    final snap = await channel.command({
      'id': 'c9',
      'cmd': 'snapshot',
      'args': {},
    });
    final linkRef = RegExp(r'link "Next page" \[ref=(e\d+)\]')
        .firstMatch(snap['text'] as String)!
        .group(1)!;
    final arrived = events.finished.stream.firstWhere(
      (u) => u.endsWith('/second'),
    );
    await channel.command({
      'id': 'c10',
      'cmd': 'click',
      'args': {'ref': linkRef},
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
    await channel.back();
    await backHome.timeout(const Duration(seconds: 10));
  }, skip: !linux);

  testWidgets('pages can never save files on this computer', (tester) async {
    final dl = (await Process.run('xdg-user-dir', [
      'DOWNLOAD',
    ])).stdout.toString().trim();
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
    final snap = await channel.command({
      'id': 'c30',
      'cmd': 'snapshot',
      'args': {},
    });
    final text = snap['text'] as String;
    for (final label in ['Get file', 'Save file']) {
      final ref = RegExp('link "$label" \\[ref=(e\\d+)\\]')
          .firstMatch(text)!
          .group(1)!;
      await channel.command({
        'id': 'c31',
        'cmd': 'click',
        'args': {'ref': ref},
      });
      await Future<void>.delayed(const Duration(seconds: 2));
    }
    expect((await channel.url()).url, '$base/form');
    expect(files(), isEmpty, reason: 'nothing saved in $dl');
  }, skip: !linux);

  testWidgets(
    'a navigation Dart refuses never loads, including after a redirect',
    (tester) async {
      await loadAndWait('/form');
      events.allow = (u) => !u.contains('/blocked');
      try {
        await channel.load('$base/redirect');
        await Future<void>.delayed(const Duration(seconds: 3));
        final page = await channel.url();
        expect(
          page.url,
          isNot(contains('/blocked')),
          reason: events.log.join('\n'),
        );
      } finally {
        events.allow = (_) => true;
      }
    },
    skip: !linux,
  );

  testWidgets('the web area sits in the overlay where Flutter puts it', (
    tester,
  ) async {
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
    final shot = Platform.environment['CASAMA_TEST_SHOT'];
    if (shot != null && Platform.environment['DISPLAY'] != null) {
      await Process.run('timeout', ['5', 'import', '-window', 'root', shot]);
    }
    // A screenshot only works while the view is alive; parking keeps it alive.
    expect(await channel.screenshot(), isNotNull);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 300));
    expect(
      await channel.screenshot(),
      isNotNull,
      reason: 'parked offscreen, still rendering',
    );
  }, skip: !linux);

  Future<String> appWindow() async {
    // The toplevel (named after the app), not its 1x1 helper children.
    final r = await Process.run('timeout', [
      '5',
      'xdotool',
      'search',
      '--pid',
      '$pid',
      '--onlyvisible',
      '--name',
      '^Casama\$',
    ]);
    return (r.stdout as String).trim().split('\n').first;
  }

  Future<void> pumpArea(WidgetTester tester, {Widget? over}) async {
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
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    // The web area reads the app's controller, which takes native's events: take them back.
    channel.setHandler(events);
  }

  /// One screen pixel as #RRGGBB (X11 only).
  Future<String> pixel(int x, int y) async {
    final r = await Process.run('timeout', [
      '5',
      'import',
      '-window',
      'root',
      '-depth',
      '8',
      '-crop',
      '1x1+$x+$y',
      'txt:-',
    ]);
    return RegExp(r'#[0-9A-F]{6}').firstMatch(r.stdout as String)?.group(0) ??
        '?';
  }

  Future<void> shot(String name) async {
    final dir = Platform.environment['CASAMA_TEST_SHOTS'];
    if (dir == null) return;
    await Process.run('timeout', [
      '5',
      'import',
      '-window',
      'root',
      '$dir/$name.png',
    ]);
  }

  testWidgets('real clicks and typing reach the page and count as a touch', (
    tester,
  ) async {
    await loadAndWait('/form');
    await pumpArea(tester);
    final win = await appWindow();
    events.log.clear();
    // "Your name" box: x 130..284, y 146..170 on screen (the window sits at 0,0).
    final focus = await Process.run('timeout', [
      '5',
      'xdotool',
      'windowfocus',
      win,
    ]);
    events.log.add('focus exit ${focus.exitCode} win=$win');
    await Process.run('timeout', [
      '5',
      'xdotool',
      'mousemove',
      '200',
      '158',
      'click',
      '1',
    ]);
    await tester.pump(const Duration(milliseconds: 300));
    await Process.run('timeout', [
      '5',
      'xdotool',
      'type',
      '--delay',
      '30',
      'Grace',
    ]);
    await tester.pump(const Duration(milliseconds: 800));
    await shot('typed');
    final read = await channel.command({
      'id': 'c20',
      'cmd': 'snapshot',
      'args': {},
    });
    expect(read['text'], contains('"Grace"'), reason: '${read['text']}');
    expect(events.log, contains('touched'));
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 300));
  }, skip: !x11);

  testWidgets(
    'a dialog over the page hides the web area and it comes back after',
    (tester) async {
      await loadAndWait('/form');
      await pumpArea(tester);
      await shot('before-dialog');
      final ctx = tester.element(find.byType(AppBrowserWebArea));
      unawaited(
        showDialog<void>(
          context: ctx,
          builder: (_) => const AlertDialog(content: Text('Over the page')),
        ),
      );
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await shot('dialog');
      if (x11) {
        // The live page is hidden; its dimmed picture shows under the dialog's scrim.
        expect(await pixel(45, 345), isNot('#FFFFFF'));
      }
      Navigator.of(ctx).pop();
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await shot('after-dialog');
      if (x11) {
        expect(
          await pixel(45, 345),
          '#FFFFFF',
          reason: 'the live page is back',
        );
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 300));
    },
    skip: !linux,
  );

  /// Pure red pixels on screen right now (the test cursor is drawn in pure red; the test pages
  /// have none). X11 through `import`, Wayland through the shell's screenshot call.
  /// Pixels of [color] on screen right now. X11 through `import`, Wayland through the shell's
  /// screenshot call. -1 when no screenshot can be taken.
  Future<int> pixelsOf(String name, String color, {String fuzz = '12%'}) async {
    final dir =
        Platform.environment['CASAMA_TEST_SHOTS'] ?? Directory.systemTemp.path;
    final file = '$dir/$name.png';
    if (x11) {
      await Process.run('timeout', ['5', 'import', '-window', 'root', file]);
    } else {
      final helper = Platform.environment['CASAMA_WL_SHOT'];
      if (helper == null) return -1;
      await Process.run('timeout', ['10', 'python3', helper, file]);
    }
    final r = await Process.run('convert', [
      file, '-alpha', 'off', '-fuzz', fuzz, //
      '-fill', 'black', '+opaque', color, '-fill', 'white', '-opaque', color,
      '-colorspace', 'gray', '-format', '%[fx:round(mean*w*h)]', 'info:',
    ]);
    return int.tryParse((r.stdout as String).trim()) ?? -1;
  }

  /// Pure red pixels (the test cursor is drawn in pure red; the test pages have none).
  Future<int> redPixels(String name) => pixelsOf(name, '#FF0000');

  testWidgets(
    'the page is visible; on X11 the bot cursor shows above it, and clicks go through',
    (tester) async {
      final canShoot = x11 || Platform.environment['CASAMA_WL_SHOT'] != null;
      final live = (await channel.supported()).liveOverlay;
      expect(
        live,
        x11,
        reason: 'live overlay on X11 only, the picture on Wayland',
      );
      await loadAndWait('/form');
      await pumpArea(tester);
      // The page is drawn on screen: its white body fills most of the 400x300 area (the live
      // page on X11, its picture on Wayland, where Flutter draws above the GTK overlay).
      if (canShoot) {
        await tester.pump(const Duration(seconds: 2));
        expect(
          await pixelsOf('page-shown', '#FFFFFF', fuzz: '0.5%'),
          greaterThan(60000),
          reason: 'the page is visible',
        );
      }
      if (!live) {
        // The picture is the whole page, and `url` says the page's size so the Flutter cursor
        // drawn over the picture can be fitted to it.
        final dir =
            Platform.environment['CASAMA_TEST_SHOTS'] ??
            Directory.systemTemp.path;
        final jpeg = File('$dir/picture.jpg')
          ..writeAsBytesSync(base64Decode((await channel.screenshot())!));
        final size = await Process.run('identify', [
          '-format',
          '%w %h',
          jpeg.path,
        ]);
        final page = (await channel.url()).size;
        final parts = (size.stdout as String)
            .split(' ')
            .map(int.parse)
            .toList();
        expect(page.isEmpty, isFalse);
        expect(parts[0] / parts[1], closeTo(page.width / page.height, 0.02));
        // No native cursor there: the screen's Flutter cursor is drawn over the picture.
        await tester.pumpWidget(const SizedBox());
        await tester.pump(const Duration(milliseconds: 300));
        return;
      }
      expect(
        await redPixels('cursor-before'),
        0,
        reason: 'nothing red before the cursor',
      );

      if (x11) {
        // Control: the same click without the cursor reaches the button.

        await Process.run('timeout', [
          '5',
          'xdotool',
          'mousemove',
          '220',
          '184',
          'click',
          '1',
        ]);

        await tester.pump(const Duration(milliseconds: 500));

        final read = await channel.command({
          'id': 'c39',
          'cmd': 'read',
          'args': {},
        });

        expect(
          read['text'],
          contains('Hello,'),
          reason: 'the control click reached the button',
        );

        await loadAndWait('/form');
      }

      // "Say hello" is at 166..235 x 111..137 in the web area (at 40,60 on screen).
      final shown = await const MethodChannel(MethodAppBrowserChannel.name)
          .invokeMethod<bool>('cursor', {
            'visible': true,
            'x': 180.0,
            'y': 124.0,
            'act': 'click',
            'step': 1,
            'label': 'Ada', //
            'color': 0xFFFF0000, 'size': 22.0, 'reduceMotion': true,
          });
      expect(shown, isTrue);
      for (var i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      if (canShoot) {
        final red = await redPixels('cursor-on');
        expect(
          red,
          greaterThan(60),
          reason: 'the arrow and its label are drawn above the page',
        );
      }

      if (x11) {
        // A real click on the arrow's tip reaches the button under it.
        await Process.run('timeout', [
          '5',
          'xdotool',
          'mousemove',
          '220',
          '184',
          'click',
          '1',
        ]);
        await tester.pump(const Duration(milliseconds: 500));
        final read = await channel.command({
          'id': 'c40',
          'cmd': 'read',
          'args': {},
        });
        expect(
          read['text'],
          contains('Hello,'),
          reason: 'the click went through the cursor',
        );
      }

      await channel.setCursor(visible: false, reduceMotion: true);
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      if (canShoot) {
        expect(await redPixels('cursor-off'), 0, reason: 'it leaves');
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 300));
    },
    skip: !linux,
  );

  testWidgets(
    'without the live overlay, the page opens in its own window for typing',
    (tester) async {
      // X11 shows the page live instead.
      if ((await channel.supported()).liveOverlay) return;
      if (Platform.environment['CASAMA_WL_SHOT'] == null) return;
      await loadAndWait('/form');
      await pumpArea(tester);
      await tester.pump(const Duration(seconds: 1));
      final before = await pixelsOf(
        'page-window-before',
        '#FFFFFF',
        fuzz: '0.5%',
      );
      await channel.pageWindow(open: true, title: 'Form page');
      await tester.pump(const Duration(seconds: 2));
      final open = await pixelsOf('page-window-open', '#FFFFFF', fuzz: '0.5%');
      expect(
        open,
        greaterThan(before + 150000),
        reason: 'a 1024x768 window of the page',
      );
      await channel.pageWindow(open: false);
      await tester.pump(const Duration(seconds: 1));
      expect(
        await pixelsOf('page-window-closed', '#FFFFFF', fuzz: '0.5%'),
        lessThan(open - 150000),
      );
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 300));
    },
    skip: !linux,
  );

  testWidgets(
    'an input method (ibus pinyin) types Chinese into the live page',
    (tester) async {
      await loadAndWait('/form');
      await pumpArea(tester);
      final win = await appWindow();
      await Process.run('timeout', ['5', 'xdotool', 'windowfocus', win]);
      // "Your name": x 130..284, y 146..170 on screen.
      await Process.run('timeout', [
        '5',
        'xdotool',
        'mousemove',
        '200',
        '158',
        'click',
        '1',
      ]);
      await tester.pump(const Duration(milliseconds: 500));
      // `ibus engine NAME` exits 1 even when it switched: check which engine is on instead.
      await Process.run('ibus', ['engine', 'libpinyin']);
      await tester.pump(const Duration(milliseconds: 800));
      final now = await Process.run('ibus', ['engine']);
      expect(
        (now.stdout as String).trim(),
        'libpinyin',
        reason: '${now.stderr}',
      );
      await tester.pump(const Duration(milliseconds: 500));
      await Process.run('timeout', [
        '10',
        'xdotool',
        'type',
        '--delay',
        '80',
        'nihao ',
      ]);
      await tester.pump(const Duration(seconds: 1));
      await Process.run('ibus', ['engine', 'xkb:us::eng']);
      final snap = await channel.command({
        'id': 'c50',
        'cmd': 'snapshot',
        'args': {},
      });
      final value =
          RegExp(r'"Your name" \[ref=e\d+\][^:]*: "([^"]*)"')
              .firstMatch(snap['text'] as String)
              ?.group(1) ??
          '';
      expect(
        value,
        matches(RegExp(r'[一-鿿]')),
        reason: 'Chinese characters went in: "$value"',
      );
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 300));
    },
    skip: !x11 || Platform.environment['CASAMA_TEST_IME'] != '1',
  );

  testWidgets(
    'on Wayland an input method types Chinese into the page in its own window',
    (tester) async {
      final input = Platform.environment['CASAMA_WL_INPUT'];
      await loadAndWait('/form');
      await pumpArea(tester);
      await channel.pageWindow(open: true, title: 'Form page');
      await tester.pump(const Duration(seconds: 2));
      // Focus the name field the way a click would, then type through GNOME Shell's ibus.
      final snap = await channel.command({
        'id': 'c60',
        'cmd': 'snapshot',
        'args': {},
      });
      final ref = RegExp(r'"Your name" \[ref=(e\d+)\]')
          .firstMatch(snap['text'] as String)!
          .group(1)!;
      await channel.command({
        'id': 'c61',
        'cmd': 'click',
        'args': {'ref': ref},
      });
      await tester.pump(const Duration(milliseconds: 500));
      await Process.run('python3', [input!, 'type', 'nihao ']);
      await tester.pump(const Duration(seconds: 1));
      final after = await channel.command({
        'id': 'c62',
        'cmd': 'snapshot',
        'args': {},
      });
      final value =
          RegExp(r'"Your name" \[ref=e\d+\][^:]*: "([^"]*)"')
              .firstMatch(after['text'] as String)
              ?.group(1) ??
          '';
      await channel.pageWindow(open: false);
      expect(
        value,
        matches(RegExp(r'[一-鿿]')),
        reason: 'Chinese characters went in: "$value"',
      );
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 300));
    },
    skip:
        x11 ||
        Platform.environment['CASAMA_TEST_IME'] != '1' ||
        Platform.environment['CASAMA_WL_INPUT'] == null,
  );

  testWidgets('hiding and showing the window brings the web area back', (
    tester,
  ) async {
    await loadAndWait('/form');
    await pumpArea(tester);
    final win = await appWindow();
    // No pumping while unmapped: Flutter draws no frames then, so a pump would wait forever.
    final cycle = await Process.run('sh', [
      '-c',
      'timeout 5 xdotool windowunmap --sync $win; sleep 1; timeout 5 xdotool windowmap --sync $win',
    ]);
    expect(cycle.exitCode, 0, reason: '${cycle.stderr}');
    expect(events.log, contains('windowHidden'), reason: 'win=$win');
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    await shot('after-remap');
    // The page is white; Flutter's background behind an empty web area is not.
    final grab = await Process.run('timeout', [
      '5',
      'import',
      '-window',
      'root',
      '-crop',
      '1x1+45+345',
      'txt:-',
    ]);
    expect(
      grab.stdout as String,
      contains('#FFFFFF'),
      reason:
          'the page is drawn again after the window comes back: ${grab.stdout}',
    );
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 300));
  }, skip: !x11);

  testWidgets(
    'clearing one site keeps the others; dispose with wipe deletes the folders',
    (tester) async {
      await loadAndWait('/second');
      await channel.clearData(host: 'example.com');
      final dataHome =
          Platform.environment['XDG_DATA_HOME'] ??
          '${Platform.environment['HOME']}/.local/share';
      final cacheHome =
          Platform.environment['XDG_CACHE_HOME'] ??
          '${Platform.environment['HOME']}/.cache';
      expect(Directory('$dataHome/casama/app-browser').existsSync(), isTrue);
      await channel.dispose(wipeData: true);
      expect(Directory('$dataHome/casama/app-browser').existsSync(), isFalse);
      expect(Directory('$cacheHome/casama/app-browser').existsSync(), isFalse);
      // And it comes back on the next load.
      await loadAndWait('/form');
      expect((await channel.url()).title, 'Form page');
    },
    skip: !linux,
  );

  binding.reportData = {'log': events.log};
}
