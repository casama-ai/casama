import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../core/haptics.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../../ui/segmented.dart';
import 'admin_nav.dart';
import 'admin_search.dart';
import 'app_settings_card.dart';
import 'haptics_lab.dart';
import 'remote_settings_cards.dart';
import 'ui/admin_ui.dart';
import '../app_browser/app_browser_admin.dart';
import '../app_browser/app_browser_flag.dart';

final _adminServicesProvider = FutureProvider<List<AdminService>>((r) => r.watch(backendProvider).adminServices());
final _connectionSettingsProvider = FutureProvider.autoDispose<ConnectionSettings>((r) => r.watch(backendProvider).adminConnectionSettings());
final _cloudModelsProvider = FutureProvider.autoDispose<CloudModels>((r) => r.watch(backendProvider).adminCloudModels());
final _modelAccessProvider = FutureProvider.autoDispose<AdminModelAccess>((r) => r.watch(backendProvider).adminModelAccess());

/// How a service is doing, worst first: the order the health list sorts by.
enum _Health { down, ok, off }

_Health _healthOf(AdminService s) => !s.configured ? _Health.off : (s.healthy == false ? _Health.down : _Health.ok);

/// Services: health first (what the owner checks most), then models, connections, app settings
/// and the JSON settings under Advanced (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §6).
class ServicesTab extends ConsumerWidget {
  const ServicesTab({super.key});

  // Readable width: these are settings rows, not a table.
  static const double _maxWidth = 820;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final services = ref.watch(_adminServicesProvider);
    Future<void> refresh() async {
      ref.invalidate(_adminServicesProvider);
      ref.invalidate(_connectionSettingsProvider);
      ref.invalidate(_cloudModelsProvider);
      ref.invalidate(_modelAccessProvider);
      await ref.read(_adminServicesProvider.future).then<void>((_) {}, onError: (_) {});
    }

    return AsyncView(
      value: services,
      onRetry: () => ref.invalidate(_adminServicesProvider),
      loading: const _ServicesSkeleton(),
      data: (items) {
        final sorted = [...items]..sort((a, b) => _healthOf(a).index.compareTo(_healthOf(b).index));
        final down = items.where((s) => _healthOf(s) == _Health.down).length;
        return AdminSectionList(
          maxWidth: _maxWidth,
          onRefresh: refresh,
          children: [
            AdminSectionHeader(
              section: AdminSection.services,
              summary: down > 0 ? l10n.adminServicesDownSummary(down) : (items.isEmpty ? null : l10n.adminServicesAllOk),
              onRefresh: refresh,
            ),
            AdminAnchor(id: AdminAnchors.health, child: _ServiceHealth(items: sorted)),
            SectionHeader(title: l10n.adminServicesModels),
            const AdminAnchor(id: AdminAnchors.models, child: _ModelsGroup()),
            const AdminAnchor(id: AdminAnchors.connections, child: _ConnectionSettingsCard()),
            SectionHeader(title: l10n.adminAppSettings),
            const AdminAnchor(id: AdminAnchors.appSettings, child: AppSettingsCard()),
            // The browser inside the phone app's stage (docs/PHONE-BROWSER-PLAN.md §6).
            if (kAppBrowserCode) const AdminAnchor(id: AdminAnchors.appBrowser, child: AppBrowserAdminCard()),
            // Lists the owner edits without a release (D-373, D-374).
            SectionHeader(title: l10n.adminServicesAdvanced),
            const AdminAnchor(
              id: AdminAnchors.advanced,
              child: GroupedCard(
                children: [
                  AdminJsonSettingTile(kind: AdminJsonSettingKind.modelCatalog),
                  AdminJsonSettingTile(kind: AdminJsonSettingKind.browserGuard),
                  AdminJsonSettingTile(kind: AdminJsonSettingKind.callLimits),
                  HapticsLabAdminTile(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// The health group: OK / down / off counts, then every service with a status pill, down first.
class _ServiceHealth extends StatelessWidget {
  const _ServiceHealth({required this.items});
  final List<AdminService> items;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    int count(_Health h) => items.where((s) => _healthOf(s) == h).length;
    final ok = count(_Health.ok);
    final down = count(_Health.down);
    final off = count(_Health.off);
    return Column(
      key: const Key('servicesHealth'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.adminServicesHealth, padding: const EdgeInsets.fromLTRB(AppSpace.xxs, 0, AppSpace.xxs, AppSpace.xs)),
        if (items.isEmpty)
          AdminEmptyCard(icon: LucideIcons.serverCog, message: l10n.adminServicesEmpty)
        else ...[
          AdminStatStrip(
            maxColumns: 3,
            stats: [
              AdminStat(key: const Key('servicesOk'), label: l10n.serviceOk, value: '$ok', icon: LucideIcons.circleCheck, tone: ok > 0 ? AdminTone.positive : null),
              AdminStat(key: const Key('servicesDown'), label: l10n.serviceDown, value: '$down', icon: LucideIcons.circleAlert, tone: down > 0 ? AdminTone.negative : null),
              AdminStat(key: const Key('servicesOff'), label: l10n.serviceOff, value: '$off', icon: LucideIcons.circleMinus),
            ],
          ),
          GroupedCard(
            children: [
              for (final s in items) _ServiceRow(service: s),
            ],
          ),
        ],
      ],
    );
  }
}

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({required this.service});
  final AdminService service;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (icon, tone, label) = switch (_healthOf(service)) {
      _Health.down => (LucideIcons.circleAlert, AdminTone.negative, l10n.serviceDown),
      _Health.ok => (LucideIcons.circleCheck, AdminTone.positive, l10n.serviceOk),
      _Health.off => (LucideIcons.circleMinus, AdminTone.neutral, l10n.serviceOff),
    };
    return GroupedTile(
      key: Key('service-${service.name}'),
      icon: icon,
      iconColor: adminToneColor(context, tone),
      title: service.name,
      subtitle: service.detail,
      trailing: AdminStatusPill(label, tone: tone),
    );
  }
}

/// The services before they load: the header line, the three counts, then rows with a pill.
class _ServicesSkeleton extends StatelessWidget {
  const _ServicesSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonPage(
      maxWidth: ServicesTab._maxWidth,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: AppSpace.xs, bottom: AppSpace.lg),
          child: SkeletonBone(width: 220, height: 14),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: AppSpace.md),
          child: Row(
            spacing: AppSpace.sm,
            children: [
              Expanded(child: SkeletonBone(height: 58, radius: AppRadius.card)),
              Expanded(child: SkeletonBone(height: 58, radius: AppRadius.card)),
              Expanded(child: SkeletonBone(height: 58, radius: AppRadius.card)),
            ],
          ),
        ),
        SkeletonGroupedCard(
          rows: [
            for (final (t, st) in const [(0.34, 0.6), (0.46, 0.72), (0.28, 0.5), (0.4, 0.66), (0.5, 0.56)])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SkeletonRow(padding: EdgeInsets.zero, trailing: SkeletonTrailing.none, titleWidth: t, subtitleWidth: st),
                    ),
                    const SizedBox(width: AppSpace.xs),
                    const SkeletonBone(width: 44, height: 22, radius: AppRadius.pill),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}

/// The models group: the models Casama Cloud runs (D-188) and who may use which (model access).
/// Each row appears once its setting has loaded.
class _ModelsGroup extends ConsumerWidget {
  const _ModelsGroup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final models = ref.watch(_cloudModelsProvider).value;
    final access = ref.watch(_modelAccessProvider).value;
    if (models == null && access == null) return const SizedBox.shrink();
    return GroupedCard(
      children: [
        if (models != null)
          GroupedTile(
            key: const Key('cloudModels'),
            icon: LucideIcons.sparkles,
            title: l10n.cloudModelsTitle,
            subtitle: l10n.adminCloudModelsSummary(_modelCount(models), models.chat),
            onTap: () async {
              final next = await showAdaptiveSheet<CloudModels>(
                context: context,
                heightFactor: 0.9,
                dialogMaxWidth: 640,
                builder: (_) => _CloudModelsSheet(current: models),
              );
              if (next == null || !context.mounted) return;
              final ok = await runGuarded(context, () => ref.read(backendProvider).setAdminCloudModels(next));
              if (ok == null) return;
              ref.invalidate(_cloudModelsProvider);
              if (context.mounted) showSuccess(context, l10n.saved);
            },
          ),
        if (access != null)
          GroupedTile(
            key: const Key('adminModelAccess'),
            icon: LucideIcons.keyRound,
            title: l10n.adminModelAccessTitle,
            subtitle: _accessSummary(context, access),
            onTap: () async {
              final next = await showAdaptiveSheet<AdminModelAccess>(
                context: context,
                builder: (_) => _ModelAccessSheet(current: access),
              );
              if (next == null || !context.mounted) return;
              final ok = await runGuarded(context, () => ref.read(backendProvider).setAdminModelAccess(next));
              if (ok == null) return;
              ref.invalidate(_modelAccessProvider);
              if (context.mounted) showSuccess(context, l10n.saved);
            },
          ),
      ],
    );
  }
}

/// How many different models the Cloud runs (chat and background often share one).
int _modelCount(CloudModels m) =>
    {m.chat, m.background, m.image, m.video, m.live, m.tts, m.stt, m.embedding}.where((id) => id.trim().isNotEmpty).length;

String _accessSummary(BuildContext context, AdminModelAccess access) {
  final l10n = context.l10n;
  final def = access.casamaModels.default_ == AdminModelAccessCasamaModelsDefault_Enum.on_ ? l10n.on : l10n.off;
  final line = '${l10n.adminCasamaModelsDefault}: $def';
  return access.ownProviders ? '$line\n${l10n.adminOwnProviders}' : line;
}

class _CloudModelsSheet extends StatefulWidget {
  const _CloudModelsSheet({required this.current});
  final CloudModels current;

  @override
  State<_CloudModelsSheet> createState() => _CloudModelsSheetState();
}

class _CloudModelsSheetState extends State<_CloudModelsSheet> {
  late final _chat = TextEditingController(text: widget.current.chat);
  late final _background = TextEditingController(text: widget.current.background);
  late final _image = TextEditingController(text: widget.current.image);
  late final _live = TextEditingController(text: widget.current.live);
  late final _tts = TextEditingController(text: widget.current.tts);
  late final _stt = TextEditingController(text: widget.current.stt);
  late final _embedding = TextEditingController(text: widget.current.embedding);
  late final _video = TextEditingController(text: widget.current.video);
  late var _resolution = widget.current.imageResolution;

  /// Fields left empty on the last save, shown with an inline error until filled.
  final _empty = <TextEditingController>{};

  List<TextEditingController> get _all => [_chat, _background, _image, _video, _live, _tts, _stt, _embedding];

  @override
  void dispose() {
    for (final c in _all) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    final empty = _all.where((c) => c.text.trim().isEmpty).toSet();
    if (empty.isNotEmpty) {
      HapticsHelper.error();
      setState(() {
        _empty
          ..clear()
          ..addAll(empty);
      });
      return;
    }
    Navigator.pop(
      context,
      widget.current.copyWith(
        chat: _chat.text.trim(),
        background: _background.text.trim(),
        image: _image.text.trim(),
        imageResolution: _resolution,
        live: _live.text.trim(),
        tts: _tts.text.trim(),
        stt: _stt.text.trim(),
        embedding: _embedding.text.trim(),
        video: _video.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Next moves down the list. Images is followed by the size control, so its key just closes
    // the keyboard. Done on the last field saves.
    Widget box(Key key, TextEditingController controller, String label, String help, {TextInputAction action = TextInputAction.next, bool last = false}) => TextField(
      key: key,
      controller: controller,
      autocorrect: false,
      textInputAction: last ? TextInputAction.done : action,
      onSubmitted: last ? (_) => _submit() : null,
      onChanged: (_) {
        if (_empty.contains(controller) && controller.text.trim().isNotEmpty) setState(() => _empty.remove(controller));
      },
      decoration: InputDecoration(
        labelText: label,
        helperText: help,
        errorText: _empty.contains(controller) ? l10n.adminCloudRequired : null,
      ),
    );
    return FormSheet(
      icon: LucideIcons.sparkles,
      title: l10n.cloudModelsTitle,
      subtitle: l10n.cloudModelsHelp,
      submitLabel: l10n.save,
      submitKey: const Key('saveCloudModels'),
      onSubmit: _submit,
      children: [
        _FieldGroup(l10n.adminCloudGroupChat, first: true),
        box(const Key('cloudChat'), _chat, l10n.adminCloudChat, l10n.adminCloudChatHelp),
        box(const Key('cloudBackground'), _background, l10n.adminCloudBackground, l10n.adminCloudBackgroundHelp),
        _FieldGroup(l10n.adminCloudGroupMedia),
        box(const Key('cloudImage'), _image, l10n.adminCloudImage, l10n.adminCloudImageHelp, action: TextInputAction.done),
        DropdownButtonFormField<CloudModelsImageResolutionEnum>(
          key: const Key('cloudImageResolution'),
          initialValue: _resolution,
          decoration: InputDecoration(labelText: l10n.adminCloudImageSize, helperText: l10n.adminCloudImageSizeHelp),
          items: [
            for (final r in CloudModelsImageResolutionEnum.values)
              DropdownMenuItem(value: r, child: Text(r.value)),
          ],
          onChanged: hapticOnChanged((v) {
            if (v != null) setState(() => _resolution = v);
          }),
        ),
        box(const Key('cloudVideo'), _video, l10n.adminCloudVideo, l10n.adminCloudVideoHelp),
        // Calls go to Google's Gemini Live; the rest are OpenRouter model ids (D-261).
        _FieldGroup(l10n.adminCloudGroupVoice),
        box(const Key('cloudLive'), _live, l10n.adminCloudLive, l10n.adminCloudLiveHelp),
        box(const Key('cloudTts'), _tts, l10n.adminCloudTts, l10n.adminCloudTtsHelp),
        box(const Key('cloudStt'), _stt, l10n.adminCloudStt, l10n.adminCloudSttHelp),
        _FieldGroup(l10n.adminCloudGroupEmbeddings),
        box(const Key('cloudEmbedding'), _embedding, l10n.adminCloudEmbedding, l10n.adminCloudEmbeddingHelp, last: true),
      ],
    );
  }
}

/// A small heading over a group of fields in a sheet.
class _FieldGroup extends StatelessWidget {
  const _FieldGroup(this.text, {this.first = false});
  final String text;
  final bool first;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(top: first ? 0 : AppSpace.xs),
    child: Semantics(
      header: true,
      child: Text(
        text,
        style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, color: context.colorScheme.onSurfaceVariant),
      ),
    ),
  );
}

class _ModelAccessSheet extends StatefulWidget {
  const _ModelAccessSheet({required this.current});
  final AdminModelAccess current;

  @override
  State<_ModelAccessSheet> createState() => _ModelAccessSheetState();
}

class _ModelAccessSheetState extends State<_ModelAccessSheet> {
  late var _ownProviders = widget.current.ownProviders;
  late var _default = widget.current.casamaModels.default_;
  late final Map<String, String> _plans = {
    for (final e in widget.current.casamaModels.plans.entries)
      e.key: e.value.value,
  };
  late final _note = TextEditingController(text: widget.current.note ?? '');

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final label = context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600);
    Widget labeled(String text, Widget control) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [Text(text, style: label), const SizedBox(height: AppSpace.xxs), control],
    );
    return FormSheet(
      icon: LucideIcons.keyRound,
      title: l10n.adminModelAccessTitle,
      subtitle: l10n.adminModelAccessHelp,
      submitLabel: l10n.save,
      submitKey: const Key('saveModelAccess'),
      onSubmit: () {
        final plans = <String, AdminModelAccessCasamaModelsPlansEnum>{
          for (final e in _plans.entries)
            if (e.value == 'on')
              e.key: AdminModelAccessCasamaModelsPlansEnum.on_
            else if (e.value == 'off')
              e.key: AdminModelAccessCasamaModelsPlansEnum.off,
        };
        Navigator.pop(
          context,
          AdminModelAccess(
            ownProviders: _ownProviders,
            casamaModels: AdminModelAccessCasamaModels(
              default_: _default,
              plans: plans,
            ),
            note: _note.text.trim().isEmpty ? null : _note.text.trim(),
          ),
        );
      },
      children: [
        SwitchListTile(
          key: const Key('adminOwnProvidersSwitch'),
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.adminOwnProviders),
          subtitle: Text(l10n.adminModelAccessHelp),
          value: _ownProviders,
          onChanged: (v) => setState(() => _ownProviders = v),
        ),
        labeled(
          l10n.adminCasamaModelsDefault,
          AppSegmentedControl<AdminModelAccessCasamaModelsDefault_Enum>(
            key: const Key('adminCasamaModelsDefault'),
            values: const [AdminModelAccessCasamaModelsDefault_Enum.on_, AdminModelAccessCasamaModelsDefault_Enum.off],
            labels: {
              AdminModelAccessCasamaModelsDefault_Enum.on_: l10n.on,
              AdminModelAccessCasamaModelsDefault_Enum.off: l10n.off,
            },
            groupValue: _default,
            onValueChanged: (v) => setState(() => _default = v),
          ),
        ),
        // Each tier also covers its yearly and weekly plans (server: basePlanTier).
        for (final plan in const ['free', 'plus', 'pro', 'max'])
          labeled(
            l10n.adminModelAccessPlan('${plan[0].toUpperCase()}${plan.substring(1)}'),
            AppSegmentedControl<String>(
              key: Key('adminCasamaModelsPlan-$plan'),
              values: const ['default', 'on', 'off'],
              labels: {'default': l10n.adminModelAccessDefaultShort, 'on': l10n.on, 'off': l10n.off},
              groupValue: _plans[plan] ?? 'default',
              onValueChanged: (v) => setState(() {
                if (v == 'default') {
                  _plans.remove(plan);
                } else {
                  _plans[plan] = v;
                }
              }),
            ),
          ),
        TextField(
          key: const Key('adminModelAccessNote'),
          controller: _note,
          decoration: InputDecoration(labelText: l10n.adminCasamaModelsNote),
        ),
      ],
    );
  }
}

/// How apps without their own sign-in connect (D-173): Casama's Composio account (one click) or
/// people's own accounts. Takes effect on the server within seconds.
class _ConnectionSettingsCard extends ConsumerWidget {
  const _ConnectionSettingsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settings = ref.watch(_connectionSettingsProvider).value;
    if (settings == null) return const SizedBox.shrink();
    final server = settings.composio == ConnectionSettingsComposioEnum.server && settings.composioKey;
    Future<void> save({bool? serverComposio, bool? googleDirect}) async {
      await runGuarded(
        context,
        () => ref
            .read(backendProvider)
            .setAdminConnectionSettings(serverComposio: serverComposio, googleDirect: googleDirect),
      );
      ref.invalidate(_connectionSettingsProvider);
      ref.invalidate(appCatalogProvider);
    }

    Future<void> choose(bool serverComposio) => save(serverComposio: serverComposio);
    // Google's own servers vs Composio (D-166): a real choice only with both a Google client and
    // the server's Composio account in use, and never on Casama Cloud.
    final googleChoice = settings.googleDirectAvailable && server;
    final googleDirect = settings.google == ConnectionSettingsGoogleEnum.direct;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.connectionsTitle),
        GroupedCard(
          children: [
            GroupedTile(
              key: const Key('connectionsServer'),
              icon: server ? LucideIcons.circleCheck : LucideIcons.circle,
              iconColor: server ? context.colorScheme.primary : null,
              title: l10n.connectionsServerComposio,
              subtitle: settings.composioKey ? l10n.connectionsServerComposioHelp : l10n.connectionsNoComposioKey,
              onTap: settings.composioKey && !server ? () => choose(true) : null,
            ),
            GroupedTile(
              key: const Key('connectionsOwn'),
              icon: !server ? LucideIcons.circleCheck : LucideIcons.circle,
              iconColor: !server ? context.colorScheme.primary : null,
              title: l10n.connectionsOwnAccounts,
              subtitle: l10n.connectionsOwnAccountsHelp,
              onTap: server ? () => choose(false) : null,
            ),
          ],
        ),
        if (googleChoice) ...[
          SectionHeader(title: l10n.connectionsGoogleTitle),
          GroupedCard(
            children: [
              GroupedTile(
                key: const Key('connectionsGoogleComposio'),
                icon: !googleDirect ? LucideIcons.circleCheck : LucideIcons.circle,
                iconColor: !googleDirect ? context.colorScheme.primary : null,
                title: l10n.connectionsGoogleComposio,
                subtitle: l10n.connectionsGoogleComposioHelp,
                onTap: googleDirect ? () => save(googleDirect: false) : null,
              ),
              GroupedTile(
                key: const Key('connectionsGoogleDirect'),
                icon: googleDirect ? LucideIcons.circleCheck : LucideIcons.circle,
                iconColor: googleDirect ? context.colorScheme.primary : null,
                title: l10n.connectionsGoogleDirect,
                subtitle: l10n.connectionsGoogleDirectHelp,
                onTap: !googleDirect ? () => save(googleDirect: true) : null,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
