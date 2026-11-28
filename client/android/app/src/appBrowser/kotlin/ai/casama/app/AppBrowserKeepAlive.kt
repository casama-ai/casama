package ai.casama.app

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ServiceInfo
import android.os.BatteryManager
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat

/**
 * Keeps the Android app process alive while a bot finishes a user-started browser task after the
 * person leaves the app (docs/PHONE-BROWSER-BACKGROUND-PLAN.md §5–§7).
 *
 * - Foreground service type `specialUse` (no wake locks, no polling).
 * - Quiet ongoing notification on channel "Browser tasks" (IMPORTANCE_LOW, silent, no badge) with
 *   Open and Stop actions.
 * - Native backstops: 10-minute hard cap, Battery Saver, and battery < 15% while not charging.
 */
class AppBrowserKeepAlive : Service() {
    data class State(
        val runId: String,
        val bot: String,
        val site: String,
        var step: String,
        val link: String,
        val openLabel: String,
        val stopLabel: String,
        val channelLabel: String,
        val pausedBatteryTitle: String,
        val pausedBatteryBody: String,
        val pausedCapTitle: String,
        val pausedCapBody: String,
    )

    private val main = Handler(Looper.getMainLooper())
    private var capRunnable: Runnable? = null
    private var receiverRegistered = false

    private val powerReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            when (intent.action) {
                PowerManager.ACTION_POWER_SAVE_MODE_CHANGED -> {
                    if (isPowerSaveMode(context)) {
                        stopWithReason("battery_saver")
                    }
                }
                Intent.ACTION_BATTERY_CHANGED -> {
                    val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
                    val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, 100).coerceAtLeast(1)
                    val pct = if (level >= 0) (level * 100) / scale else -1
                    val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                    val charging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                        status == BatteryManager.BATTERY_STATUS_FULL
                    if (pct in 0 until LOW_BATTERY_PCT && !charging) {
                        stopWithReason("low_battery")
                    }
                }
            }
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_STOP_USER -> {
                val s = state
                state = null
                running = false
                cancelBackstops()
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
                if (s != null) {
                    AppBrowserBridge.notifyBackgroundStopped("user_stop")
                }
                return START_NOT_STICKY
            }
            ACTION_UPDATE -> {
                val s = state ?: run {
                    stopSelf()
                    return START_NOT_STICKY
                }
                val nm = getSystemService(NotificationManager::class.java)
                nm?.notify(NOTIFICATION_ID, buildOngoing(this, s))
                return START_NOT_STICKY
            }
            ACTION_START -> {
                val s = state ?: run {
                    stopSelf()
                    return START_NOT_STICKY
                }
                val notification = buildOngoing(this, s)
                try {
                    if (Build.VERSION.SDK_INT >= 34) {
                        startForeground(
                            NOTIFICATION_ID,
                            notification,
                            ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE,
                        )
                    } else {
                        startForeground(NOTIFICATION_ID, notification)
                    }
                } catch (_: Throwable) {
                    state = null
                    running = false
                    stopSelf()
                    AppBrowserBridge.notifyBackgroundStopped("os_killed")
                    return START_NOT_STICKY
                }
                running = true
                armBackstops()
                return START_NOT_STICKY
            }
            else -> {
                stopSelf()
                return START_NOT_STICKY
            }
        }
    }

    private fun armBackstops() {
        cancelBackstops()
        val r = Runnable { stopWithReason("cap") }
        capRunnable = r
        main.postDelayed(r, MAX_BACKGROUND_MS)
        if (!receiverRegistered) {
            val filter = IntentFilter().apply {
                addAction(PowerManager.ACTION_POWER_SAVE_MODE_CHANGED)
                addAction(Intent.ACTION_BATTERY_CHANGED)
            }
            ContextCompat.registerReceiver(this, powerReceiver, filter, ContextCompat.RECEIVER_NOT_EXPORTED)
            receiverRegistered = true
        }
    }

    private fun cancelBackstops() {
        capRunnable?.let { main.removeCallbacks(it) }
        capRunnable = null
        if (receiverRegistered) {
            try {
                unregisterReceiver(powerReceiver)
            } catch (_: Throwable) {}
            receiverRegistered = false
        }
    }

    private fun stopWithReason(reason: String) {
        val s = state
        state = null
        running = false
        cancelBackstops()
        stopForeground(STOP_FOREGROUND_REMOVE)
        if (s != null) {
            val title = if (reason == "cap") s.pausedCapTitle else s.pausedBatteryTitle
            val body = if (reason == "cap") s.pausedCapBody else s.pausedBatteryBody
            showStatusNotification(
                this,
                title = title,
                body = body,
                link = s.link,
                tag = "browser-wait-${s.runId}",
                highPriority = false,
            )
            AppBrowserBridge.notifyBackgroundStopped(reason)
        }
        stopSelf()
    }

    override fun onDestroy() {
        cancelBackstops()
        running = false
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    companion object {
        const val CHANNEL_ID = "casama_browser_tasks"
        const val NOTIFICATION_ID = 3290
        const val STATUS_NOTIFICATION_ID = 3291
        const val REMINDER_NOTIFICATION_ID = 3292
        const val NEEDS_YOU_NOTIFICATION_ID = 3293
        const val ACTION_START = "ai.casama.app.app_browser.START"
        const val ACTION_UPDATE = "ai.casama.app.app_browser.UPDATE"
        const val ACTION_STOP_USER = "ai.casama.app.app_browser.STOP_USER"
        const val ACTION_OPEN = "ai.casama.app.app_browser.OPEN"
        const val EXTRA_LINK = "link"
        const val EXTRA_SOURCE = "source"
        const val MAX_BACKGROUND_MS = 10L * 60L * 1000L
        const val LOW_BATTERY_PCT = 15

        @Volatile
        var state: State? = null

        @Volatile
        var running: Boolean = false

        private val reminderHandler = Handler(Looper.getMainLooper())
        private var pendingReminder: Runnable? = null

        fun start(context: Context, newState: State): String? {
            batteryBlockReason(context)?.let { return it }
            state = newState
            return try {
                ContextCompat.startForegroundService(
                    context,
                    Intent(context, AppBrowserKeepAlive::class.java).setAction(ACTION_START),
                )
                null
            } catch (_: Throwable) {
                state = null
                "os_killed"
            }
        }

        fun updateStep(context: Context, step: String, site: String?) {
            val s = state ?: return
            val updated = s.copy(
                site = if (!site.isNullOrBlank()) site else s.site,
                step = step,
            )
            state = updated
            if (!running) return
            val nm = context.getSystemService(NotificationManager::class.java) ?: return
            nm.notify(NOTIFICATION_ID, buildOngoing(context, updated))
        }

        fun stop(context: Context) {
            state = null
            running = false
            context.stopService(Intent(context, AppBrowserKeepAlive::class.java))
        }

        fun batteryLevel(context: Context): Int {
            val bm = context.getSystemService(BatteryManager::class.java) ?: return -1
            val pct = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            return if (pct in 0..100) pct else -1
        }

        fun isPowerSaveMode(context: Context): Boolean {
            val pm = context.getSystemService(PowerManager::class.java) ?: return false
            return pm.isPowerSaveMode
        }

        fun isCharging(context: Context): Boolean {
            val intent = context.registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            val status = intent?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
            return status == BatteryManager.BATTERY_STATUS_CHARGING ||
                status == BatteryManager.BATTERY_STATUS_FULL
        }

        fun batteryBlockReason(context: Context): String? {
            if (isPowerSaveMode(context)) return "battery_saver"
            val pct = batteryLevel(context)
            if (pct in 0 until LOW_BATTERY_PCT && !isCharging(context)) return "low_battery"
            return null
        }

        fun notificationsEnabled(context: Context): Boolean =
            NotificationManagerCompat.from(context).areNotificationsEnabled()

        fun ensureChannel(context: Context, name: String) {
            val nm = context.getSystemService(NotificationManager::class.java) ?: return
            if (nm.getNotificationChannel(CHANNEL_ID) != null) return
            nm.createNotificationChannel(
                NotificationChannel(CHANNEL_ID, name, NotificationManager.IMPORTANCE_LOW).apply {
                    setSound(null, null)
                    enableVibration(false)
                    setShowBadge(false)
                },
            )
        }

        fun buildOngoing(context: Context, s: State): Notification {
            ensureChannel(context, s.channelLabel)
            val openIntent = PendingIntent.getActivity(
                context,
                3290,
                Intent(context, MainActivity::class.java)
                    .setAction(ACTION_OPEN)
                    .putExtra(EXTRA_LINK, s.link)
                    .putExtra(EXTRA_SOURCE, "notification")
                    .addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP),
                PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
            )
            val stopIntent = PendingIntent.getService(
                context,
                3291,
                Intent(context, AppBrowserKeepAlive::class.java).setAction(ACTION_STOP_USER),
                PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
            )
            val title = if (s.site.isNotBlank()) {
                "${s.bot} is using your browser · ${s.site}"
            } else {
                "${s.bot} is using your browser"
            }
            return NotificationCompat.Builder(context, CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_notification)
                .setContentTitle(title)
                .setContentText(s.step)
                .setOngoing(true)
                .setSilent(true)
                .setOnlyAlertOnce(true)
                .setShowWhen(false)
                .setContentIntent(openIntent)
                .addAction(0, s.openLabel, openIntent)
                .addAction(0, s.stopLabel, stopIntent)
                .setPriority(NotificationCompat.PRIORITY_LOW)
                .setCategory(NotificationCompat.CATEGORY_PROGRESS)
                .build()
        }

        fun showStatusNotification(
            context: Context,
            title: String,
            body: String,
            link: String,
            tag: String,
            highPriority: Boolean,
            source: String = "notification",
        ) {
            val channelId = if (highPriority) "needs_you" else CHANNEL_ID
            if (!highPriority) ensureChannel(context, "Browser tasks")
            val openIntent = PendingIntent.getActivity(
                context,
                tag.hashCode(),
                Intent(context, MainActivity::class.java)
                    .setAction(ACTION_OPEN)
                    .putExtra(EXTRA_LINK, link)
                    .putExtra(EXTRA_SOURCE, source)
                    .addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP),
                PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
            )
            val builder = NotificationCompat.Builder(context, channelId)
                .setSmallIcon(R.drawable.ic_notification)
                .setContentTitle(title)
                .setContentText(body)
                .setAutoCancel(true)
                .setContentIntent(openIntent)
                .setPriority(
                    if (highPriority) NotificationCompat.PRIORITY_HIGH
                    else NotificationCompat.PRIORITY_DEFAULT,
                )
            val nm = context.getSystemService(NotificationManager::class.java) ?: return
            nm.notify(tag, if (highPriority) NEEDS_YOU_NOTIFICATION_ID else STATUS_NOTIFICATION_ID, builder.build())
        }

        fun scheduleLocalReminder(
            context: Context,
            delayMs: Long,
            title: String,
            body: String,
            link: String,
            tag: String,
        ) {
            cancelLocalReminder(context, tag)
            val appCtx = context.applicationContext
            val r = Runnable {
                pendingReminder = null
                showStatusNotification(
                    appCtx,
                    title = title,
                    body = body,
                    link = link,
                    tag = tag,
                    highPriority = true,
                    source = "local",
                )
            }
            pendingReminder = r
            reminderHandler.postDelayed(r, delayMs.coerceAtLeast(0))
        }

        fun cancelLocalReminder(context: Context, tag: String?) {
            pendingReminder?.let { reminderHandler.removeCallbacks(it) }
            pendingReminder = null
            if (!tag.isNullOrBlank()) {
                val nm = context.getSystemService(NotificationManager::class.java)
                nm?.cancel(tag, NEEDS_YOU_NOTIFICATION_ID)
                nm?.cancel(tag, STATUS_NOTIFICATION_ID)
                nm?.cancel(tag, REMINDER_NOTIFICATION_ID)
            }
        }
    }
}
