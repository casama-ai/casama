import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/admin_security.dart';
import '../../core/haptics.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';

/// "Lock · 4:12" in the console's header: how long until the idle lock, amber in the last minute.
/// Tapping it locks now.
class AdminLockChip extends StatefulWidget {
  const AdminLockChip({super.key});

  @override
  State<AdminLockChip> createState() => _AdminLockChipState();
}

class _AdminLockChipState extends State<AdminLockChip> {
  Timer? _tick;

  @override
  void initState() {
    super.initState();
    // Reads the deadline once a second rather than listening: pointer moves push it forward
    // many times a second and the chip only shows whole seconds.
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final at = AdminSecurity.lockAt.value;
    final left = at?.difference(DateTime.now());
    final soon = left != null && left < const Duration(minutes: 1);
    final color = soon ? context.appColors.warning : context.colorScheme.onSurfaceVariant;
    String? time;
    if (left != null) {
      final s = left.inSeconds.clamp(0, 5999);
      time = '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
    }
    final compact = MediaQuery.sizeOf(context).width < 600;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: AppSpace.xs),
      child: Tooltip(
        message: l10n.adminLockChipHelp,
        child: Material(
          color: soon ? color.withValues(alpha: 0.14) : Colors.transparent,
          shape: StadiumBorder(side: BorderSide(color: soon ? Colors.transparent : context.appColors.hairline)),
          child: InkWell(
            key: const Key('adminLockNow'),
            customBorder: const StadiumBorder(),
            onTap: () {
              HapticsHelper.medium();
              AdminSecurity.lock?.call();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: compact ? 10 : 12, vertical: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(LucideIcons.lock, size: 15, color: soon ? color : context.colorScheme.onSurface),
                  if (!compact || time != null) const SizedBox(width: 6),
                  // On a phone the app bar's title needs the room: the lock and the time say enough.
                  if (!compact) Text(l10n.adminLockNow, style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                  if (time != null) ...[
                    if (!compact) Text(' · ', style: context.textTheme.labelLarge?.copyWith(color: color)),
                    Text(time, style: context.textTheme.labelLarge?.copyWith(color: color, fontFeatures: AppText.tabular)),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
