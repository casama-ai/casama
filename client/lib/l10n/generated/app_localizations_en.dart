// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Casama';

  @override
  String tabTitle(String page, String app) {
    return '$page · $app';
  }

  @override
  String tabTitleBotPage(String page, String bot) {
    return '$page · $bot';
  }

  @override
  String get tabTitleChat => 'Chat';

  @override
  String get tabTitleCall => 'Call';

  @override
  String get tabTitleProject => 'Project';

  @override
  String get tabTitleGroupChat => 'Group chat';

  @override
  String get loading => 'Loading…';

  @override
  String get retry => 'Try Again';

  @override
  String get keepGoing => 'Keep Going';

  @override
  String get keepGoingMessage => 'Keep going from where you stopped.';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Close';

  @override
  String get create => 'Create';

  @override
  String get continueLabel => 'Continue';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get errorViewHint => 'Restarting the app should fix it.';

  @override
  String get signInTitle => 'Sign in to Casama';

  @override
  String get signUpTitle => 'Create your account';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign in';

  @override
  String get signUp => 'Create account';

  @override
  String get haveAccount => 'Have an account? Sign in';

  @override
  String get needAccount => 'New here? Create an account';

  @override
  String get magicLink => 'Email me a sign-in link';

  @override
  String get magicLinkSent => 'Check your email for a sign-in link.';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithEmail => 'Continue with Email';

  @override
  String get moreSignInOptions => 'More Options';

  @override
  String get usePasswordInstead => 'Use a Password Instead';

  @override
  String get checkInboxTitle => 'Check your inbox';

  @override
  String checkInboxBody(String email) {
    return 'We sent a sign-in link and a 6-digit code to $email. Tap the link, or type the code here.';
  }

  @override
  String get emailCodeLabel => '6-digit code';

  @override
  String get resendLink => 'Send Again';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Send Again in ${secondsString}s';
  }

  @override
  String get useDifferentEmail => 'Use a Different Email';

  @override
  String get authWrongPassword =>
      'That email and password don\'t match. Try again, or sign in with an email link instead.';

  @override
  String get authEmailNotConfirmed =>
      'Confirm your email first: open the link we sent you.';

  @override
  String get authCodeInvalid =>
      'That code is wrong or has expired. Check the latest email, or send a new one.';

  @override
  String get authTooManyTries => 'Too many tries. Wait a minute and try again.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds seconds',
      one: '1 second',
    );
    return 'Too many requests at once. Try again in $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'You can try again now.';

  @override
  String get authAccountExists =>
      'There\'s already an account with this email. Sign in instead.';

  @override
  String get authSignupDisabled => 'This server isn\'t taking new sign-ups.';

  @override
  String get useMagicLinkInstead => 'Email Me a Link Instead';

  @override
  String get invalidEmail => 'Enter a valid email address';

  @override
  String get passwordTooShort => 'Use at least 6 characters';

  @override
  String get signOut => 'Sign Out';

  @override
  String get onboardingTitle => 'Set up your workspace';

  @override
  String get createWorkspace => 'Create a workspace';

  @override
  String get workspaceName => 'Workspace name';

  @override
  String get joinWorkspace => 'Join with an invite code';

  @override
  String get inviteCode => 'Invite code';

  @override
  String get join => 'Join';

  @override
  String get addModelKeyTitle => 'Add a model key';

  @override
  String get addModelKeyBody =>
      'Bots use your own model provider key. It is stored encrypted and never shown again.';

  @override
  String get provider => 'Provider';

  @override
  String get label => 'Label';

  @override
  String get apiKey => 'API key';

  @override
  String get baseUrl => 'Base URL';

  @override
  String get testKey => 'Test Key';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'Key works ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Key test failed: $error';
  }

  @override
  String get createFirstBot => 'Create your first bot';

  @override
  String get botName => 'Bot name';

  @override
  String get model => 'Model';

  @override
  String get persona => 'Instructions';

  @override
  String get personaHint =>
      'What this bot does and how it should work. A persona fills this in; edit it freely.';

  @override
  String get modelKey => 'Model key';

  @override
  String get navComputer => 'Computer';

  @override
  String get navChats => 'Chats';

  @override
  String get navTasks => 'Tasks';

  @override
  String get settingsConnectionsSection => 'Connections';

  @override
  String get advanced => 'Advanced';

  @override
  String get settingsAdvancedSummary => 'Secrets, computers, devices';

  @override
  String get bots => 'Bots';

  @override
  String get newBot => 'New bot';

  @override
  String get noBots => 'No bots yet';

  @override
  String get botStatusIdle => 'Idle';

  @override
  String get botStatusWorking => 'Working';

  @override
  String get botStatusWaiting => 'Waiting for you';

  @override
  String sidebarMoreWorking(int count) {
    return '$count more working';
  }

  @override
  String get botStatusDisabled => 'Disabled';

  @override
  String costToday(String cost) {
    return '$cost today';
  }

  @override
  String get newChat => 'New chat';

  @override
  String get conversations => 'Conversations';

  @override
  String messageHint(String bot) {
    return 'Message $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Message $bot · @ to mention an app';
  }

  @override
  String get mentionSectionBots => 'Bots';

  @override
  String get mentionSectionApps => 'Apps';

  @override
  String get mentionSectionAddToBot => 'Add to this bot';

  @override
  String get mentionSectionConnect => 'Connect';

  @override
  String get mentionSectionStartGroup => 'Start a group chat';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'App';

  @override
  String get mentionAddAction => 'Add';

  @override
  String get mentionConnectAction => 'Connect';

  @override
  String get mentionMaxApps => 'You can mention up to 3 apps per message.';

  @override
  String get mentionRemovedApp => 'Removed app';

  @override
  String get send => 'Send';

  @override
  String get stop => 'Stop';

  @override
  String get thinking => 'Thinking…';

  @override
  String get checkingItsWork => 'Checking its work…';

  @override
  String get mapFullScreen => 'Full screen';

  @override
  String get mapTitle => 'Map';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Stopped.';

  @override
  String emptyChat(String bot) {
    return 'Say hello to $bot.';
  }

  @override
  String get toolRunning => 'Running';

  @override
  String get toolFailedLabel => 'Failed';

  @override
  String get toolOutput => 'Output';

  @override
  String get remembered => 'Remembered something';

  @override
  String skillLoaded(String name) {
    return 'Loaded skill $name';
  }

  @override
  String checkpointSaved(String label) {
    return 'Saved restore point: $label';
  }

  @override
  String computerState(String state) {
    return 'Computer $state';
  }

  @override
  String get activity => 'Activity';

  @override
  String get timelineTitle => 'Run timeline';

  @override
  String get allEvents => 'All';

  @override
  String get filterTools => 'Tools';

  @override
  String get filterMessages => 'Messages';

  @override
  String get filterSystem => 'System';

  @override
  String get restore => 'Restore';

  @override
  String get restoreConfirm =>
      'Go back to this restore point? Files changed since then will be replaced.';

  @override
  String get restored => 'Restore point restored.';

  @override
  String get noRuns => 'No runs yet.';

  @override
  String get computerTitle => 'Computer';

  @override
  String get computerStart => 'Start';

  @override
  String get computerSleep => 'Sleep';

  @override
  String get screen => 'Screen';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Files';

  @override
  String get noScreen =>
      'Nothing on screen yet. The bot\'s browser page appears here.';

  @override
  String get refresh => 'Refresh';

  @override
  String get upload => 'Upload';

  @override
  String get download => 'Download';

  @override
  String get emptyFolder => 'This folder is empty';

  @override
  String get noCheckpoints =>
      'They\'re saved automatically before risky changes, so you can undo them.';

  @override
  String get computerAsleep =>
      'The computer is asleep. Its files are saved and it wakes up when needed.';

  @override
  String get connectTerminal => 'Connect';

  @override
  String get terminalDisconnected => 'Disconnected.';

  @override
  String get terminalReconnecting => 'Server restarting, reconnecting…';

  @override
  String get memory => 'Memory';

  @override
  String get noMemories => 'Nothing remembered yet.';

  @override
  String get noMemoriesMatch => 'No memories match.';

  @override
  String get clearSearch => 'Clear';

  @override
  String get addMemory => 'Add a Memory';

  @override
  String get addMemoryHelp =>
      'Something the bot should always know about you or your work.';

  @override
  String get addMemoryFactHint =>
      'For example: Our fiscal year starts in April.';

  @override
  String get addMemoryPreferenceHint =>
      'For example: Keep summaries under five bullet points.';

  @override
  String get memoryAdded => 'Memory added';

  @override
  String get pin => 'Pin';

  @override
  String get unpin => 'Unpin';

  @override
  String get deleteMemoryConfirm => 'Forget this? It cannot be undone.';

  @override
  String get skills => 'Skills';

  @override
  String get noSkills =>
      'No skills yet. Skills are instructions bots load when relevant.';

  @override
  String get newSkill => 'New skill';

  @override
  String get skillName => 'Name (lowercase, dashes)';

  @override
  String get skillDescription => 'One-line description';

  @override
  String get skillBody => 'Instructions (Markdown)';

  @override
  String get enabled => 'Enabled';

  @override
  String get settings => 'Settings';

  @override
  String get workspace => 'Workspace';

  @override
  String get switchWorkspace => 'Switch workspace';

  @override
  String get modelKeys => 'Model keys';

  @override
  String get moreProviders => 'More providers';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, custom servers';

  @override
  String get toolPermissions => 'Tool permissions';

  @override
  String get devicesAdvancedSummary =>
      'How long it\'s kept, private models, bots with access';

  @override
  String get companionAdvancedSummary =>
      'Commands, local tools (MCP), coding agents';

  @override
  String get noKeys => 'No model keys yet.';

  @override
  String get addKey => 'Add Key';

  @override
  String get usage => 'Usage';

  @override
  String get language => 'Language';

  @override
  String inviteSent(String email) {
    return 'Invite sent to $email.';
  }

  @override
  String get botProfile => 'Bot profile';

  @override
  String get groupMembers => 'Bots in This Chat';

  @override
  String get groupMembersHelp =>
      'Each keeps its own memory and settings. Tap one to open its profile.';

  @override
  String get botAdvancedSummary =>
      'Chat apps, links, rules, watchers, plugins, activity';

  @override
  String get botActivityRow => 'Every run, step by step';

  @override
  String get createBotAdvancedSummary => 'Model key and model';

  @override
  String get botProfileSection => 'Profile';

  @override
  String get botBrain => 'Brain';

  @override
  String get botAbilities => 'Abilities';

  @override
  String get botSchedule => 'Schedule';

  @override
  String get chatComputerLive => 'Working on its computer';

  @override
  String get autonomy => 'Autonomy';

  @override
  String get autonomyAskAlways => 'Ask before acting';

  @override
  String get autonomyAskRisky => 'Ask for risky actions';

  @override
  String get autonomyAutonomous => 'Act on its own';

  @override
  String get saved => 'Saved.';

  @override
  String get justNow => 'just now';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString days ago',
      one: 'yesterday',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'A bot';

  @override
  String get addIntegration => 'Add Integration';

  @override
  String get addSecret => 'Add secret';

  @override
  String get allowedHosts => 'Allowed hosts';

  @override
  String get allowedHostsHelp => 'Comma-separated, for example api.github.com';

  @override
  String get alwaysAllow => 'Always Allow';

  @override
  String get approval => 'Approval';

  @override
  String get approvalAlreadyDecided =>
      'This request was already decided or has expired.';

  @override
  String get approvals => 'Approvals';

  @override
  String get approve => 'Approve';

  @override
  String get approved => 'Approved';

  @override
  String get authHeaderOptional => 'Authorization header (optional)';

  @override
  String get authSecretName => 'Auth secret name (optional)';

  @override
  String get authSecretNameHelp =>
      'Name of a secret from Settings › Secrets, sent as a bearer token';

  @override
  String get baseUrlOptional => 'Base URL (optional)';

  @override
  String get blankBot => 'Blank';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Choose a model';

  @override
  String get searchModels => 'Search models or type a model id';

  @override
  String get recommendedModels => 'Recommended';

  @override
  String get allModels => 'All models';

  @override
  String useCustomModel(String id) {
    return 'Use \"$id\"';
  }

  @override
  String modelListFallback(String reason) {
    return 'Showing suggested models. $reason You can still type any model id.';
  }

  @override
  String get noModelsFound => 'No models match.';

  @override
  String get addModelKeyFirst =>
      'Add a model key first. Your bot uses it to think; it\'s stored encrypted and never shown again.';

  @override
  String get composioToolkits =>
      'Toolkits (comma-separated, for example github, gmail)';

  @override
  String get copySecret => 'Copy Secret';

  @override
  String get cronExpression => 'Cron expression';

  @override
  String get cronHelp => 'minute hour day month weekday';

  @override
  String get denied => 'Denied';

  @override
  String get deny => 'Deny';

  @override
  String get everyHour => 'Every hour';

  @override
  String get expired => 'Expired';

  @override
  String get inbox => 'Inbox';

  @override
  String get integrationName => 'Name';

  @override
  String get integrationNameHelp =>
      'Lowercase letters, numbers and underscores';

  @override
  String get integrationType => 'Type';

  @override
  String get integrations => 'Integrations';

  @override
  String get kindMcp => 'MCP server';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Mark All as Read';

  @override
  String get newRoutine => 'New routine';

  @override
  String get noIntegrationsForBot =>
      'Add integrations in Settings first, then turn them on for this bot here.';

  @override
  String get noRoutines => 'No routines yet';

  @override
  String get noSecrets => 'No secrets yet';

  @override
  String get notifications => 'Notifications';

  @override
  String get openInbox => 'Open Inbox';

  @override
  String get pipedreamApps => 'Apps (comma-separated)';

  @override
  String get pipedreamClientId => 'Client ID';

  @override
  String get pipedreamClientSecret => 'Client secret';

  @override
  String get pipedreamProject => 'Project ID';

  @override
  String get riskHigh => 'High risk';

  @override
  String get riskLow => 'Low risk';

  @override
  String get riskMedium => 'Medium risk';

  @override
  String get routineGithub => 'On GitHub events';

  @override
  String get routineInstructions => 'Instructions';

  @override
  String get routineInstructionsHint => 'What should the bot do each time?';

  @override
  String get routineName => 'Name';

  @override
  String get routineEditTitle => 'Edit Routine';

  @override
  String get routineEditSubtitle => 'Change what it does and when it runs.';

  @override
  String get routineRecentRuns => 'Recent runs';

  @override
  String get routineNoRuns => 'It hasn\'t run yet.';

  @override
  String get routineSaved => 'Routine saved';

  @override
  String get routineStarted => 'Routine started';

  @override
  String get routineWebhook => 'On webhook';

  @override
  String get routines => 'Routines';

  @override
  String get routineAdvancedSummary =>
      'GitHub and webhook triggers, cron, timezone';

  @override
  String get routineRepeatDaily => 'Every day';

  @override
  String get routineRepeatWeekdays => 'Weekdays';

  @override
  String get routineRepeatWeekly => 'Every week';

  @override
  String get routineDay => 'Day';

  @override
  String get routineTimeLabel => 'Time';

  @override
  String get routineRunsAt => 'Runs at';

  @override
  String routineTimesIn(String timezone) {
    return 'Times are in $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Custom: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Other triggers';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Every $nString minutes',
      one: 'Every minute',
    );
    return '$_temp0';
  }

  @override
  String cronEveryHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Every $nString hours',
      one: 'Every hour',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Every hour at :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Every day at $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Weekdays at $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Weekends at $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days at $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Day $day of every month at $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items and $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Sundays',
      'mon': 'Mondays',
      'tue': 'Tuesdays',
      'wed': 'Wednesdays',
      'thu': 'Thursdays',
      'fri': 'Fridays',
      'sat': 'Saturdays',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Sunday',
      'mon': 'Monday',
      'tue': 'Tuesday',
      'wed': 'Wednesday',
      'thu': 'Thursday',
      'fri': 'Friday',
      'sat': 'Saturday',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Watch your bot work live';

  @override
  String get headlessScreenEmpty =>
      'This computer runs browser-only to stay light. You\'ll see its web pages here when it opens one. Switch to a desktop to watch and control apps too.';

  @override
  String get headlessScreenChecking => 'Checking for pages every few seconds';

  @override
  String get headlessBrowserOnly => 'Browser only';

  @override
  String get switchedToDesktopHere =>
      'Switched to Desktop. Its screen shows here once it\'s up.';

  @override
  String get desktopBarLabel => 'Desktop · uses more memory';

  @override
  String get switchToBrowserOnly => 'Switch to browser-only';

  @override
  String get switchingToBrowserOnly => 'Switching to browser-only…';

  @override
  String get switchedToBrowserOnly =>
      'Switched to browser-only. It uses less memory now.';

  @override
  String get runNow => 'Run Now';

  @override
  String get secretName => 'Name';

  @override
  String get secretNameHelp => 'Uppercase, for example GITHUB_TOKEN';

  @override
  String get secretValue => 'Value';

  @override
  String get secrets => 'Secrets';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get specUrl => 'OpenAPI spec URL';

  @override
  String get startFrom => 'Persona';

  @override
  String get storedEncrypted => 'Stored encrypted; never shown again';

  @override
  String get taskBlocked => 'Blocked';

  @override
  String get taskDoing => 'In progress';

  @override
  String get taskDone => 'Done';

  @override
  String get taskTodo => 'To do';

  @override
  String get test => 'Test';

  @override
  String get timezone => 'Timezone';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Repeats';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'View run';

  @override
  String get webhookCreated => 'Webhook Created';

  @override
  String get webhookSecret => 'Signing secret';

  @override
  String get webhookShownOnce =>
      'Copy the signing secret now. It is shown only once.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Connection failed: $error';
  }

  @override
  String integrationOk(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Connected, $nString tools',
      one: 'Connected, 1 tool',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Next: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Only sent to $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'requested $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Includes routines: $names.';
  }

  @override
  String toolCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString tools',
      one: '1 tool',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'The bot is back in control';

  @override
  String get botComputer => 'Computer';

  @override
  String get botComputerDefault =>
      'Its private computer if it has one, otherwise the team computer';

  @override
  String get botInControl => 'Bot in control';

  @override
  String get computerName => 'Name';

  @override
  String get computers => 'Computers';

  @override
  String get connectingLive => 'Connecting…';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get renameTopic => 'Rename';

  @override
  String get library => 'Library';

  @override
  String get navLibrary => 'Library';

  @override
  String get librarySearchHint => 'Search the Library';

  @override
  String get libraryFilterAll => 'All';

  @override
  String get libraryFilterPages => 'Sites & games';

  @override
  String get libraryFilterImages => 'Images';

  @override
  String get libraryFilterVideos => 'Videos';

  @override
  String get libraryFilterAudio => 'Audio';

  @override
  String get libraryFilterDocuments => 'Documents';

  @override
  String get libraryFilterFiles => 'Files';

  @override
  String get creationKindPage => 'Page';

  @override
  String get creationKindImage => 'Image';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Audio';

  @override
  String get creationKindDocument => 'Document';

  @override
  String get creationKindFile => 'File';

  @override
  String get libraryPinned => 'Pinned';

  @override
  String get libraryToday => 'Today';

  @override
  String get libraryYesterday => 'Yesterday';

  @override
  String get libraryThisWeek => 'This week';

  @override
  String get libraryEarlier => 'Earlier';

  @override
  String get videoCantPlay => 'This video won\'t play on this device.';

  @override
  String get libraryEmptyTitle => 'What should we make first?';

  @override
  String get libraryEmptyBody =>
      'Pick one and your bot gets started. Everything your bots make lands here on its own.';

  @override
  String get libraryNoMatch => 'Nothing here matches.';

  @override
  String get libraryStarterGame => 'A small game';

  @override
  String get libraryStarterGamePrompt =>
      'Make me a small game I can play in the browser.';

  @override
  String get libraryStarterLogo => 'A logo';

  @override
  String get libraryStarterLogoPrompt => 'Design a logo for my project.';

  @override
  String get libraryStarterSite => 'A one-page site';

  @override
  String get libraryStarterSitePrompt =>
      'Make a one-page website for my business.';

  @override
  String get libraryStarterVideo => 'A short video';

  @override
  String get libraryStarterVideoPrompt => 'Make a short video of ';

  @override
  String get libraryStarterCard => 'A birthday card';

  @override
  String get libraryStarterCardPrompt => 'Make a birthday card for ';

  @override
  String get libraryStarterReport => 'A report';

  @override
  String get libraryStarterReportPrompt => 'Research and write a report on ';

  @override
  String get libraryStarterElse => 'Something else…';

  @override
  String get creationOpen => 'Open';

  @override
  String get creationPlay => 'Play';

  @override
  String get creationView => 'View';

  @override
  String get creationChangeIt => 'Change It';

  @override
  String creationChangeDraft(String title) {
    return 'About “$title”: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Made by $bot';
  }

  @override
  String creationVersion(int n) {
    return 'version $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'From your chat with $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Made by $bot';
  }

  @override
  String get creationFromHelp => 'Go to the conversation';

  @override
  String get creationDetails => 'Details';

  @override
  String get creationAlongside => 'Made alongside';

  @override
  String creationDeleted(String title) {
    return 'Deleted “$title”';
  }

  @override
  String get showInLibrary => 'Show in Library';

  @override
  String get pinInLibrary => 'Pin in Library';

  @override
  String get libraryItemNotFound =>
      'That isn\'t in the Library yet. Try again in a moment.';

  @override
  String creationPinned(String title) {
    return 'Pinned “$title”';
  }

  @override
  String creationUnpinned(String title) {
    return 'Unpinned “$title”';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Updated · version $version';
  }

  @override
  String get madeHere => 'Made Here';

  @override
  String madeHereEmpty(String bot) {
    return '$bot hasn\'t made anything yet.';
  }

  @override
  String get madeHereThisChat => 'In this chat';

  @override
  String madeHereByBot(String bot) {
    return 'Made by $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Other things $bot made';
  }

  @override
  String madeHereCount(String count) {
    return 'Made here ($count)';
  }

  @override
  String get sidePanelComputer => 'Computer';

  @override
  String get madeForTicket => 'Made for this ticket';

  @override
  String get libraryCantChangePicked =>
      'Only the person it was made for or the bot\'s managers can change these.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deleted $count items',
      one: 'Deleted 1 item',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selected',
      one: '1 selected',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Newest';

  @override
  String get librarySortOpened => 'Recently Opened';

  @override
  String get librarySortName => 'Name';

  @override
  String get libraryScopeMine => 'Made for Me';

  @override
  String get libraryScopeWorkspace => 'Whole Workspace';

  @override
  String get libraryFilterSort => 'Sort and Filter';

  @override
  String get creationWhoCanSee => 'Who Can See It';

  @override
  String get libraryTile => 'Library';

  @override
  String get libraryTileHelp => 'What it made';

  @override
  String get regenerateReply => 'Regenerate';

  @override
  String get deleteMessage => 'Delete Message';

  @override
  String get deleteMessageTitle => 'Delete this message?';

  @override
  String get deleteMessageBody =>
      'It\'s removed for everyone in this chat. The messages around it stay.';

  @override
  String get messageDeleted => 'Message deleted';

  @override
  String get findInChat => 'Find in Chat';

  @override
  String get findInChatHint => 'Find in this chat';

  @override
  String findInChatCount(int index, int count) {
    return '$index of $count';
  }

  @override
  String get findInChatNone => 'No matches';

  @override
  String get findPrevious => 'Previous match';

  @override
  String get findNext => 'Next match';

  @override
  String get closeFind => 'Close find';

  @override
  String get pinTopic => 'Pin';

  @override
  String get unpinTopic => 'Unpin';

  @override
  String get inAppAlertReview => 'Review';

  @override
  String get forBot => 'For bot';

  @override
  String get handBack => 'Hand Back';

  @override
  String get handBackNote => 'Note for the bot (optional)';

  @override
  String get handBackNoteHint => 'For example: I signed in, carry on';

  @override
  String get live => 'Live';

  @override
  String get liveView => 'Live view';

  @override
  String get liveViewHelp =>
      'Watch this computer live and take control when needed.';

  @override
  String get newComputer => 'New computer';

  @override
  String get newComputerHelp =>
      'A private computer belongs to one bot. Its files stay separate from the team computer.';

  @override
  String get openLiveView => 'Open Live View';

  @override
  String get liveExpand => 'Full screen';

  @override
  String get liveCopy => 'Copy';

  @override
  String get liveScreenshot => 'Screenshot';

  @override
  String get liveScreenshots => 'Screenshots';

  @override
  String get liveScreenshotsHelp =>
      'Live video can\'t get through this network, so the screen updates about once a second.';

  @override
  String get liveReconnecting => 'Reconnecting…';

  @override
  String get liveReconnectingHelp =>
      'The live video was cut off (the server may be restarting). Trying again; screenshots show meanwhile.';

  @override
  String get liveTryAgain => 'Try again';

  @override
  String get liveDroppedHelp =>
      'The live video couldn\'t come back, so the screen updates about once a second. Tap Try again.';

  @override
  String get liveMore => 'More';

  @override
  String get liveSaveScreenshot => 'Save Screenshot';

  @override
  String get liveCopyFromComputer => 'Copy from the computer';

  @override
  String get livePasteToComputer => 'Paste onto the computer';

  @override
  String get liveRotateHint => 'Turn your phone sideways for a bigger screen';

  @override
  String get liveWatching => 'Watching';

  @override
  String get liveCopied => 'Copied from the computer.';

  @override
  String get liveNothingCopied =>
      'Nothing was copied. Select something on the computer first.';

  @override
  String get livePasteEmpty => 'Your clipboard is empty.';

  @override
  String get liveMinimize => 'Back to the side panel';

  @override
  String get liveShownFullScreen => 'The live view is open full screen.';

  @override
  String get liveStillWatching => 'Still watching?';

  @override
  String get liveStillWatchingHelp =>
      'The computer sleeps when nobody\'s watching, to save power.';

  @override
  String get liveKeepWatching => 'Keep Watching';

  @override
  String get livePausedToSavePower => 'Paused to save power';

  @override
  String get livePausedToSavePowerHelp =>
      'Nobody was watching, so the computer can rest. Resume wakes it again.';

  @override
  String get liveResume => 'Resume';

  @override
  String get paused => 'Paused';

  @override
  String get pausedUserInControl =>
      'Paused: a person is in control of the screen';

  @override
  String get letBotUseTerminal => 'Let it use terminal & files';

  @override
  String get screenHandedBack => 'Handed the screen back';

  @override
  String get privateComputer => 'Private computer';

  @override
  String get profileDesktop => 'Desktop';

  @override
  String get profileHeadless => 'Headless';

  @override
  String get rename => 'Rename';

  @override
  String get rightClickNextTap => 'Right-click on next tap';

  @override
  String get screenshotMode =>
      'Screenshots (live video unavailable on this network)';

  @override
  String get showKeyboard => 'Keyboard';

  @override
  String get someoneElseInControl => 'Someone else is in control';

  @override
  String get switchToDesktop => 'Switch to Desktop';

  @override
  String get switchToHeadless => 'Switch to Headless';

  @override
  String get switchProfileConfirm =>
      'The computer restarts to switch. Your files are kept, but anything running on it now stops.';

  @override
  String get switchProfileButton => 'Switch';

  @override
  String get switchingToDesktop => 'Switching to Desktop…';

  @override
  String get switchingToHeadless => 'Switching to Headless…';

  @override
  String get switchedToDesktop =>
      'Switched to Desktop. Open Live View to watch its screen.';

  @override
  String get switchedToHeadless =>
      'Switched to Headless. It uses less memory now.';

  @override
  String get takeControl => 'Take Control';

  @override
  String get takeoverCompleted => 'Handed back';

  @override
  String get takeoverDismissed => 'Declined';

  @override
  String get takeoverPrivacy =>
      'While you\'re in control, the bot is paused and nothing you type or see is sent to it.';

  @override
  String get liveShellOnTooltip =>
      'Let the bot keep using its terminal and files while you\'re in control';

  @override
  String get liveShellOffTooltip =>
      'Pause the bot\'s terminal and files too while you\'re in control';

  @override
  String get liveShellOnNote =>
      'The bot can keep using its terminal and files. It still can\'t see or use the screen until you hand back.';

  @override
  String get liveShellOffNote => 'The bot is fully paused until you hand back.';

  @override
  String get teamComputer => 'Team computer';

  @override
  String get withDesktop => 'With a desktop';

  @override
  String get withDesktopHelp =>
      'Adds a screen you can watch live; uses more memory';

  @override
  String get youAreInControl => 'You\'re in control';

  @override
  String botAsksForHelp(String reason) {
    return 'The bot asks: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot needs your help';
  }

  @override
  String deleteComputerConfirm(String name) {
    return 'Delete $name? Its files, snapshots and restore points are deleted too.';
  }

  @override
  String latencyMs(int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return '$msString ms';
  }

  @override
  String privateComputerOf(String bot) {
    return '$bot\'s computer';
  }

  @override
  String get micPermissionNeeded => 'Allow microphone access to dictate.';

  @override
  String get dictationEmpty => 'No speech came through. Try again.';

  @override
  String get startCall => 'Start a voice call';

  @override
  String get stopDictation => 'Stop and transcribe';

  @override
  String get dictate => 'Dictate';

  @override
  String get dictateOnDevice => 'Dictate with this device';

  @override
  String get stopListening => 'Stop listening';

  @override
  String get dictationRetry => 'Try Again';

  @override
  String get dictationSayAgain => 'Say it again';

  @override
  String get dictationFailed => 'Couldn\'t turn that into text.';

  @override
  String get dictationFailedUseDevice =>
      'Couldn\'t turn that into text. Say it again and your device will listen.';

  @override
  String get dictationNoServiceUseDevice =>
      'Dictation isn\'t set up for this workspace. Your device can listen instead.';

  @override
  String get dictationDeviceFailed =>
      'Your device\'s dictation stopped working, so the mic is back on Casama\'s.';

  @override
  String get dictationDevicePermission =>
      'Allow speech recognition to dictate with this device.';

  @override
  String get readAloud => 'Read aloud';

  @override
  String get callConnecting => 'Connecting…';

  @override
  String get callLive => 'Live';

  @override
  String get callEnded => 'Call ended';

  @override
  String get callEndedIdle => 'Ended the call after 2 minutes of silence.';

  @override
  String get callFailed => 'The call could not connect.';

  @override
  String get callListening => 'Listening';

  @override
  String get callSpeaking => 'Speaking';

  @override
  String get callWorking => 'Working on it';

  @override
  String get callMutedState => 'Muted';

  @override
  String get callCaptions => 'Captions';

  @override
  String get callSpeaker => 'Speaker';

  @override
  String get callEarpiece => 'Phone';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Headphones';

  @override
  String get callAudioOutput => 'Play the call through';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Changing its picture',
      'memory_search': 'Searching your memories',
      'memory_write': 'Saving that to memory',
      'memory': 'Updating its memory',
      'knowledge_search': 'Looking through your knowledge',
      'web_search': 'Searching the web',
      'web': 'Reading a web page',
      'browser_open': 'Opening a website',
      'browser_click': 'Clicking on the page',
      'browser_type': 'Typing on the page',
      'browser_press': 'Pressing a key',
      'browser_scroll': 'Scrolling the page',
      'browser_look': 'Looking at the page',
      'desktop_click': 'Clicking on the screen',
      'desktop_type': 'Typing',
      'desktop_press': 'Pressing keys',
      'desktop_launch': 'Opening an app',
      'desktop_look': 'Looking at the screen',
      'shell': 'Working on its computer',
      'files_read': 'Reading a file',
      'files_write': 'Writing a file',
      'files_list': 'Looking through files',
      'files_search': 'Searching files',
      'files_from_chat': 'Getting a file from the chat',
      'http': 'Contacting a service',
      'data_search': 'Looking for data',
      'data_call': 'Getting data',
      'skills_load': 'Getting a skill ready',
      'skills_create': 'Learning a new skill',
      'skills_update': 'Improving a skill',
      'checkpoint': 'Saving a restore point',
      'computer_restart': 'Restarting its computer',
      'takeover': 'Asking you to take over',
      'delegate': 'Asking a helper',
      'routines_list': 'Checking your routines',
      'routines_create': 'Setting up a routine',
      'routines_update': 'Updating a routine',
      'routines_delete': 'Removing a routine',
      'watchers_create': 'Setting up a watcher',
      'watchers_list': 'Checking your watchers',
      'watchers_delete': 'Removing a watcher',
      'tasks_list': 'Checking your tasks',
      'tasks_create': 'Adding a task',
      'tasks': 'Updating your tasks',
      'notify_user': 'Sending you a note',
      'usage_report': 'Checking usage',
      'device_read': 'Reading your device data',
      'device_access': 'Asking for device access',
      'pages_publish': 'Publishing a page',
      'pages': 'Updating a page',
      'media': 'Making an image',
      'media_video': 'Making a video',
      'bots_create': 'Making a new bot',
      'bots_update': 'Updating a bot',
      'bots_list': 'Checking your bots',
      'bots_archive': 'Archiving a bot',
      'channel_send': 'Sending a message',
      'links_ask': 'Asking a contact\'s assistant',
      'logins_list': 'Checking saved logins',
      'replay_run': 'Repeating saved steps',
      'replay_save': 'Saving these steps',
      'setup_apply': 'Suggesting a setup',
      'sidebar_organize': 'Organizing your sidebar',
      'suggestions_add': 'Adding a suggestion',
      'teach_save_draft': 'Saving a draft skill',
      'welcome_name': 'Picking a name',
      'secrets_request': 'Asking you for a secret',
      'pages_list': 'Checking your pages',
      'pages_share': 'Changing who can see a page',
      'projects_create': 'Starting a project',
      'projects_status': 'Checking a project',
      'projects_update': 'Updating a project',
      'projects': 'Planning a project',
      'payments': 'Asking to make a payment',
      'voice_call': 'Calling a business',
      'voice_call_user': 'Calling you',
      'tools_load': 'Getting ready',
      'ui_show': 'Showing you something',
      'start_task': 'Starting this in the chat',
      'adult_sites_turn_on': 'Asking to turn on adult sites',
      'connections_attach': 'Starting to use an app',
      'other': 'Working on it',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Changed its picture',
      'memory_search': 'Searched your memories',
      'memory_write': 'Saved to memory',
      'memory': 'Updated its memory',
      'knowledge_search': 'Looked through your knowledge',
      'web_search': 'Searched the web',
      'web': 'Read a web page',
      'browser_open': 'Opened a website',
      'browser_click': 'Clicked on the page',
      'browser_type': 'Typed on the page',
      'browser_press': 'Pressed a key',
      'browser_scroll': 'Scrolled the page',
      'browser_look': 'Looked at the page',
      'desktop_click': 'Clicked on the screen',
      'desktop_type': 'Typed',
      'desktop_press': 'Pressed keys',
      'desktop_launch': 'Opened an app',
      'desktop_look': 'Looked at the screen',
      'shell': 'Worked on its computer',
      'files_read': 'Read a file',
      'files_write': 'Wrote a file',
      'files_list': 'Looked through files',
      'files_search': 'Searched files',
      'files_from_chat': 'Got a file from the chat',
      'http': 'Contacted a service',
      'data_search': 'Looked for data',
      'data_call': 'Got data',
      'skills_load': 'Used a skill',
      'skills_create': 'Learned a new skill',
      'skills_update': 'Improved a skill',
      'checkpoint': 'Saved a restore point',
      'computer_restart': 'Restarted its computer',
      'takeover': 'Asked you to take over',
      'delegate': 'Asked a helper',
      'routines_list': 'Checked your routines',
      'routines_create': 'Set up a routine',
      'routines_update': 'Updated a routine',
      'routines_delete': 'Removed a routine',
      'watchers_create': 'Set up a watcher',
      'watchers_list': 'Checked your watchers',
      'watchers_delete': 'Removed a watcher',
      'tasks_list': 'Checked your tasks',
      'tasks_create': 'Added a task',
      'tasks': 'Updated your tasks',
      'notify_user': 'Sent you a note',
      'usage_report': 'Checked usage',
      'device_read': 'Read your device data',
      'device_access': 'Asked for device access',
      'pages_publish': 'Published a page',
      'pages': 'Updated a page',
      'media': 'Made an image',
      'media_video': 'Made a video',
      'bots_create': 'Made a new bot',
      'bots_update': 'Updated a bot',
      'bots_list': 'Checked your bots',
      'bots_archive': 'Archived a bot',
      'channel_send': 'Sent a message',
      'links_ask': 'Asked a contact\'s assistant',
      'logins_list': 'Checked saved logins',
      'replay_run': 'Repeated saved steps',
      'replay_save': 'Saved these steps',
      'setup_apply': 'Suggested a setup',
      'sidebar_organize': 'Organized your sidebar',
      'suggestions_add': 'Added a suggestion',
      'teach_save_draft': 'Saved a draft skill',
      'welcome_name': 'Picked a name',
      'secrets_request': 'Asked you for a secret',
      'pages_list': 'Checked your pages',
      'pages_share': 'Changed who can see a page',
      'projects_create': 'Started a project',
      'projects_status': 'Checked a project',
      'projects_update': 'Updated a project',
      'projects': 'Planned a project',
      'payments': 'Asked to make a payment',
      'voice_call': 'Called a business',
      'voice_call_user': 'Called you',
      'tools_load': 'Got ready',
      'ui_show': 'Showed you something',
      'start_task': 'Started in the chat',
      'adult_sites_turn_on': 'Asked to turn on adult sites',
      'connections_attach': 'Started using an app',
      'other': 'Done',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Using $app';
  }

  @override
  String toolUsedApp(String app) {
    return 'Used $app';
  }

  @override
  String get toolDetails => 'Details';

  @override
  String approvalAsking(String bot) {
    return '$bot is asking first';
  }

  @override
  String get approvalLookClosely => 'Look closely before you allow this';

  @override
  String approvalAttachConnection(String app) {
    return 'Start using $app, already connected in this workspace';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Let $bot do this without asking';
  }

  @override
  String get pageShareToPublic =>
      'Anyone with the link will be able to open it';

  @override
  String get pageShareToWorkspace =>
      'Everyone in this workspace will be able to open it';

  @override
  String get pageShareToPrivate => 'Only you will be able to open it';

  @override
  String approvalAllowedLine(String what) {
    return 'Allowed: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Declined: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'No answer in time: $what';
  }

  @override
  String get callToolFailed => 'That didn\'t work';

  @override
  String get callToolNeedsOk => 'Needs your OK to go ahead';

  @override
  String get callToolAllow => 'Allow';

  @override
  String get callToolNotNow => 'Not Now';

  @override
  String get callToolAllowed => 'Allowed. The result will show in the chat';

  @override
  String get callToolDeclined => 'You said not now';

  @override
  String get callToolBackground =>
      'Still working. The result will show in the chat';

  @override
  String get callToolInChat => 'The result will show in the chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '${secondsString}s';
  }

  @override
  String get callNeedsKeyTitle => 'Calls need a Google AI key';

  @override
  String get callNeedsKeyBody =>
      'Live calls run on Google\'s Gemini Live, so this workspace needs a Google AI key. It\'s only used for calls: read aloud, dictation, images and video run on OpenRouter. Google gives you one free in AI Studio: create it there, then add it under Model keys and calls work right away. Only workspace owners and admins can add keys.';

  @override
  String get callAddKey => 'Add a Google AI key';

  @override
  String get callGetFreeKey => 'Get a free key from Google';

  @override
  String get callMicUnmute => 'Unmute mic';

  @override
  String get videoUnmute => 'Unmute sound';

  @override
  String get callMicMute => 'Mute mic';

  @override
  String get videoMute => 'Mute sound';

  @override
  String get hangUp => 'Hang up';

  @override
  String callWith(String bot) {
    return 'Call with $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'End call with $from and call $to?';
  }

  @override
  String get callSwitchBody =>
      'You can be on one call at a time. The current call is saved to its chat first.';

  @override
  String get callSwitchConfirm => 'End and Call';

  @override
  String get callVoiceConsentTitle => 'Your voice goes to Google';

  @override
  String get callVoiceConsentBody =>
      'In a call, Casama sends your voice and what you say to Google Gemini, which hears you and speaks your bot\'s replies. The call\'s words also go to the AI model your bot uses, through OpenRouter. Nothing is sent until you agree. You can stop this any time in Settings › Privacy.';

  @override
  String get callVoiceConsentAgree => 'Agree and Call';

  @override
  String get callVoiceConsentNotNow => 'Not Now';

  @override
  String get callEndedLost =>
      'The call ended because the connection was lost for too long.';

  @override
  String get callMinimize => 'Minimize';

  @override
  String get callEndCall => 'End Call';

  @override
  String get callEndAndAnswer => 'End and Answer';

  @override
  String get callReconnecting => 'Reconnecting…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
      zero: 'under a minute',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Call with $bot, $time, tap to return';
  }

  @override
  String callReturnBar(String bot) {
    return 'On a call with $bot, tap to return';
  }

  @override
  String get callOpen => 'Open Call';

  @override
  String get callOnHold => 'On hold';

  @override
  String get callNotificationLive => 'On a call';

  @override
  String get callNotificationMuted => 'Muted';

  @override
  String get callNotificationChannel => 'Calls';

  @override
  String callTabTitle(String time) {
    return 'On a call · $time';
  }

  @override
  String get callMenuShow => 'Show Call';

  @override
  String get callJobWorking => 'Working on it';

  @override
  String callJobStrip(String task) {
    return 'Working on: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Needs you: $task';
  }

  @override
  String get callTileWatching => 'Live view';

  @override
  String get callTileDone => 'Done';

  @override
  String get callTileNeedsYou => 'Needs you';

  @override
  String callTileLabel(String state) {
    return 'The bot\'s screen, $state. Tap to see it full size';
  }

  @override
  String get callTileHide => 'Hide Screen';

  @override
  String get screenCardLive => 'live';

  @override
  String screenCardLabel(String bot, String state) {
    return '$bot\'s screen, $state';
  }

  @override
  String get screenCardOpen => 'Open full screen';

  @override
  String get screenCardYouHave => 'You have the screen';

  @override
  String screenCardHeldBy(String name) {
    return '$name has the screen';
  }

  @override
  String get screenCardMore => 'More options';

  @override
  String screenCardIntro(String bot) {
    return '$bot\'s screen. Tap to watch, drag to move.';
  }

  @override
  String get screenCardHideForNow => 'Hide for Now';

  @override
  String get screenCardDontShow => 'Don\'t Show Automatically';

  @override
  String get screenCardTurnedOff =>
      'The screen card is off. Turn it back on in Settings.';

  @override
  String get screenCardOfferOff =>
      'Hiding the screen card a lot? You can turn it off.';

  @override
  String get screenCardTurnOff => 'Turn Off';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot needs you on the screen';
  }

  @override
  String callRecapTitle(String length) {
    return 'Call · $length';
  }

  @override
  String get callRecapStarted => 'Started on the call';

  @override
  String get callRecapTaskDone => 'Done';

  @override
  String get callRecapTaskFailed => 'Didn\'t finish';

  @override
  String get callRecapTaskStopped => 'Stopped';

  @override
  String get callRecapTaskRunning => 'Still working';

  @override
  String get callRecapOpenRun => 'See what it did';

  @override
  String get summarizeCalls => 'Summarize calls';

  @override
  String get summarizeCallsHelp =>
      'After each call, its card says what it was about and what\'s next. Uses a little of the bot\'s small model.';

  @override
  String callCardVoice(String length) {
    return 'Voice call · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Phone call · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Call dropped · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Missed call from $name';
  }

  @override
  String callCardLive(String name) {
    return 'On a call with $name';
  }

  @override
  String get callCardLiveElsewhere => 'On a call on another device';

  @override
  String get callCardReturn => 'Return to call';

  @override
  String callCardBotHungUp(String name) {
    return '$name hung up';
  }

  @override
  String get callCardEndedQuiet => 'Ended after a quiet stretch';

  @override
  String get callCardEndedLimit => 'Ended at the call limit';

  @override
  String get callCardWritingSummary => 'Writing a summary…';

  @override
  String callCardSummaryBy(String name) {
    return 'Summary by $name';
  }

  @override
  String get callCardNextSteps => 'Next steps';

  @override
  String get callCardDoIt => 'Do it';

  @override
  String get callCardDismissStep => 'Dismiss';

  @override
  String get callCardStepStarted => 'Started';

  @override
  String get callCardStepFailed => 'Couldn\'t start that. Try again.';

  @override
  String get callCardDoneOnCall => 'Done on the call';

  @override
  String callCardMore(int count) {
    return '$count more';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Transcript · $count turns',
      one: 'Transcript · 1 turn',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Transcript';

  @override
  String get callCardSearchTranscript => 'Search the transcript';

  @override
  String get callCardNoMatches => 'No matches';

  @override
  String get callCardYou => 'You';

  @override
  String get callCardCallBack => 'Call back';

  @override
  String get callCardCopy => 'Copy';

  @override
  String get callCardCopied => 'Copied';

  @override
  String get callCardShare => 'Share';

  @override
  String get callCardMoreActions => 'More';

  @override
  String get callCardDelete => 'Delete call';

  @override
  String get callCardDeleteTitle => 'Delete this call?';

  @override
  String get callCardDeleteBody =>
      'Its card and transcript are removed from this chat. Jobs it started keep their results.';

  @override
  String get callCardDeleted => 'Call deleted';

  @override
  String get callCardDeleteFailed => 'Couldn\'t delete the call';

  @override
  String callCardSemantics(String title, String summary) {
    return '$title. $summary';
  }

  @override
  String replyLatency(int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'Reply started in $msString ms';
  }

  @override
  String get voiceSettings => 'Voice';

  @override
  String get voiceSettingsHelp =>
      'Read-aloud voice and the tools a bot has on calls';

  @override
  String get callTools => 'Tools on Calls';

  @override
  String get callToolsHelp =>
      'Calls already include memory, web search, notes to you, routines and tickets, and hand bigger jobs to the chat. Add connected-app tools the bot should use live; each one adds a little to every call\'s cost.';

  @override
  String get callToolsNone =>
      'This bot has no connected apps turned on yet. Turn one on in its Integrations, then pick its tools here.';

  @override
  String get openIntegrations => 'Open Integrations';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString connected-app tools added',
      one: '1 connected-app tool added',
      zero: 'Only the built-in voice tools',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'Voice id (optional)';

  @override
  String get voiceIdHelp =>
      'A Gemini voice name, such as Kore or Puck; empty uses Kore';

  @override
  String get useThisComputer => 'Use this computer for bots';

  @override
  String get companionDesktopOnly =>
      'Only the desktop app (macOS, Windows, Linux) can act as a bot computer.';

  @override
  String get companionIntro =>
      'Let chosen bots work on this computer: run commands, edit files in folders you pick, browse and use apps. Everything they do shows on screen and can be stopped. Off until you approve each capability.';

  @override
  String get thisComputer => 'This computer';

  @override
  String get companionOnline => 'On: bots you allow can use this computer';

  @override
  String get companionError => 'Cannot reach Casama; retrying';

  @override
  String get companionOff => 'Off';

  @override
  String get companionCapabilities => 'What Bots May Do';

  @override
  String get companionCapabilitiesHelp =>
      'Approve each one. High-risk actions always ask, whatever the bot\'s autonomy.';

  @override
  String get capShell => 'Run commands (inside shared folders)';

  @override
  String get capFiles => 'Read and edit files in shared folders';

  @override
  String get capBrowser => 'Use a browser (its own, separate from yours)';

  @override
  String get capDesktop => 'Use desktop apps';

  @override
  String get sharedFolders => 'Shared Folders';

  @override
  String get sharedFoldersHelp => 'Bots can only reach these folders.';

  @override
  String get addFolder => 'Add a Folder';

  @override
  String get botsAllowed => 'Bots Allowed';

  @override
  String get botsAllowedHelp =>
      'Allowed bots can also work on this computer. Each one keeps its own computer and uses that unless a task needs this one.';

  @override
  String get worksOnTitle => 'Works on';

  @override
  String worksOnSubtitle(String bot) {
    return 'Where $bot runs commands, uses files and browses for you.';
  }

  @override
  String get worksOnAuto => 'Automatic';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot picks for each step: its own computer, unless the task needs yours.';
  }

  @override
  String get worksOnBot => 'Only the bot\'s computer';

  @override
  String get worksOnBotHelp => 'Your computer isn\'t used at all.';

  @override
  String get worksOnMine => 'Only my computer';

  @override
  String get worksOnMineHelp =>
      'Everything happens on your computer, so it has to be on.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Everything happens on $computer, so it has to be on.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Works on: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Where $bot works';
  }

  @override
  String get placesSubtitle =>
      'Pick the computer to look at here. Works on decides where the bot does its work.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Showing $computer. Works on: $mode. Change';
  }

  @override
  String get placeYoursOnline => 'Your computer · Online';

  @override
  String get placeYoursOffline => 'Your computer · Offline';

  @override
  String get placeTeamComputer => 'Team computer';

  @override
  String placeBotsOwn(String bot) {
    return '$bot\'s own computer';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action on $computer';
  }

  @override
  String get botYourComputer => 'Your computer';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone => 'Not allowed on any of your computers';

  @override
  String botYourComputerHow(String bot) {
    return 'To let $bot work on your computer too, open Casama on that computer and turn it on under Settings → Use this computer for bots → Bots Allowed. It keeps its own computer either way.';
  }

  @override
  String get routineWhere => 'Where it works';

  @override
  String get routineWhereHelp =>
      'Where this routine runs commands and uses files.';

  @override
  String get routineWhereBot => 'The bot\'s computer';

  @override
  String get routineWhereBotHelp => 'Runs whether your computer is on or not.';

  @override
  String get routineWhereMine => 'My computer when it\'s on';

  @override
  String get routineWhereMineHelp =>
      'For work on your own files and apps. A run says so when the computer was off.';

  @override
  String get computerBotsAllowed => 'Bots allowed';

  @override
  String get unpairComputer => 'Stop using this computer and unpair it';

  @override
  String botActingHere(String bot, String action) {
    return '$bot is working on this computer: $action';
  }

  @override
  String get quickAsk => 'Quick ask';

  @override
  String get quickAskHint => 'Ask a bot anything…';

  @override
  String get bot => 'Bot';

  @override
  String get adminConsole => 'Admin console';

  @override
  String get adminLockNow => 'Lock now';

  @override
  String get adminGroupMoney => 'Money';

  @override
  String get adminGroupPeople => 'People';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAboutOverview =>
      'What\'s happening on this server right now.';

  @override
  String get adminAboutCosts =>
      'What Casama spends, what it charges, and the margin.';

  @override
  String get adminAboutPricing => 'Plans, credit packs and markup.';

  @override
  String get adminAboutVendors =>
      'Usage and balances at the services Casama pays for.';

  @override
  String get adminAboutResets =>
      'Saved resets people can use when they hit a limit.';

  @override
  String get adminAboutUsers =>
      'Everyone with an account, and how recently they were here.';

  @override
  String get adminAboutWorkspaces =>
      'Quotas, suspensions and what each workspace costs.';

  @override
  String get adminAboutWaitlist =>
      'Who\'s waiting to get in, invites and the sign-up gate.';

  @override
  String get adminAboutSupport => 'Help requests from people using Casama.';

  @override
  String get adminAboutReports => 'Content and links people reported.';

  @override
  String get adminAboutAbuse =>
      'Blocked mining, floods, blocked sign-ups and suspensions.';

  @override
  String get adminAboutServices =>
      'Models, connections, app settings and service health.';

  @override
  String get adminAboutDomains =>
      'Domains people bought or connected, and their orders.';

  @override
  String get adminAboutMail =>
      'Bot email addresses, sending health and reserved names.';

  @override
  String get adminAboutSecurity =>
      'The admin PIN and the devices that can unlock this console.';

  @override
  String get adminRefresh => 'Refresh';

  @override
  String get adminClearSearch => 'Clear search';

  @override
  String get adminSortBy => 'Sort by';

  @override
  String adminSortLabel(String name) {
    return 'Sort: $name';
  }

  @override
  String get adminMoreActions => 'More actions';

  @override
  String get adminLockChipHelp =>
      'Locks after 5 minutes without activity. Tap to lock now.';

  @override
  String get adminGoToSection => 'Go to a section or setting';

  @override
  String get adminNoSectionMatch => 'Nothing matches.';

  @override
  String get adminSearchHint => 'Search the console';

  @override
  String adminSearchNone(String query) {
    return 'Nothing in the console matches “$query”.';
  }

  @override
  String get adminNeedsAttention => 'Needs attention';

  @override
  String get adminAllClear => 'All clear. Nothing needs you right now.';

  @override
  String adminAttentionVendors(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vendors are low or out',
      one: '1 vendor is low or out',
    );
    return '$_temp0';
  }

  @override
  String adminAttentionFailedRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count runs failed in the last 24 hours',
      one: '1 run failed in the last 24 hours',
    );
    return '$_temp0';
  }

  @override
  String adminAttentionTickets(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open help requests',
      one: '1 open help request',
    );
    return '$_temp0';
  }

  @override
  String adminAttentionReports(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new reports to review',
      one: '1 new report to review',
    );
    return '$_temp0';
  }

  @override
  String adminAttentionAbuse(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count abuse signals in the last 24 hours',
      one: '1 abuse signal in the last 24 hours',
    );
    return '$_temp0';
  }

  @override
  String adminAttentionWaitlist(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people waiting to get in',
      one: '1 person waiting to get in',
    );
    return '$_temp0';
  }

  @override
  String adminAttentionDomains(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count domain orders need you',
      one: '1 domain order needs you',
    );
    return '$_temp0';
  }

  @override
  String get adminUnlock => 'Unlock admin console';

  @override
  String get adminLockedHelp =>
      'It\'s locked to keep this instance safe. Verify it\'s you to continue.';

  @override
  String get adminConfirmAction => 'Confirm admin action';

  @override
  String get adminConfirmActionHelp =>
      'This action changes the instance. Verify it\'s you to continue.';

  @override
  String get adminConfirmIdentity => 'Confirm it\'s you';

  @override
  String get adminConfirmSignInCodeHelp =>
      'This code signs another device in as you. Verify your password or a fresh email code to continue.';

  @override
  String get adminConfirmOwnerActionHelp =>
      'Verify your password or a fresh email code to continue.';

  @override
  String get adminVerifyPassword => 'Verify password';

  @override
  String get adminSendCode => 'Send an email code';

  @override
  String get adminCodeSent =>
      'We sent a code to your account email. Enter it below to continue.';

  @override
  String get adminVerifyCode => 'Verify code';

  @override
  String get adminAuthenticationFailed =>
      'Could not verify your identity. Check your password or code and try again.';

  @override
  String get adminTwoStepHelp =>
      'Your account uses two-step sign-in. Enter the 6-digit code from your authenticator app to finish.';

  @override
  String get adminTwoStepTip =>
      'Tip: turn on two-step sign-in in Settings. Without it, anyone who can read your email on this device can unlock the console with an emailed code.';

  @override
  String get adminUnlockDevice => 'Unlock with screen lock';

  @override
  String get adminDeviceReason => 'Confirm it\'s you for the admin console';

  @override
  String get adminVerifyPasskey => 'Verify with a passkey';

  @override
  String get adminOrPassword => 'or use your password';

  @override
  String get adminPasskeyTip =>
      'Tip: add a passkey in Settings → Passkeys to verify with Face ID or a fingerprint instead of your password.';

  @override
  String get adminSecurity => 'Security';

  @override
  String get adminPinTitle => 'Admin PIN';

  @override
  String get adminPinSet => 'Set an admin PIN';

  @override
  String get adminPinChange => 'Change the admin PIN';

  @override
  String get adminPinRemove => 'Remove the admin PIN';

  @override
  String get adminPinHelp =>
      '6 digits to unlock the console and confirm changes, instead of your password. Five wrong tries turn it off.';

  @override
  String get adminPinOffHelp =>
      'Turned off after too many wrong tries. Set a new one.';

  @override
  String get adminPinSetupBody =>
      '6 digits for the admin console. Kept on your server, never on this device.';

  @override
  String get adminPinSaved => 'Admin PIN saved';

  @override
  String get adminPinRemoved => 'Admin PIN removed';

  @override
  String get adminPinLabel => 'Admin PIN';

  @override
  String adminPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tries left',
      one: '1 try left',
    );
    return 'Wrong PIN. $_temp0.';
  }

  @override
  String get adminPinTurnedOff =>
      'Too many wrong PINs: the admin PIN is turned off. Use a passkey or your password, then set a new PIN under Security.';

  @override
  String get adminUnlockTitle => 'Unlock the admin console';

  @override
  String get adminConfirmTitle => 'Confirm it\'s you';

  @override
  String get adminMethodFaceId => 'Face ID';

  @override
  String get adminMethodTouchId => 'Touch ID';

  @override
  String get adminMethodFingerprint => 'Fingerprint';

  @override
  String get adminMethodScreenLock => 'Screen lock';

  @override
  String get adminMethodPasskey => 'Passkey';

  @override
  String get adminMethodPin => 'PIN';

  @override
  String get adminMethodPassword => 'Password';

  @override
  String get adminMethodEmail => 'Email';

  @override
  String get adminMethodsLabel => 'Ways to verify';

  @override
  String adminDevicePrompt(String method) {
    return 'Use $method on this device.';
  }

  @override
  String get adminPasskeyPrompt =>
      'Use a passkey saved on this device or your phone.';

  @override
  String get adminPinPrompt => 'Enter your admin PIN';

  @override
  String get adminPinForgot => 'Forgot it? Use your password';

  @override
  String get adminPasswordForgot => 'Forgot it? Get an email code';

  @override
  String get adminShowPassword => 'Show password';

  @override
  String get adminHidePassword => 'Hide password';

  @override
  String get adminPasswordWrong => 'That password didn\'t work';

  @override
  String get adminCodeWrong => 'That code didn\'t work';

  @override
  String get adminVerifyFailed => 'Couldn\'t verify. Try again';

  @override
  String get adminCodeSendFailed => 'Couldn\'t send the code. Try again';

  @override
  String get adminEmailPrompt => 'We\'ll email you a 6-digit code.';

  @override
  String adminSendCodeTo(String email) {
    return 'Send a code to $email';
  }

  @override
  String adminCodeSentTo(String email) {
    return 'Enter the code we sent to $email';
  }

  @override
  String adminResendIn(String time) {
    return 'Resend in $time';
  }

  @override
  String get adminResendCode => 'Resend code';

  @override
  String adminStepOf(int step, int total) {
    return 'Step $step of $total';
  }

  @override
  String get adminStepEmailCode => 'Email code';

  @override
  String get adminStepSignedIn => 'Signed in';

  @override
  String get adminStepAuthenticator => 'Authenticator code';

  @override
  String get adminLockFooter =>
      'Locks after 5 minutes without activity and when you leave the app';

  @override
  String get adminPinEnterAgain => 'Enter it again';

  @override
  String get adminPinRemoveConfirm => 'Remove the admin PIN?';

  @override
  String get adminPinRemoveBody =>
      'You\'ll unlock the console with a passkey, the screen lock or your password instead.';

  @override
  String adminDeviceRemoveConfirm(String name) {
    return 'Remove $name?';
  }

  @override
  String get adminDeviceRemoveBody =>
      'It won\'t unlock the admin console any more. You can set it up again later.';

  @override
  String adminDeviceLastUsed(String when) {
    return 'Last used $when';
  }

  @override
  String get adminDeviceNeverUsed => 'Not used yet';

  @override
  String get adminPinIsSet => 'On';

  @override
  String get adminPinIsOff => 'Turned off';

  @override
  String get adminPinNotSet => 'Not set';

  @override
  String get adminDeviceOfferTitle => 'Use your screen lock next time?';

  @override
  String get adminDeviceOfferBody =>
      'Unlock the admin console and confirm changes with your face, a fingerprint or this device\'s passcode or password. A key in this device\'s secure chip proves it\'s you, and it never leaves the device.';

  @override
  String get adminDeviceOfferNo => 'Not now';

  @override
  String get adminDeviceOfferYes => 'Turn on';

  @override
  String get adminDeviceSetupReason =>
      'Turn on the screen lock for the admin console';

  @override
  String get adminDeviceOn => 'The screen lock is on for the admin console';

  @override
  String get adminDeviceTitle => 'Screen lock';

  @override
  String get adminDeviceTurnOn => 'Use the screen lock on this device';

  @override
  String get adminDeviceHelp =>
      'Your face, a fingerprint or this device\'s passcode or password unlocks the console and confirms changes. No passkey or admin PIN needed.';

  @override
  String get adminDeviceThisOne => 'This device';

  @override
  String get adminDeviceRemove => 'Remove';

  @override
  String get adminDeviceRemoved => 'Removed';

  @override
  String get adminDeviceAgentScope => 'Agent · reads only';

  @override
  String get adminAgentTitle => 'Agents';

  @override
  String get adminAgentHelp =>
      'Agents on your computers read the admin console with their own key. To change anything, they ask you first.';

  @override
  String get adminAgentNothing => 'No agent requests yet';

  @override
  String get adminAgentWaiting => 'Waiting for you';

  @override
  String adminAgentLive(int minutes) {
    return 'Can make changes · $minutes min left';
  }

  @override
  String get adminAgentStop => 'Stop';

  @override
  String get adminAgentStopped => 'Agent access stopped';

  @override
  String get adminAgentReview => 'Review';

  @override
  String adminAgentRequestTitle(String name) {
    return '$name wants to change admin settings';
  }

  @override
  String adminAgentFor(int minutes) {
    return 'For $minutes minutes';
  }

  @override
  String get adminAgentApproveHelp =>
      'Until it ends, the agent can change admin settings, but never your PIN, keys or the admin bot\'s approvals. You can stop it any time under Admin → Security.';

  @override
  String get adminAgentApprove => 'Approve';

  @override
  String get adminAgentDeny => 'Deny';

  @override
  String adminAgentApproved(int minutes) {
    return 'Approved for $minutes minutes';
  }

  @override
  String get adminAgentDenied => 'Denied';

  @override
  String get adminAgentExpired => 'This request expired';

  @override
  String get adminAgentEnded => 'This access has ended';

  @override
  String adminAgentChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count changes',
      one: '1 change',
      zero: 'No changes',
    );
    return '$_temp0';
  }

  @override
  String get adminAgentConfirm => 'Approve agent access';

  @override
  String get adminAgentLogTitle => 'Recent agent activity';

  @override
  String adminAgentAction(String action) {
    String _temp0 = intl.Intl.selectLogic(action, {
      'read': 'Read',
      'change': 'Changed',
      'asked': 'Asked for changes',
      'approved': 'Approved',
      'denied': 'Denied',
      'ended': 'Ended',
      'other': '$action',
    });
    return '$_temp0';
  }

  @override
  String get adminOverview => 'Overview';

  @override
  String get adminUsers => 'Users';

  @override
  String get adminWorkspaces => 'Workspaces';

  @override
  String get adminPeopleAll => 'All';

  @override
  String get adminPeopleStatus => 'Status';

  @override
  String get adminPeopleId => 'ID';

  @override
  String get adminPeopleCopyId => 'Copy ID';

  @override
  String get adminPeopleYes => 'Yes';

  @override
  String get adminPeopleNo => 'No';

  @override
  String get adminWsCost30d => 'Cost, 30 days';

  @override
  String get adminWsWithQuotas => 'With quotas';

  @override
  String get adminWsSuspended => 'Suspended';

  @override
  String get adminWsSearch => 'Search workspaces';

  @override
  String get adminWsFilterQuotas => 'Quotas';

  @override
  String get adminWsFilterNearCap => 'Near cap';

  @override
  String get adminWsSortCost => 'Cost';

  @override
  String get adminWsSortMembers => 'Members';

  @override
  String get adminWsSortBots => 'Bots';

  @override
  String get adminWsSortName => 'Name';

  @override
  String get adminWsColWorkspace => 'Workspace';

  @override
  String get adminWsColCost => 'Cost 30d';

  @override
  String get adminWsActive => 'Active';

  @override
  String adminWsNearCap(String usd) {
    return 'Near $usd cap';
  }

  @override
  String get adminWsOverCap => 'Over cap';

  @override
  String adminWsQuotaBots(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Max $n bots',
      one: 'Max 1 bot',
    );
    return '$_temp0';
  }

  @override
  String adminWsQuotaUsd(String usd) {
    return '$usd/mo';
  }

  @override
  String get adminWsNoMatch => 'No workspaces match';

  @override
  String get adminWsGiveReset => 'Give a saved reset';

  @override
  String adminWsUnsuspendQuestion(String name) {
    return 'Lift the suspension on $name?';
  }

  @override
  String get adminWsUnsuspendHelp => 'Its bots and computers can run again.';

  @override
  String adminWsSuspendedDone(String name) {
    return 'Suspended $name';
  }

  @override
  String adminWsLiftedDone(String name) {
    return 'Lifted the suspension on $name';
  }

  @override
  String get adminWsQuotasSaved => 'Quotas saved';

  @override
  String get adminWsPlan => 'Plan';

  @override
  String get adminWsLimits => 'Limits';

  @override
  String get adminWsNoLimits => 'No limits';

  @override
  String get adminWsSuspension => 'Suspension';

  @override
  String get adminWsNotSuspended => 'Not suspended';

  @override
  String get adminWsActions => 'Actions';

  @override
  String get adminQuotaNoLimit => 'No limit';

  @override
  String adminQuotaNowBots(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Now: $n bots',
      one: 'Now: 1 bot',
    );
    return '$_temp0';
  }

  @override
  String adminQuotaNowUsd(String usd) {
    return 'Now: $usd in 30 days';
  }

  @override
  String get adminQuotaPositive => 'Enter a number above 0';

  @override
  String get adminQuotaWhole => 'Enter a whole number';

  @override
  String get adminQuotasHelp => 'Turn on No limit to drop a quota.';

  @override
  String get adminUsersActive7d => 'Active in 7 days';

  @override
  String get adminUsersSearch => 'Search by email';

  @override
  String get adminUsersActive => 'Active';

  @override
  String get adminUsersSortLastActive => 'Last active';

  @override
  String get adminUsersSortEmail => 'Email';

  @override
  String get adminUsersNever => 'Never';

  @override
  String get adminUsersNone => 'No users yet';

  @override
  String get adminUsersNoMatch => 'No users match';

  @override
  String get adminUsersStopKeeping => 'Stop keeping';

  @override
  String adminUsersKeepQuestion(String email) {
    return 'Keep $email?';
  }

  @override
  String adminUsersStopKeepingQuestion(String email) {
    return 'Stop keeping $email?';
  }

  @override
  String get adminUsersStopKeepingHelp =>
      'It can be rested or removed again when it goes unused.';

  @override
  String adminUsersKeptDone(String email) {
    return 'Keeping $email';
  }

  @override
  String adminUsersUnkeptDone(String email) {
    return 'Stopped keeping $email';
  }

  @override
  String get adminUsersJoined => 'Joined';

  @override
  String get adminUsersLastSignIn => 'Last sign-in';

  @override
  String get adminAbuseMining => 'Mining';

  @override
  String get adminAbuseBlockedPorts => 'Blocked ports';

  @override
  String get adminAbuseFloods => 'Floods';

  @override
  String get adminAbuseSignups => 'Sign-ups';

  @override
  String get adminAbuseSuspensions => 'Suspensions';

  @override
  String get adminAbuseNoMatch => 'Nothing of this kind.';

  @override
  String get adminAbuseNoWorkspace => 'No workspace';

  @override
  String get adminServices => 'Services';

  @override
  String get cloudModelsTitle => 'Cloud Models';

  @override
  String get cloudModelsHelp => 'Applies to every Cloud server within seconds.';

  @override
  String get adminServicesHealth => 'Health';

  @override
  String get adminServicesModels => 'Models';

  @override
  String get adminServicesAdvanced => 'Advanced';

  @override
  String get adminServicesAllOk => 'Every service is running.';

  @override
  String adminServicesDownSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count services are down',
      one: '1 service is down',
    );
    return '$_temp0';
  }

  @override
  String get adminServicesEmpty => 'This server reports no services.';

  @override
  String adminCloudModelsSummary(int count, String chat) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chat on $chat, $count models in all',
      one: 'Chat on $chat, 1 model in all',
    );
    return '$_temp0';
  }

  @override
  String get adminCloudGroupChat => 'Chat & background';

  @override
  String get adminCloudGroupMedia => 'Media';

  @override
  String get adminCloudGroupVoice => 'Voice';

  @override
  String get adminCloudGroupEmbeddings => 'Embeddings';

  @override
  String get adminCloudChat => 'Chat';

  @override
  String get adminCloudChatHelp => 'Answers in chats. An OpenRouter model id.';

  @override
  String get adminCloudBackground => 'Background';

  @override
  String get adminCloudBackgroundHelp =>
      'Titles, summaries and other quiet work.';

  @override
  String get adminCloudImage => 'Images';

  @override
  String get adminCloudImageHelp => 'Makes and edits pictures.';

  @override
  String get adminCloudImageSize => 'Image size';

  @override
  String get adminCloudImageSizeHelp => 'Bigger pictures cost more.';

  @override
  String get adminCloudVideo => 'Video';

  @override
  String get adminCloudVideoHelp => 'Makes short videos, on OpenRouter.';

  @override
  String get adminCloudLive => 'Calls';

  @override
  String get adminCloudLiveHelp => 'Voice calls, on Google\'s Gemini Live.';

  @override
  String get adminCloudTts => 'Read aloud';

  @override
  String get adminCloudTtsHelp => 'Reads answers out loud, on OpenRouter.';

  @override
  String get adminCloudStt => 'Dictation';

  @override
  String get adminCloudSttHelp => 'Turns speech into text, on OpenRouter.';

  @override
  String get adminCloudEmbedding => 'Embeddings';

  @override
  String get adminCloudEmbeddingHelp => 'Finds things in memories and files.';

  @override
  String get adminCloudRequired => 'Enter a model id.';

  @override
  String get adminModelAccessDefaultShort => 'Default';

  @override
  String get adminJsonFormat => 'Format';

  @override
  String adminJsonInvalid(String problem) {
    return 'That isn\'t valid JSON: $problem';
  }

  @override
  String adminJsonWhere(String problem, int line, int column) {
    return '$problem (line $line, column $column)';
  }

  @override
  String get adminJsonNotObject =>
      'This needs to be one JSON object, in curly brackets.';

  @override
  String adminJsonLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lines',
      one: '1 line',
    );
    return '$_temp0';
  }

  @override
  String get adminNoPlans => 'No plans yet.';

  @override
  String get adminNoPacks => 'No credit packs yet.';

  @override
  String adminPlanWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count workspaces',
      one: '1 workspace',
      zero: 'No workspaces',
    );
    return '$_temp0';
  }

  @override
  String adminPackCreditsShort(String amount) {
    return '$amount in credits';
  }

  @override
  String get connectionsTitle => 'App Connections';

  @override
  String get connectionsServerComposio => 'Casama\'s Composio Account';

  @override
  String get connectionsServerComposioHelp =>
      'Apps without their own sign-in connect in one click through this server\'s Composio account.';

  @override
  String get connectionsOwnAccounts => 'People\'s Own Accounts';

  @override
  String get connectionsOwnAccountsHelp =>
      'Each person uses their own Composio, Pipedream or Zapier.';

  @override
  String get connectionsNoComposioKey =>
      'Add COMPOSIO_API_KEY to this server to use Casama\'s account.';

  @override
  String get connectionsGoogleTitle => 'Google Apps';

  @override
  String get connectionsGoogleComposio => 'Through Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Calendar, Drive and more work right away.';

  @override
  String get connectionsGoogleDirect => 'Google\'s Own Servers';

  @override
  String get connectionsGoogleDirectHelp =>
      'Needs Google Workspace Developer Preview enrollment.';

  @override
  String get notInstanceOwner =>
      'Only the instance owner can open the admin console.';

  @override
  String get runs24h => 'Runs (24 h)';

  @override
  String get failedRuns24h => 'Failed runs (24 h)';

  @override
  String get cost24h => 'Spend (24 h)';

  @override
  String get computersRunning => 'Computers running';

  @override
  String get devicesOnline => 'Personal computers online';

  @override
  String get editQuotas => 'Edit quotas';

  @override
  String get maxBots => 'Bot limit';

  @override
  String get monthlyUsd => 'Monthly spend limit (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest is available (you run $current)';
  }

  @override
  String casamaVersion(String version) {
    return 'Casama $version';
  }

  @override
  String workspacesCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString workspaces',
      one: '1 workspace',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'signed in $when';
  }

  @override
  String quotasFor(String name) {
    return 'Quotas for $name';
  }

  @override
  String membersCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String botsCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String cost30d(String usd) {
    return '$usd in 30 days';
  }

  @override
  String get connectingToServer => 'Connecting to Casama…';

  @override
  String get cannotReachServer => 'Can\'t reach your Casama server';

  @override
  String get connectionFailed =>
      'Couldn\'t reach your Casama server. Check your connection and try again.';

  @override
  String get serverNotResponding =>
      'Your Casama server isn\'t responding right now. Try again in a moment.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Check your connection, or that the server at $url is running.';
  }

  @override
  String get serverUnreachableBody =>
      'Check that you\'re online. If you are, the server may be restarting, so we\'ll keep trying.';

  @override
  String retryingIn(int seconds) {
    return 'Trying again in ${seconds}s';
  }

  @override
  String get retryingNow => 'Trying…';

  @override
  String get upgradeTitle => 'Upgrade Your Plan';

  @override
  String get notNow => 'Not Now';

  @override
  String get seePlans => 'See plans';

  @override
  String get billing => 'Billing';

  @override
  String get billingOffSelfHosted =>
      'Billing is off on this server. It runs on its own license: personal use is free for one person, and teams use a Business license.';

  @override
  String get restorePurchases => 'Restore Purchases';

  @override
  String get restoreStarted => 'Checking your purchases…';

  @override
  String get plans => 'Plans';

  @override
  String get currentPlan => 'Current plan';

  @override
  String subscribeFor(String price) {
    return 'Subscribe for $price';
  }

  @override
  String get subscribeOnWeb => 'Subscribe on the Web';

  @override
  String get credits => 'Credits';

  @override
  String get creditHistory => 'Credit History';

  @override
  String get creditReasonPurchase => 'Credits bought';

  @override
  String get creditReasonGrant => 'Credits added';

  @override
  String get creditReasonRefund => 'Refund';

  @override
  String get creditReasonAdjustment => 'Adjustment';

  @override
  String get creditReasonExpire => 'Credits expired';

  @override
  String limitBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String get limitBotsUnlimited => 'Unlimited bots';

  @override
  String get unlimitedValue => 'Unlimited';

  @override
  String trialDaysFree(int n) {
    return '$n days free';
  }

  @override
  String get extraPeople => 'Extra People';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price per person a month, on top of the $seats your plan includes.';
  }

  @override
  String get extraPeopleSaved => 'Extra people updated';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString computer hours a month';
  }

  @override
  String limitCredits(String amount) {
    return '$amount credits a month';
  }

  @override
  String get viaWeb => 'Billed on the web';

  @override
  String get viaAppStore => 'Billed through the App Store';

  @override
  String get viaGooglePlay => 'Billed through Google Play';

  @override
  String get yourPlan => 'Your plan';

  @override
  String planEndsOn(String date) {
    return 'Ends on $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Renews on $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Credits: $amount';
  }

  @override
  String get manageSubscription => 'Manage Subscription';

  @override
  String get compViaCasama => 'Free from Casama';

  @override
  String compFreeUntil(String date) {
    return 'Free until $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Test purchase. Tester limits apply: $credits of credits a month and $daily a day.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Keep $plan';
  }

  @override
  String get haveGiftCode => 'Have a Gift Code?';

  @override
  String get redeemCodeTitle => 'Redeem a Gift Code';

  @override
  String get redeemCodeIntro =>
      'Enter the code you were given. The plan goes to the workspace you choose, with nothing to pay.';

  @override
  String get redeemCodeLabel => 'Gift code';

  @override
  String get redeemCodeChecking => 'Checking…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months months of $plan, free',
      one: '1 month of $plan, free',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'That code doesn\'t exist or can\'t be used anymore.';

  @override
  String get redeemCodeWorkspace => 'Workspace';

  @override
  String get redeemCodeSubmit => 'Redeem';

  @override
  String get redeemCodeFinePrint =>
      'One gift code per person. When it ends, the workspace moves to Free unless you choose a plan.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan is yours';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Your workspace has $plan free until $date. Open Casama on any device to use it.';
  }

  @override
  String get redeemCodeOpenBilling => 'Open Billing';

  @override
  String get redeemCodeNoWorkspace =>
      'A gift code goes to a workspace you own. Create one first, then open the link again.';

  @override
  String get redeemCodeUnavailable =>
      'This isn\'t available in this version of the app.';

  @override
  String usageComputerHours(String hours) {
    return 'Cloud computers: $hours h';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Live view: $minutes min';
  }

  @override
  String get thisMonth => 'This month';

  @override
  String get noBillableUsage => 'No billable usage yet.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Connect a self-hosted Casama to this workspace. A public address and notifications are free; cloud computers and model credits are billed here.';

  @override
  String get linkCloudNewKey => 'New Casama Link Key';

  @override
  String get linkCloudKeyCreated => 'Key Created';

  @override
  String get linkCloudKeyOnce =>
      'Copy it now; it is shown only once. Set it on your server with CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Copy';

  @override
  String get revoke => 'Revoke';

  @override
  String get instanceName => 'Server name';

  @override
  String get server => 'Server';

  @override
  String get serverAddress => 'Server address';

  @override
  String get serverAddressInvalid =>
      'Enter a server address like https://casama.example.com or http://192.168.1.20:8080.';

  @override
  String get connect => 'Connect';

  @override
  String get changeServer => 'Use a Different Server';

  @override
  String serverIs(String host) {
    return 'Server: $host';
  }

  @override
  String get continueWithSso => 'Continue with SSO';

  @override
  String get workEmail => 'Work email';

  @override
  String get privacy => 'Privacy';

  @override
  String get exportMyData => 'Export My Data';

  @override
  String get exportMyDataHelp =>
      'Bots, chats, runs, memories and settings. No secrets.';

  @override
  String exportReady(String kb) {
    return 'Export ready ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Keep Run History For';

  @override
  String get runHistoryRetentionHelp =>
      'Older run events are deleted automatically.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Delete My Account';

  @override
  String get deleteAccountHelp =>
      'Erases your data after a short grace period.';

  @override
  String get deleteAccountQuestion => 'Delete your account?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Workspaces where you are the only owner are deleted with your account, including their bots and computers. A plan you bought on the web is cancelled automatically. A plan bought in the App Store or Google Play isn\'t: cancel it in that store. Type $email to confirm.';
  }

  @override
  String get accountDeleted => 'Account Scheduled for Deletion';

  @override
  String accountDeletedBody(String date) {
    return 'You have been signed out. Your data will be erased on $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String showMoreSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Show $countString earlier steps',
      one: 'Show 1 earlier step',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Copied';

  @override
  String get jumpToLatest => 'Jump to latest';

  @override
  String get chatViewFullTable => 'View full table';

  @override
  String get chatTableTitle => 'Table';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Ask $bot anything, or tap an idea below to get started.';
  }

  @override
  String get suggestPlanDay => 'Help me plan my day';

  @override
  String get suggestWriteMessage => 'Help me write a message';

  @override
  String get suggestExplain => 'Look something up and explain it simply';

  @override
  String get suggestCapabilities => 'What can you help me with?';

  @override
  String connectedAppSummary(String app) {
    return 'Connected $app';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama hasn\'t checked this server. Connect it only if you trust $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama hasn\'t checked this server. Connect it only if you trust who runs it.';

  @override
  String get serverAddressLabel => 'Server address';

  @override
  String get serverAddressHelp =>
      'Paste the server\'s address. If it has a key in it, the key is stored encrypted and stays out of the chat.';

  @override
  String get serverChecking => 'Checking the server…';

  @override
  String serverSignInOn(String host) {
    return 'You\'ll sign in on $host.';
  }

  @override
  String get serverUseKey => 'Use a key instead';

  @override
  String get serverUseSignIn => 'Sign in instead';

  @override
  String serverSignInUnavailable(String name) {
    return '$name can\'t take a browser sign-in from this Casama server. Use a key.';
  }

  @override
  String get serverNoSignIn => 'This server works without signing in.';

  @override
  String get serverHeaderLabel => 'Header name (optional)';

  @override
  String get serverToolsTitle => 'Tools it can use';

  @override
  String get serverToolsHelp =>
      'Switch off any you don\'t want. Bots still ask before risky steps.';

  @override
  String addedInChatBy(String bot) {
    return 'Added in chat by $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name runs on your own computer. Open Casama on that computer and turn on Use this computer to add it.';
  }

  @override
  String get connectAppsTitle => 'Connect your apps';

  @override
  String get moreApps => 'More';

  @override
  String addAppTile(String app) {
    return 'Add $app to this bot';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app added to $bot';
  }

  @override
  String get connectAppsHint =>
      'Let me read and act in the tools you already use.';

  @override
  String connectAppTile(String app) {
    return 'Connect $app';
  }

  @override
  String get showComputer => 'Show computer';

  @override
  String get hideComputer => 'Hide computer';

  @override
  String get moreActions => 'More';

  @override
  String get noConversations => 'No conversations yet';

  @override
  String get untitledChat => 'New conversation';

  @override
  String get listening => 'Listening…';

  @override
  String get orLabel => 'or';

  @override
  String get notificationsPrimerBubble => 'Don\'t miss a thing!';

  @override
  String get notificationsPrimerTitle => 'Turn on notifications';

  @override
  String get notificationsPrimerBody =>
      'Your bots tell you when they need a decision from you, or when their work is ready.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome is blocking notifications for this site. Allow them from the lock in the address bar, then tap Turn on again.';

  @override
  String get notificationsTurnOn => 'Turn On';

  @override
  String get autoUpdates => 'Update Automatically';

  @override
  String get autoUpdatesHelp => 'Installs new versions when you quit.';

  @override
  String get upToDate => 'Casama Is Up to Date';

  @override
  String get noReleasesToCheck =>
      'No release has been published for this computer yet, so there\'s nothing to compare this version with.';

  @override
  String updateReady(String version) {
    return 'Casama $version is available';
  }

  @override
  String appVersion(String version) {
    return 'Version $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'What\'s New in Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Got It';

  @override
  String get whatsNewSubtitle => 'Here\'s what changed since your last update.';

  @override
  String get whatsNew010Calls =>
      'Call your bots and talk things through. They answer out loud, with captions.';

  @override
  String get whatsNew010Looks =>
      'Make Casama yours: themes, color schemes, fonts and wallpapers in Settings → Appearance, with more from the gallery.';

  @override
  String get whatsNew010AboutYou =>
      'Tell your bots about yourself once, in Settings → About you: what to call you and how you like replies.';

  @override
  String get whatsNew010SignIn =>
      'Sign in with a passkey, Apple, Google or a code from your email.';

  @override
  String get openAtLogin => 'Open at Login';

  @override
  String get openAtLoginHelp => 'Ready for the quick-ask shortcut.';

  @override
  String get signInTagline =>
      'Teammates that keep working after you close the app.';

  @override
  String get signInTagline2 => 'Meet your AI crew.';

  @override
  String get signInTagline3 =>
      'AI that doesn\'t just talk. It gets things done.';

  @override
  String get signInTagline4 => 'Capable teammates that ask before they act.';

  @override
  String get signInTagline5 => 'Hand it off. Come back to it done.';

  @override
  String get noBotsHelp =>
      'A bot is a teammate with its own computer. Create one to start chatting.';

  @override
  String get newBotSubtitle => 'A teammate with its own computer and memory.';

  @override
  String get appearance => 'Appearance';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI or another compatible provider';

  @override
  String get signOutConfirm =>
      'You can sign back in any time; your bots keep working.';

  @override
  String get roleOwner => 'Owner';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get roleMember => 'Member';

  @override
  String get themeLight => 'Light';

  @override
  String get themeSystem => 'System';

  @override
  String get themeDark => 'Dark';

  @override
  String get createWorkspaceBody =>
      'A workspace holds your bots, their computers and the people you work with.';

  @override
  String get workspaceNameHint => 'My team';

  @override
  String get orJoinWithCode => 'or join with an invite code';

  @override
  String get getOpenRouterKey => 'Get an OpenRouter Key';

  @override
  String get createFirstBotBody =>
      'Give it a name and a model. You can change both later.';

  @override
  String stepOf(int step, int total) {
    return 'Step $step of $total';
  }

  @override
  String get providerHintOpenRouter =>
      'recommended: chat, images, video, voice';

  @override
  String get providerHintGoogle => 'live calls only';

  @override
  String get providerHintCompatible => 'Any OpenAI-compatible API';

  @override
  String get providerHintSearch => 'web search';

  @override
  String get noRoutinesHelp =>
      'A routine is work a bot does later on its own: once at a time you pick, on a schedule, or when a webhook arrives.';

  @override
  String get routineOnce => 'Once';

  @override
  String lastRun(String when) {
    return 'Last: $when';
  }

  @override
  String get routineOff => 'Off';

  @override
  String get routineEnds => 'Ends';

  @override
  String get routineEndsNever => 'Never';

  @override
  String get routineEndsOnDate => 'On a date';

  @override
  String get routineEndsAfterRuns => 'After some runs';

  @override
  String get routineEndDate => 'Last day';

  @override
  String get routineRunCountLabel => 'Runs';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n runs',
      one: '1 run',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Ends $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n runs left',
      one: '1 run left',
      zero: 'No runs left',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'When It Ends';

  @override
  String get routineEndTitle => 'When it ends';

  @override
  String get routineEndSubtitle =>
      'It switches itself off then. A new number of runs counts from now.';

  @override
  String deleteRoutineTitle(String name) {
    return 'Delete “$name”?';
  }

  @override
  String get deleteRoutineBody =>
      'It won\'t run again. Results it already posted stay in their conversation.';

  @override
  String get triggerOnce => 'Once';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'In $nString min';
  }

  @override
  String inHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'In $nString hours',
      one: 'In 1 hour',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Tomorrow $time';
  }

  @override
  String get integrationNeedsName => 'Give it a name with at least one letter.';

  @override
  String integrationNeedsField(String field) {
    return 'Fill in $field to save.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Saved as $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Use a full address starting with https://';

  @override
  String get openFile => 'Open';

  @override
  String get saveFile => 'Save';

  @override
  String get shareFile => 'Share';

  @override
  String savedFile(String name) {
    return 'Saved $name';
  }

  @override
  String noAppToOpen(String name) {
    return 'No app on this device opens $name. Save it instead.';
  }

  @override
  String get previewUnavailable =>
      'No preview for this kind of file. Open or save it to view it.';

  @override
  String get openInSystemPlayer => 'Open in your video player';

  @override
  String get playMedia => 'Play';

  @override
  String get fullScreen => 'Full screen';

  @override
  String get exitFullScreen => 'Exit full screen';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get convertingToPdf => 'Getting a preview ready…';

  @override
  String tableFirstRows(int count) {
    return 'Showing the first $count rows';
  }

  @override
  String get imageCouldNotLoad => 'Couldn\'t load this picture';

  @override
  String get mediaKindImage => 'Image';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Audio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Open File';

  @override
  String get attach => 'Attach';

  @override
  String get attachFiles => 'Files';

  @override
  String get attachPhotos => 'Photo library';

  @override
  String get attachCamera => 'Take photo';

  @override
  String get attachScan => 'Scan document';

  @override
  String get scanFailed => 'Couldn\'t scan the document. Try again.';

  @override
  String get dropToAttach => 'Drop files to attach';

  @override
  String uploadFailed(String name) {
    return 'Couldn\'t upload $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'Couldn\'t attach $name: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'Couldn\'t attach $name';
  }

  @override
  String get sendWithoutIt => 'Send without it';

  @override
  String get sendWithoutThem => 'Send without them';

  @override
  String get removeAttachment => 'Remove';

  @override
  String get editPhoto => 'Edit photo';

  @override
  String get retryUpload => 'Try again';

  @override
  String get uploadingAttachments => 'Uploading…';

  @override
  String get notSent => 'Not sent';

  @override
  String get deleteChat => 'Delete Chat';

  @override
  String get deleteChatTitle => 'Delete this chat?';

  @override
  String deleteChatBody(String bot) {
    return 'Its messages are deleted for everyone who can see it. What $bot made here stays in the Library, usage records stay, and anything it remembered from it stays in its memory.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Also delete the $count things made here',
      one: 'Also delete the 1 thing made here',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp => 'Off: they stay in the Library.';

  @override
  String get chatDeleted => 'Chat deleted';

  @override
  String get deleteAllChats => 'Delete All Chats';

  @override
  String get deleteAllChatsRow =>
      'Start over with a clean history. Memories stay.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Delete all chats with $bot?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Every chat with $bot that you can delete goes, with its messages, photos and files. Group chats stay. Usage records stay, and what $bot remembered stays in its memory.';
  }

  @override
  String chatsDeleted(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString chats deleted.',
      one: '1 chat deleted.',
      zero: 'No chats to delete.',
    );
    return '$_temp0';
  }

  @override
  String chatsKeptBusy(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$nString chats were kept because the bot is still working in them.',
      one: '1 chat was kept because the bot is still working in it.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n bots are in this chat. Each keeps its own memory and settings.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention => 'Type @ and a name to ask one bot directly.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone asks $lead to plan the work and hand a part to each bot.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Without a mention, the bot that spoke last answers ($lead at first).';
  }

  @override
  String get messageNotSent =>
      'Your files didn\'t upload, so the message wasn\'t sent. It\'s back in the box.';

  @override
  String get chatSendsWhenDone => 'Sends when this reply is done';

  @override
  String get noComputerForFiles => 'This bot has no computer to keep files on.';

  @override
  String fileTooLarge(String name) {
    return '$name is over 25 MB, too large to attach.';
  }

  @override
  String get secretsHelp =>
      'Bots put a secret in requests by its name. It\'s only sent to the hosts you allow and the model never sees it.';

  @override
  String deleteSecretTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String get deleteSecretBody =>
      'Bots that use it will stop being able to reach that service.';

  @override
  String get hide => 'Hide';

  @override
  String get show => 'Show';

  @override
  String get deleteMemoryTitle => 'Delete this memory?';

  @override
  String get noMemoriesHelp =>
      'As you chat, the bot keeps what matters: facts, preferences and summaries of past work.';

  @override
  String get memoryHelp =>
      'Pinned memories are always in the bot\'s context. Edit anything that\'s wrong; deleted memories are gone for good.';

  @override
  String get memoryFact => 'Fact';

  @override
  String get memoryPreference => 'Preference';

  @override
  String get memorySummary => 'Summary';

  @override
  String get memoryEpisode => 'Episode';

  @override
  String get pinned => 'Pinned';

  @override
  String get editMemory => 'Edit Memory';

  @override
  String get editMemoryHelp =>
      'The bot uses this the next time it\'s relevant.';

  @override
  String get modelKeysIntro =>
      'Bots think with your own model provider keys. Keys are stored encrypted and never shown again.';

  @override
  String get casamaCloudKeyHint => 'Paid from your credits';

  @override
  String get casamaCloudIncluded => 'Included';

  @override
  String get casamaCloudModelLocked => 'Casama chooses this model.';

  @override
  String get serverVoiceSetUp =>
      'This server provides voice, so there\'s no key to add. A workspace\'s own key is used first.';

  @override
  String modelKeysFor(String workspace) {
    return 'Keys belong to one workspace. These are for $workspace.';
  }

  @override
  String get yourKeys => 'Your Keys';

  @override
  String get keyWorking => 'Working';

  @override
  String get keyFailing => 'Failing';

  @override
  String get keyUntested => 'Not tested';

  @override
  String get skillsHelp =>
      'A skill is a set of instructions a bot loads when a task calls for it, like your house style for reports.';

  @override
  String get skillsForAllBots => 'All Bots';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Only for $bot';
  }

  @override
  String get skillsRemovedBot => 'A removed bot';

  @override
  String deleteSkillTitle(String name) {
    return 'Delete the skill “$name”?';
  }

  @override
  String get editSkill => 'Edit skill';

  @override
  String get deleteSkill => 'Delete Skill';

  @override
  String get skillDescriptionHelp =>
      'Bots read this to decide when the skill applies.';

  @override
  String get skillBodyHint => '# Steps\n1. …';

  @override
  String get computersHelp =>
      'Each bot works on a computer: the team computer everyone shares, or a private one. Files stay on it between chats.';

  @override
  String get computersEmptyTitle => 'No computers yet';

  @override
  String get thisDevice => 'This device';

  @override
  String get personalComputerConnected => 'Connected';

  @override
  String get personalComputerOffline => 'Offline';

  @override
  String computerCpus(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n CPUs',
      one: '1 CPU',
    );
    return '$_temp0';
  }

  @override
  String computerMemory(Object size) {
    return '$size RAM';
  }

  @override
  String computerDisk(Object size) {
    return '$size disk';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Last used $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Last seen $when';
  }

  @override
  String get computerSaved => 'Saved';

  @override
  String get computerSavedHelp => 'Its files are kept while it\'s stopped';

  @override
  String computerCanUse(Object list) {
    return 'Bots can use: $list';
  }

  @override
  String get computerCanUseNothing => 'Bots can\'t use it yet';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Files';

  @override
  String get computerCapBrowser => 'Browser';

  @override
  String get computerCapDesktop => 'Screen';

  @override
  String get computerCapMcp => 'Local tools';

  @override
  String get computerCapMessages => 'Messages';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name is offline. Open Casama on it and turn on \"Use this computer for bots\". Your own computer never uses your plan\'s computer hours.';
  }

  @override
  String get yourComputerOffline => 'Your computer is offline';

  @override
  String get howToFix => 'How to fix';

  @override
  String get computerHoursUsedTitle => 'Computer hours used up';

  @override
  String get personalScreenNote =>
      'This is your own computer, so you see a new screenshot every few seconds instead of a live view.';

  @override
  String get renameComputer => 'Rename Computer';

  @override
  String deleteComputerTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String get privacyIntro =>
      'Your chats, memories and files belong to you. Export them any time, or delete your account.';

  @override
  String get yourData => 'Your Data';

  @override
  String get shareAnalytics => 'Share Usage Data';

  @override
  String get shareAnalyticsHelp =>
      'Usage and crash reports. Never your messages or files.';

  @override
  String get measureAds => 'Help Measure Our Ads';

  @override
  String get measureAdsHelp =>
      'Lets Casama tell Meta when someone who saw our ad joins or subscribes. Casama never shows ads.';

  @override
  String get measureAdsNeedsUsageData =>
      'Turn on Share Usage Data to use this.';

  @override
  String get trackingTile => 'Allow Tracking';

  @override
  String get trackingAllowed =>
      'Allowed. Meta\'s SDK runs on this device and Casama can tell Meta when you join or subscribe after seeing our ad. Change it in the Settings app.';

  @override
  String get trackingNotAllowed =>
      'Not allowed. Nothing from this device goes to Meta. Change it in the Settings app.';

  @override
  String get trackingNotAsked =>
      'Casama hasn\'t asked yet. Until you allow it, nothing from this device goes to Meta.';

  @override
  String get trackingOpenSettings => 'Open Settings';

  @override
  String get workspaceAnalytics => 'Usage Data for This Workspace';

  @override
  String get workspaceAnalyticsHelp =>
      'Usage data for this workspace. Crash reports stay on.';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get quotasHelp => 'Leave a field empty for no limit.';

  @override
  String get serviceOff => 'Off';

  @override
  String get serviceDown => 'Down';

  @override
  String get serviceOk => 'OK';

  @override
  String get sendInvite => 'Send Invite';

  @override
  String get thinking0 => 'Model';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get autonomyAskAlwaysHelp =>
      'Checks with you before every action that changes something.';

  @override
  String get autonomyAskRiskyHelp =>
      'Works on its own, but asks before anything risky, like deleting files or spending money.';

  @override
  String get autonomyAutonomousHelp =>
      'Acts without asking. Best for routines you trust.';

  @override
  String get usageSubtitle => 'Model spend this month';

  @override
  String get skillsRowHelp => 'Instructions bots load when a task needs them';

  @override
  String get integrationsRowHelp => 'MCP servers and connected apps';

  @override
  String get secretsRowHelp =>
      'Tokens and passwords, sent only where you allow';

  @override
  String get computersRowHelp => 'The team computer and private ones';

  @override
  String get companionRowHelp => 'Let bots use this device\'s apps and files';

  @override
  String get privacyRowHelp => 'Export your data or delete your account';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'No integrations yet';

  @override
  String get integrationsHelp =>
      'Integrations give bots more tools: an MCP server, an OpenAPI source, Composio or Pipedream. Each tool is named after its integration.';

  @override
  String get botIntegrationsHelp =>
      'Turn on the integrations this bot may use. Its tools show up the next time it runs.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get noRunsHelp =>
      'Each time this bot works, from a chat, a routine or a webhook, the run shows up here with what it did and what it cost.';

  @override
  String get runCompleted => 'Done';

  @override
  String get runWaiting => 'Waiting';

  @override
  String get runWorking => 'Working';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Routine';

  @override
  String get noEventsForFilter => 'Nothing of this kind in this run.';

  @override
  String get runStatusFailed => 'Failed';

  @override
  String get runStatusStopped => 'Stopped';

  @override
  String get quickAskIntro =>
      'Send a quick request. It starts a new chat with the bot you pick.';

  @override
  String quickAskIntroBot(String name) {
    return 'Send a quick request. It starts a new chat with $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return 'What should $bot do?';
  }

  @override
  String get stateProvisioning => 'Setting up';

  @override
  String get stateStarting => 'Starting';

  @override
  String get computerRestoringFiles => 'Restoring files…';

  @override
  String get stateRunning => 'Running';

  @override
  String get stateIdle => 'Idle';

  @override
  String get stateSleeping => 'Asleep';

  @override
  String get stateStopped => 'Stopped';

  @override
  String get stateError => 'Error';

  @override
  String get terminalHelp =>
      'A shell on this computer. Bots use the same one, so you can see and fix what they did.';

  @override
  String get up => 'Up';

  @override
  String get emptyFolderHelp =>
      'Files your bots make, and files you upload, show up here.';

  @override
  String deleteFileTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String get botComputerAuto => 'Automatic';

  @override
  String get botComputerHelp =>
      'The bot\'s own computer: where it runs commands, browses and keeps its files.';

  @override
  String get billingOffTitle => 'No billing here';

  @override
  String revokeKeyTitle(String name) {
    return 'Revoke the key for $name?';
  }

  @override
  String get revokeKeyBody =>
      'That server stops using cloud computers and credits right away.';

  @override
  String get handBackHelp =>
      'The bot picks up where you left off. Tell it what you did, if it helps.';

  @override
  String get serverHelp =>
      'Use your own Casama server. Enter the address you or your admin set up.';

  @override
  String get ssoHelp =>
      'Enter your work email and we\'ll send you to your company\'s sign-in page.';

  @override
  String get colorScheme => 'Color Scheme';

  @override
  String get searchThemes => 'Search schemes';

  @override
  String get noThemesFound => 'No schemes match.';

  @override
  String get noAppsMatch =>
      'No apps match. You can add your own server under Advanced.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '1 app',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'All';

  @override
  String get familyPurple => 'Purple';

  @override
  String get familyBlue => 'Blue';

  @override
  String get familyTeal => 'Teal';

  @override
  String get familyGreen => 'Green';

  @override
  String get familyWarm => 'Warm';

  @override
  String get familyRed => 'Red & pink';

  @override
  String get familyNeutral => 'Neutral';

  @override
  String get background => 'Background';

  @override
  String get backgroundPattern => 'Pattern';

  @override
  String get backgroundColors => 'Colors';

  @override
  String get backgroundThemeColors => 'Theme';

  @override
  String get patternStrength => 'Pattern Strength';

  @override
  String get wallpaperEverywhere => 'Show on every screen';

  @override
  String get wallpaperEverywhereHelp =>
      'Turn off to keep it behind chats only.';

  @override
  String get resetBackground => 'Reset to Default';

  @override
  String get copyMessage => 'Copy';

  @override
  String get selectText => 'Select text';

  @override
  String get shareMessage => 'Share';

  @override
  String get messageCopied => 'Copied';

  @override
  String get botUiBroken => 'This part of the reply couldn\'t be shown.';

  @override
  String get botUiSent => 'Sent';

  @override
  String get botUiConnected => 'Connected';

  @override
  String get draftNewEmail => 'New email';

  @override
  String get draftNewMessage => 'New message';

  @override
  String get draftNewPost => 'New post';

  @override
  String get draftReadyToSend => 'Ready to send';

  @override
  String get draftReadyToPost => 'Ready to post';

  @override
  String get draftEdited => 'Edited';

  @override
  String get draftSendEmail => 'Send email';

  @override
  String get draftSend => 'Send';

  @override
  String get draftPost => 'Post';

  @override
  String get draftDiscard => 'Discard';

  @override
  String get draftEdit => 'Edit';

  @override
  String get draftDoneEditing => 'Done';

  @override
  String get draftFrom => 'From';

  @override
  String get draftTo => 'To';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Bcc';

  @override
  String get draftSubject => 'Subject';

  @override
  String get botCardNewEvent => 'New event';

  @override
  String get botCardEvent => 'Event';

  @override
  String get botCardReadyToAdd => 'Ready to add';

  @override
  String get botCardAddToCalendar => 'Add to calendar';

  @override
  String get botCardChange => 'Change';

  @override
  String get botCardSkip => 'Skip';

  @override
  String get botCardAllDay => 'All day';

  @override
  String botCardMore(int count) {
    return '+$count more';
  }

  @override
  String get botCardAgenda => 'Agenda';

  @override
  String get botCardMessages => 'Messages';

  @override
  String botCardUnread(int count) {
    return '$count unread';
  }

  @override
  String get botCardReply => 'Reply';

  @override
  String botCardReplyTo(String name) {
    return 'Reply to $name';
  }

  @override
  String get botCardTasks => 'Tasks';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done of $total done';
  }

  @override
  String get botCardSaveChanges => 'Save changes';

  @override
  String get botCardChoose => 'Choose';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Who do you mean?';

  @override
  String get botCardNoneOfThese => 'None of these';

  @override
  String get botCardReminder => 'Reminder';

  @override
  String get botCardRoutine => 'Routine';

  @override
  String get botCardWatcher => 'Watching';

  @override
  String get botCardScheduled => 'Set';

  @override
  String botCardNext(String when) {
    return 'Next: $when';
  }

  @override
  String get botCardCancelIt => 'Cancel it';

  @override
  String get botIcon => 'Icon';

  @override
  String get botIconInitials => 'Initials';

  @override
  String get errorDetailsTitle => 'What went wrong';

  @override
  String get exportLabel => 'Export';

  @override
  String get openTimeline => 'Open Run Timeline';

  @override
  String get details => 'Details';

  @override
  String get themes => 'Themes';

  @override
  String get myThemes => 'Your themes';

  @override
  String get saveTheme => 'Save Current Theme';

  @override
  String get themeName => 'Theme name';

  @override
  String get importTheme => 'Import a Theme';

  @override
  String get themeCode => 'Theme code';

  @override
  String get themeCodeHelp =>
      'Paste a code someone shared with you. It starts with casama-theme:';

  @override
  String get invalidThemeCode => 'That isn\'t a Casama theme code.';

  @override
  String themeImported(String name) {
    return 'Added $name to your themes';
  }

  @override
  String get themeCodeCopied =>
      'Theme code copied. Anyone can paste it into Appearance → Import a theme.';

  @override
  String get shareTheme => 'Share code';

  @override
  String deleteThemeTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String get fonts => 'Fonts';

  @override
  String get headingFont => 'Headings';

  @override
  String get bodyFont => 'Text';

  @override
  String get fontsHelp =>
      'Google Sans and Noto Serif come with the app and work offline. Other Google Fonts download the first time you pick them.';

  @override
  String get searchFonts => 'Search all Google Fonts';

  @override
  String get suggestedFonts => 'Suggested';

  @override
  String get allFonts => 'All Google Fonts';

  @override
  String get noFontsFound => 'No font with that name';

  @override
  String get resetFonts => 'Use the Defaults';

  @override
  String get fontSample => 'Your bots, working together with you.';

  @override
  String get backgroundPhoto => 'Photo';

  @override
  String get yourPhoto => 'Your Photo';

  @override
  String get browsePhotos => 'Browse photos';

  @override
  String get removePhoto => 'Remove Photo';

  @override
  String get photoBlur => 'Blur';

  @override
  String get photoDim => 'Dim';

  @override
  String photoBy(String name) {
    return 'Photo by $name on Unsplash';
  }

  @override
  String get searchPhotos => 'Search photos';

  @override
  String get photosUnavailable => 'Couldn\'t load photos.';

  @override
  String get noPhotos => 'No photos found';

  @override
  String get photoHelp =>
      'A photo goes under the doodles. Blur and dim keep text readable on top.';

  @override
  String get periodToday => 'Today';

  @override
  String get periodWeek => 'This week';

  @override
  String get periodYear => 'This year';

  @override
  String get totalSpend => 'Spend';

  @override
  String get tokensIn => 'Tokens In';

  @override
  String get tokensOut => 'Tokens Out';

  @override
  String get runsLabel => 'Runs';

  @override
  String get spendByDay => 'Spend by Day';

  @override
  String get byBot => 'By Bot';

  @override
  String get byModel => 'By Model';

  @override
  String get everythingMetered => 'Everything Metered';

  @override
  String get bySource => 'By Source';

  @override
  String get byPerson => 'By Person';

  @override
  String get usageAllBots => 'All bots';

  @override
  String get usageAllModels => 'All models';

  @override
  String get usageAllSources => 'All sources';

  @override
  String get usageEveryone => 'Everyone';

  @override
  String get usageJustMe => 'Just me';

  @override
  String get usageClearFilters => 'Clear';

  @override
  String get usageFilterBot => 'Filter by bot';

  @override
  String get usageFilterModel => 'Filter by model';

  @override
  String get usageFilterSource => 'Filter by source';

  @override
  String get usageFilterPerson => 'Filter by person';

  @override
  String get usageSourceChat => 'Chats';

  @override
  String get usageSourceChatApp => 'Chat apps';

  @override
  String get usageSourceRoutine => 'Routines';

  @override
  String get usageSourceApi => 'API and other agents';

  @override
  String get usageSourceOther => 'Other';

  @override
  String get usageNoPerson => 'Automatic';

  @override
  String get usageUnnamedPerson => 'Unnamed member';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n runs',
      one: '1 run',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Export CSV';

  @override
  String get exportJson => 'Export JSON';

  @override
  String get askBotAboutUsage => 'Ask a Bot About This';

  @override
  String get noUsageYet => 'No usage in this period yet.';

  @override
  String get otherModel => 'Computers and other';

  @override
  String get deletedBot => 'Not tied to a bot';

  @override
  String get usageHelp =>
      'Costs are estimates from token counts and published prices. Your model provider\'s bill is the final word.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Here is my Casama usage for $period. Help me understand where the money goes and how I could spend less. You can also check live numbers with your usage tool.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Model input';

  @override
  String get kindTokensOut => 'Model output';

  @override
  String get kindComputer => 'Cloud computer time';

  @override
  String get kindModels => 'AI models';

  @override
  String get creditsThisMonth => 'This month\'s credits';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent% used';
  }

  @override
  String creditsRunsLeft(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'About $nString more runs at your usual cost',
      one: 'About 1 more run at your usual cost',
      zero: 'Less than one more run at your usual cost',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'You\'re out of credits. Add more to keep your bots running.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 credit = $price. Your plan adds $amount every month; unused credits carry over for one more month.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 credit = $price. Credit packs from the App Store or Google Play never expire; credit packs bought on the web last 12 months.';
  }

  @override
  String get creditsDailyLabel => 'Today\'s limit';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used of $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'What your plan can spend each day on Casama\'s models, voice and apps, whatever credits are left.';

  @override
  String get creditsDailyReached =>
      'Today\'s limit is reached, so your bots are paused. Upgrade for a higher daily limit.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Resets in about $n hours.',
      one: 'Resets in about 1 hour.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Resets in less than an hour.';

  @override
  String get creditsHoursLabel => 'Computer hours';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used of $limit h';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Time your bots\' computers run this month. When they run out, chat keeps working; only the computer stops. Resets on $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'This month\'s computer hours are used, so your computer can\'t start. Chat still works. Resets on $date. Upgrade for more hours.';
  }

  @override
  String get kindStream => 'Live view';

  @override
  String get kindTts => 'Read aloud';

  @override
  String get computerMissingTitle => 'Computer not found';

  @override
  String get computerMissingHelp =>
      'It may have been removed, or the list is out of date. Refresh to check again.';

  @override
  String get computerMissingBotHelp =>
      'This bot\'s computer may have been removed, or the list is out of date. Refresh, or choose another computer for this bot.';

  @override
  String get computerChoose => 'Choose a Computer';

  @override
  String get personaWork => 'Work';

  @override
  String get personaResearch => 'Research';

  @override
  String get personaBuild => 'Build';

  @override
  String get personaCreate => 'Create';

  @override
  String get personaLife => 'Life';

  @override
  String get personaOther => 'Other';

  @override
  String get blankBotHelp =>
      'Start from scratch and write your own instructions.';

  @override
  String get browse => 'Browse';

  @override
  String get browseAllPersonas => 'Browse all';

  @override
  String get botIdentity => 'Name and icon';

  @override
  String get serviceKeys => 'Service keys';

  @override
  String get noServiceKeys => 'No service keys yet.';

  @override
  String get serviceKeysHelp => 'Your own search, maps or data keys';

  @override
  String get serviceKeysIntro =>
      'Casama runs the models, voice and images for you. Add a key here only to use your own search, maps or data service. Keys are stored encrypted and never shown again.';

  @override
  String get choosePersona => 'Choose a persona';

  @override
  String get choosePersonaHelp =>
      'Each one comes with instructions, a look, and sometimes skills and routines. You can change anything afterwards.';

  @override
  String get searchPersonas => 'Search personas';

  @override
  String get noPersonasFound => 'No persona matches that';

  @override
  String get previewPersona => 'Preview';

  @override
  String get personaInstructions => 'Instructions';

  @override
  String get personaTryAsking => 'Try asking';

  @override
  String usePersona(String name) {
    return 'Use $name';
  }

  @override
  String get loadPersona => 'Load a Persona';

  @override
  String get replaceInstructionsTitle => 'Replace the instructions?';

  @override
  String replaceInstructionsBody(String name) {
    return 'The bot\'s current instructions will be replaced with $name\'s. Skills and routines stay as they are.';
  }

  @override
  String get replace => 'Replace';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle => 'Give your bots the tools your team already uses.';

  @override
  String get connectedTab => 'Connected';

  @override
  String get browseTab => 'Browse';

  @override
  String get searchApps => 'Search apps';

  @override
  String get popularApps => 'Popular';

  @override
  String get allApps => 'All apps';

  @override
  String get appCatDeveloper => 'Developer';

  @override
  String get appCatProductivity => 'Productivity';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Payments';

  @override
  String get appCatDesign => 'Design';

  @override
  String get appCatSales => 'Sales & support';

  @override
  String get appCatData => 'Data & search';

  @override
  String get appCatAutomation => 'Automation';

  @override
  String get authOneClick => 'One click';

  @override
  String get authApiKey => 'API key';

  @override
  String get authNone => 'No sign-in';

  @override
  String get authAdminSetup => 'Needs setup';

  @override
  String get connectedBadge => 'Connected';

  @override
  String get whatBotsCanDo => 'What your bots can do';

  @override
  String continueWith(String app) {
    return 'Continue with $app';
  }

  @override
  String get signInTab => 'Sign in';

  @override
  String get connectNoSignIn => 'This app works without signing in.';

  @override
  String finishSignIn(String app) {
    return 'Finish signing in to $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app opened in your browser. Approve access there and this updates by itself.';
  }

  @override
  String get reopenSignIn => 'Open the Sign-in Page Again';

  @override
  String appConnected(String app) {
    return '$app is connected';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app is already connected in this workspace. Use that connection, or add another account.';
  }

  @override
  String get useConnection => 'Use It';

  @override
  String get addAnotherAccount => 'Add Another Account';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString tools are ready for your bots.',
      one: '1 tool is ready for your bots.',
      zero: 'Ready to use.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Which bots can use it?';

  @override
  String get whichBotsHelp => 'Bots still ask you before anything risky.';

  @override
  String get doneLabel => 'Done';

  @override
  String openApp(String app) {
    return 'Open $app';
  }

  @override
  String get pasteLabel => 'Paste';

  @override
  String get connectingLabel => 'Connecting…';

  @override
  String get connectFailedTitle => 'Couldn\'t connect';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Or connect $app through one of these. Sign in once, then ask your bot to use $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'The sign-in is stored encrypted and never shown again. Disconnect anytime.';

  @override
  String get composioHelp => 'Hundreds of apps, with sign-in handled for you.';

  @override
  String get pipedreamHelp => 'Thousands of apps through Pipedream Connect.';

  @override
  String get customServer => 'Custom Server';

  @override
  String get customServerHelp =>
      'Any MCP server or OpenAPI spec. For developers.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Used by $countString bots',
      one: 'Used by 1 bot',
      zero: 'Not given to any bot yet',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Ready';

  @override
  String get statusNeedsAttention => 'Needs attention';

  @override
  String get statusChecking => 'Checking';

  @override
  String get toolsHelp =>
      'Read-only tools run on their own. Tools that make changes ask first when a bot has read something untrusted, and ones marked “Always asks” wait for you every time.';

  @override
  String get botsWithAccess => 'Bots with Access';

  @override
  String get reconnect => 'Reconnect';

  @override
  String get disconnect => 'Disconnect';

  @override
  String disconnectTitle(String app) {
    return 'Disconnect $app?';
  }

  @override
  String get disconnectBody =>
      'Bots lose its tools right away, and the saved sign-in is deleted.';

  @override
  String get testConnection => 'Test Connection';

  @override
  String get signedInOAuth => 'Signed in with your account';

  @override
  String get signedInKey => 'Connected with an API key';

  @override
  String get signedInNone => 'No sign-in needed';

  @override
  String get noConnectionsTitle => 'Connect your first app';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail and more. Most take one click.';

  @override
  String get browseApps => 'Browse Apps';

  @override
  String providerSetupTitle(String provider) {
    return 'Connect $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider signs in to the apps for you, so you never handle their keys.';
  }

  @override
  String get getFreeKey => 'Get a free key';

  @override
  String connectedThroughHub(String provider) {
    return 'Through $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Apps Through $provider';
  }

  @override
  String get addAnApp => 'Add an app';

  @override
  String searchProviderApps(String provider) {
    return 'Search $provider apps';
  }

  @override
  String get accountConnected => 'Signed in';

  @override
  String get accountPending => 'Waiting for sign-in';

  @override
  String get accountError => 'Sign-in problem';

  @override
  String get providerReconnectHint =>
      'Sign in with Casama directly for lower app-call costs';

  @override
  String get noProviderAccounts => 'No apps yet. Add one and sign in to it.';

  @override
  String get projectId => 'Project ID';

  @override
  String get toolRiskLow => 'Read-only';

  @override
  String get toolRiskMedium => 'Makes changes';

  @override
  String get toolRiskHigh => 'Always asks';

  @override
  String get askWhichBot => 'Which bot should look at this?';

  @override
  String get computerWake => 'Wake up';

  @override
  String get computerAsleepTitle => 'The computer is asleep';

  @override
  String get computerAsleepFilesHelp =>
      'Wake it up to see and upload its files.';

  @override
  String get computerFilesTimedOut =>
      'The files took too long to load. Check that the computer is on, then try again.';

  @override
  String get computerGoingToSleep => 'Going to sleep';

  @override
  String get liveViewWakesHelp =>
      'This computer is asleep. Opening the live view wakes it up; it goes back to sleep after a while without use.';

  @override
  String get wakeAndWatch => 'Wake Up and Watch Live';

  @override
  String get chatGptPlan => 'ChatGPT plan';

  @override
  String get continueWithChatGpt => 'Continue with ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Run your bots on your ChatGPT plan instead of an API key. Their model calls count toward your plan\'s limits, and only you can use it.';

  @override
  String get chatGptDesktopOnly =>
      'To connect your ChatGPT plan, open the desktop app, or run \"casama credential chatgpt\" in the CLI.';

  @override
  String get chatGptWaiting =>
      'Finish signing in with ChatGPT in your browser…';

  @override
  String chatGptConnected(String account) {
    return 'Connected your ChatGPT plan ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'You signed in, but plan usage wasn\'t allowed. Reconnect and allow it, or add an API key.';

  @override
  String get orAddApiKey => 'Or add an API key';

  @override
  String get planOnlyYou => 'Only you can use it';

  @override
  String get planOtherMember => 'Another member\'s plan';

  @override
  String get planConnected => 'Connected';

  @override
  String get planUsageOff => 'Plan usage off';

  @override
  String get planNeedsReconnect => 'Sign in again';

  @override
  String get useNextModelAtLimit =>
      'Use the bot\'s next model at my plan limit';

  @override
  String get useNextModelAtLimitHelp =>
      'Off: a run stops when your ChatGPT limit is reached. On: it continues on the bot\'s next model, which may cost money.';

  @override
  String get manageUsage => 'Manage Usage';

  @override
  String get removeKey => 'Remove';

  @override
  String removeKeyConfirm(String label) {
    return 'Remove $label? Bots that use it stop working until you give them another key.';
  }

  @override
  String get removeKeyChatGptNote => 'Your ChatGPT sign-in is revoked too.';

  @override
  String modelFallbackNotice(String message) {
    return 'Switched to the next model: $message';
  }

  @override
  String get twoStepSignIn => 'Two-step sign-in';

  @override
  String get twoStepHelp =>
      'Ask for a code from an authenticator app whenever you sign in.';

  @override
  String get signInWithPasskey => 'Sign In with a Passkey';

  @override
  String get account => 'Account';

  @override
  String get accountRow => 'Email, password and signing out everywhere';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get newPassword => 'New password';

  @override
  String get newPasswordAgain => 'New password again';

  @override
  String get passwordsDontMatch => 'The passwords don\'t match';

  @override
  String get newPasswordTitle => 'Choose a new password';

  @override
  String get newPasswordBody =>
      'You\'re signed in. Pick a new password for signing in with your email.';

  @override
  String get savePassword => 'Save password';

  @override
  String get passwordSaved => 'Password saved.';

  @override
  String get passwordTitle => 'Password';

  @override
  String get passwordRow =>
      'Set or change the password for signing in with your email';

  @override
  String get passwordHelp =>
      'Use at least 6 characters. You can still sign in with Google, Apple, a passkey or an email link.';

  @override
  String passwordCodeSent(String email) {
    return 'To keep your account safe, enter the code we just emailed to $email.';
  }

  @override
  String get changeEmailTitle => 'Change Email';

  @override
  String get changeEmailHelp =>
      'We\'ll email a confirmation link to your current address and to the new one. The change happens once both are confirmed.';

  @override
  String get newEmail => 'New email';

  @override
  String get changeEmailSend => 'Send Confirmation';

  @override
  String get changeEmailRow => 'Change the email you sign in with';

  @override
  String changeEmailSent(String email) {
    return 'Check both inboxes. $email becomes your email once both links are confirmed.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Waiting for confirmation: $email';
  }

  @override
  String get signOutEverywhere => 'Sign Out Everywhere';

  @override
  String get signOutEverywhereHelp =>
      'Every phone, computer and browser, including this one';

  @override
  String get signOutEverywhereConfirm =>
      'Sign out on every device, including this one? Use this if you lost a device or think someone else is signed in.';

  @override
  String get passkeySuggestTitle => 'Sign in faster next time?';

  @override
  String get passkeySuggestBody =>
      'Add a passkey and sign in with Face ID, a fingerprint or your screen lock. No password or email needed.';

  @override
  String get passkeys => 'Passkeys';

  @override
  String get passkeysRow =>
      'Sign in with Face ID, a fingerprint or your screen lock';

  @override
  String get passkeysHelp =>
      'A passkey signs you in with Face ID, a fingerprint or your screen lock, with no password or email. Each phone, computer or password manager keeps its own.';

  @override
  String get passkeyAdd => 'Add a Passkey';

  @override
  String get passkeyAddAnother => 'Add Another Passkey';

  @override
  String get passkeyAdded => 'Passkey added. Next time, sign in with it.';

  @override
  String get passkeyRename => 'Rename';

  @override
  String get passkeyRenameTitle => 'Rename Passkey';

  @override
  String get passkeyNameLabel => 'Name';

  @override
  String get passkeyRemove => 'Remove';

  @override
  String passkeyRemoveConfirm(String name) {
    return 'Remove \"$name\"? You won\'t be able to sign in with it any more.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Added $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Last used $when';
  }

  @override
  String get twoStepSetUp => 'Set Up an Authenticator App';

  @override
  String get twoStepAddAnother => 'Add Another Authenticator';

  @override
  String get twoStepScan =>
      'Scan this code with an authenticator app (such as 1Password, Google Authenticator or Authy), or type in the setup key, then enter the 6-digit code it shows.';

  @override
  String get twoStepKey => 'Setup key';

  @override
  String get twoStepCode => '6-digit code';

  @override
  String get twoStepVerify => 'Verify';

  @override
  String get twoStepNowOn => 'Two-step sign-in is on.';

  @override
  String get twoStepAuthenticators => 'Authenticator Apps';

  @override
  String get twoStepRename => 'Rename';

  @override
  String get twoStepRenameTitle => 'Rename Authenticator';

  @override
  String get twoStepNameLabel => 'Name';

  @override
  String get twoStepNameHint => 'For example: Work phone';

  @override
  String get twoStepRemove => 'Remove';

  @override
  String get twoStepRemoveConfirm =>
      'Remove this authenticator app? If it\'s your only one, you\'ll sign in with just your password.';

  @override
  String get twoStepPromptTitle => 'Enter your code';

  @override
  String get twoStepPromptBody =>
      'Open your authenticator app and enter the 6-digit code to finish signing in.';

  @override
  String get twoStepPromptAccount => 'Signing in as';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'New password for';

  @override
  String get connectAiAppAccount => 'It gets access to';

  @override
  String joinAsAccount(String email, String server) {
    return 'You\'ll join as $email on $server.';
  }

  @override
  String get requireTwoStep => 'Require two-step sign-in for owners and admins';

  @override
  String get requireTwoStepHelp =>
      'Owners and admins must use it. Turn yours on first.';

  @override
  String get twoStepNeededForAdmin =>
      'This workspace requires two-step sign-in for owners and admins. Set it up, or sign in again with your code, to use admin settings.';

  @override
  String get adminAbuse => 'Abuse';

  @override
  String get adminCapacityTitle => 'Server capacity';

  @override
  String adminCapacityComputers(String used, String budget) {
    return 'Computers: $used of $budget';
  }

  @override
  String adminCapacityComputersNoBudget(String used) {
    return 'Computers: $used';
  }

  @override
  String adminCapacityFree(String free, String total) {
    return 'Free memory $free of $total';
  }

  @override
  String adminCapacityDisk(int percent) {
    return 'Disk $percent% full';
  }

  @override
  String adminCapacityLoad(String load, int cpus) {
    return 'Load $load on $cpus CPUs';
  }

  @override
  String get adminCapacityPeakChart => 'Computers\' daily peak, last 30 days';

  @override
  String adminCapacityFullIn(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Full in about $weeks weeks at this trend',
      one: 'Full in about a week at this trend',
    );
    return '$_temp0';
  }

  @override
  String get adminCapacityFullNow => 'Full now: order the bigger server';

  @override
  String get adminCapacityNoGrowth => 'Not filling up at the current trend';

  @override
  String get adminCapacityNoBudget =>
      'Set COMPUTER_HOST_MEMORY_GB on the server to measure computers against its room.';

  @override
  String get adminCapacityNoData =>
      'The first sample arrives within 5 minutes of the server starting.';

  @override
  String adminCapacityRefusals(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count computer starts refused in 30 days',
      one: '1 computer start refused in 30 days',
      zero: 'No computer starts refused in 30 days',
    );
    return '$_temp0';
  }

  @override
  String get adminCapacityAlarm70 => 'Alarm: 70% full';

  @override
  String get adminCapacityAlarm80 => 'Alarm: 80% full. Plan the upgrade';

  @override
  String get adminCapacityAlarm90 => 'Alarm: 90% full. Upgrade today';

  @override
  String get adminCapacityAlarm95 => 'Alarm: 95% full. Upgrade now';

  @override
  String get adminCapacityAlarmFull =>
      'Alarm: full. Computers are refused or memory is low. Upgrade now';

  @override
  String adminCapacityAlarmRepeats(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'A push every $minutes minutes until it drops back',
      one: 'A push every minute until it drops back',
    );
    return '$_temp0';
  }

  @override
  String get adminCapacityAlarmOnce => 'One push. It repeats from 80%';

  @override
  String adminCapacityAlarmSnoozed(String time) {
    return 'Snoozed until $time';
  }

  @override
  String get adminCapacitySnoozeHour => 'Snooze 1 hour';

  @override
  String get adminCapacityUpgrading => 'I\'m upgrading';

  @override
  String adminCapacitySnoozedDone(String time) {
    return 'No alarm pushes until $time, unless it gets fuller';
  }

  @override
  String get adminNoAbuse => 'Nothing suspicious so far.';

  @override
  String get suspendWorkspace => 'Suspend';

  @override
  String get unsuspendWorkspace => 'Lift suspension';

  @override
  String get suspendReason => 'Reason';

  @override
  String get suspendWorkspaceHelp =>
      'Its computers stop and its bots stop running. Nothing is deleted, and you can lift it any time.';

  @override
  String workspaceSuspended(String reason) {
    return 'Suspended: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'This workspace is suspended, so bots can\'t run and computers can\'t start. Contact whoever runs this server.';

  @override
  String get abuseKind_mining_pool => 'Crypto mining blocked';

  @override
  String get abuseKind_blocked_port => 'Mail port blocked';

  @override
  String get abuseKind_egress_flood => 'Traffic flood';

  @override
  String get abuseKind_signup_blocked => 'Sign-up refused';

  @override
  String get abuseKind_suspended => 'Workspace suspended';

  @override
  String get abuseKind_unsuspended => 'Suspension lifted';

  @override
  String get kindLocalMcp => 'On a computer';

  @override
  String get capMcp => 'Local tools (MCP)';

  @override
  String get localMcpServers => 'Local Tools (MCP)';

  @override
  String get localMcpHelp =>
      'MCP servers on this computer or your network that your bots can use, such as T3 Code, Claude Code, Codex or design apps. Their tokens and sign-ins stay on this computer.';

  @override
  String get localMcpAdd => 'Add a Local MCP Server';

  @override
  String get localMcpEmpty => 'No local MCP servers yet.';

  @override
  String get localMcpName => 'Name';

  @override
  String get localMcpStdio => 'A Command';

  @override
  String get localMcpLoopback => 'An Address';

  @override
  String get localMcpCommand => 'Command';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Address';

  @override
  String get localMcpFolder => 'Working Folder (Optional)';

  @override
  String get localMcpEnv =>
      'Environment (one KEY=value per line, kept on this computer)';

  @override
  String get localMcpNeedsCapability =>
      'Turn on Local tools (MCP) above so bots can use these.';

  @override
  String get localMcpBadUrl =>
      'Use an http:// address on this computer or your own network, like http://127.0.0.1:3845/mcp, or an https:// address.';

  @override
  String get localMcpBadFolder =>
      'Pick a folder inside one of the shared folders.';

  @override
  String get codingAgents => 'Coding Agents';

  @override
  String get codingAgentsHelp =>
      'Bots can hand coding tasks to these agents on this computer. They use your own sign-ins and work in the folders you share.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Found $nString coding agents',
      one: 'Found 1 coding agent',
      zero: 'No coding agents found',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'This server isn\'t saved to the workspace yet. Remove it and add it again.';

  @override
  String get localMcpSignInKind => 'Sign-In';

  @override
  String get localMcpAuthNone => 'None';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Header';

  @override
  String get localMcpAuthOAuth => 'Browser';

  @override
  String get localMcpToken => 'Token (kept on this computer)';

  @override
  String get localMcpHeaderName => 'Header Name';

  @override
  String get localMcpHeaderValue => 'Header Value (kept on this computer)';

  @override
  String get localMcpOAuthHelp =>
      'Casama opens your browser so you can sign in to this server. The sign-in stays on this computer.';

  @override
  String get localMcpNetworkWarning =>
      'This server isn\'t on this computer. Bots that can use this computer can reach it.';

  @override
  String get localMcpSignIn => 'Sign In';

  @override
  String get localMcpNeedsSignIn => 'Needs sign-in';

  @override
  String get localMcpEdit => 'Edit Local MCP Server';

  @override
  String get localMcpImport => 'Add From Other Apps';

  @override
  String get localMcpImportHelp =>
      'MCP servers already set up in T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex or Windsurf on this computer.';

  @override
  String get localMcpImportNone =>
      'No MCP servers found in other apps on this computer.';

  @override
  String get localMcpImportAdded => 'Already added';

  @override
  String get localMcpImportRemote =>
      'On the internet, so usually added under Connections. Add it here only if just this computer can reach it.';

  @override
  String get mcpQuestionDecline => 'Decline';

  @override
  String get mcpQuestionSend => 'Send';

  @override
  String get cardMcpQuestion => 'Question';

  @override
  String get cardMcpSignIn => 'Sign-in';

  @override
  String get mcpSignInHereHelp => 'Sign in so your bots can use it again.';

  @override
  String localMcpSignedIn(String name) {
    return 'Signed in to $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'From $source';
  }

  @override
  String localMcpImportAddCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Add $nString Servers',
      one: 'Add 1 Server',
      zero: 'Add',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (kept on this computer)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name needs you to sign in';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Open Casama on $device and sign in there.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Open Casama on the computer where this tool runs and sign in there.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection asks';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return 'Answered $connection';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Declined $connection\'s question';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return '$connection\'s question closed';
  }

  @override
  String get codingAgentsNone =>
      'No coding agents found. Install Claude Code, Codex or Cursor\'s command-line agent to hand them coding tasks.';

  @override
  String get codingAgentsNeedShell =>
      'Coding agents run as commands, so they need Run commands turned on.';

  @override
  String get allowCommands => 'Turn On';

  @override
  String get codingAgentAllow => 'Allow';

  @override
  String get codingAgentAllowed => 'Allowed';

  @override
  String get codingAgentsAllowHelp =>
      'An agent with Allow next to it hasn\'t run on this computer yet. Allow it once and bots can hand it tasks.';

  @override
  String get ownAgentsAdd => 'Add Your Own';

  @override
  String get ownAgentYours => 'Yours';

  @override
  String get ownAgentNotFound => 'Not found on this computer';

  @override
  String get ownAgentsHelp =>
      'Your own agents run only on this computer, in chats that act for you. Nobody else in the workspace can see or change them.';

  @override
  String get ownAgentFormTitle => 'Add Your Own Agent';

  @override
  String get ownAgentEditTitle => 'Edit Your Agent';

  @override
  String get ownAgentName => 'Name';

  @override
  String get ownAgentBin => 'Command Name';

  @override
  String get ownAgentCommand => 'Command';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Put $task where the task goes; Casama quotes it. Every command in it starts with the command name. You can also use $folder, and $result_file when the agent writes its answer to a file.';
  }

  @override
  String get ownAgentResult => 'Reading the Answer';

  @override
  String get ownAgentResultTail => 'The end of its output';

  @override
  String get ownAgentResultJson => 'A JSON line with a result field';

  @override
  String get ownAgentResultStream => 'A stream of JSON lines';

  @override
  String get ownAgentResultField => 'A JSON field';

  @override
  String get ownAgentResultFile => 'Written to a file';

  @override
  String get ownAgentResultFieldName => 'Field Name';

  @override
  String get ownAgentTimeLimit => 'Time Limit (Minutes)';

  @override
  String get ownAgentTest => 'Test';

  @override
  String get ownAgentTestHelp =>
      'Test asks it to reply with just the word pong on this computer and shows what it printed.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'It answered: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'It didn\'t answer as expected (exit $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'It didn\'t finish in time.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Fill in a name, a command name and a command with $task.';
  }

  @override
  String get board => 'Board';

  @override
  String get newTicket => 'New ticket';

  @override
  String get newTicketSubtitle =>
      'A task for one of your bots, tracked on the board.';

  @override
  String get allProjects => 'All projects';

  @override
  String get manageProjects => 'Manage projects';

  @override
  String get filterByProject => 'Filter by project';

  @override
  String get moveTo => 'Move to';

  @override
  String get noMatchingTickets => 'No matching tickets';

  @override
  String get noMatchingTicketsHelp => 'No tickets match these filters.';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get ticketTitle => 'Title';

  @override
  String get ticketDetails => 'Details';

  @override
  String get taskInReview => 'In review';

  @override
  String get priority => 'Priority';

  @override
  String get priorityUrgent => 'Urgent';

  @override
  String get priorityHigh => 'High';

  @override
  String get priorityMedium => 'Medium';

  @override
  String get priorityLow => 'Low';

  @override
  String get priorityNone => 'No priority';

  @override
  String get filterAll => 'All';

  @override
  String get filterMine => 'Mine';

  @override
  String get filterBots => 'Bots';

  @override
  String get assignee => 'Assigned to';

  @override
  String get unassigned => 'Unassigned';

  @override
  String get assignToMe => 'Me';

  @override
  String get reviewRequired => 'Needs Review';

  @override
  String get reviewRequiredHelp =>
      'The bot finishes in review instead of done.';

  @override
  String get comments => 'Comments';

  @override
  String get addComment => 'Add a comment';

  @override
  String get sendComment => 'Send';

  @override
  String get openThread => 'Open the Bot\'s Thread';

  @override
  String get deleteTicket => 'Delete Ticket';

  @override
  String get ticketResult => 'Result';

  @override
  String get noCommentsYet =>
      'No comments yet. Leave a note for the bot or your team.';

  @override
  String get noTickets => 'Give your bots something to do';

  @override
  String get noTicketsHelp =>
      'Hand off one piece of work, or a whole goal. You can watch it move from here.';

  @override
  String get tasksStartTicket => 'Add a ticket';

  @override
  String get tasksStartTicketHelp =>
      'One piece of work. Assign it to a bot and it starts.';

  @override
  String get tasksStartProject => 'Start a project';

  @override
  String get tasksStartProjectHelp =>
      'A bigger goal. A bot plans it as tickets and waits for your OK.';

  @override
  String get tasksExamples => 'Or start from one of these';

  @override
  String get tasksExampleResearch => 'Research my top three competitors';

  @override
  String get tasksExampleDraft => 'Draft a launch announcement';

  @override
  String get tasksExampleTidy => 'Tidy up my files';

  @override
  String get ticketStatus => 'Status';

  @override
  String get spaces => 'Workspaces';

  @override
  String get newWorkspace => 'New Workspace';

  @override
  String get newWorkspaceSubtitle =>
      'A separate home for a team, with its own bots, chats and people.';

  @override
  String get joinWorkspaceHelp => 'Paste the invite link someone sent you.';

  @override
  String get inviteLinkField => 'Invite link';

  @override
  String get workspaceIcon => 'Icon';

  @override
  String get workspaceColor => 'Color';

  @override
  String get workspaceSettings => 'Workspace settings';

  @override
  String get workspaceSettingsHelp => 'Name, icon, color and invite links';

  @override
  String get inviteLinks => 'Invite links';

  @override
  String get inviteLinksHelp =>
      'Anyone with a link can join after signing in, until it expires, runs out of uses or you revoke it.';

  @override
  String get createInviteLink => 'Create a Link';

  @override
  String get linkExpires => 'Expires';

  @override
  String get linkNever => 'Never';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In $daysString days',
      one: 'In 1 day',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Uses';

  @override
  String get linkUnlimited => 'Unlimited';

  @override
  String linkUses(String uses) {
    return '$uses used';
  }

  @override
  String get linkRevoked => 'Revoked';

  @override
  String get revokeLink => 'Revoke';

  @override
  String get linkCopied => 'Invite link copied.';

  @override
  String get inviteRole => 'Role';

  @override
  String get shareLinkLabel => 'Share';

  @override
  String get botFolder => 'Folder';

  @override
  String get noFolder => 'No folder';

  @override
  String get newFolder => 'New folder…';

  @override
  String get folderName => 'Folder name';

  @override
  String get archiveBot => 'Archive Bot';

  @override
  String archiveBotTitle(String name) {
    return 'Archive $name?';
  }

  @override
  String get archiveBotBody =>
      'It leaves the sidebar and stops running. Its chats and history are kept, and you can bring it back from Archived bots.';

  @override
  String get archive => 'Archive';

  @override
  String get archivedBots => 'Archived bots';

  @override
  String get unarchive => 'Bring Back';

  @override
  String botArchived(String name) {
    return '$name archived.';
  }

  @override
  String get settingsHistory => 'Settings history';

  @override
  String get settingsHistoryHelp =>
      'Every change to this bot\'s settings, and who made it';

  @override
  String get noHistory => 'No changes yet.';

  @override
  String get restoreSettings => 'Restore These Settings';

  @override
  String restoreSettingsBody(String fields) {
    return 'Put back $fields as they were before this change? The current settings stay in the history.';
  }

  @override
  String changedByBot(String name) {
    return 'Changed by $name';
  }

  @override
  String get changedByPerson => 'Changed by a person';

  @override
  String get changedBySystem => 'Changed by Casama';

  @override
  String get fieldName => 'name';

  @override
  String get fieldInstructions => 'instructions';

  @override
  String get fieldModel => 'model';

  @override
  String get fieldAutonomy => 'autonomy';

  @override
  String get fieldBudget => 'budget';

  @override
  String get fieldComputer => 'computer';

  @override
  String get fieldArchived => 'archived';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot needs a $service key';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Only for $hosts';
  }

  @override
  String get secretRequestHelp =>
      'Goes straight to the vault. The bot never sees it.';

  @override
  String secretSaved(String name) {
    return 'Saved $name';
  }

  @override
  String get secretDeclined => 'Declined';

  @override
  String secretWhat(String service) {
    return '$service key';
  }

  @override
  String totpWhat(String service) {
    return '$service sign-in code';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Handed back: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Shared your login for $host';
  }

  @override
  String get shareLogin => 'Share Login';

  @override
  String get shareLoginUsername => 'Email or username';

  @override
  String get shareLoginPassword => 'Password';

  @override
  String get shareLoginRemember => 'Remember for next time';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Only used on $host. $bot never sees your password.';
  }

  @override
  String get shareLoginSave => 'Save and Sign In';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot needs you to sign in to $host';
  }

  @override
  String get signInOnPage => 'Sign In on Page';

  @override
  String loginOnPageLine(String host) {
    return 'Signing in to $host on the page';
  }

  @override
  String get loginOnPageHelp => 'Sign in on the page, then tap Hand Back.';

  @override
  String get back => 'Back';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Not shared: your calendar',
      'reminders': 'Not shared: your reminders',
      'contacts': 'Not shared: your contacts',
      'places': 'Not shared: your places',
      'photos': 'Not shared: your photos',
      'health': 'Not shared: your health data',
      'notifications': 'Not shared: your notifications',
      'activity': 'Not shared: your computer activity',
      'browserTab': 'Not shared: your current browser tab',
      'browserHistory': 'Not shared: your browser history and bookmarks',
      'alarm': 'Not shared: your alarms',
      'home': 'Not shared: your Home accessories',
      'other': 'Not shared: your device data',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Decline';

  @override
  String get signInCode => 'Sign-in code';

  @override
  String get secretKindValue => 'Key or Password';

  @override
  String get totpSeedLabel =>
      'Setup key, otpauth:// link, or the code you see now';

  @override
  String get totpSeedHelp =>
      'A setup key from the site\'s two-step setup lets the bot make every later code (it never sees the key). Or type the code you see now: it goes straight to the bot.';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot needs a $service sign-in code';
  }

  @override
  String get search => 'Search';

  @override
  String get searchHint => 'Search chats, memories, skills, tickets and files';

  @override
  String get searchEmptyPrompt => 'Type at least 2 characters.';

  @override
  String searchNoResults(String query) {
    return 'Nothing found for “$query”.';
  }

  @override
  String get searchMessages => 'Messages';

  @override
  String get searchChats => 'Chats';

  @override
  String get searchTickets => 'Tickets';

  @override
  String get searchFiles => 'Files';

  @override
  String get searchFilesAsleep =>
      'Files on sleeping computers aren\'t searched. Start a computer to include its files.';

  @override
  String get searchJumpHint => 'Search or jump to…';

  @override
  String get searchRecent => 'Recent';

  @override
  String get searchClearRecent => 'Clear';

  @override
  String get searchRemoveRecent => 'Remove from recent searches';

  @override
  String get searchJumpBackIn => 'Jump back in';

  @override
  String get searchNeedsYou => 'Needs you';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n things are waiting for you',
      one: '1 thing is waiting for you',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Go to';

  @override
  String get searchTopHits => 'Top hits';

  @override
  String get searchScopeAll => 'All';

  @override
  String get searchMemories => 'Memories';

  @override
  String get searchKeepTyping =>
      'Keep typing to search messages, memories and files.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Ask $bot about “$query”';
  }

  @override
  String get searchAskBotHelp => 'Starts a new chat with this question';

  @override
  String get searchKeysHint => '↑ ↓ to move   ↵ to open   esc to close';

  @override
  String get searchClear => 'Clear search';

  @override
  String get installFor => 'Install for';

  @override
  String get wholeWorkspace => 'The whole workspace';

  @override
  String get skillCatalog => 'Skill catalog';

  @override
  String get searchSkills => 'Search skills';

  @override
  String get all => 'All';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString files',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Install';

  @override
  String skillInstalled(String name) {
    return 'Installed $name.';
  }

  @override
  String get noResults => 'No results.';

  @override
  String get importFromGitHub => 'Import from GitHub';

  @override
  String get importFromGitHubHelp =>
      'Paste a link to a folder with a SKILL.md. You\'ll see every file before anything is installed. Private repositories use a GITHUB_TOKEN secret allowed for api.github.com.';

  @override
  String get preview => 'Preview';

  @override
  String get skillScriptsNote =>
      'Scripts in a skill only ever run on a bot\'s computer, never on the server.';

  @override
  String get binaryFile => '(binary file)';

  @override
  String skillUpdate(String name) {
    return 'Update $name';
  }

  @override
  String get checkingForUpdates => 'Checking for updates…';

  @override
  String get skillUpToDate => 'Already up to date.';

  @override
  String get update => 'Update';

  @override
  String get filesAdded => 'Added';

  @override
  String get filesChanged => 'Changed';

  @override
  String get filesRemoved => 'Removed';

  @override
  String get fromCatalog => 'From the catalog';

  @override
  String get savedByBot => 'Saved by a bot';

  @override
  String get checkForUpdates => 'Check for updates';

  @override
  String get attachSkill => 'Attach a skill';

  @override
  String get rerunSetup => 'Run Setup Again';

  @override
  String get rerunSetupHelp =>
      'Answer the setup questions again and review a new proposal';

  @override
  String get trace => 'Trace';

  @override
  String get openTrace => 'Open Trace';

  @override
  String get editMessage => 'Edit';

  @override
  String get editMessageHelp =>
      'Sending reruns the conversation from here. The original version stays; switch with the arrows.';

  @override
  String get previousVersion => 'Previous version';

  @override
  String get nextVersion => 'Next version';

  @override
  String get quietHours => 'Quiet hours';

  @override
  String get quietHoursHelp =>
      'Notifications wait until quiet hours end; your inbox still fills. Approvals for a chat you\'re in still come through.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start to $end';
  }

  @override
  String get off => 'Off';

  @override
  String get botNotifications => 'Notifications from this bot';

  @override
  String get botNotificationsHelp =>
      'Whether this bot follows your quiet hours';

  @override
  String get botMayCall => 'Can call me';

  @override
  String get botMayCallHelp =>
      'This bot can phone you when something is worth a call. Off: it sends a notification instead.';

  @override
  String get quietDefault => 'Follow my quiet hours';

  @override
  String get quietAlways => 'Always notify me';

  @override
  String get quietCustom => 'Its own quiet hours';

  @override
  String get from => 'From';

  @override
  String get until => 'Until';

  @override
  String get shareAsTemplate => 'Share as Template';

  @override
  String get shareAsTemplateRow =>
      'A file or link with its instructions, skills and routines';

  @override
  String get shareAsTemplateHelp =>
      'Includes instructions, skills, routines and the services it uses. Never keys or secrets.';

  @override
  String get copyLink => 'Copy link';

  @override
  String get includeMemories => 'Include Memories';

  @override
  String get includeMemoriesHelp =>
      'What it has learned about you. Share with care.';

  @override
  String get saveAsFile => 'Save as File';

  @override
  String get notABotTemplate => 'That file isn\'t a Casama bot template.';

  @override
  String get importBot => 'Import a bot';

  @override
  String botImported(String name) {
    return '$name is ready.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name is ready. Connect $services in Integrations so it can use them.';
  }

  @override
  String get whatComesWithIt => 'What Comes with It';

  @override
  String get connectAfterImport => 'Connect after importing';

  @override
  String get importRoutines => 'Schedule Its Routines';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keep its $countString memories',
      one: 'Keep its 1 memory',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Starting the routine…';

  @override
  String get offlineSaved => 'Offline. Showing saved messages.';

  @override
  String get loadEarlierMessages => 'Earlier Messages';

  @override
  String get chatLoadFailedTitle => 'This chat didn\'t load';

  @override
  String get chatLoadFailedBody => 'Check your connection, then try again.';

  @override
  String get projects => 'Projects';

  @override
  String get newProject => 'New project';

  @override
  String get noProjects => 'No projects yet';

  @override
  String get projectsHelp =>
      'A project keeps one piece of work together: its chat, plan, to-dos, files and everything made for it. Work on it with a bot, or let the bot plan it and work on it by itself.';

  @override
  String get newProjectHelp =>
      'Keeps one piece of work together: its chat, plan, to-dos, files and everything made for it.';

  @override
  String get startPlanning => 'Start Planning';

  @override
  String get projectTitle => 'Title';

  @override
  String get projectGoal => 'Goal';

  @override
  String get projectDoneWhen => 'Done when';

  @override
  String get projectLead => 'Lead bot';

  @override
  String get projectBudget => 'Budget';

  @override
  String get projectGoalHint =>
      'What should exist at the end? A landing page live on my domain…';

  @override
  String get projectDoneHint => 'Optional. How you\'ll know it\'s finished';

  @override
  String get projectBudgetHint => 'Optional. Work pauses when it\'s spent';

  @override
  String get projectThread => 'Project chat';

  @override
  String get approvePlan => 'Approve the Plan';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get milestones => 'Milestones';

  @override
  String get needsSignoff => 'needs your sign-off';

  @override
  String get signOff => 'Sign Off';

  @override
  String get projectPlan => 'Plan';

  @override
  String get tickets => 'Tickets';

  @override
  String get projectTimeline => 'Timeline';

  @override
  String get projectPlanning => 'Planning';

  @override
  String get projectActive => 'Active';

  @override
  String get projectPaused => 'Paused';

  @override
  String get projectBlocked => 'Blocked';

  @override
  String get projectDone => 'Done';

  @override
  String get projectCancelled => 'Cancelled';

  @override
  String get projectName => 'Name';

  @override
  String get projectNameHint => 'Space Dodger, Spring newsletter…';

  @override
  String get createProject => 'Create Project';

  @override
  String projectWorksAlone(String bot) {
    return 'Let $bot work on it by itself';
  }

  @override
  String get projectWorksAloneHelp =>
      'It drafts a plan for you to approve, then works in sessions until the goal is met. Nothing starts before you approve.';

  @override
  String get projectWorksAloneOn => 'Works in sessions until the goal is met.';

  @override
  String get projectWorksAloneOff => 'You work on it together in its chat.';

  @override
  String get projectMade => 'Made in this project';

  @override
  String projectMadeEmpty(String bot) {
    return 'Nothing yet. What $bot makes in this project\'s chat shows up here.';
  }

  @override
  String get projectSeeAll => 'See All';

  @override
  String get projectTodos => 'To-dos';

  @override
  String get projectFiles => 'Files';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder on $bot\'s computer';
  }

  @override
  String get projectMarkDone => 'Mark as Done';

  @override
  String get projectReopen => 'Reopen';

  @override
  String get projectCover => 'Cover';

  @override
  String get projectCoverNone => 'None';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Sailboat',
      'mountain': 'Mountain',
      'seedling': 'Seedling',
      'compass': 'Compass',
      'lantern': 'Lantern',
      'telescope': 'Telescope',
      'map': 'Map',
      'chess': 'Chess',
      'other': '$name',
    });
    return '$_temp0';
  }

  @override
  String projectThings(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString things',
      one: '1 thing',
      zero: 'Nothing yet',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Project';

  @override
  String get creationMoveToProject => 'Move to Project';

  @override
  String get creationNoProject => 'No Project';

  @override
  String get makeProject => 'Make This a Project';

  @override
  String get makeProjectTitle => 'Make this topic a project';

  @override
  String makeProjectHelp(String bot) {
    return 'What $bot made in this topic is filed under the project, and so is what it makes here next.';
  }

  @override
  String get openProject => 'Open Project';

  @override
  String get theBot => 'the bot';

  @override
  String get forYou => 'For you';

  @override
  String get inboxNeedsYou => 'Needs you';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Needs you ($nString)';
  }

  @override
  String get inboxBriefs => 'Briefs';

  @override
  String get inboxUpdates => 'Updates';

  @override
  String get inboxEmptyHelp =>
      'Requests, morning briefs, notifications and new pages from your bots show up here.';

  @override
  String get inboxNeedsYouEmpty => 'Nothing needs you right now';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'When a bot needs a decision, your help or has an idea, it shows up here.';

  @override
  String get noBriefs => 'No morning briefs yet';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot published $title';
  }

  @override
  String get forYouEmpty => 'Nothing for you right now';

  @override
  String get forYouEmptyHelp =>
      'Turn on check-ins in a bot\'s settings for a morning brief and suggestions through the day.';

  @override
  String morningBriefFrom(String name) {
    return 'Morning brief from $name';
  }

  @override
  String get suggestions => 'Suggestions';

  @override
  String suggestedBy(String name) {
    return 'Suggested by $name';
  }

  @override
  String get dismissSuggestion => 'Dismiss this suggestion?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Choose whether $bot can bring it up again.';
  }

  @override
  String get justThisOnce => 'Just This Once';

  @override
  String justThisOnceHelp(String bot) {
    return 'Hide it for now. If it still matters later, $bot may suggest it again.';
  }

  @override
  String get dontSuggestAgain => 'Don\'t Suggest It Again';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Gone for good. $bot will remember you\'d rather not.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Got it. $bot won\'t suggest that again.';
  }

  @override
  String get doIt => 'Do It';

  @override
  String get checkins => 'Check-Ins';

  @override
  String get checkinsHelp =>
      'A morning brief and a look every few hours for things that need you. Off by default.';

  @override
  String get briefTime => 'Morning brief at';

  @override
  String get scanEvery => 'Look every';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Daily limit';

  @override
  String get on => 'On';

  @override
  String get actionRules => 'Action rules';

  @override
  String get actionRulesRow => 'What it may do without asking';

  @override
  String get actionRulesHelp =>
      'Rules decide per action: allow, allow within limits, ask first, or hand it to you to finish. The most specific rule wins; with no rule, the bot\'s autonomy decides. Bots can\'t change their own rules.';

  @override
  String get addRule => 'Add a rule';

  @override
  String get addRuleHelp =>
      'Pick what the bot is doing and how it should handle it.';

  @override
  String get noRules => 'No rules yet. The bot\'s autonomy level decides.';

  @override
  String get otherTools => 'Specific Tools';

  @override
  String get workspaceRule => 'Workspace rule';

  @override
  String get catSend => 'Sending messages';

  @override
  String get catPay => 'Payments';

  @override
  String get catDelete => 'Deleting';

  @override
  String get catPublish => 'Publishing';

  @override
  String get catShare => 'Sharing and invites';

  @override
  String get catSignIn => 'Signing in';

  @override
  String get whenTheBot => 'When the bot is';

  @override
  String get itShould => 'It should';

  @override
  String get ruleAllow => 'Go ahead';

  @override
  String get ruleAllowLimits => 'Go ahead within limits';

  @override
  String get ruleAsk => 'Ask me first';

  @override
  String get ruleHandOff => 'Hand it to me to finish';

  @override
  String get ruleDomains => 'Only to these domains (comma separated)';

  @override
  String get ruleMaxAmount => 'Up to this amount';

  @override
  String get ruleForWorkspace => 'For every bot in the workspace';

  @override
  String get watchers => 'Watchers';

  @override
  String get watchersRow => 'What it\'s keeping an eye on';

  @override
  String get noWatchers => 'Not watching anything';

  @override
  String get watchersHelp =>
      'Ask the bot \"tell me when…\" and it watches a page, a reply, a result or a time. Checks cost nothing until something changes.';

  @override
  String get watcherActive => 'Watching';

  @override
  String get watcherPaused => 'Paused';

  @override
  String get watcherDone => 'Done';

  @override
  String get watcherExpired => 'Expired';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fired $countString times',
      one: 'fired once',
      zero: 'not fired yet',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Connect an AI app';

  @override
  String connectAiAppAsk(String app) {
    return '$app wants to use Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'It can list your bots, ask them to do things and read results in the workspace you pick, as you. Your bots\' approvals and rules still apply.';

  @override
  String get connectAiAppSendsTo => 'After you allow, you go back to';

  @override
  String get connectAiAppUnknown =>
      'Casama doesn\'t recognize this address. Anyone can give an app any name, so only allow it if you started this connection yourself and trust this site.';

  @override
  String get connectAiAppDone => 'Done. You can go back to the AI app.';

  @override
  String get refuse => 'Refuse';

  @override
  String get allow => 'Allow';

  @override
  String get connectAiApps => 'Connect AI Apps';

  @override
  String get connectAiAppsHelp =>
      'Apps that support MCP connect to this address and sign in, or use an API key. They act as the person who connected them.';

  @override
  String get connectedAiApps => 'Connected AI Apps';

  @override
  String get connectedAiAppsHelp =>
      'Apps you connected by signing in. Disconnect one and it loses access to this workspace right away.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Apps that people in this workspace connected by signing in. Disconnect one and it loses access right away.';

  @override
  String get noConnectedAiApps => 'No AI apps connected yet.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Used $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Connected $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'It stops working in this workspace right away. To use it again, connect it again from the app.';

  @override
  String get mcpApprovals => 'Allow Approvals from AI Apps';

  @override
  String get mcpApprovalsHelp =>
      'Connected apps can approve your bots\' actions.';

  @override
  String get newApiKey => 'New API Key';

  @override
  String get apiKeyName => 'Name';

  @override
  String get newGroupChat => 'New group chat';

  @override
  String get groupChats => 'Group chats';

  @override
  String groupWhoAnswers(String names) {
    return '$names will answer';
  }

  @override
  String get groupEveryoneAnswers => 'Everyone will answer';

  @override
  String get groupMentionHint => '@mention a bot, or @everyone';

  @override
  String routineRan(String name) {
    return 'Routine “$name” ran';
  }

  @override
  String groupBotCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String botWaitingCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString things waiting for you',
      one: '1 thing waiting for you',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Bring 2 to 10 bots into one chat. @Name asks one bot; @everyone asks the lead to plan and share out the work.';

  @override
  String get groupCreate => 'Create group chat';

  @override
  String get groupCrewEmpty => 'Pick bots below to build the group.';

  @override
  String get groupLeadShort => 'Lead';

  @override
  String get groupMakeLead => 'Make lead';

  @override
  String groupRemoveBot(String name) {
    return 'Remove $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pick $count more bots',
      one: 'Pick 1 more bot',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'That\'s 10 bots, the most a group can have.';

  @override
  String get groupLeadHint =>
      'The lead plans the work when you @everyone. Tap another bot at the top to make it lead.';

  @override
  String get groupNeedTwoBots =>
      'A group chat needs at least two bots. Make another bot first.';

  @override
  String get groupSearchBots => 'Search bots';

  @override
  String get groupNoMatch => 'No bots match that name.';

  @override
  String get groupTitle => 'Name (optional)';

  @override
  String get groupPickBots => 'Bots';

  @override
  String get groupLead => 'Leads the group';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Pages';

  @override
  String get pagesRow => 'Reports and dashboards it published';

  @override
  String get noPages => 'No pages yet';

  @override
  String get pagesHelp =>
      'Ask a bot for a report, dashboard or tracker and it can publish it as a page. Pages open in your browser and stay private until you share them.';

  @override
  String get pagePrivate => 'Only me';

  @override
  String get pageWorkspace => 'Workspace';

  @override
  String get pagePublic => 'Anyone with the link';

  @override
  String get pageRefreshes => 'Refreshes on schedule';

  @override
  String get pageCardOpen => 'Page · Tap to open';

  @override
  String get exportPdf => 'Export PDF';

  @override
  String get pageMakePublicTitle => 'Make this page public?';

  @override
  String get pageMakePublicBody =>
      'Anyone with the link can open it, including the data on it. You can take it back any time; the link stops working.';

  @override
  String get pageMakePublic => 'Make Public';

  @override
  String get pagePublicLinkTitle => 'Public Link';

  @override
  String get pagePublicLinkBody =>
      'Copied. It isn\'t listed in search engines.';

  @override
  String deletePageTitle(String title) {
    return 'Delete \"$title\"?';
  }

  @override
  String get openPages => 'Open in Pages';

  @override
  String get discard => 'Discard';

  @override
  String get discardChangesTitle => 'Discard changes?';

  @override
  String get discardChangesBody => 'Your edits haven\'t been saved.';

  @override
  String get keepEditing => 'Keep editing';

  @override
  String get teachTask => 'Teach a task';

  @override
  String get teachWhichBot => 'Which bot should learn this?';

  @override
  String get teachRecording => 'Recording';

  @override
  String get teachRecordingPaused => 'Recording stopped';

  @override
  String get teachRecordingHelp =>
      'Do the task as you normally would. Each step is saved with what\'s on screen; password fields never are.';

  @override
  String get teachStop => 'Stop';

  @override
  String get teachMarkSecret => 'Mark as Secret';

  @override
  String get teachMarkSecretHelp =>
      'What you just typed is deleted from the recording and becomes a secret input the bot asks for.';

  @override
  String get teachDraftTitle => 'New skill';

  @override
  String get teachDrafting => 'Writing a skill from your recording…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String teachRecordedSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString steps',
      one: '1 step',
    );
    return 'What you showed ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Check the steps, inputs and success checks, then save. You can try it right away.';

  @override
  String get teachDraftFailed =>
      'The bot couldn\'t write a draft. Write the steps yourself from the recording below, or discard it.';

  @override
  String get teachAlreadySaved => 'This skill is saved';

  @override
  String get teachSaveAndTry => 'Save and Try';

  @override
  String teachSaved(String name) {
    return 'Saved $name';
  }

  @override
  String get teachDiscardTitle => 'Discard this recording?';

  @override
  String get teachDiscardBody =>
      'Every step, snapshot and screenshot it captured is deleted.';

  @override
  String teachStepClick(int x, int y) {
    return 'Click at $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Type “$text”';
  }

  @override
  String teachStepSecret(String name) {
    return 'Type secret $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Press $key';
  }

  @override
  String get teachStepScroll => 'Scroll';

  @override
  String get plugins => 'Plugins';

  @override
  String get pluginsRow => 'Skills and tools from plugin packages';

  @override
  String get noPlugins => 'No plugins yet';

  @override
  String get pluginsHelp =>
      'Plugins are Agent Plugins 1.0 packages on GitHub. They can bring skills and MCP tools; their servers run on this bot\'s computer, never on Casama\'s servers.';

  @override
  String get addPlugin => 'Add a plugin';

  @override
  String get addPluginHelp =>
      'Paste a GitHub link to the plugin\'s folder. You\'ll see what it adds before anything is installed.';

  @override
  String get pluginAdds => 'It adds';

  @override
  String pluginStdio(String command) {
    return 'Runs on the bot\'s computer: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Connects to $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Talks to: $hosts';
  }

  @override
  String get pluginSkill => 'Skill';

  @override
  String get pluginHosts => 'Network';

  @override
  String get pluginServerError => 'Couldn\'t start';

  @override
  String get pluginRunsOnComputer => 'Runs on the bot\'s computer';

  @override
  String get pluginWhereToolsRun => 'Where its tools run';

  @override
  String get pluginWhereToolsRunHelp =>
      'On your own computer the tools can use what\'s there, and only you can use them, from your own chats. Servers on the internet aren\'t affected.';

  @override
  String get pluginPlaceBot => 'The bot\'s computer';

  @override
  String pluginPlaceMine(String name) {
    return 'My computer: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Runs on $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Its tools work only in chats with the person whose computer it is';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Offline: its tools work again when the Casama app is open there';

  @override
  String get pluginUpToDate => 'Already up to date';

  @override
  String get checkForUpdate => 'Check for Update';

  @override
  String get uninstall => 'Uninstall';

  @override
  String uninstallPluginTitle(String name) {
    return 'Uninstall $name?';
  }

  @override
  String get uninstallPluginBody =>
      'Its skills, tools, files and saved secrets are removed from this bot.';

  @override
  String updatePluginTitle(String name) {
    return 'Update $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'New skills: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Changed skills: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Removed skills: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'New tool servers: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Changed tool servers: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Removed tool servers: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Talks to new hosts: $hosts';
  }

  @override
  String get pluginDiffNone => 'No changes to what it adds.';

  @override
  String get next => 'Next';

  @override
  String get botNameLabel => 'Name';

  @override
  String get importAgent => 'Import an Agent';

  @override
  String get importAgentHelp =>
      'Bring a bot over from OpenClaw or Hermes Agent, or paste a setup from Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark or Instinct: its persona, skills, schedules and memories. You\'ll review everything before it\'s created. Keys and settings files are never read.';

  @override
  String get importAgentPickFolder => 'Pick Its Folder';

  @override
  String get importAgentPickZip => 'Upload a ZIP of its folder';

  @override
  String get importPasteChoice => 'Paste a Bot\'s Setup';

  @override
  String get importPasteChoiceHelp =>
      'From Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct or another app';

  @override
  String get importPasteTitle => 'Paste a Bot\'s Setup';

  @override
  String get importPasteHelp =>
      'Send your bot the prompt below, then paste its whole reply. You\'ll review everything before the new bot is created.';

  @override
  String get importPasteSource => 'Where is your bot now?';

  @override
  String get importPasteOther => 'Somewhere else';

  @override
  String get importPasteStep1 => '1. Send your bot this prompt';

  @override
  String get importPasteReply => '2. Paste its reply';

  @override
  String get importPasteSafety =>
      'Lines that look like keys, passwords or card numbers are removed. Sign in to its apps again after importing.';

  @override
  String get importPasteSubtitle => 'Pasted setup';

  @override
  String get agentImportReviewHelp =>
      'Untick anything you don\'t want. Nothing is created until you import.';

  @override
  String get agentImportNoPersona => 'No persona file was found.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString skills',
      one: '1 skill',
    );
    return '$_temp0';
  }

  @override
  String agentImportRoutines(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString routines',
      one: '1 routine',
    );
    return '$_temp0';
  }

  @override
  String agentImportMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString memories',
      one: '1 memory',
    );
    return '$_temp0';
  }

  @override
  String agentImportLeftovers(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString other files',
      one: '1 other file',
    );
    return 'Copy $_temp0 to ~/imported/ on its computer';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Not imported: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Imported $name and copied $countString files to its computer';
  }

  @override
  String agentImportedFilesLater(String name) {
    return 'Imported $name. Its other files couldn\'t be copied yet; give it a computer and import again to copy them.';
  }

  @override
  String get importMemoryTitle => 'Import memories from ChatGPT or Claude';

  @override
  String get importMemoryHelp =>
      'Copy this prompt into ChatGPT or Claude, then paste its answer below.';

  @override
  String get importMemoryPick => 'Keep what\'s right; untick the rest.';

  @override
  String get importMemoryPaste => 'Its answer';

  @override
  String get importMemoryNone => 'No memories found in that answer.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString memories',
      one: '1 memory',
    );
    return 'Added $_temp0';
  }

  @override
  String get routinesAsFiles => 'Routines and Skills as Files';

  @override
  String get routinesAsFilesHelp =>
      'Every routine and skill as a Markdown file: export them, edit them anywhere, import them back, or keep them in a GitHub repository.';

  @override
  String get exportFiles => 'Export as Files';

  @override
  String get importFiles => 'Import Files';

  @override
  String get importFilesApply => 'Apply';

  @override
  String filesPreview(int created, int updated, int unchanged) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);
    final intl.NumberFormat unchangedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unchangedString = unchangedNumberFormat.format(unchanged);

    return '$createdString new, $updatedString changed, $unchangedString unchanged';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Imported: $createdString new, $updatedString changed';
  }

  @override
  String get gitSync => 'Git Sync';

  @override
  String get gitSyncOff => 'Off';

  @override
  String get gitSyncHelp =>
      'Changes in Casama are committed to the repository, and pushes to it update Casama after they\'re checked. If a file changed in both places, Casama keeps its version and opens a pull request. Needs a GITHUB_TOKEN secret allowed for api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Needs a GITHUB_TOKEN secret';

  @override
  String gitSyncedWhen(String when) {
    return 'Synced $when';
  }

  @override
  String get gitSyncPr => 'Pull Request Waiting for You';

  @override
  String get syncNow => 'Sync now';

  @override
  String get syncQueued => 'Syncing within a minute';

  @override
  String get gitBranch => 'Branch';

  @override
  String get gitFolder => 'Folder in the repository (optional)';

  @override
  String get gitSyncOn => 'Sync On';

  @override
  String get gitSyncRemove => 'Stop Syncing';

  @override
  String get gitWebhookTitle => 'Add this webhook to the repository';

  @override
  String get gitWebhookHelp =>
      'In the repository\'s settings, add a webhook for push events with this address and secret (content type application/json). The secret is shown only now.';

  @override
  String get gitWebhookUrl => 'Payload URL';

  @override
  String get gitWebhookSecret => 'Secret';

  @override
  String get knowledge => 'Knowledge';

  @override
  String get knowledgeRow => 'Documents it can search and cite';

  @override
  String get noKnowledge => 'No knowledge yet';

  @override
  String get knowledgeHelp =>
      'Give it files, a website or a GitHub repository. It searches them when they\'re relevant and tells you which document an answer came from.';

  @override
  String get addKnowledge => 'Add knowledge';

  @override
  String get addKnowledgeHelp =>
      'PDF, Word, Markdown, HTML, CSV or text files; a website (one domain, following its robots.txt); or a repository\'s documents. Websites and repositories refresh daily.';

  @override
  String get knowledgeFiles => 'Files';

  @override
  String get knowledgeWebsite => 'Website';

  @override
  String get knowledgePickFiles => 'Choose Files';

  @override
  String get knowledgeWebsiteUrl => 'Website address';

  @override
  String get knowledgeRepoUrl => 'GitHub link';

  @override
  String get knowledgeShareAll => 'Share with every bot in the workspace';

  @override
  String get knowledgeShared => 'Whole workspace';

  @override
  String knowledgeReady(int docs, int chunks) {
    final intl.NumberFormat docsNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String docsString = docsNumberFormat.format(docs);
    final intl.NumberFormat chunksNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String chunksString = chunksNumberFormat.format(chunks);

    String _temp0 = intl.Intl.pluralLogic(
      docs,
      locale: localeName,
      other: '$docsString documents',
      one: '1 document',
    );
    return '$_temp0, $chunksString passages';
  }

  @override
  String get knowledgeError => 'Couldn\'t read it';

  @override
  String get knowledgeSyncing => 'Reading…';

  @override
  String get knowledgePending => 'Waiting to be read';

  @override
  String get add => 'Add';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot suggests a skill: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot suggests improving $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Uses: $tools';
  }

  @override
  String get saveSkill => 'Save Skill';

  @override
  String get applyEdit => 'Apply Change';

  @override
  String skillSaved(String name) {
    return 'Saved $name';
  }

  @override
  String skillUpdated(String name) {
    return 'Updated $name';
  }

  @override
  String get skillStats => 'How it\'s doing';

  @override
  String get skillNotUsedYet => 'Not used yet';

  @override
  String skillStatsLine(int uses, int rate, int failures, int corrections) {
    final intl.NumberFormat usesNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usesString = usesNumberFormat.format(uses);
    final intl.NumberFormat rateNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String rateString = rateNumberFormat.format(rate);
    final intl.NumberFormat failuresNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String failuresString = failuresNumberFormat.format(failures);
    final intl.NumberFormat correctionsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String correctionsString = correctionsNumberFormat.format(
      corrections,
    );

    return 'Used $usesString times · $rateString% went well · $failuresString failed · $correctionsString corrected';
  }

  @override
  String skillLastFailure(String date) {
    return 'Last problem: $date';
  }

  @override
  String get skillHistory => 'Earlier versions';

  @override
  String get replays => 'Replays';

  @override
  String get replaysRow => 'Recorded steps it runs without thinking';

  @override
  String get noReplays => 'No replays yet';

  @override
  String get replaysHelp =>
      'A replay is a recorded set of browser or desktop steps the bot runs as is, which is faster and cheaper. If a step doesn\'t work any more, the bot takes over from there and can update the replay. Save one from a teach recording, or ask the bot to save what it just did.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String replayRuns(int runs, int failures) {
    final intl.NumberFormat runsNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String runsString = runsNumberFormat.format(runs);
    final intl.NumberFormat failuresNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String failuresString = failuresNumberFormat.format(failures);

    String _temp0 = intl.Intl.pluralLogic(
      runs,
      locale: localeName,
      other: 'run $runsString times',
      one: 'run 1 time',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString needed help',
      one: '1 needed help',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Run $name';
  }

  @override
  String get runReplayHelp => 'Check the values it fills in, then run it.';

  @override
  String get run => 'Run';

  @override
  String get saveAsReplay => 'Also Save as a Replay';

  @override
  String replaySaved(String name) {
    return 'Saved the replay $name';
  }

  @override
  String get passwordManagers => 'Password managers';

  @override
  String get passwordManagersRow => '1Password or Bitwarden logins for bots';

  @override
  String get noPasswordManagers => 'No password managers connected';

  @override
  String get passwordManagersHelp =>
      'Bots can sign in with logins from the vaults you choose. They never see a password: it\'s filled into the browser only on that login\'s own sites.';

  @override
  String get connectPasswordManager => 'Connect a password manager';

  @override
  String get pmWorkspace => 'Whole workspace';

  @override
  String get pmJustMe => 'Just me';

  @override
  String get pmNoVaults => 'No vaults chosen yet';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString vaults',
      one: '1 vault',
    );
    return '$_temp0';
  }

  @override
  String pmLogins(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString logins',
      one: '1 login',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Uses a 1Password Connect server with a service account\'s token.';

  @override
  String get pmBitwardenHelp =>
      'Uses Bitwarden\'s Vault Management API (bw serve) for your organization\'s collections.';

  @override
  String get pmConnectUrl => 'Connect server address';

  @override
  String get pmConnectToken => 'Connect token';

  @override
  String get pmBwUrl => 'bw serve address';

  @override
  String get pmBwToken => 'Access token (optional)';

  @override
  String get pmForWorkspace => 'For the Whole Workspace';

  @override
  String get pmChooseVaults => 'Vaults Bots May Use';

  @override
  String get pmChooseVaultsHelp =>
      'Only logins in the vaults or collections you tick are available to bots.';

  @override
  String get welcomeGettingReady => 'Getting your space ready…';

  @override
  String get setUpManually => 'Set Up Manually';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get inviteLinkCopied =>
      'Invite link copied. Send it to the people you work with.';

  @override
  String get inviteFriends => 'Invite Friends';

  @override
  String inviteFriendsRow(String amount) {
    return 'Earn $amount of free usage for each friend who joins';
  }

  @override
  String get inviteFriendsRowPlain => 'Share Casama with your friends';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Give Casama, Get $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Share Casama with Friends';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Send your link to a friend. When they sign up and finish their first chat, you get $amount of free usage.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Send your link to a friend. They can sign up straight away.';

  @override
  String get inviteFriendsYourCode => 'Your invite code. Tap to copy.';

  @override
  String get inviteFriendsShare => 'Share Link';

  @override
  String get inviteFriendsCopyLink => 'Copy Link';

  @override
  String get inviteFriendsCopied => 'Copied. Send it to a friend.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Join me on Casama, where AI teammates get things done for you: $link (invite code $code)';
  }

  @override
  String get inviteFriendsProgress => 'Your Invites';

  @override
  String get inviteFriendsJoined => 'Friends Who Joined';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString haven\'t finished a first chat yet',
      one: '1 hasn\'t finished a first chat yet',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Free Usage Earned';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString more friends can earn you a reward',
      one: '1 more friend can earn you a reward',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'You\'ve earned the most invites can give. Thank you!';

  @override
  String get inviteFriendsHow => 'How It Works';

  @override
  String get inviteFriendsStep1 => 'Share your link or code with a friend';

  @override
  String get inviteFriendsStep2 =>
      'They sign up and enter your code within a week';

  @override
  String inviteFriendsStep3(String amount) {
    return 'When they finish their first chat, you get $amount of free usage';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'They get going with their own AI teammates';

  @override
  String get inviteFriendsUnavailable =>
      'Invites aren\'t available on this server.';

  @override
  String get referralHaveCode => 'Got a Friend\'s Code?';

  @override
  String get referralCodeHint => 'Invite code';

  @override
  String get referralUse => 'Use';

  @override
  String get referralRedeemed => 'Invite code added. Welcome to Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'You joined through $name\'s invite. Welcome to Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'You joined through $name\'s invite.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'You joined through a friend\'s invite.';

  @override
  String referralInvitedBy(String name) {
    return '$name invited you';
  }

  @override
  String get referralInvitedByFriend => 'A friend invited you';

  @override
  String get referralWelcomeTitle => 'Welcome to Casama';

  @override
  String get referralWelcomeHelp =>
      'AI teammates that work for you on their own computers. Accept the invite so your friend gets the credit.';

  @override
  String get referralAccept => 'Accept Invite';

  @override
  String get referralGetStarted => 'Get Started';

  @override
  String get referralInvalid => 'This Invite Doesn\'t Work';

  @override
  String get referralInvalidHelp =>
      'The code may be mistyped. You can still sign up and use Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Give $amount, Get $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Send your link to a friend. When they sign up with your code and finish their first chat, you each get $amount of free usage.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Send your link to a friend. When they sign up with your code and finish their first chat, you get $reward of free usage and they get $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'When they finish their first chat, you each get $amount of free usage';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'When they finish their first chat, you get $reward and they get $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Join me on Casama, where AI teammates get things done for you. Sign up with my invite code $code and you get $amount of free usage: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Enter it within a week of signing up and get $amount of free usage after your first chat.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Your $amount welcome bonus is in your workspace.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Your $amount welcome bonus arrives after your first chat.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'AI teammates that work for you on their own computers. Accept the invite and get $amount of free usage after your first chat.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'You\'re in! Your $amount welcome bonus arrives after your first chat.';
  }

  @override
  String get connectManaged => 'Sign in through Composio';

  @override
  String connectManagedHelp(String app) {
    return 'Casama connects $app through Composio, which handles the sign-in. You can disconnect any time.';
  }

  @override
  String get sharing => 'Sharing';

  @override
  String get sharingRow => 'Who can chat with, edit or manage it';

  @override
  String get sharingHelp =>
      'Everyone in the workspace can chat with a bot unless you make it private. People you add can chat, edit its settings, or also manage who has access. A bot working for someone only uses their own personal computer and connections.';

  @override
  String get sharingPrivate => 'Private';

  @override
  String get sharingPrivateOn => 'Only you and the people below can see it';

  @override
  String get sharingPrivateOff => 'Everyone in the workspace can chat with it';

  @override
  String get sharingPeople => 'People';

  @override
  String get sharingOnlyCreator => 'Only Its Creator';

  @override
  String get sharingEveryoneChats =>
      'Everyone can chat; add people who should edit it';

  @override
  String sharingEveryoneRole(String role) {
    return 'Everyone Who Is $role';
  }

  @override
  String get accessChat => 'Can chat';

  @override
  String get accessEdit => 'Can edit';

  @override
  String get accessAdmin => 'Can manage';

  @override
  String get sharingSaved => 'Sharing saved';

  @override
  String get triggerCalendar => 'Meetings';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Around matching meetings ($minutesString min)',
      zero: 'At the start of matching meetings',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Connect Google Calendar or Outlook first.';

  @override
  String get calendarTriggerCalendar => 'Calendar';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString min',
      zero: 'At start',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Only meetings with people outside my company';

  @override
  String get calendarVideoLink => 'Only meetings with a video link';

  @override
  String get calendarTitleMatch => 'Only titles containing (optional)';

  @override
  String get fullAccess => 'Full access';

  @override
  String get fullAccessHelp =>
      'Bots act without asking first, on their computers and on your Mac. Payments, password changes and your own \"ask\" rules still ask.';

  @override
  String get fullAccessConfirmTitle => 'Turn on full access?';

  @override
  String get fullAccessConfirmBody =>
      'Every bot in this workspace will send messages, delete files, run commands on your Mac and add connections without asking you first. Payments and password changes still ask.';

  @override
  String get fullAccessTurnOn => 'Turn on';

  @override
  String get botToBot => 'Bots can talk to each other';

  @override
  String get botToBotHelp =>
      'Bots can @mention, message and hand work to each other.';

  @override
  String get capMessages => 'Messages (iMessage)';

  @override
  String get chatApps => 'Chat apps';

  @override
  String get chatAppsRow => 'Telegram, email, SMS, Slack, WhatsApp and more';

  @override
  String get botEmail => 'Email address';

  @override
  String get botEmailRow => 'Give this bot its own address';

  @override
  String botEmailClaimTitle(String name) {
    return 'Give $name an email address';
  }

  @override
  String get botEmailClaimHelp =>
      'People can write to it, and it answers by email. Forward it anything: bills, bookings, newsletters.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'The name can\'t be changed later.';

  @override
  String get botEmailNameLabel => 'Name';

  @override
  String botEmailWillBe(String address) {
    return 'Your bot\'s address: $address.';
  }

  @override
  String get botEmailClaim => 'Create address';

  @override
  String get botEmailTaken => 'That name is taken. Try one of these:';

  @override
  String get botEmailClaimed => 'Your bot has an address';

  @override
  String get botEmailClaimedHelp =>
      'A welcome mail is on its way to you. Reply to it, or forward anything.';

  @override
  String get botEmailCopy => 'Copy';

  @override
  String get botEmailCopied => 'Copied';

  @override
  String get botEmailContacts => 'Add to contacts';

  @override
  String botEmailWrite(String name) {
    return 'Write to $name';
  }

  @override
  String get botEmailPaused =>
      'Paused. It still receives and keeps mail, but answers nothing.';

  @override
  String get botEmailPause => 'Pause';

  @override
  String get botEmailResume => 'Resume';

  @override
  String get botEmailSenders => 'Allowed senders';

  @override
  String get botEmailSendersHelp =>
      'Only these people get answers. Strangers\' mail is kept, and starts nothing.';

  @override
  String get botEmailEditSenders => 'Edit in Chat apps';

  @override
  String get botEmailMove => 'Move to another bot';

  @override
  String get botEmailMoveHelp =>
      'The address and its mail move to the other bot.';

  @override
  String get botEmailRelease => 'Release address';

  @override
  String get botEmailReleaseHelp =>
      'Stops receiving for good. The name is never given out again.';

  @override
  String botEmailReleaseConfirm(String address) {
    return 'Release $address? It stops receiving at once, and the name is never given out again.';
  }

  @override
  String get botEmailReleaseNow => 'Release';

  @override
  String get botEmailMoved => 'Moved';

  @override
  String botEmailNewBotRow(String name) {
    return 'Give $name an email address';
  }

  @override
  String get botEmailInbox => 'Inbox';

  @override
  String get botEmailInboxRow => 'Kept mail, strangers and files';

  @override
  String get botEmailEmpty => 'No mail yet';

  @override
  String get botEmailStrangers => 'Strangers';

  @override
  String get botEmailAll => 'All mail';

  @override
  String get botEmailUnconfirmed => 'Couldn\'t confirm this sender';

  @override
  String get botEmailAllow => 'Allow';

  @override
  String get botEmailBlock => 'Block';

  @override
  String get botEmailBlocked => 'Blocked. New mail from here is refused.';

  @override
  String get botEmailUnblock => 'Unblock';

  @override
  String get botEmailOpenChat => 'Open chat';

  @override
  String get botEmailFiles => 'Files';

  @override
  String get botEmailNewSenders => 'Tell me about new senders';

  @override
  String get botEmailNewSendersHelp =>
      'At most once a day. Off unless you turn it on.';

  @override
  String get botEmailTryTitle => 'Things to try';

  @override
  String get botEmailTryForward => 'Forward a bill or a booking';

  @override
  String get botEmailTryForwardHelp =>
      'Forward anything to the address above. It reads it and answers here.';

  @override
  String get botEmailTryReceipts => 'Keep my receipts';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Makes a routine that files mail sent to $address.';
  }

  @override
  String get botEmailTryDigest => 'One digest a week';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Makes a routine that gathers newsletters from $address into a weekly summary.';
  }

  @override
  String get botEmailTryCopied => 'Address copied';

  @override
  String get botEmailTryMade => 'Routine made';

  @override
  String get botEmailReceiptsName => 'Keep my receipts';

  @override
  String get botEmailReceiptsInstructions =>
      'File the receipt from this mail: what it was for, how much, and when. Say nothing unless something looks wrong.';

  @override
  String get botEmailDigestName => 'Weekly newsletter digest';

  @override
  String get botEmailDigestInstructions =>
      'Collect this week\'s newsletters and send one short digest: the headlines worth knowing, nothing more.';

  @override
  String get botEmailTriggerTag => 'Address tag';

  @override
  String get botEmailTriggerTagHelp =>
      'Only mail to this tag, like shop for ada+shop@. Email addresses only.';

  @override
  String get botEmailTriggerUnconfirmed => 'Hear unconfirmed senders too';

  @override
  String get botEmailTriggerAutomatic => 'Hear automatic mail too';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used of $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used used';
  }

  @override
  String get botEmailStorageFull =>
      'The mailbox is full, so new mail is refused. Delete old mail to make room.';

  @override
  String get botEmailSelect => 'Select';

  @override
  String get botEmailSelectDone => 'Done';

  @override
  String get botEmailDelete => 'Delete';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Delete $n mails',
      one: 'Delete 1 mail',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Delete $n mails?',
      one: 'Delete this mail?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Their text and files are gone for good. Copies already in a chat stay there.';

  @override
  String get botEmailDeleteOlder => 'Delete older mail';

  @override
  String get botEmailOlder30Days => 'Older than 30 days';

  @override
  String get botEmailOlder6Months => 'Older than 6 months';

  @override
  String get botEmailOlderYear => 'Older than a year';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Delete all mail older than 30 days?',
      'months6': 'Delete all mail older than 6 months?',
      'other': 'Delete all mail older than a year?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Deleted $n mails',
      one: 'Deleted 1 mail',
      zero: 'Nothing to delete',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bot email addresses',
      one: '1 bot email address',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew => 'Bots write to new people by email';

  @override
  String get botEmailPerkRepliesOnly => 'Bots reply to you by email';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Connect a chat app';

  @override
  String get chatAppsEmpty => 'No chat apps yet';

  @override
  String get chatAppsHelp =>
      'Let people message this bot from Telegram, email, SMS, Slack, WhatsApp, Messenger, Feishu or iMessage. It only answers people on the allowed list; everyone else is logged here.';

  @override
  String get chatAppsAddHelp =>
      'Paste the credentials from the app\'s developer settings. They\'re stored encrypted and never shown again.';

  @override
  String get chatAppsKind => 'App';

  @override
  String get chatAppsSenders => 'Allowed senders';

  @override
  String get chatAppsSendersHelp =>
      'One per line: email addresses (or *@company.com), phone numbers, or user ids. Not sure of an id? Leave it empty, message the bot, and copy the id from Activity.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Turn on \"Use this computer for bots\" with Messages allowed in the desktop app on your Mac first.';

  @override
  String chatAppsConnected(String name) {
    return '$name is connected';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram is already sending messages here. Message your bot to try it.';

  @override
  String get chatAppsPasteUrl =>
      'Paste this address into the app\'s webhook settings.';

  @override
  String get chatAppsWebhookUrl => 'Webhook address';

  @override
  String get chatAppsVerifyToken => 'Verify token';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString allowed senders',
      one: '1 allowed sender',
      zero: 'Nobody allowed',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Activity';

  @override
  String get chatAppsNoActivity => 'No messages yet.';

  @override
  String get chatAppsIgnored => 'Ignored: not on the allowed list';

  @override
  String get chatAppsAllow => 'Allow';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender can now message this bot';
  }

  @override
  String get chatAppsRoutine => 'Started a routine';

  @override
  String get chatAppsFailed => 'Couldn\'t send';

  @override
  String get chatAppsSent => 'Sent';

  @override
  String get chatAppsAnswered => 'Answered';

  @override
  String get chatAppsRemove => 'Disconnect';

  @override
  String get chBotToken => 'Bot token';

  @override
  String get chAddress => 'Email address';

  @override
  String get chApiKey => 'API key';

  @override
  String get chSigningSecret => 'Signing secret';

  @override
  String get chPhoneNumber => 'Phone number';

  @override
  String get chAccountSid => 'Account SID';

  @override
  String get chAuthToken => 'Auth token';

  @override
  String get chPhoneNumberId => 'Phone number ID';

  @override
  String get chAccessToken => 'Access token';

  @override
  String get chAppSecret => 'App secret';

  @override
  String get chPageToken => 'Page access token';

  @override
  String get chAppId => 'App ID';

  @override
  String get chEncryptKey => 'Encrypt key';

  @override
  String get chVerificationToken => 'Verification token';

  @override
  String get chPublicKey => 'Public key';

  @override
  String get chTrackerUser => 'The bot\'s user ID in the tracker';

  @override
  String get chSiteUrl => 'Site address (https://…)';

  @override
  String get chAccountEmail => 'Account email';

  @override
  String get routineMessage => 'When a matching message arrives';

  @override
  String get triggerMessage => 'Messages';

  @override
  String get messageTriggerHelp =>
      'Starts when an email or chat message to this bot matches. Connect the app under Chat apps first.';

  @override
  String get messageTriggerAnyApp => 'Any app';

  @override
  String get messageTriggerSender => 'From (address, number, or *@company.com)';

  @override
  String get messageTriggerSubject => 'Subject contains';

  @override
  String get messageTriggerWords => 'Message contains';

  @override
  String callIncoming(String name) {
    return '$name is calling';
  }

  @override
  String get callAnswer => 'Answer';

  @override
  String get callDecline => 'Decline';

  @override
  String get callFullScreenTitle => 'Calls on the Lock Screen';

  @override
  String get callFullScreenOff =>
      'Off: a bot\'s call shows only as a notification. Tap to let calls ring on the full screen.';

  @override
  String get encryption => 'Encrypt Content';

  @override
  String get encryptionHelp =>
      'Messages, memories, tickets, pages and knowledge are encrypted before they\'re stored, with this workspace\'s own key. Search then matches titles and meaning, not exact words in encrypted text.';

  @override
  String get encryptionOff => 'Off';

  @override
  String get encryptionUnavailable =>
      'Not available: this server has no encryption key set up';

  @override
  String get encryptionEncrypting =>
      'Turning on: encrypting what\'s already stored';

  @override
  String get encryptionOnServer => 'On, with the server\'s key';

  @override
  String get encryptionOnKms => 'On, with AWS KMS';

  @override
  String get encryptionDecrypting => 'Turning off: decrypting what\'s stored';

  @override
  String get encryptionConfirm =>
      'Content will be encrypted with this workspace\'s key. If the workspace is deleted, its key is destroyed and the content can\'t be recovered. Exact-word search stops matching encrypted text.';

  @override
  String get encryptionTurnOn => 'Turn On';

  @override
  String get encryptionRotate => 'Rotate Key';

  @override
  String get encryptionKeyManaged =>
      'Casama creates and keeps this workspace\'s key for you, wrapped with the server\'s own key. There\'s nothing to save or copy.';

  @override
  String get encryptionRotateTitle => 'Rotate the key?';

  @override
  String get encryptionRotateBody =>
      'The workspace key is wrapped again with the server\'s current key. Your content stays readable and nothing needs re-encrypting. Do this after changing the server\'s key, or on a schedule.';

  @override
  String get encryptionRotateHelp =>
      'Rewraps the workspace key with the server\'s current key';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Last rotated $when';
  }

  @override
  String get memoryBackend => 'Where Memory Is Kept';

  @override
  String get memoryBuiltIn => 'Built in';

  @override
  String get memoryBackendHelp => 'Bots\' long-term memory';

  @override
  String get memoryBackendSheetHelp =>
      'Keep your bots\' memory in Honcho or Supermemory with your own account. The memory screen, exports and deletion work the same.';

  @override
  String get memoryHonchoWorkspace => 'Honcho workspace';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Leave empty to use one made for this Casama workspace';

  @override
  String get memoryBaseUrl => 'Server address (optional)';

  @override
  String get memoryBaseUrlHelp =>
      'Only for a self-hosted Honcho or Supermemory';

  @override
  String get memoryCopyExisting => 'Copy Current Memories Over';

  @override
  String get memoryUseBuiltIn => 'Use Built-in Memory Again';

  @override
  String get providerHintData => 'paid data (places, emails, SEO)';

  @override
  String get kindA2a => 'AI agent (A2A)';

  @override
  String get a2aAgentUrl => 'Agent address or agent card URL';

  @override
  String get a2aAgentToken => 'Access token (optional)';

  @override
  String get a2a => 'Agent-to-Agent (A2A)';

  @override
  String get a2aHelp => 'Outside agents can give tasks to bots you publish.';

  @override
  String get chromeExtensionSwitch => 'Casama for Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Members can use the browser extension with this workspace.';

  @override
  String get chromeActSwitch => 'Bots in Members\' Browsers';

  @override
  String get chromeActSwitchHelp =>
      'Members can let bots open pages and act in their own Chrome, in a tab group they can stop.';

  @override
  String get a2aPublish => 'Publish as an A2A Agent';

  @override
  String get a2aPublishHelp =>
      'Outside agents with a workspace API key can give this bot tasks.';

  @override
  String get a2aWorkspaceOff =>
      'Turn on agent-to-agent in workspace settings first.';

  @override
  String get a2aCardUrl => 'Agent card';

  @override
  String get phoneCalls => 'Phone Calls';

  @override
  String get phoneCallsHelp =>
      'Let bots call businesses for you through your Twilio account. Every call asks first under the usual approvals.';

  @override
  String get twilioSid => 'Account SID';

  @override
  String get twilioToken => 'Auth token';

  @override
  String get twilioFrom => 'Calls come from';

  @override
  String get phoneCallsPersonal => 'Allow Calling Personal Numbers';

  @override
  String get phoneCallsCap => 'Calls per day';

  @override
  String get phoneCallsOff => 'Not connected';

  @override
  String get outCall => 'Call';

  @override
  String get outCallRinging => 'Ringing…';

  @override
  String get outCallLive => 'On the call';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Ended after ${secondsString}s';
  }

  @override
  String get outCallEndedByYou => 'You ended the call';

  @override
  String get outCallTakenOver => 'You took over the call';

  @override
  String get outCallFailed => 'Didn\'t go through';

  @override
  String get outCallNothingYet => 'Nothing said yet.';

  @override
  String get outCallTakeOver => 'Take Over';

  @override
  String get outCallEnd => 'End Call';

  @override
  String get outCallYourPhone => 'Your phone number';

  @override
  String get outCallYourPhoneHelp =>
      'International format, like +14155550123. Leave empty to use the one saved.';

  @override
  String get payments => 'Payments';

  @override
  String get paymentsHelp =>
      'Let bots pay merchants with single-use virtual cards you approve each time. Bring your own Stripe Issuing account.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent spent this month of $cap';
  }

  @override
  String get paymentsSheetHelp =>
      'Every card is approved by you with the amount shown, works once at that merchant for one hour, and never for securities, crypto, gift cards or transfers.';

  @override
  String get paymentsStripeKey => 'Stripe secret key (with Issuing)';

  @override
  String get paymentsWebhookSecret => 'Webhook signing secret';

  @override
  String get paymentsWebhook => 'Point a Stripe webhook here';

  @override
  String get paymentsCardholder => 'Name on cards';

  @override
  String get paymentsAddress => 'Billing address';

  @override
  String get paymentsCity => 'City';

  @override
  String get paymentsState => 'State or region';

  @override
  String get paymentsZip => 'Postal code';

  @override
  String get paymentsCountry => 'Country (2 letters)';

  @override
  String get paymentsCap => 'Workspace limit per month (USD)';

  @override
  String get paymentsBotCap => 'Per-bot limit per month (USD)';

  @override
  String get links => 'Linked bots';

  @override
  String get linksRow => 'Link with a trusted contact\'s bot';

  @override
  String get linksHelp =>
      'Your bot can ask a linked contact\'s bot for things like a dinner slot. Each bot answers under its own person\'s rules and shares only what\'s needed; both of you see every exchange.';

  @override
  String get linksEmpty => 'No linked bots yet';

  @override
  String get linksInvite => 'Invite a contact';

  @override
  String get linksContactName => 'Contact\'s name';

  @override
  String get linksInviteReady => 'Send This Invite';

  @override
  String get linksInviteHelp =>
      'Send it to your contact. They accept it in Casama with one of their bots. It works once, for 7 days.';

  @override
  String get linksAccept => 'Accept an invite';

  @override
  String get linksAcceptHelp => 'Paste the invite your contact sent you.';

  @override
  String get linksInviteText => 'Invite';

  @override
  String linksActive(String bot) {
    return 'Linked with $bot';
  }

  @override
  String get linksPending => 'Waiting for your contact to accept';

  @override
  String get linksRevoked => 'Unlinked';

  @override
  String get linksExchanges => 'Exchanges';

  @override
  String get linksNoExchanges => 'Nothing asked yet.';

  @override
  String get linksNoAnswer => 'No answer';

  @override
  String get linksWorking => 'Working…';

  @override
  String get linksRevoke => 'Unlink';

  @override
  String get wakeWord => 'Wake Word';

  @override
  String get wakeWordRow => 'Say a phrase to start a call with a bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'Listening for \"$phrase\"';
  }

  @override
  String get wakeWordHelp =>
      'While Casama is open, this device listens for your phrase and starts a live call with the bot you choose.';

  @override
  String get wakeWordListen => 'Listen for the Wake Word';

  @override
  String get wakeWordPhrase => 'Phrase';

  @override
  String get wakeWordPhraseHelp => 'Two or three words, like \"hey casama\"';

  @override
  String get wakeWordBot => 'Call this bot';

  @override
  String get wakeWordDownloading => 'Downloading the on-device model…';

  @override
  String get wakeWordTest => 'Test phrase';

  @override
  String get wakeWordTesting => 'Listening… say your phrase';

  @override
  String get wakeWordHeard => 'Heard!';

  @override
  String get wakeWordStopTest => 'Stop';

  @override
  String get wakeWordPrivacy =>
      'Listening happens on this device with an open-source model (about 18 MB, downloaded once). Nothing is sent anywhere until the call starts.';

  @override
  String get secretStore => 'Where Secrets Are Kept';

  @override
  String get secretStoreVault => 'This server\'s vault';

  @override
  String get secretStoreHelp =>
      'Keep bots\' named secrets in your own Infisical project. Casama keeps only each secret\'s name and where it may be used.';

  @override
  String get secretStoreSite => 'Infisical address';

  @override
  String get secretStoreProject => 'Project ID';

  @override
  String get secretStoreEnv => 'Environment';

  @override
  String get secretStoreClientId => 'Machine identity client ID';

  @override
  String get secretStoreClientSecret => 'Client secret';

  @override
  String get secretStoreMove => 'Move Current Secrets into Infisical';

  @override
  String get secretStoreBack => 'Use This Server\'s Vault Again';

  @override
  String get localServer => 'Run Casama on This Computer';

  @override
  String get setupTitleMac => 'Set Up Casama on This Mac';

  @override
  String get setupTitle => 'Set Up Casama on This Computer';

  @override
  String get setupEntryMac => 'Run on This Mac';

  @override
  String get setupEntry => 'Run on This Computer';

  @override
  String get setupEntryHelp =>
      'Your own private server on this computer. Free for personal use.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Server';

  @override
  String get setupStepAccount => 'Account';

  @override
  String get setupStepModel => 'AI model';

  @override
  String get setupStepPhone => 'Phone';

  @override
  String get setupDockerChecking => 'Checking Docker…';

  @override
  String get setupDockerMissingTitle => 'First, install Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'Casama\'s server runs inside Docker Desktop, a free app that keeps it separate from the rest of your Mac.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Casama\'s server runs inside Docker, which keeps it separate from the rest of your computer.';

  @override
  String get setupDockerGetMac => 'Download Docker Desktop';

  @override
  String get setupDockerGetLinux => 'Open Docker\'s Install Guide';

  @override
  String get setupDockerStep1 =>
      'Open the file that downloads and drag Docker to Applications.';

  @override
  String get setupDockerStep2 => 'Open Docker and accept its terms.';

  @override
  String get setupDockerStep3 =>
      'Come back here. This page continues by itself.';

  @override
  String get setupDockerWaiting => 'Waiting for Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker needs to be running';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker is installed but not open. Once it has started, which can take a minute, this page continues by itself.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker is installed but not running. Start it with this command, and this page continues by itself.';

  @override
  String get setupDockerOpen => 'Open Docker';

  @override
  String get setupDockerOpening => 'Starting Docker…';

  @override
  String get setupDockerPermissionTitle => 'Docker needs your permission';

  @override
  String get setupDockerPermissionBody =>
      'Docker is running, but your user isn\'t allowed to use it. Run this command, then log out and back in.';

  @override
  String get setupDockerComposeTitle => 'Docker is missing Compose';

  @override
  String get setupDockerComposeBody =>
      'This Docker has no Compose v2. Docker Desktop includes it; on Linux, install the docker-compose-plugin package.';

  @override
  String get setupStepSkipped => 'Skipped';

  @override
  String get setupArtDocker => 'First, the box your server lives in.';

  @override
  String get setupArtServer => 'Building your home. This is the long part.';

  @override
  String get setupArtAccount => 'Your server is running!';

  @override
  String get setupArtModel => 'Now give it a brain.';

  @override
  String get setupArtPhone => 'Last step: bring it with you.';

  @override
  String get setupDockerSlowTitle => 'Taking a while?';

  @override
  String get setupDockerSlowMenuBar =>
      'Look for the whale in the menu bar. Docker is ready when it stops moving.';

  @override
  String get setupDockerSlowTerms =>
      'If Docker shows a window asking you to accept its terms, finish that first. Signing in to Docker is optional.';

  @override
  String get setupDockerSlowRestart =>
      'Still stuck? Quit Docker from its menu, then press Check Again.';

  @override
  String get setupDockerSlowInstalled =>
      'Already installed it? Open Docker once from Applications so it can set itself up.';

  @override
  String get setupDockerSlowOther =>
      'Using OrbStack or Colima instead? Start it. Casama works with any Docker that answers docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Run docker info in a terminal to see what Docker says.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker said: $detail';
  }

  @override
  String get setupDockerRecheck => 'Check Again';

  @override
  String get setupDockerGuide => 'Troubleshooting Guide';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Only $gb GB of disk space is free. The server needs about $need GB.';
  }

  @override
  String get setupServerTitle => 'Download and start your server';

  @override
  String get setupServerBody =>
      'A download of about 2.5 GB that takes 5 to 10 minutes the first time, and about 10 GB of disk once it\'s set up. You can keep using your computer.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'A $download GB download, then about $disk GB of disk once it\'s set up. The first time takes 5 to 10 minutes. You can keep using your computer.';
  }

  @override
  String get setupServerBodyNothing =>
      'Everything it needs is already on this computer, so it starts in a minute or two.';

  @override
  String get setupServerStart => 'Start';

  @override
  String get setupServerStageDownload => 'Downloading the server';

  @override
  String get setupServerStagePrepare => 'Getting it ready';

  @override
  String get setupServerStageParts => 'Downloading its parts';

  @override
  String setupServerDownloaded(int megabytes) {
    return '$megabytes MB so far';
  }

  @override
  String get setupServerStagePartsNote => 'The longest step';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$done of $total downloaded so far';
  }

  @override
  String get setupServerStageStart => 'Starting it';

  @override
  String get setupServerStageWait => 'Waiting for it to answer';

  @override
  String get setupServerKeepOpen => 'Keep Casama open until this finishes.';

  @override
  String get setupServerFailed => 'The server didn\'t start.';

  @override
  String get setupServerConnecting => 'Ready. Connecting…';

  @override
  String get setupShowDetails => 'Show Details';

  @override
  String get setupHideDetails => 'Hide Details';

  @override
  String get setupAccountTitle => 'Create your account';

  @override
  String get setupAccountBody =>
      'It lives on this computer only, and it owns this server. No email is sent.';

  @override
  String get setupAccountName => 'Your name';

  @override
  String get setupAccountNameMissing => 'Enter your name';

  @override
  String get setupAccountCreate => 'Create Account';

  @override
  String get setupAccountHave => 'I Already Have an Account Here';

  @override
  String get setupAccountNew => 'Create a New Account Instead';

  @override
  String get setupAccountSignInTitle => 'Sign in to your server';

  @override
  String get setupAccountSignInBody =>
      'Use the account you made on this server.';

  @override
  String get setupAccountClosed =>
      'This server already has its owner. Sign in with that account.';

  @override
  String get setupAccountPreparing => 'Getting your space ready…';

  @override
  String get setupModelTitle => 'Give your bots a model';

  @override
  String get setupModelBody =>
      'Bots need an AI model to think with. Sign in with a ChatGPT plan, or paste a key from OpenRouter, Google or another provider.';

  @override
  String get setupSkip => 'Skip for Now';

  @override
  String get setupPhoneTitle => 'Connect your phone';

  @override
  String get setupPhoneBody =>
      'Casama Link gives this computer a private address, so your phone reaches it from anywhere. You approve it once with a free Casama Cloud account. Your chats stay on this computer.';

  @override
  String get setupPhoneTurnOn => 'Give This Computer an Address';

  @override
  String get setupPhoneScanTitle => 'Scan this with your phone\'s camera';

  @override
  String get setupPhoneScanBody =>
      'It opens Casama on the phone and signs you in. If Casama isn\'t on the phone yet, the page that opens says where to get it.';

  @override
  String get setupPhoneWaiting => 'Waiting for your phone…';

  @override
  String get setupPhoneConnected => 'Phone connected';

  @override
  String get setupPhoneConnectedBody =>
      'Your phone is signed in. Show a new code to add another device.';

  @override
  String get setupPhoneOwnerOnly =>
      'Only this server\'s owner can give it an address.';

  @override
  String get setupFinish => 'Finish';

  @override
  String get setupCardTitle => 'Finish setting up';

  @override
  String get setupCardModel => 'Add an AI model so your bots can answer.';

  @override
  String get setupCardPhone => 'Connect your phone to this computer.';

  @override
  String get setupCardOpen => 'Continue Setup';

  @override
  String get desktopUsers => 'Desktop users at once';

  @override
  String get desktopUsersHelp =>
      'Bots on this team computer share one screen. Others wait (and keep working with the shell, files and browser) while it\'s in use.';

  @override
  String desktopUsersCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String deviceAccessAsk(String kind, String bot) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '$bot would like to use your calendar',
      'reminders': '$bot would like to use your reminders',
      'contacts': '$bot would like to use your contacts',
      'places': '$bot would like to use your places',
      'photos': '$bot would like to use your photos',
      'health': '$bot would like to use your health data',
      'notifications': '$bot would like to use your notifications',
      'activity': '$bot would like to use your computer activity',
      'browserTab': '$bot would like to use your current browser tab',
      'browserHistory':
          '$bot would like to use your browser history and bookmarks',
      'alarm': '$bot would like to use your alarms',
      'home': '$bot would like to use your Home accessories',
      'other': '$bot would like to use your device data',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Only in your own chats. You can stop it any time in Settings → Device connections.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Allowed to use your calendar',
      'reminders': 'Allowed to use your reminders',
      'contacts': 'Allowed to use your contacts',
      'places': 'Allowed to use your places',
      'photos': 'Allowed to use your photos',
      'health': 'Allowed to use your health data',
      'notifications': 'Allowed to use your notifications',
      'activity': 'Allowed to use your computer activity',
      'browserTab': 'Allowed to use your current browser tab',
      'browserHistory': 'Allowed to use your browser history and bookmarks',
      'alarm': 'Allowed to use your alarms',
      'home': 'Allowed to use your Home accessories',
      'other': 'Allowed to use your device data',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Not shared';

  @override
  String get deviceKindCalendar => 'calendar';

  @override
  String get deviceKindReminders => 'reminders';

  @override
  String get deviceKindContacts => 'contacts';

  @override
  String get deviceKindPlaces => 'places';

  @override
  String get deviceKindPhotos => 'photos';

  @override
  String get deviceKindHealth => 'health data';

  @override
  String get deviceKindNotifications => 'notifications';

  @override
  String get deviceKindActivity => 'computer activity';

  @override
  String get deviceKindBrowserTab => 'current browser tab';

  @override
  String get deviceKindBrowserHistory => 'browser history and bookmarks';

  @override
  String get deviceKindAlarm => 'alarms';

  @override
  String get deviceKindHome => 'Home accessories';

  @override
  String get deviceBrowserAsks => 'What Bots May Ask Your Browser';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama for Chrome answers these live and nothing is kept. Turn them on or off in the extension\'s settings.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Stop letting $bot ask';
  }

  @override
  String get deviceConnections => 'Device connections';

  @override
  String get deviceConnectionsHelp =>
      'Share data from this device with your bots. Each kind is off until you turn it on, and only bots you allow can read it, only in your own chats.';

  @override
  String get deviceConnectionsNone =>
      'This device can\'t share data yet. On your phone, open Casama and turn on what you\'d like to share.';

  @override
  String get deviceKeepFor => 'Keep for';

  @override
  String get deviceKeepLiveOnly => 'Live only';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Private Models Only';

  @override
  String get devicePrivateModelHelp => 'Only bots on a local model can read it';

  @override
  String get deviceNoBots =>
      'No bots yet. A bot asks when it needs this, or allow one now.';

  @override
  String get deviceAllowBot => 'Allow a bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Which bot may read your calendar?',
      'reminders': 'Which bot may read your reminders?',
      'contacts': 'Which bot may read your contacts?',
      'places': 'Which bot may read your places?',
      'photos': 'Which bot may read your photos?',
      'health': 'Which bot may read your health data?',
      'notifications': 'Which bot may read your notifications?',
      'activity': 'Which bot may read your computer activity?',
      'browserTab': 'Which bot may read your current browser tab?',
      'browserHistory':
          'Which bot may read your browser history and bookmarks?',
      'alarm': 'Which bot may read your alarms?',
      'home': 'Which bot may read your Home accessories?',
      'other': 'Which bot may read your device data?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama doesn\'t have permission. Allow it in the system settings, then try again.';

  @override
  String get deviceOtherDevices => 'Your Other Devices';

  @override
  String get deviceForget => 'Forget this device';

  @override
  String get deviceBrowsers => 'Browsers Bots Can Use';

  @override
  String get deviceBrowsersHelp =>
      'Paired in Casama for Chrome. Bots you allowed work there in their own tab group, signed in as you.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '1 bot',
      zero: 'No bots yet',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Online';

  @override
  String get deviceBrowserOffline => 'Offline';

  @override
  String get deviceBrowserUnpair => 'Unpair this browser';

  @override
  String get deviceBrowserAllBots => 'All bots';

  @override
  String get deviceChromeNotPaired => 'Casama for Chrome: not paired';

  @override
  String get deviceChromeHowToPair =>
      'Install Casama for Chrome, sign in, then open More → “Let bots use this browser”.';

  @override
  String get deviceConnectionsRowHelp =>
      'Calendar, contacts and more from this device';

  @override
  String get healthExtraCycle => 'Cycle tracking';

  @override
  String get healthExtraGlucose => 'Blood glucose';

  @override
  String get healthExtraBloodPressure => 'Blood pressure';

  @override
  String get appleHealth => 'Apple Health';

  @override
  String get appleHealthAbout =>
      'Reads daily summaries of your sleep, activity, workouts and heart from Apple Health (HealthKit), only when this is on. Casama never writes to Apple Health.';

  @override
  String get healthNotMedical =>
      'Daily summaries only (sleep, activity, workouts, heart). Bots describe how you compare with your usual and never give medical advice.';

  @override
  String get healthNeedsEncryption =>
      'Health data needs encryption at rest. Turn it on for a workspace you own, then try again.';

  @override
  String get placeAddHere => 'Add Where I Am Now';

  @override
  String get placeName => 'Name this place (Home, Work, Gym)';

  @override
  String get placeNoLocation =>
      'Your location isn\'t available. Allow location for Casama, then try again.';

  @override
  String get placesHelp =>
      'Bots hear when you arrive at or leave these places. Only the place name and the time are shared, never your route.';

  @override
  String get watchedAppsHelp =>
      'Only notifications from these apps are shared. One-time codes are hidden before anything leaves your phone.';

  @override
  String get watchedAppAdd => 'Add an app (name or package id)';

  @override
  String get providerHintMaps => 'travel times for leave-now';

  @override
  String routineDevice(String event, String detail) {
    return 'On your phone: $event $detail';
  }

  @override
  String get ctxSelection => 'Selected Text';

  @override
  String get ctxAddScreenshot => 'Add a Screenshot';

  @override
  String get ctxScreenshotAdded => 'Screenshot Added';

  @override
  String get ctxScreenshotFailed =>
      'Couldn\'t take a screenshot. Allow screen recording for Casama in your system settings.';

  @override
  String get watchedFolders => 'Watched Folders';

  @override
  String get watchedFoldersHelp =>
      'A new file in one of these folders can start a routine (for example, file new PDFs in Downloads). Only its name is shared; bots read the file only if they work on this computer.';

  @override
  String get whyTitle => 'Why am I seeing this?';

  @override
  String whyData(String data) {
    return 'Used: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Urgency: $urgency';
  }

  @override
  String get heldMeeting =>
      'It waited while you were in a meeting and came with your brief.';

  @override
  String get heldFocus =>
      'It waited while Focus was on and came with your brief.';

  @override
  String get heldDriving =>
      'It waited while you were driving and came with your brief.';

  @override
  String get heldCap =>
      'The bot had already sent 5 messages today, so this one waited for your brief.';

  @override
  String get heldLow =>
      'It wasn\'t urgent, so it waited for your brief instead of buzzing your phone.';

  @override
  String get lessLikeThis => 'Less like this';

  @override
  String get lessLikeThisDone => 'Got It, Fewer Like This';

  @override
  String get widgetStatusWorking => 'Working…';

  @override
  String get widgetStatusOff => 'Turned off';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner => 'Suspended by the instance owner';

  @override
  String get previewHi => 'Hi!';

  @override
  String get previewAsk => 'Can you tidy up my notes?';

  @override
  String get previewOnIt => 'On it';

  @override
  String get previewDone => 'Done! They are in three folders now.';

  @override
  String get previewMessage => 'Message';

  @override
  String get fontPreviewGreeting => 'Good morning';

  @override
  String get photosFromUnsplash => 'Photos from Unsplash';

  @override
  String get showBotSteps => 'Show the bot\'s steps';

  @override
  String get showBotStepsHelp => 'Commands and technical errors in every chat.';

  @override
  String get showScreenCard => 'Show the bot\'s screen while it works';

  @override
  String get showScreenCardHelp =>
      'A small live card in the chat. Tap it to watch full screen.';

  @override
  String get showReplyUsage => 'Show usage on replies';

  @override
  String get showReplyUsageHelp => 'What each reply cost, in a line under it.';

  @override
  String get openLinksInApp => 'Open links in the app';

  @override
  String get openLinksInAppHelp =>
      'Web links open in a browser inside Casama. Off: they open in your default browser.';

  @override
  String replyUsageTokens(String count) {
    return '$count tokens';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount on your keys';
  }

  @override
  String get replyUsageOnPlan => 'On your ChatGPT plan';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount so far';
  }

  @override
  String get replyUsageTooltip => 'What this reply cost';

  @override
  String get replyUsageTitle => 'What this reply cost';

  @override
  String get replyUsageFromCredits => 'From your credits';

  @override
  String get replyUsageYourKeys => 'On your own keys';

  @override
  String get replyUsageTotal => 'Total';

  @override
  String get replyUsageTime => 'Time';

  @override
  String get replyUsageTokensLabel => 'Tokens';

  @override
  String get replyUsageSteps => 'Steps';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Includes $n helper runs',
      one: 'Includes 1 helper run',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'Nothing was metered for this reply.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 credit = $price. Your own keys and plans are billed by their provider, not by Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Open the run';

  @override
  String get replyUsageLoadFailed => 'Couldn\'t load this reply\'s usage.';

  @override
  String get replyUsageOurCost => 'Our cost';

  @override
  String get replyUsageMargin => 'Margin';

  @override
  String replyUsageItemCost(String amount) {
    return 'Our cost $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Our cost and margin are shown to you because you run this server. Nobody else sees them.';

  @override
  String get kindSpeechToText => 'Voice to text';

  @override
  String get kindVoice => 'Voice calls';

  @override
  String get kindImages => 'Images';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Web searches';

  @override
  String get kindData => 'Data lookups';

  @override
  String get kindPhone => 'Phone calls';

  @override
  String get kindApps => 'App actions';

  @override
  String get activityReady => 'Getting ready…';

  @override
  String get activitySearching => 'Searching the web…';

  @override
  String get activityBrowsing => 'Browsing the web…';

  @override
  String get activityComputer => 'Working on its computer…';

  @override
  String get activityFiles => 'Going through files…';

  @override
  String get activityImage => 'Making an image…';

  @override
  String get activityVideo => 'Making a video…';

  @override
  String get activityMemory => 'Checking what it knows…';

  @override
  String get activityApps => 'Using your apps…';

  @override
  String get activityScheduling => 'Setting up a schedule…';

  @override
  String get activityWorking => 'Working on it…';

  @override
  String get activityWaitingForScreen =>
      'Waiting for you to hand back the screen…';

  @override
  String get runFailedPlain =>
      'Something went wrong. Try again, or open Details to see why.';

  @override
  String get newKeyTitle => 'Copy your new key';

  @override
  String get newKeyHelp =>
      'It\'s shown only this once. Paste it into the app you\'re connecting, then tap Done.';

  @override
  String get copyKey => 'Copy Key';

  @override
  String get keyCopied => 'Key copied';

  @override
  String revokeApiKeyTitle(String name) {
    return 'Revoke “$name”?';
  }

  @override
  String get revokeApiKeyBody =>
      'Apps using this key stop connecting right away. This can\'t be undone; to reconnect, make a new key.';

  @override
  String unlinkTitle(String name) {
    return 'Unlink “$name”?';
  }

  @override
  String get unlinkBody =>
      'The bots stop talking to each other right away. Linking them again needs a new invite.';

  @override
  String get alreadyMember => 'You\'re already in this workspace.';

  @override
  String get askAdminToInvite =>
      'Only owners and admins can invite people. Ask one of them for an invite link.';

  @override
  String get askBeforeJoining => 'Ask Me Before People Join';

  @override
  String get askBeforeJoiningHelp =>
      'An admin approves each person who uses the link.';

  @override
  String get askToJoin => 'Ask to join';

  @override
  String get customLinks => 'Custom links';

  @override
  String get customLinksHelp =>
      'Links with their own role, expiry or number of uses.';

  @override
  String get emailAddresses => 'Email addresses';

  @override
  String get emailAddressesHelp =>
      'Paste one or more, separated by commas or new lines.';

  @override
  String get getCode => 'Get a Code';

  @override
  String get getNewCode => 'Get a New Code';

  @override
  String get getStarted => 'Get Started';

  @override
  String get welcomeCta => 'Let\'s Go';

  @override
  String get inviteAsAdmin => 'Invite as Admins';

  @override
  String get inviteByEmail => 'Invite by Email';

  @override
  String get inviteExpired => 'Expired';

  @override
  String inviteExpires(String when) {
    return 'Expires $when';
  }

  @override
  String get inviteInvalid => 'This invite doesn\'t work';

  @override
  String get inviteInvalidHelp =>
      'It may have expired, been used up or been turned off. Ask for a new one.';

  @override
  String get inviteLink => 'Invite link';

  @override
  String get inviteLinkApprovalHelp =>
      'Anyone with this link can ask to join. You approve them below.';

  @override
  String get inviteLinkHelp =>
      'Anyone with this link can join as a member. Share it in a chat or email.';

  @override
  String get inviteLinkOrCode => 'Invite link or code';

  @override
  String inviteOtherServer(String host) {
    return 'This invite is for $host, and this app is connected to a different server.';
  }

  @override
  String get inviteRenewed =>
      'The invite works for 7 more days. Send them the new link.';

  @override
  String inviteSentTo(String email) {
    return 'Sign in with $email to accept.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Join $workspace on Casama: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name invited you to join';
  }

  @override
  String get invitedToJoin => 'You\'re invited to join';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString invites sent.',
      one: 'Invite sent.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'You\'ll join as an admin';

  @override
  String get joinAsMember => 'You\'ll join as a member';

  @override
  String get joinByDomain => 'Join by Email Domain';

  @override
  String get joinByDomainHelp => 'Verified addresses join without an invite.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Anyone with a verified @$domain email can join';
  }

  @override
  String get joinByDomainUnavailable =>
      'Available when you sign in with a verified work email (not gmail.com and the like).';

  @override
  String get joinNeedsApproval =>
      'An admin approves new people before they join.';

  @override
  String get joinRequestSent => 'Request sent';

  @override
  String joinRequestSentHelp(String name) {
    return 'An admin of $name will look at it. You\'ll get a notification when you\'re in.';
  }

  @override
  String get joinWithLinkOrCode => 'Join with a link or code';

  @override
  String get spacesInvite => 'Invite people';

  @override
  String spacesInviteTo(String name) {
    return 'To $name';
  }

  @override
  String get spacesNew => 'New workspace';

  @override
  String get spacesNewHint => 'Its own bots, people and billing';

  @override
  String get spacesJoin => 'Join a workspace';

  @override
  String get spacesJoinHint => 'With an invite link or code';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Join $name';
  }

  @override
  String get joinedBotsHelp =>
      'These bots are here to help. Say hello to one to get started.';

  @override
  String get joinedNoBots =>
      'There are no bots here yet. Make one, or look around first.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Members';

  @override
  String openToDomain(String domain) {
    return 'Open to @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Open $name';
  }

  @override
  String get pendingInvites => 'Invites Not Accepted Yet';

  @override
  String get people => 'People';

  @override
  String get workspaceAdvancedSummary =>
      'Secrets, memory, encryption, payments, MCP';

  @override
  String get peopleAdvancedSummary => 'Invite code, email domain, custom links';

  @override
  String get inviteLinkToCopy => 'Invite link, ready to copy';

  @override
  String linkMade(String when) {
    return 'Made $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Charges by server, Casama Link servers and keys';

  @override
  String get billingChargesSummary => 'Charges by server';

  @override
  String get billingUsageRow => 'What bots used and what it cost';

  @override
  String billingUsageSoFar(String amount) {
    return 'This month so far: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Token counts, JSON export';

  @override
  String get peopleHelp => 'Invite people and decide who gets in.';

  @override
  String get peopleRow => 'Invite people, approve requests, see members';

  @override
  String get qrCode => 'QR Code';

  @override
  String get remove => 'Remove';

  @override
  String get resendInvite => 'Send Again';

  @override
  String get resetLink => 'Reset Link';

  @override
  String get resetLinkHelp =>
      'The current link stops working right away and you get a new one. People already in stay in.';

  @override
  String get revokeInvite => 'Cancel Invite';

  @override
  String scanToJoin(String name) {
    return 'Scan to join $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Send $countString Invites';
  }

  @override
  String get sendInvitesYourself => 'Send these invites yourself';

  @override
  String get sendInvitesYourselfHelp =>
      'Email isn\'t set up on this server. Send each person their link, and they sign in with that address to join.';

  @override
  String get signInToJoin => 'Sign in to join';

  @override
  String get startOwnWorkspace => 'Start My Own Workspace Instead';

  @override
  String switchToServer(String host) {
    return 'Switch to $host';
  }

  @override
  String get waitingToJoin => 'Waiting to Join';

  @override
  String welcomeToWorkspace(String name) {
    return 'Welcome to $name';
  }

  @override
  String get workspacesYouCanJoin => 'Workspaces You Can Join';

  @override
  String get yourTeamIsHere => 'Your team is already here';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'People at $domain use these workspaces. Join one, or start your own.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Easy to read out or type. Works for 48 hours. People enter it under Join with a link or code.';

  @override
  String get inviteSomeoneNew => 'Invite someone new to the workspace';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app only signs in on a secure (https) address, and this Casama server is at $address. Serve Casama over https to use sign-in.';
  }

  @override
  String get aboutYou => 'About you';

  @override
  String get aboutYouRow => 'What your bots call you and know about you';

  @override
  String get aboutYouIntro =>
      'Your bots read this so they can call you by name and answer the way you like. Only you can see it.';

  @override
  String get photoChange => 'Change profile photo';

  @override
  String get photoTake => 'Take a Photo';

  @override
  String get photoChoose => 'Choose a Photo';

  @override
  String get photoUseGoogle => 'Use My Google Photo';

  @override
  String get photoRemove => 'Remove Photo';

  @override
  String get photoUnreadable =>
      'That file isn\'t a photo Casama can use. Try a JPEG or PNG.';

  @override
  String get whatToCallYou => 'What should bots call you?';

  @override
  String get pronounsOptional => 'Pronouns (optional)';

  @override
  String get aboutMe => 'About me';

  @override
  String get aboutMeHint =>
      'Your work, the people in your life, what you\'re into. Anything that helps.';

  @override
  String get replyStyle => 'How I like replies';

  @override
  String get replyStyleHint =>
      'For example: short answers, no emoji, explain things like I\'m new to them';

  @override
  String get learnAboutMe => 'Learn About Me from Chats';

  @override
  String get learnAboutMeHelp =>
      'Bots save facts about you. Edit them any time.';

  @override
  String get adultSites => 'Adult sites';

  @override
  String get adultSitesHelp =>
      'Bots may open adult websites when you ask. 18 or older only.';

  @override
  String get adultSitesConfirmTitle => 'Turn on adult sites?';

  @override
  String get adultSitesConfirmBody =>
      'You confirm you\'re 18 or older. When you ask, bots may open adult websites for you and list what\'s there as text. It works when you ask from Casama on the web or the desktop app, never in shared chats.';

  @override
  String get adultSitesConfirm => 'I\'m 18 or older';

  @override
  String get adultSitesApprovalDetail =>
      'Allow means you confirm you\'re 18 or older and turn on adult sites for your account. You can turn it off in About you.';

  @override
  String useInThisSpace(String workspace) {
    return 'Use what I\'ve shared in $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Off: only your name and reply style are used here.';

  @override
  String get learnedAboutYou => 'What Bots Learned';

  @override
  String get noLearnedFacts =>
      'Nothing yet. Facts bots learn about you in chat show up here.';

  @override
  String get addFact => 'Add a Fact';

  @override
  String get editFact => 'Edit fact';

  @override
  String get deleteFactTitle => 'Delete this fact?';

  @override
  String get deleteFactConfirm => 'Your bots won\'t know it anymore.';

  @override
  String get importToProfile => 'Import from ChatGPT or Claude';

  @override
  String get savedToProfile => 'Saved to your profile';

  @override
  String get undo => 'Undo';

  @override
  String get suggestedLookApplied => 'New theme applied';

  @override
  String get suggestedLookUnavailable => 'This app doesn\'t have that theme';

  @override
  String get removedFromProfile => 'Removed from your profile';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString facts',
      one: '1 fact',
    );
    return 'Added $_temp0';
  }

  @override
  String get nameCardHelp =>
      'Your bots will use it in every workspace. You can change it later in Settings → About you.';

  @override
  String get nameStepBubble => 'Nice to meet you!';

  @override
  String get heardFromTitle => 'How did you hear about us?';

  @override
  String get heardFromHelp =>
      'One tap helps us see what\'s working. You can skip it.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'A friend';

  @override
  String get heardFromSearch => 'Search';

  @override
  String get heardFromAiAssistant => 'An AI assistant';

  @override
  String get heardFromOther => 'Other';

  @override
  String get heardFromSkip => 'Skip';

  @override
  String get nameStepHint => 'Your name';

  @override
  String get skillCatalogSubtitle =>
      'Ready-made skills your bots load when a task calls for one.';

  @override
  String get skillCategoryWork => 'Work';

  @override
  String get skillCategoryWriting => 'Writing';

  @override
  String get skillCategoryResearch => 'Research';

  @override
  String get skillCategoryData => 'Data';

  @override
  String get skillCategoryMoney => 'Money';

  @override
  String get skillCategoryBuild => 'Build';

  @override
  String get skillCategoryLife => 'Life';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString skills',
      one: '1 skill',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Installed';

  @override
  String skillInstalledFor(String names) {
    return 'Installed for $names';
  }

  @override
  String installSkillFor(String name) {
    return 'Install $name for';
  }

  @override
  String skillUseHint(String name) {
    return 'Bots load it on their own when a task fits, or type /$name in a chat to use it.';
  }

  @override
  String get skillInstructions => 'Instructions';

  @override
  String get skillAlreadyEverywhere => 'Installed everywhere it can be.';

  @override
  String get gallery => 'Gallery';

  @override
  String get galleryEmpty => 'Nothing in the gallery matches.';

  @override
  String get galleryOffline =>
      'The gallery can\'t be reached right now. The built-in looks and skills are still here.';

  @override
  String get galleryUse => 'Use';

  @override
  String get galleryInstall => 'Install';

  @override
  String get galleryReport => 'Report';

  @override
  String get galleryShare => 'Share to Gallery';

  @override
  String galleryBy(String name) {
    return 'By $name';
  }

  @override
  String get galleryFeatured => 'Featured';

  @override
  String get galleryAll => 'All';

  @override
  String get galleryThemes => 'Themes';

  @override
  String get gallerySchemes => 'Colors';

  @override
  String get galleryWallpapers => 'Wallpapers';

  @override
  String get gallerySkills => 'Skills';

  @override
  String get fromGallery => 'Gallery';

  @override
  String galleryApplied(String name) {
    return 'Using $name';
  }

  @override
  String get gallerySeeAll => 'See All';

  @override
  String get galleryInUse => 'In use';

  @override
  String galleryInstalled(String name) {
    return 'Installed $name';
  }

  @override
  String get galleryPreviewDark => 'Preview in dark';

  @override
  String get galleryPreviewLight => 'Preview in light';

  @override
  String get galleryClearSearch => 'Clear search';

  @override
  String get galleryOfflineTitle => 'The gallery is offline';

  @override
  String galleryNoMatches(String query) {
    return 'Nothing matches “$query”';
  }

  @override
  String get galleryInstructions => 'Instructions';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern on $palette';
  }

  @override
  String get galleryImage => 'Image';

  @override
  String get galleryMeshGradient => 'a mesh gradient';

  @override
  String get galleryOwnDoodles => 'Own doodles';

  @override
  String get galleryLightAndDark => 'Light and dark';

  @override
  String get galleryContribute =>
      'Made a look you like? Share it, and everyone on Casama can find it here.';

  @override
  String get galleryTypeTheme => 'Theme';

  @override
  String get galleryTypeScheme => 'Color scheme';

  @override
  String get galleryTypeWallpaper => 'Wallpaper';

  @override
  String get galleryTypeSkill => 'Skill';

  @override
  String get galleryBehindChats => 'Behind Your Chats';

  @override
  String celebrateNewBot(String name) {
    return 'Say hi to $name!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name is ready!';
  }

  @override
  String get celebrateJoined => 'You\'re in! Welcome to the space.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name is all set.';
  }

  @override
  String get fewerEffects => 'Fewer Effects';

  @override
  String get fewerEffectsHelp =>
      'No celebrations, bouncing tabs or animated bots.';

  @override
  String get haptics => 'Haptics';

  @override
  String get trackpadHaptics => 'Trackpad Haptics';

  @override
  String get hapticsHelp =>
      'Gentle taps when something happens or a bot needs you.';

  @override
  String get watchHaptics => 'Haptics';

  @override
  String get settingsAppSection => 'App';

  @override
  String get settingsSecuritySection => 'Sign-in & security';

  @override
  String get customize => 'Customize';

  @override
  String get customizeColors => 'Colors';

  @override
  String get appearanceCustomLook => 'Custom theme';

  @override
  String get appearanceCustomHelp =>
      'Your own changes. Save them as a theme to keep them.';

  @override
  String get appearanceFromGallery => 'From the Gallery';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Show All $countString';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Switched to $name';
  }

  @override
  String appearanceSaved(String name) {
    return 'Saved $name to your themes';
  }

  @override
  String get appearanceAboutTheme => 'About this theme';

  @override
  String settingsOnDevServer(String host) {
    return 'Settings · development server $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'You: $text';
  }

  @override
  String get chatPreviewPhoto => 'Photo';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Voice note';

  @override
  String get chatPreviewNone => 'No messages yet';

  @override
  String get chatTimeYesterday => 'Yesterday';

  @override
  String get chatDayToday => 'Today';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day at $time';
  }

  @override
  String get anyPriority => 'Any priority';

  @override
  String get readingAloud => 'Reading aloud';

  @override
  String get readAloudPreparing => 'Getting ready…';

  @override
  String get readAloudPaused => 'Paused';

  @override
  String get stopReading => 'Stop reading';

  @override
  String get readAloudSpeed => 'Playback speed';

  @override
  String readAloudTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get readAloudShowMessage => 'Show the message being read';

  @override
  String mentionOpenProfile(String name) {
    return '$name, open profile';
  }

  @override
  String get paywallSubtitle =>
      'More bots, more computer time and fresh credits every month, so your bots can keep working.';

  @override
  String get paywallPerkBots => 'Bots';

  @override
  String get paywallPerkBotsBody => 'A whole crew, each with its own job.';

  @override
  String get paywallPerkComputers => 'Computer time';

  @override
  String get paywallPerkComputersBody =>
      'Bots get their own computers to browse, code and build.';

  @override
  String get paywallPerkCredits => 'Monthly credits';

  @override
  String get paywallPerkCreditsBody => 'For models, search and tools.';

  @override
  String get paywallPerkSeats => 'Seats';

  @override
  String get paywallPerkSeatsBody => 'Bring your team into the same workspace.';

  @override
  String paywallHours(String hours) {
    return '$hours h';
  }

  @override
  String get paywallWeekly => 'Weekly';

  @override
  String get paywallMonthly => 'Monthly';

  @override
  String get paywallYearly => 'Yearly';

  @override
  String get paywallPerMonth => '/ month';

  @override
  String get paywallPerYear => '/ year';

  @override
  String get paywallContinue => 'Continue';

  @override
  String get paywallContinueCheckout => 'Continue to checkout';

  @override
  String get paywallRestore => 'Restore';

  @override
  String get paywallFineStore =>
      'Renews automatically. Cancel anytime in your store settings.';

  @override
  String get paywallFineWeb =>
      'Renews automatically. Cancel anytime from Billing.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, renewing automatically until you cancel. Payment is charged to your Apple Account. Cancel anytime in your Apple Account settings at least 24 hours before it renews.',
      'google_play':
          '$price, renewing automatically until you cancel. Payment is charged to your Google Play account. Cancel anytime in your Google Play account settings at least 24 hours before it renews.',
      'other':
          '$price, renewing automatically until you cancel. Payment is charged to your store account. Cancel anytime in your store account settings at least 24 hours before it renews.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Free for $days days, then $price, renewing automatically until you cancel.',
      one:
          'Free for 1 day, then $price, renewing automatically until you cancel.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Free for $days days, then $price, renewing automatically until you cancel.',
      one:
          'Free for 1 day, then $price, renewing automatically until you cancel.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Free for $days days, then $price, renewing automatically until you cancel.',
      one:
          'Free for 1 day, then $price, renewing automatically until you cancel.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Payment is charged to your Apple Account when the trial ends. Cancel in your Apple Account settings at least 24 hours before the trial ends and you won\'t be charged.',
      'google_play':
          '$_temp1 Payment is charged to your Google Play account when the trial ends. Cancel in your Google Play account settings at least 24 hours before the trial ends and you won\'t be charged.',
      'other':
          '$_temp2 Payment is charged to your store account when the trial ends. Cancel in your store account settings at least 24 hours before the trial ends and you won\'t be charged.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Start free trial';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days free, then $price/yr',
      one: '1 day free, then $price/yr',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days free, then $price/mo',
      one: '1 day free, then $price/mo',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, renewing automatically until you cancel. Cancel anytime from Billing; you keep the plan until the period ends.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Free for $days days, then $price, renewing automatically until you cancel.',
      one:
          'Free for 1 day, then $price, renewing automatically until you cancel.',
    );
    return '$_temp0 Cancel from Billing before the trial ends and you won\'t be charged.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price per week',
      'year': '$price per year',
      'other': '$price per month',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get aiConsentTitle => 'Your chats go to AI companies';

  @override
  String get aiConsentBody =>
      'To write replies, Casama sends what you share with your bots to outside AI providers. Nothing is sent until you agree.';

  @override
  String get aiConsentUpdatedNotice => 'We added web pages to this list.';

  @override
  String get aiConsentWhatTitle => 'What is sent';

  @override
  String get aiConsentWhat =>
      'Your messages, files and photos, your voice in calls, voice messages and dictation, what bots remember about you, the web pages your bots open for you (on their own computer or in the browser on this device), and any phone data you turn on, such as calendar or health.';

  @override
  String get aiConsentWhoTitle => 'Who gets it';

  @override
  String get aiConsentWho =>
      'OpenRouter, which passes it to the company that makes the model you use, such as DeepSeek, Google or OpenAI. Calls use Google Gemini, and OpenAI turns voice messages and dictation into text. Web searches go to Parallel, Serper or DeepSeek. With your own API key, it goes to that provider instead.';

  @override
  String get aiConsentWhyTitle => 'What they do with it';

  @override
  String get aiConsentWhy =>
      'They use it to write the reply. You can stop this any time in Settings › Privacy, and the privacy policy has the details.';

  @override
  String get aiConsentAgree => 'Agree and Continue';

  @override
  String get aiConsentTile => 'AI providers';

  @override
  String get aiConsentTileOn =>
      'Allowed. What you share with bots goes to outside AI providers to write replies.';

  @override
  String get aiConsentWithdrawQuestion => 'Stop sharing with AI providers?';

  @override
  String get aiConsentWithdrawBody =>
      'Bots can\'t reply without them. Casama asks again before anything else is sent.';

  @override
  String get aiConsentWithdraw => 'Stop Sharing';

  @override
  String get planChanged => 'Plan changed';

  @override
  String get purchasesRestored => 'Purchases restored';

  @override
  String get creditsAdded => 'Credits added';

  @override
  String get purchasePending =>
      'Waiting for the purchase to be approved. It\'s added as soon as it is.';

  @override
  String get purchaseFailed =>
      'The purchase didn\'t go through, and you weren\'t charged.';

  @override
  String get purchaseVerifyFailed =>
      'We couldn\'t confirm your purchase yet. It\'s retried on its own; if it doesn\'t show up soon, tap Restore Purchases.';

  @override
  String paywallTitleFor(String plan) {
    return 'Grow your crew with $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Welcome to $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n months free',
      one: '1 month free',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Switch to $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'You subscribe through the App Store. To change plans, use the App Store on the device you subscribed with.',
      'google_play': 'You subscribe through Google Play. To change plans, use Google Play on the device you subscribed with.',
      'other': 'You subscribe through an app store. To change plans, use that store on the device you subscribed with.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'You subscribe on the web. Change plans here with web checkout, or manage your subscription.';

  @override
  String get subscribedOutsideAppNote =>
      'Your subscription is billed outside this app, so it can\'t be changed here.';

  @override
  String get outOfCreditsTitle => 'You\'re out of credits';

  @override
  String get outOfCreditsPaidBody =>
      'Your bots pause until you add credits. Credit packs from the App Store or Google Play never expire; credit packs bought on the web last 12 months.';

  @override
  String get outOfCreditsFreeBody =>
      'Upgrade for more credits every month, more bots and more computer time.';

  @override
  String get addCredits => 'Add Credits';

  @override
  String get seePlansButton => 'See Plans';

  @override
  String get paywallAskAdmin =>
      'Only workspace owners and admins can change the plan. Ask one of them to upgrade.';

  @override
  String get upgradeToPro => 'Upgrade to Pro';

  @override
  String get upgradeToProBody =>
      'More bots, computer time and monthly credits.';

  @override
  String get manageTab => 'Manage';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Memory';

  @override
  String get vitalsDisk => 'Disk';

  @override
  String get fixItTitle => 'Not working right?';

  @override
  String get fixItSubtitle =>
      'Try these in order. Each one goes a bit further.';

  @override
  String get fixRestart => 'Restart';

  @override
  String get fixRestartHelp => 'About 20 seconds · nothing is lost';

  @override
  String get fixResetSystem => 'Reset system';

  @override
  String get fixResetSystemHelp => 'A fresh system · your files stay';

  @override
  String get fixErase => 'Erase everything';

  @override
  String get fixEraseHelp => 'Like new · can be undone for 7 days';

  @override
  String get fixResetAction => 'Reset…';

  @override
  String get fixEraseAction => 'Erase…';

  @override
  String get computerRestarting => 'Restarting…';

  @override
  String get computerRestarted => 'Restarted. Your files are all there.';

  @override
  String get computerUpdateTitle => 'Update available';

  @override
  String get computerUpdateBody =>
      'New tools and fixes are ready. Updating restarts this computer: your files stay, open windows and running programs close.';

  @override
  String get computerUpdateBotWorking =>
      'A bot is working on this computer right now. Updating stops what it\'s doing.';

  @override
  String get computerUpdateNow => 'Update now';

  @override
  String get computerUpdateLater => 'Later';

  @override
  String get computerUpdateConfirmTitle => 'Update this computer?';

  @override
  String get computerUpdateMenu => 'Update computer';

  @override
  String get computerUpdating => 'Updating…';

  @override
  String get computerUpdated => 'Updated. Your files are all there.';

  @override
  String get computerUpdateBusyTitle => 'A command is still running';

  @override
  String get computerUpdateBusyBody =>
      'Updating now stops it. Wait until it\'s done, or update anyway.';

  @override
  String get computerUpdateAnyway => 'Update anyway';

  @override
  String resetSheetTitle(String name) {
    return 'Reset $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots can\'t use it for about a minute.';
  }

  @override
  String get resetSheetBusyNone => 'It can\'t be used for about a minute.';

  @override
  String get resetOptionSystem => 'Reset system, keep my files';

  @override
  String get resetOptionSystemHelp =>
      'Fixes broken installs, settings and stuck programs.';

  @override
  String get resetOptionErase => 'Erase everything';

  @override
  String get resetOptionEraseHelp => 'Back to a brand-new computer.';

  @override
  String get resetKept => 'Kept';

  @override
  String get resetRemoved => 'Removed';

  @override
  String get resetKeptFiles => 'Your files in workspace';

  @override
  String get resetKeptSettings => 'Name, settings and bots';

  @override
  String get resetKeptRestorePoints => 'Restore points';

  @override
  String get resetRemovedApps => 'Apps and tools you installed';

  @override
  String get resetRemovedPrograms => 'Running programs';

  @override
  String get resetRemovedCaches => 'Caches and home folder settings';

  @override
  String get resetRemovedFiles => 'Every file, workspace too';

  @override
  String get resetSavePoint => 'Save a restore point first';

  @override
  String get resetSavePointHelp => 'So you can undo this for 7 days';

  @override
  String eraseTypeName(String name) {
    return 'Type $name to confirm';
  }

  @override
  String get resetConfirmSystem => 'Reset system';

  @override
  String get resetConfirmErase => 'Erase everything';

  @override
  String get resetStepSaving => 'Saving a restore point';

  @override
  String get resetStepWipingSystem => 'Removing apps and settings';

  @override
  String get resetStepWipingErase => 'Erasing every file';

  @override
  String get resetStepRestarting => 'Starting a fresh system';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Resetting… $stepString of $totalString';
  }

  @override
  String erasingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Erasing… $stepString of $totalString';
  }

  @override
  String get resetLeaveHint =>
      'You can leave this screen. It keeps going on its own.';

  @override
  String get resetDone => 'Fresh system ready';

  @override
  String get eraseDone => 'Computer erased';

  @override
  String get resetFailed => 'The reset didn\'t finish';

  @override
  String get resetUndoHint =>
      'Undo puts everything back the way it was. The restore point stays for 7 days.';

  @override
  String get restoredPrevious => 'Put back the way it was';

  @override
  String get usageThisMonth => 'This month';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString h $minutesString m';
  }

  @override
  String get usageCostNote =>
      'Charged only while it\'s on. Asleep costs nothing.';

  @override
  String get usageNone => 'Not used yet this month';

  @override
  String get sleepTimerTitle => 'Goes to sleep after';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString min';
  }

  @override
  String get sleepTimerHour => '1 hour';

  @override
  String get sleepTimerHelp =>
      'Never while a bot is working or you\'re using it. A longer wait keeps it on longer, which costs more.';

  @override
  String sleepTimerSaved(String label) {
    return 'Sleeps after $label without activity';
  }

  @override
  String get storageTitle => 'Storage';

  @override
  String storageOf(String total) {
    return 'of $total';
  }

  @override
  String get storageFiles => 'Your files';

  @override
  String get storageApps => 'Apps and tools';

  @override
  String get storageCaches => 'Caches';

  @override
  String get storageBrowser => 'Browser';

  @override
  String get storageOther => 'Other';

  @override
  String get storageFree => 'Free';

  @override
  String storageFreeUp(String size) {
    return 'Free up $size';
  }

  @override
  String get storageNothingToClean => 'No caches to clear';

  @override
  String storageFreed(String size) {
    return 'Freed $size';
  }

  @override
  String get storageAsleep => 'Wake the computer to see what takes up space.';

  @override
  String get processesTitle => 'Running now';

  @override
  String get processesNone => 'Nothing is running besides the computer itself.';

  @override
  String get processesAsleep => 'Nothing runs while it sleeps.';

  @override
  String get processStop => 'Stop';

  @override
  String processStopTitle(String name) {
    return 'Stop $name?';
  }

  @override
  String get processStopMessage => 'Anything it hasn\'t saved is lost.';

  @override
  String processStopped(String name) {
    return 'Stopped $name';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu% CPU · $memory';
  }

  @override
  String get usedByTitle => 'Used by';

  @override
  String get usedByNone => 'No bot uses this computer yet.';

  @override
  String botLastActive(String when) {
    return 'Active $when';
  }

  @override
  String get botNeverActive => 'Not active yet';

  @override
  String get restorePointsTitle => 'Restore points';

  @override
  String get restorePointsNone =>
      'None yet. Bots save one before risky changes.';

  @override
  String get restorePointSaveNow => 'Save a restore point now';

  @override
  String get restorePointSaveTitle => 'Save a restore point';

  @override
  String get restorePointDefaultLabel => 'Saved by hand';

  @override
  String get restorePointSaved => 'Restore point saved';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Show all $nString';
  }

  @override
  String get historyTitle => 'History';

  @override
  String get historyNone => 'Nothing has happened yet.';

  @override
  String get historyStarted => 'Woke up';

  @override
  String get historySlept => 'Went to sleep';

  @override
  String get historySleptIdle => 'Went to sleep (no activity)';

  @override
  String get historyRestarted => 'Restarted';

  @override
  String get historyReset => 'Reset the system';

  @override
  String get historyErased => 'Erased everything';

  @override
  String get historyCheckpointCreated => 'Saved a restore point';

  @override
  String get historyCheckpointRestored => 'Restored a restore point';

  @override
  String historyStorageCleaned(String size) {
    return 'Freed up $size';
  }

  @override
  String get historyStorageCleanedPlain => 'Freed up space';

  @override
  String historyProcessStopped(String name) {
    return 'Stopped $name';
  }

  @override
  String get historyUpdated => 'Changed its settings';

  @override
  String get historyYou => 'you';

  @override
  String get yourDataTitle => 'Your data';

  @override
  String get downloadAllFiles => 'Download all files';

  @override
  String get downloadAllFilesHelp => 'A .zip of everything in workspace';

  @override
  String get downloadNothing => 'There are no files to download yet.';

  @override
  String get deleteComputerHelp => 'Removes it and its restore points';

  @override
  String get manageComputer => 'Manage';

  @override
  String get restartComputer => 'Restart';

  @override
  String get resetComputerMenu => 'Reset…';

  @override
  String get moreFixes => 'More fixes';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString min';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString h';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString d';
  }

  @override
  String get remoteUpdateTitle => 'Time to update Casama';

  @override
  String get remoteUpdateBody =>
      'This version of Casama is no longer supported. Update it to keep going.';

  @override
  String get remoteUpdateNoLink =>
      'This version of Casama is no longer supported. Update it from where you installed it.';

  @override
  String get remoteMaintenanceTitle => 'Casama is down for maintenance';

  @override
  String get openLink => 'Open';

  @override
  String get routineIdeas => 'Ideas';

  @override
  String get routineIdeasHelp => 'Start from an idea, then change anything.';

  @override
  String get pluginDirectory => 'Reviewed plugins';

  @override
  String get pluginDirectoryHelp =>
      'Checked by Casama and pinned to the version that was checked.';

  @override
  String get pluginOrPaste => 'Or add one from a GitHub link';

  @override
  String byAuthor(String name) {
    return 'By $name';
  }

  @override
  String get adminAppSettings => 'App settings';

  @override
  String get adminAppSettingsHelp =>
      'Minimum versions, maintenance, announcements, feature switches and links for every app, with no release.';

  @override
  String get adminAppSettingsBadJson =>
      'That isn\'t valid JSON. Check the brackets, quotes and commas.';

  @override
  String get adminEmailCopy => 'Email words';

  @override
  String get adminEmailCopyHelp =>
      'The welcome emails and the monthly gallery picks, in your words. Leave a field out to use Casama\'s.';

  @override
  String get adminModelCatalog => 'Model catalog';

  @override
  String get adminModelCatalogHelp =>
      'Default, small, featured and test models, model prices and image prices. Anything left out uses the built-in value.';

  @override
  String get adminCostTables => 'Cost tables';

  @override
  String get adminCostTablesHelp =>
      'What voice, calls, computers and media cost, and which domains are sold. Billing uses them within a minute.';

  @override
  String get adminGuardSites => 'Browser guard sites';

  @override
  String get adminGuardSitesHelp =>
      'Sites Casama for Chrome and bots\' browsers keep out, on top of the built-in list. You can only add to it.';

  @override
  String get adminBuiltInValues => 'Built-in values';

  @override
  String get adminCallLimits => 'Call limits';

  @override
  String get adminCallLimitsHelp =>
      'Silence before a call hangs up, the longest call, warnings before a limit, and how often bots may ring someone. Values left out use the built-in ones.';

  @override
  String get paywallBillingPeriod => 'Billing period';

  @override
  String get paywallNotSoldTitle => 'No plans on this server';

  @override
  String get paywallNotSoldBody =>
      'This server doesn\'t sell plans, so there\'s nothing to upgrade here.';

  @override
  String get paywallPlansFailedTitle => 'Plans didn\'t load';

  @override
  String get paywallPlansFailedBody => 'Check your connection, then try again.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'The App Store isn\'t showing plans',
      'google_play': 'Google Play isn\'t showing plans',
      'other': 'The store isn\'t showing plans',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Make sure you\'re signed in to the App Store on this device, then try again.',
      'google_play': 'Make sure you\'re signed in to Google Play on this device, then try again.',
      'other': 'Make sure you\'re signed in to the store on this device, then try again.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Save up to $pct%';
  }

  @override
  String get paywallMostPopular => 'Most popular';

  @override
  String get paywallTaglinePlus => 'For you and a handful of bots';

  @override
  String get paywallTaglinePro => 'For a busy crew and a small team';

  @override
  String get paywallTaglineMax => 'For teams with bots working all day';

  @override
  String get paywallPerMonthShort => '/mo';

  @override
  String paywallBilledYearly(String price) {
    return '$price billed yearly';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Works out to $price/mo';
  }

  @override
  String get paywallBilledMonthly => 'Billed monthly';

  @override
  String get paywallBilledWeekly => 'Billed weekly';

  @override
  String get paywallPerWeekShort => '/wk';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'That\'s $price a week';
  }

  @override
  String get paywallBilledYearlyPlain => 'Billed yearly';

  @override
  String get paywallPerYearShort => '/yr';

  @override
  String paywallStartTrial(int n) {
    return 'Start $n-day free trial';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'Subscribe to $plan';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString computer hours';
  }

  @override
  String get billingChangePlan => 'Change plan';

  @override
  String get billingChangePlanBody => 'Compare every plan, monthly or yearly.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'What $plan gets you';
  }

  @override
  String get adminPricing => 'Pricing';

  @override
  String get adminCreditPacks => 'Credit packs';

  @override
  String get adminOnSale => 'On sale';

  @override
  String get adminHidden => 'Hidden';

  @override
  String get adminNoPriceLabel => 'No price label';

  @override
  String get adminPlanSaveHelp =>
      'Saving applies to every workspace on this plan straight away.';

  @override
  String get adminPackSaveHelp =>
      'Saving changes the credit pack for everyone straight away.';

  @override
  String get adminPlanName => 'Name';

  @override
  String get adminPriceLabel => 'Price label';

  @override
  String get adminPriceLabelHelp =>
      'Shown where the store has no price of its own';

  @override
  String get adminPlanActiveHelp =>
      'A hidden plan stays with the workspaces already on it.';

  @override
  String get adminCreditGate => 'Stop at zero credits';

  @override
  String get adminCreditGateHelp =>
      'Runs on Casama\'s keys stop when the workspace\'s credits run out.';

  @override
  String get adminPaywallDefault => 'Paywall opens here';

  @override
  String get adminPaywallDefaultHelp =>
      'Free workspaces start on this plan, and everyone starts on its billing period. Only one plan at a time.';

  @override
  String get adminPaywallPopular => 'Most popular';

  @override
  String get adminPaywallPopularHelp =>
      'Shows the Most popular badge on this plan\'s tier.';

  @override
  String get adminPlanSort => 'Sort order';

  @override
  String get adminPlanLimits => 'Limits';

  @override
  String get adminLimitMonthlyCredits => 'Monthly credits (USD)';

  @override
  String get adminLimitMaxBots => 'Bots';

  @override
  String get adminLimitMaxComputers => 'Computers';

  @override
  String get adminLimitComputerHours => 'Computer hours a month';

  @override
  String get adminLimitSeats => 'People';

  @override
  String get adminLimitCloudDaily => 'Cloud spend a day (USD)';

  @override
  String get adminLimitMaxRunning => 'Computers running at once';

  @override
  String get adminLimitComputerSize => 'Computer size (vCPUs and GB)';

  @override
  String get adminLimitExtraSeat => 'Extra person a month (USD)';

  @override
  String get adminLimitTrialDays => 'Trial days';

  @override
  String get adminLimitTrialCredits => 'Trial credits (USD)';

  @override
  String get adminLimitTrialHours => 'Trial computer hours';

  @override
  String get adminLimitMailAddresses => 'Bot email addresses';

  @override
  String get adminLimitMailNewDay => 'Mail to new people, a day';

  @override
  String get adminLimitMailSentDay => 'Mail sent, a day';

  @override
  String get adminLimitMailStorage => 'Mailbox size, MB';

  @override
  String get adminAddLimit => 'Add a limit';

  @override
  String get adminLimitKey => 'Limit key';

  @override
  String get adminLimitKeyInvalid =>
      'Use lowercase letters, digits and underscores';

  @override
  String get adminLimitValue => 'Value';

  @override
  String get adminStoreProducts => 'Store products';

  @override
  String get adminAppStoreId => 'App Store product id';

  @override
  String get adminGooglePlayId => 'Google Play product id';

  @override
  String get adminDodoId => 'Dodo product id';

  @override
  String get adminPackCredits => 'Credits (USD)';

  @override
  String get adminMarkup => 'Usage markup';

  @override
  String adminMarkupValue(String markup) {
    return '×$markup';
  }

  @override
  String get adminMarkupHelp => '1.3 = charge 30% over what Casama pays';

  @override
  String get adminMarkupTooLow =>
      'Use 1 or more. 1 charges exactly what Casama pays.';

  @override
  String get adminNumberInvalid => 'Enter a number of 0 or more';

  @override
  String get adminNumberPositive => 'Enter a number above 0';

  @override
  String get adminWholeNumber => 'Enter a whole number';

  @override
  String get adminNameRequired => 'Enter a name';

  @override
  String get adminPricingBillingOff =>
      'Billing is off on this server. These prices apply once it\'s on.';

  @override
  String get updatesRow => 'Updates';

  @override
  String get updatesRowSubtitle => 'News from your workspace';

  @override
  String get updatesEmpty => 'No updates';

  @override
  String get updatesEmptyHelp =>
      'Workspace notices and new pages show up here. What your bots send you is in their chats.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n things need you',
      one: '1 thing needs you',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Working on it: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Not now: $title';
  }

  @override
  String openTopic(String title) {
    return 'Open $title';
  }

  @override
  String get newTopic => 'New topic';

  @override
  String get topics => 'Topics';

  @override
  String get olderTopics => 'Older';

  @override
  String get generalChat => 'General';

  @override
  String get allTopics => 'All topics';

  @override
  String get cardSecrets => 'Secrets';

  @override
  String get cardApproval => 'Approval';

  @override
  String get cardTakeover => 'Take over';

  @override
  String get cardDevice => 'Device access';

  @override
  String get cardSuggestion => 'Suggestion';

  @override
  String get formBack => 'Back';

  @override
  String get formNext => 'Next';

  @override
  String get formSkip => 'Skip';

  @override
  String formStep(int n, int total) {
    return 'Question $n of $total';
  }

  @override
  String get cardSuggestions => 'Suggestions';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Found $n things worth a look',
      one: 'Found 1 thing worth a look',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Started $when';
  }

  @override
  String get suggestionStartedPlain => 'Started';

  @override
  String get suggestionPutAway => 'Put away';

  @override
  String get suggestionExpired => 'Expired';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Expired: $title';
  }

  @override
  String suggestionExpiresInMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Expires in $nString minutes',
      one: 'Expires in 1 minute',
    );
    return '$_temp0';
  }

  @override
  String suggestionExpiresInHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Expires in $nString hours',
      one: 'Expires in 1 hour',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n suggestions handled',
      one: '1 suggestion handled',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Use this server on your phone';

  @override
  String get linkIntro =>
      'Give this server an address your phone can reach from anywhere. No domain and no router settings.';

  @override
  String get linkIntroDetails =>
      'It links this server to a free Casama Cloud account. Your phone\'s traffic goes through Cloudflare straight to this computer, never through Casama\'s servers.';

  @override
  String get linkTurnOn => 'Use on Your Phone';

  @override
  String get linkSignupsNote =>
      'New sign-ups close while it is on. Only people who already have an account here can sign in.';

  @override
  String get linkStepSignIn => 'Link this server';

  @override
  String get linkSignInBody =>
      'Approve this code on the page that just opened in your browser. Check that the page shows the same code.';

  @override
  String get linkSignInOpen => 'Open the Page Again';

  @override
  String get linkStepAddress => 'Get an address';

  @override
  String get linkStepRestart => 'Restart the server';

  @override
  String get linkStepConnect => 'Connect';

  @override
  String get linkStateOnline => 'Online';

  @override
  String get linkStateStarting => 'Starting';

  @override
  String get linkStateOffline => 'Offline';

  @override
  String get linkStateAttention => 'Needs attention';

  @override
  String get linkStateOff => 'Off';

  @override
  String get linkAddress => 'Address';

  @override
  String get linkLocalAddress => 'On this computer';

  @override
  String get linkShowCode => 'Show Sign-In Code';

  @override
  String get linkCheck => 'Check Again';

  @override
  String get linkTurnOff => 'Turn Off';

  @override
  String get linkTurnOffConfirm =>
      'Turn off remote access? The address stops working, and phones lose this server until you turn it on again. It gets the same address back.';

  @override
  String get linkTurningOff => 'Turning off';

  @override
  String get linkNeedsOwner => 'Only this server\'s owner can turn this on.';

  @override
  String get linkTwoStepTip =>
      'This server can now be reached from the internet. Two-step sign-in means a guessed password isn\'t enough.';

  @override
  String get linkProblemNotLinked =>
      'This server isn\'t linked to Casama Cloud. Turn it on again to link it.';

  @override
  String get linkProblemCloudUnreachable =>
      'Casama Cloud can\'t be reached right now. If the address was working, it still is.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud no longer accepts this server\'s key. Turn it on again to link it.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud turned remote access off for this server.';

  @override
  String get linkProblemRemoved =>
      'This server was removed from its workspace in Casama Cloud. Turn it on again to link it.';

  @override
  String get linkProblemPlanLimit =>
      'Your Casama Cloud plan connects fewer servers. Remove one there, or upgrade.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud has no address for this server any more. Turn it on again.';

  @override
  String get linkProblemAddressChanged =>
      'This server\'s address changed. Turn it on again to use the new one.';

  @override
  String get connectProblemConnectorMissing =>
      'The connector isn\'t running. Check that Docker is running, then check again.';

  @override
  String get connectProblemConnectorBlocked =>
      'This network blocks the connection. A VPN or a strict firewall is the usual cause (outbound port 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Everything is connected, but the address doesn\'t answer yet. A new address can take a minute.';

  @override
  String get linkServers => 'Linked Servers';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Your plan connects $limit servers.',
      one: 'Your plan connects 1 server.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'No servers linked yet. On your own server, open Settings, then Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return 'Remove $name? Its address stops working. The server can be linked again later.';
  }

  @override
  String get linkStatusActive => 'Has an address';

  @override
  String get linkStatusParked => 'Not seen lately';

  @override
  String get linkStatusSuspended => 'Suspended';

  @override
  String get pairDevice => 'Sign In on Another Device';

  @override
  String get pairDeviceRow => 'Show a code your phone scans';

  @override
  String get pairDeviceHelp =>
      'Scan this with your phone\'s camera. Or in Casama on the phone: Sign in, then Scan a code.';

  @override
  String get pairDeviceWarning =>
      'Anyone who scans it is signed in as you. It works once, for a few minutes.';

  @override
  String pairDeviceServer(String host) {
    return 'Signs in to $host';
  }

  @override
  String get pairDeviceNewCode => 'New Code';

  @override
  String get pairDeviceExpired => 'This code ran out.';

  @override
  String get pairDeviceNotReachable =>
      'This server only answers on this computer, so a phone can\'t reach it yet.';

  @override
  String get pairDeviceNotReachableOther =>
      'This server\'s address only works on its own network. Ask whoever runs it for an address others can reach.';

  @override
  String get pairDeviceCopyLink => 'Copy Link';

  @override
  String get pairDeviceLinkCopied =>
      'Link copied. Paste it into Casama for Chrome or on another device.';

  @override
  String get pairDeviceConnectChrome => 'Connect Chrome';

  @override
  String get pairDeviceChromeDone => 'Casama for Chrome is signed in.';

  @override
  String get pairDeviceChromeFinish =>
      'Finish in the Casama for Chrome tab that opened.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama for Chrome isn\'t installed in this browser.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama for Chrome couldn\'t sign in. $error';
  }

  @override
  String get scanToSignIn => 'Scan a Code from Your Computer';

  @override
  String get scanToSignInTitle => 'Scan the Code';

  @override
  String get scanToSignInHelp =>
      'On a computer where you\'re signed in, open Settings, then Sign In on Another Device.';

  @override
  String pairSignInTo(String host) {
    return 'Sign in to $host?';
  }

  @override
  String get pairSignInBody =>
      'The code signs this device in to the account that showed it.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'This device uses $current now. Signing in to $host switches it over.';
  }

  @override
  String get pairSigningIn => 'Signing in';

  @override
  String get pairCodeInvalid =>
      'That code isn\'t valid any more. Show a new one and scan again.';

  @override
  String get pairLinkInvalid => 'This isn\'t a Casama sign-in code.';

  @override
  String get linkServerTitle => 'Link a Server';

  @override
  String linkServerBody(String name) {
    return '$name wants to connect to your Casama Cloud account.';
  }

  @override
  String get linkServerCode => 'Code on the server';

  @override
  String get linkServerCheck =>
      'Only link it if you started this on your own server and it shows this same code.';

  @override
  String get linkServerWhat =>
      'It gets a public address and can send you notifications. It can\'t spend your credits.';

  @override
  String get linkServerApprove => 'Link';

  @override
  String get linkServerDone => 'Linked';

  @override
  String linkServerDoneBody(String name) {
    return 'Go back to $name. It carries on by itself.';
  }

  @override
  String get linkServerInvalid =>
      'That code isn\'t valid any more. Start again on your server.';

  @override
  String get linkServerEnterCode => 'The code your server shows';

  @override
  String get linkServerFind => 'Find';

  @override
  String get linkServerNeedAdmin =>
      'Only owners and admins of a workspace can link a server.';

  @override
  String get localDockerStopped =>
      'Docker isn\'t running, so your server is stopped';

  @override
  String get localDockerStoppedBody =>
      'Your Casama server runs in Docker on this computer. Open Docker and Casama reconnects by itself once the server is back, which can take a minute.';

  @override
  String get serverOfflineTitle => 'Your server is offline';

  @override
  String get serverOfflineBody =>
      'Is the computer that runs it on and awake? This reconnects by itself.';

  @override
  String get signUpsClosed =>
      'This server isn\'t taking new accounts. Sign in with an account you already have here.';

  @override
  String get signUpsByInvitation =>
      'New accounts here are by invitation. Use the email address you were invited with.';

  @override
  String get linkPrivateNotifications => 'Private Notifications';

  @override
  String get linkPrivateNotificationsHelp =>
      'Notifications reach your phone through Casama Cloud. With this on they carry no text and say only \"New activity\"; the app loads the rest from this server.';

  @override
  String get linkInvites => 'Let Invited People Sign Up';

  @override
  String get linkInvitesHelp =>
      'Off: nobody can make a new account. On: people you invite by email can. Changing it restarts the server.';

  @override
  String get linkKeepAwake => 'Keep This Mac Awake While Plugged In';

  @override
  String get linkKeepAwakeHelp =>
      'Phones can only reach this server while this computer is awake and Casama is open.';

  @override
  String get linkLiveView => 'Live View Away From Here';

  @override
  String get linkLiveViewIncluded =>
      'Included in your plan. Away from this computer, a bot\'s screen plays live through Casama Cloud\'s relay.';

  @override
  String get linkLiveViewPlan =>
      'Comes with Plus and up on Casama Cloud. Away from this computer you see a bot\'s screen about once a second. On this computer it is always live.';

  @override
  String get liveAwayNeedsPlan =>
      'Away from the server\'s computer, live video comes with Plus and up on Casama Cloud. Until then the screen updates about once a second.';

  @override
  String get chatShareExport => 'Share or Export';

  @override
  String get chatShareExportHelp =>
      'Save this chat as a file, or make a read-only link to it.';

  @override
  String get chatExportMarkdown => 'Export as Markdown';

  @override
  String get chatExportMarkdownHelp => 'A text file anyone can read';

  @override
  String get chatExportJson => 'Export as JSON';

  @override
  String get chatExportJsonHelp => 'For other apps and scripts';

  @override
  String get chatShareLink => 'Share a Read-Only Link';

  @override
  String get chatShareLinkHelp => 'Anyone with the link can read this chat';

  @override
  String get chatStopSharing => 'Stop Sharing the Link';

  @override
  String get chatStopSharingHelp => 'The link stops working';

  @override
  String get chatMakePublicTitle => 'Share this chat with a link?';

  @override
  String get chatMakePublicBody =>
      'Anyone with the link can read this chat as you see it. Attached files are listed by name, not shared. You can stop it any time.';

  @override
  String get chatMakePublic => 'Make Link';

  @override
  String get chatLinkTitle => 'Read-Only Link';

  @override
  String get chatLinkBody =>
      'Copied. It isn\'t listed in search engines. Making a new link stops this one.';

  @override
  String get chatSharingStopped => 'The link no longer works';

  @override
  String get creationDuplicate => 'Duplicate';

  @override
  String creationDuplicated(String title) {
    return 'Made a copy: “$title”';
  }

  @override
  String get slackInstall => 'Add to Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Connect a Slack workspace in one step. $bot answers @mentions and direct messages there.';
  }

  @override
  String get slackInstallFinish => 'Finish in Slack, then come back here.';

  @override
  String get helpAndSupport => 'Help & support';

  @override
  String get helpAndSupportRow => 'Ask Casama Help, contact us, guides';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Instant answers from our guides and your account. A person is one tap away.';

  @override
  String get supportIntro =>
      'Questions, a problem with a purchase, or something not working? Write to us.';

  @override
  String supportSelfHosted(String host) {
    return 'Your workspace runs on $host. For sign-in, accounts and plans, ask whoever runs that server. We can help with the app itself.';
  }

  @override
  String get supportTalkToPerson => 'Talk to a person';

  @override
  String get contactSupport => 'Contact support';

  @override
  String contactSupportRow(String email) {
    return 'Write to our team at $email';
  }

  @override
  String get sendFeedback => 'Send feedback';

  @override
  String get sendFeedbackRow => 'Ideas, likes and dislikes. We read every one.';

  @override
  String get feedbackHelp =>
      'Tell us what you\'d like Casama to do, what you love, or what got in your way.';

  @override
  String get feedbackKindPrompt => 'What kind of feedback?';

  @override
  String get feedbackKindIdea => 'Idea';

  @override
  String get feedbackKindLike => 'I like';

  @override
  String get feedbackKindDislike => 'I don\'t like';

  @override
  String get feedbackKindConfusing => 'Confusing';

  @override
  String get feedbackMessageLabel => 'Your feedback';

  @override
  String get feedbackMessageHint =>
      'For example: I wish I could pin a chat to the top.';

  @override
  String get feedbackContactOk => 'You can contact me about this';

  @override
  String get feedbackContactOkHelp =>
      'We may email you a question, or tell you when it\'s done.';

  @override
  String get feedbackNote =>
      'Your app version and plan are sent with it. A problem with your account or a purchase? Use Contact support instead.';

  @override
  String get feedbackThanks => 'Thanks! We read every one.';

  @override
  String get adminFeedback => 'Feedback';

  @override
  String get adminFeedbackNew => 'New';

  @override
  String get adminFeedbackRead => 'Read';

  @override
  String get adminFeedbackDone => 'Done';

  @override
  String get adminFeedbackAll => 'All';

  @override
  String get adminFeedbackNone => 'No feedback here.';

  @override
  String get adminFeedbackNoMatch => 'No feedback matches your search.';

  @override
  String get adminFeedbackSearch => 'Search feedback';

  @override
  String get adminFeedbackMarkNew => 'Mark as new';

  @override
  String get adminFeedbackMarkRead => 'Mark as read';

  @override
  String get adminFeedbackMarkDone => 'Mark as done';

  @override
  String get adminFeedbackNoContact => 'Don\'t contact';

  @override
  String get adminFeedbackColMessage => 'Feedback';

  @override
  String get adminFeedbackColFrom => 'From';

  @override
  String get adminFeedbackColStatus => 'Status';

  @override
  String get adminFeedbackColSent => 'Sent';

  @override
  String get adminFeedbackCopy => 'Copy';

  @override
  String get supportIdeasBoard => 'Ideas board';

  @override
  String get supportIdeasBoardHelp =>
      'See what others asked for, and vote for what you want next';

  @override
  String get adminFeedbackPublish => 'Post to ideas board';

  @override
  String get adminFeedbackPublishHelp =>
      'Write it as an idea anyone can read. The sender\'s name and details aren\'t posted.';

  @override
  String get adminFeedbackPublishTitleLabel => 'Title';

  @override
  String get adminFeedbackPublishTextLabel => 'Description';

  @override
  String get adminFeedbackPublished => 'Posted to the ideas board';

  @override
  String get adminFeedbackOpenIdea => 'Open on ideas board';

  @override
  String get adminFeedbackOnBoard => 'On the board';

  @override
  String get contactSupportHelp =>
      'Tell us what\'s going on. We\'ll reply by email.';

  @override
  String get contactSupportHelpMail =>
      'Tell us what\'s going on. This opens your email app with the details filled in.';

  @override
  String get supportSend => 'Send';

  @override
  String get supportWriteEmail => 'Open email';

  @override
  String get supportTopicPrompt => 'What\'s it about?';

  @override
  String get supportTopicBilling => 'Billing & purchases';

  @override
  String get supportTopicBroken => 'Something\'s not working';

  @override
  String get supportTopicAccount => 'Account & sign-in';

  @override
  String get supportTopicQuestion => 'A question or idea';

  @override
  String get supportTopicOther => 'Something else';

  @override
  String get supportMessageLabel => 'Your message';

  @override
  String get supportMessageHint => 'What happened, and what did you expect?';

  @override
  String get supportMessageMore =>
      'Add a sentence or two: what you were doing and what went wrong.';

  @override
  String get supportIncludeChat => 'Include my conversation with Casama Help';

  @override
  String get supportIncludeChatHelp =>
      'So you don\'t have to explain it twice.';

  @override
  String get supportDetailsNote =>
      'We add your app version and your workspace and account IDs so we can find your account. Never your chats.';

  @override
  String get supportSentTitle => 'Message sent';

  @override
  String supportSentBody(String email, String reference) {
    return 'We\'ll reply to $email. Your reference is $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'No email app found, so we copied your message. Paste it into an email to $email.';
  }

  @override
  String get supportGuides => 'Guides and FAQ';

  @override
  String get supportGuidesHelp => 'Step-by-step help for everything in Casama';

  @override
  String get introVideoTitle => 'See how Casama works';

  @override
  String get introVideoSubtitle => 'A 1½-minute film';

  @override
  String get supportIntroVideo => 'Watch the intro film';

  @override
  String get introVideoFailed =>
      'Couldn\'t play the film. Check your connection and try again.';

  @override
  String get introVideoOnYoutube => 'Watch on YouTube';

  @override
  String get introVideoReplay => 'Replay';

  @override
  String get supportIntroVideoHelp => 'See what Casama can do in 1½ minutes';

  @override
  String get supportRate => 'Rate Casama';

  @override
  String get supportRateHelp => 'Tell others what you think on the store page';

  @override
  String get supportIds => 'Support IDs';

  @override
  String get supportIdsHelp =>
      'Support may ask for these. They find your account and purchases, and don\'t give anyone access.';

  @override
  String supportWorkspaceId(String name) {
    return 'Workspace ID · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Also your purchase ID in the App Store and Google Play';

  @override
  String get supportAccountId => 'Account ID';

  @override
  String get supportCopyAll => 'Copy all details';

  @override
  String get supportCopyAllHelp =>
      'App version, platform and IDs, to paste into a message';

  @override
  String get supportNewChat => 'New conversation';

  @override
  String get supportAskHint => 'Ask anything about Casama';

  @override
  String get supportAiNote =>
      'Casama Help is AI and can make mistakes. It sees your plan and bot errors, not your chats.';

  @override
  String get supportGreeting =>
      'Hi! I\'m Casama Help. Ask me about Casama, your plan, or a problem you\'re having. If I can\'t fix it, I\'ll pass it to our support team.';

  @override
  String get supportStarterPurchase => 'My purchase didn\'t go through';

  @override
  String get supportStarterCancel => 'How do I cancel my plan?';

  @override
  String get supportStarterBot => 'My bot isn\'t answering';

  @override
  String get supportStarterHowTo => 'What can my bots do?';

  @override
  String get supportAskPerson => 'Ask a person';

  @override
  String get supportHandoffTitle => 'Send this to our support team?';

  @override
  String get supportHandoffButton => 'Review and send';

  @override
  String get supportThinking => 'Looking into it…';

  @override
  String get supportAssistantError =>
      'Casama Help couldn\'t answer. Try again, or ask a person.';

  @override
  String get supportAssistantLimit =>
      'Casama Help can\'t answer more right now. A person can help.';

  @override
  String get purchaseHelp => 'Trouble with a purchase? Get help';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Report';

  @override
  String get reportAndBlock => 'Report and block';

  @override
  String get reportReply => 'Report reply';

  @override
  String get reportBot => 'Report bot';

  @override
  String get reportBotRow =>
      'Something in its name, description or replies isn\'t right';

  @override
  String get reportPerson => 'Report person';

  @override
  String get reportGalleryItem => 'Report gallery item';

  @override
  String get reportGalleryRequest => 'Report request';

  @override
  String get reportWorkspace => 'Report workspace';

  @override
  String get reportHelp =>
      'Tell the people who run this server what\'s wrong. They review every report.';

  @override
  String get reportPersonHelp =>
      'Tell the people who run this server what happened. We\'ll also block this person for you.';

  @override
  String get reportNote => 'Anything else they should know (optional)';

  @override
  String reportAlsoBlock(String name) {
    return 'Also block $name';
  }

  @override
  String get reportSent => 'Thanks. Your report was sent for review.';

  @override
  String get reportReasonSpam => 'Spam or scam';

  @override
  String get reportReasonSexual => 'Sexual content';

  @override
  String get reportReasonViolence => 'Violence or threats';

  @override
  String get reportReasonHarassment => 'Harassment or hate';

  @override
  String get reportReasonIllegal => 'Illegal or dangerous';

  @override
  String get reportReasonImpersonation => 'Pretending to be someone';

  @override
  String get reportReasonOther => 'Something else';

  @override
  String get thisPerson => 'this person';

  @override
  String blockPerson(String name) {
    return 'Block $name';
  }

  @override
  String blocked(String name) {
    return '$name is blocked';
  }

  @override
  String get blockHelp =>
      'Blocked people can\'t invite you to a workspace, and you won\'t hear from them.';

  @override
  String get blockedPeople => 'Blocked people';

  @override
  String get blockedPeopleRow => 'People who can\'t invite you or reach you';

  @override
  String get noBlockedPeople => 'No one is blocked';

  @override
  String get unblock => 'Unblock';

  @override
  String get emailTips => 'Tips and news by email';

  @override
  String get emailTipsHelp =>
      'Getting started tips and the occasional update. Emails about your plan and account always come.';

  @override
  String get reportsInApp => 'Reported in the app';

  @override
  String get reportsNone =>
      'No open reports. Reports people send from the app show up here.';

  @override
  String get reportsPublicLinks => 'Reported public links';

  @override
  String get reportsNoLinks => 'No public links were reported.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reports',
      one: '1 report',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Take down';

  @override
  String get reportsRestore => 'Restore';

  @override
  String get reportKindReply => 'Bot reply';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Person';

  @override
  String get reportKindGallery => 'Gallery item';

  @override
  String get reportKindWorkspace => 'Workspace';

  @override
  String get reportMarkActioned => 'Dealt with it';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Suspend the workspace $name';
  }

  @override
  String get reportDismiss => 'Dismiss: nothing wrong';

  @override
  String get supportWebTitle => 'Website Casama Help';

  @override
  String get supportWebOn => 'On';

  @override
  String get supportWebOff => 'Off';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count IP addresses paused',
      one: '1 IP address paused',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Show $count unanswered questions';
  }

  @override
  String get ticketsOpen => 'Open';

  @override
  String get ticketsClosed => 'Closed';

  @override
  String get ticketsAll => 'All';

  @override
  String get ticketsNone => 'No messages here.';

  @override
  String get ticketClose => 'Close';

  @override
  String get ticketReopen => 'Reopen';

  @override
  String get serviceStatus => 'Status';

  @override
  String get supportStatus => 'Casama Cloud status';

  @override
  String get supportStatusHelp => 'Check whether something is down right now';

  @override
  String get galleryChatSuggestionLabel => 'From the gallery';

  @override
  String get galleryChatAdd => 'Add';

  @override
  String galleryChatAdded(String name) {
    return 'Added $name';
  }

  @override
  String galleryChatReads(String things) {
    return 'Reads: $things';
  }

  @override
  String get galleryChatRunsCode => 'Runs code';

  @override
  String get galleryChatComputer => 'Uses a computer';

  @override
  String galleryChatNeeds(String apps) {
    return 'Needs: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Skill draft';

  @override
  String get galleryChatShowInstructions => 'Show instructions';

  @override
  String get galleryChatHideInstructions => 'Hide instructions';

  @override
  String get galleryChatSaveSkill => 'Save to my skills';

  @override
  String get galleryChatSaved => 'Saved';

  @override
  String get galleryChatSavedSkill => 'Saved to your skills';

  @override
  String get galleryChatSubmit => 'Submit to the gallery';

  @override
  String galleryChatSubmitTitle(String name) {
    return 'Submit $name to the gallery?';
  }

  @override
  String get galleryChatSubmitBody =>
      'A maintainer reviews it first. Once it\'s in, anyone can find and use it. Your display name is shown as the author, never your email.';

  @override
  String get galleryChatSent => 'Sent';

  @override
  String get galleryChatSubmitted => 'Sent to the gallery for review';

  @override
  String get galleryChatSubmissionsOff =>
      'This server doesn\'t take gallery submissions.';

  @override
  String get galleryPicksTitle => 'Picks for you';

  @override
  String get galleryPicksHelp =>
      'Start with a set of skills, apps and routines that fit. You can change anything later.';

  @override
  String get galleryPicksAdd => 'Add this set';

  @override
  String get galleryPicksSkip => 'Skip for now';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Add $name';
  }

  @override
  String get galleryPicksBestMatch => 'Best match';

  @override
  String get galleryPicksInside => 'What\'s inside';

  @override
  String galleryPicksBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skills',
      one: '1 skill',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routines',
      one: '1 routine',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '1 app',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plugins',
      one: '1 plugin',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count looks',
      one: '1 look',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return 'Added $name';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return 'Added $name. Connect $apps in Apps to finish.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'An admin will look at $name before it\'s added.';
  }

  @override
  String get galleryPolicyTitle => 'Gallery';

  @override
  String get galleryPolicyRow => 'What people here can add from the gallery';

  @override
  String get galleryPolicyMode => 'Who can add';

  @override
  String get galleryPolicyOpen => 'Open';

  @override
  String get galleryPolicyOpenHelp =>
      'Anyone here can add anything that isn\'t blocked.';

  @override
  String get galleryPolicyApproval => 'Ask first';

  @override
  String get galleryPolicyApprovalHelp =>
      'Adding asks an admin first, for what you pick below.';

  @override
  String get galleryPolicyAllowlist => 'Only allowed';

  @override
  String get galleryPolicyAllowlistHelp =>
      'People can add only what\'s on the allowed list.';

  @override
  String get galleryPolicyApprovalFor => 'Ask first for';

  @override
  String get galleryPolicyRunsCode => 'Things that run code';

  @override
  String get galleryPolicyApps => 'Things that connect apps';

  @override
  String get galleryPolicyAll => 'Everything';

  @override
  String get galleryPolicyAllowed => 'Allowed';

  @override
  String get galleryPolicyAllowedHelp =>
      'Added without asking. With Only allowed, the only things people can add.';

  @override
  String get galleryPolicyBlocked => 'Blocked';

  @override
  String get galleryPolicyBlockedHelp => 'Nobody here can add these.';

  @override
  String get galleryPolicyAddItem => 'Add from the gallery';

  @override
  String get galleryPolicyNone => 'Nothing yet';

  @override
  String get galleryPolicySearch => 'Search the gallery';

  @override
  String get galleryPolicyNoResults => 'Nothing in the gallery matches.';

  @override
  String get galleryPolicySaved => 'Gallery rules saved';

  @override
  String galleryPolicyRemove(String name) {
    return 'Remove $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Only admins and owners can change this.';

  @override
  String get galleryPolicyWaiting => 'Waiting for approval';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name asked';
  }

  @override
  String get galleryPolicyApprove => 'Approve';

  @override
  String get galleryPolicyDecline => 'Decline';

  @override
  String galleryPolicyApproved(String name) {
    return '$name approved and added';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name declined';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Approved, but $name couldn\'t be added. $error';
  }

  @override
  String get galleryDigestEmails => 'Monthly gallery picks';

  @override
  String get galleryDigestHelp =>
      'Up to six new skills, apps and routines that fit what you use, once a month.';

  @override
  String get newsletterTitle => 'Casama\'s monthly email';

  @override
  String get newsletterHelp =>
      'What\'s new and what\'s next, once a month at most.';

  @override
  String get newsletterSignUp =>
      'Send me Casama\'s monthly email: what\'s new and what\'s next, once a month at most.';

  @override
  String get newsletterCardTitle => 'Get Casama\'s monthly email?';

  @override
  String get newsletterCardBody =>
      'What\'s new and what\'s next, once a month at most. Stop any time.';

  @override
  String get newsletterCardYes => 'Yes, send it';

  @override
  String get newsletterCardNo => 'No thanks';

  @override
  String get newsletterCardDone =>
      'You\'re on the list. Turn it off any time in Settings.';

  @override
  String get galleryKindApp => 'App';

  @override
  String get galleryKindApps => 'Apps';

  @override
  String get galleryKindBot => 'Starter bot';

  @override
  String get galleryKindBots => 'Starter bots';

  @override
  String get galleryKindRoutine => 'Routine';

  @override
  String get galleryKindRoutines => 'Routines';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugins';

  @override
  String get galleryKindSet => 'Starter set';

  @override
  String get galleryKindSets => 'Starter sets';

  @override
  String get galleryTabBrowse => 'Browse';

  @override
  String get galleryTabInstalled => 'Installed';

  @override
  String get gallerySearchEverything => 'Search everything';

  @override
  String get galleryNewBadge => 'New';

  @override
  String get galleryRowPicks => 'Picks';

  @override
  String get galleryRowNew => 'New';

  @override
  String get galleryRowTrending => 'Trending this week';

  @override
  String get galleryRowMostUsed => 'Most used';

  @override
  String get galleryRowWorksWith => 'Works with what you have';

  @override
  String get galleryRowSets => 'Starter sets';

  @override
  String get galleryRowSeasonal => 'In season';

  @override
  String get galleryFilterFree => 'Free';

  @override
  String get galleryFilterPlan => 'Uses credits';

  @override
  String get galleryFilterSelfHosted => 'Works self-hosted';

  @override
  String get galleryFilterComputer => 'Needs a computer';

  @override
  String get galleryNoFilterMatches => 'Nothing matches these filters';

  @override
  String get galleryClearFilters => 'Clear filters';

  @override
  String get galleryRequestThis => 'Request this';

  @override
  String get galleryAskCasama => 'Ask Casama to make it';

  @override
  String galleryAskPrompt(String query) {
    return 'Make me something for this: $query';
  }

  @override
  String get galleryAccessTitle => 'What it can access';

  @override
  String galleryAccessReads(String things) {
    return 'Reads: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Runs code';

  @override
  String get galleryAccessComputer => 'Uses a computer';

  @override
  String get galleryAccessNothing =>
      'Doesn\'t read or change anything of yours';

  @override
  String get galleryCreditsNone => 'Uses no credits';

  @override
  String get galleryCreditsLow => 'Uses few credits';

  @override
  String get galleryCreditsMedium => 'Uses some credits';

  @override
  String get galleryCreditsHigh => 'Uses many credits';

  @override
  String get galleryTryIt => 'Try it';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Used by $shown people',
      one: 'Used by 1 person',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent% of runs finish';
  }

  @override
  String get galleryAbout => 'About';

  @override
  String get galleryMadeByCasama => 'Made by Casama';

  @override
  String get galleryMadeByCommunity => 'Made by the community';

  @override
  String get galleryMadeReviewed => 'Reviewed';

  @override
  String get galleryReviewedHelp => 'Its tests passed for this version';

  @override
  String galleryMoreFrom(String name) {
    return 'More from $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Version $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Updated $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Remix of $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'What changed in $name';
  }

  @override
  String get galleryBreaking => 'Works differently';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items in the gallery',
      one: '1 item in the gallery',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => 'Nothing in the gallery by this author yet.';

  @override
  String get galleryInstalledWorkspace => 'In this workspace';

  @override
  String get galleryInstalledDevice => 'Looks on this device';

  @override
  String get galleryInstalledEmptyTitle => 'Nothing added yet';

  @override
  String get galleryInstalledEmpty =>
      'Skills, apps, routines and looks you add from the gallery show here, with updates.';

  @override
  String get galleryInstalledError => 'Couldn\'t load what\'s installed.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count updates',
      one: '1 update',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Update';

  @override
  String galleryUpdated(String name) {
    return 'Updated $name';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Version $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return 'Update $name?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'The new version can do more than the one you have:';

  @override
  String get galleryUpdateBreakingHelp =>
      'The new version works differently, so check it after updating.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Now reads: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Now can: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Now runs code';

  @override
  String get galleryUpdateNowComputer => 'Now uses a computer';

  @override
  String get galleryRemove => 'Remove';

  @override
  String galleryRemoveTitle(String name) {
    return 'Remove $name?';
  }

  @override
  String get galleryRemoveHelp =>
      'It\'s removed from this workspace. You can add it again from the gallery.';

  @override
  String galleryRemoved(String name) {
    return 'Removed $name';
  }

  @override
  String get galleryRetired => 'No longer in the gallery';

  @override
  String get galleryRetiredReplaced =>
      'No longer in the gallery; there\'s a replacement';

  @override
  String get gallerySeeReplacement => 'See replacement';

  @override
  String get galleryForgetLook => 'Remove from this list';

  @override
  String galleryWizardTitle(String name) {
    return 'Add $name';
  }

  @override
  String get galleryWizardAdd => 'Add';

  @override
  String get galleryWizardRequired => 'Fill this in';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Includes $count items',
      one: 'Includes 1 item',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'What it needs';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skills, added for you',
      one: '1 skill, added for you',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Apps to connect: $apps';
  }

  @override
  String get galleryWizardBot => 'Add to which bot';

  @override
  String get galleryWizardPickBot => 'Pick a bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Where the set\'s routines go. Without one they\'re left out.';

  @override
  String get galleryWizardSetNotAdded => 'Not added';

  @override
  String get galleryWizardNeedsTitle => 'Connect your apps';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name works once these are connected.';
  }

  @override
  String get galleryWizardSkillAdded => 'Added';

  @override
  String get galleryWizardConnected => 'Connected';

  @override
  String get galleryWizardConnect => 'Connect';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Connect $name in Settings → Apps.';
  }

  @override
  String get galleryWizardContinue => 'Continue';

  @override
  String get galleryWizardSkip => 'Later';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name is ready';
  }

  @override
  String get galleryWizardDoneHelp =>
      'You\'ll find it with the rest of your things.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'To work fully, it needs these apps connected: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Waiting for approval';

  @override
  String get galleryWizardPendingHelp =>
      'Your workspace asks an admin first. It\'s added once they approve.';

  @override
  String get galleryRequestsTitle => 'Requests';

  @override
  String get galleryRequestsHelp =>
      'Ideas for the gallery. Vote for the ones you want; makers pick from the top.';

  @override
  String get galleryRequestsLinkHelp =>
      'Ask for something that isn\'t here yet, or vote';

  @override
  String get galleryRequestsTop => 'Top';

  @override
  String get galleryRequestsNew => 'New';

  @override
  String get galleryRequestsEmpty => 'No requests yet. Be the first.';

  @override
  String get galleryRequestsError => 'Couldn\'t load requests.';

  @override
  String get galleryRequestNew => 'New request';

  @override
  String get galleryRequestNewHelp =>
      'Say what you\'d like someone to make. Similar requests are merged.';

  @override
  String get galleryRequestKind => 'Kind';

  @override
  String get galleryRequestTitleLabel => 'What should it do?';

  @override
  String get galleryRequestTitleLength => 'Use 4 to 80 characters.';

  @override
  String get galleryRequestDetails => 'Details (optional)';

  @override
  String get galleryRequestSend => 'Send request';

  @override
  String get galleryRequestSent => 'Request sent';

  @override
  String galleryRequestSimilar(String title) {
    return '\"$title\" was already asked for, so your vote went to it';
  }

  @override
  String get galleryRequestMine => 'Yours';

  @override
  String get galleryRequestVote => 'Vote';

  @override
  String get galleryRequestOpen => 'Open';

  @override
  String get galleryRequestPlanned => 'Planned';

  @override
  String get galleryRequestDone => 'Done';

  @override
  String get galleryRequestDeclined => 'Declined';

  @override
  String get gallerySubmitStart => 'Submit to the gallery';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Share a look, skill, routine or bot you made';

  @override
  String get gallerySubmitPick => 'What do you want to share?';

  @override
  String get gallerySubmitPickHelp =>
      'Pick something you made. It\'s reviewed before it\'s in the gallery.';

  @override
  String get galleryLooksMine => 'Your looks';

  @override
  String get gallerySubmitCurrentScheme => 'Color scheme in use';

  @override
  String get gallerySubmitCurrentWallpaper => 'Wallpaper in use';

  @override
  String get gallerySubmitMyWallpaper => 'My wallpaper';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Submit an App',
      'bot': 'Submit a Starter bot',
      'routine': 'Submit a Routine',
      'plugin': 'Submit a Plugin',
      'set': 'Submit a Starter set',
      'theme': 'Submit a Theme',
      'scheme': 'Submit a Color scheme',
      'wallpaper': 'Submit a Wallpaper',
      'other': 'Submit a Skill',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Your display name is shown as the author. Your email is never shared.';

  @override
  String get gallerySubmitName => 'Name';

  @override
  String get gallerySubmitNameLength => 'Use 1 to 60 characters.';

  @override
  String get gallerySubmitTags => 'Tags';

  @override
  String get gallerySubmitTagsHelp => 'Up to six, separated by commas';

  @override
  String get gallerySubmitLicense => 'License';

  @override
  String gallerySubmitRemix(String name) {
    return 'Credits the original: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed => 'Credits the original gallery item';

  @override
  String get gallerySubmitSend => 'Submit';

  @override
  String get gallerySubmitted => 'Sent for review';

  @override
  String get gallerySubmissionsTitle => 'My submissions';

  @override
  String get gallerySubmissionsHelp =>
      'What you sent to the gallery and where it stands.';

  @override
  String get gallerySubmissionsSent => 'Sent';

  @override
  String get gallerySubmissionsEmpty => 'Nothing sent yet.';

  @override
  String get gallerySubmissionsError => 'Couldn\'t load your submissions.';

  @override
  String get gallerySubmissionOpen => 'In review';

  @override
  String get gallerySubmissionMerged => 'In the gallery';

  @override
  String get gallerySubmissionClosed => 'Not accepted';

  @override
  String get gallerySubmissionFailed => 'Couldn\'t be sent';

  @override
  String get galleryMyItems => 'Your items in the gallery';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open reports',
      one: '1 open report',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'A bot';

  @override
  String get islandNeedsOk => 'Needs your OK';

  @override
  String get islandTakeOver => 'Wants you to take over';

  @override
  String get islandWriting => 'Writing a reply';

  @override
  String get islandWorking => 'Working';

  @override
  String get islandFinished => 'Finished';

  @override
  String get islandStoppedProblem => 'Stopped with a problem';

  @override
  String get islandOnThisMac => 'On this Mac';

  @override
  String get islandStale => 'Open Casama for the latest';

  @override
  String get islandOpen => 'Open';

  @override
  String get islandStop => 'Stop';

  @override
  String get islandAllow => 'Allow';

  @override
  String get islandDeny => 'Deny';

  @override
  String get islandReview => 'Review';

  @override
  String get islandNothing => 'No bot is working right now';

  @override
  String get islandQuickAsk => 'Quick ask…';

  @override
  String get islandOpenCasama => 'Open Casama';

  @override
  String get islandSettings => 'Settings…';

  @override
  String get islandQuit => 'Quit Casama';

  @override
  String get islandAskHint => 'Ask a bot…';

  @override
  String get islandNeedsYou => 'Needs you';

  @override
  String get islandDropHere => 'Drop to ask a bot';

  @override
  String get siriSignedOut => 'Sign in to Casama first.';

  @override
  String get siriOpenToFinish => 'Open Casama to finish.';

  @override
  String get siriTooMany =>
      'That\'s a lot of asks in a minute. Open Casama to keep going.';

  @override
  String get siriNoCredits =>
      'You\'re out of credits. Open Casama to add more.';

  @override
  String get siriOffline => 'Casama can\'t reach the internet right now.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot needs your OK first. Open Casama to review it.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot ran into a problem. Open Casama to see what happened.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot replied. Open Casama to read it.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot is still working on it. You\'ll get a notification when it\'s done.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot answered.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return 'Started $routine.';
  }

  @override
  String get siriNothingNeedsYou => 'Nothing needs you right now.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count things need you.',
      one: 'One thing needs you.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Waiting on you: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Computers aren\'t available for this account.';

  @override
  String get siriNoComputers => 'You have no computers in this workspace.';

  @override
  String siriStartingComputer(String computer) {
    return 'Starting $computer.';
  }

  @override
  String get siriComputerFailed => 'Couldn\'t start the computer right now.';

  @override
  String get siriWhichBotToStop => 'Which bot should I stop?';

  @override
  String get siriBotNotRunning => 'That bot isn\'t running right now.';

  @override
  String get siriStopped => 'Stopped.';

  @override
  String get siriStopFailed => 'Couldn\'t stop the bot right now.';

  @override
  String get focusFilterShowingAll => 'Focus filter · Showing all';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Focus filter · $count shown',
      one: 'Focus filter · 1 shown',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama is for people 13 and older';

  @override
  String get under13Body =>
      'This account can\'t use Casama based on its declared age range. You can sign out, or export your data from another account.';

  @override
  String get siriSpotlightSetting => 'Show in Spotlight and Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Bot names, routine names and chat titles appear in Spotlight and Siri on this device. Never what\'s said in a chat. Off with the app lock on.';

  @override
  String get geminiSetting => 'Let Gemini use Casama';

  @override
  String get geminiSettingHelp =>
      'When you ask Gemini to use Casama, it can ask your bots, see what needs you and run your routines on this phone. It never approves anything: requests open here. Replies stay hidden in a private workspace, with Hide reply text or with the app lock on.';

  @override
  String get geminiOff =>
      'Gemini is turned off for Casama on this phone. Turn it on in Casama: Settings, Privacy.';

  @override
  String get islandBotWorking => 'A bot is working';

  @override
  String get islandOnThisComputer => 'on this computer';

  @override
  String get islandOnACall => 'On a call';

  @override
  String get islandStartElsewhere => 'Bots you start elsewhere';

  @override
  String get islandStartElsewhereHelp =>
      'Show what you start on another device, such as your Mac, on this phone\'s Lock Screen too.';

  @override
  String get islandBotsAtWork => 'Bots at work';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Show bots in the notch';

  @override
  String get showBotsInNotchHelp =>
      'What your bots are doing, around the camera. The menu bar icon shows it either way.';

  @override
  String get notchOnHover => 'Open the notch on hover';

  @override
  String get notchOnHoverHelp => 'Off: click the notch to open it.';

  @override
  String get sitePublishToWeb => 'Publish to the Web';

  @override
  String get sitePublishToWebHelp => 'Give it its own web address.';

  @override
  String get siteAddressName => 'Address name';

  @override
  String get siteAddressRules =>
      '3 to 40 lowercase letters, numbers and hyphens, starting and ending with a letter or number.';

  @override
  String get siteAddressChecking => 'Checking…';

  @override
  String get siteAddressAvailable => 'Available';

  @override
  String get siteAddressTaken => 'This name isn\'t available.';

  @override
  String get siteAnyoneCanOpen =>
      'Anyone with the address will be able to open it.';

  @override
  String get sitePublish => 'Publish';

  @override
  String get siteOnTheWeb => 'On the web';

  @override
  String get siteSearchEngines => 'Let Search Engines Find It';

  @override
  String get siteSearchEnginesHelp =>
      'Lists it in Google and other search engines.';

  @override
  String get siteSearchEnginesPaid => 'Needs a paid plan.';

  @override
  String get siteUseOwnDomain => 'Use Your Own Domain';

  @override
  String get siteUnpublish => 'Unpublish';

  @override
  String get siteUnpublishTitle => 'Unpublish this site?';

  @override
  String get siteUnpublishBody =>
      'It stops opening at its web addresses. It stays in your Library.';

  @override
  String get siteHostLive => 'Live';

  @override
  String get siteHostWaitingForDns => 'Waiting for DNS';

  @override
  String get siteHostGettingCertificate => 'Getting its certificate';

  @override
  String get siteHostNeedsAttention => 'Needs attention';

  @override
  String get siteHostPaused => 'Paused';

  @override
  String get siteHostSuspended => 'Suspended';

  @override
  String get settingsDomains => 'Domains';

  @override
  String get settingsDomainsHelp => 'Open your sites at a domain you own.';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String settingsSearchNone(String query) {
    return 'No settings match “$query”.';
  }

  @override
  String get domainsEmpty =>
      'Connect a domain you own, like bakery.com, and your site opens there.';

  @override
  String get domainsConnectOwn => 'Connect a Domain You Own';

  @override
  String get domainStateLive => 'Live';

  @override
  String get domainStateWaitingDns => 'Waiting for DNS';

  @override
  String get domainStateWaitingCert => 'Getting Its Certificate';

  @override
  String get domainStatePaused => 'Paused';

  @override
  String get domainStateNeedsAttention => 'Needs Attention';

  @override
  String get domainNoSite => 'No site yet';

  @override
  String get domainConnectField => 'Your domain';

  @override
  String get domainConnectHelp =>
      'Type it like bakery.com, www.bakery.com or shop.bakery.com.';

  @override
  String get domainConnectSite => 'Site to show';

  @override
  String get domainSiteNone => 'None';

  @override
  String get domainSiteNoneHelp =>
      'The domain shows nothing until you pick a site.';

  @override
  String get domainConnect => 'Connect';

  @override
  String get domainClaimTitle => 'Show it\'s yours';

  @override
  String get domainClaimBody =>
      'Another workspace has connected this domain. Add this record to show it\'s yours, then tap Connect again.';

  @override
  String get domainRecordType => 'Type';

  @override
  String get domainRecordName => 'Name';

  @override
  String get domainRecordValue => 'Value';

  @override
  String get domainSite => 'Site';

  @override
  String get domainPickSite => 'Choose a Site';

  @override
  String get domainHosts => 'Addresses';

  @override
  String get domainPrimary => 'Primary';

  @override
  String get domainPrimaryHelp =>
      'Visitors land here; the other addresses send them to it.';

  @override
  String get domainMakePrimary => 'Make Primary';

  @override
  String get domainRecordsTitle => 'Records to add';

  @override
  String get domainRecordsAtCloudflare =>
      'Add these at Cloudflare. Set the records to DNS only.';

  @override
  String domainRecordsAt(String provider) {
    return 'Add these in your DNS settings at $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Add these where your domain\'s DNS is managed, usually the company you bought it from.';

  @override
  String get domainRecordsNone => 'Nothing to add. You\'re all set.';

  @override
  String get domainRecordOptional => 'Optional';

  @override
  String domainRecordForward(String from, String to) {
    return 'Turn on forwarding from $from to $to at the company you bought the domain from.';
  }

  @override
  String get domainRecordFound => 'Found';

  @override
  String get domainRecordNotFound => 'Not found yet';

  @override
  String get domainCheckAgain => 'Check Again';

  @override
  String get domainCheckTooSoon =>
      'We just checked. Try again in a few seconds.';

  @override
  String get domainChecksItself =>
      'We also check by ourselves, so you can leave this screen.';

  @override
  String get domainHistory => 'History';

  @override
  String get domainEventConnected => 'Connected';

  @override
  String get domainEventProved => 'Records found';

  @override
  String get domainEventLive => 'Live';

  @override
  String get domainEventNeedsDns => 'Still waiting for DNS';

  @override
  String get domainEventFailed => 'Couldn\'t finish setting up';

  @override
  String get domainEventDisconnected =>
      'Records removed, so it was disconnected';

  @override
  String get domainEventPaused => 'Paused: your plan doesn\'t cover it';

  @override
  String get domainEventResumed => 'Back on';

  @override
  String get domainEventRemoved => 'Disconnected';

  @override
  String get domainEventClaim => 'Asked to show it\'s yours';

  @override
  String get domainEventClaimAttempt => 'Another workspace tried to connect it';

  @override
  String get domainEventOverLimit => 'Over your plan\'s limit';

  @override
  String get domainEventSuspended => 'Suspended';

  @override
  String get domainEventOther => 'Updated';

  @override
  String domainDisconnectTitle(String name) {
    return 'Disconnect $name?';
  }

  @override
  String get domainDisconnectBody =>
      'Your site stops opening at this domain. You can remove its records at your DNS company afterwards.';

  @override
  String get domainsFind => 'Find a Domain';

  @override
  String get domainsEmptyBuy =>
      'Buy a domain for your site, or connect one you own.';

  @override
  String get domainFindField => 'Name or a few words';

  @override
  String get domainFindHint => 'bakery';

  @override
  String get domainFindHelp => 'Prices are per year and before tax.';

  @override
  String get domainFindNone => 'No names found. Try other words.';

  @override
  String get domainFindNotOffered =>
      'Buying a domain isn\'t available in this app. You can still connect a domain you own.';

  @override
  String domainPricePerYear(String price) {
    return '$price a year plus tax';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Renews at $price';
  }

  @override
  String get domainReasonTaken => 'Taken';

  @override
  String get domainReasonPremium => 'Premium name, not sold here';

  @override
  String get domainReasonNotSold => 'Not sold here';

  @override
  String get domainBuy => 'Buy';

  @override
  String domainBuyTitle(String name) {
    return 'Buy $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price for the first year, then $renew a year, plus tax.';
  }

  @override
  String get domainBuyFinal =>
      'Sales are final once the domain is registered. If it can\'t be registered, you get a full refund.';

  @override
  String get domainBuyTerms => 'I accept the domain terms';

  @override
  String get domainBuyReadTerms => 'Read the Terms';

  @override
  String get domainRenewAuto => 'Renew Automatically';

  @override
  String get domainRenewAutoHelp =>
      'Charges your saved payment method about two weeks before it expires.';

  @override
  String get domainBuySite => 'Site to show';

  @override
  String get domainBuyPayInBrowser =>
      'Finish paying in your browser. This screen follows along.';

  @override
  String get domainContactTitle => 'Contact Details';

  @override
  String get domainContactHelp =>
      'The person or business the domain is registered to. Registrars keep these private.';

  @override
  String get domainContactFirstName => 'First name';

  @override
  String get domainContactLastName => 'Last name';

  @override
  String get domainContactOrganization => 'Business (optional)';

  @override
  String get domainContactAddress1 => 'Address';

  @override
  String get domainContactAddress2 => 'Address line 2 (optional)';

  @override
  String get domainContactCity => 'City';

  @override
  String get domainContactState => 'State or region';

  @override
  String get domainContactZip => 'Postal code';

  @override
  String get domainContactCountry => 'Country code';

  @override
  String get domainContactCountryHint => 'US';

  @override
  String get domainContactPhone => 'Phone';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'Email';

  @override
  String get domainContactRequired => 'Required';

  @override
  String get domainContactCountryInvalid => 'Use a two-letter code, like US';

  @override
  String get domainContactPhoneInvalid =>
      'Use international form, like +1 415 555 0100';

  @override
  String get domainContactEmailInvalid => 'Enter a valid email';

  @override
  String get domainContactSave => 'Save';

  @override
  String get domainContactSaved => 'Contact details saved.';

  @override
  String get domainContactChangeNote =>
      'Changes apply to every domain this workspace bought. A new email has to be confirmed again.';

  @override
  String get domainOrderTitle => 'Your Order';

  @override
  String get domainOrderWaitingPayment =>
      'Waiting for your payment in the browser.';

  @override
  String domainOrderRegistering(String name) {
    return 'Registering $name…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return 'Setting up $name…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'We couldn\'t register $name. Refunding you now…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'We couldn\'t register $name, so we refunded you in full.';
  }

  @override
  String get domainOrderAbandoned =>
      'This checkout wasn\'t paid, so nothing was charged.';

  @override
  String get domainOrderNeedsAttention =>
      'Something went wrong with this order. We\'ve been told and will sort it out.';

  @override
  String domainOrderDone(String name) {
    return '$name is yours.';
  }

  @override
  String get domainOrderLeave =>
      'You can leave this screen. We\'ll let you know when it\'s ready.';

  @override
  String get domainOrderBack => 'Back to Domains';

  @override
  String domainRenewsOn(String date) {
    return 'Renews on $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Expires on $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price a year plus tax';
  }

  @override
  String get domainRenewNow => 'Renew Now';

  @override
  String get domainRenewPayInBrowser =>
      'Finish paying in your browser. The new date shows here once it\'s paid.';

  @override
  String get domainRenewCharged =>
      'Renewed. The new date shows here in a minute.';

  @override
  String get domainRegistration => 'Registration';

  @override
  String domainExpired(String date) {
    return 'Expired on $date. Renew within 25 days of that date to keep it.';
  }

  @override
  String get domainLapsed =>
      'This domain has lapsed. Write to support to ask about restoring it; that isn\'t guaranteed.';

  @override
  String get domainSuspendedLine =>
      'This domain is suspended. Write to support to find out why.';

  @override
  String get domainVerifyTitle => 'Confirm the registrant email';

  @override
  String get domainVerifyBody =>
      'The registrar sent an email to the registrant\'s address. Open it and confirm, or the domain stops working.';

  @override
  String get domainVerifySendAgain => 'Send Again';

  @override
  String get domainVerifySent => 'Sent. Check the registrant\'s inbox.';

  @override
  String get domainDnsRecords => 'DNS Records';

  @override
  String get domainDnsRecordsHelp => 'Email, subdomains and site checks';

  @override
  String get domainMoveOut => 'Move to Another Registrar';

  @override
  String domainMoveOutAfter(String date) {
    return 'It can move after $date';
  }

  @override
  String get domainMoveOutHelp => 'Get a transfer code for another registrar';

  @override
  String domainMoveOutTitle(String name) {
    return 'Move $name?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'This unlocks the domain and shows its transfer code once. Type $name to confirm.';
  }

  @override
  String get domainMoveOutConfirm => 'Get Transfer Code';

  @override
  String domainMoveOutLocked(String date) {
    return 'It can move after $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Transfer code';

  @override
  String get domainTransferCodeBody =>
      'Give this code to the new registrar. It\'s shown only this once, so copy it now.';

  @override
  String get domainTransferCode => 'Code';

  @override
  String get domainUnlocked => 'Unlocked for a move';

  @override
  String get domainLockAgain => 'Lock Again';

  @override
  String get domainLocked => 'Locked again.';

  @override
  String get domainReauthTitle => 'Sign In Again';

  @override
  String get domainReauthSendCode => 'Email Me a Code';

  @override
  String domainReauthCodeSent(String email) {
    return 'We sent a code to $email.';
  }

  @override
  String get domainReauthCode => 'Code from the email';

  @override
  String get domainReauthSignIn => 'Sign In';

  @override
  String get domainReauthSignOut =>
      'Sign out and in again, then try once more.';

  @override
  String get dnsRecordsEmpty => 'No records yet.';

  @override
  String get dnsRecordAdd => 'Add Record';

  @override
  String get dnsRecordEdit => 'Edit Record';

  @override
  String get dnsRecordManaged => 'Used by your Casama site';

  @override
  String get dnsRecordType => 'Type';

  @override
  String get dnsRecordHost => 'Name';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Leave empty for $name itself, or type www, shop…';
  }

  @override
  String get dnsRecordAnswer => 'Value';

  @override
  String get dnsRecordTtl => 'TTL (seconds)';

  @override
  String get dnsRecordPriority => 'Priority';

  @override
  String get dnsRecordSave => 'Save';

  @override
  String get dnsRecordDeleteTitle => 'Delete this record?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 seconds or more';

  @override
  String get dnsRecordAnswerRequired => 'Required';

  @override
  String get adminDomains => 'Domains';

  @override
  String get adminMail => 'Mail';

  @override
  String adminMailHealth(int sent, int bounced, int complained) {
    return '$sent sent · $bounced bounced · $complained complained in 30 days';
  }

  @override
  String get adminMailAutoPaused => 'Paused automatically';

  @override
  String get adminMailPause => 'Pause';

  @override
  String adminMailPauseTitle(String address) {
    return 'Pause $address?';
  }

  @override
  String get adminMailLift => 'Lift';

  @override
  String adminMailLiftTitle(String address) {
    return 'Lift the pause on $address?';
  }

  @override
  String get adminMailLiftBody =>
      'This clears the automatic pause. The owner can pause it again themselves.';

  @override
  String get adminMailReserved => 'Reserved names';

  @override
  String get adminMailReservedHelp =>
      'One name per line. Nobody can claim these, on top of the built-in list.';

  @override
  String get adminDomainsConnected => 'Connected';

  @override
  String get adminDomainsRegistered => 'Bought';

  @override
  String get adminDomainsLiveHosts => 'Live addresses';

  @override
  String get adminDomainsSuspended => 'Suspended';

  @override
  String get adminDomainsBalance => 'Registrar balance';

  @override
  String get adminDomainsBalanceUnknown => 'Not available';

  @override
  String get adminDomainsOrders => 'Orders that need a person';

  @override
  String get adminDomainsNoOrders => 'No orders need a person.';

  @override
  String get adminDomainsList => 'Domains';

  @override
  String get adminDomainsNone => 'No domains yet.';

  @override
  String get adminDomainsApprove => 'Approve';

  @override
  String get adminDomainsRetry => 'Retry';

  @override
  String get adminDomainsApproved => 'Approved. Registering now.';

  @override
  String get adminDomainsRetried => 'Trying again.';

  @override
  String get adminDomainsSuspend => 'Suspend';

  @override
  String get adminDomainsUnsuspend => 'Unsuspend';

  @override
  String adminDomainsSuspendTitle(String name) {
    return 'Suspend $name?';
  }

  @override
  String get adminDomainsSuspendBody =>
      'Its site goes offline and the domain is locked at the registrar.';

  @override
  String adminDomainsUnsuspendTitle(String name) {
    return 'Unsuspend $name?';
  }

  @override
  String get adminDomainsUnsuspendBody =>
      'Its site comes back and the domain works again.';

  @override
  String adminDomainsAttempts(int count) {
    return '$count tries';
  }

  @override
  String get adminDomainsNoWorkspace => 'No workspace';

  @override
  String get deleteAccountDomains => 'Bought domains in your workspaces';

  @override
  String get deleteAccountDomainsBody =>
      'These domains stay registered until they expire. They won\'t renew, and their sites go offline.';

  @override
  String get whatsNew010Sites =>
      'Put a page on the web at its own address, and use your own domain for it.';

  @override
  String get inAppAlertOpen => 'Open';

  @override
  String get pushPrefsTitle => 'Notifications';

  @override
  String get pushPrefsHelp =>
      'Choose what buzzes your devices. Everything still lands in your inbox.';

  @override
  String get pushAllOn => 'All on';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Replies off',
      'needsYou': 'Needs you off',
      'routines': 'Routines and briefs off',
      'suggestions': 'Suggestions and check-ins off',
      'other': 'Account off',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count kinds off';
  }

  @override
  String get pushReplies => 'Replies';

  @override
  String get pushRepliesHelp =>
      'When a bot answers something you asked, if you\'ve left the chat.';

  @override
  String get pushNeedsYou => 'Needs you';

  @override
  String get pushNeedsYouHelp =>
      'Approvals, passwords and takeovers your bots are waiting for.';

  @override
  String get pushNeedsYouOffWarning =>
      'Off: your bots will wait until you open the app.';

  @override
  String get pushRoutines => 'Routines and briefs';

  @override
  String get pushRoutinesHelp => 'Results of routines and your morning brief.';

  @override
  String get pushSuggestions => 'Suggestions and check-ins';

  @override
  String get pushSuggestionsHelp => 'Things your bots offer to do for you.';

  @override
  String get pushAccount => 'Account';

  @override
  String get pushAccountHelp =>
      'Credits running low, projects and your server.';

  @override
  String get pushHideReplyText => 'Hide reply text';

  @override
  String get pushHideReplyTextHelp =>
      'Notifications say a bot replied, without its words.';

  @override
  String get reactToMessage => 'React';

  @override
  String get moreReactions => 'More reactions';

  @override
  String get reactionsTitle => 'Reactions';

  @override
  String get reactionsAll => 'All';

  @override
  String get reactionsYou => 'You';

  @override
  String get reactionsTapToRemove => 'Tap to remove';

  @override
  String get reactionsNone => 'No reactions yet.';

  @override
  String get reactionsLoadFailed => 'Couldn\'t load who reacted.';

  @override
  String get searchEmoji => 'Search emoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reactions',
      one: '1 reaction',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reactions',
      one: '1 reaction',
    );
    return '$emoji, $_temp0, including yours';
  }

  @override
  String reactionQuick(String emoji) {
    return 'React with $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Remove your $emoji reaction';
  }

  @override
  String get packsShelfTitle => 'Packs';

  @override
  String get packsShelfHelp =>
      'Bots, skills and routines that work together, added in one go.';

  @override
  String get packReviewed => 'Reviewed';

  @override
  String get packNotReviewed => 'Not reviewed by Casama';

  @override
  String packCountBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String packCountSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skills',
      one: '1 skill',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routines',
      one: '1 routine',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '1 app',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count looks',
      one: '1 look',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tools',
      one: '1 tool',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Starter set';

  @override
  String get packAddFromLink => 'Add a pack from a link';

  @override
  String get packAddFromLinkHelp =>
      'Paste a GitHub link to a pack and see what it adds first.';

  @override
  String get packAddFromFile => 'Add from a file';

  @override
  String get packAddFromFileHelp => 'Pick a pack\'s .zip file.';

  @override
  String get packLinkLabel => 'GitHub link';

  @override
  String get packFileUnreadable => 'That file isn\'t a pack\'s .zip.';

  @override
  String get packFileTooBig => 'That file is too big for a pack.';

  @override
  String packSource(String where, String commit) {
    return '$where at $commit';
  }

  @override
  String get packFromFile => 'From a file';

  @override
  String get packFromShare => 'Shared with you';

  @override
  String get packAlreadyHere => 'This workspace already has this pack.';

  @override
  String get packOpenInstalled => 'See installed packs';

  @override
  String get packAdd => 'Add pack';

  @override
  String packWizardTitle(String name) {
    return 'Add $name';
  }

  @override
  String get packWhatsInside => 'What\'s inside';

  @override
  String get packWhatsInsideHelp => 'Untick anything you don\'t want.';

  @override
  String get packSectionBots => 'Bots';

  @override
  String get packSectionSkills => 'Skills';

  @override
  String get packSectionRoutines => 'Routines';

  @override
  String get packSectionApps => 'Apps';

  @override
  String get packSectionLooks => 'Looks';

  @override
  String get packSectionIncludes => 'From the gallery';

  @override
  String get packSectionTools => 'Tools';

  @override
  String get packSkillRunsScripts => 'Runs scripts on the bot\'s computer';

  @override
  String get packSkillForWorkspace => 'For the whole workspace';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Runs about $count times a week',
      one: 'Runs about once a week',
      zero: 'Runs now and then',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Talks to $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Connects to $url';
  }

  @override
  String get packIncludeMissing => 'Not found in the gallery';

  @override
  String get packLookHelp => 'You can use it on this device after adding.';

  @override
  String get packNothingTicked => 'Tick at least one thing to add.';

  @override
  String get packQuestions => 'A few questions';

  @override
  String get packQuestionsHelp =>
      'The pack fills these into its bots and routines.';

  @override
  String get packSecretsTitle => 'Keys and settings';

  @override
  String get packSecretsHelp => 'The pack\'s tools need these to work.';

  @override
  String get packReachTitle => 'What it can reach';

  @override
  String get packReachHelp => 'Worked out by Casama from the pack\'s files.';

  @override
  String get packReachRunsCode => 'Runs code';

  @override
  String get packReachComputer => 'Uses the bot\'s computer';

  @override
  String packReachHosts(String hosts) {
    return 'Talks to $hosts';
  }

  @override
  String get packReachNoHosts => 'Doesn\'t talk to other sites';

  @override
  String packReachSecrets(String names) {
    return 'Uses keys: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'About $count scheduled runs a week',
      one: 'About 1 scheduled run a week',
      zero: 'No scheduled runs',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama hasn\'t reviewed this pack. Add it only if you trust where it comes from. Its routines start switched off.';

  @override
  String get packPickBotTitle => 'Which bot gets it?';

  @override
  String get packPickBotHelp =>
      'This pack brings no bot. Pick one for its routines and tools.';

  @override
  String packDoneTitle(String name) {
    return '$name is in';
  }

  @override
  String get packDoneHelp => 'Here\'s what it added.';

  @override
  String get packPendingHelp =>
      'We\'ve asked an admin. The pack is added once they approve.';

  @override
  String get packStatusInstalled => 'Added';

  @override
  String get packStatusPending => 'Waiting for an admin';

  @override
  String get packStatusSkipped => 'Skipped';

  @override
  String get packStatusFailed => 'Didn\'t work';

  @override
  String get packStatusDevice => 'On this device';

  @override
  String get packConnectTitle => 'Connect its apps';

  @override
  String get packConnectHelp => 'Its bots work fully once these are connected.';

  @override
  String get packLooksTitle => 'Use a look on this device?';

  @override
  String get packUseLook => 'Use';

  @override
  String get packLookInUse => 'In use';

  @override
  String get packInstalledTitle => 'That pack is already here';

  @override
  String get packsInstalledTitle => 'Installed packs';

  @override
  String get packsInstalledRow => 'Packs this workspace added, with updates';

  @override
  String get packsInstalledEmpty =>
      'No packs yet. Find one on the Packs shelf, or add one from a link.';

  @override
  String get packEditedBadge => 'Edited by you';

  @override
  String get packRemove => 'Remove';

  @override
  String get packUpToDate => 'This pack is up to date.';

  @override
  String get packCantCheck =>
      'This pack came from a file or link and can\'t check for updates.';

  @override
  String packUpdateTitle(String name) {
    return 'Update $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'New: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Removed: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Changed: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'New sites it talks to: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'New keys it needs: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'New schedules: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Scheduled runs a week: $from → $to';
  }

  @override
  String get packDiffNone => 'Nothing you\'d notice changed.';

  @override
  String get packEditedTitle => 'Things you changed';

  @override
  String get packEditedHelp => 'Your version stays unless you switch it.';

  @override
  String get packTakeTheirs => 'Use the pack\'s version';

  @override
  String get packReachGrewTitle => 'It reaches further';

  @override
  String get packReachGrewHelp =>
      'The new version can reach more than the one you have.';

  @override
  String get packReachConfirm => 'I\'ve checked what it can reach now';

  @override
  String packUpdated(String name) {
    return '$name is updated.';
  }

  @override
  String packRemoveTitle(String name) {
    return 'Remove $name?';
  }

  @override
  String get packRemoveBody =>
      'Its tools and keys go, and skills and routines you didn\'t change. App connections stay.';

  @override
  String get packRemoveBots => 'Also delete the bots this pack created';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pack removed. $count items stayed because you changed them.',
      one: 'Pack removed. 1 item stayed because you changed it.',
      zero: 'Pack removed.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Share as pack';

  @override
  String get sharePackRow => 'Bundle bots and skills for someone else';

  @override
  String get sharePackHelp =>
      'Keys, chats, memories, About you and the model choice are never included.';

  @override
  String get sharePackBots => 'Bots';

  @override
  String get sharePackBotsHelp =>
      'Pick up to 5. Each brings its instructions, skills and routines.';

  @override
  String get sharePackSkills => 'Workspace skills';

  @override
  String get sharePackName => 'Name';

  @override
  String get sharePackSummary => 'One line about it';

  @override
  String get sharePackLook => 'Include this device\'s theme';

  @override
  String get sharePackCheck => 'Check and share';

  @override
  String get sharePackFindingsTitle => 'Some lines look like keys';

  @override
  String get sharePackFindingsHelp =>
      'Check these before you share. Go back to fix them, or share if they\'re safe.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, line $line: $what';
  }

  @override
  String get sharePackGoBack => 'Go back';

  @override
  String get sharePackAnyway => 'Share anyway';

  @override
  String get sharePackLinkTitle => 'Your pack link';

  @override
  String sharePackLinkHelp(String date) {
    return 'Anyone signed in to Casama can open it until $date.';
  }

  @override
  String get sharePackShare => 'Share';

  @override
  String get sharePackSaveFile => 'Save as file';

  @override
  String get sharePackLinkCopied => 'Link copied.';

  @override
  String get sharePackStop => 'Stop sharing';

  @override
  String get sharePackStopped => 'The link no longer works.';

  @override
  String pluginFromPack(String pack) {
    return 'From the $pack pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Update or remove it with its pack, in Gallery → Installed packs.';

  @override
  String get pluginSettings => 'Settings';

  @override
  String get pluginEditSettings => 'Edit settings';

  @override
  String get pluginSettingsSaved => 'Settings saved.';

  @override
  String get galleryPolicyKeyHelp =>
      'You can also type a repository (repo/owner:name) or a pack (pack/name).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Add $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Pack: $name';
  }

  @override
  String get reportPackShare => 'Report this pack';

  @override
  String get appLock => 'App lock';

  @override
  String get appLockRow => 'Ask to unlock Casama when it opens';

  @override
  String get appLockHelp =>
      'Casama asks you to unlock it when it opens and after time away. While it\'s on, your sign-in is kept in this device\'s keychain.';

  @override
  String get appLockSwitch => 'Lock Casama';

  @override
  String get appLockLocked => 'Casama Is Locked';

  @override
  String get appLockUnlock => 'Unlock';

  @override
  String get appLockUnlockWithPasskey => 'Unlock with a Passkey';

  @override
  String get appLockUnlockReason => 'Unlock Casama';

  @override
  String get appLockTurnOnReason => 'Turn on the app lock';

  @override
  String get appLockConfirmReason => 'Confirm it\'s you';

  @override
  String get appLockConfirmTitle => 'Confirm It\'s You';

  @override
  String appLockUnlockWith(String method) {
    return 'Use $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID or your passcode';

  @override
  String get appLockDeviceAndroid => 'your fingerprint, face or screen lock';

  @override
  String get appLockDeviceMac => 'Touch ID or your Mac\'s password';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'your device\'s screen lock';

  @override
  String appLockMethodDevice(String method) {
    return 'Unlocks with $method';
  }

  @override
  String get appLockMethodPin => 'Unlocks with a 6-digit PIN';

  @override
  String get appLockMethodPasskey => 'Unlocks with a passkey';

  @override
  String get appLockPinHint => 'Enter your PIN';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wrong PIN. $count tries left.',
      one: 'Wrong PIN. 1 try left.',
      zero: 'Wrong PIN.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Too many wrong PINs. Sign out, then sign in again to open Casama.';

  @override
  String get appLockFailed => 'That didn\'t work. Try again.';

  @override
  String get appLockUnavailable =>
      'This device can\'t unlock Casama right now. Sign out, then sign in again to get back in.';

  @override
  String get appLockSignOutConfirm =>
      'Signing out turns the app lock off on this device. Sign in again to open Casama.';

  @override
  String get appLockCallRinging => 'A call is ringing. Unlock to answer it.';

  @override
  String get appLockRequiredTitle => 'Turn On the App Lock';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace requires the app lock on every device that opens Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'This browser can\'t use passkeys with this server, so it can\'t lock Casama. Open Casama in the app on your phone or computer.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'On. Required by $workspace';
  }

  @override
  String get appLockTurnOn => 'Turn On';

  @override
  String get appLockTurnedOn => 'App lock is on';

  @override
  String get appLockNoWayHere =>
      'This browser can\'t use passkeys with this server, so Casama can\'t be locked here.';

  @override
  String get appLockNotChecked => 'Couldn\'t confirm it\'s you.';

  @override
  String get appLockPinSetupTitle => 'Choose a PIN';

  @override
  String get appLockPinAgainTitle => 'Enter the PIN Again';

  @override
  String get appLockPinSetupBody =>
      '6 digits. You\'ll enter it to open Casama.';

  @override
  String get appLockPinNext => 'Continue';

  @override
  String get appLockPinMismatch => 'The PINs didn\'t match. Choose one again.';

  @override
  String get appLockPinNotSaved => 'Couldn\'t save the PIN on this device.';

  @override
  String get appLockPinChanged => 'PIN changed';

  @override
  String get appLockChangePin => 'Change PIN';

  @override
  String get appLockAfter => 'Lock after';

  @override
  String get appLockAfterHelp =>
      'Time in the background, minimised, or behind other apps on a computer.';

  @override
  String get appLockAfterImmediately => 'Right away';

  @override
  String get appLockAfterOneMinute => '1 minute';

  @override
  String get appLockAfterFiveMinutes => '5 minutes';

  @override
  String get appLockAfterFifteenMinutes => '15 minutes';

  @override
  String get appLockAfterOneHour => '1 hour';

  @override
  String get appLockBlockScreenshots => 'Block screenshots';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Screenshots, screen recordings and screen sharing show nothing of Casama.';

  @override
  String get appLockLockNow => 'Lock now';

  @override
  String get appLockPrivacySection => 'More privacy';

  @override
  String get appLockAskBeforeRisky => 'Confirm risky actions';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Unlock again before deleting your account, making keys, changing billing, exporting data, approving high-risk requests and taking over a computer.';

  @override
  String get requireAppLock => 'Require the app lock';

  @override
  String get requireAppLockHelp =>
      'Members must lock Casama on every device before it opens. On the web that takes a passkey.';

  @override
  String get requireAppLockOwnFirst =>
      'Turn on the app lock on this device first.';

  @override
  String get permLocation => 'Location';

  @override
  String get permLocationAlways => 'Location in the background';

  @override
  String get permCamera => 'Camera';

  @override
  String get permMicrophone => 'Microphone';

  @override
  String get permSpeech => 'Speech recognition';

  @override
  String get permPhotos => 'Photos';

  @override
  String get permContacts => 'Contacts';

  @override
  String get permCalendar => 'Calendars';

  @override
  String get permHealth => 'Health';

  @override
  String get permNotifications => 'Notifications';

  @override
  String get permNotificationAccess => 'Notification access';

  @override
  String get permAccessibility => 'Accessibility';

  @override
  String get permScreenRecording => 'Screen Recording';

  @override
  String get permAutomation => 'Automation';

  @override
  String get permFullDisk => 'Full Disk Access';

  @override
  String get permSharedFolders => 'Shared folders';

  @override
  String get permLocalTools => 'Local tools';

  @override
  String get cardPermissions => 'Permissions';

  @override
  String permissionsTitle(String device) {
    return 'Turn these on for $device';
  }

  @override
  String get permStateOn => 'On';

  @override
  String get permStateOff => 'Off';

  @override
  String get permStateNotAsked => 'Not asked yet';

  @override
  String get permStateLimited => 'Limited';

  @override
  String get permStateUnknown => 'Unknown';

  @override
  String get permStateUnavailable => 'Not available on this device';

  @override
  String get permStateUpdate => 'Update Casama to turn this on here';

  @override
  String get permTurnOn => 'Turn on';

  @override
  String get permOpenSettings => 'Open settings';

  @override
  String get permOpenHealth => 'Open Health';

  @override
  String get permHealthIosHow =>
      'In Health, tap your picture, then Apps, then Casama, and turn on what your bots may read.';

  @override
  String get permChoose => 'Choose';

  @override
  String get permRestart => 'Restart Casama';

  @override
  String get permRestartToFinish => 'Restart Casama to finish';

  @override
  String permOpenedOn(String device) {
    return 'Opened on $device';
  }

  @override
  String permSentTo(String device) {
    return 'Sent to $device: tap the notification there';
  }

  @override
  String permOffline(String device) {
    return '$device is offline';
  }

  @override
  String permRestarting(String device) {
    return 'Restarting Casama on $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Only $device\'s owner can turn these on';
  }

  @override
  String get permNotNowLine => 'Not now';

  @override
  String get permContinue => 'Continue';

  @override
  String get permContinueMessage => 'They\'re on, go ahead.';

  @override
  String get permContinuedLine => 'Turned on';

  @override
  String get permissionsScreenTitle => 'Permissions';

  @override
  String get permissionsScreenHelp =>
      'What bots can use on this device. Nothing is asked until you tap.';

  @override
  String get permissionsRowHelp =>
      'Location, screen, microphone and more on this device';

  @override
  String permOtherDevice(String device) {
    return 'This was for $device. Open Casama there to turn it on.';
  }

  @override
  String get permAnotherDevice => 'another device';

  @override
  String get permissionsNone => 'Nothing to turn on on this device.';

  @override
  String get widgetNeedsYou => 'Needs you';

  @override
  String get widgetAllClear => 'All clear';

  @override
  String get widgetAllow => 'Allow';

  @override
  String get widgetDeny => 'Deny';

  @override
  String get widgetReview => 'Review';

  @override
  String get widgetOpen => 'Open';

  @override
  String get widgetDoIt => 'Do it';

  @override
  String get widgetRunNow => 'Run now';

  @override
  String get widgetStarted => 'Started';

  @override
  String get widgetStop => 'Stop';

  @override
  String get widgetAsk => 'Ask';

  @override
  String widgetAskBot(String bot) {
    return 'Ask $bot';
  }

  @override
  String get widgetTalk => 'Talk';

  @override
  String get widgetTry => 'Try';

  @override
  String get widgetUpNext => 'Up next';

  @override
  String get widgetNoRoutines => 'No routines yet';

  @override
  String get widgetWorking => 'Working';

  @override
  String get widgetWaiting => 'Waiting for you';

  @override
  String get widgetIdle => 'Idle';

  @override
  String widgetRepliedAt(String time) {
    return 'Replied $time';
  }

  @override
  String get widgetBrief => 'Brief';

  @override
  String widgetBriefAt(String time) {
    return 'Brief at $time';
  }

  @override
  String get widgetNoBrief => 'No brief yet';

  @override
  String get widgetToday => 'Today';

  @override
  String get widgetCredits => 'Credits';

  @override
  String widgetCreditsLeft(String amount) {
    return '$amount left';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount today';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n% used';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Resets $time';
  }

  @override
  String get widgetFinished => 'Finished';

  @override
  String get widgetLibrary => 'Library';

  @override
  String get widgetNoCreations => 'Nothing made yet';

  @override
  String get widgetTasks => 'Tasks';

  @override
  String get widgetTodo => 'To do';

  @override
  String get widgetInProgress => 'In progress';

  @override
  String get widgetInReview => 'In review';

  @override
  String get widgetBlocked => 'Blocked';

  @override
  String get widgetSignIn => 'Open Casama to sign in';

  @override
  String get widgetNoBots => 'Meet your first bot';

  @override
  String widgetAsOf(String time) {
    return 'as of $time';
  }

  @override
  String get widgetUpdateServer =>
      'Update your Casama server to use this widget';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot needs your OK';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot suggests';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot needs you to take over';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Next brief $time';
  }

  @override
  String get widgetNothingNext => 'Nothing scheduled';

  @override
  String get widgetsTitle => 'Widgets';

  @override
  String get widgetsRow => 'Your bots on the Home screen and Lock Screen';

  @override
  String get widgetsIntro =>
      'Widgets show what your bots are doing and what waits on you, without opening Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Routines';

  @override
  String get widgetDescNeedsYou => 'See which bots are waiting on you';

  @override
  String get widgetDescBot => 'See what one bot is doing';

  @override
  String get widgetDescAsk => 'Ask or talk to a bot in one tap';

  @override
  String get widgetDescRoutines => 'See what runs next and run it now';

  @override
  String get widgetDescToday => 'See your whole day on one large widget';

  @override
  String get widgetDescBrief => 'Read your morning brief';

  @override
  String get widgetDescLibrary => 'See what your bots made lately';

  @override
  String get widgetDescTasks => 'See where the task board stands';

  @override
  String get widgetDescCredits => 'Keep an eye on your credits';

  @override
  String get widgetsAddToHome => 'Add to Home screen';

  @override
  String get widgetsPinUnsupported =>
      'Your launcher can\'t add widgets from here. Touch and hold an empty spot on your Home screen, tap Widgets, and pick Casama.';

  @override
  String get widgetsHowToAdd => 'How to add';

  @override
  String get widgetsHowToIos =>
      'Touch and hold an empty spot on your Home Screen, tap Edit, then Add Widget, and pick Casama.';

  @override
  String get widgetsHowToMac =>
      'Click the date and time in the menu bar, then Edit Widgets, and pick Casama. Or right-click the desktop and choose Edit Widgets.';

  @override
  String get widgetsLockScreen => 'Lock Screen and controls';

  @override
  String get widgetsLockScreenHelp =>
      'Touch and hold the Lock Screen, tap Customize, then Lock Screen, and tap the space under the clock to add Needs you, Up next, Bot or Credits. A request stays hidden until you unlock.';

  @override
  String get widgetsControlsHelp =>
      'Open Control Center, touch and hold, tap Add a Control, and pick Ask Casama, Talk to a bot or Run a routine. They also fit the Lock Screen corners and the Action button.';

  @override
  String get widgetsShowDetails => 'Show details in widgets';

  @override
  String get widgetsShowDetailsHelp =>
      'With the app lock on, widgets show only numbers and bot names, and their buttons open Casama. Turn this on to show requests, messages and routine names too.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Only matters while the app lock is on. Without it, widgets show details.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace requires the app lock, so widgets keep details hidden.';
  }

  @override
  String get widgetsPinBot => 'Pin a bot to your Home screen';

  @override
  String get widgetsPinBotHelp =>
      'Puts the bot on your Home screen as its own icon. Tap it to chat.';

  @override
  String get widgetsPin => 'Pin';

  @override
  String get widgetNudgeNeedsYou =>
      'Answer requests from your Home screen with the Needs you widget.';

  @override
  String get widgetNudgeRoutines =>
      'Run routines from your Home screen with the Routines widget.';

  @override
  String get widgetNameCanvas => 'Canvas';

  @override
  String get widgetDescCanvas =>
      'Shows what your bots put there, like a daily verse or a countdown';

  @override
  String get canvasEmpty => 'Ask a bot to put something here';

  @override
  String get canvasTry => 'Try: put a daily verse on my Lock Screen';

  @override
  String get canvasAutomatic => 'Automatic';

  @override
  String canvasIn(String time) {
    return 'in $time';
  }

  @override
  String canvasSince(String time) {
    return '$time since';
  }

  @override
  String get canvasNow => 'Now';

  @override
  String canvasLeft(String n) {
    return '$n left';
  }

  @override
  String get canvasLeftUnit => 'left';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widgets';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot wants to show this on your widgets';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Once you say yes, $bot can change it without asking. You can stop it any time in Settings, Widgets.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot put this on your widgets';
  }

  @override
  String get canvasShow => 'Show on my widgets';

  @override
  String get canvasShowing => 'Showing on your widgets';

  @override
  String canvasNotShown(String bot) {
    return 'Not shown. $bot can ask again another day.';
  }

  @override
  String get canvasGone => 'No longer on your widgets';

  @override
  String get canvasNotPlaced => 'Add the Canvas widget to see it.';

  @override
  String get canvasHowToIos =>
      'Touch and hold the Home Screen or Lock Screen, tap Edit, then Add Widget, and pick Casama, then Canvas.';

  @override
  String get canvasHowToMac =>
      'Right-click the desktop, choose Edit Widgets, and pick Casama, then Canvas.';

  @override
  String get canvasHowToElsewhere =>
      'Add Casama\'s Canvas widget on your phone or Mac to see it there.';

  @override
  String get canvasAdded => 'Canvas widget added';

  @override
  String get canvasLockScreen => 'On the Lock Screen';

  @override
  String get widgetsFromBots => 'From your bots';

  @override
  String get widgetsFromBotsEmpty =>
      'Nothing yet. Ask a bot something like \"Put a daily verse on my Lock Screen\".';

  @override
  String canvasSetAt(String time) {
    return 'Set $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Showing on $devices';
  }

  @override
  String get canvasNoWidget => 'No Canvas widget placed yet';

  @override
  String get canvasPausedLine => 'Paused';

  @override
  String get canvasWaitingLine => 'Waiting for your yes';

  @override
  String get canvasHideLocked => 'Hide on a locked phone';

  @override
  String get canvasPause => 'Pause';

  @override
  String get canvasResume => 'Resume';

  @override
  String get canvasClear => 'Clear';

  @override
  String canvasClearTitle(String name) {
    return 'Clear $name?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'It comes off your widgets. $bot can put something there again.';
  }

  @override
  String get canvasAllowedBots => 'Bots on your widgets';

  @override
  String get canvasMayShow => 'May show things on your widgets';

  @override
  String canvasStopTitle(String bot) {
    return 'Stop $bot?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'What $bot shows on your widgets is cleared, and it has to ask again.';
  }

  @override
  String get canvasStop => 'Stop';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Android phone';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Show me';

  @override
  String get widgetLowRisk => 'Low risk';

  @override
  String get widgetThisMonth => 'This month';

  @override
  String get watchNow => 'Now';

  @override
  String get watchAsk => 'Ask';

  @override
  String watchAskBot(String bot) {
    return 'Ask $bot';
  }

  @override
  String get watchBots => 'Bots';

  @override
  String get watchUpNext => 'Up next';

  @override
  String get watchBrief => 'Brief';

  @override
  String get watchSettings => 'Settings';

  @override
  String get watchChat => 'Chat';

  @override
  String get watchTalk => 'Talk';

  @override
  String get watchCredits => 'Credits';

  @override
  String get watchNeedsYou => 'Needs you';

  @override
  String get watchNeedsYouOne => '1 needs you';

  @override
  String watchNeedsYouMany(String count) {
    return '$count need you';
  }

  @override
  String get watchNeedsOk => 'Needs your OK';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot needs your OK';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot suggests';
  }

  @override
  String get watchTakeOver => 'Wants you to take over';

  @override
  String get watchAllClear => 'All clear';

  @override
  String get watchNothingWaiting => 'Nothing needs you';

  @override
  String get watchAllow => 'Allow';

  @override
  String get watchDeny => 'Deny';

  @override
  String get watchHoldToAllow => 'Hold to allow';

  @override
  String get watchHoldHint => 'Allow this? Double tap to allow.';

  @override
  String get watchReview => 'Review';

  @override
  String get watchReviewOnIphone => 'Review on iPhone';

  @override
  String get watchReviewOnPhone => 'Review on phone';

  @override
  String get watchWhyHighRisk => 'High risk: answer on your phone';

  @override
  String get watchWhyPayment => 'Payments are answered on your phone';

  @override
  String get watchWhySetting => 'Your settings keep this on your phone';

  @override
  String get watchWhyWorkspace => 'Your workspace keeps this on your phone';

  @override
  String get watchWhyNotYours =>
      'Only the person who started this chat can allow it';

  @override
  String get watchHighRisk => 'High risk';

  @override
  String get watchMediumRisk => 'Medium risk';

  @override
  String get watchLowRisk => 'Low risk';

  @override
  String get watchAllowed => 'Allowed';

  @override
  String get watchDenied => 'Denied';

  @override
  String get watchDone => 'Done';

  @override
  String get watchAlreadyAnswered => 'Already answered';

  @override
  String get watchLockToAllow =>
      'Set a passcode on this watch to allow from it';

  @override
  String get watchDoIt => 'Do It';

  @override
  String get watchNotNow => 'Not now';

  @override
  String get watchOpenOnIphone => 'Open on iPhone';

  @override
  String get watchOpenOnPhone => 'Open on phone';

  @override
  String get watchSentToPhone => 'Sent to your phone';

  @override
  String get watchWorking => 'Working';

  @override
  String watchIsWorking(String bot) {
    return '$bot is working';
  }

  @override
  String get watchWaitingForYou => 'Waiting for you';

  @override
  String watchRepliedAt(String time) {
    return 'Replied $time';
  }

  @override
  String get watchIdle => 'Idle';

  @override
  String get watchOff => 'Off';

  @override
  String watchStepCount(String count) {
    return 'Step $count';
  }

  @override
  String get watchStop => 'Stop';

  @override
  String get watchStopped => 'Stopped';

  @override
  String get watchFinished => 'Finished';

  @override
  String get watchProblem => 'Stopped with a problem';

  @override
  String get watchCouldntFinish => 'Couldn\'t finish';

  @override
  String get watchListening => 'Listening…';

  @override
  String get watchTapToStop => 'Tap to stop';

  @override
  String get watchTypeInstead => 'Type instead';

  @override
  String get watchSending => 'Sending…';

  @override
  String get watchHeard => 'Heard';

  @override
  String get watchUndo => 'Undo';

  @override
  String get watchKeptOffline => 'Saved. It sends when you\'re back online';

  @override
  String watchKeptOld(String time) {
    return 'Send what you asked at $time?';
  }

  @override
  String get watchSend => 'Send';

  @override
  String get watchDiscard => 'Discard';

  @override
  String get watchMicDenied =>
      'Allow the microphone in Settings to ask by voice';

  @override
  String get watchNoDictation =>
      'This server has no voice service. Use Type instead';

  @override
  String get watchDidntCatch => 'Didn\'t catch that. Try again';

  @override
  String get watchReply => 'Reply';

  @override
  String get watchReadAloud => 'Read aloud';

  @override
  String get watchStopReading => 'Stop reading';

  @override
  String get watchContinuesOnIphone => 'Continues on iPhone';

  @override
  String get watchContinuesOnPhone => 'Continues on phone';

  @override
  String get watchReplyReady => 'Reply ready';

  @override
  String get watchYou => 'You';

  @override
  String get watchQuickYes => 'Yes';

  @override
  String get watchQuickNo => 'No';

  @override
  String get watchQuickTellMore => 'Tell me more';

  @override
  String get watchQuickNotNow => 'Not now';

  @override
  String get watchRunNow => 'Run Now';

  @override
  String get watchStarted => 'Started';

  @override
  String watchInMinutes(String minutes) {
    return 'in $minutes min';
  }

  @override
  String get watchNoRoutines => 'No routines yet';

  @override
  String watchBriefAt(String time) {
    return 'Brief at $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Brief at $time tomorrow';
  }

  @override
  String get watchNoBrief => 'No brief set up';

  @override
  String get watchNoBots => 'No bots yet. Make one on your phone';

  @override
  String get watchSigningIn => 'Signing you in';

  @override
  String watchSignedInAs(String name) {
    return 'Signed in as $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Open Casama on your iPhone to finish';

  @override
  String get watchOpenPhoneToFinish => 'Open Casama on your phone to finish';

  @override
  String get watchUseCode => 'Sign in with a code';

  @override
  String get watchCodeHelp =>
      'Type it in Casama on your phone or computer: Settings → Watch';

  @override
  String get watchNewCode => 'New code';

  @override
  String get watchSignedOut => 'This watch is signed out';

  @override
  String get watchOpenToSignIn => 'Open Casama to sign in';

  @override
  String watchAsOf(String time) {
    return 'as of $time';
  }

  @override
  String get watchOffline => 'Offline';

  @override
  String get watchCouldntReach => 'Couldn\'t reach Casama';

  @override
  String get watchTryAgain => 'Try again';

  @override
  String get watchServerTooOld => 'Update your Casama server to use the watch';

  @override
  String get watchOutOfCredits => 'Out of credits';

  @override
  String get watchTalkOnPhone => 'Starting the call on your phone';

  @override
  String get watchSignOut => 'Sign out of this watch';

  @override
  String get watchHideDetails => 'Hide details when my wrist is down';

  @override
  String get watchReadRepliesAloud => 'Read replies aloud';

  @override
  String get watchAskUses => 'Bot for Ask';

  @override
  String get watchWorkspace => 'Workspace';

  @override
  String get watchSignedInAsLabel => 'Signed in as';

  @override
  String get watchCompNeedsYou => 'Needs you';

  @override
  String get watchCompAsk => 'Ask a bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'Up next';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou =>
      'How many requests wait, and the first one';

  @override
  String get watchCompDescAsk => 'Ask a bot by voice in one tap';

  @override
  String get watchCompDescBot => 'Where a bot stands and what it is doing';

  @override
  String get watchCompDescUpNext => 'The next routine and when it runs';

  @override
  String get watchCompDescCredits => 'Credits used this period';

  @override
  String get watchNeedYouShort => 'need you';

  @override
  String get watchControlAsk => 'Ask Casama';

  @override
  String get watchControlTalk => 'Talk to a bot';

  @override
  String get watchControlRun => 'Run a routine';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count need you. First: $text';
  }

  @override
  String get watchPhoneTitle => 'Watch';

  @override
  String get watchPhoneIntro =>
      'Answer bots, ask by voice and see who is working, from your wrist.';

  @override
  String get watchPhoneWatches => 'Signed-in watches';

  @override
  String get watchPhoneNone =>
      'No watch signed in yet. Open Casama on your watch and it signs in by itself.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Last used $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Not used yet';

  @override
  String get watchPhoneRemove => 'Remove';

  @override
  String watchPhoneRemoveTitle(String name) {
    return 'Remove $name?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'It signs out at once. You can sign it in again later.';

  @override
  String get watchPhoneUseCode => 'Sign in a watch with a code';

  @override
  String get watchPhoneCodeHint => 'The code on your watch';

  @override
  String watchPhoneCodeAsk(String name) {
    return 'Sign in $name?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'It will be signed in to $workspace as you. Only allow a code shown on your own watch.';
  }

  @override
  String get watchPhoneCodeAllow => 'Sign it in';

  @override
  String get watchPhoneCodeWrong =>
      'That code didn\'t work. Check it on your watch';

  @override
  String get watchPhoneCodeTaken =>
      'This watch is still signed in to another account. Remove it there in Settings → Watch, then get a new code';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Signed in to $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown => 'Signed in to another workspace';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name is signed in';
  }

  @override
  String get watchPhoneAllowTitle => 'Allow from the watch';

  @override
  String get watchPhoneAllowMedium => 'Low and medium risk';

  @override
  String get watchPhoneAllowMediumBody =>
      'Low risk in one tap, medium risk with a hold. High risk and payments always need your phone.';

  @override
  String get watchPhoneAllowLow => 'Low risk only';

  @override
  String get watchPhoneAllowNone => 'Never';

  @override
  String get watchPhoneDetails => 'Show details on the watch';

  @override
  String get watchPhoneDetailsBody =>
      'Off: the watch shows counts and bot names, not what bots wrote.';

  @override
  String get watchPhoneQuickReplies => 'Quick replies';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Short answers you can send from a reply notification. Up to six.';

  @override
  String get watchPhoneQuickAdd => 'Add a quick reply';

  @override
  String get watchPhoneQuickReset => 'Use the built-in replies';

  @override
  String get watchPhoneHowTo => 'Add Casama to your watch face';

  @override
  String get watchPhoneHowToApple =>
      'Touch and hold your watch face, tap Edit, then choose Casama for a complication. Turn the Digital Crown on the face to find Casama in the Smart Stack.';

  @override
  String get watchPhoneHowToWear =>
      'Touch and hold your watch face to add a Casama complication. Swipe left from the face and tap + to add a Casama tile.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Signing in $name…';
  }

  @override
  String get watchPhoneLockAsk => 'Sign in your watch?';

  @override
  String get watchPhoneNudge =>
      'Casama is on your watch too. Answer bots from your wrist.';

  @override
  String get watchPhoneHandoffTitle => 'From your watch';

  @override
  String get watchPhoneRow => 'Your bots on your Apple Watch or Wear OS watch';

  @override
  String get watchPhoneAllowLowBody =>
      'Low risk in one tap. Everything else needs your phone.';

  @override
  String get watchPhoneAllowNoneBody =>
      'The watch can only deny. Allow on your phone.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Turned off because the app lock is on, so your watch shows no words from your chats. Turn it on to see them.';

  @override
  String get watchPhoneQuickHint => 'A short reply';

  @override
  String get watchPhoneQuickTooLong => 'Up to 40 characters';

  @override
  String get watchPhoneQuickMoveUp => 'Move up';

  @override
  String get watchPhoneQuickMoveDown => 'Move down';

  @override
  String get watchPhoneQuickDelete => 'Delete this reply';

  @override
  String get watchPhoneCodeBody =>
      'On your watch, open Casama and choose Sign in with a code.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => 'Who is working and what they are doing';

  @override
  String get watchCompDescBrief => 'This morning\'s brief';

  @override
  String get watchCodeWaiting => 'Waiting for the code…';

  @override
  String watchCodeA11y(String code) {
    return 'Sign-in code $code';
  }

  @override
  String get watchChooseBot => 'Choose a bot';

  @override
  String get watchChannelRequests => 'Requests';

  @override
  String get watchChannelReplies => 'Replies';

  @override
  String get watchChannelRuns => 'Working bots';

  @override
  String get watchChannelOther => 'Other';

  @override
  String get watchOtherWorkspace =>
      'This is in another workspace. Answer it on your phone';

  @override
  String get watchReplySent => 'Sent';

  @override
  String get watchReplyNotSent => 'Couldn\'t send your reply';

  @override
  String watchAskDropped(String time) {
    return 'Couldn\'t send what you asked at $time';
  }

  @override
  String get watchNeedsHttps =>
      'This watch can only reach your server over https or on your home network';

  @override
  String get watchSignIn => 'Sign in';

  @override
  String get watchNotOnWatch =>
      'This watch can\'t answer this one. Open it on your phone';

  @override
  String watchMoreOnPhone(String count) {
    return '$count more on your phone';
  }

  @override
  String get watchShareCrashReports => 'Share crash reports';

  @override
  String get showList => 'Show the list';

  @override
  String get hideList => 'Hide the list';

  @override
  String get panePickLibrary =>
      'Pick something from the Library to see it here.';

  @override
  String get panePickSetting => 'Pick a setting to see it here.';

  @override
  String get trackpad => 'Trackpad';

  @override
  String get trackpadHint =>
      'One finger moves the pointer, two scroll, a tap clicks.';

  @override
  String get trackpadTakeControl => 'Take control to use the trackpad.';

  @override
  String get foldScreenTitle => 'Folding screen';

  @override
  String get foldRowHelp => 'What Casama sees of this device\'s screens';

  @override
  String get foldScreenHelp =>
      'How this device is held and where its fold is, as Casama sees it now. Open, close or fold the device and the numbers follow. Copy them if a screen looks wrong.';

  @override
  String get foldPose => 'Pose';

  @override
  String get foldWindow => 'Window';

  @override
  String get foldInsets => 'Safe area';

  @override
  String get foldStrip => 'Side strip';

  @override
  String get foldFold => 'Fold';

  @override
  String get foldHinge => 'Hinge';

  @override
  String get foldSystemSays => 'What the system reports';

  @override
  String get inviteGateLine => 'Casama Cloud is invite-only for now.';

  @override
  String get inviteGateSelfHost =>
      'Running Casama on your own server is open to everyone.';

  @override
  String get joinTheWaitlist => 'Join the Waitlist';

  @override
  String get iHaveAnInvite => 'I Have an Invite';

  @override
  String get waitlistSubtitle =>
      'We let people in a few at a time. You\'ll get one email when it\'s your turn.';

  @override
  String get waitlistNote => 'What would you have a bot do first?';

  @override
  String get waitlistNoteHint => 'Optional';

  @override
  String get waitlistSelfHosting => 'I run Casama on my own server';

  @override
  String get waitlistNewsletter =>
      'Also send me Casama\'s monthly email (once a month at most)';

  @override
  String get waitlistAppleRelay =>
      'This is the private address Apple made for you. Keep it if you\'ll sign in with Apple; Apple forwards our email to your inbox.';

  @override
  String get waitlistJoinedTitle => 'You\'re on the list.';

  @override
  String get waitlistJoinedBody =>
      'We let people in a few at a time. You\'ll get one email when it\'s your turn, and nothing else unless you asked for the monthly email. Know someone who uses Casama? An invite from them gets you in right away.';

  @override
  String get waitlistJoinedCode => 'Have an invite code? Enter it here.';

  @override
  String get waitlistJoinedSelfHost =>
      'Don\'t want to wait? Casama is open source. Run it on your own computer today.';

  @override
  String get waitlistRunItYourself => 'Run It Yourself';

  @override
  String get inviteSubtitle =>
      'Enter your invite code, or paste the invite link.';

  @override
  String get inviteCodeLabel => 'Invite code';

  @override
  String get inviteNotFound =>
      'That code doesn\'t match any invite. Check it and try again.';

  @override
  String inviteFromName(String name) {
    return '$name invited you to Casama';
  }

  @override
  String get inviteFromFriend => 'A friend invited you to Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Your invite: $label';
  }

  @override
  String get inviteFromCasama => 'Your invite to Casama';

  @override
  String get inviteChooseSignIn =>
      'Now choose how you\'ll sign in. Use the address you want for your account.';

  @override
  String get inviteGoneHelp =>
      'These invites are gone. Enter your email and you\'ll go on the waitlist, ahead of the line.';

  @override
  String get inviteEmailHelp =>
      'We\'ll let this address in, then send it a sign-in link.';

  @override
  String inviteCheckInbox(String email) {
    return 'You\'re in. Check $email for a sign-in link, or type its code here.';
  }

  @override
  String get inviteWaitlistedTitle => 'You\'re on the waitlist';

  @override
  String get inviteWaitlisted =>
      'These invites are gone, but you\'re ahead of the line.';

  @override
  String get inviteUseEmailHere =>
      'On this device, use Continue with Email. Apple and Google work with an invite in the iPhone, Mac and Android apps.';

  @override
  String get inviteDifferentCode => 'Use a Different Code';

  @override
  String get inviteRefusedHelp =>
      'Join the waitlist and we\'ll email you when it\'s your turn, or enter an invite code if you have one.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud is invite-only for now. We\'ll email you when it\'s your turn. Have an invite code? Use it now.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count invites left',
      one: '1 invite left',
      zero: 'No invites left',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used of $total used. Each one lets a friend make an account.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Your invites unlock after your first finished chat.';

  @override
  String get inviteWaitingTitle => 'Waiting for Your Invite';

  @override
  String get inviteWaitingUses => 'Letting them in uses one of your invites.';

  @override
  String get inviteWaitingNoneLeft =>
      'You get an invite back when a friend you invited finishes their first chat.';

  @override
  String get inviteWaitingLetIn => 'Let In';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Let in $email';
  }

  @override
  String get inviteWaitingDone =>
      'They\'ll get an email to sign up in a few minutes.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'I saved you one of my $count Casama invites.',
      one: 'I saved you my Casama invite.',
    );
    return '$_temp0 Casama is invite-only for now, and this gets you in right away: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'I saved you one of my $count Casama invites.',
      one: 'I saved you my Casama invite.',
    );
    return '$_temp0 Casama is invite-only for now. This gets you in right away, and you get $amount of free usage after your first chat: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Who\'s It For?';

  @override
  String get inviteNameHelp =>
      'Add their first name and the invite page greets them by name. You can leave it empty.';

  @override
  String get inviteNameHint => 'First name';

  @override
  String get inviteNameShare => 'Share Invite';

  @override
  String get inviteAskTitle => 'Who Else Would Use This?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'You have $count invites to Casama. Each one lets a friend in right away.',
      one: 'You have 1 invite to Casama. It lets a friend in right away.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'You each get $amount of free usage after their first chat.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'You get $amount of free usage after their first chat.';
  }

  @override
  String get inviteAskSend => 'Send an Invite';

  @override
  String get inviteAskNotNow => 'Not Now';

  @override
  String get adminWaitlist => 'Waitlist';

  @override
  String get adminWlFunnel => 'After the line';

  @override
  String adminWlSignupRate(int percent) {
    return '$percent% of those let in signed up';
  }

  @override
  String get adminWlGateOn =>
      'On. New accounts need an invite code or a place from the waitlist. Existing accounts sign in as always.';

  @override
  String get adminWlGateOff => 'Off. Anyone can make an account.';

  @override
  String get adminWlOpensAtHelp =>
      'Pick a time and sign-ups open to everyone on their own.';

  @override
  String adminWlOpensAtValue(String date, String time) {
    return '$date at $time';
  }

  @override
  String adminWlInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count days',
      one: 'tomorrow',
      zero: 'today',
    );
    return '$_temp0';
  }

  @override
  String get adminWlClear => 'Clear';

  @override
  String get adminWlInvitesHelp =>
      'Invite codes each new person gets to share.';

  @override
  String get adminWlDailyAdmitHelp =>
      'Let in from the front of the line every day, on its own.';

  @override
  String get adminWlDailyEmailsHelp =>
      'The most \"You\'re in\" emails sent in one day.';

  @override
  String get adminWlBatchHourHelp => 'When the daily batch runs.';

  @override
  String get adminWlCampaignLive => 'Live';

  @override
  String get adminWlCampaignScheduled => 'Scheduled';

  @override
  String get adminWlCampaignEnded => 'Ended';

  @override
  String get adminWlCampaignUsedUp => 'Used up';

  @override
  String adminWlCampaignStarts(String date) {
    return 'Starts $date';
  }

  @override
  String adminWlCampaignEnds(String date) {
    return 'Ends $date';
  }

  @override
  String get adminWlCampaignNoEnd => 'No end date';

  @override
  String get adminWlCampaignCopy => 'Copy Link';

  @override
  String get adminWlFilterAll => 'All';

  @override
  String get adminWlSortNewest => 'Newest';

  @override
  String get adminWlSortOldest => 'Oldest';

  @override
  String adminWlShowMore(int count) {
    return 'Show $count more';
  }

  @override
  String adminWlShowing(int count) {
    return 'Showing $count';
  }

  @override
  String get adminWlAdmitOne => 'Let In';

  @override
  String adminWlAdmitOneTitle(String email) {
    return 'Let in $email?';
  }

  @override
  String get adminWlAdmitOneBody =>
      'They get a \"You\'re in\" email, within today\'s email limit.';

  @override
  String adminWlInvitedBy(String name) {
    return 'Invited by $name';
  }

  @override
  String get adminWlInvitedByMember => 'Invited by a member';

  @override
  String adminWlInviterLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count invites left',
      one: '1 invite left',
      zero: 'no invites left',
    );
    return '$_temp0';
  }

  @override
  String get adminWlTheMember => 'The member';

  @override
  String adminWlAdmitInvitedBody(String inviter) {
    return '$inviter invited this person and gets to let them in: they\'re told as soon as they have an invite to give. Letting them in here doesn\'t use one of their invites.';
  }

  @override
  String get adminWlAdmitAnyway => 'Let In Anyway';

  @override
  String get adminWlCopyEmail => 'Copy Email';

  @override
  String get adminWlNoMatch => 'No one matches. Try another search or filter.';

  @override
  String get adminWlColEmail => 'Email';

  @override
  String get adminWlColStatus => 'Status';

  @override
  String get adminWlColSource => 'Came from';

  @override
  String get adminWlColJoined => 'Joined';

  @override
  String get adminWlColListed => 'On the list';

  @override
  String get adminWlSrcPage => 'Waitlist page';

  @override
  String get adminWlSrcHome => 'Home page';

  @override
  String get adminWlSrcDownload => 'Download page';

  @override
  String get adminWlSrcInvite => 'Invite link';

  @override
  String get adminWlSrcIos => 'iPhone app';

  @override
  String get adminWlSrcAndroid => 'Android app';

  @override
  String get adminWlSrcMac => 'Mac app';

  @override
  String get adminWlSrcWindows => 'Windows app';

  @override
  String get adminWlSrcLinux => 'Linux app';

  @override
  String get adminWlSrcWeb => 'Web app';

  @override
  String get adminWlSrcApp => 'App';

  @override
  String get adminWlSrcAdmin => 'Added by hand';

  @override
  String get adminWlSrcUnknown => 'Unknown';

  @override
  String get adminWlViaBatch => 'Daily batch';

  @override
  String get adminWlViaHand => 'Let in by hand';

  @override
  String adminWlViaCampaign(String code) {
    return 'Code $code';
  }

  @override
  String get adminWlViaInvite => 'A friend\'s invite';

  @override
  String get adminWlViaOneTime => 'One-time code';

  @override
  String get adminDomNeedsYou => 'Needs you';

  @override
  String get adminDomInProgress => 'In progress';

  @override
  String get adminDomOrderWaitingApproval => 'Waiting for approval';

  @override
  String get adminDomOrderQuote => 'Quote';

  @override
  String get adminDomOrderCheckout => 'At checkout';

  @override
  String get adminDomOrderPaid => 'Paid';

  @override
  String get adminDomOrderRegistering => 'Registering';

  @override
  String get adminDomOrderRegistered => 'Registered';

  @override
  String get adminDomOrderDone => 'Done';

  @override
  String get adminDomOrderAbandoned => 'Abandoned';

  @override
  String get adminDomOrderRefunding => 'Refunding';

  @override
  String get adminDomOrderRefunded => 'Refunded';

  @override
  String get adminDomOrderNeedsAttention => 'Needs attention';

  @override
  String get adminDomKindRegister => 'New domain';

  @override
  String get adminDomKindRenew => 'Renewal';

  @override
  String get adminDomKindRestore => 'Restore';

  @override
  String get adminDomFilterAll => 'All';

  @override
  String get adminDomFilterLive => 'Live';

  @override
  String get adminDomFilterExpiring => 'Expiring soon';

  @override
  String get adminDomSearch => 'Search domains or workspaces';

  @override
  String get adminDomNoMatch =>
      'No domains match. Try another search or filter.';

  @override
  String get adminDomColDomain => 'Domain';

  @override
  String get adminDomColWorkspace => 'Workspace';

  @override
  String get adminDomColStatus => 'Status';

  @override
  String get adminDomColExpires => 'Expires';

  @override
  String adminDomExpiresIn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expires in $count days',
      one: 'Expires tomorrow',
      zero: 'Expires today',
    );
    return '$_temp0';
  }

  @override
  String adminDomExpiredOn(String date) {
    return 'Expired $date';
  }

  @override
  String get adminDomNoExpiry => 'No expiry';

  @override
  String get adminDomStatusActive => 'Active';

  @override
  String get adminDomStatusExpired => 'Expired';

  @override
  String get adminDomStatusLapsed => 'Lapsed';

  @override
  String get adminDomStatusGone => 'Gone';

  @override
  String get adminDomStatusMovedOut => 'Moved out';

  @override
  String get adminDomSuspendedDone => 'Domain suspended.';

  @override
  String get adminDomUnsuspendedDone => 'Domain is back online.';

  @override
  String get adminMailAddressesStat => 'Addresses';

  @override
  String get adminMailPausedStat => 'Paused';

  @override
  String get adminMailSendingTitle => 'Sending today';

  @override
  String get adminMailNoCeiling => 'No daily limit';

  @override
  String adminMailPercentUsed(int percent) {
    return '$percent% used';
  }

  @override
  String get adminMailSearch => 'Search addresses, bots or workspaces';

  @override
  String get adminMailNone =>
      'No bot addresses yet. They show up here once a bot gets an email address.';

  @override
  String get adminMailNoMatch =>
      'No addresses match. Try another search or filter.';

  @override
  String adminMailBotIn(String bot, String workspace) {
    return '$bot in $workspace';
  }

  @override
  String get adminMailStatusActive => 'Active';

  @override
  String get adminMailStatusPaused => 'Paused';

  @override
  String get adminMailStatusRetired => 'Retired';

  @override
  String get adminMailFilterAll => 'All';

  @override
  String get adminMailColAddress => 'Address';

  @override
  String get adminMailColStatus => 'Status';

  @override
  String get adminMailColHealth => 'Last 30 days';

  @override
  String get adminMailReservedNone =>
      'None yet. Tap to add names nobody can claim.';

  @override
  String adminMailReservedMore(int count) {
    return '+$count more';
  }

  @override
  String get adminMailPausedDone => 'Address paused.';

  @override
  String get adminMailLiftedDone => 'Pause lifted.';

  @override
  String get adminReportsAll => 'All';

  @override
  String get adminReportsShowMore => 'Show more';

  @override
  String get adminReportsShowLess => 'Show less';

  @override
  String get adminReportsSuspend => 'Suspend Workspace';

  @override
  String adminReportsSuspendTitle(String name) {
    return 'Suspend $name?';
  }

  @override
  String get adminReportsSuspendBody =>
      'Everyone in it loses access until it\'s unsuspended. The report is marked as dealt with.';

  @override
  String get adminReportsDismiss => 'Dismiss';

  @override
  String get adminReportsActionedDone => 'Marked as dealt with.';

  @override
  String get adminReportsDismissedDone => 'Report dismissed.';

  @override
  String get adminReportsSuspendedDone => 'Workspace suspended.';

  @override
  String get adminReportsNoMatch => 'No open reports of this kind.';

  @override
  String adminReportsTakeDownTitle(String title) {
    return 'Take down $title?';
  }

  @override
  String get adminReportsTakeDownBody =>
      'The link stops working for everyone until you restore it.';

  @override
  String get adminReportsTakenDown => 'Taken down';

  @override
  String get adminReportsTakenDownDone => 'Link taken down.';

  @override
  String get adminReportsRestoredDone => 'Link restored.';

  @override
  String get adminReportsHeld => 'On hold';

  @override
  String adminReportsHeldReason(String reason) {
    return 'Visitors see \"under review\". The check saw $reason.';
  }

  @override
  String get adminReportsApprove => 'Approve';

  @override
  String get adminReportsApprovedDone =>
      'Page approved. Visitors see it again.';

  @override
  String get adminTicketsSearch => 'Search by reference, subject or email';

  @override
  String get adminTicketsNoMatch => 'No messages match your search.';

  @override
  String adminTicketCloseTitle(String reference) {
    return 'Close $reference?';
  }

  @override
  String get adminTicketCloseBody =>
      'It moves to Closed. You can reopen it any time.';

  @override
  String adminTicketReopenTitle(String reference) {
    return 'Reopen $reference?';
  }

  @override
  String get adminTicketReopenBody => 'It moves back to Open.';

  @override
  String get adminTicketClosedDone => 'Message closed.';

  @override
  String get adminTicketReopenedDone => 'Message reopened.';

  @override
  String get adminTicketsColMessage => 'Message';

  @override
  String get adminTicketsColFrom => 'From';

  @override
  String get adminTicketsColStatus => 'Status';

  @override
  String get adminTicketsColSent => 'Sent';

  @override
  String get adminTicketsNoEmail => 'No email';

  @override
  String get adminSupportWebMessages => 'Messages today';

  @override
  String get adminSupportWebSpent => 'Spent today';

  @override
  String get adminSupportWebPausedStat => 'Paused IP addresses';

  @override
  String adminSupportWebBudget(String spent, String budget) {
    return '$spent of $budget daily budget';
  }

  @override
  String get adminWaitlistWaiting => 'Waiting';

  @override
  String get adminWaitlistListedToday => 'Joined the list today';

  @override
  String get adminWaitlistAdmittedToday => 'Let in today';

  @override
  String get adminWaitlistAdmittedTotal => 'Let in, total';

  @override
  String get adminWaitlistJoined => 'Signed up';

  @override
  String get adminWaitlistFirstChat => 'First chat';

  @override
  String get adminWaitlistEmailsToday => '\"You\'re in\" emails today';

  @override
  String adminWaitlistEmailsOf(int sent, int max) {
    return '$sent of $max';
  }

  @override
  String get adminWaitlistLastBatch => 'Last batch';

  @override
  String adminWaitlistLastBatchValue(int count) {
    return '$count let in';
  }

  @override
  String adminWaitlistLastBatchSkipped(String reason) {
    return 'Skipped. $reason';
  }

  @override
  String get adminWaitlistBySource => 'By source';

  @override
  String adminWaitlistSourceRow(
    int listed,
    int admitted,
    int joined,
    int firstChat,
  ) {
    return '$listed on the list · $admitted let in · $joined signed up · $firstChat first chat';
  }

  @override
  String get adminWaitlistAdmit => 'Admit';

  @override
  String get adminWaitlistAdmitPrompt => 'Let in the next people in line';

  @override
  String get adminWaitlistAdmitCount => 'How many';

  @override
  String adminWaitlistAdmitTitle(int count) {
    return 'Let in the next $count in line?';
  }

  @override
  String get adminWaitlistAdmitBody =>
      'Each gets a \"You\'re in\" email, within today\'s email limit. People waiting on a member\'s invite are skipped: the member lets them in.';

  @override
  String adminWaitlistAdmitted(int count) {
    return '$count let in.';
  }

  @override
  String get adminWaitlistAdd => 'Add Addresses';

  @override
  String get adminWaitlistAddHelp =>
      'They\'re let in at once. One per line, or separated by commas.';

  @override
  String get adminWaitlistAddLabel => 'Email addresses';

  @override
  String get adminWaitlistAddNotify => 'Send each the \"You\'re in\" email';

  @override
  String adminWaitlistAdded(int count) {
    return '$count added.';
  }

  @override
  String adminWaitlistSkipped(String list) {
    return 'Not email addresses: $list';
  }

  @override
  String adminWaitlistRemoveTitle(String email) {
    return 'Remove $email from the waitlist?';
  }

  @override
  String get adminWaitlistRemoveBody =>
      'The entry is deleted. They can join again later.';

  @override
  String get adminWaitlistPeople => 'People';

  @override
  String get adminWaitlistSearch => 'Search by email';

  @override
  String get adminWaitlistNone => 'No one here yet.';

  @override
  String get adminWaitlistShowMore => 'Show More';

  @override
  String get adminWaitlistStatusWaiting => 'Waiting';

  @override
  String get adminWaitlistStatusQueued => 'Chosen';

  @override
  String get adminWaitlistStatusAdmitted => 'Let in';

  @override
  String get adminWaitlistStatusJoined => 'Signed up';

  @override
  String get adminWaitlistSelfHosts => 'Runs their own server';

  @override
  String get adminCampaigns => 'Campaign codes';

  @override
  String get adminCampaignNew => 'New Code';

  @override
  String get adminCampaignCode => 'Code';

  @override
  String get adminCampaignCodeHelp =>
      '9 or more characters, or with a hyphen: letters, digits and hyphens (SHOWHN-DEC8).';

  @override
  String get adminCampaignLabel => 'Label';

  @override
  String get adminCampaignTotal => 'Total uses';

  @override
  String get adminCampaignPerDay => 'A day at most (optional)';

  @override
  String get adminCampaignStarts => 'Starts';

  @override
  String get adminCampaignEnds => 'Ends';

  @override
  String get adminCampaignAnyTime => 'Any time';

  @override
  String get adminCampaignCreate => 'Create Code';

  @override
  String adminCampaignUsed(int used, int total) {
    return '$used of $total used';
  }

  @override
  String adminCampaignPerDayShort(int count) {
    return '$count a day';
  }

  @override
  String adminCampaignEndsOn(String date) {
    return 'ends $date';
  }

  @override
  String adminCampaignStartsOn(String date) {
    return 'starts $date';
  }

  @override
  String get adminCampaignOff => 'Off';

  @override
  String get adminCampaignTurnOff => 'Turn Off';

  @override
  String get adminCampaignTurnOn => 'Turn On';

  @override
  String get adminCampaignNone => 'No campaign codes yet.';

  @override
  String get adminCampaignCopied => 'Link copied.';

  @override
  String get adminGate => 'Sign-ups';

  @override
  String get adminGateInviteOnly => 'Invite-only';

  @override
  String get adminGateInviteOnlyHelp =>
      'New accounts only for people let in from the waitlist or with an invite code. Existing accounts sign in as always.';

  @override
  String get adminGateOpenTitle => 'Open sign-ups to everyone?';

  @override
  String get adminGateOpenBody =>
      'Anyone can make an account straight away. The waitlist stays as it is.';

  @override
  String get adminGateOpenConfirm => 'Open Sign-Ups';

  @override
  String get adminGateCloseTitle => 'Make Casama Cloud invite-only?';

  @override
  String get adminGateCloseBody =>
      'New people need an invite code, or a place let in from the waitlist. Existing accounts keep signing in.';

  @override
  String get adminGateCloseConfirm => 'Make Invite-Only';

  @override
  String get adminGateClosedNow => 'Invite-only now';

  @override
  String get adminGateOpenNow => 'Open now';

  @override
  String get adminGateOpensAt => 'Opens on its own';

  @override
  String get adminGateOpensAtNone => 'Not set';

  @override
  String get adminGateClearOpensAt => 'Clear the Opening Time';

  @override
  String get adminGateInvites => 'Invites per person';

  @override
  String get adminGateDailyAdmit => 'Let in each day';

  @override
  String get adminGateDailyAdmitOff => 'None (by hand only)';

  @override
  String get adminGateDailyEmails => '\"You\'re in\" emails a day at most';

  @override
  String get adminGateBatchHour => 'Batch time (UTC)';

  @override
  String adminGateBatchHourValue(String hour) {
    return '$hour:00 UTC';
  }

  @override
  String get adminGateNumberInvalid => 'Enter a whole number';

  @override
  String savedResetAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resets saved',
      one: '1 reset saved',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Use by $date';
  }

  @override
  String get savedResetUse => 'Use Reset';

  @override
  String get savedResetConfirmTitle => 'Use this reset?';

  @override
  String get savedResetConfirmDaily =>
      'Clears today’s limit so your bots can work again today. This can’t be undone.';

  @override
  String get savedResetConfirmComputer =>
      'Gives back this month’s computer hours. This can’t be undone.';

  @override
  String get savedResetOwnerRequired => 'Only a workspace owner can use it.';

  @override
  String get savedResetPaused => 'Paused for now. Check back later.';

  @override
  String get savedResetPeriodLimit =>
      'You’ve used this period’s reset. You can use this one next period.';

  @override
  String get savedResetNothingToRefill =>
      'Nothing to refill yet. Keep it for when you run low.';

  @override
  String get savedResetNoBillingPeriod =>
      'Available once your plan finishes setting up.';

  @override
  String get savedResetUnavailable => 'Not available right now.';

  @override
  String savedResetDone(String amount) {
    return 'Reset used: $amount added';
  }

  @override
  String get savedResetDoneNoCredits => 'Reset used';

  @override
  String savedResetConfirm(String amount) {
    return 'Refills $amount of this period’s included credits. This can’t be undone.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Enable saved resets';

  @override
  String get resetsOffNote => 'Off: nobody gets saved resets.';

  @override
  String get resetsDecrease => 'Fewer';

  @override
  String get resetsIncrease => 'More';

  @override
  String get resetsSettings => 'Settings';

  @override
  String get resetsCampaigns => 'Campaigns';

  @override
  String get resetsStatLive => 'Live';

  @override
  String get resetsStatGiven => 'Given';

  @override
  String get resetsStatUsed => 'Used';

  @override
  String get resetsStatRefilled => 'Refilled';

  @override
  String get resetsFilterActive => 'Active';

  @override
  String get resetsFilterEnded => 'Ended';

  @override
  String get resetsFilterAll => 'All';

  @override
  String get resetsStateDraft => 'Draft';

  @override
  String get resetsStateScheduled => 'Scheduled';

  @override
  String get resetsStateLive => 'Live';

  @override
  String get resetsStatePaused => 'Paused';

  @override
  String get resetsStateEnded => 'Ended';

  @override
  String get resetsStateCancelled => 'Cancelled';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used of $budget budget';
  }

  @override
  String resetsGivenN(String count) {
    return '$count given';
  }

  @override
  String resetsUsedN(String count) {
    return '$count used';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Starts $start · Ends $end';
  }

  @override
  String get resetsToday => 'today';

  @override
  String get resetsTomorrow => 'tomorrow';

  @override
  String get resetsYesterday => 'yesterday';

  @override
  String get resetsAudienceEveryone => 'Every workspace';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count workspaces',
      one: '1 workspace',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Joined before $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Hit a limit in the last $days days',
      one: 'Hit a limit today',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Cancel campaign';

  @override
  String get resetsCancelConfirm => 'Cancel this campaign?';

  @override
  String get resetsCancelConfirmBody =>
      'It stops giving saved resets. This can\'t be undone.';

  @override
  String get resetsDeleteConfirm => 'Delete this campaign?';

  @override
  String get resetsDeleteConfirmBody => 'The draft is removed for good.';

  @override
  String get resetsNoCampaigns =>
      'No campaigns yet. Start one to give saved resets to many workspaces at once.';

  @override
  String get resetsNoMatches => 'No campaigns here.';

  @override
  String get resetsEditCampaign => 'Edit campaign';

  @override
  String get resetsSectionBasics => 'Basics';

  @override
  String get resetsSectionAudience => 'Audience';

  @override
  String get resetsSectionTiming => 'Timing';

  @override
  String get resetsSectionRefill => 'Refill';

  @override
  String get resetsSectionWhat => 'What resets';

  @override
  String get resetsSectionNotify => 'Notifications';

  @override
  String get resetsPreviewLabel => 'What people see';

  @override
  String get resetsMonthly => 'Monthly';

  @override
  String get resetsYearly => 'Yearly';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Plans';

  @override
  String get resetsPlansHint => 'Tick none to include every plan.';

  @override
  String get resetsWorkspacesLabel => 'Workspaces';

  @override
  String get resetsWorkspacesHint => 'Leave empty to include every workspace.';

  @override
  String get resetsSearchWorkspaces => 'Search workspaces by name';

  @override
  String get resetsNoWorkspaceMatch => 'No workspace matches.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Only $name';
  }

  @override
  String get resetsJoinedBefore => 'Joined before';

  @override
  String get resetsLimitedDaysLabel => 'Hit a limit in the last N days';

  @override
  String get resetsStartsLabel => 'Starts';

  @override
  String get resetsEndsLabel => 'Expires';

  @override
  String resetsPercentValue(int percent) {
    return 'Refill $percent% of included credits';
  }

  @override
  String get resetsCapLabel => 'Most per use';

  @override
  String get resetsBudgetLabel => 'Total budget';

  @override
  String get resetsOptional => 'Optional';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Reaches about $count workspaces · $credits in credits · costs about $cost';
  }

  @override
  String get resetsEstimating => 'Working out the reach…';

  @override
  String get resetsEstimateNeedsFields =>
      'Fill in the fields to see the reach.';

  @override
  String get resetsLockedNote =>
      'This campaign is running: only the message, expiry, budget and reminder can change.';

  @override
  String get resetsRequired => 'Required.';

  @override
  String get resetsTooLong => '120 characters at most.';

  @override
  String get resetsDaysInvalid => 'Enter 1 to 365 days.';

  @override
  String get resetsMoneyInvalid => 'Enter 0 or more.';

  @override
  String get resetsExpiryBeforeStart => 'Pick an end after the start.';

  @override
  String resetsGivenTo(String name) {
    return 'Saved reset given to $name';
  }

  @override
  String get resetsCampaignSaved => 'Campaign saved';

  @override
  String get resetsDefaultMessage =>
      'A saved reset, on us. Use it when you hit a limit.';

  @override
  String resetsGiveName(String name) {
    return 'Saved reset for $name';
  }

  @override
  String get resetsOneWorkspace => 'One workspace';

  @override
  String get resetsPickWorkspace => 'Pick a workspace to see its saved resets.';

  @override
  String get resetsAllHistory => 'All history';

  @override
  String get resetsAllWorkspaces => 'All workspaces';

  @override
  String get resetsNoEvents => 'Nothing here yet.';

  @override
  String get resetsEventGiven => 'Saved reset given';

  @override
  String get resetsEventUsed => 'Saved reset used';

  @override
  String get resetsEventRevoked => 'Taken back';

  @override
  String get resetsEventUndone => 'Refill undone';

  @override
  String get resetsEventExpired => 'Expired unused';

  @override
  String get resetsEventCreated => 'Campaign created';

  @override
  String get resetsEventEdited => 'Campaign edited';

  @override
  String get resetsEventStarted => 'Campaign started';

  @override
  String get resetsEventEnded => 'Campaign ended';

  @override
  String get resetsEventScheduled => 'Campaign scheduled';

  @override
  String get resetsEventPaused => 'Campaign paused';

  @override
  String get resetsEventResumed => 'Campaign resumed';

  @override
  String get resetsEventCancelled => 'Campaign cancelled';

  @override
  String get resetsEventDeleted => 'Campaign deleted';

  @override
  String get resetsEventSettings => 'Settings changed';

  @override
  String get resetsRevokeConfirm => 'Take back this saved reset?';

  @override
  String get resetsRevokeConfirmBody =>
      'The workspace loses it before using it.';

  @override
  String get resetsUndoConfirm => 'Undo this refill?';

  @override
  String get resetsUndoConfirmBody =>
      'The credits it added are taken off again.';

  @override
  String get resetsPerPeriod => 'Uses per workspace per period';

  @override
  String get resetsMaxHeld => 'Maximum saved resets';

  @override
  String get resetsNotifyOwners => 'Notify instance owners';

  @override
  String get resetsNewCampaign => 'New campaign';

  @override
  String get resetsName => 'Name';

  @override
  String get resetsMessage => 'Message to people';

  @override
  String get resetsPlans => 'Plan codes, separated by commas (empty means all)';

  @override
  String get resetsWorkspaces =>
      'Workspace IDs, separated by commas (empty means all)';

  @override
  String get resetsBefore => 'Created before (date and time, optional)';

  @override
  String get resetsLimitedDays => 'Hit a limit in the last N days (optional)';

  @override
  String get resetsStart => 'Starts (date and time)';

  @override
  String get resetsExpiry => 'Expires (date and time)';

  @override
  String get resetsPercent => 'Included credits to refill (%)';

  @override
  String get resetsCap => 'Maximum dollars per use (optional)';

  @override
  String get resetsBudget => 'Total credit budget in dollars (optional)';

  @override
  String get resetsDaily => 'Clear today’s model limit';

  @override
  String get resetsComputer => 'Refill this month’s computer hours';

  @override
  String get resetsArrival => 'Notify on arrival';

  @override
  String get resetsReminder => 'Remind before expiry';

  @override
  String get resetsPreviewSave => 'Preview and save';

  @override
  String get resetsSchedule => 'Schedule';

  @override
  String get resetsPause => 'Pause';

  @override
  String get resetsResume => 'Resume';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count workspaces. Maximum refill: $credits. Estimated cost: $cost.',
      one: '1 workspace. Maximum refill: $credits. Estimated cost: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace => 'Workspace ID (empty for all history)';

  @override
  String get resetsHistory => 'Load history';

  @override
  String get resetsGive => 'Give a saved reset';

  @override
  String get resetsCopyCsv => 'Copy CSV';

  @override
  String get resetsRevoke => 'Take back';

  @override
  String get resetsUndo => 'Undo unused refill';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => 'Vendor services need attention';

  @override
  String get vendorNotSetUp => 'Not set up';

  @override
  String get vendorCheckNow => 'Check now';

  @override
  String get vendorLimit => 'Limit or prepaid amount';

  @override
  String get vendorWarnAt => 'Warn at';

  @override
  String get vendorExpiry => 'Expires';

  @override
  String get vendorHistory => 'Recent readings';

  @override
  String get vendorSave => 'Save';

  @override
  String get vendorEnabled => 'Monitoring enabled';

  @override
  String get vendorUnknown => 'Unknown';

  @override
  String get vendorLow => 'Low';

  @override
  String get vendorOut => 'Out';

  @override
  String get vendorOk => 'OK';

  @override
  String get vendorNoReading => 'No reading yet';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count need attention',
      one: '1 needs attention',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count OK';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count not set up';
  }

  @override
  String get vendorNoVendors => 'No services to watch yet.';

  @override
  String get vendorCheckAll => 'Check all';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Checking $done of $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Checked $count services',
      one: 'Checked 1 service',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count checks failed',
      one: '1 check failed',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Needs attention';

  @override
  String get vendorGroupHealthy => 'Healthy';

  @override
  String get vendorGroupIdle => 'Not set up or off';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Show $count more',
      one: 'Show 1 more',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Show less';

  @override
  String get vendorOff => 'Off';

  @override
  String vendorPillPercent(String status, int percent) {
    return '$status · $percent%';
  }

  @override
  String vendorUsedOf(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String vendorLeft(String amount) {
    return '$amount left';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Warns below $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Resets $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Renews $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Expired $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count minutes',
      one: 'in 1 minute',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count hours',
      one: 'in 1 hour',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count days',
      one: 'in 1 day',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Checked $when';
  }

  @override
  String get vendorSourceApi => 'From the service';

  @override
  String get vendorSourceOwnCount => 'Counted by Casama';

  @override
  String get vendorSourceManual => 'Entered by hand';

  @override
  String vendorReadingError(String error) {
    return 'Last check failed: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Add its key on the server to start checking.';

  @override
  String get vendorOffHint => 'Monitoring is off.';

  @override
  String get vendorPickOne => 'Pick a service to see its details.';

  @override
  String get vendorSectionStatus => 'Status';

  @override
  String get vendorSectionActions => 'Actions';

  @override
  String get vendorSectionAlerts => 'Alerts';

  @override
  String get vendorSectionPlan => 'Plan';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Warn at $percent% used';
  }

  @override
  String get vendorWarnAtHelp => 'The meter turns amber here.';

  @override
  String get vendorPeriod => 'Period';

  @override
  String get vendorPeriodNone => 'Not set';

  @override
  String get vendorPeriodDay => 'Daily';

  @override
  String get vendorPeriodMonth => 'Monthly';

  @override
  String get vendorPeriodBilling => 'Each billing period';

  @override
  String get vendorPeriodPrepaid => 'Prepaid';

  @override
  String get vendorDateNotSet => 'Not set';

  @override
  String get vendorClearDate => 'Clear date';

  @override
  String get vendorLimitInvalid => 'Enter a number above 0.';

  @override
  String get vendorAmountInvalid => 'Enter 0 or more.';

  @override
  String get vendorMonthsInvalid => 'Enter 1 to 120 months.';

  @override
  String get vendorWarnAtInvalid => 'Pick a point between 1% and 100%.';

  @override
  String get vendorSaved => 'Settings saved';

  @override
  String get vendorCheckDone => 'Checked';

  @override
  String get vendorHistoryEmpty => 'No readings yet.';

  @override
  String get vendorCheckFailed => 'Check failed';

  @override
  String get vendorResets => 'Resets';

  @override
  String get vendorSource => 'Source';

  @override
  String get vendorBilling => 'Billing and refill';

  @override
  String get vendorBalanceWarning => 'Warn below balance';

  @override
  String get vendorPeriodStart => 'Period starts';

  @override
  String get vendorInvalidSettings =>
      'Enter a positive limit, a warning between 0 and 1, and valid dates.';

  @override
  String get card24hRange => '24-hour range';

  @override
  String get card52wRange => '52-week range';

  @override
  String get cardAgain => 'Again';

  @override
  String get cardAgoSuffix => 'ago';

  @override
  String get cardAirQuality => 'Air quality';

  @override
  String get cardAqiAdviceBad =>
      'Everyone should cut down on long or hard effort outdoors; keep windows closed.';

  @override
  String get cardAqiAdviceGood => 'Great day to be outside.';

  @override
  String get cardAqiAdviceModerate =>
      'Fine for most people; very sensitive people may want to take it easy.';

  @override
  String get cardAqiAdviceSensitive =>
      'Children, older people and anyone with asthma should limit long effort outdoors.';

  @override
  String get cardAqiGood => 'Good';

  @override
  String get cardAqiHazardous => 'Hazardous';

  @override
  String get cardAqiModerate => 'Moderate';

  @override
  String get cardAqiSensitive => 'Unhealthy for sensitive groups';

  @override
  String get cardAqiUnhealthy => 'Unhealthy';

  @override
  String get cardAqiVeryUnhealthy => 'Very unhealthy';

  @override
  String get cardBaggage => 'Baggage';

  @override
  String get cardCalcAmount => 'Amount';

  @override
  String get cardCalcBill => 'Bill';

  @override
  String get cardCalcDiscount => 'Discount';

  @override
  String get cardCalcDiscountTitle => 'Discount';

  @override
  String get cardCalcGross => 'With tax';

  @override
  String get cardCalcGrowth => 'Growth';

  @override
  String get cardCalcInterest => 'Interest';

  @override
  String get cardCalcLoan => 'Loan';

  @override
  String get cardCalcMonthly => 'Each month';

  @override
  String get cardCalcMonthlyPayment => 'Monthly payment';

  @override
  String get cardCalcNet => 'Before tax';

  @override
  String get cardCalcPeople => 'People';

  @override
  String get cardCalcPerPerson => 'Each person pays';

  @override
  String get cardCalcPrice => 'Price';

  @override
  String get cardCalcPrincipal => 'Principal';

  @override
  String get cardCalcRate => 'Yearly rate';

  @override
  String get cardCalcSavings => 'Savings';

  @override
  String get cardCalcStart => 'Start with';

  @override
  String get cardCalcTax => 'Tax';

  @override
  String get cardCalcTaxIncluded => 'Tax included';

  @override
  String get cardCalcTaxRate => 'Tax rate';

  @override
  String get cardCalcTip => 'Tip';

  @override
  String get cardCalcTipAmount => 'Tip';

  @override
  String get cardCalcTipSplit => 'Tip and split';

  @override
  String get cardCalcTotal => 'Total';

  @override
  String get cardCalcTotalInterest => 'Total interest';

  @override
  String get cardCalcTotalPaid => 'Total paid';

  @override
  String get cardCalcUnits => 'Convert units';

  @override
  String get cardCalcValue => 'Value';

  @override
  String get cardCalcVat => 'Tax';

  @override
  String get cardCalcYears => 'Years';

  @override
  String get cardCalcYouPay => 'You pay';

  @override
  String get cardCalcYouPutIn => 'You put in';

  @override
  String get cardCalcYouSave => 'You save';

  @override
  String get cardCall => 'Call';

  @override
  String get cardCaloriesWord => 'Calories';

  @override
  String get cardComparison => 'Comparison';

  @override
  String get cardCondClear => 'Clear';

  @override
  String get cardCondCloudy => 'Cloudy';

  @override
  String get cardCondDrizzle => 'Drizzle';

  @override
  String get cardCondFog => 'Fog';

  @override
  String get cardCondHail => 'Hail';

  @override
  String get cardCondHeavyRain => 'Heavy rain';

  @override
  String get cardCondHeavySnow => 'Heavy snow';

  @override
  String get cardCondLightRain => 'Light rain';

  @override
  String get cardCondLightSnow => 'Light snow';

  @override
  String get cardCondMostlyClear => 'Mostly clear';

  @override
  String get cardCondPartlyCloudy => 'Partly cloudy';

  @override
  String get cardCondRain => 'Rain';

  @override
  String get cardCondShowers => 'Showers';

  @override
  String get cardCondSleet => 'Sleet';

  @override
  String get cardCondSnow => 'Snow';

  @override
  String get cardCondThunder => 'Thunderstorms';

  @override
  String get cardCons => 'Cons';

  @override
  String get cardCopied => 'Copied';

  @override
  String get cardCopy => 'Copy as text';

  @override
  String get cardCouldntUpdate => 'Couldn\'t update';

  @override
  String get cardCurrency => 'Currency';

  @override
  String get cardDayLength => 'Day length';

  @override
  String get cardDayRange => 'Day\'s range';

  @override
  String get cardDays => 'days';

  @override
  String get cardDelay => 'Delay';

  @override
  String get cardDictionary => 'Dictionary';

  @override
  String get cardEmail => 'Email';

  @override
  String get cardFlightCancelled => 'Cancelled';

  @override
  String get cardFlightDiverted => 'Diverted';

  @override
  String get cardFlightInAir => 'In the air';

  @override
  String get cardFlightIncident => 'Incident';

  @override
  String get cardFlightLanded => 'Landed';

  @override
  String get cardFlightScheduled => 'On schedule';

  @override
  String cardStaysFromNight(String price) {
    return 'from $price a night';
  }

  @override
  String get cardStaysANight => 'a night';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n nights',
      one: '1 night',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n guests',
      one: '1 guest',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rooms',
      one: '1 room',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Best';

  @override
  String get cardStaysSortCheapest => 'Cheapest';

  @override
  String get cardStaysSortTopRated => 'Top rated';

  @override
  String get cardStaysSortClosest => 'Closest';

  @override
  String get cardStaysFilterFreeCancel => 'Free cancellation';

  @override
  String get cardStaysFilterBreakfast => 'Breakfast';

  @override
  String get cardStaysFilterPayAtHotel => 'Pay at hotel';

  @override
  String get cardStaysFilterStars => '4 stars and up';

  @override
  String get cardStaysFilterRated => 'Rated 8+';

  @override
  String get cardStaysList => 'List';

  @override
  String get cardStaysMap => 'Map';

  @override
  String get cardStaysEdit => 'Edit';

  @override
  String cardStaysRating(String value, String max) {
    return '$value of $max';
  }

  @override
  String cardStaysKm(String km) {
    return '$km km from the centre';
  }

  @override
  String cardStaysStars(int n) {
    return '$n-star';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price for $n nights',
      one: '$price for 1 night',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n more sites',
      one: '+1 more site',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'View deal';

  @override
  String get cardStaysView => 'View';

  @override
  String cardStaysShowAll(int n) {
    return 'Show all $n';
  }

  @override
  String get cardStaysShowFewer => 'Show fewer';

  @override
  String get cardStaysNone => 'Nothing matches these filters.';

  @override
  String get cardStaysNoMap => 'None of these places has a spot on the map.';

  @override
  String get cardStaysNoDeals => 'No prices for these dates.';

  @override
  String get cardStaysCheck => 'The price is checked on the booking site.';

  @override
  String cardStaysCompare(int n) {
    return 'Compare ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Tick up to 4 to compare';

  @override
  String get cardStaysComparePick => 'Pick to compare';

  @override
  String get cardStaysCompareTitle => 'Compare';

  @override
  String get cardStaysRowNight => 'Price a night';

  @override
  String get cardStaysRowTotal => 'Total';

  @override
  String get cardStaysRowRating => 'Rating';

  @override
  String get cardStaysRowStars => 'Stars';

  @override
  String get cardStaysRowDistance => 'Distance';

  @override
  String get cardStaysYes => 'Yes';

  @override
  String get cardStaysNo => 'No';

  @override
  String get cardStaysTermFreeCancel => 'Free cancellation';

  @override
  String get cardStaysTermBreakfast => 'Breakfast included';

  @override
  String get cardStaysTermNoBreakfast => 'No breakfast';

  @override
  String get cardStaysTermPayAtHotel => 'Pay at the hotel';

  @override
  String get cardStaysTermNonRefundable => 'Non-refundable';

  @override
  String get cardStaysDetailsTitle => 'Place to stay';

  @override
  String get cardStaysCheapest => 'Cheapest';

  @override
  String get cardStaysAmenities => 'Amenities';

  @override
  String cardStaysCheckIn(String time) {
    return 'Check-in $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Check-out $time';
  }

  @override
  String get cardStaysNearby => 'Nearby';

  @override
  String get cardStaysHotelSite => 'Hotel\'s website';

  @override
  String get cardStaysBook => 'Book for me';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Book $name on $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Photo $n of $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · price by month';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Cheapest: $month, about $price a night';
  }

  @override
  String get cardStaysTrendNote => 'A forecast, not live prices.';

  @override
  String get cardStaysTrendPick => 'Pick dates';

  @override
  String get cardStaysSearchTitle => 'Find a place to stay';

  @override
  String get cardStaysSearchWhere => 'Where';

  @override
  String get cardStaysSearchWhereHint => 'City, area or hotel';

  @override
  String get cardStaysSearchDates => 'Pick dates';

  @override
  String get cardStaysSearchAdults => 'Adults';

  @override
  String get cardStaysSearchRooms => 'Rooms';

  @override
  String get cardStaysSearchBudget => 'Budget a night (optional)';

  @override
  String get cardStaysSearchNotNow => 'Not now';

  @override
  String get cardStaysSearchGo => 'Search stays';

  @override
  String get cardStaysSearchSent => 'Searching';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Stays in $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Fewer: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'More: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Pool';

  @override
  String get cardStaysAmenityParking => 'Parking';

  @override
  String get cardStaysAmenityPets => 'Pets allowed';

  @override
  String get cardStaysAmenityGym => 'Gym';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Kitchen';

  @override
  String get cardStaysAmenityWifi => 'WiFi';

  @override
  String get cardStaysAmenityAirCon => 'Air conditioning';

  @override
  String get cardProductsTitle => 'Things to buy';

  @override
  String cardProductsFrom(String price) {
    return 'from $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'under $price';
  }

  @override
  String get cardProductsSortBest => 'Best';

  @override
  String get cardProductsSortCheapest => 'Cheapest';

  @override
  String get cardProductsSortTopRated => 'Top rated';

  @override
  String get cardProductsOnSale => 'On sale';

  @override
  String get cardProductsRated => 'Rated 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'and other stores';

  @override
  String cardProductsShowAll(int n) {
    return 'Show all $n';
  }

  @override
  String get cardProductsShowFewer => 'Show fewer';

  @override
  String get cardProductsShowMore => 'Show more';

  @override
  String get cardProductsNone => 'Nothing matches these filters.';

  @override
  String get cardProductsCheck => 'The price is checked at the store.';

  @override
  String get cardProductsBuy => 'Buy';

  @override
  String get cardProductsCompareStores => 'Compare stores';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Compare stores for $title';
  }

  @override
  String get cardProductsBuyForMe => 'Buy for me';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Buy $title at $store';
  }

  @override
  String get cardProductsRowPrice => 'Price';

  @override
  String get cardProductsRowStore => 'Store';

  @override
  String get cardProductsRowRating => 'Rating';

  @override
  String get cardProductsRowDelivery => 'Delivery';

  @override
  String cardProductsDelivery(String text) {
    return 'Delivery: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'by $brand';
  }

  @override
  String get cardProductsOffers => 'Stores';

  @override
  String get cardProductsLowest => 'Lowest total';

  @override
  String cardProductsTotal(String price) {
    return 'Total $price';
  }

  @override
  String get cardProductsOutOfStock => 'Out of stock';

  @override
  String get cardProductsFeatures => 'About it';

  @override
  String get cardProductsReviews => 'What buyers say';

  @override
  String get cardCheckoutTitle => 'Check before I pay';

  @override
  String get cardCheckoutTotal => 'Total';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Open the page';

  @override
  String get cardCheckoutCancel => 'Cancel';

  @override
  String get cardCheckoutChange => 'Change';

  @override
  String get cardCheckoutConfirm => 'Confirm and pay';

  @override
  String get cardCheckoutCancelLabel => 'Cancel this';

  @override
  String get cardCheckoutChangeLabel => 'Change something';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Confirm $total at $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Confirm $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Confirmed';

  @override
  String get cardCheckoutChanging => 'Changing';

  @override
  String get cardCheckoutCancelled => 'Cancelled';

  @override
  String get cardBookingTitle => 'Your booking';

  @override
  String cardBookingWith(String site) {
    return 'Booked with $site';
  }

  @override
  String get cardBookingCheckIn => 'Check-in';

  @override
  String get cardBookingCheckOut => 'Check-out';

  @override
  String get cardBookingConfirmation => 'Confirmation number';

  @override
  String get cardBookingCopy => 'Copy the confirmation number';

  @override
  String get cardBookingPaid => 'Paid';

  @override
  String get cardBookingPayAtHotel => 'Pay at the hotel';

  @override
  String cardBookingCancelBy(String date) {
    return 'Free cancellation until $date';
  }

  @override
  String get cardBookingDirections => 'Directions';

  @override
  String get cardBookingManage => 'Manage booking';

  @override
  String get cardBookingCalendar => 'Add to calendar';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Add $name to my calendar';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Order $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Placed $date';
  }

  @override
  String get cardOrderStepOrdered => 'Ordered';

  @override
  String get cardOrderStepShipped => 'Shipped';

  @override
  String get cardOrderStepOut => 'Out for delivery';

  @override
  String get cardOrderStepDelivered => 'Delivered';

  @override
  String get cardOrderCancelled => 'Cancelled';

  @override
  String get cardOrderReturned => 'Returned';

  @override
  String cardOrderArrives(String date) {
    return 'Arrives $date';
  }

  @override
  String get cardOrderTracking => 'Tracking number';

  @override
  String get cardOrderCopy => 'Copy the tracking number';

  @override
  String get cardOrderTrack => 'Track';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Track $number';
  }

  @override
  String get cardOrderPage => 'Order page';

  @override
  String get cardFaresBest => 'Best';

  @override
  String get cardFaresCheapest => 'Cheapest';

  @override
  String get cardFaresFastest => 'Fastest';

  @override
  String get cardFaresDirectOnly => 'Direct only';

  @override
  String get cardFaresDirect => 'Direct';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n stops',
      one: '1 stop',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Book';

  @override
  String cardFaresFromPrice(String price) {
    return 'from $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n travellers',
      one: '1 traveller',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n nights',
      one: '1 night',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Economy';

  @override
  String get cardFaresPremium => 'Premium economy';

  @override
  String get cardFaresBusiness => 'Business';

  @override
  String get cardFaresFirst => 'First';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Usually $low–$high for this trip';
  }

  @override
  String get cardFaresLevelLow => 'Low now';

  @override
  String get cardFaresLevelTypical => 'Typical now';

  @override
  String get cardFaresLevelHigh => 'High now';

  @override
  String cardFaresShowAll(int n) {
    return 'Show all $n';
  }

  @override
  String get cardFaresShowFewer => 'Show fewer';

  @override
  String get cardFaresNoDirect => 'No direct flights in this search.';

  @override
  String get cardFaresOutboundOnly =>
      'Prices are for the whole trip; pick the return flight on Google Flights.';

  @override
  String get cardFaresSeeAll => 'See all on Google Flights';

  @override
  String get cardFaresCheck =>
      'Prices are for all travellers and are checked again on the booking site.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin cabin, $checked checked bags';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama may earn a commission when you book through these links. It doesn\'t change the price.';

  @override
  String cardFaresCompare(String site) {
    return 'Compare on $site';
  }

  @override
  String get cardFaresWatch => 'Watch price';

  @override
  String cardFaresWatching(String date) {
    return 'Watching · ends $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Watching for $price or less · ends $date';
  }

  @override
  String get cardFaresWatchStop => 'Stop';

  @override
  String get cardFaresWatchTitle => 'Watch this price';

  @override
  String get cardFaresWatchBody =>
      'Casama checks this price a few times a day and sends you a notification when it drops. It stops on its own when the date passes, or in 60 days.';

  @override
  String get cardFaresWatchTarget => 'Tell me when it\'s under (optional)';

  @override
  String get cardFaresWatchAnyDrop => 'Leave empty for any big drop';

  @override
  String get cardFaresWatchStart => 'Watch';

  @override
  String get cardFaresWatchStarted =>
      'Watching this price. You\'ll get a notification when it drops.';

  @override
  String get cardFaresWatchStopped => 'Stopped watching this price.';

  @override
  String get cardFaresWatchFull =>
      'You\'re already watching 10 prices. Stop one in Settings → Cards first.';

  @override
  String get cardFaresWatchFailed =>
      'Couldn\'t change the price watch. Try again.';

  @override
  String get cardFaresFlagSeparate => 'Separate tickets';

  @override
  String get cardFaresFlagOvernight => 'Overnight layover';

  @override
  String get cardFaresFlagAirport => 'Changes airport';

  @override
  String get cardFaresFlagShort => 'Short layover';

  @override
  String get cardFaresFlagLong => 'Long layover';

  @override
  String get cardFaresNoteSeparate =>
      'Different airlines on one way, so these may be separate tickets. If you miss the connection, the next flight may not be covered. Check on the booking site.';

  @override
  String get cardFaresNoteOvernight => 'A layover runs overnight.';

  @override
  String get cardFaresNoteAirport =>
      'A connection leaves from a different airport.';

  @override
  String get cardFaresNoteShort => 'A layover is under an hour.';

  @override
  String get cardFaresNoteLong => 'A layover is over 8 hours.';

  @override
  String get cardFaresOutbound => 'Outbound';

  @override
  String get cardFaresReturn => 'Return';

  @override
  String cardFaresEmissions(int kg) {
    return 'About $kg kg of CO₂ per traveller';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return '$time layover in $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'next flight leaves from $place';
  }

  @override
  String get cardFaresViewFailed => 'Couldn\'t load these fares.';

  @override
  String get cardFaresTryAgain => 'Try again';

  @override
  String get cardFaresMorning => 'Morning';

  @override
  String get cardFaresAfternoon => 'Afternoon';

  @override
  String get cardFaresEvening => 'Evening';

  @override
  String get cardFaresNight => 'Night';

  @override
  String get cardFaresTime => 'Time';

  @override
  String get cardFaresAirlines => 'Airlines';

  @override
  String get cardFaresBagIncluded => 'Bag included';

  @override
  String get cardFaresNoMatch => 'No flights match these filters.';

  @override
  String get cardFaresOpenInChat => 'Open in chat';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Show flights $route on $date';
  }

  @override
  String get cardFaresEdit => 'Edit search';

  @override
  String get cardFaresDetails => 'Details';

  @override
  String get cardFaresSinceStart => 'since you started watching';

  @override
  String get cardFareCalOneWay => 'One way';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Return after $n nights',
      one: 'Return after 1 night',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Low';

  @override
  String get cardFareCalUsual => 'Usual';

  @override
  String get cardFareCalHigh => 'High';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Cheapest: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'See fares';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: no price';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'From $from · anywhere';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'From $from · abroad';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'From $from · same country';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'under $price';
  }

  @override
  String get cardFlightSearchTitle => 'Search flights';

  @override
  String get cardFlightSearchReturn => 'Return';

  @override
  String get cardFlightSearchOneWay => 'One way';

  @override
  String get cardFlightSearchFrom => 'From';

  @override
  String get cardFlightSearchTo => 'To';

  @override
  String get cardFlightSearchPlaceHint => 'City or airport';

  @override
  String get cardFlightSearchAnywhere => 'Anywhere';

  @override
  String get cardFlightSearchSwap => 'Swap places';

  @override
  String get cardFlightSearchPickDates => 'Pick dates';

  @override
  String get cardFlightSearchPickDate => 'Pick a date';

  @override
  String get cardFlightSearchWholeMonth => 'Whole month';

  @override
  String get cardFlightSearchNights => 'Nights away';

  @override
  String get cardFlightSearchAdults => 'Adults';

  @override
  String get cardFlightSearchChildren => 'Children (2 to 11)';

  @override
  String get cardFlightSearchInfants => 'Infants (under 2)';

  @override
  String get cardFlightSearchNotNow => 'Not now';

  @override
  String get cardFlightSearchSent => 'Searching…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Flights $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Cheapest now';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'The last $n days',
      one: 'The last day',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'from $low to $high';
  }

  @override
  String get cardFareTrendNote =>
      'This is what prices have been, not a forecast. They can change at any time.';

  @override
  String get cardFareWatchesTitle => 'Price watches';

  @override
  String get cardFareWatchesNone =>
      'You\'re not watching any fares. Tap Watch price on a fares card to start.';

  @override
  String get cardFareWatchesNoPrice => 'No price yet';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Target $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Any big drop';

  @override
  String cardFareWatchesLow(String price) {
    return 'lowest $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'ends $date';
  }

  @override
  String get cardsFareWatches => 'Price watches';

  @override
  String get cardsFareWatchesNone =>
      'No price watches. Tap Watch price on a flight fares card to get a notification when it drops.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Now $price · ends $date';
  }

  @override
  String get cardFromBot => 'Written by the bot; it may be wrong';

  @override
  String get cardFullRecipe => 'Full recipe';

  @override
  String get cardGate => 'Gate';

  @override
  String get cardGo => 'Go';

  @override
  String get cardHeads => 'Heads';

  @override
  String get cardHolidays => 'Public holidays';

  @override
  String get cardHoursShort => 'hours';

  @override
  String get cardHumidity => 'Humidity';

  @override
  String get cardItsTime => 'It\'s time!';

  @override
  String get cardJustNow => 'just now';

  @override
  String get cardLast24h => 'Last 24 hours';

  @override
  String get cardLast30Days => 'Last 30 days';

  @override
  String get cardListen => 'Listen';

  @override
  String get cardLiveNow => 'Right now';

  @override
  String get cardLongWeekend => 'Long weekend';

  @override
  String get cardLostShort => 'L';

  @override
  String get cardMarket24h => '24/7';

  @override
  String get cardMarketCap => 'Market cap';

  @override
  String get cardMarketClosed => 'Closed';

  @override
  String get cardMarketOpen => 'Open';

  @override
  String get cardMarketPost => 'After hours';

  @override
  String get cardMarketPre => 'Pre-market';

  @override
  String get cardMessage => 'Message';

  @override
  String get cardMinutesShort => 'min';

  @override
  String get cardMoonFirstQuarter => 'First quarter';

  @override
  String get cardMoonFull => 'Full moon';

  @override
  String get cardMoonLastQuarter => 'Last quarter';

  @override
  String get cardMoonNew => 'New moon';

  @override
  String get cardMoonWaningCrescent => 'Waning crescent';

  @override
  String get cardMoonWaningGibbous => 'Waning gibbous';

  @override
  String get cardMoonWaxingCrescent => 'Waxing crescent';

  @override
  String get cardMoonWaxingGibbous => 'Waxing gibbous';

  @override
  String get cardMore => 'More';

  @override
  String get cardNext24h => 'Next 24 hours';

  @override
  String get cardNoAlerts => 'No alerts';

  @override
  String get cardNoAlertsLong =>
      'No weather warnings are in force here right now.';

  @override
  String get cardNoChart => 'No chart for this range';

  @override
  String get cardNoGames => 'No games';

  @override
  String get cardNoHolidays => 'No more public holidays this year.';

  @override
  String get cardNoQuakes => 'No earthquakes of that size recently.';

  @override
  String get cardNoStorms => 'None active';

  @override
  String get cardNoStormsLong => 'No tropical storms are active right now.';

  @override
  String get cardNotAdvice => 'Not financial advice';

  @override
  String get cardNow => 'Now';

  @override
  String get cardNutritionFacts => 'Nutrition Facts';

  @override
  String get cardOpen => 'Open';

  @override
  String get cardOpenSource => 'Open the source';

  @override
  String get cardParcel => 'Parcel';

  @override
  String get cardParcelDelivered => 'Delivered';

  @override
  String get cardParcelInTransit => 'On the way';

  @override
  String get cardParcelOrdered => 'Label made';

  @override
  String get cardParcelOut => 'Out for delivery';

  @override
  String get cardParcelProblem => 'Problem';

  @override
  String get cardParcelNoLive =>
      'No live status for this number here. The carrier\'s page has the latest.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Track on $site';
  }

  @override
  String get cardPin => 'Pin to widgets';

  @override
  String get cardPinFailed => 'Couldn\'t pin this card';

  @override
  String get cardPinned => 'Pinned to your widgets';

  @override
  String get cardPinnedWaiting =>
      'Pinned. Allow this bot on your widgets to see it there';

  @override
  String get cardPlayedShort => 'P';

  @override
  String get cardPointsShort => 'Pts';

  @override
  String get cardPrevClose => 'Prev. close';

  @override
  String get cardPros => 'Pros';

  @override
  String get cardProsCons => 'Pros and cons';

  @override
  String get cardQuiz => 'Quiz';

  @override
  String get cardRain => 'Rain';

  @override
  String get cardRainChance => 'Rain chance';

  @override
  String get cardRandom => 'Random';

  @override
  String get cardReadMore => 'Read more';

  @override
  String get cardReferenceRates =>
      'Central bank reference rates, published daily';

  @override
  String get cardRefresh => 'Refresh';

  @override
  String get cardReport => 'Report wrong data';

  @override
  String get cardReported => 'Thanks, we\'ll look at it';

  @override
  String get cardSameTime => 'same time';

  @override
  String get cardScores => 'Scores';

  @override
  String get cardSecondsShort => 'sec';

  @override
  String get cardServings => 'Servings';

  @override
  String get cardShareImage => 'Share as picture';

  @override
  String get cardStandings => 'Standings';

  @override
  String get cardStorms => 'Tropical storms';

  @override
  String get cardSunMoon => 'Sun and moon';

  @override
  String get cardSunrise => 'Sunrise';

  @override
  String get cardSunset => 'Sunset';

  @override
  String get cardSwap => 'Swap';

  @override
  String get cardSynonyms => 'Similar:';

  @override
  String get cardTails => 'Tails';

  @override
  String get cardTeam => 'Team';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Time in each place';

  @override
  String get cardTimeline => 'Timeline';

  @override
  String get cardToday => 'Today';

  @override
  String get cardTomorrow => 'Tomorrow';

  @override
  String get cardTranslation => 'Translation';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Remove from widgets';

  @override
  String get cardUnpinned => 'Removed from your widgets';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'extreme';

  @override
  String get cardUvHigh => 'high';

  @override
  String get cardUvLow => 'low';

  @override
  String get cardUvModerate => 'moderate';

  @override
  String get cardUvVeryHigh => 'very high';

  @override
  String get cardVolume => 'Volume';

  @override
  String get cardWatchlist => 'Watchlist';

  @override
  String get cardWeather => 'Weather';

  @override
  String get cardWeatherAlerts => 'Weather alerts';

  @override
  String get cardWebsite => 'Website';

  @override
  String get cardWind => 'Wind';

  @override
  String get cardWonShort => 'W';

  @override
  String get cardWorldClock => 'World clock';

  @override
  String get cardYesterday => 'Yesterday';

  @override
  String get cardQuakesWorld => 'Strongest earthquakes today';

  @override
  String cardMinutesAgo(int n) {
    return '$n min ago';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n h ago';
  }

  @override
  String cardStale(String ago) {
    return 'Couldn\'t update · from $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Updated $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Delayed $minutes min';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'H $high  L $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Feels $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n days';
  }

  @override
  String cardUntil(String when) {
    return 'Until $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n alerts in force',
      one: '1 alert in force',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Mostly $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Alder pollen',
      'birch': 'Birch pollen',
      'grass': 'Grass pollen',
      'mugwort': 'Mugwort pollen',
      'olive': 'Olive pollen',
      'ragweed': 'Ragweed pollen',
      'other': 'Pollen',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '${h}h ${m}m';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Golden hour from $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct% lit';
  }

  @override
  String cardMoonrise(String time) {
    return 'Rises $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Sets $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Change over $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up up · $down down';
  }

  @override
  String cardRatesOf(String date) {
    return 'Rates of $date';
  }

  @override
  String cardAtTime(String when) {
    return 'At $when';
  }

  @override
  String cardInDays(int n) {
    return 'in $n days';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct% of the way';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Earthquakes near $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n earthquakes',
      one: '1 earthquake',
      zero: 'None',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '$depth deep';
  }

  @override
  String cardAway(String distance) {
    return '$distance away';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n active',
      one: '1 active',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return '$level alert';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n games',
      one: '1 game',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n live';
  }

  @override
  String cardMinutes(int n) {
    return '$n min';
  }

  @override
  String cardExpected(String date) {
    return 'Expected $date';
  }

  @override
  String cardCalories(int n) {
    return '$n kcal';
  }

  @override
  String cardStepsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Wins $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Serving: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed of $total checks passed';
  }

  @override
  String cardTotal(int n) {
    return 'Total $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'After $n years';
  }

  @override
  String get cardsSettingsTitle => 'Cards';

  @override
  String get cardsSettingsRow => 'Home city, units and data sources';

  @override
  String get cardsSettingsIntro =>
      'Bots answer weather, prices, rates, time and more with cards of real data that stay fresh. Your home city is used when you ask without naming a place.';

  @override
  String get cardsSettingsSaveFailed => 'Couldn\'t save. Try again.';

  @override
  String get cardsHomeCity => 'Home city';

  @override
  String get cardsHomeClear => 'Clear';

  @override
  String get cardsHomeNone =>
      'Not set. Bots use your time zone\'s main city until you pick one.';

  @override
  String get cardsHomeSearch => 'Search for your city';

  @override
  String get cardsHomePrivacy =>
      'Only a city is kept, never your address; it\'s sent to weather services as rounded coordinates.';

  @override
  String get cardsUnits => 'Units';

  @override
  String get cardsTemperature => 'Temperature';

  @override
  String get cardsWind => 'Wind';

  @override
  String get cardsRain => 'Rain';

  @override
  String get cardsDistance => 'Distance';

  @override
  String get cardsPrices => 'Prices';

  @override
  String get cardsRedUp => 'Red means up';

  @override
  String get cardsRedUpHint =>
      'Show rising prices in red and falling ones in green, as markets in China, Japan and Korea do.';

  @override
  String get cardsSources => 'Data sources';

  @override
  String get cardsSourcesIntro =>
      'Cards say where their data came from and when. These services provide it:';

  @override
  String get cardFewerServings => 'Fewer servings';

  @override
  String get cardMoreServings => 'More servings';

  @override
  String get cropTitle => 'Move and Scale';

  @override
  String get cropDone => 'Done';

  @override
  String get cropPosition => 'Picture position';

  @override
  String get cropMoveUp => 'Move up';

  @override
  String get cropMoveDown => 'Move down';

  @override
  String get cropMoveLeft => 'Move left';

  @override
  String get cropMoveRight => 'Move right';

  @override
  String get cropRotate => 'Rotate';

  @override
  String get cropMirror => 'Mirror';

  @override
  String get cropReset => 'Reset';

  @override
  String get cropZoom => 'Zoom';

  @override
  String get cropZoomIn => 'Zoom in';

  @override
  String get cropZoomOut => 'Zoom out';

  @override
  String get cropSoft => 'Zoomed in close: the picture may look soft';

  @override
  String get cropAnimatedStill => 'Animated pictures stay still';

  @override
  String get cropBackground => 'Background';

  @override
  String get cropBackgroundNone => 'None';

  @override
  String cropBackgroundBot(String name) {
    return '$name\'s color';
  }

  @override
  String get cropBackgroundWhite => 'White';

  @override
  String get cropBackgroundBlack => 'Black';

  @override
  String get cropUnreadable =>
      'This picture can\'t be opened here. Try a JPEG or PNG.';

  @override
  String cropTooBig(String size) {
    return 'This file is $size, over the 40 MB limit.';
  }

  @override
  String get botPicture => 'Picture';

  @override
  String botPictureTitle(String name) {
    return '$name\'s Picture';
  }

  @override
  String botPictureChange(String name) {
    return 'Change $name\'s picture';
  }

  @override
  String get botPicturePaste => 'Paste Picture';

  @override
  String get botPictureDraw => 'Make One with AI';

  @override
  String get botPictureDrawHelp => 'Casama draws two to choose from';

  @override
  String get botPictureRecrop => 'Re-crop';

  @override
  String get botPictureMascot => 'Use a Mascot Instead';

  @override
  String get botPictureRemove => 'Remove Picture';

  @override
  String get botPictureRecent => 'Recent';

  @override
  String get botPictureUpdated => 'Picture updated';

  @override
  String get botPictureRemoved => 'Picture removed';

  @override
  String get botPictureFailed => 'Couldn\'t save the picture';

  @override
  String botPictureDrop(String name) {
    return 'Drop to use as $name\'s picture';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Use as $name\'s Picture';
  }

  @override
  String get botPictureUseAsBot => 'Use as a Bot\'s Picture';

  @override
  String get botPictureWhichBot => 'Which bot gets this picture?';

  @override
  String botDrawTitle(String name) {
    return 'A Picture for $name';
  }

  @override
  String get botDrawIntro =>
      'Pick a look, add a few words if you like, and Casama draws two pictures to choose from.';

  @override
  String get botDrawDescribe => 'Describe it (optional)';

  @override
  String get botDrawHint => 'A friendly owl with reading glasses';

  @override
  String get botDrawMake => 'Make 2';

  @override
  String get botDrawMore => 'Make 2 More';

  @override
  String get botDrawPick => 'Tap one to use it';

  @override
  String get botDrawCost =>
      'Each picture uses image credits, like any picture Casama makes.';

  @override
  String get botDrawWorking => 'Drawing…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => 'Soft 3D';

  @override
  String get botDrawStyleWatercolor => 'Watercolor';

  @override
  String get botDrawStyleFlat => 'Flat Icon';

  @override
  String get botDrawStylePixel => 'Pixel Art';

  @override
  String get botDrawStyleLine => 'Line Art';

  @override
  String get botDrawStylePhoto => 'Photo';

  @override
  String get sharePictureStays =>
      'Its picture stays in this workspace: the copy gets its earlier mascot, or its initials.';

  @override
  String savedResetRefills(String amount) {
    return 'Refills $amount of credits';
  }

  @override
  String get savedResetClearsDaily => 'Clears today’s limit';

  @override
  String get savedResetGivesHours => 'Gives back computer hours';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days left',
      one: '1 day left',
      zero: 'Expires today',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Models';

  @override
  String get modelsRowHelp => 'Casama\'s models or your own keys';

  @override
  String get modelsIntro =>
      'Choose whether Casama runs your bots or connect your own model keys. Keys are stored encrypted and never shown again.';

  @override
  String get whoRunsYourBots => 'Who runs your bots';

  @override
  String adminModelAccessPlan(String plan) {
    return '$plan plan (monthly, yearly and weekly)';
  }

  @override
  String get adminModelAccessFollowDefault => 'Follow default';

  @override
  String get whoRunsCasama => 'Casama';

  @override
  String get whoRunsCasamaHelp =>
      'Included with your plan; uses workspace credits';

  @override
  String get whoRunsCasamaOffHelp => 'Paused on your current plan';

  @override
  String get whoRunsOwn => 'Your own provider';

  @override
  String get whoRunsOwnHelp =>
      'Billed directly by your provider; uses no Casama credits';

  @override
  String get whoRunsCasamaShort => 'Casama\'s models, included with your plan';

  @override
  String get whoRunsCasamaCost => 'Uses credits';

  @override
  String get whoRunsOwnShort => 'Your keys, billed by your provider';

  @override
  String get whoRunsOwnCost => 'No Casama credits';

  @override
  String get whoRunsOwnNeedsKey =>
      'To use your own provider, add a chat key from it under Add a key below first.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Pick a model for this key below to switch.';

  @override
  String get whoRunsAdminOnly =>
      'Only workspace admins can change who runs your bots.';

  @override
  String get botModelSource => 'Model source';

  @override
  String get botModelSourceWorkspace => 'Workspace default';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'One of your keys';

  @override
  String get useCasamaFallback => 'If my provider fails, use Casama\'s models';

  @override
  String get useCasamaFallbackHelp =>
      'When your key hits a rate limit or quota, fall back to Casama\'s models using your workspace credits.';

  @override
  String get keyCoversOpenRouter =>
      'Chat, images, video, read-aloud, voice messages and dictation';

  @override
  String get keyCoversGoogle => 'Chat and live calls';

  @override
  String get keyCoversOpenAi => 'Chat and memory search';

  @override
  String get keyCoversChat => 'Chat';

  @override
  String get ownProviderPrivacyNote =>
      'On your own provider, that provider\'s terms apply to what your bots send it. Casama\'s no-training setting only applies on Casama\'s key.';

  @override
  String get creditsOwnProviderNote =>
      'Models on your own provider don\'t use credits.';

  @override
  String get routineWaitingForModel => 'Waiting for a model';

  @override
  String get ownProviderRequiredTitle => 'Connect a model to keep chatting';

  @override
  String get ownProviderRequiredBody =>
      'Casama\'s models aren\'t available on this plan right now. Add your own model key or upgrade your plan.';

  @override
  String get modelNoToolsWarning =>
      'This model doesn\'t support tools, so the bot can only reply in text.';

  @override
  String get adminModelAccessTitle => 'Model access';

  @override
  String get adminModelAccessHelp =>
      'Allow workspaces to bring their own model keys, and turn Casama\'s models on or off per plan';

  @override
  String get adminOwnProviders => 'Allow own model providers on Cloud';

  @override
  String get adminCasamaModelsDefault => 'Casama\'s models (default)';

  @override
  String get adminCasamaModelsNote =>
      'Note shown when Casama\'s models are off';

  @override
  String get appBrowserTitle => 'Browser on This Phone';

  @override
  String get appBrowserTitleMac => 'Browser on This Mac';

  @override
  String get appBrowserTitleLinux => 'Browser on This Computer';

  @override
  String get appBrowserTitleWindows => 'Browser on This PC';

  @override
  String get appBrowserHelp =>
      'A small browser inside Casama that bots you allow can use while you watch, only while you have their chat open on this phone. Your sign-ins stay on this phone.';

  @override
  String get appBrowserHelpMac =>
      'A small browser inside Casama that bots you allow can use while you watch, while Casama is open on this Mac. Your sign-ins stay on this Mac.';

  @override
  String get appBrowserHelpLinux =>
      'A small browser inside Casama that bots you allow can use while you watch, while Casama is open on this computer. Your sign-ins stay on this computer.';

  @override
  String get appBrowserHelpWindows =>
      'A small browser inside Casama that bots you allow can use while you watch, while Casama is open on this PC. Your sign-ins stay on this PC.';

  @override
  String get appBrowserSwitchHelp =>
      'Bots you allow can open pages here while their chat is open on this phone.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Bots you allow can open pages here while Casama is open on this Mac.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Bots you allow can open pages here while Casama is open on this computer.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Bots you allow can open pages here while Casama is open on this PC.';

  @override
  String get appBrowserOn => 'On';

  @override
  String get appBrowserOff => 'Off';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Switched off: $reason';
  }

  @override
  String get appBrowserReasonOff => 'not available yet.';

  @override
  String get appBrowserReasonNotTester => 'only for testers for now.';

  @override
  String get appBrowserReasonSystemOff => 'not available on this device yet.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'an admin turned it off for this workspace.';

  @override
  String get appBrowserReasonUnavailable =>
      'this server doesn\'t have device connections.';

  @override
  String get appBrowserReasonUnsupported =>
      'this device\'s browser can\'t run it.';

  @override
  String get appBrowserReasonNeedsMacos14 => 'needs macOS 14 or later.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Install WebKitGTK to use the browser here: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Install or update Microsoft Edge WebView2 to use the browser here.';

  @override
  String get appBrowserGetWebview2 => 'Get WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Paired on an earlier install. Turn it on again to pair this device.';

  @override
  String get appBrowserAllBots => 'All Your Bots';

  @override
  String get appBrowserAllBotsHelp =>
      'Every bot you can chat with may use this browser. Turn off to pick individual bots.';

  @override
  String get appBrowserModeHeader => 'When a Bot Needs a Browser';

  @override
  String get appBrowserModeAsk => 'Ask when it helps';

  @override
  String get appBrowserModeAskHelp =>
      'Offer a choice when a site needs your sign-in or blocks the bot\'s computer.';

  @override
  String get appBrowserModeComputer => 'Always the bot\'s computer';

  @override
  String get appBrowserModeComputerHelp =>
      'Never offer this device\'s browser unless you ask for it in chat.';

  @override
  String get appBrowserModeDevice => 'Prefer this device';

  @override
  String get appBrowserModeDeviceHelp =>
      'Use this device\'s browser for sign-ins and blocked sites without asking.';

  @override
  String get appBrowserNeverAsk => 'Bot\'s computer (don\'t ask)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Linux Computer';

  @override
  String get appBrowserDeviceWindows => 'Windows PC';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting =>
      'Waiting for you. Keep this chat open to carry on in your browser.';

  @override
  String browserWaitingSite(String site) {
    return 'Waiting for you. Keep this chat open to carry on with $site in your browser.';
  }

  @override
  String get browserWaitEnded => 'Stopped waiting for your browser.';

  @override
  String get browserHandBackWaiting =>
      'Your turn in the browser. Do the step on the page, then tap Hand Back.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Your turn on $site. Do the step on the page, then tap Hand Back.';
  }

  @override
  String get browserHandBackEnded =>
      'Stopped waiting for you to hand the browser back.';

  @override
  String get browserChoiceCardLabel => 'Browser Choice';

  @override
  String browserChoiceTitle(String bot, String site) {
    return 'Where should $bot open $site?';
  }

  @override
  String get browserChoiceSubtitleSignIn => 'This site needs your sign-in.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'This site kept $bot\'s computer out.';
  }

  @override
  String get browserChoiceOnPhone => 'On this phone';

  @override
  String get browserChoiceOnMac => 'On this Mac';

  @override
  String get browserChoiceOnLinux => 'On this computer';

  @override
  String get browserChoiceOnWindows => 'On this PC';

  @override
  String get browserChoiceOnDeviceHelp =>
      'You watch, and you can sign in yourself. What it reads goes to the AI.';

  @override
  String get browserChoiceInChrome => 'In your Chrome';

  @override
  String get browserChoiceInChromeHelp => 'Already signed in to your sites.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'On $bot\'s computer';
  }

  @override
  String get browserChoiceOnComputerHelp => 'Keeps going if you leave.';

  @override
  String browserChoiceRemember(String site) {
    return 'Remember for $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return 'Opened $site on this phone';
  }

  @override
  String browserChoicePickedMac(String site) {
    return 'Opened $site on this Mac';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return 'Opened $site on this computer';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return 'Opened $site on this PC';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return 'Opened $site in your Chrome';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return 'Opened $site on $bot\'s computer';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'No answer in time; stayed on $bot\'s computer';
  }

  @override
  String get appBrowserConsentTitle => 'Let Bots Use the Browser in Casama?';

  @override
  String get appBrowserConsentPages =>
      'Pages a bot reads here are sent to Casama and to the bot\'s AI model, as pages it reads on its own computer are.';

  @override
  String get appBrowserConsentSignIns =>
      'Your sign-ins stay on this device. Bots never see passwords, card numbers or codes; you type those yourself.';

  @override
  String get appBrowserConsentWatch =>
      'It works only while you have the bot\'s chat open here. You can watch, take over or stop it at any time.';

  @override
  String get appBrowserConsentYours =>
      'What you browse yourself is never sent anywhere.';

  @override
  String get appBrowserBots => 'Bots That May Use It';

  @override
  String get appBrowserBotsHelp =>
      'Only the bots switched on here can use the browser on this device.';

  @override
  String get appBrowserNoBots => 'No bots yet.';

  @override
  String get appBrowserSites => 'Sites';

  @override
  String get appBrowserSitesHelp =>
      'Sites you answered Always or Never. Remove one to be asked again next time.';

  @override
  String get appBrowserNoSites =>
      'No sites yet. A bot asks the first time it opens a site.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Remove $site';
  }

  @override
  String get appBrowserKinds => 'Sites That Stay Off';

  @override
  String get appBrowserKindsHelp =>
      'These kinds of sites stay off unless you turn them on. When one is on, a bot still asks every time.';

  @override
  String get appBrowserKindBanking => 'Banking and Payments';

  @override
  String get appBrowserKindHealth => 'Health';

  @override
  String get appBrowserKindPasswords => 'Password Managers';

  @override
  String get appBrowserKindGovernment => 'Government ID';

  @override
  String get appBrowserSignIn => 'Sign In to a Site';

  @override
  String get appBrowserSignInHelp =>
      'Open a site, sign in yourself, then let your bots use it. Nothing you do there is sent anywhere.';

  @override
  String get appBrowserClearData => 'Clear Browsing Data';

  @override
  String get appBrowserClearDataHelp =>
      'Signs this browser out of every site and clears what sites saved.';

  @override
  String get appBrowserClearDataConfirm =>
      'Clear this browser\'s sign-ins and site data?';

  @override
  String get appBrowserClearDataDone => 'Browsing data cleared';

  @override
  String get appBrowserUnpair => 'Unpair This Device';

  @override
  String get appBrowserUnpairConfirm =>
      'Unpair this device\'s browser? Bots can\'t use it until you turn it on again.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot is working';
  }

  @override
  String get appBrowserTakeOver => 'Take Over';

  @override
  String get appBrowserHandBack => 'Hand Back';

  @override
  String get appBrowserYourTurn => 'Your turn';

  @override
  String appBrowserPaused(String bot) {
    return '$bot is paused while you use the page';
  }

  @override
  String get appBrowserAway => 'Paused: the chat isn\'t open';

  @override
  String get appBrowserAddress => 'Site address';

  @override
  String get appBrowserBack => 'Back';

  @override
  String get appBrowserForward => 'Forward';

  @override
  String get appBrowserReload => 'Reload';

  @override
  String get appBrowserAllowSite => 'Let My Bots Use This Site';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site added. Your bots can use it here.';
  }

  @override
  String get appBrowserAddressRefused => 'That address can\'t be opened here.';

  @override
  String get appBrowserSecure => 'Secure connection';

  @override
  String get appBrowserNotSecure => 'Not secure';

  @override
  String get appBrowserCardLabel => 'In-App Browser';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot wants to open $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'In Casama on this device, with your sign-ins. Always lets it open this site from now on.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'On this Mac, with your sign-ins. Always lets it open this site from now on.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'On this computer, with your sign-ins. Always lets it open this site from now on.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'On this PC, with your sign-ins. Always lets it open this site from now on.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Banking and Payments sites ask every time.',
      'health': 'Health sites ask every time.',
      'passwords': 'Password Managers sites ask every time.',
      'government': 'Government ID sites ask every time.',
      'other': 'These sites ask every time.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Once';

  @override
  String get appBrowserAlways => 'Always';

  @override
  String get appBrowserNever => 'Never';

  @override
  String appBrowserStepAskTitle(String bot) {
    return 'Allow $bot to do this?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'In Casama on this device, with your sign-ins.';

  @override
  String get appBrowserStepAskHelpMac => 'On this Mac, with your sign-ins.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'On this computer, with your sign-ins.';

  @override
  String get appBrowserStepAskHelpWindows => 'On this PC, with your sign-ins.';

  @override
  String appBrowserStepClick(String name) {
    return 'Tap “$name”';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Type into “$name”';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Press a key in “$name”';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Upload a file to “$name”';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'Don\'t Allow';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Android Phone';

  @override
  String get toolOnThisPhone => 'on this device';

  @override
  String get appBrowserWorkspaceSwitch => 'Bots in Members\' In-App Browsers';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Members can let bots use a browser inside Casama on their phone or computer, while they watch.';

  @override
  String get adminAppBrowser => 'In-App Browser';

  @override
  String get adminAppBrowserHelp =>
      'Who can use the browser inside the Casama app, for which reasons and on which systems';

  @override
  String get adminAppBrowserStage => 'Stage';

  @override
  String get adminAppBrowserStageOff => 'Off';

  @override
  String get adminAppBrowserStageTesters => 'Testers';

  @override
  String get adminAppBrowserStageOn => 'On';

  @override
  String get adminAppBrowserTesters => 'Testers';

  @override
  String get adminAppBrowserTestersHelp => 'User ids, one per line';

  @override
  String get adminAppBrowserReasons => 'Reasons';

  @override
  String get adminAppBrowserReasonAsked => 'When the Person Asks';

  @override
  String get adminAppBrowserReasonBlocked => 'When a Site Blocks the Computer';

  @override
  String get adminAppBrowserReasonSignedIn => 'Sites Signed In on the Device';

  @override
  String get adminAppBrowserSystems => 'Systems';

  @override
  String get adminAppBrowserIos => 'iPhone and iPad';

  @override
  String get adminAppBrowserAndroid => 'Android';

  @override
  String adminAppBrowserNumbers(int days) {
    return 'Last $days Days';
  }

  @override
  String get adminAppBrowserBlockedRuns => 'Computer runs that hit a block';

  @override
  String get adminAppBrowserBlockedPeople => 'People who hit a block';

  @override
  String get adminAppBrowserWatchedRuns => 'Watched browser runs';

  @override
  String get adminAppBrowserPhoneRuns => 'Runs in the app';

  @override
  String get adminAppBrowserPhonePeople => 'People using it';

  @override
  String get adminAppBrowserPhonesPaired => 'Devices paired';

  @override
  String get adminAppBrowserPhonesWithSites => 'Devices with sites';

  @override
  String get adminAppBrowserRefusedSteps => 'Steps refused';

  @override
  String get adminCosts => 'Costs';

  @override
  String get vendorRenewalUsd => 'What a renewal costs (USD)';

  @override
  String get vendorRenewalMonths => 'Months a renewal covers';

  @override
  String get vendorSeeSpend => 'See spend';

  @override
  String get costSpent => 'Spent';

  @override
  String get costCharged => 'Charged';

  @override
  String get costMargin => 'Margin';

  @override
  String get costMarginNone => 'Nothing was charged';

  @override
  String get costNotRecorded => 'Not recorded';

  @override
  String get costNotRecordedHint =>
      'Shows what this means and which services it is about';

  @override
  String get costNotRecordedHelp =>
      'Some services report their own total. When theirs is higher than what this server recorded, the difference shows here. It is real spend that no feature, key or workspace is tied to yet.';

  @override
  String get costNotRecordedWhy => 'What services report above this';

  @override
  String get costNotRecordedNone => 'Matches what services report';

  @override
  String get costNotRecordedAllMatch =>
      'Every service that reports a total matches what this server recorded.';

  @override
  String get costNotRecordedNoList =>
      'The list of services isn\'t available right now. Try again in a moment.';

  @override
  String get costNoVendorFigures => 'No service reported a total';

  @override
  String get costNoVendorFiguresHelp =>
      'No service reported its own total for this period, so there is nothing to compare with.';

  @override
  String costNoFigureFrom(String names) {
    return 'No total from: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count services',
      one: '1 service',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'They say $theirs · we recorded $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'They say $theirs · we recorded $ours · $gap not recorded';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'They say $theirs · we recorded $ours · nothing missing';
  }

  @override
  String get costNoVendorFigure =>
      'This service gave no total of its own for this period.';

  @override
  String get costNoVendorFigureKind =>
      'This service doesn\'t report a total of its own.';

  @override
  String costUpdated(String when) {
    return 'Updated $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'vs the $days days before',
      one: 'vs the day before',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'no earlier period to compare';

  @override
  String get costChangeNew => 'New';

  @override
  String get costChangeNewSpoken => 'new in this period';

  @override
  String get costChangeFlat => 'no change';

  @override
  String costChangeUp(String amount) {
    return 'up $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'down $amount';
  }

  @override
  String costPoints(String count) {
    return '$count pts';
  }

  @override
  String get costOther => 'Other';

  @override
  String get costNotLabelled => 'Not labelled';

  @override
  String get costNotLabelledHelp =>
      'These costs were recorded without a label for this grouping, so they can\'t be split further. They are still part of the total.';

  @override
  String get costGroupService => 'Service';

  @override
  String get costGroupKey => 'Key';

  @override
  String get costGroupApp => 'Apps & MCP';

  @override
  String get costGroupFeature => 'Feature';

  @override
  String get costGroupModel => 'Model';

  @override
  String get costGroupWorkspace => 'Workspace';

  @override
  String get costGroupBy => 'Group by';

  @override
  String get costFilters => 'Filters';

  @override
  String get costNoFilters =>
      'None. Open a row and choose Show in the table to narrow the view.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Remove filter $name';
  }

  @override
  String get costIncludeFixed => 'Include fixed bills';

  @override
  String get costIncludeFixedHelp =>
      'Adds subscriptions and renewals to Spent, spread evenly over the days they cover.';

  @override
  String get costOptions => 'Period and filters';

  @override
  String get costPeriod => 'Period';

  @override
  String costPeriodDays(int days) {
    return '$days days';
  }

  @override
  String get costPeriodCustom => 'Custom';

  @override
  String costLastDays(int days) {
    return 'Last $days days';
  }

  @override
  String get costChangeDates => 'Change dates';

  @override
  String get costDone => 'Done';

  @override
  String get costDaysUtc => 'Days are in UTC.';

  @override
  String get costDailySpend => 'Daily spend';

  @override
  String costStackedBy(String group) {
    return 'Stacked by $group: the biggest ones, then Other.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Daily spend chart, $days days, $total in all. The highest day was $peakDay with $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Daily spend chart, $days days, nothing spent.';
  }

  @override
  String get costSourceMetered => 'Metered';

  @override
  String get costSourceCounted => 'Counted';

  @override
  String get costSourceFixed => 'Fixed';

  @override
  String get costSourceEstimated => 'Estimated';

  @override
  String get costSourceMeteredHelp => 'A real cost recorded for each call.';

  @override
  String get costSourceCountedHelp =>
      'This server\'s own count times a unit price.';

  @override
  String get costSourceFixedHelp =>
      'A bill spread evenly over the days it covers.';

  @override
  String get costSourceEstimatedHelp =>
      'Worked out from text length. The real cost is at least this.';

  @override
  String get costEstimated => 'estimated';

  @override
  String get costColShare => 'Share';

  @override
  String get costColChange => 'Change';

  @override
  String get costColCalls => 'Calls';

  @override
  String get costColSource => 'Source';

  @override
  String get costColFailed => 'Failed';

  @override
  String get costColFees => 'Vendor fees';

  @override
  String get costColTokens => 'Token cost';

  @override
  String get costTokenCost => 'Token cost';

  @override
  String get costFailureRate => 'Failure rate';

  @override
  String costSortBy(String column) {
    return 'Sort by $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, sorted low to high';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, sorted high to low';
  }

  @override
  String get costOpenRowHint => 'Opens the details';

  @override
  String costSpokenSpent(String amount) {
    return 'spent $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'vendor fees $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share of the total';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count calls';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate failed';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'estimated token cost $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'charged $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count calls';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate failed';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount tokens, estimated';
  }

  @override
  String get costOpenBilling => 'Open billing page';

  @override
  String get costByDay => 'By day';

  @override
  String get costSplitBy => 'Split by';

  @override
  String get costShowInTable => 'Show in the table';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Narrows the table to $name and groups it by $group.';
  }

  @override
  String get costNothingRecorded => 'Nothing recorded here in this period.';

  @override
  String costLastUsed(String when) {
    return 'last used $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'And $count more. Show them in the table.',
      one: 'And 1 more. Show it in the table.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'What it\'s for';

  @override
  String get costKeyService => 'Service';

  @override
  String get costKeySetting => 'Setting';

  @override
  String get costKeySetIn => 'Where it\'s set';

  @override
  String get costKeyVault => 'Vault item';

  @override
  String get costKeyStatus => 'Status';

  @override
  String get costKeyConfigured => 'Set';

  @override
  String get costKeyNotConfigured => 'Not set';

  @override
  String get costKeyLastUsed => 'Last used';

  @override
  String get costKeyNotUsed => 'Not in this period';

  @override
  String get costKeyCap => 'Spending cap';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '$left left of $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share of the cap used';
  }

  @override
  String get costKeyNoCap => 'None';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nothing was spent in these $days days',
      one: 'Nothing was spent in this day',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Nothing was spent in these days';

  @override
  String get costEmptyFiltered =>
      'Nothing was spent that matches these filters';

  @override
  String get costEmptyGroup => 'Nothing to list for this grouping';

  @override
  String get costAppsNote =>
      'Apps and MCP servers: Spent is what the vendor billed. Token cost is an estimate of what their results cost in model tokens, and is already part of the model spend.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount in fixed bills for this period is left out. Turn on Include fixed bills to add it.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Workspaces paid $amount on their own keys. That isn\'t this server\'s money, so it is left out.';
  }

  @override
  String get costOlderServerTitle => 'This server needs an update';

  @override
  String get costOlderServer =>
      'Costs by service, key and app come with a newer server version. Update the server, then check again.';

  @override
  String get costCheckAgain => 'Check again';

  @override
  String get costSpendCardTitle => 'Spend, last 30 days';

  @override
  String get costSpendCardOpen => 'Costs';

  @override
  String get costSpendCardHint => 'Opens the Costs tab';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Spend in the last 30 days: $spent spent, $charged charged, $margin margin';
  }

  @override
  String get costSort => 'Sort by';

  @override
  String get costSortName => 'Name';

  @override
  String get costByWorkspace => 'By workspace';

  @override
  String get costTopTools => 'Top tools';

  @override
  String get costToolList => 'Tool list sent to the model';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'And $count more tools.',
      one: 'And 1 more tool.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Use Casama\'s Telegram bot';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Talk to $bot in Telegram. One tap, nothing to set up.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Your Telegram is connected in another workspace. Connecting here moves it.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Your messages there go to $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Your messages there go to $other. Tap to send them to $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Telegram messages now go to $bot.';
  }

  @override
  String get telegramFinish => 'Finish in Telegram';

  @override
  String get telegramFinishHelp =>
      'Press Start in Telegram. Only do this on your own Telegram account. This updates once you\'re connected.';

  @override
  String get telegramOpenAgain => 'Open Telegram again';

  @override
  String get telegramConnected => 'Telegram is connected';

  @override
  String telegramConnectedHelp(String name) {
    return 'Connected as $name. Message the bot in Telegram any time; the chat also shows here in General.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Message the bot in Telegram any time; the chat also shows here in General.';

  @override
  String get telegramConnect => 'Connect Telegram';

  @override
  String get telegramDisconnect => 'Disconnect Telegram';

  @override
  String get telegramDisconnectConfirm => 'Disconnect Telegram?';

  @override
  String get telegramDisconnectHelp =>
      'Your bots stop answering in Telegram. Your chat history stays here.';

  @override
  String get telegramPickBot => 'Telegram messages go to';

  @override
  String get telegramNeedsBot => 'Make a bot first, then connect Telegram.';

  @override
  String get telegramNotOffered =>
      'This server has no Telegram bot of its own. You can connect your own bot from a bot\'s Chat apps.';

  @override
  String get chatAppsSettingsHelp =>
      'Talk to your bots from the chat apps you already use. Messages land in your General chat, so you can carry on here.';

  @override
  String get chatAppsPerBot =>
      'Email and your own bots are set up per bot: open a bot, then Chat apps.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack and more';

  @override
  String get chatAppsSlackHelp =>
      'Slack is added per Slack workspace, for one bot. Pick the bot, then Add to Slack.';

  @override
  String get chatAppsSlackPickBot => 'Add Slack for';

  @override
  String get slackAnyoneInWorkspace => 'Anyone in this Slack workspace';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Everyone in the workspace can talk to the bot, not only the people listed. Approvals still need someone on the list.';

  @override
  String get discordUseCasama => 'Use Casama\'s Discord bot';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Talk to $bot in Discord. Sign in with Discord once, then message the bot or use /ask anywhere.';
  }

  @override
  String get discordOtherWorkspace =>
      'Your Discord is connected in another workspace. Connecting here moves it.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Discord messages now go to $bot.';
  }

  @override
  String get discordFinish => 'Finish in Discord';

  @override
  String get discordFinishHelp =>
      'Sign in with Discord in your browser and allow Casama. Only do this with your own Discord account. This updates once you\'re connected.';

  @override
  String get discordOpenAgain => 'Open the Discord sign-in again';

  @override
  String get discordConnected => 'Discord is connected';

  @override
  String discordConnectedHelp(String name) {
    return 'Connected as $name. Message the Casama bot in Discord or use /ask anywhere; the chat also shows here in General.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Message the Casama bot in Discord or use /ask anywhere; the chat also shows here in General.';

  @override
  String get discordConnect => 'Connect Discord';

  @override
  String get discordDisconnect => 'Disconnect Discord';

  @override
  String get discordDisconnectConfirm => 'Disconnect Discord?';

  @override
  String get discordDisconnectHelp =>
      'Your bots stop answering in Discord. Your chat history stays here.';

  @override
  String get discordPickBot => 'Discord messages go to';

  @override
  String get discordNeedsBot => 'Make a bot first, then connect Discord.';

  @override
  String get discordNotOffered =>
      'This server has no Discord app of its own. You can connect your own Discord app from a bot\'s Chat apps.';

  @override
  String get inactiveAccountsNote =>
      'If you stop using Casama: after 30 days your routines and watchers pause until you\'re back. After 6 months your computers\' saved files are removed, and after 12 months (24 if you ever paid) your account is. We email you before anything is removed. Accounts on a paid plan are never affected.';

  @override
  String get adminInactivityTitle => 'Inactive accounts';

  @override
  String get adminInactivityRest => 'Rest after 30 days';

  @override
  String get adminInactivityRestHelp =>
      'Routines and watchers pause until someone is back';

  @override
  String get adminInactivityFiles => 'Remove computer files after 6 months';

  @override
  String get adminInactivityFilesHelp => 'Warned 14 and 3 days before';

  @override
  String get adminInactivityRemoval => 'Remove accounts after 12 months';

  @override
  String get adminInactivityRemovalHelp =>
      '24 months if they ever paid; warned 30 and 7 days before';

  @override
  String get adminInactivityUnconfirmed =>
      'Remove unconfirmed sign-ups after 30 days';

  @override
  String get adminInactivityUnconfirmedHelp =>
      'Never confirmed their email; no message is sent';

  @override
  String get inactivityModeOff => 'Off';

  @override
  String get inactivityModeReport => 'Report';

  @override
  String get inactivityModeOn => 'On';

  @override
  String adminInactivityWaiting(String date) {
    return 'Steps set to On only report until $date, 14 days after the announcement.';
  }

  @override
  String get adminInactivityNotAnnounced =>
      'Steps set to On only report until every account has been told. Announce the rule first; they can act 14 days later.';

  @override
  String adminInactivityAnnounced(String date) {
    return 'Announced $date';
  }

  @override
  String get adminInactivityAnnounce => 'Email everyone about the rule';

  @override
  String get adminInactivityAnnounceQuestion => 'Email every account?';

  @override
  String get adminInactivityAnnounceConfirm =>
      'Every account gets one email about the inactive-account rule. Steps set to On start acting 14 days later.';

  @override
  String adminInactivityAnnounceDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emails queued',
      one: '1 email queued',
    );
    return '$_temp0';
  }

  @override
  String adminInactivityLastRun(String when) {
    return 'Last run $when';
  }

  @override
  String adminInactivityReportLine(
    int resting,
    int files,
    String size,
    int warned,
    int removals,
    int unconfirmed,
  ) {
    return '$resting resting · $files computers\' files removed ($size) · $warned warned · $removals accounts scheduled for removal · $unconfirmed unconfirmed';
  }

  @override
  String adminInactivityNow(int resting, int pending) {
    return '$resting workspaces resting now · $pending accounts waiting to be removed';
  }

  @override
  String lastActive(String when) {
    return 'active $when';
  }

  @override
  String get inactivityStateResting => 'Resting';

  @override
  String get inactivityStateFilesSoon => 'Files removed soon';

  @override
  String get inactivityStateRemovalSoon => 'Removal soon';

  @override
  String get inactivityStateRemoving => 'Being removed';

  @override
  String get inactivityKept => 'Kept';

  @override
  String get keepAccount => 'Keep this account';

  @override
  String get keepAccountHelp => 'Never rested or removed for being unused';

  @override
  String get computerFilesRemoved => 'Saved files removed';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'This computer wasn\'t used for 6 months, so its saved files were removed on $date. It starts fresh.';
  }

  @override
  String get downloadSavedFiles => 'Download saved files';

  @override
  String get downloadSavedFilesHelp =>
      'A .tar.gz of its home folder, without waking it';

  @override
  String get liveActivity => 'Live activity';

  @override
  String get liveRowHelp => 'Waitlist, sign-ups and downloads as they happen';

  @override
  String get liveRefresh => 'Refresh';

  @override
  String get liveTabActivity => 'Activity';

  @override
  String get liveTabAlerts => 'Alerts';

  @override
  String get liveGroupAll => 'All';

  @override
  String get liveGroupWaitlist => 'Waitlist';

  @override
  String get liveGroupAccounts => 'Accounts';

  @override
  String get liveGroupMoney => 'Money';

  @override
  String get liveGroupWebsite => 'Website';

  @override
  String get liveGroupGrowth => 'Growth';

  @override
  String get liveGroupSupport => 'Support';

  @override
  String get liveKindWaitlistJoined => 'Joined the waitlist';

  @override
  String get liveKindWaitlistAdmitted => 'Let in from the waitlist';

  @override
  String get liveKindSignup => 'New account';

  @override
  String get liveKindSignupRefused => 'Sign-up turned away';

  @override
  String get liveKindFirstChat => 'First chat';

  @override
  String get liveKindMilestone => 'Other firsts (bot, computer, call, routine)';

  @override
  String get liveKindSubscription => 'New subscription';

  @override
  String get liveKindSubscriptionEnded => 'Subscription ended';

  @override
  String get liveKindPurchase => 'Credits bought';

  @override
  String get liveKindSupportTicket => 'Support ticket';

  @override
  String get liveKindFeedback => 'Feedback';

  @override
  String get liveKindAccountDeleted => 'Account deleted';

  @override
  String get liveKindDownloadClick => 'Download click';

  @override
  String get liveKindQrOpen => 'Download QR code opened';

  @override
  String get liveKindStartClick => 'Start free clicked';

  @override
  String get liveKindInviteOpen => 'Invite link opened';

  @override
  String get liveNow => 'now';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes min';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours h';
  }

  @override
  String get liveTestSent => 'Test alert sent to your devices';

  @override
  String get liveTodayWaitlist => 'Joined today';

  @override
  String get liveTodaySignups => 'Accounts today';

  @override
  String get liveTodayDownloads => 'Downloads today';

  @override
  String get liveTodayMoney => 'Money today';

  @override
  String get liveRetry => 'Try again';

  @override
  String get liveEmpty =>
      'Nothing yet. New activity shows up here within seconds.';

  @override
  String get liveOlder => 'Show older';

  @override
  String get liveAlertsHelp =>
      'Pick what pushes to your phones, Macs and browsers. When a lot happens at once, you get one summary instead of a push for each.';

  @override
  String get livePauseAll => 'Pause all alerts';

  @override
  String get livePauseAllHelp => 'Activity still shows here';

  @override
  String get liveSendTest => 'Send a test alert';

  @override
  String get liveSendTestHelp => 'Check that alerts reach this device';

  @override
  String get liveAlertsFooter =>
      'Alerts wait during your quiet hours (Settings → Notifications) and arrive as one summary after. In a browser, allow notifications for this site to get them there.';

  @override
  String get liveStatusOn => 'Live: updates every few seconds';

  @override
  String get liveStatusPaused => 'Live. Alerts are paused';

  @override
  String get liveGroupApp => 'App';

  @override
  String get liveKindAppFirstOpen => 'App opened for the first time';

  @override
  String get liveKindAppReinstall => 'App reinstalled';

  @override
  String get liveKindSigninStarted => 'Started signing in';

  @override
  String get liveKindTrialStarted => 'Trial started';

  @override
  String get liveKindRenewal => 'Subscription renewed';

  @override
  String get liveKindRefund => 'Refund';

  @override
  String get liveKindDisputeOpened => 'Dispute opened';

  @override
  String get liveKindPlanCancelFailed => 'Plan not cancelled';

  @override
  String get liveKindStoreReview => 'Store review';

  @override
  String get liveKindStoreCrashes => 'Store crash reports';

  @override
  String get liveKindDay2Return => 'Back on day 2';

  @override
  String get liveKindWeek1Return => 'Back in week 1';

  @override
  String get liveKindDeviceGone => 'App likely deleted';

  @override
  String get liveKindPartnerInterest => 'Creator interested in Partners';

  @override
  String get liveKindCreatorOpen => 'Creator link opened';

  @override
  String get liveKindPartnerClaimed => 'Creator code used';

  @override
  String get liveKindGiftOpen => 'Gift link opened';

  @override
  String get liveKindCompRedeemed => 'Gift plan redeemed';

  @override
  String get liveKindReferralRewarded => 'Invite paid off';

  @override
  String get liveKindNewsletterConfirmed => 'Newsletter sign-up';

  @override
  String get liveKindTestimonialSubmitted => 'Testimonial to review';

  @override
  String get liveDailyDigest => 'Morning summary';

  @override
  String get liveDailyDigestHelp =>
      'Yesterday\'s funnel and downloads, at 9 in your time zone';

  @override
  String get liveFunnelClicks => 'Clicks';

  @override
  String get liveFunnelOpens => 'First opens';

  @override
  String get liveFunnelSignups => 'Accounts';

  @override
  String get liveFunnelChats => 'First chats';

  @override
  String get liveFunnelPaying => 'Paid';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => 'By person';

  @override
  String get liveSearch => 'Search email, country, source';

  @override
  String get liveNoMatches => 'Nothing matches that search';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'likely';

  @override
  String get liveStepClick => 'Clicked download';

  @override
  String get liveStepOpen => 'Opened the app';

  @override
  String get liveStepSignup => 'Made an account';

  @override
  String get liveStepChat => 'First chat';

  @override
  String get liveStepPaying => 'Paying';

  @override
  String get liveJourneyTitle => 'What happened';

  @override
  String get liveJourneyVisitor => 'Visitor';

  @override
  String get liveJourneyWho => 'Who';

  @override
  String get liveJourneyFrom => 'Where from';

  @override
  String get liveJourneyDevice => 'Device';

  @override
  String get liveJourneyTimeline => 'Timeline';

  @override
  String get liveJourneyNow => 'Now';

  @override
  String get liveJourneySource => 'Source';

  @override
  String get liveJourneyCampaign => 'Campaign';

  @override
  String get liveJourneyLanding => 'First page';

  @override
  String get liveJourneyClickedFrom => 'Clicked on';

  @override
  String get liveJourneyPlatform => 'Platform';

  @override
  String get liveJourneyStore => 'From';

  @override
  String get liveJourneyVersion => 'Version';

  @override
  String get liveJourneyCountry => 'Country';

  @override
  String get liveJourneyLikelyHelp =>
      'Matched to a website click by device, country and time, not by a link. Treat it as a good guess.';

  @override
  String get liveJourneyPlan => 'Plan';

  @override
  String get liveJourneyMessages => 'Messages sent';

  @override
  String get liveJourneyBots => 'Bots';

  @override
  String get liveJourneyDevices => 'Signed in on';

  @override
  String get liveJourneyLastActive => 'Last active';

  @override
  String get liveJourneyJoined => 'Account made';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap later';
  }

  @override
  String get liveJourneyNone => 'Nothing more is known about this one yet.';

  @override
  String get liveJourneyCopyEmail => 'Copy email';

  @override
  String get liveJourneyCopied => 'Email copied';

  @override
  String get liveJourneyOpenAdmin => 'Open in Admin';

  @override
  String get liveJourneyGone =>
      'This one is older than 30 days, so its details are gone.';

  @override
  String get adminGrowth => 'Growth';

  @override
  String get adminAboutGrowth =>
      'Signups, who\'s active, first steps, coming back and money. Team accounts are left out.';

  @override
  String adminGrowthTeamLeftOut(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString team accounts left out',
      one: '1 team account left out',
      zero: 'No team accounts left out',
    );
    return '$_temp0';
  }

  @override
  String adminGrowthLastDays(int n) {
    return '$n days';
  }

  @override
  String get adminGrowthPeople => 'People';

  @override
  String get adminGrowthNew => 'New in range';

  @override
  String get adminGrowthActive1d => 'Active, 24 h';

  @override
  String get adminGrowthActive7d => 'Active, 7 days';

  @override
  String get adminGrowthActive30d => 'Active, 30 days';

  @override
  String get adminGrowthOpenedApp => 'Opened app, 7 days';

  @override
  String get adminGrowthPaid => 'Paying';

  @override
  String get adminGrowthMonthly => 'Monthly revenue';

  @override
  String get adminGrowthPeopleChart => 'Signups and active people';

  @override
  String get adminGrowthActiveHelp =>
      'Active means sending a bot a message that day. Automatic runs don\'t count.';

  @override
  String get adminGrowthSignups => 'Signups';

  @override
  String get adminGrowthActivePeople => 'Active people';

  @override
  String get adminGrowthRunsChart => 'Bot runs';

  @override
  String adminGrowthRunsSummary(String runs, String failed, String share) {
    return '$runs runs · $failed failed ($share)';
  }

  @override
  String get adminGrowthChat => 'Chat';

  @override
  String get adminGrowthRoutines => 'Routines';

  @override
  String get adminGrowthChannels => 'Channels';

  @override
  String get adminGrowthVoice => 'Voice';

  @override
  String get adminGrowthOther => 'Other';

  @override
  String get adminGrowthFirstSteps => 'First steps';

  @override
  String get adminGrowthFirstStepsHelp =>
      'Of the people who signed up in this range.';

  @override
  String get adminGrowthStepSignedUp => 'Signed up';

  @override
  String get adminGrowthStepMadeBot => 'Made a bot';

  @override
  String get adminGrowthStepSentMessage => 'Sent a message';

  @override
  String get adminGrowthStepFirstValue => 'Got a first useful result';

  @override
  String get adminGrowthStepCameBack => 'Came back another day';

  @override
  String get adminGrowthNoSignups => 'No signups in this range.';

  @override
  String get adminGrowthComingBack => 'Coming back';

  @override
  String get adminGrowthComingBackHelp =>
      'People grouped by the week they signed up. Each week after signup shows the share who sent a bot a message that week.';

  @override
  String get adminGrowthSignupWeek => 'Signed up';

  @override
  String adminGrowthWeekN(int n) {
    return 'Week $n';
  }

  @override
  String adminGrowthWeekCell(int active, int eligible) {
    final intl.NumberFormat activeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String activeString = activeNumberFormat.format(active);
    final intl.NumberFormat eligibleNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String eligibleString = eligibleNumberFormat.format(eligible);

    return '$activeString of $eligibleString';
  }

  @override
  String adminGrowthPeopleCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String get adminGrowthNoCohorts => 'No signups in the last 8 weeks.';

  @override
  String get adminGrowthMoney => 'Money';

  @override
  String get adminGrowthMoneyHelp =>
      'Monthly revenue is at list price, with weekly and yearly plans as a month. Test purchases and free plans are left out.';

  @override
  String get adminGrowthLifetime => 'Paid in, ever';

  @override
  String get adminGrowthNewPaid => 'New paying in range';

  @override
  String get adminGrowthComp => 'Free plans given';

  @override
  String get adminGrowthTest => 'Test purchases';

  @override
  String get adminGrowthNoPaid => 'No paying subscribers yet.';

  @override
  String adminGrowthPlanCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString subscribers',
      one: '1 subscriber',
    );
    return '$_temp0';
  }

  @override
  String get adminGrowthLifetimeKept => 'Kept, ever';

  @override
  String get adminGrowthRevenue => 'Revenue';

  @override
  String get adminGrowthRevenueHelp =>
      'Every real charge in the range: web and Mac checkout (Dodo), App Store and Google Play. Refunds are taken off and test purchases left out. Kept is after tax and the store\'s or Dodo\'s fee; some fees are estimates.';

  @override
  String get adminGrowthCharged => 'Charged';

  @override
  String get adminGrowthKept => 'Kept';

  @override
  String get adminGrowthRefunded => 'Refunded';

  @override
  String get adminGrowthCharges => 'Charges';

  @override
  String get adminGrowthSourceDodo => 'Web and Mac (Dodo)';

  @override
  String get adminGrowthSourceAppStore => 'App Store';

  @override
  String get adminGrowthSourceGooglePlay => 'Google Play';

  @override
  String adminGrowthChargeCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString charges',
      one: '1 charge',
    );
    return '$_temp0';
  }

  @override
  String adminGrowthUnpriced(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$nString charges have no known amount kept yet (not in dollars, or the store sent no fee).',
      one: '1 charge has no known amount kept yet (not in dollars, or the store sent no fee).',
    );
    return '$_temp0';
  }

  @override
  String get adminGrowthNoCharges => 'No charges in this range.';

  @override
  String get adminGrowthFailures => 'Why runs failed';

  @override
  String get adminGrowthNoFailures => 'No failed runs in this range.';

  @override
  String get adminGrowthReplySpeed => 'Reply speed';

  @override
  String get adminGrowthReplySpeedHelp =>
      'Time to the first word of a chat reply.';

  @override
  String get adminGrowthTypical => 'Typical';

  @override
  String get adminGrowthSlowest => 'Slowest 10%';

  @override
  String adminGrowthSeconds(String value) {
    return '$value s';
  }

  @override
  String get adminGrowthNoData => 'Nothing yet in this range.';

  @override
  String get adminGrowthWhereFrom => 'Where signups come from';

  @override
  String get adminGrowthWhereFromHelp =>
      'First-touch platform and acquisition source recorded once when someone signs in.';

  @override
  String get adminGrowthByPlatform => 'By platform';

  @override
  String get adminGrowthBySource => 'By source';

  @override
  String adminGrowthChartSemantics(int days, String series) {
    return 'Chart of $series over $days days';
  }

  @override
  String get adminUsersTeam => 'Team';

  @override
  String get adminUsersCountAsTeam => 'Count as team';

  @override
  String get adminUsersCountAsCustomer => 'Count as a customer';

  @override
  String adminUsersTeamDone(String email) {
    return '$email is left out of Growth';
  }

  @override
  String adminUsersCustomerDone(String email) {
    return '$email counts in Growth again';
  }

  @override
  String get adminLiveTitle => 'Live';

  @override
  String get adminLiveAutoRefresh => 'Refreshes every 30 s';

  @override
  String get adminLiveRefresh => 'Refresh live counts';

  @override
  String get adminLiveOnlineNow => 'Online now';

  @override
  String adminLiveWindow(int seconds) {
    return 'Last $seconds s';
  }

  @override
  String get adminLiveGa4Title => 'Last 30 min';

  @override
  String get adminLiveGa4Badge => 'Google Analytics';

  @override
  String adminLiveGa4Last5m(String n) {
    return '$n in last 5 min';
  }

  @override
  String get adminLiveGa4Unconfigured =>
      'Google Analytics isn\'t set up on this server.';

  @override
  String get adminLiveGa4Error => 'Couldn\'t reach Google Analytics';

  @override
  String adminLiveInChatAndBrowsing(String inChat, String browsing) {
    return '$inChat in a chat · $browsing in app';
  }

  @override
  String adminLiveInChatOnly(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString in a chat',
      one: '1 in a chat',
    );
    return '$_temp0';
  }

  @override
  String adminLiveBrowsingOnly(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString in the app',
      one: '1 in the app',
    );
    return '$_temp0';
  }

  @override
  String get adminLiveNobodyOnline => 'No customers online right now';

  @override
  String adminLiveTeamOnline(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString team accounts online (left out)',
      one: '1 team account online (left out)',
    );
    return '$_temp0';
  }

  @override
  String get adminLiveSparklineTitle => 'Active users per minute · last 30 min';

  @override
  String adminLiveSparklinePeak(String n) {
    return 'Peak $n';
  }

  @override
  String get adminLiveSparkline30m => '30m ago';

  @override
  String get adminLiveSparkline15m => '15m';

  @override
  String get adminLiveSparklineNow => 'Now';

  @override
  String adminLiveSparklineTip(String users, String when) {
    return '$users active · $when';
  }

  @override
  String adminLiveSparklineMinAgo(int m) {
    return '${m}m ago';
  }

  @override
  String get adminLiveSparklineJustNow => 'This minute';

  @override
  String get adminLiveWhosOnline => 'Who\'s online';

  @override
  String get adminLiveIncludeTeam => 'Include team';

  @override
  String adminLiveShowingFirst(int shown, int total) {
    return 'Showing $shown of $total';
  }

  @override
  String get adminLiveStatusInChat => 'In chat';

  @override
  String get adminLiveStatusInApp => 'In app';

  @override
  String adminLiveOnlineFor(String duration) {
    return 'Online $duration';
  }

  @override
  String adminLiveSeenAgo(String duration) {
    return 'Seen $duration ago';
  }

  @override
  String get adminLiveJustNow => 'just now';

  @override
  String get adminLiveUnavailable => 'Couldn\'t load live status.';

  @override
  String get planChangeTitle => 'Confirm plan change';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Switch to $plan';
  }

  @override
  String get planChangeChargedNow => 'Charged now';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Includes $tax tax';
  }

  @override
  String get planChangeCredit => 'Credit for unused time';

  @override
  String planChangeThen(String amount, String period) {
    return 'Then $amount / $period (before tax)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Next billing on $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Confirm and pay';

  @override
  String get planChangeHaveCode => 'Have a code?';

  @override
  String get planChangeCodeLabel => 'Discount code';

  @override
  String get planChangeCodeHint => 'Enter code';

  @override
  String get planChangeApply => 'Apply';

  @override
  String get planChangeRemove => 'Remove';

  @override
  String get planChangeDiscountApplied => 'Discount applied';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '$percent% off, every renewal';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$percent% off, for $count renewals',
      one: '$percent% off, for 1 renewal',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '$amount off, every renewal';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$amount off, for $count renewals',
      one: '$amount off, for 1 renewal',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '$percent% off each renewal; ends if you change plans again';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '$amount off each renewal; ends if you change plans again';
  }

  @override
  String get planChangeInvalidCode => 'That code can\'t be used on this plan.';

  @override
  String get planChangeCodeCostsMore =>
      'This code would replace your current discount and cost more.';

  @override
  String get planChangeCodeEndsLasting =>
      'This code would end your current lasting discount.';

  @override
  String get planChangeCodeNotBetter =>
      'You already have an equal or better discount.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Replaces your current $percent% discount';
  }

  @override
  String get planChangeReplacesDiscount => 'Replaces your current discount';

  @override
  String get planChangePriceMoved =>
      'The total changed since you opened this. Review the updated amount and confirm again.';

  @override
  String get planChangePeriodWeek => 'week';

  @override
  String get planChangePeriodMonth => 'month';

  @override
  String get planChangePeriodYear => 'year';

  @override
  String get adminPartners => 'Partners';

  @override
  String get adminAboutPartners =>
      'Creators who bring paying customers, their codes and commissions.';

  @override
  String adminPartnersSummary(String rate, int days) {
    return '$rate of what we keep, held $days days before it can be paid.';
  }

  @override
  String get adminPartnersOff => 'Casama Partners is off on this server.';

  @override
  String get adminPartnersOpenTolt => 'Open Tolt';

  @override
  String get adminPartnersSyncNow => 'Sync Now';

  @override
  String adminPartnersSynced(int partners, int pushed, int paid) {
    return 'Synced: $partners partners read, $pushed sales sent, $paid payouts read.';
  }

  @override
  String get adminPartnersAdd => 'Add Partner';

  @override
  String get adminPartnersComPending => 'Pending';

  @override
  String get adminPartnersComPayable => 'Payable';

  @override
  String get adminPartnersComPaid => 'Paid';

  @override
  String get adminPartnersComHeld => 'Held for review';

  @override
  String get adminPartnersComVoid => 'Void';

  @override
  String get adminPartnersUnread => 'Charges we couldn\'t read';

  @override
  String get adminPartnersSyncFailed => 'Sync failures';

  @override
  String get adminPartnersList => 'Partners';

  @override
  String get adminPartnersNone =>
      'No partners yet. Approve applications on Tolt or add one here.';

  @override
  String get adminPartnersCommissions => 'Commissions';

  @override
  String get adminPartnersNoCommissions => 'No commissions yet.';

  @override
  String get adminPartnersNoCodes => 'No codes';

  @override
  String adminPartnersMoney(String pending, String payable, String paid) {
    return '$pending pending · $payable payable · $paid paid';
  }

  @override
  String adminPartnersReferredPaying(int referred, int paying) {
    return '$referred referred, $paying paying';
  }

  @override
  String get adminPartnersColPartner => 'Partner';

  @override
  String get adminPartnersColStatus => 'Status';

  @override
  String get adminPartnersColReferred => 'Referred';

  @override
  String get adminPartnersColPaying => 'Paying';

  @override
  String get adminPartnersColOwed => 'Owed';

  @override
  String get adminPartnersColAmount => 'Amount';

  @override
  String get adminPartnersColBase => 'Of';

  @override
  String adminPartnersCommissionOf(String rate, String base) {
    return '$rate of $base';
  }

  @override
  String get adminPartnersStatusApplied => 'Applied';

  @override
  String get adminPartnersStatusActive => 'Active';

  @override
  String get adminPartnersStatusPaused => 'Paused';

  @override
  String get adminPartnersStatusBanned => 'Banned';

  @override
  String get adminPartnersStatusLeft => 'Left';

  @override
  String get adminPartnersCodeRetired => 'Retired';

  @override
  String get adminPartnersHold => 'Hold';

  @override
  String get adminPartnersRelease => 'Release';

  @override
  String get adminPartnersVoid => 'Void';

  @override
  String get adminPartnersNote => 'Note (optional)';

  @override
  String get adminPartnersSaved => 'Saved';

  @override
  String get adminPartnersSave => 'Save';

  @override
  String get adminPartnersApprove => 'Approve';

  @override
  String get adminPartnersResume => 'Resume';

  @override
  String get adminPartnersPause => 'Pause';

  @override
  String get adminPartnersBan => 'Ban';

  @override
  String adminPartnersBanTitle(String name) {
    return 'Ban $name?';
  }

  @override
  String get adminPartnersBanBody =>
      'Their codes stop working and unpaid commissions stop. Use this for fraud or broken rules.';

  @override
  String get adminPartnersRate => 'Commission Rate';

  @override
  String get adminPartnersRatePercent => 'Percent';

  @override
  String adminPartnersRateHelp(String rate) {
    return 'Leave it to use the program\'s rate ($rate).';
  }

  @override
  String adminPartnersRateDefault(String rate) {
    return 'Program rate ($rate)';
  }

  @override
  String get adminPartnersRateInvalid => 'Enter a percent between 1 and 100.';

  @override
  String get adminPartnersLinkAccount => 'Casama Account';

  @override
  String get adminPartnersLinkAccountHelp =>
      'The partner\'s own Casama account: it gets Pro while they\'re active, and their own payments never count.';

  @override
  String get adminPartnersAccountEmail => 'Account email';

  @override
  String get adminPartnersLink => 'Link';

  @override
  String get adminPartnersNoAccount => 'Not linked';

  @override
  String get adminPartnersAccountLinked => 'Linked';

  @override
  String get adminPartnersNotes => 'Notes';

  @override
  String get adminPartnersNoNotes => 'None';

  @override
  String get adminPartnersSettings => 'Settings';

  @override
  String get adminPartnersCodes => 'Codes';

  @override
  String get adminPartnersAddCode => 'Add Code';

  @override
  String get adminPartnersAddCodeHelp =>
      '3 to 20 letters and digits. Make the matching store codes first, with the same string where you can.';

  @override
  String adminPartnersCodeAdded(String code) {
    return '$code added';
  }

  @override
  String get adminPartnersCode => 'Code';

  @override
  String get adminPartnersDodoCode => 'Dodo discount code (optional)';

  @override
  String get adminPartnersAppleCode => 'Apple offer code (optional)';

  @override
  String get adminPartnersPlayCode => 'Google Play promo code (optional)';

  @override
  String get adminPartnersWaitlistUses => 'Waitlist passes (optional)';

  @override
  String get adminPartnersWaitlistPass => 'Skips the waitlist';

  @override
  String get adminPartnersRetire => 'Retire';

  @override
  String adminPartnersRetireTitle(String code) {
    return 'Retire $code?';
  }

  @override
  String get adminPartnersRetireBody =>
      'Nobody new can use it. Customers who already came with it still count.';

  @override
  String get adminPartnersEmail => 'Email';

  @override
  String get adminPartnersCountry => 'Country';

  @override
  String get adminPartnersName => 'Name';

  @override
  String get adminPartnersEmailOptional => 'Email (optional)';

  @override
  String get adminPartnersChannelOptional => 'Channel link (optional)';

  @override
  String get adminPartnersNotFound => 'This partner isn\'t there anymore.';

  @override
  String get partnerSection => 'Casama Partners';

  @override
  String get partnerProgramTitle => 'Make Videos, Posts or a Newsletter?';

  @override
  String get partnerProgramSubtitle =>
      'Earn 30% of what the people you send pay, for a year';

  @override
  String get partnerYourCode => 'Your Creator Code';

  @override
  String get partnerPaused => 'Paused';

  @override
  String get partnerPortal => 'Earnings and Payouts';

  @override
  String partnerShareText(String link, String code) {
    return 'Try Casama, AI teammates that work for you. Use my code $code when you sign up: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name sent you to Casama.';
  }

  @override
  String get partnerClaimed => 'Creator code added. Welcome to Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Thanks for supporting $name. Welcome to Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'That creator code doesn\'t exist. Check it and try again.';

  @override
  String get partnerErrOwnCode =>
      'That\'s your own code. Share it with your audience instead.';

  @override
  String get partnerErrWindowClosed =>
      'Creator codes can only be entered in the first days after signing up.';

  @override
  String get partnerErrAlreadyPaying =>
      'Creator codes are for new accounts, before the first payment.';

  @override
  String get partnerErrAlready => 'You\'ve already entered a creator\'s code.';

  @override
  String get partnerErrReferred =>
      'You joined with a friend\'s invite, so a creator code can\'t be added.';

  @override
  String get partnerErrOff => 'Creator codes aren\'t available on this server.';

  @override
  String get referralHaveCodeAny => 'Got a Code?';

  @override
  String get referralCodeHintAny => 'Friend\'s or creator\'s code';

  @override
  String get adminTestimonials => 'Testimonials';

  @override
  String get adminAboutTestimonials =>
      'Quotes from real people, with their consent, for casama.ai and the app.';

  @override
  String adminTestimonialsSummary(int live, int drafts) {
    return '$live live · $drafts waiting to read';
  }

  @override
  String get adminTestimonialsAdd => 'Add Quote';

  @override
  String get adminTestimonialsEmpty =>
      'No quotes yet. Add one when someone says yes to being quoted.';

  @override
  String get adminTestimonialsNoMatch => 'No quotes in this list.';

  @override
  String adminTestimonialsWhereNote(int home, int other) {
    return 'A quote shows only where you pick and only once it\'s live. casama.ai shows a section once it has at least $home live quotes on the home page or $other on pricing, after its next deploy. The app shows them within an hour once there are at least $other.';
  }

  @override
  String get adminTestimonialNoConsent => 'No consent yet';

  @override
  String get adminTestimonialPlaceholder => 'Placeholder';

  @override
  String get adminTestimonialMoveUp => 'Move up';

  @override
  String get adminTestimonialMoveDown => 'Move down';

  @override
  String get adminTestimonialEdit => 'Edit Quote';

  @override
  String get adminTestimonialQuote => 'Their words';

  @override
  String get adminTestimonialQuoteHelp =>
      'Exactly as they wrote it. Fix typos or shorten it only with their OK.';

  @override
  String get adminTestimonialName => 'Name shown';

  @override
  String get adminTestimonialRole => 'Role shown (optional)';

  @override
  String get adminTestimonialSource => 'Where it came from';

  @override
  String get adminTestimonialSourceUrl =>
      'Link to the original (optional, https://)';

  @override
  String get adminTestimonialConsent => 'What they agreed to, word for word';

  @override
  String get adminTestimonialConsentHelp =>
      'Paste their yes. A quote can\'t go live without it.';

  @override
  String get adminTestimonialAccount => 'Their Casama account email (optional)';

  @override
  String get adminTestimonialAccountHelp =>
      'Deleting that account withdraws the quote.';

  @override
  String get adminTestimonialRating => 'Stars (optional)';

  @override
  String get adminTestimonialNoRating => 'None';

  @override
  String get adminTestimonialIncentive => 'Label (optional)';

  @override
  String get adminTestimonialIncentiveHelp =>
      'Required when they got something for it, for example \"Received a discount\".';

  @override
  String get adminTestimonialPlaces => 'Where it shows';

  @override
  String get adminTestimonialState => 'State';

  @override
  String get adminTestimonialNotes => 'Notes (only owners see these)';

  @override
  String get adminTestimonialDelete => 'Delete';

  @override
  String get adminTestimonialDeleteTitle => 'Delete this quote for good?';

  @override
  String get adminTestimonialDeleteMessage =>
      'To take it down and keep the consent record, set it to Withdrawn instead.';

  @override
  String get testimonialStateLive => 'Live';

  @override
  String get testimonialStateDraft => 'Draft';

  @override
  String get testimonialStateHidden => 'Hidden';

  @override
  String get testimonialStateWithdrawn => 'Withdrawn';

  @override
  String get testimonialPlaceSiteHome => 'casama.ai home';

  @override
  String get testimonialPlaceSitePricing => 'casama.ai pricing';

  @override
  String get testimonialPlaceAppPaywall => 'App plans';

  @override
  String get testimonialPlaceAppSignin => 'App sign-in';

  @override
  String get testimonialSourceEmail => 'Email';

  @override
  String get testimonialSourceInApp => 'In the app';

  @override
  String get testimonialSourceOther => 'Other';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stars',
      one: '1 star',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'What people say about Casama';

  @override
  String get testimonialAskTitle => 'Enjoying Casama?';

  @override
  String get testimonialAskSubtitle => 'Tell us in a sentence.';

  @override
  String get testimonialAskHint => 'What do you like about it?';

  @override
  String testimonialAskConsent(String name) {
    return 'You can quote this on casama.ai and in the app as $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'You can quote this on casama.ai and in the app as a Casama user';

  @override
  String get testimonialAskSend => 'Send';

  @override
  String get testimonialAskNotNow => 'Not Now';

  @override
  String get testimonialAskThanks => 'Thank you! We read every one.';

  @override
  String get communityTitle => 'Community';

  @override
  String get communitySentence =>
      'Casama is open source. If it\'s useful to you, a star on GitHub helps other people find it.';

  @override
  String get communityStarOnGitHub => 'Star on GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Chat with the team and other people who use Casama';

  @override
  String get starAskTitle => 'Casama on GitHub';

  @override
  String get starAskNotNow => 'Not now';

  @override
  String get cloudSignInTitle => 'Sign in with your Casama account';

  @override
  String get cloudSignInBody =>
      'The free personal license comes from your Casama account. Only the license goes to this server; your chats stay on it.';

  @override
  String get cloudSignInEmail => 'Email';

  @override
  String get cloudSignInSendCode => 'Send Code';

  @override
  String get cloudSignInCode => 'Code from the email';

  @override
  String get cloudSignInVerify => 'Sign In';

  @override
  String cloudSignInCodeSent(String email) {
    return 'We sent a code to $email. Enter it here.';
  }

  @override
  String get licenseSetupTitle => 'Get your free personal license';

  @override
  String get licenseSetupBody =>
      'This server needs a license before bots can run. Personal use is free for one person: sign in with your Casama account and the license renews itself online every 30 days.';

  @override
  String get licensePersonalButton => 'Get Free Personal License';

  @override
  String get licensePersonalNote =>
      'Personal: one person, for personal use, on your own computer or server.';

  @override
  String get licenseBusinessTitle => 'Or enter a business key';

  @override
  String get licenseBusinessHint => 'Paste your license key';

  @override
  String get licenseBusinessSave => 'Use This Key';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Using Casama at work or with a team? Business is $monthlyPrice per active user a month ($yearlyMonthlyPrice billed yearly). Write to $email.';
  }

  @override
  String get licenseActivated => 'License active. Your bots can run.';

  @override
  String get licenseOtherServer => 'Use Another Server';

  @override
  String get licenseRenew => 'Renew';

  @override
  String get licenseRenewTitle => 'Renew this server\'s license';

  @override
  String licenseGraceBanner(String date) {
    return 'This server\'s license has run out. Bots keep running until $date; renew before then.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'This server\'s license has run out. Renew it soon to keep bots running.';

  @override
  String get licenseExpiredBanner =>
      'This server\'s license has expired, so new bot runs are paused. Your data is safe: you can still sign in, read and export. Renew to start bots again.';

  @override
  String get licenseErrorRequired =>
      'This server needs a license first. Get the free personal license or enter a business key.';

  @override
  String licenseErrorSeats(String email) {
    return 'Every seat on this server\'s license is taken. More people need a Business license: write to $email.';
  }

  @override
  String get licenseErrorExpired =>
      'This server\'s license has expired, so new bot runs are paused. Your data is safe. Renew the license to start bots again.';

  @override
  String get licenseEditionPersonal => 'Personal';

  @override
  String get licenseEditionTrial => 'Trial';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Audit export';

  @override
  String get licenseFeatureAuditForwarding => 'Audit forwarding';

  @override
  String get licenseFeatureRoles => 'Advanced roles';

  @override
  String get setupLicenseTitle => 'Free personal license';

  @override
  String get setupLicenseBody =>
      'Sign in with your Casama account to get the free personal license for this server: one person, personal use. You can also do it later.';

  @override
  String get setupLicenseSignIn => 'Sign In with Casama';

  @override
  String get setupLicenseReady =>
      'The free personal license comes with your server.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Signed in as $email. The free personal license comes with your server.';
  }

  @override
  String get setupLicenseSkipped =>
      'No license yet. Your server asks for one when it starts.';

  @override
  String setupLicenseFailed(String error) {
    return 'The personal license couldn\'t be made ($error). Your server asks for one when it starts.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Casama\'s server runs inside Docker Desktop, a free app that uses WSL 2 to keep it separate from the rest of your PC.';

  @override
  String get setupDockerStep1Windows =>
      'Run the installer that downloads and keep \"Use WSL 2\" on.';

  @override
  String localUpdateAvailable(String version) {
    return 'A server update is ready: $version';
  }

  @override
  String get localUpdateButton => 'Update';

  @override
  String get localUpdateLater => 'Later';

  @override
  String localUpdateTitle(String version) {
    return 'Update your server to $version';
  }

  @override
  String get localUpdateBody =>
      'The database is backed up first. If the new version doesn\'t start, your server goes back to the version it has now.';

  @override
  String localUpdateDone(String version) {
    return 'Updated to $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'The new version didn\'t start, so your server went back to the version it had. Nothing was lost, and a database backup was saved.';

  @override
  String localUpdateFailed(String detail) {
    return 'The update failed: $detail';
  }

  @override
  String get adminSelfhost => 'Self-host Licenses';

  @override
  String get adminAboutSelfhost =>
      'Licenses for self-hosted servers, their daily check-ins, and business keys.';

  @override
  String get adminSelfhostSearch => 'Search by email or customer';

  @override
  String get adminSelfhostNone => 'No licenses yet.';

  @override
  String get adminSelfhostCreate => 'New Business Key';

  @override
  String get adminSelfhostCreateHelp =>
      'The key is shown once here and emailed to the address below.';

  @override
  String get adminSelfhostCustomer => 'Customer';

  @override
  String get adminSelfhostEmail => 'Email';

  @override
  String get adminSelfhostSeats => 'Seats';

  @override
  String get adminSelfhostExpires => 'Expires';

  @override
  String get adminSelfhostFeatures => 'Features';

  @override
  String get adminSelfhostOfflineKey => 'Offline key';

  @override
  String get adminSelfhostOfflineHelp =>
      'Never renews and isn\'t tied to one server. For annual contracts.';

  @override
  String get adminSelfhostCreated => 'Business key created';

  @override
  String get adminSelfhostCreatedOnce =>
      'Copy it now: it isn\'t shown again (it was also emailed).';

  @override
  String get adminSelfhostRevoke => 'Revoke';

  @override
  String adminSelfhostRevokeQuestion(String who) {
    return 'Revoke the license for $who?';
  }

  @override
  String get adminSelfhostRevokeHelp =>
      'Its server stops at its next daily check-in: new bot runs pause, and its data stays.';

  @override
  String get adminSelfhostRevokedDone => 'License revoked.';

  @override
  String get adminSelfhostRevoked => 'Revoked';

  @override
  String get adminSelfhostOffline => 'Offline';

  @override
  String get adminSelfhostNever => 'Never';

  @override
  String get adminSelfhostNeverCheckedIn => 'never checked in';

  @override
  String adminSelfhostCheckedIn(String when) {
    return 'checked in $when';
  }

  @override
  String adminSelfhostInstance(String id) {
    return 'server $id';
  }

  @override
  String adminSelfhostCounts(int members, int bots) {
    final intl.NumberFormat membersNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String membersString = membersNumberFormat.format(members);
    final intl.NumberFormat botsNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String botsString = botsNumberFormat.format(bots);

    return '$membersString members, $botsString bots';
  }

  @override
  String get adminSelfhostAccount => 'Account or customer';

  @override
  String get adminSelfhostEditionColumn => 'Edition';

  @override
  String get adminSelfhostVersion => 'Engine version';

  @override
  String get adminSelfhostCheckin => 'Last check-in';

  @override
  String get adminSelfhostMembers => 'Members';

  @override
  String get adminSelfhostBots => 'Bots';

  @override
  String get adminGrowthSelfhost => 'Self-host';

  @override
  String get adminGrowthSelfhostActive => 'Active servers (24 h)';

  @override
  String get adminGrowthSelfhostNew => 'New installs (30 days)';

  @override
  String get adminGrowthSelfhostLapsed => 'Lapsed';

  @override
  String get adminGrowthSelfhostDaily => 'Active servers per day';

  @override
  String get adminGrowthSelfhostDailyHelp =>
      'Servers that made their daily license check-in each day (UTC), and new licenses.';

  @override
  String get adminGrowthSelfhostServers => 'Active servers';

  @override
  String get adminGrowthSelfhostNewInstalls => 'New installs';

  @override
  String get adminGrowthSelfhostByEdition => 'By edition';

  @override
  String adminGrowthSelfhostActiveOf(int active, int total) {
    final intl.NumberFormat activeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String activeString = activeNumberFormat.format(active);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '$activeString active of $totalString';
  }

  @override
  String get adminGrowthSelfhostByVersion =>
      'By engine version (active servers)';

  @override
  String adminGrowthSelfhostServersCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString servers',
      one: '1 server',
    );
    return '$_temp0';
  }

  @override
  String get shCloudTitle => 'Casama Cloud';

  @override
  String get shCloudScreenTitle => 'Casama Cloud models';

  @override
  String get shCloudPitch =>
      'Casama\'s models, no keys to manage. Paid by a Casama Cloud plan.';

  @override
  String get shCloudTurnOn => 'Turn On';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'On · paid by $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, paid by $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Not on. Only an admin of this server can turn it on.';

  @override
  String get shCloudManage => 'Manage';

  @override
  String get shCloudSignInBody =>
      'Sign in with your Casama account to choose who pays for Casama Cloud models. Your bots, chats and memory stay on this server.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Signed in to Casama Cloud as $email';
  }

  @override
  String get shCloudOtherAccount => 'Use Another Account';

  @override
  String get shCloudContinue => 'Continue';

  @override
  String get shCloudPayerTitle => 'Who pays?';

  @override
  String get shCloudPayerBody =>
      'Casama Cloud models are paid by a Casama Cloud workspace you own or run. Its plan, included usage and daily limit are shared with everything else it uses.';

  @override
  String get shCloudPayerNone =>
      'You don\'t run a Casama Cloud workspace yet. Make one to pay from; it starts empty.';

  @override
  String get shCloudCreateWorkspace => 'Create One';

  @override
  String shCloudWorkspaceNamed(String name) {
    return '$name\'s workspace';
  }

  @override
  String get shCloudNoPlan => 'No plan yet';

  @override
  String shCloudCovered(String plan) {
    return 'Your $plan plan covers this.';
  }

  @override
  String get shCloudPlanTitle => 'Choose a plan';

  @override
  String get shCloudPlanBody =>
      'Casama Cloud models come with any Casama Cloud plan: the same included usage, daily limit and top-ups as on Cloud. No separate price for self-hosting.';

  @override
  String get shCloudTryFirst => 'Try It First';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Free usage to try: about $amount of messages, once per Casama account. Nothing to buy.';
  }

  @override
  String get shCloudTrialUsed =>
      'The free usage to try is used up on this Casama account. Choose a plan to carry on.';

  @override
  String get shCloudIntervalWeek => 'Weekly';

  @override
  String get shCloudIntervalMonth => 'Monthly';

  @override
  String get shCloudIntervalYear => 'Yearly';

  @override
  String get shCloudWaitingForPlan =>
      'Finish paying in your browser. This screen carries on by itself when the plan arrives.';

  @override
  String get shCloudWaitingTimedOut =>
      'The plan hasn\'t arrived yet. A payment can take a few minutes to show.';

  @override
  String get shCloudCheckAgain => 'Check Again';

  @override
  String get shCloudGiftCode => 'Have a gift code?';

  @override
  String get shCloudGiftCodeLabel => 'Gift code';

  @override
  String get shCloudRedeem => 'Redeem';

  @override
  String get shCloudNoWayToBuy =>
      'Plans can\'t be bought in this app. Buy one on casama.ai with the same account, then check again here.';

  @override
  String get shCloudPurchasePending =>
      'Your purchase is waiting for approval. This carries on when it goes through.';

  @override
  String get shCloudPurchaseFailed =>
      'The purchase didn\'t go through. Nothing was charged.';

  @override
  String get shCloudConnecting => 'Connecting this server to Casama Cloud…';

  @override
  String get shCloudLoading => 'Loading…';

  @override
  String get shCloudReviewTitle => 'Check before turning on';

  @override
  String get shCloudReviewPays => 'Who pays';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan on $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Free usage to try on $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Which bots switch';

  @override
  String get shCloudReviewAll => 'All bots';

  @override
  String get shCloudReviewNoKey => 'Only bots without a working key';

  @override
  String get shCloudReviewPick => 'Pick bots';

  @override
  String get shCloudReviewNoBots =>
      'This server has no bots yet. New bots can use Casama Cloud.';

  @override
  String get shCloudReviewDefault => 'New bots use Casama Cloud too';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Casama Cloud\'s model';

  @override
  String get shCloudNoKeyYet => 'No working key';

  @override
  String shCloudStepDown(String from) {
    return 'Replies may be shorter or less careful than with $from. Try one bot first.';
  }

  @override
  String get shCloudReviewJobs => 'Memory, images and voice';

  @override
  String get shCloudJobMemory => 'Memory search';

  @override
  String get shCloudJobImages => 'Images';

  @override
  String get shCloudJobTts => 'Read aloud';

  @override
  String get shCloudJobStt => 'Dictation';

  @override
  String get shCloudJobOwnKey => 'Your own key';

  @override
  String get shCloudJobMemoryOptIn => 'Use Casama Cloud for memory too';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'Memory is re-indexed in the background; search keeps working meanwhile.';

  @override
  String get shCloudJobLiveNote =>
      'Live voice, phone calls and video keep using your own keys.';

  @override
  String get shCloudWhatGoes => 'What goes to Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'Messages to the model pass through Casama Cloud and aren\'t stored. Usage (model, tokens, cost) shows on your Cloud bill. Bots, chats, memory, files and computers stay on this server.';

  @override
  String get shCloudWhatGoesLink => 'What this server sends';

  @override
  String get shCloudFallback =>
      'If Casama Cloud runs out or can\'t be reached, use my own key';

  @override
  String get shCloudFallbackHelp => 'Every answer from your own key says so.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString people use this server and the $plan plan covers $seatsString. Each extra person is billed at Casama Cloud\'s extra-person price.';
  }

  @override
  String get shCloudApply => 'Turn On Casama Cloud';

  @override
  String get shCloudPickOne => 'Pick at least one bot, or let new bots use it.';

  @override
  String get shCloudPolicyTitle => 'Who may use it';

  @override
  String get shCloudPolicyEveryone => 'Everyone on this server';

  @override
  String get shCloudPolicyChosen => 'Only chosen people';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString people chosen',
      one: '1 person chosen',
      zero: 'Nobody chosen yet',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Daily limit per person';

  @override
  String get shCloudNoLimit => 'No limit';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount a day';
  }

  @override
  String get shCloudPolicySaved => 'Saved';

  @override
  String get shCloudDoneTitle => 'Casama Cloud is on';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots now use Casama Cloud.',
      one: '1 bot now uses Casama Cloud.',
      zero: 'New bots use Casama Cloud.',
    );
    return '$_temp0 Usage shows on this server\'s Usage screen and on your Cloud bill.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Say Hi to $bot';
  }

  @override
  String get shCloudDone => 'Done';

  @override
  String get shCloudUsageTitle => 'Usage';

  @override
  String shCloudIncludedLeft(String amount) {
    return '$amount of included usage left this month';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Today: $spend of $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Today: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount in credits';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return '$amount of free usage to try left';
  }

  @override
  String get shCloudPriceNote =>
      'At the price Casama Cloud charges. The same calls show on your Cloud bill under this server\'s name.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'You today: $spend of $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud has used 80% of this month\'s included usage.';

  @override
  String get shCloudWarnDaily => 'Casama Cloud has used 80% of today\'s limit.';

  @override
  String get shCloudTopUp => 'Top Up';

  @override
  String get shCloudUseOwnKey => 'Use My Own Key';

  @override
  String get shCloudStopOutOfCredits =>
      'Casama Cloud is out of usage for this month.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'Today\'s Casama Cloud limit is used up. It resets at $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'Today\'s Casama Cloud limit is used up. It resets tomorrow.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud needs a plan on $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'The Casama Cloud plan on $workspace ended.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'The plan on $workspace doesn\'t cover everyone using Casama Cloud here.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'You\'ve reached today\'s Casama Cloud limit on this server.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Your admin hasn\'t turned on Casama Cloud for you.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud was disconnected from this server.';

  @override
  String get shCloudStopUnreachable =>
      'Casama Cloud can\'t be reached right now. Trying again.';

  @override
  String get shCloudSeePlans => 'See Plans';

  @override
  String get shCloudRenew => 'Renew';

  @override
  String get shCloudAskAdmin => 'Ask an Admin';

  @override
  String get shCloudAskAdminBody =>
      'Only an admin of this server can change Casama Cloud. Ask one of them; bots and routines carry on by themselves once it\'s fixed.';

  @override
  String get shCloudReconnect => 'Reconnect';

  @override
  String get shCloudFallbackActive =>
      'Your own key is answering meanwhile, and each answer says so.';

  @override
  String get shCloudUseOwnKeyTitle => 'Use your own key meanwhile?';

  @override
  String get shCloudUseOwnKeyBody =>
      'While Casama Cloud can\'t answer, bots answer with your own key, and each such answer says so. Turn it off any time on this screen.';

  @override
  String get shCloudAddKeyFirst =>
      'Add a key of your own on the Models screen first.';

  @override
  String get shCloudRoutinesWait =>
      'Routines wait and carry on by themselves when it\'s fixed.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Memory is catching up: $doneString of $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'Search uses words for memories not re-indexed yet.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Messages to the model now pass through Casama Cloud, paid by $workspace.';
  }

  @override
  String get shCloudGotIt => 'Got It';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Paid by $workspace';
  }

  @override
  String get shCloudPaidBy => 'Paid by';

  @override
  String get shCloudChangePayer => 'Change';

  @override
  String get shCloudChangeBots => 'Change Bots';

  @override
  String get shCloudFallbackSection => 'When Casama Cloud can\'t answer';

  @override
  String get shCloudTurnOff => 'Turn Off';

  @override
  String get shCloudOffTitle => 'Turn off Casama Cloud?';

  @override
  String get shCloudOffBody =>
      'These bots go back to their previous key when it still works, else the workspace\'s default key. Nothing else changes, and you can turn it on again any time.';

  @override
  String get shCloudOffBotsNone => 'No bots use Casama Cloud right now.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud is off';

  @override
  String shCloudOffBackTo(String key) {
    return 'Back to $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Needs a key';

  @override
  String get shCloudAddKey => 'Add a Key';

  @override
  String get shCloudSignInAgain =>
      'Your Casama Cloud sign-in ended. Sign in again to carry on.';

  @override
  String get cloudAccountSection => 'Casama Cloud account';

  @override
  String cloudAccountRow(String email) {
    return 'Signed in as $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Used for this server\'s license and Casama Cloud models';

  @override
  String get cloudAccountSignOut => 'Sign Out of Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'This device forgets your Casama Cloud sign-in. This server, its license and Casama Cloud models keep working.';

  @override
  String get cloudAccountDelete => 'Delete Casama Cloud Account';

  @override
  String get cloudAccountDeleteHelp =>
      'Deletes your account on Casama Cloud. This server and its data stay.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Type $email to delete your Casama Cloud account. Cloud workspaces only you own go with it, and Casama Cloud models stop on servers they pay for. A plan you bought on the web is cancelled automatically. A plan bought in the App Store or Google Play isn\'t: cancel it in that store.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Your Casama Cloud account is deleted. Its data is removed for good on $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Move to Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Move to My Own Server';

  @override
  String get wsMoveSettingsHelp =>
      'Take this workspace\'s bots, chats, memory and files to another server';

  @override
  String get wsMoveTitle => 'Move This Workspace';

  @override
  String get wsMoveIntro =>
      'Everything comes along: bots, chats, memory, routines, files and computers. Once it\'s there, this copy stays readable but stops working.';

  @override
  String get wsMoveCloudOption => 'Move to Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Sign in with your Casama account and pick where it goes.';

  @override
  String get wsMoveServerOption => 'Move to my own server';

  @override
  String get wsMoveServerOptionHelp =>
      'On that server, open Settings › Bring a Workspace Here and copy its move code.';

  @override
  String get wsMoveInstallServer => 'Install Casama Server';

  @override
  String get wsMoveInstallServerHelp =>
      'No server yet? Run one on this computer first.';

  @override
  String get wsMoveReceiveOption => 'Bring a workspace here';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Get a move code for this workspace, to use on the server the other workspace is on now.';

  @override
  String get wsMoveOwnerOnly => 'Only the workspace\'s owner can move it.';

  @override
  String get wsMoveCloudPickTitle => 'Where should it go?';

  @override
  String get wsMoveCloudNew => 'A new workspace';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Starts empty on Casama Cloud, named $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Moved items go next to what\'s there. Names that clash get “(moved)”.';

  @override
  String get wsMoveServerTitle => 'Move to Your Own Server';

  @override
  String get wsMoveServerAddress => 'Server address';

  @override
  String get wsMoveServerCode => 'Move code';

  @override
  String get wsMoveCheckButton => 'Check';

  @override
  String get wsMoveReceiveTitle => 'Bring a Workspace Here';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'On the server the workspace is on now, open Settings › Move to My Own Server and enter this address and code. The code works once, until $time, and brings everything into $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'This server\'s address';

  @override
  String get wsMoveReceiveCode => 'Move code';

  @override
  String get wsMoveCopy => 'Copy';

  @override
  String get wsMoveCopied => 'Copied';

  @override
  String get wsMoveCheckTitle => 'Ready to Move';

  @override
  String wsMoveCheckTo(String name) {
    return 'To $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutes',
      one: '1 minute',
    );
    return '$size to copy, about $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutes',
      one: '1 minute',
    );
    return 'Near the end, bots pause for about $_temp0, then carry on there.';
  }

  @override
  String get wsMoveCheckLongPause => 'That\'s a long pause. Pick a quiet time.';

  @override
  String get wsMoveCheckComes => 'What comes along';

  @override
  String wsMoveCountBots(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString bots',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String wsMoveCountChats(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString chats',
      one: '1 chat',
    );
    return '$_temp0';
  }

  @override
  String wsMoveCountMemories(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString memories',
      one: '1 memory',
    );
    return '$_temp0';
  }

  @override
  String wsMoveCountRoutines(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString routines',
      one: '1 routine',
    );
    return '$_temp0';
  }

  @override
  String wsMoveCountFiles(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString files',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String wsMoveCountComputers(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString computers',
      one: '1 computer',
    );
    return '$_temp0';
  }

  @override
  String wsMoveCountPeople(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'What needs you afterwards';

  @override
  String wsMoveReconnect(String names) {
    return 'Sign in to these apps again there: $names';
  }

  @override
  String wsMoveInvites(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString people get',
      one: '1 person gets',
    );
    return '$_temp0 an email invite';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (invited)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'ChatGPT plans stay behind. Sign in to ChatGPT again there.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString computers start',
      one: '1 computer starts',
    );
    return '$_temp0 fresh there, with its home folder restored.';
  }

  @override
  String get wsMoveResetNote =>
      'Approvals, full access and device access start from the new server\'s defaults.';

  @override
  String get wsMoveBringKeys => 'Bring my keys';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString keys go',
      one: '1 key goes',
    );
    String _temp1 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'them',
      one: 'it',
    );
    return '$_temp0 along, sealed so only the new server can read $_temp1.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'You\'ll add model and chat app keys again there.';

  @override
  String get wsMoveDoesntFit => 'This workspace doesn\'t fit the plan there';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan fits it. Choose it on Casama Cloud, then check again.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have of $limit';
  }

  @override
  String get wsMoveOverPeople => 'People';

  @override
  String get wsMoveOverBots => 'Bots';

  @override
  String get wsMoveOverComputers => 'Computers';

  @override
  String get wsMoveOverStorage => 'Storage';

  @override
  String get wsMoveUpdateSource =>
      'Update this server first. It\'s older than the one you\'re moving to.';

  @override
  String get wsMoveUpdateTarget =>
      'The server you\'re moving to needs an update first.';

  @override
  String get wsMoveStart => 'Start Move';

  @override
  String get wsMoveCheckAgain => 'Check Again';

  @override
  String get wsMoveProgressTitle => 'Moving';

  @override
  String get wsMoveStepStarting => 'Getting ready';

  @override
  String get wsMoveStepCopying =>
      'Copying files while everything keeps working';

  @override
  String get wsMoveStepPausing => 'Pausing bots to copy the last changes';

  @override
  String get wsMoveStepFinishing => 'Sending chats, memory and settings';

  @override
  String get wsMoveStepImporting => 'The new server is bringing it in';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done of $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'You can close the app. The move carries on, and you get a notification when it\'s done.';

  @override
  String get wsMoveFailedTitle => 'The move stopped';

  @override
  String get wsMoveFailedBody =>
      'Nothing changed here: this workspace keeps working.';

  @override
  String get wsMoveTryAgain => 'Try Again';

  @override
  String get wsMoveNewCodeNeeded => 'To try again, get a new move code.';

  @override
  String get wsMoveDoneTitle => 'Moved';

  @override
  String wsMoveDoneBody(String server) {
    return 'Everything arrived at $server.';
  }

  @override
  String get wsMoveDoneNeeds => 'A few things need you there:';

  @override
  String get wsMoveOpenThere => 'Open It There';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Sign in to $name again';
  }

  @override
  String wsMoveAfterInvited(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString people were',
      one: '1 person was',
    );
    return '$_temp0 invited by email';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Reconnect $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Give $name\'s sender the new webhook address';
  }

  @override
  String wsMoveAfterForward(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString days',
      one: '1 day',
    );
    return 'Webhooks still sent here are passed on for $_temp0.';
  }

  @override
  String wsMoveAfterReset(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString bots',
      one: '1 bot',
    );
    return 'Check approvals for $_temp0';
  }

  @override
  String wsMoveAfterCloudModels(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString bots',
      one: '1 bot',
    );
    return 'Connect Casama Cloud models in Settings, or pick another model, for $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Add your model keys there';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString items were',
      one: '1 item was',
    );
    return '$_temp0 renamed “(moved)”';
  }

  @override
  String get wsMoveAfterReindex => 'Memory search catches up in a few minutes.';

  @override
  String get wsMoveAfterNothing => 'Nothing else to do.';

  @override
  String get wsMoveSubTitle => 'Your subscriptions';

  @override
  String get wsMoveSubToCloud =>
      'Bots on Casama Cloud run on your Cloud plan. If you paid for a business license for this server, cancel it once you don\'t need it.';

  @override
  String get wsMoveSubFromCloud =>
      'Your Casama Cloud plan keeps renewing. Cancel it once you\'re settled on your own server.';

  @override
  String get wsMoveSubManage => 'Manage Plan';

  @override
  String get wsMovedTitle => 'This workspace moved';

  @override
  String get wsMovedBodyCloud =>
      'It\'s on Casama Cloud now. Sign in there to keep going. This copy is read-only.';

  @override
  String wsMovedBodyServer(String host) {
    return 'It\'s on $host now. Sign in there to keep going. This copy is read-only.';
  }

  @override
  String get wsMovedSignInCloud => 'Sign In to Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Open $host';
  }

  @override
  String get wsMovedViewOld => 'View the Old Copy';

  @override
  String get languageDevice => 'Device language';

  @override
  String get shortcutQuickAsk => 'Quick ask';

  @override
  String shortcutAskBot(String name) {
    return 'Ask $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Run $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'workspace switch change team organization org role';

  @override
  String get settingsWordsAboutYou =>
      'profile name photo picture avatar pronouns about me reply style facts memory';

  @override
  String get settingsWordsPeople =>
      'members invite team users admins roles invite link code join remove';

  @override
  String get settingsWordsWorkspaceSettings =>
      'workspace name icon logo encryption memory payments stripe card password managers bot to bot chrome extension gallery full access permissions approvals ask bypass';

  @override
  String get settingsWordsSettingsDomains =>
      'domain website custom dns buy connect sites';

  @override
  String get settingsWordsUsage =>
      'cost spend spending money credits tokens limits';

  @override
  String get settingsWordsBilling =>
      'plan subscription upgrade pro plus max payment invoice card pricing';

  @override
  String get settingsWordsInviteFriends => 'referral credit reward share';

  @override
  String get settingsWordsAdminConsole => 'admin console';

  @override
  String get settingsWordsAppearance =>
      'theme dark mode light mode night colors colours fonts font text size background wallpaper look style themes effects motion animations haptics vibration vibrate feedback trackpad';

  @override
  String get settingsWordsQuietHours =>
      'do not disturb dnd sleep mute silence notifications schedule';

  @override
  String get settingsWordsPushPrefsTitle =>
      'notifications push alerts replies sounds';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'calls phone ring ringing lock screen full screen incoming answer';

  @override
  String get settingsWordsEmailTips => 'email newsletter tips news unsubscribe';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'email gallery digest monthly picks';

  @override
  String get settingsWordsNewsletterTitle =>
      'email newsletter monthly news updates subscribe unsubscribe';

  @override
  String get settingsWordsWakeWord =>
      'voice hey hands free microphone mic listen';

  @override
  String get settingsWordsShowBotSteps => 'steps tools details progress';

  @override
  String get settingsWordsShowReplyUsage => 'cost tokens price usage per reply';

  @override
  String get settingsWordsCheckForUpdates =>
      'update updates version upgrade download automatic';

  @override
  String get settingsWordsOpenAtLogin =>
      'startup launch login boot start automatically';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'live activity dynamic island lock screen other devices';

  @override
  String get settingsWordsShowBotsInNotch => 'notch menu bar dynamic island';

  @override
  String get settingsWordsNotchOnHover => 'notch hover mouse';

  @override
  String get settingsWordsLanguage => 'language locale english translation';

  @override
  String get settingsWordsIntegrations =>
      'apps connect connections gmail google slack calendar plugins tools mcp';

  @override
  String get settingsWordsSkills => 'skills catalog abilities instructions';

  @override
  String get settingsWordsCasamaLink =>
      'remote access address tunnel self host phone';

  @override
  String get settingsWordsServiceKeys => 'api keys search maps data';

  @override
  String get settingsWordsModelsTitle =>
      'api keys openai anthropic openrouter gemini models providers ollama local models';

  @override
  String get settingsWordsModelKeys =>
      'api keys openai anthropic openrouter gemini models providers ollama local models';

  @override
  String get settingsWordsAccount =>
      'email change email password sign out everywhere login';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa two factor authenticator totp otp security code';

  @override
  String get settingsWordsPairDevice =>
      'qr code scan sign in pair phone another device';

  @override
  String get settingsWordsPasskeys =>
      'passkey face id touch id fingerprint biometric';

  @override
  String get settingsWordsWidgetsTitle =>
      'widgets home screen lock screen controls control center glance pin shortcut';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'cards weather units celsius fahrenheit home city location currency stocks red green data sources';

  @override
  String get settingsWordsAppLock =>
      'app lock pin passcode face id touch id fingerprint biometric windows hello screenshots privacy lock screen';

  @override
  String get settingsWordsPrivacy =>
      'data export download delete account analytics tracking history retention blocked people block';

  @override
  String get settingsWordsSecrets =>
      'secrets passwords credentials vault environment variables';

  @override
  String get settingsWordsComputers =>
      'computers machines docker sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      'devices location health places folders watched apps browsers chrome extension phone permissions';

  @override
  String get settingsWordsUseThisComputer =>
      'companion this computer mac local files';

  @override
  String get settingsWordsHelpAndSupport =>
      'help support contact ticket bug report feedback docs community github star open source discord ideas board status';

  @override
  String get settingsWordsSignOut => 'log out logout sign out';

  @override
  String get notifDoIt => 'Do it';

  @override
  String get notifNotNow => 'Not now';

  @override
  String get notifAllow => 'Allow';

  @override
  String get notifDeny => 'Deny';

  @override
  String get notifApprove => 'Approve';

  @override
  String get notifReview => 'Review';

  @override
  String get notifReply => 'Reply';

  @override
  String get notifSend => 'Send';

  @override
  String get notifReplyPlaceholder => 'Reply…';

  @override
  String get notifChannelReplies => 'Replies';

  @override
  String get notifChannelRepliesDescription =>
      'A bot answered something you asked';

  @override
  String get notifChannelNeedsYou => 'Needs you';

  @override
  String get notifChannelNeedsYouDescription =>
      'Approvals, passwords and takeovers your bots wait for';

  @override
  String get notifChannelRoutines => 'Routines and briefs';

  @override
  String get notifChannelRoutinesDescription =>
      'Results of routines and the morning brief';

  @override
  String get notifChannelSuggestions => 'Suggestions';

  @override
  String get notifChannelSuggestionsDescription =>
      'Things your bots offer to do for you';

  @override
  String get notifChannelAccount => 'Account';

  @override
  String get notifChannelAccountDescription =>
      'Credits, projects and your server';

  @override
  String get notifCallChannel => 'Calls';

  @override
  String get notifCallLive => 'On a call';

  @override
  String get notifCallMuted => 'Muted';

  @override
  String get notifCallReconnecting => 'Reconnecting';

  @override
  String get notifCallMute => 'Mute';

  @override
  String get notifCallUnmute => 'Unmute';

  @override
  String get notifCallEnd => 'End Call';

  @override
  String get notifFromYourWatch => 'From your watch';

  @override
  String get notifLiveOpen => 'Open';

  @override
  String get notifLiveStop => 'Stop';

  @override
  String get notifLiveReview => 'Review';

  @override
  String get notifLiveAllow => 'Allow';

  @override
  String get notifLiveDeny => 'Deny';

  @override
  String get notifLiveNeedsOk => 'Needs your OK';

  @override
  String get notifLiveNeedsYou => 'Needs you';

  @override
  String get notifLiveWorking => 'Working';

  @override
  String get notifLiveTakeOver => 'Wants you to take over';

  @override
  String get notifLiveFinished => 'Finished';

  @override
  String get notifLiveProblem => 'Stopped with a problem';

  @override
  String get notifLiveBotWorking => 'A bot is working';

  @override
  String get notifLiveBotsAtWork => 'Bots at work';

  @override
  String get notifLiveStepOne => '1 step';

  @override
  String notifLiveSteps(int count) {
    return '$count steps';
  }

  @override
  String get notifAlarmTitle => 'Casama Alarm';

  @override
  String get notifAlarmStop => 'Stop';

  @override
  String get widgetIosNeedsYouDescription =>
      'See which bots are waiting on you, and answer the simple ones.';

  @override
  String get widgetIosBotDescription =>
      'Keep an eye on what one of your bots is doing.';

  @override
  String get widgetIosAskDescription =>
      'Ask a bot or start a call with one tap, with ideas to try.';

  @override
  String get widgetIosRoutinesDescription =>
      'See what runs next, and run a routine now.';

  @override
  String get widgetIosTodayDescription =>
      'Get your day in one place: what needs you, what runs next, and your credits.';

  @override
  String get widgetIosBriefDescription =>
      'Read what your bot told you this morning.';

  @override
  String get widgetIosLibraryDescription => 'Open what your bots made lately.';

  @override
  String get widgetIosTasksDescription =>
      'See where the board stands, with what waits on you first.';

  @override
  String get widgetIosCreditsDescription =>
      'Check how much of your credits you\'ve used.';

  @override
  String get widgetIosInlineDescription =>
      'See the one thing that matters most, above the clock.';

  @override
  String get widgetIosCanvasDescription =>
      'Show what your bots put here: a verse, a countdown, a streak, a list or a picture.';

  @override
  String get widgetMacNeedsYouDescription =>
      'See which bots are waiting on you.';

  @override
  String get widgetMacRoutinesDescription => 'See what runs next.';

  @override
  String get widgetAskCasama => 'Ask Casama';

  @override
  String get widgetControlAskDescription =>
      'Open quick ask with the keyboard up.';

  @override
  String get widgetTalkToBot => 'Talk to a bot';

  @override
  String widgetTalkToName(String name) {
    return 'Talk to $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Start a voice call with the bot you pick.';

  @override
  String get widgetRunRoutine => 'Run a routine';

  @override
  String get widgetControlRunDescription =>
      'Run the routine you pick, without opening Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Ask $bot anything';
  }

  @override
  String get widgetFallbackBrief => 'Morning brief';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot finished $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'As of $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Nothing coming up';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot wants you to take over';
  }

  @override
  String get widgetFallbackDay => 'day';

  @override
  String get widgetFallbackDays => 'days';

  @override
  String get widgetSampleVerse => 'Be still, and know that I am God.';

  @override
  String get widgetSampleVerseRef => 'Ps 46:10';

  @override
  String get widgetSampleVerseShort =>
      'Be still, and know that I am God. · Ps 46:10';

  @override
  String get widgetSampleVerseTiny => 'Be still, and know…';

  @override
  String get widgetSampleCanvasName => 'Daily verse';

  @override
  String get widgetSampleNeedFlights => 'Look up flights to Lisbon';

  @override
  String get widgetSampleNeedDentist => 'Move the dentist to Friday?';

  @override
  String get widgetSampleBotText =>
      'Three emails need a reply, and the Acme invoice is two days overdue.';

  @override
  String get widgetSampleStep => 'Reading your inbox';

  @override
  String get widgetSampleRoutineInbox => 'Inbox sweep';

  @override
  String get widgetSampleRoutineBrief => 'Morning brief';

  @override
  String get widgetSampleRoutineWeekly => 'Weekly report';

  @override
  String get widgetSampleWeekdays => 'Weekdays';

  @override
  String get widgetSampleEveryDay => 'Every day';

  @override
  String get widgetSampleFridays => 'Fridays at 16:00';

  @override
  String get widgetSampleBrief =>
      'Three emails need a reply, and the Acme invoice is two days overdue. Rain from 3 pm, so leave early for the 4:30 pickup. Your first meeting is at 10:00 with Dana.';

  @override
  String get widgetSamplePricing => 'Q4 pricing page';

  @override
  String get widgetSampleLogoIdeas => 'Logo ideas';

  @override
  String get widgetSampleTripPlan => 'Trip plan';

  @override
  String get widgetSampleLaunchPost => 'Draft the launch post';

  @override
  String get widgetSampleStarterInbox => 'Sum up my inbox';

  @override
  String get widgetSampleStarterFriday => 'Plan my Friday';

  @override
  String get widgetSampleWorking => 'Working · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'US\$5.70 left';

  @override
  String get widgetSampleSpentToday => 'US\$0.80 today';

  @override
  String get widgetSampleMorning =>
      'Good morning. Two meetings today, the first at 10:00 with the design team. Rain after 3, so take a coat. Your flight to Lisbon is confirmed for Friday.';

  @override
  String get widgetSampleLisbonPlan => 'Lisbon trip plan';

  @override
  String get widgetSampleAgo => 'Milo · 2 hr ago';

  @override
  String get widgetSampleLaunchEmail => 'Draft the launch email';

  @override
  String get widgetSampleInReviewBy => 'In review · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo wants to search flight prices for Lisbon';

  @override
  String get widgetSampleUpNextAt => 'Up next · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · in 18 min';

  @override
  String get widgetSampleDate => 'Wednesday, 18 November';

  @override
  String get widgetSampleNeedsCount => 'Needs you · 1';

  @override
  String get widgetSampleSearchFlights => 'Search flight prices for Lisbon';

  @override
  String get widgetSampleAskAda => 'Ask Ada';

  @override
  String get widgetSampleAskMilo => 'Ask Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Plan my day';

  @override
  String get widgetSampleWhatsNew => '✉️ What\'s new in my inbox?';

  @override
  String get widgetAndroidBotDescription =>
      'Follow what a bot is doing right now';

  @override
  String get widgetAndroidTodayDescription =>
      'Keep your whole day with your bots in one place';

  @override
  String get widgetAndroidBriefDescription =>
      'Read your morning brief at a glance';

  @override
  String get widgetAndroidLibraryDescription =>
      'Open what your bots made lately';

  @override
  String get widgetAndroidTasksDescription =>
      'Track where your task board stands';

  @override
  String get widgetAndroidCreditsDescription => 'Check how much you have used';

  @override
  String get widgetAndroidCanvasDescription =>
      'Show what your bots put here, from a verse to a countdown';

  @override
  String get widgetConfigBotTitle => 'Choose a bot';

  @override
  String get widgetConfigRoutinesTitle => 'Choose routines';

  @override
  String get widgetConfigRoutinesHint =>
      'Pick up to four, for the ones you start by hand';

  @override
  String get widgetConfigAutomatic => 'Automatic';

  @override
  String get widgetConfigAutomaticHint => 'The next runs, across your bots';

  @override
  String get widgetConfigDone => 'Done';

  @override
  String get widgetConfigSignedOutTitle => 'Nothing to choose yet';

  @override
  String get widgetConfigSignedOut =>
      'Open Casama and sign in, then choose here.';

  @override
  String get widgetConfigCanvasTitle => 'Choose a canvas';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'The one a bot set most recently';

  @override
  String get widgetConfigCanvasNone =>
      'No canvases yet. Ask a bot to put something here.';

  @override
  String get iosUsageTracking =>
      'If you allow it, Casama tells Meta when you install, join or subscribe after seeing a Casama ad on Facebook or Instagram, so we can measure which ads work. Casama never shows ads and never shares your chats or files.';

  @override
  String get iosUsageContacts =>
      'Your bots can look up people you know, only when you turn on Contacts in Device connections.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama opens your photo library when you choose a photo to send to a bot or for your profile.';

  @override
  String get iosUsageLocationAlways =>
      'Tell your bots when you arrive at or leave your named places, even when Casama is closed. Only the place name and time are shared, never your route.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Save places you name, such as Home or Work, and let your bots remind you when to leave for your next appointment. Used only if you turn on Places in Device connections.';

  @override
  String get iosUsageCamera =>
      'Casama uses the camera when you take a photo to send to a bot or for your profile.';

  @override
  String get iosUsageCalendars =>
      'Your bots can answer questions about your schedule and add events, only when you turn on Calendar in Device connections.';

  @override
  String get iosUsageSpeech =>
      'When Casama\'s dictation service can\'t be reached, your device\'s own speech recognition turns what you say into text.';

  @override
  String get iosUsageAlarmKit =>
      'Your bots can set alarms and timers that ring through silent mode, only when you allow Alarms in Device connections.';

  @override
  String get iosUsageHomeKit =>
      'Your bots can check and control your HomeKit home when you allow Home in Device connections; changes always ask for approval first.';

  @override
  String get iosUsageMicrophone =>
      'Casama uses the microphone for dictation and live calls with your bots. Only after you agree, your voice goes to AI providers to answer you: Google Gemini for calls, OpenAI to turn dictation into text.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama only reads Apple Health data; it never writes to it.';

  @override
  String get iosUsageFaceId =>
      'Casama uses Face ID to unlock the app when you turn on the app lock, and to confirm risky actions.';

  @override
  String get iosUsageHealthShare =>
      'Your bots can see daily summaries of your sleep, activity, workouts and heart from Apple Health, only when you turn on Apple Health in Device connections. Casama never writes to Apple Health and never uses it for ads.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama records your voice when you ask a bot something and sends it to your Casama server, where an AI provider (OpenAI, on Casama Cloud) turns it into text for your bot.';

  @override
  String get macUsageContacts =>
      'Your bots can look up people you know, only when you turn on Contacts in Device connections.';

  @override
  String get macUsageSpeech =>
      'When Casama\'s dictation service can\'t be reached, your device\'s own speech recognition turns what you say into text.';

  @override
  String get macUsageMicrophone =>
      'Casama uses the microphone for dictation and live calls with your bots. Only after you agree, your voice goes to AI providers to answer you: Google Gemini for calls, OpenAI to turn dictation into text.';

  @override
  String get macUsageAppleEvents =>
      'Quick ask reads the front window\'s title and your browser\'s current tab, only when you press the shortcut.';

  @override
  String get nativeNameFileProvider => 'Casama Computers';

  @override
  String get nativeNameNotifications => 'Casama Notifications';

  @override
  String get nativeNameSafari => 'Casama for Safari';

  @override
  String get nativeNameAskCasama => 'Ask Casama';

  @override
  String get nativeComputer => 'Computer';

  @override
  String get nativeSafariSignInIos =>
      'Open Casama on this device -> Settings -> Sign In on Another Device, or paste a sign-in link below.';

  @override
  String get nativeSafariSignInMac =>
      'Open Casama on this Mac -> Settings -> Sign In on Another Device, or paste a sign-in link below.';

  @override
  String get linuxDesktopComment =>
      'Bots that do the work, on every screen you own';

  @override
  String get linuxDesktopKeywords => 'AI;assistant;agent;bot;chat;';

  @override
  String macMenuAbout(String appName) {
    return 'About $appName';
  }

  @override
  String get macMenuPreferences => 'Preferences…';

  @override
  String get macMenuServices => 'Services';

  @override
  String macMenuHide(String appName) {
    return 'Hide $appName';
  }

  @override
  String get macMenuHideOthers => 'Hide Others';

  @override
  String get macMenuShowAll => 'Show All';

  @override
  String macMenuQuit(String appName) {
    return 'Quit $appName';
  }

  @override
  String get macMenuEdit => 'Edit';

  @override
  String get macMenuUndo => 'Undo';

  @override
  String get macMenuRedo => 'Redo';

  @override
  String get macMenuCut => 'Cut';

  @override
  String get macMenuCopy => 'Copy';

  @override
  String get macMenuPaste => 'Paste';

  @override
  String get macMenuPasteAndMatchStyle => 'Paste and Match Style';

  @override
  String get macMenuDelete => 'Delete';

  @override
  String get macMenuSelectAll => 'Select All';

  @override
  String get macMenuFind => 'Find';

  @override
  String get macMenuFindEllipsis => 'Find…';

  @override
  String get macMenuFindAndReplace => 'Find and Replace…';

  @override
  String get macMenuFindNext => 'Find Next';

  @override
  String get macMenuFindPrevious => 'Find Previous';

  @override
  String get macMenuUseSelectionForFind => 'Use Selection for Find';

  @override
  String get macMenuJumpToSelection => 'Jump to Selection';

  @override
  String get macMenuSpellingAndGrammar => 'Spelling and Grammar';

  @override
  String get macMenuSpelling => 'Spelling';

  @override
  String get macMenuShowSpelling => 'Show Spelling and Grammar';

  @override
  String get macMenuCheckDocumentNow => 'Check Document Now';

  @override
  String get macMenuCheckSpellingWhileTyping => 'Check Spelling While Typing';

  @override
  String get macMenuCheckGrammar => 'Check Grammar With Spelling';

  @override
  String get macMenuCorrectSpelling => 'Correct Spelling Automatically';

  @override
  String get macMenuSubstitutions => 'Substitutions';

  @override
  String get macMenuShowSubstitutions => 'Show Substitutions';

  @override
  String get macMenuSmartCopyPaste => 'Smart Copy/Paste';

  @override
  String get macMenuSmartQuotes => 'Smart Quotes';

  @override
  String get macMenuSmartDashes => 'Smart Dashes';

  @override
  String get macMenuSmartLinks => 'Smart Links';

  @override
  String get macMenuDataDetectors => 'Data Detectors';

  @override
  String get macMenuTextReplacement => 'Text Replacement';

  @override
  String get macMenuTransformations => 'Transformations';

  @override
  String get macMenuMakeUpperCase => 'Make Upper Case';

  @override
  String get macMenuMakeLowerCase => 'Make Lower Case';

  @override
  String get macMenuCapitalize => 'Capitalize';

  @override
  String get macMenuSpeech => 'Speech';

  @override
  String get macMenuStartSpeaking => 'Start Speaking';

  @override
  String get macMenuStopSpeaking => 'Stop Speaking';

  @override
  String get macMenuView => 'View';

  @override
  String get macMenuEnterFullScreen => 'Enter Full Screen';

  @override
  String get macMenuWindow => 'Window';

  @override
  String get macMenuMinimize => 'Minimize';

  @override
  String get macMenuZoom => 'Zoom';

  @override
  String get macMenuBringAllToFront => 'Bring All to Front';

  @override
  String get macMenuHelp => 'Help';

  @override
  String get macMenuCheckForUpdates => 'Check for Updates…';

  @override
  String get macMenuSettings => 'Settings…';

  @override
  String get macMenuFile => 'File';

  @override
  String get macMenuNewChat => 'New Chat';

  @override
  String get macMenuNewBot => 'New Bot…';

  @override
  String get macMenuQuickAsk => 'Quick Ask';

  @override
  String get macMenuSearch => 'Search…';

  @override
  String get macMenuCloseWindow => 'Close Window';

  @override
  String get macMenuGo => 'Go';

  @override
  String get macMenuBots => 'Bots';

  @override
  String get macMenuInbox => 'Inbox';

  @override
  String get macMenuBoard => 'Board';

  @override
  String get macMenuComputer => 'Computer';

  @override
  String get macMenuPages => 'Pages';

  @override
  String get macMenuCasamaHelp => 'Casama Help';

  @override
  String get macMenuSendFeedback => 'Send Feedback…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Routine';

  @override
  String get siriRoutines => 'Routines';

  @override
  String get siriCanvas => 'Canvas';

  @override
  String get siriAutomatic => 'Automatic';

  @override
  String get siriAutomaticSubtitle => 'What a bot set most recently';

  @override
  String get siriChooseCanvas => 'Choose a canvas';

  @override
  String get siriChooseCanvasDescription =>
      'Show what a bot set most recently, or one canvas.';

  @override
  String get siriChooseBot => 'Choose a bot';

  @override
  String get siriChooseBotDescription => 'Pick the bot this widget shows.';

  @override
  String get siriChooseRoutines => 'Choose routines';

  @override
  String get siriChooseRoutinesDescription =>
      'Show the next runs, or up to four routines you pick.';

  @override
  String get siriOpenCasama => 'Open Casama';

  @override
  String get siriWhere => 'Where';

  @override
  String get siriTalkToBot => 'Talk to a bot';

  @override
  String get siriTalkToBotDescription =>
      'Starts a voice call with the bot you pick.';

  @override
  String get siriRunRoutine => 'Run a routine';

  @override
  String get siriRunRoutineControlDescription =>
      'Runs the routine you pick, without opening Casama.';

  @override
  String get siriCallAction => 'Call action';

  @override
  String get siriAction => 'Action';

  @override
  String get siriStopBot => 'Stop the bot';

  @override
  String get siriRun => 'Run';

  @override
  String get siriAnswerRequest => 'Answer a bot\'s request';

  @override
  String get siriRequest => 'Request';

  @override
  String get siriAllow => 'Allow';

  @override
  String get siriFromWidget => 'From a widget';

  @override
  String get siriRunRoutineNow => 'Run a routine now';

  @override
  String get siriAcceptSuggestion => 'Do what a bot suggests';

  @override
  String get siriSuggestion => 'Suggestion';

  @override
  String get siriBotStatusDescription =>
      'Where a bot stands and what it is doing';

  @override
  String get siriNextRoutineDescription => 'The next routine and when it runs';

  @override
  String get siriAskCasama => 'Ask Casama';

  @override
  String get siriAskVoiceDescription => 'Ask a bot something by voice';

  @override
  String get siriWhatWaiting => 'What is waiting for your OK';

  @override
  String get siriAsk => 'Ask';

  @override
  String get siriShortNeedsYou => 'Needs you';

  @override
  String get siriOpeningToFinish => 'Opening Casama to finish.';

  @override
  String get siriName => 'Name';

  @override
  String get siriTitle => 'Title';

  @override
  String get siriChat => 'Chat';

  @override
  String get siriBotSubtitle =>
      'A bot in Casama, an AI assistant you chat with';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'A routine $bot runs in Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'A chat with $bot in Casama';
  }

  @override
  String get siriBotInCasama => 'Bot in Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Routine · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Chat with $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'routine';

  @override
  String get siriKeywordChat => 'chat';

  @override
  String get siriAskBot => 'Ask a bot';

  @override
  String get siriAskBotDescription =>
      'Sends a question to one of your Casama bots (AI assistants) in a new chat and reads the reply back. With no bot named, the bot you talked to last answers.';

  @override
  String get siriCategoryBots => 'Bots';

  @override
  String get siriAskBotParamDescription =>
      'Which bot to ask. Leave empty for the bot you talked to last.';

  @override
  String get siriQuestion => 'Question';

  @override
  String get siriQuestionDescription =>
      'What to ask the bot, in your own words.';

  @override
  String get siriWhatShouldIAsk => 'What should I ask?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Ask $bot $question';
  }

  @override
  String get siriRestOnScreen => 'The rest is on screen.';

  @override
  String get siriRestOnScreenEllipsis => '… The rest is on screen.';

  @override
  String get siriRunRoutineDescription =>
      'Runs one of your Casama bots\' routines now. The result arrives in the app and as a notification, as it does when the routine runs on its own.';

  @override
  String get siriRoutineParamDescription => 'Which routine to run now.';

  @override
  String siriSummaryRun(String routine) {
    return 'Run $routine';
  }

  @override
  String get siriWhatNeedsMe => 'What needs me';

  @override
  String get siriWhatNeedsMeDescription =>
      'Says how many things in Casama are waiting for you: a bot\'s request for your OK, a takeover, a suggestion. Answer them in the app.';

  @override
  String get siriOpenBot => 'Open a bot';

  @override
  String get siriOpenBotDescription =>
      'Opens your chat with one of your Casama bots.';

  @override
  String get siriOpenBotPersonDescription => 'Opens a Casama bot\'s chat.';

  @override
  String get siriOpenChat => 'Open a chat';

  @override
  String get siriOpenChatDescription =>
      'Opens one of your chats with a Casama bot.';

  @override
  String get siriOpenRoutine => 'Open a routine\'s bot';

  @override
  String get siriOpenRoutineDescription =>
      'Opens the bot that runs one of your Casama routines.';

  @override
  String get siriTalkDescription =>
      'Opens voice mode with one of your Casama bots. Available on the Action button.';

  @override
  String get siriAskGetReply => 'Ask a bot and get the reply';

  @override
  String get siriAskGetReplyDescription =>
      'Sends a question to a Casama bot and returns its reply text for chaining in Shortcuts.';

  @override
  String get siriGetLastReply => 'Get the last reply';

  @override
  String get siriGetLastReplyDescription =>
      'Returns the latest reply text from a Casama bot chat.';

  @override
  String get siriStartComputer => 'Start a computer';

  @override
  String get siriStartComputerDescription =>
      'Wakes up a Casama computer after confirmation.';

  @override
  String get siriComputerName => 'Computer name';

  @override
  String get siriYourComputer => 'your Casama computer';

  @override
  String siriStartConfirm(String computer) {
    return 'Start $computer?';
  }

  @override
  String get siriOpenToStartComputer => 'Open Casama to start your computer.';

  @override
  String get siriFocusTitle => 'Set Casama Focus Filter';

  @override
  String get siriFocusDescription =>
      'Show only chosen bots and optionally hold proactive check-ins while this Focus is active.';

  @override
  String get siriFocusBots => 'Bots to show';

  @override
  String get siriFocusHold => 'Hold proactive check-ins';

  @override
  String get siriFocusShowOne => 'Show 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Show $count bots';
  }

  @override
  String get siriFocusHoldCheckIns => 'Hold check-ins';

  @override
  String get siriFocusAllowCheckIns => 'Allow check-ins';

  @override
  String get siriFocusAllBots => 'All bots';

  @override
  String get siriFocusAllVisible => 'All bots visible';

  @override
  String get siriToolAsk => 'Ask a Casama bot';

  @override
  String get siriToolAskDescription =>
      'Ask one of the person\'s Casama bots a question and return its reply.';

  @override
  String get siriCategoryAssistants => 'Assistants';

  @override
  String get siriToolBotDescription => 'Which Casama bot to ask.';

  @override
  String get siriToolQuestionDescription => 'What to ask the bot.';

  @override
  String get siriToolRun => 'Run a Casama routine';

  @override
  String get siriToolRunDescription =>
      'Run a saved Casama routine after confirming with the person.';

  @override
  String get siriCategoryAutomation => 'Automation';

  @override
  String get siriToolRoutineDescription => 'The routine to run.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return 'Run $routine with $bot?';
  }

  @override
  String get siriToolNeeds => 'What needs me in Casama';

  @override
  String get siriToolNeedsDescription =>
      'Check how many approvals, takeovers or suggestions are waiting in Casama.';

  @override
  String get siriOpenToCheck => 'Open Casama to check what needs you.';

  @override
  String get siriToolStop => 'Stop a Casama bot';

  @override
  String get siriToolStopDescription =>
      'Stop a bot that is currently running a task in Casama.';

  @override
  String get siriToolStopBotDescription => 'The bot to stop.';

  @override
  String siriStoppedBot(String bot) {
    return 'Stopped $bot.';
  }

  @override
  String get siriToolCall => 'Call a Casama bot';

  @override
  String get siriToolCallDescription =>
      'Open Casama and start a live voice call with the chosen bot.';

  @override
  String get siriCategoryCommunication => 'Communication';

  @override
  String get siriToolCallBotDescription => 'The bot to call.';

  @override
  String siriCalling(String bot) {
    return 'Calling $bot.';
  }

  @override
  String siriBotIn(String app) {
    return 'A bot in $app';
  }

  @override
  String get siriMe => 'Me';

  @override
  String get siriABot => 'a bot';

  @override
  String get siriFavorited => 'Favorited';

  @override
  String siriSentTo(String bot) {
    return 'Sent to $bot';
  }

  @override
  String get siriMessage => 'Message';

  @override
  String get siriNone => 'None';

  @override
  String get siriErrorOneBot => 'Casama sends to one bot at a time. Which bot?';

  @override
  String get siriErrorTextOnly =>
      'Siri can send words to a bot. Add files, pictures and places in Casama.';

  @override
  String get siriErrorNoBot => 'I couldn\'t find that bot in Casama.';

  @override
  String get siriWhatShouldISend => 'What should I send?';

  @override
  String get siriAskCasamaBot => 'Ask Casama Bot';

  @override
  String siriAskName(String bot) {
    return 'Ask $bot';
  }

  @override
  String get siriAskAboutThis => 'Ask Casama about this';

  @override
  String siriPhraseAsk(String app) {
    return 'Ask $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Ask a bot in $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Ask $bot in $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Talk to a bot in $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Talk to $bot in $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Run a routine in $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Run $routine in $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'What needs me in $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'What\'s waiting in $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Ask $app something';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Run my $routine in $app';
  }

  @override
  String get siriABotSubject => 'A bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot needs your OK.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot needs you to take over.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot has a suggestion.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot needs you.';
  }

  @override
  String get siriOneThingNeedsYou => 'One thing needs you.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count things need you.';
  }

  @override
  String get siriUnlockPhone => 'Unlock your phone and try again.';

  @override
  String get siriGeminiOff =>
      'Gemini is turned off for Casama on this phone (Casama → Settings → Privacy).';

  @override
  String get suggestionActionTurnOn => 'Turn on';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Remind me $date';
  }

  @override
  String get suggestionActionPickTime => 'Pick a time';

  @override
  String get suggestionActionPutAwayAll => 'Put away all';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Put away all $count ideas',
      one: 'Put away 1 idea',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Open';

  @override
  String get suggestionActionGotIt => 'Got it';

  @override
  String get suggestionActionLater => 'Later';

  @override
  String get suggestionActionSomethingElse => 'Something else';

  @override
  String get suggestionTurnedOn => 'Turned on';

  @override
  String suggestionReminderSet(String date) {
    return 'Reminder set for $date';
  }

  @override
  String get suggestionSnoozed => 'Saved for later';

  @override
  String get suggestionSnoozedExpired => 'Put away — snoozed twice';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Put away $count ideas',
      one: 'Put away 1 idea',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Undo';

  @override
  String get suggestionLaterTomorrow => 'Tomorrow morning';

  @override
  String get suggestionLaterEvening => 'This evening';

  @override
  String get suggestionLaterNextWeek => 'Next week';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more ideas waiting',
      one: '1 more idea waiting',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count ideas',
      one: '$name · 1 idea',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count routine results today',
      one: '$name · 1 routine result today',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count updates today',
      one: '$name · 1 update today',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routine results today',
      one: '1 routine result today',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count updates today',
      one: '1 update today',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Since yesterday: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '1 page',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routine results',
      one: '1 routine result',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count updates',
      one: '1 update',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Turn on';

  @override
  String get notifOpen => 'Open';

  @override
  String get notifGotIt => 'Got it';

  @override
  String get notifRemindMe => 'Remind me';

  @override
  String get notifLater => 'Later';

  @override
  String get watchTurnOn => 'Turn on';

  @override
  String get watchGotIt => 'Got it';

  @override
  String get watchRemindMe => 'Remind';

  @override
  String get watchLater => 'Later';

  @override
  String get watchOpen => 'Open';
}
