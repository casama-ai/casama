import 'dart:io';

/// Runs programs (docker, chmod). Swapped for a fake in tests.
abstract class ProcessRunner {
  /// Runs [executable] and collects its output.
  Future<ProcessResult> run(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment});

  /// Runs [executable] with its standard output written to [out]; returns the exit code.
  Future<int> runToFile(String executable, List<String> arguments, File out, {String? workingDirectory});
}

/// The real thing, through `dart:io`.
class SystemProcessRunner implements ProcessRunner {
  const SystemProcessRunner();

  @override
  Future<ProcessResult> run(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment}) =>
      Process.run(executable, arguments, workingDirectory: workingDirectory, environment: environment);

  @override
  Future<int> runToFile(String executable, List<String> arguments, File out, {String? workingDirectory}) async {
    final proc = await Process.start(executable, arguments, workingDirectory: workingDirectory);
    final sink = out.openWrite();
    await Future.wait([proc.stdout.pipe(sink), proc.stderr.drain<void>()]);
    return proc.exitCode;
  }
}
