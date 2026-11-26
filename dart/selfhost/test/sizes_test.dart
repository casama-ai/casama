import 'dart:convert';
import 'dart:io';

import 'package:casama_selfhost/casama_selfhost.dart';
import 'package:test/test.dart';

import 'helpers.dart';

const _desktopRef = 'ghcr.io/casama-ai/computer-desktop@sha256:dd';
const _headlessRef = 'ghcr.io/casama-ai/computer-headless@sha256:hh';

/// headless = base + h; desktop = base + h + d (shares headless's layers); caddy = c; grafana
/// (monitoring) = g.
Map<String, dynamic> _download() => {
  'layers': {
    'sha256:base': [1000, 4000],
    'sha256:h': [500, 2000],
    'sha256:d': [100, 300],
    'sha256:c': [20, 60],
    'sha256:g': [200, 700],
  },
  'images': {
    'arm64': [
      {'name': 'computer-headless', 'ref': _headlessRef, 'profile': null, 'layers': ['sha256:base', 'sha256:h']},
      {'name': 'computer-desktop', 'ref': _desktopRef, 'profile': 'desktop', 'layers': ['sha256:base', 'sha256:h', 'sha256:d']},
      {'name': 'caddy', 'ref': 'caddy:2.10.2-alpine', 'profile': null, 'layers': ['sha256:c']},
      {'name': 'grafana', 'ref': 'grafana/grafana:12.1.1', 'profile': 'monitoring', 'layers': ['sha256:g']},
    ],
  },
};

void main() {
  group('ImageSizes', () {
    final sizes = ImageSizes.tryParse(_download())!;

    test('a default install counts only the images every install pulls', () {
      final e = sizes.estimate(arch: 'arm64')!;
      expect(e.downloadBytes, 1520);
      expect(e.diskBytes, 1520 + 6060);
    });

    test('shared layers count once', () {
      final e = sizes.estimate(arch: 'arm64', profiles: {'desktop'})!;
      expect(e.downloadBytes, 1620); // only the desktop's own layer on top
    });

    test('profiles add their images', () {
      expect(sizes.estimate(arch: 'arm64', profiles: {'monitoring'})!.downloadBytes, 1720);
    });

    test('images already on the machine, and the layers they hold, are skipped', () {
      expect(sizes.estimate(arch: 'arm64', present: {_headlessRef, 'caddy:2.10.2-alpine'})!.downloadBytes, 0);
      // The desktop image needs only its own layer when headless is there.
      expect(sizes.estimate(arch: 'arm64', profiles: {'desktop'}, present: {_headlessRef})!.downloadBytes, 120);
    });

    test('no sizes for the CPU type gives null', () {
      expect(sizes.estimate(arch: 'amd64'), isNull);
    });

    test('malformed or incomplete sizes give null instead of failing', () {
      expect(ImageSizes.tryParse(null), isNull);
      expect(ImageSizes.tryParse({'layers': 'x'}), isNull);
      final missing = _download();
      (missing['layers'] as Map).remove('sha256:h');
      expect(ImageSizes.tryParse(missing), isNull);
    });

    test('round-trips through JSON', () {
      final again = ImageSizes.tryParse(jsonDecode(jsonEncode(sizes.toJson())));
      expect(again!.estimate(arch: 'arm64')!.downloadBytes, 1520);
    });
  });

  group('manifest', () {
    test('reads the optional download field and keeps it in toJson', () {
      final m = makeManifest('2026.11.26-abc1234', makeBundle('2026.11.26-abc1234'));
      final json = {...m.toJson(), 'download': _download()};
      final parsed = SelfhostManifest.fromJson(jsonDecode(jsonEncode(json)) as Map<String, dynamic>);
      expect(parsed.sizes, isNotNull);
      expect(parsed.toJson()['download'], isNotNull);
    });

    test('a release without sizes, or with broken ones, still installs', () {
      final m = makeManifest('2026.11.26-abc1234', makeBundle('2026.11.26-abc1234'));
      expect(SelfhostManifest.fromJson(m.toJson()).sizes, isNull);
      expect(SelfhostManifest.fromJson({...m.toJson(), 'download': {'layers': 1}}).sizes, isNull);
    });
  });

  group('estimateDownload', () {
    SelfhostManifest manifest() {
      final m = makeManifest('2026.11.26-abc1234', makeBundle('2026.11.26-abc1234'));
      return SelfhostManifest.fromJson({...m.toJson(), 'download': _download()});
    }

    test('asks Docker for its CPU type and what it already has', () async {
      final runner = FakeRunner(
        answer: (exe, args) {
          if (args.contains('{{.Architecture}}')) return ProcessResult(0, 0, 'aarch64\n', '');
          if (args.take(2).join(' ') == 'image ls') {
            return ProcessResult(0, 0, 'caddy|2.10.2-alpine|sha256:zz\nghcr.io/casama-ai/computer-headless|<none>|sha256:hh\n', '');
          }
          return null;
        },
      );
      final e = await SelfhostInstaller(runner: runner).estimateDownload(manifest(), withDesktop: true);
      expect(e!.downloadBytes, 100);
    });

    test('images pulled by digest that the listing misses still count as present', () async {
      final runner = FakeRunner(
        answer: (exe, args) {
          if (args.contains('{{.Architecture}}')) return ProcessResult(0, 0, 'aarch64\n', '');
          // The containerd image store: the listing shows only tagged images.
          if (args.take(2).join(' ') == 'image ls') return ProcessResult(0, 0, 'caddy|2.10.2-alpine|sha256:zz\n', '');
          if (args.take(2).join(' ') == 'image inspect') {
            return args.last == _headlessRef ? ProcessResult(0, 0, 'sha256:id\n', '') : ProcessResult(0, 1, '', 'No such image');
          }
          return null;
        },
      );
      final e = await SelfhostInstaller(runner: runner).estimateDownload(manifest(), withDesktop: true);
      expect(e!.downloadBytes, 100); // only the desktop's own layer
      expect((await SelfhostInstaller(runner: runner).estimateDownload(manifest()))!.downloadBytes, 0);
      // caddy came from the listing, so it was not inspected again.
      expect(runner.matching(['image', 'inspect', 'caddy:2.10.2-alpine']), isEmpty);
    });

    test('null when Docker reports a CPU type the release lacks, or Docker fails', () async {
      final amd = FakeRunner(answer: (exe, args) => args.contains('{{.Architecture}}') ? ProcessResult(0, 0, 'x86_64\n', '') : null);
      expect(await SelfhostInstaller(runner: amd).estimateDownload(manifest()), isNull);
      final down = FakeRunner(answer: (exe, args) => ProcessResult(0, 1, '', 'Cannot connect'));
      expect(await SelfhostInstaller(runner: down).estimateDownload(manifest()), isNull);
    });

    test('null for a release without sizes, without asking Docker', () async {
      final runner = FakeRunner();
      final m = makeManifest('2026.11.26-abc1234', makeBundle('2026.11.26-abc1234'));
      expect(await SelfhostInstaller(runner: runner).estimateDownload(m), isNull);
      expect(runner.calls, isEmpty);
    });
  });

  test('dockerArch and presentRefs', () {
    expect(dockerArch('x86_64\n'), 'amd64');
    expect(dockerArch('aarch64'), 'arm64');
    expect(dockerArch('s390x'), isNull);
    expect(presentRefs('caddy|2.10.2-alpine|<none>\n<none>|<none>|sha256:aa\nprom/prometheus|v3.5.0|sha256:bb\n'), {
      'caddy:2.10.2-alpine',
      'prom/prometheus:v3.5.0',
      'prom/prometheus@sha256:bb',
    });
  });
}
