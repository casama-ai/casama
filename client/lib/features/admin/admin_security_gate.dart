import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoSlidingSegmentedControl;
import 'package:material_ui/material_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart' show AdminPinState;
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/admin_device_key.dart';
import '../../core/admin_security.dart';
import '../../core/backend.dart';
import '../../core/haptics.dart';
import '../../core/passkeys.dart';
import '../../core/providers.dart';
import '../app_lock/app_lock.dart';
import '../app_lock/lock_screen.dart' show deviceUnlockName;
import '../../core/telemetry.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/otp_code_field.dart';
import '../../ui/page.dart';
import 'ui/admin_ui.dart' show adminMaskEmail;

/// Leaving the app locks the console; a window merely losing focus doesn't. On a desktop or the
/// web, `inactive` only means another window has focus (a password manager, the mail with the
/// code), and on iOS it's the Face ID sheet for password autofill. The idle timer still runs then.
bool _leftApp(AppLifecycleState state) =>
    state == AppLifecycleState.paused ||
    state == AppLifecycleState.hidden ||
    state == AppLifecycleState.detached;

/// A fresh sign-in in a dialog, for owner actions anywhere in the app (and the console's own
/// confirmations). True once the person verified; [stillValid] can veto a late answer.
Future<bool> showAdminConfirmation(
  BuildContext context, {
  bool sensitive = true,
  bool Function()? stillValid,
  bool allowPin = true,
  String? title,
  String? help,
}) async {
  final accepted = await showDialog<bool>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    builder: (dialogContext) => CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () =>
            Navigator.of(dialogContext).pop(false),
      },
      child: AlertDialog(
        title: Text(
          title ??
              (sensitive
                  ? context.l10n.adminConfirmAction
                  : context.l10n.adminUnlock),
        ),
        content: SizedBox(
          width: 360,
          child: AdminAuthentication(
            sensitive: sensitive,
            allowPin: allowPin,
            help: help,
            compact: true,
            onVerified: () {
              if (stillValid?.call() ?? true) {
                Navigator.of(dialogContext).pop(true);
              }
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(context.l10n.cancel),
          ),
        ],
      ),
    ),
  );
  return accepted == true;
}

/// A name for this device in Admin → Security.
String _deviceName(BuildContext context) {
  final tablet = MediaQuery.sizeOf(context).shortestSide >= 600;
  final kind = switch (defaultTargetPlatform) {
    TargetPlatform.iOS => tablet ? 'iPad' : 'iPhone',
    TargetPlatform.macOS => 'Mac',
    _ => tablet ? 'Android tablet' : 'Android phone',
  };
  final d = DateTime.now();
  return '$kind · ${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

/// Sets this device up for the screen-lock check (D-453, the Mac too since D-507): a check that
/// isn't the PIN (unless one was just made), then the screen lock once to make the key. True when
/// it's on.
Future<bool> enrollAdminDevice(BuildContext context, WidgetRef ref) async {
  final backend = ref.read(backendProvider);
  final me = backend.userId;
  if (!(AdminSecurity.recentlyVerified(me) && AdminSecurity.lastVerifiedMethod != 'pin')) {
    if (!await showAdminConfirmation(context, allowPin: false)) return false;
  }
  if (!context.mounted) return false;
  final l10n = context.l10n;
  final name = _deviceName(context);
  final ok = await runGuarded(
    context,
    () => AdminSecurity.duringSystemSheet(
      () => ref
          .read(adminDeviceKeysProvider)
          .enroll(backend, name: name, reason: l10n.adminDeviceSetupReason),
    ),
  );
  if (ok == true && context.mounted) showSuccess(context, l10n.adminDeviceOn);
  return ok == true;
}

/// Console authentication is deliberately separate from the ordinary app session.
class AdminSecurityGate extends ConsumerStatefulWidget {
  const AdminSecurityGate({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<AdminSecurityGate> createState() => _AdminSecurityGateState();
}

class _AdminSecurityGateState extends ConsumerState<AdminSecurityGate>
    with WidgetsBindingObserver {
  Timer? _idle;
  bool _unlocked = false;
  Future<bool>? _confirming;
  int _generation = 0;
  String? _identity;
  Backend? _backendIdentity;
  GoRouter? _router;
  String? _routePath;
  late final Future<bool> Function(bool) _authenticate = _confirm;
  bool _isUnlocked() =>
      mounted &&
      _unlocked &&
      identical(_backendIdentity, ref.read(backendProvider)) &&
      _identity == ref.read(backendProvider).userId;
  late final VoidCallback _lockCallback = _lock;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AdminSecurity.authenticate = _authenticate;
    AdminSecurity.isUnlocked = _isUnlocked;
    AdminSecurity.lock = _lockCallback;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.maybeOf(context);
    if (!identical(router, _router)) {
      _router?.routerDelegate.removeListener(_routeChanged);
      _router = router;
      _routePath = router == null ? null : _topPath(router);
      router?.routerDelegate.addListener(_routeChanged);
    }
  }

  /// The page on top, pushed or not. Not the address: phones open the console with a push, which
  /// leaves the address on the page below (/bots), so every router refresh (the unlock form
  /// closing, a token refresh) looked like leaving the console and locked it again.
  static String? _topPath(GoRouter router) {
    try {
      return router.state.uri.path;
    } catch (_) {
      return null;
    }
  }

  void _routeChanged() {
    final router = _router;
    if (router == null) return;
    final path = _topPath(router);
    if (path != _routePath) _lock('route $_routePath -> $path');
  }

  void _activity() {
    if (!_unlocked) return;
    _idle?.cancel();
    _idle = Timer(AdminSecurity.idleLimit, () => _lock('idle'));
    AdminSecurity.lockAt.value = DateTime.now().add(AdminSecurity.idleLimit);
  }

  DateTime? _unlockedAt;

  void _lock([String reason = 'lock now']) {
    // A lock right after an unlock is the loop Oliver saw (D-453): report why, to find it.
    final since = _unlockedAt;
    if (_unlocked && since != null && DateTime.now().difference(since) < const Duration(seconds: 5)) {
      unawaited(
        Telemetry.captureException(
          StateError('Admin console locked right after unlocking: $reason'),
          StackTrace.current,
          warning: true,
          context: {'reason': reason},
        ),
      );
    }
    _unlockedAt = null;
    _idle?.cancel();
    AdminSecurity.lockAt.value = null;
    _generation++;
    AdminSecurity.forgetVerification();
    if (mounted) {
      // Sensitive forms use root popup routes. Remove them too, so locking cannot
      // leave a quota form or confirmation visible above the locked console.
      Navigator.of(
        context,
        rootNavigator: true,
      ).popUntil((route) => route is! PopupRoute);
      setState(() => _unlocked = false);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // A passkey or Face ID sheet can pause the app while it's up; that isn't leaving.
    if (_leftApp(state) && AdminSecurity.systemSheets == 0) _lock('left app ($state)');
  }

  void _unlock() {
    _backendIdentity = ref.read(backendProvider);
    _identity = ref.read(backendProvider).userId;
    _unlockedAt = DateTime.now();
    setState(() => _unlocked = true);
    _activity();
    WidgetsBinding.instance.addPostFrameCallback((_) => _offerDeviceKey());
  }

  /// After a passkey or password check on a phone with a screen lock and no key yet: offer Face ID
  /// for next time (D-453). Not after the PIN, which can't add a device.
  Future<void> _offerDeviceKey() async {
    final backend = ref.read(backendProvider);
    final userId = backend.userId;
    final keys = ref.read(adminDeviceKeysProvider);
    final method = AdminSecurity.lastVerifiedMethod;
    if (userId == null || method == 'pin' || method == 'device' || method == null) return;
    if (!AdminSecurity.recentlyVerified(userId)) return;
    if (!await keys.available() ||
        await keys.keyId(userId) != null ||
        await keys.declined(userId)) {
      return;
    }
    if (!mounted || !_isUnlocked()) return;
    final l10n = context.l10n;
    final yes = await showDialog<bool>(
      context: context,
      useRootNavigator: true,
      builder: (dialogContext) => AlertDialog(
        constraints: const BoxConstraints(maxWidth: 400),
        title: Text(l10n.adminDeviceOfferTitle),
        content: Text(l10n.adminDeviceOfferBody),
        actions: [
          TextButton(
            key: const Key('adminDeviceOfferNo'),
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.adminDeviceOfferNo),
          ),
          FilledButton(
            key: const Key('adminDeviceOfferYes'),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.adminDeviceOfferYes),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (yes != true) {
      if (yes == false) await keys.setDeclined(userId, true);
      return;
    }
    await enrollAdminDevice(context, ref);
  }

  /// One dialog at a time: a second change asked for while it's open waits for the same answer
  /// instead of being dropped.
  Future<bool> _confirm(bool sensitive) =>
      _confirming ??= _ask(sensitive).whenComplete(() => _confirming = null);

  Future<bool> _ask(bool sensitive) async {
    if (!_isUnlocked()) return false;
    final generation = _generation;
    final identity = _identity;
    final accepted = await showAdminConfirmation(
      context,
      sensitive: sensitive,
      stillValid: () =>
          mounted &&
          generation == _generation &&
          _isUnlocked() &&
          WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed,
    );
    final valid =
        accepted &&
        mounted &&
        generation == _generation &&
        identity == ref.read(backendProvider).userId &&
        _isUnlocked();
    if (valid) _activity();
    return valid;
  }

  @override
  void dispose() {
    _idle?.cancel();
    AdminSecurity.lockAt.value = null;
    WidgetsBinding.instance.removeObserver(this);
    _router?.routerDelegate.removeListener(_routeChanged);
    if (identical(AdminSecurity.authenticate, _authenticate)) {
      AdminSecurity.authenticate = null;
      AdminSecurity.isUnlocked = null;
      AdminSecurity.lock = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final generation = _generation;
    final backend = ref.watch(backendProvider);
    // A signed-out or changed identity immediately loses its console view.
    ref.listen(backendProvider, (previous, next) {
      if (!identical(previous, next)) _lock('account changed');
    });
    ref.listen(signedInProvider, (_, next) {
      if (next.value != true ||
          (_identity != null &&
              _identity != ref.read(backendProvider).userId)) {
        _lock('signed out or switched');
      }
    });
    return Listener(
      onPointerDown: (_) => _activity(),
      onPointerSignal: (_) => _activity(),
      onPointerHover: (_) => _activity(),
      child: Focus(
        onKeyEvent: (_, event) {
          if (event is KeyDownEvent) _activity();
          return KeyEventResult.ignored;
        },
        child: _unlocked
            ? widget.child
            : SubPage(
                title: context.l10n.adminConsole,
                body: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.gutter,
                      vertical: AppSpace.xl,
                    ),
                    child: ConstrainedBox(
                      // Vertically centered when it fits, scrolling when it doesn't.
                      constraints: BoxConstraints(
                        minHeight: (constraints.maxHeight - AppSpace.xl * 2)
                            .clamp(0, double.infinity),
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: AppCard(
                            padding: const EdgeInsets.fromLTRB(
                              AppSpace.lg,
                              AppSpace.xl,
                              AppSpace.lg,
                              AppSpace.lg,
                            ),
                            child: AdminAuthentication(
                              key: ValueKey((backend, backend.userId)),
                              generation: generation,
                              showTwoStepTip: true,
                              onVerified: () {
                                if (mounted &&
                                    generation == _generation &&
                                    identical(
                                      backend,
                                      ref.read(backendProvider),
                                    ) &&
                                    WidgetsBinding.instance.lifecycleState ==
                                        AppLifecycleState.resumed) {
                                  _unlock();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}


/// The ways to verify, strongest first. The name is what this device remembers and the end of
/// each segment's Key ('adminMethod-pin').
enum _Method { device, passkey, pin, password, email }

/// A passkey, the admin PIN, or a password or emailed code (then the authenticator code when the
/// account has two-step sign-in; the server refuses admin work from a session that hasn't passed
/// it). A passkey or PIN is a check the server records on this sign-in session and counts as both
/// steps (D-452). On a phone set up for it, Face ID, a fingerprint or the device passcode signs a
/// challenge with a key in the phone's secure chip, and that is the whole check too (D-453).
///
/// One way shows at a time, picked with a switcher that lists only the ways this account can use
/// here. It opens on the way this account used last on this device, else the strongest.
class AdminAuthentication extends ConsumerStatefulWidget {
  const AdminAuthentication({
    super.key,
    required this.onVerified,
    this.sensitive = false,
    this.generation = 0,
    this.showTwoStepTip = false,
    this.allowPin = true,
    this.help,
    this.compact = false,
  });
  final int generation;
  final VoidCallback onVerified;
  final bool sensitive;
  final bool showTwoStepTip;
  final String? help;

  /// In a dialog: no big header, since the dialog's title says it, and no footer.
  final bool compact;

  /// Off when changing the PIN itself: that takes a passkey or password.
  final bool allowPin;

  /// The last time a form opened Face ID by itself. A new lock screen within [autoGap] doesn't
  /// open it again, so nothing can turn into a loop of prompts (D-453).
  static DateTime? lastAutoDevice;
  static const autoGap = Duration(seconds: 30);

  /// The lock screen's tip card was closed: it stays closed until the app restarts.
  static bool tipDismissed = false;

  /// How long after sending an email code another can be asked for.
  static const resendGap = Duration(seconds: 60);

  /// Where this device remembers the way an account last verified. A preference, not a secret.
  static String methodPrefKey(String userId) => 'admin.unlockMethod.$userId';

  @override
  ConsumerState<AdminAuthentication> createState() =>
      _AdminAuthenticationState();
}

class _AdminAuthenticationState extends ConsumerState<AdminAuthentication>
    with WidgetsBindingObserver {
  final _password = TextEditingController();
  final _code = TextEditingController();
  final _twoStepCode = TextEditingController();
  final _pin = TextEditingController();
  bool _busy = false;

  /// What a wrong PIN left: tries, or the PIN turned off.
  String? _pinNote;

  /// The last attempt's problem, shown under the way that failed.
  String? _error;
  _Method? _errorMethod;
  bool _twoStepError = false;

  /// Shake and clear the boxes after a wrong PIN or code; off again once typing starts.
  bool _pinInvalid = false;
  bool _codeInvalid = false;
  bool _twoStepInvalid = false;
  bool _showPassword = false;

  /// What the person picked in the switcher (null: the remembered or strongest way).
  _Method? _picked;

  /// The way remembered on this device for this account.
  _Method? _remembered;

  /// The way that passed the first step, for the two-step trail.
  _Method? _firstStep;
  bool _loaded = false;
  bool _deviceOk = false;
  bool _passkeyOk = false;
  AdminPinState? _pinValue;
  Timer? _resendTicker;
  Timer? _loadTimeout;

  late Future<AdminPinState?> _pinState = _loadPin();

  Future<AdminPinState?> _loadPin() async {
    if (!widget.allowPin) return null;
    try {
      return await _backend.adminPinState();
    } catch (_) {
      return null;
    }
  }

  late bool _sent = AdminSecurity.codeSentFor(_identity);
  // A session that signed in but still owes its code (a lock while the authenticator app was
  // open, say) starts at the code.
  late bool _twoStep = _backend.twoStepCodeNeeded;
  late final Backend _backend = ref.read(backendProvider);
  late final String? _identity = _backend.userId;
  late final String? _email = _backend.userEmail;
  late final Future<bool> _hasTwoStep = widget.showTwoStepTip
      ? _backend.twoStepFactors().then(
          (f) => f.isNotEmpty,
          onError: (_) => true,
        )
      : Future.value(true);

  /// The account has a passkey this app can use here.
  late final Future<bool> _hasPasskey = () async {
    try {
      if (!(await ref.read(authMethodsProvider.future)).passkeys) return false;
      return (await _backend.passkeys()).isNotEmpty;
    } catch (_) {
      return false;
    }
  }();

  /// Passkeys work here but the account has none yet (the lock screen suggests one).
  late final Future<bool> _suggestPasskey = widget.showTwoStepTip
      ? () async {
          try {
            return (await ref.read(authMethodsProvider.future)).passkeys &&
                !await _hasPasskey;
          } catch (_) {
            return false;
          }
        }()
      : Future.value(false);

  late final AdminDeviceKeys _keys = ref.read(adminDeviceKeysProvider);

  /// This phone has its key for this account (D-453).
  late final Future<bool> _deviceReady = () async {
    try {
      return await _keys.available() && await _keys.keyId(_identity) != null;
    } catch (_) {
      return false;
    }
  }();
  bool _devicePrompted = false;
  bool _deviceGone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AdminSecurity.authFormOpened();
    _pin.addListener(() => _typing(_pin, () => _pinInvalid = false));
    _code.addListener(() => _typing(_code, () => _codeInvalid = false));
    _twoStepCode.addListener(
      () => _typing(_twoStepCode, () => _twoStepInvalid = false),
    );
    unawaited(_loadMethods());
    unawaited(_loadRemembered());
    if (_sent) _startResendTicker();
    // The device check opens by itself, once, when the form shows in the foreground.
    _deviceReady.then((ready) {
      if (ready &&
          mounted &&
          WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        _verifyWithDevice(auto: true);
      }
    });
  }

  /// Typing again after a wrong PIN or code ends its shake state.
  void _typing(TextEditingController field, VoidCallback reset) {
    if (field.text.isNotEmpty && mounted) setState(reset);
  }

  /// Which ways this account has here. The passkey and PIN come from the server and the form
  /// waits a moment for them; this device's key is local and joins whenever it answers (it opens
  /// by itself anyway).
  Future<void> _loadMethods() async {
    _deviceReady.then((ready) {
      if (!ready || !mounted) return;
      setState(() {
        // Someone already typing keeps their way on screen.
        if (_loaded && _touched) _picked ??= _active;
        _deviceOk = true;
      });
    });
    // Never stuck on the spinner: after a while, the password and email code show anyway.
    _loadTimeout = Timer(const Duration(seconds: 8), () {
      if (mounted && !_loaded) setState(() => _loaded = true);
    });
    final found = await Future.wait<Object?>([_hasPasskey, _pinState]);
    _loadTimeout?.cancel();
    if (!mounted) return;
    setState(() {
      _passkeyOk = found[0] == true;
      _pinValue = found[1] as AdminPinState?;
      _loaded = true;
    });
  }

  /// Not waited for: the preferences store answers in a moment, and the form never hangs on it.
  /// A late answer only moves an untouched form.
  Future<void> _loadRemembered() async {
    final remembered = await _readRemembered();
    if (remembered == null || !mounted) return;
    if (_loaded && (_picked != null || _touched)) return;
    setState(() => _remembered = remembered);
  }

  /// Something is typed or on its way: the form shouldn't change under the person.
  bool get _touched =>
      _busy ||
      _password.text.isNotEmpty ||
      _pin.text.isNotEmpty ||
      _code.text.isNotEmpty;

  Future<_Method?> _readRemembered() async {
    final id = _identity;
    if (id == null) return null;
    try {
      final name = (await SharedPreferences.getInstance()).getString(
        AdminAuthentication.methodPrefKey(id),
      );
      return _Method.values.where((m) => m.name == name).firstOrNull;
    } catch (_) {
      return null;
    }
  }

  void _remember(_Method method) {
    final id = _identity;
    if (id == null) return;
    unawaited(
      SharedPreferences.getInstance()
          .then(
            (p) =>
                p.setString(AdminAuthentication.methodPrefKey(id), method.name),
          )
          .then<void>((_) {}, onError: (_) {}),
    );
  }

  /// The ways this account can use here, strongest first.
  List<_Method> get _methods => [
    if (_deviceOk && !_deviceGone) _Method.device,
    if (_passkeyOk) _Method.passkey,
    if (widget.allowPin && _pinValue?.set_ == true) _Method.pin,
    _Method.password,
    _Method.email,
  ];

  /// The way on screen: the one picked, else a code already on its way, else the one this
  /// device remembers, else the strongest.
  _Method get _active {
    final methods = _methods;
    final picked = _picked;
    if (picked != null && methods.contains(picked)) return picked;
    if (_sent) return _Method.email;
    final remembered = _remembered;
    if (remembered != null && methods.contains(remembered)) return remembered;
    return methods.first;
  }

  void _pick(_Method method) {
    if (method == _active) return;
    setState(() {
      _picked = method;
      _error = null;
      _errorMethod = null;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_leftApp(state) && AdminSecurity.systemSheets == 0) {
      _password.clear();
      _code.clear();
      _twoStepCode.clear();
      _pin.clear();
    }
    if (state == AppLifecycleState.resumed) {
      _deviceReady.then((ready) {
        if (ready && mounted) _verifyWithDevice(auto: true);
      });
    }
  }

  /// Runs a system sheet without the console (or the app lock, D-375) counting it as time away.
  Future<T> _sheet<T>(Future<T> Function() run) async {
    late T out;
    Object? error;
    StackTrace? stack;
    await AdminSecurity.duringSystemSheet(
      () => ref.read(appLockProvider.notifier).prompt(() async {
        try {
          out = await run();
        } catch (e, s) {
          error = e;
          stack = s;
        }
        return UnlockResult.ok;
      }),
    );
    if (error != null) Error.throwWithStackTrace(error!, stack!);
    return out;
  }

  /// Face ID, a fingerprint or the passcode signs the server's challenge with this phone's key
  /// (D-453): a check the server records on this session, as both steps.
  Future<void> _verifyWithDevice({bool auto = false}) async {
    if (auto) {
      final last = AdminAuthentication.lastAutoDevice;
      if (_devicePrompted ||
          _busy ||
          (last != null && DateTime.now().difference(last) < AdminAuthentication.autoGap)) {
        return;
      }
      AdminAuthentication.lastAutoDevice = DateTime.now();
    }
    _devicePrompted = true;
    final reason = context.l10n.adminDeviceReason;
    await _run((_) async {
      try {
        final at = await _sheet(() => _keys.check(_backend, reason: reason));
        if (at == null) throw const _Closed();
        AdminSecurity.checked(at);
      } on DeviceKeyProblem catch (e) {
        if (e.gone && mounted) setState(() => _deviceGone = true);
        if (mounted) showMessage(context, e.message);
        // Said already, in the message.
        throw _Said(e);
      }
    }, verify: true, method: 'device', failed: _Method.device);
  }

  /// A passkey check the server records on this session (D-452): the session stays, and it counts
  /// as both steps.
  Future<void> _verifyWithPasskey() => _run((_) async {
    final at = await _sheet(_backend.adminPasskeyCheck);
    if (at == null) throw const _Closed();
    AdminSecurity.checked(at);
  }, verify: true, method: 'passkey', failed: _Method.passkey);

  Future<void> _verifyWithPin() async {
    final pin = _pin.text;
    if (pin.length != 6) return;
    var wrong = false;
    await _run((_) async {
      try {
        AdminSecurity.checked(await _backend.adminPinCheck(pin));
      } catch (_) {
        wrong = true;
        // The note below the boxes says what's left.
        throw const _Said(null);
      }
    }, verify: true, method: 'pin', failed: _Method.pin);
    if (!wrong || !mounted) return;
    // Show what's left, or that the PIN is off now.
    final state = await _loadPin();
    if (!mounted) return;
    setState(() {
      _pinState = Future.value(state);
      _pinValue = state;
      _pinInvalid = true;
      _pinNote = state == null || !state.set_
          ? context.l10n.adminPinTurnedOff
          : context.l10n.adminPinWrong(state.triesLeft);
    });
  }

  Future<void> _verifyPassword() async {
    if (_password.text.isEmpty) return;
    final first = _Method.password;
    await _run(
      (email) async {
        await _backend.signIn(email, _password.text);
        _firstStep = first;
      },
      verify: true,
      failed: _Method.password,
      failure: context.l10n.adminPasswordWrong,
    );
  }

  Future<void> _sendCode() => _run((email) async {
    await _backend.sendMagicLink(email);
    AdminSecurity.codeSentTo = _identity;
    AdminSecurity.codeSentAt = DateTime.now();
    if (mounted) {
      setState(() => _sent = true);
      _startResendTicker();
    }
  }, failed: _Method.email, failure: context.l10n.adminCodeSendFailed);

  Future<void> _verifyCode() async {
    if (_code.text.length != OtpCodeField.length) return;
    var wrong = false;
    await _run(
      (email) async {
        try {
          await _backend.verifyEmailCode(email, _code.text);
        } catch (_) {
          wrong = true;
          rethrow;
        }
        _firstStep = _Method.email;
      },
      verify: true,
      failed: _Method.email,
      failure: context.l10n.adminCodeWrong,
    );
    if (wrong && mounted) setState(() => _codeInvalid = true);
  }

  Future<void> _passTwoStep() async {
    if (_twoStepCode.text.length != OtpCodeField.length) return;
    var wrong = false;
    await _run((_) async {
      try {
        await _backend.passTwoStep(_twoStepCode.text);
      } catch (_) {
        wrong = true;
        rethrow;
      }
    }, verify: true, twoStep: true, failure: context.l10n.adminCodeWrong);
    if (wrong && mounted) setState(() => _twoStepInvalid = true);
  }

  /// Counts down to "Resend code" from when the last code went out.
  void _startResendTicker() {
    _resendTicker?.cancel();
    if (_resendLeft() <= Duration.zero) return;
    _resendTicker = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (_resendLeft() <= Duration.zero) t.cancel();
      setState(() {});
    });
  }

  Duration _resendLeft() {
    final at = AdminSecurity.codeSentAt;
    if (at == null) return Duration.zero;
    final left = AdminAuthentication.resendGap - DateTime.now().difference(at);
    return left.isNegative ? Duration.zero : left;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _resendTicker?.cancel();
    _loadTimeout?.cancel();
    _password.dispose();
    _code.dispose();
    _twoStepCode.dispose();
    _pin.dispose();
    AdminSecurity.authFormClosed();
    super.dispose();
  }

  void _done([String method = 'password']) {
    AdminSecurity.verified(_identity, method: method);
    AdminSecurity.codeSentTo = null;
    _remember(switch (method) {
      'device' => _Method.device,
      'passkey' => _Method.passkey,
      'pin' => _Method.pin,
      _ => _firstStep ?? _active,
    });
    widget.onVerified();
  }

  Future<void> _run(
    Future<void> Function(String email) action, {
    bool verify = false,
    String? method,
    _Method? failed,
    bool twoStep = false,
    String? failure,
  }) async {
    final generation = widget.generation;
    final email = _email;
    if (_busy || email == null || _identity == null) return;
    setState(() {
      _busy = true;
      _error = null;
      _errorMethod = null;
      _twoStepError = false;
    });
    String? problem;
    try {
      if (_backend.userId != _identity) throw StateError('Account changed');
      await action(email);
      if (_backend.userId != _identity) {
        await _backend.signOut();
        throw StateError('Account changed');
      }
      if (mounted && verify && generation == widget.generation) {
        // A passkey or PIN check is both steps; a password or emailed code still owes the code.
        if (method == null && _backend.twoStepCodeNeeded) {
          setState(() => _twoStep = true);
        } else {
          _done(method ?? 'password');
        }
      }
    } on _Closed {
      // The person closed the system sheet: nothing failed.
    } on _Said {
      // The message or the PIN note already says it.
    } on PasskeyProblem catch (e) {
      problem = e.message;
    } catch (_) {
      if (mounted) problem = failure ?? context.l10n.adminVerifyFailed;
    } finally {
      // Never leave a credential in a mounted form after a submission.
      if (mounted) {
        _password.clear();
        _code.clear();
        _twoStepCode.clear();
        _pin.clear();
        setState(() {
          _busy = false;
          if (problem != null) {
            _error = problem;
            _errorMethod = failed;
            _twoStepError = twoStep;
          }
        });
      }
    }
  }

  // --- drawing -------------------------------------------------------------------------------

  String _methodLabel(_Method m) {
    final l10n = context.l10n;
    return switch (m) {
      _Method.device => switch (defaultTargetPlatform) {
        TargetPlatform.iOS => l10n.adminMethodFaceId,
        TargetPlatform.macOS => l10n.adminMethodTouchId,
        TargetPlatform.android => l10n.adminMethodFingerprint,
        _ => l10n.adminMethodScreenLock,
      },
      _Method.passkey => l10n.adminMethodPasskey,
      _Method.pin => l10n.adminMethodPin,
      _Method.password => l10n.adminMethodPassword,
      _Method.email => l10n.adminMethodEmail,
    };
  }

  IconData _methodIcon(_Method m) => switch (m) {
    _Method.device =>
      defaultTargetPlatform == TargetPlatform.iOS
          ? LucideIcons.scanFace
          : LucideIcons.fingerprint,
    _Method.passkey => LucideIcons.keyRound,
    _Method.pin => LucideIcons.grid3x3,
    _Method.password => LucideIcons.lockKeyhole,
    _Method.email => LucideIcons.mail,
  };

  /// The problem from the last attempt, under the way that failed.
  Widget _errorLine({required bool show}) {
    final error = _error;
    return AnimatedSize(
      duration: AppMotion.of(context, AppMotion.fast),
      curve: AppMotion.curve,
      alignment: Alignment.topCenter,
      child: show && error != null
          ? Padding(
              padding: const EdgeInsets.only(top: AppSpace.xs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      LucideIcons.circleAlert,
                      size: 16,
                      color: context.colorScheme.error,
                    ),
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Expanded(
                    child: Text(
                      error,
                      key: const Key('adminAuthError'),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(width: double.infinity),
    );
  }

  Widget _methodError(_Method m) =>
      _errorLine(show: !_twoStepError && _errorMethod == m);

  /// A big button whose label turns into a small spinner while it works.
  Widget _bigButton({
    required Key key,
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
  }) {
    return FilledButton(
      key: key,
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
      onPressed: _busy ? null : onPressed,
      child: _busy
          ? const _ButtonSpinner()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: AppSpace.xs),
                Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
              ],
            ),
    );
  }

  /// A slim line under a code field while it's checked.
  Widget _busyLine() => SizedBox(
    height: 3,
    child: _busy
        ? ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: const LinearProgressIndicator(minHeight: 3),
          )
        : null,
  );

  Widget _hint(String text, {Key? key, TextAlign align = TextAlign.center}) =>
      Text(
        text,
        key: key,
        textAlign: align,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      );

  Widget _link(String text, {required Key key, required VoidCallback onTap}) =>
      Center(
        child: TextButton(
          key: key,
          onPressed: _busy ? null : onTap,
          child: Text(text, textAlign: TextAlign.center),
        ),
      );

  Widget _deviceView() {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _hint(l10n.adminDevicePrompt(deviceUnlockName(l10n))),
        const SizedBox(height: AppSpace.md),
        _bigButton(
          key: const Key('adminUnlockDevice'),
          icon: _methodIcon(_Method.device),
          label: l10n.adminUnlockDevice,
          onPressed: _verifyWithDevice,
        ),
        _methodError(_Method.device),
      ],
    );
  }

  Widget _passkeyView() {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _hint(l10n.adminPasskeyPrompt),
        const SizedBox(height: AppSpace.md),
        _bigButton(
          key: const Key('adminPasskey'),
          icon: LucideIcons.keyRound,
          label: l10n.adminVerifyPasskey,
          onPressed: _email == null ? null : _verifyWithPasskey,
        ),
        _methodError(_Method.passkey),
      ],
    );
  }

  Widget _pinNoteText() => Padding(
    padding: const EdgeInsets.only(top: AppSpace.xs),
    child: Text(
      _pinNote!,
      key: const Key('adminPinNote'),
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.colorScheme.error,
      ),
    ),
  );

  Widget _pinView() {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _hint(l10n.adminPinPrompt),
        const SizedBox(height: AppSpace.md),
        OtpCodeField(
          key: const Key('adminPin'),
          controller: _pin,
          obscure: true,
          enabled: !_busy,
          invalid: _pinInvalid,
          label: l10n.adminPinLabel,
          onCompleted: (_) => _verifyWithPin(),
        ),
        const SizedBox(height: AppSpace.xs),
        _busyLine(),
        if (_pinNote != null) _pinNoteText(),
        _methodError(_Method.pin),
        _link(
          l10n.adminPinForgot,
          key: const Key('adminPinForgot'),
          onTap: () => _pick(_Method.password),
        ),
      ],
    );
  }

  Widget _passwordView() {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          key: const Key('adminPassword'),
          controller: _password,
          enabled: !_busy,
          autofocus: _picked == _Method.password,
          obscureText: !_showPassword,
          enableSuggestions: false,
          autocorrect: false,
          autofillHints: const [AutofillHints.password],
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: l10n.password,
            prefixIcon: const Icon(LucideIcons.lockKeyhole, size: 18),
            suffixIcon: IconButton(
              key: const Key('adminPasswordShow'),
              tooltip: _showPassword
                  ? l10n.adminHidePassword
                  : l10n.adminShowPassword,
              onPressed: () => setState(() => _showPassword = !_showPassword),
              icon: Icon(
                _showPassword ? LucideIcons.eyeOff : LucideIcons.eye,
                size: 18,
              ),
            ),
          ),
          onSubmitted: (_) => _verifyPassword(),
        ),
        _methodError(_Method.password),
        const SizedBox(height: AppSpace.sm),
        _bigButton(
          key: const Key('adminUnlockPassword'),
          icon: LucideIcons.arrowRight,
          label: l10n.adminVerifyPassword,
          onPressed: _email == null ? null : _verifyPassword,
        ),
        _link(
          l10n.adminPasswordForgot,
          key: const Key('adminPasswordForgot'),
          onTap: () => _pick(_Method.email),
        ),
      ],
    );
  }

  Widget _emailView() {
    final l10n = context.l10n;
    final masked = adminMaskEmail(_email);
    if (!_sent) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _hint(l10n.adminEmailPrompt),
          const SizedBox(height: AppSpace.md),
          _bigButton(
            key: const Key('adminSendCode'),
            icon: LucideIcons.send,
            label: l10n.adminSendCodeTo(masked),
            onPressed: _email == null ? null : _sendCode,
          ),
          _methodError(_Method.email),
        ],
      );
    }
    final left = _resendLeft();
    final seconds = left.inSeconds + (left.inMilliseconds % 1000 > 0 ? 1 : 0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _hint(l10n.adminCodeSentTo(masked)),
        const SizedBox(height: AppSpace.md),
        OtpCodeField(
          key: const Key('adminCode'),
          controller: _code,
          enabled: !_busy,
          invalid: _codeInvalid,
          label: l10n.emailCodeLabel,
          onCompleted: (_) => _verifyCode(),
          onSubmitted: _verifyCode,
        ),
        const SizedBox(height: AppSpace.xs),
        _busyLine(),
        _methodError(_Method.email),
        const SizedBox(height: AppSpace.sm),
        _bigButton(
          key: const Key('adminUnlockCode'),
          icon: LucideIcons.arrowRight,
          label: l10n.adminVerifyCode,
          onPressed: _verifyCode,
        ),
        const SizedBox(height: AppSpace.xxs),
        if (seconds > 0)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpace.sm),
            child: _hint(
              l10n.adminResendIn(
                '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}',
              ),
              key: const Key('adminResendIn'),
            ),
          )
        else
          _link(
            l10n.adminResendCode,
            key: const Key('adminResendCode'),
            onTap: _sendCode,
          ),
      ],
    );
  }

  Widget _methodView(_Method m) => switch (m) {
    _Method.device => _deviceView(),
    _Method.passkey => _passkeyView(),
    _Method.pin => _pinView(),
    _Method.password => _passwordView(),
    _Method.email => _emailView(),
  };

  Widget _header(String title) {
    final scheme = context.colorScheme;
    final email = _email;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: scheme.primary.withValues(alpha: context.isDark ? 0.2 : 0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(LucideIcons.shieldCheck, size: 28, color: scheme.primary),
        ),
        const SizedBox(height: AppSpace.md),
        Semantics(
          header: true,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (email != null) ...[
          const SizedBox(height: AppSpace.xs),
          Container(
            key: const Key('adminAccountChip'),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.sm,
              vertical: AppSpace.xxs,
            ),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  LucideIcons.circleUser,
                  size: 14,
                  color: scheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    adminMaskEmail(email),
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _switcher(List<_Method> methods) {
    return _MethodSwitcher(
      methods: methods,
      selected: _active,
      label: _methodLabel,
      icon: _methodIcon,
      onSelected: _busy ? null : _pick,
    );
  }

  /// The two-step and passkey tips, as one card that can be closed for this session.
  Widget _tips() {
    return FutureBuilder<List<bool>>(
      future: Future.wait([_hasTwoStep, _suggestPasskey]),
      builder: (context, snap) {
        if (AdminAuthentication.tipDismissed || !snap.hasData) {
          return const SizedBox.shrink();
        }
        final twoStepTip = snap.data![0] == false;
        final passkeyTip = snap.data![1] == true;
        if (!twoStepTip && !passkeyTip) return const SizedBox.shrink();
        final scheme = context.colorScheme;
        final style = context.textTheme.bodySmall?.copyWith(
          color: scheme.onSurfaceVariant,
        );
        return Padding(
          padding: const EdgeInsets.only(top: AppSpace.md),
          child: Container(
            key: const Key('adminTipCard'),
            padding: const EdgeInsets.fromLTRB(
              AppSpace.sm,
              AppSpace.sm,
              AppSpace.xxs,
              AppSpace.sm,
            ),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHigh.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(AppRadius.tile),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Icon(
                    LucideIcons.lightbulb,
                    size: 16,
                    color: scheme.primary,
                  ),
                ),
                const SizedBox(width: AppSpace.xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // An email inbox left open on the same device can unlock with a code; an
                      // authenticator can't be read from here.
                      if (twoStepTip)
                        Text(
                          context.l10n.adminTwoStepTip,
                          key: const Key('adminTwoStepTip'),
                          style: style,
                        ),
                      if (twoStepTip && passkeyTip)
                        const SizedBox(height: AppSpace.xs),
                      if (passkeyTip)
                        Text(
                          context.l10n.adminPasskeyTip,
                          key: const Key('adminPasskeyTip'),
                          style: style,
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    key: const Key('adminTipDismiss'),
                    padding: EdgeInsets.zero,
                    iconSize: 16,
                    tooltip: context.l10n.dismiss,
                    onPressed: () =>
                        setState(() => AdminAuthentication.tipDismissed = true),
                    icon: const Icon(LucideIcons.x),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _footer() {
    final scheme = context.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.timer, size: 14, color: scheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              context.l10n.adminLockFooter,
              key: const Key('adminLockFooter'),
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _twoStepView() {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final first = switch (_firstStep) {
      _Method.password => l10n.adminMethodPassword,
      _Method.email => l10n.adminStepEmailCode,
      _ => l10n.adminStepSignedIn,
    };
    final small = context.textTheme.bodySmall;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.adminStepOf(2, 2),
          key: const Key('adminTwoStepStep'),
          textAlign: TextAlign.center,
          style: context.textTheme.labelLarge?.copyWith(
            color: scheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpace.xxs),
        _hint(l10n.adminTwoStepHelp),
        const SizedBox(height: AppSpace.md),
        OtpCodeField(
          key: const Key('adminTwoStepCode'),
          controller: _twoStepCode,
          enabled: !_busy,
          invalid: _twoStepInvalid,
          label: l10n.twoStepCode,
          onCompleted: (_) => _passTwoStep(),
          onSubmitted: _passTwoStep,
        ),
        const SizedBox(height: AppSpace.xs),
        _busyLine(),
        _errorLine(show: _twoStepError),
        const SizedBox(height: AppSpace.sm),
        _bigButton(
          key: const Key('adminVerifyTwoStep'),
          icon: LucideIcons.arrowRight,
          label: l10n.twoStepVerify,
          onPressed: _passTwoStep,
        ),
        const SizedBox(height: AppSpace.sm),
        // Where this is: the first step done, the code now.
        Wrap(
          key: const Key('adminTwoStepTrail'),
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 6,
          runSpacing: 4,
          children: [
            Icon(LucideIcons.circleCheck, size: 14, color: context.appColors.positive),
            Text(first, style: small?.copyWith(color: scheme.onSurfaceVariant)),
            Icon(LucideIcons.arrowRight, size: 12, color: scheme.onSurfaceVariant),
            Text(
              l10n.adminStepAuthenticator,
              style: small?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        // A passkey is both steps (D-452).
        if (_passkeyOk)
          Padding(
            padding: const EdgeInsets.only(top: AppSpace.xs),
            child: Center(
              child: TextButton.icon(
                key: const Key('adminTwoStepPasskey'),
                onPressed: _busy ? null : _verifyWithPasskey,
                icon: const Icon(LucideIcons.keyRound, size: 18),
                label: Text(l10n.adminVerifyPasskey),
              ),
            ),
          ),
        _errorLine(show: !_twoStepError && _errorMethod == _Method.passkey),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final compact = widget.compact;
    final help =
        widget.help ??
        (widget.sensitive ? l10n.adminConfirmActionHelp : l10n.adminLockedHelp);
    final Widget body;
    if (_twoStep) {
      body = _twoStepView();
    } else if (!_loaded) {
      // A moment while this account's ways in are looked up.
      body = const SizedBox(
        key: Key('adminMethodsLoading'),
        height: 120,
        child: Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
        ),
      );
    } else {
      final methods = _methods;
      final active = _active;
      body = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (methods.length > 1) ...[
            _switcher(methods),
            const SizedBox(height: AppSpace.lg),
          ],
          // A wrong PIN that turned it off: say so above whichever way comes next.
          if (_pinNote != null && active != _Method.pin) ...[
            _pinNoteText(),
            const SizedBox(height: AppSpace.sm),
          ],
          AnimatedSize(
            duration: AppMotion.of(context, AppMotion.fast),
            curve: AppMotion.curve,
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: AppMotion.of(context, AppMotion.fast),
              switchInCurve: AppMotion.curve,
              switchOutCurve: AppMotion.curve,
              layoutBuilder: (current, previous) => Stack(
                alignment: Alignment.topCenter,
                children: [...previous, ?current],
              ),
              child: KeyedSubtree(
                key: ValueKey(active),
                child: _methodView(active),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!compact) ...[
          _header(widget.sensitive ? l10n.adminConfirmTitle : l10n.adminUnlockTitle),
          // At the second step, the step itself says what's next.
          if (!_twoStep) ...[
            const SizedBox(height: AppSpace.xs),
            _hint(help),
          ],
          const SizedBox(height: AppSpace.xl),
        ] else ...[
          _hint(help, align: TextAlign.start),
          const SizedBox(height: AppSpace.md),
        ],
        body,
        if (!compact) ...[_tips(), _footer()],
      ],
    );
  }
}

/// The ways to verify, as one sliding switch in the look of `AppSegmentedControl`, with a Key on
/// each segment ('adminMethod-pin'). Narrow, it keeps the icons and drops the labels (which stay
/// as tooltips and for screen readers).
class _MethodSwitcher extends StatelessWidget {
  const _MethodSwitcher({
    required this.methods,
    required this.selected,
    required this.label,
    required this.icon,
    required this.onSelected,
  });

  final List<_Method> methods;
  final _Method selected;
  final String Function(_Method) label;
  final IconData Function(_Method) icon;
  final ValueChanged<_Method>? onSelected;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final dark = context.isDark;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final labels = width >= 360 && width / methods.length >= 72;
        return Semantics(
          label: context.l10n.adminMethodsLabel,
          container: true,
          child: SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl<_Method>(
              groupValue: selected,
              onValueChanged: (v) {
                final changed = onSelected;
                if (v == null || changed == null) return;
                HapticsHelper.selection();
                changed(v);
              },
              backgroundColor: scheme.surfaceContainerHigh,
              thumbColor: dark ? scheme.surfaceContainerHighest : Colors.white,
              children: {
                for (final m in methods)
                  m: _segment(context, m, labels: labels),
              },
            ),
          ),
        );
      },
    );
  }

  Widget _segment(BuildContext context, _Method m, {required bool labels}) {
    final scheme = context.colorScheme;
    final on = m == selected;
    final color = on ? scheme.primary : scheme.onSurfaceVariant;
    final text = label(m);
    final content = Padding(
      key: Key('adminMethod-${m.name}'),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon(m), size: 16, color: color),
          if (labels) ...[
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: on ? FontWeight.w700 : FontWeight.w500,
                  color: on ? scheme.primary : scheme.onSurface,
                ),
              ),
            ),
          ],
        ],
      ),
    );
    return Semantics(
      label: text,
      selected: on,
      button: true,
      excludeSemantics: !labels,
      child: labels ? content : Tooltip(message: text, child: content),
    );
  }
}

/// A small spinner in place of a button's label while it works.
class _ButtonSpinner extends StatelessWidget {
  const _ButtonSpinner();

  @override
  Widget build(BuildContext context) => const SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(strokeWidth: 2.2),
  );
}

/// The person closed a system sheet.
class _Closed implements Exception {
  const _Closed();
}

/// A failure the form already explained (a snackbar, the PIN note): no second line for it.
class _Said implements Exception {
  const _Said(this.cause);
  final Object? cause;
}
