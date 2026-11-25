import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart' show AdminVendor;

import '../../core/providers.dart';

import '../../theme/app_colors.dart';

import '../../theme/app_tokens.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';
import 'vendors_tab.dart';

/// A count waiting in a section, for its badge in the side list and its row on the overview.
class AdminBadge {
  const AdminBadge(this.count, {this.tone = AdminTone.warning});
  final int count;
  final AdminTone tone;
}

/// Counts from the server's one small attention call (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §7), so
/// the badges don't load every section's data. Empty until it answers, or on an older server.
final adminAttentionCountsProvider = FutureProvider.autoDispose<Map<AdminSection, AdminBadge>>((ref) async {
  try {
    final a = await ref.watch(backendProvider).adminAttention();
    // Failed runs aren't here: the overview has them already.
    return {
      AdminSection.support: AdminBadge(a.openTickets),
      AdminSection.reports: AdminBadge(a.newReports),
      AdminSection.waitlist: AdminBadge(a.waitlistWaiting, tone: AdminTone.info),
      AdminSection.abuse: AdminBadge(a.abuse24h, tone: AdminTone.negative),
      AdminSection.domains: AdminBadge(a.domainOrdersPending),
    };
  } catch (_) {
    // An older server without the call: no badges rather than an error.
    return const {};
  }
});

bool vendorNeedsAttention(AdminVendor v) =>
    v.enabled && v.latest != null && v.latest!.status.value != 'ok' && v.latest!.error != 'not_configured';

/// What each section has waiting. Vendors come from the vendor list the overview loads anyway.
final adminBadgesProvider = Provider.autoDispose<Map<AdminSection, AdminBadge>>((ref) {
  final counts = {...?ref.watch(adminAttentionCountsProvider).value};
  final vendors = ref.watch(adminVendorsProvider).value ?? const [];
  final low = vendors.where(vendorNeedsAttention).toList();
  if (low.isNotEmpty) {
    final out = low.any((v) => v.latest!.status.value == 'out');
    counts[AdminSection.vendors] = AdminBadge(low.length, tone: out ? AdminTone.negative : AdminTone.warning);
  }
  counts.removeWhere((_, b) => b.count <= 0);
  final total = counts.values.fold<int>(0, (a, b) => a + b.count);
  if (total > 0 && !counts.containsKey(AdminSection.overview)) {
    final urgent = counts.values.any((b) => b.tone == AdminTone.negative);
    counts[AdminSection.overview] = AdminBadge(total, tone: urgent ? AdminTone.negative : AdminTone.warning);
  }
  return counts;
});

/// A small count pill in the badge's meaning color.
class AdminBadgeDot extends StatelessWidget {
  const AdminBadgeDot(this.badge, {super.key});
  final AdminBadge badge;

  @override
  Widget build(BuildContext context) {
    final color = adminToneColor(context, badge.tone);
    final text = badge.count > 99 ? '99+' : '${badge.count}';
    return Container(
      constraints: const BoxConstraints(minWidth: 20),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(AppRadius.pill)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w800, fontFeatures: AppText.tabular),
      ),
    );
  }
}
