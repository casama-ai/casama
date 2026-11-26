import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

import '../ui/adaptive_modal.dart';
import '../ui/form_sheet.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../l10n/generated/app_localizations.dart';
import 'config.dart';

/// Which Casama server the app talks to (D-076): the build's default, a self-hosted address the
/// user entered, or (for the web app served by a self-hosted stack) the page's own origin.
class ServerAddress {
  static const _key = 'casama.server_url';

  static Future<AppConfig> load({AppConfig fallback = AppConfig.fromEnvironment}) async {
    try {
      final prefs = await SharedPreferences.getInstance().timeout(const Duration(seconds: 2));
      final saved = prefs.getString(_key);
      if (saved != null && saved.isNotEmpty) return AppConfig(apiUrl: saved);
    } catch (_) {}
    if (kIsWeb && fallback.apiUrl.isEmpty) return AppConfig(apiUrl: Uri.base.origin);
    return fallback;
  }

  static Future<void> save(String url) async => (await SharedPreferences.getInstance()).setString(_key, normalize(url));

  static Future<void> clear() async => (await SharedPreferences.getInstance()).remove(_key);

  /// "casama.example.com" -> "https://casama.example.com"; strips trailing slashes.
  static String normalize(String input) {
    var s = input.trim().replaceAll(RegExp(r'/+$'), '');
    if (!s.startsWith('http://') && !s.startsWith('https://')) {
      final local = s.startsWith('localhost') || s.startsWith('127.') || s.startsWith('10.') || s.startsWith('192.168.');
      s = '${local ? 'http' : 'https'}://$s';
    }
    return s;
  }

  /// [input] as an address the app can use ([normalize]d), or null when it isn't one: only
  /// http and https, a host, a port from 1 to 65535 when one is given, and no spaces. A missing
  /// scheme is fine ("casama.example.com", "192.168.1.20:8080"); a misspelt one ("htp:/x") isn't.
  static String? parse(String input) {
    final raw = input.trim();
    if (raw.isEmpty || RegExp(r'\s').hasMatch(raw)) return null;
    // "word:" at the start is a scheme unless digits follow (host:port).
    final scheme = RegExp(r'^([A-Za-z][A-Za-z0-9+.-]*):(?!\d+(/|$))').firstMatch(raw);
    if (scheme != null) {
      final name = scheme.group(1)!.toLowerCase();
      if ((name != 'http' && name != 'https') || !raw.substring(scheme.end).startsWith('//')) return null;
    }
    // normalize() looks for a lowercase scheme.
    final s = normalize(scheme == null ? raw : '${scheme.group(1)!.toLowerCase()}:${raw.substring(scheme.end)}');
    final Uri uri;
    try {
      uri = Uri.parse(s);
    } on FormatException {
      return null;
    }
    if (uri.scheme != 'http' && uri.scheme != 'https') return null;
    if (uri.host.isEmpty || uri.userInfo.isNotEmpty || uri.hasQuery || uri.hasFragment) return null;
    final host = uri.host;
    final name = RegExp(r'^[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?(\.[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?)*$');
    final ipv6 = RegExp(r'^[0-9A-Fa-f:.]+$');
    if (!name.hasMatch(host) && !(host.contains(':') && ipv6.hasMatch(host))) return null;
    // Uri reads "host:" as no port; a port that is there must be 1-65535.
    final authority = s.substring(s.indexOf('//') + 2).split('/').first;
    final port = RegExp(r':(\d*)$').firstMatch(authority.startsWith('[') ? authority.substring(authority.indexOf(']') + 1) : authority);
    if (port != null) {
      final n = int.tryParse(port.group(1)!);
      if (n == null || n < 1 || n > 65535) return null;
    }
    return s;
  }
}

/// Set by the startup gate: reconnects the app to another server.
Future<void> Function(String url)? onChangeServer;

/// Asks for a server address and switches to it.
Future<void> changeServerDialog(
  BuildContext context,
  String current, {
  required String title,
  required String label,
  required String cancel,
  required String connect,
  String? help,
}) async {
  final url = await showAdaptiveSheet<String>(
    context: context,
    builder: (_) => _ServerForm(current: current, title: title, label: label, cancel: cancel, connect: connect, help: help),
  );
  if (url == null) return;
  await onChangeServer?.call(url);
}

class _ServerForm extends StatefulWidget {
  const _ServerForm({required this.current, required this.title, required this.label, required this.cancel, required this.connect, this.help});
  final String current, title, label, cancel, connect;
  final String? help;
  @override
  State<_ServerForm> createState() => _ServerFormState();
}

class _ServerFormState extends State<_ServerForm> {
  late final _c = TextEditingController(text: widget.current);
  String? _error;

  /// Closes with the address, normalized, or shows why it can't be used.
  void _submit() {
    final url = ServerAddress.parse(_c.text);
    if (url == null) {
      setState(() => _error = AppLocalizations.of(context).serverAddressInvalid);
      return;
    }
    Navigator.pop(context, url);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FormSheet(
    icon: LucideIcons.server,
    title: widget.title,
    subtitle: widget.help,
    submitLabel: widget.connect,
    submitIcon: LucideIcons.link,
    submitKey: const Key('serverConnect'),
    cancelLabel: widget.cancel,
    onSubmit: _submit,
    children: [
      TextField(
        key: const Key('serverUrl'),
        controller: _c,
        autofocus: true,
        autocorrect: false,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: 'https://casama.example.com',
          prefixIcon: const Icon(LucideIcons.globe, size: 20),
          errorText: _error,
          errorMaxLines: 3,
        ),
        onChanged: (_) {
          if (_error != null) setState(() => _error = null);
        },
        onSubmitted: (_) => _submit(),
      ),
    ],
  );
}
