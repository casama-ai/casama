import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/date_format.dart';
import '../../core/providers.dart';
import '../../core/selfhost_api.dart' show isCasamaCloud;
import '../../core/widgets.dart';
import '../../l10n/generated/app_localizations.dart';
import 'cloud_models_api.dart';
import 'cloud_models_flag.dart';

/// Whether Cloud models can show at all here: a build with the switch, on a server that isn't
/// Casama Cloud itself, and that doesn't say in `/v1/config` it can't offer them (unlicensed).
bool cloudModelsShown(WidgetRef ref) =>
    kCloudModelsCode &&
    ref.watch(cloudModelsBuildProvider) &&
    !isCasamaCloud(ref.watch(backendProvider).apiUrl) &&
    (ref.watch(backendProvider).cloudModelsConfig?.available ?? true);

/// The server's Cloud models state (§13.3). An older server (no route), Casama Cloud itself, or a
/// build without the switch: [CloudModelsState.off], so nothing shows.
final cloudModelsStateProvider = FutureProvider<CloudModelsState>((ref) async {
  if (!kCloudModelsCode || !ref.watch(cloudModelsBuildProvider)) {
    return CloudModelsState.off;
  }
  final backend = ref.watch(backendProvider);
  if (isCasamaCloud(backend.apiUrl)) return CloudModelsState.off;
  // The server's config already says it can't offer them: no need to ask. A server that doesn't
  // say (older ones) is asked, and its answer's `available` decides.
  if (backend.cloudModelsConfig?.available == false) return CloudModelsState.off;
  try {
    final s = await ref.watch(cloudModelsApiProvider).state();
    // While connected, read again every few minutes: a stop clears (or starts) on its own.
    if (s.connected) {
      final timer = Timer(cloudModelsRefreshEvery, ref.invalidateSelf);
      ref.onDispose(timer.cancel);
    }
    return s;
  } catch (_) {
    return CloudModelsState.off;
  }
});

/// How often a connected server's state is read again while the app is open.
const cloudModelsRefreshEvery = Duration(minutes: 5);

/// Why Casama Cloud isn't answering on this server (§9), from the most to the least specific.
enum CloudStop {
  disconnected,
  unreachable,
  memberNotAllowed,
  memberLimit,
  planRequired,
  planEnded,
  seatsRequired,
  outOfCredits,
  dailyCap,
}

/// What warns before it stops (§4.2): 80% of the month's included usage or of today's limit.
enum CloudWarning { included, daily }

/// The §9 stop for [s], or null when Casama Cloud answers (or isn't connected).
CloudStop? cloudStopOf(CloudModelsState s) {
  if (!s.available || !s.connected) return null;
  final err = s.statusError?.code;
  if (err != null) {
    return switch (err) {
      'key_revoked' ||
      'models_unavailable' ||
      'unauthorized' => CloudStop.disconnected,
      _ => CloudStop.unreachable,
    };
  }
  if (!s.me.allowed) return CloudStop.memberNotAllowed;
  final limit = s.me.limitUsd;
  if (limit != null && limit > 0 && s.me.todayUsd >= limit) {
    return CloudStop.memberLimit;
  }
  final st = s.status;
  if (st == null) return null;
  if (!st.scopes.contains('models') && st.scopes.isNotEmpty) {
    return CloudStop.disconnected;
  }
  if (!st.modelsAllowed) {
    if (!st.paid && st.creditsUsd <= 0 && st.trialRemaining <= 0) {
      return st.planEnded ? CloudStop.planEnded : CloudStop.planRequired;
    }
    if (st.seatsPlan != null &&
        st.seatsUsed != null &&
        st.seatsUsed! > st.seatsPlan!) {
      return CloudStop.seatsRequired;
    }
    return CloudStop.outOfCredits;
  }
  final cap = st.todayCap;
  if (cap != null && cap > 0 && st.todaySpend >= cap) return CloudStop.dailyCap;
  final included = st.includedLimit;
  if (included != null &&
      included > 0 &&
      (st.includedUsed ?? 0) >= included &&
      st.creditsUsd <= 0) {
    return CloudStop.outOfCredits;
  }
  return null;
}

/// The early warning for [s], or null. Never alongside a stop.
CloudWarning? cloudWarningOf(CloudModelsState s) {
  if (cloudStopOf(s) != null || !s.connected) return null;
  final st = s.status;
  if (st == null) return null;
  if ((st.includedShare ?? 0) >= 0.8) return CloudWarning.included;
  if ((st.todayShare ?? 0) >= 0.8) return CloudWarning.daily;
  return null;
}

/// The one action each stop offers (§9).
enum CloudAction { topUp, seePlans, renew, useOwnKey, askAdmin, reconnect }

/// The main action for [stop], for an admin ([admin]) or a member.
CloudAction cloudActionFor(
  CloudStop stop, {
  required bool admin,
}) => switch (stop) {
  CloudStop.outOfCredits => admin ? CloudAction.topUp : CloudAction.askAdmin,
  CloudStop.dailyCap => admin ? CloudAction.useOwnKey : CloudAction.askAdmin,
  CloudStop.planRequired || CloudStop.seatsRequired =>
    admin ? CloudAction.seePlans : CloudAction.askAdmin,
  CloudStop.planEnded => admin ? CloudAction.renew : CloudAction.askAdmin,
  CloudStop.memberLimit || CloudStop.memberNotAllowed => CloudAction.askAdmin,
  CloudStop.disconnected =>
    admin ? CloudAction.reconnect : CloudAction.askAdmin,
  CloudStop.unreachable => admin ? CloudAction.useOwnKey : CloudAction.askAdmin,
};

/// The second action, when §9 lists one ("Top up · Use my own key").
CloudAction? cloudSecondActionFor(CloudStop stop, {required bool admin}) =>
    admin && (stop == CloudStop.outOfCredits || stop == CloudStop.planEnded)
    ? CloudAction.useOwnKey
    : null;

/// The words for [stop] (§9). Never an error code.
String cloudStopText(BuildContext context, CloudStop stop, CloudModelsState s) {
  final l10n = context.l10n;
  final workspace = s.payerOrStatus?.name ?? '';
  return switch (stop) {
    CloudStop.outOfCredits => l10n.shCloudStopOutOfCredits,
    CloudStop.dailyCap => switch (s.status?.resetsAt) {
      final at? => l10n.shCloudStopDailyCap(
        at.toLocal().formattedTime(context),
      ),
      null => l10n.shCloudStopDailyCapSoon,
    },
    CloudStop.planRequired => l10n.shCloudStopPlanRequired(workspace),
    CloudStop.planEnded => l10n.shCloudStopPlanEnded(workspace),
    CloudStop.seatsRequired => l10n.shCloudStopSeats(workspace),
    CloudStop.memberLimit => l10n.shCloudStopMemberLimit,
    CloudStop.memberNotAllowed => l10n.shCloudStopMemberNotAllowed,
    CloudStop.disconnected => l10n.shCloudStopDisconnected,
    CloudStop.unreachable => l10n.shCloudStopUnreachable,
  };
}

String cloudActionLabel(AppLocalizations l10n, CloudAction a) => switch (a) {
  CloudAction.topUp => l10n.shCloudTopUp,
  CloudAction.seePlans => l10n.shCloudSeePlans,
  CloudAction.renew => l10n.shCloudRenew,
  CloudAction.useOwnKey => l10n.shCloudUseOwnKey,
  CloudAction.askAdmin => l10n.shCloudAskAdmin,
  CloudAction.reconnect => l10n.shCloudReconnect,
};

String cloudWarningText(AppLocalizations l10n, CloudWarning w) => switch (w) {
  CloudWarning.included => l10n.shCloudWarnIncluded,
  CloudWarning.daily => l10n.shCloudWarnDaily,
};
