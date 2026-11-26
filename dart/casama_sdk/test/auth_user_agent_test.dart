import 'dart:convert';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// The `casama` CLI signs in with its own User-Agent, which Supabase Auth keeps with the session
/// (D-577: a CLI sign-in is a developer signal). Without one, the client's default stays.
void main() {
  final session = {
    'access_token': 'a',
    'refresh_token': 'r',
    'expires_in': 3600,
    'user': {'id': 'u1', 'email': 'dev@example.com'},
  };

  Future<String?> agentOf(String? userAgent) async {
    String? seen;
    final auth = AuthClient(
      supabaseUrl: 'https://auth.example',
      anonKey: 'anon',
      userAgent: userAgent,
      httpClient: MockClient((req) async {
        seen = req.headers['user-agent'];
        return http.Response(jsonEncode(session), 200);
      }),
    );
    await auth.signInWithPassword(email: 'dev@example.com', password: 'pw');
    return seen;
  }

  test('sends the given User-Agent with sign-in calls', () async {
    expect(await agentOf('casama-cli/0.1.4'), 'casama-cli/0.1.4');
  });

  test('sends none of its own when not given one', () async {
    expect(await agentOf(null), isNull);
  });
}
