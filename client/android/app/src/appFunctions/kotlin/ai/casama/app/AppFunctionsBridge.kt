package ai.casama.app

import android.content.Context
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.appfunctions.AppFunctionManager
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull
import kotlin.coroutines.resume

/**
 * How Casama's AppFunctions reach Dart (docs/ANDROID-APPFUNCTIONS-PLAN.md §7.2, D-567). Acting goes
 * through the app (D-405 §8.4): an ask or a routine run is handed to Dart over
 * `casama/app_functions`, where the same bridge as Siri's (`client/lib/features/siri/siri_bridge.dart`)
 * acts as the signed-in person with every check the app already makes. No key that can act lives in
 * native code (decision 9).
 *
 * - The app is open: its engine's channel ([attach] from MainActivity).
 * - It isn't: a headless [FlutterEngine] running `appFunctionsMain` (client/lib/main.dart), started
 *   here, kept for [AssistantModel.ENGINE_IDLE_MS] after the last call. Phase 0 measures how long it
 *   takes to say `ready`.
 *
 * Dart → native on the same channel: `ready` (Dart listens now) and `setEnabled` (`enabled`: signed in
 * and Settings → Privacy → Let Gemini use Casama, plan §7.3), which turns the functions on or off
 * for Gemini with [AppFunctionManager.setAppFunctionEnabled].
 */
object AppFunctionsBridge {
  const val CHANNEL = "casama/app_functions"
  private const val TAG = "CasamaFunctions"

  private val main = Handler(Looper.getMainLooper())
  private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Default)

  /** The open app's engine and whether its Dart side has said `ready`. */
  @Volatile private var appEngine: FlutterEngine? = null
  @Volatile private var appChannel: MethodChannel? = null
  @Volatile private var appReady = CompletableDeferred<Unit>()

  /** The headless engine, when one was started for a call. Main thread only. */
  private var headless: FlutterEngine? = null
  private var headlessChannel: MethodChannel? = null
  private var headlessReady = CompletableDeferred<Unit>()
  private val closeIdle = Runnable { closeHeadless() }

  /** MainActivity's engine is up: its channel serves the functions while the app is open. */
  fun attach(engine: FlutterEngine, context: Context) {
    val app = context.applicationContext
    val channel = MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL)
    appReady = CompletableDeferred()
    channel.setMethodCallHandler { call, result -> handle(app, call.method, call.arguments, result) { appReady.complete(Unit) } }
    appEngine = engine
    appChannel = channel
  }

  fun detach(engine: FlutterEngine) {
    if (appEngine !== engine) return
    appChannel?.setMethodCallHandler(null)
    appChannel = null
    appEngine = null
  }

  private fun handle(context: Context, method: String, args: Any?, result: MethodChannel.Result, onReady: () -> Unit) {
    when (method) {
      "ready" -> {
        onReady()
        result.success(true)
      }
      "setEnabled" -> {
        val on = (args as? Map<*, *>)?.get("enabled") == true
        scope.launch { setEnabled(context, on) }
        result.success(true)
      }
      else -> result.notImplemented()
    }
  }

  /** Turns every function on or off for callers (Gemini, Google's testing agent). */
  suspend fun setEnabled(context: Context, on: Boolean) {
    if (Build.VERSION.SDK_INT < 36) return
    val manager = AppFunctionManager.getInstance(context) ?: return
    val state = if (on) AppFunctionManager.APP_FUNCTION_STATE_ENABLED else AppFunctionManager.APP_FUNCTION_STATE_DISABLED
    for (id in AssistantModel.FUNCTION_IDS) {
      // The index may not be ready right after install or an update; the next change retries.
      runCatching { manager.setAppFunctionEnabled(id, state) }.onFailure { Log.w(TAG, "setAppFunctionEnabled $id: ${it.message}") }
    }
  }

  /**
   * Calls [method] on Dart with [args] and waits up to [waitMs] (plus start-up when the app isn't
   * running) for its answer. Null when Dart didn't come up or didn't answer in time.
   */
  suspend fun call(context: Context, method: String, args: Map<String, Any?>, waitMs: Long): Map<String, Any?>? {
    val app = context.applicationContext
    val started = System.currentTimeMillis()
    val target = appChannel?.let { it to appReady } ?: withContext(Dispatchers.Main) { startHeadless(app) }
      ?: return null
    val cold = target.first !== appChannel
    val (channel, ready) = target
    val budget = AssistantModel.budgetMs(cold, waitMs)
    return withTimeoutOrNull(budget) {
      ready.await()
      if (cold) Log.i(TAG, "Dart ready after ${System.currentTimeMillis() - started} ms (cold)")
      invoke(channel, method, args)
    }.also {
      withContext(Dispatchers.Main) { if (headless != null) { main.removeCallbacks(closeIdle); main.postDelayed(closeIdle, AssistantModel.ENGINE_IDLE_MS) } }
    }
  }

  private suspend fun invoke(channel: MethodChannel, method: String, args: Map<String, Any?>): Map<String, Any?>? =
    suspendCancellableCoroutine { cont ->
      main.post {
        channel.invokeMethod(
          method,
          args,
          object : MethodChannel.Result {
            override fun success(result: Any?) {
              @Suppress("UNCHECKED_CAST")
              val map = (result as? Map<*, *>)?.mapKeys { it.key.toString() } as Map<String, Any?>?
              if (cont.isActive) cont.resume(map)
            }

            override fun error(code: String, message: String?, details: Any?) {
              Log.w(TAG, "$method failed in Dart: $code $message")
              if (cont.isActive) cont.resume(null)
            }

            override fun notImplemented() {
              if (cont.isActive) cont.resume(null)
            }
          },
        )
      }
    }

  /** Starts (or reuses) the headless engine. Main thread. Null when Flutter can't start here. */
  private fun startHeadless(context: Context): Pair<MethodChannel, CompletableDeferred<Unit>>? {
    headlessChannel?.let { return it to headlessReady }
    return try {
      val loader = FlutterInjector.instance().flutterLoader()
      loader.startInitialization(context)
      loader.ensureInitializationComplete(context, null)
      // Plugins register themselves (GeneratedPluginRegistrant), so the saved session and the
      // backend work as in the app; there is no activity and no surface.
      val engine = FlutterEngine(context)
      val channel = MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL)
      val ready = CompletableDeferred<Unit>()
      channel.setMethodCallHandler { call, result -> handle(context, call.method, call.arguments, result) { ready.complete(Unit) } }
      engine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint(loader.findAppBundlePath(), "appFunctionsMain"))
      headless = engine
      headlessChannel = channel
      headlessReady = ready
      main.postDelayed(closeIdle, AssistantModel.ENGINE_IDLE_MS)
      channel to ready
    } catch (e: Exception) {
      Log.w(TAG, "headless Flutter failed to start: ${e.message}")
      closeHeadless()
      null
    }
  }

  private fun closeHeadless() {
    main.removeCallbacks(closeIdle)
    headlessChannel?.setMethodCallHandler(null)
    headlessChannel = null
    headless?.destroy()
    headless = null
    headlessReady = CompletableDeferred()
  }
}
