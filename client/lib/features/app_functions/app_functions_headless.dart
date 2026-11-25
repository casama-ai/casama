import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/config.dart';
import '../../core/local_cache.dart';
import '../../core/providers.dart';
import '../../core/server_config_cache.dart';
import '../../core/supabase_backend.dart';
import '../../core/timeout_http_client.dart';
import '../app_lock/app_lock.dart';
import '../app_lock/session_store.dart';
import 'app_functions.dart';

/// The light start for a Gemini call while Casama isn't open (D-567, plan §13 "Phase 0 results"):
/// the whole app's startup took 13 s cold on the emulator, far too slow for an assistant. This
/// connects only what the bridge needs (the saved server settings, the saved session, the chosen
/// workspace, the app lock) and runs the bridge in a [ProviderContainer], with no window, no app
/// tree, no telemetry, ads or install tracking. The engine is closed by native code when idle.
Future<ProviderContainer> startAppFunctionsHeadless(AppConfig config) async {
  final selectedOrg = SelectedOrg.preload();
  final appLock = AppLockSettingsNotifier.preload();
  final saved = await ServerConfigCache.read(config.apiUrl);
  final server = saved ?? (await CasamaClient.connect(config.apiUrl)).config;
  if (saved == null) unawaited(ServerConfigCache.write(config.apiUrl, server));
  await Supabase.initialize(
    url: server.supabaseUrl,
    publishableKey: server.supabaseAnonKey,
    httpClient: TimeoutHttpClient(),
    // The same store as the app, so the app lock's keychain session is found too (D-375).
    authOptions: FlutterAuthClientOptions(
      localStorage: AuthSessionStore.create(server.supabaseUrl),
    ),
  );
  final supabase = Supabase.instance.client;
  final api = await SupabaseBackend.connectApi(
    config.apiUrl,
    supabase,
    config: server,
  );
  final backend = SupabaseBackend(supabase, api, config: server);
  await selectedOrg;
  await appLock;
  final container = ProviderContainer(
    overrides: [
      backendProvider.overrideWithValue(backend),
      localCacheProvider.overrideWithValue(openLocalCache()),
    ],
  );
  // Starting the bridge says `ready` to native code. Listened, not just read: a provider nobody
  // listens to can be disposed, which would unhook the channel right after `ready` (seen in Phase 0:
  // the first ask got no answer).
  container.listen(appFunctionsBridgeProvider, (_, _) {});
  // The bots an ask goes to, loading from now and kept: in the app the screens keep them, here
  // nothing else would, and an ask that finds no bot only opens the app (Phase 0).
  container.listen<AsyncValue<List<Bot>>>(botsProvider, (_, next) {
    if (kDebugMode) {
      debugPrint(
        'appFunctions: bots ${next.isLoading
            ? 'loading'
            : next.hasError
            ? 'failed: ${next.error}'
            : '${next.value?.length}'}',
      );
    }
  }, fireImmediately: true);
  return container;
}
