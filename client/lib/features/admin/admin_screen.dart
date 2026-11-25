import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart' show AdminOverview;
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/billing.dart';
import '../../core/haptics.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/page.dart';
import '../../ui/shell_header.dart';
import 'abuse_tab.dart';
import 'admin_attention.dart';
import 'admin_lock_chip.dart';
import 'admin_nav.dart';
import 'admin_search.dart';
import 'admin_security_gate.dart';
import 'costs/costs_tab.dart';
import 'domains_tab.dart';
import 'mail_tab.dart';
import 'growth_tab.dart';
import 'overview_tab.dart';
import 'pricing_tab.dart';
import 'reports_tab.dart';
import 'resets_tab.dart';
import 'security_tab.dart';
import 'services_tab.dart';
import 'testimonials_tab.dart';
import 'users_tab.dart';
import 'vendors_tab.dart';
import 'partners_tab.dart';
import 'waitlist_tab.dart';
import 'workspaces_tab.dart';

export 'overview_tab.dart' show adminOverviewProvider;

/// Owner admin console (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md). Wide windows: a grouped side list
/// beside the open section. Phones: the overview is home, with the sections listed under it, and
/// each section opens over it with a back arrow.
///
/// Sections are state inside the console, never routes: a new route counts as leaving the page
/// on top and locks the console (D-507).
class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key, this.tab});

  /// The section to open on (`?tab=domains` from a notification), or the overview.
  final String? tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = ref.watch(adminOverviewProvider);
    if (overview is AsyncData<AdminOverview?> && overview.value == null) {
      return SubPage(
        title: context.l10n.adminConsole,
        body: EmptyState(icon: LucideIcons.lock, message: context.l10n.notInstanceOwner),
      );
    }
    return AdminSecurityGate(child: _UnlockedAdminScreen(tab: tab));
  }
}

class _UnlockedAdminScreen extends ConsumerStatefulWidget {
  const _UnlockedAdminScreen({this.tab});
  final String? tab;

  @override
  ConsumerState<_UnlockedAdminScreen> createState() => _UnlockedAdminScreenState();
}

class _UnlockedAdminScreenState extends ConsumerState<_UnlockedAdminScreen> {
  /// Null is home: the overview (on phones, with the section list).
  late AdminSection? _section = _initial(widget.tab);

  static AdminSection? _initial(String? tab) {
    final s = AdminSection.fromId(tab);
    return s == AdminSection.overview ? null : s;
  }

  /// The console search (side list on wide windows, the home page on phones).
  final _search = TextEditingController();
  final _searchFocus = FocusNode();

  /// The setting a search result opens; its AdminAnchor scrolls to it and clears this.
  final _target = ValueNotifier<String?>(null);
  Timer? _targetTimeout;

  @override
  void dispose() {
    _targetTimeout?.cancel();
    _target.dispose();
    _search.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_UnlockedAdminScreen old) {
    super.didUpdateWidget(old);
    if (old.tab != widget.tab) _section = _initial(widget.tab);
  }

  List<AdminSection> _sections(bool billingEnabled) =>
      [for (final s in AdminSection.values) if ((s != AdminSection.resets && s != AdminSection.partners) || billingEnabled) s];

  void _open(AdminSection section) {
    final next = section == AdminSection.overview ? null : section;
    if (next == _section) return;
    HapticsHelper.selection();
    setState(() => _section = next);
  }

  /// Opens a search result: its section, then scrolls to the setting. A setting that never shows
  /// (its card is hidden on this server) stops being waited for after a few seconds.
  void _goTo(AdminPlace place) {
    _targetTimeout?.cancel();
    _target.value = place.anchor;
    if (place.anchor != null) _targetTimeout = Timer(const Duration(seconds: 6), () => _target.value = null);
    _open(place.section);
  }

  Future<void> _pick(List<AdminSection> sections) async {
    final picked = await showAdminSectionPicker(context, sections: sections, current: _section ?? AdminSection.overview);
    if (picked != null && mounted) _goTo(picked);
  }

  Widget _body(AdminSection section) => switch (section) {
    AdminSection.overview => const OverviewTab(),
    AdminSection.growth => const GrowthTab(),
    AdminSection.costs => const CostsTab(),
    AdminSection.pricing => PricingTab(),
    AdminSection.vendors => const VendorsTab(),
    AdminSection.resets => const ResetsTab(),
    AdminSection.partners => const PartnersTab(),
    AdminSection.users => const UsersTab(),
    AdminSection.workspaces => const WorkspacesTab(),
    AdminSection.waitlist => AdminWaitlistTab(),
    AdminSection.support => SupportTicketsTab(),
    AdminSection.reports => ReportsTab(),
    AdminSection.testimonials => const TestimonialsTab(),
    AdminSection.abuse => const AbuseTab(),
    AdminSection.services => const ServicesTab(),
    AdminSection.domains => AdminDomainsTab(),
    AdminSection.mail => const AdminMailTab(),
    AdminSection.security => const AdminSecurityTab(),
  };

  void _focusSearch(bool wide, AdminSection? section, List<AdminSection> sections) {
    if (wide || section == null) {
      _searchFocus.requestFocus();
    } else {
      _pick(sections);
    }
  }

  /// Only the open section is built. The switch cross-fades so a change reads as a change.
  Widget _content(AdminSection section) => AnimatedSwitcher(
    duration: AppMotion.of(context, AppMotion.fast),
    switchInCurve: AppMotion.curve,
    child: KeyedSubtree(key: ValueKey(section), child: _body(section)),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final billingEnabled = ref.watch(billingProvider).value?.enabled ?? false;
    final sections = _sections(billingEnabled);
    // A link to Resets on a server without billing lands on the overview.
    final section = sections.contains(_section) ? _section : null;
    final wide = MediaQuery.sizeOf(context).width >= AppBreakpoints.split;
    final current = section ?? AdminSection.overview;

    final Widget page;
    if (wide) {
      page = Scaffold(
        appBar: ShellHeader(title: l10n.adminConsole, actions: const [AdminLockChip()]),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AdminSideNav(
              sections: sections,
              selected: current,
              onSelect: _open,
              search: _search,
              searchFocus: _searchFocus,
              onFind: _goTo,
            ),
            VerticalDivider(width: 1, thickness: 1, color: context.appColors.hairline),
            Expanded(child: _content(current)),
          ],
        ),
      );
    } else if (section == null) {
      page = Scaffold(
        appBar: ShellHeader(title: l10n.adminConsole, actions: const [AdminLockChip()]),
        body: _PhoneHome(
          sections: sections,
          search: _search,
          searchFocus: _searchFocus,
          onSelect: _open,
          onFind: _goTo,
        ),
      );
    } else {
      page = PopScope(
        // Back from a section goes to the console's home, not out of the console.
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _open(AdminSection.overview);
        },
        child: Scaffold(
          appBar: ShellHeader(
            title: section.label(context),
            leading: BackButton(key: const Key('adminSectionBack'), onPressed: () => _open(AdminSection.overview)),
            titleTrailing: Icon(LucideIcons.chevronDown, size: 18, color: context.colorScheme.onSurfaceVariant),
            onTitleTap: () => _pick(sections),
            actions: const [AdminLockChip()],
          ),
          body: AdminTitleInAppBar(value: true, child: _content(section)),
        ),
      );
    }

    return AdminNav(
      current: current,
      onOpen: _open,
      target: _target,
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyK, meta: true): () => _pick(sections),
          const SingleActivator(LogicalKeyboardKey.keyK, control: true): () => _pick(sections),
          // ⌘F / Ctrl+F: the search box, where there is one on screen.
          const SingleActivator(LogicalKeyboardKey.keyF, meta: true): () => _focusSearch(wide, section, sections),
          const SingleActivator(LogicalKeyboardKey.keyF, control: true): () => _focusSearch(wide, section, sections),
        },
        child: Focus(autofocus: true, child: page),
      ),
    );
  }
}

/// The grouped section list beside the content on wide windows.
class AdminSideNav extends ConsumerStatefulWidget {
  const AdminSideNav({
    super.key,
    required this.sections,
    required this.selected,
    required this.onSelect,
    required this.search,
    this.searchFocus,
    required this.onFind,
  });
  final List<AdminSection> sections;
  final AdminSection selected;
  final ValueChanged<AdminSection> onSelect;

  /// Typing here swaps the groups for the sections and settings that match.
  final TextEditingController search;
  final FocusNode? searchFocus;
  final ValueChanged<AdminPlace> onFind;

  @override
  ConsumerState<AdminSideNav> createState() => _AdminSideNavState();
}

class _AdminSideNavState extends ConsumerState<AdminSideNav> {
  @override
  Widget build(BuildContext context) {
    final badges = ref.watch(adminBadgesProvider);
    final sections = widget.sections;
    final query = widget.search.text;
    final searching = query.trim().isNotEmpty;
    final matches = searching ? searchAdminPlaces(context, adminPlaces(context, sections), query) : const <AdminPlace>[];
    return SizedBox(
      width: 232,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpace.sm, AppSpace.sm, AppSpace.sm, 0),
            child: AdminConsoleSearchField(
              controller: widget.search,
              focusNode: widget.searchFocus,
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) {
                if (matches.isNotEmpty) widget.onFind(matches.first);
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(AppSpace.sm, AppSpace.xs, AppSpace.sm, AppSpace.xl),
              children: [
                if (searching)
                  AdminSearchResults(matches: matches, query: query, onOpen: widget.onFind, dense: true)
                else
                  ..._groups(context, badges),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _groups(BuildContext context, Map<AdminSection, AdminBadge> badges) {
    final sections = widget.sections;
    final selected = widget.selected;
    final onSelect = widget.onSelect;
    return [
          for (final group in AdminGroup.values) ...[
            if (group != AdminGroup.home)
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSpace.sm, AppSpace.lg, AppSpace.sm, AppSpace.xxs),
                child: Text(
                  adminGroupLabel(context, group).toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(color: context.colorScheme.onSurfaceVariant, letterSpacing: 0.8, fontWeight: FontWeight.w600),
                ),
              ),
            for (final s in sections.where((s) => s.group == group))
              _SideNavItem(section: s, selected: s == selected, badge: badges[s], onTap: () => onSelect(s)),
          ],
    ];
  }
}

/// A phone's console home: the search box, then the overview with the sections under it, or,
/// while searching, the sections and settings that match.
class _PhoneHome extends StatefulWidget {
  const _PhoneHome({required this.sections, required this.search, required this.searchFocus, required this.onSelect, required this.onFind});
  final List<AdminSection> sections;
  final TextEditingController search;
  final FocusNode searchFocus;
  final ValueChanged<AdminSection> onSelect;
  final ValueChanged<AdminPlace> onFind;

  @override
  State<_PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<_PhoneHome> {
  @override
  Widget build(BuildContext context) {
    final query = widget.search.text;
    final searching = query.trim().isNotEmpty;
    final matches = searching ? searchAdminPlaces(context, adminPlaces(context, widget.sections), query) : const <AdminPlace>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpace.gutter, AppSpace.xs, AppSpace.gutter, AppSpace.xs),
          child: AdminConsoleSearchField(
            controller: widget.search,
            focusNode: widget.searchFocus,
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) {
              if (matches.isNotEmpty) widget.onFind(matches.first);
            },
          ),
        ),
        Expanded(
          child: searching
              ? ListView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.fromLTRB(AppSpace.gutter, AppSpace.xs, AppSpace.gutter, AppSpace.xxl + MediaQuery.paddingOf(context).bottom),
                  children: [AdminSearchResults(matches: matches, query: query, onOpen: widget.onFind)],
                )
              : OverviewTab(sectionList: AdminSectionLinks(sections: widget.sections, onSelect: widget.onSelect)),
        ),
      ],
    );
  }
}

class _SideNavItem extends StatelessWidget {
  const _SideNavItem({required this.section, required this.selected, required this.onTap, this.badge});
  final AdminSection section;
  final bool selected;
  final AdminBadge? badge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final fg = selected ? scheme.primary : scheme.onSurface;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Semantics(
        selected: selected,
        button: true,
        child: Material(
          color: selected ? scheme.primary.withValues(alpha: context.isDark ? 0.18 : 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.row),
          child: InkWell(
            key: Key('adminNav-${section.id}'),
            borderRadius: BorderRadius.circular(AppRadius.row),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: 9),
              child: Row(
                children: [
                  Icon(section.icon, size: 18, color: selected ? scheme.primary : scheme.onSurfaceVariant),
                  const SizedBox(width: AppSpace.sm),
                  Expanded(
                    child: Text(
                      section.label(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(color: fg, fontWeight: selected ? FontWeight.w700 : FontWeight.w500),
                    ),
                  ),
                  if (badge != null) AdminBadgeDot(badge!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The sections as grouped rows, under the overview on a phone.
class AdminSectionLinks extends ConsumerWidget {
  const AdminSectionLinks({super.key, required this.sections, required this.onSelect});
  final List<AdminSection> sections;
  final ValueChanged<AdminSection> onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badges = ref.watch(adminBadgesProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // The home group's own sections (Growth) come first, without a heading; the overview is
        // the page this list sits on.
        for (final group in AdminGroup.values)
          if (sections.any((s) => s.group == group && s != AdminSection.overview)) ...[
          if (group == AdminGroup.home)
            const SizedBox(height: AppSpace.md)
          else
            SectionHeader(title: adminGroupLabel(context, group)),
          GroupedCard(
            children: [
              for (final s in sections.where((s) => s.group == group && s != AdminSection.overview))
                GroupedTile(
                  key: Key('adminNav-${s.id}'),
                  icon: s.icon,
                  title: s.label(context),
                  subtitle: s.description(context),
                  trailing: badges[s] == null
                      ? null
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AdminBadgeDot(badges[s]!),
                            Icon(LucideIcons.chevronRight, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.7)),
                          ],
                        ),
                  onTap: () => onSelect(s),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

/// "Go to": type to find a section or a setting, Enter opens the first match. ⌘K / Ctrl+K, or the
/// title on a phone.
Future<AdminPlace?> showAdminSectionPicker(
  BuildContext context, {
  required List<AdminSection> sections,
  required AdminSection current,
}) {
  return showDialog<AdminPlace>(
    context: context,
    builder: (c) => _SectionPicker(sections: sections, current: current),
  );
}

class _SectionPicker extends StatefulWidget {
  const _SectionPicker({required this.sections, required this.current});
  final List<AdminSection> sections;
  final AdminSection current;

  @override
  State<_SectionPicker> createState() => _SectionPickerState();
}

class _SectionPickerState extends State<_SectionPicker> {
  String _query = '';

  // Empty: the sections. Typing: sections and settings, names that start with it first ("mai" is
  // Mail before Domains).
  List<AdminPlace> _matches(BuildContext context) {
    final places = adminPlaces(context, widget.sections);
    if (_query.trim().isEmpty) return [for (final p in places) if (p.isSection) p];
    return searchAdminPlaces(context, places, _query);
  }

  @override
  Widget build(BuildContext context) {
    final matches = _matches(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.xxl),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440, maxHeight: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.md, AppSpace.md, AppSpace.xs),
              child: TextField(
                key: const Key('adminSectionSearch'),
                autofocus: true,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  hintText: context.l10n.adminGoToSection,
                  prefixIcon: const Icon(LucideIcons.search, size: 18),
                ),
                onChanged: (v) => setState(() => _query = v),
                onSubmitted: (_) {
                  if (matches.isNotEmpty) Navigator.pop(context, matches.first);
                },
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: AppSpace.sm),
                children: [
                  for (final p in matches)
                    ListTile(
                      key: Key('adminPick-${p.id}'),
                      leading: Icon(p.icon, size: 20, color: p.isSection && p.section == widget.current ? context.colorScheme.primary : null),
                      title: Text(p.title, style: TextStyle(fontWeight: p.isSection && p.section == widget.current ? FontWeight.w700 : null)),
                      subtitle: Text(p.isSection ? (p.subtitle ?? '') : p.section.label(context), maxLines: 1, overflow: TextOverflow.ellipsis),
                      selected: p.isSection && p.section == widget.current,
                      onTap: () => Navigator.pop(context, p),
                    ),
                  if (matches.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(AppSpace.lg),
                      child: Text(context.l10n.adminNoSectionMatch, textAlign: TextAlign.center),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
