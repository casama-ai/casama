// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

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
  String get tabTitleChat => 'Discussion';

  @override
  String get tabTitleCall => 'Appel';

  @override
  String get tabTitleProject => 'Projet';

  @override
  String get tabTitleGroupChat => 'Discussion de groupe';

  @override
  String get loading => 'Chargement…';

  @override
  String get retry => 'Réessayer';

  @override
  String get keepGoing => 'Continuer';

  @override
  String get keepGoingMessage => 'Continuez là où vous en étiez.';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get delete => 'Supprimer';

  @override
  String get edit => 'Modifier';

  @override
  String get close => 'Fermer';

  @override
  String get create => 'Créer';

  @override
  String get continueLabel => 'Continuer';

  @override
  String get somethingWentWrong => 'Un problème est survenu';

  @override
  String get errorViewHint => 'Redémarrer l\'app devrait résoudre le problème.';

  @override
  String get signInTitle => 'Se connecter à Casama';

  @override
  String get signUpTitle => 'Créer votre compte';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signUp => 'Créer un compte';

  @override
  String get haveAccount => 'Déjà un compte ? Se connecter';

  @override
  String get needAccount => 'Première visite ? Créer un compte';

  @override
  String get magicLink => 'M\'envoyer un lien de connexion par e-mail';

  @override
  String get magicLinkSent =>
      'Consultez vos e-mails pour trouver le lien de connexion.';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get continueWithEmail => 'Continuer par e-mail';

  @override
  String get moreSignInOptions => 'Plus d\'options';

  @override
  String get usePasswordInstead => 'Utiliser plutôt un mot de passe';

  @override
  String get checkInboxTitle => 'Vérifiez votre boîte de réception';

  @override
  String checkInboxBody(String email) {
    return 'Nous avons envoyé un lien de connexion et un code à 6 chiffres à $email. Touchez le lien ou saisissez le code ici.';
  }

  @override
  String get emailCodeLabel => 'Code à 6 chiffres';

  @override
  String get resendLink => 'Renvoyer';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Renvoyer dans $secondsString s';
  }

  @override
  String get useDifferentEmail => 'Utiliser un autre e-mail';

  @override
  String get authWrongPassword =>
      'Cette adresse e-mail et ce mot de passe ne correspondent pas. Réessayez ou connectez-vous avec un lien par e-mail.';

  @override
  String get authEmailNotConfirmed =>
      'Confirmez d\'abord votre adresse e-mail : ouvrez le lien que nous vous avons envoyé.';

  @override
  String get authCodeInvalid =>
      'Ce code est incorrect ou a expiré. Vérifiez le dernier e-mail reçu ou renvoyez-en un.';

  @override
  String get authTooManyTries =>
      'Trop de tentatives. Attendez une minute et réessayez.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds secondes',
      one: '$seconds seconde',
    );
    return 'Trop de requêtes à la fois. Réessayez dans $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'Vous pouvez réessayer maintenant.';

  @override
  String get authAccountExists =>
      'Un compte existe déjà avec cette adresse e-mail. Connectez-vous plutôt.';

  @override
  String get authSignupDisabled =>
      'Ce serveur n\'accepte pas de nouvelles inscriptions.';

  @override
  String get useMagicLinkInstead => 'M\'envoyer plutôt un lien par e-mail';

  @override
  String get invalidEmail => 'Saisissez une adresse e-mail valide';

  @override
  String get passwordTooShort => 'Utilisez au moins 6 caractères';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get onboardingTitle => 'Configurer votre espace de travail';

  @override
  String get createWorkspace => 'Créer un espace de travail';

  @override
  String get workspaceName => 'Nom de l\'espace de travail';

  @override
  String get joinWorkspace => 'Rejoindre avec un code d\'invitation';

  @override
  String get inviteCode => 'Code d\'invitation';

  @override
  String get join => 'Rejoindre';

  @override
  String get addModelKeyTitle => 'Ajouter une clé de modèle';

  @override
  String get addModelKeyBody =>
      'Les bots utilisent votre propre clé de fournisseur de modèles. Elle est stockée chiffrée et ne sera plus affichée.';

  @override
  String get provider => 'Fournisseur';

  @override
  String get label => 'Libellé';

  @override
  String get apiKey => 'Clé API';

  @override
  String get baseUrl => 'URL de base';

  @override
  String get testKey => 'Tester la clé';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'La clé fonctionne ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Échec du test de la clé : $error';
  }

  @override
  String get createFirstBot => 'Créer votre premier bot';

  @override
  String get botName => 'Nom du bot';

  @override
  String get model => 'Modèle';

  @override
  String get persona => 'Instructions';

  @override
  String get personaHint =>
      'Ce que fait ce bot et comment il doit travailler. Un profil remplit ce champ ; modifiez-le librement.';

  @override
  String get modelKey => 'Clé de modèle';

  @override
  String get navComputer => 'Ordinateur';

  @override
  String get navChats => 'Discussions';

  @override
  String get navTasks => 'Tâches';

  @override
  String get settingsConnectionsSection => 'Connexions';

  @override
  String get advanced => 'Avancé';

  @override
  String get settingsAdvancedSummary => 'Secrets, ordinateurs, appareils';

  @override
  String get bots => 'Bots';

  @override
  String get newBot => 'Nouveau bot';

  @override
  String get noBots => 'Aucun bot pour l\'instant';

  @override
  String get botStatusIdle => 'Inactif';

  @override
  String get botStatusWorking => 'En cours';

  @override
  String get botStatusWaiting => 'En attente de votre réponse';

  @override
  String sidebarMoreWorking(int count) {
    return '$count autres en cours';
  }

  @override
  String get botStatusDisabled => 'Désactivé';

  @override
  String costToday(String cost) {
    return '$cost aujourd\'hui';
  }

  @override
  String get newChat => 'Nouvelle discussion';

  @override
  String get conversations => 'Conversations';

  @override
  String messageHint(String bot) {
    return 'Écrire à $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Écrire à $bot · @ pour mentionner une app';
  }

  @override
  String get mentionSectionBots => 'Bots';

  @override
  String get mentionSectionApps => 'Apps';

  @override
  String get mentionSectionAddToBot => 'Ajouter à ce bot';

  @override
  String get mentionSectionConnect => 'Connecter';

  @override
  String get mentionSectionStartGroup => 'Démarrer une discussion de groupe';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'App';

  @override
  String get mentionAddAction => 'Ajouter';

  @override
  String get mentionConnectAction => 'Connecter';

  @override
  String get mentionMaxApps =>
      'Vous pouvez mentionner jusqu\'à 3 apps par message.';

  @override
  String get mentionRemovedApp => 'App retirée';

  @override
  String get send => 'Envoyer';

  @override
  String get stop => 'Arrêter';

  @override
  String get thinking => 'Réflexion…';

  @override
  String get checkingItsWork => 'Vérification de sa réponse…';

  @override
  String get mapFullScreen => 'Plein écran';

  @override
  String get mapTitle => 'Carte';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Arrêté.';

  @override
  String emptyChat(String bot) {
    return 'Dites bonjour à $bot.';
  }

  @override
  String get toolRunning => 'En cours';

  @override
  String get toolFailedLabel => 'Échec';

  @override
  String get toolOutput => 'Sortie';

  @override
  String get remembered => 'Information mémorisée';

  @override
  String skillLoaded(String name) {
    return 'Compétence $name chargée';
  }

  @override
  String checkpointSaved(String label) {
    return 'Point de restauration enregistré : $label';
  }

  @override
  String computerState(String state) {
    return 'Ordinateur $state';
  }

  @override
  String get activity => 'Activité';

  @override
  String get timelineTitle => 'Chronologie des exécutions';

  @override
  String get allEvents => 'Tout';

  @override
  String get filterTools => 'Outils';

  @override
  String get filterMessages => 'Messages';

  @override
  String get filterSystem => 'Système';

  @override
  String get restore => 'Restaurer';

  @override
  String get restoreConfirm =>
      'Revenir à ce point de restauration ? Les fichiers modifiés depuis seront remplacés.';

  @override
  String get restored => 'Point de restauration restauré.';

  @override
  String get noRuns => 'Aucune exécution pour l\'instant.';

  @override
  String get computerTitle => 'Ordinateur';

  @override
  String get computerStart => 'Démarrer';

  @override
  String get computerSleep => 'Mettre en veille';

  @override
  String get screen => 'Écran';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Fichiers';

  @override
  String get noScreen =>
      'Rien à l\'écran pour l\'instant. La page du navigateur du bot s\'affiche ici.';

  @override
  String get refresh => 'Actualiser';

  @override
  String get upload => 'Importer';

  @override
  String get download => 'Télécharger';

  @override
  String get emptyFolder => 'Ce dossier est vide';

  @override
  String get noCheckpoints =>
      'Ils sont enregistrés automatiquement avant toute modification risquée pour vous permettre de l\'annuler.';

  @override
  String get computerAsleep =>
      'L\'ordinateur est en veille. Ses fichiers sont enregistrés et il se réveille dès que nécessaire.';

  @override
  String get connectTerminal => 'Connecter';

  @override
  String get terminalDisconnected => 'Déconnecté.';

  @override
  String get terminalReconnecting => 'Redémarrage du serveur, reconnexion…';

  @override
  String get memory => 'Mémoire';

  @override
  String get noMemories => 'Aucun souvenir pour l\'instant.';

  @override
  String get noMemoriesMatch => 'Aucun souvenir ne correspond.';

  @override
  String get clearSearch => 'Effacer';

  @override
  String get addMemory => 'Ajouter un souvenir';

  @override
  String get addMemoryHelp =>
      'Une information que le bot doit toujours retenir sur vous ou votre travail.';

  @override
  String get addMemoryFactHint =>
      'Par exemple : Notre exercice fiscal commence en avril.';

  @override
  String get addMemoryPreferenceHint =>
      'Par exemple : Limitez les résumés à cinq points.';

  @override
  String get memoryAdded => 'Souvenir ajouté';

  @override
  String get pin => 'Épingler';

  @override
  String get unpin => 'Désépingler';

  @override
  String get deleteMemoryConfirm =>
      'Oublier cet élément ? Cette action est irréversible.';

  @override
  String get skills => 'Compétences';

  @override
  String get noSkills =>
      'Aucune compétence pour l\'instant. Les compétences sont des instructions que les bots chargent quand c\'est utile.';

  @override
  String get newSkill => 'Nouvelle compétence';

  @override
  String get skillName => 'Nom (minuscules, tirets)';

  @override
  String get skillDescription => 'Description en une ligne';

  @override
  String get skillBody => 'Instructions (Markdown)';

  @override
  String get enabled => 'Activé';

  @override
  String get settings => 'Réglages';

  @override
  String get workspace => 'Espace de travail';

  @override
  String get switchWorkspace => 'Changer d\'espace de travail';

  @override
  String get modelKeys => 'Clés de modèle';

  @override
  String get moreProviders => 'Plus de fournisseurs';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, serveurs personnalisés';

  @override
  String get toolPermissions => 'Autorisations des outils';

  @override
  String get devicesAdvancedSummary =>
      'Durée de conservation, modèles privés, bots autorisés';

  @override
  String get companionAdvancedSummary =>
      'Commandes, outils locaux (MCP), agents de code';

  @override
  String get noKeys => 'Aucune clé de modèle pour l\'instant.';

  @override
  String get addKey => 'Ajouter une clé';

  @override
  String get usage => 'Utilisation';

  @override
  String get language => 'Langue';

  @override
  String inviteSent(String email) {
    return 'Invitation envoyée à $email.';
  }

  @override
  String get botProfile => 'Profil du bot';

  @override
  String get groupMembers => 'Bots dans cette discussion';

  @override
  String get groupMembersHelp =>
      'Chacun garde sa propre mémoire et ses propres réglages. Touchez un bot pour ouvrir son profil.';

  @override
  String get botAdvancedSummary =>
      'Apps de messagerie, liens, règles, suivis, plugins, activité';

  @override
  String get botActivityRow => 'Chaque exécution, étape par étape';

  @override
  String get createBotAdvancedSummary => 'Clé de modèle et modèle';

  @override
  String get botProfileSection => 'Profil';

  @override
  String get botBrain => 'Cerveau';

  @override
  String get botAbilities => 'Capacités';

  @override
  String get botSchedule => 'Planning';

  @override
  String get chatComputerLive => 'Travaille sur son ordinateur';

  @override
  String get autonomy => 'Autonomie';

  @override
  String get autonomyAskAlways => 'Demander avant d\'agir';

  @override
  String get autonomyAskRisky => 'Demander pour les actions risquées';

  @override
  String get autonomyAutonomous => 'Agir en autonomie';

  @override
  String get saved => 'Enregistré.';

  @override
  String get justNow => 'à l\'instant';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'il y a $nString minutes',
      one: 'il y a $nString minute',
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
      other: 'il y a $nString heures',
      one: 'il y a $nString heure',
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
      other: 'il y a $nString jours',
      one: 'il y a $nString jour',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Un bot';

  @override
  String get addIntegration => 'Ajouter une intégration';

  @override
  String get addSecret => 'Ajouter un secret';

  @override
  String get allowedHosts => 'Hôtes autorisés';

  @override
  String get allowedHostsHelp =>
      'Séparés par des virgules, par exemple api.github.com';

  @override
  String get alwaysAllow => 'Toujours autoriser';

  @override
  String get approval => 'Approbation';

  @override
  String get approvalAlreadyDecided =>
      'Cette demande a déjà été traitée ou a expiré.';

  @override
  String get approvals => 'Approbations';

  @override
  String get approve => 'Approuver';

  @override
  String get approved => 'Approuvé';

  @override
  String get authHeaderOptional => 'En-tête d\'autorisation (facultatif)';

  @override
  String get authSecretName => 'Nom du secret d\'authentification (facultatif)';

  @override
  String get authSecretNameHelp =>
      'Nom d\'un secret dans Réglages › Secrets, envoyé en tant que jeton bearer';

  @override
  String get baseUrlOptional => 'URL de base (facultatif)';

  @override
  String get blankBot => 'Vierge';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Choisir un modèle';

  @override
  String get searchModels => 'Rechercher un modèle ou saisir son identifiant';

  @override
  String get recommendedModels => 'Recommandés';

  @override
  String get allModels => 'Tous les modèles';

  @override
  String useCustomModel(String id) {
    return 'Utiliser « $id »';
  }

  @override
  String modelListFallback(String reason) {
    return 'Modèles suggérés affichés. $reason Vous pouvez toujours saisir n\'importe quel identifiant de modèle.';
  }

  @override
  String get noModelsFound => 'Aucun modèle ne correspond.';

  @override
  String get addModelKeyFirst =>
      'Ajoutez d\'abord une clé de modèle. Votre bot l\'utilise pour réfléchir ; elle est stockée chiffrée et ne sera plus affichée.';

  @override
  String get composioToolkits =>
      'Boîtes à outils (séparées par des virgules, par exemple github, gmail)';

  @override
  String get copySecret => 'Copier le secret';

  @override
  String get cronExpression => 'Expression cron';

  @override
  String get cronHelp => 'minute heure jour mois jour_semaine';

  @override
  String get denied => 'Refusé';

  @override
  String get deny => 'Refuser';

  @override
  String get everyHour => 'Toutes les heures';

  @override
  String get expired => 'Expiré';

  @override
  String get inbox => 'Boîte de réception';

  @override
  String get integrationName => 'Nom';

  @override
  String get integrationNameHelp =>
      'Lettres minuscules, chiffres et tirets bas';

  @override
  String get integrationType => 'Type';

  @override
  String get integrations => 'Intégrations';

  @override
  String get kindMcp => 'Serveur MCP';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Tout marquer comme lu';

  @override
  String get newRoutine => 'Nouvelle routine';

  @override
  String get noIntegrationsForBot =>
      'Ajoutez d\'abord des intégrations dans Réglages, puis activez-les ici pour ce bot.';

  @override
  String get noRoutines => 'Aucune routine pour l\'instant';

  @override
  String get noSecrets => 'Aucun secret pour l\'instant';

  @override
  String get notifications => 'Notifications';

  @override
  String get openInbox => 'Ouvrir la boîte de réception';

  @override
  String get pipedreamApps => 'Apps (séparées par des virgules)';

  @override
  String get pipedreamClientId => 'ID client';

  @override
  String get pipedreamClientSecret => 'Secret client';

  @override
  String get pipedreamProject => 'ID de projet';

  @override
  String get riskHigh => 'Risque élevé';

  @override
  String get riskLow => 'Risque faible';

  @override
  String get riskMedium => 'Risque moyen';

  @override
  String get routineGithub => 'Sur événements GitHub';

  @override
  String get routineInstructions => 'Instructions';

  @override
  String get routineInstructionsHint => 'Que doit faire le bot à chaque fois ?';

  @override
  String get routineName => 'Nom';

  @override
  String get routineEditTitle => 'Modifier la routine';

  @override
  String get routineEditSubtitle =>
      'Modifiez ce qu\'elle fait et quand elle s\'exécute.';

  @override
  String get routineRecentRuns => 'Exécutions récentes';

  @override
  String get routineNoRuns => 'Pas encore d\'exécution.';

  @override
  String get routineSaved => 'Routine enregistrée';

  @override
  String get routineStarted => 'Routine démarrée';

  @override
  String get routineWebhook => 'Sur webhook';

  @override
  String get routines => 'Routines';

  @override
  String get routineAdvancedSummary =>
      'Déclencheurs GitHub et webhook, cron, fuseau horaire';

  @override
  String get routineRepeatDaily => 'Tous les jours';

  @override
  String get routineRepeatWeekdays => 'En semaine';

  @override
  String get routineRepeatWeekly => 'Chaque semaine';

  @override
  String get routineDay => 'Jour';

  @override
  String get routineTimeLabel => 'Heure';

  @override
  String get routineRunsAt => 'S\'exécute à';

  @override
  String routineTimesIn(String timezone) {
    return 'Heures exprimées en $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Personnalisé : $schedule';
  }

  @override
  String get routineOtherTriggers => 'Autres déclencheurs';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Toutes les $nString minutes',
      one: 'Toutes les $nString minute',
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
      other: 'Toutes les $nString heures',
      one: 'Toutes les $nString heures',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Chaque heure à :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Tous les jours à $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'En semaine à $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Le week-end à $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days à $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Le $day de chaque mois à $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items et $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Dimanches',
      'mon': 'Lundis',
      'tue': 'Mardis',
      'wed': 'Mercredis',
      'thu': 'Jeudis',
      'fri': 'Vendredis',
      'sat': 'Samedis',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Dimanche',
      'mon': 'Lundi',
      'tue': 'Mardi',
      'wed': 'Mercredi',
      'thu': 'Jeudi',
      'fri': 'Vendredi',
      'sat': 'Samedi',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Regardez votre bot travailler en direct';

  @override
  String get headlessScreenEmpty =>
      'Cet ordinateur fonctionne en mode navigateur uniquement pour rester léger. Ses pages web s\'afficheront ici dès qu\'il en ouvrira une. Passez à un bureau pour aussi voir et contrôler les apps.';

  @override
  String get headlessScreenChecking =>
      'Recherche de pages toutes les quelques secondes';

  @override
  String get headlessBrowserOnly => 'Navigateur uniquement';

  @override
  String get switchedToDesktopHere =>
      'Passé en mode Bureau. Son écran s\'affichera ici dès qu\'il sera prêt.';

  @override
  String get desktopBarLabel => 'Bureau · utilise plus de mémoire';

  @override
  String get switchToBrowserOnly => 'Passer en navigateur uniquement';

  @override
  String get switchingToBrowserOnly => 'Passage en navigateur uniquement…';

  @override
  String get switchedToBrowserOnly =>
      'Passé en navigateur uniquement. Il utilise désormais moins de mémoire.';

  @override
  String get runNow => 'Exécuter maintenant';

  @override
  String get secretName => 'Nom';

  @override
  String get secretNameHelp => 'Majuscules, par exemple GITHUB_TOKEN';

  @override
  String get secretValue => 'Valeur';

  @override
  String get secrets => 'Secrets';

  @override
  String get serverUrl => 'URL du serveur';

  @override
  String get specUrl => 'URL de la spécification OpenAPI';

  @override
  String get startFrom => 'Profil';

  @override
  String get storedEncrypted => 'Stocké chiffré ; ne sera plus jamais affiché';

  @override
  String get taskBlocked => 'Bloqué';

  @override
  String get taskDoing => 'En cours';

  @override
  String get taskDone => 'Terminé';

  @override
  String get taskTodo => 'À faire';

  @override
  String get test => 'Tester';

  @override
  String get timezone => 'Fuseau horaire';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Répétition';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Voir l\'exécution';

  @override
  String get webhookCreated => 'Webhook créé';

  @override
  String get webhookSecret => 'Secret de signature';

  @override
  String get webhookShownOnce =>
      'Copiez le secret de signature maintenant. Il n\'est affiché qu\'une seule fois.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot : $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Échec de la connexion : $error';
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
      other: 'Connecté, $nString outils',
      one: 'Connecté, $nString outil',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Prochaine : $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Envoyé uniquement à $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'demandé $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Inclut les routines : $names.';
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
      other: '$nString outils',
      one: '$nString outil',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'Le bot a repris le contrôle';

  @override
  String get botComputer => 'Ordinateur';

  @override
  String get botComputerDefault =>
      'Son ordinateur privé s\'il en a un, sinon l\'ordinateur d\'équipe';

  @override
  String get botInControl => 'Bot aux commandes';

  @override
  String get computerName => 'Nom';

  @override
  String get computers => 'Ordinateurs';

  @override
  String get connectingLive => 'Connexion…';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get renameTopic => 'Renommer';

  @override
  String get library => 'Bibliothèque';

  @override
  String get navLibrary => 'Bibliothèque';

  @override
  String get librarySearchHint => 'Rechercher dans la bibliothèque';

  @override
  String get libraryFilterAll => 'Tout';

  @override
  String get libraryFilterPages => 'Sites et jeux';

  @override
  String get libraryFilterImages => 'Images';

  @override
  String get libraryFilterVideos => 'Vidéos';

  @override
  String get libraryFilterAudio => 'Audio';

  @override
  String get libraryFilterDocuments => 'Documents';

  @override
  String get libraryFilterFiles => 'Fichiers';

  @override
  String get creationKindPage => 'Page';

  @override
  String get creationKindImage => 'Image';

  @override
  String get creationKindVideo => 'Vidéo';

  @override
  String get creationKindAudio => 'Audio';

  @override
  String get creationKindDocument => 'Document';

  @override
  String get creationKindFile => 'Fichier';

  @override
  String get libraryPinned => 'Épinglé';

  @override
  String get libraryToday => 'Aujourd\'hui';

  @override
  String get libraryYesterday => 'Hier';

  @override
  String get libraryThisWeek => 'Cette semaine';

  @override
  String get libraryEarlier => 'Plus tôt';

  @override
  String get videoCantPlay =>
      'Impossible de lire cette vidéo sur cet appareil.';

  @override
  String get libraryEmptyTitle => 'Que voulez-vous créer en premier ?';

  @override
  String get libraryEmptyBody =>
      'Choisissez une option et votre bot se met au travail. Tout ce que vos bots créent arrive ici automatiquement.';

  @override
  String get libraryNoMatch => 'Rien ici ne correspond.';

  @override
  String get libraryStarterGame => 'Un petit jeu';

  @override
  String get libraryStarterGamePrompt =>
      'Créez-moi un petit jeu jouable dans le navigateur.';

  @override
  String get libraryStarterLogo => 'Un logo';

  @override
  String get libraryStarterLogoPrompt => 'Concevez un logo pour mon projet.';

  @override
  String get libraryStarterSite => 'Un site d\'une page';

  @override
  String get libraryStarterSitePrompt =>
      'Créez un site web d\'une page pour mon entreprise.';

  @override
  String get libraryStarterVideo => 'Une courte vidéo';

  @override
  String get libraryStarterVideoPrompt => 'Réalisez une courte vidéo de ';

  @override
  String get libraryStarterCard => 'Une carte d\'anniversaire';

  @override
  String get libraryStarterCardPrompt =>
      'Créez une carte d\'anniversaire pour ';

  @override
  String get libraryStarterReport => 'Un rapport';

  @override
  String get libraryStarterReportPrompt =>
      'Faites des recherches et rédigez un rapport sur ';

  @override
  String get libraryStarterElse => 'Autre chose…';

  @override
  String get creationOpen => 'Ouvrir';

  @override
  String get creationPlay => 'Lire';

  @override
  String get creationView => 'Voir';

  @override
  String get creationChangeIt => 'Modifier';

  @override
  String creationChangeDraft(String title) {
    return 'À propos de « $title » : ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Créé par $bot';
  }

  @override
  String creationVersion(int n) {
    return 'version $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'Depuis votre discussion avec $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Créé par $bot';
  }

  @override
  String get creationFromHelp => 'Aller à la conversation';

  @override
  String get creationDetails => 'Détails';

  @override
  String get creationAlongside => 'Créé en parallèle';

  @override
  String creationDeleted(String title) {
    return '« $title » supprimé';
  }

  @override
  String get showInLibrary => 'Afficher dans la bibliothèque';

  @override
  String get pinInLibrary => 'Épingler dans la bibliothèque';

  @override
  String get libraryItemNotFound =>
      'Cet élément n\'est pas encore dans la bibliothèque. Réessayez dans un instant.';

  @override
  String creationPinned(String title) {
    return '« $title » épinglé';
  }

  @override
  String creationUnpinned(String title) {
    return '« $title » désépinglé';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Mis à jour · version $version';
  }

  @override
  String get madeHere => 'Créé ici';

  @override
  String madeHereEmpty(String bot) {
    return '$bot n\'a encore rien créé.';
  }

  @override
  String get madeHereThisChat => 'Dans cette discussion';

  @override
  String madeHereByBot(String bot) {
    return 'Créé par $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Autres créations de $bot';
  }

  @override
  String madeHereCount(String count) {
    return 'Créé ici ($count)';
  }

  @override
  String get sidePanelComputer => 'Ordinateur';

  @override
  String get madeForTicket => 'Créé pour ce ticket';

  @override
  String get libraryCantChangePicked =>
      'Seule la personne pour qui cela a été créé ou les responsables du bot peuvent modifier ceci.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments supprimés',
      one: '$count élément supprimé',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sélectionnés',
      one: '$count sélectionné',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Plus récents';

  @override
  String get librarySortOpened => 'Ouverts récemment';

  @override
  String get librarySortName => 'Nom';

  @override
  String get libraryScopeMine => 'Créés pour moi';

  @override
  String get libraryScopeWorkspace => 'Tout l\'espace de travail';

  @override
  String get libraryFilterSort => 'Trier et filtrer';

  @override
  String get creationWhoCanSee => 'Qui peut voir';

  @override
  String get libraryTile => 'Bibliothèque';

  @override
  String get libraryTileHelp => 'Ce qu\'il a créé';

  @override
  String get regenerateReply => 'Régénérer';

  @override
  String get deleteMessage => 'Supprimer le message';

  @override
  String get deleteMessageTitle => 'Supprimer ce message ?';

  @override
  String get deleteMessageBody =>
      'Il est supprimé pour tout le monde dans cette discussion. Les messages autour restent.';

  @override
  String get messageDeleted => 'Message supprimé';

  @override
  String get findInChat => 'Rechercher dans la discussion';

  @override
  String get findInChatHint => 'Rechercher dans cette discussion';

  @override
  String findInChatCount(int index, int count) {
    return '$index sur $count';
  }

  @override
  String get findInChatNone => 'Aucun résultat';

  @override
  String get findPrevious => 'Résultat précédent';

  @override
  String get findNext => 'Résultat suivant';

  @override
  String get closeFind => 'Fermer la recherche';

  @override
  String get pinTopic => 'Épingler';

  @override
  String get unpinTopic => 'Désépingler';

  @override
  String get inAppAlertReview => 'Examiner';

  @override
  String get forBot => 'Pour le bot';

  @override
  String get handBack => 'Rendre le contrôle';

  @override
  String get handBackNote => 'Note pour le bot (facultatif)';

  @override
  String get handBackNoteHint => 'Par exemple : Je me suis connecté, continuez';

  @override
  String get live => 'En direct';

  @override
  String get liveView => 'Vue en direct';

  @override
  String get liveViewHelp =>
      'Regardez cet ordinateur en direct et prenez le contrôle si nécessaire.';

  @override
  String get newComputer => 'Nouvel ordinateur';

  @override
  String get newComputerHelp =>
      'Un ordinateur privé appartient à un seul bot. Ses fichiers restent séparés de l\'ordinateur d\'équipe.';

  @override
  String get openLiveView => 'Ouvrir la vue en direct';

  @override
  String get liveExpand => 'Plein écran';

  @override
  String get liveCopy => 'Copier';

  @override
  String get liveScreenshot => 'Capture d\'écran';

  @override
  String get liveScreenshots => 'Captures d\'écran';

  @override
  String get liveScreenshotsHelp =>
      'La vidéo en direct ne passe pas sur ce réseau, l\'écran s\'actualise donc environ une fois par seconde.';

  @override
  String get liveReconnecting => 'Reconnexion…';

  @override
  String get liveReconnectingHelp =>
      'La vidéo en direct a été coupée (le serveur redémarre peut-être). Nouvelle tentative ; des captures s\'affichent en attendant.';

  @override
  String get liveTryAgain => 'Réessayer';

  @override
  String get liveDroppedHelp =>
      'La vidéo en direct n\'a pas pu reprendre, l\'écran s\'actualise donc environ une fois par seconde. Touchez Réessayer.';

  @override
  String get liveMore => 'Plus';

  @override
  String get liveSaveScreenshot => 'Enregistrer la capture';

  @override
  String get liveCopyFromComputer => 'Copier depuis l\'ordinateur';

  @override
  String get livePasteToComputer => 'Coller sur l\'ordinateur';

  @override
  String get liveRotateHint =>
      'Tournez votre téléphone à l\'horizontale pour agrandir l\'écran';

  @override
  String get liveWatching => 'Vous regardez';

  @override
  String get liveCopied => 'Copié depuis l\'ordinateur.';

  @override
  String get liveNothingCopied =>
      'Rien n\'a été copié. Sélectionnez d\'abord quelque chose sur l\'ordinateur.';

  @override
  String get livePasteEmpty => 'Votre presse-papiers est vide.';

  @override
  String get liveMinimize => 'Revenir au panneau latéral';

  @override
  String get liveShownFullScreen =>
      'La vue en direct est ouverte en plein écran.';

  @override
  String get liveStillWatching => 'Vous regardez toujours ?';

  @override
  String get liveStillWatchingHelp =>
      'L\'ordinateur se met en veille quand personne ne regarde, pour économiser de l\'énergie.';

  @override
  String get liveKeepWatching => 'Continuer à regarder';

  @override
  String get livePausedToSavePower => 'En pause par économie d\'énergie';

  @override
  String get livePausedToSavePowerHelp =>
      'Personne ne regardait, l\'ordinateur peut donc se reposer. Reprendre le réveille.';

  @override
  String get liveResume => 'Reprendre';

  @override
  String get paused => 'En pause';

  @override
  String get pausedUserInControl => 'En pause : une personne contrôle l\'écran';

  @override
  String get letBotUseTerminal =>
      'Laisser utiliser le terminal et les fichiers';

  @override
  String get screenHandedBack => 'Contrôle de l\'écran rendu';

  @override
  String get privateComputer => 'Ordinateur privé';

  @override
  String get profileDesktop => 'Bureau';

  @override
  String get profileHeadless => 'Sans écran';

  @override
  String get rename => 'Renommer';

  @override
  String get rightClickNextTap => 'Clic droit au prochain toucher';

  @override
  String get screenshotMode =>
      'Captures d\'écran (vidéo en direct indisponible sur ce réseau)';

  @override
  String get showKeyboard => 'Clavier';

  @override
  String get someoneElseInControl => 'Quelqu\'un d\'autre a le contrôle';

  @override
  String get switchToDesktop => 'Passer en mode Bureau';

  @override
  String get switchToHeadless => 'Passer en mode sans écran';

  @override
  String get switchProfileConfirm =>
      'L\'ordinateur redémarre pour changer de mode. Vos fichiers sont conservés, mais tout ce qui s\'y exécute actuellement s\'arrête.';

  @override
  String get switchProfileButton => 'Changer';

  @override
  String get switchingToDesktop => 'Passage en mode Bureau…';

  @override
  String get switchingToHeadless => 'Passage en mode sans écran…';

  @override
  String get switchedToDesktop =>
      'Passé en mode Bureau. Ouvrez la vue en direct pour voir son écran.';

  @override
  String get switchedToHeadless =>
      'Passé en mode sans écran. Il utilise désormais moins de mémoire.';

  @override
  String get takeControl => 'Prendre le contrôle';

  @override
  String get takeoverCompleted => 'Contrôle rendu';

  @override
  String get takeoverDismissed => 'Refusé';

  @override
  String get takeoverPrivacy =>
      'Pendant que vous avez le contrôle, le bot est en pause et rien de ce que vous saisissez ou voyez ne lui est envoyé.';

  @override
  String get liveShellOnTooltip =>
      'Laisser le bot continuer à utiliser son terminal et ses fichiers pendant que vous avez le contrôle';

  @override
  String get liveShellOffTooltip =>
      'Mettre aussi en pause le terminal et les fichiers du bot pendant que vous avez le contrôle';

  @override
  String get liveShellOnNote =>
      'Le bot peut continuer à utiliser son terminal et ses fichiers. Il ne peut ni voir ni utiliser l\'écran tant que vous ne rendez pas le contrôle.';

  @override
  String get liveShellOffNote =>
      'Le bot est entièrement en pause tant que vous ne rendez pas le contrôle.';

  @override
  String get teamComputer => 'Ordinateur d\'équipe';

  @override
  String get withDesktop => 'Avec un bureau';

  @override
  String get withDesktopHelp =>
      'Ajoute un écran à regarder en direct ; utilise plus de mémoire';

  @override
  String get youAreInControl => 'Vous contrôlez l\'écran';

  @override
  String botAsksForHelp(String reason) {
    return 'Le bot demande : $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot a besoin de votre aide';
  }

  @override
  String deleteComputerConfirm(String name) {
    return 'Supprimer $name ? Ses fichiers, instantanés et points de restauration seront aussi supprimés.';
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
    return 'Ordinateur de $bot';
  }

  @override
  String get micPermissionNeeded => 'Autorisez l\'accès au micro pour dicter.';

  @override
  String get dictationEmpty => 'Aucune parole détectée. Réessayez.';

  @override
  String get startCall => 'Démarrer un appel vocal';

  @override
  String get stopDictation => 'Arrêter et transcrire';

  @override
  String get dictate => 'Dicter';

  @override
  String get dictateOnDevice => 'Dicter avec cet appareil';

  @override
  String get stopListening => 'Arrêter l\'écoute';

  @override
  String get dictationRetry => 'Réessayer';

  @override
  String get dictationSayAgain => 'Répéter';

  @override
  String get dictationFailed => 'Impossible de transcrire en texte.';

  @override
  String get dictationFailedUseDevice =>
      'Impossible de transcrire en texte. Répétez et votre appareil écoutera.';

  @override
  String get dictationNoServiceUseDevice =>
      'La dictée n\'est pas configurée pour cet espace de travail. Votre appareil peut écouter à la place.';

  @override
  String get dictationDeviceFailed =>
      'La dictée de votre appareil ne fonctionne plus, le micro utilise donc de nouveau celle de Casama.';

  @override
  String get dictationDevicePermission =>
      'Autorisez la reconnaissance vocale pour dicter avec cet appareil.';

  @override
  String get readAloud => 'Lire à voix haute';

  @override
  String get callConnecting => 'Connexion…';

  @override
  String get callLive => 'En direct';

  @override
  String get callEnded => 'Appel terminé';

  @override
  String get callEndedIdle => 'Appel terminé après 2 minutes de silence.';

  @override
  String get callFailed => 'Impossible de connecter l\'appel.';

  @override
  String get callListening => 'À l\'écoute';

  @override
  String get callSpeaking => 'Parle';

  @override
  String get callWorking => 'S\'en occupe';

  @override
  String get callMutedState => 'Micro coupé';

  @override
  String get callCaptions => 'Sous-titres';

  @override
  String get callSpeaker => 'Haut-parleur';

  @override
  String get callEarpiece => 'Téléphone';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Écouteurs';

  @override
  String get callAudioOutput => 'Diffuser l\'appel sur';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Modification de sa photo',
      'memory_search': 'Recherche dans vos souvenirs',
      'memory_write': 'Enregistrement en mémoire',
      'memory': 'Mise à jour de sa mémoire',
      'knowledge_search': 'Recherche dans vos connaissances',
      'web_search': 'Recherche sur le web',
      'web': 'Lecture d\'une page web',
      'browser_open': 'Ouverture d\'un site web',
      'browser_click': 'Clic sur la page',
      'browser_type': 'Saisie sur la page',
      'browser_press': 'Appui sur une touche',
      'browser_scroll': 'Défilement de la page',
      'browser_look': 'Observation de la page',
      'desktop_click': 'Clic sur l\'écran',
      'desktop_type': 'Saisie',
      'desktop_press': 'Appui sur des touches',
      'desktop_launch': 'Ouverture d\'une app',
      'desktop_look': 'Observation de l\'écran',
      'shell': 'Travail sur son ordinateur',
      'files_read': 'Lecture d\'un fichier',
      'files_write': 'Écriture d\'un fichier',
      'files_list': 'Parcours des fichiers',
      'files_search': 'Recherche de fichiers',
      'files_from_chat': 'Récupération d\'un fichier de la discussion',
      'http': 'Contact d\'un service',
      'data_search': 'Recherche de données',
      'data_call': 'Récupération de données',
      'skills_load': 'Préparation d\'une compétence',
      'skills_create': 'Apprentissage d\'une compétence',
      'skills_update': 'Amélioration d\'une compétence',
      'checkpoint': 'Enregistrement d\'un point de contrôle',
      'computer_restart': 'Redémarrage de son ordinateur',
      'takeover': 'Demande de prise de contrôle',
      'delegate': 'Demande à un assistant',
      'routines_list': 'Vérification de vos routines',
      'routines_create': 'Création d\'une routine',
      'routines_update': 'Mise à jour d\'une routine',
      'routines_delete': 'Suppression d\'une routine',
      'watchers_create': 'Création d\'un suivi',
      'watchers_list': 'Vérification de vos suivis',
      'watchers_delete': 'Suppression d\'un suivi',
      'tasks_list': 'Vérification de vos tâches',
      'tasks_create': 'Ajout d\'une tâche',
      'tasks': 'Mise à jour de vos tâches',
      'notify_user': 'Envoi d\'une note',
      'usage_report': 'Vérification de l\'utilisation',
      'device_read': 'Lecture des données de l\'appareil',
      'device_access': 'Demande d\'accès à l\'appareil',
      'pages_publish': 'Publication d\'une page',
      'pages': 'Mise à jour d\'une page',
      'media': 'Création d\'une image',
      'media_video': 'Création d\'une vidéo',
      'bots_create': 'Création d\'un nouveau bot',
      'bots_update': 'Mise à jour d\'un bot',
      'bots_list': 'Vérification de vos bots',
      'bots_archive': 'Archivage d\'un bot',
      'channel_send': 'Envoi d\'un message',
      'links_ask': 'Demande à l\'assistant d\'un contact',
      'logins_list': 'Vérification des identifiants enregistrés',
      'replay_run': 'Répétition des étapes enregistrées',
      'replay_save': 'Enregistrement de ces étapes',
      'setup_apply': 'Suggestion d\'une configuration',
      'sidebar_organize': 'Organisation de votre barre latérale',
      'suggestions_add': 'Ajout d\'une suggestion',
      'teach_save_draft': 'Enregistrement d\'un brouillon de compétence',
      'welcome_name': 'Choix d\'un nom',
      'secrets_request': 'Demande d\'un secret',
      'pages_list': 'Vérification de vos pages',
      'pages_share': 'Modification des accès à une page',
      'projects_create': 'Lancement d\'un projet',
      'projects_status': 'Vérification d\'un projet',
      'projects_update': 'Mise à jour d\'un projet',
      'projects': 'Planification d\'un projet',
      'payments': 'Demande de paiement',
      'voice_call': 'Appel d\'un établissement',
      'voice_call_user': 'Vous appelle',
      'tools_load': 'Préparation',
      'ui_show': 'Affichage d\'un élément',
      'start_task': 'Démarrage dans la discussion',
      'adult_sites_turn_on': 'Demande d\'activation des sites pour adultes',
      'connections_attach': 'Début d\'utilisation d\'une app',
      'other': 'S\'en occupe',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'A modifié sa photo',
      'memory_search': 'A cherché dans vos souvenirs',
      'memory_write': 'A enregistré en mémoire',
      'memory': 'A mis à jour sa mémoire',
      'knowledge_search': 'A cherché dans vos connaissances',
      'web_search': 'A cherché sur le web',
      'web': 'A lu une page web',
      'browser_open': 'A ouvert un site web',
      'browser_click': 'A cliqué sur la page',
      'browser_type': 'A saisi sur la page',
      'browser_press': 'A appuyé sur une touche',
      'browser_scroll': 'A fait défiler la page',
      'browser_look': 'A observé la page',
      'desktop_click': 'A cliqué sur l\'écran',
      'desktop_type': 'A saisi',
      'desktop_press': 'A appuyé sur des touches',
      'desktop_launch': 'A ouvert une app',
      'desktop_look': 'A observé l\'écran',
      'shell': 'A travaillé sur son ordinateur',
      'files_read': 'A lu un fichier',
      'files_write': 'A écrit un fichier',
      'files_list': 'A parcouru les fichiers',
      'files_search': 'A cherché des fichiers',
      'files_from_chat': 'A récupéré un fichier de la discussion',
      'http': 'A contacté un service',
      'data_search': 'A cherché des données',
      'data_call': 'A récupéré des données',
      'skills_load': 'A utilisé une compétence',
      'skills_create': 'A appris une compétence',
      'skills_update': 'A amélioré une compétence',
      'checkpoint': 'A enregistré un point de contrôle',
      'computer_restart': 'A redémarré son ordinateur',
      'takeover': 'A demandé la prise de contrôle',
      'delegate': 'A demandé à un assistant',
      'routines_list': 'A vérifié vos routines',
      'routines_create': 'A créé une routine',
      'routines_update': 'A mis à jour une routine',
      'routines_delete': 'A supprimé une routine',
      'watchers_create': 'A créé un suivi',
      'watchers_list': 'A vérifié vos suivis',
      'watchers_delete': 'A supprimé un suivi',
      'tasks_list': 'A vérifié vos tâches',
      'tasks_create': 'A ajouté une tâche',
      'tasks': 'A mis à jour vos tâches',
      'notify_user': 'Vous a envoyé une note',
      'usage_report': 'A vérifié l\'utilisation',
      'device_read': 'A lu les données de l\'appareil',
      'device_access': 'A demandé l\'accès à l\'appareil',
      'pages_publish': 'A publié une page',
      'pages': 'A mis à jour une page',
      'media': 'A créé une image',
      'media_video': 'A créé une vidéo',
      'bots_create': 'A créé un nouveau bot',
      'bots_update': 'A mis à jour un bot',
      'bots_list': 'A vérifié vos bots',
      'bots_archive': 'A archivé un bot',
      'channel_send': 'A envoyé un message',
      'links_ask': 'A demandé à l\'assistant d\'un contact',
      'logins_list': 'A vérifié les identifiants enregistrés',
      'replay_run': 'A répété les étapes enregistrées',
      'replay_save': 'A enregistré ces étapes',
      'setup_apply': 'A suggéré une configuration',
      'sidebar_organize': 'A organisé votre barre latérale',
      'suggestions_add': 'A ajouté une suggestion',
      'teach_save_draft': 'A enregistré un brouillon de compétence',
      'welcome_name': 'A choisi un nom',
      'secrets_request': 'Vous a demandé un secret',
      'pages_list': 'A vérifié vos pages',
      'pages_share': 'A modifié les accès à une page',
      'projects_create': 'A lancé un projet',
      'projects_status': 'A vérifié un projet',
      'projects_update': 'A mis à jour un projet',
      'projects': 'A planifié un projet',
      'payments': 'A demandé un paiement',
      'voice_call': 'A appelé un établissement',
      'voice_call_user': 'Vous a appelé',
      'tools_load': 'S\'est préparé',
      'ui_show': 'Vous a montré quelque chose',
      'start_task': 'A démarré dans la discussion',
      'adult_sites_turn_on': 'A demandé l\'activation des sites pour adultes',
      'connections_attach': 'A commencé à utiliser une app',
      'other': 'Terminé',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Utilisation de $app';
  }

  @override
  String toolUsedApp(String app) {
    return '$app utilisé';
  }

  @override
  String get toolDetails => 'Détails';

  @override
  String approvalAsking(String bot) {
    return '$bot demande d\'abord';
  }

  @override
  String get approvalLookClosely =>
      'Vérifiez attentivement avant d\'autoriser ceci';

  @override
  String approvalAttachConnection(String app) {
    return 'Commencer à utiliser $app, déjà connectée dans cet espace de travail';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Laisser $bot faire cela sans demander';
  }

  @override
  String get pageShareToPublic =>
      'Toute personne ayant le lien pourra l\'ouvrir';

  @override
  String get pageShareToWorkspace =>
      'Tout le monde dans cet espace de travail pourra l\'ouvrir';

  @override
  String get pageShareToPrivate =>
      'Personne d\'autre que vous ne pourra l\'ouvrir';

  @override
  String approvalAllowedLine(String what) {
    return 'Autorisé : $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Refusé : $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Aucune réponse à temps : $what';
  }

  @override
  String get callToolFailed => 'Cela n\'a pas fonctionné';

  @override
  String get callToolNeedsOk => 'Votre accord est nécessaire pour continuer';

  @override
  String get callToolAllow => 'Autoriser';

  @override
  String get callToolNotNow => 'Pas maintenant';

  @override
  String get callToolAllowed =>
      'Autorisé. Le résultat s\'affichera dans la discussion';

  @override
  String get callToolDeclined => 'Vous avez répondu pas maintenant';

  @override
  String get callToolBackground =>
      'Toujours en cours. Le résultat s\'affichera dans la discussion';

  @override
  String get callToolInChat => 'Le résultat s\'affichera dans la discussion';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString s';
  }

  @override
  String get callNeedsKeyTitle => 'Les appels nécessitent une clé Google IA';

  @override
  String get callNeedsKeyBody =>
      'Les appels en direct fonctionnent avec Google Gemini Live, cet espace de travail a donc besoin d\'une clé Google IA. Elle ne sert qu\'aux appels : la lecture à voix haute, la dictée, les images et la vidéo passent par OpenRouter. Google en fournit une gratuitement dans AI Studio : créez-la là-bas, puis ajoutez-la dans Clés de modèle pour que les appels fonctionnent aussitôt. Seuls les propriétaires et admins de l\'espace de travail peuvent ajouter des clés.';

  @override
  String get callAddKey => 'Ajouter une clé Google IA';

  @override
  String get callGetFreeKey => 'Obtenir une clé gratuite de Google';

  @override
  String get callMicUnmute => 'Activer micro';

  @override
  String get videoUnmute => 'Réactiver le son';

  @override
  String get callMicMute => 'Couper micro';

  @override
  String get videoMute => 'Couper le son';

  @override
  String get hangUp => 'Raccrocher';

  @override
  String callWith(String bot) {
    return 'Appel avec $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'Terminer l\'appel avec $from et appeler $to ?';
  }

  @override
  String get callSwitchBody =>
      'Vous ne pouvez passer qu\'un appel à la fois. L\'appel en cours est d\'abord enregistré dans sa discussion.';

  @override
  String get callSwitchConfirm => 'Terminer et appeler';

  @override
  String get callVoiceConsentTitle => 'Votre voix est envoyée à Google';

  @override
  String get callVoiceConsentBody =>
      'Pendant un appel, Casama envoie votre voix et ce que vous dites à Google Gemini, qui vous écoute et prononce les réponses de votre bot. Les paroles de l\'appel sont aussi transmises au modèle d\'IA utilisé par votre bot via OpenRouter. Rien n\'est envoyé sans votre accord. Vous pouvez y mettre fin à tout moment dans Réglages › Confidentialité.';

  @override
  String get callVoiceConsentAgree => 'Accepter et appeler';

  @override
  String get callVoiceConsentNotNow => 'Pas maintenant';

  @override
  String get callEndedLost =>
      'L\'appel s\'est terminé car la connexion a été perdue trop longtemps.';

  @override
  String get callMinimize => 'Réduire';

  @override
  String get callEndCall => 'Terminer l\'appel';

  @override
  String get callEndAndAnswer => 'Terminer et répondre';

  @override
  String get callReconnecting => 'Reconnexion…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '$count minute',
      zero: 'moins d\'une minute',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Appel avec $bot, $time, touchez pour revenir';
  }

  @override
  String callReturnBar(String bot) {
    return 'En appel avec $bot, touchez pour revenir';
  }

  @override
  String get callOpen => 'Ouvrir l\'appel';

  @override
  String get callOnHold => 'En attente';

  @override
  String get callNotificationLive => 'En appel';

  @override
  String get callNotificationMuted => 'Micro coupé';

  @override
  String get callNotificationChannel => 'Appels';

  @override
  String callTabTitle(String time) {
    return 'En appel · $time';
  }

  @override
  String get callMenuShow => 'Afficher l\'appel';

  @override
  String get callJobWorking => 'S\'en occupe';

  @override
  String callJobStrip(String task) {
    return 'En cours : $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Besoin de vous : $task';
  }

  @override
  String get callTileWatching => 'Vue en direct';

  @override
  String get callTileDone => 'Terminé';

  @override
  String get callTileNeedsYou => 'Besoin de vous';

  @override
  String callTileLabel(String state) {
    return 'L\'écran du bot, $state. Touchez pour l\'afficher en grand';
  }

  @override
  String get callTileHide => 'Masquer l\'écran';

  @override
  String get screenCardLive => 'en direct';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Écran de $bot, $state';
  }

  @override
  String get screenCardOpen => 'Ouvrir en plein écran';

  @override
  String get screenCardYouHave => 'Vous contrôlez l\'écran';

  @override
  String screenCardHeldBy(String name) {
    return '$name contrôle l\'écran';
  }

  @override
  String get screenCardMore => 'Plus d\'options';

  @override
  String screenCardIntro(String bot) {
    return 'Écran de $bot. Touchez pour regarder, faites glisser pour déplacer.';
  }

  @override
  String get screenCardHideForNow => 'Masquer pour l\'instant';

  @override
  String get screenCardDontShow => 'Ne pas afficher automatiquement';

  @override
  String get screenCardTurnedOff =>
      'La carte d\'écran est désactivée. Réactivez-la dans Réglages.';

  @override
  String get screenCardOfferOff =>
      'Vous masquez souvent la carte d\'écran ? Vous pouvez la désactiver.';

  @override
  String get screenCardTurnOff => 'Désactiver';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot a besoin de vous à l\'écran';
  }

  @override
  String callRecapTitle(String length) {
    return 'Appel · $length';
  }

  @override
  String get callRecapStarted => 'Démarré pendant l\'appel';

  @override
  String get callRecapTaskDone => 'Terminé';

  @override
  String get callRecapTaskFailed => 'Inachevé';

  @override
  String get callRecapTaskStopped => 'Arrêté';

  @override
  String get callRecapTaskRunning => 'Toujours en cours';

  @override
  String get callRecapOpenRun => 'Voir ce qu\'il a fait';

  @override
  String get summarizeCalls => 'Résumer les appels';

  @override
  String get summarizeCallsHelp =>
      'Après chaque appel, sa carte indique de quoi il s\'agissait et la suite. Utilise un peu le petit modèle du bot.';

  @override
  String callCardVoice(String length) {
    return 'Appel vocal · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Appel téléphonique · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Appel coupé · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Appel manqué de $name';
  }

  @override
  String callCardLive(String name) {
    return 'En appel avec $name';
  }

  @override
  String get callCardLiveElsewhere => 'En appel sur un autre appareil';

  @override
  String get callCardReturn => 'Revenir à l\'appel';

  @override
  String callCardBotHungUp(String name) {
    return '$name a raccroché';
  }

  @override
  String get callCardEndedQuiet => 'Terminé après un moment de silence';

  @override
  String get callCardEndedLimit => 'Terminé à la limite de durée de l\'appel';

  @override
  String get callCardWritingSummary => 'Rédaction d\'un résumé…';

  @override
  String callCardSummaryBy(String name) {
    return 'Résumé par $name';
  }

  @override
  String get callCardNextSteps => 'Prochaines étapes';

  @override
  String get callCardDoIt => 'Lancer';

  @override
  String get callCardDismissStep => 'Ignorer';

  @override
  String get callCardStepStarted => 'Démarré';

  @override
  String get callCardStepFailed => 'Impossible de démarrer ceci. Réessayez.';

  @override
  String get callCardDoneOnCall => 'Fait pendant l\'appel';

  @override
  String callCardMore(int count) {
    return '$count de plus';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Transcription · $count échanges',
      one: 'Transcription · $count échange',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Transcription';

  @override
  String get callCardSearchTranscript => 'Rechercher dans la transcription';

  @override
  String get callCardNoMatches => 'Aucun résultat';

  @override
  String get callCardYou => 'Vous';

  @override
  String get callCardCallBack => 'Rappeler';

  @override
  String get callCardCopy => 'Copier';

  @override
  String get callCardCopied => 'Copié';

  @override
  String get callCardShare => 'Partager';

  @override
  String get callCardMoreActions => 'Plus';

  @override
  String get callCardDelete => 'Supprimer l\'appel';

  @override
  String get callCardDeleteTitle => 'Supprimer cet appel ?';

  @override
  String get callCardDeleteBody =>
      'Sa carte et sa transcription sont supprimées de cette discussion. Les tâches qu\'il a lancées gardent leurs résultats.';

  @override
  String get callCardDeleted => 'Appel supprimé';

  @override
  String get callCardDeleteFailed => 'Impossible de supprimer l\'appel';

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

    return 'Réponse démarrée en $msString ms';
  }

  @override
  String get voiceSettings => 'Voix';

  @override
  String get voiceSettingsHelp =>
      'Voix de lecture et outils dont dispose un bot pendant les appels';

  @override
  String get callTools => 'Outils pendant les appels';

  @override
  String get callToolsHelp =>
      'Les appels incluent déjà la mémoire, la recherche web, les notes pour vous, les routines et les tickets, et confient les tâches plus lourdes à la discussion. Ajoutez des outils d\'apps connectées que le bot utilisera en direct ; chacun augmente légèrement le coût de chaque appel.';

  @override
  String get callToolsNone =>
      'Ce bot n\'a encore aucune app connectée activée. Activez-en une dans ses Intégrations, puis choisissez ses outils ici.';

  @override
  String get openIntegrations => 'Ouvrir les intégrations';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString outils d\'app connectée ajoutés',
      one: '$countString outil d\'app connectée ajouté',
      zero: 'Seulement les outils vocaux intégrés',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'ID de voix (facultatif)';

  @override
  String get voiceIdHelp =>
      'Un nom de voix Gemini, comme Kore ou Puck ; vide utilise Kore';

  @override
  String get useThisComputer => 'Utiliser cet ordinateur pour les bots';

  @override
  String get companionDesktopOnly =>
      'Seule l\'app de bureau (macOS, Windows, Linux) peut servir d\'ordinateur pour un bot.';

  @override
  String get companionIntro =>
      'Laissez les bots choisis travailler sur cet ordinateur : exécuter des commandes, modifier des fichiers dans les dossiers que vous sélectionnez, naviguer et utiliser des apps. Tout ce qu\'ils font s\'affiche à l\'écran et peut être arrêté. Désactivé tant que vous n\'approuvez pas chaque capacité.';

  @override
  String get thisComputer => 'Cet ordinateur';

  @override
  String get companionOnline =>
      'Activé : les bots autorisés peuvent utiliser cet ordinateur';

  @override
  String get companionError =>
      'Impossible de joindre Casama ; nouvelle tentative';

  @override
  String get companionOff => 'Désactivé';

  @override
  String get companionCapabilities => 'Ce que les bots peuvent faire';

  @override
  String get companionCapabilitiesHelp =>
      'Approuvez chaque capacité. Les actions à haut risque demandent toujours votre accord, quelle que soit l\'autonomie du bot.';

  @override
  String get capShell => 'Exécuter des commandes (dans les dossiers partagés)';

  @override
  String get capFiles =>
      'Lire et modifier des fichiers dans les dossiers partagés';

  @override
  String get capBrowser => 'Utiliser un navigateur (le sien, séparé du vôtre)';

  @override
  String get capDesktop => 'Utiliser des apps de bureau';

  @override
  String get sharedFolders => 'Dossiers partagés';

  @override
  String get sharedFoldersHelp =>
      'Les bots ne peuvent accéder qu\'à ces dossiers.';

  @override
  String get addFolder => 'Ajouter un dossier';

  @override
  String get botsAllowed => 'Bots autorisés';

  @override
  String get botsAllowedHelp =>
      'Les bots autorisés peuvent aussi travailler sur cet ordinateur. Chacun garde son propre ordinateur et l\'utilise sauf si une tâche nécessite celui-ci.';

  @override
  String get worksOnTitle => 'Travaille sur';

  @override
  String worksOnSubtitle(String bot) {
    return 'Où $bot exécute des commandes, utilise des fichiers et navigue pour vous.';
  }

  @override
  String get worksOnAuto => 'Automatique';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot choisit à chaque étape : son propre ordinateur, sauf si la tâche nécessite le vôtre.';
  }

  @override
  String get worksOnBot => 'Uniquement l\'ordinateur du bot';

  @override
  String get worksOnBotHelp => 'Votre ordinateur n\'est jamais utilisé.';

  @override
  String get worksOnMine => 'Uniquement mon ordinateur';

  @override
  String get worksOnMineHelp =>
      'Tout se passe sur votre ordinateur, il doit donc être allumé.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Tout se passe sur $computer, il doit donc être allumé.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Travaille sur : $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Où $bot travaille';
  }

  @override
  String get placesSubtitle =>
      'Choisissez l\'ordinateur à afficher ici. « Travaille sur » détermine où le bot effectue son travail.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Affichage de $computer. Travaille sur : $mode. Modifier';
  }

  @override
  String get placeYoursOnline => 'Votre ordinateur · En ligne';

  @override
  String get placeYoursOffline => 'Votre ordinateur · Hors ligne';

  @override
  String get placeTeamComputer => 'Ordinateur d\'équipe';

  @override
  String placeBotsOwn(String bot) {
    return 'Ordinateur de $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action sur $computer';
  }

  @override
  String get botYourComputer => 'Votre ordinateur';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone => 'Non autorisé sur aucun de vos ordinateurs';

  @override
  String botYourComputerHow(String bot) {
    return 'Pour laisser $bot travailler aussi sur votre ordinateur, ouvrez Casama sur cet ordinateur et activez-le dans Réglages → Utiliser cet ordinateur pour les bots → Bots autorisés. Il garde son propre ordinateur dans tous les cas.';
  }

  @override
  String get routineWhere => 'Où elle travaille';

  @override
  String get routineWhereHelp =>
      'Où cette routine exécute des commandes et utilise des fichiers.';

  @override
  String get routineWhereBot => 'L\'ordinateur du bot';

  @override
  String get routineWhereBotHelp =>
      'S\'exécute que votre ordinateur soit allumé ou non.';

  @override
  String get routineWhereMine => 'Mon ordinateur quand il est allumé';

  @override
  String get routineWhereMineHelp =>
      'Pour travailler sur vos propres fichiers et apps. L\'exécution l\'indique si l\'ordinateur était éteint.';

  @override
  String get computerBotsAllowed => 'Bots autorisés';

  @override
  String get unpairComputer =>
      'Ne plus utiliser cet ordinateur et le dissocier';

  @override
  String botActingHere(String bot, String action) {
    return '$bot travaille sur cet ordinateur : $action';
  }

  @override
  String get quickAsk => 'Demande rapide';

  @override
  String get quickAskHint => 'Demandez n\'importe quoi à un bot…';

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
  String get cloudModelsTitle => 'Modèles cloud';

  @override
  String get cloudModelsHelp =>
      'S\'applique à chaque serveur Cloud en quelques secondes.';

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
  String get connectionsTitle => 'Connexions aux apps';

  @override
  String get connectionsServerComposio => 'Compte Composio de Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Les apps sans propre connexion se connectent en un clic via le compte Composio de ce serveur.';

  @override
  String get connectionsOwnAccounts => 'Comptes des utilisateurs';

  @override
  String get connectionsOwnAccountsHelp =>
      'Chaque personne utilise son propre compte Composio, Pipedream ou Zapier.';

  @override
  String get connectionsNoComposioKey =>
      'Ajoutez COMPOSIO_API_KEY sur ce serveur pour utiliser le compte de Casama.';

  @override
  String get connectionsGoogleTitle => 'Apps Google';

  @override
  String get connectionsGoogleComposio => 'Via Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Agenda, Drive et plus fonctionnent tout de suite.';

  @override
  String get connectionsGoogleDirect => 'Propres serveurs de Google';

  @override
  String get connectionsGoogleDirectHelp =>
      'Nécessite l\'inscription à Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Seul le propriétaire de l\'instance peut ouvrir la console d\'administration.';

  @override
  String get runs24h => 'Exécutions (24 h)';

  @override
  String get failedRuns24h => 'Exécutions échouées (24 h)';

  @override
  String get cost24h => 'Dépense (24 h)';

  @override
  String get computersRunning => 'Ordinateurs actifs';

  @override
  String get devicesOnline => 'Ordinateurs personnels en ligne';

  @override
  String get editQuotas => 'Modifier les quotas';

  @override
  String get maxBots => 'Limite de bots';

  @override
  String get monthlyUsd => 'Plafond mensuel (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest est disponible (vous utilisez $current)';
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
      other: '$nString espaces de travail',
      one: '$nString espace de travail',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'connecté $when';
  }

  @override
  String quotasFor(String name) {
    return 'Quotas pour $name';
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
      other: '$nString membres',
      one: '$nString membre',
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
      one: '$nString bot',
    );
    return '$_temp0';
  }

  @override
  String cost30d(String usd) {
    return '$usd sur 30 jours';
  }

  @override
  String get connectingToServer => 'Connexion à Casama…';

  @override
  String get cannotReachServer => 'Impossible de joindre votre serveur Casama';

  @override
  String get connectionFailed =>
      'Impossible de joindre votre serveur Casama. Vérifiez votre connexion et réessayez.';

  @override
  String get serverNotResponding =>
      'Votre serveur Casama ne répond pas pour le moment. Réessayez dans un instant.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Vérifiez votre connexion ou assurez-vous que le serveur à l\'adresse $url fonctionne.';
  }

  @override
  String get serverUnreachableBody =>
      'Vérifiez que vous êtes en ligne. Si c\'est le cas, le serveur redémarre peut-être ; nous continuons d\'essayer.';

  @override
  String retryingIn(int seconds) {
    return 'Nouvelle tentative dans $seconds s';
  }

  @override
  String get retryingNow => 'Tentative…';

  @override
  String get upgradeTitle => 'Changer de forfait';

  @override
  String get notNow => 'Pas maintenant';

  @override
  String get seePlans => 'Voir les forfaits';

  @override
  String get billing => 'Facturation';

  @override
  String get billingOffSelfHosted =>
      'La facturation est désactivée sur ce serveur. Il fonctionne avec sa propre licence : l\'utilisation personnelle est gratuite pour une personne, et les équipes utilisent une licence Business.';

  @override
  String get restorePurchases => 'Restaurer les achats';

  @override
  String get restoreStarted => 'Vérification de vos achats…';

  @override
  String get plans => 'Forfaits';

  @override
  String get currentPlan => 'Forfait actuel';

  @override
  String subscribeFor(String price) {
    return 'S\'abonner pour $price';
  }

  @override
  String get subscribeOnWeb => 'S\'abonner sur le web';

  @override
  String get credits => 'Crédits';

  @override
  String get creditHistory => 'Historique des crédits';

  @override
  String get creditReasonPurchase => 'Crédits achetés';

  @override
  String get creditReasonGrant => 'Crédits ajoutés';

  @override
  String get creditReasonRefund => 'Remboursement';

  @override
  String get creditReasonAdjustment => 'Ajustement';

  @override
  String get creditReasonExpire => 'Crédits expirés';

  @override
  String limitBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots',
      one: '$countString bot',
    );
    return '$_temp0';
  }

  @override
  String get limitBotsUnlimited => 'Bots illimités';

  @override
  String get unlimitedValue => 'Illimité';

  @override
  String trialDaysFree(int n) {
    return '$n jours gratuits';
  }

  @override
  String get extraPeople => 'Personnes supplémentaires';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price par personne et par mois, en plus des $seats incluses dans votre forfait.';
  }

  @override
  String get extraPeopleSaved => 'Personnes supplémentaires mises à jour';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString heures d\'ordinateur par mois';
  }

  @override
  String limitCredits(String amount) {
    return '$amount crédits par mois';
  }

  @override
  String get viaWeb => 'Facturé sur le web';

  @override
  String get viaAppStore => 'Facturé via l\'App Store';

  @override
  String get viaGooglePlay => 'Facturé via Google Play';

  @override
  String get yourPlan => 'Votre forfait';

  @override
  String planEndsOn(String date) {
    return 'Prend fin le $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Renouvellement le $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Crédits : $amount';
  }

  @override
  String get manageSubscription => 'Gérer l\'abonnement';

  @override
  String get compViaCasama => 'Offert par Casama';

  @override
  String compFreeUntil(String date) {
    return 'Gratuit jusqu\'au $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Achat de test. Les limites de test s\'appliquent : $credits de crédits par mois et $daily par jour.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Garder $plan';
  }

  @override
  String get haveGiftCode => 'Vous avez un code cadeau ?';

  @override
  String get redeemCodeTitle => 'Utiliser un code cadeau';

  @override
  String get redeemCodeIntro =>
      'Saisissez le code que vous avez reçu. Le forfait est appliqué à l\'espace de travail de votre choix, sans rien à payer.';

  @override
  String get redeemCodeLabel => 'Code cadeau';

  @override
  String get redeemCodeChecking => 'Vérification…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months mois de $plan, gratuits',
      one: '$months mois de $plan, gratuit',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'Ce code n\'existe pas ou ne peut plus être utilisé.';

  @override
  String get redeemCodeWorkspace => 'Espace de travail';

  @override
  String get redeemCodeSubmit => 'Utiliser';

  @override
  String get redeemCodeFinePrint =>
      'Un code cadeau par personne. À la fin, l\'espace de travail passe au forfait Gratuit sauf si vous choisissez un forfait.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan est à vous';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Votre espace de travail bénéficie de $plan gratuitement jusqu\'au $date. Ouvrez Casama sur n\'importe quel appareil pour en profiter.';
  }

  @override
  String get redeemCodeOpenBilling => 'Ouvrir Facturation';

  @override
  String get redeemCodeNoWorkspace =>
      'Un code cadeau s\'applique à un espace de travail dont vous êtes propriétaire. Créez-en un d\'abord, puis ouvrez le lien à nouveau.';

  @override
  String get redeemCodeUnavailable =>
      'Ceci n\'est pas disponible dans cette version de l\'app.';

  @override
  String usageComputerHours(String hours) {
    return 'Ordinateurs cloud : $hours h';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Vue en direct : $minutes min';
  }

  @override
  String get thisMonth => 'Ce mois-ci';

  @override
  String get noBillableUsage =>
      'Aucune utilisation facturable pour l\'instant.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Connectez un Casama auto-hébergé à cet espace de travail. L\'adresse publique et les notifications sont gratuites ; les ordinateurs cloud et crédits de modèle sont facturés ici.';

  @override
  String get linkCloudNewKey => 'Nouvelle clé Casama Link';

  @override
  String get linkCloudKeyCreated => 'Clé créée';

  @override
  String get linkCloudKeyOnce =>
      'Copiez-la maintenant ; elle n\'est affichée qu\'une seule fois. Définissez-la sur votre serveur avec CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Copier';

  @override
  String get revoke => 'Révoquer';

  @override
  String get instanceName => 'Nom du serveur';

  @override
  String get server => 'Serveur';

  @override
  String get serverAddress => 'Adresse du serveur';

  @override
  String get serverAddressInvalid =>
      'Saisissez une adresse de serveur comme https://casama.example.com ou http://192.168.1.20:8080.';

  @override
  String get connect => 'Connecter';

  @override
  String get changeServer => 'Utiliser un autre serveur';

  @override
  String serverIs(String host) {
    return 'Serveur : $host';
  }

  @override
  String get continueWithSso => 'Continuer avec SSO';

  @override
  String get workEmail => 'E-mail professionnel';

  @override
  String get privacy => 'Confidentialité';

  @override
  String get exportMyData => 'Exporter mes données';

  @override
  String get exportMyDataHelp =>
      'Bots, chats, exécutions, souvenirs et réglages. Aucun secret.';

  @override
  String exportReady(String kb) {
    return 'Export prêt ($kb ko)';
  }

  @override
  String get runHistoryRetention =>
      'Conserver l\'historique des exécutions pendant';

  @override
  String get runHistoryRetentionHelp =>
      'Les événements d\'exécution plus anciens sont supprimés automatiquement.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString jours',
      one: '$countString jour',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Supprimer mon compte';

  @override
  String get deleteAccountHelp =>
      'Efface vos données après un court délai de grâce.';

  @override
  String get deleteAccountQuestion => 'Supprimer votre compte ?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Les espaces de travail dont vous êtes l\'unique propriétaire sont supprimés avec votre compte, y compris leurs bots et ordinateurs. Un forfait acheté sur le web est résilié automatiquement. Un forfait acheté dans l\'App Store ou sur Google Play ne l\'est pas : résiliez-le dans la boutique correspondante. Saisissez $email pour confirmer.';
  }

  @override
  String get accountDeleted => 'Suppression du compte programmée';

  @override
  String accountDeletedBody(String date) {
    return 'Votre session est fermée. Vos données seront effacées le $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString étapes',
      one: '$countString étape',
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
      other: 'Afficher les $countString étapes précédentes',
      one: 'Afficher $countString étape précédente',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Copié';

  @override
  String get jumpToLatest => 'Aller au plus récent';

  @override
  String get chatViewFullTable => 'Voir le tableau complet';

  @override
  String get chatTableTitle => 'Tableau';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Demandez n\'importe quoi à $bot, ou touchez une idée ci-dessous pour commencer.';
  }

  @override
  String get suggestPlanDay => 'Aidez-moi à organiser ma journée';

  @override
  String get suggestWriteMessage => 'Aidez-moi à rédiger un message';

  @override
  String get suggestExplain =>
      'Cherchez quelque chose et expliquez-le simplement';

  @override
  String get suggestCapabilities => 'Avec quoi pouvez-vous m\'aider ?';

  @override
  String connectedAppSummary(String app) {
    return '$app connectée';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama n\'a pas vérifié ce serveur. Connectez-le uniquement si vous faites confiance à $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama n\'a pas vérifié ce serveur. Connectez-le uniquement si vous faites confiance à la personne qui le gère.';

  @override
  String get serverAddressLabel => 'Adresse du serveur';

  @override
  String get serverAddressHelp =>
      'Collez l\'adresse du serveur. Si elle contient une clé, celle-ci est stockée chiffrée et reste hors de la discussion.';

  @override
  String get serverChecking => 'Vérification du serveur…';

  @override
  String serverSignInOn(String host) {
    return 'Vous allez vous connecter sur $host.';
  }

  @override
  String get serverUseKey => 'Utiliser plutôt une clé';

  @override
  String get serverUseSignIn => 'Se connecter plutôt';

  @override
  String serverSignInUnavailable(String name) {
    return '$name n\'accepte pas de connexion par navigateur depuis ce serveur Casama. Utilisez une clé.';
  }

  @override
  String get serverNoSignIn => 'Ce serveur fonctionne sans connexion.';

  @override
  String get serverHeaderLabel => 'Nom de l\'en-tête (facultatif)';

  @override
  String get serverToolsTitle => 'Outils utilisables';

  @override
  String get serverToolsHelp =>
      'Désactivez ceux que vous ne voulez pas. Les bots demandent toujours avant les étapes risquées.';

  @override
  String addedInChatBy(String bot) {
    return 'Ajouté dans la discussion par $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name s\'exécute sur votre propre ordinateur. Ouvrez Casama sur cet ordinateur et activez Utiliser cet ordinateur pour l\'ajouter.';
  }

  @override
  String get connectAppsTitle => 'Connecter vos apps';

  @override
  String get moreApps => 'Plus';

  @override
  String addAppTile(String app) {
    return 'Ajouter $app à ce bot';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app ajoutée à $bot';
  }

  @override
  String get connectAppsHint =>
      'Laissez-moi lire et agir dans les outils que vous utilisez déjà.';

  @override
  String connectAppTile(String app) {
    return 'Connecter $app';
  }

  @override
  String get showComputer => 'Afficher l\'ordinateur';

  @override
  String get hideComputer => 'Masquer l\'ordinateur';

  @override
  String get moreActions => 'Plus';

  @override
  String get noConversations => 'Aucune conversation pour l\'instant';

  @override
  String get untitledChat => 'Nouvelle conversation';

  @override
  String get listening => 'Écoute…';

  @override
  String get orLabel => 'ou';

  @override
  String get notificationsPrimerBubble => 'Ne manquez rien !';

  @override
  String get notificationsPrimerTitle => 'Activer les notifications';

  @override
  String get notificationsPrimerBody =>
      'Vos bots vous préviennent quand ils ont besoin d\'une décision ou que leur travail est prêt.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome bloque les notifications pour ce site. Autorisez-les depuis le cadenas dans la barre d\'adresse, puis touchez Activer à nouveau.';

  @override
  String get notificationsTurnOn => 'Activer';

  @override
  String get autoUpdates => 'Mettre à jour automatiquement';

  @override
  String get autoUpdatesHelp =>
      'Installe les nouvelles versions lorsque vous quittez.';

  @override
  String get upToDate => 'Casama est à jour';

  @override
  String get noReleasesToCheck =>
      'Aucune version n\'a encore été publiée pour cet ordinateur, il n\'y a donc rien à comparer avec celle-ci.';

  @override
  String updateReady(String version) {
    return 'Casama $version est disponible';
  }

  @override
  String appVersion(String version) {
    return 'Version $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Nouveautés dans Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Compris';

  @override
  String get whatsNewSubtitle =>
      'Voici ce qui a changé depuis votre dernière mise à jour.';

  @override
  String get whatsNew010Calls =>
      'Appelez vos bots et discutez de vive voix. Ils répondent à voix haute, avec des sous-titres.';

  @override
  String get whatsNew010Looks =>
      'Personnalisez Casama : thèmes, palettes de couleurs, polices et fonds d\'écran dans Réglages → Apparence, et bien plus dans la galerie.';

  @override
  String get whatsNew010AboutYou =>
      'Parlez une seule fois de vous à vos bots dans Réglages → À propos de vous : comment vous appeler et quel style de réponses vous préférez.';

  @override
  String get whatsNew010SignIn =>
      'Connectez-vous avec une clé d\'accès, Apple, Google ou un code reçu par e-mail.';

  @override
  String get openAtLogin => 'Ouvrir à la connexion';

  @override
  String get openAtLoginHelp => 'Prêt pour le raccourci de demande rapide.';

  @override
  String get signInTagline =>
      'Des collègues qui continuent de travailler après la fermeture de l\'app.';

  @override
  String get signInTagline2 => 'Découvrez votre équipe IA.';

  @override
  String get signInTagline3 => 'Une IA qui ne fait pas que parler. Elle agit.';

  @override
  String get signInTagline4 =>
      'Des collègues compétents qui demandent avant d\'agir.';

  @override
  String get signInTagline5 => 'Confiez la tâche. Revenez quand c\'est fait.';

  @override
  String get noBotsHelp =>
      'Un bot est un collègue doté de son propre ordinateur. Créez-en un pour commencer à discuter.';

  @override
  String get newBotSubtitle =>
      'Un collègue avec son propre ordinateur et sa mémoire.';

  @override
  String get appearance => 'Apparence';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI ou un autre fournisseur compatible';

  @override
  String get signOutConfirm =>
      'Vous pouvez vous reconnecter à tout moment ; vos bots continuent de travailler.';

  @override
  String get roleOwner => 'Propriétaire';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get roleMember => 'Membre';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeDark => 'Sombre';

  @override
  String get createWorkspaceBody =>
      'Un espace de travail regroupe vos bots, leurs ordinateurs et les personnes avec qui vous travaillez.';

  @override
  String get workspaceNameHint => 'Mon équipe';

  @override
  String get orJoinWithCode => 'ou rejoindre avec un code d\'invitation';

  @override
  String get getOpenRouterKey => 'Obtenir une clé OpenRouter';

  @override
  String get createFirstBotBody =>
      'Donnez-lui un nom et un modèle. Vous pourrez modifier les deux plus tard.';

  @override
  String stepOf(int step, int total) {
    return 'Étape $step sur $total';
  }

  @override
  String get providerHintOpenRouter =>
      'recommandé : discussion, images, vidéo, voix';

  @override
  String get providerHintGoogle => 'appels en direct uniquement';

  @override
  String get providerHintCompatible => 'Toute API compatible OpenAI';

  @override
  String get providerHintSearch => 'recherche web';

  @override
  String get noRoutinesHelp =>
      'Une routine est une tâche qu\'un bot effectue plus tard tout seul : une fois au moment choisi, selon un planning ou à la réception d\'un webhook.';

  @override
  String get routineOnce => 'Une fois';

  @override
  String lastRun(String when) {
    return 'Dernière : $when';
  }

  @override
  String get routineOff => 'Désactivé';

  @override
  String get routineEnds => 'Fin';

  @override
  String get routineEndsNever => 'Jamais';

  @override
  String get routineEndsOnDate => 'À une date';

  @override
  String get routineEndsAfterRuns => 'Après un nombre d\'exécutions';

  @override
  String get routineEndDate => 'Dernier jour';

  @override
  String get routineRunCountLabel => 'Exécutions';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n exécutions',
      one: '$n exécution',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Se termine $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n exécutions restantes',
      one: '$n exécution restante',
      zero: 'Aucune exécution restante',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Quand elle se termine';

  @override
  String get routineEndTitle => 'Quand elle se termine';

  @override
  String get routineEndSubtitle =>
      'Elle se désactive ensuite d\'elle-même. Un nouveau nombre d\'exécutions repart de maintenant.';

  @override
  String deleteRoutineTitle(String name) {
    return 'Supprimer « $name » ?';
  }

  @override
  String get deleteRoutineBody =>
      'Elle ne s\'exécutera plus. Les résultats déjà publiés restent dans leur conversation.';

  @override
  String get triggerOnce => 'Une fois';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Dans $nString min';
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
      other: 'Dans $nString heures',
      one: 'Dans $nString heure',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Demain à $time';
  }

  @override
  String get integrationNeedsName =>
      'Donnez-lui un nom contenant au moins une lettre.';

  @override
  String integrationNeedsField(String field) {
    return 'Renseignez $field pour enregistrer.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Enregistré sous $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Utilisez une adresse complète commençant par https://';

  @override
  String get openFile => 'Ouvrir';

  @override
  String get saveFile => 'Enregistrer';

  @override
  String get shareFile => 'Partager';

  @override
  String savedFile(String name) {
    return '$name enregistré';
  }

  @override
  String noAppToOpen(String name) {
    return 'Aucune app sur cet appareil ne peut ouvrir $name. Enregistrez-le plutôt.';
  }

  @override
  String get previewUnavailable =>
      'Aucun aperçu pour ce type de fichier. Ouvrez-le ou enregistrez-le pour le voir.';

  @override
  String get openInSystemPlayer => 'Ouvrir dans votre lecteur vidéo';

  @override
  String get playMedia => 'Lire';

  @override
  String get fullScreen => 'Plein écran';

  @override
  String get exitFullScreen => 'Quitter le plein écran';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get convertingToPdf => 'Préparation de l\'aperçu…';

  @override
  String tableFirstRows(int count) {
    return 'Affichage des $count premières lignes';
  }

  @override
  String get imageCouldNotLoad => 'Impossible de charger cette image';

  @override
  String get mediaKindImage => 'Image';

  @override
  String get mediaKindVideo => 'Vidéo';

  @override
  String get mediaKindAudio => 'Audio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Ouvrir le fichier';

  @override
  String get attach => 'Joindre';

  @override
  String get attachFiles => 'Fichiers';

  @override
  String get attachPhotos => 'Photothèque';

  @override
  String get attachCamera => 'Prendre une photo';

  @override
  String get attachScan => 'Numériser un document';

  @override
  String get scanFailed => 'Impossible de numériser le document. Réessayez.';

  @override
  String get dropToAttach => 'Déposez des fichiers pour les joindre';

  @override
  String uploadFailed(String name) {
    return 'Impossible d\'importer $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'Impossible de joindre $name : $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'Impossible de joindre $name';
  }

  @override
  String get sendWithoutIt => 'Envoyer sans le fichier';

  @override
  String get sendWithoutThem => 'Envoyer sans les fichiers';

  @override
  String get removeAttachment => 'Retirer';

  @override
  String get editPhoto => 'Modifier la photo';

  @override
  String get retryUpload => 'Réessayer';

  @override
  String get uploadingAttachments => 'Importation…';

  @override
  String get notSent => 'Non envoyé';

  @override
  String get deleteChat => 'Supprimer la discussion';

  @override
  String get deleteChatTitle => 'Supprimer cette discussion ?';

  @override
  String deleteChatBody(String bot) {
    return 'Ses messages sont supprimés pour toutes les personnes qui peuvent la voir. Ce que $bot y a créé reste dans la bibliothèque, les relevés d\'utilisation restent, et tout ce qu\'il en a retenu reste dans sa mémoire.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer aussi les $count éléments créés ici',
      one: 'Supprimer aussi $count élément créé ici',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Désactivé : ils restent dans la bibliothèque.';

  @override
  String get chatDeleted => 'Discussion supprimée';

  @override
  String get deleteAllChats => 'Supprimer toutes les discussions';

  @override
  String get deleteAllChatsRow =>
      'Repartir avec un historique vierge. Les souvenirs restent.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Supprimer toutes les discussions avec $bot ?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Toutes les discussions avec $bot que vous pouvez supprimer disparaîtront, avec leurs messages, photos et fichiers. Les discussions de groupe restent. Les relevés d\'utilisation restent, et ce que $bot a retenu reste dans sa mémoire.';
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
      other: '$nString discussions supprimées.',
      one: '$nString discussion supprimée.',
      zero: 'Aucune discussion à supprimer.',
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
          '$nString discussions ont été conservées car le bot y travaille encore.',
      one: '$nString discussion a été conservée car le bot y travaille encore.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n bots sont dans cette discussion. Chacun garde sa propre mémoire et ses propres réglages.',
      one:
          '$n bot est dans cette discussion. Chacun garde sa propre mémoire et ses propres réglages.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Saisissez @ et un nom pour solliciter un bot directement.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone demande à $lead d\'organiser le travail et d\'en confier une part à chaque bot.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Sans mention, le bot qui a parlé en dernier répond ($lead au début).';
  }

  @override
  String get messageNotSent =>
      'Vos fichiers n\'ont pas pu être importés, le message n\'a donc pas été envoyé. Il est resté dans le champ de saisie.';

  @override
  String get chatSendsWhenDone => 'Envoi dès la fin de cette réponse';

  @override
  String get noComputerForFiles =>
      'Ce bot n\'a pas d\'ordinateur pour conserver des fichiers.';

  @override
  String fileTooLarge(String name) {
    return '$name dépasse 25 Mo, trop volumineux pour être joint.';
  }

  @override
  String get secretsHelp =>
      'Les bots insèrent un secret dans les requêtes par son nom. Il n\'est envoyé qu\'aux hôtes autorisés et le modèle ne le voit jamais.';

  @override
  String deleteSecretTitle(String name) {
    return 'Supprimer $name ?';
  }

  @override
  String get deleteSecretBody =>
      'Les bots qui l\'utilisent ne pourront plus joindre ce service.';

  @override
  String get hide => 'Masquer';

  @override
  String get show => 'Afficher';

  @override
  String get deleteMemoryTitle => 'Supprimer ce souvenir ?';

  @override
  String get noMemoriesHelp =>
      'Au fil de vos échanges, le bot retient l\'essentiel : faits, préférences et résumés du travail passé.';

  @override
  String get memoryHelp =>
      'Les souvenirs épinglés restent toujours dans le contexte du bot. Modifiez ce qui est inexact ; les souvenirs supprimés sont perdus à jamais.';

  @override
  String get memoryFact => 'Fait';

  @override
  String get memoryPreference => 'Préférence';

  @override
  String get memorySummary => 'Résumé';

  @override
  String get memoryEpisode => 'Épisode';

  @override
  String get pinned => 'Épinglé';

  @override
  String get editMemory => 'Modifier le souvenir';

  @override
  String get editMemoryHelp =>
      'Le bot l\'utilisera la prochaine fois que ce sera utile.';

  @override
  String get modelKeysIntro =>
      'Les bots réfléchissent avec vos propres clés de fournisseur de modèles. Les clés sont stockées chiffrées et ne sont plus affichées.';

  @override
  String get casamaCloudKeyHint => 'Payé avec vos crédits';

  @override
  String get casamaCloudIncluded => 'Inclus';

  @override
  String get casamaCloudModelLocked => 'Casama choisit ce modèle.';

  @override
  String get serverVoiceSetUp =>
      'Ce serveur fournit la voix, il n\'y a donc aucune clé à ajouter. La propre clé d\'un espace de travail est utilisée en premier.';

  @override
  String modelKeysFor(String workspace) {
    return 'Les clés appartiennent à un espace de travail. Celles-ci sont pour $workspace.';
  }

  @override
  String get yourKeys => 'Vos clés';

  @override
  String get keyWorking => 'Fonctionnelle';

  @override
  String get keyFailing => 'En échec';

  @override
  String get keyUntested => 'Non testée';

  @override
  String get skillsHelp =>
      'Une compétence est un ensemble d\'instructions qu\'un bot charge quand une tâche l\'exige, comme votre charte pour les rapports.';

  @override
  String get skillsForAllBots => 'Tous les bots';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Uniquement pour $bot';
  }

  @override
  String get skillsRemovedBot => 'Un bot retiré';

  @override
  String deleteSkillTitle(String name) {
    return 'Supprimer la compétence « $name » ?';
  }

  @override
  String get editSkill => 'Modifier la compétence';

  @override
  String get deleteSkill => 'Supprimer la compétence';

  @override
  String get skillDescriptionHelp =>
      'Les bots lisent ceci pour savoir quand appliquer la compétence.';

  @override
  String get skillBodyHint => '# Étapes\n1. …';

  @override
  String get computersHelp =>
      'Chaque bot travaille sur un ordinateur : l\'ordinateur d\'équipe partagé par tous, ou un ordinateur privé. Les fichiers y restent entre les discussions.';

  @override
  String get computersEmptyTitle => 'Aucun ordinateur pour l\'instant';

  @override
  String get thisDevice => 'Cet appareil';

  @override
  String get personalComputerConnected => 'Connecté';

  @override
  String get personalComputerOffline => 'Hors ligne';

  @override
  String computerCpus(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n CPU',
      one: '$n CPU',
    );
    return '$_temp0';
  }

  @override
  String computerMemory(Object size) {
    return '$size de RAM';
  }

  @override
  String computerDisk(Object size) {
    return '$size de disque';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Dernière utilisation $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Vu pour la dernière fois $when';
  }

  @override
  String get computerSaved => 'Enregistré';

  @override
  String get computerSavedHelp =>
      'Ses fichiers sont conservés pendant son arrêt';

  @override
  String computerCanUse(Object list) {
    return 'Bots autorisés : $list';
  }

  @override
  String get computerCanUseNothing => 'Aucun bot ne peut encore l\'utiliser';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Fichiers';

  @override
  String get computerCapBrowser => 'Navigateur';

  @override
  String get computerCapDesktop => 'Écran';

  @override
  String get computerCapMcp => 'Outils locaux';

  @override
  String get computerCapMessages => 'Messages';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name est hors ligne. Ouvrez Casama dessus et activez « Utiliser cet ordinateur pour les bots ». Votre propre ordinateur n\'utilise jamais les heures d\'ordinateur de votre forfait.';
  }

  @override
  String get yourComputerOffline => 'Votre ordinateur est hors ligne';

  @override
  String get howToFix => 'Comment résoudre';

  @override
  String get computerHoursUsedTitle => 'Heures d\'ordinateur épuisées';

  @override
  String get personalScreenNote =>
      'Ceci est votre propre ordinateur, vous voyez donc une nouvelle capture toutes les quelques secondes plutôt qu\'une vue en direct.';

  @override
  String get renameComputer => 'Renommer l\'ordinateur';

  @override
  String deleteComputerTitle(String name) {
    return 'Supprimer $name ?';
  }

  @override
  String get privacyIntro =>
      'Vos discussions, souvenirs et fichiers vous appartiennent. Exportez-les à tout moment ou supprimez votre compte.';

  @override
  String get yourData => 'Vos données';

  @override
  String get shareAnalytics => 'Partager les données d\'utilisation';

  @override
  String get shareAnalyticsHelp =>
      'Rapports d\'utilisation et de plantage. Jamais vos messages ni vos fichiers.';

  @override
  String get measureAds => 'Aider à mesurer nos publicités';

  @override
  String get measureAdsHelp =>
      'Permet à Casama d\'indiquer à Meta quand une personne ayant vu notre publicité s\'inscrit ou s\'abonne. Casama n\'affiche jamais de publicités.';

  @override
  String get measureAdsNeedsUsageData =>
      'Activez Partager les données d\'utilisation pour utiliser ceci.';

  @override
  String get trackingTile => 'Autoriser le suivi';

  @override
  String get trackingAllowed =>
      'Autorisé. Le SDK de Meta s\'exécute sur cet appareil et Casama peut informer Meta lorsque vous vous inscrivez ou vous abonnez après avoir vu notre publicité. Modifiez ceci dans Réglages.';

  @override
  String get trackingNotAllowed =>
      'Non autorisé. Rien de cet appareil n\'est envoyé à Meta. Modifiez ceci dans Réglages.';

  @override
  String get trackingNotAsked =>
      'Casama n\'a pas encore demandé. Tant que vous ne l\'autorisez pas, rien de cet appareil n\'est envoyé à Meta.';

  @override
  String get trackingOpenSettings => 'Ouvrir Réglages';

  @override
  String get workspaceAnalytics =>
      'Données d\'utilisation de cet espace de travail';

  @override
  String get workspaceAnalyticsHelp =>
      'Données d\'utilisation de cet espace de travail. Les rapports de plantage restent activés.';

  @override
  String get dangerZone => 'Zone de danger';

  @override
  String get quotasHelp => 'Laissez un champ vide pour aucune limite.';

  @override
  String get serviceOff => 'Désactivé';

  @override
  String get serviceDown => 'Hors service';

  @override
  String get serviceOk => 'OK';

  @override
  String get sendInvite => 'Envoyer l\'invitation';

  @override
  String get thinking0 => 'Modèle';

  @override
  String get saveChanges => 'Enregistrer les modifications';

  @override
  String get autonomyAskAlwaysHelp =>
      'Vérifie avec vous avant chaque action qui modifie quelque chose.';

  @override
  String get autonomyAskRiskyHelp =>
      'Travaille seul, mais demande avant toute action risquée, comme supprimer des fichiers ou dépenser de l\'argent.';

  @override
  String get autonomyAutonomousHelp =>
      'Agit sans demander. Idéal pour les routines de confiance.';

  @override
  String get usageSubtitle => 'Dépenses de modèles ce mois-ci';

  @override
  String get skillsRowHelp =>
      'Instructions que les bots chargent lorsqu\'une tâche le nécessite';

  @override
  String get integrationsRowHelp => 'Serveurs MCP et apps connectées';

  @override
  String get secretsRowHelp =>
      'Jetons et mots de passe, envoyés uniquement là où vous l\'autorisez';

  @override
  String get computersRowHelp =>
      'L\'ordinateur d\'équipe et les ordinateurs privés';

  @override
  String get companionRowHelp =>
      'Autoriser les bots à utiliser les apps et fichiers de cet appareil';

  @override
  String get privacyRowHelp => 'Exporter vos données ou supprimer votre compte';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Aucune intégration pour le moment';

  @override
  String get integrationsHelp =>
      'Les intégrations donnent plus d\'outils aux bots : un serveur MCP, une source OpenAPI, Composio ou Pipedream. Chaque outil porte le nom de son intégration.';

  @override
  String get botIntegrationsHelp =>
      'Activez les intégrations que ce bot peut utiliser. Ses outils apparaîtront lors de sa prochaine exécution.';

  @override
  String get openSettings => 'Ouvrir les réglages';

  @override
  String get noRunsHelp =>
      'Chaque fois que ce bot travaille, depuis une discussion, une routine ou un webhook, l\'exécution apparaît ici avec ce qu\'il a fait et ce qu\'elle a coûté.';

  @override
  String get runCompleted => 'Terminé';

  @override
  String get runWaiting => 'En attente';

  @override
  String get runWorking => 'En cours';

  @override
  String get triggerChat => 'Discussion';

  @override
  String get triggerRoutine => 'Routine';

  @override
  String get noEventsForFilter => 'Rien de ce type dans cette exécution.';

  @override
  String get runStatusFailed => 'Échec';

  @override
  String get runStatusStopped => 'Arrêté';

  @override
  String get quickAskIntro =>
      'Envoyez une demande rapide. Cela démarre une nouvelle discussion avec le bot de votre choix.';

  @override
  String quickAskIntroBot(String name) {
    return 'Envoyez une demande rapide. Cela démarre une nouvelle discussion avec $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return 'Que doit faire $bot ?';
  }

  @override
  String get stateProvisioning => 'Configuration';

  @override
  String get stateStarting => 'Démarrage';

  @override
  String get computerRestoringFiles => 'Restauration des fichiers…';

  @override
  String get stateRunning => 'En cours d\'exécution';

  @override
  String get stateIdle => 'Inactif';

  @override
  String get stateSleeping => 'En veille';

  @override
  String get stateStopped => 'Arrêté';

  @override
  String get stateError => 'Erreur';

  @override
  String get terminalHelp =>
      'Un shell sur cet ordinateur. Les bots utilisent le même, vous pouvez donc voir et corriger ce qu\'ils ont fait.';

  @override
  String get up => 'Dossier parent';

  @override
  String get emptyFolderHelp =>
      'Les fichiers créés par vos bots et ceux que vous importez s\'affichent ici.';

  @override
  String deleteFileTitle(String name) {
    return 'Supprimer $name ?';
  }

  @override
  String get botComputerAuto => 'Automatique';

  @override
  String get botComputerHelp =>
      'Le propre ordinateur du bot : là où il exécute des commandes, navigue et conserve ses fichiers.';

  @override
  String get billingOffTitle => 'Aucune facturation ici';

  @override
  String revokeKeyTitle(String name) {
    return 'Révoquer la clé pour $name ?';
  }

  @override
  String get revokeKeyBody =>
      'Ce serveur cesse immédiatement d\'utiliser des ordinateurs cloud et des crédits.';

  @override
  String get handBackHelp =>
      'Le bot reprend là où vous en étiez. Dites-lui ce que vous avez fait, si cela aide.';

  @override
  String get serverHelp =>
      'Utilisez votre propre serveur Casama. Saisissez l\'adresse configurée par vous ou votre administrateur.';

  @override
  String get ssoHelp =>
      'Saisissez votre e-mail professionnel et nous vous redirigerons vers la page de connexion de votre entreprise.';

  @override
  String get colorScheme => 'Palette de couleurs';

  @override
  String get searchThemes => 'Rechercher une palette';

  @override
  String get noThemesFound => 'Aucune palette correspondante.';

  @override
  String get noAppsMatch =>
      'Aucune app ne correspond. Vous pouvez ajouter votre propre serveur sous Avancé.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '$count app',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'Toutes';

  @override
  String get familyPurple => 'Violet';

  @override
  String get familyBlue => 'Bleu';

  @override
  String get familyTeal => 'Turquoise';

  @override
  String get familyGreen => 'Vert';

  @override
  String get familyWarm => 'Chaud';

  @override
  String get familyRed => 'Rouge et rose';

  @override
  String get familyNeutral => 'Neutre';

  @override
  String get background => 'Arrière-plan';

  @override
  String get backgroundPattern => 'Motif';

  @override
  String get backgroundColors => 'Couleurs';

  @override
  String get backgroundThemeColors => 'Thème';

  @override
  String get patternStrength => 'Intensité du motif';

  @override
  String get wallpaperEverywhere => 'Afficher sur tous les écrans';

  @override
  String get wallpaperEverywhereHelp =>
      'Désactivez pour le garder uniquement derrière les discussions.';

  @override
  String get resetBackground => 'Rétablir par défaut';

  @override
  String get copyMessage => 'Copier';

  @override
  String get selectText => 'Sélectionner le texte';

  @override
  String get shareMessage => 'Partager';

  @override
  String get messageCopied => 'Copié';

  @override
  String get botUiBroken =>
      'Cette partie de la réponse n\'a pas pu être affichée.';

  @override
  String get botUiSent => 'Envoyé';

  @override
  String get botUiConnected => 'Connecté';

  @override
  String get draftNewEmail => 'Nouvel e-mail';

  @override
  String get draftNewMessage => 'Nouveau message';

  @override
  String get draftNewPost => 'Nouvelle publication';

  @override
  String get draftReadyToSend => 'Prêt à envoyer';

  @override
  String get draftReadyToPost => 'Prêt à publier';

  @override
  String get draftEdited => 'Modifié';

  @override
  String get draftSendEmail => 'Envoyer l\'e-mail';

  @override
  String get draftSend => 'Envoyer';

  @override
  String get draftPost => 'Publier';

  @override
  String get draftDiscard => 'Ignorer';

  @override
  String get draftEdit => 'Modifier';

  @override
  String get draftDoneEditing => 'Terminé';

  @override
  String get draftFrom => 'De';

  @override
  String get draftTo => 'À';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Cci';

  @override
  String get draftSubject => 'Objet';

  @override
  String get botCardNewEvent => 'Nouvel événement';

  @override
  String get botCardEvent => 'Événement';

  @override
  String get botCardReadyToAdd => 'Prêt à ajouter';

  @override
  String get botCardAddToCalendar => 'Ajouter au calendrier';

  @override
  String get botCardChange => 'Modifier';

  @override
  String get botCardSkip => 'Ignorer';

  @override
  String get botCardAllDay => 'Toute la journée';

  @override
  String botCardMore(int count) {
    return '+$count autres';
  }

  @override
  String get botCardAgenda => 'Agenda';

  @override
  String get botCardMessages => 'Messages';

  @override
  String botCardUnread(int count) {
    return '$count non lus';
  }

  @override
  String get botCardReply => 'Répondre';

  @override
  String botCardReplyTo(String name) {
    return 'Répondre à $name';
  }

  @override
  String get botCardTasks => 'Tâches';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done sur $total terminées';
  }

  @override
  String get botCardSaveChanges => 'Enregistrer les modifications';

  @override
  String get botCardChoose => 'Choisir';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'De qui s\'agit-il ?';

  @override
  String get botCardNoneOfThese => 'Aucun de ceux-ci';

  @override
  String get botCardReminder => 'Rappel';

  @override
  String get botCardRoutine => 'Routine';

  @override
  String get botCardWatcher => 'En suivi';

  @override
  String get botCardScheduled => 'Programmé';

  @override
  String botCardNext(String when) {
    return 'Prochaine : $when';
  }

  @override
  String get botCardCancelIt => 'Annuler';

  @override
  String get botIcon => 'Icône';

  @override
  String get botIconInitials => 'Initiales';

  @override
  String get errorDetailsTitle => 'Ce qui n\'a pas fonctionné';

  @override
  String get exportLabel => 'Exporter';

  @override
  String get openTimeline => 'Ouvrir la chronologie des exécutions';

  @override
  String get details => 'Détails';

  @override
  String get themes => 'Thèmes';

  @override
  String get myThemes => 'Vos thèmes';

  @override
  String get saveTheme => 'Enregistrer le thème actuel';

  @override
  String get themeName => 'Nom du thème';

  @override
  String get importTheme => 'Importer un thème';

  @override
  String get themeCode => 'Code du thème';

  @override
  String get themeCodeHelp =>
      'Collez un code partagé avec vous. Il commence par casama-theme:';

  @override
  String get invalidThemeCode => 'Ce n\'est pas un code de thème Casama.';

  @override
  String themeImported(String name) {
    return '$name ajouté à vos thèmes';
  }

  @override
  String get themeCodeCopied =>
      'Code du thème copié. N\'importe qui peut le coller dans Apparence → Importer un thème.';

  @override
  String get shareTheme => 'Partager le code';

  @override
  String deleteThemeTitle(String name) {
    return 'Supprimer $name ?';
  }

  @override
  String get fonts => 'Polices';

  @override
  String get headingFont => 'Titres';

  @override
  String get bodyFont => 'Texte';

  @override
  String get fontsHelp =>
      'Google Sans et Noto Serif sont intégrées à l\'app et fonctionnent hors ligne. Les autres Google Fonts se téléchargent la première fois que vous les choisissez.';

  @override
  String get searchFonts => 'Rechercher dans toutes les Google Fonts';

  @override
  String get suggestedFonts => 'Suggérées';

  @override
  String get allFonts => 'Toutes les Google Fonts';

  @override
  String get noFontsFound => 'Aucune police avec ce nom';

  @override
  String get resetFonts => 'Utiliser les valeurs par défaut';

  @override
  String get fontSample => 'Vos bots, qui travaillent à vos côtés.';

  @override
  String get backgroundPhoto => 'Photo';

  @override
  String get yourPhoto => 'Votre photo';

  @override
  String get browsePhotos => 'Parcourir les photos';

  @override
  String get removePhoto => 'Retirer la photo';

  @override
  String get photoBlur => 'Flou';

  @override
  String get photoDim => 'Assombrir';

  @override
  String photoBy(String name) {
    return 'Photo de $name sur Unsplash';
  }

  @override
  String get searchPhotos => 'Rechercher des photos';

  @override
  String get photosUnavailable => 'Impossible de charger les photos.';

  @override
  String get noPhotos => 'Aucune photo trouvée';

  @override
  String get photoHelp =>
      'Une photo s\'affiche sous les motifs. Le flou et l\'assombrissement gardent le texte lisible par-dessus.';

  @override
  String get periodToday => 'Aujourd\'hui';

  @override
  String get periodWeek => 'Cette semaine';

  @override
  String get periodYear => 'Cette année';

  @override
  String get totalSpend => 'Dépense';

  @override
  String get tokensIn => 'Jetons en entrée';

  @override
  String get tokensOut => 'Jetons en sortie';

  @override
  String get runsLabel => 'Exécutions';

  @override
  String get spendByDay => 'Dépenses par jour';

  @override
  String get byBot => 'Par bot';

  @override
  String get byModel => 'Par modèle';

  @override
  String get everythingMetered => 'Tout est mesuré';

  @override
  String get bySource => 'Par source';

  @override
  String get byPerson => 'Par personne';

  @override
  String get usageAllBots => 'Tous les bots';

  @override
  String get usageAllModels => 'Tous les modèles';

  @override
  String get usageAllSources => 'Toutes les sources';

  @override
  String get usageEveryone => 'Tout le monde';

  @override
  String get usageJustMe => 'Moi uniquement';

  @override
  String get usageClearFilters => 'Effacer';

  @override
  String get usageFilterBot => 'Filtrer par bot';

  @override
  String get usageFilterModel => 'Filtrer par modèle';

  @override
  String get usageFilterSource => 'Filtrer par source';

  @override
  String get usageFilterPerson => 'Filtrer par personne';

  @override
  String get usageSourceChat => 'Discussions';

  @override
  String get usageSourceChatApp => 'Apps de messagerie';

  @override
  String get usageSourceRoutine => 'Routines';

  @override
  String get usageSourceApi => 'API et autres agents';

  @override
  String get usageSourceOther => 'Autre';

  @override
  String get usageNoPerson => 'Automatique';

  @override
  String get usageUnnamedPerson => 'Membre sans nom';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n exécutions',
      one: '$n exécution',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Exporter en CSV';

  @override
  String get exportJson => 'Exporter en JSON';

  @override
  String get askBotAboutUsage => 'Demander à un bot à ce sujet';

  @override
  String get noUsageYet =>
      'Aucune utilisation sur cette période pour l\'instant.';

  @override
  String get otherModel => 'Ordinateurs et autres';

  @override
  String get deletedBot => 'Non lié à un bot';

  @override
  String get usageHelp =>
      'Les coûts sont estimés à partir du nombre de jetons et des tarifs publiés. La facture de votre fournisseur de modèles fait foi.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Voici mon utilisation de Casama pour $period. Aidez-moi à comprendre où part l\'argent et comment dépenser moins. Vous pouvez aussi vérifier les chiffres en direct avec votre outil d\'utilisation.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Entrée du modèle';

  @override
  String get kindTokensOut => 'Sortie du modèle';

  @override
  String get kindComputer => 'Temps d\'ordinateur cloud';

  @override
  String get kindModels => 'Modèles d\'IA';

  @override
  String get creditsThisMonth => 'Crédits de ce mois-ci';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent % utilisés';
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
      other: 'Environ $nString exécutions restantes à votre coût habituel',
      one: 'Environ $nString exécution restante à votre coût habituel',
      zero: 'Moins d\'une exécution restante à votre coût habituel',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Vous n\'avez plus de crédits. Ajoutez-en pour que vos bots continuent de travailler.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 crédit = $price. Votre forfait ajoute $amount chaque mois ; les crédits non utilisés sont reportés un mois de plus.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 crédit = $price. Les packs de crédits de l\'App Store ou de Google Play n\'expirent jamais ; les packs de crédits achetés sur le web durent 12 mois.';
  }

  @override
  String get creditsDailyLabel => 'Limite du jour';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used sur $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Ce que votre forfait peut dépenser chaque jour sur les modèles, la voix et les apps de Casama, quels que soient les crédits restants.';

  @override
  String get creditsDailyReached =>
      'La limite du jour est atteinte, vos bots sont donc en pause. Passez à un forfait supérieur pour augmenter la limite quotidienne.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Réinitialisation dans environ $n heures.',
      one: 'Réinitialisation dans environ $n heure.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon =>
      'Réinitialisation dans moins d\'une heure.';

  @override
  String get creditsHoursLabel => 'Heures d\'ordinateur';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used sur $limit h';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Temps d\'exécution des ordinateurs de vos bots ce mois-ci. Une fois épuisé, la discussion continue de fonctionner ; seul l\'ordinateur s\'arrête. Réinitialisation le $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Les heures d\'ordinateur de ce mois-ci sont épuisées, votre ordinateur ne peut donc pas démarrer. La discussion fonctionne toujours. Réinitialisation le $date. Passez à un forfait supérieur pour plus d\'heures.';
  }

  @override
  String get kindStream => 'Vue en direct';

  @override
  String get kindTts => 'Lire à voix haute';

  @override
  String get computerMissingTitle => 'Ordinateur introuvable';

  @override
  String get computerMissingHelp =>
      'Il a peut-être été supprimé, ou la liste n\'est plus à jour. Actualisez pour vérifier à nouveau.';

  @override
  String get computerMissingBotHelp =>
      'L\'ordinateur de ce bot a peut-être été supprimé, ou la liste n\'est plus à jour. Actualisez ou choisissez un autre ordinateur pour ce bot.';

  @override
  String get computerChoose => 'Choisir un ordinateur';

  @override
  String get personaWork => 'Travail';

  @override
  String get personaResearch => 'Recherche';

  @override
  String get personaBuild => 'Développement';

  @override
  String get personaCreate => 'Création';

  @override
  String get personaLife => 'Vie perso';

  @override
  String get personaOther => 'Autre';

  @override
  String get blankBotHelp =>
      'Partez de zéro et rédigez vos propres instructions.';

  @override
  String get browse => 'Parcourir';

  @override
  String get browseAllPersonas => 'Tout parcourir';

  @override
  String get botIdentity => 'Nom et icône';

  @override
  String get serviceKeys => 'Clés de service';

  @override
  String get noServiceKeys => 'Aucune clé de service pour l\'instant.';

  @override
  String get serviceKeysHelp =>
      'Vos propres clés de recherche, de cartes ou de données';

  @override
  String get serviceKeysIntro =>
      'Casama fait tourner les modèles, la voix et les images pour vous. Ajoutez une clé ici uniquement pour utiliser votre propre service de recherche, de cartes ou de données. Les clés sont stockées chiffrées et ne sont plus affichées.';

  @override
  String get choosePersona => 'Choisir un profil';

  @override
  String get choosePersonaHelp =>
      'Chacun inclut des instructions, un style, et parfois des compétences et des routines. Vous pouvez tout modifier ensuite.';

  @override
  String get searchPersonas => 'Rechercher des profils';

  @override
  String get noPersonasFound => 'Aucun profil ne correspond';

  @override
  String get previewPersona => 'Aperçu';

  @override
  String get personaInstructions => 'Instructions';

  @override
  String get personaTryAsking => 'Essayez de demander';

  @override
  String usePersona(String name) {
    return 'Utiliser $name';
  }

  @override
  String get loadPersona => 'Charger un profil';

  @override
  String get replaceInstructionsTitle => 'Remplacer les instructions ?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Les instructions actuelles du bot seront remplacées par celles de $name. Les compétences et routines restent inchangées.';
  }

  @override
  String get replace => 'Remplacer';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle =>
      'Donnez à vos bots les outils que votre équipe utilise déjà.';

  @override
  String get connectedTab => 'Connectées';

  @override
  String get browseTab => 'Parcourir';

  @override
  String get searchApps => 'Rechercher des apps';

  @override
  String get popularApps => 'Populaires';

  @override
  String get allApps => 'Toutes les apps';

  @override
  String get appCatDeveloper => 'Développement';

  @override
  String get appCatProductivity => 'Productivité';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Paiements';

  @override
  String get appCatDesign => 'Design';

  @override
  String get appCatSales => 'Ventes et support';

  @override
  String get appCatData => 'Données et recherche';

  @override
  String get appCatAutomation => 'Automatisation';

  @override
  String get authOneClick => 'En un clic';

  @override
  String get authApiKey => 'Clé API';

  @override
  String get authNone => 'Sans connexion';

  @override
  String get authAdminSetup => 'À configurer';

  @override
  String get connectedBadge => 'Connectée';

  @override
  String get whatBotsCanDo => 'Ce que vos bots peuvent faire';

  @override
  String continueWith(String app) {
    return 'Continuer avec $app';
  }

  @override
  String get signInTab => 'Se connecter';

  @override
  String get connectNoSignIn => 'Cette app fonctionne sans connexion.';

  @override
  String finishSignIn(String app) {
    return 'Terminer la connexion à $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app s\'est ouverte dans votre navigateur. Approuvez l\'accès là-bas et ceci se mettra à jour tout seul.';
  }

  @override
  String get reopenSignIn => 'Rouvrir la page de connexion';

  @override
  String appConnected(String app) {
    return '$app est connectée';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app est déjà connectée dans cet espace de travail. Utilisez cette connexion ou ajoutez un autre compte.';
  }

  @override
  String get useConnection => 'L\'utiliser';

  @override
  String get addAnotherAccount => 'Ajouter un autre compte';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString outils sont prêts pour vos bots.',
      one: '$countString outil est prêt pour vos bots.',
      zero: 'Prêt à l\'emploi.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Quels bots peuvent l\'utiliser ?';

  @override
  String get whichBotsHelp =>
      'Les bots demandent toujours votre accord avant toute action risquée.';

  @override
  String get doneLabel => 'Terminé';

  @override
  String openApp(String app) {
    return 'Ouvrir $app';
  }

  @override
  String get pasteLabel => 'Coller';

  @override
  String get connectingLabel => 'Connexion…';

  @override
  String get connectFailedTitle => 'Connexion impossible';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Ou connectez $app via l\'un de ces services. Connectez-vous une fois, puis demandez à votre bot d\'utiliser $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'La session est stockée chiffrée et n\'est plus jamais affichée. Déconnexion possible à tout moment.';

  @override
  String get composioHelp =>
      'Des centaines d\'apps, avec connexion gérée pour vous.';

  @override
  String get pipedreamHelp => 'Des milliers d\'apps via Pipedream Connect.';

  @override
  String get customServer => 'Serveur personnalisé';

  @override
  String get customServerHelp =>
      'Tout serveur MCP ou spécification OpenAPI. Pour les développeurs.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Utilisé par $countString bots',
      one: 'Utilisé par $countString bot',
      zero: 'Attribué à aucun bot pour l\'instant',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Prêt';

  @override
  String get statusNeedsAttention => 'Attention requise';

  @override
  String get statusChecking => 'Vérification';

  @override
  String get toolsHelp =>
      'Les outils en lecture seule s\'exécutent seuls. Les outils qui effectuent des modifications demandent d\'abord votre accord lorsqu\'un bot a lu du contenu non fiable, et ceux marqués « Demande toujours » vous attendent à chaque fois.';

  @override
  String get botsWithAccess => 'Bots avec accès';

  @override
  String get reconnect => 'Reconnecter';

  @override
  String get disconnect => 'Déconnecter';

  @override
  String disconnectTitle(String app) {
    return 'Déconnecter $app ?';
  }

  @override
  String get disconnectBody =>
      'Les bots perdent aussitôt accès à ses outils et la connexion enregistrée est supprimée.';

  @override
  String get testConnection => 'Tester la connexion';

  @override
  String get signedInOAuth => 'Connecté avec votre compte';

  @override
  String get signedInKey => 'Connecté avec une clé API';

  @override
  String get signedInNone => 'Aucune connexion requise';

  @override
  String get noConnectionsTitle => 'Connecter votre première app';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail et plus. La plupart prennent un clic.';

  @override
  String get browseApps => 'Parcourir les apps';

  @override
  String providerSetupTitle(String provider) {
    return 'Connecter $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider se connecte aux apps pour vous, vous n\'avez donc jamais à manipuler leurs clés.';
  }

  @override
  String get getFreeKey => 'Obtenir une clé gratuite';

  @override
  String connectedThroughHub(String provider) {
    return 'Via $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Apps via $provider';
  }

  @override
  String get addAnApp => 'Ajouter une app';

  @override
  String searchProviderApps(String provider) {
    return 'Rechercher les apps $provider';
  }

  @override
  String get accountConnected => 'Connecté';

  @override
  String get accountPending => 'En attente de connexion';

  @override
  String get accountError => 'Problème de connexion';

  @override
  String get providerReconnectHint =>
      'Connectez-vous directement avec Casama pour réduire les coûts d\'appel aux apps';

  @override
  String get noProviderAccounts =>
      'Aucune app pour l\'instant. Ajoutez-en une et connectez-vous-y.';

  @override
  String get projectId => 'ID du projet';

  @override
  String get toolRiskLow => 'Lecture seule';

  @override
  String get toolRiskMedium => 'Apporte des modifications';

  @override
  String get toolRiskHigh => 'Demande toujours';

  @override
  String get askWhichBot => 'Quel bot doit examiner ceci ?';

  @override
  String get computerWake => 'Réveiller';

  @override
  String get computerAsleepTitle => 'L\'ordinateur est en veille';

  @override
  String get computerAsleepFilesHelp =>
      'Réveillez-le pour voir et importer ses fichiers.';

  @override
  String get computerFilesTimedOut =>
      'Les fichiers ont mis trop de temps à charger. Vérifiez que l\'ordinateur est allumé, puis réessayez.';

  @override
  String get computerGoingToSleep => 'Mise en veille';

  @override
  String get liveViewWakesHelp =>
      'Cet ordinateur est en veille. Ouvrir la vue en direct le réveille ; il se remet en veille après un moment d\'inactivité.';

  @override
  String get wakeAndWatch => 'Réveiller et regarder en direct';

  @override
  String get chatGptPlan => 'Forfait ChatGPT';

  @override
  String get continueWithChatGpt => 'Continuer avec ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Faites tourner vos bots sur votre forfait ChatGPT plutôt qu\'avec une clé API. Leurs appels de modèle sont décomptés des limites de votre forfait, et personne d\'autre que vous ne peut l\'utiliser.';

  @override
  String get chatGptDesktopOnly =>
      'Pour connecter votre forfait ChatGPT, ouvrez l\'app de bureau ou exécutez « casama credential chatgpt » dans le CLI.';

  @override
  String get chatGptWaiting =>
      'Terminez la connexion avec ChatGPT dans votre navigateur…';

  @override
  String chatGptConnected(String account) {
    return 'Votre forfait ChatGPT est connecté ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'La connexion a réussi, mais l\'utilisation du forfait n\'a pas été autorisée. Reconnectez-vous et autorisez-la, ou ajoutez une clé API.';

  @override
  String get orAddApiKey => 'Ou ajoutez une clé API';

  @override
  String get planOnlyYou => 'Personne d\'autre ne peut l\'utiliser';

  @override
  String get planOtherMember => 'Forfait d\'un autre membre';

  @override
  String get planConnected => 'Connecté';

  @override
  String get planUsageOff => 'Utilisation du forfait désactivée';

  @override
  String get planNeedsReconnect => 'Se reconnecter';

  @override
  String get useNextModelAtLimit =>
      'Utiliser le modèle suivant du bot à la limite de mon forfait';

  @override
  String get useNextModelAtLimitHelp =>
      'Désactivé : une exécution s\'arrête quand votre limite ChatGPT est atteinte. Activé : elle continue sur le modèle suivant du bot, ce qui peut coûter de l\'argent.';

  @override
  String get manageUsage => 'Gérer l\'utilisation';

  @override
  String get removeKey => 'Retirer';

  @override
  String removeKeyConfirm(String label) {
    return 'Retirer $label ? Les bots qui l\'utilisent cessent de fonctionner jusqu\'à ce que vous leur donniez une autre clé.';
  }

  @override
  String get removeKeyChatGptNote =>
      'Votre connexion ChatGPT est également révoquée.';

  @override
  String modelFallbackNotice(String message) {
    return 'Passage au modèle suivant : $message';
  }

  @override
  String get twoStepSignIn => 'Connexion en deux étapes';

  @override
  String get twoStepHelp =>
      'Demander un code depuis une app d\'authentification à chaque connexion.';

  @override
  String get signInWithPasskey => 'Se connecter avec une clé d\'accès';

  @override
  String get account => 'Compte';

  @override
  String get accountRow => 'E-mail, mot de passe et déconnexion partout';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get newPasswordAgain => 'Confirmer le nouveau mot de passe';

  @override
  String get passwordsDontMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get newPasswordTitle => 'Choisir un nouveau mot de passe';

  @override
  String get newPasswordBody =>
      'Connexion réussie. Choisissez un nouveau mot de passe pour vous connecter avec votre e-mail.';

  @override
  String get savePassword => 'Enregistrer le mot de passe';

  @override
  String get passwordSaved => 'Mot de passe enregistré.';

  @override
  String get passwordTitle => 'Mot de passe';

  @override
  String get passwordRow =>
      'Définir ou modifier le mot de passe de connexion par e-mail';

  @override
  String get passwordHelp =>
      'Utilisez au moins 6 caractères. Vous pouvez toujours vous connecter avec Google, Apple, une clé d\'accès ou un lien par e-mail.';

  @override
  String passwordCodeSent(String email) {
    return 'Pour protéger votre compte, saisissez le code que nous venons d\'envoyer à $email.';
  }

  @override
  String get changeEmailTitle => 'Changer d\'e-mail';

  @override
  String get changeEmailHelp =>
      'Nous enverrons un lien de confirmation par e-mail à votre adresse actuelle et à la nouvelle. Le changement s\'effectue une fois les deux confirmées.';

  @override
  String get newEmail => 'Nouvel e-mail';

  @override
  String get changeEmailSend => 'Envoyer la confirmation';

  @override
  String get changeEmailRow => 'Changer l\'adresse e-mail de connexion';

  @override
  String changeEmailSent(String email) {
    return 'Vérifiez vos deux boîtes de réception. $email devient votre e-mail une fois les deux liens confirmés.';
  }

  @override
  String changeEmailPending(String email) {
    return 'En attente de confirmation : $email';
  }

  @override
  String get signOutEverywhere => 'Se déconnecter partout';

  @override
  String get signOutEverywhereHelp =>
      'Chaque téléphone, ordinateur et navigateur, y compris celui-ci';

  @override
  String get signOutEverywhereConfirm =>
      'Vous déconnecter sur tous les appareils, y compris celui-ci ? Utilisez ceci si vous avez perdu un appareil ou pensez que quelqu\'un d\'autre est connecté.';

  @override
  String get passkeySuggestTitle =>
      'Se connecter plus vite la prochaine fois ?';

  @override
  String get passkeySuggestBody =>
      'Ajoutez une clé d\'accès et connectez-vous avec Face ID, votre empreinte ou le verrouillage d\'écran. Aucun mot de passe ni e-mail requis.';

  @override
  String get passkeys => 'Clés d\'accès';

  @override
  String get passkeysRow =>
      'Se connecter avec Face ID, une empreinte ou le verrouillage d\'écran';

  @override
  String get passkeysHelp =>
      'Une clé d\'accès vous connecte avec Face ID, votre empreinte ou le verrouillage d\'écran, sans mot de passe ni e-mail. Chaque téléphone, ordinateur ou gestionnaire de mots de passe garde la sienne.';

  @override
  String get passkeyAdd => 'Ajouter une clé d\'accès';

  @override
  String get passkeyAddAnother => 'Ajouter une autre clé d\'accès';

  @override
  String get passkeyAdded =>
      'Clé d\'accès ajoutée. La prochaine fois, connectez-vous avec.';

  @override
  String get passkeyRename => 'Renommer';

  @override
  String get passkeyRenameTitle => 'Renommer la clé d\'accès';

  @override
  String get passkeyNameLabel => 'Nom';

  @override
  String get passkeyRemove => 'Retirer';

  @override
  String passkeyRemoveConfirm(String name) {
    return 'Retirer « $name » ? Vous ne pourrez plus vous en servir pour vous connecter.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Ajoutée $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Dernière utilisation $when';
  }

  @override
  String get twoStepSetUp => 'Configurer une app d\'authentification';

  @override
  String get twoStepAddAnother => 'Ajouter un autre authentificateur';

  @override
  String get twoStepScan =>
      'Scannez ce code avec une app d\'authentification (comme 1Password, Google Authenticator ou Authy), ou saisissez la clé de configuration, puis entrez le code à 6 chiffres affiché.';

  @override
  String get twoStepKey => 'Clé de configuration';

  @override
  String get twoStepCode => 'Code à 6 chiffres';

  @override
  String get twoStepVerify => 'Vérifier';

  @override
  String get twoStepNowOn => 'La connexion en deux étapes est activée.';

  @override
  String get twoStepAuthenticators => 'Apps d\'authentification';

  @override
  String get twoStepRename => 'Renommer';

  @override
  String get twoStepRenameTitle => 'Renommer l\'authentificateur';

  @override
  String get twoStepNameLabel => 'Nom';

  @override
  String get twoStepNameHint => 'Par exemple : Téléphone pro';

  @override
  String get twoStepRemove => 'Retirer';

  @override
  String get twoStepRemoveConfirm =>
      'Retirer cette app d\'authentification ? Si c\'est la seule, vous vous connecterez uniquement avec votre mot de passe.';

  @override
  String get twoStepPromptTitle => 'Saisissez votre code';

  @override
  String get twoStepPromptBody =>
      'Ouvrez votre app d\'authentification et saisissez le code à 6 chiffres pour terminer la connexion.';

  @override
  String get twoStepPromptAccount => 'Connexion en tant que';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Nouveau mot de passe pour';

  @override
  String get connectAiAppAccount => 'Elle obtient accès à';

  @override
  String joinAsAccount(String email, String server) {
    return 'Vous rejoindrez l\'espace sur $server avec $email.';
  }

  @override
  String get requireTwoStep =>
      'Exiger la connexion en deux étapes pour les propriétaires et admins';

  @override
  String get requireTwoStepHelp =>
      'Les propriétaires et admins doivent l\'utiliser. Activez d\'abord la vôtre.';

  @override
  String get twoStepNeededForAdmin =>
      'Cet espace de travail exige la connexion en deux étapes pour les propriétaires et admins. Configurez-la ou reconnectez-vous avec votre code pour accéder aux réglages d\'administration.';

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
  String get suspendWorkspace => 'Suspendre';

  @override
  String get unsuspendWorkspace => 'Lever la suspension';

  @override
  String get suspendReason => 'Motif';

  @override
  String get suspendWorkspaceHelp =>
      'Ses ordinateurs s\'arrêtent et ses bots cessent de fonctionner. Rien n\'est supprimé et vous pouvez lever la suspension à tout moment.';

  @override
  String workspaceSuspended(String reason) {
    return 'Suspendu : $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Cet espace de travail est suspendu : les bots ne peuvent pas s\'exécuter et les ordinateurs ne peuvent pas démarrer. Contactez l\'administrateur de ce serveur.';

  @override
  String get abuseKind_mining_pool => 'Minage de crypto bloqué';

  @override
  String get abuseKind_blocked_port => 'Port mail bloqué';

  @override
  String get abuseKind_egress_flood => 'Trafic excessif';

  @override
  String get abuseKind_signup_blocked => 'Inscription refusée';

  @override
  String get abuseKind_suspended => 'Espace de travail suspendu';

  @override
  String get abuseKind_unsuspended => 'Suspension levée';

  @override
  String get kindLocalMcp => 'Sur un ordinateur';

  @override
  String get capMcp => 'Outils locaux (MCP)';

  @override
  String get localMcpServers => 'Outils locaux (MCP)';

  @override
  String get localMcpHelp =>
      'Serveurs MCP sur cet ordinateur ou votre réseau que vos bots peuvent utiliser, comme T3 Code, Claude Code, Codex ou des apps de design. Leurs jetons et identifiants restent sur cet ordinateur.';

  @override
  String get localMcpAdd => 'Ajouter un serveur MCP local';

  @override
  String get localMcpEmpty => 'Aucun serveur MCP local pour l\'instant.';

  @override
  String get localMcpName => 'Nom';

  @override
  String get localMcpStdio => 'Une commande';

  @override
  String get localMcpLoopback => 'Une adresse';

  @override
  String get localMcpCommand => 'Commande';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Adresse';

  @override
  String get localMcpFolder => 'Dossier de travail (facultatif)';

  @override
  String get localMcpEnv =>
      'Environnement (une ligne KEY=value par variable, conservé sur cet ordinateur)';

  @override
  String get localMcpNeedsCapability =>
      'Activez Outils locaux (MCP) ci-dessus pour que les bots puissent les utiliser.';

  @override
  String get localMcpBadUrl =>
      'Utilisez une adresse http:// sur cet ordinateur ou votre propre réseau, comme http://127.0.0.1:3845/mcp, ou une adresse https://.';

  @override
  String get localMcpBadFolder =>
      'Choisissez un dossier à l\'intérieur d\'un des dossiers partagés.';

  @override
  String get codingAgents => 'Agents de code';

  @override
  String get codingAgentsHelp =>
      'Les bots peuvent confier des tâches de code à ces agents sur cet ordinateur. Ils utilisent vos propres identifiants et travaillent dans les dossiers que vous partagez.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString agents de code trouvés',
      one: '$nString agent de code trouvé',
      zero: 'Aucun agent de code trouvé',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Ce serveur n\'est pas encore enregistré dans l\'espace de travail. Retirez-le et ajoutez-le à nouveau.';

  @override
  String get localMcpSignInKind => 'Connexion';

  @override
  String get localMcpAuthNone => 'Aucune';

  @override
  String get localMcpAuthToken => 'Jeton';

  @override
  String get localMcpAuthHeader => 'En-tête';

  @override
  String get localMcpAuthOAuth => 'Navigateur';

  @override
  String get localMcpToken => 'Jeton (conservé sur cet ordinateur)';

  @override
  String get localMcpHeaderName => 'Nom de l\'en-tête';

  @override
  String get localMcpHeaderValue =>
      'Valeur de l\'en-tête (conservée sur cet ordinateur)';

  @override
  String get localMcpOAuthHelp =>
      'Casama ouvre votre navigateur pour vous connecter à ce serveur. La session reste sur cet ordinateur.';

  @override
  String get localMcpNetworkWarning =>
      'Ce serveur n\'est pas sur cet ordinateur. Les bots qui peuvent utiliser cet ordinateur peuvent le joindre.';

  @override
  String get localMcpSignIn => 'Se connecter';

  @override
  String get localMcpNeedsSignIn => 'Connexion requise';

  @override
  String get localMcpEdit => 'Modifier le serveur MCP local';

  @override
  String get localMcpImport => 'Ajouter depuis d\'autres apps';

  @override
  String get localMcpImportHelp =>
      'Serveurs MCP déjà configurés dans T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex ou Windsurf sur cet ordinateur.';

  @override
  String get localMcpImportNone =>
      'Aucun serveur MCP trouvé dans d\'autres apps sur cet ordinateur.';

  @override
  String get localMcpImportAdded => 'Déjà ajouté';

  @override
  String get localMcpImportRemote =>
      'Sur internet, donc généralement ajouté dans Connexions. Ajoutez-le ici uniquement si seul cet ordinateur peut y accéder.';

  @override
  String get mcpQuestionDecline => 'Refuser';

  @override
  String get mcpQuestionSend => 'Envoyer';

  @override
  String get cardMcpQuestion => 'Question';

  @override
  String get cardMcpSignIn => 'Connexion';

  @override
  String get mcpSignInHereHelp =>
      'Connectez-vous pour que vos bots puissent l\'utiliser à nouveau.';

  @override
  String localMcpSignedIn(String name) {
    return 'Connecté à $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'Depuis $source';
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
      other: 'Ajouter $nString serveurs',
      one: 'Ajouter $nString serveur',
      zero: 'Ajouter',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (conservé sur cet ordinateur)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name demande que vous vous connectiez';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Ouvrez Casama sur $device et connectez-vous là-bas.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Ouvrez Casama sur l\'ordinateur où cet outil s\'exécute et connectez-vous là-bas.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection demande';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return 'Répondu à $connection';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Question de $connection refusée';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Question de $connection fermée';
  }

  @override
  String get codingAgentsNone =>
      'Aucun agent de code trouvé. Installez Claude Code, Codex ou l\'agent en ligne de commande de Cursor pour leur confier des tâches de code.';

  @override
  String get codingAgentsNeedShell =>
      'Les agents de code s\'exécutent via des commandes ; Exécuter des commandes doit donc être activé.';

  @override
  String get allowCommands => 'Activer';

  @override
  String get codingAgentAllow => 'Autoriser';

  @override
  String get codingAgentAllowed => 'Autorisé';

  @override
  String get codingAgentsAllowHelp =>
      'Un agent marqué Autoriser ne s\'est pas encore exécuté sur cet ordinateur. Autorisez-le une fois pour que les bots puissent lui confier des tâches.';

  @override
  String get ownAgentsAdd => 'Ajouter le vôtre';

  @override
  String get ownAgentYours => 'Le vôtre';

  @override
  String get ownAgentNotFound => 'Introuvable sur cet ordinateur';

  @override
  String get ownAgentsHelp =>
      'Vos propres agents s\'exécutent uniquement sur cet ordinateur, dans les discussions qui agissent pour vous. Personne d\'autre dans l\'espace de travail ne peut les voir ni les modifier.';

  @override
  String get ownAgentFormTitle => 'Ajouter votre propre agent';

  @override
  String get ownAgentEditTitle => 'Modifier votre agent';

  @override
  String get ownAgentName => 'Nom';

  @override
  String get ownAgentBin => 'Nom de la commande';

  @override
  String get ownAgentCommand => 'Commande';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Placez $task à l\'emplacement de la tâche ; Casama l\'encadre automatiquement. Chaque commande doit commencer par le nom de la commande. Vous pouvez aussi utiliser $folder, et $result_file si l\'agent écrit sa réponse dans un fichier.';
  }

  @override
  String get ownAgentResult => 'Lecture de la réponse';

  @override
  String get ownAgentResultTail => 'La fin de sa sortie';

  @override
  String get ownAgentResultJson => 'Une ligne JSON avec un champ result';

  @override
  String get ownAgentResultStream => 'Un flux de lignes JSON';

  @override
  String get ownAgentResultField => 'Un champ JSON';

  @override
  String get ownAgentResultFile => 'Écrite dans un fichier';

  @override
  String get ownAgentResultFieldName => 'Nom du champ';

  @override
  String get ownAgentTimeLimit => 'Limite de temps (minutes)';

  @override
  String get ownAgentTest => 'Tester';

  @override
  String get ownAgentTestHelp =>
      'Le test lui demande de répondre uniquement par le mot pong sur cet ordinateur et affiche ce qu\'il a renvoyé.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Il a répondu : $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Il n\'a pas répondu comme prévu (code de sortie $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Il n\'a pas terminé à temps.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Renseignez un nom, un nom de commande et une commande contenant $task.';
  }

  @override
  String get board => 'Tableau';

  @override
  String get newTicket => 'Nouveau ticket';

  @override
  String get newTicketSubtitle =>
      'Une tâche pour l\'un de vos bots, suivie sur le tableau.';

  @override
  String get allProjects => 'Tous les projets';

  @override
  String get manageProjects => 'Gérer les projets';

  @override
  String get filterByProject => 'Filtrer par projet';

  @override
  String get moveTo => 'Déplacer vers';

  @override
  String get noMatchingTickets => 'Aucun ticket correspondant';

  @override
  String get noMatchingTicketsHelp =>
      'Aucun ticket ne correspond à ces filtres.';

  @override
  String get clearFilters => 'Effacer les filtres';

  @override
  String get ticketTitle => 'Titre';

  @override
  String get ticketDetails => 'Détails';

  @override
  String get taskInReview => 'En révision';

  @override
  String get priority => 'Priorité';

  @override
  String get priorityUrgent => 'Urgente';

  @override
  String get priorityHigh => 'Élevée';

  @override
  String get priorityMedium => 'Moyenne';

  @override
  String get priorityLow => 'Faible';

  @override
  String get priorityNone => 'Aucune priorité';

  @override
  String get filterAll => 'Tout';

  @override
  String get filterMine => 'Mes tâches';

  @override
  String get filterBots => 'Bots';

  @override
  String get assignee => 'Assigné à';

  @override
  String get unassigned => 'Non assigné';

  @override
  String get assignToMe => 'Moi';

  @override
  String get reviewRequired => 'Révision requise';

  @override
  String get reviewRequiredHelp =>
      'Le bot met le ticket en révision au lieu de le terminer.';

  @override
  String get comments => 'Commentaires';

  @override
  String get addComment => 'Ajouter un commentaire';

  @override
  String get sendComment => 'Envoyer';

  @override
  String get openThread => 'Ouvrir le fil du bot';

  @override
  String get deleteTicket => 'Supprimer le ticket';

  @override
  String get ticketResult => 'Résultat';

  @override
  String get noCommentsYet =>
      'Aucun commentaire pour l\'instant. Laissez une note au bot ou à votre équipe.';

  @override
  String get noTickets => 'Confiez une tâche à vos bots';

  @override
  String get noTicketsHelp =>
      'Déléguez une tâche ponctuelle ou un objectif complet. Vous pouvez suivre son avancée ici.';

  @override
  String get tasksStartTicket => 'Ajouter un ticket';

  @override
  String get tasksStartTicketHelp =>
      'Une tâche précise. Assignez-la à un bot et elle démarre.';

  @override
  String get tasksStartProject => 'Démarrer un projet';

  @override
  String get tasksStartProjectHelp =>
      'Un objectif plus large. Un bot le planifie en tickets et attend votre accord.';

  @override
  String get tasksExamples => 'Ou partez d\'un de ces exemples';

  @override
  String get tasksExampleResearch =>
      'Analyser mes trois principaux concurrents';

  @override
  String get tasksExampleDraft => 'Rédiger une annonce de lancement';

  @override
  String get tasksExampleTidy => 'Ranger mes fichiers';

  @override
  String get ticketStatus => 'Statut';

  @override
  String get spaces => 'Espaces de travail';

  @override
  String get newWorkspace => 'Nouvel espace de travail';

  @override
  String get newWorkspaceSubtitle =>
      'Un espace dédié à une équipe, avec ses propres bots, discussions et membres.';

  @override
  String get joinWorkspaceHelp =>
      'Collez le lien d\'invitation qu\'on vous a envoyé.';

  @override
  String get inviteLinkField => 'Lien d\'invitation';

  @override
  String get workspaceIcon => 'Icône';

  @override
  String get workspaceColor => 'Couleur';

  @override
  String get workspaceSettings => 'Réglages de l\'espace de travail';

  @override
  String get workspaceSettingsHelp =>
      'Nom, icône, couleur et liens d\'invitation';

  @override
  String get inviteLinks => 'Liens d\'invitation';

  @override
  String get inviteLinksHelp =>
      'Toute personne ayant un lien peut rejoindre l\'espace après s\'être connectée, jusqu\'à ce que le lien expire, soit épuisé ou que vous le révoquiez.';

  @override
  String get createInviteLink => 'Créer un lien';

  @override
  String get linkExpires => 'Expire';

  @override
  String get linkNever => 'Jamais';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Dans $daysString jours',
      one: 'Dans $daysString jour',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Utilisations';

  @override
  String get linkUnlimited => 'Illimité';

  @override
  String linkUses(String uses) {
    return '$uses utilisées';
  }

  @override
  String get linkRevoked => 'Révoqué';

  @override
  String get revokeLink => 'Révoquer';

  @override
  String get linkCopied => 'Lien d\'invitation copié.';

  @override
  String get inviteRole => 'Rôle';

  @override
  String get shareLinkLabel => 'Partager';

  @override
  String get botFolder => 'Dossier';

  @override
  String get noFolder => 'Aucun dossier';

  @override
  String get newFolder => 'Nouveau dossier…';

  @override
  String get folderName => 'Nom du dossier';

  @override
  String get archiveBot => 'Archiver le bot';

  @override
  String archiveBotTitle(String name) {
    return 'Archiver $name ?';
  }

  @override
  String get archiveBotBody =>
      'Il quitte la barre latérale et cesse de s\'exécuter. Ses discussions et son historique sont conservés, et vous pouvez le restaurer depuis Bots archivés.';

  @override
  String get archive => 'Archiver';

  @override
  String get archivedBots => 'Bots archivés';

  @override
  String get unarchive => 'Restaurer';

  @override
  String botArchived(String name) {
    return '$name archivé.';
  }

  @override
  String get settingsHistory => 'Historique des réglages';

  @override
  String get settingsHistoryHelp =>
      'Chaque modification des réglages de ce bot et son auteur';

  @override
  String get noHistory => 'Aucune modification pour l\'instant.';

  @override
  String get restoreSettings => 'Restaurer ces réglages';

  @override
  String restoreSettingsBody(String fields) {
    return 'Rétablir $fields tels qu\'ils étaient avant cette modification ? Les réglages actuels restent dans l\'historique.';
  }

  @override
  String changedByBot(String name) {
    return 'Modifié par $name';
  }

  @override
  String get changedByPerson => 'Modifié par une personne';

  @override
  String get changedBySystem => 'Modifié par Casama';

  @override
  String get fieldName => 'nom';

  @override
  String get fieldInstructions => 'instructions';

  @override
  String get fieldModel => 'modèle';

  @override
  String get fieldAutonomy => 'autonomie';

  @override
  String get fieldBudget => 'budget';

  @override
  String get fieldComputer => 'ordinateur';

  @override
  String get fieldArchived => 'archivé';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot a besoin d\'une clé $service';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Uniquement pour $hosts';
  }

  @override
  String get secretRequestHelp =>
      'Va directement dans le coffre. Le bot ne la voit jamais.';

  @override
  String secretSaved(String name) {
    return '$name enregistrée';
  }

  @override
  String get secretDeclined => 'Refusé';

  @override
  String secretWhat(String service) {
    return 'Clé $service';
  }

  @override
  String totpWhat(String service) {
    return 'Code de connexion $service';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Contrôle rendu : $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Identifiant partagé pour $host';
  }

  @override
  String get shareLogin => 'Partager l\'identifiant';

  @override
  String get shareLoginUsername => 'E-mail ou nom d\'utilisateur';

  @override
  String get shareLoginPassword => 'Mot de passe';

  @override
  String get shareLoginRemember => 'Mémoriser pour la prochaine fois';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Utilisé uniquement sur $host. $bot ne voit jamais votre mot de passe.';
  }

  @override
  String get shareLoginSave => 'Enregistrer et se connecter';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot demande que vous vous connectiez à $host';
  }

  @override
  String get signInOnPage => 'Se connecter sur la page';

  @override
  String loginOnPageLine(String host) {
    return 'Connexion à $host sur la page';
  }

  @override
  String get loginOnPageHelp =>
      'Connectez-vous sur la page, puis touchez Rendre le contrôle.';

  @override
  String get back => 'Retour';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Non partagé : votre calendrier',
      'reminders': 'Non partagé : vos rappels',
      'contacts': 'Non partagé : vos contacts',
      'places': 'Non partagé : vos lieux',
      'photos': 'Non partagé : vos photos',
      'health': 'Non partagé : vos données de santé',
      'notifications': 'Non partagé : vos notifications',
      'activity': 'Non partagé : l\'activité de votre ordinateur',
      'browserTab': 'Non partagé : l\'onglet actuel de votre navigateur',
      'browserHistory':
          'Non partagé : l\'historique et les favoris de votre navigateur',
      'alarm': 'Non partagé : vos alarmes',
      'home': 'Non partagé : vos accessoires Maison',
      'other': 'Non partagé : les données de votre appareil',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Refuser';

  @override
  String get signInCode => 'Code de connexion';

  @override
  String get secretKindValue => 'Clé ou mot de passe';

  @override
  String get totpSeedLabel =>
      'Clé de configuration, lien otpauth:// ou code affiché maintenant';

  @override
  String get totpSeedHelp =>
      'Une clé de configuration issue de la validation en deux étapes du site permet au bot de générer les codes suivants (il ne voit jamais la clé). Ou saisissez le code affiché maintenant : il est transmis directement au bot.';

  @override
  String get scanQrCode => 'Scanner un code QR';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot a besoin d\'un code de connexion $service';
  }

  @override
  String get search => 'Rechercher';

  @override
  String get searchHint =>
      'Rechercher dans discussions, souvenirs, compétences, tickets et fichiers';

  @override
  String get searchEmptyPrompt => 'Saisissez au moins 2 caractères.';

  @override
  String searchNoResults(String query) {
    return 'Aucun résultat pour « $query ».';
  }

  @override
  String get searchMessages => 'Messages';

  @override
  String get searchChats => 'Discussions';

  @override
  String get searchTickets => 'Tickets';

  @override
  String get searchFiles => 'Fichiers';

  @override
  String get searchFilesAsleep =>
      'Les fichiers sur les ordinateurs en veille ne sont pas explorés. Démarrez un ordinateur pour inclure ses fichiers.';

  @override
  String get searchJumpHint => 'Rechercher ou accéder à…';

  @override
  String get searchRecent => 'Récents';

  @override
  String get searchClearRecent => 'Effacer';

  @override
  String get searchRemoveRecent => 'Retirer des recherches récentes';

  @override
  String get searchJumpBackIn => 'Reprendre';

  @override
  String get searchNeedsYou => 'Besoin de vous';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n éléments en attente pour vous',
      one: '$n élément en attente pour vous',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Aller à';

  @override
  String get searchTopHits => 'Meilleurs résultats';

  @override
  String get searchScopeAll => 'Tout';

  @override
  String get searchMemories => 'Souvenirs';

  @override
  String get searchKeepTyping =>
      'Continuez à taper pour rechercher dans les messages, souvenirs et fichiers.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Demander à $bot à propos de « $query »';
  }

  @override
  String get searchAskBotHelp =>
      'Démarre une nouvelle discussion avec cette question';

  @override
  String get searchKeysHint =>
      '↑ ↓ pour naviguer   ↵ pour ouvrir   esc pour fermer';

  @override
  String get searchClear => 'Effacer la recherche';

  @override
  String get installFor => 'Installer pour';

  @override
  String get wholeWorkspace => 'Tout l\'espace de travail';

  @override
  String get skillCatalog => 'Catalogue de compétences';

  @override
  String get searchSkills => 'Rechercher des compétences';

  @override
  String get all => 'Tout';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString fichiers',
      one: '$countString fichier',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Installer';

  @override
  String skillInstalled(String name) {
    return '$name installée.';
  }

  @override
  String get noResults => 'Aucun résultat.';

  @override
  String get importFromGitHub => 'Importer depuis GitHub';

  @override
  String get importFromGitHubHelp =>
      'Collez un lien vers un dossier contenant un fichier SKILL.md. Vous verrez chaque fichier avant toute installation. Les dépôts privés utilisent un secret GITHUB_TOKEN autorisé pour api.github.com.';

  @override
  String get preview => 'Aperçu';

  @override
  String get skillScriptsNote =>
      'Les scripts d\'une compétence s\'exécutent uniquement sur l\'ordinateur d\'un bot, jamais sur le serveur.';

  @override
  String get binaryFile => '(fichier binaire)';

  @override
  String skillUpdate(String name) {
    return 'Mettre à jour $name';
  }

  @override
  String get checkingForUpdates => 'Recherche de mises à jour…';

  @override
  String get skillUpToDate => 'Déjà à jour.';

  @override
  String get update => 'Mettre à jour';

  @override
  String get filesAdded => 'Ajoutés';

  @override
  String get filesChanged => 'Modifiés';

  @override
  String get filesRemoved => 'Supprimés';

  @override
  String get fromCatalog => 'Depuis le catalogue';

  @override
  String get savedByBot => 'Enregistrée par un bot';

  @override
  String get checkForUpdates => 'Rechercher des mises à jour';

  @override
  String get attachSkill => 'Joindre une compétence';

  @override
  String get rerunSetup => 'Relancer la configuration';

  @override
  String get rerunSetupHelp =>
      'Répondez de nouveau aux questions de configuration et examinez une nouvelle proposition';

  @override
  String get trace => 'Trace';

  @override
  String get openTrace => 'Ouvrir la trace';

  @override
  String get editMessage => 'Modifier';

  @override
  String get editMessageHelp =>
      'L\'envoi relance la conversation à partir d\'ici. La version d\'origine est conservée ; naviguez avec les flèches.';

  @override
  String get previousVersion => 'Version précédente';

  @override
  String get nextVersion => 'Version suivante';

  @override
  String get quietHours => 'Heures silencieuses';

  @override
  String get quietHoursHelp =>
      'Les notifications attendent la fin des heures silencieuses ; votre boîte de réception continue de se remplir. Les approbations d\'une discussion ouverte arrivent toujours.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start à $end';
  }

  @override
  String get off => 'Désactivé';

  @override
  String get botNotifications => 'Notifications de ce bot';

  @override
  String get botNotificationsHelp =>
      'Indique si ce bot suit vos heures silencieuses';

  @override
  String get botMayCall => 'Peut m\'appeler';

  @override
  String get botMayCallHelp =>
      'Ce bot peut vous téléphoner quand quelque chose mérite un appel. Désactivé : il envoie une notification à la place.';

  @override
  String get quietDefault => 'Suivre mes heures silencieuses';

  @override
  String get quietAlways => 'Toujours me prévenir';

  @override
  String get quietCustom => 'Ses propres heures silencieuses';

  @override
  String get from => 'De';

  @override
  String get until => 'À';

  @override
  String get shareAsTemplate => 'Partager comme modèle';

  @override
  String get shareAsTemplateRow =>
      'Un fichier ou un lien avec ses instructions, compétences et routines';

  @override
  String get shareAsTemplateHelp =>
      'Inclut les instructions, compétences, routines et services utilisés. Jamais les clés ni les secrets.';

  @override
  String get copyLink => 'Copier le lien';

  @override
  String get includeMemories => 'Inclure les souvenirs';

  @override
  String get includeMemoriesHelp =>
      'Ce qu\'il a appris sur vous. Partagez avec prudence.';

  @override
  String get saveAsFile => 'Enregistrer en fichier';

  @override
  String get notABotTemplate =>
      'Ce fichier n\'est pas un modèle de bot Casama.';

  @override
  String get importBot => 'Importer un bot';

  @override
  String botImported(String name) {
    return '$name est prêt.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name est prêt. Connectez $services dans Intégrations pour qu\'il puisse les utiliser.';
  }

  @override
  String get whatComesWithIt => 'Ce qu\'il contient';

  @override
  String get connectAfterImport => 'Connecter après l\'importation';

  @override
  String get importRoutines => 'Planifier ses routines';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Conserver ses $countString souvenirs',
      one: 'Conserver son souvenir ($countString)',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Démarrage de la routine…';

  @override
  String get offlineSaved => 'Hors ligne. Affichage des messages enregistrés.';

  @override
  String get loadEarlierMessages => 'Messages précédents';

  @override
  String get chatLoadFailedTitle => 'Cette discussion n\'a pas pu charger';

  @override
  String get chatLoadFailedBody => 'Vérifiez votre connexion, puis réessayez.';

  @override
  String get projects => 'Projets';

  @override
  String get newProject => 'Nouveau projet';

  @override
  String get noProjects => 'Aucun projet pour l\'instant';

  @override
  String get projectsHelp =>
      'Un projet rassemble tout ce qui touche à un travail : sa discussion, son plan, ses tâches, ses fichiers et tout ce qui est créé pour lui. Travaillez dessus avec un bot ou laissez le bot établir le plan et avancer seul.';

  @override
  String get newProjectHelp =>
      'Rassemble tout ce qui touche à un travail : sa discussion, son plan, ses tâches, ses fichiers et tout ce qui est créé pour lui.';

  @override
  String get startPlanning => 'Commencer la planification';

  @override
  String get projectTitle => 'Titre';

  @override
  String get projectGoal => 'Objectif';

  @override
  String get projectDoneWhen => 'Terminé quand';

  @override
  String get projectLead => 'Bot responsable';

  @override
  String get projectBudget => 'Budget';

  @override
  String get projectGoalHint =>
      'Que doit-il exister à la fin ? Une page d\'accueil en ligne sur mon nom de domaine…';

  @override
  String get projectDoneHint =>
      'Facultatif. Comment vous saurez que c\'est terminé';

  @override
  String get projectBudgetHint =>
      'Facultatif. Le travail s\'arrête quand le budget est dépensé';

  @override
  String get projectThread => 'Discussion du projet';

  @override
  String get approvePlan => 'Approuver le plan';

  @override
  String get pause => 'Mettre en pause';

  @override
  String get resume => 'Reprendre';

  @override
  String get milestones => 'Jalons';

  @override
  String get needsSignoff => 'attend votre feu vert';

  @override
  String get signOff => 'Approuver';

  @override
  String get projectPlan => 'Plan';

  @override
  String get tickets => 'Tickets';

  @override
  String get projectTimeline => 'Chronologie';

  @override
  String get projectPlanning => 'Planification';

  @override
  String get projectActive => 'Actif';

  @override
  String get projectPaused => 'En pause';

  @override
  String get projectBlocked => 'Bloqué';

  @override
  String get projectDone => 'Terminé';

  @override
  String get projectCancelled => 'Annulé';

  @override
  String get projectName => 'Nom';

  @override
  String get projectNameHint => 'Space Dodger, newsletter de printemps…';

  @override
  String get createProject => 'Créer le projet';

  @override
  String projectWorksAlone(String bot) {
    return 'Laisser $bot y travailler seul';
  }

  @override
  String get projectWorksAloneHelp =>
      'Il rédige un plan que vous approuvez, puis travaille par sessions jusqu\'à atteindre l\'objectif. Rien ne démarre avant votre approbation.';

  @override
  String get projectWorksAloneOn =>
      'Travaille par sessions jusqu\'à atteindre l\'objectif.';

  @override
  String get projectWorksAloneOff =>
      'Vous y travaillez ensemble dans sa discussion.';

  @override
  String get projectMade => 'Créé dans ce projet';

  @override
  String projectMadeEmpty(String bot) {
    return 'Rien pour l\'instant. Ce que $bot crée dans la discussion de ce projet s\'affiche ici.';
  }

  @override
  String get projectSeeAll => 'Tout voir';

  @override
  String get projectTodos => 'À faire';

  @override
  String get projectFiles => 'Fichiers';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder sur l\'ordinateur de $bot';
  }

  @override
  String get projectMarkDone => 'Marquer comme terminé';

  @override
  String get projectReopen => 'Rouvrir';

  @override
  String get projectCover => 'Couverture';

  @override
  String get projectCoverNone => 'Aucune';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Voilier',
      'mountain': 'Montagne',
      'seedling': 'Jeune pousse',
      'compass': 'Boussole',
      'lantern': 'Lanterne',
      'telescope': 'Télescope',
      'map': 'Carte',
      'chess': 'Échecs',
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
      other: '$countString éléments',
      one: '$countString élément',
      zero: 'Rien pour l\'instant',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Projet';

  @override
  String get creationMoveToProject => 'Déplacer vers un projet';

  @override
  String get creationNoProject => 'Aucun projet';

  @override
  String get makeProject => 'Transformer en projet';

  @override
  String get makeProjectTitle => 'Transformer ce sujet en projet';

  @override
  String makeProjectHelp(String bot) {
    return 'Ce que $bot a créé dans ce sujet est classé dans le projet, ainsi que ce qu\'il y créera ensuite.';
  }

  @override
  String get openProject => 'Ouvrir le projet';

  @override
  String get theBot => 'le bot';

  @override
  String get forYou => 'Pour vous';

  @override
  String get inboxNeedsYou => 'Besoin de vous';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Besoin de vous ($nString)';
  }

  @override
  String get inboxBriefs => 'Résumés';

  @override
  String get inboxUpdates => 'Mises à jour';

  @override
  String get inboxEmptyHelp =>
      'Les demandes, résumés du matin, notifications et nouvelles pages de vos bots apparaissent ici.';

  @override
  String get inboxNeedsYouEmpty => 'Rien n\'a besoin de vous pour l\'instant';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Lorsqu\'un bot a besoin d\'une décision, de votre aide ou a une idée, cela apparaît ici.';

  @override
  String get noBriefs => 'Aucun résumé du matin pour l\'instant';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot a publié $title';
  }

  @override
  String get forYouEmpty => 'Rien pour vous pour l\'instant';

  @override
  String get forYouEmptyHelp =>
      'Activez les points réguliers dans les réglages d\'un bot pour recevoir un résumé du matin et des suggestions tout au long de la journée.';

  @override
  String morningBriefFrom(String name) {
    return 'Résumé du matin par $name';
  }

  @override
  String get suggestions => 'Suggestions';

  @override
  String suggestedBy(String name) {
    return 'Suggéré par $name';
  }

  @override
  String get dismissSuggestion => 'Ignorer cette suggestion ?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Choisissez si $bot peut vous la proposer à nouveau.';
  }

  @override
  String get justThisOnce => 'Juste cette fois';

  @override
  String justThisOnceHelp(String bot) {
    return 'Masquer pour l\'instant. Si cela compte encore plus tard, $bot pourra le suggérer à nouveau.';
  }

  @override
  String get dontSuggestAgain => 'Ne plus suggérer';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Supprimé définitivement. $bot retiendra que vous préférez éviter.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Compris. $bot ne le suggérera plus.';
  }

  @override
  String get doIt => 'Lancer';

  @override
  String get checkins => 'Points réguliers';

  @override
  String get checkinsHelp =>
      'Un résumé le matin et une vérification toutes les quelques heures pour voir ce qui a besoin de vous. Désactivé par défaut.';

  @override
  String get briefTime => 'Résumé du matin à';

  @override
  String get scanEvery => 'Vérifier toutes les';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString heures',
      one: '$countString heure',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Limite quotidienne';

  @override
  String get on => 'Activé';

  @override
  String get actionRules => 'Règles d\'action';

  @override
  String get actionRulesRow => 'Ce qu\'il peut faire sans demander';

  @override
  String get actionRulesHelp =>
      'Les règles décident par action : autoriser, autoriser dans certaines limites, demander d\'abord ou vous confier la fin. La règle la plus précise l\'emporte ; sans règle, l\'autonomie du bot décide. Les bots ne peuvent pas modifier leurs propres règles.';

  @override
  String get addRule => 'Ajouter une règle';

  @override
  String get addRuleHelp =>
      'Choisissez ce que fait le bot et comment il doit le gérer.';

  @override
  String get noRules =>
      'Aucune règle pour l\'instant. Le niveau d\'autonomie du bot décide.';

  @override
  String get otherTools => 'Outils spécifiques';

  @override
  String get workspaceRule => 'Règle d\'espace de travail';

  @override
  String get catSend => 'Envoi de messages';

  @override
  String get catPay => 'Paiements';

  @override
  String get catDelete => 'Suppression';

  @override
  String get catPublish => 'Publication';

  @override
  String get catShare => 'Partage et invitations';

  @override
  String get catSignIn => 'Connexion';

  @override
  String get whenTheBot => 'Quand le bot agit';

  @override
  String get itShould => 'Il doit';

  @override
  String get ruleAllow => 'Agir directement';

  @override
  String get ruleAllowLimits => 'Agir dans les limites';

  @override
  String get ruleAsk => 'Me demander d\'abord';

  @override
  String get ruleHandOff => 'Me laisser terminer';

  @override
  String get ruleDomains =>
      'Uniquement vers ces noms de domaine (séparés par des virgules)';

  @override
  String get ruleMaxAmount => 'Jusqu\'à ce montant';

  @override
  String get ruleForWorkspace => 'Pour chaque bot de l\'espace de travail';

  @override
  String get watchers => 'Suivis';

  @override
  String get watchersRow => 'Ce qu\'il surveille';

  @override
  String get noWatchers => 'Ne surveille rien';

  @override
  String get watchersHelp =>
      'Demandez au bot « préviens-moi quand… » pour qu\'il surveille une page, une réponse, un résultat ou un horaire. Les vérifications ne coûtent rien tant que rien ne change.';

  @override
  String get watcherActive => 'Surveille';

  @override
  String get watcherPaused => 'En pause';

  @override
  String get watcherDone => 'Terminé';

  @override
  String get watcherExpired => 'Expiré';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'déclenché $countString fois',
      one: 'déclenché $countString fois',
      zero: 'pas encore déclenché',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Connecter une app d\'IA';

  @override
  String connectAiAppAsk(String app) {
    return '$app souhaite utiliser Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'Elle peut lister vos bots, leur confier des tâches et lire les résultats dans l\'espace de travail choisi, en votre nom. Les approbations et règles de vos bots s\'appliquent toujours.';

  @override
  String get connectAiAppSendsTo =>
      'Après votre autorisation, vous revenez vers';

  @override
  String get connectAiAppUnknown =>
      'Casama ne reconnaît pas cette adresse. N\'importe qui peut donner n\'importe quel nom à une app ; n\'autorisez donc ceci que si vous avez lancé cette connexion vous-même et faites confiance à ce site.';

  @override
  String get connectAiAppDone => 'Terminé. Vous pouvez revenir à l\'app d\'IA.';

  @override
  String get refuse => 'Refuser';

  @override
  String get allow => 'Autoriser';

  @override
  String get connectAiApps => 'Connecter des apps d\'IA';

  @override
  String get connectAiAppsHelp =>
      'Les apps compatibles MCP se connectent à cette adresse et s\'authentifient, ou utilisent une clé API. Elles agissent au nom de la personne qui les a connectées.';

  @override
  String get connectedAiApps => 'Apps d\'IA connectées';

  @override
  String get connectedAiAppsHelp =>
      'Apps que vous avez connectées en vous identifiant. Déconnectez-en une et elle perd aussitôt l\'accès à cet espace de travail.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Apps que des membres de cet espace de travail ont connectées en s\'identifiant. Déconnectez-en une et elle perd aussitôt l\'accès.';

  @override
  String get noConnectedAiApps => 'Aucune app d\'IA connectée pour l\'instant.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Utilisée $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Connectée $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Elle cesse aussitôt de fonctionner dans cet espace de travail. Pour l\'utiliser de nouveau, reconnectez-la depuis l\'app.';

  @override
  String get mcpApprovals => 'Autoriser les approbations depuis les apps d\'IA';

  @override
  String get mcpApprovalsHelp =>
      'Les apps connectées peuvent approuver les actions de vos bots.';

  @override
  String get newApiKey => 'Nouvelle clé API';

  @override
  String get apiKeyName => 'Nom';

  @override
  String get newGroupChat => 'Nouvelle discussion de groupe';

  @override
  String get groupChats => 'Discussions de groupe';

  @override
  String groupWhoAnswers(String names) {
    return '$names répondront';
  }

  @override
  String get groupEveryoneAnswers => 'Tout le monde répondra';

  @override
  String get groupMentionHint => '@mentionnez un bot ou @everyone';

  @override
  String routineRan(String name) {
    return 'Routine « $name » exécutée';
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
      one: '$countString bot',
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
      other: '$countString éléments en attente pour vous',
      one: '$countString élément en attente pour vous',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Réunissez 2 à 10 bots dans une discussion. @Nom sollicite un bot ; @everyone demande au responsable de planifier et répartir le travail.';

  @override
  String get groupCreate => 'Créer la discussion de groupe';

  @override
  String get groupCrewEmpty =>
      'Choisissez des bots ci-dessous pour former le groupe.';

  @override
  String get groupLeadShort => 'Responsable';

  @override
  String get groupMakeLead => 'Désigner responsable';

  @override
  String groupRemoveBot(String name) {
    return 'Retirer $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Choisissez encore $count bots',
      one: 'Choisissez encore $count bot',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Cela fait 10 bots, le maximum pour un groupe.';

  @override
  String get groupLeadHint =>
      'Le responsable planifie le travail quand vous utilisez @everyone. Touchez un autre bot en haut pour le désigner responsable.';

  @override
  String get groupNeedTwoBots =>
      'Une discussion de groupe nécessite au moins deux bots. Créez d\'abord un autre bot.';

  @override
  String get groupSearchBots => 'Rechercher des bots';

  @override
  String get groupNoMatch => 'Aucun bot ne correspond à ce nom.';

  @override
  String get groupTitle => 'Nom (facultatif)';

  @override
  String get groupPickBots => 'Bots';

  @override
  String get groupLead => 'Dirige le groupe';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Pages';

  @override
  String get pagesRow => 'Rapports et tableaux de bord publiés';

  @override
  String get noPages => 'Aucune page pour l\'instant';

  @override
  String get pagesHelp =>
      'Demandez à un bot un rapport, un tableau de bord ou un outil de suivi et il peut le publier sous forme de page. Les pages s\'ouvrent dans votre navigateur et restent privées tant que vous ne les partagez pas.';

  @override
  String get pagePrivate => 'Moi uniquement';

  @override
  String get pageWorkspace => 'Espace de travail';

  @override
  String get pagePublic => 'Toute personne ayant le lien';

  @override
  String get pageRefreshes => 'S\'actualise selon un planning';

  @override
  String get pageCardOpen => 'Page · Touchez pour ouvrir';

  @override
  String get exportPdf => 'Exporter en PDF';

  @override
  String get pageMakePublicTitle => 'Rendre cette page publique ?';

  @override
  String get pageMakePublicBody =>
      'Toute personne ayant le lien peut l\'ouvrir, y compris les données qu\'elle contient. Vous pouvez annuler à tout moment ; le lien cesse alors de fonctionner.';

  @override
  String get pageMakePublic => 'Rendre publique';

  @override
  String get pagePublicLinkTitle => 'Lien public';

  @override
  String get pagePublicLinkBody =>
      'Copié. Elle n\'est pas indexée dans les moteurs de recherche.';

  @override
  String deletePageTitle(String title) {
    return 'Supprimer « $title » ?';
  }

  @override
  String get openPages => 'Ouvrir dans Pages';

  @override
  String get discard => 'Ignorer';

  @override
  String get discardChangesTitle => 'Ignorer les modifications ?';

  @override
  String get discardChangesBody =>
      'Vos modifications n\'ont pas été enregistrées.';

  @override
  String get keepEditing => 'Continuer à modifier';

  @override
  String get teachTask => 'Enseigner une tâche';

  @override
  String get teachWhichBot => 'Quel bot doit apprendre ceci ?';

  @override
  String get teachRecording => 'Enregistrement';

  @override
  String get teachRecordingPaused => 'Enregistrement arrêté';

  @override
  String get teachRecordingHelp =>
      'Effectuez la tâche comme d\'habitude. Chaque étape est enregistrée avec ce qui est à l\'écran ; les champs de mot de passe ne le sont jamais.';

  @override
  String get teachStop => 'Arrêter';

  @override
  String get teachMarkSecret => 'Marquer comme secret';

  @override
  String get teachMarkSecretHelp =>
      'Ce que vous venez de saisir est effacé de l\'enregistrement et devient un champ secret que le bot demande.';

  @override
  String get teachDraftTitle => 'Nouvelle compétence';

  @override
  String get teachDrafting =>
      'Rédaction d\'une compétence à partir de votre enregistrement…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString étapes',
      one: '$countString étape',
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
      other: '$countString étapes',
      one: '$countString étape',
    );
    return 'Ce que vous avez montré ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Vérifiez les étapes, les entrées et les critères de réussite, puis enregistrez. Vous pouvez l\'essayer tout de suite.';

  @override
  String get teachDraftFailed =>
      'Le bot n\'a pas pu rédiger de brouillon. Rédigez les étapes vous-même d\'après l\'enregistrement ci-dessous, ou ignorez-le.';

  @override
  String get teachAlreadySaved => 'Cette compétence est enregistrée';

  @override
  String get teachSaveAndTry => 'Enregistrer et essayer';

  @override
  String teachSaved(String name) {
    return '$name enregistrée';
  }

  @override
  String get teachDiscardTitle => 'Ignorer cet enregistrement ?';

  @override
  String get teachDiscardBody =>
      'Toutes les étapes, tous les instantanés et toutes les captures d\'écran enregistrés sont supprimés.';

  @override
  String teachStepClick(int x, int y) {
    return 'Cliquer à $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Saisir « $text »';
  }

  @override
  String teachStepSecret(String name) {
    return 'Saisir le secret $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Appuyer sur $key';
  }

  @override
  String get teachStepScroll => 'Faire défiler';

  @override
  String get plugins => 'Plugins';

  @override
  String get pluginsRow => 'Compétences et outils issus de paquets de plugins';

  @override
  String get noPlugins => 'Aucun plugin pour l\'instant';

  @override
  String get pluginsHelp =>
      'Les plugins sont des paquets Agent Plugins 1.0 sur GitHub. Ils peuvent apporter des compétences et des outils MCP ; leurs serveurs s\'exécutent sur l\'ordinateur de ce bot, jamais sur ceux de Casama.';

  @override
  String get addPlugin => 'Ajouter un plugin';

  @override
  String get addPluginHelp =>
      'Collez un lien GitHub vers le dossier du plugin. Vous verrez ce qu\'il ajoute avant toute installation.';

  @override
  String get pluginAdds => 'Il ajoute';

  @override
  String pluginStdio(String command) {
    return 'S\'exécute sur l\'ordinateur du bot : $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Se connecte à $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Communique avec : $hosts';
  }

  @override
  String get pluginSkill => 'Compétence';

  @override
  String get pluginHosts => 'Réseau';

  @override
  String get pluginServerError => 'Impossible de démarrer';

  @override
  String get pluginRunsOnComputer => 'S\'exécute sur l\'ordinateur du bot';

  @override
  String get pluginWhereToolsRun => 'Où ses outils s\'exécutent';

  @override
  String get pluginWhereToolsRunHelp =>
      'Sur votre propre ordinateur, les outils peuvent utiliser ce qui s\'y trouve, et ils ne sont utilisables que par vous, depuis vos propres discussions. Les serveurs sur internet ne sont pas concernés.';

  @override
  String get pluginPlaceBot => 'L\'ordinateur du bot';

  @override
  String pluginPlaceMine(String name) {
    return 'Mon ordinateur : $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'S\'exécute sur $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Ses outils fonctionnent uniquement dans les discussions avec la personne propriétaire de l\'ordinateur';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Hors ligne : ses outils refonctionnent dès que l\'app Casama y est ouverte';

  @override
  String get pluginUpToDate => 'Déjà à jour';

  @override
  String get checkForUpdate => 'Rechercher une mise à jour';

  @override
  String get uninstall => 'Désinstaller';

  @override
  String uninstallPluginTitle(String name) {
    return 'Désinstaller $name ?';
  }

  @override
  String get uninstallPluginBody =>
      'Ses compétences, outils, fichiers et secrets enregistrés sont retirés de ce bot.';

  @override
  String updatePluginTitle(String name) {
    return 'Mettre à jour $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Nouvelles compétences : $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Compétences modifiées : $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Compétences retirées : $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Nouveaux serveurs d\'outils : $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Serveurs d\'outils modifiés : $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Serveurs d\'outils retirés : $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Communique avec de nouveaux hôtes : $hosts';
  }

  @override
  String get pluginDiffNone => 'Aucun changement dans ce qu\'il ajoute.';

  @override
  String get next => 'Suivant';

  @override
  String get botNameLabel => 'Nom';

  @override
  String get importAgent => 'Importer un agent';

  @override
  String get importAgentHelp =>
      'Importez un bot depuis OpenClaw ou Hermes Agent, ou collez une configuration de Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark ou Instinct : son profil, ses compétences, ses plannings et ses souvenirs. Vous vérifiez tout avant la création. Les clés et fichiers de réglages ne sont jamais lus.';

  @override
  String get importAgentPickFolder => 'Choisir son dossier';

  @override
  String get importAgentPickZip => 'Importer un ZIP de son dossier';

  @override
  String get importPasteChoice => 'Coller la configuration d\'un bot';

  @override
  String get importPasteChoiceHelp =>
      'Depuis Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct ou une autre app';

  @override
  String get importPasteTitle => 'Coller la configuration d\'un bot';

  @override
  String get importPasteHelp =>
      'Envoyez à votre bot le prompt ci-dessous, puis collez toute sa réponse. Vous vérifierez tout avant la création du nouveau bot.';

  @override
  String get importPasteSource => 'Où est votre bot actuellement ?';

  @override
  String get importPasteOther => 'Ailleurs';

  @override
  String get importPasteStep1 => '1. Envoyez ce prompt à votre bot';

  @override
  String get importPasteReply => '2. Collez sa réponse';

  @override
  String get importPasteSafety =>
      'Les lignes qui ressemblent à des clés, mots de passe ou numéros de carte sont supprimées. Reconnectez-vous à ses apps après l\'importation.';

  @override
  String get importPasteSubtitle => 'Configuration collée';

  @override
  String get agentImportReviewHelp =>
      'Décochez tout ce que vous ne voulez pas. Rien n\'est créé avant l\'importation.';

  @override
  String get agentImportNoPersona => 'Aucun fichier de profil trouvé.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString compétences',
      one: '$countString compétence',
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
      one: '$countString routine',
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
      other: '$countString souvenirs',
      one: '$countString souvenir',
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
      other:
          'Copier $countString autres fichiers dans ~/imported/ sur son ordinateur',
      one:
          'Copier $countString autre fichier dans ~/imported/ sur son ordinateur',
    );
    return '$_temp0';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Non importés : $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$name importé et $countString fichiers copiés sur son ordinateur';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$name importé. Ses autres fichiers n\'ont pas encore pu être copiés ; attribuez-lui un ordinateur et importez à nouveau pour les copier.';
  }

  @override
  String get importMemoryTitle =>
      'Importer des souvenirs depuis ChatGPT ou Claude';

  @override
  String get importMemoryHelp =>
      'Copiez ce prompt dans ChatGPT ou Claude, puis collez sa réponse ci-dessous.';

  @override
  String get importMemoryPick => 'Gardez ce qui est exact ; décochez le reste.';

  @override
  String get importMemoryPaste => 'Sa réponse';

  @override
  String get importMemoryNone => 'Aucun souvenir trouvé dans cette réponse.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString souvenirs ajoutés',
      one: '$countString souvenir ajouté',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Routines et compétences en fichiers';

  @override
  String get routinesAsFilesHelp =>
      'Chaque routine et compétence sous forme de fichier Markdown : exportez-les, modifiez-les partout, réimportez-les ou gardez-les dans un dépôt GitHub.';

  @override
  String get exportFiles => 'Exporter en fichiers';

  @override
  String get importFiles => 'Importer des fichiers';

  @override
  String get importFilesApply => 'Appliquer';

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

    return '$createdString nouveaux, $updatedString modifiés, $unchangedString inchangés';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Importés : $createdString nouveaux, $updatedString modifiés';
  }

  @override
  String get gitSync => 'Synchronisation Git';

  @override
  String get gitSyncOff => 'Désactivée';

  @override
  String get gitSyncHelp =>
      'Les modifications dans Casama sont validées dans le dépôt, et les pushs vers celui-ci mettent à jour Casama après vérification. Si un fichier change aux deux endroits, Casama garde sa version et ouvre une pull request. Nécessite un secret GITHUB_TOKEN autorisé pour api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Nécessite un secret GITHUB_TOKEN';

  @override
  String gitSyncedWhen(String when) {
    return 'Synchronisé $when';
  }

  @override
  String get gitSyncPr => 'Pull Request en attente pour vous';

  @override
  String get syncNow => 'Synchroniser';

  @override
  String get syncQueued => 'Synchronisation dans moins d\'une minute';

  @override
  String get gitBranch => 'Branche';

  @override
  String get gitFolder => 'Dossier dans le dépôt (facultatif)';

  @override
  String get gitSyncOn => 'Synchronisation activée';

  @override
  String get gitSyncRemove => 'Arrêter la synchronisation';

  @override
  String get gitWebhookTitle => 'Ajoutez ce webhook au dépôt';

  @override
  String get gitWebhookHelp =>
      'Dans les réglages du dépôt, ajoutez un webhook pour les événements push avec cette adresse et ce secret (type de contenu application/json). Le secret n\'est affiché que maintenant.';

  @override
  String get gitWebhookUrl => 'URL de payload';

  @override
  String get gitWebhookSecret => 'Secret';

  @override
  String get knowledge => 'Connaissances';

  @override
  String get knowledgeRow => 'Documents qu\'il peut rechercher et citer';

  @override
  String get noKnowledge => 'Aucune connaissance pour l\'instant';

  @override
  String get knowledgeHelp =>
      'Donnez-lui des fichiers, un site web ou un dépôt GitHub. Il y cherche ce qui est utile et vous indique de quel document provient la réponse.';

  @override
  String get addKnowledge => 'Ajouter des connaissances';

  @override
  String get addKnowledgeHelp =>
      'Fichiers PDF, Word, Markdown, HTML, CSV ou texte ; un site web (un nom de domaine, selon son robots.txt) ; ou les documents d\'un dépôt. Sites web et dépôts s\'actualisent chaque jour.';

  @override
  String get knowledgeFiles => 'Fichiers';

  @override
  String get knowledgeWebsite => 'Site web';

  @override
  String get knowledgePickFiles => 'Choisir des fichiers';

  @override
  String get knowledgeWebsiteUrl => 'Adresse du site web';

  @override
  String get knowledgeRepoUrl => 'Lien GitHub';

  @override
  String get knowledgeShareAll =>
      'Partager avec chaque bot de l\'espace de travail';

  @override
  String get knowledgeShared => 'Tout l\'espace de travail';

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
      one: '$docsString document',
    );
    return '$_temp0, $chunksString extraits';
  }

  @override
  String get knowledgeError => 'Lecture impossible';

  @override
  String get knowledgeSyncing => 'Lecture…';

  @override
  String get knowledgePending => 'En attente de lecture';

  @override
  String get add => 'Ajouter';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot suggère une compétence : $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot suggère d\'améliorer $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Utilise : $tools';
  }

  @override
  String get saveSkill => 'Enregistrer la compétence';

  @override
  String get applyEdit => 'Appliquer la modification';

  @override
  String skillSaved(String name) {
    return '$name enregistrée';
  }

  @override
  String skillUpdated(String name) {
    return 'Compétence $name mise à jour';
  }

  @override
  String get skillStats => 'Résultats';

  @override
  String get skillNotUsedYet => 'Pas encore utilisée';

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

    return 'Utilisée $usesString fois · $rateString % réussies · $failuresString échecs · $correctionsString corrigées';
  }

  @override
  String skillLastFailure(String date) {
    return 'Dernier problème : $date';
  }

  @override
  String get skillHistory => 'Versions précédentes';

  @override
  String get replays => 'Séquences';

  @override
  String get replaysRow => 'Étapes enregistrées qu\'il exécute sans réfléchir';

  @override
  String get noReplays => 'Aucune séquence pour l\'instant';

  @override
  String get replaysHelp =>
      'Une séquence est une suite d\'étapes de navigateur ou de bureau enregistrées que le bot exécute telle quelle, plus vite et à moindre coût. Si une étape ne fonctionne plus, le bot reprend la main à cet endroit et peut mettre à jour la séquence. Créez-en une à partir d\'un enregistrement fait avec Enseigner une tâche, ou demandez au bot d\'enregistrer ce qu\'il vient de faire.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString étapes',
      one: '$countString étape',
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
      other: 'exécutée $runsString fois',
      one: 'exécutée $runsString fois',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: 'dont $failuresString avec de l\'aide',
      one: 'dont $failuresString avec de l\'aide',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Exécuter $name';
  }

  @override
  String get runReplayHelp =>
      'Vérifiez les valeurs renseignées, puis lancez l\'exécution.';

  @override
  String get run => 'Exécuter';

  @override
  String get saveAsReplay => 'Enregistrer aussi la séquence';

  @override
  String replaySaved(String name) {
    return 'Séquence $name enregistrée';
  }

  @override
  String get passwordManagers => 'Gestionnaires de mots de passe';

  @override
  String get passwordManagersRow =>
      'Identifiants 1Password ou Bitwarden pour les bots';

  @override
  String get noPasswordManagers =>
      'Aucun gestionnaire de mots de passe connecté';

  @override
  String get passwordManagersHelp =>
      'Les bots peuvent se connecter avec les identifiants des coffres choisis. Ils ne voient jamais le mot de passe : il est saisi dans le navigateur uniquement sur les sites associés à cet identifiant.';

  @override
  String get connectPasswordManager =>
      'Connecter un gestionnaire de mots de passe';

  @override
  String get pmWorkspace => 'Tout l\'espace de travail';

  @override
  String get pmJustMe => 'Moi uniquement';

  @override
  String get pmNoVaults => 'Aucun coffre choisi pour l\'instant';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString coffres',
      one: '$countString coffre',
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
      other: '$countString identifiants',
      one: '$countString identifiant',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Utilise un serveur 1Password Connect avec le jeton d\'un compte de service.';

  @override
  String get pmBitwardenHelp =>
      'Utilise l\'API Vault Management de Bitwarden (bw serve) pour les collections de votre organisation.';

  @override
  String get pmConnectUrl => 'Adresse du serveur Connect';

  @override
  String get pmConnectToken => 'Jeton Connect';

  @override
  String get pmBwUrl => 'Adresse bw serve';

  @override
  String get pmBwToken => 'Jeton d\'accès (facultatif)';

  @override
  String get pmForWorkspace => 'Pour tout l\'espace de travail';

  @override
  String get pmChooseVaults => 'Coffres accessibles aux bots';

  @override
  String get pmChooseVaultsHelp =>
      'Seuls les identifiants des coffres ou collections cochés sont accessibles aux bots.';

  @override
  String get welcomeGettingReady => 'Préparation de votre espace…';

  @override
  String get setUpManually => 'Configurer manuellement';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get inviteLinkCopied =>
      'Lien d\'invitation copié. Envoyez-le à vos collègues.';

  @override
  String get inviteFriends => 'Inviter des amis';

  @override
  String inviteFriendsRow(String amount) {
    return 'Gagnez $amount d\'utilisation gratuite pour chaque ami qui vous rejoint';
  }

  @override
  String get inviteFriendsRowPlain => 'Partagez Casama avec vos amis';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Offrez Casama, recevez $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Partager Casama avec vos amis';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Envoyez votre lien à un ami. Lorsqu\'il s\'inscrit et termine sa première discussion, vous recevez $amount d\'utilisation gratuite.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Envoyez votre lien à un ami. Il pourra s\'inscrire immédiatement.';

  @override
  String get inviteFriendsYourCode =>
      'Votre code d\'invitation. Touchez pour copier.';

  @override
  String get inviteFriendsShare => 'Partager le lien';

  @override
  String get inviteFriendsCopyLink => 'Copier le lien';

  @override
  String get inviteFriendsCopied => 'Copié. Envoyez-le à un ami.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Rejoignez-moi sur Casama, où des collègues IA agissent pour vous : $link (code d\'invitation $code)';
  }

  @override
  String get inviteFriendsProgress => 'Vos invitations';

  @override
  String get inviteFriendsJoined => 'Amis inscrits';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString n\'ont pas encore terminé leur première discussion',
      one: '$countString n\'a pas encore terminé sa première discussion',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Utilisation gratuite gagnée';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$countString amis supplémentaires peuvent vous rapporter une récompense',
      one: '$countString ami supplémentaire peut vous rapporter une récompense',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Vous avez atteint le maximum de récompenses d\'invitation. Merci !';

  @override
  String get inviteFriendsHow => 'Comment ça marche';

  @override
  String get inviteFriendsStep1 =>
      'Partagez votre lien ou votre code avec un ami';

  @override
  String get inviteFriendsStep2 =>
      'Il s\'inscrit et saisit votre code sous une semaine';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Dès qu\'il termine sa première discussion, vous recevez $amount d\'utilisation gratuite';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Il démarre avec ses propres collègues IA';

  @override
  String get inviteFriendsUnavailable =>
      'Les invitations ne sont pas disponibles sur ce serveur.';

  @override
  String get referralHaveCode => 'Vous avez le code d\'un ami ?';

  @override
  String get referralCodeHint => 'Code d\'invitation';

  @override
  String get referralUse => 'Utiliser';

  @override
  String get referralRedeemed =>
      'Code d\'invitation ajouté. Bienvenue dans Casama !';

  @override
  String referralRedeemedFrom(String name) {
    return 'Vous avez rejoint Casama grâce à l\'invitation de $name. Bienvenue !';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Vous avez rejoint Casama grâce à l\'invitation de $name.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Vous avez rejoint Casama grâce à l\'invitation d\'un ami.';

  @override
  String referralInvitedBy(String name) {
    return '$name vous a invité';
  }

  @override
  String get referralInvitedByFriend => 'Un ami vous a invité';

  @override
  String get referralWelcomeTitle => 'Bienvenue dans Casama';

  @override
  String get referralWelcomeHelp =>
      'Des collègues IA qui travaillent pour vous sur leurs propres ordinateurs. Acceptez l\'invitation pour que votre ami reçoive son crédit.';

  @override
  String get referralAccept => 'Accepter l\'invitation';

  @override
  String get referralGetStarted => 'Commencer';

  @override
  String get referralInvalid => 'Cette invitation ne fonctionne pas';

  @override
  String get referralInvalidHelp =>
      'Le code comporte peut-être une faute de frappe. Vous pouvez quand même vous inscrire et utiliser Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Offrez $amount, recevez $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Envoyez votre lien à un ami. Lorsqu\'il s\'inscrit avec votre code et termine sa première discussion, vous recevez chacun $amount d\'utilisation gratuite.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Envoyez votre lien à un ami. Lorsqu\'il s\'inscrit avec votre code et termine sa première discussion, vous recevez $reward d\'utilisation gratuite et lui reçoit $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Dès qu\'il termine sa première discussion, vous recevez chacun $amount d\'utilisation gratuite';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Dès qu\'il termine sa première discussion, vous recevez $reward et lui reçoit $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Rejoignez-moi sur Casama, où des collègues IA agissent pour vous. Inscrivez-vous avec mon code d\'invitation $code et recevez $amount d\'utilisation gratuite : $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Saisissez-le dans la semaine suivant votre inscription pour recevoir $amount d\'utilisation gratuite après votre première discussion.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Votre bonus de bienvenue de $amount est dans votre espace de travail.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Votre bonus de bienvenue de $amount arrive après votre première discussion.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Des collègues IA qui travaillent pour vous sur leurs propres ordinateurs. Acceptez l\'invitation pour recevoir $amount d\'utilisation gratuite après votre première discussion.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Vous êtes des nôtres ! Votre bonus de bienvenue de $amount arrive après votre première discussion.';
  }

  @override
  String get connectManaged => 'Se connecter via Composio';

  @override
  String connectManagedHelp(String app) {
    return 'Casama connecte $app via Composio, qui gère l\'authentification. Vous pouvez déconnecter à tout moment.';
  }

  @override
  String get sharing => 'Partage';

  @override
  String get sharingRow =>
      'Qui peut discuter avec lui, le modifier ou le gérer';

  @override
  String get sharingHelp =>
      'Tout l\'espace de travail peut discuter avec un bot sauf si vous le rendez privé. Les personnes ajoutées peuvent discuter, modifier ses réglages ou gérer les accès. Un bot qui travaille pour quelqu\'un n\'utilise que son ordinateur personnel et ses connexions.';

  @override
  String get sharingPrivate => 'Privé';

  @override
  String get sharingPrivateOn =>
      'Seuls vous et les personnes ci-dessous pouvez le voir';

  @override
  String get sharingPrivateOff =>
      'Tout l\'espace de travail peut discuter avec lui';

  @override
  String get sharingPeople => 'Personnes';

  @override
  String get sharingOnlyCreator => 'Uniquement son créateur';

  @override
  String get sharingEveryoneChats =>
      'Tout le monde peut discuter ; ajoutez les personnes autorisées à le modifier';

  @override
  String sharingEveryoneRole(String role) {
    return 'Toute personne ayant le rôle $role';
  }

  @override
  String get accessChat => 'Peut discuter';

  @override
  String get accessEdit => 'Peut modifier';

  @override
  String get accessAdmin => 'Peut gérer';

  @override
  String get sharingSaved => 'Partage enregistré';

  @override
  String get triggerCalendar => 'Réunions';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Autour des réunions correspondantes ($minutesString min)',
      one: 'Autour des réunions correspondantes ($minutesString min)',
      zero: 'Au début des réunions correspondantes',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Connectez d\'abord Google Agenda ou Outlook.';

  @override
  String get calendarTriggerCalendar => 'Calendrier';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString min',
      one: '$minutesString min',
      zero: 'Au début',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Uniquement les réunions avec des personnes externes à mon entreprise';

  @override
  String get calendarVideoLink => 'Uniquement les réunions avec un lien vidéo';

  @override
  String get calendarTitleMatch =>
      'Uniquement les titres contenant (facultatif)';

  @override
  String get fullAccess => 'Accès complet';

  @override
  String get fullAccessHelp =>
      'Les bots agissent sans demander d\'abord, sur leurs ordinateurs et sur votre Mac. Les paiements, changements de mot de passe et vos propres règles « demander » demandent toujours votre accord.';

  @override
  String get fullAccessConfirmTitle => 'Activer l\'accès complet ?';

  @override
  String get fullAccessConfirmBody =>
      'Chaque bot de cet espace de travail pourra envoyer des messages, supprimer des fichiers, exécuter des commandes sur votre Mac et ajouter des connexions sans vous demander d\'abord. Les paiements et les changements de mot de passe demanderont toujours votre accord.';

  @override
  String get fullAccessTurnOn => 'Activer';

  @override
  String get botToBot => 'Les bots peuvent communiquer entre eux';

  @override
  String get botToBotHelp =>
      'Les bots peuvent se @mentionner, s\'envoyer des messages et se confier du travail.';

  @override
  String get capMessages => 'Messages (iMessage)';

  @override
  String get chatApps => 'Apps de messagerie';

  @override
  String get chatAppsRow => 'Telegram, e-mail, SMS, Slack, WhatsApp et plus';

  @override
  String get botEmail => 'Adresse e-mail';

  @override
  String get botEmailRow => 'Donner sa propre adresse à ce bot';

  @override
  String botEmailClaimTitle(String name) {
    return 'Donner une adresse e-mail à $name';
  }

  @override
  String get botEmailClaimHelp =>
      'On peut lui écrire, et il répond par e-mail. Transférez-lui n\'importe quoi : factures, réservations, newsletters.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'Le nom ne peut pas être modifié plus tard.';

  @override
  String get botEmailNameLabel => 'Nom';

  @override
  String botEmailWillBe(String address) {
    return 'Adresse de votre bot : $address.';
  }

  @override
  String get botEmailClaim => 'Créer l\'adresse';

  @override
  String get botEmailTaken => 'Ce nom est pris. Essayez l\'un de ceux-ci :';

  @override
  String get botEmailClaimed => 'Votre bot a une adresse';

  @override
  String get botEmailClaimedHelp =>
      'Un e-mail de bienvenue est en route. Répondez-y ou transférez n\'importe quel message.';

  @override
  String get botEmailCopy => 'Copier';

  @override
  String get botEmailCopied => 'Copié';

  @override
  String get botEmailContacts => 'Ajouter aux contacts';

  @override
  String botEmailWrite(String name) {
    return 'Écrire à $name';
  }

  @override
  String get botEmailPaused =>
      'En pause. Il continue de recevoir et conserver les e-mails, mais ne répond à rien.';

  @override
  String get botEmailPause => 'Mettre en pause';

  @override
  String get botEmailResume => 'Reprendre';

  @override
  String get botEmailSenders => 'Expéditeurs autorisés';

  @override
  String get botEmailSendersHelp =>
      'Seules ces personnes reçoivent des réponses. Les e-mails d\'inconnus sont conservés et ne déclenchent rien.';

  @override
  String get botEmailEditSenders => 'Modifier dans Apps de messagerie';

  @override
  String get botEmailMove => 'Déplacer vers un autre bot';

  @override
  String get botEmailMoveHelp =>
      'L\'adresse et ses e-mails sont transférés vers l\'autre bot.';

  @override
  String get botEmailRelease => 'Libérer l\'adresse';

  @override
  String get botEmailReleaseHelp =>
      'Arrête définitivement la réception. Le nom ne sera plus jamais réattribué.';

  @override
  String botEmailReleaseConfirm(String address) {
    return 'Libérer $address ? Elle cesse aussitôt de recevoir et le nom ne sera plus jamais réattribué.';
  }

  @override
  String get botEmailReleaseNow => 'Libérer';

  @override
  String get botEmailMoved => 'Déplacée';

  @override
  String botEmailNewBotRow(String name) {
    return 'Donner une adresse e-mail à $name';
  }

  @override
  String get botEmailInbox => 'Boîte de réception';

  @override
  String get botEmailInboxRow => 'E-mails conservés, inconnus et fichiers';

  @override
  String get botEmailEmpty => 'Aucun e-mail pour l\'instant';

  @override
  String get botEmailStrangers => 'Inconnus';

  @override
  String get botEmailAll => 'Tous les e-mails';

  @override
  String get botEmailUnconfirmed => 'Impossible de confirmer cet expéditeur';

  @override
  String get botEmailAllow => 'Autoriser';

  @override
  String get botEmailBlock => 'Bloquer';

  @override
  String get botEmailBlocked =>
      'Bloqué. Les nouveaux e-mails de cet expéditeur sont refusés.';

  @override
  String get botEmailUnblock => 'Débloquer';

  @override
  String get botEmailOpenChat => 'Ouvrir la discussion';

  @override
  String get botEmailFiles => 'Fichiers';

  @override
  String get botEmailNewSenders => 'M\'avertir des nouveaux expéditeurs';

  @override
  String get botEmailNewSendersHelp =>
      'Au plus une fois par jour. Désactivé sauf si vous l\'activez.';

  @override
  String get botEmailTryTitle => 'Choses à essayer';

  @override
  String get botEmailTryForward => 'Transférer une facture ou une réservation';

  @override
  String get botEmailTryForwardHelp =>
      'Transférez n\'importe quoi à l\'adresse ci-dessus. Il le lit et répond ici.';

  @override
  String get botEmailTryReceipts => 'Classer mes reçus';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Crée une routine qui classe les e-mails envoyés à $address.';
  }

  @override
  String get botEmailTryDigest => 'Un condensé par semaine';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Crée une routine qui rassemble les newsletters envoyées à $address dans un résumé hebdomadaire.';
  }

  @override
  String get botEmailTryCopied => 'Adresse copiée';

  @override
  String get botEmailTryMade => 'Routine créée';

  @override
  String get botEmailReceiptsName => 'Classer mes reçus';

  @override
  String get botEmailReceiptsInstructions =>
      'Classez le reçu de cet e-mail : objet, montant et date. Ne dites rien sauf si quelque chose semble anormal.';

  @override
  String get botEmailDigestName => 'Condensé hebdomadaire des newsletters';

  @override
  String get botEmailDigestInstructions =>
      'Rassemblez les newsletters de la semaine et envoyez un court condensé : les titres utiles à connaître, rien de plus.';

  @override
  String get botEmailTriggerTag => 'Étiquette d\'adresse';

  @override
  String get botEmailTriggerTagHelp =>
      'Uniquement les e-mails vers ce tag, comme shop pour ada+shop@. Adresses e-mail uniquement.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Recevoir aussi les expéditeurs non confirmés';

  @override
  String get botEmailTriggerAutomatic =>
      'Recevoir aussi les e-mails automatiques';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used sur $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used utilisés';
  }

  @override
  String get botEmailStorageFull =>
      'La boîte est pleine, les nouveaux e-mails sont donc refusés. Supprimez d\'anciens messages pour faire de la place.';

  @override
  String get botEmailSelect => 'Sélectionner';

  @override
  String get botEmailSelectDone => 'Terminé';

  @override
  String get botEmailDelete => 'Supprimer';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Supprimer $n e-mails',
      one: 'Supprimer $n e-mail',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Supprimer ces $n e-mails ?',
      one: 'Supprimer $n e-mail ?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Leur texte et leurs fichiers sont supprimés définitivement. Les copies déjà dans une discussion y restent.';

  @override
  String get botEmailDeleteOlder => 'Supprimer les e-mails plus anciens';

  @override
  String get botEmailOlder30Days => 'Plus de 30 jours';

  @override
  String get botEmailOlder6Months => 'Plus de 6 mois';

  @override
  String get botEmailOlderYear => 'Plus d\'un an';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Supprimer tous les e-mails de plus de 30 jours ?',
      'months6': 'Supprimer tous les e-mails de plus de 6 mois ?',
      'other': 'Supprimer tous les e-mails de plus d\'un an ?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n e-mails supprimés',
      one: '$n e-mail supprimé',
      zero: 'Rien à supprimer',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n adresses e-mail de bot',
      one: '$n adresse e-mail de bot',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew =>
      'Les bots écrivent à de nouvelles personnes par e-mail';

  @override
  String get botEmailPerkRepliesOnly => 'Les bots vous répondent par e-mail';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Connecter une app de messagerie';

  @override
  String get chatAppsEmpty => 'Aucune app de messagerie pour l\'instant';

  @override
  String get chatAppsHelp =>
      'Permettez à d\'autres d\'écrire à ce bot depuis Telegram, e-mail, SMS, Slack, WhatsApp, Messenger, Feishu ou iMessage. Il ne répond qu\'aux personnes autorisées ; tous les autres sont consignés ici.';

  @override
  String get chatAppsAddHelp =>
      'Collez les identifiants depuis les réglages développeur de l\'app. Ils sont stockés chiffrés et ne sont plus affichés.';

  @override
  String get chatAppsKind => 'App';

  @override
  String get chatAppsSenders => 'Expéditeurs autorisés';

  @override
  String get chatAppsSendersHelp =>
      'Un par ligne : adresses e-mail (ou *@entreprise.com), numéros de téléphone ou identifiants utilisateur. Un doute sur un identifiant ? Laissez vide, écrivez au bot et copiez l\'identifiant depuis Activité.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Activez d\'abord « Utiliser cet ordinateur pour les bots » avec Messages autorisé dans l\'app de bureau sur votre Mac.';

  @override
  String chatAppsConnected(String name) {
    return '$name est connectée';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram envoie déjà les messages ici. Écrivez à votre bot pour essayer.';

  @override
  String get chatAppsPasteUrl =>
      'Collez cette adresse dans les réglages webhook de l\'app.';

  @override
  String get chatAppsWebhookUrl => 'Adresse du webhook';

  @override
  String get chatAppsVerifyToken => 'Jeton de vérification';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString expéditeurs autorisés',
      one: '$countString expéditeur autorisé',
      zero: 'Personne n\'est autorisé',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Activité';

  @override
  String get chatAppsNoActivity => 'Aucun message pour l\'instant.';

  @override
  String get chatAppsIgnored => 'Ignoré : absent de la liste autorisée';

  @override
  String get chatAppsAllow => 'Autoriser';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender peut désormais écrire à ce bot';
  }

  @override
  String get chatAppsRoutine => 'A démarré une routine';

  @override
  String get chatAppsFailed => 'Envoi impossible';

  @override
  String get chatAppsSent => 'Envoyé';

  @override
  String get chatAppsAnswered => 'A répondu';

  @override
  String get chatAppsRemove => 'Déconnecter';

  @override
  String get chBotToken => 'Jeton du bot';

  @override
  String get chAddress => 'Adresse e-mail';

  @override
  String get chApiKey => 'Clé API';

  @override
  String get chSigningSecret => 'Secret de signature';

  @override
  String get chPhoneNumber => 'Numéro de téléphone';

  @override
  String get chAccountSid => 'SID du compte';

  @override
  String get chAuthToken => 'Jeton d\'authentification';

  @override
  String get chPhoneNumberId => 'ID du numéro de téléphone';

  @override
  String get chAccessToken => 'Jeton d\'accès';

  @override
  String get chAppSecret => 'Secret de l\'app';

  @override
  String get chPageToken => 'Jeton d\'accès de la page';

  @override
  String get chAppId => 'ID de l\'app';

  @override
  String get chEncryptKey => 'Clé de chiffrement';

  @override
  String get chVerificationToken => 'Jeton de vérification';

  @override
  String get chPublicKey => 'Clé publique';

  @override
  String get chTrackerUser => 'L\'identifiant utilisateur du bot dans le suivi';

  @override
  String get chSiteUrl => 'Adresse du site (https://…)';

  @override
  String get chAccountEmail => 'E-mail du compte';

  @override
  String get routineMessage => 'À l\'arrivée d\'un message correspondant';

  @override
  String get triggerMessage => 'Messages';

  @override
  String get messageTriggerHelp =>
      'Démarre lorsqu\'un e-mail ou un message adressé à ce bot correspond. Connectez d\'abord l\'app dans Apps de messagerie.';

  @override
  String get messageTriggerAnyApp => 'N\'importe quelle app';

  @override
  String get messageTriggerSender => 'De (adresse, numéro ou *@entreprise.com)';

  @override
  String get messageTriggerSubject => 'Objet contient';

  @override
  String get messageTriggerWords => 'Le message contient';

  @override
  String callIncoming(String name) {
    return '$name appelle';
  }

  @override
  String get callAnswer => 'Répondre';

  @override
  String get callDecline => 'Refuser';

  @override
  String get callFullScreenTitle => 'Appels sur l\'écran verrouillé';

  @override
  String get callFullScreenOff =>
      'Désactivé : l\'appel d\'un bot n\'apparaît qu\'en notification. Touchez pour laisser les appels sonner en plein écran.';

  @override
  String get encryption => 'Chiffrer le contenu';

  @override
  String get encryptionHelp =>
      'Messages, souvenirs, tickets, pages et connaissances sont chiffrés avant stockage avec la propre clé de cet espace de travail. La recherche porte alors sur les titres et le sens, pas sur les mots exacts dans le texte chiffré.';

  @override
  String get encryptionOff => 'Désactivé';

  @override
  String get encryptionUnavailable =>
      'Indisponible : ce serveur n\'a aucune clé de chiffrement configurée';

  @override
  String get encryptionEncrypting =>
      'Activation : chiffrement des données déjà stockées';

  @override
  String get encryptionOnServer => 'Activé, avec la clé du serveur';

  @override
  String get encryptionOnKms => 'Activé, avec AWS KMS';

  @override
  String get encryptionDecrypting =>
      'Désactivation : déchiffrement des données stockées';

  @override
  String get encryptionConfirm =>
      'Le contenu sera chiffré avec la clé de cet espace de travail. Si l\'espace de travail est supprimé, sa clé est détruite et le contenu ne peut pas être récupéré. La recherche par mot exact ne correspond plus au texte chiffré.';

  @override
  String get encryptionTurnOn => 'Activer';

  @override
  String get encryptionRotate => 'Renouveler la clé';

  @override
  String get encryptionKeyManaged =>
      'Casama crée et conserve la clé de cet espace de travail pour vous, protégée par la propre clé du serveur. Il n\'y a rien à enregistrer ni à copier.';

  @override
  String get encryptionRotateTitle => 'Renouveler la clé ?';

  @override
  String get encryptionRotateBody =>
      'La clé de l\'espace de travail est de nouveau protégée avec la clé actuelle du serveur. Votre contenu reste lisible et rien n\'a besoin d\'être rechiffré. Faites-le après avoir changé la clé du serveur, ou régulièrement.';

  @override
  String get encryptionRotateHelp =>
      'Protège de nouveau la clé de l\'espace de travail avec la clé actuelle du serveur';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Dernier renouvellement : $when';
  }

  @override
  String get memoryBackend => 'Où la mémoire est stockée';

  @override
  String get memoryBuiltIn => 'Intégrée';

  @override
  String get memoryBackendHelp => 'Mémoire à long terme des bots';

  @override
  String get memoryBackendSheetHelp =>
      'Conservez la mémoire de vos bots dans Honcho ou Supermemory avec votre propre compte. L\'écran Mémoire, les exports et la suppression fonctionnent de la même façon.';

  @override
  String get memoryHonchoWorkspace => 'Espace de travail Honcho';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Laissez vide pour en utiliser un créé pour cet espace de travail Casama';

  @override
  String get memoryBaseUrl => 'Adresse du serveur (facultatif)';

  @override
  String get memoryBaseUrlHelp =>
      'Uniquement pour un serveur Honcho ou Supermemory auto-hébergé';

  @override
  String get memoryCopyExisting => 'Copier les souvenirs actuels';

  @override
  String get memoryUseBuiltIn => 'Réutiliser la mémoire intégrée';

  @override
  String get providerHintData => 'données payantes (lieux, e-mails, SEO)';

  @override
  String get kindA2a => 'Agent IA (A2A)';

  @override
  String get a2aAgentUrl => 'Adresse de l\'agent ou URL de la carte d\'agent';

  @override
  String get a2aAgentToken => 'Jeton d\'accès (facultatif)';

  @override
  String get a2a => 'Agent à agent (A2A)';

  @override
  String get a2aHelp =>
      'Des agents externes peuvent confier des tâches aux bots que vous publiez.';

  @override
  String get chromeExtensionSwitch => 'Casama pour Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Les membres peuvent utiliser l\'extension de navigateur avec cet espace de travail.';

  @override
  String get chromeActSwitch => 'Bots dans le navigateur des membres';

  @override
  String get chromeActSwitchHelp =>
      'Les membres peuvent laisser les bots ouvrir des pages et agir dans leur propre Chrome, dans un groupe d\'onglets qu\'ils peuvent arrêter.';

  @override
  String get a2aPublish => 'Publier en tant qu\'agent A2A';

  @override
  String get a2aPublishHelp =>
      'Les agents externes disposant d\'une clé API de l\'espace de travail peuvent confier des tâches à ce bot.';

  @override
  String get a2aWorkspaceOff =>
      'Activez d\'abord agent à agent dans les réglages de l\'espace de travail.';

  @override
  String get a2aCardUrl => 'Carte de l\'agent';

  @override
  String get phoneCalls => 'Appels téléphoniques';

  @override
  String get phoneCallsHelp =>
      'Laissez les bots appeler des établissements pour vous via votre compte Twilio. Chaque appel demande votre accord au préalable selon les approbations habituelles.';

  @override
  String get twilioSid => 'SID du compte';

  @override
  String get twilioToken => 'Jeton d\'authentification';

  @override
  String get twilioFrom => 'Les appels proviennent de';

  @override
  String get phoneCallsPersonal =>
      'Autoriser les appels vers des numéros personnels';

  @override
  String get phoneCallsCap => 'Appels par jour';

  @override
  String get phoneCallsOff => 'Non connecté';

  @override
  String get outCall => 'Appeler';

  @override
  String get outCallRinging => 'Ça sonne…';

  @override
  String get outCallLive => 'En appel';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Terminé après $secondsString s';
  }

  @override
  String get outCallEndedByYou => 'Vous avez raccroché';

  @override
  String get outCallTakenOver => 'Vous avez pris le relais de l\'appel';

  @override
  String get outCallFailed => 'N\'a pas abouti';

  @override
  String get outCallNothingYet => 'Rien n\'a encore été dit.';

  @override
  String get outCallTakeOver => 'Prendre le contrôle';

  @override
  String get outCallEnd => 'Terminer l\'appel';

  @override
  String get outCallYourPhone => 'Votre numéro de téléphone';

  @override
  String get outCallYourPhoneHelp =>
      'Format international, comme +33612345678. Laissez vide pour utiliser le numéro enregistré.';

  @override
  String get payments => 'Paiements';

  @override
  String get paymentsHelp =>
      'Laissez les bots payer des commerçants avec des cartes virtuelles à usage unique que vous approuvez à chaque fois. Utilisez votre propre compte Stripe Issuing.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent dépensés ce mois-ci sur $cap';
  }

  @override
  String get paymentsSheetHelp =>
      'Vous approuvez chaque carte, avec le montant affiché. Elle fonctionne une seule fois chez ce commerçant, pendant une heure, et jamais pour des titres, des cryptos, des cartes cadeaux ou des virements.';

  @override
  String get paymentsStripeKey => 'Clé secrète Stripe (avec Issuing)';

  @override
  String get paymentsWebhookSecret => 'Secret de signature du webhook';

  @override
  String get paymentsWebhook => 'Faites pointer un webhook Stripe ici';

  @override
  String get paymentsCardholder => 'Nom sur les cartes';

  @override
  String get paymentsAddress => 'Adresse de facturation';

  @override
  String get paymentsCity => 'Ville';

  @override
  String get paymentsState => 'Région ou État';

  @override
  String get paymentsZip => 'Code postal';

  @override
  String get paymentsCountry => 'Pays (2 lettres)';

  @override
  String get paymentsCap => 'Plafond de l\'espace de travail par mois (USD)';

  @override
  String get paymentsBotCap => 'Plafond par bot et par mois (USD)';

  @override
  String get links => 'Bots liés';

  @override
  String get linksRow => 'Lier avec le bot d\'un contact de confiance';

  @override
  String get linksHelp =>
      'Votre bot peut solliciter le bot d\'un contact lié, par exemple pour réserver un dîner. Chaque bot répond selon les règles de son propriétaire et ne partage que le nécessaire ; vous voyez tous deux chaque échange.';

  @override
  String get linksEmpty => 'Aucun bot lié pour l\'instant';

  @override
  String get linksInvite => 'Inviter un contact';

  @override
  String get linksContactName => 'Nom du contact';

  @override
  String get linksInviteReady => 'Envoyer cette invitation';

  @override
  String get linksInviteHelp =>
      'Envoyez-la à votre contact. Il l\'accepte dans Casama avec l\'un de ses bots. Elle fonctionne une fois, pendant 7 jours.';

  @override
  String get linksAccept => 'Accepter une invitation';

  @override
  String get linksAcceptHelp =>
      'Collez l\'invitation que votre contact vous a envoyée.';

  @override
  String get linksInviteText => 'Invitation';

  @override
  String linksActive(String bot) {
    return 'Lié à $bot';
  }

  @override
  String get linksPending => 'En attente de l\'acceptation de votre contact';

  @override
  String get linksRevoked => 'Dissocié';

  @override
  String get linksExchanges => 'Échanges';

  @override
  String get linksNoExchanges => 'Aucune demande pour l\'instant.';

  @override
  String get linksNoAnswer => 'Aucune réponse';

  @override
  String get linksWorking => 'En cours…';

  @override
  String get linksRevoke => 'Dissocier';

  @override
  String get wakeWord => 'Mot de réveil';

  @override
  String get wakeWordRow =>
      'Prononcez une phrase pour lancer un appel avec un bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'À l\'écoute de « $phrase »';
  }

  @override
  String get wakeWordHelp =>
      'Tant que Casama est ouvert, cet appareil écoute votre phrase et lance un appel en direct avec le bot choisi.';

  @override
  String get wakeWordListen => 'Écouter le mot de réveil';

  @override
  String get wakeWordPhrase => 'Phrase';

  @override
  String get wakeWordPhraseHelp => 'Deux ou trois mots, comme « dis casama »';

  @override
  String get wakeWordBot => 'Appeler ce bot';

  @override
  String get wakeWordDownloading => 'Téléchargement du modèle local…';

  @override
  String get wakeWordTest => 'Tester la phrase';

  @override
  String get wakeWordTesting => 'Écoute… prononcez votre phrase';

  @override
  String get wakeWordHeard => 'Entendu !';

  @override
  String get wakeWordStopTest => 'Arrêter';

  @override
  String get wakeWordPrivacy =>
      'L\'écoute se fait sur cet appareil avec un modèle open source (environ 18 Mo, téléchargé une fois). Rien n\'est envoyé tant que l\'appel ne démarre pas.';

  @override
  String get secretStore => 'Où les secrets sont conservés';

  @override
  String get secretStoreVault => 'Le coffre de ce serveur';

  @override
  String get secretStoreHelp =>
      'Conservez les secrets nommés des bots dans votre propre projet Infisical. Casama ne garde que le nom de chaque secret et où il peut être utilisé.';

  @override
  String get secretStoreSite => 'Adresse Infisical';

  @override
  String get secretStoreProject => 'ID du projet';

  @override
  String get secretStoreEnv => 'Environnement';

  @override
  String get secretStoreClientId => 'ID client de l\'identité machine';

  @override
  String get secretStoreClientSecret => 'Secret client';

  @override
  String get secretStoreMove => 'Déplacer les secrets actuels vers Infisical';

  @override
  String get secretStoreBack => 'Réutiliser le coffre de ce serveur';

  @override
  String get localServer => 'Exécuter Casama sur cet ordinateur';

  @override
  String get setupTitleMac => 'Configurer Casama sur ce Mac';

  @override
  String get setupTitle => 'Configurer Casama sur cet ordinateur';

  @override
  String get setupEntryMac => 'Exécuter sur ce Mac';

  @override
  String get setupEntry => 'Exécuter sur cet ordinateur';

  @override
  String get setupEntryHelp =>
      'Votre propre serveur privé sur cet ordinateur. Gratuit pour un usage personnel.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Serveur';

  @override
  String get setupStepAccount => 'Compte';

  @override
  String get setupStepModel => 'Modèle d\'IA';

  @override
  String get setupStepPhone => 'Téléphone';

  @override
  String get setupDockerChecking => 'Vérification de Docker…';

  @override
  String get setupDockerMissingTitle => 'D\'abord, installez Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'Le serveur de Casama s\'exécute dans Docker Desktop, une app gratuite qui l\'isole du reste de votre Mac.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Le serveur de Casama s\'exécute dans Docker, qui l\'isole du reste de votre ordinateur.';

  @override
  String get setupDockerGetMac => 'Télécharger Docker Desktop';

  @override
  String get setupDockerGetLinux => 'Ouvrir le guide d\'installation Docker';

  @override
  String get setupDockerStep1 =>
      'Ouvrez le fichier téléchargé et glissez Docker dans Applications.';

  @override
  String get setupDockerStep2 => 'Ouvrez Docker et acceptez ses conditions.';

  @override
  String get setupDockerStep3 =>
      'Revenez ici. Cette page continue toute seule.';

  @override
  String get setupDockerWaiting => 'En attente de Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker doit être lancé';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker est installé mais pas ouvert. Une fois Docker démarré, ce qui peut prendre une minute, cette page continue toute seule.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker est installé mais arrêté. Démarrez-le avec cette commande, et cette page continue toute seule.';

  @override
  String get setupDockerOpen => 'Ouvrir Docker';

  @override
  String get setupDockerOpening => 'Démarrage de Docker…';

  @override
  String get setupDockerPermissionTitle =>
      'Docker a besoin de votre permission';

  @override
  String get setupDockerPermissionBody =>
      'Docker est en cours d\'exécution, mais votre utilisateur n\'a pas le droit de l\'utiliser. Exécutez cette commande, puis fermez et rouvrez votre session.';

  @override
  String get setupDockerComposeTitle => 'Compose est absent de Docker';

  @override
  String get setupDockerComposeBody =>
      'Ce Docker n\'a pas Compose v2. Docker Desktop l\'inclut ; sous Linux, installez le paquet docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Ignoré';

  @override
  String get setupArtDocker => 'D\'abord, le conteneur où vit votre serveur.';

  @override
  String get setupArtServer =>
      'Construction de votre espace. C\'est l\'étape la plus longue.';

  @override
  String get setupArtAccount => 'Votre serveur fonctionne !';

  @override
  String get setupArtModel => 'Donnez-lui maintenant un cerveau.';

  @override
  String get setupArtPhone => 'Dernière étape : emportez-le avec vous.';

  @override
  String get setupDockerSlowTitle => 'Cela prend du temps ?';

  @override
  String get setupDockerSlowMenuBar =>
      'Cherchez la baleine dans la barre de menus. Docker est prêt quand elle cesse de bouger.';

  @override
  String get setupDockerSlowTerms =>
      'Si Docker affiche une fenêtre demandant d\'accepter ses conditions, terminez d\'abord cette étape. Se connecter à Docker est facultatif.';

  @override
  String get setupDockerSlowRestart =>
      'Toujours bloqué ? Quittez Docker depuis son menu, puis appuyez sur Revérifier.';

  @override
  String get setupDockerSlowInstalled =>
      'Déjà installé ? Ouvrez Docker une fois depuis Applications pour qu\'il termine sa configuration.';

  @override
  String get setupDockerSlowOther =>
      'Vous utilisez OrbStack ou Colima à la place ? Démarrez-le. Casama fonctionne avec tout Docker qui répond à docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Exécutez docker info dans un terminal pour voir ce que Docker répond.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker a répondu : $detail';
  }

  @override
  String get setupDockerRecheck => 'Revérifier';

  @override
  String get setupDockerGuide => 'Guide de dépannage';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Il ne reste que $gb Go d\'espace disque libre. Le serveur a besoin d\'environ $need Go.';
  }

  @override
  String get setupServerTitle => 'Télécharger et démarrer votre serveur';

  @override
  String get setupServerBody =>
      'Un téléchargement d\'environ 2,5 Go qui prend 5 à 10 minutes la première fois, puis environ 10 Go de disque une fois installé. Vous pouvez continuer à utiliser votre ordinateur.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Un téléchargement de $download Go, puis environ $disk Go de disque une fois installé. La première fois prend 5 à 10 minutes. Vous pouvez continuer à utiliser votre ordinateur.';
  }

  @override
  String get setupServerBodyNothing =>
      'Tout le nécessaire est déjà sur cet ordinateur, il démarre donc en une ou deux minutes.';

  @override
  String get setupServerStart => 'Démarrer';

  @override
  String get setupServerStageDownload => 'Téléchargement du serveur';

  @override
  String get setupServerStagePrepare => 'Préparation';

  @override
  String get setupServerStageParts => 'Téléchargement des composants';

  @override
  String setupServerDownloaded(int megabytes) {
    return '$megabytes Mo jusqu\'ici';
  }

  @override
  String get setupServerStagePartsNote => 'L\'étape la plus longue';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$done sur $total téléchargés jusqu\'ici';
  }

  @override
  String get setupServerStageStart => 'Démarrage';

  @override
  String get setupServerStageWait => 'En attente de réponse';

  @override
  String get setupServerKeepOpen => 'Gardez Casama ouvert jusqu\'à la fin.';

  @override
  String get setupServerFailed => 'Le serveur n\'a pas démarré.';

  @override
  String get setupServerConnecting => 'Prêt. Connexion…';

  @override
  String get setupShowDetails => 'Afficher les détails';

  @override
  String get setupHideDetails => 'Masquer les détails';

  @override
  String get setupAccountTitle => 'Créer votre compte';

  @override
  String get setupAccountBody =>
      'Il réside uniquement sur cet ordinateur et il possède ce serveur. Aucun e-mail n\'est envoyé.';

  @override
  String get setupAccountName => 'Votre nom';

  @override
  String get setupAccountNameMissing => 'Saisissez votre nom';

  @override
  String get setupAccountCreate => 'Créer le compte';

  @override
  String get setupAccountHave => 'J\'ai déjà un compte ici';

  @override
  String get setupAccountNew => 'Créer plutôt un nouveau compte';

  @override
  String get setupAccountSignInTitle => 'Se connecter à votre serveur';

  @override
  String get setupAccountSignInBody =>
      'Utilisez le compte que vous avez créé sur ce serveur.';

  @override
  String get setupAccountClosed =>
      'Ce serveur a déjà son propriétaire. Connectez-vous avec ce compte.';

  @override
  String get setupAccountPreparing => 'Préparation de votre espace…';

  @override
  String get setupModelTitle => 'Donner un modèle à vos bots';

  @override
  String get setupModelBody =>
      'Les bots ont besoin d\'un modèle d\'IA pour réfléchir. Connectez-vous avec un forfait ChatGPT, ou collez une clé OpenRouter, Google ou d\'un autre fournisseur.';

  @override
  String get setupSkip => 'Ignorer pour l\'instant';

  @override
  String get setupPhoneTitle => 'Connecter votre téléphone';

  @override
  String get setupPhoneBody =>
      'Casama Link attribue une adresse privée à cet ordinateur pour que votre téléphone le joigne de partout. Vous l\'approuvez une fois avec un compte Casama Cloud gratuit. Vos discussions restent sur cet ordinateur.';

  @override
  String get setupPhoneTurnOn => 'Attribuer une adresse à cet ordinateur';

  @override
  String get setupPhoneScanTitle =>
      'Scannez ceci avec l\'appareil photo de votre téléphone';

  @override
  String get setupPhoneScanBody =>
      'Cela ouvre Casama sur le téléphone et vous connecte. Si Casama n\'y est pas encore installé, la page ouverte indique où l\'obtenir.';

  @override
  String get setupPhoneWaiting => 'En attente de votre téléphone…';

  @override
  String get setupPhoneConnected => 'Téléphone connecté';

  @override
  String get setupPhoneConnectedBody =>
      'Votre téléphone est connecté. Affichez un nouveau code pour ajouter un autre appareil.';

  @override
  String get setupPhoneOwnerOnly =>
      'Seul le propriétaire de ce serveur peut lui attribuer une adresse.';

  @override
  String get setupFinish => 'Terminer';

  @override
  String get setupCardTitle => 'Terminer la configuration';

  @override
  String get setupCardModel =>
      'Ajoutez un modèle d\'IA pour que vos bots puissent répondre.';

  @override
  String get setupCardPhone => 'Connectez votre téléphone à cet ordinateur.';

  @override
  String get setupCardOpen => 'Continuer la configuration';

  @override
  String get desktopUsers => 'Utilisateurs du bureau simultanés';

  @override
  String get desktopUsersHelp =>
      'Les bots de cet ordinateur d\'équipe partagent un même écran. Les autres patientent (et continuent de travailler avec le terminal, les fichiers et le navigateur) pendant qu\'il est utilisé.';

  @override
  String desktopUsersCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots',
      one: '$countString bot',
    );
    return '$_temp0';
  }

  @override
  String deviceAccessAsk(String kind, String bot) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '$bot souhaite utiliser votre calendrier',
      'reminders': '$bot souhaite utiliser vos rappels',
      'contacts': '$bot souhaite utiliser vos contacts',
      'places': '$bot souhaite utiliser vos lieux',
      'photos': '$bot souhaite utiliser vos photos',
      'health': '$bot souhaite utiliser vos données de santé',
      'notifications': '$bot souhaite utiliser vos notifications',
      'activity': '$bot souhaite utiliser l\'activité de votre ordinateur',
      'browserTab':
          '$bot souhaite utiliser l\'onglet actuel de votre navigateur',
      'browserHistory':
          '$bot souhaite utiliser l\'historique et les favoris de votre navigateur',
      'alarm': '$bot souhaite utiliser vos alarmes',
      'home': '$bot souhaite utiliser vos accessoires Maison',
      'other': '$bot souhaite utiliser les données de votre appareil',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Uniquement dans vos propres discussions. Vous pouvez y mettre fin à tout moment dans Réglages → Connexions de l\'appareil.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Autorisé à utiliser votre calendrier',
      'reminders': 'Autorisé à utiliser vos rappels',
      'contacts': 'Autorisé à utiliser vos contacts',
      'places': 'Autorisé à utiliser vos lieux',
      'photos': 'Autorisé à utiliser vos photos',
      'health': 'Autorisé à utiliser vos données de santé',
      'notifications': 'Autorisé à utiliser vos notifications',
      'activity': 'Autorisé à utiliser l\'activité de votre ordinateur',
      'browserTab': 'Autorisé à utiliser l\'onglet actuel de votre navigateur',
      'browserHistory': 'Autorisé à utiliser l\'historique et les favoris de votre navigateur',
      'alarm': 'Autorisé à utiliser vos alarmes',
      'home': 'Autorisé à utiliser vos accessoires Maison',
      'other': 'Autorisé à utiliser les données de votre appareil',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Non partagé';

  @override
  String get deviceKindCalendar => 'calendrier';

  @override
  String get deviceKindReminders => 'rappels';

  @override
  String get deviceKindContacts => 'contacts';

  @override
  String get deviceKindPlaces => 'lieux';

  @override
  String get deviceKindPhotos => 'photos';

  @override
  String get deviceKindHealth => 'données de santé';

  @override
  String get deviceKindNotifications => 'notifications';

  @override
  String get deviceKindActivity => 'activité de l\'ordinateur';

  @override
  String get deviceKindBrowserTab => 'onglet actuel du navigateur';

  @override
  String get deviceKindBrowserHistory => 'historique et favoris du navigateur';

  @override
  String get deviceKindAlarm => 'alarmes';

  @override
  String get deviceKindHome => 'accessoires Maison';

  @override
  String get deviceBrowserAsks =>
      'Ce que les bots peuvent demander à votre navigateur';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama pour Chrome répond en direct et rien n\'est conservé. Activez ou désactivez ces options dans les réglages de l\'extension.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Ne plus laisser $bot demander';
  }

  @override
  String get deviceConnections => 'Connexions de l\'appareil';

  @override
  String get deviceConnectionsHelp =>
      'Partagez des données de cet appareil avec vos bots. Chaque catégorie est désactivée par défaut, et seuls les bots autorisés peuvent la lire, uniquement dans vos propres discussions.';

  @override
  String get deviceConnectionsNone =>
      'Cet appareil ne peut pas encore partager de données. Sur votre téléphone, ouvrez Casama et activez ce que vous souhaitez partager.';

  @override
  String get deviceKeepFor => 'Conserver pendant';

  @override
  String get deviceKeepLiveOnly => 'En direct uniquement';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString jours',
      one: '$countString jour',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Modèles privés uniquement';

  @override
  String get devicePrivateModelHelp =>
      'Seuls les bots sur un modèle local peuvent le lire';

  @override
  String get deviceNoBots =>
      'Aucun bot pour l\'instant. Un bot demande lorsqu\'il en a besoin, ou autorisez-en un maintenant.';

  @override
  String get deviceAllowBot => 'Autoriser un bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Quel bot peut lire votre calendrier ?',
      'reminders': 'Quel bot peut lire vos rappels ?',
      'contacts': 'Quel bot peut lire vos contacts ?',
      'places': 'Quel bot peut lire vos lieux ?',
      'photos': 'Quel bot peut lire vos photos ?',
      'health': 'Quel bot peut lire vos données de santé ?',
      'notifications': 'Quel bot peut lire vos notifications ?',
      'activity': 'Quel bot peut lire l\'activité de votre ordinateur ?',
      'browserTab': 'Quel bot peut lire l\'onglet actuel de votre navigateur ?',
      'browserHistory': 'Quel bot peut lire l\'historique et les favoris de votre navigateur ?',
      'alarm': 'Quel bot peut lire vos alarmes ?',
      'home': 'Quel bot peut lire vos accessoires Maison ?',
      'other': 'Quel bot peut lire les données de votre appareil ?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama n\'a pas l\'autorisation. Autorisez-la dans les réglages système, puis réessayez.';

  @override
  String get deviceOtherDevices => 'Vos autres appareils';

  @override
  String get deviceForget => 'Oublier cet appareil';

  @override
  String get deviceBrowsers => 'Navigateurs utilisables par les bots';

  @override
  String get deviceBrowsersHelp =>
      'Associés dans Casama pour Chrome. Les bots autorisés y travaillent dans leur propre groupe d\'onglets, connectés avec votre compte.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '$count bot',
      zero: 'Aucun bot pour l\'instant',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'En ligne';

  @override
  String get deviceBrowserOffline => 'Hors ligne';

  @override
  String get deviceBrowserUnpair => 'Dissocier ce navigateur';

  @override
  String get deviceBrowserAllBots => 'Tous les bots';

  @override
  String get deviceChromeNotPaired => 'Casama pour Chrome : non associé';

  @override
  String get deviceChromeHowToPair =>
      'Installez Casama pour Chrome, connectez-vous, puis ouvrez Plus → « Laisser les bots utiliser ce navigateur ».';

  @override
  String get deviceConnectionsRowHelp =>
      'Calendrier, contacts et plus depuis cet appareil';

  @override
  String get healthExtraCycle => 'Suivi du cycle';

  @override
  String get healthExtraGlucose => 'Glycémie';

  @override
  String get healthExtraBloodPressure => 'Tension artérielle';

  @override
  String get appleHealth => 'Apple Santé';

  @override
  String get appleHealthAbout =>
      'Lit les résumés quotidiens de votre sommeil, activité, entraînements et fréquence cardiaque depuis Apple Santé (HealthKit), uniquement quand cette option est activée. Casama n\'écrit jamais dans Apple Santé.';

  @override
  String get healthNotMedical =>
      'Résumés quotidiens uniquement (sommeil, activité, entraînements, cœur). Les bots décrivent l\'évolution par rapport à vos habitudes et ne donnent jamais d\'avis médical.';

  @override
  String get healthNeedsEncryption =>
      'Les données de santé nécessitent le chiffrement au repos. Activez-le pour un espace de travail dont vous êtes propriétaire, puis réessayez.';

  @override
  String get placeAddHere => 'Ajouter là où je suis';

  @override
  String get placeName => 'Nommez ce lieu (Maison, Travail, Salle de sport)';

  @override
  String get placeNoLocation =>
      'Votre position n\'est pas disponible. Autorisez la localisation pour Casama, puis réessayez.';

  @override
  String get placesHelp =>
      'Les bots sont avertis lorsque vous arrivez à ces lieux ou les quittez. Seuls le nom du lieu et l\'heure sont partagés, jamais votre itinéraire.';

  @override
  String get watchedAppsHelp =>
      'Seules les notifications de ces apps sont partagées. Les codes à usage unique sont masqués avant que quoi que ce soit quitte votre téléphone.';

  @override
  String get watchedAppAdd => 'Ajouter une app (nom ou ID de paquet)';

  @override
  String get providerHintMaps => 'temps de trajet pour partir à l\'heure';

  @override
  String routineDevice(String event, String detail) {
    return 'Sur votre téléphone : $event $detail';
  }

  @override
  String get ctxSelection => 'Texte sélectionné';

  @override
  String get ctxAddScreenshot => 'Ajouter une capture d\'écran';

  @override
  String get ctxScreenshotAdded => 'Capture d\'écran ajoutée';

  @override
  String get ctxScreenshotFailed =>
      'Impossible de prendre une capture d\'écran. Autorisez l\'enregistrement de l\'écran pour Casama dans vos réglages système.';

  @override
  String get watchedFolders => 'Dossiers surveillés';

  @override
  String get watchedFoldersHelp =>
      'Un nouveau fichier dans l\'un de ces dossiers peut déclencher une routine (par exemple, classer les nouveaux PDF dans Téléchargements). Seul son nom est partagé ; les bots ne lisent le fichier que s\'ils travaillent sur cet ordinateur.';

  @override
  String get whyTitle => 'Pourquoi est-ce affiché ?';

  @override
  String whyData(String data) {
    return 'Utilisé : $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Urgence : $urgency';
  }

  @override
  String get heldMeeting =>
      'Il a attendu pendant votre réunion et est arrivé avec votre résumé.';

  @override
  String get heldFocus =>
      'Il a attendu pendant le mode Concentration et est arrivé avec votre résumé.';

  @override
  String get heldDriving =>
      'Il a attendu pendant que vous conduisiez et est arrivé avec votre résumé.';

  @override
  String get heldCap =>
      'Le bot avait déjà envoyé 5 messages aujourd\'hui, celui-ci a donc attendu votre résumé.';

  @override
  String get heldLow =>
      'Ce n\'était pas urgent, il a donc attendu votre résumé au lieu de faire vibrer votre téléphone.';

  @override
  String get lessLikeThis => 'Moins de ce genre';

  @override
  String get lessLikeThisDone => 'Compris, moins de ce genre';

  @override
  String get widgetStatusWorking => 'En cours…';

  @override
  String get widgetStatusOff => 'Désactivé';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner =>
      'Suspendu par le propriétaire de l\'instance';

  @override
  String get previewHi => 'Bonjour !';

  @override
  String get previewAsk => 'Pouvez-vous ranger mes notes ?';

  @override
  String get previewOnIt => 'Je m\'en occupe';

  @override
  String get previewDone =>
      'Terminé ! Elles sont maintenant dans trois dossiers.';

  @override
  String get previewMessage => 'Message';

  @override
  String get fontPreviewGreeting => 'Bonjour';

  @override
  String get photosFromUnsplash => 'Photos d\'Unsplash';

  @override
  String get showBotSteps => 'Afficher les étapes du bot';

  @override
  String get showBotStepsHelp =>
      'Commandes et erreurs techniques dans chaque discussion.';

  @override
  String get showScreenCard =>
      'Afficher l\'écran du bot pendant qu\'il travaille';

  @override
  String get showScreenCardHelp =>
      'Une petite carte en direct dans la discussion. Touchez-la pour l\'ouvrir en plein écran.';

  @override
  String get showReplyUsage => 'Afficher l\'utilisation sous les réponses';

  @override
  String get showReplyUsageHelp =>
      'Le coût de chaque réponse, sur une ligne en dessous.';

  @override
  String get openLinksInApp => 'Ouvrir les liens dans l\'app';

  @override
  String get openLinksInAppHelp =>
      'Les liens web s\'ouvrent dans un navigateur intégré à Casama. Désactivé : ils s\'ouvrent dans votre navigateur par défaut.';

  @override
  String replyUsageTokens(String count) {
    return '$count jetons';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount sur vos clés';
  }

  @override
  String get replyUsageOnPlan => 'Sur votre forfait ChatGPT';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount jusqu\'ici';
  }

  @override
  String get replyUsageTooltip => 'Coût de cette réponse';

  @override
  String get replyUsageTitle => 'Coût de cette réponse';

  @override
  String get replyUsageFromCredits => 'Depuis vos crédits';

  @override
  String get replyUsageYourKeys => 'Sur vos propres clés';

  @override
  String get replyUsageTotal => 'Total';

  @override
  String get replyUsageTime => 'Durée';

  @override
  String get replyUsageTokensLabel => 'Jetons';

  @override
  String get replyUsageSteps => 'Étapes';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Inclut $n exécutions auxiliaires',
      one: 'Inclut $n exécution auxiliaire',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'Rien n\'a été facturé pour cette réponse.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 crédit = $price. Vos propres clés et forfaits sont facturés par leur fournisseur, pas par Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Ouvrir l\'exécution';

  @override
  String get replyUsageLoadFailed =>
      'Impossible de charger l\'utilisation de cette réponse.';

  @override
  String get replyUsageOurCost => 'Notre coût';

  @override
  String get replyUsageMargin => 'Marge';

  @override
  String replyUsageItemCost(String amount) {
    return 'Notre coût $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Notre coût et notre marge vous sont affichés car vous gérez ce serveur. Personne d\'autre ne les voit.';

  @override
  String get kindSpeechToText => 'Voix vers texte';

  @override
  String get kindVoice => 'Appels vocaux';

  @override
  String get kindImages => 'Images';

  @override
  String get kindVideo => 'Vidéo';

  @override
  String get kindSearch => 'Recherches web';

  @override
  String get kindData => 'Recherches de données';

  @override
  String get kindPhone => 'Appels téléphoniques';

  @override
  String get kindApps => 'Actions d\'app';

  @override
  String get activityReady => 'Préparation…';

  @override
  String get activitySearching => 'Recherche sur le web…';

  @override
  String get activityBrowsing => 'Navigation sur le web…';

  @override
  String get activityComputer => 'Travail sur son ordinateur…';

  @override
  String get activityFiles => 'Parcours des fichiers…';

  @override
  String get activityImage => 'Création d\'une image…';

  @override
  String get activityVideo => 'Création d\'une vidéo…';

  @override
  String get activityMemory => 'Vérification de ce qu\'il sait…';

  @override
  String get activityApps => 'Utilisation de vos apps…';

  @override
  String get activityScheduling => 'Configuration d\'un planning…';

  @override
  String get activityWorking => 'En cours…';

  @override
  String get activityWaitingForScreen =>
      'En attendant que vous rendiez le contrôle de l\'écran…';

  @override
  String get runFailedPlain =>
      'Un problème est survenu. Réessayez ou ouvrez Détails pour savoir pourquoi.';

  @override
  String get newKeyTitle => 'Copiez votre nouvelle clé';

  @override
  String get newKeyHelp =>
      'Elle n\'est affichée que cette fois. Collez-la dans l\'app que vous connectez, puis touchez Terminé.';

  @override
  String get copyKey => 'Copier la clé';

  @override
  String get keyCopied => 'Clé copiée';

  @override
  String revokeApiKeyTitle(String name) {
    return 'Révoquer « $name » ?';
  }

  @override
  String get revokeApiKeyBody =>
      'Les apps utilisant cette clé cessent aussitôt de se connecter. Cette action est irréversible ; pour reconnecter, créez une nouvelle clé.';

  @override
  String unlinkTitle(String name) {
    return 'Dissocier « $name » ?';
  }

  @override
  String get unlinkBody =>
      'Les bots cessent aussitôt de communiquer entre eux. Pour les lier à nouveau, une nouvelle invitation est nécessaire.';

  @override
  String get alreadyMember => 'Vous êtes déjà dans cet espace de travail.';

  @override
  String get askAdminToInvite =>
      'Seuls les propriétaires et admins peuvent inviter des personnes. Demandez un lien d\'invitation à l\'un d\'eux.';

  @override
  String get askBeforeJoining => 'Me demander avant qu\'une personne rejoigne';

  @override
  String get askBeforeJoiningHelp =>
      'Un admin approuve chaque personne qui utilise le lien.';

  @override
  String get askToJoin => 'Demander à rejoindre';

  @override
  String get customLinks => 'Liens personnalisés';

  @override
  String get customLinksHelp =>
      'Liens avec leur propre rôle, expiration ou nombre d\'utilisations.';

  @override
  String get emailAddresses => 'Adresses e-mail';

  @override
  String get emailAddressesHelp =>
      'Collez-en une ou plusieurs, séparées par des virgules ou des sauts de ligne.';

  @override
  String get getCode => 'Obtenir un code';

  @override
  String get getNewCode => 'Obtenir un nouveau code';

  @override
  String get getStarted => 'Commencer';

  @override
  String get welcomeCta => 'C\'est parti';

  @override
  String get inviteAsAdmin => 'Inviter comme admins';

  @override
  String get inviteByEmail => 'Inviter par e-mail';

  @override
  String get inviteExpired => 'Expirée';

  @override
  String inviteExpires(String when) {
    return 'Expire $when';
  }

  @override
  String get inviteInvalid => 'Cette invitation ne fonctionne pas';

  @override
  String get inviteInvalidHelp =>
      'Elle a peut-être expiré, atteint sa limite ou été désactivée. Demandez-en une nouvelle.';

  @override
  String get inviteLink => 'Lien d\'invitation';

  @override
  String get inviteLinkApprovalHelp =>
      'Toute personne ayant ce lien peut demander à rejoindre l\'espace. Vous l\'approuvez ci-dessous.';

  @override
  String get inviteLinkHelp =>
      'Toute personne ayant ce lien peut rejoindre l\'espace en tant que membre. Partagez-le dans une discussion ou par e-mail.';

  @override
  String get inviteLinkOrCode => 'Lien ou code d\'invitation';

  @override
  String inviteOtherServer(String host) {
    return 'Cette invitation concerne $host, et cette app est connectée à un autre serveur.';
  }

  @override
  String get inviteRenewed =>
      'L\'invitation fonctionne 7 jours de plus. Envoyez-lui le nouveau lien.';

  @override
  String inviteSentTo(String email) {
    return 'Connectez-vous avec $email pour accepter.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Rejoignez $workspace sur Casama : $url';
  }

  @override
  String invitedBy(String name) {
    return '$name vous a invité à rejoindre';
  }

  @override
  String get invitedToJoin => 'Invitation à rejoindre';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString invitations envoyées.',
      one: '$countString invitation envoyée.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Vous rejoindrez l\'espace en tant qu\'admin';

  @override
  String get joinAsMember => 'Vous rejoindrez l\'espace en tant que membre';

  @override
  String get joinByDomain => 'Rejoindre par nom de domaine e-mail';

  @override
  String get joinByDomainHelp =>
      'Les adresses vérifiées rejoignent sans invitation.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Toute personne ayant un e-mail @$domain vérifié peut rejoindre';
  }

  @override
  String get joinByDomainUnavailable =>
      'Disponible lorsque vous vous connectez avec un e-mail professionnel vérifié (pas gmail.com ou similaire).';

  @override
  String get joinNeedsApproval =>
      'Un admin approuve les nouveaux membres avant leur arrivée.';

  @override
  String get joinRequestSent => 'Demande envoyée';

  @override
  String joinRequestSentHelp(String name) {
    return 'Un admin de $name va l\'examiner. Vous recevrez une notification dès votre entrée.';
  }

  @override
  String get joinWithLinkOrCode => 'Rejoindre avec un lien ou un code';

  @override
  String get spacesInvite => 'Inviter des personnes';

  @override
  String spacesInviteTo(String name) {
    return 'Dans $name';
  }

  @override
  String get spacesNew => 'Nouvel espace de travail';

  @override
  String get spacesNewHint => 'Ses propres bots, membres et facturation';

  @override
  String get spacesJoin => 'Rejoindre un espace de travail';

  @override
  String get spacesJoinHint => 'Avec un lien ou un code d\'invitation';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Rejoindre $name';
  }

  @override
  String get joinedBotsHelp =>
      'Ces bots sont là pour aider. Dites bonjour à l\'un d\'eux pour commencer.';

  @override
  String get joinedNoBots =>
      'Il n\'y a aucun bot ici pour l\'instant. Créez-en un, ou explorez d\'abord.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString membres',
      one: '$countString membre',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Membres';

  @override
  String openToDomain(String domain) {
    return 'Ouvert à @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Ouvrir $name';
  }

  @override
  String get pendingInvites => 'Invitations pas encore acceptées';

  @override
  String get people => 'Personnes';

  @override
  String get workspaceAdvancedSummary =>
      'Secrets, mémoire, chiffrement, paiements, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Code d\'invitation, nom de domaine e-mail, liens personnalisés';

  @override
  String get inviteLinkToCopy => 'Lien d\'invitation, prêt à copier';

  @override
  String linkMade(String when) {
    return 'Créé $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Frais par serveur, serveurs Casama Link et clés';

  @override
  String get billingChargesSummary => 'Frais par serveur';

  @override
  String get billingUsageRow => 'Ce que les bots ont utilisé et son coût';

  @override
  String billingUsageSoFar(String amount) {
    return 'Ce mois-ci jusqu\'ici : $amount';
  }

  @override
  String get usageAdvancedSummary => 'Nombre de jetons, export JSON';

  @override
  String get peopleHelp => 'Invitez des personnes et décidez qui entre.';

  @override
  String get peopleRow =>
      'Inviter des personnes, approuver les demandes, voir les membres';

  @override
  String get qrCode => 'Code QR';

  @override
  String get remove => 'Retirer';

  @override
  String get resendInvite => 'Renvoyer';

  @override
  String get resetLink => 'Réinitialiser le lien';

  @override
  String get resetLinkHelp =>
      'Le lien actuel cesse aussitôt de fonctionner et vous en obtenez un nouveau. Les membres déjà présents restent.';

  @override
  String get revokeInvite => 'Annuler l\'invitation';

  @override
  String scanToJoin(String name) {
    return 'Scanner pour rejoindre $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Envoyer $countString invitations';
  }

  @override
  String get sendInvitesYourself => 'Envoyez ces invitations vous-même';

  @override
  String get sendInvitesYourselfHelp =>
      'L\'e-mail n\'est pas configuré sur ce serveur. Envoyez son lien à chaque personne, et elle se connecte avec cette adresse pour vous rejoindre.';

  @override
  String get signInToJoin => 'Se connecter pour rejoindre';

  @override
  String get startOwnWorkspace =>
      'Démarrer plutôt mon propre espace de travail';

  @override
  String switchToServer(String host) {
    return 'Basculer vers $host';
  }

  @override
  String get waitingToJoin => 'En attente d\'adhésion';

  @override
  String welcomeToWorkspace(String name) {
    return 'Bienvenue dans $name';
  }

  @override
  String get workspacesYouCanJoin => 'Espaces de travail à rejoindre';

  @override
  String get yourTeamIsHere => 'Votre équipe est déjà là';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Des personnes de $domain utilisent ces espaces de travail. Rejoignez-en un ou créez le vôtre.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Facile à lire à voix haute ou à saisir. Valable 48 heures. On le saisit dans Rejoindre avec un lien ou un code.';

  @override
  String get inviteSomeoneNew =>
      'Inviter une nouvelle personne dans l\'espace de travail';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app n\'accepte la connexion que sur une adresse sécurisée (https), et ce serveur Casama est à $address. Servez Casama en https pour utiliser la connexion.';
  }

  @override
  String get aboutYou => 'À propos de vous';

  @override
  String get aboutYouRow =>
      'Comment vos bots vous appellent et ce qu\'ils savent de vous';

  @override
  String get aboutYouIntro =>
      'Vos bots lisent ceci pour vous appeler par votre nom et répondre comme vous aimez. Personne d\'autre que vous ne peut le voir.';

  @override
  String get photoChange => 'Changer la photo de profil';

  @override
  String get photoTake => 'Prendre une photo';

  @override
  String get photoChoose => 'Choisir une photo';

  @override
  String get photoUseGoogle => 'Utiliser ma photo Google';

  @override
  String get photoRemove => 'Retirer la photo';

  @override
  String get photoUnreadable =>
      'Ce fichier n\'est pas une photo utilisable par Casama. Essayez un JPEG ou PNG.';

  @override
  String get whatToCallYou => 'Comment les bots doivent-ils vous appeler ?';

  @override
  String get pronounsOptional => 'Pronoms (facultatif)';

  @override
  String get aboutMe => 'À propos de moi';

  @override
  String get aboutMeHint =>
      'Votre travail, les personnes de votre vie, vos centres d\'intérêt. Tout ce qui aide.';

  @override
  String get replyStyle => 'Comment j\'aime les réponses';

  @override
  String get replyStyleHint =>
      'Par exemple : réponses courtes, pas d\'émojis, expliquez comme si je débutais';

  @override
  String get learnAboutMe => 'Apprendre sur moi depuis les discussions';

  @override
  String get learnAboutMeHelp =>
      'Les bots enregistrent des faits sur vous. Modifiez-les à tout moment.';

  @override
  String get adultSites => 'Sites pour adultes';

  @override
  String get adultSitesHelp =>
      'Les bots peuvent ouvrir des sites web pour adultes quand vous le demandez. 18 ans ou plus uniquement.';

  @override
  String get adultSitesConfirmTitle => 'Activer les sites pour adultes ?';

  @override
  String get adultSitesConfirmBody =>
      'Vous confirmez avoir 18 ans ou plus. Sur votre demande, les bots peuvent ouvrir des sites web pour adultes pour vous et en restituer le contenu en texte. Cela fonctionne depuis Casama sur le web ou l\'app de bureau, jamais dans les discussions partagées.';

  @override
  String get adultSitesConfirm => 'J\'ai 18 ans ou plus';

  @override
  String get adultSitesApprovalDetail =>
      'Autoriser signifie que vous confirmez avoir 18 ans ou plus et activez les sites pour adultes pour votre compte. Vous pouvez désactiver ceci dans À propos de vous.';

  @override
  String useInThisSpace(String workspace) {
    return 'Utiliser ce que j\'ai partagé dans $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Désactivé : seuls votre nom et votre style de réponse sont utilisés ici.';

  @override
  String get learnedAboutYou => 'Ce que les bots ont appris';

  @override
  String get noLearnedFacts =>
      'Rien pour l\'instant. Les faits que les bots apprennent sur vous en discussion s\'affichent ici.';

  @override
  String get addFact => 'Ajouter un fait';

  @override
  String get editFact => 'Modifier le fait';

  @override
  String get deleteFactTitle => 'Supprimer ce fait ?';

  @override
  String get deleteFactConfirm => 'Vos bots ne le sauront plus.';

  @override
  String get importToProfile => 'Importer depuis ChatGPT ou Claude';

  @override
  String get savedToProfile => 'Enregistré dans votre profil';

  @override
  String get undo => 'Annuler';

  @override
  String get suggestedLookApplied => 'Nouveau thème appliqué';

  @override
  String get suggestedLookUnavailable => 'Cette app n\'a pas ce thème';

  @override
  String get removedFromProfile => 'Retiré de votre profil';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString faits ajoutés',
      one: '$countString fait ajouté',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Vos bots l\'utiliseront dans chaque espace de travail. Vous pourrez le modifier plus tard dans Réglages → À propos de vous.';

  @override
  String get nameStepBubble => 'Ravi de faire votre connaissance !';

  @override
  String get heardFromTitle => 'Comment nous avez-vous connus ?';

  @override
  String get heardFromHelp =>
      'Un geste rapide nous aide à voir ce qui fonctionne. Vous pouvez passer.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Un ami';

  @override
  String get heardFromSearch => 'Recherche';

  @override
  String get heardFromAiAssistant => 'Un assistant IA';

  @override
  String get heardFromOther => 'Autre';

  @override
  String get heardFromSkip => 'Passer';

  @override
  String get nameStepHint => 'Votre nom';

  @override
  String get skillCatalogSubtitle =>
      'Compétences prêtes à l\'emploi que vos bots chargent quand une tâche le demande.';

  @override
  String get skillCategoryWork => 'Travail';

  @override
  String get skillCategoryWriting => 'Rédaction';

  @override
  String get skillCategoryResearch => 'Recherche';

  @override
  String get skillCategoryData => 'Données';

  @override
  String get skillCategoryMoney => 'Finances';

  @override
  String get skillCategoryBuild => 'Développement';

  @override
  String get skillCategoryLife => 'Vie perso';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString compétences',
      one: '$countString compétence',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Installée';

  @override
  String skillInstalledFor(String names) {
    return 'Installée pour $names';
  }

  @override
  String installSkillFor(String name) {
    return 'Installer $name pour';
  }

  @override
  String skillUseHint(String name) {
    return 'Les bots la chargent d\'eux-mêmes quand la tâche s\'y prête, ou tapez /$name dans une discussion pour l\'utiliser.';
  }

  @override
  String get skillInstructions => 'Instructions';

  @override
  String get skillAlreadyEverywhere => 'Installée partout où c\'est possible.';

  @override
  String get gallery => 'Galerie';

  @override
  String get galleryEmpty => 'Rien dans la galerie ne correspond.';

  @override
  String get galleryOffline =>
      'La galerie est inaccessible pour le moment. Les styles et compétences intégrés restent disponibles.';

  @override
  String get galleryUse => 'Utiliser';

  @override
  String get galleryInstall => 'Installer';

  @override
  String get galleryReport => 'Signaler';

  @override
  String get galleryShare => 'Partager dans la galerie';

  @override
  String galleryBy(String name) {
    return 'Par $name';
  }

  @override
  String get galleryFeatured => 'À la une';

  @override
  String get galleryAll => 'Tout';

  @override
  String get galleryThemes => 'Thèmes';

  @override
  String get gallerySchemes => 'Couleurs';

  @override
  String get galleryWallpapers => 'Fonds d\'écran';

  @override
  String get gallerySkills => 'Compétences';

  @override
  String get fromGallery => 'Galerie';

  @override
  String galleryApplied(String name) {
    return '$name actif';
  }

  @override
  String get gallerySeeAll => 'Tout voir';

  @override
  String get galleryInUse => 'Utilisé';

  @override
  String galleryInstalled(String name) {
    return '$name installé';
  }

  @override
  String get galleryPreviewDark => 'Aperçu en sombre';

  @override
  String get galleryPreviewLight => 'Aperçu en clair';

  @override
  String get galleryClearSearch => 'Effacer la recherche';

  @override
  String get galleryOfflineTitle => 'La galerie est hors ligne';

  @override
  String galleryNoMatches(String query) {
    return 'Aucun résultat pour « $query »';
  }

  @override
  String get galleryInstructions => 'Instructions';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern sur $palette';
  }

  @override
  String get galleryImage => 'Image';

  @override
  String get galleryMeshGradient => 'un dégradé fluide';

  @override
  String get galleryOwnDoodles => 'Motifs personnels';

  @override
  String get galleryLightAndDark => 'Clair et sombre';

  @override
  String get galleryContribute =>
      'Vous avez créé un style qui vous plaît ? Partagez-le et tout le monde sur Casama pourra le trouver ici.';

  @override
  String get galleryTypeTheme => 'Thème';

  @override
  String get galleryTypeScheme => 'Palette de couleurs';

  @override
  String get galleryTypeWallpaper => 'Fond d\'écran';

  @override
  String get galleryTypeSkill => 'Compétence';

  @override
  String get galleryBehindChats => 'Derrière vos discussions';

  @override
  String celebrateNewBot(String name) {
    return 'Dites bonjour à $name !';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name est prêt !';
  }

  @override
  String get celebrateJoined => 'Vous y êtes ! Bienvenue dans l\'espace.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name est prête.';
  }

  @override
  String get fewerEffects => 'Moins d\'effets';

  @override
  String get fewerEffectsHelp =>
      'Aucune célébration, aucun rebond d\'onglet ni bots animés.';

  @override
  String get settingsAppSection => 'App';

  @override
  String get settingsSecuritySection => 'Connexion et sécurité';

  @override
  String get customize => 'Personnaliser';

  @override
  String get customizeColors => 'Couleurs';

  @override
  String get appearanceCustomLook => 'Thème personnalisé';

  @override
  String get appearanceCustomHelp =>
      'Vos propres réglages. Enregistrez-les comme thème pour les garder.';

  @override
  String get appearanceFromGallery => 'Depuis la galerie';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Tout voir ($countString)';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Passé à $name';
  }

  @override
  String appearanceSaved(String name) {
    return '$name enregistré dans vos thèmes';
  }

  @override
  String get appearanceAboutTheme => 'À propos de ce thème';

  @override
  String settingsOnDevServer(String host) {
    return 'Réglages · serveur de développement $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Vous : $text';
  }

  @override
  String get chatPreviewPhoto => 'Photo';

  @override
  String get chatPreviewVideo => 'Vidéo';

  @override
  String get chatPreviewVoice => 'Message vocal';

  @override
  String get chatPreviewNone => 'Aucun message pour l\'instant';

  @override
  String get chatTimeYesterday => 'Hier';

  @override
  String get chatDayToday => 'Aujourd\'hui';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day à $time';
  }

  @override
  String get anyPriority => 'Toute priorité';

  @override
  String get readingAloud => 'Lecture à voix haute';

  @override
  String get readAloudPreparing => 'Préparation…';

  @override
  String get readAloudPaused => 'En pause';

  @override
  String get stopReading => 'Arrêter la lecture';

  @override
  String get readAloudSpeed => 'Vitesse de lecture';

  @override
  String readAloudTimeLeft(String time) {
    return '$time restant';
  }

  @override
  String get readAloudShowMessage => 'Afficher le message en cours de lecture';

  @override
  String mentionOpenProfile(String name) {
    return '$name, ouvrir le profil';
  }

  @override
  String get paywallSubtitle =>
      'Plus de bots, plus de temps d\'ordinateur et de nouveaux crédits chaque mois, pour que vos bots continuent de travailler.';

  @override
  String get paywallPerkBots => 'Bots';

  @override
  String get paywallPerkBotsBody => 'Toute une équipe, chacun avec son rôle.';

  @override
  String get paywallPerkComputers => 'Temps d\'ordinateur';

  @override
  String get paywallPerkComputersBody =>
      'Les bots ont leur propre ordinateur pour naviguer, coder et construire.';

  @override
  String get paywallPerkCredits => 'Crédits mensuels';

  @override
  String get paywallPerkCreditsBody =>
      'Pour les modèles, la recherche et les outils.';

  @override
  String get paywallPerkSeats => 'Places';

  @override
  String get paywallPerkSeatsBody =>
      'Invitez votre équipe dans le même espace de travail.';

  @override
  String paywallHours(String hours) {
    return '$hours h';
  }

  @override
  String get paywallWeekly => 'Hebdomadaire';

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallPerMonth => '/ mois';

  @override
  String get paywallPerYear => '/ an';

  @override
  String get paywallContinue => 'Continuer';

  @override
  String get paywallContinueCheckout => 'Passer au paiement';

  @override
  String get paywallRestore => 'Restaurer';

  @override
  String get paywallFineStore =>
      'Renouvellement automatique. Résiliable à tout moment dans les réglages de votre boutique.';

  @override
  String get paywallFineWeb =>
      'Renouvellement automatique. Résiliable à tout moment depuis Facturation.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, avec renouvellement automatique jusqu\'à résiliation. Le paiement est débité sur votre compte Apple. Résiliez à tout moment dans les réglages de votre compte Apple au moins 24 heures avant le renouvellement.',
      'google_play':
          '$price, avec renouvellement automatique jusqu\'à résiliation. Le paiement est débité sur votre compte Google Play. Résiliez à tout moment dans les paramètres de votre compte Google Play au moins 24 heures avant le renouvellement.',
      'other':
          '$price, avec renouvellement automatique jusqu\'à résiliation. Le paiement est débité sur le compte de votre boutique. Résiliez à tout moment dans les paramètres du compte de votre boutique au moins 24 heures avant le renouvellement.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratuit pendant $days jours, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
      one:
          'Gratuit pendant $days jour, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratuit pendant $days jours, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
      one:
          'Gratuit pendant $days jour, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratuit pendant $days jours, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
      one:
          'Gratuit pendant $days jour, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Le paiement est débité sur votre compte Apple à la fin de l\'essai gratuit. Résiliez dans les réglages de votre compte Apple au moins 24 heures avant la fin de l\'essai gratuit pour ne pas être facturé.',
      'google_play':
          '$_temp1 Le paiement est débité sur votre compte Google Play à la fin de l\'essai gratuit. Résiliez dans les paramètres de votre compte Google Play au moins 24 heures avant la fin de l\'essai gratuit pour ne pas être facturé.',
      'other':
          '$_temp2 Le paiement est débité sur le compte de votre boutique à la fin de l\'essai gratuit. Résiliez dans les paramètres du compte de votre boutique au moins 24 heures avant la fin de l\'essai gratuit pour ne pas être facturé.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Démarrer l\'essai gratuit';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours gratuits, puis $price/an',
      one: '$days jour gratuit, puis $price/an',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours gratuits, puis $price/mois',
      one: '$days jour gratuit, puis $price/mois',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, avec renouvellement automatique jusqu\'à résiliation. Résiliez à tout moment depuis Facturation ; vous conservez le forfait jusqu\'à la fin de la période.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratuit pendant $days jours, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
      one:
          'Gratuit pendant $days jour, puis $price, avec renouvellement automatique jusqu\'à résiliation.',
    );
    return '$_temp0 Résiliez dans Facturation avant la fin de l\'essai gratuit pour ne pas être facturé.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price par semaine',
      'year': '$price par an',
      'other': '$price par mois',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get aiConsentTitle =>
      'Vos discussions sont envoyées à des sociétés d\'IA';

  @override
  String get aiConsentBody =>
      'Pour rédiger ses réponses, Casama envoie ce que vous partagez avec vos bots à des fournisseurs d\'IA externes. Rien n\'est envoyé sans votre accord.';

  @override
  String get aiConsentUpdatedNotice =>
      'Nous avons ajouté les pages web à cette liste.';

  @override
  String get aiConsentWhatTitle => 'Ce qui est envoyé';

  @override
  String get aiConsentWhat =>
      'Vos messages, fichiers et photos, votre voix pendant les appels, les messages vocaux et la dictée, ce que les bots retiennent sur vous, les pages web que vos bots ouvrent pour vous (sur leur propre ordinateur ou dans le navigateur de cet appareil), ainsi que les données du téléphone que vous activez, comme le calendrier ou la santé.';

  @override
  String get aiConsentWhoTitle => 'Qui le reçoit';

  @override
  String get aiConsentWho =>
      'OpenRouter, qui le transmet à l\'entreprise créatrice du modèle que vous utilisez, comme DeepSeek, Google ou OpenAI. Les appels utilisent Google Gemini, et OpenAI transcrit les messages vocaux et la dictée. Les recherches web passent par Parallel, Serper ou DeepSeek. Avec votre propre clé API, les données sont plutôt envoyées à ce fournisseur.';

  @override
  String get aiConsentWhyTitle => 'Ce qu\'ils en font';

  @override
  String get aiConsentWhy =>
      'Ils l\'utilisent pour rédiger la réponse. Vous pouvez arrêter ce partage à tout moment dans Réglages › Confidentialité, et la politique de confidentialité en donne les détails.';

  @override
  String get aiConsentAgree => 'Accepter et continuer';

  @override
  String get aiConsentTile => 'Fournisseurs d\'IA';

  @override
  String get aiConsentTileOn =>
      'Autorisé. Ce que vous partagez avec les bots est transmis à des fournisseurs d\'IA externes pour rédiger les réponses.';

  @override
  String get aiConsentWithdrawQuestion =>
      'Arrêter le partage avec les fournisseurs d\'IA ?';

  @override
  String get aiConsentWithdrawBody =>
      'Les bots ne peuvent pas répondre sans eux. Casama vous redemandera votre accord avant tout nouvel envoi.';

  @override
  String get aiConsentWithdraw => 'Arrêter le partage';

  @override
  String get planChanged => 'Forfait modifié';

  @override
  String get purchasesRestored => 'Achats restaurés';

  @override
  String get creditsAdded => 'Crédits ajoutés';

  @override
  String get purchasePending =>
      'En attente de l\'approbation de l\'achat. Il sera ajouté dès validation.';

  @override
  String get purchaseFailed =>
      'L\'achat n\'a pas abouti et vous n\'avez pas été débité.';

  @override
  String get purchaseVerifyFailed =>
      'Nous n\'avons pas encore pu confirmer votre achat. La vérification est relancée automatiquement ; s\'il n\'apparaît pas bientôt, touchez Restaurer les achats.';

  @override
  String paywallTitleFor(String plan) {
    return 'Développez votre équipe avec $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Bienvenue sur $plan !';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mois gratuits',
      one: '$n mois gratuit',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Passer à $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Vous avez souscrit via l\'App Store. Pour changer de forfait, utilisez l\'App Store sur l\'appareil avec lequel vous avez souscrit.',
      'google_play': 'Vous avez souscrit via Google Play. Pour changer de forfait, utilisez Google Play sur l\'appareil avec lequel vous avez souscrit.',
      'other': 'Vous avez souscrit via une boutique d\'applications. Pour changer de forfait, utilisez cette boutique sur l\'appareil avec lequel vous avez souscrit.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Votre abonnement a été souscrit sur le web. Changez de forfait ici via le paiement web, ou gérez votre abonnement.';

  @override
  String get subscribedOutsideAppNote =>
      'Votre abonnement est facturé en dehors de cette app et ne peut donc pas être modifié ici.';

  @override
  String get outOfCreditsTitle => 'Vous n\'avez plus de crédits';

  @override
  String get outOfCreditsPaidBody =>
      'Vos bots sont en pause jusqu\'à ce que vous ajoutiez des crédits. Les packs de crédits de l\'App Store ou de Google Play n\'expirent jamais ; les packs de crédits achetés sur le web durent 12 mois.';

  @override
  String get outOfCreditsFreeBody =>
      'Passez à un forfait supérieur pour obtenir plus de crédits chaque mois, plus de bots et plus de temps d\'ordinateur.';

  @override
  String get addCredits => 'Ajouter des crédits';

  @override
  String get seePlansButton => 'Voir les forfaits';

  @override
  String get paywallAskAdmin =>
      'Seuls les propriétaires et admins de l\'espace de travail peuvent changer de forfait. Demandez à l\'un d\'eux de passer à un forfait supérieur.';

  @override
  String get upgradeToPro => 'Passer à Pro';

  @override
  String get upgradeToProBody =>
      'Plus de bots, temps d\'ordinateur et crédits mensuels.';

  @override
  String get manageTab => 'Gérer';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Mémoire';

  @override
  String get vitalsDisk => 'Disque';

  @override
  String get fixItTitle => 'Cela ne fonctionne pas bien ?';

  @override
  String get fixItSubtitle =>
      'Essayez ces étapes dans l\'ordre. Chacune va un peu plus loin.';

  @override
  String get fixRestart => 'Redémarrer';

  @override
  String get fixRestartHelp => 'Environ 20 secondes · rien n\'est perdu';

  @override
  String get fixResetSystem => 'Réinitialiser le système';

  @override
  String get fixResetSystemHelp => 'Un système neuf · vos fichiers restent';

  @override
  String get fixErase => 'Tout effacer';

  @override
  String get fixEraseHelp => 'Comme neuf · annulable pendant 7 jours';

  @override
  String get fixResetAction => 'Réinitialiser…';

  @override
  String get fixEraseAction => 'Effacer…';

  @override
  String get computerRestarting => 'Redémarrage…';

  @override
  String get computerRestarted => 'Redémarré. Tous vos fichiers sont là.';

  @override
  String get computerUpdateTitle => 'Mise à jour disponible';

  @override
  String get computerUpdateBody =>
      'De nouveaux outils et correctifs sont prêts. La mise à jour redémarre cet ordinateur : vos fichiers restent, les fenêtres ouvertes et programmes actifs se ferment.';

  @override
  String get computerUpdateBotWorking =>
      'Un bot travaille sur cet ordinateur en ce moment. La mise à jour arrête ce qu\'il fait.';

  @override
  String get computerUpdateNow => 'Mettre à jour';

  @override
  String get computerUpdateLater => 'Plus tard';

  @override
  String get computerUpdateConfirmTitle => 'Mettre à jour cet ordinateur ?';

  @override
  String get computerUpdateMenu => 'Mettre à jour l\'ordinateur';

  @override
  String get computerUpdating => 'Mise à jour…';

  @override
  String get computerUpdated => 'Mis à jour. Tous vos fichiers sont là.';

  @override
  String get computerUpdateBusyTitle => 'Une commande est toujours en cours';

  @override
  String get computerUpdateBusyBody =>
      'Mettre à jour maintenant l\'interrompt. Attendez qu\'elle se termine ou mettez à jour quand même.';

  @override
  String get computerUpdateAnyway => 'Mettre à jour quand même';

  @override
  String resetSheetTitle(String name) {
    return 'Réinitialiser $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots ne pourront pas l\'utiliser pendant environ une minute.';
  }

  @override
  String get resetSheetBusyNone =>
      'Il sera indisponible pendant environ une minute.';

  @override
  String get resetOptionSystem =>
      'Réinitialiser le système, garder mes fichiers';

  @override
  String get resetOptionSystemHelp =>
      'Répare les installations cassées, les réglages et les programmes bloqués.';

  @override
  String get resetOptionErase => 'Tout effacer';

  @override
  String get resetOptionEraseHelp => 'Retour à un ordinateur tout neuf.';

  @override
  String get resetKept => 'Conservés';

  @override
  String get resetRemoved => 'Supprimés';

  @override
  String get resetKeptFiles => 'Vos fichiers dans workspace';

  @override
  String get resetKeptSettings => 'Nom, réglages et bots';

  @override
  String get resetKeptRestorePoints => 'Points de restauration';

  @override
  String get resetRemovedApps => 'Apps et outils installés';

  @override
  String get resetRemovedPrograms => 'Programmes en cours';

  @override
  String get resetRemovedCaches => 'Caches et réglages du dossier personnel';

  @override
  String get resetRemovedFiles => 'Tous les fichiers, espace de travail inclus';

  @override
  String get resetSavePoint => 'Enregistrer d\'abord un point de restauration';

  @override
  String get resetSavePointHelp => 'Pour pouvoir annuler pendant 7 jours';

  @override
  String eraseTypeName(String name) {
    return 'Saisissez $name pour confirmer';
  }

  @override
  String get resetConfirmSystem => 'Réinitialiser le système';

  @override
  String get resetConfirmErase => 'Tout effacer';

  @override
  String get resetStepSaving => 'Enregistrement d\'un point de restauration';

  @override
  String get resetStepWipingSystem => 'Suppression des apps et réglages';

  @override
  String get resetStepWipingErase => 'Effacement de tous les fichiers';

  @override
  String get resetStepRestarting => 'Démarrage d\'un système neuf';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Réinitialisation… $stepString sur $totalString';
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

    return 'Effacement… $stepString sur $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Vous pouvez quitter cet écran. L\'opération continue toute seule.';

  @override
  String get resetDone => 'Système neuf prêt';

  @override
  String get eraseDone => 'Ordinateur effacé';

  @override
  String get resetFailed => 'La réinitialisation n\'a pas abouti';

  @override
  String get resetUndoHint =>
      'Annuler remet tout comme avant. Le point de restauration est conservé 7 jours.';

  @override
  String get restoredPrevious => 'Remis dans l\'état précédent';

  @override
  String get usageThisMonth => 'Ce mois-ci';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString h $minutesString min';
  }

  @override
  String get usageCostNote =>
      'Facturé uniquement lorsqu\'il est allumé. En veille, cela ne coûte rien.';

  @override
  String get usageNone => 'Pas encore utilisé ce mois-ci';

  @override
  String get sleepTimerTitle => 'Mise en veille après';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString min';
  }

  @override
  String get sleepTimerHour => '1 heure';

  @override
  String get sleepTimerHelp =>
      'Jamais pendant qu\'un bot travaille ou que vous l\'utilisez. Un délai plus long le laisse allumé plus longtemps, ce qui coûte plus.';

  @override
  String sleepTimerSaved(String label) {
    return 'Se met en veille après $label d\'inactivité';
  }

  @override
  String get storageTitle => 'Stockage';

  @override
  String storageOf(String total) {
    return 'sur $total';
  }

  @override
  String get storageFiles => 'Vos fichiers';

  @override
  String get storageApps => 'Apps et outils';

  @override
  String get storageCaches => 'Caches';

  @override
  String get storageBrowser => 'Navigateur';

  @override
  String get storageOther => 'Autre';

  @override
  String get storageFree => 'Disponible';

  @override
  String storageFreeUp(String size) {
    return 'Libérer $size';
  }

  @override
  String get storageNothingToClean => 'Aucun cache à vider';

  @override
  String storageFreed(String size) {
    return '$size libérés';
  }

  @override
  String get storageAsleep =>
      'Réveillez l\'ordinateur pour voir ce qui occupe de l\'espace.';

  @override
  String get processesTitle => 'En cours d\'exécution';

  @override
  String get processesNone =>
      'Rien ne s\'exécute à part l\'ordinateur lui-même.';

  @override
  String get processesAsleep => 'Rien ne s\'exécute pendant sa veille.';

  @override
  String get processStop => 'Arrêter';

  @override
  String processStopTitle(String name) {
    return 'Arrêter $name ?';
  }

  @override
  String get processStopMessage =>
      'Tout ce qu\'il n\'a pas enregistré est perdu.';

  @override
  String processStopped(String name) {
    return '$name arrêté';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu % CPU · $memory';
  }

  @override
  String get usedByTitle => 'Utilisé par';

  @override
  String get usedByNone => 'Aucun bot n\'utilise encore cet ordinateur.';

  @override
  String botLastActive(String when) {
    return 'Actif $when';
  }

  @override
  String get botNeverActive => 'Pas encore actif';

  @override
  String get restorePointsTitle => 'Points de restauration';

  @override
  String get restorePointsNone =>
      'Aucun pour l\'instant. Les bots en enregistrent un avant les modifications risquées.';

  @override
  String get restorePointSaveNow =>
      'Enregistrer un point de restauration maintenant';

  @override
  String get restorePointSaveTitle => 'Enregistrer un point de restauration';

  @override
  String get restorePointDefaultLabel => 'Enregistré manuellement';

  @override
  String get restorePointSaved => 'Point de restauration enregistré';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Tout afficher ($nString)';
  }

  @override
  String get historyTitle => 'Historique';

  @override
  String get historyNone => 'Rien ne s\'est encore passé.';

  @override
  String get historyStarted => 'Réveil';

  @override
  String get historySlept => 'Mise en veille';

  @override
  String get historySleptIdle => 'Mise en veille (aucune activité)';

  @override
  String get historyRestarted => 'Redémarrage';

  @override
  String get historyReset => 'Système réinitialisé';

  @override
  String get historyErased => 'Tout effacé';

  @override
  String get historyCheckpointCreated => 'Point de restauration enregistré';

  @override
  String get historyCheckpointRestored => 'Point de restauration restauré';

  @override
  String historyStorageCleaned(String size) {
    return '$size libérés';
  }

  @override
  String get historyStorageCleanedPlain => 'Espace libéré';

  @override
  String historyProcessStopped(String name) {
    return '$name arrêté';
  }

  @override
  String get historyUpdated => 'Réglages modifiés';

  @override
  String get historyYou => 'vous';

  @override
  String get yourDataTitle => 'Vos données';

  @override
  String get downloadAllFiles => 'Télécharger tous les fichiers';

  @override
  String get downloadAllFilesHelp => 'Un .zip de tout l\'espace de travail';

  @override
  String get downloadNothing =>
      'Il n\'y a aucun fichier à télécharger pour l\'instant.';

  @override
  String get deleteComputerHelp =>
      'Le supprime ainsi que ses points de restauration';

  @override
  String get manageComputer => 'Gérer';

  @override
  String get restartComputer => 'Redémarrer';

  @override
  String get resetComputerMenu => 'Réinitialiser…';

  @override
  String get moreFixes => 'Autres correctifs';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString min';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString h';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString j';
  }

  @override
  String get remoteUpdateTitle => 'Il est temps de mettre à jour Casama';

  @override
  String get remoteUpdateBody =>
      'Cette version de Casama n\'est plus prise en charge. Mettez-la à jour pour continuer.';

  @override
  String get remoteUpdateNoLink =>
      'Cette version de Casama n\'est plus prise en charge. Mettez-la à jour depuis l\'endroit où vous l\'avez installée.';

  @override
  String get remoteMaintenanceTitle => 'Casama est en maintenance';

  @override
  String get openLink => 'Ouvrir';

  @override
  String get routineIdeas => 'Idées';

  @override
  String get routineIdeasHelp =>
      'Partez d\'une idée, puis modifiez tout ce que vous voulez.';

  @override
  String get pluginDirectory => 'Plugins vérifiés';

  @override
  String get pluginDirectoryHelp =>
      'Vérifiés par Casama et figés sur la version vérifiée.';

  @override
  String get pluginOrPaste => 'Ou ajoutez-en un via un lien GitHub';

  @override
  String byAuthor(String name) {
    return 'Par $name';
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
  String get paywallBillingPeriod => 'Période de facturation';

  @override
  String get paywallNotSoldTitle => 'Aucun forfait sur ce serveur';

  @override
  String get paywallNotSoldBody =>
      'Ce serveur ne vend pas de forfaits ; il n\'y a donc rien à mettre à niveau ici.';

  @override
  String get paywallPlansFailedTitle => 'Les forfaits n\'ont pas pu charger';

  @override
  String get paywallPlansFailedBody =>
      'Vérifiez votre connexion, puis réessayez.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'L\'App Store n\'affiche aucun forfait',
      'google_play': 'Google Play n\'affiche aucun forfait',
      'other': 'La boutique n\'affiche aucun forfait',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Connectez-vous à l\'App Store sur cet appareil si ce n\'est pas déjà fait, puis réessayez.',
      'google_play': 'Connectez-vous à Google Play sur cet appareil si ce n\'est pas déjà fait, puis réessayez.',
      'other': 'Connectez-vous à la boutique sur cet appareil si ce n\'est pas déjà fait, puis réessayez.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Économisez jusqu\'à $pct %';
  }

  @override
  String get paywallMostPopular => 'Le plus populaire';

  @override
  String get paywallTaglinePlus => 'Pour vous et une poignée de bots';

  @override
  String get paywallTaglinePro => 'Pour une équipe active et un petit groupe';

  @override
  String get paywallTaglineMax =>
      'Pour les équipes dont les bots travaillent toute la journée';

  @override
  String get paywallPerMonthShort => '/mois';

  @override
  String paywallBilledYearly(String price) {
    return '$price facturés par an';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Revient à $price/mois';
  }

  @override
  String get paywallBilledMonthly => 'Facturation mensuelle';

  @override
  String get paywallBilledWeekly => 'Facturation hebdomadaire';

  @override
  String get paywallPerWeekShort => '/sem';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Soit $price par semaine';
  }

  @override
  String get paywallBilledYearlyPlain => 'Facturation annuelle';

  @override
  String get paywallPerYearShort => '/an';

  @override
  String paywallStartTrial(int n) {
    return 'Démarrer l\'essai gratuit de $n jours';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'S\'abonner à $plan';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personnes',
      one: '$count personne',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString heures d\'ordinateur';
  }

  @override
  String get billingChangePlan => 'Changer de forfait';

  @override
  String get billingChangePlanBody =>
      'Comparez chaque forfait, mensuel ou annuel.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'Ce que $plan vous offre';
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
  String get updatesRow => 'Mises à jour';

  @override
  String get updatesRowSubtitle => 'Nouvelles de votre espace de travail';

  @override
  String get updatesEmpty => 'Aucune mise à jour';

  @override
  String get updatesEmptyHelp =>
      'Les annonces de l\'espace de travail et les nouvelles pages s\'affichent ici. Ce que vos bots vous envoient est dans leurs discussions.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n éléments ont besoin de vous',
      one: '$n élément a besoin de vous',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'En cours : $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Pas maintenant : $title';
  }

  @override
  String openTopic(String title) {
    return 'Ouvrir $title';
  }

  @override
  String get newTopic => 'Nouveau sujet';

  @override
  String get topics => 'Sujets';

  @override
  String get olderTopics => 'Plus anciens';

  @override
  String get generalChat => 'Général';

  @override
  String get allTopics => 'Tous les sujets';

  @override
  String get cardSecrets => 'Secrets';

  @override
  String get cardApproval => 'Approbation';

  @override
  String get cardTakeover => 'Prendre le contrôle';

  @override
  String get cardDevice => 'Accès à l\'appareil';

  @override
  String get cardSuggestion => 'Suggestion';

  @override
  String get formBack => 'Retour';

  @override
  String get formNext => 'Suivant';

  @override
  String get formSkip => 'Passer';

  @override
  String formStep(int n, int total) {
    return 'Question $n sur $total';
  }

  @override
  String get cardSuggestions => 'Suggestions';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n points à voir de plus près',
      one: '$n point à voir de plus près',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Démarrée $when';
  }

  @override
  String get suggestionStartedPlain => 'Démarrée';

  @override
  String get suggestionPutAway => 'Écartée';

  @override
  String get suggestionExpired => 'Expirée';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Expirée : $title';
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
      other: 'Expire dans $nString minutes',
      one: 'Expire dans $nString minute',
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
      other: 'Expire dans $nString heures',
      one: 'Expire dans $nString heure',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n suggestions traitées',
      one: '$n suggestion traitée',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Utiliser ce serveur sur votre téléphone';

  @override
  String get linkIntro =>
      'Donnez à ce serveur une adresse joignable de partout par votre téléphone. Aucun nom de domaine ni réglage de routeur requis.';

  @override
  String get linkIntroDetails =>
      'Cela relie ce serveur à un compte Casama Cloud gratuit. Le trafic de votre téléphone passe par Cloudflare directement vers cet ordinateur, jamais par les serveurs de Casama.';

  @override
  String get linkTurnOn => 'Utiliser sur votre téléphone';

  @override
  String get linkSignupsNote =>
      'Les nouvelles inscriptions sont fermées tant que c\'est activé. Seules les personnes ayant déjà un compte ici peuvent se connecter.';

  @override
  String get linkStepSignIn => 'Lier ce serveur';

  @override
  String get linkSignInBody =>
      'Approuvez ce code sur la page qui vient de s\'ouvrir dans votre navigateur. Vérifiez que la page affiche le même code.';

  @override
  String get linkSignInOpen => 'Rouvrir la page';

  @override
  String get linkStepAddress => 'Obtenir une adresse';

  @override
  String get linkStepRestart => 'Redémarrer le serveur';

  @override
  String get linkStepConnect => 'Connecter';

  @override
  String get linkStateOnline => 'En ligne';

  @override
  String get linkStateStarting => 'Démarrage';

  @override
  String get linkStateOffline => 'Hors ligne';

  @override
  String get linkStateAttention => 'Attention requise';

  @override
  String get linkStateOff => 'Désactivé';

  @override
  String get linkAddress => 'Adresse';

  @override
  String get linkLocalAddress => 'Sur cet ordinateur';

  @override
  String get linkShowCode => 'Afficher le code de connexion';

  @override
  String get linkCheck => 'Revérifier';

  @override
  String get linkTurnOff => 'Désactiver';

  @override
  String get linkTurnOffConfirm =>
      'Désactiver l\'accès à distance ? L\'adresse cesse de fonctionner et les téléphones perdent l\'accès à ce serveur jusqu\'à réactivation. Il retrouvera la même adresse.';

  @override
  String get linkTurningOff => 'Désactivation';

  @override
  String get linkNeedsOwner =>
      'Seul le propriétaire de ce serveur peut activer ceci.';

  @override
  String get linkTwoStepTip =>
      'Ce serveur est maintenant accessible depuis internet. La connexion en deux étapes évite qu\'un mot de passe deviné suffise.';

  @override
  String get linkProblemNotLinked =>
      'Ce serveur n\'est pas lié à Casama Cloud. Réactivez-le pour le lier.';

  @override
  String get linkProblemCloudUnreachable =>
      'Casama Cloud est injoignable pour le moment. Si l\'adresse fonctionnait, elle fonctionne toujours.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud n\'accepte plus la clé de ce serveur. Réactivez-le pour le lier.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud a désactivé l\'accès à distance pour ce serveur.';

  @override
  String get linkProblemRemoved =>
      'Ce serveur a été retiré de son espace de travail dans Casama Cloud. Réactivez-le pour le lier.';

  @override
  String get linkProblemPlanLimit =>
      'Votre forfait Casama Cloud connecte moins de serveurs. Retirez-en un là-bas, ou passez à un forfait supérieur.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud n\'a plus d\'adresse pour ce serveur. Réactivez-le.';

  @override
  String get linkProblemAddressChanged =>
      'L\'adresse de ce serveur a changé. Réactivez-le pour utiliser la nouvelle.';

  @override
  String get connectProblemConnectorMissing =>
      'Le connecteur ne tourne pas. Vérifiez que Docker fonctionne, puis revérifiez.';

  @override
  String get connectProblemConnectorBlocked =>
      'Ce réseau bloque la connexion. Un VPN ou un pare-feu strict en est la cause habituelle (port sortant 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Tout est connecté, mais l\'adresse ne répond pas encore. Une nouvelle adresse peut prendre une minute.';

  @override
  String get linkServers => 'Serveurs liés';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Votre forfait connecte $limit serveurs.',
      one: 'Votre forfait connecte $limit serveur.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Aucun serveur lié pour l\'instant. Sur votre propre serveur, ouvrez Réglages, puis Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return 'Retirer $name ? Son adresse cesse de fonctionner. Le serveur pourra être lié à nouveau plus tard.';
  }

  @override
  String get linkStatusActive => 'Dispose d\'une adresse';

  @override
  String get linkStatusParked => 'Pas vu récemment';

  @override
  String get linkStatusSuspended => 'Suspendu';

  @override
  String get pairDevice => 'Se connecter sur un autre appareil';

  @override
  String get pairDeviceRow => 'Afficher un code à scanner avec votre téléphone';

  @override
  String get pairDeviceHelp =>
      'Scannez ceci avec l\'appareil photo de votre téléphone. Ou dans Casama sur le téléphone : Se connecter, puis Scanner un code.';

  @override
  String get pairDeviceWarning =>
      'Toute personne qui le scanne est connectée avec votre compte. Il fonctionne une fois, pendant quelques minutes.';

  @override
  String pairDeviceServer(String host) {
    return 'Connecte à $host';
  }

  @override
  String get pairDeviceNewCode => 'Nouveau code';

  @override
  String get pairDeviceExpired => 'Ce code a expiré.';

  @override
  String get pairDeviceNotReachable =>
      'Ce serveur ne répond que sur cet ordinateur, un téléphone ne peut donc pas encore le joindre.';

  @override
  String get pairDeviceNotReachableOther =>
      'L\'adresse de ce serveur ne fonctionne que sur son propre réseau. Demandez à son administrateur une adresse joignable par d\'autres.';

  @override
  String get pairDeviceCopyLink => 'Copier le lien';

  @override
  String get pairDeviceLinkCopied =>
      'Lien copié. Collez-le dans Casama pour Chrome ou sur un autre appareil.';

  @override
  String get pairDeviceConnectChrome => 'Connecter Chrome';

  @override
  String get pairDeviceChromeDone => 'Casama pour Chrome est connecté.';

  @override
  String get pairDeviceChromeFinish =>
      'Terminez dans l\'onglet Casama pour Chrome qui s\'est ouvert.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama pour Chrome n\'est pas installé dans ce navigateur.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama pour Chrome n\'a pas pu se connecter. $error';
  }

  @override
  String get scanToSignIn => 'Scanner un code depuis votre ordinateur';

  @override
  String get scanToSignInTitle => 'Scanner le code';

  @override
  String get scanToSignInHelp =>
      'Sur un ordinateur où votre session est ouverte, ouvrez Réglages, puis Se connecter sur un autre appareil.';

  @override
  String pairSignInTo(String host) {
    return 'Se connecter à $host ?';
  }

  @override
  String get pairSignInBody =>
      'Le code connecte cet appareil au compte qui l\'a affiché.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Cet appareil utilise $current actuellement. Se connecter à $host le remplace.';
  }

  @override
  String get pairSigningIn => 'Connexion';

  @override
  String get pairCodeInvalid =>
      'Ce code n\'est plus valide. Affichez-en un nouveau et scannez à nouveau.';

  @override
  String get pairLinkInvalid => 'Ceci n\'est pas un code de connexion Casama.';

  @override
  String get linkServerTitle => 'Lier un serveur';

  @override
  String linkServerBody(String name) {
    return '$name souhaite se connecter à votre compte Casama Cloud.';
  }

  @override
  String get linkServerCode => 'Code sur le serveur';

  @override
  String get linkServerCheck =>
      'Ne le liez que si vous avez lancé ceci sur votre propre serveur et qu\'il affiche ce même code.';

  @override
  String get linkServerWhat =>
      'Il obtient une adresse publique et peut vous envoyer des notifications. Il ne peut pas dépenser vos crédits.';

  @override
  String get linkServerApprove => 'Lier';

  @override
  String get linkServerDone => 'Lié';

  @override
  String linkServerDoneBody(String name) {
    return 'Revenez vers $name. Cela continue tout seul.';
  }

  @override
  String get linkServerInvalid =>
      'Ce code n\'est plus valide. Recommencez sur votre serveur.';

  @override
  String get linkServerEnterCode => 'Le code affiché par votre serveur';

  @override
  String get linkServerFind => 'Rechercher';

  @override
  String get linkServerNeedAdmin =>
      'Seuls les propriétaires et admins d\'un espace de travail peuvent lier un serveur.';

  @override
  String get localDockerStopped =>
      'Docker ne tourne pas, votre serveur est donc arrêté';

  @override
  String get localDockerStoppedBody =>
      'Votre serveur Casama s\'exécute dans Docker sur cet ordinateur. Ouvrez Docker et Casama se reconnecte tout seul dès que le serveur revient, ce qui peut prendre une minute.';

  @override
  String get serverOfflineTitle => 'Votre serveur est hors ligne';

  @override
  String get serverOfflineBody =>
      'L\'ordinateur qui l\'héberge est-il allumé et éveillé ? Ceci se reconnecte tout seul.';

  @override
  String get signUpsClosed =>
      'Ce serveur n\'accepte pas de nouveaux comptes. Connectez-vous avec un compte que vous avez déjà ici.';

  @override
  String get signUpsByInvitation =>
      'Les nouveaux comptes se font ici sur invitation. Utilisez l\'adresse e-mail qui a reçu l\'invitation.';

  @override
  String get linkPrivateNotifications => 'Notifications privées';

  @override
  String get linkPrivateNotificationsHelp =>
      'Les notifications arrivent sur votre téléphone via Casama Cloud. Avec cette option, elles ne contiennent aucun texte et affichent seulement « Nouvelle activité » ; l\'app charge le reste depuis ce serveur.';

  @override
  String get linkInvites => 'Laisser les personnes invitées s\'inscrire';

  @override
  String get linkInvitesHelp =>
      'Désactivé : personne ne peut créer de compte. Activé : les personnes que vous invitez par e-mail le peuvent. Changer ce réglage redémarre le serveur.';

  @override
  String get linkKeepAwake => 'Garder ce Mac éveillé sur secteur';

  @override
  String get linkKeepAwakeHelp =>
      'Les téléphones ne peuvent joindre ce serveur que lorsque cet ordinateur est éveillé et Casama ouvert.';

  @override
  String get linkLiveView => 'Vue en direct à distance';

  @override
  String get linkLiveViewIncluded =>
      'Inclus dans votre forfait. À distance de cet ordinateur, l\'écran d\'un bot s\'affiche en direct via le relais de Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Inclus à partir de Plus sur Casama Cloud. À distance de cet ordinateur, vous voyez l\'écran d\'un bot environ une fois par seconde. Sur cet ordinateur, c\'est toujours en direct.';

  @override
  String get liveAwayNeedsPlan =>
      'À distance de l\'ordinateur du serveur, la vidéo en direct est incluse à partir de Plus sur Casama Cloud. D\'ici là, l\'écran s\'actualise environ une fois par seconde.';

  @override
  String get chatShareExport => 'Partager ou exporter';

  @override
  String get chatShareExportHelp =>
      'Enregistrez cette discussion en fichier, ou créez un lien en lecture seule.';

  @override
  String get chatExportMarkdown => 'Exporter en Markdown';

  @override
  String get chatExportMarkdownHelp => 'Un fichier texte lisible par tous';

  @override
  String get chatExportJson => 'Exporter en JSON';

  @override
  String get chatExportJsonHelp => 'Pour d\'autres apps et des scripts';

  @override
  String get chatShareLink => 'Partager un lien en lecture seule';

  @override
  String get chatShareLinkHelp =>
      'Toute personne ayant le lien peut lire cette discussion';

  @override
  String get chatStopSharing => 'Arrêter le partage du lien';

  @override
  String get chatStopSharingHelp => 'Le lien cesse de fonctionner';

  @override
  String get chatMakePublicTitle => 'Partager cette discussion par lien ?';

  @override
  String get chatMakePublicBody =>
      'Toute personne ayant le lien peut lire cette discussion telle que vous la voyez. Les fichiers joints sont listés par nom, sans être partagés. Vous pouvez arrêter à tout moment.';

  @override
  String get chatMakePublic => 'Créer un lien';

  @override
  String get chatLinkTitle => 'Lien en lecture seule';

  @override
  String get chatLinkBody =>
      'Copié. Elle n\'est pas indexée dans les moteurs de recherche. Créer un nouveau lien désactive celui-ci.';

  @override
  String get chatSharingStopped => 'Le lien ne fonctionne plus';

  @override
  String get creationDuplicate => 'Dupliquer';

  @override
  String creationDuplicated(String title) {
    return 'Copie créée : « $title »';
  }

  @override
  String get slackInstall => 'Ajouter à Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Connectez un espace de travail Slack en une étape. $bot y répond aux @mentions et messages directs.';
  }

  @override
  String get slackInstallFinish => 'Terminez dans Slack, puis revenez ici.';

  @override
  String get helpAndSupport => 'Aide et support';

  @override
  String get helpAndSupportRow =>
      'Demander à Casama Help, nous contacter, guides';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Réponses instantanées depuis nos guides et votre compte. Un humain est à un toucher.';

  @override
  String get supportIntro =>
      'Questions, problème d\'achat ou dysfonctionnement ? Écrivez-nous.';

  @override
  String supportSelfHosted(String host) {
    return 'Votre espace de travail fonctionne sur $host. Pour la connexion, les comptes et les forfaits, adressez-vous au responsable de ce serveur. Nous pouvons vous aider pour l\'app elle-même.';
  }

  @override
  String get supportTalkToPerson => 'Parler à une personne';

  @override
  String get contactSupport => 'Contacter le support';

  @override
  String contactSupportRow(String email) {
    return 'Écrire à notre équipe à $email';
  }

  @override
  String get sendFeedback => 'Envoyer un avis';

  @override
  String get sendFeedbackRow =>
      'Idées, points forts et points faibles. Nous lisons chaque message.';

  @override
  String get feedbackHelp =>
      'Dites-nous ce que vous aimeriez que Casama fasse, ce que vous appréciez ou ce qui vous a gêné.';

  @override
  String get feedbackKindPrompt => 'Quel type d\'avis ?';

  @override
  String get feedbackKindIdea => 'Idée';

  @override
  String get feedbackKindLike => 'J\'aime';

  @override
  String get feedbackKindDislike => 'Je n\'aime pas';

  @override
  String get feedbackKindConfusing => 'Déroutant';

  @override
  String get feedbackMessageLabel => 'Votre avis';

  @override
  String get feedbackMessageHint =>
      'Par exemple : J\'aimerais pouvoir épingler une discussion en haut.';

  @override
  String get feedbackContactOk => 'Vous pouvez me contacter à ce sujet';

  @override
  String get feedbackContactOkHelp =>
      'Nous pourrons vous envoyer une question par e-mail ou vous prévenir quand ce sera fait.';

  @override
  String get feedbackNote =>
      'La version de votre app et votre forfait sont joints. Un problème avec votre compte ou un achat ? Utilisez plutôt Contacter le support.';

  @override
  String get feedbackThanks => 'Merci ! Nous lisons chaque message.';

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
  String get supportIdeasBoard => 'Tableau des idées';

  @override
  String get supportIdeasBoardHelp =>
      'Voyez ce que les autres ont demandé et votez pour vos priorités';

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
      'Expliquez-nous ce qui se passe. Nous vous répondrons par e-mail.';

  @override
  String get contactSupportHelpMail =>
      'Expliquez-nous ce qui se passe. Cela ouvre votre app de messagerie avec les détails préremplis.';

  @override
  String get supportSend => 'Envoyer';

  @override
  String get supportWriteEmail => 'Ouvrir l\'e-mail';

  @override
  String get supportTopicPrompt => 'De quoi s\'agit-il ?';

  @override
  String get supportTopicBilling => 'Facturation et achats';

  @override
  String get supportTopicBroken => 'Quelque chose ne fonctionne pas';

  @override
  String get supportTopicAccount => 'Compte et connexion';

  @override
  String get supportTopicQuestion => 'Une question ou une idée';

  @override
  String get supportTopicOther => 'Autre chose';

  @override
  String get supportMessageLabel => 'Votre message';

  @override
  String get supportMessageHint =>
      'Que s\'est-il passé et qu\'attendiez-vous ?';

  @override
  String get supportMessageMore =>
      'Ajoutez une phrase ou deux : ce que vous faisiez et ce qui n\'a pas fonctionné.';

  @override
  String get supportIncludeChat => 'Inclure ma conversation avec Casama Help';

  @override
  String get supportIncludeChatHelp =>
      'Pour éviter d\'avoir à tout réexpliquer.';

  @override
  String get supportDetailsNote =>
      'Nous joignons la version de l\'app et vos identifiants d\'espace de travail et de compte pour retrouver votre dossier. Jamais vos discussions.';

  @override
  String get supportSentTitle => 'Message envoyé';

  @override
  String supportSentBody(String email, String reference) {
    return 'Nous vous répondrons à $email. Votre référence est $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'Aucune app d\'e-mail trouvée, nous avons donc copié votre message. Collez-le dans un e-mail à $email.';
  }

  @override
  String get supportGuides => 'Guides et FAQ';

  @override
  String get supportGuidesHelp => 'Aide étape par étape pour tout dans Casama';

  @override
  String get introVideoTitle => 'Voir comment fonctionne Casama';

  @override
  String get introVideoSubtitle => 'Une vidéo d\'une minute trente';

  @override
  String get supportIntroVideo => 'Regarder la vidéo d\'intro';

  @override
  String get introVideoFailed =>
      'Impossible de lire la vidéo. Vérifiez votre connexion et réessayez.';

  @override
  String get introVideoOnYoutube => 'Regarder sur YouTube';

  @override
  String get introVideoReplay => 'Revoir';

  @override
  String get supportIntroVideoHelp =>
      'Découvrez ce que Casama peut faire en 1 min 30';

  @override
  String get supportRate => 'Noter Casama';

  @override
  String get supportRateHelp =>
      'Partagez votre avis sur la page de la boutique';

  @override
  String get supportIds => 'ID de support';

  @override
  String get supportIdsHelp =>
      'Le support peut vous les demander. Ils identifient votre compte et vos achats, sans donner aucun accès.';

  @override
  String supportWorkspaceId(String name) {
    return 'ID d\'espace de travail · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Aussi votre ID d\'achat dans l\'App Store et Google Play';

  @override
  String get supportAccountId => 'ID du compte';

  @override
  String get supportCopyAll => 'Tout copier';

  @override
  String get supportCopyAllHelp =>
      'Version de l\'app, plateforme et identifiants, à coller dans un message';

  @override
  String get supportNewChat => 'Nouvelle conversation';

  @override
  String get supportAskHint => 'Posez n\'importe quelle question sur Casama';

  @override
  String get supportAiNote =>
      'Casama Help est une IA et peut faire des erreurs. Elle voit votre forfait et les erreurs des bots, pas vos discussions.';

  @override
  String get supportGreeting =>
      'Bonjour ! Je suis Casama Help. Posez-moi vos questions sur Casama, votre forfait ou un problème rencontré. Si je ne peux pas le résoudre, je le transmettrai à notre équipe support.';

  @override
  String get supportStarterPurchase => 'Mon achat n\'a pas abouti';

  @override
  String get supportStarterCancel => 'Comment résilier mon forfait ?';

  @override
  String get supportStarterBot => 'Mon bot ne répond pas';

  @override
  String get supportStarterHowTo => 'Que peuvent faire mes bots ?';

  @override
  String get supportAskPerson => 'Demander à une personne';

  @override
  String get supportHandoffTitle =>
      'Envoyer ceci à notre équipe d\'assistance ?';

  @override
  String get supportHandoffButton => 'Vérifier et envoyer';

  @override
  String get supportThinking => 'Recherche en cours…';

  @override
  String get supportAssistantError =>
      'L\'aide Casama n\'a pas pu répondre. Réessayez ou demandez à une personne.';

  @override
  String get supportAssistantLimit =>
      'L\'aide Casama ne peut plus répondre pour le moment. Une personne peut vous aider.';

  @override
  String get purchaseHelp => 'Un problème avec un achat ? Obtenir de l\'aide';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Signaler';

  @override
  String get reportAndBlock => 'Signaler et bloquer';

  @override
  String get reportReply => 'Signaler la réponse';

  @override
  String get reportBot => 'Signaler le bot';

  @override
  String get reportBotRow =>
      'Quelque chose ne va pas dans son nom, sa description ou ses réponses';

  @override
  String get reportPerson => 'Signaler la personne';

  @override
  String get reportGalleryItem => 'Signaler l\'élément de la galerie';

  @override
  String get reportGalleryRequest => 'Signaler la demande';

  @override
  String get reportWorkspace => 'Signaler l\'espace de travail';

  @override
  String get reportHelp =>
      'Indiquez aux personnes qui gèrent ce serveur ce qui ne va pas. Elles examinent chaque signalement.';

  @override
  String get reportPersonHelp =>
      'Indiquez aux personnes qui gèrent ce serveur ce qui s\'est passé. Nous bloquerons aussi cette personne pour vous.';

  @override
  String get reportNote => 'Autre chose à signaler (facultatif)';

  @override
  String reportAlsoBlock(String name) {
    return 'Bloquer aussi $name';
  }

  @override
  String get reportSent => 'Merci. Votre signalement a été envoyé pour examen.';

  @override
  String get reportReasonSpam => 'Spam ou arnaque';

  @override
  String get reportReasonSexual => 'Contenu sexuel';

  @override
  String get reportReasonViolence => 'Violence ou menaces';

  @override
  String get reportReasonHarassment => 'Harcèlement ou haine';

  @override
  String get reportReasonIllegal => 'Illégal ou dangereux';

  @override
  String get reportReasonImpersonation => 'Usurpation d\'identité';

  @override
  String get reportReasonOther => 'Autre chose';

  @override
  String get thisPerson => 'cette personne';

  @override
  String blockPerson(String name) {
    return 'Bloquer $name';
  }

  @override
  String blocked(String name) {
    return '$name est bloqué';
  }

  @override
  String get blockHelp =>
      'Les personnes bloquées ne peuvent pas vous inviter dans un espace de travail et vous ne recevrez aucun message de leur part.';

  @override
  String get blockedPeople => 'Personnes bloquées';

  @override
  String get blockedPeopleRow =>
      'Personnes qui ne peuvent ni vous inviter ni vous contacter';

  @override
  String get noBlockedPeople => 'Personne n\'est bloqué';

  @override
  String get unblock => 'Débloquer';

  @override
  String get emailTips => 'Conseils et nouveautés par e-mail';

  @override
  String get emailTipsHelp =>
      'Des conseils pour démarrer et quelques actualités occasionnelles. Les e-mails concernant votre forfait et votre compte sont toujours envoyés.';

  @override
  String get reportsInApp => 'Signalé dans l\'app';

  @override
  String get reportsNone =>
      'Aucun signalement ouvert. Les signalements envoyés depuis l\'app apparaissent ici.';

  @override
  String get reportsPublicLinks => 'Liens publics signalés';

  @override
  String get reportsNoLinks => 'Aucun lien public n\'a été signalé.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count signalements',
      one: '$count signalement',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Retirer';

  @override
  String get reportsRestore => 'Rétablir';

  @override
  String get reportKindReply => 'Réponse du bot';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Personne';

  @override
  String get reportKindGallery => 'Élément de la galerie';

  @override
  String get reportKindWorkspace => 'Espace de travail';

  @override
  String get reportMarkActioned => 'Traité';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Suspendre l\'espace de travail $name';
  }

  @override
  String get reportDismiss => 'Rejeter : rien d\'anormal';

  @override
  String get supportWebTitle => 'Aide Casama sur le site';

  @override
  String get supportWebOn => 'Activé';

  @override
  String get supportWebOff => 'Désactivé';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adresses IP en pause',
      one: '$count adresse IP en pause',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Afficher $count questions sans réponse';
  }

  @override
  String get ticketsOpen => 'Ouverts';

  @override
  String get ticketsClosed => 'Fermés';

  @override
  String get ticketsAll => 'Tous';

  @override
  String get ticketsNone => 'Aucun message ici.';

  @override
  String get ticketClose => 'Fermer';

  @override
  String get ticketReopen => 'Rouvrir';

  @override
  String get serviceStatus => 'État';

  @override
  String get supportStatus => 'État de Casama Cloud';

  @override
  String get supportStatusHelp =>
      'Vérifier si un service est en panne en ce moment';

  @override
  String get galleryChatSuggestionLabel => 'De la galerie';

  @override
  String get galleryChatAdd => 'Ajouter';

  @override
  String galleryChatAdded(String name) {
    return '$name ajouté';
  }

  @override
  String galleryChatReads(String things) {
    return 'Lit : $things';
  }

  @override
  String get galleryChatRunsCode => 'Exécute du code';

  @override
  String get galleryChatComputer => 'Utilise un ordinateur';

  @override
  String galleryChatNeeds(String apps) {
    return 'Nécessite : $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Brouillon de compétence';

  @override
  String get galleryChatShowInstructions => 'Afficher les instructions';

  @override
  String get galleryChatHideInstructions => 'Masquer les instructions';

  @override
  String get galleryChatSaveSkill => 'Enregistrer dans mes compétences';

  @override
  String get galleryChatSaved => 'Enregistré';

  @override
  String get galleryChatSavedSkill => 'Enregistré dans vos compétences';

  @override
  String get galleryChatSubmit => 'Proposer à la galerie';

  @override
  String galleryChatSubmitTitle(String name) {
    return 'Proposer $name à la galerie ?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Un responsable l\'examine d\'abord. Une fois publié, tout le monde peut le trouver et l\'utiliser. Votre nom affiché apparaît comme auteur, jamais votre e-mail.';

  @override
  String get galleryChatSent => 'Envoyé';

  @override
  String get galleryChatSubmitted => 'Envoyé à la galerie pour examen';

  @override
  String get galleryChatSubmissionsOff =>
      'Ce serveur n\'accepte pas les propositions pour la galerie.';

  @override
  String get galleryPicksTitle => 'Sélection pour vous';

  @override
  String get galleryPicksHelp =>
      'Commencez avec un ensemble adapté de compétences, d\'apps et de routines. Vous pourrez tout modifier par la suite.';

  @override
  String get galleryPicksAdd => 'Ajouter cet ensemble';

  @override
  String get galleryPicksSkip => 'Passer pour le moment';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Ajouter $name';
  }

  @override
  String get galleryPicksBestMatch => 'Meilleure correspondance';

  @override
  String get galleryPicksInside => 'Contenu';

  @override
  String galleryPicksBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '$count bot',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count compétences',
      one: '$count compétence',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routines',
      one: '$count routine',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '$count app',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plugins',
      one: '$count plugin',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count styles',
      one: '$count style',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$name ajouté';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$name ajouté. Connectez $apps dans Apps pour terminer.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Un administrateur examinera $name avant son ajout.';
  }

  @override
  String get galleryPolicyTitle => 'Galerie';

  @override
  String get galleryPolicyRow =>
      'Ce que les membres peuvent ajouter depuis la galerie';

  @override
  String get galleryPolicyMode => 'Qui peut ajouter';

  @override
  String get galleryPolicyOpen => 'Ouvert';

  @override
  String get galleryPolicyOpenHelp =>
      'Tout le monde ici peut ajouter ce qui n\'est pas bloqué.';

  @override
  String get galleryPolicyApproval => 'Demander d\'abord';

  @override
  String get galleryPolicyApprovalHelp =>
      'L\'ajout demande d\'abord à un administrateur pour les éléments sélectionnés ci-dessous.';

  @override
  String get galleryPolicyAllowlist => 'Autorisés uniquement';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Les membres peuvent uniquement ajouter ce qui figure sur la liste autorisée.';

  @override
  String get galleryPolicyApprovalFor => 'Demander d\'abord pour';

  @override
  String get galleryPolicyRunsCode => 'Éléments qui exécutent du code';

  @override
  String get galleryPolicyApps => 'Éléments qui connectent des apps';

  @override
  String get galleryPolicyAll => 'Tout';

  @override
  String get galleryPolicyAllowed => 'Autorisés';

  @override
  String get galleryPolicyAllowedHelp =>
      'Ajoutés sans demander. Avec « Autorisés uniquement », ce sont les seuls éléments que les membres peuvent ajouter.';

  @override
  String get galleryPolicyBlocked => 'Bloqués';

  @override
  String get galleryPolicyBlockedHelp => 'Personne ici ne peut les ajouter.';

  @override
  String get galleryPolicyAddItem => 'Ajouter depuis la galerie';

  @override
  String get galleryPolicyNone => 'Rien pour le moment';

  @override
  String get galleryPolicySearch => 'Rechercher dans la galerie';

  @override
  String get galleryPolicyNoResults => 'Aucun résultat dans la galerie.';

  @override
  String get galleryPolicySaved => 'Règles de la galerie enregistrées';

  @override
  String galleryPolicyRemove(String name) {
    return 'Retirer $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Seuls les administrateurs et propriétaires peuvent modifier ceci.';

  @override
  String get galleryPolicyWaiting => 'En attente d\'approbation';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name a demandé';
  }

  @override
  String get galleryPolicyApprove => 'Approuver';

  @override
  String get galleryPolicyDecline => 'Refuser';

  @override
  String galleryPolicyApproved(String name) {
    return '$name approuvé et ajouté';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name refusé';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Approuvé, mais $name n\'a pas pu être ajouté. $error';
  }

  @override
  String get galleryDigestEmails => 'Sélections mensuelles de la galerie';

  @override
  String get galleryDigestHelp =>
      'Jusqu\'à six nouvelles compétences, apps et routines adaptées à votre utilisation, une fois par mois.';

  @override
  String get newsletterTitle => 'E-mail mensuel de Casama';

  @override
  String get newsletterHelp =>
      'Nouveautés et projets à venir, une fois par mois maximum.';

  @override
  String get newsletterSignUp =>
      'Je souhaite recevoir l\'e-mail mensuel de Casama : nouveautés et projets à venir, une fois par mois maximum.';

  @override
  String get newsletterCardTitle => 'Recevoir l\'e-mail mensuel de Casama ?';

  @override
  String get newsletterCardBody =>
      'Nouveautés et projets à venir, une fois par mois maximum. Arrêtez à tout moment.';

  @override
  String get newsletterCardYes => 'Oui, me l\'envoyer';

  @override
  String get newsletterCardNo => 'Non merci';

  @override
  String get newsletterCardDone =>
      'Inscription confirmée. Vous pouvez la désactiver à tout moment dans les Réglages.';

  @override
  String get galleryKindApp => 'App';

  @override
  String get galleryKindApps => 'Apps';

  @override
  String get galleryKindBot => 'Bot de départ';

  @override
  String get galleryKindBots => 'Bots de départ';

  @override
  String get galleryKindRoutine => 'Routine';

  @override
  String get galleryKindRoutines => 'Routines';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugins';

  @override
  String get galleryKindSet => 'Kit de démarrage';

  @override
  String get galleryKindSets => 'Kits de démarrage';

  @override
  String get galleryTabBrowse => 'Parcourir';

  @override
  String get galleryTabInstalled => 'Installés';

  @override
  String get gallerySearchEverything => 'Tout rechercher';

  @override
  String get galleryNewBadge => 'Nouveau';

  @override
  String get galleryRowPicks => 'Sélection';

  @override
  String get galleryRowNew => 'Nouveautés';

  @override
  String get galleryRowTrending => 'Tendances cette semaine';

  @override
  String get galleryRowMostUsed => 'Les plus utilisés';

  @override
  String get galleryRowWorksWith => 'Compatible avec ce que vous avez';

  @override
  String get galleryRowSets => 'Kits de démarrage';

  @override
  String get galleryRowSeasonal => 'De saison';

  @override
  String get galleryFilterFree => 'Gratuit';

  @override
  String get galleryFilterPlan => 'Utilise des crédits';

  @override
  String get galleryFilterSelfHosted => 'Compatible auto-hébergé';

  @override
  String get galleryFilterComputer => 'Nécessite un ordinateur';

  @override
  String get galleryNoFilterMatches => 'Rien ne correspond à ces filtres';

  @override
  String get galleryClearFilters => 'Effacer les filtres';

  @override
  String get galleryRequestThis => 'Demander ceci';

  @override
  String get galleryAskCasama => 'Demander à Casama de le créer';

  @override
  String galleryAskPrompt(String query) {
    return 'Crée-moi quelque chose pour ceci : $query';
  }

  @override
  String get galleryAccessTitle => 'Ce à quoi il peut accéder';

  @override
  String galleryAccessReads(String things) {
    return 'Lit : $things';
  }

  @override
  String get galleryAccessRunsCode => 'Exécute du code';

  @override
  String get galleryAccessComputer => 'Utilise un ordinateur';

  @override
  String get galleryAccessNothing => 'Ne lit ni ne modifie rien chez vous';

  @override
  String get galleryCreditsNone => 'N\'utilise aucun crédit';

  @override
  String get galleryCreditsLow => 'Utilise peu de crédits';

  @override
  String get galleryCreditsMedium => 'Utilise quelques crédits';

  @override
  String get galleryCreditsHigh => 'Utilise beaucoup de crédits';

  @override
  String get galleryTryIt => 'Essayer';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Utilisé par $shown personnes',
      one: 'Utilisé par $shown personne',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent % des exécutions aboutissent';
  }

  @override
  String get galleryAbout => 'À propos';

  @override
  String get galleryMadeByCasama => 'Créé par Casama';

  @override
  String get galleryMadeByCommunity => 'Créé par la communauté';

  @override
  String get galleryMadeReviewed => 'Vérifié';

  @override
  String get galleryReviewedHelp => 'Ses tests ont réussi pour cette version';

  @override
  String galleryMoreFrom(String name) {
    return 'Autres créations de $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Version $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Mis à jour le $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Remix de $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'Nouveautés dans $name';
  }

  @override
  String get galleryBreaking => 'Fonctionne différemment';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments dans la galerie',
      one: '$count élément dans la galerie',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty =>
      'Rien dans la galerie par cet auteur pour le moment.';

  @override
  String get galleryInstalledWorkspace => 'Dans cet espace de travail';

  @override
  String get galleryInstalledDevice => 'Styles sur cet appareil';

  @override
  String get galleryInstalledEmptyTitle => 'Rien ajouté pour le moment';

  @override
  String get galleryInstalledEmpty =>
      'Les compétences, apps, routines et styles que vous ajoutez depuis la galerie apparaissent ici, avec leurs mises à jour.';

  @override
  String get galleryInstalledError =>
      'Impossible de charger les éléments installés.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mises à jour',
      one: '$count mise à jour',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Mettre à jour';

  @override
  String galleryUpdated(String name) {
    return '$name mis à jour';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Version $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return 'Mettre à jour $name ?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'La nouvelle version peut faire plus de choses que la vôtre :';

  @override
  String get galleryUpdateBreakingHelp =>
      'La nouvelle version fonctionne différemment, pensez à la vérifier après la mise à jour.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Lit désormais : $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Peut désormais : $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Exécute désormais du code';

  @override
  String get galleryUpdateNowComputer => 'Utilise désormais un ordinateur';

  @override
  String get galleryRemove => 'Retirer';

  @override
  String galleryRemoveTitle(String name) {
    return 'Retirer $name ?';
  }

  @override
  String get galleryRemoveHelp =>
      'Il est retiré de cet espace de travail. Vous pourrez le rajouter depuis la galerie.';

  @override
  String galleryRemoved(String name) {
    return '$name retiré';
  }

  @override
  String get galleryRetired => 'N\'est plus dans la galerie';

  @override
  String get galleryRetiredReplaced =>
      'N\'est plus dans la galerie ; un remplacement existe';

  @override
  String get gallerySeeReplacement => 'Voir le remplacement';

  @override
  String get galleryForgetLook => 'Retirer de cette liste';

  @override
  String galleryWizardTitle(String name) {
    return 'Ajouter $name';
  }

  @override
  String get galleryWizardAdd => 'Ajouter';

  @override
  String get galleryWizardRequired => 'Remplissez ce champ';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Inclut $count éléments',
      one: 'Inclut $count élément',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Ce dont il a besoin';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count compétences, ajoutées pour vous',
      one: '$count compétence, ajoutée pour vous',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Apps à connecter : $apps';
  }

  @override
  String get galleryWizardBot => 'Ajouter à quel bot';

  @override
  String get galleryWizardPickBot => 'Choisir un bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Là où vont les routines du kit. Sans bot, elles sont laissées de côté.';

  @override
  String get galleryWizardSetNotAdded => 'Non ajouté';

  @override
  String get galleryWizardNeedsTitle => 'Connectez vos apps';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name fonctionnera une fois celles-ci connectées.';
  }

  @override
  String get galleryWizardSkillAdded => 'Ajouté';

  @override
  String get galleryWizardConnected => 'Connecté';

  @override
  String get galleryWizardConnect => 'Connecter';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Connectez $name dans Réglages → Apps.';
  }

  @override
  String get galleryWizardContinue => 'Continuer';

  @override
  String get galleryWizardSkip => 'Plus tard';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name est prêt';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Vous le retrouverez avec le reste de vos éléments.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Pour fonctionner pleinement, il lui faut ces apps connectées : $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'En attente d\'approbation';

  @override
  String get galleryWizardPendingHelp =>
      'Votre espace de travail demande d\'abord à un administrateur. Il sera ajouté une fois approuvé.';

  @override
  String get galleryRequestsTitle => 'Demandes';

  @override
  String get galleryRequestsHelp =>
      'Idées pour la galerie. Votez pour celles que vous voulez ; les créateurs piochent parmi les plus demandées.';

  @override
  String get galleryRequestsLinkHelp =>
      'Demandez quelque chose qui n\'est pas encore là, ou votez';

  @override
  String get galleryRequestsTop => 'Populaires';

  @override
  String get galleryRequestsNew => 'Récentes';

  @override
  String get galleryRequestsEmpty =>
      'Aucune demande pour le moment. Soyez le premier.';

  @override
  String get galleryRequestsError => 'Impossible de charger les demandes.';

  @override
  String get galleryRequestNew => 'Nouvelle demande';

  @override
  String get galleryRequestNewHelp =>
      'Dites ce que vous aimeriez voir créé. Les demandes similaires sont fusionnées.';

  @override
  String get galleryRequestKind => 'Type';

  @override
  String get galleryRequestTitleLabel => 'Que devrait-il faire ?';

  @override
  String get galleryRequestTitleLength => 'Utilisez entre 4 et 80 caractères.';

  @override
  String get galleryRequestDetails => 'Détails (facultatif)';

  @override
  String get galleryRequestSend => 'Envoyer la demande';

  @override
  String get galleryRequestSent => 'Demande envoyée';

  @override
  String galleryRequestSimilar(String title) {
    return '« $title » avait déjà été demandé, votre vote y a donc été ajouté';
  }

  @override
  String get galleryRequestMine => 'Les vôtres';

  @override
  String get galleryRequestVote => 'Voter';

  @override
  String get galleryRequestOpen => 'Ouverte';

  @override
  String get galleryRequestPlanned => 'Prévue';

  @override
  String get galleryRequestDone => 'Terminée';

  @override
  String get galleryRequestDeclined => 'Refusée';

  @override
  String get gallerySubmitStart => 'Proposer à la galerie';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Partagez un style, une compétence, une routine ou un bot que vous avez créé';

  @override
  String get gallerySubmitPick => 'Que voulez-vous partager ?';

  @override
  String get gallerySubmitPickHelp =>
      'Choisissez quelque chose que vous avez créé. Il est examiné avant d\'entrer dans la galerie.';

  @override
  String get galleryLooksMine => 'Vos styles';

  @override
  String get gallerySubmitCurrentScheme => 'Palette de couleurs utilisée';

  @override
  String get gallerySubmitCurrentWallpaper => 'Fond d\'écran utilisé';

  @override
  String get gallerySubmitMyWallpaper => 'Mon fond d\'écran';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Proposer une app',
      'bot': 'Proposer un bot de départ',
      'routine': 'Proposer une routine',
      'plugin': 'Proposer un plugin',
      'set': 'Proposer un kit de démarrage',
      'theme': 'Proposer un thème',
      'scheme': 'Proposer une palette de couleurs',
      'wallpaper': 'Proposer un fond d\'écran',
      'other': 'Proposer une compétence',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Votre nom affiché apparaît comme auteur. Votre e-mail n\'est jamais partagé.';

  @override
  String get gallerySubmitName => 'Nom';

  @override
  String get gallerySubmitNameLength => 'Utilisez entre 1 et 60 caractères.';

  @override
  String get gallerySubmitTags => 'Étiquettes';

  @override
  String get gallerySubmitTagsHelp => 'Jusqu\'à six, séparées par des virgules';

  @override
  String get gallerySubmitLicense => 'Licence';

  @override
  String gallerySubmitRemix(String name) {
    return 'Crédite l\'original : $name';
  }

  @override
  String get gallerySubmitRemixUnnamed =>
      'Crédite l\'élément original de la galerie';

  @override
  String get gallerySubmitSend => 'Proposer';

  @override
  String get gallerySubmitted => 'Envoyé pour examen';

  @override
  String get gallerySubmissionsTitle => 'Mes propositions';

  @override
  String get gallerySubmissionsHelp =>
      'Ce que vous avez envoyé à la galerie et où cela en est.';

  @override
  String get gallerySubmissionsSent => 'Envoyé';

  @override
  String get gallerySubmissionsEmpty => 'Rien envoyé pour le moment.';

  @override
  String get gallerySubmissionsError =>
      'Impossible de charger vos propositions.';

  @override
  String get gallerySubmissionOpen => 'En cours d\'examen';

  @override
  String get gallerySubmissionMerged => 'Dans la galerie';

  @override
  String get gallerySubmissionClosed => 'Non accepté';

  @override
  String get gallerySubmissionFailed => 'Envoi impossible';

  @override
  String get galleryMyItems => 'Vos éléments dans la galerie';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count signalements ouverts',
      one: '$count signalement ouvert',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Un bot';

  @override
  String get islandNeedsOk => 'Attend votre accord';

  @override
  String get islandTakeOver => 'Vous demande de prendre le contrôle';

  @override
  String get islandWriting => 'Rédige une réponse';

  @override
  String get islandWorking => 'Au travail';

  @override
  String get islandFinished => 'Terminé';

  @override
  String get islandStoppedProblem => 'Arrêté avec un problème';

  @override
  String get islandOnThisMac => 'Sur ce Mac';

  @override
  String get islandStale => 'Ouvrez Casama pour la suite';

  @override
  String get islandOpen => 'Ouvrir';

  @override
  String get islandStop => 'Arrêter';

  @override
  String get islandAllow => 'Autoriser';

  @override
  String get islandDeny => 'Refuser';

  @override
  String get islandReview => 'Vérifier';

  @override
  String get islandNothing => 'Aucun bot ne travaille en ce moment';

  @override
  String get islandQuickAsk => 'Demande rapide…';

  @override
  String get islandOpenCasama => 'Ouvrir Casama';

  @override
  String get islandSettings => 'Réglages…';

  @override
  String get islandQuit => 'Quitter Casama';

  @override
  String get islandAskHint => 'Demander à un bot…';

  @override
  String get islandNeedsYou => 'Vous attend';

  @override
  String get islandDropHere => 'Déposer pour demander à un bot';

  @override
  String get siriSignedOut => 'Connectez-vous d\'abord à Casama.';

  @override
  String get siriOpenToFinish => 'Ouvrez Casama pour terminer.';

  @override
  String get siriTooMany =>
      'Cela fait beaucoup de demandes en une minute. Ouvrez Casama pour continuer.';

  @override
  String get siriNoCredits =>
      'Vous n\'avez plus de crédits. Ouvrez Casama pour en ajouter.';

  @override
  String get siriOffline =>
      'Casama n\'arrive pas à accéder à Internet pour le moment.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot a d\'abord besoin de votre accord. Ouvrez Casama pour vérifier.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot a rencontré un problème. Ouvrez Casama pour voir ce qui s\'est passé.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot a répondu. Ouvrez Casama pour lire sa réponse.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot y travaille encore. Vous recevrez une notification une fois terminé.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot a répondu.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return 'Routine lancée : $routine.';
  }

  @override
  String get siriNothingNeedsYou => 'Rien ne vous attend pour le moment.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count choses vous attendent.',
      one: '$count chose vous attend.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'En attente de votre réponse : $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Les ordinateurs ne sont pas disponibles pour ce compte.';

  @override
  String get siriNoComputers =>
      'Vous n\'avez aucun ordinateur dans cet espace de travail.';

  @override
  String siriStartingComputer(String computer) {
    return 'Démarrage de $computer.';
  }

  @override
  String get siriComputerFailed =>
      'Impossible de démarrer l\'ordinateur pour le moment.';

  @override
  String get siriWhichBotToStop => 'Quel bot dois-je arrêter ?';

  @override
  String get siriBotNotRunning =>
      'Ce bot n\'est pas en cours d\'exécution pour le moment.';

  @override
  String get siriStopped => 'Arrêté.';

  @override
  String get siriStopFailed => 'Impossible d\'arrêter le bot pour le moment.';

  @override
  String get focusFilterShowingAll => 'Filtre de concentration · Tout afficher';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Filtre de concentration · $count affichés',
      one: 'Filtre de concentration · $count affiché',
    );
    return '$_temp0';
  }

  @override
  String get under13Title =>
      'Casama est réservé aux personnes de 13 ans et plus';

  @override
  String get under13Body =>
      'Ce compte ne peut pas utiliser Casama d\'après la tranche d\'âge déclarée. Vous pouvez vous déconnecter ou exporter vos données depuis un autre compte.';

  @override
  String get siriSpotlightSetting => 'Afficher dans Spotlight et Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Les noms des bots, des routines et les titres des discussions apparaissent dans Spotlight et Siri sur cet appareil. Jamais le contenu des discussions. Désactivé si le verrouillage de l\'app est activé.';

  @override
  String get geminiSetting => 'Laisser Gemini utiliser Casama';

  @override
  String get geminiSettingHelp =>
      'Quand vous demandez à Gemini d\'utiliser Casama, il peut interroger vos bots, voir ce qui attend votre réponse et exécuter vos routines sur ce téléphone. Il n\'approuve jamais rien : les demandes s\'ouvrent ici. Les réponses restent masquées dans un espace de travail privé, avec Masquer le texte des réponses ou le verrouillage de l\'app activé.';

  @override
  String get geminiOff =>
      'Gemini est désactivé pour Casama sur ce téléphone. Activez-le dans Casama : Réglages, Confidentialité.';

  @override
  String get islandBotWorking => 'Un bot travaille';

  @override
  String get islandOnThisComputer => 'sur cet ordinateur';

  @override
  String get islandOnACall => 'En appel';

  @override
  String get islandStartElsewhere => 'Bots lancés ailleurs';

  @override
  String get islandStartElsewhereHelp =>
      'Afficher aussi sur l\'écran verrouillé de ce téléphone ce que vous lancez sur un autre appareil, comme votre Mac.';

  @override
  String get islandBotsAtWork => 'Bots au travail';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étapes',
      one: '$count étape',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Afficher les bots dans l\'encoche';

  @override
  String get showBotsInNotchHelp =>
      'Ce que font vos bots, autour de la caméra. L\'icône de la barre de menus l\'affiche dans tous les cas.';

  @override
  String get notchOnHover => 'Ouvrir l\'encoche au survol';

  @override
  String get notchOnHoverHelp =>
      'Désactivé : cliquez sur l\'encoche pour l\'ouvrir.';

  @override
  String get sitePublishToWeb => 'Publier sur le web';

  @override
  String get sitePublishToWebHelp => 'Donnez-lui sa propre adresse web.';

  @override
  String get siteAddressName => 'Nom d\'adresse';

  @override
  String get siteAddressRules =>
      '3 à 40 lettres minuscules, chiffres et tirets, commençant et finissant par une lettre ou un chiffre.';

  @override
  String get siteAddressChecking => 'Vérification…';

  @override
  String get siteAddressAvailable => 'Disponible';

  @override
  String get siteAddressTaken => 'Ce nom n\'est pas disponible.';

  @override
  String get siteAnyoneCanOpen =>
      'Toute personne ayant l\'adresse pourra l\'ouvrir.';

  @override
  String get sitePublish => 'Publier';

  @override
  String get siteOnTheWeb => 'En ligne sur le web';

  @override
  String get siteSearchEngines => 'Laisser les moteurs de recherche l\'indexer';

  @override
  String get siteSearchEnginesHelp =>
      'L\'ajoute dans Google et d\'autres moteurs de recherche.';

  @override
  String get siteSearchEnginesPaid => 'Nécessite un forfait payant.';

  @override
  String get siteUseOwnDomain => 'Utiliser votre propre nom de domaine';

  @override
  String get siteUnpublish => 'Dépublier';

  @override
  String get siteUnpublishTitle => 'Dépublier ce site ?';

  @override
  String get siteUnpublishBody =>
      'Il ne s\'ouvrira plus à ses adresses web. Il reste dans votre bibliothèque.';

  @override
  String get siteHostLive => 'En ligne';

  @override
  String get siteHostWaitingForDns => 'En attente du DNS';

  @override
  String get siteHostGettingCertificate => 'Obtention du certificat';

  @override
  String get siteHostNeedsAttention => 'Attention requise';

  @override
  String get siteHostPaused => 'En pause';

  @override
  String get siteHostSuspended => 'Suspendu';

  @override
  String get settingsDomains => 'Noms de domaine';

  @override
  String get settingsDomainsHelp =>
      'Ouvrez vos sites sur un nom de domaine que vous possédez.';

  @override
  String get settingsSearchHint => 'Rechercher dans les réglages';

  @override
  String settingsSearchNone(String query) {
    return 'Aucun réglage ne correspond à « $query ».';
  }

  @override
  String get domainsEmpty =>
      'Connectez un nom de domaine que vous possédez, comme boulangerie.fr, et votre site s\'y ouvrira.';

  @override
  String get domainsConnectOwn => 'Connecter un nom de domaine à vous';

  @override
  String get domainStateLive => 'En ligne';

  @override
  String get domainStateWaitingDns => 'En attente du DNS';

  @override
  String get domainStateWaitingCert => 'Obtention du certificat';

  @override
  String get domainStatePaused => 'En pause';

  @override
  String get domainStateNeedsAttention => 'Attention requise';

  @override
  String get domainNoSite => 'Aucun site pour l\'instant';

  @override
  String get domainConnectField => 'Votre nom de domaine';

  @override
  String get domainConnectHelp =>
      'Saisissez-le comme boulangerie.fr, www.boulangerie.fr ou boutique.boulangerie.fr.';

  @override
  String get domainConnectSite => 'Site à afficher';

  @override
  String get domainSiteNone => 'Aucun';

  @override
  String get domainSiteNoneHelp =>
      'Le nom de domaine n\'affiche rien tant que vous ne choisissez pas un site.';

  @override
  String get domainConnect => 'Connecter';

  @override
  String get domainClaimTitle => 'Prouver qu\'il vous appartient';

  @override
  String get domainClaimBody =>
      'Un autre espace de travail a connecté ce nom de domaine. Ajoutez cet enregistrement pour prouver qu\'il vous appartient, puis touchez Connecter à nouveau.';

  @override
  String get domainRecordType => 'Type';

  @override
  String get domainRecordName => 'Nom';

  @override
  String get domainRecordValue => 'Valeur';

  @override
  String get domainSite => 'Site';

  @override
  String get domainPickSite => 'Choisir un site';

  @override
  String get domainHosts => 'Adresses';

  @override
  String get domainPrimary => 'Principale';

  @override
  String get domainPrimaryHelp =>
      'Les visiteurs arrivent ici ; les autres adresses redirigent vers elle.';

  @override
  String get domainMakePrimary => 'Définir comme principal';

  @override
  String get domainRecordsTitle => 'Enregistrements à ajouter';

  @override
  String get domainRecordsAtCloudflare =>
      'Ajoutez-les dans Cloudflare. Réglez les enregistrements sur DNS uniquement.';

  @override
  String domainRecordsAt(String provider) {
    return 'Ajoutez-les dans vos réglages DNS chez $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Ajoutez-les là où le DNS de votre nom de domaine est géré, généralement chez l\'entreprise où vous l\'avez acheté.';

  @override
  String get domainRecordsNone => 'Rien à ajouter. Tout est prêt.';

  @override
  String get domainRecordOptional => 'Facultatif';

  @override
  String domainRecordForward(String from, String to) {
    return 'Activez la redirection de $from vers $to chez l\'entreprise où vous avez acheté le nom de domaine.';
  }

  @override
  String get domainRecordFound => 'Trouvé';

  @override
  String get domainRecordNotFound => 'Pas encore trouvé';

  @override
  String get domainCheckAgain => 'Revérifier';

  @override
  String get domainCheckTooSoon =>
      'Nous venons de vérifier. Réessayez dans quelques secondes.';

  @override
  String get domainChecksItself =>
      'Nous vérifions aussi automatiquement, vous pouvez donc quitter cet écran.';

  @override
  String get domainHistory => 'Historique';

  @override
  String get domainEventConnected => 'Connecté';

  @override
  String get domainEventProved => 'Enregistrements trouvés';

  @override
  String get domainEventLive => 'En ligne';

  @override
  String get domainEventNeedsDns => 'Toujours en attente du DNS';

  @override
  String get domainEventFailed => 'Configuration impossible';

  @override
  String get domainEventDisconnected =>
      'Enregistrements retirés, donc déconnecté';

  @override
  String get domainEventPaused => 'En pause : votre forfait ne l\'inclut pas';

  @override
  String get domainEventResumed => 'Réactivé';

  @override
  String get domainEventRemoved => 'Déconnecté';

  @override
  String get domainEventClaim => 'Preuve de propriété demandée';

  @override
  String get domainEventClaimAttempt =>
      'Un autre espace de travail a tenté de le connecter';

  @override
  String get domainEventOverLimit => 'Au-delà de la limite de votre forfait';

  @override
  String get domainEventSuspended => 'Suspendu';

  @override
  String get domainEventOther => 'Mis à jour';

  @override
  String domainDisconnectTitle(String name) {
    return 'Déconnecter $name ?';
  }

  @override
  String get domainDisconnectBody =>
      'Votre site cesse de s\'ouvrir sur ce nom de domaine. Vous pourrez ensuite supprimer ses enregistrements chez votre fournisseur DNS.';

  @override
  String get domainsFind => 'Trouver un nom de domaine';

  @override
  String get domainsEmptyBuy =>
      'Achetez un nom de domaine pour votre site, ou connectez-en un que vous possédez.';

  @override
  String get domainFindField => 'Nom ou quelques mots';

  @override
  String get domainFindHint => 'boulangerie';

  @override
  String get domainFindHelp => 'Les prix sont par an et hors taxes.';

  @override
  String get domainFindNone => 'Aucun nom trouvé. Essayez d\'autres mots.';

  @override
  String get domainFindNotOffered =>
      'L\'achat de noms de domaine n\'est pas disponible dans cette app. Vous pouvez toujours connecter un nom de domaine que vous possédez.';

  @override
  String domainPricePerYear(String price) {
    return '$price par an hors taxes';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Renouvellement à $price';
  }

  @override
  String get domainReasonTaken => 'Pris';

  @override
  String get domainReasonPremium => 'Nom premium, non vendu ici';

  @override
  String get domainReasonNotSold => 'Non vendu ici';

  @override
  String get domainBuy => 'Acheter';

  @override
  String domainBuyTitle(String name) {
    return 'Acheter $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price la première année, puis $renew par an, hors taxes.';
  }

  @override
  String get domainBuyFinal =>
      'Les ventes sont définitives une fois le nom de domaine enregistré. S\'il ne peut pas être enregistré, vous recevez un remboursement intégral.';

  @override
  String get domainBuyTerms => 'J\'accepte les conditions des noms de domaine';

  @override
  String get domainBuyReadTerms => 'Lire les conditions';

  @override
  String get domainRenewAuto => 'Renouveler automatiquement';

  @override
  String get domainRenewAutoHelp =>
      'Débite votre moyen de paiement enregistré environ deux semaines avant l\'expiration.';

  @override
  String get domainBuySite => 'Site à afficher';

  @override
  String get domainBuyPayInBrowser =>
      'Terminez le paiement dans votre navigateur. Cet écran suit l\'avancement.';

  @override
  String get domainContactTitle => 'Coordonnées du titulaire';

  @override
  String get domainContactHelp =>
      'La personne ou l\'entreprise au nom de laquelle le nom de domaine est enregistré. Les bureaux d\'enregistrement gardent ces infos privées.';

  @override
  String get domainContactFirstName => 'Prénom';

  @override
  String get domainContactLastName => 'Nom';

  @override
  String get domainContactOrganization => 'Entreprise (facultatif)';

  @override
  String get domainContactAddress1 => 'Adresse';

  @override
  String get domainContactAddress2 => 'Complément d\'adresse (facultatif)';

  @override
  String get domainContactCity => 'Ville';

  @override
  String get domainContactState => 'Région ou État';

  @override
  String get domainContactZip => 'Code postal';

  @override
  String get domainContactCountry => 'Code pays';

  @override
  String get domainContactCountryHint => 'FR';

  @override
  String get domainContactPhone => 'Téléphone';

  @override
  String get domainContactPhoneHint => '+33 6 12 34 56 78';

  @override
  String get domainContactEmail => 'E-mail';

  @override
  String get domainContactRequired => 'Obligatoire';

  @override
  String get domainContactCountryInvalid =>
      'Utilisez un code à deux lettres, comme FR';

  @override
  String get domainContactPhoneInvalid =>
      'Utilisez le format international, comme +33 6 12 34 56 78';

  @override
  String get domainContactEmailInvalid => 'Saisissez une adresse e-mail valide';

  @override
  String get domainContactSave => 'Enregistrer';

  @override
  String get domainContactSaved => 'Coordonnées enregistrées.';

  @override
  String get domainContactChangeNote =>
      'Les modifications s\'appliquent à chaque nom de domaine acheté par cet espace de travail. Une nouvelle adresse e-mail doit être confirmée à nouveau.';

  @override
  String get domainOrderTitle => 'Votre commande';

  @override
  String get domainOrderWaitingPayment =>
      'En attente de votre paiement dans le navigateur.';

  @override
  String domainOrderRegistering(String name) {
    return 'Enregistrement de $name…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return 'Configuration de $name…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'Impossible d\'enregistrer $name. Remboursement en cours…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'Impossible d\'enregistrer $name, nous vous avons donc intégralement remboursé.';
  }

  @override
  String get domainOrderAbandoned =>
      'Ce paiement n\'a pas été finalisé, rien n\'a donc été débité.';

  @override
  String get domainOrderNeedsAttention =>
      'Un problème est survenu avec cette commande. Nous en avons été informés et allons le résoudre.';

  @override
  String domainOrderDone(String name) {
    return '$name est à vous.';
  }

  @override
  String get domainOrderLeave =>
      'Vous pouvez quitter cet écran. Nous vous préviendrons dès qu\'il sera prêt.';

  @override
  String get domainOrderBack => 'Retour aux noms de domaine';

  @override
  String domainRenewsOn(String date) {
    return 'Renouvellement le $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Expire le $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price par an hors taxes';
  }

  @override
  String get domainRenewNow => 'Renouveler maintenant';

  @override
  String get domainRenewPayInBrowser =>
      'Terminez le paiement dans votre navigateur. La nouvelle date s\'affichera ici une fois payée.';

  @override
  String get domainRenewCharged =>
      'Renouvelé. La nouvelle date s\'affichera ici dans une minute.';

  @override
  String get domainRegistration => 'Enregistrement';

  @override
  String domainExpired(String date) {
    return 'Expiré le $date. Renouvelez-le dans les 25 jours suivant cette date pour le conserver.';
  }

  @override
  String get domainLapsed =>
      'Ce nom de domaine a expiré. Écrivez au support pour demander s\'il peut être restauré, sans garantie.';

  @override
  String get domainSuspendedLine =>
      'Ce nom de domaine est suspendu. Écrivez au support pour savoir pourquoi.';

  @override
  String get domainVerifyTitle => 'Confirmez l\'e-mail du titulaire';

  @override
  String get domainVerifyBody =>
      'Le bureau d\'enregistrement a envoyé un e-mail à l\'adresse du titulaire. Ouvrez-le et confirmez, sinon le nom de domaine cessera de fonctionner.';

  @override
  String get domainVerifySendAgain => 'Renvoyer';

  @override
  String get domainVerifySent =>
      'Envoyé. Vérifiez la boîte de réception du titulaire.';

  @override
  String get domainDnsRecords => 'Enregistrements DNS';

  @override
  String get domainDnsRecordsHelp =>
      'E-mail, sous-domaines et vérifications du site';

  @override
  String get domainMoveOut =>
      'Transférer vers un autre bureau d\'enregistrement';

  @override
  String domainMoveOutAfter(String date) {
    return 'Transférable après le $date';
  }

  @override
  String get domainMoveOutHelp =>
      'Obtenir un code de transfert pour un autre bureau d\'enregistrement';

  @override
  String domainMoveOutTitle(String name) {
    return 'Transférer $name ?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Ceci déverrouille le nom de domaine et affiche son code de transfert une seule fois. Saisissez $name pour confirmer.';
  }

  @override
  String get domainMoveOutConfirm => 'Obtenir le code de transfert';

  @override
  String domainMoveOutLocked(String date) {
    return 'Transférable après le $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Code de transfert';

  @override
  String get domainTransferCodeBody =>
      'Donnez ce code au nouveau bureau d\'enregistrement. Il n\'est affiché qu\'une fois, copiez-le maintenant.';

  @override
  String get domainTransferCode => 'Code';

  @override
  String get domainUnlocked => 'Déverrouillé pour transfert';

  @override
  String get domainLockAgain => 'Verrouiller à nouveau';

  @override
  String get domainLocked => 'Verrouillé à nouveau.';

  @override
  String get domainReauthTitle => 'Se reconnecter';

  @override
  String get domainReauthSendCode => 'M\'envoyer un code par e-mail';

  @override
  String domainReauthCodeSent(String email) {
    return 'Nous avons envoyé un code à $email.';
  }

  @override
  String get domainReauthCode => 'Code reçu par e-mail';

  @override
  String get domainReauthSignIn => 'Se connecter';

  @override
  String get domainReauthSignOut =>
      'Déconnectez-vous puis reconnectez-vous, et réessayez.';

  @override
  String get dnsRecordsEmpty => 'Aucun enregistrement pour l\'instant.';

  @override
  String get dnsRecordAdd => 'Ajouter un enregistrement';

  @override
  String get dnsRecordEdit => 'Modifier l\'enregistrement';

  @override
  String get dnsRecordManaged => 'Utilisé par votre site Casama';

  @override
  String get dnsRecordType => 'Type';

  @override
  String get dnsRecordHost => 'Nom';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Laissez vide pour $name lui-même, ou saisissez www, boutique…';
  }

  @override
  String get dnsRecordAnswer => 'Valeur';

  @override
  String get dnsRecordTtl => 'TTL (secondes)';

  @override
  String get dnsRecordPriority => 'Priorité';

  @override
  String get dnsRecordSave => 'Enregistrer';

  @override
  String get dnsRecordDeleteTitle => 'Supprimer cet enregistrement ?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 secondes ou plus';

  @override
  String get dnsRecordAnswerRequired => 'Obligatoire';

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
      'Noms de domaine achetés dans vos espaces de travail';

  @override
  String get deleteAccountDomainsBody =>
      'Ces noms de domaine restent enregistrés jusqu\'à leur expiration. Ils ne seront pas renouvelés et leurs sites seront mis hors ligne.';

  @override
  String get whatsNew010Sites =>
      'Mettez une page en ligne à sa propre adresse et utilisez votre propre nom de domaine.';

  @override
  String get inAppAlertOpen => 'Ouvrir';

  @override
  String get pushPrefsTitle => 'Notifications';

  @override
  String get pushPrefsHelp =>
      'Choisissez ce qui fait vibrer vos appareils. Tout arrive quand même dans votre boîte de réception.';

  @override
  String get pushAllOn => 'Tout activé';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Réponses désactivées',
      'needsYou': '« Besoin de vous » désactivé',
      'routines': 'Routines et résumés désactivés',
      'suggestions': 'Suggestions et points réguliers désactivés',
      'other': 'Compte désactivé',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count catégories désactivées';
  }

  @override
  String get pushReplies => 'Réponses';

  @override
  String get pushRepliesHelp =>
      'Quand un bot répond à votre demande après que vous avez quitté la discussion.';

  @override
  String get pushNeedsYou => 'Besoin de vous';

  @override
  String get pushNeedsYouHelp =>
      'Approbations, mots de passe et prises de contrôle attendus par vos bots.';

  @override
  String get pushNeedsYouOffWarning =>
      'Désactivé : vos bots attendront que vous ouvriez l\'app.';

  @override
  String get pushRoutines => 'Routines et résumés';

  @override
  String get pushRoutinesHelp =>
      'Résultats des routines et votre résumé du matin.';

  @override
  String get pushSuggestions => 'Suggestions et points réguliers';

  @override
  String get pushSuggestionsHelp =>
      'Ce que vos bots proposent de faire pour vous.';

  @override
  String get pushAccount => 'Compte';

  @override
  String get pushAccountHelp =>
      'Crédits presque épuisés, projets et votre serveur.';

  @override
  String get pushHideReplyText => 'Masquer le texte des réponses';

  @override
  String get pushHideReplyTextHelp =>
      'Les notifications indiquent qu\'un bot a répondu, sans ses mots.';

  @override
  String get reactToMessage => 'Réagir';

  @override
  String get moreReactions => 'Plus de réactions';

  @override
  String get reactionsTitle => 'Réactions';

  @override
  String get reactionsAll => 'Toutes';

  @override
  String get reactionsYou => 'Vous';

  @override
  String get reactionsTapToRemove => 'Touchez pour retirer';

  @override
  String get reactionsNone => 'Aucune réaction pour l\'instant.';

  @override
  String get reactionsLoadFailed => 'Impossible de charger les réactions.';

  @override
  String get searchEmoji => 'Rechercher un émoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count réactions',
      one: '$count réaction',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count réactions',
      one: '$count réaction',
    );
    return '$emoji, $_temp0, dont la vôtre';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Réagir avec $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Retirer votre réaction $emoji';
  }

  @override
  String get packsShelfTitle => 'Packs';

  @override
  String get packsShelfHelp =>
      'Bots, compétences et routines qui fonctionnent ensemble, ajoutés d\'un coup.';

  @override
  String get packReviewed => 'Vérifié';

  @override
  String get packNotReviewed => 'Non vérifié par Casama';

  @override
  String packCountBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '$count bot',
    );
    return '$_temp0';
  }

  @override
  String packCountSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count compétences',
      one: '$count compétence',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count routines',
      one: '$count routine',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '$count app',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count styles',
      one: '$count style',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outils',
      one: '$count outil',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '$count élément',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Kit de démarrage';

  @override
  String get packAddFromLink => 'Ajouter un pack depuis un lien';

  @override
  String get packAddFromLinkHelp =>
      'Collez un lien GitHub vers un pack et voyez d\'abord ce qu\'il ajoute.';

  @override
  String get packAddFromFile => 'Ajouter depuis un fichier';

  @override
  String get packAddFromFileHelp => 'Choisissez le fichier .zip d\'un pack.';

  @override
  String get packLinkLabel => 'Lien GitHub';

  @override
  String get packFileUnreadable => 'Ce fichier n\'est pas le .zip d\'un pack.';

  @override
  String get packFileTooBig => 'Ce fichier est trop volumineux pour un pack.';

  @override
  String packSource(String where, String commit) {
    return '$where à $commit';
  }

  @override
  String get packFromFile => 'Depuis un fichier';

  @override
  String get packFromShare => 'Partagé avec vous';

  @override
  String get packAlreadyHere => 'Cet espace de travail a déjà ce pack.';

  @override
  String get packOpenInstalled => 'Voir les packs installés';

  @override
  String get packAdd => 'Ajouter le pack';

  @override
  String packWizardTitle(String name) {
    return 'Ajouter $name';
  }

  @override
  String get packWhatsInside => 'Contenu';

  @override
  String get packWhatsInsideHelp => 'Décochez ce que vous ne voulez pas.';

  @override
  String get packSectionBots => 'Bots';

  @override
  String get packSectionSkills => 'Compétences';

  @override
  String get packSectionRoutines => 'Routines';

  @override
  String get packSectionApps => 'Apps';

  @override
  String get packSectionLooks => 'Styles';

  @override
  String get packSectionIncludes => 'Depuis la galerie';

  @override
  String get packSectionTools => 'Outils';

  @override
  String get packSkillRunsScripts =>
      'Exécute des scripts sur l\'ordinateur du bot';

  @override
  String get packSkillForWorkspace => 'Pour tout l\'espace de travail';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'S\'exécute environ $count fois par semaine',
      one: 'S\'exécute environ $count fois par semaine',
      zero: 'S\'exécute de temps en temps',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Communique avec $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Se connecte à $url';
  }

  @override
  String get packIncludeMissing => 'Introuvable dans la galerie';

  @override
  String get packLookHelp =>
      'Vous pourrez l\'utiliser sur cet appareil après l\'ajout.';

  @override
  String get packNothingTicked => 'Cochez au moins un élément à ajouter.';

  @override
  String get packQuestions => 'Quelques questions';

  @override
  String get packQuestionsHelp =>
      'Le pack les renseigne dans ses bots et routines.';

  @override
  String get packSecretsTitle => 'Clés et réglages';

  @override
  String get packSecretsHelp =>
      'Les outils du pack en ont besoin pour fonctionner.';

  @override
  String get packReachTitle => 'Ce à quoi il accède';

  @override
  String get packReachHelp =>
      'Déduit par Casama à partir des fichiers du pack.';

  @override
  String get packReachRunsCode => 'Exécute du code';

  @override
  String get packReachComputer => 'Utilise l\'ordinateur du bot';

  @override
  String packReachHosts(String hosts) {
    return 'Communique avec $hosts';
  }

  @override
  String get packReachNoHosts => 'Ne communique avec aucun autre site';

  @override
  String packReachSecrets(String names) {
    return 'Utilise les clés : $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Environ $count exécutions planifiées par semaine',
      one: 'Environ $count exécution planifiée par semaine',
      zero: 'Aucune exécution planifiée',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama n\'a pas vérifié ce pack. Ajoutez-le uniquement si vous avez confiance en sa source. Ses routines démarrent désactivées.';

  @override
  String get packPickBotTitle => 'Quel bot le reçoit ?';

  @override
  String get packPickBotHelp =>
      'Ce pack n\'apporte aucun bot. Choisissez-en un pour ses routines et outils.';

  @override
  String packDoneTitle(String name) {
    return '$name est ajouté';
  }

  @override
  String get packDoneHelp => 'Voici ce qu\'il a ajouté.';

  @override
  String get packPendingHelp =>
      'Nous avons demandé à un administrateur. Le pack sera ajouté dès son approbation.';

  @override
  String get packStatusInstalled => 'Ajouté';

  @override
  String get packStatusPending => 'En attente d\'un administrateur';

  @override
  String get packStatusSkipped => 'Ignoré';

  @override
  String get packStatusFailed => 'N\'a pas fonctionné';

  @override
  String get packStatusDevice => 'Sur cet appareil';

  @override
  String get packConnectTitle => 'Connecter ses apps';

  @override
  String get packConnectHelp =>
      'Ses bots fonctionnent pleinement une fois celles-ci connectées.';

  @override
  String get packLooksTitle => 'Utiliser un style sur cet appareil ?';

  @override
  String get packUseLook => 'Utiliser';

  @override
  String get packLookInUse => 'Utilisé';

  @override
  String get packInstalledTitle => 'Ce pack est déjà ici';

  @override
  String get packsInstalledTitle => 'Packs installés';

  @override
  String get packsInstalledRow =>
      'Packs ajoutés par cet espace de travail, avec mises à jour';

  @override
  String get packsInstalledEmpty =>
      'Aucun pack pour le moment. Trouvez-en un dans le rayon Packs ou ajoutez-en un depuis un lien.';

  @override
  String get packEditedBadge => 'Modifié par vous';

  @override
  String get packRemove => 'Retirer';

  @override
  String get packUpToDate => 'Ce pack est à jour.';

  @override
  String get packCantCheck =>
      'Ce pack provient d\'un fichier ou d\'un lien et ne peut pas rechercher de mises à jour.';

  @override
  String packUpdateTitle(String name) {
    return 'Mettre à jour $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'Nouveau : $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Retiré : $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Modifié : $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Nouveaux sites contactés : $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Nouvelles clés requises : $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Nouvelles planifications : $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Exécutions planifiées par semaine : $from → $to';
  }

  @override
  String get packDiffNone => 'Rien de visible n\'a changé.';

  @override
  String get packEditedTitle => 'Ce que vous avez modifié';

  @override
  String get packEditedHelp =>
      'Votre version reste en place sauf si vous changez.';

  @override
  String get packTakeTheirs => 'Utiliser la version du pack';

  @override
  String get packReachGrewTitle => 'Sa portée s\'étend';

  @override
  String get packReachGrewHelp =>
      'La nouvelle version peut accéder à plus d\'éléments que la vôtre.';

  @override
  String get packReachConfirm =>
      'J\'ai vérifié ce à quoi il peut accéder maintenant';

  @override
  String packUpdated(String name) {
    return '$name est à jour.';
  }

  @override
  String packRemoveTitle(String name) {
    return 'Retirer $name ?';
  }

  @override
  String get packRemoveBody =>
      'Ses outils et clés disparaissent, ainsi que les compétences et routines que vous n\'avez pas modifiées. Les connexions aux apps restent.';

  @override
  String get packRemoveBots => 'Supprimer aussi les bots créés par ce pack';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Pack retiré. $count éléments sont restés car vous les avez modifiés.',
      one: 'Pack retiré. $count élément est resté car vous l\'avez modifié.',
      zero: 'Pack retiré.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Partager en pack';

  @override
  String get sharePackRow =>
      'Regrouper des bots et des compétences pour quelqu\'un d\'autre';

  @override
  String get sharePackHelp =>
      'Les clés, discussions, souvenirs, À propos de vous et le choix du modèle ne sont jamais inclus.';

  @override
  String get sharePackBots => 'Bots';

  @override
  String get sharePackBotsHelp =>
      'Choisissez-en jusqu\'à 5. Chacun apporte ses instructions, compétences et routines.';

  @override
  String get sharePackSkills => 'Compétences de l\'espace de travail';

  @override
  String get sharePackName => 'Nom';

  @override
  String get sharePackSummary => 'Une ligne de description';

  @override
  String get sharePackLook => 'Inclure le thème de cet appareil';

  @override
  String get sharePackCheck => 'Vérifier et partager';

  @override
  String get sharePackFindingsTitle =>
      'Certaines lignes ressemblent à des clés';

  @override
  String get sharePackFindingsHelp =>
      'Vérifiez-les avant de partager. Revenez en arrière pour les corriger, ou partagez si elles sont sûres.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, ligne $line : $what';
  }

  @override
  String get sharePackGoBack => 'Retour';

  @override
  String get sharePackAnyway => 'Partager quand même';

  @override
  String get sharePackLinkTitle => 'Votre lien de pack';

  @override
  String sharePackLinkHelp(String date) {
    return 'Toute personne connectée à Casama peut l\'ouvrir jusqu\'au $date.';
  }

  @override
  String get sharePackShare => 'Partager';

  @override
  String get sharePackSaveFile => 'Enregistrer comme fichier';

  @override
  String get sharePackLinkCopied => 'Lien copié.';

  @override
  String get sharePackStop => 'Arrêter le partage';

  @override
  String get sharePackStopped => 'Le lien ne fonctionne plus.';

  @override
  String pluginFromPack(String pack) {
    return 'Du pack $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Mettez-le à jour ou retirez-le avec son pack, dans Galerie → Packs installés.';

  @override
  String get pluginSettings => 'Réglages';

  @override
  String get pluginEditSettings => 'Modifier les réglages';

  @override
  String get pluginSettingsSaved => 'Réglages enregistrés.';

  @override
  String get galleryPolicyKeyHelp =>
      'Vous pouvez aussi saisir un dépôt (repo/owner:name) ou un pack (pack/name).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Ajouter $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Pack : $name';
  }

  @override
  String get reportPackShare => 'Signaler ce pack';

  @override
  String get appLock => 'Verrouillage de l\'app';

  @override
  String get appLockRow => 'Demander de déverrouiller Casama à l\'ouverture';

  @override
  String get appLockHelp =>
      'Casama vous demande de le déverrouiller à l\'ouverture et après une absence. Lorsqu\'il est activé, votre session est conservée dans le trousseau de cet appareil.';

  @override
  String get appLockSwitch => 'Verrouiller Casama';

  @override
  String get appLockLocked => 'Casama est verrouillé';

  @override
  String get appLockUnlock => 'Déverrouiller';

  @override
  String get appLockUnlockWithPasskey => 'Déverrouiller avec une clé d\'accès';

  @override
  String get appLockUnlockReason => 'Déverrouiller Casama';

  @override
  String get appLockTurnOnReason => 'Activer le verrouillage de l\'app';

  @override
  String get appLockConfirmReason => 'Confirmez votre identité';

  @override
  String get appLockConfirmTitle => 'Confirmez votre identité';

  @override
  String appLockUnlockWith(String method) {
    return 'Utilisez $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID ou votre code';

  @override
  String get appLockDeviceAndroid =>
      'votre empreinte, votre visage ou votre verrouillage d\'écran';

  @override
  String get appLockDeviceMac => 'Touch ID ou le mot de passe de votre Mac';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'le verrouillage d\'écran de votre appareil';

  @override
  String appLockMethodDevice(String method) {
    return 'Se déverrouille avec $method';
  }

  @override
  String get appLockMethodPin =>
      'Se déverrouille avec un code PIN à 6 chiffres';

  @override
  String get appLockMethodPasskey => 'Se déverrouille avec une clé d\'accès';

  @override
  String get appLockPinHint => 'Saisissez votre code PIN';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Code PIN incorrect. $count essais restants.',
      one: 'Code PIN incorrect. $count essai restant.',
      zero: 'Code PIN incorrect.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Trop de codes PIN incorrects. Déconnectez-vous, puis reconnectez-vous pour ouvrir Casama.';

  @override
  String get appLockFailed => 'Cela n\'a pas fonctionné. Réessayez.';

  @override
  String get appLockUnavailable =>
      'Cet appareil ne peut pas déverrouiller Casama pour le moment. Déconnectez-vous, puis reconnectez-vous pour y accéder.';

  @override
  String get appLockSignOutConfirm =>
      'La déconnexion désactive le verrouillage de l\'app sur cet appareil. Reconnectez-vous pour ouvrir Casama.';

  @override
  String get appLockCallRinging =>
      'Un appel sonne. Déverrouillez pour répondre.';

  @override
  String get appLockRequiredTitle => 'Activer le verrouillage de l\'app';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace exige le verrouillage de l\'app sur chaque appareil qui ouvre Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Ce navigateur ne peut pas utiliser les clés d\'accès avec ce serveur et ne peut donc pas verrouiller Casama. Ouvrez Casama dans l\'app sur votre téléphone ou ordinateur.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Activé. Requis par $workspace';
  }

  @override
  String get appLockTurnOn => 'Activer';

  @override
  String get appLockTurnedOn => 'Le verrouillage de l\'app est activé';

  @override
  String get appLockNoWayHere =>
      'Ce navigateur ne peut pas utiliser les clés d\'accès avec ce serveur, Casama ne peut donc pas être verrouillé ici.';

  @override
  String get appLockNotChecked => 'Impossible de confirmer votre identité.';

  @override
  String get appLockPinSetupTitle => 'Choisir un code PIN';

  @override
  String get appLockPinAgainTitle => 'Saisir le code PIN à nouveau';

  @override
  String get appLockPinSetupBody =>
      '6 chiffres. Vous le saisirez pour ouvrir Casama.';

  @override
  String get appLockPinNext => 'Continuer';

  @override
  String get appLockPinMismatch =>
      'Les codes PIN ne correspondent pas. Choisissez-en un autre.';

  @override
  String get appLockPinNotSaved =>
      'Impossible d\'enregistrer le code PIN sur cet appareil.';

  @override
  String get appLockPinChanged => 'Code PIN modifié';

  @override
  String get appLockChangePin => 'Modifier le code PIN';

  @override
  String get appLockAfter => 'Verrouiller après';

  @override
  String get appLockAfterHelp =>
      'Temps en arrière-plan, réduit ou derrière d\'autres apps sur un ordinateur.';

  @override
  String get appLockAfterImmediately => 'Immédiatement';

  @override
  String get appLockAfterOneMinute => '1 minute';

  @override
  String get appLockAfterFiveMinutes => '5 minutes';

  @override
  String get appLockAfterFifteenMinutes => '15 minutes';

  @override
  String get appLockAfterOneHour => '1 heure';

  @override
  String get appLockBlockScreenshots => 'Bloquer les captures d\'écran';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Les captures, enregistrements et partages d\'écran n\'affichent rien de Casama.';

  @override
  String get appLockLockNow => 'Verrouiller maintenant';

  @override
  String get appLockPrivacySection => 'Plus de confidentialité';

  @override
  String get appLockAskBeforeRisky => 'Confirmer les actions risquées';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Déverrouiller à nouveau avant de supprimer votre compte, créer des clés, modifier la facturation, exporter des données, approuver des demandes à haut risque et prendre le contrôle d\'un ordinateur.';

  @override
  String get requireAppLock => 'Exiger le verrouillage de l\'app';

  @override
  String get requireAppLockHelp =>
      'Les membres doivent verrouiller Casama sur chaque appareil avant l\'ouverture. Sur le web, cela nécessite une clé d\'accès.';

  @override
  String get requireAppLockOwnFirst =>
      'Activez d\'abord le verrouillage de l\'app sur cet appareil.';

  @override
  String get permLocation => 'Localisation';

  @override
  String get permLocationAlways => 'Localisation en arrière-plan';

  @override
  String get permCamera => 'Appareil photo';

  @override
  String get permMicrophone => 'Microphone';

  @override
  String get permSpeech => 'Reconnaissance vocale';

  @override
  String get permPhotos => 'Photos';

  @override
  String get permContacts => 'Contacts';

  @override
  String get permCalendar => 'Calendriers';

  @override
  String get permHealth => 'Santé';

  @override
  String get permNotifications => 'Notifications';

  @override
  String get permNotificationAccess => 'Accès aux notifications';

  @override
  String get permAccessibility => 'Accessibilité';

  @override
  String get permScreenRecording => 'Enregistrement de l\'écran';

  @override
  String get permAutomation => 'Automatisation';

  @override
  String get permFullDisk => 'Accès complet au disque';

  @override
  String get permSharedFolders => 'Dossiers partagés';

  @override
  String get permLocalTools => 'Outils locaux';

  @override
  String get cardPermissions => 'Autorisations';

  @override
  String permissionsTitle(String device) {
    return 'Activer ces autorisations pour $device';
  }

  @override
  String get permStateOn => 'Activé';

  @override
  String get permStateOff => 'Désactivé';

  @override
  String get permStateNotAsked => 'Pas encore demandé';

  @override
  String get permStateLimited => 'Limité';

  @override
  String get permStateUnknown => 'Inconnu';

  @override
  String get permStateUnavailable => 'Non disponible sur cet appareil';

  @override
  String get permStateUpdate => 'Mettez à jour Casama pour l\'activer ici';

  @override
  String get permTurnOn => 'Activer';

  @override
  String get permOpenSettings => 'Ouvrir les réglages';

  @override
  String get permOpenHealth => 'Ouvrir Santé';

  @override
  String get permHealthIosHow =>
      'Dans Santé, touchez votre photo, puis Apps, puis Casama, et activez ce que vos bots peuvent lire.';

  @override
  String get permChoose => 'Choisir';

  @override
  String get permRestart => 'Redémarrer Casama';

  @override
  String get permRestartToFinish => 'Redémarrer Casama pour terminer';

  @override
  String permOpenedOn(String device) {
    return 'Ouvert sur $device';
  }

  @override
  String permSentTo(String device) {
    return 'Envoyé sur $device : touchez la notification sur cet appareil';
  }

  @override
  String permOffline(String device) {
    return '$device est hors ligne';
  }

  @override
  String permRestarting(String device) {
    return 'Redémarrage de Casama sur $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Seul le propriétaire de $device peut les activer';
  }

  @override
  String get permNotNowLine => 'Pas maintenant';

  @override
  String get permContinue => 'Continuer';

  @override
  String get permContinueMessage => 'C\'est activé, allez-y.';

  @override
  String get permContinuedLine => 'Activé';

  @override
  String get permissionsScreenTitle => 'Autorisations';

  @override
  String get permissionsScreenHelp =>
      'Ce que les bots peuvent utiliser sur cet appareil. Rien n\'est demandé tant que vous ne touchez rien.';

  @override
  String get permissionsRowHelp =>
      'Localisation, écran, microphone et plus sur cet appareil';

  @override
  String permOtherDevice(String device) {
    return 'Ceci concernait $device. Ouvrez Casama là-bas pour l\'activer.';
  }

  @override
  String get permAnotherDevice => 'un autre appareil';

  @override
  String get permissionsNone => 'Rien à activer sur cet appareil.';

  @override
  String get widgetNeedsYou => 'Vous attend';

  @override
  String get widgetAllClear => 'Tout est bon';

  @override
  String get widgetAllow => 'Autoriser';

  @override
  String get widgetDeny => 'Refuser';

  @override
  String get widgetReview => 'Vérifier';

  @override
  String get widgetOpen => 'Ouvrir';

  @override
  String get widgetDoIt => 'Faire';

  @override
  String get widgetRunNow => 'Exécuter';

  @override
  String get widgetStarted => 'Démarrée';

  @override
  String get widgetStop => 'Arrêter';

  @override
  String get widgetAsk => 'Demander';

  @override
  String widgetAskBot(String bot) {
    return 'Demander à $bot';
  }

  @override
  String get widgetTalk => 'Parler';

  @override
  String get widgetTry => 'Essayer';

  @override
  String get widgetUpNext => 'À venir';

  @override
  String get widgetNoRoutines => 'Aucune routine';

  @override
  String get widgetWorking => 'Au travail';

  @override
  String get widgetWaiting => 'Vous attend';

  @override
  String get widgetIdle => 'Inactif';

  @override
  String widgetRepliedAt(String time) {
    return 'Réponse à $time';
  }

  @override
  String get widgetBrief => 'Résumé';

  @override
  String widgetBriefAt(String time) {
    return 'Résumé à $time';
  }

  @override
  String get widgetNoBrief => 'Aucun résumé';

  @override
  String get widgetToday => 'Aujourd\'hui';

  @override
  String get widgetCredits => 'Crédits';

  @override
  String widgetCreditsLeft(String amount) {
    return '$amount restants';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount aujourd\'hui';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n % utilisés';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Réinitialisation $time';
  }

  @override
  String get widgetFinished => 'Terminé';

  @override
  String get widgetLibrary => 'Bibliothèque';

  @override
  String get widgetNoCreations => 'Rien créé pour le moment';

  @override
  String get widgetTasks => 'Tâches';

  @override
  String get widgetTodo => 'À faire';

  @override
  String get widgetInProgress => 'En cours';

  @override
  String get widgetInReview => 'En révision';

  @override
  String get widgetBlocked => 'Bloquées';

  @override
  String get widgetSignIn => 'Ouvrir Casama pour se connecter';

  @override
  String get widgetNoBots => 'Rencontrez votre premier bot';

  @override
  String widgetAsOf(String time) {
    return 'à $time';
  }

  @override
  String get widgetUpdateServer =>
      'Mettez à jour votre serveur Casama pour utiliser ce widget';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot attend votre accord';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot suggère';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot demande de prendre le contrôle';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Prochain résumé $time';
  }

  @override
  String get widgetNothingNext => 'Rien de prévu';

  @override
  String get widgetsTitle => 'Widgets';

  @override
  String get widgetsRow =>
      'Vos bots sur l\'écran d\'accueil et l\'écran verrouillé';

  @override
  String get widgetsIntro =>
      'Les widgets montrent ce que font vos bots et ce qui vous attend, sans ouvrir Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Routines';

  @override
  String get widgetDescNeedsYou => 'Voir quels bots vous attendent';

  @override
  String get widgetDescBot => 'Voir ce que fait un bot';

  @override
  String get widgetDescAsk => 'Demander ou parler à un bot en un geste';

  @override
  String get widgetDescRoutines =>
      'Voir ce qui s\'exécute ensuite et le lancer maintenant';

  @override
  String get widgetDescToday => 'Voir toute votre journée sur un grand widget';

  @override
  String get widgetDescBrief => 'Lire votre résumé du matin';

  @override
  String get widgetDescLibrary => 'Voir ce que vos bots ont créé récemment';

  @override
  String get widgetDescTasks => 'Voir où en est le tableau des tâches';

  @override
  String get widgetDescCredits => 'Garder un œil sur vos crédits';

  @override
  String get widgetsAddToHome => 'Ajouter à l\'écran d\'accueil';

  @override
  String get widgetsPinUnsupported =>
      'Votre lanceur ne peut pas ajouter de widgets d\'ici. Touchez longuement un endroit vide de l\'écran d\'accueil, touchez Widgets et choisissez Casama.';

  @override
  String get widgetsHowToAdd => 'Comment ajouter';

  @override
  String get widgetsHowToIos =>
      'Touchez longuement un endroit vide de votre écran d\'accueil, touchez Modifier, puis Ajouter un widget, et choisissez Casama.';

  @override
  String get widgetsHowToMac =>
      'Cliquez sur la date et l\'heure dans la barre des menus, puis sur Modifier les widgets, et choisissez Casama. Ou faites un clic droit sur le bureau et choisissez Modifier les widgets.';

  @override
  String get widgetsLockScreen => 'Écran verrouillé et commandes';

  @override
  String get widgetsLockScreenHelp =>
      'Touchez longuement l\'écran verrouillé, touchez Personnaliser, puis Écran verrouillé, et touchez l\'espace sous l\'horloge pour ajouter Vous attend, À venir, Bot ou Crédits. Une demande reste masquée tant que l\'écran est verrouillé.';

  @override
  String get widgetsControlsHelp =>
      'Ouvrez le Centre de contrôle, touchez longuement, touchez Ajouter une commande et choisissez Demander à Casama, Parler à un bot ou Exécuter une routine. Elles peuvent aussi aller dans les coins de l\'écran verrouillé et sur le bouton Action.';

  @override
  String get widgetsShowDetails => 'Afficher les détails dans les widgets';

  @override
  String get widgetsShowDetailsHelp =>
      'Avec le verrouillage de l\'app activé, les widgets affichent uniquement les nombres et noms des bots, et leurs boutons ouvrent Casama. Activez ceci pour afficher aussi les demandes, messages et noms de routines.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Ne s\'applique que lorsque le verrouillage de l\'app est activé. Sans lui, les widgets affichent les détails.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace exige le verrouillage de l\'app, donc les widgets masquent les détails.';
  }

  @override
  String get widgetsPinBot => 'Épingler un bot à l\'écran d\'accueil';

  @override
  String get widgetsPinBotHelp =>
      'Place le bot sur votre écran d\'accueil avec sa propre icône. Touchez-la pour discuter.';

  @override
  String get widgetsPin => 'Épingler';

  @override
  String get widgetNudgeNeedsYou =>
      'Répondez aux demandes depuis votre écran d\'accueil avec le widget Vous attend.';

  @override
  String get widgetNudgeRoutines =>
      'Exécutez des routines depuis votre écran d\'accueil avec le widget Routines.';

  @override
  String get widgetNameCanvas => 'Canevas';

  @override
  String get widgetDescCanvas =>
      'Affiche ce que vos bots y placent, comme un verset du jour ou un compte à rebours';

  @override
  String get canvasEmpty => 'Demandez à un bot de mettre quelque chose ici';

  @override
  String get canvasTry =>
      'Essayez : mets une citation du jour sur mon écran verrouillé';

  @override
  String get canvasAutomatic => 'Automatique';

  @override
  String canvasIn(String time) {
    return 'dans $time';
  }

  @override
  String canvasSince(String time) {
    return 'depuis $time';
  }

  @override
  String get canvasNow => 'Maintenant';

  @override
  String canvasLeft(String n) {
    return '$n restants';
  }

  @override
  String get canvasLeftUnit => 'restants';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'jours',
      one: 'jour',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widgets';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot veut afficher ceci sur vos widgets';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Une fois votre accord donné, $bot peut le modifier sans demander. Vous pouvez l\'arrêter à tout moment dans Réglages, Widgets.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot a placé ceci sur vos widgets';
  }

  @override
  String get canvasShow => 'Afficher sur mes widgets';

  @override
  String get canvasShowing => 'Affiché sur vos widgets';

  @override
  String canvasNotShown(String bot) {
    return 'Non affiché. $bot pourra redemander un autre jour.';
  }

  @override
  String get canvasGone => 'N\'est plus sur vos widgets';

  @override
  String get canvasNotPlaced => 'Ajoutez le widget Canevas pour le voir.';

  @override
  String get canvasHowToIos =>
      'Touchez longuement l\'écran d\'accueil ou l\'écran verrouillé, touchez Modifier, puis Ajouter un widget, et choisissez Casama, puis Canevas.';

  @override
  String get canvasHowToMac =>
      'Faites un clic droit sur le bureau, choisissez Modifier les widgets, puis Casama, puis Canevas.';

  @override
  String get canvasHowToElsewhere =>
      'Ajoutez le widget Canevas de Casama sur votre téléphone ou Mac pour le voir là-bas.';

  @override
  String get canvasAdded => 'Widget Canevas ajouté';

  @override
  String get canvasLockScreen => 'Sur l\'écran verrouillé';

  @override
  String get widgetsFromBots => 'De vos bots';

  @override
  String get widgetsFromBotsEmpty =>
      'Rien pour le moment. Demandez à un bot quelque chose comme « Mettez un verset du jour sur mon écran verrouillé ».';

  @override
  String canvasSetAt(String time) {
    return 'Défini $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Affiché sur $devices';
  }

  @override
  String get canvasNoWidget => 'Aucun widget Canevas placé pour le moment';

  @override
  String get canvasPausedLine => 'En pause';

  @override
  String get canvasWaitingLine => 'En attente de votre accord';

  @override
  String get canvasHideLocked => 'Masquer sur téléphone verrouillé';

  @override
  String get canvasPause => 'Mettre en pause';

  @override
  String get canvasResume => 'Reprendre';

  @override
  String get canvasClear => 'Effacer';

  @override
  String canvasClearTitle(String name) {
    return 'Effacer $name ?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Cela disparaît de vos widgets. $bot peut y placer autre chose à nouveau.';
  }

  @override
  String get canvasAllowedBots => 'Bots sur vos widgets';

  @override
  String get canvasMayShow => 'Peut afficher du contenu sur vos widgets';

  @override
  String canvasStopTitle(String bot) {
    return 'Arrêter $bot ?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'Ce que $bot affiche sur vos widgets est effacé et il devra redemander.';
  }

  @override
  String get canvasStop => 'Arrêter';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Téléphone Android';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Afficher';

  @override
  String get widgetLowRisk => 'Risque faible';

  @override
  String get widgetThisMonth => 'Ce mois-ci';

  @override
  String get watchNow => 'Maintenant';

  @override
  String get watchAsk => 'Demander';

  @override
  String watchAskBot(String bot) {
    return 'Demander à $bot';
  }

  @override
  String get watchBots => 'Bots';

  @override
  String get watchUpNext => 'À venir';

  @override
  String get watchBrief => 'Résumé';

  @override
  String get watchSettings => 'Réglages';

  @override
  String get watchChat => 'Discussion';

  @override
  String get watchTalk => 'Parler';

  @override
  String get watchCredits => 'Crédits';

  @override
  String get watchNeedsYou => 'Vous attend';

  @override
  String get watchNeedsYouOne => '1 vous attend';

  @override
  String watchNeedsYouMany(String count) {
    return '$count vous attendent';
  }

  @override
  String get watchNeedsOk => 'Accord requis';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot attend votre accord';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot suggère';
  }

  @override
  String get watchTakeOver => 'Prendre le contrôle';

  @override
  String get watchAllClear => 'Tout est bon';

  @override
  String get watchNothingWaiting => 'Rien ne vous attend';

  @override
  String get watchAllow => 'Autoriser';

  @override
  String get watchDeny => 'Refuser';

  @override
  String get watchHoldToAllow => 'Maintenir pour autoriser';

  @override
  String get watchHoldHint => 'Autoriser ? Touchez deux fois pour autoriser.';

  @override
  String get watchReview => 'Vérifier';

  @override
  String get watchReviewOnIphone => 'Voir sur iPhone';

  @override
  String get watchReviewOnPhone => 'Voir sur téléphone';

  @override
  String get watchWhyHighRisk => 'Risque élevé : répondez sur votre téléphone';

  @override
  String get watchWhyPayment =>
      'Les paiements se confirment sur votre téléphone';

  @override
  String get watchWhySetting => 'Vos réglages gardent ceci sur votre téléphone';

  @override
  String get watchWhyWorkspace =>
      'Votre espace de travail garde ceci sur votre téléphone';

  @override
  String get watchWhyNotYours =>
      'Seule la personne qui a lancé cette discussion peut l\'autoriser';

  @override
  String get watchHighRisk => 'Risque élevé';

  @override
  String get watchMediumRisk => 'Risque moyen';

  @override
  String get watchLowRisk => 'Risque faible';

  @override
  String get watchAllowed => 'Autorisé';

  @override
  String get watchDenied => 'Refusé';

  @override
  String get watchDone => 'Fait';

  @override
  String get watchAlreadyAnswered => 'Déjà répondu';

  @override
  String get watchLockToAllow =>
      'Définissez un code sur cette montre pour autoriser depuis celle-ci';

  @override
  String get watchDoIt => 'Faire';

  @override
  String get watchNotNow => 'Pas maintenant';

  @override
  String get watchOpenOnIphone => 'Ouvrir sur iPhone';

  @override
  String get watchOpenOnPhone => 'Ouvrir sur téléphone';

  @override
  String get watchSentToPhone => 'Envoyé sur votre téléphone';

  @override
  String get watchWorking => 'Au travail';

  @override
  String watchIsWorking(String bot) {
    return '$bot travaille';
  }

  @override
  String get watchWaitingForYou => 'En attente';

  @override
  String watchRepliedAt(String time) {
    return 'Réponse à $time';
  }

  @override
  String get watchIdle => 'Inactif';

  @override
  String get watchOff => 'Désactivé';

  @override
  String watchStepCount(String count) {
    return 'Étape $count';
  }

  @override
  String get watchStop => 'Arrêter';

  @override
  String get watchStopped => 'Arrêté';

  @override
  String get watchFinished => 'Terminé';

  @override
  String get watchProblem => 'Arrêté avec un problème';

  @override
  String get watchCouldntFinish => 'Impossible de terminer';

  @override
  String get watchListening => 'Écoute…';

  @override
  String get watchTapToStop => 'Touchez pour arrêter';

  @override
  String get watchTypeInstead => 'Écrire plutôt';

  @override
  String get watchSending => 'Envoi…';

  @override
  String get watchHeard => 'Entendu';

  @override
  String get watchUndo => 'Annuler';

  @override
  String get watchKeptOffline => 'Enregistré. Envoi dès le retour en ligne';

  @override
  String watchKeptOld(String time) {
    return 'Envoyer votre demande de $time ?';
  }

  @override
  String get watchSend => 'Envoyer';

  @override
  String get watchDiscard => 'Ignorer';

  @override
  String get watchMicDenied => 'Autorisez le micro dans Réglages pour parler';

  @override
  String get watchNoDictation =>
      'Ce serveur n\'a pas de service vocal. Utilisez « Écrire plutôt »';

  @override
  String get watchDidntCatch => 'Pas compris. Réessayez';

  @override
  String get watchReply => 'Répondre';

  @override
  String get watchReadAloud => 'Lire à voix haute';

  @override
  String get watchStopReading => 'Arrêter la lecture';

  @override
  String get watchContinuesOnIphone => 'Suite sur iPhone';

  @override
  String get watchContinuesOnPhone => 'Suite sur téléphone';

  @override
  String get watchReplyReady => 'Réponse prête';

  @override
  String get watchYou => 'Vous';

  @override
  String get watchQuickYes => 'Oui';

  @override
  String get watchQuickNo => 'Non';

  @override
  String get watchQuickTellMore => 'Dites-m\'en plus';

  @override
  String get watchQuickNotNow => 'Pas maintenant';

  @override
  String get watchRunNow => 'Exécuter';

  @override
  String get watchStarted => 'Démarrée';

  @override
  String watchInMinutes(String minutes) {
    return 'dans $minutes min';
  }

  @override
  String get watchNoRoutines => 'Aucune routine';

  @override
  String watchBriefAt(String time) {
    return 'Résumé à $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Résumé demain à $time';
  }

  @override
  String get watchNoBrief => 'Aucun résumé';

  @override
  String get watchNoBots => 'Aucun bot. Créez-en un sur votre téléphone';

  @override
  String get watchSigningIn => 'Connexion';

  @override
  String watchSignedInAs(String name) {
    return 'Compte : $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Ouvrez Casama sur votre iPhone pour terminer';

  @override
  String get watchOpenPhoneToFinish =>
      'Ouvrez Casama sur votre téléphone pour terminer';

  @override
  String get watchUseCode => 'Se connecter avec un code';

  @override
  String get watchCodeHelp =>
      'Saisissez-le dans Casama sur votre téléphone ou ordinateur : Réglages → Montre';

  @override
  String get watchNewCode => 'Nouveau code';

  @override
  String get watchSignedOut => 'Cette montre est déconnectée';

  @override
  String get watchOpenToSignIn => 'Ouvrez Casama pour vous connecter';

  @override
  String watchAsOf(String time) {
    return 'à $time';
  }

  @override
  String get watchOffline => 'Hors ligne';

  @override
  String get watchCouldntReach => 'Casama inaccessible';

  @override
  String get watchTryAgain => 'Réessayer';

  @override
  String get watchServerTooOld =>
      'Mettez à jour votre serveur Casama pour utiliser la montre';

  @override
  String get watchOutOfCredits => 'Plus de crédits';

  @override
  String get watchTalkOnPhone => 'Démarrage de l\'appel sur votre téléphone';

  @override
  String get watchSignOut => 'Déconnecter cette montre';

  @override
  String get watchHideDetails => 'Masquer les détails poignet baissé';

  @override
  String get watchReadRepliesAloud => 'Lire les réponses à voix haute';

  @override
  String get watchAskUses => 'Bot pour Demander';

  @override
  String get watchWorkspace => 'Espace de travail';

  @override
  String get watchSignedInAsLabel => 'Compte';

  @override
  String get watchCompNeedsYou => 'Vous attend';

  @override
  String get watchCompAsk => 'Demander à un bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'À venir';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou =>
      'Nombre de demandes en attente et la première d\'entre elles';

  @override
  String get watchCompDescAsk => 'Demander à un bot à la voix en un geste';

  @override
  String get watchCompDescBot => 'État d\'un bot et ce qu\'il fait';

  @override
  String get watchCompDescUpNext =>
      'La prochaine routine et son heure d\'exécution';

  @override
  String get watchCompDescCredits => 'Crédits utilisés sur cette période';

  @override
  String get watchNeedYouShort => 'en attente';

  @override
  String get watchControlAsk => 'Demander à Casama';

  @override
  String get watchControlTalk => 'Parler à un bot';

  @override
  String get watchControlRun => 'Exécuter une routine';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count vous attendent. En premier : $text';
  }

  @override
  String get watchPhoneTitle => 'Montre';

  @override
  String get watchPhoneIntro =>
      'Répondez aux bots, demandez à la voix et voyez qui travaille depuis votre poignet.';

  @override
  String get watchPhoneWatches => 'Montres connectées';

  @override
  String get watchPhoneNone =>
      'Aucune montre connectée. Ouvrez Casama sur votre montre et elle se connecte toute seule.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Dernière utilisation $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Pas encore utilisée';

  @override
  String get watchPhoneRemove => 'Retirer';

  @override
  String watchPhoneRemoveTitle(String name) {
    return 'Retirer $name ?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Elle se déconnecte immédiatement. Vous pourrez la reconnecter plus tard.';

  @override
  String get watchPhoneUseCode => 'Connecter une montre avec un code';

  @override
  String get watchPhoneCodeHint => 'Le code affiché sur votre montre';

  @override
  String watchPhoneCodeAsk(String name) {
    return 'Connecter $name ?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Elle sera connectée à $workspace sous votre compte. N\'autorisez que le code affiché sur votre propre montre.';
  }

  @override
  String get watchPhoneCodeAllow => 'Connecter';

  @override
  String get watchPhoneCodeWrong =>
      'Ce code n\'a pas fonctionné. Vérifiez-le sur votre montre';

  @override
  String get watchPhoneCodeTaken =>
      'Cette montre est encore connectée à un autre compte. Retirez-la là-bas dans Réglages → Montre, puis obtenez un nouveau code';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Connectée à $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'Connectée à un autre espace de travail';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name est connectée';
  }

  @override
  String get watchPhoneAllowTitle => 'Autoriser depuis la montre';

  @override
  String get watchPhoneAllowMedium => 'Risque faible et moyen';

  @override
  String get watchPhoneAllowMediumBody =>
      'Risque faible d\'un geste, risque moyen par appui long. Risque élevé et paiements nécessitent toujours votre téléphone.';

  @override
  String get watchPhoneAllowLow => 'Risque faible uniquement';

  @override
  String get watchPhoneAllowNone => 'Jamais';

  @override
  String get watchPhoneDetails => 'Afficher les détails sur la montre';

  @override
  String get watchPhoneDetailsBody =>
      'Désactivé : la montre affiche les nombres et noms de bots, pas ce qu\'ils ont écrit.';

  @override
  String get watchPhoneQuickReplies => 'Réponses rapides';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Réponses courtes à envoyer depuis une notification de réponse. Jusqu\'à six.';

  @override
  String get watchPhoneQuickAdd => 'Ajouter une réponse rapide';

  @override
  String get watchPhoneQuickReset => 'Utiliser les réponses intégrées';

  @override
  String get watchPhoneHowTo => 'Ajouter Casama au cadran';

  @override
  String get watchPhoneHowToApple =>
      'Touchez et maintenez le cadran, touchez Modifier, puis choisissez Casama pour une complication. Tournez la Digital Crown sur le cadran pour trouver Casama dans le défilement intelligent.';

  @override
  String get watchPhoneHowToWear =>
      'Touchez et maintenez le cadran pour ajouter une complication Casama. Balayez vers la gauche depuis le cadran et touchez + pour ajouter une tuile Casama.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Connexion de $name…';
  }

  @override
  String get watchPhoneLockAsk => 'Connecter votre montre ?';

  @override
  String get watchPhoneNudge =>
      'Casama est aussi sur votre montre. Répondez aux bots depuis votre poignet.';

  @override
  String get watchPhoneHandoffTitle => 'Depuis votre montre';

  @override
  String get watchPhoneRow =>
      'Vos bots sur votre Apple Watch ou montre Wear OS';

  @override
  String get watchPhoneAllowLowBody =>
      'Risque faible d\'un geste. Tout le reste nécessite votre téléphone.';

  @override
  String get watchPhoneAllowNoneBody =>
      'La montre ne peut que refuser. Autorisez sur votre téléphone.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Désactivé car le verrouillage de l\'app est activé, afin que votre montre n\'affiche aucun mot de vos discussions. Activez pour les afficher.';

  @override
  String get watchPhoneQuickHint => 'Une réponse courte';

  @override
  String get watchPhoneQuickTooLong => 'Jusqu\'à 40 caractères';

  @override
  String get watchPhoneQuickMoveUp => 'Monter';

  @override
  String get watchPhoneQuickMoveDown => 'Descendre';

  @override
  String get watchPhoneQuickDelete => 'Supprimer cette réponse';

  @override
  String get watchPhoneCodeBody =>
      'Sur votre montre, ouvrez Casama et choisissez Se connecter avec un code.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => 'Qui travaille et ce qu\'il fait';

  @override
  String get watchCompDescBrief => 'Le résumé de ce matin';

  @override
  String get watchCodeWaiting => 'En attente du code…';

  @override
  String watchCodeA11y(String code) {
    return 'Code de connexion $code';
  }

  @override
  String get watchChooseBot => 'Choisir un bot';

  @override
  String get watchChannelRequests => 'Demandes';

  @override
  String get watchChannelReplies => 'Réponses';

  @override
  String get watchChannelRuns => 'Bots au travail';

  @override
  String get watchChannelOther => 'Autre';

  @override
  String get watchOtherWorkspace =>
      'Ceci est dans un autre espace de travail. Répondez sur votre téléphone';

  @override
  String get watchReplySent => 'Envoyé';

  @override
  String get watchReplyNotSent => 'Impossible d\'envoyer votre réponse';

  @override
  String watchAskDropped(String time) {
    return 'Impossible d\'envoyer votre demande de $time';
  }

  @override
  String get watchNeedsHttps =>
      'Cette montre ne peut joindre votre serveur qu\'en https ou sur votre réseau local';

  @override
  String get watchSignIn => 'Se connecter';

  @override
  String get watchNotOnWatch =>
      'Cette montre ne peut pas répondre à celle-ci. Ouvrez-la sur votre téléphone';

  @override
  String watchMoreOnPhone(String count) {
    return '$count de plus sur votre téléphone';
  }

  @override
  String get watchShareCrashReports => 'Partager les rapports de plantage';

  @override
  String get showList => 'Afficher la liste';

  @override
  String get hideList => 'Masquer la liste';

  @override
  String get panePickLibrary =>
      'Choisissez un élément dans la Bibliothèque pour l\'afficher ici.';

  @override
  String get panePickSetting => 'Choisissez un réglage pour l\'afficher ici.';

  @override
  String get trackpad => 'Pavé tactile';

  @override
  String get trackpadHint =>
      'Un doigt déplace le pointeur, deux doigts font défiler, un toucher clique.';

  @override
  String get trackpadTakeControl =>
      'Prenez le contrôle pour utiliser le pavé tactile.';

  @override
  String get foldScreenTitle => 'Écran pliable';

  @override
  String get foldRowHelp => 'Ce que Casama voit des écrans de cet appareil';

  @override
  String get foldScreenHelp =>
      'Comment cet appareil est tenu et où se trouve son pli, tel que Casama le voit actuellement. Ouvrez, fermez ou pliez l\'appareil et les valeurs suivent. Copiez-les si un écran semble incorrect.';

  @override
  String get foldPose => 'Posture';

  @override
  String get foldWindow => 'Fenêtre';

  @override
  String get foldInsets => 'Zone sûre';

  @override
  String get foldStrip => 'Bande latérale';

  @override
  String get foldFold => 'Pli';

  @override
  String get foldHinge => 'Charnière';

  @override
  String get foldSystemSays => 'Ce que rapporte le système';

  @override
  String get inviteGateLine =>
      'Casama Cloud est uniquement sur invitation pour le moment.';

  @override
  String get inviteGateSelfHost =>
      'Exécuter Casama sur votre propre serveur est ouvert à tous.';

  @override
  String get joinTheWaitlist => 'Rejoindre la liste d\'attente';

  @override
  String get iHaveAnInvite => 'J\'ai une invitation';

  @override
  String get waitlistSubtitle =>
      'Nous ouvrons l\'accès petit à petit. Vous recevrez un seul e-mail quand ce sera votre tour.';

  @override
  String get waitlistNote => 'Que demanderiez-vous d\'abord à un bot ?';

  @override
  String get waitlistNoteHint => 'Facultatif';

  @override
  String get waitlistSelfHosting => 'J\'exécute Casama sur mon propre serveur';

  @override
  String get waitlistNewsletter =>
      'M\'envoyer aussi l\'e-mail mensuel de Casama (une fois par mois maximum)';

  @override
  String get waitlistAppleRelay =>
      'C\'est l\'adresse privée qu\'Apple a créée pour vous. Gardez-la si vous vous connectez avec Apple ; Apple transfère notre e-mail vers votre boîte de réception.';

  @override
  String get waitlistJoinedTitle => 'Vous êtes sur la liste.';

  @override
  String get waitlistJoinedBody =>
      'Nous ouvrons l\'accès petit à petit. Vous recevrez un seul e-mail quand ce sera votre tour, et rien d\'autre sauf si vous avez demandé l\'e-mail mensuel. Vous connaissez quelqu\'un qui utilise Casama ? Une invitation de sa part vous fait entrer tout de suite.';

  @override
  String get waitlistJoinedCode =>
      'Vous avez un code d\'invitation ? Saisissez-le ici.';

  @override
  String get waitlistJoinedSelfHost =>
      'Vous ne voulez pas attendre ? Casama est open source. Exécutez-le sur votre propre ordinateur dès aujourd\'hui.';

  @override
  String get waitlistRunItYourself => 'L\'héberger vous-même';

  @override
  String get inviteSubtitle =>
      'Saisissez votre code d\'invitation ou collez le lien d\'invitation.';

  @override
  String get inviteCodeLabel => 'Code d\'invitation';

  @override
  String get inviteNotFound =>
      'Ce code ne correspond à aucune invitation. Vérifiez-le et réessayez.';

  @override
  String inviteFromName(String name) {
    return '$name vous a invité sur Casama';
  }

  @override
  String get inviteFromFriend => 'Un ami vous a invité sur Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Votre invitation : $label';
  }

  @override
  String get inviteFromCasama => 'Votre invitation sur Casama';

  @override
  String get inviteChooseSignIn =>
      'Choisissez maintenant comment vous connecter. Utilisez l\'adresse souhaitée pour votre compte.';

  @override
  String get inviteGoneHelp =>
      'Ces invitations ont toutes été utilisées. Saisissez votre e-mail pour rejoindre la liste d\'attente, en tête de file.';

  @override
  String get inviteEmailHelp =>
      'Nous autoriserons cette adresse, puis nous lui enverrons un lien de connexion.';

  @override
  String inviteCheckInbox(String email) {
    return 'Vous y êtes. Consultez $email pour le lien de connexion, ou saisissez son code ici.';
  }

  @override
  String get inviteWaitlistedTitle => 'Vous êtes sur la liste d\'attente';

  @override
  String get inviteWaitlisted =>
      'Ces invitations ont toutes été utilisées, mais vous êtes en tête de file.';

  @override
  String get inviteUseEmailHere =>
      'Sur cet appareil, utilisez Continuer avec l\'e-mail. Apple et Google fonctionnent avec une invitation dans les apps iPhone, Mac et Android.';

  @override
  String get inviteDifferentCode => 'Utiliser un autre code';

  @override
  String get inviteRefusedHelp =>
      'Rejoignez la liste d\'attente et nous vous enverrons un e-mail quand ce sera votre tour, ou saisissez un code d\'invitation si vous en avez un.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud est uniquement sur invitation pour le moment. Nous vous enverrons un e-mail quand ce sera votre tour. Vous avez un code d\'invitation ? Utilisez-le maintenant.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count invitations restantes',
      one: '$count invitation restante',
      zero: 'Aucune invitation restante',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used sur $total utilisées. Chacune permet à un ami de créer un compte.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Vos invitations se débloquent après votre première discussion terminée.';

  @override
  String get inviteWaitingTitle => 'En attente de votre invitation';

  @override
  String get inviteWaitingUses =>
      'Lui ouvrir l\'accès utilise l\'une de vos invitations.';

  @override
  String get inviteWaitingNoneLeft =>
      'Vous récupérez une invitation lorsqu\'un ami que vous avez invité termine sa première discussion.';

  @override
  String get inviteWaitingLetIn => 'Laisser entrer';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Laisser entrer $email';
  }

  @override
  String get inviteWaitingDone =>
      'Ils recevront un e-mail pour s\'inscrire dans quelques minutes.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Je t\'ai gardé une de mes $count invitations Casama.',
      one: 'Je t\'ai gardé une de mes $count invitations Casama.',
    );
    return '$_temp0 Casama est uniquement sur invitation pour le moment, et celle-ci te fait entrer tout de suite : $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Je vous ai gardé une de mes $count invitations Casama.',
      one: 'Je vous ai gardé une de mes $count invitations Casama.',
    );
    return '$_temp0 Casama est uniquement sur invitation pour le moment. Celle-ci vous fait entrer tout de suite et vous offre $amount d\'utilisation gratuite après votre première discussion : $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Pour qui est-ce ?';

  @override
  String get inviteNameHelp =>
      'Ajoutez son prénom et la page d\'invitation l\'accueillera par son nom. Vous pouvez laisser vide.';

  @override
  String get inviteNameHint => 'Prénom';

  @override
  String get inviteNameShare => 'Partager l\'invitation';

  @override
  String get inviteAskTitle => 'Qui d\'autre pourrait l\'utiliser ?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Vous avez $count invitations à Casama. Chacune fait entrer un ami tout de suite.',
      one:
          'Vous avez $count invitation à Casama. Chacune fait entrer un ami tout de suite.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Vous recevez chacun $amount d\'utilisation gratuite après sa première discussion.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Vous recevez $amount d\'utilisation gratuite après sa première discussion.';
  }

  @override
  String get inviteAskSend => 'Envoyer une invitation';

  @override
  String get inviteAskNotNow => 'Pas maintenant';

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
      other: '$count recharges en réserve',
      one: '$count recharge en réserve',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'À utiliser avant le $date';
  }

  @override
  String get savedResetUse => 'Utiliser la recharge';

  @override
  String get savedResetConfirmTitle => 'Utiliser cette recharge ?';

  @override
  String get savedResetConfirmDaily =>
      'Efface la limite d\'aujourd\'hui pour que vos bots puissent retravailler aujourd\'hui. Cette action est irréversible.';

  @override
  String get savedResetConfirmComputer =>
      'Restaure les heures d\'ordinateur de ce mois-ci. Cette action est irréversible.';

  @override
  String get savedResetOwnerRequired =>
      'Seul un propriétaire de l\'espace de travail peut l\'utiliser.';

  @override
  String get savedResetPaused => 'En pause pour le moment. Revenez plus tard.';

  @override
  String get savedResetPeriodLimit =>
      'Vous avez utilisé la recharge de cette période. Vous pourrez utiliser celle-ci à la période suivante.';

  @override
  String get savedResetNothingToRefill =>
      'Rien à recharger pour le moment. Gardez-la pour quand vous manquerez de crédits.';

  @override
  String get savedResetNoBillingPeriod =>
      'Disponible une fois votre forfait configuré.';

  @override
  String get savedResetUnavailable => 'Indisponible pour le moment.';

  @override
  String savedResetDone(String amount) {
    return 'Recharge utilisée : $amount ajoutés';
  }

  @override
  String get savedResetDoneNoCredits => 'Recharge utilisée';

  @override
  String savedResetConfirm(String amount) {
    return 'Recharge $amount des crédits inclus de cette période. Cette action est irréversible.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Activer les recharges en réserve';

  @override
  String get resetsOffNote =>
      'Désactivé : personne ne reçoit de recharges en réserve.';

  @override
  String get resetsDecrease => 'Diminuer';

  @override
  String get resetsIncrease => 'Augmenter';

  @override
  String get resetsSettings => 'Réglages';

  @override
  String get resetsCampaigns => 'Campagnes';

  @override
  String get resetsStatLive => 'En cours';

  @override
  String get resetsStatGiven => 'Offertes';

  @override
  String get resetsStatUsed => 'Utilisées';

  @override
  String get resetsStatRefilled => 'Rechargés';

  @override
  String get resetsFilterActive => 'Actives';

  @override
  String get resetsFilterEnded => 'Terminées';

  @override
  String get resetsFilterAll => 'Toutes';

  @override
  String get resetsStateDraft => 'Brouillon';

  @override
  String get resetsStateScheduled => 'Planifiée';

  @override
  String get resetsStateLive => 'En ligne';

  @override
  String get resetsStatePaused => 'En pause';

  @override
  String get resetsStateEnded => 'Terminée';

  @override
  String get resetsStateCancelled => 'Annulée';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used sur $budget de budget';
  }

  @override
  String resetsGivenN(String count) {
    return '$count offertes';
  }

  @override
  String resetsUsedN(String count) {
    return '$count utilisées';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Début $start · Fin $end';
  }

  @override
  String get resetsToday => 'aujourd\'hui';

  @override
  String get resetsTomorrow => 'demain';

  @override
  String get resetsYesterday => 'hier';

  @override
  String get resetsAudienceEveryone => 'Chaque espace de travail';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count espaces de travail',
      one: '$count espace de travail',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Inscrit avant le $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Limite atteinte ces $days derniers jours',
      one: 'Limite atteinte ces $days derniers jours',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Annuler la campagne';

  @override
  String get resetsCancelConfirm => 'Annuler cette campagne ?';

  @override
  String get resetsCancelConfirmBody =>
      'Elle cesse de distribuer des recharges en réserve. Cette action est irréversible.';

  @override
  String get resetsDeleteConfirm => 'Supprimer cette campagne ?';

  @override
  String get resetsDeleteConfirmBody =>
      'Le brouillon est supprimé définitivement.';

  @override
  String get resetsNoCampaigns =>
      'Aucune campagne pour le moment. Lancez-en une pour offrir des recharges en réserve à plusieurs espaces de travail à la fois.';

  @override
  String get resetsNoMatches => 'Aucune campagne ici.';

  @override
  String get resetsEditCampaign => 'Modifier la campagne';

  @override
  String get resetsSectionBasics => 'Général';

  @override
  String get resetsSectionAudience => 'Public';

  @override
  String get resetsSectionTiming => 'Calendrier';

  @override
  String get resetsSectionRefill => 'Recharge';

  @override
  String get resetsSectionWhat => 'Ce qui est réinitialisé';

  @override
  String get resetsSectionNotify => 'Notifications';

  @override
  String get resetsPreviewLabel => 'Ce que voient les membres';

  @override
  String get resetsMonthly => 'Mensuel';

  @override
  String get resetsYearly => 'Annuel';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Forfaits';

  @override
  String get resetsPlansHint =>
      'Ne cochez rien pour inclure tous les forfaits.';

  @override
  String get resetsWorkspacesLabel => 'Espaces de travail';

  @override
  String get resetsWorkspacesHint =>
      'Laissez vide pour inclure tous les espaces de travail.';

  @override
  String get resetsSearchWorkspaces =>
      'Rechercher des espaces de travail par nom';

  @override
  String get resetsNoWorkspaceMatch => 'Aucun espace de travail correspondant.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Uniquement $name';
  }

  @override
  String get resetsJoinedBefore => 'Inscrit avant le';

  @override
  String get resetsLimitedDaysLabel =>
      'Limite atteinte au cours des N derniers jours';

  @override
  String get resetsStartsLabel => 'Début';

  @override
  String get resetsEndsLabel => 'Expiration';

  @override
  String resetsPercentValue(int percent) {
    return 'Recharger $percent % des crédits inclus';
  }

  @override
  String get resetsCapLabel => 'Maximum par utilisation';

  @override
  String get resetsBudgetLabel => 'Budget total';

  @override
  String get resetsOptional => 'Facultatif';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Touche environ $count espaces de travail · $credits en crédits · coût estimé : $cost';
  }

  @override
  String get resetsEstimating => 'Calcul de la portée…';

  @override
  String get resetsEstimateNeedsFields =>
      'Remplissez les champs pour voir la portée.';

  @override
  String get resetsLockedNote =>
      'Cette campagne est en cours : seuls le message, l\'expiration, le budget et le rappel peuvent être modifiés.';

  @override
  String get resetsRequired => 'Obligatoire.';

  @override
  String get resetsTooLong => '120 caractères maximum.';

  @override
  String get resetsDaysInvalid => 'Saisissez entre 1 et 365 jours.';

  @override
  String get resetsMoneyInvalid => 'Saisissez 0 ou plus.';

  @override
  String get resetsExpiryBeforeStart => 'Choisissez une fin après le début.';

  @override
  String resetsGivenTo(String name) {
    return 'Recharge en réserve envoyée à $name';
  }

  @override
  String get resetsCampaignSaved => 'Campagne enregistrée';

  @override
  String get resetsDefaultMessage =>
      'Une recharge en réserve, offerte par nos soins. Utilisez-la quand vous atteignez une limite.';

  @override
  String resetsGiveName(String name) {
    return 'Recharge en réserve pour $name';
  }

  @override
  String get resetsOneWorkspace => 'Un espace de travail';

  @override
  String get resetsPickWorkspace =>
      'Choisissez un espace de travail pour voir ses recharges en réserve.';

  @override
  String get resetsAllHistory => 'Tout l\'historique';

  @override
  String get resetsAllWorkspaces => 'Tous les espaces de travail';

  @override
  String get resetsNoEvents => 'Rien ici pour le moment.';

  @override
  String get resetsEventGiven => 'Recharge en réserve offerte';

  @override
  String get resetsEventUsed => 'Recharge en réserve utilisée';

  @override
  String get resetsEventRevoked => 'Reprise';

  @override
  String get resetsEventUndone => 'Recharge annulée';

  @override
  String get resetsEventExpired => 'Expirée sans utilisation';

  @override
  String get resetsEventCreated => 'Campagne créée';

  @override
  String get resetsEventEdited => 'Campagne modifiée';

  @override
  String get resetsEventStarted => 'Campagne démarrée';

  @override
  String get resetsEventEnded => 'Campagne terminée';

  @override
  String get resetsEventScheduled => 'Campagne planifiée';

  @override
  String get resetsEventPaused => 'Campagne mise en pause';

  @override
  String get resetsEventResumed => 'Campagne reprise';

  @override
  String get resetsEventCancelled => 'Campagne annulée';

  @override
  String get resetsEventDeleted => 'Campagne supprimée';

  @override
  String get resetsEventSettings => 'Réglages modifiés';

  @override
  String get resetsRevokeConfirm => 'Reprendre cette recharge en réserve ?';

  @override
  String get resetsRevokeConfirmBody =>
      'L\'espace de travail la perd avant de l\'utiliser.';

  @override
  String get resetsUndoConfirm => 'Annuler cette recharge ?';

  @override
  String get resetsUndoConfirmBody =>
      'Les crédits ajoutés sont de nouveau retirés.';

  @override
  String get resetsPerPeriod =>
      'Utilisations par espace de travail et par période';

  @override
  String get resetsMaxHeld => 'Maximum de recharges en réserve';

  @override
  String get resetsNotifyOwners => 'Notifier les propriétaires d\'instance';

  @override
  String get resetsNewCampaign => 'Nouvelle campagne';

  @override
  String get resetsName => 'Nom';

  @override
  String get resetsMessage => 'Message aux destinataires';

  @override
  String get resetsPlans =>
      'Codes de forfait, séparés par des virgules (vide signifie tous)';

  @override
  String get resetsWorkspaces =>
      'ID d\'espace de travail, séparés par des virgules (vide signifie tous)';

  @override
  String get resetsBefore => 'Créé avant le (date et heure, facultatif)';

  @override
  String get resetsLimitedDays =>
      'Limite atteinte ces N derniers jours (facultatif)';

  @override
  String get resetsStart => 'Début (date et heure)';

  @override
  String get resetsExpiry => 'Expiration (date et heure)';

  @override
  String get resetsPercent => 'Crédits inclus à recharger (%)';

  @override
  String get resetsCap => 'Maximum en dollars par utilisation (facultatif)';

  @override
  String get resetsBudget => 'Budget total de crédits en dollars (facultatif)';

  @override
  String get resetsDaily => 'Effacer la limite de modèle d\'aujourd\'hui';

  @override
  String get resetsComputer =>
      'Recharger les heures d\'ordinateur de ce mois-ci';

  @override
  String get resetsArrival => 'Notifier à l\'arrivée';

  @override
  String get resetsReminder => 'Rappeler avant expiration';

  @override
  String get resetsPreviewSave => 'Prévisualiser et enregistrer';

  @override
  String get resetsSchedule => 'Planifier';

  @override
  String get resetsPause => 'Mettre en pause';

  @override
  String get resetsResume => 'Reprendre';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count espaces de travail. Recharge maximale : $credits. Coût estimé : $cost.',
      one:
          '$count espace de travail. Recharge maximale : $credits. Coût estimé : $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace =>
      'ID d\'espace de travail (vide pour tout l\'historique)';

  @override
  String get resetsHistory => 'Charger l\'historique';

  @override
  String get resetsGive => 'Donner une recharge en réserve';

  @override
  String get resetsCopyCsv => 'Copier le CSV';

  @override
  String get resetsRevoke => 'Reprendre';

  @override
  String get resetsUndo => 'Annuler une recharge non utilisée';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention =>
      'Des services fournisseurs nécessitent une attention';

  @override
  String get vendorNotSetUp => 'Non configuré';

  @override
  String get vendorCheckNow => 'Vérifier maintenant';

  @override
  String get vendorLimit => 'Limite ou montant prépayé';

  @override
  String get vendorWarnAt => 'Avertir à';

  @override
  String get vendorExpiry => 'Expire le';

  @override
  String get vendorHistory => 'Relevés récents';

  @override
  String get vendorSave => 'Enregistrer';

  @override
  String get vendorEnabled => 'Suivi activé';

  @override
  String get vendorUnknown => 'Inconnu';

  @override
  String get vendorLow => 'Bas';

  @override
  String get vendorOut => 'Épuisé';

  @override
  String get vendorOk => 'OK';

  @override
  String get vendorNoReading => 'Aucun relevé pour le moment';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count demandent attention',
      one: '$count demande attention',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count OK';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count non configurés';
  }

  @override
  String get vendorNoVendors => 'Aucun service à surveiller pour le moment.';

  @override
  String get vendorCheckAll => 'Tout vérifier';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Vérification $done sur $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count services vérifiés',
      one: '$count service vérifié',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vérifications ont échoué',
      one: '$count vérification a échoué',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Nécessite une attention';

  @override
  String get vendorGroupHealthy => 'Sains';

  @override
  String get vendorGroupIdle => 'Non configurés ou désactivés';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Afficher $count de plus',
      one: 'Afficher $count de plus',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Afficher moins';

  @override
  String get vendorOff => 'Désactivé';

  @override
  String vendorPillPercent(String status, int percent) {
    return '$status · $percent %';
  }

  @override
  String vendorUsedOf(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String vendorLeft(String amount) {
    return '$amount restants';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Avertit en dessous de $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Réinitialisation $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Renouvellement $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Expiré le $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count minutes',
      one: 'dans $count minute',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count heures',
      one: 'dans $count heure',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count jours',
      one: 'dans $count jour',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Vérifié $when';
  }

  @override
  String get vendorSourceApi => 'Depuis le service';

  @override
  String get vendorSourceOwnCount => 'Compté par Casama';

  @override
  String get vendorSourceManual => 'Saisi manuellement';

  @override
  String vendorReadingError(String error) {
    return 'Dernière vérification échouée : $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Ajoutez sa clé sur le serveur pour démarrer la vérification.';

  @override
  String get vendorOffHint => 'Le suivi est désactivé.';

  @override
  String get vendorPickOne => 'Choisissez un service pour voir ses détails.';

  @override
  String get vendorSectionStatus => 'État';

  @override
  String get vendorSectionActions => 'Actions';

  @override
  String get vendorSectionAlerts => 'Alertes';

  @override
  String get vendorSectionPlan => 'Forfait';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Avertir à $percent % d\'utilisation';
  }

  @override
  String get vendorWarnAtHelp => 'La jauge passe à l\'orange ici.';

  @override
  String get vendorPeriod => 'Période';

  @override
  String get vendorPeriodNone => 'Non définie';

  @override
  String get vendorPeriodDay => 'Quotidienne';

  @override
  String get vendorPeriodMonth => 'Mensuelle';

  @override
  String get vendorPeriodBilling => 'À chaque période de facturation';

  @override
  String get vendorPeriodPrepaid => 'Prépayé';

  @override
  String get vendorDateNotSet => 'Non définie';

  @override
  String get vendorClearDate => 'Effacer la date';

  @override
  String get vendorLimitInvalid => 'Saisissez un nombre supérieur à 0.';

  @override
  String get vendorAmountInvalid => 'Saisissez 0 ou plus.';

  @override
  String get vendorMonthsInvalid => 'Saisissez entre 1 et 120 mois.';

  @override
  String get vendorWarnAtInvalid => 'Choisissez un seuil entre 1 % et 100 %.';

  @override
  String get vendorSaved => 'Réglages enregistrés';

  @override
  String get vendorCheckDone => 'Vérifié';

  @override
  String get vendorHistoryEmpty => 'Aucun relevé pour le moment.';

  @override
  String get vendorCheckFailed => 'Échec de la vérification';

  @override
  String get vendorResets => 'Réinitialisation';

  @override
  String get vendorSource => 'Source';

  @override
  String get vendorBilling => 'Facturation et recharge';

  @override
  String get vendorBalanceWarning => 'Avertir sous le solde';

  @override
  String get vendorPeriodStart => 'Début de la période';

  @override
  String get vendorInvalidSettings =>
      'Saisissez une limite positive, un avertissement entre 0 et 1 et des dates valides.';

  @override
  String get card24hRange => 'Plage de 24 h';

  @override
  String get card52wRange => 'Plage de 52 semaines';

  @override
  String get cardAgain => 'Encore';

  @override
  String get cardAgoSuffix => 'il y a';

  @override
  String get cardAirQuality => 'Qualité de l\'air';

  @override
  String get cardAqiAdviceBad =>
      'Tout le monde devrait réduire les efforts prolongés ou intenses à l\'extérieur et garder les fenêtres fermées.';

  @override
  String get cardAqiAdviceGood => 'Belle journée pour sortir.';

  @override
  String get cardAqiAdviceModerate =>
      'Correct pour la plupart des personnes ; les personnes très sensibles devraient éviter les efforts excessifs.';

  @override
  String get cardAqiAdviceSensitive =>
      'Les enfants, personnes âgées et personnes asthmatiques devraient limiter les efforts prolongés à l\'extérieur.';

  @override
  String get cardAqiGood => 'Bon';

  @override
  String get cardAqiHazardous => 'Dangereux';

  @override
  String get cardAqiModerate => 'Moyen';

  @override
  String get cardAqiSensitive => 'Nocif pour les groupes sensibles';

  @override
  String get cardAqiUnhealthy => 'Mauvais';

  @override
  String get cardAqiVeryUnhealthy => 'Très mauvais';

  @override
  String get cardBaggage => 'Bagages';

  @override
  String get cardCalcAmount => 'Montant';

  @override
  String get cardCalcBill => 'Facture';

  @override
  String get cardCalcDiscount => 'Réduction';

  @override
  String get cardCalcDiscountTitle => 'Réduction';

  @override
  String get cardCalcGross => 'Taxes comprises';

  @override
  String get cardCalcGrowth => 'Croissance';

  @override
  String get cardCalcInterest => 'Intérêts';

  @override
  String get cardCalcLoan => 'Prêt';

  @override
  String get cardCalcMonthly => 'Chaque mois';

  @override
  String get cardCalcMonthlyPayment => 'Mensualité';

  @override
  String get cardCalcNet => 'Hors taxes';

  @override
  String get cardCalcPeople => 'Personnes';

  @override
  String get cardCalcPerPerson => 'Chacun paie';

  @override
  String get cardCalcPrice => 'Prix';

  @override
  String get cardCalcPrincipal => 'Capital';

  @override
  String get cardCalcRate => 'Taux annuel';

  @override
  String get cardCalcSavings => 'Économies';

  @override
  String get cardCalcStart => 'Montant initial';

  @override
  String get cardCalcTax => 'Taxe';

  @override
  String get cardCalcTaxIncluded => 'Taxes incluses';

  @override
  String get cardCalcTaxRate => 'Taux de taxe';

  @override
  String get cardCalcTip => 'Pourboire';

  @override
  String get cardCalcTipAmount => 'Pourboire';

  @override
  String get cardCalcTipSplit => 'Pourboire et partage';

  @override
  String get cardCalcTotal => 'Total';

  @override
  String get cardCalcTotalInterest => 'Total des intérêts';

  @override
  String get cardCalcTotalPaid => 'Total payé';

  @override
  String get cardCalcUnits => 'Convertir les unités';

  @override
  String get cardCalcValue => 'Valeur';

  @override
  String get cardCalcVat => 'Taxe';

  @override
  String get cardCalcYears => 'Années';

  @override
  String get cardCalcYouPay => 'Vous payez';

  @override
  String get cardCalcYouPutIn => 'Vous versez';

  @override
  String get cardCalcYouSave => 'Vous économisez';

  @override
  String get cardCall => 'Appeler';

  @override
  String get cardCaloriesWord => 'Calories';

  @override
  String get cardComparison => 'Comparaison';

  @override
  String get cardCondClear => 'Dégagé';

  @override
  String get cardCondCloudy => 'Nuageux';

  @override
  String get cardCondDrizzle => 'Bruine';

  @override
  String get cardCondFog => 'Brouillard';

  @override
  String get cardCondHail => 'Grêle';

  @override
  String get cardCondHeavyRain => 'Forte pluie';

  @override
  String get cardCondHeavySnow => 'Fortes chutes de neige';

  @override
  String get cardCondLightRain => 'Pluie faible';

  @override
  String get cardCondLightSnow => 'Neige faible';

  @override
  String get cardCondMostlyClear => 'Plutôt dégagé';

  @override
  String get cardCondPartlyCloudy => 'Partiellement nuageux';

  @override
  String get cardCondRain => 'Pluie';

  @override
  String get cardCondShowers => 'Averses';

  @override
  String get cardCondSleet => 'Neige fondue';

  @override
  String get cardCondSnow => 'Neige';

  @override
  String get cardCondThunder => 'Orages';

  @override
  String get cardCons => 'Inconvénients';

  @override
  String get cardCopied => 'Copié';

  @override
  String get cardCopy => 'Copier en texte';

  @override
  String get cardCouldntUpdate => 'Impossible d\'actualiser';

  @override
  String get cardCurrency => 'Devise';

  @override
  String get cardDayLength => 'Durée du jour';

  @override
  String get cardDayRange => 'Amplitude du jour';

  @override
  String get cardDays => 'jours';

  @override
  String get cardDelay => 'Retard';

  @override
  String get cardDictionary => 'Dictionnaire';

  @override
  String get cardEmail => 'E-mail';

  @override
  String get cardFlightCancelled => 'Annulé';

  @override
  String get cardFlightDiverted => 'Dérouté';

  @override
  String get cardFlightInAir => 'En vol';

  @override
  String get cardFlightIncident => 'Incident';

  @override
  String get cardFlightLanded => 'Atterri';

  @override
  String get cardFlightScheduled => 'À l\'heure';

  @override
  String cardStaysFromNight(String price) {
    return 'dès $price la nuit';
  }

  @override
  String get cardStaysANight => 'la nuit';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n nuits',
      one: '$n nuit',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n voyageurs',
      one: '$n voyageur',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n chambres',
      one: '$n chambre',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Meilleurs';

  @override
  String get cardStaysSortCheapest => 'Moins chers';

  @override
  String get cardStaysSortTopRated => 'Mieux notés';

  @override
  String get cardStaysSortClosest => 'Plus proches';

  @override
  String get cardStaysFilterFreeCancel => 'Annulation gratuite';

  @override
  String get cardStaysFilterBreakfast => 'Petit-déjeuner';

  @override
  String get cardStaysFilterPayAtHotel => 'Payer à l\'hôtel';

  @override
  String get cardStaysFilterStars => '4 étoiles et plus';

  @override
  String get cardStaysFilterRated => 'Noté 8+';

  @override
  String get cardStaysList => 'Liste';

  @override
  String get cardStaysMap => 'Carte';

  @override
  String get cardStaysEdit => 'Modifier';

  @override
  String cardStaysRating(String value, String max) {
    return '$value sur $max';
  }

  @override
  String cardStaysKm(String km) {
    return 'à $km km du centre';
  }

  @override
  String cardStaysStars(int n) {
    return '$n étoiles';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price pour $n nuits',
      one: '$price pour $n nuit',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n autres sites',
      one: '+$n autre site',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Voir l\'offre';

  @override
  String get cardStaysView => 'Voir';

  @override
  String cardStaysShowAll(int n) {
    return 'Tout afficher ($n)';
  }

  @override
  String get cardStaysShowFewer => 'Afficher moins';

  @override
  String get cardStaysNone => 'Rien ne correspond à ces filtres.';

  @override
  String get cardStaysNoMap =>
      'Aucun de ces lieux n\'a de position sur la carte.';

  @override
  String get cardStaysNoDeals => 'Aucun tarif pour ces dates.';

  @override
  String get cardStaysCheck =>
      'Le prix est vérifié sur le site de réservation.';

  @override
  String cardStaysCompare(int n) {
    return 'Comparer ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Cochez-en jusqu\'à 4 pour comparer';

  @override
  String get cardStaysComparePick => 'Choisir pour comparer';

  @override
  String get cardStaysCompareTitle => 'Comparer';

  @override
  String get cardStaysRowNight => 'Prix par nuit';

  @override
  String get cardStaysRowTotal => 'Total';

  @override
  String get cardStaysRowRating => 'Note';

  @override
  String get cardStaysRowStars => 'Étoiles';

  @override
  String get cardStaysRowDistance => 'Distance';

  @override
  String get cardStaysYes => 'Oui';

  @override
  String get cardStaysNo => 'Non';

  @override
  String get cardStaysTermFreeCancel => 'Annulation gratuite';

  @override
  String get cardStaysTermBreakfast => 'Petit-déjeuner inclus';

  @override
  String get cardStaysTermNoBreakfast => 'Sans petit-déjeuner';

  @override
  String get cardStaysTermPayAtHotel => 'Payer à l\'hôtel';

  @override
  String get cardStaysTermNonRefundable => 'Non remboursable';

  @override
  String get cardStaysDetailsTitle => 'Hébergement';

  @override
  String get cardStaysCheapest => 'Moins cher';

  @override
  String get cardStaysAmenities => 'Équipements';

  @override
  String cardStaysCheckIn(String time) {
    return 'Arrivée à $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Départ à $time';
  }

  @override
  String get cardStaysNearby => 'À proximité';

  @override
  String get cardStaysHotelSite => 'Site web de l\'hôtel';

  @override
  String get cardStaysBook => 'Réserver pour moi';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Réserver $name sur $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Photo $n sur $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · prix par mois';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Moins cher : $month, environ $price la nuit';
  }

  @override
  String get cardStaysTrendNote => 'Prévision, pas des tarifs en direct.';

  @override
  String get cardStaysTrendPick => 'Choisir des dates';

  @override
  String get cardStaysSearchTitle => 'Trouver un hébergement';

  @override
  String get cardStaysSearchWhere => 'Où';

  @override
  String get cardStaysSearchWhereHint => 'Ville, quartier ou hôtel';

  @override
  String get cardStaysSearchDates => 'Choisir des dates';

  @override
  String get cardStaysSearchAdults => 'Adultes';

  @override
  String get cardStaysSearchRooms => 'Chambres';

  @override
  String get cardStaysSearchBudget => 'Budget par nuit (facultatif)';

  @override
  String get cardStaysSearchNotNow => 'Pas maintenant';

  @override
  String get cardStaysSearchGo => 'Rechercher des hébergements';

  @override
  String get cardStaysSearchSent => 'Recherche';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Hébergements à $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Moins : $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Plus : $label';
  }

  @override
  String get cardStaysAmenityPool => 'Piscine';

  @override
  String get cardStaysAmenityParking => 'Parking';

  @override
  String get cardStaysAmenityPets => 'Animaux acceptés';

  @override
  String get cardStaysAmenityGym => 'Salle de sport';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Cuisine';

  @override
  String get cardStaysAmenityWifi => 'Wi-Fi';

  @override
  String get cardStaysAmenityAirCon => 'Climatisation';

  @override
  String get cardProductsTitle => 'Articles à acheter';

  @override
  String cardProductsFrom(String price) {
    return 'à partir de $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'moins de $price';
  }

  @override
  String get cardProductsSortBest => 'Meilleurs';

  @override
  String get cardProductsSortCheapest => 'Moins chers';

  @override
  String get cardProductsSortTopRated => 'Mieux notés';

  @override
  String get cardProductsOnSale => 'En promotion';

  @override
  String get cardProductsRated => 'Notés 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct %';
  }

  @override
  String get cardProductsOtherStores => 'et autres boutiques';

  @override
  String cardProductsShowAll(int n) {
    return 'Tout afficher ($n)';
  }

  @override
  String get cardProductsShowFewer => 'Afficher moins';

  @override
  String get cardProductsShowMore => 'Afficher plus';

  @override
  String get cardProductsNone => 'Rien ne correspond à ces filtres.';

  @override
  String get cardProductsCheck => 'Le prix est vérifié auprès de la boutique.';

  @override
  String get cardProductsBuy => 'Acheter';

  @override
  String get cardProductsCompareStores => 'Comparer les boutiques';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Comparer les boutiques pour $title';
  }

  @override
  String get cardProductsBuyForMe => 'Acheter pour moi';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Acheter $title sur $store';
  }

  @override
  String get cardProductsRowPrice => 'Prix';

  @override
  String get cardProductsRowStore => 'Boutique';

  @override
  String get cardProductsRowRating => 'Note';

  @override
  String get cardProductsRowDelivery => 'Livraison';

  @override
  String cardProductsDelivery(String text) {
    return 'Livraison : $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'par $brand';
  }

  @override
  String get cardProductsOffers => 'Boutiques';

  @override
  String get cardProductsLowest => 'Total le plus bas';

  @override
  String cardProductsTotal(String price) {
    return 'Total $price';
  }

  @override
  String get cardProductsOutOfStock => 'Rupture de stock';

  @override
  String get cardProductsFeatures => 'À propos';

  @override
  String get cardProductsReviews => 'Ce que disent les acheteurs';

  @override
  String get cardCheckoutTitle => 'Vérifier avant de payer';

  @override
  String get cardCheckoutTotal => 'Total';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Ouvrir la page';

  @override
  String get cardCheckoutCancel => 'Annuler';

  @override
  String get cardCheckoutChange => 'Modifier';

  @override
  String get cardCheckoutConfirm => 'Confirmer et payer';

  @override
  String get cardCheckoutCancelLabel => 'Annuler ceci';

  @override
  String get cardCheckoutChangeLabel => 'Modifier quelque chose';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Confirmer $total chez $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Confirmer $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Confirmé';

  @override
  String get cardCheckoutChanging => 'Modification';

  @override
  String get cardCheckoutCancelled => 'Annulé';

  @override
  String get cardBookingTitle => 'Votre réservation';

  @override
  String cardBookingWith(String site) {
    return 'Réservé sur $site';
  }

  @override
  String get cardBookingCheckIn => 'Arrivée';

  @override
  String get cardBookingCheckOut => 'Départ';

  @override
  String get cardBookingConfirmation => 'Numéro de confirmation';

  @override
  String get cardBookingCopy => 'Copier le numéro de confirmation';

  @override
  String get cardBookingPaid => 'Payé';

  @override
  String get cardBookingPayAtHotel => 'Payer à l\'hôtel';

  @override
  String cardBookingCancelBy(String date) {
    return 'Annulation gratuite jusqu\'au $date';
  }

  @override
  String get cardBookingDirections => 'Itinéraire';

  @override
  String get cardBookingManage => 'Gérer la réservation';

  @override
  String get cardBookingCalendar => 'Ajouter au calendrier';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Ajouter $name à mon calendrier';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Commande $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Passée le $date';
  }

  @override
  String get cardOrderStepOrdered => 'Commandé';

  @override
  String get cardOrderStepShipped => 'Expédié';

  @override
  String get cardOrderStepOut => 'En cours de livraison';

  @override
  String get cardOrderStepDelivered => 'Livré';

  @override
  String get cardOrderCancelled => 'Annulé';

  @override
  String get cardOrderReturned => 'Retourné';

  @override
  String cardOrderArrives(String date) {
    return 'Arrive le $date';
  }

  @override
  String get cardOrderTracking => 'Numéro de suivi';

  @override
  String get cardOrderCopy => 'Copier le numéro de suivi';

  @override
  String get cardOrderTrack => 'Suivre';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Suivre $number';
  }

  @override
  String get cardOrderPage => 'Page de commande';

  @override
  String get cardFaresBest => 'Meilleurs';

  @override
  String get cardFaresCheapest => 'Moins chers';

  @override
  String get cardFaresFastest => 'Plus rapides';

  @override
  String get cardFaresDirectOnly => 'Vols directs uniquement';

  @override
  String get cardFaresDirect => 'Direct';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n escales',
      one: '$n escale',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Réserver';

  @override
  String cardFaresFromPrice(String price) {
    return 'à partir de $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n voyageurs',
      one: '$n voyageur',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n nuits',
      one: '$n nuit',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Économique';

  @override
  String get cardFaresPremium => 'Économique premium';

  @override
  String get cardFaresBusiness => 'Affaires';

  @override
  String get cardFaresFirst => 'Première';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Habituellement $low–$high pour ce trajet';
  }

  @override
  String get cardFaresLevelLow => 'Bas en ce moment';

  @override
  String get cardFaresLevelTypical => 'Habituel en ce moment';

  @override
  String get cardFaresLevelHigh => 'Élevé en ce moment';

  @override
  String cardFaresShowAll(int n) {
    return 'Tout afficher ($n)';
  }

  @override
  String get cardFaresShowFewer => 'Afficher moins';

  @override
  String get cardFaresNoDirect => 'Aucun vol direct dans cette recherche.';

  @override
  String get cardFaresOutboundOnly =>
      'Les prix concernent tout l\'aller-retour ; choisissez le vol retour sur Google Flights.';

  @override
  String get cardFaresSeeAll => 'Tout voir sur Google Flights';

  @override
  String get cardFaresCheck =>
      'Les prix incluent tous les voyageurs et sont revérifiés sur le site de réservation.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin en cabine, $checked en soute';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama peut percevoir une commission lorsque vous réservez via ces liens. Cela ne change pas le prix.';

  @override
  String cardFaresCompare(String site) {
    return 'Comparer sur $site';
  }

  @override
  String get cardFaresWatch => 'Suivre le prix';

  @override
  String cardFaresWatching(String date) {
    return 'Suivi · fin le $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Suivi pour $price ou moins · fin le $date';
  }

  @override
  String get cardFaresWatchStop => 'Arrêter';

  @override
  String get cardFaresWatchTitle => 'Suivre ce prix';

  @override
  String get cardFaresWatchBody =>
      'Casama vérifie ce prix plusieurs fois par jour et vous envoie une notification s\'il baisse. Le suivi s\'arrête automatiquement après la date ou au bout de 60 jours.';

  @override
  String get cardFaresWatchTarget =>
      'Me prévenir s\'il passe sous (facultatif)';

  @override
  String get cardFaresWatchAnyDrop =>
      'Laissez vide pour toute baisse importante';

  @override
  String get cardFaresWatchStart => 'Suivre';

  @override
  String get cardFaresWatchStarted =>
      'Suivi de ce prix activé. Vous recevrez une notification s\'il baisse.';

  @override
  String get cardFaresWatchStopped => 'Suivi de ce prix arrêté.';

  @override
  String get cardFaresWatchFull =>
      'Vous suivez déjà 10 prix. Arrêtez-en d\'abord un dans Réglages → Cartes.';

  @override
  String get cardFaresWatchFailed =>
      'Impossible de modifier le suivi de prix. Réessayez.';

  @override
  String get cardFaresFlagSeparate => 'Billets séparés';

  @override
  String get cardFaresFlagOvernight => 'Escale de nuit';

  @override
  String get cardFaresFlagAirport => 'Changement d\'aéroport';

  @override
  String get cardFaresFlagShort => 'Escale courte';

  @override
  String get cardFaresFlagLong => 'Escale longue';

  @override
  String get cardFaresNoteSeparate =>
      'Compagnies différentes sur un même trajet, il peut donc s\'agir de billets séparés. Si vous manquez la correspondance, le vol suivant pourrait ne pas être couvert. Vérifiez sur le site de réservation.';

  @override
  String get cardFaresNoteOvernight => 'Une escale se fait de nuit.';

  @override
  String get cardFaresNoteAirport =>
      'Une correspondance repart d\'un autre aéroport.';

  @override
  String get cardFaresNoteShort => 'Une escale dure moins d\'une heure.';

  @override
  String get cardFaresNoteLong => 'Une escale dure plus de 8 heures.';

  @override
  String get cardFaresOutbound => 'Aller';

  @override
  String get cardFaresReturn => 'Retour';

  @override
  String cardFaresEmissions(int kg) {
    return 'Environ $kg kg de CO₂ par voyageur';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return '$time d\'escale à $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'le vol suivant part de $place';
  }

  @override
  String get cardFaresViewFailed => 'Impossible de charger ces tarifs.';

  @override
  String get cardFaresTryAgain => 'Réessayer';

  @override
  String get cardFaresMorning => 'Matin';

  @override
  String get cardFaresAfternoon => 'Après-midi';

  @override
  String get cardFaresEvening => 'Soir';

  @override
  String get cardFaresNight => 'Nuit';

  @override
  String get cardFaresTime => 'Horaire';

  @override
  String get cardFaresAirlines => 'Compagnies';

  @override
  String get cardFaresBagIncluded => 'Bagage inclus';

  @override
  String get cardFaresNoMatch => 'Aucun vol ne correspond à ces filtres.';

  @override
  String get cardFaresOpenInChat => 'Ouvrir dans la discussion';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Afficher les vols $route le $date';
  }

  @override
  String get cardFaresEdit => 'Modifier la recherche';

  @override
  String get cardFaresDetails => 'Détails';

  @override
  String get cardFaresSinceStart => 'depuis le début de votre suivi';

  @override
  String get cardFareCalOneWay => 'Aller simple';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Retour après $n nuits',
      one: 'Retour après $n nuit',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Bas';

  @override
  String get cardFareCalUsual => 'Habituel';

  @override
  String get cardFareCalHigh => 'Élevé';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Moins cher : $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Voir les tarifs';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day : $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day : aucun prix';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'Au départ de $from · partout';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'Au départ de $from · étranger';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'Au départ de $from · même pays';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'moins de $price';
  }

  @override
  String get cardFlightSearchTitle => 'Rechercher des vols';

  @override
  String get cardFlightSearchReturn => 'Aller-retour';

  @override
  String get cardFlightSearchOneWay => 'Aller simple';

  @override
  String get cardFlightSearchFrom => 'De';

  @override
  String get cardFlightSearchTo => 'Vers';

  @override
  String get cardFlightSearchPlaceHint => 'Ville ou aéroport';

  @override
  String get cardFlightSearchAnywhere => 'Partout';

  @override
  String get cardFlightSearchSwap => 'Inverser les lieux';

  @override
  String get cardFlightSearchPickDates => 'Choisir des dates';

  @override
  String get cardFlightSearchPickDate => 'Choisir une date';

  @override
  String get cardFlightSearchWholeMonth => 'Mois entier';

  @override
  String get cardFlightSearchNights => 'Nuits sur place';

  @override
  String get cardFlightSearchAdults => 'Adultes';

  @override
  String get cardFlightSearchChildren => 'Enfants (2 à 11 ans)';

  @override
  String get cardFlightSearchInfants => 'Bébés (moins de 2 ans)';

  @override
  String get cardFlightSearchNotNow => 'Pas maintenant';

  @override
  String get cardFlightSearchSent => 'Recherche…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Vols $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Le moins cher en ce moment';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Les $n derniers jours',
      one: 'Le dernier jour',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'de $low à $high';
  }

  @override
  String get cardFareTrendNote =>
      'Voici l\'évolution passée des prix, pas une prévision. Ils peuvent changer à tout moment.';

  @override
  String get cardFareWatchesTitle => 'Suivis de prix';

  @override
  String get cardFareWatchesNone =>
      'Vous ne suivez aucun tarif. Touchez Suivre le prix sur une carte de tarifs pour commencer.';

  @override
  String get cardFareWatchesNoPrice => 'Aucun prix pour le moment';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Objectif $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Toute baisse importante';

  @override
  String cardFareWatchesLow(String price) {
    return 'le plus bas $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'fin le $date';
  }

  @override
  String get cardsFareWatches => 'Suivis de prix';

  @override
  String get cardsFareWatchesNone =>
      'Aucun suivi de prix. Touchez Suivre le prix sur une carte de tarifs aériens pour être prévenu en cas de baisse.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Actuellement $price · fin le $date';
  }

  @override
  String get cardFromBot => 'Rédigé par le bot ; peut contenir des erreurs';

  @override
  String get cardFullRecipe => 'Recette complète';

  @override
  String get cardGate => 'Porte';

  @override
  String get cardGo => 'Lancer';

  @override
  String get cardHeads => 'Face';

  @override
  String get cardHolidays => 'Jours fériés';

  @override
  String get cardHoursShort => 'heures';

  @override
  String get cardHumidity => 'Humidité';

  @override
  String get cardItsTime => 'C\'est l\'heure !';

  @override
  String get cardJustNow => 'à l\'instant';

  @override
  String get cardLast24h => 'Dernières 24 h';

  @override
  String get cardLast30Days => '30 derniers jours';

  @override
  String get cardListen => 'Écouter';

  @override
  String get cardLiveNow => 'En ce moment';

  @override
  String get cardLongWeekend => 'Week-end prolongé';

  @override
  String get cardLostShort => 'D';

  @override
  String get cardMarket24h => '24 h/24';

  @override
  String get cardMarketCap => 'Cap. boursière';

  @override
  String get cardMarketClosed => 'Fermé';

  @override
  String get cardMarketOpen => 'Ouvert';

  @override
  String get cardMarketPost => 'Hors séance';

  @override
  String get cardMarketPre => 'Pré-séance';

  @override
  String get cardMessage => 'Message';

  @override
  String get cardMinutesShort => 'min';

  @override
  String get cardMoonFirstQuarter => 'Premier quartier';

  @override
  String get cardMoonFull => 'Pleine lune';

  @override
  String get cardMoonLastQuarter => 'Dernier quartier';

  @override
  String get cardMoonNew => 'Nouvelle lune';

  @override
  String get cardMoonWaningCrescent => 'Lune décroissante';

  @override
  String get cardMoonWaningGibbous => 'Lune gibbeuse décroissante';

  @override
  String get cardMoonWaxingCrescent => 'Lune croissante';

  @override
  String get cardMoonWaxingGibbous => 'Lune gibbeuse croissante';

  @override
  String get cardMore => 'Plus';

  @override
  String get cardNext24h => 'Prochaines 24 h';

  @override
  String get cardNoAlerts => 'Aucune alerte';

  @override
  String get cardNoAlertsLong =>
      'Aucune alerte météo en vigueur ici pour le moment.';

  @override
  String get cardNoChart => 'Aucun graphique pour cette plage';

  @override
  String get cardNoGames => 'Aucun match';

  @override
  String get cardNoHolidays => 'Plus aucun jour férié cette année.';

  @override
  String get cardNoQuakes => 'Aucun séisme de cette ampleur récemment.';

  @override
  String get cardNoStorms => 'Aucune active';

  @override
  String get cardNoStormsLong =>
      'Aucune tempête tropicale active pour le moment.';

  @override
  String get cardNotAdvice => 'Ne constitue pas un conseil financier';

  @override
  String get cardNow => 'Maintenant';

  @override
  String get cardNutritionFacts => 'Valeurs nutritionnelles';

  @override
  String get cardOpen => 'Ouvrir';

  @override
  String get cardOpenSource => 'Ouvrir la source';

  @override
  String get cardParcel => 'Colis';

  @override
  String get cardParcelDelivered => 'Livré';

  @override
  String get cardParcelInTransit => 'En chemin';

  @override
  String get cardParcelOrdered => 'Étiquette créée';

  @override
  String get cardParcelOut => 'En cours de livraison';

  @override
  String get cardParcelProblem => 'Problème';

  @override
  String get cardParcelNoLive =>
      'Aucun suivi en direct pour ce numéro ici. La page du transporteur a les infos les plus récentes.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Suivre sur $site';
  }

  @override
  String get cardPin => 'Épingler aux widgets';

  @override
  String get cardPinFailed => 'Impossible d\'épingler cette carte';

  @override
  String get cardPinned => 'Épinglée à vos widgets';

  @override
  String get cardPinnedWaiting =>
      'Épinglée. Autorisez ce bot sur vos widgets pour l\'y voir';

  @override
  String get cardPlayedShort => 'J';

  @override
  String get cardPointsShort => 'Pts';

  @override
  String get cardPrevClose => 'Clôture préc.';

  @override
  String get cardPros => 'Avantages';

  @override
  String get cardProsCons => 'Avantages et inconvénients';

  @override
  String get cardQuiz => 'Quiz';

  @override
  String get cardRain => 'Pluie';

  @override
  String get cardRainChance => 'Risque de pluie';

  @override
  String get cardRandom => 'Aléatoire';

  @override
  String get cardReadMore => 'Lire la suite';

  @override
  String get cardReferenceRates =>
      'Taux de référence de banque centrale, publiés chaque jour';

  @override
  String get cardRefresh => 'Actualiser';

  @override
  String get cardReport => 'Signaler des données erronées';

  @override
  String get cardReported => 'Merci, nous allons vérifier';

  @override
  String get cardSameTime => 'même heure';

  @override
  String get cardScores => 'Scores';

  @override
  String get cardSecondsShort => 's';

  @override
  String get cardServings => 'Portions';

  @override
  String get cardShareImage => 'Partager en image';

  @override
  String get cardStandings => 'Classement';

  @override
  String get cardStorms => 'Tempêtes tropicales';

  @override
  String get cardSunMoon => 'Soleil et lune';

  @override
  String get cardSunrise => 'Lever';

  @override
  String get cardSunset => 'Coucher';

  @override
  String get cardSwap => 'Inverser';

  @override
  String get cardSynonyms => 'Similaire :';

  @override
  String get cardTails => 'Pile';

  @override
  String get cardTeam => 'Équipe';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Heure dans chaque lieu';

  @override
  String get cardTimeline => 'Chronologie';

  @override
  String get cardToday => 'Aujourd\'hui';

  @override
  String get cardTomorrow => 'Demain';

  @override
  String get cardTranslation => 'Traduction';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Retirer des widgets';

  @override
  String get cardUnpinned => 'Retirée de vos widgets';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'extrême';

  @override
  String get cardUvHigh => 'élevé';

  @override
  String get cardUvLow => 'faible';

  @override
  String get cardUvModerate => 'modéré';

  @override
  String get cardUvVeryHigh => 'très élevé';

  @override
  String get cardVolume => 'Volume';

  @override
  String get cardWatchlist => 'Liste de suivi';

  @override
  String get cardWeather => 'Météo';

  @override
  String get cardWeatherAlerts => 'Alertes météo';

  @override
  String get cardWebsite => 'Site web';

  @override
  String get cardWind => 'Vent';

  @override
  String get cardWonShort => 'V';

  @override
  String get cardWorldClock => 'Horloge mondiale';

  @override
  String get cardYesterday => 'Hier';

  @override
  String get cardQuakesWorld => 'Plus forts séismes aujourd\'hui';

  @override
  String cardMinutesAgo(int n) {
    return 'il y a $n min';
  }

  @override
  String cardHoursAgo(int n) {
    return 'il y a $n h';
  }

  @override
  String cardStale(String ago) {
    return 'Actualisation impossible · de $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Mis à jour $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Retard de $minutes min';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'Max $high  Min $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Ressenti $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n jours';
  }

  @override
  String cardUntil(String when) {
    return 'Jusqu\'à $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n alertes en vigueur',
      one: '$n alerte en vigueur',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Principalement $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Pollen d\'aulne',
      'birch': 'Pollen de bouleau',
      'grass': 'Pollen de graminées',
      'mugwort': 'Pollen d\'armoise',
      'olive': 'Pollen d\'olivier',
      'ragweed': 'Pollen d\'ambroisie',
      'other': 'Pollen',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h h $m min';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Heure dorée à partir de $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct % éclairée';
  }

  @override
  String cardMoonrise(String time) {
    return 'Lever $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Coucher $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Variation sur $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up en hausse · $down en baisse';
  }

  @override
  String cardRatesOf(String date) {
    return 'Taux du $date';
  }

  @override
  String cardAtTime(String when) {
    return 'À $when';
  }

  @override
  String cardInDays(int n) {
    return 'dans $n jours';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct % accompli';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Séismes près de $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n séismes',
      one: '$n séisme',
      zero: 'Aucun',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '$depth de profondeur';
  }

  @override
  String cardAway(String distance) {
    return 'à $distance';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n actives',
      one: '$n active',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return 'Alerte $level';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n matchs',
      one: '$n match',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n en direct';
  }

  @override
  String cardMinutes(int n) {
    return '$n min';
  }

  @override
  String cardExpected(String date) {
    return 'Prévu le $date';
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
      other: '$n étapes',
      one: '$n étape',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Victoires $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Portion : $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed contrôles sur $total réussis';
  }

  @override
  String cardTotal(int n) {
    return 'Total : $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Après $n ans';
  }

  @override
  String get cardsSettingsTitle => 'Cartes';

  @override
  String get cardsSettingsRow =>
      'Ville de résidence, unités et sources de données';

  @override
  String get cardsSettingsIntro =>
      'Les bots répondent sur la météo, les prix, les taux, l\'heure et plus avec des cartes de données réelles toujours fraîches. Votre ville de résidence est utilisée lorsque vous posez une question sans nommer de lieu.';

  @override
  String get cardsSettingsSaveFailed => 'Impossible d\'enregistrer. Réessayez.';

  @override
  String get cardsHomeCity => 'Ville de résidence';

  @override
  String get cardsHomeClear => 'Effacer';

  @override
  String get cardsHomeNone =>
      'Non définie. Les bots utilisent la ville principale de votre fuseau horaire tant que vous n\'en choisissez pas une.';

  @override
  String get cardsHomeSearch => 'Rechercher votre ville';

  @override
  String get cardsHomePrivacy =>
      'Seule une ville est conservée, jamais votre adresse ; elle est envoyée aux services météo sous forme de coordonnées arrondies.';

  @override
  String get cardsUnits => 'Unités';

  @override
  String get cardsTemperature => 'Température';

  @override
  String get cardsWind => 'Vent';

  @override
  String get cardsRain => 'Pluie';

  @override
  String get cardsDistance => 'Distance';

  @override
  String get cardsPrices => 'Prix';

  @override
  String get cardsRedUp => 'Rouge pour la hausse';

  @override
  String get cardsRedUpHint =>
      'Afficher les prix en hausse en rouge et ceux en baisse en vert, comme sur les marchés en Chine, au Japon et en Corée.';

  @override
  String get cardsSources => 'Sources de données';

  @override
  String get cardsSourcesIntro =>
      'Les cartes indiquent d\'où viennent leurs données et de quand elles datent. Ces services les fournissent :';

  @override
  String get cardFewerServings => 'Moins de portions';

  @override
  String get cardMoreServings => 'Plus de portions';

  @override
  String get cropTitle => 'Déplacer et redimensionner';

  @override
  String get cropDone => 'Terminé';

  @override
  String get cropPosition => 'Position de l\'image';

  @override
  String get cropMoveUp => 'Monter';

  @override
  String get cropMoveDown => 'Descendre';

  @override
  String get cropMoveLeft => 'Déplacer à gauche';

  @override
  String get cropMoveRight => 'Déplacer à droite';

  @override
  String get cropRotate => 'Pivoter';

  @override
  String get cropMirror => 'Miroir';

  @override
  String get cropReset => 'Réinitialiser';

  @override
  String get cropZoom => 'Zoomer';

  @override
  String get cropZoomIn => 'Zoom avant';

  @override
  String get cropZoomOut => 'Zoom arrière';

  @override
  String get cropSoft => 'Zoom très rapproché : l\'image peut paraître floue';

  @override
  String get cropAnimatedStill => 'Les images animées restent fixes';

  @override
  String get cropBackground => 'Arrière-plan';

  @override
  String get cropBackgroundNone => 'Aucun';

  @override
  String cropBackgroundBot(String name) {
    return 'Couleur de $name';
  }

  @override
  String get cropBackgroundWhite => 'Blanc';

  @override
  String get cropBackgroundBlack => 'Noir';

  @override
  String get cropUnreadable =>
      'Impossible d\'ouvrir cette image ici. Essayez un JPEG ou un PNG.';

  @override
  String cropTooBig(String size) {
    return 'Ce fichier pèse $size, au-delà de la limite de 40 Mo.';
  }

  @override
  String get botPicture => 'Image';

  @override
  String botPictureTitle(String name) {
    return 'Image de $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Modifier l\'image de $name';
  }

  @override
  String get botPicturePaste => 'Coller l\'image';

  @override
  String get botPictureDraw => 'En créer une avec l\'IA';

  @override
  String get botPictureDrawHelp => 'Casama en dessine deux au choix';

  @override
  String get botPictureRecrop => 'Recadrer';

  @override
  String get botPictureMascot => 'Utiliser une mascotte';

  @override
  String get botPictureRemove => 'Supprimer l\'image';

  @override
  String get botPictureRecent => 'Récentes';

  @override
  String get botPictureUpdated => 'Image mise à jour';

  @override
  String get botPictureRemoved => 'Image supprimée';

  @override
  String get botPictureFailed => 'Impossible d\'enregistrer l\'image';

  @override
  String botPictureDrop(String name) {
    return 'Déposer comme image de $name';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Utiliser comme image de $name';
  }

  @override
  String get botPictureUseAsBot => 'Utiliser comme image d\'un bot';

  @override
  String get botPictureWhichBot => 'Quel bot reçoit cette image ?';

  @override
  String botDrawTitle(String name) {
    return 'Une image pour $name';
  }

  @override
  String get botDrawIntro =>
      'Choisissez un style, ajoutez quelques mots si vous voulez, et Casama dessine deux images au choix.';

  @override
  String get botDrawDescribe => 'Décrivez-la (facultatif)';

  @override
  String get botDrawHint => 'Un hibou amical avec des lunettes de lecture';

  @override
  String get botDrawMake => 'En créer 2';

  @override
  String get botDrawMore => 'En créer 2 autres';

  @override
  String get botDrawPick => 'Touchez-en une pour l\'utiliser';

  @override
  String get botDrawCost =>
      'Chaque image utilise des crédits d\'image, comme toute image créée par Casama.';

  @override
  String get botDrawWorking => 'Dessin en cours…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '3D douce';

  @override
  String get botDrawStyleWatercolor => 'Aquarelle';

  @override
  String get botDrawStyleFlat => 'Icône plate';

  @override
  String get botDrawStylePixel => 'Pixel art';

  @override
  String get botDrawStyleLine => 'Dessin au trait';

  @override
  String get botDrawStylePhoto => 'Photo';

  @override
  String get sharePictureStays =>
      'Son image reste dans cet espace de travail : la copie reprend sa mascotte précédente ou ses initiales.';

  @override
  String savedResetRefills(String amount) {
    return 'Recharge $amount de crédits';
  }

  @override
  String get savedResetClearsDaily => 'Efface la limite d\'aujourd\'hui';

  @override
  String get savedResetGivesHours => 'Restaure des heures d\'ordinateur';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours restants',
      one: '$count jour restant',
      zero: 'Expire aujourd\'hui',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Modèles';

  @override
  String get modelsRowHelp => 'Modèles de Casama ou vos propres clés';

  @override
  String get modelsIntro =>
      'Choisissez si Casama exécute vos bots ou connectez vos propres clés de modèle. Les clés sont stockées chiffrées et ne sont plus jamais affichées.';

  @override
  String get whoRunsYourBots => 'Qui exécute vos bots';

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
      'Inclus avec votre forfait ; utilise les crédits de l\'espace de travail';

  @override
  String get whoRunsCasamaOffHelp => 'En pause sur votre forfait actuel';

  @override
  String get whoRunsOwn => 'Votre propre fournisseur';

  @override
  String get whoRunsOwnHelp =>
      'Facturé directement par votre fournisseur ; n\'utilise aucun crédit Casama';

  @override
  String get whoRunsCasamaShort =>
      'Modèles de Casama, inclus avec votre forfait';

  @override
  String get whoRunsCasamaCost => 'Utilise des crédits';

  @override
  String get whoRunsOwnShort => 'Vos clés, facturées par votre fournisseur';

  @override
  String get whoRunsOwnCost => 'Aucun crédit Casama';

  @override
  String get whoRunsOwnNeedsKey =>
      'Pour utiliser votre propre fournisseur, ajoutez d\'abord une clé de discussion de celui-ci sous Ajouter une clé ci-dessous.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Choisissez un modèle pour cette clé ci-dessous pour basculer.';

  @override
  String get whoRunsAdminOnly =>
      'Seuls les administrateurs de l\'espace de travail peuvent changer qui exécute vos bots.';

  @override
  String get botModelSource => 'Source du modèle';

  @override
  String get botModelSourceWorkspace => 'Par défaut de l\'espace de travail';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'L\'une de vos clés';

  @override
  String get useCasamaFallback =>
      'Si mon fournisseur échoue, utiliser les modèles de Casama';

  @override
  String get useCasamaFallbackHelp =>
      'Lorsque votre clé atteint une limite ou un quota, basculer sur les modèles de Casama en utilisant les crédits de votre espace de travail.';

  @override
  String get keyCoversOpenRouter =>
      'Discussion, images, vidéo, lecture à voix haute, messages vocaux et dictée';

  @override
  String get keyCoversGoogle => 'Discussion et appels en direct';

  @override
  String get keyCoversOpenAi => 'Discussion et recherche en mémoire';

  @override
  String get keyCoversChat => 'Discussion';

  @override
  String get ownProviderPrivacyNote =>
      'Avec votre propre fournisseur, ses conditions s\'appliquent à ce que vos bots lui envoient. Le réglage de non-entraînement de Casama s\'applique uniquement avec la clé de Casama.';

  @override
  String get creditsOwnProviderNote =>
      'Les modèles sur votre propre fournisseur n\'utilisent pas de crédits.';

  @override
  String get routineWaitingForModel => 'En attente d\'un modèle';

  @override
  String get ownProviderRequiredTitle =>
      'Connectez un modèle pour continuer à discuter';

  @override
  String get ownProviderRequiredBody =>
      'Les modèles de Casama ne sont pas disponibles sur ce forfait pour le moment. Ajoutez votre propre clé de modèle ou passez à un forfait supérieur.';

  @override
  String get modelNoToolsWarning =>
      'Ce modèle ne prend pas en charge les outils, le bot ne peut donc répondre qu\'en texte.';

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
  String get appBrowserTitle => 'Navigateur sur ce téléphone';

  @override
  String get appBrowserTitleMac => 'Navigateur sur ce Mac';

  @override
  String get appBrowserTitleLinux => 'Navigateur sur cet ordinateur';

  @override
  String get appBrowserTitleWindows => 'Navigateur sur ce PC';

  @override
  String get appBrowserHelp =>
      'Un petit navigateur dans Casama que les bots autorisés peuvent utiliser pendant que vous regardez, uniquement tant que leur discussion est ouverte sur ce téléphone. Vos sessions restent sur ce téléphone.';

  @override
  String get appBrowserHelpMac =>
      'Un petit navigateur dans Casama que les bots autorisés peuvent utiliser pendant que vous regardez, tant que Casama est ouvert sur ce Mac. Vos sessions restent sur ce Mac.';

  @override
  String get appBrowserHelpLinux =>
      'Un petit navigateur dans Casama que les bots autorisés peuvent utiliser pendant que vous regardez, tant que Casama est ouvert sur cet ordinateur. Vos sessions restent sur cet ordinateur.';

  @override
  String get appBrowserHelpWindows =>
      'Un petit navigateur dans Casama que les bots autorisés peuvent utiliser pendant que vous regardez, tant que Casama est ouvert sur ce PC. Vos sessions restent sur ce PC.';

  @override
  String get appBrowserSwitchHelp =>
      'Les bots que vous autorisez peuvent ouvrir des pages ici tant que leur discussion est ouverte sur ce téléphone.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Les bots que vous autorisez peuvent ouvrir des pages ici tant que Casama est ouvert sur ce Mac.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Les bots que vous autorisez peuvent ouvrir des pages ici tant que Casama est ouvert sur cet ordinateur.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Les bots que vous autorisez peuvent ouvrir des pages ici tant que Casama est ouvert sur ce PC.';

  @override
  String get appBrowserOn => 'Activé';

  @override
  String get appBrowserOff => 'Désactivé';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Désactivé : $reason';
  }

  @override
  String get appBrowserReasonOff => 'pas encore disponible.';

  @override
  String get appBrowserReasonNotTester =>
      'uniquement pour les testeurs pour le moment.';

  @override
  String get appBrowserReasonSystemOff =>
      'pas encore disponible sur cet appareil.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'un administrateur l\'a désactivé pour cet espace de travail.';

  @override
  String get appBrowserReasonUnavailable =>
      'ce serveur n\'a pas de connexions d\'appareil.';

  @override
  String get appBrowserReasonUnsupported =>
      'le navigateur de cet appareil ne peut pas l\'exécuter.';

  @override
  String get appBrowserReasonNeedsMacos14 => 'nécessite macOS 14 ou ultérieur.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Installez WebKitGTK pour utiliser le navigateur ici : $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Installez ou mettez à jour Microsoft Edge WebView2 pour utiliser le navigateur ici.';

  @override
  String get appBrowserGetWebview2 => 'Obtenir WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Associé sur une installation précédente. Réactivez-le pour associer cet appareil.';

  @override
  String get appBrowserAllBots => 'Tous vos bots';

  @override
  String get appBrowserAllBotsHelp =>
      'Chaque bot avec lequel vous pouvez discuter peut utiliser ce navigateur. Désactivez pour choisir certains bots.';

  @override
  String get appBrowserModeHeader => 'Quand un bot a besoin d\'un navigateur';

  @override
  String get appBrowserModeAsk => 'Demander si utile';

  @override
  String get appBrowserModeAskHelp =>
      'Proposer un choix lorsqu\'un site nécessite votre connexion ou bloque l\'ordinateur du bot.';

  @override
  String get appBrowserModeComputer => 'Toujours l\'ordinateur du bot';

  @override
  String get appBrowserModeComputerHelp =>
      'Ne jamais proposer le navigateur de cet appareil sauf si vous le demandez dans la discussion.';

  @override
  String get appBrowserModeDevice => 'Préférer cet appareil';

  @override
  String get appBrowserModeDeviceHelp =>
      'Utiliser le navigateur de cet appareil pour les connexions et les sites bloqués sans demander.';

  @override
  String get appBrowserNeverAsk => 'Ordinateur du bot (ne pas demander)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Ordinateur Linux';

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
      'En attente. Gardez cette discussion ouverte pour continuer dans votre navigateur.';

  @override
  String browserWaitingSite(String site) {
    return 'En attente. Gardez cette discussion ouverte pour continuer avec $site dans votre navigateur.';
  }

  @override
  String get browserWaitEnded => 'Fin de l\'attente de votre navigateur.';

  @override
  String get browserHandBackWaiting =>
      'À votre tour dans le navigateur. Effectuez l\'étape sur la page, puis touchez Rendre le contrôle.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'À votre tour sur $site. Effectuez l\'étape sur la page, puis touchez Rendre le contrôle.';
  }

  @override
  String get browserHandBackEnded =>
      'L\'attente du retour du navigateur est terminée.';

  @override
  String get browserChoiceCardLabel => 'Choix du navigateur';

  @override
  String browserChoiceTitle(String bot, String site) {
    return 'Où $bot doit-il ouvrir $site ?';
  }

  @override
  String get browserChoiceSubtitleSignIn =>
      'Ce site nécessite votre connexion.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Ce site a bloqué l\'ordinateur de $bot.';
  }

  @override
  String get browserChoiceOnPhone => 'Sur ce téléphone';

  @override
  String get browserChoiceOnMac => 'Sur ce Mac';

  @override
  String get browserChoiceOnLinux => 'Sur cet ordinateur';

  @override
  String get browserChoiceOnWindows => 'Sur ce PC';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Vous regardez et vous pouvez vous connecter vous-même. Ce qu\'il lit est envoyé à l\'IA.';

  @override
  String get browserChoiceInChrome => 'Dans votre Chrome';

  @override
  String get browserChoiceInChromeHelp => 'Déjà connecté à vos sites.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'Sur l\'ordinateur de $bot';
  }

  @override
  String get browserChoiceOnComputerHelp => 'Continue même si vous partez.';

  @override
  String browserChoiceRemember(String site) {
    return 'Mémoriser pour $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return '$site ouvert sur ce téléphone';
  }

  @override
  String browserChoicePickedMac(String site) {
    return '$site ouvert sur ce Mac';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return '$site ouvert sur cet ordinateur';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return '$site ouvert sur ce PC';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '$site ouvert dans votre Chrome';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$site ouvert sur l\'ordinateur de $bot';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Aucune réponse à temps ; resté sur l\'ordinateur de $bot';
  }

  @override
  String get appBrowserConsentTitle =>
      'Laisser les bots utiliser le navigateur dans Casama ?';

  @override
  String get appBrowserConsentPages =>
      'Les pages qu\'un bot lit ici sont envoyées à Casama et au modèle d\'IA du bot, comme les pages qu\'il lit sur son propre ordinateur.';

  @override
  String get appBrowserConsentSignIns =>
      'Vos sessions restent sur cet appareil. Les bots ne voient jamais vos mots de passe, numéros de carte ou codes ; vous les saisissez vous-même.';

  @override
  String get appBrowserConsentWatch =>
      'Cela fonctionne uniquement tant que la discussion du bot est ouverte ici. Vous pouvez observer, prendre le contrôle ou l\'arrêter à tout moment.';

  @override
  String get appBrowserConsentYours =>
      'Ce que vous consultez vous-même n\'est envoyé nulle part.';

  @override
  String get appBrowserBots => 'Bots autorisés à l\'utiliser';

  @override
  String get appBrowserBotsHelp =>
      'Seuls les bots activés ici peuvent utiliser le navigateur sur cet appareil.';

  @override
  String get appBrowserNoBots => 'Aucun bot pour le moment.';

  @override
  String get appBrowserSites => 'Sites';

  @override
  String get appBrowserSitesHelp =>
      'Sites auxquels vous avez répondu Toujours ou Jamais. Retirez-en un pour qu\'on vous redemande la prochaine fois.';

  @override
  String get appBrowserNoSites =>
      'Aucun site pour le moment. Un bot demande la première fois qu\'il ouvre un site.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Retirer $site';
  }

  @override
  String get appBrowserKinds => 'Sites qui restent désactivés';

  @override
  String get appBrowserKindsHelp =>
      'Ces catégories de sites restent désactivées sauf si vous les activez. Même activées, un bot demande à chaque fois.';

  @override
  String get appBrowserKindBanking => 'Banque et paiements';

  @override
  String get appBrowserKindHealth => 'Santé';

  @override
  String get appBrowserKindPasswords => 'Gestionnaires de mots de passe';

  @override
  String get appBrowserKindGovernment => 'Identité et administration';

  @override
  String get appBrowserSignIn => 'Se connecter à un site';

  @override
  String get appBrowserSignInHelp =>
      'Ouvrez un site, connectez-vous vous-même, puis laissez vos bots l\'utiliser. Rien de ce que vous y faites n\'est envoyé où que ce soit.';

  @override
  String get appBrowserClearData => 'Effacer les données de navigation';

  @override
  String get appBrowserClearDataHelp =>
      'Déconnecte ce navigateur de tous les sites et efface ce que les sites ont enregistré.';

  @override
  String get appBrowserClearDataConfirm =>
      'Effacer les sessions et les données de sites de ce navigateur ?';

  @override
  String get appBrowserClearDataDone => 'Données de navigation effacées';

  @override
  String get appBrowserUnpair => 'Dissocier cet appareil';

  @override
  String get appBrowserUnpairConfirm =>
      'Dissocier le navigateur de cet appareil ? Les bots ne pourront plus l\'utiliser tant que vous ne le réactiverez pas.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot travaille';
  }

  @override
  String get appBrowserTakeOver => 'Prendre le contrôle';

  @override
  String get appBrowserHandBack => 'Rendre le contrôle';

  @override
  String get appBrowserYourTurn => 'À votre tour';

  @override
  String appBrowserPaused(String bot) {
    return '$bot est en pause pendant que vous utilisez la page';
  }

  @override
  String get appBrowserAway => 'En pause : la discussion n\'est pas ouverte';

  @override
  String get appBrowserAddress => 'Adresse du site';

  @override
  String get appBrowserBack => 'Précédent';

  @override
  String get appBrowserForward => 'Suivant';

  @override
  String get appBrowserReload => 'Actualiser';

  @override
  String get appBrowserAllowSite => 'Laisser mes bots utiliser ce site';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site ajouté. Vos bots peuvent l\'utiliser ici.';
  }

  @override
  String get appBrowserAddressRefused =>
      'Impossible d\'ouvrir cette adresse ici.';

  @override
  String get appBrowserSecure => 'Connexion sécurisée';

  @override
  String get appBrowserNotSecure => 'Non sécurisé';

  @override
  String get appBrowserCardLabel => 'Navigateur intégré';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot veut ouvrir $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'Dans Casama sur cet appareil, avec vos sessions. « Toujours » l\'autorise à ouvrir ce site dorénavant.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Sur ce Mac, avec vos sessions. « Toujours » l\'autorise à ouvrir ce site dorénavant.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Sur cet ordinateur, avec vos sessions. « Toujours » l\'autorise à ouvrir ce site dorénavant.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Sur ce PC, avec vos sessions. « Toujours » l\'autorise à ouvrir ce site dorénavant.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Les sites bancaires et de paiement demandent à chaque fois.',
      'health': 'Les sites de santé demandent à chaque fois.',
      'passwords': 'Les sites de gestionnaires de mots de passe demandent à chaque fois.',
      'government': 'Les sites d\'identité officielle demandent à chaque fois.',
      'other': 'Ces sites demandent à chaque fois.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Une fois';

  @override
  String get appBrowserAlways => 'Toujours';

  @override
  String get appBrowserNever => 'Jamais';

  @override
  String appBrowserStepAskTitle(String bot) {
    return 'Autoriser $bot à faire ceci ?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'Dans Casama sur cet appareil, avec vos sessions.';

  @override
  String get appBrowserStepAskHelpMac => 'Sur ce Mac, avec vos sessions.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'Sur cet ordinateur, avec vos sessions.';

  @override
  String get appBrowserStepAskHelpWindows => 'Sur ce PC, avec vos sessions.';

  @override
  String appBrowserStepClick(String name) {
    return 'Toucher « $name »';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Saisir dans « $name »';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Appuyer sur une touche dans « $name »';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Importer un fichier dans « $name »';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step : « $name »';
  }

  @override
  String get appBrowserDontAllow => 'Ne pas autoriser';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Téléphone Android';

  @override
  String get toolOnThisPhone => 'sur cet appareil';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bots dans les navigateurs intégrés des membres';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Les membres peuvent laisser les bots utiliser un navigateur dans Casama sur leur téléphone ou ordinateur, pendant qu\'ils regardent.';

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
  String get vendorRenewalUsd => 'Coût d\'un renouvellement (USD)';

  @override
  String get vendorRenewalMonths => 'Mois couverts par un renouvellement';

  @override
  String get vendorSeeSpend => 'Voir les dépenses';

  @override
  String get costSpent => 'Dépensé';

  @override
  String get costCharged => 'Facturé';

  @override
  String get costMargin => 'Marge';

  @override
  String get costMarginNone => 'Rien n\'a été facturé';

  @override
  String get costNotRecorded => 'Non enregistré';

  @override
  String get costNotRecordedHint =>
      'Explique ce que cela signifie et quels services sont concernés';

  @override
  String get costNotRecordedHelp =>
      'Certains services indiquent leur propre total. Quand le leur est supérieur à ce que ce serveur a enregistré, la différence apparaît ici. Il s\'agit de dépenses réelles qui ne sont encore liées à aucune fonctionnalité, clé ou espace de travail.';

  @override
  String get costNotRecordedWhy => 'Ce que les services indiquent en plus';

  @override
  String get costNotRecordedNone =>
      'Correspond à ce qu\'indiquent les services';

  @override
  String get costNotRecordedAllMatch =>
      'Chaque service qui indique un total correspond à ce que ce serveur a enregistré.';

  @override
  String get costNotRecordedNoList =>
      'La liste des services n\'est pas disponible pour le moment. Réessayez dans un instant.';

  @override
  String get costNoVendorFigures => 'Aucun service n\'a indiqué de total';

  @override
  String get costNoVendorFiguresHelp =>
      'Aucun service n\'a indiqué son propre total pour cette période, il n\'y a donc rien à comparer.';

  @override
  String costNoFigureFrom(String names) {
    return 'Aucun total de : $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count services',
      one: '$count service',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Ils indiquent $theirs · nous avons enregistré $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Ils indiquent $theirs · nous avons enregistré $ours · $gap non enregistrés';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Ils indiquent $theirs · nous avons enregistré $ours · rien ne manque';
  }

  @override
  String get costNoVendorFigure =>
      'Ce service n\'a pas communiqué son propre total pour cette période.';

  @override
  String get costNoVendorFigureKind =>
      'Ce service ne communique pas son propre total.';

  @override
  String costUpdated(String when) {
    return 'Mis à jour $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'par rapport aux $days jours précédents',
      one: 'par rapport au jour précédent',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'aucune période précédente à comparer';

  @override
  String get costChangeNew => 'Nouveau';

  @override
  String get costChangeNewSpoken => 'nouveau sur cette période';

  @override
  String get costChangeFlat => 'aucun changement';

  @override
  String costChangeUp(String amount) {
    return 'en hausse de $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'en baisse de $amount';
  }

  @override
  String costPoints(String count) {
    return '$count pts';
  }

  @override
  String get costOther => 'Autre';

  @override
  String get costNotLabelled => 'Non étiqueté';

  @override
  String get costNotLabelledHelp =>
      'Ces coûts ont été enregistrés sans étiquette pour ce regroupement et ne peuvent donc pas être ventilés davantage. Ils font tout de même partie du total.';

  @override
  String get costGroupService => 'Service';

  @override
  String get costGroupKey => 'Clé';

  @override
  String get costGroupApp => 'Apps et MCP';

  @override
  String get costGroupFeature => 'Fonctionnalité';

  @override
  String get costGroupModel => 'Modèle';

  @override
  String get costGroupWorkspace => 'Espace de travail';

  @override
  String get costGroupBy => 'Regrouper par';

  @override
  String get costFilters => 'Filtres';

  @override
  String get costNoFilters =>
      'Aucun. Ouvrez une ligne et choisissez Afficher dans le tableau pour affiner la vue.';

  @override
  String costFilterChip(String group, String value) {
    return '$group : $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Retirer le filtre $name';
  }

  @override
  String get costIncludeFixed => 'Inclure les factures fixes';

  @override
  String get costIncludeFixedHelp =>
      'Ajoute les abonnements et renouvellements à Dépensé, répartis uniformément sur les jours qu\'ils couvrent.';

  @override
  String get costOptions => 'Période et filtres';

  @override
  String get costPeriod => 'Période';

  @override
  String costPeriodDays(int days) {
    return '$days jours';
  }

  @override
  String get costPeriodCustom => 'Personnalisée';

  @override
  String costLastDays(int days) {
    return '$days derniers jours';
  }

  @override
  String get costChangeDates => 'Modifier les dates';

  @override
  String get costDone => 'Terminé';

  @override
  String get costDaysUtc => 'Les jours sont en UTC.';

  @override
  String get costDailySpend => 'Dépenses quotidiennes';

  @override
  String costStackedBy(String group) {
    return 'Empilées par $group : les plus importantes, puis Autre.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Graphique des dépenses quotidiennes, $days jours, $total au total. Le jour le plus élevé était $peakDay avec $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Graphique des dépenses quotidiennes, $days jours, rien dépensé.';
  }

  @override
  String get costSourceMetered => 'À l\'usage';

  @override
  String get costSourceCounted => 'Compté';

  @override
  String get costSourceFixed => 'Fixe';

  @override
  String get costSourceEstimated => 'Estimé';

  @override
  String get costSourceMeteredHelp =>
      'Un coût réel enregistré pour chaque appel.';

  @override
  String get costSourceCountedHelp =>
      'Le comptage propre de ce serveur multiplié par un prix unitaire.';

  @override
  String get costSourceFixedHelp =>
      'Une facture répartie uniformément sur les jours qu\'elle couvre.';

  @override
  String get costSourceEstimatedHelp =>
      'Calculé à partir de la longueur du texte. Le coût réel est au moins égal à ceci.';

  @override
  String get costEstimated => 'estimé';

  @override
  String get costColShare => 'Part';

  @override
  String get costColChange => 'Variation';

  @override
  String get costColCalls => 'Appels';

  @override
  String get costColSource => 'Source';

  @override
  String get costColFailed => 'Échecs';

  @override
  String get costColFees => 'Frais fournisseur';

  @override
  String get costColTokens => 'Coût des jetons';

  @override
  String get costTokenCost => 'Coût des jetons';

  @override
  String get costFailureRate => 'Taux d\'échec';

  @override
  String costSortBy(String column) {
    return 'Trier par $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, trié par ordre croissant';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, trié par ordre décroissant';
  }

  @override
  String get costOpenRowHint => 'Ouvre les détails';

  @override
  String costSpokenSpent(String amount) {
    return '$amount dépensés';
  }

  @override
  String costSpokenFees(String amount) {
    return 'frais fournisseur $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share du total';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count appels';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate d\'échec';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'coût estimé des jetons $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return '$amount facturés';
  }

  @override
  String costCallsCount(String count) {
    return '$count appels';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate d\'échec';
  }

  @override
  String costTokensEstimated(String amount) {
    return 'Jetons : $amount (estimation)';
  }

  @override
  String get costOpenBilling => 'Ouvrir la page de facturation';

  @override
  String get costByDay => 'Par jour';

  @override
  String get costSplitBy => 'Répartir par';

  @override
  String get costShowInTable => 'Afficher dans le tableau';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Limite le tableau à $name et le regroupe par $group.';
  }

  @override
  String get costNothingRecorded => 'Rien d\'enregistré ici sur cette période.';

  @override
  String costLastUsed(String when) {
    return 'dernière utilisation $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Et $count de plus. Les afficher dans le tableau.',
      one: 'Et $count de plus. L\'afficher dans le tableau.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Usage prévu';

  @override
  String get costKeyService => 'Service';

  @override
  String get costKeySetting => 'Réglage';

  @override
  String get costKeySetIn => 'Emplacement';

  @override
  String get costKeyVault => 'Élément du coffre';

  @override
  String get costKeyStatus => 'État';

  @override
  String get costKeyConfigured => 'Définie';

  @override
  String get costKeyNotConfigured => 'Non définie';

  @override
  String get costKeyLastUsed => 'Dernière utilisation';

  @override
  String get costKeyNotUsed => 'Pas sur cette période';

  @override
  String get costKeyCap => 'Plafond de dépenses';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '$left restants sur $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share du plafond utilisés';
  }

  @override
  String get costKeyNoCap => 'Aucun';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Rien n\'a été dépensé ces $days jours',
      one: 'Rien n\'a été dépensé ce jour-là',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Rien n\'a été dépensé sur ces jours';

  @override
  String get costEmptyFiltered =>
      'Rien de dépensé qui corresponde à ces filtres';

  @override
  String get costEmptyGroup => 'Rien à afficher pour ce regroupement';

  @override
  String get costAppsNote =>
      'Apps et serveurs MCP : Dépensé correspond à ce que le fournisseur a facturé. Le coût des jetons est une estimation de ce que leurs résultats coûtent en jetons de modèle et fait déjà partie des dépenses de modèles.';

  @override
  String costFixedLeftOut(String amount) {
    return 'Les factures fixes de cette période ($amount) ne sont pas comptées. Activez Inclure les factures fixes pour les ajouter.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Les espaces de travail ont payé $amount sur leurs propres clés. Ce n\'est pas l\'argent de ce serveur, c\'est donc exclu.';
  }

  @override
  String get costOlderServerTitle => 'Ce serveur a besoin d\'une mise à jour';

  @override
  String get costOlderServer =>
      'Les coûts par service, clé et app arrivent avec une version plus récente du serveur. Mettez à jour le serveur, puis revérifiez.';

  @override
  String get costCheckAgain => 'Vérifier à nouveau';

  @override
  String get costSpendCardTitle => 'Dépenses, 30 derniers jours';

  @override
  String get costSpendCardOpen => 'Coûts';

  @override
  String get costSpendCardHint => 'Ouvre l\'onglet Coûts';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Dépenses des 30 derniers jours : $spent dépensés, $charged facturés, $margin de marge';
  }

  @override
  String get costSort => 'Trier par';

  @override
  String get costSortName => 'Nom';

  @override
  String get costByWorkspace => 'Par espace de travail';

  @override
  String get costTopTools => 'Outils les plus utilisés';

  @override
  String get costToolList => 'Liste d\'outils envoyée au modèle';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Et $count autres outils.',
      one: 'Et $count autre outil.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Utiliser le bot Telegram de Casama';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Parlez à $bot dans Telegram. Un toucher, rien à configurer.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Votre compte Telegram est connecté dans un autre espace de travail. Le connecter ici le déplace.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram : $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Vos messages y vont vers $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Vos messages y vont vers $other. Touchez pour les envoyer à $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Les messages Telegram vont désormais vers $bot.';
  }

  @override
  String get telegramFinish => 'Terminer dans Telegram';

  @override
  String get telegramFinishHelp =>
      'Appuyez sur Démarrer dans Telegram. Ne faites ceci que sur votre propre compte Telegram. Ceci se met à jour une fois connecté.';

  @override
  String get telegramOpenAgain => 'Rouvrir Telegram';

  @override
  String get telegramConnected => 'Telegram est connecté';

  @override
  String telegramConnectedHelp(String name) {
    return 'Compte connecté : $name. Écrivez au bot dans Telegram à tout moment ; la discussion apparaît aussi ici dans Général.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Écrivez au bot dans Telegram à tout moment ; la discussion apparaît aussi ici dans Général.';

  @override
  String get telegramConnect => 'Connecter Telegram';

  @override
  String get telegramDisconnect => 'Déconnecter Telegram';

  @override
  String get telegramDisconnectConfirm => 'Déconnecter Telegram ?';

  @override
  String get telegramDisconnectHelp =>
      'Vos bots cessent de répondre dans Telegram. Votre historique de discussions reste ici.';

  @override
  String get telegramPickBot => 'Les messages Telegram vont vers';

  @override
  String get telegramNeedsBot =>
      'Créez d\'abord un bot, puis connectez Telegram.';

  @override
  String get telegramNotOffered =>
      'Ce serveur n\'a pas son propre bot Telegram. Vous pouvez connecter votre propre bot depuis Apps de messagerie d\'un bot.';

  @override
  String get chatAppsSettingsHelp =>
      'Parlez à vos bots depuis les apps de messagerie que vous utilisez déjà. Les messages arrivent dans votre discussion Général pour que vous puissiez continuer ici.';

  @override
  String get chatAppsPerBot =>
      'L\'e-mail et vos propres bots se configurent par bot : ouvrez un bot, puis Apps de messagerie.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack et plus';

  @override
  String get chatAppsSlackHelp =>
      'Slack s\'ajoute par espace de travail Slack, pour un bot. Choisissez le bot, puis Ajouter à Slack.';

  @override
  String get chatAppsSlackPickBot => 'Ajouter Slack pour';

  @override
  String get slackAnyoneInWorkspace =>
      'Toute personne de cet espace de travail Slack';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Tout le monde dans l\'espace de travail peut parler au bot, pas seulement les personnes listées. Les approbations nécessitent toujours quelqu\'un de la liste.';

  @override
  String get discordUseCasama => 'Utiliser le bot Discord de Casama';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Parlez à $bot dans Discord. Connectez-vous avec Discord une fois, puis envoyez un message au bot ou utilisez /ask n\'importe où.';
  }

  @override
  String get discordOtherWorkspace =>
      'Votre compte Discord est connecté dans un autre espace de travail. Le connecter ici le déplace.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord : $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Les messages Discord vont désormais vers $bot.';
  }

  @override
  String get discordFinish => 'Terminer dans Discord';

  @override
  String get discordFinishHelp =>
      'Connectez-vous avec Discord dans votre navigateur et autorisez Casama. Ne faites ceci qu\'avec votre propre compte Discord. Ceci se met à jour une fois connecté.';

  @override
  String get discordOpenAgain => 'Rouvrir la connexion Discord';

  @override
  String get discordConnected => 'Discord est connecté';

  @override
  String discordConnectedHelp(String name) {
    return 'Compte connecté : $name. Écrivez au bot Casama dans Discord ou utilisez /ask n\'importe où ; la discussion apparaît aussi ici dans Général.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Écrivez au bot Casama dans Discord ou utilisez /ask n\'importe où ; la discussion apparaît aussi ici dans Général.';

  @override
  String get discordConnect => 'Connecter Discord';

  @override
  String get discordDisconnect => 'Déconnecter Discord';

  @override
  String get discordDisconnectConfirm => 'Déconnecter Discord ?';

  @override
  String get discordDisconnectHelp =>
      'Vos bots cessent de répondre dans Discord. Votre historique de discussions reste ici.';

  @override
  String get discordPickBot => 'Les messages Discord vont vers';

  @override
  String get discordNeedsBot =>
      'Créez d\'abord un bot, puis connectez Discord.';

  @override
  String get discordNotOffered =>
      'Ce serveur n\'a pas sa propre app Discord. Vous pouvez connecter votre propre app Discord depuis Apps de messagerie d\'un bot.';

  @override
  String get inactiveAccountsNote =>
      'Si vous cessez d\'utiliser Casama : après 30 jours, vos routines et suivis se mettent en pause jusqu\'à votre retour. Après 6 mois, les fichiers enregistrés de vos ordinateurs sont supprimés, et après 12 mois (24 si vous avez déjà payé), votre compte est supprimé. Nous vous envoyons un e-mail avant toute suppression. Les comptes avec un forfait payant ne sont jamais concernés.';

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
  String get inactivityModeOff => 'Désactivé';

  @override
  String get inactivityModeReport => 'Rapport';

  @override
  String get inactivityModeOn => 'Activé';

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
    return 'actif $when';
  }

  @override
  String get inactivityStateResting => 'Au repos';

  @override
  String get inactivityStateFilesSoon => 'Fichiers bientôt supprimés';

  @override
  String get inactivityStateRemovalSoon => 'Suppression imminente';

  @override
  String get inactivityStateRemoving => 'En cours de suppression';

  @override
  String get inactivityKept => 'Conservé';

  @override
  String get keepAccount => 'Conserver ce compte';

  @override
  String get keepAccountHelp =>
      'Jamais mis au repos ni supprimé pour inactivité';

  @override
  String get computerFilesRemoved => 'Fichiers enregistrés supprimés';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Cet ordinateur n\'a pas été utilisé pendant 6 mois, ses fichiers enregistrés ont donc été supprimés le $date. Il repart de zéro.';
  }

  @override
  String get downloadSavedFiles => 'Télécharger les fichiers enregistrés';

  @override
  String get downloadSavedFilesHelp =>
      'Un fichier .tar.gz de son dossier personnel, sans le réveiller';

  @override
  String get liveActivity => 'Activité en direct';

  @override
  String get liveRowHelp =>
      'Liste d\'attente, inscriptions et téléchargements en direct';

  @override
  String get liveRefresh => 'Actualiser';

  @override
  String get liveTabActivity => 'Activité';

  @override
  String get liveTabAlerts => 'Alertes';

  @override
  String get liveGroupAll => 'Tout';

  @override
  String get liveGroupWaitlist => 'Liste d\'attente';

  @override
  String get liveGroupAccounts => 'Comptes';

  @override
  String get liveGroupMoney => 'Finances';

  @override
  String get liveGroupWebsite => 'Site web';

  @override
  String get liveGroupGrowth => 'Croissance';

  @override
  String get liveGroupSupport => 'Assistance';

  @override
  String get liveKindWaitlistJoined => 'A rejoint la liste d\'attente';

  @override
  String get liveKindWaitlistAdmitted => 'Admis depuis la liste d\'attente';

  @override
  String get liveKindSignup => 'Nouveau compte';

  @override
  String get liveKindSignupRefused => 'Inscription refusée';

  @override
  String get liveKindFirstChat => 'Première discussion';

  @override
  String get liveKindMilestone =>
      'Autres premières (bot, ordinateur, appel, routine)';

  @override
  String get liveKindSubscription => 'Nouvel abonnement';

  @override
  String get liveKindSubscriptionEnded => 'Abonnement terminé';

  @override
  String get liveKindPurchase => 'Crédits achetés';

  @override
  String get liveKindSupportTicket => 'Ticket d\'assistance';

  @override
  String get liveKindFeedback => 'Commentaire';

  @override
  String get liveKindAccountDeleted => 'Compte supprimé';

  @override
  String get liveKindDownloadClick => 'Clic de téléchargement';

  @override
  String get liveKindQrOpen => 'Code QR de téléchargement ouvert';

  @override
  String get liveKindStartClick => 'Clic sur Démarrer gratuitement';

  @override
  String get liveKindInviteOpen => 'Lien d\'invitation ouvert';

  @override
  String get liveNow => 'à l\'instant';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes min';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours h';
  }

  @override
  String get liveTestSent => 'Alerte de test envoyée à vos appareils';

  @override
  String get liveTodayWaitlist => 'Inscrits aujourd\'hui';

  @override
  String get liveTodaySignups => 'Comptes aujourd\'hui';

  @override
  String get liveTodayDownloads => 'Téléchargements aujourd\'hui';

  @override
  String get liveTodayMoney => 'Revenus aujourd\'hui';

  @override
  String get liveRetry => 'Réessayer';

  @override
  String get liveEmpty =>
      'Rien pour le moment. Les nouvelles activités apparaissent ici en quelques secondes.';

  @override
  String get liveOlder => 'Afficher les plus anciens';

  @override
  String get liveAlertsHelp =>
      'Choisissez ce qui envoie une notification vers vos téléphones, Mac et navigateurs. Quand beaucoup d\'événements arrivent à la fois, vous recevez un seul résumé plutôt qu\'une notification pour chacun.';

  @override
  String get livePauseAll => 'Mettre toutes les alertes en pause';

  @override
  String get livePauseAllHelp => 'L\'activité continue d\'apparaître ici';

  @override
  String get liveSendTest => 'Envoyer une alerte de test';

  @override
  String get liveSendTestHelp =>
      'Vérifier que les alertes atteignent cet appareil';

  @override
  String get liveAlertsFooter =>
      'Les alertes attendent pendant vos heures calmes (Réglages → Notifications) et arrivent ensuite en un seul résumé. Dans un navigateur, autorisez les notifications pour ce site afin de les recevoir.';

  @override
  String get liveStatusOn =>
      'En direct : mise à jour toutes les quelques secondes';

  @override
  String get liveStatusPaused => 'En direct. Les alertes sont en pause';

  @override
  String get liveGroupApp => 'App';

  @override
  String get liveKindAppFirstOpen => 'App ouverte pour la première fois';

  @override
  String get liveKindAppReinstall => 'App réinstallée';

  @override
  String get liveKindSigninStarted => 'Connexion commencée';

  @override
  String get liveKindTrialStarted => 'Essai démarré';

  @override
  String get liveKindRenewal => 'Abonnement renouvelé';

  @override
  String get liveKindRefund => 'Remboursement';

  @override
  String get liveKindDisputeOpened => 'Litige ouvert';

  @override
  String get liveKindPlanCancelFailed => 'Forfait non résilié';

  @override
  String get liveKindStoreReview => 'Avis sur la boutique';

  @override
  String get liveKindStoreCrashes => 'Rapports de plantage de la boutique';

  @override
  String get liveKindDay2Return => 'De retour au jour 2';

  @override
  String get liveKindWeek1Return => 'De retour en semaine 1';

  @override
  String get liveKindDeviceGone => 'App probablement supprimée';

  @override
  String get liveKindPartnerInterest => 'Créateur intéressé par Partenaires';

  @override
  String get liveKindCreatorOpen => 'Lien créateur ouvert';

  @override
  String get liveKindPartnerClaimed => 'Code créateur utilisé';

  @override
  String get liveKindGiftOpen => 'Lien cadeau ouvert';

  @override
  String get liveKindCompRedeemed => 'Forfait cadeau utilisé';

  @override
  String get liveKindReferralRewarded => 'Invitation validée';

  @override
  String get liveKindNewsletterConfirmed => 'Inscription à la newsletter';

  @override
  String get liveKindTestimonialSubmitted => 'Témoignage à examiner';

  @override
  String get liveDailyDigest => 'Résumé du matin';

  @override
  String get liveDailyDigestHelp =>
      'Entonnoir et téléchargements d\'hier, à 9 h dans votre fuseau horaire';

  @override
  String get liveFunnelClicks => 'Clics';

  @override
  String get liveFunnelOpens => 'Premières ouvertures';

  @override
  String get liveFunnelSignups => 'Comptes';

  @override
  String get liveFunnelChats => 'Premières discussions';

  @override
  String get liveFunnelPaying => 'Payants';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent %';
  }

  @override
  String get liveByPerson => 'Par personne';

  @override
  String get liveSearch => 'Rechercher e-mail, pays, source';

  @override
  String get liveNoMatches => 'Rien ne correspond à cette recherche';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étapes',
      one: '$count étape',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'probable';

  @override
  String get liveStepClick => 'A cliqué sur télécharger';

  @override
  String get liveStepOpen => 'A ouvert l\'app';

  @override
  String get liveStepSignup => 'A créé un compte';

  @override
  String get liveStepChat => 'Première discussion';

  @override
  String get liveStepPaying => 'Payant';

  @override
  String get liveJourneyTitle => 'Ce qui s\'est passé';

  @override
  String get liveJourneyVisitor => 'Visiteur';

  @override
  String get liveJourneyWho => 'Qui';

  @override
  String get liveJourneyFrom => 'Provenance';

  @override
  String get liveJourneyDevice => 'Appareil';

  @override
  String get liveJourneyTimeline => 'Chronologie';

  @override
  String get liveJourneyNow => 'Maintenant';

  @override
  String get liveJourneySource => 'Source';

  @override
  String get liveJourneyCampaign => 'Campagne';

  @override
  String get liveJourneyLanding => 'Première page';

  @override
  String get liveJourneyClickedFrom => 'A cliqué sur';

  @override
  String get liveJourneyPlatform => 'Plateforme';

  @override
  String get liveJourneyStore => 'Depuis';

  @override
  String get liveJourneyVersion => 'Version';

  @override
  String get liveJourneyCountry => 'Pays';

  @override
  String get liveJourneyLikelyHelp =>
      'Associé à un clic sur le site web par appareil, pays et heure, pas par un lien. Considérez-le comme une bonne estimation.';

  @override
  String get liveJourneyPlan => 'Forfait';

  @override
  String get liveJourneyMessages => 'Messages envoyés';

  @override
  String get liveJourneyBots => 'Bots';

  @override
  String get liveJourneyDevices => 'Connecté sur';

  @override
  String get liveJourneyLastActive => 'Dernière activité';

  @override
  String get liveJourneyJoined => 'Compte créé';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap plus tard';
  }

  @override
  String get liveJourneyNone =>
      'On n\'en sait pas plus à ce sujet pour le moment.';

  @override
  String get liveJourneyCopyEmail => 'Copier l\'e-mail';

  @override
  String get liveJourneyCopied => 'E-mail copié';

  @override
  String get liveJourneyOpenAdmin => 'Ouvrir dans l\'admin';

  @override
  String get liveJourneyGone =>
      'Celui-ci a plus de 30 jours, ses détails ont donc été effacés.';

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
  String get planChangeTitle => 'Confirmer le changement de forfait';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Passer à $plan';
  }

  @override
  String get planChangeChargedNow => 'Facturé maintenant';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Inclut $tax de taxes';
  }

  @override
  String get planChangeCredit => 'Crédit pour le temps non utilisé';

  @override
  String planChangeThen(String amount, String period) {
    return 'Puis $amount / $period (hors taxes)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Prochaine facturation le $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Confirmer et payer';

  @override
  String get planChangeHaveCode => 'Vous avez un code ?';

  @override
  String get planChangeCodeLabel => 'Code de réduction';

  @override
  String get planChangeCodeHint => 'Saisir le code';

  @override
  String get planChangeApply => 'Appliquer';

  @override
  String get planChangeRemove => 'Retirer';

  @override
  String get planChangeDiscountApplied => 'Réduction appliquée';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '−$percent % à chaque renouvellement';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '−$percent % pour $count renouvellements',
      one: '−$percent % pour $count renouvellement',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '−$amount à chaque renouvellement';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '−$amount pour $count renouvellements',
      one: '−$amount pour $count renouvellement',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '−$percent % à chaque renouvellement ; prend fin si vous changez à nouveau de forfait';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '−$amount à chaque renouvellement ; prend fin si vous changez à nouveau de forfait';
  }

  @override
  String get planChangeInvalidCode =>
      'Ce code ne peut pas être utilisé sur ce forfait.';

  @override
  String get planChangeCodeCostsMore =>
      'Ce code remplacerait votre réduction actuelle et coûterait plus cher.';

  @override
  String get planChangeCodeEndsLasting =>
      'Ce code mettrait fin à votre réduction durable actuelle.';

  @override
  String get planChangeCodeNotBetter =>
      'Vous avez déjà une réduction égale ou supérieure.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Remplace votre réduction actuelle de $percent %';
  }

  @override
  String get planChangeReplacesDiscount => 'Remplace votre réduction actuelle';

  @override
  String get planChangePriceMoved =>
      'Le total a changé depuis l\'ouverture. Vérifiez le montant mis à jour et confirmez à nouveau.';

  @override
  String get planChangePeriodWeek => 'semaine';

  @override
  String get planChangePeriodMonth => 'mois';

  @override
  String get planChangePeriodYear => 'an';

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
  String get partnerSection => 'Partenaires Casama';

  @override
  String get partnerProgramTitle =>
      'Vous créez des vidéos, publications ou une newsletter ?';

  @override
  String get partnerProgramSubtitle =>
      'Gagnez 30 % de ce que paient les personnes que vous envoyez, pendant un an';

  @override
  String get partnerYourCode => 'Votre code créateur';

  @override
  String get partnerPaused => 'En pause';

  @override
  String get partnerPortal => 'Revenus et versements';

  @override
  String partnerShareText(String link, String code) {
    return 'Essayez Casama, des collègues IA qui travaillent pour vous. Utilisez mon code $code lors de l\'inscription : $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name vous a recommandé Casama.';
  }

  @override
  String get partnerClaimed => 'Code créateur ajouté. Bienvenue sur Casama !';

  @override
  String partnerClaimedFrom(String name) {
    return 'Merci de soutenir $name. Bienvenue sur Casama !';
  }

  @override
  String get partnerErrNotFound =>
      'Ce code créateur n\'existe pas. Vérifiez-le et réessayez.';

  @override
  String get partnerErrOwnCode =>
      'C\'est votre propre code. Partagez-le plutôt avec votre audience.';

  @override
  String get partnerErrWindowClosed =>
      'Les codes créateur ne peuvent être saisis que dans les premiers jours après l\'inscription.';

  @override
  String get partnerErrAlreadyPaying =>
      'Les codes créateur sont réservés aux nouveaux comptes, avant le premier paiement.';

  @override
  String get partnerErrAlready => 'Vous avez déjà saisi un code créateur.';

  @override
  String get partnerErrReferred =>
      'Vous avez rejoint avec l\'invitation d\'un ami, un code créateur ne peut donc pas être ajouté.';

  @override
  String get partnerErrOff =>
      'Les codes créateur ne sont pas disponibles sur ce serveur.';

  @override
  String get referralHaveCodeAny => 'Vous avez un code ?';

  @override
  String get referralCodeHintAny => 'Code d\'un ami ou d\'un créateur';

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
  String get testimonialStateLive => 'En ligne';

  @override
  String get testimonialStateDraft => 'Brouillon';

  @override
  String get testimonialStateHidden => 'Masqué';

  @override
  String get testimonialStateWithdrawn => 'Retiré';

  @override
  String get testimonialPlaceSiteHome => 'Accueil casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'Tarifs casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'Forfaits de l\'app';

  @override
  String get testimonialPlaceAppSignin => 'Connexion à l\'app';

  @override
  String get testimonialSourceEmail => 'E-mail';

  @override
  String get testimonialSourceInApp => 'Dans l\'app';

  @override
  String get testimonialSourceOther => 'Autre';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étoiles',
      one: '$count étoile',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Ce que l\'on dit de Casama';

  @override
  String get testimonialAskTitle => 'Casama vous plaît ?';

  @override
  String get testimonialAskSubtitle => 'Dites-le-nous en une phrase.';

  @override
  String get testimonialAskHint => 'Qu\'aimez-vous à propos de Casama ?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama peut me citer sur casama.ai et dans l\'app, en me présentant comme $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama peut me citer sur casama.ai et dans l\'app, en tant qu\'utilisateur de Casama';

  @override
  String get testimonialAskSend => 'Envoyer';

  @override
  String get testimonialAskNotNow => 'Pas maintenant';

  @override
  String get testimonialAskThanks => 'Merci ! Nous lisons chaque message.';

  @override
  String get communityTitle => 'Communauté';

  @override
  String get communitySentence =>
      'Casama est open source. S\'il vous est utile, une étoile sur GitHub aide d\'autres personnes à le découvrir.';

  @override
  String get communityStarOnGitHub => 'Mettre une étoile sur GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Discutez avec l\'équipe et d\'autres personnes qui utilisent Casama';

  @override
  String get starAskTitle => 'Casama sur GitHub';

  @override
  String get starAskNotNow => 'Pas maintenant';

  @override
  String get cloudSignInTitle => 'Se connecter avec votre compte Casama';

  @override
  String get cloudSignInBody =>
      'La licence personnelle gratuite provient de votre compte Casama. Seule la licence est envoyée à ce serveur ; vos discussions y restent.';

  @override
  String get cloudSignInEmail => 'E-mail';

  @override
  String get cloudSignInSendCode => 'Envoyer le code';

  @override
  String get cloudSignInCode => 'Code reçu par e-mail';

  @override
  String get cloudSignInVerify => 'Se connecter';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Nous avons envoyé un code à $email. Saisissez-le ici.';
  }

  @override
  String get licenseSetupTitle => 'Obtenir votre licence personnelle gratuite';

  @override
  String get licenseSetupBody =>
      'Ce serveur a besoin d\'une licence avant que les bots puissent travailler. L\'usage personnel est gratuit pour une personne : connectez-vous avec votre compte Casama et la licence se renouvelle en ligne tous les 30 jours.';

  @override
  String get licensePersonalButton =>
      'Obtenir une licence personnelle gratuite';

  @override
  String get licensePersonalNote =>
      'Personnel : une personne, pour un usage personnel, sur votre propre ordinateur ou serveur.';

  @override
  String get licenseBusinessTitle => 'Ou saisir une clé Business';

  @override
  String get licenseBusinessHint => 'Collez votre clé de licence';

  @override
  String get licenseBusinessSave => 'Utiliser cette clé';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Vous utilisez Casama au travail ou en équipe ? L\'édition Business est à $monthlyPrice par utilisateur actif et par mois ($yearlyMonthlyPrice avec facturation annuelle). Écrivez à $email.';
  }

  @override
  String get licenseActivated => 'Licence active. Vos bots peuvent travailler.';

  @override
  String get licenseOtherServer => 'Utiliser un autre serveur';

  @override
  String get licenseRenew => 'Renouveler';

  @override
  String get licenseRenewTitle => 'Renouveler la licence de ce serveur';

  @override
  String licenseGraceBanner(String date) {
    return 'La licence de ce serveur est expirée. Les bots continuent de fonctionner jusqu\'au $date ; renouvelez-la avant cette date.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'La licence de ce serveur est expirée. Renouvelez-la bientôt pour que les bots continuent de fonctionner.';

  @override
  String get licenseExpiredBanner =>
      'La licence de ce serveur a expiré, les nouvelles exécutions de bots sont donc en pause. Vos données sont en sécurité : vous pouvez toujours vous connecter, lire et exporter. Renouvelez pour relancer les bots.';

  @override
  String get licenseErrorRequired =>
      'Ce serveur a d\'abord besoin d\'une licence. Obtenez la licence personnelle gratuite ou saisissez une clé Business.';

  @override
  String licenseErrorSeats(String email) {
    return 'Tous les sièges de la licence de ce serveur sont pris. Pour plus de personnes, une licence Business est nécessaire : écrivez à $email.';
  }

  @override
  String get licenseErrorExpired =>
      'La licence de ce serveur a expiré, les nouvelles exécutions de bots sont donc en pause. Vos données sont en sécurité. Renouvelez la licence pour relancer les bots.';

  @override
  String get licenseEditionPersonal => 'Personnel';

  @override
  String get licenseEditionTrial => 'Essai';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Export d\'audit';

  @override
  String get licenseFeatureAuditForwarding => 'Transfert d\'audit';

  @override
  String get licenseFeatureRoles => 'Rôles avancés';

  @override
  String get setupLicenseTitle => 'Licence personnelle gratuite';

  @override
  String get setupLicenseBody =>
      'Connectez-vous avec votre compte Casama pour obtenir la licence personnelle gratuite pour ce serveur : une personne, usage personnel. Vous pouvez aussi le faire plus tard.';

  @override
  String get setupLicenseSignIn => 'Se connecter avec Casama';

  @override
  String get setupLicenseReady =>
      'La licence personnelle gratuite est fournie avec votre serveur.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Compte connecté : $email. La licence personnelle gratuite est fournie avec votre serveur.';
  }

  @override
  String get setupLicenseSkipped =>
      'Pas encore de licence. Votre serveur en demandera une au démarrage.';

  @override
  String setupLicenseFailed(String error) {
    return 'Impossible de créer la licence personnelle ($error). Votre serveur en demandera une au démarrage.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Le serveur Casama s\'exécute dans Docker Desktop, une app gratuite qui utilise WSL 2 pour l\'isoler du reste de votre PC.';

  @override
  String get setupDockerStep1Windows =>
      'Exécutez le programme d\'installation téléchargé et laissez « Use WSL 2 » activé.';

  @override
  String localUpdateAvailable(String version) {
    return 'Une mise à jour du serveur est prête : $version';
  }

  @override
  String get localUpdateButton => 'Mettre à jour';

  @override
  String get localUpdateLater => 'Plus tard';

  @override
  String localUpdateTitle(String version) {
    return 'Mettre à jour votre serveur vers $version';
  }

  @override
  String get localUpdateBody =>
      'La base de données est d\'abord sauvegardée. Si la nouvelle version ne démarre pas, votre serveur revient à sa version actuelle.';

  @override
  String localUpdateDone(String version) {
    return 'Mis à jour vers $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'La nouvelle version n\'a pas démarré, votre serveur est donc revenu à sa version précédente. Rien n\'a été perdu et une sauvegarde de la base de données a été enregistrée.';

  @override
  String localUpdateFailed(String detail) {
    return 'La mise à jour a échoué : $detail';
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
  String get shCloudScreenTitle => 'Modèles Casama Cloud';

  @override
  String get shCloudPitch =>
      'Les modèles de Casama, sans aucune clé à gérer. Payés par un forfait Casama Cloud.';

  @override
  String get shCloudTurnOn => 'Activer';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Activé · payé par $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, payé par $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Désactivé. Seul un administrateur de ce serveur peut l\'activer.';

  @override
  String get shCloudManage => 'Gérer';

  @override
  String get shCloudSignInBody =>
      'Connectez-vous avec votre compte Casama pour choisir qui paie pour les modèles Casama Cloud. Vos bots, discussions et mémoire restent sur ce serveur.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Compte Casama Cloud connecté : $email';
  }

  @override
  String get shCloudOtherAccount => 'Utiliser un autre compte';

  @override
  String get shCloudContinue => 'Continuer';

  @override
  String get shCloudPayerTitle => 'Qui paie ?';

  @override
  String get shCloudPayerBody =>
      'Les modèles Casama Cloud sont payés par un espace de travail Casama Cloud que vous possédez ou gérez. Son forfait, son utilisation incluse et sa limite quotidienne sont partagés avec tout le reste de ce qu\'il utilise.';

  @override
  String get shCloudPayerNone =>
      'Vous ne gérez pas encore d\'espace de travail Casama Cloud. Créez-en un pour payer ; il démarre vide.';

  @override
  String get shCloudCreateWorkspace => 'En créer un';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Espace de travail de $name';
  }

  @override
  String get shCloudNoPlan => 'Aucun forfait pour le moment';

  @override
  String shCloudCovered(String plan) {
    return 'Votre forfait $plan couvre ceci.';
  }

  @override
  String get shCloudPlanTitle => 'Choisir un forfait';

  @override
  String get shCloudPlanBody =>
      'Les modèles Casama Cloud sont inclus dans tout forfait Casama Cloud : même utilisation incluse, même limite quotidienne et mêmes recharges que sur Cloud. Aucun tarif distinct pour l\'auto-hébergement.';

  @override
  String get shCloudTryFirst => 'Essayer d\'abord';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Utilisation gratuite d\'essai : environ $amount de messages, une fois par compte Casama. Rien à acheter.';
  }

  @override
  String get shCloudTrialUsed =>
      'L\'utilisation gratuite d\'essai est épuisée sur ce compte Casama. Choisissez un forfait pour continuer.';

  @override
  String get shCloudIntervalWeek => 'Hebdomadaire';

  @override
  String get shCloudIntervalMonth => 'Mensuel';

  @override
  String get shCloudIntervalYear => 'Annuel';

  @override
  String get shCloudWaitingForPlan =>
      'Terminez le paiement dans votre navigateur. Cet écran continue tout seul lorsque le forfait arrive.';

  @override
  String get shCloudWaitingTimedOut =>
      'Le forfait n\'est pas encore arrivé. Un paiement peut prendre quelques minutes à s\'afficher.';

  @override
  String get shCloudCheckAgain => 'Vérifier à nouveau';

  @override
  String get shCloudGiftCode => 'Vous avez un code cadeau ?';

  @override
  String get shCloudGiftCodeLabel => 'Code cadeau';

  @override
  String get shCloudRedeem => 'Utiliser';

  @override
  String get shCloudNoWayToBuy =>
      'Les forfaits ne peuvent pas être achetés dans cette app. Achetez-en un sur casama.ai avec le même compte, puis vérifiez à nouveau ici.';

  @override
  String get shCloudPurchasePending =>
      'Votre achat est en attente d\'approbation. Ceci continuera dès qu\'il sera validé.';

  @override
  String get shCloudPurchaseFailed =>
      'L\'achat n\'a pas abouti. Rien n\'a été facturé.';

  @override
  String get shCloudConnecting => 'Connexion de ce serveur à Casama Cloud…';

  @override
  String get shCloudLoading => 'Chargement…';

  @override
  String get shCloudReviewTitle => 'Vérifier avant d\'activer';

  @override
  String get shCloudReviewPays => 'Qui paie';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan sur $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Utilisation gratuite d\'essai sur $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Quels bots basculent';

  @override
  String get shCloudReviewAll => 'Tous les bots';

  @override
  String get shCloudReviewNoKey => 'Uniquement les bots sans clé fonctionnelle';

  @override
  String get shCloudReviewPick => 'Choisir des bots';

  @override
  String get shCloudReviewNoBots =>
      'Ce serveur n\'a pas encore de bots. Les nouveaux bots peuvent utiliser Casama Cloud.';

  @override
  String get shCloudReviewDefault =>
      'Les nouveaux bots utilisent aussi Casama Cloud';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Modèle de Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Aucune clé fonctionnelle';

  @override
  String shCloudStepDown(String from) {
    return 'Les réponses peuvent être plus courtes ou moins attentives qu\'avec $from. Essayez d\'abord sur un bot.';
  }

  @override
  String get shCloudReviewJobs => 'Mémoire, images et voix';

  @override
  String get shCloudJobMemory => 'Recherche en mémoire';

  @override
  String get shCloudJobImages => 'Images';

  @override
  String get shCloudJobTts => 'Lecture à voix haute';

  @override
  String get shCloudJobStt => 'Dictée';

  @override
  String get shCloudJobOwnKey => 'Votre propre clé';

  @override
  String get shCloudJobMemoryOptIn =>
      'Utiliser aussi Casama Cloud pour la mémoire';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'La mémoire est réindexée en arrière-plan ; la recherche continue de fonctionner en attendant.';

  @override
  String get shCloudJobLiveNote =>
      'La voix en direct, les appels téléphoniques et la vidéo continuent d\'utiliser vos propres clés.';

  @override
  String get shCloudWhatGoes => 'Ce qui transite par Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'Les messages au modèle transitent par Casama Cloud et ne sont pas conservés. L\'utilisation (modèle, jetons, coût) apparaît sur votre facture Cloud. Bots, discussions, mémoire, fichiers et ordinateurs restent sur ce serveur.';

  @override
  String get shCloudWhatGoesLink => 'Ce qu\'envoie ce serveur';

  @override
  String get shCloudFallback =>
      'Si Casama Cloud est épuisé ou inaccessible, utiliser ma propre clé';

  @override
  String get shCloudFallbackHelp =>
      'Chaque réponse issue de votre propre clé l\'indique.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString personnes utilisent ce serveur et le forfait $plan couvre $seatsString places. Chaque personne supplémentaire est facturée au tarif par personne supplémentaire de Casama Cloud.';
  }

  @override
  String get shCloudApply => 'Activer Casama Cloud';

  @override
  String get shCloudPickOne =>
      'Choisissez au moins un bot, ou laissez les nouveaux bots l\'utiliser.';

  @override
  String get shCloudPolicyTitle => 'Qui peut l\'utiliser';

  @override
  String get shCloudPolicyEveryone => 'Tout le monde sur ce serveur';

  @override
  String get shCloudPolicyChosen => 'Uniquement les personnes choisies';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString personnes choisies',
      one: '$countString personne choisie',
      zero: 'Aucune personne choisie pour le moment',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Limite quotidienne par personne';

  @override
  String get shCloudNoLimit => 'Aucune limite';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount par jour';
  }

  @override
  String get shCloudPolicySaved => 'Enregistré';

  @override
  String get shCloudDoneTitle => 'Casama Cloud est activé';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots utilisent désormais Casama Cloud.',
      one: '$countString bot utilise désormais Casama Cloud.',
      zero: 'Les nouveaux bots utilisent Casama Cloud.',
    );
    return '$_temp0 L\'utilisation s\'affiche sur l\'écran Utilisation de ce serveur et sur votre facture Cloud.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Dire bonjour à $bot';
  }

  @override
  String get shCloudDone => 'Terminé';

  @override
  String get shCloudUsageTitle => 'Utilisation';

  @override
  String shCloudIncludedLeft(String amount) {
    return 'Il reste $amount d\'utilisation incluse ce mois-ci';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Aujourd\'hui : $spend sur $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Aujourd\'hui : $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount en crédits';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return 'Il reste $amount d\'utilisation gratuite d\'essai';
  }

  @override
  String get shCloudPriceNote =>
      'Au tarif appliqué par Casama Cloud. Les mêmes appels apparaissent sur votre facture Cloud sous le nom de ce serveur.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Vous aujourd\'hui : $spend sur $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud a utilisé 80 % de l\'utilisation incluse ce mois-ci.';

  @override
  String get shCloudWarnDaily =>
      'Casama Cloud a utilisé 80 % de la limite d\'aujourd\'hui.';

  @override
  String get shCloudTopUp => 'Recharger';

  @override
  String get shCloudUseOwnKey => 'Utiliser ma propre clé';

  @override
  String get shCloudStopOutOfCredits =>
      'Casama Cloud n\'a plus d\'utilisation disponible pour ce mois-ci.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'La limite Casama Cloud d\'aujourd\'hui est épuisée. Elle se réinitialise à $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'La limite Casama Cloud d\'aujourd\'hui est épuisée. Elle se réinitialise demain.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud nécessite un forfait sur $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'Le forfait Casama Cloud sur $workspace a pris fin.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'Le forfait sur $workspace ne couvre pas toutes les personnes qui utilisent Casama Cloud ici.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Vous avez atteint la limite quotidienne Casama Cloud sur ce serveur.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Votre administrateur n\'a pas activé Casama Cloud pour vous.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud a été déconnecté de ce serveur.';

  @override
  String get shCloudStopUnreachable =>
      'Casama Cloud est inaccessible pour le moment. Nouvelle tentative en cours.';

  @override
  String get shCloudSeePlans => 'Voir les forfaits';

  @override
  String get shCloudRenew => 'Renouveler';

  @override
  String get shCloudAskAdmin => 'Demander à un admin';

  @override
  String get shCloudAskAdminBody =>
      'Seul un administrateur de ce serveur peut modifier Casama Cloud. Demandez à l\'un d\'eux ; les bots et routines reprendront d\'eux-mêmes une fois le problème réglé.';

  @override
  String get shCloudReconnect => 'Reconnecter';

  @override
  String get shCloudFallbackActive =>
      'Votre propre clé répond en attendant, et chaque réponse l\'indique.';

  @override
  String get shCloudUseOwnKeyTitle =>
      'Utiliser votre propre clé en attendant ?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Tant que Casama Cloud ne peut pas répondre, les bots répondent avec votre propre clé et chaque réponse concernée l\'indique. Désactivez-le à tout moment sur cet écran.';

  @override
  String get shCloudAddKeyFirst =>
      'Ajoutez d\'abord votre propre clé sur l\'écran Modèles.';

  @override
  String get shCloudRoutinesWait =>
      'Les routines attendent et reprennent d\'elles-mêmes une fois le problème réglé.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'La mémoire rattrape son retard : $doneString sur $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'La recherche utilise les mots pour les souvenirs non encore réindexés.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Les messages au modèle passent désormais par Casama Cloud, payé par $workspace.';
  }

  @override
  String get shCloudGotIt => 'Compris';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Payé par $workspace';
  }

  @override
  String get shCloudPaidBy => 'Payé par';

  @override
  String get shCloudChangePayer => 'Modifier';

  @override
  String get shCloudChangeBots => 'Changer les bots';

  @override
  String get shCloudFallbackSection =>
      'Quand Casama Cloud ne peut pas répondre';

  @override
  String get shCloudTurnOff => 'Désactiver';

  @override
  String get shCloudOffTitle => 'Désactiver Casama Cloud ?';

  @override
  String get shCloudOffBody =>
      'Ces bots reviennent à leur clé précédente si elle fonctionne encore, sinon à la clé par défaut de l\'espace de travail. Rien d\'autre ne change et vous pouvez le réactiver à tout moment.';

  @override
  String get shCloudOffBotsNone =>
      'Aucun bot n\'utilise Casama Cloud pour le moment.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud est désactivé';

  @override
  String shCloudOffBackTo(String key) {
    return 'Retour à $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Nécessite une clé';

  @override
  String get shCloudAddKey => 'Ajouter une clé';

  @override
  String get shCloudSignInAgain =>
      'Votre session Casama Cloud s\'est terminée. Reconnectez-vous pour continuer.';

  @override
  String get cloudAccountSection => 'Compte Casama Cloud';

  @override
  String cloudAccountRow(String email) {
    return 'Compte connecté : $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Utilisé pour la licence de ce serveur et les modèles Casama Cloud';

  @override
  String get cloudAccountSignOut => 'Se déconnecter de Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'Cet appareil oublie votre connexion Casama Cloud. Ce serveur, sa licence et les modèles Casama Cloud continuent de fonctionner.';

  @override
  String get cloudAccountDelete => 'Supprimer le compte Casama Cloud';

  @override
  String get cloudAccountDeleteHelp =>
      'Supprime votre compte sur Casama Cloud. Ce serveur et ses données restent en place.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Saisissez $email pour supprimer votre compte Casama Cloud. Les espaces de travail Cloud dont vous êtes l\'unique propriétaire sont supprimés avec lui, et les modèles Casama Cloud s\'arrêtent sur les serveurs qu\'ils paient. Un forfait acheté sur le web est résilié automatiquement. Un forfait acheté dans l\'App Store ou sur Google Play ne l\'est pas : résiliez-le dans la boutique correspondante.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Votre compte Casama Cloud est supprimé. Ses données seront définitivement effacées le $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Déplacer vers Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Déplacer vers mon propre serveur';

  @override
  String get wsMoveSettingsHelp =>
      'Emportez les bots, discussions, mémoire et fichiers de cet espace de travail vers un autre serveur';

  @override
  String get wsMoveTitle => 'Déplacer cet espace de travail';

  @override
  String get wsMoveIntro =>
      'Tout suit : bots, discussions, mémoire, routines, fichiers et ordinateurs. Une fois là-bas, cette copie reste consultable mais cesse de fonctionner.';

  @override
  String get wsMoveCloudOption => 'Déplacer vers Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Connectez-vous avec votre compte Casama et choisissez où il va.';

  @override
  String get wsMoveServerOption => 'Déplacer vers mon propre serveur';

  @override
  String get wsMoveServerOptionHelp =>
      'Sur ce serveur, ouvrez Réglages › Importer un espace de travail ici et copiez son code de transfert.';

  @override
  String get wsMoveInstallServer => 'Installer le serveur Casama';

  @override
  String get wsMoveInstallServerHelp =>
      'Pas encore de serveur ? Exécutez-en d\'abord un sur cet ordinateur.';

  @override
  String get wsMoveReceiveOption => 'Importer un espace de travail ici';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Obtenez un code de transfert pour cet espace de travail, à utiliser sur le serveur où se trouve actuellement l\'autre espace de travail.';

  @override
  String get wsMoveOwnerOnly =>
      'Seul le propriétaire de l\'espace de travail peut le déplacer.';

  @override
  String get wsMoveCloudPickTitle => 'Où doit-il aller ?';

  @override
  String get wsMoveCloudNew => 'Un nouvel espace de travail';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Démarre vide sur Casama Cloud, nommé $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Les éléments déplacés s\'ajoutent à côté de ce qui existe déjà. Les noms en conflit reçoivent « (moved) ».';

  @override
  String get wsMoveServerTitle => 'Déplacer vers votre propre serveur';

  @override
  String get wsMoveServerAddress => 'Adresse du serveur';

  @override
  String get wsMoveServerCode => 'Code de transfert';

  @override
  String get wsMoveCheckButton => 'Vérifier';

  @override
  String get wsMoveReceiveTitle => 'Importer un espace de travail ici';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'Sur le serveur où se trouve actuellement l\'espace de travail, ouvrez Réglages › Déplacer vers mon propre serveur et saisissez cette adresse et ce code. Le code fonctionne une seule fois, jusqu\'à $time, et importe tout dans $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Adresse de ce serveur';

  @override
  String get wsMoveReceiveCode => 'Code de transfert';

  @override
  String get wsMoveCopy => 'Copier';

  @override
  String get wsMoveCopied => 'Copié';

  @override
  String get wsMoveCheckTitle => 'Prêt pour le déplacement';

  @override
  String wsMoveCheckTo(String name) {
    return 'Vers $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutes',
      one: '$minutesString minute',
    );
    return '$size à copier, environ $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutes',
      one: '$minutesString minute',
    );
    return 'Vers la fin, les bots se mettent en pause pendant environ $_temp0, puis reprennent là-bas.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'C\'est une longue pause. Choisissez un moment calme.';

  @override
  String get wsMoveCheckComes => 'Ce qui est transféré';

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
      one: '$nString bot',
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
      other: '$nString discussions',
      one: '$nString discussion',
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
      other: '$nString souvenirs',
      one: '$nString souvenir',
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
      one: '$nString routine',
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
      other: '$nString fichiers',
      one: '$nString fichier',
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
      other: '$nString ordinateurs',
      one: '$nString ordinateur',
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
      other: '$nString personnes',
      one: '$nString personne',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter =>
      'Ce qui nécessitera votre intervention ensuite';

  @override
  String wsMoveReconnect(String names) {
    return 'Reconnectez-vous à ces apps là-bas : $names';
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
      other: '$nString personnes reçoivent',
      one: '$nString personne reçoit',
    );
    return '$_temp0 une invitation par e-mail';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (invité)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'Les abonnements ChatGPT restent sur place. Reconnectez-vous à ChatGPT là-bas.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString ordinateurs démarrent',
      one: '$nString ordinateur démarre',
    );
    return '$_temp0 à neuf là-bas, avec son dossier personnel restauré.';
  }

  @override
  String get wsMoveResetNote =>
      'Les approbations, l\'accès complet et l\'accès à l\'appareil repartent des réglages par défaut du nouveau serveur.';

  @override
  String get wsMoveBringKeys => 'Emporter mes clés';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$nString clés suivent, scellées pour que seul le nouveau serveur puisse les lire.',
      one:
          '$nString clé suit, scellée pour que seul le nouveau serveur puisse la lire.',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Vous ajouterez à nouveau vos clés de modèles et d\'apps de messagerie là-bas.';

  @override
  String get wsMoveDoesntFit =>
      'Cet espace de travail dépasse le forfait de destination';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan convient. Choisissez-le sur Casama Cloud, puis vérifiez à nouveau.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what : $have sur $limit';
  }

  @override
  String get wsMoveOverPeople => 'Personnes';

  @override
  String get wsMoveOverBots => 'Bots';

  @override
  String get wsMoveOverComputers => 'Ordinateurs';

  @override
  String get wsMoveOverStorage => 'Stockage';

  @override
  String get wsMoveUpdateSource =>
      'Mettez d\'abord à jour ce serveur. Il est plus ancien que celui vers lequel vous déplacez.';

  @override
  String get wsMoveUpdateTarget =>
      'Le serveur de destination a d\'abord besoin d\'une mise à jour.';

  @override
  String get wsMoveStart => 'Lancer le déplacement';

  @override
  String get wsMoveCheckAgain => 'Vérifier à nouveau';

  @override
  String get wsMoveProgressTitle => 'Déplacement en cours';

  @override
  String get wsMoveStepStarting => 'Préparation';

  @override
  String get wsMoveStepCopying =>
      'Copie des fichiers pendant que tout continue de fonctionner';

  @override
  String get wsMoveStepPausing =>
      'Mise en pause des bots pour copier les dernières modifications';

  @override
  String get wsMoveStepFinishing =>
      'Envoi des discussions, de la mémoire et des réglages';

  @override
  String get wsMoveStepImporting => 'Le nouveau serveur importe les données';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done sur $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Vous pouvez fermer l\'app. Le déplacement continue et vous recevrez une notification une fois terminé.';

  @override
  String get wsMoveFailedTitle => 'Le déplacement s\'est arrêté';

  @override
  String get wsMoveFailedBody =>
      'Rien n\'a changé ici : cet espace de travail continue de fonctionner.';

  @override
  String get wsMoveTryAgain => 'Réessayer';

  @override
  String get wsMoveNewCodeNeeded =>
      'Pour réessayer, obtenez un nouveau code de transfert.';

  @override
  String get wsMoveDoneTitle => 'Déplacé';

  @override
  String wsMoveDoneBody(String server) {
    return 'Tout est arrivé sur $server.';
  }

  @override
  String get wsMoveDoneNeeds =>
      'Quelques points nécessitent votre intervention là-bas :';

  @override
  String get wsMoveOpenThere => 'Ouvrir là-bas';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Se reconnecter à $name';
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
      other: '$nString personnes ont été',
      one: '$nString personne a été',
    );
    return '$_temp0 invitée(s) par e-mail';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Reconnecter $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Donnez la nouvelle adresse de webhook à l\'expéditeur de $name';
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
      other: '$nString jours',
      one: '$nString jour',
    );
    return 'Les webhooks encore envoyés ici sont transmis pendant $_temp0.';
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
      one: '$nString bot',
    );
    return 'Vérifier les approbations pour $_temp0';
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
      one: '$nString bot',
    );
    return 'Connectez les modèles Casama Cloud dans Réglages, ou choisissez un autre modèle, pour $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Ajoutez vos clés de modèle là-bas';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString éléments ont été renommés',
      one: '$nString élément a été renommé',
    );
    return '$_temp0 « (moved) »';
  }

  @override
  String get wsMoveAfterReindex =>
      'La recherche en mémoire rattrape son retard en quelques minutes.';

  @override
  String get wsMoveAfterNothing => 'Rien d\'autre à faire.';

  @override
  String get wsMoveSubTitle => 'Vos abonnements';

  @override
  String get wsMoveSubToCloud =>
      'Les bots sur Casama Cloud fonctionnent sur votre forfait Cloud. Si vous avez payé une licence Business pour ce serveur, résiliez-la dès que vous n\'en avez plus besoin.';

  @override
  String get wsMoveSubFromCloud =>
      'Votre forfait Casama Cloud continue d\'être renouvelé. Résiliez-le dès que tout est en place sur votre propre serveur.';

  @override
  String get wsMoveSubManage => 'Gérer le forfait';

  @override
  String get wsMovedTitle => 'Cet espace de travail a été déplacé';

  @override
  String get wsMovedBodyCloud =>
      'Il est désormais sur Casama Cloud. Connectez-vous là-bas pour continuer. Cette copie est en lecture seule.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Il est désormais sur $host. Connectez-vous là-bas pour continuer. Cette copie est en lecture seule.';
  }

  @override
  String get wsMovedSignInCloud => 'Se connecter à Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Ouvrir $host';
  }

  @override
  String get wsMovedViewOld => 'Voir l\'ancienne copie';

  @override
  String get languageDevice => 'Langue de l\'appareil';

  @override
  String get shortcutQuickAsk => 'Demande rapide';

  @override
  String shortcutAskBot(String name) {
    return 'Demander à $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Exécuter $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'espace de travail changer équipe organisation rôle workspace team';

  @override
  String get settingsWordsAboutYou =>
      'profil nom photo image avatar pronoms à propos style réponse faits mémoire souvenir profile';

  @override
  String get settingsWordsPeople =>
      'membres inviter équipe utilisateurs admins administrateurs rôles lien code d\'invitation rejoindre retirer';

  @override
  String get settingsWordsWorkspaceSettings =>
      'espace de travail nom icône logo chiffrement mémoire paiements stripe carte gestionnaires mots de passe bot chrome extension galerie accès complet autorisations approbations demander';

  @override
  String get settingsWordsSettingsDomains =>
      'nom de domaine domaine site web personnalisé dns acheter connecter sites';

  @override
  String get settingsWordsUsage =>
      'coût dépense dépenses argent crédits tokens jetons limites budget';

  @override
  String get settingsWordsBilling =>
      'forfait abonnement passer niveau pro plus max paiement facture carte tarifs';

  @override
  String get settingsWordsInviteFriends =>
      'parrainage crédit récompense partager invitation';

  @override
  String get settingsWordsAdminConsole => 'admin console administration';

  @override
  String get settingsWordsAppearance =>
      'thème mode sombre mode clair nuit couleurs polices taille texte arrière-plan fond d\'écran style thèmes effets mouvement animations dark mode';

  @override
  String get settingsWordsQuietHours =>
      'ne pas déranger sommeil couper son silence notifications horaire calendrier heures calmes dnd';

  @override
  String get settingsWordsPushPrefsTitle =>
      'notifications push alertes réponses sons';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'appels téléphone sonnerie écran verrouillé plein écran entrant répondre appel';

  @override
  String get settingsWordsEmailTips =>
      'e-mail email newsletter conseils actualités nouveautés se désabonner';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'e-mail email galerie résumé sélection mensuel';

  @override
  String get settingsWordsNewsletterTitle =>
      'e-mail email newsletter mensuel nouveautés mises à jour s\'abonner se désabonner';

  @override
  String get settingsWordsWakeWord =>
      'voix dis mains libres microphone micro écouter';

  @override
  String get settingsWordsShowBotSteps => 'étapes outils détails progression';

  @override
  String get settingsWordsShowReplyUsage =>
      'coût tokens jetons prix utilisation par réponse';

  @override
  String get settingsWordsCheckForUpdates =>
      'mise à jour mises à jour version mettre à niveau télécharger automatique';

  @override
  String get settingsWordsOpenAtLogin =>
      'démarrage lancer connexion démarrer automatiquement ouverture session';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'activité en direct dynamic island écran verrouillé autres appareils';

  @override
  String get settingsWordsShowBotsInNotch =>
      'encoche barre des menus dynamic island';

  @override
  String get settingsWordsNotchOnHover => 'encoche survol souris';

  @override
  String get settingsWordsLanguage =>
      'langue français localisation anglais traduction language';

  @override
  String get settingsWordsIntegrations =>
      'apps connecter connexions gmail google slack calendrier plugins outils mcp';

  @override
  String get settingsWordsSkills =>
      'compétences catalogue capacités instructions skills';

  @override
  String get settingsWordsCasamaLink =>
      'accès à distance adresse tunnel auto-hébergement téléphone';

  @override
  String get settingsWordsServiceKeys => 'clés api recherche cartes données';

  @override
  String get settingsWordsModelsTitle =>
      'clés api openai anthropic openrouter gemini modèles fournisseurs ollama modèles locaux';

  @override
  String get settingsWordsModelKeys =>
      'clés api openai anthropic openrouter gemini modèles fournisseurs ollama modèles locaux';

  @override
  String get settingsWordsAccount =>
      'e-mail changer email mot de passe déconnecter partout connexion';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa double facteur authentification totp otp code sécurité';

  @override
  String get settingsWordsPairDevice =>
      'code qr scanner se connecter associer téléphone autre appareil';

  @override
  String get settingsWordsPasskeys =>
      'clé d\'accès passkey face id touch id empreinte biométrie';

  @override
  String get settingsWordsWidgetsTitle =>
      'widgets écran d\'accueil écran verrouillé commandes centre de contrôle aperçu épingler raccourci';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'cartes météo unités celsius fahrenheit ville résidence lieu devise bourse actions rouge vert sources données';

  @override
  String get settingsWordsAppLock =>
      'verrouillage app code pin face id touch id empreinte biométrie windows hello captures d\'écran confidentialité écran verrouillé';

  @override
  String get settingsWordsPrivacy =>
      'données exporter télécharger supprimer compte analytique suivi historique conservation personnes bloquées bloquer';

  @override
  String get settingsWordsSecrets =>
      'secrets mots de passe identifiants coffre variables environnement';

  @override
  String get settingsWordsComputers => 'ordinateurs docker bac à sable bureau';

  @override
  String get settingsWordsDeviceConnections =>
      'appareils localisation santé lieux dossiers apps surveillées navigateurs extension chrome téléphone autorisations';

  @override
  String get settingsWordsUseThisComputer =>
      'compagnon cet ordinateur mac fichiers locaux';

  @override
  String get settingsWordsHelpAndSupport =>
      'aide assistance contact ticket signaler bug commentaire docs communauté github étoile open source discord idées tableau état';

  @override
  String get settingsWordsSignOut => 'déconnexion se déconnecter quitter';

  @override
  String get notifDoIt => 'Allez-y';

  @override
  String get notifNotNow => 'Pas maintenant';

  @override
  String get notifAllow => 'Autoriser';

  @override
  String get notifDeny => 'Refuser';

  @override
  String get notifApprove => 'Approuver';

  @override
  String get notifReview => 'Vérifier';

  @override
  String get notifReply => 'Répondre';

  @override
  String get notifSend => 'Envoyer';

  @override
  String get notifReplyPlaceholder => 'Répondre…';

  @override
  String get notifChannelReplies => 'Réponses';

  @override
  String get notifChannelRepliesDescription =>
      'Un bot a répondu à une question que vous avez posée';

  @override
  String get notifChannelNeedsYou => 'Vous attend';

  @override
  String get notifChannelNeedsYouDescription =>
      'Approbations, mots de passe et prises de contrôle attendus par vos bots';

  @override
  String get notifChannelRoutines => 'Routines et résumés';

  @override
  String get notifChannelRoutinesDescription =>
      'Résultats des routines et résumé du matin';

  @override
  String get notifChannelSuggestions => 'Suggestions';

  @override
  String get notifChannelSuggestionsDescription =>
      'Ce que vos bots proposent de faire pour vous';

  @override
  String get notifChannelAccount => 'Compte';

  @override
  String get notifChannelAccountDescription =>
      'Crédits, projets et votre serveur';

  @override
  String get notifCallChannel => 'Appels';

  @override
  String get notifCallLive => 'En appel';

  @override
  String get notifCallMuted => 'Micro coupé';

  @override
  String get notifCallReconnecting => 'Reconnexion';

  @override
  String get notifCallMute => 'Couper le micro';

  @override
  String get notifCallUnmute => 'Réactiver le micro';

  @override
  String get notifCallEnd => 'Raccrocher';

  @override
  String get notifFromYourWatch => 'Depuis votre montre';

  @override
  String get notifLiveOpen => 'Ouvrir';

  @override
  String get notifLiveStop => 'Arrêter';

  @override
  String get notifLiveReview => 'Vérifier';

  @override
  String get notifLiveAllow => 'Autoriser';

  @override
  String get notifLiveDeny => 'Refuser';

  @override
  String get notifLiveNeedsOk => 'Accord requis';

  @override
  String get notifLiveNeedsYou => 'Vous attend';

  @override
  String get notifLiveWorking => 'Au travail';

  @override
  String get notifLiveTakeOver => 'Demande de prendre le contrôle';

  @override
  String get notifLiveFinished => 'Terminé';

  @override
  String get notifLiveProblem => 'Arrêté avec un problème';

  @override
  String get notifLiveBotWorking => 'Un bot travaille';

  @override
  String get notifLiveBotsAtWork => 'Bots au travail';

  @override
  String get notifLiveStepOne => '1 étape';

  @override
  String notifLiveSteps(int count) {
    return '$count étapes';
  }

  @override
  String get notifAlarmTitle => 'Alarme Casama';

  @override
  String get notifAlarmStop => 'Arrêter';

  @override
  String get widgetIosNeedsYouDescription =>
      'Voir quels bots vous attendent et répondre aux demandes simples.';

  @override
  String get widgetIosBotDescription =>
      'Garder un œil sur ce que fait l\'un de vos bots.';

  @override
  String get widgetIosAskDescription =>
      'Demander à un bot ou lancer un appel en un toucher, avec des idées à essayer.';

  @override
  String get widgetIosRoutinesDescription =>
      'Voir ce qui s\'exécute ensuite et exécuter une routine maintenant.';

  @override
  String get widgetIosTodayDescription =>
      'Retrouver votre journée au même endroit : ce qui vous attend, les prochaines exécutions et vos crédits.';

  @override
  String get widgetIosBriefDescription =>
      'Lire ce que votre bot vous a dit ce matin.';

  @override
  String get widgetIosLibraryDescription =>
      'Ouvrir ce que vos bots ont créé récemment.';

  @override
  String get widgetIosTasksDescription =>
      'Voir où en est le tableau des tâches, avec ce qui vous attend en premier.';

  @override
  String get widgetIosCreditsDescription =>
      'Vérifier quelle part de vos crédits vous avez utilisée.';

  @override
  String get widgetIosInlineDescription =>
      'Voir l\'élément le plus important au-dessus de l\'horloge.';

  @override
  String get widgetIosCanvasDescription =>
      'Afficher ce que vos bots y placent : un verset, un compte à rebours, une série, une liste ou une image.';

  @override
  String get widgetMacNeedsYouDescription => 'Voir quels bots vous attendent.';

  @override
  String get widgetMacRoutinesDescription => 'Voir ce qui s\'exécute ensuite.';

  @override
  String get widgetAskCasama => 'Demander à Casama';

  @override
  String get widgetControlAskDescription =>
      'Ouvrir la demande rapide avec le clavier affiché.';

  @override
  String get widgetTalkToBot => 'Parler à un bot';

  @override
  String widgetTalkToName(String name) {
    return 'Parler à $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Lancer un appel vocal avec le bot de votre choix.';

  @override
  String get widgetRunRoutine => 'Exécuter une routine';

  @override
  String get widgetControlRunDescription =>
      'Exécuter la routine de votre choix sans ouvrir Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Demander n\'importe quoi à $bot';
  }

  @override
  String get widgetFallbackBrief => 'Résumé du matin';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot a terminé $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'À $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Rien à venir';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot vous demande de prendre le contrôle';
  }

  @override
  String get widgetFallbackDay => 'jour';

  @override
  String get widgetFallbackDays => 'jours';

  @override
  String get widgetSampleVerse => 'Arrêtez, et sachez que je suis Dieu.';

  @override
  String get widgetSampleVerseRef => 'Ps 46.11';

  @override
  String get widgetSampleVerseShort =>
      'Arrêtez, et sachez que je suis Dieu. · Ps 46.11';

  @override
  String get widgetSampleVerseTiny => 'Arrêtez, et sachez…';

  @override
  String get widgetSampleCanvasName => 'Verset du jour';

  @override
  String get widgetSampleNeedFlights => 'Rechercher des vols pour Lisbonne';

  @override
  String get widgetSampleNeedDentist => 'Déplacer le dentiste à vendredi ?';

  @override
  String get widgetSampleBotText =>
      'Trois e-mails attendent une réponse et la facture Acme a deux jours de retard.';

  @override
  String get widgetSampleStep => 'Lecture de vos e-mails';

  @override
  String get widgetSampleRoutineInbox => 'Tri des e-mails';

  @override
  String get widgetSampleRoutineBrief => 'Résumé du matin';

  @override
  String get widgetSampleRoutineWeekly => 'Rapport hebdomadaire';

  @override
  String get widgetSampleWeekdays => 'En semaine';

  @override
  String get widgetSampleEveryDay => 'Tous les jours';

  @override
  String get widgetSampleFridays => 'Les vendredis à 16 h 00';

  @override
  String get widgetSampleBrief =>
      'Trois e-mails attendent une réponse et la facture Acme a deux jours de retard. Pluie à partir de 15 h, partez tôt pour le rendez-vous de 16 h 30. Votre première réunion est à 10 h 00 avec Dana.';

  @override
  String get widgetSamplePricing => 'Page de tarifs T4';

  @override
  String get widgetSampleLogoIdeas => 'Idées de logo';

  @override
  String get widgetSampleTripPlan => 'Plan de voyage';

  @override
  String get widgetSampleLaunchPost => 'Rédiger l\'article de lancement';

  @override
  String get widgetSampleStarterInbox => 'Résumer ma boîte de réception';

  @override
  String get widgetSampleStarterFriday => 'Organiser mon vendredi';

  @override
  String get widgetSampleWorking => 'Au travail · 2:14';

  @override
  String get widgetSampleCreditsLeft => '5,70 \$ US restants';

  @override
  String get widgetSampleSpentToday => '0,80 \$ US aujourd\'hui';

  @override
  String get widgetSampleMorning =>
      'Bonjour. Deux réunions aujourd\'hui, la première à 10 h 00 avec l\'équipe design. Pluie après 15 h, prenez un manteau. Votre vol pour Lisbonne est confirmé pour vendredi.';

  @override
  String get widgetSampleLisbonPlan => 'Plan de voyage à Lisbonne';

  @override
  String get widgetSampleAgo => 'Milo · il y a 2 h';

  @override
  String get widgetSampleLaunchEmail => 'Rédiger l\'e-mail de lancement';

  @override
  String get widgetSampleInReviewBy => 'En révision · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo souhaite rechercher des prix de vols pour Lisbonne';

  @override
  String get widgetSampleUpNextAt => 'À venir · 9 h 00';

  @override
  String get widgetSampleInMinutes => 'Ada · dans 18 min';

  @override
  String get widgetSampleDate => 'Mercredi 18 novembre';

  @override
  String get widgetSampleNeedsCount => 'Vous attend · 1';

  @override
  String get widgetSampleSearchFlights =>
      'Rechercher des prix de vols pour Lisbonne';

  @override
  String get widgetSampleAskAda => 'Demander à Ada';

  @override
  String get widgetSampleAskMilo => 'Demander à Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Organiser ma journée';

  @override
  String get widgetSampleWhatsNew =>
      '✉️ Quoi de neuf dans ma boîte de réception ?';

  @override
  String get widgetAndroidBotDescription =>
      'Suivre ce qu\'un bot fait en ce moment';

  @override
  String get widgetAndroidTodayDescription =>
      'Garder toute votre journée avec vos bots au même endroit';

  @override
  String get widgetAndroidBriefDescription =>
      'Lire votre résumé du matin en un coup d\'œil';

  @override
  String get widgetAndroidLibraryDescription =>
      'Ouvrir ce que vos bots ont créé récemment';

  @override
  String get widgetAndroidTasksDescription =>
      'Suivre l\'avancement de votre tableau des tâches';

  @override
  String get widgetAndroidCreditsDescription =>
      'Vérifier combien vous avez utilisé';

  @override
  String get widgetAndroidCanvasDescription =>
      'Afficher ce que vos bots y placent, d\'un verset à un compte à rebours';

  @override
  String get widgetConfigBotTitle => 'Choisir un bot';

  @override
  String get widgetConfigRoutinesTitle => 'Choisir des routines';

  @override
  String get widgetConfigRoutinesHint =>
      'Choisissez-en jusqu\'à quatre, parmi celles que vous lancez manuellement';

  @override
  String get widgetConfigAutomatic => 'Automatique';

  @override
  String get widgetConfigAutomaticHint =>
      'Les prochaines exécutions, tous bots confondus';

  @override
  String get widgetConfigDone => 'Terminé';

  @override
  String get widgetConfigSignedOutTitle => 'Rien à choisir pour le moment';

  @override
  String get widgetConfigSignedOut =>
      'Ouvrez Casama et connectez-vous, puis choisissez ici.';

  @override
  String get widgetConfigCanvasTitle => 'Choisir un canevas';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'Celui qu\'un bot a défini le plus récemment';

  @override
  String get widgetConfigCanvasNone =>
      'Aucun canevas pour le moment. Demandez à un bot de mettre quelque chose ici.';

  @override
  String get iosUsageTracking =>
      'Si vous l\'autorisez, Casama informe Meta lorsque vous installez l\'app, rejoignez Casama ou vous abonnez après avoir vu une publicité Casama sur Facebook ou Instagram, afin que nous puissions mesurer quelles publicités fonctionnent. Casama n\'affiche jamais de publicités et ne partage jamais vos discussions ni vos fichiers.';

  @override
  String get iosUsageContacts =>
      'Vos bots peuvent rechercher des personnes que vous connaissez, uniquement lorsque vous activez Contacts dans Connexions de l\'appareil.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama ouvre votre photothèque lorsque vous choisissez une photo à envoyer à un bot ou pour votre profil.';

  @override
  String get iosUsageLocationAlways =>
      'Informez vos bots lorsque vous arrivez à vos lieux nommés ou les quittez, même lorsque Casama est fermé. Seuls le nom du lieu et l\'heure sont partagés, jamais votre itinéraire.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Enregistrez des lieux nommés, comme Maison ou Travail, et laissez vos bots vous rappeler quand partir pour votre prochain rendez-vous. Utilisé uniquement si vous activez Lieux dans Connexions de l\'appareil.';

  @override
  String get iosUsageCamera =>
      'Casama utilise l\'appareil photo lorsque vous prenez une photo à envoyer à un bot ou pour votre profil.';

  @override
  String get iosUsageCalendars =>
      'Vos bots peuvent répondre aux questions sur votre emploi du temps et ajouter des événements, uniquement lorsque vous activez Calendrier dans Connexions de l\'appareil.';

  @override
  String get iosUsageSpeech =>
      'Lorsque le service de dictée de Casama est inaccessible, la reconnaissance vocale intégrée à votre appareil transforme vos paroles en texte.';

  @override
  String get iosUsageAlarmKit =>
      'Vos bots peuvent programmer des alarmes et minuteurs qui sonnent même en mode silencieux, uniquement lorsque vous autorisez Alarmes dans Connexions de l\'appareil.';

  @override
  String get iosUsageHomeKit =>
      'Vos bots peuvent consulter et contrôler votre maison HomeKit lorsque vous autorisez Maison dans Connexions de l\'appareil ; toute modification demande toujours votre approbation au préalable.';

  @override
  String get iosUsageMicrophone =>
      'Casama utilise le micro pour la dictée et les appels en direct avec vos bots. Uniquement après votre accord, votre voix est envoyée aux fournisseurs d\'IA pour vous répondre : Google Gemini pour les appels, OpenAI pour transcrire la dictée en texte.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama lit uniquement les données Apple Santé ; il n\'y écrit jamais.';

  @override
  String get iosUsageFaceId =>
      'Casama utilise Face ID pour déverrouiller l\'app lorsque vous activez le verrouillage de l\'app et pour confirmer les actions risquées.';

  @override
  String get iosUsageHealthShare =>
      'Vos bots peuvent voir des résumés quotidiens de votre sommeil, activité, entraînements et rythme cardiaque depuis Apple Santé, uniquement lorsque vous activez Apple Santé dans Connexions de l\'appareil. Casama n\'écrit jamais dans Apple Santé et ne l\'utilise jamais pour des publicités.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama enregistre votre voix lorsque vous posez une question à un bot et l\'envoie à votre serveur Casama, où un fournisseur d\'IA (OpenAI, sur Casama Cloud) la transcrit en texte pour votre bot.';

  @override
  String get macUsageContacts =>
      'Vos bots peuvent rechercher des personnes que vous connaissez, uniquement lorsque vous activez Contacts dans Connexions de l\'appareil.';

  @override
  String get macUsageSpeech =>
      'Lorsque le service de dictée de Casama est inaccessible, la reconnaissance vocale intégrée à votre Mac transforme vos paroles en texte.';

  @override
  String get macUsageMicrophone =>
      'Casama utilise le micro pour la dictée et les appels en direct avec vos bots. Uniquement après votre accord, votre voix est envoyée aux fournisseurs d\'IA pour vous répondre : Google Gemini pour les appels, OpenAI pour transcrire la dictée en texte.';

  @override
  String get macUsageAppleEvents =>
      'La demande rapide lit le titre de la fenêtre active et l\'onglet actuel de votre navigateur, uniquement lorsque vous appuyez sur le raccourci.';

  @override
  String get nativeNameFileProvider => 'Ordinateurs Casama';

  @override
  String get nativeNameNotifications => 'Notifications Casama';

  @override
  String get nativeNameSafari => 'Casama pour Safari';

  @override
  String get nativeNameAskCasama => 'Demander à Casama';

  @override
  String get nativeComputer => 'Ordinateur';

  @override
  String get nativeSafariSignInIos =>
      'Ouvrez Casama sur cet appareil -> Réglages -> Se connecter sur un autre appareil, ou collez un lien de connexion ci-dessous.';

  @override
  String get nativeSafariSignInMac =>
      'Ouvrez Casama sur ce Mac -> Réglages -> Se connecter sur un autre appareil, ou collez un lien de connexion ci-dessous.';

  @override
  String get linuxDesktopComment =>
      'Des bots qui font le travail, sur chacun de vos écrans';

  @override
  String get linuxDesktopKeywords => 'IA;assistant;agent;bot;discussion;';

  @override
  String macMenuAbout(String appName) {
    return 'À propos de $appName';
  }

  @override
  String get macMenuPreferences => 'Réglages…';

  @override
  String get macMenuServices => 'Services';

  @override
  String macMenuHide(String appName) {
    return 'Masquer $appName';
  }

  @override
  String get macMenuHideOthers => 'Masquer les autres';

  @override
  String get macMenuShowAll => 'Tout afficher';

  @override
  String macMenuQuit(String appName) {
    return 'Quitter $appName';
  }

  @override
  String get macMenuEdit => 'Édition';

  @override
  String get macMenuUndo => 'Annuler';

  @override
  String get macMenuRedo => 'Rétablir';

  @override
  String get macMenuCut => 'Couper';

  @override
  String get macMenuCopy => 'Copier';

  @override
  String get macMenuPaste => 'Coller';

  @override
  String get macMenuPasteAndMatchStyle => 'Coller et adapter le style';

  @override
  String get macMenuDelete => 'Supprimer';

  @override
  String get macMenuSelectAll => 'Tout sélectionner';

  @override
  String get macMenuFind => 'Rechercher';

  @override
  String get macMenuFindEllipsis => 'Rechercher…';

  @override
  String get macMenuFindAndReplace => 'Rechercher et remplacer…';

  @override
  String get macMenuFindNext => 'Rechercher le suivant';

  @override
  String get macMenuFindPrevious => 'Rechercher le précédent';

  @override
  String get macMenuUseSelectionForFind => 'Rechercher la sélection';

  @override
  String get macMenuJumpToSelection => 'Aller à la sélection';

  @override
  String get macMenuSpellingAndGrammar => 'Orthographe et grammaire';

  @override
  String get macMenuSpelling => 'Orthographe';

  @override
  String get macMenuShowSpelling => 'Afficher l\'orthographe et la grammaire';

  @override
  String get macMenuCheckDocumentNow => 'Vérifier le document maintenant';

  @override
  String get macMenuCheckSpellingWhileTyping =>
      'Vérifier l\'orthographe lors de la saisie';

  @override
  String get macMenuCheckGrammar => 'Vérifier la grammaire et l\'orthographe';

  @override
  String get macMenuCorrectSpelling =>
      'Corriger l\'orthographe automatiquement';

  @override
  String get macMenuSubstitutions => 'Substitutions';

  @override
  String get macMenuShowSubstitutions => 'Afficher les substitutions';

  @override
  String get macMenuSmartCopyPaste => 'Copier-coller intelligent';

  @override
  String get macMenuSmartQuotes => 'Guillemets courbes';

  @override
  String get macMenuSmartDashes => 'Tirets intelligents';

  @override
  String get macMenuSmartLinks => 'Liens intelligents';

  @override
  String get macMenuDataDetectors => 'Détection de données';

  @override
  String get macMenuTextReplacement => 'Remplacement de texte';

  @override
  String get macMenuTransformations => 'Transformations';

  @override
  String get macMenuMakeUpperCase => 'Mettre en majuscule';

  @override
  String get macMenuMakeLowerCase => 'Mettre en minuscule';

  @override
  String get macMenuCapitalize => '1re lettre majuscule';

  @override
  String get macMenuSpeech => 'Parole';

  @override
  String get macMenuStartSpeaking => 'Commencer la lecture';

  @override
  String get macMenuStopSpeaking => 'Arrêter la lecture';

  @override
  String get macMenuView => 'Présentation';

  @override
  String get macMenuEnterFullScreen => 'Activer le mode plein écran';

  @override
  String get macMenuWindow => 'Fenêtre';

  @override
  String get macMenuMinimize => 'Minimiser';

  @override
  String get macMenuZoom => 'Réduire/agrandir';

  @override
  String get macMenuBringAllToFront => 'Tout ramener au premier plan';

  @override
  String get macMenuHelp => 'Aide';

  @override
  String get macMenuCheckForUpdates => 'Rechercher des mises à jour…';

  @override
  String get macMenuSettings => 'Réglages…';

  @override
  String get macMenuFile => 'Fichier';

  @override
  String get macMenuNewChat => 'Nouvelle discussion';

  @override
  String get macMenuNewBot => 'Nouveau bot…';

  @override
  String get macMenuQuickAsk => 'Demande rapide';

  @override
  String get macMenuSearch => 'Rechercher…';

  @override
  String get macMenuCloseWindow => 'Fermer la fenêtre';

  @override
  String get macMenuGo => 'Aller';

  @override
  String get macMenuBots => 'Bots';

  @override
  String get macMenuInbox => 'Boîte de réception';

  @override
  String get macMenuBoard => 'Tableau';

  @override
  String get macMenuComputer => 'Ordinateur';

  @override
  String get macMenuPages => 'Pages';

  @override
  String get macMenuCasamaHelp => 'Aide Casama';

  @override
  String get macMenuSendFeedback => 'Envoyer un commentaire…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Routine';

  @override
  String get siriRoutines => 'Routines';

  @override
  String get siriCanvas => 'Canevas';

  @override
  String get siriAutomatic => 'Automatique';

  @override
  String get siriAutomaticSubtitle =>
      'Ce qu\'un bot a défini le plus récemment';

  @override
  String get siriChooseCanvas => 'Choisir un canevas';

  @override
  String get siriChooseCanvasDescription =>
      'Afficher ce qu\'un bot a défini le plus récemment, ou un seul canevas.';

  @override
  String get siriChooseBot => 'Choisir un bot';

  @override
  String get siriChooseBotDescription =>
      'Choisissez le bot que ce widget affiche.';

  @override
  String get siriChooseRoutines => 'Choisir des routines';

  @override
  String get siriChooseRoutinesDescription =>
      'Afficher les prochaines exécutions, ou jusqu\'à quatre routines de votre choix.';

  @override
  String get siriOpenCasama => 'Ouvrir Casama';

  @override
  String get siriWhere => 'Où';

  @override
  String get siriTalkToBot => 'Parler à un bot';

  @override
  String get siriTalkToBotDescription =>
      'Lance un appel vocal avec le bot de votre choix.';

  @override
  String get siriRunRoutine => 'Exécuter une routine';

  @override
  String get siriRunRoutineControlDescription =>
      'Exécute la routine de votre choix sans ouvrir Casama.';

  @override
  String get siriCallAction => 'Action d\'appel';

  @override
  String get siriAction => 'Action';

  @override
  String get siriStopBot => 'Arrêter le bot';

  @override
  String get siriRun => 'Exécution';

  @override
  String get siriAnswerRequest => 'Répondre à la demande d\'un bot';

  @override
  String get siriRequest => 'Demande';

  @override
  String get siriAllow => 'Autoriser';

  @override
  String get siriFromWidget => 'Depuis un widget';

  @override
  String get siriRunRoutineNow => 'Exécuter une routine maintenant';

  @override
  String get siriAcceptSuggestion => 'Faire ce qu\'un bot suggère';

  @override
  String get siriSuggestion => 'Suggestion';

  @override
  String get siriBotStatusDescription => 'État d\'un bot et ce qu\'il fait';

  @override
  String get siriNextRoutineDescription =>
      'La prochaine routine et son heure d\'exécution';

  @override
  String get siriAskCasama => 'Demander à Casama';

  @override
  String get siriAskVoiceDescription =>
      'Demander quelque chose à un bot à la voix';

  @override
  String get siriWhatWaiting => 'Ce qui attend votre accord';

  @override
  String get siriAsk => 'Demander';

  @override
  String get siriShortNeedsYou => 'Vous attend';

  @override
  String get siriOpeningToFinish => 'Ouverture de Casama pour terminer.';

  @override
  String get siriName => 'Nom';

  @override
  String get siriTitle => 'Titre';

  @override
  String get siriChat => 'Discussion';

  @override
  String get siriBotSubtitle =>
      'Un bot dans Casama, un assistant IA avec lequel vous discutez';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Une routine que $bot exécute dans Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Une discussion avec $bot dans Casama';
  }

  @override
  String get siriBotInCasama => 'Bot dans Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Routine · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Discussion avec $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'routine';

  @override
  String get siriKeywordChat => 'discussion';

  @override
  String get siriAskBot => 'Demander à un bot';

  @override
  String get siriAskBotDescription =>
      'Envoie une question à l\'un de vos bots Casama dans une nouvelle discussion et lit la réponse à voix haute. Si aucun bot n\'est nommé, le dernier bot avec lequel vous avez discuté répond.';

  @override
  String get siriCategoryBots => 'Bots';

  @override
  String get siriAskBotParamDescription =>
      'Quel bot interroger. Laissez vide pour le dernier bot avec lequel vous avez discuté.';

  @override
  String get siriQuestion => 'Question';

  @override
  String get siriQuestionDescription =>
      'Ce qu\'il faut demander au bot, avec vos propres mots.';

  @override
  String get siriWhatShouldIAsk => 'Que dois-je demander ?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Demander à $bot $question';
  }

  @override
  String get siriRestOnScreen => 'La suite est à l\'écran.';

  @override
  String get siriRestOnScreenEllipsis => '… La suite est à l\'écran.';

  @override
  String get siriRunRoutineDescription =>
      'Exécute l\'une des routines de vos bots Casama maintenant. Le résultat arrive dans l\'app et par notification, comme lorsque la routine s\'exécute d\'elle-même.';

  @override
  String get siriRoutineParamDescription =>
      'Quelle routine exécuter maintenant.';

  @override
  String siriSummaryRun(String routine) {
    return 'Exécuter $routine';
  }

  @override
  String get siriWhatNeedsMe => 'Ce qui m\'attend';

  @override
  String get siriWhatNeedsMeDescription =>
      'Indique combien d\'éléments dans Casama vous attendent : une demande d\'accord d\'un bot, une prise de contrôle, une suggestion. Répondez-y dans l\'app.';

  @override
  String get siriOpenBot => 'Ouvrir un bot';

  @override
  String get siriOpenBotDescription =>
      'Ouvre votre discussion avec l\'un de vos bots Casama.';

  @override
  String get siriOpenBotPersonDescription =>
      'Ouvre la discussion d\'un bot Casama.';

  @override
  String get siriOpenChat => 'Ouvrir une discussion';

  @override
  String get siriOpenChatDescription =>
      'Ouvre l\'une de vos discussions avec un bot Casama.';

  @override
  String get siriOpenRoutine => 'Ouvrir le bot d\'une routine';

  @override
  String get siriOpenRoutineDescription =>
      'Ouvre le bot qui exécute l\'une de vos routines Casama.';

  @override
  String get siriTalkDescription =>
      'Ouvre le mode vocal avec l\'un de vos bots Casama. Disponible sur le bouton Action.';

  @override
  String get siriAskGetReply => 'Demander à un bot et obtenir la réponse';

  @override
  String get siriAskGetReplyDescription =>
      'Envoie une question à un bot Casama et renvoie sa réponse en texte pour l\'enchaîner dans Raccourcis.';

  @override
  String get siriGetLastReply => 'Obtenir la dernière réponse';

  @override
  String get siriGetLastReplyDescription =>
      'Renvoie le dernier texte de réponse d\'une discussion avec un bot Casama.';

  @override
  String get siriStartComputer => 'Démarrer un ordinateur';

  @override
  String get siriStartComputerDescription =>
      'Réveille un ordinateur Casama après confirmation.';

  @override
  String get siriComputerName => 'Nom de l\'ordinateur';

  @override
  String get siriYourComputer => 'votre ordinateur Casama';

  @override
  String siriStartConfirm(String computer) {
    return 'Démarrer $computer ?';
  }

  @override
  String get siriOpenToStartComputer =>
      'Ouvrez Casama pour démarrer votre ordinateur.';

  @override
  String get siriFocusTitle => 'Configurer le filtre de concentration Casama';

  @override
  String get siriFocusDescription =>
      'N\'afficher que les bots choisis et mettre éventuellement en pause les points réguliers proactifs tant que ce mode de concentration est actif.';

  @override
  String get siriFocusBots => 'Bots à afficher';

  @override
  String get siriFocusHold => 'Suspendre les points réguliers proactifs';

  @override
  String get siriFocusShowOne => 'Afficher 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Afficher $count bots';
  }

  @override
  String get siriFocusHoldCheckIns => 'Suspendre les points réguliers';

  @override
  String get siriFocusAllowCheckIns => 'Autoriser les points réguliers';

  @override
  String get siriFocusAllBots => 'Tous les bots';

  @override
  String get siriFocusAllVisible => 'Tous les bots visibles';

  @override
  String get siriToolAsk => 'Demander à un bot Casama';

  @override
  String get siriToolAskDescription =>
      'Pose une question à l\'un des bots Casama de l\'utilisateur et renvoie sa réponse.';

  @override
  String get siriCategoryAssistants => 'Assistants';

  @override
  String get siriToolBotDescription => 'Quel bot Casama interroger.';

  @override
  String get siriToolQuestionDescription => 'Ce qu\'il faut demander au bot.';

  @override
  String get siriToolRun => 'Exécuter une routine Casama';

  @override
  String get siriToolRunDescription =>
      'Exécute une routine Casama enregistrée après avoir demandé confirmation.';

  @override
  String get siriCategoryAutomation => 'Automatisation';

  @override
  String get siriToolRoutineDescription => 'La routine à exécuter.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return 'Exécuter $routine avec $bot ?';
  }

  @override
  String get siriToolNeeds => 'Ce qui m\'attend dans Casama';

  @override
  String get siriToolNeedsDescription =>
      'Vérifie combien d\'approbations, prises de contrôle ou suggestions attendent dans Casama.';

  @override
  String get siriOpenToCheck => 'Ouvrez Casama pour voir ce qui vous attend.';

  @override
  String get siriToolStop => 'Arrêter un bot Casama';

  @override
  String get siriToolStopDescription =>
      'Arrête un bot qui exécute actuellement une tâche dans Casama.';

  @override
  String get siriToolStopBotDescription => 'Le bot à arrêter.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot arrêté.';
  }

  @override
  String get siriToolCall => 'Appeler un bot Casama';

  @override
  String get siriToolCallDescription =>
      'Ouvre Casama et lance un appel vocal en direct avec le bot choisi.';

  @override
  String get siriCategoryCommunication => 'Communication';

  @override
  String get siriToolCallBotDescription => 'Le bot à appeler.';

  @override
  String siriCalling(String bot) {
    return 'J\'appelle $bot.';
  }

  @override
  String siriBotIn(String app) {
    return 'Un bot dans $app';
  }

  @override
  String get siriMe => 'Moi';

  @override
  String get siriABot => 'un bot';

  @override
  String get siriFavorited => 'Favori';

  @override
  String siriSentTo(String bot) {
    return 'Envoyé à $bot';
  }

  @override
  String get siriMessage => 'Message';

  @override
  String get siriNone => 'Aucun';

  @override
  String get siriErrorOneBot =>
      'Casama envoie à un seul bot à la fois. Quel bot ?';

  @override
  String get siriErrorTextOnly =>
      'Siri peut envoyer du texte à un bot. Ajoutez des fichiers, images et lieux dans Casama.';

  @override
  String get siriErrorNoBot => 'Je n\'ai pas trouvé ce bot dans Casama.';

  @override
  String get siriWhatShouldISend => 'Que dois-je envoyer ?';

  @override
  String get siriAskCasamaBot => 'Demander au bot Casama';

  @override
  String siriAskName(String bot) {
    return 'Demander à $bot';
  }

  @override
  String get siriAskAboutThis => 'Demander à Casama à ce sujet';

  @override
  String siriPhraseAsk(String app) {
    return 'Demander à $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Demander à un bot dans $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Demander à $bot dans $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Parler à un bot dans $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Parler à $bot dans $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Lancer une routine dans $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Lancer $routine dans $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'Qu\'est-ce qui m\'attend dans $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'Qu\'est-ce qui attend dans $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Poser une question à $app';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Lancer ma routine $routine dans $app';
  }

  @override
  String get siriABotSubject => 'Un bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot attend votre accord.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot vous demande de prendre le contrôle.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot a une suggestion.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot vous attend.';
  }

  @override
  String get siriOneThingNeedsYou => 'Une chose vous attend.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count choses vous attendent.';
  }

  @override
  String get siriUnlockPhone => 'Déverrouillez votre téléphone et réessayez.';

  @override
  String get siriGeminiOff =>
      'Gemini est désactivé pour Casama sur ce téléphone (Casama → Réglages → Confidentialité).';
}
