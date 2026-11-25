package ai.casama.app

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine

/**
 * AppFunctions for Gemini (docs/ANDROID-APPFUNCTIONS-PLAN.md, D-567) are not in this build: the real
 * bridge lives in src/appFunctions and is compiled only with the build switch (app/build.gradle.kts,
 * scripts/app-functions-switch.sh). Dart doesn't call `casama/app_functions` without the switch.
 */
object AppFunctionsBridge {
  fun attach(engine: FlutterEngine, context: Context) {}

  fun detach(engine: FlutterEngine) {}
}
