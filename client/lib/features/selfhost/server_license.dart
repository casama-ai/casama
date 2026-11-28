import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart' show AuthSession, CasamaClient, signupProof, solveSignupChallenge;
import 'package:dio/dio.dart' show DioException;
import 'package:flutter/foundation.dart' show compute;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cloud_account.dart';
import '../../core/date_format.dart';
import '../../core/license_errors.dart';
import '../../core/link_browser.dart';
import '../../core/number_format.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart';
import '../../core/server_address.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../theme/wallpaper.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/form_sheet.dart';
import 'local_updates.dart';
import '../cloud_models/cloud_models_flag.dart';
import '../cloud_models/cloud_models_screen.dart' show cloudModelsBanner;
import '../cloud_models/cloud_models_state.dart' show cloudModelsStateProvider;

/// The Business edition's list price in US dollars per active user a month, paying monthly and
/// paying yearly.
const _businessMonthlyUsd = 29;
const _businessYearlyMonthlyUsd = 24;

/// The license state of the server the app is using (docs/SELF-HOSTING-PLAN.md §11.6). Casama
/// Cloud is never asked (it has no licensing), and a server that doesn't answer counts as off, so
/// nothing new shows there.
final serverLicenseProvider = FutureProvider<ServerLicenseStatus>((ref) async {
  final backend = ref.watch(backendProvider);
  if (isCasamaCloud(backend.apiUrl)) return ServerLicenseStatus.off;
  try {
    return await backend.selfhost.status();
  } catch (_) {
    return ServerLicenseStatus.off;
  }
});

/// A Casama Cloud session good for asking for the personal license (and, with [session], kept on
/// this device: docs/SELFHOST-CLOUD-MODELS-PLAN.md §7.2).
class CloudSession {
  const CloudSession(this.accessToken, {this.email, this.session});
  final String accessToken;
  final String? email;

  /// The whole session (with its refresh token), kept in the keychain so the person signs in to
  /// Cloud once per device. Null for a session borrowed from the app's own Cloud sign-in.
  final AuthSession? session;
}

/// Signs in to Casama Cloud with an email code (the same code sign-in the app uses), separately
/// from the server the app is on, only to get the personal license. Tests replace it.
abstract class CloudLicenseAuth {
  Future<void> sendCode(String email);
  Future<CloudSession> verify(String email, String code);
}

class SdkCloudLicenseAuth implements CloudLicenseAuth {
  CasamaClient? _client;
  Future<CasamaClient> get _cloud async => _client ??= await CasamaClient.connect(casamaCloudApi);

  /// A new person's code sign-in makes their Cloud account, and Cloud only makes one that carries
  /// its sign-up proof (D-094), solved against Cloud's own config, not the server the app is on.
  @override
  Future<void> sendCode(String email) async {
    final cloud = await _cloud;
    final proof = await signupProof(cloud.api, cloud.config, solve: (c, d) => compute(_solveCloudPuzzle, (c, d)));
    await cloud.auth.sendMagicLink(email: email.trim(), data: proof == null ? null : {'signup_proof': proof});
  }

  @override
  Future<CloudSession> verify(String email, String code) async {
    final s = await (await _cloud).auth.verifyEmailOtp(email: email.trim(), token: code.trim());
    return CloudSession(s.accessToken, email: s.email ?? email.trim(), session: s);
  }
}

String _solveCloudPuzzle((String, int) p) => solveSignupChallenge(p.$1, p.$2);

final cloudLicenseAuthProvider = Provider<CloudLicenseAuth>((ref) => SdkCloudLicenseAuth());

/// The person's Casama Cloud session: the app's own when it is signed in to Casama Cloud right now,
/// else the one kept on this device ([cloudAccountProvider]), else a sign-in with an email code,
/// which is then kept, so Settings can show the account (sign out, delete) and the person signs in
/// once per device. Null when they closed it. [body] says why Cloud is asked (the license's words
/// by default).
Future<CloudSession?> cloudSession(BuildContext context, WidgetRef ref, {String? body}) async {
  final backend = ref.read(backendProvider);
  if (isCasamaCloud(backend.apiUrl)) {
    final auth = backend.authHeaders['Authorization'];
    if (auth != null && auth.startsWith('Bearer ')) return CloudSession(auth.substring(7));
  }
  final kept = await ref.read(cloudAccountProvider.notifier).fresh();
  if (kept != null) return CloudSession(kept.accessToken, email: kept.email, session: kept);
  if (!context.mounted) return null;
  final signedIn = await showAdaptiveSheet<CloudSession>(context: context, builder: (_) => CloudSignInSheet(body: body));
  if (signedIn?.session case final s?) await ref.read(cloudAccountProvider.notifier).keep(s);
  return signedIn;
}

/// "Sign in with your Casama account": email, then the code from the email.
class CloudSignInSheet extends ConsumerStatefulWidget {
  const CloudSignInSheet({super.key, this.body});

  /// Why Casama Cloud is asked; the license's words when null.
  final String? body;

  @override
  ConsumerState<CloudSignInSheet> createState() => _CloudSignInSheetState();
}

class _CloudSignInSheetState extends ConsumerState<CloudSignInSheet> {
  final _email = TextEditingController();
  final _code = TextEditingController();
  var _sent = false;
  var _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_busy) return;
    final auth = ref.read(cloudLicenseAuthProvider);
    setState(() => _busy = true);
    if (!_sent) {
      final api = ref.read(backendProvider).selfhost;
      final ok = await runGuarded(context, () async {
        // Cloud sign-up is invite-only for now: let this address in first, so a new person isn't
        // stopped at the waitlist. A refused address (bad or disposable) says why; anything else
        // (an older Cloud, no network) still tries the code.
        try {
          await api.admit(_email.text);
        } on DioException catch (e) {
          if (e.response?.statusCode == 400) rethrow;
        }
        await auth.sendCode(_email.text);
        return true;
      });
      if (mounted) {
        setState(() {
          _busy = false;
          _sent = ok == true;
        });
      }
      return;
    }
    final session = await runGuarded(context, () => auth.verify(_email.text, _code.text));
    if (!mounted) return;
    if (session == null) {
      setState(() => _busy = false);
      return;
    }
    Navigator.pop(context, session);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ready = _sent ? _code.text.trim().length >= 6 : _email.text.contains('@');
    return FormSheet(
      icon: LucideIcons.cloud,
      title: l10n.cloudSignInTitle,
      subtitle: _sent ? l10n.cloudSignInCodeSent(_email.text.trim()) : (widget.body ?? l10n.cloudSignInBody),
      submitLabel: _sent ? l10n.cloudSignInVerify : l10n.cloudSignInSendCode,
      submitKey: const Key('cloudSignInSubmit'),
      busy: _busy,
      onSubmit: ready ? _submit : null,
      children: [
        TextField(
          key: const Key('cloudSignInEmail'),
          controller: _email,
          enabled: !_sent,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          decoration: InputDecoration(labelText: l10n.cloudSignInEmail),
          onChanged: (_) => setState(() {}),
          onSubmitted: (_) => ready ? _submit() : null,
        ),
        if (_sent)
          TextField(
            key: const Key('cloudSignInCode'),
            controller: _code,
            autofocus: true,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.oneTimeCode],
            decoration: InputDecoration(labelText: l10n.cloudSignInCode),
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) => ready ? _submit() : null,
          ),
      ],
    );
  }
}

/// The two ways to license a server: the free personal license from a Casama account, or a
/// business key pasted in. Used by the setup cover and by Renew.
class ServerLicensePanel extends ConsumerStatefulWidget {
  const ServerLicensePanel({super.key, required this.status, this.onLicensed});
  final ServerLicenseStatus status;
  final VoidCallback? onLicensed;

  @override
  ConsumerState<ServerLicensePanel> createState() => _ServerLicensePanelState();
}

class _ServerLicensePanelState extends ConsumerState<ServerLicensePanel> {
  final _key = TextEditingController();
  var _busy = false;

  @override
  void dispose() {
    _key.dispose();
    super.dispose();
  }

  Future<void> _done() async {
    ref.invalidate(serverLicenseProvider);
    if (!mounted) return;
    showSuccess(context, context.l10n.licenseActivated);
    widget.onLicensed?.call();
  }

  Future<void> _personal() async {
    final session = await cloudSession(context, ref);
    if (session == null || !mounted) return;
    setState(() => _busy = true);
    final api = ref.read(backendProvider).selfhost;
    final ok = await runGuarded(context, () async {
      final s = widget.status.instanceId == null ? await api.status() : widget.status;
      final issued = await api.personalLicense(cloudToken: session.accessToken, instanceId: s.instanceId ?? '', engineVersion: s.engineVersion ?? 'unknown');
      await api.setLicense(issued.license);
      return true;
    });
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok == true) await _done();
  }

  Future<void> _business() async {
    final key = _key.text.trim();
    if (key.isEmpty) return;
    setState(() => _busy = true);
    final ok = await runGuarded(context, () async {
      await ref.read(backendProvider).selfhost.setLicense(key);
      return true;
    });
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok == true) await _done();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpace.md,
      children: [
        FilledButton.icon(
          key: const Key('licensePersonal'),
          onPressed: _busy ? null : _personal,
          icon: const Icon(LucideIcons.userCheck, size: 18),
          label: Text(l10n.licensePersonalButton),
        ),
        Text(l10n.licensePersonalNote, style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
        const Divider(),
        Text(l10n.licenseBusinessTitle, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
        TextField(
          key: const Key('licenseBusinessKey'),
          controller: _key,
          minLines: 2,
          maxLines: 4,
          style: AppText.mono.copyWith(fontSize: 13),
          decoration: InputDecoration(hintText: l10n.licenseBusinessHint, border: const OutlineInputBorder()),
          onChanged: (_) => setState(() {}),
        ),
        OutlinedButton.icon(
          key: const Key('licenseBusinessSave'),
          onPressed: _busy || _key.text.trim().isEmpty ? null : _business,
          icon: const Icon(LucideIcons.keyRound, size: 18),
          label: Text(l10n.licenseBusinessSave),
        ),
        InkWell(
          key: const Key('licensePartners'),
          onTap: () => openWebLink(Uri(scheme: 'mailto', path: partnersEmail, queryParameters: {'subject': 'Casama Business license'})),
          child: Text(
            l10n.licenseBusinessPrices(
              _businessMonthlyUsd.humanizedCurrency(l10n.localeName, 'USD', decimalDigits: 0),
              _businessYearlyMonthlyUsd.humanizedCurrency(l10n.localeName, 'USD', decimalDigits: 0),
              partnersEmail,
            ),
            style: context.textTheme.bodySmall?.copyWith(color: scheme.primary)),
        ),
      ],
    );
  }
}

/// The server has no license yet (setup state): it only signs in, answers status and takes a key,
/// so the whole app waits on this page.
class ServerLicenseScreen extends ConsumerWidget {
  const ServerLicenseScreen({super.key, required this.status});
  final ServerLicenseStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Scaffold(
      key: const Key('serverLicenseScreen'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpace.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppSpace.lg,
                children: [
                  Icon(LucideIcons.keyRound, size: 40, color: context.colorScheme.primary),
                  Text(
                    l10n.licenseSetupTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    l10n.licenseSetupBody,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                  ),
                  ServerLicensePanel(status: status),
                  TextButton(
                    key: const Key('licenseOtherServer'),
                    onPressed: () => changeServerDialog(
                      context,
                      ref.read(backendProvider).apiUrl,
                      title: l10n.server,
                      label: l10n.serverAddress,
                      cancel: l10n.cancel,
                      connect: l10n.connect,
                    ),
                    child: Text(l10n.licenseOtherServer),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Renew from a banner: the same two ways, in a sheet.
class RenewLicenseSheet extends StatelessWidget {
  const RenewLicenseSheet({super.key, required this.status});
  final ServerLicenseStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SingleChildScrollView(
      key: const Key('renewLicenseSheet'),
      padding: EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xs, AppSpace.xl, AppSpace.lg + MediaQuery.paddingOf(context).bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpace.md,
        children: [
          Text(l10n.licenseRenewTitle, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ServerLicensePanel(status: status, onLicensed: () => Navigator.maybePop(context)),
        ],
      ),
    );
  }
}

/// What a banner over the app says, if anything: the license in grace or expired, or an update
/// ready for the server this app installed.
class SelfhostLicenseGate extends ConsumerStatefulWidget {
  const SelfhostLicenseGate({super.key, required this.child, this.navigatorContext});
  final Widget child;

  /// A context under the app's navigator, for the sheets the banners open.
  final BuildContext? Function()? navigatorContext;

  @override
  ConsumerState<SelfhostLicenseGate> createState() => _SelfhostLicenseGateState();
}

class _SelfhostLicenseGateState extends ConsumerState<SelfhostLicenseGate> {
  AppLifecycleListener? _lifecycle;
  var _graceHidden = false;
  var _cloudWarningHidden = false;

  @override
  void initState() {
    super.initState();
    licenseRecheck.addListener(_recheck);
    // Read again when the app comes back to the front (a key may have been set elsewhere).
    _lifecycle = AppLifecycleListener(onResume: _recheck);
  }

  @override
  void dispose() {
    licenseRecheck.removeListener(_recheck);
    _lifecycle?.dispose();
    super.dispose();
  }

  void _recheck() {
    if (!mounted) return;
    ref.invalidate(serverLicenseProvider);
    // At most one network read a day; the rest come from the saved release.
    ref.invalidate(localUpdateProvider);
    if (kCloudModelsCode) ref.invalidate(cloudModelsStateProvider);
  }

  BuildContext get _sheetContext => widget.navigatorContext?.call() ?? context;

  void _renew(ServerLicenseStatus s) {
    unawaited(
      showAdaptiveSheet<void>(
        context: _sheetContext,
        builder: (_) => RenewLicenseSheet(status: s),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(serverLicenseProvider).value ?? ServerLicenseStatus.off;
    final update = ref.watch(localUpdateProvider).value;
    if (status.needsLicense) {
      return Stack(
        children: [
          ExcludeSemantics(child: widget.child),
          Positioned.fill(
            // Pages are see-through (the theme's scaffold background is transparent), so the cover
            // paints the wallpaper itself; otherwise the screen under it (the setup steps) shows
            // through. The ColoredBox keeps taps from reaching the app under the cover.
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Wallpaper(
                key: const Key('serverLicenseCover'),
                // Its own navigator: the cover sits over the app's, and its fields and sheets need one.
                child: Navigator(
                  onGenerateRoute: (_) => MaterialPageRoute<void>(builder: (_) => ServerLicenseScreen(status: status)),
                ),
              ),
            ),
          ),
        ],
      );
    }
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    Widget? banner;
    if (status.expired) {
      banner = _Banner(
        key: const Key('licenseExpiredBanner'),
        icon: LucideIcons.circlePause,
        color: scheme.errorContainer,
        onColor: scheme.onErrorContainer,
        text: l10n.licenseExpiredBanner,
        actions: [TextButton(key: const Key('licenseRenew'), onPressed: () => _renew(status), child: Text(l10n.licenseRenew))],
      );
    } else if (status.inGrace && !_graceHidden) {
      final until = status.graceUntil;
      banner = _Banner(
        key: const Key('licenseGraceBanner'),
        icon: LucideIcons.clockAlert,
        color: context.appColors.warning.withValues(alpha: 0.18),
        onColor: scheme.onSurface,
        text: until == null ? l10n.licenseGraceBannerSoon : l10n.licenseGraceBanner(until.toLocal().formattedDate(context)),
        actions: [
          TextButton(key: const Key('licenseRenew'), onPressed: () => _renew(status), child: Text(l10n.licenseRenew)),
          IconButton(
            key: const Key('licenseGraceHide'),
            tooltip: l10n.close,
            onPressed: () => setState(() => _graceHidden = true),
            icon: const Icon(LucideIcons.x, size: 18),
          ),
        ],
      );
    } else if (update != null) {
      banner = _Banner(
        key: const Key('localUpdateBanner'),
        icon: LucideIcons.arrowUpCircle,
        color: scheme.secondaryContainer,
        onColor: scheme.onSecondaryContainer,
        text: l10n.localUpdateAvailable(update.version),
        actions: [
          TextButton(
            key: const Key('localUpdateStart'),
            onPressed: () => unawaited(showLocalUpdate(_sheetContext, ref, update)),
            child: Text(l10n.localUpdateButton),
          ),
          TextButton(
            key: const Key('localUpdateLater'),
            onPressed: () => unawaited(ref.read(localUpdateProvider.notifier).later(update.version)),
            child: Text(l10n.localUpdateLater),
          ),
        ],
      );
    }
    // Casama Cloud models (SELFHOST-CLOUD-MODELS-PLAN §4.2, §9): a stop, the 80% warning or the
    // members' one-time notice, when nothing above needs the space.
    if (banner == null && kCloudModelsCode) {
      banner = cloudModelsBanner(
        context,
        ref,
        () => _sheetContext,
        warningHidden: _cloudWarningHidden,
        hideWarning: () => setState(() => _cloudWarningHidden = true),
      );
    }
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          alignment: Alignment.topCenter,
          child: banner ?? const SizedBox(width: double.infinity),
        ),
        Expanded(
          child: MediaQuery.removePadding(context: context, removeTop: banner != null, child: widget.child),
        ),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({super.key, required this.icon, required this.color, required this.onColor, required this.text, required this.actions});
  final IconData icon;
  final Color color;
  final Color onColor;
  final String text;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.xxs, AppSpace.xs, AppSpace.xxs),
          child: Row(
            children: [
              Icon(icon, size: 18, color: onColor),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Text(
                  text,
                  style: context.textTheme.bodyMedium?.copyWith(color: onColor, fontWeight: FontWeight.w600),
                ),
              ),
              ...actions,
            ],
          ),
        ),
      ),
    );
  }
}
