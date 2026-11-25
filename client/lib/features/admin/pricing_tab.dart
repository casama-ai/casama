import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/display_text.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'admin_search.dart';
import 'ui/admin_ui.dart';
import 'remote_settings_cards.dart';

final adminPricingProvider = FutureProvider.autoDispose<AdminPricing>(
  (r) => r.watch(backendProvider).adminPricing(),
);

/// The limits every plan has, in the order the editor shows them; any other keys follow.
const _knownLimits = [
  'monthly_credits_usd',
  'max_bots',
  'max_computers',
  'computer_hours',
  'seats',
  'cloud_daily_usd',
  // D-249: running computers, machine size, extra people, the Pro trial.
  'max_running_computers',
  'computer_size',
  'extra_seat_usd',
  'trial_days',
  'trial_credits_usd',
  'trial_computer_hours',
  // Hosted bot mail (BOT-EMAIL-PLAN §8).
  'max_mail_addresses',
  'mail_new_day',
  'mail_sent_day',
  'mail_storage_mb',
];

String _limitLabel(BuildContext context, String key) {
  final l10n = context.l10n;
  return switch (key) {
    'monthly_credits_usd' => l10n.adminLimitMonthlyCredits,
    'max_bots' => l10n.adminLimitMaxBots,
    'max_computers' => l10n.adminLimitMaxComputers,
    'computer_hours' => l10n.adminLimitComputerHours,
    'seats' => l10n.adminLimitSeats,
    'cloud_daily_usd' => l10n.adminLimitCloudDaily,
    'max_running_computers' => l10n.adminLimitMaxRunning,
    'computer_size' => l10n.adminLimitComputerSize,
    'extra_seat_usd' => l10n.adminLimitExtraSeat,
    'trial_days' => l10n.adminLimitTrialDays,
    'trial_credits_usd' => l10n.adminLimitTrialCredits,
    'trial_computer_hours' => l10n.adminLimitTrialHours,
    'max_mail_addresses' => l10n.adminLimitMailAddresses,
    'mail_new_day' => l10n.adminLimitMailNewDay,
    'mail_sent_day' => l10n.adminLimitMailSentDay,
    'mail_storage_mb' => l10n.adminLimitMailStorage,
    _ => key,
  };
}

/// The trimmed text, or null when it is empty and was empty before (so the save leaves it out).
/// The generated client drops nulls, so clearing a value sends an empty string.
String? _text(TextEditingController c, String? before) {
  final t = c.text.trim();
  return t.isEmpty && (before == null || before.isEmpty) ? null : t;
}

String _num(num v) =>
    v == v.roundToDouble() ? v.toInt().toString() : v.toString();

/// Plans, credit packs and the usage markup, edited live by the instance owner (D-244).
class PricingTab extends ConsumerWidget {
  const PricingTab({super.key});

  static const double _maxWidth = 820;

  Future<void> _editPlan(
    BuildContext context,
    WidgetRef ref,
    AdminPlan plan,
  ) async {
    final req = await showAdaptiveSheet<SavePlanRequest>(
      context: context,
      builder: (_) => _PlanEditor(plan: plan),
    );
    if (req == null || !context.mounted) return;
    final ok = await runGuarded(
      context,
      () => ref.read(backendProvider).saveAdminPlan(plan.code, req),
    );
    if (ok != null) ref.invalidate(adminPricingProvider);
  }

  Future<void> _editPack(
    BuildContext context,
    WidgetRef ref,
    AdminCreditPack pack,
  ) async {
    final req = await showAdaptiveSheet<SaveCreditPackRequest>(
      context: context,
      builder: (_) => _PackEditor(pack: pack),
    );
    if (req == null || !context.mounted) return;
    final ok = await runGuarded(
      context,
      () => ref.read(backendProvider).saveAdminCreditPack(pack.code, req),
    );
    if (ok != null) ref.invalidate(adminPricingProvider);
  }

  Future<void> _editMarkup(
    BuildContext context,
    WidgetRef ref,
    BillingSettings settings,
  ) async {
    final markup = await showAdaptiveSheet<num>(
      context: context,
      builder: (_) => _MarkupEditor(markup: settings.markup),
    );
    if (markup == null || !context.mounted) return;
    final ok = await runGuarded(
      context,
      () => ref
          .read(backendProvider)
          .setAdminBillingSettings(BillingSettings(markup: markup)),
    );
    if (ok != null) ref.invalidate(adminPricingProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    Future<void> refresh() async {
      ref.invalidate(adminPricingProvider);
      await ref.read(adminPricingProvider.future).then<void>((_) {}, onError: (_) {});
    }

    return AsyncView<AdminPricing>(
      value: ref.watch(adminPricingProvider),
      onRetry: () => ref.invalidate(adminPricingProvider),
      loading: const SkeletonPage(
        maxWidth: _maxWidth,
        children: [
          SkeletonGroupedCard(
            count: 7,
            row: SkeletonRow(trailing: SkeletonTrailing.none),
          ),
        ],
      ),
      data: (p) => AdminSectionList(
        maxWidth: _maxWidth,
        onRefresh: refresh,
        children: [
          AdminSectionHeader(section: AdminSection.pricing, onRefresh: refresh),
          if (!p.billingEnabled)
            AppCard(
              child: FormNote(
                l10n.adminPricingBillingOff,
                icon: LucideIcons.info,
              ),
            ),
          SectionHeader(title: l10n.plans, count: p.plans.isEmpty ? null : '${p.plans.length}'),
          AdminAnchor(
            id: AdminAnchors.plans,
            child: p.plans.isEmpty
            ? AdminEmptyCard(key: const Key('adminNoPlans'), icon: LucideIcons.gem, message: l10n.adminNoPlans)
            : GroupedCard(
              children: [
                for (final plan in p.plans)
                  _PriceRow(
                    key: Key('adminPlan-${plan.code}'),
                    icon: LucideIcons.gem,
                    name: plan.name,
                    code: plan.code,
                    price: plan.priceLabel.isUsable ? plan.priceLabel! : null,
                    active: plan.active,
                    stat: l10n.adminPlanWorkspaces(plan.workspaces),
                    onTap: () => _editPlan(context, ref, plan),
                  ),
              ],
            ),
          ),
          SectionHeader(title: l10n.adminCreditPacks, count: p.packs.isEmpty ? null : '${p.packs.length}'),
          AdminAnchor(
            id: AdminAnchors.packs,
            child: p.packs.isEmpty
            ? AdminEmptyCard(key: const Key('adminNoPacks'), icon: LucideIcons.creditCard, message: l10n.adminNoPacks)
            : GroupedCard(
              children: [
                for (final pack in p.packs)
                  _PriceRow(
                    key: Key('adminPack-${pack.code}'),
                    icon: LucideIcons.creditCard,
                    name: pack.name,
                    code: pack.code,
                    price: pack.priceLabel.isUsable ? pack.priceLabel! : null,
                    active: pack.active,
                    stat: l10n.adminPackCreditsShort('\$${_num(pack.creditsUsd)}'),
                    onTap: () => _editPack(context, ref, pack),
                  ),
              ],
            ),
          ),
          SectionHeader(title: l10n.adminMarkup),
          AdminAnchor(
            id: AdminAnchors.markup,
            child: GroupedCard(
            children: [
              GroupedTile(
                key: const Key('adminMarkup'),
                icon: LucideIcons.percent,
                title: l10n.adminMarkupValue(_num(p.settings.markup)),
                subtitle: l10n.adminMarkupHelp,
                onTap: () => _editMarkup(context, ref, p.settings),
              ),
              // Voice, call, computer and media prices, and domains on sale (D-373).
              const AdminJsonSettingTile(kind: AdminJsonSettingKind.priceTables),
            ],
          ),
          ),
        ],
      ),
    );
  }
}

/// One plan or pack: the name in bold over its code and sale state, and the price on the right
/// over a small number (workspaces on the plan, credits in the pack).
class _PriceRow extends StatelessWidget {
  const _PriceRow({
    super.key,
    required this.icon,
    required this.name,
    required this.code,
    required this.price,
    required this.active,
    required this.stat,
    required this.onTap,
  });

  final IconData icon;
  final String name;
  final String code;

  /// Null when it has no price label yet.
  final String? price;
  final bool active;
  final String stat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: scheme.primary.withValues(alpha: context.isDark ? 0.2 : 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.icon),
                ),
                alignment: Alignment.center,
                child: Icon(icon, size: 18, color: scheme.primary),
              ),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                    Wrap(
                      spacing: AppSpace.xs,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          code,
                          style: muted?.copyWith(fontFamily: 'monospace', fontFamilyFallback: const ['Menlo', 'Consolas', 'Courier New']),
                        ),
                        AdminStatusPill(
                          active ? l10n.adminOnSale : l10n.adminHidden,
                          tone: active ? AdminTone.positive : AdminTone.neutral,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpace.sm),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price ?? l10n.adminNoPriceLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: price == null
                          ? muted?.copyWith(fontStyle: FontStyle.italic)
                          : context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, fontFeatures: AppText.tabular),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      stat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: muted?.copyWith(fontFeatures: AppText.tabular),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpace.xxs),
              Icon(LucideIcons.chevronRight, color: scheme.onSurfaceVariant.withValues(alpha: 0.7)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Checks a number field: empty is allowed only when [optional]; null means it's fine.
String? _checkNumber(
  BuildContext context,
  String text, {
  bool whole = false,
  bool positive = false,
  bool optional = false,
}) {
  final l10n = context.l10n;
  final t = text.trim();
  if (t.isEmpty) return optional ? null : l10n.adminNumberInvalid;
  final v = num.tryParse(t);
  if (v == null || !v.isFinite) {
    return whole ? l10n.adminWholeNumber : l10n.adminNumberInvalid;
  }
  if (whole && v != v.roundToDouble()) return l10n.adminWholeNumber;
  if (positive && v <= 0) return l10n.adminNumberPositive;
  if (v < 0) return l10n.adminNumberInvalid;
  return null;
}

/// Edits one plan. Pops a [SavePlanRequest] with every field, so the save is exactly what's shown.
class _PlanEditor extends StatefulWidget {
  const _PlanEditor({required this.plan});
  final AdminPlan plan;

  @override
  State<_PlanEditor> createState() => _PlanEditorState();
}

class _PlanEditorState extends State<_PlanEditor> {
  late final _name = TextEditingController(text: widget.plan.name);
  late final _price = TextEditingController(text: widget.plan.priceLabel);
  late final _sort = TextEditingController(text: '${widget.plan.sort}');
  late final _appStore = TextEditingController(
    text: widget.plan.storeProductIds['app_store'],
  );
  late final _googlePlay = TextEditingController(
    text: widget.plan.storeProductIds['google_play'],
  );
  late final _dodo = TextEditingController(text: widget.plan.dodoProductId);
  final _newKey = TextEditingController();
  late var _active = widget.plan.active;
  late var _creditGate = widget.plan.creditGate;
  late var _paywallDefault = widget.plan.paywallDefault;
  late var _paywallPopular = widget.plan.paywallPopular;
  late final Map<String, TextEditingController> _limits = {
    for (final k in [
      ..._knownLimits,
      ...widget.plan.limits.keys.where((k) => !_knownLimits.contains(k)),
    ])
      k: TextEditingController(
        text: widget.plan.limits[k] == null ? '' : _num(widget.plan.limits[k]!),
      ),
  };
  final _errors = <String, String>{};

  @override
  void dispose() {
    for (final c in [
      _name,
      _price,
      _sort,
      _appStore,
      _googlePlay,
      _dodo,
      _newKey,
      ..._limits.values,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _addLimit() {
    final key = _newKey.text.trim();
    setState(() {
      if (!RegExp(r'^[a-z][a-z0-9_]{0,63}$').hasMatch(key)) {
        _errors['newKey'] = context.l10n.adminLimitKeyInvalid;
        return;
      }
      _errors.remove('newKey');
      _limits.putIfAbsent(key, TextEditingController.new);
      _newKey.clear();
    });
  }

  void _submit() {
    final l10n = context.l10n;
    final errors = <String, String>{
      if (_name.text.trim().isEmpty) 'name': l10n.adminNameRequired,
      'sort': ?_checkNumber(context, _sort.text, whole: true),
      for (final MapEntry(:key, :value) in _limits.entries)
        key: ?_checkNumber(context, value.text, optional: true),
    };
    setState(() {
      _errors
        ..clear()
        ..addAll(errors);
    });
    if (errors.isNotEmpty) return;
    Navigator.pop(
      context,
      SavePlanRequest(
        name: _name.text.trim(),
        active: _active,
        sort: int.parse(_sort.text.trim()),
        priceLabel: _text(_price, widget.plan.priceLabel),
        creditGate: _creditGate,
        paywallDefault: _paywallDefault,
        paywallPopular: _paywallPopular,
        // Empty limits are left out: the plan has no such limit.
        limits: {
          for (final MapEntry(:key, :value) in _limits.entries)
            if (value.text.trim().isNotEmpty) key: num.parse(value.text.trim()),
        },
        storeProductIds: {
          if (_appStore.text.trim().isNotEmpty)
            'app_store': _appStore.text.trim(),
          if (_googlePlay.text.trim().isNotEmpty)
            'google_play': _googlePlay.text.trim(),
        },
        dodoProductId: _text(_dodo, widget.plan.dodoProductId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const number = TextInputType.numberWithOptions(decimal: true);
    return FormSheet(
      icon: LucideIcons.gem,
      title: widget.plan.name,
      subtitle: l10n.adminPlanSaveHelp,
      submitLabel: l10n.save,
      submitKey: const Key('savePlan'),
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('planName'),
          controller: _name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.adminPlanName,
            helperText: widget.plan.code,
            errorText: _errors['name'],
          ),
        ),
        TextField(
          key: const Key('planPriceLabel'),
          controller: _price,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.adminPriceLabel,
            helperText: l10n.adminPriceLabelHelp,
          ),
        ),
        FormSwitch(
          key: const Key('planActive'),
          title: l10n.adminOnSale,
          subtitle: l10n.adminPlanActiveHelp,
          value: _active,
          onChanged: (v) => setState(() => _active = v),
        ),
        FormSwitch(
          key: const Key('planCreditGate'),
          title: l10n.adminCreditGate,
          subtitle: l10n.adminCreditGateHelp,
          value: _creditGate,
          onChanged: (v) => setState(() => _creditGate = v),
        ),
        FormSwitch(
          key: const Key('planPaywallDefault'),
          title: l10n.adminPaywallDefault,
          subtitle: l10n.adminPaywallDefaultHelp,
          value: _paywallDefault,
          onChanged: (v) => setState(() => _paywallDefault = v),
        ),
        FormSwitch(
          key: const Key('planPaywallPopular'),
          title: l10n.adminPaywallPopular,
          subtitle: l10n.adminPaywallPopularHelp,
          value: _paywallPopular,
          onChanged: (v) => setState(() => _paywallPopular = v),
        ),
        TextField(
          key: const Key('planSort'),
          controller: _sort,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.adminPlanSort,
            errorText: _errors['sort'],
          ),
        ),
        _Heading(l10n.adminPlanLimits),
        for (final MapEntry(:key, :value) in _limits.entries)
          TextField(
            key: Key('planLimit-$key'),
            controller: value,
            keyboardType: number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: _limitLabel(context, key),
              helperText: _limitLabel(context, key) == key ? null : key,
              errorText: _errors[key],
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                key: const Key('planNewLimitKey'),
                controller: _newKey,
                onSubmitted: (_) => _addLimit(),
                decoration: InputDecoration(
                  labelText: l10n.adminLimitKey,
                  errorText: _errors['newKey'],
                ),
              ),
            ),
            const SizedBox(width: AppSpace.xs),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: IconButton.filledTonal(
                key: const Key('planAddLimit'),
                tooltip: l10n.adminAddLimit,
                onPressed: _addLimit,
                icon: const Icon(LucideIcons.plus),
              ),
            ),
          ],
        ),
        _Heading(l10n.adminStoreProducts),
        ..._productFields(context, _appStore, _googlePlay, _dodo, 'plan'),
      ],
    );
  }
}

List<Widget> _productFields(
  BuildContext context,
  TextEditingController appStore,
  TextEditingController googlePlay,
  TextEditingController dodo,
  String prefix,
) {
  final l10n = context.l10n;
  return [
    TextField(
      key: Key('${prefix}AppStoreId'),
      controller: appStore,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: l10n.adminAppStoreId),
    ),
    TextField(
      key: Key('${prefix}GooglePlayId'),
      controller: googlePlay,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: l10n.adminGooglePlayId),
    ),
    TextField(
      key: Key('${prefix}DodoId'),
      controller: dodo,
      decoration: InputDecoration(labelText: l10n.adminDodoId),
    ),
  ];
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: AppSpace.xs),
    child: Text(
      text,
      style: context.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

/// Edits one credit pack.
class _PackEditor extends StatefulWidget {
  const _PackEditor({required this.pack});
  final AdminCreditPack pack;

  @override
  State<_PackEditor> createState() => _PackEditorState();
}

class _PackEditorState extends State<_PackEditor> {
  late final _name = TextEditingController(text: widget.pack.name);
  late final _credits = TextEditingController(
    text: _num(widget.pack.creditsUsd),
  );
  late final _price = TextEditingController(text: widget.pack.priceLabel);
  late final _appStore = TextEditingController(
    text: widget.pack.storeProductIds['app_store'],
  );
  late final _googlePlay = TextEditingController(
    text: widget.pack.storeProductIds['google_play'],
  );
  late final _dodo = TextEditingController(text: widget.pack.dodoProductId);
  late var _active = widget.pack.active;
  final _errors = <String, String>{};

  @override
  void dispose() {
    for (final c in [_name, _credits, _price, _appStore, _googlePlay, _dodo]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    final l10n = context.l10n;
    final errors = <String, String>{
      if (_name.text.trim().isEmpty) 'name': l10n.adminNameRequired,
      'credits': ?_checkNumber(context, _credits.text, positive: true),
    };
    setState(() {
      _errors
        ..clear()
        ..addAll(errors);
    });
    if (errors.isNotEmpty) return;
    Navigator.pop(
      context,
      SaveCreditPackRequest(
        name: _name.text.trim(),
        creditsUsd: num.parse(_credits.text.trim()),
        active: _active,
        priceLabel: _text(_price, widget.pack.priceLabel),
        storeProductIds: {
          if (_appStore.text.trim().isNotEmpty)
            'app_store': _appStore.text.trim(),
          if (_googlePlay.text.trim().isNotEmpty)
            'google_play': _googlePlay.text.trim(),
        },
        dodoProductId: _text(_dodo, widget.pack.dodoProductId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.creditCard,
      title: widget.pack.name,
      subtitle: l10n.adminPackSaveHelp,
      submitLabel: l10n.save,
      submitKey: const Key('savePack'),
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('packName'),
          controller: _name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.adminPlanName,
            helperText: widget.pack.code,
            errorText: _errors['name'],
          ),
        ),
        TextField(
          key: const Key('packCredits'),
          controller: _credits,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.adminPackCredits,
            errorText: _errors['credits'],
          ),
        ),
        TextField(
          key: const Key('packPriceLabel'),
          controller: _price,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.adminPriceLabel,
            helperText: l10n.adminPriceLabelHelp,
          ),
        ),
        FormSwitch(
          key: const Key('packActive'),
          title: l10n.adminOnSale,
          value: _active,
          onChanged: (v) => setState(() => _active = v),
        ),
        _Heading(l10n.adminStoreProducts),
        ..._productFields(context, _appStore, _googlePlay, _dodo, 'pack'),
      ],
    );
  }
}

/// Sets the multiplier on what Casama pays for usage on its own keys.
class _MarkupEditor extends StatefulWidget {
  const _MarkupEditor({required this.markup});
  final num markup;

  @override
  State<_MarkupEditor> createState() => _MarkupEditorState();
}

class _MarkupEditorState extends State<_MarkupEditor> {
  late final _markup = TextEditingController(text: _num(widget.markup));
  String? _error;

  @override
  void dispose() {
    _markup.dispose();
    super.dispose();
  }

  void _submit() {
    final l10n = context.l10n;
    final v = num.tryParse(_markup.text.trim());
    if (v == null || !v.isFinite || v < 1) {
      setState(() => _error = l10n.adminMarkupTooLow);
      return;
    }
    Navigator.pop(context, v);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.percent,
      title: l10n.adminMarkup,
      subtitle: l10n.adminMarkupHelp,
      submitLabel: l10n.save,
      submitKey: const Key('saveMarkup'),
      onSubmit: _submit,
      children: [
        TextField(
          key: const Key('markupValue'),
          controller: _markup,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            labelText: l10n.adminMarkup,
            helperText: l10n.adminMarkupHelp,
            errorText: _error,
          ),
        ),
      ],
    );
  }
}
