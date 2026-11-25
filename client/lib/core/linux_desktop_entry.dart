import 'dart:io';

import 'package:flutter/foundation.dart';

/// The application id (linux/CMakeLists.txt), which is also the Wayland app id.
const linuxAppId = 'ai.casama.app';

/// Whether a store's package runs this app: a snap (snapd sets SNAP to the folder the app runs
/// from) or a flatpak. Such a package brings its own desktop entry and the store updates it. SNAP
/// alone isn't enough: a classic snap hands its variables to what it starts, so a Casama opened
/// from another snap's terminal has SNAP too, pointing at that snap.
bool linuxStorePackage({Map<String, String>? environment, String? executable}) {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.linux) return false;
  final env = environment ?? Platform.environment;
  if ((env['FLATPAK_ID'] ?? '').isNotEmpty) return true;
  final snap = env['SNAP'] ?? '';
  return snap.isNotEmpty && (executable ?? Platform.resolvedExecutable).startsWith('$snap/');
}

/// Linux: the desktop portal (the global shortcut) and casama:// links find the app by a desktop
/// entry named after its application id. A snap, a flatpak or a system package (AUR, .deb) brings
/// its own; the tar.gz bundle, the AppImage and development builds don't, so the app writes one
/// into the user's applications folder, pointing at wherever it runs from. Best effort: without it
/// the shortcut and casama:// links don't work.
Future<void> ensureLinuxDesktopEntry({
  Map<String, String>? environment,
  String? executable,
}) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.linux) return;
  final env = environment ?? Platform.environment;
  if (linuxStorePackage(environment: env, executable: executable)) return;
  final home = env['HOME'];
  if (home == null || home.isEmpty) return;
  try {
    // A package that installed its own entry: a second one would only shadow it.
    final systemDirs = (env['XDG_DATA_DIRS'] ?? '').isNotEmpty ? env['XDG_DATA_DIRS']! : '/usr/local/share:/usr/share';
    for (final dir in systemDirs.split(':')) {
      if (dir.isNotEmpty && File('$dir/applications/$linuxAppId.desktop').existsSync()) return;
    }
    final dataHome = (env['XDG_DATA_HOME'] ?? '').isNotEmpty ? env['XDG_DATA_HOME']! : '$home/.local/share';
    final file = File('$dataHome/applications/$linuxAppId.desktop');
    final running = executable ?? Platform.resolvedExecutable;
    // An AppImage runs from a folder that is mounted for this run only (APPDIR; APPIMAGE is the
    // file itself): the entry starts the file, and the icon is copied to where it outlives the
    // run. Like SNAP, both are handed on to whatever an AppImage starts, so they count only when
    // this app runs from that folder.
    final appImage = env['APPIMAGE'] ?? '';
    final appDir = env['APPDIR'] ?? '';
    String content;
    if (appImage.isNotEmpty && appDir.isNotEmpty && running.startsWith('$appDir/')) {
      final icon = File('$dataHome/icons/hicolor/512x512/apps/$linuxAppId.png');
      final bundled = File('${File(running).parent.path}/data/casama.png');
      if (!icon.existsSync() && bundled.existsSync()) {
        icon.parent.createSync(recursive: true);
        bundled.copySync(icon.path);
      }
      content = linuxDesktopEntry(appImage, icon: linuxAppId);
    } else {
      content = linuxDesktopEntry(running);
    }
    if (file.existsSync() && file.readAsStringSync() == content) return;
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(content);
    // Lets casama:// find the entry; missing on some systems, which is fine.
    await Process.run('update-desktop-database', [file.parent.path]).catchError((_) => ProcessResult(0, 1, '', ''));
  } catch (e) {
    debugPrint('desktop entry unavailable: $e');
  }
}

/// The entry's text for the app at [executable] (bundle/casama, with bundle/data/casama.png), or
/// with [icon] when the picture isn't next to it.
@visibleForTesting
String linuxDesktopEntry(String executable, {String? icon}) {
  final dir = File(executable).parent.path;
  String quoted(String s) => s.contains(RegExp(r'[\s"\\`$]')) ? '"${s.replaceAllMapped(RegExp(r'["\\`$]'), (m) => '\\${m[0]}')}"' : s;
  return '''[Desktop Entry]
Type=Application
Name=Casama
Comment=Persistent AI teammates
Exec=${quoted(executable)} %U
Icon=${icon ?? '$dir/data/casama.png'}
Terminal=false
Categories=Office;Chat;Utility;
MimeType=x-scheme-handler/casama;
StartupWMClass=$linuxAppId
Keywords=AI;assistant;agent;bot;chat;
''';
}
