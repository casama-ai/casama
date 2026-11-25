@TestOn('mac-os || linux')
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:casama_computerd/computerd.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

const token = 'test-token-0123456789abcdef';

/// Starts [argv] as the leader of a new process group, as computerd does.
Future<Process> startGroup(List<String> argv) => Platform.isLinux
    ? Process.start('setsid', argv)
    : Process.start('perl', ['-e', 'setpgrp(0,0); exec @ARGV or die', ...argv]);

bool alive(int pid) => Process.runSync('ps', ['-p', '$pid']).exitCode == 0;

Future<void> waitFor(bool Function() done, {Duration timeout = const Duration(seconds: 10)}) async {
  final until = DateTime.now().add(timeout);
  while (!done()) {
    if (DateTime.now().isAfter(until)) throw TimeoutException('condition not met', timeout);
    await Future<void>.delayed(const Duration(milliseconds: 50));
  }
}

void main() {
  test('killProcessGroup kills the command and its children, and nothing outside the group', () async {
    final group = await startGroup(['bash', '-c', r'sleep 60 & echo $!; wait']);
    final child = int.parse((await group.stdout.transform(utf8.decoder).transform(const LineSplitter()).first).trim());
    final outsider = await startGroup(['sleep', '60']);
    addTearDown(() => outsider.kill(ProcessSignal.sigkill));

    killProcessGroup(group);
    await group.exitCode.timeout(const Duration(seconds: 10));
    await waitFor(() => !alive(child));
    expect(alive(outsider.pid), isTrue, reason: 'a process in another group must survive');
    expect(alive(pid), isTrue);
  });

  // 2026-11-24: computerd ran the `kill` program, and procps-ng 4.0.4 reads `kill -KILL -<pgid>`
  // as `kill -KILL -1`, so every cancelled command took the whole computer down. A `kill` on
  // computerd's PATH must never be run; here it only leaves a note that it was called.
  test('killing an exec never runs the kill program and computerd keeps running', () async {
    final dir = Directory.systemTemp.createTempSync('computerd-kill');
    addTearDown(() => dir.deleteSync(recursive: true));
    final bin = Directory('${dir.path}/bin')..createSync();
    final home = Directory('${dir.path}/home')..createSync();
    final note = File('${dir.path}/kill-was-run');
    final fake = File('${bin.path}/kill')..writeAsStringSync('#!/bin/sh\necho "\$@" >> "${note.path}"\n');
    Process.runSync('chmod', ['+x', fake.path]);

    final free = await ServerSocket.bind('127.0.0.1', 0);
    final port = free.port;
    await free.close();
    final entry = File('bin/computerd.dart').existsSync() ? 'bin/computerd.dart' : 'computerd/bin/computerd.dart';
    final daemon = await Process.start(
      Platform.resolvedExecutable,
      ['run', entry],
      environment: {
        'PATH': '${bin.path}:${Platform.environment['PATH']}',
        'COMPUTERD_TOKEN': token,
        'COMPUTERD_HOME': home.path,
        'COMPUTERD_PORT': '$port',
        'COMPUTERD_ADDRESS': '127.0.0.1',
      },
    );
    addTearDown(() => daemon.kill(ProcessSignal.sigkill));
    await daemon.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .firstWhere((l) => l.startsWith('computerd listening'))
        .timeout(const Duration(seconds: 60));
    final base = Uri.parse('http://127.0.0.1:$port');
    final auth = {'authorization': 'Bearer $token'};

    final client = http.Client();
    addTearDown(client.close);
    final req = http.Request('POST', base.resolve('/exec'))
      ..headers.addAll({...auth, 'content-type': 'application/json'})
      ..body = jsonEncode({'cmd': 'echo started; sleep 30'});
    final res = await client.send(req);
    final id = res.headers['x-exec-id']!;
    final lines = <Map<String, dynamic>>[];
    final done = Completer<void>();
    res.stream.transform(utf8.decoder).transform(const LineSplitter()).listen((l) {
      lines.add(jsonDecode(l) as Map<String, dynamic>);
      if (lines.last['type'] == 'stdout') http.post(base.resolve('/exec/$id/kill'), headers: auth);
    }, onDone: done.complete);
    await done.future.timeout(const Duration(seconds: 10));

    expect(lines.last, containsPair('killed', true));
    expect(note.existsSync(), isFalse, reason: 'computerd ran the kill program: ${note.existsSync() ? note.readAsStringSync() : ''}');
    final health = await http.get(base.resolve('/health'));
    expect(jsonDecode(health.body)['ok'], isTrue, reason: 'computerd must survive killing a command');
  }, timeout: const Timeout(Duration(minutes: 2)));
}
