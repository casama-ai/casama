import 'package:casama_sdk/casama_sdk.dart' show AdminDeviceKey, AdminPinState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/admin_device_key.dart';
import '../../core/admin_security.dart';
import '../../core/providers.dart';
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_tokens.dart';
import '../../ui/app_card.dart';
import '../app_lock/confirm_identity.dart' show showPinSetup;
import 'admin_nav.dart';
import 'admin_search.dart';
import 'admin_security_gate.dart';
import 'ui/admin_ui.dart';

final adminPinProvider = FutureProvider.autoDispose<AdminPinState>(
  (ref) => ref.watch(backendProvider).adminPinState(),
);

/// The devices set up for the screen-lock check, and whether this one is (D-453).
final adminDevicesProvider =
    FutureProvider.autoDispose<
      ({List<AdminDeviceKey> items, String? mine, bool available})
    >((ref) async {
      final backend = ref.watch(backendProvider);
      final keys = ref.watch(adminDeviceKeysProvider);
      final items = await backend.adminDeviceKeys();
      final mine = await keys.keyId(backend.userId);
      return (
        items: items,
        // Forgotten on the server (removed elsewhere): this device isn't set up any more.
        mine: items.any((k) => k.id == mine) ? mine : null,
        available: await keys.available(),
      );
    });

/// Admin → Security (D-452): the owner's 6-digit admin PIN, one of the ways to unlock the console
/// and confirm changes. Setting, changing or removing it takes a passkey or the password, never
/// the PIN itself.
class AdminSecurityTab extends ConsumerWidget {
  const AdminSecurityTab({super.key});

  /// A fresh check that isn't the PIN, unless one was just made.
  static Future<bool> _confirmWithoutPin(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final me = ref.read(backendProvider).userId;
    if (AdminSecurity.recentlyVerified(me) &&
        AdminSecurity.lastVerifiedMethod != 'pin') {
      return true;
    }
    return showAdminConfirmation(context, allowPin: false);
  }

  Future<void> _set(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final pin = await showPinSetup(context, subtitle: l10n.adminPinSetupBody);
    if (pin == null || !context.mounted) return;
    if (!await _confirmWithoutPin(context, ref) || !context.mounted) return;
    final saved = await runGuarded(
      context,
      () => ref.read(backendProvider).setAdminPin(pin),
    );
    ref.invalidate(adminPinProvider);
    if (saved != null && context.mounted) {
      showSuccess(context, l10n.adminPinSaved);
    }
  }

  Future<void> _remove(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final sure = await adminConfirm(
      context,
      title: l10n.adminPinRemoveConfirm,
      message: l10n.adminPinRemoveBody,
      confirmLabel: l10n.adminDeviceRemove,
      destructive: true,
      confirmKey: const Key('adminPinRemoveConfirm'),
    );
    if (!sure || !context.mounted) return;
    if (!await _confirmWithoutPin(context, ref) || !context.mounted) return;
    final removed = await runGuarded(
      context,
      () => ref.read(backendProvider).removeAdminPin(),
    );
    ref.invalidate(adminPinProvider);
    if (removed != null && context.mounted) {
      showSuccess(context, l10n.adminPinRemoved);
    }
  }

  Future<void> _removeDevice(
    BuildContext context,
    WidgetRef ref,
    AdminDeviceKey key,
    bool mine,
  ) async {
    final backend = ref.read(backendProvider);
    final l10n = context.l10n;
    final sure = await adminConfirm(
      context,
      title: l10n.adminDeviceRemoveConfirm(key.name),
      message: l10n.adminDeviceRemoveBody,
      confirmLabel: l10n.adminDeviceRemove,
      destructive: true,
      confirmKey: ValueKey('adminDeviceRemoveConfirm-${key.id}'),
    );
    if (!sure || !context.mounted) return;
    final removed = await runGuarded(
      context,
      () => backend.removeAdminDeviceKey(key.id),
    );
    if (removed != null && mine && backend.userId != null) {
      await ref.read(adminDeviceKeysProvider).forget(backend.userId!);
    }
    ref.invalidate(adminDevicesProvider);
    if (removed != null && context.mounted) {
      showSuccess(context, l10n.adminDeviceRemoved);
    }
  }

  List<Widget> _devices(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final devices = ref.watch(adminDevicesProvider).value;
    if (devices == null || (devices.items.isEmpty && !devices.available)) {
      return const [];
    }
    return [
      SectionHeader(title: l10n.adminDeviceTitle),
      AdminAnchor(
        id: AdminAnchors.screenLock,
        child: GroupedCard(
        children: [
          if (devices.available && devices.mine == null)
            GroupedTile(
              key: const Key('adminDeviceTurnOn'),
              icon: LucideIcons.scanFace,
              title: l10n.adminDeviceTurnOn,
              subtitle: l10n.adminDeviceHelp,
              onTap: () async {
                await enrollAdminDevice(context, ref);
                ref.invalidate(adminDevicesProvider);
              },
            ),
          for (final k in devices.items)
            _DeviceRow(
              key: ValueKey('adminDevice-${k.id}'),
              device: k,
              mine: k.id == devices.mine,
              onRemove: () =>
                  _removeDevice(context, ref, k, k.id == devices.mine),
            ),
        ],
      ),
      ),
      const SizedBox(height: AppSpace.lg),
    ];
  }

  List<Widget> _pin(BuildContext context, WidgetRef ref, AdminPinState state) {
    final l10n = context.l10n;
    final (status, tone) = state.disabled
        ? (l10n.adminPinIsOff, AdminTone.warning)
        : state.set_
        ? (l10n.adminPinIsSet, AdminTone.positive)
        : (l10n.adminPinNotSet, AdminTone.neutral);
    return [
      SectionHeader(title: l10n.adminPinTitle),
      AdminAnchor(
        id: AdminAnchors.pin,
        child: GroupedCard(
        children: [
          GroupedTile(
            key: const Key('adminPinSet'),
            icon: LucideIcons.grid3x3,
            title: state.set_ ? l10n.adminPinChange : l10n.adminPinSet,
            subtitle: state.disabled ? l10n.adminPinOffHelp : l10n.adminPinHelp,
            trailing: AdminStatusPill(
              status,
              key: const Key('adminPinStatus'),
              tone: tone,
            ),
            onTap: () => _set(context, ref),
          ),
          if (state.set_)
            GroupedTile(
              key: const Key('adminPinRemove'),
              icon: LucideIcons.trash2,
              title: l10n.adminPinRemove,
              destructive: true,
              onTap: () => _remove(context, ref),
            ),
        ],
      ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pin = ref.watch(adminPinProvider);
    return AdminSectionList(
      onRefresh: () async {
        ref.invalidate(adminPinProvider);
        ref.invalidate(adminDevicesProvider);
        try {
          await ref.read(adminPinProvider.future);
        } catch (_) {
          // The page shows the problem.
        }
      },
      children: [
        const AdminSectionHeader(section: AdminSection.security),
        ..._devices(context, ref),
        if (pin.value case final state?)
          ..._pin(context, ref, state)
        else if (pin.hasError)
          AdminEmptyCard(
            icon: LucideIcons.circleAlert,
            message: errorText(context, pin.error!),
            action: TextButton(
              onPressed: () => ref.invalidate(adminPinProvider),
              child: Text(context.l10n.retry),
            ),
          )
        else
          const SkeletonList(count: 2),
      ],
    );
  }
}

/// One device set up for the screen-lock check: its name, whether it's this one, when it was
/// last used, and a way to remove it.
class _DeviceRow extends StatelessWidget {
  const _DeviceRow({
    super.key,
    required this.device,
    required this.mine,
    required this.onRemove,
  });

  final AdminDeviceKey device;
  final bool mine;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final muted = context.textTheme.bodySmall?.copyWith(
      color: scheme.onSurfaceVariant,
    );
    final lastUsed = device.lastUsedAt;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.md,
        vertical: AppSpace.sm,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: scheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.icon),
            ),
            child: Icon(
              device.name.startsWith('Mac')
                  ? LucideIcons.laptop
                  : LucideIcons.smartphone,
              size: 18,
              color: scheme.primary,
            ),
          ),
          const SizedBox(width: AppSpace.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: AppSpace.xs,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      // Kept in the name so it reads the same to screen readers and tests.
                      mine
                          ? '${device.name} (${l10n.adminDeviceThisOne})'
                          : device.name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                if (lastUsed != null)
                  TimeAgo(
                    lastUsed,
                    style: muted,
                    label: (when) => l10n.adminDeviceLastUsed(when),
                  )
                else
                  Text(l10n.adminDeviceNeverUsed, style: muted),
                TimeAgo(
                  device.createdAt,
                  style: muted,
                  label: (when) => l10n.passkeyAddedOn(when),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          TextButton(
            key: ValueKey('adminDeviceRemove-${device.id}'),
            style: TextButton.styleFrom(foregroundColor: scheme.error),
            onPressed: onRemove,
            child: Text(l10n.adminDeviceRemove),
          ),
        ],
      ),
    );
  }
}
