import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../ui/action_buttons.dart';
import '../../ui/glow_button.dart';
import '../chat/chat_controller.dart';
import '../chat/widgets/chat_look.dart';
import 'app_browser_socket.dart';

/// How a finished run's reply ended, read from its chat: failed or not, and the start of its last
/// reply (shown on the card, never sent anywhere).
typedef AppBrowserDoneOutcome = ({bool failed, String? preview});

/// Reads [run]'s ending from [chat]: the entries after the person's last message. Nothing to say
/// when the chat on hand isn't the run's.
AppBrowserDoneOutcome appBrowserDoneOutcome(ChatState chat, AppBrowserRun run) {
  if (chat.conversationId != run.conversationId) {
    return (failed: false, preview: null);
  }
  final entries = chat.entries;
  var start = 0;
  for (var i = entries.length - 1; i >= 0; i--) {
    final e = entries[i];
    if (e is MessageEntry && e.role == 'user') {
      start = i + 1;
      break;
    }
  }
  var failed = false;
  String? reply;
  for (final e in entries.skip(start)) {
    if (e is NoticeEntry && e.kind == NoticeKind.failed) failed = true;
    if (e is MessageEntry && e.role != 'user' && e.text.trim().isNotEmpty) {
      reply = e.text;
    }
  }
  return (failed: failed, preview: reply == null ? null : plainPreview(reply));
}

/// A reply's Markdown as one short line of plain words for a preview.
String? plainPreview(String markdown) {
  var t = markdown
      // Links and images keep their words.
      .replaceAllMapped(RegExp(r'!?\[([^\]]*)\]\([^)]*\)'), (m) => m[1] ?? '')
      .replaceAll(RegExp(r'```[\s\S]*?```'), ' ')
      .replaceAll(
        RegExp(r'^\s{0,3}(#{1,6}|>|[-*+]|\d+\.)\s+', multiLine: true),
        '',
      )
      .replaceAll(RegExp(r'[*_`~]+'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
  if (t.isEmpty) return null;
  if (t.length > 280) t = '${t.substring(0, 280).trimRight()}…';
  return t;
}

/// The full view's card when the bot finishes with the page: who finished, the start of its
/// answer, Back to Chat (where the answer is) and Stay Here (the page stays to look around).
class AppBrowserDoneCard extends StatelessWidget {
  const AppBrowserDoneCard({
    super.key,
    required this.botName,
    required this.outcome,
    required this.onBackToChat,
    required this.onStay,
  });

  final String botName;
  final AppBrowserDoneOutcome outcome;
  final VoidCallback onBackToChat;
  final VoidCallback onStay;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final colors = context.appColors;
    final failed = outcome.failed;
    final tint = failed ? colors.negative : colors.positive;
    final preview = outcome.preview;
    return Semantics(
      container: true,
      liveRegion: true,
      child: Container(
        key: const Key('appBrowserDone'),
        padding: ChatLook.cardPadding,
        decoration: ChatLook.card(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: tint.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    failed ? LucideIcons.circleAlert : LucideIcons.check,
                    size: 17,
                    color: tint,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    failed
                        ? l10n.appBrowserDoneFailed(botName)
                        : l10n.appBrowserDone(botName),
                    key: const Key('appBrowserDoneTitle'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              preview ?? l10n.appBrowserDoneHint,
              key: const Key('appBrowserDonePreview'),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            ActionButtons(
              actions: [
                OutlinedButton(
                  key: const Key('appBrowserDoneStay'),
                  onPressed: onStay,
                  child: Text(l10n.appBrowserStayHere),
                ),
                GlowButton.icon(
                  key: const Key('appBrowserDoneBack'),
                  onPressed: onBackToChat,
                  icon: const Icon(LucideIcons.messageCircle, size: 18),
                  label: Text(l10n.appBrowserBackToChat),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
