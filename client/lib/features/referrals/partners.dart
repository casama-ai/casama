import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/link_browser.dart';
import '../../core/partner_code.dart';
import '../../core/providers.dart';
import '../../core/share.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';

/// Casama Partners (D-543, docs/CREATOR-PROGRAM-PLAN.md): the creator who sent this person, whether
/// they can still enter a creator code, and their own code when they are a partner. Null signed
/// out, when it couldn't load, or on a server without it.
final partnerMeProvider = FutureProvider<PartnerMe?>((ref) async {
  if (ref.watch(signedInProvider).value != true) return null;
  try {
    return await ref.watch(backendProvider).partnerMe();
  } catch (_) {
    return null;
  }
});

/// A creator's code from a link or Google Play, waiting for sign-in ([PartnerCodeStore]).
class PendingPartner extends Notifier<PendingPartnerCode?> {
  @override
  PendingPartnerCode? build() {
    void reload() => PartnerCodeStore.read().then((v) {
      if (ref.mounted) state = v;
    });
    PartnerCodeStore.changes.addListener(reload);
    ref.onDispose(() => PartnerCodeStore.changes.removeListener(reload));
    reload();
    return null;
  }

  /// Keeps a code from a casama.ai/c/ link or `?partner=` (replacing an older one).
  Future<void> set(String raw, {String via = 'link_web'}) => PartnerCodeStore.save(raw, via: via);
}

final pendingPartnerProvider = NotifierProvider<PendingPartner, PendingPartnerCode?>(PendingPartner.new);

/// Whether the server's answer settles a claim for good (the code doesn't exist, the person can't
/// use one, already did), so the pending code is dropped. Offline, a server error, signed-out or
/// too many tries keep it for the next sign-in or launch.
bool partnerClaimIsFinal(Object error) {
  if (error is! DioException) return false;
  final status = error.response?.statusCode;
  if (status == null) return false;
  return status >= 400 && status < 500 && status != 401 && status != 408 && status != 429;
}

/// Claims a pending creator code once the person is signed in, one try at a time. Kept alive by
/// the app (app.dart); never shows anything: Settings → Invite Friends shows the result.
final partnerAutoClaimProvider = Provider<void>((ref) {
  var running = false;
  Future<void> run() async {
    if (running || ref.read(signedInProvider).value != true) return;
    final pending = ref.read(pendingPartnerProvider);
    if (pending == null) return;
    running = true;
    try {
      await ref.read(backendProvider).claimPartner(pending.code, via: pending.via);
      await PartnerCodeStore.finish(pending.code);
      if (ref.mounted) ref.invalidate(partnerMeProvider);
    } catch (e) {
      if (partnerClaimIsFinal(e)) await PartnerCodeStore.finish(pending.code);
    } finally {
      running = false;
    }
  }

  ref.listen(signedInProvider, (_, next) {
    if (next.value == true) unawaited(run());
  });
  ref.listen(pendingPartnerProvider, (_, next) {
    if (next != null) unawaited(run());
  });
  // Both may already be known when this starts (a saved session, a code read earlier).
  unawaited(Future.microtask(run));
});

/// A friendly line for a refused creator code (the server's codes in routes/partners.ts).
String partnerErrorText(BuildContext context, Object error) {
  final l10n = context.l10n;
  return switch (problemOf(error)?.code) {
    'partner_not_found' => l10n.partnerErrNotFound,
    'partner_own_code' => l10n.partnerErrOwnCode,
    'partner_window_closed' => l10n.partnerErrWindowClosed,
    'partner_already_paying' => l10n.partnerErrAlreadyPaying,
    'partner_already' => l10n.partnerErrAlready,
    'partner_referred' => l10n.partnerErrReferred,
    'partners_off' => l10n.partnerErrOff,
    _ => errorText(context, error),
  };
}

/// Settings → Invite Friends, for someone who is a partner: their creator code and link, and the
/// partner portal (earnings and payouts live there, not in the app, CREATOR-PROGRAM-PLAN §7.9).
class PartnerCodeCard extends StatelessWidget {
  const PartnerCodeCard({super.key, required this.partner});
  final PartnerMePartner partner;

  Future<void> _copy(BuildContext context, String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
    } catch (_) {
      return;
    }
    HapticFeedback.selectionClick();
    if (context.mounted) showMessage(context, context.l10n.inviteFriendsCopied);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    return AppCard(
      key: const Key('partnerCodeCard'),
      padding: const EdgeInsets.all(AppSpace.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.megaphone, size: 18, color: scheme.primary),
              const SizedBox(width: AppSpace.xs),
              Expanded(
                child: Text(
                  l10n.partnerYourCode,
                  style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              if (partner.status != 'active')
                Text(
                  l10n.partnerPaused,
                  style: context.textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          InkWell(
            key: const Key('partnerCode'),
            borderRadius: AppRadius.tileAll,
            onTap: () => _copy(context, partner.code),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpace.xxs),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      partner.code,
                      style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 2),
                    ),
                  ),
                  const SizedBox(width: AppSpace.xs),
                  Icon(LucideIcons.copy, size: 16, color: scheme.onSurfaceVariant),
                ],
              ),
            ),
          ),
          Text(partner.link, style: context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.xs,
            runSpacing: AppSpace.xs,
            children: [
              OutlinedButton.icon(
                key: const Key('partnerCopyLink'),
                onPressed: () => _copy(context, partner.link),
                icon: const Icon(LucideIcons.link, size: 16),
                label: Text(l10n.inviteFriendsCopyLink),
              ),
              OutlinedButton.icon(
                key: const Key('partnerShare'),
                onPressed: () =>
                    shareText(l10n.partnerShareText(partner.link, partner.code), origin: shareOrigin(context)),
                icon: const Icon(LucideIcons.share2, size: 16),
                label: Text(l10n.inviteFriendsShare),
              ),
              FilledButton.tonalIcon(
                key: const Key('partnerPortal'),
                onPressed: () {
                  final uri = Uri.tryParse(partner.portalUrl);
                  if (uri != null) unawaited(openWebLink(uri));
                },
                icon: const Icon(LucideIcons.externalLink, size: 16),
                label: Text(l10n.partnerPortal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Settings → Invite Friends, for everyone who isn't a partner yet: the creator program's page.
class PartnerProgramTile extends StatelessWidget {
  const PartnerProgramTile({super.key});

  static final _page = Uri.parse('https://casama.ai/partners');

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GroupedCard(
      children: [
        GroupedTile(
          key: const Key('partnerProgramTile'),
          icon: LucideIcons.megaphone,
          title: l10n.partnerProgramTitle,
          subtitle: l10n.partnerProgramSubtitle,
          trailing: const Icon(LucideIcons.externalLink, size: 16),
          onTap: () => unawaited(openWebLink(_page)),
        ),
      ],
    );
  }
}

