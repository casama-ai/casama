import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../ui/bot_avatar.dart';
import '../../ui/bot_cursor.dart';

/// The bots' cursors on their computers' screens (docs/BOT-CURSOR-PLAN.md): one per computer, fed
/// from the reply the app is already following, read by every surface that shows that screen (the
/// chat's card, the call's tile, the live view, the Computer screen).
///
/// A cursor only ever comes from a reply's own steps, so a screen another reply is using shows a
/// picture with no cursor, never somebody else's.
final botCursorsProvider = Provider<BotCursors>((ref) {
  final cursors = BotCursors();
  ref.onDispose(cursors.dispose);
  return cursors;
});

/// The cursor of [computerId]'s screen, in its bot's colour. Goes in a [Stack] over the picture.
class ScreenCursor extends ConsumerWidget {
  const ScreenCursor({
    super.key,
    required this.computerId,
    required this.fit,
    this.botId,
    this.ownerBot = false,
    this.size = BotCursorSize.small,
    this.named = false,
    this.visible = true,
  });

  final String computerId;
  final BotCursorFit fit;

  /// The bot working on the screen, when the surface knows it.
  final String? botId;

  /// With no [botId], use the bot the computer belongs to (a team computer has none).
  final bool ownerBot;
  final BotCursorSize size;

  /// Shows the bot's name beside the arrow (the big surfaces).
  final bool named;
  final bool visible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var id = botId;
    if (id == null && ownerBot) {
      id = (ref.watch(computersProvider).value ?? const <Computer>[])
          .where((c) => c.id == computerId)
          .firstOrNull
          ?.ownerBotId;
    }
    final bot = id == null ? null : ref.watch(botProvider(id));
    return BotCursor(
      controller: ref.watch(botCursorsProvider).of(computerId),
      fit: fit,
      size: size,
      color: bot == null ? null : botColors(bot.name, bot.avatarUrl).first,
      label: named ? bot?.name : null,
      visible: visible,
    );
  }
}

class BotCursors {
  final _byComputer = <String, BotCursorController>{};

  /// The computer each reply's cursor last showed on, for steps that say nothing about where.
  final _runComputer = <String, String>{};

  /// Steps that type where the cursor already is.
  static const _typingTools = {
    'browser.type',
    'browser.press',
    'desktop.type',
    'desktop.press',
  };

  /// The cursor of [computerId]'s screen. Lives as long as the app.
  BotCursorController of(String computerId) =>
      _byComputer.putIfAbsent(computerId, BotCursorController.new);

  /// One event of a reply the app is following.
  void onRunEvent(RunEventItem e) {
    switch (e) {
      case ScreenPointerItem(:final event):
        final p = event.payload;
        final w = p.width.toDouble(), h = p.height.toDouble();
        if (!(w > 0) || !(h > 0)) return;
        _runComputer[e.runId] = p.computerId;
        of(p.computerId).pointTo(
          Offset(p.x.toDouble(), p.y.toDouble()),
          of: Size(w, h),
          // An action this app doesn't know yet still moves the cursor there.
          act: switch (p.action) {
            'click' => BotCursorAct.click,
            'type' => BotCursorAct.typing,
            _ => BotCursorAct.rest,
          },
          callId: p.callId,
        );
      case ToolStartedItem(:final event):
        final tool = event.payload.tool;
        final scroll = tool == 'browser.scroll';
        if (!scroll && !_typingTools.contains(tool)) return;
        final args = event.payload.argsRedacted;
        // Only the bot's own computer has a cursor: not the person's Chrome, phone or Mac.
        final where = args['where'];
        if (where != null && where != 'computer' && where != 'bot_computer') {
          return;
        }
        final cursor = _cursorOf(e.runId);
        if (cursor == null) return;
        if (scroll) {
          cursor.scroll(down: args['direction'] != 'up');
        } else {
          cursor.typing(callId: event.payload.callId);
        }
      case ToolCompletedItem(:final event):
        _cursorOf(e.runId)?.settle(event.payload.callId);
      case ToolFailedItem(:final event):
        _cursorOf(e.runId)?.settle(event.payload.callId);
      // The bot stopped driving: the reply ended, or it asked the person to take the screen.
      case RunCompletedItem() || RunFailedItem() || RunCancelledItem():
        _cursorOf(e.runId)?.leave();
        _runComputer.remove(e.runId);
      case TakeoverRequestedItem():
        _cursorOf(e.runId)?.leave();
      default:
        return;
    }
  }

  BotCursorController? _cursorOf(String runId) {
    final id = _runComputer[runId];
    return id == null ? null : _byComputer[id];
  }

  void dispose() {
    for (final c in _byComputer.values) {
      c.dispose();
    }
    _byComputer.clear();
    _runComputer.clear();
  }
}
