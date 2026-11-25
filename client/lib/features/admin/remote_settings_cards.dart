import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/backend.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_json_editor.dart';

export '../../core/backend.dart' show AdminJsonSettingKind;

/// Admin rows for the lists the owner edits as JSON without a release (D-373, D-374, D-426): the
/// model catalog, the cost tables, the browser guard's added sites and the call limits. Each opens one editor with the
/// saved value and, folded below it, the built-in values to copy from.
class AdminJsonSettingTile extends StatelessWidget {
  const AdminJsonSettingTile({super.key, required this.kind});
  final AdminJsonSettingKind kind;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (icon, title, help) = switch (kind) {
      AdminJsonSettingKind.modelCatalog => (
        LucideIcons.bookOpen,
        l10n.adminModelCatalog,
        l10n.adminModelCatalogHelp,
      ),
      AdminJsonSettingKind.priceTables => (
        LucideIcons.receipt,
        l10n.adminCostTables,
        l10n.adminCostTablesHelp,
      ),
      AdminJsonSettingKind.browserGuard => (
        LucideIcons.shieldCheck,
        l10n.adminGuardSites,
        l10n.adminGuardSitesHelp,
      ),
      AdminJsonSettingKind.callLimits => (
        LucideIcons.phoneCall,
        l10n.adminCallLimits,
        l10n.adminCallLimitsHelp,
      ),
    };
    return GroupedTile(
      key: Key('adminJson-${kind.name}'),
      icon: icon,
      title: title,
      subtitle: help,
      onTap: () => adminOpenJsonSheet(
        context,
        builder: (_) =>
            _JsonSettingSheet(kind: kind, icon: icon, title: title, help: help),
      ),
    );
  }
}

class _JsonSettingSheet extends ConsumerStatefulWidget {
  const _JsonSettingSheet({
    required this.kind,
    required this.icon,
    required this.title,
    required this.help,
  });
  final AdminJsonSettingKind kind;
  final IconData icon;
  final String title;
  final String help;

  @override
  ConsumerState<_JsonSettingSheet> createState() => _JsonSettingSheetState();
}

class _JsonSettingSheetState extends ConsumerState<_JsonSettingSheet> {
  static const _pretty = JsonEncoder.withIndent('  ');
  final _json = TextEditingController();
  String _builtIn = '';
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
    final setting = await runGuarded(
      context,
      () => ref.read(backendProvider).adminJsonSetting(widget.kind),
    );
    if (!mounted) return;
    setState(() {
      _loaded = true;
      if (setting != null) _show(setting);
    });
  }

  void _show(AdminJsonSetting setting) {
    _json.text = _pretty.convert(setting.saved);
    _builtIn = _pretty.convert(setting.builtIn);
  }

  Future<void> _save() async {
    final problem = adminJsonProblem(context, _json.text);
    if (problem != null) {
      // Shown under the field; Save stays on, so a fix can be saved straight away.
      setState(() => _error = problem);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    final value = jsonDecode(_json.text) as Map<String, dynamic>;
    final saved = await runGuarded(
      context,
      () => ref.read(backendProvider).saveAdminJsonSetting(widget.kind, value),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (saved == null) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mono = adminMonoStyle(context);
    return FormSheet(
      icon: widget.icon,
      title: widget.title,
      subtitle: widget.help,
      submitLabel: l10n.save,
      submitKey: Key('adminJsonSave-${widget.kind.name}'),
      busy: _busy,
      onSubmit: !_loaded || _busy || !_valid ? null : _save,
      children: [
        AdminJsonEditor(
          fieldKey: Key('adminJsonField-${widget.kind.name}'),
          controller: _json,
          enabled: _loaded,
          error: _error,
          minLines: 10,
          maxLines: 20,
          onValidChanged: (valid) => setState(() {
            _valid = valid;
            _error = null;
          }),
        ),
        if (_builtIn.isNotEmpty)
          ExpansionTile(
            key: Key('adminJsonBuiltIn-${widget.kind.name}'),
            tilePadding: EdgeInsets.zero,
            title: Text(l10n.adminBuiltInValues),
            trailing: IconButton(
              tooltip: l10n.copy,
              icon: const Icon(LucideIcons.copy, size: 18),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: _builtIn));
                if (context.mounted) showSuccess(context, l10n.copied);
              },
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpace.md),
                child: SelectableText(_builtIn, style: mono),
              ),
            ],
          ),
      ],
    );
  }
}
