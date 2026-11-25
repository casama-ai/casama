import 'dart:io';

import 'package:casama/core/linux_desktop_entry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the entry runs the bundle it was written from, with its icon and casama:// links', () {
    final entry = linuxDesktopEntry('/opt/casama/casama');
    expect(entry, contains('Exec=/opt/casama/casama %U'));
    expect(entry, contains('Icon=/opt/casama/data/casama.png'));
    expect(entry, contains('MimeType=x-scheme-handler/casama;'));
    expect(entry, contains('StartupWMClass=ai.casama.app'));
  });

  test('a path with spaces is quoted in Exec', () {
    expect(linuxDesktopEntry('/home/a b/casama/casama'), contains('Exec="/home/a b/casama/casama" %U'));
  });

  group('on Linux', () {
    late Directory home;
    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      home = Directory.systemTemp.createTempSync('casama-home');
    });
    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
      home.deleteSync(recursive: true);
    });
    File entryIn(Directory home) => File('${home.path}/.local/share/applications/ai.casama.app.desktop');

    test('writes the entry named after the application id, and rewrites it when the app moves', () async {
      await ensureLinuxDesktopEntry(environment: {'HOME': home.path}, executable: '/opt/one/casama');
      expect(entryIn(home).readAsStringSync(), contains('Exec=/opt/one/casama %U'));
      await ensureLinuxDesktopEntry(environment: {'HOME': home.path}, executable: '/opt/two/casama');
      expect(entryIn(home).readAsStringSync(), contains('Exec=/opt/two/casama %U'));
    });

    test('a snap or flatpak brings its own entry', () async {
      await ensureLinuxDesktopEntry(environment: {'HOME': home.path, 'SNAP': '/snap/casama/1'}, executable: '/snap/casama/1/casama');
      await ensureLinuxDesktopEntry(environment: {'HOME': home.path, 'FLATPAK_ID': 'ai.casama.app'}, executable: '/x/casama');
      expect(entryIn(home).existsSync(), isFalse);
    });

    test('a system package (AUR, .deb) brings its own entry', () async {
      final system = Directory('${home.path}/usr-share/applications')..createSync(recursive: true);
      File('${system.path}/ai.casama.app.desktop').writeAsStringSync('[Desktop Entry]');
      await ensureLinuxDesktopEntry(environment: {'HOME': home.path, 'XDG_DATA_DIRS': '${home.path}/usr-share'}, executable: '/opt/casama/casama');
      expect(entryIn(home).existsSync(), isFalse);
    });

    test('an AppImage: the entry starts the file, with an icon that outlives the mounted folder', () async {
      final mount = Directory('${home.path}/mount/data')..createSync(recursive: true);
      File('${mount.path}/casama.png').writeAsBytesSync([1, 2, 3]);
      await ensureLinuxDesktopEntry(
        environment: {
          'HOME': home.path,
          'XDG_DATA_DIRS': '${home.path}/none',
          'APPIMAGE': '/home/me/Apps/Casama.AppImage',
          'APPDIR': '${home.path}/mount',
        },
        executable: '${home.path}/mount/casama',
      );
      final entry = entryIn(home).readAsStringSync();
      expect(entry, contains('Exec=/home/me/Apps/Casama.AppImage %U'));
      expect(entry, contains('Icon=ai.casama.app\n'));
      expect(File('${home.path}/.local/share/icons/hicolor/512x512/apps/ai.casama.app.png').readAsBytesSync(), [1, 2, 3]);
    });

    test('opened from another AppImage (an editor\'s terminal), the bundle writes its own entry', () async {
      await ensureLinuxDesktopEntry(
        environment: {'HOME': home.path, 'XDG_DATA_DIRS': '${home.path}/none', 'APPIMAGE': '/home/me/Apps/Editor.AppImage', 'APPDIR': '/tmp/.mount_editor'},
        executable: '/opt/casama/casama',
      );
      expect(entryIn(home).readAsStringSync(), contains('Exec=/opt/casama/casama %U'));
    });

    test('opened from another snap\'s terminal, the bundle still writes its entry', () async {
      // A classic snap (an editor, a terminal) hands SNAP to what it starts.
      await ensureLinuxDesktopEntry(environment: {'HOME': home.path, 'SNAP': '/snap/code/200'}, executable: '/opt/casama/casama');
      expect(entryIn(home).existsSync(), isTrue);
    });
  });
}
