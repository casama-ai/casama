import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../core/dev_server.dart';
import '../core/providers.dart';
import '../core/selfhost_api.dart';
import '../core/widgets.dart';
import '../theme/app_colors.dart';
import '../theme/app_tokens.dart';

/// The account (email) and server a screen acts for: "Signing in as you@example.com · Casama
/// Cloud". For screens where the wrong account is easy to mix up, such as the two-step code (which
/// authenticator entry?), a new password, letting an AI app in, or the lock screen, by people
/// with several accounts or both a self-hosted server and Cloud.
class SignedInAs extends ConsumerWidget {
  const SignedInAs({super.key, this.label});

  /// A line over the account, such as "Signing in as". None: just the account and server.
  final String? label;

  /// The server's name for people: "Casama Cloud", otherwise its host.
  static String serverName(BuildContext context, String apiUrl) =>
      isCasamaCloud(apiUrl) ? context.l10n.casamaCloudName : serverHost(apiUrl);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = context.colorScheme;
    final backend = ref.watch(backendProvider);
    final email = backend.userEmail;
    final server = serverName(context, backend.apiUrl);
    final muted = context.textTheme.bodySmall?.copyWith(
      color: scheme.onSurfaceVariant,
    );
    Widget line(IconData icon, String text, Key key, TextStyle? style) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: scheme.onSurfaceVariant),
        const SizedBox(width: AppSpace.xs),
        Flexible(
          child: Text(
            text,
            key: key,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ),
      ],
    );
    return Center(
      child: Semantics(
        container: true,
        child: Container(
          key: const Key('signedInAs'),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.md,
            vertical: AppSpace.sm,
          ),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: AppRadius.rowAll,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              if (label != null) Text(label!, style: muted),
              if (email != null && email.isNotEmpty)
                line(
                  LucideIcons.user,
                  email,
                  const Key('signedInAsEmail'),
                  context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              line(
                LucideIcons.server,
                server,
                const Key('signedInAsServer'),
                muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
