import 'package:material_ui/material_ui.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/widgets.dart';

/// The console's groups, in the order the side list shows them.
enum AdminGroup { home, money, people, system }

/// Every section of the admin console (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §3). Only the open one is
/// built: no swiping through neighbours, so nothing is built or fetched on the way past.
enum AdminSection {
  overview('overview', AdminGroup.home, LucideIcons.layoutDashboard),
  growth('growth', AdminGroup.home, LucideIcons.trendingUp),
  costs('costs', AdminGroup.money, LucideIcons.chartColumn),
  pricing('pricing', AdminGroup.money, LucideIcons.tag),
  vendors('vendors', AdminGroup.money, LucideIcons.gauge),
  resets('resets', AdminGroup.money, LucideIcons.rotateCcw),
  partners('partners', AdminGroup.money, LucideIcons.handshake),
  freePlans('free-plans', AdminGroup.money, LucideIcons.gift),
  selfhost('selfhost', AdminGroup.money, LucideIcons.keyRound),
  users('users', AdminGroup.people, LucideIcons.user),
  workspaces('workspaces', AdminGroup.people, LucideIcons.boxes),
  waitlist('waitlist', AdminGroup.people, LucideIcons.listOrdered),
  support('support', AdminGroup.people, LucideIcons.lifeBuoy),
  reports('reports', AdminGroup.people, LucideIcons.flag),
  testimonials('testimonials', AdminGroup.people, LucideIcons.quote),
  abuse('abuse', AdminGroup.people, LucideIcons.shieldAlert),
  services('services', AdminGroup.system, LucideIcons.server),
  domains('domains', AdminGroup.system, LucideIcons.globe),
  mail('mail', AdminGroup.system, LucideIcons.mail),
  security('security', AdminGroup.system, LucideIcons.lockKeyhole);

  const AdminSection(this.id, this.group, this.icon);

  /// The `?tab=` value in links and notifications.
  final String id;
  final AdminGroup group;
  final IconData icon;

  static AdminSection? fromId(String? id) {
    for (final s in values) {
      if (s.id == id) return s;
    }
    return null;
  }

  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      overview => l10n.adminOverview,
      growth => l10n.adminGrowth,
      costs => l10n.adminCosts,
      pricing => l10n.adminPricing,
      vendors => l10n.adminVendors,
      resets => l10n.adminResets,
      partners => l10n.adminPartners,
      freePlans => l10n.adminFreePlans,
      selfhost => l10n.adminSelfhost,
      users => l10n.adminUsers,
      workspaces => l10n.adminWorkspaces,
      waitlist => l10n.adminWaitlist,
      support => l10n.adminSupport,
      reports => l10n.adminReports,
      testimonials => l10n.adminTestimonials,
      abuse => l10n.adminAbuse,
      services => l10n.adminServices,
      domains => l10n.adminDomains,
      mail => l10n.adminMail,
      security => l10n.adminSecurity,
    };
  }

  /// One line under the section's title.
  String description(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      overview => l10n.adminAboutOverview,
      growth => l10n.adminAboutGrowth,
      costs => l10n.adminAboutCosts,
      pricing => l10n.adminAboutPricing,
      vendors => l10n.adminAboutVendors,
      resets => l10n.adminAboutResets,
      partners => l10n.adminAboutPartners,
      freePlans => l10n.adminAboutFreePlans,
      selfhost => l10n.adminAboutSelfhost,
      users => l10n.adminAboutUsers,
      workspaces => l10n.adminAboutWorkspaces,
      waitlist => l10n.adminAboutWaitlist,
      support => l10n.adminAboutSupport,
      reports => l10n.adminAboutReports,
      testimonials => l10n.adminAboutTestimonials,
      abuse => l10n.adminAboutAbuse,
      services => l10n.adminAboutServices,
      domains => l10n.adminAboutDomains,
      mail => l10n.adminAboutMail,
      security => l10n.adminAboutSecurity,
    };
  }
}

String adminGroupLabel(BuildContext context, AdminGroup group) => switch (group) {
  AdminGroup.home => '',
  AdminGroup.money => context.l10n.adminGroupMoney,
  AdminGroup.people => context.l10n.adminGroupPeople,
  AdminGroup.system => context.l10n.adminGroupSystem,
};

/// Moves between sections from inside one (a vendor's "See spend", the overview's attention rows).
/// It replaces the old tab controller.
class AdminNav extends InheritedWidget {
  const AdminNav({super.key, required this.current, required this.onOpen, this.target, required super.child});

  final AdminSection? current;
  final ValueChanged<AdminSection> onOpen;

  /// The setting a search result asked for (an `AdminAnchor` id); the anchor clears it once shown.
  final ValueNotifier<String?>? target;

  static AdminNav? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AdminNav>();

  /// Opens [section]; does nothing outside the console (a card shown elsewhere in a test).
  static void open(BuildContext context, AdminSection section) => maybeOf(context)?.onOpen(section);

  @override
  bool updateShouldNotify(AdminNav old) => old.current != current || old.onOpen != onOpen || old.target != target;
}

/// Whether the shell already shows the section's name in the app bar (phones). Then
/// [AdminSectionHeader] leaves the title out and keeps the description and actions.
class AdminTitleInAppBar extends InheritedWidget {
  const AdminTitleInAppBar({super.key, required this.value, required super.child});
  final bool value;

  static bool of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AdminTitleInAppBar>()?.value ?? false;

  @override
  bool updateShouldNotify(AdminTitleInAppBar old) => old.value != value;
}
