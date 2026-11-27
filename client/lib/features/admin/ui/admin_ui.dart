import 'package:material_ui/material_ui.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/haptics.dart';
import '../../../core/widgets.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/app_card.dart';
import '../admin_nav.dart';

/// Shared pieces for every console section (docs/ADMIN-CONSOLE-REDESIGN-PLAN.md §5), so the
/// sections read as one tool: one header, one stat tile, one status pill, one list.

/// Widest a section's content grows in the console's content pane: room for a table.
const double kAdminContentMaxWidth = 1040;

/// The width a data list switches from cards to a table.
const double kAdminTableMinWidth = 620;

/// What a status means, mapped to the app's meaning colors.
enum AdminTone { neutral, positive, warning, negative, info, primary }

Color adminToneColor(BuildContext context, AdminTone tone) {
  final colors = context.appColors;
  final scheme = context.colorScheme;
  return switch (tone) {
    AdminTone.neutral => scheme.onSurfaceVariant,
    AdminTone.positive => colors.positive,
    AdminTone.warning => colors.warning,
    AdminTone.negative => colors.negative,
    AdminTone.info => colors.info,
    AdminTone.primary => scheme.primary,
  };
}

/// A section's scrolling page: centered, pull to refresh when [onRefresh] is given.
class AdminSectionList extends StatelessWidget {
  const AdminSectionList({super.key, required this.children, this.onRefresh, this.maxWidth = kAdminContentMaxWidth});

  final List<Widget> children;
  final Future<void> Function()? onRefresh;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final target = AdminNav.maybeOf(context)?.target;
    if (target == null) return _list(context, false);
    return ValueListenableBuilder<String?>(valueListenable: target, builder: (context, value, _) => _list(context, value != null));
  }

  Widget _list(BuildContext context, bool pending) {
    final list = LayoutBuilder(
      builder: (context, constraints) {
        final side = AppSpace.gutter + AppBreakpoints.centeringInset(constraints.maxWidth, maxWidth: maxWidth);
        return ListView(
          // Pull to refresh needs a list that can always be pulled, even when it's short.
          physics: const AlwaysScrollableScrollPhysics(),
          // While a search result waits to be shown, build the whole list so a setting below the
          // fold exists to scroll to (AdminAnchor).
          scrollCacheExtent: pending ? const ScrollCacheExtent.pixels(100000) : null,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.fromLTRB(side, AppSpace.xs, side, AppSpace.xxl + MediaQuery.paddingOf(context).bottom),
          children: children,
        );
      },
    );
    final refresh = onRefresh;
    if (refresh == null) return list;
    return RefreshIndicator(onRefresh: hapticRefresh(refresh), child: list);
  }
}

/// The top of a section: its name (unless the app bar shows it), one line about it or a summary,
/// and the section's actions. On a desktop it also says when the data was fetched, with a refresh.
class AdminSectionHeader extends StatelessWidget {
  const AdminSectionHeader({
    super.key,
    required this.section,
    this.summary,
    this.actions = const [],
    this.onRefresh,
  });

  final AdminSection section;

  /// Replaces the section's description (e.g. "2 need attention · 9 OK").
  final String? summary;
  final List<Widget> actions;

  /// Shows a refresh button beside the actions (pull to refresh still works on touch screens).
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final showTitle = !AdminTitleInAppBar.of(context);
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showTitle)
          Semantics(
            header: true,
            child: Text(
              section.label(context),
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.3),
            ),
          ),
        if (showTitle) const SizedBox(height: 2),
        Text(
          summary ?? section.description(context),
          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
        ),
      ],
    );
    final buttons = [
      ...actions,
      if (onRefresh != null)
        IconButton(
          key: Key('adminRefresh-${section.id}'),
          tooltip: context.l10n.adminRefresh,
          onPressed: () {
            Haptic.tap();
            onRefresh!();
          },
          icon: const Icon(LucideIcons.refreshCw, size: 18),
        ),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.xs, bottom: AppSpace.md),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (buttons.isEmpty) return text;
          // Side by side when there's room; the actions drop below on a narrow phone.
          if (constraints.maxWidth >= 520) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: text),
                const SizedBox(width: AppSpace.sm),
                Wrap(spacing: AppSpace.xs, crossAxisAlignment: WrapCrossAlignment.center, children: buttons),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text,
              const SizedBox(height: AppSpace.sm),
              Wrap(spacing: AppSpace.xs, runSpacing: AppSpace.xs, crossAxisAlignment: WrapCrossAlignment.center, children: buttons),
            ],
          );
        },
      ),
    );
  }
}

/// A soft pill that says what state something is in.
class AdminStatusPill extends StatelessWidget {
  const AdminStatusPill(this.text, {super.key, this.tone = AdminTone.neutral, this.icon});
  final String text;
  final AdminTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => StatusLabel(text: text, color: adminToneColor(context, tone), pill: true, icon: icon);
}

/// One number on a stat strip.
class AdminStat {
  const AdminStat({required this.label, required this.value, this.icon, this.tone, this.onTap, this.key});
  final String label;
  final String value;
  final IconData? icon;

  /// Colors the number (a red count of failures); null keeps it plain.
  final AdminTone? tone;
  final VoidCallback? onTap;
  final Key? key;
}

/// A row of numbers at the top of a section: 4 across on wide screens, 2 on phones, each row at
/// its natural height so larger text never cuts a tile off.
class AdminStatStrip extends StatelessWidget {
  const AdminStatStrip({super.key, required this.stats, this.maxColumns = 4});
  final List<AdminStat> stats;
  final int maxColumns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.md),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = (constraints.maxWidth >= 560 ? maxColumns : (constraints.maxWidth >= 380 ? 3 : 2)).clamp(1, stats.length);
          return Column(
            spacing: AppSpace.sm,
            children: [
              for (var r = 0; r < stats.length; r += columns)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: AppSpace.sm,
                    children: [
                      for (var c = r; c < r + columns; c++) Expanded(child: c < stats.length ? AdminStatTile(stats[c]) : const SizedBox()),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AdminStatTile extends StatelessWidget {
  const AdminStatTile(this.stat, {super.key});
  final AdminStat stat;

  @override
  Widget build(BuildContext context) {
    final tone = stat.tone;
    final color = tone == null ? null : adminToneColor(context, tone);
    return AppCard(
      key: stat.key,
      onTap: stat.onTap,
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: AppSpace.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if (stat.icon != null) ...[
                Icon(stat.icon, size: 15, color: color ?? context.colorScheme.onSurfaceVariant),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: Text(
                  stat.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            stat.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, fontFeatures: AppText.tabular, height: 1.1, color: color),
          ),
        ],
      ),
    );
  }
}

/// How much of a limit is used. Turns amber at [warnAt] and red when full; [tone] overrides.
class AdminMeter extends StatelessWidget {
  const AdminMeter({super.key, required this.fraction, this.tone, this.warnAt = 0.8, this.start, this.end, this.height = 8});

  /// 0 to 1; null draws an empty track (nothing measured yet).
  final double? fraction;
  final AdminTone? tone;
  final double warnAt;

  /// Captions under the bar, left and right ("205 / 250 searches", "Resets in 6 days").
  final String? start;
  final String? end;
  final double height;

  static AdminTone toneFor(double? fraction, {double warnAt = 0.8}) {
    if (fraction == null) return AdminTone.neutral;
    if (fraction >= 1) return AdminTone.negative;
    if (fraction >= warnAt) return AdminTone.warning;
    return AdminTone.positive;
  }

  @override
  Widget build(BuildContext context) {
    final f = fraction?.clamp(0.0, 1.0).toDouble();
    final color = adminToneColor(context, tone ?? toneFor(fraction, warnAt: warnAt));
    final caption = context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant, fontFeatures: AppText.tabular);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          value: f == null ? null : '${(f * 100).round()}%',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(height),
            child: SizedBox(
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ColoredBox(color: context.colorScheme.surfaceContainerHighest),
                  if (f != null)
                    FractionallySizedBox(
                      alignment: AlignmentDirectional.centerStart,
                      widthFactor: f,
                      child: DecoratedBox(decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(height))),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (start != null || end != null) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              if (start != null) Expanded(child: Text(start!, style: caption, maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (start == null) const Spacer(),
              if (end != null) ...[const SizedBox(width: AppSpace.xs), Text(end!, style: caption, maxLines: 1)],
            ],
          ),
        ],
      ],
    );
  }
}

/// A rounded search box for a section's list.
class AdminSearchField extends StatefulWidget {
  const AdminSearchField({super.key, required this.hint, required this.onChanged, this.controller, this.autofocus = false});
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final bool autofocus;

  @override
  State<AdminSearchField> createState() => _AdminSearchFieldState();
}

class _AdminSearchFieldState extends State<AdminSearchField> {
  late final TextEditingController _controller = widget.controller ?? TextEditingController();

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return TextField(
      controller: _controller,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.search,
      onChanged: (v) {
        setState(() {});
        widget.onChanged(v);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hint,
        prefixIcon: const Icon(LucideIcons.search, size: 18),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: context.l10n.adminClearSearch,
                icon: const Icon(LucideIcons.x, size: 16),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                  widget.onChanged('');
                },
              ),
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide(color: scheme.primary, width: 1.5)),
      ),
    );
  }
}

/// Filter pills that wrap onto more lines rather than scroll sideways.
class AdminFilterChips<T> extends StatelessWidget {
  const AdminFilterChips({super.key, required this.values, required this.labels, required this.selected, required this.onSelected, this.counts});
  final List<T> values;
  final Map<T, String> labels;
  final T selected;
  final ValueChanged<T> onSelected;

  /// Shown after a label when given ("Suspended 2").
  final Map<T, int>? counts;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpace.xs,
      runSpacing: AppSpace.xs,
      children: [
        for (final v in values)
          AdminChip(
            key: Key('adminFilter-$v'),
            label: labels[v]!,
            count: counts?[v],
            selected: v == selected,
            onTap: () {
              HapticsHelper.selection();
              onSelected(v);
            },
          ),
      ],
    );
  }
}

class AdminChip extends StatelessWidget {
  const AdminChip({super.key, required this.label, required this.selected, required this.onTap, this.count, this.icon});
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final int? count;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final fg = selected ? scheme.primary : scheme.onSurface;
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? scheme.primary.withValues(alpha: context.isDark ? 0.2 : 0.12) : Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: selected ? Colors.transparent : context.appColors.hairline)),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[Icon(icon, size: 14, color: fg), const SizedBox(width: 5)],
                Text(label, style: context.textTheme.labelLarge?.copyWith(color: fg, fontWeight: selected ? FontWeight.w700 : FontWeight.w500)),
                if (count != null) ...[
                  const SizedBox(width: 5),
                  Text('$count', style: context.textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant, fontFeatures: AppText.tabular)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// "Sort: Cost ▾" as a small menu.
class AdminSortMenu<T> extends StatelessWidget {
  const AdminSortMenu({super.key, required this.values, required this.labels, required this.selected, required this.onSelected});
  final List<T> values;
  final Map<T, String> labels;
  final T selected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      key: const Key('adminSort'),
      tooltip: context.l10n.adminSortBy,
      initialValue: selected,
      onSelected: (v) {
        HapticsHelper.selection();
        onSelected(v);
      },
      itemBuilder: (_) => [for (final v in values) CheckedPopupMenuItem(value: v, checked: v == selected, child: Text(labels[v]!))],
      child: AdminChip(
        label: context.l10n.adminSortLabel(labels[selected]!),
        icon: LucideIcons.arrowDownUp,
        selected: false,
        onTap: () {},
      ).absorb(),
    );
  }
}

extension on Widget {
  /// Lets taps fall through to the menu button around it.
  Widget absorb() => IgnorePointer(child: this);
}

/// The search box, filters and sort above a list: one row on wide screens, stacked on phones.
class AdminListToolbar extends StatelessWidget {
  const AdminListToolbar({super.key, this.search, this.filters, this.sort});
  final Widget? search;
  final Widget? filters;
  final Widget? sort;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.sm),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 960) {
            return Row(
              children: [
                if (search != null) Expanded(child: search!),
                if (filters != null) ...[const SizedBox(width: AppSpace.sm), Flexible(flex: 0, child: filters!)],
                if (sort != null) ...[const SizedBox(width: AppSpace.xs), sort!],
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpace.xs,
            children: [
              ?search,
              if (filters != null || sort != null)
                Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: AppSpace.xs,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [?filters, ?sort],
                ),
            ],
          );
        },
      ),
    );
  }
}

/// One column of an [AdminDataList] table.
class AdminColumn<T> {
  const AdminColumn({required this.label, required this.cell, this.flex = 1, this.numeric = false});
  final String label;
  final Widget Function(BuildContext context, T item) cell;
  final int flex;

  /// Right-aligned, tabular figures.
  final bool numeric;
}

/// A list of records: a table with [columns] when the pane is wide, two-line rows on a phone.
class AdminDataList<T> extends StatelessWidget {
  const AdminDataList({
    super.key,
    required this.items,
    required this.columns,
    required this.title,
    this.leading,
    this.subtitle,
    this.badges,
    this.trailing,
    this.onTap,
    this.itemKey,
  });

  final List<T> items;
  final List<AdminColumn<T>> columns;

  /// The first column on a table and the bold line on a phone.
  final String Function(T item) title;
  final Widget Function(BuildContext context, T item)? leading;

  /// The phone row's second line.
  final String? Function(BuildContext context, T item)? subtitle;

  /// Pills under the phone row's lines.
  final List<Widget> Function(BuildContext context, T item)? badges;

  /// An actions menu, at the end of both layouts.
  final Widget Function(BuildContext context, T item)? trailing;
  final void Function(T item)? onTap;
  final Key Function(T item)? itemKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth >= kAdminTableMinWidth ? _table(context) : _rows(context),
    );
  }

  Widget _table(BuildContext context) {
    final head = context.textTheme.labelMedium?.copyWith(color: context.colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600);
    final hasTrailing = trailing != null;
    Widget cell(AdminColumn<T> c, Widget child) => Expanded(
      flex: c.flex,
      child: Align(alignment: c.numeric ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart, child: child),
    );
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.sm, AppSpace.md, AppSpace.xs),
            child: Row(
              spacing: AppSpace.sm,
              children: [
                for (final c in columns) cell(c, Text(c.label, style: head, maxLines: 1, overflow: TextOverflow.ellipsis)),
                if (hasTrailing) const SizedBox(width: 40),
              ],
            ),
          ),
          for (final item in items) ...[
            Divider(height: 1, thickness: 1, color: context.appColors.hairline),
            InkWell(
              key: itemKey?.call(item),
              onTap: onTap == null ? null : () => onTap!(item),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 52),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 6),
                  child: Row(
                    spacing: AppSpace.sm,
                    children: [
                      for (final c in columns)
                        cell(
                          c,
                          DefaultTextStyle.merge(
                            style: TextStyle(fontFeatures: c.numeric ? AppText.tabular : null),
                            child: c.cell(context, item),
                          ),
                        ),
                      if (hasTrailing) SizedBox(width: 40, child: trailing!(context, item)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _rows(BuildContext context) {
    return GroupedCard(
      dividerIndent: leading == null ? AppSpace.md : 60,
      children: [
        for (final item in items)
          InkWell(
            key: itemKey?.call(item),
            onTap: onTap == null ? null : () => onTap!(item),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(AppSpace.md, 12, AppSpace.xs, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (leading != null) ...[leading!(context, item), const SizedBox(width: AppSpace.sm)],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title(item), style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                        if (subtitle?.call(context, item) case final String s when s.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(s, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant, height: 1.3)),
                          ),
                        if (badges?.call(context, item) case final List<Widget> b when b.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Wrap(spacing: 6, runSpacing: 6, children: b),
                          ),
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!(context, item) else const SizedBox(width: AppSpace.xs),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// A square with a name's first letter, for rows of workspaces and people.
class AdminAvatar extends StatelessWidget {
  const AdminAvatar(this.name, {super.key, this.size = 32, this.tone});
  final String name;
  final double size;
  final AdminTone? tone;

  @override
  Widget build(BuildContext context) {
    final t = name.trim();
    final letter = t.isEmpty ? '?' : t.characters.first.toUpperCase();
    final color = tone == null ? context.colorScheme.onSurface : adminToneColor(context, tone!);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: tone == null ? context.colorScheme.surfaceContainerHighest : color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(AppRadius.icon),
      ),
      child: Text(letter, style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800, color: color)),
    );
  }
}

/// One action in an [AdminActionsMenu].
class AdminMenuAction {
  const AdminMenuAction({required this.label, required this.icon, required this.onSelected, this.destructive = false, this.key});
  final String label;
  final IconData icon;
  final VoidCallback onSelected;
  final bool destructive;
  final Key? key;
}

/// A row's actions behind one labeled ⋯ button, instead of a row of bare icons.
class AdminActionsMenu extends StatelessWidget {
  const AdminActionsMenu({super.key, required this.actions, this.tooltip});
  final List<AdminMenuAction> actions;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox(width: 40);
    final scheme = context.colorScheme;
    return PopupMenuButton<int>(
      tooltip: tooltip ?? context.l10n.adminMoreActions,
      icon: const Icon(LucideIcons.ellipsis, size: 20),
      onSelected: (i) => actions[i].onSelected(),
      itemBuilder: (_) => [
        for (var i = 0; i < actions.length; i++)
          PopupMenuItem<int>(
            key: actions[i].key,
            value: i,
            child: Row(
              children: [
                Icon(actions[i].icon, size: 18, color: actions[i].destructive ? scheme.error : scheme.onSurfaceVariant),
                const SizedBox(width: AppSpace.sm),
                Flexible(child: Text(actions[i].label, style: TextStyle(color: actions[i].destructive ? scheme.error : null))),
              ],
            ),
          ),
      ],
    );
  }
}

/// Asks before something that can't be taken back. True when confirmed.
Future<bool> adminConfirm(
  BuildContext context, {
  required String title,
  String? message,
  required String confirmLabel,
  bool destructive = false,
  Key? confirmKey,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(title),
      content: message == null ? null : Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(c, false), child: Text(context.l10n.cancel)),
        FilledButton(
          key: confirmKey,
          style: destructive ? FilledButton.styleFrom(backgroundColor: c.colorScheme.error, foregroundColor: c.colorScheme.onError) : null,
          onPressed: () => Navigator.pop(c, true),
          child: Text(confirmLabel),
        ),
      ],
    ),
  );
  return ok == true;
}

/// A quiet card for an empty list or a filter with no matches.
class AdminEmptyCard extends StatelessWidget {
  const AdminEmptyCard({super.key, required this.icon, required this.message, this.action});
  final IconData icon;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg, vertical: AppSpace.xl),
      child: Column(
        children: [
          Icon(icon, size: 28, color: context.colorScheme.onSurfaceVariant),
          const SizedBox(height: AppSpace.sm),
          Text(message, textAlign: TextAlign.center, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant)),
          if (action != null) ...[const SizedBox(height: AppSpace.md), action!],
        ],
      ),
    );
  }
}

/// A label and its value on one line, for detail sheets.
class AdminKeyValue extends StatelessWidget {
  const AdminKeyValue({super.key, required this.label, required this.value});
  final String label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text(label, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant))),
          const SizedBox(width: AppSpace.sm),
          Expanded(flex: 3, child: DefaultTextStyle.merge(style: context.textTheme.bodyMedium, textAlign: TextAlign.end, child: Align(alignment: AlignmentDirectional.centerEnd, child: value))),
        ],
      ),
    );
  }
}

/// "o•••@gmail.com": enough to recognise the account without showing it over a shoulder.
String adminMaskEmail(String? email) {
  if (email == null || !email.contains('@')) return email ?? '';
  final at = email.indexOf('@');
  final name = email.substring(0, at);
  final first = name.isEmpty ? '' : name.characters.first;
  return '$first•••${email.substring(at)}';
}
