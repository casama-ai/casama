import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';

/// What the list asks Casama Cloud for: a search (email, customer or account id) and an edition.
typedef LicenseListQuery = ({String query, String? edition});

final adminSelfhostLicensesProvider = FutureProvider.autoDispose.family<List<LicenseRecord>, LicenseListQuery>(
  (ref, q) => ref.watch(backendProvider).selfhost.adminLicenses(query: q.query, edition: q.edition),
);

const _editions = ['personal', 'trial', 'business'];

String editionLabel(BuildContext context, String edition) => switch (edition) {
  'trial' => context.l10n.licenseEditionTrial,
  'business' => context.l10n.licenseEditionBusiness,
  _ => context.l10n.licenseEditionPersonal,
};

AdminTone _editionTone(String edition) => switch (edition) {
  'business' => AdminTone.positive,
  'trial' => AdminTone.info,
  _ => AdminTone.neutral,
};

/// The admin console's "Self-host licenses" section (docs/SELF-HOSTING-PLAN.md §6.5): every
/// license Casama Cloud issued, with its server's latest daily check-in; business keys made here
/// (shown once), and revoking (its server stops at the next check-in).
class SelfhostLicensesTab extends ConsumerStatefulWidget {
  const SelfhostLicensesTab({super.key});

  @override
  ConsumerState<SelfhostLicensesTab> createState() => _SelfhostLicensesTabState();
}

class _SelfhostLicensesTabState extends ConsumerState<SelfhostLicensesTab> {
  final _search = TextEditingController();
  String _query = '';
  String? _edition;
  Timer? _debounce;

  LicenseListQuery get _key => (query: _query.trim(), edition: _edition);

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  void _typed(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _query = v);
    });
  }

  Future<void> _refresh() async {
    ref.invalidate(adminSelfhostLicensesProvider(_key));
    await ref.read(adminSelfhostLicensesProvider(_key).future).catchError((_) => <LicenseRecord>[]);
  }

  Future<void> _create() async {
    final created = await showAdaptiveSheet<CreatedBusinessLicense>(context: context, builder: (_) => const _CreateLicenseSheet());
    if (created == null || !mounted) return;
    ref.invalidate(adminSelfhostLicensesProvider);
    await showAdaptiveSheet<void>(
      context: context,
      builder: (_) => LicenseKeyOnceSheet(license: created.license),
    );
  }

  Future<void> _revoke(LicenseRecord r) async {
    final l10n = context.l10n;
    final ok = await adminConfirm(
      context,
      title: l10n.adminSelfhostRevokeQuestion(_who(r)),
      message: l10n.adminSelfhostRevokeHelp,
      confirmLabel: l10n.adminSelfhostRevoke,
      destructive: true,
      confirmKey: const Key('confirmRevokeLicense'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () => ref.read(backendProvider).selfhost.adminRevoke(r.id));
    if (!mounted) return;
    if (done != null) showSuccess(context, l10n.adminSelfhostRevokedDone);
    ref.invalidate(adminSelfhostLicensesProvider);
  }

  static String _who(LicenseRecord r) => [r.customer, r.email].whereType<String>().where((s) => s.isNotEmpty).firstOrNull ?? r.accountId ?? r.id;

  Widget _pills(BuildContext context, LicenseRecord r) => Wrap(
    spacing: 6,
    runSpacing: 4,
    children: [
      AdminStatusPill(editionLabel(context, r.edition), tone: _editionTone(r.edition)),
      if (r.revoked) AdminStatusPill(context.l10n.adminSelfhostRevoked, tone: AdminTone.negative, icon: LucideIcons.ban),
      if (r.offline) AdminStatusPill(context.l10n.adminSelfhostOffline, tone: AdminTone.info, icon: LucideIcons.wifiOff),
    ],
  );

  Widget _checkin(BuildContext context, LicenseRecord r, {TextStyle? style}) =>
      r.lastCheckinAt == null ? Text(context.l10n.adminSelfhostNever, style: style) : TimeAgo(r.lastCheckinAt!, style: style);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final header = AdminSectionHeader(
      section: AdminSection.selfhost,
      onRefresh: _refresh,
      actions: [
        FilledButton.icon(
          key: const Key('adminSelfhostCreate'),
          onPressed: _create,
          icon: const Icon(LucideIcons.plus, size: 18),
          label: Text(l10n.adminSelfhostCreate),
        ),
      ],
    );
    final toolbar = AdminListToolbar(
      search: AdminSearchField(key: const Key('adminSelfhostSearch'), controller: _search, hint: l10n.adminSelfhostSearch, onChanged: _typed),
      filters: AdminFilterChips<String?>(
        key: const Key('adminSelfhostEdition'),
        values: const [null, ..._editions],
        labels: {null: l10n.adminPeopleAll, for (final e in _editions) e: editionLabel(context, e)},
        selected: _edition,
        onSelected: (e) => setState(() => _edition = e),
      ),
    );
    final muted = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant);
    return AsyncView<List<LicenseRecord>>(
      value: ref.watch(adminSelfhostLicensesProvider(_key)),
      onRetry: () => ref.invalidate(adminSelfhostLicensesProvider(_key)),
      loading: AdminSectionList(
        children: [
          header,
          toolbar,
          const Center(
            child: Padding(padding: EdgeInsets.all(AppSpace.xl), child: CircularProgressIndicator()),
          ),
        ],
      ),
      data: (rows) => AdminSectionList(
        onRefresh: _refresh,
        children: [
          header,
          toolbar,
          if (rows.isEmpty)
            AdminEmptyCard(icon: LucideIcons.keyRound, message: _query.isEmpty && _edition == null ? l10n.adminSelfhostNone : l10n.adminUsersNoMatch)
          else
            AdminDataList<LicenseRecord>(
              key: const Key('adminSelfhostList'),
              items: rows,
              itemKey: (r) => Key('adminLicense-${r.id}'),
              title: _who,
              leading: (context, r) => AdminAvatar(_who(r)),
              subtitle: (context, r) => [
                if (r.instanceId != null) l10n.adminSelfhostInstance(r.instanceId!.substring(0, r.instanceId!.length.clamp(0, 8))),
                ?r.engineVersion,
                l10n.adminSelfhostCounts(r.members ?? 0, r.bots ?? 0),
                r.lastCheckinAt == null ? l10n.adminSelfhostNeverCheckedIn : l10n.adminSelfhostCheckedIn(relativeTime(r.lastCheckinAt!, context)),
              ].join(' · '),
              badges: (context, r) => [_pills(context, r)],
              trailing: (context, r) => AdminActionsMenu(
                actions: [
                  if (!r.revoked)
                    AdminMenuAction(key: Key('revokeLicense-${r.id}'), label: l10n.adminSelfhostRevoke, icon: LucideIcons.ban, onSelected: () => _revoke(r)),
                ],
              ),
              columns: [
                AdminColumn(
                  label: l10n.adminSelfhostAccount,
                  flex: 4,
                  cell: (context, r) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _who(r),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (r.instanceId != null) Text(r.instanceId!, maxLines: 1, overflow: TextOverflow.ellipsis, style: muted),
                    ],
                  ),
                ),
                AdminColumn(label: l10n.adminSelfhostEditionColumn, flex: 2, cell: _pills),
                AdminColumn(
                  label: l10n.adminSelfhostVersion,
                  flex: 2,
                  cell: (context, r) => Text(r.engineVersion ?? '—', style: muted),
                ),
                AdminColumn(
                  label: l10n.adminSelfhostCheckin,
                  flex: 2,
                  cell: (context, r) => _checkin(context, r, style: muted),
                ),
                AdminColumn(label: l10n.adminSelfhostMembers, flex: 1, numeric: true, cell: (context, r) => Text('${r.members ?? '—'}')),
                AdminColumn(label: l10n.adminSelfhostBots, flex: 1, numeric: true, cell: (context, r) => Text('${r.bots ?? '—'}')),
              ],
            ),
        ],
      ),
    );
  }
}

/// Make a business key: customer, email (the key is emailed there too), seats, features, expiry,
/// offline. Pops the created key.
class _CreateLicenseSheet extends ConsumerStatefulWidget {
  const _CreateLicenseSheet();

  @override
  ConsumerState<_CreateLicenseSheet> createState() => _CreateLicenseSheetState();
}

class _CreateLicenseSheetState extends ConsumerState<_CreateLicenseSheet> {
  final _customer = TextEditingController();
  final _email = TextEditingController();
  final _seats = TextEditingController(text: '10');
  final _features = <String>{};
  var _offline = false;
  var _busy = false;
  late DateTime _expires = DateTime.now().add(const Duration(days: 365));

  @override
  void dispose() {
    _customer.dispose();
    _email.dispose();
    _seats.dispose();
    super.dispose();
  }

  bool get _valid => _customer.text.trim().isNotEmpty && _email.text.contains('@') && (int.tryParse(_seats.text.trim()) ?? 0) >= 1;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _expires,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365 * 5)),
    );
    if (picked != null && mounted) setState(() => _expires = picked);
  }

  Future<void> _submit() async {
    if (!_valid || _busy) return;
    setState(() => _busy = true);
    final created = await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .selfhost
          .adminCreateLicense(
            NewBusinessLicense(
              customer: _customer.text.trim(),
              email: _email.text.trim(),
              seats: int.parse(_seats.text.trim()),
              features: [
                for (final f in businessLicenseFeatures)
                  if (_features.contains(f)) f,
              ],
              // The end of the chosen day.
              expiresAt: DateTime(_expires.year, _expires.month, _expires.day, 23, 59, 59),
              offline: _offline,
            ),
          ),
    );
    if (!mounted) return;
    if (created == null) {
      setState(() => _busy = false);
      return;
    }
    Navigator.pop(context, created);
  }

  String _featureLabel(String f) {
    final l10n = context.l10n;
    return switch (f) {
      'sso' => l10n.licenseFeatureSso,
      'audit_export' => l10n.licenseFeatureAuditExport,
      'audit_forwarding' => l10n.licenseFeatureAuditForwarding,
      'advanced_roles' => l10n.licenseFeatureRoles,
      _ => f,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.keyRound,
      title: l10n.adminSelfhostCreate,
      subtitle: l10n.adminSelfhostCreateHelp,
      submitLabel: l10n.create,
      submitKey: const Key('adminSelfhostCreateSubmit'),
      busy: _busy,
      onSubmit: _valid ? _submit : null,
      children: [
        TextField(
          key: const Key('licenseCustomer'),
          controller: _customer,
          decoration: InputDecoration(labelText: l10n.adminSelfhostCustomer),
          onChanged: (_) => setState(() {}),
        ),
        TextField(
          key: const Key('licenseEmail'),
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: l10n.adminSelfhostEmail),
          onChanged: (_) => setState(() {}),
        ),
        TextField(
          key: const Key('licenseSeats'),
          controller: _seats,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(labelText: l10n.adminSelfhostSeats),
          onChanged: (_) => setState(() {}),
        ),
        ListTile(
          key: const Key('licenseExpiry'),
          contentPadding: EdgeInsets.zero,
          leading: const Icon(LucideIcons.calendar),
          title: Text(l10n.adminSelfhostExpires),
          subtitle: Text(_expires.formattedDate(context)),
          onTap: _pickDate,
        ),
        Text(l10n.adminSelfhostFeatures, style: context.textTheme.labelLarge),
        Wrap(
          spacing: AppSpace.xs,
          runSpacing: AppSpace.xs,
          children: [
            for (final f in businessLicenseFeatures)
              FilterChip(
                key: Key('licenseFeature-$f'),
                label: Text(_featureLabel(f)),
                selected: _features.contains(f),
                onSelected: (on) => setState(() => on ? _features.add(f) : _features.remove(f)),
              ),
          ],
        ),
        SwitchListTile(
          key: const Key('licenseOffline'),
          contentPadding: EdgeInsets.zero,
          value: _offline,
          onChanged: (v) => setState(() => _offline = v),
          title: Text(l10n.adminSelfhostOfflineKey),
          subtitle: Text(l10n.adminSelfhostOfflineHelp),
        ),
      ],
    );
  }
}

/// A key shown once, with Copy.
class LicenseKeyOnceSheet extends StatelessWidget {
  const LicenseKeyOnceSheet({super.key, required this.license});
  final String license;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.keyRound,
      iconColor: context.appColors.warning,
      title: l10n.adminSelfhostCreated,
      subtitle: l10n.adminSelfhostCreatedOnce,
      submitLabel: l10n.copy,
      submitIcon: LucideIcons.copy,
      submitKey: const Key('copyLicenseKey'),
      cancelLabel: l10n.close,
      onSubmit: () {
        Clipboard.setData(ClipboardData(text: license));
        showMessage(context, l10n.copied);
      },
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: context.appColors.codeBackground,
            borderRadius: BorderRadius.circular(AppRadius.row),
            border: Border.all(color: context.appColors.hairline),
          ),
          child: SelectableText(license, key: const Key('licenseKeyValue'), style: AppText.mono.copyWith(fontSize: 13)),
        ),
      ],
    );
  }
}
