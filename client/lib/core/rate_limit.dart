import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';

import '../l10n/generated/app_localizations.dart';

/// How long the server asked us to wait (its `retry-after` header) when [error] is a 429, or null.
Duration? retryAfterOf(Object error) {
  if (error is! DioException || error.response?.statusCode != 429) return null;
  return _parseRetryAfter(error.response);
}

Duration? _parseRetryAfter(Response<dynamic>? res) {
  final raw = res?.headers.value('retry-after');
  final seconds = int.tryParse(raw?.trim() ?? '');
  if (seconds == null || seconds < 0) return null;
  return Duration(seconds: seconds);
}

String? _errorCodeOf(Response<dynamic>? res) {
  final data = res?.data;
  if (data is Map) {
    final c = data['code'];
    if (c is String) return c;
  }
  return null;
}

bool _isIdempotentRequest(RequestOptions options) {
  final method = options.method.toUpperCase();
  if (method == 'GET' ||
      method == 'HEAD' ||
      method == 'OPTIONS' ||
      method == 'PUT' ||
      method == 'DELETE') {
    return true;
  }
  // Only retry POST/PATCH when the caller explicitly supplied an Idempotency-Key (D-554).
  for (final entry in options.headers.entries) {
    if (entry.key.toLowerCase() == 'idempotency-key' &&
        entry.value != null &&
        '${entry.value}'.trim().isNotEmpty) {
      return true;
    }
  }
  return false;
}

bool _isRetryableBusy(DioException err) {
  if (!_isIdempotentRequest(err.requestOptions)) return false;
  final status = err.response?.statusCode;
  final code = _errorCodeOf(err.response);
  if (status == 503) {
    return code == null || code == 'db_busy' || code == 'request_timeout' || code == 'server_busy';
  }
  if (status == 409 && code == 'busy') return true;
  return false;
}

/// Retries short 429s once, and retries 503 (`db_busy`, `request_timeout`, `server_busy`) or 409
/// `busy` with jittered exponential backoff (1 s, 2 s, 4 s … capped at 30 s) honoring `Retry-After`
/// (D-554).
class RateLimitRetryInterceptor extends Interceptor {
  RateLimitRetryInterceptor(
    this._dio, {
    this.maxWait = const Duration(seconds: 3),
    this.maxBusyRetries = 3,
    this.baseBackoff = const Duration(seconds: 1),
    this.maxBackoff = const Duration(seconds: 30),
    Random? random,
  }) : _random = random ?? Random();

  final Dio _dio;
  final Duration maxWait;
  final int maxBusyRetries;
  final Duration baseBackoff;
  final Duration maxBackoff;
  final Random _random;
  static const _retried = 'casama_rate_limit_retried';
  static const _busyAttempt = 'casama_busy_retry_attempt';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;

    // 429 rate-limit single retry (existing behavior).
    final wait = retryAfterOf(err);
    if (wait != null && wait <= maxWait && options.extra[_retried] != true) {
      await Future<void>.delayed(wait);
      try {
        options.extra[_retried] = true;
        handler.resolve(await _dio.fetch<dynamic>(options));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }

    // 503 / 409 busy jittered exponential backoff honoring Retry-After (D-554).
    final attempt = (options.extra[_busyAttempt] as int?) ?? 0;
    if (_isRetryableBusy(err) && attempt < maxBusyRetries) {
      final expMs = baseBackoff.inMilliseconds * (1 << attempt);
      final clampedMs = min(expMs, maxBackoff.inMilliseconds);
      final jitterMs = (clampedMs * (0.75 + _random.nextDouble() * 0.5)).round();
      final headerWait = _parseRetryAfter(err.response);
      final delayMs = max(
        jitterMs,
        min(headerWait?.inMilliseconds ?? 0, maxBackoff.inMilliseconds),
      );
      await Future<void>.delayed(Duration(milliseconds: delayMs));
      try {
        options.extra[_busyAttempt] = attempt + 1;
        handler.resolve(await _dio.fetch<dynamic>(options));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }

    handler.next(err);
  }
}

/// A toast's message while a rate limit lasts: "Try again in 12 seconds", counting down, then
/// "You can try again now".
class RateLimitCountdown extends StatefulWidget {
  const RateLimitCountdown({super.key, required this.until, this.style});

  final DateTime until;
  final TextStyle? style;

  @override
  State<RateLimitCountdown> createState() => _RateLimitCountdownState();
}

class _RateLimitCountdownState extends State<RateLimitCountdown> {
  Timer? _timer;
  late final int _start = _byClock;
  int _ticks = 0;

  int get _byClock {
    final ms = widget.until.difference(DateTime.now()).inMilliseconds;
    return ms <= 0 ? 0 : (ms / 1000).ceil();
  }

  /// By the timer's own ticks, or the clock when timers ran late (the app was in the background).
  int get _left {
    final byTicks = _start - _ticks;
    final left = byTicks < _byClock ? byTicks : _byClock;
    return left < 0 ? 0 : left;
  }

  @override
  void initState() {
    super.initState();
    _start;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _ticks++);
      if (_left == 0) _timer?.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final left = _left;
    return Text(
      left > 0 ? l10n.tooManyRequestsWait(left) : l10n.tooManyRequestsReady,
      style: widget.style,
    );
  }
}
