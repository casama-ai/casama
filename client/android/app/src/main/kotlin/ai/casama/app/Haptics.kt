package ai.casama.app

import android.app.Activity
import android.content.Context
import android.os.Build
import android.os.VibrationAttributes
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager
import android.view.HapticFeedbackConstants
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.math.roundToInt

/**
 * Native haptics bridge (`casama/haptics`, docs/HAPTICS-PLAN.md §4, §7.2).
 *
 * Standard haptics go through `View.performHapticFeedback` with Android 14 and Android 11
 * constants (falling back by API level) so they follow the system Touch feedback setting and
 * device OEM tuning without needing special permissions.
 *
 * Casama's four signatures (`attention`, `arrive`, `done`, `celebrate`) and `destroy` use
 * `VibrationEffect.Composition` primitives tagged as `USAGE_TOUCH` where the phone supports them,
 * falling back to amplitude waveforms or predefined effects.
 */
object HapticsBridge {
    fun attach(flutterEngine: FlutterEngine, activity: Activity) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "casama/haptics")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "play" -> {
                        val kind = call.argument<String>("kind")
                        if (kind == null) {
                            result.notImplemented()
                        } else {
                            play(activity, kind, call)
                            result.success(null)
                        }
                    }
                    "prepare", "allowDuringRecording" -> result.success(null)
                    else -> result.notImplemented()
                }
            }
    }

    private fun play(activity: Activity, kind: String, call: MethodCall) {
        val view = activity.window?.decorView
        when (kind) {
            "tap" -> {
                if ( !composeIfSupported(activity, VibrationEffect.Composition.PRIMITIVE_CLICK to 0.6f) ) {
                    view?.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY)
                }
            }
            "press" -> {
                if ( !composeIfSupported(activity, VibrationEffect.Composition.PRIMITIVE_CLICK to 0.9f) ) {
                    view?.performHapticFeedback(HapticFeedbackConstants.CONTEXT_CLICK)
                }
            }
            "select" -> {
                val constant = if (Build.VERSION.SDK_INT >= 34) {
                    HapticFeedbackConstants.SEGMENT_TICK
                } else {
                    HapticFeedbackConstants.CLOCK_TICK
                }
                view?.performHapticFeedback(constant)
            }
            "toggleOn" -> {
                val constant = if (Build.VERSION.SDK_INT >= 34) {
                    HapticFeedbackConstants.TOGGLE_ON
                } else {
                    HapticFeedbackConstants.CLOCK_TICK
                }
                view?.performHapticFeedback(constant)
            }
            "toggleOff" -> {
                val constant = if (Build.VERSION.SDK_INT >= 34) {
                    HapticFeedbackConstants.TOGGLE_OFF
                } else {
                    HapticFeedbackConstants.CLOCK_TICK
                }
                view?.performHapticFeedback(constant)
            }
            "threshold" -> {
                val constant = if (Build.VERSION.SDK_INT >= 34) {
                    HapticFeedbackConstants.GESTURE_THRESHOLD_ACTIVATE
                } else {
                    HapticFeedbackConstants.LONG_PRESS
                }
                view?.performHapticFeedback(constant)
            }
            "thresholdBack" -> {
                if (Build.VERSION.SDK_INT >= 34) {
                    view?.performHapticFeedback(HapticFeedbackConstants.GESTURE_THRESHOLD_DEACTIVATE)
                }
            }
            "lift" -> {
                val constant = if (Build.VERSION.SDK_INT >= 34) {
                    HapticFeedbackConstants.DRAG_START
                } else {
                    HapticFeedbackConstants.LONG_PRESS
                }
                view?.performHapticFeedback(constant)
            }
            "drop" -> {
                if (Build.VERSION.SDK_INT >= 30) {
                    view?.performHapticFeedback(HapticFeedbackConstants.GESTURE_END)
                } else {
                    view?.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK)
                }
            }
            "snap" -> {
                if (Build.VERSION.SDK_INT >= 34) {
                    view?.performHapticFeedback(HapticFeedbackConstants.SEGMENT_FREQUENT_TICK)
                } else if (!composeIfSupported(activity, VibrationEffect.Composition.PRIMITIVE_TICK to 0.6f)) {
                    view?.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK)
                }
            }
            "confirm" -> {
                if (Build.VERSION.SDK_INT >= 30) {
                    view?.performHapticFeedback(HapticFeedbackConstants.CONFIRM)
                } else {
                    vibrateWaveform(activity, longArrayOf(0, 14, 45, 22), intArrayOf(0, 120, 0, 220))
                }
            }
            "reject" -> {
                if (Build.VERSION.SDK_INT >= 30) {
                    view?.performHapticFeedback(HapticFeedbackConstants.REJECT)
                } else {
                    vibrateWaveform(
                        activity,
                        longArrayOf(0, 22, 40, 22, 40, 32),
                        intArrayOf(0, 220, 0, 220, 0, 255)
                    )
                }
            }
            "warn" -> {
                if (!composeStepsIfSupported(
                        activity,
                        listOf(
                            Step(VibrationEffect.Composition.PRIMITIVE_CLICK, 0.7f, 0),
                            Step(VibrationEffect.Composition.PRIMITIVE_TICK, 0.9f, 70),
                        )
                    )
                ) {
                    vibrateWaveform(activity, longArrayOf(0, 18, 60, 24), intArrayOf(0, 170, 0, 210))
                }
            }
            "destroy" -> {
                val thud = if (Build.VERSION.SDK_INT >= 31) {
                    VibrationEffect.Composition.PRIMITIVE_THUD
                } else {
                    VibrationEffect.Composition.PRIMITIVE_CLICK
                }
                if (!composeIfSupported(activity, thud to 1.0f)) {
                    if (Build.VERSION.SDK_INT >= 29) {
                        vibrateEffect(activity, VibrationEffect.createPredefined(VibrationEffect.EFFECT_HEAVY_CLICK))
                    } else {
                        view?.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS)
                    }
                }
            }
            "attention" -> {
                val scale = (call.argument<Double>("attentionIntensity") ?: 0.8).toFloat().coerceIn(0.1f, 1f)
                val gap = (call.argument<Int>("attentionGapMs") ?: 90).coerceIn(20, 400)
                if (!composeStepsIfSupported(
                        activity,
                        listOf(
                            Step(VibrationEffect.Composition.PRIMITIVE_CLICK, scale, 0),
                            Step(VibrationEffect.Composition.PRIMITIVE_CLICK, scale, gap),
                        )
                    )
                ) {
                    val amp = (scale * 255).roundToInt().coerceIn(40, 255)
                    vibrateWaveform(
                        activity,
                        longArrayOf(0, 25, gap.toLong(), 25),
                        intArrayOf(0, amp, 0, amp)
                    )
                }
            }
            "arrive" -> {
                val scale = (call.argument<Double>("arriveIntensity") ?: 0.7).toFloat().coerceIn(0.1f, 1f)
                val primitive = if (Build.VERSION.SDK_INT >= 31) {
                    VibrationEffect.Composition.PRIMITIVE_LOW_TICK
                } else {
                    VibrationEffect.Composition.PRIMITIVE_TICK
                }
                if (!composeIfSupported(activity, primitive to scale)) {
                    if (Build.VERSION.SDK_INT >= 29) {
                        vibrateEffect(activity, VibrationEffect.createPredefined(VibrationEffect.EFFECT_TICK))
                    } else {
                        view?.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK)
                    }
                }
            }
            "done" -> {
                val first = (call.argument<Double>("doneFirstIntensity") ?: 0.5).toFloat().coerceIn(0.1f, 1f)
                val second = (call.argument<Double>("doneSecondIntensity") ?: 1.0).toFloat().coerceIn(0.1f, 1f)
                val gap = (call.argument<Int>("doneGapMs") ?: 60).coerceIn(20, 400)
                if (!composeStepsIfSupported(
                        activity,
                        listOf(
                            Step(VibrationEffect.Composition.PRIMITIVE_TICK, first, 0),
                            Step(VibrationEffect.Composition.PRIMITIVE_CLICK, second, gap),
                        )
                    )
                ) {
                    val a1 = (first * 255).roundToInt().coerceIn(40, 255)
                    val a2 = (second * 255).roundToInt().coerceIn(40, 255)
                    vibrateWaveform(
                        activity,
                        longArrayOf(0, 15, gap.toLong(), 28),
                        intArrayOf(0, a1, 0, a2)
                    )
                }
            }
            "celebrate" -> {
                val scale = (call.argument<Double>("celebrateIntensity") ?: 0.9).toFloat().coerceIn(0.1f, 1f)
                val gap = (call.argument<Int>("celebrateGapMs") ?: 40).coerceIn(20, 400)
                if (!composeStepsIfSupported(
                        activity,
                        listOf(
                            Step(VibrationEffect.Composition.PRIMITIVE_QUICK_RISE, (scale * 0.67f).coerceIn(0.2f, 1f), 0),
                            Step(VibrationEffect.Composition.PRIMITIVE_CLICK, scale, gap),
                        )
                    )
                ) {
                    val peak = (scale * 255).roundToInt().coerceIn(60, 255)
                    vibrateWaveform(
                        activity,
                        longArrayOf(0, 14, gap.toLong(), 18, gap.toLong(), 28),
                        intArrayOf(0, (peak * 0.5).roundToInt(), 0, (peak * 0.75).roundToInt(), 0, peak)
                    )
                }
            }
        }
    }

    private data class Step(val primitive: Int, val scale: Float, val delayMs: Int)

    private fun composeIfSupported(activity: Activity, pair: Pair<Int, Float>): Boolean =
        composeStepsIfSupported(activity, listOf(Step(pair.first, pair.second, 0)))

    private fun composeStepsIfSupported(activity: Activity, steps: List<Step>): Boolean {
        if (Build.VERSION.SDK_INT < 30) return false
        val vibrator = vibrator(activity) ?: return false
        val primitives = steps.map { it.primitive }.toIntArray()
        if (!vibrator.areAllPrimitivesSupported(*primitives)) return false
        val composition = VibrationEffect.startComposition()
        for (step in steps) {
            composition.addPrimitive(step.primitive, step.scale.coerceIn(0f, 1f), step.delayMs)
        }
        vibrateEffect(activity, composition.compose())
        return true
    }

    private fun vibrateWaveform(activity: Activity, timings: LongArray, amplitudes: IntArray) {
        val vibrator = vibrator(activity) ?: return
        if (!vibrator.hasVibrator()) return
        val effect = if (vibrator.hasAmplitudeControl()) {
            VibrationEffect.createWaveform(timings, amplitudes, -1)
        } else {
            VibrationEffect.createWaveform(timings, -1)
        }
        vibrateEffect(activity, effect)
    }

    private fun vibrateEffect(activity: Activity, effect: VibrationEffect) {
        val vibrator = vibrator(activity) ?: return
        if (!vibrator.hasVibrator()) return
        if (Build.VERSION.SDK_INT >= 33) {
            val attrs = VibrationAttributes.Builder()
                .setUsage(VibrationAttributes.USAGE_TOUCH)
                .build()
            vibrator.vibrate(effect, attrs)
        } else {
            vibrator.vibrate(effect)
        }
    }

    private fun vibrator(context: Context): Vibrator? =
        if (Build.VERSION.SDK_INT >= 31) {
            context.getSystemService(VibratorManager::class.java)?.defaultVibrator
        } else {
            @Suppress("DEPRECATION")
            context.getSystemService(Context.VIBRATOR_SERVICE) as? Vibrator
        }
}
