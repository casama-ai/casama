import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../theme/app_colors.dart';
import 'cost_format.dart';

/// The colours a chart's stacks, the table's dots and a detail's chart share. The first three are
/// the theme's own blue, amber and green ([AppColors.info], warning, positive); the rest are hues
/// between them, each with a darker tone for light surfaces and a lighter one for dark, so every
/// one stands clear of the card behind it.
const _lightTones = [
  Color(0xFF2F6FE4), // blue
  Color(0xFFC77700), // amber
  Color(0xFF1E8E5A), // green
  Color(0xFF7C5CE0), // violet
  Color(0xFF0E94A0), // teal
  Color(0xFFD0428F), // pink
  Color(0xFF7A9A1F), // olive
  Color(0xFFDD5A36), // coral
  Color(0xFF94684D), // brown
  Color(0xFFA446C4), // orchid
];

const _darkTones = [
  Color(0xFF6E9BFF),
  Color(0xFFF0A84A),
  Color(0xFF5FD49A),
  Color(0xFFA792F5),
  Color(0xFF4CC7D1),
  Color(0xFFF07DBE),
  Color(0xFFB5D25A),
  Color(0xFFFF8E6E),
  Color(0xFFC9A084),
  Color(0xFFCF86E8),
];

/// Which colour each service, key, app, feature, model or workspace has. A name always asks for
/// the same colour (worked out from its id), and takes the next free one only when another name
/// of the same grouping already holds it, so a service looks the same in the chart, the table and
/// its detail, whatever the period or the sort.
class CostColorBook {
  final _slots = <CostGroup, Map<String, int>>{};

  /// The palette index of [id] in [group], given on first sight and kept.
  int slot(CostGroup group, String id) {
    final taken = _slots.putIfAbsent(group, () => {});
    final known = taken[id];
    if (known != null) return known;
    final wanted = _hash(id) % _lightTones.length;
    var slot = wanted;
    if (taken.length < _lightTones.length) {
      final used = taken.values.toSet();
      while (used.contains(slot)) {
        slot = (slot + 1) % _lightTones.length;
      }
    }
    return taken[id] = slot;
  }

  /// Gives [ids] their colours in this order: the chart's stacks first, so they never share one.
  void register(CostGroup group, Iterable<String> ids) {
    for (final id in ids) {
      if (id.isNotEmpty && id != kCostOtherId) slot(group, id);
    }
  }

  /// FNV-1a: the same number for the same id on every run and platform.
  static int _hash(String s) {
    var h = 0x811c9dc5;
    for (final unit in s.codeUnits) {
      h = ((h ^ unit) * 0x01000193) & 0x7fffffff;
    }
    return h;
  }
}

final costColorBookProvider = Provider<CostColorBook>((_) => CostColorBook());

/// The colour of [id] in [group]. "Other" and what carries no label are grey: they aren't one
/// thing, so they get no colour of their own.
Color costColor(
  BuildContext context,
  CostColorBook book,
  CostGroup group,
  String id,
) {
  final scheme = context.colorScheme;
  if (id == kCostOtherId) {
    return scheme.onSurfaceVariant.withValues(
      alpha: context.isDark ? 0.5 : 0.42,
    );
  }
  if (id.isEmpty) {
    return scheme.onSurfaceVariant.withValues(
      alpha: context.isDark ? 0.75 : 0.65,
    );
  }
  return (context.isDark ? _darkTones : _lightTones)[book.slot(group, id)];
}
