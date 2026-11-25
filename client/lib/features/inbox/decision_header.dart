import 'package:material_ui/material_ui.dart';

import '../../theme/app_tokens.dart';
import '../../ui/bot_avatar.dart';

/// The top of every Needs you card (approvals, takeovers, suggestions, skill ideas), so they read
/// alike: who is asking (the bot's avatar, with a badge for what kind of ask it is), what they
/// ask, and a line of details under it (when, how risky, when it runs out).
class DecisionHeader extends StatelessWidget {
  const DecisionHeader({
    super.key,
    required this.botName,
    required this.avatarUrl,
    required this.badge,
    required this.badgeColor,
    required this.title,
    this.details = const [],
  });

  final String botName;
  final String? avatarUrl;
  final IconData badge;
  final Color badgeColor;
  final String title;

  /// Pills and short texts, in order.
  final List<Widget> details;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            BotAvatar(
              name: botName.isEmpty ? '?' : botName,
              avatar: avatarUrl,
              size: 36,
            ),
            Positioned(
              right: -4,
              bottom: -4,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: scheme.surface, width: 2),
                ),
                child: Icon(badge, size: 10, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(width: AppSpace.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w700, height: 1.3),
              ),
              if (details.isNotEmpty) ...[
                const SizedBox(height: 4),
                Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: details,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
