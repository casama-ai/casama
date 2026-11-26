import 'dart:async';

import 'package:material_ui/material_ui.dart';

import '../l10n/generated/app_localizations.dart';

/// The engine's license errors on a self-hosted server (docs/SELF-HOSTING-PLAN.md §11.6). They
/// answer HTTP 402 like a plan limit, but they are about the server's license, not a Cloud plan:
/// no paywall, just plain words.
const licenseErrorCodes = {'license_required', 'license_seats', 'license_expired'};

/// Where business licenses are sold.
const partnersEmail = 'partners@casama.ai';

/// Bumped when a call fails with a license error, so the server's license state is read again
/// (the setup cover or a banner then shows).
final licenseRecheck = ValueNotifier<int>(0);

/// Plain words for a license error [code], or null for any other code.
String? licenseErrorMessage(BuildContext context, String? code) {
  final l10n = AppLocalizations.of(context);
  final text = switch (code) {
    'license_required' => l10n.licenseErrorRequired,
    'license_seats' => l10n.licenseErrorSeats(partnersEmail),
    'license_expired' => l10n.licenseErrorExpired,
    _ => null,
  };
  if (text != null) _scheduleRecheck();
  return text;
}

var _recheckPending = false;

void _scheduleRecheck() {
  if (_recheckPending) return;
  _recheckPending = true;
  scheduleMicrotask(() {
    _recheckPending = false;
    licenseRecheck.value++;
  });
}
