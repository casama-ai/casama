// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

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
  String get tabTitleCall => 'Chiamata';

  @override
  String get tabTitleProject => 'Progetto';

  @override
  String get tabTitleGroupChat => 'Chat di gruppo';

  @override
  String get loading => 'Caricamento…';

  @override
  String get retry => 'Riprova';

  @override
  String get keepGoing => 'Continua';

  @override
  String get keepGoingMessage => 'Continua da dove ti sei fermato.';

  @override
  String get startOver => 'Ricomincia';

  @override
  String get continueRunHint =>
      'Riprende da dove si è fermato, con un nuovo budget, invece di ricominciare la richiesta.';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get delete => 'Elimina';

  @override
  String get edit => 'Modifica';

  @override
  String get close => 'Chiudi';

  @override
  String get create => 'Crea';

  @override
  String get continueLabel => 'Continua';

  @override
  String get somethingWentWrong => 'Qualcosa è andato storto';

  @override
  String get errorViewHint =>
      'Riavviare l\'app dovrebbe risolvere il problema.';

  @override
  String get signInTitle => 'Accedi a Casama';

  @override
  String get signUpTitle => 'Crea il tuo account';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Accedi';

  @override
  String get signUp => 'Crea account';

  @override
  String get haveAccount => 'Hai già un account? Accedi';

  @override
  String get needAccount => 'Prima volta qui? Crea un account';

  @override
  String get magicLink => 'Inviami un link di accesso via email';

  @override
  String get magicLinkSent => 'Controlla la tua email per il link di accesso.';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get continueWithApple => 'Continua con Apple';

  @override
  String get continueWithEmail => 'Continua con l\'email';

  @override
  String get moreSignInOptions => 'Altre opzioni';

  @override
  String get usePasswordInstead => 'Usa invece una password';

  @override
  String get checkInboxTitle => 'Controlla la tua casella di posta';

  @override
  String checkInboxBody(String email) {
    return 'Abbiamo inviato un link di accesso e un codice a 6 cifre a $email. Tocca il link o inserisci qui il codice.';
  }

  @override
  String get emailCodeLabel => 'Codice a 6 cifre';

  @override
  String get resendLink => 'Invia di nuovo';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Invia di nuovo tra $secondsString s';
  }

  @override
  String get useDifferentEmail => 'Usa un\'altra email';

  @override
  String get authWrongPassword =>
      'Questa email e questa password non corrispondono. Riprova oppure accedi con un link via email.';

  @override
  String get authEmailNotConfirmed =>
      'Conferma prima la tua email: apri il link che ti abbiamo inviato.';

  @override
  String get authCodeInvalid =>
      'Questo codice è errato o scaduto. Controlla l\'ultima email oppure inviane uno nuovo.';

  @override
  String get authTooManyTries =>
      'Troppi tentativi. Attendi un minuto e riprova.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds secondi',
      one: '1 secondo',
    );
    return 'Troppe richieste insieme. Riprova tra $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'Ora puoi riprovare.';

  @override
  String computerInUseBy(String name) {
    return '$name sta usando questo computer';
  }

  @override
  String get authAccountExists =>
      'Esiste già un account con questa email. Accedi invece.';

  @override
  String get authSignupDisabled =>
      'Questo server non accetta nuove registrazioni.';

  @override
  String get useMagicLinkInstead => 'Inviami invece un link via email';

  @override
  String get invalidEmail => 'Inserisci un indirizzo email valido';

  @override
  String get passwordTooShort => 'Usa almeno 6 caratteri';

  @override
  String get signOut => 'Esci';

  @override
  String get onboardingTitle => 'Configura il tuo spazio di lavoro';

  @override
  String get createWorkspace => 'Crea uno spazio di lavoro';

  @override
  String get workspaceName => 'Nome dello spazio di lavoro';

  @override
  String get joinWorkspace => 'Unisciti con un codice di invito';

  @override
  String get inviteCode => 'Codice di invito';

  @override
  String get join => 'Unisciti';

  @override
  String get addModelKeyTitle => 'Aggiungi una chiave del modello';

  @override
  String get addModelKeyBody =>
      'I bot usano la tua chiave del provider di modelli. Viene salvata in forma crittografata e non viene più mostrata.';

  @override
  String get provider => 'Provider';

  @override
  String get label => 'Etichetta';

  @override
  String get apiKey => 'Chiave API';

  @override
  String get baseUrl => 'URL di base';

  @override
  String get testKey => 'Testa chiave';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'La chiave funziona ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Test della chiave non riuscito: $error';
  }

  @override
  String get createFirstBot => 'Crea il tuo primo bot';

  @override
  String get botName => 'Nome del bot';

  @override
  String get model => 'Modello';

  @override
  String get persona => 'Istruzioni';

  @override
  String get personaHint =>
      'Cosa fa questo bot e come deve lavorare. Una personalità compila questo campo; puoi modificarlo liberamente.';

  @override
  String get modelKey => 'Chiave del modello';

  @override
  String get navComputer => 'Computer';

  @override
  String get navChats => 'Chat';

  @override
  String get navTasks => 'Attività';

  @override
  String get settingsConnectionsSection => 'Connessioni';

  @override
  String get advanced => 'Avanzate';

  @override
  String get settingsAdvancedSummary => 'Segreti, computer, dispositivi';

  @override
  String get bots => 'Bot';

  @override
  String get newBot => 'Nuovo bot';

  @override
  String get noBots => 'Nessun bot';

  @override
  String get botStatusIdle => 'Inattivo';

  @override
  String get botStatusWorking => 'Al lavoro';

  @override
  String get botStatusWaiting => 'In attesa di te';

  @override
  String sidebarMoreWorking(int count) {
    return 'Altri $count al lavoro';
  }

  @override
  String get botStatusDisabled => 'Disattivato';

  @override
  String costToday(String cost) {
    return '$cost oggi';
  }

  @override
  String get newChat => 'Nuova chat';

  @override
  String get conversations => 'Conversazioni';

  @override
  String messageHint(String bot) {
    return 'Scrivi a $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Scrivi a $bot · @ per menzionare un\'app';
  }

  @override
  String get mentionSectionBots => 'Bot';

  @override
  String get mentionSectionApps => 'App';

  @override
  String get mentionSectionAddToBot => 'Aggiungi a questo bot';

  @override
  String get mentionSectionConnect => 'Collega';

  @override
  String get mentionSectionStartGroup => 'Avvia una chat di gruppo';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'App';

  @override
  String get mentionAddAction => 'Aggiungi';

  @override
  String get mentionConnectAction => 'Collega';

  @override
  String get mentionMaxApps => 'Puoi menzionare fino a 3 app per messaggio.';

  @override
  String get mentionRemovedApp => 'App rimossa';

  @override
  String get send => 'Invia';

  @override
  String get stop => 'Ferma';

  @override
  String get thinking => 'Sta pensando…';

  @override
  String get checkingItsWork => 'Controlla il suo lavoro…';

  @override
  String get mapFullScreen => 'Schermo intero';

  @override
  String get mapTitle => 'Mappa';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Fermato.';

  @override
  String emptyChat(String bot) {
    return 'Saluta $bot.';
  }

  @override
  String get toolRunning => 'In esecuzione';

  @override
  String get toolFailedLabel => 'Non riuscito';

  @override
  String get toolOutput => 'Risultato';

  @override
  String get remembered => 'Ha memorizzato qualcosa';

  @override
  String skillLoaded(String name) {
    return 'Competenza $name caricata';
  }

  @override
  String checkpointSaved(String label) {
    return 'Punto di ripristino salvato: $label';
  }

  @override
  String computerState(String state) {
    return 'Computer $state';
  }

  @override
  String get activity => 'Attività';

  @override
  String get timelineTitle => 'Cronologia esecuzioni';

  @override
  String get allEvents => 'Tutto';

  @override
  String get filterTools => 'Strumenti';

  @override
  String get filterMessages => 'Messaggi';

  @override
  String get filterSystem => 'Sistema';

  @override
  String get restore => 'Ripristina';

  @override
  String get restoreConfirm =>
      'Tornare a questo punto di ripristino? I file modificati da allora verranno sostituiti.';

  @override
  String get restored => 'Punto di ripristino ripristinato.';

  @override
  String get noRuns => 'Nessuna esecuzione.';

  @override
  String get computerTitle => 'Computer';

  @override
  String get computerStart => 'Avvia';

  @override
  String get computerSleep => 'Sospendi';

  @override
  String get screen => 'Schermo';

  @override
  String get terminal => 'Terminale';

  @override
  String get files => 'File';

  @override
  String get noScreen =>
      'Ancora nulla sullo schermo. La pagina del browser del bot compare qui.';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get upload => 'Carica';

  @override
  String get download => 'Scarica';

  @override
  String get emptyFolder => 'Questa cartella è vuota';

  @override
  String get noCheckpoints =>
      'Vengono salvati automaticamente prima di modifiche rischiose, così puoi annullarle.';

  @override
  String get computerAsleep =>
      'Il computer è in sospensione. I file sono salvati e si riattiva quando serve.';

  @override
  String get connectTerminal => 'Connetti';

  @override
  String get terminalDisconnected => 'Disconnesso.';

  @override
  String get terminalReconnecting =>
      'Riavvio del server, riconnessione in corso…';

  @override
  String get memory => 'Memoria';

  @override
  String get noMemories => 'Ancora nessun ricordo.';

  @override
  String get noMemoriesMatch => 'Nessun ricordo corrispondente.';

  @override
  String get clearSearch => 'Cancella';

  @override
  String get addMemory => 'Aggiungi un ricordo';

  @override
  String get addMemoryHelp =>
      'Qualcosa che il bot dovrebbe sempre sapere su di te o sul tuo lavoro.';

  @override
  String get addMemoryFactHint =>
      'Ad esempio: Il nostro anno fiscale inizia ad aprile.';

  @override
  String get addMemoryPreferenceHint =>
      'Ad esempio: Tieni i riepiloghi sotto i cinque punti elenco.';

  @override
  String get memoryAdded => 'Ricordo aggiunto';

  @override
  String get pin => 'Fissa';

  @override
  String get unpin => 'Non fissare più';

  @override
  String get deleteMemoryConfirm =>
      'Dimenticare questo ricordo? L\'azione è irreversibile.';

  @override
  String get skills => 'Competenze';

  @override
  String get noSkills =>
      'Nessuna competenza. Le competenze sono istruzioni che i bot caricano quando servono.';

  @override
  String get newSkill => 'Nuova competenza';

  @override
  String get skillName => 'Nome (minuscole, trattini)';

  @override
  String get skillDescription => 'Descrizione in una riga';

  @override
  String get skillBody => 'Istruzioni (Markdown)';

  @override
  String get enabled => 'Attiva';

  @override
  String get settings => 'Impostazioni';

  @override
  String get workspace => 'Spazio di lavoro';

  @override
  String get switchWorkspace => 'Cambia spazio di lavoro';

  @override
  String get modelKeys => 'Chiavi dei modelli';

  @override
  String get moreProviders => 'Altri provider';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, server personalizzati';

  @override
  String get toolPermissions => 'Permessi degli strumenti';

  @override
  String get devicesAdvancedSummary =>
      'Conservazione dei dati, modelli privati, bot con accesso';

  @override
  String get companionAdvancedSummary =>
      'Comandi, strumenti locali (MCP), agenti di coding';

  @override
  String get noKeys => 'Nessuna chiave del modello.';

  @override
  String get addKey => 'Aggiungi chiave';

  @override
  String get usage => 'Utilizzo';

  @override
  String get language => 'Lingua';

  @override
  String inviteSent(String email) {
    return 'Invito inviato a $email.';
  }

  @override
  String get botProfile => 'Profilo del bot';

  @override
  String get groupMembers => 'Bot in questa chat';

  @override
  String get groupMembersHelp =>
      'Ognuno mantiene la propria memoria e le proprie impostazioni. Toccane uno per aprire il profilo.';

  @override
  String get botAdvancedSummary =>
      'App di chat, link, regole, monitoraggi, plugin, attività';

  @override
  String get botActivityRow => 'Ogni esecuzione, passo dopo passo';

  @override
  String get createBotAdvancedSummary => 'Chiave del modello e modello';

  @override
  String get botProfileSection => 'Profilo';

  @override
  String get botBrain => 'Cervello';

  @override
  String get botAbilities => 'Capacità';

  @override
  String get botSchedule => 'Pianificazione';

  @override
  String get chatComputerLive => 'Al lavoro sul suo computer';

  @override
  String get autonomy => 'Autonomia';

  @override
  String get autonomyAskAlways => 'Chiedi prima di agire';

  @override
  String get autonomyAskRisky => 'Chiedi per azioni rischiose';

  @override
  String get autonomyAutonomous => 'Agisci in autonomia';

  @override
  String get saved => 'Salvato.';

  @override
  String get justNow => 'ora';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString minuti fa',
      one: '1 minuto fa',
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
      other: '$nString ore fa',
      one: '1 ora fa',
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
      other: '$nString giorni fa',
      one: 'ieri',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Un bot';

  @override
  String get addIntegration => 'Aggiungi integrazione';

  @override
  String get addSecret => 'Aggiungi segreto';

  @override
  String get allowedHosts => 'Host consentiti';

  @override
  String get allowedHostsHelp =>
      'Separati da virgola, ad esempio api.github.com';

  @override
  String get alwaysAllow => 'Consenti sempre';

  @override
  String get approval => 'Approvazione';

  @override
  String get approvalAlreadyDecided =>
      'Questa richiesta è già stata decisa o è scaduta.';

  @override
  String get approvals => 'Approvazioni';

  @override
  String get approve => 'Approva';

  @override
  String get approved => 'Approvato';

  @override
  String get authHeaderOptional =>
      'Intestazione di autorizzazione (facoltativa)';

  @override
  String get authSecretName =>
      'Nome del segreto di autenticazione (facoltativo)';

  @override
  String get authSecretNameHelp =>
      'Nome di un segreto da Impostazioni › Segreti, inviato come bearer token';

  @override
  String get baseUrlOptional => 'URL di base (facoltativo)';

  @override
  String get blankBot => 'Vuoto';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Scegli un modello';

  @override
  String get createBotNeedsModel =>
      'Scegli un modello qui sopra per creare questo bot.';

  @override
  String get createBotKeyRejected =>
      'Il provider ha rifiutato questa chiave. Controllala in Impostazioni → Chiavi dei modelli oppure scegli un\'altra chiave.';

  @override
  String get createBotDiscardTitle => 'Scartare questo bot?';

  @override
  String get createBotDiscardBody => 'Quello che hai inserito qui andrà perso.';

  @override
  String get searchModels => 'Cerca modelli o scrivi l\'ID di un modello';

  @override
  String get recommendedModels => 'Consigliati';

  @override
  String get allModels => 'Tutti i modelli';

  @override
  String useCustomModel(String id) {
    return 'Usa “$id”';
  }

  @override
  String modelListFallback(String reason) {
    return 'Modelli suggeriti mostrati. $reason Puoi comunque inserire qualsiasi ID modello.';
  }

  @override
  String get noModelsFound => 'Nessun modello corrispondente.';

  @override
  String get addModelKeyFirst =>
      'Aggiungi prima una chiave del modello. Il tuo bot la usa per ragionare; viene salvata crittografata e non viene più mostrata.';

  @override
  String get composioToolkits =>
      'Toolkit (separati da virgola, ad esempio github, gmail)';

  @override
  String get copySecret => 'Copia segreto';

  @override
  String get cronExpression => 'Espressione cron';

  @override
  String get cronHelp => 'minuto ora giorno mese giorno-settimana';

  @override
  String get denied => 'Rifiutato';

  @override
  String get deny => 'Rifiuta';

  @override
  String get everyHour => 'Ogni ora';

  @override
  String get expired => 'Scaduto';

  @override
  String get inbox => 'In arrivo';

  @override
  String get integrationName => 'Nome';

  @override
  String get integrationNameHelp =>
      'Lettere minuscole, numeri e trattini bassi';

  @override
  String get integrationType => 'Tipo';

  @override
  String get integrations => 'Integrazioni';

  @override
  String get kindMcp => 'Server MCP';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Segna tutto come letto';

  @override
  String get newRoutine => 'Nuova routine';

  @override
  String get noIntegrationsForBot =>
      'Aggiungi prima le integrazioni nelle Impostazioni, poi attivale qui per questo bot.';

  @override
  String get noRoutines => 'Nessuna routine';

  @override
  String get noSecrets => 'Nessun segreto';

  @override
  String get notifications => 'Notifiche';

  @override
  String get openInbox => 'Apri In arrivo';

  @override
  String get pipedreamApps => 'App (separate da virgola)';

  @override
  String get pipedreamClientId => 'Client ID';

  @override
  String get pipedreamClientSecret => 'Client secret';

  @override
  String get pipedreamProject => 'ID progetto';

  @override
  String get riskHigh => 'Rischio alto';

  @override
  String get riskLow => 'Rischio basso';

  @override
  String get riskMedium => 'Rischio medio';

  @override
  String get routineGithub => 'Su eventi GitHub';

  @override
  String get routineInstructions => 'Istruzioni';

  @override
  String get routineInstructionsHint => 'Cosa deve fare il bot ogni volta?';

  @override
  String get routineName => 'Nome';

  @override
  String get routineEditTitle => 'Modifica routine';

  @override
  String get routineEditSubtitle => 'Cambia cosa fa e quando viene eseguita.';

  @override
  String get routineRecentRuns => 'Esecuzioni recenti';

  @override
  String get routineNoRuns => 'Non è ancora stata eseguita.';

  @override
  String get routineSaved => 'Routine salvata';

  @override
  String get routineStarted => 'Routine avviata';

  @override
  String get routineWebhook => 'Su webhook';

  @override
  String get routines => 'Routine';

  @override
  String get routineAdvancedSummary =>
      'Attivatori GitHub e webhook, cron, fuso orario';

  @override
  String get routineRepeatDaily => 'Ogni giorno';

  @override
  String get routineRepeatWeekdays => 'Giorni feriali';

  @override
  String get routineRepeatWeekly => 'Ogni settimana';

  @override
  String get routineDay => 'Giorno';

  @override
  String get routineTimeLabel => 'Ora';

  @override
  String get routineRunsAt => 'Esecuzione';

  @override
  String routineTimesIn(String timezone) {
    return 'Gli orari sono in $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Personalizzato: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Altri attivatori';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ogni $nString minuti',
      one: 'Ogni minuto',
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
      other: 'Ogni $nString ore',
      one: 'Ogni ora',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Ogni ora al minuto :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Ogni giorno alle $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Giorni feriali alle $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Weekend alle $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days alle $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Giorno $day di ogni mese alle $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items e $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'domenica',
      'mon': 'lunedì',
      'tue': 'martedì',
      'wed': 'mercoledì',
      'thu': 'giovedì',
      'fri': 'venerdì',
      'sat': 'sabato',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Domenica',
      'mon': 'Lunedì',
      'tue': 'Martedì',
      'wed': 'Mercoledì',
      'thu': 'Giovedì',
      'fri': 'Venerdì',
      'sat': 'Sabato',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Guarda il tuo bot lavorare dal vivo';

  @override
  String get headlessScreenEmpty =>
      'Questo computer esegue solo il browser per restare leggero. Vedrai qui le sue pagine web quando ne apre una. Passa al desktop per vedere e controllare anche le app.';

  @override
  String get headlessScreenChecking =>
      'Controllo nuove pagine ogni pochi secondi';

  @override
  String get headlessBrowserOnly => 'Solo browser';

  @override
  String get switchedToDesktopHere =>
      'Passato a Desktop. Il suo schermo apparirà qui appena è pronto.';

  @override
  String get desktopBarLabel => 'Desktop · usa più memoria';

  @override
  String get switchToBrowserOnly => 'Passa a solo browser';

  @override
  String get switchingToBrowserOnly => 'Passaggio a solo browser…';

  @override
  String get switchedToBrowserOnly =>
      'Passato a solo browser. Ora usa meno memoria.';

  @override
  String get runNow => 'Esegui ora';

  @override
  String get secretName => 'Nome';

  @override
  String get secretNameHelp => 'Maiuscolo, ad esempio GITHUB_TOKEN';

  @override
  String get secretValue => 'Valore';

  @override
  String get secrets => 'Segreti';

  @override
  String get serverUrl => 'URL del server';

  @override
  String get specUrl => 'URL specifica OpenAPI';

  @override
  String get startFrom => 'Personalità';

  @override
  String get storedEncrypted => 'Salvato crittografato; non viene più mostrato';

  @override
  String get taskBlocked => 'Bloccato';

  @override
  String get taskDoing => 'In corso';

  @override
  String get taskDone => 'Completato';

  @override
  String get taskTodo => 'Da fare';

  @override
  String get test => 'Testa';

  @override
  String get timezone => 'Fuso orario';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Ripetizione';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Vedi esecuzione';

  @override
  String get webhookCreated => 'Webhook creato';

  @override
  String get webhookSecret => 'Segreto di firma';

  @override
  String get webhookShownOnce =>
      'Copia subito il segreto di firma. Viene mostrato una sola volta.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Connessione non riuscita: $error';
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
      other: 'Connesso, $nString strumenti',
      one: 'Connesso, 1 strumento',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Prossima: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Inviato solo a $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'richiesta $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Include routine: $names.';
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
      other: '$nString strumenti',
      one: '1 strumento',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'Il bot ha ripreso il controllo';

  @override
  String get botComputer => 'Computer';

  @override
  String get botComputerDefault =>
      'Il suo computer privato se ne ha uno, altrimenti il computer del team';

  @override
  String get botInControl => 'Bot al controllo';

  @override
  String get computerName => 'Nome';

  @override
  String get computers => 'Computer';

  @override
  String get connectingLive => 'Connessione…';

  @override
  String get dismiss => 'Ignora';

  @override
  String get renameTopic => 'Rinomina';

  @override
  String get library => 'Libreria';

  @override
  String get navLibrary => 'Libreria';

  @override
  String get librarySearchHint => 'Cerca nella Libreria';

  @override
  String get libraryFilterAll => 'Tutto';

  @override
  String get libraryFilterPages => 'Siti e giochi';

  @override
  String get libraryFilterImages => 'Immagini';

  @override
  String get libraryFilterVideos => 'Video';

  @override
  String get libraryFilterAudio => 'Audio';

  @override
  String get libraryFilterDocuments => 'Documenti';

  @override
  String get libraryFilterFiles => 'File';

  @override
  String get creationKindPage => 'Pagina';

  @override
  String get creationKindImage => 'Immagine';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Audio';

  @override
  String get creationKindDocument => 'Documento';

  @override
  String get creationKindFile => 'File';

  @override
  String get libraryPinned => 'Fissati';

  @override
  String get libraryToday => 'Oggi';

  @override
  String get libraryYesterday => 'Ieri';

  @override
  String get libraryThisWeek => 'Questa settimana';

  @override
  String get libraryEarlier => 'Prima';

  @override
  String get videoCantPlay =>
      'Questo video non può essere riprodotto su questo dispositivo.';

  @override
  String get libraryEmptyTitle => 'Cosa creiamo per prima cosa?';

  @override
  String get libraryEmptyBody =>
      'Scegline uno e il tuo bot si mette subito al lavoro. Tutto ciò che i tuoi bot creano arriva qui automaticamente.';

  @override
  String get libraryNoMatch => 'Nessun elemento corrispondente qui.';

  @override
  String get libraryStarterGame => 'Un piccolo gioco';

  @override
  String get libraryStarterGamePrompt =>
      'Creami un piccolo gioco a cui posso giocare nel browser.';

  @override
  String get libraryStarterLogo => 'Un logo';

  @override
  String get libraryStarterLogoPrompt =>
      'Progetta un logo per il mio progetto.';

  @override
  String get libraryStarterSite => 'Un sito di una pagina';

  @override
  String get libraryStarterSitePrompt =>
      'Crea un sito web di una pagina per la mia attività.';

  @override
  String get libraryStarterVideo => 'Un breve video';

  @override
  String get libraryStarterVideoPrompt => 'Crea un breve video di ';

  @override
  String get libraryStarterCard => 'Un biglietto di auguri';

  @override
  String get libraryStarterCardPrompt => 'Crea un biglietto di auguri per ';

  @override
  String get libraryStarterReport => 'Un report';

  @override
  String get libraryStarterReportPrompt =>
      'Fai una ricerca e scrivi un report su ';

  @override
  String get libraryStarterElse => 'Qualcos\'altro…';

  @override
  String get creationOpen => 'Apri';

  @override
  String get creationPlay => 'Riproduci';

  @override
  String get creationView => 'Visualizza';

  @override
  String get creationChangeIt => 'Modifica';

  @override
  String creationChangeDraft(String title) {
    return 'Su “$title”: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Creato da $bot';
  }

  @override
  String creationVersion(int n) {
    return 'versione $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'Dalla tua chat con $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Creato da $bot';
  }

  @override
  String get creationFromHelp => 'Vai alla conversazione';

  @override
  String get creationDetails => 'Dettagli';

  @override
  String get creationAlongside => 'Creato insieme';

  @override
  String creationDeleted(String title) {
    return 'Eliminato “$title”';
  }

  @override
  String get showInLibrary => 'Mostra nella Libreria';

  @override
  String get pinInLibrary => 'Fissa nella Libreria';

  @override
  String get libraryItemNotFound =>
      'Non è ancora nella Libreria. Riprova tra un momento.';

  @override
  String creationPinned(String title) {
    return 'Fissato “$title”';
  }

  @override
  String creationUnpinned(String title) {
    return 'Rimosso dai fissati “$title”';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Aggiornato · versione $version';
  }

  @override
  String get madeHere => 'Creato qui';

  @override
  String madeHereEmpty(String bot) {
    return '$bot non ha ancora creato nulla.';
  }

  @override
  String get madeHereThisChat => 'In questa chat';

  @override
  String madeHereByBot(String bot) {
    return 'Creato da $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Altre cose create da $bot';
  }

  @override
  String madeHereCount(String count) {
    return 'Creato qui ($count)';
  }

  @override
  String get sidePanelComputer => 'Computer';

  @override
  String get madeForTicket => 'Creato per questo ticket';

  @override
  String get libraryCantChangePicked =>
      'Solo la persona per cui è stato creato o i gestori del bot possono modificare questi elementi.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi eliminati',
      one: '1 elemento eliminato',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selezionati',
      one: '1 selezionato',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Più recenti';

  @override
  String get librarySortOpened => 'Aperti di recente';

  @override
  String get librarySortName => 'Nome';

  @override
  String get libraryScopeMine => 'Creati per me';

  @override
  String get libraryScopeWorkspace => 'Tutto lo spazio di lavoro';

  @override
  String get libraryFilterSort => 'Ordina e filtra';

  @override
  String get creationWhoCanSee => 'Chi può vederlo';

  @override
  String get libraryTile => 'Libreria';

  @override
  String get libraryTileHelp => 'Cosa ha creato';

  @override
  String get regenerateReply => 'Rigenera';

  @override
  String get deleteMessage => 'Elimina messaggio';

  @override
  String get deleteMessageTitle => 'Eliminare questo messaggio?';

  @override
  String get deleteMessageBody =>
      'Viene rimosso per tutti in questa chat. I messaggi intorno restano.';

  @override
  String get messageDeleted => 'Messaggio eliminato';

  @override
  String get findInChat => 'Trova nella chat';

  @override
  String get findInChatHint => 'Trova in questa chat';

  @override
  String findInChatCount(int index, int count) {
    return '$index di $count';
  }

  @override
  String get findInChatNone => 'Nessun risultato';

  @override
  String get findPrevious => 'Risultato precedente';

  @override
  String get findNext => 'Risultato successivo';

  @override
  String get closeFind => 'Chiudi ricerca';

  @override
  String get pinTopic => 'Fissa';

  @override
  String get unpinTopic => 'Non fissare più';

  @override
  String get inAppAlertReview => 'Esamina';

  @override
  String get forBot => 'Per il bot';

  @override
  String get handBack => 'Restituisci il controllo';

  @override
  String get handBackNote => 'Nota per il bot (facoltativa)';

  @override
  String get handBackNoteHint =>
      'Ad esempio: Ho fatto l\'accesso, continua pure';

  @override
  String get live => 'Dal vivo';

  @override
  String get liveView => 'Vista dal vivo';

  @override
  String get liveViewHelp =>
      'Guarda questo computer dal vivo e prendi il controllo quando serve.';

  @override
  String get newComputer => 'Nuovo computer';

  @override
  String get newComputerHelp =>
      'Un computer privato appartiene a un solo bot. I suoi file restano separati dal computer del team.';

  @override
  String get openLiveView => 'Apri vista dal vivo';

  @override
  String get liveExpand => 'Schermo intero';

  @override
  String get liveCopy => 'Copia';

  @override
  String get liveScreenshot => 'Screenshot';

  @override
  String get liveScreenshots => 'Screenshot';

  @override
  String get liveScreenshotsHelp =>
      'Il video dal vivo non riesce a passare su questa rete, quindi lo schermo si aggiorna circa una volta al secondo.';

  @override
  String get liveReconnecting => 'Riconnessione…';

  @override
  String get liveReconnectingHelp =>
      'Il video dal vivo si è interrotto (il server potrebbe essersi riavviato). Riprovo; intanto vengono mostrati gli screenshot.';

  @override
  String get liveTryAgain => 'Riprova';

  @override
  String get liveDroppedHelp =>
      'Impossibile ripristinare il video dal vivo, quindi lo schermo si aggiorna circa una volta al secondo. Tocca Riprova.';

  @override
  String get liveMore => 'Altro';

  @override
  String get liveSaveScreenshot => 'Salva screenshot';

  @override
  String get liveCopyFromComputer => 'Copia dal computer';

  @override
  String get livePasteToComputer => 'Incolla sul computer';

  @override
  String get liveRotateHint =>
      'Ruota il telefono in orizzontale per uno schermo più grande';

  @override
  String get liveWatching => 'Stai guardando';

  @override
  String get liveCopied => 'Copiato dal computer.';

  @override
  String get liveNothingCopied =>
      'Non è stato copiato nulla. Seleziona prima qualcosa sul computer.';

  @override
  String get livePasteEmpty => 'Gli appunti sono vuoti.';

  @override
  String get liveMinimize => 'Torna al pannello laterale';

  @override
  String get liveShownFullScreen =>
      'La vista dal vivo è aperta a schermo intero.';

  @override
  String get liveStillWatching => 'Stai ancora guardando?';

  @override
  String get liveStillWatchingHelp =>
      'Il computer va in sospensione quando nessuno lo guarda, per risparmiare energia.';

  @override
  String get liveKeepWatching => 'Continua a guardare';

  @override
  String get livePausedToSavePower => 'In pausa per risparmiare energia';

  @override
  String get livePausedToSavePowerHelp =>
      'Nessuno stava guardando, quindi il computer può riposare. Riprendi lo riattiva.';

  @override
  String get liveResume => 'Riprendi';

  @override
  String get paused => 'In pausa';

  @override
  String get pausedUserInControl =>
      'In pausa: una persona ha il controllo dello schermo';

  @override
  String get letBotUseTerminal => 'Consenti di usare terminale e file';

  @override
  String get screenHandedBack => 'Controllo dello schermo restituito';

  @override
  String get privateComputer => 'Computer privato';

  @override
  String get profileDesktop => 'Desktop';

  @override
  String get profileHeadless => 'Senza desktop';

  @override
  String get rename => 'Rinomina';

  @override
  String get rightClickNextTap => 'Clic destro al prossimo tocco';

  @override
  String get screenshotMode =>
      'Screenshot (video dal vivo non disponibile su questa rete)';

  @override
  String get showKeyboard => 'Tastiera';

  @override
  String get someoneElseInControl => 'Qualcun altro ha il controllo';

  @override
  String get switchToDesktop => 'Passa a Desktop';

  @override
  String get switchToHeadless => 'Passa a Senza desktop';

  @override
  String get switchProfileConfirm =>
      'Il computer si riavvia per cambiare modalità. I tuoi file restano, ma tutto ciò che è in esecuzione ora si ferma.';

  @override
  String get switchProfileButton => 'Cambia';

  @override
  String get switchingToDesktop => 'Passaggio a Desktop…';

  @override
  String get switchingToHeadless => 'Passaggio a Senza desktop…';

  @override
  String get switchedToDesktop =>
      'Passato a Desktop. Apri la vista dal vivo per vedere il suo schermo.';

  @override
  String get switchedToHeadless =>
      'Passato a Senza desktop. Ora usa meno memoria.';

  @override
  String get takeControl => 'Prendi il controllo';

  @override
  String get takeoverCompleted => 'Controllo restituito';

  @override
  String get takeoverDismissed => 'Rifiutato';

  @override
  String get takeoverPrivacy =>
      'Mentre hai il controllo, il bot è in pausa e nulla di ciò che scrivi o vedi gli viene inviato.';

  @override
  String get liveShellOnTooltip =>
      'Consenti al bot di continuare a usare terminale e file mentre hai il controllo';

  @override
  String get liveShellOffTooltip =>
      'Metti in pausa anche terminale e file del bot mentre hai il controllo';

  @override
  String get liveShellOnNote =>
      'Il bot può continuare a usare terminale e file. Non può comunque vedere né usare lo schermo finché non restituisci il controllo.';

  @override
  String get liveShellOffNote =>
      'Il bot è completamente in pausa finché non restituisci il controllo.';

  @override
  String get teamComputer => 'Computer del team';

  @override
  String get withDesktop => 'Con desktop';

  @override
  String get withDesktopHelp =>
      'Aggiunge uno schermo che puoi guardare dal vivo; usa più memoria';

  @override
  String get youAreInControl => 'Hai il controllo';

  @override
  String botAsksForHelp(String reason) {
    return 'Il bot chiede: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot ha bisogno del tuo aiuto';
  }

  @override
  String deleteComputerConfirm(String name) {
    return 'Eliminare $name? Verranno eliminati anche i suoi file, snapshot e punti di ripristino.';
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
    return 'Computer di $bot';
  }

  @override
  String get micPermissionNeeded =>
      'Consenti l\'accesso al microfono per dettare.';

  @override
  String get dictationEmpty => 'Nessuna voce rilevata. Riprova.';

  @override
  String get startCall => 'Avvia una chiamata vocale';

  @override
  String get stopDictation => 'Ferma e trascrivi';

  @override
  String get dictate => 'Detta';

  @override
  String get dictateOnDevice => 'Detta con questo dispositivo';

  @override
  String get stopListening => 'Interrompi ascolto';

  @override
  String get dictationRetry => 'Riprova';

  @override
  String get dictationSayAgain => 'Ripetilo';

  @override
  String get dictationFailed => 'Impossibile convertire in testo.';

  @override
  String get dictationFailedUseDevice =>
      'Impossibile convertire in testo. Ripetilo e ascolterà il tuo dispositivo.';

  @override
  String get dictationNoServiceUseDevice =>
      'La dettatura non è configurata per questo spazio di lavoro. Può ascoltare invece il tuo dispositivo.';

  @override
  String get dictationDeviceFailed =>
      'La dettatura del dispositivo ha smesso di funzionare, quindi il microfono è tornato su Casama.';

  @override
  String get dictationDevicePermission =>
      'Consenti il riconoscimento vocale per dettare con questo dispositivo.';

  @override
  String get readAloud => 'Leggi ad alta voce';

  @override
  String get callConnecting => 'Connessione…';

  @override
  String get callLive => 'Dal vivo';

  @override
  String get callEnded => 'Chiamata terminata';

  @override
  String get callEndedIdle => 'Chiamata terminata dopo 2 minuti di silenzio.';

  @override
  String get callFailed => 'Impossibile connettere la chiamata.';

  @override
  String get callListening => 'In ascolto';

  @override
  String get callSpeaking => 'Sta parlando';

  @override
  String get callWorking => 'Ci sta lavorando';

  @override
  String get callMutedState => 'Microfono disattivato';

  @override
  String get callCaptions => 'Sottotitoli';

  @override
  String get callSpeaker => 'Altoparlante';

  @override
  String get callEarpiece => 'Telefono';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Cuffie';

  @override
  String get callAudioOutput => 'Riproduci la chiamata tramite';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Cambia la sua immagine',
      'memory_search': 'Cerca tra i tuoi ricordi',
      'memory_write': 'Salva nella memoria',
      'memory': 'Aggiorna la sua memoria',
      'knowledge_search': 'Cerca nella conoscenza',
      'web_search': 'Cerca sul web',
      'web': 'Legge una pagina web',
      'browser_open': 'Apre un sito web',
      'browser_click': 'Clicca sulla pagina',
      'browser_type': 'Scrive sulla pagina',
      'browser_press': 'Preme un tasto',
      'browser_scroll': 'Scorre la pagina',
      'browser_look': 'Guarda la pagina',
      'desktop_click': 'Clicca sullo schermo',
      'desktop_type': 'Scrive',
      'desktop_press': 'Preme dei tasti',
      'desktop_launch': 'Apre un’app',
      'desktop_look': 'Guarda lo schermo',
      'shell': 'Lavora sul suo computer',
      'files_read': 'Legge un file',
      'files_write': 'Scrive un file',
      'files_list': 'Sfoglia i file',
      'files_search': 'Cerca tra i file',
      'files_from_chat': 'Prende un file dalla chat',
      'http': 'Contatta un servizio',
      'data_search': 'Cerca dati',
      'data_call': 'Recupera dati',
      'skills_load': 'Prepara una competenza',
      'skills_create': 'Impara una nuova competenza',
      'skills_update': 'Migliora una competenza',
      'checkpoint': 'Salva un punto di ripristino',
      'computer_restart': 'Riavvia il suo computer',
      'takeover': 'Ti chiede di prendere il controllo',
      'delegate': 'Chiede a un aiutante',
      'routines_list': 'Controlla le tue routine',
      'routines_create': 'Configura una routine',
      'routines_update': 'Aggiorna una routine',
      'routines_delete': 'Rimuove una routine',
      'watchers_create': 'Configura un monitoraggio',
      'watchers_list': 'Controlla i tuoi monitoraggi',
      'watchers_delete': 'Rimuove un monitoraggio',
      'tasks_list': 'Controlla le tue attività',
      'tasks_create': 'Aggiunge un’attività',
      'tasks': 'Aggiorna le tue attività',
      'notify_user': 'Ti invia una nota',
      'usage_report': 'Controlla l’utilizzo',
      'device_read': 'Legge i dati del tuo dispositivo',
      'device_access': 'Chiede l’accesso al dispositivo',
      'pages_publish': 'Pubblica una pagina',
      'pages': 'Aggiorna una pagina',
      'media': 'Crea un’immagine',
      'media_video': 'Crea un video',
      'bots_create': 'Crea un nuovo bot',
      'bots_update': 'Aggiorna un bot',
      'bots_list': 'Controlla i tuoi bot',
      'bots_archive': 'Archivia un bot',
      'channel_send': 'Invia un messaggio',
      'links_ask': 'Chiede all’assistente di un contatto',
      'logins_list': 'Controlla gli accessi salvati',
      'replay_run': 'Ripete la sequenza salvata',
      'replay_save': 'Salva questa sequenza',
      'setup_apply': 'Suggerisce una configurazione',
      'sidebar_organize': 'Organizza la tua barra laterale',
      'suggestions_add': 'Aggiunge un suggerimento',
      'teach_save_draft': 'Salva una bozza di competenza',
      'welcome_name': 'Sceglie un nome',
      'secrets_request': 'Ti chiede un segreto',
      'pages_list': 'Controlla le tue pagine',
      'pages_share': 'Cambia chi può vedere una pagina',
      'projects_create': 'Avvia un progetto',
      'projects_status': 'Controlla un progetto',
      'projects_update': 'Aggiorna un progetto',
      'projects': 'Pianifica un progetto',
      'payments': 'Chiede di effettuare un pagamento',
      'voice_call': 'Chiama un’azienda',
      'voice_call_user': 'Ti chiama',
      'tools_load': 'Si prepara',
      'ui_show': 'Ti mostra qualcosa',
      'start_task': 'Avvia questa attività in chat',
      'adult_sites_turn_on': 'Chiede di attivare i siti per adulti',
      'connections_attach': 'Inizia a usare un’app',
      'other': 'Ci sta lavorando',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Immagine cambiata',
      'memory_search': 'Cercato tra i tuoi ricordi',
      'memory_write': 'Salvato in memoria',
      'memory': 'Memoria aggiornata',
      'knowledge_search': 'Conoscenza consultata',
      'web_search': 'Ricerca web effettuata',
      'web': 'Pagina web letta',
      'browser_open': 'Sito web aperto',
      'browser_click': 'Clic sulla pagina',
      'browser_type': 'Testo scritto sulla pagina',
      'browser_press': 'Tasto premuto',
      'browser_scroll': 'Pagina scorsa',
      'browser_look': 'Pagina osservata',
      'desktop_click': 'Clic sullo schermo',
      'desktop_type': 'Scritto',
      'desktop_press': 'Tasti premuti',
      'desktop_launch': 'App aperta',
      'desktop_look': 'Schermo osservato',
      'shell': 'Lavorato sul suo computer',
      'files_read': 'File letto',
      'files_write': 'File scritto',
      'files_list': 'File sfogliati',
      'files_search': 'Cercato tra i file',
      'files_from_chat': 'File preso dalla chat',
      'http': 'Servizio contattato',
      'data_search': 'Dati cercati',
      'data_call': 'Dati ottenuti',
      'skills_load': 'Competenza usata',
      'skills_create': 'Nuova competenza appresa',
      'skills_update': 'Competenza migliorata',
      'checkpoint': 'Punto di ripristino salvato',
      'computer_restart': 'Computer riavviato',
      'takeover': 'Ti ha chiesto di prendere il controllo',
      'delegate': 'Ha chiesto a un aiutante',
      'routines_list': 'Routine controllate',
      'routines_create': 'Routine configurata',
      'routines_update': 'Routine aggiornata',
      'routines_delete': 'Routine rimossa',
      'watchers_create': 'Monitoraggio configurato',
      'watchers_list': 'Monitoraggi controllati',
      'watchers_delete': 'Monitoraggio rimosso',
      'tasks_list': 'Attività controllate',
      'tasks_create': 'Attività aggiunta',
      'tasks': 'Attività aggiornate',
      'notify_user': 'Nota inviata',
      'usage_report': 'Utilizzo controllato',
      'device_read': 'Dati del tuo dispositivo letti',
      'device_access': 'Ha chiesto l’accesso al dispositivo',
      'pages_publish': 'Pagina pubblicata',
      'pages': 'Pagina aggiornata',
      'media': 'Immagine creata',
      'media_video': 'Video creato',
      'bots_create': 'Nuovo bot creato',
      'bots_update': 'Bot aggiornato',
      'bots_list': 'Bot controllati',
      'bots_archive': 'Bot archiviato',
      'channel_send': 'Messaggio inviato',
      'links_ask': 'Ha chiesto all’assistente di un contatto',
      'logins_list': 'Accessi salvati controllati',
      'replay_run': 'Sequenza salvata ripetuta',
      'replay_save': 'Sequenza salvata',
      'setup_apply': 'Configurazione suggerita',
      'sidebar_organize': 'Barra laterale organizzata',
      'suggestions_add': 'Suggerimento aggiunto',
      'teach_save_draft': 'Bozza di competenza salvata',
      'welcome_name': 'Nome scelto',
      'secrets_request': 'Ti ha chiesto un segreto',
      'pages_list': 'Pagine controllate',
      'pages_share': 'Cambiato chi può vedere la pagina',
      'projects_create': 'Progetto avviato',
      'projects_status': 'Progetto controllato',
      'projects_update': 'Progetto aggiornato',
      'projects': 'Progetto pianificato',
      'payments': 'Ha chiesto di fare un pagamento',
      'voice_call': 'Azienda chiamata',
      'voice_call_user': 'Ti ha chiamato',
      'tools_load': 'Tutto pronto',
      'ui_show': 'Ti ha mostrato qualcosa',
      'start_task': 'Avviato in chat',
      'adult_sites_turn_on': 'Ha chiesto di attivare i siti per adulti',
      'connections_attach': 'Ha iniziato a usare un’app',
      'other': 'Fatto',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Usa $app';
  }

  @override
  String toolUsedApp(String app) {
    return 'Usata $app';
  }

  @override
  String get toolDetails => 'Dettagli';

  @override
  String approvalAsking(String bot) {
    return '$bot chiede conferma';
  }

  @override
  String get approvalLookClosely => 'Controlla bene prima di consentire';

  @override
  String approvalAttachConnection(String app) {
    return 'Inizia a usare $app, già collegata in questo spazio di lavoro';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Consenti a $bot di farlo senza chiedere';
  }

  @override
  String get pageShareToPublic => 'Chiunque abbia il link potrà aprirlo';

  @override
  String get pageShareToWorkspace =>
      'Tutti in questo spazio di lavoro potranno aprirlo';

  @override
  String get pageShareToPrivate => 'Solo tu potrai aprirlo';

  @override
  String approvalAllowedLine(String what) {
    return 'Consentito: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Rifiutato: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Nessuna risposta in tempo: $what';
  }

  @override
  String get callToolFailed => 'Non ha funzionato';

  @override
  String get callToolNeedsOk => 'Richiede il tuo OK per continuare';

  @override
  String get callToolAllow => 'Consenti';

  @override
  String get callToolNotNow => 'Non ora';

  @override
  String get callToolAllowed => 'Consentito. Il risultato apparirà nella chat';

  @override
  String get callToolDeclined => 'Hai scelto non ora';

  @override
  String get callToolBackground =>
      'Ancora al lavoro. Il risultato apparirà nella chat';

  @override
  String get callToolInChat => 'Il risultato apparirà nella chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString s';
  }

  @override
  String get callNeedsKeyTitle =>
      'Le chiamate richiedono una chiave IA di Google';

  @override
  String get callNeedsKeyBody =>
      'Le chiamate dal vivo usano Gemini Live di Google, quindi questo spazio di lavoro richiede una chiave IA di Google. Serve solo per le chiamate: lettura ad alta voce, dettatura, immagini e video usano OpenRouter. Google te ne offre una gratuita in AI Studio: creala lì, poi aggiungila in Chiavi dei modelli e le chiamate funzioneranno subito. Solo i proprietari e gli amministratori dello spazio di lavoro possono aggiungere chiavi.';

  @override
  String get callAddKey => 'Aggiungi una chiave IA di Google';

  @override
  String get callGetFreeKey => 'Ottieni una chiave gratuita da Google';

  @override
  String get callMicUnmute => 'Attiva mic';

  @override
  String get videoUnmute => 'Riattiva audio';

  @override
  String get callMicMute => 'Disattiva mic';

  @override
  String get videoMute => 'Disattiva audio';

  @override
  String get hangUp => 'Riaggancia';

  @override
  String callWith(String bot) {
    return 'Chiamata con $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'Terminare la chiamata con $from e chiamare $to?';
  }

  @override
  String get callSwitchBody =>
      'Puoi fare una chiamata alla volta. La chiamata attuale viene prima salvata nella sua chat.';

  @override
  String get callSwitchConfirm => 'Termina e chiama';

  @override
  String get callVoiceConsentTitle => 'La tua voce va a Google';

  @override
  String get callVoiceConsentBody =>
      'In una chiamata, Casama invia la tua voce e ciò che dici a Google Gemini, che ti ascolta e pronuncia le risposte del tuo bot. Anche le parole della chiamata vanno al modello IA usato dal bot, tramite OpenRouter. Nulla viene inviato finché non acconsenti. Puoi disattivarlo in qualsiasi momento in Impostazioni › Privacy.';

  @override
  String get callVoiceConsentAgree => 'Accetto e chiamo';

  @override
  String get callVoiceConsentNotNow => 'Non ora';

  @override
  String get callEndedLost =>
      'La chiamata è terminata perché la connessione è rimasta assente troppo a lungo.';

  @override
  String get callMinimize => 'Riduci a icona';

  @override
  String get callEndCall => 'Termina chiamata';

  @override
  String get callEndAndAnswer => 'Termina e rispondi';

  @override
  String get callReconnecting => 'Riconnessione…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti',
      one: '1 minuto',
      zero: 'meno di un minuto',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Chiamata con $bot, $time, tocca per tornare';
  }

  @override
  String callReturnBar(String bot) {
    return 'In chiamata con $bot, tocca per tornare';
  }

  @override
  String get callOpen => 'Apri chiamata';

  @override
  String get callOnHold => 'In attesa';

  @override
  String get callNotificationLive => 'In chiamata';

  @override
  String get callNotificationMuted => 'Microfono disattivato';

  @override
  String get callNotificationChannel => 'Chiamate';

  @override
  String callTabTitle(String time) {
    return 'In chiamata · $time';
  }

  @override
  String get callMenuShow => 'Mostra chiamata';

  @override
  String get callJobWorking => 'Ci sta lavorando';

  @override
  String callJobStrip(String task) {
    return 'Al lavoro su: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'In attesa: $task';
  }

  @override
  String get callTileWatching => 'Vista dal vivo';

  @override
  String get callTileDone => 'Fatto';

  @override
  String get callTileNeedsYou => 'In attesa';

  @override
  String callTileLabel(String state) {
    return 'Schermo del bot, $state. Tocca per vederlo a dimensione intera';
  }

  @override
  String get callTileHide => 'Nascondi schermo';

  @override
  String get screenCardLive => 'dal vivo';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Schermo di $bot, $state';
  }

  @override
  String get screenCardOpen => 'Apri a schermo intero';

  @override
  String get screenCardYouHave => 'Hai il controllo dello schermo';

  @override
  String screenCardHeldBy(String name) {
    return '$name ha il controllo dello schermo';
  }

  @override
  String get screenCardMore => 'Altre opzioni';

  @override
  String screenCardIntro(String bot) {
    return 'Schermo di $bot. Tocca per guardare, trascina per spostare.';
  }

  @override
  String get screenCardHideForNow => 'Nascondi per ora';

  @override
  String get screenCardDontShow => 'Non mostrare automaticamente';

  @override
  String get screenCardTurnedOff =>
      'La scheda schermo è disattivata. Riattivala nelle Impostazioni.';

  @override
  String get screenCardOfferOff =>
      'Nascondi spesso la scheda schermo? Puoi disattivarla.';

  @override
  String get screenCardTurnOff => 'Disattiva';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot ha bisogno di te sullo schermo';
  }

  @override
  String callRecapTitle(String length) {
    return 'Chiamata · $length';
  }

  @override
  String get callRecapStarted => 'Avviato durante la chiamata';

  @override
  String get callRecapTaskDone => 'Fatto';

  @override
  String get callRecapTaskFailed => 'Non completato';

  @override
  String get callRecapTaskStopped => 'Fermato';

  @override
  String get callRecapTaskRunning => 'Ancora al lavoro';

  @override
  String get callRecapOpenRun => 'Vedi cosa ha fatto';

  @override
  String get summarizeCalls => 'Riepiloga chiamate';

  @override
  String get summarizeCallsHelp =>
      'Dopo ogni chiamata, la sua scheda mostra di cosa si è parlato e cosa fare dopo. Usa un po\' del modello piccolo del bot.';

  @override
  String callCardVoice(String length) {
    return 'Chiamata vocale · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Telefonata · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Chiamata interrotta · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Chiamata persa da $name';
  }

  @override
  String callCardLive(String name) {
    return 'In chiamata con $name';
  }

  @override
  String get callCardLiveElsewhere => 'In chiamata su un altro dispositivo';

  @override
  String get callCardReturn => 'Torna alla chiamata';

  @override
  String callCardBotHungUp(String name) {
    return '$name ha riagganciato';
  }

  @override
  String get callCardEndedQuiet => 'Terminata dopo un periodo di silenzio';

  @override
  String get callCardEndedLimit =>
      'Terminata al limite di durata della chiamata';

  @override
  String get callCardWritingSummary => 'Scrittura del riepilogo…';

  @override
  String callCardSummaryBy(String name) {
    return 'Riepilogo di $name';
  }

  @override
  String get callCardNextSteps => 'Prossimi passi';

  @override
  String get callCardDoIt => 'Fallo';

  @override
  String get callCardDismissStep => 'Ignora';

  @override
  String get callCardStepStarted => 'Avviato';

  @override
  String get callCardStepFailed => 'Impossibile avviare. Riprova.';

  @override
  String get callCardDoneOnCall => 'Fatto durante la chiamata';

  @override
  String callCardMore(int count) {
    return 'Altri $count';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Trascrizione · $count turni',
      one: 'Trascrizione · 1 turno',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Trascrizione';

  @override
  String get callCardSearchTranscript => 'Cerca nella trascrizione';

  @override
  String get callCardNoMatches => 'Nessun risultato';

  @override
  String get callCardYou => 'Tu';

  @override
  String get callCardCallBack => 'Richiama';

  @override
  String get callCardCopy => 'Copia';

  @override
  String get callCardCopied => 'Copiato';

  @override
  String get callCardShare => 'Condividi';

  @override
  String get callCardMoreActions => 'Altro';

  @override
  String get callCardDelete => 'Elimina chiamata';

  @override
  String get callCardDeleteTitle => 'Eliminare questa chiamata?';

  @override
  String get callCardDeleteBody =>
      'La scheda e la trascrizione vengono rimosse da questa chat. I lavori avviati mantengono i propri risultati.';

  @override
  String get callCardDeleted => 'Chiamata eliminata';

  @override
  String get callCardDeleteFailed => 'Impossibile eliminare la chiamata';

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

    return 'Risposta iniziata in $msString ms';
  }

  @override
  String get voiceSettings => 'Voce';

  @override
  String get voiceSettingsHelp =>
      'Voce per lettura ad alta voce e strumenti che il bot ha in chiamata';

  @override
  String get callTools => 'Strumenti in chiamata';

  @override
  String get callToolsHelp =>
      'Le chiamate includono già memoria, ricerca web, note per te, routine e ticket, e passano i lavori più grandi alla chat. Aggiungi gli strumenti delle app collegate che il bot può usare dal vivo; ciascuno aggiunge un piccolo costo a ogni chiamata.';

  @override
  String get callToolsNone =>
      'Questo bot non ha ancora nessuna app collegata attiva. Attivane una nelle sue Integrazioni, poi scegli qui i suoi strumenti.';

  @override
  String get openIntegrations => 'Apri Integrazioni';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString strumenti di app collegate aggiunti',
      one: '1 strumento di app collegate aggiunto',
      zero: 'Solo gli strumenti vocali integrati',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'ID voce (facoltativo)';

  @override
  String get voiceIdHelp =>
      'Un nome voce Gemini, come Kore o Puck; se vuoto usa Kore';

  @override
  String get useThisComputer => 'Usa questo computer per i bot';

  @override
  String get companionDesktopOnly =>
      'Solo l\'app desktop (macOS, Windows, Linux) può fare da computer per i bot.';

  @override
  String get companionIntro =>
      'Consenti ai bot scelti di lavorare su questo computer: eseguire comandi, modificare file nelle cartelle che scegli, navigare e usare le app. Tutto ciò che fanno è visibile sullo schermo e può essere fermato. Resta tutto disattivato finché non approvi ogni singola funzione.';

  @override
  String get thisComputer => 'Questo computer';

  @override
  String get companionOnline =>
      'Attivo: i bot che consenti possono usare questo computer';

  @override
  String get companionError =>
      'Impossibile raggiungere Casama; nuovo tentativo';

  @override
  String get companionOff => 'Disattivato';

  @override
  String get companionCapabilities => 'Cosa possono fare i bot';

  @override
  String get companionCapabilitiesHelp =>
      'Approva ciascuna opzione. Le azioni ad alto rischio chiedono sempre conferma, qualunque sia l\'autonomia del bot.';

  @override
  String get capShell => 'Eseguire comandi (nelle cartelle condivise)';

  @override
  String get capFiles => 'Leggere e modificare file nelle cartelle condivise';

  @override
  String get capBrowser => 'Usare un browser (proprio, separato dal tuo)';

  @override
  String get capDesktop => 'Usare le app desktop';

  @override
  String get sharedFolders => 'Cartelle condivise';

  @override
  String get sharedFoldersHelp =>
      'I bot possono raggiungere solo queste cartelle.';

  @override
  String get addFolder => 'Aggiungi una cartella';

  @override
  String get botsAllowed => 'Bot consentiti';

  @override
  String get botsAllowedHelp =>
      'I bot consentiti possono lavorare anche su questo computer. Ognuno mantiene il proprio computer e usa quello, a meno che un\'attività non richieda questo.';

  @override
  String get worksOnTitle => 'Lavora su';

  @override
  String worksOnSubtitle(String bot) {
    return 'Dove $bot esegue comandi, usa file e naviga per te.';
  }

  @override
  String get worksOnAuto => 'Automatico';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot sceglie per ogni passaggio: il proprio computer, a meno che l\'attività non richieda il tuo.';
  }

  @override
  String get worksOnBot => 'Solo il computer del bot';

  @override
  String get worksOnBotHelp => 'Il tuo computer non viene mai usato.';

  @override
  String get worksOnMine => 'Solo il mio computer';

  @override
  String get worksOnMineHelp =>
      'Tutto avviene sul tuo computer, quindi deve essere acceso.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Tutto avviene su $computer, quindi deve essere acceso.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Lavora su: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Dove lavora $bot';
  }

  @override
  String get placesSubtitle =>
      'Scegli il computer da guardare qui. L\'opzione Lavora su decide dove il bot svolge il lavoro.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Mostrato $computer. Lavora su: $mode. Cambia';
  }

  @override
  String get placeYoursOnline => 'Il tuo computer · Online';

  @override
  String get placeYoursOffline => 'Il tuo computer · Offline';

  @override
  String get placeTeamComputer => 'Computer del team';

  @override
  String placeBotsOwn(String bot) {
    return 'Computer di $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action su $computer';
  }

  @override
  String get botYourComputer => 'Il tuo computer';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone =>
      'Non consentito su nessuno dei tuoi computer';

  @override
  String botYourComputerHow(String bot) {
    return 'Per permettere a $bot di lavorare anche sul tuo computer, apri Casama su quel computer e attiva l\'opzione in Impostazioni → Usa questo computer per i bot → Bot consentiti. Mantiene comunque il proprio computer.';
  }

  @override
  String get routineWhere => 'Dove lavora';

  @override
  String get routineWhereHelp =>
      'Dove questa routine esegue comandi e usa i file.';

  @override
  String get routineWhereBot => 'Il computer del bot';

  @override
  String get routineWhereBotHelp =>
      'Funziona che il tuo computer sia acceso o no.';

  @override
  String get routineWhereMine => 'Il mio computer quando è acceso';

  @override
  String get routineWhereMineHelp =>
      'Per lavorare sui tuoi file e le tue app. L\'esecuzione lo segnala se il computer era spento.';

  @override
  String get routineUsesComputer => 'Usa un computer';

  @override
  String get routineUsesComputerOn =>
      'Può salvare file, eseguire comandi e visitare pagine.';

  @override
  String get routineUsesComputerOff =>
      'Legge solo le tue app, il web e la memoria. Più veloce, e non riattiva mai un computer.';

  @override
  String get computerBotsAllowed => 'Bot consentiti';

  @override
  String get unpairComputer => 'Smetti di usare questo computer e scollegalo';

  @override
  String botActingHere(String bot, String action) {
    return '$bot sta lavorando su questo computer: $action';
  }

  @override
  String get quickAsk => 'Domanda rapida';

  @override
  String get quickAskHint => 'Chiedi qualsiasi cosa a un bot…';

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
  String get cloudModelsTitle => 'Modelli cloud';

  @override
  String get cloudModelsHelp =>
      'Si applica a ogni server Cloud entro pochi secondi.';

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
  String get connectionsTitle => 'Connessioni app';

  @override
  String get connectionsServerComposio => 'Account Composio di Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Le app senza un proprio accesso si collegano in un clic tramite l\'account Composio di questo server.';

  @override
  String get connectionsOwnAccounts => 'Account personali';

  @override
  String get connectionsOwnAccountsHelp =>
      'Ogni persona usa il proprio account Composio, Pipedream o Zapier.';

  @override
  String get connectionsNoComposioKey =>
      'Aggiungi COMPOSIO_API_KEY a questo server per usare l\'account di Casama.';

  @override
  String get connectionsGoogleTitle => 'App Google';

  @override
  String get connectionsGoogleComposio => 'Tramite Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Calendar, Drive e altre funzionano subito.';

  @override
  String get connectionsGoogleDirect => 'Server di Google';

  @override
  String get connectionsGoogleDirectHelp =>
      'Richiede l\'iscrizione a Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Solo il proprietario dell\'istanza può aprire la console di amministrazione.';

  @override
  String get runs24h => 'Esecuzioni (24 h)';

  @override
  String get failedRuns24h => 'Esecuzioni non riuscite (24 h)';

  @override
  String get cost24h => 'Spesa (24 h)';

  @override
  String get computersRunning => 'Computer attivi';

  @override
  String get devicesOnline => 'Computer personali online';

  @override
  String get editQuotas => 'Modifica quote';

  @override
  String get maxBots => 'Limite di bot';

  @override
  String get monthlyUsd => 'Limite di spesa mensile (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'È disponibile Casama $latest (tu usi $current)';
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
      other: '$nString spazi di lavoro',
      one: '1 spazio di lavoro',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'ultimo accesso $when';
  }

  @override
  String quotasFor(String name) {
    return 'Quote per $name';
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
      other: '$nString membri',
      one: '1 membro',
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
      other: '$nString bot',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String cost30d(String usd) {
    return '$usd in 30 giorni';
  }

  @override
  String get connectingToServer => 'Connessione a Casama…';

  @override
  String get cannotReachServer =>
      'Impossibile raggiungere il tuo server Casama';

  @override
  String get connectionFailed =>
      'Impossibile raggiungere il tuo server Casama. Controlla la connessione e riprova.';

  @override
  String get serverNotResponding =>
      'Il tuo server Casama non risponde al momento. Riprova tra un attimo.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Controlla la connessione o verifica che il server su $url sia attivo.';
  }

  @override
  String get serverUnreachableBody =>
      'Controlla di essere online. Se lo sei, il server potrebbe essere in fase di riavvio, quindi continueremo a riprovare.';

  @override
  String retryingIn(int seconds) {
    return 'Nuovo tentativo tra $seconds s';
  }

  @override
  String get retryingNow => 'Tentativo…';

  @override
  String get upgradeTitle => 'Passa a un piano superiore';

  @override
  String get notNow => 'Non ora';

  @override
  String get seePlans => 'Vedi i piani';

  @override
  String get billing => 'Fatturazione';

  @override
  String get billingOffSelfHosted =>
      'La fatturazione è disattivata su questo server. Funziona con la propria licenza: l\'uso personale è gratuito per una persona e i team usano una licenza Business.';

  @override
  String get restorePurchases => 'Ripristina acquisti';

  @override
  String get restoreStarted => 'Controllo acquisti…';

  @override
  String get plans => 'Piani';

  @override
  String get currentPlan => 'Piano attuale';

  @override
  String subscribeFor(String price) {
    return 'Abbonati per $price';
  }

  @override
  String get subscribeOnWeb => 'Abbonati sul web';

  @override
  String get credits => 'Crediti';

  @override
  String get creditHistory => 'Cronologia crediti';

  @override
  String get creditReasonPurchase => 'Crediti acquistati';

  @override
  String get creditReasonGrant => 'Crediti aggiunti';

  @override
  String get creditReasonRefund => 'Rimborso';

  @override
  String get creditReasonAdjustment => 'Rettifica';

  @override
  String get creditReasonExpire => 'Crediti scaduti';

  @override
  String limitBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String get limitBotsUnlimited => 'Bot illimitati';

  @override
  String get unlimitedValue => 'Illimitato';

  @override
  String trialDaysFree(int n) {
    return '$n giorni gratis';
  }

  @override
  String get extraPeople => 'Persone extra';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price a persona al mese, in aggiunta ai $seats inclusi nel tuo piano.';
  }

  @override
  String get extraPeopleSaved => 'Persone extra aggiornate';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString ore di computer al mese';
  }

  @override
  String limitCredits(String amount) {
    return '$amount crediti al mese';
  }

  @override
  String get viaWeb => 'Fatturazione sul web';

  @override
  String get viaAppStore => 'Fatturazione tramite App Store';

  @override
  String get viaGooglePlay => 'Fatturazione tramite Google Play';

  @override
  String get yourPlan => 'Il tuo piano';

  @override
  String planEndsOn(String date) {
    return 'Termina il $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Si rinnova il $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Crediti: $amount';
  }

  @override
  String get manageSubscription => 'Gestisci abbonamento';

  @override
  String get compViaCasama => 'Gratuito da Casama';

  @override
  String compFreeUntil(String date) {
    return 'Gratis fino al $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Acquisto di prova. Si applicano i limiti tester: $credits di crediti al mese e $daily al giorno.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Mantieni $plan';
  }

  @override
  String get haveGiftCode => 'Hai un codice regalo?';

  @override
  String get redeemCodeTitle => 'Riscatta un codice regalo';

  @override
  String get redeemCodeIntro =>
      'Inserisci il codice che hai ricevuto. Il piano viene applicato allo spazio di lavoro che scegli, senza nulla da pagare.';

  @override
  String get redeemCodeLabel => 'Codice regalo';

  @override
  String get redeemCodeChecking => 'Controllo…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months mesi di $plan, gratis',
      one: '1 mese di $plan, gratis',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'Questo codice non esiste o non può più essere usato.';

  @override
  String get redeemCodeWorkspace => 'Spazio di lavoro';

  @override
  String get redeemCodeSubmit => 'Riscatta';

  @override
  String get redeemCodeFinePrint =>
      'Un codice regalo per persona. Al termine, lo spazio di lavoro passa al piano Gratuito, a meno che tu non scelga un piano.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan è tuo';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Il tuo spazio di lavoro ha $plan gratis fino al $date. Apri Casama su qualsiasi dispositivo per usarlo.';
  }

  @override
  String get redeemCodeOpenBilling => 'Apri Fatturazione';

  @override
  String get redeemCodeNoWorkspace =>
      'Un codice regalo va applicato a uno spazio di lavoro di cui sei proprietario. Creane prima uno, poi riapri il link.';

  @override
  String get redeemCodeUnavailable =>
      'Non disponibile in questa versione dell\'app.';

  @override
  String usageComputerHours(String hours) {
    return 'Computer cloud: $hours h';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Vista dal vivo: $minutes min';
  }

  @override
  String get thisMonth => 'Questo mese';

  @override
  String get noBillableUsage => 'Nessun utilizzo fatturabile al momento.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Collega un Casama self-hosted a questo spazio di lavoro. Un indirizzo pubblico e le notifiche sono gratuiti; computer cloud e crediti dei modelli vengono fatturati qui.';

  @override
  String get linkCloudNewKey => 'Nuova chiave Casama Link';

  @override
  String get linkCloudKeyCreated => 'Chiave creata';

  @override
  String get linkCloudKeyOnce =>
      'Copiala ora; viene mostrata una sola volta. Impostala sul tuo server con CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Copia';

  @override
  String get revoke => 'Revoca';

  @override
  String get instanceName => 'Nome del server';

  @override
  String get server => 'Server';

  @override
  String get serverAddress => 'Indirizzo del server';

  @override
  String get serverAddressInvalid =>
      'Inserisci un indirizzo del server come https://casama.example.com o http://192.168.1.20:8080.';

  @override
  String get connect => 'Connetti';

  @override
  String get changeServer => 'Usa un altro server';

  @override
  String serverIs(String host) {
    return 'Server: $host';
  }

  @override
  String get continueWithSso => 'Continua con SSO';

  @override
  String get workEmail => 'Email di lavoro';

  @override
  String get privacy => 'Privacy';

  @override
  String get exportMyData => 'Esporta i miei dati';

  @override
  String get exportMyDataHelp =>
      'Bot, chat, esecuzioni, ricordi e impostazioni. Nessun segreto.';

  @override
  String exportReady(String kb) {
    return 'Esportazione pronta ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Conserva cronologia esecuzioni per';

  @override
  String get runHistoryRetentionHelp =>
      'Gli eventi delle esecuzioni più vecchi vengono eliminati automaticamente.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Elimina il mio account';

  @override
  String get deleteAccountHelp =>
      'Cancella i tuoi dati dopo un breve periodo di tolleranza.';

  @override
  String get deleteAccountQuestion => 'Eliminare il tuo account?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Gli spazi di lavoro di cui sei l\'unico proprietario vengono eliminati con il tuo account, inclusi i relativi bot e computer. Un piano acquistato sul web viene annullato automaticamente. Un piano acquistato nell\'App Store o su Google Play no: annullalo in quello store. Scrivi $email per confermare.';
  }

  @override
  String get accountDeleted => 'Eliminazione account programmata';

  @override
  String accountDeletedBody(String date) {
    return 'Disconnessione effettuata. I tuoi dati verranno cancellati il $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString passaggi',
      one: '1 passaggio',
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
      other: 'Mostra $countString passaggi precedenti',
      one: 'Mostra 1 passaggio precedente',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Copiato';

  @override
  String get jumpToLatest => 'Vai al più recente';

  @override
  String get chatViewFullTable => 'Vedi tabella completa';

  @override
  String get chatShowMore => 'Mostra altro';

  @override
  String get chatShowLess => 'Mostra meno';

  @override
  String get chatTableTitle => 'Tabella';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Chiedi qualsiasi cosa a $bot o tocca un\'idea qui sotto per iniziare.';
  }

  @override
  String get suggestPlanDay => 'Aiutami a organizzare la mia giornata';

  @override
  String get suggestWriteMessage => 'Aiutami a scrivere un messaggio';

  @override
  String get suggestExplain => 'Cerca qualcosa e spiegamelo in modo semplice';

  @override
  String get suggestCapabilities => 'In cosa puoi aiutarmi?';

  @override
  String connectedAppSummary(String app) {
    return 'Collegata $app';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama non ha verificato questo server. Collegalo solo se ti fidi di $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama non ha verificato questo server. Collegalo solo se ti fidi di chi lo gestisce.';

  @override
  String get serverAddressLabel => 'Indirizzo del server';

  @override
  String get serverAddressHelp =>
      'Incolla l\'indirizzo del server. Se contiene una chiave, la chiave viene salvata crittografata e resta fuori dalla chat.';

  @override
  String get serverChecking => 'Verifica del server…';

  @override
  String serverSignInOn(String host) {
    return 'Effettuerai l\'accesso su $host.';
  }

  @override
  String get serverUseKey => 'Usa invece una chiave';

  @override
  String get serverUseSignIn => 'Accedi invece';

  @override
  String serverSignInUnavailable(String name) {
    return '$name non può accettare un accesso dal browser da questo server Casama. Usa una chiave.';
  }

  @override
  String get serverNoSignIn => 'Questo server funziona senza accesso.';

  @override
  String get serverHeaderLabel => 'Nome intestazione (facoltativo)';

  @override
  String get serverToolsTitle => 'Strumenti che può usare';

  @override
  String get serverToolsHelp =>
      'Disattiva quelli che non vuoi. I bot chiedono comunque conferma prima di azioni rischiose.';

  @override
  String addedInChatBy(String bot) {
    return 'Aggiunto in chat da $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name viene eseguito sul tuo computer. Apri Casama su quel computer e attiva Usa questo computer per aggiungerlo.';
  }

  @override
  String get connectAppsTitle => 'Collega le tue app';

  @override
  String get moreApps => 'Altro';

  @override
  String addAppTile(String app) {
    return 'Aggiungi $app a questo bot';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app aggiunta a $bot';
  }

  @override
  String get connectAppsHint =>
      'Lasciami leggere e agire negli strumenti che usi già.';

  @override
  String connectAppTile(String app) {
    return 'Collega $app';
  }

  @override
  String get showComputer => 'Mostra computer';

  @override
  String get hideComputer => 'Nascondi computer';

  @override
  String get moreActions => 'Altro';

  @override
  String get noConversations => 'Ancora nessuna conversazione';

  @override
  String get untitledChat => 'Nuova conversazione';

  @override
  String get listening => 'In ascolto…';

  @override
  String get orLabel => 'oppure';

  @override
  String get notificationsPrimerBubble => 'Non perderti nulla!';

  @override
  String get notificationsPrimerTitle => 'Attiva le notifiche';

  @override
  String get notificationsPrimerBody =>
      'I tuoi bot ti avvisano quando serve una tua decisione o quando il lavoro è pronto.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome sta bloccando le notifiche per questo sito. Consentile dal lucchetto nella barra degli indirizzi, poi tocca di nuovo Attiva.';

  @override
  String get notificationsTurnOn => 'Attiva';

  @override
  String get autoUpdates => 'Aggiorna automaticamente';

  @override
  String get autoUpdatesHelp => 'Installa le nuove versioni quando esci.';

  @override
  String get upToDate => 'Casama è aggiornata';

  @override
  String get noReleasesToCheck =>
      'Non è stata ancora pubblicata alcuna versione per questo computer, quindi non c\'è nulla con cui confrontare questa versione.';

  @override
  String updateReady(String version) {
    return 'È disponibile Casama $version';
  }

  @override
  String appVersion(String version) {
    return 'Versione $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Novità in Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Capito';

  @override
  String get whatsNewSubtitle =>
      'Ecco cosa è cambiato dall\'ultimo aggiornamento.';

  @override
  String get whatsNew010Calls =>
      'Chiama i tuoi bot e parlate insieme. Rispondono ad alta voce, con sottotitoli.';

  @override
  String get whatsNew010Looks =>
      'Rendi Casama tuo: temi, combinazioni di colori, font e sfondi in Impostazioni → Aspetto, con altri dalla galleria.';

  @override
  String get whatsNew010AboutYou =>
      'Racconta di te ai tuoi bot una sola volta, in Impostazioni → Su di te: come chiamarti e come preferisci le risposte.';

  @override
  String get whatsNew010SignIn =>
      'Accedi con una passkey, Apple, Google o un codice dalla tua email.';

  @override
  String get openAtLogin => 'Apri all\'accesso';

  @override
  String get openAtLoginHelp => 'Pronto per la scorciatoia di domanda rapida.';

  @override
  String get signInTagline =>
      'Colleghi che continuano a lavorare anche quando chiudi l\'app.';

  @override
  String get signInTagline2 => 'Ecco la tua squadra IA.';

  @override
  String get signInTagline3 =>
      'IA che non si limita a parlare. Porta a termine il lavoro.';

  @override
  String get signInTagline4 => 'Colleghi capaci che chiedono prima di agire.';

  @override
  String get signInTagline5 => 'Affida il lavoro. Ritrovalo già fatto.';

  @override
  String get noBotsHelp =>
      'Un bot è un collega con un proprio computer. Creane uno per iniziare a chattare.';

  @override
  String get newBotSubtitle =>
      'Un collega con il proprio computer e la propria memoria.';

  @override
  String get appearance => 'Aspetto';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI o un altro provider compatibile';

  @override
  String get signOutConfirm =>
      'Puoi accedere di nuovo in qualsiasi momento; i tuoi bot continuano a lavorare.';

  @override
  String get roleOwner => 'Proprietario';

  @override
  String get roleAdmin => 'Amministratore';

  @override
  String get roleMember => 'Membro';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Scuro';

  @override
  String get createWorkspaceBody =>
      'Uno spazio di lavoro contiene i tuoi bot, i loro computer e le persone con cui lavori.';

  @override
  String get workspaceNameHint => 'Il mio team';

  @override
  String get orJoinWithCode => 'oppure unisciti con un codice di invito';

  @override
  String get getOpenRouterKey => 'Ottieni una chiave OpenRouter';

  @override
  String get createFirstBotBody =>
      'Dagli un nome e un modello. Puoi cambiare entrambi in seguito.';

  @override
  String stepOf(int step, int total) {
    return 'Passaggio $step di $total';
  }

  @override
  String get providerHintOpenRouter =>
      'consigliato: chat, immagini, video, voce';

  @override
  String get providerHintGoogle => 'solo chiamate dal vivo';

  @override
  String get providerHintCompatible => 'Qualsiasi API compatibile con OpenAI';

  @override
  String get providerHintSearch => 'ricerca web';

  @override
  String get noRoutinesHelp =>
      'Una routine è un lavoro che un bot svolge più tardi in autonomia: una volta all\'orario che scegli, su pianificazione o quando arriva un webhook.';

  @override
  String get routineOnce => 'Una volta';

  @override
  String lastRun(String when) {
    return 'Ultima: $when';
  }

  @override
  String get routineOff => 'Disattivata';

  @override
  String get routineEnds => 'Termina';

  @override
  String get routineEndsNever => 'Mai';

  @override
  String get routineEndsOnDate => 'In una data';

  @override
  String get routineEndsAfterRuns => 'Dopo alcune esecuzioni';

  @override
  String get routineEndDate => 'Ultimo giorno';

  @override
  String get routineRunCountLabel => 'Esecuzioni';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n esecuzioni',
      one: '1 esecuzione',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Termina $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n esecuzioni rimaste',
      one: '1 esecuzione rimasta',
      zero: 'Nessuna esecuzione rimasta',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Quando termina';

  @override
  String get routineEndTitle => 'Quando termina';

  @override
  String get routineEndSubtitle =>
      'Poi si disattiva da sola. Un nuovo numero di esecuzioni parte da adesso.';

  @override
  String deleteRoutineTitle(String name) {
    return 'Eliminare “$name”?';
  }

  @override
  String get deleteRoutineBody =>
      'Non verrà più eseguita. I risultati già pubblicati restano nella conversazione.';

  @override
  String get triggerOnce => 'Una volta';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Tra $nString min';
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
      other: 'Tra $nString ore',
      one: 'Tra 1 ora',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Domani alle $time';
  }

  @override
  String get integrationNeedsName => 'Dagli un nome con almeno una lettera.';

  @override
  String integrationNeedsField(String field) {
    return 'Compila $field per salvare.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Salvato come $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Usa un indirizzo completo che inizi con https://';

  @override
  String get openFile => 'Apri';

  @override
  String get saveFile => 'Salva';

  @override
  String get shareFile => 'Condividi';

  @override
  String savedFile(String name) {
    return 'Salvato $name';
  }

  @override
  String noAppToOpen(String name) {
    return 'Nessuna app su questo dispositivo può aprire $name. Salvalo invece.';
  }

  @override
  String get previewUnavailable =>
      'Nessuna anteprima per questo tipo di file. Aprilo o salvalo per vederlo.';

  @override
  String get openInSystemPlayer => 'Apri nel lettore video';

  @override
  String get playMedia => 'Riproduci';

  @override
  String get fullScreen => 'Schermo intero';

  @override
  String get exitFullScreen => 'Esci da schermo intero';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '1 pagina',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Apri nel browser';

  @override
  String get convertingToPdf => 'Preparazione anteprima…';

  @override
  String tableFirstRows(int count) {
    return 'Visualizzazione delle prime $count righe';
  }

  @override
  String get imageCouldNotLoad => 'Impossibile caricare questa immagine';

  @override
  String get mediaKindImage => 'Immagine';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Audio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Apri file';

  @override
  String get attach => 'Allega';

  @override
  String get attachFiles => 'File';

  @override
  String get attachPhotos => 'Libreria foto';

  @override
  String get attachCamera => 'Scatta foto';

  @override
  String get attachScan => 'Scansiona documento';

  @override
  String get scanFailed => 'Impossibile scansionare il documento. Riprova.';

  @override
  String get dropToAttach => 'Trascina i file qui per allegarli';

  @override
  String uploadFailed(String name) {
    return 'Impossibile caricare $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'Impossibile allegare $name: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'Impossibile allegare $name';
  }

  @override
  String get sendWithoutIt => 'Invia senza';

  @override
  String get sendWithoutThem => 'Invia senza';

  @override
  String get removeAttachment => 'Rimuovi';

  @override
  String get editPhoto => 'Modifica foto';

  @override
  String get retryUpload => 'Riprova';

  @override
  String get uploadingAttachments => 'Caricamento…';

  @override
  String get notSent => 'Non inviato';

  @override
  String get deleteChat => 'Elimina chat';

  @override
  String get deleteChatTitle => 'Eliminare questa chat?';

  @override
  String deleteChatBody(String bot) {
    return 'I suoi messaggi vengono eliminati per tutti coloro che possono vederla. Ciò che $bot ha creato qui resta nella Libreria, i registri di utilizzo restano e ciò che ha memorizzato resta nella sua memoria.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Elimina anche i $count elementi creati qui',
      one: 'Elimina anche 1 elemento creato qui',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Disattivato: restano nella Libreria.';

  @override
  String get chatDeleted => 'Chat eliminata';

  @override
  String get deleteAllChats => 'Elimina tutte le chat';

  @override
  String get deleteAllChatsRow =>
      'Ricomincia da una cronologia pulita. I ricordi restano.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Eliminare tutte le chat con $bot?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Ogni chat con $bot che puoi eliminare viene rimossa, insieme a messaggi, foto e file. Le chat di gruppo restano. I registri di utilizzo restano e ciò che $bot ha memorizzato resta nella sua memoria.';
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
      other: '$nString chat eliminate.',
      one: '1 chat eliminata.',
      zero: 'Nessuna chat da eliminare.',
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
          '$nString chat sono state mantenute perché il bot ci sta ancora lavorando.',
      one: '1 chat è stata mantenuta perché il bot ci sta ancora lavorando.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n bot sono in questa chat. Ognuno mantiene la propria memoria e le proprie impostazioni.',
      one:
          '$n bot è in questa chat. Ognuno mantiene la propria memoria e le proprie impostazioni.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Scrivi @ e un nome per rivolgerti direttamente a un bot.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone: $lead risponde per primo e assegna le parti quando c\'è lavoro da dividere; altrimenti ogni bot risponde a turno e l\'ultimo tira le somme.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Senza una menzione, risponde il bot che ha parlato per ultimo (all\'inizio $lead).';
  }

  @override
  String get messageNotSent =>
      'I file non sono stati caricati, quindi il messaggio non è stato inviato. È di nuovo nella casella.';

  @override
  String get chatSendsWhenDone => 'Invia al termine di questa risposta';

  @override
  String get noComputerForFiles =>
      'Questo bot non ha un computer su cui tenere i file.';

  @override
  String fileTooLarge(String name) {
    return '$name supera i 25 MB: è troppo grande per essere allegato. Invia invece un link da Google Drive, Dropbox, iCloud o qualsiasi archivio cloud.';
  }

  @override
  String get secretsHelp =>
      'I bot inseriscono un segreto nelle richieste usando il suo nome. Viene inviato solo agli host che consenti e il modello non lo vede mai.';

  @override
  String deleteSecretTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get deleteSecretBody =>
      'I bot che lo usano non potranno più raggiungere quel servizio.';

  @override
  String get hide => 'Nascondi';

  @override
  String get show => 'Mostra';

  @override
  String get deleteMemoryTitle => 'Eliminare questo ricordo?';

  @override
  String get noMemoriesHelp =>
      'Mentre chatti, il bot salva ciò che conta: fatti, preferenze e riepiloghi del lavoro passato.';

  @override
  String get memoryHelp =>
      'I ricordi fissati restano sempre nel contesto del bot. Modifica ciò che è sbagliato; i ricordi eliminati spariscono per sempre.';

  @override
  String get memoryFact => 'Fatto';

  @override
  String get memoryPreference => 'Preferenza';

  @override
  String get memorySummary => 'Riepilogo';

  @override
  String get memoryEpisode => 'Episodio';

  @override
  String get pinned => 'Fissato';

  @override
  String get editMemory => 'Modifica ricordo';

  @override
  String get editMemoryHelp =>
      'Il bot lo usa la prossima volta che è pertinente.';

  @override
  String get modelKeysIntro =>
      'I bot ragionano con le tue chiavi dei provider di modelli. Le chiavi sono salvate crittografate e non vengono più mostrati.';

  @override
  String get casamaCloudKeyHint => 'Pagato dai tuoi crediti';

  @override
  String get casamaCloudIncluded => 'Incluso';

  @override
  String get casamaCloudModelLocked => 'Casama sceglie questo modello.';

  @override
  String get serverVoiceSetUp =>
      'Questo server fornisce la voce, quindi non c\'è nessuna chiave da aggiungere. Viene usata per prima l\'eventuale chiave dello spazio di lavoro.';

  @override
  String modelKeysFor(String workspace) {
    return 'Le chiavi appartengono a un solo spazio di lavoro. Queste sono per $workspace.';
  }

  @override
  String get yourKeys => 'Le tue chiavi';

  @override
  String get keyWorking => 'Funzionante';

  @override
  String get keyFailing => 'Non funzionante';

  @override
  String get keyUntested => 'Non testata';

  @override
  String get skillsHelp =>
      'Una competenza è un insieme di istruzioni che un bot carica quando un\'attività lo richiede, come il tuo stile per i report.';

  @override
  String get skillsForAllBots => 'Tutti i bot';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Solo per $bot';
  }

  @override
  String get skillsRemovedBot => 'Un bot rimosso';

  @override
  String deleteSkillTitle(String name) {
    return 'Eliminare la competenza “$name”?';
  }

  @override
  String get editSkill => 'Modifica competenza';

  @override
  String get deleteSkill => 'Elimina competenza';

  @override
  String get skillDescriptionHelp =>
      'I bot la leggono per decidere quando applicare la competenza.';

  @override
  String get skillBodyHint => '# Passaggi\n1. …';

  @override
  String get computersHelp =>
      'Ogni bot lavora su un computer: il computer del team condiviso da tutti, oppure uno privato. I file restano lì tra una chat e l\'altra.';

  @override
  String get computersEmptyTitle => 'Ancora nessun computer';

  @override
  String get thisDevice => 'Questo dispositivo';

  @override
  String get personalComputerConnected => 'Connesso';

  @override
  String get personalComputerOffline => 'Offline';

  @override
  String computerCpus(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n CPU',
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
    return '$size disco';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Ultimo uso $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Ultimo contatto $when';
  }

  @override
  String get computerSaved => 'Salvato';

  @override
  String get computerSavedHelp =>
      'I suoi file vengono conservati mentre è fermo';

  @override
  String computerCanUse(Object list) {
    return 'I bot possono usare: $list';
  }

  @override
  String get computerCanUseNothing => 'I bot non possono ancora usarlo';

  @override
  String get computerCapShell => 'Terminale';

  @override
  String get computerCapFiles => 'File';

  @override
  String get computerCapBrowser => 'Browser';

  @override
  String get computerCapDesktop => 'Schermo';

  @override
  String get computerCapMcp => 'Strumenti locali';

  @override
  String get computerCapMessages => 'Messaggi';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name è offline. Apri Casama su quel computer e attiva “Usa questo computer per i bot”. Il tuo computer non consuma mai le ore computer del tuo piano.';
  }

  @override
  String get yourComputerOffline => 'Il tuo computer è offline';

  @override
  String get howToFix => 'Come risolvere';

  @override
  String get computerHoursUsedTitle => 'Ore computer esaurite';

  @override
  String get personalScreenNote =>
      'Questo è il tuo computer, quindi vedi un nuovo screenshot ogni pochi secondi anziché una vista dal vivo.';

  @override
  String get renameComputer => 'Rinomina computer';

  @override
  String deleteComputerTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get privacyIntro =>
      'Le tue chat, i tuoi ricordi e i tuoi file ti appartengono. Esportali quando vuoi oppure elimina il tuo account.';

  @override
  String get yourData => 'I tuoi dati';

  @override
  String get shareAnalytics => 'Condividi dati di utilizzo';

  @override
  String get shareAnalyticsHelp =>
      'Report di utilizzo e arresti anomali. Mai i tuoi messaggi o file.';

  @override
  String get measureAds => 'Aiuta a misurare i nostri annunci';

  @override
  String get measureAdsHelp =>
      'Consente a Casama di comunicare a Meta quando qualcuno che ha visto il nostro annuncio si iscrive o si abbona. Casama non mostra mai annunci.';

  @override
  String get measureAdsNeedsUsageData =>
      'Attiva “Condividi dati di utilizzo” per usare questa opzione.';

  @override
  String get trackingTile => 'Consenti tracciamento';

  @override
  String get trackingAllowed =>
      'Consentito. L\'SDK di Meta è attivo su questo dispositivo e Casama può comunicare a Meta quando ti iscrivi o ti abboni dopo aver visto un nostro annuncio. Puoi cambiarlo nell\'app Impostazioni.';

  @override
  String get trackingNotAllowed =>
      'Non consentito. Nulla da questo dispositivo viene inviato a Meta. Puoi cambiarlo nell\'app Impostazioni.';

  @override
  String get trackingNotAsked =>
      'Casama non l\'ha ancora chiesto. Finché non lo consenti, nulla da questo dispositivo viene inviato a Meta.';

  @override
  String get trackingOpenSettings => 'Apri Impostazioni';

  @override
  String get workspaceAnalytics =>
      'Dati di utilizzo per questo spazio di lavoro';

  @override
  String get workspaceAnalyticsHelp =>
      'Dati di utilizzo per questo spazio di lavoro. I report sugli arresti anomali restano attivi.';

  @override
  String get dangerZone => 'Zona pericolosa';

  @override
  String get quotasHelp => 'Lascia un campo vuoto per nessun limite.';

  @override
  String get serviceOff => 'Disattivato';

  @override
  String get serviceDown => 'Guasto';

  @override
  String get serviceOk => 'OK';

  @override
  String get sendInvite => 'Invia invito';

  @override
  String get thinking0 => 'Modello';

  @override
  String get saveChanges => 'Salva modifiche';

  @override
  String get autonomyAskAlwaysHelp =>
      'Controlla con te prima di ogni azione che modifica qualcosa.';

  @override
  String get autonomyAskRiskyHelp =>
      'Lavora in autonomia, ma chiede conferma prima di qualsiasi azione rischiosa, come eliminare file o spendere denaro.';

  @override
  String get autonomyAutonomousHelp =>
      'Agisce senza chiedere. Ideale per le routine di cui ti fidi.';

  @override
  String get usageSubtitle => 'Spesa modelli questo mese';

  @override
  String get skillsRowHelp =>
      'Istruzioni che i bot caricano quando un’attività lo richiede';

  @override
  String get integrationsRowHelp => 'Server MCP e app collegate';

  @override
  String get secretsRowHelp => 'Token e password, inviati solo dove autorizzi';

  @override
  String get computersRowHelp => 'Il computer del team e quelli privati';

  @override
  String get companionRowHelp =>
      'Consenti ai bot di usare app e file di questo dispositivo';

  @override
  String get privacyRowHelp => 'Esporta i tuoi dati o elimina il tuo account';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Ancora nessuna integrazione';

  @override
  String get integrationsHelp =>
      'Le integrazioni offrono ai bot più strumenti: un server MCP, una sorgente OpenAPI, Composio o Pipedream. Ogni strumento prende il nome dalla sua integrazione.';

  @override
  String get botIntegrationsHelp =>
      'Attiva le integrazioni che questo bot può usare. I suoi strumenti compaiono alla prossima esecuzione.';

  @override
  String get openSettings => 'Apri Impostazioni';

  @override
  String get noRunsHelp =>
      'Ogni volta che questo bot lavora, da una chat, una routine o un webhook, l’esecuzione compare qui con ciò che ha fatto e quanto è costata.';

  @override
  String get runCompleted => 'Fatto';

  @override
  String get runWaiting => 'In attesa';

  @override
  String get runWorking => 'Al lavoro';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Routine';

  @override
  String get noEventsForFilter => 'Nulla di questo tipo in questa esecuzione.';

  @override
  String get runStatusFailed => 'Non riuscite';

  @override
  String get runStatusStopped => 'Fermato';

  @override
  String get quickAskIntro =>
      'Invia una richiesta rapida. Avvia una nuova chat con il bot che scegli.';

  @override
  String quickAskIntroBot(String name) {
    return 'Invia una richiesta rapida. Avvia una nuova chat con $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return 'Cosa deve fare $bot?';
  }

  @override
  String get stateProvisioning => 'Configurazione';

  @override
  String get stateStarting => 'Avvio';

  @override
  String get computerRestoringFiles => 'Ripristino file…';

  @override
  String get stateRunning => 'In esecuzione';

  @override
  String get stateIdle => 'Inattivo';

  @override
  String get stateSleeping => 'In sospensione';

  @override
  String get stateStopped => 'Fermato';

  @override
  String get stateError => 'Errore';

  @override
  String get terminalHelp =>
      'Una shell su questo computer. I bot usano la stessa, così puoi vedere e correggere ciò che hanno fatto.';

  @override
  String get up => 'Cartella superiore';

  @override
  String get emptyFolderHelp =>
      'I file creati dai tuoi bot e quelli che carichi compaiono qui.';

  @override
  String deleteFileTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get botComputerAuto => 'Automatico';

  @override
  String get botComputerHelp =>
      'Il computer del bot: dove esegue comandi, naviga e conserva i suoi file.';

  @override
  String get billingOffTitle => 'Nessuna fatturazione qui';

  @override
  String revokeKeyTitle(String name) {
    return 'Revocare la chiave per $name?';
  }

  @override
  String get revokeKeyBody =>
      'Quel server smetterà subito di usare computer cloud e crediti.';

  @override
  String get handBackHelp =>
      'Il bot riprende da dove avevi lasciato. Digli cos’hai fatto, se aiuta.';

  @override
  String get serverHelp =>
      'Usa il tuo server Casama. Inserisci l’indirizzo configurato da te o dal tuo amministratore.';

  @override
  String get ssoHelp =>
      'Inserisci la tua email aziendale e ti invieremo alla pagina di accesso della tua azienda.';

  @override
  String get colorScheme => 'Combinazione di colori';

  @override
  String get searchThemes => 'Cerca combinazioni';

  @override
  String get noThemesFound => 'Nessuna combinazione corrispondente.';

  @override
  String get noAppsMatch =>
      'Nessuna app corrisponde. Puoi aggiungere il tuo server in Avanzate.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app',
      one: '1 app',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'Tutto';

  @override
  String get familyPurple => 'Viola';

  @override
  String get familyBlue => 'Blu';

  @override
  String get familyTeal => 'Verde acqua';

  @override
  String get familyGreen => 'Verde';

  @override
  String get familyWarm => 'Caldo';

  @override
  String get familyRed => 'Rosso e rosa';

  @override
  String get familyNeutral => 'Neutro';

  @override
  String get background => 'Sfondo';

  @override
  String get backgroundPattern => 'Motivo';

  @override
  String get backgroundColors => 'Colori';

  @override
  String get backgroundThemeColors => 'Tema';

  @override
  String get patternStrength => 'Intensità motivo';

  @override
  String get wallpaperEverywhere => 'Mostra su ogni schermata';

  @override
  String get wallpaperEverywhereHelp =>
      'Disattiva per tenerlo solo dietro le chat.';

  @override
  String get resetBackground => 'Ripristina predefinito';

  @override
  String get copyMessage => 'Copia';

  @override
  String get selectText => 'Seleziona testo';

  @override
  String get shareMessage => 'Quota';

  @override
  String get messageCopied => 'Copiato';

  @override
  String get botUiBroken => 'Impossibile mostrare questa parte della risposta.';

  @override
  String get botUiSent => 'Inviato';

  @override
  String get botUiConnected => 'Connesso';

  @override
  String get draftNewEmail => 'Nuova email';

  @override
  String get draftNewMessage => 'Nuovo messaggio';

  @override
  String get draftNewPost => 'Nuovo post';

  @override
  String get draftReadyToSend => 'Pronto per l’invio';

  @override
  String get draftReadyToPost => 'Pronto per la pubblicazione';

  @override
  String get draftEdited => 'Modificato';

  @override
  String get draftSendEmail => 'Invia email';

  @override
  String get draftSend => 'Invia';

  @override
  String get draftPost => 'Pubblica';

  @override
  String get draftDiscard => 'Scarta';

  @override
  String get draftEdit => 'Modifica';

  @override
  String get draftDoneEditing => 'Fine';

  @override
  String get draftFrom => 'Da';

  @override
  String get draftTo => 'A';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Ccn';

  @override
  String get draftSubject => 'Oggetto';

  @override
  String get botCardNewEvent => 'Nuovo evento';

  @override
  String get botCardEvent => 'Evento';

  @override
  String get botCardReadyToAdd => 'Da aggiungere';

  @override
  String get botCardAddToCalendar => 'Aggiungi al calendario';

  @override
  String get botCardChange => 'Cambia';

  @override
  String get botCardSkip => 'Salta';

  @override
  String get botCardAllDay => 'Tutto il giorno';

  @override
  String botCardMore(int count) {
    return '+$count altri';
  }

  @override
  String get botCardAgenda => 'Agenda';

  @override
  String get botCardMessages => 'Messaggi';

  @override
  String botCardUnread(int count) {
    return '$count non letti';
  }

  @override
  String get botCardReply => 'Rispondi';

  @override
  String botCardReplyTo(String name) {
    return 'Rispondi a $name';
  }

  @override
  String get botCardTasks => 'Attività';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done di $total completate';
  }

  @override
  String get botCardSaveChanges => 'Salva modifiche';

  @override
  String get botCardChoose => 'Scegli';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Chi intendi?';

  @override
  String get botCardNoneOfThese => 'Nessuno di questi';

  @override
  String get botCardReminder => 'Promemoria';

  @override
  String get botCardRoutine => 'Routine';

  @override
  String get botCardWatcher => 'Monitoraggio attivo';

  @override
  String get botCardScheduled => 'Impostato';

  @override
  String botCardNext(String when) {
    return 'Prossima: $when';
  }

  @override
  String get botCardCancelIt => 'Annulla';

  @override
  String get botIcon => 'Icona';

  @override
  String get botIconInitials => 'Iniziali';

  @override
  String get errorDetailsTitle => 'Cosa è andato storto';

  @override
  String get exportLabel => 'Esporta';

  @override
  String get openTimeline => 'Apri cronologia esecuzioni';

  @override
  String get details => 'Dettagli';

  @override
  String get themes => 'Temi';

  @override
  String get myThemes => 'I tuoi temi';

  @override
  String get saveTheme => 'Salva tema attuale';

  @override
  String get themeName => 'Nome del tema';

  @override
  String get importTheme => 'Importa un tema';

  @override
  String get themeCode => 'Codice tema';

  @override
  String get themeCodeHelp =>
      'Incolla un codice che qualcuno ha condiviso con te. Inizia con casama-theme:';

  @override
  String get invalidThemeCode => 'Questo non è un codice tema di Casama.';

  @override
  String themeImported(String name) {
    return '$name aggiunto ai tuoi temi';
  }

  @override
  String get themeCodeCopied =>
      'Codice tema copiato. Chiunque può incollarlo in Aspetto → Importa un tema.';

  @override
  String get shareTheme => 'Condividi codice';

  @override
  String deleteThemeTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get fonts => 'Font';

  @override
  String get headingFont => 'Titoli';

  @override
  String get bodyFont => 'Testo';

  @override
  String get fontsHelp =>
      'Google Sans e Noto Serif sono inclusi nell\'app e funzionano offline. Altri Google Fonts vengono scaricati la prima volta che li scegli.';

  @override
  String get searchFonts => 'Cerca tra tutti i Google Fonts';

  @override
  String get suggestedFonts => 'Consigliati';

  @override
  String get allFonts => 'Tutti i Google Fonts';

  @override
  String get noFontsFound => 'Nessun font con questo nome';

  @override
  String get resetFonts => 'Usa predefiniti';

  @override
  String get fontSample => 'I tuoi bot, al lavoro insieme a te.';

  @override
  String get backgroundPhoto => 'Foto';

  @override
  String get yourPhoto => 'La tua foto';

  @override
  String get browsePhotos => 'Sfoglia foto';

  @override
  String get removePhoto => 'Rimuovi foto';

  @override
  String get photoBlur => 'Sfocatura';

  @override
  String get photoDim => 'Attenuazione';

  @override
  String photoBy(String name) {
    return 'Foto di $name su Unsplash';
  }

  @override
  String get searchPhotos => 'Cerca foto';

  @override
  String get photosUnavailable => 'Impossibile caricare le foto.';

  @override
  String get noPhotos => 'Nessuna foto trovata';

  @override
  String get photoHelp =>
      'Una foto va sotto i disegni. Sfocatura e attenuazione mantengono il testo leggibile sopra.';

  @override
  String get periodToday => 'Oggi';

  @override
  String get periodWeek => 'Questa settimana';

  @override
  String get periodYear => 'Quest\'anno';

  @override
  String get totalSpend => 'Spesa';

  @override
  String get tokensIn => 'Token in ingresso';

  @override
  String get tokensOut => 'Token in uscita';

  @override
  String get runsLabel => 'Esecuzioni';

  @override
  String get spendByDay => 'Spesa per giorno';

  @override
  String get byBot => 'Per bot';

  @override
  String get byModel => 'Per modello';

  @override
  String get everythingMetered => 'Tutto a consumo';

  @override
  String get bySource => 'Per origine';

  @override
  String get byPerson => 'Per persona';

  @override
  String get usageAllBots => 'Tutti i bot';

  @override
  String get usageAllModels => 'Tutti i modelli';

  @override
  String get usageAllSources => 'Tutte le origini';

  @override
  String get usageEveryone => 'Tutti';

  @override
  String get usageJustMe => 'Solo io';

  @override
  String get usageClearFilters => 'Cancella';

  @override
  String get usageFilterBot => 'Filtra per bot';

  @override
  String get usageFilterModel => 'Filtra per modello';

  @override
  String get usageFilterSource => 'Filtra per origine';

  @override
  String get usageFilterPerson => 'Filtra per persona';

  @override
  String get usageSourceChat => 'Chat';

  @override
  String get usageSourceChatApp => 'App di chat';

  @override
  String get usageSourceRoutine => 'Routine';

  @override
  String get usageSourceApi => 'API e altri agenti';

  @override
  String get usageSourceOther => 'Altro';

  @override
  String get usageNoPerson => 'Automatico';

  @override
  String get usageUnnamedPerson => 'Membro senza nome';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n esecuzioni',
      one: '1 esecuzione',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Esporta CSV';

  @override
  String get exportJson => 'Esporta JSON';

  @override
  String get askBotAboutUsage => 'Chiedi a un bot';

  @override
  String get noUsageYet => 'Ancora nessun utilizzo in questo periodo.';

  @override
  String get otherModel => 'Computer e altro';

  @override
  String get deletedBot => 'Non associato a un bot';

  @override
  String get usageHelp =>
      'I costi sono stime basate sul conteggio dei token e sui prezzi pubblicati. Fa fede la fattura del tuo provider di modelli.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Ecco il mio utilizzo di Casama per $period. Aiutami a capire dove vanno i soldi e come potrei spendere meno. Puoi anche controllare i numeri in tempo reale con il tuo strumento di utilizzo.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Input del modello';

  @override
  String get kindTokensOut => 'Output del modello';

  @override
  String get kindComputer => 'Tempo computer cloud';

  @override
  String get kindModels => 'Modelli IA';

  @override
  String get creditsThisMonth => 'Crediti di questo mese';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent% usato';
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
      other: 'Circa altre $nString esecuzioni al costo abituale',
      one: 'Circa 1 altra esecuzione al costo abituale',
      zero: 'Meno di un\'altra esecuzione al costo abituale',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Hai esaurito i crediti. Aggiungine altri per far continuare a lavorare i tuoi bot.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 credito = $price. Il tuo piano aggiunge $amount ogni mese; i crediti non usati restano validi per un altro mese.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 credito = $price. I pacchetti di crediti acquistati su App Store o Google Play non scadono mai; i pacchetti di crediti acquistati sul web durano 12 mesi.';
  }

  @override
  String get creditsDailyLabel => 'Limite di oggi';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used di $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Quanto il tuo piano può spendere ogni giorno per i modelli, la voce e le app di Casama, indipendentemente dai crediti rimasti.';

  @override
  String get creditsDailyReached =>
      'Il limite di oggi è stato raggiunto, quindi i tuoi bot sono in pausa. Passa a un piano superiore per avere un limite giornaliero più alto.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Si azzera tra circa $n ore.',
      one: 'Si azzera tra circa 1 ora.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Si azzera tra meno di un\'ora.';

  @override
  String get creditsHoursLabel => 'Ore computer';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used di $limit h';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Tempo in cui i computer dei tuoi bot restano attivi questo mese. Quando le ore si esauriscono, la chat continua a funzionare; si ferma solo il computer. Azzeramento: $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Le ore computer di questo mese sono esaurite, quindi il computer non può avviarsi. La chat continua a funzionare. Azzeramento: $date. Passa a un piano superiore per avere più ore.';
  }

  @override
  String get kindStream => 'Vista dal vivo';

  @override
  String get kindTts => 'Leggi ad alta voce';

  @override
  String get computerMissingTitle => 'Computer non trovato';

  @override
  String get computerMissingHelp =>
      'Potrebbe essere stato rimosso oppure l\'elenco non è aggiornato. Aggiorna per controllare di nuovo.';

  @override
  String get computerMissingBotHelp =>
      'Il computer di questo bot potrebbe essere stato rimosso oppure l\'elenco non è aggiornato. Aggiorna o scegli un altro computer per questo bot.';

  @override
  String get computerChoose => 'Scegli un computer';

  @override
  String get personaWork => 'Lavoro';

  @override
  String get personaResearch => 'Ricerca';

  @override
  String get personaBuild => 'Sviluppo';

  @override
  String get personaCreate => 'Creazione';

  @override
  String get personaLife => 'Vita';

  @override
  String get personaOther => 'Altro';

  @override
  String get blankBotHelp => 'Inizia da zero e scrivi le tue istruzioni.';

  @override
  String get browse => 'Sfoglia';

  @override
  String get browseAllPersonas => 'Sfoglia tutte';

  @override
  String get botIdentity => 'Nome e icona';

  @override
  String get serviceKeys => 'Chiavi di servizio';

  @override
  String get noServiceKeys => 'Nessuna chiave di servizio.';

  @override
  String get serviceKeysHelp => 'Le tue chiavi per ricerca, mappe o dati';

  @override
  String get serviceKeysIntro =>
      'Casama gestisce modelli, voce e immagini per te. Aggiungi una chiave qui solo per usare il tuo servizio di ricerca, mappe o dati. Le chiavi sono salvate crittografate e non vengono più mostrate.';

  @override
  String get choosePersona => 'Scegli una personalità';

  @override
  String get choosePersonaHelp =>
      'Ciascuna include istruzioni, uno stile e a volte competenze e routine. Puoi cambiare tutto in seguito.';

  @override
  String get searchPersonas => 'Cerca personalità';

  @override
  String get noPersonasFound => 'Nessuna personalità corrisponde';

  @override
  String get previewPersona => 'Anteprima';

  @override
  String get personaInstructions => 'Istruzioni';

  @override
  String get personaTryAsking => 'Prova a chiedere';

  @override
  String usePersona(String name) {
    return 'Usa $name';
  }

  @override
  String get loadPersona => 'Carica una personalità';

  @override
  String get replaceInstructionsTitle => 'Sostituire le istruzioni?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Le istruzioni attuali del bot verranno sostituite con quelle di $name. Competenze e routine restano invariate.';
  }

  @override
  String get replace => 'Sostituisci';

  @override
  String get appsTitle => 'App';

  @override
  String get appsSubtitle =>
      'Dai ai tuoi bot gli strumenti che il tuo team usa già.';

  @override
  String get connectedTab => 'Collegate';

  @override
  String get browseTab => 'Sfoglia';

  @override
  String get searchApps => 'Cerca app';

  @override
  String get popularApps => 'Popolari';

  @override
  String get allApps => 'Tutte le app';

  @override
  String get appCatDeveloper => 'Sviluppo';

  @override
  String get appCatProductivity => 'Produttività';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Pagamenti';

  @override
  String get appCatDesign => 'Design';

  @override
  String get appCatSales => 'Vendite e supporto';

  @override
  String get appCatData => 'Dati e ricerca';

  @override
  String get appCatAutomation => 'Automazione';

  @override
  String get authOneClick => 'Un clic';

  @override
  String get authApiKey => 'Chiave API';

  @override
  String get authNone => 'Nessun accesso';

  @override
  String get authAdminSetup => 'Richiede configurazione';

  @override
  String get connectedBadge => 'Collegata';

  @override
  String get whatBotsCanDo => 'Cosa possono fare i tuoi bot';

  @override
  String continueWith(String app) {
    return 'Continua con $app';
  }

  @override
  String get signInTab => 'Accedi';

  @override
  String get connectNoSignIn => 'Questa app funziona senza accesso.';

  @override
  String finishSignIn(String app) {
    return 'Completa l\'accesso a $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app si è aperta nel browser. Approva l\'accesso lì e questa schermata si aggiornerà da sola.';
  }

  @override
  String get reopenSignIn => 'Riapri pagina di accesso';

  @override
  String appConnected(String app) {
    return '$app è collegata';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app è già collegata in questo spazio di lavoro. Usa quella connessione o aggiungi un altro account.';
  }

  @override
  String get useConnection => 'Usala';

  @override
  String get addAnotherAccount => 'Aggiungi un altro account';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString strumenti pronti per i tuoi bot.',
      one: '1 strumento pronto per i tuoi bot.',
      zero: 'Pronta all\'uso.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Quali bot possono usarla?';

  @override
  String get whichBotsHelp =>
      'I bot chiedono comunque conferma prima di qualsiasi azione rischiosa.';

  @override
  String get doneLabel => 'Fatto';

  @override
  String openApp(String app) {
    return 'Apri $app';
  }

  @override
  String get pasteLabel => 'Incolla';

  @override
  String get connectingLabel => 'Connessione…';

  @override
  String get connectFailedTitle => 'Impossibile connettersi';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Oppure collega $app tramite uno di questi servizi. Accedi una volta, poi chiedi al tuo bot di usare $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'L\'accesso viene salvato crittografato e non viene più mostrato. Puoi scollegarlo quando vuoi.';

  @override
  String get composioHelp => 'Centinaia di app, con accesso gestito per te.';

  @override
  String get pipedreamHelp => 'Migliaia di app tramite Pipedream Connect.';

  @override
  String get customServer => 'Server personalizzato';

  @override
  String get customServerHelp =>
      'Qualsiasi server MCP o specifica OpenAPI. Per sviluppatori.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usata da $countString bot',
      one: 'Usata da 1 bot',
      zero: 'Non ancora assegnata a nessun bot',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Pronto';

  @override
  String get statusNeedsAttention => 'Richiede attenzione';

  @override
  String get statusChecking => 'Verifica';

  @override
  String get toolsHelp =>
      'Gli strumenti di sola lettura funzionano in autonomia. Quelli che apportano modifiche chiedono conferma se un bot ha letto qualcosa di non attendibile, mentre quelli contrassegnati con “Chiede sempre” attendono sempre la tua conferma.';

  @override
  String get botsWithAccess => 'Bot con accesso';

  @override
  String get reconnect => 'Riconnetti';

  @override
  String get disconnect => 'Scollega';

  @override
  String disconnectTitle(String app) {
    return 'Scollegare $app?';
  }

  @override
  String get disconnectBody =>
      'I bot perdono subito l’accesso ai relativi strumenti e l’accesso salvato viene eliminato.';

  @override
  String get testConnection => 'Testa connessione';

  @override
  String get signedInOAuth => 'Accesso effettuato con il tuo account';

  @override
  String get signedInKey => 'Collegato con una chiave API';

  @override
  String get signedInNone => 'Nessun accesso necessario';

  @override
  String get noConnectionsTitle => 'Collega la tua prima app';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail e altre. Quasi tutte richiedono un clic.';

  @override
  String get browseApps => 'Sfoglia app';

  @override
  String providerSetupTitle(String provider) {
    return 'Collega $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider accede alle app per te, così non devi gestire le loro chiavi.';
  }

  @override
  String get getFreeKey => 'Ottieni una chiave gratuita';

  @override
  String connectedThroughHub(String provider) {
    return 'Tramite $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'App tramite $provider';
  }

  @override
  String get addAnApp => 'Aggiungi un\'app';

  @override
  String searchProviderApps(String provider) {
    return 'Cerca app $provider';
  }

  @override
  String get accountConnected => 'Accesso effettuato';

  @override
  String get accountPending => 'In attesa di accesso';

  @override
  String get accountError => 'Problema di accesso';

  @override
  String get providerReconnectHint =>
      'Accedi direttamente con Casama per costi più bassi sulle chiamate alle app';

  @override
  String get noProviderAccounts =>
      'Nessuna app. Aggiungine una ed effettua l\'accesso.';

  @override
  String get projectId => 'ID progetto';

  @override
  String get toolRiskLow => 'Sola lettura';

  @override
  String get toolRiskMedium => 'Apporta modifiche';

  @override
  String get toolRiskHigh => 'Chiede sempre';

  @override
  String get askWhichBot => 'Quale bot deve occuparsene?';

  @override
  String get computerWake => 'Riattiva';

  @override
  String get computerAsleepTitle => 'Il computer è in sospensione';

  @override
  String get computerAsleepFilesHelp =>
      'Riattivalo per vedere e caricare i suoi file.';

  @override
  String get computerFilesTimedOut =>
      'Il caricamento dei file ha richiesto troppo tempo. Controlla che il computer sia acceso, poi riprova.';

  @override
  String get computerGoingToSleep => 'Sta andando in sospensione';

  @override
  String get liveViewWakesHelp =>
      'Questo computer è in sospensione. Aprendo la vista dal vivo si riattiva; torna in sospensione dopo un po’ di inutilizzo.';

  @override
  String get wakeAndWatch => 'Riattiva e guarda dal vivo';

  @override
  String get chatGptPlan => 'Piano ChatGPT';

  @override
  String get continueWithChatGpt => 'Continua con ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Esegui i tuoi bot sul tuo piano ChatGPT invece che con una chiave API. Le chiamate ai modelli rientrano nei limiti del tuo piano e puoi usarlo solo tu.';

  @override
  String get chatGptDesktopOnly =>
      'Per collegare il tuo piano ChatGPT, apri l\'app desktop oppure esegui \"casama credential chatgpt\" nella CLI.';

  @override
  String get chatGptWaiting => 'Completa l\'accesso con ChatGPT nel browser…';

  @override
  String chatGptConnected(String account) {
    return 'Piano ChatGPT collegato ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Hai effettuato l\'accesso, ma l\'utilizzo del piano non è stato consentito. Riconnetti e consentilo oppure aggiungi una chiave API.';

  @override
  String get orAddApiKey => 'Oppure aggiungi una chiave API';

  @override
  String get planOnlyYou => 'Puoi usarlo solo tu';

  @override
  String get planOtherMember => 'Piano di un altro membro';

  @override
  String get planConnected => 'Collegato';

  @override
  String get planUsageOff => 'Utilizzo del piano disattivato';

  @override
  String get planNeedsReconnect => 'Accedi di nuovo';

  @override
  String get useNextModelAtLimit =>
      'Usa il modello successivo del bot al limite del mio piano';

  @override
  String get useNextModelAtLimitHelp =>
      'Disattivato: l\'esecuzione si ferma quando raggiungi il limite ChatGPT. Attivo: continua sul modello successivo del bot, operazione che può avere un costo.';

  @override
  String get manageUsage => 'Gestisci utilizzo';

  @override
  String get removeKey => 'Rimuovi';

  @override
  String removeKeyConfirm(String label) {
    return 'Rimuovere $label? I bot che lo usano smettono di funzionare finché non dai loro un\'altra chiave.';
  }

  @override
  String get removeKeyChatGptNote =>
      'Anche il tuo accesso a ChatGPT viene revocato.';

  @override
  String modelFallbackNotice(String message) {
    return 'Passato al modello successivo: $message';
  }

  @override
  String get twoStepSignIn => 'Accesso in due passaggi';

  @override
  String get twoStepHelp =>
      'Chiedi un codice da un\'app di autenticazione ogni volta che accedi.';

  @override
  String get signInWithPasskey => 'Accedi con una passkey';

  @override
  String get account => 'Account';

  @override
  String get accountRow => 'Email, password e disconnessione ovunque';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get newPassword => 'Nuova password';

  @override
  String get newPasswordAgain => 'Ripeti nuova password';

  @override
  String get passwordsDontMatch => 'Le password non corrispondono';

  @override
  String get newPasswordTitle => 'Scegli una nuova password';

  @override
  String get newPasswordBody =>
      'Accesso effettuato. Scegli una nuova password per accedere con la tua email.';

  @override
  String get savePassword => 'Salva password';

  @override
  String get passwordSaved => 'Password salvata.';

  @override
  String get passwordTitle => 'Password';

  @override
  String get passwordRow =>
      'Imposta o cambia la password per accedere con la tua email';

  @override
  String get passwordHelp =>
      'Usa almeno 6 caratteri. Puoi comunque accedere con Google, Apple, una passkey o un link via email.';

  @override
  String passwordCodeSent(String email) {
    return 'Per proteggere il tuo account, inserisci il codice che abbiamo appena inviato a $email.';
  }

  @override
  String get changeEmailTitle => 'Cambia email';

  @override
  String get changeEmailHelp =>
      'Invieremo un link di conferma al tuo indirizzo attuale e a quello nuovo. La modifica avviene una volta confermati entrambi.';

  @override
  String get newEmail => 'Nuova email';

  @override
  String get changeEmailSend => 'Invia conferma';

  @override
  String get changeEmailRow => 'Cambia l\'email con cui accedi';

  @override
  String changeEmailSent(String email) {
    return 'Controlla entrambe le caselle di posta. $email diventerà la tua email una volta confermati entrambi i link.';
  }

  @override
  String changeEmailPending(String email) {
    return 'In attesa di conferma: $email';
  }

  @override
  String get signOutEverywhere => 'Esci ovunque';

  @override
  String get signOutEverywhereHelp =>
      'Ogni telefono, computer e browser, incluso questo';

  @override
  String get signOutEverywhereConfirm =>
      'Uscire da tutti i dispositivi, incluso questo? Usa questa opzione se hai perso un dispositivo o pensi che qualcun altro abbia effettuato l’accesso.';

  @override
  String get passkeySuggestTitle =>
      'Vuoi accedere più velocemente la prossima volta?';

  @override
  String get passkeySuggestBody =>
      'Aggiungi una passkey e accedi con Face ID, impronta digitale o blocco schermo. Nessuna password o email necessaria.';

  @override
  String get passkeys => 'Passkey';

  @override
  String get passkeysRow =>
      'Accedi con Face ID, impronta digitale o blocco schermo';

  @override
  String get passkeysHelp =>
      'Una passkey ti fa accedere con Face ID, impronta digitale o blocco schermo, senza password né email. Ogni telefono, computer o gestore di password conserva la propria.';

  @override
  String get passkeyAdd => 'Aggiungi una passkey';

  @override
  String get passkeyAddAnother => 'Aggiungi un\'altra passkey';

  @override
  String get passkeyAdded =>
      'Passkey aggiunta. La prossima volta, accedi con quella.';

  @override
  String get passkeyRename => 'Rinomina';

  @override
  String get passkeyRenameTitle => 'Rinomina passkey';

  @override
  String get passkeyNameLabel => 'Nome';

  @override
  String get passkeyRemove => 'Rimuovi';

  @override
  String passkeyRemoveConfirm(String name) {
    return 'Rimuovere “$name”? Non potrai più accedere con questa passkey.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Aggiunta: $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Ultimo uso $when';
  }

  @override
  String get twoStepSetUp => 'Configura un\'app di autenticazione';

  @override
  String get twoStepAddAnother => 'Aggiungi un altro autenticatore';

  @override
  String get twoStepScan =>
      'Scansiona questo codice con un\'app di autenticazione (come 1Password, Google Authenticator o Authy), oppure inserisci la chiave di configurazione, poi inserisci il codice a 6 cifre mostrato.';

  @override
  String get twoStepKey => 'Chiave di configurazione';

  @override
  String get twoStepCode => 'Codice a 6 cifre';

  @override
  String get twoStepVerify => 'Verifica';

  @override
  String get twoStepNowOn => 'L\'accesso in due passaggi è attivo.';

  @override
  String get twoStepAuthenticators => 'App di autenticazione';

  @override
  String get twoStepRename => 'Rinomina';

  @override
  String get twoStepRenameTitle => 'Rinomina autenticatore';

  @override
  String get twoStepNameLabel => 'Nome';

  @override
  String get twoStepNameHint => 'Ad esempio: Telefono di lavoro';

  @override
  String get twoStepRemove => 'Rimuovi';

  @override
  String get twoStepRemoveConfirm =>
      'Rimuovere questa app di autenticazione? Se è l\'unica, accederai solo con la tua password.';

  @override
  String get twoStepPromptTitle => 'Inserisci il codice';

  @override
  String get twoStepPromptBody =>
      'Apri la tua app di autenticazione e inserisci il codice a 6 cifre per completare l\'accesso.';

  @override
  String get twoStepPromptAccount => 'Accesso come';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Nuova password per';

  @override
  String get connectAiAppAccount => 'Ottiene l\'accesso a';

  @override
  String joinAsAccount(String email, String server) {
    return 'Ti iscriverai come $email su $server.';
  }

  @override
  String get requireTwoStep =>
      'Richiedi l\'accesso in due passaggi per proprietari e amministratori';

  @override
  String get requireTwoStepHelp =>
      'Proprietari e amministratori devono usarlo. Attiva prima il tuo.';

  @override
  String get twoStepNeededForAdmin =>
      'Questo spazio di lavoro richiede l\'accesso in due passaggi per proprietari e amministratori. Configuralo o accedi di nuovo con il codice per usare le impostazioni di amministrazione.';

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
  String get adminCapacityComputersTitle => 'Computers & file jobs (7 days)';

  @override
  String adminCapacityWakeTime(String mode, String p50, String p90, int count) {
    return '$mode wake: $p50 p50 / $p90 p90 ($count)';
  }

  @override
  String adminCapacityFileJobs(int count) {
    return 'File jobs: $count';
  }

  @override
  String adminCapacityFileJobsTimed(int count, String p50, String p90) {
    return 'File jobs: $count ($p50 p50 / $p90 p90)';
  }

  @override
  String adminCapacityBrowserOoms(int count) {
    return 'Browser out-of-memory restarts: $count';
  }

  @override
  String adminCapacityWakesByCaller(String list) {
    return 'Wakes by caller: $list';
  }

  @override
  String adminCapacityShellPrograms(String list) {
    return 'Top shell programs: $list';
  }

  @override
  String get adminNoAbuse => 'Nothing suspicious so far.';

  @override
  String get suspendWorkspace => 'Sospendi';

  @override
  String get unsuspendWorkspace => 'Revoca sospensione';

  @override
  String get suspendReason => 'Motivo';

  @override
  String get suspendWorkspaceHelp =>
      'I suoi computer si fermano e i suoi bot smettono di funzionare. Nulla viene eliminato e puoi revocare la sospensione in qualsiasi momento.';

  @override
  String workspaceSuspended(String reason) {
    return 'Sospeso: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Questo spazio di lavoro è sospeso, quindi i bot non possono lavorare e i computer non possono avviarsi. Contatta chi gestisce questo server.';

  @override
  String get abuseKind_mining_pool => 'Crypto mining bloccato';

  @override
  String get abuseKind_blocked_port => 'Porta email bloccata';

  @override
  String get abuseKind_egress_flood => 'Eccesso di traffico';

  @override
  String get abuseKind_signup_blocked => 'Registrazione rifiutata';

  @override
  String get abuseKind_suspended => 'Spazio di lavoro sospeso';

  @override
  String get abuseKind_unsuspended => 'Sospensione revocata';

  @override
  String get kindLocalMcp => 'Su un computer';

  @override
  String get capMcp => 'Strumenti locali (MCP)';

  @override
  String get localMcpServers => 'Strumenti locali (MCP)';

  @override
  String get localMcpHelp =>
      'Server MCP su questo computer o sulla tua rete che i tuoi bot possono usare, come T3 Code, Claude Code, Codex o app di design. I loro token e accessi restano su questo computer.';

  @override
  String get localMcpAdd => 'Aggiungi un server MCP locale';

  @override
  String get localMcpEmpty => 'Nessun server MCP locale.';

  @override
  String get localMcpName => 'Nome';

  @override
  String get localMcpStdio => 'Un comando';

  @override
  String get localMcpLoopback => 'Un indirizzo';

  @override
  String get localMcpCommand => 'Comando';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Indirizzo';

  @override
  String get localMcpFolder => 'Cartella di lavoro (facoltativa)';

  @override
  String get localMcpEnv =>
      'Ambiente (un KEY=value per riga, conservato su questo computer)';

  @override
  String get localMcpNeedsCapability =>
      'Attiva Strumenti locali (MCP) qui sopra così i bot possano usarli.';

  @override
  String get localMcpBadUrl =>
      'Usa un indirizzo http:// su questo computer o sulla tua rete, come http://127.0.0.1:3845/mcp, oppure un indirizzo https://.';

  @override
  String get localMcpBadFolder =>
      'Scegli una cartella all\'interno di una delle cartelle condivise.';

  @override
  String get codingAgents => 'Agenti di coding';

  @override
  String get codingAgentsHelp =>
      'I bot possono affidare attività di programmazione a questi agenti su questo computer. Usano i tuoi accessi e lavorano nelle cartelle che condividi.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Trovati $nString agenti di coding',
      one: 'Trovato 1 agente di coding',
      zero: 'Nessun agente di coding trovato',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Questo server non è ancora salvato nello spazio di lavoro. Rimuovilo e aggiungilo di nuovo.';

  @override
  String get localMcpSignInKind => 'Accesso';

  @override
  String get localMcpAuthNone => 'Nessuno';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Intestazione';

  @override
  String get localMcpAuthOAuth => 'Browser';

  @override
  String get localMcpToken => 'Token (conservato su questo computer)';

  @override
  String get localMcpHeaderName => 'Nome intestazione';

  @override
  String get localMcpHeaderValue =>
      'Valore intestazione (conservato su questo computer)';

  @override
  String get localMcpOAuthHelp =>
      'Casama apre il browser per farti accedere a questo server. L\'accesso resta su questo computer.';

  @override
  String get localMcpNetworkWarning =>
      'Questo server non è su questo computer. I bot che possono usare questo computer possono raggiungerlo.';

  @override
  String get localMcpSignIn => 'Accedi';

  @override
  String get localMcpNeedsSignIn => 'Richiede l\'accesso';

  @override
  String get localMcpEdit => 'Modifica server MCP locale';

  @override
  String get localMcpImport => 'Aggiungi da altre app';

  @override
  String get localMcpImportHelp =>
      'Server MCP già configurati in T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex o Windsurf su questo computer.';

  @override
  String get localMcpImportNone =>
      'Nessun server MCP trovato in altre app su questo computer.';

  @override
  String get localMcpImportAdded => 'Già aggiunto';

  @override
  String get localMcpImportRemote =>
      'Su internet, quindi di solito si aggiunge in Connessioni. Aggiungilo qui solo se può raggiungerlo solo questo computer.';

  @override
  String get mcpQuestionDecline => 'Rifiuta';

  @override
  String get mcpQuestionSend => 'Invia';

  @override
  String get cardMcpQuestion => 'Domanda';

  @override
  String get cardMcpSignIn => 'Accesso';

  @override
  String get mcpSignInHereHelp =>
      'Accedi così i tuoi bot possano usarlo di nuovo.';

  @override
  String localMcpSignedIn(String name) {
    return 'Accesso effettuato a $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'Da $source';
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
      other: 'Aggiungi $nString server',
      one: 'Aggiungi 1 server',
      zero: 'Aggiungi',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (conservato su questo computer)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name richiede il tuo accesso';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Apri Casama su $device ed effettua l\'accesso lì.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Apri Casama sul computer su cui è in esecuzione questo strumento e accedi da lì.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection chiede';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return 'Risposta inviata a $connection';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Domanda di $connection rifiutata';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Domanda di $connection chiusa';
  }

  @override
  String get codingAgentsNone =>
      'Nessun agente di coding trovato. Installa Claude Code, Codex o l\'agente da riga di comando di Cursor per affidargli attività di coding.';

  @override
  String get codingAgentsNeedShell =>
      'Gli agenti di coding funzionano tramite comandi, quindi richiedono che Esegui comandi sia attivo.';

  @override
  String get allowCommands => 'Attiva';

  @override
  String get codingAgentAllow => 'Consenti';

  @override
  String get codingAgentAllowed => 'Consentito';

  @override
  String get codingAgentsAllowHelp =>
      'Un agente con accanto “Consenti” non è ancora stato eseguito su questo computer. Consentilo una volta e i bot potranno affidargli attività.';

  @override
  String get ownAgentsAdd => 'Aggiungi il tuo';

  @override
  String get ownAgentYours => 'Tuo';

  @override
  String get ownAgentNotFound => 'Non trovato su questo computer';

  @override
  String get ownAgentsHelp =>
      'I tuoi agenti girano solo su questo computer, nelle chat che agiscono per te. Nessun altro nello spazio di lavoro può vederli o modificarli.';

  @override
  String get ownAgentFormTitle => 'Aggiungi il tuo agente';

  @override
  String get ownAgentEditTitle => 'Modifica il tuo agente';

  @override
  String get ownAgentName => 'Nome';

  @override
  String get ownAgentBin => 'Nome comando';

  @override
  String get ownAgentCommand => 'Comando';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Metti $task dove va l\'attività; Casama lo racchiude tra virgolette. Ogni comando inizia con il nome del comando. Puoi anche usare $folder, e $result_file quando l\'agente scrive la risposta su un file.';
  }

  @override
  String get ownAgentResult => 'Lettura della risposta';

  @override
  String get ownAgentResultTail => 'La fine del suo output';

  @override
  String get ownAgentResultJson => 'Una riga JSON con un campo result';

  @override
  String get ownAgentResultStream => 'Uno stream di righe JSON';

  @override
  String get ownAgentResultField => 'Un campo JSON';

  @override
  String get ownAgentResultFile => 'Scritta su un file';

  @override
  String get ownAgentResultFieldName => 'Nome campo';

  @override
  String get ownAgentTimeLimit => 'Limite di tempo (minuti)';

  @override
  String get ownAgentTest => 'Testa';

  @override
  String get ownAgentTestHelp =>
      'Il test gli chiede di rispondere solo con la parola pong su questo computer e mostra cosa ha stampato.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Ha risposto: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Non ha risposto come previsto (uscita $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Non ha finito in tempo.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Inserisci un nome, un nome comando e un comando con $task.';
  }

  @override
  String get board => 'Bacheca';

  @override
  String get newTicket => 'Nuovo ticket';

  @override
  String get newTicketSubtitle =>
      'Un\'attività per uno dei tuoi bot, tracciata sulla bacheca.';

  @override
  String get allProjects => 'Tutti i progetti';

  @override
  String get manageProjects => 'Gestisci progetti';

  @override
  String get filterByProject => 'Filtra per progetto';

  @override
  String get moveTo => 'Sposta in';

  @override
  String get noMatchingTickets => 'Nessun ticket corrispondente';

  @override
  String get noMatchingTicketsHelp =>
      'Nessun ticket corrisponde a questi filtri.';

  @override
  String get clearFilters => 'Cancella filtri';

  @override
  String get ticketTitle => 'Titolo';

  @override
  String get ticketDetails => 'Dettagli';

  @override
  String get taskInReview => 'In revisione';

  @override
  String get priority => 'Priorità';

  @override
  String get priorityUrgent => 'Urgente';

  @override
  String get priorityHigh => 'Alta';

  @override
  String get priorityMedium => 'Media';

  @override
  String get priorityLow => 'Bassa';

  @override
  String get priorityNone => 'Nessuna priorità';

  @override
  String get filterAll => 'Tutto';

  @override
  String get filterMine => 'Le mie';

  @override
  String get filterBots => 'Bot';

  @override
  String get assignee => 'Assegnato a';

  @override
  String get unassigned => 'Non assegnato';

  @override
  String get assignToMe => 'Io';

  @override
  String get reviewRequired => 'Richiede revisione';

  @override
  String get reviewRequiredHelp =>
      'Il bot termina in revisione invece che in completato.';

  @override
  String get comments => 'Commenti';

  @override
  String get addComment => 'Aggiungi un commento';

  @override
  String get sendComment => 'Invia';

  @override
  String get openThread => 'Apri la conversazione del bot';

  @override
  String get deleteTicket => 'Elimina ticket';

  @override
  String get ticketResult => 'Risultato';

  @override
  String get noCommentsYet =>
      'Ancora nessun commento. Lascia una nota per il bot o per il tuo team.';

  @override
  String get noTickets => 'Dai qualcosa da fare ai tuoi bot';

  @override
  String get noTicketsHelp =>
      'Affida un singolo lavoro o un intero obiettivo. Puoi seguirne i progressi da qui.';

  @override
  String get tasksStartTicket => 'Aggiungi un ticket';

  @override
  String get tasksStartTicketHelp =>
      'Un singolo lavoro. Assegnalo a un bot e parte.';

  @override
  String get tasksStartProject => 'Avvia un progetto';

  @override
  String get tasksStartProjectHelp =>
      'Un obiettivo più grande. Un bot lo pianifica in ticket e attende il tuo OK.';

  @override
  String get tasksExamples => 'Oppure inizia da uno di questi';

  @override
  String get tasksExampleResearch =>
      'Fai una ricerca sui miei tre principali concorrenti';

  @override
  String get tasksExampleDraft => 'Prepara la bozza di un annuncio di lancio';

  @override
  String get tasksExampleTidy => 'Metti in ordine i miei file';

  @override
  String get ticketStatus => 'Stato';

  @override
  String get spaces => 'Spazi di lavoro';

  @override
  String get newWorkspace => 'Nuovo spazio di lavoro';

  @override
  String get newWorkspaceSubtitle =>
      'Uno spazio separato per un team, con i propri bot, chat e persone.';

  @override
  String get joinWorkspaceHelp =>
      'Incolla il link di invito che qualcuno ti ha inviato.';

  @override
  String get inviteLinkField => 'Link di invito';

  @override
  String get workspaceIcon => 'Icona';

  @override
  String get workspaceColor => 'Colore';

  @override
  String get workspaceSettings => 'Impostazioni spazio di lavoro';

  @override
  String get workspaceSettingsHelp => 'Nome, icona, colore e link di invito';

  @override
  String get inviteLinks => 'Link di invito';

  @override
  String get inviteLinksHelp =>
      'Chiunque abbia un link può iscriversi dopo l\'accesso, finché non scade, non esaurisce gli utilizzi o non lo revochi.';

  @override
  String get createInviteLink => 'Crea un link';

  @override
  String get linkExpires => 'Scade';

  @override
  String get linkNever => 'Mai';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Tra $daysString giorni',
      one: 'Tra 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Utilizzi';

  @override
  String get linkUnlimited => 'Illimitati';

  @override
  String linkUses(String uses) {
    return '$uses usati';
  }

  @override
  String get linkRevoked => 'Revocato';

  @override
  String get revokeLink => 'Revoca';

  @override
  String get linkCopied => 'Link di invito copiato.';

  @override
  String get inviteRole => 'Ruolo';

  @override
  String get shareLinkLabel => 'Condividi';

  @override
  String get botFolder => 'Cartella';

  @override
  String get noFolder => 'Nessuna cartella';

  @override
  String get newFolder => 'Nuova cartella…';

  @override
  String get folderName => 'Nome cartella';

  @override
  String get archiveBot => 'Archivia bot';

  @override
  String archiveBotTitle(String name) {
    return 'Archiviare $name?';
  }

  @override
  String get archiveBotBody =>
      'Esce dalla barra laterale e smette di funzionare. Le sue chat e la sua cronologia restano, e puoi recuperarlo da Bot archiviati.';

  @override
  String get archive => 'Archivia';

  @override
  String get archivedBots => 'Bot archiviati';

  @override
  String get unarchive => 'Ripristina';

  @override
  String botArchived(String name) {
    return '$name archiviato.';
  }

  @override
  String get deleteBot => 'Elimina bot';

  @override
  String deleteBotTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String deleteBotBody(String name) {
    return 'Ogni chat con $name viene eliminata per sempre, con i suoi messaggi, foto e file, e $name smette di funzionare ed esce dalla barra laterale. Le chat di gruppo e i registri di utilizzo restano. Le sue impostazioni e la sua memoria passano in Bot archiviati.';
  }

  @override
  String botDeleted(String name) {
    return '$name eliminato.';
  }

  @override
  String get settingsHistory => 'Cronologia impostazioni';

  @override
  String get settingsHistoryHelp =>
      'Ogni modifica alle impostazioni di questo bot e chi l\'ha fatta';

  @override
  String get noHistory => 'Ancora nessuna modifica.';

  @override
  String get restoreSettings => 'Ripristina queste impostazioni';

  @override
  String restoreSettingsBody(String fields) {
    return 'Ripristinare $fields com\'erano prima di questa modifica? Le impostazioni attuali restano nella cronologia.';
  }

  @override
  String changedByBot(String name) {
    return 'Modificato da $name';
  }

  @override
  String get changedByPerson => 'Modificato da una persona';

  @override
  String get changedBySystem => 'Modificato da Casama';

  @override
  String get fieldName => 'nome';

  @override
  String get fieldInstructions => 'istruzioni';

  @override
  String get fieldModel => 'modello';

  @override
  String get fieldAutonomy => 'autonomia';

  @override
  String get fieldBudget => 'budget';

  @override
  String get fieldComputer => 'computer';

  @override
  String get fieldArchived => 'archiviato';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot ha bisogno di una chiave $service';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Solo per $hosts';
  }

  @override
  String get secretRequestHelp =>
      'Va direttamente nel caveau. Il bot non la vede mai.';

  @override
  String secretSaved(String name) {
    return 'Salvato $name';
  }

  @override
  String get secretDeclined => 'Rifiutato';

  @override
  String secretWhat(String service) {
    return 'Chiave $service';
  }

  @override
  String totpWhat(String service) {
    return 'Codice di accesso $service';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Controllo restituito: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Accesso condiviso per $host';
  }

  @override
  String get shareLogin => 'Condividi accesso';

  @override
  String get shareLoginUsername => 'Email o nome utente';

  @override
  String get shareLoginPassword => 'Password';

  @override
  String get shareLoginRemember => 'Ricorda per la prossima volta';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Usato solo su $host. $bot non vede mai la tua password.';
  }

  @override
  String get shareLoginSave => 'Salva e accedi';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot richiede che tu acceda a $host';
  }

  @override
  String get signInOnPage => 'Accedi sulla pagina';

  @override
  String loginOnPageLine(String host) {
    return 'Accesso a $host sulla pagina';
  }

  @override
  String get loginOnPageHelp =>
      'Accedi sulla pagina, poi tocca Restituisci il controllo.';

  @override
  String get back => 'Indietro';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Non condiviso: il tuo calendario',
      'reminders': 'Non condivisi: i tuoi promemoria',
      'contacts': 'Non condivisi: i tuoi contatti',
      'places': 'Non condivisi: i tuoi luoghi',
      'photos': 'Non condivise: le tue foto',
      'health': 'Non condivisi: i tuoi dati Salute',
      'notifications': 'Non condivise: le tue notifiche',
      'activity': 'Non condivisa: la tua attività sul computer',
      'browserTab': 'Non condivisa: la scheda attuale del browser',
      'browserHistory': 'Non condivisi: cronologia e segnalibri del browser',
      'alarm': 'Non condivise: le tue sveglie',
      'home': 'Non condivisi: i tuoi accessori di Casa',
      'other': 'Non condivisi: i dati del tuo dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Rifiuta';

  @override
  String get signInCode => 'Codice di accesso';

  @override
  String get secretKindValue => 'Chiave o password';

  @override
  String get totpSeedLabel =>
      'Chiave di configurazione, link otpauth:// o il codice che vedi ora';

  @override
  String get totpSeedHelp =>
      'Una chiave di configurazione dell\'accesso in due passaggi del sito permette al bot di generare ogni codice successivo (senza mai vedere la chiave). Oppure scrivi il codice che vedi ora: va direttamente al bot.';

  @override
  String get scanQrCode => 'Scansiona codice QR';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot ha bisogno di un codice di accesso per $service';
  }

  @override
  String get search => 'Cerca';

  @override
  String get searchHint => 'Cerca chat, ricordi, competenze, ticket e file';

  @override
  String get searchEmptyPrompt => 'Digita almeno 2 caratteri.';

  @override
  String searchNoResults(String query) {
    return 'Nessun risultato per “$query”.';
  }

  @override
  String get searchMessages => 'Messaggi';

  @override
  String get searchChats => 'Chat';

  @override
  String get searchTickets => 'Ticket';

  @override
  String get searchFiles => 'File';

  @override
  String get searchFilesAsleep =>
      'I file sui computer in sospensione non vengono cercati. Avvia un computer per includere i suoi file.';

  @override
  String get searchSearching => 'Ricerca in corso…';

  @override
  String get searchJumpHint => 'Cerca o vai a…';

  @override
  String get searchRecent => 'Recenti';

  @override
  String get searchClearRecent => 'Cancella';

  @override
  String get searchRemoveRecent => 'Rimuovi dalle ricerche recenti';

  @override
  String get searchJumpBackIn => 'Riprendi da dove eri';

  @override
  String get searchNeedsYou => 'In attesa';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cose ti aspettano',
      one: '1 cosa ti aspetta',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Vai a';

  @override
  String get searchTopHits => 'Risultati migliori';

  @override
  String get searchScopeAll => 'Tutto';

  @override
  String get searchMemories => 'Ricordi';

  @override
  String get searchKeepTyping =>
      'Continua a scrivere per cercare messaggi, ricordi e file.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Chiedi a $bot di “$query”';
  }

  @override
  String get searchAskBotHelp => 'Avvia una nuova chat con questa domanda';

  @override
  String get searchKeysHint =>
      '↑ ↓ per spostarti   ↵ per aprire   esc per chiudere';

  @override
  String get searchClear => 'Cancella ricerca';

  @override
  String get installFor => 'Installa per';

  @override
  String get wholeWorkspace => 'Tutto lo spazio di lavoro';

  @override
  String get skillCatalog => 'Catalogo competenze';

  @override
  String get searchSkills => 'Cerca competenze';

  @override
  String get all => 'Tutte';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Installa';

  @override
  String skillInstalled(String name) {
    return '$name installata.';
  }

  @override
  String get noResults => 'Nessun risultato.';

  @override
  String get importFromGitHub => 'Importa da GitHub';

  @override
  String get importFromGitHubHelp =>
      'Incolla un link a una cartella con un file SKILL.md. Vedrai ogni file prima che venga installato nulla. I repository privati usano un segreto GITHUB_TOKEN consentito per api.github.com.';

  @override
  String get preview => 'Anteprima';

  @override
  String get skillScriptsNote =>
      'Gli script di una competenza vengono eseguiti solo sul computer di un bot, mai sul server.';

  @override
  String get binaryFile => '(file binario)';

  @override
  String skillUpdate(String name) {
    return 'Aggiorna $name';
  }

  @override
  String get checkingForUpdates => 'Ricerca aggiornamenti…';

  @override
  String get skillUpToDate => 'Già aggiornata.';

  @override
  String get update => 'Aggiorna';

  @override
  String get filesAdded => 'Aggiunti';

  @override
  String get filesChanged => 'Modificati';

  @override
  String get filesRemoved => 'Rimossi';

  @override
  String get fromCatalog => 'Dal catalogo';

  @override
  String get savedByBot => 'Salvata da un bot';

  @override
  String get checkForUpdates => 'Cerca aggiornamenti';

  @override
  String get attachSkill => 'Allega una competenza';

  @override
  String get rerunSetup => 'Ripeti la configurazione';

  @override
  String get rerunSetupHelp =>
      'Rispondi di nuovo alle domande di configurazione ed esamina una nuova proposta';

  @override
  String get trace => 'Traccia';

  @override
  String get openTrace => 'Apri traccia';

  @override
  String get editMessage => 'Modifica';

  @override
  String get editMessageHelp =>
      'Inviando riesegui la conversazione da qui. La versione originale resta; scorri con le frecce.';

  @override
  String get previousVersion => 'Versione precedente';

  @override
  String get nextVersion => 'Versione successiva';

  @override
  String get quietHours => 'Ore di quiete';

  @override
  String get quietHoursHelp =>
      'Le notifiche attendono la fine delle ore di quiete; la sezione In arrivo continua a riempirsi. Le approvazioni per una chat in cui ti trovi arrivano comunque.';

  @override
  String quietHoursRange(String start, String end) {
    return 'dalle $start alle $end';
  }

  @override
  String get off => 'Disattivate';

  @override
  String get botNotifications => 'Notifiche da questo bot';

  @override
  String get botNotificationsHelp => 'Se questo bot segue le tue ore di quiete';

  @override
  String get botMayCall => 'Può chiamarmi';

  @override
  String get botMayCallHelp =>
      'Questo bot può telefonarti quando qualcosa merita una chiamata. Disattivato: invia invece una notifica.';

  @override
  String get quietDefault => 'Segui le mie ore di quiete';

  @override
  String get quietAlways => 'Avvisami sempre';

  @override
  String get quietCustom => 'Ore di quiete proprie';

  @override
  String get from => 'Da';

  @override
  String get until => 'Fino a';

  @override
  String get shareAsTemplate => 'Condividi come modello';

  @override
  String get shareAsTemplateRow =>
      'Un file o link con le sue istruzioni, competenze e routine';

  @override
  String get shareAsTemplateHelp =>
      'Include istruzioni, competenze, routine e i servizi che usa. Mai chiavi o segreti.';

  @override
  String get copyLink => 'Copia link';

  @override
  String get includeMemories => 'Includi ricordi';

  @override
  String get includeMemoriesHelp =>
      'Ciò che ha imparato su di te. Condividi con cautela.';

  @override
  String get saveAsFile => 'Salva come file';

  @override
  String get notABotTemplate => 'Questo file non è un modello di bot Casama.';

  @override
  String get importBot => 'Importa un bot';

  @override
  String botImported(String name) {
    return '$name è pronto.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name è pronto. Collega $services in Integrazioni perché possa usarli.';
  }

  @override
  String get whatComesWithIt => 'Cosa include';

  @override
  String get connectAfterImport => 'Collega dopo l\'importazione';

  @override
  String get importRoutines => 'Pianifica le sue routine';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mantieni i suoi $countString ricordi',
      one: 'Mantieni il suo ricordo',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Avvio della routine…';

  @override
  String get offlineSaved => 'Offline. Mostra i messaggi salvati.';

  @override
  String get loadEarlierMessages => 'Messaggi precedenti';

  @override
  String get chatLoadFailedTitle => 'Impossibile caricare questa chat';

  @override
  String get chatLoadFailedBody => 'Controlla la connessione, poi riprova.';

  @override
  String get projects => 'Progetti';

  @override
  String get newProject => 'Nuovo progetto';

  @override
  String get noProjects => 'Ancora nessun progetto';

  @override
  String get projectsHelp =>
      'Un progetto tiene insieme un lavoro: la sua chat, il piano, le cose da fare, i file e tutto ciò che è stato creato per esso. Lavoraci con un bot oppure lascia che il bot lo pianifichi e ci lavori da solo.';

  @override
  String get newProjectHelp =>
      'Tiene insieme un lavoro: la sua chat, il piano, le cose da fare, i file e tutto ciò che è stato creato per esso.';

  @override
  String get startPlanning => 'Inizia pianificazione';

  @override
  String get projectTitle => 'Titolo';

  @override
  String get projectGoal => 'Obiettivo';

  @override
  String get projectDoneWhen => 'Completato quando';

  @override
  String get projectLead => 'Bot principale';

  @override
  String get projectBudget => 'Budget';

  @override
  String get projectGoalHint =>
      'Cosa deve esistere alla fine? Una landing page online sul mio dominio…';

  @override
  String get projectDoneHint => 'Facoltativo. Come saprai che è finito';

  @override
  String get projectBudgetHint =>
      'Facoltativo. Il lavoro si ferma quando viene speso';

  @override
  String get projectThread => 'Chat del progetto';

  @override
  String get approvePlan => 'Approva il piano';

  @override
  String get pause => 'Metti in pausa';

  @override
  String get resume => 'Riprendi';

  @override
  String get milestones => 'Traguardi';

  @override
  String get needsSignoff => 'richiede la tua conferma finale';

  @override
  String get signOff => 'Approva';

  @override
  String get projectPlan => 'Piano';

  @override
  String get tickets => 'Ticket';

  @override
  String get projectTimeline => 'Cronologia';

  @override
  String get projectPlanning => 'Pianificazione';

  @override
  String get projectActive => 'Attivo';

  @override
  String get projectPaused => 'In pausa';

  @override
  String get projectBlocked => 'Bloccato';

  @override
  String get projectDone => 'Completato';

  @override
  String get projectCancelled => 'Annullato';

  @override
  String get projectName => 'Nome';

  @override
  String get projectNameHint => 'Space Dodger, newsletter di primavera…';

  @override
  String get createProject => 'Crea progetto';

  @override
  String projectWorksAlone(String bot) {
    return 'Lascia che $bot ci lavori da solo';
  }

  @override
  String get projectWorksAloneHelp =>
      'Prepara una bozza di piano da farti approvare, poi lavora in sessioni fino al raggiungimento dell\'obiettivo. Nulla parte prima che tu approvi.';

  @override
  String get projectWorksAloneOn =>
      'Lavora in sessioni fino al raggiungimento dell\'obiettivo.';

  @override
  String get projectWorksAloneOff => 'Ci lavorate insieme nella sua chat.';

  @override
  String get projectMade => 'Creato in questo progetto';

  @override
  String projectMadeEmpty(String bot) {
    return 'Ancora nulla. Ciò che $bot crea nella chat di questo progetto compare qui.';
  }

  @override
  String get projectSeeAll => 'Vedi tutto';

  @override
  String get projectTodos => 'Da fare';

  @override
  String get projectFiles => 'File';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder sul computer di $bot';
  }

  @override
  String get projectMarkDone => 'Segna come completato';

  @override
  String get projectReopen => 'Riapri';

  @override
  String get projectCover => 'Copertina';

  @override
  String get projectCoverNone => 'Nessuna';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Barca a vela',
      'mountain': 'Montagna',
      'seedling': 'Germoglio',
      'compass': 'Bussola',
      'lantern': 'Lanterna',
      'telescope': 'Telescopio',
      'map': 'Mappa',
      'chess': 'Scacchi',
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
      other: '$countString elementi',
      one: '1 elemento',
      zero: 'Ancora nulla',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Progetto';

  @override
  String get creationMoveToProject => 'Sposta nel progetto';

  @override
  String get creationNoProject => 'Nessun progetto';

  @override
  String get makeProject => 'Trasforma in progetto';

  @override
  String get makeProjectTitle => 'Trasforma questo argomento in un progetto';

  @override
  String makeProjectHelp(String bot) {
    return 'Ciò che $bot ha creato in questo argomento viene archiviato nel progetto, così come ciò che creerà qui in seguito.';
  }

  @override
  String get openProject => 'Apri progetto';

  @override
  String get theBot => 'il bot';

  @override
  String get forYou => 'Per te';

  @override
  String get inboxNeedsYou => 'In attesa';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'In attesa ($nString)';
  }

  @override
  String get inboxBriefs => 'Riepiloghi';

  @override
  String get inboxUpdates => 'Aggiornamenti';

  @override
  String get inboxEmptyHelp =>
      'Richieste, riepiloghi mattutini, notifiche e nuove pagine dei tuoi bot compaiono qui.';

  @override
  String get inboxNeedsYouEmpty => 'Nulla ti aspetta al momento';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Quando un bot ha bisogno di una decisione, del tuo aiuto o ha un\'idea, compare qui.';

  @override
  String get noBriefs => 'Ancora nessun riepilogo mattutino';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot ha pubblicato $title';
  }

  @override
  String get forYouEmpty => 'Nulla per te al momento';

  @override
  String get forYouEmptyHelp =>
      'Attiva gli aggiornamenti nelle impostazioni di un bot per ricevere un riepilogo mattutino e suggerimenti durante il giorno.';

  @override
  String morningBriefFrom(String name) {
    return 'Riepilogo mattutino da $name';
  }

  @override
  String get suggestions => 'Suggerimenti';

  @override
  String suggestedBy(String name) {
    return 'Suggerito da $name';
  }

  @override
  String get dismissSuggestion => 'Ignorare questo suggerimento?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Scegli se $bot può riproporlo.';
  }

  @override
  String get justThisOnce => 'Solo questa volta';

  @override
  String justThisOnceHelp(String bot) {
    return 'Nascondilo per ora. Se dovesse servire più avanti, $bot potrebbe suggerirlo di nuovo.';
  }

  @override
  String get dontSuggestAgain => 'Non suggerirlo più';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Sparito per sempre. $bot ricorderà che preferisci di no.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Capito. $bot non te lo suggerirà più.';
  }

  @override
  String get doIt => 'Fallo';

  @override
  String get checkins => 'Aggiornamenti';

  @override
  String get checkinsHelp =>
      'Un riepilogo mattutino e un controllo ogni poche ore per le cose che richiedono attenzione. Disattivato per impostazione predefinita.';

  @override
  String get briefTime => 'Riepilogo mattutino alle';

  @override
  String get scanEvery => 'Controlla ogni';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ore',
      one: '1 ora',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Limite giornaliero';

  @override
  String get on => 'Attivo';

  @override
  String get actionRules => 'Regole d\'azione';

  @override
  String get actionRulesRow => 'Cosa può fare senza chiedere';

  @override
  String get actionRulesHelp =>
      'Le regole decidono per ogni azione: consentire, consentire entro limiti, Chiedi prima oppure passarla a te per completarla. Vince la regola più specifica; senza regole, decide l\'autonomia del bot. I bot non possono cambiare le proprie regole.';

  @override
  String get addRule => 'Aggiungi una regola';

  @override
  String get addRuleHelp =>
      'Scegli cosa sta facendo il bot e come deve gestirlo.';

  @override
  String get noRules =>
      'Nessuna regola. Decide il livello di autonomia del bot.';

  @override
  String get otherTools => 'Strumenti specifici';

  @override
  String get workspaceRule => 'Regola spazio di lavoro';

  @override
  String get catSend => 'Invio di messaggi';

  @override
  String get catPay => 'Pagamenti';

  @override
  String get catDelete => 'Eliminazione';

  @override
  String get catPublish => 'Pubblicazione';

  @override
  String get catShare => 'Condivisione e inviti';

  @override
  String get catSignIn => 'Accesso';

  @override
  String get whenTheBot => 'Azione del bot';

  @override
  String get itShould => 'Il bot dovrebbe';

  @override
  String get ruleAllow => 'Procedere';

  @override
  String get ruleAllowLimits => 'Procedere entro i limiti';

  @override
  String get ruleAsk => 'Chiedimi prima';

  @override
  String get ruleHandOff => 'Passarmelo per completarlo';

  @override
  String get ruleDomains => 'Solo verso questi domini (separati da virgola)';

  @override
  String get ruleMaxAmount => 'Fino a questo importo';

  @override
  String get ruleForWorkspace => 'Per ogni bot nello spazio di lavoro';

  @override
  String get watchers => 'Monitoraggi';

  @override
  String get watchersRow => 'Cosa sta tenendo d\'occhio';

  @override
  String get noWatchers => 'Non sta monitorando nulla';

  @override
  String get watchersHelp =>
      'Chiedi al bot “avvisami quando…” e terrà d\'occhio una pagina, una risposta, un risultato o un orario. I controlli non costano nulla finché non cambia qualcosa.';

  @override
  String get watcherActive => 'Monitoraggio attivo';

  @override
  String get watcherPaused => 'In pausa';

  @override
  String get watcherDone => 'Completato';

  @override
  String get watcherExpired => 'Scaduto';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'attivato $countString volte',
      one: 'attivato una volta',
      zero: 'non ancora attivato',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Collega un\'app IA';

  @override
  String connectAiAppAsk(String app) {
    return '$app vuole usare Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'Può elencare i tuoi bot, chiedere loro di fare cose e leggere i risultati nello spazio di lavoro che scegli, come te. Le approvazioni e le regole dei tuoi bot restano valide.';

  @override
  String get connectAiAppSendsTo => 'Dopo aver consentito, torni a';

  @override
  String get connectAiAppUnknown =>
      'Casama non riconosce questo indirizzo. Chiunque può dare a un\'app qualsiasi nome, quindi consenti solo se hai avviato tu questa connessione e ti fidi di questo sito.';

  @override
  String get connectAiAppDone => 'Fatto. Puoi tornare all\'app IA.';

  @override
  String get refuse => 'Rifiuta';

  @override
  String get allow => 'Consenti';

  @override
  String get connectAiApps => 'Collega app IA';

  @override
  String get connectAiAppsHelp =>
      'Le app che supportano MCP si collegano a questo indirizzo ed effettuano l\'accesso, oppure usano una chiave API. Agiscono come la persona che le ha collegate.';

  @override
  String get connectedAiApps => 'App IA collegate';

  @override
  String get connectedAiAppsHelp =>
      'App che hai collegato effettuando l\'accesso. Scollegandone una perde subito l\'accesso a questo spazio di lavoro.';

  @override
  String get connectedAiAppsAdminHelp =>
      'App che le persone in questo spazio di lavoro hanno collegato effettuando l\'accesso. Scollegandone una perde subito l\'accesso.';

  @override
  String get noConnectedAiApps => 'Nessuna app IA collegata.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Usata $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Collegata $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Smette subito di funzionare in questo spazio di lavoro. Per usarla di nuovo, collegala nuovamente dall\'app.';

  @override
  String get mcpApprovals => 'Consenti approvazioni dalle app IA';

  @override
  String get mcpApprovalsHelp =>
      'Le app delle connessioni possono approvare le azioni dei tuoi bot.';

  @override
  String get newApiKey => 'Nuova chiave API';

  @override
  String get apiKeyName => 'Nome';

  @override
  String get newGroupChat => 'Nuova chat di gruppo';

  @override
  String get groupChats => 'Chat di gruppo';

  @override
  String groupWhoAnswers(String names) {
    return '$names risponderanno';
  }

  @override
  String get groupEveryoneAnswers => 'Tutti risponderanno';

  @override
  String get groupMentionHint => '@menziona un bot, o @everyone';

  @override
  String routineRan(String name) {
    return 'Routine “$name” eseguita';
  }

  @override
  String groupBotCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot',
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
      other: '$countString cose ti aspettano',
      one: '1 cosa ti aspetta',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Riunisci da 2 a 10 bot in una chat. @Nome interpella un bot; @everyone chiede al bot principale di pianificare e dividere il lavoro.';

  @override
  String get groupCreate => 'Crea chat di gruppo';

  @override
  String get groupCrewEmpty => 'Scegli i bot qui sotto per formare il gruppo.';

  @override
  String get groupLeadShort => 'Principale';

  @override
  String get groupMakeLead => 'Rendi principale';

  @override
  String groupRemoveBot(String name) {
    return 'Rimuovi $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Scegli altri $count bot',
      one: 'Scegli 1 altro bot',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Sono 10 bot, il massimo per un gruppo.';

  @override
  String get groupLeadHint =>
      'Il bot principale pianifica il lavoro quando scrivi @everyone. Tocca un altro bot in alto per renderlo principale.';

  @override
  String groupLeadIs(String name) {
    return '$name guida il gruppo: pianifica il lavoro quando scrivi @everyone. Tocca un altro bot in alto per renderlo principale.';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return 'Scegli 1 altro bot. $name guida il gruppo; tocca un altro bot in alto per renderlo principale.';
  }

  @override
  String get groupNeedTwoBots =>
      'Una chat di gruppo richiede almeno due bot. Crea prima un altro bot.';

  @override
  String get groupSearchBots => 'Cerca bot';

  @override
  String get groupNoMatch => 'Nessun bot corrisponde a quel nome.';

  @override
  String get groupTitle => 'Nome (facoltativo)';

  @override
  String get groupPickBots => 'Bot';

  @override
  String get groupLead => 'Guida il gruppo';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Pagine';

  @override
  String get pagesRow => 'Report e dashboard pubblicati';

  @override
  String get noPages => 'Nessuna pagina';

  @override
  String get pagesHelp =>
      'Chiedi a un bot un report, una dashboard o una tabella di monitoraggio e può pubblicarlo come pagina. Le pagine si aprono nel browser e restano private finché non le condividi.';

  @override
  String get pagePrivate => 'Solo io';

  @override
  String get pageWorkspace => 'Spazio di lavoro';

  @override
  String get pagePublic => 'Chiunque abbia il link';

  @override
  String get pageRefreshes => 'Si aggiorna su pianificazione';

  @override
  String get pageCardOpen => 'Pagina · Tocca per aprire';

  @override
  String get exportPdf => 'Esporta PDF';

  @override
  String get pageMakePublicTitle => 'Rendere pubblica questa pagina?';

  @override
  String get pageMakePublicBody =>
      'Chiunque abbia il link può aprirla e vedere i dati che contiene. Puoi revocare l’accesso quando vuoi; il link smetterà di funzionare.';

  @override
  String get pageMakePublic => 'Rendi pubblica';

  @override
  String get pagePublicLinkTitle => 'Link pubblico';

  @override
  String get pagePublicLinkBody =>
      'Copiato. Non viene indicizzato nei motori di ricerca.';

  @override
  String deletePageTitle(String title) {
    return 'Eliminare “$title”?';
  }

  @override
  String get openPages => 'Apri in Pagine';

  @override
  String get discard => 'Scarta';

  @override
  String get discardChangesTitle => 'Scartare le modifiche?';

  @override
  String get discardChangesBody => 'Le tue modifiche non sono state salvate.';

  @override
  String get keepEditing => 'Continua a modificare';

  @override
  String get teachTask => 'Insegna un\'attività';

  @override
  String get teachWhichBot => 'Quale bot deve impararla?';

  @override
  String get teachRecording => 'Registrazione';

  @override
  String get teachRecordingPaused => 'Registrazione fermata';

  @override
  String get teachRecordingHelp =>
      'Esegui l\'attività come fai di solito. Ogni passaggio viene salvato con ciò che c\'è sullo schermo; i campi password non vengono mai salvati.';

  @override
  String get teachStop => 'Ferma';

  @override
  String get teachMarkSecret => 'Segna come segreto';

  @override
  String get teachMarkSecretHelp =>
      'Ciò che hai appena scritto viene eliminato dalla registrazione e diventa un dato segreto che il bot chiede.';

  @override
  String get teachDraftTitle => 'Nuova competenza';

  @override
  String get teachDrafting => 'Scrittura competenza dalla tua registrazione…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString passaggi',
      one: '1 passaggio',
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
      other: '$countString passaggi',
      one: '1 passaggio',
    );
    return 'Cosa hai mostrato ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Controlla i passaggi, gli input e le verifiche di riuscita, poi salva. Puoi provarla subito.';

  @override
  String get teachDraftFailed =>
      'Il bot non è riuscito a scrivere una bozza. Scrivi i passaggi tu stesso dalla registrazione qui sotto oppure scartala.';

  @override
  String get teachAlreadySaved => 'Questa competenza è salvata';

  @override
  String get teachSaveAndTry => 'Salva e prova';

  @override
  String teachSaved(String name) {
    return 'Salvata $name';
  }

  @override
  String get teachDiscardTitle => 'Scartare questa registrazione?';

  @override
  String get teachDiscardBody =>
      'Ogni passaggio, snapshot e screenshot acquisito viene eliminato.';

  @override
  String teachStepClick(int x, int y) {
    return 'Clic a $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Digita “$text”';
  }

  @override
  String teachStepSecret(String name) {
    return 'Digita segreto $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Premi $key';
  }

  @override
  String get teachStepScroll => 'Scorri';

  @override
  String get plugins => 'Plugin';

  @override
  String get pluginsRow => 'Competenze e strumenti dai pacchetti plugin';

  @override
  String get noPlugins => 'Nessun plugin';

  @override
  String get pluginsHelp =>
      'I plugin sono pacchetti Agent Plugins 1.0 su GitHub. Possono includere competenze e strumenti MCP; i loro server girano sul computer di questo bot, mai sui server di Casama.';

  @override
  String get addPlugin => 'Aggiungi un plugin';

  @override
  String get addPluginHelp =>
      'Incolla un link GitHub alla cartella del plugin. Vedrai cosa aggiunge prima che venga installato nulla.';

  @override
  String get pluginAdds => 'Aggiunge';

  @override
  String pluginStdio(String command) {
    return 'Gira sul computer del bot: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Si connette a $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Comunica con: $hosts';
  }

  @override
  String get pluginSkill => 'Competenza';

  @override
  String get pluginHosts => 'Rete';

  @override
  String get pluginServerError => 'Impossibile avviare';

  @override
  String get pluginRunsOnComputer => 'Gira sul computer del bot';

  @override
  String get pluginWhereToolsRun => 'Dove girano i suoi strumenti';

  @override
  String get pluginWhereToolsRunHelp =>
      'Sul tuo computer gli strumenti possono usare ciò che si trova lì, e puoi usarli solo tu, dalle tue chat. I server su internet non vengono toccati.';

  @override
  String get pluginPlaceBot => 'Il computer del bot';

  @override
  String pluginPlaceMine(String name) {
    return 'Il mio computer: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Gira su $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'I suoi strumenti funzionano solo nelle chat con la persona a cui appartiene il computer';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Offline: i suoi strumenti tornano a funzionare quando l\'app Casama è aperta lì';

  @override
  String get pluginUpToDate => 'Già aggiornato';

  @override
  String get checkForUpdate => 'Cerca aggiornamenti';

  @override
  String get uninstall => 'Disinstalla';

  @override
  String uninstallPluginTitle(String name) {
    return 'Disinstallare $name?';
  }

  @override
  String get uninstallPluginBody =>
      'Le sue competenze, i suoi strumenti, i suoi file e i segreti salvati vengono rimossi da questo bot.';

  @override
  String updatePluginTitle(String name) {
    return 'Aggiorna $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Nuove competenze: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Competenze modificate: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Competenze rimosse: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Nuovi server di strumenti: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Server di strumenti modificati: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Server di strumenti rimossi: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Comunica con nuovi host: $hosts';
  }

  @override
  String get pluginDiffNone => 'Nessuna modifica a ciò che aggiunge.';

  @override
  String get next => 'Avanti';

  @override
  String get botNameLabel => 'Nome';

  @override
  String get importAgent => 'Importa un agente';

  @override
  String get importAgentHelp =>
      'Porta un bot da OpenClaw o Hermes Agent, oppure incolla una configurazione da Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark o Instinct: la sua personalità, competenze, pianificazioni e ricordi. Controllerai tutto prima che venga creato. Chiavi e file di impostazioni non vengono mai letti.';

  @override
  String get importAgentPickFolder => 'Scegli la sua cartella';

  @override
  String get importAgentPickZip => 'Carica uno ZIP della sua cartella';

  @override
  String get importPasteChoice => 'Incolla la configurazione di un bot';

  @override
  String get importPasteChoiceHelp =>
      'Da Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct o un\'altra app';

  @override
  String get importPasteTitle => 'Incolla la configurazione di un bot';

  @override
  String get importPasteHelp =>
      'Invia al tuo bot il prompt qui sotto, poi incolla tutta la sua risposta. Controllerai tutto prima che il nuovo bot venga creato.';

  @override
  String get importPasteSource => 'Dov\'è il tuo bot adesso?';

  @override
  String get importPasteOther => 'Altrove';

  @override
  String get importPasteStep1 => '1. Invia questo prompt al tuo bot';

  @override
  String get importPasteReply => '2. Incolla la sua risposta';

  @override
  String get importPasteSafety =>
      'Le righe che sembrano chiavi, password o numeri di carta vengono rimosse. Accedi di nuovo alle sue app dopo l\'importazione.';

  @override
  String get importPasteSubtitle => 'Configurazione incollata';

  @override
  String get agentImportReviewHelp =>
      'Deseleziona tutto ciò che non vuoi. Nulla viene creato finché non importi.';

  @override
  String get agentImportNoPersona => 'Nessun file di personalità trovato.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString competenze',
      one: '1 competenza',
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
      other: '$countString routine',
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
      other: '$countString ricordi',
      one: '1 ricordo',
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
      other: '$countString altri file',
      one: '1 altro file',
    );
    return 'Copia $_temp0 in ~/imported/ sul suo computer';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Non importati: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Importato $name e copiati $countString file sul suo computer';
  }

  @override
  String agentImportedFilesLater(String name) {
    return 'Importato $name. Non è stato ancora possibile copiare gli altri suoi file; dagli un computer e importa di nuovo per copiarli.';
  }

  @override
  String get importMemoryTitle => 'Importa ricordi da ChatGPT o Claude';

  @override
  String get importMemoryHelp =>
      'Copia questo prompt in ChatGPT o Claude, poi incolla qui sotto la risposta.';

  @override
  String get importMemoryPick =>
      'Tieni ciò che è corretto; deseleziona il resto.';

  @override
  String get importMemoryPaste => 'La sua risposta';

  @override
  String get importMemoryNone => 'Nessun ricordo trovato in quella risposta.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aggiunti $countString ricordi',
      one: 'Aggiunto 1 ricordo',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Routine e competenze come file';

  @override
  String get routinesAsFilesHelp =>
      'Ogni routine e competenza come file Markdown: esportale, modificale ovunque, reimportale o tienile in un repository GitHub.';

  @override
  String get exportFiles => 'Esporta come file';

  @override
  String get importFiles => 'Importa file';

  @override
  String get importFilesApply => 'Applica';

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

    return '$createdString nuovi, $updatedString modificati, $unchangedString invariati';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Importati: $createdString nuovi, $updatedString modificati';
  }

  @override
  String get gitSync => 'Sincronizzazione Git';

  @override
  String get gitSyncOff => 'Disattivata';

  @override
  String get gitSyncHelp =>
      'Le modifiche in Casama vengono salvate con un commit nel repository e i push verso di esso aggiornano Casama dopo la verifica. Se un file è cambiato in entrambi i posti, Casama mantiene la propria versione e apre una pull request. Richiede un segreto GITHUB_TOKEN consentito per api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Richiede un segreto GITHUB_TOKEN';

  @override
  String gitSyncedWhen(String when) {
    return 'Sincronizzato: $when';
  }

  @override
  String get gitSyncPr => 'Pull request in attesa';

  @override
  String get syncNow => 'Sincronizza ora';

  @override
  String get syncQueued => 'Sincronizzazione entro un minuto';

  @override
  String get gitBranch => 'Branch';

  @override
  String get gitFolder => 'Cartella nel repository (facoltativa)';

  @override
  String get gitSyncOn => 'Sincronizzazione attiva';

  @override
  String get gitSyncRemove => 'Interrompi sincronizzazione';

  @override
  String get gitWebhookTitle => 'Aggiungi questo webhook al repository';

  @override
  String get gitWebhookHelp =>
      'Nelle impostazioni del repository, aggiungi un webhook per gli eventi push con questo indirizzo e segreto (content type application/json). Il segreto viene mostrato solo ora.';

  @override
  String get gitWebhookUrl => 'Payload URL';

  @override
  String get gitWebhookSecret => 'Segreto';

  @override
  String get knowledge => 'Conoscenza';

  @override
  String get knowledgeRow => 'Documenti che può cercare e citare';

  @override
  String get noKnowledge => 'Ancora nessuna conoscenza';

  @override
  String get knowledgeHelp =>
      'Forniscigli file, un sito web o un repository GitHub. Li consulta quando sono pertinenti e ti dice da quale documento proviene una risposta.';

  @override
  String get addKnowledge => 'Aggiungi conoscenza';

  @override
  String get addKnowledgeHelp =>
      'File PDF, Word, Markdown, HTML, CSV o di testo; un sito web (un solo dominio, rispettando il suo robots.txt); oppure i documenti di un repository. Siti web e repository si aggiornano ogni giorno.';

  @override
  String get knowledgeFiles => 'File';

  @override
  String get knowledgeWebsite => 'Sito web';

  @override
  String get knowledgePickFiles => 'Scegli file';

  @override
  String get knowledgeWebsiteUrl => 'Indirizzo sito web';

  @override
  String get knowledgeRepoUrl => 'Link GitHub';

  @override
  String get knowledgeShareAll =>
      'Condividi con ogni bot nello spazio di lavoro';

  @override
  String get knowledgeShared => 'Tutto lo spazio di lavoro';

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
      other: '$docsString documenti',
      one: '1 documento',
    );
    return '$_temp0, $chunksString passaggi';
  }

  @override
  String get knowledgeError => 'Impossibile leggerlo';

  @override
  String get knowledgeSyncing => 'Lettura…';

  @override
  String get knowledgePending => 'In attesa di lettura';

  @override
  String get add => 'Aggiungi';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot suggerisce una competenza: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot suggerisce di migliorare $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Usa: $tools';
  }

  @override
  String get saveSkill => 'Salva competenza';

  @override
  String get applyEdit => 'Applica modifica';

  @override
  String skillSaved(String name) {
    return 'Salvata $name';
  }

  @override
  String skillUpdated(String name) {
    return 'Aggiornata $name';
  }

  @override
  String get skillStats => 'Come sta andando';

  @override
  String get skillNotUsedYet => 'Non ancora usata';

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

    return 'Usata $usesString volte · $rateString% riuscite · $failuresString fallite · $correctionsString corrette';
  }

  @override
  String skillLastFailure(String date) {
    return 'Ultimo problema: $date';
  }

  @override
  String get skillHistory => 'Versioni precedenti';

  @override
  String get replays => 'Sequenze';

  @override
  String get replaysRow => 'Passaggi registrati che esegue automaticamente';

  @override
  String get noReplays => 'Nessuna sequenza';

  @override
  String get replaysHelp =>
      'Una sequenza è una serie registrata di passaggi nel browser o sul desktop che il bot riesegue così com\'è, in modo più rapido ed economico. Se un passaggio non funziona più, il bot riprende da lì e può aggiornare la sequenza. Salvane una da una registrazione di Insegna o chiedi al bot di salvare ciò che ha appena fatto.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString passaggi',
      one: '1 passaggio',
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
      other: 'eseguite $runsString volte',
      one: 'eseguita 1 volta',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString hanno richiesto aiuto',
      one: '1 ha richiesto aiuto',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Esegui $name';
  }

  @override
  String get runReplayHelp => 'Controlla i valori compilati, poi eseguila.';

  @override
  String get run => 'Esegui';

  @override
  String get saveAsReplay => 'Salva anche come sequenza';

  @override
  String replaySaved(String name) {
    return 'Sequenza $name salvata';
  }

  @override
  String get passwordManagers => 'Gestori di password';

  @override
  String get passwordManagersRow => 'Accessi 1Password o Bitwarden per i bot';

  @override
  String get noPasswordManagers => 'Nessun gestore di password collegato';

  @override
  String get passwordManagersHelp =>
      'I bot possono accedere con le credenziali dai caveau che scegli. Non vedono mai la password: viene inserita nel browser solo sui siti di quell\'accesso.';

  @override
  String get connectPasswordManager => 'Collega un gestore di password';

  @override
  String get pmWorkspace => 'Tutto lo spazio di lavoro';

  @override
  String get pmJustMe => 'Solo io';

  @override
  String get pmNoVaults => 'Nessun caveau scelto';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString caveau',
      one: '1 caveau',
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
      other: '$countString accessi',
      one: '1 accesso',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Usa un server 1Password Connect con il token di un service account.';

  @override
  String get pmBitwardenHelp =>
      'Usa l\'API Vault Management di Bitwarden (bw serve) per le raccolte della tua organizzazione.';

  @override
  String get pmConnectUrl => 'Indirizzo server Connect';

  @override
  String get pmConnectToken => 'Token Connect';

  @override
  String get pmBwUrl => 'Indirizzo bw serve';

  @override
  String get pmBwToken => 'Token di accesso (facoltativo)';

  @override
  String get pmForWorkspace => 'Per tutto lo spazio di lavoro';

  @override
  String get pmChooseVaults => 'Caveau che i bot possono usare';

  @override
  String get pmChooseVaultsHelp =>
      'Solo gli accessi nei caveau o nelle raccolte che selezioni sono disponibili per i bot.';

  @override
  String get welcomeGettingReady => 'Preparazione dello spazio…';

  @override
  String get setUpManually => 'Configura manualmente';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get inviteLinkCopied =>
      'Link di invito copiato. Invialo alle persone con cui lavori.';

  @override
  String get inviteFriends => 'Invita amici';

  @override
  String inviteFriendsRow(String amount) {
    return 'Ottieni $amount di utilizzo gratuito per ogni amico che si iscrive';
  }

  @override
  String get inviteFriendsRowPlain => 'Condividi Casama con i tuoi amici';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Regala Casama, ottieni $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Condividi Casama con gli amici';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Invia il tuo link a un amico. Quando si iscrive e completa la sua prima chat, ottieni $amount di utilizzo gratuito.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Invia il tuo link a un amico. Può iscriversi subito.';

  @override
  String get inviteFriendsYourCode =>
      'Il tuo codice di invito. Tocca per copiare.';

  @override
  String get inviteFriendsShare => 'Condividi link';

  @override
  String get inviteFriendsCopyLink => 'Copia link';

  @override
  String get inviteFriendsCopied => 'Copiato. Invialo a un amico.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Unisciti a me su Casama, dove i colleghi IA lavorano per te: $link (codice di invito $code)';
  }

  @override
  String get inviteFriendsProgress => 'I tuoi inviti';

  @override
  String get inviteFriendsJoined => 'Amici che si sono iscritti';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString non hanno ancora completato la prima chat',
      one: '1 non ha ancora completato la prima chat',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Utilizzo gratuito ottenuto';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString altri amici possono farti ottenere una ricompensa',
      one: '1 altro amico può farti ottenere una ricompensa',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Hai ottenuto il massimo possibile dagli inviti. Grazie!';

  @override
  String get inviteFriendsHow => 'Come funziona';

  @override
  String get inviteFriendsStep1 =>
      'Condividi il tuo link o codice con un amico';

  @override
  String get inviteFriendsStep2 =>
      'Il tuo amico si registra e inserisce il tuo codice entro una settimana';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Quando completa la sua prima chat, ottieni $amount di utilizzo gratuito';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Il tuo amico inizia a lavorare con i suoi colleghi IA';

  @override
  String get inviteFriendsUnavailable =>
      'Gli inviti non sono disponibili su questo server.';

  @override
  String get referralHaveCode => 'Hai il codice di un amico?';

  @override
  String get referralCodeHint => 'Codice di invito';

  @override
  String get referralUse => 'Usa';

  @override
  String get referralRedeemed =>
      'Codice di invito aggiunto. Ti diamo il benvenuto su Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'Hai usato l’invito di $name per iscriverti. Ti diamo il benvenuto su Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Hai usato l’invito di $name per iscriverti.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Hai usato l’invito di un amico per iscriverti.';

  @override
  String referralInvitedBy(String name) {
    return '$name ti ha invitato';
  }

  @override
  String get referralInvitedByFriend => 'Un amico ti ha invitato';

  @override
  String get referralWelcomeTitle => 'Ti diamo il benvenuto su Casama';

  @override
  String get referralWelcomeHelp =>
      'Colleghi IA che lavorano per te sui propri computer. Accetta l\'invito così il tuo amico riceve il bonus.';

  @override
  String get referralAccept => 'Accetta invito';

  @override
  String get referralGetStarted => 'Inizia';

  @override
  String get referralInvalid => 'Questo invito non funziona';

  @override
  String get referralInvalidHelp =>
      'Il codice potrebbe contenere un errore. Puoi comunque iscriverti e usare Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Regala $amount, ottieni $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Invia il tuo link a un amico. Quando si iscrive con il tuo codice e completa la sua prima chat, ricevete entrambi $amount di utilizzo gratuito.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Invia il tuo link a un amico. Quando si iscrive con il tuo codice e completa la sua prima chat, tu ricevi $reward di utilizzo gratuito e chi si iscrive riceve $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Quando completa la sua prima chat, ricevete entrambi $amount di utilizzo gratuito';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Quando completa la sua prima chat, tu ricevi $reward e chi hai invitato $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Unisciti a me su Casama, dove i colleghi IA lavorano per te. Iscriviti con il mio codice di invito $code e ricevi $amount di utilizzo gratuito: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Inseriscilo entro una settimana dall’iscrizione e ricevi $amount di utilizzo gratuito dopo la tua prima chat.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Il tuo bonus di benvenuto di $amount è nel tuo spazio di lavoro.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Il tuo bonus di benvenuto di $amount arriva dopo la tua prima chat.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Colleghi IA che lavorano per te sui propri computer. Accetta l’invito e ricevi $amount di utilizzo gratuito dopo la tua prima chat.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Sei dentro! Il tuo bonus di benvenuto di $amount arriva dopo la tua prima chat.';
  }

  @override
  String get connectManaged => 'Accedi tramite Composio';

  @override
  String connectManagedHelp(String app) {
    return 'Casama collega $app tramite Composio, che gestisce l’accesso. Puoi scollegare l’app in qualsiasi momento.';
  }

  @override
  String get sharing => 'Condivisione';

  @override
  String get sharingRow => 'Chi può chattarci, modificarlo o gestirlo';

  @override
  String get sharingHelp =>
      'Tutti nello spazio di lavoro possono chattare con un bot a meno che tu non lo renda privato. Le persone che aggiungi possono chattare, modificarne le impostazioni o anche gestire gli accessi. Un bot che lavora per qualcuno usa soltanto il suo computer personale e le sue connessioni.';

  @override
  String get sharingPrivate => 'Privato';

  @override
  String get sharingPrivateOn =>
      'Solo tu e le persone qui sotto potete vederlo';

  @override
  String get sharingPrivateOff =>
      'Tutti nello spazio di lavoro possono chattarci';

  @override
  String get sharingPeople => 'Persone';

  @override
  String get sharingOnlyCreator => 'Solo chi lo ha creato';

  @override
  String get sharingEveryoneChats =>
      'Tutti possono chattare; aggiungi chi può modificarlo';

  @override
  String sharingEveryoneRole(String role) {
    return 'Tutti quelli con ruolo $role';
  }

  @override
  String get accessChat => 'Può chattare';

  @override
  String get accessEdit => 'Può modificare';

  @override
  String get accessAdmin => 'Può gestire';

  @override
  String get sharingSaved => 'Condivisione salvata';

  @override
  String get triggerCalendar => 'Riunioni';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Intorno alle riunioni corrispondenti ($minutesString min)',
      zero: 'All\'inizio delle riunioni corrispondenti',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Collega prima Google Calendar o Outlook.';

  @override
  String get calendarTriggerCalendar => 'Calendario';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString min',
      zero: 'All\'inizio',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Solo riunioni con persone esterne alla mia azienda';

  @override
  String get calendarVideoLink => 'Solo riunioni con un link video';

  @override
  String get calendarTitleMatch => 'Solo titoli che contengono (facoltativo)';

  @override
  String get fullAccess => 'Accesso completo';

  @override
  String get fullAccessHelp =>
      'I bot agiscono senza chiedere prima, sui loro computer e sul tuo Mac. Pagamenti, modifiche della password e le tue regole “Chiedimi prima” richiedono comunque conferma.';

  @override
  String get fullAccessConfirmTitle => 'Attivare l’accesso completo?';

  @override
  String get fullAccessConfirmBody =>
      'Ogni bot in questo spazio di lavoro potrà inviare messaggi, eliminare file, eseguire comandi sul tuo Mac e aggiungere connessioni senza chiedertelo prima. Pagamenti e modifiche della password chiedono comunque conferma.';

  @override
  String get fullAccessTurnOn => 'Attiva';

  @override
  String get botToBot => 'I bot possono parlarsi tra loro';

  @override
  String get botToBotHelp =>
      'I bot possono @menzionarsi, scriversi e affidarsi lavoro a vicenda.';

  @override
  String get capMessages => 'Messaggi (iMessage)';

  @override
  String get chatApps => 'App di chat';

  @override
  String get chatAppsRow => 'Telegram, email, SMS, Slack, WhatsApp e altro';

  @override
  String get botEmail => 'Indirizzo email';

  @override
  String get botEmailRow => 'Dai a questo bot un proprio indirizzo';

  @override
  String botEmailClaimTitle(String name) {
    return 'Dai a $name un indirizzo email';
  }

  @override
  String get botEmailClaimHelp =>
      'Le persone possono scrivergli e lui risponde via email. Inoltragli qualsiasi cosa: fatture, prenotazioni, newsletter.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'Il nome non può essere cambiato in seguito.';

  @override
  String get botEmailNameLabel => 'Nome';

  @override
  String botEmailWillBe(String address) {
    return 'Indirizzo del tuo bot: $address.';
  }

  @override
  String get botEmailClaim => 'Crea indirizzo';

  @override
  String get botEmailTaken => 'Questo nome è già preso. Prova uno di questi:';

  @override
  String get botEmailClaimed => 'Il tuo bot ha un indirizzo';

  @override
  String get botEmailClaimedHelp =>
      'È in arrivo un\'email di benvenuto. Rispondi a quella oppure inoltra qualsiasi cosa.';

  @override
  String get botEmailCopy => 'Copia';

  @override
  String get botEmailCopied => 'Copiato';

  @override
  String get botEmailContacts => 'Aggiungi ai contatti';

  @override
  String botEmailWrite(String name) {
    return 'Scrivi a $name';
  }

  @override
  String get botEmailPaused =>
      'In pausa. Riceve e conserva comunque la posta, ma non risponde.';

  @override
  String get botEmailPause => 'Metti in pausa';

  @override
  String get botEmailResume => 'Riprendi';

  @override
  String get botEmailSenders => 'Mittenti consentiti';

  @override
  String get botEmailSendersHelp =>
      'Solo queste persone ricevono risposta. La posta di sconosciuti viene conservata e non avvia nulla.';

  @override
  String get botEmailEditSenders => 'Modifica in App di chat';

  @override
  String get botEmailMove => 'Sposta su un altro bot';

  @override
  String get botEmailMoveHelp =>
      'L\'indirizzo e la sua posta passano all\'altro bot.';

  @override
  String get botEmailRelease => 'Rilascia indirizzo';

  @override
  String get botEmailReleaseHelp =>
      'Smette di ricevere per sempre. Il nome non verrà mai più assegnato.';

  @override
  String botEmailReleaseConfirm(String address) {
    return 'Rilasciare $address? Smette subito di ricevere e il nome non verrà mai più assegnato.';
  }

  @override
  String get botEmailReleaseNow => 'Rilascia';

  @override
  String get botEmailMoved => 'Spostato';

  @override
  String botEmailNewBotRow(String name) {
    return 'Dai a $name un indirizzo email';
  }

  @override
  String get botEmailInbox => 'In arrivo';

  @override
  String get botEmailInboxRow => 'Posta conservata, sconosciuti e file';

  @override
  String get botEmailEmpty => 'Ancora nessuna email';

  @override
  String get botEmailStrangers => 'Sconosciuti';

  @override
  String get botEmailAll => 'Tutta la posta';

  @override
  String get botEmailUnconfirmed => 'Impossibile confermare questo mittente';

  @override
  String get botEmailAllow => 'Consenti';

  @override
  String get botEmailBlock => 'Blocca';

  @override
  String get botEmailBlocked =>
      'Bloccato. La nuova posta da qui viene rifiutata.';

  @override
  String get botEmailUnblock => 'Sblocca';

  @override
  String get botEmailOpenChat => 'Apri chat';

  @override
  String get botEmailFiles => 'File';

  @override
  String get botEmailNewSenders => 'Avvisami sui nuovi mittenti';

  @override
  String get botEmailNewSendersHelp =>
      'Al massimo una volta al giorno. Disattivato se non lo attivi.';

  @override
  String get botEmailTryTitle => 'Cose da provare';

  @override
  String get botEmailTryForward => 'Inoltra una fattura o una prenotazione';

  @override
  String get botEmailTryForwardHelp =>
      'Inoltra qualsiasi cosa all\'indirizzo qui sopra. Lo legge e risponde qui.';

  @override
  String get botEmailTryReceipts => 'Conserva le mie ricevute';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Crea una routine che archivia la posta inviata a $address.';
  }

  @override
  String get botEmailTryDigest => 'Un riepilogo a settimana';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Crea una routine che raccoglie le newsletter da $address in un riepilogo settimanale.';
  }

  @override
  String get botEmailTryCopied => 'Indirizzo copiato';

  @override
  String get botEmailTryMade => 'Routine creata';

  @override
  String get botEmailReceiptsName => 'Conserva le mie ricevute';

  @override
  String get botEmailReceiptsInstructions =>
      'Archivia la ricevuta da questa email: per cosa era, quanto e quando. Non dire nulla a meno che qualcosa sembri sbagliato.';

  @override
  String get botEmailDigestName => 'Riepilogo settimanale newsletter';

  @override
  String get botEmailDigestInstructions =>
      'Raccogli le newsletter di questa settimana e invia un breve riepilogo: solo i titoli che vale la pena sapere, nient\'altro.';

  @override
  String get botEmailTriggerTag => 'Etichetta indirizzo';

  @override
  String get botEmailTriggerTagHelp =>
      'Solo la posta verso questa etichetta, come shop per ada+shop@. Solo indirizzi email.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Ascolta anche mittenti non confermati';

  @override
  String get botEmailTriggerAutomatic => 'Ascolta anche la posta automatica';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used di $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used usati';
  }

  @override
  String get botEmailStorageFull =>
      'La casella di posta è piena, quindi le nuove email vengono rifiutate. Elimina la posta più vecchia per liberare spazio.';

  @override
  String get botEmailSelect => 'Seleziona';

  @override
  String get botEmailSelectDone => 'Fine';

  @override
  String get botEmailDelete => 'Elimina';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Elimina $n email',
      one: 'Elimina 1 email',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Eliminare $n email?',
      one: 'Eliminare questa email?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Il testo e i file vengono eliminati per sempre. Le copie già presenti in una chat restano lì.';

  @override
  String get botEmailDeleteOlder => 'Elimina posta più vecchia';

  @override
  String get botEmailOlder30Days => 'Più vecchia di 30 giorni';

  @override
  String get botEmailOlder6Months => 'Più vecchia di 6 mesi';

  @override
  String get botEmailOlderYear => 'Più vecchia di un anno';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Eliminare tutta la posta più vecchia di 30 giorni?',
      'months6': 'Eliminare tutta la posta più vecchia di 6 mesi?',
      'other': 'Eliminare tutta la posta più vecchia di un anno?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n email eliminate',
      one: '1 email eliminata',
      zero: 'Nulla da eliminare',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n indirizzi email bot',
      one: '1 indirizzo email bot',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew =>
      'I bot scrivono a nuove persone via email';

  @override
  String get botEmailPerkRepliesOnly => 'I bot ti rispondono via email';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Collega un\'app di chat';

  @override
  String get chatAppsEmpty => 'Nessuna app di chat';

  @override
  String get chatAppsHelp =>
      'Permetti alle persone di scrivere a questo bot da Telegram, email, SMS, Slack, WhatsApp, Messenger, Feishu o iMessage. Risponde solo alle persone nell\'elenco consentito; tutti gli altri vengono registrati qui.';

  @override
  String get chatAppsAddHelp =>
      'Incolla le credenziali dalle impostazioni sviluppatore dell\'app. Vengono salvate crittografate e non vengono più mostrate.';

  @override
  String get chatAppsKind => 'App';

  @override
  String get chatAppsSenders => 'Mittenti consentiti';

  @override
  String get chatAppsSendersHelp =>
      'Uno per riga: indirizzi email (o *@azienda.com), numeri di telefono o ID utente. Non sai un ID? Lascialo vuoto, scrivi al bot e copia l\'ID da Attività.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Attiva prima “Usa questo computer per i bot” con Messaggi consentito nell\'app desktop sul tuo Mac.';

  @override
  String chatAppsConnected(String name) {
    return '$name è collegata';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram sta già inviando messaggi qui. Scrivi al tuo bot per provarlo.';

  @override
  String get chatAppsPasteUrl =>
      'Incolla questo indirizzo nelle impostazioni webhook dell\'app.';

  @override
  String get chatAppsWebhookUrl => 'Indirizzo webhook';

  @override
  String get chatAppsVerifyToken => 'Token di verifica';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString mittenti consentiti',
      one: '1 mittente consentito',
      zero: 'Nessuno consentito',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Attività';

  @override
  String get chatAppsNoActivity => 'Ancora nessun messaggio.';

  @override
  String get chatAppsIgnored => 'Ignorato: non nell\'elenco consentito';

  @override
  String get chatAppsAllow => 'Consenti';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender ora può scrivere a questo bot';
  }

  @override
  String get chatAppsRoutine => 'Avviata una routine';

  @override
  String get chatAppsFailed => 'Impossibile inviare';

  @override
  String get chatAppsSent => 'Inviato';

  @override
  String get chatAppsAnswered => 'Risposto';

  @override
  String get chatAppsRemove => 'Scollega';

  @override
  String get chBotToken => 'Token bot';

  @override
  String get chAddress => 'Indirizzo email';

  @override
  String get chApiKey => 'Chiave API';

  @override
  String get chSigningSecret => 'Segreto di firma';

  @override
  String get chPhoneNumber => 'Numero di telefono';

  @override
  String get chAccountSid => 'Account SID';

  @override
  String get chAuthToken => 'Token di autenticazione';

  @override
  String get chPhoneNumberId => 'ID numero di telefono';

  @override
  String get chAccessToken => 'Token di accesso';

  @override
  String get chAppSecret => 'App secret';

  @override
  String get chPageToken => 'Token di accesso pagina';

  @override
  String get chAppId => 'ID app';

  @override
  String get chEncryptKey => 'Chiave di crittografia';

  @override
  String get chVerificationToken => 'Token di verifica';

  @override
  String get chPublicKey => 'Chiave pubblica';

  @override
  String get chTrackerUser => 'L\'ID utente del bot nel tracker';

  @override
  String get chSiteUrl => 'Indirizzo sito (https://…)';

  @override
  String get chAccountEmail => 'Email account';

  @override
  String get routineMessage => 'Quando arriva un messaggio corrispondente';

  @override
  String get triggerMessage => 'Messaggi';

  @override
  String get messageTriggerHelp =>
      'Si avvia quando corrisponde un\'email o un messaggio di chat inviato a questo bot. Collega prima l\'app in App di chat.';

  @override
  String get messageTriggerAnyApp => 'Qualsiasi app';

  @override
  String get messageTriggerSender => 'Da (indirizzo, numero o *@azienda.com)';

  @override
  String get messageTriggerSubject => 'L\'oggetto contiene';

  @override
  String get messageTriggerWords => 'Il messaggio contiene';

  @override
  String callIncoming(String name) {
    return '$name sta chiamando';
  }

  @override
  String get callAnswer => 'Rispondi';

  @override
  String get callDecline => 'Rifiuta';

  @override
  String get callFullScreenTitle => 'Chiamate sulla schermata di blocco';

  @override
  String get callFullScreenOff =>
      'Disattivato: la chiamata di un bot appare solo come notifica. Tocca per far squillare le chiamate a schermo intero.';

  @override
  String get encryption => 'Crittografa contenuti';

  @override
  String get encryptionHelp =>
      'Messaggi, ricordi, ticket, pagine e conoscenza vengono crittografati prima di essere salvati, con la chiave di questo spazio di lavoro. La ricerca quindi confronta titoli e significato, non le parole esatte nel testo crittografato.';

  @override
  String get encryptionOff => 'Disattivata';

  @override
  String get encryptionUnavailable =>
      'Non disponibile: questo server non ha una chiave di crittografia configurata';

  @override
  String get encryptionEncrypting =>
      'Attivazione: crittografia di ciò che è già salvato';

  @override
  String get encryptionOnServer => 'Attiva, con la chiave del server';

  @override
  String get encryptionOnKms => 'Attiva, con AWS KMS';

  @override
  String get encryptionDecrypting =>
      'Disattivazione: decrittografia di ciò che è salvato';

  @override
  String get encryptionConfirm =>
      'I contenuti verranno crittografati con la chiave di questo spazio di lavoro. Se lo spazio di lavoro viene eliminato, la sua chiave viene distrutta e i contenuti non potranno essere recuperati. La ricerca esatta per parole smette di funzionare sul testo crittografato.';

  @override
  String get encryptionTurnOn => 'Attiva';

  @override
  String get encryptionRotate => 'Ruota chiave';

  @override
  String get encryptionKeyManaged =>
      'Casama crea e conserva per te la chiave di questo spazio di lavoro, protetta con la chiave del server stesso. Non c\'è nulla da salvare o copiare.';

  @override
  String get encryptionRotateTitle => 'Ruotare la chiave?';

  @override
  String get encryptionRotateBody =>
      'La chiave dello spazio di lavoro viene nuovamente protetta con la chiave attuale del server. I tuoi contenuti restano leggibili e non serve ricrittografare nulla. Fallo dopo aver cambiato la chiave del server oppure periodicamente.';

  @override
  String get encryptionRotateHelp =>
      'Protegge di nuovo la chiave dello spazio di lavoro con la chiave attuale del server';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Ultima rotazione: $when';
  }

  @override
  String get memoryBackend => 'Dove viene conservata la memoria';

  @override
  String get memoryBuiltIn => 'Integrata';

  @override
  String get memoryBackendHelp => 'Memoria a lungo termine dei bot';

  @override
  String get memoryBackendSheetHelp =>
      'Conserva la memoria dei tuoi bot in Honcho o Supermemory con il tuo account. La schermata della memoria, le esportazioni e l\'eliminazione funzionano allo stesso modo.';

  @override
  String get memoryHonchoWorkspace => 'Spazio di lavoro Honcho';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Lascia vuoto per usarne uno creato per questo spazio di lavoro Casama';

  @override
  String get memoryBaseUrl => 'Indirizzo del server (facoltativo)';

  @override
  String get memoryBaseUrlHelp =>
      'Solo per un Honcho o Supermemory self-hosted';

  @override
  String get memoryCopyExisting => 'Copia i ricordi attuali';

  @override
  String get memoryUseBuiltIn => 'Usa di nuovo la memoria integrata';

  @override
  String get providerHintData => 'dati a pagamento (luoghi, email, SEO)';

  @override
  String get kindA2a => 'Agente IA (A2A)';

  @override
  String get a2aAgentUrl => 'Indirizzo agente o URL scheda agente';

  @override
  String get a2aAgentToken => 'Token di accesso (facoltativo)';

  @override
  String get a2a => 'Agent-to-Agent (A2A)';

  @override
  String get a2aHelp =>
      'Gli agenti esterni possono affidare attività ai bot che pubblichi.';

  @override
  String get chromeExtensionSwitch => 'Casama per Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'I membri possono usare l\'estensione del browser con questo spazio di lavoro.';

  @override
  String get chromeActSwitch => 'Bot nei browser dei membri';

  @override
  String get chromeActSwitchHelp =>
      'I membri possono consentire ai bot di aprire pagine e agire nel proprio Chrome, in un gruppo di schede che possono fermare.';

  @override
  String get a2aPublish => 'Pubblica come agente A2A';

  @override
  String get a2aPublishHelp =>
      'Gli agenti esterni con una chiave API dello spazio di lavoro possono affidare attività a questo bot.';

  @override
  String get a2aWorkspaceOff =>
      'Attiva prima agent-to-agent nelle impostazioni dello spazio di lavoro.';

  @override
  String get a2aCardUrl => 'Scheda agente';

  @override
  String get phoneCalls => 'Telefonate';

  @override
  String get phoneCallsHelp =>
      'Lascia che i bot chiamino aziende per te tramite il tuo account Twilio. Ogni chiamata chiede conferma prima secondo le consuete approvazioni.';

  @override
  String get twilioSid => 'Account SID';

  @override
  String get twilioToken => 'Token di autenticazione';

  @override
  String get twilioFrom => 'Le chiamate partono da';

  @override
  String get phoneCallsPersonal => 'Consenti chiamate a numeri personali';

  @override
  String get phoneCallsCap => 'Chiamate al giorno';

  @override
  String get phoneCallsOff => 'Non collegato';

  @override
  String get outCall => 'Chiama';

  @override
  String get outCallRinging => 'Squilla…';

  @override
  String get outCallLive => 'In chiamata';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Terminata dopo $secondsString s';
  }

  @override
  String get outCallEndedByYou => 'Hai terminato la chiamata';

  @override
  String get outCallTakenOver => 'Hai preso il controllo della chiamata';

  @override
  String get outCallFailed => 'Non andata a buon fine';

  @override
  String get outCallNothingYet => 'Ancora nulla di detto.';

  @override
  String get outCallTakeOver => 'Prendi il controllo';

  @override
  String get outCallEnd => 'Termina chiamata';

  @override
  String get outCallYourPhone => 'Il tuo numero di telefono';

  @override
  String get outCallYourPhoneHelp =>
      'Formato internazionale, come +393401234567. Lascia vuoto per usare quello salvato.';

  @override
  String get payments => 'Pagamenti';

  @override
  String get paymentsHelp =>
      'Consenti ai bot di pagare esercenti con carte virtuali monouso che approvi ogni volta. Usa il tuo account Stripe Issuing.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent spesi questo mese su $cap';
  }

  @override
  String get paymentsSheetHelp =>
      'Ogni carta viene approvata da te con l\'importo mostrato, funziona una sola volta presso quell\'esercente per un\'ora e mai per titoli finanziari, criptovalute, carte regalo o bonifici.';

  @override
  String get paymentsStripeKey => 'Chiave segreta Stripe (con Issuing)';

  @override
  String get paymentsWebhookSecret => 'Segreto di firma webhook';

  @override
  String get paymentsWebhook => 'Indirizza qui un webhook Stripe';

  @override
  String get paymentsCardholder => 'Nome sulle carte';

  @override
  String get paymentsAddress => 'Indirizzo di fatturazione';

  @override
  String get paymentsCity => 'Città';

  @override
  String get paymentsState => 'Provincia o regione';

  @override
  String get paymentsZip => 'CAP';

  @override
  String get paymentsCountry => 'Paese (2 lettere)';

  @override
  String get paymentsCap => 'Limite mensile dello spazio di lavoro (USD)';

  @override
  String get paymentsBotCap => 'Limite mensile per bot (USD)';

  @override
  String get links => 'Bot collegati';

  @override
  String get linksRow => 'Collega con il bot di un contatto fidato';

  @override
  String get linksHelp =>
      'Il tuo bot può chiedere al bot di un contatto collegato cose come un orario per cena. Ogni bot risponde secondo le regole della propria persona e condivide solo ciò che serve; entrambi vedete ogni scambio.';

  @override
  String get linksEmpty => 'Nessun bot collegato';

  @override
  String get linksInvite => 'Invita un contatto';

  @override
  String get linksContactName => 'Nome del contatto';

  @override
  String get linksInviteReady => 'Invia questo invito';

  @override
  String get linksInviteHelp =>
      'Invialo al tuo contatto. Lo accetta in Casama con uno dei suoi bot. Funziona una volta, per 7 giorni.';

  @override
  String get linksAccept => 'Accetta invito';

  @override
  String get linksAcceptHelp =>
      'Incolla l\'invito che ti ha inviato il tuo contatto.';

  @override
  String get linksInviteText => 'Invito';

  @override
  String linksActive(String bot) {
    return 'Collegato con $bot';
  }

  @override
  String get linksPending => 'In attesa che il tuo contatto accetti';

  @override
  String get linksRevoked => 'Scollegato';

  @override
  String get linksExchanges => 'Scambi';

  @override
  String get linksNoExchanges => 'Ancora nessuna richiesta.';

  @override
  String get linksNoAnswer => 'Nessuna risposta';

  @override
  String get linksWorking => 'Al lavoro…';

  @override
  String get linksRevoke => 'Scollega';

  @override
  String get wakeWord => 'Parola di attivazione';

  @override
  String get wakeWordRow =>
      'Pronuncia una frase per avviare una chiamata con un bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'In ascolto per “$phrase”';
  }

  @override
  String get wakeWordHelp =>
      'Mentre Casama è aperta, questo dispositivo ascolta la tua frase e avvia una chiamata dal vivo con il bot che scegli.';

  @override
  String get wakeWordListen => 'Ascolta parola di attivazione';

  @override
  String get wakeWordPhrase => 'Frase';

  @override
  String get wakeWordPhraseHelp => 'Due o tre parole, come “ehi casama”';

  @override
  String get wakeWordBot => 'Chiama questo bot';

  @override
  String get wakeWordDownloading => 'Download del modello sul dispositivo…';

  @override
  String get wakeWordTest => 'Prova frase';

  @override
  String get wakeWordTesting => 'In ascolto… pronuncia la tua frase';

  @override
  String get wakeWordHeard => 'Sentita!';

  @override
  String get wakeWordStopTest => 'Ferma';

  @override
  String get wakeWordPrivacy =>
      'L\'ascolto avviene su questo dispositivo con un modello open source (circa 18 MB, scaricato una volta). Nulla viene inviato altrove finché non inizia la chiamata.';

  @override
  String get secretStore => 'Dove vengono conservati i segreti';

  @override
  String get secretStoreVault => 'Il caveau di questo server';

  @override
  String get secretStoreHelp =>
      'Tieni i segreti con nome dei bot nel tuo progetto Infisical. Casama conserva solo il nome di ciascun segreto e dove può essere usato.';

  @override
  String get secretStoreSite => 'Indirizzo Infisical';

  @override
  String get secretStoreProject => 'ID progetto';

  @override
  String get secretStoreEnv => 'Ambiente';

  @override
  String get secretStoreClientId => 'ID client identità macchina';

  @override
  String get secretStoreClientSecret => 'Client secret';

  @override
  String get secretStoreMove => 'Sposta i segreti attuali in Infisical';

  @override
  String get secretStoreBack => 'Usa di nuovo il caveau di questo server';

  @override
  String get localServer => 'Esegui Casama su questo computer';

  @override
  String get setupTitleMac => 'Configura Casama su questo Mac';

  @override
  String get setupTitle => 'Configura Casama su questo computer';

  @override
  String get setupEntryMac => 'Esegui su questo Mac';

  @override
  String get setupEntry => 'Esegui su questo computer';

  @override
  String get setupEntryHelp =>
      'Il tuo server privato su questo computer. Gratuito per uso personale.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Server';

  @override
  String get setupStepAccount => 'Account';

  @override
  String get setupStepModel => 'Modello IA';

  @override
  String get setupStepPhone => 'Telefono';

  @override
  String get setupDockerChecking => 'Controllo Docker…';

  @override
  String get setupDockerMissingTitle => 'Prima installa Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'Il server di Casama gira dentro Docker Desktop, un\'app gratuita che lo mantiene separato dal resto del tuo Mac.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Il server di Casama gira dentro Docker, che lo mantiene separato dal resto del tuo computer.';

  @override
  String get setupDockerGetMac => 'Scarica Docker Desktop';

  @override
  String get setupDockerGetLinux =>
      'Apri la guida all\'installazione di Docker';

  @override
  String get setupDockerStep1 =>
      'Apri il file scaricato e trascina Docker in Applicazioni.';

  @override
  String get setupDockerStep2 => 'Apri Docker e accetta i termini.';

  @override
  String get setupDockerStep3 => 'Torna qui. Questa pagina prosegue da sola.';

  @override
  String get setupDockerWaiting => 'In attesa di Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker deve essere in esecuzione';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker è installato ma non aperto. Una volta avviato, operazione che può richiedere un minuto, questa pagina prosegue da sola.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker è installato ma non in esecuzione. Avvialo con questo comando e questa pagina prosegue da sola.';

  @override
  String get setupDockerOpen => 'Apri Docker';

  @override
  String get setupDockerOpening => 'Avvio di Docker…';

  @override
  String get setupDockerPermissionTitle => 'Docker richiede il tuo permesso';

  @override
  String get setupDockerPermissionBody =>
      'Docker è in esecuzione, ma il tuo utente non è autorizzato a usarlo. Esegui questo comando, poi esci e rientra.';

  @override
  String get setupDockerComposeTitle => 'A Docker manca Compose';

  @override
  String get setupDockerComposeBody =>
      'Questo Docker non ha Compose v2. Docker Desktop lo include; su Linux, installa il pacchetto docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Saltato';

  @override
  String get setupArtDocker => 'Prima la scatola in cui vive il tuo server.';

  @override
  String get setupArtServer =>
      'Costruzione della tua casa. Questo è il passaggio più lungo.';

  @override
  String get setupArtAccount => 'Il tuo server è in esecuzione!';

  @override
  String get setupArtModel => 'Ora dagli un cervello.';

  @override
  String get setupArtPhone => 'Ultimo passaggio: portalo con te.';

  @override
  String get setupDockerSlowTitle => 'Ci sta mettendo un po\'?';

  @override
  String get setupDockerSlowMenuBar =>
      'Cerca la balena nella barra dei menu. Docker è pronto quando smette di muoversi.';

  @override
  String get setupDockerSlowTerms =>
      'Se Docker mostra una finestra in cui ti chiede di accettare i termini, completa prima quella. L\'accesso a Docker è facoltativo.';

  @override
  String get setupDockerSlowRestart =>
      'Ancora bloccato? Esci da Docker dal suo menu, poi premi Controlla di nuovo.';

  @override
  String get setupDockerSlowInstalled =>
      'L’hai già installato? Apri Docker una volta da Applicazioni, in modo che possa configurarsi.';

  @override
  String get setupDockerSlowOther =>
      'Usi invece OrbStack o Colima? Avvialo. Casama funziona con qualsiasi Docker che risponde a docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Esegui docker info in un terminale per vedere cosa dice Docker.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker ha risposto: $detail';
  }

  @override
  String get setupDockerRecheck => 'Controlla di nuovo';

  @override
  String get setupDockerGuide => 'Guida alla risoluzione dei problemi';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Solo $gb GB di spazio su disco libero. Il server richiede circa $need GB.';
  }

  @override
  String get setupServerTitle => 'Scarica e avvia il tuo server';

  @override
  String get setupServerBody =>
      'Un download di circa 2,5 GB che richiede da 5 a 10 minuti la prima volta, e circa 10 GB di disco una volta configurato. Puoi continuare a usare il tuo computer.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Un download di $download GB, poi circa $disk GB di disco una volta configurato. La prima volta richiede da 5 a 10 minuti. Puoi continuare a usare il tuo computer.';
  }

  @override
  String get setupServerBodyNothing =>
      'Tutto ciò che serve è già su questo computer, quindi si avvia in un minuto o due.';

  @override
  String get setupServerStart => 'Avvia';

  @override
  String get setupServerStageDownload => 'Download del server';

  @override
  String get setupServerStagePrepare => 'Preparazione';

  @override
  String get setupServerStageParts => 'Download dei componenti';

  @override
  String setupServerDownloaded(int megabytes) {
    return '$megabytes MB finora';
  }

  @override
  String get setupServerStagePartsNote => 'Il passaggio più lungo';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$done di $total scaricati finora';
  }

  @override
  String get setupServerStageStart => 'Avvio';

  @override
  String get setupServerStageWait => 'In attesa di risposta';

  @override
  String get setupServerKeepOpen => 'Tieni aperta Casama fino al termine.';

  @override
  String get setupServerFailed => 'Il server non si è avviato.';

  @override
  String get setupServerConnecting => 'Pronto. Connessione…';

  @override
  String get setupShowDetails => 'Mostra dettagli';

  @override
  String get setupHideDetails => 'Nascondi dettagli';

  @override
  String get setupAccountTitle => 'Crea il tuo account';

  @override
  String get setupAccountBody =>
      'Resta solo su questo computer ed è proprietario di questo server. Non viene inviata alcuna email.';

  @override
  String get setupAccountName => 'Il tuo nome';

  @override
  String get setupAccountNameMissing => 'Inserisci il tuo nome';

  @override
  String get setupAccountCreate => 'Crea account';

  @override
  String get setupAccountHave => 'Ho già un account qui';

  @override
  String get setupAccountNew => 'Crea invece un nuovo account';

  @override
  String get setupAccountSignInTitle => 'Accedi al tuo server';

  @override
  String get setupAccountSignInBody =>
      'Usa l\'account che hai creato su questo server.';

  @override
  String get setupAccountClosed =>
      'Questo server ha già il suo proprietario. Accedi con quell\'account.';

  @override
  String get setupAccountPreparing => 'Preparazione dello spazio…';

  @override
  String get setupModelTitle => 'Dai un modello ai tuoi bot';

  @override
  String get setupModelBody =>
      'I bot hanno bisogno di un modello IA per ragionare. Accedi con un piano ChatGPT oppure incolla una chiave di OpenRouter, Google o un altro provider.';

  @override
  String get setupSkip => 'Salta per ora';

  @override
  String get setupPhoneTitle => 'Collega il tuo telefono';

  @override
  String get setupPhoneBody =>
      'Casama Link dà a questo computer un indirizzo privato, così il tuo telefono lo raggiunge da ovunque. Lo approvi una sola volta con un account gratuito su Casama Cloud. Le tue chat restano su questo computer.';

  @override
  String get setupPhoneTurnOn => 'Dai un indirizzo a questo computer';

  @override
  String get setupPhoneScanTitle => 'Scansiona con la fotocamera del telefono';

  @override
  String get setupPhoneScanBody =>
      'Apre Casama sul telefono ed effettua l\'accesso. Se Casama non è ancora sul telefono, la pagina che si apre indica dove scaricarla.';

  @override
  String get setupPhoneWaiting => 'In attesa del telefono…';

  @override
  String get setupPhoneConnected => 'Telefono collegato';

  @override
  String get setupPhoneConnectedBody =>
      'Il tuo telefono ha effettuato l\'accesso. Mostra un nuovo codice per aggiungere un altro dispositivo.';

  @override
  String get setupPhoneOwnerOnly =>
      'Solo il proprietario di questo server può dargli un indirizzo.';

  @override
  String get setupFinish => 'Fine';

  @override
  String get setupCardTitle => 'Completa la configurazione';

  @override
  String get setupCardModel =>
      'Aggiungi un modello IA così i tuoi bot possano rispondere.';

  @override
  String get setupCardPhone => 'Collega il telefono a questo computer.';

  @override
  String get setupCardOpen => 'Continua configurazione';

  @override
  String get desktopUsers => 'Utenti desktop simultanei';

  @override
  String get desktopUsersHelp =>
      'I bot su questo computer del team condividono un solo schermo. Gli altri attendono (e continuano a lavorare con shell, file e browser) mentre è in uso.';

  @override
  String desktopUsersCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String deviceAccessAsk(String kind, String bot) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '$bot vorrebbe usare il tuo calendario',
      'reminders': '$bot vorrebbe usare i tuoi promemoria',
      'contacts': '$bot vorrebbe usare i tuoi contatti',
      'places': '$bot vorrebbe usare i tuoi luoghi',
      'photos': '$bot vorrebbe usare le tue foto',
      'health': '$bot vorrebbe usare i tuoi dati Salute',
      'notifications': '$bot vorrebbe usare le tue notifiche',
      'activity': '$bot vorrebbe usare la tua attività sul computer',
      'browserTab': '$bot vorrebbe usare la scheda attuale del browser',
      'browserHistory':
          '$bot vorrebbe usare cronologia e segnalibri del browser',
      'alarm': '$bot vorrebbe usare le tue sveglie',
      'home': '$bot vorrebbe usare i tuoi accessori di Casa',
      'other': '$bot vorrebbe usare i dati del tuo dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Solo nelle tue chat. Puoi interromperlo in qualsiasi momento in Impostazioni → Connessioni del dispositivo.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Consentito usare il tuo calendario',
      'reminders': 'Consentito usare i tuoi promemoria',
      'contacts': 'Consentito usare i tuoi contatti',
      'places': 'Consentito usare i tuoi luoghi',
      'photos': 'Consentito usare le tue foto',
      'health': 'Consentito usare i tuoi dati Salute',
      'notifications': 'Consentito usare le tue notifiche',
      'activity': 'Consentito usare la tua attività sul computer',
      'browserTab': 'Consentito usare la scheda attuale del browser',
      'browserHistory': 'Consentito usare cronologia e segnalibri del browser',
      'alarm': 'Consentito usare le tue sveglie',
      'home': 'Consentito usare i tuoi accessori di Casa',
      'other': 'Consentito usare i dati del tuo dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Non condiviso';

  @override
  String get deviceKindCalendar => 'calendario';

  @override
  String get deviceKindReminders => 'promemoria';

  @override
  String get deviceKindContacts => 'contatti';

  @override
  String get deviceKindPlaces => 'luoghi';

  @override
  String get deviceKindPhotos => 'foto';

  @override
  String get deviceKindHealth => 'dati Salute';

  @override
  String get deviceKindNotifications => 'notifiche';

  @override
  String get deviceKindActivity => 'attività sul computer';

  @override
  String get deviceKindBrowserTab => 'scheda attuale del browser';

  @override
  String get deviceKindBrowserHistory => 'cronologia e segnalibri del browser';

  @override
  String get deviceKindAlarm => 'sveglie';

  @override
  String get deviceKindHome => 'accessori di Casa';

  @override
  String get deviceBrowserAsks => 'Cosa possono chiedere i bot al browser';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama per Chrome risponde dal vivo e nulla viene conservato. Attivali o disattivali nelle impostazioni dell\'estensione.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Non permettere più a $bot di chiedere';
  }

  @override
  String get deviceConnections => 'Connessioni del dispositivo';

  @override
  String get deviceConnectionsHelp =>
      'Condividi i dati di questo dispositivo con i tuoi bot. Ogni tipo è disattivato finché non lo attivi e solo i bot che consenti possono leggerlo, solo nelle tue chat.';

  @override
  String get deviceConnectionsNone =>
      'Questo dispositivo non può ancora condividere dati. Sul tuo telefono, apri Casama e attiva ciò che vuoi condividere.';

  @override
  String get deviceKeepFor => 'Conserva per';

  @override
  String get deviceKeepLiveOnly => 'Solo dal vivo';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Solo modelli privati';

  @override
  String get devicePrivateModelHelp =>
      'Possono leggerlo solo i bot su un modello locale';

  @override
  String get deviceNoBots =>
      'Nessun bot. Un bot lo chiede quando gli serve, oppure consentine uno ora.';

  @override
  String get deviceAllowBot => 'Consenti a un bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Quale bot può leggere il tuo calendario?',
      'reminders': 'Quale bot può leggere i tuoi promemoria?',
      'contacts': 'Quale bot può leggere i tuoi contatti?',
      'places': 'Quale bot può leggere i tuoi luoghi?',
      'photos': 'Quale bot può leggere le tue foto?',
      'health': 'Quale bot può leggere i tuoi dati Salute?',
      'notifications': 'Quale bot può leggere le tue notifiche?',
      'activity': 'Quale bot può leggere la tua attività sul computer?',
      'browserTab': 'Quale bot può leggere la scheda attuale del browser?',
      'browserHistory':
          'Quale bot può leggere cronologia e segnalibri del browser?',
      'alarm': 'Quale bot può leggere le tue sveglie?',
      'home': 'Quale bot può leggere i tuoi accessori di Casa?',
      'other': 'Quale bot può leggere i dati del tuo dispositivo?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama non ha il permesso. Consentilo nelle impostazioni di sistema, poi riprova.';

  @override
  String get deviceOtherDevices => 'I tuoi altri dispositivi';

  @override
  String get deviceForget => 'Dimentica questo dispositivo';

  @override
  String get deviceBrowsers => 'Browser che i bot possono usare';

  @override
  String get deviceBrowsersHelp =>
      'Associato in Casama per Chrome. I bot che hai consentito lavorano lì nel proprio gruppo di schede, con il tuo accesso.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot',
      one: '1 bot',
      zero: 'Nessun bot',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Online';

  @override
  String get deviceBrowserOffline => 'Offline';

  @override
  String get deviceBrowserUnpair => 'Disassocia questo browser';

  @override
  String get deviceBrowserAllBots => 'Tutti i bot';

  @override
  String get deviceChromeNotPaired => 'Casama per Chrome: non associato';

  @override
  String get deviceChromeHowToPair =>
      'Installa Casama per Chrome, accedi, poi apri Altro → “Lascia che i bot usino questo browser”.';

  @override
  String get deviceConnectionsRowHelp =>
      'Calendario, contatti e altro da questo dispositivo';

  @override
  String get healthExtraCycle => 'Monitoraggio del ciclo';

  @override
  String get healthExtraGlucose => 'Glicemia';

  @override
  String get healthExtraBloodPressure => 'Pressione sanguigna';

  @override
  String get appleHealth => 'Apple Salute';

  @override
  String get appleHealthAbout =>
      'Legge riepiloghi giornalieri di sonno, attività, allenamenti e cuore da Apple Salute (HealthKit), solo quando è attivo. Casama non scrive mai in Apple Salute.';

  @override
  String get healthNotMedical =>
      'Solo riepiloghi giornalieri (sonno, attività, allenamenti, cuore). I bot descrivono come ti confronti con il tuo solito e non danno mai pareri medici.';

  @override
  String get healthNeedsEncryption =>
      'I dati Salute richiedono la crittografia a riposo. Attivala per uno spazio di lavoro di cui sei proprietario, poi riprova.';

  @override
  String get placeAddHere => 'Aggiungi dove sono ora';

  @override
  String get placeName => 'Dai un nome a questo luogo (Casa, Lavoro, Palestra)';

  @override
  String get placeNoLocation =>
      'La tua posizione non è disponibile. Consenti la posizione per Casama, poi riprova.';

  @override
  String get placesHelp =>
      'I bot ricevono un avviso quando arrivi o lasci questi luoghi. Vengono condivisi solo il nome del luogo e l\'orario, mai il tuo percorso.';

  @override
  String get watchedAppsHelp =>
      'Vengono condivise solo le notifiche di queste app. I codici monouso vengono nascosti prima che qualsiasi dato lasci il telefono.';

  @override
  String get watchedAppAdd => 'Aggiungi un\'app (nome o ID pacchetto)';

  @override
  String get providerHintMaps => 'tempi di percorrenza per partenza immediata';

  @override
  String routineDevice(String event, String detail) {
    return 'Sul tuo telefono: $event $detail';
  }

  @override
  String get ctxSelection => 'Testo selezionato';

  @override
  String get ctxAddScreenshot => 'Aggiungi uno screenshot';

  @override
  String get ctxScreenshotAdded => 'Screenshot aggiunto';

  @override
  String get ctxScreenshotFailed =>
      'Impossibile acquisire uno screenshot. Consenti la registrazione schermo per Casama nelle impostazioni di sistema.';

  @override
  String get watchedFolders => 'Cartelle monitorate';

  @override
  String get watchedFoldersHelp =>
      'Un nuovo file in una di queste cartelle può avviare una routine (ad esempio, archiviare i nuovi PDF in Download). Viene condiviso solo il nome; i bot leggono il file solo se lavorano su questo computer.';

  @override
  String get whyTitle => 'Perché vedo questo?';

  @override
  String whyData(String data) {
    return 'Usato: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Urgenza: $urgency';
  }

  @override
  String get heldMeeting =>
      'Ha atteso mentre eri in riunione ed è arrivato con il tuo riepilogo.';

  @override
  String get heldFocus =>
      'Ha atteso mentre Full immersion era attivo ed è arrivato con il tuo riepilogo.';

  @override
  String get heldDriving =>
      'Ha atteso mentre stavi guidando ed è arrivato con il tuo riepilogo.';

  @override
  String get heldCap =>
      'Il bot aveva già inviato 5 messaggi oggi, quindi questo ha atteso il tuo riepilogo.';

  @override
  String get heldLow =>
      'Non era urgente, quindi ha atteso il tuo riepilogo invece di far vibrare il telefono.';

  @override
  String get lessLikeThis => 'Meno così';

  @override
  String get lessLikeThisDone => 'Capito, meno così';

  @override
  String get widgetStatusWorking => 'Al lavoro…';

  @override
  String get widgetStatusOff => 'Disattivato';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner =>
      'Sospeso dal proprietario dell\'istanza';

  @override
  String get previewHi => 'Ciao!';

  @override
  String get previewAsk => 'Puoi riordinare i miei appunti?';

  @override
  String get previewOnIt => 'Me ne occupo';

  @override
  String get previewDone => 'Fatto! Ora sono in tre cartelle.';

  @override
  String get previewMessage => 'Messaggio';

  @override
  String get fontPreviewGreeting => 'Buongiorno';

  @override
  String get photosFromUnsplash => 'Foto da Unsplash';

  @override
  String get showBotSteps => 'Mostra i passaggi del bot';

  @override
  String get showBotStepsHelp => 'Comandi ed errori tecnici in ogni chat.';

  @override
  String get showScreenCard => 'Mostra lo schermo del bot mentre lavora';

  @override
  String get showScreenCardHelp =>
      'Una piccola scheda live nella chat. Toccala per guardare a schermo intero.';

  @override
  String get showReplyUsage => 'Mostra utilizzo sulle risposte';

  @override
  String get showReplyUsageHelp =>
      'Quanto è costata ogni risposta, in una riga sotto di essa.';

  @override
  String get openLinksInApp => 'Apri i link nell\'app';

  @override
  String get openLinksInAppHelp =>
      'I link web si aprono in un browser dentro Casama. Disattivato: si aprono nel browser predefinito.';

  @override
  String replyUsageTokens(String count) {
    return '$count token';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount sulle tue chiavi';
  }

  @override
  String get replyUsageOnPlan => 'Sul tuo piano ChatGPT';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount finora';
  }

  @override
  String get replyUsageTooltip => 'Quanto è costata questa risposta';

  @override
  String get replyUsageTitle => 'Quanto è costata questa risposta';

  @override
  String get replyUsageFromCredits => 'Dai tuoi crediti';

  @override
  String get replyUsageYourKeys => 'Sulle tue chiavi';

  @override
  String get replyUsageTotal => 'Totale';

  @override
  String get replyUsageTime => 'Tempo';

  @override
  String get replyUsageTokensLabel => 'Token';

  @override
  String get replyUsageSteps => 'Passaggi';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Include $n esecuzioni di supporto',
      one: 'Include 1 esecuzione di supporto',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing =>
      'Nulla è stato conteggiato per questa risposta.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 credito = $price. Le tue chiavi e i tuoi piani vengono fatturati dal rispettivo provider, non da Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Apri l\'esecuzione';

  @override
  String get replyUsageLoadFailed =>
      'Impossibile caricare l\'utilizzo di questa risposta.';

  @override
  String get replyUsageOurCost => 'Il nostro costo';

  @override
  String get replyUsageMargin => 'Margine';

  @override
  String replyUsageItemCost(String amount) {
    return 'Nostro costo $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Il nostro costo e il margine ti vengono mostrati perché gestisci questo server. Nessun altro li vede.';

  @override
  String get kindSpeechToText => 'Voce in testo';

  @override
  String get kindVoice => 'Chiamate vocali';

  @override
  String get kindImages => 'Immagini';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Ricerche web';

  @override
  String get kindData => 'Ricerche dati';

  @override
  String get kindPhone => 'Telefonate';

  @override
  String get kindApps => 'Azioni app';

  @override
  String get activityReady => 'Preparazione…';

  @override
  String get activitySearching => 'Ricerca sul web…';

  @override
  String get activityBrowsing => 'Navigazione web…';

  @override
  String get activityComputer => 'Al lavoro sul suo computer…';

  @override
  String get activityFiles => 'Analisi dei file…';

  @override
  String get activityImage => 'Creazione immagine…';

  @override
  String get activityVideo => 'Creazione video…';

  @override
  String get activityMemory => 'Controllo di ciò che sa…';

  @override
  String get activityApps => 'Uso delle tue app…';

  @override
  String get activityScheduling => 'Impostazione pianificazione…';

  @override
  String get activityWorking => 'Ci sta lavorando…';

  @override
  String get activityWaitingForScreen =>
      'In attesa che tu restituisca il controllo dello schermo…';

  @override
  String get runFailedPlain =>
      'Qualcosa è andato storto. Riprova o apri Dettagli per vedere perché.';

  @override
  String get newKeyTitle => 'Copia la tua nuova chiave';

  @override
  String get newKeyHelp =>
      'Viene mostrata solo questa volta. Incollala nell\'app che stai collegando, poi tocca Fatto.';

  @override
  String get copyKey => 'Copia chiave';

  @override
  String get keyCopied => 'Chiave copiata';

  @override
  String revokeApiKeyTitle(String name) {
    return 'Revocare “$name”?';
  }

  @override
  String get revokeApiKeyBody =>
      'Le app che usano questa chiave smettono subito di connettersi. L\'azione è irreversibile; per riconnetterti, crea una nuova chiave.';

  @override
  String unlinkTitle(String name) {
    return 'Scollegare “$name”?';
  }

  @override
  String get unlinkBody =>
      'I bot smettono subito di parlarsi. Collegarli di nuovo richiede un nuovo invito.';

  @override
  String get alreadyMember => 'Fai già parte di questo spazio di lavoro.';

  @override
  String get askAdminToInvite =>
      'Solo proprietari e amministratori possono invitare persone. Chiedi a uno di loro un link di invito.';

  @override
  String get askBeforeJoining => 'Chiedimi prima che le persone si uniscano';

  @override
  String get askBeforeJoiningHelp =>
      'Un amministratore approva ogni persona che usa il link.';

  @override
  String get askToJoin => 'Chiedi di unirti';

  @override
  String get customLinks => 'Link personalizzati';

  @override
  String get customLinksHelp =>
      'Link con ruolo, scadenza o numero di utilizzi propri.';

  @override
  String get emailAddresses => 'Indirizzi email';

  @override
  String get emailAddressesHelp =>
      'Incolla uno o più indirizzi, separati da virgole o a capo.';

  @override
  String get getCode => 'Ottieni un codice';

  @override
  String get getNewCode => 'Ottieni un nuovo codice';

  @override
  String get getStarted => 'Inizia';

  @override
  String get welcomeCta => 'Andiamo';

  @override
  String get inviteAsAdmin => 'Invita come amministratori';

  @override
  String get inviteByEmail => 'Invita via email';

  @override
  String get inviteExpired => 'Scaduto';

  @override
  String inviteExpires(String when) {
    return 'Scade $when';
  }

  @override
  String get inviteInvalid => 'Questo invito non funziona';

  @override
  String get inviteInvalidHelp =>
      'Potrebbe essere scaduto, esaurito o disattivato. Chiedine uno nuovo.';

  @override
  String get inviteLink => 'Link di invito';

  @override
  String get inviteLinkApprovalHelp =>
      'Chiunque abbia questo link può chiedere di unirsi. Li approvi qui sotto.';

  @override
  String get inviteLinkHelp =>
      'Chiunque abbia questo link può unirsi come membro. Condividilo in una chat o via email.';

  @override
  String get inviteLinkOrCode => 'Link o codice di invito';

  @override
  String inviteOtherServer(String host) {
    return 'Questo invito è per $host e questa app è collegata a un server diverso.';
  }

  @override
  String get inviteRenewed =>
      'L\'invito funziona per altri 7 giorni. Invia loro il nuovo link.';

  @override
  String inviteSentTo(String email) {
    return 'Accedi con $email per accettare.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Unisciti a $workspace su Casama: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name ti ha invitato a unirti';
  }

  @override
  String get invitedToJoin => 'Hai ricevuto un invito';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString inviti inviati.',
      one: 'Invito inviato.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Ti unirai come amministratore';

  @override
  String get joinAsMember => 'Ti unirai come membro';

  @override
  String get joinByDomain => 'Unisciti tramite dominio email';

  @override
  String get joinByDomainHelp =>
      'Gli indirizzi verificati si uniscono senza invito.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Chiunque abbia un\'email verificata @$domain può unirsi';
  }

  @override
  String get joinByDomainUnavailable =>
      'Disponibile quando accedi con un\'email di lavoro verificata (non gmail.com e simili).';

  @override
  String get joinNeedsApproval =>
      'Un amministratore approva le nuove persone prima che si uniscano.';

  @override
  String get joinRequestSent => 'Richiesta inviata';

  @override
  String joinRequestSentHelp(String name) {
    return 'Un amministratore di $name la esaminerà. Riceverai una notifica quando sarai dentro.';
  }

  @override
  String get joinWithLinkOrCode => 'Unisciti con un link o un codice';

  @override
  String get spacesInvite => 'Invita persone';

  @override
  String spacesInviteTo(String name) {
    return 'In $name';
  }

  @override
  String get spacesNew => 'Nuovo spazio di lavoro';

  @override
  String get spacesNewHint =>
      'Con i suoi bot, le sue persone e la sua fatturazione';

  @override
  String get spacesJoin => 'Unisciti a uno spazio di lavoro';

  @override
  String get spacesJoinHint => 'Con un link o codice di invito';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Unisciti a $name';
  }

  @override
  String get joinedBotsHelp =>
      'Questi bot sono qui per aiutarti. Salutane uno per iniziare.';

  @override
  String get joinedNoBots =>
      'Non ci sono ancora bot qui. Creane uno o dai prima un\'occhiata.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString membri',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Membri';

  @override
  String openToDomain(String domain) {
    return 'Aperto a @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Apri $name';
  }

  @override
  String get pendingInvites => 'Inviti non ancora accettati';

  @override
  String get people => 'Persone';

  @override
  String get workspaceAdvancedSummary =>
      'Segreti, memoria, crittografia, pagamenti, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Codice di invito, dominio email, link personalizzati';

  @override
  String get inviteLinkToCopy => 'Link di invito, pronto da copiare';

  @override
  String linkMade(String when) {
    return 'Creato $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Addebiti per server, server Casama Link e chiavi';

  @override
  String get billingChargesSummary => 'Addebiti per server';

  @override
  String get billingUsageRow => 'Cosa hanno usato i bot e quanto è costato';

  @override
  String billingUsageSoFar(String amount) {
    return 'Questo mese finora: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Conteggio token, esportazione JSON';

  @override
  String get peopleHelp => 'Invita persone e decidi chi entra.';

  @override
  String get peopleRow => 'Invita persone, approva richieste, vedi membri';

  @override
  String get qrCode => 'Codice QR';

  @override
  String get remove => 'Rimuovi';

  @override
  String get resendInvite => 'Invia di nuovo';

  @override
  String get resetLink => 'Reimposta link';

  @override
  String get resetLinkHelp =>
      'Il link attuale smette subito di funzionare e ne ottieni uno nuovo. Chi è già dentro resta dentro.';

  @override
  String get revokeInvite => 'Annulla invito';

  @override
  String scanToJoin(String name) {
    return 'Scansiona per unirti a $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Invia $countString inviti';
  }

  @override
  String get sendInvitesYourself => 'Invia questi inviti personalmente';

  @override
  String get sendInvitesYourselfHelp =>
      'L\'email non è configurata su questo server. Invia a ciascuno il proprio link: accederanno con quell\'indirizzo per unirsi.';

  @override
  String get signInToJoin => 'Accedi per unirti';

  @override
  String get startOwnWorkspace => 'Crea invece il mio spazio di lavoro';

  @override
  String switchToServer(String host) {
    return 'Passa a $host';
  }

  @override
  String get waitingToJoin => 'In attesa di unirsi';

  @override
  String welcomeToWorkspace(String name) {
    return 'Ti diamo il benvenuto in $name';
  }

  @override
  String get workspacesYouCanJoin => 'Spazi di lavoro a cui puoi unirti';

  @override
  String get yourTeamIsHere => 'Il tuo team è già qui';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Le persone su $domain usano questi spazi di lavoro. Unisciti a uno oppure creane uno tuo.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Facile da leggere o digitare. Funziona per 48 ore. Si inserisce in Unisciti con un link o un codice.';

  @override
  String get inviteSomeoneNew =>
      'Invita qualcuno di nuovo nello spazio di lavoro';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app effettua l’accesso solo su un indirizzo sicuro (https), mentre questo server Casama si trova su $address. Servi Casama su https per usare l’accesso.';
  }

  @override
  String get aboutYou => 'Su di te';

  @override
  String get aboutYouRow => 'Come ti chiamano i tuoi bot e cosa sanno di te';

  @override
  String get aboutYouIntro =>
      'I tuoi bot leggono queste informazioni per chiamarti per nome e rispondere come preferisci. Solo tu puoi vederle.';

  @override
  String get photoChange => 'Cambia foto profilo';

  @override
  String get photoTake => 'Scatta una foto';

  @override
  String get photoChoose => 'Scegli una foto';

  @override
  String get photoUseGoogle => 'Usa la mia foto Google';

  @override
  String get photoRemove => 'Rimuovi foto';

  @override
  String get photoUnreadable =>
      'Questo file non è una foto utilizzabile da Casama. Prova con un JPEG o PNG.';

  @override
  String get whatToCallYou => 'Come devono chiamarti i bot?';

  @override
  String get pronounsOptional => 'Pronomi (facoltativo)';

  @override
  String get aboutMe => 'Su di me';

  @override
  String get aboutMeHint =>
      'Il tuo lavoro, le persone della tua vita, le tue passioni. Tutto ciò che aiuta.';

  @override
  String get replyStyle => 'Come preferisco le risposte';

  @override
  String get replyStyleHint =>
      'Ad esempio: risposte brevi, niente emoji, spiega le cose come se non le conoscessi';

  @override
  String get learnAboutMe => 'Impara su di me dalle chat';

  @override
  String get learnAboutMeHelp =>
      'I bot salvano informazioni su di te. Puoi modificarle in qualsiasi momento.';

  @override
  String get adultSites => 'Siti per adulti';

  @override
  String get adultSitesHelp =>
      'I bot possono aprire siti web per adulti quando lo chiedi. Solo dai 18 anni in su.';

  @override
  String get adultSitesConfirmTitle => 'Attivare i siti per adulti?';

  @override
  String get adultSitesConfirmBody =>
      'Confermi di avere almeno 18 anni. Quando lo chiedi, i bot possono aprire siti web per adulti per te ed elencarne i contenuti come testo. Funziona quando lo chiedi da Casama sul web o dall’app desktop, mai nelle chat condivise.';

  @override
  String get adultSitesConfirm => 'Ho almeno 18 anni';

  @override
  String get adultSitesApprovalDetail =>
      'Scegliendo Consenti confermi di avere almeno 18 anni e attivi i siti per adulti per il tuo account. Puoi disattivarli in Su di te.';

  @override
  String useInThisSpace(String workspace) {
    return 'Usa ciò che ho condiviso in $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Disattivo: qui vengono usati solo il tuo nome e lo stile di risposta.';

  @override
  String get learnedAboutYou => 'Cosa hanno imparato i bot';

  @override
  String get noLearnedFacts =>
      'Ancora nulla. Le informazioni che i bot imparano su di te in chat appaiono qui.';

  @override
  String get addFact => 'Aggiungi un’informazione';

  @override
  String get editFact => 'Modifica informazione';

  @override
  String get deleteFactTitle => 'Eliminare questa informazione?';

  @override
  String get deleteFactConfirm => 'I tuoi bot non la sapranno più.';

  @override
  String get importToProfile => 'Importa da ChatGPT o Claude';

  @override
  String get savedToProfile => 'Salvato nel tuo profilo';

  @override
  String get undo => 'Annulla';

  @override
  String get suggestedLookApplied => 'Nuovo tema applicato';

  @override
  String get suggestedLookUnavailable => 'Questa app non ha quel tema';

  @override
  String get removedFromProfile => 'Rimosso dal tuo profilo';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aggiunte $countString informazioni',
      one: 'Aggiunta 1 informazione',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'I tuoi bot lo useranno in ogni spazio di lavoro. Puoi cambiarlo più tardi in Impostazioni → Su di te.';

  @override
  String get nameStepBubble => 'Piacere di conoscerti!';

  @override
  String get heardFromTitle => 'Come hai saputo di noi?';

  @override
  String get heardFromHelp =>
      'Un tocco ci aiuta a capire cosa funziona. Puoi saltarlo.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Un amico';

  @override
  String get heardFromSearch => 'Ricerca';

  @override
  String get heardFromAiAssistant => 'Un assistente IA';

  @override
  String get heardFromOther => 'Altro';

  @override
  String get heardFromSkip => 'Salta';

  @override
  String get nameStepHint => 'Il tuo nome';

  @override
  String get skillCatalogSubtitle =>
      'Competenze pronte all’uso che i tuoi bot caricano quando un’attività lo richiede.';

  @override
  String get skillCategoryWork => 'Lavoro';

  @override
  String get skillCategoryWriting => 'Scrittura';

  @override
  String get skillCategoryResearch => 'Ricerca';

  @override
  String get skillCategoryData => 'Dati';

  @override
  String get skillCategoryMoney => 'Denaro';

  @override
  String get skillCategoryBuild => 'Sviluppo';

  @override
  String get skillCategoryLife => 'Vita quotidiana';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString competenze',
      one: '1 competenza',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Installata';

  @override
  String skillInstalledFor(String names) {
    return 'Installata per $names';
  }

  @override
  String installSkillFor(String name) {
    return 'Installa $name per';
  }

  @override
  String skillUseHint(String name) {
    return 'I bot la caricano da soli quando serve per un’attività, oppure scrivi /$name in chat per usarla.';
  }

  @override
  String get skillInstructions => 'Istruzioni';

  @override
  String get skillAlreadyEverywhere => 'Installata ovunque sia possibile.';

  @override
  String get gallery => 'Galleria';

  @override
  String get galleryEmpty => 'Nessuna corrispondenza nella galleria.';

  @override
  String get galleryOffline =>
      'Al momento la galleria non è raggiungibile. Gli stili e le competenze integrati sono comunque qui.';

  @override
  String get galleryUse => 'Usa';

  @override
  String get galleryInstall => 'Installa';

  @override
  String get galleryReport => 'Segnala';

  @override
  String get galleryShare => 'Condividi nella galleria';

  @override
  String galleryBy(String name) {
    return 'Di $name';
  }

  @override
  String get galleryFeatured => 'In evidenza';

  @override
  String get galleryAll => 'Tutto';

  @override
  String get galleryThemes => 'Temi';

  @override
  String get gallerySchemes => 'Colori';

  @override
  String get galleryWallpapers => 'Sfondi';

  @override
  String get gallerySkills => 'Competenze';

  @override
  String get fromGallery => 'Galleria';

  @override
  String galleryApplied(String name) {
    return 'In uso: $name';
  }

  @override
  String get gallerySeeAll => 'Vedi tutto';

  @override
  String get galleryInUse => 'In uso';

  @override
  String galleryInstalled(String name) {
    return '$name installato';
  }

  @override
  String get galleryPreviewDark => 'Anteprima scura';

  @override
  String get galleryPreviewLight => 'Anteprima chiara';

  @override
  String get galleryClearSearch => 'Cancella ricerca';

  @override
  String get galleryOfflineTitle => 'La galleria è offline';

  @override
  String galleryNoMatches(String query) {
    return 'Nessun risultato per “$query”';
  }

  @override
  String get galleryInstructions => 'Istruzioni';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern su $palette';
  }

  @override
  String get galleryImage => 'Immagine';

  @override
  String get galleryMeshGradient => 'una sfumatura mesh';

  @override
  String get galleryOwnDoodles => 'I propri disegni';

  @override
  String get galleryLightAndDark => 'Chiaro e scuro';

  @override
  String get galleryContribute =>
      'Hai creato uno stile che ti piace? Condividilo e tutti su Casama potranno trovarlo qui.';

  @override
  String get galleryTypeTheme => 'Tema';

  @override
  String get galleryTypeScheme => 'Combinazione di colori';

  @override
  String get galleryTypeWallpaper => 'Sfondo';

  @override
  String get galleryTypeSkill => 'Competenza';

  @override
  String get galleryBehindChats => 'Dietro le tue chat';

  @override
  String celebrateNewBot(String name) {
    return 'Saluta $name!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name è pronto!';
  }

  @override
  String get celebrateJoined => 'Ci sei! Ti diamo il benvenuto nello spazio.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name è tutto pronto.';
  }

  @override
  String get fewerEffects => 'Meno effetti';

  @override
  String get fewerEffectsHelp =>
      'Niente festeggiamenti, schede che rimbalzano o bot animati.';

  @override
  String get haptics => 'Feedback aptico';

  @override
  String get trackpadHaptics => 'Feedback aptico del trackpad';

  @override
  String get hapticsHelp =>
      'Leggeri tocchi quando succede qualcosa o un bot ha bisogno di te.';

  @override
  String get watchHaptics => 'Feedback aptico';

  @override
  String get settingsAppSection => 'App';

  @override
  String get settingsSecuritySection => 'Accesso e sicurezza';

  @override
  String get customize => 'Personalizza';

  @override
  String get customizeColors => 'Colori';

  @override
  String get appearanceCustomLook => 'Tema personalizzato';

  @override
  String get appearanceCustomHelp =>
      'Le tue modifiche. Salvale come tema per conservarle.';

  @override
  String get appearanceFromGallery => 'Dalla galleria';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Mostra tutti ($countString)';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Passato a $name';
  }

  @override
  String appearanceSaved(String name) {
    return '$name salvato nei tuoi temi';
  }

  @override
  String get appearanceAboutTheme => 'Informazioni su questo tema';

  @override
  String settingsOnDevServer(String host) {
    return 'Impostazioni · server di sviluppo $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Tu: $text';
  }

  @override
  String get chatPreviewPhoto => 'Foto';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Nota vocale';

  @override
  String get chatPreviewNone => 'Ancora nessun messaggio';

  @override
  String get chatTimeYesterday => 'Ieri';

  @override
  String get chatDayToday => 'Oggi';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day alle $time';
  }

  @override
  String get anyPriority => 'Qualsiasi priorità';

  @override
  String get readingAloud => 'Lettura ad alta voce';

  @override
  String get readAloudPreparing => 'Preparazione…';

  @override
  String get readAloudPaused => 'In pausa';

  @override
  String get stopReading => 'Interrompi lettura';

  @override
  String get readAloudSpeed => 'Velocità di riproduzione';

  @override
  String readAloudTimeLeft(String time) {
    return '$time rimanenti';
  }

  @override
  String get readAloudShowMessage => 'Mostra il messaggio letto';

  @override
  String mentionOpenProfile(String name) {
    return '$name, apri profilo';
  }

  @override
  String get paywallSubtitle =>
      'Più bot, più tempo computer e nuovi crediti ogni mese, così i tuoi bot possono continuare a lavorare.';

  @override
  String get paywallPerkBots => 'Bot';

  @override
  String get paywallPerkBotsBody =>
      'Un’intera squadra, ciascuno con il proprio ruolo.';

  @override
  String get paywallPerkComputers => 'Tempo computer';

  @override
  String get paywallPerkComputersBody =>
      'I bot hanno i propri computer per navigare, scrivere codice e creare.';

  @override
  String get paywallPerkCredits => 'Crediti mensili';

  @override
  String get paywallPerkCreditsBody => 'Per modelli, ricerche e strumenti.';

  @override
  String get paywallPerkSeats => 'Posti';

  @override
  String get paywallPerkSeatsBody =>
      'Porta il tuo team nello stesso spazio di lavoro.';

  @override
  String paywallHours(String hours) {
    return '$hours h';
  }

  @override
  String get paywallWeekly => 'Settimanale';

  @override
  String get paywallMonthly => 'Mensile';

  @override
  String get paywallYearly => 'Annuale';

  @override
  String get paywallPerMonth => '/ mese';

  @override
  String get paywallPerYear => '/ anno';

  @override
  String get paywallContinue => 'Continua';

  @override
  String get paywallContinueCheckout => 'Vai al pagamento';

  @override
  String get paywallRestore => 'Ripristina';

  @override
  String get paywallFineStore =>
      'Rinnovo automatico. Annulla in qualsiasi momento dalle impostazioni dello store.';

  @override
  String get paywallFineWeb =>
      'Rinnovo automatico. Annulla in qualsiasi momento da Fatturazione.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, con rinnovo automatico finché non annulli. Il pagamento viene addebitato sul tuo Apple Account. Puoi annullare in qualsiasi momento dalle impostazioni del tuo Apple Account almeno 24 ore prima del rinnovo.',
      'google_play':
          '$price, con rinnovo automatico finché non annulli. Il pagamento viene addebitato sul tuo account Google Play. Puoi annullare in qualsiasi momento dalle impostazioni del tuo account Google Play almeno 24 ore prima del rinnovo.',
      'other':
          '$price, con rinnovo automatico finché non annulli. Il pagamento viene addebitato sul tuo account dello store. Puoi annullare in qualsiasi momento dalle impostazioni del tuo account dello store almeno 24 ore prima del rinnovo.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis per $days giorni, poi $price, con rinnovo automatico finché non annulli.',
      one:
          'Gratis per 1 giorno, poi $price, con rinnovo automatico finché non annulli.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis per $days giorni, poi $price, con rinnovo automatico finché non annulli.',
      one:
          'Gratis per 1 giorno, poi $price, con rinnovo automatico finché non annulli.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis per $days giorni, poi $price, con rinnovo automatico finché non annulli.',
      one:
          'Gratis per 1 giorno, poi $price, con rinnovo automatico finché non annulli.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Il pagamento viene addebitato sul tuo Apple Account al termine della prova. Annulla nelle impostazioni del tuo Apple Account almeno 24 ore prima della fine della prova e non ti verrà addebitato nulla.',
      'google_play':
          '$_temp1 Il pagamento viene addebitato sul tuo account Google Play al termine della prova. Annulla nelle impostazioni del tuo account Google Play almeno 24 ore prima della fine della prova e non ti verrà addebitato nulla.',
      'other':
          '$_temp2 Il pagamento viene addebitato sul tuo account dello store al termine della prova. Annulla nelle impostazioni del tuo account dello store almeno 24 ore prima della fine della prova e non ti verrà addebitato nulla.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Inizia la prova gratuita';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni gratis, poi $price/anno',
      one: '1 giorno gratis, poi $price/anno',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni gratis, poi $price/mese',
      one: '1 giorno gratis, poi $price/mese',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, con rinnovo automatico finché non annulli. Annulla in qualsiasi momento da Fatturazione; mantieni il piano fino alla fine del periodo.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis per $days giorni, poi $price, con rinnovo automatico finché non annulli.',
      one:
          'Gratis per 1 giorno, poi $price, con rinnovo automatico finché non annulli.',
    );
    return '$_temp0 Annulla da Fatturazione prima della fine della prova e non ti verrà addebitato nulla.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price a settimana',
      'year': '$price all’anno',
      'other': '$price al mese',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Condizioni d’uso';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get aiConsentTitle => 'Le tue chat vengono inviate a società di IA';

  @override
  String get aiConsentBody =>
      'Per scrivere le risposte, Casama invia ciò che condividi con i tuoi bot a fornitori IA esterni. Nulla viene inviato finché non accetti.';

  @override
  String get aiConsentUpdatedNotice =>
      'Abbiamo aggiunto le pagine web a questo elenco.';

  @override
  String get aiConsentWhatTitle => 'Cosa viene inviato';

  @override
  String get aiConsentWhat =>
      'I tuoi messaggi, file e foto, la tua voce nelle chiamate, i messaggi vocali e la dettatura, ciò che i bot ricordano di te, le pagine web che i tuoi bot aprono per te (sul proprio computer o nel browser su questo dispositivo) e qualsiasi dato del telefono che attivi, come calendario o salute.';

  @override
  String get aiConsentWhoTitle => 'Chi lo riceve';

  @override
  String get aiConsentWho =>
      'OpenRouter, che lo passa all’azienda che realizza il modello che usi, come DeepSeek, Google o OpenAI. Le chiamate usano Google Gemini, mentre OpenAI trasforma in testo i messaggi vocali e la dettatura. Le ricerche web vanno a Parallel, Serper o DeepSeek. Con le tue chiavi API, va invece a quel fornitore.';

  @override
  String get aiConsentWhyTitle => 'Cosa ne fanno';

  @override
  String get aiConsentWhy =>
      'Lo usano per scrivere la risposta. Puoi interrompere questa condivisione in qualsiasi momento in Impostazioni › Privacy; l’informativa sulla privacy contiene i dettagli.';

  @override
  String get aiConsentAgree => 'Accetto e continuo';

  @override
  String get aiConsentTile => 'Fornitori IA';

  @override
  String get aiConsentTileOn =>
      'Consentito. Ciò che condividi con i bot viene inviato a fornitori IA esterni per scrivere le risposte.';

  @override
  String get aiConsentWithdrawQuestion =>
      'Interrompere la condivisione con i fornitori IA?';

  @override
  String get aiConsentWithdrawBody =>
      'Senza questi fornitori i bot non possono rispondere. Casama chiede di nuovo prima che venga inviato qualsiasi altro dato.';

  @override
  String get aiConsentWithdraw => 'Interrompi condivisione';

  @override
  String get planChanged => 'Piano modificato';

  @override
  String get purchasesRestored => 'Acquisti ripristinati';

  @override
  String get creditsAdded => 'Crediti aggiunti';

  @override
  String get purchasePending =>
      'In attesa dell’approvazione dell’acquisto. Verrà aggiunto non appena approvato.';

  @override
  String get purchaseFailed =>
      'L’acquisto non è andato a buon fine e non ti è stato addebitato nulla.';

  @override
  String get purchaseVerifyFailed =>
      'Non siamo ancora riusciti a confermare il tuo acquisto. Riproveremo automaticamente; se non compare a breve, tocca Ripristina acquisti.';

  @override
  String paywallTitleFor(String plan) {
    return 'Fai crescere la tua squadra con $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Ti diamo il benvenuto in $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mesi gratis',
      one: '1 mese gratis',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Passa a $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Il tuo abbonamento è gestito dall’App Store. Per cambiare piano, usa l’App Store sul dispositivo con cui hai sottoscritto l’abbonamento.',
      'google_play': 'Il tuo abbonamento è gestito da Google Play. Per cambiare piano, usa Google Play sul dispositivo con cui hai sottoscritto l’abbonamento.',
      'other': 'Il tuo abbonamento è gestito da uno store di app. Per cambiare piano, usa quello store sul dispositivo con cui hai sottoscritto l’abbonamento.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Sei abbonato sul web. Cambia piano qui con il pagamento web oppure gestisci il tuo abbonamento.';

  @override
  String get subscribedOutsideAppNote =>
      'Il tuo abbonamento è fatturato al di fuori di questa app, quindi non può essere modificato qui.';

  @override
  String get outOfCreditsTitle => 'Hai finito i crediti';

  @override
  String get outOfCreditsPaidBody =>
      'I tuoi bot restano in pausa finché non aggiungi crediti. I pacchetti di crediti dell\'App Store o di Google Play non scadono mai; i pacchetti di crediti acquistati sul web durano 12 mesi.';

  @override
  String get outOfCreditsFreeBody =>
      'Passa a un piano superiore per avere più crediti ogni mese, più bot e più tempo computer.';

  @override
  String get addCredits => 'Aggiungi crediti';

  @override
  String get seePlansButton => 'Vedi i piani';

  @override
  String get paywallAskAdmin =>
      'Solo i proprietari e gli amministratori dello spazio di lavoro possono cambiare il piano. Chiedi a uno di loro di passare a un piano superiore.';

  @override
  String get upgradeToPro => 'Passa a Pro';

  @override
  String get upgradeToProBody => 'Più bot, tempo computer e crediti mensili.';

  @override
  String get manageTab => 'Gestisci';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Memoria';

  @override
  String get vitalsDisk => 'Disco';

  @override
  String get fixItTitle => 'Qualcosa non va?';

  @override
  String get fixItSubtitle =>
      'Prova questi passaggi in ordine. Ognuno spinge un po’ più a fondo il ripristino.';

  @override
  String get fixRestart => 'Riavvia';

  @override
  String get fixRestartHelp => 'Circa 20 secondi · non perdi nulla';

  @override
  String get fixResetSystem => 'Ripristina sistema';

  @override
  String get fixResetSystemHelp => 'Un sistema nuovo · i tuoi file restano';

  @override
  String get fixErase => 'Cancella tutto';

  @override
  String get fixEraseHelp => 'Come nuovo · annullabile per 7 giorni';

  @override
  String get fixResetAction => 'Ripristina…';

  @override
  String get fixEraseAction => 'Cancella…';

  @override
  String get computerRestarting => 'Riavvio…';

  @override
  String get computerRestarted => 'Riavviato. I tuoi file ci sono tutti.';

  @override
  String get computerUpdateTitle => 'Aggiornamento disponibile';

  @override
  String get computerUpdateBody =>
      'Sono pronti nuovi strumenti e correzioni. L’aggiornamento riavvia questo computer: i tuoi file restano, le finestre aperte e i programmi in esecuzione si chiudono.';

  @override
  String get computerUpdateBotWorking =>
      'Un bot sta lavorando su questo computer in questo momento. L’aggiornamento interromperà ciò che sta facendo.';

  @override
  String get computerUpdateNow => 'Aggiorna ora';

  @override
  String get computerUpdateLater => 'Più tardi';

  @override
  String get computerUpdateConfirmTitle => 'Aggiornare questo computer?';

  @override
  String get computerUpdateMenu => 'Aggiorna computer';

  @override
  String get computerUpdating => 'Aggiornamento…';

  @override
  String get computerUpdated => 'Aggiornato. I tuoi file ci sono tutti.';

  @override
  String get computerUpdateBusyTitle => 'Un comando è ancora in esecuzione';

  @override
  String get computerUpdateBusyBody =>
      'Aggiornare ora lo interrompe. Attendi che finisca oppure aggiorna comunque.';

  @override
  String get computerUpdateAnyway => 'Aggiorna comunque';

  @override
  String resetSheetTitle(String name) {
    return 'Ripristina $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots non potranno usarlo per circa un minuto.';
  }

  @override
  String get resetSheetBusyNone =>
      'Non potrà essere usato per circa un minuto.';

  @override
  String get resetOptionSystem => 'Ripristina sistema, mantieni i miei file';

  @override
  String get resetOptionSystemHelp =>
      'Corregge installazioni danneggiate, impostazioni e programmi bloccati.';

  @override
  String get resetOptionErase => 'Cancella tutto';

  @override
  String get resetOptionEraseHelp => 'Torna a un computer nuovo di zecca.';

  @override
  String get resetKept => 'Mantenuti';

  @override
  String get resetRemoved => 'Rimossi';

  @override
  String get resetKeptFiles => 'I tuoi file nella cartella workspace';

  @override
  String get resetKeptSettings => 'Nome, impostazioni e bot';

  @override
  String get resetKeptRestorePoints => 'Punti di ripristino';

  @override
  String get resetRemovedApps => 'App e strumenti che hai installato';

  @override
  String get resetRemovedPrograms => 'Programmi in esecuzione';

  @override
  String get resetRemovedCaches => 'Cache e impostazioni della cartella home';

  @override
  String get resetRemovedFiles => 'Tutti i file, compreso lo spazio di lavoro';

  @override
  String get resetSavePoint => 'Salva prima un punto di ripristino';

  @override
  String get resetSavePointHelp =>
      'Così puoi annullare l’operazione per 7 giorni';

  @override
  String eraseTypeName(String name) {
    return 'Digita $name per confermare';
  }

  @override
  String get resetConfirmSystem => 'Ripristina sistema';

  @override
  String get resetConfirmErase => 'Cancella tutto';

  @override
  String get resetStepSaving => 'Salvataggio di un punto di ripristino';

  @override
  String get resetStepWipingSystem => 'Rimozione di app e impostazioni';

  @override
  String get resetStepWipingErase => 'Cancellazione di tutti i file';

  @override
  String get resetStepRestarting => 'Avvio di un sistema nuovo';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Ripristino… $stepString di $totalString';
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

    return 'Cancellazione… $stepString di $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Puoi lasciare questa schermata. Continua da solo.';

  @override
  String get resetDone => 'Sistema nuovo pronto';

  @override
  String get eraseDone => 'Computer cancellato';

  @override
  String get resetFailed => 'Il ripristino non è stato completato';

  @override
  String get resetUndoHint =>
      'Annulla rimette tutto com’era prima. Il punto di ripristino resta disponibile per 7 giorni.';

  @override
  String get restoredPrevious => 'Ripristinato com’era prima';

  @override
  String get usageThisMonth => 'Questo mese';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString h $minutesString min';
  }

  @override
  String get usageCostNote =>
      'Viene addebitato solo mentre è acceso. In sospensione non costa nulla.';

  @override
  String get usageNone => 'Non ancora usato questo mese';

  @override
  String get sleepTimerTitle => 'Va in sospensione dopo';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString min';
  }

  @override
  String get sleepTimerHour => '1 ora';

  @override
  String get sleepTimerHelp =>
      'Mai mentre un bot sta lavorando o lo stai usando. Un’attesa più lunga lo tiene acceso più a lungo e costa di più.';

  @override
  String sleepTimerSaved(String label) {
    return 'Va in sospensione dopo $label di inattività';
  }

  @override
  String get storageTitle => 'Spazio';

  @override
  String storageOf(String total) {
    return 'di $total';
  }

  @override
  String get storageFiles => 'I tuoi file';

  @override
  String get storageApps => 'App e strumenti';

  @override
  String get storageCaches => 'Cache';

  @override
  String get storageBrowser => 'Browser';

  @override
  String get storageOther => 'Altro';

  @override
  String get storageFree => 'Libero';

  @override
  String storageFreeUp(String size) {
    return 'Libera $size';
  }

  @override
  String get storageNothingToClean => 'Nessuna cache da svuotare';

  @override
  String storageFreed(String size) {
    return 'Liberati $size';
  }

  @override
  String get storageAsleep =>
      'Riattiva il computer per vedere cosa occupa spazio.';

  @override
  String get processesTitle => 'In esecuzione ora';

  @override
  String get processesNone =>
      'Non c’è niente in esecuzione oltre al computer stesso.';

  @override
  String get processesAsleep =>
      'Nulla è in esecuzione mentre è in sospensione.';

  @override
  String get processStop => 'Ferma';

  @override
  String processStopTitle(String name) {
    return 'Fermare $name?';
  }

  @override
  String get processStopMessage =>
      'Tutto ciò che non è stato salvato andrà perso.';

  @override
  String processStopped(String name) {
    return 'Fermato $name';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu% CPU · $memory';
  }

  @override
  String get usedByTitle => 'Usato da';

  @override
  String get usedByNone => 'Nessun bot usa ancora questo computer.';

  @override
  String botLastActive(String when) {
    return 'Attivo $when';
  }

  @override
  String get botNeverActive => 'Non ancora attivo';

  @override
  String get restorePointsTitle => 'Punti di ripristino';

  @override
  String get restorePointsNone =>
      'Ancora nessuno. I bot ne salvano uno prima di modifiche rischiose.';

  @override
  String get restorePointSaveNow => 'Salva subito un punto di ripristino';

  @override
  String get restorePointSaveTitle => 'Salva un punto di ripristino';

  @override
  String get restorePointDefaultLabel => 'Salvato manualmente';

  @override
  String get restorePointSaved => 'Punto di ripristino salvato';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Mostra tutti ($nString)';
  }

  @override
  String get historyTitle => 'Cronologia';

  @override
  String get historyNone => 'Non è ancora successo nulla.';

  @override
  String get historyStarted => 'Si è riattivato';

  @override
  String get historySlept => 'È andato in sospensione';

  @override
  String get historySleptIdle => 'È andato in sospensione (nessuna attività)';

  @override
  String get historyRestarted => 'Riavviato';

  @override
  String get historyReset => 'Sistema ripristinato';

  @override
  String get historyErased => 'Tutto cancellato';

  @override
  String get historyCheckpointCreated => 'Salvato un punto di ripristino';

  @override
  String get historyCheckpointRestored => 'Ripristinato un punto di ripristino';

  @override
  String historyStorageCleaned(String size) {
    return 'Liberati $size';
  }

  @override
  String get historyStorageCleanedPlain => 'Liberato spazio';

  @override
  String historyProcessStopped(String name) {
    return 'Fermato $name';
  }

  @override
  String get historyUpdated => 'Impostazioni modificate';

  @override
  String get historyYou => 'tu';

  @override
  String get yourDataTitle => 'I tuoi dati';

  @override
  String get downloadAllFiles => 'Scarica tutti i file';

  @override
  String get downloadAllFilesHelp =>
      'Un file .zip con tutto ciò che si trova nello spazio di lavoro';

  @override
  String get downloadNothing => 'Non ci sono ancora file da scaricare.';

  @override
  String get deleteComputerHelp =>
      'Lo rimuove insieme ai suoi punti di ripristino';

  @override
  String get manageComputer => 'Gestisci';

  @override
  String get restartComputer => 'Riavvia';

  @override
  String get resetComputerMenu => 'Ripristina…';

  @override
  String get moreFixes => 'Altre soluzioni';

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

    return '$nString g';
  }

  @override
  String get remoteUpdateTitle => 'È ora di aggiornare Casama';

  @override
  String get remoteUpdateBody =>
      'Questa versione di Casama non è più supportata. Aggiornala per continuare.';

  @override
  String get remoteUpdateNoLink =>
      'Questa versione di Casama non è più supportata. Aggiornala da dove l’hai installata.';

  @override
  String get remoteMaintenanceTitle => 'Casama è in manutenzione';

  @override
  String get openLink => 'Apri';

  @override
  String get routineIdeas => 'Idee';

  @override
  String get routineIdeasHelp =>
      'Parti da un’idea, poi modifica tutto quello che vuoi.';

  @override
  String get pluginDirectory => 'Plugin verificati';

  @override
  String get pluginDirectoryHelp =>
      'Controllati da Casama e bloccati alla versione verificata.';

  @override
  String get pluginOrPaste => 'Oppure aggiungine uno da un link GitHub';

  @override
  String byAuthor(String name) {
    return 'Di $name';
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
  String get paywallBillingPeriod => 'Periodo di fatturazione';

  @override
  String get paywallNotSoldTitle => 'Nessun piano su questo server';

  @override
  String get paywallNotSoldBody =>
      'Questo server non vende piani, quindi non c’è nessun piano superiore a cui passare.';

  @override
  String get paywallPlansFailedTitle => 'Impossibile caricare i piani';

  @override
  String get paywallPlansFailedBody => 'Controlla la connessione, poi riprova.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'L’App Store non mostra i piani',
      'google_play': 'Google Play non mostra i piani',
      'other': 'Lo store non mostra i piani',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Assicurati di aver effettuato l’accesso all’App Store su questo dispositivo, poi riprova.',
      'google_play': 'Assicurati di aver effettuato l’accesso a Google Play su questo dispositivo, poi riprova.',
      'other': 'Assicurati di aver effettuato l’accesso allo store su questo dispositivo, poi riprova.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Risparmia fino al $pct%';
  }

  @override
  String get paywallMostPopular => 'Più scelto';

  @override
  String get paywallTaglinePlus => 'Per te e un gruppetto di bot';

  @override
  String get paywallTaglinePro => 'Per una squadra attiva e un piccolo team';

  @override
  String get paywallTaglineMax => 'Per team con bot al lavoro tutto il giorno';

  @override
  String get paywallPerMonthShort => '/mese';

  @override
  String paywallBilledYearly(String price) {
    return '$price con fatturazione annuale';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Equivale a $price/mese';
  }

  @override
  String get paywallBilledMonthly => 'Fatturazione mensile';

  @override
  String get paywallBilledWeekly => 'Fatturazione settimanale';

  @override
  String get paywallPerWeekShort => '/sett.';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Sono $price a settimana';
  }

  @override
  String get paywallBilledYearlyPlain => 'Fatturazione annuale';

  @override
  String get paywallPerYearShort => '/anno';

  @override
  String paywallStartTrial(int n) {
    return 'Inizia la prova gratuita di $n giorni';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'Abbonati a $plan e paga';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count persone',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString ore di computer';
  }

  @override
  String paywallFactRuns(int runs, String credits) {
    final intl.NumberFormat runsNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String runsString = runsNumberFormat.format(runs);

    return 'Circa $runsString risposte al mese ($credits)';
  }

  @override
  String get billingChangePlan => 'Cambia piano';

  @override
  String get billingChangePlanBody =>
      'Confronta tutti i piani, mensili o annuali.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'Cosa ottieni con $plan';
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
  String get updatesRow => 'Aggiornamenti';

  @override
  String get updatesRowSubtitle => 'Novità dal tuo spazio di lavoro';

  @override
  String get updatesEmpty => 'Nessun aggiornamento';

  @override
  String get updatesEmptyHelp =>
      'Gli avvisi dello spazio di lavoro e le nuove pagine appaiono qui. Quello che ti inviano i tuoi bot si trova nelle loro chat.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cose in attesa',
      one: '1 cosa in attesa',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Al lavoro su: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Non ora: $title';
  }

  @override
  String openTopic(String title) {
    return 'Apri $title';
  }

  @override
  String get newTopic => 'Nuovo argomento';

  @override
  String get topics => 'Argomenti';

  @override
  String get olderTopics => 'Meno recenti';

  @override
  String get generalChat => 'Generale';

  @override
  String get allTopics => 'Tutti gli argomenti';

  @override
  String get cardSecrets => 'Segreti';

  @override
  String get cardApproval => 'Approvazione';

  @override
  String get cardTakeover => 'Prendi il controllo';

  @override
  String get cardDevice => 'Accesso al dispositivo';

  @override
  String get cardSuggestion => 'Suggerimento';

  @override
  String get formBack => 'Indietro';

  @override
  String get formNext => 'Avanti';

  @override
  String get formSkip => 'Salta';

  @override
  String formStep(int n, int total) {
    return 'Domanda $n di $total';
  }

  @override
  String get cardSuggestions => 'Suggerimenti';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Trovati $n elementi da vedere',
      one: 'Trovato 1 elemento da vedere',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Avviato $when';
  }

  @override
  String get suggestionStartedPlain => 'Avviato';

  @override
  String get suggestionPutAway => 'Accantona';

  @override
  String get suggestionExpired => 'Scaduto';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Scaduto: $title';
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
      other: 'Scade tra $nString minuti',
      one: 'Scade tra 1 minuto',
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
      other: 'Scade tra $nString ore',
      one: 'Scade tra 1 ora',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n suggerimenti gestiti',
      one: '1 suggerimento gestito',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Usa questo server sul telefono';

  @override
  String get linkIntro =>
      'Assegna a questo server un indirizzo raggiungibile dal telefono ovunque ti trovi. Nessun dominio e nessuna impostazione del router.';

  @override
  String get linkIntroDetails =>
      'Collega questo server a un account Casama Cloud gratuito. Il traffico del telefono passa attraverso Cloudflare direttamente a questo computer, mai dai server di Casama.';

  @override
  String get linkTurnOn => 'Usa sul telefono';

  @override
  String get linkSignupsNote =>
      'Le nuove iscrizioni restano chiuse mentre è attivo. Solo chi ha già un account qui può accedere.';

  @override
  String get linkStepSignIn => 'Collega questo server';

  @override
  String get linkSignInBody =>
      'Approva questo codice nella pagina appena aperta nel browser. Controlla che la pagina mostri lo stesso codice.';

  @override
  String get linkSignInOpen => 'Apri di nuovo la pagina';

  @override
  String get linkStepAddress => 'Ottieni un indirizzo';

  @override
  String get linkStepRestart => 'Riavvia il server';

  @override
  String get linkStepConnect => 'Connetti';

  @override
  String get linkStateOnline => 'Online';

  @override
  String get linkStateStarting => 'Avvio';

  @override
  String get linkStateOffline => 'Offline';

  @override
  String get linkStateAttention => 'Richiede attenzione';

  @override
  String get linkStateOff => 'Disattivo';

  @override
  String get linkAddress => 'Indirizzo';

  @override
  String get linkLocalAddress => 'Su questo computer';

  @override
  String get linkShowCode => 'Mostra codice di accesso';

  @override
  String get linkCheck => 'Controlla di nuovo';

  @override
  String get linkTurnOff => 'Disattiva';

  @override
  String get linkTurnOffConfirm =>
      'Disattivare l’accesso remoto? L’indirizzo smetterà di funzionare e i telefoni perderanno questo server finché non lo riattiverai. Riceverà di nuovo lo stesso indirizzo.';

  @override
  String get linkTurningOff => 'Disattivazione';

  @override
  String get linkNeedsOwner =>
      'Solo il proprietario di questo server può attivarlo.';

  @override
  String get linkTwoStepTip =>
      'Questo server è ora raggiungibile da Internet. L’accesso in due passaggi fa sì che indovinare la password non basti.';

  @override
  String get linkProblemNotLinked =>
      'Questo server non è collegato a Casama Cloud. Riattivalo per collegarlo.';

  @override
  String get linkProblemCloudUnreachable =>
      'Al momento Casama Cloud non è raggiungibile. Se l’indirizzo funzionava, continua a funzionare.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud non accetta più la chiave di questo server. Riattivalo per collegarlo.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud ha disattivato l’accesso remoto per questo server.';

  @override
  String get linkProblemRemoved =>
      'Questo server è stato rimosso dal suo spazio di lavoro in Casama Cloud. Riattivalo per collegarlo.';

  @override
  String get linkProblemPlanLimit =>
      'Il tuo piano Casama Cloud collega meno server. Rimuovine uno lì oppure passa a un piano superiore.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud non ha più un indirizzo per questo server. Riattivalo.';

  @override
  String get linkProblemAddressChanged =>
      'L’indirizzo di questo server è cambiato. Riattivalo per usare quello nuovo.';

  @override
  String get connectProblemConnectorMissing =>
      'Il connettore non è in esecuzione. Verifica che Docker sia avviato, poi controlla di nuovo.';

  @override
  String get connectProblemConnectorBlocked =>
      'Questa rete blocca la connessione. Di solito la causa è una VPN o un firewall restrittivo (porta in uscita 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Tutto è connesso, ma l’indirizzo non risponde ancora. Un nuovo indirizzo può richiedere un minuto.';

  @override
  String get linkServers => 'Server collegati';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Il tuo piano collega $limit server.',
      one: 'Il tuo piano collega 1 server.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Ancora nessun server collegato. Sul tuo server apri Impostazioni, poi Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return 'Rimuovere $name? Il suo indirizzo smetterà di funzionare. Il server potrà essere ricollegato in seguito.';
  }

  @override
  String get linkStatusActive => 'Ha un indirizzo';

  @override
  String get linkStatusParked => 'Non visto di recente';

  @override
  String get linkStatusSuspended => 'Sospeso';

  @override
  String get pairDevice => 'Accedi su un altro dispositivo';

  @override
  String get pairDeviceRow => 'Mostra un codice da scansionare col telefono';

  @override
  String get pairDeviceHelp =>
      'Scansionalo con la fotocamera del telefono. Oppure in Casama sul telefono: Accedi, poi Scansiona un codice.';

  @override
  String get pairDeviceWarning =>
      'Chiunque lo scansioni accede come te. Funziona una sola volta, per pochi minuti.';

  @override
  String pairDeviceServer(String host) {
    return 'Accede a $host';
  }

  @override
  String get pairDeviceNewCode => 'Nuovo codice';

  @override
  String get pairDeviceExpired => 'Questo codice è scaduto.';

  @override
  String get pairDeviceNotReachable =>
      'Questo server risponde solo su questo computer, quindi un telefono non può ancora raggiungerlo.';

  @override
  String get pairDeviceNotReachableOther =>
      'L’indirizzo di questo server funziona solo sulla sua rete. Chiedi a chi lo gestisce un indirizzo raggiungibile dall’esterno.';

  @override
  String get pairDeviceCopyLink => 'Copia link';

  @override
  String get pairDeviceLinkCopied =>
      'Link copiato. Incollalo in Casama per Chrome o su un altro dispositivo.';

  @override
  String get pairDeviceConnectChrome => 'Connetti Chrome';

  @override
  String get pairDeviceChromeDone => 'Accesso effettuato in Casama per Chrome.';

  @override
  String get pairDeviceChromeFinish =>
      'Completa nella scheda di Casama per Chrome che si è aperta.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama per Chrome non è installato in questo browser.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama per Chrome non è riuscito ad accedere. $error';
  }

  @override
  String get scanToSignIn => 'Scansiona un codice dal computer';

  @override
  String get scanToSignInTitle => 'Scansiona il codice';

  @override
  String get scanToSignInHelp =>
      'Su un computer su cui hai effettuato l’accesso, apri Impostazioni, poi Accedi su un altro dispositivo.';

  @override
  String pairSignInTo(String host) {
    return 'Accedere a $host?';
  }

  @override
  String get pairSignInBody =>
      'Il codice consente a questo dispositivo di accedere all’account che lo ha mostrato.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Questo dispositivo ora usa $current. Accedendo a $host passerà a quello.';
  }

  @override
  String get pairSigningIn => 'Accesso in corso';

  @override
  String get pairCodeInvalid =>
      'Quel codice non è più valido. Mostrane uno nuovo e scansiona di nuovo.';

  @override
  String get pairLinkInvalid => 'Questo non è un codice di accesso Casama.';

  @override
  String get linkServerTitle => 'Collega un server';

  @override
  String linkServerBody(String name) {
    return '$name vuole connettersi al tuo account Casama Cloud.';
  }

  @override
  String get linkServerCode => 'Codice sul server';

  @override
  String get linkServerCheck =>
      'Collegalo solo se hai avviato l’operazione sul tuo server e mostra lo stesso codice.';

  @override
  String get linkServerWhat =>
      'Ottiene un indirizzo pubblico e può inviarti notifiche. Non può spendere i tuoi crediti.';

  @override
  String get linkServerApprove => 'Collega';

  @override
  String get linkServerDone => 'Collegato';

  @override
  String linkServerDoneBody(String name) {
    return 'Torna su $name. Proseguirà da solo.';
  }

  @override
  String get linkServerInvalid =>
      'Quel codice non è più valido. Ricomincia dal tuo server.';

  @override
  String get linkServerEnterCode => 'Il codice mostrato dal tuo server';

  @override
  String get linkServerFind => 'Trova';

  @override
  String get linkServerNeedAdmin =>
      'Solo i proprietari e gli amministratori di uno spazio di lavoro possono collegare un server.';

  @override
  String get localDockerStopped =>
      'Docker non è in esecuzione, quindi il tuo server è fermo';

  @override
  String get localDockerStoppedBody =>
      'Il tuo server Casama gira in Docker su questo computer. Apri Docker e Casama si riconnetterà da solo quando il server sarà tornato online, cosa che può richiedere un minuto.';

  @override
  String get serverOfflineTitle => 'Il tuo server è offline';

  @override
  String get serverOfflineBody =>
      'Il computer su cui è eseguito è acceso e attivo? Si riconnetterà automaticamente.';

  @override
  String get signUpsClosed =>
      'Questo server non accetta nuovi account. Accedi con un account che hai già qui.';

  @override
  String get signUpsByInvitation =>
      'I nuovi account qui sono su invito. Usa l’indirizzo email con cui hai ricevuto l’invito.';

  @override
  String get linkPrivateNotifications => 'Notifiche private';

  @override
  String get linkPrivateNotificationsHelp =>
      'Le notifiche raggiungono il telefono tramite Casama Cloud. Quando è attivo non contengono testo e dicono solo \"Nuova attività\"; l’app carica il resto da questo server.';

  @override
  String get linkInvites => 'Consenti l’iscrizione agli invitati';

  @override
  String get linkInvitesHelp =>
      'Disattivo: nessuno può creare un nuovo account. Attivo: possono farlo le persone che inviti via email. La modifica riavvia il server.';

  @override
  String get linkKeepAwake =>
      'Mantieni attivo questo Mac quando è collegato alla corrente';

  @override
  String get linkKeepAwakeHelp =>
      'I telefoni possono raggiungere questo server solo mentre questo computer è attivo e Casama è aperto.';

  @override
  String get linkLiveView => 'Vista in diretta da remoto';

  @override
  String get linkLiveViewIncluded =>
      'Incluso nel tuo piano. Lontano da questo computer, lo schermo di un bot viene trasmesso in diretta tramite il relay di Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Incluso da Plus in su su Casama Cloud. Lontano da questo computer vedi lo schermo di un bot circa una volta al secondo. Su questo computer è sempre in diretta.';

  @override
  String get liveAwayNeedsPlan =>
      'Lontano dal computer del server, il video in diretta è incluso da Plus in su su Casama Cloud. Fino ad allora lo schermo si aggiorna circa una volta al secondo.';

  @override
  String get chatShareExport => 'Condividi o esporta';

  @override
  String get chatShareExportHelp =>
      'Salva questa chat come file oppure crea un link di sola lettura.';

  @override
  String get chatExportMarkdown => 'Esporta in Markdown';

  @override
  String get chatExportMarkdownHelp =>
      'Un file di testo che chiunque può leggere';

  @override
  String get chatExportJson => 'Esporta in JSON';

  @override
  String get chatExportJsonHelp => 'Per altre app e script';

  @override
  String get chatShareLink => 'Condividi un link di sola lettura';

  @override
  String get chatShareLinkHelp =>
      'Chiunque abbia il link può leggere questa chat';

  @override
  String get chatStopSharing => 'Interrompi condivisione del link';

  @override
  String get chatStopSharingHelp => 'Il link smette di funzionare';

  @override
  String get chatMakePublicTitle => 'Condividere questa chat con un link?';

  @override
  String get chatMakePublicBody =>
      'Chiunque abbia il link può leggere questa chat così come la vedi tu. I file allegati sono elencati per nome, non condivisi. Puoi interrompere la condivisione in qualsiasi momento.';

  @override
  String get chatMakePublic => 'Crea link';

  @override
  String get chatLinkTitle => 'Link di sola lettura';

  @override
  String get chatLinkBody =>
      'Copiato. Non compare nei motori di ricerca. Creare un nuovo link disattiva questo.';

  @override
  String get chatSharingStopped => 'Il link non funziona più';

  @override
  String get creationDuplicate => 'Duplica';

  @override
  String creationDuplicated(String title) {
    return 'Copia creata: “$title”';
  }

  @override
  String get slackInstall => 'Aggiungi a Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Collega uno spazio di lavoro Slack in un passaggio. $bot risponde lì alle @menzioni e ai messaggi diretti.';
  }

  @override
  String get slackInstallFinish => 'Completa in Slack, poi torna qui.';

  @override
  String get helpAndSupport => 'Aiuto e assistenza';

  @override
  String get helpAndSupportRow => 'Chiedi a Casama Help, contattaci, guide';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Risposte immediate dalle nostre guide e dal tuo account. Una persona è sempre a un tocco di distanza.';

  @override
  String get supportIntro =>
      'Domande, un problema con un acquisto o qualcosa che non funziona? Scrivici.';

  @override
  String supportSelfHosted(String host) {
    return 'Il tuo spazio di lavoro è eseguito su $host. Per accesso, account e piani, chiedi a chi gestisce quel server. Possiamo aiutarti con l’app stessa.';
  }

  @override
  String get supportTalkToPerson => 'Parla con una persona';

  @override
  String get contactSupport => 'Contatta l’assistenza';

  @override
  String contactSupportRow(String email) {
    return 'Scrivi al nostro team all’indirizzo $email';
  }

  @override
  String get sendFeedback => 'Invia feedback';

  @override
  String get sendFeedbackRow =>
      'Idee, cose che ti piacciono o che non ti convincono. Leggiamo tutto.';

  @override
  String get feedbackHelp =>
      'Raccontaci cosa vorresti che facesse Casama, cosa ami o cosa ti ha ostacolato.';

  @override
  String get feedbackKindPrompt => 'Che tipo di feedback è?';

  @override
  String get feedbackKindIdea => 'Idea';

  @override
  String get feedbackKindLike => 'Mi piace';

  @override
  String get feedbackKindDislike => 'Non mi piace';

  @override
  String get feedbackKindConfusing => 'Poco chiaro';

  @override
  String get feedbackMessageLabel => 'Il tuo feedback';

  @override
  String get feedbackMessageHint =>
      'Ad esempio: vorrei poter fissare una chat in alto.';

  @override
  String get feedbackContactOk => 'Potete contattarmi in merito';

  @override
  String get feedbackContactOkHelp =>
      'Potremmo scriverti una domanda via email o avvisarti quando sarà pronto.';

  @override
  String get feedbackNote =>
      'Vengono inviati la versione dell’app e il tuo piano. Hai un problema con l’account o un acquisto? Usa invece Contatta l’assistenza.';

  @override
  String get feedbackThanks => 'Grazie! Leggiamo ogni messaggio.';

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
  String get supportIdeasBoard => 'Bacheca delle idee';

  @override
  String get supportIdeasBoardHelp =>
      'Scopri cosa hanno chiesto gli altri e vota ciò che vuoi vedere presto';

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
      'Spiegaci cosa succede. Ti risponderemo via email.';

  @override
  String get contactSupportHelpMail =>
      'Spiegaci cosa succede. Si aprirà la tua app email con i dettagli già compilati.';

  @override
  String get supportSend => 'Invia';

  @override
  String get supportWriteEmail => 'Apri email';

  @override
  String get supportTopicPrompt => 'Di cosa si tratta?';

  @override
  String get supportTopicBilling => 'Fatturazione e acquisti';

  @override
  String get supportTopicBroken => 'Qualcosa non funziona';

  @override
  String get supportTopicAccount => 'Account e accesso';

  @override
  String get supportTopicQuestion => 'Una domanda o un’idea';

  @override
  String get supportTopicOther => 'Altro';

  @override
  String get supportMessageLabel => 'Il tuo messaggio';

  @override
  String get supportMessageHint => 'Cos’è successo e cosa ti aspettavi?';

  @override
  String get supportMessageMore =>
      'Aggiungi una o due frasi: cosa stavi facendo e cosa è andato storto.';

  @override
  String get supportIncludeChat =>
      'Includi la mia conversazione con Casama Help';

  @override
  String get supportIncludeChatHelp =>
      'Così non devi rispiegare tutto da capo.';

  @override
  String get supportDetailsNote =>
      'Aggiungiamo la versione dell’app e gli ID dello spazio di lavoro e dell’account per trovare il tuo profilo. Mai le tue chat.';

  @override
  String get supportSentTitle => 'Messaggio inviato';

  @override
  String supportSentBody(String email, String reference) {
    return 'Risponderemo a $email. Il tuo riferimento è $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'Nessuna app email trovata, quindi abbiamo copiato il messaggio. Incollalo in un’email indirizzata a $email.';
  }

  @override
  String get supportGuides => 'Guide e FAQ';

  @override
  String get supportGuidesHelp =>
      'Aiuto passo dopo passo per tutto ciò che riguarda Casama';

  @override
  String get introVideoTitle => 'Scopri come funziona Casama';

  @override
  String get introVideoSubtitle => 'Un video di 1 minuto e mezzo';

  @override
  String get supportIntroVideo => 'Guarda il video introduttivo';

  @override
  String get introVideoFailed =>
      'Impossibile riprodurre il video. Controlla la connessione e riprova.';

  @override
  String get introVideoOnYoutube => 'Guarda su YouTube';

  @override
  String get introVideoReplay => 'Riproduci di nuovo';

  @override
  String get supportIntroVideoHelp =>
      'Scopri cosa sa fare Casama in 1 minuto e mezzo';

  @override
  String get supportRate => 'Valuta Casama';

  @override
  String get supportRateHelp => 'Scrivi cosa ne pensi sulla pagina dello store';

  @override
  String get supportIds => 'ID assistenza';

  @override
  String get supportIdsHelp =>
      'L’assistenza potrebbe chiederli. Servono a trovare account e acquisti, senza dare accesso a nessuno.';

  @override
  String supportWorkspaceId(String name) {
    return 'ID spazio di lavoro · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'È anche il tuo ID acquisto nell’App Store e su Google Play';

  @override
  String get supportAccountId => 'ID account';

  @override
  String get supportCopyAll => 'Copia tutti i dettagli';

  @override
  String get supportCopyAllHelp =>
      'Versione app, piattaforma e ID, da incollare in un messaggio';

  @override
  String get supportNewChat => 'Nuova conversazione';

  @override
  String get supportAskHint => 'Chiedi qualsiasi cosa su Casama';

  @override
  String get supportAiNote =>
      'Casama Help usa l’IA e può commettere errori. Vede il tuo piano e gli errori dei bot, non le tue chat.';

  @override
  String get supportGreeting =>
      'Ciao! Sono Casama Help. Chiedimi qualsiasi cosa su Casama, sul tuo piano o su un problema che stai riscontrando. Se non posso risolverlo, lo passerò al nostro team di assistenza.';

  @override
  String get supportStarterPurchase =>
      'Il mio acquisto non è andato a buon fine';

  @override
  String get supportStarterCancel => 'Come annullo il mio piano?';

  @override
  String get supportStarterBot => 'Il mio bot non risponde';

  @override
  String get supportStarterHowTo => 'Cosa possono fare i miei bot?';

  @override
  String get supportAskPerson => 'Chiedi a una persona';

  @override
  String get supportHandoffTitle => 'Inviare al nostro team di assistenza?';

  @override
  String get supportHandoffButton => 'Controlla e invia';

  @override
  String get supportThinking => 'Ci sto guardando…';

  @override
  String get supportAssistantError =>
      'Casama Help non ha potuto rispondere. Riprova o chiedi a una persona.';

  @override
  String get supportAssistantLimit =>
      'Per ora Casama Help non può rispondere ad altre domande. Una persona può aiutarti.';

  @override
  String get purchaseHelp => 'Problemi con un acquisto? Ottieni aiuto';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Segnala';

  @override
  String get reportAndBlock => 'Segnala e blocca';

  @override
  String get reportReply => 'Segnala risposta';

  @override
  String get reportBot => 'Segnala bot';

  @override
  String get reportBotRow =>
      'C’è qualcosa che non va nel nome, nella descrizione o nelle risposte';

  @override
  String get reportPerson => 'Segnala persona';

  @override
  String get reportGalleryItem => 'Segnala elemento della galleria';

  @override
  String get reportGalleryRequest => 'Segnala richiesta';

  @override
  String get reportWorkspace => 'Segnala spazio di lavoro';

  @override
  String get reportHelp =>
      'Spiega alle persone che gestiscono questo server cosa non va. Esaminano ogni segnalazione.';

  @override
  String get reportPersonHelp =>
      'Spiega a chi gestisce questo server cos’è successo. Bloccheremo anche questa persona per te.';

  @override
  String get reportNote => 'Altro che dovrebbero sapere (facoltativo)';

  @override
  String reportAlsoBlock(String name) {
    return 'Blocca anche $name';
  }

  @override
  String get reportSent =>
      'Grazie. La tua segnalazione è stata inviata per la revisione.';

  @override
  String get reportReasonSpam => 'Spam o truffa';

  @override
  String get reportReasonSexual => 'Contenuti sessuali';

  @override
  String get reportReasonViolence => 'Violenza o minacce';

  @override
  String get reportReasonHarassment => 'Molestie o incitamento all’odio';

  @override
  String get reportReasonIllegal => 'Illegale o pericoloso';

  @override
  String get reportReasonImpersonation => 'Si spaccia per qualcun altro';

  @override
  String get reportReasonOther => 'Altro';

  @override
  String get thisPerson => 'questa persona';

  @override
  String blockPerson(String name) {
    return 'Blocca $name';
  }

  @override
  String blocked(String name) {
    return '$name è stato bloccato';
  }

  @override
  String get blockHelp =>
      'Le persone bloccate non possono invitarti in uno spazio di lavoro e non riceverai loro messaggi.';

  @override
  String get blockedPeople => 'Persone bloccate';

  @override
  String get blockedPeopleRow =>
      'Persone che non possono invitarti né contattarti';

  @override
  String get noBlockedPeople => 'Nessuno è bloccato';

  @override
  String get unblock => 'Sblocca';

  @override
  String get emailTips => 'Suggerimenti e novità via email';

  @override
  String get emailTipsHelp =>
      'Consigli per iniziare e qualche aggiornamento occasionale. Le email su piano e account arrivano sempre.';

  @override
  String get reportsInApp => 'Segnalato nell’app';

  @override
  String get reportsNone =>
      'Nessuna segnalazione aperta. Le segnalazioni inviate dall’app compaiono qui.';

  @override
  String get reportsPublicLinks => 'Link pubblici segnalati';

  @override
  String get reportsNoLinks => 'Nessun link pubblico è stato segnalato.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count segnalazioni',
      one: '1 segnalazione',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Rimuovi';

  @override
  String get reportsRestore => 'Ripristina';

  @override
  String get reportKindReply => 'Risposta del bot';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Persona';

  @override
  String get reportKindGallery => 'Elemento della galleria';

  @override
  String get reportKindWorkspace => 'Spazio di lavoro';

  @override
  String get reportMarkActioned => 'Gestito';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Sospendi lo spazio di lavoro $name';
  }

  @override
  String get reportDismiss => 'Archivia: tutto regolare';

  @override
  String get supportWebTitle => 'Casama Help sul sito';

  @override
  String get supportWebOn => 'Attivo';

  @override
  String get supportWebOff => 'Disattivo';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count indirizzi IP in pausa',
      one: '1 indirizzo IP in pausa',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Mostra $count domande senza risposta';
  }

  @override
  String get ticketsOpen => 'Aperti';

  @override
  String get ticketsClosed => 'Chiusi';

  @override
  String get ticketsAll => 'Tutti';

  @override
  String get ticketsNone => 'Nessun messaggio qui.';

  @override
  String get ticketClose => 'Chiudi';

  @override
  String get ticketReopen => 'Riapri';

  @override
  String get serviceStatus => 'Stato';

  @override
  String get supportStatus => 'Stato di Casama Cloud';

  @override
  String get supportStatusHelp =>
      'Controlla se qualcosa non funziona in questo momento';

  @override
  String get galleryChatSuggestionLabel => 'Dalla galleria';

  @override
  String get galleryChatAdd => 'Aggiungi';

  @override
  String galleryChatAdded(String name) {
    return 'Aggiunto $name';
  }

  @override
  String galleryChatReads(String things) {
    return 'Legge: $things';
  }

  @override
  String get galleryChatRunsCode => 'Esegue codice';

  @override
  String get galleryChatComputer => 'Usa un computer';

  @override
  String galleryChatNeeds(String apps) {
    return 'Richiede: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Bozza competenza';

  @override
  String get galleryChatShowInstructions => 'Mostra istruzioni';

  @override
  String get galleryChatHideInstructions => 'Nascondi istruzioni';

  @override
  String get galleryChatSaveSkill => 'Salva nelle mie competenze';

  @override
  String get galleryChatSaved => 'Salvata';

  @override
  String get galleryChatSavedSkill => 'Salvata nelle tue competenze';

  @override
  String get galleryChatSubmit => 'Invia alla galleria';

  @override
  String galleryChatSubmitTitle(String name) {
    return 'Inviare $name alla galleria?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Un moderatore la esaminerà prima. Una volta pubblicata, chiunque potrà trovarla e usarla. Il tuo nome visualizzato apparirà come autore, mai la tua email.';

  @override
  String get galleryChatSent => 'Inviata';

  @override
  String get galleryChatSubmitted => 'Inviata alla galleria per revisione';

  @override
  String get galleryChatSubmissionsOff =>
      'Questo server non accetta invii alla galleria.';

  @override
  String get galleryPicksTitle => 'Scelte per te';

  @override
  String get galleryPicksHelp =>
      'Inizia con un kit di competenze, app e routine adatto a te. Potrai modificare qualsiasi cosa in seguito.';

  @override
  String get galleryPicksAdd => 'Aggiungi questo kit';

  @override
  String get galleryPicksSkip => 'Salta per ora';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Aggiungi $name';
  }

  @override
  String get galleryPicksBestMatch => 'Scelta migliore';

  @override
  String get galleryPicksInside => 'Cosa contiene';

  @override
  String galleryPicksBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count competenze',
      one: '1 competenza',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routine',
      one: '1 routine',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app',
      one: '1 app',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plugin',
      one: '1 plugin',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stili',
      one: '1 stile',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return 'Aggiunto $name';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return 'Aggiunto $name. Collega $apps in App per completare.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Un amministratore esaminerà $name prima che venga aggiunto.';
  }

  @override
  String get galleryPolicyTitle => 'Galleria';

  @override
  String get galleryPolicyRow =>
      'Cosa possono aggiungere dalla galleria le persone qui';

  @override
  String get galleryPolicyMode => 'Chi può aggiungere';

  @override
  String get galleryPolicyOpen => 'Aperto';

  @override
  String get galleryPolicyOpenHelp =>
      'Chiunque qui può aggiungere qualsiasi cosa non bloccata.';

  @override
  String get galleryPolicyApproval => 'Chiedi prima';

  @override
  String get galleryPolicyApprovalHelp =>
      'L’aggiunta richiede prima la conferma di un amministratore, per ciò che scegli qui sotto.';

  @override
  String get galleryPolicyAllowlist => 'Solo consentiti';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Le persone possono aggiungere solo ciò che è nell’elenco dei consentiti.';

  @override
  String get galleryPolicyApprovalFor => 'Chiedi prima per';

  @override
  String get galleryPolicyRunsCode => 'Elementi che eseguono codice';

  @override
  String get galleryPolicyApps => 'Elementi che collegano app';

  @override
  String get galleryPolicyAll => 'Tutto';

  @override
  String get galleryPolicyAllowed => 'Consentiti';

  @override
  String get galleryPolicyAllowedHelp =>
      'Aggiunti senza chiedere. Con Solo consentiti, sono le uniche cose che si possono aggiungere.';

  @override
  String get galleryPolicyBlocked => 'Bloccati';

  @override
  String get galleryPolicyBlockedHelp => 'Nessuno qui può aggiungerli.';

  @override
  String get galleryPolicyAddItem => 'Aggiungi dalla galleria';

  @override
  String get galleryPolicyNone => 'Ancora nulla';

  @override
  String get galleryPolicySearch => 'Cerca nella galleria';

  @override
  String get galleryPolicyNoResults => 'Nessuna corrispondenza nella galleria.';

  @override
  String get galleryPolicySaved => 'Regole della galleria salvate';

  @override
  String galleryPolicyRemove(String name) {
    return 'Rimuovi $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Solo amministratori e proprietari possono modificarlo.';

  @override
  String get galleryPolicyWaiting => 'In attesa di approvazione';

  @override
  String galleryPolicyRequestedBy(String name) {
    return 'Chiesto da $name';
  }

  @override
  String get galleryPolicyApprove => 'Approva';

  @override
  String get galleryPolicyDecline => 'Rifiuta';

  @override
  String galleryPolicyApproved(String name) {
    return '$name approvato e aggiunto';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name rifiutato';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Approvato, ma impossibile aggiungere $name. $error';
  }

  @override
  String get galleryDigestEmails => 'Selezione mensile dalla galleria';

  @override
  String get galleryDigestHelp =>
      'Fino a sei nuove competenze, app e routine adatte a ciò che usi, una volta al mese.';

  @override
  String get newsletterTitle => 'Email mensile di Casama';

  @override
  String get newsletterHelp =>
      'Novità e prossimi sviluppi, al massimo una volta al mese.';

  @override
  String get newsletterSignUp =>
      'Inviami l’email mensile di Casama: novità e prossimi sviluppi, al massimo una volta al mese.';

  @override
  String get newsletterCardTitle => 'Ricevere l’email mensile di Casama?';

  @override
  String get newsletterCardBody =>
      'Novità e prossimi sviluppi, al massimo una volta al mese. Disiscriviti quando vuoi.';

  @override
  String get newsletterCardYes => 'Sì, inviamela';

  @override
  String get newsletterCardNo => 'No grazie';

  @override
  String get newsletterCardDone =>
      'Sei in lista. Puoi disattivarla in qualsiasi momento dalle Impostazioni.';

  @override
  String get galleryKindApp => 'App';

  @override
  String get galleryKindApps => 'App';

  @override
  String get galleryKindBot => 'Bot iniziale';

  @override
  String get galleryKindBots => 'Bot iniziali';

  @override
  String get galleryKindRoutine => 'Routine';

  @override
  String get galleryKindRoutines => 'Routine';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugin';

  @override
  String get galleryKindSet => 'Kit iniziale';

  @override
  String get galleryKindSets => 'Kit iniziali';

  @override
  String get galleryTabBrowse => 'Sfoglia';

  @override
  String get galleryTabInstalled => 'Installati';

  @override
  String get gallerySearchEverything => 'Cerca tutto';

  @override
  String get galleryNewBadge => 'Novità';

  @override
  String get galleryRowPicks => 'Scelte';

  @override
  String get galleryRowNew => 'Nuovi';

  @override
  String get galleryRowTrending => 'Di tendenza questa settimana';

  @override
  String get galleryRowMostUsed => 'Più usati';

  @override
  String get galleryRowWorksWith => 'Funziona con ciò che hai';

  @override
  String get galleryRowSets => 'Kit iniziali';

  @override
  String get galleryRowSeasonal => 'Di stagione';

  @override
  String get galleryFilterFree => 'Gratis';

  @override
  String get galleryFilterPlan => 'Usa crediti';

  @override
  String get galleryFilterSelfHosted => 'Funziona self-hosted';

  @override
  String get galleryFilterComputer => 'Richiede un computer';

  @override
  String get galleryNoFilterMatches => 'Nulla corrisponde a questi filtri';

  @override
  String get galleryClearFilters => 'Cancella filtri';

  @override
  String get galleryRequestThis => 'Richiedilo';

  @override
  String get galleryAskCasama => 'Chiedi a Casama di crearlo';

  @override
  String galleryAskPrompt(String query) {
    return 'Creami qualcosa per questo: $query';
  }

  @override
  String get galleryAccessTitle => 'A cosa può accedere';

  @override
  String galleryAccessReads(String things) {
    return 'Legge: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Esegue codice';

  @override
  String get galleryAccessComputer => 'Usa un computer';

  @override
  String get galleryAccessNothing =>
      'Non legge né modifica nulla dei tuoi dati';

  @override
  String get galleryCreditsNone => 'Non usa crediti';

  @override
  String get galleryCreditsLow => 'Usa pochi crediti';

  @override
  String get galleryCreditsMedium => 'Usa alcuni crediti';

  @override
  String get galleryCreditsHigh => 'Usa molti crediti';

  @override
  String get galleryTryIt => 'Provalo';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usato da $shown persone',
      one: 'Usato da 1 persona',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent% delle esecuzioni completate';
  }

  @override
  String get galleryAbout => 'Informazioni';

  @override
  String get galleryMadeByCasama => 'Creato da Casama';

  @override
  String get galleryMadeByCommunity => 'Creato dalla community';

  @override
  String get galleryMadeReviewed => 'Verificato';

  @override
  String get galleryReviewedHelp =>
      'I suoi test hanno avuto esito positivo per questa versione';

  @override
  String galleryMoreFrom(String name) {
    return 'Altro da $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Versione $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Aggiornato: $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Remix di $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'Novità in $name';
  }

  @override
  String get galleryBreaking => 'Funziona diversamente';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi nella galleria',
      one: '1 elemento nella galleria',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty =>
      'Ancora nulla nella galleria di questo autore.';

  @override
  String get galleryInstalledWorkspace => 'In questo spazio di lavoro';

  @override
  String get galleryInstalledDevice => 'Stili su questo dispositivo';

  @override
  String get galleryInstalledEmptyTitle => 'Ancora nulla di aggiunto';

  @override
  String get galleryInstalledEmpty =>
      'Competenze, app, routine e stili che aggiungi dalla galleria appaiono qui, con gli aggiornamenti.';

  @override
  String get galleryInstalledError =>
      'Impossibile caricare gli elementi installati.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aggiornamenti',
      one: '1 aggiornamento',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Aggiorna';

  @override
  String galleryUpdated(String name) {
    return '$name aggiornato';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Versione $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return 'Aggiornare $name?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'La nuova versione può fare più cose rispetto a quella attuale:';

  @override
  String get galleryUpdateBreakingHelp =>
      'La nuova versione funziona in modo diverso, quindi controllala dopo l’aggiornamento.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Ora legge: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Ora può: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Ora esegue codice';

  @override
  String get galleryUpdateNowComputer => 'Ora usa un computer';

  @override
  String get galleryRemove => 'Rimuovi';

  @override
  String galleryRemoveTitle(String name) {
    return 'Rimuovere $name?';
  }

  @override
  String get galleryRemoveHelp =>
      'Verrà rimosso da questo spazio di lavoro. Puoi aggiungerlo di nuovo dalla galleria.';

  @override
  String galleryRemoved(String name) {
    return '$name rimosso';
  }

  @override
  String get galleryRetired => 'Non più nella galleria';

  @override
  String get galleryRetiredReplaced =>
      'Non più nella galleria; è disponibile una sostituzione';

  @override
  String get gallerySeeReplacement => 'Vedi sostituzione';

  @override
  String get galleryForgetLook => 'Rimuovi da questo elenco';

  @override
  String galleryWizardTitle(String name) {
    return 'Aggiungi $name';
  }

  @override
  String get galleryWizardAdd => 'Aggiungi';

  @override
  String get galleryWizardRequired => 'Compila questo campo';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Include $count elementi',
      one: 'Include 1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Cosa serve';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count competenze, aggiunte per te',
      one: '1 competenza, aggiunta per te',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'App da collegare: $apps';
  }

  @override
  String get galleryWizardBot => 'Aggiungi a quale bot';

  @override
  String get galleryWizardPickBot => 'Scegli un bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Dove vanno le routine del kit. Senza un bot restano escluse.';

  @override
  String get galleryWizardSetNotAdded => 'Non aggiunto';

  @override
  String get galleryWizardNeedsTitle => 'Collega le tue app';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name funziona una volta collegate queste app.';
  }

  @override
  String get galleryWizardSkillAdded => 'Aggiunta';

  @override
  String get galleryWizardConnected => 'Collegata';

  @override
  String get galleryWizardConnect => 'Collega';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Collega $name in Impostazioni → App.';
  }

  @override
  String get galleryWizardContinue => 'Continua';

  @override
  String get galleryWizardSkip => 'Più tardi';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name è pronto';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Lo troverai insieme alle altre tue cose.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Per funzionare al completo, richiede queste app collegate: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'In attesa di approvazione';

  @override
  String get galleryWizardPendingHelp =>
      'Nel tuo spazio di lavoro serve prima l’approvazione di un amministratore. Il contenuto viene aggiunto appena approva.';

  @override
  String get galleryRequestsTitle => 'Richieste';

  @override
  String get galleryRequestsHelp =>
      'Idee per la galleria. Vota quelle che vuoi; i creatori scelgono dalle più votate.';

  @override
  String get galleryRequestsLinkHelp =>
      'Chiedi qualcosa che non c’è ancora oppure vota';

  @override
  String get galleryRequestsTop => 'Più votate';

  @override
  String get galleryRequestsNew => 'Nuove';

  @override
  String get galleryRequestsEmpty => 'Ancora nessuna richiesta. Sii il primo.';

  @override
  String get galleryRequestsError => 'Impossibile caricare le richieste.';

  @override
  String get galleryRequestNew => 'Nuova richiesta';

  @override
  String get galleryRequestNewHelp =>
      'Spiega cosa vorresti che qualcuno creasse. Le richieste simili vengono unite.';

  @override
  String get galleryRequestKind => 'Tipo';

  @override
  String get galleryRequestTitleLabel => 'Cosa dovrebbe fare?';

  @override
  String get galleryRequestTitleLength => 'Usa da 4 a 80 caratteri.';

  @override
  String get galleryRequestDetails => 'Dettagli (facoltativo)';

  @override
  String get galleryRequestSend => 'Invia richiesta';

  @override
  String get galleryRequestSent => 'Richiesta inviata';

  @override
  String galleryRequestSimilar(String title) {
    return '\"$title\" era già stato richiesto, quindi il tuo voto è andato lì';
  }

  @override
  String get galleryRequestMine => 'Tue';

  @override
  String get galleryRequestVote => 'Vota';

  @override
  String get galleryRequestOpen => 'Aperta';

  @override
  String get galleryRequestPlanned => 'Pianificata';

  @override
  String get galleryRequestDone => 'Fatto';

  @override
  String get galleryRequestDeclined => 'Rifiutata';

  @override
  String get gallerySubmitStart => 'Invia alla galleria';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Condividi uno stile, una competenza, una routine o un bot che hai creato';

  @override
  String get gallerySubmitPick => 'Cosa vuoi condividere?';

  @override
  String get gallerySubmitPickHelp =>
      'Scegli qualcosa che hai creato. Verrà esaminato prima di entrare nella galleria.';

  @override
  String get galleryLooksMine => 'I tuoi stili';

  @override
  String get gallerySubmitCurrentScheme => 'Combinazione di colori in uso';

  @override
  String get gallerySubmitCurrentWallpaper => 'Sfondo in uso';

  @override
  String get gallerySubmitMyWallpaper => 'Il mio sfondo';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Invia un’app',
      'bot': 'Invia un bot iniziale',
      'routine': 'Invia una routine',
      'plugin': 'Invia un plugin',
      'set': 'Invia un kit iniziale',
      'theme': 'Invia un tema',
      'scheme': 'Invia una combinazione di colori',
      'wallpaper': 'Invia uno sfondo',
      'other': 'Invia una competenza',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Il tuo nome visualizzato viene mostrato come autore. La tua email non viene mai condivisa.';

  @override
  String get gallerySubmitName => 'Nome';

  @override
  String get gallerySubmitNameLength => 'Usa da 1 a 60 caratteri.';

  @override
  String get gallerySubmitTags => 'Tag';

  @override
  String get gallerySubmitTagsHelp => 'Fino a sei, separati da virgole';

  @override
  String get gallerySubmitLicense => 'Licenza';

  @override
  String gallerySubmitRemix(String name) {
    return 'Cita l\'originale: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed =>
      'Cita l\'elemento originale della galleria';

  @override
  String get gallerySubmitSend => 'Invia';

  @override
  String get gallerySubmitted => 'Inviato per revisione';

  @override
  String get gallerySubmissionsTitle => 'I miei invii';

  @override
  String get gallerySubmissionsHelp =>
      'Cosa hai inviato alla galleria e a che punto è.';

  @override
  String get gallerySubmissionsSent => 'Inviati';

  @override
  String get gallerySubmissionsEmpty => 'Ancora nessun invio.';

  @override
  String get gallerySubmissionsError => 'Impossibile caricare i tuoi invii.';

  @override
  String get gallerySubmissionOpen => 'In revisione';

  @override
  String get gallerySubmissionMerged => 'Nella galleria';

  @override
  String get gallerySubmissionClosed => 'Non accettato';

  @override
  String get gallerySubmissionFailed => 'Invio non riuscito';

  @override
  String get galleryMyItems => 'I tuoi elementi nella galleria';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count segnalazioni aperte',
      one: '1 segnalazione aperta',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Un bot';

  @override
  String get islandNeedsOk => 'Richiede il tuo OK';

  @override
  String get islandTakeOver => 'Vuole che tu prenda il controllo';

  @override
  String get islandWriting => 'Sta scrivendo una risposta';

  @override
  String get islandWorking => 'Al lavoro';

  @override
  String get islandFinished => 'Completato';

  @override
  String get islandStoppedProblem => 'Fermato per un problema';

  @override
  String get islandOnThisMac => 'Su questo Mac';

  @override
  String get islandStale => 'Apri Casama per le novità';

  @override
  String get islandOpen => 'Apri';

  @override
  String get islandStop => 'Ferma';

  @override
  String get islandAllow => 'Consenti';

  @override
  String get islandDeny => 'Nega';

  @override
  String get islandReview => 'Esamina';

  @override
  String get islandNothing => 'Nessun bot sta lavorando ora';

  @override
  String get islandQuickAsk => 'Domanda rapida…';

  @override
  String get islandOpenCasama => 'Apri Casama';

  @override
  String get islandSettings => 'Impostazioni…';

  @override
  String get islandQuit => 'Esci da Casama';

  @override
  String get islandAskHint => 'Chiedi a un bot…';

  @override
  String get islandNeedsYou => 'In attesa';

  @override
  String get islandDropHere => 'Trascina qui per chiedere a un bot';

  @override
  String get siriSignedOut => 'Accedi prima a Casama.';

  @override
  String get siriOpenToFinish => 'Apri Casama per completare.';

  @override
  String get siriTooMany =>
      'Troppe richieste in un minuto. Apri Casama per continuare.';

  @override
  String get siriNoCredits =>
      'Hai finito i crediti. Apri Casama per aggiungerne altri.';

  @override
  String get siriOffline =>
      'Casama non riesce a raggiungere Internet in questo momento.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot ha bisogno del tuo OK. Apri Casama per controllare.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot ha riscontrato un problema. Apri Casama per vedere cos’è successo.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot ha risposto. Apri Casama per leggere la risposta.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot ci sta ancora lavorando. Riceverai una notifica quando avrà finito.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot ha risposto.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return 'Avviata $routine.';
  }

  @override
  String get siriNothingNeedsYou => 'Niente in attesa in questo momento.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cose richiedono il tuo intervento.',
      one: 'Una cosa richiede il tuo intervento.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'In attesa di te: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'I computer non sono disponibili per questo account.';

  @override
  String get siriNoComputers => 'Non hai computer in questo spazio di lavoro.';

  @override
  String siriStartingComputer(String computer) {
    return 'Avvio di $computer.';
  }

  @override
  String get siriComputerFailed =>
      'Impossibile avviare il computer in questo momento.';

  @override
  String get siriWhichBotToStop => 'Quale bot devo fermare?';

  @override
  String get siriBotNotRunning => 'Quel bot non è in esecuzione adesso.';

  @override
  String get siriStopped => 'Fermato.';

  @override
  String get siriStopFailed => 'Impossibile fermare il bot in questo momento.';

  @override
  String get focusFilterShowingAll => 'Filtro Full immersion · Mostra tutti';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Filtro Full immersion · $count mostrati',
      one: 'Filtro Full immersion · 1 mostrato',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama è riservato a chi ha almeno 13 anni';

  @override
  String get under13Body =>
      'Questo account non può usare Casama in base alla fascia d’età dichiarata. Puoi uscire oppure esportare i tuoi dati da un altro account.';

  @override
  String get siriSpotlightSetting => 'Mostra in Spotlight e Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Nomi dei bot, nomi delle routine e titoli delle chat compaiono in Spotlight e Siri su questo dispositivo. Mai ciò che viene detto in una chat. Si disattiva con il blocco app attivo.';

  @override
  String get geminiSetting => 'Consenti a Gemini di usare Casama';

  @override
  String get geminiSettingHelp =>
      'Quando chiedi a Gemini di usare Casama, può fare domande ai tuoi bot, vedere cosa richiede il tuo intervento ed eseguire le tue routine su questo telefono. Non approva mai nulla: le richieste si aprono qui. Le risposte restano nascoste in uno spazio di lavoro privato, con “Nascondi testo risposta” o con il blocco app attivo.';

  @override
  String get geminiOff =>
      'Gemini è disattivato per Casama su questo telefono. Attivalo in Casama: Impostazioni, Privacy.';

  @override
  String get islandBotWorking => 'Un bot sta lavorando';

  @override
  String get islandOnThisComputer => 'su questo computer';

  @override
  String get islandOnACall => 'In chiamata';

  @override
  String get islandStartElsewhere => 'Bot avviati altrove';

  @override
  String get islandStartElsewhereHelp =>
      'Mostra anche sulla schermata di blocco di questo telefono ciò che avvii su un altro dispositivo, ad esempio il Mac.';

  @override
  String get islandBotsAtWork => 'Bot al lavoro';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passaggi',
      one: '1 passaggio',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Mostra i bot nel notch';

  @override
  String get showBotsInNotchHelp =>
      'Mostra cosa stanno facendo i tuoi bot attorno alla fotocamera. L’icona nella barra dei menu lo mostra comunque.';

  @override
  String get notchOnHover => 'Apri il notch al passaggio del cursore';

  @override
  String get notchOnHoverHelp => 'Disattivo: clicca sul notch per aprirlo.';

  @override
  String get sitePublishToWeb => 'Pubblica sul web';

  @override
  String get sitePublishToWebHelp => 'Assegnale un indirizzo web proprio.';

  @override
  String get siteAddressName => 'Nome indirizzo';

  @override
  String get siteAddressRules =>
      'Da 3 a 40 lettere minuscole, numeri e trattini; deve iniziare e finire con una lettera o un numero.';

  @override
  String get siteAddressChecking => 'Verifica…';

  @override
  String get siteAddressAvailable => 'Disponibile';

  @override
  String get siteAddressTaken => 'Questo nome non è disponibile.';

  @override
  String get siteAnyoneCanOpen => 'Chiunque abbia l’indirizzo potrà aprirlo.';

  @override
  String get sitePublish => 'Pubblica';

  @override
  String get siteOnTheWeb => 'Sul web';

  @override
  String get siteSearchEngines => 'Consenti ai motori di ricerca di trovarlo';

  @override
  String get siteSearchEnginesHelp =>
      'Lo indicizza su Google e altri motori di ricerca.';

  @override
  String get siteSearchEnginesPaid => 'Richiede un piano a pagamento.';

  @override
  String get siteUseOwnDomain => 'Usa il tuo dominio';

  @override
  String get siteUnpublish => 'Rimuovi dal web';

  @override
  String get siteUnpublishTitle => 'Rimuovere questo sito dal web?';

  @override
  String get siteUnpublishBody =>
      'Smetterà di aprirsi ai suoi indirizzi web, ma resterà nella tua libreria.';

  @override
  String get siteHostLive => 'Online';

  @override
  String get siteHostWaitingForDns => 'In attesa del DNS';

  @override
  String get siteHostGettingCertificate => 'Ottenimento del certificato';

  @override
  String get siteHostNeedsAttention => 'Richiede attenzione';

  @override
  String get siteHostPaused => 'In pausa';

  @override
  String get siteHostSuspended => 'Sospeso';

  @override
  String get settingsDomains => 'Domini';

  @override
  String get settingsDomainsHelp =>
      'Apri i tuoi siti su un dominio di tua proprietà.';

  @override
  String get settingsSearchHint => 'Cerca nelle impostazioni';

  @override
  String settingsSearchNone(String query) {
    return 'Nessuna impostazione corrisponde a “$query”.';
  }

  @override
  String get domainsEmpty =>
      'Collega un dominio che possiedi, come bakery.com, e il tuo sito si aprirà lì.';

  @override
  String get domainsConnectOwn => 'Collega un tuo dominio';

  @override
  String get domainStateLive => 'Online';

  @override
  String get domainStateWaitingDns => 'In attesa del DNS';

  @override
  String get domainStateWaitingCert => 'Ottenimento del certificato';

  @override
  String get domainStatePaused => 'In pausa';

  @override
  String get domainStateNeedsAttention => 'Richiede attenzione';

  @override
  String get domainNoSite => 'Ancora nessun sito';

  @override
  String get domainConnectField => 'Il tuo dominio';

  @override
  String get domainConnectHelp =>
      'Scrivilo come bakery.com, www.bakery.com o shop.bakery.com.';

  @override
  String get domainConnectSite => 'Sito da mostrare';

  @override
  String get domainSiteNone => 'Nessuno';

  @override
  String get domainSiteNoneHelp =>
      'Il dominio non mostra nulla finché non scegli un sito.';

  @override
  String get domainConnect => 'Connetti';

  @override
  String get domainClaimTitle => 'Dimostra che è tuo';

  @override
  String get domainClaimBody =>
      'Un altro spazio di lavoro ha collegato questo dominio. Aggiungi questo record per dimostrare che è tuo, poi tocca Connetti di nuovo.';

  @override
  String get domainRecordType => 'Tipo';

  @override
  String get domainRecordName => 'Nome';

  @override
  String get domainRecordValue => 'Valore';

  @override
  String get domainSite => 'Sito';

  @override
  String get domainPickSite => 'Scegli un sito';

  @override
  String get domainHosts => 'Indirizzi';

  @override
  String get domainPrimary => 'Principale';

  @override
  String get domainPrimaryHelp =>
      'I visitatori arrivano qui; gli altri indirizzi reindirizzano a questo.';

  @override
  String get domainMakePrimary => 'Rendi principale';

  @override
  String get domainRecordsTitle => 'Record da aggiungere';

  @override
  String get domainRecordsAtCloudflare =>
      'Aggiungili su Cloudflare. Imposta i record su Solo DNS.';

  @override
  String domainRecordsAt(String provider) {
    return 'Aggiungili nelle impostazioni DNS su $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Aggiungili dove gestisci il DNS del tuo dominio, di solito presso il fornitore da cui lo hai acquistato.';

  @override
  String get domainRecordsNone => 'Nulla da aggiungere. È tutto pronto.';

  @override
  String get domainRecordOptional => 'Facoltativo';

  @override
  String domainRecordForward(String from, String to) {
    return 'Attiva l’inoltro da $from a $to presso il fornitore da cui hai acquistato il dominio.';
  }

  @override
  String get domainRecordFound => 'Trovato';

  @override
  String get domainRecordNotFound => 'Non ancora trovato';

  @override
  String get domainCheckAgain => 'Controlla di nuovo';

  @override
  String get domainCheckTooSoon =>
      'Abbiamo appena controllato. Riprova tra qualche secondo.';

  @override
  String get domainChecksItself =>
      'Controlliamo anche in automatico, quindi puoi lasciare questa schermata.';

  @override
  String get domainHistory => 'Cronologia';

  @override
  String get domainEventConnected => 'Connesso';

  @override
  String get domainEventProved => 'Record trovati';

  @override
  String get domainEventLive => 'Online';

  @override
  String get domainEventNeedsDns => 'Ancora in attesa del DNS';

  @override
  String get domainEventFailed => 'Impossibile completare la configurazione';

  @override
  String get domainEventDisconnected =>
      'Record rimossi, quindi è stato disconnesso';

  @override
  String get domainEventPaused => 'In pausa: il tuo piano non lo include';

  @override
  String get domainEventResumed => 'Di nuovo attivo';

  @override
  String get domainEventRemoved => 'Disconnesso';

  @override
  String get domainEventClaim => 'Chiesta la verifica di proprietà';

  @override
  String get domainEventClaimAttempt =>
      'Un altro spazio di lavoro ha provato a collegarlo';

  @override
  String get domainEventOverLimit => 'Oltre il limite del tuo piano';

  @override
  String get domainEventSuspended => 'Sospeso';

  @override
  String get domainEventOther => 'Aggiornato';

  @override
  String domainDisconnectTitle(String name) {
    return 'Disconnettere $name?';
  }

  @override
  String get domainDisconnectBody =>
      'Il tuo sito smetterà di aprirsi a questo dominio. In seguito puoi rimuovere i suoi record presso il tuo fornitore DNS.';

  @override
  String get domainsFind => 'Trova un dominio';

  @override
  String get domainsEmptyBuy =>
      'Acquista un dominio per il tuo sito oppure collegane uno che possiedi.';

  @override
  String get domainFindField => 'Nome o alcune parole';

  @override
  String get domainFindHint => 'panificio';

  @override
  String get domainFindHelp => 'I prezzi sono annuali, imposte escluse.';

  @override
  String get domainFindNone => 'Nessun nome trovato. Prova altre parole.';

  @override
  String get domainFindNotOffered =>
      'L’acquisto di un dominio non è disponibile in questa app. Puoi comunque collegare un dominio che possiedi.';

  @override
  String domainPricePerYear(String price) {
    return '$price all’anno più imposte';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Si rinnova a $price';
  }

  @override
  String get domainReasonTaken => 'Già registrato';

  @override
  String get domainReasonPremium => 'Nome premium, non venduto qui';

  @override
  String get domainReasonNotSold => 'Non venduto qui';

  @override
  String get domainBuy => 'Acquista';

  @override
  String domainBuyTitle(String name) {
    return 'Acquista $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price per il primo anno, poi $renew all’anno, più imposte.';
  }

  @override
  String get domainBuyFinal =>
      'Le vendite sono definitive una volta registrato il dominio. Se non può essere registrato, riceverai un rimborso completo.';

  @override
  String get domainBuyTerms => 'Accetto i termini sui domini';

  @override
  String get domainBuyReadTerms => 'Leggi i termini';

  @override
  String get domainRenewAuto => 'Rinnova automaticamente';

  @override
  String get domainRenewAutoHelp =>
      'Effettua l’addebito sul metodo di pagamento salvato circa due settimane prima della scadenza.';

  @override
  String get domainBuySite => 'Sito da mostrare';

  @override
  String get domainBuyPayInBrowser =>
      'Completa il pagamento nel browser. Questa schermata si aggiornerà automaticamente.';

  @override
  String get domainContactTitle => 'Dettagli di contatto';

  @override
  String get domainContactHelp =>
      'La persona o l’azienda a cui è registrato il dominio. I registrar mantengono questi dati privati.';

  @override
  String get domainContactFirstName => 'Nome';

  @override
  String get domainContactLastName => 'Cognome';

  @override
  String get domainContactOrganization => 'Azienda (facoltativo)';

  @override
  String get domainContactAddress1 => 'Indirizzo';

  @override
  String get domainContactAddress2 => 'Indirizzo riga 2 (facoltativo)';

  @override
  String get domainContactCity => 'Città';

  @override
  String get domainContactState => 'Provincia o regione';

  @override
  String get domainContactZip => 'CAP';

  @override
  String get domainContactCountry => 'Codice paese';

  @override
  String get domainContactCountryHint => 'IT';

  @override
  String get domainContactPhone => 'Telefono';

  @override
  String get domainContactPhoneHint => '+39 02 5550 1000';

  @override
  String get domainContactEmail => 'Email';

  @override
  String get domainContactRequired => 'Obbligatorio';

  @override
  String get domainContactCountryInvalid =>
      'Usa un codice a due lettere, ad esempio IT o US';

  @override
  String get domainContactPhoneInvalid =>
      'Usa il formato internazionale, ad esempio +39 02 5550 1000';

  @override
  String get domainContactEmailInvalid => 'Inserisci un’email valida';

  @override
  String get domainContactSave => 'Salva';

  @override
  String get domainContactSaved => 'Dettagli di contatto salvati.';

  @override
  String get domainContactChangeNote =>
      'Le modifiche si applicano a ogni dominio acquistato da questo spazio di lavoro. Un nuovo indirizzo email deve essere confermato di nuovo.';

  @override
  String get domainOrderTitle => 'Il tuo ordine';

  @override
  String get domainOrderWaitingPayment =>
      'In attesa del pagamento nel browser.';

  @override
  String domainOrderRegistering(String name) {
    return 'Registrazione di $name…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return 'Configurazione di $name…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'Impossibile registrare $name. Rimborso in corso…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'Impossibile registrare $name, quindi ti abbiamo rimborsato interamente.';
  }

  @override
  String get domainOrderAbandoned =>
      'Questo pagamento non è stato completato, quindi non è stato addebitato nulla.';

  @override
  String get domainOrderNeedsAttention =>
      'Qualcosa è andato storto con questo ordine. Siamo stati avvisati e ce ne occuperemo.';

  @override
  String domainOrderDone(String name) {
    return '$name è tuo.';
  }

  @override
  String get domainOrderLeave =>
      'Puoi lasciare questa schermata. Ti avviseremo quando sarà pronto.';

  @override
  String get domainOrderBack => 'Torna ai domini';

  @override
  String domainRenewsOn(String date) {
    return 'Rinnovo: $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Scadenza: $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price all’anno più imposte';
  }

  @override
  String get domainRenewNow => 'Rinnova ora';

  @override
  String get domainRenewPayInBrowser =>
      'Completa il pagamento nel browser. La nuova data apparirà qui dopo il pagamento.';

  @override
  String get domainRenewCharged =>
      'Rinnovato. La nuova data apparirà qui tra un minuto.';

  @override
  String get domainRegistration => 'Registrazione';

  @override
  String domainExpired(String date) {
    return 'Scaduto: $date. Rinnova entro 25 giorni da quella data per mantenerlo.';
  }

  @override
  String get domainLapsed =>
      'Questo dominio è scaduto definitivamente. Scrivi all’assistenza per chiedere se è possibile recuperarlo; non è garantito.';

  @override
  String get domainSuspendedLine =>
      'Questo dominio è sospeso. Scrivi all’assistenza per sapere perché.';

  @override
  String get domainVerifyTitle => 'Conferma l’email del registrante';

  @override
  String get domainVerifyBody =>
      'Il registrar ha inviato un’email all’indirizzo del registrante. Aprila e conferma, altrimenti il dominio smetterà di funzionare.';

  @override
  String get domainVerifySendAgain => 'Invia di nuovo';

  @override
  String get domainVerifySent =>
      'Inviata. Controlla In arrivo del registrante.';

  @override
  String get domainDnsRecords => 'Record DNS';

  @override
  String get domainDnsRecordsHelp => 'Email, sottodomini e verifiche del sito';

  @override
  String get domainMoveOut => 'Trasferisci a un altro registrar';

  @override
  String domainMoveOutAfter(String date) {
    return 'Trasferibile dopo: $date';
  }

  @override
  String get domainMoveOutHelp =>
      'Ottieni un codice di trasferimento per un altro registrar';

  @override
  String domainMoveOutTitle(String name) {
    return 'Trasferire $name?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Sblocca il dominio e mostra una sola volta il codice di trasferimento. Digita $name per confermare.';
  }

  @override
  String get domainMoveOutConfirm => 'Ottieni codice di trasferimento';

  @override
  String domainMoveOutLocked(String date) {
    return 'Trasferibile dopo: $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Codice di trasferimento';

  @override
  String get domainTransferCodeBody =>
      'Fornisci questo codice al nuovo registrar. Viene mostrato solo questa volta, quindi copialo ora.';

  @override
  String get domainTransferCode => 'Codice';

  @override
  String get domainUnlocked => 'Sbloccato per il trasferimento';

  @override
  String get domainLockAgain => 'Blocca di nuovo';

  @override
  String get domainLocked => 'Bloccato di nuovo.';

  @override
  String get domainReauthTitle => 'Accedi di nuovo';

  @override
  String get domainReauthSendCode => 'Inviami un codice via email';

  @override
  String domainReauthCodeSent(String email) {
    return 'Abbiamo inviato un codice a $email.';
  }

  @override
  String get domainReauthCode => 'Codice ricevuto via email';

  @override
  String get domainReauthSignIn => 'Accedi';

  @override
  String get domainReauthSignOut =>
      'Esci e accedi di nuovo, poi riprova ancora una volta.';

  @override
  String get dnsRecordsEmpty => 'Ancora nessun record.';

  @override
  String get dnsRecordAdd => 'Aggiungi record';

  @override
  String get dnsRecordEdit => 'Modifica record';

  @override
  String get dnsRecordManaged => 'Usato dal tuo sito Casama';

  @override
  String get dnsRecordType => 'Tipo';

  @override
  String get dnsRecordHost => 'Nome';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Lascia vuoto per $name stesso, oppure scrivi www, shop…';
  }

  @override
  String get dnsRecordAnswer => 'Valore';

  @override
  String get dnsRecordTtl => 'TTL (secondi)';

  @override
  String get dnsRecordPriority => 'Priorità';

  @override
  String get dnsRecordSave => 'Salva';

  @override
  String get dnsRecordDeleteTitle => 'Eliminare questo record?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 secondi o più';

  @override
  String get dnsRecordAnswerRequired => 'Obbligatorio';

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
  String get deleteAccountDomains =>
      'Domini acquistati nei tuoi spazi di lavoro';

  @override
  String get deleteAccountDomainsBody =>
      'Questi domini restano registrati fino alla scadenza. Non si rinnoveranno e i rispettivi siti andranno offline.';

  @override
  String get whatsNew010Sites =>
      'Pubblica una pagina sul web al suo indirizzo e usa per essa il tuo dominio.';

  @override
  String get inAppAlertOpen => 'Apri';

  @override
  String get pushPrefsTitle => 'Notifiche';

  @override
  String get pushPrefsHelp =>
      'Scegli cosa fa vibrare o suonare i tuoi dispositivi. Tutto arriva comunque nella sezione In arrivo.';

  @override
  String get pushAllOn => 'Tutte attive';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Risposte disattivate',
      'needsYou': 'In attesa disattivato',
      'routines': 'Routine e riepiloghi disattivati',
      'suggestions': 'Suggerimenti e aggiornamenti disattivati',
      'other': 'Account disattivato',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count tipi disattivati';
  }

  @override
  String get pushReplies => 'Risposte';

  @override
  String get pushRepliesHelp =>
      'Quando un bot risponde a una tua domanda, se sei uscito dalla chat.';

  @override
  String get pushNeedsYou => 'In attesa';

  @override
  String get pushNeedsYouHelp =>
      'Approvazioni, password e passaggi di controllo in attesa per i tuoi bot.';

  @override
  String get pushNeedsYouOffWarning =>
      'Disattivo: i tuoi bot attenderanno finché non apri l’app.';

  @override
  String get pushRoutines => 'Routine e riepiloghi';

  @override
  String get pushRoutinesHelp =>
      'Risultati delle routine e il tuo riepilogo mattutino.';

  @override
  String get pushSuggestions => 'Suggerimenti e aggiornamenti';

  @override
  String get pushSuggestionsHelp =>
      'Cose che i tuoi bot si offrono di fare per te.';

  @override
  String get pushAccount => 'Account';

  @override
  String get pushAccountHelp =>
      'Crediti in esaurimento, progetti e il tuo server.';

  @override
  String get pushHideReplyText => 'Nascondi testo risposta';

  @override
  String get pushHideReplyTextHelp =>
      'Le notifiche dicono che un bot ha risposto, senza mostrare le sue parole.';

  @override
  String get reactToMessage => 'Reagisci';

  @override
  String get moreReactions => 'Altre reazioni';

  @override
  String get reactionsTitle => 'Reazioni';

  @override
  String get reactionsAll => 'Tutte';

  @override
  String get reactionsYou => 'Tu';

  @override
  String get reactionsTapToRemove => 'Tocca per rimuovere';

  @override
  String get reactionsNone => 'Ancora nessuna reazione.';

  @override
  String get reactionsLoadFailed => 'Impossibile caricare chi ha reagito.';

  @override
  String get searchEmoji => 'Cerca emoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reazioni',
      one: '1 reazione',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reazioni',
      one: '1 reazione',
    );
    return '$emoji, $_temp0, inclusa la tua';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Reagisci con $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Rimuovi la tua reazione $emoji';
  }

  @override
  String get packsShelfTitle => 'Pacchetti';

  @override
  String get packsShelfHelp =>
      'Bot, competenze e routine che lavorano insieme, aggiunti in un colpo solo.';

  @override
  String get packReviewed => 'Verificato';

  @override
  String get packNotReviewed => 'Non verificato da Casama';

  @override
  String packCountBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot',
      one: '1 bot',
    );
    return '$_temp0';
  }

  @override
  String packCountSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count competenze',
      one: '1 competenza',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routine',
      one: '1 routine',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app',
      one: '1 app',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stili',
      one: '1 stile',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strumenti',
      one: '1 strumento',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Kit iniziale';

  @override
  String get packAddFromLink => 'Aggiungi un pacchetto da un link';

  @override
  String get packAddFromLinkHelp =>
      'Incolla un link GitHub a un pacchetto e guarda prima cosa aggiunge.';

  @override
  String get packAddFromFile => 'Aggiungi da un file';

  @override
  String get packAddFromFileHelp => 'Scegli il file .zip di un pacchetto.';

  @override
  String get packLinkLabel => 'Link GitHub';

  @override
  String get packFileUnreadable => 'Quel file non è lo .zip di un pacchetto.';

  @override
  String get packFileTooBig => 'Quel file è troppo grande per un pacchetto.';

  @override
  String packSource(String where, String commit) {
    return '$where a $commit';
  }

  @override
  String get packFromFile => 'Da un file';

  @override
  String get packFromShare => 'Condiviso con te';

  @override
  String get packAlreadyHere =>
      'Questo spazio di lavoro ha già questo pacchetto.';

  @override
  String get packOpenInstalled => 'Vedi i pacchetti installati';

  @override
  String get packAdd => 'Aggiungi pacchetto';

  @override
  String packWizardTitle(String name) {
    return 'Aggiungi $name';
  }

  @override
  String get packWhatsInside => 'Cosa contiene';

  @override
  String get packWhatsInsideHelp => 'Deseleziona tutto ciò che non vuoi.';

  @override
  String get packSectionBots => 'Bot';

  @override
  String get packSectionSkills => 'Competenze';

  @override
  String get packSectionRoutines => 'Routine';

  @override
  String get packSectionApps => 'App';

  @override
  String get packSectionLooks => 'Stili';

  @override
  String get packSectionIncludes => 'Dalla galleria';

  @override
  String get packSectionTools => 'Strumenti';

  @override
  String get packSkillRunsScripts => 'Esegue script sul computer del bot';

  @override
  String get packSkillForWorkspace => 'Per l’intero spazio di lavoro';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Si esegue circa $count volte a settimana',
      one: 'Si esegue circa 1 volta a settimana',
      zero: 'Si esegue ogni tanto',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Comunica con $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Si connette a $url';
  }

  @override
  String get packIncludeMissing => 'Non trovato nella galleria';

  @override
  String get packLookHelp =>
      'Puoi usarlo su questo dispositivo dopo l’aggiunta.';

  @override
  String get packNothingTicked => 'Seleziona almeno un elemento da aggiungere.';

  @override
  String get packQuestions => 'Qualche domanda';

  @override
  String get packQuestionsHelp =>
      'Il pacchetto inserisce questi dati nei suoi bot e nelle sue routine.';

  @override
  String get packSecretsTitle => 'Chiavi e impostazioni';

  @override
  String get packSecretsHelp =>
      'Gli strumenti del pacchetto ne hanno bisogno per funzionare.';

  @override
  String get packReachTitle => 'Cosa può raggiungere';

  @override
  String get packReachHelp => 'Calcolato da Casama dai file del pacchetto.';

  @override
  String get packReachRunsCode => 'Esegue codice';

  @override
  String get packReachComputer => 'Usa il computer del bot';

  @override
  String packReachHosts(String hosts) {
    return 'Comunica con $hosts';
  }

  @override
  String get packReachNoHosts => 'Non comunica con altri siti';

  @override
  String packReachSecrets(String names) {
    return 'Usa chiavi: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Circa $count esecuzioni pianificate a settimana',
      one: 'Circa 1 esecuzione pianificata a settimana',
      zero: 'Nessuna esecuzione pianificata',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama non ha verificato questo pacchetto. Aggiungilo solo se ti fidi della provenienza. Le sue routine partono disattivate.';

  @override
  String get packPickBotTitle => 'Quale bot lo riceve?';

  @override
  String get packPickBotHelp =>
      'Questo pacchetto non include bot. Scegline uno per le sue routine e i suoi strumenti.';

  @override
  String packDoneTitle(String name) {
    return '$name è stato aggiunto';
  }

  @override
  String get packDoneHelp => 'Ecco cosa ha aggiunto.';

  @override
  String get packPendingHelp =>
      'Abbiamo chiesto a un amministratore. Il pacchetto verrà aggiunto appena approverà.';

  @override
  String get packStatusInstalled => 'Aggiunto';

  @override
  String get packStatusPending => 'In attesa di un amministratore';

  @override
  String get packStatusSkipped => 'Saltato';

  @override
  String get packStatusFailed => 'Non riuscito';

  @override
  String get packStatusDevice => 'Su questo dispositivo';

  @override
  String get packConnectTitle => 'Collega le sue app';

  @override
  String get packConnectHelp =>
      'I suoi bot funzionano completamente una volta collegate queste app.';

  @override
  String get packLooksTitle => 'Usare uno stile su questo dispositivo?';

  @override
  String get packUseLook => 'Usa';

  @override
  String get packLookInUse => 'In uso';

  @override
  String get packInstalledTitle => 'Questo pacchetto è già qui';

  @override
  String get packsInstalledTitle => 'Pacchetti installati';

  @override
  String get packsInstalledRow =>
      'Pacchetti aggiunti da questo spazio di lavoro, con aggiornamenti';

  @override
  String get packsInstalledEmpty =>
      'Ancora nessun pacchetto. Trovane uno nello scaffale Pacchetti oppure aggiungine uno da un link.';

  @override
  String get packEditedBadge => 'Modificato da te';

  @override
  String get packRemove => 'Rimuovi';

  @override
  String get packUpToDate => 'Questo pacchetto è aggiornato.';

  @override
  String get packCantCheck =>
      'Questo pacchetto proviene da un file o da un link e non può verificare gli aggiornamenti.';

  @override
  String packUpdateTitle(String name) {
    return 'Aggiorna $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'Nuovi: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Rimossi: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Modificato: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Nuovi siti con cui comunica: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Nuove chiavi necessarie: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Nuove pianificazioni: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Esecuzioni pianificate a settimana: $from → $to';
  }

  @override
  String get packDiffNone => 'Nulla di rilevante è cambiato.';

  @override
  String get packEditedTitle => 'Elementi modificati da te';

  @override
  String get packEditedHelp =>
      'Resta la tua versione a meno che tu non scelga di cambiarla.';

  @override
  String get packTakeTheirs => 'Usa la versione del pacchetto';

  @override
  String get packReachGrewTitle => 'Raggiunge più risorse';

  @override
  String get packReachGrewHelp =>
      'La nuova versione può raggiungere più risorse rispetto a quella attuale.';

  @override
  String get packReachConfirm => 'Ho controllato cosa può raggiungere ora';

  @override
  String packUpdated(String name) {
    return '$name è aggiornato.';
  }

  @override
  String packRemoveTitle(String name) {
    return 'Rimuovere $name?';
  }

  @override
  String get packRemoveBody =>
      'I suoi strumenti e le sue chiavi verranno rimossi, così come le competenze e le routine che non hai modificato. Le connessioni alle app restano.';

  @override
  String get packRemoveBots => 'Elimina anche i bot creati da questo pacchetto';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Pacchetto rimosso. $count elementi sono rimasti perché li hai modificati.',
      one: 'Pacchetto rimosso. 1 elemento è rimasto perché lo hai modificato.',
      zero: 'Pacchetto rimosso.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Condividi come pacchetto';

  @override
  String get sharePackRow => 'Raggruppa bot e competenze per qualcun altro';

  @override
  String get sharePackHelp =>
      'Chiavi, chat, memoria, Su di te e la scelta del modello non vengono mai inclusi.';

  @override
  String get sharePackBots => 'Bot';

  @override
  String get sharePackBotsHelp =>
      'Scegline fino a 5. Ognuno porta con sé istruzioni, competenze e routine.';

  @override
  String get sharePackSkills => 'Competenze dello spazio di lavoro';

  @override
  String get sharePackName => 'Nome';

  @override
  String get sharePackSummary => 'Una riga per descriverlo';

  @override
  String get sharePackLook => 'Includi il tema di questo dispositivo';

  @override
  String get sharePackCheck => 'Controlla e condividi';

  @override
  String get sharePackFindingsTitle => 'Alcune righe sembrano chiavi';

  @override
  String get sharePackFindingsHelp =>
      'Controllale prima di condividere. Torna indietro per correggerle oppure condividi se sono sicure.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, riga $line: $what';
  }

  @override
  String get sharePackGoBack => 'Torna indietro';

  @override
  String get sharePackAnyway => 'Condividi comunque';

  @override
  String get sharePackLinkTitle => 'Il tuo link al pacchetto';

  @override
  String sharePackLinkHelp(String date) {
    return 'Chiunque abbia effettuato l’accesso a Casama può aprirlo. Scadenza: $date.';
  }

  @override
  String get sharePackShare => 'Condividi';

  @override
  String get sharePackSaveFile => 'Salva come file';

  @override
  String get sharePackLinkCopied => 'Link copiato.';

  @override
  String get sharePackStop => 'Interrompi condivisione';

  @override
  String get sharePackStopped => 'Il link non funziona più.';

  @override
  String pluginFromPack(String pack) {
    return 'Dal pacchetto $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Aggiornalo o rimuovilo insieme al suo pacchetto, in Galleria → Pacchetti installati.';

  @override
  String get pluginSettings => 'Impostazioni';

  @override
  String get pluginEditSettings => 'Modifica impostazioni';

  @override
  String get pluginSettingsSaved => 'Impostazioni salvate.';

  @override
  String get galleryPolicyKeyHelp =>
      'Puoi anche digitare un repository (repo/owner:name) o un pacchetto (pack/name).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Aggiungi $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Pacchetto: $name';
  }

  @override
  String get reportPackShare => 'Segnala questo pacchetto';

  @override
  String get appLock => 'Blocco app';

  @override
  String get appLockRow => 'Chiedi di sbloccare Casama all’apertura';

  @override
  String get appLockHelp =>
      'Casama ti chiede di sbloccarlo all’apertura e dopo un periodo di inattività. Mentre è attivo, il tuo accesso viene conservato nel portachiavi di questo dispositivo.';

  @override
  String get appLockSwitch => 'Blocca Casama';

  @override
  String get appLockLocked => 'Casama è bloccato';

  @override
  String get appLockUnlock => 'Sblocca';

  @override
  String get appLockUnlockWithPasskey => 'Sblocca con una passkey';

  @override
  String get appLockUnlockReason => 'Sblocca Casama';

  @override
  String get appLockTurnOnReason => 'Attiva il blocco app';

  @override
  String get appLockConfirmReason => 'Conferma che sei tu';

  @override
  String get appLockConfirmTitle => 'Conferma che sei tu';

  @override
  String get approvalConfirmTitle => 'Consentire questa azione?';

  @override
  String get approvalConfirmBody =>
      'Questa è una richiesta ad alto rischio. Consentire al bot di procedere?';

  @override
  String get approvalConfirmAllow => 'Consenti';

  @override
  String appLockUnlockWith(String method) {
    return 'Usa $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID o il tuo codice';

  @override
  String get appLockDeviceAndroid =>
      'la tua impronta, il volto o il blocco schermo';

  @override
  String get appLockDeviceMac => 'Touch ID o la password del Mac';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'il blocco schermo del dispositivo';

  @override
  String appLockMethodDevice(String method) {
    return 'Si sblocca con $method';
  }

  @override
  String get appLockMethodPin => 'Si sblocca con un PIN a 6 cifre';

  @override
  String get appLockMethodPasskey => 'Si sblocca con una passkey';

  @override
  String get appLockPinHint => 'Inserisci il PIN';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PIN errato. $count tentativi rimasti.',
      one: 'PIN errato. 1 tentativo rimasto.',
      zero: 'PIN errato.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Troppi PIN errati. Esci e accedi di nuovo per aprire Casama.';

  @override
  String get appLockFailed => 'Non ha funzionato. Riprova.';

  @override
  String get appLockUnavailable =>
      'Questo dispositivo non può sbloccare Casama in questo momento. Esci e accedi di nuovo per rientrare.';

  @override
  String get appLockSignOutConfirm =>
      'Uscire disattiva il blocco app su questo dispositivo. Accedi di nuovo per aprire Casama.';

  @override
  String get appLockCallRinging =>
      'Una chiamata sta squillando. Sblocca per rispondere.';

  @override
  String get appLockRequiredTitle => 'Attiva il blocco app';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace richiede il blocco app su ogni dispositivo che apre Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Questo browser non può usare le passkey con questo server, quindi non può bloccare Casama. Apri Casama nell’app sul telefono o sul computer.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Attivo. Richiesto da $workspace';
  }

  @override
  String get appLockTurnOn => 'Attiva';

  @override
  String get appLockTurnedOn => 'Il blocco app è attivo';

  @override
  String get appLockNoWayHere =>
      'Questo browser non può usare le passkey con questo server, quindi Casama non può essere bloccato qui.';

  @override
  String get appLockNotChecked => 'Impossibile confermare la tua identità.';

  @override
  String get appLockPinSetupTitle => 'Scegli un PIN';

  @override
  String get appLockPinAgainTitle => 'Inserisci di nuovo il PIN';

  @override
  String get appLockPinSetupBody => '6 cifre. Lo inserirai per aprire Casama.';

  @override
  String get appLockPinNext => 'Continua';

  @override
  String get appLockPinMismatch =>
      'I PIN non corrispondevano. Scegline uno di nuovo.';

  @override
  String get appLockPinNotSaved =>
      'Impossibile salvare il PIN su questo dispositivo.';

  @override
  String get appLockPinChanged => 'PIN modificato';

  @override
  String get appLockChangePin => 'Cambia PIN';

  @override
  String get appLockAfter => 'Blocca dopo';

  @override
  String get appLockAfterHelp =>
      'Tempo in background, ridotto a icona o dietro altre app su un computer.';

  @override
  String get appLockAfterImmediately => 'Subito';

  @override
  String get appLockAfterOneMinute => '1 minuto';

  @override
  String get appLockAfterFiveMinutes => '5 minuti';

  @override
  String get appLockAfterFifteenMinutes => '15 minuti';

  @override
  String get appLockAfterOneHour => '1 ora';

  @override
  String get appLockBlockScreenshots => 'Blocca screenshot';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Screenshot, registrazioni dello schermo e condivisione schermo non mostrano nulla di Casama.';

  @override
  String get appLockLockNow => 'Blocca ora';

  @override
  String get appLockPrivacySection => 'Altre opzioni di privacy';

  @override
  String get appLockAskBeforeRisky => 'Conferma azioni rischiose';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Sblocca di nuovo prima di eliminare l’account, creare chiavi, cambiare fatturazione, esportare dati, approvare richieste ad alto rischio e prendere il controllo di un computer.';

  @override
  String get requireAppLock => 'Richiedi il blocco app';

  @override
  String get requireAppLockHelp =>
      'I membri devono bloccare Casama su ogni dispositivo prima che si apra. Sul web serve una passkey.';

  @override
  String get requireAppLockOwnFirst =>
      'Attiva prima il blocco app su questo dispositivo.';

  @override
  String get permLocation => 'Posizione';

  @override
  String get permLocationAlways => 'Posizione in background';

  @override
  String get permCamera => 'Fotocamera';

  @override
  String get permMicrophone => 'Microfono';

  @override
  String get permSpeech => 'Riconoscimento vocale';

  @override
  String get permPhotos => 'Foto';

  @override
  String get permContacts => 'Contatti';

  @override
  String get permCalendar => 'Calendari';

  @override
  String get permHealth => 'Salute';

  @override
  String get permNotifications => 'Notifiche';

  @override
  String get permNotificationAccess => 'Accesso alle notifiche';

  @override
  String get permAccessibility => 'Accessibilità';

  @override
  String get permScreenRecording => 'Registrazione schermo';

  @override
  String get permAutomation => 'Automazione';

  @override
  String get permFullDisk => 'Accesso completo al disco';

  @override
  String get permSharedFolders => 'Cartelle condivise';

  @override
  String get permLocalTools => 'Strumenti locali';

  @override
  String get cardPermissions => 'Permessi';

  @override
  String permissionsTitle(String device) {
    return 'Attivali per $device';
  }

  @override
  String get permStateOn => 'Attivo';

  @override
  String get permStateOff => 'Disattivo';

  @override
  String get permStateNotAsked => 'Non ancora chiesto';

  @override
  String get permStateLimited => 'Limitato';

  @override
  String get permStateUnknown => 'Sconosciuto';

  @override
  String get permStateUnavailable => 'Non disponibile su questo dispositivo';

  @override
  String get permStateUpdate => 'Aggiorna Casama per attivarlo qui';

  @override
  String get permTurnOn => 'Attiva';

  @override
  String get permOpenSettings => 'Apri impostazioni';

  @override
  String get permOpenHealth => 'Apri Salute';

  @override
  String get permHealthIosHow =>
      'In Salute, tocca la tua immagine, poi App, poi Casama e attiva ciò che i tuoi bot possono leggere.';

  @override
  String get permChoose => 'Scegli';

  @override
  String get permRestart => 'Riavvia Casama';

  @override
  String get permRestartToFinish => 'Riavvia Casama per completare';

  @override
  String permOpenedOn(String device) {
    return 'Aperto su $device';
  }

  @override
  String permSentTo(String device) {
    return 'Inviato a $device: tocca la notifica lì';
  }

  @override
  String permOffline(String device) {
    return '$device è offline';
  }

  @override
  String permRestarting(String device) {
    return 'Riavvio di Casama su $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Solo il proprietario di $device può attivarli';
  }

  @override
  String get permNotNowLine => 'Non ora';

  @override
  String get permContinue => 'Continua';

  @override
  String get permContinueMessage => 'Permessi attivati, procedi.';

  @override
  String get permContinuedLine => 'Attivato';

  @override
  String get permissionsScreenTitle => 'Permessi';

  @override
  String get permissionsScreenHelp =>
      'Cosa possono usare i bot su questo dispositivo. Non viene chiesto nulla finché non tocchi.';

  @override
  String get permissionsRowHelp =>
      'Posizione, schermo, microfono e altro su questo dispositivo';

  @override
  String permOtherDevice(String device) {
    return 'Questo era per $device. Apri Casama lì per attivarlo.';
  }

  @override
  String get permAnotherDevice => 'un altro dispositivo';

  @override
  String get permissionsNone => 'Nulla da attivare su questo dispositivo.';

  @override
  String get widgetNeedsYou => 'In attesa';

  @override
  String get widgetAllClear => 'Tutto a posto';

  @override
  String get widgetAllow => 'Consenti';

  @override
  String get widgetDeny => 'Nega';

  @override
  String get widgetReview => 'Esamina';

  @override
  String get widgetOpen => 'Apri';

  @override
  String get widgetDoIt => 'Fallo';

  @override
  String get widgetRunNow => 'Esegui ora';

  @override
  String get widgetStarted => 'Avviata';

  @override
  String get widgetStop => 'Ferma';

  @override
  String get widgetAsk => 'Chiedi';

  @override
  String widgetAskBot(String bot) {
    return 'Chiedi a $bot';
  }

  @override
  String get widgetTalk => 'Parla';

  @override
  String get widgetTry => 'Prova';

  @override
  String get widgetUpNext => 'In arrivo';

  @override
  String get widgetNoRoutines => 'Ancora nessuna routine';

  @override
  String get widgetWorking => 'Al lavoro';

  @override
  String get widgetWaiting => 'In attesa di te';

  @override
  String get widgetIdle => 'Inattivo';

  @override
  String widgetRepliedAt(String time) {
    return 'Risposto $time';
  }

  @override
  String get widgetBrief => 'Riepilogo';

  @override
  String widgetBriefAt(String time) {
    return 'Riepilogo alle $time';
  }

  @override
  String get widgetNoBrief => 'Ancora nessun riepilogo';

  @override
  String get widgetToday => 'Oggi';

  @override
  String get widgetCredits => 'Crediti';

  @override
  String widgetCreditsLeft(String amount) {
    return '$amount rimasti';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount oggi';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n% usato';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Si azzera $time';
  }

  @override
  String get widgetFinished => 'Completato';

  @override
  String get widgetLibrary => 'Libreria';

  @override
  String get widgetNoCreations => 'Ancora nulla di creato';

  @override
  String get widgetTasks => 'Attività';

  @override
  String get widgetTodo => 'Da fare';

  @override
  String get widgetInProgress => 'In corso';

  @override
  String get widgetInReview => 'In revisione';

  @override
  String get widgetBlocked => 'Bloccate';

  @override
  String get widgetSignIn => 'Apri Casama per accedere';

  @override
  String get widgetNoBots => 'Incontra il tuo primo bot';

  @override
  String widgetAsOf(String time) {
    return 'alle $time';
  }

  @override
  String get widgetUpdateServer =>
      'Aggiorna il tuo server Casama per usare questo widget';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot ha bisogno del tuo OK';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot suggerisce';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot chiede di prendere il controllo';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Prossimo riepilogo: $time';
  }

  @override
  String get widgetNothingNext => 'Nulla in programma';

  @override
  String get widgetsTitle => 'Widget';

  @override
  String get widgetsRow =>
      'I tuoi bot sulla schermata Home e su quella di blocco';

  @override
  String get widgetsIntro =>
      'I widget mostrano cosa stanno facendo i tuoi bot e cosa è in attesa, senza aprire Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Routine';

  @override
  String get widgetDescNeedsYou => 'Vedi quali bot ti stanno aspettando';

  @override
  String get widgetDescBot => 'Vedi cosa sta facendo un bot';

  @override
  String get widgetDescAsk => 'Chiedi o parla a un bot con un tocco';

  @override
  String get widgetDescRoutines => 'Vedi cosa parte dopo ed eseguilo ora';

  @override
  String get widgetDescToday => 'Vedi tutta la giornata in un widget grande';

  @override
  String get widgetDescBrief => 'Leggi il riepilogo mattutino';

  @override
  String get widgetDescLibrary =>
      'Vedi cosa hanno creato i tuoi bot di recente';

  @override
  String get widgetDescTasks => 'Vedi a che punto è la bacheca attività';

  @override
  String get widgetDescCredits => 'Tieni d’occhio i tuoi crediti';

  @override
  String get widgetsAddToHome => 'Aggiungi a schermata Home';

  @override
  String get widgetsPinUnsupported =>
      'Il tuo launcher non può aggiungere widget da qui. Tocca e tieni premuto un punto vuoto sulla schermata Home, tocca Widget e scegli Casama.';

  @override
  String get widgetsHowToAdd => 'Come aggiungerlo';

  @override
  String get widgetsHowToIos =>
      'Tocca e tieni premuto un punto vuoto sulla schermata Home, tocca Modifica, poi Aggiungi widget e scegli Casama.';

  @override
  String get widgetsHowToMac =>
      'Fai clic su data e ora nella barra dei menu, poi Modifica widget e scegli Casama. Oppure fai clic destro sulla scrivania e scegli Modifica widget.';

  @override
  String get widgetsLockScreen => 'Schermata di blocco e controlli';

  @override
  String get widgetsLockScreenHelp =>
      'Tocca e tieni premuta la schermata di blocco, tocca Personalizza, poi Schermata di blocco e tocca lo spazio sotto l’orologio per aggiungere In attesa, In arrivo, Bot o Crediti. Le richieste restano nascoste finché non sblocchi.';

  @override
  String get widgetsControlsHelp =>
      'Apri Centro di Controllo, tocca e tieni premuto, tocca Aggiungi un controllo e scegli Chiedi a Casama, Parla con un bot o Esegui una routine. Vanno bene anche negli angoli della schermata di blocco e sul tasto Azione.';

  @override
  String get widgetsShowDetails => 'Mostra dettagli nei widget';

  @override
  String get widgetsShowDetailsHelp =>
      'Con il blocco app attivo, i widget mostrano solo numeri e nomi dei bot, e i pulsanti aprono Casama. Attivalo per mostrare anche richieste, messaggi e nomi delle routine.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Conta solo finché il blocco app è attivo. Senza, i widget mostrano i dettagli.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace richiede il blocco app, quindi i widget nascondono i dettagli.';
  }

  @override
  String get widgetsPinBot => 'Fissa un bot alla schermata Home';

  @override
  String get widgetsPinBotHelp =>
      'Mette il bot sulla schermata Home come icona dedicata. Toccala per chattare.';

  @override
  String get widgetsPin => 'Fissa';

  @override
  String get widgetNudgeNeedsYou =>
      'Rispondi alle richieste dalla schermata Home con il widget In attesa.';

  @override
  String get widgetNudgeRoutines =>
      'Avvia le routine dalla schermata Home con il widget Routine.';

  @override
  String get widgetNameCanvas => 'Lavagna';

  @override
  String get widgetDescCanvas =>
      'Mostra ciò che mettono i tuoi bot, come una frase del giorno o un conto alla rovescia';

  @override
  String get canvasEmpty => 'Chiedi a un bot di mettere qualcosa qui';

  @override
  String get canvasTry =>
      'Prova: metti una frase del giorno sulla schermata di blocco';

  @override
  String get canvasAutomatic => 'Automatico';

  @override
  String canvasIn(String time) {
    return 'tra $time';
  }

  @override
  String canvasSince(String time) {
    return '$time fa';
  }

  @override
  String get canvasNow => 'Ora';

  @override
  String canvasLeft(String n) {
    return '$n rimasti';
  }

  @override
  String get canvasLeftUnit => 'rimasti';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'giorni',
      one: 'giorno',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widget';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot vuole mostrarlo sui tuoi widget';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Una volta detto sì, $bot può aggiornarlo senza chiedere. Puoi fermarlo in qualsiasi momento in Impostazioni, Widget.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot ha messo questo sui tuoi widget';
  }

  @override
  String get canvasShow => 'Mostra sui miei widget';

  @override
  String get canvasShowing => 'Visibile sui tuoi widget';

  @override
  String canvasNotShown(String bot) {
    return 'Non mostrato. $bot potrà chiederlo un altro giorno.';
  }

  @override
  String get canvasGone => 'Non più sui tuoi widget';

  @override
  String get canvasNotPlaced => 'Aggiungi il widget Lavagna per vederlo.';

  @override
  String get canvasHowToIos =>
      'Tocca e tieni premuta la schermata Home o di blocco, tocca Modifica, poi Aggiungi widget e scegli Casama, quindi Lavagna.';

  @override
  String get canvasHowToMac =>
      'Fai clic destro sulla scrivania, scegli Modifica widget, poi Casama e infine Lavagna.';

  @override
  String get canvasHowToElsewhere =>
      'Aggiungi il widget Lavagna di Casama sul telefono o sul Mac per vederlo lì.';

  @override
  String get canvasAdded => 'Widget Lavagna aggiunto';

  @override
  String get canvasLockScreen => 'Sulla schermata di blocco';

  @override
  String get widgetsFromBots => 'Dai tuoi bot';

  @override
  String get widgetsFromBotsEmpty =>
      'Ancora nulla. Chiedi a un bot qualcosa come \"Metti una frase del giorno sulla schermata di blocco\".';

  @override
  String canvasSetAt(String time) {
    return 'Impostato $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Visibile su $devices';
  }

  @override
  String get canvasNoWidget => 'Ancora nessun widget Lavagna posizionato';

  @override
  String get canvasPausedLine => 'In pausa';

  @override
  String get canvasWaitingLine => 'In attesa del tuo sì';

  @override
  String get canvasHideLocked => 'Nascondi su telefono bloccato';

  @override
  String get canvasPause => 'Metti in pausa';

  @override
  String get canvasResume => 'Riprendi';

  @override
  String get canvasClear => 'Svuota';

  @override
  String canvasClearTitle(String name) {
    return 'Svuotare $name?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Verrà tolto dai tuoi widget. $bot potrà mettere di nuovo qualcosa lì.';
  }

  @override
  String get canvasAllowedBots => 'Bot sui tuoi widget';

  @override
  String get canvasMayShow => 'Può mostrare contenuti sui tuoi widget';

  @override
  String canvasStopTitle(String bot) {
    return 'Fermare $bot?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'Ciò che $bot mostra sui tuoi widget verrà rimosso e dovrà chiedere di nuovo.';
  }

  @override
  String get canvasStop => 'Ferma';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Telefono Android';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Mostrami';

  @override
  String get widgetLowRisk => 'Rischio basso';

  @override
  String get widgetThisMonth => 'Questo mese';

  @override
  String get watchNow => 'Ora';

  @override
  String get watchAsk => 'Chiedi';

  @override
  String watchAskBot(String bot) {
    return 'Chiedi a $bot';
  }

  @override
  String get watchBots => 'Bot';

  @override
  String get watchUpNext => 'In arrivo';

  @override
  String get watchBrief => 'Riepilogo';

  @override
  String get watchSettings => 'Impostazioni';

  @override
  String get watchChat => 'Chat';

  @override
  String get watchTalk => 'Parla';

  @override
  String get watchCredits => 'Crediti';

  @override
  String get watchNeedsYou => 'In attesa';

  @override
  String get watchNeedsYouOne => '1 in attesa';

  @override
  String watchNeedsYouMany(String count) {
    return '$count in attesa';
  }

  @override
  String get watchNeedsOk => 'Richiede il tuo OK';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot vuole il tuo OK';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot suggerisce';
  }

  @override
  String get watchTakeOver => 'Vuole che prendi il controllo';

  @override
  String get watchAllClear => 'Tutto a posto';

  @override
  String get watchNothingWaiting => 'Niente in attesa';

  @override
  String get watchAllow => 'Consenti';

  @override
  String get watchDeny => 'Nega';

  @override
  String get watchHoldToAllow => 'Tieni premuto';

  @override
  String get watchHoldHint => 'Consentire? Tocca due volte per consentire.';

  @override
  String get watchReview => 'Esamina';

  @override
  String get watchReviewOnIphone => 'Esamina su iPhone';

  @override
  String get watchReviewOnPhone => 'Esamina sul telefono';

  @override
  String get watchWhyHighRisk => 'Rischio alto: rispondi sul telefono';

  @override
  String get watchWhyPayment => 'I pagamenti si confermano sul telefono';

  @override
  String get watchWhySetting => 'Le impostazioni lo tengono sul telefono';

  @override
  String get watchWhyWorkspace => 'Lo spazio di lavoro lo tiene sul telefono';

  @override
  String get watchWhyNotYours => 'Solo chi ha avviato la chat può consentirlo';

  @override
  String get watchHighRisk => 'Rischio alto';

  @override
  String get watchMediumRisk => 'Rischio medio';

  @override
  String get watchLowRisk => 'Rischio basso';

  @override
  String get watchAllowed => 'Consentito';

  @override
  String get watchDenied => 'Negato';

  @override
  String get watchDone => 'Fatto';

  @override
  String get watchAlreadyAnswered => 'Già risposto';

  @override
  String get watchLockToAllow =>
      'Imposta un codice sull’orologio per consentire da qui';

  @override
  String get watchDoIt => 'Fallo';

  @override
  String get watchNotNow => 'Non ora';

  @override
  String get watchOpenOnIphone => 'Apri su iPhone';

  @override
  String get watchOpenOnPhone => 'Apri sul telefono';

  @override
  String get watchSentToPhone => 'Inviato al telefono';

  @override
  String get watchWorking => 'Al lavoro';

  @override
  String watchIsWorking(String bot) {
    return '$bot sta lavorando';
  }

  @override
  String get watchWaitingForYou => 'In attesa di te';

  @override
  String watchRepliedAt(String time) {
    return 'Risposto $time';
  }

  @override
  String get watchIdle => 'Inattivo';

  @override
  String get watchOff => 'Disattivo';

  @override
  String watchStepCount(String count) {
    return 'Passaggio $count';
  }

  @override
  String get watchStop => 'Ferma';

  @override
  String get watchStopped => 'Fermato';

  @override
  String get watchFinished => 'Completato';

  @override
  String get watchProblem => 'Problema';

  @override
  String get watchCouldntFinish => 'Impossibile completare';

  @override
  String get watchListening => 'In ascolto…';

  @override
  String get watchTapToStop => 'Tocca per fermare';

  @override
  String get watchTypeInstead => 'Scrivi invece';

  @override
  String get watchSending => 'Invio…';

  @override
  String get watchHeard => 'Sentito';

  @override
  String get watchUndo => 'Annulla';

  @override
  String get watchKeptOffline => 'Salvato. Verrà inviato appena torni online';

  @override
  String watchKeptOld(String time) {
    return 'Inviare la richiesta delle $time?';
  }

  @override
  String get watchSend => 'Invia';

  @override
  String get watchDiscard => 'Scarta';

  @override
  String get watchMicDenied =>
      'Consenti il microfono nelle Impostazioni per chiedere a voce';

  @override
  String get watchNoDictation =>
      'Questo server non ha servizi vocali. Usa Scrivi invece';

  @override
  String get watchDidntCatch => 'Non ho capito. Riprova';

  @override
  String get watchReply => 'Rispondi';

  @override
  String get watchReadAloud => 'Leggi ad alta voce';

  @override
  String get watchStopReading => 'Ferma lettura';

  @override
  String get watchContinuesOnIphone => 'Continua su iPhone';

  @override
  String get watchContinuesOnPhone => 'Continua sul telefono';

  @override
  String get watchReplyReady => 'Risposta pronta';

  @override
  String get watchYou => 'Tu';

  @override
  String get watchQuickYes => 'Sì';

  @override
  String get watchQuickNo => 'No';

  @override
  String get watchQuickTellMore => 'Dimmi di più';

  @override
  String get watchQuickNotNow => 'Non ora';

  @override
  String get watchRunNow => 'Esegui ora';

  @override
  String get watchStarted => 'Avviata';

  @override
  String watchInMinutes(String minutes) {
    return 'tra $minutes min';
  }

  @override
  String get watchNoRoutines => 'Nessuna routine';

  @override
  String watchBriefAt(String time) {
    return 'Riepilogo alle $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Riepilogo domani $time';
  }

  @override
  String get watchNoBrief => 'Nessun riepilogo';

  @override
  String get watchNoBots => 'Nessun bot. Creane uno sul telefono';

  @override
  String get watchSigningIn => 'Accesso in corso';

  @override
  String watchSignedInAs(String name) {
    return 'Accesso come $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone => 'Apri Casama su iPhone per finire';

  @override
  String get watchOpenPhoneToFinish => 'Apri Casama sul telefono per finire';

  @override
  String get watchUseCode => 'Accedi con un codice';

  @override
  String get watchCodeHelp =>
      'Digita in Casama su telefono o computer: Impostazioni → Orologio';

  @override
  String get watchNewCode => 'Nuovo codice';

  @override
  String get watchSignedOut => 'Orologio disconnesso';

  @override
  String get watchOpenToSignIn => 'Apri Casama per accedere';

  @override
  String watchAsOf(String time) {
    return 'alle $time';
  }

  @override
  String get watchOffline => 'Offline';

  @override
  String get watchCouldntReach => 'Impossibile raggiungere Casama';

  @override
  String get watchTryAgain => 'Riprova';

  @override
  String get watchServerTooOld =>
      'Aggiorna il tuo server Casama per usare l’orologio';

  @override
  String get watchOutOfCredits => 'Crediti esauriti';

  @override
  String get watchTalkOnPhone => 'Avvio chiamata sul telefono';

  @override
  String get watchSignOut => 'Esci da questo orologio';

  @override
  String get watchHideDetails => 'Nascondi dettagli a polso abbassato';

  @override
  String get watchReadRepliesAloud => 'Leggi risposte ad alta voce';

  @override
  String get watchAskUses => 'Bot per Chiedi';

  @override
  String get watchWorkspace => 'Spazio di lavoro';

  @override
  String get watchSignedInAsLabel => 'Accesso come';

  @override
  String get watchCompNeedsYou => 'In attesa';

  @override
  String get watchCompAsk => 'Chiedi a un bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'In arrivo';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou => 'Quante richieste aspettano e la prima';

  @override
  String get watchCompDescAsk => 'Chiedi a un bot a voce con un tocco';

  @override
  String get watchCompDescBot => 'Stato di un bot e cosa sta facendo';

  @override
  String get watchCompDescUpNext => 'La prossima routine e quando parte';

  @override
  String get watchCompDescCredits => 'Crediti usati in questo periodo';

  @override
  String get watchNeedYouShort => 'in attesa';

  @override
  String get watchControlAsk => 'Chiedi a Casama';

  @override
  String get watchControlTalk => 'Parla con un bot';

  @override
  String get watchControlRun => 'Esegui una routine';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count in attesa. Primo: $text';
  }

  @override
  String get watchPhoneTitle => 'Orologio';

  @override
  String get watchPhoneIntro =>
      'Rispondi ai bot, chiedi a voce e guarda chi sta lavorando, dal polso.';

  @override
  String get watchPhoneWatches => 'Orologi connessi';

  @override
  String get watchPhoneNone =>
      'Nessun orologio connesso. Apri Casama sull’orologio e accederà da solo.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Ultimo uso $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Mai usato ancora';

  @override
  String get watchPhoneRemove => 'Rimuovi';

  @override
  String watchPhoneRemoveTitle(String name) {
    return 'Rimuovere $name?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Verrà disconnesso subito. Potrai accedere di nuovo in seguito.';

  @override
  String get watchPhoneUseCode => 'Connetti un orologio con un codice';

  @override
  String get watchPhoneCodeHint => 'Il codice sull’orologio';

  @override
  String watchPhoneCodeAsk(String name) {
    return 'Connettere $name?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Verrà connesso a $workspace con il tuo account. Consenti solo un codice mostrato sul tuo orologio.';
  }

  @override
  String get watchPhoneCodeAllow => 'Connetti';

  @override
  String get watchPhoneCodeWrong =>
      'Codice non valido. Controllalo sull’orologio';

  @override
  String get watchPhoneCodeTaken =>
      'Questo orologio è ancora connesso a un altro account. Rimuovilo lì in Impostazioni → Orologio, poi ottieni un nuovo codice';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Connesso a $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'Connesso a un altro spazio di lavoro';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name è connesso';
  }

  @override
  String get watchPhoneAllowTitle => 'Consenti dall’orologio';

  @override
  String get watchPhoneAllowMedium => 'Rischio basso e medio';

  @override
  String get watchPhoneAllowMediumBody =>
      'Rischio basso con un tocco, medio tenendo premuto. Rischio alto e pagamenti richiedono sempre il telefono.';

  @override
  String get watchPhoneAllowLow => 'Solo rischio basso';

  @override
  String get watchPhoneAllowNone => 'Mai';

  @override
  String get watchPhoneDetails => 'Mostra dettagli sull’orologio';

  @override
  String get watchPhoneDetailsBody =>
      'Disattivo: l’orologio mostra conteggi e nomi dei bot, non ciò che scrivono.';

  @override
  String get watchPhoneQuickReplies => 'Risposte rapide';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Brevi risposte da inviare da una notifica. Fino a sei.';

  @override
  String get watchPhoneQuickAdd => 'Aggiungi risposta rapida';

  @override
  String get watchPhoneQuickReset => 'Usa le risposte predefinite';

  @override
  String get watchPhoneHowTo => 'Aggiungi Casama al quadrante';

  @override
  String get watchPhoneHowToApple =>
      'Tocca e tieni premuto il quadrante, tocca Modifica, poi scegli Casama per una complicazione. Ruota la Digital Crown sul quadrante per trovare Casama nella Raccolta smart.';

  @override
  String get watchPhoneHowToWear =>
      'Tocca e tieni premuto il quadrante per aggiungere una complicazione Casama. Scorri a sinistra dal quadrante e tocca + per aggiungere una scheda Casama.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Accesso di $name…';
  }

  @override
  String get watchPhoneLockAsk => 'Connettere l’orologio?';

  @override
  String get watchPhoneNudge =>
      'Casama è anche sul tuo orologio. Rispondi ai bot dal polso.';

  @override
  String get watchPhoneHandoffTitle => 'Dall’orologio';

  @override
  String get watchPhoneRow => 'I tuoi bot su Apple Watch o su orologio Wear OS';

  @override
  String get watchPhoneAllowLowBody =>
      'Rischio basso con un tocco. Tutto il resto richiede il telefono.';

  @override
  String get watchPhoneAllowNoneBody =>
      'L’orologio può solo negare. Consenti dal telefono.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Disattivato perché il blocco app è attivo, quindi l’orologio non mostra parole delle tue chat. Attivalo per vederle.';

  @override
  String get watchPhoneQuickHint => 'Una risposta breve';

  @override
  String get watchPhoneQuickTooLong => 'Massimo 40 caratteri';

  @override
  String get watchPhoneQuickMoveUp => 'Sposta su';

  @override
  String get watchPhoneQuickMoveDown => 'Sposta giù';

  @override
  String get watchPhoneQuickDelete => 'Elimina questa risposta';

  @override
  String get watchPhoneCodeBody =>
      'Sull’orologio apri Casama e scegli Accedi con un codice.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => 'Chi sta lavorando e cosa sta facendo';

  @override
  String get watchCompDescBrief => 'Il riepilogo di stamattina';

  @override
  String get watchCodeWaiting => 'In attesa del codice…';

  @override
  String watchCodeA11y(String code) {
    return 'Codice di accesso $code';
  }

  @override
  String get watchChooseBot => 'Scegli un bot';

  @override
  String get watchChannelRequests => 'Richieste';

  @override
  String get watchChannelReplies => 'Risposte';

  @override
  String get watchChannelRuns => 'Bot al lavoro';

  @override
  String get watchChannelOther => 'Altro';

  @override
  String get watchOtherWorkspace =>
      'È in un altro spazio di lavoro. Rispondi sul telefono';

  @override
  String get watchReplySent => 'Inviato';

  @override
  String get watchReplyNotSent => 'Impossibile inviare la risposta';

  @override
  String watchAskDropped(String time) {
    return 'Impossibile inviare la richiesta delle $time';
  }

  @override
  String get watchNeedsHttps =>
      'Questo orologio può raggiungere il server solo su https o sulla rete di casa';

  @override
  String get watchSignIn => 'Accedi';

  @override
  String get watchNotOnWatch =>
      'L’orologio non può rispondere a questa. Aprila sul telefono';

  @override
  String watchMoreOnPhone(String count) {
    return 'Altri $count sul telefono';
  }

  @override
  String get watchShareCrashReports => 'Condividi segnalazioni di arresto';

  @override
  String get showList => 'Mostra elenco';

  @override
  String get hideList => 'Nascondi elenco';

  @override
  String get panePickLibrary =>
      'Scegli qualcosa dalla libreria per vederlo qui.';

  @override
  String get panePickSetting => 'Scegli un’impostazione per vederla qui.';

  @override
  String get trackpad => 'Trackpad';

  @override
  String get trackpadHint =>
      'Un dito sposta il puntatore, due scorrono, un tocco fa clic.';

  @override
  String get trackpadTakeControl =>
      'Prendi il controllo per usare il trackpad.';

  @override
  String get foldScreenTitle => 'Schermo pieghevole';

  @override
  String get foldRowHelp =>
      'Cosa vede Casama degli schermi di questo dispositivo';

  @override
  String get foldScreenHelp =>
      'Come è impugnato questo dispositivo e dov’è la piega, così come li vede Casama ora. Apri, chiudi o piega il dispositivo e i numeri si aggiornano. Copiali se una schermata appare errata.';

  @override
  String get foldPose => 'Postura';

  @override
  String get foldWindow => 'Finestra';

  @override
  String get foldInsets => 'Area sicura';

  @override
  String get foldStrip => 'Fascia laterale';

  @override
  String get foldFold => 'Piega';

  @override
  String get foldHinge => 'Cerniera';

  @override
  String get foldSystemSays => 'Cosa segnala il sistema';

  @override
  String get inviteGateLine => 'Casama Cloud è al momento solo su invito.';

  @override
  String get inviteGateSelfHost =>
      'Eseguire Casama sul tuo server è aperto a tutti.';

  @override
  String get joinTheWaitlist => 'Iscriviti alla lista d’attesa';

  @override
  String get iHaveAnInvite => 'Ho un invito';

  @override
  String get waitlistSubtitle =>
      'Ammettiamo le persone un po’ alla volta. Riceverai un’email quando sarà il tuo turno.';

  @override
  String get waitlistNote => 'Cosa vorresti far fare per prima cosa a un bot?';

  @override
  String get waitlistNoteHint => 'Facoltativo';

  @override
  String get waitlistSelfHosting => 'Uso Casama sul mio server';

  @override
  String get waitlistNewsletter =>
      'Inviami anche l’email mensile di Casama (al massimo una volta al mese)';

  @override
  String get waitlistAppleRelay =>
      'Questo è l’indirizzo privato creato da Apple per te. Conservalo se accederai con Apple; Apple inoltra le nostre email alla tua casella di posta.';

  @override
  String get waitlistJoinedTitle => 'Sei in lista.';

  @override
  String get waitlistJoinedBody =>
      'Ammettiamo le persone un po’ alla volta. Riceverai un’email quando sarà il tuo turno e nient’altro, a meno che tu non abbia chiesto l’email mensile. Conosci qualcuno che usa Casama? Un suo invito ti fa entrare subito.';

  @override
  String get waitlistJoinedCode => 'Hai un codice di invito? Inseriscilo qui.';

  @override
  String get waitlistJoinedSelfHost =>
      'Non vuoi aspettare? Casama è open source. Eseguilo oggi stesso sul tuo computer.';

  @override
  String get waitlistRunItYourself => 'Eseguilo in autonomia';

  @override
  String get inviteSubtitle =>
      'Inserisci il tuo codice di invito oppure incolla il link di invito.';

  @override
  String get inviteCodeLabel => 'Codice di invito';

  @override
  String get inviteNotFound =>
      'Quel codice non corrisponde a nessun invito. Controllalo e riprova.';

  @override
  String inviteFromName(String name) {
    return '$name ti ha invitato su Casama';
  }

  @override
  String get inviteFromFriend => 'Un amico ti ha invitato su Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Il tuo invito: $label';
  }

  @override
  String get inviteFromCasama => 'Il tuo invito su Casama';

  @override
  String get inviteChooseSignIn =>
      'Ora scegli come accedere. Usa l’indirizzo che desideri per il tuo account.';

  @override
  String get inviteGoneHelp =>
      'Questi inviti sono esauriti. Inserisci la tua email e verrai messo in lista d’attesa, davanti alla fila.';

  @override
  String get inviteEmailHelp =>
      'Abiliteremo questo indirizzo, poi gli invieremo un link di accesso.';

  @override
  String inviteCheckInbox(String email) {
    return 'Sei dentro. Controlla $email per trovare un link di accesso, oppure digita qui il codice.';
  }

  @override
  String get inviteWaitlistedTitle => 'Sei in lista d’attesa';

  @override
  String get inviteWaitlisted =>
      'Questi inviti sono esauriti, ma sei davanti alla fila.';

  @override
  String get inviteUseEmailHere =>
      'Su questo dispositivo usa Continua con email. Apple e Google funzionano con un invito nelle app per iPhone, Mac e Android.';

  @override
  String get inviteDifferentCode => 'Usa un altro codice';

  @override
  String get inviteRefusedHelp =>
      'Iscriviti alla lista d’attesa e ti scriveremo via email quando sarà il tuo turno, oppure inserisci un codice di invito se ne hai uno.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud è al momento solo su invito. Ti invieremo un’email quando sarà il tuo turno. Hai un codice di invito? Usalo ora.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count inviti rimasti',
      one: '1 invito rimasto',
      zero: 'Nessun invito rimasto',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used su $total usati. Ognuno permette a un amico di creare un account.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'I tuoi inviti si sbloccano dopo la prima chat completata.';

  @override
  String get inviteWaitingTitle => 'In attesa del tuo invito';

  @override
  String get inviteWaitingUses => 'Farli entrare usa uno dei tuoi inviti.';

  @override
  String get inviteWaitingNoneLeft =>
      'Riottieni un invito quando un amico che hai invitato completa la sua prima chat.';

  @override
  String get inviteWaitingLetIn => 'Fai entrare';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Fai entrare $email';
  }

  @override
  String get inviteWaitingDone =>
      'Riceverà un’email per iscriversi tra pochi minuti.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ho salvato uno dei miei $count inviti per Casama per te.',
      one: 'Ho salvato il mio invito per Casama per te.',
    );
    return '$_temp0 Al momento Casama è solo su invito e questo ti permette di entrare subito: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ti ho tenuto da parte uno dei miei $count inviti per Casama.',
      one: 'Ti ho tenuto da parte il mio invito per Casama.',
    );
    return '$_temp0 Al momento Casama è solo su invito. Questo ti permette di entrare subito e ricevi $amount di utilizzo gratuito dopo la tua prima chat: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Per chi è?';

  @override
  String get inviteNameHelp =>
      'Aggiungi il suo nome e la pagina di invito lo saluterà per nome. Puoi lasciarlo vuoto.';

  @override
  String get inviteNameHint => 'Nome';

  @override
  String get inviteNameShare => 'Condividi invito';

  @override
  String get inviteAskTitle => 'Chi altro lo userebbe?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Hai $count inviti per Casama. Ciascuno permette a un amico di entrare subito.',
      one: 'Hai 1 invito per Casama. Permette a un amico di entrare subito.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Ricevete entrambi $amount di utilizzo gratuito dopo la sua prima chat.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Ricevi $amount di utilizzo gratuito dopo la sua prima chat.';
  }

  @override
  String get inviteAskSend => 'Invia un invito';

  @override
  String get inviteAskNotNow => 'Non ora';

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
      other: '$count ricariche salvate',
      one: '1 ricarica salvata',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Usa entro il $date';
  }

  @override
  String get savedResetUse => 'Usa ricarica';

  @override
  String get savedResetConfirmTitle => 'Usare questa ricarica?';

  @override
  String get savedResetConfirmDaily =>
      'Azzera il limite di oggi così i tuoi bot possono lavorare di nuovo oggi. Non si può annullare.';

  @override
  String get savedResetConfirmComputer =>
      'Restituisce le ore di computer di questo mese. Non si può annullare.';

  @override
  String get savedResetOwnerRequired =>
      'Solo il proprietario di uno spazio di lavoro può usarla.';

  @override
  String get savedResetPaused => 'In pausa per ora. Controlla più tardi.';

  @override
  String get savedResetPeriodLimit =>
      'Hai già usato la ricarica di questo periodo. Potrai usare questa nel periodo successivo.';

  @override
  String get savedResetNothingToRefill =>
      'Ancora nulla da ricaricare. Conservala per quando i crediti stanno per finire.';

  @override
  String get savedResetNoBillingPeriod =>
      'Disponibile quando la configurazione del tuo piano sarà completata.';

  @override
  String get savedResetUnavailable => 'Non disponibile in questo momento.';

  @override
  String savedResetDone(String amount) {
    return 'Ricarica usata: aggiunti $amount';
  }

  @override
  String get savedResetDoneNoCredits => 'Ricarica usata';

  @override
  String savedResetConfirm(String amount) {
    return 'Ricarica $amount dei crediti inclusi in questo periodo. Non si può annullare.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Abilita ricariche salvate';

  @override
  String get resetsOffNote => 'Disattivo: nessuno riceve ricariche salvate.';

  @override
  String get resetsDecrease => 'Meno';

  @override
  String get resetsIncrease => 'Più';

  @override
  String get resetsSettings => 'Impostazioni';

  @override
  String get resetsCampaigns => 'Campagne';

  @override
  String get resetsStatLive => 'Attiva';

  @override
  String get resetsStatGiven => 'Assegnate';

  @override
  String get resetsStatUsed => 'Usate';

  @override
  String get resetsStatRefilled => 'Ricaricati';

  @override
  String get resetsFilterActive => 'Attive';

  @override
  String get resetsFilterEnded => 'Terminate';

  @override
  String get resetsFilterAll => 'Tutte';

  @override
  String get resetsStateDraft => 'Bozza';

  @override
  String get resetsStateScheduled => 'Pianificata';

  @override
  String get resetsStateLive => 'Attiva';

  @override
  String get resetsStatePaused => 'In pausa';

  @override
  String get resetsStateEnded => 'Terminata';

  @override
  String get resetsStateCancelled => 'Annullata';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used su $budget di budget';
  }

  @override
  String resetsGivenN(String count) {
    return '$count assegnate';
  }

  @override
  String resetsUsedN(String count) {
    return '$count usate';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Inizio $start · Fine $end';
  }

  @override
  String get resetsToday => 'oggi';

  @override
  String get resetsTomorrow => 'domani';

  @override
  String get resetsYesterday => 'ieri';

  @override
  String get resetsAudienceEveryone => 'Ogni spazio di lavoro';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spazi di lavoro',
      one: '1 spazio di lavoro',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Iscritto prima del $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Raggiunto un limite negli ultimi $days giorni',
      one: 'Raggiunto un limite oggi',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Annulla campagna';

  @override
  String get resetsCancelConfirm => 'Annullare questa campagna?';

  @override
  String get resetsCancelConfirmBody =>
      'Smette di assegnare ricariche salvate. Non si può annullare.';

  @override
  String get resetsDeleteConfirm => 'Eliminare questa campagna?';

  @override
  String get resetsDeleteConfirmBody =>
      'La bozza verrà eliminata definitivamente.';

  @override
  String get resetsNoCampaigns =>
      'Ancora nessuna campagna. Avviane una per dare ricariche salvate a molti spazi di lavoro insieme.';

  @override
  String get resetsNoMatches => 'Nessuna campagna qui.';

  @override
  String get resetsEditCampaign => 'Modifica campagna';

  @override
  String get resetsSectionBasics => 'Informazioni di base';

  @override
  String get resetsSectionAudience => 'Destinatari';

  @override
  String get resetsSectionTiming => 'Tempistiche';

  @override
  String get resetsSectionRefill => 'Ricarica';

  @override
  String get resetsSectionWhat => 'Cosa ricaricare';

  @override
  String get resetsSectionNotify => 'Notifiche';

  @override
  String get resetsPreviewLabel => 'Cosa vedono le persone';

  @override
  String get resetsMonthly => 'Mensile';

  @override
  String get resetsYearly => 'Annuale';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Piani';

  @override
  String get resetsPlansHint =>
      'Non selezionarne nessuno per includere tutti i piani.';

  @override
  String get resetsWorkspacesLabel => 'Spazi di lavoro';

  @override
  String get resetsWorkspacesHint =>
      'Lascia vuoto per includere tutti gli spazi di lavoro.';

  @override
  String get resetsSearchWorkspaces => 'Cerca spazi di lavoro per nome';

  @override
  String get resetsNoWorkspaceMatch => 'Nessuno spazio di lavoro corrisponde.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Solo $name';
  }

  @override
  String get resetsJoinedBefore => 'Iscritto prima del';

  @override
  String get resetsLimitedDaysLabel =>
      'Ha raggiunto un limite negli ultimi N giorni';

  @override
  String get resetsStartsLabel => 'Inizio';

  @override
  String get resetsEndsLabel => 'Scadenza';

  @override
  String resetsPercentValue(int percent) {
    return 'Ricarica il $percent% dei crediti inclusi';
  }

  @override
  String get resetsCapLabel => 'Massimo per utilizzo';

  @override
  String get resetsBudgetLabel => 'Budget totale';

  @override
  String get resetsOptional => 'Facoltativo';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Raggiunge circa $count spazi di lavoro · $credits in crediti · costa circa $cost';
  }

  @override
  String get resetsEstimating => 'Calcolo della copertura…';

  @override
  String get resetsEstimateNeedsFields =>
      'Compila i campi per vedere la copertura.';

  @override
  String get resetsLockedNote =>
      'Questa campagna è in corso: possono cambiare solo il messaggio, la scadenza, il budget e il promemoria.';

  @override
  String get resetsRequired => 'Obbligatorio.';

  @override
  String get resetsTooLong => 'Massimo 120 caratteri.';

  @override
  String get resetsDaysInvalid => 'Inserisci da 1 a 365 giorni.';

  @override
  String get resetsMoneyInvalid => 'Inserisci 0 o più.';

  @override
  String get resetsExpiryBeforeStart =>
      'Scegli una fine successiva all’inizio.';

  @override
  String resetsGivenTo(String name) {
    return 'Ricarica salvata assegnata a $name';
  }

  @override
  String get resetsCampaignSaved => 'Campagna salvata';

  @override
  String get resetsDefaultMessage =>
      'Una ricarica salvata, offerta da noi. Usala quando raggiungi un limite.';

  @override
  String resetsGiveName(String name) {
    return 'Ricarica salvata per $name';
  }

  @override
  String get resetsOneWorkspace => 'Uno spazio di lavoro';

  @override
  String get resetsPickWorkspace =>
      'Scegli uno spazio di lavoro per vedere le sue ricariche salvate.';

  @override
  String get resetsAllHistory => 'Tutta la cronologia';

  @override
  String get resetsAllWorkspaces => 'Tutti gli spazi di lavoro';

  @override
  String get resetsNoEvents => 'Ancora nulla qui.';

  @override
  String get resetsEventGiven => 'Ricarica salvata assegnata';

  @override
  String get resetsEventUsed => 'Ricarica salvata usata';

  @override
  String get resetsEventRevoked => 'Revocata';

  @override
  String get resetsEventUndone => 'Ricarica annullata';

  @override
  String get resetsEventExpired => 'Scaduta senza essere usata';

  @override
  String get resetsEventCreated => 'Campagna creata';

  @override
  String get resetsEventEdited => 'Campagna modificata';

  @override
  String get resetsEventStarted => 'Campagna avviata';

  @override
  String get resetsEventEnded => 'Campagna terminata';

  @override
  String get resetsEventScheduled => 'Campagna pianificata';

  @override
  String get resetsEventPaused => 'Campagna messa in pausa';

  @override
  String get resetsEventResumed => 'Campagna ripresa';

  @override
  String get resetsEventCancelled => 'Campagna annullata';

  @override
  String get resetsEventDeleted => 'Campagna eliminata';

  @override
  String get resetsEventSettings => 'Impostazioni modificate';

  @override
  String get resetsRevokeConfirm => 'Revocare questa ricarica salvata?';

  @override
  String get resetsRevokeConfirmBody =>
      'Lo spazio di lavoro la perderà prima di usarla.';

  @override
  String get resetsUndoConfirm => 'Annullare questa ricarica?';

  @override
  String get resetsUndoConfirmBody =>
      'I crediti che ha aggiunto verranno tolti di nuovo.';

  @override
  String get resetsPerPeriod => 'Utilizzi per spazio di lavoro per periodo';

  @override
  String get resetsMaxHeld => 'Massimo ricariche salvate';

  @override
  String get resetsNotifyOwners => 'Avvisa i proprietari dell’istanza';

  @override
  String get resetsNewCampaign => 'Nuova campagna';

  @override
  String get resetsName => 'Nome';

  @override
  String get resetsMessage => 'Messaggio per le persone';

  @override
  String get resetsPlans =>
      'Codici piano, separati da virgole (vuoto indica tutti)';

  @override
  String get resetsWorkspaces =>
      'ID spazi di lavoro, separati da virgole (vuoto indica tutti)';

  @override
  String get resetsBefore => 'Creato prima del (data e ora, facoltativo)';

  @override
  String get resetsLimitedDays =>
      'Ha raggiunto un limite negli ultimi N giorni (facoltativo)';

  @override
  String get resetsStart => 'Inizio (data e ora)';

  @override
  String get resetsExpiry => 'Scadenza (data e ora)';

  @override
  String get resetsPercent => 'Crediti inclusi da ricaricare (%)';

  @override
  String get resetsCap =>
      'Importo massimo in dollari per utilizzo (facoltativo)';

  @override
  String get resetsBudget =>
      'Budget totale di crediti in dollari (facoltativo)';

  @override
  String get resetsDaily => 'Azzera il limite dei modelli di oggi';

  @override
  String get resetsComputer => 'Ricarica le ore di computer di questo mese';

  @override
  String get resetsArrival => 'Avvisa all’arrivo';

  @override
  String get resetsReminder => 'Ricorda prima della scadenza';

  @override
  String get resetsPreviewSave => 'Anteprima e salva';

  @override
  String get resetsSchedule => 'Pianifica';

  @override
  String get resetsPause => 'Metti in pausa';

  @override
  String get resetsResume => 'Riprendi';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count spazi di lavoro. Ricarica massima: $credits. Costo stimato: $cost.',
      one:
          '1 spazio di lavoro. Ricarica massima: $credits. Costo stimato: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace =>
      'ID spazio di lavoro (vuoto per tutta la cronologia)';

  @override
  String get resetsHistory => 'Carica cronologia';

  @override
  String get resetsGive => 'Assegna una ricarica salvata';

  @override
  String get resetsCopyCsv => 'Copia CSV';

  @override
  String get resetsRevoke => 'Revoca';

  @override
  String get resetsUndo => 'Annulla ricarica inutilizzata';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention =>
      'I servizi dei fornitori richiedono attenzione';

  @override
  String get vendorNotSetUp => 'Non configurato';

  @override
  String get vendorCheckNow => 'Controlla ora';

  @override
  String get vendorLimit => 'Limite o importo prepagato';

  @override
  String get vendorWarnAt => 'Avvisa a';

  @override
  String get vendorExpiry => 'Scade';

  @override
  String get vendorHistory => 'Letture recenti';

  @override
  String get vendorSave => 'Salva';

  @override
  String get vendorEnabled => 'Monitoraggio attivo';

  @override
  String get vendorUnknown => 'Sconosciuto';

  @override
  String get vendorLow => 'Basso';

  @override
  String get vendorOut => 'Esaurito';

  @override
  String get vendorOk => 'OK';

  @override
  String get vendorNoReading => 'Ancora nessuna lettura';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count richiedono attenzione',
      one: '1 richiede attenzione',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count OK';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count non configurati';
  }

  @override
  String get vendorNoVendors => 'Ancora nessun servizio da monitorare.';

  @override
  String get vendorCheckAll => 'Controlla tutto';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Controllo $done di $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Verificati $count servizi',
      one: 'Verificato 1 servizio',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count verifiche non riuscite',
      one: '1 verifica non riuscita',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Richiede attenzione';

  @override
  String get vendorGroupHealthy => 'Regolare';

  @override
  String get vendorGroupIdle => 'Non configurati o disattivati';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mostra altri $count',
      one: 'Mostra 1 altro',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Mostra meno';

  @override
  String get vendorOff => 'Disattivo';

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
    return '$amount rimasti';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Avvisa sotto $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Si azzera $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Rinnovo: $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Scaduto: $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count minuti',
      one: 'tra 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count ore',
      one: 'tra 1 ora',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tra $count giorni',
      one: 'tra 1 giorno',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Verificato $when';
  }

  @override
  String get vendorSourceApi => 'Dal servizio';

  @override
  String get vendorSourceOwnCount => 'Conteggiato da Casama';

  @override
  String get vendorSourceManual => 'Inserito manualmente';

  @override
  String vendorReadingError(String error) {
    return 'Ultimo controllo non riuscito: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Aggiungi la chiave sul server per iniziare la verifica.';

  @override
  String get vendorOffHint => 'Il monitoraggio è disattivato.';

  @override
  String get vendorPickOne => 'Scegli un servizio per vederne i dettagli.';

  @override
  String get vendorSectionStatus => 'Stato';

  @override
  String get vendorSectionActions => 'Azioni';

  @override
  String get vendorSectionAlerts => 'Avvisi';

  @override
  String get vendorSectionPlan => 'Piano';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Avvisa al $percent% di utilizzo';
  }

  @override
  String get vendorWarnAtHelp => 'L’indicatore diventa ambra a questo livello.';

  @override
  String get vendorPeriod => 'Periodo';

  @override
  String get vendorPeriodNone => 'Non impostato';

  @override
  String get vendorPeriodDay => 'Giornaliero';

  @override
  String get vendorPeriodMonth => 'Mensile';

  @override
  String get vendorPeriodBilling => 'Ogni periodo di fatturazione';

  @override
  String get vendorPeriodPrepaid => 'Prepagato';

  @override
  String get vendorDateNotSet => 'Non impostato';

  @override
  String get vendorClearDate => 'Cancella data';

  @override
  String get vendorLimitInvalid => 'Inserisci un numero maggiore di 0.';

  @override
  String get vendorAmountInvalid => 'Inserisci 0 o più.';

  @override
  String get vendorMonthsInvalid => 'Inserisci da 1 a 120 mesi.';

  @override
  String get vendorWarnAtInvalid => 'Scegli un valore tra 1% e 100%.';

  @override
  String get vendorSaved => 'Impostazioni salvate';

  @override
  String get vendorCheckDone => 'Verificato';

  @override
  String get vendorHistoryEmpty => 'Ancora nessuna lettura.';

  @override
  String get vendorCheckFailed => 'Verifica non riuscita';

  @override
  String get vendorResets => 'Azzeramenti';

  @override
  String get vendorSource => 'Origine';

  @override
  String get vendorBilling => 'Fatturazione e ricarica';

  @override
  String get vendorBalanceWarning => 'Avvisa sotto il saldo';

  @override
  String get vendorPeriodStart => 'Inizio periodo';

  @override
  String get vendorInvalidSettings =>
      'Inserisci un limite positivo, un avviso tra 0 e 1 e date valide.';

  @override
  String get card24hRange => 'Escursione 24h';

  @override
  String get card52wRange => 'Escursione 52 sett.';

  @override
  String get cardAgain => 'Di nuovo';

  @override
  String get cardAgoSuffix => 'fa';

  @override
  String get cardAirQuality => 'Qualità dell’aria';

  @override
  String get cardAqiAdviceBad =>
      'Tutti dovrebbero ridurre gli sforzi prolungati o intensi all’aperto; tieni le finestre chiuse.';

  @override
  String get cardAqiAdviceGood => 'Ottima giornata per stare all’aperto.';

  @override
  String get cardAqiAdviceModerate =>
      'Buona per la maggior parte delle persone; i soggetti molto sensibili dovrebbero moderare gli sforzi.';

  @override
  String get cardAqiAdviceSensitive =>
      'Bambini, anziani e persone con asma dovrebbero limitare gli sforzi prolungati all’aperto.';

  @override
  String get cardAqiGood => 'Buona';

  @override
  String get cardAqiHazardous => 'Pericolosa';

  @override
  String get cardAqiModerate => 'Moderata';

  @override
  String get cardAqiSensitive => 'Scadente per i gruppi sensibili';

  @override
  String get cardAqiUnhealthy => 'Scadente';

  @override
  String get cardAqiVeryUnhealthy => 'Molto scadente';

  @override
  String get cardBaggage => 'Bagagli';

  @override
  String get cardCalcAmount => 'Importo';

  @override
  String get cardCalcBill => 'Conto';

  @override
  String get cardCalcDiscount => 'Sconto';

  @override
  String get cardCalcDiscountTitle => 'Sconto';

  @override
  String get cardCalcGross => 'Con imposte';

  @override
  String get cardCalcGrowth => 'Crescita';

  @override
  String get cardCalcInterest => 'Interessi';

  @override
  String get cardCalcLoan => 'Prestito';

  @override
  String get cardCalcMonthly => 'Ogni mese';

  @override
  String get cardCalcMonthlyPayment => 'Rata mensile';

  @override
  String get cardCalcNet => 'Imposte escluse';

  @override
  String get cardCalcPeople => 'Persone';

  @override
  String get cardCalcPerPerson => 'Ciascuno paga';

  @override
  String get cardCalcPrice => 'Prezzo';

  @override
  String get cardCalcPrincipal => 'Capitale';

  @override
  String get cardCalcRate => 'Tasso annuo';

  @override
  String get cardCalcSavings => 'Risparmi';

  @override
  String get cardCalcStart => 'Inizia con';

  @override
  String get cardCalcTax => 'Imposte';

  @override
  String get cardCalcTaxIncluded => 'Imposte incluse';

  @override
  String get cardCalcTaxRate => 'Aliquota fiscale';

  @override
  String get cardCalcTip => 'Mancia';

  @override
  String get cardCalcTipAmount => 'Mancia';

  @override
  String get cardCalcTipSplit => 'Mancia e divisione';

  @override
  String get cardCalcTotal => 'Totale';

  @override
  String get cardCalcTotalInterest => 'Interessi totali';

  @override
  String get cardCalcTotalPaid => 'Totale pagato';

  @override
  String get cardCalcUnits => 'Converti unità';

  @override
  String get cardCalcValue => 'Valore';

  @override
  String get cardCalcVat => 'Imposte';

  @override
  String get cardCalcYears => 'Anni';

  @override
  String get cardCalcYouPay => 'Paghi';

  @override
  String get cardCalcYouPutIn => 'Versi';

  @override
  String get cardCalcYouSave => 'Risparmi';

  @override
  String get cardCall => 'Chiama';

  @override
  String get cardCaloriesWord => 'Calorie';

  @override
  String get cardComparison => 'Confronto';

  @override
  String get cardCondClear => 'Sereno';

  @override
  String get cardCondCloudy => 'Nuvoloso';

  @override
  String get cardCondDrizzle => 'Pioviggine';

  @override
  String get cardCondFog => 'Nebbia';

  @override
  String get cardCondHail => 'Grandine';

  @override
  String get cardCondHeavyRain => 'Pioggia forte';

  @override
  String get cardCondHeavySnow => 'Neve forte';

  @override
  String get cardCondLightRain => 'Pioggia leggera';

  @override
  String get cardCondLightSnow => 'Neve leggera';

  @override
  String get cardCondMostlyClear => 'Prevalentemente sereno';

  @override
  String get cardCondPartlyCloudy => 'Parzialmente nuvoloso';

  @override
  String get cardCondRain => 'Pioggia';

  @override
  String get cardCondShowers => 'Rovesci';

  @override
  String get cardCondSleet => 'Nevischio';

  @override
  String get cardCondSnow => 'Neve';

  @override
  String get cardCondThunder => 'Temporali';

  @override
  String get cardCons => 'Contro';

  @override
  String get cardCopied => 'Copiato';

  @override
  String get cardCopy => 'Copia come testo';

  @override
  String get cardCouldntUpdate => 'Impossibile aggiornare';

  @override
  String get cardCurrency => 'Valuta';

  @override
  String get cardDayLength => 'Durata del giorno';

  @override
  String get cardDayRange => 'Escursione giornaliera';

  @override
  String get cardDays => 'giorni';

  @override
  String get cardDelay => 'Ritardo';

  @override
  String get cardDictionary => 'Dizionario';

  @override
  String get cardEmail => 'Email';

  @override
  String get cardFlightCancelled => 'Cancellato';

  @override
  String get cardFlightDiverted => 'Dirottato';

  @override
  String get cardFlightInAir => 'In volo';

  @override
  String get cardFlightIncident => 'Inconveniente';

  @override
  String get cardFlightLanded => 'Atterrato';

  @override
  String get cardFlightScheduled => 'In orario';

  @override
  String cardStaysFromNight(String price) {
    return 'da $price a notte';
  }

  @override
  String get cardStaysANight => 'a notte';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n notti',
      one: '1 notte',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ospiti',
      one: '1 ospite',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n camere',
      one: '1 camera',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Migliori';

  @override
  String get cardStaysSortCheapest => 'Più economici';

  @override
  String get cardStaysSortTopRated => 'Più votati';

  @override
  String get cardStaysSortClosest => 'Più vicini';

  @override
  String get cardStaysFilterFreeCancel => 'Cancellazione gratuita';

  @override
  String get cardStaysFilterBreakfast => 'Colazione';

  @override
  String get cardStaysFilterPayAtHotel => 'Paga in hotel';

  @override
  String get cardStaysFilterStars => '4 stelle e oltre';

  @override
  String get cardStaysFilterRated => 'Voto 8+';

  @override
  String get cardStaysList => 'Elenco';

  @override
  String get cardStaysMap => 'Mappa';

  @override
  String get cardStaysEdit => 'Modifica';

  @override
  String cardStaysRating(String value, String max) {
    return '$value su $max';
  }

  @override
  String cardStaysKm(String km) {
    return 'a $km km dal centro';
  }

  @override
  String cardStaysStars(int n) {
    return '$n stelle';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price per $n notti',
      one: '$price per 1 notte',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n altri siti',
      one: '+1 altro sito',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Vedi offerta';

  @override
  String get cardStaysView => 'Vedi';

  @override
  String cardStaysShowAll(int n) {
    return 'Mostra tutti ($n)';
  }

  @override
  String get cardStaysShowFewer => 'Mostra meno';

  @override
  String get cardStaysNone => 'Nessun risultato per questi filtri.';

  @override
  String get cardStaysNoMap =>
      'Nessuno di questi luoghi ha una posizione sulla mappa.';

  @override
  String get cardStaysNoDeals => 'Nessun prezzo per queste date.';

  @override
  String get cardStaysCheck =>
      'Il prezzo viene verificato sul sito di prenotazione.';

  @override
  String cardStaysCompare(int n) {
    return 'Confronta ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Seleziona fino a 4 da confrontare';

  @override
  String get cardStaysComparePick => 'Scegli per confrontare';

  @override
  String get cardStaysCompareTitle => 'Confronta';

  @override
  String get cardStaysRowNight => 'Prezzo a notte';

  @override
  String get cardStaysRowTotal => 'Totale';

  @override
  String get cardStaysRowRating => 'Valutazione';

  @override
  String get cardStaysRowStars => 'Stelle';

  @override
  String get cardStaysRowDistance => 'Distanza';

  @override
  String get cardStaysYes => 'Sì';

  @override
  String get cardStaysNo => 'No';

  @override
  String get cardStaysTermFreeCancel => 'Cancellazione gratuita';

  @override
  String get cardStaysTermBreakfast => 'Colazione inclusa';

  @override
  String get cardStaysTermNoBreakfast => 'Senza colazione';

  @override
  String get cardStaysTermPayAtHotel => 'Paga in hotel';

  @override
  String get cardStaysTermNonRefundable => 'Non rimborsabile';

  @override
  String get cardStaysDetailsTitle => 'Alloggio';

  @override
  String get cardStaysCheapest => 'Più economico';

  @override
  String get cardStaysAmenities => 'Servizi';

  @override
  String cardStaysCheckIn(String time) {
    return 'Check-in $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Check-out $time';
  }

  @override
  String get cardStaysNearby => 'Nei dintorni';

  @override
  String get cardStaysHotelSite => 'Sito web dell’hotel';

  @override
  String get cardStaysBook => 'Prenota per me';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Prenota $name su $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Foto $n di $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · prezzi per mese';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Mese più economico: $month, circa $price a notte';
  }

  @override
  String get cardStaysTrendNote => 'Una previsione, non prezzi in tempo reale.';

  @override
  String get cardStaysTrendPick => 'Scegli date';

  @override
  String get cardStaysSearchTitle => 'Trova un alloggio';

  @override
  String get cardStaysSearchWhere => 'Dove';

  @override
  String get cardStaysSearchWhereHint => 'Città, zona o hotel';

  @override
  String get cardStaysSearchDates => 'Scegli date';

  @override
  String get cardStaysSearchAdults => 'Adulti';

  @override
  String get cardStaysSearchRooms => 'Camere';

  @override
  String get cardStaysSearchBudget => 'Budget a notte (facoltativo)';

  @override
  String get cardStaysSearchNotNow => 'Non ora';

  @override
  String get cardStaysSearchGo => 'Cerca alloggi';

  @override
  String get cardStaysSearchSent => 'Ricerca in corso';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Alloggi a $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Meno: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Altro: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Piscina';

  @override
  String get cardStaysAmenityParking => 'Parcheggio';

  @override
  String get cardStaysAmenityPets => 'Animali ammessi';

  @override
  String get cardStaysAmenityGym => 'Palestra';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Cucina';

  @override
  String get cardStaysAmenityWifi => 'Wi-Fi';

  @override
  String get cardStaysAmenityAirCon => 'Aria condizionata';

  @override
  String get cardProductsTitle => 'Prodotti da acquistare';

  @override
  String cardProductsFrom(String price) {
    return 'da $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'sotto $price';
  }

  @override
  String get cardProductsSortBest => 'Migliori';

  @override
  String get cardProductsSortCheapest => 'Più economici';

  @override
  String get cardProductsSortTopRated => 'Più votati';

  @override
  String get cardProductsOnSale => 'In offerta';

  @override
  String get cardProductsRated => 'Voto 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'e altri negozi';

  @override
  String cardProductsShowAll(int n) {
    return 'Mostra tutti ($n)';
  }

  @override
  String get cardProductsShowFewer => 'Mostra meno';

  @override
  String get cardProductsShowMore => 'Mostra altro';

  @override
  String get cardProductsNone => 'Nessun risultato per questi filtri.';

  @override
  String get cardProductsCheck => 'Il prezzo viene verificato nel negozio.';

  @override
  String get cardProductsBuy => 'Acquista';

  @override
  String get cardProductsCompareStores => 'Confronta negozi';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Confronta negozi per $title';
  }

  @override
  String get cardProductsBuyForMe => 'Acquista per me';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Acquista $title su $store';
  }

  @override
  String get cardProductsRowPrice => 'Prezzo';

  @override
  String get cardProductsRowStore => 'Negozio';

  @override
  String get cardProductsRowRating => 'Valutazione';

  @override
  String get cardProductsRowDelivery => 'Consegna';

  @override
  String cardProductsDelivery(String text) {
    return 'Consegna: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'di $brand';
  }

  @override
  String get cardProductsOffers => 'Negozi';

  @override
  String get cardProductsLowest => 'Totale più basso';

  @override
  String cardProductsTotal(String price) {
    return 'Totale $price';
  }

  @override
  String get cardProductsOutOfStock => 'Esaurito';

  @override
  String get cardProductsFeatures => 'Dettagli';

  @override
  String get cardProductsReviews => 'Cosa dicono gli acquirenti';

  @override
  String get cardCheckoutTitle => 'Controlla prima che io paghi';

  @override
  String get cardCheckoutTotal => 'Totale';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Apri la pagina';

  @override
  String get cardCheckoutCancel => 'Annulla';

  @override
  String get cardCheckoutChange => 'Modifica';

  @override
  String get cardCheckoutConfirm => 'Conferma e paga';

  @override
  String get cardCheckoutCancelLabel => 'Annulla questo';

  @override
  String get cardCheckoutChangeLabel => 'Modifica qualcosa';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Conferma $total da $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Conferma $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Confermato';

  @override
  String get cardCheckoutChanging => 'Modifica in corso';

  @override
  String get cardCheckoutCancelled => 'Annullato';

  @override
  String get cardBookingTitle => 'La tua prenotazione';

  @override
  String cardBookingWith(String site) {
    return 'Prenotato su $site';
  }

  @override
  String get cardBookingCheckIn => 'Check-in';

  @override
  String get cardBookingCheckOut => 'Check-out';

  @override
  String get cardBookingConfirmation => 'Numero di conferma';

  @override
  String get cardBookingCopy => 'Copia il numero di conferma';

  @override
  String get cardBookingPaid => 'Pagato';

  @override
  String get cardBookingPayAtHotel => 'Paga in hotel';

  @override
  String cardBookingCancelBy(String date) {
    return 'Cancellazione gratuita entro: $date';
  }

  @override
  String get cardBookingDirections => 'Indicazioni';

  @override
  String get cardBookingManage => 'Gestisci prenotazione';

  @override
  String get cardBookingCalendar => 'Aggiungi al calendario';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Aggiungi $name al mio calendario';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Ordine $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Effettuato: $date';
  }

  @override
  String get cardOrderStepOrdered => 'Ordinato';

  @override
  String get cardOrderStepShipped => 'Spedito';

  @override
  String get cardOrderStepOut => 'In consegna';

  @override
  String get cardOrderStepDelivered => 'Consegnato';

  @override
  String get cardOrderCancelled => 'Annullato';

  @override
  String get cardOrderReturned => 'Restituito';

  @override
  String cardOrderArrives(String date) {
    return 'Arriva il $date';
  }

  @override
  String get cardOrderTracking => 'Codice di tracciamento';

  @override
  String get cardOrderCopy => 'Copia il codice di tracciamento';

  @override
  String get cardOrderTrack => 'Traccia';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Traccia $number';
  }

  @override
  String get cardOrderPage => 'Pagina ordine';

  @override
  String get cardFaresBest => 'Migliori';

  @override
  String get cardFaresCheapest => 'Più economici';

  @override
  String get cardFaresFastest => 'Più veloci';

  @override
  String get cardFaresDirectOnly => 'Solo diretti';

  @override
  String get cardFaresDirect => 'Diretto';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n scali',
      one: '1 scalo',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Prenota';

  @override
  String cardFaresFromPrice(String price) {
    return 'da $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n viaggiatori',
      one: '1 viaggiatore',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n notti',
      one: '1 notte',
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
  String get cardFaresFirst => 'Prima';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Di solito $low–$high per questo viaggio';
  }

  @override
  String get cardFaresLevelLow => 'Basso ora';

  @override
  String get cardFaresLevelTypical => 'Nella media ora';

  @override
  String get cardFaresLevelHigh => 'Alto ora';

  @override
  String cardFaresShowAll(int n) {
    return 'Mostra tutti ($n)';
  }

  @override
  String get cardFaresShowFewer => 'Mostra meno';

  @override
  String get cardFaresNoDirect => 'Nessun volo diretto in questa ricerca.';

  @override
  String get cardFaresOutboundOnly =>
      'I prezzi sono per l’intero viaggio; scegli il volo di ritorno su Google Voli.';

  @override
  String get cardFaresSeeAll => 'Vedi tutto su Google Voli';

  @override
  String get cardFaresCheck =>
      'I prezzi si riferiscono a tutti i viaggiatori e vengono ricontrollati sul sito di prenotazione.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin bagaglio a mano, $checked bagagli da stiva';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama può guadagnare una commissione quando prenoti tramite questi link. Il prezzo non cambia.';

  @override
  String cardFaresCompare(String site) {
    return 'Confronta su $site';
  }

  @override
  String get cardFaresWatch => 'Monitora prezzo';

  @override
  String cardFaresWatching(String date) {
    return 'Monitorato · scadenza: $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Monitorato: $price o meno · scadenza: $date';
  }

  @override
  String get cardFaresWatchStop => 'Ferma';

  @override
  String get cardFaresWatchTitle => 'Monitora questo prezzo';

  @override
  String get cardFaresWatchBody =>
      'Casama controlla questo prezzo alcune volte al giorno e ti invia una notifica quando scende. Si ferma da solo quando la data passa, o dopo 60 giorni.';

  @override
  String get cardFaresWatchTarget =>
      'Avvisami quando scende sotto (facoltativo)';

  @override
  String get cardFaresWatchAnyDrop =>
      'Lascia vuoto per qualsiasi calo importante';

  @override
  String get cardFaresWatchStart => 'Monitora';

  @override
  String get cardFaresWatchStarted =>
      'Prezzo monitorato. Riceverai una notifica quando scende.';

  @override
  String get cardFaresWatchStopped => 'Monitoraggio del prezzo interrotto.';

  @override
  String get cardFaresWatchFull =>
      'Stai già monitorando 10 prezzi. Fermane prima uno in Impostazioni → Schede.';

  @override
  String get cardFaresWatchFailed =>
      'Impossibile modificare il monitoraggio del prezzo. Riprova.';

  @override
  String get cardFaresFlagSeparate => 'Ticket separati';

  @override
  String get cardFaresFlagOvernight => 'Scalo notturno';

  @override
  String get cardFaresFlagAirport => 'Cambio aeroporto';

  @override
  String get cardFaresFlagShort => 'Scalo breve';

  @override
  String get cardFaresFlagLong => 'Scalo lungo';

  @override
  String get cardFaresNoteSeparate =>
      'Compagnie aeree diverse su una tratta, quindi potrebbero essere ticket separati. Se perdi la coincidenza, il volo successivo potrebbe non essere coperto. Controlla sul sito di prenotazione.';

  @override
  String get cardFaresNoteOvernight => 'Uno scalo dura tutta la notte.';

  @override
  String get cardFaresNoteAirport =>
      'Un volo in coincidenza parte da un aeroporto diverso.';

  @override
  String get cardFaresNoteShort => 'Uno scalo dura meno di un’ora.';

  @override
  String get cardFaresNoteLong => 'Uno scalo supera le 8 ore.';

  @override
  String get cardFaresOutbound => 'Andata';

  @override
  String get cardFaresReturn => 'Ritorno';

  @override
  String cardFaresEmissions(int kg) {
    return 'Circa $kg kg di CO₂ per viaggiatore';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return 'scalo di $time a $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'il volo successivo parte da $place';
  }

  @override
  String get cardFaresViewFailed => 'Impossibile caricare queste tariffe.';

  @override
  String get cardFaresTryAgain => 'Riprova';

  @override
  String get cardFaresMorning => 'Mattina';

  @override
  String get cardFaresAfternoon => 'Pomeriggio';

  @override
  String get cardFaresEvening => 'Sera';

  @override
  String get cardFaresNight => 'Notte';

  @override
  String get cardFaresTime => 'Orario';

  @override
  String get cardFaresAirlines => 'Compagnie aeree';

  @override
  String get cardFaresBagIncluded => 'Bagaglio incluso';

  @override
  String get cardFaresNoMatch => 'Nessun volo corrisponde a questi filtri.';

  @override
  String get cardFaresOpenInChat => 'Apri in chat';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Mostra voli $route · $date';
  }

  @override
  String get cardFaresEdit => 'Modifica ricerca';

  @override
  String get cardFaresDetails => 'Dettagli';

  @override
  String get cardFaresSinceStart => 'dall’inizio del monitoraggio';

  @override
  String get cardFareCalOneWay => 'Solo andata';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ritorno dopo $n notti',
      one: 'Ritorno dopo 1 notte',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Basso';

  @override
  String get cardFareCalUsual => 'Nella media';

  @override
  String get cardFareCalHigh => 'Alto';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Più economico: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Vedi tariffe';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: nessun prezzo';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'Da $from · ovunque';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'Da $from · estero';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'Da $from · stesso paese';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'sotto $price';
  }

  @override
  String get cardFlightSearchTitle => 'Cerca voli';

  @override
  String get cardFlightSearchReturn => 'Andata e ritorno';

  @override
  String get cardFlightSearchOneWay => 'Solo andata';

  @override
  String get cardFlightSearchFrom => 'Da';

  @override
  String get cardFlightSearchTo => 'A';

  @override
  String get cardFlightSearchPlaceHint => 'Città o aeroporto';

  @override
  String get cardFlightSearchAnywhere => 'Ovunque';

  @override
  String get cardFlightSearchSwap => 'Scambia luoghi';

  @override
  String get cardFlightSearchPickDates => 'Scegli date';

  @override
  String get cardFlightSearchPickDate => 'Scegli una data';

  @override
  String get cardFlightSearchWholeMonth => 'Tutto il mese';

  @override
  String get cardFlightSearchNights => 'Notti fuori';

  @override
  String get cardFlightSearchAdults => 'Adulti';

  @override
  String get cardFlightSearchChildren => 'Bambini (2–11)';

  @override
  String get cardFlightSearchInfants => 'Neonati (sotto i 2 anni)';

  @override
  String get cardFlightSearchNotNow => 'Non ora';

  @override
  String get cardFlightSearchSent => 'Ricerca…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Voli $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Più economico ora';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ultimi $n giorni',
      one: 'Ultimo giorno',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'da $low a $high';
  }

  @override
  String get cardFareTrendNote =>
      'Questi sono i prezzi registrati finora, non una previsione. Possono cambiare in qualsiasi momento.';

  @override
  String get cardFareWatchesTitle => 'Monitoraggi prezzi';

  @override
  String get cardFareWatchesNone =>
      'Non stai monitorando alcuna tariffa. Tocca Monitora prezzo su una scheda tariffe per iniziare.';

  @override
  String get cardFareWatchesNoPrice => 'Ancora nessun prezzo';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Obiettivo $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Qualsiasi calo importante';

  @override
  String cardFareWatchesLow(String price) {
    return 'minimo $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'scadenza: $date';
  }

  @override
  String get cardsFareWatches => 'Monitoraggi prezzi';

  @override
  String get cardsFareWatchesNone =>
      'Nessun monitoraggio prezzi. Tocca Monitora prezzo su una scheda voli per ricevere una notifica quando scende.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Ora $price · scadenza: $date';
  }

  @override
  String get cardFromBot => 'Scritto dal bot; potrebbe contenere errori';

  @override
  String get cardFullRecipe => 'Ricetta completa';

  @override
  String get cardGate => 'Gate';

  @override
  String get cardGo => 'Vai';

  @override
  String get cardHeads => 'Testa';

  @override
  String get cardHolidays => 'Festività';

  @override
  String get cardHoursShort => 'ore';

  @override
  String get cardHumidity => 'Umidità';

  @override
  String get cardItsTime => 'È ora!';

  @override
  String get cardJustNow => 'proprio ora';

  @override
  String get cardLast24h => 'Ultime 24 ore';

  @override
  String get cardLast30Days => 'Ultimi 30 giorni';

  @override
  String get cardListen => 'Ascolta';

  @override
  String get cardLiveNow => 'Proprio ora';

  @override
  String get cardLongWeekend => 'Weekend lungo';

  @override
  String get cardLostShort => 'P';

  @override
  String get cardMarket24h => '24/7';

  @override
  String get cardMarketCap => 'Capitalizzazione';

  @override
  String get cardMarketClosed => 'Chiuso';

  @override
  String get cardMarketOpen => 'Aperto';

  @override
  String get cardMarketPost => 'After-hours';

  @override
  String get cardMarketPre => 'Pre-mercato';

  @override
  String get cardMessage => 'Messaggio';

  @override
  String get cardMinutesShort => 'min';

  @override
  String get cardMoonFirstQuarter => 'Primo quarto';

  @override
  String get cardMoonFull => 'Luna piena';

  @override
  String get cardMoonLastQuarter => 'Ultimo quarto';

  @override
  String get cardMoonNew => 'Luna nuova';

  @override
  String get cardMoonWaningCrescent => 'Luna calante';

  @override
  String get cardMoonWaningGibbous => 'Gibbosa calante';

  @override
  String get cardMoonWaxingCrescent => 'Luna crescente';

  @override
  String get cardMoonWaxingGibbous => 'Gibbosa crescente';

  @override
  String get cardMore => 'Altro';

  @override
  String get cardNext24h => 'Prossime 24 ore';

  @override
  String get cardNoAlerts => 'Nessun avviso';

  @override
  String get cardNoAlertsLong => 'Nessuna allerta meteo attiva qui al momento.';

  @override
  String get cardNoChart => 'Nessun grafico per questo intervallo';

  @override
  String get cardNoGames => 'Nessuna partita';

  @override
  String get cardNoHolidays => 'Nessun’altra festività quest’anno.';

  @override
  String get cardNoQuakes => 'Nessun terremoto di questa magnitudo di recente.';

  @override
  String get cardNoStorms => 'Nessuna attiva';

  @override
  String get cardNoStormsLong =>
      'Nessuna tempesta tropicale attiva in questo momento.';

  @override
  String get cardNotAdvice => 'Non è consulenza finanziaria';

  @override
  String get cardNow => 'Ora';

  @override
  String get cardNutritionFacts => 'Valori nutrizionali';

  @override
  String get cardOpen => 'Apri';

  @override
  String get cardOpenSource => 'Apri la fonte';

  @override
  String get cardParcel => 'Pacco';

  @override
  String get cardParcelDelivered => 'Consegnato';

  @override
  String get cardParcelInTransit => 'In transito';

  @override
  String get cardParcelOrdered => 'Etichetta creata';

  @override
  String get cardParcelOut => 'In consegna';

  @override
  String get cardParcelProblem => 'Problema';

  @override
  String get cardParcelNoLive =>
      'Nessuno stato in tempo reale per questo numero qui. La pagina del corriere ha gli ultimi aggiornamenti.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Traccia su $site';
  }

  @override
  String get cardPin => 'Fissa ai widget';

  @override
  String get cardPinFailed => 'Impossibile fissare questa scheda';

  @override
  String get cardPinned => 'Fissata ai tuoi widget';

  @override
  String get cardPinnedWaiting =>
      'Fissata. Consenti questo bot sui tuoi widget per vederla lì';

  @override
  String get cardPlayedShort => 'G';

  @override
  String get cardPointsShort => 'Pt';

  @override
  String get cardPrevClose => 'Chiusura prec.';

  @override
  String get cardPros => 'Pro';

  @override
  String get cardProsCons => 'Pro e contro';

  @override
  String get cardQuiz => 'Quiz';

  @override
  String get cardRain => 'Pioggia';

  @override
  String get cardRainChance => 'Probabilità di pioggia';

  @override
  String get cardRandom => 'Casuale';

  @override
  String get cardReadMore => 'Leggi di più';

  @override
  String get cardReferenceRates =>
      'Tassi di riferimento della banca centrale, pubblicati ogni giorno';

  @override
  String get cardRefresh => 'Aggiorna';

  @override
  String get cardReport => 'Segnala dati errati';

  @override
  String get cardReported => 'Grazie, ci daremo un’occhiata';

  @override
  String get cardSameTime => 'stessa ora';

  @override
  String get cardScores => 'Risultati';

  @override
  String get cardSecondsShort => 'sec';

  @override
  String get cardServings => 'Porzioni';

  @override
  String get cardShareImage => 'Condividi come immagine';

  @override
  String get cardStandings => 'Classifica';

  @override
  String get cardStorms => 'Tempeste tropicali';

  @override
  String get cardSunMoon => 'Sole e luna';

  @override
  String get cardSunrise => 'Alba';

  @override
  String get cardSunset => 'Tramonto';

  @override
  String get cardSwap => 'Scambia';

  @override
  String get cardSynonyms => 'Simili:';

  @override
  String get cardTails => 'Croce';

  @override
  String get cardTeam => 'Squadra';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Ora in ogni luogo';

  @override
  String get cardTimeline => 'Sequenza temporale';

  @override
  String get cardToday => 'Oggi';

  @override
  String get cardTomorrow => 'Domani';

  @override
  String get cardTranslation => 'Traduzione';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Rimuovi dai widget';

  @override
  String get cardUnpinned => 'Rimossa dai tuoi widget';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'estremo';

  @override
  String get cardUvHigh => 'alto';

  @override
  String get cardUvLow => 'basso';

  @override
  String get cardUvModerate => 'moderato';

  @override
  String get cardUvVeryHigh => 'molto alto';

  @override
  String get cardVolume => 'Volume';

  @override
  String get cardWatchlist => 'Titoli seguiti';

  @override
  String get cardWeather => 'Meteo';

  @override
  String get cardWeatherAlerts => 'Allerte meteo';

  @override
  String get cardWebsite => 'Sito web';

  @override
  String get cardWind => 'Vento';

  @override
  String get cardWonShort => 'V';

  @override
  String get cardWorldClock => 'Fusi orari';

  @override
  String get cardYesterday => 'Ieri';

  @override
  String get cardQuakesWorld => 'Terremoti più forti di oggi';

  @override
  String cardMinutesAgo(int n) {
    return '$n min fa';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n h fa';
  }

  @override
  String cardStale(String ago) {
    return 'Impossibile aggiornare · da $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Aggiornato $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'In ritardo di $minutes min';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'Max $high  Min $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Percepita $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n giorni';
  }

  @override
  String cardUntil(String when) {
    return 'Fino a $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n allerte attive',
      one: '1 allerta attiva',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Soprattutto $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Polline di ontano',
      'birch': 'Polline di betulla',
      'grass': 'Polline di graminacee',
      'mugwort': 'Polline di artemisia',
      'olive': 'Polline di ulivo',
      'ragweed': 'Polline di ambrosia',
      'other': 'Polline',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '${h}h ${m}m';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Ora d’oro dalle $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct% illuminata';
  }

  @override
  String cardMoonrise(String time) {
    return 'Sorge alle $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Tramonta alle $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Variazione su $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up in rialzo · $down in ribasso';
  }

  @override
  String cardRatesOf(String date) {
    return 'Tassi: $date';
  }

  @override
  String cardAtTime(String when) {
    return 'Alle $when';
  }

  @override
  String cardInDays(int n) {
    return 'tra $n giorni';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct% completato';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Terremoti vicino a $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n terremoti',
      one: '1 terremoto',
      zero: 'Nessuno',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return 'profondità $depth';
  }

  @override
  String cardAway(String distance) {
    return 'a $distance di distanza';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n attive',
      one: '1 attiva',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return 'Allerta $level';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n partite',
      one: '1 partita',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n in diretta';
  }

  @override
  String cardMinutes(int n) {
    return '$n min';
  }

  @override
  String cardExpected(String date) {
    return 'Previsto il $date';
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
      other: '$n passi',
      one: '1 passo',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Vittorie $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Porzione: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed verifiche su $total superate';
  }

  @override
  String cardTotal(int n) {
    return 'Totale $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Dopo $n anni';
  }

  @override
  String get cardsSettingsTitle => 'Schede';

  @override
  String get cardsSettingsRow => 'Città principale, unità e fonti dati';

  @override
  String get cardsSettingsIntro =>
      'I bot rispondono su meteo, prezzi, tassi, ora e altro con schede di dati reali sempre aggiornati. La tua città principale viene usata quando chiedi senza indicare un luogo.';

  @override
  String get cardsSettingsSaveFailed => 'Impossibile salvare. Riprova.';

  @override
  String get cardsHomeCity => 'La tua città';

  @override
  String get cardsHomeClear => 'Cancella';

  @override
  String get cardsHomeNone =>
      'Non impostata. I bot usano la città principale del tuo fuso orario finché non ne scegli una.';

  @override
  String get cardsHomeSearch => 'Cerca la tua città';

  @override
  String get cardsHomePrivacy =>
      'Viene conservata solo la città, mai il tuo indirizzo; viene inviata ai servizi meteo come coordinate arrotondate.';

  @override
  String get cardsUnits => 'Unità';

  @override
  String get cardsTemperature => 'Temperatura';

  @override
  String get cardsWind => 'Vento';

  @override
  String get cardsRain => 'Pioggia';

  @override
  String get cardsDistance => 'Distanza';

  @override
  String get cardsPrices => 'Prezzi';

  @override
  String get cardsRedUp => 'Rosso significa rialzo';

  @override
  String get cardsRedUpHint =>
      'Mostra i prezzi in rialzo in rosso e quelli in calo in verde, come nei mercati di Cina, Giappone e Corea.';

  @override
  String get cardsSources => 'Fonti dati';

  @override
  String get cardsSourcesIntro =>
      'Le schede indicano la provenienza dei dati e il momento dell’aggiornamento. Li forniscono questi servizi:';

  @override
  String get cardFewerServings => 'Meno porzioni';

  @override
  String get cardMoreServings => 'Più porzioni';

  @override
  String get cropTitle => 'Sposta e ridimensiona';

  @override
  String get cropDone => 'Fatto';

  @override
  String get cropPosition => 'Posizione immagine';

  @override
  String get cropMoveUp => 'Sposta su';

  @override
  String get cropMoveDown => 'Sposta giù';

  @override
  String get cropMoveLeft => 'Sposta a sinistra';

  @override
  String get cropMoveRight => 'Sposta a destra';

  @override
  String get cropRotate => 'Ruota';

  @override
  String get cropMirror => 'Capovolgi';

  @override
  String get cropReset => 'Ripristina';

  @override
  String get cropZoom => 'Zoom';

  @override
  String get cropZoomIn => 'Ingrandisci';

  @override
  String get cropZoomOut => 'Riduci';

  @override
  String get cropSoft =>
      'Zoom molto ravvicinato: l’immagine potrebbe apparire poco nitida';

  @override
  String get cropAnimatedStill => 'Le immagini animate restano ferme';

  @override
  String get cropBackground => 'Sfondo';

  @override
  String get cropBackgroundNone => 'Nessuno';

  @override
  String cropBackgroundBot(String name) {
    return 'Colore di $name';
  }

  @override
  String get cropBackgroundWhite => 'Bianco';

  @override
  String get cropBackgroundBlack => 'Nero';

  @override
  String get cropUnreadable =>
      'Impossibile aprire questa immagine qui. Prova con un JPEG o PNG.';

  @override
  String cropTooBig(String size) {
    return 'Questo file pesa $size, oltre il limite di 40 MB.';
  }

  @override
  String get botPicture => 'Immagine';

  @override
  String botPictureTitle(String name) {
    return 'Immagine di $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Cambia l’immagine di $name';
  }

  @override
  String get botPicturePaste => 'Incolla immagine';

  @override
  String get botPictureDraw => 'Creane una con l’IA';

  @override
  String get botPictureDrawHelp => 'Casama ne disegna due tra cui scegliere';

  @override
  String get botPictureRecrop => 'Ritaglia di nuovo';

  @override
  String get botPictureMascot => 'Usa invece una mascotte';

  @override
  String get botPictureRemove => 'Rimuovi immagine';

  @override
  String get botPictureRecent => 'Recenti';

  @override
  String get botPictureUpdated => 'Immagine aggiornata';

  @override
  String get botPictureRemoved => 'Immagine rimossa';

  @override
  String get botPictureFailed => 'Impossibile salvare l’immagine';

  @override
  String botPictureDrop(String name) {
    return 'Trascina qui per usarla come immagine di $name';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Usa come immagine di $name';
  }

  @override
  String get botPictureUseAsBot => 'Usa come immagine di un bot';

  @override
  String get botPictureWhichBot => 'Quale bot riceve questa immagine?';

  @override
  String botDrawTitle(String name) {
    return 'Un’immagine per $name';
  }

  @override
  String get botDrawIntro =>
      'Scegli uno stile, aggiungi qualche parola se vuoi e Casama disegnerà due immagini tra cui scegliere.';

  @override
  String get botDrawDescribe => 'Descrivila (facoltativo)';

  @override
  String get botDrawHint => 'Un gufo simpatico con gli occhiali da lettura';

  @override
  String get botDrawMake => 'Creane 2';

  @override
  String get botDrawMore => 'Creane altre 2';

  @override
  String get botDrawPick => 'Toccane una per usarla';

  @override
  String get botDrawCost =>
      'Ogni immagine usa crediti immagini, come qualsiasi immagine creata da Casama.';

  @override
  String get botDrawWorking => 'Disegno…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '3D morbido';

  @override
  String get botDrawStyleWatercolor => 'Acquerello';

  @override
  String get botDrawStyleFlat => 'Icona flat';

  @override
  String get botDrawStylePixel => 'Pixel Art';

  @override
  String get botDrawStyleLine => 'Line art';

  @override
  String get botDrawStylePhoto => 'Foto';

  @override
  String get sharePictureStays =>
      'La sua immagine resta in questo spazio di lavoro: la copia riceve la mascotte precedente o le sue iniziali.';

  @override
  String savedResetRefills(String amount) {
    return 'Ricarica $amount di crediti';
  }

  @override
  String get savedResetClearsDaily => 'Azzera il limite di oggi';

  @override
  String get savedResetGivesHours => 'Restituisce le ore di computer';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni rimasti',
      one: '1 giorno rimasto',
      zero: 'Scade oggi',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Modelli';

  @override
  String get modelsRowHelp => 'Modelli di Casama o le tue chiavi';

  @override
  String get modelsIntro =>
      'Scegli se Casama esegue i tuoi bot oppure collega le tue chiavi dei modelli. Le chiavi vengono salvate cifrate e non vengono più mostrate.';

  @override
  String get whoRunsYourBots => 'Chi esegue i tuoi bot';

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
      'Incluso nel tuo piano; usa i crediti dello spazio di lavoro';

  @override
  String get whoRunsCasamaOffHelp => 'In pausa con il piano attuale';

  @override
  String get whoRunsOwn => 'Il tuo fornitore';

  @override
  String get whoRunsOwnHelp =>
      'Fatturato direttamente dal tuo fornitore; non usa crediti Casama';

  @override
  String get whoRunsCasamaShort => 'Modelli di Casama, inclusi nel tuo piano';

  @override
  String get whoRunsCasamaCost => 'Usa crediti';

  @override
  String get whoRunsOwnShort => 'Le tue chiavi, fatturate dal tuo fornitore';

  @override
  String get whoRunsOwnCost => 'Nessun credito Casama';

  @override
  String get whoRunsOwnNeedsKey =>
      'Per usare il tuo fornitore, aggiungi prima una chiave di chat qui sotto in Aggiungi una chiave.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Scegli un modello per questa chiave qui sotto per cambiare.';

  @override
  String get whoRunsAdminOnly =>
      'Solo gli amministratori dello spazio di lavoro possono cambiare chi esegue i bot.';

  @override
  String get botModelSource => 'Origine modello';

  @override
  String get botModelSourceWorkspace => 'Predefinito dello spazio di lavoro';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Una delle tue chiavi';

  @override
  String get useCasamaFallback =>
      'Se il mio fornitore non risponde, usa i modelli di Casama';

  @override
  String get useCasamaFallbackHelp =>
      'Quando la tua chiave raggiunge un limite di frequenza o di quota, passa ai modelli di Casama usando i crediti dello spazio di lavoro.';

  @override
  String get keyCoversOpenRouter =>
      'Chat, immagini, video, lettura ad alta voce, messaggi vocali e dettatura';

  @override
  String get keyCoversGoogle => 'Chat e chiamate dal vivo';

  @override
  String get keyCoversOpenAi => 'Chat e ricerca nella memoria';

  @override
  String get keyCoversChat => 'Chat';

  @override
  String get ownProviderPrivacyNote =>
      'Con il tuo fornitore, a ciò che inviano i tuoi bot si applicano i termini di quel fornitore. L’impostazione di Casama per non addestrare i modelli si applica solo alle chiavi di Casama.';

  @override
  String get creditsOwnProviderNote =>
      'I modelli del tuo fornitore non usano crediti.';

  @override
  String get routineWaitingForModel => 'In attesa di un modello';

  @override
  String get ownProviderRequiredTitle =>
      'Collega un modello per continuare a chattare';

  @override
  String get ownProviderRequiredBody =>
      'I modelli di Casama non sono disponibili su questo piano al momento. Aggiungi la tua chiave di un modello oppure passa a un piano superiore.';

  @override
  String get modelNoToolsWarning =>
      'Questo modello non supporta gli strumenti, quindi il bot può rispondere solo con testo.';

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
  String get appBrowserTitle => 'Browser su questo telefono';

  @override
  String get appBrowserTitleMac => 'Browser su questo Mac';

  @override
  String get appBrowserTitleLinux => 'Browser su questo computer';

  @override
  String get appBrowserTitleWindows => 'Browser su questo PC';

  @override
  String get appBrowserHelp =>
      'Un piccolo browser dentro Casama che i bot autorizzati possono usare mentre guardi, solo mentre hai la loro chat aperta su questo telefono. I tuoi accessi restano su questo telefono.';

  @override
  String get appBrowserHelpMac =>
      'Un piccolo browser dentro Casama che i bot autorizzati possono usare mentre guardi, mentre Casama è aperto su questo Mac. I tuoi accessi restano su questo Mac.';

  @override
  String get appBrowserHelpLinux =>
      'Un piccolo browser dentro Casama che i bot autorizzati possono usare mentre guardi, mentre Casama è aperto su questo computer. I tuoi accessi restano su questo computer.';

  @override
  String get appBrowserHelpWindows =>
      'Un piccolo browser dentro Casama che i bot autorizzati possono usare mentre guardi, mentre Casama è aperto su questo PC. I tuoi accessi restano su questo PC.';

  @override
  String get appBrowserSwitchHelp =>
      'I bot che autorizzi possono aprire pagine qui mentre la loro chat è aperta su questo telefono.';

  @override
  String get appBrowserSwitchHelpMac =>
      'I bot che autorizzi possono aprire pagine qui mentre Casama è aperto su questo Mac.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'I bot che autorizzi possono aprire pagine qui mentre Casama è aperto su questo computer.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'I bot che autorizzi possono aprire pagine qui mentre Casama è aperto su questo PC.';

  @override
  String get appBrowserOn => 'Attivo';

  @override
  String get appBrowserOff => 'Disattivo';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Disattivato: $reason';
  }

  @override
  String get appBrowserReasonOff => 'non ancora disponibile.';

  @override
  String get appBrowserReasonNotTester => 'al momento solo per i tester.';

  @override
  String get appBrowserReasonSystemOff =>
      'non ancora disponibile su questo dispositivo.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'un amministratore lo ha disattivato per questo spazio di lavoro.';

  @override
  String get appBrowserReasonUnavailable =>
      'questo server non dispone delle connessioni del dispositivo.';

  @override
  String get appBrowserReasonUnsupported =>
      'il browser di questo dispositivo non può eseguirlo.';

  @override
  String get appBrowserReasonNeedsMacos14 =>
      'richiede macOS 14 o versioni successive.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Installa WebKitGTK per usare il browser qui: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Installa o aggiorna Microsoft Edge WebView2 per usare il browser qui.';

  @override
  String get appBrowserGetWebview2 => 'Ottieni WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Associato in una precedente installazione. Riattivalo per associare questo dispositivo.';

  @override
  String get appBrowserAllBots => 'Tutti i tuoi bot';

  @override
  String get appBrowserAllBotsHelp =>
      'Ogni bot con cui puoi chattare può usare questo browser. Disattiva per scegliere singoli bot.';

  @override
  String get appBrowserModeHeader => 'Quando a un bot serve un browser';

  @override
  String get appBrowserModeAlways => 'Sempre questo dispositivo';

  @override
  String get appBrowserModeAlwaysHelp =>
      'I bot aprono ogni pagina qui mentre hai la loro chat aperta. Il loro computer viene usato solo quando lo chiedi.';

  @override
  String get appBrowserOpenTooltip => 'Apri il browser';

  @override
  String get appBrowserBotsBrowseHere => 'I bot navigano qui';

  @override
  String get appBrowserBotsBrowseHereHelp =>
      'Ogni pagina delle tue chat si apre in questo browser mentre guardi';

  @override
  String get appBrowserModeAsk => 'Chiedi quando serve';

  @override
  String get appBrowserModeAskHelp =>
      'Offri una scelta quando un sito richiede il tuo accesso o blocca il computer del bot.';

  @override
  String get appBrowserModeComputer => 'Sempre il computer del bot';

  @override
  String get appBrowserModeComputerHelp =>
      'Non proporre mai il browser di questo dispositivo, a meno che tu non lo chieda in chat.';

  @override
  String get appBrowserModeDevice => 'Preferisci questo dispositivo';

  @override
  String get appBrowserModeDeviceHelp =>
      'Usa il browser di questo dispositivo per gli accessi e i siti bloccati senza chiedere.';

  @override
  String get appBrowserNeverAsk => 'Computer del bot (non chiedere)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Computer Linux';

  @override
  String get appBrowserDeviceWindows => 'PC Windows';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting =>
      'In attesa di te. Tieni aperta questa chat per continuare nel browser.';

  @override
  String browserWaitingSite(String site) {
    return 'In attesa di te. Tieni aperta questa chat per continuare con $site nel browser.';
  }

  @override
  String get browserWaitEnded => 'Attesa del browser interrotta.';

  @override
  String get browserHandBackWaiting =>
      'Tocca a te nel browser. Esegui il passaggio sulla pagina, poi tocca Restituisci il controllo.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Tocca a te su $site. Esegui il passaggio sulla pagina, poi tocca Restituisci il controllo.';
  }

  @override
  String get browserHandBackEnded =>
      'Attesa della restituzione del browser interrotta.';

  @override
  String get browserChoiceCardLabel => 'Scelta del browser';

  @override
  String browserChoiceTitle(String bot, String site) {
    return 'Dove deve aprire $site $bot?';
  }

  @override
  String get browserChoiceSubtitleSignIn =>
      'Questo sito richiede il tuo accesso.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Questo sito ha bloccato il computer di $bot.';
  }

  @override
  String get browserChoiceOnPhone => 'Su questo telefono';

  @override
  String get browserChoiceOnMac => 'Su questo Mac';

  @override
  String get browserChoiceOnLinux => 'Su questo computer';

  @override
  String get browserChoiceOnWindows => 'Su questo PC';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Puoi guardare e accedere tu stesso. Ciò che legge viene inviato all’IA.';

  @override
  String get browserChoiceInChrome => 'Nel tuo Chrome';

  @override
  String get browserChoiceInChromeHelp =>
      'Accesso già effettuato ai tuoi siti.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'Sul computer di $bot';
  }

  @override
  String get browserChoiceOnComputerHelp => 'Continua anche se esci.';

  @override
  String browserChoiceRemember(String site) {
    return 'Ricorda per $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return 'Aperto $site su questo telefono';
  }

  @override
  String browserChoicePickedMac(String site) {
    return 'Aperto $site su questo Mac';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return 'Aperto $site su questo computer';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return 'Aperto $site su questo PC';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return 'Aperto $site nel tuo Chrome';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return 'Aperto $site sul computer di $bot';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Nessuna risposta in tempo; rimasto sul computer di $bot';
  }

  @override
  String get appBrowserConsentTitle =>
      'Consentire ai bot di usare il browser in Casama?';

  @override
  String get appBrowserConsentPages =>
      'Le pagine che un bot legge qui vengono inviate a Casama e al modello IA del bot, proprio come le pagine che legge sul proprio computer.';

  @override
  String get appBrowserConsentSignIns =>
      'I tuoi accessi restano su questo dispositivo. I bot non vedono mai password, numeri di carta o codici; li digiti tu.';

  @override
  String get appBrowserConsentWatch =>
      'Funziona solo mentre hai la chat del bot aperta qui. Puoi guardare, prendere il controllo o fermarlo in qualsiasi momento.';

  @override
  String get appBrowserConsentYours =>
      'Ciò che visiti per conto tuo non viene mai inviato da nessuna parte.';

  @override
  String get appBrowserBots => 'Bot che possono usarlo';

  @override
  String get appBrowserBotsHelp =>
      'Solo i bot attivati qui possono usare il browser su questo dispositivo.';

  @override
  String get appBrowserNoBots => 'Ancora nessun bot.';

  @override
  String get appBrowserSites => 'Siti';

  @override
  String get appBrowserSitesHelp =>
      'Siti per cui hai risposto Sempre o Mai. Rimuovine uno per ricevere nuovamente la richiesta la prossima volta.';

  @override
  String get appBrowserNoSites =>
      'Ancora nessun sito. Un bot chiede la prima volta che apre un sito.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Rimuovi $site';
  }

  @override
  String get appBrowserKinds => 'Siti che restano disattivati';

  @override
  String get appBrowserKindsHelp =>
      'Questi tipi di siti restano disattivati finché non li attivi. Quando uno è attivo, un bot chiede comunque ogni volta.';

  @override
  String get appBrowserKindBanking => 'Banche e pagamenti';

  @override
  String get appBrowserKindHealth => 'Salute';

  @override
  String get appBrowserKindPasswords => 'Gestori di password';

  @override
  String get appBrowserKindGovernment => 'Documenti e servizi pubblici';

  @override
  String get appBrowserSignIn => 'Accedi a un sito';

  @override
  String get appBrowserSignInHelp =>
      'Apri un sito, accedi tu stesso, poi lascia che i tuoi bot lo usino. Nulla di ciò che fai lì viene inviato altrove.';

  @override
  String get appBrowserClearData => 'Cancella dati di navigazione';

  @override
  String get appBrowserClearDataHelp =>
      'Disconnette questo browser da ogni sito e cancella ciò che i siti hanno salvato.';

  @override
  String get appBrowserClearDataConfirm =>
      'Cancellare gli accessi e i dati dei siti di questo browser?';

  @override
  String get appBrowserClearDataDone => 'Dati di navigazione cancellati';

  @override
  String get appBrowserUnpair => 'Disassocia questo dispositivo';

  @override
  String get appBrowserUnpairConfirm =>
      'Disassociare il browser di questo dispositivo? I bot non potranno usarlo finché non lo riattiverai.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot sta lavorando';
  }

  @override
  String get appBrowserTakeOver => 'Prendi il controllo';

  @override
  String get appBrowserHandBack => 'Restituisci il controllo';

  @override
  String get appBrowserYourTurn => 'Tocca a te';

  @override
  String appBrowserPaused(String bot) {
    return '$bot è in pausa mentre usi la pagina';
  }

  @override
  String get appBrowserAway => 'In pausa: la chat non è aperta';

  @override
  String appBrowserDone(String bot) {
    return '$bot ha finito';
  }

  @override
  String appBrowserDoneFailed(String bot) {
    return '$bot si è fermato prima di finire';
  }

  @override
  String get appBrowserDoneHint =>
      'La risposta è nella chat. Questa pagina resta aperta se vuoi dare un\'occhiata.';

  @override
  String get appBrowserBackToChat => 'Torna alla chat';

  @override
  String get appBrowserStayHere => 'Resta qui';

  @override
  String get appBrowserAddress => 'Indirizzo del sito';

  @override
  String get appBrowserBack => 'Indietro';

  @override
  String get appBrowserForward => 'Avanti';

  @override
  String get appBrowserReload => 'Ricarica';

  @override
  String get appBrowserAllowSite => 'Consenti ai miei bot di usare questo sito';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site aggiunto. I tuoi bot possono usarlo qui.';
  }

  @override
  String get appBrowserAddressRefused =>
      'Impossibile aprire questo indirizzo qui.';

  @override
  String get appBrowserSecure => 'Connessione sicura';

  @override
  String get appBrowserNotSecure => 'Non sicuro';

  @override
  String get appBrowserCardLabel => 'Browser integrato';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot vuole aprire $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'In Casama su questo dispositivo, con i tuoi accessi. Sempre gli permette di aprire questo sito d’ora in poi.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Su questo Mac, con i tuoi accessi. Sempre gli permette di aprire questo sito d’ora in poi.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Su questo computer, con i tuoi accessi. Sempre gli permette di aprire questo sito d’ora in poi.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Su questo PC, con i tuoi accessi. Sempre gli permette di aprire questo sito d’ora in poi.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'I siti bancari e di pagamento chiedono ogni volta.',
      'health': 'I siti sulla salute chiedono ogni volta.',
      'passwords': 'I siti dei gestori di password chiedono ogni volta.',
      'government': 'I siti di identità digitale chiedono ogni volta.',
      'other': 'Questi siti chiedono ogni volta.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Una volta';

  @override
  String get appBrowserAlways => 'Sempre';

  @override
  String get appBrowserNever => 'Mai';

  @override
  String appBrowserStepAskTitle(String bot) {
    return 'Consentire a $bot di farlo?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'In Casama su questo dispositivo, con i tuoi accessi.';

  @override
  String get appBrowserStepAskHelpMac => 'Su questo Mac, con i tuoi accessi.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'Su questo computer, con i tuoi accessi.';

  @override
  String get appBrowserStepAskHelpWindows =>
      'Su questo PC, con i tuoi accessi.';

  @override
  String appBrowserStepClick(String name) {
    return 'Tocca “$name”';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Scrivi in “$name”';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Premi un tasto in “$name”';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Carica un file in “$name”';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'Non consentire';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Telefono Android';

  @override
  String get toolOnThisPhone => 'su questo dispositivo';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bot nei browser integrati dei membri';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'I membri possono consentire ai bot di usare un browser dentro Casama sul proprio telefono o computer, mentre guardano.';

  @override
  String appBrowserAwaySummary(String bot, int steps) {
    String _temp0 = intl.Intl.pluralLogic(
      steps,
      locale: localeName,
      other: '$steps passaggi',
      one: '1 passaggio',
    );
    return '$bot ha continuato mentre eri via · $_temp0';
  }

  @override
  String appBrowserNeedsYouTitle(String bot) {
    return '$bot ha bisogno di te';
  }

  @override
  String get appBrowserNeedsYouBody => 'Apri Casama per continuare.';

  @override
  String appBrowserStillUsingTitle(String bot) {
    return '$bot sta ancora usando il tuo browser';
  }

  @override
  String get appBrowserStillUsingBody => 'Torna così può finire.';

  @override
  String appBrowserFinishedTitle(String bot) {
    return '$bot ha finito';
  }

  @override
  String appBrowserFinishedOnSiteTitle(String bot, String site) {
    return '$bot ha finito su $site';
  }

  @override
  String get appBrowserFinishedBody => 'Tocca per vedere.';

  @override
  String get appBrowserKeepGoing => 'Continua quando esco dall\'app';

  @override
  String get appBrowserKeepGoingHelp =>
      'Completa le attività del browser in background con una notifica silenziosa (fino a 10 min, si mette in pausa con batteria scarica).';

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
  String get vendorRenewalUsd => 'Costo di un rinnovo (USD)';

  @override
  String get vendorRenewalMonths => 'Mesi coperti da un rinnovo';

  @override
  String get vendorSeeSpend => 'Vedi spesa';

  @override
  String get costSpent => 'Speso';

  @override
  String get costCharged => 'Addebitato';

  @override
  String get costMargin => 'Margine';

  @override
  String get costMarginNone => 'Nulla è stato addebitato';

  @override
  String get costNotRecorded => 'Non registrato';

  @override
  String get costNotRecordedHint =>
      'Mostra cosa significa e quali servizi riguarda';

  @override
  String get costNotRecordedHelp =>
      'Alcuni servizi segnalano un proprio totale. Quando il loro è superiore a quanto registrato da questo server, la differenza compare qui. È una spesa reale non ancora collegata a una funzione, chiave o spazio di lavoro.';

  @override
  String get costNotRecordedWhy => 'Cosa segnalano i servizi oltre a questo';

  @override
  String get costNotRecordedNone => 'Corrisponde a quanto segnalano i servizi';

  @override
  String get costNotRecordedAllMatch =>
      'Ogni servizio che segnala un totale corrisponde a quanto registrato da questo server.';

  @override
  String get costNotRecordedNoList =>
      'L’elenco dei servizi non è disponibile ora. Riprova tra un momento.';

  @override
  String get costNoVendorFigures => 'Nessun servizio ha segnalato un totale';

  @override
  String get costNoVendorFiguresHelp =>
      'Nessun servizio ha segnalato un proprio totale per questo periodo, quindi non c’è nulla con cui confrontare.';

  @override
  String costNoFigureFrom(String names) {
    return 'Nessun totale da: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count servizi',
      one: '1 servizio',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Loro dicono $theirs · noi abbiamo registrato $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Loro dicono $theirs · noi abbiamo registrato $ours · $gap non registrato';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Loro dicono $theirs · noi abbiamo registrato $ours · nulla mancante';
  }

  @override
  String get costNoVendorFigure =>
      'Questo servizio non ha fornito un proprio totale per questo periodo.';

  @override
  String get costNoVendorFigureKind =>
      'Questo servizio non segnala un proprio totale.';

  @override
  String costUpdated(String when) {
    return 'Aggiornato $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'rispetto ai $days giorni prima',
      one: 'rispetto al giorno prima',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown =>
      'nessun periodo precedente con cui confrontare';

  @override
  String get costChangeNew => 'Nuovo';

  @override
  String get costChangeNewSpoken => 'nuovo in questo periodo';

  @override
  String get costChangeFlat => 'nessuna variazione';

  @override
  String costChangeUp(String amount) {
    return 'su di $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'giù di $amount';
  }

  @override
  String costPoints(String count) {
    return '$count pt';
  }

  @override
  String get costOther => 'Altro';

  @override
  String get costNotLabelled => 'Senza etichetta';

  @override
  String get costNotLabelledHelp =>
      'Questi costi sono stati registrati senza un’etichetta per questo raggruppamento, quindi non possono essere suddivisi ulteriormente. Fanno comunque parte del totale.';

  @override
  String get costGroupService => 'Servizio';

  @override
  String get costGroupKey => 'Chiave';

  @override
  String get costGroupApp => 'App e MCP';

  @override
  String get costGroupFeature => 'Funzionalità';

  @override
  String get costGroupModel => 'Modello';

  @override
  String get costGroupWorkspace => 'Spazio di lavoro';

  @override
  String get costGroupBy => 'Raggruppa per';

  @override
  String get costFilters => 'Filtri';

  @override
  String get costNoFilters =>
      'Nessuno. Apri una riga e scegli Mostra nella tabella per restringere la vista.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Rimuovi filtro $name';
  }

  @override
  String get costIncludeFixed => 'Includi spese fisse';

  @override
  String get costIncludeFixedHelp =>
      'Aggiunge abbonamenti e rinnovi a Speso, distribuiti uniformemente sui giorni coperti.';

  @override
  String get costOptions => 'Periodo e filtri';

  @override
  String get costPeriod => 'Periodo';

  @override
  String costPeriodDays(int days) {
    return '$days giorni';
  }

  @override
  String get costPeriodCustom => 'Personalizzato';

  @override
  String costLastDays(int days) {
    return 'Ultimi $days giorni';
  }

  @override
  String get costChangeDates => 'Cambia date';

  @override
  String get costDone => 'Fatto';

  @override
  String get costDaysUtc => 'I giorni sono in UTC.';

  @override
  String get costDailySpend => 'Spesa giornaliera';

  @override
  String costStackedBy(String group) {
    return 'Suddivisi per $group: i maggiori prima, poi Altro.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Grafico spesa giornaliera, $days giorni, $total in totale. Il giorno più alto è stato il $peakDay con $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Grafico spesa giornaliera, $days giorni, nulla speso.';
  }

  @override
  String get costSourceMetered => 'A consumo';

  @override
  String get costSourceCounted => 'Conteggiato';

  @override
  String get costSourceFixed => 'Fisso';

  @override
  String get costSourceEstimated => 'Stimato';

  @override
  String get costSourceMeteredHelp =>
      'Un costo reale registrato per ogni chiamata.';

  @override
  String get costSourceCountedHelp =>
      'Il conteggio di questo server moltiplicato per un prezzo unitario.';

  @override
  String get costSourceFixedHelp =>
      'Una spesa distribuita uniformemente sui giorni coperti.';

  @override
  String get costSourceEstimatedHelp =>
      'Calcolato dalla lunghezza del testo. Il costo reale è almeno questo.';

  @override
  String get costEstimated => 'stimato';

  @override
  String get costColShare => 'Quota';

  @override
  String get costColChange => 'Variazione';

  @override
  String get costColCalls => 'Chiamate';

  @override
  String get costColSource => 'Origine';

  @override
  String get costColFailed => 'Non riuscite';

  @override
  String get costColFees => 'Costi fornitore';

  @override
  String get costColTokens => 'Costo token';

  @override
  String get costTokenCost => 'Costo token';

  @override
  String get costFailureRate => 'Tasso di errore';

  @override
  String costSortBy(String column) {
    return 'Ordina per $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, in ordine crescente';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, in ordine decrescente';
  }

  @override
  String get costOpenRowHint => 'Apre i dettagli';

  @override
  String costSpokenSpent(String amount) {
    return 'speso $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'costi fornitore $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share del totale';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count chiamate';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate non riuscite';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'costo token stimato $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'addebitato $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count chiamate';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate non riuscite';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount token, stimato';
  }

  @override
  String get costOpenBilling => 'Apri pagina fatturazione';

  @override
  String get costByDay => 'Per giorno';

  @override
  String get costSplitBy => 'Suddividi per';

  @override
  String get costShowInTable => 'Mostra nella tabella';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Limita la tabella a $name e la raggruppa per $group.';
  }

  @override
  String get costNothingRecorded => 'Nulla registrato qui in questo periodo.';

  @override
  String costLastUsed(String when) {
    return 'ultimo uso $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'E altri $count. Mostrali nella tabella.',
      one: 'E 1 altro. Mostralo nella tabella.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'A cosa serve';

  @override
  String get costKeyService => 'Servizio';

  @override
  String get costKeySetting => 'Impostazione';

  @override
  String get costKeySetIn => 'Dov’è impostata';

  @override
  String get costKeyVault => 'Elemento nel vault';

  @override
  String get costKeyStatus => 'Stato';

  @override
  String get costKeyConfigured => 'Impostata';

  @override
  String get costKeyNotConfigured => 'Non impostata';

  @override
  String get costKeyLastUsed => 'Ultimo utilizzo';

  @override
  String get costKeyNotUsed => 'Non in questo periodo';

  @override
  String get costKeyCap => 'Tetto di spesa';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '$left rimasti su $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share del tetto utilizzato';
  }

  @override
  String get costKeyNoCap => 'Nessuno';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nulla è stato speso in questi $days giorni',
      one: 'Nulla è stato speso in questo giorno',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Nulla è stato speso in questi giorni';

  @override
  String get costEmptyFiltered =>
      'Nulla è stato speso che corrisponda a questi filtri';

  @override
  String get costEmptyGroup => 'Nulla da elencare per questo raggruppamento';

  @override
  String get costAppsNote =>
      'App e server MCP: Speso è quanto fatturato dal fornitore. Il costo token è una stima di quanto costano i risultati in token del modello ed è già compreso nella spesa dei modelli.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount in spese fisse per questo periodo è escluso. Attiva Includi spese fisse per aggiungerlo.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Gli spazi di lavoro hanno pagato $amount sulle proprie chiavi. Non si tratta di spesa di questo server, quindi è esclusa.';
  }

  @override
  String get costOlderServerTitle =>
      'Questo server necessita di un aggiornamento';

  @override
  String get costOlderServer =>
      'I costi per servizio, chiave e app sono disponibili con una versione più recente del server. Aggiorna il server, poi controlla di nuovo.';

  @override
  String get costCheckAgain => 'Controlla di nuovo';

  @override
  String get costSpendCardTitle => 'Spesa, ultimi 30 giorni';

  @override
  String get costSpendCardOpen => 'Costi';

  @override
  String get costSpendCardHint => 'Apre la scheda Costi';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Spesa negli ultimi 30 giorni: $spent speso, $charged addebitato, $margin margine';
  }

  @override
  String get costSort => 'Ordina per';

  @override
  String get costSortName => 'Nome';

  @override
  String get costByWorkspace => 'Per spazio di lavoro';

  @override
  String get costTopTools => 'Strumenti principali';

  @override
  String get costToolList => 'Elenco strumenti inviato al modello';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'E altri $count strumenti.',
      one: 'E 1 altro strumento.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Usa il bot Telegram di Casama';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Parla con $bot su Telegram. Un tocco, nulla da configurare.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Il tuo Telegram è collegato in un altro spazio di lavoro. Collegandolo qui lo sposti.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'I tuoi messaggi lì vanno a $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'I tuoi messaggi lì vanno a $other. Tocca per inviarli a $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Ora i messaggi Telegram vanno a $bot.';
  }

  @override
  String get telegramFinish => 'Completa in Telegram';

  @override
  String get telegramFinishHelp =>
      'Premi Avvia in Telegram. Fallo solo sul tuo account Telegram. Si aggiornerà non appena sarai collegato.';

  @override
  String get telegramOpenAgain => 'Apri di nuovo Telegram';

  @override
  String get telegramConnected => 'Telegram è collegato';

  @override
  String telegramConnectedHelp(String name) {
    return 'Collegato come $name. Scrivi al bot su Telegram quando vuoi; la chat appare anche qui in Generale.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Scrivi al bot su Telegram quando vuoi; la chat appare anche qui in Generale.';

  @override
  String get telegramConnect => 'Collega Telegram';

  @override
  String get telegramDisconnect => 'Scollega Telegram';

  @override
  String get telegramDisconnectConfirm => 'Scollegare Telegram?';

  @override
  String get telegramDisconnectHelp =>
      'I tuoi bot smetteranno di rispondere su Telegram. La cronologia delle chat resta qui.';

  @override
  String get telegramPickBot => 'I messaggi Telegram vanno a';

  @override
  String get telegramNeedsBot => 'Crea prima un bot, poi collega Telegram.';

  @override
  String get telegramNotOffered =>
      'Questo server non dispone di un proprio bot Telegram. Puoi collegare il tuo bot dalle App di chat di un bot.';

  @override
  String get chatAppsSettingsHelp =>
      'Parla con i tuoi bot dalle app di chat che usi già. I messaggi arrivano nella tua chat Generale, così puoi continuare qui.';

  @override
  String get chatAppsPerBot =>
      'Email e i tuoi bot personali si configurano per singolo bot: apri un bot, poi App di chat.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack e altro';

  @override
  String get chatAppsSlackHelp =>
      'Slack viene aggiunto per singolo spazio di lavoro Slack, per un bot. Scegli il bot, poi Aggiungi a Slack.';

  @override
  String get chatAppsSlackPickBot => 'Aggiungi Slack per';

  @override
  String get slackAnyoneInWorkspace =>
      'Chiunque in questo spazio di lavoro Slack';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Tutti nello spazio di lavoro possono parlare con il bot, non solo le persone elencate. Le approvazioni richiedono comunque qualcuno dell’elenco.';

  @override
  String get discordUseCasama => 'Usa il bot Discord di Casama';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Parla con $bot su Discord. Accedi con Discord una volta, poi scrivi al bot o usa /ask ovunque.';
  }

  @override
  String get discordOtherWorkspace =>
      'Il tuo Discord è collegato in un altro spazio di lavoro. Collegandolo qui lo sposti.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Ora i messaggi Discord vanno a $bot.';
  }

  @override
  String get discordFinish => 'Completa in Discord';

  @override
  String get discordFinishHelp =>
      'Accedi con Discord nel browser e autorizza Casama. Fallo solo con il tuo account Discord. Si aggiornerà una volta collegato.';

  @override
  String get discordOpenAgain => 'Apri di nuovo l’accesso Discord';

  @override
  String get discordConnected => 'Discord è collegato';

  @override
  String discordConnectedHelp(String name) {
    return 'Collegato come $name. Scrivi al bot di Casama su Discord o usa /ask ovunque; la chat appare anche qui in Generale.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Scrivi al bot di Casama su Discord o usa /ask ovunque; la chat appare anche qui in Generale.';

  @override
  String get discordConnect => 'Collega Discord';

  @override
  String get discordDisconnect => 'Scollega Discord';

  @override
  String get discordDisconnectConfirm => 'Scollegare Discord?';

  @override
  String get discordDisconnectHelp =>
      'I tuoi bot smetteranno di rispondere su Discord. La cronologia delle chat resta qui.';

  @override
  String get discordPickBot => 'I messaggi Discord vanno a';

  @override
  String get discordNeedsBot => 'Crea prima un bot, poi collega Discord.';

  @override
  String get discordNotOffered =>
      'Questo server non dispone di una propria app Discord. Puoi collegare la tua app Discord dalle App di chat di un bot.';

  @override
  String get inactiveAccountsNote =>
      'Se smetti di usare Casama: dopo 30 giorni le tue routine e il monitoraggio vanno in pausa finché non torni. Dopo 6 mesi i file salvati dei tuoi computer vengono rimossi e dopo 12 mesi (24 se hai effettuato almeno un pagamento) viene rimosso il tuo account. Ti scriviamo via email prima di rimuovere qualsiasi cosa. Gli account con un piano a pagamento non vengono mai interessati.';

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
  String get inactivityModeOff => 'Disattivo';

  @override
  String get inactivityModeReport => 'Rapporto';

  @override
  String get inactivityModeOn => 'Attivo';

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
    return 'attivo $when';
  }

  @override
  String get inactivityStateResting => 'In riposo';

  @override
  String get inactivityStateFilesSoon => 'File rimossi a breve';

  @override
  String get inactivityStateRemovalSoon => 'Rimozione a breve';

  @override
  String get inactivityStateRemoving => 'Rimozione in corso';

  @override
  String get inactivityKept => 'Mantenuto';

  @override
  String get keepAccount => 'Mantieni questo account';

  @override
  String get keepAccountHelp => 'Mai sospeso né rimosso per inattività';

  @override
  String get computerFilesRemoved => 'File salvati rimossi';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Questo computer non è stato usato per 6 mesi, quindi i suoi file salvati sono stati rimossi (data: $date). Riparte da zero.';
  }

  @override
  String get downloadSavedFiles => 'Scarica file salvati';

  @override
  String get downloadSavedFilesHelp =>
      'Un archivio .tar.gz della cartella home, senza riattivarlo';

  @override
  String get liveActivity => 'Attività in tempo reale';

  @override
  String get liveRowHelp =>
      'Lista d’attesa, iscrizioni e download in tempo reale';

  @override
  String get liveRefresh => 'Aggiorna';

  @override
  String get liveTabActivity => 'Attività';

  @override
  String get liveTabAlerts => 'Avvisi';

  @override
  String get liveGroupAll => 'Tutto';

  @override
  String get liveGroupWaitlist => 'Lista d’attesa';

  @override
  String get liveGroupAccounts => 'Account';

  @override
  String get liveGroupMoney => 'Pagamenti';

  @override
  String get liveGroupWebsite => 'Sito web';

  @override
  String get liveGroupGrowth => 'Crescita';

  @override
  String get liveGroupSupport => 'Assistenza';

  @override
  String get liveKindWaitlistJoined => 'Iscritto alla lista d’attesa';

  @override
  String get liveKindWaitlistAdmitted => 'Ammesso dalla lista d’attesa';

  @override
  String get liveKindSignup => 'Nuovo account';

  @override
  String get liveKindSignupRefused => 'Iscrizione respinta';

  @override
  String get liveKindFirstChat => 'Prima chat';

  @override
  String get liveKindMilestone =>
      'Altri primi utilizzi (bot, computer, chiamata, routine)';

  @override
  String get liveKindSubscription => 'Nuovo abbonamento';

  @override
  String get liveKindSubscriptionEnded => 'Abbonamento terminato';

  @override
  String get liveKindPurchase => 'Crediti acquistati';

  @override
  String get liveKindSupportTicket => 'Ticket di assistenza';

  @override
  String get liveKindFeedback => 'Feedback';

  @override
  String get liveKindAccountDeleted => 'Account eliminato';

  @override
  String get liveKindDownloadClick => 'Clic su download';

  @override
  String get liveKindQrOpen => 'Codice QR di download aperto';

  @override
  String get liveKindStartClick => 'Clic su Inizia gratis';

  @override
  String get liveKindInviteOpen => 'Link di invito aperto';

  @override
  String get liveNow => 'adesso';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes min';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours h';
  }

  @override
  String get liveTestSent => 'Avviso di prova inviato ai tuoi dispositivi';

  @override
  String get liveTodayWaitlist => 'Iscritti oggi';

  @override
  String get liveTodaySignups => 'Account oggi';

  @override
  String get liveTodayDownloads => 'Download oggi';

  @override
  String get liveTodayMoney => 'Entrate oggi';

  @override
  String get liveRetry => 'Riprova';

  @override
  String get liveEmpty =>
      'Ancora nulla. Le nuove attività compaiono qui entro pochi secondi.';

  @override
  String get liveOlder => 'Mostra precedenti';

  @override
  String get liveAlertsHelp =>
      'Scegli cosa inviare come notifica push ai tuoi telefoni, Mac e browser. Quando succedono molte cose insieme, ricevi un unico riepilogo invece di una notifica per ciascuna.';

  @override
  String get livePauseAll => 'Sospendi tutti gli avvisi';

  @override
  String get livePauseAllHelp => 'L’attività continua a comparire qui';

  @override
  String get liveSendTest => 'Invia un avviso di prova';

  @override
  String get liveSendTestHelp =>
      'Verifica che gli avvisi raggiungano questo dispositivo';

  @override
  String get liveAlertsFooter =>
      'Gli avvisi attendono durante le tue ore di silenzio (Impostazioni → Notifiche) e arrivano come un unico riepilogo al termine. Nel browser, consenti le notifiche per questo sito per riceverle lì.';

  @override
  String get liveStatusOn => 'Live: si aggiorna ogni pochi secondi';

  @override
  String get liveStatusPaused => 'Live. Gli avvisi sono in pausa';

  @override
  String get liveGroupApp => 'App';

  @override
  String get liveKindAppFirstOpen => 'App aperta per la prima volta';

  @override
  String get liveKindAppReinstall => 'App reinstallata';

  @override
  String get liveKindSigninStarted => 'Accesso avviato';

  @override
  String get liveKindTrialStarted => 'Prova gratuita avviata';

  @override
  String get liveKindRenewal => 'Abbonamento rinnovato';

  @override
  String get liveKindRefund => 'Rimborso';

  @override
  String get liveKindDisputeOpened => 'Contestazione aperta';

  @override
  String get liveKindPlanCancelFailed => 'Piano non annullato';

  @override
  String get liveKindStoreReview => 'Recensione nello store';

  @override
  String get liveKindStoreCrashes => 'Segnalazioni di arresto dello store';

  @override
  String get liveKindDay2Return => 'Tornato al giorno 2';

  @override
  String get liveKindWeek1Return => 'Tornato nella settimana 1';

  @override
  String get liveKindDeviceGone => 'App probabilmente eliminata';

  @override
  String get liveKindPartnerInterest => 'Creator interessato ai Partner';

  @override
  String get liveKindCreatorOpen => 'Link creator aperto';

  @override
  String get liveKindPartnerClaimed => 'Codice creator utilizzato';

  @override
  String get liveKindGiftOpen => 'Link regalo aperto';

  @override
  String get liveKindCompRedeemed => 'Piano regalo riscattato';

  @override
  String get liveKindReferralRewarded => 'Invito andato a buon fine';

  @override
  String get liveKindNewsletterConfirmed => 'Iscrizione alla newsletter';

  @override
  String get liveKindTestimonialSubmitted => 'Testimonianza da esaminare';

  @override
  String get liveDailyDigest => 'Riepilogo mattutino';

  @override
  String get liveDailyDigestHelp =>
      'Funnel e download di ieri, alle 9 nel tuo fuso orario';

  @override
  String get liveFunnelClicks => 'Clic';

  @override
  String get liveFunnelOpens => 'Prime aperture';

  @override
  String get liveFunnelSignups => 'Account';

  @override
  String get liveFunnelChats => 'Prime chat';

  @override
  String get liveFunnelPaying => 'Paganti';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => 'Per persona';

  @override
  String get liveSearch => 'Cerca email, paese, origine';

  @override
  String get liveNoMatches => 'Nessun risultato per questa ricerca';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passaggi',
      one: '1 passaggio',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'probabile';

  @override
  String get liveStepClick => 'Ha cliccato su download';

  @override
  String get liveStepOpen => 'Ha aperto l’app';

  @override
  String get liveStepSignup => 'Ha creato un account';

  @override
  String get liveStepChat => 'Prima chat';

  @override
  String get liveStepPaying => 'Pagante';

  @override
  String get liveJourneyTitle => 'Cos’è successo';

  @override
  String get liveJourneyVisitor => 'Visitatore';

  @override
  String get liveJourneyWho => 'Chi';

  @override
  String get liveJourneyFrom => 'Da dove';

  @override
  String get liveJourneyDevice => 'Dispositivo';

  @override
  String get liveJourneyTimeline => 'Cronologia';

  @override
  String get liveJourneyNow => 'Adesso';

  @override
  String get liveJourneySource => 'Origine';

  @override
  String get liveJourneyCampaign => 'Campagna';

  @override
  String get liveJourneyLanding => 'Prima pagina';

  @override
  String get liveJourneyClickedFrom => 'Cliccato su';

  @override
  String get liveJourneyPlatform => 'Piattaforma';

  @override
  String get liveJourneyStore => 'Da';

  @override
  String get liveJourneyVersion => 'Versione';

  @override
  String get liveJourneyCountry => 'Paese';

  @override
  String get liveJourneyLikelyHelp =>
      'Abbinato a un clic sul sito web in base a dispositivo, paese e orario, non tramite link. Consideralo un’ipotesi attendibile.';

  @override
  String get liveJourneyPlan => 'Piano';

  @override
  String get liveJourneyMessages => 'Messaggi inviati';

  @override
  String get liveJourneyBots => 'Bot';

  @override
  String get liveJourneyDevices => 'Connesso su';

  @override
  String get liveJourneyLastActive => 'Ultima attività';

  @override
  String get liveJourneyJoined => 'Account creato';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap dopo';
  }

  @override
  String get liveJourneyNone => 'Non si sa ancora altro su questo profilo.';

  @override
  String get liveJourneyCopyEmail => 'Copia email';

  @override
  String get liveJourneyCopied => 'Email copiata';

  @override
  String get liveJourneyOpenAdmin => 'Apri in Admin';

  @override
  String get liveJourneyGone =>
      'Questo evento ha più di 30 giorni, quindi i suoi dettagli non sono più disponibili.';

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
  String get planChangeTitle => 'Conferma cambio piano';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Passa a $plan';
  }

  @override
  String get planChangeChargedNow => 'Addebitato ora';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Include $tax di imposte';
  }

  @override
  String get planChangeCredit => 'Credito per il tempo non utilizzato';

  @override
  String planChangeThen(String amount, String period) {
    return 'Poi $amount / $period (imposte escluse)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Prossima fatturazione il $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Conferma e paga';

  @override
  String get planChangeHaveCode => 'Hai un codice?';

  @override
  String get planChangeCodeLabel => 'Codice sconto';

  @override
  String get planChangeCodeHint => 'Inserisci codice';

  @override
  String get planChangeApply => 'Applica';

  @override
  String get planChangeRemove => 'Rimuovi';

  @override
  String get planChangeDiscountApplied => 'Sconto applicato';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '$percent% di sconto, a ogni rinnovo';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$percent% di sconto, per $count rinnovi',
      one: '$percent% di sconto, per 1 rinnovo',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '$amount di sconto, a ogni rinnovo';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$amount di sconto, per $count rinnovi',
      one: '$amount di sconto, per 1 rinnovo',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '$percent% di sconto a ogni rinnovo; termina se cambi piano di nuovo';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '$amount di sconto a ogni rinnovo; termina se cambi piano di nuovo';
  }

  @override
  String get planChangeInvalidCode =>
      'Questo codice non può essere usato su questo piano.';

  @override
  String get planChangeCodeCostsMore =>
      'Questo codice sostituirebbe il tuo sconto attuale e costerebbe di più.';

  @override
  String get planChangeCodeEndsLasting =>
      'Questo codice farebbe terminare il tuo attuale sconto permanente.';

  @override
  String get planChangeCodeNotBetter => 'Hai già uno sconto uguale o migliore.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Sostituisce il tuo sconto attuale del $percent%';
  }

  @override
  String get planChangeReplacesDiscount => 'Sostituisce il tuo sconto attuale';

  @override
  String get planChangePriceMoved =>
      'Il totale è cambiato da quando hai aperto questa schermata. Controlla il nuovo importo e conferma di nuovo.';

  @override
  String get planChangePeriodWeek => 'settimana';

  @override
  String get planChangePeriodMonth => 'mese';

  @override
  String get planChangePeriodYear => 'anno';

  @override
  String get adminFreePlans => 'Free Plans';

  @override
  String get adminAboutFreePlans =>
      'Gift codes and free plans for friends. Codes are redeemed on the web, then the plan works in every app.';

  @override
  String get adminFreeOff =>
      'Free plans are off on this server. Turn them on with scripts/comps.sh on.';

  @override
  String get adminFreeNewCode => 'New Gift Code';

  @override
  String get adminFreeGive => 'Give a Plan';

  @override
  String get adminFreeStatRunning => 'Free plans running';

  @override
  String get adminFreeStatCodesLive => 'Codes that still work';

  @override
  String get adminFreeStatRedeemed => 'Codes redeemed';

  @override
  String get adminFreeCodes => 'Gift Codes';

  @override
  String get adminFreeCodesNone =>
      'No gift codes yet. Make one to give someone a free plan.';

  @override
  String get adminFreeWho => 'Who Has One';

  @override
  String get adminFreeFilterRunning => 'Running';

  @override
  String get adminFreeFilterAll => 'All';

  @override
  String get adminFreeNoneRunning => 'Nobody has a free plan right now.';

  @override
  String get adminFreeNone => 'No free plans yet.';

  @override
  String get adminFreeStatusLive => 'Live';

  @override
  String get adminFreeStatusUsedUp => 'Used Up';

  @override
  String get adminFreeStatusOff => 'Off';

  @override
  String get adminFreeStatusExpired => 'Expired';

  @override
  String get adminFreeNoRedeemBy => 'No end date';

  @override
  String get adminFreeTurnOff => 'Turn Off';

  @override
  String get adminFreeTurnOn => 'Turn On';

  @override
  String get adminFreePlan => 'Plan';

  @override
  String get adminFreeMonths => 'Months';

  @override
  String get adminFreeUses => 'How many people can use it';

  @override
  String get adminFreeUsesHelp =>
      'Each person can redeem one gift code ever. Use 1 for a code meant for one person.';

  @override
  String get adminFreeRedeemByLabel => 'Redeem By';

  @override
  String get adminFreeAnyTime => 'Any time';

  @override
  String get adminFreeNote => 'Note (only you see it)';

  @override
  String get adminFreeNoteHint => 'For Maya';

  @override
  String get adminFreeCreate => 'Make Code';

  @override
  String get adminFreeMadeTitle => 'Gift Code Ready';

  @override
  String get adminFreeMadeBody =>
      'Copy it now. It\'s shown only this once: afterwards only its last characters are kept.';

  @override
  String get adminFreeCopyCode => 'Copy Code';

  @override
  String get adminFreeCopyLink => 'Copy Link';

  @override
  String get adminFreeCopyMessage => 'Copy Message';

  @override
  String get adminFreeDone => 'Done';

  @override
  String get adminFreeEmail => 'Their email';

  @override
  String get adminFreeGiveHelp =>
      'It goes on the oldest workspace they own, so they need a Casama account first.';

  @override
  String get adminFreeGiveButton => 'Give Plan';

  @override
  String get adminFreeFromCode => 'Gift code';

  @override
  String get adminFreeFromGrant => 'Given';

  @override
  String get adminFreeExtend => 'Extend';

  @override
  String get adminFreeExtendButton => 'Extend Plan';

  @override
  String get adminFreeEndNow => 'End Now';

  @override
  String get adminFreeEndTitle => 'End this free plan now?';

  @override
  String get adminFreeEndBody =>
      'The workspace moves to Free right away. Credits already given stay.';

  @override
  String get adminFreeExtended => 'Free plan extended';

  @override
  String get adminFreeEndedDone => 'Free plan ended';

  @override
  String get adminFreeReasonExpired => 'Ran out';

  @override
  String get adminFreeReasonRevoked => 'Ended by you';

  @override
  String get adminFreeReasonReplaced => 'They bought a plan';

  @override
  String get adminFreeColWho => 'Who';

  @override
  String get adminFreeColPlan => 'Plan';

  @override
  String get adminFreeColEnds => 'Ends';

  @override
  String get adminFreeCopied => 'Copied';

  @override
  String get adminFreeInvalid => 'Check the numbers and the email address.';

  @override
  String adminFreeStatRunningValue(int count, int max) {
    return '$count of $max';
  }

  @override
  String adminFreePlanMonths(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months months',
      one: '1 month',
    );
    return '$plan · $_temp0';
  }

  @override
  String adminFreeUsed(int used, int total) {
    return '$used of $total redeemed';
  }

  @override
  String adminFreeRedeemBy(String date) {
    return 'Redeem by $date';
  }

  @override
  String adminFreeEnds(String date) {
    return 'Ends $date';
  }

  @override
  String adminFreeEndedOn(String date) {
    return 'Ended $date';
  }

  @override
  String adminFreeGiven(String plan, String date) {
    return '$plan given until $date';
  }

  @override
  String adminFreeMessage(String what, String plan, String link) {
    return 'Here\'s $what of Casama $plan, free: $link\n\nOpen it in Safari or Chrome, tap Redeem on the web and sign in with your Casama account. Nothing to pay, no card.';
  }

  @override
  String adminFreeMonthCount(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months months',
      one: '1 month',
    );
    return '$_temp0';
  }

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
  String get partnerProgramTitle => 'Realizzi video, post o una newsletter?';

  @override
  String get partnerProgramSubtitle =>
      'Guadagna il 30% di quanto pagano le persone che porti, per un anno';

  @override
  String get partnerYourCode => 'Il tuo codice creator';

  @override
  String get partnerPaused => 'In pausa';

  @override
  String get partnerPortal => 'Guadagni e pagamenti';

  @override
  String partnerShareText(String link, String code) {
    return 'Prova Casama, colleghi IA che lavorano per te. Usa il mio codice $code quando ti iscrivi: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name ti ha consigliato Casama.';
  }

  @override
  String get partnerClaimed =>
      'Codice creator aggiunto. Ti diamo il benvenuto su Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Grazie per il supporto a $name. Ti diamo il benvenuto su Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'Questo codice creator non esiste. Controllalo e riprova.';

  @override
  String get partnerErrOwnCode =>
      'Questo è il tuo codice. Condividilo invece con il tuo pubblico.';

  @override
  String get partnerErrWindowClosed =>
      'I codici creator possono essere inseriti solo nei primi giorni dopo l’iscrizione.';

  @override
  String get partnerErrAlreadyPaying =>
      'I codici creator sono riservati ai nuovi account, prima del primo pagamento.';

  @override
  String get partnerErrAlready => 'Hai già inserito il codice di un creator.';

  @override
  String get partnerErrReferred =>
      'Hai usato l’invito di un amico per iscriverti, quindi non puoi aggiungere un codice creator.';

  @override
  String get partnerErrOff =>
      'I codici creator non sono disponibili su questo server.';

  @override
  String get referralHaveCodeAny => 'Hai un codice?';

  @override
  String get referralCodeHintAny => 'Codice di un amico o di un creator';

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
  String get testimonialStateLive => 'Pubblicata';

  @override
  String get testimonialStateDraft => 'Bozza';

  @override
  String get testimonialStateHidden => 'Nascosta';

  @override
  String get testimonialStateWithdrawn => 'Ritirata';

  @override
  String get testimonialPlaceSiteHome => 'home di casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'prezzi di casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'Piani nell’app';

  @override
  String get testimonialPlaceAppSignin => 'Accesso nell’app';

  @override
  String get testimonialSourceEmail => 'Email';

  @override
  String get testimonialSourceInApp => 'Nell’app';

  @override
  String get testimonialSourceOther => 'Altro';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stelle',
      one: '1 stella',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Cosa dicono le persone di Casama';

  @override
  String get testimonialAskTitle => 'Ti piace Casama?';

  @override
  String get testimonialAskSubtitle => 'Diccelo in una frase.';

  @override
  String get testimonialAskHint => 'Cosa ti piace di Casama?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama può citare questo mio commento su casama.ai e nell’app come $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama può citare questo mio commento su casama.ai e nell’app come utente di Casama';

  @override
  String get testimonialAskSend => 'Invia';

  @override
  String get testimonialAskNotNow => 'Non ora';

  @override
  String get testimonialAskThanks => 'Grazie! Leggiamo ogni messaggio.';

  @override
  String get communityTitle => 'Community';

  @override
  String get communitySentence =>
      'Casama è open source. Se ti è utile, una stella su GitHub aiuta altre persone a scoprirlo.';

  @override
  String get communityStarOnGitHub => 'Metti una stella su GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Chatta con il team e le altre persone che usano Casama';

  @override
  String get starAskTitle => 'Casama su GitHub';

  @override
  String get starAskNotNow => 'Non ora';

  @override
  String get cloudSignInTitle => 'Accedi con il tuo account Casama';

  @override
  String get cloudSignInBody =>
      'La licenza personale gratuita proviene dal tuo account Casama. A questo server arriva solo la licenza; le tue chat restano lì.';

  @override
  String get cloudSignInEmail => 'Email';

  @override
  String get cloudSignInSendCode => 'Invia codice';

  @override
  String get cloudSignInCode => 'Codice ricevuto via email';

  @override
  String get cloudSignInVerify => 'Accedi';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Abbiamo inviato un codice a $email. Inseriscilo qui.';
  }

  @override
  String get licenseSetupTitle => 'Ottieni la tua licenza personale gratuita';

  @override
  String get licenseSetupBody =>
      'Questo server ha bisogno di una licenza prima che i bot possano lavorare. L’uso personale è gratuito per una persona: accedi con il tuo account Casama e la licenza si rinnova online ogni 30 giorni.';

  @override
  String get licensePersonalButton => 'Ottieni licenza personale gratuita';

  @override
  String get licensePersonalNote =>
      'Personale: una persona, per uso personale, sul tuo computer o server.';

  @override
  String get licenseBusinessTitle => 'Oppure inserisci una chiave aziendale';

  @override
  String get licenseBusinessHint => 'Incolla la chiave di licenza';

  @override
  String get licenseBusinessSave => 'Usa questa chiave';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Usi Casama al lavoro o con un team? Business costa $monthlyPrice per utente attivo al mese ($yearlyMonthlyPrice con fatturazione annuale). Scrivi a $email.';
  }

  @override
  String get licenseActivated => 'Licenza attiva. I tuoi bot possono lavorare.';

  @override
  String get licenseOtherServer => 'Usa un altro server';

  @override
  String get licenseRenew => 'Rinnova';

  @override
  String get licenseRenewTitle => 'Rinnova la licenza di questo server';

  @override
  String licenseGraceBanner(String date) {
    return 'La licenza di questo server è scaduta. I bot continuano a lavorare fino a questa data: $date. Rinnova prima di allora.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'La licenza di questo server è scaduta. Rinnovala presto per mantenere i bot attivi.';

  @override
  String get licenseExpiredBanner =>
      'La licenza di questo server è scaduta, quindi le nuove esecuzioni dei bot sono in pausa. I tuoi dati sono al sicuro: puoi ancora accedere, leggere ed esportare. Rinnova per riavviare i bot.';

  @override
  String get licenseErrorRequired =>
      'Questo server ha prima bisogno di una licenza. Ottieni la licenza personale gratuita o inserisci una chiave aziendale.';

  @override
  String licenseErrorSeats(String email) {
    return 'Tutti i posti della licenza di questo server sono occupati. Per più persone serve una licenza Business: scrivi a $email.';
  }

  @override
  String get licenseErrorExpired =>
      'La licenza di questo server è scaduta, quindi le nuove esecuzioni dei bot sono in pausa. I tuoi dati sono al sicuro. Rinnova la licenza per riavviare i bot.';

  @override
  String get licenseEditionPersonal => 'Personale';

  @override
  String get licenseEditionTrial => 'Prova';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Esportazione audit';

  @override
  String get licenseFeatureAuditForwarding => 'Inoltro audit';

  @override
  String get licenseFeatureRoles => 'Ruoli avanzati';

  @override
  String get setupLicenseTitle => 'Licenza personale gratuita';

  @override
  String get setupLicenseBody =>
      'Accedi con il tuo account Casama per ottenere la licenza personale gratuita per questo server: una persona, uso personale. Puoi farlo anche più tardi.';

  @override
  String get setupLicenseSignIn => 'Accedi con Casama';

  @override
  String get setupLicenseReady =>
      'La licenza personale gratuita è inclusa con il tuo server.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Accesso effettuato come $email. La licenza personale gratuita è inclusa con il tuo server.';
  }

  @override
  String get setupLicenseSkipped =>
      'Ancora nessuna licenza. Il server ne chiederà una all’avvio.';

  @override
  String setupLicenseFailed(String error) {
    return 'Impossibile creare la licenza personale ($error). Il server ne chiederà una all’avvio.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Il server di Casama viene eseguito dentro Docker Desktop, un’app gratuita che usa WSL 2 per tenerlo separato dal resto del PC.';

  @override
  String get setupDockerStep1Windows =>
      'Esegui il programma di installazione scaricato e lascia attiva l’opzione \"Use WSL 2\".';

  @override
  String localUpdateAvailable(String version) {
    return 'È disponibile un aggiornamento del server: $version';
  }

  @override
  String get localUpdateButton => 'Aggiorna';

  @override
  String get localUpdateLater => 'Più tardi';

  @override
  String localUpdateTitle(String version) {
    return 'Aggiorna il server alla $version';
  }

  @override
  String get localUpdateBody =>
      'Prima viene eseguito il backup del database. Se la nuova versione non si avvia, il server torna alla versione attuale.';

  @override
  String localUpdateDone(String version) {
    return 'Aggiornato alla $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'La nuova versione non si è avviata, quindi il server è tornato alla versione precedente. Nulla è andato perso ed è stato salvato un backup del database.';

  @override
  String localUpdateFailed(String detail) {
    return 'Aggiornamento non riuscito: $detail';
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
  String get shCloudScreenTitle => 'Modelli di Casama Cloud';

  @override
  String get shCloudPitch =>
      'I modelli di Casama, senza chiavi da gestire. Si pagano con un piano Casama Cloud.';

  @override
  String get shCloudTurnOn => 'Attiva';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Attivo · pagato da $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, pagato da $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Non attivo. Solo un amministratore di questo server può attivarlo.';

  @override
  String get shCloudManage => 'Gestisci';

  @override
  String get shCloudSignInBody =>
      'Accedi con il tuo account Casama per scegliere chi paga per i modelli di Casama Cloud. Bot, chat e memoria restano su questo server.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Connesso a Casama Cloud come $email';
  }

  @override
  String get shCloudOtherAccount => 'Usa un altro account';

  @override
  String get shCloudContinue => 'Continua';

  @override
  String get shCloudPayerTitle => 'Chi paga?';

  @override
  String get shCloudPayerBody =>
      'I modelli di Casama Cloud sono pagati da uno spazio di lavoro Casama Cloud che possiedi o gestisci. Il suo piano, l’utilizzo incluso e il limite giornaliero sono condivisi con tutto il resto che usa.';

  @override
  String get shCloudPayerNone =>
      'Non gestisci ancora uno spazio di lavoro Casama Cloud. Creane uno per pagare da lì; parte vuoto.';

  @override
  String get shCloudCreateWorkspace => 'Creane uno';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Spazio di lavoro di $name';
  }

  @override
  String get shCloudNoPlan => 'Ancora nessun piano';

  @override
  String shCloudCovered(String plan) {
    return 'Il tuo piano $plan lo copre.';
  }

  @override
  String get shCloudPlanTitle => 'Scegli un piano';

  @override
  String get shCloudPlanBody =>
      'I modelli di Casama Cloud sono inclusi in qualsiasi piano Casama Cloud: stesso utilizzo incluso, limite giornaliero e ricariche extra di Cloud. Nessun prezzo separato per il self-hosting.';

  @override
  String get shCloudTryFirst => 'Provalo prima';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Utilizzo gratuito per provare: circa $amount di messaggi, una volta per account Casama. Nulla da acquistare.';
  }

  @override
  String get shCloudTrialUsed =>
      'L’utilizzo gratuito di prova è esaurito su questo account Casama. Scegli un piano per continuare.';

  @override
  String get shCloudIntervalWeek => 'Settimanale';

  @override
  String get shCloudIntervalMonth => 'Mensile';

  @override
  String get shCloudIntervalYear => 'Annuale';

  @override
  String get shCloudWaitingForPlan =>
      'Completa il pagamento nel browser. Questa schermata proseguirà da sola all’arrivo del piano.';

  @override
  String get shCloudWaitingTimedOut =>
      'Il piano non è ancora arrivato. Un pagamento può richiedere qualche minuto per risultare attivo.';

  @override
  String get shCloudCheckAgain => 'Controlla di nuovo';

  @override
  String get shCloudGiftCode => 'Hai un codice regalo?';

  @override
  String get shCloudGiftCodeLabel => 'Codice regalo';

  @override
  String get shCloudRedeem => 'Riscatta';

  @override
  String get shCloudNoWayToBuy =>
      'I piani non possono essere acquistati in questa app. Acquistane uno su casama.ai con lo stesso account, poi controlla di nuovo qui.';

  @override
  String get shCloudPurchasePending =>
      'Il tuo acquisto è in attesa di approvazione. Proseguirà automaticamente appena confermato.';

  @override
  String get shCloudPurchaseFailed =>
      'L’acquisto non è andato a buon fine. Nulla è stato addebitato.';

  @override
  String get shCloudConnecting =>
      'Connessione di questo server a Casama Cloud…';

  @override
  String get shCloudLoading => 'Caricamento…';

  @override
  String get shCloudReviewTitle => 'Controlla prima di attivare';

  @override
  String get shCloudReviewPays => 'Chi paga';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan su $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Utilizzo gratuito di prova su $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Quali bot passano';

  @override
  String get shCloudReviewAll => 'Tutti i bot';

  @override
  String get shCloudReviewNoKey => 'Solo i bot senza una chiave funzionante';

  @override
  String get shCloudReviewPick => 'Scegli i bot';

  @override
  String get shCloudReviewNoBots =>
      'Questo server non ha ancora bot. I nuovi bot potranno usare Casama Cloud.';

  @override
  String get shCloudReviewDefault => 'Anche i nuovi bot usano Casama Cloud';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Modello di Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Nessuna chiave funzionante';

  @override
  String shCloudStepDown(String from) {
    return 'Le risposte potrebbero essere più brevi o meno accurate rispetto a $from. Prova prima con un bot.';
  }

  @override
  String get shCloudReviewJobs => 'Memoria, immagini e voce';

  @override
  String get shCloudJobMemory => 'Ricerca nella memoria';

  @override
  String get shCloudJobImages => 'Immagini';

  @override
  String get shCloudJobTts => 'Lettura ad alta voce';

  @override
  String get shCloudJobStt => 'Dettatura';

  @override
  String get shCloudJobOwnKey => 'La tua chiave';

  @override
  String get shCloudJobMemoryOptIn => 'Usa Casama Cloud anche per la memoria';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'La memoria viene reindicizzata in background; nel frattempo la ricerca continua a funzionare.';

  @override
  String get shCloudJobLiveNote =>
      'Voce in diretta, telefonate e video continuano a usare le tue chiavi.';

  @override
  String get shCloudWhatGoes => 'Cosa passa da Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'I messaggi inviati al modello passano attraverso Casama Cloud e non vengono archiviati. L’utilizzo (modello, token, costo) appare nella tua fattura Cloud. Bot, chat, memoria, file e computer restano su questo server.';

  @override
  String get shCloudWhatGoesLink => 'Cosa invia questo server';

  @override
  String get shCloudFallback =>
      'Se Casama Cloud si esaurisce o non è raggiungibile, usa la mia chiave';

  @override
  String get shCloudFallbackHelp =>
      'Ogni risposta generata con la tua chiave lo indica.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString persone usano questo server e il piano $plan copre $seatsString posti. Ogni persona aggiuntiva viene fatturata al prezzo extra di Casama Cloud.';
  }

  @override
  String get shCloudApply => 'Attiva Casama Cloud';

  @override
  String get shCloudPickOne =>
      'Scegli almeno un bot oppure consenti ai nuovi bot di usarlo.';

  @override
  String get shCloudPolicyTitle => 'Chi può usarlo';

  @override
  String get shCloudPolicyEveryone => 'Tutti su questo server';

  @override
  String get shCloudPolicyChosen => 'Solo persone scelte';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString persone scelte',
      one: '1 persona scelta',
      zero: 'Ancora nessuna persona scelta',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Limite giornaliero per persona';

  @override
  String get shCloudNoLimit => 'Nessun limite';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount al giorno';
  }

  @override
  String get shCloudPolicySaved => 'Salvato';

  @override
  String get shCloudDoneTitle => 'Casama Cloud è attivo';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot ora usano Casama Cloud.',
      one: '1 bot ora usa Casama Cloud.',
      zero: 'I nuovi bot usano Casama Cloud.',
    );
    return '$_temp0 L’utilizzo appare nella schermata Utilizzo di questo server e sulla tua fattura Cloud.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Saluta $bot';
  }

  @override
  String get shCloudDone => 'Fatto';

  @override
  String get shCloudUsageTitle => 'Utilizzo';

  @override
  String shCloudIncludedLeft(String amount) {
    return '$amount di utilizzo incluso rimasto questo mese';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Oggi: $spend su $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Oggi: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount in crediti';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return '$amount di utilizzo gratuito di prova rimasto';
  }

  @override
  String get shCloudPriceNote =>
      'Al prezzo applicato da Casama Cloud. Le stesse chiamate compaiono sulla tua fattura Cloud sotto il nome di questo server.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Tu oggi: $spend su $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud ha usato l’80% dell’utilizzo incluso di questo mese.';

  @override
  String get shCloudWarnDaily =>
      'Casama Cloud ha usato l’80% del limite di oggi.';

  @override
  String get shCloudTopUp => 'Ricarica';

  @override
  String get shCloudUseOwnKey => 'Usa la mia chiave';

  @override
  String get shCloudStopOutOfCredits =>
      'Casama Cloud ha esaurito l’utilizzo per questo mese.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'Il limite di Casama Cloud di oggi è esaurito. Si azzera alle $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'Il limite di Casama Cloud di oggi è esaurito. Si azzera domani.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud richiede un piano su $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'Il piano Casama Cloud su $workspace è terminato.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'Il piano su $workspace non copre tutte le persone che usano Casama Cloud qui.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Hai raggiunto il limite giornaliero di Casama Cloud su questo server.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Il tuo amministratore non ha attivato Casama Cloud per te.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud è stato scollegato da questo server.';

  @override
  String get shCloudStopUnreachable =>
      'Al momento Casama Cloud non è raggiungibile. Nuovo tentativo in corso.';

  @override
  String get shCloudSeePlans => 'Vedi i piani';

  @override
  String get shCloudRenew => 'Rinnova';

  @override
  String get shCloudAskAdmin => 'Chiedi a un amministratore';

  @override
  String get shCloudAskAdminBody =>
      'Solo un amministratore di questo server può modificare Casama Cloud. Chiedi a uno di loro; i bot e le routine riprendono da soli una volta risolto.';

  @override
  String get shCloudReconnect => 'Riconnetti';

  @override
  String get shCloudFallbackActive =>
      'Nel frattempo risponde la tua chiave e ogni risposta lo indica.';

  @override
  String get shCloudUseOwnKeyTitle => 'Usare la tua chiave nel frattempo?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Mentre Casama Cloud non può rispondere, i bot rispondono con la tua chiave e ogni risposta lo indica. Puoi disattivarlo in qualsiasi momento in questa schermata.';

  @override
  String get shCloudAddKeyFirst =>
      'Aggiungi prima una tua chiave nella schermata Modelli.';

  @override
  String get shCloudRoutinesWait =>
      'Le routine attendono e riprendono da sole quando il problema è risolto.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'La memoria si sta riallineando: $doneString di $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'La ricerca usa le parole per i ricordi non ancora reindicizzati.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'I messaggi al modello ora passano da Casama Cloud, pagato da $workspace.';
  }

  @override
  String get shCloudGotIt => 'Ho capito';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Pagato da $workspace';
  }

  @override
  String get shCloudPaidBy => 'Pagato da';

  @override
  String get shCloudChangePayer => 'Cambia';

  @override
  String get shCloudChangeBots => 'Cambia bot';

  @override
  String get shCloudFallbackSection => 'Quando Casama Cloud non può rispondere';

  @override
  String get shCloudTurnOff => 'Disattiva';

  @override
  String get shCloudOffTitle => 'Disattivare Casama Cloud?';

  @override
  String get shCloudOffBody =>
      'Questi bot tornano alla chiave precedente se è ancora valida, altrimenti alla chiave predefinita dello spazio di lavoro. Nient’altro cambia e puoi riattivarlo quando vuoi.';

  @override
  String get shCloudOffBotsNone => 'Nessun bot usa Casama Cloud al momento.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud è disattivo';

  @override
  String shCloudOffBackTo(String key) {
    return 'Tornato a $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Richiede una chiave';

  @override
  String get shCloudAddKey => 'Aggiungi una chiave';

  @override
  String get shCloudSignInAgain =>
      'La tua sessione Casama Cloud è terminata. Accedi di nuovo per continuare.';

  @override
  String get cloudAccountSection => 'Account Casama Cloud';

  @override
  String cloudAccountRow(String email) {
    return 'Connesso come $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Usato per la licenza di questo server e i modelli di Casama Cloud';

  @override
  String get cloudAccountSignOut => 'Esci da Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'Questo dispositivo dimentica il tuo accesso a Casama Cloud. Questo server, la sua licenza e i modelli di Casama Cloud continuano a funzionare.';

  @override
  String get cloudAccountDelete => 'Elimina account Casama Cloud';

  @override
  String get cloudAccountDeleteHelp =>
      'Elimina il tuo account su Casama Cloud. Questo server e i suoi dati restano.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Digita $email per eliminare il tuo account Casama Cloud. Gli spazi di lavoro cloud di cui sei l\'unico proprietario verranno eliminati insieme all\'account e i modelli di Casama Cloud smetteranno di funzionare sui server pagati da quegli spazi. Un piano acquistato sul web viene annullato automaticamente. Un piano acquistato nell\'App Store o su Google Play no: annullalo in quello store.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Il tuo account Casama Cloud è stato eliminato. Data della rimozione definitiva dei suoi dati: $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Sposta su Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Sposta sul mio server';

  @override
  String get wsMoveSettingsHelp =>
      'Porta i bot, le chat, la memoria e i file di questo spazio di lavoro su un altro server';

  @override
  String get wsMoveTitle => 'Sposta questo spazio di lavoro';

  @override
  String get wsMoveIntro =>
      'Viene trasferito tutto: bot, chat, memoria, routine, file e computer. Una volta completato, questa copia resta leggibile ma smette di funzionare.';

  @override
  String get wsMoveCloudOption => 'Sposta su Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Accedi con il tuo account Casama e scegli la destinazione.';

  @override
  String get wsMoveServerOption => 'Sposta sul mio server';

  @override
  String get wsMoveServerOptionHelp =>
      'Su quel server apri Impostazioni › Porta qui uno spazio di lavoro e copia il codice di trasferimento.';

  @override
  String get wsMoveInstallServer => 'Installa Casama Server';

  @override
  String get wsMoveInstallServerHelp =>
      'Non hai ancora un server? Avviane uno su questo computer prima.';

  @override
  String get wsMoveReceiveOption => 'Porta qui uno spazio di lavoro';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Ottieni un codice di trasferimento per questo spazio di lavoro, da usare sul server su cui si trova ora l’altro spazio di lavoro.';

  @override
  String get wsMoveOwnerOnly =>
      'Solo il proprietario dello spazio di lavoro può spostarlo.';

  @override
  String get wsMoveCloudPickTitle => 'Dove dovrebbe andare?';

  @override
  String get wsMoveCloudNew => 'Un nuovo spazio di lavoro';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Parte vuoto su Casama Cloud, chiamato $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Gli elementi spostati si affiancano a ciò che è già lì. I nomi in conflitto ricevono “(moved)”.';

  @override
  String get wsMoveServerTitle => 'Sposta sul tuo server';

  @override
  String get wsMoveServerAddress => 'Indirizzo del server';

  @override
  String get wsMoveServerCode => 'Codice di trasferimento';

  @override
  String get wsMoveCheckButton => 'Verifica';

  @override
  String get wsMoveReceiveTitle => 'Porta qui uno spazio di lavoro';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'Sul server su cui si trova ora lo spazio di lavoro, apri Impostazioni › Sposta sul mio server e inserisci questo indirizzo e questo codice. Il codice funziona una sola volta, fino alle $time, e porta tutto in $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Indirizzo di questo server';

  @override
  String get wsMoveReceiveCode => 'Codice di trasferimento';

  @override
  String get wsMoveCopy => 'Copia';

  @override
  String get wsMoveCopied => 'Copiato';

  @override
  String get wsMoveCheckTitle => 'Pronto per lo spostamento';

  @override
  String wsMoveCheckTo(String name) {
    return 'Verso $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minuti',
      one: '1 minuto',
    );
    return '$size da copiare, circa $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minuti',
      one: '1 minuto',
    );
    return 'Verso la fine, i bot vanno in pausa per circa $_temp0, poi riprendono lì.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'È una pausa lunga. Scegli un momento tranquillo.';

  @override
  String get wsMoveCheckComes => 'Cosa viene trasferito';

  @override
  String wsMoveCountBots(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString bot',
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
      other: '$nString chat',
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
      other: '$nString ricordi',
      one: '1 ricordo',
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
      other: '$nString routine',
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
      other: '$nString file',
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
      other: '$nString computer',
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
      other: '$nString persone',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'Cosa richiede il tuo intervento dopo';

  @override
  String wsMoveReconnect(String names) {
    return 'Accedi di nuovo a queste app lì: $names';
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
      other: '$nString persone riceveranno',
      one: '1 persona riceverà',
    );
    return '$_temp0 un invito via email';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (invitato)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'I piani ChatGPT restano indietro. Accedi di nuovo a ChatGPT lì.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString computer ripartono',
      one: '1 computer riparte',
    );
    return '$_temp0 da zero lì, con la sua cartella home ripristinata.';
  }

  @override
  String get wsMoveResetNote =>
      'Approvazioni, accesso completo e accesso al dispositivo partono dai valori predefiniti del nuovo server.';

  @override
  String get wsMoveBringKeys => 'Porta le mie chiavi';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString chiavi vengono trasferite',
      one: '1 chiave viene trasferita',
    );
    String _temp1 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'sigillate in modo che solo il nuovo server possa leggerle',
      one: 'sigillata in modo che solo il nuovo server possa leggerla',
    );
    return '$_temp0 insieme al resto, $_temp1.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Aggiungerai di nuovo lì le chiavi dei modelli e delle app di chat.';

  @override
  String get wsMoveDoesntFit =>
      'Questo spazio di lavoro supera i limiti del piano lì';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan è adatto. Sceglilo su Casama Cloud, poi controlla di nuovo.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have su $limit';
  }

  @override
  String get wsMoveOverPeople => 'Persone';

  @override
  String get wsMoveOverBots => 'Bot';

  @override
  String get wsMoveOverComputers => 'Computer';

  @override
  String get wsMoveOverStorage => 'Spazio';

  @override
  String get wsMoveUpdateSource =>
      'Aggiorna prima questo server. È più vecchio di quello verso cui stai spostando.';

  @override
  String get wsMoveUpdateTarget =>
      'Il server verso cui stai spostando deve prima essere aggiornato.';

  @override
  String get wsMoveStart => 'Avvia spostamento';

  @override
  String get wsMoveCheckAgain => 'Controlla di nuovo';

  @override
  String get wsMoveProgressTitle => 'Spostamento';

  @override
  String get wsMoveStepStarting => 'Preparazione';

  @override
  String get wsMoveStepCopying =>
      'Copia dei file mentre tutto continua a funzionare';

  @override
  String get wsMoveStepPausing =>
      'Messa in pausa dei bot per copiare le ultime modifiche';

  @override
  String get wsMoveStepFinishing => 'Invio di chat, memoria e impostazioni';

  @override
  String get wsMoveStepImporting => 'Il nuovo server sta importando tutto';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done di $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Puoi chiudere l’app. Lo spostamento prosegue e riceverai una notifica quando sarà completato.';

  @override
  String get wsMoveFailedTitle => 'Spostamento interrotto';

  @override
  String get wsMoveFailedBody =>
      'Nulla è cambiato qui: questo spazio di lavoro continua a funzionare.';

  @override
  String get wsMoveTryAgain => 'Riprova';

  @override
  String get wsMoveNewCodeNeeded =>
      'Per riprovare, ottieni un nuovo codice di trasferimento.';

  @override
  String get wsMoveDoneTitle => 'Spostato';

  @override
  String wsMoveDoneBody(String server) {
    return 'Tutto è arrivato su $server.';
  }

  @override
  String get wsMoveDoneNeeds => 'Alcune cose richiedono il tuo intervento lì:';

  @override
  String get wsMoveOpenThere => 'Aprilo lì';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Accedi di nuovo a $name';
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
      other: '$nString persone sono state invitate',
      one: '1 persona è stata invitata',
    );
    return '$_temp0 via email';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Riconnetti $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Fornisci al mittente di $name il nuovo indirizzo webhook';
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
      other: '$nString giorni',
      one: '1 giorno',
    );
    return 'I webhook ancora inviati qui vengono inoltrati per $_temp0.';
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
      other: '$nString bot',
      one: '1 bot',
    );
    return 'Controlla le approvazioni per $_temp0';
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
      other: '$nString bot',
      one: '1 bot',
    );
    return 'Collega i modelli di Casama Cloud in Impostazioni, o scegli un altro modello, per $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Aggiungi lì le chiavi dei modelli';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString elementi sono stati rinominati',
      one: '1 elemento è stato rinominato',
    );
    return '$_temp0 con “(moved)”';
  }

  @override
  String get wsMoveAfterReindex =>
      'La ricerca nella memoria si riallinea entro pochi minuti.';

  @override
  String get wsMoveAfterNothing => 'Nient’altro da fare.';

  @override
  String get wsMoveSubTitle => 'I tuoi abbonamenti';

  @override
  String get wsMoveSubToCloud =>
      'I bot su Casama Cloud usano il tuo piano Cloud. Se pagavi una licenza Business per questo server, annullala quando non ti serve più.';

  @override
  String get wsMoveSubFromCloud =>
      'Il tuo piano Casama Cloud continua a rinnovarsi. Annullalo quando sul tuo server è tutto a posto.';

  @override
  String get wsMoveSubManage => 'Gestisci piano';

  @override
  String get wsMovedTitle => 'Questo spazio di lavoro è stato spostato';

  @override
  String get wsMovedBodyCloud =>
      'Ora si trova su Casama Cloud. Accedi lì per continuare. Questa copia è di sola lettura.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Ora si trova su $host. Accedi lì per continuare. Questa copia è di sola lettura.';
  }

  @override
  String get wsMovedSignInCloud => 'Accedi a Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Apri $host';
  }

  @override
  String get wsMovedViewOld => 'Vedi la vecchia copia';

  @override
  String get languageDevice => 'Lingua del dispositivo';

  @override
  String get shortcutQuickAsk => 'Domanda rapida';

  @override
  String shortcutAskBot(String name) {
    return 'Chiedi a $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Esegui $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'spazio di lavoro workspace cambia squadra team organizzazione ruolo';

  @override
  String get settingsWordsAboutYou =>
      'profilo nome foto immagine avatar pronomi su di me stile risposte fatti memoria';

  @override
  String get settingsWordsPeople =>
      'membri invita squadra utenti amministratori ruoli link codice invito unisciti iscriviti rimuovi';

  @override
  String get settingsWordsWorkspaceSettings =>
      'spazio di lavoro nome icona logo cifratura memoria pagamenti stripe carta gestori di password bot a bot estensione chrome galleria accesso completo permessi approvazioni chiedi prima';

  @override
  String get settingsWordsSettingsDomains =>
      'dominio sito web personalizzato dns acquista collega siti';

  @override
  String get settingsWordsUsage =>
      'costo spesa soldi crediti token limiti utilizzo';

  @override
  String get settingsWordsBilling =>
      'piano abbonamento aggiorna pro plus max pagamento fattura carta prezzi';

  @override
  String get settingsWordsInviteFriends =>
      'inviti crediti ricompensa condividi referral';

  @override
  String get settingsWordsAdminConsole => 'console amministrazione admin';

  @override
  String get settingsWordsAppearance =>
      'tema modalità scura chiara notte colori font caratteri testo dimensione sfondo aspetto stile temi effetti movimento animazioni aptico tattile vibrazione vibrazioni vibrare feedback trackpad';

  @override
  String get settingsWordsQuietHours =>
      'non disturbare silenzio disattiva notifiche orari';

  @override
  String get settingsWordsPushPrefsTitle =>
      'notifiche push avvisi risposte suoni';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'chiamate telefono squillo schermo intero blocco rispondi';

  @override
  String get settingsWordsEmailTips =>
      'email newsletter consigli novità disiscriviti';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'email galleria selezione mensile riepilogo';

  @override
  String get settingsWordsNewsletterTitle =>
      'email newsletter novità aggiornamenti mensili abbonati disiscriviti';

  @override
  String get settingsWordsWakeWord => 'voce hey vivavoce microfono mic ascolta';

  @override
  String get settingsWordsShowBotSteps =>
      'passaggi strumenti dettagli avanzamento';

  @override
  String get settingsWordsShowReplyUsage =>
      'costo token prezzo utilizzo per risposta';

  @override
  String get settingsWordsCheckForUpdates =>
      'aggiornamento aggiornamenti versione scarica automatico';

  @override
  String get settingsWordsOpenAtLogin =>
      'avvio login accesso automatico accensione';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'attività in tempo reale dynamic island schermata di blocco altri dispositivi';

  @override
  String get settingsWordsShowBotsInNotch =>
      'notch barra dei menu dynamic island';

  @override
  String get settingsWordsNotchOnHover => 'notch passaggio mouse cursore';

  @override
  String get settingsWordsLanguage =>
      'lingua locale italiano inglese traduzione';

  @override
  String get settingsWordsIntegrations =>
      'app collega connessioni gmail google slack calendario plugin strumenti mcp';

  @override
  String get settingsWordsSkills =>
      'competenze catalogo abilità istruzioni skill';

  @override
  String get settingsWordsCasamaLink =>
      'accesso remoto indirizzo tunnel self host telefono';

  @override
  String get settingsWordsServiceKeys => 'chiavi api ricerca mappe dati';

  @override
  String get settingsWordsModelsTitle =>
      'chiavi api openai anthropic openrouter gemini modelli fornitori ollama locali';

  @override
  String get settingsWordsModelKeys =>
      'chiavi api openai anthropic openrouter gemini modelli fornitori ollama locali';

  @override
  String get settingsWordsAccount =>
      'email cambia email password esci ovunque accesso';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa due fattori autenticazione totp otp codice sicurezza';

  @override
  String get settingsWordsPairDevice =>
      'codice qr scansiona accedi associa telefono altro dispositivo';

  @override
  String get settingsWordsPasskeys =>
      'passkey face id touch id impronta digitale biometria';

  @override
  String get settingsWordsWidgetsTitle =>
      'widget schermata home schermata di blocco controlli centro di controllo fissa scorciatoia';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'schede meteo unità celsius fahrenheit città valuta borsa rosso verde fonti dati';

  @override
  String get settingsWordsAppLock =>
      'blocco app pin codice face id touch id impronta biometria windows hello screenshot privacy';

  @override
  String get settingsWordsPrivacy =>
      'esporta dati scarica elimina account analisi tracciamento cronologia conservazione blocca persone';

  @override
  String get settingsWordsSecrets =>
      'segreti password credenziali vault variabili ambiente';

  @override
  String get settingsWordsComputers =>
      'computer macchine docker sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      'dispositivi posizione salute luoghi cartelle app browser estensione chrome telefono permessi';

  @override
  String get settingsWordsUseThisComputer =>
      'companion questo computer mac file locali';

  @override
  String get settingsWordsHelpAndSupport =>
      'aiuto assistenza contatta ticket segnalazione bug feedback guide community github discord bacheca idee stato';

  @override
  String get settingsWordsSignOut => 'esci disconnetti logout';

  @override
  String get notifDoIt => 'Fallo';

  @override
  String get notifNotNow => 'Non ora';

  @override
  String get notifAllow => 'Consenti';

  @override
  String get notifDeny => 'Nega';

  @override
  String get notifApprove => 'Approva';

  @override
  String get notifReview => 'Esamina';

  @override
  String get notifReply => 'Rispondi';

  @override
  String get notifSend => 'Invia';

  @override
  String get notifReplyPlaceholder => 'Rispondi…';

  @override
  String get notifChannelReplies => 'Risposte';

  @override
  String get notifChannelRepliesDescription =>
      'Un bot ha risposto a una tua domanda';

  @override
  String get notifChannelNeedsYou => 'In attesa';

  @override
  String get notifChannelNeedsYouDescription =>
      'Approvazioni, password e passaggi di controllo attesi dai tuoi bot';

  @override
  String get notifChannelRoutines => 'Routine e riepiloghi';

  @override
  String get notifChannelRoutinesDescription =>
      'Risultati delle routine e il riepilogo mattutino';

  @override
  String get notifChannelSuggestions => 'Suggerimenti';

  @override
  String get notifChannelSuggestionsDescription =>
      'Cose che i tuoi bot si offrono di fare per te';

  @override
  String get notifChannelAccount => 'Account';

  @override
  String get notifChannelAccountDescription =>
      'Crediti, progetti e il tuo server';

  @override
  String get notifCallChannel => 'Chiamate';

  @override
  String get notifCallLive => 'In chiamata';

  @override
  String get notifCallMuted => 'Audio disattivato';

  @override
  String get notifCallReconnecting => 'Riconnessione';

  @override
  String get notifCallMute => 'Disattiva audio';

  @override
  String get notifCallUnmute => 'Riattiva audio';

  @override
  String get notifCallEnd => 'Termina chiamata';

  @override
  String get notifFromYourWatch => 'Dal tuo orologio';

  @override
  String get notifLiveOpen => 'Apri';

  @override
  String get notifLiveStop => 'Ferma';

  @override
  String get notifLiveReview => 'Esamina';

  @override
  String get notifLiveAllow => 'Consenti';

  @override
  String get notifLiveDeny => 'Nega';

  @override
  String get notifLiveNeedsOk => 'Richiede il tuo OK';

  @override
  String get notifLiveNeedsYou => 'In attesa';

  @override
  String get notifLiveWorking => 'Al lavoro';

  @override
  String get notifLiveTakeOver => 'Vuole che tu prenda il controllo';

  @override
  String get notifLiveFinished => 'Completato';

  @override
  String get notifLiveProblem => 'Fermato per un problema';

  @override
  String get notifLiveBotWorking => 'Un bot sta lavorando';

  @override
  String get notifLiveBotsAtWork => 'Bot al lavoro';

  @override
  String get notifLiveStepOne => '1 passaggio';

  @override
  String notifLiveSteps(int count) {
    return '$count passaggi';
  }

  @override
  String get notifAlarmTitle => 'Sveglia Casama';

  @override
  String get notifAlarmStop => 'Ferma';

  @override
  String get widgetIosNeedsYouDescription =>
      'Vedi quali bot ti aspettano e rispondi alle richieste semplici.';

  @override
  String get widgetIosBotDescription =>
      'Tieni d’occhio cosa sta facendo uno dei tuoi bot.';

  @override
  String get widgetIosAskDescription =>
      'Chiedi a un bot o avvia una chiamata con un tocco, con idee da provare.';

  @override
  String get widgetIosRoutinesDescription =>
      'Vedi cosa parte dopo ed esegui subito una routine.';

  @override
  String get widgetIosTodayDescription =>
      'La tua giornata a colpo d’occhio: cosa richiede il tuo intervento, cosa è in programma e i tuoi crediti.';

  @override
  String get widgetIosBriefDescription =>
      'Leggi ciò che il tuo bot ti ha riferito stamattina.';

  @override
  String get widgetIosLibraryDescription =>
      'Apri ciò che i tuoi bot hanno creato di recente.';

  @override
  String get widgetIosTasksDescription =>
      'Vedi a che punto è la bacheca, con ciò che ti aspetta per primo.';

  @override
  String get widgetIosCreditsDescription =>
      'Controlla quanti dei tuoi crediti hai utilizzato.';

  @override
  String get widgetIosInlineDescription =>
      'Vedi la cosa più importante, sopra l’orologio.';

  @override
  String get widgetIosCanvasDescription =>
      'Mostra ciò che i tuoi bot mettono qui: una frase, un conto alla rovescia, una serie, un elenco o un’immagine.';

  @override
  String get widgetMacNeedsYouDescription =>
      'Vedi quali bot ti stanno aspettando.';

  @override
  String get widgetMacRoutinesDescription => 'Vedi cosa parte dopo.';

  @override
  String get widgetAskCasama => 'Chiedi a Casama';

  @override
  String get widgetControlAskDescription =>
      'Apri Domanda rapida con la tastiera pronta.';

  @override
  String get widgetTalkToBot => 'Parla con un bot';

  @override
  String widgetTalkToName(String name) {
    return 'Parla con $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Avvia una chiamata vocale con il bot che scegli.';

  @override
  String get widgetRunRoutine => 'Esegui una routine';

  @override
  String get widgetControlRunDescription =>
      'Esegue la routine che scegli, senza aprire Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Chiedi qualsiasi cosa a $bot';
  }

  @override
  String get widgetFallbackBrief => 'Riepilogo mattutino';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot ha completato $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'Alle $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Nulla in arrivo';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot vuole che tu prenda il controllo';
  }

  @override
  String get widgetFallbackDay => 'giorno';

  @override
  String get widgetFallbackDays => 'giorni';

  @override
  String get widgetSampleVerse => 'Fermatevi e riconoscete che io sono Dio.';

  @override
  String get widgetSampleVerseRef => 'Sal 46:10';

  @override
  String get widgetSampleVerseShort =>
      'Fermatevi e riconoscete che io sono Dio. · Sal 46:10';

  @override
  String get widgetSampleVerseTiny => 'Fermatevi e riconoscete…';

  @override
  String get widgetSampleCanvasName => 'Frase del giorno';

  @override
  String get widgetSampleNeedFlights => 'Cerca voli per Lisbona';

  @override
  String get widgetSampleNeedDentist => 'Spostare il dentista a venerdì?';

  @override
  String get widgetSampleBotText =>
      'Tre email attendono risposta e la fattura Acme è scaduta da due giorni.';

  @override
  String get widgetSampleStep => 'Lettura della posta';

  @override
  String get widgetSampleRoutineInbox => 'Riordino posta';

  @override
  String get widgetSampleRoutineBrief => 'Riepilogo mattutino';

  @override
  String get widgetSampleRoutineWeekly => 'Report settimanale';

  @override
  String get widgetSampleWeekdays => 'Giorni feriali';

  @override
  String get widgetSampleEveryDay => 'Ogni giorno';

  @override
  String get widgetSampleFridays => 'Venerdì alle 16:00';

  @override
  String get widgetSampleBrief =>
      'Tre email attendono risposta e la fattura Acme è scaduta da due giorni. Pioggia dalle 15:00, quindi esci presto per il ritiro delle 16:30. La prima riunione è alle 10:00 con Dana.';

  @override
  String get widgetSamplePricing => 'Pagina prezzi T4';

  @override
  String get widgetSampleLogoIdeas => 'Idee per il logo';

  @override
  String get widgetSampleTripPlan => 'Piano di viaggio';

  @override
  String get widgetSampleLaunchPost => 'Prepara il post di lancio';

  @override
  String get widgetSampleStarterInbox => 'Riassumi la mia posta';

  @override
  String get widgetSampleStarterFriday => 'Pianifica il mio venerdì';

  @override
  String get widgetSampleWorking => 'Al lavoro · 2:14';

  @override
  String get widgetSampleCreditsLeft => '5,70 US\$ rimasti';

  @override
  String get widgetSampleSpentToday => '0,80 US\$ oggi';

  @override
  String get widgetSampleMorning =>
      'Buongiorno. Due riunioni oggi, la prima alle 10:00 con il team di design. Pioggia dopo le 15, prendi il cappotto. Il tuo volo per Lisbona è confermato per venerdì.';

  @override
  String get widgetSampleLisbonPlan => 'Piano viaggio a Lisbona';

  @override
  String get widgetSampleAgo => 'Milo · 2 h fa';

  @override
  String get widgetSampleLaunchEmail => 'Scrivi l’email di lancio';

  @override
  String get widgetSampleInReviewBy => 'In revisione · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo vuole cercare i prezzi dei voli per Lisbona';

  @override
  String get widgetSampleUpNextAt => 'In arrivo · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · tra 18 min';

  @override
  String get widgetSampleDate => 'Mercoledì 18 novembre';

  @override
  String get widgetSampleNeedsCount => 'In attesa · 1';

  @override
  String get widgetSampleSearchFlights => 'Cerca prezzi voli per Lisbona';

  @override
  String get widgetSampleAskAda => 'Chiedi ad Ada';

  @override
  String get widgetSampleAskMilo => 'Chiedi a Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Pianifica la mia giornata';

  @override
  String get widgetSampleWhatsNew => '✉️ Novità nella mia posta?';

  @override
  String get widgetAndroidBotDescription =>
      'Segui cosa sta facendo un bot in questo momento';

  @override
  String get widgetAndroidTodayDescription =>
      'Tieni tutta la tua giornata con i bot in un solo posto';

  @override
  String get widgetAndroidBriefDescription =>
      'Leggi il tuo riepilogo mattutino a colpo d’occhio';

  @override
  String get widgetAndroidLibraryDescription =>
      'Apri ciò che i tuoi bot hanno creato di recente';

  @override
  String get widgetAndroidTasksDescription =>
      'Segui a che punto è la tua bacheca attività';

  @override
  String get widgetAndroidCreditsDescription =>
      'Controlla quanto hai utilizzato';

  @override
  String get widgetAndroidCanvasDescription =>
      'Mostra ciò che mettono qui i tuoi bot, da una frase a un conto alla rovescia';

  @override
  String get widgetConfigBotTitle => 'Scegli un bot';

  @override
  String get widgetConfigRoutinesTitle => 'Scegli routine';

  @override
  String get widgetConfigRoutinesHint =>
      'Scegline fino a quattro per quelle che avvii manualmente';

  @override
  String get widgetConfigAutomatic => 'Automatico';

  @override
  String get widgetConfigAutomaticHint =>
      'Le prossime esecuzioni, tra tutti i tuoi bot';

  @override
  String get widgetConfigDone => 'Fatto';

  @override
  String get widgetConfigSignedOutTitle => 'Ancora nulla da scegliere';

  @override
  String get widgetConfigSignedOut => 'Apri Casama e accedi, poi scegli qui.';

  @override
  String get widgetConfigCanvasTitle => 'Scegli una lavagna';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'Quella impostata più di recente da un bot';

  @override
  String get widgetConfigCanvasNone =>
      'Ancora nessuna lavagna. Chiedi a un bot di mettere qualcosa qui.';

  @override
  String get iosUsageTracking =>
      'Se lo consenti, Casama comunica a Meta quando installi l’app, ti iscrivi o ti abboni dopo aver visto un annuncio di Casama su Facebook o Instagram, così possiamo misurare quali annunci funzionano. Casama non mostra mai annunci e non condivide mai le tue chat o i tuoi file.';

  @override
  String get iosUsageContacts =>
      'I tuoi bot possono cercare le persone che conosci, solo quando attivi Contatti in Connessioni del dispositivo.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama apre la tua libreria foto quando scegli una foto da inviare a un bot o per il tuo profilo.';

  @override
  String get iosUsageLocationAlways =>
      'Avvisa i tuoi bot quando arrivi nei tuoi luoghi salvati o li lasci, anche quando Casama è chiuso. Vengono condivisi solo il nome del luogo e l’orario, mai il tuo percorso.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Salva i luoghi a cui dai un nome, come Casa o Lavoro, e lascia che i tuoi bot ti ricordino quando partire per il tuo prossimo appuntamento. Utilizzato solo se attivi Luoghi in Connessioni del dispositivo.';

  @override
  String get iosUsageCamera =>
      'Casama usa la fotocamera quando scatti una foto da inviare a un bot o per il tuo profilo.';

  @override
  String get iosUsageCalendars =>
      'I tuoi bot possono rispondere a domande sui tuoi impegni e aggiungere eventi, solo quando attivi Calendario in Connessioni del dispositivo.';

  @override
  String get iosUsageSpeech =>
      'Quando il servizio di dettatura di Casama non è raggiungibile, il riconoscimento vocale del tuo dispositivo trasforma ciò che dici in testo.';

  @override
  String get iosUsageAlarmKit =>
      'I tuoi bot possono impostare sveglie e timer che suonano anche in modalità silenziosa, solo quando consenti Sveglie in Connessioni del dispositivo.';

  @override
  String get iosUsageHomeKit =>
      'I tuoi bot possono verificare e comandare la tua casa HomeKit quando consenti Casa in Connessioni del dispositivo; le modifiche richiedono sempre prima la tua approvazione.';

  @override
  String get iosUsageMicrophone =>
      'Casama usa il microfono per la dettatura e le chiamate dal vivo con i tuoi bot. Solo dopo il tuo consenso, la tua voce viene inviata a fornitori IA per risponderti: Google Gemini per le chiamate, OpenAI per trasformare la dettatura in testo.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama legge soltanto i dati di Apple Salute; non vi scrive mai.';

  @override
  String get iosUsageFaceId =>
      'Casama usa Face ID per sbloccare l’app quando attivi il blocco app e per confermare le azioni rischiose.';

  @override
  String get iosUsageHealthShare =>
      'I tuoi bot possono vedere riepiloghi giornalieri di sonno, attività, allenamenti e battito da Apple Salute, solo quando attivi Apple Salute in Connessioni del dispositivo. Casama non scrive mai su Apple Salute e non lo usa mai per la pubblicità.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama registra la tua voce quando chiedi qualcosa a un bot e la invia al tuo server Casama, dove un fornitore IA (OpenAI, su Casama Cloud) la trasforma in testo per il tuo bot.';

  @override
  String get macUsageContacts =>
      'I tuoi bot possono cercare le persone che conosci, solo quando attivi Contatti in Connessioni del dispositivo.';

  @override
  String get macUsageSpeech =>
      'Quando il servizio di dettatura di Casama non è raggiungibile, il riconoscimento vocale del tuo dispositivo trasforma ciò che dici in testo.';

  @override
  String get macUsageMicrophone =>
      'Casama usa il microfono per la dettatura e le chiamate dal vivo con i tuoi bot. Solo dopo il tuo consenso, la tua voce viene inviata a fornitori IA per risponderti: Google Gemini per le chiamate, OpenAI per trasformare la dettatura in testo.';

  @override
  String get macUsageAppleEvents =>
      'Domanda rapida legge il titolo della finestra in primo piano e la scheda corrente del browser, solo quando premi la scorciatoia.';

  @override
  String get nativeNameFileProvider => 'Computer Casama';

  @override
  String get nativeNameNotifications => 'Notifiche Casama';

  @override
  String get nativeNameSafari => 'Casama per Safari';

  @override
  String get nativeNameAskCasama => 'Chiedi a Casama';

  @override
  String get nativeComputer => 'Computer';

  @override
  String get nativeSafariSignInIos =>
      'Apri Casama su questo dispositivo -> Impostazioni -> Accedi su un altro dispositivo, oppure incolla qui sotto un link di accesso.';

  @override
  String get nativeSafariSignInMac =>
      'Apri Casama su questo Mac -> Impostazioni -> Accedi su un altro dispositivo, oppure incolla qui sotto un link di accesso.';

  @override
  String get linuxDesktopComment =>
      'Bot che fanno il lavoro, su ogni schermo che possiedi';

  @override
  String get linuxDesktopKeywords => 'IA;assistente;agente;bot;chat;';

  @override
  String macMenuAbout(String appName) {
    return 'Informazioni su $appName';
  }

  @override
  String get macMenuPreferences => 'Preferenze…';

  @override
  String get macMenuServices => 'Servizi';

  @override
  String macMenuHide(String appName) {
    return 'Nascondi $appName';
  }

  @override
  String get macMenuHideOthers => 'Nascondi altre';

  @override
  String get macMenuShowAll => 'Mostra tutte';

  @override
  String macMenuQuit(String appName) {
    return 'Esci da $appName';
  }

  @override
  String get macMenuEdit => 'Modifica';

  @override
  String get macMenuUndo => 'Annulla';

  @override
  String get macMenuRedo => 'Ripristina';

  @override
  String get macMenuCut => 'Taglia';

  @override
  String get macMenuCopy => 'Copia';

  @override
  String get macMenuPaste => 'Incolla';

  @override
  String get macMenuPasteAndMatchStyle => 'Incolla e adegua lo stile';

  @override
  String get macMenuDelete => 'Elimina';

  @override
  String get macMenuSelectAll => 'Seleziona tutto';

  @override
  String get macMenuFind => 'Trova';

  @override
  String get macMenuFindEllipsis => 'Trova…';

  @override
  String get macMenuFindAndReplace => 'Trova e sostituisci…';

  @override
  String get macMenuFindNext => 'Trova successivo';

  @override
  String get macMenuFindPrevious => 'Trova precedente';

  @override
  String get macMenuUseSelectionForFind => 'Usa selezione per trovare';

  @override
  String get macMenuJumpToSelection => 'Vai alla selezione';

  @override
  String get macMenuSpellingAndGrammar => 'Ortografia e grammatica';

  @override
  String get macMenuSpelling => 'Ortografia';

  @override
  String get macMenuShowSpelling => 'Mostra ortografia e grammatica';

  @override
  String get macMenuCheckDocumentNow => 'Controlla il documento adesso';

  @override
  String get macMenuCheckSpellingWhileTyping =>
      'Controlla ortografia mentre scrivo';

  @override
  String get macMenuCheckGrammar => 'Controlla grammatica e ortografia';

  @override
  String get macMenuCorrectSpelling => 'Correggi automaticamente ortografia';

  @override
  String get macMenuSubstitutions => 'Sostituzioni';

  @override
  String get macMenuShowSubstitutions => 'Mostra sostituzioni';

  @override
  String get macMenuSmartCopyPaste => 'Copia/incolla smart';

  @override
  String get macMenuSmartQuotes => 'Virgolette smart';

  @override
  String get macMenuSmartDashes => 'Trattini smart';

  @override
  String get macMenuSmartLinks => 'Link smart';

  @override
  String get macMenuDataDetectors => 'Rilevatori di dati';

  @override
  String get macMenuTextReplacement => 'Sostituzione testo';

  @override
  String get macMenuTransformations => 'Trasformazioni';

  @override
  String get macMenuMakeUpperCase => 'Scrivi in lettere maiuscole';

  @override
  String get macMenuMakeLowerCase => 'Scrivi in lettere minuscole';

  @override
  String get macMenuCapitalize => 'Iniziali maiuscole';

  @override
  String get macMenuSpeech => 'Voce';

  @override
  String get macMenuStartSpeaking => 'Inizia riproduzione';

  @override
  String get macMenuStopSpeaking => 'Interrompi riproduzione';

  @override
  String get macMenuView => 'Vista';

  @override
  String get macMenuEnterFullScreen => 'Attiva modalità a tutto schermo';

  @override
  String get macMenuWindow => 'Finestra';

  @override
  String get macMenuMinimize => 'Contrai';

  @override
  String get macMenuZoom => 'Ridimensiona';

  @override
  String get macMenuBringAllToFront => 'Porta tutto in primo piano';

  @override
  String get macMenuHelp => 'Aiuto';

  @override
  String get macMenuCheckForUpdates => 'Verifica aggiornamenti…';

  @override
  String get macMenuSettings => 'Impostazioni…';

  @override
  String get macMenuFile => 'File';

  @override
  String get macMenuNewChat => 'Nuova chat';

  @override
  String get macMenuNewBot => 'Nuovo bot…';

  @override
  String get macMenuQuickAsk => 'Domanda rapida';

  @override
  String get macMenuSearch => 'Cerca…';

  @override
  String get macMenuCloseWindow => 'Chiudi finestra';

  @override
  String get macMenuGo => 'Vai';

  @override
  String get macMenuBots => 'Bot';

  @override
  String get macMenuInbox => 'In arrivo';

  @override
  String get macMenuBoard => 'Bacheca';

  @override
  String get macMenuComputer => 'Computer';

  @override
  String get macMenuPages => 'Pagine';

  @override
  String get macMenuCasamaHelp => 'Aiuto di Casama';

  @override
  String get macMenuSendFeedback => 'Invia feedback…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Routine';

  @override
  String get siriRoutines => 'Routine';

  @override
  String get siriCanvas => 'Lavagna';

  @override
  String get siriAutomatic => 'Automatico';

  @override
  String get siriAutomaticSubtitle =>
      'Ciò che un bot ha impostato più di recente';

  @override
  String get siriChooseCanvas => 'Scegli una lavagna';

  @override
  String get siriChooseCanvasDescription =>
      'Mostra ciò che un bot ha impostato più di recente oppure una lavagna.';

  @override
  String get siriChooseBot => 'Scegli un bot';

  @override
  String get siriChooseBotDescription =>
      'Scegli il bot mostrato da questo widget.';

  @override
  String get siriChooseRoutines => 'Scegli routine';

  @override
  String get siriChooseRoutinesDescription =>
      'Mostra le prossime esecuzioni o fino a quattro routine a tua scelta.';

  @override
  String get siriOpenCasama => 'Apri Casama';

  @override
  String get siriWhere => 'Dove';

  @override
  String get siriTalkToBot => 'Parla con un bot';

  @override
  String get siriTalkToBotDescription =>
      'Avvia una chiamata vocale con il bot che scegli.';

  @override
  String get siriRunRoutine => 'Esegui una routine';

  @override
  String get siriRunRoutineControlDescription =>
      'Esegue la routine che scegli, senza aprire Casama.';

  @override
  String get siriCallAction => 'Azione chiamata';

  @override
  String get siriAction => 'Azione';

  @override
  String get siriStopBot => 'Ferma il bot';

  @override
  String get siriRun => 'Esecuzione';

  @override
  String get siriAnswerRequest => 'Rispondi alla richiesta di un bot';

  @override
  String get siriRequest => 'Richiesta';

  @override
  String get siriAllow => 'Consenti';

  @override
  String get siriFromWidget => 'Da un widget';

  @override
  String get siriRunRoutineNow => 'Esegui subito una routine';

  @override
  String get siriAcceptSuggestion => 'Fai ciò che suggerisce un bot';

  @override
  String get siriSuggestion => 'Suggerimento';

  @override
  String get siriBotStatusDescription => 'Stato di un bot e cosa sta facendo';

  @override
  String get siriNextRoutineDescription => 'La prossima routine e quando parte';

  @override
  String get siriAskCasama => 'Chiedi a Casama';

  @override
  String get siriAskVoiceDescription => 'Chiedi qualcosa a un bot a voce';

  @override
  String get siriWhatWaiting => 'Cosa attende il tuo OK';

  @override
  String get siriAsk => 'Chiedi';

  @override
  String get siriShortNeedsYou => 'In attesa';

  @override
  String get siriOpeningToFinish => 'Apro Casama per completare.';

  @override
  String get siriName => 'Nome';

  @override
  String get siriTitle => 'Titolo';

  @override
  String get siriChat => 'Chat';

  @override
  String get siriBotSubtitle =>
      'Un bot in Casama, un assistente IA con cui chatti';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Una routine eseguita da $bot in Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Una chat con $bot in Casama';
  }

  @override
  String get siriBotInCasama => 'Bot in Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Routine · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Chat con $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'routine';

  @override
  String get siriKeywordChat => 'chat';

  @override
  String get siriAskBot => 'Chiedi a un bot';

  @override
  String get siriAskBotDescription =>
      'Invia una domanda a uno dei tuoi bot Casama (assistenti IA) in una nuova chat e legge la risposta. Se non nomini alcun bot, risponde quello con cui hai parlato per ultimo.';

  @override
  String get siriCategoryBots => 'Bot';

  @override
  String get siriAskBotParamDescription =>
      'A quale bot chiedere. Lascia vuoto per il bot con cui hai parlato per ultimo.';

  @override
  String get siriQuestion => 'Domanda';

  @override
  String get siriQuestionDescription => 'Cosa chiedere al bot, a parole tue.';

  @override
  String get siriWhatShouldIAsk => 'Cosa devo chiedere?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Chiedi $question a $bot';
  }

  @override
  String get siriRestOnScreen => 'Il resto è sullo schermo.';

  @override
  String get siriRestOnScreenEllipsis => '… Il resto è sullo schermo.';

  @override
  String get siriRunRoutineDescription =>
      'Esegue subito una delle routine dei tuoi bot Casama. Il risultato arriva nell’app e come notifica, come quando la routine parte da sola.';

  @override
  String get siriRoutineParamDescription => 'Quale routine eseguire ora.';

  @override
  String siriSummaryRun(String routine) {
    return 'Esegui $routine';
  }

  @override
  String get siriWhatNeedsMe => 'Cosa è in attesa';

  @override
  String get siriWhatNeedsMeDescription =>
      'Dice quante cose in Casama ti stanno aspettando: una richiesta di conferma di un bot, un passaggio di controllo o un suggerimento. Rispondi nell’app.';

  @override
  String get siriOpenBot => 'Apri un bot';

  @override
  String get siriOpenBotDescription =>
      'Apre la tua chat con uno dei tuoi bot Casama.';

  @override
  String get siriOpenBotPersonDescription => 'Apre la chat di un bot Casama.';

  @override
  String get siriOpenChat => 'Apri una chat';

  @override
  String get siriOpenChatDescription =>
      'Apre una delle tue chat con un bot Casama.';

  @override
  String get siriOpenRoutine => 'Apri il bot di una routine';

  @override
  String get siriOpenRoutineDescription =>
      'Apre il bot che esegue una delle tue routine Casama.';

  @override
  String get siriTalkDescription =>
      'Apre la modalità vocale con uno dei tuoi bot Casama. Disponibile sul tasto Azione.';

  @override
  String get siriAskGetReply => 'Chiedi a un bot e ottieni la risposta';

  @override
  String get siriAskGetReplyDescription =>
      'Invia una domanda a un bot Casama e restituisce il testo della risposta da usare in Comandi Rapidi.';

  @override
  String get siriGetLastReply => 'Ottieni l’ultima risposta';

  @override
  String get siriGetLastReplyDescription =>
      'Restituisce il testo dell’ultima risposta da una chat di un bot Casama.';

  @override
  String get siriStartComputer => 'Avvia un computer';

  @override
  String get siriStartComputerDescription =>
      'Riattiva un computer Casama previa conferma.';

  @override
  String get siriComputerName => 'Nome del computer';

  @override
  String get siriYourComputer => 'il tuo computer Casama';

  @override
  String siriStartConfirm(String computer) {
    return 'Avviare $computer?';
  }

  @override
  String get siriOpenToStartComputer => 'Apri Casama per avviare il computer.';

  @override
  String get siriFocusTitle => 'Imposta filtro Full immersion Casama';

  @override
  String get siriFocusDescription =>
      'Mostra solo i bot scelti e, se vuoi, trattieni gli aggiornamenti proattivi mentre Full immersion è attivo.';

  @override
  String get siriFocusBots => 'Bot da mostrare';

  @override
  String get siriFocusHold => 'Trattieni aggiornamenti proattivi';

  @override
  String get siriFocusShowOne => 'Mostra 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Mostra $count bot';
  }

  @override
  String get siriFocusHoldCheckIns => 'Trattieni aggiornamenti';

  @override
  String get siriFocusAllowCheckIns => 'Consenti aggiornamenti';

  @override
  String get siriFocusAllBots => 'Tutti i bot';

  @override
  String get siriFocusAllVisible => 'Tutti i bot visibili';

  @override
  String get siriToolAsk => 'Chiedi a un bot Casama';

  @override
  String get siriToolAskDescription =>
      'Fa una domanda a uno dei bot Casama dell’utente e ne restituisce la risposta.';

  @override
  String get siriCategoryAssistants => 'Assistenti';

  @override
  String get siriToolBotDescription => 'A quale bot Casama chiedere.';

  @override
  String get siriToolQuestionDescription => 'Cosa chiedere al bot.';

  @override
  String get siriToolRun => 'Esegui una routine Casama';

  @override
  String get siriToolRunDescription =>
      'Esegue una routine Casama salvata previa conferma dell’utente.';

  @override
  String get siriCategoryAutomation => 'Automazione';

  @override
  String get siriToolRoutineDescription => 'La routine da eseguire.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return 'Eseguire $routine con $bot?';
  }

  @override
  String get siriToolNeeds => 'Cosa è in attesa in Casama';

  @override
  String get siriToolNeedsDescription =>
      'Controlla quante approvazioni, passaggi di controllo o suggerimenti attendono in Casama.';

  @override
  String get siriOpenToCheck => 'Apri Casama per vedere cosa ti aspetta.';

  @override
  String get siriToolStop => 'Ferma un bot Casama';

  @override
  String get siriToolStopDescription =>
      'Ferma un bot che sta eseguendo un’attività in Casama.';

  @override
  String get siriToolStopBotDescription => 'Il bot da fermare.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot fermato.';
  }

  @override
  String get siriToolCall => 'Chiama un bot Casama';

  @override
  String get siriToolCallDescription =>
      'Apre Casama e avvia una chiamata vocale in diretta con il bot scelto.';

  @override
  String get siriCategoryCommunication => 'Comunicazione';

  @override
  String get siriToolCallBotDescription => 'Il bot da chiamare.';

  @override
  String siriCalling(String bot) {
    return 'Chiamata a $bot in corso.';
  }

  @override
  String siriBotIn(String app) {
    return 'Un bot in $app';
  }

  @override
  String get siriMe => 'Io';

  @override
  String get siriABot => 'un bot';

  @override
  String get siriFavorited => 'Nei preferiti';

  @override
  String siriSentTo(String bot) {
    return 'Inviato a $bot';
  }

  @override
  String get siriMessage => 'Messaggio';

  @override
  String get siriNone => 'Nessuno';

  @override
  String get siriErrorOneBot => 'Casama invia a un bot alla volta. Quale bot?';

  @override
  String get siriErrorTextOnly =>
      'Siri può inviare parole a un bot. Aggiungi file, immagini e luoghi in Casama.';

  @override
  String get siriErrorNoBot => 'Non ho trovato quel bot in Casama.';

  @override
  String get siriWhatShouldISend => 'Cosa devo inviare?';

  @override
  String get siriAskCasamaBot => 'Chiedi a un bot Casama';

  @override
  String siriAskName(String bot) {
    return 'Chiedi a $bot';
  }

  @override
  String get siriAskAboutThis => 'Chiedi a Casama riguardo a questo';

  @override
  String siriPhraseAsk(String app) {
    return 'Chiedi a $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Chiedi a un bot su $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Chiedi a $bot su $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Parla con un bot su $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Parla con $bot su $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Esegui una routine su $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Esegui $routine su $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'Cosa è in attesa su $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'Cosa aspetta su $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Chiedi qualcosa a $app';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Esegui la mia routine $routine su $app';
  }

  @override
  String get siriABotSubject => 'Un bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot ha bisogno del tuo OK.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot vuole che tu prenda il controllo.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot ha un suggerimento.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot ha bisogno di te.';
  }

  @override
  String get siriOneThingNeedsYou => 'Una cosa ti sta aspettando.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count cose ti stanno aspettando.';
  }

  @override
  String get siriUnlockPhone => 'Sblocca il telefono e riprova.';

  @override
  String get siriGeminiOff =>
      'Gemini è disattivato per Casama su questo telefono (Casama → Impostazioni → Privacy).';

  @override
  String get suggestionActionTurnOn => 'Attiva';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Ricordamelo $date';
  }

  @override
  String get suggestionActionPickTime => 'Scegli un orario';

  @override
  String get suggestionActionPutAwayAll => 'Accantona tutto';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Accantona tutte le $count idee',
      one: 'Accantona 1 idea',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Apri';

  @override
  String get suggestionActionGotIt => 'Ho capito';

  @override
  String get suggestionActionLater => 'Più tardi';

  @override
  String get suggestionActionSomethingElse => 'Altro';

  @override
  String get suggestionTurnedOn => 'Attivato';

  @override
  String suggestionReminderSet(String date) {
    return 'Promemoria impostato: $date';
  }

  @override
  String get suggestionSnoozed => 'Salvato per dopo';

  @override
  String get suggestionSnoozedExpired => 'Accantonato – rimandato due volte';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count idee accantonate',
      one: '1 idea accantonata',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Annulla';

  @override
  String get suggestionLaterTomorrow => 'Domani mattina';

  @override
  String get suggestionLaterEvening => 'Stasera';

  @override
  String get suggestionLaterNextWeek => 'La prossima settimana';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Altre $count idee in attesa',
      one: '1 altra idea in attesa',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count idee',
      one: '$name · 1 idea',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count risultati di routine oggi',
      one: '$name · 1 risultato di routine oggi',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count aggiornamenti oggi',
      one: '$name · 1 aggiornamento oggi',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count risultati di routine oggi',
      one: '1 risultato di routine oggi',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aggiornamenti oggi',
      one: '1 aggiornamento oggi',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Da ieri: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '1 pagina',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count risultati di routine',
      one: '1 risultato di routine',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aggiornamenti',
      one: '1 aggiornamento',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Attiva';

  @override
  String get notifOpen => 'Apri';

  @override
  String get notifGotIt => 'Ho capito';

  @override
  String get notifRemindMe => 'Ricordamelo';

  @override
  String get notifLater => 'Più tardi';

  @override
  String get watchTurnOn => 'Attiva';

  @override
  String get watchGotIt => 'Ho capito';

  @override
  String get watchRemindMe => 'Ricorda';

  @override
  String get watchLater => 'Più tardi';

  @override
  String get watchOpen => 'Apri';

  @override
  String get costModeLabel => 'Vista costi';

  @override
  String get costModePaid => 'Pagato';

  @override
  String get costModeEstimated => 'Stimato';

  @override
  String get costPaid => 'Pagato';

  @override
  String get costEstimatedTitle => 'Stimato';

  @override
  String get costMarginListPrices => 'Margine a prezzi di listino';

  @override
  String get costFreePlan => 'Piano gratuito';

  @override
  String costFreePlanCalls(String count) {
    return 'Piano gratuito · $count chiamate';
  }

  @override
  String costCapUsage(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String get costShareOfOwnServers => 'Quota dei propri server';

  @override
  String costIncludedCredit(String amount) {
    return '$amount/mese inclusi';
  }

  @override
  String costAtListPrices(String amount) {
    return '$amount a prezzi di listino';
  }

  @override
  String costEmptyPaidDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nulla è stato pagato in questi $days giorni',
      one: 'Nulla è stato pagato in questo giorno',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyPaidRange => 'Nulla è stato pagato in questi giorni';

  @override
  String get costEmptyPaidFiltered => 'Nulla è stato pagato per questi filtri';

  @override
  String costSpokenPaid(String amount) {
    return 'pagato $amount';
  }

  @override
  String costSpokenEstimated(String amount) {
    return 'stimato $amount';
  }

  @override
  String costSpendCardPaidSemantics(
    String paid,
    String charged,
    String margin,
  ) {
    return 'Spesa negli ultimi 30 giorni: $paid pagato, $charged addebitato, $margin margine a prezzi di listino';
  }

  @override
  String get vendorBillingFree => 'Piano gratuito';

  @override
  String get vendorBillingMetered => 'A consumo';

  @override
  String get vendorBillingFreeHelp =>
      'L\'uso si ferma al limite e conta come 0 \$ pagati.';

  @override
  String get vendorBillingMeteredHelp => 'L\'uso è pagato al costo registrato.';

  @override
  String get vendorIncludedUsd => 'Credito mensile incluso (USD)';

  @override
  String get vendorIncludedUsdHelp =>
      'L\'uso fino a questo importo ogni mese solare conta come 0 \$ pagati.';

  @override
  String upgradePromptIncludedIn(String plan) {
    return 'Incluso nel piano $plan e superiori.';
  }

  @override
  String get payFeedbackTitle => 'Domanda veloce';

  @override
  String get payFeedbackPrompt =>
      'Cosa dovrebbe offrirti Casama perché valga la pena pagare?';

  @override
  String get payFeedbackHint =>
      'Una funzione, un limite o un flusso di lavoro per cui pagheresti volentieri…';

  @override
  String get suggestBrowserLookup =>
      'Cerca in un browser le principali notizie tech di oggi e riassumi i 3 articoli migliori.';

  @override
  String get suggestMorningBrief =>
      'Imposta il mio riepilogo mattutino per domani alle 8:00 con le mie priorità e il meteo.';
}
