import 'dart:async';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import 'errors.dart';

/// Downloads [url] to [to], checks it against [sha256Hex] and reports progress (0..1) when the
/// size is known. Deletes the file and throws when the checksum doesn't match.
Future<void> downloadBundle(Uri url, File to, String sha256Hex, {required http.Client client, void Function(double fraction)? onProgress}) async {
  final res = await client.send(http.Request('GET', url));
  if (res.statusCode != 200) {
    await res.stream.drain<void>();
    throw SelfhostException('download_failed', 'Could not download the release bundle (HTTP ${res.statusCode}).');
  }
  final total = res.contentLength;
  final digestOut = _DigestSink();
  final hasher = sha256.startChunkedConversion(digestOut);
  final sink = to.openWrite();
  var got = 0;
  try {
    await for (final chunk in res.stream) {
      hasher.add(chunk);
      sink.add(chunk);
      got += chunk.length;
      if (total != null && total > 0) onProgress?.call(got / total);
    }
  } finally {
    await sink.close();
  }
  hasher.close();
  if (digestOut.value.toString() != sha256Hex.toLowerCase()) {
    to.deleteSync();
    throw SelfhostException('checksum_mismatch', 'The downloaded bundle does not match the release checksum; nothing was changed.');
  }
}

class _DigestSink implements Sink<Digest> {
  late Digest value;
  @override
  void add(Digest data) => value = data;
  @override
  void close() {}
}

/// Files the bundle owns in an install folder (everything the tarball holds is listed here
/// after extraction, so a rollback can put the previous ones back).
List<String> extractBundle(File tarGz, Directory dir, {Set<String> skip = const {'.env'}}) {
  final archive = TarDecoder().decodeBytes(GZipDecoder().decodeBytes(tarGz.readAsBytesSync()));
  final files = archive.files.where((f) => f.isFile).toList();
  if (files.isEmpty) throw SelfhostException('bundle_invalid', 'The release bundle is empty.');
  // A single top-level folder (casama-selfhost-<version>/) is stripped.
  final firsts = files.map((f) => f.name.split('/').first).toSet();
  final strip = firsts.length == 1 && files.every((f) => f.name.contains('/')) ? '${firsts.single}/' : '';
  final root = p.canonicalize(dir.path);
  final written = <String>[];
  for (final f in files) {
    final rel = f.name.substring(strip.length);
    if (rel.isEmpty || skip.contains(rel)) continue;
    final target = p.canonicalize(p.join(root, rel));
    if (!p.isWithin(root, target)) throw SelfhostException('bundle_invalid', 'The release bundle has a path outside its folder: ${f.name}');
    final out = File(target)..parent.createSync(recursive: true);
    out.writeAsBytesSync(f.content as List<int>);
    // Keep the executable bit for install.sh on Mac and Linux.
    if (!Platform.isWindows && (f.mode & 0x49) != 0) {
      Process.runSync('chmod', ['+x', out.path]);
    }
    written.add(p.posix.joinAll(p.split(rel)));
  }
  return written;
}
