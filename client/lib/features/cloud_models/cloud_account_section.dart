import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/cloud_account.dart';
import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart' show isCasamaCloud;
import '../../core/widgets.dart';
import '../../theme/app_colors.dart';
import '../../ui/adaptive_modal.dart';
import '../../ui/app_card.dart';
import '../../ui/form_sheet.dart';
import '../app_lock/confirm_identity.dart';

/// The rows of Settings → "Casama Cloud account" (SELFHOST-CLOUD-MODELS-PLAN §7.4.1, Apple
/// 5.1.1(v), Play account deletion): shown whenever this device keeps a Casama Cloud session while
/// the app is on another server (the license sign-in and Cloud models both keep one). Who is signed
/// in, sign out, and delete the Cloud account. Empty otherwise, so the section disappears.
///
/// Not behind the Cloud models build switch: the license sign-in can create a Cloud account in any
/// build, and account deletion must be reachable wherever an account can be made.
List<Widget> cloudAccountRows(BuildContext context, WidgetRef ref) {
  if (isCasamaCloud(ref.watch(backendProvider).apiUrl)) return const [];
  final session = ref.watch(cloudAccountProvider).value;
  if (session == null) return const [];
  final l10n = context.l10n;
  final email = session.email ?? '';
  return [
    GroupedTile(
      key: const Key('cloudAccountRow'),
      icon: LucideIcons.cloud,
      title: l10n.cloudAccountRow(email),
      subtitle: l10n.cloudAccountRowHelp,
      showChevron: false,
    ),
    GroupedTile(
      key: const Key('cloudAccountSignOut'),
      icon: LucideIcons.logOut,
      title: l10n.cloudAccountSignOut,
      showChevron: false,
      onTap: () async {
        final ok = await showConfirm(
          context: context,
          title: l10n.cloudAccountSignOut,
          message: l10n.cloudAccountSignOutBody,
          confirmLabel: l10n.cloudAccountSignOut,
        );
        if (ok) await ref.read(cloudAccountProvider.notifier).signOut();
      },
    ),
    GroupedTile(
      key: const Key('cloudAccountDelete'),
      icon: LucideIcons.trash2,
      title: l10n.cloudAccountDelete,
      subtitle: l10n.cloudAccountDeleteHelp,
      destructive: true,
      showChevron: false,
      onTap: () => deleteCloudAccount(context, ref, email),
    ),
  ];
}

/// Deletes the Casama Cloud account with Cloud's own account deletion (the same call as Cloud's
/// Settings → Privacy), after the person types their email, then forgets the session.
Future<void> deleteCloudAccount(
  BuildContext context,
  WidgetRef ref,
  String email,
) async {
  final l10n = context.l10n;
  final ok = await showAdaptiveSheet<bool>(
    context: context,
    builder: (_) => _ConfirmCloudDelete(email: email),
  );
  if (ok != true || !context.mounted) return;
  if (!await confirmIdentity(context, ref) || !context.mounted) return;
  final purge = await runGuarded(
    context,
    () => ref.read(cloudApiProvider).deleteAccount(email),
  );
  if (purge == null || !context.mounted) return;
  await ref.read(cloudAccountProvider.notifier).signOut();
  if (!context.mounted) return;
  await showAdaptiveSheet<void>(
    context: context,
    dialogMaxWidth: 460,
    builder: (c) => FormSheet(
      key: const Key('cloudAccountDeleted'),
      icon: LucideIcons.circleCheck,
      iconColor: c.appColors.positive,
      title: l10n.accountDeleted,
      subtitle: l10n.cloudAccountDeleted(
        purge.toLocal().formattedWeekdayDate(c),
      ),
      submitLabel: l10n.close,
      showCancel: false,
      onSubmit: () => Navigator.pop(c),
      children: const [],
    ),
  );
}

class _ConfirmCloudDelete extends StatefulWidget {
  const _ConfirmCloudDelete({required this.email});
  final String email;

  @override
  State<_ConfirmCloudDelete> createState() => _ConfirmCloudDeleteState();
}

class _ConfirmCloudDeleteState extends State<_ConfirmCloudDelete> {
  final _c = TextEditingController();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final matches =
        _c.text.trim().toLowerCase() == widget.email.toLowerCase() &&
        widget.email.isNotEmpty;
    return FormSheet(
      icon: LucideIcons.trash2,
      destructive: true,
      title: l10n.cloudAccountDelete,
      subtitle: l10n.cloudAccountDeleteConfirm(widget.email),
      submitLabel: l10n.cloudAccountDelete,
      submitKey: const Key('cloudAccountConfirmDelete'),
      onSubmit: matches ? () => Navigator.pop(context, true) : null,
      children: [
        TextField(
          key: const Key('cloudAccountConfirmEmail'),
          controller: _c,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: l10n.email,
            hintText: widget.email,
            prefixIcon: const Icon(LucideIcons.atSign, size: 20),
          ),
        ),
      ],
    );
  }
}
