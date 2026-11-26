import 'package:casama_sdk/casama_sdk.dart' show OrgRole;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/distribution.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart' show casamaCloudApi, isCasamaCloud;
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/page.dart';
import '../selfhost/guided_setup.dart';
import '../selfhost/local_server.dart';
import '../selfhost/server_license.dart' show cloudSession;
import 'move_api.dart';
import 'move_flow.dart';
import 'moved_screen.dart';

/// Settings › Move to Casama Cloud / Move to My Own Server (docs/SELFHOST-CLOUD-MODELS-PLAN.md
/// §4.4, §4.5, §7.5): where the workspace goes, then the check, the move and what's left after.
/// A move under way or finished shows its progress or where it went instead.
class MoveScreen extends ConsumerStatefulWidget {
  const MoveScreen({super.key});

  @override
  ConsumerState<MoveScreen> createState() => _MoveScreenState();
}

class _MoveScreenState extends ConsumerState<MoveScreen> {
  var _busy = false;

  Future<void> _toCloud(String orgId, String orgName) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final session = await cloudSession(context, ref);
      if (session == null || !mounted) return;
      final api = ref.read(moveApiProvider);
      final places = await runGuarded(
        context,
        () => api.cloudWorkspaces(session.accessToken),
      );
      if (places == null || !mounted) return;
      final choice = await showAdaptiveSheet<CloudWorkspace?>(
        context: context,
        builder: (_) => CloudPlaceSheet(places: places, newName: orgName),
      );
      if (choice == null || !mounted) return;
      final code = await runGuarded(context, () async {
        final place = choice.id.isEmpty
            ? await api.newCloudWorkspace(
                cloudToken: session.accessToken,
                name: orgName,
              )
            : choice;
        return api.receiveOnCloud(
          cloudToken: session.accessToken,
          orgId: place.id,
        );
      });
      if (code == null || !mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => MoveCheckScreen(
            orgId: orgId,
            target: MoveTarget(url: code.serverUrl, code: code.code),
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final org = ref.watch(currentOrgProvider);
    final backend = ref.watch(backendProvider);
    final onCloud = isCasamaCloud(backend.apiUrl);
    if (org == null) {
      return SubPage(title: l10n.wsMoveTitle, children: const []);
    }
    final move = ref.watch(workspaceMoveProvider(org.id));
    final current = move.value;
    // A move under way: its progress (it carries on without the app). A finished one: where it went.
    if (current != null && current.running) {
      return MoveProgressScreen(orgId: org.id);
    }
    // Finished: its checklist when the person watched it finish, else where it went.
    if (current?.movedTo != null) {
      return movesWatched.value.contains(org.id)
          ? MoveProgressScreen(orgId: org.id)
          : MovedScreen(movedTo: current!.movedTo!);
    }
    final owner = org.role == OrgRole.owner;
    final admin = org.role != OrgRole.member;
    final install = !onCloud && localServerSupported && !isMacAppStoreBuild;
    return SubPage(
      title: l10n.wsMoveTitle,
      subtitle: l10n.wsMoveIntro,
      children: [
        if (!owner)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpace.md),
            child: Text(
              l10n.wsMoveOwnerOnly,
              key: const Key('moveOwnerOnly'),
              style: context.textTheme.bodyMedium,
            ),
          ),
        GroupedCard(
          children: [
            if (!onCloud)
              GroupedTile(
                key: const Key('moveToCloud'),
                icon: LucideIcons.cloud,
                title: l10n.wsMoveCloudOption,
                subtitle: l10n.wsMoveCloudOptionHelp,
                trailing: _busy
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
                onTap: owner && !_busy
                    ? () => _toCloud(org.id, org.name)
                    : null,
              ),
            GroupedTile(
              key: const Key('moveToServer'),
              icon: LucideIcons.server,
              title: l10n.wsMoveServerOption,
              subtitle: l10n.wsMoveServerOptionHelp,
              onTap: owner
                  ? () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => MoveServerScreen(orgId: org.id),
                      ),
                    )
                  : null,
            ),
            // Installing a server needs Docker and a desktop build from the website (not the stores).
            if (install)
              GroupedTile(
                key: const Key('moveInstallServer'),
                icon: LucideIcons.download,
                title: l10n.wsMoveInstallServer,
                subtitle: l10n.wsMoveInstallServerHelp,
                onTap: () async {
                  await GuidedSetup.begin();
                  if (context.mounted) context.go('/setup');
                },
              ),
          ],
        ),
        const SizedBox(height: AppSpace.lg),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('moveReceive'),
              icon: LucideIcons.inbox,
              title: l10n.wsMoveReceiveOption,
              subtitle: l10n.wsMoveReceiveOptionHelp,
              onTap: admin
                  ? () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) =>
                            MoveReceiveScreen(orgId: org.id, orgName: org.name),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}

/// Which Casama Cloud workspace the move goes into: a new one (named like this one), or alongside
/// what's in one the person already has. Pops a [CloudWorkspace] whose id is empty for "new".
class CloudPlaceSheet extends StatelessWidget {
  const CloudPlaceSheet({
    super.key,
    required this.places,
    required this.newName,
  });
  final List<CloudWorkspace> places;
  final String newName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpace.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.wsMoveCloudPickTitle,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpace.md),
            GroupedCard(
              children: [
                GroupedTile(
                  key: const Key('moveCloudNew'),
                  icon: LucideIcons.plus,
                  title: l10n.wsMoveCloudNew,
                  subtitle: l10n.wsMoveCloudNewHelp(newName),
                  onTap: () => Navigator.pop(
                    context,
                    CloudWorkspace(id: '', name: newName),
                  ),
                ),
                for (final p in places)
                  GroupedTile(
                    key: Key('moveCloudPlace-${p.id}'),
                    icon: LucideIcons.building2,
                    title: p.name,
                    subtitle: l10n.wsMoveCloudExistingHelp,
                    onTap: () => Navigator.pop(context, p),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Move to my own server: its address and the move code it showed.
class MoveServerScreen extends StatefulWidget {
  const MoveServerScreen({super.key, required this.orgId});
  final String orgId;

  @override
  State<MoveServerScreen> createState() => _MoveServerScreenState();
}

class _MoveServerScreenState extends State<MoveServerScreen> {
  final _address = TextEditingController();
  final _code = TextEditingController();

  @override
  void dispose() {
    _address.dispose();
    _code.dispose();
    super.dispose();
  }

  String get _url {
    final a = _address.text.trim();
    return a.startsWith('http://') || a.startsWith('https://')
        ? a
        : 'https://$a';
  }

  bool get _ready =>
      _address.text.trim().contains('.') || _address.text.trim().contains(':')
      ? _code.text.trim().length >= 20
      : false;

  void _check() {
    if (!_ready) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => MoveCheckScreen(
          orgId: widget.orgId,
          target: MoveTarget(url: _url, code: _code.text.trim()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SubPage(
      title: l10n.wsMoveServerTitle,
      subtitle: l10n.wsMoveServerOptionHelp,
      children: [
        TextField(
          key: const Key('moveServerAddress'),
          controller: _address,
          autofocus: true,
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            labelText: l10n.wsMoveServerAddress,
            hintText: 'https://casama.example.com',
          ),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: AppSpace.md),
        TextField(
          key: const Key('moveServerCode'),
          controller: _code,
          decoration: InputDecoration(labelText: l10n.wsMoveServerCode),
          onChanged: (_) => setState(() {}),
          onSubmitted: (_) => _check(),
        ),
        const SizedBox(height: AppSpace.lg),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            key: const Key('moveServerCheck'),
            onPressed: _ready ? _check : null,
            child: Text(l10n.wsMoveCheckButton),
          ),
        ),
      ],
    );
  }
}

/// Bring a workspace here: a one-time code for this workspace, to type on the other server.
class MoveReceiveScreen extends ConsumerStatefulWidget {
  const MoveReceiveScreen({
    super.key,
    required this.orgId,
    required this.orgName,
  });
  final String orgId;
  final String orgName;

  @override
  ConsumerState<MoveReceiveScreen> createState() => _MoveReceiveScreenState();
}

class _MoveReceiveScreenState extends ConsumerState<MoveReceiveScreen> {
  late final Future<MoveCode> _code = ref
      .read(moveApiProvider)
      .receiveHere(widget.orgId);

  void _copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
    showToast(context, context.l10n.wsMoveCopied, kind: ToastKind.success);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SubPage(
      title: l10n.wsMoveReceiveTitle,
      body: FutureBuilder<MoveCode>(
        future: _code,
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpace.lg),
                child: Text(errorText(context, snap.error!)),
              ),
            );
          }
          final code = snap.data;
          if (code == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return PageColumn(
            children: [
              Text(
                l10n.wsMoveReceiveBody(
                  code.expiresAt.formattedExact(context),
                  widget.orgName,
                ),
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpace.lg),
              _CopyRow(
                key: const Key('moveReceiveAddress'),
                label: l10n.wsMoveReceiveAddress,
                value: code.serverUrl,
                onCopy: _copy,
              ),
              const SizedBox(height: AppSpace.md),
              _CopyRow(
                key: const Key('moveReceiveCode'),
                label: l10n.wsMoveReceiveCode,
                value: code.code,
                onCopy: _copy,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CopyRow extends StatelessWidget {
  const _CopyRow({
    super.key,
    required this.label,
    required this.value,
    required this.onCopy,
  });
  final String label;
  final String value;
  final void Function(String) onCopy;

  @override
  Widget build(BuildContext context) => AppCard(
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: context.textTheme.labelMedium),
              const SizedBox(height: AppSpace.xs),
              SelectableText(
                value,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: context.l10n.wsMoveCopy,
          icon: const Icon(LucideIcons.copy),
          onPressed: () => onCopy(value),
        ),
      ],
    ),
  );
}

/// Casama Cloud's own address, for the check screen's "To Casama Cloud".
bool isCloudTarget(String url) =>
    Uri.tryParse(url)?.host == Uri.parse(casamaCloudApi).host;
