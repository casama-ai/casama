import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/remote_config.dart';
import '../../core/widgets.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_json_editor.dart';

/// Admin → Services → App settings (D-241): the remote settings every installed app reads, edited
/// as JSON. The server checks them and says what's wrong; the shape is in the self-hosting docs.
class AppSettingsCard extends ConsumerWidget {
  const AppSettingsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return GroupedCard(
      children: [
        GroupedTile(
          key: const Key('adminAppSettings'),
          icon: LucideIcons.slidersHorizontal,
          title: l10n.adminAppSettings,
          subtitle: l10n.adminAppSettingsHelp,
          onTap: () => adminOpenJsonSheet(
            context,
            builder: (_) => const _AppSettingsSheet(),
          ),
        ),
        // The welcome emails' and gallery digest's words (D-372).
        GroupedTile(
          key: const Key('adminEmailCopy'),
          icon: LucideIcons.mail,
          title: l10n.adminEmailCopy,
          subtitle: l10n.adminEmailCopyHelp,
          onTap: () => adminOpenJsonSheet(
            context,
            builder: (_) => const _EmailCopySheet(),
          ),
        ),
      ],
    );
  }
}

/// The words of the welcome emails and gallery digest as JSON. Empty settings open on the text in
/// code, so there's something to edit; the server checks what's saved and says what's wrong.
class _EmailCopySheet extends ConsumerStatefulWidget {
  const _EmailCopySheet();

  @override
  ConsumerState<_EmailCopySheet> createState() => _EmailCopySheetState();
}

class _EmailCopySheetState extends ConsumerState<_EmailCopySheet> {
  final _json = TextEditingController();
  var _loaded = false;
  var _busy = false;
  var _valid = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _json.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final got = await runGuarded(context, () => ref.read(backendProvider).adminEmailCopy());
    if (!mounted) return;
    setState(() {
      _loaded = true;
      if (got != null) {
        _json.text = const JsonEncoder.withIndent('  ').convert(got.copy.isEmpty ? got.defaults : got.copy);
      }
    });
  }

  Future<void> _save() async {
    final problem = adminJsonProblem(context, _json.text);
    if (problem != null) {
      // Shown under the field; Save stays on, so a fix can be saved straight away.
      setState(() => _error = problem);
      return;
    }
    final copy = jsonDecode(_json.text) as Map<String, dynamic>;
    setState(() {
      _busy = true;
      _error = null;
    });
    final saved = await runGuarded(context, () => ref.read(backendProvider).setAdminEmailCopy(copy));
    if (!mounted) return;
    setState(() => _busy = false);
    if (saved == null) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.mail,
      title: l10n.adminEmailCopy,
      subtitle: l10n.adminEmailCopyHelp,
      submitLabel: l10n.save,
      submitKey: const Key('adminEmailCopySave'),
      busy: _busy,
      onSubmit: !_loaded || _busy || !_valid ? null : _save,
      children: [
        AdminJsonEditor(
          fieldKey: const Key('adminEmailCopyJson'),
          controller: _json,
          enabled: _loaded,
          error: _error,
          onValidChanged: (valid) => setState(() {
            _valid = valid;
            _error = null;
          }),
        ),
      ],
    );
  }
}

class _AppSettingsSheet extends ConsumerStatefulWidget {
  const _AppSettingsSheet();

  @override
  ConsumerState<_AppSettingsSheet> createState() => _AppSettingsSheetState();
}

class _AppSettingsSheetState extends ConsumerState<_AppSettingsSheet> {
  final _json = TextEditingController();
  var _loaded = false;
  var _busy = false;
  var _valid = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _json.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final config = await runGuarded(
      context,
      () => ref.read(backendProvider).adminAppConfig(),
    );
    if (!mounted) return;
    setState(() {
      _loaded = true;
      if (config != null) {
        _json.text = const JsonEncoder.withIndent('  ').convert(config.toJson());
      }
    });
  }

  Future<void> _save() async {
    final problem = adminJsonProblem(context, _json.text);
    if (problem != null) {
      // Shown under the field; Save stays on, so a fix can be saved straight away.
      setState(() => _error = problem);
      return;
    }
    final parsed = jsonDecode(_json.text) as Map<String, dynamic>;
    setState(() {
      _busy = true;
      _error = null;
    });
    final saved = await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .setAdminAppConfig(parsed),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (saved == null) return;
    // This app follows at once; others within half an hour or when they come back to the front.
    await ref.read(remoteConfigProvider.notifier).refresh();
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.slidersHorizontal,
      title: l10n.adminAppSettings,
      subtitle: l10n.adminAppSettingsHelp,
      submitLabel: l10n.save,
      submitKey: const Key('adminAppSettingsSave'),
      busy: _busy,
      onSubmit: !_loaded || _busy || !_valid ? null : _save,
      children: [
        AdminJsonEditor(
          fieldKey: const Key('adminAppSettingsJson'),
          controller: _json,
          enabled: _loaded,
          error: _error,
          onValidChanged: (valid) => setState(() {
            _valid = valid;
            _error = null;
          }),
        ),
      ],
    );
  }
}
