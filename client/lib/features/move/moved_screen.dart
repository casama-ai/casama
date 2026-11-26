import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/link_browser.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart' show casamaCloudApi;
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import 'move_api.dart';
import 'move_switch.dart';

/// "This workspace moved" (docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.4.1): the old copy is read-only,
/// and this says where it went and opens it there.
class MovedScreen extends StatelessWidget {
  const MovedScreen({super.key, required this.movedTo, this.onViewOld});
  final MovedTo movedTo;

  /// Shown as "View the Old Copy" when set: the person may still read what's here.
  final VoidCallback? onViewOld;

  String get _host => Uri.tryParse(movedTo.url)?.host ?? movedTo.url;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.textTheme;
    return Material(
      color: context.colorScheme.surface,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    movedTo.cloud ? LucideIcons.cloud : LucideIcons.server,
                    size: 48,
                    color: context.colorScheme.primary,
                  ),
                  const SizedBox(height: AppSpace.md),
                  Text(
                    l10n.wsMovedTitle,
                    key: const Key('movedTitle'),
                    style: text.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpace.sm),
                  Text(
                    movedTo.cloud
                        ? l10n.wsMovedBodyCloud
                        : l10n.wsMovedBodyServer(_host),
                    style: text.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpace.lg),
                  FilledButton.icon(
                    key: const Key('movedOpen'),
                    icon: const Icon(LucideIcons.externalLink),
                    label: Text(
                      movedTo.cloud
                          ? l10n.wsMovedSignInCloud
                          : l10n.wsMovedOpenServer(_host),
                    ),
                    onPressed: () => openWebLink(
                      Uri.parse(
                        movedTo.cloud ? 'https://casama.ai/open' : movedTo.url,
                      ),
                    ),
                  ),
                  if (onViewOld != null) ...[
                    const SizedBox(height: AppSpace.sm),
                    TextButton(
                      key: const Key('movedViewOld'),
                      onPressed: onViewOld,
                      child: Text(l10n.wsMovedViewOld),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Workspaces whose move the person watched finish in this run of the app: they're looking at its
/// checklist (with "Open It There"), so the cover below stays away until the next launch.
final movesWatched = ValueNotifier<Set<String>>(const {});

/// Covers the app when the selected workspace moved away, until the person chooses to look at
/// the old copy (for this run of the app).
class MovedWorkspaceGate extends ConsumerStatefulWidget {
  const MovedWorkspaceGate({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<MovedWorkspaceGate> createState() => _MovedWorkspaceGateState();
}

class _MovedWorkspaceGateState extends ConsumerState<MovedWorkspaceGate> {
  final _viewingOld = <String>{};

  @override
  Widget build(BuildContext context) {
    if (!moveOn) return widget.child;
    final orgId = ref.watch(currentOrgIdProvider);
    if (orgId == null || _viewingOld.contains(orgId)) return widget.child;
    return ValueListenableBuilder<Set<String>>(
      valueListenable: movesWatched,
      builder: (context, watched, _) =>
          watched.contains(orgId) ? widget.child : _cover(orgId),
    );
  }

  Widget _cover(String orgId) {
    final moved = ref.watch(workspaceMoveProvider(orgId)).value?.movedTo;
    if (moved == null) return widget.child;
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: MovedScreen(
            movedTo: moved,
            onViewOld: () => setState(() => _viewingOld.add(orgId)),
          ),
        ),
      ],
    );
  }
}

/// Casama Cloud's address in the words ("Casama Cloud") or the server's host.
String moveServerName(BuildContext context, String url) =>
    Uri.tryParse(url)?.host == Uri.parse(casamaCloudApi).host
    ? 'Casama Cloud'
    : (Uri.tryParse(url)?.host ?? url);
