import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/haptics.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';

/// Computer places: a bot keeps its own computer and may also work on the computer of the person
/// it acts for, when they let it in ("Use this computer for bots" → Bots Allowed). This is where
/// a bot can work for the person signed in, with their "Works on" choice. Null on a server from
/// before places, and while it can't be read: the app then shows the one computer it always did.
final botPlacesProvider = FutureProvider.family<BotPlaces?, String>((
  ref,
  botId,
) async {
  try {
    return await ref.watch(backendProvider).botPlaces(botId);
  } catch (_) {
    return null;
  }
});

extension BotPlacesView on BotPlaces {
  /// The bot's own computer; null on a server with no cloud computers.
  BotPlace? get home =>
      places.where((p) => p.where == PlaceWhere.botComputer).firstOrNull;

  /// The person's computers that let the bot in, the one it uses first.
  List<BotPlace> get mine => [
    ...places.where((p) => p.where == PlaceWhere.myComputer && p.selected),
    ...places.where((p) => p.where == PlaceWhere.myComputer && !p.selected),
  ];

  /// The one of the person's computers the bot uses.
  BotPlace? get myComputer => mine.firstOrNull;

  /// More than one place to look at or choose between.
  bool get hasChoice => places.length > 1;

  /// The place the side panel opens on: the person's computer when they keep the bot on it (or
  /// it is all there is), else the bot's own.
  BotPlace? get opensOn =>
      home == null || (mode == PlaceMode.myComputer && myComputer != null)
      ? (myComputer ?? home)
      : home;
}

/// The "Works on" choice in a few words.
String placeModeLabel(AppLocalizations l10n, PlaceMode mode) => switch (mode) {
  PlaceMode.auto => l10n.worksOnAuto,
  PlaceMode.botComputer => l10n.worksOnBot,
  PlaceMode.myComputer => l10n.worksOnMine,
};

IconData _placeIcon(BotPlace p) =>
    p.where == PlaceWhere.myComputer ? LucideIcons.laptop : LucideIcons.monitor;

/// A place's icon tile with a dot that says whether one of the person's computers is connected.
class _PlaceTile extends StatelessWidget {
  const _PlaceTile({required this.place});
  final BotPlace place;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final mine = place.where == PlaceWhere.myComputer;
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: scheme.primary.withValues(
                alpha: context.isDark ? 0.2 : 0.12,
              ),
              borderRadius: BorderRadius.circular(AppRadius.icon),
            ),
            alignment: Alignment.center,
            child: Icon(_placeIcon(place), size: 18, color: scheme.primary),
          ),
          if (mine)
            Positioned(
              right: -2,
              bottom: -2,
              child: Container(
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: place.online
                      ? context.appColors.positive
                      : scheme.outline,
                  shape: BoxShape.circle,
                  border: Border.all(color: scheme.surface, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

String _placeSubtitle(AppLocalizations l10n, BotPlace p, String botName) =>
    p.where == PlaceWhere.myComputer
    ? (p.online ? l10n.placeYoursOnline : l10n.placeYoursOffline)
    : (p.kind == BotPlaceKindEnum.team
          ? l10n.placeTeamComputer
          : l10n.placeBotsOwn(botName));

/// Picks "Works on" for a bot: Automatic, only its own computer, or only the person's. Saves the
/// pick and refreshes what the app knows about the bot's places.
Future<void> showWorksOnSheet(
  BuildContext context,
  WidgetRef ref, {
  required String botId,
  required String botName,
  required BotPlaces places,
}) async {
  final l10n = context.l10n;
  final mine = places.myComputer;
  final picked = await showChoiceSheet<PlaceMode>(
    context,
    title: l10n.worksOnTitle,
    subtitle: l10n.worksOnSubtitle(botName),
    icon: LucideIcons.mapPin,
    selected: places.mode,
    choices: [
      Choice(
        key: const Key('worksOn-auto'),
        value: PlaceMode.auto,
        label: l10n.worksOnAuto,
        subtitle: l10n.worksOnAutoHelp(botName),
        icon: LucideIcons.wandSparkles,
      ),
      Choice(
        key: const Key('worksOn-bot'),
        value: PlaceMode.botComputer,
        label: l10n.worksOnBot,
        subtitle: l10n.worksOnBotHelp,
        icon: LucideIcons.monitor,
      ),
      Choice(
        key: const Key('worksOn-mine'),
        value: PlaceMode.myComputer,
        label: l10n.worksOnMine,
        subtitle: mine == null
            ? l10n.worksOnMineHelp
            : l10n.worksOnMineHelpNamed(mine.name),
        icon: LucideIcons.laptop,
      ),
    ],
  );
  if (picked == null || picked.value == places.mode || !context.mounted) return;
  await runGuarded(
    context,
    () => ref
        .read(backendProvider)
        .setBotPlacePreference(botId, mode: picked.value),
  );
  ref.invalidate(botPlacesProvider(botId));
}

/// The bar over a bot's computer panel when it has more than one place for this person: which
/// place the panel shows, and where the bot works. Tapping it lists the places (the bot's own
/// computer and each of the person's, with a dot for the ones connected) and ends with Works on.
/// Picking a place only changes what the panel shows.
class BotPlacesBar extends ConsumerWidget {
  const BotPlacesBar({
    super.key,
    required this.botId,
    required this.botName,
    required this.places,
    required this.shownComputerId,
    required this.onShow,
  });
  final String botId;
  final String botName;
  final BotPlaces places;

  /// The computer the panel shows now.
  final String shownComputerId;
  final ValueChanged<BotPlace> onShow;

  static const _worksOn = 'works-on';

  Future<void> _open(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    HapticsHelper.selection();
    final picked = await showChoiceSheet<String>(
      context,
      title: l10n.placesTitle(botName),
      subtitle: l10n.placesSubtitle,
      icon: LucideIcons.monitorSmartphone,
      selected: shownComputerId,
      choices: [
        for (final p in [?places.home, ...places.mine])
          Choice(
            key: Key('place-${p.computerId}'),
            value: p.computerId,
            label: p.name,
            subtitle: _placeSubtitle(l10n, p, botName),
            leading: _PlaceTile(place: p),
          ),
        Choice(
          key: const Key('placesWorksOn'),
          value: _worksOn,
          label: l10n.worksOnTitle,
          subtitle: placeModeLabel(l10n, places.mode),
          icon: LucideIcons.mapPin,
        ),
      ],
    );
    if (picked == null || !context.mounted) return;
    if (picked.value == _worksOn) {
      await showWorksOnSheet(
        context,
        ref,
        botId: botId,
        botName: botName,
        places: places,
      );
      return;
    }
    final place = places.places
        .where((p) => p.computerId == picked.value)
        .firstOrNull;
    if (place == null) return;
    onShow(place);
    // With several of their own computers, the one they look at is the one the bot uses.
    if (place.where == PlaceWhere.myComputer &&
        places.mine.length > 1 &&
        !place.selected &&
        place.deviceId != null) {
      await runGuarded(
        context,
        () => ref
            .read(backendProvider)
            .setBotPlacePreference(botId, deviceId: place.deviceId),
      );
      ref.invalidate(botPlacesProvider(botId));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final shown =
        places.places
            .where((p) => p.computerId == shownComputerId)
            .firstOrNull ??
        places.opensOn;
    if (shown == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpace.md,
        AppSpace.xs,
        AppSpace.md,
        0,
      ),
      child: AppCard(
        key: const Key('botPlacesBar'),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        onTap: () => _open(context, ref),
        child: Semantics(
          button: true,
          label: l10n.placesBarLabel(
            shown.name,
            placeModeLabel(l10n, places.mode),
          ),
          excludeSemantics: true,
          child: Row(
            children: [
              _PlaceTile(place: shown),
              const SizedBox(width: AppSpace.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shown.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      l10n.worksOnLine(placeModeLabel(l10n, places.mode)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                LucideIcons.chevronsUpDown,
                size: 18,
                color: scheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The small tag on a chat row or an approval for something done on the person's own computer.
class PlaceTag extends StatelessWidget {
  const PlaceTag({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: context.isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.laptop, size: 11, color: scheme.primary),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelSmall?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
