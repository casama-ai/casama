import 'dart:async';
import 'dart:convert';

import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/haptics.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';

/// The monospace text style the console's JSON editors and read-only JSON use.
TextStyle? adminMonoStyle(BuildContext context) =>
    context.textTheme.bodySmall?.copyWith(
      fontFamily: 'monospace',
      fontFamilyFallback: const [
        'Menlo',
        'SF Mono',
        'Consolas',
        'Roboto Mono',
        'Courier New',
      ],
      height: 1.45,
    );

/// Opens a JSON editor sheet; when it closes with `true` (saved), says so in a snackbar.
Future<void> adminOpenJsonSheet(
  BuildContext context, {
  required WidgetBuilder builder,
}) async {
  final saved = await showAdaptiveSheet<bool>(
    context: context,
    heightFactor: 0.9,
    dialogMaxWidth: 720,
    builder: builder,
  );
  // Only where a page can show it (a bare card in a test has no Scaffold).
  if (saved == true && context.mounted && Scaffold.maybeOf(context) != null) {
    showSuccess(context, context.l10n.saved);
  }
}

/// What's wrong with [text] as a JSON object, in words, or null when it is one.
String? adminJsonProblem(BuildContext context, String text) {
  final l10n = context.l10n;
  try {
    final parsed = jsonDecode(text);
    return parsed is Map<String, dynamic> ? null : l10n.adminJsonNotObject;
  } on FormatException catch (e) {
    var problem = e.message.trim();
    if (problem.isEmpty) problem = 'Unexpected input';
    final offset = e.offset;
    if (offset != null && offset >= 0 && offset <= text.length) {
      final before = text.substring(0, offset);
      final line = '\n'.allMatches(before).length + 1;
      final column = offset - (before.lastIndexOf('\n') + 1) + 1;
      problem = l10n.adminJsonWhere(problem, line, column);
    }
    return l10n.adminJsonInvalid(problem);
  }
}

/// A JSON object editor for the console: monospace text, a Format button that pretty-prints valid
/// JSON, and an inline error that follows typing after a short pause. [onValidChanged] says when
/// the text turns valid (at once) or invalid (after the pause), so the sheet can turn Save off.
class AdminJsonEditor extends StatefulWidget {
  const AdminJsonEditor({
    super.key,
    required this.controller,
    required this.fieldKey,
    required this.onValidChanged,
    this.enabled = true,
    this.error,
    this.minLines = 12,
    this.maxLines = 24,
    this.debounce = const Duration(milliseconds: 450),
  });

  final TextEditingController controller;
  final Key fieldKey;
  final ValueChanged<bool> onValidChanged;
  final bool enabled;

  /// An error from outside (a refused save); shown until the text changes.
  final String? error;
  final int minLines;
  final int maxLines;
  final Duration debounce;

  @override
  State<AdminJsonEditor> createState() => _AdminJsonEditorState();
}

class _AdminJsonEditorState extends State<AdminJsonEditor> {
  static const _pretty = JsonEncoder.withIndent('  ');
  Timer? _timer;
  String? _live;

  @override
  void didUpdateWidget(AdminJsonEditor old) {
    super.didUpdateWidget(old);
    // A refused save already says what's wrong: the pending check would only repeat it (and turn
    // Save off under the person's hands).
    if (widget.error != null && old.error == null) {
      _timer?.cancel();
      _live = null;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _changed(String text) {
    _timer?.cancel();
    final problem = adminJsonProblem(context, text);
    if (problem == null) {
      if (_live != null) setState(() => _live = null);
      widget.onValidChanged(true);
      return;
    }
    _timer = Timer(widget.debounce, () {
      if (!mounted) return;
      setState(() => _live = adminJsonProblem(context, widget.controller.text));
      widget.onValidChanged(_live == null);
    });
    // The text changed: any refused-save error is about the old text.
    widget.onValidChanged(_live == null);
  }

  void _format() {
    final text = widget.controller.text;
    try {
      final parsed = jsonDecode(text);
      HapticsHelper.light();
      widget.controller.value = TextEditingValue(
        text: _pretty.convert(parsed),
        selection: const TextSelection.collapsed(offset: 0),
      );
      _changed(widget.controller.text);
    } on FormatException {
      _timer?.cancel();
      setState(() => _live = adminJsonProblem(context, text));
      widget.onValidChanged(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final error = widget.error ?? _live;
    final name = widget.fieldKey is ValueKey<String>
        ? (widget.fieldKey as ValueKey<String>).value
        : 'adminJson';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(LucideIcons.braces, size: 16, color: scheme.onSurfaceVariant),
            const SizedBox(width: 6),
            Expanded(
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: widget.controller,
                builder: (context, value, _) => Text(
                  l10n.adminJsonLines('\n'.allMatches(value.text).length + 1),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                    fontFeatures: AppText.tabular,
                  ),
                ),
              ),
            ),
            TextButton.icon(
              key: Key('$name-format'),
              onPressed: widget.enabled ? _format : null,
              icon: const Icon(LucideIcons.wandSparkles, size: 16),
              label: Text(l10n.adminJsonFormat),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.xxs),
        TextField(
          key: widget.fieldKey,
          controller: widget.controller,
          enabled: widget.enabled,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          keyboardType: TextInputType.multiline,
          autocorrect: false,
          enableSuggestions: false,
          smartQuotesType: SmartQuotesType.disabled,
          smartDashesType: SmartDashesType.disabled,
          style: adminMonoStyle(context),
          decoration: InputDecoration(
            errorText: error,
            errorMaxLines: 4,
            filled: true,
            fillColor: scheme.surfaceContainerLow,
          ),
          onChanged: _changed,
        ),
      ],
    );
  }
}
