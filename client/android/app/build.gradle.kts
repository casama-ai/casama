import groovy.json.JsonSlurper
import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Official release builds sign with Casama's upload key: android/key.properties (never committed;
// a copy of ~/.config/casama/android-key.properties, keystore and passwords in Vaultwarden).
// Without it (self-hosters, CI) release builds sign with the debug key so they still run.
val keyProperties = Properties().apply {
    val file = rootProject.file("key.properties")
    if (file.exists()) file.inputStream().use { load(it) }
}

// The browser inside the phone app (docs/PHONE-BROWSER-PLAN.md) is compiled in only when asked for:
// CASAMA_APP_BROWSER=1 in the environment, or the marker file scripts/app-browser-switch.sh writes.
// Without it the app has a stub bridge and no WebView code or library.
val appBrowser = System.getenv("CASAMA_APP_BROWSER") == "1" || rootProject.file("app-browser.on").exists()

// Gemini on Android 16+ (docs/ANDROID-APPFUNCTIONS-PLAN.md §7.4, D-567): AppFunctions are compiled
// in only with CASAMA_APP_FUNCTIONS=1 or the marker scripts/app-functions-switch.sh writes. Google
// detects them in any bundle uploaded to Play, so without the switch the build has no KSP run, no
// androidx.appfunctions, no src/appFunctions and no service in the manifest (src/noAppFunctions
// holds a stub bridge). scripts/package-android.sh adds --dart-define=CASAMA_APP_FUNCTIONS=true
// from the same switch.
val appFunctions = System.getenv("CASAMA_APP_FUNCTIONS") == "1" || rootProject.file("app-functions.on").exists()
if (appFunctions) {
    apply(plugin = "com.google.devtools.ksp")
    androidComponents {
        onVariants { variant -> variant.sources.manifests.addStaticManifestFile("src/appFunctions/AndroidManifest.xml") }
    }
}

// Health Connect (D-150) is merged in only with CASAMA_ANDROID_HEALTH=1 (D-494): Play rejected its
// permissions, so store builds leave out src/health/AndroidManifest.xml. The Dart side needs
// --dart-define=CASAMA_ANDROID_HEALTH=true too; scripts/package-android.sh adds it from the same variable.
val androidHealth = System.getenv("CASAMA_ANDROID_HEALTH") == "1"
if (androidHealth) {
    androidComponents {
        onVariants { variant -> variant.sources.manifests.addStaticManifestFile("src/health/AndroidManifest.xml") }
    }
}

// Advertising id (D-573): Meta's SDK (D-566, Decision 3) reads AD_ID, and Play's Advertising ID
// declaration says Yes since 2026-11-25, so every build merges src/adId. Play refuses a bundle whose
// manifest disagrees with that declaration either way. CASAMA_ANDROID_AD_ID=0 merges src/noAdId
// instead, which removes the permission facebook-core and firebase_analytics bring in; use it only
// for a build that never goes to Play, or together with setting the declaration back to No.
val androidAdId = System.getenv("CASAMA_ANDROID_AD_ID") != "0"
androidComponents {
    onVariants { variant ->
        variant.sources.manifests.addStaticManifestFile(
            if (androidAdId) "src/adId/AndroidManifest.xml" else "src/noAdId/AndroidManifest.xml",
        )
    }
}

android {
    namespace = "ai.casama.app"

    buildFeatures {
        resValues = true
    }

    sourceSets {
        getByName("main") {
            kotlin.srcDir(if (appBrowser) "src/appBrowser/kotlin" else "src/noAppBrowser/kotlin")
            kotlin.srcDir(if (appFunctions) "src/appFunctions/kotlin" else "src/noAppFunctions/kotlin")
            if (appFunctions) res.srcDir("src/appFunctions/res")
        }
    }
    // Some plugins (receive_sharing_intent, permission_handler) need API 37 to compile against.
    compileSdk = 37
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "ai.casama.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 26
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // Google Analytics (D-532): the Android Firebase Analytics SDK reads the app id from
        // Android string resources (what google-services.json would make), not from the options
        // Dart starts Firebase with. Read client/config/firebase.json here so every build (plain
        // `flutter run` and `flutter build`, not only scripts/package-android.sh) gets them.
        // Remove any legacy generated firebase_ids.xml so it can't collide with these resValues.
        file("src/main/res/values/firebase_ids.xml").delete()
        val firebaseConfigFile = rootProject.file("../config/firebase.json")
        if (firebaseConfigFile.exists()) {
            @Suppress("UNCHECKED_CAST")
            val firebase = JsonSlurper().parse(firebaseConfigFile) as? Map<String, Any?>
            val appId = firebase?.get("FIREBASE_ANDROID_APP_ID")?.toString()?.takeIf { it.isNotBlank() }
            if (appId != null) {
                listOf(
                    "google_app_id" to appId,
                    "google_api_key" to firebase["FIREBASE_ANDROID_API_KEY"]?.toString(),
                    "gcm_defaultSenderId" to firebase["FIREBASE_MESSAGING_SENDER_ID"]?.toString(),
                    "project_id" to firebase["FIREBASE_PROJECT_ID"]?.toString(),
                ).forEach { (key, value) ->
                    if (!value.isNullOrBlank()) {
                        resValue("string", key, value)
                    }
                }
            }
        }
    }

    signingConfigs {
        if (keyProperties.isNotEmpty()) {
            create("release") {
                storeFile = file(keyProperties.getProperty("storeFile"))
                storePassword = keyProperties.getProperty("storePassword")
                keyAlias = keyProperties.getProperty("keyAlias")
                keyPassword = keyProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.findByName("release") ?: signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

// Release and profile builds leave out dev_dependencies plugins (integration_test), but any other
// Flutter command in client/ (`flutter test`, `flutter pub get`, a web build) rewrites
// GeneratedPluginRegistrant.java with them included. If that happens while this build runs, javac
// fails with "package dev.flutter.plugins.integration_test does not exist". Strip dev-only plugin
// registrations right before compiling a release or profile build so the race can't break it.
val pluginRegistrant = file("src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java")
val pluginDependencies = rootProject.file("../.flutter-plugins-dependencies")
tasks.matching { it.name == "compileReleaseJavaWithJavac" || it.name == "compileProfileJavaWithJavac" }
    .configureEach {
        doFirst {
            if (!pluginRegistrant.exists() || !pluginDependencies.exists()) return@doFirst
            val devPlugins = Regex("\"name\":\"([^\"]+)\"[^{}]*?\"dev_dependency\":true")
                .findAll(pluginDependencies.readText())
                .map { it.groupValues[1] }
                .toSet()
            val source = pluginRegistrant.readText()
            var cleaned = source
            for (name in devPlugins) {
                cleaned = cleaned.replace(
                    Regex(
                        "\\s*try \\{\\s*flutterEngine\\.getPlugins\\(\\)\\.add\\(new [\\w.]+\\(\\)\\);\\s*" +
                            "\\} catch \\(Exception e\\) \\{\\s*Log\\.e\\(TAG, \"Error registering plugin " +
                            Regex.escape(name) + ",[^\"]*\", e\\);\\s*\\}",
                    ),
                    "",
                )
            }
            if (cleaned != source) {
                pluginRegistrant.writeText(cleaned)
                logger.lifecycle("Removed dev-only plugins from GeneratedPluginRegistrant: ${devPlugins.joinToString()}")
            }
        }
    }

dependencies {
    // The sign-in sheet's Custom Tab (MainActivity.kt, D-243).
    implementation("androidx.browser:browser:1.9.0")
    // The live call notification's CallStyle (CallService.kt, D-327).
    implementation("androidx.core:core-ktx:1.13.1")
    // Widgets fresh while the app is closed (GlanceRefresh.kt, D-405). home_widget brings WorkManager
    // in with `implementation`, which doesn't reach this module.
    implementation("androidx.work:work-runtime-ktx:2.11.2")
    // The Wear OS link (WearBridge.kt, D-410): Data Layer messages with the watch app.
    implementation("com.google.android.gms:play-services-wearable:20.0.1")
    // Meta's SDK app id and client token set at runtime (MainActivity.kt MetaBridge,
    // docs/ADS-ATTRIBUTION-PLAN.md §6.5). facebook_app_events brings the SDK in with
    // `implementation`, which doesn't reach this module; same major as the plugin.
    implementation("com.facebook.android:facebook-core:[19.0,20.0)")
    // The phone browser's WebView (AppBrowserBridge.kt): profiles and isolated script worlds need
    // 1.16 or later. Only in builds with the switch on.
    if (appBrowser) implementation("androidx.webkit:webkit:1.18.0")
    // AppFunctions (CasamaFunctions.kt): the library, its KSP compiler (writes the service and the
    // schema in assets/) and coroutines for the suspend functions. Only with the switch on.
    if (appFunctions) {
        implementation("androidx.appfunctions:appfunctions:1.0.0")
        add("ksp", "androidx.appfunctions:appfunctions-compiler:1.0.0")
        implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.10.2")
    }
}
