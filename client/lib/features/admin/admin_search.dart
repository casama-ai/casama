import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter/rendering.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../app_browser/app_browser_flag.dart' show kAppBrowserCode;
import 'admin_nav.dart';

/// One thing the console search can find: a section, or a setting inside one. A setting with an
/// [anchor] scrolls into view and flashes when it opens ([AdminAnchor]).
class AdminPlace {
  const AdminPlace({
    required this.id,
    required this.section,
    required this.icon,
    required this.title,
    this.subtitle,
    this.anchor,
    this.words = '',
  });

  /// Unique; a section's own place uses the section's id (`adminPick-<id>` in tests).
  final String id;
  final AdminSection section;
  final IconData icon;
  final String title;
  final String? subtitle;

  /// The [AdminAnchor] to scroll to once the section is open.
  final String? anchor;

  /// Other words people type for it. English, like the settings screen's search words.
  final String words;

  bool get isSection => anchor == null;
}

/// Anchor ids, shared by the index below and the [AdminAnchor]s in the sections.
abstract final class AdminAnchors {
  static const capacity = 'overview.capacity';
  static const inactivity = 'overview.inactivity';
  static const plans = 'pricing.plans';
  static const packs = 'pricing.packs';
  static const markup = 'pricing.markup';
  static const gate = 'waitlist.gate';
  static const campaigns = 'waitlist.campaigns';
  static const waitlistPeople = 'waitlist.people';
  static const health = 'services.health';
  static const models = 'services.models';
  static const connections = 'services.connections';
  static const appSettings = 'services.appSettings';
  static const appBrowser = 'services.appBrowser';
  static const advanced = 'services.advanced';
  static const reservedNames = 'mail.reserved';
  static const screenLock = 'security.device';
  static const pin = 'security.pin';
}

/// Everything the search covers, in the console's order: each section, then its settings.
List<AdminPlace> adminPlaces(BuildContext context, List<AdminSection> sections) {
  final l10n = context.l10n;
  AdminPlace setting(
    String id,
    AdminSection s,
    IconData icon,
    String title,
    String anchor, {
    String? subtitle,
    String words = '',
  }) => AdminPlace(id: id, section: s, icon: icon, title: title, subtitle: subtitle, anchor: anchor, words: words);
  final settings = <AdminSection, List<AdminPlace>>{
    AdminSection.overview: [
      setting(
        'capacity',
        AdminSection.overview,
        LucideIcons.hardDrive,
        l10n.adminCapacityTitle,
        AdminAnchors.capacity,
        words: 'disk memory cpu server full storage space',
      ),
      setting(
        'inactivity',
        AdminSection.overview,
        LucideIcons.moon,
        l10n.adminInactivityTitle,
        AdminAnchors.inactivity,
        subtitle: l10n.adminInactivityRestHelp,
        words: 'inactive dormant rest pause delete cleanup idle accounts',
      ),
    ],
    AdminSection.pricing: [
      setting(
        'plans',
        AdminSection.pricing,
        LucideIcons.gem,
        l10n.plans,
        AdminAnchors.plans,
        words: 'subscription plus pro max price paywall popular default on sale',
      ),
      setting(
        'packs',
        AdminSection.pricing,
        LucideIcons.creditCard,
        l10n.adminCreditPacks,
        AdminAnchors.packs,
        words: 'credits top up buy',
      ),
      setting(
        'markup',
        AdminSection.pricing,
        LucideIcons.percent,
        l10n.adminMarkup,
        AdminAnchors.markup,
        subtitle: l10n.adminMarkupHelp,
        words: 'margin multiplier usage price',
      ),
      setting(
        'priceTables',
        AdminSection.pricing,
        LucideIcons.receipt,
        l10n.adminCostTables,
        AdminAnchors.markup,
        subtitle: l10n.adminCostTablesHelp,
        words: 'voice call computer media domain prices json',
      ),
    ],
    AdminSection.waitlist: [
      setting(
        'gate',
        AdminSection.waitlist,
        LucideIcons.lock,
        l10n.adminGateInviteOnly,
        AdminAnchors.gate,
        subtitle: l10n.adminGate,
        words: 'signup sign-up gate closed open invite only waitlist registration',
      ),
      setting(
        'gateOpensAt',
        AdminSection.waitlist,
        LucideIcons.calendarClock,
        l10n.adminGateOpensAt,
        AdminAnchors.gate,
        subtitle: l10n.adminGate,
        words: 'open date launch schedule',
      ),
      setting(
        'gateInvites',
        AdminSection.waitlist,
        LucideIcons.ticket,
        l10n.adminGateInvites,
        AdminAnchors.gate,
        subtitle: l10n.adminGate,
        words: 'invite codes friends',
      ),
      setting(
        'gateDailyAdmit',
        AdminSection.waitlist,
        LucideIcons.calendarCheck,
        l10n.adminGateDailyAdmit,
        AdminAnchors.gate,
        subtitle: l10n.adminGate,
        words: 'admit batch per day let in',
      ),
      setting(
        'gateDailyEmails',
        AdminSection.waitlist,
        LucideIcons.mail,
        l10n.adminGateDailyEmails,
        AdminAnchors.gate,
        subtitle: l10n.adminGate,
        words: 'email limit cap per day',
      ),
      setting(
        'gateBatchHour',
        AdminSection.waitlist,
        LucideIcons.clock,
        l10n.adminGateBatchHour,
        AdminAnchors.gate,
        subtitle: l10n.adminGate,
        words: 'hour time utc batch',
      ),
      setting(
        'campaigns',
        AdminSection.waitlist,
        LucideIcons.ticket,
        l10n.adminCampaigns,
        AdminAnchors.campaigns,
        words: 'campaign codes promo invite link',
      ),
      setting(
        'waitlistPeople',
        AdminSection.waitlist,
        LucideIcons.users,
        l10n.adminWaitlistPeople,
        AdminAnchors.waitlistPeople,
        words: 'waiting queued admitted joined email list',
      ),
    ],
    AdminSection.services: [
      setting(
        'health',
        AdminSection.services,
        LucideIcons.activity,
        l10n.adminServicesHealth,
        AdminAnchors.health,
        words: 'status down up ok uptime',
      ),
      setting(
        'cloudModels',
        AdminSection.services,
        LucideIcons.cpu,
        l10n.cloudModelsTitle,
        AdminAnchors.models,
        subtitle: l10n.adminServicesModels,
        words: 'openrouter llm ai default model',
      ),
      setting(
        'modelAccess',
        AdminSection.services,
        LucideIcons.keyRound,
        l10n.adminModelAccessTitle,
        AdminAnchors.models,
        subtitle: l10n.adminServicesModels,
        words: 'models plan allow block',
      ),
      setting(
        'ownProviders',
        AdminSection.services,
        LucideIcons.key,
        l10n.adminOwnProviders,
        AdminAnchors.models,
        subtitle: l10n.adminServicesModels,
        words: 'own keys byok api key provider',
      ),
      setting(
        'connections',
        AdminSection.services,
        LucideIcons.plug,
        l10n.connectionsTitle,
        AdminAnchors.connections,
        words: 'composio integrations oauth apps',
      ),
      setting(
        'composio',
        AdminSection.services,
        LucideIcons.plug,
        l10n.connectionsServerComposio,
        AdminAnchors.connections,
        subtitle: l10n.connectionsTitle,
        words: 'composio key',
      ),
      setting(
        'ownAccounts',
        AdminSection.services,
        LucideIcons.userCog,
        l10n.connectionsOwnAccounts,
        AdminAnchors.connections,
        subtitle: l10n.connectionsTitle,
        words: 'composio own account',
      ),
      setting(
        'google',
        AdminSection.services,
        LucideIcons.mail,
        l10n.connectionsGoogleTitle,
        AdminAnchors.connections,
        subtitle: l10n.connectionsTitle,
        words: 'gmail google calendar drive direct oauth',
      ),
      setting(
        'appSettings',
        AdminSection.services,
        LucideIcons.slidersHorizontal,
        l10n.adminAppSettings,
        AdminAnchors.appSettings,
        subtitle: l10n.adminAppSettingsHelp,
        words: 'remote config flags switches json',
      ),
      setting(
        'emailCopy',
        AdminSection.services,
        LucideIcons.mail,
        l10n.adminEmailCopy,
        AdminAnchors.appSettings,
        subtitle: l10n.adminEmailCopyHelp,
        words: 'welcome email text digest copy wording',
      ),
      if (kAppBrowserCode)
        setting(
          'appBrowser',
          AdminSection.services,
          LucideIcons.globe,
          l10n.adminAppBrowser,
          AdminAnchors.appBrowser,
          words: 'browser web phone stage',
        ),
      setting(
        'modelCatalog',
        AdminSection.services,
        LucideIcons.bookOpen,
        l10n.adminModelCatalog,
        AdminAnchors.advanced,
        subtitle: l10n.adminModelCatalogHelp,
        words: 'models prices image json featured',
      ),
      setting(
        'guardSites',
        AdminSection.services,
        LucideIcons.shieldCheck,
        l10n.adminGuardSites,
        AdminAnchors.advanced,
        subtitle: l10n.adminGuardSitesHelp,
        words: 'block blocked sites browser guard json',
      ),
      setting(
        'callLimits',
        AdminSection.services,
        LucideIcons.phoneCall,
        l10n.adminCallLimits,
        AdminAnchors.advanced,
        subtitle: l10n.adminCallLimitsHelp,
        words: 'voice call silence ring length json',
      ),
      setting(
        'hapticsLab',
        AdminSection.services,
        LucideIcons.vibrate,
        'Haptics Lab',
        AdminAnchors.advanced,
        words: 'haptics vibration taptic trackpad signatures tune lab',
      ),
    ],
    AdminSection.mail: [
      setting(
        'reservedNames',
        AdminSection.mail,
        LucideIcons.shieldAlert,
        l10n.adminMailReserved,
        AdminAnchors.reservedNames,
        words: 'reserved blocked addresses names email bot',
      ),
    ],
    AdminSection.security: [
      setting(
        'screenLock',
        AdminSection.security,
        LucideIcons.scanFace,
        l10n.adminDeviceTitle,
        AdminAnchors.screenLock,
        subtitle: l10n.adminDeviceHelp,
        words: 'passkey face id touch fingerprint biometrics device',
      ),
      setting(
        'pin',
        AdminSection.security,
        LucideIcons.grid3x3,
        l10n.adminPinTitle,
        AdminAnchors.pin,
        subtitle: l10n.adminPinHelp,
        words: 'pin code unlock lock password',
      ),
    ],
  };
  // What each section holds that has no row of its own here.
  const sectionWords = {
    AdminSection.overview: 'home dashboard attention stats version update',
    AdminSection.growth: 'charts signups retention revenue live online users analytics funnel',
    AdminSection.costs: 'spend spending money usage ledger margin charts vendors period filters',
    AdminSection.pricing: 'prices billing',
    AdminSection.vendors: 'balance alerts limits openrouter providers keys',
    AdminSection.resets: 'saved resets limits campaign grant gift',
    AdminSection.partners: 'affiliates referrals commissions payouts codes tolt',
    AdminSection.selfhost: 'self-hosted licenses keys business personal trial servers revoke',
    AdminSection.users: 'accounts people email suspend ban search',
    AdminSection.workspaces: 'organizations orgs teams quotas limits suspend',
    AdminSection.waitlist: 'invites signups',
    AdminSection.support: 'tickets help requests',
    AdminSection.reports: 'flagged reported content take down moderation',
    AdminSection.testimonials: 'quotes reviews',
    AdminSection.abuse: 'spam fraud signals blocked',
    AdminSection.services: 'models integrations settings config',
    AdminSection.domains: 'dns registrar sites orders balance',
    AdminSection.mail: 'email addresses bot inbox sending',
    AdminSection.security: 'lock unlock',
  };
  return [
    for (final s in sections) ...[
      AdminPlace(
        id: s.id,
        section: s,
        icon: s.icon,
        title: s.label(context),
        subtitle: s.description(context),
        words: sectionWords[s] ?? '',
      ),
      ...?settings[s],
    ],
  ];
}

/// Every word typed must appear in a place's title, subtitle, section name or extra words, like the
/// settings screen's search. Titles that start with the query come first, then titles that contain
/// it, then the rest, each in the console's order. Settings rank above their section's own row when
/// they match by title, so "pin" finds Admin PIN before Security.
final _wordBreak = RegExp(r'[^\p{L}\p{N}]+', unicode: true);

List<AdminPlace> searchAdminPlaces(BuildContext context, List<AdminPlace> places, String query) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return places;
  final tokens = q.split(RegExp(r'\s+'));
  int? rank(AdminPlace p) {
    final title = p.title.toLowerCase();
    // Each word typed must start a word here, so "pin" finds Admin PIN, not "spinning".
    final words = '$title ${p.subtitle ?? ''} ${p.section.label(context)} ${p.words}'.toLowerCase().split(_wordBreak);
    if (!tokens.every((t) => words.any((w) => w.startsWith(t)))) return null;
    if (title.startsWith(q)) return 0;
    if (title.contains(q)) return 1;
    return 2;
  }

  final ranked = [
    for (final (i, p) in places.indexed)
      if (rank(p) case final r?) (r, i, p),
  ]..sort((a, b) => a.$1 != b.$1 ? a.$1.compareTo(b.$1) : a.$2.compareTo(b.$2));
  return [for (final r in ranked) r.$3];
}

/// The search box above the console's section list.
class AdminConsoleSearchField extends StatelessWidget {
  const AdminConsoleSearchField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.onChanged,
    this.onSubmitted,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextField(
      key: const Key('adminConsoleSearch'),
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: l10n.adminSearchHint,
        isDense: true,
        prefixIcon: const Icon(LucideIcons.search, size: 18),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                key: const Key('adminConsoleSearchClear'),
                tooltip: l10n.searchClear,
                icon: const Icon(LucideIcons.x, size: 16),
                onPressed: () {
                  controller.clear();
                  onChanged('');
                },
              ),
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}

/// The places that match, as rows: the setting's name with its section under it.
class AdminSearchResults extends StatelessWidget {
  const AdminSearchResults({
    super.key,
    required this.matches,
    required this.query,
    required this.onOpen,
    this.dense = false,
  });
  final List<AdminPlace> matches;
  final String query;
  final ValueChanged<AdminPlace> onOpen;

  /// The narrow side list: no card around the rows.
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (matches.isEmpty) {
      return Padding(
        key: const Key('adminSearchNone'),
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.xl),
        child: Text(
          l10n.adminSearchNone(query.trim()),
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
        ),
      );
    }
    String sub(AdminPlace p) => p.isSection ? (p.subtitle ?? '') : p.section.label(context);
    if (dense) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final p in matches)
            ListTile(
              key: Key('adminFind-${p.id}'),
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSpace.sm),
              shape: RoundedRectangleBorder(borderRadius: AppRadius.rowAll),
              leading: Icon(p.icon, size: 18),
              minLeadingWidth: 18,
              title: Text(
                p.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: p.isSection ? FontWeight.w700 : FontWeight.w500),
              ),
              subtitle: Text(sub(p), maxLines: 1, overflow: TextOverflow.ellipsis),
              onTap: () => onOpen(p),
            ),
        ],
      );
    }
    return GroupedCard(
      children: [
        for (final p in matches)
          GroupedTile(
            key: Key('adminFind-${p.id}'),
            icon: p.icon,
            title: p.title,
            subtitle: sub(p),
            onTap: () => onOpen(p),
          ),
      ],
    );
  }
}

/// Marks a setting the search can jump to. When the console's target is this anchor, it scrolls
/// into view with room for its heading above, flashes once, and clears the target.
class AdminAnchor extends StatefulWidget {
  const AdminAnchor({super.key, required this.id, required this.child});
  final String id;
  final Widget child;

  @override
  State<AdminAnchor> createState() => _AdminAnchorState();
}

class _AdminAnchorState extends State<AdminAnchor> {
  ValueNotifier<String?>? _target;
  bool _flash = false;
  bool _revealing = false;
  Timer? _flashTimer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final target = AdminNav.maybeOf(context)?.target;
    if (target != _target) {
      _target?.removeListener(_check);
      _target = target?..addListener(_check);
      _check();
    }
  }

  @override
  void dispose() {
    _flashTimer?.cancel();
    _target?.removeListener(_check);
    super.dispose();
  }

  void _check() {
    if (_target?.value != widget.id) return;
    SchedulerBinding.instance.addPostFrameCallback((_) => _reveal());
  }

  Future<void> _reveal() async {
    final target = _target;
    if (_revealing || !mounted || target == null || target.value != widget.id) return;
    _revealing = true;
    try {
      // Cards above it may still be loading and grow, so follow it for up to two seconds of
      // frames, and stop as soon as the person scrolls.
      double? landed;
      for (var frame = 0; frame < 120; frame++) {
        if (!mounted) return;
        final box = context.findRenderObject();
        final scrollable = Scrollable.maybeOf(context);
        final viewport = box == null ? null : RenderAbstractViewport.maybeOf(box);
        if (box == null || scrollable == null || viewport == null) return;
        final position = scrollable.position;
        if (landed != null && (position.pixels - landed).abs() > 1) break;
        // Leave the section heading above the card in view.
        final offset = (viewport.getOffsetToReveal(box, 0).offset - 56).clamp(
          position.minScrollExtent,
          position.maxScrollExtent,
        );
        if ((offset - position.pixels).abs() > 1) {
          final duration = AppMotion.of(context, AppMotion.duration);
          if (landed == null && duration > Duration.zero) {
            await position.animateTo(offset, duration: duration, curve: AppMotion.curve);
          } else {
            position.jumpTo(offset);
          }
        }
        landed = position.pixels;
        await SchedulerBinding.instance.endOfFrame;
      }
    } finally {
      _revealing = false;
      // Only now: the list keeps every row built until the scroll has landed.
      if (target.value == widget.id) target.value = null;
    }
    if (!mounted) return;
    setState(() => _flash = true);
    _flashTimer?.cancel();
    _flashTimer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _flash = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = context.colorScheme.primary;
    return AnimatedContainer(
      duration: AppMotion.of(context, AppMotion.duration),
      curve: AppMotion.curve,
      foregroundDecoration: BoxDecoration(
        borderRadius: AppRadius.cardAll,
        border: Border.all(color: _flash ? primary.withValues(alpha: 0.7) : primary.withValues(alpha: 0), width: 2),
      ),
      child: widget.child,
    );
  }
}
