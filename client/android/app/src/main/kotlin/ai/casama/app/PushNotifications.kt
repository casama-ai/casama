package ai.casama.app

import android.app.Activity
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel

/**
 * Notification channels, approval pushes with Approve / Deny, and the `casama/notifications`
 * method channel (D-325).
 *
 * The server names a channel on every push (`android.notification.channel_id`); Android puts a
 * push for a channel the app never created in the default one, so old apps keep working.
 */
object PushNotifications {
    const val REPLIES = "replies"
    const val NEEDS_YOU = "needs_you"
    const val ROUTINES = "routines"
    const val SUGGESTIONS = SuggestionPushReceiver.CHANNEL
    const val ACCOUNT = "account"

    const val EXTRA_ACTION = "casama_action"
    const val EXTRA_APPROVAL = "casama_approval_id"
    const val EXTRA_RISK = "casama_risk"
    const val EXTRA_NOTIFICATION_UUID = "casama_notification_uuid"

    /** Creates the channels once; names show in the system's notification settings. */
    fun ensureChannels(context: Context) {
        val manager = context.getSystemService(NotificationManager::class.java) ?: return
        fun channel(id: String, nameId: Int, importance: Int, aboutId: Int) {
            val name = context.getString(nameId)
            val about = context.getString(aboutId)
            val old = manager.getNotificationChannel(id)
            // Creating it again renames it (after a language change) and keeps the person's settings.
            if (old != null && old.name == name && old.description == about) return
            manager.createNotificationChannel(NotificationChannel(id, name, importance).apply { description = about })
        }
        channel(
            REPLIES, R.string.notif_channel_replies, NotificationManager.IMPORTANCE_HIGH,
            R.string.notif_channel_replies_description,
        )
        channel(
            NEEDS_YOU, R.string.notif_channel_needs_you, NotificationManager.IMPORTANCE_HIGH,
            R.string.notif_channel_needs_you_description,
        )
        channel(
            ROUTINES, R.string.notif_channel_routines, NotificationManager.IMPORTANCE_DEFAULT,
            R.string.notif_channel_routines_description,
        )
        channel(
            SUGGESTIONS, R.string.notif_channel_suggestions, NotificationManager.IMPORTANCE_HIGH,
            R.string.notif_channel_suggestions_description,
        )
        channel(
            ACCOUNT, R.string.notif_channel_account, NotificationManager.IMPORTANCE_LOW,
            R.string.notif_channel_account_description,
        )
    }

    /**
     * Draws a data-only approval push (apps with devices.push_version 2): Approve and Deny, or
     * only Review for a high-risk approval. Approve asks for the phone to be unlocked.
     */
    fun drawApproval(context: Context, extras: Bundle): Boolean {
        val approvalId = extras.getString("approval_id") ?: return false
        val title = extras.getString("title") ?: return false
        val body = extras.getString("body") ?: ""
        val risk = extras.getString("risk") ?: ""
        val notificationUuid = extras.getString("notification_id") ?: ""
        // With the app on screen, its own banner shows the approval (as Firebase skips its pushes).
        if (foreground) return false
        val id = approvalId.hashCode()
        ensureChannels(context)
        val manager = context.getSystemService(NotificationManager::class.java) ?: return false
        val flags = PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        fun act(action: String, request: Int) = PendingIntent.getActivity(
            context,
            request,
            Intent(context, SuggestionActionActivity::class.java)
                .putExtra(SuggestionPushReceiver.EXTRA_NOTIFICATION, id)
                .putExtra(EXTRA_ACTION, action)
                .putExtra(EXTRA_APPROVAL, approvalId)
                .putExtra(EXTRA_RISK, risk)
                .putExtra(EXTRA_NOTIFICATION_UUID, notificationUuid)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            flags,
        )
        fun button(label: String, intent: PendingIntent, unlock: Boolean): Notification.Action {
            val b = Notification.Action.Builder(null, label, intent)
            if (unlock && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) b.setAuthenticationRequired(true)
            return b.build()
        }
        val builder = Notification.Builder(context, extras.getString("channel") ?: NEEDS_YOU)
            .setSmallIcon(R.drawable.ic_notification)
            .setContentTitle(title)
            .setContentText(body)
            .setStyle(Notification.BigTextStyle().bigText(body))
            .setCategory(Notification.CATEGORY_REMINDER)
            .setAutoCancel(true)
            .setContentIntent(act("open", id))
        if (risk == "high") {
            builder.addAction(button(context.getString(R.string.notif_review), act("open", id + 3), unlock = false))
        } else {
            builder.addAction(button(context.getString(R.string.notif_approve), act("approve", id + 1), unlock = true))
            builder.addAction(button(context.getString(R.string.notif_deny), act("deny", id + 2), unlock = true))
        }
        return try {
            manager.notify(id, builder.build())
            true
        } catch (_: SecurityException) {
            // Notifications are off for the app; the inbox still has it.
            false
        }
    }

    /** Whether the app's activity is on screen (set by MainActivity). */
    @Volatile var foreground = false

    // --- the method channel ----------------------------------------------------------------

    private var channel: MethodChannel? = null
    private var pending: Map<String, String>? = null

    fun attach(channel: MethodChannel, context: Context) {
        this.channel = channel
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "clear" -> {
                    // A reply drawn by Firebase carries its tag with id 0.
                    val tag = call.argument<String>("tag")
                    if (tag != null) context.getSystemService(NotificationManager::class.java)?.cancel(tag, 0)
                    result.success(null)
                }
                "takeAction" -> {
                    result.success(pending)
                    pending = null
                }
                "badge" -> result.success(null) // Launchers count notifications on screen.
                else -> result.notImplemented()
            }
        }
    }

    fun detach() {
        channel = null
    }

    /** An Approve, Deny or open tapped on an approval notification: to Dart now, or when it asks. */
    fun deliver(intent: Intent?) {
        val action = intent?.getStringExtra(EXTRA_ACTION) ?: return
        val approval = intent.getStringExtra(EXTRA_APPROVAL) ?: return
        intent.removeExtra(EXTRA_ACTION)
        val data = mapOf(
            "action" to action,
            "approval_id" to approval,
            "risk" to (intent.getStringExtra(EXTRA_RISK) ?: ""),
            "notification_id" to (intent.getStringExtra(EXTRA_NOTIFICATION_UUID) ?: ""),
            "link" to "/approvals/$approval",
        )
        val c = channel
        if (c == null) pending = data else c.invokeMethod("action", data)
    }
}

/** Starts the app with an approval button's extras, which [PushNotifications.deliver] passes on. */
fun Activity.openWithApprovalAction(source: Intent) {
    startActivity(
        Intent(this, MainActivity::class.java)
            .putExtras(source)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP),
    )
}
