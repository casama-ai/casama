import 'dart:async';

import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import 'admin_nav.dart';
import 'ui/admin_ui.dart';
import 'workspaces_tab.dart' show AdminPeopleSkeleton;

final adminTestimonialsProvider =
    FutureProvider.autoDispose<List<AdminTestimonial>>(
      (ref) => ref.watch(backendProvider).adminTestimonials(),
    );

enum _Filter { all, live, draft, hidden, withdrawn }

bool _isPlaceholder(String quote) =>
    RegExp(r'^\s*\[placeholder', caseSensitive: false).hasMatch(quote);

(String, AdminTone) testimonialStateLabel(
  BuildContext context,
  TestimonialState s,
) {
  final l10n = context.l10n;
  return switch (s) {
    TestimonialState.live => (l10n.testimonialStateLive, AdminTone.positive),
    TestimonialState.draft => (l10n.testimonialStateDraft, AdminTone.info),
    TestimonialState.hidden => (l10n.testimonialStateHidden, AdminTone.neutral),
    TestimonialState.withdrawn => (
      l10n.testimonialStateWithdrawn,
      AdminTone.negative,
    ),
  };
}

String testimonialPlaceLabel(BuildContext context, TestimonialPlace p) {
  final l10n = context.l10n;
  return switch (p) {
    TestimonialPlace.siteHome => l10n.testimonialPlaceSiteHome,
    TestimonialPlace.sitePricing => l10n.testimonialPlaceSitePricing,
    TestimonialPlace.appPaywall => l10n.testimonialPlaceAppPaywall,
    TestimonialPlace.appSignin => l10n.testimonialPlaceAppSignin,
  };
}

String testimonialSourceLabel(BuildContext context, TestimonialSource s) {
  final l10n = context.l10n;
  return switch (s) {
    TestimonialSource.email => l10n.testimonialSourceEmail,
    TestimonialSource.inApp => l10n.testimonialSourceInApp,
    TestimonialSource.toolradar => 'Toolradar',
    TestimonialSource.appStore => 'App Store',
    TestimonialSource.play => 'Google Play',
    TestimonialSource.other => l10n.testimonialSourceOther,
  };
}

/// Admin console > Testimonials (D-545, docs/TESTIMONIALS-PLAN.md): quotes from real people with
/// their consent on record. The owner adds what people agreed to by email, reads the drafts the
/// app's ask sends, chooses where each shows, puts live ones in order, and hides or withdraws them.
class TestimonialsTab extends ConsumerStatefulWidget {
  const TestimonialsTab({super.key});

  @override
  ConsumerState<TestimonialsTab> createState() => _TestimonialsTabState();
}

class _TestimonialsTabState extends ConsumerState<TestimonialsTab> {
  _Filter _filter = _Filter.all;

  Future<void> _refresh() async {
    ref.invalidate(adminTestimonialsProvider);
    await ref
        .read(adminTestimonialsProvider.future)
        .catchError((_) => <AdminTestimonial>[]);
  }

  Future<void> _edit([AdminTestimonial? t]) async {
    final saved = await showAdaptiveSheet<bool>(
      context: context,
      builder: (_) => TestimonialEditSheet(existing: t),
    );
    if (saved == true && mounted) ref.invalidate(adminTestimonialsProvider);
  }

  Future<void> _move(List<AdminTestimonial> live, int from, int to) async {
    final ids = [for (final t in live) t.id];
    final id = ids.removeAt(from);
    ids.insert(to, id);
    final r = await runGuarded(
      context,
      () => ref.read(backendProvider).adminReorderTestimonials(ids),
    );
    if (r != null && mounted) ref.invalidate(adminTestimonialsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AsyncView<List<AdminTestimonial>>(
      value: ref.watch(adminTestimonialsProvider),
      onRetry: () => ref.invalidate(adminTestimonialsProvider),
      loading: const AdminPeopleSkeleton(stats: 0),
      data: (items) {
        final live = [
          for (final t in items)
            if (t.state == TestimonialState.live) t,
        ]..sort((a, b) => a.sort.compareTo(b.sort));
        final header = AdminSectionHeader(
          section: AdminSection.testimonials,
          summary: items.isEmpty
              ? null
              : l10n.adminTestimonialsSummary(
                  live.length,
                  items.where((t) => t.state == TestimonialState.draft).length,
                ),
          onRefresh: _refresh,
          actions: [
            FilledButton.icon(
              key: const Key('adminTestimonialAdd'),
              onPressed: () => unawaited(_edit()),
              icon: const Icon(LucideIcons.plus, size: 16),
              label: Text(l10n.adminTestimonialsAdd),
            ),
          ],
        );
        final note = Padding(
          padding: const EdgeInsets.only(bottom: AppSpace.md),
          child: FormNote(
            l10n.adminTestimonialsWhereNote(kMinSiteHome, kMinElsewhere),
            icon: LucideIcons.info,
          ),
        );
        if (items.isEmpty) {
          return AdminSectionList(
            onRefresh: _refresh,
            children: [
              header,
              note,
              AdminEmptyCard(
                icon: LucideIcons.quote,
                message: l10n.adminTestimonialsEmpty,
              ),
            ],
          );
        }
        TestimonialState? stateOf(_Filter f) => switch (f) {
          _Filter.all => null,
          _Filter.live => TestimonialState.live,
          _Filter.draft => TestimonialState.draft,
          _Filter.hidden => TestimonialState.hidden,
          _Filter.withdrawn => TestimonialState.withdrawn,
        };
        final counts = {
          for (final f in _Filter.values)
            f: f == _Filter.all
                ? items.length
                : items.where((t) => t.state == stateOf(f)).length,
        };
        final visible = _filter == _Filter.all
            ? items
            : [
                for (final t in items)
                  if (t.state == stateOf(_filter)) t,
              ];
        return AdminSectionList(
          onRefresh: _refresh,
          children: [
            header,
            note,
            AdminListToolbar(
              filters: AdminFilterChips<_Filter>(
                values: _Filter.values,
                labels: {
                  _Filter.all: l10n.adminPeopleAll,
                  _Filter.live: l10n.testimonialStateLive,
                  _Filter.draft: l10n.testimonialStateDraft,
                  _Filter.hidden: l10n.testimonialStateHidden,
                  _Filter.withdrawn: l10n.testimonialStateWithdrawn,
                },
                counts: counts,
                selected: _filter,
                onSelected: (f) => setState(() => _filter = f),
              ),
            ),
            if (visible.isEmpty)
              AdminEmptyCard(
                icon: LucideIcons.searchX,
                message: l10n.adminTestimonialsNoMatch,
              )
            else
              GroupedCard(
                key: const Key('adminTestimonialList'),
                children: [
                  for (final t in visible)
                    _Row(
                      item: t,
                      onTap: () => unawaited(_edit(t)),
                      onUp:
                          t.state == TestimonialState.live &&
                              live.indexOf(t) > 0
                          ? () => unawaited(
                              _move(live, live.indexOf(t), live.indexOf(t) - 1),
                            )
                          : null,
                      onDown:
                          t.state == TestimonialState.live &&
                              live.indexOf(t) < live.length - 1
                          ? () => unawaited(
                              _move(live, live.indexOf(t), live.indexOf(t) + 1),
                            )
                          : null,
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}

/// The plan's minimums (§7), said in the console so an empty site section isn't a surprise.
const kMinSiteHome = 3;
const kMinElsewhere = 2;

class _Row extends StatelessWidget {
  const _Row({required this.item, required this.onTap, this.onUp, this.onDown});
  final AdminTestimonial item;
  final VoidCallback onTap;
  final VoidCallback? onUp;
  final VoidCallback? onDown;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final t = item;
    final (label, tone) = testimonialStateLabel(context, t.state);
    final muted = context.textTheme.bodySmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      height: 1.3,
    );
    final byline = [
      t.nameShown,
      if ((t.roleShown ?? '').isNotEmpty) t.roleShown!,
      testimonialSourceLabel(context, t.source_),
    ].join(' · ');
    return InkWell(
      key: Key('adminTestimonial-${t.id}'),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppSpace.md,
          12,
          AppSpace.xs,
          12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '“${t.quote}”',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(byline, style: muted),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      AdminStatusPill(label, tone: tone),
                      if (t.consentText == null)
                        AdminStatusPill(
                          l10n.adminTestimonialNoConsent,
                          tone: AdminTone.warning,
                          icon: LucideIcons.triangleAlert,
                        ),
                      if (_isPlaceholder(t.quote))
                        AdminStatusPill(
                          l10n.adminTestimonialPlaceholder,
                          tone: AdminTone.warning,
                          icon: LucideIcons.pencil,
                        ),
                      for (final p in t.places)
                        AdminStatusPill(testimonialPlaceLabel(context, p)),
                    ],
                  ),
                ],
              ),
            ),
            if (onUp != null || onDown != null)
              Column(
                children: [
                  IconButton(
                    key: Key('adminTestimonialUp-${t.id}'),
                    tooltip: l10n.adminTestimonialMoveUp,
                    onPressed: onUp,
                    icon: const Icon(LucideIcons.chevronUp, size: 18),
                  ),
                  IconButton(
                    key: Key('adminTestimonialDown-${t.id}'),
                    tooltip: l10n.adminTestimonialMoveDown,
                    onPressed: onDown,
                    icon: const Icon(LucideIcons.chevronDown, size: 18),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

/// Adds or edits one quote: the words, who and where it's from, the consent record, where it shows
/// and its state. Every field is sent on save, so clearing one clears it.
class TestimonialEditSheet extends ConsumerStatefulWidget {
  const TestimonialEditSheet({super.key, this.existing});
  final AdminTestimonial? existing;

  @override
  ConsumerState<TestimonialEditSheet> createState() =>
      _TestimonialEditSheetState();
}

class _TestimonialEditSheetState extends ConsumerState<TestimonialEditSheet> {
  late final _quote = TextEditingController(text: widget.existing?.quote);
  late final _name = TextEditingController(text: widget.existing?.nameShown);
  late final _role = TextEditingController(text: widget.existing?.roleShown);
  late final _url = TextEditingController(text: widget.existing?.sourceUrl);
  late final _consent = TextEditingController(
    text: widget.existing?.consentText,
  );
  late final _email = TextEditingController(text: widget.existing?.userEmail);
  late final _incentive = TextEditingController(
    text: widget.existing?.incentiveNote,
  );
  late final _notes = TextEditingController(text: widget.existing?.notes);
  late var _source = widget.existing?.source_ ?? TestimonialSource.email;
  late var _state = widget.existing?.state ?? TestimonialState.draft;
  late var _rating = widget.existing?.rating ?? 0;
  late final _places = <TestimonialPlace>{...?widget.existing?.places};
  var _busy = false;

  @override
  void dispose() {
    for (final c in [
      _quote,
      _name,
      _role,
      _url,
      _consent,
      _email,
      _incentive,
      _notes,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final quote = _quote.text.trim();
    final name = _name.text.trim();
    if (quote.isEmpty || name.isEmpty) return;
    setState(() => _busy = true);
    final backend = ref.read(backendProvider);
    final places = [
      for (final p in TestimonialPlace.values)
        if (_places.contains(p)) p,
    ];
    final existing = widget.existing;
    final saved = await runGuarded(context, () async {
      if (existing == null) {
        return backend.adminCreateTestimonial(
          CreateAdminTestimonialRequest(
            quote: quote,
            nameShown: name,
            roleShown: _role.text.trim(),
            source_: _source,
            sourceUrl: _url.text.trim(),
            consentText: _consent.text.trim(),
            userEmail: _email.text.trim().isEmpty ? null : _email.text.trim(),
            rating: _rating,
            incentiveNote: _incentive.text.trim(),
            places: places,
            state: _state,
            notes: _notes.text.trim(),
          ),
        );
      }
      return backend.adminUpdateTestimonial(
        existing.id,
        UpdateAdminTestimonialRequest(
          quote: quote,
          nameShown: name,
          roleShown: _role.text.trim(),
          source_: _source,
          sourceUrl: _url.text.trim(),
          consentText: _consent.text.trim(),
          userEmail: _email.text.trim(),
          rating: _rating,
          incentiveNote: _incentive.text.trim(),
          places: places,
          state: _state,
          notes: _notes.text.trim(),
        ),
      );
    });
    if (!mounted) return;
    setState(() => _busy = false);
    if (saved != null) Navigator.pop(context, true);
  }

  Future<void> _delete() async {
    final l10n = context.l10n;
    final ok = await adminConfirm(
      context,
      title: l10n.adminTestimonialDeleteTitle,
      message: l10n.adminTestimonialDeleteMessage,
      confirmLabel: l10n.adminTestimonialDelete,
      destructive: true,
      confirmKey: const Key('adminTestimonialDeleteConfirm'),
    );
    if (!ok || !mounted) return;
    final done = await runGuarded(context, () async {
      await ref
          .read(backendProvider)
          .adminDeleteTestimonial(widget.existing!.id);
      return true;
    });
    if (done == true && mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormSheet(
      icon: LucideIcons.quote,
      title: widget.existing == null
          ? l10n.adminTestimonialsAdd
          : l10n.adminTestimonialEdit,
      submitLabel: l10n.save,
      submitKey: const Key('adminTestimonialSave'),
      busy: _busy,
      onSubmit: _save,
      footer: widget.existing == null
          ? null
          : TextButton.icon(
              key: const Key('adminTestimonialDelete'),
              onPressed: _delete,
              icon: Icon(
                LucideIcons.trash2,
                size: 16,
                color: context.colorScheme.error,
              ),
              label: Text(
                l10n.adminTestimonialDelete,
                style: TextStyle(color: context.colorScheme.error),
              ),
            ),
      children: [
        TextField(
          key: const Key('adminTestimonialQuote'),
          controller: _quote,
          minLines: 2,
          maxLines: 5,
          maxLength: 280,
          decoration: InputDecoration(
            labelText: l10n.adminTestimonialQuote,
            helperText: l10n.adminTestimonialQuoteHelp,
            helperMaxLines: 2,
          ),
        ),
        TextField(
          key: const Key('adminTestimonialName'),
          controller: _name,
          maxLength: 60,
          decoration: InputDecoration(labelText: l10n.adminTestimonialName),
        ),
        TextField(
          controller: _role,
          maxLength: 80,
          decoration: InputDecoration(labelText: l10n.adminTestimonialRole),
        ),
        DropdownButtonFormField<TestimonialSource>(
          initialValue: _source,
          decoration: InputDecoration(labelText: l10n.adminTestimonialSource),
          items: [
            for (final s in TestimonialSource.values)
              DropdownMenuItem(
                value: s,
                child: Text(testimonialSourceLabel(context, s)),
              ),
          ],
          onChanged: (v) => setState(() => _source = v ?? _source),
        ),
        TextField(
          controller: _url,
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            labelText: l10n.adminTestimonialSourceUrl,
          ),
        ),
        TextField(
          key: const Key('adminTestimonialConsent'),
          controller: _consent,
          minLines: 2,
          maxLines: 6,
          decoration: InputDecoration(
            labelText: l10n.adminTestimonialConsent,
            helperText: l10n.adminTestimonialConsentHelp,
            helperMaxLines: 2,
          ),
        ),
        TextField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: l10n.adminTestimonialAccount,
            helperText: l10n.adminTestimonialAccountHelp,
            helperMaxLines: 2,
          ),
        ),
        DropdownButtonFormField<int>(
          initialValue: _rating,
          decoration: InputDecoration(labelText: l10n.adminTestimonialRating),
          items: [
            DropdownMenuItem(
              value: 0,
              child: Text(l10n.adminTestimonialNoRating),
            ),
            for (var i = 5; i >= 1; i--)
              DropdownMenuItem(value: i, child: Text(l10n.testimonialStars(i))),
          ],
          onChanged: (v) => setState(() => _rating = v ?? 0),
        ),
        TextField(
          controller: _incentive,
          maxLength: 80,
          decoration: InputDecoration(
            labelText: l10n.adminTestimonialIncentive,
            helperText: l10n.adminTestimonialIncentiveHelp,
            helperMaxLines: 2,
          ),
        ),
        Text(l10n.adminTestimonialPlaces, style: context.textTheme.titleSmall),
        Wrap(
          spacing: AppSpace.xs,
          runSpacing: AppSpace.xs,
          children: [
            for (final p in TestimonialPlace.values)
              FilterChip(
                key: Key('adminTestimonialPlace-${p.value}'),
                label: Text(testimonialPlaceLabel(context, p)),
                selected: _places.contains(p),
                onSelected: (on) =>
                    setState(() => on ? _places.add(p) : _places.remove(p)),
              ),
          ],
        ),
        DropdownButtonFormField<TestimonialState>(
          key: const Key('adminTestimonialState'),
          initialValue: _state,
          decoration: InputDecoration(labelText: l10n.adminTestimonialState),
          items: [
            for (final s in TestimonialState.values)
              DropdownMenuItem(
                value: s,
                child: Text(testimonialStateLabel(context, s).$1),
              ),
          ],
          onChanged: (v) => setState(() => _state = v ?? _state),
        ),
        TextField(
          controller: _notes,
          minLines: 1,
          maxLines: 4,
          decoration: InputDecoration(labelText: l10n.adminTestimonialNotes),
        ),
      ],
    );
  }
}
