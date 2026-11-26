import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:pointycastle/export.dart' as pc;

/// Every secret the installer makes, in Dart (no OpenSSL), the same shapes install.sh writes.
/// Tests subclass it to skip the slow RSA key.
class SecretSource {
  SecretSource([Random? random]) : _r = random ?? Random.secure();
  final Random _r;

  Uint8List bytes(int n) => Uint8List.fromList(List.generate(n, (_) => _r.nextInt(256)));

  /// `openssl rand -hex n`: [n] random bytes as 2n hex characters.
  String hex(int n) => bytes(n).map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  /// `openssl rand -base64 n`.
  String base64Bytes(int n) => base64.encode(bytes(n));

  /// A random (version 4) UUID, for `CASAMA_INSTANCE_ID`.
  String uuid() {
    final b = bytes(16);
    b[6] = (b[6] & 0x0f) | 0x40;
    b[8] = (b[8] & 0x3f) | 0x80;
    final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
    return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
  }

  /// A Supabase API key (`anon` or `service_role`) signed with [jwtSecret], valid ten years.
  String supabaseKey(String role, String jwtSecret, {DateTime? now}) {
    final iat = (now ?? DateTime.now()).millisecondsSinceEpoch ~/ 1000;
    return signHs256({'role': role, 'iss': 'supabase', 'iat': iat, 'exp': iat + 10 * 365 * 24 * 3600}, jwtSecret);
  }

  /// Supabase Auth's SAML signing key: RSA 2048, PKCS#1 DER, base64 on one line.
  String samlKey() {
    final seed = pc.FortunaRandom()..seed(pc.KeyParameter(bytes(32)));
    final gen = pc.RSAKeyGenerator()..init(pc.ParametersWithRandom(pc.RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64), seed));
    final pair = gen.generateKeyPair();
    return base64.encode(pkcs1Der(pair.privateKey));
  }
}

String _b64url(List<int> b) => base64Url.encode(b).replaceAll('=', '');

/// An HS256 JWT over [claims], as install.sh's `jwt` (header `{"alg":"HS256","typ":"JWT"}`).
String signHs256(Map<String, Object?> claims, String secret) {
  final head = _b64url(utf8.encode(jsonEncode({'alg': 'HS256', 'typ': 'JWT'})));
  final body = _b64url(utf8.encode(jsonEncode(claims)));
  final sig = Hmac(sha256, utf8.encode(secret)).convert(utf8.encode('$head.$body')).bytes;
  return '$head.$body.${_b64url(sig)}';
}

/// PKCS#1 `RSAPrivateKey` in DER.
Uint8List pkcs1Der(pc.RSAPrivateKey k) {
  final p = k.p!, q = k.q!, d = k.privateExponent!;
  final ints = [BigInt.zero, k.modulus!, k.publicExponent!, d, p, q, d % (p - BigInt.one), d % (q - BigInt.one), q.modInverse(p)];
  return _derSeq(ints.map(_derInt).expand((x) => x).toList());
}

List<int> _derLen(int n) {
  if (n < 0x80) return [n];
  final out = <int>[];
  for (var v = n; v > 0; v >>= 8) {
    out.insert(0, v & 0xff);
  }
  return [0x80 | out.length, ...out];
}

List<int> _derInt(BigInt v) {
  var hex = v.toRadixString(16);
  if (hex.length.isOdd) hex = '0$hex';
  final b = [for (var i = 0; i < hex.length; i += 2) int.parse(hex.substring(i, i + 2), radix: 16)];
  if (b.isEmpty) b.add(0);
  if (b.first & 0x80 != 0) b.insert(0, 0);
  return [0x02, ..._derLen(b.length), ...b];
}

Uint8List _derSeq(List<int> content) => Uint8List.fromList([0x30, ..._derLen(content.length), ...content]);
