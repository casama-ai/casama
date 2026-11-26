/// Installs, updates and checks a self-hosted Casama server from its public release
/// (docs/SELF-HOSTING-PLAN.md §11.7). Pure Dart: the desktop apps and the CLI use it on macOS,
/// Linux and Windows, with Docker as the only requirement (no bash, no OpenSSL).
library;

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import 'src/installer.dart';
import 'src/manifest.dart';

export 'src/bundle.dart' show downloadBundle, extractBundle;
export 'src/env_file.dart' show EnvFile;
export 'src/errors.dart' show SelfhostException;
export 'src/installer.dart'
    show
        InstallOptions,
        InstallProgress,
        InstallStep,
        SelfhostInstaller,
        composeFileName,
        configureEnv,
        findLanAddress,
        hasInternalSignupHook,
        internalSignupHookUri,
        installedVersion,
        pickLanAddress,
        profilesFor,
        readyUrl,
        selfhostComposeArgs,
        signupHookFor;
export 'src/manifest.dart' show SelfhostManifest, fetchManifest, imageVariables, latestManifestUrl;
export 'src/process.dart' show ProcessRunner, SystemProcessRunner;
export 'src/sizes.dart' show DownloadEstimate, ImageSizes, SizedImage, dockerArch, presentRefs;
export 'src/secrets.dart' show SecretSource, signHs256;
export 'src/status.dart' show IssuedLicense, admitForSelfhost, SelfhostStatus, defaultLicenseServer, putLicense, requestPersonalLicense, status;

/// Downloads and checks the release bundle, writes `.env` (every secret generated here) and
/// `images.env`, pulls the pinned images, starts the stack and waits for `/readyz`. Running it
/// again on the same [dir] keeps `.env`, so data, keys and the instance id stay.
Stream<InstallProgress> install({required SelfhostManifest manifest, required Directory dir, required InstallOptions options, SelfhostInstaller? installer}) =>
    (installer ?? SelfhostInstaller()).install(manifest: manifest, dir: dir, options: options);

/// Moves the install in [dir] to [manifest]'s release: backup, pull, up, health check, and back to
/// the previous `images.env` and files if the new release doesn't become healthy (the stream then
/// ends with a [SelfhostException] `update_rolled_back`).
Stream<InstallProgress> update({required Directory dir, required SelfhostManifest manifest, bool force = false, SelfhostInstaller? installer}) =>
    (installer ?? SelfhostInstaller()).update(dir: dir, manifest: manifest, force: force);

/// Where the apps and CLI install by default: `~/.casama/selfhost` (`%USERPROFILE%\.casama\selfhost`
/// on Windows), or `$CASAMA_SELFHOST_HOME`.
Directory defaultInstallDir() {
  final env = Platform.environment;
  final override = env['CASAMA_SELFHOST_HOME'];
  if (override != null && override.isNotEmpty) return Directory(override);
  final home = Platform.isWindows ? env['USERPROFILE'] ?? env['APPDATA'] ?? '.' : env['HOME'] ?? '.';
  return Directory(p.join(home, '.casama', 'selfhost'));
}

/// The manifest an install in [dir] was made from, or null.
SelfhostManifest? installedManifest(Directory dir) {
  final f = File(p.join(dir.path, 'manifest.json'));
  if (!f.existsSync()) return null;
  try {
    return SelfhostManifest.fromJson(jsonDecode(f.readAsStringSync()) as Map<String, dynamic>);
  } catch (_) {
    return null;
  }
}
