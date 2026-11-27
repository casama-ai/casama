// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

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
  String get tabTitleCall => 'Anruf';

  @override
  String get tabTitleProject => 'Projekt';

  @override
  String get tabTitleGroupChat => 'Gruppenchat';

  @override
  String get loading => 'Wird geladen…';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get keepGoing => 'Weitermachen';

  @override
  String get keepGoingMessage => 'Mach dort weiter, wo du aufgehört hast.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get close => 'Schließen';

  @override
  String get create => 'Erstellen';

  @override
  String get continueLabel => 'Weiter';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen';

  @override
  String get errorViewHint => 'Ein Neustart der App sollte das beheben.';

  @override
  String get signInTitle => 'Bei Casama anmelden';

  @override
  String get signUpTitle => 'Konto erstellen';

  @override
  String get email => 'E-Mail';

  @override
  String get password => 'Passwort';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signUp => 'Konto erstellen';

  @override
  String get haveAccount => 'Du hast schon ein Konto? Anmelden';

  @override
  String get needAccount => 'Neu hier? Konto erstellen';

  @override
  String get magicLink => 'Anmelde-Link per E-Mail senden';

  @override
  String get magicLinkSent => 'Prüfe dein Postfach auf einen Anmelde-Link.';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get continueWithApple => 'Mit Apple fortfahren';

  @override
  String get continueWithEmail => 'Mit E-Mail fortfahren';

  @override
  String get moreSignInOptions => 'Weitere Optionen';

  @override
  String get usePasswordInstead => 'Stattdessen Passwort verwenden';

  @override
  String get checkInboxTitle => 'Prüfe deinen Posteingang';

  @override
  String checkInboxBody(String email) {
    return 'Wir haben einen Anmelde-Link und einen 6-stelligen Code an $email gesendet. Tippe auf den Link oder gib den Code hier ein.';
  }

  @override
  String get emailCodeLabel => '6-stelliger Code';

  @override
  String get resendLink => 'Erneut senden';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Erneut senden in $secondsString s';
  }

  @override
  String get useDifferentEmail => 'Andere E-Mail-Adresse verwenden';

  @override
  String get authWrongPassword =>
      'E-Mail und Passwort stimmen nicht überein. Versuch es erneut oder melde dich stattdessen per E-Mail-Link an.';

  @override
  String get authEmailNotConfirmed =>
      'Bestätige zuerst deine E-Mail-Adresse: Öffne den Link, den wir dir gesendet haben.';

  @override
  String get authCodeInvalid =>
      'Dieser Code ist falsch oder abgelaufen. Prüfe die neueste E-Mail oder sende einen neuen.';

  @override
  String get authTooManyTries =>
      'Zu viele Versuche. Warte eine Minute und versuch es erneut.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds Sekunden',
      one: '1 Sekunde',
    );
    return 'Zu viele Anfragen auf einmal. Versuch es in $_temp0 erneut.';
  }

  @override
  String get tooManyRequestsReady => 'Du kannst es jetzt erneut versuchen.';

  @override
  String get authAccountExists =>
      'Es gibt bereits ein Konto mit dieser E-Mail-Adresse. Melde dich stattdessen an.';

  @override
  String get authSignupDisabled =>
      'Dieser Server nimmt keine neuen Registrierungen an.';

  @override
  String get useMagicLinkInstead => 'Stattdessen Link per E-Mail senden';

  @override
  String get invalidEmail => 'Gib eine gültige E-Mail-Adresse ein';

  @override
  String get passwordTooShort => 'Verwende mindestens 6 Zeichen';

  @override
  String get signOut => 'Abmelden';

  @override
  String get onboardingTitle => 'Workspace einrichten';

  @override
  String get createWorkspace => 'Workspace erstellen';

  @override
  String get workspaceName => 'Workspace-Name';

  @override
  String get joinWorkspace => 'Mit Einladungscode beitreten';

  @override
  String get inviteCode => 'Einladungscode';

  @override
  String get join => 'Beitreten';

  @override
  String get addModelKeyTitle => 'Modellschlüssel hinzufügen';

  @override
  String get addModelKeyBody =>
      'Bots verwenden deinen eigenen Schlüssel für Modellanbieter. Er wird verschlüsselt gespeichert und nie wieder angezeigt.';

  @override
  String get provider => 'Anbieter';

  @override
  String get label => 'Bezeichnung';

  @override
  String get apiKey => 'API-Schlüssel';

  @override
  String get baseUrl => 'Basis-URL';

  @override
  String get testKey => 'Schlüssel testen';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'Schlüssel funktioniert ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Schlüsseltest fehlgeschlagen: $error';
  }

  @override
  String get createFirstBot => 'Ersten Bot erstellen';

  @override
  String get botName => 'Bot-Name';

  @override
  String get model => 'Modell';

  @override
  String get persona => 'Anweisungen';

  @override
  String get personaHint =>
      'Was dieser Bot tut und wie er arbeiten soll. Eine Persona füllt das aus; du kannst es frei bearbeiten.';

  @override
  String get modelKey => 'Modellschlüssel';

  @override
  String get navComputer => 'Computer';

  @override
  String get navChats => 'Chats';

  @override
  String get navTasks => 'Aufgaben';

  @override
  String get settingsConnectionsSection => 'Verbindungen';

  @override
  String get advanced => 'Erweitert';

  @override
  String get settingsAdvancedSummary => 'Geheimnisse, Computer, Geräte';

  @override
  String get bots => 'Bots';

  @override
  String get newBot => 'Neuer Bot';

  @override
  String get noBots => 'Noch keine Bots';

  @override
  String get botStatusIdle => 'Inaktiv';

  @override
  String get botStatusWorking => 'Arbeitet';

  @override
  String get botStatusWaiting => 'Wartet auf dich';

  @override
  String sidebarMoreWorking(int count) {
    return '$count weitere arbeiten';
  }

  @override
  String get botStatusDisabled => 'Deaktiviert';

  @override
  String costToday(String cost) {
    return '$cost heute';
  }

  @override
  String get newChat => 'Neuer Chat';

  @override
  String get conversations => 'Unterhaltungen';

  @override
  String messageHint(String bot) {
    return 'Nachricht an $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Nachricht an $bot · @ für eine App';
  }

  @override
  String get mentionSectionBots => 'Bots';

  @override
  String get mentionSectionApps => 'Apps';

  @override
  String get mentionSectionAddToBot => 'Zu diesem Bot hinzufügen';

  @override
  String get mentionSectionConnect => 'Verbinden';

  @override
  String get mentionSectionStartGroup => 'Gruppenchat starten';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'App';

  @override
  String get mentionAddAction => 'Hinzufügen';

  @override
  String get mentionConnectAction => 'Verbinden';

  @override
  String get mentionMaxApps =>
      'Du kannst bis zu 3 Apps pro Nachricht erwähnen.';

  @override
  String get mentionRemovedApp => 'Entfernte App';

  @override
  String get send => 'Senden';

  @override
  String get stop => 'Stopp';

  @override
  String get thinking => 'Denkt nach…';

  @override
  String get checkingItsWork => 'Prüft eigene Arbeit…';

  @override
  String get mapFullScreen => 'Vollbild';

  @override
  String get mapTitle => 'Karte';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Gestoppt.';

  @override
  String emptyChat(String bot) {
    return 'Sag $bot Hallo.';
  }

  @override
  String get toolRunning => 'Läuft';

  @override
  String get toolFailedLabel => 'Fehlgeschlagen';

  @override
  String get toolOutput => 'Ausgabe';

  @override
  String get remembered => 'Etwas gemerkt';

  @override
  String skillLoaded(String name) {
    return 'Skill $name geladen';
  }

  @override
  String checkpointSaved(String label) {
    return 'Wiederherstellungspunkt gespeichert: $label';
  }

  @override
  String computerState(String state) {
    return 'Computer $state';
  }

  @override
  String get activity => 'Aktivität';

  @override
  String get timelineTitle => 'Durchlaufprotokoll';

  @override
  String get allEvents => 'Alle';

  @override
  String get filterTools => 'Tools';

  @override
  String get filterMessages => 'Nachrichten';

  @override
  String get filterSystem => 'System';

  @override
  String get restore => 'Wiederherstellen';

  @override
  String get restoreConfirm =>
      'Zu diesem Wiederherstellungspunkt zurückkehren? Seitdem geänderte Dateien werden ersetzt.';

  @override
  String get restored => 'Wiederherstellungspunkt wiederhergestellt.';

  @override
  String get noRuns => 'Noch keine Durchläufe.';

  @override
  String get computerTitle => 'Computer';

  @override
  String get computerStart => 'Starten';

  @override
  String get computerSleep => 'Ruhezustand';

  @override
  String get screen => 'Bildschirm';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Dateien';

  @override
  String get noScreen =>
      'Noch nichts auf dem Bildschirm. Die Browser-Seite des Bots erscheint hier.';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get upload => 'Hochladen';

  @override
  String get download => 'Herunterladen';

  @override
  String get emptyFolder => 'Dieser Ordner ist leer';

  @override
  String get noCheckpoints =>
      'Sie werden vor riskanten Änderungen automatisch gespeichert, damit du sie rückgängig machen kannst.';

  @override
  String get computerAsleep =>
      'Der Computer schläft. Seine Dateien sind gespeichert und er wacht bei Bedarf wieder auf.';

  @override
  String get connectTerminal => 'Verbinden';

  @override
  String get terminalDisconnected => 'Getrennt.';

  @override
  String get terminalReconnecting =>
      'Server startet neu, Verbindung wird wiederhergestellt…';

  @override
  String get memory => 'Gedächtnis';

  @override
  String get noMemories => 'Noch nichts gemerkt.';

  @override
  String get noMemoriesMatch => 'Keine passenden Erinnerungen.';

  @override
  String get clearSearch => 'Leeren';

  @override
  String get addMemory => 'Erinnerung hinzufügen';

  @override
  String get addMemoryHelp =>
      'Etwas, das der Bot über dich oder deine Arbeit immer wissen sollte.';

  @override
  String get addMemoryFactHint =>
      'Zum Beispiel: Unser Geschäftsjahr beginnt im April.';

  @override
  String get addMemoryPreferenceHint =>
      'Zum Beispiel: Halte Zusammenfassungen unter fünf Stichpunkten.';

  @override
  String get memoryAdded => 'Erinnerung hinzugefügt';

  @override
  String get pin => 'Anheften';

  @override
  String get unpin => 'Lösen';

  @override
  String get deleteMemoryConfirm =>
      'Das vergessen? Das lässt sich nicht rückgängig machen.';

  @override
  String get skills => 'Skills';

  @override
  String get noSkills =>
      'Noch keine Skills. Skills sind Anweisungen, die Bots bei Bedarf laden.';

  @override
  String get newSkill => 'Neuer Skill';

  @override
  String get skillName => 'Name (Kleinbuchstaben, Bindestriche)';

  @override
  String get skillDescription => 'Einzeilige Beschreibung';

  @override
  String get skillBody => 'Anweisungen (Markdown)';

  @override
  String get enabled => 'Aktiviert';

  @override
  String get settings => 'Einstellungen';

  @override
  String get workspace => 'Workspace';

  @override
  String get switchWorkspace => 'Workspace wechseln';

  @override
  String get modelKeys => 'Modellschlüssel';

  @override
  String get moreProviders => 'Weitere Anbieter';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, eigene Server';

  @override
  String get toolPermissions => 'Tool-Berechtigungen';

  @override
  String get devicesAdvancedSummary =>
      'Aufbewahrungsdauer, private Modelle, Bots mit Zugriff';

  @override
  String get companionAdvancedSummary =>
      'Befehle, lokale Tools (MCP), Coding-Agents';

  @override
  String get noKeys => 'Noch keine Modellschlüssel.';

  @override
  String get addKey => 'Schlüssel hinzufügen';

  @override
  String get usage => 'Nutzung';

  @override
  String get language => 'Sprache';

  @override
  String inviteSent(String email) {
    return 'Einladung an $email gesendet.';
  }

  @override
  String get botProfile => 'Bot-Profil';

  @override
  String get groupMembers => 'Bots in diesem Chat';

  @override
  String get groupMembersHelp =>
      'Jeder behält sein eigenes Gedächtnis und eigene Einstellungen. Tippe auf einen, um sein Profil zu öffnen.';

  @override
  String get botAdvancedSummary =>
      'Chat-Apps, Links, Regeln, Beobachtungen, Plugins, Aktivität';

  @override
  String get botActivityRow => 'Jeder Durchlauf, Schritt für Schritt';

  @override
  String get createBotAdvancedSummary => 'Modellschlüssel und Modell';

  @override
  String get botProfileSection => 'Profil';

  @override
  String get botBrain => 'Gehirn';

  @override
  String get botAbilities => 'Fähigkeiten';

  @override
  String get botSchedule => 'Zeitplan';

  @override
  String get chatComputerLive => 'Arbeitet auf seinem Computer';

  @override
  String get autonomy => 'Autonomie';

  @override
  String get autonomyAskAlways => 'Vor dem Handeln fragen';

  @override
  String get autonomyAskRisky => 'Bei riskanten Aktionen fragen';

  @override
  String get autonomyAutonomous => 'Eigenständig handeln';

  @override
  String get saved => 'Gespeichert.';

  @override
  String get justNow => 'gerade eben';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'vor $nString Minuten',
      one: 'vor 1 Minute',
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
      other: 'vor $nString Stunden',
      one: 'vor 1 Stunde',
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
      other: 'vor $nString Tagen',
      one: 'gestern',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Ein Bot';

  @override
  String get addIntegration => 'Integration hinzufügen';

  @override
  String get addSecret => 'Geheimnis hinzufügen';

  @override
  String get allowedHosts => 'Erlaubte Hosts';

  @override
  String get allowedHostsHelp => 'Kommagetrennt, zum Beispiel api.github.com';

  @override
  String get alwaysAllow => 'Immer erlauben';

  @override
  String get approval => 'Freigabe';

  @override
  String get approvalAlreadyDecided =>
      'Diese Anfrage wurde bereits entschieden oder ist abgelaufen.';

  @override
  String get approvals => 'Freigaben';

  @override
  String get approve => 'Freigeben';

  @override
  String get approved => 'Freigegeben';

  @override
  String get authHeaderOptional => 'Autorisierungs-Header (optional)';

  @override
  String get authSecretName => 'Name des Auth-Geheimnisses (optional)';

  @override
  String get authSecretNameHelp =>
      'Name eines Geheimnisses aus Einstellungen › Geheimnisse, gesendet als Bearer-Token';

  @override
  String get baseUrlOptional => 'Basis-URL (optional)';

  @override
  String get blankBot => 'Leer';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Modell wählen';

  @override
  String get searchModels => 'Modelle suchen oder Modell-ID eingeben';

  @override
  String get recommendedModels => 'Empfohlen';

  @override
  String get allModels => 'Alle Modelle';

  @override
  String useCustomModel(String id) {
    return '„$id“ verwenden';
  }

  @override
  String modelListFallback(String reason) {
    return 'Vorgeschlagene Modelle werden angezeigt. $reason Du kannst trotzdem jede Modell-ID eingeben.';
  }

  @override
  String get noModelsFound => 'Keine passenden Modelle.';

  @override
  String get addModelKeyFirst =>
      'Füge zuerst einen Modellschlüssel hinzu. Dein Bot nutzt ihn zum Denken; er wird verschlüsselt gespeichert und nie wieder angezeigt.';

  @override
  String get composioToolkits =>
      'Toolkits (kommagetrennt, zum Beispiel github, gmail)';

  @override
  String get copySecret => 'Geheimnis kopieren';

  @override
  String get cronExpression => 'Cron-Ausdruck';

  @override
  String get cronHelp => 'Minute Stunde Tag Monat Wochentag';

  @override
  String get denied => 'Abgelehnt';

  @override
  String get deny => 'Ablehnen';

  @override
  String get everyHour => 'Jede Stunde';

  @override
  String get expired => 'Abgelaufen';

  @override
  String get inbox => 'Posteingang';

  @override
  String get integrationName => 'Name';

  @override
  String get integrationNameHelp => 'Kleinbuchstaben, Zahlen und Unterstriche';

  @override
  String get integrationType => 'Typ';

  @override
  String get integrations => 'Integrationen';

  @override
  String get kindMcp => 'MCP-Server';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Alle als gelesen markieren';

  @override
  String get newRoutine => 'Neue Routine';

  @override
  String get noIntegrationsForBot =>
      'Füge zuerst Integrationen in den Einstellungen hinzu und aktiviere sie dann hier für diesen Bot.';

  @override
  String get noRoutines => 'Noch keine Routinen';

  @override
  String get noSecrets => 'Noch keine Geheimnisse';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get openInbox => 'Posteingang öffnen';

  @override
  String get pipedreamApps => 'Apps (kommagetrennt)';

  @override
  String get pipedreamClientId => 'Client-ID';

  @override
  String get pipedreamClientSecret => 'Client-Secret';

  @override
  String get pipedreamProject => 'Projekt-ID';

  @override
  String get riskHigh => 'Hohes Risiko';

  @override
  String get riskLow => 'Niedriges Risiko';

  @override
  String get riskMedium => 'Mittleres Risiko';

  @override
  String get routineGithub => 'Bei GitHub-Ereignissen';

  @override
  String get routineInstructions => 'Anweisungen';

  @override
  String get routineInstructionsHint => 'Was soll der Bot jedes Mal tun?';

  @override
  String get routineName => 'Name';

  @override
  String get routineEditTitle => 'Routine bearbeiten';

  @override
  String get routineEditSubtitle => 'Ändere, was sie tut und wann sie läuft.';

  @override
  String get routineRecentRuns => 'Letzte Durchläufe';

  @override
  String get routineNoRuns => 'Sie wurde noch nicht ausgeführt.';

  @override
  String get routineSaved => 'Routine gespeichert';

  @override
  String get routineStarted => 'Routine gestartet';

  @override
  String get routineWebhook => 'Bei Webhook';

  @override
  String get routines => 'Routinen';

  @override
  String get routineAdvancedSummary =>
      'GitHub- und Webhook-Auslöser, Cron, Zeitzone';

  @override
  String get routineRepeatDaily => 'Täglich';

  @override
  String get routineRepeatWeekdays => 'Werktags';

  @override
  String get routineRepeatWeekly => 'Wöchentlich';

  @override
  String get routineDay => 'Tag';

  @override
  String get routineTimeLabel => 'Uhrzeit';

  @override
  String get routineRunsAt => 'Läuft um';

  @override
  String routineTimesIn(String timezone) {
    return 'Zeiten in $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Benutzerdefiniert: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Weitere Auslöser';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Alle $nString Minuten',
      one: 'Jede Minute',
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
      other: 'Alle $nString Stunden',
      one: 'Jede Stunde',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Jede Stunde um :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Täglich um $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Werktags um $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Am Wochenende um $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days um $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Am $day. jeden Monats um $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items und $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'sonntags',
      'mon': 'montags',
      'tue': 'dienstags',
      'wed': 'mittwochs',
      'thu': 'donnerstags',
      'fri': 'freitags',
      'sat': 'samstags',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Sonntag',
      'mon': 'Montag',
      'tue': 'Dienstag',
      'wed': 'Mittwoch',
      'thu': 'Donnerstag',
      'fri': 'Freitag',
      'sat': 'Samstag',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Sieh deinem Bot live bei der Arbeit zu';

  @override
  String get headlessScreenEmpty =>
      'Dieser Computer läuft nur im Browser, um schlank zu bleiben. Du siehst seine Webseiten hier, sobald er eine öffnet. Wechsle zum Desktop, um auch Apps zu sehen und zu steuern.';

  @override
  String get headlessScreenChecking => 'Sucht alle paar Sekunden nach Seiten';

  @override
  String get headlessBrowserOnly => 'Nur Browser';

  @override
  String get switchedToDesktopHere =>
      'Auf Desktop gewechselt. Sein Bildschirm erscheint hier, sobald er bereit ist.';

  @override
  String get desktopBarLabel => 'Desktop · braucht mehr RAM';

  @override
  String get switchToBrowserOnly => 'Zu „nur Browser“ wechseln';

  @override
  String get switchingToBrowserOnly => 'Wechsle zu „nur Browser“…';

  @override
  String get switchedToBrowserOnly =>
      'Zu „nur Browser“ gewechselt. Braucht jetzt weniger RAM.';

  @override
  String get runNow => 'Jetzt ausführen';

  @override
  String get secretName => 'Name';

  @override
  String get secretNameHelp => 'Großbuchstaben, zum Beispiel GITHUB_TOKEN';

  @override
  String get secretValue => 'Wert';

  @override
  String get secrets => 'Geheimnisse';

  @override
  String get serverUrl => 'Server-URL';

  @override
  String get specUrl => 'OpenAPI-Spec-URL';

  @override
  String get startFrom => 'Persona';

  @override
  String get storedEncrypted =>
      'Verschlüsselt gespeichert; wird nie wieder angezeigt';

  @override
  String get taskBlocked => 'Blockiert';

  @override
  String get taskDoing => 'In Arbeit';

  @override
  String get taskDone => 'Erledigt';

  @override
  String get taskTodo => 'Zu erledigen';

  @override
  String get test => 'Testen';

  @override
  String get timezone => 'Zeitzone';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Wiederholt sich';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Durchlauf ansehen';

  @override
  String get webhookCreated => 'Webhook erstellt';

  @override
  String get webhookSecret => 'Signaturgeheimnis';

  @override
  String get webhookShownOnce =>
      'Kopiere das Signaturgeheimnis jetzt. Es wird nur einmal angezeigt.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Verbindung fehlgeschlagen: $error';
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
      other: 'Verbunden, $nString Tools',
      one: 'Verbunden, 1 Tool',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Nächstes Mal: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Nur gesendet an $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'angefragt $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Enthält Routinen: $names.';
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
      other: '$nString Tools',
      one: '1 Tool',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'Der Bot steuert wieder';

  @override
  String get botComputer => 'Computer';

  @override
  String get botComputerDefault =>
      'Sein eigener Computer, falls vorhanden, sonst der Team-Computer';

  @override
  String get botInControl => 'Bot steuert';

  @override
  String get computerName => 'Name';

  @override
  String get computers => 'Computer';

  @override
  String get connectingLive => 'Verbinde…';

  @override
  String get dismiss => 'Schließen';

  @override
  String get renameTopic => 'Umbenennen';

  @override
  String get library => 'Bibliothek';

  @override
  String get navLibrary => 'Bibliothek';

  @override
  String get librarySearchHint => 'Bibliothek durchsuchen';

  @override
  String get libraryFilterAll => 'Alle';

  @override
  String get libraryFilterPages => 'Websites & Spiele';

  @override
  String get libraryFilterImages => 'Bilder';

  @override
  String get libraryFilterVideos => 'Videos';

  @override
  String get libraryFilterAudio => 'Audio';

  @override
  String get libraryFilterDocuments => 'Dokumente';

  @override
  String get libraryFilterFiles => 'Dateien';

  @override
  String get creationKindPage => 'Seite';

  @override
  String get creationKindImage => 'Bild';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Audio';

  @override
  String get creationKindDocument => 'Dokument';

  @override
  String get creationKindFile => 'Datei';

  @override
  String get libraryPinned => 'Angeheftet';

  @override
  String get libraryToday => 'Heute';

  @override
  String get libraryYesterday => 'Gestern';

  @override
  String get libraryThisWeek => 'Diese Woche';

  @override
  String get libraryEarlier => 'Älter';

  @override
  String get videoCantPlay =>
      'Dieses Video lässt sich auf diesem Gerät nicht abspielen.';

  @override
  String get libraryEmptyTitle => 'Was sollen wir zuerst machen?';

  @override
  String get libraryEmptyBody =>
      'Wähle etwas aus und dein Bot legt los. Alles, was deine Bots erstellen, landet automatisch hier.';

  @override
  String get libraryNoMatch => 'Hier passt nichts.';

  @override
  String get libraryStarterGame => 'Ein kleines Spiel';

  @override
  String get libraryStarterGamePrompt =>
      'Mach mir ein kleines Spiel, das ich im Browser spielen kann.';

  @override
  String get libraryStarterLogo => 'Ein Logo';

  @override
  String get libraryStarterLogoPrompt => 'Entwirf ein Logo für mein Projekt.';

  @override
  String get libraryStarterSite => 'Eine einseitige Website';

  @override
  String get libraryStarterSitePrompt =>
      'Erstelle eine einseitige Website für mein Unternehmen.';

  @override
  String get libraryStarterVideo => 'Ein kurzes Video';

  @override
  String get libraryStarterVideoPrompt => 'Erstelle ein kurzes Video von ';

  @override
  String get libraryStarterCard => 'Eine Geburtstagskarte';

  @override
  String get libraryStarterCardPrompt => 'Erstelle eine Geburtstagskarte für ';

  @override
  String get libraryStarterReport => 'Ein Bericht';

  @override
  String get libraryStarterReportPrompt =>
      'Recherchiere und schreibe einen Bericht über ';

  @override
  String get libraryStarterElse => 'Etwas anderes…';

  @override
  String get creationOpen => 'Öffnen';

  @override
  String get creationPlay => 'Abspielen';

  @override
  String get creationView => 'Ansehen';

  @override
  String get creationChangeIt => 'Ändern';

  @override
  String creationChangeDraft(String title) {
    return 'Zu „$title“: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Erstellt von $bot';
  }

  @override
  String creationVersion(int n) {
    return 'Version $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'Aus deinem Chat mit $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Erstellt von $bot';
  }

  @override
  String get creationFromHelp => 'Zur Unterhaltung';

  @override
  String get creationDetails => 'Details';

  @override
  String get creationAlongside => 'Zusammen erstellt';

  @override
  String creationDeleted(String title) {
    return '„$title“ gelöscht';
  }

  @override
  String get showInLibrary => 'In Bibliothek zeigen';

  @override
  String get pinInLibrary => 'In Bibliothek anheften';

  @override
  String get libraryItemNotFound =>
      'Das ist noch nicht in der Bibliothek. Versuch es gleich noch einmal.';

  @override
  String creationPinned(String title) {
    return '„$title“ angeheftet';
  }

  @override
  String creationUnpinned(String title) {
    return '„$title“ gelöst';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Aktualisiert · Version $version';
  }

  @override
  String get madeHere => 'Hier erstellt';

  @override
  String madeHereEmpty(String bot) {
    return '$bot hat noch nichts erstellt.';
  }

  @override
  String get madeHereThisChat => 'In diesem Chat';

  @override
  String madeHereByBot(String bot) {
    return 'Erstellt von $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Anderes von $bot';
  }

  @override
  String madeHereCount(String count) {
    return 'Hier erstellt ($count)';
  }

  @override
  String get sidePanelComputer => 'Computer';

  @override
  String get madeForTicket => 'Für dieses Ticket erstellt';

  @override
  String get libraryCantChangePicked =>
      'Nur die Person, für die es erstellt wurde, oder die Verwalter des Bots können das ändern.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente gelöscht',
      one: '1 Element gelöscht',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ausgewählt',
      one: '1 ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Neueste';

  @override
  String get librarySortOpened => 'Zuletzt geöffnet';

  @override
  String get librarySortName => 'Name';

  @override
  String get libraryScopeMine => 'Für mich erstellt';

  @override
  String get libraryScopeWorkspace => 'Ganzer Workspace';

  @override
  String get libraryFilterSort => 'Sortieren & Filtern';

  @override
  String get creationWhoCanSee => 'Wer es sehen kann';

  @override
  String get libraryTile => 'Bibliothek';

  @override
  String get libraryTileHelp => 'Was er erstellt hat';

  @override
  String get regenerateReply => 'Neu generieren';

  @override
  String get deleteMessage => 'Nachricht löschen';

  @override
  String get deleteMessageTitle => 'Diese Nachricht löschen?';

  @override
  String get deleteMessageBody =>
      'Sie wird für alle in diesem Chat entfernt. Die Nachrichten drumherum bleiben.';

  @override
  String get messageDeleted => 'Nachricht gelöscht';

  @override
  String get findInChat => 'Im Chat suchen';

  @override
  String get findInChatHint => 'In diesem Chat suchen';

  @override
  String findInChatCount(int index, int count) {
    return '$index von $count';
  }

  @override
  String get findInChatNone => 'Keine Treffer';

  @override
  String get findPrevious => 'Vorheriger Treffer';

  @override
  String get findNext => 'Nächster Treffer';

  @override
  String get closeFind => 'Suche schließen';

  @override
  String get pinTopic => 'Anheften';

  @override
  String get unpinTopic => 'Lösen';

  @override
  String get inAppAlertReview => 'Prüfen';

  @override
  String get forBot => 'Für Bot';

  @override
  String get handBack => 'Zurückgeben';

  @override
  String get handBackNote => 'Notiz für den Bot (optional)';

  @override
  String get handBackNoteHint =>
      'Zum Beispiel: Ich habe mich angemeldet, mach weiter';

  @override
  String get live => 'Live';

  @override
  String get liveView => 'Live-Ansicht';

  @override
  String get liveViewHelp =>
      'Sieh diesem Computer live zu und übernimm bei Bedarf die Steuerung.';

  @override
  String get newComputer => 'Neuer Computer';

  @override
  String get newComputerHelp =>
      'Ein privater Computer gehört einem Bot. Seine Dateien bleiben vom Team-Computer getrennt.';

  @override
  String get openLiveView => 'Live-Ansicht öffnen';

  @override
  String get liveExpand => 'Vollbild';

  @override
  String get liveCopy => 'Kopieren';

  @override
  String get liveScreenshot => 'Screenshot';

  @override
  String get liveScreenshots => 'Screenshots';

  @override
  String get liveScreenshotsHelp =>
      'Live-Video kommt nicht durch dieses Netzwerk, daher aktualisiert sich der Bildschirm etwa jede Sekunde.';

  @override
  String get liveReconnecting => 'Verbindung wird wiederhergestellt…';

  @override
  String get liveReconnectingHelp =>
      'Das Live-Video wurde unterbrochen (der Server startet möglicherweise neu). Neuer Versuch läuft; solange siehst du Screenshots.';

  @override
  String get liveTryAgain => 'Erneut versuchen';

  @override
  String get liveDroppedHelp =>
      'Das Live-Video konnte nicht zurückkehren, daher aktualisiert sich der Bildschirm etwa jede Sekunde. Tippe auf Erneut versuchen.';

  @override
  String get liveMore => 'Mehr';

  @override
  String get liveSaveScreenshot => 'Screenshot speichern';

  @override
  String get liveCopyFromComputer => 'Vom Computer kopieren';

  @override
  String get livePasteToComputer => 'Auf dem Computer einfügen';

  @override
  String get liveRotateHint =>
      'Drehe dein Telefon quer für einen größeren Bildschirm';

  @override
  String get liveWatching => 'Zusehen';

  @override
  String get liveCopied => 'Vom Computer kopiert.';

  @override
  String get liveNothingCopied =>
      'Nichts kopiert. Wähle zuerst etwas auf dem Computer aus.';

  @override
  String get livePasteEmpty => 'Deine Zwischenablage ist leer.';

  @override
  String get liveMinimize => 'Zurück in die Seitenleiste';

  @override
  String get liveShownFullScreen =>
      'Die Live-Ansicht ist im Vollbild geöffnet.';

  @override
  String get liveStillWatching => 'Schaust du noch zu?';

  @override
  String get liveStillWatchingHelp =>
      'Der Computer geht in den Ruhezustand, wenn niemand zusieht, um Strom zu sparen.';

  @override
  String get liveKeepWatching => 'Weiter zusehen';

  @override
  String get livePausedToSavePower => 'Zum Stromsparen pausiert';

  @override
  String get livePausedToSavePowerHelp =>
      'Niemand hat zugesehen, daher ruht der Computer. Fortsetzen weckt ihn wieder.';

  @override
  String get liveResume => 'Fortsetzen';

  @override
  String get paused => 'Pausiert';

  @override
  String get pausedUserInControl =>
      'Pausiert: Eine Person steuert den Bildschirm';

  @override
  String get letBotUseTerminal => 'Terminal & Dateien weiter nutzen lassen';

  @override
  String get screenHandedBack => 'Steuerung zurückgegeben';

  @override
  String get privateComputer => 'Privater Computer';

  @override
  String get profileDesktop => 'Desktop';

  @override
  String get profileHeadless => 'Headless';

  @override
  String get rename => 'Umbenennen';

  @override
  String get rightClickNextTap => 'Rechtsklick beim nächsten Tippen';

  @override
  String get screenshotMode =>
      'Screenshots (Live-Video in diesem Netzwerk nicht verfügbar)';

  @override
  String get showKeyboard => 'Tastatur';

  @override
  String get someoneElseInControl => 'Jemand anderes steuert gerade';

  @override
  String get switchToDesktop => 'Zu Desktop wechseln';

  @override
  String get switchToHeadless => 'Zu Headless wechseln';

  @override
  String get switchProfileConfirm =>
      'Der Computer startet zum Wechseln neu. Deine Dateien bleiben erhalten, aber alles, was gerade darauf läuft, stoppt.';

  @override
  String get switchProfileButton => 'Wechseln';

  @override
  String get switchingToDesktop => 'Wechsle zu Desktop…';

  @override
  String get switchingToHeadless => 'Wechsle zu Headless…';

  @override
  String get switchedToDesktop =>
      'Zu Desktop gewechselt. Öffne die Live-Ansicht, um den Bildschirm zu sehen.';

  @override
  String get switchedToHeadless =>
      'Zu Headless gewechselt. Braucht jetzt weniger RAM.';

  @override
  String get takeControl => 'Steuerung übernehmen';

  @override
  String get takeoverCompleted => 'Zurückgegeben';

  @override
  String get takeoverDismissed => 'Abgelehnt';

  @override
  String get takeoverPrivacy =>
      'Solange du steuerst, ist der Bot pausiert und nichts, was du tippst oder siehst, wird an ihn gesendet.';

  @override
  String get liveShellOnTooltip =>
      'Lässt den Bot Terminal und Dateien weiter nutzen, während du steuerst';

  @override
  String get liveShellOffTooltip =>
      'Pausiert auch Terminal und Dateien des Bots, während du steuerst';

  @override
  String get liveShellOnNote =>
      'Der Bot kann Terminal und Dateien weiter nutzen. Er kann den Bildschirm aber erst wieder sehen oder steuern, wenn du die Steuerung zurückgibst.';

  @override
  String get liveShellOffNote =>
      'Der Bot ist vollständig pausiert, bis du die Steuerung zurückgibst.';

  @override
  String get teamComputer => 'Team-Computer';

  @override
  String get withDesktop => 'Mit Desktop';

  @override
  String get withDesktopHelp =>
      'Fügt einen Bildschirm zum live Zusehen hinzu; braucht mehr RAM';

  @override
  String get youAreInControl => 'Du steuerst gerade';

  @override
  String botAsksForHelp(String reason) {
    return 'Der Bot fragt: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot braucht deine Hilfe';
  }

  @override
  String deleteComputerConfirm(String name) {
    return '$name löschen? Seine Dateien, Snapshots und Wiederherstellungspunkte werden ebenfalls gelöscht.';
  }

  @override
  String latencyMs(int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return '$msString ms';
  }

  @override
  String privateComputerOf(String bot) {
    return 'Computer von $bot';
  }

  @override
  String get micPermissionNeeded =>
      'Erlaube den Mikrofonzugriff zum Diktieren.';

  @override
  String get dictationEmpty => 'Es kam keine Sprache an. Versuch es erneut.';

  @override
  String get startCall => 'Sprachanruf starten';

  @override
  String get stopDictation => 'Stoppen und transkribieren';

  @override
  String get dictate => 'Diktieren';

  @override
  String get dictateOnDevice => 'Mit diesem Gerät diktieren';

  @override
  String get stopListening => 'Zuhören stoppen';

  @override
  String get dictationRetry => 'Erneut versuchen';

  @override
  String get dictationSayAgain => 'Nochmal sagen';

  @override
  String get dictationFailed => 'Konnte nicht in Text umgewandelt werden.';

  @override
  String get dictationFailedUseDevice =>
      'Konnte nicht in Text umgewandelt werden. Sag es nochmal, dann hört dein Gerät zu.';

  @override
  String get dictationNoServiceUseDevice =>
      'Diktat ist für diesen Workspace nicht eingerichtet. Stattdessen kann dein Gerät zuhören.';

  @override
  String get dictationDeviceFailed =>
      'Das Diktat deines Geräts funktioniert nicht mehr, daher nutzt das Mikrofon wieder Casama.';

  @override
  String get dictationDevicePermission =>
      'Erlaube die Spracherkennung, um mit diesem Gerät zu diktieren.';

  @override
  String get readAloud => 'Vorlesen';

  @override
  String get callConnecting => 'Verbinde…';

  @override
  String get callLive => 'Live';

  @override
  String get callEnded => 'Anruf beendet';

  @override
  String get callEndedIdle => 'Anruf nach 2 Minuten Stille beendet.';

  @override
  String get callFailed => 'Der Anruf konnte keine Verbindung herstellen.';

  @override
  String get callListening => 'Hört zu';

  @override
  String get callSpeaking => 'Spricht';

  @override
  String get callWorking => 'Arbeitet daran';

  @override
  String get callMutedState => 'Stumm';

  @override
  String get callCaptions => 'Untertitel';

  @override
  String get callSpeaker => 'Lautsprecher';

  @override
  String get callEarpiece => 'Telefon';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Kopfhörer';

  @override
  String get callAudioOutput => 'Anruf wiedergeben über';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Ändert sein Bild',
      'memory_search': 'Durchsucht deine Erinnerungen',
      'memory_write': 'Speichert im Gedächtnis',
      'memory': 'Aktualisiert sein Gedächtnis',
      'knowledge_search': 'Durchsucht dein Wissen',
      'web_search': 'Durchsucht das Web',
      'web': 'Liest eine Seite',
      'browser_open': 'Öffnet eine Website',
      'browser_click': 'Klickt auf der Seite',
      'browser_type': 'Tippt auf der Seite',
      'browser_press': 'Drückt eine Taste',
      'browser_scroll': 'Scrollt auf der Seite',
      'browser_look': 'Sieht sich die Seite an',
      'desktop_click': 'Klickt auf dem Bildschirm',
      'desktop_type': 'Tippt',
      'desktop_press': 'Drückt Tasten',
      'desktop_launch': 'Öffnet eine App',
      'desktop_look': 'Sieht sich den Bildschirm an',
      'shell': 'Arbeitet auf seinem Computer',
      'files_read': 'Liest eine Datei',
      'files_write': 'Schreibt eine Datei',
      'files_list': 'Durchsucht Dateien',
      'files_search': 'Sucht Dateien',
      'files_from_chat': 'Holt eine Datei aus dem Chat',
      'http': 'Kontaktiert einen Dienst',
      'data_search': 'Sucht nach Daten',
      'data_call': 'Ruft Daten ab',
      'skills_load': 'Lädt einen Skill',
      'skills_create': 'Lernt einen neuen Skill',
      'skills_update': 'Verbessert einen Skill',
      'checkpoint': 'Speichert einen Checkpoint',
      'computer_restart': 'Startet seinen Computer neu',
      'takeover': 'Bittet dich zu übernehmen',
      'delegate': 'Fragt einen Helfer',
      'routines_list': 'Prüft deine Routinen',
      'routines_create': 'Richtet eine Routine ein',
      'routines_update': 'Aktualisiert eine Routine',
      'routines_delete': 'Entfernt eine Routine',
      'watchers_create': 'Richtet eine Beobachtung ein',
      'watchers_list': 'Prüft deine Beobachtungen',
      'watchers_delete': 'Entfernt eine Beobachtung',
      'tasks_list': 'Prüft deine Aufgaben',
      'tasks_create': 'Fügt eine Aufgabe hinzu',
      'tasks': 'Aktualisiert deine Aufgaben',
      'notify_user': 'Sendet dir eine Nachricht',
      'usage_report': 'Prüft die Nutzung',
      'device_read': 'Liest deine Gerätedaten',
      'device_access': 'Fragt nach Gerätezugriff',
      'pages_publish': 'Veröffentlicht eine Seite',
      'pages': 'Aktualisiert eine Seite',
      'media': 'Erstellt ein Bild',
      'media_video': 'Erstellt ein Video',
      'bots_create': 'Erstellt einen neuen Bot',
      'bots_update': 'Aktualisiert einen Bot',
      'bots_list': 'Prüft deine Bots',
      'bots_archive': 'Archiviert einen Bot',
      'channel_send': 'Sendet eine Nachricht',
      'links_ask': 'Fragt den Bot eines Kontakts',
      'logins_list': 'Prüft gespeicherte Logins',
      'replay_run': 'Wiederholt gespeicherte Schritte',
      'replay_save': 'Speichert diese Schritte',
      'setup_apply': 'Schlägt eine Einrichtung vor',
      'sidebar_organize': 'Ordnet deine Seitenleiste',
      'suggestions_add': 'Fügt einen Vorschlag hinzu',
      'teach_save_draft': 'Speichert einen Skill-Entwurf',
      'welcome_name': 'Wählt einen Namen',
      'secrets_request': 'Fragt dich nach einem Geheimnis',
      'pages_list': 'Prüft deine Seiten',
      'pages_share': 'Ändert, wer eine Seite sehen kann',
      'projects_create': 'Startet ein Projekt',
      'projects_status': 'Prüft ein Projekt',
      'projects_update': 'Aktualisiert ein Projekt',
      'projects': 'Plant ein Projekt',
      'payments': 'Fragt nach einer Zahlung',
      'voice_call': 'Ruft ein Unternehmen an',
      'voice_call_user': 'Ruft dich an',
      'tools_load': 'Macht sich bereit',
      'ui_show': 'Zeigt dir etwas',
      'start_task': 'Startet das im Chat',
      'adult_sites_turn_on':
          'Fragt nach Freischaltung von Websites für Erwachsene',
      'connections_attach': 'Nutzt jetzt eine App',
      'other': 'Arbeitet daran',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Bild geändert',
      'memory_search': 'Erinnerungen durchsucht',
      'memory_write': 'Im Gedächtnis gespeichert',
      'memory': 'Gedächtnis aktualisiert',
      'knowledge_search': 'Wissen durchsucht',
      'web_search': 'Im Web gesucht',
      'web': 'Seite gelesen',
      'browser_open': 'Website geöffnet',
      'browser_click': 'Auf Seite geklickt',
      'browser_type': 'Auf Seite getippt',
      'browser_press': 'Taste gedrückt',
      'browser_scroll': 'Seite gescrollt',
      'browser_look': 'Seite angesehen',
      'desktop_click': 'Auf Bildschirm geklickt',
      'desktop_type': 'Getippt',
      'desktop_press': 'Tasten gedrückt',
      'desktop_launch': 'App geöffnet',
      'desktop_look': 'Bildschirm angesehen',
      'shell': 'Auf Computer gearbeitet',
      'files_read': 'Datei gelesen',
      'files_write': 'Datei geschrieben',
      'files_list': 'Dateien durchsucht',
      'files_search': 'Dateien gesucht',
      'files_from_chat': 'Datei aus Chat geholt',
      'http': 'Dienst kontaktiert',
      'data_search': 'Nach Daten gesucht',
      'data_call': 'Daten abgerufen',
      'skills_load': 'Skill genutzt',
      'skills_create': 'Neuen Skill gelernt',
      'skills_update': 'Skill verbessert',
      'checkpoint': 'Checkpoint gespeichert',
      'computer_restart': 'Computer neu gestartet',
      'takeover': 'Um Übernahme gebeten',
      'delegate': 'Helfer gefragt',
      'routines_list': 'Routinen geprüft',
      'routines_create': 'Routine eingerichtet',
      'routines_update': 'Routine aktualisiert',
      'routines_delete': 'Routine entfernt',
      'watchers_create': 'Beobachtung eingerichtet',
      'watchers_list': 'Beobachtungen geprüft',
      'watchers_delete': 'Beobachtung entfernt',
      'tasks_list': 'Aufgaben geprüft',
      'tasks_create': 'Aufgabe hinzugefügt',
      'tasks': 'Aufgaben aktualisiert',
      'notify_user': 'Nachricht gesendet',
      'usage_report': 'Nutzung geprüft',
      'device_read': 'Gerätedaten gelesen',
      'device_access': 'Um Gerätezugriff gebeten',
      'pages_publish': 'Seite veröffentlicht',
      'pages': 'Seite aktualisiert',
      'media': 'Bild erstellt',
      'media_video': 'Video erstellt',
      'bots_create': 'Neuen Bot erstellt',
      'bots_update': 'Bot aktualisiert',
      'bots_list': 'Bots geprüft',
      'bots_archive': 'Bot archiviert',
      'channel_send': 'Nachricht gesendet',
      'links_ask': 'Bot eines Kontakts gefragt',
      'logins_list': 'Gespeicherte Logins geprüft',
      'replay_run': 'Gespeicherte Schritte wiederholt',
      'replay_save': 'Schritte gespeichert',
      'setup_apply': 'Einrichtung vorgeschlagen',
      'sidebar_organize': 'Seitenleiste geordnet',
      'suggestions_add': 'Vorschlag hinzugefügt',
      'teach_save_draft': 'Skill-Entwurf gespeichert',
      'welcome_name': 'Namen gewählt',
      'secrets_request': 'Nach Geheimnis gefragt',
      'pages_list': 'Seiten geprüft',
      'pages_share': 'Sichtbarkeit einer Seite geändert',
      'projects_create': 'Projekt gestartet',
      'projects_status': 'Projekt geprüft',
      'projects_update': 'Projekt aktualisiert',
      'projects': 'Projekt geplant',
      'payments': 'Nach Zahlung gefragt',
      'voice_call': 'Unternehmen angerufen',
      'voice_call_user': 'Dich angerufen',
      'tools_load': 'Bereit gemacht',
      'ui_show': 'Etwas gezeigt',
      'start_task': 'Im Chat gestartet',
      'adult_sites_turn_on':
          'Nach Freischaltung von Websites für Erwachsene gefragt',
      'connections_attach': 'App eingebunden',
      'other': 'Erledigt',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Nutzt $app';
  }

  @override
  String toolUsedApp(String app) {
    return '$app genutzt';
  }

  @override
  String get toolDetails => 'Details';

  @override
  String approvalAsking(String bot) {
    return '$bot fragt vorher';
  }

  @override
  String get approvalLookClosely => 'Sieh genau hin, bevor du das erlaubst';

  @override
  String approvalAttachConnection(String app) {
    return '$app nutzen, bereits in diesem Workspace verbunden';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return '$bot das ohne Rückfrage machen lassen';
  }

  @override
  String get pageShareToPublic => 'Alle mit dem Link können es öffnen';

  @override
  String get pageShareToWorkspace =>
      'Alle in diesem Workspace können es öffnen';

  @override
  String get pageShareToPrivate => 'Nur du kannst es öffnen';

  @override
  String approvalAllowedLine(String what) {
    return 'Erlaubt: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Abgelehnt: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Keine rechtzeitige Antwort: $what';
  }

  @override
  String get callToolFailed => 'Das hat nicht geklappt';

  @override
  String get callToolNeedsOk => 'Braucht dein OK zum Fortfahren';

  @override
  String get callToolAllow => 'Erlauben';

  @override
  String get callToolNotNow => 'Nicht jetzt';

  @override
  String get callToolAllowed => 'Erlaubt. Das Ergebnis erscheint im Chat';

  @override
  String get callToolDeclined => 'Du hast „Nicht jetzt“ gewählt';

  @override
  String get callToolBackground =>
      'Arbeitet noch. Das Ergebnis erscheint im Chat';

  @override
  String get callToolInChat => 'Das Ergebnis erscheint im Chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString s';
  }

  @override
  String get callNeedsKeyTitle => 'Anrufe brauchen einen Google-KI-Schlüssel';

  @override
  String get callNeedsKeyBody =>
      'Live-Anrufe laufen über Gemini Live von Google, daher braucht dieser Workspace einen Google-KI-Schlüssel. Er wird nur für Anrufe genutzt: Vorlesen, Diktat, Bilder und Video laufen über OpenRouter. Google stellt dir im AI Studio kostenlos einen bereit: Erstelle ihn dort, füge ihn unter Modellschlüssel hinzu, und Anrufe klappen sofort. Nur Workspace-Inhaber und Admins können Schlüssel hinzufügen.';

  @override
  String get callAddKey => 'Google-KI-Schlüssel hinzufügen';

  @override
  String get callGetFreeKey => 'Kostenlosen Schlüssel von Google holen';

  @override
  String get callMicUnmute => 'Mikro an';

  @override
  String get videoUnmute => 'Ton an';

  @override
  String get callMicMute => 'Mikro aus';

  @override
  String get videoMute => 'Ton aus';

  @override
  String get hangUp => 'Auflegen';

  @override
  String callWith(String bot) {
    return 'Anruf mit $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'Anruf mit $from beenden und $to anrufen?';
  }

  @override
  String get callSwitchBody =>
      'Du kannst nur einen Anruf gleichzeitig führen. Der aktuelle Anruf wird zuerst in seinem Chat gespeichert.';

  @override
  String get callSwitchConfirm => 'Beenden und anrufen';

  @override
  String get callVoiceConsentTitle => 'Deine Stimme geht an Google';

  @override
  String get callVoiceConsentBody =>
      'Bei einem Anruf sendet Casama deine Stimme und das Gesagte an Google Gemini, das dich hört und die Antworten deines Bots spricht. Die Wörter des Anrufs gehen über OpenRouter auch an das KI-Modell, das dein Bot nutzt. Bis du zustimmst, wird nichts gesendet. Du kannst das jederzeit unter Einstellungen › Datenschutz beenden.';

  @override
  String get callVoiceConsentAgree => 'Zustimmen und anrufen';

  @override
  String get callVoiceConsentNotNow => 'Nicht jetzt';

  @override
  String get callEndedLost =>
      'Der Anruf wurde beendet, weil die Verbindung zu lange unterbrochen war.';

  @override
  String get callMinimize => 'Minimieren';

  @override
  String get callEndCall => 'Anruf beenden';

  @override
  String get callEndAndAnswer => 'Beenden und annehmen';

  @override
  String get callReconnecting => 'Verbindung wird wiederhergestellt…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Minuten',
      one: '1 Minute',
      zero: 'unter einer Minute',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Anruf mit $bot, $time, tippen zum Zurückkehren';
  }

  @override
  String callReturnBar(String bot) {
    return 'Im Anruf mit $bot, tippen zum Zurückkehren';
  }

  @override
  String get callOpen => 'Anruf öffnen';

  @override
  String get callOnHold => 'Gehalten';

  @override
  String get callNotificationLive => 'Im Anruf';

  @override
  String get callNotificationMuted => 'Stummgeschaltet';

  @override
  String get callNotificationChannel => 'Anrufe';

  @override
  String callTabTitle(String time) {
    return 'Im Anruf · $time';
  }

  @override
  String get callMenuShow => 'Anruf zeigen';

  @override
  String get callJobWorking => 'Arbeitet daran';

  @override
  String callJobStrip(String task) {
    return 'Arbeitet an: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Braucht dich: $task';
  }

  @override
  String get callTileWatching => 'Live-Ansicht';

  @override
  String get callTileDone => 'Erledigt';

  @override
  String get callTileNeedsYou => 'Braucht dich';

  @override
  String callTileLabel(String state) {
    return 'Bildschirm des Bots, $state. Tippen für Vollbild';
  }

  @override
  String get callTileHide => 'Bildschirm ausblenden';

  @override
  String get screenCardLive => 'live';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Bildschirm von $bot, $state';
  }

  @override
  String get screenCardOpen => 'Im Vollbild öffnen';

  @override
  String get screenCardYouHave => 'Du steuerst den Bildschirm';

  @override
  String screenCardHeldBy(String name) {
    return '$name steuert den Bildschirm';
  }

  @override
  String get screenCardMore => 'Weitere Optionen';

  @override
  String screenCardIntro(String bot) {
    return 'Bildschirm von $bot. Tippen zum Zusehen, ziehen zum Verschieben.';
  }

  @override
  String get screenCardHideForNow => 'Vorerst ausblenden';

  @override
  String get screenCardDontShow => 'Nicht automatisch zeigen';

  @override
  String get screenCardTurnedOff =>
      'Die Bildschirmansicht ist aus. Aktiviere sie in den Einstellungen wieder.';

  @override
  String get screenCardOfferOff =>
      'Blendest du die Bildschirmansicht oft aus? Du kannst sie ausschalten.';

  @override
  String get screenCardTurnOff => 'Ausschalten';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot braucht dich auf dem Bildschirm';
  }

  @override
  String callRecapTitle(String length) {
    return 'Anruf · $length';
  }

  @override
  String get callRecapStarted => 'Im Anruf gestartet';

  @override
  String get callRecapTaskDone => 'Erledigt';

  @override
  String get callRecapTaskFailed => 'Nicht fertiggeworden';

  @override
  String get callRecapTaskStopped => 'Gestoppt';

  @override
  String get callRecapTaskRunning => 'Arbeitet noch';

  @override
  String get callRecapOpenRun => 'Sehen, was er getan hat';

  @override
  String get summarizeCalls => 'Anrufe zusammenfassen';

  @override
  String get summarizeCallsHelp =>
      'Nach jedem Anruf zeigt seine Karte, worum es ging und was als Nächstes ansteht. Nutzt etwas vom kleinen Modell des Bots.';

  @override
  String callCardVoice(String length) {
    return 'Sprachanruf · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Telefonanruf · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Anruf abgebrochen · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Verpasster Anruf von $name';
  }

  @override
  String callCardLive(String name) {
    return 'Im Anruf mit $name';
  }

  @override
  String get callCardLiveElsewhere => 'Auf anderem Gerät im Anruf';

  @override
  String get callCardReturn => 'Zurück zum Anruf';

  @override
  String callCardBotHungUp(String name) {
    return '$name hat aufgelegt';
  }

  @override
  String get callCardEndedQuiet => 'Nach längerer Stille beendet';

  @override
  String get callCardEndedLimit => 'Am Anruflimit beendet';

  @override
  String get callCardWritingSummary => 'Zusammenfassung wird geschrieben…';

  @override
  String callCardSummaryBy(String name) {
    return 'Zusammenfassung von $name';
  }

  @override
  String get callCardNextSteps => 'Nächste Schritte';

  @override
  String get callCardDoIt => 'Machen';

  @override
  String get callCardDismissStep => 'Schließen';

  @override
  String get callCardStepStarted => 'Gestartet';

  @override
  String get callCardStepFailed =>
      'Konnte das nicht starten. Versuch es erneut.';

  @override
  String get callCardDoneOnCall => 'Im Anruf erledigt';

  @override
  String callCardMore(int count) {
    return '$count weitere';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Transkript · $count Beiträge',
      one: 'Transkript · 1 Beitrag',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Transkript';

  @override
  String get callCardSearchTranscript => 'Transkript durchsuchen';

  @override
  String get callCardNoMatches => 'Keine Treffer';

  @override
  String get callCardYou => 'Du';

  @override
  String get callCardCallBack => 'Zurückrufen';

  @override
  String get callCardCopy => 'Kopieren';

  @override
  String get callCardCopied => 'Kopiert';

  @override
  String get callCardShare => 'Teilen';

  @override
  String get callCardMoreActions => 'Mehr';

  @override
  String get callCardDelete => 'Anruf löschen';

  @override
  String get callCardDeleteTitle => 'Diesen Anruf löschen?';

  @override
  String get callCardDeleteBody =>
      'Seine Karte und das Transkript werden aus diesem Chat entfernt. Gestartete Aufgaben behalten ihre Ergebnisse.';

  @override
  String get callCardDeleted => 'Anruf gelöscht';

  @override
  String get callCardDeleteFailed => 'Anruf konnte nicht gelöscht werden';

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

    return 'Antwort gestartet in $msString ms';
  }

  @override
  String get voiceSettings => 'Stimme';

  @override
  String get voiceSettingsHelp =>
      'Vorlesestimme und die Tools, die ein Bot bei Anrufen hat';

  @override
  String get callTools => 'Tools bei Anrufen';

  @override
  String get callToolsHelp =>
      'Anrufe enthalten bereits Gedächtnis, Websuche, Notizen an dich, Routinen und Tickets und übergeben größere Aufgaben an den Chat. Füge Tools verbundener Apps hinzu, die der Bot live nutzen soll; jedes erhöht die Kosten jedes Anrufs etwas.';

  @override
  String get callToolsNone =>
      'Dieser Bot hat noch keine verbundenen Apps aktiviert. Aktiviere eine unter Verbindungen und wähle dann hier seine Tools.';

  @override
  String get openIntegrations => 'Integrationen öffnen';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tools verbundener Apps hinzugefügt',
      one: '1 Tool einer verbundenen App hinzugefügt',
      zero: 'Nur die integrierten Sprach-Tools',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'Stimmen-ID (optional)';

  @override
  String get voiceIdHelp =>
      'Ein Gemini-Stimmenname wie Kore oder Puck; leer nutzt Kore';

  @override
  String get useThisComputer => 'Diesen Computer für Bots nutzen';

  @override
  String get companionDesktopOnly =>
      'Nur die Desktop-App (macOS, Windows, Linux) kann als Bot-Computer dienen.';

  @override
  String get companionIntro =>
      'Lass ausgewählte Bots auf diesem Computer arbeiten: Befehle ausführen, Dateien in von dir gewählten Ordnern bearbeiten, surfen und Apps nutzen. Alles, was sie tun, siehst du auf dem Bildschirm und kannst es stoppen. Aus, bis du jede Funktion freigibst.';

  @override
  String get thisComputer => 'Dieser Computer';

  @override
  String get companionOnline =>
      'Ein: Bots, denen du es erlaubst, können diesen Computer nutzen';

  @override
  String get companionError => 'Casama nicht erreichbar; neuer Versuch';

  @override
  String get companionOff => 'Aus';

  @override
  String get companionCapabilities => 'Was Bots tun dürfen';

  @override
  String get companionCapabilitiesHelp =>
      'Gib jede einzeln frei. Riskante Aktionen fragen immer nach, unabhängig von der Autonomie des Bots.';

  @override
  String get capShell => 'Befehle ausführen (in geteilten Ordnern)';

  @override
  String get capFiles => 'Dateien in geteilten Ordnern lesen und bearbeiten';

  @override
  String get capBrowser =>
      'Browser nutzen (einen eigenen, getrennt von deinem)';

  @override
  String get capDesktop => 'Desktop-Apps nutzen';

  @override
  String get sharedFolders => 'Geteilte Ordner';

  @override
  String get sharedFoldersHelp => 'Bots können nur auf diese Ordner zugreifen.';

  @override
  String get addFolder => 'Ordner hinzufügen';

  @override
  String get botsAllowed => 'Erlaubte Bots';

  @override
  String get botsAllowedHelp =>
      'Erlaubte Bots können auch auf diesem Computer arbeiten. Jeder behält seinen eigenen Computer und nutzt diesen, sofern eine Aufgabe nicht diesen hier braucht.';

  @override
  String get worksOnTitle => 'Läuft auf';

  @override
  String worksOnSubtitle(String bot) {
    return 'Wo $bot Befehle ausführt, Dateien nutzt und für dich surft.';
  }

  @override
  String get worksOnAuto => 'Automatisch';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot wählt bei jedem Schritt: seinen eigenen Computer, sofern die Aufgabe nicht deinen braucht.';
  }

  @override
  String get worksOnBot => 'Nur der Computer des Bots';

  @override
  String get worksOnBotHelp => 'Dein Computer wird gar nicht genutzt.';

  @override
  String get worksOnMine => 'Nur mein Computer';

  @override
  String get worksOnMineHelp =>
      'Alles läuft auf deinem Computer, daher muss er eingeschaltet sein.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Alles läuft auf $computer, daher muss er eingeschaltet sein.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Läuft auf: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Wo $bot arbeitet';
  }

  @override
  String get placesSubtitle =>
      'Wähle den Computer, den du hier ansehen möchtest. „Läuft auf“ bestimmt, wo der Bot arbeitet.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Zeige $computer. Läuft auf: $mode. Ändern';
  }

  @override
  String get placeYoursOnline => 'Dein Computer · Online';

  @override
  String get placeYoursOffline => 'Dein Computer · Offline';

  @override
  String get placeTeamComputer => 'Team-Computer';

  @override
  String placeBotsOwn(String bot) {
    return 'Eigener Computer von $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action auf $computer';
  }

  @override
  String get botYourComputer => 'Dein Computer';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone => 'Auf keinem deiner Computer erlaubt';

  @override
  String botYourComputerHow(String bot) {
    return 'Damit $bot auch auf deinem Computer arbeiten darf, öffne Casama auf diesem Computer und aktiviere es unter Einstellungen → Diesen Computer für Bots nutzen → Erlaubte Bots. Er behält trotzdem seinen eigenen Computer.';
  }

  @override
  String get routineWhere => 'Wo sie arbeitet';

  @override
  String get routineWhereHelp =>
      'Wo diese Routine Befehle ausführt und Dateien nutzt.';

  @override
  String get routineWhereBot => 'Computer des Bots';

  @override
  String get routineWhereBotHelp =>
      'Läuft unabhängig davon, ob dein Computer eingeschaltet ist.';

  @override
  String get routineWhereMine => 'Mein Computer, wenn er an ist';

  @override
  String get routineWhereMineHelp =>
      'Für Arbeit an deinen eigenen Dateien und Apps. Ein Durchlauf meldet es, wenn der Computer aus war.';

  @override
  String get computerBotsAllowed => 'Erlaubte Bots';

  @override
  String get unpairComputer =>
      'Diesen Computer nicht mehr nutzen und entkoppeln';

  @override
  String botActingHere(String bot, String action) {
    return '$bot arbeitet auf diesem Computer: $action';
  }

  @override
  String get quickAsk => 'Schnellanfrage';

  @override
  String get quickAskHint => 'Frag einen Bot irgendetwas…';

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
  String get cloudModelsTitle => 'Cloud-Modelle';

  @override
  String get cloudModelsHelp =>
      'Gilt innerhalb von Sekunden für jeden Cloud-Server.';

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
  String get connectionsTitle => 'App-Verbindungen';

  @override
  String get connectionsServerComposio => 'Composio-Konto von Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Apps ohne eigene Anmeldung verbinden sich mit einem Klick über das Composio-Konto dieses Servers.';

  @override
  String get connectionsOwnAccounts => 'Eigene Konten der Nutzer';

  @override
  String get connectionsOwnAccountsHelp =>
      'Jeder nutzt sein eigenes Composio, Pipedream oder Zapier.';

  @override
  String get connectionsNoComposioKey =>
      'Füge diesem Server COMPOSIO_API_KEY hinzu, um das Konto von Casama zu nutzen.';

  @override
  String get connectionsGoogleTitle => 'Google-Apps';

  @override
  String get connectionsGoogleComposio => 'Über Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Kalender, Drive und mehr funktionieren sofort.';

  @override
  String get connectionsGoogleDirect => 'Eigene Server von Google';

  @override
  String get connectionsGoogleDirectHelp =>
      'Erfordert die Teilnahme an der Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Nur der Instanzinhaber kann die Admin-Konsole öffnen.';

  @override
  String get runs24h => 'Durchläufe (24 Std.)';

  @override
  String get failedRuns24h => 'Fehlgeschlagene Durchläufe (24 Std.)';

  @override
  String get cost24h => 'Ausgaben (24 Std.)';

  @override
  String get computersRunning => 'Laufende Computer';

  @override
  String get devicesOnline => 'Persönliche Computer online';

  @override
  String get editQuotas => 'Kontingente bearbeiten';

  @override
  String get maxBots => 'Bot-Limit';

  @override
  String get monthlyUsd => 'Monatliches Ausgabenlimit (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest ist verfügbar (du nutzt $current)';
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
      other: '$nString Workspaces',
      one: '1 Workspace',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'angemeldet $when';
  }

  @override
  String quotasFor(String name) {
    return 'Kontingente für $name';
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
      other: '$nString Mitglieder',
      one: '1 Mitglied',
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
      other: '$nString Bots',
      one: '1 Bot',
    );
    return '$_temp0';
  }

  @override
  String cost30d(String usd) {
    return '$usd in 30 Tagen';
  }

  @override
  String get connectingToServer => 'Verbinde mit Casama…';

  @override
  String get cannotReachServer => 'Dein Casama-Server ist nicht erreichbar';

  @override
  String get connectionFailed =>
      'Dein Casama-Server ist nicht erreichbar. Prüfe deine Verbindung und versuch es erneut.';

  @override
  String get serverNotResponding =>
      'Dein Casama-Server antwortet gerade nicht. Versuch es gleich noch einmal.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Prüfe deine Verbindung oder ob der Server unter $url läuft.';
  }

  @override
  String get serverUnreachableBody =>
      'Prüfe, ob du online bist. Falls ja, startet der Server vielleicht neu – wir versuchen es weiter.';

  @override
  String retryingIn(int seconds) {
    return 'Neuer Versuch in $seconds s';
  }

  @override
  String get retryingNow => 'Versuche…';

  @override
  String get upgradeTitle => 'Abo upgraden';

  @override
  String get notNow => 'Nicht jetzt';

  @override
  String get seePlans => 'Abos ansehen';

  @override
  String get billing => 'Abrechnung';

  @override
  String get billingOffSelfHosted =>
      'Die Abrechnung ist auf diesem Server deaktiviert. Er läuft mit eigener Lizenz: Für eine Person ist die private Nutzung kostenlos, Teams nutzen eine Business-Lizenz.';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get restoreStarted => 'Prüfe deine Käufe…';

  @override
  String get plans => 'Abos';

  @override
  String get currentPlan => 'Aktuelles Abo';

  @override
  String subscribeFor(String price) {
    return 'Abonnieren für $price';
  }

  @override
  String get subscribeOnWeb => 'Im Web abonnieren';

  @override
  String get credits => 'Credits';

  @override
  String get creditHistory => 'Credit-Verlauf';

  @override
  String get creditReasonPurchase => 'Credits gekauft';

  @override
  String get creditReasonGrant => 'Credits hinzugefügt';

  @override
  String get creditReasonRefund => 'Erstattung';

  @override
  String get creditReasonAdjustment => 'Anpassung';

  @override
  String get creditReasonExpire => 'Credits abgelaufen';

  @override
  String limitBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bots',
      one: '1 Bot',
    );
    return '$_temp0';
  }

  @override
  String get limitBotsUnlimited => 'Unbegrenzte Bots';

  @override
  String get unlimitedValue => 'Unbegrenzt';

  @override
  String trialDaysFree(int n) {
    return '$n Tage kostenlos';
  }

  @override
  String get extraPeople => 'Zusätzliche Personen';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price pro Person und Monat, zusätzlich zu den $seats, die dein Abo enthält.';
  }

  @override
  String get extraPeopleSaved => 'Zusätzliche Personen aktualisiert';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString Computerstunden pro Monat';
  }

  @override
  String limitCredits(String amount) {
    return '$amount Credits pro Monat';
  }

  @override
  String get viaWeb => 'Über das Web abgerechnet';

  @override
  String get viaAppStore => 'Über den App Store abgerechnet';

  @override
  String get viaGooglePlay => 'Über Google Play abgerechnet';

  @override
  String get yourPlan => 'Dein Abo';

  @override
  String planEndsOn(String date) {
    return 'Endet am $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Verlängert sich am $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Credits: $amount';
  }

  @override
  String get manageSubscription => 'Abo verwalten';

  @override
  String get compViaCasama => 'Kostenlos von Casama';

  @override
  String compFreeUntil(String date) {
    return 'Kostenlos bis $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Testkauf. Es gelten Tester-Limits: $credits Credits pro Monat und $daily pro Tag.';
  }

  @override
  String compKeepPlan(String plan) {
    return '$plan behalten';
  }

  @override
  String get haveGiftCode => 'Du hast einen Geschenkcode?';

  @override
  String get redeemCodeTitle => 'Geschenkcode einlösen';

  @override
  String get redeemCodeIntro =>
      'Gib den Code ein, den du erhalten hast. Das Abo geht ohne Kosten an den Workspace, den du wählst.';

  @override
  String get redeemCodeLabel => 'Geschenkcode';

  @override
  String get redeemCodeChecking => 'Prüfe…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months Monate $plan, kostenlos',
      one: '1 Monat $plan, kostenlos',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'Dieser Code existiert nicht oder ist nicht mehr gültig.';

  @override
  String get redeemCodeWorkspace => 'Workspace';

  @override
  String get redeemCodeSubmit => 'Einlösen';

  @override
  String get redeemCodeFinePrint =>
      'Ein Geschenkcode pro Person. Wenn er endet, wechselt der Workspace ins Kostenlos-Abo, sofern du kein Abo wählst.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan gehört dir';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Dein Workspace hat $plan kostenlos bis $date. Öffne Casama auf einem beliebigen Gerät, um es zu nutzen.';
  }

  @override
  String get redeemCodeOpenBilling => 'Abrechnung öffnen';

  @override
  String get redeemCodeNoWorkspace =>
      'Ein Geschenkcode gilt für einen Workspace, der dir gehört. Erstelle zuerst einen und öffne den Link dann erneut.';

  @override
  String get redeemCodeUnavailable =>
      'Das ist in dieser App-Version nicht verfügbar.';

  @override
  String usageComputerHours(String hours) {
    return 'Cloud-Computer: $hours Std.';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Live-Ansicht: $minutes Min.';
  }

  @override
  String get thisMonth => 'Dieser Monat';

  @override
  String get noBillableUsage => 'Noch keine abrechenbare Nutzung.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Verbinde ein selbst gehostetes Casama mit diesem Workspace. Eine öffentliche Adresse und Benachrichtigungen sind kostenlos; Cloud-Computer und Modell-Credits werden hier abgerechnet.';

  @override
  String get linkCloudNewKey => 'Neuer Casama Link-Schlüssel';

  @override
  String get linkCloudKeyCreated => 'Schlüssel erstellt';

  @override
  String get linkCloudKeyOnce =>
      'Kopiere ihn jetzt; er wird nur einmal angezeigt. Setze ihn auf deinem Server mit CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Kopieren';

  @override
  String get revoke => 'Widerrufen';

  @override
  String get instanceName => 'Servername';

  @override
  String get server => 'Server';

  @override
  String get serverAddress => 'Serveradresse';

  @override
  String get serverAddressInvalid =>
      'Gib eine Serveradresse wie https://casama.example.com oder http://192.168.1.20:8080 ein.';

  @override
  String get connect => 'Verbinden';

  @override
  String get changeServer => 'Anderen Server verwenden';

  @override
  String serverIs(String host) {
    return 'Server: $host';
  }

  @override
  String get continueWithSso => 'Mit SSO fortfahren';

  @override
  String get workEmail => 'Geschäftliche E-Mail';

  @override
  String get privacy => 'Datenschutz';

  @override
  String get exportMyData => 'Meine Daten exportieren';

  @override
  String get exportMyDataHelp =>
      'Bots, Chats, Durchläufe, Erinnerungen und Einstellungen. Keine Geheimnisse.';

  @override
  String exportReady(String kb) {
    return 'Export bereit ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Durchlaufverlauf aufbewahren für';

  @override
  String get runHistoryRetentionHelp =>
      'Ältere Durchlaufereignisse werden automatisch gelöscht.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Mein Konto löschen';

  @override
  String get deleteAccountHelp =>
      'Löscht deine Daten nach einer kurzen Übergangsfrist.';

  @override
  String get deleteAccountQuestion => 'Dein Konto löschen?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Workspaces, bei denen du alleiniger Inhaber bist, werden mit deinem Konto gelöscht, einschließlich ihrer Bots und Computer. Ein im Web gekauftes Abo wird automatisch gekündigt. Ein im App Store oder bei Google Play gekauftes Abo nicht: Kündige es im jeweiligen Store. Gib $email zur Bestätigung ein.';
  }

  @override
  String get accountDeleted => 'Konto zur Löschung vorgemerkt';

  @override
  String accountDeletedBody(String date) {
    return 'Du wurdest abgemeldet. Deine Daten werden am $date gelöscht.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Schritte',
      one: '1 Schritt',
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
      other: '$countString frühere Schritte zeigen',
      one: '1 früheren Schritt zeigen',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Kopiert';

  @override
  String get jumpToLatest => 'Zum Neuesten springen';

  @override
  String get chatViewFullTable => 'Vollständige Tabelle ansehen';

  @override
  String get chatTableTitle => 'Tabelle';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Frag $bot irgendetwas oder tippe unten auf eine Idee, um loszulegen.';
  }

  @override
  String get suggestPlanDay => 'Hilf mir, meinen Tag zu planen';

  @override
  String get suggestWriteMessage => 'Hilf mir, eine Nachricht zu schreiben';

  @override
  String get suggestExplain => 'Schlage etwas nach und erkläre es einfach';

  @override
  String get suggestCapabilities => 'Wobei kannst du mir helfen?';

  @override
  String connectedAppSummary(String app) {
    return '$app verbunden';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama hat diesen Server nicht geprüft. Verbinde ihn nur, wenn du $host vertraust.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama hat diesen Server nicht geprüft. Verbinde ihn nur, wenn du vertraust, wer ihn betreibt.';

  @override
  String get serverAddressLabel => 'Serveradresse';

  @override
  String get serverAddressHelp =>
      'Füge die Adresse des Servers ein. Enthält sie einen Schlüssel, wird dieser verschlüsselt gespeichert und bleibt aus dem Chat heraus.';

  @override
  String get serverChecking => 'Server wird geprüft…';

  @override
  String serverSignInOn(String host) {
    return 'Du meldest dich auf $host an.';
  }

  @override
  String get serverUseKey => 'Stattdessen Schlüssel verwenden';

  @override
  String get serverUseSignIn => 'Stattdessen anmelden';

  @override
  String serverSignInUnavailable(String name) {
    return '$name unterstützt keine Browser-Anmeldung über diesen Casama-Server. Verwende einen Schlüssel.';
  }

  @override
  String get serverNoSignIn => 'Dieser Server funktioniert ohne Anmeldung.';

  @override
  String get serverHeaderLabel => 'Header-Name (optional)';

  @override
  String get serverToolsTitle => 'Nutzbare Tools';

  @override
  String get serverToolsHelp =>
      'Schalte alle aus, die du nicht möchtest. Bots fragen vor riskanten Schritten weiterhin nach.';

  @override
  String addedInChatBy(String bot) {
    return 'Im Chat hinzugefügt von $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name läuft auf deinem eigenen Computer. Öffne Casama auf diesem Computer und aktiviere „Diesen Computer für Bots nutzen“, um ihn hinzuzufügen.';
  }

  @override
  String get connectAppsTitle => 'Verbinde deine Apps';

  @override
  String get moreApps => 'Mehr';

  @override
  String addAppTile(String app) {
    return '$app zu diesem Bot hinzufügen';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app zu $bot hinzugefügt';
  }

  @override
  String get connectAppsHint =>
      'Lass mich in den Tools lesen und handeln, die du bereits nutzt.';

  @override
  String connectAppTile(String app) {
    return '$app verbinden';
  }

  @override
  String get showComputer => 'Computer zeigen';

  @override
  String get hideComputer => 'Computer ausblenden';

  @override
  String get moreActions => 'Mehr';

  @override
  String get noConversations => 'Noch keine Unterhaltungen';

  @override
  String get untitledChat => 'Neue Unterhaltung';

  @override
  String get listening => 'Hört zu…';

  @override
  String get orLabel => 'oder';

  @override
  String get notificationsPrimerBubble => 'Verpasse nichts!';

  @override
  String get notificationsPrimerTitle => 'Benachrichtigungen aktivieren';

  @override
  String get notificationsPrimerBody =>
      'Deine Bots melden sich, wenn sie eine Entscheidung von dir brauchen oder ihre Arbeit fertig ist.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome blockiert Benachrichtigungen für diese Website. Erlaube sie über das Schloss in der Adressleiste und tippe dann erneut auf Aktivieren.';

  @override
  String get notificationsTurnOn => 'Aktivieren';

  @override
  String get autoUpdates => 'Automatisch aktualisieren';

  @override
  String get autoUpdatesHelp => 'Installiert neue Versionen beim Beenden.';

  @override
  String get upToDate => 'Casama ist aktuell';

  @override
  String get noReleasesToCheck =>
      'Für diesen Computer wurde noch kein Release veröffentlicht, daher gibt es nichts zum Vergleichen.';

  @override
  String updateReady(String version) {
    return 'Casama $version ist verfügbar';
  }

  @override
  String appVersion(String version) {
    return 'Version $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Neu in Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Verstanden';

  @override
  String get whatsNewSubtitle =>
      'Das hat sich seit deinem letzten Update geändert.';

  @override
  String get whatsNew010Calls =>
      'Rufe deine Bots an und besprich Dinge direkt. Sie antworten laut, mit Untertiteln.';

  @override
  String get whatsNew010Looks =>
      'Mach Casama zu deinem: Themes, Farbschemata, Schriften und Hintergrundbilder unter Einstellungen → Erscheinungsbild, mit mehr aus der Galerie.';

  @override
  String get whatsNew010AboutYou =>
      'Erzähle deinen Bots einmal etwas über dich, unter Einstellungen → Über dich: wie sie dich nennen sollen und wie du Antworten magst.';

  @override
  String get whatsNew010SignIn =>
      'Melde dich mit Passkey, Apple, Google oder einem Code aus deiner E-Mail an.';

  @override
  String get openAtLogin => 'Bei Anmeldung öffnen';

  @override
  String get openAtLoginHelp =>
      'Bereit für das Tastenkürzel der Schnellanfrage.';

  @override
  String get signInTagline =>
      'Teamkollegen, die weiterarbeiten, nachdem du die App geschlossen hast.';

  @override
  String get signInTagline2 => 'Lerne deine KI-Crew kennen.';

  @override
  String get signInTagline3 => 'KI, die nicht nur redet, sondern anpackt.';

  @override
  String get signInTagline4 =>
      'Fähige Teamkollegen, die vor dem Handeln fragen.';

  @override
  String get signInTagline5 => 'Abgeben. Zurückkommen, wenn es erledigt ist.';

  @override
  String get noBotsHelp =>
      'Ein Bot ist ein Teamkollege mit eigenem Computer. Erstelle einen, um zu chatten.';

  @override
  String get newBotSubtitle =>
      'Ein Teamkollege mit eigenem Computer und Gedächtnis.';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI oder ein anderer kompatibler Anbieter';

  @override
  String get signOutConfirm =>
      'Du kannst dich jederzeit wieder anmelden; deine Bots arbeiten weiter.';

  @override
  String get roleOwner => 'Inhaber';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get roleMember => 'Mitglied';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeSystem => 'System';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get createWorkspaceBody =>
      'Ein Workspace enthält deine Bots, ihre Computer und die Menschen, mit denen du zusammenarbeitest.';

  @override
  String get workspaceNameHint => 'Mein Team';

  @override
  String get orJoinWithCode => 'oder mit Einladungscode beitreten';

  @override
  String get getOpenRouterKey => 'OpenRouter-Schlüssel holen';

  @override
  String get createFirstBotBody =>
      'Gib ihm einen Namen und ein Modell. Beides kannst du später ändern.';

  @override
  String stepOf(int step, int total) {
    return 'Schritt $step von $total';
  }

  @override
  String get providerHintOpenRouter => 'empfohlen: Chat, Bilder, Video, Stimme';

  @override
  String get providerHintGoogle => 'nur Live-Anrufe';

  @override
  String get providerHintCompatible => 'Jede OpenAI-kompatible API';

  @override
  String get providerHintSearch => 'Websuche';

  @override
  String get noRoutinesHelp =>
      'Eine Routine ist Arbeit, die ein Bot später selbstständig erledigt: einmal zu einer gewählten Zeit, nach Zeitplan oder wenn ein Webhook eintrifft.';

  @override
  String get routineOnce => 'Einmal';

  @override
  String lastRun(String when) {
    return 'Zuletzt: $when';
  }

  @override
  String get routineOff => 'Aus';

  @override
  String get routineEnds => 'Endet';

  @override
  String get routineEndsNever => 'Nie';

  @override
  String get routineEndsOnDate => 'An einem Datum';

  @override
  String get routineEndsAfterRuns => 'Nach einigen Durchläufen';

  @override
  String get routineEndDate => 'Letzter Tag';

  @override
  String get routineRunCountLabel => 'Durchläufe';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Durchläufe',
      one: '1 Durchlauf',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Endet $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Durchläufe übrig',
      one: '1 Durchlauf übrig',
      zero: 'Keine Durchläufe übrig',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Wann sie endet';

  @override
  String get routineEndTitle => 'Wann sie endet';

  @override
  String get routineEndSubtitle =>
      'Sie schaltet sich dann selbst aus. Eine neue Anzahl von Durchläufen zählt ab jetzt.';

  @override
  String deleteRoutineTitle(String name) {
    return '„$name“ löschen?';
  }

  @override
  String get deleteRoutineBody =>
      'Sie läuft nicht erneut. Bereits gepostete Ergebnisse bleiben in der Unterhaltung.';

  @override
  String get triggerOnce => 'Einmal';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'In $nString Min.';
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
      other: 'In $nString Stunden',
      one: 'In 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Morgen, $time';
  }

  @override
  String get integrationNeedsName =>
      'Gib ihm einen Namen mit mindestens einem Buchstaben.';

  @override
  String integrationNeedsField(String field) {
    return 'Fülle $field zum Speichern aus.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Gespeichert als $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Verwende eine vollständige Adresse, die mit https:// beginnt';

  @override
  String get openFile => 'Öffnen';

  @override
  String get saveFile => 'Speichern';

  @override
  String get shareFile => 'Teilen';

  @override
  String savedFile(String name) {
    return '$name gespeichert';
  }

  @override
  String noAppToOpen(String name) {
    return 'Keine App auf diesem Gerät öffnet $name. Speichere sie stattdessen.';
  }

  @override
  String get previewUnavailable =>
      'Keine Vorschau für diesen Dateityp. Öffne oder speichere sie zum Ansehen.';

  @override
  String get openInSystemPlayer => 'In deinem Videoplayer öffnen';

  @override
  String get playMedia => 'Abspielen';

  @override
  String get fullScreen => 'Vollbild';

  @override
  String get exitFullScreen => 'Vollbild beenden';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '1 Seite',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Im Browser öffnen';

  @override
  String get convertingToPdf => 'Vorschau wird vorbereitet…';

  @override
  String tableFirstRows(int count) {
    return 'Zeige die ersten $count Zeilen';
  }

  @override
  String get imageCouldNotLoad => 'Dieses Bild konnte nicht geladen werden';

  @override
  String get mediaKindImage => 'Bild';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Audio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Datei öffnen';

  @override
  String get attach => 'Anhängen';

  @override
  String get attachFiles => 'Dateien';

  @override
  String get attachPhotos => 'Fotobibliothek';

  @override
  String get attachCamera => 'Foto aufnehmen';

  @override
  String get attachScan => 'Dokument scannen';

  @override
  String get scanFailed =>
      'Das Dokument konnte nicht gescannt werden. Versuch es erneut.';

  @override
  String get dropToAttach => 'Dateien zum Anhängen ablegen';

  @override
  String uploadFailed(String name) {
    return '$name konnte nicht hochgeladen werden';
  }

  @override
  String attachFailed(String name, String reason) {
    return '$name konnte nicht angehängt werden: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return '$name konnte nicht angehängt werden';
  }

  @override
  String get sendWithoutIt => 'Ohne senden';

  @override
  String get sendWithoutThem => 'Ohne sie senden';

  @override
  String get removeAttachment => 'Entfernen';

  @override
  String get editPhoto => 'Foto bearbeiten';

  @override
  String get retryUpload => 'Erneut versuchen';

  @override
  String get uploadingAttachments => 'Wird hochgeladen…';

  @override
  String get notSent => 'Nicht gesendet';

  @override
  String get deleteChat => 'Chat löschen';

  @override
  String get deleteChatTitle => 'Diesen Chat löschen?';

  @override
  String deleteChatBody(String bot) {
    return 'Seine Nachrichten werden für alle gelöscht, die ihn sehen können. Was $bot hier erstellt hat, bleibt in der Bibliothek, die Nutzungsdaten bleiben gespeichert, und alles, was er sich daraus gemerkt hat, bleibt in seinem Gedächtnis.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Auch die $count hier erstellten Elemente löschen',
      one: 'Auch das hier erstellte Element löschen',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Aus: Sie bleiben in der Bibliothek.';

  @override
  String get chatDeleted => 'Chat gelöscht';

  @override
  String get deleteAllChats => 'Alle Chats löschen';

  @override
  String get deleteAllChatsRow =>
      'Mit sauberem Verlauf neu starten. Erinnerungen bleiben.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Alle Chats mit $bot löschen?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Jeder Chat mit $bot, den du löschen kannst, wird samt Nachrichten, Fotos und Dateien entfernt. Gruppenchats bleiben. Die Nutzungsdaten bleiben gespeichert, und was $bot sich gemerkt hat, bleibt in seinem Gedächtnis.';
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
      other: '$nString Chats gelöscht.',
      one: '1 Chat gelöscht.',
      zero: 'Keine Chats zum Löschen.',
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
          '$nString Chats wurden behalten, weil der Bot darin noch arbeitet.',
      one: '1 Chat wurde behalten, weil der Bot darin noch arbeitet.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n Bots sind in diesem Chat. Jeder behält sein eigenes Gedächtnis und eigene Einstellungen.',
      one:
          '$n Bot ist in diesem Chat. Jeder behält sein eigenes Gedächtnis und eigene Einstellungen.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Tippe @ und einen Namen, um einen Bot direkt zu fragen.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone bittet $lead, die Arbeit zu planen und jedem Bot einen Teil zu geben.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Ohne Erwähnung antwortet der Bot, der zuletzt gesprochen hat (zuerst $lead).';
  }

  @override
  String get messageNotSent =>
      'Deine Dateien wurden nicht hochgeladen, daher wurde die Nachricht nicht gesendet. Sie liegt wieder im Eingabefeld.';

  @override
  String get chatSendsWhenDone => 'Sendet, wenn diese Antwort fertig ist';

  @override
  String get noComputerForFiles =>
      'Dieser Bot hat keinen Computer für Dateien.';

  @override
  String fileTooLarge(String name) {
    return '$name ist größer als 25 MB und zu groß zum Anhängen.';
  }

  @override
  String get secretsHelp =>
      'Bots fügen Geheimnisse über ihren Namen in Anfragen ein. Sie gehen nur an von dir erlaubte Hosts und das Modell sieht sie nie.';

  @override
  String deleteSecretTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get deleteSecretBody =>
      'Bots, die es nutzen, können diesen Dienst nicht mehr erreichen.';

  @override
  String get hide => 'Ausblenden';

  @override
  String get show => 'Anzeigen';

  @override
  String get deleteMemoryTitle => 'Diese Erinnerung löschen?';

  @override
  String get noMemoriesHelp =>
      'Beim Chatten merkt sich der Bot, was zählt: Fakten, Vorlieben und Zusammenfassungen früherer Arbeit.';

  @override
  String get memoryHelp =>
      'Angeheftete Erinnerungen sind immer im Kontext des Bots. Bearbeite Falsches; gelöschte Erinnerungen sind endgültig weg.';

  @override
  String get memoryFact => 'Fakt';

  @override
  String get memoryPreference => 'Vorliebe';

  @override
  String get memorySummary => 'Zusammenfassung';

  @override
  String get memoryEpisode => 'Episode';

  @override
  String get pinned => 'Angeheftet';

  @override
  String get editMemory => 'Erinnerung bearbeiten';

  @override
  String get editMemoryHelp =>
      'Der Bot nutzt das beim nächsten passenden Anlass.';

  @override
  String get modelKeysIntro =>
      'Bots denken mit deinen eigenen Schlüsseln für Modellanbieter. Schlüssel werden verschlüsselt gespeichert und nie wieder angezeigt.';

  @override
  String get casamaCloudKeyHint => 'Aus deinen Credits bezahlt';

  @override
  String get casamaCloudIncluded => 'Enthalten';

  @override
  String get casamaCloudModelLocked => 'Casama wählt dieses Modell.';

  @override
  String get serverVoiceSetUp =>
      'Dieser Server stellt Sprache bereit, du brauchst keinen Schlüssel hinzuzufügen. Ein eigener Schlüssel eines Workspace wird zuerst genutzt.';

  @override
  String modelKeysFor(String workspace) {
    return 'Schlüssel gehören zu einem Workspace. Diese sind für $workspace.';
  }

  @override
  String get yourKeys => 'Deine Schlüssel';

  @override
  String get keyWorking => 'Funktioniert';

  @override
  String get keyFailing => 'Schlägt fehl';

  @override
  String get keyUntested => 'Nicht getestet';

  @override
  String get skillsHelp =>
      'Ein Skill ist eine Sammlung von Anweisungen, die ein Bot lädt, wenn eine Aufgabe es erfordert – etwa dein Hausstil für Berichte.';

  @override
  String get skillsForAllBots => 'Alle Bots';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Nur für $bot';
  }

  @override
  String get skillsRemovedBot => 'Ein entfernter Bot';

  @override
  String deleteSkillTitle(String name) {
    return 'Skill „$name“ löschen?';
  }

  @override
  String get editSkill => 'Skill bearbeiten';

  @override
  String get deleteSkill => 'Skill löschen';

  @override
  String get skillDescriptionHelp =>
      'Bots lesen das, um zu entscheiden, wann der Skill passt.';

  @override
  String get skillBodyHint => '# Schritte\n1. …';

  @override
  String get computersHelp =>
      'Jeder Bot arbeitet auf einem Computer: dem Team-Computer, den alle teilen, oder einem privaten. Dateien bleiben zwischen Chats darauf erhalten.';

  @override
  String get computersEmptyTitle => 'Noch keine Computer';

  @override
  String get thisDevice => 'Dieses Gerät';

  @override
  String get personalComputerConnected => 'Verbunden';

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
    return '$size RAM';
  }

  @override
  String computerDisk(Object size) {
    return '$size Festplatte';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Zuletzt genutzt $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Zuletzt gesehen $when';
  }

  @override
  String get computerSaved => 'Gesichert';

  @override
  String get computerSavedHelp =>
      'Seine Dateien bleiben erhalten, während er gestoppt ist';

  @override
  String computerCanUse(Object list) {
    return 'Bots dürfen nutzen: $list';
  }

  @override
  String get computerCanUseNothing => 'Bots können ihn noch nicht nutzen';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Dateien';

  @override
  String get computerCapBrowser => 'Browser';

  @override
  String get computerCapDesktop => 'Bildschirm';

  @override
  String get computerCapMcp => 'Lokale Tools';

  @override
  String get computerCapMessages => 'Nachrichten';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name ist offline. Öffne Casama darauf und aktiviere „Diesen Computer für Bots nutzen“. Dein eigener Computer verbraucht nie Computerstunden deines Abos.';
  }

  @override
  String get yourComputerOffline => 'Dein Computer ist offline';

  @override
  String get howToFix => 'So behebst du es';

  @override
  String get computerHoursUsedTitle => 'Computerstunden aufgebraucht';

  @override
  String get personalScreenNote =>
      'Das ist dein eigener Computer, daher siehst du alle paar Sekunden einen neuen Screenshot statt einer Live-Ansicht.';

  @override
  String get renameComputer => 'Computer umbenennen';

  @override
  String deleteComputerTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get privacyIntro =>
      'Deine Chats, Erinnerungen und Dateien gehören dir. Exportiere sie jederzeit oder lösche dein Konto.';

  @override
  String get yourData => 'Deine Daten';

  @override
  String get shareAnalytics => 'Nutzungsdaten teilen';

  @override
  String get shareAnalyticsHelp =>
      'Nutzungs- und Absturzberichte. Niemals deine Nachrichten oder Dateien.';

  @override
  String get measureAds => 'Bei der Messung unserer Anzeigen helfen';

  @override
  String get measureAdsHelp =>
      'Ermöglicht es Casama, Meta mitzuteilen, wenn jemand, der unsere Anzeige gesehen hat, beitritt oder ein Abo abschließt. Casama zeigt nie Werbung.';

  @override
  String get measureAdsNeedsUsageData =>
      'Aktiviere „Nutzungsdaten teilen“, um dies zu nutzen.';

  @override
  String get trackingTile => 'Tracking erlauben';

  @override
  String get trackingAllowed =>
      'Erlaubt. Das Meta-SDK läuft auf diesem Gerät, und Casama kann Meta mitteilen, wenn du nach dem Ansehen unserer Anzeige beitrittst oder ein Abo abschließt. Ändern kannst du das in der Einstellungen-App.';

  @override
  String get trackingNotAllowed =>
      'Nicht erlaubt. Nichts von diesem Gerät geht an Meta. Ändere das in der Einstellungen-App.';

  @override
  String get trackingNotAsked =>
      'Casama hat noch nicht gefragt. Bis du es erlaubst, geht nichts von diesem Gerät an Meta.';

  @override
  String get trackingOpenSettings => 'Einstellungen öffnen';

  @override
  String get workspaceAnalytics => 'Nutzungsdaten für diesen Workspace';

  @override
  String get workspaceAnalyticsHelp =>
      'Nutzungsdaten für diesen Workspace. Absturzberichte bleiben an.';

  @override
  String get dangerZone => 'Gefahrenbereich';

  @override
  String get quotasHelp => 'Lass ein Feld leer für kein Limit.';

  @override
  String get serviceOff => 'Aus';

  @override
  String get serviceDown => 'Nicht verfügbar';

  @override
  String get serviceOk => 'OK';

  @override
  String get sendInvite => 'Einladung senden';

  @override
  String get thinking0 => 'Modell';

  @override
  String get saveChanges => 'Änderungen speichern';

  @override
  String get autonomyAskAlwaysHelp =>
      'Stimmt sich vor jeder Aktion, die etwas ändert, mit dir ab.';

  @override
  String get autonomyAskRiskyHelp =>
      'Arbeitet eigenständig, fragt aber vor allem Riskanten – wie Dateien löschen oder Geld ausgeben.';

  @override
  String get autonomyAutonomousHelp =>
      'Handelt ohne zu fragen. Am besten für Routinen, denen du vertraust.';

  @override
  String get usageSubtitle => 'Modellausgaben diesen Monat';

  @override
  String get skillsRowHelp =>
      'Anweisungen, die Bots laden, wenn eine Aufgabe sie braucht';

  @override
  String get integrationsRowHelp => 'MCP-Server und verbundene Apps';

  @override
  String get secretsRowHelp =>
      'Tokens und Passwörter, nur gesendet, wohin du erlaubst';

  @override
  String get computersRowHelp => 'Der Team-Computer und private Computer';

  @override
  String get companionRowHelp =>
      'Lass Bots Apps und Dateien dieses Geräts nutzen';

  @override
  String get privacyRowHelp =>
      'Deine Daten exportieren oder dein Konto löschen';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Noch keine Integrationen';

  @override
  String get integrationsHelp =>
      'Integrationen geben Bots mehr Tools: einen MCP-Server, eine OpenAPI-Quelle, Composio oder Pipedream. Jedes Tool ist nach seiner Integration benannt.';

  @override
  String get botIntegrationsHelp =>
      'Aktiviere die Integrationen, die dieser Bot nutzen darf. Seine Tools erscheinen, wenn er das nächste Mal läuft.';

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get noRunsHelp =>
      'Jedes Mal, wenn dieser Bot arbeitet – über einen Chat, eine Routine oder einen Webhook –, erscheint der Durchlauf hier mit dem, was er getan hat und was es gekostet hat.';

  @override
  String get runCompleted => 'Erledigt';

  @override
  String get runWaiting => 'Wartet';

  @override
  String get runWorking => 'Arbeitet';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Routine';

  @override
  String get noEventsForFilter => 'Nichts dieser Art in diesem Durchlauf.';

  @override
  String get runStatusFailed => 'Fehlgeschlagen';

  @override
  String get runStatusStopped => 'Gestoppt';

  @override
  String get quickAskIntro =>
      'Sende eine schnelle Anfrage. Startet einen neuen Chat mit dem Bot, den du wählst.';

  @override
  String quickAskIntroBot(String name) {
    return 'Sende eine schnelle Anfrage. Startet einen neuen Chat mit $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return 'Was soll $bot tun?';
  }

  @override
  String get stateProvisioning => 'Wird eingerichtet';

  @override
  String get stateStarting => 'Startet';

  @override
  String get computerRestoringFiles => 'Dateien werden wiederhergestellt…';

  @override
  String get stateRunning => 'Läuft';

  @override
  String get stateIdle => 'Inaktiv';

  @override
  String get stateSleeping => 'Schläft';

  @override
  String get stateStopped => 'Gestoppt';

  @override
  String get stateError => 'Fehler';

  @override
  String get terminalHelp =>
      'Eine Shell auf diesem Computer. Bots nutzen dieselbe, sodass du sehen und beheben kannst, was sie getan haben.';

  @override
  String get up => 'Nach oben';

  @override
  String get emptyFolderHelp =>
      'Dateien, die deine Bots erstellen, und Dateien, die du hochlädst, erscheinen hier.';

  @override
  String deleteFileTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get botComputerAuto => 'Automatisch';

  @override
  String get botComputerHelp =>
      'Der eigene Computer des Bots: wo er Befehle ausführt, surft und seine Dateien ablegt.';

  @override
  String get billingOffTitle => 'Keine Abrechnung hier';

  @override
  String revokeKeyTitle(String name) {
    return 'Schlüssel für $name widerrufen?';
  }

  @override
  String get revokeKeyBody =>
      'Dieser Server nutzt ab sofort keine Cloud-Computer und Credits mehr.';

  @override
  String get handBackHelp =>
      'Der Bot macht dort weiter, wo du aufgehört hast. Sag ihm, was du getan hast, wenn es hilft.';

  @override
  String get serverHelp =>
      'Nutze deinen eigenen Casama-Server. Gib die Adresse ein, die du oder dein Admin eingerichtet habt.';

  @override
  String get ssoHelp =>
      'Gib deine geschäftliche E-Mail-Adresse ein, dann leiten wir dich zur Anmeldeseite deines Unternehmens weiter.';

  @override
  String get colorScheme => 'Farbschema';

  @override
  String get searchThemes => 'Schemata durchsuchen';

  @override
  String get noThemesFound => 'Keine passenden Schemata.';

  @override
  String get noAppsMatch =>
      'Keine passenden Apps. Du kannst unter Erweitert deinen eigenen Server hinzufügen.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps',
      one: '1 App',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'Alle';

  @override
  String get familyPurple => 'Lila';

  @override
  String get familyBlue => 'Blau';

  @override
  String get familyTeal => 'Petrol';

  @override
  String get familyGreen => 'Grün';

  @override
  String get familyWarm => 'Warm';

  @override
  String get familyRed => 'Rot & Rosa';

  @override
  String get familyNeutral => 'Neutral';

  @override
  String get background => 'Hintergrund';

  @override
  String get backgroundPattern => 'Muster';

  @override
  String get backgroundColors => 'Farben';

  @override
  String get backgroundThemeColors => 'Theme';

  @override
  String get patternStrength => 'Musterstärke';

  @override
  String get wallpaperEverywhere => 'Auf jedem Bildschirm zeigen';

  @override
  String get wallpaperEverywhereHelp =>
      'Ausschalten, um es nur hinter Chats zu zeigen.';

  @override
  String get resetBackground => 'Auf Standard zurücksetzen';

  @override
  String get copyMessage => 'Kopieren';

  @override
  String get selectText => 'Text auswählen';

  @override
  String get shareMessage => 'Teilen';

  @override
  String get messageCopied => 'Kopiert';

  @override
  String get botUiBroken =>
      'Dieser Teil der Antwort konnte nicht angezeigt werden.';

  @override
  String get botUiSent => 'Gesendet';

  @override
  String get botUiConnected => 'Verbunden';

  @override
  String get draftNewEmail => 'Neue E-Mail';

  @override
  String get draftNewMessage => 'Neue Nachricht';

  @override
  String get draftNewPost => 'Neuer Beitrag';

  @override
  String get draftReadyToSend => 'Bereit zum Senden';

  @override
  String get draftReadyToPost => 'Bereit zum Posten';

  @override
  String get draftEdited => 'Bearbeitet';

  @override
  String get draftSendEmail => 'E-Mail senden';

  @override
  String get draftSend => 'Senden';

  @override
  String get draftPost => 'Posten';

  @override
  String get draftDiscard => 'Verwerfen';

  @override
  String get draftEdit => 'Bearbeiten';

  @override
  String get draftDoneEditing => 'Fertig';

  @override
  String get draftFrom => 'Von';

  @override
  String get draftTo => 'An';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Bcc';

  @override
  String get draftSubject => 'Betreff';

  @override
  String get botCardNewEvent => 'Neuer Termin';

  @override
  String get botCardEvent => 'Termin';

  @override
  String get botCardReadyToAdd => 'Bereit zum Hinzufügen';

  @override
  String get botCardAddToCalendar => 'Zum Kalender hinzufügen';

  @override
  String get botCardChange => 'Ändern';

  @override
  String get botCardSkip => 'Überspringen';

  @override
  String get botCardAllDay => 'Ganztägig';

  @override
  String botCardMore(int count) {
    return '+$count weitere';
  }

  @override
  String get botCardAgenda => 'Tagesplan';

  @override
  String get botCardMessages => 'Nachrichten';

  @override
  String botCardUnread(int count) {
    return '$count ungelesen';
  }

  @override
  String get botCardReply => 'Antworten';

  @override
  String botCardReplyTo(String name) {
    return '$name antworten';
  }

  @override
  String get botCardTasks => 'Aufgaben';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done von $total erledigt';
  }

  @override
  String get botCardSaveChanges => 'Änderungen speichern';

  @override
  String get botCardChoose => 'Auswählen';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Wen meinst du?';

  @override
  String get botCardNoneOfThese => 'Keine davon';

  @override
  String get botCardReminder => 'Erinnerung';

  @override
  String get botCardRoutine => 'Routine';

  @override
  String get botCardWatcher => 'Beobachtet';

  @override
  String get botCardScheduled => 'Eingerichtet';

  @override
  String botCardNext(String when) {
    return 'Nächster: $when';
  }

  @override
  String get botCardCancelIt => 'Abbrechen';

  @override
  String get botIcon => 'Symbol';

  @override
  String get botIconInitials => 'Initialen';

  @override
  String get errorDetailsTitle => 'Was ist schiefgelaufen';

  @override
  String get exportLabel => 'Exportieren';

  @override
  String get openTimeline => 'Durchlaufprotokoll öffnen';

  @override
  String get details => 'Details';

  @override
  String get themes => 'Themes';

  @override
  String get myThemes => 'Deine Themes';

  @override
  String get saveTheme => 'Aktuelles Theme speichern';

  @override
  String get themeName => 'Theme-Name';

  @override
  String get importTheme => 'Theme importieren';

  @override
  String get themeCode => 'Theme-Code';

  @override
  String get themeCodeHelp =>
      'Füge einen Code ein, den jemand mit dir geteilt hat. Er beginnt mit casama-theme:';

  @override
  String get invalidThemeCode => 'Das ist kein Casama-Theme-Code.';

  @override
  String themeImported(String name) {
    return '$name zu deinen Themes hinzugefügt';
  }

  @override
  String get themeCodeCopied =>
      'Theme-Code kopiert. Jede Person kann ihn unter Erscheinungsbild → Theme importieren einfügen.';

  @override
  String get shareTheme => 'Code teilen';

  @override
  String deleteThemeTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get fonts => 'Schriften';

  @override
  String get headingFont => 'Überschriften';

  @override
  String get bodyFont => 'Text';

  @override
  String get fontsHelp =>
      'Google Sans und Noto Serif sind in der App enthalten und funktionieren offline. Andere Google Fonts werden beim ersten Auswählen heruntergeladen.';

  @override
  String get searchFonts => 'Alle Google Fonts durchsuchen';

  @override
  String get suggestedFonts => 'Empfohlen';

  @override
  String get allFonts => 'Alle Google Fonts';

  @override
  String get noFontsFound => 'Keine Schriftart mit diesem Namen';

  @override
  String get resetFonts => 'Standards verwenden';

  @override
  String get fontSample => 'Deine Bots arbeiten mit dir zusammen.';

  @override
  String get backgroundPhoto => 'Foto';

  @override
  String get yourPhoto => 'Dein Foto';

  @override
  String get browsePhotos => 'Fotos durchsuchen';

  @override
  String get removePhoto => 'Foto entfernen';

  @override
  String get photoBlur => 'Weichzeichner';

  @override
  String get photoDim => 'Abdunkeln';

  @override
  String photoBy(String name) {
    return 'Foto von $name auf Unsplash';
  }

  @override
  String get searchPhotos => 'Fotos suchen';

  @override
  String get photosUnavailable => 'Fotos konnten nicht geladen werden.';

  @override
  String get noPhotos => 'Keine Fotos gefunden';

  @override
  String get photoHelp =>
      'Ein Foto liegt unter den Kritzeleien. Weichzeichner und Abdunkeln halten Text darüber gut lesbar.';

  @override
  String get periodToday => 'Heute';

  @override
  String get periodWeek => 'Diese Woche';

  @override
  String get periodYear => 'Dieses Jahr';

  @override
  String get totalSpend => 'Ausgaben';

  @override
  String get tokensIn => 'Eingehende Tokens';

  @override
  String get tokensOut => 'Ausgehende Tokens';

  @override
  String get runsLabel => 'Durchläufe';

  @override
  String get spendByDay => 'Ausgaben nach Tag';

  @override
  String get byBot => 'Nach Bot';

  @override
  String get byModel => 'Nach Modell';

  @override
  String get everythingMetered => 'Alles nach Nutzung abgerechnet';

  @override
  String get bySource => 'Nach Quelle';

  @override
  String get byPerson => 'Nach Person';

  @override
  String get usageAllBots => 'Alle Bots';

  @override
  String get usageAllModels => 'Alle Modelle';

  @override
  String get usageAllSources => 'Alle Quellen';

  @override
  String get usageEveryone => 'Alle';

  @override
  String get usageJustMe => 'Nur ich';

  @override
  String get usageClearFilters => 'Leeren';

  @override
  String get usageFilterBot => 'Nach Bot filtern';

  @override
  String get usageFilterModel => 'Nach Modell filtern';

  @override
  String get usageFilterSource => 'Nach Quelle filtern';

  @override
  String get usageFilterPerson => 'Nach Person filtern';

  @override
  String get usageSourceChat => 'Chats';

  @override
  String get usageSourceChatApp => 'Chat-Apps';

  @override
  String get usageSourceRoutine => 'Routinen';

  @override
  String get usageSourceApi => 'API und andere Agents';

  @override
  String get usageSourceOther => 'Sonstiges';

  @override
  String get usageNoPerson => 'Automatisch';

  @override
  String get usageUnnamedPerson => 'Unbenanntes Mitglied';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Durchläufe',
      one: '1 Durchlauf',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'CSV exportieren';

  @override
  String get exportJson => 'JSON exportieren';

  @override
  String get askBotAboutUsage => 'Einen Bot dazu fragen';

  @override
  String get noUsageYet => 'Noch keine Nutzung in diesem Zeitraum.';

  @override
  String get otherModel => 'Computer und Sonstiges';

  @override
  String get deletedBot => 'Keinem Bot zugeordnet';

  @override
  String get usageHelp =>
      'Kosten sind Schätzungen aus Token-Zahlen und veröffentlichten Preisen. Entscheidend ist die Rechnung deines Modellanbieters.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Hier ist meine Casama-Nutzung für $period. Hilf mir zu verstehen, wohin das Geld fließt und wie ich weniger ausgeben könnte. Du kannst auch Live-Zahlen mit deinem Nutzungs-Tool prüfen.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Modelleingabe';

  @override
  String get kindTokensOut => 'Modellausgabe';

  @override
  String get kindComputer => 'Cloud-Computerzeit';

  @override
  String get kindModels => 'KI-Modelle';

  @override
  String get creditsThisMonth => 'Credits diesen Monat';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent % genutzt';
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
      other: 'Noch etwa $nString Durchläufe zu deinen üblichen Kosten',
      one: 'Noch etwa 1 Durchlauf zu deinen üblichen Kosten',
      zero: 'Weniger als ein weiterer Durchlauf zu deinen üblichen Kosten',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Deine Credits sind aufgebraucht. Füge weitere hinzu, damit deine Bots weiterlaufen.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 Credit = $price. Dein Abo fügt jeden Monat $amount hinzu; ungenutzte Credits werden für einen weiteren Monat übertragen.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 Credit = $price. Credit-Pakete aus dem App Store oder von Google Play verfallen nie; im Web gekaufte Credit-Pakete gelten 12 Monate.';
  }

  @override
  String get creditsDailyLabel => 'Heutiges Limit';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used von $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Was dein Abo täglich für Casamas Modelle, Sprache und Apps ausgeben kann, unabhängig von übrigen Credits.';

  @override
  String get creditsDailyReached =>
      'Das heutige Limit ist erreicht, daher sind deine Bots pausiert. Upgrade für ein höheres Tageslimit.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Wird in etwa $n Stunden zurückgesetzt.',
      one: 'Wird in etwa 1 Stunde zurückgesetzt.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon =>
      'Wird in weniger als einer Stunde zurückgesetzt.';

  @override
  String get creditsHoursLabel => 'Computerstunden';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used von $limit Std.';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Zeit, die die Computer deiner Bots diesen Monat laufen. Wenn sie aufgebraucht ist, funktioniert der Chat weiter; nur der Computer stoppt. Zurückgesetzt am $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Die Computerstunden dieses Monats sind aufgebraucht, daher kann dein Computer nicht starten. Der Chat funktioniert weiterhin. Zurücksetzung am $date. Upgrade für mehr Stunden.';
  }

  @override
  String get kindStream => 'Live-Ansicht';

  @override
  String get kindTts => 'Vorlesen';

  @override
  String get computerMissingTitle => 'Computer nicht gefunden';

  @override
  String get computerMissingHelp =>
      'Er wurde vielleicht entfernt oder die Liste ist veraltet. Aktualisiere, um erneut zu prüfen.';

  @override
  String get computerMissingBotHelp =>
      'Der Computer dieses Bots wurde vielleicht entfernt oder die Liste ist veraltet. Aktualisiere oder wähle einen anderen Computer für diesen Bot.';

  @override
  String get computerChoose => 'Computer wählen';

  @override
  String get personaWork => 'Arbeit';

  @override
  String get personaResearch => 'Recherche';

  @override
  String get personaBuild => 'Entwicklung';

  @override
  String get personaCreate => 'Kreativ';

  @override
  String get personaLife => 'Alltag';

  @override
  String get personaOther => 'Sonstiges';

  @override
  String get blankBotHelp =>
      'Starte bei null und schreibe deine eigenen Anweisungen.';

  @override
  String get browse => 'Durchsuchen';

  @override
  String get browseAllPersonas => 'Alle durchsuchen';

  @override
  String get botIdentity => 'Name und Symbol';

  @override
  String get serviceKeys => 'Dienstschlüssel';

  @override
  String get noServiceKeys => 'Noch keine Dienstschlüssel.';

  @override
  String get serviceKeysHelp =>
      'Deine eigenen Such-, Karten- oder Datenschlüssel';

  @override
  String get serviceKeysIntro =>
      'Casama übernimmt Modelle, Sprachausgabe und Bilder für dich. Füge hier nur einen Schlüssel hinzu, wenn du deinen eigenen Such-, Karten- oder Datendienst nutzen möchtest. Schlüssel werden verschlüsselt gespeichert und nie wieder angezeigt.';

  @override
  String get choosePersona => 'Persona wählen';

  @override
  String get choosePersonaHelp =>
      'Jede kommt mit Anweisungen, einem Look und manchmal Skills und Routinen. Du kannst danach alles ändern.';

  @override
  String get searchPersonas => 'Personas durchsuchen';

  @override
  String get noPersonasFound => 'Keine passende Persona';

  @override
  String get previewPersona => 'Vorschau';

  @override
  String get personaInstructions => 'Anweisungen';

  @override
  String get personaTryAsking => 'Frag zum Beispiel';

  @override
  String usePersona(String name) {
    return '$name verwenden';
  }

  @override
  String get loadPersona => 'Persona laden';

  @override
  String get replaceInstructionsTitle => 'Anweisungen ersetzen?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Die aktuellen Anweisungen des Bots werden durch die von $name ersetzt. Skills und Routinen bleiben wie sie sind.';
  }

  @override
  String get replace => 'Ersetzen';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle =>
      'Gib deinen Bots die Tools, die dein Team bereits nutzt.';

  @override
  String get connectedTab => 'Verbunden';

  @override
  String get browseTab => 'Durchsuchen';

  @override
  String get searchApps => 'Apps durchsuchen';

  @override
  String get popularApps => 'Beliebt';

  @override
  String get allApps => 'Alle Apps';

  @override
  String get appCatDeveloper => 'Entwicklung';

  @override
  String get appCatProductivity => 'Produktivität';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Zahlungen';

  @override
  String get appCatDesign => 'Design';

  @override
  String get appCatSales => 'Vertrieb & Support';

  @override
  String get appCatData => 'Daten & Suche';

  @override
  String get appCatAutomation => 'Automatisierung';

  @override
  String get authOneClick => 'Ein Klick';

  @override
  String get authApiKey => 'API-Schlüssel';

  @override
  String get authNone => 'Keine Anmeldung';

  @override
  String get authAdminSetup => 'Einrichtung nötig';

  @override
  String get connectedBadge => 'Verbunden';

  @override
  String get whatBotsCanDo => 'Was deine Bots tun können';

  @override
  String continueWith(String app) {
    return 'Mit $app fortfahren';
  }

  @override
  String get signInTab => 'Anmelden';

  @override
  String get connectNoSignIn => 'Diese App funktioniert ohne Anmeldung.';

  @override
  String finishSignIn(String app) {
    return 'Anmeldung bei $app abschließen';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app wurde in deinem Browser geöffnet. Gib dort den Zugriff frei, dann aktualisiert sich dies von selbst.';
  }

  @override
  String get reopenSignIn => 'Anmeldeseite erneut öffnen';

  @override
  String appConnected(String app) {
    return '$app ist verbunden';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app ist in diesem Workspace bereits verbunden. Nutze diese Verbindung oder füge ein weiteres Konto hinzu.';
  }

  @override
  String get useConnection => 'Verwenden';

  @override
  String get addAnotherAccount => 'Weiteres Konto hinzufügen';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tools sind für deine Bots bereit.',
      one: '1 Tool ist für deine Bots bereit.',
      zero: 'Einsatzbereit.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Welche Bots dürfen sie nutzen?';

  @override
  String get whichBotsHelp => 'Bots fragen dich vor allem Riskanten weiterhin.';

  @override
  String get doneLabel => 'Fertig';

  @override
  String openApp(String app) {
    return '$app öffnen';
  }

  @override
  String get pasteLabel => 'Einfügen';

  @override
  String get connectingLabel => 'Verbinde…';

  @override
  String get connectFailedTitle => 'Verbindung fehlgeschlagen';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Oder verbinde $app über einen dieser Dienste. Melde dich einmal an und bitte dann deinen Bot, $app zu nutzen.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'Die Anmeldung wird verschlüsselt gespeichert und nie wieder angezeigt. Jederzeit trennen.';

  @override
  String get composioHelp =>
      'Hunderte Apps, bei denen die Anmeldung für dich erledigt wird.';

  @override
  String get pipedreamHelp => 'Tausende Apps über Pipedream Connect.';

  @override
  String get customServer => 'Eigener Server';

  @override
  String get customServerHelp =>
      'Beliebiger MCP-Server oder OpenAPI-Spec. Für Entwickler.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Genutzt von $countString Bots',
      one: 'Genutzt von 1 Bot',
      zero: 'Noch keinem Bot zugewiesen',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Bereit';

  @override
  String get statusNeedsAttention => 'Erfordert Aufmerksamkeit';

  @override
  String get statusChecking => 'Prüft';

  @override
  String get toolsHelp =>
      'Reine Lese-Tools werden von selbst ausgeführt. Tools, die Änderungen vornehmen, fragen zuerst nach, wenn ein Bot etwas nicht Vertrauenswürdiges gelesen hat, und solche mit „Fragt immer“ warten jedes Mal auf dich.';

  @override
  String get botsWithAccess => 'Bots mit Zugriff';

  @override
  String get reconnect => 'Erneut verbinden';

  @override
  String get disconnect => 'Trennen';

  @override
  String disconnectTitle(String app) {
    return '$app trennen?';
  }

  @override
  String get disconnectBody =>
      'Bots verlieren sofort ihre Tools und die gespeicherte Anmeldung wird gelöscht.';

  @override
  String get testConnection => 'Verbindung testen';

  @override
  String get signedInOAuth => 'Mit deinem Konto angemeldet';

  @override
  String get signedInKey => 'Mit einem API-Schlüssel verbunden';

  @override
  String get signedInNone => 'Keine Anmeldung nötig';

  @override
  String get noConnectionsTitle => 'Verbinde deine erste App';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail und mehr. Meist genügt ein Klick.';

  @override
  String get browseApps => 'Apps durchsuchen';

  @override
  String providerSetupTitle(String provider) {
    return '$provider verbinden';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider meldet sich für dich bei den Apps an, sodass du nie mit ihren Schlüsseln hantieren musst.';
  }

  @override
  String get getFreeKey => 'Kostenlosen Schlüssel holen';

  @override
  String connectedThroughHub(String provider) {
    return 'Über $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Apps über $provider';
  }

  @override
  String get addAnApp => 'App hinzufügen';

  @override
  String searchProviderApps(String provider) {
    return '$provider-Apps durchsuchen';
  }

  @override
  String get accountConnected => 'Angemeldet';

  @override
  String get accountPending => 'Wartet auf Anmeldung';

  @override
  String get accountError => 'Anmeldeproblem';

  @override
  String get providerReconnectHint =>
      'Melde dich direkt bei Casama an, um niedrigere App-Aufrufkosten zu erhalten';

  @override
  String get noProviderAccounts =>
      'Noch keine Apps. Füge eine hinzu und melde dich dort an.';

  @override
  String get projectId => 'Projekt-ID';

  @override
  String get toolRiskLow => 'Nur Lesen';

  @override
  String get toolRiskMedium => 'Nimmt Änderungen vor';

  @override
  String get toolRiskHigh => 'Fragt immer';

  @override
  String get askWhichBot => 'Welcher Bot soll sich das ansehen?';

  @override
  String get computerWake => 'Aufwecken';

  @override
  String get computerAsleepTitle => 'Der Computer schläft';

  @override
  String get computerAsleepFilesHelp =>
      'Wecke ihn auf, um seine Dateien zu sehen und hochzuladen.';

  @override
  String get computerFilesTimedOut =>
      'Die Dateien haben zu lange zum Laden gebraucht. Prüfe, ob der Computer an ist, und versuch es erneut.';

  @override
  String get computerGoingToSleep => 'Geht in den Ruhezustand';

  @override
  String get liveViewWakesHelp =>
      'Dieser Computer schläft. Das Öffnen der Live-Ansicht weckt ihn auf; nach einiger Zeit ohne Nutzung schläft er wieder ein.';

  @override
  String get wakeAndWatch => 'Aufwecken und live zusehen';

  @override
  String get chatGptPlan => 'ChatGPT-Abo';

  @override
  String get continueWithChatGpt => 'Mit ChatGPT fortfahren';

  @override
  String get chatGptConnectHelp =>
      'Führe deine Bots über dein ChatGPT-Abo statt über einen API-Schlüssel aus. Ihre Modellaufrufe zählen auf die Limits deines Abos, und nur du kannst es nutzen.';

  @override
  String get chatGptDesktopOnly =>
      'Um dein ChatGPT-Abo zu verbinden, öffne die Desktop-App oder führe \"casama credential chatgpt\" in der CLI aus.';

  @override
  String get chatGptWaiting =>
      'Schließe die Anmeldung mit ChatGPT in deinem Browser ab…';

  @override
  String chatGptConnected(String account) {
    return 'Dein ChatGPT-Abo verbunden ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Du bist angemeldet, aber die Abo-Nutzung wurde nicht erlaubt. Verbinde erneut und erlaube sie oder füge einen API-Schlüssel hinzu.';

  @override
  String get orAddApiKey => 'Oder füge einen API-Schlüssel hinzu';

  @override
  String get planOnlyYou => 'Nur du kannst es nutzen';

  @override
  String get planOtherMember => 'Abo eines anderen Mitglieds';

  @override
  String get planConnected => 'Verbunden';

  @override
  String get planUsageOff => 'Abo-Nutzung aus';

  @override
  String get planNeedsReconnect => 'Erneut anmelden';

  @override
  String get useNextModelAtLimit =>
      'Nächstes Modell des Bots am Abo-Limit nutzen';

  @override
  String get useNextModelAtLimitHelp =>
      'Aus: Ein Durchlauf stoppt, wenn dein ChatGPT-Limit erreicht ist. An: Er läuft mit dem nächsten Modell des Bots weiter, was Geld kosten kann.';

  @override
  String get manageUsage => 'Nutzung verwalten';

  @override
  String get removeKey => 'Entfernen';

  @override
  String removeKeyConfirm(String label) {
    return '$label entfernen? Bots, die ihn nutzen, arbeiten erst wieder, wenn du ihnen einen anderen Schlüssel gibst.';
  }

  @override
  String get removeKeyChatGptNote =>
      'Deine ChatGPT-Anmeldung wird ebenfalls widerrufen.';

  @override
  String modelFallbackNotice(String message) {
    return 'Zum nächsten Modell gewechselt: $message';
  }

  @override
  String get twoStepSignIn => 'Anmeldung in zwei Schritten';

  @override
  String get twoStepHelp =>
      'Bei jeder Anmeldung nach einem Code aus einer Authenticator-App fragen.';

  @override
  String get signInWithPasskey => 'Mit Passkey anmelden';

  @override
  String get account => 'Konto';

  @override
  String get accountRow => 'E-Mail, Passwort und überall abmelden';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get newPasswordAgain => 'Neues Passwort wiederholen';

  @override
  String get passwordsDontMatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get newPasswordTitle => 'Neues Passwort wählen';

  @override
  String get newPasswordBody =>
      'Du bist angemeldet. Wähle ein neues Passwort für die Anmeldung mit deiner E-Mail-Adresse.';

  @override
  String get savePassword => 'Passwort speichern';

  @override
  String get passwordSaved => 'Passwort gespeichert.';

  @override
  String get passwordTitle => 'Passwort';

  @override
  String get passwordRow =>
      'Passwort für die Anmeldung mit deiner E-Mail-Adresse festlegen oder ändern';

  @override
  String get passwordHelp =>
      'Verwende mindestens 6 Zeichen. Du kannst dich weiterhin mit Google, Apple, einem Passkey oder einem E-Mail-Link anmelden.';

  @override
  String passwordCodeSent(String email) {
    return 'Um dein Konto zu schützen, gib den Code ein, den wir gerade an $email gesendet haben.';
  }

  @override
  String get changeEmailTitle => 'E-Mail ändern';

  @override
  String get changeEmailHelp =>
      'Wir senden einen Bestätigungslink per E-Mail an deine aktuelle und an deine neue Adresse. Die Änderung greift, sobald beide bestätigt sind.';

  @override
  String get newEmail => 'Neue E-Mail-Adresse';

  @override
  String get changeEmailSend => 'Bestätigung senden';

  @override
  String get changeEmailRow =>
      'E-Mail-Adresse ändern, mit der du dich anmeldest';

  @override
  String changeEmailSent(String email) {
    return 'Prüfe beide Posteingänge. $email wird deine E-Mail-Adresse, sobald beide Links bestätigt sind.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Wartet auf Bestätigung: $email';
  }

  @override
  String get signOutEverywhere => 'Überall abmelden';

  @override
  String get signOutEverywhereHelp =>
      'Jedes Telefon, jeder Computer und Browser, einschließlich dieses Geräts';

  @override
  String get signOutEverywhereConfirm =>
      'Auf jedem Gerät abmelden, einschließlich dieses Geräts? Nutze das, wenn du ein Gerät verloren hast oder vermutest, dass jemand anderes angemeldet ist.';

  @override
  String get passkeySuggestTitle => 'Beim nächsten Mal schneller anmelden?';

  @override
  String get passkeySuggestBody =>
      'Füge einen Passkey hinzu und melde dich mit Face ID, einem Fingerabdruck oder deiner Bildschirmsperre an. Kein Passwort und keine E-Mail nötig.';

  @override
  String get passkeys => 'Passkeys';

  @override
  String get passkeysRow =>
      'Mit Face ID, einem Fingerabdruck oder deiner Bildschirmsperre anmelden';

  @override
  String get passkeysHelp =>
      'Ein Passkey meldet dich mit Face ID, einem Fingerabdruck oder deiner Bildschirmsperre an – ohne Passwort oder E-Mail. Jedes Telefon, jeder Computer und jeder Passwortmanager behält seinen eigenen.';

  @override
  String get passkeyAdd => 'Passkey hinzufügen';

  @override
  String get passkeyAddAnother => 'Weiteren Passkey hinzufügen';

  @override
  String get passkeyAdded =>
      'Passkey hinzugefügt. Melde dich beim nächsten Mal damit an.';

  @override
  String get passkeyRename => 'Umbenennen';

  @override
  String get passkeyRenameTitle => 'Passkey umbenennen';

  @override
  String get passkeyNameLabel => 'Name';

  @override
  String get passkeyRemove => 'Entfernen';

  @override
  String passkeyRemoveConfirm(String name) {
    return '„$name“ entfernen? Du kannst dich damit nicht mehr anmelden.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Hinzugefügt: $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Zuletzt genutzt $when';
  }

  @override
  String get twoStepSetUp => 'Authenticator-App einrichten';

  @override
  String get twoStepAddAnother => 'Weiteren Authenticator hinzufügen';

  @override
  String get twoStepScan =>
      'Scanne diesen Code mit einer Authenticator-App (wie 1Password, Google Authenticator oder Authy) oder gib den Einrichtungsschlüssel ein und dann den angezeigten 6-stelligen Code.';

  @override
  String get twoStepKey => 'Einrichtungsschlüssel';

  @override
  String get twoStepCode => '6-stelliger Code';

  @override
  String get twoStepVerify => 'Bestätigen';

  @override
  String get twoStepNowOn => 'Anmeldung in zwei Schritten ist aktiv.';

  @override
  String get twoStepAuthenticators => 'Authenticator-Apps';

  @override
  String get twoStepRename => 'Umbenennen';

  @override
  String get twoStepRenameTitle => 'Authenticator umbenennen';

  @override
  String get twoStepNameLabel => 'Name';

  @override
  String get twoStepNameHint => 'Zum Beispiel: Arbeitshandy';

  @override
  String get twoStepRemove => 'Entfernen';

  @override
  String get twoStepRemoveConfirm =>
      'Diese Authenticator-App entfernen? Wenn es deine einzige ist, meldest du dich wieder nur mit deinem Passwort an.';

  @override
  String get twoStepPromptTitle => 'Code eingeben';

  @override
  String get twoStepPromptBody =>
      'Öffne deine Authenticator-App und gib den 6-stelligen Code ein, um die Anmeldung abzuschließen.';

  @override
  String get twoStepPromptAccount => 'Anmelden als';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Neues Passwort für';

  @override
  String get connectAiAppAccount => 'Erhält Zugriff auf';

  @override
  String joinAsAccount(String email, String server) {
    return 'Du trittst als $email auf $server bei.';
  }

  @override
  String get requireTwoStep =>
      'Anmeldung in zwei Schritten für Inhaber und Admins vorschreiben';

  @override
  String get requireTwoStepHelp =>
      'Inhaber und Admins müssen sie nutzen. Schalte deine zuerst ein.';

  @override
  String get twoStepNeededForAdmin =>
      'Dieser Workspace erfordert Anmeldung in zwei Schritten für Inhaber und Admins. Richte sie ein oder melde dich erneut mit deinem Code an, um Admin-Einstellungen zu nutzen.';

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
  String get adminNoAbuse => 'Nothing suspicious so far.';

  @override
  String get suspendWorkspace => 'Sperren';

  @override
  String get unsuspendWorkspace => 'Sperre aufheben';

  @override
  String get suspendReason => 'Grund';

  @override
  String get suspendWorkspaceHelp =>
      'Seine Computer stoppen und seine Bots arbeiten nicht mehr. Nichts wird gelöscht und du kannst die Sperre jederzeit aufheben.';

  @override
  String workspaceSuspended(String reason) {
    return 'Gesperrt: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Dieser Workspace ist gesperrt, daher können Bots nicht arbeiten und Computer nicht starten. Wende dich an die Betreiber dieses Servers.';

  @override
  String get abuseKind_mining_pool => 'Krypto-Mining blockiert';

  @override
  String get abuseKind_blocked_port => 'Mail-Port blockiert';

  @override
  String get abuseKind_egress_flood => 'Traffic-Flut';

  @override
  String get abuseKind_signup_blocked => 'Registrierung abgelehnt';

  @override
  String get abuseKind_suspended => 'Workspace gesperrt';

  @override
  String get abuseKind_unsuspended => 'Sperre aufgehoben';

  @override
  String get kindLocalMcp => 'Auf einem Computer';

  @override
  String get capMcp => 'Lokale Tools (MCP)';

  @override
  String get localMcpServers => 'Lokale Tools (MCP)';

  @override
  String get localMcpHelp =>
      'MCP-Server auf diesem Computer oder in deinem Netzwerk, die deine Bots nutzen können – etwa T3 Code, Claude Code, Codex oder Design-Apps. Ihre Tokens und Anmeldungen bleiben auf diesem Computer.';

  @override
  String get localMcpAdd => 'Lokalen MCP-Server hinzufügen';

  @override
  String get localMcpEmpty => 'Noch keine lokalen MCP-Server.';

  @override
  String get localMcpName => 'Name';

  @override
  String get localMcpStdio => 'Ein Befehl';

  @override
  String get localMcpLoopback => 'Eine Adresse';

  @override
  String get localMcpCommand => 'Befehl';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Adresse';

  @override
  String get localMcpFolder => 'Arbeitsordner (optional)';

  @override
  String get localMcpEnv =>
      'Umgebung (ein KEY=value pro Zeile, bleibt auf diesem Computer)';

  @override
  String get localMcpNeedsCapability =>
      'Aktiviere oben Lokale Tools (MCP), damit Bots diese nutzen können.';

  @override
  String get localMcpBadUrl =>
      'Verwende eine http://-Adresse auf diesem Computer oder in deinem eigenen Netzwerk, wie http://127.0.0.1:3845/mcp, oder eine https://-Adresse.';

  @override
  String get localMcpBadFolder =>
      'Wähle einen Ordner innerhalb der geteilten Ordner.';

  @override
  String get codingAgents => 'Coding-Agents';

  @override
  String get codingAgentsHelp =>
      'Bots können Programmieraufgaben an diese Agents auf diesem Computer übergeben. Sie nutzen deine eigenen Anmeldungen und arbeiten in den geteilten Ordnern.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString Coding-Agents gefunden',
      one: '1 Coding-Agent gefunden',
      zero: 'Keine Coding-Agents gefunden',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Dieser Server ist noch nicht im Workspace gespeichert. Entferne ihn und füge ihn erneut hinzu.';

  @override
  String get localMcpSignInKind => 'Anmeldung';

  @override
  String get localMcpAuthNone => 'Keine';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Header';

  @override
  String get localMcpAuthOAuth => 'Browser';

  @override
  String get localMcpToken => 'Token (bleibt auf diesem Computer)';

  @override
  String get localMcpHeaderName => 'Header-Name';

  @override
  String get localMcpHeaderValue => 'Header-Wert (bleibt auf diesem Computer)';

  @override
  String get localMcpOAuthHelp =>
      'Casama öffnet deinen Browser, damit du dich bei diesem Server anmelden kannst. Die Anmeldung bleibt auf diesem Computer.';

  @override
  String get localMcpNetworkWarning =>
      'Dieser Server liegt nicht auf diesem Computer. Bots, die diesen Computer nutzen können, erreichen ihn.';

  @override
  String get localMcpSignIn => 'Anmelden';

  @override
  String get localMcpNeedsSignIn => 'Anmeldung nötig';

  @override
  String get localMcpEdit => 'Lokalen MCP-Server bearbeiten';

  @override
  String get localMcpImport => 'Aus anderen Apps hinzufügen';

  @override
  String get localMcpImportHelp =>
      'MCP-Server, die auf diesem Computer bereits in T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex oder Windsurf eingerichtet sind.';

  @override
  String get localMcpImportNone =>
      'Keine MCP-Server in anderen Apps auf diesem Computer gefunden.';

  @override
  String get localMcpImportAdded => 'Bereits hinzugefügt';

  @override
  String get localMcpImportRemote =>
      'Im Internet, daher meist unter Verbindungen hinzugefügt. Füge ihn hier nur hinzu, wenn nur dieser Computer ihn erreichen kann.';

  @override
  String get mcpQuestionDecline => 'Ablehnen';

  @override
  String get mcpQuestionSend => 'Senden';

  @override
  String get cardMcpQuestion => 'Frage';

  @override
  String get cardMcpSignIn => 'Anmeldung';

  @override
  String get mcpSignInHereHelp =>
      'Melde dich an, damit deine Bots sie wieder nutzen können.';

  @override
  String localMcpSignedIn(String name) {
    return 'Bei $name angemeldet';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'Aus $source';
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
      other: '$nString Server hinzufügen',
      one: '1 Server hinzufügen',
      zero: 'Hinzufügen',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (bleibt auf diesem Computer)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name braucht deine Anmeldung';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Öffne Casama auf $device und melde dich dort an.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Öffne Casama auf dem Computer, auf dem dieses Tool läuft, und melde dich dort an.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection fragt';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return '$connection beantwortet';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Frage von $connection abgelehnt';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Frage von $connection geschlossen';
  }

  @override
  String get codingAgentsNone =>
      'Keine Coding-Agents gefunden. Installiere Claude Code, Codex oder den Kommandozeilen-Agent von Cursor, um ihnen Programmieraufgaben zu geben.';

  @override
  String get codingAgentsNeedShell =>
      'Coding-Agents werden als Befehle ausgeführt, daher muss „Befehle ausführen“ eingeschaltet sein.';

  @override
  String get allowCommands => 'Aktivieren';

  @override
  String get codingAgentAllow => 'Erlauben';

  @override
  String get codingAgentAllowed => 'Erlaubt';

  @override
  String get codingAgentsAllowHelp =>
      'Ein Agent mit „Erlauben“ daneben lief auf diesem Computer noch nicht. Erlaube ihn einmal, dann können Bots ihm Aufgaben geben.';

  @override
  String get ownAgentsAdd => 'Eigenen hinzufügen';

  @override
  String get ownAgentYours => 'Deiner';

  @override
  String get ownAgentNotFound => 'Auf diesem Computer nicht gefunden';

  @override
  String get ownAgentsHelp =>
      'Deine eigenen Agents arbeiten nur auf diesem Computer, in Chats, die für dich handeln. Niemand sonst im Workspace kann sie sehen oder ändern.';

  @override
  String get ownAgentFormTitle => 'Eigenen Agent hinzufügen';

  @override
  String get ownAgentEditTitle => 'Deinen Agent bearbeiten';

  @override
  String get ownAgentName => 'Name';

  @override
  String get ownAgentBin => 'Befehlsname';

  @override
  String get ownAgentCommand => 'Befehl';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Setze $task dorthin, wo die Aufgabe hingehört; Casama setzt ihn in Anführungszeichen. Jeder Befehl darin beginnt mit dem Befehlsnamen. Du kannst auch $folder verwenden sowie $result_file, wenn der Agent seine Antwort in eine Datei schreibt.';
  }

  @override
  String get ownAgentResult => 'Antwort lesen';

  @override
  String get ownAgentResultTail => 'Das Ende seiner Ausgabe';

  @override
  String get ownAgentResultJson => 'Eine JSON-Zeile mit einem result-Feld';

  @override
  String get ownAgentResultStream => 'Ein Stream aus JSON-Zeilen';

  @override
  String get ownAgentResultField => 'Ein JSON-Feld';

  @override
  String get ownAgentResultFile => 'In eine Datei geschrieben';

  @override
  String get ownAgentResultFieldName => 'Feldname';

  @override
  String get ownAgentTimeLimit => 'Zeitlimit (Minuten)';

  @override
  String get ownAgentTest => 'Testen';

  @override
  String get ownAgentTestHelp =>
      'Testen bittet ihn auf diesem Computer nur mit dem Wort pong zu antworten und zeigt, was er ausgegeben hat.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Er antwortete: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Er hat nicht wie erwartet geantwortet (Exit $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Er wurde nicht rechtzeitig fertig.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Fülle Name, Befehlsname und einen Befehl mit $task aus.';
  }

  @override
  String get board => 'Board';

  @override
  String get newTicket => 'Neues Ticket';

  @override
  String get newTicketSubtitle =>
      'Eine Aufgabe für einen deiner Bots, verfolgt auf dem Board.';

  @override
  String get allProjects => 'Alle Projekte';

  @override
  String get manageProjects => 'Projekte verwalten';

  @override
  String get filterByProject => 'Nach Projekt filtern';

  @override
  String get moveTo => 'Verschieben nach';

  @override
  String get noMatchingTickets => 'Keine passenden Tickets';

  @override
  String get noMatchingTicketsHelp => 'Keine Tickets passen zu diesen Filtern.';

  @override
  String get clearFilters => 'Filter zurücksetzen';

  @override
  String get ticketTitle => 'Titel';

  @override
  String get ticketDetails => 'Details';

  @override
  String get taskInReview => 'In Prüfung';

  @override
  String get priority => 'Priorität';

  @override
  String get priorityUrgent => 'Dringend';

  @override
  String get priorityHigh => 'Hoch';

  @override
  String get priorityMedium => 'Mittel';

  @override
  String get priorityLow => 'Niedrig';

  @override
  String get priorityNone => 'Keine Priorität';

  @override
  String get filterAll => 'Alle';

  @override
  String get filterMine => 'Meine';

  @override
  String get filterBots => 'Bots';

  @override
  String get assignee => 'Zugewiesen an';

  @override
  String get unassigned => 'Nicht zugewiesen';

  @override
  String get assignToMe => 'Mir';

  @override
  String get reviewRequired => 'Prüfung nötig';

  @override
  String get reviewRequiredHelp =>
      'Der Bot beendet in „In Prüfung“ statt in „Erledigt“.';

  @override
  String get comments => 'Kommentare';

  @override
  String get addComment => 'Kommentar hinzufügen';

  @override
  String get sendComment => 'Senden';

  @override
  String get openThread => 'Thread des Bots öffnen';

  @override
  String get deleteTicket => 'Ticket löschen';

  @override
  String get ticketResult => 'Ergebnis';

  @override
  String get noCommentsYet =>
      'Noch keine Kommentare. Hinterlasse eine Notiz für den Bot oder dein Team.';

  @override
  String get noTickets => 'Gib deinen Bots etwas zu tun';

  @override
  String get noTicketsHelp =>
      'Übergib eine einzelne Aufgabe oder ein ganzes Ziel. Du kannst den Fortschritt hier verfolgen.';

  @override
  String get tasksStartTicket => 'Ticket hinzufügen';

  @override
  String get tasksStartTicketHelp =>
      'Eine einzelne Aufgabe. Weise sie einem Bot zu und er legt los.';

  @override
  String get tasksStartProject => 'Projekt starten';

  @override
  String get tasksStartProjectHelp =>
      'Ein größeres Ziel. Ein Bot plant es als Tickets und wartet auf dein OK.';

  @override
  String get tasksExamples => 'Oder starte mit einem davon';

  @override
  String get tasksExampleResearch =>
      'Meine drei größten Wettbewerber recherchieren';

  @override
  String get tasksExampleDraft => 'Eine Launch-Ankündigung entwerfen';

  @override
  String get tasksExampleTidy => 'Meine Dateien aufräumen';

  @override
  String get ticketStatus => 'Status';

  @override
  String get spaces => 'Workspaces';

  @override
  String get newWorkspace => 'Neuer Workspace';

  @override
  String get newWorkspaceSubtitle =>
      'Ein eigener Bereich für ein Team, mit eigenen Bots, Chats und Mitgliedern.';

  @override
  String get joinWorkspaceHelp =>
      'Füge den Einladungslink ein, den dir jemand geschickt hat.';

  @override
  String get inviteLinkField => 'Einladungslink';

  @override
  String get workspaceIcon => 'Symbol';

  @override
  String get workspaceColor => 'Farbe';

  @override
  String get workspaceSettings => 'Workspace-Einstellungen';

  @override
  String get workspaceSettingsHelp => 'Name, Symbol, Farbe und Einladungslinks';

  @override
  String get inviteLinks => 'Einladungslinks';

  @override
  String get inviteLinksHelp =>
      'Alle mit einem Link können nach der Anmeldung beitreten, bis der Link abläuft, seine Verwendungen aufgebraucht sind oder du ihn widerrufst.';

  @override
  String get createInviteLink => 'Link erstellen';

  @override
  String get linkExpires => 'Läuft ab';

  @override
  String get linkNever => 'Nie';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In $daysString Tagen',
      one: 'In 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Verwendungen';

  @override
  String get linkUnlimited => 'Unbegrenzt';

  @override
  String linkUses(String uses) {
    return '$uses genutzt';
  }

  @override
  String get linkRevoked => 'Widerrufen';

  @override
  String get revokeLink => 'Widerrufen';

  @override
  String get linkCopied => 'Einladungslink kopiert.';

  @override
  String get inviteRole => 'Rolle';

  @override
  String get shareLinkLabel => 'Teilen';

  @override
  String get botFolder => 'Ordner';

  @override
  String get noFolder => 'Kein Ordner';

  @override
  String get newFolder => 'Neuer Ordner…';

  @override
  String get folderName => 'Ordnername';

  @override
  String get archiveBot => 'Bot archivieren';

  @override
  String archiveBotTitle(String name) {
    return '$name archivieren?';
  }

  @override
  String get archiveBotBody =>
      'Er verlässt die Seitenleiste und arbeitet nicht mehr. Seine Chats und der Verlauf bleiben erhalten und du kannst ihn unter Archivierte Bots zurückholen.';

  @override
  String get archive => 'Archivieren';

  @override
  String get archivedBots => 'Archivierte Bots';

  @override
  String get unarchive => 'Zurückholen';

  @override
  String botArchived(String name) {
    return '$name archiviert.';
  }

  @override
  String get settingsHistory => 'Einstellungsverlauf';

  @override
  String get settingsHistoryHelp =>
      'Jede Änderung an den Einstellungen dieses Bots und wer sie vorgenommen hat';

  @override
  String get noHistory => 'Noch keine Änderungen.';

  @override
  String get restoreSettings => 'Diese Einstellungen wiederherstellen';

  @override
  String restoreSettingsBody(String fields) {
    return '$fields wieder so herstellen, wie sie vor dieser Änderung waren? Die aktuellen Einstellungen bleiben im Verlauf.';
  }

  @override
  String changedByBot(String name) {
    return 'Geändert von $name';
  }

  @override
  String get changedByPerson => 'Geändert von einer Person';

  @override
  String get changedBySystem => 'Geändert von Casama';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldInstructions => 'Anweisungen';

  @override
  String get fieldModel => 'Modell';

  @override
  String get fieldAutonomy => 'Autonomie';

  @override
  String get fieldBudget => 'Budget';

  @override
  String get fieldComputer => 'Computer';

  @override
  String get fieldArchived => 'archiviert';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot braucht einen $service-Schlüssel';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Nur für $hosts';
  }

  @override
  String get secretRequestHelp =>
      'Geht direkt in den Tresor. Der Bot sieht ihn nie.';

  @override
  String secretSaved(String name) {
    return '$name gespeichert';
  }

  @override
  String get secretDeclined => 'Abgelehnt';

  @override
  String secretWhat(String service) {
    return '$service-Schlüssel';
  }

  @override
  String totpWhat(String service) {
    return '$service-Anmeldecode';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Zurückgegeben: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Dein Login für $host wurde geteilt';
  }

  @override
  String get shareLogin => 'Login teilen';

  @override
  String get shareLoginUsername => 'E-Mail oder Benutzername';

  @override
  String get shareLoginPassword => 'Passwort';

  @override
  String get shareLoginRemember => 'Für das nächste Mal merken';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Wird nur auf $host genutzt. $bot sieht dein Passwort nie.';
  }

  @override
  String get shareLoginSave => 'Speichern und anmelden';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot braucht deine Anmeldung bei $host';
  }

  @override
  String get signInOnPage => 'Auf Seite anmelden';

  @override
  String loginOnPageLine(String host) {
    return 'Melde dich auf der Seite bei $host an';
  }

  @override
  String get loginOnPageHelp =>
      'Melde dich auf der Seite an und tippe dann auf Zurückgeben.';

  @override
  String get back => 'Zurück';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Nicht geteilt: dein Kalender',
      'reminders': 'Nicht geteilt: deine Erinnerungen',
      'contacts': 'Nicht geteilt: deine Kontakte',
      'places': 'Nicht geteilt: deine Orte',
      'photos': 'Nicht geteilt: deine Fotos',
      'health': 'Nicht geteilt: deine Gesundheitsdaten',
      'notifications': 'Nicht geteilt: deine Benachrichtigungen',
      'activity': 'Nicht geteilt: deine Computeraktivität',
      'browserTab': 'Nicht geteilt: dein aktueller Browser-Tab',
      'browserHistory':
          'Nicht geteilt: dein Browserverlauf und deine Lesezeichen',
      'alarm': 'Nicht geteilt: deine Wecker',
      'home': 'Nicht geteilt: dein Home-Zubehör',
      'other': 'Nicht geteilt: deine Gerätedaten',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Ablehnen';

  @override
  String get signInCode => 'Anmeldecode';

  @override
  String get secretKindValue => 'Schlüssel oder Passwort';

  @override
  String get totpSeedLabel =>
      'Einrichtungsschlüssel, otpauth://-Link oder der Code, den du jetzt siehst';

  @override
  String get totpSeedHelp =>
      'Ein Einrichtungsschlüssel aus der Zwei-Schritt-Einrichtung der Website lässt den Bot jeden späteren Code selbst erzeugen (er sieht den Schlüssel nie). Oder gib den Code ein, den du jetzt siehst: Der geht direkt an den Bot.';

  @override
  String get scanQrCode => 'QR-Code scannen';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot braucht einen $service-Anmeldecode';
  }

  @override
  String get search => 'Suche';

  @override
  String get searchHint =>
      'Chats, Erinnerungen, Skills, Tickets und Dateien durchsuchen';

  @override
  String get searchEmptyPrompt => 'Gib mindestens 2 Zeichen ein.';

  @override
  String searchNoResults(String query) {
    return 'Nichts gefunden für „$query“.';
  }

  @override
  String get searchMessages => 'Nachrichten';

  @override
  String get searchChats => 'Chats';

  @override
  String get searchTickets => 'Tickets';

  @override
  String get searchFiles => 'Dateien';

  @override
  String get searchFilesAsleep =>
      'Dateien auf schlafenden Computern werden nicht durchsucht. Starte einen Computer, um seine Dateien einzuschließen.';

  @override
  String get searchJumpHint => 'Suchen oder springen zu…';

  @override
  String get searchRecent => 'Zuletzt';

  @override
  String get searchClearRecent => 'Leeren';

  @override
  String get searchRemoveRecent => 'Aus letzten Suchen entfernen';

  @override
  String get searchJumpBackIn => 'Wieder einsteigen';

  @override
  String get searchNeedsYou => 'Braucht dich';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Sachen warten auf dich',
      one: '1 Sache wartet auf dich',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Gehe zu';

  @override
  String get searchTopHits => 'Top-Treffer';

  @override
  String get searchScopeAll => 'Alle';

  @override
  String get searchMemories => 'Erinnerungen';

  @override
  String get searchKeepTyping =>
      'Tippe weiter, um Nachrichten, Erinnerungen und Dateien zu durchsuchen.';

  @override
  String searchAskBot(String bot, String query) {
    return '$bot zu „$query“ fragen';
  }

  @override
  String get searchAskBotHelp => 'Startet einen neuen Chat mit dieser Frage';

  @override
  String get searchKeysHint =>
      '↑ ↓ zum Bewegen   ↵ zum Öffnen   esc zum Schließen';

  @override
  String get searchClear => 'Suche leeren';

  @override
  String get installFor => 'Installieren für';

  @override
  String get wholeWorkspace => 'Den gesamten Workspace';

  @override
  String get skillCatalog => 'Skill-Katalog';

  @override
  String get searchSkills => 'Skills durchsuchen';

  @override
  String get all => 'Alle';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Installieren';

  @override
  String skillInstalled(String name) {
    return '$name installiert.';
  }

  @override
  String get noResults => 'Keine Ergebnisse.';

  @override
  String get importFromGitHub => 'Von GitHub importieren';

  @override
  String get importFromGitHubHelp =>
      'Füge einen Link zu einem Ordner mit einer SKILL.md ein. Du siehst jede Datei, bevor etwas installiert wird. Private Repositories nutzen ein GITHUB_TOKEN-Geheimnis, das für api.github.com erlaubt ist.';

  @override
  String get preview => 'Vorschau';

  @override
  String get skillScriptsNote =>
      'Skripte in einem Skill werden immer nur auf dem Computer eines Bots ausgeführt, niemals auf dem Server.';

  @override
  String get binaryFile => '(Binärdatei)';

  @override
  String skillUpdate(String name) {
    return '$name aktualisieren';
  }

  @override
  String get checkingForUpdates => 'Suche nach Updates…';

  @override
  String get skillUpToDate => 'Bereits aktuell.';

  @override
  String get update => 'Aktualisieren';

  @override
  String get filesAdded => 'Hinzugefügt';

  @override
  String get filesChanged => 'Geändert';

  @override
  String get filesRemoved => 'Entfernt';

  @override
  String get fromCatalog => 'Aus dem Katalog';

  @override
  String get savedByBot => 'Von einem Bot gespeichert';

  @override
  String get checkForUpdates => 'Nach Updates suchen';

  @override
  String get attachSkill => 'Skill anhängen';

  @override
  String get rerunSetup => 'Einrichtung erneut ausführen';

  @override
  String get rerunSetupHelp =>
      'Einrichtungsfragen erneut beantworten und einen neuen Vorschlag prüfen';

  @override
  String get trace => 'Ablauf';

  @override
  String get openTrace => 'Ablauf öffnen';

  @override
  String get editMessage => 'Bearbeiten';

  @override
  String get editMessageHelp =>
      'Beim Senden wird die Unterhaltung ab hier neu ausgeführt. Die ursprüngliche Version bleibt erhalten; wechsle mit den Pfeilen.';

  @override
  String get previousVersion => 'Vorherige Version';

  @override
  String get nextVersion => 'Nächste Version';

  @override
  String get quietHours => 'Ruhezeit';

  @override
  String get quietHoursHelp =>
      'Benachrichtigungen warten bis zum Ende der Ruhezeit; dein Posteingang füllt sich weiter. Freigaben für einen Chat, in dem du gerade bist, kommen trotzdem durch.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start bis $end';
  }

  @override
  String get off => 'Aus';

  @override
  String get botNotifications => 'Benachrichtigungen von diesem Bot';

  @override
  String get botNotificationsHelp => 'Ob dieser Bot deiner Ruhezeit folgt';

  @override
  String get botMayCall => 'Darf mich anrufen';

  @override
  String get botMayCallHelp =>
      'Dieser Bot kann dich anrufen, wenn etwas einen Anruf wert ist. Aus: Er sendet stattdessen eine Benachrichtigung.';

  @override
  String get quietDefault => 'Meiner Ruhezeit folgen';

  @override
  String get quietAlways => 'Mich immer benachrichtigen';

  @override
  String get quietCustom => 'Eigene Ruhezeit';

  @override
  String get from => 'Von';

  @override
  String get until => 'Bis';

  @override
  String get shareAsTemplate => 'Als Vorlage teilen';

  @override
  String get shareAsTemplateRow =>
      'Eine Datei oder ein Link mit Anweisungen, Skills und Routinen';

  @override
  String get shareAsTemplateHelp =>
      'Enthält Anweisungen, Skills, Routinen und die genutzten Dienste. Niemals Schlüssel oder Geheimnisse.';

  @override
  String get copyLink => 'Link kopieren';

  @override
  String get includeMemories => 'Erinnerungen einbeziehen';

  @override
  String get includeMemoriesHelp =>
      'Was er über dich gelernt hat. Mit Bedacht teilen.';

  @override
  String get saveAsFile => 'Als Datei speichern';

  @override
  String get notABotTemplate => 'Diese Datei ist keine Casama-Bot-Vorlage.';

  @override
  String get importBot => 'Bot importieren';

  @override
  String botImported(String name) {
    return '$name ist bereit.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name ist bereit. Verbinde $services unter Verbindungen, damit er sie nutzen kann.';
  }

  @override
  String get whatComesWithIt => 'Was dabei ist';

  @override
  String get connectAfterImport => 'Nach dem Import verbinden';

  @override
  String get importRoutines => 'Seine Routinen planen';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seine $countString Erinnerungen behalten',
      one: 'Seine 1 Erinnerung behalten',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Routine wird gestartet…';

  @override
  String get offlineSaved =>
      'Offline. Gespeicherte Nachrichten werden angezeigt.';

  @override
  String get loadEarlierMessages => 'Frühere Nachrichten';

  @override
  String get chatLoadFailedTitle => 'Dieser Chat konnte nicht geladen werden';

  @override
  String get chatLoadFailedBody =>
      'Prüfe deine Verbindung und versuch es erneut.';

  @override
  String get projects => 'Projekte';

  @override
  String get newProject => 'Neues Projekt';

  @override
  String get noProjects => 'Noch keine Projekte';

  @override
  String get projectsHelp =>
      'Ein Projekt hält ein Vorhaben zusammen: Chat, Plan, Aufgaben, Dateien und alles, was dafür entsteht. Arbeite mit einem Bot daran oder lass den Bot es planen und selbstständig abarbeiten.';

  @override
  String get newProjectHelp =>
      'Hält ein Vorhaben zusammen: Chat, Plan, Aufgaben, Dateien und alles, was dafür entsteht.';

  @override
  String get startPlanning => 'Planung starten';

  @override
  String get projectTitle => 'Titel';

  @override
  String get projectGoal => 'Ziel';

  @override
  String get projectDoneWhen => 'Erledigt, wenn';

  @override
  String get projectLead => 'Leitender Bot';

  @override
  String get projectBudget => 'Budget';

  @override
  String get projectGoalHint =>
      'Was soll am Ende stehen? Eine Landing-Seite live auf meiner Domain…';

  @override
  String get projectDoneHint => 'Optional. Woran du merkst, dass es fertig ist';

  @override
  String get projectBudgetHint =>
      'Optional. Arbeit pausiert, wenn es aufgebraucht ist';

  @override
  String get projectThread => 'Projekt-Chat';

  @override
  String get approvePlan => 'Plan freigeben';

  @override
  String get pause => 'Pausieren';

  @override
  String get resume => 'Fortsetzen';

  @override
  String get milestones => 'Meilensteine';

  @override
  String get needsSignoff => 'braucht deine Abnahme';

  @override
  String get signOff => 'Abnehmen';

  @override
  String get projectPlan => 'Plan';

  @override
  String get tickets => 'Tickets';

  @override
  String get projectTimeline => 'Zeitachse';

  @override
  String get projectPlanning => 'In Planung';

  @override
  String get projectActive => 'Aktiv';

  @override
  String get projectPaused => 'Pausiert';

  @override
  String get projectBlocked => 'Blockiert';

  @override
  String get projectDone => 'Erledigt';

  @override
  String get projectCancelled => 'Abgebrochen';

  @override
  String get projectName => 'Name';

  @override
  String get projectNameHint => 'Space Dodger, Frühlings-Newsletter…';

  @override
  String get createProject => 'Projekt erstellen';

  @override
  String projectWorksAlone(String bot) {
    return '$bot allein daran arbeiten lassen';
  }

  @override
  String get projectWorksAloneHelp =>
      'Er entwirft einen Plan zur Freigabe und arbeitet dann in Sitzungen weiter, bis das Ziel erreicht ist. Nichts startet, bevor du ihn freigibst.';

  @override
  String get projectWorksAloneOn =>
      'Arbeitet in Sitzungen, bis das Ziel erreicht ist.';

  @override
  String get projectWorksAloneOff => 'Ihr arbeitet gemeinsam im Chat daran.';

  @override
  String get projectMade => 'In diesem Projekt erstellt';

  @override
  String projectMadeEmpty(String bot) {
    return 'Noch nichts. Was $bot im Chat dieses Projekts erstellt, erscheint hier.';
  }

  @override
  String get projectSeeAll => 'Alle ansehen';

  @override
  String get projectTodos => 'Aufgaben';

  @override
  String get projectFiles => 'Dateien';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder auf dem Computer von $bot';
  }

  @override
  String get projectMarkDone => 'Als erledigt markieren';

  @override
  String get projectReopen => 'Wieder öffnen';

  @override
  String get projectCover => 'Titelbild';

  @override
  String get projectCoverNone => 'Keines';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Segelboot',
      'mountain': 'Berg',
      'seedling': 'Setzling',
      'compass': 'Kompass',
      'lantern': 'Laterne',
      'telescope': 'Teleskop',
      'map': 'Karte',
      'chess': 'Schach',
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
      other: '$countString Elemente',
      one: '1 Element',
      zero: 'Noch nichts',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Projekt';

  @override
  String get creationMoveToProject => 'In Projekt verschieben';

  @override
  String get creationNoProject => 'Kein Projekt';

  @override
  String get makeProject => 'Zum Projekt machen';

  @override
  String get makeProjectTitle => 'Dieses Thema zu einem Projekt machen';

  @override
  String makeProjectHelp(String bot) {
    return 'Was $bot in diesem Thema erstellt hat, wird unter dem Projekt abgelegt, ebenso wie alles Weitere hier.';
  }

  @override
  String get openProject => 'Projekt öffnen';

  @override
  String get theBot => 'der Bot';

  @override
  String get forYou => 'Für dich';

  @override
  String get inboxNeedsYou => 'Braucht dich';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Braucht dich ($nString)';
  }

  @override
  String get inboxBriefs => 'Briefings';

  @override
  String get inboxUpdates => 'Updates';

  @override
  String get inboxEmptyHelp =>
      'Anfragen, Morgen-Briefings, Benachrichtigungen und neue Seiten deiner Bots erscheinen hier.';

  @override
  String get inboxNeedsYouEmpty => 'Gerade braucht dich nichts';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Wenn ein Bot eine Entscheidung oder deine Hilfe braucht oder eine Idee hat, erscheint es hier.';

  @override
  String get noBriefs => 'Noch keine Morgen-Briefings';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot hat $title veröffentlicht';
  }

  @override
  String get forYouEmpty => 'Gerade nichts für dich';

  @override
  String get forYouEmptyHelp =>
      'Aktiviere Meldungen in den Einstellungen eines Bots für ein Morgen-Briefing und Vorschläge über den Tag.';

  @override
  String morningBriefFrom(String name) {
    return 'Morgen-Briefing von $name';
  }

  @override
  String get suggestions => 'Vorschläge';

  @override
  String suggestedBy(String name) {
    return 'Vorgeschlagen von $name';
  }

  @override
  String get dismissSuggestion => 'Diesen Vorschlag verwerfen?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Wähle, ob $bot ihn wieder ansprechen darf.';
  }

  @override
  String get justThisOnce => 'Nur dieses Mal';

  @override
  String justThisOnceHelp(String bot) {
    return 'Vorerst ausblenden. Wenn es später noch wichtig ist, schlägt $bot es vielleicht wieder vor.';
  }

  @override
  String get dontSuggestAgain => 'Nicht mehr vorschlagen';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Endgültig weg. $bot merkt sich, dass du das lieber nicht möchtest.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Verstanden. $bot schlägt das nicht mehr vor.';
  }

  @override
  String get doIt => 'Machen';

  @override
  String get checkins => 'Meldungen';

  @override
  String get checkinsHelp =>
      'Ein Morgen-Briefing und alle paar Stunden ein kurzer Blick darauf, ob dich etwas braucht. Standardmäßig aus.';

  @override
  String get briefTime => 'Morgen-Briefing um';

  @override
  String get scanEvery => 'Prüfen alle';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Stunden',
      one: '1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Tageslimit';

  @override
  String get on => 'Ein';

  @override
  String get actionRules => 'Aktionsregeln';

  @override
  String get actionRulesRow => 'Was er ohne Fragen tun darf';

  @override
  String get actionRulesHelp =>
      'Regeln entscheiden pro Aktion: erlauben, im Rahmen erlauben, vorher fragen oder dir zum Abschließen übergeben. Die genaueste Regel gewinnt; ohne Regel entscheidet die Autonomie des Bots. Bots können ihre eigenen Regeln nicht ändern.';

  @override
  String get addRule => 'Regel hinzufügen';

  @override
  String get addRuleHelp =>
      'Wähle, was der Bot tut und wie er damit umgehen soll.';

  @override
  String get noRules =>
      'Noch keine Regeln. Die Autonomiestufe des Bots entscheidet.';

  @override
  String get otherTools => 'Bestimmte Tools';

  @override
  String get workspaceRule => 'Workspace-Regel';

  @override
  String get catSend => 'Nachrichten senden';

  @override
  String get catPay => 'Zahlungen';

  @override
  String get catDelete => 'Löschen';

  @override
  String get catPublish => 'Veröffentlichen';

  @override
  String get catShare => 'Teilen und Einladungen';

  @override
  String get catSignIn => 'Anmelden';

  @override
  String get whenTheBot => 'Wenn der Bot';

  @override
  String get itShould => 'Er soll';

  @override
  String get ruleAllow => 'Einfach machen';

  @override
  String get ruleAllowLimits => 'Im Rahmen machen';

  @override
  String get ruleAsk => 'Vorher fragen';

  @override
  String get ruleHandOff => 'Mir zum Abschließen übergeben';

  @override
  String get ruleDomains => 'Nur an diese Domains (kommagetrennt)';

  @override
  String get ruleMaxAmount => 'Bis zu diesem Betrag';

  @override
  String get ruleForWorkspace => 'Für jeden Bot im Workspace';

  @override
  String get watchers => 'Beobachtungen';

  @override
  String get watchersRow => 'Was er im Blick behält';

  @override
  String get noWatchers => 'Beobachtet nichts';

  @override
  String get watchersHelp =>
      'Sag dem Bot „Sag mir Bescheid, wenn…“ und er beobachtet eine Seite, eine Antwort, ein Ergebnis oder eine Uhrzeit. Prüfungen kosten nichts, bis sich etwas ändert.';

  @override
  String get watcherActive => 'Beobachtet';

  @override
  String get watcherPaused => 'Pausiert';

  @override
  String get watcherDone => 'Erledigt';

  @override
  String get watcherExpired => 'Abgelaufen';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mal ausgelöst',
      one: 'einmal ausgelöst',
      zero: 'noch nicht ausgelöst',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'KI-App verbinden';

  @override
  String connectAiAppAsk(String app) {
    return '$app möchte Casama nutzen';
  }

  @override
  String get connectAiAppHelpShort =>
      'Sie kann deine Bots auflisten, ihnen Aufgaben geben und Ergebnisse in dem von dir gewählten Workspace lesen – als du. Die Freigaben und Regeln deiner Bots gelten weiterhin.';

  @override
  String get connectAiAppSendsTo => 'Nach dem Erlauben kehrst du zurück zu';

  @override
  String get connectAiAppUnknown =>
      'Casama kennt diese Adresse nicht. Jeder kann einer App einen beliebigen Namen geben – erlaube es nur, wenn du diese Verbindung selbst gestartet hast und dieser Website vertraust.';

  @override
  String get connectAiAppDone => 'Fertig. Du kannst zur KI-App zurückkehren.';

  @override
  String get refuse => 'Ablehnen';

  @override
  String get allow => 'Erlauben';

  @override
  String get connectAiApps => 'KI-Apps verbinden';

  @override
  String get connectAiAppsHelp =>
      'Apps, die MCP unterstützen, verbinden sich mit dieser Adresse und melden sich an oder nutzen einen API-Schlüssel. Sie handeln als die Person, die sie verbunden hat.';

  @override
  String get connectedAiApps => 'Verbundene KI-Apps';

  @override
  String get connectedAiAppsHelp =>
      'Apps, die du per Anmeldung verbunden hast. Trennst du eine, verliert sie sofort den Zugriff auf diesen Workspace.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Apps, die Personen in diesem Workspace per Anmeldung verbunden haben. Trennst du eine, verliert sie sofort den Zugriff.';

  @override
  String get noConnectedAiApps => 'Noch keine KI-Apps verbunden.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Genutzt $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Verbunden $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Sie funktioniert in diesem Workspace ab sofort nicht mehr. Um sie wieder zu nutzen, verbinde sie erneut aus der App.';

  @override
  String get mcpApprovals => 'Freigaben aus KI-Apps erlauben';

  @override
  String get mcpApprovalsHelp =>
      'Verbundene Apps können Aktionen deiner Bots freigeben.';

  @override
  String get newApiKey => 'Neuer API-Schlüssel';

  @override
  String get apiKeyName => 'Name';

  @override
  String get newGroupChat => 'Neuer Gruppenchat';

  @override
  String get groupChats => 'Gruppenchats';

  @override
  String groupWhoAnswers(String names) {
    return '$names antworten';
  }

  @override
  String get groupEveryoneAnswers => 'Alle antworten';

  @override
  String get groupMentionHint => 'Einen Bot mit @ erwähnen oder @everyone';

  @override
  String routineRan(String name) {
    return 'Routine „$name“ lief';
  }

  @override
  String groupBotCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bots',
      one: '1 Bot',
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
      other: '$countString Sachen warten auf dich',
      one: '1 Sache wartet auf dich',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Bringe 2 bis 10 Bots in einen Chat. @Name fragt einen Bot; @everyone bittet die Leitung, die Arbeit zu planen und aufzuteilen.';

  @override
  String get groupCreate => 'Gruppenchat erstellen';

  @override
  String get groupCrewEmpty => 'Wähle unten Bots aus, um die Gruppe zu bilden.';

  @override
  String get groupLeadShort => 'Leitung';

  @override
  String get groupMakeLead => 'Zur Leitung machen';

  @override
  String groupRemoveBot(String name) {
    return '$name entfernen';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch $count Bots wählen',
      one: 'Noch 1 Bot wählen',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Das sind 10 Bots – das Maximum für eine Gruppe.';

  @override
  String get groupLeadHint =>
      'Die Leitung plant die Arbeit, wenn du @everyone nutzt. Tippe oben auf einen anderen Bot, um ihn zur Leitung zu machen.';

  @override
  String get groupNeedTwoBots =>
      'Ein Gruppenchat braucht mindestens zwei Bots. Erstelle zuerst einen weiteren Bot.';

  @override
  String get groupSearchBots => 'Bots suchen';

  @override
  String get groupNoMatch => 'Kein Bot passt zu diesem Namen.';

  @override
  String get groupTitle => 'Name (optional)';

  @override
  String get groupPickBots => 'Bots';

  @override
  String get groupLead => 'Leitet die Gruppe';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Seiten';

  @override
  String get pagesRow => 'Berichte und Dashboards, die er veröffentlicht hat';

  @override
  String get noPages => 'Noch keine Seiten';

  @override
  String get pagesHelp =>
      'Bitte einen Bot um einen Bericht, ein Dashboard oder einen Tracker, und er kann es als Seite veröffentlichen. Seiten öffnen in deinem Browser und bleiben privat, bis du sie teilst.';

  @override
  String get pagePrivate => 'Nur ich';

  @override
  String get pageWorkspace => 'Workspace';

  @override
  String get pagePublic => 'Alle mit dem Link';

  @override
  String get pageRefreshes => 'Aktualisiert sich nach Zeitplan';

  @override
  String get pageCardOpen => 'Seite · Zum Öffnen tippen';

  @override
  String get exportPdf => 'PDF exportieren';

  @override
  String get pageMakePublicTitle => 'Diese Seite öffentlich machen?';

  @override
  String get pageMakePublicBody =>
      'Jeder mit dem Link kann sie öffnen, einschließlich der Daten darauf. Du kannst das jederzeit rückgängig machen; der Link funktioniert dann nicht mehr.';

  @override
  String get pageMakePublic => 'Öffentlich machen';

  @override
  String get pagePublicLinkTitle => 'Öffentlicher Link';

  @override
  String get pagePublicLinkBody =>
      'Kopiert. Er wird nicht in Suchmaschinen gelistet.';

  @override
  String deletePageTitle(String title) {
    return '„$title“ löschen?';
  }

  @override
  String get openPages => 'In Seiten öffnen';

  @override
  String get discard => 'Verwerfen';

  @override
  String get discardChangesTitle => 'Änderungen verwerfen?';

  @override
  String get discardChangesBody => 'Deine Änderungen wurden nicht gespeichert.';

  @override
  String get keepEditing => 'Weiter bearbeiten';

  @override
  String get teachTask => 'Aufgabe beibringen';

  @override
  String get teachWhichBot => 'Welcher Bot soll das lernen?';

  @override
  String get teachRecording => 'Aufnahme';

  @override
  String get teachRecordingPaused => 'Aufnahme gestoppt';

  @override
  String get teachRecordingHelp =>
      'Erledige die Aufgabe wie gewohnt. Jeder Schritt wird mit dem Bildschirminhalt gespeichert; Passwortfelder niemals.';

  @override
  String get teachStop => 'Stopp';

  @override
  String get teachMarkSecret => 'Als Geheimnis markieren';

  @override
  String get teachMarkSecretHelp =>
      'Was du gerade getippt hast, wird aus der Aufnahme gelöscht und zu einer geheimen Eingabe, nach der der Bot fragt.';

  @override
  String get teachDraftTitle => 'Neuer Skill';

  @override
  String get teachDrafting => 'Schreibe einen Skill aus deiner Aufnahme…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Schritte',
      one: '1 Schritt',
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
      other: '$countString Schritte',
      one: '1 Schritt',
    );
    return 'Was du gezeigt hast ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Prüfe Schritte, Eingaben und Erfolgsprüfungen und speichere dann. Du kannst ihn sofort ausprobieren.';

  @override
  String get teachDraftFailed =>
      'Der Bot konnte keinen Entwurf schreiben. Schreibe die Schritte unten selbst aus der Aufnahme oder verwirf sie.';

  @override
  String get teachAlreadySaved => 'Dieser Skill ist gespeichert';

  @override
  String get teachSaveAndTry => 'Speichern und testen';

  @override
  String teachSaved(String name) {
    return '$name gespeichert';
  }

  @override
  String get teachDiscardTitle => 'Diese Aufnahme verwerfen?';

  @override
  String get teachDiscardBody =>
      'Jeder erfasste Schritt, Snapshot und Screenshot wird gelöscht.';

  @override
  String teachStepClick(int x, int y) {
    return 'Klick bei $x, $y';
  }

  @override
  String teachStepType(String text) {
    return '„$text“ eingeben';
  }

  @override
  String teachStepSecret(String name) {
    return 'Geheimnis $name eingeben';
  }

  @override
  String teachStepKey(String key) {
    return '$key drücken';
  }

  @override
  String get teachStepScroll => 'Scrollen';

  @override
  String get plugins => 'Plugins';

  @override
  String get pluginsRow => 'Skills und Tools aus Plugin-Paketen';

  @override
  String get noPlugins => 'Noch keine Plugins';

  @override
  String get pluginsHelp =>
      'Plugins sind Pakete im Format Agent Plugins 1.0 auf GitHub. Sie können Skills und MCP-Tools mitbringen; ihre Server arbeiten auf dem Computer dieses Bots, niemals auf den Servern von Casama.';

  @override
  String get addPlugin => 'Plugin hinzufügen';

  @override
  String get addPluginHelp =>
      'Füge einen GitHub-Link zum Ordner des Plugins ein. Du siehst, was es hinzufügt, bevor etwas installiert wird.';

  @override
  String get pluginAdds => 'Es fügt hinzu';

  @override
  String pluginStdio(String command) {
    return 'Läuft auf dem Computer des Bots: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Verbindet mit $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Spricht mit: $hosts';
  }

  @override
  String get pluginSkill => 'Skill';

  @override
  String get pluginHosts => 'Netzwerk';

  @override
  String get pluginServerError => 'Konnte nicht starten';

  @override
  String get pluginRunsOnComputer => 'Läuft auf dem Computer des Bots';

  @override
  String get pluginWhereToolsRun => 'Wo die Tools ausgeführt werden';

  @override
  String get pluginWhereToolsRunHelp =>
      'Auf deinem eigenen Computer können die Tools nutzen, was dort ist, und nur du kannst sie in deinen eigenen Chats verwenden. Server im Internet sind nicht betroffen.';

  @override
  String get pluginPlaceBot => 'Computer des Bots';

  @override
  String pluginPlaceMine(String name) {
    return 'Mein Computer: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Läuft auf $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Seine Tools funktionieren nur in Chats mit der Person, der dieser Computer gehört';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Offline: Seine Tools funktionieren wieder, wenn die Casama-App dort geöffnet ist';

  @override
  String get pluginUpToDate => 'Bereits aktuell';

  @override
  String get checkForUpdate => 'Nach Update suchen';

  @override
  String get uninstall => 'Deinstallieren';

  @override
  String uninstallPluginTitle(String name) {
    return '$name deinstallieren?';
  }

  @override
  String get uninstallPluginBody =>
      'Seine Skills, Tools, Dateien und gespeicherten Geheimnisse werden von diesem Bot entfernt.';

  @override
  String updatePluginTitle(String name) {
    return '$name aktualisieren';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Neue Skills: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Geänderte Skills: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Entfernte Skills: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Neue Tool-Server: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Geänderte Tool-Server: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Entfernte Tool-Server: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Spricht mit neuen Hosts: $hosts';
  }

  @override
  String get pluginDiffNone => 'Keine Änderungen an den Inhalten.';

  @override
  String get next => 'Weiter';

  @override
  String get botNameLabel => 'Name';

  @override
  String get importAgent => 'Agent importieren';

  @override
  String get importAgentHelp =>
      'Übertrage einen Bot von OpenClaw oder Hermes Agent oder füge ein Setup aus Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark oder Instinct ein: seine Persona, Skills, Zeitpläne und Erinnerungen. Du prüfst alles, bevor es erstellt wird. Schlüssel und Einstellungsdateien werden nie gelesen.';

  @override
  String get importAgentPickFolder => 'Ordner auswählen';

  @override
  String get importAgentPickZip => 'ZIP seines Ordners hochladen';

  @override
  String get importPasteChoice => 'Bot-Setup einfügen';

  @override
  String get importPasteChoiceHelp =>
      'Aus Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct oder einer anderen App';

  @override
  String get importPasteTitle => 'Bot-Setup einfügen';

  @override
  String get importPasteHelp =>
      'Sende deinem Bot den Prompt unten und füge dann seine ganze Antwort ein. Du prüfst alles, bevor der neue Bot erstellt wird.';

  @override
  String get importPasteSource => 'Wo ist dein Bot jetzt?';

  @override
  String get importPasteOther => 'Woanders';

  @override
  String get importPasteStep1 => '1. Sende deinem Bot diesen Prompt';

  @override
  String get importPasteReply => '2. Füge seine Antwort ein';

  @override
  String get importPasteSafety =>
      'Zeilen, die wie Schlüssel, Passwörter oder Kartennummern aussehen, werden entfernt. Melde dich nach dem Import wieder bei seinen Apps an.';

  @override
  String get importPasteSubtitle => 'Eingefügtes Setup';

  @override
  String get agentImportReviewHelp =>
      'Entferne Häkchen bei allem, was du nicht möchtest. Nichts wird erstellt, bevor du importierst.';

  @override
  String get agentImportNoPersona => 'Keine Persona-Datei gefunden.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Skills',
      one: '1 Skill',
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
      other: '$countString Routinen',
      one: '1 Routine',
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
      other: '$countString Erinnerungen',
      one: '1 Erinnerung',
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
      other: '$countString weitere Dateien',
      one: '1 weitere Datei',
    );
    return '$_temp0 nach ~/imported/ auf seinem Computer kopieren';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Nicht importiert: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$name importiert und $countString Dateien auf seinen Computer kopiert';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$name importiert. Seine anderen Dateien konnten noch nicht kopiert werden; gib ihm einen Computer und importiere erneut, um sie zu kopieren.';
  }

  @override
  String get importMemoryTitle =>
      'Erinnerungen aus ChatGPT oder Claude importieren';

  @override
  String get importMemoryHelp =>
      'Kopiere diesen Prompt in ChatGPT oder Claude und füge die Antwort unten ein.';

  @override
  String get importMemoryPick =>
      'Behalte, was stimmt; entferne bei dem Rest das Häkchen.';

  @override
  String get importMemoryPaste => 'Die Antwort';

  @override
  String get importMemoryNone =>
      'Keine Erinnerungen in dieser Antwort gefunden.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Erinnerungen hinzugefügt',
      one: '1 Erinnerung hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Routinen und Skills als Dateien';

  @override
  String get routinesAsFilesHelp =>
      'Jede Routine und jeder Skill als Markdown-Datei: exportiere sie, bearbeite sie überall, importiere sie zurück oder halte sie in einem GitHub-Repository.';

  @override
  String get exportFiles => 'Als Dateien exportieren';

  @override
  String get importFiles => 'Dateien importieren';

  @override
  String get importFilesApply => 'Anwenden';

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

    return '$createdString neu, $updatedString geändert, $unchangedString unverändert';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Importiert: $createdString neu, $updatedString geändert';
  }

  @override
  String get gitSync => 'Git-Sync';

  @override
  String get gitSyncOff => 'Aus';

  @override
  String get gitSyncHelp =>
      'Änderungen in Casama werden ins Repository committet, und Pushes dorthin aktualisieren Casama nach einer Prüfung. Wurde eine Datei an beiden Orten geändert, behält Casama seine Version und öffnet einen Pull Request. Erfordert ein GITHUB_TOKEN-Geheimnis mit Erlaubnis für api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Braucht ein GITHUB_TOKEN-Geheimnis';

  @override
  String gitSyncedWhen(String when) {
    return 'Synchronisiert: $when';
  }

  @override
  String get gitSyncPr => 'Pull Request wartet auf dich';

  @override
  String get syncNow => 'Jetzt synchronisieren';

  @override
  String get syncQueued => 'Synchronisiert innerhalb einer Minute';

  @override
  String get gitBranch => 'Branch';

  @override
  String get gitFolder => 'Ordner im Repository (optional)';

  @override
  String get gitSyncOn => 'Sync ein';

  @override
  String get gitSyncRemove => 'Sync beenden';

  @override
  String get gitWebhookTitle => 'Diesen Webhook zum Repository hinzufügen';

  @override
  String get gitWebhookHelp =>
      'Füge in den Einstellungen des Repositorys einen Webhook für Push-Ereignisse mit dieser Adresse und diesem Geheimnis (Content-Type application/json) hinzu. Das Geheimnis wird nur jetzt angezeigt.';

  @override
  String get gitWebhookUrl => 'Payload-URL';

  @override
  String get gitWebhookSecret => 'Geheimnis';

  @override
  String get knowledge => 'Wissen';

  @override
  String get knowledgeRow => 'Dokumente, die er durchsuchen und zitieren kann';

  @override
  String get noKnowledge => 'Noch kein Wissen';

  @override
  String get knowledgeHelp =>
      'Gib ihm Dateien, eine Website oder ein GitHub-Repository. Er durchsucht sie bei Bedarf und nennt dir das Dokument, aus dem eine Antwort stammt.';

  @override
  String get addKnowledge => 'Wissen hinzufügen';

  @override
  String get addKnowledgeHelp =>
      'PDF-, Word-, Markdown-, HTML-, CSV- oder Textdateien; eine Website (eine Domain, gemäß ihrer robots.txt); oder die Dokumente eines Repositorys. Websites und Repositories werden täglich aktualisiert.';

  @override
  String get knowledgeFiles => 'Dateien';

  @override
  String get knowledgeWebsite => 'Website';

  @override
  String get knowledgePickFiles => 'Dateien wählen';

  @override
  String get knowledgeWebsiteUrl => 'Website-Adresse';

  @override
  String get knowledgeRepoUrl => 'GitHub-Link';

  @override
  String get knowledgeShareAll => 'Mit jedem Bot im Workspace teilen';

  @override
  String get knowledgeShared => 'Ganzer Workspace';

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
      other: '$docsString Dokumente',
      one: '1 Dokument',
    );
    return '$_temp0, $chunksString Abschnitte';
  }

  @override
  String get knowledgeError => 'Konnte nicht gelesen werden';

  @override
  String get knowledgeSyncing => 'Liest…';

  @override
  String get knowledgePending => 'Wartet auf das Einlesen';

  @override
  String get add => 'Hinzufügen';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot schlägt einen Skill vor: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot schlägt eine Verbesserung für $name vor';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Nutzt: $tools';
  }

  @override
  String get saveSkill => 'Skill speichern';

  @override
  String get applyEdit => 'Änderung anwenden';

  @override
  String skillSaved(String name) {
    return '$name gespeichert';
  }

  @override
  String skillUpdated(String name) {
    return '$name aktualisiert';
  }

  @override
  String get skillStats => 'Wie es läuft';

  @override
  String get skillNotUsedYet => 'Noch nicht genutzt';

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

    return '$usesString Mal genutzt · $rateString % erfolgreich · $failuresString fehlgeschlagen · $correctionsString korrigiert';
  }

  @override
  String skillLastFailure(String date) {
    return 'Letztes Problem: $date';
  }

  @override
  String get skillHistory => 'Frühere Versionen';

  @override
  String get replays => 'Replays';

  @override
  String get replaysRow =>
      'Aufgezeichnete Schritte, die er ohne Nachdenken ausführt';

  @override
  String get noReplays => 'Noch keine Replays';

  @override
  String get replaysHelp =>
      'Ein Replay ist eine aufgezeichnete Folge von Browser- oder Desktop-Schritten, die der Bot direkt so ausführt – das ist schneller und günstiger. Funktioniert ein Schritt nicht mehr, übernimmt der Bot ab dort und kann das Replay aktualisieren. Speichere eines aus einer Vormach-Aufnahme oder bitte den Bot zu speichern, was er gerade getan hat.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Schritte',
      one: '1 Schritt',
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
      other: '$runsString Mal ausgeführt',
      one: '1 Mal ausgeführt',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString brauchten Hilfe',
      one: '1 brauchte Hilfe',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return '$name ausführen';
  }

  @override
  String get runReplayHelp => 'Prüfe die eingesetzten Werte und führe es aus.';

  @override
  String get run => 'Ausführen';

  @override
  String get saveAsReplay => 'Auch als Replay speichern';

  @override
  String replaySaved(String name) {
    return 'Replay $name gespeichert';
  }

  @override
  String get passwordManagers => 'Passwortmanager';

  @override
  String get passwordManagersRow => '1Password- oder Bitwarden-Logins für Bots';

  @override
  String get noPasswordManagers => 'Keine Passwortmanager verbunden';

  @override
  String get passwordManagersHelp =>
      'Bots können sich mit Logins aus den von dir gewählten Tresoren anmelden. Sie sehen nie ein Passwort: Es wird nur auf den eigenen Websites dieses Logins in den Browser eingefügt.';

  @override
  String get connectPasswordManager => 'Passwortmanager verbinden';

  @override
  String get pmWorkspace => 'Ganzer Workspace';

  @override
  String get pmJustMe => 'Nur ich';

  @override
  String get pmNoVaults => 'Noch keine Tresore gewählt';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tresore',
      one: '1 Tresor',
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
      other: '$countString Logins',
      one: '1 Login',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Nutzt einen 1Password-Connect-Server mit dem Token eines Dienstkontos.';

  @override
  String get pmBitwardenHelp =>
      'Nutzt Bitwardens Vault Management API (bw serve) für die Sammlungen deiner Organisation.';

  @override
  String get pmConnectUrl => 'Adresse des Connect-Servers';

  @override
  String get pmConnectToken => 'Connect-Token';

  @override
  String get pmBwUrl => 'bw-serve-Adresse';

  @override
  String get pmBwToken => 'Zugriffstoken (optional)';

  @override
  String get pmForWorkspace => 'Für den ganzen Workspace';

  @override
  String get pmChooseVaults => 'Tresore, die Bots nutzen dürfen';

  @override
  String get pmChooseVaultsHelp =>
      'Nur Logins in den Tresoren oder Sammlungen, die du anhakst, stehen Bots zur Verfügung.';

  @override
  String get welcomeGettingReady => 'Dein Bereich wird vorbereitet…';

  @override
  String get setUpManually => 'Manuell einrichten';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get inviteLinkCopied =>
      'Einladungslink kopiert. Sende ihn an die Menschen, mit denen du arbeitest.';

  @override
  String get inviteFriends => 'Freunde einladen';

  @override
  String inviteFriendsRow(String amount) {
    return 'Verdiene $amount kostenlose Nutzung für jeden Freund, der beitritt';
  }

  @override
  String get inviteFriendsRowPlain => 'Teile Casama mit deinen Freunden';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Casama verschenken, $amount erhalten';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Casama mit Freunden teilen';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Sende deinen Link an Freunde. Für jede Person, die sich registriert und ihren ersten Chat abschließt, erhältst du $amount kostenlose Nutzung.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Sende deinen Link an Freunde. Sie können sich sofort registrieren.';

  @override
  String get inviteFriendsYourCode =>
      'Dein Einladungscode. Tippen zum Kopieren.';

  @override
  String get inviteFriendsShare => 'Link teilen';

  @override
  String get inviteFriendsCopyLink => 'Link kopieren';

  @override
  String get inviteFriendsCopied => 'Kopiert. Sende ihn an einen Freund.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Komm zu mir auf Casama, wo KI-Teamkollegen Dinge für dich erledigen: $link (Einladungscode $code)';
  }

  @override
  String get inviteFriendsProgress => 'Deine Einladungen';

  @override
  String get inviteFriendsJoined => 'Beigetretene Freunde';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString haben noch keinen ersten Chat abgeschlossen',
      one: '1 hat noch keinen ersten Chat abgeschlossen',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Verdiente kostenlose Nutzung';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Noch $countString weitere Freunde können dir eine Belohnung einbringen',
      one: 'Noch 1 weiterer Freund kann dir eine Belohnung einbringen',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Du hast das Maximum durch Einladungen verdient. Vielen Dank!';

  @override
  String get inviteFriendsHow => 'So funktioniert’s';

  @override
  String get inviteFriendsStep1 =>
      'Teile deinen Link oder Code mit einem Freund';

  @override
  String get inviteFriendsStep2 =>
      'Dein Freund registriert sich und gibt innerhalb einer Woche deinen Code ein';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Schließt dein Freund den ersten Chat ab, erhältst du $amount kostenlose Nutzung';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Dein Freund legt mit eigenen KI-Teamkollegen los';

  @override
  String get inviteFriendsUnavailable =>
      'Einladungen sind auf diesem Server nicht verfügbar.';

  @override
  String get referralHaveCode => 'Code von einem Freund erhalten?';

  @override
  String get referralCodeHint => 'Einladungscode';

  @override
  String get referralUse => 'Einlösen';

  @override
  String get referralRedeemed =>
      'Einladungscode hinzugefügt. Willkommen bei Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'Du bist über die Einladung von $name beigetreten. Willkommen bei Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Du bist über die Einladung von $name beigetreten.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Du bist über die Einladung eines Freundes beigetreten.';

  @override
  String referralInvitedBy(String name) {
    return '$name hat dich eingeladen';
  }

  @override
  String get referralInvitedByFriend => 'Ein Freund hat dich eingeladen';

  @override
  String get referralWelcomeTitle => 'Willkommen bei Casama';

  @override
  String get referralWelcomeHelp =>
      'KI-Teamkollegen, die auf ihren eigenen Computern für dich arbeiten. Nimm die Einladung an, damit sie deinem Freund angerechnet wird.';

  @override
  String get referralAccept => 'Einladung annehmen';

  @override
  String get referralGetStarted => 'Loslegen';

  @override
  String get referralInvalid => 'Diese Einladung funktioniert nicht';

  @override
  String get referralInvalidHelp =>
      'Der Code ist vielleicht vertippt. Du kannst dich trotzdem registrieren und Casama nutzen.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return '$amount schenken, $amount erhalten';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Sende deinen Link an Freunde. Meldet sich jemand mit deinem Code an und schließt den ersten Chat ab, erhaltet ihr beide $amount kostenlose Nutzung.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Sende deinen Link an Freunde. Meldet sich jemand mit deinem Code an und schließt den ersten Chat ab, erhältst du $reward kostenlose Nutzung und die andere Person $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Schließt dein Freund den ersten Chat ab, erhaltet ihr beide $amount kostenlose Nutzung';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Schließt dein Freund den ersten Chat ab, erhältst du $reward und dein Freund $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Komm zu mir auf Casama, wo KI-Teamkollegen Dinge für dich erledigen. Registriere dich mit meinem Einladungscode $code und erhalte $amount kostenlose Nutzung: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Gib ihn innerhalb einer Woche nach der Registrierung ein und erhalte $amount kostenlose Nutzung nach deinem ersten Chat.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Dein Willkommensbonus von $amount ist in deinem Workspace.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Dein Willkommensbonus von $amount kommt nach deinem ersten Chat.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'KI-Teamkollegen, die auf ihren eigenen Computern für dich arbeiten. Nimm die Einladung an und erhalte $amount kostenlose Nutzung nach deinem ersten Chat.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Du bist dabei! Dein Willkommensbonus von $amount kommt nach deinem ersten Chat.';
  }

  @override
  String get connectManaged => 'Über Composio anmelden';

  @override
  String connectManagedHelp(String app) {
    return 'Casama verbindet $app über Composio, das die Anmeldung übernimmt. Du kannst jederzeit trennen.';
  }

  @override
  String get sharing => 'Teilen';

  @override
  String get sharingRow => 'Wer chatten, bearbeiten oder verwalten darf';

  @override
  String get sharingHelp =>
      'Jeder im Workspace kann mit einem Bot chatten, sofern du ihn nicht privat stellst. Hinzugefügte Personen können chatten, seine Einstellungen bearbeiten oder auch den Zugriff verwalten. Ein Bot, der für jemanden arbeitet, nutzt nur dessen eigenen persönlichen Computer und Verbindungen.';

  @override
  String get sharingPrivate => 'Privat';

  @override
  String get sharingPrivateOn =>
      'Nur du und die Personen unten können ihn sehen';

  @override
  String get sharingPrivateOff => 'Alle im Workspace können mit ihm chatten';

  @override
  String get sharingPeople => 'Personen';

  @override
  String get sharingOnlyCreator => 'Nur der Ersteller';

  @override
  String get sharingEveryoneChats =>
      'Alle können chatten; füge Personen hinzu, die ihn bearbeiten dürfen';

  @override
  String sharingEveryoneRole(String role) {
    return 'Alle mit der Rolle $role';
  }

  @override
  String get accessChat => 'Darf chatten';

  @override
  String get accessEdit => 'Darf bearbeiten';

  @override
  String get accessAdmin => 'Darf verwalten';

  @override
  String get sharingSaved => 'Einstellungen zum Teilen gespeichert';

  @override
  String get triggerCalendar => 'Termine';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Rund um passende Termine ($minutesString Min.)',
      one: 'Rund um passende Termine ($minutesString Min.)',
      zero: 'Zu Beginn passender Termine',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Verbinde zuerst Google Kalender oder Outlook.';

  @override
  String get calendarTriggerCalendar => 'Kalender';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString Min.',
      one: '$minutesString Min.',
      zero: 'Zu Beginn',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Nur Termine mit Personen außerhalb meines Unternehmens';

  @override
  String get calendarVideoLink => 'Nur Termine mit Videolink';

  @override
  String get calendarTitleMatch =>
      'Nur Titel, die Folgendes enthalten (optional)';

  @override
  String get fullAccess => 'Vollzugriff';

  @override
  String get fullAccessHelp =>
      'Bots handeln, ohne vorher zu fragen – auf ihren Computern und auf deinem Mac. Zahlungen, Passwortänderungen und deine eigenen „Fragen“-Regeln fragen weiterhin.';

  @override
  String get fullAccessConfirmTitle => 'Vollzugriff aktivieren?';

  @override
  String get fullAccessConfirmBody =>
      'Jeder Bot in diesem Workspace sendet Nachrichten, löscht Dateien, führt Befehle auf deinem Mac aus und fügt Verbindungen hinzu, ohne dich vorher zu fragen. Bei Zahlungen und Passwortänderungen wird weiterhin gefragt.';

  @override
  String get fullAccessTurnOn => 'Aktivieren';

  @override
  String get botToBot => 'Bots können miteinander sprechen';

  @override
  String get botToBotHelp =>
      'Bots können sich per @ erwähnen, schreiben und Aufgaben aneinander übergeben.';

  @override
  String get capMessages => 'Nachrichten (iMessage)';

  @override
  String get chatApps => 'Chat-Apps';

  @override
  String get chatAppsRow => 'Telegram, E-Mail, SMS, Slack, WhatsApp und mehr';

  @override
  String get botEmail => 'E-Mail-Adresse';

  @override
  String get botEmailRow => 'Diesem Bot eine eigene Adresse geben';

  @override
  String botEmailClaimTitle(String name) {
    return '$name eine E-Mail-Adresse geben';
  }

  @override
  String get botEmailClaimHelp =>
      'Man kann ihm schreiben und er antwortet per E-Mail. Leite ihm alles weiter: Rechnungen, Buchungen, Newsletter.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'Der Name kann später nicht geändert werden.';

  @override
  String get botEmailNameLabel => 'Name';

  @override
  String botEmailWillBe(String address) {
    return 'Adresse deines Bots: $address.';
  }

  @override
  String get botEmailClaim => 'Adresse erstellen';

  @override
  String get botEmailTaken =>
      'Dieser Name ist vergeben. Probier einen von diesen:';

  @override
  String get botEmailClaimed => 'Dein Bot hat eine Adresse';

  @override
  String get botEmailClaimedHelp =>
      'Eine Willkommens-E-Mail ist auf dem Weg zu dir. Antworte darauf oder leite etwas weiter.';

  @override
  String get botEmailCopy => 'Kopieren';

  @override
  String get botEmailCopied => 'Kopiert';

  @override
  String get botEmailContacts => 'Zu Kontakten hinzufügen';

  @override
  String botEmailWrite(String name) {
    return 'An $name schreiben';
  }

  @override
  String get botEmailPaused =>
      'Pausiert. Empfängt und speichert weiterhin E-Mails, antwortet aber nicht.';

  @override
  String get botEmailPause => 'Pausieren';

  @override
  String get botEmailResume => 'Fortsetzen';

  @override
  String get botEmailSenders => 'Erlaubte Absender';

  @override
  String get botEmailSendersHelp =>
      'Nur diese Personen erhalten Antworten. E-Mails von Unbekannten werden aufbewahrt und starten nichts.';

  @override
  String get botEmailEditSenders => 'In Chat-Apps bearbeiten';

  @override
  String get botEmailMove => 'Zu anderem Bot verschieben';

  @override
  String get botEmailMoveHelp =>
      'Die Adresse und ihre E-Mails wandern zum anderen Bot.';

  @override
  String get botEmailRelease => 'Adresse freigeben';

  @override
  String get botEmailReleaseHelp =>
      'Beendet den Empfang endgültig. Der Name wird nie wieder vergeben.';

  @override
  String botEmailReleaseConfirm(String address) {
    return '$address freigeben? Sie empfängt sofort nichts mehr und der Name wird nie wieder vergeben.';
  }

  @override
  String get botEmailReleaseNow => 'Freigeben';

  @override
  String get botEmailMoved => 'Verschoben';

  @override
  String botEmailNewBotRow(String name) {
    return '$name eine E-Mail-Adresse geben';
  }

  @override
  String get botEmailInbox => 'Posteingang';

  @override
  String get botEmailInboxRow => 'Aufbewahrte E-Mails, Unbekannte und Dateien';

  @override
  String get botEmailEmpty => 'Noch keine E-Mails';

  @override
  String get botEmailStrangers => 'Unbekannte';

  @override
  String get botEmailAll => 'Alle E-Mails';

  @override
  String get botEmailUnconfirmed =>
      'Dieser Absender konnte nicht bestätigt werden';

  @override
  String get botEmailAllow => 'Erlauben';

  @override
  String get botEmailBlock => 'Blockieren';

  @override
  String get botEmailBlocked =>
      'Blockiert. Neue E-Mails von hier werden abgelehnt.';

  @override
  String get botEmailUnblock => 'Blockierung aufheben';

  @override
  String get botEmailOpenChat => 'Chat öffnen';

  @override
  String get botEmailFiles => 'Dateien';

  @override
  String get botEmailNewSenders => 'Über neue Absender informieren';

  @override
  String get botEmailNewSendersHelp =>
      'Höchstens einmal am Tag. Aus, sofern du es nicht einschaltest.';

  @override
  String get botEmailTryTitle => 'Dinge zum Ausprobieren';

  @override
  String get botEmailTryForward => 'Rechnung oder Buchung weiterleiten';

  @override
  String get botEmailTryForwardHelp =>
      'Leite irgendetwas an die Adresse oben weiter. Er liest es und antwortet hier.';

  @override
  String get botEmailTryReceipts => 'Meine Belege aufbewahren';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Erstellt eine Routine, die E-Mails an $address ablegt.';
  }

  @override
  String get botEmailTryDigest => 'Ein Digest pro Woche';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Erstellt eine Routine, die Newsletter von $address in einer wöchentlichen Zusammenfassung bündelt.';
  }

  @override
  String get botEmailTryCopied => 'Adresse kopiert';

  @override
  String get botEmailTryMade => 'Routine erstellt';

  @override
  String get botEmailReceiptsName => 'Meine Belege aufbewahren';

  @override
  String get botEmailReceiptsInstructions =>
      'Lege den Beleg aus dieser E-Mail ab: wofür er war, wie viel und wann. Sag nichts, es sei denn, etwas wirkt seltsam.';

  @override
  String get botEmailDigestName => 'Wöchentlicher Newsletter-Digest';

  @override
  String get botEmailDigestInstructions =>
      'Sammle die Newsletter dieser Woche und sende einen kurzen Digest: die wichtigen Schlagzeilen, mehr nicht.';

  @override
  String get botEmailTriggerTag => 'Adress-Tag';

  @override
  String get botEmailTriggerTagHelp =>
      'Nur E-Mails an diesen Tag, wie shop für ada+shop@. Nur E-Mail-Adressen.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Auch unbestätigte Absender beachten';

  @override
  String get botEmailTriggerAutomatic => 'Auch automatische E-Mails beachten';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used von $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used genutzt';
  }

  @override
  String get botEmailStorageFull =>
      'Das Postfach ist voll, daher werden neue E-Mails abgelehnt. Lösche alte E-Mails, um Platz zu schaffen.';

  @override
  String get botEmailSelect => 'Auswählen';

  @override
  String get botEmailSelectDone => 'Fertig';

  @override
  String get botEmailDelete => 'Löschen';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n E-Mails löschen',
      one: '1 E-Mail löschen',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n E-Mails löschen?',
      one: 'Diese E-Mail löschen?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Ihr Text und ihre Dateien sind endgültig weg. Kopien, die schon in einem Chat sind, bleiben dort.';

  @override
  String get botEmailDeleteOlder => 'Ältere E-Mails löschen';

  @override
  String get botEmailOlder30Days => 'Älter als 30 Tage';

  @override
  String get botEmailOlder6Months => 'Älter als 6 Monate';

  @override
  String get botEmailOlderYear => 'Älter als ein Jahr';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Alle E-Mails löschen, die älter als 30 Tage sind?',
      'months6': 'Alle E-Mails löschen, die älter als 6 Monate sind?',
      'other': 'Alle E-Mails löschen, die älter als ein Jahr sind?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n E-Mails gelöscht',
      one: '1 E-Mail gelöscht',
      zero: 'Nichts zu löschen',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Bot-E-Mail-Adressen',
      one: '1 Bot-E-Mail-Adresse',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew =>
      'Bots schreiben neuen Personen per E-Mail';

  @override
  String get botEmailPerkRepliesOnly => 'Bots antworten dir per E-Mail';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Chat-App verbinden';

  @override
  String get chatAppsEmpty => 'Noch keine Chat-Apps';

  @override
  String get chatAppsHelp =>
      'Lass Personen diesem Bot über Telegram, E-Mail, SMS, Slack, WhatsApp, Messenger, Feishu oder iMessage schreiben. Er antwortet nur Personen auf der erlaubten Liste; alle anderen werden hier protokolliert.';

  @override
  String get chatAppsAddHelp =>
      'Füge die Zugangsdaten aus den Entwicklereinstellungen der App ein. Sie werden verschlüsselt gespeichert und nie wieder angezeigt.';

  @override
  String get chatAppsKind => 'App';

  @override
  String get chatAppsSenders => 'Erlaubte Absender';

  @override
  String get chatAppsSendersHelp =>
      'Einer pro Zeile: E-Mail-Adressen (oder *@company.com), Telefonnummern oder Benutzer-IDs. Du kennst eine ID nicht? Lass das Feld leer, schreibe dem Bot und kopiere die ID aus der Aktivität.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Aktiviere zuerst „Diesen Computer für Bots nutzen“ mit erlaubten Nachrichten in der Desktop-App auf deinem Mac.';

  @override
  String chatAppsConnected(String name) {
    return '$name ist verbunden';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram sendet bereits Nachrichten hierher. Schreibe deinem Bot, um es zu testen.';

  @override
  String get chatAppsPasteUrl =>
      'Füge diese Adresse in den Webhook-Einstellungen der App ein.';

  @override
  String get chatAppsWebhookUrl => 'Webhook-Adresse';

  @override
  String get chatAppsVerifyToken => 'Bestätigungstoken';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString erlaubte Absender',
      one: '1 erlaubter Absender',
      zero: 'Niemand erlaubt',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Aktivität';

  @override
  String get chatAppsNoActivity => 'Noch keine Nachrichten.';

  @override
  String get chatAppsIgnored => 'Ignoriert: nicht auf der erlaubten Liste';

  @override
  String get chatAppsAllow => 'Erlauben';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender darf diesem Bot jetzt schreiben';
  }

  @override
  String get chatAppsRoutine => 'Routine gestartet';

  @override
  String get chatAppsFailed => 'Konnte nicht senden';

  @override
  String get chatAppsSent => 'Gesendet';

  @override
  String get chatAppsAnswered => 'Beantwortet';

  @override
  String get chatAppsRemove => 'Trennen';

  @override
  String get chBotToken => 'Bot-Token';

  @override
  String get chAddress => 'E-Mail-Adresse';

  @override
  String get chApiKey => 'API-Schlüssel';

  @override
  String get chSigningSecret => 'Signaturgeheimnis';

  @override
  String get chPhoneNumber => 'Telefonnummer';

  @override
  String get chAccountSid => 'Konto-SID';

  @override
  String get chAuthToken => 'Auth-Token';

  @override
  String get chPhoneNumberId => 'Telefonnummern-ID';

  @override
  String get chAccessToken => 'Zugriffstoken';

  @override
  String get chAppSecret => 'App-Secret';

  @override
  String get chPageToken => 'Seiten-Zugriffstoken';

  @override
  String get chAppId => 'App-ID';

  @override
  String get chEncryptKey => 'Verschlüsselungsschlüssel';

  @override
  String get chVerificationToken => 'Bestätigungstoken';

  @override
  String get chPublicKey => 'Öffentlicher Schlüssel';

  @override
  String get chTrackerUser => 'Die Benutzer-ID des Bots im Tracker';

  @override
  String get chSiteUrl => 'Website-Adresse (https://…)';

  @override
  String get chAccountEmail => 'Konto-E-Mail';

  @override
  String get routineMessage => 'Wenn eine passende Nachricht eintrifft';

  @override
  String get triggerMessage => 'Nachrichten';

  @override
  String get messageTriggerHelp =>
      'Startet, wenn eine E-Mail oder Chat-Nachricht an diesen Bot passt. Verbinde die App zuerst unter Chat-Apps.';

  @override
  String get messageTriggerAnyApp => 'Beliebige App';

  @override
  String get messageTriggerSender => 'Von (Adresse, Nummer oder *@company.com)';

  @override
  String get messageTriggerSubject => 'Betreff enthält';

  @override
  String get messageTriggerWords => 'Nachricht enthält';

  @override
  String callIncoming(String name) {
    return '$name ruft an';
  }

  @override
  String get callAnswer => 'Annehmen';

  @override
  String get callDecline => 'Ablehnen';

  @override
  String get callFullScreenTitle => 'Anrufe auf dem Sperrbildschirm';

  @override
  String get callFullScreenOff =>
      'Aus: Der Anruf eines Bots erscheint nur als Benachrichtigung. Tippe, damit Anrufe im Vollbild klingeln.';

  @override
  String get encryption => 'Inhalte verschlüsseln';

  @override
  String get encryptionHelp =>
      'Nachrichten, Erinnerungen, Tickets, Seiten und Wissen werden vor dem Speichern mit dem eigenen Schlüssel dieses Workspace verschlüsselt. Die Suche findet dann Titel und Bedeutung, keine exakten Wörter im verschlüsselten Text.';

  @override
  String get encryptionOff => 'Aus';

  @override
  String get encryptionUnavailable =>
      'Nicht verfügbar: Auf diesem Server ist kein Verschlüsselungsschlüssel eingerichtet';

  @override
  String get encryptionEncrypting =>
      'Wird aktiviert: Bereits Gespeichertes wird verschlüsselt';

  @override
  String get encryptionOnServer => 'Ein, mit dem Schlüssel des Servers';

  @override
  String get encryptionOnKms => 'Ein, mit AWS KMS';

  @override
  String get encryptionDecrypting =>
      'Wird deaktiviert: Gespeichertes wird entschlüsselt';

  @override
  String get encryptionConfirm =>
      'Inhalte werden mit dem Schlüssel dieses Workspace verschlüsselt. Wird der Workspace gelöscht, wird sein Schlüssel vernichtet und der Inhalt ist nicht wiederherstellbar. Die exakte Wortsuche funktioniert bei verschlüsseltem Text nicht mehr.';

  @override
  String get encryptionTurnOn => 'Aktivieren';

  @override
  String get encryptionRotate => 'Schlüssel rotieren';

  @override
  String get encryptionKeyManaged =>
      'Casama erstellt und verwahrt den Schlüssel dieses Workspace für dich, geschützt durch den eigenen Schlüssel des Servers. Du musst nichts speichern oder kopieren.';

  @override
  String get encryptionRotateTitle => 'Schlüssel rotieren?';

  @override
  String get encryptionRotateBody =>
      'Der Workspace-Schlüssel wird mit dem aktuellen Schlüssel des Servers neu verpackt. Deine Inhalte bleiben lesbar und nichts muss neu verschlüsselt werden. Mache das nach einer Änderung des Serverschlüssels oder nach Zeitplan.';

  @override
  String get encryptionRotateHelp =>
      'Verpackt den Workspace-Schlüssel mit dem aktuellen Schlüssel des Servers neu';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Zuletzt rotiert: $when';
  }

  @override
  String get memoryBackend => 'Wo das Gedächtnis liegt';

  @override
  String get memoryBuiltIn => 'Integriert';

  @override
  String get memoryBackendHelp => 'Langzeitgedächtnis der Bots';

  @override
  String get memoryBackendSheetHelp =>
      'Bewahre das Gedächtnis deiner Bots mit deinem eigenen Konto in Honcho oder Supermemory auf. Die Gedächtnis-Ansicht, Exporte und das Löschen funktionieren genauso.';

  @override
  String get memoryHonchoWorkspace => 'Honcho-Workspace';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Leer lassen, um einen für diesen Casama-Workspace erstellten zu nutzen';

  @override
  String get memoryBaseUrl => 'Serveradresse (optional)';

  @override
  String get memoryBaseUrlHelp =>
      'Nur für ein selbst gehostetes Honcho oder Supermemory';

  @override
  String get memoryCopyExisting => 'Aktuelle Erinnerungen kopieren';

  @override
  String get memoryUseBuiltIn => 'Wieder integriertes Gedächtnis nutzen';

  @override
  String get providerHintData => 'bezahlte Daten (Orte, E-Mails, SEO)';

  @override
  String get kindA2a => 'KI-Agent (A2A)';

  @override
  String get a2aAgentUrl => 'Agent-Adresse oder Agent-Card-URL';

  @override
  String get a2aAgentToken => 'Zugriffstoken (optional)';

  @override
  String get a2a => 'Agent-zu-Agent (A2A)';

  @override
  String get a2aHelp =>
      'Externe Agents können von dir veröffentlichten Bots Aufgaben geben.';

  @override
  String get chromeExtensionSwitch => 'Casama für Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Mitglieder können die Browser-Erweiterung mit diesem Workspace nutzen.';

  @override
  String get chromeActSwitch => 'Bots in den Browsern der Mitglieder';

  @override
  String get chromeActSwitchHelp =>
      'Mitglieder können Bots erlauben, Seiten zu öffnen und in ihrem eigenen Chrome zu handeln – in einer Tab-Gruppe, die sie stoppen können.';

  @override
  String get a2aPublish => 'Als A2A-Agent veröffentlichen';

  @override
  String get a2aPublishHelp =>
      'Externe Agents mit einem Workspace-API-Schlüssel können diesem Bot Aufgaben geben.';

  @override
  String get a2aWorkspaceOff =>
      'Aktiviere zuerst Agent-zu-Agent in den Workspace-Einstellungen.';

  @override
  String get a2aCardUrl => 'Agent-Card';

  @override
  String get phoneCalls => 'Telefonanrufe';

  @override
  String get phoneCallsHelp =>
      'Lass Bots über dein Twilio-Konto Unternehmen für dich anrufen. Jeder Anruf fragt vorher gemäß den üblichen Freigaben.';

  @override
  String get twilioSid => 'Konto-SID';

  @override
  String get twilioToken => 'Auth-Token';

  @override
  String get twilioFrom => 'Anrufe kommen von';

  @override
  String get phoneCallsPersonal => 'Anrufe an private Nummern erlauben';

  @override
  String get phoneCallsCap => 'Anrufe pro Tag';

  @override
  String get phoneCallsOff => 'Nicht verbunden';

  @override
  String get outCall => 'Anruf';

  @override
  String get outCallRinging => 'Klingelt…';

  @override
  String get outCallLive => 'Im Anruf';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Beendet nach $secondsString s';
  }

  @override
  String get outCallEndedByYou => 'Du hast den Anruf beendet';

  @override
  String get outCallTakenOver => 'Du hast den Anruf übernommen';

  @override
  String get outCallFailed => 'Kam nicht durch';

  @override
  String get outCallNothingYet => 'Noch nichts gesagt.';

  @override
  String get outCallTakeOver => 'Übernehmen';

  @override
  String get outCallEnd => 'Anruf beenden';

  @override
  String get outCallYourPhone => 'Deine Telefonnummer';

  @override
  String get outCallYourPhoneHelp =>
      'Internationales Format, wie +14155550123. Leer lassen, um die gespeicherte zu nutzen.';

  @override
  String get payments => 'Zahlungen';

  @override
  String get paymentsHelp =>
      'Lass Bots Händler mit virtuellen Einmalkarten bezahlen, die du jedes Mal freigibst. Bringe dein eigenes Stripe-Issuing-Konto mit.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent von $cap diesen Monat ausgegeben';
  }

  @override
  String get paymentsSheetHelp =>
      'Jede Karte wird von dir mit dem gezeigten Betrag freigegeben, gilt einmalig bei diesem Händler für eine Stunde und nie für Wertpapiere, Krypto, Geschenkkarten oder Überweisungen.';

  @override
  String get paymentsStripeKey => 'Geheimer Stripe-Schlüssel (mit Issuing)';

  @override
  String get paymentsWebhookSecret => 'Webhook-Signaturgeheimnis';

  @override
  String get paymentsWebhook => 'Richte einen Stripe-Webhook auf diese Adresse';

  @override
  String get paymentsCardholder => 'Name auf Karten';

  @override
  String get paymentsAddress => 'Rechnungsadresse';

  @override
  String get paymentsCity => 'Stadt';

  @override
  String get paymentsState => 'Bundesland oder Region';

  @override
  String get paymentsZip => 'Postleitzahl';

  @override
  String get paymentsCountry => 'Land (2 Buchstaben)';

  @override
  String get paymentsCap => 'Workspace-Limit pro Monat (USD)';

  @override
  String get paymentsBotCap => 'Limit pro Bot und Monat (USD)';

  @override
  String get links => 'Verknüpfte Bots';

  @override
  String get linksRow =>
      'Mit dem Bot eines vertrauenswürdigen Kontakts verknüpfen';

  @override
  String get linksHelp =>
      'Dein Bot kann den Bot eines verknüpften Kontakts nach Dingen wie einem freien Termin fürs Abendessen fragen. Jeder Bot antwortet nach den Regeln seiner eigenen Person und teilt nur das Nötige; ihr beide seht jeden Austausch.';

  @override
  String get linksEmpty => 'Noch keine verknüpften Bots';

  @override
  String get linksInvite => 'Kontakt einladen';

  @override
  String get linksContactName => 'Name des Kontakts';

  @override
  String get linksInviteReady => 'Diese Einladung senden';

  @override
  String get linksInviteHelp =>
      'Sende sie an deinen Kontakt. Dieser nimmt sie in Casama mit einem eigenen Bot an. Sie gilt einmalig für 7 Tage.';

  @override
  String get linksAccept => 'Einladung annehmen';

  @override
  String get linksAcceptHelp =>
      'Füge die Einladung ein, die dir dein Kontakt geschickt hat.';

  @override
  String get linksInviteText => 'Einladung';

  @override
  String linksActive(String bot) {
    return 'Verknüpft mit $bot';
  }

  @override
  String get linksPending => 'Wartet auf Annahme durch deinen Kontakt';

  @override
  String get linksRevoked => 'Verknüpfung aufgehoben';

  @override
  String get linksExchanges => 'Austausch';

  @override
  String get linksNoExchanges => 'Noch nichts gefragt.';

  @override
  String get linksNoAnswer => 'Keine Antwort';

  @override
  String get linksWorking => 'Arbeitet…';

  @override
  String get linksRevoke => 'Verknüpfung aufheben';

  @override
  String get wakeWord => 'Aktivierungswort';

  @override
  String get wakeWordRow =>
      'Sag einen Satz, um einen Anruf mit einem Bot zu starten';

  @override
  String wakeWordOnRow(String phrase) {
    return 'Hört auf „$phrase“';
  }

  @override
  String get wakeWordHelp =>
      'Solange Casama geöffnet ist, achtet dieses Gerät auf deinen Satz und startet einen Live-Anruf mit dem von dir gewählten Bot.';

  @override
  String get wakeWordListen => 'Auf Aktivierungswort hören';

  @override
  String get wakeWordPhrase => 'Ausdruck';

  @override
  String get wakeWordPhraseHelp => 'Zwei oder drei Wörter, wie „hey casama“';

  @override
  String get wakeWordBot => 'Diesen Bot anrufen';

  @override
  String get wakeWordDownloading =>
      'Geräteinternes Modell wird heruntergeladen…';

  @override
  String get wakeWordTest => 'Ausdruck testen';

  @override
  String get wakeWordTesting => 'Hört zu… sag deinen Ausdruck';

  @override
  String get wakeWordHeard => 'Erkannt!';

  @override
  String get wakeWordStopTest => 'Stoppen';

  @override
  String get wakeWordPrivacy =>
      'Das Zuhören findet auf diesem Gerät mit einem Open-Source-Modell statt (etwa 18 MB, einmalig heruntergeladen). Bis zum Start des Anrufs wird nichts irgendwohin gesendet.';

  @override
  String get secretStore => 'Wo Geheimnisse aufbewahrt werden';

  @override
  String get secretStoreVault => 'Tresor dieses Servers';

  @override
  String get secretStoreHelp =>
      'Bewahre benannte Geheimnisse von Bots in deinem eigenen Infisical-Projekt auf. Casama speichert nur den Namen jedes Geheimnisses und wo es genutzt werden darf.';

  @override
  String get secretStoreSite => 'Infisical-Adresse';

  @override
  String get secretStoreProject => 'Projekt-ID';

  @override
  String get secretStoreEnv => 'Umgebung';

  @override
  String get secretStoreClientId => 'Client-ID der Maschinenidentität';

  @override
  String get secretStoreClientSecret => 'Client-Secret';

  @override
  String get secretStoreMove => 'Aktuelle Geheimnisse in Infisical verschieben';

  @override
  String get secretStoreBack => 'Wieder den Tresor dieses Servers nutzen';

  @override
  String get localServer => 'Casama auf diesem Computer ausführen';

  @override
  String get setupTitleMac => 'Casama auf diesem Mac einrichten';

  @override
  String get setupTitle => 'Casama auf diesem Computer einrichten';

  @override
  String get setupEntryMac => 'Auf diesem Mac ausführen';

  @override
  String get setupEntry => 'Auf diesem Computer ausführen';

  @override
  String get setupEntryHelp =>
      'Dein eigener privater Server auf diesem Computer. Für die persönliche Nutzung kostenlos.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Server';

  @override
  String get setupStepAccount => 'Konto';

  @override
  String get setupStepModel => 'KI-Modell';

  @override
  String get setupStepPhone => 'Telefon';

  @override
  String get setupDockerChecking => 'Docker wird geprüft…';

  @override
  String get setupDockerMissingTitle => 'Installiere zuerst Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'Der Server von Casama läuft in Docker Desktop, einer kostenlosen App, die ihn vom Rest deines Mac trennt.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Der Server von Casama läuft in Docker, das ihn vom Rest deines Computers trennt.';

  @override
  String get setupDockerGetMac => 'Docker Desktop herunterladen';

  @override
  String get setupDockerGetLinux => 'Installationsanleitung für Docker öffnen';

  @override
  String get setupDockerStep1 =>
      'Öffne die heruntergeladene Datei und ziehe Docker in „Programme“.';

  @override
  String get setupDockerStep2 => 'Öffne Docker und akzeptiere die Bedingungen.';

  @override
  String get setupDockerStep3 =>
      'Komm hierher zurück. Diese Seite macht von selbst weiter.';

  @override
  String get setupDockerWaiting => 'Warten auf Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker muss ausgeführt werden';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker ist installiert, aber nicht geöffnet. Sobald es gestartet ist – was eine Minute dauern kann –, macht diese Seite von selbst weiter.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker ist installiert, aber nicht aktiv. Starte es mit diesem Befehl, und diese Seite macht von selbst weiter.';

  @override
  String get setupDockerOpen => 'Docker öffnen';

  @override
  String get setupDockerOpening => 'Docker wird gestartet…';

  @override
  String get setupDockerPermissionTitle => 'Docker braucht deine Berechtigung';

  @override
  String get setupDockerPermissionBody =>
      'Docker wird ausgeführt, aber dein Benutzerkonto darf es nicht nutzen. Führe diesen Befehl aus, melde dich dann ab und wieder an.';

  @override
  String get setupDockerComposeTitle => 'Bei Docker fehlt Compose';

  @override
  String get setupDockerComposeBody =>
      'Dieses Docker hat kein Compose v2. Docker Desktop bringt es mit; installiere unter Linux das Paket docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Übersprungen';

  @override
  String get setupArtDocker => 'Zuerst die Box, in der dein Server lebt.';

  @override
  String get setupArtServer =>
      'Dein Zuhause wird aufgebaut. Das ist der längere Teil.';

  @override
  String get setupArtAccount => 'Dein Server ist aktiv!';

  @override
  String get setupArtModel => 'Gib ihm jetzt ein Gehirn.';

  @override
  String get setupArtPhone => 'Letzter Schritt: Nimm ihn mit.';

  @override
  String get setupDockerSlowTitle => 'Dauert es etwas?';

  @override
  String get setupDockerSlowMenuBar =>
      'Halte in der Menüleiste Ausschau nach dem Wal. Docker ist bereit, sobald er sich nicht mehr bewegt.';

  @override
  String get setupDockerSlowTerms =>
      'Falls Docker ein Fenster zeigt, in dem du Bedingungen akzeptieren sollst, erledige das zuerst. Die Anmeldung bei Docker ist optional.';

  @override
  String get setupDockerSlowRestart =>
      'Hängt es noch? Beende Docker über sein Menü und drücke dann auf „Erneut prüfen“.';

  @override
  String get setupDockerSlowInstalled =>
      'Schon installiert? Öffne Docker einmal aus „Programme“, damit es sich einrichten kann.';

  @override
  String get setupDockerSlowOther =>
      'Nutzt du stattdessen OrbStack oder Colima? Starte es. Casama funktioniert mit jedem Docker, das auf docker info antwortet.';

  @override
  String get setupDockerSlowTerminal =>
      'Führe docker info in einem Terminal aus, um zu sehen, was Docker meldet.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker meldete: $detail';
  }

  @override
  String get setupDockerRecheck => 'Erneut prüfen';

  @override
  String get setupDockerGuide => 'Fehlerbehebung';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Nur $gb GB Speicherplatz sind frei. Der Server braucht etwa $need GB.';
  }

  @override
  String get setupServerTitle => 'Deinen Server herunterladen und starten';

  @override
  String get setupServerBody =>
      'Ein Download von etwa 2,5 GB, der beim ersten Mal 5 bis 10 Minuten dauert, und nach der Einrichtung etwa 10 GB Speicherplatz belegt. Du kannst deinen Computer einfach weiternutzen.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Ein Download von $download GB, dann nach der Einrichtung etwa $disk GB Speicherplatz. Beim ersten Mal dauert es 5 bis 10 Minuten. Du kannst deinen Computer einfach weiternutzen.';
  }

  @override
  String get setupServerBodyNothing =>
      'Alles, was benötigt wird, ist schon auf diesem Computer – der Start dauert nur ein bis zwei Minuten.';

  @override
  String get setupServerStart => 'Starten';

  @override
  String get setupServerStageDownload => 'Server wird heruntergeladen';

  @override
  String get setupServerStagePrepare => 'Wird vorbereitet';

  @override
  String get setupServerStageParts => 'Bestandteile werden geladen';

  @override
  String setupServerDownloaded(int megabytes) {
    return 'Bisher $megabytes MB';
  }

  @override
  String get setupServerStagePartsNote => 'Der längste Schritt';

  @override
  String setupServerPartsCount(int done, int total) {
    return 'Bisher $done von $total heruntergeladen';
  }

  @override
  String get setupServerStageStart => 'Wird gestartet';

  @override
  String get setupServerStageWait => 'Warten auf Antwort';

  @override
  String get setupServerKeepOpen =>
      'Lass Casama geöffnet, bis dies abgeschlossen ist.';

  @override
  String get setupServerFailed => 'Der Server ist nicht gestartet.';

  @override
  String get setupServerConnecting => 'Bereit. Verbinde…';

  @override
  String get setupShowDetails => 'Details anzeigen';

  @override
  String get setupHideDetails => 'Details ausblenden';

  @override
  String get setupAccountTitle => 'Konto erstellen';

  @override
  String get setupAccountBody =>
      'Das Konto gibt es nur auf diesem Computer, und es ist Inhaber dieses Servers. Es wird keine E-Mail gesendet.';

  @override
  String get setupAccountName => 'Dein Name';

  @override
  String get setupAccountNameMissing => 'Gib deinen Namen ein';

  @override
  String get setupAccountCreate => 'Konto erstellen';

  @override
  String get setupAccountHave => 'Ich habe hier bereits ein Konto';

  @override
  String get setupAccountNew => 'Stattdessen ein neues Konto erstellen';

  @override
  String get setupAccountSignInTitle => 'Bei deinem Server anmelden';

  @override
  String get setupAccountSignInBody =>
      'Nutze das Konto, das du auf diesem Server erstellt hast.';

  @override
  String get setupAccountClosed =>
      'Dieser Server hat bereits seinen Inhaber. Melde dich mit diesem Konto an.';

  @override
  String get setupAccountPreparing => 'Dein Bereich wird vorbereitet…';

  @override
  String get setupModelTitle => 'Gib deinen Bots ein Modell';

  @override
  String get setupModelBody =>
      'Bots brauchen ein KI-Modell zum Denken. Melde dich mit einem ChatGPT-Abo an oder füge einen Schlüssel von OpenRouter, Google oder einem anderen Anbieter ein.';

  @override
  String get setupSkip => 'Vorerst überspringen';

  @override
  String get setupPhoneTitle => 'Dein Telefon verbinden';

  @override
  String get setupPhoneBody =>
      'Casama Link gibt diesem Computer eine private Adresse, sodass dein Telefon ihn von überall erreicht. Du gibst sie einmalig mit einem kostenlosen Casama Cloud-Konto frei. Deine Chats bleiben auf diesem Computer.';

  @override
  String get setupPhoneTurnOn => 'Diesem Computer eine Adresse geben';

  @override
  String get setupPhoneScanTitle =>
      'Scanne dies mit der Kamera deines Telefons';

  @override
  String get setupPhoneScanBody =>
      'Es öffnet Casama auf dem Telefon und meldet dich an. Falls Casama dort noch nicht installiert ist, zeigt die geöffnete Seite, wo du es bekommst.';

  @override
  String get setupPhoneWaiting => 'Wartet auf dein Telefon…';

  @override
  String get setupPhoneConnected => 'Telefon verbunden';

  @override
  String get setupPhoneConnectedBody =>
      'Dein Telefon ist angemeldet. Zeige einen neuen Code, um ein weiteres Gerät hinzuzufügen.';

  @override
  String get setupPhoneOwnerOnly =>
      'Nur der Inhaber dieses Servers kann ihm eine Adresse geben.';

  @override
  String get setupFinish => 'Fertigstellen';

  @override
  String get setupCardTitle => 'Einrichtung abschließen';

  @override
  String get setupCardModel =>
      'Füge ein KI-Modell hinzu, damit deine Bots antworten können.';

  @override
  String get setupCardPhone => 'Verbinde dein Telefon mit diesem Computer.';

  @override
  String get setupCardOpen => 'Einrichtung fortsetzen';

  @override
  String get desktopUsers => 'Gleichzeitige Desktop-Nutzer';

  @override
  String get desktopUsersHelp =>
      'Bots auf diesem Team-Computer teilen sich einen Bildschirm. Andere warten (und arbeiten mit Shell, Dateien und Browser weiter), während er belegt ist.';

  @override
  String desktopUsersCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bots',
      one: '1 Bot',
    );
    return '$_temp0';
  }

  @override
  String deviceAccessAsk(String kind, String bot) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '$bot möchte deinen Kalender nutzen',
      'reminders': '$bot möchte deine Erinnerungen nutzen',
      'contacts': '$bot möchte deine Kontakte nutzen',
      'places': '$bot möchte deine Orte nutzen',
      'photos': '$bot möchte deine Fotos nutzen',
      'health': '$bot möchte deine Gesundheitsdaten nutzen',
      'notifications': '$bot möchte deine Benachrichtigungen nutzen',
      'activity': '$bot möchte deine Computeraktivität nutzen',
      'browserTab': '$bot möchte deinen aktuellen Browser-Tab nutzen',
      'browserHistory':
          '$bot möchte deinen Browserverlauf und deine Lesezeichen nutzen',
      'alarm': '$bot möchte deine Wecker nutzen',
      'home': '$bot möchte dein Home-Zubehör nutzen',
      'other': '$bot möchte deine Gerätedaten nutzen',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Nur in deinen eigenen Chats. Du kannst das jederzeit unter Einstellungen → Geräteverbindungen stoppen.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Darf deinen Kalender nutzen',
      'reminders': 'Darf deine Erinnerungen nutzen',
      'contacts': 'Darf deine Kontakte nutzen',
      'places': 'Darf deine Orte nutzen',
      'photos': 'Darf deine Fotos nutzen',
      'health': 'Darf deine Gesundheitsdaten nutzen',
      'notifications': 'Darf deine Benachrichtigungen nutzen',
      'activity': 'Darf deine Computeraktivität nutzen',
      'browserTab': 'Darf deinen aktuellen Browser-Tab nutzen',
      'browserHistory':
          'Darf deinen Browserverlauf und deine Lesezeichen nutzen',
      'alarm': 'Darf deine Wecker nutzen',
      'home': 'Darf dein Home-Zubehör nutzen',
      'other': 'Darf deine Gerätedaten nutzen',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Nicht geteilt';

  @override
  String get deviceKindCalendar => 'Kalender';

  @override
  String get deviceKindReminders => 'Erinnerungen';

  @override
  String get deviceKindContacts => 'Kontakte';

  @override
  String get deviceKindPlaces => 'Orte';

  @override
  String get deviceKindPhotos => 'Fotos';

  @override
  String get deviceKindHealth => 'Gesundheitsdaten';

  @override
  String get deviceKindNotifications => 'Benachrichtigungen';

  @override
  String get deviceKindActivity => 'Computeraktivität';

  @override
  String get deviceKindBrowserTab => 'aktueller Browser-Tab';

  @override
  String get deviceKindBrowserHistory => 'Browserverlauf und Lesezeichen';

  @override
  String get deviceKindAlarm => 'Wecker';

  @override
  String get deviceKindHome => 'Home-Zubehör';

  @override
  String get deviceBrowserAsks =>
      'Was Bots von deinem Browser anfordern dürfen';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama für Chrome beantwortet dies live und nichts wird aufbewahrt. Schalte es in den Einstellungen der Erweiterung ein oder aus.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return '$bot nicht mehr fragen lassen';
  }

  @override
  String get deviceConnections => 'Geräteverbindungen';

  @override
  String get deviceConnectionsHelp =>
      'Teile Daten von diesem Gerät mit deinen Bots. Jede Art ist aus, bis du sie einschaltest, und nur Bots, denen du es erlaubst, können sie lesen – nur in deinen eigenen Chats.';

  @override
  String get deviceConnectionsNone =>
      'Dieses Gerät kann noch keine Daten teilen. Öffne Casama auf deinem Telefon und aktiviere, was du teilen möchtest.';

  @override
  String get deviceKeepFor => 'Aufbewahren für';

  @override
  String get deviceKeepLiveOnly => 'Nur live';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Nur private Modelle';

  @override
  String get devicePrivateModelHelp =>
      'Nur Bots auf einem lokalen Modell können es lesen';

  @override
  String get deviceNoBots =>
      'Noch keine Bots. Ein Bot fragt, wenn er das braucht, oder erlaube jetzt einen.';

  @override
  String get deviceAllowBot => 'Einen Bot erlauben';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Welcher Bot darf deinen Kalender lesen?',
      'reminders': 'Welcher Bot darf deine Erinnerungen lesen?',
      'contacts': 'Welcher Bot darf deine Kontakte lesen?',
      'places': 'Welcher Bot darf deine Orte lesen?',
      'photos': 'Welcher Bot darf deine Fotos lesen?',
      'health': 'Welcher Bot darf deine Gesundheitsdaten lesen?',
      'notifications': 'Welcher Bot darf deine Benachrichtigungen lesen?',
      'activity': 'Welcher Bot darf deine Computeraktivität lesen?',
      'browserTab': 'Welcher Bot darf deinen aktuellen Browser-Tab lesen?',
      'browserHistory':
          'Welcher Bot darf deinen Browserverlauf und deine Lesezeichen lesen?',
      'alarm': 'Welcher Bot darf deine Wecker lesen?',
      'home': 'Welcher Bot darf dein Home-Zubehör lesen?',
      'other': 'Welcher Bot darf deine Gerätedaten lesen?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama hat keine Berechtigung. Erlaube sie in den Systemeinstellungen und versuch es erneut.';

  @override
  String get deviceOtherDevices => 'Deine anderen Geräte';

  @override
  String get deviceForget => 'Dieses Gerät vergessen';

  @override
  String get deviceBrowsers => 'Browser, die Bots nutzen dürfen';

  @override
  String get deviceBrowsersHelp =>
      'Gekoppelt in Casama für Chrome. Erlaubte Bots arbeiten dort in ihrer eigenen Tab-Gruppe, als du angemeldet.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bots',
      one: '1 Bot',
      zero: 'Noch keine Bots',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Online';

  @override
  String get deviceBrowserOffline => 'Offline';

  @override
  String get deviceBrowserUnpair => 'Diesen Browser entkoppeln';

  @override
  String get deviceBrowserAllBots => 'Alle Bots';

  @override
  String get deviceChromeNotPaired => 'Casama für Chrome: nicht gekoppelt';

  @override
  String get deviceChromeHowToPair =>
      'Installiere Casama für Chrome, melde dich an und öffne Mehr → „Bots diesen Browser nutzen lassen“.';

  @override
  String get deviceConnectionsRowHelp =>
      'Kalender, Kontakte und mehr von diesem Gerät';

  @override
  String get healthExtraCycle => 'Zyklusprotokoll';

  @override
  String get healthExtraGlucose => 'Blutzucker';

  @override
  String get healthExtraBloodPressure => 'Blutdruck';

  @override
  String get appleHealth => 'Apple Health';

  @override
  String get appleHealthAbout =>
      'Liest tägliche Zusammenfassungen zu Schlaf, Aktivität, Trainings und Herz aus Apple Health (HealthKit), nur wenn aktiviert. Casama schreibt niemals in Apple Health.';

  @override
  String get healthNotMedical =>
      'Nur tägliche Zusammenfassungen (Schlaf, Aktivität, Trainings, Herz). Bots beschreiben, wie deine Werte im Vergleich zum Üblichen aussehen, und geben nie medizinischen Rat.';

  @override
  String get healthNeedsEncryption =>
      'Gesundheitsdaten erfordern Verschlüsselung im Ruhezustand. Aktiviere sie für einen Workspace, der dir gehört, und versuch es erneut.';

  @override
  String get placeAddHere => 'Aktuellen Standort hinzufügen';

  @override
  String get placeName =>
      'Diesen Ort benennen (Zuhause, Arbeit, Fitnessstudio)';

  @override
  String get placeNoLocation =>
      'Dein Standort ist nicht verfügbar. Erlaube den Standortzugriff für Casama und versuch es erneut.';

  @override
  String get placesHelp =>
      'Bots erfahren, wenn du an diesen Orten ankommst oder sie verlässt. Nur der Ortsname und die Uhrzeit werden geteilt, niemals deine Route.';

  @override
  String get watchedAppsHelp =>
      'Nur Benachrichtigungen dieser Apps werden geteilt. Einmalcodes werden ausgeblendet, bevor etwas dein Telefon verlässt.';

  @override
  String get watchedAppAdd => 'App hinzufügen (Name oder Paket-ID)';

  @override
  String get providerHintMaps => 'Reisezeiten für „Jetzt los“';

  @override
  String routineDevice(String event, String detail) {
    return 'Auf deinem Telefon: $event $detail';
  }

  @override
  String get ctxSelection => 'Ausgewählter Text';

  @override
  String get ctxAddScreenshot => 'Screenshot hinzufügen';

  @override
  String get ctxScreenshotAdded => 'Screenshot hinzugefügt';

  @override
  String get ctxScreenshotFailed =>
      'Screenshot fehlgeschlagen. Erlaube Bildschirmaufnahme für Casama in den Systemeinstellungen.';

  @override
  String get watchedFolders => 'Beobachtete Ordner';

  @override
  String get watchedFoldersHelp =>
      'Eine neue Datei in einem dieser Ordner kann eine Routine starten (zum Beispiel neue PDFs in Downloads ablegen). Nur der Name wird geteilt; Bots lesen die Datei nur, wenn sie auf diesem Computer arbeiten.';

  @override
  String get whyTitle => 'Warum sehe ich das?';

  @override
  String whyData(String data) {
    return 'Genutzt: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Dringlichkeit: $urgency';
  }

  @override
  String get heldMeeting =>
      'Es hat während deines Termins gewartet und kam mit deinem Briefing.';

  @override
  String get heldFocus =>
      'Es hat gewartet, während Fokus aktiv war, und kam mit deinem Briefing.';

  @override
  String get heldDriving =>
      'Es hat während der Fahrt gewartet und kam mit deinem Briefing.';

  @override
  String get heldCap =>
      'Der Bot hatte heute schon 5 Nachrichten gesendet, daher wartete diese auf dein Briefing.';

  @override
  String get heldLow =>
      'Es war nicht dringend, daher wartete es auf dein Briefing, statt dein Telefon brummen zu lassen.';

  @override
  String get lessLikeThis => 'Weniger davon';

  @override
  String get lessLikeThisDone => 'Verstanden, weniger davon';

  @override
  String get widgetStatusWorking => 'Arbeitet…';

  @override
  String get widgetStatusOff => 'Ausgeschaltet';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner => 'Vom Instanzinhaber gesperrt';

  @override
  String get previewHi => 'Hallo!';

  @override
  String get previewAsk => 'Kannst du meine Notizen aufräumen?';

  @override
  String get previewOnIt => 'Bin dran';

  @override
  String get previewDone => 'Erledigt! Sie liegen jetzt in drei Ordnern.';

  @override
  String get previewMessage => 'Nachricht';

  @override
  String get fontPreviewGreeting => 'Guten Morgen';

  @override
  String get photosFromUnsplash => 'Fotos von Unsplash';

  @override
  String get showBotSteps => 'Schritte des Bots zeigen';

  @override
  String get showBotStepsHelp => 'Befehle und technische Fehler in jedem Chat.';

  @override
  String get showScreenCard => 'Bildschirm des Bots bei der Arbeit zeigen';

  @override
  String get showScreenCardHelp =>
      'Eine kleine Live-Karte im Chat. Tippe darauf, um sie im Vollbild zu sehen.';

  @override
  String get showReplyUsage => 'Nutzung bei Antworten zeigen';

  @override
  String get showReplyUsageHelp =>
      'Was jede Antwort gekostet hat, in einer Zeile darunter.';

  @override
  String get openLinksInApp => 'Links in der App öffnen';

  @override
  String get openLinksInAppHelp =>
      'Weblinks öffnen in einem Browser in Casama. Aus: Sie öffnen in deinem Standardbrowser.';

  @override
  String replyUsageTokens(String count) {
    return '$count Tokens';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount über deine Schlüssel';
  }

  @override
  String get replyUsageOnPlan => 'Über dein ChatGPT-Abo';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount bisher';
  }

  @override
  String get replyUsageTooltip => 'Was diese Antwort gekostet hat';

  @override
  String get replyUsageTitle => 'Was diese Antwort gekostet hat';

  @override
  String get replyUsageFromCredits => 'Von deinen Credits';

  @override
  String get replyUsageYourKeys => 'Über deine eigenen Schlüssel';

  @override
  String get replyUsageTotal => 'Gesamt';

  @override
  String get replyUsageTime => 'Zeit';

  @override
  String get replyUsageTokensLabel => 'Tokens';

  @override
  String get replyUsageSteps => 'Schritte';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Enthält $n Helfer-Durchläufe',
      one: 'Enthält 1 Helfer-Durchlauf',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'Für diese Antwort wurde nichts abgerechnet.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 Credit = $price. Deine eigenen Schlüssel und Abos werden von deren Anbieter abgerechnet, nicht von Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Durchlauf öffnen';

  @override
  String get replyUsageLoadFailed =>
      'Nutzung dieser Antwort konnte nicht geladen werden.';

  @override
  String get replyUsageOurCost => 'Unsere Kosten';

  @override
  String get replyUsageMargin => 'Marge';

  @override
  String replyUsageItemCost(String amount) {
    return 'Unsere Kosten $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Unsere Kosten und Marge siehst du, weil du diesen Server betreibst. Niemand sonst sieht sie.';

  @override
  String get kindSpeechToText => 'Sprache zu Text';

  @override
  String get kindVoice => 'Sprachanrufe';

  @override
  String get kindImages => 'Bilder';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Websuchen';

  @override
  String get kindData => 'Datenabfragen';

  @override
  String get kindPhone => 'Telefonanrufe';

  @override
  String get kindApps => 'App-Aktionen';

  @override
  String get activityReady => 'Bereitet sich vor…';

  @override
  String get activitySearching => 'Durchsucht das Web…';

  @override
  String get activityBrowsing => 'Surft im Web…';

  @override
  String get activityComputer => 'Arbeitet auf seinem Computer…';

  @override
  String get activityFiles => 'Geht Dateien durch…';

  @override
  String get activityImage => 'Erstellt ein Bild…';

  @override
  String get activityVideo => 'Erstellt ein Video…';

  @override
  String get activityMemory => 'Prüft, was er weiß…';

  @override
  String get activityApps => 'Nutzt deine Apps…';

  @override
  String get activityScheduling => 'Richtet einen Zeitplan ein…';

  @override
  String get activityWorking => 'Arbeitet daran…';

  @override
  String get activityWaitingForScreen =>
      'Wartet darauf, dass du den Bildschirm zurückgibst…';

  @override
  String get runFailedPlain =>
      'Etwas ist schiefgelaufen. Versuch es erneut oder öffne Details, um den Grund zu sehen.';

  @override
  String get newKeyTitle => 'Neuen Schlüssel kopieren';

  @override
  String get newKeyHelp =>
      'Er wird nur dieses eine Mal angezeigt. Füge ihn in die App ein, die du verbindest, und tippe dann auf Fertig.';

  @override
  String get copyKey => 'Schlüssel kopieren';

  @override
  String get keyCopied => 'Schlüssel kopiert';

  @override
  String revokeApiKeyTitle(String name) {
    return '„$name“ widerrufen?';
  }

  @override
  String get revokeApiKeyBody =>
      'Apps mit diesem Schlüssel können sich sofort nicht mehr verbinden. Das lässt sich nicht rückgängig machen; zum erneuten Verbinden erstelle einen neuen Schlüssel.';

  @override
  String unlinkTitle(String name) {
    return 'Verknüpfung mit „$name“ aufheben?';
  }

  @override
  String get unlinkBody =>
      'Die Bots sprechen sofort nicht mehr miteinander. Für eine erneute Verknüpfung ist eine neue Einladung nötig.';

  @override
  String get alreadyMember => 'Du bist bereits in diesem Workspace.';

  @override
  String get askAdminToInvite =>
      'Nur Inhaber und Admins können Personen einladen. Bitte jemanden von ihnen um einen Einladungslink.';

  @override
  String get askBeforeJoining => 'Mich fragen, bevor Personen beitreten';

  @override
  String get askBeforeJoiningHelp =>
      'Ein Admin gibt jede Person frei, die den Link nutzt.';

  @override
  String get askToJoin => 'Beitritt anfragen';

  @override
  String get customLinks => 'Eigene Links';

  @override
  String get customLinksHelp =>
      'Links mit eigener Rolle, Ablaufzeit oder Anzahl von Nutzungen.';

  @override
  String get emailAddresses => 'E-Mail-Adressen';

  @override
  String get emailAddressesHelp =>
      'Eine oder mehrere einfügen, getrennt durch Kommas oder Zeilenumbrüche.';

  @override
  String get getCode => 'Code anfordern';

  @override
  String get getNewCode => 'Neuen Code anfordern';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get welcomeCta => 'Los geht’s';

  @override
  String get inviteAsAdmin => 'Als Admins einladen';

  @override
  String get inviteByEmail => 'Per E-Mail einladen';

  @override
  String get inviteExpired => 'Abgelaufen';

  @override
  String inviteExpires(String when) {
    return 'Läuft ab $when';
  }

  @override
  String get inviteInvalid => 'Diese Einladung funktioniert nicht';

  @override
  String get inviteInvalidHelp =>
      'Sie ist vielleicht abgelaufen, aufgebraucht oder deaktiviert. Bitte um eine neue.';

  @override
  String get inviteLink => 'Einladungslink';

  @override
  String get inviteLinkApprovalHelp =>
      'Alle mit diesem Link können eine Beitrittsanfrage senden. Du gibst sie unten frei.';

  @override
  String get inviteLinkHelp =>
      'Jeder mit diesem Link kann als Mitglied beitreten. Teile ihn im Chat oder per E-Mail.';

  @override
  String get inviteLinkOrCode => 'Einladungslink oder -code';

  @override
  String inviteOtherServer(String host) {
    return 'Diese Einladung gilt für $host, und diese App ist mit einem anderen Server verbunden.';
  }

  @override
  String get inviteRenewed =>
      'Die Einladung gilt für 7 weitere Tage. Sende den neuen Link.';

  @override
  String inviteSentTo(String email) {
    return 'Melde dich mit $email an, um anzunehmen.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Tritt $workspace auf Casama bei: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name hat dich zum Beitritt eingeladen';
  }

  @override
  String get invitedToJoin => 'Du bist zum Beitritt eingeladen';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Einladungen gesendet.',
      one: 'Einladung gesendet.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Du trittst als Admin bei';

  @override
  String get joinAsMember => 'Du trittst als Mitglied bei';

  @override
  String get joinByDomain => 'Über E-Mail-Domain beitreten';

  @override
  String get joinByDomainHelp =>
      'Bestätigte Adressen treten ohne Einladung bei.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Jeder mit einer bestätigten @$domain-E-Mail kann beitreten';
  }

  @override
  String get joinByDomainUnavailable =>
      'Verfügbar, wenn du dich mit einer bestätigten geschäftlichen E-Mail anmeldest (nicht gmail.com und Ähnliches).';

  @override
  String get joinNeedsApproval =>
      'Ein Admin gibt neue Personen frei, bevor sie beitreten.';

  @override
  String get joinRequestSent => 'Anfrage gesendet';

  @override
  String joinRequestSentHelp(String name) {
    return 'Ein Admin von $name sieht es sich an. Du erhältst eine Benachrichtigung, sobald du dabei bist.';
  }

  @override
  String get joinWithLinkOrCode => 'Mit Link oder Code beitreten';

  @override
  String get spacesInvite => 'Personen einladen';

  @override
  String spacesInviteTo(String name) {
    return 'In $name';
  }

  @override
  String get spacesNew => 'Neuer Workspace';

  @override
  String get spacesNewHint => 'Eigene Bots, Personen und Abrechnung';

  @override
  String get spacesJoin => 'Einem Workspace beitreten';

  @override
  String get spacesJoinHint => 'Mit Einladungslink oder -code';

  @override
  String joinWorkspaceNamed(String name) {
    return '$name beitreten';
  }

  @override
  String get joinedBotsHelp =>
      'Diese Bots sind da, um zu helfen. Sag einem Hallo, um zu starten.';

  @override
  String get joinedNoBots =>
      'Hier gibt es noch keine Bots. Erstelle einen oder sieh dich zuerst um.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mitglieder',
      one: '1 Mitglied',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Mitglieder';

  @override
  String openToDomain(String domain) {
    return 'Offen für @$domain';
  }

  @override
  String openWorkspace(String name) {
    return '$name öffnen';
  }

  @override
  String get pendingInvites => 'Noch nicht angenommene Einladungen';

  @override
  String get people => 'Personen';

  @override
  String get workspaceAdvancedSummary =>
      'Geheimnisse, Gedächtnis, Verschlüsselung, Zahlungen, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Einladungscode, E-Mail-Domain, eigene Links';

  @override
  String get inviteLinkToCopy => 'Einladungslink, bereit zum Kopieren';

  @override
  String linkMade(String when) {
    return 'Erstellt $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Kosten nach Server, Casama Link-Server und Schlüssel';

  @override
  String get billingChargesSummary => 'Kosten nach Server';

  @override
  String get billingUsageRow =>
      'Was Bots genutzt haben und was es gekostet hat';

  @override
  String billingUsageSoFar(String amount) {
    return 'Diesen Monat bisher: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Token-Zahlen, JSON-Export';

  @override
  String get peopleHelp =>
      'Personen einladen und entscheiden, wer hineinkommt.';

  @override
  String get peopleRow =>
      'Personen einladen, Anfragen freigeben, Mitglieder ansehen';

  @override
  String get qrCode => 'QR-Code';

  @override
  String get remove => 'Entfernen';

  @override
  String get resendInvite => 'Erneut senden';

  @override
  String get resetLink => 'Link zurücksetzen';

  @override
  String get resetLinkHelp =>
      'Der aktuelle Link funktioniert sofort nicht mehr und du bekommst einen neuen. Wer schon dabei ist, bleibt dabei.';

  @override
  String get revokeInvite => 'Einladung abbrechen';

  @override
  String scanToJoin(String name) {
    return 'Scannen, um $name beizutreten';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString Einladungen senden';
  }

  @override
  String get sendInvitesYourself => 'Diese Einladungen selbst senden';

  @override
  String get sendInvitesYourselfHelp =>
      'E-Mail ist auf diesem Server nicht eingerichtet. Sende jeder Person ihren Link, dann meldet sie sich mit dieser Adresse zum Beitreten an.';

  @override
  String get signInToJoin => 'Zum Beitreten anmelden';

  @override
  String get startOwnWorkspace => 'Stattdessen eigenen Workspace starten';

  @override
  String switchToServer(String host) {
    return 'Zu $host wechseln';
  }

  @override
  String get waitingToJoin => 'Wartet auf Beitritt';

  @override
  String welcomeToWorkspace(String name) {
    return 'Willkommen bei $name';
  }

  @override
  String get workspacesYouCanJoin => 'Workspaces, denen du beitreten kannst';

  @override
  String get yourTeamIsHere => 'Dein Team ist schon hier';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Personen bei $domain nutzen diese Workspaces. Tritt einem bei oder starte deinen eigenen.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Leicht vorzulesen oder einzutippen. Gilt 48 Stunden. Man gibt ihn unter Mit Link oder Code beitreten ein.';

  @override
  String get inviteSomeoneNew => 'Jemand Neuen in den Workspace einladen';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app meldet sich nur über eine sichere Adresse (https) an, und dieser Casama-Server läuft unter $address. Stelle Casama über https bereit, um die Anmeldung zu nutzen.';
  }

  @override
  String get aboutYou => 'Über dich';

  @override
  String get aboutYouRow =>
      'Wie deine Bots dich nennen und was sie über dich wissen';

  @override
  String get aboutYouIntro =>
      'Deine Bots lesen das, um dich beim Namen zu nennen und so zu antworten, wie du es magst. Nur du kannst es sehen.';

  @override
  String get photoChange => 'Profilfoto ändern';

  @override
  String get photoTake => 'Foto aufnehmen';

  @override
  String get photoChoose => 'Foto auswählen';

  @override
  String get photoUseGoogle => 'Mein Google-Foto nutzen';

  @override
  String get photoRemove => 'Foto entfernen';

  @override
  String get photoUnreadable =>
      'Diese Datei ist kein Foto, das Casama nutzen kann. Versuch es mit JPEG oder PNG.';

  @override
  String get whatToCallYou => 'Wie sollen Bots dich nennen?';

  @override
  String get pronounsOptional => 'Pronomen (optional)';

  @override
  String get aboutMe => 'Über mich';

  @override
  String get aboutMeHint =>
      'Deine Arbeit, die Menschen in deinem Leben, wofür du dich begeisterst. Alles, was hilft.';

  @override
  String get replyStyle => 'Wie ich Antworten mag';

  @override
  String get replyStyleHint =>
      'Zum Beispiel: kurze Antworten, keine Emojis, Dinge einfach erklären';

  @override
  String get learnAboutMe => 'Aus Chats über mich lernen';

  @override
  String get learnAboutMeHelp =>
      'Bots speichern Fakten über dich. Du kannst sie jederzeit bearbeiten.';

  @override
  String get adultSites => 'Websites für Erwachsene';

  @override
  String get adultSitesHelp =>
      'Bots dürfen auf deinen Wunsch Websites für Erwachsene öffnen. Nur ab 18 Jahren.';

  @override
  String get adultSitesConfirmTitle => 'Websites für Erwachsene aktivieren?';

  @override
  String get adultSitesConfirmBody =>
      'Du bestätigst, dass du mindestens 18 Jahre alt bist. Wenn du darum bittest, dürfen Bots Websites für Erwachsene für dich öffnen und als Text auflisten, was dort steht. Das funktioniert auf Casama im Web oder in der Desktop-App, niemals in geteilten Chats.';

  @override
  String get adultSitesConfirm => 'Ich bin 18 oder älter';

  @override
  String get adultSitesApprovalDetail =>
      'Erlauben bedeutet, dass du bestätigst, mindestens 18 Jahre alt zu sein, und Websites für Erwachsene für dein Konto aktivierst. Du kannst das unter Über dich wieder ausschalten.';

  @override
  String useInThisSpace(String workspace) {
    return 'Geteiltes in $workspace nutzen';
  }

  @override
  String get useInThisSpaceHelp =>
      'Aus: Hier werden nur dein Name und dein Antwortstil genutzt.';

  @override
  String get learnedAboutYou => 'Was Bots gelernt haben';

  @override
  String get noLearnedFacts =>
      'Noch nichts. Fakten, die Bots im Chat über dich lernen, erscheinen hier.';

  @override
  String get addFact => 'Fakt hinzufügen';

  @override
  String get editFact => 'Fakt bearbeiten';

  @override
  String get deleteFactTitle => 'Diesen Fakt löschen?';

  @override
  String get deleteFactConfirm => 'Deine Bots werden ihn nicht mehr wissen.';

  @override
  String get importToProfile => 'Aus ChatGPT oder Claude importieren';

  @override
  String get savedToProfile => 'In deinem Profil gespeichert';

  @override
  String get undo => 'Rückgängig';

  @override
  String get suggestedLookApplied => 'Neues Theme angewendet';

  @override
  String get suggestedLookUnavailable => 'Diese App hat dieses Theme nicht';

  @override
  String get removedFromProfile => 'Aus deinem Profil entfernt';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Fakten hinzugefügt',
      one: '1 Fakt hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Deine Bots verwenden ihn in jedem Workspace. Du kannst ihn später unter Einstellungen → Über dich ändern.';

  @override
  String get nameStepBubble => 'Schön, dich kennenzulernen!';

  @override
  String get heardFromTitle => 'Wie hast du von uns erfahren?';

  @override
  String get heardFromHelp =>
      'Ein Tippen hilft uns zu sehen, was funktioniert. Du kannst das überspringen.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Von Freunden';

  @override
  String get heardFromSearch => 'Suche';

  @override
  String get heardFromAiAssistant => 'Ein KI-Assistent';

  @override
  String get heardFromOther => 'Sonstiges';

  @override
  String get heardFromSkip => 'Überspringen';

  @override
  String get nameStepHint => 'Dein Name';

  @override
  String get skillCatalogSubtitle =>
      'Vorgefertigte Skills, die deine Bots laden, wenn eine Aufgabe sie erfordert.';

  @override
  String get skillCategoryWork => 'Arbeit';

  @override
  String get skillCategoryWriting => 'Schreiben';

  @override
  String get skillCategoryResearch => 'Recherche';

  @override
  String get skillCategoryData => 'Daten';

  @override
  String get skillCategoryMoney => 'Finanzen';

  @override
  String get skillCategoryBuild => 'Entwicklung';

  @override
  String get skillCategoryLife => 'Alltag';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Skills',
      one: '1 Skill',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Installiert';

  @override
  String skillInstalledFor(String names) {
    return 'Installiert für $names';
  }

  @override
  String installSkillFor(String name) {
    return '$name installieren für';
  }

  @override
  String skillUseHint(String name) {
    return 'Bots laden ihn selbstständig, wenn eine Aufgabe passt, oder tippe /$name im Chat, um ihn zu verwenden.';
  }

  @override
  String get skillInstructions => 'Anweisungen';

  @override
  String get skillAlreadyEverywhere =>
      'Überall installiert, wo es möglich ist.';

  @override
  String get gallery => 'Galerie';

  @override
  String get galleryEmpty => 'Nichts in der Galerie passt dazu.';

  @override
  String get galleryOffline =>
      'Die Galerie ist gerade nicht erreichbar. Die integrierten Looks und Skills sind weiterhin da.';

  @override
  String get galleryUse => 'Verwenden';

  @override
  String get galleryInstall => 'Installieren';

  @override
  String get galleryReport => 'Melden';

  @override
  String get galleryShare => 'In der Galerie teilen';

  @override
  String galleryBy(String name) {
    return 'Von $name';
  }

  @override
  String get galleryFeatured => 'Empfohlen';

  @override
  String get galleryAll => 'Alle';

  @override
  String get galleryThemes => 'Themes';

  @override
  String get gallerySchemes => 'Farben';

  @override
  String get galleryWallpapers => 'Hintergründe';

  @override
  String get gallerySkills => 'Skills';

  @override
  String get fromGallery => 'Galerie';

  @override
  String galleryApplied(String name) {
    return 'Verwendet: $name';
  }

  @override
  String get gallerySeeAll => 'Alle ansehen';

  @override
  String get galleryInUse => 'Wird verwendet';

  @override
  String galleryInstalled(String name) {
    return '$name installiert';
  }

  @override
  String get galleryPreviewDark => 'Vorschau im dunklen Modus';

  @override
  String get galleryPreviewLight => 'Vorschau im hellen Modus';

  @override
  String get galleryClearSearch => 'Suche leeren';

  @override
  String get galleryOfflineTitle => 'Die Galerie ist offline';

  @override
  String galleryNoMatches(String query) {
    return 'Keine Treffer für „$query“';
  }

  @override
  String get galleryInstructions => 'Anweisungen';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern auf $palette';
  }

  @override
  String get galleryImage => 'Bild';

  @override
  String get galleryMeshGradient => 'ein Mesh-Verlauf';

  @override
  String get galleryOwnDoodles => 'Eigene Kritzeleien';

  @override
  String get galleryLightAndDark => 'Hell und dunkel';

  @override
  String get galleryContribute =>
      'Einen Look erstellt, der dir gefällt? Teile ihn, und alle auf Casama können ihn hier finden.';

  @override
  String get galleryTypeTheme => 'Theme';

  @override
  String get galleryTypeScheme => 'Farbschema';

  @override
  String get galleryTypeWallpaper => 'Hintergrundbild';

  @override
  String get galleryTypeSkill => 'Skill';

  @override
  String get galleryBehindChats => 'Hinter deinen Chats';

  @override
  String celebrateNewBot(String name) {
    return 'Sag Hallo zu $name!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name ist bereit!';
  }

  @override
  String get celebrateJoined => 'Du bist drin! Willkommen!';

  @override
  String celebrateNewRoutine(String name) {
    return '$name ist startklar.';
  }

  @override
  String get fewerEffects => 'Weniger Effekte';

  @override
  String get fewerEffectsHelp =>
      'Keine Konfetti-Effekte, hüpfenden Tabs oder animierten Bots.';

  @override
  String get settingsAppSection => 'App';

  @override
  String get settingsSecuritySection => 'Anmeldung & Sicherheit';

  @override
  String get customize => 'Anpassen';

  @override
  String get customizeColors => 'Farben';

  @override
  String get appearanceCustomLook => 'Eigenes Theme';

  @override
  String get appearanceCustomHelp =>
      'Deine eigenen Änderungen. Speichere sie als Theme, um sie zu behalten.';

  @override
  String get appearanceFromGallery => 'Aus der Galerie';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Alle $countString anzeigen';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Zu $name gewechselt';
  }

  @override
  String appearanceSaved(String name) {
    return '$name in deinen Themes gespeichert';
  }

  @override
  String get appearanceAboutTheme => 'Über dieses Theme';

  @override
  String settingsOnDevServer(String host) {
    return 'Einstellungen · Entwicklungsserver $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Du: $text';
  }

  @override
  String get chatPreviewPhoto => 'Foto';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Sprachnachricht';

  @override
  String get chatPreviewNone => 'Noch keine Nachrichten';

  @override
  String get chatTimeYesterday => 'Gestern';

  @override
  String get chatDayToday => 'Heute';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day um $time';
  }

  @override
  String get anyPriority => 'Beliebige Priorität';

  @override
  String get readingAloud => 'Wird vorgelesen';

  @override
  String get readAloudPreparing => 'Wird vorbereitet…';

  @override
  String get readAloudPaused => 'Pausiert';

  @override
  String get stopReading => 'Vorlesen stoppen';

  @override
  String get readAloudSpeed => 'Wiedergabetempo';

  @override
  String readAloudTimeLeft(String time) {
    return 'Noch $time';
  }

  @override
  String get readAloudShowMessage => 'Gerade vorgelesene Nachricht anzeigen';

  @override
  String mentionOpenProfile(String name) {
    return '$name, Profil öffnen';
  }

  @override
  String get paywallSubtitle =>
      'Mehr Bots, mehr Computerzeit und jeden Monat neue Credits, damit deine Bots weiterarbeiten können.';

  @override
  String get paywallPerkBots => 'Bots';

  @override
  String get paywallPerkBotsBody =>
      'Ein ganzes Team, jeder mit eigener Aufgabe.';

  @override
  String get paywallPerkComputers => 'Computerzeit';

  @override
  String get paywallPerkComputersBody =>
      'Bots bekommen ihre eigenen Computer zum Surfen, Programmieren und Bauen.';

  @override
  String get paywallPerkCredits => 'Monatliche Credits';

  @override
  String get paywallPerkCreditsBody => 'Für Modelle, Suche und Tools.';

  @override
  String get paywallPerkSeats => 'Plätze';

  @override
  String get paywallPerkSeatsBody => 'Hol dein Team in denselben Workspace.';

  @override
  String paywallHours(String hours) {
    return '$hours Std.';
  }

  @override
  String get paywallWeekly => 'Wöchentlich';

  @override
  String get paywallMonthly => 'Monatlich';

  @override
  String get paywallYearly => 'Jährlich';

  @override
  String get paywallPerMonth => '/ Monat';

  @override
  String get paywallPerYear => '/ Jahr';

  @override
  String get paywallContinue => 'Weiter';

  @override
  String get paywallContinueCheckout => 'Weiter zur Kasse';

  @override
  String get paywallRestore => 'Wiederherstellen';

  @override
  String get paywallFineStore =>
      'Verlängert sich automatisch. Jederzeit in den Store-Einstellungen kündbar.';

  @override
  String get paywallFineWeb =>
      'Verlängert sich automatisch. Jederzeit unter Abrechnung kündbar.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, automatische Verlängerung bis zur Kündigung. Die Zahlung wird deinem Apple Account belastet. Jederzeit in den Einstellungen für deinen Apple Account kündbar, mindestens 24 Stunden vor der Verlängerung.',
      'google_play':
          '$price, automatische Verlängerung bis zur Kündigung. Die Zahlung wird deinem Google Play-Konto belastet. Jederzeit in den Einstellungen für dein Google Play-Konto kündbar, mindestens 24 Stunden vor der Verlängerung.',
      'other':
          '$price, automatische Verlängerung bis zur Kündigung. Die Zahlung wird deinem Store-Konto belastet. Jederzeit in den Einstellungen für dein Store-Konto kündbar, mindestens 24 Stunden vor der Verlängerung.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days Tage kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
      one:
          '1 Tag kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days Tage kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
      one:
          '1 Tag kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days Tage kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
      one:
          '1 Tag kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Die Zahlung wird deinem Apple Account belastet, wenn die kostenlose Testphase endet. Wenn du mindestens 24 Stunden vor Ende der Testphase in den Einstellungen für deinen Apple Account kündigst, wird dir nichts berechnet.',
      'google_play':
          '$_temp1 Die Zahlung wird deinem Google Play-Konto belastet, wenn die kostenlose Testphase endet. Wenn du mindestens 24 Stunden vor Ende der Testphase in den Einstellungen für dein Google Play-Konto kündigst, wird dir nichts berechnet.',
      'other':
          '$_temp2 Die Zahlung wird deinem Store-Konto belastet, wenn die kostenlose Testphase endet. Wenn du mindestens 24 Stunden vor Ende der Testphase in den Einstellungen für dein Store-Konto kündigst, wird dir nichts berechnet.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Kostenlose Testphase starten';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage kostenlos, danach $price/Jahr',
      one: '1 Tag kostenlos, danach $price/Jahr',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage kostenlos, danach $price/Mon.',
      one: '1 Tag kostenlos, danach $price/Mon.',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, automatische Verlängerung bis zur Kündigung. Jederzeit unter Abrechnung kündbar; du behältst das Abo bis zum Ende des Zeitraums.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days Tage kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
      one:
          '1 Tag kostenlos, danach $price, automatische Verlängerung bis zur Kündigung.',
    );
    return '$_temp0 Wenn du vor Ende der kostenlosen Testphase unter Abrechnung kündigst, wird dir nichts berechnet.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price pro Woche',
      'year': '$price pro Jahr',
      'other': '$price pro Monat',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get aiConsentTitle => 'Deine Chats gehen an KI-Unternehmen';

  @override
  String get aiConsentBody =>
      'Um Antworten zu schreiben, sendet Casama, was du mit deinen Bots teilst, an externe KI-Anbieter. Nichts wird gesendet, bevor du zustimmst.';

  @override
  String get aiConsentUpdatedNotice =>
      'Wir haben Webseiten zu dieser Liste hinzugefügt.';

  @override
  String get aiConsentWhatTitle => 'Was gesendet wird';

  @override
  String get aiConsentWhat =>
      'Deine Nachrichten, Dateien und Fotos, deine Stimme in Anrufen, Sprachnachrichten und Diktaten, was sich Bots über dich merken, die Webseiten, die deine Bots für dich öffnen (auf ihrem eigenen Computer oder im Browser auf diesem Gerät), sowie alle Telefondaten, die du einschaltest, wie Kalender oder Health.';

  @override
  String get aiConsentWhoTitle => 'Wer es erhält';

  @override
  String get aiConsentWho =>
      'OpenRouter, das die Daten an das Unternehmen weitergibt, das dein genutztes Modell bereitstellt, etwa DeepSeek, Google oder OpenAI. Anrufe nutzen Google Gemini, und OpenAI wandelt Sprachnachrichten und Diktate in Text um. Websuchen gehen an Parallel, Serper oder DeepSeek. Mit deinem eigenen API-Schlüssel gehen die Daten stattdessen an diesen Anbieter.';

  @override
  String get aiConsentWhyTitle => 'Was sie damit tun';

  @override
  String get aiConsentWhy =>
      'Sie nutzen die Daten, um die Antwort zu schreiben. Du kannst das jederzeit unter Einstellungen › Datenschutz stoppen; Details stehen in der Datenschutzerklärung.';

  @override
  String get aiConsentAgree => 'Zustimmen und weiter';

  @override
  String get aiConsentTile => 'KI-Anbieter';

  @override
  String get aiConsentTileOn =>
      'Erlaubt. Was du mit Bots teilst, geht an externe KI-Anbieter, um Antworten zu schreiben.';

  @override
  String get aiConsentWithdrawQuestion => 'Weitergabe an KI-Anbieter stoppen?';

  @override
  String get aiConsentWithdrawBody =>
      'Ohne sie können Bots nicht antworten. Casama fragt erneut nach, bevor wieder etwas gesendet wird.';

  @override
  String get aiConsentWithdraw => 'Weitergabe stoppen';

  @override
  String get planChanged => 'Abo geändert';

  @override
  String get purchasesRestored => 'Käufe wiederhergestellt';

  @override
  String get creditsAdded => 'Credits hinzugefügt';

  @override
  String get purchasePending =>
      'Warten auf Freigabe des Kaufs. Sobald er freigegeben ist, wird er hinzugefügt.';

  @override
  String get purchaseFailed =>
      'Der Kauf ging nicht durch, und dir wurde nichts berechnet.';

  @override
  String get purchaseVerifyFailed =>
      'Wir konnten deinen Kauf noch nicht bestätigen. Es wird automatisch erneut versucht; falls er nicht bald erscheint, tippe auf Käufe wiederherstellen.';

  @override
  String paywallTitleFor(String plan) {
    return 'Erweitere dein Team mit $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Willkommen bei $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Monate kostenlos',
      one: '1 Monat kostenlos',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Zu $plan wechseln';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Du hast dein Abo über den App Store abgeschlossen. Um dein Abo zu ändern, nutze den App Store auf dem Gerät, mit dem du es abgeschlossen hast.',
      'google_play': 'Du hast dein Abo über Google Play abgeschlossen. Um dein Abo zu ändern, nutze Google Play auf dem Gerät, mit dem du es abgeschlossen hast.',
      'other': 'Du hast dein Abo über einen App-Store abgeschlossen. Um dein Abo zu ändern, nutze diesen Store auf dem Gerät, mit dem du es abgeschlossen hast.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Dein Abo läuft über das Web. Ändere dein Abo hier über den Web-Checkout oder verwalte dein Abo.';

  @override
  String get subscribedOutsideAppNote =>
      'Dein Abo wird außerhalb dieser App abgerechnet und kann daher hier nicht geändert werden.';

  @override
  String get outOfCreditsTitle => 'Deine Credits sind aufgebraucht';

  @override
  String get outOfCreditsPaidBody =>
      'Deine Bots pausieren, bis du Credits auflädst. Credit-Pakete aus dem App Store oder von Google Play verfallen nie; im Web gekaufte Credit-Pakete gelten 12 Monate.';

  @override
  String get outOfCreditsFreeBody =>
      'Mach ein Upgrade für monatlich mehr Credits, mehr Bots und mehr Computerzeit.';

  @override
  String get addCredits => 'Credits hinzufügen';

  @override
  String get seePlansButton => 'Abos ansehen';

  @override
  String get paywallAskAdmin =>
      'Nur Workspace-Inhaber und Admins können das Abo ändern. Bitte einen von ihnen um ein Upgrade.';

  @override
  String get upgradeToPro => 'Upgrade auf Pro';

  @override
  String get upgradeToProBody =>
      'Mehr Bots, Computerzeit und monatliche Credits.';

  @override
  String get manageTab => 'Verwalten';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'RAM';

  @override
  String get vitalsDisk => 'Speicherplatz';

  @override
  String get fixItTitle => 'Funktioniert etwas nicht richtig?';

  @override
  String get fixItSubtitle =>
      'Probiere diese Schritte der Reihe nach. Jeder geht ein Stück weiter.';

  @override
  String get fixRestart => 'Neu starten';

  @override
  String get fixRestartHelp => 'Etwa 20 Sekunden · nichts geht verloren';

  @override
  String get fixResetSystem => 'System zurücksetzen';

  @override
  String get fixResetSystemHelp =>
      'Ein frisches System · deine Dateien bleiben';

  @override
  String get fixErase => 'Alles löschen';

  @override
  String get fixEraseHelp =>
      'Wie neu · kann 7 Tage lang rückgängig gemacht werden';

  @override
  String get fixResetAction => 'Zurücksetzen…';

  @override
  String get fixEraseAction => 'Löschen…';

  @override
  String get computerRestarting => 'Wird neu gestartet…';

  @override
  String get computerRestarted => 'Neu gestartet. Alle deine Dateien sind da.';

  @override
  String get computerUpdateTitle => 'Update verfügbar';

  @override
  String get computerUpdateBody =>
      'Neue Tools und Korrekturen stehen bereit. Ein Update startet diesen Computer neu: Deine Dateien bleiben erhalten, offene Fenster und laufende Programme schließen.';

  @override
  String get computerUpdateBotWorking =>
      'Ein Bot arbeitet gerade auf diesem Computer. Das Update stoppt seine aktuelle Arbeit.';

  @override
  String get computerUpdateNow => 'Jetzt aktualisieren';

  @override
  String get computerUpdateLater => 'Später';

  @override
  String get computerUpdateConfirmTitle => 'Diesen Computer aktualisieren?';

  @override
  String get computerUpdateMenu => 'Computer aktualisieren';

  @override
  String get computerUpdating => 'Wird aktualisiert…';

  @override
  String get computerUpdated => 'Aktualisiert. Alle deine Dateien sind da.';

  @override
  String get computerUpdateBusyTitle => 'Ein Befehl läuft noch';

  @override
  String get computerUpdateBusyBody =>
      'Wenn du jetzt aktualisierst, wird er gestoppt. Warte, bis er fertig ist, oder aktualisiere trotzdem.';

  @override
  String get computerUpdateAnyway => 'Trotzdem aktualisieren';

  @override
  String resetSheetTitle(String name) {
    return '$name zurücksetzen';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots können ihn etwa eine Minute lang nicht nutzen.';
  }

  @override
  String get resetSheetBusyNone =>
      'Er kann etwa eine Minute lang nicht genutzt werden.';

  @override
  String get resetOptionSystem => 'System zurücksetzen, meine Dateien behalten';

  @override
  String get resetOptionSystemHelp =>
      'Behebt defekte Installationen, Einstellungen und hängende Programme.';

  @override
  String get resetOptionErase => 'Alles löschen';

  @override
  String get resetOptionEraseHelp => 'Zurück auf einen brandneuen Computer.';

  @override
  String get resetKept => 'Bleibt erhalten';

  @override
  String get resetRemoved => 'Entfernt';

  @override
  String get resetKeptFiles => 'Deine Dateien im Ordner „workspace“';

  @override
  String get resetKeptSettings => 'Name, Einstellungen und Bots';

  @override
  String get resetKeptRestorePoints => 'Wiederherstellungspunkte';

  @override
  String get resetRemovedApps => 'Installierte Apps und Tools';

  @override
  String get resetRemovedPrograms => 'Laufende Programme';

  @override
  String get resetRemovedCaches => 'Caches und Einstellungen im Home-Ordner';

  @override
  String get resetRemovedFiles => 'Jede Datei, auch im Workspace';

  @override
  String get resetSavePoint => 'Zuerst einen Wiederherstellungspunkt speichern';

  @override
  String get resetSavePointHelp =>
      'Damit du das 7 Tage lang rückgängig machen kannst';

  @override
  String eraseTypeName(String name) {
    return 'Zur Bestätigung $name eingeben';
  }

  @override
  String get resetConfirmSystem => 'System zurücksetzen';

  @override
  String get resetConfirmErase => 'Alles löschen';

  @override
  String get resetStepSaving => 'Wiederherstellungspunkt wird gespeichert';

  @override
  String get resetStepWipingSystem => 'Apps und Einstellungen werden entfernt';

  @override
  String get resetStepWipingErase => 'Alle Dateien werden gelöscht';

  @override
  String get resetStepRestarting => 'Frisches System wird gestartet';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Wird zurückgesetzt… $stepString von $totalString';
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

    return 'Wird gelöscht… $stepString von $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Du kannst diesen Bildschirm verlassen. Es läuft selbstständig weiter.';

  @override
  String get resetDone => 'Frisches System bereit';

  @override
  String get eraseDone => 'Computer gelöscht';

  @override
  String get resetFailed => 'Zurücksetzen wurde nicht abgeschlossen';

  @override
  String get resetUndoHint =>
      'Mit Rückgängig stellst du alles wieder so her, wie es war. Der Wiederherstellungspunkt bleibt 7 Tage erhalten.';

  @override
  String get restoredPrevious => 'Wiederhergestellt wie zuvor';

  @override
  String get usageThisMonth => 'Diesen Monat';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString Std. $minutesString Min.';
  }

  @override
  String get usageCostNote =>
      'Wird nur berechnet, solange er aktiv ist. Im Ruhezustand kostenlos.';

  @override
  String get usageNone => 'Diesen Monat noch nicht genutzt';

  @override
  String get sleepTimerTitle => 'Geht in den Ruhezustand nach';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString Min.';
  }

  @override
  String get sleepTimerHour => '1 Stunde';

  @override
  String get sleepTimerHelp =>
      'Nie, solange ein Bot arbeitet oder du ihn nutzt. Eine längere Wartezeit lässt ihn länger aktiv, was mehr kostet.';

  @override
  String sleepTimerSaved(String label) {
    return 'Geht nach $label ohne Aktivität in den Ruhezustand';
  }

  @override
  String get storageTitle => 'Speicherplatz';

  @override
  String storageOf(String total) {
    return 'von $total';
  }

  @override
  String get storageFiles => 'Deine Dateien';

  @override
  String get storageApps => 'Apps und Tools';

  @override
  String get storageCaches => 'Caches';

  @override
  String get storageBrowser => 'Browser';

  @override
  String get storageOther => 'Sonstiges';

  @override
  String get storageFree => 'Frei';

  @override
  String storageFreeUp(String size) {
    return '$size freigeben';
  }

  @override
  String get storageNothingToClean => 'Keine Caches zum Leeren vorhanden';

  @override
  String storageFreed(String size) {
    return '$size freigegeben';
  }

  @override
  String get storageAsleep =>
      'Wecke den Computer, um zu sehen, was Platz belegt.';

  @override
  String get processesTitle => 'Läuft gerade';

  @override
  String get processesNone => 'Es läuft nichts außer dem Computer selbst.';

  @override
  String get processesAsleep => 'Im Ruhezustand läuft nichts.';

  @override
  String get processStop => 'Stoppen';

  @override
  String processStopTitle(String name) {
    return '$name stoppen?';
  }

  @override
  String get processStopMessage => 'Alles Ungespeicherte geht verloren.';

  @override
  String processStopped(String name) {
    return '$name gestoppt';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu % CPU · $memory';
  }

  @override
  String get usedByTitle => 'Genutzt von';

  @override
  String get usedByNone => 'Noch kein Bot nutzt diesen Computer.';

  @override
  String botLastActive(String when) {
    return 'Aktiv $when';
  }

  @override
  String get botNeverActive => 'Noch nicht aktiv';

  @override
  String get restorePointsTitle => 'Wiederherstellungspunkte';

  @override
  String get restorePointsNone =>
      'Noch keine. Bots speichern vor riskanten Änderungen einen Punkt.';

  @override
  String get restorePointSaveNow => 'Jetzt Wiederherstellungspunkt speichern';

  @override
  String get restorePointSaveTitle => 'Wiederherstellungspunkt speichern';

  @override
  String get restorePointDefaultLabel => 'Manuell gespeichert';

  @override
  String get restorePointSaved => 'Wiederherstellungspunkt gespeichert';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Alle $nString anzeigen';
  }

  @override
  String get historyTitle => 'Verlauf';

  @override
  String get historyNone => 'Es ist noch nichts passiert.';

  @override
  String get historyStarted => 'Aufgewacht';

  @override
  String get historySlept => 'In den Ruhezustand gegangen';

  @override
  String get historySleptIdle =>
      'In den Ruhezustand gegangen (keine Aktivität)';

  @override
  String get historyRestarted => 'Neu gestartet';

  @override
  String get historyReset => 'System zurückgesetzt';

  @override
  String get historyErased => 'Alles gelöscht';

  @override
  String get historyCheckpointCreated => 'Wiederherstellungspunkt gespeichert';

  @override
  String get historyCheckpointRestored =>
      'Wiederherstellungspunkt wiederhergestellt';

  @override
  String historyStorageCleaned(String size) {
    return '$size freigegeben';
  }

  @override
  String get historyStorageCleanedPlain => 'Platz freigegeben';

  @override
  String historyProcessStopped(String name) {
    return '$name gestoppt';
  }

  @override
  String get historyUpdated => 'Einstellungen geändert';

  @override
  String get historyYou => 'du';

  @override
  String get yourDataTitle => 'Deine Daten';

  @override
  String get downloadAllFiles => 'Alle Dateien herunterladen';

  @override
  String get downloadAllFilesHelp => 'Eine .zip-Datei mit allem im Workspace';

  @override
  String get downloadNothing => 'Es gibt noch keine Dateien zum Herunterladen.';

  @override
  String get deleteComputerHelp =>
      'Entfernt ihn samt seinen Wiederherstellungspunkten';

  @override
  String get manageComputer => 'Verwalten';

  @override
  String get restartComputer => 'Neu starten';

  @override
  String get resetComputerMenu => 'Zurücksetzen…';

  @override
  String get moreFixes => 'Weitere Fixes';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString Min.';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString Std.';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString T.';
  }

  @override
  String get remoteUpdateTitle => 'Zeit für ein Casama-Update';

  @override
  String get remoteUpdateBody =>
      'Diese Version von Casama wird nicht mehr unterstützt. Aktualisiere sie, um weiterzumachen.';

  @override
  String get remoteUpdateNoLink =>
      'Diese Version von Casama wird nicht mehr unterstützt. Aktualisiere sie dort, wo du sie installiert hast.';

  @override
  String get remoteMaintenanceTitle => 'Casama wird gerade gewartet';

  @override
  String get openLink => 'Öffnen';

  @override
  String get routineIdeas => 'Ideen';

  @override
  String get routineIdeasHelp =>
      'Starte mit einer Idee und ändere dann beliebig viel.';

  @override
  String get pluginDirectory => 'Geprüfte Plugins';

  @override
  String get pluginDirectoryHelp =>
      'Von Casama geprüft und auf die geprüfte Version fixiert.';

  @override
  String get pluginOrPaste => 'Oder füge eines über einen GitHub-Link hinzu';

  @override
  String byAuthor(String name) {
    return 'Von $name';
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
  String get paywallBillingPeriod => 'Abrechnungszeitraum';

  @override
  String get paywallNotSoldTitle => 'Keine Abos auf diesem Server';

  @override
  String get paywallNotSoldBody =>
      'Dieser Server verkauft keine Abos, daher gibt es hier nichts hochzustufen.';

  @override
  String get paywallPlansFailedTitle => 'Abos konnten nicht geladen werden';

  @override
  String get paywallPlansFailedBody =>
      'Prüfe deine Verbindung und versuche es erneut.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Der App Store zeigt keine Abos an',
      'google_play': 'Google Play zeigt keine Abos an',
      'other': 'Der Store zeigt keine Abos an',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Stelle sicher, dass du auf diesem Gerät im App Store angemeldet bist, und versuch es erneut.',
      'google_play': 'Stelle sicher, dass du auf diesem Gerät bei Google Play angemeldet bist, und versuch es erneut.',
      'other': 'Stelle sicher, dass du auf diesem Gerät im Store angemeldet bist, und versuch es erneut.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Bis zu $pct % sparen';
  }

  @override
  String get paywallMostPopular => 'Am beliebtesten';

  @override
  String get paywallTaglinePlus => 'Für dich und eine Handvoll Bots';

  @override
  String get paywallTaglinePro => 'Für eine aktive Crew und ein kleines Team';

  @override
  String get paywallTaglineMax =>
      'Für Teams mit Bots, die den ganzen Tag arbeiten';

  @override
  String get paywallPerMonthShort => '/Mon.';

  @override
  String paywallBilledYearly(String price) {
    return '$price jährlich abgerechnet';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Entspricht $price/Mon.';
  }

  @override
  String get paywallBilledMonthly => 'Monatlich abgerechnet';

  @override
  String get paywallBilledWeekly => 'Wöchentlich abgerechnet';

  @override
  String get paywallPerWeekShort => '/Wo.';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Das sind $price pro Woche';
  }

  @override
  String get paywallBilledYearlyPlain => 'Jährlich abgerechnet';

  @override
  String get paywallPerYearShort => '/Jahr';

  @override
  String paywallStartTrial(int n) {
    return '$n-tägige kostenlose Testphase starten';
  }

  @override
  String paywallGetPlan(String plan) {
    return '$plan kostenpflichtig abonnieren';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Personen',
      one: '1 Person',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString Computerstunden';
  }

  @override
  String get billingChangePlan => 'Abo ändern';

  @override
  String get billingChangePlanBody =>
      'Alle Abos im Vergleich, monatlich oder jährlich.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'Was $plan dir bietet';
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
  String get updatesRowSubtitle => 'Neuigkeiten aus deinem Workspace';

  @override
  String get updatesEmpty => 'Keine Updates';

  @override
  String get updatesEmptyHelp =>
      'Workspace-Hinweise und neue Seiten erscheinen hier. Was deine Bots dir senden, steht in ihren Chats.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Sachen brauchen dich',
      one: '1 Sache braucht dich',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Arbeitet daran: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Nicht jetzt: $title';
  }

  @override
  String openTopic(String title) {
    return '$title öffnen';
  }

  @override
  String get newTopic => 'Neues Thema';

  @override
  String get topics => 'Themen';

  @override
  String get olderTopics => 'Älter';

  @override
  String get generalChat => 'Allgemein';

  @override
  String get allTopics => 'Alle Themen';

  @override
  String get cardSecrets => 'Geheimnisse';

  @override
  String get cardApproval => 'Freigabe';

  @override
  String get cardTakeover => 'Übernehmen';

  @override
  String get cardDevice => 'Gerätezugriff';

  @override
  String get cardSuggestion => 'Vorschlag';

  @override
  String get formBack => 'Zurück';

  @override
  String get formNext => 'Weiter';

  @override
  String get formSkip => 'Überspringen';

  @override
  String formStep(int n, int total) {
    return 'Frage $n von $total';
  }

  @override
  String get cardSuggestions => 'Vorschläge';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Dinge gefunden, die einen Blick wert sind',
      one: '1 Sache gefunden, die einen Blick wert ist',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Gestartet $when';
  }

  @override
  String get suggestionStartedPlain => 'Gestartet';

  @override
  String get suggestionPutAway => 'Beiseitelegen';

  @override
  String get suggestionExpired => 'Abgelaufen';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Abgelaufen: $title';
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
      other: 'Läuft in $nString Minuten ab',
      one: 'Läuft in 1 Minute ab',
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
      other: 'Läuft in $nString Stunden ab',
      one: 'Läuft in 1 Stunde ab',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Vorschläge bearbeitet',
      one: '1 Vorschlag bearbeitet',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Diesen Server auf deinem Telefon nutzen';

  @override
  String get linkIntro =>
      'Gib diesem Server eine Adresse, die dein Telefon von überall erreicht. Keine Domain und keine Router-Einstellungen.';

  @override
  String get linkIntroDetails =>
      'Verbindet diesen Server mit einem kostenlosen Casama Cloud-Konto. Der Datenverkehr deines Telefons läuft über Cloudflare direkt zu diesem Computer, niemals über Casamas Server.';

  @override
  String get linkTurnOn => 'Auf deinem Telefon nutzen';

  @override
  String get linkSignupsNote =>
      'Neue Registrierungen sind geschlossen, solange dies aktiv ist. Nur Personen mit bestehendem Konto können sich anmelden.';

  @override
  String get linkStepSignIn => 'Diesen Server verknüpfen';

  @override
  String get linkSignInBody =>
      'Gib diesen Code auf der Seite frei, die sich gerade in deinem Browser geöffnet hat. Prüfe, ob die Seite denselben Code zeigt.';

  @override
  String get linkSignInOpen => 'Seite erneut öffnen';

  @override
  String get linkStepAddress => 'Adresse erhalten';

  @override
  String get linkStepRestart => 'Server neu starten';

  @override
  String get linkStepConnect => 'Verbinden';

  @override
  String get linkStateOnline => 'Online';

  @override
  String get linkStateStarting => 'Startet';

  @override
  String get linkStateOffline => 'Offline';

  @override
  String get linkStateAttention => 'Erfordert Aufmerksamkeit';

  @override
  String get linkStateOff => 'Aus';

  @override
  String get linkAddress => 'Adresse';

  @override
  String get linkLocalAddress => 'Auf diesem Computer';

  @override
  String get linkShowCode => 'Anmeldecode zeigen';

  @override
  String get linkCheck => 'Erneut prüfen';

  @override
  String get linkTurnOff => 'Ausschalten';

  @override
  String get linkTurnOffConfirm =>
      'Fernzugriff ausschalten? Die Adresse funktioniert nicht mehr und Telefone verlieren diesen Server, bis du ihn wieder einschaltest. Er erhält dieselbe Adresse zurück.';

  @override
  String get linkTurningOff => 'Wird ausgeschaltet';

  @override
  String get linkNeedsOwner =>
      'Nur der Inhaber dieses Servers kann dies einschalten.';

  @override
  String get linkTwoStepTip =>
      'Dieser Server ist jetzt aus dem Internet erreichbar. Durch Anmeldung in zwei Schritten reicht ein erratenes Passwort nicht aus.';

  @override
  String get linkProblemNotLinked =>
      'Dieser Server ist nicht mit Casama Cloud verknüpft. Schalte ihn wieder ein, um ihn zu verknüpfen.';

  @override
  String get linkProblemCloudUnreachable =>
      'Casama Cloud ist gerade nicht erreichbar. Wenn die Adresse funktioniert hat, tut sie es weiterhin.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud akzeptiert den Schlüssel dieses Servers nicht mehr. Schalte ihn wieder ein, um ihn zu verknüpfen.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud hat den Fernzugriff für diesen Server deaktiviert.';

  @override
  String get linkProblemRemoved =>
      'Dieser Server wurde aus seinem Workspace in Casama Cloud entfernt. Schalte ihn wieder ein, um ihn zu verknüpfen.';

  @override
  String get linkProblemPlanLimit =>
      'Dein Casama Cloud-Abo verbindet weniger Server. Entferne dort einen oder mache ein Upgrade.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud hat keine Adresse mehr für diesen Server. Schalte ihn wieder ein.';

  @override
  String get linkProblemAddressChanged =>
      'Die Adresse dieses Servers hat sich geändert. Schalte ihn wieder ein, um die neue zu nutzen.';

  @override
  String get connectProblemConnectorMissing =>
      'Der Connector läuft nicht. Prüfe, ob Docker läuft, und prüfe dann erneut.';

  @override
  String get connectProblemConnectorBlocked =>
      'Dieses Netzwerk blockiert die Verbindung. Meist liegt es an einem VPN oder einer strengen Firewall (ausgehender Port 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Alles ist verbunden, aber die Adresse antwortet noch nicht. Eine neue Adresse kann eine Minute dauern.';

  @override
  String get linkServers => 'Verknüpfte Server';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Dein Abo verbindet $limit Server.',
      one: 'Dein Abo verbindet 1 Server.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Noch keine Server verknüpft. Öffne auf deinem eigenen Server Einstellungen und dann Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return '$name entfernen? Seine Adresse funktioniert nicht mehr. Der Server kann später erneut verknüpft werden.';
  }

  @override
  String get linkStatusActive => 'Hat eine Adresse';

  @override
  String get linkStatusParked => 'Länger nicht gesehen';

  @override
  String get linkStatusSuspended => 'Gesperrt';

  @override
  String get pairDevice => 'Auf anderem Gerät anmelden';

  @override
  String get pairDeviceRow => 'Code zeigen, den dein Telefon scannt';

  @override
  String get pairDeviceHelp =>
      'Scanne dies mit der Kamera deines Telefons. Oder in Casama auf dem Telefon: Anmelden, dann Code scannen.';

  @override
  String get pairDeviceWarning =>
      'Jeder, der ihn scannt, wird als du angemeldet. Er gilt einmalig für ein paar Minuten.';

  @override
  String pairDeviceServer(String host) {
    return 'Meldet bei $host an';
  }

  @override
  String get pairDeviceNewCode => 'Neuer Code';

  @override
  String get pairDeviceExpired => 'Dieser Code ist abgelaufen.';

  @override
  String get pairDeviceNotReachable =>
      'Dieser Server antwortet nur auf diesem Computer, daher kann ein Telefon ihn noch nicht erreichen.';

  @override
  String get pairDeviceNotReachableOther =>
      'Die Adresse dieses Servers funktioniert nur im eigenen Netzwerk. Bitte die Person, die ihn betreibt, um eine von außen erreichbare Adresse.';

  @override
  String get pairDeviceCopyLink => 'Link kopieren';

  @override
  String get pairDeviceLinkCopied =>
      'Link kopiert. Füge ihn in Casama für Chrome oder auf einem anderen Gerät ein.';

  @override
  String get pairDeviceConnectChrome => 'Chrome verbinden';

  @override
  String get pairDeviceChromeDone => 'Casama für Chrome ist angemeldet.';

  @override
  String get pairDeviceChromeFinish =>
      'Schließe es im geöffneten Tab von Casama für Chrome ab.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama für Chrome ist in diesem Browser nicht installiert.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama für Chrome konnte sich nicht anmelden. $error';
  }

  @override
  String get scanToSignIn => 'Code von deinem Computer scannen';

  @override
  String get scanToSignInTitle => 'Code scannen';

  @override
  String get scanToSignInHelp =>
      'Öffne auf einem Computer, auf dem du angemeldet bist, Einstellungen und dann Auf anderem Gerät anmelden.';

  @override
  String pairSignInTo(String host) {
    return 'Bei $host anmelden?';
  }

  @override
  String get pairSignInBody =>
      'Der Code meldet dieses Gerät bei dem Konto an, das ihn angezeigt hat.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Dieses Gerät nutzt jetzt $current. Mit der Anmeldung bei $host wird umgestellt.';
  }

  @override
  String get pairSigningIn => 'Wird angemeldet';

  @override
  String get pairCodeInvalid =>
      'Dieser Code ist nicht mehr gültig. Zeige einen neuen und scanne erneut.';

  @override
  String get pairLinkInvalid => 'Dies ist kein Casama-Anmeldecode.';

  @override
  String get linkServerTitle => 'Server verknüpfen';

  @override
  String linkServerBody(String name) {
    return '$name möchte sich mit deinem Casama Cloud-Konto verbinden.';
  }

  @override
  String get linkServerCode => 'Code auf dem Server';

  @override
  String get linkServerCheck =>
      'Verknüpfe ihn nur, wenn du das auf deinem eigenen Server gestartet hast und derselbe Code angezeigt wird.';

  @override
  String get linkServerWhat =>
      'Er erhält eine öffentliche Adresse und kann dir Benachrichtigungen senden. Er kann keine Credits ausgeben.';

  @override
  String get linkServerApprove => 'Verknüpfen';

  @override
  String get linkServerDone => 'Verknüpft';

  @override
  String linkServerDoneBody(String name) {
    return 'Gehe zurück zu $name. Dort läuft es von selbst weiter.';
  }

  @override
  String get linkServerInvalid =>
      'Dieser Code ist nicht mehr gültig. Starte erneut auf deinem Server.';

  @override
  String get linkServerEnterCode => 'Der Code, den dein Server zeigt';

  @override
  String get linkServerFind => 'Suchen';

  @override
  String get linkServerNeedAdmin =>
      'Nur Inhaber und Admins eines Workspace können einen Server verknüpfen.';

  @override
  String get localDockerStopped =>
      'Docker läuft nicht, daher ist dein Server gestoppt';

  @override
  String get localDockerStoppedBody =>
      'Dein Casama-Server läuft in Docker auf diesem Computer. Öffne Docker, und Casama verbindet sich von selbst wieder, sobald der Server zurück ist – das kann eine Minute dauern.';

  @override
  String get serverOfflineTitle => 'Dein Server ist offline';

  @override
  String get serverOfflineBody =>
      'Ist der Computer, auf dem er läuft, eingeschaltet und wach? Dies verbindet sich von selbst wieder.';

  @override
  String get signUpsClosed =>
      'Dieser Server nimmt keine neuen Konten an. Melde dich mit einem Konto an, das du hier bereits hast.';

  @override
  String get signUpsByInvitation =>
      'Neue Konten sind hier nur auf Einladung möglich. Nutze die E-Mail-Adresse, mit der du eingeladen wurdest.';

  @override
  String get linkPrivateNotifications => 'Private Benachrichtigungen';

  @override
  String get linkPrivateNotificationsHelp =>
      'Benachrichtigungen erreichen dein Telefon über Casama Cloud. Ist dies an, enthalten sie keinen Text und sagen nur „Neue Aktivität“; die App lädt den Rest von diesem Server.';

  @override
  String get linkInvites => 'Eingeladenen Personen die Registrierung erlauben';

  @override
  String get linkInvitesHelp =>
      'Aus: Niemand kann ein neues Konto erstellen. Ein: Personen, die du per E-Mail einlädst, schon. Eine Änderung startet den Server neu.';

  @override
  String get linkKeepAwake =>
      'Diesen Mac wach halten, solange er am Strom hängt';

  @override
  String get linkKeepAwakeHelp =>
      'Telefone können diesen Server nur erreichen, solange dieser Computer wach und Casama geöffnet ist.';

  @override
  String get linkLiveView => 'Live-Ansicht von unterwegs';

  @override
  String get linkLiveViewIncluded =>
      'In deinem Abo enthalten. Unterwegs läuft der Bildschirm eines Bots live über das Relay von Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Ab Plus auf Casama Cloud enthalten. Unterwegs siehst du den Bildschirm eines Bots etwa jede Sekunde. Auf diesem Computer ist er immer live.';

  @override
  String get liveAwayNeedsPlan =>
      'Abseits vom Computer des Servers ist Live-Video ab Plus auf Casama Cloud verfügbar. Bis dahin aktualisiert sich der Bildschirm etwa jede Sekunde.';

  @override
  String get chatShareExport => 'Teilen oder exportieren';

  @override
  String get chatShareExportHelp =>
      'Diesen Chat als Datei speichern oder einen schreibgeschützten Link erstellen.';

  @override
  String get chatExportMarkdown => 'Als Markdown exportieren';

  @override
  String get chatExportMarkdownHelp => 'Eine Textdatei, die jeder lesen kann';

  @override
  String get chatExportJson => 'Als JSON exportieren';

  @override
  String get chatExportJsonHelp => 'Für andere Apps und Skripte';

  @override
  String get chatShareLink => 'Schreibgeschützten Link teilen';

  @override
  String get chatShareLinkHelp => 'Jeder mit dem Link kann diesen Chat lesen';

  @override
  String get chatStopSharing => 'Teilen des Links beenden';

  @override
  String get chatStopSharingHelp => 'Der Link funktioniert nicht mehr';

  @override
  String get chatMakePublicTitle => 'Diesen Chat per Link teilen?';

  @override
  String get chatMakePublicBody =>
      'Jeder mit dem Link kann diesen Chat lesen, wie du ihn siehst. Angehängte Dateien werden namentlich aufgelistet, nicht geteilt. Du kannst das jederzeit beenden.';

  @override
  String get chatMakePublic => 'Link erstellen';

  @override
  String get chatLinkTitle => 'Schreibgeschützter Link';

  @override
  String get chatLinkBody =>
      'Kopiert. Er wird nicht in Suchmaschinen gelistet. Ein neuer Link beendet diesen.';

  @override
  String get chatSharingStopped => 'Der Link funktioniert nicht mehr';

  @override
  String get creationDuplicate => 'Duplizieren';

  @override
  String creationDuplicated(String title) {
    return 'Kopie erstellt: „$title“';
  }

  @override
  String get slackInstall => 'Zu Slack hinzufügen';

  @override
  String slackInstallHelp(String bot) {
    return 'Verbinde einen Slack-Workspace in einem Schritt. $bot antwortet dort auf @Erwähnungen und Direktnachrichten.';
  }

  @override
  String get slackInstallFinish =>
      'In Slack abschließen und dann hierher zurückkehren.';

  @override
  String get helpAndSupport => 'Hilfe & Support';

  @override
  String get helpAndSupportRow =>
      'Casama-Hilfe fragen, uns schreiben, Anleitungen';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Sofortige Antworten aus unseren Anleitungen und deinem Konto. Ein Mensch ist nur einen Fingertipp entfernt.';

  @override
  String get supportIntro =>
      'Fragen, ein Problem mit einem Kauf oder etwas funktioniert nicht? Schreib uns.';

  @override
  String supportSelfHosted(String host) {
    return 'Dein Workspace läuft auf $host. Bei Anmeldung, Konten und Abos frag bitte die Person, die diesen Server betreibt. Bei der App selbst helfen wir gern.';
  }

  @override
  String get supportTalkToPerson => 'Mit jemandem sprechen';

  @override
  String get contactSupport => 'Support kontaktieren';

  @override
  String contactSupportRow(String email) {
    return 'Schreib unserem Team an $email';
  }

  @override
  String get sendFeedback => 'Feedback senden';

  @override
  String get sendFeedbackRow => 'Ideen, Lob und Kritik. Wir lesen alles.';

  @override
  String get feedbackHelp =>
      'Sag uns, was Casama können soll, was du liebst oder was dich gestört hat.';

  @override
  String get feedbackKindPrompt => 'Welche Art von Feedback?';

  @override
  String get feedbackKindIdea => 'Idee';

  @override
  String get feedbackKindLike => 'Gefällt mir';

  @override
  String get feedbackKindDislike => 'Gefällt mir nicht';

  @override
  String get feedbackKindConfusing => 'Verwirrend';

  @override
  String get feedbackMessageLabel => 'Dein Feedback';

  @override
  String get feedbackMessageHint =>
      'Zum Beispiel: Ich würde gern einen Chat oben anheften können.';

  @override
  String get feedbackContactOk => 'Casama darf mich dazu kontaktieren';

  @override
  String get feedbackContactOkHelp =>
      'Vielleicht senden wir dir eine Rückfrage per E-Mail oder sagen Bescheid, wenn es fertig ist.';

  @override
  String get feedbackNote =>
      'Deine App-Version und dein Abo werden mitgesendet. Problem mit deinem Konto oder einem Kauf? Nutze stattdessen Support kontaktieren.';

  @override
  String get feedbackThanks => 'Danke! Wir lesen alles.';

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
  String get supportIdeasBoard => 'Ideen-Board';

  @override
  String get supportIdeasBoardHelp =>
      'Sieh, was andere sich gewünscht haben, und stimme für deine Favoriten ab';

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
      'Erzähl uns, was los ist. Wir antworten per E-Mail.';

  @override
  String get contactSupportHelpMail =>
      'Erzähl uns, was los ist. Öffnet deine E-Mail-App mit den ausgefüllten Details.';

  @override
  String get supportSend => 'Senden';

  @override
  String get supportWriteEmail => 'E-Mail öffnen';

  @override
  String get supportTopicPrompt => 'Worum geht es?';

  @override
  String get supportTopicBilling => 'Abrechnung & Käufe';

  @override
  String get supportTopicBroken => 'Etwas funktioniert nicht';

  @override
  String get supportTopicAccount => 'Konto & Anmeldung';

  @override
  String get supportTopicQuestion => 'Eine Frage oder Idee';

  @override
  String get supportTopicOther => 'Etwas anderes';

  @override
  String get supportMessageLabel => 'Deine Nachricht';

  @override
  String get supportMessageHint => 'Was ist passiert und was hast du erwartet?';

  @override
  String get supportMessageMore =>
      'Füge ein, zwei Sätze hinzu: was du getan hast und was schiefgelaufen ist.';

  @override
  String get supportIncludeChat =>
      'Meine Unterhaltung mit der Casama-Hilfe einbeziehen';

  @override
  String get supportIncludeChatHelp =>
      'Damit du es nicht zweimal erklären musst.';

  @override
  String get supportDetailsNote =>
      'Wir fügen deine App-Version sowie deine Workspace- und Konto-ID hinzu, um dein Konto zu finden. Niemals deine Chats.';

  @override
  String get supportSentTitle => 'Nachricht gesendet';

  @override
  String supportSentBody(String email, String reference) {
    return 'Wir antworten an $email. Deine Referenz ist $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'Keine E-Mail-App gefunden, daher haben wir deine Nachricht kopiert. Füge sie in eine E-Mail an $email ein.';
  }

  @override
  String get supportGuides => 'Anleitungen und FAQ';

  @override
  String get supportGuidesHelp =>
      'Schritt-für-Schritt-Hilfe für alles in Casama';

  @override
  String get introVideoTitle => 'Sieh, wie Casama funktioniert';

  @override
  String get introVideoSubtitle => 'Ein 1½-minütiger Film';

  @override
  String get supportIntroVideo => 'Einführungsfilm ansehen';

  @override
  String get introVideoFailed =>
      'Film konnte nicht abgespielt werden. Prüfe deine Verbindung und versuch es erneut.';

  @override
  String get introVideoOnYoutube => 'Auf YouTube ansehen';

  @override
  String get introVideoReplay => 'Erneut abspielen';

  @override
  String get supportIntroVideoHelp => 'Sieh in 1½ Minuten, was Casama kann';

  @override
  String get supportRate => 'Casama bewerten';

  @override
  String get supportRateHelp =>
      'Sag anderen auf der Store-Seite, was du denkst';

  @override
  String get supportIds => 'Support-IDs';

  @override
  String get supportIdsHelp =>
      'Der Support fragt möglicherweise danach. Sie finden dein Konto und deine Käufe, geben aber niemandem Zugriff.';

  @override
  String supportWorkspaceId(String name) {
    return 'Workspace-ID · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Auch deine Kauf-ID im App Store und bei Google Play';

  @override
  String get supportAccountId => 'Konto-ID';

  @override
  String get supportCopyAll => 'Alle Details kopieren';

  @override
  String get supportCopyAllHelp =>
      'App-Version, Plattform und IDs zum Einfügen in eine Nachricht';

  @override
  String get supportNewChat => 'Neue Unterhaltung';

  @override
  String get supportAskHint => 'Frag irgendetwas über Casama';

  @override
  String get supportAiNote =>
      'Casama-Hilfe nutzt KI und kann Fehler machen. Sie sieht dein Abo und Bot-Fehler, nicht deine Chats.';

  @override
  String get supportGreeting =>
      'Hallo! Ich bin die Casama-Hilfe. Frag mich zu Casama, deinem Abo oder einem Problem. Wenn ich es nicht lösen kann, leite ich es an unser Support-Team weiter.';

  @override
  String get supportStarterPurchase => 'Mein Kauf hat nicht geklappt';

  @override
  String get supportStarterCancel => 'Wie kündige ich mein Abo?';

  @override
  String get supportStarterBot => 'Mein Bot antwortet nicht';

  @override
  String get supportStarterHowTo => 'Was können meine Bots tun?';

  @override
  String get supportAskPerson => 'Einen Menschen fragen';

  @override
  String get supportHandoffTitle => 'An unser Support-Team senden?';

  @override
  String get supportHandoffButton => 'Prüfen und senden';

  @override
  String get supportThinking => 'Wird geprüft…';

  @override
  String get supportAssistantError =>
      'Casama-Hilfe konnte nicht antworten. Versuche es erneut oder frage eine Person.';

  @override
  String get supportAssistantLimit =>
      'Casama-Hilfe kann gerade keine weiteren Antworten geben. Eine Person kann helfen.';

  @override
  String get purchaseHelp => 'Problem mit einem Kauf? Hilfe erhalten';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Melden';

  @override
  String get reportAndBlock => 'Melden und blockieren';

  @override
  String get reportReply => 'Antwort melden';

  @override
  String get reportBot => 'Bot melden';

  @override
  String get reportBotRow =>
      'Etwas an Name, Beschreibung oder Antworten stimmt nicht';

  @override
  String get reportPerson => 'Person melden';

  @override
  String get reportGalleryItem => 'Galerie-Eintrag melden';

  @override
  String get reportGalleryRequest => 'Anfrage melden';

  @override
  String get reportWorkspace => 'Workspace melden';

  @override
  String get reportHelp =>
      'Sag den Betreibern dieses Servers, was nicht stimmt. Sie prüfen jede Meldung.';

  @override
  String get reportPersonHelp =>
      'Sag den Betreibern dieses Servers, was passiert ist. Wir blockieren diese Person außerdem für dich.';

  @override
  String get reportNote => 'Noch etwas, das sie wissen sollten (optional)';

  @override
  String reportAlsoBlock(String name) {
    return '$name ebenfalls blockieren';
  }

  @override
  String get reportSent => 'Danke. Deine Meldung wurde zur Prüfung gesendet.';

  @override
  String get reportReasonSpam => 'Spam oder Betrug';

  @override
  String get reportReasonSexual => 'Sexuelle Inhalte';

  @override
  String get reportReasonViolence => 'Gewalt oder Drohungen';

  @override
  String get reportReasonHarassment => 'Belästigung oder Hass';

  @override
  String get reportReasonIllegal => 'Illegal oder gefährlich';

  @override
  String get reportReasonImpersonation => 'Gibt sich als jemand anderes aus';

  @override
  String get reportReasonOther => 'Etwas anderes';

  @override
  String get thisPerson => 'diese Person';

  @override
  String blockPerson(String name) {
    return '$name blockieren';
  }

  @override
  String blocked(String name) {
    return '$name ist blockiert';
  }

  @override
  String get blockHelp =>
      'Blockierte Personen können dich nicht in einen Workspace einladen, und du hörst nichts von ihnen.';

  @override
  String get blockedPeople => 'Blockierte Personen';

  @override
  String get blockedPeopleRow =>
      'Personen, die dich nicht einladen oder erreichen können';

  @override
  String get noBlockedPeople => 'Niemand ist blockiert';

  @override
  String get unblock => 'Blockierung aufheben';

  @override
  String get emailTips => 'Tipps und Neuigkeiten per E-Mail';

  @override
  String get emailTipsHelp =>
      'Einstiegstipps und gelegentliche Updates. E-Mails zu deinem Abo und Konto kommen immer.';

  @override
  String get reportsInApp => 'In der App gemeldet';

  @override
  String get reportsNone =>
      'Keine offenen Meldungen. Meldungen aus der App erscheinen hier.';

  @override
  String get reportsPublicLinks => 'Gemeldete öffentliche Links';

  @override
  String get reportsNoLinks => 'Es wurden keine öffentlichen Links gemeldet.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Meldungen',
      one: '1 Meldung',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Vom Netz nehmen';

  @override
  String get reportsRestore => 'Wiederherstellen';

  @override
  String get reportKindReply => 'Bot-Antwort';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Person';

  @override
  String get reportKindGallery => 'Galerie-Eintrag';

  @override
  String get reportKindWorkspace => 'Workspace';

  @override
  String get reportMarkActioned => 'Erledigt';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Workspace $name sperren';
  }

  @override
  String get reportDismiss => 'Verwerfen: alles in Ordnung';

  @override
  String get supportWebTitle => 'Website-Casama-Hilfe';

  @override
  String get supportWebOn => 'Ein';

  @override
  String get supportWebOff => 'Aus';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count IP-Adressen pausiert',
      one: '1 IP-Adresse pausiert',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return '$count unbeantwortete Fragen anzeigen';
  }

  @override
  String get ticketsOpen => 'Offen';

  @override
  String get ticketsClosed => 'Geschlossen';

  @override
  String get ticketsAll => 'Alle';

  @override
  String get ticketsNone => 'Hier gibt es keine Nachrichten.';

  @override
  String get ticketClose => 'Schließen';

  @override
  String get ticketReopen => 'Wieder öffnen';

  @override
  String get serviceStatus => 'Status';

  @override
  String get supportStatus => 'Status von Casama Cloud';

  @override
  String get supportStatusHelp => 'Prüfen, ob gerade etwas ausgefallen ist';

  @override
  String get galleryChatSuggestionLabel => 'Aus der Galerie';

  @override
  String get galleryChatAdd => 'Hinzufügen';

  @override
  String galleryChatAdded(String name) {
    return '$name hinzugefügt';
  }

  @override
  String galleryChatReads(String things) {
    return 'Liest: $things';
  }

  @override
  String get galleryChatRunsCode => 'Führt Code aus';

  @override
  String get galleryChatComputer => 'Nutzt einen Computer';

  @override
  String galleryChatNeeds(String apps) {
    return 'Benötigt: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Skill-Entwurf';

  @override
  String get galleryChatShowInstructions => 'Anweisungen anzeigen';

  @override
  String get galleryChatHideInstructions => 'Anweisungen ausblenden';

  @override
  String get galleryChatSaveSkill => 'In meinen Skills speichern';

  @override
  String get galleryChatSaved => 'Gespeichert';

  @override
  String get galleryChatSavedSkill => 'In deinen Skills gespeichert';

  @override
  String get galleryChatSubmit => 'Bei der Galerie einreichen';

  @override
  String galleryChatSubmitTitle(String name) {
    return '$name bei der Galerie einreichen?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Ein Betreuer prüft es zuerst. Sobald es aufgenommen ist, kann jede Person es finden und nutzen. Dein Anzeigename steht als Autor dabei, niemals deine E-Mail-Adresse.';

  @override
  String get galleryChatSent => 'Gesendet';

  @override
  String get galleryChatSubmitted => 'Zur Prüfung an die Galerie gesendet';

  @override
  String get galleryChatSubmissionsOff =>
      'Dieser Server nimmt keine Einreichungen für die Galerie entgegen.';

  @override
  String get galleryPicksTitle => 'Empfehlungen für dich';

  @override
  String get galleryPicksHelp =>
      'Starte mit einem passenden Set aus Skills, Apps und Routinen. Du kannst später alles ändern.';

  @override
  String get galleryPicksAdd => 'Dieses Set hinzufügen';

  @override
  String get galleryPicksSkip => 'Vorerst überspringen';

  @override
  String galleryPicksAddNamed(String name) {
    return '$name hinzufügen';
  }

  @override
  String get galleryPicksBestMatch => 'Beste Übereinstimmung';

  @override
  String get galleryPicksInside => 'Was drin ist';

  @override
  String galleryPicksBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bots',
      one: '1 Bot',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Skills',
      one: '1 Skill',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Routinen',
      one: '1 Routine',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps',
      one: '1 App',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Plugins',
      one: '1 Plugin',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Looks',
      one: '1 Look',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$name hinzugefügt';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$name hinzugefügt. Verbinde $apps unter Apps, um abzuschließen.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Ein Admin schaut sich $name an, bevor es hinzugefügt wird.';
  }

  @override
  String get galleryPolicyTitle => 'Galerie';

  @override
  String get galleryPolicyRow =>
      'Was Personen hier aus der Galerie hinzufügen können';

  @override
  String get galleryPolicyMode => 'Wer hinzufügen darf';

  @override
  String get galleryPolicyOpen => 'Offen';

  @override
  String get galleryPolicyOpenHelp =>
      'Alle hier können alles hinzufügen, was nicht blockiert ist.';

  @override
  String get galleryPolicyApproval => 'Vorher fragen';

  @override
  String get galleryPolicyApprovalHelp =>
      'Beim Hinzufügen wird bei deiner Auswahl unten zuerst ein Admin gefragt.';

  @override
  String get galleryPolicyAllowlist => 'Nur Erlaubtes';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Es kann nur hinzugefügt werden, was auf der Erlaubt-Liste steht.';

  @override
  String get galleryPolicyApprovalFor => 'Vorher fragen für';

  @override
  String get galleryPolicyRunsCode => 'Elemente, die Code ausführen';

  @override
  String get galleryPolicyApps => 'Elemente, die Apps verbinden';

  @override
  String get galleryPolicyAll => 'Alles';

  @override
  String get galleryPolicyAllowed => 'Erlaubt';

  @override
  String get galleryPolicyAllowedHelp =>
      'Ohne Rückfrage hinzugefügt. Bei „Nur Erlaubtes“ ist das alles, was hinzugefügt werden darf.';

  @override
  String get galleryPolicyBlocked => 'Blockiert';

  @override
  String get galleryPolicyBlockedHelp => 'Niemand hier kann diese hinzufügen.';

  @override
  String get galleryPolicyAddItem => 'Aus der Galerie hinzufügen';

  @override
  String get galleryPolicyNone => 'Noch nichts';

  @override
  String get galleryPolicySearch => 'Galerie durchsuchen';

  @override
  String get galleryPolicyNoResults => 'Nichts in der Galerie passt dazu.';

  @override
  String get galleryPolicySaved => 'Galerie-Regeln gespeichert';

  @override
  String galleryPolicyRemove(String name) {
    return '$name entfernen';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Nur Admins und Inhaber können dies ändern.';

  @override
  String get galleryPolicyWaiting => 'Warten auf Freigabe';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name hat angefragt';
  }

  @override
  String get galleryPolicyApprove => 'Freigeben';

  @override
  String get galleryPolicyDecline => 'Ablehnen';

  @override
  String galleryPolicyApproved(String name) {
    return '$name freigegeben und hinzugefügt';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name abgelehnt';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Freigegeben, aber $name konnte nicht hinzugefügt werden. $error';
  }

  @override
  String get galleryDigestEmails => 'Monatliche Galerie-Empfehlungen';

  @override
  String get galleryDigestHelp =>
      'Einmal im Monat bis zu sechs neue Skills, Apps und Routinen, die zu deiner Nutzung passen.';

  @override
  String get newsletterTitle => 'Monatliche E-Mail von Casama';

  @override
  String get newsletterHelp =>
      'Was neu ist und was als Nächstes kommt – höchstens einmal im Monat.';

  @override
  String get newsletterSignUp =>
      'Ich möchte die monatliche E-Mail von Casama erhalten: was neu ist und was als Nächstes kommt, höchstens einmal im Monat.';

  @override
  String get newsletterCardTitle => 'Monatliche E-Mail von Casama erhalten?';

  @override
  String get newsletterCardBody =>
      'Was neu ist und was als Nächstes kommt – höchstens einmal im Monat. Jederzeit abbestellbar.';

  @override
  String get newsletterCardYes => 'Ja, bitte senden';

  @override
  String get newsletterCardNo => 'Nein, danke';

  @override
  String get newsletterCardDone =>
      'Du stehst auf der Liste. Jederzeit in den Einstellungen ausschaltbar.';

  @override
  String get galleryKindApp => 'App';

  @override
  String get galleryKindApps => 'Apps';

  @override
  String get galleryKindBot => 'Starter-Bot';

  @override
  String get galleryKindBots => 'Starter-Bots';

  @override
  String get galleryKindRoutine => 'Routine';

  @override
  String get galleryKindRoutines => 'Routinen';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugins';

  @override
  String get galleryKindSet => 'Starter-Set';

  @override
  String get galleryKindSets => 'Starter-Sets';

  @override
  String get galleryTabBrowse => 'Stöbern';

  @override
  String get galleryTabInstalled => 'Installiert';

  @override
  String get gallerySearchEverything => 'Alles durchsuchen';

  @override
  String get galleryNewBadge => 'Neu';

  @override
  String get galleryRowPicks => 'Empfehlungen';

  @override
  String get galleryRowNew => 'Neu';

  @override
  String get galleryRowTrending => 'Beliebt diese Woche';

  @override
  String get galleryRowMostUsed => 'Meistgenutzt';

  @override
  String get galleryRowWorksWith => 'Passt zu dem, was du schon hast';

  @override
  String get galleryRowSets => 'Starter-Sets';

  @override
  String get galleryRowSeasonal => 'Passend zur Saison';

  @override
  String get galleryFilterFree => 'Kostenlos';

  @override
  String get galleryFilterPlan => 'Nutzt Credits';

  @override
  String get galleryFilterSelfHosted => 'Funktioniert selbst gehostet';

  @override
  String get galleryFilterComputer => 'Braucht einen Computer';

  @override
  String get galleryNoFilterMatches => 'Nichts passt zu diesen Filtern';

  @override
  String get galleryClearFilters => 'Filter zurücksetzen';

  @override
  String get galleryRequestThis => 'Anfragen';

  @override
  String get galleryAskCasama => 'Casama bitten, das zu bauen';

  @override
  String galleryAskPrompt(String query) {
    return 'Erstelle mir etwas dafür: $query';
  }

  @override
  String get galleryAccessTitle => 'Worauf es zugreifen kann';

  @override
  String galleryAccessReads(String things) {
    return 'Liest: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Führt Code aus';

  @override
  String get galleryAccessComputer => 'Nutzt einen Computer';

  @override
  String get galleryAccessNothing => 'Liest und ändert nichts von dir';

  @override
  String get galleryCreditsNone => 'Verbraucht keine Credits';

  @override
  String get galleryCreditsLow => 'Verbraucht wenige Credits';

  @override
  String get galleryCreditsMedium => 'Verbraucht einige Credits';

  @override
  String get galleryCreditsHigh => 'Verbraucht viele Credits';

  @override
  String get galleryTryIt => 'Ausprobieren';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Von $shown Personen genutzt',
      one: 'Von 1 Person genutzt',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent % der Durchläufe erfolgreich';
  }

  @override
  String get galleryAbout => 'Über';

  @override
  String get galleryMadeByCasama => 'Von Casama erstellt';

  @override
  String get galleryMadeByCommunity => 'Aus der Community';

  @override
  String get galleryMadeReviewed => 'Geprüft';

  @override
  String get galleryReviewedHelp => 'Tests für diese Version bestanden';

  @override
  String galleryMoreFrom(String name) {
    return 'Mehr von $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Version $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Aktualisiert am $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Remix von $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'Was sich in $name geändert hat';
  }

  @override
  String get galleryBreaking => 'Funktioniert anders';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge in der Galerie',
      one: '1 Eintrag in der Galerie',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty =>
      'Noch nichts von diesem Autor in der Galerie.';

  @override
  String get galleryInstalledWorkspace => 'In diesem Workspace';

  @override
  String get galleryInstalledDevice => 'Looks auf diesem Gerät';

  @override
  String get galleryInstalledEmptyTitle => 'Noch nichts hinzugefügt';

  @override
  String get galleryInstalledEmpty =>
      'Skills, Apps, Routinen und Looks, die du aus der Galerie hinzufügst, erscheinen hier samt Updates.';

  @override
  String get galleryInstalledError =>
      'Installierte Elemente konnten nicht geladen werden.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Updates',
      one: '1 Update',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Aktualisieren';

  @override
  String galleryUpdated(String name) {
    return '$name aktualisiert';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Version $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return '$name aktualisieren?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'Die neue Version kann mehr als deine aktuelle:';

  @override
  String get galleryUpdateBreakingHelp =>
      'Die neue Version funktioniert anders, prüfe sie also nach dem Update.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Liest jetzt: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Kann jetzt: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Führt jetzt Code aus';

  @override
  String get galleryUpdateNowComputer => 'Nutzt jetzt einen Computer';

  @override
  String get galleryRemove => 'Entfernen';

  @override
  String galleryRemoveTitle(String name) {
    return '$name entfernen?';
  }

  @override
  String get galleryRemoveHelp =>
      'Es wird aus diesem Workspace entfernt. Du kannst es wieder aus der Galerie hinzufügen.';

  @override
  String galleryRemoved(String name) {
    return '$name entfernt';
  }

  @override
  String get galleryRetired => 'Nicht mehr in der Galerie';

  @override
  String get galleryRetiredReplaced =>
      'Nicht mehr in der Galerie; es gibt einen Ersatz';

  @override
  String get gallerySeeReplacement => 'Ersatz ansehen';

  @override
  String get galleryForgetLook => 'Aus dieser Liste entfernen';

  @override
  String galleryWizardTitle(String name) {
    return '$name hinzufügen';
  }

  @override
  String get galleryWizardAdd => 'Hinzufügen';

  @override
  String get galleryWizardRequired => 'Bitte ausfüllen';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enthält $count Einträge',
      one: 'Enthält 1 Eintrag',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Was benötigt wird';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Skills, für dich hinzugefügt',
      one: '1 Skill, für dich hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Zu verbindende Apps: $apps';
  }

  @override
  String get galleryWizardBot => 'Zu welchem Bot hinzufügen';

  @override
  String get galleryWizardPickBot => 'Bot auswählen';

  @override
  String get galleryWizardSetBotHelp =>
      'Wohin die Routinen des Sets kommen. Ohne Bot werden sie weggelassen.';

  @override
  String get galleryWizardSetNotAdded => 'Nicht hinzugefügt';

  @override
  String get galleryWizardNeedsTitle => 'Deine Apps verbinden';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name funktioniert, sobald diese verbunden sind.';
  }

  @override
  String get galleryWizardSkillAdded => 'Hinzugefügt';

  @override
  String get galleryWizardConnected => 'Verbunden';

  @override
  String get galleryWizardConnect => 'Verbinden';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Verbinde $name unter Einstellungen → Apps.';
  }

  @override
  String get galleryWizardContinue => 'Weiter';

  @override
  String get galleryWizardSkip => 'Später';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name ist bereit';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Du findest es bei deinen übrigen Sachen.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Für die volle Funktion müssen diese Apps verbunden sein: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Warten auf Freigabe';

  @override
  String get galleryWizardPendingHelp =>
      'Dein Workspace fragt zuerst einen Admin. Es wird hinzugefügt, sobald die Freigabe erteilt ist.';

  @override
  String get galleryRequestsTitle => 'Wünsche';

  @override
  String get galleryRequestsHelp =>
      'Ideen für die Galerie. Stimme für das ab, was du willst; Entwickler wählen von oben.';

  @override
  String get galleryRequestsLinkHelp =>
      'Etwas wünschen, das noch fehlt, oder abstimmen';

  @override
  String get galleryRequestsTop => 'Top';

  @override
  String get galleryRequestsNew => 'Neu';

  @override
  String get galleryRequestsEmpty => 'Noch keine Wünsche. Mach den Anfang.';

  @override
  String get galleryRequestsError => 'Wünsche konnten nicht geladen werden.';

  @override
  String get galleryRequestNew => 'Neuer Wunsch';

  @override
  String get galleryRequestNewHelp =>
      'Beschreibe, was jemand bauen soll. Ähnliche Wünsche werden zusammengeführt.';

  @override
  String get galleryRequestKind => 'Art';

  @override
  String get galleryRequestTitleLabel => 'Was soll es tun?';

  @override
  String get galleryRequestTitleLength => 'Verwende 4 bis 80 Zeichen.';

  @override
  String get galleryRequestDetails => 'Details (optional)';

  @override
  String get galleryRequestSend => 'Wunsch absenden';

  @override
  String get galleryRequestSent => 'Wunsch gesendet';

  @override
  String galleryRequestSimilar(String title) {
    return '„$title“ wurde bereits gewünscht, daher ging deine Stimme dorthin';
  }

  @override
  String get galleryRequestMine => 'Deine';

  @override
  String get galleryRequestVote => 'Abstimmen';

  @override
  String get galleryRequestOpen => 'Offen';

  @override
  String get galleryRequestPlanned => 'Geplant';

  @override
  String get galleryRequestDone => 'Fertig';

  @override
  String get galleryRequestDeclined => 'Abgelehnt';

  @override
  String get gallerySubmitStart => 'Bei der Galerie einreichen';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Teile einen selbst erstellten Look, Skill, Bot oder eine Routine';

  @override
  String get gallerySubmitPick => 'Was möchtest du teilen?';

  @override
  String get gallerySubmitPickHelp =>
      'Wähle etwas aus, das du erstellt hast. Es wird geprüft, bevor es in der Galerie erscheint.';

  @override
  String get galleryLooksMine => 'Deine Looks';

  @override
  String get gallerySubmitCurrentScheme => 'Aktives Farbschema';

  @override
  String get gallerySubmitCurrentWallpaper => 'Aktives Hintergrundbild';

  @override
  String get gallerySubmitMyWallpaper => 'Mein Hintergrundbild';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'App einreichen',
      'bot': 'Starter-Bot einreichen',
      'routine': 'Routine einreichen',
      'plugin': 'Plugin einreichen',
      'set': 'Starter-Set einreichen',
      'theme': 'Theme einreichen',
      'scheme': 'Farbschema einreichen',
      'wallpaper': 'Hintergrundbild einreichen',
      'other': 'Skill einreichen',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Dein Anzeigename wird als Autor angezeigt. Deine E-Mail-Adresse wird niemals geteilt.';

  @override
  String get gallerySubmitName => 'Name';

  @override
  String get gallerySubmitNameLength => 'Verwende 1 bis 60 Zeichen.';

  @override
  String get gallerySubmitTags => 'Tags';

  @override
  String get gallerySubmitTagsHelp => 'Bis zu sechs, mit Komma getrennt';

  @override
  String get gallerySubmitLicense => 'Lizenz';

  @override
  String gallerySubmitRemix(String name) {
    return 'Nennt das Original: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed => 'Nennt das Original aus der Galerie';

  @override
  String get gallerySubmitSend => 'Einreichen';

  @override
  String get gallerySubmitted => 'Zur Prüfung gesendet';

  @override
  String get gallerySubmissionsTitle => 'Meine Einreichungen';

  @override
  String get gallerySubmissionsHelp =>
      'Was du bei der Galerie eingereicht hast und wie der Stand ist.';

  @override
  String get gallerySubmissionsSent => 'Gesendet';

  @override
  String get gallerySubmissionsEmpty => 'Noch nichts eingereicht.';

  @override
  String get gallerySubmissionsError =>
      'Deine Einreichungen konnten nicht geladen werden.';

  @override
  String get gallerySubmissionOpen => 'In Prüfung';

  @override
  String get gallerySubmissionMerged => 'In der Galerie';

  @override
  String get gallerySubmissionClosed => 'Nicht angenommen';

  @override
  String get gallerySubmissionFailed => 'Konnte nicht gesendet werden';

  @override
  String get galleryMyItems => 'Deine Einträge in der Galerie';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count offene Meldungen',
      one: '1 offene Meldung',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Ein Bot';

  @override
  String get islandNeedsOk => 'Braucht dein OK';

  @override
  String get islandTakeOver => 'Möchte, dass du übernimmst';

  @override
  String get islandWriting => 'Schreibt eine Antwort';

  @override
  String get islandWorking => 'Arbeitet';

  @override
  String get islandFinished => 'Fertig';

  @override
  String get islandStoppedProblem => 'Mit Problem gestoppt';

  @override
  String get islandOnThisMac => 'Auf diesem Mac';

  @override
  String get islandStale => 'Öffne Casama für den neuesten Stand';

  @override
  String get islandOpen => 'Öffnen';

  @override
  String get islandStop => 'Stoppen';

  @override
  String get islandAllow => 'Erlauben';

  @override
  String get islandDeny => 'Ablehnen';

  @override
  String get islandReview => 'Prüfen';

  @override
  String get islandNothing => 'Gerade arbeitet kein Bot';

  @override
  String get islandQuickAsk => 'Schnellanfrage…';

  @override
  String get islandOpenCasama => 'Casama öffnen';

  @override
  String get islandSettings => 'Einstellungen…';

  @override
  String get islandQuit => 'Casama beenden';

  @override
  String get islandAskHint => 'Einen Bot fragen…';

  @override
  String get islandNeedsYou => 'Braucht dich';

  @override
  String get islandDropHere => 'Ablegen, um einen Bot zu fragen';

  @override
  String get siriSignedOut => 'Melde dich zuerst bei Casama an.';

  @override
  String get siriOpenToFinish => 'Öffne Casama zum Abschließen.';

  @override
  String get siriTooMany =>
      'Das sind viele Anfragen in einer Minute. Öffne Casama, um weiterzumachen.';

  @override
  String get siriNoCredits =>
      'Deine Credits sind aufgebraucht. Öffne Casama, um mehr hinzuzufügen.';

  @override
  String get siriOffline => 'Casama erreicht gerade das Internet nicht.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot braucht zuerst dein OK. Öffne Casama zum Prüfen.';
  }

  @override
  String siriBotFailed(String bot) {
    return 'Bei $bot ist ein Problem aufgetreten. Öffne Casama, um zu sehen, was passiert ist.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot hat geantwortet. Öffne Casama zum Lesen.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot arbeitet noch daran. Du bekommst eine Benachrichtigung, wenn es fertig ist.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot hat geantwortet.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return '$routine gestartet.';
  }

  @override
  String get siriNothingNeedsYou => 'Gerade braucht dich nichts.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dinge brauchen dich.',
      one: 'Eine Sache braucht dich.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Warten auf dich: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Computer sind für dieses Konto nicht verfügbar.';

  @override
  String get siriNoComputers => 'Du hast keine Computer in diesem Workspace.';

  @override
  String siriStartingComputer(String computer) {
    return '$computer wird gestartet.';
  }

  @override
  String get siriComputerFailed =>
      'Der Computer konnte gerade nicht gestartet werden.';

  @override
  String get siriWhichBotToStop => 'Welchen Bot soll ich stoppen?';

  @override
  String get siriBotNotRunning => 'Dieser Bot läuft gerade nicht.';

  @override
  String get siriStopped => 'Gestoppt.';

  @override
  String get siriStopFailed => 'Der Bot konnte gerade nicht gestoppt werden.';

  @override
  String get focusFilterShowingAll => 'Fokusfilter · Alle angezeigt';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fokusfilter · $count angezeigt',
      one: 'Fokusfilter · 1 angezeigt',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama ist für Personen ab 13 Jahren';

  @override
  String get under13Body =>
      'Dieses Konto kann Casama aufgrund des angegebenen Altersbereichs nicht nutzen. Du kannst dich abmelden oder deine Daten von einem anderen Konto exportieren.';

  @override
  String get siriSpotlightSetting => 'In Spotlight und Siri anzeigen';

  @override
  String get siriSpotlightSettingHelp =>
      'Bot-Namen, Routinennamen und Chattitel erscheinen auf diesem Gerät in Spotlight und Siri. Niemals das, was im Chat steht. Bei aktiver App-Sperre ausgeschaltet.';

  @override
  String get geminiSetting => 'Gemini darf Casama nutzen';

  @override
  String get geminiSettingHelp =>
      'Wenn du Gemini bittest, Casama zu nutzen, kann es deine Bots fragen, sehen, was dich braucht, und deine Routinen auf diesem Telefon ausführen. Gemini gibt nie etwas frei: Anfragen öffnen sich hier. Antworten bleiben verborgen, wenn der Workspace privat ist, „Antworttext verbergen“ aktiviert oder die App-Sperre an ist.';

  @override
  String get geminiOff =>
      'Gemini ist für Casama auf diesem Telefon ausgeschaltet. Schalte es in Casama ein: Einstellungen, Datenschutz.';

  @override
  String get islandBotWorking => 'Ein Bot arbeitet';

  @override
  String get islandOnThisComputer => 'auf diesem Computer';

  @override
  String get islandOnACall => 'Im Anruf';

  @override
  String get islandStartElsewhere => 'Bots, die du woanders startest';

  @override
  String get islandStartElsewhereHelp =>
      'Zeigt das, was du auf einem anderen Gerät startest, etwa deinem Mac, auch auf dem Sperrbildschirm dieses Telefons.';

  @override
  String get islandBotsAtWork => 'Bots bei der Arbeit';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schritte',
      one: '1 Schritt',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Bots in der Notch anzeigen';

  @override
  String get showBotsInNotchHelp =>
      'Was deine Bots tun, rund um die Kamera. Das Menüleisten-Symbol zeigt es so oder so.';

  @override
  String get notchOnHover => 'Notch beim Zeigen öffnen';

  @override
  String get notchOnHoverHelp => 'Aus: Klicke auf die Notch, um sie zu öffnen.';

  @override
  String get sitePublishToWeb => 'Im Web veröffentlichen';

  @override
  String get sitePublishToWebHelp => 'Gib ihr eine eigene Webadresse.';

  @override
  String get siteAddressName => 'Adressname';

  @override
  String get siteAddressRules =>
      '3 bis 40 Kleinbuchstaben, Ziffern und Bindestriche, beginnend und endend mit einem Buchstaben oder einer Ziffer.';

  @override
  String get siteAddressChecking => 'Wird geprüft…';

  @override
  String get siteAddressAvailable => 'Verfügbar';

  @override
  String get siteAddressTaken => 'Dieser Name ist nicht verfügbar.';

  @override
  String get siteAnyoneCanOpen => 'Alle mit dieser Adresse können sie öffnen.';

  @override
  String get sitePublish => 'Veröffentlichen';

  @override
  String get siteOnTheWeb => 'Im Web';

  @override
  String get siteSearchEngines => 'Von Suchmaschinen finden lassen';

  @override
  String get siteSearchEnginesHelp =>
      'Listet sie in Google und anderen Suchmaschinen.';

  @override
  String get siteSearchEnginesPaid => 'Erfordert ein kostenpflichtiges Abo.';

  @override
  String get siteUseOwnDomain => 'Eigene Domain verwenden';

  @override
  String get siteUnpublish => 'Veröffentlichung aufheben';

  @override
  String get siteUnpublishTitle => 'Veröffentlichung dieser Website aufheben?';

  @override
  String get siteUnpublishBody =>
      'Sie ist unter ihren Webadressen nicht mehr erreichbar. Sie bleibt in deiner Bibliothek.';

  @override
  String get siteHostLive => 'Live';

  @override
  String get siteHostWaitingForDns => 'Warten auf DNS';

  @override
  String get siteHostGettingCertificate => 'Zertifikat wird abgerufen';

  @override
  String get siteHostNeedsAttention => 'Erfordert Aufmerksamkeit';

  @override
  String get siteHostPaused => 'Pausiert';

  @override
  String get siteHostSuspended => 'Gesperrt';

  @override
  String get settingsDomains => 'Domains';

  @override
  String get settingsDomainsHelp =>
      'Öffne deine Websites unter einer Domain, die dir gehört.';

  @override
  String get settingsSearchHint => 'Einstellungen durchsuchen';

  @override
  String settingsSearchNone(String query) {
    return 'Keine Einstellungen passen zu „$query“.';
  }

  @override
  String get domainsEmpty =>
      'Verbinde eine Domain, die dir gehört, wie bakery.com, und deine Website öffnet sich dort.';

  @override
  String get domainsConnectOwn => 'Eigene Domain verbinden';

  @override
  String get domainStateLive => 'Live';

  @override
  String get domainStateWaitingDns => 'Warten auf DNS';

  @override
  String get domainStateWaitingCert => 'Zertifikat wird abgerufen';

  @override
  String get domainStatePaused => 'Pausiert';

  @override
  String get domainStateNeedsAttention => 'Erfordert Aufmerksamkeit';

  @override
  String get domainNoSite => 'Noch keine Website';

  @override
  String get domainConnectField => 'Deine Domain';

  @override
  String get domainConnectHelp =>
      'Schreibe sie wie bakery.com, www.bakery.com oder shop.bakery.com.';

  @override
  String get domainConnectSite => 'Anzuzeigende Website';

  @override
  String get domainSiteNone => 'Keine';

  @override
  String get domainSiteNoneHelp =>
      'Die Domain zeigt nichts, bis du eine Website auswählst.';

  @override
  String get domainConnect => 'Verbinden';

  @override
  String get domainClaimTitle => 'Zeige, dass sie dir gehört';

  @override
  String get domainClaimBody =>
      'Ein anderer Workspace hat diese Domain verbunden. Füge diesen Eintrag hinzu, um zu zeigen, dass sie dir gehört, und tippe dann erneut auf Verbinden.';

  @override
  String get domainRecordType => 'Typ';

  @override
  String get domainRecordName => 'Name';

  @override
  String get domainRecordValue => 'Wert';

  @override
  String get domainSite => 'Website';

  @override
  String get domainPickSite => 'Website auswählen';

  @override
  String get domainHosts => 'Adressen';

  @override
  String get domainPrimary => 'Primär';

  @override
  String get domainPrimaryHelp =>
      'Besucher landen hier; die anderen Adressen leiten hierher weiter.';

  @override
  String get domainMakePrimary => 'Als primär festlegen';

  @override
  String get domainRecordsTitle => 'Hinzuzufügende Einträge';

  @override
  String get domainRecordsAtCloudflare =>
      'Füge diese bei Cloudflare hinzu. Stelle die Einträge auf „Nur DNS“.';

  @override
  String domainRecordsAt(String provider) {
    return 'Füge diese in deinen DNS-Einstellungen bei $provider hinzu.';
  }

  @override
  String get domainRecordsGeneric =>
      'Füge diese dort hinzu, wo das DNS deiner Domain verwaltet wird – meist bei dem Unternehmen, bei dem du sie gekauft hast.';

  @override
  String get domainRecordsNone =>
      'Nichts hinzuzufügen. Alles ist eingerichtet.';

  @override
  String get domainRecordOptional => 'Optional';

  @override
  String domainRecordForward(String from, String to) {
    return 'Aktiviere bei dem Unternehmen, bei dem du die Domain gekauft hast, die Weiterleitung von $from nach $to.';
  }

  @override
  String get domainRecordFound => 'Gefunden';

  @override
  String get domainRecordNotFound => 'Noch nicht gefunden';

  @override
  String get domainCheckAgain => 'Erneut prüfen';

  @override
  String get domainCheckTooSoon =>
      'Wir haben gerade erst geprüft. Versuche es in ein paar Sekunden noch einmal.';

  @override
  String get domainChecksItself =>
      'Wir prüfen auch von selbst, du kannst diesen Bildschirm also verlassen.';

  @override
  String get domainHistory => 'Verlauf';

  @override
  String get domainEventConnected => 'Verbunden';

  @override
  String get domainEventProved => 'Einträge gefunden';

  @override
  String get domainEventLive => 'Live';

  @override
  String get domainEventNeedsDns => 'Wartet noch auf DNS';

  @override
  String get domainEventFailed =>
      'Einrichtung konnte nicht abgeschlossen werden';

  @override
  String get domainEventDisconnected =>
      'Einträge entfernt, daher wurde sie getrennt';

  @override
  String get domainEventPaused => 'Pausiert: Dein Abo deckt es nicht ab';

  @override
  String get domainEventResumed => 'Wieder aktiv';

  @override
  String get domainEventRemoved => 'Getrennt';

  @override
  String get domainEventClaim => 'Um Eigentumsnachweis gebeten';

  @override
  String get domainEventClaimAttempt =>
      'Ein anderer Workspace hat versucht, sie zu verbinden';

  @override
  String get domainEventOverLimit => 'Über dem Limit deines Abos';

  @override
  String get domainEventSuspended => 'Gesperrt';

  @override
  String get domainEventOther => 'Aktualisiert';

  @override
  String domainDisconnectTitle(String name) {
    return '$name trennen?';
  }

  @override
  String get domainDisconnectBody =>
      'Deine Website öffnet sich unter dieser Domain nicht mehr. Ihre Einträge kannst du danach bei deinem DNS-Anbieter entfernen.';

  @override
  String get domainsFind => 'Domain finden';

  @override
  String get domainsEmptyBuy =>
      'Kaufe eine Domain für deine Website oder verbinde eine, die dir gehört.';

  @override
  String get domainFindField => 'Name oder ein paar Wörter';

  @override
  String get domainFindHint => 'blumenladen';

  @override
  String get domainFindHelp => 'Preise gelten pro Jahr zuzüglich Steuern.';

  @override
  String get domainFindNone => 'Keine Namen gefunden. Probiere andere Wörter.';

  @override
  String get domainFindNotOffered =>
      'Der Kauf einer Domain ist in dieser App nicht verfügbar. Du kannst trotzdem eine Domain verbinden, die dir gehört.';

  @override
  String domainPricePerYear(String price) {
    return '$price pro Jahr zzgl. Steuern';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Verlängert sich für $price';
  }

  @override
  String get domainReasonTaken => 'Vergeben';

  @override
  String get domainReasonPremium => 'Premium-Name, hier nicht im Verkauf';

  @override
  String get domainReasonNotSold => 'Hier nicht im Verkauf';

  @override
  String get domainBuy => 'Kaufen';

  @override
  String domainBuyTitle(String name) {
    return '$name kaufen';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price für das erste Jahr, danach $renew pro Jahr zzgl. Steuern.';
  }

  @override
  String get domainBuyFinal =>
      'Nach der Registrierung der Domain ist der Kauf endgültig. Kann sie nicht registriert werden, erhältst du den vollen Betrag zurück.';

  @override
  String get domainBuyTerms => 'Ich akzeptiere die Domain-Bedingungen';

  @override
  String get domainBuyReadTerms => 'Bedingungen lesen';

  @override
  String get domainRenewAuto => 'Automatisch verlängern';

  @override
  String get domainRenewAutoHelp =>
      'Belastet deine gespeicherte Zahlungsmethode etwa zwei Wochen vor Ablauf.';

  @override
  String get domainBuySite => 'Anzuzeigende Website';

  @override
  String get domainBuyPayInBrowser =>
      'Beende die Zahlung im Browser. Dieser Bildschirm verfolgt den Stand mit.';

  @override
  String get domainContactTitle => 'Kontaktdaten';

  @override
  String get domainContactHelp =>
      'Die Person oder das Unternehmen, auf die die Domain registriert wird. Registrare halten diese Angaben privat.';

  @override
  String get domainContactFirstName => 'Vorname';

  @override
  String get domainContactLastName => 'Nachname';

  @override
  String get domainContactOrganization => 'Unternehmen (optional)';

  @override
  String get domainContactAddress1 => 'Adresse';

  @override
  String get domainContactAddress2 => 'Adresszeile 2 (optional)';

  @override
  String get domainContactCity => 'Ort';

  @override
  String get domainContactState => 'Bundesland oder Region';

  @override
  String get domainContactZip => 'Postleitzahl';

  @override
  String get domainContactCountry => 'Ländercode';

  @override
  String get domainContactCountryHint => 'DE';

  @override
  String get domainContactPhone => 'Telefon';

  @override
  String get domainContactPhoneHint => '+49 30 5550100';

  @override
  String get domainContactEmail => 'E-Mail';

  @override
  String get domainContactRequired => 'Erforderlich';

  @override
  String get domainContactCountryInvalid =>
      'Verwende einen zweibuchstabigen Code wie DE';

  @override
  String get domainContactPhoneInvalid =>
      'Verwende das internationale Format wie +49 30 5550100';

  @override
  String get domainContactEmailInvalid => 'Gib eine gültige E-Mail-Adresse ein';

  @override
  String get domainContactSave => 'Speichern';

  @override
  String get domainContactSaved => 'Kontaktdaten gespeichert.';

  @override
  String get domainContactChangeNote =>
      'Änderungen gelten für jede Domain, die dieser Workspace gekauft hat. Eine neue E-Mail-Adresse muss erneut bestätigt werden.';

  @override
  String get domainOrderTitle => 'Deine Bestellung';

  @override
  String get domainOrderWaitingPayment =>
      'Warten auf deine Zahlung im Browser.';

  @override
  String domainOrderRegistering(String name) {
    return '$name wird registriert…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return '$name wird eingerichtet…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'Wir konnten $name nicht registrieren. Rückerstattung läuft…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'Wir konnten $name nicht registrieren und haben dir den vollen Betrag erstattet.';
  }

  @override
  String get domainOrderAbandoned =>
      'Dieser Checkout wurde nicht bezahlt, es wurde also nichts berechnet.';

  @override
  String get domainOrderNeedsAttention =>
      'Bei dieser Bestellung ist etwas schiefgelaufen. Wir wurden benachrichtigt und kümmern uns darum.';

  @override
  String domainOrderDone(String name) {
    return '$name gehört jetzt dir.';
  }

  @override
  String get domainOrderLeave =>
      'Du kannst diesen Bildschirm verlassen. Wir sagen dir Bescheid, sobald alles bereit ist.';

  @override
  String get domainOrderBack => 'Zurück zu Domains';

  @override
  String domainRenewsOn(String date) {
    return 'Verlängert sich am $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Läuft am $date ab';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price pro Jahr zzgl. Steuern';
  }

  @override
  String get domainRenewNow => 'Jetzt verlängern';

  @override
  String get domainRenewPayInBrowser =>
      'Beende die Zahlung im Browser. Das neue Datum erscheint hier, sobald bezahlt ist.';

  @override
  String get domainRenewCharged =>
      'Verlängert. Das neue Datum erscheint hier in einer Minute.';

  @override
  String get domainRegistration => 'Registrierung';

  @override
  String domainExpired(String date) {
    return 'Am $date abgelaufen. Verlängere innerhalb von 25 Tagen ab diesem Datum, um sie zu behalten.';
  }

  @override
  String get domainLapsed =>
      'Diese Domain ist abgelaufen. Schreib dem Support, um nach einer Wiederherstellung zu fragen; garantiert ist sie nicht.';

  @override
  String get domainSuspendedLine =>
      'Diese Domain ist gesperrt. Schreib dem Support, um zu erfahren warum.';

  @override
  String get domainVerifyTitle => 'E-Mail-Adresse des Registranten bestätigen';

  @override
  String get domainVerifyBody =>
      'Der Registrar hat eine E-Mail an die Adresse des Registranten gesendet. Öffne sie und bestätige, sonst funktioniert die Domain nicht mehr.';

  @override
  String get domainVerifySendAgain => 'Erneut senden';

  @override
  String get domainVerifySent =>
      'Gesendet. Prüfe den Posteingang des Registranten.';

  @override
  String get domainDnsRecords => 'DNS-Einträge';

  @override
  String get domainDnsRecordsHelp => 'E-Mail, Subdomains und Website-Prüfungen';

  @override
  String get domainMoveOut => 'Zu einem anderen Registrar umziehen';

  @override
  String domainMoveOutAfter(String date) {
    return 'Kann ab dem $date umgezogen werden';
  }

  @override
  String get domainMoveOutHelp =>
      'Transfercode für einen anderen Registrar abrufen';

  @override
  String domainMoveOutTitle(String name) {
    return '$name umziehen?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Dadurch wird die Domain entsperrt und ihr Transfercode einmalig angezeigt. Gib zur Bestätigung $name ein.';
  }

  @override
  String get domainMoveOutConfirm => 'Transfercode abrufen';

  @override
  String domainMoveOutLocked(String date) {
    return 'Kann ab dem $date umgezogen werden.';
  }

  @override
  String get domainTransferCodeTitle => 'Transfercode';

  @override
  String get domainTransferCodeBody =>
      'Gib diesen Code an den neuen Registrar weiter. Er wird nur dieses eine Mal angezeigt, kopiere ihn also jetzt.';

  @override
  String get domainTransferCode => 'Code';

  @override
  String get domainUnlocked => 'Für einen Umzug entsperrt';

  @override
  String get domainLockAgain => 'Wieder sperren';

  @override
  String get domainLocked => 'Wieder gesperrt.';

  @override
  String get domainReauthTitle => 'Erneut anmelden';

  @override
  String get domainReauthSendCode => 'Code per E-Mail senden';

  @override
  String domainReauthCodeSent(String email) {
    return 'Wir haben einen Code an $email gesendet.';
  }

  @override
  String get domainReauthCode => 'Code aus der E-Mail';

  @override
  String get domainReauthSignIn => 'Anmelden';

  @override
  String get domainReauthSignOut =>
      'Melde dich ab und wieder an und versuche es dann noch einmal.';

  @override
  String get dnsRecordsEmpty => 'Noch keine Einträge.';

  @override
  String get dnsRecordAdd => 'Eintrag hinzufügen';

  @override
  String get dnsRecordEdit => 'Eintrag bearbeiten';

  @override
  String get dnsRecordManaged => 'Wird von deiner Casama-Website genutzt';

  @override
  String get dnsRecordType => 'Typ';

  @override
  String get dnsRecordHost => 'Name';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Für $name selbst leer lassen, oder www, shop eingeben…';
  }

  @override
  String get dnsRecordAnswer => 'Wert';

  @override
  String get dnsRecordTtl => 'TTL (Sekunden)';

  @override
  String get dnsRecordPriority => 'Priorität';

  @override
  String get dnsRecordSave => 'Speichern';

  @override
  String get dnsRecordDeleteTitle => 'Diesen Eintrag löschen?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 Sekunden oder mehr';

  @override
  String get dnsRecordAnswerRequired => 'Erforderlich';

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
  String get deleteAccountDomains => 'Gekaufte Domains in deinen Workspaces';

  @override
  String get deleteAccountDomainsBody =>
      'Diese Domains bleiben registriert, bis sie ablaufen. Sie verlängern sich nicht mehr, und ihre Websites gehen offline.';

  @override
  String get whatsNew010Sites =>
      'Stelle eine Seite mit eigener Adresse ins Web und nutze dafür deine eigene Domain.';

  @override
  String get inAppAlertOpen => 'Öffnen';

  @override
  String get pushPrefsTitle => 'Benachrichtigungen';

  @override
  String get pushPrefsHelp =>
      'Wähle aus, was auf deinen Geräten klingelt. Alles landet weiterhin in deinem Posteingang.';

  @override
  String get pushAllOn => 'Alle ein';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Antworten aus',
      'needsYou': '„Braucht dich“ aus',
      'routines': 'Routinen und Briefings aus',
      'suggestions': 'Vorschläge und Meldungen aus',
      'other': 'Konto aus',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count Arten deaktiviert';
  }

  @override
  String get pushReplies => 'Antworten';

  @override
  String get pushRepliesHelp =>
      'Wenn ein Bot auf eine Frage von dir antwortet, falls du den Chat verlassen hast.';

  @override
  String get pushNeedsYou => 'Braucht dich';

  @override
  String get pushNeedsYouHelp =>
      'Freigaben, Passwörter und Übernahmen, auf die deine Bots warten.';

  @override
  String get pushNeedsYouOffWarning =>
      'Aus: Deine Bots warten, bis du die App öffnest.';

  @override
  String get pushRoutines => 'Routinen und Briefings';

  @override
  String get pushRoutinesHelp =>
      'Ergebnisse von Routinen und dein Morgen-Briefing.';

  @override
  String get pushSuggestions => 'Vorschläge und Meldungen';

  @override
  String get pushSuggestionsHelp =>
      'Dinge, die deine Bots dir anbieten zu erledigen.';

  @override
  String get pushAccount => 'Konto';

  @override
  String get pushAccountHelp =>
      'Niedriger Credit-Stand, Projekte und dein Server.';

  @override
  String get pushHideReplyText => 'Antworttext verbergen';

  @override
  String get pushHideReplyTextHelp =>
      'Benachrichtigungen sagen, dass ein Bot geantwortet hat, ohne seinen Text zu zeigen.';

  @override
  String get reactToMessage => 'Reagieren';

  @override
  String get moreReactions => 'Weitere Reaktionen';

  @override
  String get reactionsTitle => 'Reaktionen';

  @override
  String get reactionsAll => 'Alle';

  @override
  String get reactionsYou => 'Du';

  @override
  String get reactionsTapToRemove => 'Zum Entfernen tippen';

  @override
  String get reactionsNone => 'Noch keine Reaktionen.';

  @override
  String get reactionsLoadFailed => 'Konnte nicht laden, wer reagiert hat.';

  @override
  String get searchEmoji => 'Emoji suchen';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Reaktionen',
      one: '1 Reaktion',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Reaktionen',
      one: '1 Reaktion',
    );
    return '$emoji, $_temp0, einschließlich deiner';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Mit $emoji reagieren';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Deine $emoji-Reaktion entfernen';
  }

  @override
  String get packsShelfTitle => 'Pakete';

  @override
  String get packsShelfHelp =>
      'Bots, Skills und Routinen, die zusammenspielen – auf einmal hinzugefügt.';

  @override
  String get packReviewed => 'Geprüft';

  @override
  String get packNotReviewed => 'Nicht von Casama geprüft';

  @override
  String packCountBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bots',
      one: '1 Bot',
    );
    return '$_temp0';
  }

  @override
  String packCountSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Skills',
      one: '1 Skill',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Routinen',
      one: '1 Routine',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps',
      one: '1 App',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Looks',
      one: '1 Look',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tools',
      one: '1 Tool',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge',
      one: '1 Eintrag',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Starter-Set';

  @override
  String get packAddFromLink => 'Paket über einen Link hinzufügen';

  @override
  String get packAddFromLinkHelp =>
      'Füge einen GitHub-Link zu einem Paket ein und sieh zuerst, was es hinzufügt.';

  @override
  String get packAddFromFile => 'Aus Datei hinzufügen';

  @override
  String get packAddFromFileHelp => 'Wähle die .zip-Datei eines Pakets.';

  @override
  String get packLinkLabel => 'GitHub-Link';

  @override
  String get packFileUnreadable =>
      'Diese Datei ist keine .zip-Datei eines Pakets.';

  @override
  String get packFileTooBig => 'Diese Datei ist zu groß für ein Paket.';

  @override
  String packSource(String where, String commit) {
    return '$where bei $commit';
  }

  @override
  String get packFromFile => 'Aus einer Datei';

  @override
  String get packFromShare => 'Mit dir geteilt';

  @override
  String get packAlreadyHere => 'Dieser Workspace hat dieses Paket bereits.';

  @override
  String get packOpenInstalled => 'Installierte Pakete ansehen';

  @override
  String get packAdd => 'Paket hinzufügen';

  @override
  String packWizardTitle(String name) {
    return '$name hinzufügen';
  }

  @override
  String get packWhatsInside => 'Was drin ist';

  @override
  String get packWhatsInsideHelp =>
      'Entferne den Haken bei allem, was du nicht willst.';

  @override
  String get packSectionBots => 'Bots';

  @override
  String get packSectionSkills => 'Skills';

  @override
  String get packSectionRoutines => 'Routinen';

  @override
  String get packSectionApps => 'Apps';

  @override
  String get packSectionLooks => 'Looks';

  @override
  String get packSectionIncludes => 'Aus der Galerie';

  @override
  String get packSectionTools => 'Tools';

  @override
  String get packSkillRunsScripts =>
      'Führt Skripte auf dem Computer des Bots aus';

  @override
  String get packSkillForWorkspace => 'Für den ganzen Workspace';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Läuft etwa $count-mal pro Woche',
      one: 'Läuft etwa einmal pro Woche',
      zero: 'Läuft ab und zu',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Spricht mit $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Verbindet mit $url';
  }

  @override
  String get packIncludeMissing => 'Nicht in der Galerie gefunden';

  @override
  String get packLookHelp =>
      'Nach dem Hinzufügen kannst du ihn auf diesem Gerät nutzen.';

  @override
  String get packNothingTicked =>
      'Hake mindestens eine Sache zum Hinzufügen an.';

  @override
  String get packQuestions => 'Ein paar Fragen';

  @override
  String get packQuestionsHelp =>
      'Das Paket trägt diese Antworten in seine Bots und Routinen ein.';

  @override
  String get packSecretsTitle => 'Schlüssel und Einstellungen';

  @override
  String get packSecretsHelp =>
      'Die Tools des Pakets brauchen diese, um zu funktionieren.';

  @override
  String get packReachTitle => 'Worauf es zugreifen kann';

  @override
  String get packReachHelp =>
      'Von Casama aus den Dateien des Pakets ermittelt.';

  @override
  String get packReachRunsCode => 'Führt Code aus';

  @override
  String get packReachComputer => 'Nutzt den Computer des Bots';

  @override
  String packReachHosts(String hosts) {
    return 'Spricht mit $hosts';
  }

  @override
  String get packReachNoHosts => 'Spricht nicht mit anderen Websites';

  @override
  String packReachSecrets(String names) {
    return 'Nutzt Schlüssel: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Etwa $count geplante Durchläufe pro Woche',
      one: 'Etwa 1 geplanter Durchlauf pro Woche',
      zero: 'Keine geplanten Durchläufe',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama hat dieses Paket nicht geprüft. Füge es nur hinzu, wenn du seiner Herkunft vertraust. Seine Routinen starten ausgeschaltet.';

  @override
  String get packPickBotTitle => 'Welcher Bot bekommt es?';

  @override
  String get packPickBotHelp =>
      'Dieses Paket bringt keinen Bot mit. Wähle einen für seine Routinen und Tools.';

  @override
  String packDoneTitle(String name) {
    return '$name ist drin';
  }

  @override
  String get packDoneHelp => 'Das wurde hinzugefügt.';

  @override
  String get packPendingHelp =>
      'Wir haben einen Admin gefragt. Das Paket wird hinzugefügt, sobald die Freigabe vorliegt.';

  @override
  String get packStatusInstalled => 'Hinzugefügt';

  @override
  String get packStatusPending => 'Wartet auf einen Admin';

  @override
  String get packStatusSkipped => 'Übersprungen';

  @override
  String get packStatusFailed => 'Hat nicht geklappt';

  @override
  String get packStatusDevice => 'Auf diesem Gerät';

  @override
  String get packConnectTitle => 'Seine Apps verbinden';

  @override
  String get packConnectHelp =>
      'Seine Bots funktionieren vollständig, sobald diese verbunden sind.';

  @override
  String get packLooksTitle => 'Einen Look auf diesem Gerät verwenden?';

  @override
  String get packUseLook => 'Verwenden';

  @override
  String get packLookInUse => 'Wird verwendet';

  @override
  String get packInstalledTitle => 'Dieses Paket ist bereits vorhanden';

  @override
  String get packsInstalledTitle => 'Installierte Pakete';

  @override
  String get packsInstalledRow =>
      'Pakete, die dieser Workspace hinzugefügt hat, samt Updates';

  @override
  String get packsInstalledEmpty =>
      'Noch keine Pakete. Finde eines im Pakete-Regal oder füge eines über einen Link hinzu.';

  @override
  String get packEditedBadge => 'Von dir bearbeitet';

  @override
  String get packRemove => 'Entfernen';

  @override
  String get packUpToDate => 'Dieses Paket ist aktuell.';

  @override
  String get packCantCheck =>
      'Dieses Paket stammt aus einer Datei oder einem Link und kann nicht nach Updates suchen.';

  @override
  String packUpdateTitle(String name) {
    return '$name aktualisieren';
  }

  @override
  String packDiffAdded(String names) {
    return 'Neu: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Entfernt: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Geändert: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Neue Websites, mit denen es spricht: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Neue Schlüssel, die es braucht: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Neue Zeitpläne: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Geplante Durchläufe pro Woche: $from → $to';
  }

  @override
  String get packDiffNone => 'Nichts Merkliches hat sich geändert.';

  @override
  String get packEditedTitle => 'Dinge, die du geändert hast';

  @override
  String get packEditedHelp => 'Deine Version bleibt, bis du sie umstellst.';

  @override
  String get packTakeTheirs => 'Version des Pakets verwenden';

  @override
  String get packReachGrewTitle => 'Es greift weiter zu';

  @override
  String get packReachGrewHelp =>
      'Die neue Version kann auf mehr zugreifen als deine aktuelle.';

  @override
  String get packReachConfirm =>
      'Ich habe geprüft, worauf es jetzt zugreifen kann';

  @override
  String packUpdated(String name) {
    return '$name wurde aktualisiert.';
  }

  @override
  String packRemoveTitle(String name) {
    return '$name entfernen?';
  }

  @override
  String get packRemoveBody =>
      'Seine Tools und Schlüssel verschwinden, ebenso Skills und Routinen, die du nicht geändert hast. App-Verbindungen bleiben.';

  @override
  String get packRemoveBots =>
      'Auch die Bots löschen, die dieses Paket erstellt hat';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Paket entfernt. $count Elemente blieben erhalten, weil du sie geändert hast.',
      one:
          'Paket entfernt. 1 Element blieb erhalten, weil du es geändert hast.',
      zero: 'Paket entfernt.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Als Paket teilen';

  @override
  String get sharePackRow => 'Bots und Skills für jemand anderen bündeln';

  @override
  String get sharePackHelp =>
      'Schlüssel, Chats, Erinnerungen, Über dich und die Modellauswahl sind niemals enthalten.';

  @override
  String get sharePackBots => 'Bots';

  @override
  String get sharePackBotsHelp =>
      'Wähle bis zu 5. Jeder bringt seine Anweisungen, Skills und Routinen mit.';

  @override
  String get sharePackSkills => 'Workspace-Skills';

  @override
  String get sharePackName => 'Name';

  @override
  String get sharePackSummary => 'Eine Zeile darüber';

  @override
  String get sharePackLook => 'Theme dieses Geräts einbeziehen';

  @override
  String get sharePackCheck => 'Prüfen und teilen';

  @override
  String get sharePackFindingsTitle => 'Einige Zeilen sehen aus wie Schlüssel';

  @override
  String get sharePackFindingsHelp =>
      'Prüfe das vor dem Teilen. Geh zurück zum Beheben oder teile, wenn alles sicher ist.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, Zeile $line: $what';
  }

  @override
  String get sharePackGoBack => 'Zurück';

  @override
  String get sharePackAnyway => 'Trotzdem teilen';

  @override
  String get sharePackLinkTitle => 'Dein Paket-Link';

  @override
  String sharePackLinkHelp(String date) {
    return 'Alle, die bei Casama angemeldet sind, können ihn bis $date öffnen.';
  }

  @override
  String get sharePackShare => 'Teilen';

  @override
  String get sharePackSaveFile => 'Als Datei speichern';

  @override
  String get sharePackLinkCopied => 'Link kopiert.';

  @override
  String get sharePackStop => 'Teilen stoppen';

  @override
  String get sharePackStopped => 'Der Link funktioniert nicht mehr.';

  @override
  String pluginFromPack(String pack) {
    return 'Aus dem Paket $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Aktualisiere oder entferne es zusammen mit seinem Paket unter Galerie → Installierte Pakete.';

  @override
  String get pluginSettings => 'Einstellungen';

  @override
  String get pluginEditSettings => 'Einstellungen bearbeiten';

  @override
  String get pluginSettingsSaved => 'Einstellungen gespeichert.';

  @override
  String get galleryPolicyKeyHelp =>
      'Du kannst auch ein Repository (repo/owner:name) oder ein Paket (pack/name) eingeben.';

  @override
  String galleryPolicyUseKey(String key) {
    return '$key hinzufügen';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Paket: $name';
  }

  @override
  String get reportPackShare => 'Dieses Paket melden';

  @override
  String get appLock => 'App-Sperre';

  @override
  String get appLockRow => 'Beim Öffnen von Casama Entsperren verlangen';

  @override
  String get appLockHelp =>
      'Casama bittet dich beim Öffnen und nach einer Pause um Entsperrung. Solange das aktiv ist, bleibt deine Anmeldung im Schlüsselbund dieses Geräts.';

  @override
  String get appLockSwitch => 'Casama sperren';

  @override
  String get appLockLocked => 'Casama ist gesperrt';

  @override
  String get appLockUnlock => 'Entsperren';

  @override
  String get appLockUnlockWithPasskey => 'Mit Passkey entsperren';

  @override
  String get appLockUnlockReason => 'Casama entsperren';

  @override
  String get appLockTurnOnReason => 'App-Sperre einschalten';

  @override
  String get appLockConfirmReason => 'Bestätige, dass du es bist';

  @override
  String get appLockConfirmTitle => 'Bestätige, dass du es bist';

  @override
  String appLockUnlockWith(String method) {
    return 'Verwende $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID oder deinen Code';

  @override
  String get appLockDeviceAndroid =>
      'deinen Fingerabdruck, dein Gesicht oder deine Bildschirmsperre';

  @override
  String get appLockDeviceMac => 'Touch ID oder das Passwort deines Mac';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'die Bildschirmsperre deines Geräts';

  @override
  String appLockMethodDevice(String method) {
    return 'Entsperrt mit $method';
  }

  @override
  String get appLockMethodPin => 'Entsperrt mit einer 6-stelligen PIN';

  @override
  String get appLockMethodPasskey => 'Entsperrt mit einem Passkey';

  @override
  String get appLockPinHint => 'PIN eingeben';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Falsche PIN. Noch $count Versuche.',
      one: 'Falsche PIN. Noch 1 Versuch.',
      zero: 'Falsche PIN.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Zu viele falsche PINs. Melde dich ab und dann wieder an, um Casama zu öffnen.';

  @override
  String get appLockFailed => 'Das hat nicht geklappt. Versuche es erneut.';

  @override
  String get appLockUnavailable =>
      'Dieses Gerät kann Casama gerade nicht entsperren. Melde dich ab und dann wieder an, um wieder reinzukommen.';

  @override
  String get appLockSignOutConfirm =>
      'Durch das Abmelden wird die App-Sperre auf diesem Gerät ausgeschaltet. Melde dich erneut an, um Casama zu öffnen.';

  @override
  String get appLockCallRinging =>
      'Ein Anruf klingelt. Zum Antworten entsperren.';

  @override
  String get appLockRequiredTitle => 'App-Sperre einschalten';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace erfordert die App-Sperre auf jedem Gerät, das Casama öffnet.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Dieser Browser kann mit diesem Server keine Passkeys nutzen und Casama daher nicht sperren. Öffne Casama in der App auf deinem Telefon oder Computer.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Ein. Erforderlich durch $workspace';
  }

  @override
  String get appLockTurnOn => 'Einschalten';

  @override
  String get appLockTurnedOn => 'App-Sperre ist eingeschaltet';

  @override
  String get appLockNoWayHere =>
      'Dieser Browser kann mit diesem Server keine Passkeys nutzen, daher lässt sich Casama hier nicht sperren.';

  @override
  String get appLockNotChecked => 'Konnte nicht bestätigen, dass du es bist.';

  @override
  String get appLockPinSetupTitle => 'PIN wählen';

  @override
  String get appLockPinAgainTitle => 'PIN erneut eingeben';

  @override
  String get appLockPinSetupBody =>
      '6 Ziffern. Du gibst sie ein, um Casama zu öffnen.';

  @override
  String get appLockPinNext => 'Weiter';

  @override
  String get appLockPinMismatch =>
      'Die PINs stimmten nicht überein. Wähle erneut eine.';

  @override
  String get appLockPinNotSaved =>
      'Die PIN konnte auf diesem Gerät nicht gespeichert werden.';

  @override
  String get appLockPinChanged => 'PIN geändert';

  @override
  String get appLockChangePin => 'PIN ändern';

  @override
  String get appLockAfter => 'Sperren nach';

  @override
  String get appLockAfterHelp =>
      'Zeit im Hintergrund, minimiert oder hinter anderen Apps auf einem Computer.';

  @override
  String get appLockAfterImmediately => 'Sofort';

  @override
  String get appLockAfterOneMinute => '1 Minute';

  @override
  String get appLockAfterFiveMinutes => '5 Minuten';

  @override
  String get appLockAfterFifteenMinutes => '15 Minuten';

  @override
  String get appLockAfterOneHour => '1 Stunde';

  @override
  String get appLockBlockScreenshots => 'Screenshots blockieren';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Screenshots, Bildschirmaufnahmen und Bildschirmfreigabe zeigen nichts von Casama.';

  @override
  String get appLockLockNow => 'Jetzt sperren';

  @override
  String get appLockPrivacySection => 'Mehr Datenschutz';

  @override
  String get appLockAskBeforeRisky => 'Riskante Aktionen bestätigen';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Erneut entsperren vor dem Löschen deines Kontos, dem Erstellen von Schlüsseln, Ändern der Abrechnung, Exportieren von Daten, Freigeben hochriskanter Anfragen und Übernehmen eines Computers.';

  @override
  String get requireAppLock => 'App-Sperre voraussetzen';

  @override
  String get requireAppLockHelp =>
      'Mitglieder müssen Casama auf jedem Gerät sperren, bevor es sich öffnet. Im Web ist dafür ein Passkey nötig.';

  @override
  String get requireAppLockOwnFirst =>
      'Schalte die App-Sperre zuerst auf diesem Gerät ein.';

  @override
  String get permLocation => 'Standort';

  @override
  String get permLocationAlways => 'Standort im Hintergrund';

  @override
  String get permCamera => 'Kamera';

  @override
  String get permMicrophone => 'Mikrofon';

  @override
  String get permSpeech => 'Spracherkennung';

  @override
  String get permPhotos => 'Fotos';

  @override
  String get permContacts => 'Kontakte';

  @override
  String get permCalendar => 'Kalender';

  @override
  String get permHealth => 'Health';

  @override
  String get permNotifications => 'Mitteilungen';

  @override
  String get permNotificationAccess => 'Mitteilungszugriff';

  @override
  String get permAccessibility => 'Bedienungshilfen';

  @override
  String get permScreenRecording => 'Bildschirmaufnahme';

  @override
  String get permAutomation => 'Automation';

  @override
  String get permFullDisk => 'Festplattenvollzugriff';

  @override
  String get permSharedFolders => 'Geteilte Ordner';

  @override
  String get permLocalTools => 'Lokale Tools';

  @override
  String get cardPermissions => 'Berechtigungen';

  @override
  String permissionsTitle(String device) {
    return 'Diese für $device einschalten';
  }

  @override
  String get permStateOn => 'Ein';

  @override
  String get permStateOff => 'Aus';

  @override
  String get permStateNotAsked => 'Noch nicht gefragt';

  @override
  String get permStateLimited => 'Eingeschränkt';

  @override
  String get permStateUnknown => 'Unbekannt';

  @override
  String get permStateUnavailable => 'Auf diesem Gerät nicht verfügbar';

  @override
  String get permStateUpdate =>
      'Casama aktualisieren, um das hier einzuschalten';

  @override
  String get permTurnOn => 'Einschalten';

  @override
  String get permOpenSettings => 'Einstellungen öffnen';

  @override
  String get permOpenHealth => 'Health öffnen';

  @override
  String get permHealthIosHow =>
      'Tippe in Health auf dein Bild, dann auf Apps, dann auf Casama und schalte ein, was deine Bots lesen dürfen.';

  @override
  String get permChoose => 'Auswählen';

  @override
  String get permRestart => 'Casama neu starten';

  @override
  String get permRestartToFinish => 'Casama zum Abschließen neu starten';

  @override
  String permOpenedOn(String device) {
    return 'Auf $device geöffnet';
  }

  @override
  String permSentTo(String device) {
    return 'An $device gesendet: Tippe dort auf die Mitteilung';
  }

  @override
  String permOffline(String device) {
    return '$device ist offline';
  }

  @override
  String permRestarting(String device) {
    return 'Casama wird auf $device neu gestartet';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Nur der Besitzer von $device kann diese einschalten';
  }

  @override
  String get permNotNowLine => 'Nicht jetzt';

  @override
  String get permContinue => 'Weiter';

  @override
  String get permContinueMessage => 'Sie sind an, mach weiter.';

  @override
  String get permContinuedLine => 'Eingeschaltet';

  @override
  String get permissionsScreenTitle => 'Berechtigungen';

  @override
  String get permissionsScreenHelp =>
      'Was Bots auf diesem Gerät nutzen können. Nichts wird angefragt, bevor du tippst.';

  @override
  String get permissionsRowHelp =>
      'Standort, Bildschirm, Mikrofon und mehr auf diesem Gerät';

  @override
  String permOtherDevice(String device) {
    return 'Das war für $device. Öffne Casama dort, um es einzuschalten.';
  }

  @override
  String get permAnotherDevice => 'ein anderes Gerät';

  @override
  String get permissionsNone =>
      'Auf diesem Gerät gibt es nichts einzuschalten.';

  @override
  String get widgetNeedsYou => 'Braucht dich';

  @override
  String get widgetAllClear => 'Alles erledigt';

  @override
  String get widgetAllow => 'Erlauben';

  @override
  String get widgetDeny => 'Ablehnen';

  @override
  String get widgetReview => 'Prüfen';

  @override
  String get widgetOpen => 'Öffnen';

  @override
  String get widgetDoIt => 'Ausführen';

  @override
  String get widgetRunNow => 'Jetzt ausführen';

  @override
  String get widgetStarted => 'Gestartet';

  @override
  String get widgetStop => 'Stoppen';

  @override
  String get widgetAsk => 'Fragen';

  @override
  String widgetAskBot(String bot) {
    return '$bot fragen';
  }

  @override
  String get widgetTalk => 'Sprechen';

  @override
  String get widgetTry => 'Ausprobieren';

  @override
  String get widgetUpNext => 'Als Nächstes';

  @override
  String get widgetNoRoutines => 'Noch keine Routinen';

  @override
  String get widgetWorking => 'Arbeitet';

  @override
  String get widgetWaiting => 'Wartet auf dich';

  @override
  String get widgetIdle => 'Inaktiv';

  @override
  String widgetRepliedAt(String time) {
    return 'Antwort um $time';
  }

  @override
  String get widgetBrief => 'Briefing';

  @override
  String widgetBriefAt(String time) {
    return 'Briefing um $time';
  }

  @override
  String get widgetNoBrief => 'Noch kein Briefing';

  @override
  String get widgetToday => 'Heute';

  @override
  String get widgetCredits => 'Credits';

  @override
  String widgetCreditsLeft(String amount) {
    return '$amount übrig';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount heute';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n % genutzt';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Reset um $time';
  }

  @override
  String get widgetFinished => 'Fertig';

  @override
  String get widgetLibrary => 'Bibliothek';

  @override
  String get widgetNoCreations => 'Noch nichts erstellt';

  @override
  String get widgetTasks => 'Aufgaben';

  @override
  String get widgetTodo => 'Offen';

  @override
  String get widgetInProgress => 'In Arbeit';

  @override
  String get widgetInReview => 'In Prüfung';

  @override
  String get widgetBlocked => 'Blockiert';

  @override
  String get widgetSignIn => 'Casama öffnen zum Anmelden';

  @override
  String get widgetNoBots => 'Lerne deinen ersten Bot kennen';

  @override
  String widgetAsOf(String time) {
    return 'Stand $time';
  }

  @override
  String get widgetUpdateServer =>
      'Aktualisiere deinen Casama-Server, um dieses Widget zu nutzen';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot braucht dein OK';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot schlägt vor';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot möchte, dass du übernimmst';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Nächstes Briefing $time';
  }

  @override
  String get widgetNothingNext => 'Nichts geplant';

  @override
  String get widgetsTitle => 'Widgets';

  @override
  String get widgetsRow => 'Deine Bots auf Home- und Sperrbildschirm';

  @override
  String get widgetsIntro =>
      'Widgets zeigen, was deine Bots tun und was auf dich wartet, ohne Casama zu öffnen.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Routinen';

  @override
  String get widgetDescNeedsYou => 'Sehen, welche Bots auf dich warten';

  @override
  String get widgetDescBot => 'Sehen, was ein Bot gerade macht';

  @override
  String get widgetDescAsk =>
      'Mit einem Tippen einen Bot fragen oder mit ihm sprechen';

  @override
  String get widgetDescRoutines =>
      'Sehen, was als Nächstes läuft, und sofort ausführen';

  @override
  String get widgetDescToday =>
      'Deinen ganzen Tag auf einem großen Widget sehen';

  @override
  String get widgetDescBrief => 'Dein Morgen-Briefing lesen';

  @override
  String get widgetDescLibrary =>
      'Sehen, was deine Bots zuletzt erstellt haben';

  @override
  String get widgetDescTasks => 'Stand des Aufgabenboards ansehen';

  @override
  String get widgetDescCredits => 'Deine Credits im Blick behalten';

  @override
  String get widgetsAddToHome => 'Zum Home-Bildschirm hinzufügen';

  @override
  String get widgetsPinUnsupported =>
      'Dein Launcher kann von hier aus keine Widgets hinzufügen. Halte eine freie Stelle auf dem Home-Bildschirm gedrückt, tippe auf Widgets und wähle Casama.';

  @override
  String get widgetsHowToAdd => 'So fügst du es hinzu';

  @override
  String get widgetsHowToIos =>
      'Halte eine freie Stelle auf dem Home-Bildschirm gedrückt, tippe auf Bearbeiten, dann auf Widget hinzufügen und wähle Casama.';

  @override
  String get widgetsHowToMac =>
      'Klicke auf Datum und Uhrzeit in der Menüleiste, dann auf Widgets bearbeiten und wähle Casama. Oder rechtsklicke auf den Schreibtisch und wähle Widgets bearbeiten.';

  @override
  String get widgetsLockScreen => 'Sperrbildschirm und Steuerelemente';

  @override
  String get widgetsLockScreenHelp =>
      'Halte den Sperrbildschirm gedrückt, tippe auf Anpassen, dann auf Sperrbildschirm und tippe auf den Bereich unter der Uhr, um „Braucht dich“, „Als Nächstes“, „Bot“ oder „Credits“ hinzuzufügen. Eine Anfrage bleibt verborgen, bis du entsperrst.';

  @override
  String get widgetsControlsHelp =>
      'Öffne das Kontrollzentrum, halte es gedrückt, tippe auf „Steuerelement hinzufügen“ und wähle „Casama fragen“, „Mit einem Bot sprechen“ oder „Routine ausführen“. Sie passen auch in die Ecken des Sperrbildschirms und auf die Aktionstaste.';

  @override
  String get widgetsShowDetails => 'Details in Widgets anzeigen';

  @override
  String get widgetsShowDetailsHelp =>
      'Bei aktiver App-Sperre zeigen Widgets nur Zahlen und Bot-Namen, und ihre Tasten öffnen Casama. Schalte dies ein, um auch Anfragen, Nachrichten und Routinennamen zu zeigen.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Spielt nur eine Rolle, solange die App-Sperre aktiv ist. Ohne sie zeigen Widgets Details.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace erfordert die App-Sperre, daher halten Widgets Details verborgen.';
  }

  @override
  String get widgetsPinBot => 'Bot auf dem Home-Bildschirm anheften';

  @override
  String get widgetsPinBotHelp =>
      'Legt den Bot als eigenes Symbol auf deinen Home-Bildschirm. Tippe darauf, um zu chatten.';

  @override
  String get widgetsPin => 'Anheften';

  @override
  String get widgetNudgeNeedsYou =>
      'Beantworte Anfragen direkt vom Home-Bildschirm mit dem Widget „Braucht dich“.';

  @override
  String get widgetNudgeRoutines =>
      'Führe Routinen vom Home-Bildschirm mit dem Widget „Routinen“ aus.';

  @override
  String get widgetNameCanvas => 'Leinwand';

  @override
  String get widgetDescCanvas =>
      'Zeigt an, was deine Bots dort ablegen, wie einen Tagesvers oder einen Countdown';

  @override
  String get canvasEmpty => 'Bitte einen Bot, hier etwas abzulegen';

  @override
  String get canvasTry =>
      'Versuch: Zeige einen Tagesvers auf meinem Sperrbildschirm';

  @override
  String get canvasAutomatic => 'Automatisch';

  @override
  String canvasIn(String time) {
    return 'in $time';
  }

  @override
  String canvasSince(String time) {
    return 'vor $time';
  }

  @override
  String get canvasNow => 'Jetzt';

  @override
  String canvasLeft(String n) {
    return 'noch $n';
  }

  @override
  String get canvasLeftUnit => 'übrig';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tage',
      one: 'Tag',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widgets';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot möchte das in deinen Widgets anzeigen';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Sobald du zustimmst, kann $bot es ohne Rückfrage ändern. Du kannst das jederzeit unter Einstellungen, Widgets stoppen.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot hat das in deinen Widgets abgelegt';
  }

  @override
  String get canvasShow => 'In meinen Widgets anzeigen';

  @override
  String get canvasShowing => 'Wird in deinen Widgets angezeigt';

  @override
  String canvasNotShown(String bot) {
    return 'Nicht angezeigt. $bot kann an einem anderen Tag erneut fragen.';
  }

  @override
  String get canvasGone => 'Nicht mehr in deinen Widgets';

  @override
  String get canvasNotPlaced =>
      'Füge das Leinwand-Widget hinzu, um es zu sehen.';

  @override
  String get canvasHowToIos =>
      'Halte Home- oder Sperrbildschirm gedrückt, tippe auf Bearbeiten, dann auf Widget hinzufügen und wähle Casama, dann Leinwand.';

  @override
  String get canvasHowToMac =>
      'Klicke mit der rechten Maustaste auf den Schreibtisch, wähle Widgets bearbeiten und wähle Casama, dann Leinwand.';

  @override
  String get canvasHowToElsewhere =>
      'Füge das Leinwand-Widget von Casama auf deinem Telefon oder Mac hinzu, um es dort zu sehen.';

  @override
  String get canvasAdded => 'Leinwand-Widget hinzugefügt';

  @override
  String get canvasLockScreen => 'Auf dem Sperrbildschirm';

  @override
  String get widgetsFromBots => 'Von deinen Bots';

  @override
  String get widgetsFromBotsEmpty =>
      'Noch nichts. Bitte einen Bot zum Beispiel: „Zeige einen Tagesvers auf meinem Sperrbildschirm“.';

  @override
  String canvasSetAt(String time) {
    return 'Festgelegt $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Wird angezeigt auf $devices';
  }

  @override
  String get canvasNoWidget => 'Noch kein Leinwand-Widget platziert';

  @override
  String get canvasPausedLine => 'Pausiert';

  @override
  String get canvasWaitingLine => 'Wartet auf dein Ja';

  @override
  String get canvasHideLocked => 'Auf gesperrtem Telefon verbergen';

  @override
  String get canvasPause => 'Pausieren';

  @override
  String get canvasResume => 'Fortsetzen';

  @override
  String get canvasClear => 'Leeren';

  @override
  String canvasClearTitle(String name) {
    return '$name leeren?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Es wird aus deinen Widgets entfernt. $bot kann dort wieder etwas ablegen.';
  }

  @override
  String get canvasAllowedBots => 'Bots in deinen Widgets';

  @override
  String get canvasMayShow => 'Darf Dinge in deinen Widgets anzeigen';

  @override
  String canvasStopTitle(String bot) {
    return '$bot stoppen?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'Was $bot in deinen Widgets zeigt, wird geleert, und er muss erneut fragen.';
  }

  @override
  String get canvasStop => 'Stoppen';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Android-Telefon';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Zeigen';

  @override
  String get widgetLowRisk => 'Geringes Risiko';

  @override
  String get widgetThisMonth => 'Diesen Monat';

  @override
  String get watchNow => 'Jetzt';

  @override
  String get watchAsk => 'Fragen';

  @override
  String watchAskBot(String bot) {
    return '$bot fragen';
  }

  @override
  String get watchBots => 'Bots';

  @override
  String get watchUpNext => 'Als Nächstes';

  @override
  String get watchBrief => 'Briefing';

  @override
  String get watchSettings => 'Einstellungen';

  @override
  String get watchChat => 'Chat';

  @override
  String get watchTalk => 'Sprechen';

  @override
  String get watchCredits => 'Credits';

  @override
  String get watchNeedsYou => 'Braucht dich';

  @override
  String get watchNeedsYouOne => '1 braucht dich';

  @override
  String watchNeedsYouMany(String count) {
    return '$count brauchen dich';
  }

  @override
  String get watchNeedsOk => 'Braucht dein OK';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot braucht dein OK';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot schlägt vor';
  }

  @override
  String get watchTakeOver => 'Möchte, dass du übernimmst';

  @override
  String get watchAllClear => 'Alles erledigt';

  @override
  String get watchNothingWaiting => 'Nichts braucht dich';

  @override
  String get watchAllow => 'Erlauben';

  @override
  String get watchDeny => 'Ablehnen';

  @override
  String get watchHoldToAllow => 'Halten zum Erlauben';

  @override
  String get watchHoldHint => 'Erlauben? Zum Erlauben doppelt tippen.';

  @override
  String get watchReview => 'Prüfen';

  @override
  String get watchReviewOnIphone => 'Auf dem iPhone prüfen';

  @override
  String get watchReviewOnPhone => 'Auf dem Telefon prüfen';

  @override
  String get watchWhyHighRisk => 'Hohes Risiko: auf deinem Telefon beantworten';

  @override
  String get watchWhyPayment =>
      'Zahlungen werden auf deinem Telefon beantwortet';

  @override
  String get watchWhySetting =>
      'Deine Einstellungen behalten das auf deinem Telefon';

  @override
  String get watchWhyWorkspace =>
      'Dein Workspace behält das auf deinem Telefon';

  @override
  String get watchWhyNotYours =>
      'Nur die Person, die diesen Chat gestartet hat, darf dies erlauben';

  @override
  String get watchHighRisk => 'Hohes Risiko';

  @override
  String get watchMediumRisk => 'Mittleres Risiko';

  @override
  String get watchLowRisk => 'Geringes Risiko';

  @override
  String get watchAllowed => 'Erlaubt';

  @override
  String get watchDenied => 'Abgelehnt';

  @override
  String get watchDone => 'Fertig';

  @override
  String get watchAlreadyAnswered => 'Bereits beantwortet';

  @override
  String get watchLockToAllow =>
      'Richte auf dieser Watch einen Code ein, um von hier zu erlauben';

  @override
  String get watchDoIt => 'Ausführen';

  @override
  String get watchNotNow => 'Nicht jetzt';

  @override
  String get watchOpenOnIphone => 'Auf dem iPhone öffnen';

  @override
  String get watchOpenOnPhone => 'Am Telefon öffnen';

  @override
  String get watchSentToPhone => 'An dein Telefon gesendet';

  @override
  String get watchWorking => 'Arbeitet';

  @override
  String watchIsWorking(String bot) {
    return '$bot arbeitet';
  }

  @override
  String get watchWaitingForYou => 'Wartet auf dich';

  @override
  String watchRepliedAt(String time) {
    return 'Antwort um $time';
  }

  @override
  String get watchIdle => 'Inaktiv';

  @override
  String get watchOff => 'Aus';

  @override
  String watchStepCount(String count) {
    return 'Schritt $count';
  }

  @override
  String get watchStop => 'Stoppen';

  @override
  String get watchStopped => 'Gestoppt';

  @override
  String get watchFinished => 'Fertig';

  @override
  String get watchProblem => 'Mit Problem gestoppt';

  @override
  String get watchCouldntFinish => 'Nicht abgeschlossen';

  @override
  String get watchListening => 'Hört zu…';

  @override
  String get watchTapToStop => 'Zum Stoppen tippen';

  @override
  String get watchTypeInstead => 'Stattdessen tippen';

  @override
  String get watchSending => 'Wird gesendet…';

  @override
  String get watchHeard => 'Gehört';

  @override
  String get watchUndo => 'Rückgängig';

  @override
  String get watchKeptOffline =>
      'Gespeichert. Wird gesendet, sobald du wieder online bist';

  @override
  String watchKeptOld(String time) {
    return 'Senden, was du um $time gefragt hast?';
  }

  @override
  String get watchSend => 'Senden';

  @override
  String get watchDiscard => 'Verwerfen';

  @override
  String get watchMicDenied =>
      'Erlaube das Mikrofon in den Einstellungen, um per Sprache zu fragen';

  @override
  String get watchNoDictation =>
      'Dieser Server hat keinen Sprachdienst. Nutze stattdessen Tippen';

  @override
  String get watchDidntCatch => 'Nicht verstanden. Erneut versuchen';

  @override
  String get watchReply => 'Antworten';

  @override
  String get watchReadAloud => 'Vorlesen';

  @override
  String get watchStopReading => 'Vorlesen stoppen';

  @override
  String get watchContinuesOnIphone => 'Weiter auf dem iPhone';

  @override
  String get watchContinuesOnPhone => 'Weiter auf dem Telefon';

  @override
  String get watchReplyReady => 'Antwort bereit';

  @override
  String get watchYou => 'Du';

  @override
  String get watchQuickYes => 'Ja';

  @override
  String get watchQuickNo => 'Nein';

  @override
  String get watchQuickTellMore => 'Erzähl mir mehr';

  @override
  String get watchQuickNotNow => 'Nicht jetzt';

  @override
  String get watchRunNow => 'Jetzt ausführen';

  @override
  String get watchStarted => 'Gestartet';

  @override
  String watchInMinutes(String minutes) {
    return 'in $minutes Min.';
  }

  @override
  String get watchNoRoutines => 'Noch keine Routinen';

  @override
  String watchBriefAt(String time) {
    return 'Briefing um $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Briefing morgen um $time';
  }

  @override
  String get watchNoBrief => 'Kein Briefing eingerichtet';

  @override
  String get watchNoBots =>
      'Noch keine Bots. Erstelle einen auf deinem Telefon';

  @override
  String get watchSigningIn => 'Du wirst angemeldet';

  @override
  String watchSignedInAs(String name) {
    return 'Angemeldet als $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Öffne Casama auf dem iPhone zum Abschließen';

  @override
  String get watchOpenPhoneToFinish =>
      'Öffne Casama auf dem Telefon zum Abschließen';

  @override
  String get watchUseCode => 'Mit Code anmelden';

  @override
  String get watchCodeHelp =>
      'Gib ihn in Casama auf deinem Telefon oder Computer ein: Einstellungen → Watch';

  @override
  String get watchNewCode => 'Neuer Code';

  @override
  String get watchSignedOut => 'Diese Watch ist abgemeldet';

  @override
  String get watchOpenToSignIn => 'Casama öffnen zum Anmelden';

  @override
  String watchAsOf(String time) {
    return 'Stand $time';
  }

  @override
  String get watchOffline => 'Offline';

  @override
  String get watchCouldntReach => 'Casama nicht erreichbar';

  @override
  String get watchTryAgain => 'Erneut versuchen';

  @override
  String get watchServerTooOld =>
      'Aktualisiere deinen Casama-Server, um die Watch zu nutzen';

  @override
  String get watchOutOfCredits => 'Keine Credits mehr';

  @override
  String get watchTalkOnPhone => 'Starte den Anruf auf deinem Telefon';

  @override
  String get watchSignOut => 'Von dieser Watch abmelden';

  @override
  String get watchHideDetails =>
      'Details verbergen, wenn mein Handgelenk gesenkt ist';

  @override
  String get watchReadRepliesAloud => 'Antworten vorlesen';

  @override
  String get watchAskUses => 'Bot für „Fragen“';

  @override
  String get watchWorkspace => 'Workspace';

  @override
  String get watchSignedInAsLabel => 'Angemeldet als';

  @override
  String get watchCompNeedsYou => 'Braucht dich';

  @override
  String get watchCompAsk => 'Bot fragen';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'Als Nächstes';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou =>
      'Wie viele Anfragen warten und die erste davon';

  @override
  String get watchCompDescAsk =>
      'Einen Bot per Sprache mit einem Tippen fragen';

  @override
  String get watchCompDescBot => 'Wo ein Bot steht und was er gerade tut';

  @override
  String get watchCompDescUpNext => 'Die nächste Routine und wann sie läuft';

  @override
  String get watchCompDescCredits => 'Genutzte Credits in diesem Zeitraum';

  @override
  String get watchNeedYouShort => 'brauchen dich';

  @override
  String get watchControlAsk => 'Casama fragen';

  @override
  String get watchControlTalk => 'Mit Bot sprechen';

  @override
  String get watchControlRun => 'Routine ausführen';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count brauchen dich. Zuerst: $text';
  }

  @override
  String get watchPhoneTitle => 'Watch';

  @override
  String get watchPhoneIntro =>
      'Antworte Bots, frage per Sprache und sieh, wer arbeitet – direkt am Handgelenk.';

  @override
  String get watchPhoneWatches => 'Angemeldete Uhren';

  @override
  String get watchPhoneNone =>
      'Noch keine Watch angemeldet. Öffne Casama auf der Watch, und sie meldet sich selbst an.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Zuletzt verwendet $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Noch nicht verwendet';

  @override
  String get watchPhoneRemove => 'Entfernen';

  @override
  String watchPhoneRemoveTitle(String name) {
    return '$name entfernen?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Sie wird sofort abgemeldet. Du kannst sie später erneut anmelden.';

  @override
  String get watchPhoneUseCode => 'Watch mit Code anmelden';

  @override
  String get watchPhoneCodeHint => 'Der Code auf deiner Watch';

  @override
  String watchPhoneCodeAsk(String name) {
    return '$name anmelden?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Sie wird als du bei $workspace angemeldet. Erlaube nur einen Code, der auf deiner eigenen Watch steht.';
  }

  @override
  String get watchPhoneCodeAllow => 'Anmelden';

  @override
  String get watchPhoneCodeWrong =>
      'Dieser Code hat nicht funktioniert. Prüfe ihn auf deiner Watch';

  @override
  String get watchPhoneCodeTaken =>
      'Diese Watch ist noch bei einem anderen Konto angemeldet. Entferne sie dort unter Einstellungen → Watch und hole dann einen neuen Code';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Angemeldet bei $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'In einem anderen Workspace angemeldet';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name ist angemeldet';
  }

  @override
  String get watchPhoneAllowTitle => 'Von der Watch aus erlauben';

  @override
  String get watchPhoneAllowMedium => 'Geringes und mittleres Risiko';

  @override
  String get watchPhoneAllowMediumBody =>
      'Geringes Risiko mit einem Tippen, mittleres Risiko durch Gedrückthalten. Hohes Risiko und Zahlungen brauchen immer dein Telefon.';

  @override
  String get watchPhoneAllowLow => 'Nur geringes Risiko';

  @override
  String get watchPhoneAllowNone => 'Nie';

  @override
  String get watchPhoneDetails => 'Details auf der Watch anzeigen';

  @override
  String get watchPhoneDetailsBody =>
      'Aus: Die Watch zeigt Zähler und Bot-Namen, nicht, was Bots geschrieben haben.';

  @override
  String get watchPhoneQuickReplies => 'Schnellantworten';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Kurze Antworten, die du aus einer Benachrichtigung senden kannst. Bis zu sechs.';

  @override
  String get watchPhoneQuickAdd => 'Schnellantwort hinzufügen';

  @override
  String get watchPhoneQuickReset => 'Integrierte Antworten nutzen';

  @override
  String get watchPhoneHowTo => 'Casama zum Zifferblatt hinzufügen';

  @override
  String get watchPhoneHowToApple =>
      'Halte dein Zifferblatt gedrückt, tippe auf Bearbeiten und wähle Casama als Komplikation. Drehe die Digital Crown auf dem Zifferblatt, um Casama im Smart Stapel zu finden.';

  @override
  String get watchPhoneHowToWear =>
      'Halte dein Zifferblatt gedrückt, um eine Casama-Komplikation hinzuzufügen. Wische vom Zifferblatt nach links und tippe auf +, um eine Casama-Kachel hinzuzufügen.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return '$name wird angemeldet…';
  }

  @override
  String get watchPhoneLockAsk => 'Deine Watch anmelden?';

  @override
  String get watchPhoneNudge =>
      'Casama ist auch auf deiner Watch. Antworte Bots vom Handgelenk aus.';

  @override
  String get watchPhoneHandoffTitle => 'Von deiner Watch';

  @override
  String get watchPhoneRow =>
      'Deine Bots auf deiner Apple Watch oder Wear OS Watch';

  @override
  String get watchPhoneAllowLowBody =>
      'Geringes Risiko mit einem Tippen. Alles andere braucht dein Telefon.';

  @override
  String get watchPhoneAllowNoneBody =>
      'Die Watch kann nur ablehnen. Erlaube auf deinem Telefon.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Ausgeschaltet, weil die App-Sperre aktiv ist – deine Watch zeigt daher keine Wörter aus deinen Chats. Schalte es ein, um sie zu sehen.';

  @override
  String get watchPhoneQuickHint => 'Eine kurze Antwort';

  @override
  String get watchPhoneQuickTooLong => 'Bis zu 40 Zeichen';

  @override
  String get watchPhoneQuickMoveUp => 'Nach oben';

  @override
  String get watchPhoneQuickMoveDown => 'Nach unten';

  @override
  String get watchPhoneQuickDelete => 'Diese Antwort löschen';

  @override
  String get watchPhoneCodeBody =>
      'Öffne Casama auf der Watch und wähle „Mit Code anmelden“.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => 'Wer arbeitet und was er tut';

  @override
  String get watchCompDescBrief => 'Das heutige Morgen-Briefing';

  @override
  String get watchCodeWaiting => 'Warten auf den Code…';

  @override
  String watchCodeA11y(String code) {
    return 'Anmeldecode $code';
  }

  @override
  String get watchChooseBot => 'Bot auswählen';

  @override
  String get watchChannelRequests => 'Anfragen';

  @override
  String get watchChannelReplies => 'Antworten';

  @override
  String get watchChannelRuns => 'Arbeitende Bots';

  @override
  String get watchChannelOther => 'Sonstiges';

  @override
  String get watchOtherWorkspace =>
      'Dies ist in einem anderen Workspace. Beantworte es auf deinem Telefon';

  @override
  String get watchReplySent => 'Gesendet';

  @override
  String get watchReplyNotSent => 'Deine Antwort konnte nicht gesendet werden';

  @override
  String watchAskDropped(String time) {
    return 'Konnte nicht senden, was du um $time gefragt hast';
  }

  @override
  String get watchNeedsHttps =>
      'Diese Watch erreicht deinen Server nur über https oder in deinem Heimnetzwerk';

  @override
  String get watchSignIn => 'Anmelden';

  @override
  String get watchNotOnWatch =>
      'Diese Watch kann dies nicht beantworten. Öffne es auf deinem Telefon';

  @override
  String watchMoreOnPhone(String count) {
    return '$count weitere auf deinem Telefon';
  }

  @override
  String get watchShareCrashReports => 'Absturzberichte teilen';

  @override
  String get showList => 'Liste anzeigen';

  @override
  String get hideList => 'Liste verbergen';

  @override
  String get panePickLibrary =>
      'Wähle etwas aus der Bibliothek aus, um es hier zu sehen.';

  @override
  String get panePickSetting =>
      'Wähle eine Einstellung aus, um sie hier zu sehen.';

  @override
  String get trackpad => 'Trackpad';

  @override
  String get trackpadHint =>
      'Ein Finger bewegt den Zeiger, zwei scrollen, ein Tippen klickt.';

  @override
  String get trackpadTakeControl =>
      'Steuerung übernehmen, um das Trackpad zu nutzen.';

  @override
  String get foldScreenTitle => 'Faltbildschirm';

  @override
  String get foldRowHelp =>
      'Was Casama von den Bildschirmen dieses Geräts sieht';

  @override
  String get foldScreenHelp =>
      'Wie dieses Gerät gehalten wird und wo sein Knick liegt, wie Casama es jetzt sieht. Öffne, schließe oder falte das Gerät und die Werte folgen. Kopiere sie, wenn eine Ansicht falsch aussieht.';

  @override
  String get foldPose => 'Position';

  @override
  String get foldWindow => 'Fenster';

  @override
  String get foldInsets => 'Sicherer Bereich';

  @override
  String get foldStrip => 'Seitenstreifen';

  @override
  String get foldFold => 'Falte';

  @override
  String get foldHinge => 'Scharnier';

  @override
  String get foldSystemSays => 'Was das System meldet';

  @override
  String get inviteGateLine => 'Casama Cloud ist vorerst nur auf Einladung.';

  @override
  String get inviteGateSelfHost =>
      'Casama auf dem eigenen Server auszuführen steht allen offen.';

  @override
  String get joinTheWaitlist => 'Auf die Warteliste';

  @override
  String get iHaveAnInvite => 'Ich habe eine Einladung';

  @override
  String get waitlistSubtitle =>
      'Wir lassen nach und nach neue Leute rein. Du bekommst eine E-Mail, sobald du dran bist.';

  @override
  String get waitlistNote => 'Was würdest du einen Bot als Erstes tun lassen?';

  @override
  String get waitlistNoteHint => 'Optional';

  @override
  String get waitlistSelfHosting =>
      'Ich betreibe Casama auf meinem eigenen Server';

  @override
  String get waitlistNewsletter =>
      'Ich möchte auch die monatliche E-Mail von Casama erhalten (höchstens einmal im Monat)';

  @override
  String get waitlistAppleRelay =>
      'Dies ist die private Adresse, die Apple für dich erstellt hat. Behalte sie, wenn du dich mit Apple anmeldest; Apple leitet unsere E-Mail an deinen Posteingang weiter.';

  @override
  String get waitlistJoinedTitle => 'Du stehst auf der Liste.';

  @override
  String get waitlistJoinedBody =>
      'Wir lassen nach und nach neue Leute rein. Du bekommst eine E-Mail, sobald du dran bist, und sonst nichts, außer du hast die monatliche E-Mail gewünscht. Kennst du jemanden, der Casama nutzt? Eine Einladung von dieser Person bringt dich sofort rein.';

  @override
  String get waitlistJoinedCode =>
      'Hast du einen Einladungscode? Gib ihn hier ein.';

  @override
  String get waitlistJoinedSelfHost =>
      'Du willst nicht warten? Casama ist Open Source. Betreibe es noch heute auf deinem eigenen Computer.';

  @override
  String get waitlistRunItYourself => 'Selbst betreiben';

  @override
  String get inviteSubtitle =>
      'Gib deinen Einladungscode ein oder füge den Einladungslink ein.';

  @override
  String get inviteCodeLabel => 'Einladungscode';

  @override
  String get inviteNotFound =>
      'Dieser Code passt zu keiner Einladung. Prüfe ihn und versuche es erneut.';

  @override
  String inviteFromName(String name) {
    return '$name hat dich zu Casama eingeladen';
  }

  @override
  String get inviteFromFriend => 'Ein Freund hat dich zu Casama eingeladen';

  @override
  String inviteFromCampaign(String label) {
    return 'Deine Einladung: $label';
  }

  @override
  String get inviteFromCasama => 'Deine Einladung zu Casama';

  @override
  String get inviteChooseSignIn =>
      'Wähle nun, wie du dich anmeldest. Nutze die Adresse, die du für dein Konto möchtest.';

  @override
  String get inviteGoneHelp =>
      'Diese Einladungen sind vergeben. Gib deine E-Mail-Adresse ein und du kommst ganz nach vorn auf die Warteliste.';

  @override
  String get inviteEmailHelp =>
      'Wir lassen diese Adresse rein und senden ihr dann einen Anmeldelink.';

  @override
  String inviteCheckInbox(String email) {
    return 'Du bist drin. Prüfe $email auf einen Anmeldelink oder gib dessen Code hier ein.';
  }

  @override
  String get inviteWaitlistedTitle => 'Du stehst auf der Warteliste';

  @override
  String get inviteWaitlisted =>
      'Diese Einladungen sind vergeben, aber du stehst ganz vorn in der Reihe.';

  @override
  String get inviteUseEmailHere =>
      'Nutze auf diesem Gerät „Mit E-Mail fortfahren“. Apple und Google funktionieren mit einer Einladung in den iPhone-, Mac- und Android-Apps.';

  @override
  String get inviteDifferentCode => 'Anderen Code verwenden';

  @override
  String get inviteRefusedHelp =>
      'Trage dich in die Warteliste ein und wir mailen dir, wenn du dran bist, oder gib einen Einladungscode ein, falls du einen hast.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud ist vorerst nur auf Einladung. Wir mailen dir, wenn du dran bist. Hast du einen Einladungscode? Nutze ihn jetzt.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einladungen übrig',
      one: '1 Einladung übrig',
      zero: 'Keine Einladungen übrig',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used von $total verwendet. Mit jeder kann jemand ein Konto erstellen.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Deine Einladungen schalten sich nach deinem ersten abgeschlossenen Chat frei.';

  @override
  String get inviteWaitingTitle => 'Wartet auf deine Einladung';

  @override
  String get inviteWaitingUses =>
      'Reinlassen verbraucht eine deiner Einladungen.';

  @override
  String get inviteWaitingNoneLeft =>
      'Du bekommst eine Einladung zurück, sobald jemand, den du eingeladen hast, seinen ersten Chat abschließt.';

  @override
  String get inviteWaitingLetIn => 'Reinlassen';

  @override
  String inviteWaitingLetInLabel(String email) {
    return '$email reinlassen';
  }

  @override
  String get inviteWaitingDone =>
      'Sie erhalten in ein paar Minuten eine E-Mail zur Anmeldung.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ich habe dir eine meiner $count Casama-Einladungen aufgehoben.',
      one: 'Ich habe dir meine Casama-Einladung aufgehoben.',
    );
    return '$_temp0 Casama ist vorerst nur auf Einladung, und damit bist du sofort drin: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ich habe dir eine meiner $count Casama-Einladungen aufgehoben.',
      one: 'Ich habe dir meine Casama-Einladung aufgehoben.',
    );
    return '$_temp0 Casama ist vorerst nur auf Einladung. Damit bist du sofort drin und bekommst nach deinem ersten Chat $amount kostenlose Nutzung: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Für wen ist sie?';

  @override
  String get inviteNameHelp =>
      'Füge den Vornamen hinzu, und die Einladungsseite begrüßt persönlich mit Namen. Du kannst das Feld auch leer lassen.';

  @override
  String get inviteNameHint => 'Vorname';

  @override
  String get inviteNameShare => 'Einladung teilen';

  @override
  String get inviteAskTitle => 'Wer würde das noch nutzen?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du hast $count Einladungen für Casama. Mit jeder ist jemand sofort drin.',
      one: 'Du hast 1 Einladung für Casama. Damit ist jemand sofort drin.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Nach dem ersten Chat bekommt ihr beide jeweils $amount kostenlose Nutzung.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Nach dem ersten Chat bekommst du $amount kostenlose Nutzung.';
  }

  @override
  String get inviteAskSend => 'Einladung senden';

  @override
  String get inviteAskNotNow => 'Nicht jetzt';

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
      other: '$count gespeicherte Resets',
      one: '1 gespeicherter Reset',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Einlösen bis $date';
  }

  @override
  String get savedResetUse => 'Reset nutzen';

  @override
  String get savedResetConfirmTitle => 'Diesen Reset nutzen?';

  @override
  String get savedResetConfirmDaily =>
      'Setzt das heutige Limit zurück, damit deine Bots heute weiterarbeiten können. Das lässt sich nicht rückgängig machen.';

  @override
  String get savedResetConfirmComputer =>
      'Gibt die Computerstunden dieses Monats zurück. Das lässt sich nicht rückgängig machen.';

  @override
  String get savedResetOwnerRequired =>
      'Nur ein Workspace-Inhaber kann ihn nutzen.';

  @override
  String get savedResetPaused =>
      'Vorerst pausiert. Schau später noch einmal vorbei.';

  @override
  String get savedResetPeriodLimit =>
      'Du hast den Reset dieses Zeitraums schon genutzt. Diesen kannst du im nächsten Zeitraum nutzen.';

  @override
  String get savedResetNothingToRefill =>
      'Noch nichts zum Auffüllen da. Heb ihn dir auf, bis es knapp wird.';

  @override
  String get savedResetNoBillingPeriod =>
      'Verfügbar, sobald dein Abo fertig eingerichtet ist.';

  @override
  String get savedResetUnavailable => 'Gerade nicht verfügbar.';

  @override
  String savedResetDone(String amount) {
    return 'Reset genutzt: $amount hinzugefügt';
  }

  @override
  String get savedResetDoneNoCredits => 'Reset genutzt';

  @override
  String savedResetConfirm(String amount) {
    return 'Füllt $amount der enthaltenen Credits dieses Zeitraums auf. Das lässt sich nicht rückgängig machen.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Gespeicherte Resets aktivieren';

  @override
  String get resetsOffNote => 'Aus: Niemand erhält gespeicherte Resets.';

  @override
  String get resetsDecrease => 'Weniger';

  @override
  String get resetsIncrease => 'Mehr';

  @override
  String get resetsSettings => 'Einstellungen';

  @override
  String get resetsCampaigns => 'Kampagnen';

  @override
  String get resetsStatLive => 'Live';

  @override
  String get resetsStatGiven => 'Vergeben';

  @override
  String get resetsStatUsed => 'Genutzt';

  @override
  String get resetsStatRefilled => 'Aufgefüllt';

  @override
  String get resetsFilterActive => 'Aktiv';

  @override
  String get resetsFilterEnded => 'Beendet';

  @override
  String get resetsFilterAll => 'Alle';

  @override
  String get resetsStateDraft => 'Entwurf';

  @override
  String get resetsStateScheduled => 'Geplant';

  @override
  String get resetsStateLive => 'Live';

  @override
  String get resetsStatePaused => 'Pausiert';

  @override
  String get resetsStateEnded => 'Beendet';

  @override
  String get resetsStateCancelled => 'Abgebrochen';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used von $budget Budget';
  }

  @override
  String resetsGivenN(String count) {
    return '$count vergeben';
  }

  @override
  String resetsUsedN(String count) {
    return '$count genutzt';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Startet $start · Endet $end';
  }

  @override
  String get resetsToday => 'heute';

  @override
  String get resetsTomorrow => 'morgen';

  @override
  String get resetsYesterday => 'gestern';

  @override
  String get resetsAudienceEveryone => 'Jeder Workspace';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Workspaces',
      one: '1 Workspace',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Beigetreten vor $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In den letzten $days Tagen ein Limit erreicht',
      one: 'Heute ein Limit erreicht',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Kampagne abbrechen';

  @override
  String get resetsCancelConfirm => 'Diese Kampagne abbrechen?';

  @override
  String get resetsCancelConfirmBody =>
      'Sie vergibt keine gespeicherten Resets mehr. Das lässt sich nicht rückgängig machen.';

  @override
  String get resetsDeleteConfirm => 'Diese Kampagne löschen?';

  @override
  String get resetsDeleteConfirmBody => 'Der Entwurf wird endgültig entfernt.';

  @override
  String get resetsNoCampaigns =>
      'Noch keine Kampagnen. Starte eine, um vielen Workspaces gleichzeitig gespeicherte Resets zu geben.';

  @override
  String get resetsNoMatches => 'Keine Kampagnen hier.';

  @override
  String get resetsEditCampaign => 'Kampagne bearbeiten';

  @override
  String get resetsSectionBasics => 'Grundlagen';

  @override
  String get resetsSectionAudience => 'Zielgruppe';

  @override
  String get resetsSectionTiming => 'Zeitplan';

  @override
  String get resetsSectionRefill => 'Auffüllung';

  @override
  String get resetsSectionWhat => 'Was zurückgesetzt wird';

  @override
  String get resetsSectionNotify => 'Benachrichtigungen';

  @override
  String get resetsPreviewLabel => 'Was andere sehen';

  @override
  String get resetsMonthly => 'Monatlich';

  @override
  String get resetsYearly => 'Jährlich';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Abos';

  @override
  String get resetsPlansHint =>
      'Keines ankreuzen, um jedes Abo einzuschließen.';

  @override
  String get resetsWorkspacesLabel => 'Workspaces';

  @override
  String get resetsWorkspacesHint =>
      'Leer lassen, um jeden Workspace einzuschließen.';

  @override
  String get resetsSearchWorkspaces => 'Workspaces nach Namen suchen';

  @override
  String get resetsNoWorkspaceMatch => 'Kein Workspace passt.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Nur $name';
  }

  @override
  String get resetsJoinedBefore => 'Beigetreten vor';

  @override
  String get resetsLimitedDaysLabel => 'Limit in den letzten N Tagen erreicht';

  @override
  String get resetsStartsLabel => 'Startet';

  @override
  String get resetsEndsLabel => 'Läuft ab';

  @override
  String resetsPercentValue(int percent) {
    return '$percent % der enthaltenen Credits auffüllen';
  }

  @override
  String get resetsCapLabel => 'Maximum pro Nutzung';

  @override
  String get resetsBudgetLabel => 'Gesamtbudget';

  @override
  String get resetsOptional => 'Optional';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Erreicht etwa $count Workspaces · $credits an Credits · kostet etwa $cost';
  }

  @override
  String get resetsEstimating => 'Reichweite wird berechnet…';

  @override
  String get resetsEstimateNeedsFields =>
      'Fülle die Felder aus, um die Reichweite zu sehen.';

  @override
  String get resetsLockedNote =>
      'Diese Kampagne läuft: Nur Nachricht, Ablaufdatum, Budget und Erinnerung können geändert werden.';

  @override
  String get resetsRequired => 'Erforderlich.';

  @override
  String get resetsTooLong => 'Höchstens 120 Zeichen.';

  @override
  String get resetsDaysInvalid => 'Gib 1 bis 365 Tage ein.';

  @override
  String get resetsMoneyInvalid => 'Gib 0 oder mehr ein.';

  @override
  String get resetsExpiryBeforeStart => 'Wähle ein Ende nach dem Start.';

  @override
  String resetsGivenTo(String name) {
    return 'Gespeicherter Reset an $name vergeben';
  }

  @override
  String get resetsCampaignSaved => 'Kampagne gespeichert';

  @override
  String get resetsDefaultMessage =>
      'Ein gespeicherter Reset – geht auf uns. Nutze ihn, wenn du ein Limit erreichst.';

  @override
  String resetsGiveName(String name) {
    return 'Gespeicherter Reset für $name';
  }

  @override
  String get resetsOneWorkspace => 'Ein Workspace';

  @override
  String get resetsPickWorkspace =>
      'Wähle einen Workspace aus, um seine gespeicherten Resets zu sehen.';

  @override
  String get resetsAllHistory => 'Gesamter Verlauf';

  @override
  String get resetsAllWorkspaces => 'Alle Workspaces';

  @override
  String get resetsNoEvents => 'Noch nichts hier.';

  @override
  String get resetsEventGiven => 'Gespeicherter Reset vergeben';

  @override
  String get resetsEventUsed => 'Gespeicherter Reset genutzt';

  @override
  String get resetsEventRevoked => 'Zurückgenommen';

  @override
  String get resetsEventUndone => 'Auffüllung rückgängig gemacht';

  @override
  String get resetsEventExpired => 'Ungenutzt abgelaufen';

  @override
  String get resetsEventCreated => 'Kampagne erstellt';

  @override
  String get resetsEventEdited => 'Kampagne bearbeitet';

  @override
  String get resetsEventStarted => 'Kampagne gestartet';

  @override
  String get resetsEventEnded => 'Kampagne beendet';

  @override
  String get resetsEventScheduled => 'Kampagne geplant';

  @override
  String get resetsEventPaused => 'Kampagne pausiert';

  @override
  String get resetsEventResumed => 'Kampagne fortgesetzt';

  @override
  String get resetsEventCancelled => 'Kampagne abgebrochen';

  @override
  String get resetsEventDeleted => 'Kampagne gelöscht';

  @override
  String get resetsEventSettings => 'Einstellungen geändert';

  @override
  String get resetsRevokeConfirm => 'Diesen gespeicherten Reset zurücknehmen?';

  @override
  String get resetsRevokeConfirmBody =>
      'Der Workspace verliert ihn vor der Nutzung.';

  @override
  String get resetsUndoConfirm => 'Diese Auffüllung rückgängig machen?';

  @override
  String get resetsUndoConfirmBody =>
      'Die hinzugefügten Credits werden wieder abgezogen.';

  @override
  String get resetsPerPeriod => 'Nutzungen pro Workspace und Zeitraum';

  @override
  String get resetsMaxHeld => 'Maximale gespeicherte Resets';

  @override
  String get resetsNotifyOwners => 'Instanzinhaber benachrichtigen';

  @override
  String get resetsNewCampaign => 'Neue Kampagne';

  @override
  String get resetsName => 'Name';

  @override
  String get resetsMessage => 'Nachricht an Personen';

  @override
  String get resetsPlans =>
      'Abo-Codes, mit Komma getrennt (leer bedeutet alle)';

  @override
  String get resetsWorkspaces =>
      'Workspace-IDs, mit Komma getrennt (leer bedeutet alle)';

  @override
  String get resetsBefore => 'Erstellt vor (Datum und Uhrzeit, optional)';

  @override
  String get resetsLimitedDays =>
      'Limit in den letzten N Tagen erreicht (optional)';

  @override
  String get resetsStart => 'Startet (Datum und Uhrzeit)';

  @override
  String get resetsExpiry => 'Läuft ab (Datum und Uhrzeit)';

  @override
  String get resetsPercent => 'Enthaltene Credits zum Auffüllen (%)';

  @override
  String get resetsCap => 'Maximaler Dollarbetrag pro Nutzung (optional)';

  @override
  String get resetsBudget => 'Gesamtes Credit-Budget in Dollar (optional)';

  @override
  String get resetsDaily => 'Heutiges Modell-Limit aufheben';

  @override
  String get resetsComputer => 'Computerstunden dieses Monats auffüllen';

  @override
  String get resetsArrival => 'Bei Ankunft benachrichtigen';

  @override
  String get resetsReminder => 'Vor Ablauf erinnern';

  @override
  String get resetsPreviewSave => 'Vorschau und speichern';

  @override
  String get resetsSchedule => 'Zeitplan';

  @override
  String get resetsPause => 'Pausieren';

  @override
  String get resetsResume => 'Fortsetzen';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Workspaces. Maximale Auffüllung: $credits. Geschätzte Kosten: $cost.',
      one:
          '1 Workspace. Maximale Auffüllung: $credits. Geschätzte Kosten: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace => 'Workspace-ID (leer für gesamten Verlauf)';

  @override
  String get resetsHistory => 'Verlauf laden';

  @override
  String get resetsGive => 'Gespeicherten Reset vergeben';

  @override
  String get resetsCopyCsv => 'CSV kopieren';

  @override
  String get resetsRevoke => 'Zurücknehmen';

  @override
  String get resetsUndo => 'Ungenutzte Auffüllung rückgängig machen';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => 'Anbieterdienste erfordern Aufmerksamkeit';

  @override
  String get vendorNotSetUp => 'Nicht eingerichtet';

  @override
  String get vendorCheckNow => 'Jetzt prüfen';

  @override
  String get vendorLimit => 'Limit oder Prepaid-Betrag';

  @override
  String get vendorWarnAt => 'Warnen bei';

  @override
  String get vendorExpiry => 'Läuft ab';

  @override
  String get vendorHistory => 'Letzte Werte';

  @override
  String get vendorSave => 'Speichern';

  @override
  String get vendorEnabled => 'Überwachung aktiv';

  @override
  String get vendorUnknown => 'Unbekannt';

  @override
  String get vendorLow => 'Niedrig';

  @override
  String get vendorOut => 'Leer';

  @override
  String get vendorOk => 'OK';

  @override
  String get vendorNoReading => 'Noch kein Messwert';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count erfordern Aufmerksamkeit',
      one: '1 erfordert Aufmerksamkeit',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count OK';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count nicht eingerichtet';
  }

  @override
  String get vendorNoVendors => 'Noch keine Dienste zu überwachen.';

  @override
  String get vendorCheckAll => 'Alle prüfen';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Prüfe $done von $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dienste geprüft',
      one: '1 Dienst geprüft',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Prüfungen fehlgeschlagen',
      one: '1 Prüfung fehlgeschlagen',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Erfordert Aufmerksamkeit';

  @override
  String get vendorGroupHealthy => 'Intakt';

  @override
  String get vendorGroupIdle => 'Nicht eingerichtet oder aus';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weitere anzeigen',
      one: '1 weiteren anzeigen',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Weniger anzeigen';

  @override
  String get vendorOff => 'Aus';

  @override
  String vendorPillPercent(String status, int percent) {
    return '$status · $percent %';
  }

  @override
  String vendorUsedOf(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String vendorLeft(String amount) {
    return '$amount übrig';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Warnt unter $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Zurückgesetzt $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Verlängert sich $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Abgelaufen am $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Minuten',
      one: 'in 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Stunden',
      one: 'in 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count Tagen',
      one: 'in 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Geprüft $when';
  }

  @override
  String get vendorSourceApi => 'Vom Dienst';

  @override
  String get vendorSourceOwnCount => 'Von Casama gezählt';

  @override
  String get vendorSourceManual => 'Manuell eingegeben';

  @override
  String vendorReadingError(String error) {
    return 'Letzte Prüfung fehlgeschlagen: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Füge seinen Schlüssel auf dem Server hinzu, um die Prüfung zu starten.';

  @override
  String get vendorOffHint => 'Überwachung ist ausgeschaltet.';

  @override
  String get vendorPickOne =>
      'Wähle einen Dienst aus, um seine Details zu sehen.';

  @override
  String get vendorSectionStatus => 'Status';

  @override
  String get vendorSectionActions => 'Aktionen';

  @override
  String get vendorSectionAlerts => 'Warnungen';

  @override
  String get vendorSectionPlan => 'Abo';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Warnen bei $percent % Nutzung';
  }

  @override
  String get vendorWarnAtHelp => 'Die Anzeige wird hier gelb.';

  @override
  String get vendorPeriod => 'Zeitraum';

  @override
  String get vendorPeriodNone => 'Nicht festgelegt';

  @override
  String get vendorPeriodDay => 'Täglich';

  @override
  String get vendorPeriodMonth => 'Monatlich';

  @override
  String get vendorPeriodBilling => 'Jeden Abrechnungszeitraum';

  @override
  String get vendorPeriodPrepaid => 'Prepaid';

  @override
  String get vendorDateNotSet => 'Nicht festgelegt';

  @override
  String get vendorClearDate => 'Datum löschen';

  @override
  String get vendorLimitInvalid => 'Gib eine Zahl über 0 ein.';

  @override
  String get vendorAmountInvalid => 'Gib 0 oder mehr ein.';

  @override
  String get vendorMonthsInvalid => 'Gib 1 bis 120 Monate ein.';

  @override
  String get vendorWarnAtInvalid => 'Wähle einen Punkt zwischen 1 % und 100 %.';

  @override
  String get vendorSaved => 'Einstellungen gespeichert';

  @override
  String get vendorCheckDone => 'Geprüft';

  @override
  String get vendorHistoryEmpty => 'Noch keine Messwerte.';

  @override
  String get vendorCheckFailed => 'Prüfung fehlgeschlagen';

  @override
  String get vendorResets => 'Zurücksetzungen';

  @override
  String get vendorSource => 'Quelle';

  @override
  String get vendorBilling => 'Abrechnung und Aufladung';

  @override
  String get vendorBalanceWarning => 'Unter Guthabenstand warnen';

  @override
  String get vendorPeriodStart => 'Zeitraum beginnt';

  @override
  String get vendorInvalidSettings =>
      'Gib ein positives Limit, eine Warnung zwischen 0 und 1 sowie gültige Daten ein.';

  @override
  String get card24hRange => '24-Stunden-Bereich';

  @override
  String get card52wRange => '52-Wochen-Bereich';

  @override
  String get cardAgain => 'Nochmal';

  @override
  String get cardAgoSuffix => 'zuvor';

  @override
  String get cardAirQuality => 'Luftqualität';

  @override
  String get cardAqiAdviceBad =>
      'Alle sollten lange oder starke Anstrengung im Freien reduzieren; Fenster geschlossen halten.';

  @override
  String get cardAqiAdviceGood => 'Toller Tag für draußen.';

  @override
  String get cardAqiAdviceModerate =>
      'Für die meisten in Ordnung; sehr empfindliche Personen sollten es ruhig angehen lassen.';

  @override
  String get cardAqiAdviceSensitive =>
      'Kinder, ältere Menschen und Personen mit Asthma sollten lange Anstrengung im Freien begrenzen.';

  @override
  String get cardAqiGood => 'Gut';

  @override
  String get cardAqiHazardous => 'Gefährlich';

  @override
  String get cardAqiModerate => 'Mäßig';

  @override
  String get cardAqiSensitive => 'Ungesund für empfindliche Gruppen';

  @override
  String get cardAqiUnhealthy => 'Ungesund';

  @override
  String get cardAqiVeryUnhealthy => 'Sehr ungesund';

  @override
  String get cardBaggage => 'Gepäck';

  @override
  String get cardCalcAmount => 'Betrag';

  @override
  String get cardCalcBill => 'Rechnung';

  @override
  String get cardCalcDiscount => 'Rabatt';

  @override
  String get cardCalcDiscountTitle => 'Rabatt';

  @override
  String get cardCalcGross => 'Mit Steuer';

  @override
  String get cardCalcGrowth => 'Wachstum';

  @override
  String get cardCalcInterest => 'Zinsen';

  @override
  String get cardCalcLoan => 'Kredit';

  @override
  String get cardCalcMonthly => 'Pro Monat';

  @override
  String get cardCalcMonthlyPayment => 'Monatliche Rate';

  @override
  String get cardCalcNet => 'Vor Steuern';

  @override
  String get cardCalcPeople => 'Personen';

  @override
  String get cardCalcPerPerson => 'Jede Person zahlt';

  @override
  String get cardCalcPrice => 'Preis';

  @override
  String get cardCalcPrincipal => 'Kapital';

  @override
  String get cardCalcRate => 'Jährlicher Zinssatz';

  @override
  String get cardCalcSavings => 'Ersparnis';

  @override
  String get cardCalcStart => 'Startbetrag';

  @override
  String get cardCalcTax => 'Steuer';

  @override
  String get cardCalcTaxIncluded => 'Inklusive Steuer';

  @override
  String get cardCalcTaxRate => 'Steuersatz';

  @override
  String get cardCalcTip => 'Trinkgeld';

  @override
  String get cardCalcTipAmount => 'Trinkgeld';

  @override
  String get cardCalcTipSplit => 'Trinkgeld und Aufteilung';

  @override
  String get cardCalcTotal => 'Gesamt';

  @override
  String get cardCalcTotalInterest => 'Gesamtzinsen';

  @override
  String get cardCalcTotalPaid => 'Insgesamt gezahlt';

  @override
  String get cardCalcUnits => 'Einheiten umrechnen';

  @override
  String get cardCalcValue => 'Wert';

  @override
  String get cardCalcVat => 'Steuer';

  @override
  String get cardCalcYears => 'Jahre';

  @override
  String get cardCalcYouPay => 'Du zahlst';

  @override
  String get cardCalcYouPutIn => 'Du zahlst ein';

  @override
  String get cardCalcYouSave => 'Du sparst';

  @override
  String get cardCall => 'Anruf';

  @override
  String get cardCaloriesWord => 'Kalorien';

  @override
  String get cardComparison => 'Vergleich';

  @override
  String get cardCondClear => 'Klar';

  @override
  String get cardCondCloudy => 'Bewölkt';

  @override
  String get cardCondDrizzle => 'Nieselregen';

  @override
  String get cardCondFog => 'Nebel';

  @override
  String get cardCondHail => 'Hagel';

  @override
  String get cardCondHeavyRain => 'Starker Regen';

  @override
  String get cardCondHeavySnow => 'Starker Schneefall';

  @override
  String get cardCondLightRain => 'Leichter Regen';

  @override
  String get cardCondLightSnow => 'Leichter Schneefall';

  @override
  String get cardCondMostlyClear => 'Überwiegend klar';

  @override
  String get cardCondPartlyCloudy => 'Teilweise bewölkt';

  @override
  String get cardCondRain => 'Regen';

  @override
  String get cardCondShowers => 'Schauer';

  @override
  String get cardCondSleet => 'Schneeregen';

  @override
  String get cardCondSnow => 'Schnee';

  @override
  String get cardCondThunder => 'Gewitter';

  @override
  String get cardCons => 'Nachteile';

  @override
  String get cardCopied => 'Kopiert';

  @override
  String get cardCopy => 'Als Text kopieren';

  @override
  String get cardCouldntUpdate => 'Konnte nicht aktualisiert werden';

  @override
  String get cardCurrency => 'Währung';

  @override
  String get cardDayLength => 'Tageslänge';

  @override
  String get cardDayRange => 'Tagesspanne';

  @override
  String get cardDays => 'Tage';

  @override
  String get cardDelay => 'Verspätung';

  @override
  String get cardDictionary => 'Wörterbuch';

  @override
  String get cardEmail => 'E-Mail';

  @override
  String get cardFlightCancelled => 'Gestrichen';

  @override
  String get cardFlightDiverted => 'Umgeleitet';

  @override
  String get cardFlightInAir => 'In der Luft';

  @override
  String get cardFlightIncident => 'Vorfall';

  @override
  String get cardFlightLanded => 'Gelandet';

  @override
  String get cardFlightScheduled => 'Planmäßig';

  @override
  String cardStaysFromNight(String price) {
    return 'ab $price pro Nacht';
  }

  @override
  String get cardStaysANight => 'pro Nacht';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Nächte',
      one: '1 Nacht',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Gäste',
      one: '1 Gast',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Zimmer',
      one: '1 Zimmer',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Beste';

  @override
  String get cardStaysSortCheapest => 'Günstigste';

  @override
  String get cardStaysSortTopRated => 'Bestbewertet';

  @override
  String get cardStaysSortClosest => 'Nächstgelegene';

  @override
  String get cardStaysFilterFreeCancel => 'Kostenlose Stornierung';

  @override
  String get cardStaysFilterBreakfast => 'Frühstück';

  @override
  String get cardStaysFilterPayAtHotel => 'Im Hotel zahlen';

  @override
  String get cardStaysFilterStars => 'Ab 4 Sternen';

  @override
  String get cardStaysFilterRated => 'Bewertung ab 8';

  @override
  String get cardStaysList => 'Liste';

  @override
  String get cardStaysMap => 'Karte';

  @override
  String get cardStaysEdit => 'Bearbeiten';

  @override
  String cardStaysRating(String value, String max) {
    return '$value von $max';
  }

  @override
  String cardStaysKm(String km) {
    return '$km km vom Zentrum';
  }

  @override
  String cardStaysStars(int n) {
    return '$n-Sterne';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price für $n Nächte',
      one: '$price für 1 Nacht',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n weitere Websites',
      one: '+1 weitere Website',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Angebot ansehen';

  @override
  String get cardStaysView => 'Ansehen';

  @override
  String cardStaysShowAll(int n) {
    return 'Alle $n anzeigen';
  }

  @override
  String get cardStaysShowFewer => 'Weniger anzeigen';

  @override
  String get cardStaysNone => 'Nichts passt zu diesen Filtern.';

  @override
  String get cardStaysNoMap =>
      'Keiner dieser Orte hat einen Punkt auf der Karte.';

  @override
  String get cardStaysNoDeals => 'Keine Preise für diese Daten.';

  @override
  String get cardStaysCheck =>
      'Der Preis wird auf der Buchungs-Website geprüft.';

  @override
  String cardStaysCompare(int n) {
    return 'Vergleichen ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Bis zu 4 zum Vergleichen auswählen';

  @override
  String get cardStaysComparePick => 'Zum Vergleichen auswählen';

  @override
  String get cardStaysCompareTitle => 'Vergleichen';

  @override
  String get cardStaysRowNight => 'Preis pro Nacht';

  @override
  String get cardStaysRowTotal => 'Gesamt';

  @override
  String get cardStaysRowRating => 'Bewertung';

  @override
  String get cardStaysRowStars => 'Sterne';

  @override
  String get cardStaysRowDistance => 'Entfernung';

  @override
  String get cardStaysYes => 'Ja';

  @override
  String get cardStaysNo => 'Nein';

  @override
  String get cardStaysTermFreeCancel => 'Kostenlose Stornierung';

  @override
  String get cardStaysTermBreakfast => 'Frühstück inklusive';

  @override
  String get cardStaysTermNoBreakfast => 'Ohne Frühstück';

  @override
  String get cardStaysTermPayAtHotel => 'Im Hotel zahlen';

  @override
  String get cardStaysTermNonRefundable => 'Nicht erstattungsfähig';

  @override
  String get cardStaysDetailsTitle => 'Unterkunft';

  @override
  String get cardStaysCheapest => 'Günstigste';

  @override
  String get cardStaysAmenities => 'Ausstattung';

  @override
  String cardStaysCheckIn(String time) {
    return 'Check-in $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Check-out $time';
  }

  @override
  String get cardStaysNearby => 'In der Nähe';

  @override
  String get cardStaysHotelSite => 'Website des Hotels';

  @override
  String get cardStaysBook => 'Für mich buchen';

  @override
  String cardStaysBookLabel(String name, String site) {
    return '$name auf $site buchen';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Foto $n von $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · Preis nach Monat';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Am günstigsten: $month, etwa $price pro Nacht';
  }

  @override
  String get cardStaysTrendNote => 'Eine Prognose, keine Live-Preise.';

  @override
  String get cardStaysTrendPick => 'Daten wählen';

  @override
  String get cardStaysSearchTitle => 'Unterkunft finden';

  @override
  String get cardStaysSearchWhere => 'Wo';

  @override
  String get cardStaysSearchWhereHint => 'Stadt, Gegend oder Hotel';

  @override
  String get cardStaysSearchDates => 'Daten wählen';

  @override
  String get cardStaysSearchAdults => 'Erwachsene';

  @override
  String get cardStaysSearchRooms => 'Zimmer';

  @override
  String get cardStaysSearchBudget => 'Budget pro Nacht (optional)';

  @override
  String get cardStaysSearchNotNow => 'Nicht jetzt';

  @override
  String get cardStaysSearchGo => 'Unterkünfte suchen';

  @override
  String get cardStaysSearchSent => 'Suche läuft';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Unterkünfte in $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Weniger: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Mehr: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Pool';

  @override
  String get cardStaysAmenityParking => 'Parkplatz';

  @override
  String get cardStaysAmenityPets => 'Haustiere erlaubt';

  @override
  String get cardStaysAmenityGym => 'Fitnessstudio';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Küche';

  @override
  String get cardStaysAmenityWifi => 'WLAN';

  @override
  String get cardStaysAmenityAirCon => 'Klimaanlage';

  @override
  String get cardProductsTitle => 'Produkte zum Kaufen';

  @override
  String cardProductsFrom(String price) {
    return 'ab $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'unter $price';
  }

  @override
  String get cardProductsSortBest => 'Beste';

  @override
  String get cardProductsSortCheapest => 'Günstigste';

  @override
  String get cardProductsSortTopRated => 'Bestbewertet';

  @override
  String get cardProductsOnSale => 'Im Angebot';

  @override
  String get cardProductsRated => 'Bewertung ab 4';

  @override
  String cardProductsOff(int pct) {
    return '−$pct %';
  }

  @override
  String get cardProductsOtherStores => 'und weitere Shops';

  @override
  String cardProductsShowAll(int n) {
    return 'Alle $n anzeigen';
  }

  @override
  String get cardProductsShowFewer => 'Weniger anzeigen';

  @override
  String get cardProductsShowMore => 'Mehr anzeigen';

  @override
  String get cardProductsNone => 'Nichts passt zu diesen Filtern.';

  @override
  String get cardProductsCheck => 'Der Preis wird im Shop geprüft.';

  @override
  String get cardProductsBuy => 'Kaufen';

  @override
  String get cardProductsCompareStores => 'Shops vergleichen';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Shops für $title vergleichen';
  }

  @override
  String get cardProductsBuyForMe => 'Für mich kaufen';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return '$title bei $store kaufen';
  }

  @override
  String get cardProductsRowPrice => 'Preis';

  @override
  String get cardProductsRowStore => 'Shop';

  @override
  String get cardProductsRowRating => 'Bewertung';

  @override
  String get cardProductsRowDelivery => 'Lieferung';

  @override
  String cardProductsDelivery(String text) {
    return 'Lieferung: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'von $brand';
  }

  @override
  String get cardProductsOffers => 'Shops';

  @override
  String get cardProductsLowest => 'Niedrigster Gesamtpreis';

  @override
  String cardProductsTotal(String price) {
    return 'Gesamt $price';
  }

  @override
  String get cardProductsOutOfStock => 'Ausverkauft';

  @override
  String get cardProductsFeatures => 'Über das Produkt';

  @override
  String get cardProductsReviews => 'Das sagen Käufer';

  @override
  String get cardCheckoutTitle => 'Vor der Zahlung prüfen';

  @override
  String get cardCheckoutTotal => 'Gesamt';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Seite öffnen';

  @override
  String get cardCheckoutCancel => 'Abbrechen';

  @override
  String get cardCheckoutChange => 'Ändern';

  @override
  String get cardCheckoutConfirm => 'Bestätigen und zahlen';

  @override
  String get cardCheckoutCancelLabel => 'Dies abbrechen';

  @override
  String get cardCheckoutChangeLabel => 'Etwas ändern';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return '$total bei $seller bestätigen';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return '$total bestätigen';
  }

  @override
  String get cardCheckoutConfirmed => 'Bestätigt';

  @override
  String get cardCheckoutChanging => 'Wird geändert';

  @override
  String get cardCheckoutCancelled => 'Abgebrochen';

  @override
  String get cardBookingTitle => 'Deine Buchung';

  @override
  String cardBookingWith(String site) {
    return 'Gebucht über $site';
  }

  @override
  String get cardBookingCheckIn => 'Check-in';

  @override
  String get cardBookingCheckOut => 'Check-out';

  @override
  String get cardBookingConfirmation => 'Bestätigungsnummer';

  @override
  String get cardBookingCopy => 'Bestätigungsnummer kopieren';

  @override
  String get cardBookingPaid => 'Bezahlt';

  @override
  String get cardBookingPayAtHotel => 'Im Hotel zahlen';

  @override
  String cardBookingCancelBy(String date) {
    return 'Kostenlose Stornierung bis $date';
  }

  @override
  String get cardBookingDirections => 'Wegbeschreibung';

  @override
  String get cardBookingManage => 'Buchung verwalten';

  @override
  String get cardBookingCalendar => 'Zum Kalender hinzufügen';

  @override
  String cardBookingCalendarLabel(String name) {
    return '$name zu meinem Kalender hinzufügen';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Bestellung $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Bestellt am $date';
  }

  @override
  String get cardOrderStepOrdered => 'Bestellt';

  @override
  String get cardOrderStepShipped => 'Versandt';

  @override
  String get cardOrderStepOut => 'In Zustellung';

  @override
  String get cardOrderStepDelivered => 'Zugestellt';

  @override
  String get cardOrderCancelled => 'Storniert';

  @override
  String get cardOrderReturned => 'Zurückgesendet';

  @override
  String cardOrderArrives(String date) {
    return 'Kommt an: $date';
  }

  @override
  String get cardOrderTracking => 'Sendungsnummer';

  @override
  String get cardOrderCopy => 'Sendungsnummer kopieren';

  @override
  String get cardOrderTrack => 'Verfolgen';

  @override
  String cardOrderTrackLabel(String number) {
    return '$number verfolgen';
  }

  @override
  String get cardOrderPage => 'Bestellseite';

  @override
  String get cardFaresBest => 'Beste';

  @override
  String get cardFaresCheapest => 'Günstigste';

  @override
  String get cardFaresFastest => 'Schnellste';

  @override
  String get cardFaresDirectOnly => 'Nur Direktflüge';

  @override
  String get cardFaresDirect => 'Direktflug';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Stopps',
      one: '1 Stopp',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Buchen';

  @override
  String cardFaresFromPrice(String price) {
    return 'ab $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Reisende',
      one: '1 reisende Person',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Nächte',
      one: '1 Nacht',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Economy';

  @override
  String get cardFaresPremium => 'Premium Economy';

  @override
  String get cardFaresBusiness => 'Business';

  @override
  String get cardFaresFirst => 'First';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Üblicherweise $low–$high für diese Reise';
  }

  @override
  String get cardFaresLevelLow => 'Gerade niedrig';

  @override
  String get cardFaresLevelTypical => 'Gerade typisch';

  @override
  String get cardFaresLevelHigh => 'Gerade hoch';

  @override
  String cardFaresShowAll(int n) {
    return 'Alle $n anzeigen';
  }

  @override
  String get cardFaresShowFewer => 'Weniger anzeigen';

  @override
  String get cardFaresNoDirect => 'Keine Direktflüge in dieser Suche.';

  @override
  String get cardFaresOutboundOnly =>
      'Die Preise gelten für die gesamte Reise; wähle den Rückflug auf Google Flüge.';

  @override
  String get cardFaresSeeAll => 'Alle auf Google Flüge ansehen';

  @override
  String get cardFaresCheck =>
      'Die Preise gelten für alle Reisenden und werden auf der Buchungs-Website erneut geprüft.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin Handgepäck, $checked Aufgabegepäck';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama erhält möglicherweise eine Provision, wenn du über diese Links buchst. Am Preis ändert sich dadurch nichts.';

  @override
  String cardFaresCompare(String site) {
    return 'Auf $site vergleichen';
  }

  @override
  String get cardFaresWatch => 'Preis beobachten';

  @override
  String cardFaresWatching(String date) {
    return 'Beobachtet · endet am $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Beobachtung für $price oder weniger · endet am $date';
  }

  @override
  String get cardFaresWatchStop => 'Stoppen';

  @override
  String get cardFaresWatchTitle => 'Diesen Preis beobachten';

  @override
  String get cardFaresWatchBody =>
      'Casama prüft diesen Preis mehrmals täglich und benachrichtigt dich, wenn er sinkt. Die Beobachtung endet automatisch, wenn das Datum vorbei ist, oder nach 60 Tagen.';

  @override
  String get cardFaresWatchTarget =>
      'Sag mir Bescheid, wenn er darunter liegt (optional)';

  @override
  String get cardFaresWatchAnyDrop => 'Leer lassen für jeden großen Preissturz';

  @override
  String get cardFaresWatchStart => 'Beobachten';

  @override
  String get cardFaresWatchStarted =>
      'Dieser Preis wird beobachtet. Du wirst benachrichtigt, wenn er fällt.';

  @override
  String get cardFaresWatchStopped => 'Preisbeobachtung beendet.';

  @override
  String get cardFaresWatchFull =>
      'Du beobachtest bereits 10 Preise. Stoppe zuerst einen unter Einstellungen → Karten.';

  @override
  String get cardFaresWatchFailed =>
      'Preisbeobachtung konnte nicht geändert werden. Erneut versuchen.';

  @override
  String get cardFaresFlagSeparate => 'Getrennte Tickets';

  @override
  String get cardFaresFlagOvernight => 'Zwischenstopp über Nacht';

  @override
  String get cardFaresFlagAirport => 'Flughafenwechsel';

  @override
  String get cardFaresFlagShort => 'Kurzer Zwischenstopp';

  @override
  String get cardFaresFlagLong => 'Langer Zwischenstopp';

  @override
  String get cardFaresNoteSeparate =>
      'Verschiedene Fluggesellschaften auf einer Strecke, daher sind dies möglicherweise getrennte Tickets. Verpasst du den Anschluss, ist der nächste Flug eventuell nicht abgedeckt. Prüfe das auf der Buchungs-Website.';

  @override
  String get cardFaresNoteOvernight => 'Ein Zwischenstopp geht über Nacht.';

  @override
  String get cardFaresNoteAirport =>
      'Ein Anschlussflug startet von einem anderen Flughafen.';

  @override
  String get cardFaresNoteShort =>
      'Ein Zwischenstopp dauert weniger als eine Stunde.';

  @override
  String get cardFaresNoteLong => 'Ein Zwischenstopp dauert über 8 Stunden.';

  @override
  String get cardFaresOutbound => 'Hinflug';

  @override
  String get cardFaresReturn => 'Rückflug';

  @override
  String cardFaresEmissions(int kg) {
    return 'Etwa $kg kg CO₂ pro Person';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return '$time Aufenthalt in $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'nächster Flug startet ab $place';
  }

  @override
  String get cardFaresViewFailed =>
      'Diese Tarife konnten nicht geladen werden.';

  @override
  String get cardFaresTryAgain => 'Erneut versuchen';

  @override
  String get cardFaresMorning => 'Morgens';

  @override
  String get cardFaresAfternoon => 'Nachmittags';

  @override
  String get cardFaresEvening => 'Abends';

  @override
  String get cardFaresNight => 'Nachts';

  @override
  String get cardFaresTime => 'Uhrzeit';

  @override
  String get cardFaresAirlines => 'Airlines';

  @override
  String get cardFaresBagIncluded => 'Gepäck inklusive';

  @override
  String get cardFaresNoMatch => 'Keine Flüge passen zu diesen Filtern.';

  @override
  String get cardFaresOpenInChat => 'Im Chat öffnen';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Flüge $route am $date anzeigen';
  }

  @override
  String get cardFaresEdit => 'Suche bearbeiten';

  @override
  String get cardFaresDetails => 'Details';

  @override
  String get cardFaresSinceStart => 'seit Beobachtungsbeginn';

  @override
  String get cardFareCalOneWay => 'Nur Hinflug';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Rückflug nach $n Nächten',
      one: 'Rückflug nach 1 Nacht',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Niedrig';

  @override
  String get cardFareCalUsual => 'Üblich';

  @override
  String get cardFareCalHigh => 'Hoch';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Am günstigsten: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Preise ansehen';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: kein Preis';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'Ab $from · überallhin';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'Ab $from · Ausland';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'Ab $from · Inland';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'unter $price';
  }

  @override
  String get cardFlightSearchTitle => 'Flüge suchen';

  @override
  String get cardFlightSearchReturn => 'Hin- und Rückflug';

  @override
  String get cardFlightSearchOneWay => 'Nur Hinflug';

  @override
  String get cardFlightSearchFrom => 'Von';

  @override
  String get cardFlightSearchTo => 'Nach';

  @override
  String get cardFlightSearchPlaceHint => 'Stadt oder Flughafen';

  @override
  String get cardFlightSearchAnywhere => 'Überall';

  @override
  String get cardFlightSearchSwap => 'Orte tauschen';

  @override
  String get cardFlightSearchPickDates => 'Daten wählen';

  @override
  String get cardFlightSearchPickDate => 'Datum wählen';

  @override
  String get cardFlightSearchWholeMonth => 'Ganzer Monat';

  @override
  String get cardFlightSearchNights => 'Nächte vor Ort';

  @override
  String get cardFlightSearchAdults => 'Erwachsene';

  @override
  String get cardFlightSearchChildren => 'Kinder (2 bis 11)';

  @override
  String get cardFlightSearchInfants => 'Kleinkinder (unter 2)';

  @override
  String get cardFlightSearchNotNow => 'Nicht jetzt';

  @override
  String get cardFlightSearchSent => 'Suche läuft…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Flüge $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Aktuell am günstigsten';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Die letzten $n Tage',
      one: 'Der letzte Tag',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'von $low bis $high';
  }

  @override
  String get cardFareTrendNote =>
      'So haben sich die Preise entwickelt – keine Prognose. Sie können sich jederzeit ändern.';

  @override
  String get cardFareWatchesTitle => 'Preisbeobachtungen';

  @override
  String get cardFareWatchesNone =>
      'Du beobachtest keine Flugpreise. Tippe auf einer Flugpreiskarte auf „Preis beobachten“, um zu starten.';

  @override
  String get cardFareWatchesNoPrice => 'Noch kein Preis';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Ziel $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Jeder große Preissturz';

  @override
  String cardFareWatchesLow(String price) {
    return 'tiefster $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'endet $date';
  }

  @override
  String get cardsFareWatches => 'Preisbeobachtungen';

  @override
  String get cardsFareWatchesNone =>
      'Keine Preisbeobachtungen. Tippe auf einer Flugpreiskarte auf „Preis beobachten“, um bei Preisstürzen benachrichtigt zu werden.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Jetzt $price · endet $date';
  }

  @override
  String get cardFromBot => 'Vom Bot geschrieben; kann Fehler enthalten';

  @override
  String get cardFullRecipe => 'Ganzes Rezept';

  @override
  String get cardGate => 'Gate';

  @override
  String get cardGo => 'Los';

  @override
  String get cardHeads => 'Kopf';

  @override
  String get cardHolidays => 'Feiertage';

  @override
  String get cardHoursShort => 'Std.';

  @override
  String get cardHumidity => 'Luftfeuchtigkeit';

  @override
  String get cardItsTime => 'Es ist Zeit!';

  @override
  String get cardJustNow => 'gerade eben';

  @override
  String get cardLast24h => 'Letzte 24 Stunden';

  @override
  String get cardLast30Days => 'Letzte 30 Tage';

  @override
  String get cardListen => 'Anhören';

  @override
  String get cardLiveNow => 'Gerade jetzt';

  @override
  String get cardLongWeekend => 'Langes Wochenende';

  @override
  String get cardLostShort => 'N';

  @override
  String get cardMarket24h => '24/7';

  @override
  String get cardMarketCap => 'Marktkapitalisierung';

  @override
  String get cardMarketClosed => 'Geschlossen';

  @override
  String get cardMarketOpen => 'Geöffnet';

  @override
  String get cardMarketPost => 'Nachbörslich';

  @override
  String get cardMarketPre => 'Vorbörslich';

  @override
  String get cardMessage => 'Nachricht';

  @override
  String get cardMinutesShort => 'Min.';

  @override
  String get cardMoonFirstQuarter => 'Erstes Viertel';

  @override
  String get cardMoonFull => 'Vollmond';

  @override
  String get cardMoonLastQuarter => 'Letztes Viertel';

  @override
  String get cardMoonNew => 'Neumond';

  @override
  String get cardMoonWaningCrescent => 'Abnehmende Sichel';

  @override
  String get cardMoonWaningGibbous => 'Abnehmender Mond';

  @override
  String get cardMoonWaxingCrescent => 'Zunehmende Sichel';

  @override
  String get cardMoonWaxingGibbous => 'Zunehmender Mond';

  @override
  String get cardMore => 'Mehr';

  @override
  String get cardNext24h => 'Nächste 24 Stunden';

  @override
  String get cardNoAlerts => 'Keine Warnungen';

  @override
  String get cardNoAlertsLong => 'Hier gelten gerade keine Wetterwarnungen.';

  @override
  String get cardNoChart => 'Kein Diagramm für diesen Zeitraum';

  @override
  String get cardNoGames => 'Keine Spiele';

  @override
  String get cardNoHolidays => 'Keine weiteren Feiertage in diesem Jahr.';

  @override
  String get cardNoQuakes => 'Keine Erdbeben dieser Stärke in letzter Zeit.';

  @override
  String get cardNoStorms => 'Keine aktiv';

  @override
  String get cardNoStormsLong => 'Derzeit sind keine tropischen Stürme aktiv.';

  @override
  String get cardNotAdvice => 'Keine Finanzberatung';

  @override
  String get cardNow => 'Jetzt';

  @override
  String get cardNutritionFacts => 'Nährwertangaben';

  @override
  String get cardOpen => 'Öffnen';

  @override
  String get cardOpenSource => 'Quelle öffnen';

  @override
  String get cardParcel => 'Sendung';

  @override
  String get cardParcelDelivered => 'Zugestellt';

  @override
  String get cardParcelInTransit => 'Unterwegs';

  @override
  String get cardParcelOrdered => 'Etikett erstellt';

  @override
  String get cardParcelOut => 'In Zustellung';

  @override
  String get cardParcelProblem => 'Problem';

  @override
  String get cardParcelNoLive =>
      'Hier gibt es keinen Live-Status zu dieser Nummer. Die Seite des Zustellers hat den aktuellen Stand.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Auf $site verfolgen';
  }

  @override
  String get cardPin => 'An Widgets anheften';

  @override
  String get cardPinFailed => 'Diese Karte konnte nicht angeheftet werden';

  @override
  String get cardPinned => 'An deine Widgets angeheftet';

  @override
  String get cardPinnedWaiting =>
      'Angeheftet. Erlaube diesen Bot für deine Widgets, um es dort zu sehen';

  @override
  String get cardPlayedShort => 'Sp';

  @override
  String get cardPointsShort => 'Pkt';

  @override
  String get cardPrevClose => 'Vortag';

  @override
  String get cardPros => 'Vorteile';

  @override
  String get cardProsCons => 'Vor- und Nachteile';

  @override
  String get cardQuiz => 'Quiz';

  @override
  String get cardRain => 'Regen';

  @override
  String get cardRainChance => 'Regenwahrscheinlichkeit';

  @override
  String get cardRandom => 'Zufällig';

  @override
  String get cardReadMore => 'Mehr lesen';

  @override
  String get cardReferenceRates =>
      'Referenzkurse der Zentralbank, täglich veröffentlicht';

  @override
  String get cardRefresh => 'Aktualisieren';

  @override
  String get cardReport => 'Falsche Daten melden';

  @override
  String get cardReported => 'Danke, wir schauen es uns an';

  @override
  String get cardSameTime => 'gleiche Zeit';

  @override
  String get cardScores => 'Ergebnisse';

  @override
  String get cardSecondsShort => 'Sek.';

  @override
  String get cardServings => 'Portionen';

  @override
  String get cardShareImage => 'Als Bild teilen';

  @override
  String get cardStandings => 'Tabelle';

  @override
  String get cardStorms => 'Tropische Stürme';

  @override
  String get cardSunMoon => 'Sonne und Mond';

  @override
  String get cardSunrise => 'Sonnenaufgang';

  @override
  String get cardSunset => 'Sonnenuntergang';

  @override
  String get cardSwap => 'Tauschen';

  @override
  String get cardSynonyms => 'Ähnlich:';

  @override
  String get cardTails => 'Zahl';

  @override
  String get cardTeam => 'Team';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Uhrzeit an jedem Ort';

  @override
  String get cardTimeline => 'Zeitleiste';

  @override
  String get cardToday => 'Heute';

  @override
  String get cardTomorrow => 'Morgen';

  @override
  String get cardTranslation => 'Übersetzung';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Aus Widgets entfernen';

  @override
  String get cardUnpinned => 'Aus deinen Widgets entfernt';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'extrem';

  @override
  String get cardUvHigh => 'hoch';

  @override
  String get cardUvLow => 'niedrig';

  @override
  String get cardUvModerate => 'mäßig';

  @override
  String get cardUvVeryHigh => 'sehr hoch';

  @override
  String get cardVolume => 'Volumen';

  @override
  String get cardWatchlist => 'Watchlist';

  @override
  String get cardWeather => 'Wetter';

  @override
  String get cardWeatherAlerts => 'Wetterwarnungen';

  @override
  String get cardWebsite => 'Website';

  @override
  String get cardWind => 'Wind';

  @override
  String get cardWonShort => 'S';

  @override
  String get cardWorldClock => 'Weltuhr';

  @override
  String get cardYesterday => 'Gestern';

  @override
  String get cardQuakesWorld => 'Stärkste Erdbeben heute';

  @override
  String cardMinutesAgo(int n) {
    return 'vor $n Min.';
  }

  @override
  String cardHoursAgo(int n) {
    return 'vor $n Std.';
  }

  @override
  String cardStale(String ago) {
    return 'Konnte nicht aktualisieren · von $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Aktualisiert $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Verspätet $minutes Min.';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'H $high  T $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Gefühlt $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n Tage';
  }

  @override
  String cardUntil(String when) {
    return 'Bis $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aktive Warnungen',
      one: '1 aktive Warnung',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Meistens $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Erlenpollen',
      'birch': 'Birkenpollen',
      'grass': 'Gräserpollen',
      'mugwort': 'Beifußpollen',
      'olive': 'Olivenpollen',
      'ragweed': 'Ambrosiapollen',
      'other': 'Pollen',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h Std. $m Min.';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Goldene Stunde ab $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct % beleuchtet';
  }

  @override
  String cardMoonrise(String time) {
    return 'Aufgang $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Untergang $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Änderung über $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up hoch · $down runter';
  }

  @override
  String cardRatesOf(String date) {
    return 'Kurse vom $date';
  }

  @override
  String cardAtTime(String when) {
    return 'Um $when';
  }

  @override
  String cardInDays(int n) {
    return 'in $n Tagen';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct % geschafft';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Erdbeben nahe $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Erdbeben',
      one: '1 Erdbeben',
      zero: 'Keine',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '$depth tief';
  }

  @override
  String cardAway(String distance) {
    return '$distance entfernt';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aktiv',
      one: '1 aktiv',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return 'Warnstufe $level';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Spiele',
      one: '1 Spiel',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n live';
  }

  @override
  String cardMinutes(int n) {
    return '$n Min.';
  }

  @override
  String cardExpected(String date) {
    return 'Erwartet $date';
  }

  @override
  String cardCalories(int n) {
    return '$n kcal';
  }

  @override
  String cardStepsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Schritte',
      one: '1 Schritt',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Siege $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Portion: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed von $total Prüfungen bestanden';
  }

  @override
  String cardTotal(int n) {
    return 'Summe $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Nach $n Jahren';
  }

  @override
  String get cardsSettingsTitle => 'Karten';

  @override
  String get cardsSettingsRow => 'Heimatstadt, Einheiten und Datenquellen';

  @override
  String get cardsSettingsIntro =>
      'Bots beantworten Wetter, Preise, Kurse, Uhrzeit und mehr mit Karten voller aktueller Echtzeitdaten. Deine Heimatstadt wird verwendet, wenn du fragst, ohne einen Ort zu nennen.';

  @override
  String get cardsSettingsSaveFailed =>
      'Konnte nicht gespeichert werden. Erneut versuchen.';

  @override
  String get cardsHomeCity => 'Heimatstadt';

  @override
  String get cardsHomeClear => 'Leeren';

  @override
  String get cardsHomeNone =>
      'Nicht festgelegt. Bots nutzen die Hauptstadt deiner Zeitzone, bis du eine auswählst.';

  @override
  String get cardsHomeSearch => 'Nach deiner Stadt suchen';

  @override
  String get cardsHomePrivacy =>
      'Es wird nur eine Stadt gespeichert, niemals deine Adresse; an Wetterdienste gehen gerundete Koordinaten.';

  @override
  String get cardsUnits => 'Einheiten';

  @override
  String get cardsTemperature => 'Temperatur';

  @override
  String get cardsWind => 'Wind';

  @override
  String get cardsRain => 'Regen';

  @override
  String get cardsDistance => 'Entfernung';

  @override
  String get cardsPrices => 'Preise';

  @override
  String get cardsRedUp => 'Rot bedeutet steigend';

  @override
  String get cardsRedUpHint =>
      'Steigende Kurse in Rot und fallende in Grün anzeigen, wie an den Märkten in China, Japan und Korea.';

  @override
  String get cardsSources => 'Datenquellen';

  @override
  String get cardsSourcesIntro =>
      'Karten zeigen an, woher ihre Daten stammen und von wann. Diese Dienste liefern sie:';

  @override
  String get cardFewerServings => 'Weniger Portionen';

  @override
  String get cardMoreServings => 'Mehr Portionen';

  @override
  String get cropTitle => 'Verschieben und skalieren';

  @override
  String get cropDone => 'Fertig';

  @override
  String get cropPosition => 'Bildposition';

  @override
  String get cropMoveUp => 'Nach oben';

  @override
  String get cropMoveDown => 'Nach unten';

  @override
  String get cropMoveLeft => 'Nach links';

  @override
  String get cropMoveRight => 'Nach rechts';

  @override
  String get cropRotate => 'Drehen';

  @override
  String get cropMirror => 'Spiegeln';

  @override
  String get cropReset => 'Zurücksetzen';

  @override
  String get cropZoom => 'Zoom';

  @override
  String get cropZoomIn => 'Vergrößern';

  @override
  String get cropZoomOut => 'Verkleinern';

  @override
  String get cropSoft => 'Stark vergrößert: Das Bild könnte unscharf wirken';

  @override
  String get cropAnimatedStill => 'Animierte Bilder bleiben unbewegt';

  @override
  String get cropBackground => 'Hintergrund';

  @override
  String get cropBackgroundNone => 'Keiner';

  @override
  String cropBackgroundBot(String name) {
    return 'Farbe von $name';
  }

  @override
  String get cropBackgroundWhite => 'Weiß';

  @override
  String get cropBackgroundBlack => 'Schwarz';

  @override
  String get cropUnreadable =>
      'Dieses Bild lässt sich hier nicht öffnen. Probiere ein JPEG oder PNG.';

  @override
  String cropTooBig(String size) {
    return 'Diese Datei ist $size groß und überschreitet das Limit von 40 MB.';
  }

  @override
  String get botPicture => 'Bild';

  @override
  String botPictureTitle(String name) {
    return 'Bild von $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Bild von $name ändern';
  }

  @override
  String get botPicturePaste => 'Bild einfügen';

  @override
  String get botPictureDraw => 'Mit KI erstellen';

  @override
  String get botPictureDrawHelp => 'Casama zeichnet zwei zur Auswahl';

  @override
  String get botPictureRecrop => 'Neu zuschneiden';

  @override
  String get botPictureMascot => 'Stattdessen Maskottchen verwenden';

  @override
  String get botPictureRemove => 'Bild entfernen';

  @override
  String get botPictureRecent => 'Zuletzt verwendet';

  @override
  String get botPictureUpdated => 'Bild aktualisiert';

  @override
  String get botPictureRemoved => 'Bild entfernt';

  @override
  String get botPictureFailed => 'Bild konnte nicht gespeichert werden';

  @override
  String botPictureDrop(String name) {
    return 'Ablegen, um es als Bild für $name zu nutzen';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Als Bild für $name verwenden';
  }

  @override
  String get botPictureUseAsBot => 'Als Bild für einen Bot verwenden';

  @override
  String get botPictureWhichBot => 'Welcher Bot bekommt dieses Bild?';

  @override
  String botDrawTitle(String name) {
    return 'Ein Bild für $name';
  }

  @override
  String get botDrawIntro =>
      'Wähle einen Look, füge optional ein paar Wörter hinzu, und Casama zeichnet zwei Bilder zur Auswahl.';

  @override
  String get botDrawDescribe => 'Beschreibe es (optional)';

  @override
  String get botDrawHint => 'Eine freundliche Eule mit Lesebrille';

  @override
  String get botDrawMake => '2 erstellen';

  @override
  String get botDrawMore => 'Noch 2 erstellen';

  @override
  String get botDrawPick => 'Tippe eines an, um es zu nutzen';

  @override
  String get botDrawCost =>
      'Jedes Bild nutzt Bild-Credits, wie jedes Bild, das Casama erstellt.';

  @override
  String get botDrawWorking => 'Wird gezeichnet…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => 'Weiches 3D';

  @override
  String get botDrawStyleWatercolor => 'Aquarell';

  @override
  String get botDrawStyleFlat => 'Flaches Icon';

  @override
  String get botDrawStylePixel => 'Pixel-Art';

  @override
  String get botDrawStyleLine => 'Linienzeichnung';

  @override
  String get botDrawStylePhoto => 'Foto';

  @override
  String get sharePictureStays =>
      'Sein Bild bleibt in diesem Workspace: Die Kopie bekommt sein früheres Maskottchen oder seine Initialen.';

  @override
  String savedResetRefills(String amount) {
    return 'Füllt $amount an Credits auf';
  }

  @override
  String get savedResetClearsDaily => 'Setzt das heutige Limit zurück';

  @override
  String get savedResetGivesHours => 'Gibt Computerstunden zurück';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch $count Tage',
      one: 'Noch 1 Tag',
      zero: 'Läuft heute ab',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Modelle';

  @override
  String get modelsRowHelp => 'Modelle von Casama oder deine eigenen Schlüssel';

  @override
  String get modelsIntro =>
      'Wähle, ob Casama deine Bots betreibt, oder verbinde deine eigenen Modellschlüssel. Schlüssel werden verschlüsselt gespeichert und nie wieder angezeigt.';

  @override
  String get whoRunsYourBots => 'Wer deine Bots betreibt';

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
      'In deinem Abo enthalten; nutzt Workspace-Credits';

  @override
  String get whoRunsCasamaOffHelp => 'In deinem aktuellen Abo pausiert';

  @override
  String get whoRunsOwn => 'Dein eigener Anbieter';

  @override
  String get whoRunsOwnHelp =>
      'Direkt über deinen Anbieter abgerechnet; verbraucht keine Casama-Credits';

  @override
  String get whoRunsCasamaShort =>
      'Modelle von Casama, in deinem Abo enthalten';

  @override
  String get whoRunsCasamaCost => 'Nutzt Credits';

  @override
  String get whoRunsOwnShort =>
      'Deine Schlüssel, über deinen Anbieter abgerechnet';

  @override
  String get whoRunsOwnCost => 'Keine Casama-Credits';

  @override
  String get whoRunsOwnNeedsKey =>
      'Um deinen eigenen Anbieter zu nutzen, füge zuerst unter „Schlüssel hinzufügen“ unten einen Chat-Schlüssel von ihm hinzu.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Wähle unten ein Modell für diesen Schlüssel, um zu wechseln.';

  @override
  String get whoRunsAdminOnly =>
      'Nur Workspace-Admins können ändern, wer deine Bots betreibt.';

  @override
  String get botModelSource => 'Modellquelle';

  @override
  String get botModelSourceWorkspace => 'Workspace-Standard';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Einer deiner Schlüssel';

  @override
  String get useCasamaFallback =>
      'Wenn mein Anbieter ausfällt, Modelle von Casama nutzen';

  @override
  String get useCasamaFallbackHelp =>
      'Wenn dein Schlüssel auf ein Ratenlimit oder Kontingent stößt, über Workspace-Credits auf Modelle von Casama ausweichen.';

  @override
  String get keyCoversOpenRouter =>
      'Chat, Bilder, Video, Vorlesen, Sprachnachrichten und Diktat';

  @override
  String get keyCoversGoogle => 'Chat und Live-Anrufe';

  @override
  String get keyCoversOpenAi => 'Chat und Suche im Gedächtnis';

  @override
  String get keyCoversChat => 'Chat';

  @override
  String get ownProviderPrivacyNote =>
      'Bei deinem eigenen Anbieter gelten dessen Bedingungen für das, was deine Bots dorthin senden. Die Kein-Training-Einstellung von Casama gilt nur beim Schlüssel von Casama.';

  @override
  String get creditsOwnProviderNote =>
      'Modelle bei deinem eigenen Anbieter verbrauchen keine Credits.';

  @override
  String get routineWaitingForModel => 'Warten auf ein Modell';

  @override
  String get ownProviderRequiredTitle => 'Modell verbinden, um weiterzuchatten';

  @override
  String get ownProviderRequiredBody =>
      'Modelle von Casama sind in diesem Abo gerade nicht verfügbar. Füge deinen eigenen Modellschlüssel hinzu oder mache ein Upgrade deines Abos.';

  @override
  String get modelNoToolsWarning =>
      'Dieses Modell unterstützt keine Tools, daher kann der Bot nur als Text antworten.';

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
  String get appBrowserTitle => 'Browser auf diesem Telefon';

  @override
  String get appBrowserTitleMac => 'Browser auf diesem Mac';

  @override
  String get appBrowserTitleLinux => 'Browser auf diesem Computer';

  @override
  String get appBrowserTitleWindows => 'Browser auf diesem PC';

  @override
  String get appBrowserHelp =>
      'Ein kleiner Browser in Casama, den Bots nutzen können, denen du es erlaubst, während du zusiehst – nur solange ihr Chat auf diesem Telefon geöffnet ist. Deine Anmeldungen bleiben auf diesem Telefon.';

  @override
  String get appBrowserHelpMac =>
      'Ein kleiner Browser in Casama, den Bots nutzen können, denen du es erlaubst, während du zusiehst – solange Casama auf diesem Mac geöffnet ist. Deine Anmeldungen bleiben auf diesem Mac.';

  @override
  String get appBrowserHelpLinux =>
      'Ein kleiner Browser in Casama, den Bots nutzen können, denen du es erlaubst, während du zusiehst – solange Casama auf diesem Computer geöffnet ist. Deine Anmeldungen bleiben auf diesem Computer.';

  @override
  String get appBrowserHelpWindows =>
      'Ein kleiner Browser in Casama, den Bots nutzen können, denen du es erlaubst, während du zusiehst – solange Casama auf diesem PC geöffnet ist. Deine Anmeldungen bleiben auf diesem PC.';

  @override
  String get appBrowserSwitchHelp =>
      'Bots, denen du es erlaubst, können hier Seiten öffnen, solange ihr Chat auf diesem Telefon geöffnet ist.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Bots, denen du es erlaubst, können hier Seiten öffnen, solange Casama auf diesem Mac geöffnet ist.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Bots, denen du es erlaubst, können hier Seiten öffnen, solange Casama auf diesem Computer geöffnet ist.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Bots, denen du es erlaubst, können hier Seiten öffnen, solange Casama auf diesem PC geöffnet ist.';

  @override
  String get appBrowserOn => 'Ein';

  @override
  String get appBrowserOff => 'Aus';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Ausgeschaltet: $reason';
  }

  @override
  String get appBrowserReasonOff => 'noch nicht verfügbar.';

  @override
  String get appBrowserReasonNotTester => 'vorerst nur für Tester.';

  @override
  String get appBrowserReasonSystemOff =>
      'auf diesem Gerät noch nicht verfügbar.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'ein Admin hat ihn für diesen Workspace ausgeschaltet.';

  @override
  String get appBrowserReasonUnavailable =>
      'dieser Server hat keine Geräteverbindungen.';

  @override
  String get appBrowserReasonUnsupported =>
      'der Browser dieses Geräts kann ihn nicht ausführen.';

  @override
  String get appBrowserReasonNeedsMacos14 => 'erfordert macOS 14 oder neuer.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Installiere WebKitGTK, um den Browser hier zu nutzen: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Installiere oder aktualisiere Microsoft Edge WebView2, um den Browser hier zu nutzen.';

  @override
  String get appBrowserGetWebview2 => 'WebView2 laden';

  @override
  String get appBrowserReasonNoToken =>
      'Auf einer früheren Installation gekoppelt. Erneut einschalten, um dieses Gerät zu koppeln.';

  @override
  String get appBrowserAllBots => 'Alle deine Bots';

  @override
  String get appBrowserAllBotsHelp =>
      'Jeder Bot, mit dem du chatten kannst, darf diesen Browser nutzen. Ausschalten, um einzelne Bots auszuwählen.';

  @override
  String get appBrowserModeHeader => 'Wenn ein Bot einen Browser braucht';

  @override
  String get appBrowserModeAsk => 'Fragen, wenn es hilft';

  @override
  String get appBrowserModeAskHelp =>
      'Auswahl anbieten, wenn eine Website deine Anmeldung braucht oder den Computer des Bots blockiert.';

  @override
  String get appBrowserModeComputer => 'Immer der Computer des Bots';

  @override
  String get appBrowserModeComputerHelp =>
      'Niemals den Browser dieses Geräts anbieten, außer du bittest im Chat darum.';

  @override
  String get appBrowserModeDevice => 'Dieses Gerät bevorzugen';

  @override
  String get appBrowserModeDeviceHelp =>
      'Den Browser dieses Geräts für Anmeldungen und blockierte Websites ohne Nachfrage nutzen.';

  @override
  String get appBrowserNeverAsk => 'Computer des Bots (nicht fragen)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Linux-Computer';

  @override
  String get appBrowserDeviceWindows => 'Windows-PC';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting =>
      'Wartet auf dich. Lass diesen Chat offen, um in deinem Browser fortzufahren.';

  @override
  String browserWaitingSite(String site) {
    return 'Wartet auf dich. Lass diesen Chat offen, um mit $site in deinem Browser fortzufahren.';
  }

  @override
  String get browserWaitEnded => 'Warten auf deinen Browser beendet.';

  @override
  String get browserHandBackWaiting =>
      'Du bist im Browser dran. Erledige den Schritt auf der Seite und tippe dann auf Zurückgeben.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Du bist auf $site dran. Erledige den Schritt auf der Seite und tippe dann auf Zurückgeben.';
  }

  @override
  String get browserHandBackEnded =>
      'Warten auf die Rückgabe des Browsers beendet.';

  @override
  String get browserChoiceCardLabel => 'Browser-Auswahl';

  @override
  String browserChoiceTitle(String bot, String site) {
    return 'Wo soll $bot $site öffnen?';
  }

  @override
  String get browserChoiceSubtitleSignIn =>
      'Diese Website erfordert deine Anmeldung.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Diese Website hat den Computer von $bot blockiert.';
  }

  @override
  String get browserChoiceOnPhone => 'Auf diesem Telefon';

  @override
  String get browserChoiceOnMac => 'Auf diesem Mac';

  @override
  String get browserChoiceOnLinux => 'Auf diesem Computer';

  @override
  String get browserChoiceOnWindows => 'Auf diesem PC';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Du schaust zu und kannst dich selbst anmelden. Was er liest, geht an die KI.';

  @override
  String get browserChoiceInChrome => 'In deinem Chrome';

  @override
  String get browserChoiceInChromeHelp =>
      'Auf deinen Websites bereits angemeldet.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'Auf dem Computer von $bot';
  }

  @override
  String get browserChoiceOnComputerHelp =>
      'Läuft weiter, wenn du die Ansicht verlässt.';

  @override
  String browserChoiceRemember(String site) {
    return 'Für $site merken';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return '$site auf diesem Telefon geöffnet';
  }

  @override
  String browserChoicePickedMac(String site) {
    return '$site auf diesem Mac geöffnet';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return '$site auf diesem Computer geöffnet';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return '$site auf diesem PC geöffnet';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '$site in deinem Chrome geöffnet';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$site auf dem Computer von $bot geöffnet';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Keine rechtzeitige Antwort; auf dem Computer von $bot geblieben';
  }

  @override
  String get appBrowserConsentTitle =>
      'Bots den Browser in Casama nutzen lassen?';

  @override
  String get appBrowserConsentPages =>
      'Seiten, die ein Bot hier liest, werden an Casama und an das KI-Modell des Bots gesendet – genau wie Seiten, die er auf seinem eigenen Computer liest.';

  @override
  String get appBrowserConsentSignIns =>
      'Deine Anmeldungen bleiben auf diesem Gerät. Bots sehen niemals Passwörter, Kartennummern oder Codes; die gibst du selbst ein.';

  @override
  String get appBrowserConsentWatch =>
      'Das funktioniert nur, solange du den Chat des Bots hier offen hast. Du kannst jederzeit zusehen, übernehmen oder stoppen.';

  @override
  String get appBrowserConsentYours =>
      'Was du selbst im Browser machst, wird nirgendwohin gesendet.';

  @override
  String get appBrowserBots => 'Bots, die ihn nutzen dürfen';

  @override
  String get appBrowserBotsHelp =>
      'Nur die hier eingeschalteten Bots können den Browser auf diesem Gerät nutzen.';

  @override
  String get appBrowserNoBots => 'Noch keine Bots.';

  @override
  String get appBrowserSites => 'Websites';

  @override
  String get appBrowserSitesHelp =>
      'Websites, bei denen du „Immer“ oder „Nie“ gewählt hast. Entferne eine, um beim nächsten Mal wieder gefragt zu werden.';

  @override
  String get appBrowserNoSites =>
      'Noch keine Websites. Ein Bot fragt, wenn er eine Website zum ersten Mal öffnet.';

  @override
  String appBrowserRemoveSite(String site) {
    return '$site entfernen';
  }

  @override
  String get appBrowserKinds => 'Websites, die ausgeschaltet bleiben';

  @override
  String get appBrowserKindsHelp =>
      'Diese Arten von Websites bleiben aus, bis du sie einschaltest. Wenn eine eingeschaltet ist, fragt ein Bot trotzdem jedes Mal.';

  @override
  String get appBrowserKindBanking => 'Banking und Zahlungen';

  @override
  String get appBrowserKindHealth => 'Gesundheit';

  @override
  String get appBrowserKindPasswords => 'Passwortmanager';

  @override
  String get appBrowserKindGovernment => 'Behörden und Ausweise';

  @override
  String get appBrowserSignIn => 'Bei einer Website anmelden';

  @override
  String get appBrowserSignInHelp =>
      'Öffne eine Website, melde dich selbst an und lass sie dann deine Bots nutzen. Nichts, was du dort tust, wird irgendwohin gesendet.';

  @override
  String get appBrowserClearData => 'Browserdaten löschen';

  @override
  String get appBrowserClearDataHelp =>
      'Meldet diesen Browser von jeder Website ab und löscht, was Websites gespeichert haben.';

  @override
  String get appBrowserClearDataConfirm =>
      'Anmeldungen und Website-Daten dieses Browsers löschen?';

  @override
  String get appBrowserClearDataDone => 'Browserdaten gelöscht';

  @override
  String get appBrowserUnpair => 'Dieses Gerät entkoppeln';

  @override
  String get appBrowserUnpairConfirm =>
      'Browser dieses Geräts entkoppeln? Bots können ihn nicht nutzen, bis du ihn wieder einschaltest.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot arbeitet';
  }

  @override
  String get appBrowserTakeOver => 'Übernehmen';

  @override
  String get appBrowserHandBack => 'Zurückgeben';

  @override
  String get appBrowserYourTurn => 'Du bist dran';

  @override
  String appBrowserPaused(String bot) {
    return '$bot ist pausiert, während du die Seite nutzt';
  }

  @override
  String get appBrowserAway => 'Pausiert: Der Chat ist nicht offen';

  @override
  String get appBrowserAddress => 'Website-Adresse';

  @override
  String get appBrowserBack => 'Zurück';

  @override
  String get appBrowserForward => 'Vorwärts';

  @override
  String get appBrowserReload => 'Neu laden';

  @override
  String get appBrowserAllowSite => 'Meine Bots diese Website nutzen lassen';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site hinzugefügt. Deine Bots können sie hier nutzen.';
  }

  @override
  String get appBrowserAddressRefused =>
      'Diese Adresse kann hier nicht geöffnet werden.';

  @override
  String get appBrowserSecure => 'Sichere Verbindung';

  @override
  String get appBrowserNotSecure => 'Nicht sicher';

  @override
  String get appBrowserCardLabel => 'In-App-Browser';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot möchte $site öffnen';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'In Casama auf diesem Gerät, mit deinen Anmeldungen. Mit „Immer“ darf er diese Website ab jetzt öffnen.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Auf diesem Mac, mit deinen Anmeldungen. Mit „Immer“ darf er diese Website ab jetzt öffnen.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Auf diesem Computer, mit deinen Anmeldungen. Mit „Immer“ darf er diese Website ab jetzt öffnen.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Auf diesem PC, mit deinen Anmeldungen. Mit „Immer“ darf er diese Website ab jetzt öffnen.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Websites für Banking und Zahlungen fragen jedes Mal nach.',
      'health': 'Gesundheits-Websites fragen jedes Mal nach.',
      'passwords': 'Passwortmanager-Websites fragen jedes Mal nach.',
      'government': 'Websites für Behörden-IDs fragen jedes Mal nach.',
      'other': 'Diese Websites fragen jedes Mal nach.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Einmal';

  @override
  String get appBrowserAlways => 'Immer';

  @override
  String get appBrowserNever => 'Nie';

  @override
  String appBrowserStepAskTitle(String bot) {
    return '$bot erlauben, das zu tun?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'In Casama auf diesem Gerät, mit deinen Anmeldungen.';

  @override
  String get appBrowserStepAskHelpMac =>
      'Auf diesem Mac, mit deinen Anmeldungen.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'Auf diesem Computer, mit deinen Anmeldungen.';

  @override
  String get appBrowserStepAskHelpWindows =>
      'Auf diesem PC, mit deinen Anmeldungen.';

  @override
  String appBrowserStepClick(String name) {
    return 'Tippen auf „$name“';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Eingeben in „$name“';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Taste drücken in „$name“';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Datei hochladen zu „$name“';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: „$name“';
  }

  @override
  String get appBrowserDontAllow => 'Nicht erlauben';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Android-Telefon';

  @override
  String get toolOnThisPhone => 'auf diesem Gerät';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bots in In-App-Browsern von Mitgliedern';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Mitglieder können Bots einen Browser in Casama auf ihrem Telefon oder Computer nutzen lassen, während sie zusehen.';

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
  String get vendorRenewalUsd => 'Was eine Verlängerung kostet (USD)';

  @override
  String get vendorRenewalMonths => 'Monate pro Verlängerung';

  @override
  String get vendorSeeSpend => 'Ausgaben ansehen';

  @override
  String get costSpent => 'Ausgegeben';

  @override
  String get costCharged => 'Berechnet';

  @override
  String get costMargin => 'Marge';

  @override
  String get costMarginNone => 'Es wurde nichts berechnet';

  @override
  String get costNotRecorded => 'Nicht erfasst';

  @override
  String get costNotRecordedHint =>
      'Zeigt, was dies bedeutet und um welche Dienste es geht';

  @override
  String get costNotRecordedHelp =>
      'Manche Dienste melden eigene Summen. Liegen diese über dem, was dieser Server erfasst hat, erscheint die Differenz hier. Das sind echte Ausgaben, die noch keinem Feature, Schlüssel oder Workspace zugeordnet sind.';

  @override
  String get costNotRecordedWhy => 'Was Dienste darüber hinaus melden';

  @override
  String get costNotRecordedNone =>
      'Stimmt mit dem überein, was Dienste melden';

  @override
  String get costNotRecordedAllMatch =>
      'Jeder Dienst, der eine Summe meldet, stimmt mit den Aufzeichnungen dieses Servers überein.';

  @override
  String get costNotRecordedNoList =>
      'Die Liste der Dienste ist gerade nicht verfügbar. Versuche es gleich noch einmal.';

  @override
  String get costNoVendorFigures => 'Kein Dienst hat eine Summe gemeldet';

  @override
  String get costNoVendorFiguresHelp =>
      'Kein Dienst hat für diesen Zeitraum eine eigene Summe gemeldet, daher gibt es nichts zum Vergleichen.';

  @override
  String costNoFigureFrom(String names) {
    return 'Keine Summe von: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dienste',
      one: '1 Dienst',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Sie melden $theirs · wir haben $ours erfasst';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Sie melden $theirs · wir haben $ours erfasst · $gap nicht erfasst';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Sie melden $theirs · wir haben $ours erfasst · nichts fehlt';
  }

  @override
  String get costNoVendorFigure =>
      'Dieser Dienst hat für diesen Zeitraum keine eigene Summe gemeldet.';

  @override
  String get costNoVendorFigureKind =>
      'Dieser Dienst meldet keine eigene Summe.';

  @override
  String costUpdated(String when) {
    return 'Aktualisiert $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'gegenüber den $days Tagen davor',
      one: 'gegenüber dem Vortag',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'kein früherer Zeitraum zum Vergleichen';

  @override
  String get costChangeNew => 'Neu';

  @override
  String get costChangeNewSpoken => 'neu in diesem Zeitraum';

  @override
  String get costChangeFlat => 'unverändert';

  @override
  String costChangeUp(String amount) {
    return 'um $amount gestiegen';
  }

  @override
  String costChangeDown(String amount) {
    return 'um $amount gesunken';
  }

  @override
  String costPoints(String count) {
    return '$count Pkt.';
  }

  @override
  String get costOther => 'Sonstige';

  @override
  String get costNotLabelled => 'Ohne Label';

  @override
  String get costNotLabelledHelp =>
      'Diese Kosten wurden ohne Label für diese Gruppierung erfasst und lassen sich nicht weiter aufteilen. Sie sind weiterhin Teil der Gesamtsumme.';

  @override
  String get costGroupService => 'Dienst';

  @override
  String get costGroupKey => 'Schlüssel';

  @override
  String get costGroupApp => 'Apps & MCP';

  @override
  String get costGroupFeature => 'Funktion';

  @override
  String get costGroupModel => 'Modell';

  @override
  String get costGroupWorkspace => 'Workspace';

  @override
  String get costGroupBy => 'Gruppieren nach';

  @override
  String get costFilters => 'Filter';

  @override
  String get costNoFilters =>
      'Keine. Öffne eine Zeile und wähle „In Tabelle anzeigen“, um die Ansicht einzugrenzen.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Filter $name entfernen';
  }

  @override
  String get costIncludeFixed => 'Feste Kosten einbeziehen';

  @override
  String get costIncludeFixedHelp =>
      'Addiert Abos und Verlängerungen zu „Ausgegeben“, gleichmäßig verteilt auf die abgedeckten Tage.';

  @override
  String get costOptions => 'Zeitraum und Filter';

  @override
  String get costPeriod => 'Zeitraum';

  @override
  String costPeriodDays(int days) {
    return '$days Tage';
  }

  @override
  String get costPeriodCustom => 'Benutzerdefiniert';

  @override
  String costLastDays(int days) {
    return 'Letzte $days Tage';
  }

  @override
  String get costChangeDates => 'Daten ändern';

  @override
  String get costDone => 'Fertig';

  @override
  String get costDaysUtc => 'Tage sind in UTC.';

  @override
  String get costDailySpend => 'Tägliche Ausgaben';

  @override
  String costStackedBy(String group) {
    return 'Gestapelt nach $group: die größten zuerst, dann Sonstige.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Diagramm tägliche Ausgaben, $days Tage, insgesamt $total. Der höchste Tag war $peakDay mit $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Diagramm tägliche Ausgaben, $days Tage, nichts ausgegeben.';
  }

  @override
  String get costSourceMetered => 'Gemessen';

  @override
  String get costSourceCounted => 'Gezählt';

  @override
  String get costSourceFixed => 'Fest';

  @override
  String get costSourceEstimated => 'Geschätzt';

  @override
  String get costSourceMeteredHelp => 'Echte erfasste Kosten pro Aufruf.';

  @override
  String get costSourceCountedHelp =>
      'Eigene Zählung dieses Servers mal Stückpreis.';

  @override
  String get costSourceFixedHelp =>
      'Eine Rechnung, gleichmäßig verteilt auf die abgedeckten Tage.';

  @override
  String get costSourceEstimatedHelp =>
      'Aus der Textlänge berechnet. Die tatsächlichen Kosten betragen mindestens dies.';

  @override
  String get costEstimated => 'geschätzt';

  @override
  String get costColShare => 'Anteil';

  @override
  String get costColChange => 'Veränderung';

  @override
  String get costColCalls => 'Aufrufe';

  @override
  String get costColSource => 'Quelle';

  @override
  String get costColFailed => 'Fehlgeschlagen';

  @override
  String get costColFees => 'Anbietergebühren';

  @override
  String get costColTokens => 'Token-Kosten';

  @override
  String get costTokenCost => 'Token-Kosten';

  @override
  String get costFailureRate => 'Fehlerquote';

  @override
  String costSortBy(String column) {
    return 'Sortieren nach $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, aufsteigend sortiert';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, absteigend sortiert';
  }

  @override
  String get costOpenRowHint => 'Öffnet die Details';

  @override
  String costSpokenSpent(String amount) {
    return 'ausgegeben $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'Anbietergebühren $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share der Gesamtsumme';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count Aufrufe';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate fehlgeschlagen';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'geschätzte Token-Kosten $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'berechnet $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count Aufrufe';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate fehlgeschlagen';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount Tokens, geschätzt';
  }

  @override
  String get costOpenBilling => 'Abrechnungsseite öffnen';

  @override
  String get costByDay => 'Nach Tag';

  @override
  String get costSplitBy => 'Aufteilen nach';

  @override
  String get costShowInTable => 'In Tabelle anzeigen';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Grenzt die Tabelle auf $name ein und gruppiert nach $group.';
  }

  @override
  String get costNothingRecorded =>
      'In diesem Zeitraum wurde hier nichts erfasst.';

  @override
  String costLastUsed(String when) {
    return 'zuletzt genutzt $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Und $count weitere. In der Tabelle anzeigen.',
      one: 'Und 1 weiterer. In der Tabelle anzeigen.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Verwendungszweck';

  @override
  String get costKeyService => 'Dienst';

  @override
  String get costKeySetting => 'Einstellung';

  @override
  String get costKeySetIn => 'Wo festgelegt';

  @override
  String get costKeyVault => 'Vault-Eintrag';

  @override
  String get costKeyStatus => 'Status';

  @override
  String get costKeyConfigured => 'Festgelegt';

  @override
  String get costKeyNotConfigured => 'Nicht festgelegt';

  @override
  String get costKeyLastUsed => 'Zuletzt genutzt';

  @override
  String get costKeyNotUsed => 'Nicht in diesem Zeitraum';

  @override
  String get costKeyCap => 'Ausgabenobergrenze';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '$left von $cap übrig';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share der Obergrenze genutzt';
  }

  @override
  String get costKeyNoCap => 'Keine';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In diesen $days Tagen wurde nichts ausgegeben',
      one: 'An diesem Tag wurde nichts ausgegeben',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'In diesen Tagen wurde nichts ausgegeben';

  @override
  String get costEmptyFiltered => 'Keine Ausgaben passen zu diesen Filtern';

  @override
  String get costEmptyGroup => 'Nichts aufzulisten für diese Gruppierung';

  @override
  String get costAppsNote =>
      'Apps und MCP-Server: „Ausgegeben“ ist das, was der Anbieter berechnet hat. Token-Kosten sind eine Schätzung dessen, was die Ergebnisse in Modell-Tokens gekostet haben, und sind bereits in den Modellausgaben enthalten.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount an festen Kosten für diesen Zeitraum sind ausgelassen. Aktiviere „Feste Kosten einbeziehen“, um sie hinzuzufügen.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Workspaces haben $amount über eigene Schlüssel bezahlt. Das ist nicht das Geld dieses Servers und wird daher ausgelassen.';
  }

  @override
  String get costOlderServerTitle => 'Dieser Server braucht ein Update';

  @override
  String get costOlderServer =>
      'Kosten nach Dienst, Schlüssel und App gibt es ab einer neueren Serverversion. Aktualisiere den Server und prüfe dann erneut.';

  @override
  String get costCheckAgain => 'Erneut prüfen';

  @override
  String get costSpendCardTitle => 'Ausgaben, letzte 30 Tage';

  @override
  String get costSpendCardOpen => 'Kosten';

  @override
  String get costSpendCardHint => 'Öffnet den Tab „Kosten“';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Ausgaben der letzten 30 Tage: $spent ausgegeben, $charged berechnet, $margin Marge';
  }

  @override
  String get costSort => 'Sortieren nach';

  @override
  String get costSortName => 'Name';

  @override
  String get costByWorkspace => 'Nach Workspace';

  @override
  String get costTopTools => 'Top-Tools';

  @override
  String get costToolList => 'An das Modell gesendete Tool-Liste';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Und $count weitere Tools.',
      one: 'Und 1 weiteres Tool.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Telegram-Bot von Casama verwenden';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Sprich mit $bot in Telegram. Ein Tippen, nichts einzurichten.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Dein Telegram ist in einem anderen Workspace verbunden. Das Verbinden hier verschiebt es.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Deine Nachrichten dort gehen an $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Deine Nachrichten dort gehen an $other. Tippe, um sie an $bot zu senden.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Telegram-Nachrichten gehen jetzt an $bot.';
  }

  @override
  String get telegramFinish => 'In Telegram abschließen';

  @override
  String get telegramFinishHelp =>
      'Drücke in Telegram auf Start. Tu dies nur mit deinem eigenen Telegram-Konto. Dies aktualisiert sich, sobald du verbunden bist.';

  @override
  String get telegramOpenAgain => 'Telegram erneut öffnen';

  @override
  String get telegramConnected => 'Telegram ist verbunden';

  @override
  String telegramConnectedHelp(String name) {
    return 'Verbunden als $name. Schreib dem Bot jederzeit in Telegram; der Chat erscheint auch hier in Allgemein.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Schreib dem Bot jederzeit in Telegram; der Chat erscheint auch hier in Allgemein.';

  @override
  String get telegramConnect => 'Telegram verbinden';

  @override
  String get telegramDisconnect => 'Telegram trennen';

  @override
  String get telegramDisconnectConfirm => 'Telegram trennen?';

  @override
  String get telegramDisconnectHelp =>
      'Deine Bots antworten nicht mehr in Telegram. Dein Chatverlauf bleibt hier.';

  @override
  String get telegramPickBot => 'Telegram-Nachrichten gehen an';

  @override
  String get telegramNeedsBot =>
      'Erstelle zuerst einen Bot und verbinde dann Telegram.';

  @override
  String get telegramNotOffered =>
      'Dieser Server hat keinen eigenen Telegram-Bot. Du kannst deinen eigenen Bot in den Chat-Apps eines Bots verbinden.';

  @override
  String get chatAppsSettingsHelp =>
      'Sprich mit deinen Bots über die Chat-Apps, die du ohnehin nutzt. Nachrichten landen in deinem Allgemein-Chat, sodass du hier weitermachen kannst.';

  @override
  String get chatAppsPerBot =>
      'E-Mail und eigene Bots werden pro Bot eingerichtet: Öffne einen Bot und dann Chat-Apps.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack und mehr';

  @override
  String get chatAppsSlackHelp =>
      'Slack wird pro Slack-Workspace für einen Bot hinzugefügt. Wähle den Bot und dann „Zu Slack hinzufügen“.';

  @override
  String get chatAppsSlackPickBot => 'Slack hinzufügen für';

  @override
  String get slackAnyoneInWorkspace => 'Alle in diesem Slack-Workspace';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Alle im Workspace können mit dem Bot sprechen, nicht nur die aufgeführten Personen. Freigaben erfordern weiterhin jemanden auf der Liste.';

  @override
  String get discordUseCasama => 'Discord-Bot von Casama verwenden';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Sprich mit $bot in Discord. Melde dich einmal bei Discord an, dann schreib dem Bot oder nutze überall /ask.';
  }

  @override
  String get discordOtherWorkspace =>
      'Dein Discord ist in einem anderen Workspace verbunden. Das Verbinden hier verschiebt es.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Discord-Nachrichten gehen jetzt an $bot.';
  }

  @override
  String get discordFinish => 'In Discord abschließen';

  @override
  String get discordFinishHelp =>
      'Melde dich im Browser bei Discord an und erlaube Casama. Tu dies nur mit deinem eigenen Discord-Konto. Dies aktualisiert sich, sobald du verbunden bist.';

  @override
  String get discordOpenAgain => 'Discord-Anmeldung erneut öffnen';

  @override
  String get discordConnected => 'Discord ist verbunden';

  @override
  String discordConnectedHelp(String name) {
    return 'Verbunden als $name. Schreib dem Casama-Bot in Discord oder nutze überall /ask; der Chat erscheint auch hier in Allgemein.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Schreib dem Casama-Bot in Discord oder nutze überall /ask; der Chat erscheint auch hier in Allgemein.';

  @override
  String get discordConnect => 'Discord verbinden';

  @override
  String get discordDisconnect => 'Discord trennen';

  @override
  String get discordDisconnectConfirm => 'Discord trennen?';

  @override
  String get discordDisconnectHelp =>
      'Deine Bots antworten nicht mehr in Discord. Dein Chatverlauf bleibt hier.';

  @override
  String get discordPickBot => 'Discord-Nachrichten gehen an';

  @override
  String get discordNeedsBot =>
      'Erstelle zuerst einen Bot und verbinde dann Discord.';

  @override
  String get discordNotOffered =>
      'Dieser Server hat keine eigene Discord-App. Du kannst deine eigene Discord-App in den Chat-Apps eines Bots verbinden.';

  @override
  String get inactiveAccountsNote =>
      'Wenn du Casama nicht mehr nutzt: Nach 30 Tagen pausieren deine Routinen und Beobachtungen, bis du zurück bist. Nach 6 Monaten werden die gespeicherten Dateien deiner Computer entfernt und nach 12 Monaten (24, falls du je gezahlt hast) dein Konto. Wir mailen dir, bevor etwas entfernt wird. Konten mit bezahltem Abo sind nie betroffen.';

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
  String get inactivityModeOff => 'Aus';

  @override
  String get inactivityModeReport => 'Melden';

  @override
  String get inactivityModeOn => 'Ein';

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
    return 'aktiv $when';
  }

  @override
  String get inactivityStateResting => 'Ruht';

  @override
  String get inactivityStateFilesSoon => 'Dateien werden bald entfernt';

  @override
  String get inactivityStateRemovalSoon => 'Entfernung bald';

  @override
  String get inactivityStateRemoving => 'Wird entfernt';

  @override
  String get inactivityKept => 'Behalten';

  @override
  String get keepAccount => 'Dieses Konto behalten';

  @override
  String get keepAccountHelp =>
      'Wird wegen Nichtnutzung nie in den Ruhezustand versetzt oder entfernt';

  @override
  String get computerFilesRemoved => 'Gespeicherte Dateien entfernt';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Dieser Computer wurde 6 Monate nicht genutzt, daher wurden seine gespeicherten Dateien am $date entfernt. Er startet frisch.';
  }

  @override
  String get downloadSavedFiles => 'Gespeicherte Dateien herunterladen';

  @override
  String get downloadSavedFilesHelp =>
      'Ein .tar.gz seines Home-Ordners, ohne ihn zu wecken';

  @override
  String get liveActivity => 'Live-Aktivität';

  @override
  String get liveRowHelp => 'Warteliste, Anmeldungen und Downloads in Echtzeit';

  @override
  String get liveRefresh => 'Aktualisieren';

  @override
  String get liveTabActivity => 'Aktivität';

  @override
  String get liveTabAlerts => 'Warnungen';

  @override
  String get liveGroupAll => 'Alle';

  @override
  String get liveGroupWaitlist => 'Warteliste';

  @override
  String get liveGroupAccounts => 'Konten';

  @override
  String get liveGroupMoney => 'Geld';

  @override
  String get liveGroupWebsite => 'Website';

  @override
  String get liveGroupGrowth => 'Wachstum';

  @override
  String get liveGroupSupport => 'Support';

  @override
  String get liveKindWaitlistJoined => 'Auf die Warteliste eingetragen';

  @override
  String get liveKindWaitlistAdmitted => 'Von der Warteliste eingelassen';

  @override
  String get liveKindSignup => 'Neues Konto';

  @override
  String get liveKindSignupRefused => 'Registrierung abgewiesen';

  @override
  String get liveKindFirstChat => 'Erster Chat';

  @override
  String get liveKindMilestone =>
      'Weitere erste Male (Bot, Computer, Anruf, Routine)';

  @override
  String get liveKindSubscription => 'Neues Abonnement';

  @override
  String get liveKindSubscriptionEnded => 'Abonnement beendet';

  @override
  String get liveKindPurchase => 'Credits gekauft';

  @override
  String get liveKindSupportTicket => 'Support-Ticket';

  @override
  String get liveKindFeedback => 'Feedback';

  @override
  String get liveKindAccountDeleted => 'Konto gelöscht';

  @override
  String get liveKindDownloadClick => 'Download-Klick';

  @override
  String get liveKindQrOpen => 'Download-QR-Code geöffnet';

  @override
  String get liveKindStartClick => 'Kostenlos starten geklickt';

  @override
  String get liveKindInviteOpen => 'Einladungslink geöffnet';

  @override
  String get liveNow => 'jetzt';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes Min.';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours Std.';
  }

  @override
  String get liveTestSent => 'Testmeldung an deine Geräte gesendet';

  @override
  String get liveTodayWaitlist => 'Heute beigetreten';

  @override
  String get liveTodaySignups => 'Konten heute';

  @override
  String get liveTodayDownloads => 'Downloads heute';

  @override
  String get liveTodayMoney => 'Geld heute';

  @override
  String get liveRetry => 'Erneut versuchen';

  @override
  String get liveEmpty =>
      'Noch nichts. Neue Aktivität erscheint hier innerhalb von Sekunden.';

  @override
  String get liveOlder => 'Ältere anzeigen';

  @override
  String get liveAlertsHelp =>
      'Wähle aus, was als Push an deine Telefone, Macs und Browser geht. Passiert viel auf einmal, bekommst du eine Zusammenfassung statt einzelner Pushs.';

  @override
  String get livePauseAll => 'Alle Meldungen pausieren';

  @override
  String get livePauseAllHelp => 'Aktivität erscheint hier trotzdem';

  @override
  String get liveSendTest => 'Testmeldung senden';

  @override
  String get liveSendTestHelp => 'Prüfen, ob Meldungen dieses Gerät erreichen';

  @override
  String get liveAlertsFooter =>
      'Meldungen warten während deiner Ruhezeiten (Einstellungen → Benachrichtigungen) und kommen danach gesammelt an. Erlaube im Browser Benachrichtigungen für diese Website, um sie dort zu erhalten.';

  @override
  String get liveStatusOn => 'Live: Aktualisierung alle paar Sekunden';

  @override
  String get liveStatusPaused => 'Live. Meldungen sind pausiert';

  @override
  String get liveGroupApp => 'App';

  @override
  String get liveKindAppFirstOpen => 'App zum ersten Mal geöffnet';

  @override
  String get liveKindAppReinstall => 'App neu installiert';

  @override
  String get liveKindSigninStarted => 'Anmeldung gestartet';

  @override
  String get liveKindTrialStarted => 'Testphase gestartet';

  @override
  String get liveKindRenewal => 'Abonnement verlängert';

  @override
  String get liveKindRefund => 'Erstattung';

  @override
  String get liveKindDisputeOpened => 'Streitfall eröffnet';

  @override
  String get liveKindPlanCancelFailed => 'Abo nicht gekündigt';

  @override
  String get liveKindStoreReview => 'Store-Bewertung';

  @override
  String get liveKindStoreCrashes => 'Store-Absturzberichte';

  @override
  String get liveKindDay2Return => 'Zurück an Tag 2';

  @override
  String get liveKindWeek1Return => 'Zurück in Woche 1';

  @override
  String get liveKindDeviceGone => 'App wahrscheinlich gelöscht';

  @override
  String get liveKindPartnerInterest => 'Creator interessiert an Partners';

  @override
  String get liveKindCreatorOpen => 'Creator-Link geöffnet';

  @override
  String get liveKindPartnerClaimed => 'Creator-Code verwendet';

  @override
  String get liveKindGiftOpen => 'Geschenklink geöffnet';

  @override
  String get liveKindCompRedeemed => 'Geschenk-Abo eingelöst';

  @override
  String get liveKindReferralRewarded => 'Einladung hat sich gelohnt';

  @override
  String get liveKindNewsletterConfirmed => 'Newsletter-Anmeldung';

  @override
  String get liveKindTestimonialSubmitted => 'Kundenstimme zur Prüfung';

  @override
  String get liveDailyDigest => 'Morgen-Zusammenfassung';

  @override
  String get liveDailyDigestHelp =>
      'Gestriger Funnel und Downloads, um 9 Uhr deiner Zeitzone';

  @override
  String get liveFunnelClicks => 'Klicks';

  @override
  String get liveFunnelOpens => 'Erste Öffnungen';

  @override
  String get liveFunnelSignups => 'Konten';

  @override
  String get liveFunnelChats => 'Erste Chats';

  @override
  String get liveFunnelPaying => 'Bezahlt';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent %';
  }

  @override
  String get liveByPerson => 'Nach Person';

  @override
  String get liveSearch => 'E-Mail, Land oder Quelle suchen';

  @override
  String get liveNoMatches => 'Nichts passt zu dieser Suche';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schritte',
      one: '1 Schritt',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'wahrscheinlich';

  @override
  String get liveStepClick => 'Auf Download geklickt';

  @override
  String get liveStepOpen => 'App geöffnet';

  @override
  String get liveStepSignup => 'Konto erstellt';

  @override
  String get liveStepChat => 'Erster Chat';

  @override
  String get liveStepPaying => 'Zahlend';

  @override
  String get liveJourneyTitle => 'Was passiert ist';

  @override
  String get liveJourneyVisitor => 'Besucher';

  @override
  String get liveJourneyWho => 'Wer';

  @override
  String get liveJourneyFrom => 'Woher';

  @override
  String get liveJourneyDevice => 'Gerät';

  @override
  String get liveJourneyTimeline => 'Zeitleiste';

  @override
  String get liveJourneyNow => 'Jetzt';

  @override
  String get liveJourneySource => 'Quelle';

  @override
  String get liveJourneyCampaign => 'Kampagne';

  @override
  String get liveJourneyLanding => 'Erste Seite';

  @override
  String get liveJourneyClickedFrom => 'Angeklickt auf';

  @override
  String get liveJourneyPlatform => 'Plattform';

  @override
  String get liveJourneyStore => 'Von';

  @override
  String get liveJourneyVersion => 'Version';

  @override
  String get liveJourneyCountry => 'Land';

  @override
  String get liveJourneyLikelyHelp =>
      'Über Gerät, Land und Uhrzeit einem Website-Klick zugeordnet, nicht über einen Link. Als gute Schätzung betrachten.';

  @override
  String get liveJourneyPlan => 'Abo';

  @override
  String get liveJourneyMessages => 'Gesendete Nachrichten';

  @override
  String get liveJourneyBots => 'Bots';

  @override
  String get liveJourneyDevices => 'Angemeldet auf';

  @override
  String get liveJourneyLastActive => 'Zuletzt aktiv';

  @override
  String get liveJourneyJoined => 'Konto erstellt';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap später';
  }

  @override
  String get liveJourneyNone => 'Darüber ist noch nichts Weiteres bekannt.';

  @override
  String get liveJourneyCopyEmail => 'E-Mail kopieren';

  @override
  String get liveJourneyCopied => 'E-Mail kopiert';

  @override
  String get liveJourneyOpenAdmin => 'In Admin öffnen';

  @override
  String get liveJourneyGone =>
      'Dieser Eintrag ist älter als 30 Tage, daher sind seine Details weg.';

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
  String get planChangeTitle => 'Abo-Änderung bestätigen';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Zu $plan wechseln';
  }

  @override
  String get planChangeChargedNow => 'Jetzt fällig';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Enthält $tax Steuer';
  }

  @override
  String get planChangeCredit => 'Gutschrift für ungenutzte Zeit';

  @override
  String planChangeThen(String amount, String period) {
    return 'Danach $amount / $period (zzgl. Steuern)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Nächste Abrechnung am $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Bestätigen und zahlen';

  @override
  String get planChangeHaveCode => 'Hast du einen Code?';

  @override
  String get planChangeCodeLabel => 'Rabattcode';

  @override
  String get planChangeCodeHint => 'Code eingeben';

  @override
  String get planChangeApply => 'Anwenden';

  @override
  String get planChangeRemove => 'Entfernen';

  @override
  String get planChangeDiscountApplied => 'Rabatt angewendet';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '$percent % Rabatt, bei jeder Verlängerung';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$percent % Rabatt, für $count Verlängerungen',
      one: '$percent % Rabatt, für 1 Verlängerung',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '$amount Rabatt, bei jeder Verlängerung';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$amount Rabatt, für $count Verlängerungen',
      one: '$amount Rabatt, für 1 Verlängerung',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '$percent % Rabatt auf jede Verlängerung; endet bei erneutem Abo-Wechsel';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '$amount Rabatt auf jede Verlängerung; endet bei erneutem Abo-Wechsel';
  }

  @override
  String get planChangeInvalidCode =>
      'Dieser Code kann bei diesem Abo nicht verwendet werden.';

  @override
  String get planChangeCodeCostsMore =>
      'Dieser Code würde deinen aktuellen Rabatt ersetzen und mehr kosten.';

  @override
  String get planChangeCodeEndsLasting =>
      'Dieser Code würde deinen aktuellen dauerhaften Rabatt beenden.';

  @override
  String get planChangeCodeNotBetter =>
      'Du hast bereits einen gleich guten oder besseren Rabatt.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Ersetzt deinen aktuellen Rabatt von $percent %';
  }

  @override
  String get planChangeReplacesDiscount => 'Ersetzt deinen aktuellen Rabatt';

  @override
  String get planChangePriceMoved =>
      'Der Gesamtbetrag hat sich geändert, seit du dies geöffnet hast. Prüfe den neuen Betrag und bestätige erneut.';

  @override
  String get planChangePeriodWeek => 'Woche';

  @override
  String get planChangePeriodMonth => 'Monat';

  @override
  String get planChangePeriodYear => 'Jahr';

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
  String get partnerProgramTitle =>
      'Machst du Videos, Beiträge oder einen Newsletter?';

  @override
  String get partnerProgramSubtitle =>
      'Verdiene ein Jahr lang 30 % von dem, was Personen zahlen, die du schickst';

  @override
  String get partnerYourCode => 'Dein Creator-Code';

  @override
  String get partnerPaused => 'Pausiert';

  @override
  String get partnerPortal => 'Einnahmen und Auszahlungen';

  @override
  String partnerShareText(String link, String code) {
    return 'Probiere Casama aus – KI-Teamkollegen, die für dich arbeiten. Nutze bei der Anmeldung meinen Code $code: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name hat dich zu Casama geschickt.';
  }

  @override
  String get partnerClaimed =>
      'Creator-Code hinzugefügt. Willkommen bei Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Danke, dass du $name unterstützt. Willkommen bei Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'Dieser Creator-Code existiert nicht. Prüfe ihn und versuche es erneut.';

  @override
  String get partnerErrOwnCode =>
      'Das ist dein eigener Code. Teile ihn stattdessen mit deinem Publikum.';

  @override
  String get partnerErrWindowClosed =>
      'Creator-Codes können nur in den ersten Tagen nach der Anmeldung eingegeben werden.';

  @override
  String get partnerErrAlreadyPaying =>
      'Creator-Codes gelten für neue Konten vor der ersten Zahlung.';

  @override
  String get partnerErrAlready =>
      'Du hast bereits den Code eines Creators eingegeben.';

  @override
  String get partnerErrReferred =>
      'Du bist über eine Einladung aus deinem Bekanntenkreis beigetreten, daher kann kein Creator-Code hinzugefügt werden.';

  @override
  String get partnerErrOff =>
      'Creator-Codes sind auf diesem Server nicht verfügbar.';

  @override
  String get referralHaveCodeAny => 'Hast du einen Code?';

  @override
  String get referralCodeHintAny => 'Code von Bekannten oder Creator';

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
  String get testimonialStateDraft => 'Entwurf';

  @override
  String get testimonialStateHidden => 'Verborgen';

  @override
  String get testimonialStateWithdrawn => 'Zurückgezogen';

  @override
  String get testimonialPlaceSiteHome => 'Startseite von casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'Preisseite von casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'App-Abos';

  @override
  String get testimonialPlaceAppSignin => 'App-Anmeldung';

  @override
  String get testimonialSourceEmail => 'E-Mail';

  @override
  String get testimonialSourceInApp => 'In der App';

  @override
  String get testimonialSourceOther => 'Sonstiges';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sterne',
      one: '1 Stern',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Was Leute über Casama sagen';

  @override
  String get testimonialAskTitle => 'Gefällt dir Casama?';

  @override
  String get testimonialAskSubtitle => 'Sag es uns in einem Satz.';

  @override
  String get testimonialAskHint => 'Was gefällt dir daran?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama darf mich damit auf casama.ai und in der App zitieren – als $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama darf mich damit auf casama.ai und in der App zitieren – als Person, die Casama nutzt';

  @override
  String get testimonialAskSend => 'Senden';

  @override
  String get testimonialAskNotNow => 'Nicht jetzt';

  @override
  String get testimonialAskThanks => 'Vielen Dank! Wir lesen jede Rückmeldung.';

  @override
  String get communityTitle => 'Community';

  @override
  String get communitySentence =>
      'Casama ist Open Source. Wenn es dir hilft, hilft ein Stern auf GitHub anderen Menschen, es zu finden.';

  @override
  String get communityStarOnGitHub => 'Stern auf GitHub geben';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Chatte mit dem Team und anderen, die Casama nutzen';

  @override
  String get starAskTitle => 'Casama auf GitHub';

  @override
  String get starAskNotNow => 'Nicht jetzt';

  @override
  String get cloudSignInTitle => 'Mit deinem Casama-Konto anmelden';

  @override
  String get cloudSignInBody =>
      'Die kostenlose persönliche Lizenz kommt aus deinem Casama-Konto. Nur die Lizenz geht an diesen Server; deine Chats bleiben dort.';

  @override
  String get cloudSignInEmail => 'E-Mail';

  @override
  String get cloudSignInSendCode => 'Code senden';

  @override
  String get cloudSignInCode => 'Code aus der E-Mail';

  @override
  String get cloudSignInVerify => 'Anmelden';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Wir haben einen Code an $email gesendet. Gib ihn hier ein.';
  }

  @override
  String get licenseSetupTitle => 'Hol dir deine kostenlose persönliche Lizenz';

  @override
  String get licenseSetupBody =>
      'Dieser Server braucht eine Lizenz, bevor Bots arbeiten können. Die persönliche Nutzung ist für eine Person kostenlos: Melde dich mit deinem Casama-Konto an, und die Lizenz verlängert sich alle 30 Tage automatisch online.';

  @override
  String get licensePersonalButton => 'Kostenlose persönliche Lizenz holen';

  @override
  String get licensePersonalNote =>
      'Persönlich: eine Person, für den persönlichen Gebrauch, auf deinem eigenen Computer oder Server.';

  @override
  String get licenseBusinessTitle => 'Oder Business-Schlüssel eingeben';

  @override
  String get licenseBusinessHint => 'Lizenzschlüssel einfügen';

  @override
  String get licenseBusinessSave => 'Diesen Schlüssel verwenden';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Nutzt du Casama bei der Arbeit oder im Team? Business kostet $monthlyPrice pro aktiver Person und Monat ($yearlyMonthlyPrice bei jährlicher Abrechnung). Schreib an $email.';
  }

  @override
  String get licenseActivated => 'Lizenz aktiv. Deine Bots können loslegen.';

  @override
  String get licenseOtherServer => 'Anderen Server verwenden';

  @override
  String get licenseRenew => 'Verlängern';

  @override
  String get licenseRenewTitle => 'Lizenz dieses Servers verlängern';

  @override
  String licenseGraceBanner(String date) {
    return 'Die Lizenz dieses Servers ist abgelaufen. Bots arbeiten bis $date weiter; verlängere vorher.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'Die Lizenz dieses Servers ist abgelaufen. Verlängere sie bald, damit Bots weiterlaufen.';

  @override
  String get licenseExpiredBanner =>
      'Die Lizenz dieses Servers ist abgelaufen, daher sind neue Bot-Durchläufe pausiert. Deine Daten sind sicher: Du kannst dich weiterhin anmelden, lesen und exportieren. Verlängere, um Bots wieder zu starten.';

  @override
  String get licenseErrorRequired =>
      'Dieser Server braucht zuerst eine Lizenz. Hol dir die kostenlose persönliche Lizenz oder gib einen Business-Schlüssel ein.';

  @override
  String licenseErrorSeats(String email) {
    return 'Alle Plätze der Lizenz dieses Servers sind belegt. Für weitere Personen ist eine Business-Lizenz nötig: Schreib an $email.';
  }

  @override
  String get licenseErrorExpired =>
      'Die Lizenz dieses Servers ist abgelaufen, daher sind neue Bot-Durchläufe pausiert. Deine Daten sind sicher. Verlängere die Lizenz, um Bots wieder zu starten.';

  @override
  String get licenseEditionPersonal => 'Persönlich';

  @override
  String get licenseEditionTrial => 'Testphase';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Audit-Export';

  @override
  String get licenseFeatureAuditForwarding => 'Audit-Weiterleitung';

  @override
  String get licenseFeatureRoles => 'Erweiterte Rollen';

  @override
  String get setupLicenseTitle => 'Kostenlose persönliche Lizenz';

  @override
  String get setupLicenseBody =>
      'Melde dich mit deinem Casama-Konto an, um die kostenlose persönliche Lizenz für diesen Server zu erhalten: eine Person, persönlicher Gebrauch. Du kannst das auch später erledigen.';

  @override
  String get setupLicenseSignIn => 'Mit Casama anmelden';

  @override
  String get setupLicenseReady =>
      'Die kostenlose persönliche Lizenz gehört zu deinem Server.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Angemeldet als $email. Die kostenlose persönliche Lizenz gehört zu deinem Server.';
  }

  @override
  String get setupLicenseSkipped =>
      'Noch keine Lizenz. Dein Server fragt beim Start danach.';

  @override
  String setupLicenseFailed(String error) {
    return 'Die persönliche Lizenz konnte nicht erstellt werden ($error). Dein Server fragt beim Start danach.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Der Server von Casama läuft in Docker Desktop, einer kostenlosen App, die WSL 2 nutzt, um ihn vom Rest deines PCs zu trennen.';

  @override
  String get setupDockerStep1Windows =>
      'Führe das heruntergeladene Installationsprogramm aus und lasse „WSL 2 verwenden“ aktiviert.';

  @override
  String localUpdateAvailable(String version) {
    return 'Ein Server-Update ist bereit: $version';
  }

  @override
  String get localUpdateButton => 'Aktualisieren';

  @override
  String get localUpdateLater => 'Später';

  @override
  String localUpdateTitle(String version) {
    return 'Deinen Server auf $version aktualisieren';
  }

  @override
  String get localUpdateBody =>
      'Die Datenbank wird zuerst gesichert. Startet die neue Version nicht, kehrt dein Server zu seiner jetzigen Version zurück.';

  @override
  String localUpdateDone(String version) {
    return 'Auf $version aktualisiert.';
  }

  @override
  String get localUpdateRolledBack =>
      'Die neue Version ist nicht gestartet, daher ist dein Server zur vorherigen Version zurückgekehrt. Nichts ging verloren, und ein Datenbank-Backup wurde gespeichert.';

  @override
  String localUpdateFailed(String detail) {
    return 'Das Update ist fehlgeschlagen: $detail';
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
  String get shCloudScreenTitle => 'Modelle von Casama Cloud';

  @override
  String get shCloudPitch =>
      'Die Modelle von Casama, ohne eigene Schlüssel zu verwalten. Bezahlt über ein Casama Cloud-Abo.';

  @override
  String get shCloudTurnOn => 'Einschalten';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Ein · bezahlt von $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, bezahlt von $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Nicht ein. Nur ein Admin dieses Servers kann es einschalten.';

  @override
  String get shCloudManage => 'Verwalten';

  @override
  String get shCloudSignInBody =>
      'Melde dich mit deinem Casama-Konto an, um festzulegen, wer für Modelle von Casama Cloud bezahlt. Deine Bots, Chats und dein Gedächtnis bleiben auf diesem Server.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Bei Casama Cloud angemeldet als $email';
  }

  @override
  String get shCloudOtherAccount => 'Anderes Konto verwenden';

  @override
  String get shCloudContinue => 'Weiter';

  @override
  String get shCloudPayerTitle => 'Wer bezahlt?';

  @override
  String get shCloudPayerBody =>
      'Modelle von Casama Cloud werden von einem Casama Cloud-Workspace bezahlt, den du besitzt oder leitest. Sein Abo, die enthaltene Nutzung und das Tageslimit werden mit allem anderen geteilt, was er nutzt.';

  @override
  String get shCloudPayerNone =>
      'Du leitest noch keinen Casama Cloud-Workspace. Erstelle einen zum Bezahlen; er startet leer.';

  @override
  String get shCloudCreateWorkspace => 'Einen erstellen';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Workspace von $name';
  }

  @override
  String get shCloudNoPlan => 'Noch kein Abo';

  @override
  String shCloudCovered(String plan) {
    return 'Dein $plan-Abo deckt das ab.';
  }

  @override
  String get shCloudPlanTitle => 'Abo auswählen';

  @override
  String get shCloudPlanBody =>
      'Modelle von Casama Cloud gehören zu jedem Casama Cloud-Abo: dieselbe enthaltene Nutzung, dasselbe Tageslimit und dieselben Aufladungen wie in der Cloud. Kein Aufpreis für Selbsthosting.';

  @override
  String get shCloudTryFirst => 'Zuerst testen';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Kostenlose Nutzung zum Testen: etwa $amount an Nachrichten, einmal pro Casama-Konto. Nichts zu kaufen.';
  }

  @override
  String get shCloudTrialUsed =>
      'Die kostenlose Nutzung zum Testen ist auf diesem Casama-Konto aufgebraucht. Wähle ein Abo, um weiterzumachen.';

  @override
  String get shCloudIntervalWeek => 'Wöchentlich';

  @override
  String get shCloudIntervalMonth => 'Monatlich';

  @override
  String get shCloudIntervalYear => 'Jährlich';

  @override
  String get shCloudWaitingForPlan =>
      'Beende die Zahlung im Browser. Dieser Bildschirm macht von selbst weiter, sobald das Abo eintrifft.';

  @override
  String get shCloudWaitingTimedOut =>
      'Das Abo ist noch nicht eingetroffen. Eine Zahlung kann ein paar Minuten dauern, bis sie erscheint.';

  @override
  String get shCloudCheckAgain => 'Erneut prüfen';

  @override
  String get shCloudGiftCode => 'Hast du einen Geschenkcode?';

  @override
  String get shCloudGiftCodeLabel => 'Geschenkcode';

  @override
  String get shCloudRedeem => 'Einlösen';

  @override
  String get shCloudNoWayToBuy =>
      'Abos können in dieser App nicht gekauft werden. Kaufe eines auf casama.ai mit demselben Konto und prüfe hier dann erneut.';

  @override
  String get shCloudPurchasePending =>
      'Dein Kauf wartet auf Freigabe. Sobald er durchgeht, geht es hier weiter.';

  @override
  String get shCloudPurchaseFailed =>
      'Der Kauf ging nicht durch. Es wurde nichts berechnet.';

  @override
  String get shCloudConnecting =>
      'Dieser Server wird mit Casama Cloud verbunden…';

  @override
  String get shCloudLoading => 'Wird geladen…';

  @override
  String get shCloudReviewTitle => 'Vor dem Einschalten prüfen';

  @override
  String get shCloudReviewPays => 'Wer bezahlt';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan in $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Kostenlose Nutzung zum Testen in $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Welche Bots wechseln';

  @override
  String get shCloudReviewAll => 'Alle Bots';

  @override
  String get shCloudReviewNoKey => 'Nur Bots ohne funktionierenden Schlüssel';

  @override
  String get shCloudReviewPick => 'Bots auswählen';

  @override
  String get shCloudReviewNoBots =>
      'Dieser Server hat noch keine Bots. Neue Bots können Casama Cloud nutzen.';

  @override
  String get shCloudReviewDefault => 'Neue Bots nutzen ebenfalls Casama Cloud';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Modell von Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Kein funktionierender Schlüssel';

  @override
  String shCloudStepDown(String from) {
    return 'Antworten sind eventuell kürzer oder weniger sorgfältig als bei $from. Probiere es zuerst bei einem Bot aus.';
  }

  @override
  String get shCloudReviewJobs => 'Gedächtnis, Bilder und Sprache';

  @override
  String get shCloudJobMemory => 'Suche im Gedächtnis';

  @override
  String get shCloudJobImages => 'Bilder';

  @override
  String get shCloudJobTts => 'Vorlesen';

  @override
  String get shCloudJobStt => 'Diktat';

  @override
  String get shCloudJobOwnKey => 'Dein eigener Schlüssel';

  @override
  String get shCloudJobMemoryOptIn =>
      'Auch für das Gedächtnis Casama Cloud nutzen';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'Das Gedächtnis wird im Hintergrund neu indiziert; die Suche funktioniert währenddessen weiter.';

  @override
  String get shCloudJobLiveNote =>
      'Live-Sprache, Telefonanrufe und Video nutzen weiterhin deine eigenen Schlüssel.';

  @override
  String get shCloudWhatGoes => 'Was an Casama Cloud geht';

  @override
  String get shCloudReviewPrivacy =>
      'Nachrichten an das Modell laufen über Casama Cloud und werden nicht gespeichert. Die Nutzung (Modell, Tokens, Kosten) erscheint auf deiner Cloud-Rechnung. Bots, Chats, Gedächtnis, Dateien und Computer bleiben auf diesem Server.';

  @override
  String get shCloudWhatGoesLink => 'Was dieser Server sendet';

  @override
  String get shCloudFallback =>
      'Wenn Casama Cloud aufgebraucht oder nicht erreichbar ist, meinen eigenen Schlüssel nutzen';

  @override
  String get shCloudFallbackHelp =>
      'Jede Antwort über deinen eigenen Schlüssel weist darauf hin.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString Personen nutzen diesen Server und das $plan-Abo deckt $seatsString ab. Jede weitere Person wird zum Zusatzpersonen-Preis von Casama Cloud berechnet.';
  }

  @override
  String get shCloudApply => 'Casama Cloud einschalten';

  @override
  String get shCloudPickOne =>
      'Wähle mindestens einen Bot aus oder lass neue Bots es nutzen.';

  @override
  String get shCloudPolicyTitle => 'Wer es nutzen darf';

  @override
  String get shCloudPolicyEveryone => 'Alle auf diesem Server';

  @override
  String get shCloudPolicyChosen => 'Nur ausgewählte Personen';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Personen ausgewählt',
      one: '1 Person ausgewählt',
      zero: 'Noch niemand ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Tageslimit pro Person';

  @override
  String get shCloudNoLimit => 'Kein Limit';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount pro Tag';
  }

  @override
  String get shCloudPolicySaved => 'Gespeichert';

  @override
  String get shCloudDoneTitle => 'Casama Cloud ist eingeschaltet';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bots nutzen jetzt Casama Cloud.',
      one: '1 Bot nutzt jetzt Casama Cloud.',
      zero: 'Neue Bots nutzen Casama Cloud.',
    );
    return '$_temp0 Die Nutzung erscheint auf dem Nutzungs-Bildschirm dieses Servers und auf deiner Cloud-Rechnung.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Sag Hallo zu $bot';
  }

  @override
  String get shCloudDone => 'Fertig';

  @override
  String get shCloudUsageTitle => 'Nutzung';

  @override
  String shCloudIncludedLeft(String amount) {
    return '$amount der enthaltenen Nutzung diesen Monat übrig';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Heute: $spend von $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Heute: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount an Credits';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return '$amount kostenlose Nutzung zum Testen übrig';
  }

  @override
  String get shCloudPriceNote =>
      'Zu dem Preis, den Casama Cloud berechnet. Dieselben Aufrufe stehen auf deiner Cloud-Rechnung unter dem Namen dieses Servers.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Du heute: $spend von $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud hat 80 % der enthaltenen Nutzung dieses Monats verbraucht.';

  @override
  String get shCloudWarnDaily =>
      'Casama Cloud hat 80 % des heutigen Limits verbraucht.';

  @override
  String get shCloudTopUp => 'Aufladen';

  @override
  String get shCloudUseOwnKey => 'Meinen eigenen Schlüssel nutzen';

  @override
  String get shCloudStopOutOfCredits =>
      'Die Nutzung von Casama Cloud für diesen Monat ist aufgebraucht.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'Das heutige Casama Cloud-Limit ist aufgebraucht. Es setzt sich um $time zurück.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'Das heutige Casama Cloud-Limit ist aufgebraucht. Es setzt sich morgen zurück.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud braucht ein Abo für $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'Das Casama Cloud-Abo für $workspace ist abgelaufen.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'Das Abo für $workspace deckt nicht alle ab, die hier Casama Cloud nutzen.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Du hast das heutige Casama Cloud-Limit auf diesem Server erreicht.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Dein Admin hat Casama Cloud für dich noch nicht eingeschaltet.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud wurde von diesem Server getrennt.';

  @override
  String get shCloudStopUnreachable =>
      'Casama Cloud ist gerade nicht erreichbar. Erneuter Versuch läuft.';

  @override
  String get shCloudSeePlans => 'Abos ansehen';

  @override
  String get shCloudRenew => 'Verlängern';

  @override
  String get shCloudAskAdmin => 'Einen Admin fragen';

  @override
  String get shCloudAskAdminBody =>
      'Nur ein Admin dieses Servers kann Casama Cloud ändern. Bitte jemanden darum; Bots und Routinen laufen von selbst weiter, sobald es behoben ist.';

  @override
  String get shCloudReconnect => 'Neu verbinden';

  @override
  String get shCloudFallbackActive =>
      'Währenddessen antwortet dein eigener Schlüssel, und jede Antwort weist darauf hin.';

  @override
  String get shCloudUseOwnKeyTitle =>
      'Währenddessen deinen eigenen Schlüssel nutzen?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Solange Casama Cloud nicht antworten kann, antworten Bots mit deinem eigenen Schlüssel, und jede solche Antwort weist darauf hin. Auf diesem Bildschirm jederzeit wieder ausschaltbar.';

  @override
  String get shCloudAddKeyFirst =>
      'Füge zuerst auf dem Bildschirm „Modelle“ einen eigenen Schlüssel hinzu.';

  @override
  String get shCloudRoutinesWait =>
      'Routinen warten und laufen von selbst weiter, wenn es behoben ist.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Gedächtnis holt auf: $doneString von $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'Die Suche nutzt Wörter für Erinnerungen, die noch nicht neu indiziert wurden.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Nachrichten an das Modell laufen jetzt über Casama Cloud, bezahlt von $workspace.';
  }

  @override
  String get shCloudGotIt => 'Verstanden';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Bezahlt von $workspace';
  }

  @override
  String get shCloudPaidBy => 'Bezahlt von';

  @override
  String get shCloudChangePayer => 'Ändern';

  @override
  String get shCloudChangeBots => 'Bots ändern';

  @override
  String get shCloudFallbackSection => 'Wenn Casama Cloud nicht antworten kann';

  @override
  String get shCloudTurnOff => 'Ausschalten';

  @override
  String get shCloudOffTitle => 'Casama Cloud ausschalten?';

  @override
  String get shCloudOffBody =>
      'Diese Bots wechseln zurück zu ihrem vorherigen Schlüssel, sofern er noch funktioniert, sonst zum Standardschlüssel des Workspace. Nichts anderes ändert sich, und du kannst es jederzeit wieder einschalten.';

  @override
  String get shCloudOffBotsNone => 'Derzeit nutzt kein Bot Casama Cloud.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud ist ausgeschaltet';

  @override
  String shCloudOffBackTo(String key) {
    return 'Zurück zu $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Braucht einen Schlüssel';

  @override
  String get shCloudAddKey => 'Schlüssel hinzufügen';

  @override
  String get shCloudSignInAgain =>
      'Deine Anmeldung bei Casama Cloud ist abgelaufen. Melde dich erneut an, um fortzufahren.';

  @override
  String get cloudAccountSection => 'Casama Cloud-Konto';

  @override
  String cloudAccountRow(String email) {
    return 'Angemeldet als $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Genutzt für die Lizenz dieses Servers und Casama Cloud-Modelle';

  @override
  String get cloudAccountSignOut => 'Bei Casama Cloud abmelden';

  @override
  String get cloudAccountSignOutBody =>
      'Dieses Gerät vergisst deine Anmeldung bei Casama Cloud. Dieser Server, seine Lizenz und Casama Cloud-Modelle laufen weiter.';

  @override
  String get cloudAccountDelete => 'Casama Cloud-Konto löschen';

  @override
  String get cloudAccountDeleteHelp =>
      'Löscht dein Konto bei Casama Cloud. Dieser Server und seine Daten bleiben.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Gib $email ein, um dein Casama Cloud-Konto zu löschen. Cloud-Workspaces, die nur dir gehören, werden mitgelöscht, und auf den Servern, für die sie bezahlen, funktionieren die Modelle von Casama Cloud nicht mehr. Ein im Web gekauftes Abo wird automatisch gekündigt. Ein im App Store oder bei Google Play gekauftes Abo nicht: Kündige es im jeweiligen Store.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Dein Casama Cloud-Konto wurde gelöscht. Seine Daten werden am $date endgültig entfernt.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Zu Casama Cloud umziehen';

  @override
  String get wsMoveSettingsToServer => 'Auf eigenen Server umziehen';

  @override
  String get wsMoveSettingsHelp =>
      'Bots, Chats, Gedächtnis und Dateien dieses Workspace auf einen anderen Server mitnehmen';

  @override
  String get wsMoveTitle => 'Diesen Workspace umziehen';

  @override
  String get wsMoveIntro =>
      'Alles kommt mit: Bots, Chats, Gedächtnis, Routinen, Dateien und Computer. Sobald es dort ist, bleibt diese Kopie lesbar, arbeitet aber nicht mehr.';

  @override
  String get wsMoveCloudOption => 'Zu Casama Cloud umziehen';

  @override
  String get wsMoveCloudOptionHelp =>
      'Melde dich mit deinem Casama-Konto an und wähle aus, wohin er geht.';

  @override
  String get wsMoveServerOption => 'Auf meinen eigenen Server umziehen';

  @override
  String get wsMoveServerOptionHelp =>
      'Öffne auf jenem Server Einstellungen › Workspace hierher holen und kopiere den Umzugscode.';

  @override
  String get wsMoveInstallServer => 'Casama Server installieren';

  @override
  String get wsMoveInstallServerHelp =>
      'Noch keinen Server? Starte zuerst einen auf diesem Computer.';

  @override
  String get wsMoveReceiveOption => 'Workspace hierher holen';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Einen Umzugscode für diesen Workspace erhalten, zur Verwendung auf dem Server, auf dem der andere Workspace gerade liegt.';

  @override
  String get wsMoveOwnerOnly =>
      'Nur der Inhaber des Workspace kann ihn umziehen.';

  @override
  String get wsMoveCloudPickTitle => 'Wohin soll er gehen?';

  @override
  String get wsMoveCloudNew => 'Ein neuer Workspace';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Startet leer auf Casama Cloud mit dem Namen $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Umgezogene Elemente landen neben dem, was schon da ist. Doppelte Namen bekommen „(moved)“.';

  @override
  String get wsMoveServerTitle => 'Auf deinen eigenen Server umziehen';

  @override
  String get wsMoveServerAddress => 'Serveradresse';

  @override
  String get wsMoveServerCode => 'Umzugscode';

  @override
  String get wsMoveCheckButton => 'Prüfen';

  @override
  String get wsMoveReceiveTitle => 'Workspace hierher holen';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'Öffne auf dem Server, auf dem der Workspace gerade liegt, Einstellungen › Auf eigenen Server umziehen und gib diese Adresse und diesen Code ein. Der Code gilt einmalig bis $time und bringt alles in $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Adresse dieses Servers';

  @override
  String get wsMoveReceiveCode => 'Umzugscode';

  @override
  String get wsMoveCopy => 'Kopieren';

  @override
  String get wsMoveCopied => 'Kopiert';

  @override
  String get wsMoveCheckTitle => 'Bereit zum Umzug';

  @override
  String wsMoveCheckTo(String name) {
    return 'Nach $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString Minuten',
      one: '1 Minute',
    );
    return '$size zu kopieren, etwa $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString Minuten',
      one: '1 Minute',
    );
    return 'Kurz vor Schluss pausieren Bots etwa $_temp0 und machen dann dort weiter.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'Das ist eine lange Pause. Wähle eine ruhige Zeit.';

  @override
  String get wsMoveCheckComes => 'Was mitkommt';

  @override
  String wsMoveCountBots(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString Bots',
      one: '1 Bot',
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
      other: '$nString Chats',
      one: '1 Chat',
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
      other: '$nString Erinnerungen',
      one: '1 Erinnerung',
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
      other: '$nString Routinen',
      one: '1 Routine',
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
      other: '$nString Dateien',
      one: '1 Datei',
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
      other: '$nString Computer',
      one: '1 Computer',
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
      other: '$nString Personen',
      one: '1 Person',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'Was dich danach braucht';

  @override
  String wsMoveReconnect(String names) {
    return 'Melde dich dort wieder bei diesen Apps an: $names';
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
      other: '$nString Personen erhalten',
      one: '1 Person erhält',
    );
    return '$_temp0 eine E-Mail-Einladung';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (eingeladen)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'ChatGPT-Abos bleiben zurück. Melde dich dort wieder bei ChatGPT an.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString Computer starten',
      one: '1 Computer startet',
    );
    return '$_temp0 dort frisch, mit wiederhergestelltem Home-Ordner.';
  }

  @override
  String get wsMoveResetNote =>
      'Freigaben, Vollzugriff und Gerätezugriff starten mit den Standardwerten des neuen Servers.';

  @override
  String get wsMoveBringKeys => 'Meine Schlüssel mitbringen';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString Schlüssel kommen',
      one: '1 Schlüssel kommt',
    );
    String _temp1 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'sie',
      one: 'ihn',
    );
    return '$_temp0 versiegelt mit, sodass nur der neue Server $_temp1 lesen kann.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Modell- und Chat-App-Schlüssel fügst du dort erneut hinzu.';

  @override
  String get wsMoveDoesntFit =>
      'Dieser Workspace passt nicht in das dortige Abo';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan passt dazu. Wähle es in Casama Cloud aus und prüfe dann erneut.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have von $limit';
  }

  @override
  String get wsMoveOverPeople => 'Personen';

  @override
  String get wsMoveOverBots => 'Bots';

  @override
  String get wsMoveOverComputers => 'Computer';

  @override
  String get wsMoveOverStorage => 'Speicherplatz';

  @override
  String get wsMoveUpdateSource =>
      'Aktualisiere zuerst diesen Server. Er ist älter als der, auf den du umziehst.';

  @override
  String get wsMoveUpdateTarget =>
      'Der Server, auf den du umziehst, braucht zuerst ein Update.';

  @override
  String get wsMoveStart => 'Umzug starten';

  @override
  String get wsMoveCheckAgain => 'Erneut prüfen';

  @override
  String get wsMoveProgressTitle => 'Zieht um';

  @override
  String get wsMoveStepStarting => 'Wird vorbereitet';

  @override
  String get wsMoveStepCopying =>
      'Dateien werden kopiert, während alles weiterläuft';

  @override
  String get wsMoveStepPausing =>
      'Bots werden pausiert, um die letzten Änderungen zu kopieren';

  @override
  String get wsMoveStepFinishing =>
      'Chats, Gedächtnis und Einstellungen werden gesendet';

  @override
  String get wsMoveStepImporting => 'Der neue Server übernimmt die Daten';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done von $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Du kannst die App schließen. Der Umzug läuft weiter, und du erhältst eine Benachrichtigung, sobald er fertig ist.';

  @override
  String get wsMoveFailedTitle => 'Der Umzug wurde gestoppt';

  @override
  String get wsMoveFailedBody =>
      'Hier hat sich nichts geändert: Dieser Workspace arbeitet weiter.';

  @override
  String get wsMoveTryAgain => 'Erneut versuchen';

  @override
  String get wsMoveNewCodeNeeded =>
      'Für einen neuen Versuch hole einen neuen Umzugscode.';

  @override
  String get wsMoveDoneTitle => 'Umgezogen';

  @override
  String wsMoveDoneBody(String server) {
    return 'Alles ist auf $server angekommen.';
  }

  @override
  String get wsMoveDoneNeeds => 'Ein paar Dinge brauchen dich dort:';

  @override
  String get wsMoveOpenThere => 'Dort öffnen';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Erneut bei $name anmelden';
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
      other: '$nString Personen wurden',
      one: '1 Person wurde',
    );
    return '$_temp0 per E-Mail eingeladen';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return '$name neu verbinden';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Gib dem Absender von $name die neue Webhook-Adresse';
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
      other: '$nString Tage',
      one: '1 Tag',
    );
    return 'Noch hierher gesendete Webhooks werden $_temp0 lang weitergeleitet.';
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
      other: '$nString Bots',
      one: '1 Bot',
    );
    return 'Freigaben prüfen für $_temp0';
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
      other: '$nString Bots',
      one: '1 Bot',
    );
    return 'Verbinde Casama Cloud-Modelle in den Einstellungen oder wähle ein anderes Modell für $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Füge deine Modellschlüssel dort hinzu';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString Elemente wurden',
      one: '1 Element wurde',
    );
    return '$_temp0 in „(moved)“ umbenannt';
  }

  @override
  String get wsMoveAfterReindex =>
      'Die Suche im Gedächtnis holt in ein paar Minuten auf.';

  @override
  String get wsMoveAfterNothing => 'Sonst nichts zu tun.';

  @override
  String get wsMoveSubTitle => 'Deine Abos';

  @override
  String get wsMoveSubToCloud =>
      'Bots in Casama Cloud arbeiten über dein Cloud-Abo. Falls du eine Business-Lizenz für diesen Server bezahlt hast, kündige sie, sobald du sie nicht mehr brauchst.';

  @override
  String get wsMoveSubFromCloud =>
      'Dein Casama Cloud-Abo verlängert sich weiter. Kündige es, sobald du auf deinem eigenen Server eingerichtet bist.';

  @override
  String get wsMoveSubManage => 'Abo verwalten';

  @override
  String get wsMovedTitle => 'Dieser Workspace ist umgezogen';

  @override
  String get wsMovedBodyCloud =>
      'Er ist jetzt auf Casama Cloud. Melde dich dort an, um weiterzumachen. Diese Kopie ist schreibgeschützt.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Er ist jetzt auf $host. Melde dich dort an, um weiterzumachen. Diese Kopie ist schreibgeschützt.';
  }

  @override
  String get wsMovedSignInCloud => 'Bei Casama Cloud anmelden';

  @override
  String wsMovedOpenServer(String host) {
    return '$host öffnen';
  }

  @override
  String get wsMovedViewOld => 'Alte Kopie ansehen';

  @override
  String get languageDevice => 'Gerätesprache';

  @override
  String get shortcutQuickAsk => 'Schnellanfrage';

  @override
  String shortcutAskBot(String name) {
    return '$name fragen';
  }

  @override
  String shortcutRunRoutine(String name) {
    return '$name ausführen';
  }

  @override
  String get settingsWordsWorkspace =>
      'workspace wechseln ändern team organisation rolle arbeitsbereich';

  @override
  String get settingsWordsAboutYou =>
      'profil name foto bild avatar pronomen über mich antwortstil fakten gedächtnis';

  @override
  String get settingsWordsPeople =>
      'mitglieder einladen team benutzer admins rollen einladungslink einladungscode beitreten entfernen';

  @override
  String get settingsWordsWorkspaceSettings =>
      'workspace name symbol logo verschlüsselung gedächtnis zahlungen stripe karte passwortmanager bot zu bot chrome erweiterung galerie vollzugriff berechtigungen freigabe freigaben fragen umgehen';

  @override
  String get settingsWordsSettingsDomains =>
      'domain website eigene dns kaufen verbinden verbindungen websites';

  @override
  String get settingsWordsUsage => 'kosten ausgaben geld credits tokens limits';

  @override
  String get settingsWordsBilling =>
      'abo abonnement upgrade pro plus max zahlung rechnung karte preise';

  @override
  String get settingsWordsInviteFriends =>
      'empfehlung credit belohnung teilen einladung';

  @override
  String get settingsWordsAdminConsole => 'admin konsole adminbereich';

  @override
  String get settingsWordsAppearance =>
      'theme dark mode light mode nachtfarben farben schrift schriftgröße hintergrund wallpaper look stil themes effekte bewegung animationen';

  @override
  String get settingsWordsQuietHours =>
      'nicht stören ruhezeit dnd schlaf stumm benachrichtigungen zeitplan';

  @override
  String get settingsWordsPushPrefsTitle =>
      'benachrichtigungen push hinweise antworten töne';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'anruf anrufe telefon klingeln sperrbildschirm vollbild eingehend annehmen';

  @override
  String get settingsWordsEmailTips =>
      'e-mail newsletter tipps neuigkeiten abbestellen';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'e-mail galerie übersicht monatliche empfehlungen';

  @override
  String get settingsWordsNewsletterTitle =>
      'e-mail newsletter monatlich neuigkeiten updates abonnieren abbestellen';

  @override
  String get settingsWordsWakeWord =>
      'sprache hey freisprechen mikrofon mikro zuhören';

  @override
  String get settingsWordsShowBotSteps => 'schritte tools details fortschritt';

  @override
  String get settingsWordsShowReplyUsage =>
      'kosten tokens preis nutzung pro antwort';

  @override
  String get settingsWordsCheckForUpdates =>
      'update updates version aktualisierung download automatisch';

  @override
  String get settingsWordsOpenAtLogin =>
      'autostart start login anmeldung automatisch starten';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'live-aktivität dynamic island sperrbildschirm andere geräte';

  @override
  String get settingsWordsShowBotsInNotch => 'notch menüleiste dynamic island';

  @override
  String get settingsWordsNotchOnHover => 'notch hover maus zeigen';

  @override
  String get settingsWordsLanguage =>
      'sprache gebietsschema deutsch englisch übersetzung';

  @override
  String get settingsWordsIntegrations =>
      'apps verbinden verbindungen gmail google slack kalender plugins tools mcp';

  @override
  String get settingsWordsSkills => 'skills katalog fähigkeiten anweisungen';

  @override
  String get settingsWordsCasamaLink =>
      'fernzugriff adresse tunnel selbst hosten telefon';

  @override
  String get settingsWordsServiceKeys =>
      'eigene schlüssel api-schlüssel suche karten daten';

  @override
  String get settingsWordsModelsTitle =>
      'eigene schlüssel api-schlüssel openai anthropic openrouter gemini modelle anbieter ollama lokale modelle';

  @override
  String get settingsWordsModelKeys =>
      'eigene schlüssel api-schlüssel openai anthropic openrouter gemini modelle anbieter ollama lokale modelle';

  @override
  String get settingsWordsAccount =>
      'e-mail e-mail ändern passwort überall abmelden anmeldung login';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa zweifaktor zwei-faktor authentifikator totp otp sicherheitscode';

  @override
  String get settingsWordsPairDevice =>
      'qr-code scannen anmelden koppeln telefon anderes gerät';

  @override
  String get settingsWordsPasskeys =>
      'passkey face id touch id fingerabdruck biometrie';

  @override
  String get settingsWordsWidgetsTitle =>
      'widgets startbildschirm sperrbildschirm steuerelemente kontrollzentrum kurzübersicht anheften kurzbefehl';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'karten wetter einheiten celsius fahrenheit heimatstadt ort währung aktien rot grün datenquellen';

  @override
  String get settingsWordsAppLock =>
      'app-sperre pin code face id touch id fingerabdruck biometrie windows hello screenshots datenschutz sperrbildschirm';

  @override
  String get settingsWordsPrivacy =>
      'daten export download konto löschen analyse tracking verlauf aufbewahrung blockierte personen blockieren';

  @override
  String get settingsWordsSecrets =>
      'geheimnisse zugangsdaten tresor umgebungsvariablen passwörter';

  @override
  String get settingsWordsComputers => 'computer docker sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      'geräte standort health orte ordner beobachtete apps browser chrome erweiterung telefon berechtigungen';

  @override
  String get settingsWordsUseThisComputer =>
      'begleiter dieser computer mac lokale dateien';

  @override
  String get settingsWordsHelpAndSupport =>
      'hilfe support kontakt ticket fehlerbericht feedback dokumentation community github stern open source discord ideenstatus';

  @override
  String get settingsWordsSignOut => 'abmelden ausloggen logout';

  @override
  String get notifDoIt => 'Ausführen';

  @override
  String get notifNotNow => 'Nicht jetzt';

  @override
  String get notifAllow => 'Erlauben';

  @override
  String get notifDeny => 'Ablehnen';

  @override
  String get notifApprove => 'Freigeben';

  @override
  String get notifReview => 'Prüfen';

  @override
  String get notifReply => 'Antworten';

  @override
  String get notifSend => 'Senden';

  @override
  String get notifReplyPlaceholder => 'Antworten…';

  @override
  String get notifChannelReplies => 'Antworten';

  @override
  String get notifChannelRepliesDescription =>
      'Ein Bot hat eine deiner Fragen beantwortet';

  @override
  String get notifChannelNeedsYou => 'Braucht dich';

  @override
  String get notifChannelNeedsYouDescription =>
      'Freigaben, Passwörter und Übernahmen, auf die deine Bots warten';

  @override
  String get notifChannelRoutines => 'Routinen und Briefings';

  @override
  String get notifChannelRoutinesDescription =>
      'Ergebnisse von Routinen und das Morgen-Briefing';

  @override
  String get notifChannelSuggestions => 'Vorschläge';

  @override
  String get notifChannelSuggestionsDescription =>
      'Dinge, die deine Bots dir anbieten zu erledigen';

  @override
  String get notifChannelAccount => 'Konto';

  @override
  String get notifChannelAccountDescription =>
      'Credits, Projekte und dein Server';

  @override
  String get notifCallChannel => 'Anrufe';

  @override
  String get notifCallLive => 'Im Anruf';

  @override
  String get notifCallMuted => 'Stummgeschaltet';

  @override
  String get notifCallReconnecting => 'Verbindung wird wiederhergestellt';

  @override
  String get notifCallMute => 'Mikro aus';

  @override
  String get notifCallUnmute => 'Mikro an';

  @override
  String get notifCallEnd => 'Anruf beenden';

  @override
  String get notifFromYourWatch => 'Von deiner Watch';

  @override
  String get notifLiveOpen => 'Öffnen';

  @override
  String get notifLiveStop => 'Stoppen';

  @override
  String get notifLiveReview => 'Prüfen';

  @override
  String get notifLiveAllow => 'Erlauben';

  @override
  String get notifLiveDeny => 'Ablehnen';

  @override
  String get notifLiveNeedsOk => 'Braucht dein OK';

  @override
  String get notifLiveNeedsYou => 'Braucht dich';

  @override
  String get notifLiveWorking => 'Arbeitet';

  @override
  String get notifLiveTakeOver => 'Möchte, dass du übernimmst';

  @override
  String get notifLiveFinished => 'Fertig';

  @override
  String get notifLiveProblem => 'Mit Problem gestoppt';

  @override
  String get notifLiveBotWorking => 'Ein Bot arbeitet';

  @override
  String get notifLiveBotsAtWork => 'Bots bei der Arbeit';

  @override
  String get notifLiveStepOne => '1 Schritt';

  @override
  String notifLiveSteps(int count) {
    return '$count Schritte';
  }

  @override
  String get notifAlarmTitle => 'Casama-Wecker';

  @override
  String get notifAlarmStop => 'Stoppen';

  @override
  String get widgetIosNeedsYouDescription =>
      'Sieh, welche Bots auf dich warten, und beantworte einfache Anfragen.';

  @override
  String get widgetIosBotDescription =>
      'Behalte im Blick, was einer deiner Bots gerade tut.';

  @override
  String get widgetIosAskDescription =>
      'Frage einen Bot oder starte mit einem Tippen einen Anruf – mit Ideen zum Ausprobieren.';

  @override
  String get widgetIosRoutinesDescription =>
      'Sieh, was als Nächstes läuft, und führe eine Routine sofort aus.';

  @override
  String get widgetIosTodayDescription =>
      'Dein Tag an einem Ort: Was dich braucht, was als Nächstes läuft und deine Credits.';

  @override
  String get widgetIosBriefDescription =>
      'Lies, was dir dein Bot heute Morgen berichtet hat.';

  @override
  String get widgetIosLibraryDescription =>
      'Öffne, was deine Bots zuletzt erstellt haben.';

  @override
  String get widgetIosTasksDescription =>
      'Sieh den Stand des Boards – mit dem, was zuerst auf dich wartet.';

  @override
  String get widgetIosCreditsDescription =>
      'Prüfe, wie viel von deinen Credits du verbraucht hast.';

  @override
  String get widgetIosInlineDescription =>
      'Sieh das Wichtigste auf einen Blick – über der Uhr.';

  @override
  String get widgetIosCanvasDescription =>
      'Zeigt, was deine Bots hier ablegen: einen Vers, einen Countdown, eine Serie, eine Liste oder ein Bild.';

  @override
  String get widgetMacNeedsYouDescription =>
      'Sieh, welche Bots auf dich warten.';

  @override
  String get widgetMacRoutinesDescription => 'Sieh, was als Nächstes läuft.';

  @override
  String get widgetAskCasama => 'Casama fragen';

  @override
  String get widgetControlAskDescription =>
      'Öffnet die Schnellanfrage direkt mit Tastatur.';

  @override
  String get widgetTalkToBot => 'Mit Bot sprechen';

  @override
  String widgetTalkToName(String name) {
    return 'Mit $name sprechen';
  }

  @override
  String get widgetControlTalkDescription =>
      'Startet einen Sprachanruf mit dem Bot deiner Wahl.';

  @override
  String get widgetRunRoutine => 'Routine ausführen';

  @override
  String get widgetControlRunDescription =>
      'Führt die gewählte Routine aus, ohne Casama zu öffnen.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Frag $bot irgendetwas';
  }

  @override
  String get widgetFallbackBrief => 'Morgen-Briefing';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot hat $title fertiggestellt';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'Stand $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Nichts steht an';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot möchte, dass du übernimmst';
  }

  @override
  String get widgetFallbackDay => 'Tag';

  @override
  String get widgetFallbackDays => 'Tage';

  @override
  String get widgetSampleVerse =>
      'Seid stille und erkennet, dass ich Gott bin!';

  @override
  String get widgetSampleVerseRef => 'Ps 46,11';

  @override
  String get widgetSampleVerseShort =>
      'Seid stille und erkennet, dass ich Gott bin! · Ps 46,11';

  @override
  String get widgetSampleVerseTiny => 'Seid stille und erkennet…';

  @override
  String get widgetSampleCanvasName => 'Tagesvers';

  @override
  String get widgetSampleNeedFlights => 'Flüge nach Lissabon suchen';

  @override
  String get widgetSampleNeedDentist => 'Zahnarzt auf Freitag verschieben?';

  @override
  String get widgetSampleBotText =>
      'Drei E-Mails warten auf eine Antwort, und die Acme-Rechnung ist zwei Tage überfällig.';

  @override
  String get widgetSampleStep => 'Liest deinen Posteingang';

  @override
  String get widgetSampleRoutineInbox => 'Posteingang aufräumen';

  @override
  String get widgetSampleRoutineBrief => 'Morgen-Briefing';

  @override
  String get widgetSampleRoutineWeekly => 'Wochenbericht';

  @override
  String get widgetSampleWeekdays => 'Werktags';

  @override
  String get widgetSampleEveryDay => 'Täglich';

  @override
  String get widgetSampleFridays => 'Freitags um 16:00';

  @override
  String get widgetSampleBrief =>
      'Drei E-Mails warten auf eine Antwort, und die Acme-Rechnung ist zwei Tage überfällig. Ab 15 Uhr Regen, also fahr frühzeitig zur Abholung um 16:30 Uhr los. Dein erstes Meeting ist um 10:00 Uhr mit Dana.';

  @override
  String get widgetSamplePricing => 'Q4-Preisseite';

  @override
  String get widgetSampleLogoIdeas => 'Logo-Ideen';

  @override
  String get widgetSampleTripPlan => 'Reiseplan';

  @override
  String get widgetSampleLaunchPost => 'Launch-Beitrag entwerfen';

  @override
  String get widgetSampleStarterInbox => 'Posteingang zusammenfassen';

  @override
  String get widgetSampleStarterFriday => 'Meinen Freitag planen';

  @override
  String get widgetSampleWorking => 'Arbeitet · 2:14';

  @override
  String get widgetSampleCreditsLeft => '5,70 \$ übrig';

  @override
  String get widgetSampleSpentToday => '0,80 \$ heute';

  @override
  String get widgetSampleMorning =>
      'Guten Morgen. Heute zwei Meetings, das erste um 10:00 Uhr mit dem Design-Team. Nach 15 Uhr Regen, nimm also einen Mantel mit. Dein Flug nach Lissabon am Freitag ist bestätigt.';

  @override
  String get widgetSampleLisbonPlan => 'Reiseplan für Lissabon';

  @override
  String get widgetSampleAgo => 'Milo · vor 2 Std.';

  @override
  String get widgetSampleLaunchEmail => 'Launch-E-Mail entwerfen';

  @override
  String get widgetSampleInReviewBy => 'In Prüfung · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo möchte Flugpreise für Lissabon suchen';

  @override
  String get widgetSampleUpNextAt => 'Als Nächstes · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · in 18 Min.';

  @override
  String get widgetSampleDate => 'Mittwoch, 18. November';

  @override
  String get widgetSampleNeedsCount => 'Braucht dich · 1';

  @override
  String get widgetSampleSearchFlights => 'Flugpreise für Lissabon suchen';

  @override
  String get widgetSampleAskAda => 'Ada fragen';

  @override
  String get widgetSampleAskMilo => 'Milo fragen';

  @override
  String get widgetSamplePlanDay => '☀️ Meinen Tag planen';

  @override
  String get widgetSampleWhatsNew => '✉️ Was ist neu in meinem Posteingang?';

  @override
  String get widgetAndroidBotDescription => 'Verfolge, was ein Bot gerade tut';

  @override
  String get widgetAndroidTodayDescription =>
      'Behalte deinen ganzen Tag mit deinen Bots an einem Ort';

  @override
  String get widgetAndroidBriefDescription =>
      'Lies dein Morgen-Briefing auf einen Blick';

  @override
  String get widgetAndroidLibraryDescription =>
      'Öffne, was deine Bots zuletzt erstellt haben';

  @override
  String get widgetAndroidTasksDescription =>
      'Verfolge den Stand deines Aufgabenboards';

  @override
  String get widgetAndroidCreditsDescription =>
      'Prüfe, wie viel du verbraucht hast';

  @override
  String get widgetAndroidCanvasDescription =>
      'Zeige, was deine Bots hier ablegen – vom Vers bis zum Countdown';

  @override
  String get widgetConfigBotTitle => 'Bot auswählen';

  @override
  String get widgetConfigRoutinesTitle => 'Routinen auswählen';

  @override
  String get widgetConfigRoutinesHint =>
      'Wähle bis zu vier für die Routinen, die du manuell startest';

  @override
  String get widgetConfigAutomatic => 'Automatisch';

  @override
  String get widgetConfigAutomaticHint =>
      'Die nächsten Durchläufe über alle deine Bots hinweg';

  @override
  String get widgetConfigDone => 'Fertig';

  @override
  String get widgetConfigSignedOutTitle => 'Noch nichts auszuwählen';

  @override
  String get widgetConfigSignedOut =>
      'Öffne Casama und melde dich an, dann wähle hier aus.';

  @override
  String get widgetConfigCanvasTitle => 'Leinwand auswählen';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'Die zuletzt von einem Bot festgelegte Leinwand';

  @override
  String get widgetConfigCanvasNone =>
      'Noch keine Leinwände. Bitte einen Bot, hier etwas abzulegen.';

  @override
  String get iosUsageTracking =>
      'Wenn du es erlaubst, teilt Casama Meta mit, wenn du nach einer Casama-Anzeige auf Facebook oder Instagram die App installierst, beitrittst oder ein Abo abschließt, damit wir messen können, welche Anzeigen wirken. Casama zeigt niemals Werbung und teilt niemals deine Chats oder Dateien.';

  @override
  String get iosUsageContacts =>
      'Deine Bots können Personen nachschlagen, die du kennst – nur wenn du Kontakte unter Geräteverbindungen aktivierst.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama öffnet deine Fotobibliothek, wenn du ein Foto für einen Bot oder für dein Profil auswählst.';

  @override
  String get iosUsageLocationAlways =>
      'Teile deinen Bots mit, wann du an deinen benannten Orten ankommst oder sie verlässt – auch wenn Casama geschlossen ist. Nur der Ortsname und die Uhrzeit werden geteilt, niemals deine Route.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Speichere eigene Orte wie Zuhause oder Arbeit und lass dich von deinen Bots erinnern, wann du zum nächsten Termin aufbrechen solltest. Wird nur verwendet, wenn du „Orte“ unter „Geräteverbindungen“ einschaltest.';

  @override
  String get iosUsageCamera =>
      'Casama verwendet die Kamera, wenn du ein Foto für einen Bot oder dein Profil aufnimmst.';

  @override
  String get iosUsageCalendars =>
      'Deine Bots können Fragen zu deinen Terminen beantworten und Ereignisse hinzufügen – nur wenn du Kalender unter Geräteverbindungen aktivierst.';

  @override
  String get iosUsageSpeech =>
      'Wenn der Diktierdienst von Casama nicht erreichbar ist, wandelt die Spracherkennung deines Geräts Gesprochenes in Text um.';

  @override
  String get iosUsageAlarmKit =>
      'Deine Bots können Wecker und Timer stellen, die auch im Stummmodus klingeln – nur wenn du Wecker unter Geräteverbindungen erlaubst.';

  @override
  String get iosUsageHomeKit =>
      'Deine Bots können dein HomeKit-Zuhause prüfen und steuern, wenn du Home unter Geräteverbindungen erlaubst; vor Änderungen fragen sie immer nach deiner Freigabe.';

  @override
  String get iosUsageMicrophone =>
      'Casama nutzt das Mikrofon für Diktate und Live-Anrufe mit deinen Bots. Erst nach deiner Zustimmung geht deine Stimme an KI-Anbieter, um dir zu antworten: Google Gemini für Anrufe, OpenAI für die Umwandlung von Diktaten in Text.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama liest nur Daten aus Apple Health und schreibt niemals dorthin.';

  @override
  String get iosUsageFaceId =>
      'Casama nutzt Face ID zum Entsperren der App bei aktivierter App-Sperre sowie zur Bestätigung riskanter Aktionen.';

  @override
  String get iosUsageHealthShare =>
      'Deine Bots können tägliche Zusammenfassungen zu Schlaf, Aktivität, Trainings und Herzwerten aus Apple Health sehen – nur wenn du Apple Health unter Geräteverbindungen aktivierst. Casama schreibt niemals in Apple Health und nutzt die Daten niemals für Werbung.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama nimmt deine Stimme auf, wenn du einen Bot etwas fragst, und sendet sie an deinen Casama-Server, wo ein KI-Anbieter (OpenAI, auf Casama Cloud) sie für deinen Bot in Text umwandelt.';

  @override
  String get macUsageContacts =>
      'Deine Bots können Personen nachschlagen, die du kennst – nur wenn du Kontakte unter Geräteverbindungen aktivierst.';

  @override
  String get macUsageSpeech =>
      'Wenn der Diktierdienst von Casama nicht erreichbar ist, wandelt die Spracherkennung deines Geräts Gesprochenes in Text um.';

  @override
  String get macUsageMicrophone =>
      'Casama nutzt das Mikrofon für Diktate und Live-Anrufe mit deinen Bots. Erst nach deiner Zustimmung geht deine Stimme an KI-Anbieter, um dir zu antworten: Google Gemini für Anrufe, OpenAI für die Umwandlung von Diktaten in Text.';

  @override
  String get macUsageAppleEvents =>
      'Die Schnellanfrage liest den Titel des vordersten Fensters und den aktuellen Tab deines Browsers – nur wenn du die Tastenkombination drückst.';

  @override
  String get nativeNameFileProvider => 'Casama-Computer';

  @override
  String get nativeNameNotifications => 'Casama-Benachrichtigungen';

  @override
  String get nativeNameSafari => 'Casama für Safari';

  @override
  String get nativeNameAskCasama => 'Casama fragen';

  @override
  String get nativeComputer => 'Computer';

  @override
  String get nativeSafariSignInIos =>
      'Öffne Casama auf diesem Gerät -> Einstellungen -> Auf anderem Gerät anmelden, oder füge unten einen Anmelde-Link ein.';

  @override
  String get nativeSafariSignInMac =>
      'Öffne Casama auf diesem Mac -> Einstellungen -> Auf anderem Gerät anmelden, oder füge unten einen Anmelde-Link ein.';

  @override
  String get linuxDesktopComment =>
      'Bots, die Arbeit erledigen – auf jedem deiner Bildschirme';

  @override
  String get linuxDesktopKeywords => 'KI;Assistent;Agent;Bot;Chat;';

  @override
  String macMenuAbout(String appName) {
    return 'Über $appName';
  }

  @override
  String get macMenuPreferences => 'Einstellungen…';

  @override
  String get macMenuServices => 'Dienste';

  @override
  String macMenuHide(String appName) {
    return '$appName ausblenden';
  }

  @override
  String get macMenuHideOthers => 'Andere ausblenden';

  @override
  String get macMenuShowAll => 'Alle einblenden';

  @override
  String macMenuQuit(String appName) {
    return '$appName beenden';
  }

  @override
  String get macMenuEdit => 'Bearbeiten';

  @override
  String get macMenuUndo => 'Widerrufen';

  @override
  String get macMenuRedo => 'Wiederholen';

  @override
  String get macMenuCut => 'Ausschneiden';

  @override
  String get macMenuCopy => 'Kopieren';

  @override
  String get macMenuPaste => 'Einsetzen';

  @override
  String get macMenuPasteAndMatchStyle => 'Einsetzen und Stil anpassen';

  @override
  String get macMenuDelete => 'Löschen';

  @override
  String get macMenuSelectAll => 'Alles auswählen';

  @override
  String get macMenuFind => 'Suchen';

  @override
  String get macMenuFindEllipsis => 'Suchen…';

  @override
  String get macMenuFindAndReplace => 'Suchen und ersetzen…';

  @override
  String get macMenuFindNext => 'Weitersuchen (vorwärts)';

  @override
  String get macMenuFindPrevious => 'Weitersuchen (rückwärts)';

  @override
  String get macMenuUseSelectionForFind => 'Auswahl für Suche übernehmen';

  @override
  String get macMenuJumpToSelection => 'Auswahl anzeigen';

  @override
  String get macMenuSpellingAndGrammar => 'Rechtschreibung und Grammatik';

  @override
  String get macMenuSpelling => 'Rechtschreibung';

  @override
  String get macMenuShowSpelling => 'Rechtschreibung und Grammatik einblenden';

  @override
  String get macMenuCheckDocumentNow => 'Dokument jetzt prüfen';

  @override
  String get macMenuCheckSpellingWhileTyping =>
      'Während der Texteingabe prüfen';

  @override
  String get macMenuCheckGrammar => 'Grammatik mit Rechtschreibung prüfen';

  @override
  String get macMenuCorrectSpelling =>
      'Rechtschreibung automatisch korrigieren';

  @override
  String get macMenuSubstitutions => 'Ersetzungen';

  @override
  String get macMenuShowSubstitutions => 'Ersetzungen einblenden';

  @override
  String get macMenuSmartCopyPaste => 'Intelligentes Kopieren/Einsetzen';

  @override
  String get macMenuSmartQuotes => 'Intelligente Anführungszeichen';

  @override
  String get macMenuSmartDashes => 'Intelligente Bindestriche';

  @override
  String get macMenuSmartLinks => 'Intelligente Links';

  @override
  String get macMenuDataDetectors => 'Datenerkennung';

  @override
  String get macMenuTextReplacement => 'Textersetzung';

  @override
  String get macMenuTransformations => 'Transformationen';

  @override
  String get macMenuMakeUpperCase => 'Großbuchstaben';

  @override
  String get macMenuMakeLowerCase => 'Kleinbuchstaben';

  @override
  String get macMenuCapitalize => 'Großschreiben';

  @override
  String get macMenuSpeech => 'Sprachausgabe';

  @override
  String get macMenuStartSpeaking => 'Sprachausgabe starten';

  @override
  String get macMenuStopSpeaking => 'Sprachausgabe stoppen';

  @override
  String get macMenuView => 'Darstellung';

  @override
  String get macMenuEnterFullScreen => 'Vollbildmodus';

  @override
  String get macMenuWindow => 'Fenster';

  @override
  String get macMenuMinimize => 'Minimieren';

  @override
  String get macMenuZoom => 'Zoomen';

  @override
  String get macMenuBringAllToFront => 'Alle nach vorne bringen';

  @override
  String get macMenuHelp => 'Hilfe';

  @override
  String get macMenuCheckForUpdates => 'Nach Updates suchen…';

  @override
  String get macMenuSettings => 'Einstellungen…';

  @override
  String get macMenuFile => 'Ablage';

  @override
  String get macMenuNewChat => 'Neuer Chat';

  @override
  String get macMenuNewBot => 'Neuer Bot…';

  @override
  String get macMenuQuickAsk => 'Schnellanfrage';

  @override
  String get macMenuSearch => 'Suchen…';

  @override
  String get macMenuCloseWindow => 'Fenster schließen';

  @override
  String get macMenuGo => 'Gehe zu';

  @override
  String get macMenuBots => 'Bots';

  @override
  String get macMenuInbox => 'Posteingang';

  @override
  String get macMenuBoard => 'Board';

  @override
  String get macMenuComputer => 'Computer';

  @override
  String get macMenuPages => 'Seiten';

  @override
  String get macMenuCasamaHelp => 'Casama-Hilfe';

  @override
  String get macMenuSendFeedback => 'Feedback senden…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Routine';

  @override
  String get siriRoutines => 'Routinen';

  @override
  String get siriCanvas => 'Leinwand';

  @override
  String get siriAutomatic => 'Automatisch';

  @override
  String get siriAutomaticSubtitle => 'Was ein Bot zuletzt festgelegt hat';

  @override
  String get siriChooseCanvas => 'Leinwand auswählen';

  @override
  String get siriChooseCanvasDescription =>
      'Zeige, was ein Bot zuletzt festgelegt hat, oder eine einzelne Leinwand.';

  @override
  String get siriChooseBot => 'Bot auswählen';

  @override
  String get siriChooseBotDescription =>
      'Wähle den Bot, den dieses Widget anzeigt.';

  @override
  String get siriChooseRoutines => 'Routinen auswählen';

  @override
  String get siriChooseRoutinesDescription =>
      'Zeige die nächsten Durchläufe oder bis zu vier ausgewählte Routinen.';

  @override
  String get siriOpenCasama => 'Casama öffnen';

  @override
  String get siriWhere => 'Wo';

  @override
  String get siriTalkToBot => 'Mit Bot sprechen';

  @override
  String get siriTalkToBotDescription =>
      'Startet einen Sprachanruf mit dem Bot deiner Wahl.';

  @override
  String get siriRunRoutine => 'Routine ausführen';

  @override
  String get siriRunRoutineControlDescription =>
      'Führt die gewählte Routine aus, ohne Casama zu öffnen.';

  @override
  String get siriCallAction => 'Anrufaktion';

  @override
  String get siriAction => 'Aktion';

  @override
  String get siriStopBot => 'Bot stoppen';

  @override
  String get siriRun => 'Durchlauf';

  @override
  String get siriAnswerRequest => 'Anfrage eines Bots beantworten';

  @override
  String get siriRequest => 'Anfrage';

  @override
  String get siriAllow => 'Erlauben';

  @override
  String get siriFromWidget => 'Von einem Widget';

  @override
  String get siriRunRoutineNow => 'Routine jetzt ausführen';

  @override
  String get siriAcceptSuggestion => 'Tun, was ein Bot vorschlägt';

  @override
  String get siriSuggestion => 'Vorschlag';

  @override
  String get siriBotStatusDescription =>
      'Wo ein Bot steht und was er gerade tut';

  @override
  String get siriNextRoutineDescription =>
      'Die nächste Routine und wann sie läuft';

  @override
  String get siriAskCasama => 'Casama fragen';

  @override
  String get siriAskVoiceDescription => 'Einen Bot per Sprache etwas fragen';

  @override
  String get siriWhatWaiting => 'Was auf dein OK wartet';

  @override
  String get siriAsk => 'Fragen';

  @override
  String get siriShortNeedsYou => 'Braucht dich';

  @override
  String get siriOpeningToFinish => 'Öffne Casama zum Abschließen.';

  @override
  String get siriName => 'Name';

  @override
  String get siriTitle => 'Titel';

  @override
  String get siriChat => 'Chat';

  @override
  String get siriBotSubtitle =>
      'Ein Bot in Casama, ein KI-Assistent für den Chat';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Eine Routine, die $bot in Casama ausführt';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Ein Chat mit $bot in Casama';
  }

  @override
  String get siriBotInCasama => 'Bot in Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Routine · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Chat mit $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'routine';

  @override
  String get siriKeywordChat => 'chat';

  @override
  String get siriAskBot => 'Bot fragen';

  @override
  String get siriAskBotDescription =>
      'Sendet eine Frage an einen deiner Casama-Bots (KI-Assistenten) in einem neuen Chat und liest die Antwort vor. Ist kein Bot genannt, antwortet der Bot, mit dem du zuletzt gesprochen hast.';

  @override
  String get siriCategoryBots => 'Bots';

  @override
  String get siriAskBotParamDescription =>
      'Welcher Bot gefragt werden soll. Leer lassen für den Bot, mit dem du zuletzt gesprochen hast.';

  @override
  String get siriQuestion => 'Frage';

  @override
  String get siriQuestionDescription =>
      'Was du den Bot in deinen eigenen Worten fragen möchtest.';

  @override
  String get siriWhatShouldIAsk => 'Was soll ich fragen?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Frag $bot $question';
  }

  @override
  String get siriRestOnScreen => 'Der Rest steht auf dem Bildschirm.';

  @override
  String get siriRestOnScreenEllipsis => '… Der Rest steht auf dem Bildschirm.';

  @override
  String get siriRunRoutineDescription =>
      'Führt eine Routine deiner Casama-Bots sofort aus. Das Ergebnis erscheint in der App und als Benachrichtigung – genau wie bei einem automatischen Durchlauf.';

  @override
  String get siriRoutineParamDescription =>
      'Welche Routine jetzt ausgeführt werden soll.';

  @override
  String siriSummaryRun(String routine) {
    return '$routine ausführen';
  }

  @override
  String get siriWhatNeedsMe => 'Was mich braucht';

  @override
  String get siriWhatNeedsMeDescription =>
      'Sagt, wie viele Dinge in Casama auf dich warten: die Bitte eines Bots um dein OK, eine Übernahme oder ein Vorschlag. Beantworte sie in der App.';

  @override
  String get siriOpenBot => 'Bot öffnen';

  @override
  String get siriOpenBotDescription =>
      'Öffnet deinen Chat mit einem deiner Casama-Bots.';

  @override
  String get siriOpenBotPersonDescription =>
      'Öffnet den Chat eines Casama-Bots.';

  @override
  String get siriOpenChat => 'Chat öffnen';

  @override
  String get siriOpenChatDescription =>
      'Öffnet einen deiner Chats mit einem Casama-Bot.';

  @override
  String get siriOpenRoutine => 'Bot einer Routine öffnen';

  @override
  String get siriOpenRoutineDescription =>
      'Öffnet den Bot, der eine deiner Casama-Routinen ausführt.';

  @override
  String get siriTalkDescription =>
      'Öffnet den Sprachmodus mit einem deiner Casama-Bots. Auf der Aktionstaste verfügbar.';

  @override
  String get siriAskGetReply => 'Bot fragen und Antwort erhalten';

  @override
  String get siriAskGetReplyDescription =>
      'Sendet eine Frage an einen Casama-Bot und gibt seine Antwort als Text für Kurzbefehle zurück.';

  @override
  String get siriGetLastReply => 'Letzte Antwort abrufen';

  @override
  String get siriGetLastReplyDescription =>
      'Gibt den neuesten Antworttext aus einem Chat mit einem Casama-Bot zurück.';

  @override
  String get siriStartComputer => 'Computer starten';

  @override
  String get siriStartComputerDescription =>
      'Weckt einen Casama-Computer nach Bestätigung auf.';

  @override
  String get siriComputerName => 'Computername';

  @override
  String get siriYourComputer => 'deinen Casama-Computer';

  @override
  String siriStartConfirm(String computer) {
    return '$computer starten?';
  }

  @override
  String get siriOpenToStartComputer =>
      'Öffne Casama, um deinen Computer zu starten.';

  @override
  String get siriFocusTitle => 'Casama-Fokusfilter festlegen';

  @override
  String get siriFocusDescription =>
      'Zeigt nur ausgewählte Bots und hält proaktive Meldungen optional zurück, solange dieser Fokus aktiv ist.';

  @override
  String get siriFocusBots => 'Anzuzeigende Bots';

  @override
  String get siriFocusHold => 'Proaktive Meldungen zurückhalten';

  @override
  String get siriFocusShowOne => '1 Bot anzeigen';

  @override
  String siriFocusShowMany(int count) {
    return '$count Bots anzeigen';
  }

  @override
  String get siriFocusHoldCheckIns => 'Meldungen zurückhalten';

  @override
  String get siriFocusAllowCheckIns => 'Meldungen zulassen';

  @override
  String get siriFocusAllBots => 'Alle Bots';

  @override
  String get siriFocusAllVisible => 'Alle Bots sichtbar';

  @override
  String get siriToolAsk => 'Einen Casama-Bot fragen';

  @override
  String get siriToolAskDescription =>
      'Stellt einem Casama-Bot der Person eine Frage und gibt seine Antwort zurück.';

  @override
  String get siriCategoryAssistants => 'Assistenten';

  @override
  String get siriToolBotDescription =>
      'Welcher Casama-Bot gefragt werden soll.';

  @override
  String get siriToolQuestionDescription => 'Was der Bot gefragt werden soll.';

  @override
  String get siriToolRun => 'Eine Casama-Routine ausführen';

  @override
  String get siriToolRunDescription =>
      'Führt eine gespeicherte Casama-Routine nach Bestätigung durch die Person aus.';

  @override
  String get siriCategoryAutomation => 'Automation';

  @override
  String get siriToolRoutineDescription => 'Die auszuführende Routine.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return '$routine mit $bot ausführen?';
  }

  @override
  String get siriToolNeeds => 'Was mich in Casama braucht';

  @override
  String get siriToolNeedsDescription =>
      'Prüft, wie viele Freigaben, Übernahmen oder Vorschläge in Casama warten.';

  @override
  String get siriOpenToCheck => 'Öffne Casama, um zu prüfen, was dich braucht.';

  @override
  String get siriToolStop => 'Einen Casama-Bot stoppen';

  @override
  String get siriToolStopDescription =>
      'Stoppt einen Bot, der gerade eine Aufgabe in Casama ausführt.';

  @override
  String get siriToolStopBotDescription => 'Der zu stoppende Bot.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot gestoppt.';
  }

  @override
  String get siriToolCall => 'Einen Casama-Bot anrufen';

  @override
  String get siriToolCallDescription =>
      'Öffnet Casama und startet einen Live-Sprachanruf mit dem gewählten Bot.';

  @override
  String get siriCategoryCommunication => 'Kommunikation';

  @override
  String get siriToolCallBotDescription => 'Der anzurufende Bot.';

  @override
  String siriCalling(String bot) {
    return '$bot wird angerufen.';
  }

  @override
  String siriBotIn(String app) {
    return 'Ein Bot in $app';
  }

  @override
  String get siriMe => 'Ich';

  @override
  String get siriABot => 'ein Bot';

  @override
  String get siriFavorited => 'Favorit';

  @override
  String siriSentTo(String bot) {
    return 'An $bot gesendet';
  }

  @override
  String get siriMessage => 'Nachricht';

  @override
  String get siriNone => 'Keine';

  @override
  String get siriErrorOneBot =>
      'Casama sendet jeweils nur an einen Bot. Welcher Bot?';

  @override
  String get siriErrorTextOnly =>
      'Siri kann Text an einen Bot senden. Dateien, Bilder und Orte fügst du in Casama hinzu.';

  @override
  String get siriErrorNoBot => 'Ich konnte diesen Bot in Casama nicht finden.';

  @override
  String get siriWhatShouldISend => 'Was soll ich senden?';

  @override
  String get siriAskCasamaBot => 'Casama-Bot fragen';

  @override
  String siriAskName(String bot) {
    return '$bot fragen';
  }

  @override
  String get siriAskAboutThis => 'Casama danach fragen';

  @override
  String siriPhraseAsk(String app) {
    return 'Frag $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Frag einen Bot in $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Frag $bot in $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Sprich mit einem Bot in $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Sprich mit $bot in $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Starte eine Routine in $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Starte $routine in $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'Wo werde ich in $app gebraucht';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'Was wartet in $app auf mich';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Frag $app etwas';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Starte meine Routine $routine in $app';
  }

  @override
  String get siriABotSubject => 'Ein Bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot braucht dein OK.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot möchte, dass du übernimmst.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot hat einen Vorschlag.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot braucht dich.';
  }

  @override
  String get siriOneThingNeedsYou => 'Eine Sache braucht dich.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count Dinge brauchen dich.';
  }

  @override
  String get siriUnlockPhone =>
      'Entsperre dein Telefon und versuche es erneut.';

  @override
  String get siriGeminiOff =>
      'Gemini ist für Casama auf diesem Telefon ausgeschaltet (Casama → Einstellungen → Datenschutz).';
}
