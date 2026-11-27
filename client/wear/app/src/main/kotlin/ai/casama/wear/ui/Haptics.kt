package ai.casama.wear.ui

import ai.casama.wear.data.Settings
import android.content.Context
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager

/**
 * A tap on the wrist means something (§4 principle 8, §6.7): one pattern for "needs you", one for
 * "done", one for a problem, and a click when a hold completes. Plays with
 * [VibrationEffect.Composition] primitives where the watch supports them (docs/HAPTICS-PLAN.md
 * §5.9), keeping waveforms as the fallback, and respects the watch's own Haptics switch (§7.4).
 */
class Haptics(context: Context, private val settings: Settings? = null) {
    private val vibrator: Vibrator? =
        if (Build.VERSION.SDK_INT >= 31) context.getSystemService(VibratorManager::class.java)?.defaultVibrator
        else @Suppress("DEPRECATION") context.getSystemService(Vibrator::class.java)

    private val enabled: Boolean
        get() = settings?.switches?.value?.haptics ?: true

    /** Two even taps: someone is waiting. */
    fun needsYou() {
        if (!enabled) return
        if (compose(
                VibrationEffect.Composition.PRIMITIVE_CLICK to (0.8f to 0),
                VibrationEffect.Composition.PRIMITIVE_CLICK to (0.8f to 90),
            )
        ) return
        wave(longArrayOf(0, 70, 90, 70), intArrayOf(0, 200, 0, 200))
    }

    /** A short rising pair: it worked. */
    fun done() {
        if (!enabled) return
        if (compose(
                VibrationEffect.Composition.PRIMITIVE_TICK to (0.5f to 0),
                VibrationEffect.Composition.PRIMITIVE_CLICK to (1.0f to 60),
            )
        ) return
        wave(longArrayOf(0, 35, 60, 80), intArrayOf(0, 140, 0, 255))
    }

    /** One long, low buzz: it didn't. */
    fun problem() {
        if (!enabled) return
        wave(longArrayOf(0, 260), intArrayOf(0, 160))
    }

    /** A crisp click: the hold filled. */
    fun click() {
        if (!enabled) return
        if (compose(VibrationEffect.Composition.PRIMITIVE_CLICK to (0.8f to 0))) return
        val v = vibrator ?: return
        runCatching { v.vibrate(VibrationEffect.createPredefined(VibrationEffect.EFFECT_CLICK)) }
    }

    private fun compose(vararg steps: Pair<Int, Pair<Float, Int>>): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return false
        val v = vibrator ?: return false
        if (!v.hasVibrator()) return false
        return runCatching {
            val ids = IntArray(steps.size) { steps[it].first }
            if (!v.areAllPrimitivesSupported(*ids)) return false
            val comp = VibrationEffect.startComposition()
            for ((primitive, spec) in steps) {
                comp.addPrimitive(primitive, spec.first.coerceIn(0f, 1f), spec.second.coerceAtLeast(0))
            }
            v.vibrate(comp.compose())
            true
        }.getOrDefault(false)
    }

    private fun wave(timings: LongArray, amplitudes: IntArray) {
        val v = vibrator ?: return
        if (!v.hasVibrator()) return
        runCatching {
            val effect = if (v.hasAmplitudeControl()) VibrationEffect.createWaveform(timings, amplitudes, -1)
            else VibrationEffect.createWaveform(timings, -1)
            v.vibrate(effect)
        }
    }
}
