import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:casama/core/rate_limit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class _StubAdapter implements HttpClientAdapter {
  _StubAdapter(this._responses);

  final List<({int status, Map<String, List<String>> headers, Object body})>
  _responses;
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final r =
        _responses[calls < _responses.length ? calls : _responses.length - 1];
    calls++;
    return ResponseBody.fromString(
      jsonEncode(r.body),
      r.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
        ...r.headers,
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('retries 503 db_busy and 409 busy with backoff and succeeds', () async {
    final adapter = _StubAdapter([
      (
        status: 503,
        headers: {
          'retry-after': ['0'],
        },
        body: {'code': 'db_busy', 'message': 'busy'},
      ),
      (
        status: 409,
        headers: <String, List<String>>{},
        body: {'code': 'busy', 'message': 'lock timeout'},
      ),
      (status: 200, headers: <String, List<String>>{}, body: {'ok': true}),
    ]);
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      RateLimitRetryInterceptor(
        dio,
        baseBackoff: const Duration(milliseconds: 10),
        maxBackoff: const Duration(milliseconds: 50),
        random: Random(1),
      ),
    );

    final res = await dio.get<Map<String, dynamic>>('/v1/test');
    expect(res.statusCode, 200);
    expect(res.data, {'ok': true});
    expect(adapter.calls, 3);
  });

  test('does not retry non-busy 409 errors', () async {
    final adapter = _StubAdapter([
      (
        status: 409,
        headers: <String, List<String>>{},
        body: {'code': 'computer_asleep', 'message': 'asleep'},
      ),
    ]);
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      RateLimitRetryInterceptor(
        dio,
        baseBackoff: const Duration(milliseconds: 10),
        random: Random(1),
      ),
    );

    await expectLater(
      dio.get<dynamic>('/v1/test'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.calls, 1);
  });

  test('does not retry non-idempotent POST on 503, but retries POST with Idempotency-Key', () async {
    final adapter1 = _StubAdapter([
      (
        status: 503,
        headers: <String, List<String>>{},
        body: {'code': 'request_timeout', 'message': 'timeout'},
      ),
      (status: 200, headers: <String, List<String>>{}, body: {'ok': true}),
    ]);
    final dio1 = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter1;
    dio1.interceptors.add(
      RateLimitRetryInterceptor(
        dio1,
        baseBackoff: const Duration(milliseconds: 10),
        random: Random(1),
      ),
    );
    await expectLater(
      dio1.post<dynamic>('/v1/slow-action'),
      throwsA(isA<DioException>()),
    );
    expect(adapter1.calls, 1);

    final adapter2 = _StubAdapter([
      (
        status: 503,
        headers: <String, List<String>>{},
        body: {'code': 'request_timeout', 'message': 'timeout'},
      ),
      (status: 200, headers: <String, List<String>>{}, body: {'ok': true}),
    ]);
    final dio2 = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter2;
    dio2.interceptors.add(
      RateLimitRetryInterceptor(
        dio2,
        baseBackoff: const Duration(milliseconds: 10),
        random: Random(1),
      ),
    );
    final res = await dio2.post<Map<String, dynamic>>(
      '/v1/idempotent-action',
      options: Options(headers: {'Idempotency-Key': 'k-123'}),
    );
    expect(res.statusCode, 200);
    expect(adapter2.calls, 2);
  });
}
