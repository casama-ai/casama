// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

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
  String get tabTitleCall => 'Llamada';

  @override
  String get tabTitleProject => 'Proyecto';

  @override
  String get tabTitleGroupChat => 'Chat grupal';

  @override
  String get loading => 'Cargando…';

  @override
  String get retry => 'Reintentar';

  @override
  String get keepGoing => 'Continuar';

  @override
  String get keepGoingMessage => 'Continúa desde donde te quedaste.';

  @override
  String get startOver => 'Empezar de nuevo';

  @override
  String get continueRunHint =>
      'Sigue donde se detuvo, con un presupuesto nuevo, en lugar de empezar la solicitud otra vez.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Cerrar';

  @override
  String get create => 'Crear';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get errorViewHint => 'Reiniciar la app debería solucionarlo.';

  @override
  String get signInTitle => 'Inicia sesión en Casama';

  @override
  String get signUpTitle => 'Crea tu cuenta';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Crear cuenta';

  @override
  String get haveAccount => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String get needAccount => '¿Primera vez aquí? Crea una cuenta';

  @override
  String get magicLink => 'Enviarme un enlace por correo';

  @override
  String get magicLinkSent =>
      'Revisa tu correo para ver el enlace de inicio de sesión.';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get continueWithApple => 'Continuar con Apple';

  @override
  String get continueWithEmail => 'Continuar con correo';

  @override
  String get moreSignInOptions => 'Más opciones';

  @override
  String get usePasswordInstead => 'Usar contraseña';

  @override
  String get checkInboxTitle => 'Revisa tu bandeja de entrada';

  @override
  String checkInboxBody(String email) {
    return 'Enviamos un enlace de inicio de sesión y un código de 6 dígitos a $email. Toca el enlace o escribe el código aquí.';
  }

  @override
  String get emailCodeLabel => 'Código de 6 dígitos';

  @override
  String get resendLink => 'Enviar de nuevo';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Enviar de nuevo en $secondsString s';
  }

  @override
  String get useDifferentEmail => 'Usar otro correo';

  @override
  String get authWrongPassword =>
      'Ese correo y esa contraseña no coinciden. Inténtalo de nuevo o inicia sesión con un enlace por correo.';

  @override
  String get authEmailNotConfirmed =>
      'Confirma tu correo primero: abre el enlace que te enviamos.';

  @override
  String get authCodeInvalid =>
      'Ese código es incorrecto o ya venció. Revisa el último correo o envía uno nuevo.';

  @override
  String get authTooManyTries =>
      'Demasiados intentos. Espera un minuto e inténtalo de nuevo.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds segundos',
      one: '1 segundo',
    );
    return 'Demasiadas solicitudes a la vez. Inténtalo de nuevo en $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'Ya puedes intentarlo de nuevo.';

  @override
  String computerInUseBy(String name) {
    return '$name está usando esta computadora';
  }

  @override
  String get authAccountExists =>
      'Ya existe una cuenta con este correo. Inicia sesión.';

  @override
  String get authSignupDisabled => 'Este servidor no acepta nuevos registros.';

  @override
  String get useMagicLinkInstead => 'Enviarme un enlace por correo';

  @override
  String get invalidEmail => 'Ingresa un correo válido';

  @override
  String get passwordTooShort => 'Usa al menos 6 caracteres';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get onboardingTitle => 'Configura tu espacio de trabajo';

  @override
  String get createWorkspace => 'Crear un espacio de trabajo';

  @override
  String get workspaceName => 'Nombre del espacio de trabajo';

  @override
  String get joinWorkspace => 'Unirse con un código de invitación';

  @override
  String get inviteCode => 'Código de invitación';

  @override
  String get join => 'Unirse';

  @override
  String get addModelKeyTitle => 'Agregar una clave de modelo';

  @override
  String get addModelKeyBody =>
      'Los bots usan tu propia clave de proveedor de modelos. Se guarda cifrada y nunca vuelve a mostrarse.';

  @override
  String get provider => 'Proveedor';

  @override
  String get label => 'Etiqueta';

  @override
  String get apiKey => 'Clave de API';

  @override
  String get baseUrl => 'URL base';

  @override
  String get testKey => 'Probar clave';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'La clave funciona ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Error al probar la clave: $error';
  }

  @override
  String get createFirstBot => 'Crea tu primer bot';

  @override
  String get botName => 'Nombre del bot';

  @override
  String get model => 'Modelo';

  @override
  String get persona => 'Instrucciones';

  @override
  String get personaHint =>
      'Qué hace este bot y cómo debe trabajar. Una personalidad rellena esto; edítalo libremente.';

  @override
  String get modelKey => 'Clave de modelo';

  @override
  String get navComputer => 'Computadora';

  @override
  String get navChats => 'Chats';

  @override
  String get navTasks => 'Tareas';

  @override
  String get settingsConnectionsSection => 'Conexiones';

  @override
  String get advanced => 'Avanzado';

  @override
  String get settingsAdvancedSummary => 'Secretos, computadoras, dispositivos';

  @override
  String get bots => 'Bots';

  @override
  String get newBot => 'Nuevo bot';

  @override
  String get noBots => 'Todavía no hay bots';

  @override
  String get botStatusIdle => 'Inactivo';

  @override
  String get botStatusWorking => 'Trabajando';

  @override
  String get botStatusWaiting => 'Esperándote';

  @override
  String sidebarMoreWorking(int count) {
    return '$count más trabajando';
  }

  @override
  String get botStatusDisabled => 'Desactivado';

  @override
  String costToday(String cost) {
    return '$cost hoy';
  }

  @override
  String get newChat => 'Nuevo chat';

  @override
  String get conversations => 'Conversaciones';

  @override
  String messageHint(String bot) {
    return 'Mensaje para $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Mensaje para $bot · @ para mencionar una app';
  }

  @override
  String get mentionSectionBots => 'Bots';

  @override
  String get mentionSectionApps => 'Apps';

  @override
  String get mentionSectionAddToBot => 'Agregar a este bot';

  @override
  String get mentionSectionConnect => 'Conectar';

  @override
  String get mentionSectionStartGroup => 'Iniciar un chat grupal';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'App';

  @override
  String get mentionAddAction => 'Agregar';

  @override
  String get mentionConnectAction => 'Conectar';

  @override
  String get mentionMaxApps => 'Puedes mencionar hasta 3 apps por mensaje.';

  @override
  String get mentionRemovedApp => 'App eliminada';

  @override
  String get send => 'Enviar';

  @override
  String get stop => 'Detener';

  @override
  String get thinking => 'Pensando…';

  @override
  String get checkingItsWork => 'Revisando su trabajo…';

  @override
  String get mapFullScreen => 'Pantalla completa';

  @override
  String get mapTitle => 'Mapa';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Detenido.';

  @override
  String emptyChat(String bot) {
    return 'Saluda a $bot.';
  }

  @override
  String get toolRunning => 'En ejecución';

  @override
  String get toolFailedLabel => 'Error';

  @override
  String get toolOutput => 'Salida';

  @override
  String get remembered => 'Recordó algo';

  @override
  String skillLoaded(String name) {
    return 'Habilidad cargada: $name';
  }

  @override
  String checkpointSaved(String label) {
    return 'Punto de restauración guardado: $label';
  }

  @override
  String computerState(String state) {
    return 'Computadora: $state';
  }

  @override
  String get activity => 'Actividad';

  @override
  String get timelineTitle => 'Historial de ejecuciones';

  @override
  String get allEvents => 'Todo';

  @override
  String get filterTools => 'Herramientas';

  @override
  String get filterMessages => 'Mensajes';

  @override
  String get filterSystem => 'Sistema';

  @override
  String get restore => 'Restaurar';

  @override
  String get restoreConfirm =>
      '¿Volver a este punto de restauración? Se reemplazarán los archivos modificados desde entonces.';

  @override
  String get restored => 'Punto de restauración restaurado.';

  @override
  String get noRuns => 'Todavía no hay ejecuciones.';

  @override
  String get computerTitle => 'Computadora';

  @override
  String get computerStart => 'Iniciar';

  @override
  String get computerSleep => 'Suspender';

  @override
  String get screen => 'Pantalla';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Archivos';

  @override
  String get noScreen =>
      'Todavía no hay nada en pantalla. La página del navegador del bot aparece aquí.';

  @override
  String get refresh => 'Actualizar';

  @override
  String get upload => 'Subir';

  @override
  String get download => 'Descargar';

  @override
  String get emptyFolder => 'Esta carpeta está vacía';

  @override
  String get noCheckpoints =>
      'Se guardan automáticamente antes de cambios arriesgados, para que puedas deshacerlos.';

  @override
  String get computerAsleep =>
      'La computadora está en reposo. Sus archivos están guardados y despierta cuando hace falta.';

  @override
  String get connectTerminal => 'Conectar';

  @override
  String get terminalDisconnected => 'Desconectado.';

  @override
  String get terminalReconnecting => 'Servidor reiniciándose, reconectando…';

  @override
  String get memory => 'Memoria';

  @override
  String get noMemories => 'Todavía no recuerda nada.';

  @override
  String get noMemoriesMatch => 'Ningún recuerdo coincide.';

  @override
  String get clearSearch => 'Borrar';

  @override
  String get addMemory => 'Agregar recuerdo';

  @override
  String get addMemoryHelp =>
      'Algo que el bot siempre deba saber sobre ti o tu trabajo.';

  @override
  String get addMemoryFactHint =>
      'Por ejemplo: Nuestro año fiscal empieza en abril.';

  @override
  String get addMemoryPreferenceHint =>
      'Por ejemplo: Mantén los resúmenes en menos de cinco viñetas.';

  @override
  String get memoryAdded => 'Recuerdo agregado';

  @override
  String get pin => 'Fijar';

  @override
  String get unpin => 'Desfijar';

  @override
  String get deleteMemoryConfirm => '¿Olvidar esto? No se puede deshacer.';

  @override
  String get skills => 'Habilidades';

  @override
  String get noSkills =>
      'Todavía no hay habilidades. Las habilidades son instrucciones que los bots cargan cuando hacen falta.';

  @override
  String get newSkill => 'Nueva habilidad';

  @override
  String get skillName => 'Nombre (minúsculas, guiones)';

  @override
  String get skillDescription => 'Descripción en una línea';

  @override
  String get skillBody => 'Instrucciones (Markdown)';

  @override
  String get enabled => 'Activada';

  @override
  String get settings => 'Ajustes';

  @override
  String get workspace => 'Espacio de trabajo';

  @override
  String get switchWorkspace => 'Cambiar de espacio de trabajo';

  @override
  String get modelKeys => 'Claves de modelos';

  @override
  String get moreProviders => 'Más proveedores';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, servidores personalizados';

  @override
  String get toolPermissions => 'Permisos de herramientas';

  @override
  String get devicesAdvancedSummary =>
      'Cuánto tiempo se guarda, modelos privados, bots con acceso';

  @override
  String get companionAdvancedSummary =>
      'Comandos, herramientas locales (MCP), agentes de código';

  @override
  String get noKeys => 'Todavía no hay claves de modelos.';

  @override
  String get addKey => 'Agregar clave';

  @override
  String get usage => 'Uso';

  @override
  String get language => 'Idioma';

  @override
  String inviteSent(String email) {
    return 'Invitación enviada a $email.';
  }

  @override
  String get botProfile => 'Perfil del bot';

  @override
  String get groupMembers => 'Bots en este chat';

  @override
  String get groupMembersHelp =>
      'Cada uno conserva su propia memoria y ajustes. Toca uno para abrir su perfil.';

  @override
  String get botAdvancedSummary =>
      'Apps de chat, enlaces, reglas, seguimientos, plugins, actividad';

  @override
  String get botActivityRow => 'Cada ejecución, paso a paso';

  @override
  String get createBotAdvancedSummary => 'Clave de modelo y modelo';

  @override
  String get botProfileSection => 'Perfil';

  @override
  String get botBrain => 'Cerebro';

  @override
  String get botAbilities => 'Capacidades';

  @override
  String get botSchedule => 'Horario';

  @override
  String get chatComputerLive => 'Trabajando en su computadora';

  @override
  String get autonomy => 'Autonomía';

  @override
  String get autonomyAskAlways => 'Preguntar antes de actuar';

  @override
  String get autonomyAskRisky => 'Preguntar en acciones arriesgadas';

  @override
  String get autonomyAutonomous => 'Actuar por su cuenta';

  @override
  String get saved => 'Guardado.';

  @override
  String get justNow => 'justo ahora';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'hace $nString minutos',
      one: 'hace 1 minuto',
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
      other: 'hace $nString horas',
      one: 'hace 1 hora',
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
      other: 'hace $nString días',
      one: 'ayer',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Un bot';

  @override
  String get addIntegration => 'Agregar integración';

  @override
  String get addSecret => 'Agregar secreto';

  @override
  String get allowedHosts => 'Hosts permitidos';

  @override
  String get allowedHostsHelp =>
      'Separados por comas, por ejemplo api.github.com';

  @override
  String get alwaysAllow => 'Permitir siempre';

  @override
  String get approval => 'Aprobación';

  @override
  String get approvalAlreadyDecided =>
      'Esta solicitud ya fue decidida o venció.';

  @override
  String get approvals => 'Aprobaciones';

  @override
  String get approve => 'Aprobar';

  @override
  String get approved => 'Aprobado';

  @override
  String get authHeaderOptional => 'Encabezado de autorización (opcional)';

  @override
  String get authSecretName => 'Nombre del secreto de autenticación (opcional)';

  @override
  String get authSecretNameHelp =>
      'Nombre de un secreto de Ajustes › Secretos, enviado como token bearer';

  @override
  String get baseUrlOptional => 'URL base (opcional)';

  @override
  String get blankBot => 'En blanco';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Elige un modelo';

  @override
  String get createBotNeedsModel =>
      'Elige un modelo arriba para crear este bot.';

  @override
  String get createBotKeyRejected =>
      'El proveedor rechazó esta clave. Revísala en Ajustes → Claves de modelos o elige otra clave.';

  @override
  String get createBotDiscardTitle => '¿Descartar este bot?';

  @override
  String get createBotDiscardBody => 'Lo que ingresaste aquí se perderá.';

  @override
  String get searchModels => 'Busca modelos o escribe un ID de modelo';

  @override
  String get recommendedModels => 'Recomendados';

  @override
  String get allModels => 'Todos los modelos';

  @override
  String useCustomModel(String id) {
    return 'Usar “$id”';
  }

  @override
  String modelListFallback(String reason) {
    return 'Mostrando modelos sugeridos. $reason Aún puedes escribir cualquier ID de modelo.';
  }

  @override
  String get noModelsFound => 'Ningún modelo coincide.';

  @override
  String get addModelKeyFirst =>
      'Agrega primero una clave de modelo. Tu bot la usa para pensar; se guarda cifrada y nunca vuelve a mostrarse.';

  @override
  String get composioToolkits =>
      'Kits de herramientas (separados por comas, por ejemplo github, gmail)';

  @override
  String get copySecret => 'Copiar secreto';

  @override
  String get cronExpression => 'Expresión cron';

  @override
  String get cronHelp => 'minuto hora día mes día_semana';

  @override
  String get denied => 'Denegado';

  @override
  String get deny => 'Denegar';

  @override
  String get everyHour => 'Cada hora';

  @override
  String get expired => 'Vencido';

  @override
  String get inbox => 'Buzón';

  @override
  String get integrationName => 'Nombre';

  @override
  String get integrationNameHelp =>
      'Letras minúsculas, números y guiones bajos';

  @override
  String get integrationType => 'Tipo';

  @override
  String get integrations => 'Integraciones';

  @override
  String get kindMcp => 'Servidor MCP';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Marcar todo como leído';

  @override
  String get newRoutine => 'Nueva rutina';

  @override
  String get noIntegrationsForBot =>
      'Agrega integraciones en Ajustes primero y luego actívalas aquí para este bot.';

  @override
  String get noRoutines => 'Todavía no hay rutinas';

  @override
  String get noSecrets => 'Todavía no hay secretos';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get openInbox => 'Abrir buzón';

  @override
  String get pipedreamApps => 'Apps (separadas por comas)';

  @override
  String get pipedreamClientId => 'ID de cliente';

  @override
  String get pipedreamClientSecret => 'Secreto de cliente';

  @override
  String get pipedreamProject => 'ID de proyecto';

  @override
  String get riskHigh => 'Riesgo alto';

  @override
  String get riskLow => 'Riesgo bajo';

  @override
  String get riskMedium => 'Riesgo medio';

  @override
  String get routineGithub => 'En eventos de GitHub';

  @override
  String get routineInstructions => 'Instrucciones';

  @override
  String get routineInstructionsHint => '¿Qué debe hacer el bot cada vez?';

  @override
  String get routineName => 'Nombre';

  @override
  String get routineEditTitle => 'Editar rutina';

  @override
  String get routineEditSubtitle => 'Cambia qué hace y cuándo se ejecuta.';

  @override
  String get routineRecentRuns => 'Ejecuciones recientes';

  @override
  String get routineNoRuns => 'Todavía no se ha ejecutado.';

  @override
  String get routineSaved => 'Rutina guardada';

  @override
  String get routineStarted => 'Rutina iniciada';

  @override
  String get routineWebhook => 'En webhook';

  @override
  String get routines => 'Rutinas';

  @override
  String get routineAdvancedSummary =>
      'Activadores de GitHub y webhook, cron, zona horaria';

  @override
  String get routineRepeatDaily => 'Todos los días';

  @override
  String get routineRepeatWeekdays => 'Días hábiles';

  @override
  String get routineRepeatWeekly => 'Cada semana';

  @override
  String get routineDay => 'Día';

  @override
  String get routineTimeLabel => 'Hora';

  @override
  String get routineRunsAt => 'Se ejecuta a las';

  @override
  String routineTimesIn(String timezone) {
    return 'Los horarios están en $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Personalizado: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Otros activadores';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Cada $nString minutos',
      one: 'Cada minuto',
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
      other: 'Cada $nString horas',
      one: 'Cada hora',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Cada hora al minuto :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Todos los días a las $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Días hábiles a las $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Fines de semana a las $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days a las $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Día $day de cada mes a las $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items y $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Domingos',
      'mon': 'Lunes',
      'tue': 'Martes',
      'wed': 'Miércoles',
      'thu': 'Jueves',
      'fri': 'Viernes',
      'sat': 'Sábados',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Domingo',
      'mon': 'Lunes',
      'tue': 'Martes',
      'wed': 'Miércoles',
      'thu': 'Jueves',
      'fri': 'Viernes',
      'sat': 'Sábado',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Ve a tu bot trabajar en vivo';

  @override
  String get headlessScreenEmpty =>
      'Para ser más ligera, esta computadora funciona solo con navegador. Aquí verás sus páginas web cuando abra una. Cambia a un escritorio para ver y controlar también las apps.';

  @override
  String get headlessScreenChecking => 'Buscando páginas cada pocos segundos';

  @override
  String get headlessBrowserOnly => 'Solo navegador';

  @override
  String get switchedToDesktopHere =>
      'Cambiado a Escritorio. Su pantalla se mostrará aquí en cuanto inicie.';

  @override
  String get desktopBarLabel => 'Escritorio · usa más memoria';

  @override
  String get switchToBrowserOnly => 'Cambiar a solo navegador';

  @override
  String get switchingToBrowserOnly => 'Cambiando a solo navegador…';

  @override
  String get switchedToBrowserOnly =>
      'Cambiado a solo navegador. Ahora usa menos memoria.';

  @override
  String get runNow => 'Ejecutar ahora';

  @override
  String get secretName => 'Nombre';

  @override
  String get secretNameHelp => 'Mayúsculas, por ejemplo GITHUB_TOKEN';

  @override
  String get secretValue => 'Valor';

  @override
  String get secrets => 'Secretos';

  @override
  String get serverUrl => 'URL del servidor';

  @override
  String get specUrl => 'URL de especificación OpenAPI';

  @override
  String get startFrom => 'Personalidad';

  @override
  String get storedEncrypted => 'Guardado cifrado; nunca vuelve a mostrarse';

  @override
  String get taskBlocked => 'Bloqueado';

  @override
  String get taskDoing => 'En progreso';

  @override
  String get taskDone => 'Listo';

  @override
  String get taskTodo => 'Por hacer';

  @override
  String get test => 'Probar';

  @override
  String get timezone => 'Zona horaria';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Se repite';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Ver ejecución';

  @override
  String get webhookCreated => 'Webhook creado';

  @override
  String get webhookSecret => 'Secreto de firma';

  @override
  String get webhookShownOnce =>
      'Copia el secreto de firma ahora. Solo se muestra una vez.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Error de conexión: $error';
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
      other: 'Conectado, $nString herramientas',
      one: 'Conectado, 1 herramienta',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Siguiente: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Solo se envía a $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'solicitado $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Incluye rutinas: $names.';
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
      other: '$nString herramientas',
      one: '1 herramienta',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'El bot volvió a tener el control';

  @override
  String get botComputer => 'Computadora';

  @override
  String get botComputerDefault =>
      'Su computadora privada si tiene una; de lo contrario, la computadora del equipo';

  @override
  String get botInControl => 'El bot tiene el control';

  @override
  String get computerName => 'Nombre';

  @override
  String get computers => 'Computadoras';

  @override
  String get connectingLive => 'Conectando…';

  @override
  String get dismiss => 'Descartar';

  @override
  String get renameTopic => 'Renombrar';

  @override
  String get library => 'Biblioteca';

  @override
  String get navLibrary => 'Biblioteca';

  @override
  String get librarySearchHint => 'Buscar en la Biblioteca';

  @override
  String get libraryFilterAll => 'Todo';

  @override
  String get libraryFilterPages => 'Sitios y juegos';

  @override
  String get libraryFilterImages => 'Imágenes';

  @override
  String get libraryFilterVideos => 'Videos';

  @override
  String get libraryFilterAudio => 'Audio';

  @override
  String get libraryFilterDocuments => 'Documentos';

  @override
  String get libraryFilterFiles => 'Archivos';

  @override
  String get creationKindPage => 'Página';

  @override
  String get creationKindImage => 'Imagen';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Audio';

  @override
  String get creationKindDocument => 'Documento';

  @override
  String get creationKindFile => 'Archivo';

  @override
  String get libraryPinned => 'Fijado';

  @override
  String get libraryToday => 'Hoy';

  @override
  String get libraryYesterday => 'Ayer';

  @override
  String get libraryThisWeek => 'Esta semana';

  @override
  String get libraryEarlier => 'Antes';

  @override
  String get videoCantPlay =>
      'Este video no se puede reproducir en este dispositivo.';

  @override
  String get libraryEmptyTitle => '¿Qué creamos primero?';

  @override
  String get libraryEmptyBody =>
      'Elige una opción y tu bot empieza. Todo lo que hacen tus bots aparece aquí por sí solo.';

  @override
  String get libraryNoMatch => 'Nada coincide aquí.';

  @override
  String get libraryStarterGame => 'Un juego pequeño';

  @override
  String get libraryStarterGamePrompt =>
      'Hazme un juego pequeño que pueda jugar en el navegador.';

  @override
  String get libraryStarterLogo => 'Un logotipo';

  @override
  String get libraryStarterLogoPrompt => 'Diseña un logotipo para mi proyecto.';

  @override
  String get libraryStarterSite => 'Un sitio de una página';

  @override
  String get libraryStarterSitePrompt =>
      'Haz un sitio web de una página para mi negocio.';

  @override
  String get libraryStarterVideo => 'Un video corto';

  @override
  String get libraryStarterVideoPrompt => 'Haz un video corto de ';

  @override
  String get libraryStarterCard => 'Una tarjeta de cumpleaños';

  @override
  String get libraryStarterCardPrompt => 'Haz una tarjeta de cumpleaños para ';

  @override
  String get libraryStarterReport => 'Un informe';

  @override
  String get libraryStarterReportPrompt =>
      'Investiga y escribe un informe sobre ';

  @override
  String get libraryStarterElse => 'Otra cosa…';

  @override
  String get creationOpen => 'Abrir';

  @override
  String get creationPlay => 'Reproducir';

  @override
  String get creationView => 'Ver';

  @override
  String get creationChangeIt => 'Cambiarlo';

  @override
  String creationChangeDraft(String title) {
    return 'Sobre “$title”: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Hecho por $bot';
  }

  @override
  String creationVersion(int n) {
    return 'versión $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'De tu chat con $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Hecho por $bot';
  }

  @override
  String get creationFromHelp => 'Ir a la conversación';

  @override
  String get creationDetails => 'Detalles';

  @override
  String get creationAlongside => 'Hecho junto con';

  @override
  String creationDeleted(String title) {
    return 'Se eliminó “$title”';
  }

  @override
  String get showInLibrary => 'Mostrar en la Biblioteca';

  @override
  String get pinInLibrary => 'Fijar en la Biblioteca';

  @override
  String get libraryItemNotFound =>
      'Eso todavía no está en la Biblioteca. Inténtalo de nuevo en un momento.';

  @override
  String creationPinned(String title) {
    return 'Se fijó “$title”';
  }

  @override
  String creationUnpinned(String title) {
    return 'Se desfijó “$title”';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Actualizado · versión $version';
  }

  @override
  String get madeHere => 'Hecho aquí';

  @override
  String madeHereEmpty(String bot) {
    return '$bot todavía no ha creado nada.';
  }

  @override
  String get madeHereThisChat => 'En este chat';

  @override
  String madeHereByBot(String bot) {
    return 'Hecho por $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Otras cosas que creó $bot';
  }

  @override
  String madeHereCount(String count) {
    return 'Hecho aquí ($count)';
  }

  @override
  String get sidePanelComputer => 'Computadora';

  @override
  String get madeForTicket => 'Hecho para este ticket';

  @override
  String get libraryCantChangePicked =>
      'Solo la persona para quien se creó o quienes administran el bot pueden cambiar esto.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos eliminados',
      one: '1 elemento eliminado',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionados',
      one: '1 seleccionado',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Más reciente';

  @override
  String get librarySortOpened => 'Abiertos recientemente';

  @override
  String get librarySortName => 'Nombre';

  @override
  String get libraryScopeMine => 'Hecho para mí';

  @override
  String get libraryScopeWorkspace => 'Todo el espacio de trabajo';

  @override
  String get libraryFilterSort => 'Ordenar y filtrar';

  @override
  String get creationWhoCanSee => 'Quién puede verlo';

  @override
  String get libraryTile => 'Biblioteca';

  @override
  String get libraryTileHelp => 'Lo que creó';

  @override
  String get regenerateReply => 'Regenerar';

  @override
  String get deleteMessage => 'Eliminar mensaje';

  @override
  String get deleteMessageTitle => '¿Eliminar este mensaje?';

  @override
  String get deleteMessageBody =>
      'Se elimina para todos en este chat. Los mensajes alrededor se quedan.';

  @override
  String get messageDeleted => 'Mensaje eliminado';

  @override
  String get findInChat => 'Buscar en el chat';

  @override
  String get findInChatHint => 'Buscar en este chat';

  @override
  String findInChatCount(int index, int count) {
    return '$index de $count';
  }

  @override
  String get findInChatNone => 'Sin coincidencias';

  @override
  String get findPrevious => 'Coincidencia anterior';

  @override
  String get findNext => 'Siguiente coincidencia';

  @override
  String get closeFind => 'Cerrar búsqueda';

  @override
  String get pinTopic => 'Fijar';

  @override
  String get unpinTopic => 'Desfijar';

  @override
  String get inAppAlertReview => 'Revisar';

  @override
  String get forBot => 'Para bot';

  @override
  String get handBack => 'Devolver el control';

  @override
  String get handBackNote => 'Nota para el bot (opcional)';

  @override
  String get handBackNoteHint => 'Por ejemplo: Ya inicié sesión, continúa';

  @override
  String get live => 'En vivo';

  @override
  String get liveView => 'Vista en vivo';

  @override
  String get liveViewHelp =>
      'Ve esta computadora en vivo y toma el control cuando haga falta.';

  @override
  String get newComputer => 'Nueva computadora';

  @override
  String get newComputerHelp =>
      'Una computadora privada pertenece a un solo bot. Sus archivos se mantienen separados de la computadora del equipo.';

  @override
  String get openLiveView => 'Abrir vista en vivo';

  @override
  String get liveExpand => 'Pantalla completa';

  @override
  String get liveCopy => 'Copiar';

  @override
  String get liveScreenshot => 'Captura';

  @override
  String get liveScreenshots => 'Capturas';

  @override
  String get liveScreenshotsHelp =>
      'El video en vivo no pasa por esta red, así que la pantalla se actualiza aproximadamente una vez por segundo.';

  @override
  String get liveReconnecting => 'Reconectando…';

  @override
  String get liveReconnectingHelp =>
      'Se cortó el video en vivo (puede que el servidor se esté reiniciando). Reintentando; mientras tanto se muestran capturas.';

  @override
  String get liveTryAgain => 'Reintentar';

  @override
  String get liveDroppedHelp =>
      'El video en vivo no pudo volver, así que la pantalla se actualiza aproximadamente una vez por segundo. Toca Reintentar.';

  @override
  String get liveMore => 'Más';

  @override
  String get liveSaveScreenshot => 'Guardar captura';

  @override
  String get liveCopyFromComputer => 'Copiar desde la computadora';

  @override
  String get livePasteToComputer => 'Pegar en la computadora';

  @override
  String get liveRotateHint =>
      'Gira tu teléfono de lado para ver una pantalla más grande';

  @override
  String get liveWatching => 'Viendo';

  @override
  String get liveCopied => 'Copiado desde la computadora.';

  @override
  String get liveNothingCopied =>
      'No se copió nada. Selecciona algo en la computadora primero.';

  @override
  String get livePasteEmpty => 'Tu portapapeles está vacío.';

  @override
  String get liveMinimize => 'Volver al panel lateral';

  @override
  String get liveShownFullScreen =>
      'La vista en vivo está abierta en pantalla completa.';

  @override
  String get liveStillWatching => '¿Sigues viendo?';

  @override
  String get liveStillWatchingHelp =>
      'La computadora entra en reposo cuando nadie mira, para ahorrar energía.';

  @override
  String get liveKeepWatching => 'Seguir viendo';

  @override
  String get livePausedToSavePower => 'En pausa para ahorrar energía';

  @override
  String get livePausedToSavePowerHelp =>
      'Nadie estaba mirando, así que la computadora puede descansar. Reanudar la despierta de nuevo.';

  @override
  String get liveResume => 'Reanudar';

  @override
  String get paused => 'En pausa';

  @override
  String get pausedUserInControl =>
      'En pausa: una persona tiene el control de la pantalla';

  @override
  String get letBotUseTerminal => 'Dejar que use la terminal y los archivos';

  @override
  String get screenHandedBack => 'Se devolvió el control de la pantalla';

  @override
  String get privateComputer => 'Computadora privada';

  @override
  String get profileDesktop => 'Escritorio';

  @override
  String get profileHeadless => 'Sin escritorio';

  @override
  String get rename => 'Renombrar';

  @override
  String get rightClickNextTap => 'Clic derecho al siguiente toque';

  @override
  String get screenshotMode =>
      'Capturas (video en vivo no disponible en esta red)';

  @override
  String get showKeyboard => 'Teclado';

  @override
  String get someoneElseInControl => 'Alguien más tiene el control';

  @override
  String get switchToDesktop => 'Cambiar a Escritorio';

  @override
  String get switchToHeadless => 'Cambiar a Sin escritorio';

  @override
  String get switchProfileConfirm =>
      'La computadora se reinicia para cambiar. Tus archivos se conservan, pero todo lo que esté ejecutándose ahora se detiene.';

  @override
  String get switchProfileButton => 'Cambiar';

  @override
  String get switchingToDesktop => 'Cambiando a Escritorio…';

  @override
  String get switchingToHeadless => 'Cambiando a Sin escritorio…';

  @override
  String get switchedToDesktop =>
      'Cambiado a Escritorio. Abre la vista en vivo para ver su pantalla.';

  @override
  String get switchedToHeadless =>
      'Se cambió a Sin escritorio. Ahora usa menos memoria.';

  @override
  String get takeControl => 'Tomar el control';

  @override
  String get takeoverCompleted => 'Control devuelto';

  @override
  String get takeoverDismissed => 'Rechazado';

  @override
  String get takeoverPrivacy =>
      'Mientras tienes el control, el bot está en pausa y nada de lo que escribes o ves se le envía.';

  @override
  String get liveShellOnTooltip =>
      'Deja que el bot siga usando su terminal y archivos mientras tienes el control';

  @override
  String get liveShellOffTooltip =>
      'Pausa también la terminal y los archivos del bot mientras tienes el control';

  @override
  String get liveShellOnNote =>
      'El bot puede seguir usando su terminal y archivos. Aún no puede ver ni usar la pantalla hasta que devuelvas el control.';

  @override
  String get liveShellOffNote =>
      'El bot está completamente en pausa hasta que devuelvas el control.';

  @override
  String get teamComputer => 'Computadora del equipo';

  @override
  String get withDesktop => 'Con escritorio';

  @override
  String get withDesktopHelp =>
      'Agrega una pantalla que puedes ver en vivo; usa más memoria';

  @override
  String get youAreInControl => 'Tú tienes el control';

  @override
  String botAsksForHelp(String reason) {
    return 'El bot pregunta: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot necesita tu ayuda';
  }

  @override
  String deleteComputerConfirm(String name) {
    return '¿Eliminar $name? Sus archivos, instantáneas y puntos de restauración también se eliminan.';
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
    return 'Computadora de $bot';
  }

  @override
  String get micPermissionNeeded =>
      'Permite el acceso al micrófono para dictar.';

  @override
  String get dictationEmpty => 'No se captó voz. Inténtalo de nuevo.';

  @override
  String get startCall => 'Iniciar una llamada de voz';

  @override
  String get stopDictation => 'Detener y transcribir';

  @override
  String get dictate => 'Dictar';

  @override
  String get dictateOnDevice => 'Dictar con este dispositivo';

  @override
  String get stopListening => 'Dejar de escuchar';

  @override
  String get dictationRetry => 'Reintentar';

  @override
  String get dictationSayAgain => 'Dilo otra vez';

  @override
  String get dictationFailed => 'No se pudo convertir eso en texto.';

  @override
  String get dictationFailedUseDevice =>
      'No se pudo convertir eso en texto. Dilo otra vez y tu dispositivo escuchará.';

  @override
  String get dictationNoServiceUseDevice =>
      'El dictado no está configurado para este espacio de trabajo. Tu dispositivo puede escuchar en su lugar.';

  @override
  String get dictationDeviceFailed =>
      'El dictado de tu dispositivo dejó de funcionar, así que el micrófono volvió al de Casama.';

  @override
  String get dictationDevicePermission =>
      'Permite el reconocimiento de voz para dictar con este dispositivo.';

  @override
  String get readAloud => 'Leer en voz alta';

  @override
  String get callConnecting => 'Conectando…';

  @override
  String get callLive => 'En vivo';

  @override
  String get callEnded => 'Llamada finalizada';

  @override
  String get callEndedIdle =>
      'Se finalizó la llamada tras 2 minutos de silencio.';

  @override
  String get callFailed => 'No se pudo conectar la llamada.';

  @override
  String get callListening => 'Escuchando';

  @override
  String get callSpeaking => 'Hablando';

  @override
  String get callWorking => 'Trabajando en ello';

  @override
  String get callMutedState => 'Silenciado';

  @override
  String get callCaptions => 'Subtítulos';

  @override
  String get callSpeaker => 'Altavoz';

  @override
  String get callEarpiece => 'Teléfono';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Audífonos';

  @override
  String get callAudioOutput => 'Reproducir la llamada por';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Cambiando su foto',
      'memory_search': 'Buscando en tus recuerdos',
      'memory_write': 'Guardando eso en memoria',
      'memory': 'Actualizando su memoria',
      'knowledge_search': 'Buscando en tu conocimiento',
      'web_search': 'Buscando en la web',
      'web': 'Leyendo una página web',
      'browser_open': 'Abriendo un sitio web',
      'browser_click': 'Haciendo clic en la página',
      'browser_type': 'Escribiendo en la página',
      'browser_press': 'Presionando una tecla',
      'browser_scroll': 'Desplazándose por la página',
      'browser_look': 'Mirando la página',
      'desktop_click': 'Haciendo clic en la pantalla',
      'desktop_type': 'Escribiendo',
      'desktop_press': 'Presionando teclas',
      'desktop_launch': 'Abriendo una app',
      'desktop_look': 'Mirando la pantalla',
      'shell': 'Trabajando en su computadora',
      'files_read': 'Leyendo un archivo',
      'files_write': 'Escribiendo un archivo',
      'files_list': 'Revisando archivos',
      'files_search': 'Buscando archivos',
      'files_from_chat': 'Obteniendo un archivo del chat',
      'http': 'Contactando un servicio',
      'data_search': 'Buscando datos',
      'data_call': 'Obteniendo datos',
      'skills_load': 'Preparando una habilidad',
      'skills_create': 'Aprendiendo una nueva habilidad',
      'skills_update': 'Mejorando una habilidad',
      'checkpoint': 'Guardando un punto de control',
      'computer_restart': 'Reiniciando su computadora',
      'takeover': 'Pidiéndote que tomes el control',
      'delegate': 'Pidiendo ayuda a un asistente',
      'routines_list': 'Revisando tus rutinas',
      'routines_create': 'Configurando una rutina',
      'routines_update': 'Actualizando una rutina',
      'routines_delete': 'Quitando una rutina',
      'watchers_create': 'Configurando un seguimiento',
      'watchers_list': 'Revisando tus seguimientos',
      'watchers_delete': 'Quitando un seguimiento',
      'tasks_list': 'Revisando tus tareas',
      'tasks_create': 'Agregando una tarea',
      'tasks': 'Actualizando tus tareas',
      'notify_user': 'Enviándote una nota',
      'usage_report': 'Revisando el uso',
      'device_read': 'Leyendo datos de tu dispositivo',
      'device_access': 'Pidiendo acceso al dispositivo',
      'pages_publish': 'Publicando una página',
      'pages': 'Actualizando una página',
      'media': 'Creando una imagen',
      'media_video': 'Creando un video',
      'bots_create': 'Creando un nuevo bot',
      'bots_update': 'Actualizando un bot',
      'bots_list': 'Revisando tus bots',
      'bots_archive': 'Archivando un bot',
      'channel_send': 'Enviando un mensaje',
      'links_ask': 'Preguntando al asistente de un contacto',
      'logins_list': 'Revisando inicios de sesión guardados',
      'replay_run': 'Repitiendo pasos guardados',
      'replay_save': 'Guardando estos pasos',
      'setup_apply': 'Sugiriendo una configuración',
      'sidebar_organize': 'Organizando tu barra lateral',
      'suggestions_add': 'Agregando una sugerencia',
      'teach_save_draft': 'Guardando un borrador de habilidad',
      'welcome_name': 'Eligiendo un nombre',
      'secrets_request': 'Pidiéndote un secreto',
      'pages_list': 'Revisando tus páginas',
      'pages_share': 'Cambiando quién puede ver una página',
      'projects_create': 'Iniciando un proyecto',
      'projects_status': 'Revisando un proyecto',
      'projects_update': 'Actualizando un proyecto',
      'projects': 'Planificando un proyecto',
      'payments': 'Pidiendo hacer un pago',
      'voice_call': 'Llamando a un negocio',
      'voice_call_user': 'Llamándote',
      'tools_load': 'Preparándose',
      'ui_show': 'Mostrándote algo',
      'start_task': 'Iniciando esto en el chat',
      'adult_sites_turn_on': 'Pidiendo activar sitios para adultos',
      'connections_attach': 'Empezando a usar una app',
      'other': 'Trabajando en ello',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Cambió su foto',
      'memory_search': 'Buscó en tus recuerdos',
      'memory_write': 'Guardó en memoria',
      'memory': 'Actualizó su memoria',
      'knowledge_search': 'Buscó en tu conocimiento',
      'web_search': 'Buscó en la web',
      'web': 'Leyó una página web',
      'browser_open': 'Abrió un sitio web',
      'browser_click': 'Hizo clic en la página',
      'browser_type': 'Escribió en la página',
      'browser_press': 'Presionó una tecla',
      'browser_scroll': 'Se desplazó por la página',
      'browser_look': 'Miró la página',
      'desktop_click': 'Hizo clic en la pantalla',
      'desktop_type': 'Escribió',
      'desktop_press': 'Presionó teclas',
      'desktop_launch': 'Abrió una app',
      'desktop_look': 'Miró la pantalla',
      'shell': 'Trabajó en su computadora',
      'files_read': 'Leyó un archivo',
      'files_write': 'Escribió un archivo',
      'files_list': 'Revisó archivos',
      'files_search': 'Buscó archivos',
      'files_from_chat': 'Obtuvo un archivo del chat',
      'http': 'Contactó un servicio',
      'data_search': 'Buscó datos',
      'data_call': 'Obtuvo datos',
      'skills_load': 'Usó una habilidad',
      'skills_create': 'Aprendió una nueva habilidad',
      'skills_update': 'Mejoró una habilidad',
      'checkpoint': 'Guardó un punto de control',
      'computer_restart': 'Reinició su computadora',
      'takeover': 'Te pidió que tomaras el control',
      'delegate': 'Pidió ayuda a un asistente',
      'routines_list': 'Revisó tus rutinas',
      'routines_create': 'Configuró una rutina',
      'routines_update': 'Actualizó una rutina',
      'routines_delete': 'Quitó una rutina',
      'watchers_create': 'Configuró un seguimiento',
      'watchers_list': 'Revisó tus seguimientos',
      'watchers_delete': 'Quitó un seguimiento',
      'tasks_list': 'Revisó tus tareas',
      'tasks_create': 'Agregó una tarea',
      'tasks': 'Actualizó tus tareas',
      'notify_user': 'Te envió una nota',
      'usage_report': 'Revisó el uso',
      'device_read': 'Leyó datos de tu dispositivo',
      'device_access': 'Pidió acceso al dispositivo',
      'pages_publish': 'Publicó una página',
      'pages': 'Actualizó una página',
      'media': 'Creó una imagen',
      'media_video': 'Creó un video',
      'bots_create': 'Creó un nuevo bot',
      'bots_update': 'Actualizó un bot',
      'bots_list': 'Revisó tus bots',
      'bots_archive': 'Archivó un bot',
      'channel_send': 'Envió un mensaje',
      'links_ask': 'Preguntó al asistente de un contacto',
      'logins_list': 'Revisó inicios de sesión guardados',
      'replay_run': 'Repitió pasos guardados',
      'replay_save': 'Guardó estos pasos',
      'setup_apply': 'Sugirió una configuración',
      'sidebar_organize': 'Organizó tu barra lateral',
      'suggestions_add': 'Agregó una sugerencia',
      'teach_save_draft': 'Guardó un borrador de habilidad',
      'welcome_name': 'Eligió un nombre',
      'secrets_request': 'Te pidió un secreto',
      'pages_list': 'Revisó tus páginas',
      'pages_share': 'Cambió quién puede ver una página',
      'projects_create': 'Inició un proyecto',
      'projects_status': 'Revisó un proyecto',
      'projects_update': 'Actualizó un proyecto',
      'projects': 'Planificó un proyecto',
      'payments': 'Pidió hacer un pago',
      'voice_call': 'Llamó a un negocio',
      'voice_call_user': 'Te llamó',
      'tools_load': 'Se preparó',
      'ui_show': 'Te mostró algo',
      'start_task': 'Inició en el chat',
      'adult_sites_turn_on': 'Pidió activar sitios para adultos',
      'connections_attach': 'Empezó a usar una app',
      'other': 'Listo',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Usando $app';
  }

  @override
  String toolUsedApp(String app) {
    return 'Usó $app';
  }

  @override
  String get toolDetails => 'Detalles';

  @override
  String approvalAsking(String bot) {
    return '$bot te pregunta antes';
  }

  @override
  String get approvalLookClosely => 'Fíjate bien antes de permitir esto';

  @override
  String approvalAttachConnection(String app) {
    return 'Empezar a usar $app, ya conectada en este espacio de trabajo';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Dejar que $bot haga esto sin preguntar';
  }

  @override
  String get pageShareToPublic => 'Cualquiera con el enlace podrá abrirlo';

  @override
  String get pageShareToWorkspace =>
      'Todos en este espacio de trabajo podrán abrirlo';

  @override
  String get pageShareToPrivate => 'Solo tú podrás abrirlo';

  @override
  String approvalAllowedLine(String what) {
    return 'Permitido: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Rechazado: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Sin respuesta a tiempo: $what';
  }

  @override
  String get callToolFailed => 'Eso no funcionó';

  @override
  String get callToolNeedsOk => 'Necesita tu confirmación para seguir';

  @override
  String get callToolAllow => 'Permitir';

  @override
  String get callToolNotNow => 'Ahora no';

  @override
  String get callToolAllowed => 'Permitido. El resultado aparecerá en el chat';

  @override
  String get callToolDeclined => 'Dijiste ahora no';

  @override
  String get callToolBackground =>
      'Aún trabajando. El resultado aparecerá en el chat';

  @override
  String get callToolInChat => 'El resultado aparecerá en el chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString s';
  }

  @override
  String get callNeedsKeyTitle =>
      'Las llamadas necesitan una clave de IA de Google';

  @override
  String get callNeedsKeyBody =>
      'Las llamadas en vivo funcionan con Gemini Live de Google, por lo que este espacio de trabajo necesita una clave de IA de Google. Solo se usa para llamadas: la lectura en voz alta, el dictado, las imágenes y el video funcionan con OpenRouter. Google te da una gratis en AI Studio: créala ahí, agrégala en Claves de modelos y las llamadas funcionarán enseguida. Solo quienes son propietarios o administradores del espacio de trabajo pueden agregar claves.';

  @override
  String get callAddKey => 'Agregar una clave de IA de Google';

  @override
  String get callGetFreeKey => 'Obtén una clave gratis de Google';

  @override
  String get callMicUnmute => 'Activar mic';

  @override
  String get videoUnmute => 'Activar sonido';

  @override
  String get callMicMute => 'Silenciar mic';

  @override
  String get videoMute => 'Silenciar sonido';

  @override
  String get hangUp => 'Colgar';

  @override
  String callWith(String bot) {
    return 'Llamada con $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return '¿Terminar la llamada con $from y llamar a $to?';
  }

  @override
  String get callSwitchBody =>
      'Solo puedes estar en una llamada a la vez. La llamada actual se guarda primero en su chat.';

  @override
  String get callSwitchConfirm => 'Terminar y llamar';

  @override
  String get callVoiceConsentTitle => 'Tu voz va a Google';

  @override
  String get callVoiceConsentBody =>
      'En una llamada, Casama envía tu voz y lo que dices a Google Gemini, que te escucha y dice en voz alta las respuestas de tu bot. Las palabras de la llamada también van al modelo de IA que usa tu bot, mediante OpenRouter. No se envía nada hasta que aceptes. Puedes detener esto en cualquier momento en Ajustes › Privacidad.';

  @override
  String get callVoiceConsentAgree => 'Aceptar y llamar';

  @override
  String get callVoiceConsentNotNow => 'Ahora no';

  @override
  String get callEndedLost =>
      'La llamada terminó porque se perdió la conexión por demasiado tiempo.';

  @override
  String get callMinimize => 'Minimizar';

  @override
  String get callEndCall => 'Finalizar llamada';

  @override
  String get callEndAndAnswer => 'Finalizar y contestar';

  @override
  String get callReconnecting => 'Reconectando…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutos',
      one: '1 minuto',
      zero: 'menos de un minuto',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Llamada con $bot, $time, toca para volver';
  }

  @override
  String callReturnBar(String bot) {
    return 'En llamada con $bot, toca para volver';
  }

  @override
  String get callOpen => 'Abrir llamada';

  @override
  String get callOnHold => 'En espera';

  @override
  String get callNotificationLive => 'En una llamada';

  @override
  String get callNotificationMuted => 'Silenciada';

  @override
  String get callNotificationChannel => 'Llamadas';

  @override
  String callTabTitle(String time) {
    return 'En llamada · $time';
  }

  @override
  String get callMenuShow => 'Mostrar llamada';

  @override
  String get callJobWorking => 'Trabajando en ello';

  @override
  String callJobStrip(String task) {
    return 'Trabajando en: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Te necesita: $task';
  }

  @override
  String get callTileWatching => 'Vista en vivo';

  @override
  String get callTileDone => 'Listo';

  @override
  String get callTileNeedsYou => 'Te necesita';

  @override
  String callTileLabel(String state) {
    return 'Pantalla del bot, $state. Toca para verla en tamaño completo';
  }

  @override
  String get callTileHide => 'Ocultar pantalla';

  @override
  String get screenCardLive => 'en vivo';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Pantalla de $bot, $state';
  }

  @override
  String get screenCardOpen => 'Abrir en pantalla completa';

  @override
  String get screenCardYouHave => 'Tú controlas la pantalla';

  @override
  String screenCardHeldBy(String name) {
    return '$name controla la pantalla';
  }

  @override
  String get screenCardMore => 'Más opciones';

  @override
  String screenCardIntro(String bot) {
    return 'Pantalla de $bot. Toca para ver, arrastra para mover.';
  }

  @override
  String get screenCardHideForNow => 'Ocultar por ahora';

  @override
  String get screenCardDontShow => 'No mostrar automáticamente';

  @override
  String get screenCardTurnedOff =>
      'La tarjeta de pantalla está desactivada. Actívala de nuevo en Ajustes.';

  @override
  String get screenCardOfferOff =>
      '¿Ocultas mucho la tarjeta de pantalla? Puedes desactivarla.';

  @override
  String get screenCardTurnOff => 'Desactivar';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot te necesita en la pantalla';
  }

  @override
  String callRecapTitle(String length) {
    return 'Llamada · $length';
  }

  @override
  String get callRecapStarted => 'Iniciada en la llamada';

  @override
  String get callRecapTaskDone => 'Listo';

  @override
  String get callRecapTaskFailed => 'No terminó';

  @override
  String get callRecapTaskStopped => 'Detenida';

  @override
  String get callRecapTaskRunning => 'Aún trabajando';

  @override
  String get callRecapOpenRun => 'Ver qué hizo';

  @override
  String get summarizeCalls => 'Resumir llamadas';

  @override
  String get summarizeCallsHelp =>
      'Después de cada llamada, su tarjeta dice de qué trató y qué sigue. Usa un poco del modelo pequeño del bot.';

  @override
  String callCardVoice(String length) {
    return 'Llamada de voz · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Llamada telefónica · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Llamada cortada · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Llamada perdida de $name';
  }

  @override
  String callCardLive(String name) {
    return 'En llamada con $name';
  }

  @override
  String get callCardLiveElsewhere => 'En llamada en otro dispositivo';

  @override
  String get callCardReturn => 'Volver a la llamada';

  @override
  String callCardBotHungUp(String name) {
    return '$name colgó';
  }

  @override
  String get callCardEndedQuiet => 'Terminó tras un rato en silencio';

  @override
  String get callCardEndedLimit => 'Terminó al alcanzar el límite de llamada';

  @override
  String get callCardWritingSummary => 'Escribiendo un resumen…';

  @override
  String callCardSummaryBy(String name) {
    return 'Resumen de $name';
  }

  @override
  String get callCardNextSteps => 'Próximos pasos';

  @override
  String get callCardDoIt => 'Hacerlo';

  @override
  String get callCardDismissStep => 'Descartar';

  @override
  String get callCardStepStarted => 'Iniciado';

  @override
  String get callCardStepFailed =>
      'No se pudo iniciar eso. Inténtalo de nuevo.';

  @override
  String get callCardDoneOnCall => 'Hecho en la llamada';

  @override
  String callCardMore(int count) {
    return '$count más';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Transcripción · $count turnos',
      one: 'Transcripción · 1 turno',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Transcripción';

  @override
  String get callCardSearchTranscript => 'Buscar en la transcripción';

  @override
  String get callCardNoMatches => 'Sin coincidencias';

  @override
  String get callCardYou => 'Tú';

  @override
  String get callCardCallBack => 'Volver a llamar';

  @override
  String get callCardCopy => 'Copiar';

  @override
  String get callCardCopied => 'Copiado';

  @override
  String get callCardShare => 'Compartir';

  @override
  String get callCardMoreActions => 'Más';

  @override
  String get callCardDelete => 'Eliminar llamada';

  @override
  String get callCardDeleteTitle => '¿Eliminar esta llamada?';

  @override
  String get callCardDeleteBody =>
      'Su tarjeta y transcripción se eliminan de este chat. Los trabajos que inició conservan sus resultados.';

  @override
  String get callCardDeleted => 'Llamada eliminada';

  @override
  String get callCardDeleteFailed => 'No se pudo eliminar la llamada';

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

    return 'Respuesta iniciada en $msString ms';
  }

  @override
  String get voiceSettings => 'Voz';

  @override
  String get voiceSettingsHelp =>
      'Voz para leer en voz alta y herramientas que tiene un bot en las llamadas';

  @override
  String get callTools => 'Herramientas en llamadas';

  @override
  String get callToolsHelp =>
      'Las llamadas ya incluyen memoria, búsqueda web, notas para ti, rutinas y tickets, y pasan trabajos más grandes al chat. Agrega herramientas de apps conectadas que el bot deba usar en vivo; cada una suma un poco al costo de cada llamada.';

  @override
  String get callToolsNone =>
      'Este bot todavía no tiene apps conectadas activadas. Activa una en sus Integraciones y luego elige sus herramientas aquí.';

  @override
  String get openIntegrations => 'Abrir integraciones';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString herramientas de apps conectadas agregadas',
      one: '1 herramienta de app conectada agregada',
      zero: 'Solo las herramientas de voz integradas',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'ID de voz (opcional)';

  @override
  String get voiceIdHelp =>
      'Un nombre de voz de Gemini, como Kore o Puck; vacío usa Kore';

  @override
  String get useThisComputer => 'Usar esta computadora para bots';

  @override
  String get companionDesktopOnly =>
      'Solo la app de escritorio (macOS, Windows, Linux) puede actuar como computadora de bot.';

  @override
  String get companionIntro =>
      'Deja que los bots elegidos trabajen en esta computadora: que ejecuten comandos, editen archivos en las carpetas que elijas, naveguen y usen apps. Todo lo que hacen se muestra en pantalla y puede detenerse. Desactivado hasta que apruebes cada capacidad.';

  @override
  String get thisComputer => 'Esta computadora';

  @override
  String get companionOnline =>
      'Activado: los bots que permitas pueden usar esta computadora';

  @override
  String get companionError => 'No se puede contactar a Casama; reintentando';

  @override
  String get companionOff => 'Desactivado';

  @override
  String get companionCapabilities => 'Qué pueden hacer los bots';

  @override
  String get companionCapabilitiesHelp =>
      'Aprueba cada una. Las acciones de riesgo alto siempre preguntan, sea cual sea la autonomía del bot.';

  @override
  String get capShell => 'Ejecutar comandos (dentro de carpetas compartidas)';

  @override
  String get capFiles => 'Leer y editar archivos en carpetas compartidas';

  @override
  String get capBrowser =>
      'Usar un navegador (el suyo propio, separado del tuyo)';

  @override
  String get capDesktop => 'Usar apps de escritorio';

  @override
  String get sharedFolders => 'Carpetas compartidas';

  @override
  String get sharedFoldersHelp =>
      'Los bots solo pueden acceder a estas carpetas.';

  @override
  String get addFolder => 'Agregar carpeta';

  @override
  String get botsAllowed => 'Bots permitidos';

  @override
  String get botsAllowedHelp =>
      'Los bots permitidos también pueden trabajar en esta computadora. Cada uno conserva su propia computadora y usa esa salvo que una tarea necesite esta.';

  @override
  String get worksOnTitle => 'Trabaja en';

  @override
  String worksOnSubtitle(String bot) {
    return 'Dónde $bot ejecuta comandos, usa archivos y navega por ti.';
  }

  @override
  String get worksOnAuto => 'Automático';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot elige en cada paso: su propia computadora, salvo que la tarea necesite la tuya.';
  }

  @override
  String get worksOnBot => 'Solo la computadora del bot';

  @override
  String get worksOnBotHelp => 'Tu computadora no se usa en absoluto.';

  @override
  String get worksOnMine => 'Solo mi computadora';

  @override
  String get worksOnMineHelp =>
      'Todo ocurre en tu computadora, así que tiene que estar encendida.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Todo ocurre en $computer, así que tiene que estar encendida.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Trabaja en: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Dónde trabaja $bot';
  }

  @override
  String get placesSubtitle =>
      'Elige la computadora que quieres ver aquí. “Trabaja en” decide dónde hace su trabajo el bot.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Mostrando $computer. Trabaja en: $mode. Cambiar';
  }

  @override
  String get placeYoursOnline => 'Tu computadora · En línea';

  @override
  String get placeYoursOffline => 'Tu computadora · Sin conexión';

  @override
  String get placeTeamComputer => 'Computadora del equipo';

  @override
  String placeBotsOwn(String bot) {
    return 'Computadora propia de $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action en $computer';
  }

  @override
  String get botYourComputer => 'Tu computadora';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone =>
      'No permitido en ninguna de tus computadoras';

  @override
  String botYourComputerHow(String bot) {
    return 'Para dejar que $bot trabaje también en tu computadora, abre Casama en esa computadora y actívalo en Ajustes → Usar esta computadora para bots → Bots permitidos. Conservará su propia computadora de todos modos.';
  }

  @override
  String get routineWhere => 'Dónde funciona';

  @override
  String get routineWhereHelp =>
      'Dónde esta rutina ejecuta comandos y usa archivos.';

  @override
  String get routineWhereBot => 'La computadora del bot';

  @override
  String get routineWhereBotHelp =>
      'Se ejecuta esté o no encendida tu computadora.';

  @override
  String get routineWhereMine => 'Mi computadora cuando esté encendida';

  @override
  String get routineWhereMineHelp =>
      'Para trabajar con tus propios archivos y apps. Una ejecución lo indica cuando la computadora estaba apagada.';

  @override
  String get routineUsesComputer => 'Usa una computadora';

  @override
  String get routineUsesComputerOn =>
      'Puede guardar archivos, ejecutar comandos y navegar por páginas.';

  @override
  String get routineUsesComputerOff =>
      'Solo lee tus apps, la web y la memoria. Es más rápido y nunca despierta una computadora.';

  @override
  String get computerBotsAllowed => 'Bots permitidos';

  @override
  String get unpairComputer => 'Dejar de usar esta computadora y desvincularla';

  @override
  String botActingHere(String bot, String action) {
    return '$bot está trabajando en esta computadora: $action';
  }

  @override
  String get quickAsk => 'Pregunta rápida';

  @override
  String get quickAskHint => 'Pregúntale lo que sea a un bot…';

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
  String get cloudModelsTitle => 'Modelos en la nube';

  @override
  String get cloudModelsHelp => 'Se aplica a cada servidor Cloud en segundos.';

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
  String get connectionsTitle => 'Conexiones de apps';

  @override
  String get connectionsServerComposio => 'Cuenta de Composio de Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Las apps sin inicio de sesión propio se conectan con un clic a través de la cuenta de Composio de este servidor.';

  @override
  String get connectionsOwnAccounts => 'Cuentas propias de cada persona';

  @override
  String get connectionsOwnAccountsHelp =>
      'Cada persona usa su propio Composio, Pipedream o Zapier.';

  @override
  String get connectionsNoComposioKey =>
      'Agrega COMPOSIO_API_KEY a este servidor para usar la cuenta de Casama.';

  @override
  String get connectionsGoogleTitle => 'Apps de Google';

  @override
  String get connectionsGoogleComposio => 'Mediante Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Calendario, Drive y más funcionan de inmediato.';

  @override
  String get connectionsGoogleDirect => 'Servidores propios de Google';

  @override
  String get connectionsGoogleDirectHelp =>
      'Requiere inscripción en Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Solo la persona propietaria de la instancia puede abrir la consola de administración.';

  @override
  String get runs24h => 'Ejecuciones (24 h)';

  @override
  String get failedRuns24h => 'Ejecuciones fallidas (24 h)';

  @override
  String get cost24h => 'Gasto (24 h)';

  @override
  String get computersRunning => 'Computadoras activas';

  @override
  String get devicesOnline => 'Computadoras personales en línea';

  @override
  String get editQuotas => 'Editar cuotas';

  @override
  String get maxBots => 'Límite de bots';

  @override
  String get monthlyUsd => 'Límite de gasto mensual (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest está disponible (tienes $current)';
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
      other: '$nString espacios de trabajo',
      one: '1 espacio de trabajo',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'inició sesión $when';
  }

  @override
  String quotasFor(String name) {
    return 'Cuotas de $name';
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
      other: '$nString miembros',
      one: '1 miembro',
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
    return '$usd en 30 días';
  }

  @override
  String get connectingToServer => 'Conectando a Casama…';

  @override
  String get cannotReachServer =>
      'No se puede contactar a tu servidor de Casama';

  @override
  String get connectionFailed =>
      'No se pudo contactar a tu servidor de Casama. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get serverNotResponding =>
      'Tu servidor de Casama no responde en este momento. Inténtalo de nuevo en un momento.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Revisa tu conexión o que el servidor en $url esté en ejecución.';
  }

  @override
  String get serverUnreachableBody =>
      'Revisa si tienes conexión. Si la tienes, puede que el servidor se esté reiniciando, así que seguiremos intentando.';

  @override
  String retryingIn(int seconds) {
    return 'Reintentando en $seconds s';
  }

  @override
  String get retryingNow => 'Intentando…';

  @override
  String get upgradeTitle => 'Mejora tu plan';

  @override
  String get notNow => 'Ahora no';

  @override
  String get seePlans => 'Ver planes';

  @override
  String get billing => 'Facturación';

  @override
  String get billingOffSelfHosted =>
      'La facturación está desactivada en este servidor. Funciona con su propia licencia: el uso personal es gratis para una persona y los equipos usan una licencia Business.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restoreStarted => 'Revisando tus compras…';

  @override
  String get plans => 'Planes';

  @override
  String get currentPlan => 'Plan actual';

  @override
  String subscribeFor(String price) {
    return 'Suscribirse por $price';
  }

  @override
  String get subscribeOnWeb => 'Suscribirse en la web';

  @override
  String get credits => 'Créditos';

  @override
  String get creditHistory => 'Historial de créditos';

  @override
  String get creditReasonPurchase => 'Créditos comprados';

  @override
  String get creditReasonGrant => 'Créditos agregados';

  @override
  String get creditReasonRefund => 'Reembolso';

  @override
  String get creditReasonAdjustment => 'Ajuste';

  @override
  String get creditReasonExpire => 'Créditos vencidos';

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
  String get limitBotsUnlimited => 'Bots ilimitados';

  @override
  String get unlimitedValue => 'Ilimitado';

  @override
  String trialDaysFree(int n) {
    return '$n días gratis';
  }

  @override
  String get extraPeople => 'Personas adicionales';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price por persona al mes, además de los $seats que incluye tu plan.';
  }

  @override
  String get extraPeopleSaved => 'Personas adicionales actualizadas';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString horas de computadora al mes';
  }

  @override
  String limitCredits(String amount) {
    return '$amount créditos al mes';
  }

  @override
  String get viaWeb => 'Facturado en la web';

  @override
  String get viaAppStore => 'Facturado mediante el App Store';

  @override
  String get viaGooglePlay => 'Facturado mediante Google Play';

  @override
  String get yourPlan => 'Tu plan';

  @override
  String planEndsOn(String date) {
    return 'Termina el $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Se renueva el $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Créditos: $amount';
  }

  @override
  String get manageSubscription => 'Administrar suscripción';

  @override
  String get compViaCasama => 'Gratis de parte de Casama';

  @override
  String compFreeUntil(String date) {
    return 'Gratis hasta el $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Compra de prueba. Aplican límites de evaluador: $credits de créditos al mes y $daily al día.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Mantener $plan';
  }

  @override
  String get haveGiftCode => '¿Tienes un código de regalo?';

  @override
  String get redeemCodeTitle => 'Canjear un código de regalo';

  @override
  String get redeemCodeIntro =>
      'Ingresa el código que te dieron. El plan va al espacio de trabajo que elijas, sin nada que pagar.';

  @override
  String get redeemCodeLabel => 'Código de regalo';

  @override
  String get redeemCodeChecking => 'Verificando…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months meses de $plan, gratis',
      one: '1 mes de $plan, gratis',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid => 'Ese código no existe o ya no se puede usar.';

  @override
  String get redeemCodeWorkspace => 'Espacio de trabajo';

  @override
  String get redeemCodeSubmit => 'Canjear';

  @override
  String get redeemCodeFinePrint =>
      'Un código de regalo por persona. Cuando termina, el espacio de trabajo pasa al plan Gratis salvo que elijas un plan.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan es tuyo';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Tu espacio de trabajo tiene $plan gratis hasta el $date. Abre Casama en cualquier dispositivo para usarlo.';
  }

  @override
  String get redeemCodeOpenBilling => 'Abrir Facturación';

  @override
  String get redeemCodeNoWorkspace =>
      'Un código de regalo va a un espacio de trabajo del que eres propietario. Crea uno primero y vuelve a abrir el enlace.';

  @override
  String get redeemCodeUnavailable =>
      'Esto no está disponible en esta versión de la app.';

  @override
  String usageComputerHours(String hours) {
    return 'Computadoras en la nube: $hours h';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Vista en vivo: $minutes min';
  }

  @override
  String get thisMonth => 'Este mes';

  @override
  String get noBillableUsage => 'Todavía no hay uso facturable.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Conecta un Casama autoalojado a este espacio de trabajo. Una dirección pública y las notificaciones son gratis; las computadoras en la nube y los créditos de modelos se facturan aquí.';

  @override
  String get linkCloudNewKey => 'Nueva clave de Casama Link';

  @override
  String get linkCloudKeyCreated => 'Clave creada';

  @override
  String get linkCloudKeyOnce =>
      'Cópiala ahora; solo se muestra una vez. Configúrala en tu servidor con CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Copiar';

  @override
  String get revoke => 'Revocar';

  @override
  String get instanceName => 'Nombre del servidor';

  @override
  String get server => 'Servidor';

  @override
  String get serverAddress => 'Dirección del servidor';

  @override
  String get serverAddressInvalid =>
      'Ingresa una dirección de servidor como https://casama.example.com o http://192.168.1.20:8080.';

  @override
  String get connect => 'Conectar';

  @override
  String get changeServer => 'Usar otro servidor';

  @override
  String serverIs(String host) {
    return 'Servidor: $host';
  }

  @override
  String get continueWithSso => 'Continuar con SSO';

  @override
  String get workEmail => 'Correo laboral';

  @override
  String get privacy => 'Privacidad';

  @override
  String get exportMyData => 'Exportar mis datos';

  @override
  String get exportMyDataHelp =>
      'Bots, chats, ejecuciones, recuerdos y ajustes. Sin secretos.';

  @override
  String exportReady(String kb) {
    return 'Exportación lista ($kb KB)';
  }

  @override
  String get runHistoryRetention =>
      'Conservar historial de ejecuciones durante';

  @override
  String get runHistoryRetentionHelp =>
      'Los eventos de ejecución más antiguos se eliminan automáticamente.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Eliminar mi cuenta';

  @override
  String get deleteAccountHelp =>
      'Borra tus datos tras un breve período de gracia.';

  @override
  String get deleteAccountQuestion => '¿Eliminar tu cuenta?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Los espacios de trabajo donde eres la única persona propietaria se eliminan con tu cuenta, incluidos sus bots y computadoras. Un plan que compraste en la web se cancela automáticamente. Un plan comprado en el App Store o Google Play no: cancélalo en esa tienda. Escribe $email para confirmar.';
  }

  @override
  String get accountDeleted => 'Cuenta programada para eliminación';

  @override
  String accountDeletedBody(String date) {
    return 'Se cerró tu sesión. Tus datos se borrarán el $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pasos',
      one: '1 paso',
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
      other: 'Mostrar $countString pasos anteriores',
      one: 'Mostrar 1 paso anterior',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Copiado';

  @override
  String get jumpToLatest => 'Ir al más reciente';

  @override
  String get chatViewFullTable => 'Ver tabla completa';

  @override
  String get chatShowMore => 'Mostrar más';

  @override
  String get chatShowLess => 'Mostrar menos';

  @override
  String get chatTableTitle => 'Tabla';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Pregúntale lo que sea a $bot o toca una idea abajo para empezar.';
  }

  @override
  String get suggestPlanDay => 'Ayúdame a planificar mi día';

  @override
  String get suggestWriteMessage => 'Ayúdame a escribir un mensaje';

  @override
  String get suggestExplain => 'Busca algo y explícalo de forma sencilla';

  @override
  String get suggestCapabilities => '¿Con qué me puedes ayudar?';

  @override
  String connectedAppSummary(String app) {
    return 'Conectaste $app';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama no ha verificado este servidor. Conéctalo solo si confías en $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama no ha verificado este servidor. Conéctalo solo si confías en quien lo administra.';

  @override
  String get serverAddressLabel => 'Dirección del servidor';

  @override
  String get serverAddressHelp =>
      'Pega la dirección del servidor. Si incluye una clave, la clave se guarda cifrada y queda fuera del chat.';

  @override
  String get serverChecking => 'Verificando el servidor…';

  @override
  String serverSignInOn(String host) {
    return 'Iniciarás sesión en $host.';
  }

  @override
  String get serverUseKey => 'Usar una clave';

  @override
  String get serverUseSignIn => 'Iniciar sesión';

  @override
  String serverSignInUnavailable(String name) {
    return '$name no admite inicio de sesión en navegador desde este servidor de Casama. Usa una clave.';
  }

  @override
  String get serverNoSignIn => 'Este servidor funciona sin iniciar sesión.';

  @override
  String get serverHeaderLabel => 'Nombre del encabezado (opcional)';

  @override
  String get serverToolsTitle => 'Herramientas que puede usar';

  @override
  String get serverToolsHelp =>
      'Desactiva las que no quieras. Los bots aún preguntan antes de pasos arriesgados.';

  @override
  String addedInChatBy(String bot) {
    return 'Agregado en el chat por $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name se ejecuta en tu propia computadora. Abre Casama en esa computadora y activa Usar esta computadora para agregarlo.';
  }

  @override
  String get connectAppsTitle => 'Conecta tus apps';

  @override
  String get moreApps => 'Más';

  @override
  String addAppTile(String app) {
    return 'Agregar $app a este bot';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app se agregó a $bot';
  }

  @override
  String get connectAppsHint =>
      'Déjame leer y actuar en las herramientas que ya usas.';

  @override
  String connectAppTile(String app) {
    return 'Conectar $app';
  }

  @override
  String get showComputer => 'Mostrar computadora';

  @override
  String get hideComputer => 'Ocultar computadora';

  @override
  String get moreActions => 'Más';

  @override
  String get noConversations => 'Todavía no hay conversaciones';

  @override
  String get untitledChat => 'Nueva conversación';

  @override
  String get listening => 'Escuchando…';

  @override
  String get orLabel => 'o';

  @override
  String get notificationsPrimerBubble => '¡No te pierdas nada!';

  @override
  String get notificationsPrimerTitle => 'Activa las notificaciones';

  @override
  String get notificationsPrimerBody =>
      'Tus bots te avisan cuando necesitan una decisión tuya o cuando su trabajo está listo.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome está bloqueando las notificaciones para este sitio. Permítelas desde el candado en la barra de direcciones y luego vuelve a tocar Activar.';

  @override
  String get notificationsTurnOn => 'Activar';

  @override
  String get autoUpdates => 'Actualizar automáticamente';

  @override
  String get autoUpdatesHelp =>
      'Instala versiones nuevas cuando cierras la app.';

  @override
  String get upToDate => 'Casama está al día';

  @override
  String get noReleasesToCheck =>
      'Todavía no se ha publicado ninguna versión para esta computadora, así que no hay con qué comparar esta versión.';

  @override
  String updateReady(String version) {
    return 'Casama $version está disponible';
  }

  @override
  String appVersion(String version) {
    return 'Versión $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Novedades en Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Entendido';

  @override
  String get whatsNewSubtitle =>
      'Esto es lo que cambió desde tu última actualización.';

  @override
  String get whatsNew010Calls =>
      'Llama a tus bots y conversa con ellos. Responden en voz alta, con subtítulos.';

  @override
  String get whatsNew010Looks =>
      'Haz Casama tuyo: temas, esquemas de color, fuentes y fondos en Ajustes → Apariencia, con más en la galería.';

  @override
  String get whatsNew010AboutYou =>
      'Cuéntales a tus bots sobre ti una vez, en Ajustes → Sobre ti: cómo llamarte y cómo prefieres las respuestas.';

  @override
  String get whatsNew010SignIn =>
      'Inicia sesión con una llave de acceso, Apple, Google o un código de tu correo.';

  @override
  String get openAtLogin => 'Abrir al iniciar sesión';

  @override
  String get openAtLoginHelp => 'Listo para el atajo de pregunta rápida.';

  @override
  String get signInTagline =>
      'Colegas que siguen trabajando después de que cierras la app.';

  @override
  String get signInTagline2 => 'Conoce a tu equipo de IA.';

  @override
  String get signInTagline3 => 'IA que no solo habla. Hace las cosas.';

  @override
  String get signInTagline4 => 'Colegas capaces que preguntan antes de actuar.';

  @override
  String get signInTagline5 => 'Delégalo. Vuelve cuando esté hecho.';

  @override
  String get noBotsHelp =>
      'Un bot es un colega con su propia computadora. Crea uno para empezar a chatear.';

  @override
  String get newBotSubtitle => 'Un colega con su propia computadora y memoria.';

  @override
  String get appearance => 'Apariencia';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI u otro proveedor compatible';

  @override
  String get signOutConfirm =>
      'Puedes volver a iniciar sesión cuando quieras; tus bots siguen trabajando.';

  @override
  String get roleOwner => 'Propietario';

  @override
  String get roleAdmin => 'Administrador';

  @override
  String get roleMember => 'Miembro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get createWorkspaceBody =>
      'Un espacio de trabajo reúne a tus bots, sus computadoras y las personas con las que trabajas.';

  @override
  String get workspaceNameHint => 'Mi equipo';

  @override
  String get orJoinWithCode => 'o únete con un código de invitación';

  @override
  String get getOpenRouterKey => 'Obtener una clave de OpenRouter';

  @override
  String get createFirstBotBody =>
      'Dale un nombre y un modelo. Puedes cambiar ambos después.';

  @override
  String stepOf(int step, int total) {
    return 'Paso $step de $total';
  }

  @override
  String get providerHintOpenRouter =>
      'recomendado: chat, imágenes, video, voz';

  @override
  String get providerHintGoogle => 'solo llamadas en vivo';

  @override
  String get providerHintCompatible => 'Cualquier API compatible con OpenAI';

  @override
  String get providerHintSearch => 'búsqueda web';

  @override
  String get noRoutinesHelp =>
      'Una rutina es un trabajo que un bot hace después por su cuenta: una vez a la hora que elijas, en un horario o cuando llega un webhook.';

  @override
  String get routineOnce => 'Una vez';

  @override
  String lastRun(String when) {
    return 'Última: $when';
  }

  @override
  String get routineOff => 'Desactivada';

  @override
  String get routineEnds => 'Termina';

  @override
  String get routineEndsNever => 'Nunca';

  @override
  String get routineEndsOnDate => 'En una fecha';

  @override
  String get routineEndsAfterRuns => 'Después de algunas ejecuciones';

  @override
  String get routineEndDate => 'Último día';

  @override
  String get routineRunCountLabel => 'Ejecuciones';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ejecuciones',
      one: '1 ejecución',
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
      other: 'Quedan $n ejecuciones',
      one: 'Queda 1 ejecución',
      zero: 'No quedan ejecuciones',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Cuándo termina';

  @override
  String get routineEndTitle => 'Cuándo termina';

  @override
  String get routineEndSubtitle =>
      'Entonces se desactiva sola. Un nuevo número de ejecuciones cuenta desde ahora.';

  @override
  String deleteRoutineTitle(String name) {
    return '¿Eliminar “$name”?';
  }

  @override
  String get deleteRoutineBody =>
      'No volverá a ejecutarse. Los resultados que ya publicó se quedan en su conversación.';

  @override
  String get triggerOnce => 'Una vez';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'En $nString min';
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
      other: 'En $nString horas',
      one: 'En 1 hora',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Mañana $time';
  }

  @override
  String get integrationNeedsName => 'Dale un nombre con al menos una letra.';

  @override
  String integrationNeedsField(String field) {
    return 'Completa $field para guardar.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Guardado como $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Usa una dirección completa que empiece con https://';

  @override
  String get openFile => 'Abrir';

  @override
  String get saveFile => 'Guardar';

  @override
  String get shareFile => 'Compartir';

  @override
  String savedFile(String name) {
    return 'Se guardó $name';
  }

  @override
  String noAppToOpen(String name) {
    return 'Ninguna app en este dispositivo abre $name. Guárdalo en su lugar.';
  }

  @override
  String get previewUnavailable =>
      'No hay vista previa para este tipo de archivo. Ábrelo o guárdalo para verlo.';

  @override
  String get openInSystemPlayer => 'Abrir en tu reproductor de video';

  @override
  String get playMedia => 'Reproducir';

  @override
  String get fullScreen => 'Pantalla completa';

  @override
  String get exitFullScreen => 'Salir de pantalla completa';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Abrir en el navegador';

  @override
  String get convertingToPdf => 'Preparando vista previa…';

  @override
  String tableFirstRows(int count) {
    return 'Mostrando las primeras $count filas';
  }

  @override
  String get imageCouldNotLoad => 'No se pudo cargar esta imagen';

  @override
  String get mediaKindImage => 'Imagen';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Audio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Abrir archivo';

  @override
  String get attach => 'Adjuntar';

  @override
  String get attachFiles => 'Archivos';

  @override
  String get attachPhotos => 'Fototeca';

  @override
  String get attachCamera => 'Tomar foto';

  @override
  String get attachScan => 'Escanear documento';

  @override
  String get scanFailed =>
      'No se pudo escanear el documento. Inténtalo de nuevo.';

  @override
  String get dropToAttach => 'Suelta archivos para adjuntar';

  @override
  String uploadFailed(String name) {
    return 'No se pudo subir $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'No se pudo adjuntar $name: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'No se pudo adjuntar $name';
  }

  @override
  String get sendWithoutIt => 'Enviar sin él';

  @override
  String get sendWithoutThem => 'Enviar sin ellos';

  @override
  String get removeAttachment => 'Quitar';

  @override
  String get editPhoto => 'Editar foto';

  @override
  String get retryUpload => 'Reintentar';

  @override
  String get uploadingAttachments => 'Subiendo…';

  @override
  String get notSent => 'No enviado';

  @override
  String get deleteChat => 'Eliminar chat';

  @override
  String get deleteChatTitle => '¿Eliminar este chat?';

  @override
  String deleteChatBody(String bot) {
    return 'Sus mensajes se eliminan para todos los que pueden verlo. Lo que $bot creó aquí se queda en la Biblioteca, los registros de uso se conservan y lo que recordó de aquí sigue en su memoria.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar también las $count cosas hechas aquí',
      one: 'Eliminar también 1 cosa hecha aquí',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Desactivado: se quedan en la Biblioteca.';

  @override
  String get chatDeleted => 'Chat eliminado';

  @override
  String get deleteAllChats => 'Eliminar todos los chats';

  @override
  String get deleteAllChatsRow =>
      'Empieza de cero con un historial limpio. Los recuerdos se conservan.';

  @override
  String deleteAllChatsTitle(String bot) {
    return '¿Eliminar todos los chats con $bot?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Se eliminan todos los chats con $bot que puedas borrar, junto con sus mensajes, fotos y archivos. Los chats grupales se quedan. Los registros de uso y lo que $bot recordó en su memoria se conservan.';
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
      other: '$nString chats eliminados.',
      one: '1 chat eliminado.',
      zero: 'No hay chats para eliminar.',
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
          'Se conservaron $nString chats porque el bot sigue trabajando en ellos.',
      one: 'Se conservó 1 chat porque el bot sigue trabajando en él.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n bots están en este chat. Cada uno conserva su propia memoria y ajustes.',
      one: '1 bot está en este chat. Cada uno conserva su propia memoria y ajustes.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Escribe @ y un nombre para pedirle algo directo a un bot.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone: $lead responde primero y reparte tareas cuando hay trabajo que dividir; si no, cada bot responde por turno y el último cierra la ronda.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Sin mención, responde el bot que habló último ($lead al principio).';
  }

  @override
  String get messageNotSent =>
      'Tus archivos no se subieron, así que el mensaje no se envió. Volvió al cuadro de texto.';

  @override
  String get chatSendsWhenDone => 'Se envía cuando termine esta respuesta';

  @override
  String get noComputerForFiles =>
      'Este bot no tiene una computadora para guardar archivos.';

  @override
  String fileTooLarge(String name) {
    return '$name supera los 25 MB y es demasiado grande para adjuntarlo. En su lugar, envía un enlace desde Google Drive, Dropbox, iCloud o cualquier almacenamiento en la nube.';
  }

  @override
  String get secretsHelp =>
      'Los bots ponen un secreto en las solicitudes mediante su nombre. Solo se envía a los hosts que permites y el modelo nunca lo ve.';

  @override
  String deleteSecretTitle(String name) {
    return '¿Eliminar $name?';
  }

  @override
  String get deleteSecretBody =>
      'Los bots que lo usan dejarán de poder acceder a ese servicio.';

  @override
  String get hide => 'Ocultar';

  @override
  String get show => 'Mostrar';

  @override
  String get deleteMemoryTitle => '¿Eliminar este recuerdo?';

  @override
  String get noMemoriesHelp =>
      'Mientras chateas, el bot guarda lo que importa: datos, preferencias y resúmenes de trabajos pasados.';

  @override
  String get memoryHelp =>
      'Los recuerdos fijados siempre están en el contexto del bot. Edita cualquier cosa incorrecta; los recuerdos eliminados se pierden para siempre.';

  @override
  String get memoryFact => 'Dato';

  @override
  String get memoryPreference => 'Preferencia';

  @override
  String get memorySummary => 'Resumen';

  @override
  String get memoryEpisode => 'Episodio';

  @override
  String get pinned => 'Fijado';

  @override
  String get editMemory => 'Editar recuerdo';

  @override
  String get editMemoryHelp => 'El bot usa esto la próxima vez que haga falta.';

  @override
  String get modelKeysIntro =>
      'Los bots piensan con tus propias claves de proveedor de modelos. Las claves se guardan cifradas y nunca vuelven a mostrarse.';

  @override
  String get casamaCloudKeyHint => 'Pagado con tus créditos';

  @override
  String get casamaCloudIncluded => 'Incluido';

  @override
  String get casamaCloudModelLocked => 'Casama elige este modelo.';

  @override
  String get serverVoiceSetUp =>
      'Este servidor provee la voz, así que no hay clave que agregar. La clave propia de un espacio de trabajo se usa primero.';

  @override
  String modelKeysFor(String workspace) {
    return 'Las claves pertenecen a un espacio de trabajo. Estas son para $workspace.';
  }

  @override
  String get yourKeys => 'Tus claves';

  @override
  String get keyWorking => 'Funcionando';

  @override
  String get keyFailing => 'Con errores';

  @override
  String get keyUntested => 'Sin probar';

  @override
  String get skillsHelp =>
      'Una habilidad es un conjunto de instrucciones que un bot carga cuando una tarea lo requiere, como tu estilo para informes.';

  @override
  String get skillsForAllBots => 'Todos los bots';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Solo para $bot';
  }

  @override
  String get skillsRemovedBot => 'Un bot eliminado';

  @override
  String deleteSkillTitle(String name) {
    return '¿Eliminar la habilidad “$name”?';
  }

  @override
  String get editSkill => 'Editar habilidad';

  @override
  String get deleteSkill => 'Eliminar habilidad';

  @override
  String get skillDescriptionHelp =>
      'Los bots leen esto para decidir cuándo aplica la habilidad.';

  @override
  String get skillBodyHint => '# Pasos\n1. …';

  @override
  String get computersHelp =>
      'Cada bot trabaja en una computadora: la computadora del equipo que todos comparten o una privada. Los archivos se quedan en ella entre chats.';

  @override
  String get computersEmptyTitle => 'Todavía no hay computadoras';

  @override
  String get thisDevice => 'Este dispositivo';

  @override
  String get personalComputerConnected => 'Conectado';

  @override
  String get personalComputerOffline => 'Sin conexión';

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
    return '$size de RAM';
  }

  @override
  String computerDisk(Object size) {
    return '$size de disco';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Último uso $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Última vez en línea $when';
  }

  @override
  String get computerSaved => 'Guardada';

  @override
  String get computerSavedHelp =>
      'Sus archivos se conservan mientras está detenida';

  @override
  String computerCanUse(Object list) {
    return 'Los bots pueden usar: $list';
  }

  @override
  String get computerCanUseNothing => 'Los bots todavía no pueden usarla';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Archivos';

  @override
  String get computerCapBrowser => 'Navegador';

  @override
  String get computerCapDesktop => 'Pantalla';

  @override
  String get computerCapMcp => 'Herramientas locales';

  @override
  String get computerCapMessages => 'Mensajes';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name está sin conexión. Abre Casama en ella y activa “Usar esta computadora para bots”. Tu propia computadora nunca usa las horas de computadora de tu plan.';
  }

  @override
  String get yourComputerOffline => 'Tu computadora está sin conexión';

  @override
  String get howToFix => 'Cómo solucionarlo';

  @override
  String get computerHoursUsedTitle => 'Horas de computadora agotadas';

  @override
  String get personalScreenNote =>
      'Esta es tu propia computadora, así que ves una nueva captura cada pocos segundos en lugar de una vista en vivo.';

  @override
  String get renameComputer => 'Renombrar computadora';

  @override
  String deleteComputerTitle(String name) {
    return '¿Eliminar $name?';
  }

  @override
  String get privacyIntro =>
      'Tus chats, recuerdos y archivos te pertenecen. Expórtalos cuando quieras o elimina tu cuenta.';

  @override
  String get yourData => 'Tus datos';

  @override
  String get shareAnalytics => 'Compartir datos de uso';

  @override
  String get shareAnalyticsHelp =>
      'Reportes de uso y fallos. Nunca tus mensajes ni archivos.';

  @override
  String get measureAds => 'Ayudar a medir nuestros anuncios';

  @override
  String get measureAdsHelp =>
      'Permite a Casama avisar a Meta cuando alguien que vio nuestro anuncio se une o se suscribe. Casama nunca muestra anuncios.';

  @override
  String get measureAdsNeedsUsageData =>
      'Activa Compartir datos de uso para usar esto.';

  @override
  String get trackingTile => 'Permitir rastreo';

  @override
  String get trackingAllowed =>
      'Permitido. El SDK de Meta se ejecuta en este dispositivo y Casama puede avisar a Meta cuando te unas o te suscribas tras ver nuestro anuncio. Cámbialo en la app Configuración.';

  @override
  String get trackingNotAllowed =>
      'No permitido. Nada de este dispositivo va a Meta. Cámbialo en la app Configuración.';

  @override
  String get trackingNotAsked =>
      'Casama todavía no te lo ha preguntado. Hasta que lo permitas, nada de este dispositivo va a Meta.';

  @override
  String get trackingOpenSettings => 'Abrir Configuración';

  @override
  String get workspaceAnalytics => 'Datos de uso de este espacio de trabajo';

  @override
  String get workspaceAnalyticsHelp =>
      'Datos de uso de este espacio de trabajo. Los reportes de fallos siguen activos.';

  @override
  String get dangerZone => 'Zona de peligro';

  @override
  String get quotasHelp => 'Deja un campo vacío para no poner límite.';

  @override
  String get serviceOff => 'Desactivado';

  @override
  String get serviceDown => 'Caído';

  @override
  String get serviceOk => 'Bien';

  @override
  String get sendInvite => 'Enviar invitación';

  @override
  String get thinking0 => 'Modelo';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get autonomyAskAlwaysHelp =>
      'Consulta contigo antes de cada acción que cambie algo.';

  @override
  String get autonomyAskRiskyHelp =>
      'Trabaja por su cuenta, pero pregunta antes de algo arriesgado, como eliminar archivos o gastar dinero.';

  @override
  String get autonomyAutonomousHelp =>
      'Actúa sin preguntar. Ideal para rutinas en las que confías.';

  @override
  String get usageSubtitle => 'Gasto en modelos este mes';

  @override
  String get skillsRowHelp =>
      'Instrucciones que los bots cargan cuando una tarea las necesita';

  @override
  String get integrationsRowHelp => 'Servidores MCP y apps conectadas';

  @override
  String get secretsRowHelp =>
      'Tokens y contraseñas, enviados solo adonde tú permitas';

  @override
  String get computersRowHelp => 'La computadora del equipo y las privadas';

  @override
  String get companionRowHelp =>
      'Deja que los bots usen las apps y archivos de este dispositivo';

  @override
  String get privacyRowHelp => 'Exporta tus datos o elimina tu cuenta';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Todavía no hay integraciones';

  @override
  String get integrationsHelp =>
      'Las integraciones dan más herramientas a los bots: un servidor MCP, una fuente OpenAPI, Composio o Pipedream. Cada herramienta lleva el nombre de su integración.';

  @override
  String get botIntegrationsHelp =>
      'Activa las integraciones que este bot puede usar. Sus herramientas aparecen la próxima vez que se ejecute.';

  @override
  String get openSettings => 'Abrir Ajustes';

  @override
  String get noRunsHelp =>
      'Cada vez que este bot trabaja, desde un chat, una rutina o un webhook, la ejecución aparece aquí con lo que hizo y lo que costó.';

  @override
  String get runCompleted => 'Listo';

  @override
  String get runWaiting => 'Esperando';

  @override
  String get runWorking => 'Trabajando';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Rutina';

  @override
  String get noEventsForFilter => 'No hay nada de este tipo en esta ejecución.';

  @override
  String get runStatusFailed => 'Con error';

  @override
  String get runStatusStopped => 'Detenida';

  @override
  String get quickAskIntro =>
      'Envía una solicitud rápida. Inicia un nuevo chat con el bot que elijas.';

  @override
  String quickAskIntroBot(String name) {
    return 'Envía una solicitud rápida. Inicia un nuevo chat con $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return '¿Qué debe hacer $bot?';
  }

  @override
  String get stateProvisioning => 'Configurando';

  @override
  String get stateStarting => 'Iniciando';

  @override
  String get computerRestoringFiles => 'Restaurando archivos…';

  @override
  String get stateRunning => 'En ejecución';

  @override
  String get stateIdle => 'Inactiva';

  @override
  String get stateSleeping => 'En reposo';

  @override
  String get stateStopped => 'Detenida';

  @override
  String get stateError => 'Error';

  @override
  String get terminalHelp =>
      'Una terminal en esta computadora. Los bots usan la misma, así que puedes ver y corregir lo que hicieron.';

  @override
  String get up => 'Subir';

  @override
  String get emptyFolderHelp =>
      'Los archivos que crean tus bots y los que subes aparecen aquí.';

  @override
  String deleteFileTitle(String name) {
    return '¿Eliminar $name?';
  }

  @override
  String get botComputerAuto => 'Automático';

  @override
  String get botComputerHelp =>
      'La computadora propia del bot: donde ejecuta comandos, navega y guarda sus archivos.';

  @override
  String get billingOffTitle => 'Aquí no hay facturación';

  @override
  String revokeKeyTitle(String name) {
    return '¿Revocar la clave de $name?';
  }

  @override
  String get revokeKeyBody =>
      'Ese servidor deja de usar computadoras en la nube y créditos enseguida.';

  @override
  String get handBackHelp =>
      'El bot retoma desde donde lo dejaste. Cuéntale lo que hiciste, si ayuda.';

  @override
  String get serverHelp =>
      'Usa tu propio servidor de Casama. Ingresa la dirección que tú o tu administrador configuraron.';

  @override
  String get ssoHelp =>
      'Ingresa tu correo laboral y te enviaremos a la página de inicio de sesión de tu empresa.';

  @override
  String get colorScheme => 'Esquema de color';

  @override
  String get searchThemes => 'Buscar esquemas';

  @override
  String get noThemesFound => 'Ningún esquema coincide.';

  @override
  String get noAppsMatch =>
      'Ninguna app coincide. Puedes agregar tu propio servidor en Avanzado.';

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
  String get familyAll => 'Todos';

  @override
  String get familyPurple => 'Morado';

  @override
  String get familyBlue => 'Azul';

  @override
  String get familyTeal => 'Verde azulado';

  @override
  String get familyGreen => 'Verde';

  @override
  String get familyWarm => 'Cálido';

  @override
  String get familyRed => 'Rojo y rosa';

  @override
  String get familyNeutral => 'Neutro';

  @override
  String get background => 'Fondo';

  @override
  String get backgroundPattern => 'Patrón';

  @override
  String get backgroundColors => 'Colores';

  @override
  String get backgroundThemeColors => 'Tema';

  @override
  String get patternStrength => 'Intensidad del patrón';

  @override
  String get wallpaperEverywhere => 'Mostrar en todas las pantallas';

  @override
  String get wallpaperEverywhereHelp =>
      'Desactívalo para mantenerlo solo detrás de los chats.';

  @override
  String get resetBackground => 'Usar predeterminado';

  @override
  String get copyMessage => 'Copiar';

  @override
  String get selectText => 'Seleccionar texto';

  @override
  String get shareMessage => 'Compartir';

  @override
  String get messageCopied => 'Copiado';

  @override
  String get botUiBroken => 'No se pudo mostrar esta parte de la respuesta.';

  @override
  String get botUiSent => 'Enviado';

  @override
  String get botUiConnected => 'Conectado';

  @override
  String get draftNewEmail => 'Nuevo correo';

  @override
  String get draftNewMessage => 'Nuevo mensaje';

  @override
  String get draftNewPost => 'Nueva publicación';

  @override
  String get draftReadyToSend => 'Listo para enviar';

  @override
  String get draftReadyToPost => 'Listo para publicar';

  @override
  String get draftEdited => 'Editado';

  @override
  String get draftSendEmail => 'Enviar correo';

  @override
  String get draftSend => 'Enviar';

  @override
  String get draftPost => 'Publicar';

  @override
  String get draftDiscard => 'Descartar';

  @override
  String get draftEdit => 'Editar';

  @override
  String get draftDoneEditing => 'Listo';

  @override
  String get draftFrom => 'De';

  @override
  String get draftTo => 'Para';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Cco';

  @override
  String get draftSubject => 'Asunto';

  @override
  String get botCardNewEvent => 'Nuevo evento';

  @override
  String get botCardEvent => 'Evento';

  @override
  String get botCardReadyToAdd => 'Listo para agregar';

  @override
  String get botCardAddToCalendar => 'Agregar al calendario';

  @override
  String get botCardChange => 'Cambiar';

  @override
  String get botCardSkip => 'Omitir';

  @override
  String get botCardAllDay => 'Todo el día';

  @override
  String botCardMore(int count) {
    return '+$count más';
  }

  @override
  String get botCardAgenda => 'Agenda';

  @override
  String get botCardMessages => 'Mensajes';

  @override
  String botCardUnread(int count) {
    return '$count sin leer';
  }

  @override
  String get botCardReply => 'Responder';

  @override
  String botCardReplyTo(String name) {
    return 'Responder a $name';
  }

  @override
  String get botCardTasks => 'Tareas';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done de $total listas';
  }

  @override
  String get botCardSaveChanges => 'Guardar cambios';

  @override
  String get botCardChoose => 'Elegir';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => '¿A quién te refieres?';

  @override
  String get botCardNoneOfThese => 'Ninguno de estos';

  @override
  String get botCardReminder => 'Recordatorio';

  @override
  String get botCardRoutine => 'Rutina';

  @override
  String get botCardWatcher => 'En seguimiento';

  @override
  String get botCardScheduled => 'Programado';

  @override
  String botCardNext(String when) {
    return 'Siguiente: $when';
  }

  @override
  String get botCardCancelIt => 'Cancelar';

  @override
  String get botIcon => 'Ícono';

  @override
  String get botIconInitials => 'Iniciales';

  @override
  String get errorDetailsTitle => 'Qué salió mal';

  @override
  String get exportLabel => 'Exportar';

  @override
  String get openTimeline => 'Abrir historial de ejecuciones';

  @override
  String get details => 'Detalles';

  @override
  String get themes => 'Temas';

  @override
  String get myThemes => 'Tus temas';

  @override
  String get saveTheme => 'Guardar tema actual';

  @override
  String get themeName => 'Nombre del tema';

  @override
  String get importTheme => 'Importar un tema';

  @override
  String get themeCode => 'Código del tema';

  @override
  String get themeCodeHelp =>
      'Pega un código que alguien compartió contigo. Empieza con casama-theme:';

  @override
  String get invalidThemeCode => 'Ese no es un código de tema de Casama.';

  @override
  String themeImported(String name) {
    return 'Se agregó $name a tus temas';
  }

  @override
  String get themeCodeCopied =>
      'Código de tema copiado. Cualquiera puede pegarlo en Apariencia → Importar un tema.';

  @override
  String get shareTheme => 'Compartir código';

  @override
  String deleteThemeTitle(String name) {
    return '¿Eliminar $name?';
  }

  @override
  String get fonts => 'Fuentes';

  @override
  String get headingFont => 'Títulos';

  @override
  String get bodyFont => 'Texto';

  @override
  String get fontsHelp =>
      'Google Sans y Noto Serif vienen con la app y funcionan sin conexión. Otras Google Fonts se descargan la primera vez que las eliges.';

  @override
  String get searchFonts => 'Buscar todas las Google Fonts';

  @override
  String get suggestedFonts => 'Sugeridas';

  @override
  String get allFonts => 'Todas las Google Fonts';

  @override
  String get noFontsFound => 'Ninguna fuente con ese nombre';

  @override
  String get resetFonts => 'Usar predeterminadas';

  @override
  String get fontSample => 'Tus bots, trabajando juntos contigo.';

  @override
  String get backgroundPhoto => 'Foto';

  @override
  String get yourPhoto => 'Tu foto';

  @override
  String get browsePhotos => 'Explorar fotos';

  @override
  String get removePhoto => 'Quitar foto';

  @override
  String get photoBlur => 'Desenfocar';

  @override
  String get photoDim => 'Atenuar';

  @override
  String photoBy(String name) {
    return 'Foto de $name en Unsplash';
  }

  @override
  String get searchPhotos => 'Buscar fotos';

  @override
  String get photosUnavailable => 'No se pudieron cargar las fotos.';

  @override
  String get noPhotos => 'No se encontraron fotos';

  @override
  String get photoHelp =>
      'La foto va debajo de los trazos. Desenfocar y atenuar mantienen el texto legible encima.';

  @override
  String get periodToday => 'Hoy';

  @override
  String get periodWeek => 'Esta semana';

  @override
  String get periodYear => 'Este año';

  @override
  String get totalSpend => 'Gasto';

  @override
  String get tokensIn => 'Tokens de entrada';

  @override
  String get tokensOut => 'Tokens de salida';

  @override
  String get runsLabel => 'Ejecuciones';

  @override
  String get spendByDay => 'Gasto por día';

  @override
  String get byBot => 'Por bot';

  @override
  String get byModel => 'Por modelo';

  @override
  String get everythingMetered => 'Todo medido';

  @override
  String get bySource => 'Por origen';

  @override
  String get byPerson => 'Por persona';

  @override
  String get usageAllBots => 'Todos los bots';

  @override
  String get usageAllModels => 'Todos los modelos';

  @override
  String get usageAllSources => 'Todos los orígenes';

  @override
  String get usageEveryone => 'Todos';

  @override
  String get usageJustMe => 'Solo yo';

  @override
  String get usageClearFilters => 'Borrar';

  @override
  String get usageFilterBot => 'Filtrar por bot';

  @override
  String get usageFilterModel => 'Filtrar por modelo';

  @override
  String get usageFilterSource => 'Filtrar por origen';

  @override
  String get usageFilterPerson => 'Filtrar por persona';

  @override
  String get usageSourceChat => 'Chats';

  @override
  String get usageSourceChatApp => 'Apps de chat';

  @override
  String get usageSourceRoutine => 'Rutinas';

  @override
  String get usageSourceApi => 'API y otros agentes';

  @override
  String get usageSourceOther => 'Otro';

  @override
  String get usageNoPerson => 'Automático';

  @override
  String get usageUnnamedPerson => 'Miembro sin nombre';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ejecuciones',
      one: '1 ejecución',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Exportar CSV';

  @override
  String get exportJson => 'Exportar JSON';

  @override
  String get askBotAboutUsage => 'Preguntarle a un bot sobre esto';

  @override
  String get noUsageYet => 'Todavía no hay uso en este período.';

  @override
  String get otherModel => 'Computadoras y otros';

  @override
  String get deletedBot => 'Sin bot asignado';

  @override
  String get usageHelp =>
      'Los costos son estimaciones a partir del conteo de tokens y precios publicados. La factura de tu proveedor de modelos es la definitiva.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Aquí está mi uso de Casama para $period. Ayúdame a entender adónde va el dinero y cómo podría gastar menos. También puedes consultar cifras en vivo con tu herramienta de uso.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Entrada del modelo';

  @override
  String get kindTokensOut => 'Salida del modelo';

  @override
  String get kindComputer => 'Tiempo de computadora en la nube';

  @override
  String get kindModels => 'Modelos de IA';

  @override
  String get creditsThisMonth => 'Créditos de este mes';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent% usado';
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
      other: 'Unas $nString ejecuciones más a tu costo habitual',
      one: 'Aproximadamente 1 ejecución más a tu costo habitual',
      zero: 'Menos de una ejecución más a tu costo habitual',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Te quedaste sin créditos. Agrega más para que tus bots sigan funcionando.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 crédito = $price. Tu plan agrega $amount cada mes; los créditos sin usar se conservan un mes más.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 crédito = $price. Los paquetes de créditos del App Store o Google Play nunca vencen; los paquetes de créditos comprados en la web duran 12 meses.';
  }

  @override
  String get creditsDailyLabel => 'Límite de hoy';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used de $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Lo que tu plan puede gastar cada día en modelos, voz y apps de Casama, sin importar cuántos créditos queden.';

  @override
  String get creditsDailyReached =>
      'Se alcanzó el límite de hoy, así que tus bots están en pausa. Mejora tu plan para tener un límite diario mayor.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Se restablece en aproximadamente $n horas.',
      one: 'Se restablece en aproximadamente 1 hora.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Se restablece en menos de una hora.';

  @override
  String get creditsHoursLabel => 'Horas de computadora';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used de $limit h';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Tiempo que las computadoras de tus bots se ejecutan este mes. Cuando se agotan, el chat sigue funcionando; solo la computadora se detiene. Se restablece el $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Se agotaron las horas de computadora de este mes, así que tu computadora no puede iniciar. El chat sigue funcionando. Se restablece el $date. Mejora tu plan para tener más horas.';
  }

  @override
  String get kindStream => 'Vista en vivo';

  @override
  String get kindTts => 'Leer en voz alta';

  @override
  String get computerMissingTitle => 'Computadora no encontrada';

  @override
  String get computerMissingHelp =>
      'Puede que haya sido eliminada o que la lista esté desactualizada. Actualiza para comprobar de nuevo.';

  @override
  String get computerMissingBotHelp =>
      'Puede que la computadora de este bot haya sido eliminada o que la lista esté desactualizada. Actualiza o elige otra computadora para este bot.';

  @override
  String get computerChoose => 'Elegir una computadora';

  @override
  String get personaWork => 'Trabajo';

  @override
  String get personaResearch => 'Investigación';

  @override
  String get personaBuild => 'Desarrollo';

  @override
  String get personaCreate => 'Creación';

  @override
  String get personaLife => 'Vida';

  @override
  String get personaOther => 'Otro';

  @override
  String get blankBotHelp =>
      'Empieza de cero y escribe tus propias instrucciones.';

  @override
  String get browse => 'Explorar';

  @override
  String get browseAllPersonas => 'Ver todo';

  @override
  String get botIdentity => 'Nombre e ícono';

  @override
  String get serviceKeys => 'Claves de servicio';

  @override
  String get noServiceKeys => 'Todavía no hay claves de servicio.';

  @override
  String get serviceKeysHelp => 'Tus propias claves de búsqueda, mapas o datos';

  @override
  String get serviceKeysIntro =>
      'Casama ejecuta los modelos, la voz y las imágenes por ti. Agrega una clave aquí solo para usar tu propio servicio de búsqueda, mapas o datos. Las claves se guardan cifradas y nunca vuelven a mostrarse.';

  @override
  String get choosePersona => 'Elige una personalidad';

  @override
  String get choosePersonaHelp =>
      'Cada una viene con instrucciones, un estilo y, a veces, habilidades y rutinas. Puedes cambiar cualquier cosa después.';

  @override
  String get searchPersonas => 'Buscar personalidades';

  @override
  String get noPersonasFound => 'Ninguna personalidad coincide con eso';

  @override
  String get previewPersona => 'Vista previa';

  @override
  String get personaInstructions => 'Instrucciones';

  @override
  String get personaTryAsking => 'Prueba preguntar';

  @override
  String usePersona(String name) {
    return 'Usar $name';
  }

  @override
  String get loadPersona => 'Cargar una personalidad';

  @override
  String get replaceInstructionsTitle => '¿Reemplazar las instrucciones?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Las instrucciones actuales del bot se reemplazarán con las de $name. Las habilidades y rutinas quedan tal como están.';
  }

  @override
  String get replace => 'Reemplazar';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle =>
      'Dales a tus bots las herramientas que tu equipo ya usa.';

  @override
  String get connectedTab => 'Conectadas';

  @override
  String get browseTab => 'Explorar';

  @override
  String get searchApps => 'Buscar apps';

  @override
  String get popularApps => 'Populares';

  @override
  String get allApps => 'Todas las apps';

  @override
  String get appCatDeveloper => 'Desarrollo';

  @override
  String get appCatProductivity => 'Productividad';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Pagos';

  @override
  String get appCatDesign => 'Diseño';

  @override
  String get appCatSales => 'Ventas y soporte';

  @override
  String get appCatData => 'Datos y búsqueda';

  @override
  String get appCatAutomation => 'Automatización';

  @override
  String get authOneClick => 'Un clic';

  @override
  String get authApiKey => 'Clave de API';

  @override
  String get authNone => 'Sin inicio de sesión';

  @override
  String get authAdminSetup => 'Requiere configuración';

  @override
  String get connectedBadge => 'Conectada';

  @override
  String get whatBotsCanDo => 'Lo que tus bots pueden hacer';

  @override
  String continueWith(String app) {
    return 'Continuar con $app';
  }

  @override
  String get signInTab => 'Iniciar sesión';

  @override
  String get connectNoSignIn => 'Esta app funciona sin iniciar sesión.';

  @override
  String finishSignIn(String app) {
    return 'Termina de iniciar sesión en $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app se abrió en tu navegador. Aprueba el acceso allí y esto se actualiza solo.';
  }

  @override
  String get reopenSignIn => 'Abrir de nuevo la página de inicio de sesión';

  @override
  String appConnected(String app) {
    return '$app está conectada';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app ya está conectada en este espacio de trabajo. Usa esa conexión o agrega otra cuenta.';
  }

  @override
  String get useConnection => 'Usar esa';

  @override
  String get addAnotherAccount => 'Agregar otra cuenta';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString herramientas listas para tus bots.',
      one: '1 herramienta lista para tus bots.',
      zero: 'Lista para usar.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => '¿Qué bots pueden usarla?';

  @override
  String get whichBotsHelp =>
      'Los bots aún te preguntan antes de algo arriesgado.';

  @override
  String get doneLabel => 'Listo';

  @override
  String openApp(String app) {
    return 'Abrir $app';
  }

  @override
  String get pasteLabel => 'Pegar';

  @override
  String get connectingLabel => 'Conectando…';

  @override
  String get connectFailedTitle => 'No se pudo conectar';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'O conecta $app mediante uno de estos. Inicia sesión una vez y luego pídele a tu bot que use $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'El inicio de sesión se guarda cifrado y nunca vuelve a mostrarse. Desconéctalo cuando quieras.';

  @override
  String get composioHelp =>
      'Cientos de apps, con el inicio de sesión resuelto para ti.';

  @override
  String get pipedreamHelp => 'Miles de apps mediante Pipedream Connect.';

  @override
  String get customServer => 'Servidor personalizado';

  @override
  String get customServerHelp =>
      'Cualquier servidor MCP o especificación OpenAPI. Para desarrolladores.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usada por $countString bots',
      one: 'Usada por 1 bot',
      zero: 'Todavía no asignada a ningún bot',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Lista';

  @override
  String get statusNeedsAttention => 'Requiere atención';

  @override
  String get statusChecking => 'Verificando';

  @override
  String get toolsHelp =>
      'Las herramientas de solo lectura se ejecutan por su cuenta. Las herramientas que hacen cambios preguntan antes cuando un bot leyó algo no confiable, y las marcadas como “Siempre pregunta” esperan tu confirmación cada vez.';

  @override
  String get botsWithAccess => 'Bots con acceso';

  @override
  String get reconnect => 'Reconectar';

  @override
  String get disconnect => 'Desconectar';

  @override
  String disconnectTitle(String app) {
    return '¿Desconectar $app?';
  }

  @override
  String get disconnectBody =>
      'Los bots pierden sus herramientas enseguida y se elimina el inicio de sesión guardado.';

  @override
  String get testConnection => 'Probar conexión';

  @override
  String get signedInOAuth => 'Sesión iniciada con tu cuenta';

  @override
  String get signedInKey => 'Conectada con una clave de API';

  @override
  String get signedInNone => 'No necesita inicio de sesión';

  @override
  String get noConnectionsTitle => 'Conecta tu primera app';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail y más. La mayoría toma un clic.';

  @override
  String get browseApps => 'Explorar apps';

  @override
  String providerSetupTitle(String provider) {
    return 'Conectar $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider inicia sesión en las apps por ti, para que nunca manejes sus claves.';
  }

  @override
  String get getFreeKey => 'Obtén una clave gratis';

  @override
  String connectedThroughHub(String provider) {
    return 'Mediante $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Apps mediante $provider';
  }

  @override
  String get addAnApp => 'Agregar una app';

  @override
  String searchProviderApps(String provider) {
    return 'Buscar apps de $provider';
  }

  @override
  String get accountConnected => 'Sesión iniciada';

  @override
  String get accountPending => 'Esperando inicio de sesión';

  @override
  String get accountError => 'Problema de inicio de sesión';

  @override
  String get providerReconnectHint =>
      'Inicia sesión con Casama directamente para reducir costos por llamada de app';

  @override
  String get noProviderAccounts =>
      'Todavía no hay apps. Agrega una e inicia sesión en ella.';

  @override
  String get projectId => 'ID de proyecto';

  @override
  String get toolRiskLow => 'Solo lectura';

  @override
  String get toolRiskMedium => 'Hace cambios';

  @override
  String get toolRiskHigh => 'Siempre pregunta';

  @override
  String get askWhichBot => '¿Qué bot debería revisar esto?';

  @override
  String get computerWake => 'Despertar';

  @override
  String get computerAsleepTitle => 'La computadora está en reposo';

  @override
  String get computerAsleepFilesHelp =>
      'Despiértala para ver y subir sus archivos.';

  @override
  String get computerFilesTimedOut =>
      'Los archivos tardaron demasiado en cargar. Verifica que la computadora esté encendida e inténtalo de nuevo.';

  @override
  String get computerGoingToSleep => 'Entrando en reposo';

  @override
  String get liveViewWakesHelp =>
      'Esta computadora está en reposo. Abrir la vista en vivo la despierta; vuelve a dormirse tras un rato sin uso.';

  @override
  String get wakeAndWatch => 'Despertar y ver en vivo';

  @override
  String get chatGptPlan => 'Plan de ChatGPT';

  @override
  String get continueWithChatGpt => 'Continuar con ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Ejecuta tus bots con tu plan de ChatGPT en lugar de una clave de API. Sus llamadas al modelo cuentan para los límites de tu plan y solo tú puedes usarlo.';

  @override
  String get chatGptDesktopOnly =>
      'Para conectar tu plan de ChatGPT, abre la app de escritorio o ejecuta \"casama credential chatgpt\" en la CLI.';

  @override
  String get chatGptWaiting =>
      'Termina de iniciar sesión con ChatGPT en tu navegador…';

  @override
  String chatGptConnected(String account) {
    return 'Se conectó tu plan de ChatGPT ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Iniciaste sesión, pero no se permitió el uso del plan. Reconéctalo y permítelo, o agrega una clave de API.';

  @override
  String get orAddApiKey => 'O agrega una clave de API';

  @override
  String get planOnlyYou => 'Solo tú puedes usarlo';

  @override
  String get planOtherMember => 'Plan de otro miembro';

  @override
  String get planConnected => 'Conectado';

  @override
  String get planUsageOff => 'Uso del plan desactivado';

  @override
  String get planNeedsReconnect => 'Iniciar sesión de nuevo';

  @override
  String get useNextModelAtLimit =>
      'Usar el siguiente modelo del bot al llegar al límite de mi plan';

  @override
  String get useNextModelAtLimitHelp =>
      'Desactivado: una ejecución se detiene cuando se alcanza tu límite de ChatGPT. Activado: continúa en el siguiente modelo del bot, lo que puede tener costo.';

  @override
  String get manageUsage => 'Administrar uso';

  @override
  String get removeKey => 'Quitar';

  @override
  String removeKeyConfirm(String label) {
    return '¿Quitar $label? Los bots que la usan dejan de funcionar hasta que les des otra clave.';
  }

  @override
  String get removeKeyChatGptNote =>
      'Tu inicio de sesión de ChatGPT también se revoca.';

  @override
  String modelFallbackNotice(String message) {
    return 'Se cambió al siguiente modelo: $message';
  }

  @override
  String get twoStepSignIn => 'Inicio de sesión en dos pasos';

  @override
  String get twoStepHelp =>
      'Pide un código de una app de autenticación cada vez que inicies sesión.';

  @override
  String get signInWithPasskey => 'Iniciar sesión con llave de acceso';

  @override
  String get account => 'Cuenta';

  @override
  String get accountRow =>
      'Correo, contraseña y cierre de sesión en todas partes';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get newPassword => 'Contraseña nueva';

  @override
  String get newPasswordAgain => 'Repite la contraseña nueva';

  @override
  String get passwordsDontMatch => 'Las contraseñas no coinciden';

  @override
  String get newPasswordTitle => 'Elige una contraseña nueva';

  @override
  String get newPasswordBody =>
      'Ya iniciaste sesión. Elige una contraseña nueva para iniciar sesión con tu correo.';

  @override
  String get savePassword => 'Guardar contraseña';

  @override
  String get passwordSaved => 'Contraseña guardada.';

  @override
  String get passwordTitle => 'Contraseña';

  @override
  String get passwordRow =>
      'Configura o cambia la contraseña para iniciar sesión con tu correo';

  @override
  String get passwordHelp =>
      'Usa al menos 6 caracteres. Aún puedes iniciar sesión con Google, Apple, una llave de acceso o un enlace por correo.';

  @override
  String passwordCodeSent(String email) {
    return 'Para mantener segura tu cuenta, ingresa el código que acabamos de enviar a $email.';
  }

  @override
  String get changeEmailTitle => 'Cambiar correo';

  @override
  String get changeEmailHelp =>
      'Enviaremos un enlace de confirmación a tu dirección actual y a la nueva. El cambio se realiza cuando confirmes ambos.';

  @override
  String get newEmail => 'Correo nuevo';

  @override
  String get changeEmailSend => 'Enviar confirmación';

  @override
  String get changeEmailRow => 'Cambia el correo con el que inicias sesión';

  @override
  String changeEmailSent(String email) {
    return 'Revisa ambas bandejas de entrada. $email pasa a ser tu correo en cuanto confirmes ambos enlaces.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Esperando confirmación: $email';
  }

  @override
  String get signOutEverywhere => 'Cerrar sesión en todas partes';

  @override
  String get signOutEverywhereHelp =>
      'Cada teléfono, computadora y navegador, incluido este';

  @override
  String get signOutEverywhereConfirm =>
      '¿Cerrar sesión en todos los dispositivos, incluido este? Úsalo si perdiste un dispositivo o crees que alguien más inició sesión.';

  @override
  String get passkeySuggestTitle =>
      '¿Iniciar sesión más rápido la próxima vez?';

  @override
  String get passkeySuggestBody =>
      'Agrega una llave de acceso e inicia sesión con Face ID, tu huella o el bloqueo de pantalla. Sin contraseña ni correo.';

  @override
  String get passkeys => 'Llaves de acceso';

  @override
  String get passkeysRow =>
      'Inicia sesión con Face ID, huella o bloqueo de pantalla';

  @override
  String get passkeysHelp =>
      'Una llave de acceso inicia tu sesión con Face ID, huella o bloqueo de pantalla, sin contraseña ni correo. Cada teléfono, computadora o administrador de contraseñas guarda la suya.';

  @override
  String get passkeyAdd => 'Agregar llave de acceso';

  @override
  String get passkeyAddAnother => 'Agregar otra llave de acceso';

  @override
  String get passkeyAdded =>
      'Llave de acceso agregada. La próxima vez, inicia sesión con ella.';

  @override
  String get passkeyRename => 'Renombrar';

  @override
  String get passkeyRenameTitle => 'Renombrar llave de acceso';

  @override
  String get passkeyNameLabel => 'Nombre';

  @override
  String get passkeyRemove => 'Quitar';

  @override
  String passkeyRemoveConfirm(String name) {
    return '¿Quitar “$name”? Ya no podrás iniciar sesión con ella.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Agregada $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Último uso $when';
  }

  @override
  String get twoStepSetUp => 'Configurar una app de autenticación';

  @override
  String get twoStepAddAnother => 'Agregar otro autenticador';

  @override
  String get twoStepScan =>
      'Escanea este código con una app de autenticación (como 1Password, Google Authenticator o Authy) o escribe la clave de configuración, y luego ingresa el código de 6 dígitos que muestra.';

  @override
  String get twoStepKey => 'Clave de configuración';

  @override
  String get twoStepCode => 'Código de 6 dígitos';

  @override
  String get twoStepVerify => 'Verificar';

  @override
  String get twoStepNowOn => 'El inicio de sesión en dos pasos está activado.';

  @override
  String get twoStepAuthenticators => 'Apps de autenticación';

  @override
  String get twoStepRename => 'Renombrar';

  @override
  String get twoStepRenameTitle => 'Renombrar autenticador';

  @override
  String get twoStepNameLabel => 'Nombre';

  @override
  String get twoStepNameHint => 'Por ejemplo: Teléfono del trabajo';

  @override
  String get twoStepRemove => 'Quitar';

  @override
  String get twoStepRemoveConfirm =>
      '¿Quitar esta app de autenticación? Si es la única, iniciarás sesión solo con tu contraseña.';

  @override
  String get twoStepPromptTitle => 'Ingresa tu código';

  @override
  String get twoStepPromptBody =>
      'Abre tu app de autenticación e ingresa el código de 6 dígitos para terminar de iniciar sesión.';

  @override
  String get twoStepPromptAccount => 'Iniciando sesión como';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Contraseña nueva para';

  @override
  String get connectAiAppAccount => 'Obtiene acceso a';

  @override
  String joinAsAccount(String email, String server) {
    return 'Te unirás como $email en $server.';
  }

  @override
  String get requireTwoStep =>
      'Exigir inicio de sesión en dos pasos a propietarios y administradores';

  @override
  String get requireTwoStepHelp =>
      'Los propietarios y administradores deben usarlo. Activa el tuyo primero.';

  @override
  String get twoStepNeededForAdmin =>
      'Este espacio de trabajo exige inicio de sesión en dos pasos para propietarios y administradores. Configúralo, o vuelve a iniciar sesión con tu código, para usar los ajustes de administración.';

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
  String get suspendWorkspace => 'Suspender';

  @override
  String get unsuspendWorkspace => 'Levantar suspensión';

  @override
  String get suspendReason => 'Motivo';

  @override
  String get suspendWorkspaceHelp =>
      'Sus computadoras se detienen y sus bots dejan de ejecutarse. No se elimina nada y puedes levantar la suspensión cuando quieras.';

  @override
  String workspaceSuspended(String reason) {
    return 'Suspendido: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Este espacio de trabajo está suspendido, así que los bots no pueden ejecutarse y las computadoras no pueden iniciar. Contacta a quien administra este servidor.';

  @override
  String get abuseKind_mining_pool => 'Minería de criptomonedas bloqueada';

  @override
  String get abuseKind_blocked_port => 'Puerto de correo bloqueado';

  @override
  String get abuseKind_egress_flood => 'Inundación de tráfico';

  @override
  String get abuseKind_signup_blocked => 'Registro rechazado';

  @override
  String get abuseKind_suspended => 'Espacio de trabajo suspendido';

  @override
  String get abuseKind_unsuspended => 'Suspensión levantada';

  @override
  String get kindLocalMcp => 'En una computadora';

  @override
  String get capMcp => 'Herramientas locales (MCP)';

  @override
  String get localMcpServers => 'Herramientas locales (MCP)';

  @override
  String get localMcpHelp =>
      'Servidores MCP en esta computadora o en tu red que tus bots pueden usar, como T3 Code, Claude Code, Codex o apps de diseño. Sus tokens e inicios de sesión se quedan en esta computadora.';

  @override
  String get localMcpAdd => 'Agregar un servidor MCP local';

  @override
  String get localMcpEmpty => 'Todavía no hay servidores MCP locales.';

  @override
  String get localMcpName => 'Nombre';

  @override
  String get localMcpStdio => 'Un comando';

  @override
  String get localMcpLoopback => 'Una dirección';

  @override
  String get localMcpCommand => 'Comando';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Dirección';

  @override
  String get localMcpFolder => 'Carpeta de trabajo (opcional)';

  @override
  String get localMcpEnv =>
      'Entorno (un KEY=value por línea, guardado en esta computadora)';

  @override
  String get localMcpNeedsCapability =>
      'Activa Herramientas locales (MCP) arriba para que los bots puedan usarlas.';

  @override
  String get localMcpBadUrl =>
      'Usa una dirección http:// en esta computadora o en tu propia red, como http://127.0.0.1:3845/mcp, o una dirección https://.';

  @override
  String get localMcpBadFolder =>
      'Elige una carpeta dentro de una de las carpetas compartidas.';

  @override
  String get codingAgents => 'Agentes de código';

  @override
  String get codingAgentsHelp =>
      'Los bots pueden delegar tareas de programación a estos agentes en esta computadora. Usan tus propios inicios de sesión y trabajan en las carpetas que compartas.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Se encontraron $nString agentes de código',
      one: 'Se encontró 1 agente de código',
      zero: 'No se encontraron agentes de código',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Este servidor todavía no está guardado en el espacio de trabajo. Quítalo y agrégalo de nuevo.';

  @override
  String get localMcpSignInKind => 'Inicio de sesión';

  @override
  String get localMcpAuthNone => 'Ninguno';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Encabezado';

  @override
  String get localMcpAuthOAuth => 'Navegador';

  @override
  String get localMcpToken => 'Token (guardado en esta computadora)';

  @override
  String get localMcpHeaderName => 'Nombre del encabezado';

  @override
  String get localMcpHeaderValue =>
      'Valor del encabezado (guardado en esta computadora)';

  @override
  String get localMcpOAuthHelp =>
      'Casama abre tu navegador para que inicies sesión en este servidor. El inicio de sesión se queda en esta computadora.';

  @override
  String get localMcpNetworkWarning =>
      'Este servidor no está en esta computadora. Los bots que puedan usar esta computadora pueden acceder a él.';

  @override
  String get localMcpSignIn => 'Iniciar sesión';

  @override
  String get localMcpNeedsSignIn => 'Requiere inicio de sesión';

  @override
  String get localMcpEdit => 'Editar servidor MCP local';

  @override
  String get localMcpImport => 'Agregar desde otras apps';

  @override
  String get localMcpImportHelp =>
      'Servidores MCP ya configurados en T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex o Windsurf en esta computadora.';

  @override
  String get localMcpImportNone =>
      'No se encontraron servidores MCP en otras apps en esta computadora.';

  @override
  String get localMcpImportAdded => 'Ya agregado';

  @override
  String get localMcpImportRemote =>
      'Está en internet, así que normalmente se agrega en Conexiones. Agrégalo aquí solo si únicamente esta computadora puede acceder a él.';

  @override
  String get mcpQuestionDecline => 'Rechazar';

  @override
  String get mcpQuestionSend => 'Enviar';

  @override
  String get cardMcpQuestion => 'Pregunta';

  @override
  String get cardMcpSignIn => 'Inicio de sesión';

  @override
  String get mcpSignInHereHelp =>
      'Inicia sesión para que tus bots puedan usarlo de nuevo.';

  @override
  String localMcpSignedIn(String name) {
    return 'Sesión iniciada en $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'Desde $source';
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
      other: 'Agregar $nString servidores',
      one: 'Agregar 1 servidor',
      zero: 'Agregar',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (guardado en esta computadora)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name necesita que inicies sesión';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Abre Casama en $device e inicia sesión allí.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Abre Casama en la computadora donde se ejecuta esta herramienta e inicia sesión allí.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection pregunta';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return 'Se respondió a $connection';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Se rechazó la pregunta de $connection';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Se cerró la pregunta de $connection';
  }

  @override
  String get codingAgentsNone =>
      'No se encontraron agentes de código. Instala Claude Code, Codex o el agente de línea de comandos de Cursor para delegarles tareas de programación.';

  @override
  String get codingAgentsNeedShell =>
      'Los agentes de código se ejecutan como comandos, así que necesitan que Ejecutar comandos esté activado.';

  @override
  String get allowCommands => 'Activar';

  @override
  String get codingAgentAllow => 'Permitir';

  @override
  String get codingAgentAllowed => 'Permitido';

  @override
  String get codingAgentsAllowHelp =>
      'Un agente con el botón “Permitir” al lado todavía no se ha ejecutado en esta computadora. Permítelo una vez y los bots podrán delegarle tareas.';

  @override
  String get ownAgentsAdd => 'Agregar el tuyo';

  @override
  String get ownAgentYours => 'Tuyo';

  @override
  String get ownAgentNotFound => 'No encontrado en esta computadora';

  @override
  String get ownAgentsHelp =>
      'Tus propios agentes se ejecutan solo en esta computadora, en chats que actúan por ti. Nadie más en el espacio de trabajo puede verlos ni cambiarlos.';

  @override
  String get ownAgentFormTitle => 'Agregar tu propio agente';

  @override
  String get ownAgentEditTitle => 'Editar tu agente';

  @override
  String get ownAgentName => 'Nombre';

  @override
  String get ownAgentBin => 'Nombre del comando';

  @override
  String get ownAgentCommand => 'Comando';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Pon $task donde va la tarea; Casama lo entrecomilla. Cada comando allí empieza con el nombre del comando. También puedes usar $folder y $result_file cuando el agente escribe su respuesta en un archivo.';
  }

  @override
  String get ownAgentResult => 'Leyendo la respuesta';

  @override
  String get ownAgentResultTail => 'El final de su salida';

  @override
  String get ownAgentResultJson => 'Una línea JSON con un campo result';

  @override
  String get ownAgentResultStream => 'Un flujo de líneas JSON';

  @override
  String get ownAgentResultField => 'Un campo JSON';

  @override
  String get ownAgentResultFile => 'Escrito en un archivo';

  @override
  String get ownAgentResultFieldName => 'Nombre del campo';

  @override
  String get ownAgentTimeLimit => 'Límite de tiempo (minutos)';

  @override
  String get ownAgentTest => 'Probar';

  @override
  String get ownAgentTestHelp =>
      'Probar le pide que responda solo con la palabra pong en esta computadora y muestra lo que imprimió.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Respondió: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'No respondió como se esperaba (código de salida $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'No terminó a tiempo.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Completa un nombre, un nombre de comando y un comando con $task.';
  }

  @override
  String get board => 'Tablero';

  @override
  String get newTicket => 'Nuevo ticket';

  @override
  String get newTicketSubtitle =>
      'Una tarea para uno de tus bots, seguida en el tablero.';

  @override
  String get allProjects => 'Todos los proyectos';

  @override
  String get manageProjects => 'Administrar proyectos';

  @override
  String get filterByProject => 'Filtrar por proyecto';

  @override
  String get moveTo => 'Mover a';

  @override
  String get noMatchingTickets => 'No hay tickets que coincidan';

  @override
  String get noMatchingTicketsHelp =>
      'Ningún ticket coincide con estos filtros.';

  @override
  String get clearFilters => 'Borrar filtros';

  @override
  String get ticketTitle => 'Título';

  @override
  String get ticketDetails => 'Detalles';

  @override
  String get taskInReview => 'En revisión';

  @override
  String get priority => 'Prioridad';

  @override
  String get priorityUrgent => 'Urgente';

  @override
  String get priorityHigh => 'Alta';

  @override
  String get priorityMedium => 'Media';

  @override
  String get priorityLow => 'Baja';

  @override
  String get priorityNone => 'Sin prioridad';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterMine => 'Mías';

  @override
  String get filterBots => 'Bots';

  @override
  String get assignee => 'Asignado a';

  @override
  String get unassigned => 'Sin asignar';

  @override
  String get assignToMe => 'Yo';

  @override
  String get reviewRequired => 'Requiere revisión';

  @override
  String get reviewRequiredHelp =>
      'El bot termina en revisión en vez de listo.';

  @override
  String get comments => 'Comentarios';

  @override
  String get addComment => 'Agregar un comentario';

  @override
  String get sendComment => 'Enviar';

  @override
  String get openThread => 'Abrir el hilo del bot';

  @override
  String get deleteTicket => 'Eliminar ticket';

  @override
  String get ticketResult => 'Resultado';

  @override
  String get noCommentsYet =>
      'Todavía no hay comentarios. Deja una nota para el bot o tu equipo.';

  @override
  String get noTickets => 'Dales algo que hacer a tus bots';

  @override
  String get noTicketsHelp =>
      'Encarga un trabajo o todo un objetivo. Puedes verlo avanzar desde aquí.';

  @override
  String get tasksStartTicket => 'Agregar un ticket';

  @override
  String get tasksStartTicketHelp =>
      'Un trabajo. Asígnaselo a un bot y empieza.';

  @override
  String get tasksStartProject => 'Iniciar un proyecto';

  @override
  String get tasksStartProjectHelp =>
      'Un objetivo más grande. Un bot lo organiza como tickets y espera tu aprobación.';

  @override
  String get tasksExamples => 'O empieza con uno de estos';

  @override
  String get tasksExampleResearch =>
      'Investiga a mis tres principales competidores';

  @override
  String get tasksExampleDraft => 'Redacta un anuncio de lanzamiento';

  @override
  String get tasksExampleTidy => 'Ordena mis archivos';

  @override
  String get ticketStatus => 'Estado';

  @override
  String get spaces => 'Espacios de trabajo';

  @override
  String get newWorkspace => 'Nuevo espacio de trabajo';

  @override
  String get newWorkspaceSubtitle =>
      'Un hogar separado para un equipo, con sus propios bots, chats y personas.';

  @override
  String get joinWorkspaceHelp =>
      'Pega el enlace de invitación que alguien te envió.';

  @override
  String get inviteLinkField => 'Enlace de invitación';

  @override
  String get workspaceIcon => 'Ícono';

  @override
  String get workspaceColor => 'Color';

  @override
  String get workspaceSettings => 'Ajustes del espacio de trabajo';

  @override
  String get workspaceSettingsHelp =>
      'Nombre, ícono, color y enlaces de invitación';

  @override
  String get inviteLinks => 'Enlaces de invitación';

  @override
  String get inviteLinksHelp =>
      'Cualquiera con un enlace puede unirse tras iniciar sesión, hasta que venza, se agote o lo revoques.';

  @override
  String get createInviteLink => 'Crear enlace';

  @override
  String get linkExpires => 'Vence';

  @override
  String get linkNever => 'Nunca';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'En $daysString días',
      one: 'En 1 día',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Usos';

  @override
  String get linkUnlimited => 'Ilimitados';

  @override
  String linkUses(String uses) {
    return '$uses usados';
  }

  @override
  String get linkRevoked => 'Revocado';

  @override
  String get revokeLink => 'Revocar';

  @override
  String get linkCopied => 'Enlace de invitación copiado.';

  @override
  String get inviteRole => 'Rol';

  @override
  String get shareLinkLabel => 'Compartir';

  @override
  String get botFolder => 'Carpeta';

  @override
  String get noFolder => 'Sin carpeta';

  @override
  String get newFolder => 'Nueva carpeta…';

  @override
  String get folderName => 'Nombre de la carpeta';

  @override
  String get archiveBot => 'Archivar bot';

  @override
  String archiveBotTitle(String name) {
    return '¿Archivar a $name?';
  }

  @override
  String get archiveBotBody =>
      'Sale de la barra lateral y deja de ejecutarse. Sus chats e historial se conservan y puedes traerlo de vuelta desde Bots archivados.';

  @override
  String get archive => 'Archivar';

  @override
  String get archivedBots => 'Bots archivados';

  @override
  String get unarchive => 'Traer de vuelta';

  @override
  String botArchived(String name) {
    return '$name archivado.';
  }

  @override
  String get deleteBot => 'Eliminar bot';

  @override
  String deleteBotTitle(String name) {
    return '¿Eliminar $name?';
  }

  @override
  String deleteBotBody(String name) {
    return 'Todos los chats con $name se eliminan para siempre, junto con sus mensajes, fotos y archivos, y $name deja de ejecutarse y sale de la barra lateral. Los chats de grupo y los registros de uso se conservan. Sus ajustes y su memoria pasan a Bots archivados.';
  }

  @override
  String botDeleted(String name) {
    return 'Se eliminó $name.';
  }

  @override
  String get settingsHistory => 'Historial de ajustes';

  @override
  String get settingsHistoryHelp =>
      'Cada cambio en los ajustes de este bot y quién lo hizo';

  @override
  String get noHistory => 'Todavía no hay cambios.';

  @override
  String get restoreSettings => 'Restaurar estos ajustes';

  @override
  String restoreSettingsBody(String fields) {
    return '¿Volver a dejar $fields como estaban antes de este cambio? Los ajustes actuales se quedan en el historial.';
  }

  @override
  String changedByBot(String name) {
    return 'Cambiado por $name';
  }

  @override
  String get changedByPerson => 'Cambiado por una persona';

  @override
  String get changedBySystem => 'Cambiado por Casama';

  @override
  String get fieldName => 'nombre';

  @override
  String get fieldInstructions => 'instrucciones';

  @override
  String get fieldModel => 'modelo';

  @override
  String get fieldAutonomy => 'autonomía';

  @override
  String get fieldBudget => 'presupuesto';

  @override
  String get fieldComputer => 'computadora';

  @override
  String get fieldArchived => 'archivado';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot necesita una clave de $service';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Solo para $hosts';
  }

  @override
  String get secretRequestHelp => 'Va directo a la bóveda. El bot nunca la ve.';

  @override
  String secretSaved(String name) {
    return 'Se guardó $name';
  }

  @override
  String get secretDeclined => 'Rechazado';

  @override
  String secretWhat(String service) {
    return 'Clave de $service';
  }

  @override
  String totpWhat(String service) {
    return 'Código de inicio de sesión de $service';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Control devuelto: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Compartiste tu inicio de sesión para $host';
  }

  @override
  String get shareLogin => 'Compartir inicio de sesión';

  @override
  String get shareLoginUsername => 'Correo o usuario';

  @override
  String get shareLoginPassword => 'Contraseña';

  @override
  String get shareLoginRemember => 'Recordar para la próxima vez';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Solo se usa en $host. $bot nunca ve tu contraseña.';
  }

  @override
  String get shareLoginSave => 'Guardar e iniciar sesión';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot necesita que inicies sesión en $host';
  }

  @override
  String get signInOnPage => 'Iniciar sesión en la página';

  @override
  String loginOnPageLine(String host) {
    return 'Iniciando sesión en $host en la página';
  }

  @override
  String get loginOnPageHelp =>
      'Inicia sesión en la página y luego toca Devolver el control.';

  @override
  String get back => 'Atrás';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'No compartido: tu calendario',
      'reminders': 'No compartido: tus recordatorios',
      'contacts': 'No compartido: tus contactos',
      'places': 'No compartido: tus lugares',
      'photos': 'No compartido: tus fotos',
      'health': 'No compartido: tus datos de salud',
      'notifications': 'No compartido: tus notificaciones',
      'activity': 'No compartido: tu actividad en la computadora',
      'browserTab': 'No compartido: tu pestaña actual del navegador',
      'browserHistory':
          'No compartido: tu historial y marcadores del navegador',
      'alarm': 'No compartido: tus alarmas',
      'home': 'No compartido: tus accesorios de Casa',
      'other': 'No compartido: los datos de tu dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Rechazar';

  @override
  String get signInCode => 'Código de inicio de sesión';

  @override
  String get secretKindValue => 'Clave o contraseña';

  @override
  String get totpSeedLabel =>
      'Clave de configuración, enlace otpauth:// o el código que ves ahora';

  @override
  String get totpSeedHelp =>
      'Una clave de configuración de la verificación en dos pasos del sitio permite que el bot genere cada código siguiente (nunca ve la clave). O escribe el código que ves ahora: va directo al bot.';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot necesita un código de inicio de sesión de $service';
  }

  @override
  String get search => 'Buscar';

  @override
  String get searchHint =>
      'Buscar chats, recuerdos, habilidades, tickets y archivos';

  @override
  String get searchEmptyPrompt => 'Escribe al menos 2 caracteres.';

  @override
  String searchNoResults(String query) {
    return 'No se encontró nada para “$query”.';
  }

  @override
  String get searchMessages => 'Mensajes';

  @override
  String get searchChats => 'Chats';

  @override
  String get searchTickets => 'Tickets';

  @override
  String get searchFiles => 'Archivos';

  @override
  String get searchFilesAsleep =>
      'No se busca en los archivos de computadoras en reposo. Inicia una computadora para incluir sus archivos.';

  @override
  String get searchSearching => 'Buscando…';

  @override
  String get searchJumpHint => 'Buscar o ir a…';

  @override
  String get searchRecent => 'Recientes';

  @override
  String get searchClearRecent => 'Borrar';

  @override
  String get searchRemoveRecent => 'Quitar de búsquedas recientes';

  @override
  String get searchJumpBackIn => 'Retomar';

  @override
  String get searchNeedsYou => 'Te necesita';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cosas están esperándote',
      one: '1 cosa está esperándote',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Ir a';

  @override
  String get searchTopHits => 'Principales resultados';

  @override
  String get searchScopeAll => 'Todo';

  @override
  String get searchMemories => 'Recuerdos';

  @override
  String get searchKeepTyping =>
      'Sigue escribiendo para buscar mensajes, recuerdos y archivos.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Preguntar a $bot sobre “$query”';
  }

  @override
  String get searchAskBotHelp => 'Inicia un nuevo chat con esta pregunta';

  @override
  String get searchKeysHint =>
      '↑ ↓ para moverte   ↵ para abrir   esc para cerrar';

  @override
  String get searchClear => 'Borrar búsqueda';

  @override
  String get installFor => 'Instalar para';

  @override
  String get wholeWorkspace => 'Todo el espacio de trabajo';

  @override
  String get skillCatalog => 'Catálogo de habilidades';

  @override
  String get searchSkills => 'Buscar habilidades';

  @override
  String get all => 'Todas';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Instalar';

  @override
  String skillInstalled(String name) {
    return 'Se instaló $name.';
  }

  @override
  String get noResults => 'Sin resultados.';

  @override
  String get importFromGitHub => 'Importar desde GitHub';

  @override
  String get importFromGitHubHelp =>
      'Pega un enlace a una carpeta con un SKILL.md. Verás cada archivo antes de instalar nada. Los repositorios privados usan un secreto GITHUB_TOKEN permitido para api.github.com.';

  @override
  String get preview => 'Vista previa';

  @override
  String get skillScriptsNote =>
      'Los scripts de una habilidad solo se ejecutan en la computadora de un bot, nunca en el servidor.';

  @override
  String get binaryFile => '(archivo binario)';

  @override
  String skillUpdate(String name) {
    return 'Actualizar $name';
  }

  @override
  String get checkingForUpdates => 'Buscando actualizaciones…';

  @override
  String get skillUpToDate => 'Ya está actualizada.';

  @override
  String get update => 'Actualizar';

  @override
  String get filesAdded => 'Agregados';

  @override
  String get filesChanged => 'Cambiados';

  @override
  String get filesRemoved => 'Quitados';

  @override
  String get fromCatalog => 'Del catálogo';

  @override
  String get savedByBot => 'Guardada por un bot';

  @override
  String get checkForUpdates => 'Buscar actualizaciones';

  @override
  String get attachSkill => 'Adjuntar una habilidad';

  @override
  String get rerunSetup => 'Ejecutar configuración de nuevo';

  @override
  String get rerunSetupHelp =>
      'Responde de nuevo las preguntas de configuración y revisa una nueva propuesta';

  @override
  String get trace => 'Traza';

  @override
  String get openTrace => 'Abrir traza';

  @override
  String get editMessage => 'Editar';

  @override
  String get editMessageHelp =>
      'Enviar vuelve a ejecutar la conversación desde aquí. La versión original se conserva; cambia con las flechas.';

  @override
  String get previousVersion => 'Versión anterior';

  @override
  String get nextVersion => 'Versión siguiente';

  @override
  String get quietHours => 'Horas de silencio';

  @override
  String get quietHoursHelp =>
      'Las notificaciones esperan hasta que terminen las horas de silencio; tu buzón se sigue llenando. Las aprobaciones de un chat en el que estás siguen llegando.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start a $end';
  }

  @override
  String get off => 'Desactivado';

  @override
  String get botNotifications => 'Notificaciones de este bot';

  @override
  String get botNotificationsHelp => 'Si este bot sigue tus horas de silencio';

  @override
  String get botMayCall => 'Puede llamarme';

  @override
  String get botMayCallHelp =>
      'Este bot puede llamarte cuando algo amerita una llamada. Desactivado: envía una notificación en su lugar.';

  @override
  String get quietDefault => 'Seguir mis horas de silencio';

  @override
  String get quietAlways => 'Notificarme siempre';

  @override
  String get quietCustom => 'Sus propias horas de silencio';

  @override
  String get from => 'Desde';

  @override
  String get until => 'Hasta';

  @override
  String get shareAsTemplate => 'Compartir como plantilla';

  @override
  String get shareAsTemplateRow =>
      'Un archivo o enlace con sus instrucciones, habilidades y rutinas';

  @override
  String get shareAsTemplateHelp =>
      'Incluye instrucciones, habilidades, rutinas y los servicios que usa. Nunca claves ni secretos.';

  @override
  String get copyLink => 'Copiar enlace';

  @override
  String get includeMemories => 'Incluir recuerdos';

  @override
  String get includeMemoriesHelp =>
      'Lo que ha aprendido sobre ti. Comparte con cuidado.';

  @override
  String get saveAsFile => 'Guardar como archivo';

  @override
  String get notABotTemplate =>
      'Ese archivo no es una plantilla de bot de Casama.';

  @override
  String get importBot => 'Importar un bot';

  @override
  String botImported(String name) {
    return '$name está listo.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name está listo. Conecta $services en Integraciones para que pueda usarlos.';
  }

  @override
  String get whatComesWithIt => 'Qué incluye';

  @override
  String get connectAfterImport => 'Conectar después de importar';

  @override
  String get importRoutines => 'Programar sus rutinas';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Conservar sus $countString recuerdos',
      one: 'Conservar su 1 recuerdo',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Iniciando la rutina…';

  @override
  String get offlineSaved => 'Sin conexión. Mostrando mensajes guardados.';

  @override
  String get loadEarlierMessages => 'Mensajes anteriores';

  @override
  String get chatLoadFailedTitle => 'Este chat no se cargó';

  @override
  String get chatLoadFailedBody => 'Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get projects => 'Proyectos';

  @override
  String get newProject => 'Nuevo proyecto';

  @override
  String get noProjects => 'Todavía no hay proyectos';

  @override
  String get projectsHelp =>
      'Un proyecto reúne un trabajo en un solo lugar: su chat, plan, tareas pendientes, archivos y todo lo creado para él. Trabaja en él con un bot o deja que el bot lo planifique y trabaje por su cuenta.';

  @override
  String get newProjectHelp =>
      'Reúne un trabajo en un solo lugar: su chat, plan, tareas pendientes, archivos y todo lo creado para él.';

  @override
  String get startPlanning => 'Empezar a planificar';

  @override
  String get projectTitle => 'Título';

  @override
  String get projectGoal => 'Objetivo';

  @override
  String get projectDoneWhen => 'Listo cuando';

  @override
  String get projectLead => 'Bot líder';

  @override
  String get projectBudget => 'Presupuesto';

  @override
  String get projectGoalHint =>
      '¿Qué debería existir al final? Una página de inicio publicada en mi dominio…';

  @override
  String get projectDoneHint => 'Opcional. Cómo sabrás que terminó';

  @override
  String get projectBudgetHint =>
      'Opcional. El trabajo se pausa cuando se gasta';

  @override
  String get projectThread => 'Chat del proyecto';

  @override
  String get approvePlan => 'Aprobar el plan';

  @override
  String get pause => 'Pausar';

  @override
  String get resume => 'Reanudar';

  @override
  String get milestones => 'Hitos';

  @override
  String get needsSignoff => 'necesita tu visto bueno';

  @override
  String get signOff => 'Aprobar';

  @override
  String get projectPlan => 'Plan';

  @override
  String get tickets => 'Tickets';

  @override
  String get projectTimeline => 'Cronograma';

  @override
  String get projectPlanning => 'Planificando';

  @override
  String get projectActive => 'Activo';

  @override
  String get projectPaused => 'En pausa';

  @override
  String get projectBlocked => 'Bloqueado';

  @override
  String get projectDone => 'Listo';

  @override
  String get projectCancelled => 'Cancelado';

  @override
  String get projectName => 'Nombre';

  @override
  String get projectNameHint => 'Esquiva en el espacio, boletín de primavera…';

  @override
  String get createProject => 'Crear proyecto';

  @override
  String projectWorksAlone(String bot) {
    return 'Dejar que $bot trabaje en ello por su cuenta';
  }

  @override
  String get projectWorksAloneHelp =>
      'Redacta un plan para que lo apruebes y luego trabaja en sesiones hasta cumplir el objetivo. Nada empieza antes de que apruebes.';

  @override
  String get projectWorksAloneOn =>
      'Trabaja en sesiones hasta cumplir el objetivo.';

  @override
  String get projectWorksAloneOff => 'Trabajan en ello juntos en su chat.';

  @override
  String get projectMade => 'Hecho en este proyecto';

  @override
  String projectMadeEmpty(String bot) {
    return 'Nada todavía. Lo que $bot haga en el chat de este proyecto aparece aquí.';
  }

  @override
  String get projectSeeAll => 'Ver todo';

  @override
  String get projectTodos => 'Pendientes';

  @override
  String get projectFiles => 'Archivos';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder en la computadora de $bot';
  }

  @override
  String get projectMarkDone => 'Marcar como listo';

  @override
  String get projectReopen => 'Reabrir';

  @override
  String get projectCover => 'Portada';

  @override
  String get projectCoverNone => 'Ninguna';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Velero',
      'mountain': 'Montaña',
      'seedling': 'Brote',
      'compass': 'Brújula',
      'lantern': 'Linterna',
      'telescope': 'Telescopio',
      'map': 'Mapa',
      'chess': 'Ajedrez',
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
      other: '$countString elementos',
      one: '1 elemento',
      zero: 'Nada todavía',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Proyecto';

  @override
  String get creationMoveToProject => 'Mover al proyecto';

  @override
  String get creationNoProject => 'Sin proyecto';

  @override
  String get makeProject => 'Convertir en proyecto';

  @override
  String get makeProjectTitle => 'Convertir este tema en un proyecto';

  @override
  String makeProjectHelp(String bot) {
    return 'Lo que $bot hizo en este tema se archiva bajo el proyecto, al igual que lo que haga aquí después.';
  }

  @override
  String get openProject => 'Abrir proyecto';

  @override
  String get theBot => 'el bot';

  @override
  String get forYou => 'Para ti';

  @override
  String get inboxNeedsYou => 'Te necesita';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Te necesita ($nString)';
  }

  @override
  String get inboxBriefs => 'Resúmenes';

  @override
  String get inboxUpdates => 'Novedades';

  @override
  String get inboxEmptyHelp =>
      'Las solicitudes, resúmenes de la mañana, notificaciones y páginas nuevas de tus bots aparecen aquí.';

  @override
  String get inboxNeedsYouEmpty => 'Nada te necesita ahora mismo';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Cuando un bot necesite una decisión, tu ayuda o tenga una idea, aparece aquí.';

  @override
  String get noBriefs => 'Todavía no hay resúmenes de la mañana';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot publicó $title';
  }

  @override
  String get forYouEmpty => 'Nada para ti ahora mismo';

  @override
  String get forYouEmptyHelp =>
      'Activa los avisos en los ajustes de un bot para recibir un resumen de la mañana y sugerencias durante el día.';

  @override
  String morningBriefFrom(String name) {
    return 'Resumen de la mañana de $name';
  }

  @override
  String get suggestions => 'Sugerencias';

  @override
  String suggestedBy(String name) {
    return 'Sugerido por $name';
  }

  @override
  String get dismissSuggestion => '¿Descartar esta sugerencia?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Elige si $bot puede volver a mencionarlo.';
  }

  @override
  String get justThisOnce => 'Solo esta vez';

  @override
  String justThisOnceHelp(String bot) {
    return 'Ocúltalo por ahora. Si sigue importando después, $bot puede sugerirlo otra vez.';
  }

  @override
  String get dontSuggestAgain => 'No volver a sugerirlo';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Se descarta para siempre. $bot recordará que prefieres que no.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Entendido. $bot no volverá a sugerir eso.';
  }

  @override
  String get doIt => 'Hacerlo';

  @override
  String get checkins => 'Avisos';

  @override
  String get checkinsHelp =>
      'Un resumen de la mañana y, cada pocas horas, una revisión de lo que requiere tu atención. Desactivado por defecto.';

  @override
  String get briefTime => 'Resumen de la mañana a las';

  @override
  String get scanEvery => 'Revisar cada';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString horas',
      one: '$countString hora',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Límite diario';

  @override
  String get on => 'Activado';

  @override
  String get actionRules => 'Reglas de acción';

  @override
  String get actionRulesRow => 'Qué puede hacer sin preguntar';

  @override
  String get actionRulesHelp =>
      'Las reglas deciden por cada acción: permitir, permitir con límites, preguntar antes o pasártela para que termines. Gana la regla más específica; sin regla, decide la autonomía del bot. Los bots no pueden cambiar sus propias reglas.';

  @override
  String get addRule => 'Agregar una regla';

  @override
  String get addRuleHelp =>
      'Elige qué está haciendo el bot y cómo debe manejarlo.';

  @override
  String get noRules =>
      'Todavía no hay reglas. Decide el nivel de autonomía del bot.';

  @override
  String get otherTools => 'Herramientas específicas';

  @override
  String get workspaceRule => 'Regla del espacio de trabajo';

  @override
  String get catSend => 'Enviar mensajes';

  @override
  String get catPay => 'Pagar';

  @override
  String get catDelete => 'Eliminar';

  @override
  String get catPublish => 'Publicar';

  @override
  String get catShare => 'Compartir e invitar';

  @override
  String get catSignIn => 'Iniciar sesión';

  @override
  String get whenTheBot => 'Cuando el bot va a';

  @override
  String get itShould => 'Debe';

  @override
  String get ruleAllow => 'Seguir adelante';

  @override
  String get ruleAllowLimits => 'Seguir adelante dentro de límites';

  @override
  String get ruleAsk => 'Preguntarme primero';

  @override
  String get ruleHandOff => 'Pasármelo para terminar';

  @override
  String get ruleDomains => 'Solo a estos dominios (separados por comas)';

  @override
  String get ruleMaxAmount => 'Hasta este monto';

  @override
  String get ruleForWorkspace => 'Para cada bot del espacio de trabajo';

  @override
  String get watchers => 'Seguimientos';

  @override
  String get watchersRow => 'Qué está vigilando';

  @override
  String get noWatchers => 'No vigila nada';

  @override
  String get watchersHelp =>
      'Pídele al bot “avísame cuando…” y vigilará una página, una respuesta, un resultado o una hora. Las revisiones no cuestan nada hasta que algo cambia.';

  @override
  String get watcherActive => 'Vigilando';

  @override
  String get watcherPaused => 'En pausa';

  @override
  String get watcherDone => 'Listo';

  @override
  String get watcherExpired => 'Vencido';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'activado $countString veces',
      one: 'activado una vez',
      zero: 'sin activarse aún',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Conectar una app de IA';

  @override
  String connectAiAppAsk(String app) {
    return '$app quiere usar Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'Puede listar tus bots, pedirles cosas y leer resultados en el espacio de trabajo que elijas, como tú. Las aprobaciones y reglas de tus bots siguen aplicando.';

  @override
  String get connectAiAppSendsTo => 'Después de permitirlo, vuelves a';

  @override
  String get connectAiAppUnknown =>
      'Casama no reconoce esta dirección. Cualquiera puede darle cualquier nombre a una app, así que solo permítelo si iniciaste esta conexión tú y confías en este sitio.';

  @override
  String get connectAiAppDone => 'Listo. Ya puedes volver a la app de IA.';

  @override
  String get refuse => 'Rechazar';

  @override
  String get allow => 'Permitir';

  @override
  String get connectAiApps => 'Conectar apps de IA';

  @override
  String get connectAiAppsHelp =>
      'Las apps compatibles con MCP se conectan a esta dirección e inician sesión, o usan una clave de API. Actúan como la persona que las conectó.';

  @override
  String get connectedAiApps => 'Apps de IA conectadas';

  @override
  String get connectedAiAppsHelp =>
      'Apps que conectaste al iniciar sesión. Desconecta una y pierde el acceso a este espacio de trabajo enseguida.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Apps que las personas de este espacio de trabajo conectaron al iniciar sesión. Desconecta una y pierde el acceso enseguida.';

  @override
  String get noConnectedAiApps => 'Todavía no hay apps de IA conectadas.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Usada $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Conectada $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Deja de funcionar en este espacio de trabajo enseguida. Para volver a usarla, conéctala de nuevo desde la app.';

  @override
  String get mcpApprovals => 'Permitir aprobaciones desde apps de IA';

  @override
  String get mcpApprovalsHelp =>
      'Las apps conectadas pueden aprobar las acciones de tus bots.';

  @override
  String get newApiKey => 'Nueva clave de API';

  @override
  String get apiKeyName => 'Nombre';

  @override
  String get newGroupChat => 'Nuevo chat grupal';

  @override
  String get groupChats => 'Chats grupales';

  @override
  String groupWhoAnswers(String names) {
    return '$names responderán';
  }

  @override
  String get groupEveryoneAnswers => 'Todos responderán';

  @override
  String get groupMentionHint => '@menciona a un bot o @everyone';

  @override
  String routineRan(String name) {
    return 'La rutina “$name” se ejecutó';
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
      other: '$countString cosas esperándote',
      one: '1 cosa esperándote',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Reúne de 2 a 10 bots en un chat. @Nombre le pregunta a un bot; @everyone le pide al líder que planifique y reparta el trabajo.';

  @override
  String get groupCreate => 'Crear chat grupal';

  @override
  String get groupCrewEmpty => 'Elige bots abajo para armar el grupo.';

  @override
  String get groupLeadShort => 'Líder';

  @override
  String get groupMakeLead => 'Hacer líder';

  @override
  String groupRemoveBot(String name) {
    return 'Quitar a $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Elige $count bots más',
      one: 'Elige 1 bot más',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Ya son 10 bots, el máximo que puede tener un grupo.';

  @override
  String get groupLeadHint =>
      'El líder hace un plan del trabajo cuando usas @everyone. Toca otro bot arriba para hacerlo líder.';

  @override
  String groupLeadIs(String name) {
    return '$name lidera: hace un plan del trabajo cuando usas @everyone. Toca otro bot arriba para hacerlo líder.';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return 'Elige 1 bot más. $name lidera; toca otro bot arriba para hacerlo líder.';
  }

  @override
  String get groupNeedTwoBots =>
      'Un chat grupal necesita al menos dos bots. Crea otro bot primero.';

  @override
  String get groupSearchBots => 'Buscar bots';

  @override
  String get groupNoMatch => 'Ningún bot coincide con ese nombre.';

  @override
  String get groupTitle => 'Nombre (opcional)';

  @override
  String get groupPickBots => 'Bots';

  @override
  String get groupLead => 'Lidera el grupo';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Páginas';

  @override
  String get pagesRow => 'Informes y paneles que publicó';

  @override
  String get noPages => 'Todavía no hay páginas';

  @override
  String get pagesHelp =>
      'Pídele a un bot un informe, panel o registro y puede publicarlo como una página. Las páginas se abren en tu navegador y son privadas hasta que las compartas.';

  @override
  String get pagePrivate => 'Solo yo';

  @override
  String get pageWorkspace => 'Espacio de trabajo';

  @override
  String get pagePublic => 'Cualquiera con el enlace';

  @override
  String get pageRefreshes => 'Se actualiza según horario';

  @override
  String get pageCardOpen => 'Página · Toca para abrir';

  @override
  String get exportPdf => 'Exportar PDF';

  @override
  String get pageMakePublicTitle => '¿Hacer pública esta página?';

  @override
  String get pageMakePublicBody =>
      'Cualquiera con el enlace podrá abrirla, incluidos los datos que contiene. Puedes deshacerlo cuando quieras; el enlace dejará de funcionar.';

  @override
  String get pageMakePublic => 'Hacer pública';

  @override
  String get pagePublicLinkTitle => 'Enlace público';

  @override
  String get pagePublicLinkBody => 'Copiado. No aparece en buscadores.';

  @override
  String deletePageTitle(String title) {
    return '¿Eliminar “$title”?';
  }

  @override
  String get openPages => 'Abrir en Páginas';

  @override
  String get discard => 'Descartar';

  @override
  String get discardChangesTitle => '¿Descartar cambios?';

  @override
  String get discardChangesBody => 'Tus ediciones no se han guardado.';

  @override
  String get keepEditing => 'Seguir editando';

  @override
  String get teachTask => 'Enseñar una tarea';

  @override
  String get teachWhichBot => '¿Qué bot debería aprender esto?';

  @override
  String get teachRecording => 'Grabando';

  @override
  String get teachRecordingPaused => 'Grabación detenida';

  @override
  String get teachRecordingHelp =>
      'Haz la tarea como lo haces normalmente. Cada paso se guarda con lo que hay en pantalla; los campos de contraseña nunca se guardan.';

  @override
  String get teachStop => 'Detener';

  @override
  String get teachMarkSecret => 'Marcar como secreto';

  @override
  String get teachMarkSecretHelp =>
      'Lo que acabas de escribir se borra de la grabación y pasa a ser un dato secreto que el bot pide.';

  @override
  String get teachDraftTitle => 'Nueva habilidad';

  @override
  String get teachDrafting =>
      'Escribiendo una habilidad a partir de tu grabación…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pasos',
      one: '1 paso',
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
      other: '$countString pasos',
      one: '1 paso',
    );
    return 'Lo que mostraste ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Revisa los pasos, entradas y comprobaciones de éxito y luego guarda. Puedes probarla enseguida.';

  @override
  String get teachDraftFailed =>
      'El bot no pudo redactar un borrador. Escribe los pasos tú mismo a partir de la grabación abajo o descártala.';

  @override
  String get teachAlreadySaved => 'Esta habilidad está guardada';

  @override
  String get teachSaveAndTry => 'Guardar y probar';

  @override
  String teachSaved(String name) {
    return 'Se guardó $name';
  }

  @override
  String get teachDiscardTitle => '¿Descartar esta grabación?';

  @override
  String get teachDiscardBody =>
      'Cada paso, instantánea y captura que registró se elimina.';

  @override
  String teachStepClick(int x, int y) {
    return 'Clic en $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Escribir “$text”';
  }

  @override
  String teachStepSecret(String name) {
    return 'Escribir secreto $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Presionar $key';
  }

  @override
  String get teachStepScroll => 'Desplazar';

  @override
  String get plugins => 'Plugins';

  @override
  String get pluginsRow => 'Habilidades y herramientas de paquetes de plugins';

  @override
  String get noPlugins => 'Todavía no hay plugins';

  @override
  String get pluginsHelp =>
      'Los plugins son paquetes de Agent Plugins 1.0 en GitHub. Pueden traer habilidades y herramientas MCP; sus servidores se ejecutan en la computadora de este bot, nunca en los servidores de Casama.';

  @override
  String get addPlugin => 'Agregar un plugin';

  @override
  String get addPluginHelp =>
      'Pega un enlace de GitHub a la carpeta del plugin. Verás qué agrega antes de instalar nada.';

  @override
  String get pluginAdds => 'Agrega';

  @override
  String pluginStdio(String command) {
    return 'Se ejecuta en la computadora del bot: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Se conecta a $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Se comunica con: $hosts';
  }

  @override
  String get pluginSkill => 'Habilidad';

  @override
  String get pluginHosts => 'Red';

  @override
  String get pluginServerError => 'No pudo iniciar';

  @override
  String get pluginRunsOnComputer => 'Se ejecuta en la computadora del bot';

  @override
  String get pluginWhereToolsRun => 'Dónde se ejecutan sus herramientas';

  @override
  String get pluginWhereToolsRunHelp =>
      'En tu propia computadora las herramientas pueden usar lo que hay allí, y solo tú puedes usarlas desde tus propios chats. Los servidores en internet no se ven afectados.';

  @override
  String get pluginPlaceBot => 'La computadora del bot';

  @override
  String pluginPlaceMine(String name) {
    return 'Mi computadora: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Se ejecuta en $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Sus herramientas solo funcionan en chats con la persona dueña de esa computadora';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Sin conexión: sus herramientas vuelven a funcionar cuando la app de Casama esté abierta allí';

  @override
  String get pluginUpToDate => 'Ya está actualizado';

  @override
  String get checkForUpdate => 'Buscar actualización';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String uninstallPluginTitle(String name) {
    return '¿Desinstalar $name?';
  }

  @override
  String get uninstallPluginBody =>
      'Sus habilidades, herramientas, archivos y secretos guardados se quitan de este bot.';

  @override
  String updatePluginTitle(String name) {
    return 'Actualizar $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Nuevas habilidades: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Habilidades cambiadas: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Habilidades quitadas: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Nuevos servidores de herramientas: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Servidores de herramientas cambiados: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Servidores de herramientas quitados: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Se comunica con nuevos hosts: $hosts';
  }

  @override
  String get pluginDiffNone => 'Sin cambios en lo que agrega.';

  @override
  String get next => 'Siguiente';

  @override
  String get botNameLabel => 'Nombre';

  @override
  String get importAgent => 'Importar un agente';

  @override
  String get importAgentHelp =>
      'Trae un bot desde OpenClaw o Hermes Agent, o pega una configuración de Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark o Instinct: su personalidad, habilidades, horarios y recuerdos. Revisarás todo antes de crearlo. Las claves y archivos de ajustes nunca se leen.';

  @override
  String get importAgentPickFolder => 'Elegir su carpeta';

  @override
  String get importAgentPickZip => 'Subir un ZIP de su carpeta';

  @override
  String get importPasteChoice => 'Pegar la configuración de un bot';

  @override
  String get importPasteChoiceHelp =>
      'De Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct u otra app';

  @override
  String get importPasteTitle => 'Pegar la configuración de un bot';

  @override
  String get importPasteHelp =>
      'Envíale a tu bot el prompt de abajo y luego pega toda su respuesta. Revisarás todo antes de crear el nuevo bot.';

  @override
  String get importPasteSource => '¿Dónde está tu bot ahora?';

  @override
  String get importPasteOther => 'En otro lugar';

  @override
  String get importPasteStep1 => '1. Envíale este prompt a tu bot';

  @override
  String get importPasteReply => '2. Pega su respuesta';

  @override
  String get importPasteSafety =>
      'Se quitan las líneas que parecen claves, contraseñas o números de tarjeta. Vuelve a iniciar sesión en sus apps después de importar.';

  @override
  String get importPasteSubtitle => 'Configuración pegada';

  @override
  String get agentImportReviewHelp =>
      'Desmarca lo que no quieras. No se crea nada hasta que importes.';

  @override
  String get agentImportNoPersona =>
      'No se encontró ningún archivo de personalidad.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString habilidades',
      one: '1 habilidad',
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
      other: '$countString rutinas',
      one: '1 rutina',
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
      other: '$countString recuerdos',
      one: '1 recuerdo',
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
      other: '$countString otros archivos',
      one: '1 otro archivo',
    );
    return 'Copiar $_temp0 a ~/imported/ en su computadora';
  }

  @override
  String agentImportSkipped(String files) {
    return 'No importado: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Se importó $name y se copiaron $countString archivos a su computadora';
  }

  @override
  String agentImportedFilesLater(String name) {
    return 'Se importó $name. Sus otros archivos no pudieron copiarse todavía; dale una computadora e importa de nuevo para copiarlos.';
  }

  @override
  String get importMemoryTitle => 'Importar recuerdos de ChatGPT o Claude';

  @override
  String get importMemoryHelp =>
      'Copia este prompt en ChatGPT o Claude y luego pega su respuesta abajo.';

  @override
  String get importMemoryPick => 'Conserva lo correcto; desmarca el resto.';

  @override
  String get importMemoryPaste => 'Su respuesta';

  @override
  String get importMemoryNone =>
      'No se encontraron recuerdos en esa respuesta.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se agregaron $countString recuerdos',
      one: 'Se agregó 1 recuerdo',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Rutinas y habilidades como archivos';

  @override
  String get routinesAsFilesHelp =>
      'Cada rutina y habilidad como un archivo Markdown: expórtalas, edítalas donde quieras, impórtalas de vuelta o guárdalas en un repositorio de GitHub.';

  @override
  String get exportFiles => 'Exportar como archivos';

  @override
  String get importFiles => 'Importar archivos';

  @override
  String get importFilesApply => 'Aplicar';

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

    return '$createdString nuevos, $updatedString cambiados, $unchangedString sin cambios';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Importados: $createdString nuevos, $updatedString cambiados';
  }

  @override
  String get gitSync => 'Sincronización con Git';

  @override
  String get gitSyncOff => 'Desactivada';

  @override
  String get gitSyncHelp =>
      'Los cambios en Casama se guardan con commit en el repositorio, y los push actualizan Casama después de revisarse. Si un archivo cambió en ambos lugares, Casama conserva su versión y abre un pull request. Necesita un secreto GITHUB_TOKEN permitido para api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Necesita un secreto GITHUB_TOKEN';

  @override
  String gitSyncedWhen(String when) {
    return 'Sincronizado $when';
  }

  @override
  String get gitSyncPr => 'Pull request esperándote';

  @override
  String get syncNow => 'Sincronizar ahora';

  @override
  String get syncQueued => 'Sincronizando en un minuto';

  @override
  String get gitBranch => 'Rama';

  @override
  String get gitFolder => 'Carpeta en el repositorio (opcional)';

  @override
  String get gitSyncOn => 'Sincronización activada';

  @override
  String get gitSyncRemove => 'Dejar de sincronizar';

  @override
  String get gitWebhookTitle => 'Agrega este webhook al repositorio';

  @override
  String get gitWebhookHelp =>
      'En la configuración del repositorio, agrega un webhook para eventos push con esta dirección y secreto (tipo de contenido application/json). El secreto se muestra solo ahora.';

  @override
  String get gitWebhookUrl => 'URL de carga útil';

  @override
  String get gitWebhookSecret => 'Secreto';

  @override
  String get knowledge => 'Conocimiento';

  @override
  String get knowledgeRow => 'Documentos que puede buscar y citar';

  @override
  String get noKnowledge => 'Todavía no hay conocimiento';

  @override
  String get knowledgeHelp =>
      'Dale archivos, un sitio web o un repositorio de GitHub. Los busca cuando hace falta y te dice de qué documento salió una respuesta.';

  @override
  String get addKnowledge => 'Agregar conocimiento';

  @override
  String get addKnowledgeHelp =>
      'Archivos PDF, Word, Markdown, HTML, CSV o texto; un sitio web (un dominio, siguiendo su robots.txt); o los documentos de un repositorio. Los sitios web y repositorios se actualizan a diario.';

  @override
  String get knowledgeFiles => 'Archivos';

  @override
  String get knowledgeWebsite => 'Sitio web';

  @override
  String get knowledgePickFiles => 'Elegir archivos';

  @override
  String get knowledgeWebsiteUrl => 'Dirección del sitio web';

  @override
  String get knowledgeRepoUrl => 'Enlace de GitHub';

  @override
  String get knowledgeShareAll =>
      'Compartir con cada bot del espacio de trabajo';

  @override
  String get knowledgeShared => 'Todo el espacio de trabajo';

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
      other: '$docsString documentos',
      one: '1 documento',
    );
    return '$_temp0, $chunksString fragmentos';
  }

  @override
  String get knowledgeError => 'No se pudo leer';

  @override
  String get knowledgeSyncing => 'Leyendo…';

  @override
  String get knowledgePending => 'Esperando lectura';

  @override
  String get add => 'Agregar';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot sugiere una habilidad: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot sugiere mejorar $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Usa: $tools';
  }

  @override
  String get saveSkill => 'Guardar habilidad';

  @override
  String get applyEdit => 'Aplicar cambio';

  @override
  String skillSaved(String name) {
    return 'Se guardó $name';
  }

  @override
  String skillUpdated(String name) {
    return 'Se actualizó $name';
  }

  @override
  String get skillStats => 'Cómo va';

  @override
  String get skillNotUsedYet => 'Aún sin usar';

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

    return 'Usada $usesString veces · $rateString% salió bien · $failuresString fallaron · $correctionsString corregidas';
  }

  @override
  String skillLastFailure(String date) {
    return 'Último problema: $date';
  }

  @override
  String get skillHistory => 'Versiones anteriores';

  @override
  String get replays => 'Repeticiones';

  @override
  String get replaysRow => 'Pasos grabados que ejecuta sin pensar';

  @override
  String get noReplays => 'Todavía no hay repeticiones';

  @override
  String get replaysHelp =>
      'Una repetición es una serie grabada de pasos en navegador o escritorio que el bot ejecuta tal cual, más rápido y más barato. Si un paso deja de funcionar, el bot toma el control desde ahí y puede actualizar la repetición. Guarda una al enseñar una tarea o pídele al bot que guarde lo que acaba de hacer.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pasos',
      one: '1 paso',
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
      other: 'se ejecutó $runsString veces',
      one: 'se ejecutó $runsString vez',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString necesitaron ayuda',
      one: '$failuresString necesitó ayuda',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Ejecutar $name';
  }

  @override
  String get runReplayHelp =>
      'Revisa los valores que rellena y luego ejecútala.';

  @override
  String get run => 'Ejecutar';

  @override
  String get saveAsReplay => 'Guardar también como repetición';

  @override
  String replaySaved(String name) {
    return 'Se guardó la repetición $name';
  }

  @override
  String get passwordManagers => 'Administradores de contraseñas';

  @override
  String get passwordManagersRow =>
      'Inicios de sesión de 1Password o Bitwarden para bots';

  @override
  String get noPasswordManagers =>
      'No hay administradores de contraseñas conectados';

  @override
  String get passwordManagersHelp =>
      'Los bots pueden iniciar sesión con accesos de las bóvedas que elijas. Nunca ven una contraseña: se rellena en el navegador únicamente en los sitios propios de ese acceso.';

  @override
  String get connectPasswordManager =>
      'Conectar un administrador de contraseñas';

  @override
  String get pmWorkspace => 'Todo el espacio de trabajo';

  @override
  String get pmJustMe => 'Solo yo';

  @override
  String get pmNoVaults => 'Todavía no se eligieron bóvedas';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bóvedas',
      one: '1 bóveda',
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
      other: '$countString inicios de sesión',
      one: '1 inicio de sesión',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Usa un servidor 1Password Connect con el token de una cuenta de servicio.';

  @override
  String get pmBitwardenHelp =>
      'Usa la API de gestión de bóvedas de Bitwarden (bw serve) para las colecciones de tu organización.';

  @override
  String get pmConnectUrl => 'Dirección del servidor Connect';

  @override
  String get pmConnectToken => 'Token de Connect';

  @override
  String get pmBwUrl => 'Dirección de bw serve';

  @override
  String get pmBwToken => 'Token de acceso (opcional)';

  @override
  String get pmForWorkspace => 'Para todo el espacio de trabajo';

  @override
  String get pmChooseVaults => 'Bóvedas que los bots pueden usar';

  @override
  String get pmChooseVaultsHelp =>
      'Solo los inicios de sesión de las bóvedas o colecciones que marques están disponibles para los bots.';

  @override
  String get welcomeGettingReady => 'Preparando tu espacio…';

  @override
  String get setUpManually => 'Configurar manualmente';

  @override
  String get tryAgain => 'Reintentar';

  @override
  String get inviteLinkCopied =>
      'Enlace de invitación copiado. Envíalo a las personas con las que trabajas.';

  @override
  String get inviteFriends => 'Invitar amistades';

  @override
  String inviteFriendsRow(String amount) {
    return 'Gana $amount de uso gratis por cada amistad que se una';
  }

  @override
  String get inviteFriendsRowPlain => 'Comparte Casama con tus amistades';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Regala Casama, recibe $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Comparte Casama con amistades';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Envía tu enlace a una amistad. Cuando se registre y termine su primer chat, recibes $amount de uso gratis.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Envía tu enlace a una amistad. Puede registrarse enseguida.';

  @override
  String get inviteFriendsYourCode =>
      'Tu código de invitación. Toca para copiar.';

  @override
  String get inviteFriendsShare => 'Compartir enlace';

  @override
  String get inviteFriendsCopyLink => 'Copiar enlace';

  @override
  String get inviteFriendsCopied => 'Copiado. Envíalo a una amistad.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Únete a Casama conmigo, donde colegas de IA hacen tareas por ti: $link (código de invitación $code)';
  }

  @override
  String get inviteFriendsProgress => 'Tus invitaciones';

  @override
  String get inviteFriendsJoined => 'Amistades que se unieron';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString todavía no terminaron su primer chat',
      one: '1 todavía no terminó su primer chat',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Uso gratis ganado';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString amistades más pueden darte una recompensa',
      one: '$countString amistad más puede darte una recompensa',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Ya ganaste el máximo que dan las invitaciones. ¡Gracias!';

  @override
  String get inviteFriendsHow => 'Cómo funciona';

  @override
  String get inviteFriendsStep1 =>
      'Comparte tu enlace o código con una amistad';

  @override
  String get inviteFriendsStep2 =>
      'Se registra e ingresa tu código dentro de una semana';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Cuando termina su primer chat, recibes $amount de uso gratis';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Empiezan con sus propios colegas de IA';

  @override
  String get inviteFriendsUnavailable =>
      'Las invitaciones no están disponibles en este servidor.';

  @override
  String get referralHaveCode => '¿Tienes el código de una amistad?';

  @override
  String get referralCodeHint => 'Código de invitación';

  @override
  String get referralUse => 'Usar';

  @override
  String get referralRedeemed =>
      'Código de invitación agregado. ¡Te damos la bienvenida a Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'Te uniste con la invitación de $name. ¡Te damos la bienvenida a Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Te uniste con la invitación de $name.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Te uniste con la invitación de una amistad.';

  @override
  String referralInvitedBy(String name) {
    return '$name te invitó';
  }

  @override
  String get referralInvitedByFriend => 'Una amistad te invitó';

  @override
  String get referralWelcomeTitle => 'Te damos la bienvenida a Casama';

  @override
  String get referralWelcomeHelp =>
      'Colegas de IA que trabajan para ti en sus propias computadoras. Acepta la invitación para que quien te invitó reciba el crédito.';

  @override
  String get referralAccept => 'Aceptar invitación';

  @override
  String get referralGetStarted => 'Comenzar';

  @override
  String get referralInvalid => 'Esta invitación no funciona';

  @override
  String get referralInvalidHelp =>
      'Es posible que el código esté mal escrito. Aun así puedes registrarte y usar Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Regala $amount, recibe $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Envía tu enlace a una amistad. Cuando se registre con tu código y termine su primer chat, cada uno recibe $amount de uso gratuito.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Envía tu enlace a una amistad. Cuando se registre con tu código y termine su primer chat, tú recibes $reward de uso gratuito y la otra persona recibe $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Cuando termine su primer chat, cada uno recibe $amount de uso gratuito';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Cuando esa persona termine su primer chat, tú recibes $reward y ella recibe $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Únete a Casama, donde los colegas de IA hacen tareas por ti. Regístrate con mi código de invitación $code y recibe $amount de uso gratuito: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Ingrésalo dentro de la primera semana tras registrarte y recibe $amount de uso gratuito después de tu primer chat.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Tu bono de bienvenida de $amount está en tu espacio de trabajo.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Tu bono de bienvenida de $amount llega después de tu primer chat.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Colegas de IA que trabajan para ti en sus propias computadoras. Acepta la invitación y recibe $amount de uso gratuito después de tu primer chat.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return '¡Ya estás dentro! Tu bono de bienvenida de $amount llega después de tu primer chat.';
  }

  @override
  String get connectManaged => 'Iniciar sesión con Composio';

  @override
  String connectManagedHelp(String app) {
    return 'Casama conecta $app a través de Composio, que gestiona el inicio de sesión. Puedes desconectarlo cuando quieras.';
  }

  @override
  String get sharing => 'Uso compartido';

  @override
  String get sharingRow =>
      'Quién puede chatear con este bot, editarlo o administrarlo';

  @override
  String get sharingHelp =>
      'Todas las personas del espacio de trabajo pueden chatear con un bot a menos que lo hagas privado. Las personas que agregues pueden chatear, editar sus ajustes o también administrar quién tiene acceso. Un bot que trabaja para alguien solo usa la computadora personal y las conexiones de esa persona.';

  @override
  String get sharingPrivate => 'Privado';

  @override
  String get sharingPrivateOn => 'Solo tú y las personas de abajo pueden verlo';

  @override
  String get sharingPrivateOff =>
      'Todas las personas del espacio de trabajo pueden chatear con él';

  @override
  String get sharingPeople => 'Personas';

  @override
  String get sharingOnlyCreator => 'Solo su creador';

  @override
  String get sharingEveryoneChats =>
      'Todos pueden chatear; agrega a quienes deban editarlo';

  @override
  String sharingEveryoneRole(String role) {
    return 'Todas las personas que sean $role';
  }

  @override
  String get accessChat => 'Puede chatear';

  @override
  String get accessEdit => 'Puede editar';

  @override
  String get accessAdmin => 'Puede administrar';

  @override
  String get sharingSaved => 'Uso compartido guardado';

  @override
  String get triggerCalendar => 'Reuniones';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Cerca de reuniones que coincidan ($minutesString min)',
      one: 'Cerca de reuniones que coincidan ($minutesString min)',
      zero: 'Al comenzar reuniones que coincidan',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Primero conecta Google Calendar u Outlook.';

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
      one: '$minutesString min',
      zero: 'Al inicio',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Solo reuniones con personas externas a mi empresa';

  @override
  String get calendarVideoLink => 'Solo reuniones con enlace de video';

  @override
  String get calendarTitleMatch => 'Solo títulos que contengan (opcional)';

  @override
  String get fullAccess => 'Acceso total';

  @override
  String get fullAccessHelp =>
      'Los bots actúan sin preguntar antes, en sus computadoras y en tu Mac. Los pagos, los cambios de contraseña y tus propias reglas de “preguntar antes” siguen pidiendo confirmación.';

  @override
  String get fullAccessConfirmTitle => '¿Activar acceso total?';

  @override
  String get fullAccessConfirmBody =>
      'Todos los bots de este espacio de trabajo podrán enviar mensajes, eliminar archivos, ejecutar comandos en tu Mac y agregar conexiones sin pedirte confirmación antes. Los pagos y cambios de contraseña siguen pidiendo confirmación.';

  @override
  String get fullAccessTurnOn => 'Activar';

  @override
  String get botToBot => 'Los bots pueden hablar entre sí';

  @override
  String get botToBotHelp =>
      'Los bots pueden @mencionarse, enviarse mensajes y pasarse trabajo entre sí.';

  @override
  String get capMessages => 'Mensajes (iMessage)';

  @override
  String get chatApps => 'Apps de chat';

  @override
  String get chatAppsRow => 'Telegram, correo, SMS, Slack, WhatsApp y más';

  @override
  String get botEmail => 'Dirección de correo';

  @override
  String get botEmailRow => 'Dale a este bot su propia dirección';

  @override
  String botEmailClaimTitle(String name) {
    return 'Dale a $name una dirección de correo';
  }

  @override
  String get botEmailClaimHelp =>
      'Las personas pueden escribirle y responde por correo. Reenvíale lo que quieras: facturas, reservas, boletines.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'El nombre no se puede cambiar después.';

  @override
  String get botEmailNameLabel => 'Nombre';

  @override
  String botEmailWillBe(String address) {
    return 'Dirección de tu bot: $address.';
  }

  @override
  String get botEmailClaim => 'Crear dirección';

  @override
  String get botEmailTaken =>
      'Ese nombre ya está en uso. Prueba con uno de estos:';

  @override
  String get botEmailClaimed => 'Tu bot ya tiene una dirección';

  @override
  String get botEmailClaimedHelp =>
      'Ya va en camino un correo de bienvenida para ti. Respóndelo o reenvía cualquier cosa.';

  @override
  String get botEmailCopy => 'Copiar';

  @override
  String get botEmailCopied => 'Copiado';

  @override
  String get botEmailContacts => 'Agregar a contactos';

  @override
  String botEmailWrite(String name) {
    return 'Escribir a $name';
  }

  @override
  String get botEmailPaused =>
      'En pausa. Sigue recibiendo y guardando correos, pero no responde nada.';

  @override
  String get botEmailPause => 'Pausar';

  @override
  String get botEmailResume => 'Reanudar';

  @override
  String get botEmailSenders => 'Remitentes permitidos';

  @override
  String get botEmailSendersHelp =>
      'Solo estas personas reciben respuesta. Los correos de desconocidos se guardan y no inician nada.';

  @override
  String get botEmailEditSenders => 'Editar en Apps de chat';

  @override
  String get botEmailMove => 'Mover a otro bot';

  @override
  String get botEmailMoveHelp =>
      'La dirección y sus correos se mueven al otro bot.';

  @override
  String get botEmailRelease => 'Liberar dirección';

  @override
  String get botEmailReleaseHelp =>
      'Deja de recibir para siempre. El nombre no se vuelve a asignar jamás.';

  @override
  String botEmailReleaseConfirm(String address) {
    return '¿Liberar $address? Deja de recibir de inmediato y el nombre no se vuelve a asignar jamás.';
  }

  @override
  String get botEmailReleaseNow => 'Liberar';

  @override
  String get botEmailMoved => 'Movido';

  @override
  String botEmailNewBotRow(String name) {
    return 'Dale a $name una dirección de correo';
  }

  @override
  String get botEmailInbox => 'Buzón';

  @override
  String get botEmailInboxRow => 'Correos guardados, desconocidos y archivos';

  @override
  String get botEmailEmpty => 'Todavía no hay correos';

  @override
  String get botEmailStrangers => 'Desconocidos';

  @override
  String get botEmailAll => 'Todos los correos';

  @override
  String get botEmailUnconfirmed => 'No se pudo confirmar este remitente';

  @override
  String get botEmailAllow => 'Permitir';

  @override
  String get botEmailBlock => 'Bloquear';

  @override
  String get botEmailBlocked =>
      'Bloqueado. Se rechazarán los nuevos correos de esta dirección.';

  @override
  String get botEmailUnblock => 'Desbloquear';

  @override
  String get botEmailOpenChat => 'Abrir chat';

  @override
  String get botEmailFiles => 'Archivos';

  @override
  String get botEmailNewSenders => 'Avísame sobre nuevos remitentes';

  @override
  String get botEmailNewSendersHelp =>
      'Como máximo una vez al día. Desactivado a menos que lo actives.';

  @override
  String get botEmailTryTitle => 'Cosas para probar';

  @override
  String get botEmailTryForward => 'Reenvía una factura o una reserva';

  @override
  String get botEmailTryForwardHelp =>
      'Reenvía lo que quieras a la dirección de arriba. La lee y responde aquí.';

  @override
  String get botEmailTryReceipts => 'Guarda mis recibos';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Crea una rutina que archiva los correos enviados a $address.';
  }

  @override
  String get botEmailTryDigest => 'Un resumen semanal';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Crea una rutina que reúne los boletines de $address en un resumen semanal.';
  }

  @override
  String get botEmailTryCopied => 'Dirección copiada';

  @override
  String get botEmailTryMade => 'Rutina creada';

  @override
  String get botEmailReceiptsName => 'Guarda mis recibos';

  @override
  String get botEmailReceiptsInstructions =>
      'Archiva el recibo de este correo: para qué fue, cuánto y cuándo. No digas nada a menos que algo se vea mal.';

  @override
  String get botEmailDigestName => 'Resumen semanal de boletines';

  @override
  String get botEmailDigestInstructions =>
      'Reúne los boletines de esta semana y envía un resumen breve: solo los titulares que vale la pena saber, nada más.';

  @override
  String get botEmailTriggerTag => 'Etiqueta de dirección';

  @override
  String get botEmailTriggerTagHelp =>
      'Solo correos a esta etiqueta, como shop para ada+shop@. Solo direcciones de correo.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Escuchar también a remitentes sin confirmar';

  @override
  String get botEmailTriggerAutomatic => 'Escuchar también correos automáticos';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used de $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used en uso';
  }

  @override
  String get botEmailStorageFull =>
      'El buzón está lleno, así que se rechazan los correos nuevos. Elimina correos antiguos para hacer espacio.';

  @override
  String get botEmailSelect => 'Seleccionar';

  @override
  String get botEmailSelectDone => 'Listo';

  @override
  String get botEmailDelete => 'Eliminar';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Eliminar $n correos',
      one: 'Eliminar $n correo',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '¿Eliminar $n correos?',
      one: '¿Eliminar $n correo?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Su texto y sus archivos se eliminan para siempre. Las copias que ya están en un chat se quedan ahí.';

  @override
  String get botEmailDeleteOlder => 'Eliminar correos antiguos';

  @override
  String get botEmailOlder30Days => 'Más de 30 días';

  @override
  String get botEmailOlder6Months => 'Más de 6 meses';

  @override
  String get botEmailOlderYear => 'Más de un año';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': '¿Eliminar todos los correos de más de 30 días?',
      'months6': '¿Eliminar todos los correos de más de 6 meses?',
      'other': '¿Eliminar todos los correos de más de un año?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Se eliminaron $n correos',
      one: 'Se eliminó $n correo',
      zero: 'Nada para eliminar',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n direcciones de correo para bots',
      one: '$n dirección de correo para bots',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew =>
      'Los bots escriben a personas nuevas por correo';

  @override
  String get botEmailPerkRepliesOnly => 'Los bots te responden por correo';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Conectar una app de chat';

  @override
  String get chatAppsEmpty => 'Todavía no hay apps de chat';

  @override
  String get chatAppsHelp =>
      'Deja que las personas escriban a este bot desde Telegram, correo, SMS, Slack, WhatsApp, Messenger, Feishu o iMessage. Solo responde a quienes están en la lista permitida; todo lo demás queda registrado aquí.';

  @override
  String get chatAppsAddHelp =>
      'Pega las credenciales desde los ajustes de desarrollador de la app. Se guardan cifradas y nunca se vuelven a mostrar.';

  @override
  String get chatAppsKind => 'App';

  @override
  String get chatAppsSenders => 'Remitentes permitidos';

  @override
  String get chatAppsSendersHelp =>
      'Uno por línea: direcciones de correo (o *@empresa.com), números de teléfono o ID de usuario. ¿No sabes un ID? Déjalo vacío, envía un mensaje al bot y copia el ID desde Actividad.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Primero activa “Usar esta computadora para bots” con Mensajes permitido en la app de escritorio de tu Mac.';

  @override
  String chatAppsConnected(String name) {
    return '$name está conectada';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram ya está enviando mensajes aquí. Envía un mensaje a tu bot para probarlo.';

  @override
  String get chatAppsPasteUrl =>
      'Pega esta dirección en los ajustes de webhook de la app.';

  @override
  String get chatAppsWebhookUrl => 'Dirección de webhook';

  @override
  String get chatAppsVerifyToken => 'Token de verificación';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString remitentes permitidos',
      one: '$countString remitente permitido',
      zero: 'Nadie permitido',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Actividad';

  @override
  String get chatAppsNoActivity => 'Todavía no hay mensajes.';

  @override
  String get chatAppsIgnored => 'Ignorado: no está en la lista permitida';

  @override
  String get chatAppsAllow => 'Permitir';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender ahora puede enviar mensajes a este bot';
  }

  @override
  String get chatAppsRoutine => 'Inició una rutina';

  @override
  String get chatAppsFailed => 'No se pudo enviar';

  @override
  String get chatAppsSent => 'Enviado';

  @override
  String get chatAppsAnswered => 'Respondido';

  @override
  String get chatAppsRemove => 'Desconectar';

  @override
  String get chBotToken => 'Token del bot';

  @override
  String get chAddress => 'Dirección de correo';

  @override
  String get chApiKey => 'Clave de API';

  @override
  String get chSigningSecret => 'Secreto de firma';

  @override
  String get chPhoneNumber => 'Número de teléfono';

  @override
  String get chAccountSid => 'SID de la cuenta';

  @override
  String get chAuthToken => 'Token de autenticación';

  @override
  String get chPhoneNumberId => 'ID del número de teléfono';

  @override
  String get chAccessToken => 'Token de acceso';

  @override
  String get chAppSecret => 'Secreto de la app';

  @override
  String get chPageToken => 'Token de acceso de página';

  @override
  String get chAppId => 'ID de la app';

  @override
  String get chEncryptKey => 'Clave de cifrado';

  @override
  String get chVerificationToken => 'Token de verificación';

  @override
  String get chPublicKey => 'Clave pública';

  @override
  String get chTrackerUser =>
      'ID de usuario del bot en el gestor de incidencias';

  @override
  String get chSiteUrl => 'Dirección del sitio (https://…)';

  @override
  String get chAccountEmail => 'Correo de la cuenta';

  @override
  String get routineMessage => 'Cuando llega un mensaje que coincide';

  @override
  String get triggerMessage => 'Mensajes';

  @override
  String get messageTriggerHelp =>
      'Se inicia cuando a este bot le llega un correo o mensaje de chat que coincide. Conecta primero la app en Apps de chat.';

  @override
  String get messageTriggerAnyApp => 'Cualquier app';

  @override
  String get messageTriggerSender => 'De (dirección, número o *@empresa.com)';

  @override
  String get messageTriggerSubject => 'El asunto contiene';

  @override
  String get messageTriggerWords => 'El mensaje contiene';

  @override
  String callIncoming(String name) {
    return '$name está llamando';
  }

  @override
  String get callAnswer => 'Contestar';

  @override
  String get callDecline => 'Rechazar';

  @override
  String get callFullScreenTitle => 'Llamadas en la pantalla bloqueada';

  @override
  String get callFullScreenOff =>
      'Desactivado: la llamada de un bot se muestra solo como notificación. Toca para permitir que las llamadas suenen a pantalla completa.';

  @override
  String get encryption => 'Cifrar contenido';

  @override
  String get encryptionHelp =>
      'Los mensajes, recuerdos, tickets, páginas y el conocimiento se cifran antes de guardarse, con la clave propia de este espacio de trabajo. La búsqueda entonces encuentra coincidencias por título y significado, no por palabras exactas en texto cifrado.';

  @override
  String get encryptionOff => 'Desactivado';

  @override
  String get encryptionUnavailable =>
      'No disponible: este servidor no tiene ninguna clave de cifrado configurada';

  @override
  String get encryptionEncrypting =>
      'Activando: cifrando lo que ya está guardado';

  @override
  String get encryptionOnServer => 'Activado, con la clave del servidor';

  @override
  String get encryptionOnKms => 'Activado, con AWS KMS';

  @override
  String get encryptionDecrypting =>
      'Desactivando: descifrando lo que está guardado';

  @override
  String get encryptionConfirm =>
      'El contenido se cifrará con la clave de este espacio de trabajo. Si se elimina el espacio de trabajo, su clave se destruye y el contenido no se puede recuperar. La búsqueda por palabra exacta deja de encontrar coincidencias en el texto cifrado.';

  @override
  String get encryptionTurnOn => 'Activar';

  @override
  String get encryptionRotate => 'Rotar clave';

  @override
  String get encryptionKeyManaged =>
      'Casama crea y guarda por ti la clave de este espacio de trabajo, envuelta con la clave propia del servidor. No hay nada que guardar ni copiar.';

  @override
  String get encryptionRotateTitle => '¿Rotar la clave?';

  @override
  String get encryptionRotateBody =>
      'La clave del espacio de trabajo se envuelve de nuevo con la clave actual del servidor. Tu contenido sigue siendo legible y no hace falta volver a cifrar nada. Haz esto después de cambiar la clave del servidor o de forma programada.';

  @override
  String get encryptionRotateHelp =>
      'Vuelve a envolver la clave del espacio de trabajo con la clave actual del servidor';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Última rotación: $when';
  }

  @override
  String get memoryBackend => 'Dónde se guarda la memoria';

  @override
  String get memoryBuiltIn => 'Integrada';

  @override
  String get memoryBackendHelp => 'Memoria a largo plazo de los bots';

  @override
  String get memoryBackendSheetHelp =>
      'Guarda la memoria de tus bots en Honcho o Supermemory con tu propia cuenta. La pantalla de memoria, las exportaciones y la eliminación funcionan igual.';

  @override
  String get memoryHonchoWorkspace => 'Espacio de trabajo de Honcho';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Déjalo vacío para usar uno creado para este espacio de trabajo de Casama';

  @override
  String get memoryBaseUrl => 'Dirección del servidor (opcional)';

  @override
  String get memoryBaseUrlHelp =>
      'Solo para una instancia autoalojada de Honcho o Supermemory';

  @override
  String get memoryCopyExisting => 'Copiar recuerdos actuales';

  @override
  String get memoryUseBuiltIn => 'Volver a usar memoria integrada';

  @override
  String get providerHintData => 'datos de pago (lugares, correos, SEO)';

  @override
  String get kindA2a => 'Agente de IA (A2A)';

  @override
  String get a2aAgentUrl => 'Dirección del agente o URL de su tarjeta';

  @override
  String get a2aAgentToken => 'Token de acceso (opcional)';

  @override
  String get a2a => 'Agente a agente (A2A)';

  @override
  String get a2aHelp =>
      'Los agentes externos pueden dar tareas a los bots que publiques.';

  @override
  String get chromeExtensionSwitch => 'Casama para Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Los miembros pueden usar la extensión del navegador con este espacio de trabajo.';

  @override
  String get chromeActSwitch => 'Bots en los navegadores de los miembros';

  @override
  String get chromeActSwitchHelp =>
      'Los miembros pueden dejar que los bots abran páginas y actúen en su propio Chrome, en un grupo de pestañas que pueden detener.';

  @override
  String get a2aPublish => 'Publicar como agente A2A';

  @override
  String get a2aPublishHelp =>
      'Los agentes externos con una clave de API del espacio de trabajo pueden dar tareas a este bot.';

  @override
  String get a2aWorkspaceOff =>
      'Primero activa agente a agente en los ajustes del espacio de trabajo.';

  @override
  String get a2aCardUrl => 'Tarjeta de agente';

  @override
  String get phoneCalls => 'Llamadas telefónicas';

  @override
  String get phoneCallsHelp =>
      'Deja que los bots llamen a comercios por ti mediante tu cuenta de Twilio. Cada llamada pide permiso antes con las aprobaciones habituales.';

  @override
  String get twilioSid => 'SID de la cuenta';

  @override
  String get twilioToken => 'Token de autenticación';

  @override
  String get twilioFrom => 'Las llamadas salen desde';

  @override
  String get phoneCallsPersonal => 'Permitir llamar a números personales';

  @override
  String get phoneCallsCap => 'Llamadas por día';

  @override
  String get phoneCallsOff => 'No conectado';

  @override
  String get outCall => 'Llamar';

  @override
  String get outCallRinging => 'Llamando…';

  @override
  String get outCallLive => 'En la llamada';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Terminó tras $secondsString s';
  }

  @override
  String get outCallEndedByYou => 'Terminaste la llamada';

  @override
  String get outCallTakenOver => 'Tomaste el control de la llamada';

  @override
  String get outCallFailed => 'No conectó';

  @override
  String get outCallNothingYet => 'Todavía no se dijo nada.';

  @override
  String get outCallTakeOver => 'Tomar el control';

  @override
  String get outCallEnd => 'Finalizar llamada';

  @override
  String get outCallYourPhone => 'Tu número de teléfono';

  @override
  String get outCallYourPhoneHelp =>
      'Formato internacional, como +14155550123. Déjalo vacío para usar el que está guardado.';

  @override
  String get payments => 'Pagos';

  @override
  String get paymentsHelp =>
      'Deja que los bots paguen a comercios con tarjetas virtuales de un solo uso que apruebas cada vez. Usa tu propia cuenta de Stripe Issuing.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent gastado este mes de $cap';
  }

  @override
  String get paymentsSheetHelp =>
      'Cada tarjeta la apruebas tú con el monto mostrado, funciona una sola vez en ese comercio durante una hora y nunca sirve para valores financieros, cripto, tarjetas de regalo ni transferencias.';

  @override
  String get paymentsStripeKey => 'Clave secreta de Stripe (con Issuing)';

  @override
  String get paymentsWebhookSecret => 'Secreto de firma de webhook';

  @override
  String get paymentsWebhook => 'Apunta un webhook de Stripe aquí';

  @override
  String get paymentsCardholder => 'Nombre en las tarjetas';

  @override
  String get paymentsAddress => 'Dirección de facturación';

  @override
  String get paymentsCity => 'Ciudad';

  @override
  String get paymentsState => 'Estado o región';

  @override
  String get paymentsZip => 'Código postal';

  @override
  String get paymentsCountry => 'País (2 letras)';

  @override
  String get paymentsCap => 'Límite del espacio de trabajo por mes (USD)';

  @override
  String get paymentsBotCap => 'Límite por bot al mes (USD)';

  @override
  String get links => 'Bots vinculados';

  @override
  String get linksRow => 'Vincular con el bot de un contacto de confianza';

  @override
  String get linksHelp =>
      'Tu bot puede preguntar al bot de un contacto vinculado por cosas como un horario para cenar. Cada bot responde según las reglas de su propia persona y comparte solo lo necesario; ambos ven cada intercambio.';

  @override
  String get linksEmpty => 'Todavía no hay bots vinculados';

  @override
  String get linksInvite => 'Invitar a un contacto';

  @override
  String get linksContactName => 'Nombre del contacto';

  @override
  String get linksInviteReady => 'Enviar esta invitación';

  @override
  String get linksInviteHelp =>
      'Envíasela a tu contacto. La acepta en Casama con uno de sus bots. Funciona una vez, durante 7 días.';

  @override
  String get linksAccept => 'Aceptar una invitación';

  @override
  String get linksAcceptHelp => 'Pega la invitación que te envió tu contacto.';

  @override
  String get linksInviteText => 'Invitación';

  @override
  String linksActive(String bot) {
    return 'Vinculado con $bot';
  }

  @override
  String get linksPending => 'Esperando a que tu contacto acepte';

  @override
  String get linksRevoked => 'Desvinculado';

  @override
  String get linksExchanges => 'Intercambios';

  @override
  String get linksNoExchanges => 'Todavía no se preguntó nada.';

  @override
  String get linksNoAnswer => 'Sin respuesta';

  @override
  String get linksWorking => 'Trabajando…';

  @override
  String get linksRevoke => 'Desvincular';

  @override
  String get wakeWord => 'Palabra de activación';

  @override
  String get wakeWordRow => 'Di una frase para iniciar una llamada con un bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'Escuchando “$phrase”';
  }

  @override
  String get wakeWordHelp =>
      'Mientras Casama está abierta, este dispositivo escucha tu frase e inicia una llamada en vivo con el bot que elijas.';

  @override
  String get wakeWordListen => 'Escuchar la palabra de activación';

  @override
  String get wakeWordPhrase => 'Frase';

  @override
  String get wakeWordPhraseHelp => 'Dos o tres palabras, como “oye casama”';

  @override
  String get wakeWordBot => 'Llamar a este bot';

  @override
  String get wakeWordDownloading => 'Descargando el modelo en el dispositivo…';

  @override
  String get wakeWordTest => 'Probar frase';

  @override
  String get wakeWordTesting => 'Escuchando… di tu frase';

  @override
  String get wakeWordHeard => '¡Te escuché!';

  @override
  String get wakeWordStopTest => 'Detener';

  @override
  String get wakeWordPrivacy =>
      'La escucha ocurre en este dispositivo con un modelo de código abierto (unos 18 MB, se descarga una sola vez). No se envía nada a ningún lado hasta que empieza la llamada.';

  @override
  String get secretStore => 'Dónde se guardan los secretos';

  @override
  String get secretStoreVault => 'La bóveda de este servidor';

  @override
  String get secretStoreHelp =>
      'Guarda los secretos con nombre de los bots en tu propio proyecto de Infisical. Casama solo guarda el nombre de cada secreto y dónde se puede usar.';

  @override
  String get secretStoreSite => 'Dirección de Infisical';

  @override
  String get secretStoreProject => 'ID de proyecto';

  @override
  String get secretStoreEnv => 'Entorno';

  @override
  String get secretStoreClientId => 'ID de cliente de identidad de máquina';

  @override
  String get secretStoreClientSecret => 'Secreto de cliente';

  @override
  String get secretStoreMove => 'Mover secretos actuales a Infisical';

  @override
  String get secretStoreBack => 'Volver a usar la bóveda de este servidor';

  @override
  String get localServer => 'Ejecutar Casama en esta computadora';

  @override
  String get setupTitleMac => 'Configurar Casama en esta Mac';

  @override
  String get setupTitle => 'Configurar Casama en esta computadora';

  @override
  String get setupEntryMac => 'Ejecutar en esta Mac';

  @override
  String get setupEntry => 'Ejecutar en esta computadora';

  @override
  String get setupEntryHelp =>
      'Tu propio servidor privado en esta computadora. Gratis para uso personal.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Servidor';

  @override
  String get setupStepAccount => 'Cuenta';

  @override
  String get setupStepModel => 'Modelo de IA';

  @override
  String get setupStepPhone => 'Teléfono';

  @override
  String get setupDockerChecking => 'Comprobando Docker…';

  @override
  String get setupDockerMissingTitle => 'Primero instala Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'El servidor de Casama se ejecuta dentro de Docker Desktop, una app gratuita que lo mantiene separado del resto de tu Mac.';

  @override
  String get setupDockerMissingBodyLinux =>
      'El servidor de Casama se ejecuta dentro de Docker, que lo mantiene separado del resto de tu computadora.';

  @override
  String get setupDockerGetMac => 'Descargar Docker Desktop';

  @override
  String get setupDockerGetLinux => 'Abrir guía de instalación de Docker';

  @override
  String get setupDockerStep1 =>
      'Abre el archivo que se descarga y arrastra Docker a Aplicaciones.';

  @override
  String get setupDockerStep2 => 'Abre Docker y acepta sus términos.';

  @override
  String get setupDockerStep3 => 'Vuelve aquí. Esta página continúa sola.';

  @override
  String get setupDockerWaiting => 'Esperando a Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker debe estar en ejecución';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker está instalado pero no está abierto. Cuando termine de iniciarse, lo que puede tomar un minuto, esta página continúa sola.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker está instalado pero no está en ejecución. Inícialo con este comando y esta página continúa sola.';

  @override
  String get setupDockerOpen => 'Abrir Docker';

  @override
  String get setupDockerOpening => 'Iniciando Docker…';

  @override
  String get setupDockerPermissionTitle => 'Docker necesita tu permiso';

  @override
  String get setupDockerPermissionBody =>
      'Docker está en ejecución, pero tu usuario no tiene permiso para usarlo. Ejecuta este comando, luego cierra sesión y vuelve a entrar.';

  @override
  String get setupDockerComposeTitle => 'A Docker le falta Compose';

  @override
  String get setupDockerComposeBody =>
      'Este Docker no tiene Compose v2. Docker Desktop lo incluye; en Linux, instala el paquete docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Omitido';

  @override
  String get setupArtDocker => 'Primero, la caja donde vive tu servidor.';

  @override
  String get setupArtServer => 'Construyendo tu casa. Esta es la parte larga.';

  @override
  String get setupArtAccount => '¡Tu servidor está funcionando!';

  @override
  String get setupArtModel => 'Ahora dale un cerebro.';

  @override
  String get setupArtPhone => 'Último paso: llévalo contigo.';

  @override
  String get setupDockerSlowTitle => '¿Tarda mucho?';

  @override
  String get setupDockerSlowMenuBar =>
      'Busca la ballena en la barra de menús. Docker está listo cuando deja de moverse.';

  @override
  String get setupDockerSlowTerms =>
      'Si Docker muestra una ventana pidiendo que aceptes sus términos, termina eso primero. Iniciar sesión en Docker es opcional.';

  @override
  String get setupDockerSlowRestart =>
      '¿Sigue atascado? Sal de Docker desde su menú y luego presiona Volver a comprobar.';

  @override
  String get setupDockerSlowInstalled =>
      '¿Ya lo instalaste? Abre Docker una vez desde Aplicaciones para que pueda configurarse.';

  @override
  String get setupDockerSlowOther =>
      '¿Usas OrbStack o Colima en su lugar? Inícialo. Casama funciona con cualquier Docker que responda a docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Ejecuta docker info en una terminal para ver qué responde Docker.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker dijo: $detail';
  }

  @override
  String get setupDockerRecheck => 'Comprobar de nuevo';

  @override
  String get setupDockerGuide => 'Guía de solución de problemas';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Solo quedan $gb GB libres en disco. El servidor necesita unos $need GB.';
  }

  @override
  String get setupServerTitle => 'Descarga e inicia tu servidor';

  @override
  String get setupServerBody =>
      'Una descarga de unos 2.5 GB que toma de 5 a 10 minutos la primera vez, y unos 10 GB en disco una vez configurado. Puedes seguir usando tu computadora.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Una descarga de $download GB y luego unos $disk GB en disco una vez configurado. La primera vez tarda de 5 a 10 minutos. Puedes seguir usando tu computadora.';
  }

  @override
  String get setupServerBodyNothing =>
      'Todo lo que necesita ya está en esta computadora, así que inicia en un minuto o dos.';

  @override
  String get setupServerStart => 'Iniciar';

  @override
  String get setupServerStageDownload => 'Descargando el servidor';

  @override
  String get setupServerStagePrepare => 'Preparándolo';

  @override
  String get setupServerStageParts => 'Descargando sus partes';

  @override
  String setupServerDownloaded(int megabytes) {
    return '$megabytes MB hasta ahora';
  }

  @override
  String get setupServerStagePartsNote => 'El paso más largo';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$done de $total descargados hasta ahora';
  }

  @override
  String get setupServerStageStart => 'Iniciándolo';

  @override
  String get setupServerStageWait => 'Esperando su respuesta';

  @override
  String get setupServerKeepOpen =>
      'Mantén Casama abierta hasta que esto termine.';

  @override
  String get setupServerFailed => 'El servidor no inició.';

  @override
  String get setupServerConnecting => 'Listo. Conectando…';

  @override
  String get setupShowDetails => 'Mostrar detalles';

  @override
  String get setupHideDetails => 'Ocultar detalles';

  @override
  String get setupAccountTitle => 'Crea tu cuenta';

  @override
  String get setupAccountBody =>
      'Vive solo en esta computadora y es dueña de este servidor. No se envía ningún correo.';

  @override
  String get setupAccountName => 'Tu nombre';

  @override
  String get setupAccountNameMissing => 'Ingresa tu nombre';

  @override
  String get setupAccountCreate => 'Crear cuenta';

  @override
  String get setupAccountHave => 'Ya tengo una cuenta aquí';

  @override
  String get setupAccountNew => 'Crear una cuenta nueva en su lugar';

  @override
  String get setupAccountSignInTitle => 'Inicia sesión en tu servidor';

  @override
  String get setupAccountSignInBody =>
      'Usa la cuenta que creaste en este servidor.';

  @override
  String get setupAccountClosed =>
      'Este servidor ya tiene propietario. Inicia sesión con esa cuenta.';

  @override
  String get setupAccountPreparing => 'Preparando tu espacio…';

  @override
  String get setupModelTitle => 'Dale un modelo a tus bots';

  @override
  String get setupModelBody =>
      'Los bots necesitan un modelo de IA para pensar. Inicia sesión con un plan de ChatGPT o pega una clave de OpenRouter, Google u otro proveedor.';

  @override
  String get setupSkip => 'Omitir por ahora';

  @override
  String get setupPhoneTitle => 'Conecta tu teléfono';

  @override
  String get setupPhoneBody =>
      'Casama Link le da a esta computadora una dirección privada para que tu teléfono llegue a ella desde cualquier lugar. Lo apruebas una sola vez con una cuenta gratuita de Casama Cloud. Tus chats se quedan en esta computadora.';

  @override
  String get setupPhoneTurnOn => 'Darle una dirección a esta computadora';

  @override
  String get setupPhoneScanTitle => 'Escanea esto con la cámara de tu teléfono';

  @override
  String get setupPhoneScanBody =>
      'Abre Casama en el teléfono e inicia tu sesión. Si Casama todavía no está en el teléfono, la página que se abre indica dónde conseguirla.';

  @override
  String get setupPhoneWaiting => 'Esperando a tu teléfono…';

  @override
  String get setupPhoneConnected => 'Teléfono conectado';

  @override
  String get setupPhoneConnectedBody =>
      'Tu teléfono ya tiene sesión iniciada. Muestra un código nuevo para agregar otro dispositivo.';

  @override
  String get setupPhoneOwnerOnly =>
      'Solo el propietario de este servidor puede darle una dirección.';

  @override
  String get setupFinish => 'Finalizar';

  @override
  String get setupCardTitle => 'Termina la configuración';

  @override
  String get setupCardModel =>
      'Agrega un modelo de IA para que tus bots puedan responder.';

  @override
  String get setupCardPhone => 'Conecta tu teléfono a esta computadora.';

  @override
  String get setupCardOpen => 'Continuar configuración';

  @override
  String get desktopUsers => 'Usuarios de escritorio a la vez';

  @override
  String get desktopUsersHelp =>
      'Los bots en esta computadora del equipo comparten una pantalla. Otros esperan (y siguen trabajando con la terminal, los archivos y el navegador) mientras está en uso.';

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
      'calendar': 'A $bot le gustaría usar tu calendario',
      'reminders': 'A $bot le gustaría usar tus recordatorios',
      'contacts': 'A $bot le gustaría usar tus contactos',
      'places': 'A $bot le gustaría usar tus lugares',
      'photos': 'A $bot le gustaría usar tus fotos',
      'health': 'A $bot le gustaría usar tus datos de salud',
      'notifications': 'A $bot le gustaría usar tus notificaciones',
      'activity': 'A $bot le gustaría usar tu actividad en la computadora',
      'browserTab': 'A $bot le gustaría usar tu pestaña actual del navegador',
      'browserHistory':
          'A $bot le gustaría usar tu historial y marcadores del navegador',
      'alarm': 'A $bot le gustaría usar tus alarmas',
      'home': 'A $bot le gustaría usar tus accesorios de Casa',
      'other': 'A $bot le gustaría usar los datos de tu dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Solo en tus propios chats. Puedes detenerlo cuando quieras en Ajustes → Conexiones del dispositivo.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Permitido usar tu calendario',
      'reminders': 'Permitido usar tus recordatorios',
      'contacts': 'Permitido usar tus contactos',
      'places': 'Permitido usar tus lugares',
      'photos': 'Permitido usar tus fotos',
      'health': 'Permitido usar tus datos de salud',
      'notifications': 'Permitido usar tus notificaciones',
      'activity': 'Permitido usar tu actividad en la computadora',
      'browserTab': 'Permitido usar tu pestaña actual del navegador',
      'browserHistory':
          'Permitido usar tu historial y marcadores del navegador',
      'alarm': 'Permitido usar tus alarmas',
      'home': 'Permitido usar tus accesorios de Casa',
      'other': 'Permitido usar los datos de tu dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'No compartido';

  @override
  String get deviceKindCalendar => 'calendario';

  @override
  String get deviceKindReminders => 'recordatorios';

  @override
  String get deviceKindContacts => 'contactos';

  @override
  String get deviceKindPlaces => 'lugares';

  @override
  String get deviceKindPhotos => 'fotos';

  @override
  String get deviceKindHealth => 'datos de salud';

  @override
  String get deviceKindNotifications => 'notificaciones';

  @override
  String get deviceKindActivity => 'actividad en la computadora';

  @override
  String get deviceKindBrowserTab => 'pestaña actual del navegador';

  @override
  String get deviceKindBrowserHistory => 'historial y marcadores del navegador';

  @override
  String get deviceKindAlarm => 'alarmas';

  @override
  String get deviceKindHome => 'accesorios de Casa';

  @override
  String get deviceBrowserAsks => 'Qué pueden pedirle los bots a tu navegador';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama para Chrome responde esto en vivo y no se guarda nada. Actívalo o desactívalo en los ajustes de la extensión.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Dejar de permitir que $bot pregunte';
  }

  @override
  String get deviceConnections => 'Conexiones del dispositivo';

  @override
  String get deviceConnectionsHelp =>
      'Comparte datos de este dispositivo con tus bots. Cada tipo está desactivado hasta que lo actives, y solo los bots que permitas pueden leerlo, únicamente en tus propios chats.';

  @override
  String get deviceConnectionsNone =>
      'Este dispositivo todavía no puede compartir datos. En tu teléfono, abre Casama y activa lo que te gustaría compartir.';

  @override
  String get deviceKeepFor => 'Conservar durante';

  @override
  String get deviceKeepLiveOnly => 'Solo en vivo';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString días',
      one: '$countString día',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Solo modelos privados';

  @override
  String get devicePrivateModelHelp =>
      'Solo los bots en un modelo local pueden leerlo';

  @override
  String get deviceNoBots =>
      'Todavía no hay bots. Un bot lo pide cuando lo necesita, o permite uno ahora.';

  @override
  String get deviceAllowBot => 'Permitir un bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '¿Qué bot puede leer tu calendario?',
      'reminders': '¿Qué bot puede leer tus recordatorios?',
      'contacts': '¿Qué bot puede leer tus contactos?',
      'places': '¿Qué bot puede leer tus lugares?',
      'photos': '¿Qué bot puede leer tus fotos?',
      'health': '¿Qué bot puede leer tus datos de salud?',
      'notifications': '¿Qué bot puede leer tus notificaciones?',
      'activity': '¿Qué bot puede leer tu actividad en la computadora?',
      'browserTab': '¿Qué bot puede leer tu pestaña actual del navegador?',
      'browserHistory':
          '¿Qué bot puede leer tu historial y marcadores del navegador?',
      'alarm': '¿Qué bot puede leer tus alarmas?',
      'home': '¿Qué bot puede leer tus accesorios de Casa?',
      'other': '¿Qué bot puede leer los datos de tu dispositivo?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama no tiene permiso. Permítelo en los ajustes del sistema y vuelve a intentarlo.';

  @override
  String get deviceOtherDevices => 'Tus otros dispositivos';

  @override
  String get deviceForget => 'Olvidar este dispositivo';

  @override
  String get deviceBrowsers => 'Navegadores que pueden usar los bots';

  @override
  String get deviceBrowsersHelp =>
      'Vinculados en Casama para Chrome. Los bots que permitiste trabajan ahí en su propio grupo de pestañas, con tu sesión.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '$count bot',
      zero: 'Todavía no hay bots',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'En línea';

  @override
  String get deviceBrowserOffline => 'Sin conexión';

  @override
  String get deviceBrowserUnpair => 'Desvincular este navegador';

  @override
  String get deviceBrowserAllBots => 'Todos los bots';

  @override
  String get deviceChromeNotPaired => 'Casama para Chrome: sin vincular';

  @override
  String get deviceChromeHowToPair =>
      'Instala Casama para Chrome, inicia sesión y luego abre Más → “Dejar que los bots usen este navegador”.';

  @override
  String get deviceConnectionsRowHelp =>
      'Calendario, contactos y más desde este dispositivo';

  @override
  String get healthExtraCycle => 'Seguimiento del ciclo';

  @override
  String get healthExtraGlucose => 'Glucosa en sangre';

  @override
  String get healthExtraBloodPressure => 'Presión arterial';

  @override
  String get appleHealth => 'Apple Health';

  @override
  String get appleHealthAbout =>
      'Lee resúmenes diarios de tu sueño, actividad, entrenamientos y ritmo cardíaco desde Apple Health (HealthKit), solo cuando esto está activado. Casama nunca escribe en Apple Health.';

  @override
  String get healthNotMedical =>
      'Solo resúmenes diarios (sueño, actividad, entrenamientos, corazón). Los bots describen cómo estás en comparación con lo habitual en ti y nunca dan consejos médicos.';

  @override
  String get healthNeedsEncryption =>
      'Los datos de salud requieren cifrado en reposo. Actívalo para un espacio de trabajo del que seas propietario y vuelve a intentarlo.';

  @override
  String get placeAddHere => 'Agregar donde estoy ahora';

  @override
  String get placeName => 'Nombra este lugar (Casa, Trabajo, Gimnasio)';

  @override
  String get placeNoLocation =>
      'Tu ubicación no está disponible. Permite la ubicación para Casama y vuelve a intentarlo.';

  @override
  String get placesHelp =>
      'Los bots se enteran cuando llegas a estos lugares o sales de ellos. Solo se comparten el nombre del lugar y la hora, nunca tu ruta.';

  @override
  String get watchedAppsHelp =>
      'Solo se comparten las notificaciones de estas apps. Los códigos de un solo uso se ocultan antes de que algo salga de tu teléfono.';

  @override
  String get watchedAppAdd => 'Agregar una app (nombre o ID del paquete)';

  @override
  String get providerHintMaps => 'tiempos de viaje para salir ahora';

  @override
  String routineDevice(String event, String detail) {
    return 'En tu teléfono: $event $detail';
  }

  @override
  String get ctxSelection => 'Texto seleccionado';

  @override
  String get ctxAddScreenshot => 'Agregar una captura de pantalla';

  @override
  String get ctxScreenshotAdded => 'Captura de pantalla agregada';

  @override
  String get ctxScreenshotFailed =>
      'No se pudo tomar la captura de pantalla. Permite la grabación de pantalla para Casama en los ajustes del sistema.';

  @override
  String get watchedFolders => 'Carpetas observadas';

  @override
  String get watchedFoldersHelp =>
      'Un archivo nuevo en una de estas carpetas puede iniciar una rutina (por ejemplo, archivar los nuevos PDF en Descargas). Solo se comparte su nombre; los bots leen el archivo solo si trabajan en esta computadora.';

  @override
  String get whyTitle => '¿Por qué veo esto?';

  @override
  String whyData(String data) {
    return 'Usado: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Urgencia: $urgency';
  }

  @override
  String get heldMeeting =>
      'Esperó mientras estabas en una reunión y llegó con tu resumen.';

  @override
  String get heldFocus =>
      'Esperó mientras Enfoque estaba activado y llegó con tu resumen.';

  @override
  String get heldDriving =>
      'Esperó mientras estabas manejando y llegó con tu resumen.';

  @override
  String get heldCap =>
      'El bot ya había enviado 5 mensajes hoy, así que este esperó para tu resumen.';

  @override
  String get heldLow =>
      'No era urgente, así que esperó para tu resumen en lugar de hacer vibrar tu teléfono.';

  @override
  String get lessLikeThis => 'Menos como esto';

  @override
  String get lessLikeThisDone => 'Entendido, menos como esto';

  @override
  String get widgetStatusWorking => 'Trabajando…';

  @override
  String get widgetStatusOff => 'Desactivado';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner =>
      'Suspendido por el propietario de la instancia';

  @override
  String get previewHi => '¡Hola!';

  @override
  String get previewAsk => '¿Puedes ordenar mis notas?';

  @override
  String get previewOnIt => 'En eso';

  @override
  String get previewDone => '¡Listo! Ya están en tres carpetas.';

  @override
  String get previewMessage => 'Mensaje';

  @override
  String get fontPreviewGreeting => 'Buenos días';

  @override
  String get photosFromUnsplash => 'Fotos de Unsplash';

  @override
  String get showBotSteps => 'Mostrar los pasos del bot';

  @override
  String get showBotStepsHelp => 'Comandos y errores técnicos en cada chat.';

  @override
  String get showScreenCard => 'Mostrar la pantalla del bot mientras trabaja';

  @override
  String get showScreenCardHelp =>
      'Una pequeña tarjeta en vivo en el chat. Tócala para verla en pantalla completa.';

  @override
  String get showReplyUsage => 'Mostrar el uso en las respuestas';

  @override
  String get showReplyUsageHelp =>
      'Lo que costó cada respuesta, en una línea debajo.';

  @override
  String get openLinksInApp => 'Abrir enlaces en la app';

  @override
  String get openLinksInAppHelp =>
      'Los enlaces web se abren en un navegador dentro de Casama. Desactivado: se abren en tu navegador predeterminado.';

  @override
  String replyUsageTokens(String count) {
    return '$count tokens';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount con tus claves';
  }

  @override
  String get replyUsageOnPlan => 'En tu plan de ChatGPT';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount hasta ahora';
  }

  @override
  String get replyUsageTooltip => 'Lo que costó esta respuesta';

  @override
  String get replyUsageTitle => 'Lo que costó esta respuesta';

  @override
  String get replyUsageFromCredits => 'De tus créditos';

  @override
  String get replyUsageYourKeys => 'Con tus propias claves';

  @override
  String get replyUsageTotal => 'Total';

  @override
  String get replyUsageTime => 'Hora';

  @override
  String get replyUsageTokensLabel => 'Tokens';

  @override
  String get replyUsageSteps => 'Pasos';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Incluye $n ejecuciones auxiliares',
      one: 'Incluye $n ejecución auxiliar',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing =>
      'No se midió ningún consumo para esta respuesta.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 crédito = $price. Tus propias claves y planes los factura su proveedor, no Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Abrir la ejecución';

  @override
  String get replyUsageLoadFailed =>
      'No se pudo cargar el uso de esta respuesta.';

  @override
  String get replyUsageOurCost => 'Nuestro costo';

  @override
  String get replyUsageMargin => 'Margen';

  @override
  String replyUsageItemCost(String amount) {
    return 'Nuestro costo $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Nuestro costo y margen se te muestran porque tú administras este servidor. Nadie más los ve.';

  @override
  String get kindSpeechToText => 'Voz a texto';

  @override
  String get kindVoice => 'Llamadas de voz';

  @override
  String get kindImages => 'Imágenes';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Búsquedas en la web';

  @override
  String get kindData => 'Consultas de datos';

  @override
  String get kindPhone => 'Llamadas telefónicas';

  @override
  String get kindApps => 'Acciones en apps';

  @override
  String get activityReady => 'Preparándose…';

  @override
  String get activitySearching => 'Buscando en la web…';

  @override
  String get activityBrowsing => 'Navegando en la web…';

  @override
  String get activityComputer => 'Trabajando en su computadora…';

  @override
  String get activityFiles => 'Revisando archivos…';

  @override
  String get activityImage => 'Creando una imagen…';

  @override
  String get activityVideo => 'Creando un video…';

  @override
  String get activityMemory => 'Revisando lo que sabe…';

  @override
  String get activityApps => 'Usando tus apps…';

  @override
  String get activityScheduling => 'Configurando un horario…';

  @override
  String get activityWorking => 'Trabajando en eso…';

  @override
  String get activityWaitingForScreen =>
      'Esperando a que devuelvas el control de la pantalla…';

  @override
  String get runFailedPlain =>
      'Algo salió mal. Vuelve a intentarlo o abre Detalles para ver por qué.';

  @override
  String get newKeyTitle => 'Copia tu nueva clave';

  @override
  String get newKeyHelp =>
      'Se muestra solo esta única vez. Pégala en la app que estás conectando y luego toca Listo.';

  @override
  String get copyKey => 'Copiar clave';

  @override
  String get keyCopied => 'Clave copiada';

  @override
  String revokeApiKeyTitle(String name) {
    return '¿Revocar “$name”?';
  }

  @override
  String get revokeApiKeyBody =>
      'Las apps que usen esta clave dejarán de conectarse de inmediato. Esto no se puede deshacer; para volver a conectar, crea una clave nueva.';

  @override
  String unlinkTitle(String name) {
    return '¿Desvincular a “$name”?';
  }

  @override
  String get unlinkBody =>
      'Los bots dejan de hablar entre sí de inmediato. Volver a vincularlos requiere una nueva invitación.';

  @override
  String get alreadyMember => 'Ya estás en este espacio de trabajo.';

  @override
  String get askAdminToInvite =>
      'Solo los propietarios y administradores pueden invitar personas. Pídele un enlace de invitación a alguno de ellos.';

  @override
  String get askBeforeJoining => 'Preguntarme antes de que la gente se una';

  @override
  String get askBeforeJoiningHelp =>
      'Un administrador aprueba a cada persona que use el enlace.';

  @override
  String get askToJoin => 'Pedir unirse';

  @override
  String get customLinks => 'Enlaces personalizados';

  @override
  String get customLinksHelp =>
      'Enlaces con su propio rol, vencimiento o cantidad de usos.';

  @override
  String get emailAddresses => 'Direcciones de correo';

  @override
  String get emailAddressesHelp =>
      'Pega una o más, separadas por comas o saltos de línea.';

  @override
  String get getCode => 'Obtener un código';

  @override
  String get getNewCode => 'Obtener un código nuevo';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get welcomeCta => 'Empecemos';

  @override
  String get inviteAsAdmin => 'Invitar como administradores';

  @override
  String get inviteByEmail => 'Invitar por correo';

  @override
  String get inviteExpired => 'Vencida';

  @override
  String inviteExpires(String when) {
    return 'Vence $when';
  }

  @override
  String get inviteInvalid => 'Esta invitación no funciona';

  @override
  String get inviteInvalidHelp =>
      'Puede que haya vencido, se haya agotado o se haya desactivado. Pide una nueva.';

  @override
  String get inviteLink => 'Enlace de invitación';

  @override
  String get inviteLinkApprovalHelp =>
      'Cualquier persona con este enlace puede pedir unirse. Tú la apruebas abajo.';

  @override
  String get inviteLinkHelp =>
      'Cualquier persona con este enlace puede unirse como miembro. Compártelo en un chat o correo.';

  @override
  String get inviteLinkOrCode => 'Enlace o código de invitación';

  @override
  String inviteOtherServer(String host) {
    return 'Esta invitación es para $host, y esta app está conectada a un servidor distinto.';
  }

  @override
  String get inviteRenewed =>
      'La invitación funciona por 7 días más. Envíale el nuevo enlace.';

  @override
  String inviteSentTo(String email) {
    return 'Inicia sesión con $email para aceptar.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Únete a $workspace en Casama: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name te invitó a unirte';
  }

  @override
  String get invitedToJoin => 'Tienes una invitación para unirte';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString invitaciones enviadas.',
      one: '$countString invitación enviada.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Te unirás como administrador';

  @override
  String get joinAsMember => 'Te unirás como miembro';

  @override
  String get joinByDomain => 'Unirse por dominio de correo';

  @override
  String get joinByDomainHelp =>
      'Las direcciones verificadas se unen sin invitación.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Cualquier persona con un correo verificado @$domain puede unirse';
  }

  @override
  String get joinByDomainUnavailable =>
      'Disponible cuando inicias sesión con un correo de trabajo verificado (no gmail.com ni similares).';

  @override
  String get joinNeedsApproval =>
      'Un administrador aprueba a las personas nuevas antes de que se unan.';

  @override
  String get joinRequestSent => 'Solicitud enviada';

  @override
  String joinRequestSentHelp(String name) {
    return 'Un administrador de $name lo revisará. Recibirás una notificación cuando entres.';
  }

  @override
  String get joinWithLinkOrCode => 'Unirse con enlace o código';

  @override
  String get spacesInvite => 'Invitar personas';

  @override
  String spacesInviteTo(String name) {
    return 'A $name';
  }

  @override
  String get spacesNew => 'Nuevo espacio de trabajo';

  @override
  String get spacesNewHint => 'Sus propios bots, personas y facturación';

  @override
  String get spacesJoin => 'Unirse a un espacio de trabajo';

  @override
  String get spacesJoinHint => 'Con un enlace o código de invitación';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Unirse a $name';
  }

  @override
  String get joinedBotsHelp =>
      'Estos bots están aquí para ayudar. Saluda a alguno para comenzar.';

  @override
  String get joinedNoBots =>
      'Todavía no hay bots aquí. Crea uno o explora primero.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString miembros',
      one: '$countString miembro',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Miembros';

  @override
  String openToDomain(String domain) {
    return 'Abierto a @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Abrir $name';
  }

  @override
  String get pendingInvites => 'Invitaciones aún sin aceptar';

  @override
  String get people => 'Personas';

  @override
  String get workspaceAdvancedSummary =>
      'Secretos, memoria, cifrado, pagos, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Código de invitación, dominio de correo, enlaces personalizados';

  @override
  String get inviteLinkToCopy => 'Enlace de invitación, listo para copiar';

  @override
  String linkMade(String when) {
    return 'Creado $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Cargos por servidor, servidores de Casama Link y claves';

  @override
  String get billingChargesSummary => 'Cargos por servidor';

  @override
  String get billingUsageRow => 'Lo que usaron los bots y cuánto costó';

  @override
  String billingUsageSoFar(String amount) {
    return 'Este mes hasta ahora: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Conteo de tokens, exportación JSON';

  @override
  String get peopleHelp => 'Invita personas y decide quién entra.';

  @override
  String get peopleRow => 'Invita personas, aprueba solicitudes y ve miembros';

  @override
  String get qrCode => 'Código QR';

  @override
  String get remove => 'Quitar';

  @override
  String get resendInvite => 'Enviar de nuevo';

  @override
  String get resetLink => 'Restablecer enlace';

  @override
  String get resetLinkHelp =>
      'El enlace actual deja de funcionar de inmediato y obtienes uno nuevo. Las personas que ya están dentro permanecen dentro.';

  @override
  String get revokeInvite => 'Cancelar invitación';

  @override
  String scanToJoin(String name) {
    return 'Escanea para unirte a $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Enviar $countString invitaciones';
  }

  @override
  String get sendInvitesYourself => 'Envía estas invitaciones por tu cuenta';

  @override
  String get sendInvitesYourselfHelp =>
      'El correo no está configurado en este servidor. Envía a cada persona su enlace para que inicie sesión con esa dirección y se una.';

  @override
  String get signInToJoin => 'Inicia sesión para unirte';

  @override
  String get startOwnWorkspace =>
      'Crear mi propio espacio de trabajo en su lugar';

  @override
  String switchToServer(String host) {
    return 'Cambiar a $host';
  }

  @override
  String get waitingToJoin => 'Esperando para unirse';

  @override
  String welcomeToWorkspace(String name) {
    return 'Te damos la bienvenida a $name';
  }

  @override
  String get workspacesYouCanJoin =>
      'Espacios de trabajo a los que puedes unirte';

  @override
  String get yourTeamIsHere => 'Tu equipo ya está aquí';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Las personas en $domain usan estos espacios de trabajo. Únete a uno o crea el tuyo.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Fácil de dictar o escribir. Funciona durante 48 horas. Las personas lo ingresan en Unirse con enlace o código.';

  @override
  String get inviteSomeoneNew => 'Invita a alguien nuevo al espacio de trabajo';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app solo inicia sesión en una dirección segura (https), y este servidor de Casama está en $address. Sirve Casama sobre https para usar el inicio de sesión.';
  }

  @override
  String get aboutYou => 'Sobre ti';

  @override
  String get aboutYouRow => 'Cómo te llaman tus bots y qué saben de ti';

  @override
  String get aboutYouIntro =>
      'Tus bots leen esto para llamarte por tu nombre y responder como te gusta. Solo tú puedes verlo.';

  @override
  String get photoChange => 'Cambiar foto de perfil';

  @override
  String get photoTake => 'Tomar una foto';

  @override
  String get photoChoose => 'Elegir una foto';

  @override
  String get photoUseGoogle => 'Usar mi foto de Google';

  @override
  String get photoRemove => 'Quitar foto';

  @override
  String get photoUnreadable =>
      'Ese archivo no es una foto que Casama pueda usar. Prueba con un JPEG o PNG.';

  @override
  String get whatToCallYou => '¿Cómo deberían llamarte los bots?';

  @override
  String get pronounsOptional => 'Pronombres (opcional)';

  @override
  String get aboutMe => 'Sobre mí';

  @override
  String get aboutMeHint =>
      'Tu trabajo, las personas en tu vida, lo que te interesa. Todo lo que ayude.';

  @override
  String get replyStyle => 'Cómo me gustan las respuestas';

  @override
  String get replyStyleHint =>
      'Por ejemplo: respuestas cortas, sin emojis, explica las cosas como si fuera nuevo en ellas';

  @override
  String get learnAboutMe => 'Aprender sobre mí en los chats';

  @override
  String get learnAboutMeHelp =>
      'Los bots guardan datos sobre ti. Edítalos cuando quieras.';

  @override
  String get adultSites => 'Sitios para adultos';

  @override
  String get adultSitesHelp =>
      'Los bots pueden abrir sitios web para adultos cuando se los pidas. Solo mayores de 18 años.';

  @override
  String get adultSitesConfirmTitle => '¿Activar sitios para adultos?';

  @override
  String get adultSitesConfirmBody =>
      'Confirmas que tienes 18 años o más. Cuando se lo pidas, los bots pueden abrir sitios web para adultos por ti y mostrarte como texto lo que hay ahí. Funciona cuando lo pides desde Casama en la web o la app de escritorio, nunca en chats compartidos.';

  @override
  String get adultSitesConfirm => 'Tengo 18 años o más';

  @override
  String get adultSitesApprovalDetail =>
      'Permitir significa que confirmas tener 18 años o más y activas sitios para adultos en tu cuenta. Puedes desactivarlo en Sobre ti.';

  @override
  String useInThisSpace(String workspace) {
    return 'Usar lo que compartí en $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Desactivado: aquí solo se usan tu nombre y estilo de respuesta.';

  @override
  String get learnedAboutYou => 'Lo que aprendieron los bots';

  @override
  String get noLearnedFacts =>
      'Todavía nada. Los datos que los bots aprendan sobre ti en el chat aparecerán aquí.';

  @override
  String get addFact => 'Agregar un dato';

  @override
  String get editFact => 'Editar dato';

  @override
  String get deleteFactTitle => '¿Eliminar este dato?';

  @override
  String get deleteFactConfirm => 'Tus bots ya no lo sabrán.';

  @override
  String get importToProfile => 'Importar de ChatGPT o Claude';

  @override
  String get savedToProfile => 'Guardado en tu perfil';

  @override
  String get undo => 'Deshacer';

  @override
  String get suggestedLookApplied => 'Nuevo tema aplicado';

  @override
  String get suggestedLookUnavailable => 'Esta app no tiene ese tema';

  @override
  String get removedFromProfile => 'Eliminado de tu perfil';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se agregaron $countString datos',
      one: 'Se agregó $countString dato',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Tus bots lo usarán en cada espacio de trabajo. Puedes cambiarlo luego en Ajustes → Sobre ti.';

  @override
  String get nameStepBubble => '¡Mucho gusto!';

  @override
  String get heardFromTitle => '¿Cómo supiste de nosotros?';

  @override
  String get heardFromHelp =>
      'Un toque nos ayuda a ver qué está funcionando. Puedes omitirlo.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Una amistad';

  @override
  String get heardFromSearch => 'Buscar';

  @override
  String get heardFromAiAssistant => 'Un asistente de IA';

  @override
  String get heardFromOther => 'Otro';

  @override
  String get heardFromSkip => 'Omitir';

  @override
  String get nameStepHint => 'Tu nombre';

  @override
  String get skillCatalogSubtitle =>
      'Habilidades listas para usar que tus bots cargan cuando una tarea lo requiere.';

  @override
  String get skillCategoryWork => 'Trabajo';

  @override
  String get skillCategoryWriting => 'Escritura';

  @override
  String get skillCategoryResearch => 'Investigación';

  @override
  String get skillCategoryData => 'Datos';

  @override
  String get skillCategoryMoney => 'Dinero';

  @override
  String get skillCategoryBuild => 'Desarrollo';

  @override
  String get skillCategoryLife => 'Vida';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString habilidades',
      one: '$countString habilidad',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Instalados';

  @override
  String skillInstalledFor(String names) {
    return 'Instalada para $names';
  }

  @override
  String installSkillFor(String name) {
    return 'Instalar $name para';
  }

  @override
  String skillUseHint(String name) {
    return 'Los bots la cargan por su cuenta cuando encaja con una tarea, o escribe /$name en un chat para usarla.';
  }

  @override
  String get skillInstructions => 'Instrucciones';

  @override
  String get skillAlreadyEverywhere =>
      'Ya está instalada en todos lados donde puede estar.';

  @override
  String get gallery => 'Galería';

  @override
  String get galleryEmpty => 'Nada en la galería coincide.';

  @override
  String get galleryOffline =>
      'No se puede acceder a la galería en este momento. Los estilos y habilidades integrados siguen aquí.';

  @override
  String get galleryUse => 'Usar';

  @override
  String get galleryInstall => 'Instalar';

  @override
  String get galleryReport => 'Reportar';

  @override
  String get galleryShare => 'Compartir en la Galería';

  @override
  String galleryBy(String name) {
    return 'Por $name';
  }

  @override
  String get galleryFeatured => 'Destacados';

  @override
  String get galleryAll => 'Todo';

  @override
  String get galleryThemes => 'Temas';

  @override
  String get gallerySchemes => 'Colores';

  @override
  String get galleryWallpapers => 'Fondos de pantalla';

  @override
  String get gallerySkills => 'Habilidades';

  @override
  String get fromGallery => 'Galería';

  @override
  String galleryApplied(String name) {
    return 'Usando $name';
  }

  @override
  String get gallerySeeAll => 'Ver todo';

  @override
  String get galleryInUse => 'En uso';

  @override
  String galleryInstalled(String name) {
    return 'Se instaló $name';
  }

  @override
  String get galleryPreviewDark => 'Vista previa en oscuro';

  @override
  String get galleryPreviewLight => 'Vista previa en claro';

  @override
  String get galleryClearSearch => 'Borrar búsqueda';

  @override
  String get galleryOfflineTitle => 'La galería está sin conexión';

  @override
  String galleryNoMatches(String query) {
    return 'Nada coincide con “$query”';
  }

  @override
  String get galleryInstructions => 'Instrucciones';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern sobre $palette';
  }

  @override
  String get galleryImage => 'Imagen';

  @override
  String get galleryMeshGradient => 'un degradado en malla';

  @override
  String get galleryOwnDoodles => 'Garabatos propios';

  @override
  String get galleryLightAndDark => 'Claro y oscuro';

  @override
  String get galleryContribute =>
      '¿Creaste un estilo que te gusta? Compártelo y todos en Casama podrán encontrarlo aquí.';

  @override
  String get galleryTypeTheme => 'Tema';

  @override
  String get galleryTypeScheme => 'Esquema de colores';

  @override
  String get galleryTypeWallpaper => 'Fondo de pantalla';

  @override
  String get galleryTypeSkill => 'Habilidad';

  @override
  String get galleryBehindChats => 'Detrás de tus chats';

  @override
  String celebrateNewBot(String name) {
    return '¡Saluda a $name!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '¡$name está listo!';
  }

  @override
  String get celebrateJoined =>
      '¡Ya estás dentro! Te damos la bienvenida al espacio.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name ya está listo.';
  }

  @override
  String get fewerEffects => 'Menos efectos';

  @override
  String get fewerEffectsHelp =>
      'Sin celebraciones, pestañas que rebotan ni bots animados.';

  @override
  String get haptics => 'Respuesta háptica';

  @override
  String get trackpadHaptics => 'Respuesta háptica del trackpad';

  @override
  String get hapticsHelp =>
      'Toques suaves cuando pasa algo o un bot te necesita.';

  @override
  String get watchHaptics => 'Vibración';

  @override
  String get settingsAppSection => 'App';

  @override
  String get settingsSecuritySection => 'Inicio de sesión y seguridad';

  @override
  String get customize => 'Personalizar';

  @override
  String get customizeColors => 'Colores';

  @override
  String get appearanceCustomLook => 'Tema personalizado';

  @override
  String get appearanceCustomHelp =>
      'Tus propios cambios. Guárdalos como un tema para conservarlos.';

  @override
  String get appearanceFromGallery => 'De la Galería';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Mostrar todos ($countString)';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Se cambió a $name';
  }

  @override
  String appearanceSaved(String name) {
    return 'Se guardó $name en tus temas';
  }

  @override
  String get appearanceAboutTheme => 'Acerca de este tema';

  @override
  String settingsOnDevServer(String host) {
    return 'Ajustes · servidor de desarrollo $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Tú: $text';
  }

  @override
  String get chatPreviewPhoto => 'Foto';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Nota de voz';

  @override
  String get chatPreviewNone => 'Todavía no hay mensajes';

  @override
  String get chatTimeYesterday => 'Ayer';

  @override
  String get chatDayToday => 'Hoy';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day a las $time';
  }

  @override
  String get anyPriority => 'Cualquier prioridad';

  @override
  String get readingAloud => 'Leyendo en voz alta';

  @override
  String get readAloudPreparing => 'Preparándose…';

  @override
  String get readAloudPaused => 'En pausa';

  @override
  String get stopReading => 'Dejar de leer';

  @override
  String get readAloudSpeed => 'Velocidad de reproducción';

  @override
  String readAloudTimeLeft(String time) {
    return 'Queda $time';
  }

  @override
  String get readAloudShowMessage => 'Mostrar el mensaje que se está leyendo';

  @override
  String mentionOpenProfile(String name) {
    return '$name, abrir perfil';
  }

  @override
  String get paywallSubtitle =>
      'Más bots, más tiempo de computadora y créditos nuevos cada mes para que tus bots sigan trabajando.';

  @override
  String get paywallPerkBots => 'Bots';

  @override
  String get paywallPerkBotsBody =>
      'Todo un equipo, cada uno con su propio trabajo.';

  @override
  String get paywallPerkComputers => 'Tiempo de computadora';

  @override
  String get paywallPerkComputersBody =>
      'Los bots tienen sus propias computadoras para navegar, programar y construir.';

  @override
  String get paywallPerkCredits => 'Créditos mensuales';

  @override
  String get paywallPerkCreditsBody => 'Para modelos, búsqueda y herramientas.';

  @override
  String get paywallPerkSeats => 'Puestos';

  @override
  String get paywallPerkSeatsBody =>
      'Trae a tu equipo al mismo espacio de trabajo.';

  @override
  String paywallHours(String hours) {
    return '$hours h';
  }

  @override
  String get paywallWeekly => 'Semanal';

  @override
  String get paywallMonthly => 'Mensual';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallPerMonth => '/ mes';

  @override
  String get paywallPerYear => '/ año';

  @override
  String get paywallContinue => 'Continuar';

  @override
  String get paywallContinueCheckout => 'Continuar al pago';

  @override
  String get paywallRestore => 'Restaurar';

  @override
  String get paywallFineStore =>
      'Se renueva automáticamente. Cancela cuando quieras en los ajustes de tu tienda.';

  @override
  String get paywallFineWeb =>
      'Se renueva automáticamente. Cancela cuando quieras desde Facturación.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, con renovación automática hasta que canceles. El pago se cobra a tu Cuenta de Apple. Cancela cuando quieras en los ajustes de tu Cuenta de Apple al menos 24 horas antes de la renovación.',
      'google_play':
          '$price, con renovación automática hasta que canceles. El pago se cobra a tu cuenta de Google Play. Cancela cuando quieras en los ajustes de tu cuenta de Google Play al menos 24 horas antes de la renovación.',
      'other':
          '$price, con renovación automática hasta que canceles. El pago se cobra a tu cuenta de la tienda. Cancela cuando quieras en los ajustes de tu cuenta de la tienda al menos 24 horas antes de la renovación.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis durante $days días, luego $price, con renovación automática hasta que canceles.',
      one:
          'Gratis durante $days día, luego $price, con renovación automática hasta que canceles.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis durante $days días, luego $price, con renovación automática hasta que canceles.',
      one:
          'Gratis durante $days día, luego $price, con renovación automática hasta que canceles.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis durante $days días, luego $price, con renovación automática hasta que canceles.',
      one:
          'Gratis durante $days día, luego $price, con renovación automática hasta que canceles.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 El pago se cobra a tu Cuenta de Apple cuando termine la prueba gratuita. Cancela en los ajustes de tu Cuenta de Apple al menos 24 horas antes de que termine la prueba gratuita y no se te cobrará.',
      'google_play':
          '$_temp1 El pago se cobra a tu cuenta de Google Play cuando termine la prueba gratuita. Cancela en los ajustes de tu cuenta de Google Play al menos 24 horas antes de que termine la prueba gratuita y no se te cobrará.',
      'other':
          '$_temp2 El pago se cobra a tu cuenta de la tienda cuando termine la prueba gratuita. Cancela en los ajustes de tu cuenta de la tienda al menos 24 horas antes de que termine la prueba gratuita y no se te cobrará.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Iniciar prueba gratuita';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días gratis, luego $price/año',
      one: '$days día gratis, luego $price/año',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días gratis, luego $price/mes',
      one: '$days día gratis, luego $price/mes',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, con renovación automática hasta que canceles. Cancela cuando quieras desde Facturación; mantienes el plan hasta que termine el período.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis durante $days días, luego $price, con renovación automática hasta que canceles.',
      one:
          'Gratis durante $days día, luego $price, con renovación automática hasta que canceles.',
    );
    return '$_temp0 Cancela desde Facturación antes de que termine la prueba gratuita y no se te cobrará.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price por semana',
      'year': '$price por año',
      'other': '$price por mes',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get aiConsentTitle => 'Tus chats van a empresas de IA';

  @override
  String get aiConsentBody =>
      'Para escribir respuestas, Casama envía lo que compartes con tus bots a proveedores externos de IA. No se envía nada hasta que aceptes.';

  @override
  String get aiConsentUpdatedNotice => 'Agregamos páginas web a esta lista.';

  @override
  String get aiConsentWhatTitle => 'Qué se envía';

  @override
  String get aiConsentWhat =>
      'Tus mensajes, archivos y fotos, tu voz en llamadas, mensajes de voz y dictado, lo que los bots recuerdan sobre ti, las páginas web que tus bots abren por ti (en su propia computadora o en el navegador de este dispositivo) y cualquier dato del teléfono que actives, como calendario o salud.';

  @override
  String get aiConsentWhoTitle => 'Quién lo recibe';

  @override
  String get aiConsentWho =>
      'OpenRouter, que lo pasa a la empresa que fabrica el modelo que usas, como DeepSeek, Google u OpenAI. Las llamadas usan Google Gemini y OpenAI convierte mensajes de voz y dictado en texto. Las búsquedas web van a Parallel, Serper o DeepSeek. Con tu propia clave de API, va en su lugar a ese proveedor.';

  @override
  String get aiConsentWhyTitle => 'Qué hacen con ello';

  @override
  String get aiConsentWhy =>
      'Lo usan para escribir la respuesta. Puedes detener esto cuando quieras en Ajustes › Privacidad, y la política de privacidad tiene los detalles.';

  @override
  String get aiConsentAgree => 'Aceptar y continuar';

  @override
  String get aiConsentTile => 'Proveedores de IA';

  @override
  String get aiConsentTileOn =>
      'Permitido. Lo que compartes con bots va a proveedores externos de IA para escribir respuestas.';

  @override
  String get aiConsentWithdrawQuestion =>
      '¿Dejar de compartir con proveedores de IA?';

  @override
  String get aiConsentWithdrawBody =>
      'Los bots no pueden responder sin ellos. Casama vuelve a preguntar antes de enviar cualquier otra cosa.';

  @override
  String get aiConsentWithdraw => 'Dejar de compartir';

  @override
  String get planChanged => 'Plan cambiado';

  @override
  String get purchasesRestored => 'Compras restauradas';

  @override
  String get creditsAdded => 'Créditos agregados';

  @override
  String get purchasePending =>
      'Esperando que se apruebe la compra. Se agregará en cuanto quede aprobada.';

  @override
  String get purchaseFailed => 'La compra no se completó y no se te cobró.';

  @override
  String get purchaseVerifyFailed =>
      'Todavía no pudimos confirmar tu compra. Volveremos a intentarlo automáticamente; si no aparece pronto, toca Restaurar compras.';

  @override
  String paywallTitleFor(String plan) {
    return 'Haz crecer tu equipo con $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return '¡Te damos la bienvenida a $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n meses gratis',
      one: '$n mes gratis',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Cambiar a $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Te suscribiste mediante el App Store. Para cambiar de plan, usa el App Store en el dispositivo desde el que te suscribiste.',
      'google_play': 'Te suscribiste mediante Google Play. Para cambiar de plan, usa Google Play en el dispositivo desde el que te suscribiste.',
      'other': 'Te suscribiste mediante una tienda de apps. Para cambiar de plan, usa esa tienda en el dispositivo desde el que te suscribiste.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Estás suscrito en la web. Cambia de plan aquí con el pago web o administra tu suscripción.';

  @override
  String get subscribedOutsideAppNote =>
      'Tu suscripción se factura fuera de esta app, así que no se puede cambiar aquí.';

  @override
  String get outOfCreditsTitle => 'Te quedaste sin créditos';

  @override
  String get outOfCreditsPaidBody =>
      'Tus bots se pausan hasta que agregues créditos. Los paquetes de créditos del App Store o Google Play nunca vencen; los paquetes de créditos comprados en la web duran 12 meses.';

  @override
  String get outOfCreditsFreeBody =>
      'Mejora tu plan para obtener más créditos cada mes, más bots y más tiempo de computadora.';

  @override
  String get addCredits => 'Agregar créditos';

  @override
  String get seePlansButton => 'Ver planes';

  @override
  String get paywallAskAdmin =>
      'Solo los propietarios y administradores del espacio de trabajo pueden cambiar el plan. Pídele a alguno de ellos que mejore el plan.';

  @override
  String get upgradeToPro => 'Mejorar a Pro';

  @override
  String get upgradeToProBody =>
      'Más bots, tiempo de computadora y créditos mensuales.';

  @override
  String get manageTab => 'Administrar';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Memoria';

  @override
  String get vitalsDisk => 'Disco';

  @override
  String get fixItTitle => '¿No funciona bien?';

  @override
  String get fixItSubtitle =>
      'Prueba esto en orden. Cada opción va un poco más allá.';

  @override
  String get fixRestart => 'Reiniciar';

  @override
  String get fixRestartHelp => 'Unos 20 segundos · no se pierde nada';

  @override
  String get fixResetSystem => 'Restablecer sistema';

  @override
  String get fixResetSystemHelp => 'Un sistema nuevo · tus archivos permanecen';

  @override
  String get fixErase => 'Borrar todo';

  @override
  String get fixEraseHelp => 'Como nueva · se puede deshacer por 7 días';

  @override
  String get fixResetAction => 'Restablecer…';

  @override
  String get fixEraseAction => 'Borrar…';

  @override
  String get computerRestarting => 'Reiniciando…';

  @override
  String get computerRestarted => 'Reiniciada. Todos tus archivos están ahí.';

  @override
  String get computerUpdateTitle => 'Actualización disponible';

  @override
  String get computerUpdateBody =>
      'Hay nuevas herramientas y correcciones listas. Actualizar reinicia esta computadora: tus archivos permanecen, las ventanas abiertas y los programas en ejecución se cierran.';

  @override
  String get computerUpdateBotWorking =>
      'Un bot está trabajando en esta computadora ahora mismo. Actualizar detiene lo que está haciendo.';

  @override
  String get computerUpdateNow => 'Actualizar ahora';

  @override
  String get computerUpdateLater => 'Más tarde';

  @override
  String get computerUpdateConfirmTitle => '¿Actualizar esta computadora?';

  @override
  String get computerUpdateMenu => 'Actualizar computadora';

  @override
  String get computerUpdating => 'Actualizando…';

  @override
  String get computerUpdated => 'Actualizada. Todos tus archivos están ahí.';

  @override
  String get computerUpdateBusyTitle => 'Un comando sigue ejecutándose';

  @override
  String get computerUpdateBusyBody =>
      'Actualizar ahora lo detiene. Espera a que termine o actualiza de todos modos.';

  @override
  String get computerUpdateAnyway => 'Actualizar de todos modos';

  @override
  String resetSheetTitle(String name) {
    return 'Restablecer $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots no podrá usarla por alrededor de un minuto.';
  }

  @override
  String get resetSheetBusyNone =>
      'No se podrá usar por alrededor de un minuto.';

  @override
  String get resetOptionSystem => 'Restablecer sistema, conservar mis archivos';

  @override
  String get resetOptionSystemHelp =>
      'Corrige instalaciones dañadas, ajustes y programas atascados.';

  @override
  String get resetOptionErase => 'Borrar todo';

  @override
  String get resetOptionEraseHelp =>
      'De vuelta a una computadora recién estrenada.';

  @override
  String get resetKept => 'Se conserva';

  @override
  String get resetRemoved => 'Se elimina';

  @override
  String get resetKeptFiles => 'Tus archivos en workspace';

  @override
  String get resetKeptSettings => 'Nombre, ajustes y bots';

  @override
  String get resetKeptRestorePoints => 'Puntos de restauración';

  @override
  String get resetRemovedApps => 'Apps y herramientas que instalaste';

  @override
  String get resetRemovedPrograms => 'Programas en ejecución';

  @override
  String get resetRemovedCaches => 'Cachés y ajustes de la carpeta personal';

  @override
  String get resetRemovedFiles =>
      'Todos los archivos, incluido el espacio de trabajo';

  @override
  String get resetSavePoint => 'Guardar primero un punto de restauración';

  @override
  String get resetSavePointHelp =>
      'Para que puedas deshacer esto durante 7 días';

  @override
  String eraseTypeName(String name) {
    return 'Escribe $name para confirmar';
  }

  @override
  String get resetConfirmSystem => 'Restablecer sistema';

  @override
  String get resetConfirmErase => 'Borrar todo';

  @override
  String get resetStepSaving => 'Guardando un punto de restauración';

  @override
  String get resetStepWipingSystem => 'Eliminando apps y ajustes';

  @override
  String get resetStepWipingErase => 'Borrando todos los archivos';

  @override
  String get resetStepRestarting => 'Iniciando un sistema nuevo';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Restableciendo… $stepString de $totalString';
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

    return 'Borrando… $stepString de $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Puedes salir de esta pantalla. Sigue avanzando por su cuenta.';

  @override
  String get resetDone => 'Sistema nuevo listo';

  @override
  String get eraseDone => 'Computadora borrada';

  @override
  String get resetFailed => 'El restablecimiento no terminó';

  @override
  String get resetUndoHint =>
      'Deshacer devuelve todo tal como estaba. El punto de restauración permanece por 7 días.';

  @override
  String get restoredPrevious => 'Se devolvió tal como estaba';

  @override
  String get usageThisMonth => 'Este mes';

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
      'Se cobra solo mientras está encendida. En reposo no cuesta nada.';

  @override
  String get usageNone => 'Todavía sin uso este mes';

  @override
  String get sleepTimerTitle => 'Entra en reposo después de';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString min';
  }

  @override
  String get sleepTimerHour => '1 hora';

  @override
  String get sleepTimerHelp =>
      'Nunca mientras un bot trabaja o la estás usando. Una espera más larga la mantiene encendida más tiempo, lo que cuesta más.';

  @override
  String sleepTimerSaved(String label) {
    return 'Entra en reposo tras $label sin actividad';
  }

  @override
  String get storageTitle => 'Almacenamiento';

  @override
  String storageOf(String total) {
    return 'de $total';
  }

  @override
  String get storageFiles => 'Tus archivos';

  @override
  String get storageApps => 'Apps y herramientas';

  @override
  String get storageCaches => 'Cachés';

  @override
  String get storageBrowser => 'Navegador';

  @override
  String get storageOther => 'Otro';

  @override
  String get storageFree => 'Gratis';

  @override
  String storageFreeUp(String size) {
    return 'Liberar $size';
  }

  @override
  String get storageNothingToClean => 'No hay cachés que limpiar';

  @override
  String storageFreed(String size) {
    return 'Se liberaron $size';
  }

  @override
  String get storageAsleep =>
      'Activa la computadora para ver qué ocupa espacio.';

  @override
  String get processesTitle => 'En ejecución ahora';

  @override
  String get processesNone =>
      'No se ejecuta nada aparte de la propia computadora.';

  @override
  String get processesAsleep => 'No se ejecuta nada mientras está en reposo.';

  @override
  String get processStop => 'Detener';

  @override
  String processStopTitle(String name) {
    return '¿Detener $name?';
  }

  @override
  String get processStopMessage => 'Se perderá todo lo que no haya guardado.';

  @override
  String processStopped(String name) {
    return 'Se detuvo $name';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu % de CPU · $memory';
  }

  @override
  String get usedByTitle => 'Usada por';

  @override
  String get usedByNone => 'Todavía ningún bot usa esta computadora.';

  @override
  String botLastActive(String when) {
    return 'Activo $when';
  }

  @override
  String get botNeverActive => 'Todavía sin actividad';

  @override
  String get restorePointsTitle => 'Puntos de restauración';

  @override
  String get restorePointsNone =>
      'Todavía ninguno. Los bots guardan uno antes de cambios arriesgados.';

  @override
  String get restorePointSaveNow => 'Guardar un punto de restauración ahora';

  @override
  String get restorePointSaveTitle => 'Guardar un punto de restauración';

  @override
  String get restorePointDefaultLabel => 'Guardado manualmente';

  @override
  String get restorePointSaved => 'Punto de restauración guardado';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Mostrar los $nString';
  }

  @override
  String get historyTitle => 'Historial';

  @override
  String get historyNone => 'Todavía no pasó nada.';

  @override
  String get historyStarted => 'Se activó';

  @override
  String get historySlept => 'Entró en reposo';

  @override
  String get historySleptIdle => 'Entró en reposo (sin actividad)';

  @override
  String get historyRestarted => 'Se reinició';

  @override
  String get historyReset => 'Restableció el sistema';

  @override
  String get historyErased => 'Borró todo';

  @override
  String get historyCheckpointCreated => 'Guardó un punto de restauración';

  @override
  String get historyCheckpointRestored => 'Restauró un punto de restauración';

  @override
  String historyStorageCleaned(String size) {
    return 'Liberó $size';
  }

  @override
  String get historyStorageCleanedPlain => 'Liberó espacio';

  @override
  String historyProcessStopped(String name) {
    return 'Detuvo $name';
  }

  @override
  String get historyUpdated => 'Cambió sus ajustes';

  @override
  String get historyYou => 'tú';

  @override
  String get yourDataTitle => 'Tus datos';

  @override
  String get downloadAllFiles => 'Descargar todos los archivos';

  @override
  String get downloadAllFilesHelp =>
      'Un .zip con todo lo del espacio de trabajo';

  @override
  String get downloadNothing => 'Todavía no hay archivos para descargar.';

  @override
  String get deleteComputerHelp =>
      'La elimina junto con sus puntos de restauración';

  @override
  String get manageComputer => 'Administrar';

  @override
  String get restartComputer => 'Reiniciar';

  @override
  String get resetComputerMenu => 'Restablecer…';

  @override
  String get moreFixes => 'Más correcciones';

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
  String get remoteUpdateTitle => 'Hora de actualizar Casama';

  @override
  String get remoteUpdateBody =>
      'Esta versión de Casama ya no es compatible. Actualízala desde donde la instalaste.';

  @override
  String get remoteUpdateNoLink =>
      'Esta versión de Casama ya no es compatible. Actualízala para continuar.';

  @override
  String get remoteMaintenanceTitle => 'Casama está en mantenimiento';

  @override
  String get openLink => 'Abrir';

  @override
  String get routineIdeas => 'Ideas';

  @override
  String get routineIdeasHelp =>
      'Empieza desde una idea y luego cambia lo que quieras.';

  @override
  String get pluginDirectory => 'Plugins revisados';

  @override
  String get pluginDirectoryHelp =>
      'Revisados por Casama y fijados a la versión que se revisó.';

  @override
  String get pluginOrPaste => 'O agrega uno desde un enlace de GitHub';

  @override
  String byAuthor(String name) {
    return 'Por $name';
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
  String get paywallBillingPeriod => 'Período de facturación';

  @override
  String get paywallNotSoldTitle => 'No hay planes en este servidor';

  @override
  String get paywallNotSoldBody =>
      'Este servidor no vende planes, así que aquí no hay nada que mejorar.';

  @override
  String get paywallPlansFailedTitle => 'No se pudieron cargar los planes';

  @override
  String get paywallPlansFailedBody =>
      'Revisa tu conexión e inténtalo de nuevo.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'El App Store no muestra planes',
      'google_play': 'Google Play no muestra planes',
      'other': 'La tienda no muestra planes',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Asegúrate de haber iniciado sesión en el App Store en este dispositivo e inténtalo de nuevo.',
      'google_play': 'Asegúrate de haber iniciado sesión en Google Play en este dispositivo e inténtalo de nuevo.',
      'other': 'Asegúrate de haber iniciado sesión en la tienda en este dispositivo e inténtalo de nuevo.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Ahorra hasta un $pct%';
  }

  @override
  String get paywallMostPopular => 'Más popular';

  @override
  String get paywallTaglinePlus => 'Para ti y algunos bots';

  @override
  String get paywallTaglinePro => 'Para bots muy activos y un equipo pequeño';

  @override
  String get paywallTaglineMax =>
      'Para equipos con bots trabajando todo el día';

  @override
  String get paywallPerMonthShort => '/mes';

  @override
  String paywallBilledYearly(String price) {
    return '$price con facturación anual';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Equivale a $price/mes';
  }

  @override
  String get paywallBilledMonthly => 'Facturación mensual';

  @override
  String get paywallBilledWeekly => 'Facturación semanal';

  @override
  String get paywallPerWeekShort => '/sem';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Son $price a la semana';
  }

  @override
  String get paywallBilledYearlyPlain => 'Facturación anual';

  @override
  String get paywallPerYearShort => '/año';

  @override
  String paywallStartTrial(int n) {
    return 'Iniciar prueba gratuita de $n días';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'Suscribirse a $plan';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personas',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString horas de computadora';
  }

  @override
  String paywallFactRuns(int runs, String credits) {
    final intl.NumberFormat runsNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String runsString = runsNumberFormat.format(runs);

    return 'Unas $runsString respuestas al mes ($credits)';
  }

  @override
  String get billingChangePlan => 'Cambiar de plan';

  @override
  String get billingChangePlanBody =>
      'Compara todos los planes, mensuales o anuales.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'Lo que te ofrece $plan';
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
  String get updatesRow => 'Actualizaciones';

  @override
  String get updatesRowSubtitle => 'Novedades de tu espacio de trabajo';

  @override
  String get updatesEmpty => 'Sin actualizaciones';

  @override
  String get updatesEmptyHelp =>
      'Los avisos del espacio de trabajo y las páginas nuevas aparecen aquí. Lo que te envían tus bots está en sus chats.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cosas te necesitan',
      one: '1 cosa te necesita',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Trabajando en ello: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Ahora no: $title';
  }

  @override
  String openTopic(String title) {
    return 'Abrir $title';
  }

  @override
  String get newTopic => 'Nuevo tema';

  @override
  String get topics => 'Temas';

  @override
  String get olderTopics => 'Anteriores';

  @override
  String get generalChat => 'General';

  @override
  String get allTopics => 'Todos los temas';

  @override
  String get cardSecrets => 'Secretos';

  @override
  String get cardApproval => 'Aprobación';

  @override
  String get cardTakeover => 'Tomar el control';

  @override
  String get cardDevice => 'Acceso al dispositivo';

  @override
  String get cardSuggestion => 'Sugerencia';

  @override
  String get formBack => 'Atrás';

  @override
  String get formNext => 'Siguiente';

  @override
  String get formSkip => 'Omitir';

  @override
  String formStep(int n, int total) {
    return 'Pregunta $n de $total';
  }

  @override
  String get cardSuggestions => 'Sugerencias';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Encontré $n cosas que vale la pena ver',
      one: 'Encontré $n cosa que vale la pena ver',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Iniciado $when';
  }

  @override
  String get suggestionStartedPlain => 'Iniciado';

  @override
  String get suggestionPutAway => 'Descartar';

  @override
  String get suggestionExpired => 'Vencida';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Vencida: $title';
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
      other: 'Vence en $nString minutos',
      one: 'Vence en 1 minuto',
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
      other: 'Vence en $nString horas',
      one: 'Vence en 1 hora',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sugerencias atendidas',
      one: '1 sugerencia atendida',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Usar este servidor en tu teléfono';

  @override
  String get linkIntro =>
      'Dale a este servidor una dirección a la que tu teléfono pueda acceder desde cualquier lugar. Sin dominio ni ajustes del router.';

  @override
  String get linkIntroDetails =>
      'Vincula este servidor con una cuenta gratuita de Casama Cloud. El tráfico de tu teléfono pasa por Cloudflare directo a esta computadora, nunca por los servidores de Casama.';

  @override
  String get linkTurnOn => 'Usar en tu teléfono';

  @override
  String get linkSignupsNote =>
      'Los registros nuevos se cierran mientras está activado. Solo pueden iniciar sesión quienes ya tengan una cuenta aquí.';

  @override
  String get linkStepSignIn => 'Vincular este servidor';

  @override
  String get linkSignInBody =>
      'Aprueba este código en la página que se acaba de abrir en tu navegador. Comprueba que la página muestre el mismo código.';

  @override
  String get linkSignInOpen => 'Abrir la página de nuevo';

  @override
  String get linkStepAddress => 'Obtener una dirección';

  @override
  String get linkStepRestart => 'Reiniciar el servidor';

  @override
  String get linkStepConnect => 'Conectar';

  @override
  String get linkStateOnline => 'En línea';

  @override
  String get linkStateStarting => 'Iniciando';

  @override
  String get linkStateOffline => 'Sin conexión';

  @override
  String get linkStateAttention => 'Requiere atención';

  @override
  String get linkStateOff => 'Desactivado';

  @override
  String get linkAddress => 'Dirección';

  @override
  String get linkLocalAddress => 'En esta computadora';

  @override
  String get linkShowCode => 'Mostrar código de inicio de sesión';

  @override
  String get linkCheck => 'Comprobar de nuevo';

  @override
  String get linkTurnOff => 'Desactivar';

  @override
  String get linkTurnOffConfirm =>
      '¿Desactivar el acceso remoto? La dirección deja de funcionar y los teléfonos pierden conexión con este servidor hasta que lo actives de nuevo. Recuperará la misma dirección.';

  @override
  String get linkTurningOff => 'Desactivando';

  @override
  String get linkNeedsOwner =>
      'Solo la persona propietaria de este servidor puede activar esto.';

  @override
  String get linkTwoStepTip =>
      'Ahora se puede acceder a este servidor desde internet. Con el inicio de sesión en dos pasos, una contraseña adivinada no basta.';

  @override
  String get linkProblemNotLinked =>
      'Este servidor no está vinculado a Casama Cloud. Actívalo de nuevo para vincularlo.';

  @override
  String get linkProblemCloudUnreachable =>
      'No se puede acceder a Casama Cloud en este momento. Si la dirección funcionaba, sigue funcionando.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud ya no acepta la clave de este servidor. Actívalo de nuevo para vincularlo.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud desactivó el acceso remoto para este servidor.';

  @override
  String get linkProblemRemoved =>
      'Se eliminó este servidor de su espacio de trabajo en Casama Cloud. Actívalo de nuevo para vincularlo.';

  @override
  String get linkProblemPlanLimit =>
      'Tu plan de Casama Cloud conecta menos servidores. Quita uno allá o mejora tu plan.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud ya no tiene una dirección para este servidor. Actívalo de nuevo.';

  @override
  String get linkProblemAddressChanged =>
      'La dirección de este servidor cambió. Actívalo de nuevo para usar la nueva.';

  @override
  String get connectProblemConnectorMissing =>
      'El conector no se está ejecutando. Revisa que Docker esté en ejecución y comprueba de nuevo.';

  @override
  String get connectProblemConnectorBlocked =>
      'Esta red bloquea la conexión. La causa habitual es una VPN o un firewall estricto (puerto de salida 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Todo está conectado, pero la dirección aún no responde. Una dirección nueva puede tardar un minuto.';

  @override
  String get linkServers => 'Servidores vinculados';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Tu plan conecta $limit servidores.',
      one: 'Tu plan conecta 1 servidor.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Todavía no hay servidores vinculados. En tu propio servidor, abre Ajustes y luego Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return '¿Quitar $name? Su dirección deja de funcionar. El servidor se puede volver a vincular más adelante.';
  }

  @override
  String get linkStatusActive => 'Tiene dirección';

  @override
  String get linkStatusParked => 'Sin actividad reciente';

  @override
  String get linkStatusSuspended => 'Suspendido';

  @override
  String get pairDevice => 'Iniciar sesión en otro dispositivo';

  @override
  String get pairDeviceRow => 'Mostrar un código para escanear con tu teléfono';

  @override
  String get pairDeviceHelp =>
      'Escanea esto con la cámara de tu teléfono. O en Casama en el teléfono: Iniciar sesión y luego Escanear un código.';

  @override
  String get pairDeviceWarning =>
      'Quien lo escanee iniciará sesión como tú. Funciona una sola vez, durante unos minutos.';

  @override
  String pairDeviceServer(String host) {
    return 'Inicia sesión en $host';
  }

  @override
  String get pairDeviceNewCode => 'Nuevo código';

  @override
  String get pairDeviceExpired => 'Este código venció.';

  @override
  String get pairDeviceNotReachable =>
      'Este servidor solo responde en esta computadora, así que un teléfono todavía no puede conectarse.';

  @override
  String get pairDeviceNotReachableOther =>
      'La dirección de este servidor solo funciona en su propia red. Pídele a quien lo administra una dirección accesible para otros.';

  @override
  String get pairDeviceCopyLink => 'Copiar enlace';

  @override
  String get pairDeviceLinkCopied =>
      'Enlace copiado. Pégalo en Casama para Chrome o en otro dispositivo.';

  @override
  String get pairDeviceConnectChrome => 'Conectar Chrome';

  @override
  String get pairDeviceChromeDone => 'Casama para Chrome inició sesión.';

  @override
  String get pairDeviceChromeFinish =>
      'Termina en la pestaña de Casama para Chrome que se abrió.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama para Chrome no está instalado en este navegador.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama para Chrome no pudo iniciar sesión. $error';
  }

  @override
  String get scanToSignIn => 'Escanear un código desde tu computadora';

  @override
  String get scanToSignInTitle => 'Escanea el código';

  @override
  String get scanToSignInHelp =>
      'En una computadora donde hayas iniciado sesión, abre Ajustes y luego Iniciar sesión en otro dispositivo.';

  @override
  String pairSignInTo(String host) {
    return '¿Iniciar sesión en $host?';
  }

  @override
  String get pairSignInBody =>
      'El código inicia sesión en este dispositivo con la cuenta que lo mostró.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Este dispositivo usa $current ahora. Si inicias sesión en $host, cambiará a ese servidor.';
  }

  @override
  String get pairSigningIn => 'Iniciando sesión';

  @override
  String get pairCodeInvalid =>
      'Ese código ya no es válido. Muestra uno nuevo y vuelve a escanear.';

  @override
  String get pairLinkInvalid =>
      'Este no es un código de inicio de sesión de Casama.';

  @override
  String get linkServerTitle => 'Vincular un servidor';

  @override
  String linkServerBody(String name) {
    return '$name quiere conectarse a tu cuenta de Casama Cloud.';
  }

  @override
  String get linkServerCode => 'Código en el servidor';

  @override
  String get linkServerCheck =>
      'Vincúlalo solo si iniciaste esto en tu propio servidor y muestra este mismo código.';

  @override
  String get linkServerWhat =>
      'Obtiene una dirección pública y puede enviarte notificaciones. No puede gastar tus créditos.';

  @override
  String get linkServerApprove => 'Vincular';

  @override
  String get linkServerDone => 'Vinculado';

  @override
  String linkServerDoneBody(String name) {
    return 'Vuelve a $name. Continúa por su cuenta.';
  }

  @override
  String get linkServerInvalid =>
      'Ese código ya no es válido. Empieza de nuevo en tu servidor.';

  @override
  String get linkServerEnterCode => 'El código que muestra tu servidor';

  @override
  String get linkServerFind => 'Buscar';

  @override
  String get linkServerNeedAdmin =>
      'Solo quienes son propietarios o administradores de un espacio de trabajo pueden vincular un servidor.';

  @override
  String get localDockerStopped =>
      'Docker no se está ejecutando, así que tu servidor está detenido';

  @override
  String get localDockerStoppedBody =>
      'Tu servidor de Casama se ejecuta en Docker en esta computadora. Abre Docker y Casama volverá a conectarse por sí solo cuando el servidor vuelva, lo que puede tardar un minuto.';

  @override
  String get serverOfflineTitle => 'Tu servidor está sin conexión';

  @override
  String get serverOfflineBody =>
      '¿La computadora que lo ejecuta está encendida y activa? Esto se reconecta por sí solo.';

  @override
  String get signUpsClosed =>
      'Este servidor no acepta cuentas nuevas. Inicia sesión con una cuenta que ya tengas aquí.';

  @override
  String get signUpsByInvitation =>
      'Las cuentas nuevas aquí son por invitación. Usa el correo electrónico con el que te invitaron.';

  @override
  String get linkPrivateNotifications => 'Notificaciones privadas';

  @override
  String get linkPrivateNotificationsHelp =>
      'Las notificaciones llegan a tu teléfono a través de Casama Cloud. Con esto activado no llevan texto y solo dicen “Actividad nueva”; la app carga el resto desde este servidor.';

  @override
  String get linkInvites => 'Permitir registro a personas invitadas';

  @override
  String get linkInvitesHelp =>
      'Desactivado: nadie puede crear una cuenta nueva. Activado: pueden hacerlo las personas que invites por correo. Cambiarlo reinicia el servidor.';

  @override
  String get linkKeepAwake =>
      'Mantener esta Mac activa mientras esté conectada';

  @override
  String get linkKeepAwakeHelp =>
      'Los teléfonos solo pueden acceder a este servidor mientras esta computadora esté activa y Casama esté abierto.';

  @override
  String get linkLiveView => 'Vista en vivo fuera de casa';

  @override
  String get linkLiveViewIncluded =>
      'Incluido en tu plan. Lejos de esta computadora, la pantalla de un bot se reproduce en vivo a través del retransmisor de Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Viene con Plus y superiores en Casama Cloud. Lejos de esta computadora ves la pantalla de un bot aproximadamente una vez por segundo. En esta computadora siempre está en vivo.';

  @override
  String get liveAwayNeedsPlan =>
      'Lejos de la computadora del servidor, el video en vivo viene con Plus y superiores en Casama Cloud. Hasta entonces la pantalla se actualiza aproximadamente una vez por segundo.';

  @override
  String get chatShareExport => 'Compartir o exportar';

  @override
  String get chatShareExportHelp =>
      'Guarda este chat como archivo o crea un enlace de solo lectura.';

  @override
  String get chatExportMarkdown => 'Exportar como Markdown';

  @override
  String get chatExportMarkdownHelp =>
      'Un archivo de texto que cualquiera puede leer';

  @override
  String get chatExportJson => 'Exportar como JSON';

  @override
  String get chatExportJsonHelp => 'Para otras apps y scripts';

  @override
  String get chatShareLink => 'Compartir un enlace de solo lectura';

  @override
  String get chatShareLinkHelp =>
      'Cualquier persona con el enlace puede leer este chat';

  @override
  String get chatStopSharing => 'Dejar de compartir el enlace';

  @override
  String get chatStopSharingHelp => 'El enlace deja de funcionar';

  @override
  String get chatMakePublicTitle => '¿Compartir este chat con un enlace?';

  @override
  String get chatMakePublicBody =>
      'Cualquier persona con el enlace puede leer este chat tal como lo ves. Los archivos adjuntos se muestran por nombre, pero no se comparten. Puedes detenerlo en cualquier momento.';

  @override
  String get chatMakePublic => 'Crear enlace';

  @override
  String get chatLinkTitle => 'Enlace de solo lectura';

  @override
  String get chatLinkBody =>
      'Copiado. No aparece en los buscadores. Si creas un enlace nuevo, este deja de funcionar.';

  @override
  String get chatSharingStopped => 'El enlace ya no funciona';

  @override
  String get creationDuplicate => 'Duplicar';

  @override
  String creationDuplicated(String title) {
    return 'Copia creada: “$title”';
  }

  @override
  String get slackInstall => 'Agregar a Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Conecta un espacio de trabajo de Slack en un solo paso. $bot responde a las @menciones y mensajes directos allí.';
  }

  @override
  String get slackInstallFinish => 'Termina en Slack y luego vuelve aquí.';

  @override
  String get helpAndSupport => 'Ayuda y soporte';

  @override
  String get helpAndSupportRow =>
      'Pregunta a Ayuda de Casama, contáctanos, guías';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Respuestas al instante con nuestras guías y tu cuenta. Una persona está a un toque.';

  @override
  String get supportIntro =>
      '¿Dudas, un problema con una compra o algo no funciona? Escríbenos.';

  @override
  String supportSelfHosted(String host) {
    return 'Tu espacio de trabajo se ejecuta en $host. Para inicios de sesión, cuentas y planes, consulta con quien administra ese servidor. Nosotros podemos ayudarte con la app en sí.';
  }

  @override
  String get supportTalkToPerson => 'Hablar con una persona';

  @override
  String get contactSupport => 'Contactar a soporte';

  @override
  String contactSupportRow(String email) {
    return 'Escribe a nuestro equipo a $email';
  }

  @override
  String get sendFeedback => 'Enviar comentarios';

  @override
  String get sendFeedbackRow =>
      'Ideas, lo que te gusta y lo que no. Leemos todos.';

  @override
  String get feedbackHelp =>
      'Cuéntanos qué te gustaría que hiciera Casama, qué te encanta o qué te estorbó.';

  @override
  String get feedbackKindPrompt => '¿Qué tipo de comentario es?';

  @override
  String get feedbackKindIdea => 'Idea';

  @override
  String get feedbackKindLike => 'Me gusta';

  @override
  String get feedbackKindDislike => 'No me gusta';

  @override
  String get feedbackKindConfusing => 'Confuso';

  @override
  String get feedbackMessageLabel => 'Tu comentario';

  @override
  String get feedbackMessageHint =>
      'Por ejemplo: me gustaría poder fijar un chat arriba.';

  @override
  String get feedbackContactOk => 'Casama puede contactarme sobre esto';

  @override
  String get feedbackContactOkHelp =>
      'Es posible que te enviemos una pregunta por correo o te avisemos cuando esté listo.';

  @override
  String get feedbackNote =>
      'Se envían la versión de la app y tu plan. ¿Tienes un problema con tu cuenta o una compra? Usa “Contactar a soporte”.';

  @override
  String get feedbackThanks => '¡Gracias! Leemos todos.';

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
  String get supportIdeasBoard => 'Tablero de ideas';

  @override
  String get supportIdeasBoardHelp =>
      'Mira lo que pidieron otros y vota por lo que quieres ver después';

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
      'Cuéntanos qué pasa. Te responderemos por correo electrónico.';

  @override
  String get contactSupportHelpMail =>
      'Cuéntanos qué pasa. Esto abre tu app de correo con los datos ya completados.';

  @override
  String get supportSend => 'Enviar';

  @override
  String get supportWriteEmail => 'Abrir correo';

  @override
  String get supportTopicPrompt => '¿De qué se trata?';

  @override
  String get supportTopicBilling => 'Facturación y compras';

  @override
  String get supportTopicBroken => 'Algo no funciona';

  @override
  String get supportTopicAccount => 'Cuenta e inicio de sesión';

  @override
  String get supportTopicQuestion => 'Una pregunta o idea';

  @override
  String get supportTopicOther => 'Otra cosa';

  @override
  String get supportMessageLabel => 'Tu mensaje';

  @override
  String get supportMessageHint => '¿Qué pasó y qué esperabas que pasara?';

  @override
  String get supportMessageMore =>
      'Agrega una o dos frases: qué estabas haciendo y qué salió mal.';

  @override
  String get supportIncludeChat =>
      'Incluir mi conversación con Ayuda de Casama';

  @override
  String get supportIncludeChatHelp =>
      'Para que no tengas que explicarlo dos veces.';

  @override
  String get supportDetailsNote =>
      'Agregamos la versión de la app y los ID de tu espacio de trabajo y tu cuenta para poder encontrar tu cuenta. Nunca tus chats.';

  @override
  String get supportSentTitle => 'Mensaje enviado';

  @override
  String supportSentBody(String email, String reference) {
    return 'Te responderemos a $email. Tu referencia es $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'No se encontró una app de correo, así que copiamos tu mensaje. Pégalo en un correo dirigido a $email.';
  }

  @override
  String get supportGuides => 'Guías y preguntas frecuentes';

  @override
  String get supportGuidesHelp => 'Ayuda paso a paso para todo en Casama';

  @override
  String get introVideoTitle => 'Mira cómo funciona Casama';

  @override
  String get introVideoSubtitle => 'Un video de 1 minuto y medio';

  @override
  String get supportIntroVideo => 'Ver el video de presentación';

  @override
  String get introVideoFailed =>
      'No se pudo reproducir el video. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get introVideoOnYoutube => 'Ver en YouTube';

  @override
  String get introVideoReplay => 'Ver de nuevo';

  @override
  String get supportIntroVideoHelp =>
      'Mira lo que Casama puede hacer en 1 minuto y medio';

  @override
  String get supportRate => 'Calificar Casama';

  @override
  String get supportRateHelp =>
      'Cuéntales a otros lo que piensas en la página de la tienda';

  @override
  String get supportIds => 'ID de soporte';

  @override
  String get supportIdsHelp =>
      'Es posible que soporte te los pida. Sirven para encontrar tu cuenta y tus compras, y no le dan acceso a nadie.';

  @override
  String supportWorkspaceId(String name) {
    return 'ID del espacio de trabajo · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'También es tu ID de compra en el App Store y Google Play';

  @override
  String get supportAccountId => 'ID de la cuenta';

  @override
  String get supportCopyAll => 'Copiar todos los datos';

  @override
  String get supportCopyAllHelp =>
      'Versión de la app, plataforma e ID, para pegarlos en un mensaje';

  @override
  String get supportNewChat => 'Nueva conversación';

  @override
  String get supportAskHint => 'Pregunta cualquier cosa sobre Casama';

  @override
  String get supportAiNote =>
      'Ayuda de Casama usa IA y puede equivocarse. Ve tu plan y los errores del bot, no tus chats.';

  @override
  String get supportGreeting =>
      '¡Hola! Soy Ayuda de Casama. Pregúntame sobre Casama, tu plan o algún problema que tengas. Si no puedo resolverlo, se lo pasaré a nuestro equipo de soporte.';

  @override
  String get supportStarterPurchase => 'Mi compra no se completó';

  @override
  String get supportStarterCancel => '¿Cómo cancelo mi plan?';

  @override
  String get supportStarterBot => 'Mi bot no responde';

  @override
  String get supportStarterHowTo => '¿Qué pueden hacer mis bots?';

  @override
  String get supportAskPerson => 'Preguntar a una persona';

  @override
  String get supportHandoffTitle => '¿Enviar esto a nuestro equipo de soporte?';

  @override
  String get supportHandoffButton => 'Revisar y enviar';

  @override
  String get supportThinking => 'Revisando…';

  @override
  String get supportAssistantError =>
      'Ayuda de Casama no pudo responder. Inténtalo de nuevo o pregunta a una persona.';

  @override
  String get supportAssistantLimit =>
      'Ayuda de Casama no puede responder más en este momento. Una persona puede ayudarte.';

  @override
  String get purchaseHelp => '¿Problemas con una compra? Obtén ayuda';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Reportar';

  @override
  String get reportAndBlock => 'Reportar y bloquear';

  @override
  String get reportReply => 'Reportar respuesta';

  @override
  String get reportBot => 'Reportar bot';

  @override
  String get reportBotRow =>
      'Algo en su nombre, descripción o respuestas no está bien';

  @override
  String get reportPerson => 'Reportar persona';

  @override
  String get reportGalleryItem => 'Reportar elemento de la galería';

  @override
  String get reportGalleryRequest => 'Reportar solicitud';

  @override
  String get reportWorkspace => 'Reportar espacio de trabajo';

  @override
  String get reportHelp =>
      'Cuéntales qué pasa a quienes administran este servidor. Revisan todos los reportes.';

  @override
  String get reportPersonHelp =>
      'Cuéntales qué pasó a quienes administran este servidor. También bloquearemos a esta persona por ti.';

  @override
  String get reportNote => 'Cualquier otra cosa que deban saber (opcional)';

  @override
  String reportAlsoBlock(String name) {
    return 'También bloquear a $name';
  }

  @override
  String get reportSent => 'Gracias. Tu reporte se envió para revisión.';

  @override
  String get reportReasonSpam => 'Spam o estafa';

  @override
  String get reportReasonSexual => 'Contenido sexual';

  @override
  String get reportReasonViolence => 'Violencia o amenazas';

  @override
  String get reportReasonHarassment => 'Acoso u odio';

  @override
  String get reportReasonIllegal => 'Ilegal o peligroso';

  @override
  String get reportReasonImpersonation => 'Suplantación de identidad';

  @override
  String get reportReasonOther => 'Otra cosa';

  @override
  String get thisPerson => 'esta persona';

  @override
  String blockPerson(String name) {
    return 'Bloquear a $name';
  }

  @override
  String blocked(String name) {
    return 'Se bloqueó a $name';
  }

  @override
  String get blockHelp =>
      'Las personas bloqueadas no pueden invitarte a un espacio de trabajo y no recibirás mensajes de ellas.';

  @override
  String get blockedPeople => 'Personas bloqueadas';

  @override
  String get blockedPeopleRow =>
      'Personas que no pueden invitarte ni contactarte';

  @override
  String get noBlockedPeople => 'No hay nadie bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get emailTips => 'Consejos y novedades por correo';

  @override
  String get emailTipsHelp =>
      'Consejos para empezar y alguna actualización ocasional. Los correos sobre tu plan y tu cuenta siempre llegan.';

  @override
  String get reportsInApp => 'Reportado en la app';

  @override
  String get reportsNone =>
      'Sin reportes abiertos. Aquí aparecen los reportes que envían las personas desde la app.';

  @override
  String get reportsPublicLinks => 'Enlaces públicos reportados';

  @override
  String get reportsNoLinks => 'No se reportaron enlaces públicos.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reportes',
      one: '1 reporte',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Retirar';

  @override
  String get reportsRestore => 'Restaurar';

  @override
  String get reportKindReply => 'Respuesta de bot';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Persona';

  @override
  String get reportKindGallery => 'Elemento de la galería';

  @override
  String get reportKindWorkspace => 'Espacio de trabajo';

  @override
  String get reportMarkActioned => 'Atendido';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Suspender el espacio de trabajo $name';
  }

  @override
  String get reportDismiss => 'Descartar: no hay nada malo';

  @override
  String get supportWebTitle => 'Ayuda de Casama en el sitio web';

  @override
  String get supportWebOn => 'Activado';

  @override
  String get supportWebOff => 'Desactivado';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count direcciones IP en pausa',
      one: '$count dirección IP en pausa',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Mostrar $count preguntas sin responder';
  }

  @override
  String get ticketsOpen => 'Abiertos';

  @override
  String get ticketsClosed => 'Cerrados';

  @override
  String get ticketsAll => 'Todos';

  @override
  String get ticketsNone => 'No hay mensajes aquí.';

  @override
  String get ticketClose => 'Cerrar';

  @override
  String get ticketReopen => 'Reabrir';

  @override
  String get serviceStatus => 'Estado';

  @override
  String get supportStatus => 'Estado de Casama Cloud';

  @override
  String get supportStatusHelp =>
      'Comprueba si algo está caído en este momento';

  @override
  String get galleryChatSuggestionLabel => 'De la galería';

  @override
  String get galleryChatAdd => 'Agregar';

  @override
  String galleryChatAdded(String name) {
    return 'Se agregó $name';
  }

  @override
  String galleryChatReads(String things) {
    return 'Lee: $things';
  }

  @override
  String get galleryChatRunsCode => 'Ejecuta código';

  @override
  String get galleryChatComputer => 'Usa una computadora';

  @override
  String galleryChatNeeds(String apps) {
    return 'Necesita: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Borrador de habilidad';

  @override
  String get galleryChatShowInstructions => 'Mostrar instrucciones';

  @override
  String get galleryChatHideInstructions => 'Ocultar instrucciones';

  @override
  String get galleryChatSaveSkill => 'Guardar en mis habilidades';

  @override
  String get galleryChatSaved => 'Guardado';

  @override
  String get galleryChatSavedSkill => 'Guardado en tus habilidades';

  @override
  String get galleryChatSubmit => 'Enviar a la galería';

  @override
  String galleryChatSubmitTitle(String name) {
    return '¿Enviar $name a la galería?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Primero lo revisa alguien del equipo de la galería. Cuando se aprueba, cualquiera puede encontrarlo y usarlo. Como autor aparece tu nombre visible, nunca tu correo.';

  @override
  String get galleryChatSent => 'Enviado';

  @override
  String get galleryChatSubmitted => 'Enviado a la galería para revisión';

  @override
  String get galleryChatSubmissionsOff =>
      'Este servidor no acepta envíos a la galería.';

  @override
  String get galleryPicksTitle => 'Selecciones para ti';

  @override
  String get galleryPicksHelp =>
      'Empieza con un conjunto de habilidades, apps y rutinas que encajan contigo. Puedes cambiar cualquier cosa después.';

  @override
  String get galleryPicksAdd => 'Agregar este conjunto';

  @override
  String get galleryPicksSkip => 'Omitir por ahora';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Agregar $name';
  }

  @override
  String get galleryPicksBestMatch => 'Mejor opción';

  @override
  String get galleryPicksInside => 'Qué incluye';

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
      other: '$count habilidades',
      one: '1 habilidad',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutinas',
      one: '1 rutina',
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
      other: '$count estilos',
      one: '1 estilo',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return 'Se agregó $name';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return 'Se agregó $name. Conecta $apps en Apps para terminar.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Un administrador revisará $name antes de agregarlo.';
  }

  @override
  String get galleryPolicyTitle => 'Galería';

  @override
  String get galleryPolicyRow =>
      'Qué pueden agregar desde la galería quienes están aquí';

  @override
  String get galleryPolicyMode => 'Quién puede agregar';

  @override
  String get galleryPolicyOpen => 'Abierto';

  @override
  String get galleryPolicyOpenHelp =>
      'Cualquiera aquí puede agregar todo lo que no esté bloqueado.';

  @override
  String get galleryPolicyApproval => 'Preguntar antes';

  @override
  String get galleryPolicyApprovalHelp =>
      'Agregar pregunta primero a un administrador, según lo que elijas abajo.';

  @override
  String get galleryPolicyAllowlist => 'Solo permitidos';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Las personas solo pueden agregar lo que está en la lista permitida.';

  @override
  String get galleryPolicyApprovalFor => 'Preguntar antes para';

  @override
  String get galleryPolicyRunsCode => 'Cosas que ejecutan código';

  @override
  String get galleryPolicyApps => 'Cosas que conectan apps';

  @override
  String get galleryPolicyAll => 'Todo';

  @override
  String get galleryPolicyAllowed => 'Permitidos';

  @override
  String get galleryPolicyAllowedHelp =>
      'Se agrega sin preguntar. Con Solo permitidos, es lo único que la gente puede agregar.';

  @override
  String get galleryPolicyBlocked => 'Bloqueados';

  @override
  String get galleryPolicyBlockedHelp => 'Nadie aquí puede agregar esto.';

  @override
  String get galleryPolicyAddItem => 'Agregar desde la galería';

  @override
  String get galleryPolicyNone => 'Nada todavía';

  @override
  String get galleryPolicySearch => 'Buscar en la galería';

  @override
  String get galleryPolicyNoResults => 'Nada en la galería coincide.';

  @override
  String get galleryPolicySaved => 'Reglas de la galería guardadas';

  @override
  String galleryPolicyRemove(String name) {
    return 'Quitar $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Solo administradores y propietarios pueden cambiar esto.';

  @override
  String get galleryPolicyWaiting => 'Esperando aprobación';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name lo solicitó';
  }

  @override
  String get galleryPolicyApprove => 'Aprobar';

  @override
  String get galleryPolicyDecline => 'Rechazar';

  @override
  String galleryPolicyApproved(String name) {
    return '$name aprobado y agregado';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name rechazado';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Aprobado, pero no se pudo agregar $name. $error';
  }

  @override
  String get galleryDigestEmails => 'Selecciones mensuales de la galería';

  @override
  String get galleryDigestHelp =>
      'Hasta seis habilidades, apps y rutinas nuevas que encajan con lo que usas, una vez al mes.';

  @override
  String get newsletterTitle => 'El correo mensual de Casama';

  @override
  String get newsletterHelp =>
      'Novedades y lo que viene, como máximo una vez al mes.';

  @override
  String get newsletterSignUp =>
      'Quiero recibir el correo mensual de Casama: novedades y lo que viene, como máximo una vez al mes.';

  @override
  String get newsletterCardTitle =>
      '¿Quieres recibir el correo mensual de Casama?';

  @override
  String get newsletterCardBody =>
      'Novedades y lo que viene, como máximo una vez al mes. Date de baja cuando quieras.';

  @override
  String get newsletterCardYes => 'Sí, envíamelo';

  @override
  String get newsletterCardNo => 'No, gracias';

  @override
  String get newsletterCardDone =>
      'Ya estás en la lista. Desactívalo cuando quieras en Ajustes.';

  @override
  String get galleryKindApp => 'App';

  @override
  String get galleryKindApps => 'Apps';

  @override
  String get galleryKindBot => 'Bot de inicio';

  @override
  String get galleryKindBots => 'Bots de inicio';

  @override
  String get galleryKindRoutine => 'Rutina';

  @override
  String get galleryKindRoutines => 'Rutinas';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugins';

  @override
  String get galleryKindSet => 'Kit de inicio';

  @override
  String get galleryKindSets => 'Kits de inicio';

  @override
  String get galleryTabBrowse => 'Explorar';

  @override
  String get galleryTabInstalled => 'Instalados';

  @override
  String get gallerySearchEverything => 'Buscar todo';

  @override
  String get galleryNewBadge => 'Nuevo';

  @override
  String get galleryRowPicks => 'Selecciones';

  @override
  String get galleryRowNew => 'Nuevo';

  @override
  String get galleryRowTrending => 'Tendencias de la semana';

  @override
  String get galleryRowMostUsed => 'Más usados';

  @override
  String get galleryRowWorksWith => 'Funciona con lo que tienes';

  @override
  String get galleryRowSets => 'Kits de inicio';

  @override
  String get galleryRowSeasonal => 'De temporada';

  @override
  String get galleryFilterFree => 'Gratis';

  @override
  String get galleryFilterPlan => 'Usa créditos';

  @override
  String get galleryFilterSelfHosted => 'Funciona autoalojado';

  @override
  String get galleryFilterComputer => 'Necesita una computadora';

  @override
  String get galleryNoFilterMatches => 'Nada coincide con estos filtros';

  @override
  String get galleryClearFilters => 'Borrar filtros';

  @override
  String get galleryRequestThis => 'Solicitar esto';

  @override
  String get galleryAskCasama => 'Pedir a Casama que lo cree';

  @override
  String galleryAskPrompt(String query) {
    return 'Créame algo para esto: $query';
  }

  @override
  String get galleryAccessTitle => 'A qué puede acceder';

  @override
  String galleryAccessReads(String things) {
    return 'Lee: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Ejecuta código';

  @override
  String get galleryAccessComputer => 'Usa una computadora';

  @override
  String get galleryAccessNothing => 'No lee ni cambia nada tuyo';

  @override
  String get galleryCreditsNone => 'No usa créditos';

  @override
  String get galleryCreditsLow => 'Usa pocos créditos';

  @override
  String get galleryCreditsMedium => 'Usa algunos créditos';

  @override
  String get galleryCreditsHigh => 'Usa muchos créditos';

  @override
  String get galleryTryIt => 'Probar';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lo usan $shown personas',
      one: 'Lo usa 1 persona',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent% de las ejecuciones terminan bien';
  }

  @override
  String get galleryAbout => 'Acerca de';

  @override
  String get galleryMadeByCasama => 'Creado por Casama';

  @override
  String get galleryMadeByCommunity => 'Creado por la comunidad';

  @override
  String get galleryMadeReviewed => 'Revisado';

  @override
  String get galleryReviewedHelp => 'Sus pruebas pasaron en esta versión';

  @override
  String galleryMoreFrom(String name) {
    return 'Más de $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Versión $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Actualizado el $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Basado en $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'Qué cambió en $name';
  }

  @override
  String get galleryBreaking => 'Funciona diferente';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos en la galería',
      one: '1 elemento en la galería',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty =>
      'Todavía no hay nada en la galería de esta persona autora.';

  @override
  String get galleryInstalledWorkspace => 'En este espacio de trabajo';

  @override
  String get galleryInstalledDevice => 'Estilos en este dispositivo';

  @override
  String get galleryInstalledEmptyTitle => 'Todavía no se agregó nada';

  @override
  String get galleryInstalledEmpty =>
      'Las habilidades, apps, rutinas y estilos que agregues desde la galería aparecen aquí, con actualizaciones.';

  @override
  String get galleryInstalledError =>
      'No se pudo cargar lo que está instalado.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actualizaciones',
      one: '1 actualización',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Actualizar';

  @override
  String galleryUpdated(String name) {
    return 'Se actualizó $name';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Versión $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return '¿Actualizar $name?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'La nueva versión puede hacer más cosas que la que tienes:';

  @override
  String get galleryUpdateBreakingHelp =>
      'La nueva versión funciona diferente, así que revísala después de actualizar.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Ahora lee: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Ahora puede: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Ahora ejecuta código';

  @override
  String get galleryUpdateNowComputer => 'Ahora usa una computadora';

  @override
  String get galleryRemove => 'Quitar';

  @override
  String galleryRemoveTitle(String name) {
    return '¿Quitar $name?';
  }

  @override
  String get galleryRemoveHelp =>
      'Se quita de este espacio de trabajo. Puedes agregarlo de nuevo desde la galería.';

  @override
  String galleryRemoved(String name) {
    return 'Se quitó $name';
  }

  @override
  String get galleryRetired => 'Ya no está en la galería';

  @override
  String get galleryRetiredReplaced =>
      'Ya no está en la galería; hay un reemplazo';

  @override
  String get gallerySeeReplacement => 'Ver reemplazo';

  @override
  String get galleryForgetLook => 'Quitar de esta lista';

  @override
  String galleryWizardTitle(String name) {
    return 'Agregar $name';
  }

  @override
  String get galleryWizardAdd => 'Agregar';

  @override
  String get galleryWizardRequired => 'Completa esto';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Incluye $count elementos',
      one: 'Incluye 1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Qué necesita';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count habilidades, agregadas para ti',
      one: '1 habilidad, agregada para ti',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Apps para conectar: $apps';
  }

  @override
  String get galleryWizardBot => 'A qué bot agregarlo';

  @override
  String get galleryWizardPickBot => 'Elige un bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Adónde van las rutinas del kit. Sin un bot, quedan fuera.';

  @override
  String get galleryWizardSetNotAdded => 'No agregado';

  @override
  String get galleryWizardNeedsTitle => 'Conecta tus apps';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name funciona una vez que estén conectadas.';
  }

  @override
  String get galleryWizardSkillAdded => 'Agregado';

  @override
  String get galleryWizardConnected => 'Conectado';

  @override
  String get galleryWizardConnect => 'Conectar';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Conecta $name en Ajustes → Apps.';
  }

  @override
  String get galleryWizardContinue => 'Continuar';

  @override
  String get galleryWizardSkip => 'Más tarde';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name está listo';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Lo encontrarás con el resto de tus cosas.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Para funcionar por completo, necesita estas apps conectadas: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Esperando aprobación';

  @override
  String get galleryWizardPendingHelp =>
      'Tu espacio de trabajo pregunta primero a un administrador. Se agrega cuando lo apruebe.';

  @override
  String get galleryRequestsTitle => 'Solicitudes';

  @override
  String get galleryRequestsHelp =>
      'Ideas para la galería. Vota por las que quieres; quienes crean eligen de las más votadas.';

  @override
  String get galleryRequestsLinkHelp =>
      'Pide algo que todavía no esté aquí o vota';

  @override
  String get galleryRequestsTop => 'Más votadas';

  @override
  String get galleryRequestsNew => 'Nuevas';

  @override
  String get galleryRequestsEmpty =>
      'Todavía no hay solicitudes. Sé la primera persona.';

  @override
  String get galleryRequestsError => 'No se pudieron cargar las solicitudes.';

  @override
  String get galleryRequestNew => 'Nueva solicitud';

  @override
  String get galleryRequestNewHelp =>
      'Di qué te gustaría que alguien creara. Las solicitudes similares se combinan.';

  @override
  String get galleryRequestKind => 'Tipo';

  @override
  String get galleryRequestTitleLabel => '¿Qué debería hacer?';

  @override
  String get galleryRequestTitleLength => 'Usa entre 4 y 80 caracteres.';

  @override
  String get galleryRequestDetails => 'Detalles (opcional)';

  @override
  String get galleryRequestSend => 'Enviar solicitud';

  @override
  String get galleryRequestSent => 'Solicitud enviada';

  @override
  String galleryRequestSimilar(String title) {
    return 'Ya se había pedido “$title”, así que tu voto se sumó a esa idea';
  }

  @override
  String get galleryRequestMine => 'Tuyas';

  @override
  String get galleryRequestVote => 'Votar';

  @override
  String get galleryRequestOpen => 'Abierta';

  @override
  String get galleryRequestPlanned => 'Planeada';

  @override
  String get galleryRequestDone => 'Listo';

  @override
  String get galleryRequestDeclined => 'Rechazada';

  @override
  String get gallerySubmitStart => 'Enviar a la galería';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Comparte un estilo, habilidad, rutina o bot que hayas creado';

  @override
  String get gallerySubmitPick => '¿Qué quieres compartir?';

  @override
  String get gallerySubmitPickHelp =>
      'Elige algo que hayas creado. Se revisa antes de aparecer en la galería.';

  @override
  String get galleryLooksMine => 'Tus estilos';

  @override
  String get gallerySubmitCurrentScheme => 'Combinación de colores en uso';

  @override
  String get gallerySubmitCurrentWallpaper => 'Fondo de pantalla en uso';

  @override
  String get gallerySubmitMyWallpaper => 'Mi fondo de pantalla';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Enviar una app',
      'bot': 'Enviar un bot de inicio',
      'routine': 'Enviar una rutina',
      'plugin': 'Enviar un plugin',
      'set': 'Enviar un kit de inicio',
      'theme': 'Enviar un tema',
      'scheme': 'Enviar un esquema de color',
      'wallpaper': 'Enviar un fondo de pantalla',
      'other': 'Enviar una habilidad',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Tu nombre visible aparece como autor. Tu correo electrónico nunca se comparte.';

  @override
  String get gallerySubmitName => 'Nombre';

  @override
  String get gallerySubmitNameLength => 'Usa entre 1 y 60 caracteres.';

  @override
  String get gallerySubmitTags => 'Etiquetas';

  @override
  String get gallerySubmitTagsHelp => 'Hasta seis, separadas por comas';

  @override
  String get gallerySubmitLicense => 'Licencia';

  @override
  String gallerySubmitRemix(String name) {
    return 'Da crédito al original: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed =>
      'Da crédito al elemento original de la galería';

  @override
  String get gallerySubmitSend => 'Enviar';

  @override
  String get gallerySubmitted => 'Enviado para revisión';

  @override
  String get gallerySubmissionsTitle => 'Mis envíos';

  @override
  String get gallerySubmissionsHelp =>
      'Lo que enviaste a la galería y en qué estado está.';

  @override
  String get gallerySubmissionsSent => 'Enviado';

  @override
  String get gallerySubmissionsEmpty => 'Todavía no enviaste nada.';

  @override
  String get gallerySubmissionsError => 'No se pudieron cargar tus envíos.';

  @override
  String get gallerySubmissionOpen => 'En revisión';

  @override
  String get gallerySubmissionMerged => 'En la galería';

  @override
  String get gallerySubmissionClosed => 'No aceptado';

  @override
  String get gallerySubmissionFailed => 'No se pudo enviar';

  @override
  String get galleryMyItems => 'Tus elementos en la galería';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reportes abiertos',
      one: '1 reporte abierto',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Un bot';

  @override
  String get islandNeedsOk => 'Necesita tu confirmación';

  @override
  String get islandTakeOver => 'Quiere que tomes el control';

  @override
  String get islandWriting => 'Escribiendo una respuesta';

  @override
  String get islandWorking => 'Trabajando';

  @override
  String get islandFinished => 'Terminó';

  @override
  String get islandStoppedProblem => 'Se detuvo con un problema';

  @override
  String get islandOnThisMac => 'En esta Mac';

  @override
  String get islandStale => 'Abre Casama para ver lo más reciente';

  @override
  String get islandOpen => 'Abrir';

  @override
  String get islandStop => 'Detener';

  @override
  String get islandAllow => 'Permitir';

  @override
  String get islandDeny => 'Denegar';

  @override
  String get islandReview => 'Revisar';

  @override
  String get islandNothing => 'Ningún bot está trabajando ahora';

  @override
  String get islandQuickAsk => 'Pregunta rápida…';

  @override
  String get islandOpenCasama => 'Abrir Casama';

  @override
  String get islandSettings => 'Ajustes…';

  @override
  String get islandQuit => 'Salir de Casama';

  @override
  String get islandAskHint => 'Pregunta a un bot…';

  @override
  String get islandNeedsYou => 'Te necesita';

  @override
  String get islandDropHere => 'Suelta para preguntar a un bot';

  @override
  String get siriSignedOut => 'Primero inicia sesión en Casama.';

  @override
  String get siriOpenToFinish => 'Abre Casama para terminar.';

  @override
  String get siriTooMany =>
      'Son muchas preguntas en un minuto. Abre Casama para seguir.';

  @override
  String get siriNoCredits =>
      'Te quedaste sin créditos. Abre Casama para agregar más.';

  @override
  String get siriOffline =>
      'Casama no puede conectarse a internet en este momento.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot necesita tu confirmación primero. Abre Casama para revisarlo.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot tuvo un problema. Abre Casama para ver qué pasó.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot respondió. Abre Casama para leerlo.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot sigue trabajando en eso. Recibirás una notificación cuando termine.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot respondió.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return 'Inicié $routine.';
  }

  @override
  String get siriNothingNeedsYou => 'No hay nada que te necesite ahora.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hay $count cosas que te necesitan.',
      one: 'Hay 1 cosa que te necesita.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Esperándote: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'No hay computadoras disponibles para esta cuenta.';

  @override
  String get siriNoComputers =>
      'No tienes computadoras en este espacio de trabajo.';

  @override
  String siriStartingComputer(String computer) {
    return 'Iniciando $computer.';
  }

  @override
  String get siriComputerFailed => 'No se pudo iniciar la computadora ahora.';

  @override
  String get siriWhichBotToStop => '¿Qué bot debo detener?';

  @override
  String get siriBotNotRunning =>
      'Ese bot no se está ejecutando en este momento.';

  @override
  String get siriStopped => 'Detenido.';

  @override
  String get siriStopFailed => 'No se pudo detener el bot en este momento.';

  @override
  String get focusFilterShowingAll => 'Filtro de Enfoque · Mostrando todo';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Filtro de Enfoque · $count visibles',
      one: 'Filtro de Enfoque · 1 visible',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama es para personas de 13 años en adelante';

  @override
  String get under13Body =>
      'Esta cuenta no puede usar Casama según su rango de edad declarado. Puedes cerrar sesión o exportar tus datos desde otra cuenta.';

  @override
  String get siriSpotlightSetting => 'Mostrar en Spotlight y Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Los nombres de bots, nombres de rutinas y títulos de chats aparecen en Spotlight y Siri en este dispositivo. Nunca lo que se dice en un chat. Se desactiva si el bloqueo de la app está activado.';

  @override
  String get geminiSetting => 'Permitir que Gemini use Casama';

  @override
  String get geminiSettingHelp =>
      'Cuando le pides a Gemini que use Casama, puede preguntar a tus bots, ver qué requiere tu atención y ejecutar tus rutinas en este teléfono. Nunca aprueba nada: las solicitudes se abren aquí. Las respuestas quedan ocultas en un espacio de trabajo privado, con “Ocultar texto de la respuesta” o con el bloqueo de la app activado.';

  @override
  String get geminiOff =>
      'Gemini está desactivado para Casama en este teléfono. Actívalo en Casama: Ajustes, Privacidad.';

  @override
  String get islandBotWorking => 'Un bot está trabajando';

  @override
  String get islandOnThisComputer => 'en esta computadora';

  @override
  String get islandOnACall => 'En una llamada';

  @override
  String get islandStartElsewhere => 'Bots que inicias en otro lugar';

  @override
  String get islandStartElsewhereHelp =>
      'Muestra lo que inicias en otro dispositivo, como tu Mac, también en la pantalla bloqueada de este teléfono.';

  @override
  String get islandBotsAtWork => 'Bots trabajando';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos',
      one: '1 paso',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Mostrar bots en el notch';

  @override
  String get showBotsInNotchHelp =>
      'Lo que hacen tus bots, alrededor de la cámara. El ícono de la barra de menús lo muestra de todos modos.';

  @override
  String get notchOnHover => 'Abrir el notch al pasar el cursor';

  @override
  String get notchOnHoverHelp =>
      'Desactivado: haz clic en el notch para abrirlo.';

  @override
  String get sitePublishToWeb => 'Publicar en la web';

  @override
  String get sitePublishToWebHelp => 'Dale su propia dirección web.';

  @override
  String get siteAddressName => 'Nombre de la dirección';

  @override
  String get siteAddressRules =>
      'De 3 a 40 letras minúsculas, números y guiones, empezando y terminando con una letra o número.';

  @override
  String get siteAddressChecking => 'Comprobando…';

  @override
  String get siteAddressAvailable => 'Disponible';

  @override
  String get siteAddressTaken => 'Este nombre no está disponible.';

  @override
  String get siteAnyoneCanOpen =>
      'Cualquier persona con la dirección podrá abrirlo.';

  @override
  String get sitePublish => 'Publicar';

  @override
  String get siteOnTheWeb => 'En la web';

  @override
  String get siteSearchEngines => 'Permitir que lo encuentren los buscadores';

  @override
  String get siteSearchEnginesHelp =>
      'Lo incluye en Google y otros buscadores.';

  @override
  String get siteSearchEnginesPaid => 'Requiere un plan de pago.';

  @override
  String get siteUseOwnDomain => 'Usar tu propio dominio';

  @override
  String get siteUnpublish => 'Dejar de publicar';

  @override
  String get siteUnpublishTitle => '¿Dejar de publicar este sitio?';

  @override
  String get siteUnpublishBody =>
      'Deja de abrirse en sus direcciones web. Permanece en tu Biblioteca.';

  @override
  String get siteHostLive => 'Activo';

  @override
  String get siteHostWaitingForDns => 'Esperando el DNS';

  @override
  String get siteHostGettingCertificate => 'Obteniendo su certificado';

  @override
  String get siteHostNeedsAttention => 'Requiere atención';

  @override
  String get siteHostPaused => 'En pausa';

  @override
  String get siteHostSuspended => 'Suspendido';

  @override
  String get settingsDomains => 'Dominios';

  @override
  String get settingsDomainsHelp => 'Abre tus sitios en un dominio propio.';

  @override
  String get settingsSearchHint => 'Buscar en Ajustes';

  @override
  String settingsSearchNone(String query) {
    return 'Ningún ajuste coincide con “$query”.';
  }

  @override
  String get domainsEmpty =>
      'Conecta un dominio propio, como panaderia.com, y tu sitio se abrirá ahí.';

  @override
  String get domainsConnectOwn => 'Conectar un dominio propio';

  @override
  String get domainStateLive => 'Activo';

  @override
  String get domainStateWaitingDns => 'Esperando el DNS';

  @override
  String get domainStateWaitingCert => 'Obteniendo su certificado';

  @override
  String get domainStatePaused => 'En pausa';

  @override
  String get domainStateNeedsAttention => 'Requiere atención';

  @override
  String get domainNoSite => 'Sin sitio todavía';

  @override
  String get domainConnectField => 'Tu dominio';

  @override
  String get domainConnectHelp =>
      'Escríbelo como panaderia.com, www.panaderia.com o tienda.panaderia.com.';

  @override
  String get domainConnectSite => 'Sitio para mostrar';

  @override
  String get domainSiteNone => 'Ninguno';

  @override
  String get domainSiteNoneHelp =>
      'El dominio no muestra nada hasta que elijas un sitio.';

  @override
  String get domainConnect => 'Conectar';

  @override
  String get domainClaimTitle => 'Demuestra que es tuyo';

  @override
  String get domainClaimBody =>
      'Otro espacio de trabajo conectó este dominio. Agrega este registro para demostrar que es tuyo y luego toca Conectar de nuevo.';

  @override
  String get domainRecordType => 'Tipo';

  @override
  String get domainRecordName => 'Nombre';

  @override
  String get domainRecordValue => 'Valor';

  @override
  String get domainSite => 'Sitio';

  @override
  String get domainPickSite => 'Elegir un sitio';

  @override
  String get domainHosts => 'Direcciones';

  @override
  String get domainPrimary => 'Principal';

  @override
  String get domainPrimaryHelp =>
      'Las visitas llegan aquí; las demás direcciones redirigen a esta.';

  @override
  String get domainMakePrimary => 'Hacer principal';

  @override
  String get domainRecordsTitle => 'Registros para agregar';

  @override
  String get domainRecordsAtCloudflare =>
      'Agrega esto en Cloudflare. Configura los registros como solo DNS.';

  @override
  String domainRecordsAt(String provider) {
    return 'Agrega esto en tus ajustes de DNS en $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Agrega esto donde administras el DNS de tu dominio, normalmente en la empresa donde lo compraste.';

  @override
  String get domainRecordsNone => 'Nada que agregar. Todo está listo.';

  @override
  String get domainRecordOptional => 'Opcional';

  @override
  String domainRecordForward(String from, String to) {
    return 'Activa la redirección de $from a $to en la empresa donde compraste el dominio.';
  }

  @override
  String get domainRecordFound => 'Encontrado';

  @override
  String get domainRecordNotFound => 'Todavía no se encuentra';

  @override
  String get domainCheckAgain => 'Comprobar de nuevo';

  @override
  String get domainCheckTooSoon =>
      'Acabamos de comprobarlo. Inténtalo de nuevo en unos segundos.';

  @override
  String get domainChecksItself =>
      'También lo comprobamos por nuestra cuenta, así que puedes salir de esta pantalla.';

  @override
  String get domainHistory => 'Historial';

  @override
  String get domainEventConnected => 'Conectado';

  @override
  String get domainEventProved => 'Registros encontrados';

  @override
  String get domainEventLive => 'Activo';

  @override
  String get domainEventNeedsDns => 'Aún esperando el DNS';

  @override
  String get domainEventFailed => 'No se pudo terminar la configuración';

  @override
  String get domainEventDisconnected =>
      'Se quitaron los registros, por lo que se desconectó';

  @override
  String get domainEventPaused => 'En pausa: tu plan no lo cubre';

  @override
  String get domainEventResumed => 'De nuevo activo';

  @override
  String get domainEventRemoved => 'Desconectado';

  @override
  String get domainEventClaim => 'Se pidió demostrar que es tuyo';

  @override
  String get domainEventClaimAttempt =>
      'Otro espacio de trabajo intentó conectarlo';

  @override
  String get domainEventOverLimit => 'Supera el límite de tu plan';

  @override
  String get domainEventSuspended => 'Suspendido';

  @override
  String get domainEventOther => 'Actualizado';

  @override
  String domainDisconnectTitle(String name) {
    return '¿Desconectar $name?';
  }

  @override
  String get domainDisconnectBody =>
      'Tu sitio deja de abrirse en este dominio. Después puedes quitar sus registros en tu proveedor de DNS.';

  @override
  String get domainsFind => 'Buscar un dominio';

  @override
  String get domainsEmptyBuy =>
      'Compra un dominio para tu sitio o conecta uno que ya tengas.';

  @override
  String get domainFindField => 'Nombre o algunas palabras';

  @override
  String get domainFindHint => 'taller';

  @override
  String get domainFindHelp => 'Los precios son por año y antes de impuestos.';

  @override
  String get domainFindNone =>
      'No se encontraron nombres. Prueba con otras palabras.';

  @override
  String get domainFindNotOffered =>
      'La compra de dominios no está disponible en esta app. Igualmente puedes conectar un dominio propio.';

  @override
  String domainPricePerYear(String price) {
    return '$price al año más impuestos';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Se renueva a $price';
  }

  @override
  String get domainReasonTaken => 'Ocupado';

  @override
  String get domainReasonPremium => 'Nombre premium, no se vende aquí';

  @override
  String get domainReasonNotSold => 'No se vende aquí';

  @override
  String get domainBuy => 'Comprar';

  @override
  String domainBuyTitle(String name) {
    return 'Comprar $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price el primer año, luego $renew al año, más impuestos.';
  }

  @override
  String get domainBuyFinal =>
      'Las ventas son definitivas una vez registrado el dominio. Si no se puede registrar, recibes un reembolso completo.';

  @override
  String get domainBuyTerms => 'Acepto los términos del dominio';

  @override
  String get domainBuyReadTerms => 'Leer los términos';

  @override
  String get domainRenewAuto => 'Renovar automáticamente';

  @override
  String get domainRenewAutoHelp =>
      'Se cobra a tu método de pago guardado unas dos semanas antes de que venza.';

  @override
  String get domainBuySite => 'Sitio para mostrar';

  @override
  String get domainBuyPayInBrowser =>
      'Termina el pago en tu navegador. Esta pantalla se actualiza automáticamente.';

  @override
  String get domainContactTitle => 'Datos de contacto';

  @override
  String get domainContactHelp =>
      'La persona o empresa a cuyo nombre está registrado el dominio. Los registradores mantienen estos datos privados.';

  @override
  String get domainContactFirstName => 'Nombre';

  @override
  String get domainContactLastName => 'Apellido';

  @override
  String get domainContactOrganization => 'Empresa (opcional)';

  @override
  String get domainContactAddress1 => 'Dirección';

  @override
  String get domainContactAddress2 => 'Dirección línea 2 (opcional)';

  @override
  String get domainContactCity => 'Ciudad';

  @override
  String get domainContactState => 'Estado o región';

  @override
  String get domainContactZip => 'Código postal';

  @override
  String get domainContactCountry => 'Código de país';

  @override
  String get domainContactCountryHint => 'US';

  @override
  String get domainContactPhone => 'Teléfono';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'Correo electrónico';

  @override
  String get domainContactRequired => 'Obligatorio';

  @override
  String get domainContactCountryInvalid =>
      'Usa un código de dos letras, como US';

  @override
  String get domainContactPhoneInvalid =>
      'Usa el formato internacional, como +1 415 555 0100';

  @override
  String get domainContactEmailInvalid =>
      'Ingresa un correo electrónico válido';

  @override
  String get domainContactSave => 'Guardar';

  @override
  String get domainContactSaved => 'Datos de contacto guardados.';

  @override
  String get domainContactChangeNote =>
      'Los cambios se aplican a todos los dominios que compró este espacio de trabajo. Un correo nuevo debe confirmarse otra vez.';

  @override
  String get domainOrderTitle => 'Tu pedido';

  @override
  String get domainOrderWaitingPayment => 'Esperando tu pago en el navegador.';

  @override
  String domainOrderRegistering(String name) {
    return 'Registrando $name…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return 'Configurando $name…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'No pudimos registrar $name. Te estamos haciendo el reembolso…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'No pudimos registrar $name, así que te hicimos un reembolso completo.';
  }

  @override
  String get domainOrderAbandoned =>
      'Este pago no se completó, así que no se realizó ningún cargo.';

  @override
  String get domainOrderNeedsAttention =>
      'Algo salió mal con este pedido. Ya nos avisaron y lo resolveremos.';

  @override
  String domainOrderDone(String name) {
    return '$name ya es tuyo.';
  }

  @override
  String get domainOrderLeave =>
      'Puedes salir de esta pantalla. Te avisaremos cuando esté listo.';

  @override
  String get domainOrderBack => 'Volver a Dominios';

  @override
  String domainRenewsOn(String date) {
    return 'Se renueva el $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Vence el $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price al año más impuestos';
  }

  @override
  String get domainRenewNow => 'Renovar ahora';

  @override
  String get domainRenewPayInBrowser =>
      'Termina el pago en tu navegador. La nueva fecha aparecerá aquí cuando esté pagado.';

  @override
  String get domainRenewCharged =>
      'Renovado. La nueva fecha aparecerá aquí en un minuto.';

  @override
  String get domainRegistration => 'Registro';

  @override
  String domainExpired(String date) {
    return 'Venció el $date. Renuévalo dentro de los 25 días siguientes a esa fecha para conservarlo.';
  }

  @override
  String get domainLapsed =>
      'Este dominio caducó. Escribe a soporte para consultar si se puede restaurar; no está garantizado.';

  @override
  String get domainSuspendedLine =>
      'Este dominio está suspendido. Escribe a soporte para saber por qué.';

  @override
  String get domainVerifyTitle => 'Confirma el correo del titular';

  @override
  String get domainVerifyBody =>
      'El registrador envió un correo a la dirección del titular. Ábrelo y confirma, o el dominio dejará de funcionar.';

  @override
  String get domainVerifySendAgain => 'Enviar de nuevo';

  @override
  String get domainVerifySent =>
      'Enviado. Revisa la bandeja de entrada del titular.';

  @override
  String get domainDnsRecords => 'Registros DNS';

  @override
  String get domainDnsRecordsHelp =>
      'Correo, subdominios y comprobaciones del sitio';

  @override
  String get domainMoveOut => 'Trasladar a otro registrador';

  @override
  String domainMoveOutAfter(String date) {
    return 'Se puede trasladar después del $date';
  }

  @override
  String get domainMoveOutHelp =>
      'Obtén un código de transferencia para otro registrador';

  @override
  String domainMoveOutTitle(String name) {
    return '¿Trasladar $name?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Esto desbloquea el dominio y muestra su código de transferencia una sola vez. Escribe $name para confirmar.';
  }

  @override
  String get domainMoveOutConfirm => 'Obtener código de transferencia';

  @override
  String domainMoveOutLocked(String date) {
    return 'Se puede trasladar después del $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Código de transferencia';

  @override
  String get domainTransferCodeBody =>
      'Entrega este código al nuevo registrador. Se muestra solo esta vez, así que cópialo ahora.';

  @override
  String get domainTransferCode => 'Código';

  @override
  String get domainUnlocked => 'Desbloqueado para traslado';

  @override
  String get domainLockAgain => 'Bloquear de nuevo';

  @override
  String get domainLocked => 'Bloqueado de nuevo.';

  @override
  String get domainReauthTitle => 'Inicia sesión de nuevo';

  @override
  String get domainReauthSendCode => 'Enviarme un código por correo';

  @override
  String domainReauthCodeSent(String email) {
    return 'Enviamos un código a $email.';
  }

  @override
  String get domainReauthCode => 'Código del correo';

  @override
  String get domainReauthSignIn => 'Iniciar sesión';

  @override
  String get domainReauthSignOut =>
      'Cierra sesión y vuelve a iniciarla, luego inténtalo una vez más.';

  @override
  String get dnsRecordsEmpty => 'Todavía no hay registros.';

  @override
  String get dnsRecordAdd => 'Agregar registro';

  @override
  String get dnsRecordEdit => 'Editar registro';

  @override
  String get dnsRecordManaged => 'Usado por tu sitio de Casama';

  @override
  String get dnsRecordType => 'Tipo';

  @override
  String get dnsRecordHost => 'Nombre';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Déjalo vacío para $name, o escribe www, tienda…';
  }

  @override
  String get dnsRecordAnswer => 'Valor';

  @override
  String get dnsRecordTtl => 'TTL (segundos)';

  @override
  String get dnsRecordPriority => 'Prioridad';

  @override
  String get dnsRecordSave => 'Guardar';

  @override
  String get dnsRecordDeleteTitle => '¿Eliminar este registro?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 segundos o más';

  @override
  String get dnsRecordAnswerRequired => 'Obligatorio';

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
      'Dominios comprados en tus espacios de trabajo';

  @override
  String get deleteAccountDomainsBody =>
      'Estos dominios siguen registrados hasta que venzan. No se renovarán y sus sitios quedarán fuera de línea.';

  @override
  String get whatsNew010Sites =>
      'Publica una página en la web con su propia dirección y usa tu propio dominio.';

  @override
  String get inAppAlertOpen => 'Abrir';

  @override
  String get pushPrefsTitle => 'Notificaciones';

  @override
  String get pushPrefsHelp =>
      'Elige qué avisa en tus dispositivos. Todo sigue llegando a tu Buzón.';

  @override
  String get pushAllOn => 'Todo activado';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Respuestas desactivadas',
      'needsYou': '“Te necesita” desactivado',
      'routines': 'Rutinas y resúmenes desactivados',
      'suggestions': 'Sugerencias y avisos desactivados',
      'other': 'Cuenta desactivada',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count tipos desactivados';
  }

  @override
  String get pushReplies => 'Respuestas';

  @override
  String get pushRepliesHelp =>
      'Cuando un bot responde algo que preguntaste, si saliste del chat.';

  @override
  String get pushNeedsYou => 'Te necesita';

  @override
  String get pushNeedsYouHelp =>
      'Aprobaciones, contraseñas y tomas de control que esperan tus bots.';

  @override
  String get pushNeedsYouOffWarning =>
      'Desactivado: tus bots esperarán hasta que abras la app.';

  @override
  String get pushRoutines => 'Rutinas y resúmenes';

  @override
  String get pushRoutinesHelp =>
      'Resultados de rutinas y tu resumen de la mañana.';

  @override
  String get pushSuggestions => 'Sugerencias y avisos';

  @override
  String get pushSuggestionsHelp => 'Cosas que tus bots ofrecen hacer por ti.';

  @override
  String get pushAccount => 'Cuenta';

  @override
  String get pushAccountHelp =>
      'Créditos por agotarse, proyectos y tu servidor.';

  @override
  String get pushHideReplyText => 'Ocultar texto de la respuesta';

  @override
  String get pushHideReplyTextHelp =>
      'Las notificaciones dicen que un bot respondió, sin mostrar sus palabras.';

  @override
  String get reactToMessage => 'Reaccionar';

  @override
  String get moreReactions => 'Más reacciones';

  @override
  String get reactionsTitle => 'Reacciones';

  @override
  String get reactionsAll => 'Todas';

  @override
  String get reactionsYou => 'Tú';

  @override
  String get reactionsTapToRemove => 'Toca para quitar';

  @override
  String get reactionsNone => 'Todavía no hay reacciones.';

  @override
  String get reactionsLoadFailed => 'No se pudo cargar quién reaccionó.';

  @override
  String get searchEmoji => 'Buscar emoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reacciones',
      one: '1 reacción',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reacciones',
      one: '1 reacción',
    );
    return '$emoji, $_temp0, incluida la tuya';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Reaccionar con $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Quitar tu reacción $emoji';
  }

  @override
  String get packsShelfTitle => 'Paquetes';

  @override
  String get packsShelfHelp =>
      'Bots, habilidades y rutinas que trabajan juntos y se agregan de una sola vez.';

  @override
  String get packReviewed => 'Revisado';

  @override
  String get packNotReviewed => 'No revisado por Casama';

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
      other: '$count habilidades',
      one: '1 habilidad',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutinas',
      one: '1 rutina',
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
      other: '$count estilos',
      one: '1 estilo',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count herramientas',
      one: '1 herramienta',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Kit de inicio';

  @override
  String get packAddFromLink => 'Agregar un paquete desde un enlace';

  @override
  String get packAddFromLinkHelp =>
      'Pega un enlace de GitHub a un paquete y mira primero qué agrega.';

  @override
  String get packAddFromFile => 'Agregar desde un archivo';

  @override
  String get packAddFromFileHelp => 'Elige el archivo .zip de un paquete.';

  @override
  String get packLinkLabel => 'Enlace de GitHub';

  @override
  String get packFileUnreadable => 'Ese archivo no es el .zip de un paquete.';

  @override
  String get packFileTooBig =>
      'Ese archivo es demasiado grande para un paquete.';

  @override
  String packSource(String where, String commit) {
    return '$where en $commit';
  }

  @override
  String get packFromFile => 'Desde un archivo';

  @override
  String get packFromShare => 'Compartido contigo';

  @override
  String get packAlreadyHere =>
      'Este espacio de trabajo ya tiene este paquete.';

  @override
  String get packOpenInstalled => 'Ver paquetes instalados';

  @override
  String get packAdd => 'Agregar paquete';

  @override
  String packWizardTitle(String name) {
    return 'Agregar $name';
  }

  @override
  String get packWhatsInside => 'Qué incluye';

  @override
  String get packWhatsInsideHelp => 'Desmarca lo que no quieras.';

  @override
  String get packSectionBots => 'Bots';

  @override
  String get packSectionSkills => 'Habilidades';

  @override
  String get packSectionRoutines => 'Rutinas';

  @override
  String get packSectionApps => 'Apps';

  @override
  String get packSectionLooks => 'Estilos';

  @override
  String get packSectionIncludes => 'De la galería';

  @override
  String get packSectionTools => 'Herramientas';

  @override
  String get packSkillRunsScripts =>
      'Ejecuta scripts en la computadora del bot';

  @override
  String get packSkillForWorkspace => 'Para todo el espacio de trabajo';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se ejecuta unas $count veces a la semana',
      one: 'Se ejecuta aproximadamente una vez a la semana',
      zero: 'Se ejecuta de vez en cuando',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Se comunica con $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Se conecta a $url';
  }

  @override
  String get packIncludeMissing => 'No se encontró en la galería';

  @override
  String get packLookHelp =>
      'Puedes usarlo en este dispositivo después de agregarlo.';

  @override
  String get packNothingTicked => 'Marca al menos una cosa para agregar.';

  @override
  String get packQuestions => 'Unas preguntas';

  @override
  String get packQuestionsHelp =>
      'El paquete completa esto en sus bots y rutinas.';

  @override
  String get packSecretsTitle => 'Claves y ajustes';

  @override
  String get packSecretsHelp =>
      'Las herramientas del paquete necesitan esto para funcionar.';

  @override
  String get packReachTitle => 'A qué puede llegar';

  @override
  String get packReachHelp =>
      'Calculado por Casama a partir de los archivos del paquete.';

  @override
  String get packReachRunsCode => 'Ejecuta código';

  @override
  String get packReachComputer => 'Usa la computadora del bot';

  @override
  String packReachHosts(String hosts) {
    return 'Se comunica con $hosts';
  }

  @override
  String get packReachNoHosts => 'No se comunica con otros sitios';

  @override
  String packReachSecrets(String names) {
    return 'Usa claves: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count ejecuciones programadas a la semana',
      one: 'Cerca de 1 ejecución programada a la semana',
      zero: 'Sin ejecuciones programadas',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama no revisó este paquete. Agrégalo solo si confías en su origen. Sus rutinas empiezan desactivadas.';

  @override
  String get packPickBotTitle => '¿Qué bot lo recibe?';

  @override
  String get packPickBotHelp =>
      'Este paquete no incluye ningún bot. Elige uno para sus rutinas y herramientas.';

  @override
  String packDoneTitle(String name) {
    return 'Se agregó $name';
  }

  @override
  String get packDoneHelp => 'Esto es lo que agregó.';

  @override
  String get packPendingHelp =>
      'Se lo pedimos a un administrador. El paquete se agregará cuando lo apruebe.';

  @override
  String get packStatusInstalled => 'Agregado';

  @override
  String get packStatusPending => 'Esperando a un administrador';

  @override
  String get packStatusSkipped => 'Omitido';

  @override
  String get packStatusFailed => 'No funcionó';

  @override
  String get packStatusDevice => 'En este dispositivo';

  @override
  String get packConnectTitle => 'Conectar sus apps';

  @override
  String get packConnectHelp =>
      'Sus bots funcionan por completo cuando estén conectadas.';

  @override
  String get packLooksTitle => '¿Usar un estilo en este dispositivo?';

  @override
  String get packUseLook => 'Usar';

  @override
  String get packLookInUse => 'En uso';

  @override
  String get packInstalledTitle => 'Ese paquete ya está aquí';

  @override
  String get packsInstalledTitle => 'Paquetes instalados';

  @override
  String get packsInstalledRow =>
      'Paquetes que agregó este espacio de trabajo, con actualizaciones';

  @override
  String get packsInstalledEmpty =>
      'Todavía no hay paquetes. Encuentra uno en la sección de Paquetes o agrega uno desde un enlace.';

  @override
  String get packEditedBadge => 'Editado por ti';

  @override
  String get packRemove => 'Quitar';

  @override
  String get packUpToDate => 'Este paquete está al día.';

  @override
  String get packCantCheck =>
      'Este paquete vino de un archivo o enlace y no puede buscar actualizaciones.';

  @override
  String packUpdateTitle(String name) {
    return 'Actualizar $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'Novedades: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Quitado: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Cambiado: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Sitios nuevos con los que se comunica: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Claves nuevas que necesita: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Horarios nuevos: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Ejecuciones programadas a la semana: $from → $to';
  }

  @override
  String get packDiffNone => 'No cambió nada que vayas a notar.';

  @override
  String get packEditedTitle => 'Cosas que cambiaste';

  @override
  String get packEditedHelp => 'Tu versión se mantiene a menos que la cambies.';

  @override
  String get packTakeTheirs => 'Usar la versión del paquete';

  @override
  String get packReachGrewTitle => 'Tiene más alcance';

  @override
  String get packReachGrewHelp =>
      'La versión nueva tiene más alcance que la que tienes.';

  @override
  String get packReachConfirm => 'Ya revisé lo que puede alcanzar ahora';

  @override
  String packUpdated(String name) {
    return '$name está actualizado.';
  }

  @override
  String packRemoveTitle(String name) {
    return '¿Quitar $name?';
  }

  @override
  String get packRemoveBody =>
      'Se quitan sus herramientas y claves, junto con las habilidades y rutinas que no cambiaste. Las conexiones de apps se mantienen.';

  @override
  String get packRemoveBots =>
      'También eliminar los bots que creó este paquete';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Paquete quitado. Se quedaron $count elementos porque los cambiaste.',
      one: 'Paquete quitado. Se quedó 1 elemento porque lo cambiaste.',
      zero: 'Paquete quitado.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Compartir como paquete';

  @override
  String get sharePackRow => 'Agrupa bots y habilidades para otra persona';

  @override
  String get sharePackHelp =>
      'Nunca se incluyen claves, chats, recuerdos, Sobre ti ni la elección del modelo.';

  @override
  String get sharePackBots => 'Bots';

  @override
  String get sharePackBotsHelp =>
      'Elige hasta 5. Cada uno trae sus instrucciones, habilidades y rutinas.';

  @override
  String get sharePackSkills => 'Habilidades del espacio de trabajo';

  @override
  String get sharePackName => 'Nombre';

  @override
  String get sharePackSummary => 'Una línea sobre esto';

  @override
  String get sharePackLook => 'Incluir el tema de este dispositivo';

  @override
  String get sharePackCheck => 'Revisar y compartir';

  @override
  String get sharePackFindingsTitle => 'Algunas líneas parecen claves';

  @override
  String get sharePackFindingsHelp =>
      'Revísalas antes de compartir. Vuelve para corregirlas o comparte si son seguras.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, línea $line: $what';
  }

  @override
  String get sharePackGoBack => 'Volver';

  @override
  String get sharePackAnyway => 'Compartir de todos modos';

  @override
  String get sharePackLinkTitle => 'Tu enlace del paquete';

  @override
  String sharePackLinkHelp(String date) {
    return 'Cualquier persona que haya iniciado sesión en Casama puede abrirlo hasta el $date.';
  }

  @override
  String get sharePackShare => 'Compartir';

  @override
  String get sharePackSaveFile => 'Guardar como archivo';

  @override
  String get sharePackLinkCopied => 'Enlace copiado.';

  @override
  String get sharePackStop => 'Dejar de compartir';

  @override
  String get sharePackStopped => 'El enlace ya no funciona.';

  @override
  String pluginFromPack(String pack) {
    return 'Del paquete $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Actualízalo o quítalo junto con su paquete en Galería → Paquetes instalados.';

  @override
  String get pluginSettings => 'Ajustes';

  @override
  String get pluginEditSettings => 'Editar ajustes';

  @override
  String get pluginSettingsSaved => 'Ajustes guardados.';

  @override
  String get galleryPolicyKeyHelp =>
      'También puedes escribir un repositorio (repo/owner:name) o un paquete (pack/name).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Agregar $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Paquete: $name';
  }

  @override
  String get reportPackShare => 'Reportar este paquete';

  @override
  String get appLock => 'Bloqueo de la app';

  @override
  String get appLockRow => 'Pedir desbloquear Casama al abrirla';

  @override
  String get appLockHelp =>
      'Casama te pide desbloquearla al abrirla y después de un tiempo fuera. Mientras está activado, tu sesión se guarda en el llavero de este dispositivo.';

  @override
  String get appLockSwitch => 'Bloquear Casama';

  @override
  String get appLockLocked => 'Casama está bloqueado';

  @override
  String get appLockUnlock => 'Desbloquear';

  @override
  String get appLockUnlockWithPasskey => 'Desbloquear con una llave de acceso';

  @override
  String get appLockUnlockReason => 'Desbloquear Casama';

  @override
  String get appLockTurnOnReason => 'Activar el bloqueo de la app';

  @override
  String get appLockConfirmReason => 'Confirma que eres tú';

  @override
  String get appLockConfirmTitle => 'Confirma que eres tú';

  @override
  String get approvalConfirmTitle => '¿Permitir esto?';

  @override
  String get approvalConfirmBody =>
      'Esta es una solicitud de alto riesgo. ¿Permitir que el bot continúe?';

  @override
  String get approvalConfirmAllow => 'Permitir';

  @override
  String appLockUnlockWith(String method) {
    return 'Usa $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID o tu código';

  @override
  String get appLockDeviceAndroid =>
      'tu huella digital, rostro o bloqueo de pantalla';

  @override
  String get appLockDeviceMac => 'Touch ID o la contraseña de tu Mac';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'el bloqueo de pantalla de tu dispositivo';

  @override
  String appLockMethodDevice(String method) {
    return 'Se desbloquea con $method';
  }

  @override
  String get appLockMethodPin => 'Se desbloquea con un PIN de 6 dígitos';

  @override
  String get appLockMethodPasskey => 'Se desbloquea con una llave de acceso';

  @override
  String get appLockPinHint => 'Ingresa tu PIN';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PIN incorrecto. Quedan $count intentos.',
      one: 'PIN incorrecto. Queda 1 intento.',
      zero: 'PIN incorrecto.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Demasiados PIN incorrectos. Cierra sesión y vuelve a iniciarla para abrir Casama.';

  @override
  String get appLockFailed => 'Eso no funcionó. Inténtalo de nuevo.';

  @override
  String get appLockUnavailable =>
      'Este dispositivo no puede desbloquear Casama ahora. Cierra sesión y vuelve a iniciarla para entrar.';

  @override
  String get appLockSignOutConfirm =>
      'Al cerrar sesión se desactiva el bloqueo de la app en este dispositivo. Vuelve a iniciar sesión para abrir Casama.';

  @override
  String get appLockCallRinging =>
      'Está sonando una llamada. Desbloquea para contestar.';

  @override
  String get appLockRequiredTitle => 'Activar el bloqueo de la app';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace requiere el bloqueo de la app en todos los dispositivos donde se abre Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Este navegador no puede usar llaves de acceso con este servidor, así que no puede bloquear Casama. Abre Casama en la app de tu teléfono o computadora.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Activado. Requerido por $workspace';
  }

  @override
  String get appLockTurnOn => 'Activar';

  @override
  String get appLockTurnedOn => 'El bloqueo de la app está activado';

  @override
  String get appLockNoWayHere =>
      'Este navegador no puede usar llaves de acceso con este servidor, así que Casama no se puede bloquear aquí.';

  @override
  String get appLockNotChecked => 'No pudimos confirmar que eres tú.';

  @override
  String get appLockPinSetupTitle => 'Elige un PIN';

  @override
  String get appLockPinAgainTitle => 'Ingresa el PIN de nuevo';

  @override
  String get appLockPinSetupBody =>
      '6 dígitos. Lo ingresarás para abrir Casama.';

  @override
  String get appLockPinNext => 'Continuar';

  @override
  String get appLockPinMismatch =>
      'Los PIN no coincidieron. Elige uno de nuevo.';

  @override
  String get appLockPinNotSaved =>
      'No se pudo guardar el PIN en este dispositivo.';

  @override
  String get appLockPinChanged => 'PIN cambiado';

  @override
  String get appLockChangePin => 'Cambiar PIN';

  @override
  String get appLockAfter => 'Bloquear después de';

  @override
  String get appLockAfterHelp =>
      'Tiempo en segundo plano, minimizada o detrás de otras apps en una computadora.';

  @override
  String get appLockAfterImmediately => 'De inmediato';

  @override
  String get appLockAfterOneMinute => '1 minuto';

  @override
  String get appLockAfterFiveMinutes => '5 minutos';

  @override
  String get appLockAfterFifteenMinutes => '15 minutos';

  @override
  String get appLockAfterOneHour => '1 hora';

  @override
  String get appLockBlockScreenshots => 'Bloquear capturas de pantalla';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Las capturas de pantalla, grabaciones y pantallas compartidas no muestran nada de Casama.';

  @override
  String get appLockLockNow => 'Bloquear ahora';

  @override
  String get appLockPrivacySection => 'Más privacidad';

  @override
  String get appLockAskBeforeRisky => 'Confirmar acciones riesgosas';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Desbloquea de nuevo antes de eliminar tu cuenta, crear claves, cambiar la facturación, exportar datos, aprobar solicitudes de riesgo alto y tomar el control de una computadora.';

  @override
  String get requireAppLock => 'Exigir el bloqueo de la app';

  @override
  String get requireAppLockHelp =>
      'Los miembros deben bloquear Casama en cada dispositivo antes de abrirlo. En la web requiere una llave de acceso.';

  @override
  String get requireAppLockOwnFirst =>
      'Primero activa el bloqueo de la app en este dispositivo.';

  @override
  String get permLocation => 'Ubicación';

  @override
  String get permLocationAlways => 'Ubicación en segundo plano';

  @override
  String get permCamera => 'Cámara';

  @override
  String get permMicrophone => 'Micrófono';

  @override
  String get permSpeech => 'Reconocimiento de voz';

  @override
  String get permPhotos => 'Fotos';

  @override
  String get permContacts => 'Contactos';

  @override
  String get permCalendar => 'Calendarios';

  @override
  String get permHealth => 'Salud';

  @override
  String get permNotifications => 'Notificaciones';

  @override
  String get permNotificationAccess => 'Acceso a notificaciones';

  @override
  String get permAccessibility => 'Accesibilidad';

  @override
  String get permScreenRecording => 'Grabación de pantalla';

  @override
  String get permAutomation => 'Automatización';

  @override
  String get permFullDisk => 'Acceso total al disco';

  @override
  String get permSharedFolders => 'Carpetas compartidas';

  @override
  String get permLocalTools => 'Herramientas locales';

  @override
  String get cardPermissions => 'Permisos';

  @override
  String permissionsTitle(String device) {
    return 'Activa estos permisos en $device';
  }

  @override
  String get permStateOn => 'Activado';

  @override
  String get permStateOff => 'Desactivado';

  @override
  String get permStateNotAsked => 'Aún sin solicitar';

  @override
  String get permStateLimited => 'Limitado';

  @override
  String get permStateUnknown => 'Desconocido';

  @override
  String get permStateUnavailable => 'No disponible en este dispositivo';

  @override
  String get permStateUpdate => 'Actualiza Casama para activarlo aquí';

  @override
  String get permTurnOn => 'Activar';

  @override
  String get permOpenSettings => 'Abrir ajustes';

  @override
  String get permOpenHealth => 'Abrir Salud';

  @override
  String get permHealthIosHow =>
      'En Salud, toca tu foto, luego Apps, luego Casama y activa lo que tus bots pueden leer.';

  @override
  String get permChoose => 'Elegir';

  @override
  String get permRestart => 'Reiniciar Casama';

  @override
  String get permRestartToFinish => 'Reinicia Casama para terminar';

  @override
  String permOpenedOn(String device) {
    return 'Abierto en $device';
  }

  @override
  String permSentTo(String device) {
    return 'Enviado a $device: toca la notificación allá';
  }

  @override
  String permOffline(String device) {
    return '$device está sin conexión';
  }

  @override
  String permRestarting(String device) {
    return 'Reiniciando Casama en $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Solo la persona propietaria de $device puede activar esto';
  }

  @override
  String get permNotNowLine => 'Ahora no';

  @override
  String get permContinue => 'Continuar';

  @override
  String get permContinueMessage => 'Ya están activados, adelante.';

  @override
  String get permContinuedLine => 'Activado';

  @override
  String get permissionsScreenTitle => 'Permisos';

  @override
  String get permissionsScreenHelp =>
      'Lo que los bots pueden usar en este dispositivo. No se pide nada hasta que toques.';

  @override
  String get permissionsRowHelp =>
      'Ubicación, pantalla, micrófono y más en este dispositivo';

  @override
  String permOtherDevice(String device) {
    return 'Esto era para $device. Abre Casama allá para activarlo.';
  }

  @override
  String get permAnotherDevice => 'otro dispositivo';

  @override
  String get permissionsNone => 'No hay nada que activar en este dispositivo.';

  @override
  String get widgetNeedsYou => 'Te necesita';

  @override
  String get widgetAllClear => 'Todo al día';

  @override
  String get widgetAllow => 'Permitir';

  @override
  String get widgetDeny => 'Denegar';

  @override
  String get widgetReview => 'Revisar';

  @override
  String get widgetOpen => 'Abrir';

  @override
  String get widgetDoIt => 'Hazlo';

  @override
  String get widgetRunNow => 'Ejecutar';

  @override
  String get widgetStarted => 'Iniciado';

  @override
  String get widgetStop => 'Detener';

  @override
  String get widgetAsk => 'Preguntar';

  @override
  String widgetAskBot(String bot) {
    return 'Preguntar a $bot';
  }

  @override
  String get widgetTalk => 'Hablar';

  @override
  String get widgetTry => 'Probar';

  @override
  String get widgetUpNext => 'A continuación';

  @override
  String get widgetNoRoutines => 'Todavía no hay rutinas';

  @override
  String get widgetWorking => 'Trabajando';

  @override
  String get widgetWaiting => 'Esperándote';

  @override
  String get widgetIdle => 'Inactivo';

  @override
  String widgetRepliedAt(String time) {
    return 'Respondió a las $time';
  }

  @override
  String get widgetBrief => 'Resumen';

  @override
  String widgetBriefAt(String time) {
    return 'Resumen a las $time';
  }

  @override
  String get widgetNoBrief => 'Todavía no hay resumen';

  @override
  String get widgetToday => 'Hoy';

  @override
  String get widgetCredits => 'Créditos';

  @override
  String widgetCreditsLeft(String amount) {
    return 'Quedan $amount';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount hoy';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n% usado';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Se restablece a las $time';
  }

  @override
  String get widgetFinished => 'Terminó';

  @override
  String get widgetLibrary => 'Biblioteca';

  @override
  String get widgetNoCreations => 'Todavía no hay nada creado';

  @override
  String get widgetTasks => 'Tareas';

  @override
  String get widgetTodo => 'Por hacer';

  @override
  String get widgetInProgress => 'En curso';

  @override
  String get widgetInReview => 'En revisión';

  @override
  String get widgetBlocked => 'Bloqueadas';

  @override
  String get widgetSignIn => 'Abre Casama para iniciar sesión';

  @override
  String get widgetNoBots => 'Conoce a tu primer bot';

  @override
  String widgetAsOf(String time) {
    return 'a las $time';
  }

  @override
  String get widgetUpdateServer =>
      'Actualiza tu servidor de Casama para usar este widget';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot necesita tu confirmación';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot sugiere';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot necesita que tomes el control';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Próximo resumen: $time';
  }

  @override
  String get widgetNothingNext => 'Nada programado';

  @override
  String get widgetsTitle => 'Widgets';

  @override
  String get widgetsRow =>
      'Tus bots en la pantalla de inicio y la pantalla bloqueada';

  @override
  String get widgetsIntro =>
      'Los widgets muestran qué hacen tus bots y qué te espera, sin abrir Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Rutinas';

  @override
  String get widgetDescNeedsYou => 'Mira qué bots te están esperando';

  @override
  String get widgetDescBot => 'Mira qué está haciendo un bot';

  @override
  String get widgetDescAsk => 'Pregunta o habla con un bot con un toque';

  @override
  String get widgetDescRoutines =>
      'Mira qué se ejecuta después y ejecútalo ahora';

  @override
  String get widgetDescToday => 'Mira todo tu día en un widget grande';

  @override
  String get widgetDescBrief => 'Lee tu resumen de la mañana';

  @override
  String get widgetDescLibrary => 'Mira lo que tus bots crearon últimamente';

  @override
  String get widgetDescTasks => 'Mira cómo va el tablero de tareas';

  @override
  String get widgetDescCredits => 'Vigila tus créditos';

  @override
  String get widgetsAddToHome => 'Agregar a la pantalla de inicio';

  @override
  String get widgetsPinUnsupported =>
      'Tu lanzador no puede agregar widgets desde aquí. Mantén presionado un espacio vacío en tu pantalla de inicio, toca Widgets y elige Casama.';

  @override
  String get widgetsHowToAdd => 'Cómo agregar';

  @override
  String get widgetsHowToIos =>
      'Mantén presionado un espacio vacío en la pantalla de inicio, toca Editar, luego Agregar widget y elige Casama.';

  @override
  String get widgetsHowToMac =>
      'Haz clic en la fecha y hora en la barra de menús, luego en Editar widgets y elige Casama. O haz clic secundario en el escritorio y elige Editar widgets.';

  @override
  String get widgetsLockScreen => 'Pantalla bloqueada y controles';

  @override
  String get widgetsLockScreenHelp =>
      'Mantén presionada la pantalla bloqueada, toca Personalizar, luego Pantalla bloqueada y toca el espacio debajo del reloj para agregar Te necesita, A continuación, Bot o Créditos. Las solicitudes quedan ocultas hasta que desbloquees.';

  @override
  String get widgetsControlsHelp =>
      'Abre el Centro de control, mantén presionado, toca Agregar un control y elige Preguntar a Casama, Hablar con un bot o Ejecutar una rutina. También caben en las esquinas de la pantalla bloqueada y en el botón Acción.';

  @override
  String get widgetsShowDetails => 'Mostrar detalles en widgets';

  @override
  String get widgetsShowDetailsHelp =>
      'Con el bloqueo de la app activado, los widgets muestran solo números y nombres de bots, y sus botones abren Casama. Activa esto para mostrar también solicitudes, mensajes y nombres de rutinas.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Solo importa cuando el bloqueo de la app está activado. Sin él, los widgets muestran los detalles.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace exige el bloqueo de la app, así que los widgets mantienen los detalles ocultos.';
  }

  @override
  String get widgetsPinBot => 'Fijar un bot a tu pantalla de inicio';

  @override
  String get widgetsPinBotHelp =>
      'Pone al bot en tu pantalla de inicio como su propio ícono. Tócalo para chatear.';

  @override
  String get widgetsPin => 'Fijar';

  @override
  String get widgetNudgeNeedsYou =>
      'Responde solicitudes desde tu pantalla de inicio con el widget Te necesita.';

  @override
  String get widgetNudgeRoutines =>
      'Ejecuta rutinas desde tu pantalla de inicio con el widget Rutinas.';

  @override
  String get widgetNameCanvas => 'Lienzo';

  @override
  String get widgetDescCanvas =>
      'Muestra lo que ponen ahí tus bots, como un versículo diario o una cuenta regresiva';

  @override
  String get canvasEmpty => 'Pídele a un bot que ponga algo aquí';

  @override
  String get canvasTry =>
      'Prueba: pon un versículo diario en mi pantalla bloqueada';

  @override
  String get canvasAutomatic => 'Automático';

  @override
  String canvasIn(String time) {
    return 'en $time';
  }

  @override
  String canvasSince(String time) {
    return 'hace $time';
  }

  @override
  String get canvasNow => 'Ahora';

  @override
  String canvasLeft(String n) {
    return 'Faltan $n';
  }

  @override
  String get canvasLeftUnit => 'restantes';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'días',
      one: 'día',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widgets';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot quiere mostrar esto en tus widgets';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Una vez que digas que sí, $bot podrá cambiarlo sin preguntar. Puedes detenerlo en cualquier momento en Ajustes, Widgets.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot puso esto en tus widgets';
  }

  @override
  String get canvasShow => 'Mostrar en mis widgets';

  @override
  String get canvasShowing => 'Mostrándose en tus widgets';

  @override
  String canvasNotShown(String bot) {
    return 'No se muestra. $bot puede volver a preguntar otro día.';
  }

  @override
  String get canvasGone => 'Ya no está en tus widgets';

  @override
  String get canvasNotPlaced => 'Agrega el widget Lienzo para verlo.';

  @override
  String get canvasHowToIos =>
      'Mantén presionada la pantalla de inicio o la pantalla bloqueada, toca Editar, luego Agregar widget y elige Casama, y después Lienzo.';

  @override
  String get canvasHowToMac =>
      'Haz clic secundario en el escritorio, elige Editar widgets y selecciona Casama, luego Lienzo.';

  @override
  String get canvasHowToElsewhere =>
      'Agrega el widget Lienzo de Casama en tu teléfono o Mac para verlo ahí.';

  @override
  String get canvasAdded => 'Se agregó el widget Lienzo';

  @override
  String get canvasLockScreen => 'En la pantalla bloqueada';

  @override
  String get widgetsFromBots => 'De tus bots';

  @override
  String get widgetsFromBotsEmpty =>
      'Todavía nada. Pídele a un bot algo como “Pon un versículo diario en mi pantalla bloqueada”.';

  @override
  String canvasSetAt(String time) {
    return 'Configurado $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Mostrándose en $devices';
  }

  @override
  String get canvasNoWidget => 'Aún no se colocó ningún widget Lienzo';

  @override
  String get canvasPausedLine => 'En pausa';

  @override
  String get canvasWaitingLine => 'Esperando tu confirmación';

  @override
  String get canvasHideLocked => 'Ocultar en un teléfono bloqueado';

  @override
  String get canvasPause => 'Pausar';

  @override
  String get canvasResume => 'Reanudar';

  @override
  String get canvasClear => 'Quitar';

  @override
  String canvasClearTitle(String name) {
    return '¿Quitar $name?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Se quita de tus widgets. $bot puede volver a poner algo ahí.';
  }

  @override
  String get canvasAllowedBots => 'Bots en tus widgets';

  @override
  String get canvasMayShow => 'Puede mostrar cosas en tus widgets';

  @override
  String canvasStopTitle(String bot) {
    return '¿Detener a $bot?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'Se quita lo que $bot muestra en tus widgets y tendrá que volver a preguntar.';
  }

  @override
  String get canvasStop => 'Detener';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Teléfono Android';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Muéstrame';

  @override
  String get widgetLowRisk => 'Riesgo bajo';

  @override
  String get widgetThisMonth => 'Este mes';

  @override
  String get watchNow => 'Ahora';

  @override
  String get watchAsk => 'Preguntar';

  @override
  String watchAskBot(String bot) {
    return 'Preguntar a $bot';
  }

  @override
  String get watchBots => 'Bots';

  @override
  String get watchUpNext => 'A continuación';

  @override
  String get watchBrief => 'Resumen';

  @override
  String get watchSettings => 'Ajustes';

  @override
  String get watchChat => 'Chat';

  @override
  String get watchTalk => 'Hablar';

  @override
  String get watchCredits => 'Créditos';

  @override
  String get watchNeedsYou => 'Te necesita';

  @override
  String get watchNeedsYouOne => '1 te necesita';

  @override
  String watchNeedsYouMany(String count) {
    return '$count te necesitan';
  }

  @override
  String get watchNeedsOk => 'Necesita tu confirmación';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot necesita tu confirmación';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot sugiere';
  }

  @override
  String get watchTakeOver => 'Quiere que tomes el control';

  @override
  String get watchAllClear => 'Todo al día';

  @override
  String get watchNothingWaiting => 'Nada te necesita';

  @override
  String get watchAllow => 'Permitir';

  @override
  String get watchDeny => 'Denegar';

  @override
  String get watchHoldToAllow => 'Mantén para permitir';

  @override
  String get watchHoldHint => '¿Permitir esto? Toca dos veces para permitir.';

  @override
  String get watchReview => 'Revisar';

  @override
  String get watchReviewOnIphone => 'Revisar en el iPhone';

  @override
  String get watchReviewOnPhone => 'Revisar en el teléfono';

  @override
  String get watchWhyHighRisk => 'Riesgo alto: responde en tu teléfono';

  @override
  String get watchWhyPayment => 'Los pagos se responden en tu teléfono';

  @override
  String get watchWhySetting => 'Tus ajustes mantienen esto en tu teléfono';

  @override
  String get watchWhyWorkspace =>
      'Tu espacio de trabajo mantiene esto en tu teléfono';

  @override
  String get watchWhyNotYours => 'Solo quien inició este chat puede permitirlo';

  @override
  String get watchHighRisk => 'Riesgo alto';

  @override
  String get watchMediumRisk => 'Riesgo medio';

  @override
  String get watchLowRisk => 'Riesgo bajo';

  @override
  String get watchAllowed => 'Permitido';

  @override
  String get watchDenied => 'Denegado';

  @override
  String get watchDone => 'Listo';

  @override
  String get watchAlreadyAnswered => 'Ya respondido';

  @override
  String get watchLockToAllow =>
      'Configura un código en este reloj para permitir desde aquí';

  @override
  String get watchDoIt => 'Hazlo';

  @override
  String get watchNotNow => 'Ahora no';

  @override
  String get watchOpenOnIphone => 'Abrir en el iPhone';

  @override
  String get watchOpenOnPhone => 'Abrir en el teléfono';

  @override
  String get watchSentToPhone => 'Enviado a tu teléfono';

  @override
  String get watchWorking => 'Trabajando';

  @override
  String watchIsWorking(String bot) {
    return '$bot está trabajando';
  }

  @override
  String get watchWaitingForYou => 'Esperándote';

  @override
  String watchRepliedAt(String time) {
    return 'Respondió a las $time';
  }

  @override
  String get watchIdle => 'Inactivo';

  @override
  String get watchOff => 'Desactivado';

  @override
  String watchStepCount(String count) {
    return 'Paso $count';
  }

  @override
  String get watchStop => 'Detener';

  @override
  String get watchStopped => 'Detenido';

  @override
  String get watchFinished => 'Terminado';

  @override
  String get watchProblem => 'Se detuvo con un problema';

  @override
  String get watchCouldntFinish => 'No se pudo terminar';

  @override
  String get watchListening => 'Escuchando…';

  @override
  String get watchTapToStop => 'Toca para detener';

  @override
  String get watchTypeInstead => 'Escribir';

  @override
  String get watchSending => 'Enviando…';

  @override
  String get watchHeard => 'Escuchado';

  @override
  String get watchUndo => 'Deshacer';

  @override
  String get watchKeptOffline =>
      'Guardado. Se envía cuando vuelvas a conectarte';

  @override
  String watchKeptOld(String time) {
    return '¿Enviar lo que preguntaste a las $time?';
  }

  @override
  String get watchSend => 'Enviar';

  @override
  String get watchDiscard => 'Descartar';

  @override
  String get watchMicDenied =>
      'Permite el micrófono en Ajustes para preguntar por voz';

  @override
  String get watchNoDictation =>
      'Este servidor no tiene servicio de voz. Usa Escribir';

  @override
  String get watchDidntCatch => 'No te entendí. Inténtalo de nuevo';

  @override
  String get watchReply => 'Responder';

  @override
  String get watchReadAloud => 'Leer en voz alta';

  @override
  String get watchStopReading => 'Dejar de leer';

  @override
  String get watchContinuesOnIphone => 'Continúa en el iPhone';

  @override
  String get watchContinuesOnPhone => 'Continúa en el teléfono';

  @override
  String get watchReplyReady => 'Respuesta lista';

  @override
  String get watchYou => 'Tú';

  @override
  String get watchQuickYes => 'Sí';

  @override
  String get watchQuickNo => 'No';

  @override
  String get watchQuickTellMore => 'Cuéntame más';

  @override
  String get watchQuickNotNow => 'Ahora no';

  @override
  String get watchRunNow => 'Ejecutar ahora';

  @override
  String get watchStarted => 'Iniciado';

  @override
  String watchInMinutes(String minutes) {
    return 'en $minutes min';
  }

  @override
  String get watchNoRoutines => 'Todavía no hay rutinas';

  @override
  String watchBriefAt(String time) {
    return 'Resumen a las $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Resumen a las $time mañana';
  }

  @override
  String get watchNoBrief => 'Sin resumen configurado';

  @override
  String get watchNoBots => 'Sin bots todavía. Crea uno en tu teléfono';

  @override
  String get watchSigningIn => 'Iniciando sesión';

  @override
  String watchSignedInAs(String name) {
    return 'Sesión iniciada como $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Abre Casama en tu iPhone para terminar';

  @override
  String get watchOpenPhoneToFinish =>
      'Abre Casama en tu teléfono para terminar';

  @override
  String get watchUseCode => 'Iniciar sesión con código';

  @override
  String get watchCodeHelp =>
      'Escríbelo en Casama en tu teléfono o computadora: Ajustes → Reloj';

  @override
  String get watchNewCode => 'Nuevo código';

  @override
  String get watchSignedOut => 'Este reloj tiene la sesión cerrada';

  @override
  String get watchOpenToSignIn => 'Abre Casama para iniciar sesión';

  @override
  String watchAsOf(String time) {
    return 'a las $time';
  }

  @override
  String get watchOffline => 'Sin conexión';

  @override
  String get watchCouldntReach => 'No se pudo conectar con Casama';

  @override
  String get watchTryAgain => 'Reintentar';

  @override
  String get watchServerTooOld =>
      'Actualiza tu servidor de Casama para usar el reloj';

  @override
  String get watchOutOfCredits => 'Sin créditos';

  @override
  String get watchTalkOnPhone => 'Iniciando la llamada en tu teléfono';

  @override
  String get watchSignOut => 'Cerrar sesión en este reloj';

  @override
  String get watchHideDetails => 'Ocultar detalles al bajar la muñeca';

  @override
  String get watchReadRepliesAloud => 'Leer respuestas en voz alta';

  @override
  String get watchAskUses => 'Bot para Preguntar';

  @override
  String get watchWorkspace => 'Espacio de trabajo';

  @override
  String get watchSignedInAsLabel => 'Sesión iniciada como';

  @override
  String get watchCompNeedsYou => 'Te necesita';

  @override
  String get watchCompAsk => 'Preguntar a un bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'A continuación';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou =>
      'Cuántas solicitudes esperan y cuál es la primera';

  @override
  String get watchCompDescAsk => 'Pregunta por voz a un bot con un toque';

  @override
  String get watchCompDescBot => 'Cómo va un bot y qué está haciendo';

  @override
  String get watchCompDescUpNext => 'La próxima rutina y cuándo se ejecuta';

  @override
  String get watchCompDescCredits => 'Créditos usados en este período';

  @override
  String get watchNeedYouShort => 'te necesitan';

  @override
  String get watchControlAsk => 'Preguntar a Casama';

  @override
  String get watchControlTalk => 'Hablar con un bot';

  @override
  String get watchControlRun => 'Ejecutar una rutina';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count te necesitan. Primero: $text';
  }

  @override
  String get watchPhoneTitle => 'Reloj';

  @override
  String get watchPhoneIntro =>
      'Responde a bots, pregunta por voz y mira quién está trabajando desde tu muñeca.';

  @override
  String get watchPhoneWatches => 'Relojes con sesión iniciada';

  @override
  String get watchPhoneNone =>
      'Ningún reloj inició sesión aún. Abre Casama en tu reloj e iniciará sesión por sí solo.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Último uso: $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Aún sin usar';

  @override
  String get watchPhoneRemove => 'Quitar';

  @override
  String watchPhoneRemoveTitle(String name) {
    return '¿Quitar $name?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Se cierra sesión de inmediato. Puedes volver a iniciar sesión más adelante.';

  @override
  String get watchPhoneUseCode => 'Iniciar sesión en un reloj con un código';

  @override
  String get watchPhoneCodeHint => 'El código en tu reloj';

  @override
  String watchPhoneCodeAsk(String name) {
    return '¿Iniciar sesión en $name?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Se iniciará sesión en $workspace como tú. Solo permite un código que aparezca en tu propio reloj.';
  }

  @override
  String get watchPhoneCodeAllow => 'Iniciar sesión';

  @override
  String get watchPhoneCodeWrong =>
      'Ese código no funcionó. Revísalo en tu reloj';

  @override
  String get watchPhoneCodeTaken =>
      'Este reloj sigue con sesión iniciada en otra cuenta. Quítalo allí en Ajustes → Reloj y luego obtén un código nuevo';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Sesión iniciada en $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'Sesión iniciada en otro espacio de trabajo';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name inició sesión';
  }

  @override
  String get watchPhoneAllowTitle => 'Permitir desde el reloj';

  @override
  String get watchPhoneAllowMedium => 'Riesgo bajo y medio';

  @override
  String get watchPhoneAllowMediumBody =>
      'Riesgo bajo con un toque; riesgo medio manteniendo presionado. Riesgo alto y pagos siempre requieren tu teléfono.';

  @override
  String get watchPhoneAllowLow => 'Solo riesgo bajo';

  @override
  String get watchPhoneAllowNone => 'Nunca';

  @override
  String get watchPhoneDetails => 'Mostrar detalles en el reloj';

  @override
  String get watchPhoneDetailsBody =>
      'Desactivado: el reloj muestra cantidades y nombres de bots, no lo que escribieron.';

  @override
  String get watchPhoneQuickReplies => 'Respuestas rápidas';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Respuestas cortas que puedes enviar desde una notificación. Hasta seis.';

  @override
  String get watchPhoneQuickAdd => 'Agregar una respuesta rápida';

  @override
  String get watchPhoneQuickReset => 'Usar las respuestas integradas';

  @override
  String get watchPhoneHowTo => 'Agregar Casama a la carátula de tu reloj';

  @override
  String get watchPhoneHowToApple =>
      'Mantén presionada la carátula, toca Editar y elige Casama para una complicación. Gira la Digital Crown en la carátula para encontrar Casama en la Pila inteligente.';

  @override
  String get watchPhoneHowToWear =>
      'Mantén presionada la carátula para agregar una complicación de Casama. Desliza a la izquierda desde la carátula y toca + para agregar una tarjeta de Casama.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Iniciando sesión en $name…';
  }

  @override
  String get watchPhoneLockAsk => '¿Iniciar sesión en tu reloj?';

  @override
  String get watchPhoneNudge =>
      'Casama también está en tu reloj. Responde a los bots desde tu muñeca.';

  @override
  String get watchPhoneHandoffTitle => 'Desde tu reloj';

  @override
  String get watchPhoneRow => 'Tus bots en tu Apple Watch o reloj Wear OS';

  @override
  String get watchPhoneAllowLowBody =>
      'Riesgo bajo con un toque. Todo lo demás requiere tu teléfono.';

  @override
  String get watchPhoneAllowNoneBody =>
      'El reloj solo puede denegar. Permite desde tu teléfono.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Desactivado porque el bloqueo de la app está activado, así que tu reloj no muestra palabras de tus chats. Actívalo para verlas.';

  @override
  String get watchPhoneQuickHint => 'Una respuesta corta';

  @override
  String get watchPhoneQuickTooLong => 'Hasta 40 caracteres';

  @override
  String get watchPhoneQuickMoveUp => 'Subir';

  @override
  String get watchPhoneQuickMoveDown => 'Bajar';

  @override
  String get watchPhoneQuickDelete => 'Eliminar esta respuesta';

  @override
  String get watchPhoneCodeBody =>
      'En tu reloj, abre Casama y elige Iniciar sesión con código.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking =>
      'Quién está trabajando y qué está haciendo';

  @override
  String get watchCompDescBrief => 'El resumen de esta mañana';

  @override
  String get watchCodeWaiting => 'Esperando el código…';

  @override
  String watchCodeA11y(String code) {
    return 'Código de inicio de sesión $code';
  }

  @override
  String get watchChooseBot => 'Elige un bot';

  @override
  String get watchChannelRequests => 'Solicitudes';

  @override
  String get watchChannelReplies => 'Respuestas';

  @override
  String get watchChannelRuns => 'Bots trabajando';

  @override
  String get watchChannelOther => 'Otros';

  @override
  String get watchOtherWorkspace =>
      'Esto está en otro espacio de trabajo. Respóndelo en tu teléfono';

  @override
  String get watchReplySent => 'Enviado';

  @override
  String get watchReplyNotSent => 'No se pudo enviar tu respuesta';

  @override
  String watchAskDropped(String time) {
    return 'No se pudo enviar lo que preguntaste a las $time';
  }

  @override
  String get watchNeedsHttps =>
      'Este reloj solo puede acceder a tu servidor por https o en la red de tu casa';

  @override
  String get watchSignIn => 'Iniciar sesión';

  @override
  String get watchNotOnWatch =>
      'Este reloj no puede responder esto. Ábrelo en tu teléfono';

  @override
  String watchMoreOnPhone(String count) {
    return '$count más en tu teléfono';
  }

  @override
  String get watchShareCrashReports => 'Compartir informes de fallos';

  @override
  String get showList => 'Mostrar la lista';

  @override
  String get hideList => 'Ocultar la lista';

  @override
  String get panePickLibrary => 'Elige algo de la Biblioteca para verlo aquí.';

  @override
  String get panePickSetting => 'Elige un ajuste para verlo aquí.';

  @override
  String get trackpad => 'Trackpad';

  @override
  String get trackpadHint =>
      'Un dedo mueve el puntero, dos desplazan, un toque hace clic.';

  @override
  String get trackpadTakeControl => 'Toma el control para usar el trackpad.';

  @override
  String get foldScreenTitle => 'Pantalla plegable';

  @override
  String get foldRowHelp =>
      'Lo que Casama ve de las pantallas de este dispositivo';

  @override
  String get foldScreenHelp =>
      'Cómo se sostiene este dispositivo y dónde está su pliegue, según lo que Casama ve ahora. Abre, cierra o pliega el dispositivo y los números cambian. Cópialos si una pantalla se ve mal.';

  @override
  String get foldPose => 'Postura';

  @override
  String get foldWindow => 'Ventana';

  @override
  String get foldInsets => 'Área segura';

  @override
  String get foldStrip => 'Franja lateral';

  @override
  String get foldFold => 'Pliegue';

  @override
  String get foldHinge => 'Bisagra';

  @override
  String get foldSystemSays => 'Lo que reporta el sistema';

  @override
  String get inviteGateLine => 'Casama Cloud es solo con invitación por ahora.';

  @override
  String get inviteGateSelfHost =>
      'Ejecutar Casama en tu propio servidor está abierto para todos.';

  @override
  String get joinTheWaitlist => 'Únete a la lista de espera';

  @override
  String get iHaveAnInvite => 'Tengo una invitación';

  @override
  String get waitlistSubtitle =>
      'Dejamos entrar personas poco a poco. Recibirás un correo cuando sea tu turno.';

  @override
  String get waitlistNote => '¿Qué le pedirías primero a un bot?';

  @override
  String get waitlistNoteHint => 'Opcional';

  @override
  String get waitlistSelfHosting => 'Ejecuto Casama en mi propio servidor';

  @override
  String get waitlistNewsletter =>
      'También envíame el correo mensual de Casama (como máximo una vez al mes)';

  @override
  String get waitlistAppleRelay =>
      'Esta es la dirección privada que Apple creó para ti. Consérvala si vas a iniciar sesión con Apple; Apple reenvía nuestro correo a tu bandeja de entrada.';

  @override
  String get waitlistJoinedTitle => 'Ya estás en la lista.';

  @override
  String get waitlistJoinedBody =>
      'Dejamos entrar personas poco a poco. Recibirás un correo cuando sea tu turno y nada más, salvo que hayas pedido el correo mensual. ¿Conoces a alguien que use Casama? Una invitación suya te da acceso de inmediato.';

  @override
  String get waitlistJoinedCode =>
      '¿Tienes un código de invitación? Ingrésalo aquí.';

  @override
  String get waitlistJoinedSelfHost =>
      '¿No quieres esperar? Casama es de código abierto. Ejecútalo en tu propia computadora hoy.';

  @override
  String get waitlistRunItYourself => 'Ejecútalo tú mismo';

  @override
  String get inviteSubtitle =>
      'Ingresa tu código de invitación o pega el enlace de invitación.';

  @override
  String get inviteCodeLabel => 'Código de invitación';

  @override
  String get inviteNotFound =>
      'Ese código no coincide con ninguna invitación. Revísalo e inténtalo de nuevo.';

  @override
  String inviteFromName(String name) {
    return '$name te invitó a Casama';
  }

  @override
  String get inviteFromFriend => 'Una amistad te invitó a Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Tu invitación: $label';
  }

  @override
  String get inviteFromCasama => 'Tu invitación a Casama';

  @override
  String get inviteChooseSignIn =>
      'Ahora elige cómo vas a iniciar sesión. Usa la dirección que quieras para tu cuenta.';

  @override
  String get inviteGoneHelp =>
      'Estas invitaciones se agotaron. Ingresa tu correo y pasarás a la lista de espera con prioridad.';

  @override
  String get inviteEmailHelp =>
      'Dejaremos entrar esta dirección y luego le enviaremos un enlace de inicio de sesión.';

  @override
  String inviteCheckInbox(String email) {
    return 'Ya estás dentro. Revisa $email para ver un enlace de inicio de sesión o escribe aquí su código.';
  }

  @override
  String get inviteWaitlistedTitle => 'Estás en la lista de espera';

  @override
  String get inviteWaitlisted =>
      'Estas invitaciones se agotaron, pero tienes prioridad en la fila.';

  @override
  String get inviteUseEmailHere =>
      'En este dispositivo, usa Continuar con correo. Apple y Google funcionan con invitación en las apps para iPhone, Mac y Android.';

  @override
  String get inviteDifferentCode => 'Usar otro código';

  @override
  String get inviteRefusedHelp =>
      'Únete a la lista de espera y te avisaremos por correo cuando sea tu turno, o ingresa un código de invitación si tienes uno.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud es solo con invitación por ahora. Te avisaremos por correo cuando sea tu turno. ¿Tienes un código de invitación? Úsalo ahora.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count invitaciones',
      one: 'Queda 1 invitación',
      zero: 'No quedan invitaciones',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used de $total usadas. Cada una permite a una amistad crear una cuenta.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Tus invitaciones se desbloquean después de tu primer chat terminado.';

  @override
  String get inviteWaitingTitle => 'Esperando tu invitación';

  @override
  String get inviteWaitingUses =>
      'Dejar entrar a esta persona usa una de tus invitaciones.';

  @override
  String get inviteWaitingNoneLeft =>
      'Recuperas una invitación cuando una amistad que invitaste termina su primer chat.';

  @override
  String get inviteWaitingLetIn => 'Dejar entrar';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Dejar entrar a $email';
  }

  @override
  String get inviteWaitingDone =>
      'Recibirá un correo en unos minutos para crear su cuenta.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Te guardé una de mis $count invitaciones de Casama.',
      one: 'Te guardé mi invitación de Casama.',
    );
    return '$_temp0 Casama es solo con invitación por ahora y esto te da acceso de inmediato: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Te guardé una de mis $count invitaciones de Casama.',
      one: 'Te guardé mi invitación de Casama.',
    );
    return '$_temp0 Casama es solo con invitación por ahora. Esto te da acceso de inmediato y recibes $amount de uso gratuito después de tu primer chat: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => '¿Para quién es?';

  @override
  String get inviteNameHelp =>
      'Agrega su nombre y la página de invitación la saludará por su nombre. Puedes dejarlo vacío.';

  @override
  String get inviteNameHint => 'Nombre';

  @override
  String get inviteNameShare => 'Compartir invitación';

  @override
  String get inviteAskTitle => '¿Quién más usaría esto?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tienes $count invitaciones a Casama. Cada una le da acceso a una amistad de inmediato.',
      one: 'Tienes 1 invitación a Casama. Le da acceso a una amistad de inmediato.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Cada persona recibe $amount de uso gratuito después de su primer chat.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Recibes $amount de uso gratuito después de su primer chat.';
  }

  @override
  String get inviteAskSend => 'Enviar una invitación';

  @override
  String get inviteAskNotNow => 'Ahora no';

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
      other: '$count recargas guardadas',
      one: '1 recarga guardada',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Úsala antes del $date';
  }

  @override
  String get savedResetUse => 'Usar recarga';

  @override
  String get savedResetConfirmTitle => '¿Usar esta recarga?';

  @override
  String get savedResetConfirmDaily =>
      'Borra el límite de hoy para que tus bots puedan volver a trabajar hoy. Esto no se puede deshacer.';

  @override
  String get savedResetConfirmComputer =>
      'Devuelve las horas de computadora de este mes. Esto no se puede deshacer.';

  @override
  String get savedResetOwnerRequired =>
      'Solo una persona propietaria del espacio de trabajo puede usarla.';

  @override
  String get savedResetPaused =>
      'En pausa por ahora. Vuelve a revisar más tarde.';

  @override
  String get savedResetPeriodLimit =>
      'Ya usaste la recarga de este período. Puedes usar esta en el siguiente período.';

  @override
  String get savedResetNothingToRefill =>
      'Todavía no hay nada que recargar. Guárdala para cuando te quedes con poco.';

  @override
  String get savedResetNoBillingPeriod =>
      'Disponible cuando tu plan termine de configurarse.';

  @override
  String get savedResetUnavailable => 'No disponible en este momento.';

  @override
  String savedResetDone(String amount) {
    return 'Recarga usada: se agregaron $amount';
  }

  @override
  String get savedResetDoneNoCredits => 'Recarga usada';

  @override
  String savedResetConfirm(String amount) {
    return 'Recarga $amount de los créditos incluidos de este período. Esto no se puede deshacer.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Activar recargas guardadas';

  @override
  String get resetsOffNote => 'Desactivado: nadie recibe recargas guardadas.';

  @override
  String get resetsDecrease => 'Reducir';

  @override
  String get resetsIncrease => 'Aumentar';

  @override
  String get resetsSettings => 'Ajustes';

  @override
  String get resetsCampaigns => 'Campañas';

  @override
  String get resetsStatLive => 'Activa';

  @override
  String get resetsStatGiven => 'Otorgadas';

  @override
  String get resetsStatUsed => 'Usadas';

  @override
  String get resetsStatRefilled => 'Recargado';

  @override
  String get resetsFilterActive => 'Activas';

  @override
  String get resetsFilterEnded => 'Finalizadas';

  @override
  String get resetsFilterAll => 'Todas';

  @override
  String get resetsStateDraft => 'Borrador';

  @override
  String get resetsStateScheduled => 'Programada';

  @override
  String get resetsStateLive => 'Activa';

  @override
  String get resetsStatePaused => 'En pausa';

  @override
  String get resetsStateEnded => 'Finalizada';

  @override
  String get resetsStateCancelled => 'Cancelada';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used de $budget de presupuesto';
  }

  @override
  String resetsGivenN(String count) {
    return '$count otorgadas';
  }

  @override
  String resetsUsedN(String count) {
    return '$count usadas';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Inicia $start · Finaliza $end';
  }

  @override
  String get resetsToday => 'hoy';

  @override
  String get resetsTomorrow => 'mañana';

  @override
  String get resetsYesterday => 'ayer';

  @override
  String get resetsAudienceEveryone => 'Todos los espacios de trabajo';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count espacios de trabajo',
      one: '1 espacio de trabajo',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Se unió antes del $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Alcanzó un límite en los últimos $days días',
      one: 'Alcanzó un límite hoy',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Cancelar campaña';

  @override
  String get resetsCancelConfirm => '¿Cancelar esta campaña?';

  @override
  String get resetsCancelConfirmBody =>
      'Deja de otorgar recargas guardadas. Esto no se puede deshacer.';

  @override
  String get resetsDeleteConfirm => '¿Eliminar esta campaña?';

  @override
  String get resetsDeleteConfirmBody =>
      'El borrador se elimina de forma permanente.';

  @override
  String get resetsNoCampaigns =>
      'Todavía no hay campañas. Inicia una para dar recargas guardadas a muchos espacios de trabajo a la vez.';

  @override
  String get resetsNoMatches => 'No hay campañas aquí.';

  @override
  String get resetsEditCampaign => 'Editar campaña';

  @override
  String get resetsSectionBasics => 'Datos básicos';

  @override
  String get resetsSectionAudience => 'Destinatarios';

  @override
  String get resetsSectionTiming => 'Programación';

  @override
  String get resetsSectionRefill => 'Recarga';

  @override
  String get resetsSectionWhat => 'Qué se recarga';

  @override
  String get resetsSectionNotify => 'Notificaciones';

  @override
  String get resetsPreviewLabel => 'Lo que ven las personas';

  @override
  String get resetsMonthly => 'Mensual';

  @override
  String get resetsYearly => 'Anual';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Planes';

  @override
  String get resetsPlansHint =>
      'No marques ninguno para incluir todos los planes.';

  @override
  String get resetsWorkspacesLabel => 'Espacios de trabajo';

  @override
  String get resetsWorkspacesHint =>
      'Déjalo vacío para incluir todos los espacios de trabajo.';

  @override
  String get resetsSearchWorkspaces => 'Buscar espacios de trabajo por nombre';

  @override
  String get resetsNoWorkspaceMatch => 'Ningún espacio de trabajo coincide.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Solo $name';
  }

  @override
  String get resetsJoinedBefore => 'Se unió antes de';

  @override
  String get resetsLimitedDaysLabel =>
      'Alcanzó un límite en los últimos N días';

  @override
  String get resetsStartsLabel => 'Inicia';

  @override
  String get resetsEndsLabel => 'Vence';

  @override
  String resetsPercentValue(int percent) {
    return 'Recargar el $percent% de los créditos incluidos';
  }

  @override
  String get resetsCapLabel => 'Máximo por uso';

  @override
  String get resetsBudgetLabel => 'Presupuesto total';

  @override
  String get resetsOptional => 'Opcional';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Llega a cerca de $count espacios de trabajo · $credits en créditos · cuesta cerca de $cost';
  }

  @override
  String get resetsEstimating => 'Calculando el alcance…';

  @override
  String get resetsEstimateNeedsFields =>
      'Completa los campos para ver el alcance.';

  @override
  String get resetsLockedNote =>
      'Esta campaña está activa: solo pueden cambiar el mensaje, el vencimiento, el presupuesto y el recordatorio.';

  @override
  String get resetsRequired => 'Obligatorio.';

  @override
  String get resetsTooLong => 'Como máximo 120 caracteres.';

  @override
  String get resetsDaysInvalid => 'Ingresa de 1 a 365 días.';

  @override
  String get resetsMoneyInvalid => 'Ingresa 0 o más.';

  @override
  String get resetsExpiryBeforeStart => 'Elige un fin posterior al inicio.';

  @override
  String resetsGivenTo(String name) {
    return 'Recarga guardada entregada a $name';
  }

  @override
  String get resetsCampaignSaved => 'Campaña guardada';

  @override
  String get resetsDefaultMessage =>
      'Una recarga guardada, por nuestra cuenta. Úsala cuando alcances un límite.';

  @override
  String resetsGiveName(String name) {
    return 'Recarga guardada para $name';
  }

  @override
  String get resetsOneWorkspace => 'Un espacio de trabajo';

  @override
  String get resetsPickWorkspace =>
      'Elige un espacio de trabajo para ver sus recargas guardadas.';

  @override
  String get resetsAllHistory => 'Todo el historial';

  @override
  String get resetsAllWorkspaces => 'Todos los espacios de trabajo';

  @override
  String get resetsNoEvents => 'Todavía no hay nada aquí.';

  @override
  String get resetsEventGiven => 'Recarga guardada otorgada';

  @override
  String get resetsEventUsed => 'Recarga guardada usada';

  @override
  String get resetsEventRevoked => 'Retirada';

  @override
  String get resetsEventUndone => 'Recarga revertida';

  @override
  String get resetsEventExpired => 'Venció sin usarse';

  @override
  String get resetsEventCreated => 'Campaña creada';

  @override
  String get resetsEventEdited => 'Campaña editada';

  @override
  String get resetsEventStarted => 'Campaña iniciada';

  @override
  String get resetsEventEnded => 'Campaña finalizada';

  @override
  String get resetsEventScheduled => 'Campaña programada';

  @override
  String get resetsEventPaused => 'Campaña pausada';

  @override
  String get resetsEventResumed => 'Campaña reanudada';

  @override
  String get resetsEventCancelled => 'Campaña cancelada';

  @override
  String get resetsEventDeleted => 'Campaña eliminada';

  @override
  String get resetsEventSettings => 'Ajustes cambiados';

  @override
  String get resetsRevokeConfirm => '¿Retirar esta recarga guardada?';

  @override
  String get resetsRevokeConfirmBody =>
      'El espacio de trabajo la pierde antes de usarla.';

  @override
  String get resetsUndoConfirm => '¿Deshacer esta recarga?';

  @override
  String get resetsUndoConfirmBody =>
      'Se vuelven a quitar los créditos que agregó.';

  @override
  String get resetsPerPeriod => 'Usos por espacio de trabajo y período';

  @override
  String get resetsMaxHeld => 'Máximo de recargas guardadas';

  @override
  String get resetsNotifyOwners => 'Notificar a propietarios de la instancia';

  @override
  String get resetsNewCampaign => 'Nueva campaña';

  @override
  String get resetsName => 'Nombre';

  @override
  String get resetsMessage => 'Mensaje para las personas';

  @override
  String get resetsPlans =>
      'Códigos de plan, separados por comas (vacío significa todos)';

  @override
  String get resetsWorkspaces =>
      'ID de espacios de trabajo, separados por comas (vacío significa todos)';

  @override
  String get resetsBefore => 'Creado antes de (fecha y hora, opcional)';

  @override
  String get resetsLimitedDays =>
      'Alcanzó un límite en los últimos N días (opcional)';

  @override
  String get resetsStart => 'Inicia (fecha y hora)';

  @override
  String get resetsExpiry => 'Vence (fecha y hora)';

  @override
  String get resetsPercent => 'Créditos incluidos para recargar (%)';

  @override
  String get resetsCap => 'Dólares máximos por uso (opcional)';

  @override
  String get resetsBudget =>
      'Presupuesto total de créditos en dólares (opcional)';

  @override
  String get resetsDaily => 'Borrar el límite de modelos de hoy';

  @override
  String get resetsComputer => 'Recargar las horas de computadora de este mes';

  @override
  String get resetsArrival => 'Notificar al llegar';

  @override
  String get resetsReminder => 'Recordar antes del vencimiento';

  @override
  String get resetsPreviewSave => 'Vista previa y guardar';

  @override
  String get resetsSchedule => 'Programar';

  @override
  String get resetsPause => 'Pausar';

  @override
  String get resetsResume => 'Reanudar';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count espacios de trabajo. Recarga máxima: $credits. Costo estimado: $cost.',
      one:
          '$count espacio de trabajo. Recarga máxima: $credits. Costo estimado: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace =>
      'ID del espacio de trabajo (vacío para todo el historial)';

  @override
  String get resetsHistory => 'Cargar historial';

  @override
  String get resetsGive => 'Dar una recarga guardada';

  @override
  String get resetsCopyCsv => 'Copiar CSV';

  @override
  String get resetsRevoke => 'Retirar';

  @override
  String get resetsUndo => 'Deshacer recarga sin usar';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention =>
      'Los servicios de proveedores requieren atención';

  @override
  String get vendorNotSetUp => 'Sin configurar';

  @override
  String get vendorCheckNow => 'Comprobar ahora';

  @override
  String get vendorLimit => 'Límite o monto prepagado';

  @override
  String get vendorWarnAt => 'Avisar al llegar a';

  @override
  String get vendorExpiry => 'Vence';

  @override
  String get vendorHistory => 'Lecturas recientes';

  @override
  String get vendorSave => 'Guardar';

  @override
  String get vendorEnabled => 'Supervisión activada';

  @override
  String get vendorUnknown => 'Desconocido';

  @override
  String get vendorLow => 'Bajo';

  @override
  String get vendorOut => 'Agotado';

  @override
  String get vendorOk => 'Bien';

  @override
  String get vendorNoReading => 'Aún sin lectura';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count requieren atención',
      one: '1 requiere atención',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count bien';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count sin configurar';
  }

  @override
  String get vendorNoVendors => 'Todavía no hay servicios por supervisar.';

  @override
  String get vendorCheckAll => 'Comprobar todos';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Comprobando $done de $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count servicios comprobados',
      one: '1 servicio comprobado',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fallaron $count comprobaciones',
      one: 'Falló 1 comprobación',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Requieren atención';

  @override
  String get vendorGroupHealthy => 'Correctos';

  @override
  String get vendorGroupIdle => 'Sin configurar o desactivados';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mostrar $count más',
      one: 'Mostrar 1 más',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Mostrar menos';

  @override
  String get vendorOff => 'Desactivado';

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
    return 'Quedan $amount';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Avisa por debajo de $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Se restablece $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Se renueva el $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Venció el $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count minutos',
      one: 'en 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count horas',
      one: 'en 1 hora',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en $count días',
      one: 'en 1 día',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Comprobado $when';
  }

  @override
  String get vendorSourceApi => 'Desde el servicio';

  @override
  String get vendorSourceOwnCount => 'Contado por Casama';

  @override
  String get vendorSourceManual => 'Ingresado manualmente';

  @override
  String vendorReadingError(String error) {
    return 'La última comprobación falló: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Agrega su clave en el servidor para empezar a comprobar.';

  @override
  String get vendorOffHint => 'La supervisión está desactivada.';

  @override
  String get vendorPickOne => 'Elige un servicio para ver sus detalles.';

  @override
  String get vendorSectionStatus => 'Estado';

  @override
  String get vendorSectionActions => 'Acciones';

  @override
  String get vendorSectionAlerts => 'Alertas';

  @override
  String get vendorSectionPlan => 'Plan';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Avisar al usar un $percent%';
  }

  @override
  String get vendorWarnAtHelp => 'El medidor cambia a ámbar aquí.';

  @override
  String get vendorPeriod => 'Período';

  @override
  String get vendorPeriodNone => 'Sin definir';

  @override
  String get vendorPeriodDay => 'Diario';

  @override
  String get vendorPeriodMonth => 'Mensual';

  @override
  String get vendorPeriodBilling => 'Cada período de facturación';

  @override
  String get vendorPeriodPrepaid => 'Prepagado';

  @override
  String get vendorDateNotSet => 'Sin definir';

  @override
  String get vendorClearDate => 'Borrar fecha';

  @override
  String get vendorLimitInvalid => 'Ingresa un número mayor que 0.';

  @override
  String get vendorAmountInvalid => 'Ingresa 0 o más.';

  @override
  String get vendorMonthsInvalid => 'Ingresa de 1 a 120 meses.';

  @override
  String get vendorWarnAtInvalid => 'Elige un punto entre 1% y 100%.';

  @override
  String get vendorSaved => 'Ajustes guardados';

  @override
  String get vendorCheckDone => 'Comprobado';

  @override
  String get vendorHistoryEmpty => 'Todavía no hay lecturas.';

  @override
  String get vendorCheckFailed => 'Falló la comprobación';

  @override
  String get vendorResets => 'Recargas';

  @override
  String get vendorSource => 'Fuente';

  @override
  String get vendorBilling => 'Facturación y recarga';

  @override
  String get vendorBalanceWarning => 'Avisar por debajo del saldo';

  @override
  String get vendorPeriodStart => 'Inicio del período';

  @override
  String get vendorInvalidSettings =>
      'Ingresa un límite positivo, un aviso entre 0 y 1 y fechas válidas.';

  @override
  String get card24hRange => 'Rango de 24 horas';

  @override
  String get card52wRange => 'Rango de 52 semanas';

  @override
  String get cardAgain => 'De nuevo';

  @override
  String get cardAgoSuffix => 'hace';

  @override
  String get cardAirQuality => 'Calidad del aire';

  @override
  String get cardAqiAdviceBad =>
      'Todos deberían reducir el esfuerzo prolongado o intenso al aire libre; mantén las ventanas cerradas.';

  @override
  String get cardAqiAdviceGood => 'Buen día para estar al aire libre.';

  @override
  String get cardAqiAdviceModerate =>
      'Adecuado para la mayoría; personas muy sensibles podrían tomárselo con calma.';

  @override
  String get cardAqiAdviceSensitive =>
      'Niños, adultos mayores y personas con asma deberían limitar el esfuerzo prolongado al aire libre.';

  @override
  String get cardAqiGood => 'Buena';

  @override
  String get cardAqiHazardous => 'Peligrosa';

  @override
  String get cardAqiModerate => 'Moderada';

  @override
  String get cardAqiSensitive => 'Perjudicial para grupos sensibles';

  @override
  String get cardAqiUnhealthy => 'Perjudicial';

  @override
  String get cardAqiVeryUnhealthy => 'Muy perjudicial';

  @override
  String get cardBaggage => 'Equipaje';

  @override
  String get cardCalcAmount => 'Monto';

  @override
  String get cardCalcBill => 'Cuenta';

  @override
  String get cardCalcDiscount => 'Descuento';

  @override
  String get cardCalcDiscountTitle => 'Descuento';

  @override
  String get cardCalcGross => 'Con impuestos';

  @override
  String get cardCalcGrowth => 'Crecimiento';

  @override
  String get cardCalcInterest => 'Interés';

  @override
  String get cardCalcLoan => 'Préstamo';

  @override
  String get cardCalcMonthly => 'Cada mes';

  @override
  String get cardCalcMonthlyPayment => 'Pago mensual';

  @override
  String get cardCalcNet => 'Antes de impuestos';

  @override
  String get cardCalcPeople => 'Personas';

  @override
  String get cardCalcPerPerson => 'Cada persona paga';

  @override
  String get cardCalcPrice => 'Precio';

  @override
  String get cardCalcPrincipal => 'Capital';

  @override
  String get cardCalcRate => 'Tasa anual';

  @override
  String get cardCalcSavings => 'Ahorros';

  @override
  String get cardCalcStart => 'Empezar con';

  @override
  String get cardCalcTax => 'Impuesto';

  @override
  String get cardCalcTaxIncluded => 'Impuesto incluido';

  @override
  String get cardCalcTaxRate => 'Tasa de impuesto';

  @override
  String get cardCalcTip => 'Propina';

  @override
  String get cardCalcTipAmount => 'Propina';

  @override
  String get cardCalcTipSplit => 'Propina y división';

  @override
  String get cardCalcTotal => 'Total';

  @override
  String get cardCalcTotalInterest => 'Interés total';

  @override
  String get cardCalcTotalPaid => 'Total pagado';

  @override
  String get cardCalcUnits => 'Convertir unidades';

  @override
  String get cardCalcValue => 'Valor';

  @override
  String get cardCalcVat => 'Impuesto';

  @override
  String get cardCalcYears => 'Años';

  @override
  String get cardCalcYouPay => 'Pagas';

  @override
  String get cardCalcYouPutIn => 'Aportas';

  @override
  String get cardCalcYouSave => 'Ahorras';

  @override
  String get cardCall => 'Llamar';

  @override
  String get cardCaloriesWord => 'Calorías';

  @override
  String get cardComparison => 'Comparación';

  @override
  String get cardCondClear => 'Despejado';

  @override
  String get cardCondCloudy => 'Nublado';

  @override
  String get cardCondDrizzle => 'Llovizna';

  @override
  String get cardCondFog => 'Niebla';

  @override
  String get cardCondHail => 'Granizo';

  @override
  String get cardCondHeavyRain => 'Lluvia fuerte';

  @override
  String get cardCondHeavySnow => 'Nieve fuerte';

  @override
  String get cardCondLightRain => 'Lluvia ligera';

  @override
  String get cardCondLightSnow => 'Nieve ligera';

  @override
  String get cardCondMostlyClear => 'Mayormente despejado';

  @override
  String get cardCondPartlyCloudy => 'Parcialmente nublado';

  @override
  String get cardCondRain => 'Lluvia';

  @override
  String get cardCondShowers => 'Chubascos';

  @override
  String get cardCondSleet => 'Aguanieve';

  @override
  String get cardCondSnow => 'Nieve';

  @override
  String get cardCondThunder => 'Tormentas eléctricas';

  @override
  String get cardCons => 'Contras';

  @override
  String get cardCopied => 'Copiado';

  @override
  String get cardCopy => 'Copiar como texto';

  @override
  String get cardCouldntUpdate => 'No se pudo actualizar';

  @override
  String get cardCurrency => 'Moneda';

  @override
  String get cardDayLength => 'Duración del día';

  @override
  String get cardDayRange => 'Rango del día';

  @override
  String get cardDays => 'días';

  @override
  String get cardDelay => 'Demora';

  @override
  String get cardDictionary => 'Diccionario';

  @override
  String get cardEmail => 'Correo electrónico';

  @override
  String get cardFlightCancelled => 'Cancelado';

  @override
  String get cardFlightDiverted => 'Desviado';

  @override
  String get cardFlightInAir => 'En el aire';

  @override
  String get cardFlightIncident => 'Incidente';

  @override
  String get cardFlightLanded => 'Aterrizó';

  @override
  String get cardFlightScheduled => 'En horario';

  @override
  String cardStaysFromNight(String price) {
    return 'desde $price la noche';
  }

  @override
  String get cardStaysANight => 'la noche';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n noches',
      one: '1 noche',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n huéspedes',
      one: '1 huésped',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n habitaciones',
      one: '1 habitación',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Mejores';

  @override
  String get cardStaysSortCheapest => 'Más baratos';

  @override
  String get cardStaysSortTopRated => 'Mejor calificados';

  @override
  String get cardStaysSortClosest => 'Más cercanos';

  @override
  String get cardStaysFilterFreeCancel => 'Cancelación gratuita';

  @override
  String get cardStaysFilterBreakfast => 'Desayuno';

  @override
  String get cardStaysFilterPayAtHotel => 'Pagar en el hotel';

  @override
  String get cardStaysFilterStars => '4 estrellas o más';

  @override
  String get cardStaysFilterRated => 'Calificación 8+';

  @override
  String get cardStaysList => 'Lista';

  @override
  String get cardStaysMap => 'Mapa';

  @override
  String get cardStaysEdit => 'Editar';

  @override
  String cardStaysRating(String value, String max) {
    return '$value de $max';
  }

  @override
  String cardStaysKm(String km) {
    return '$km km del centro';
  }

  @override
  String cardStaysStars(int n) {
    return '$n estrellas';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price por $n noches',
      one: '$price por 1 noche',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n sitios más',
      one: '+1 sitio más',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Ver oferta';

  @override
  String get cardStaysView => 'Ver';

  @override
  String cardStaysShowAll(int n) {
    return 'Mostrar los $n';
  }

  @override
  String get cardStaysShowFewer => 'Mostrar menos';

  @override
  String get cardStaysNone => 'Nada coincide con estos filtros.';

  @override
  String get cardStaysNoMap =>
      'Ninguno de estos lugares tiene ubicación en el mapa.';

  @override
  String get cardStaysNoDeals => 'No hay precios para estas fechas.';

  @override
  String get cardStaysCheck =>
      'El precio se comprueba en el sitio de reservas.';

  @override
  String cardStaysCompare(int n) {
    return 'Comparar ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Marca hasta 4 para comparar';

  @override
  String get cardStaysComparePick => 'Elige para comparar';

  @override
  String get cardStaysCompareTitle => 'Comparar';

  @override
  String get cardStaysRowNight => 'Precio por noche';

  @override
  String get cardStaysRowTotal => 'Total';

  @override
  String get cardStaysRowRating => 'Calificación';

  @override
  String get cardStaysRowStars => 'Estrellas';

  @override
  String get cardStaysRowDistance => 'Distancia';

  @override
  String get cardStaysYes => 'Sí';

  @override
  String get cardStaysNo => 'No';

  @override
  String get cardStaysTermFreeCancel => 'Cancelación gratuita';

  @override
  String get cardStaysTermBreakfast => 'Desayuno incluido';

  @override
  String get cardStaysTermNoBreakfast => 'Sin desayuno';

  @override
  String get cardStaysTermPayAtHotel => 'Pagar en el hotel';

  @override
  String get cardStaysTermNonRefundable => 'No reembolsable';

  @override
  String get cardStaysDetailsTitle => 'Alojamiento';

  @override
  String get cardStaysCheapest => 'Más barato';

  @override
  String get cardStaysAmenities => 'Servicios';

  @override
  String cardStaysCheckIn(String time) {
    return 'Check-in $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Check-out $time';
  }

  @override
  String get cardStaysNearby => 'Cerca';

  @override
  String get cardStaysHotelSite => 'Sitio web del hotel';

  @override
  String get cardStaysBook => 'Reservar por mí';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Reservar $name en $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Foto $n de $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · precio por mes';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Más barato: $month, cerca de $price por noche';
  }

  @override
  String get cardStaysTrendNote => 'Es un pronóstico, no precios en vivo.';

  @override
  String get cardStaysTrendPick => 'Elegir fechas';

  @override
  String get cardStaysSearchTitle => 'Buscar un alojamiento';

  @override
  String get cardStaysSearchWhere => 'Dónde';

  @override
  String get cardStaysSearchWhereHint => 'Ciudad, zona u hotel';

  @override
  String get cardStaysSearchDates => 'Elegir fechas';

  @override
  String get cardStaysSearchAdults => 'Adultos';

  @override
  String get cardStaysSearchRooms => 'Habitaciones';

  @override
  String get cardStaysSearchBudget => 'Presupuesto por noche (opcional)';

  @override
  String get cardStaysSearchNotNow => 'Ahora no';

  @override
  String get cardStaysSearchGo => 'Buscar alojamientos';

  @override
  String get cardStaysSearchSent => 'Buscando';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Alojamientos en $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Menos: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Más: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Piscina';

  @override
  String get cardStaysAmenityParking => 'Estacionamiento';

  @override
  String get cardStaysAmenityPets => 'Acepta mascotas';

  @override
  String get cardStaysAmenityGym => 'Gimnasio';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Cocina';

  @override
  String get cardStaysAmenityWifi => 'Wi-Fi';

  @override
  String get cardStaysAmenityAirCon => 'Aire acondicionado';

  @override
  String get cardProductsTitle => 'Cosas para comprar';

  @override
  String cardProductsFrom(String price) {
    return 'desde $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'menos de $price';
  }

  @override
  String get cardProductsSortBest => 'Mejores';

  @override
  String get cardProductsSortCheapest => 'Más baratos';

  @override
  String get cardProductsSortTopRated => 'Mejor calificados';

  @override
  String get cardProductsOnSale => 'En oferta';

  @override
  String get cardProductsRated => 'Calificación 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'y otras tiendas';

  @override
  String cardProductsShowAll(int n) {
    return 'Mostrar los $n';
  }

  @override
  String get cardProductsShowFewer => 'Mostrar menos';

  @override
  String get cardProductsShowMore => 'Mostrar más';

  @override
  String get cardProductsNone => 'Nada coincide con estos filtros.';

  @override
  String get cardProductsCheck => 'El precio se comprueba en la tienda.';

  @override
  String get cardProductsBuy => 'Comprar';

  @override
  String get cardProductsCompareStores => 'Comparar tiendas';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Comparar tiendas para $title';
  }

  @override
  String get cardProductsBuyForMe => 'Comprar por mí';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Comprar $title en $store';
  }

  @override
  String get cardProductsRowPrice => 'Precio';

  @override
  String get cardProductsRowStore => 'Tienda';

  @override
  String get cardProductsRowRating => 'Calificación';

  @override
  String get cardProductsRowDelivery => 'Entrega';

  @override
  String cardProductsDelivery(String text) {
    return 'Entrega: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'de $brand';
  }

  @override
  String get cardProductsOffers => 'Tiendas';

  @override
  String get cardProductsLowest => 'Total más bajo';

  @override
  String cardProductsTotal(String price) {
    return 'Total $price';
  }

  @override
  String get cardProductsOutOfStock => 'Agotado';

  @override
  String get cardProductsFeatures => 'Acerca del producto';

  @override
  String get cardProductsReviews => 'Qué dicen quienes compraron';

  @override
  String get cardCheckoutTitle => 'Revisa antes de que pague';

  @override
  String get cardCheckoutTotal => 'Total';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Abrir la página';

  @override
  String get cardCheckoutCancel => 'Cancelar';

  @override
  String get cardCheckoutChange => 'Cambiar';

  @override
  String get cardCheckoutConfirm => 'Confirmar y pagar';

  @override
  String get cardCheckoutCancelLabel => 'Cancelar esto';

  @override
  String get cardCheckoutChangeLabel => 'Cambiar algo';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Confirmar $total en $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Confirmar $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Confirmado';

  @override
  String get cardCheckoutChanging => 'Cambiando';

  @override
  String get cardCheckoutCancelled => 'Cancelado';

  @override
  String get cardBookingTitle => 'Tu reserva';

  @override
  String cardBookingWith(String site) {
    return 'Reservado en $site';
  }

  @override
  String get cardBookingCheckIn => 'Check-in';

  @override
  String get cardBookingCheckOut => 'Check-out';

  @override
  String get cardBookingConfirmation => 'Número de confirmación';

  @override
  String get cardBookingCopy => 'Copiar el número de confirmación';

  @override
  String get cardBookingPaid => 'Pagado';

  @override
  String get cardBookingPayAtHotel => 'Pagar en el hotel';

  @override
  String cardBookingCancelBy(String date) {
    return 'Cancelación gratuita hasta el $date';
  }

  @override
  String get cardBookingDirections => 'Cómo llegar';

  @override
  String get cardBookingManage => 'Administrar reserva';

  @override
  String get cardBookingCalendar => 'Agregar al calendario';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Agregar $name a mi calendario';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Pedido $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Realizado el $date';
  }

  @override
  String get cardOrderStepOrdered => 'Pedido';

  @override
  String get cardOrderStepShipped => 'Enviado';

  @override
  String get cardOrderStepOut => 'En reparto';

  @override
  String get cardOrderStepDelivered => 'Entregado';

  @override
  String get cardOrderCancelled => 'Cancelado';

  @override
  String get cardOrderReturned => 'Devuelto';

  @override
  String cardOrderArrives(String date) {
    return 'Llega el $date';
  }

  @override
  String get cardOrderTracking => 'Número de seguimiento';

  @override
  String get cardOrderCopy => 'Copiar el número de seguimiento';

  @override
  String get cardOrderTrack => 'Rastrear';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Rastrear $number';
  }

  @override
  String get cardOrderPage => 'Página del pedido';

  @override
  String get cardFaresBest => 'Mejores';

  @override
  String get cardFaresCheapest => 'Más baratos';

  @override
  String get cardFaresFastest => 'Más rápidos';

  @override
  String get cardFaresDirectOnly => 'Solo directos';

  @override
  String get cardFaresDirect => 'Directo';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n escalas',
      one: '1 escala',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Reservar';

  @override
  String cardFaresFromPrice(String price) {
    return 'desde $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n pasajeros',
      one: '1 pasajero',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n noches',
      one: '1 noche',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Económica';

  @override
  String get cardFaresPremium => 'Económica premium';

  @override
  String get cardFaresBusiness => 'Ejecutiva';

  @override
  String get cardFaresFirst => 'Primera clase';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Normalmente $low–$high para este viaje';
  }

  @override
  String get cardFaresLevelLow => 'Bajo ahora';

  @override
  String get cardFaresLevelTypical => 'Habitual ahora';

  @override
  String get cardFaresLevelHigh => 'Alto ahora';

  @override
  String cardFaresShowAll(int n) {
    return 'Mostrar los $n';
  }

  @override
  String get cardFaresShowFewer => 'Mostrar menos';

  @override
  String get cardFaresNoDirect => 'No hay vuelos directos en esta búsqueda.';

  @override
  String get cardFaresOutboundOnly =>
      'Los precios son para todo el viaje; elige el vuelo de regreso en Google Flights.';

  @override
  String get cardFaresSeeAll => 'Ver todos en Google Flights';

  @override
  String get cardFaresCheck =>
      'Los precios son para todos los pasajeros y se vuelven a comprobar en el sitio de reservas.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin en cabina, $checked documentadas';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama puede ganar una comisión si reservas mediante estos enlaces. No cambia el precio.';

  @override
  String cardFaresCompare(String site) {
    return 'Comparar en $site';
  }

  @override
  String get cardFaresWatch => 'Seguir precio';

  @override
  String cardFaresWatching(String date) {
    return 'Siguiendo · termina el $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Siguiendo para $price o menos · termina el $date';
  }

  @override
  String get cardFaresWatchStop => 'Detener';

  @override
  String get cardFaresWatchTitle => 'Seguir este precio';

  @override
  String get cardFaresWatchBody =>
      'Casama revisa este precio varias veces al día y te envía una notificación cuando baja. Se detiene por sí solo cuando pasa la fecha o a los 60 días.';

  @override
  String get cardFaresWatchTarget => 'Avísame cuando baje de (opcional)';

  @override
  String get cardFaresWatchAnyDrop =>
      'Déjalo vacío para cualquier baja importante';

  @override
  String get cardFaresWatchStart => 'Seguir';

  @override
  String get cardFaresWatchStarted =>
      'Siguiendo este precio. Recibirás una notificación cuando baje.';

  @override
  String get cardFaresWatchStopped => 'Se dejó de seguir este precio.';

  @override
  String get cardFaresWatchFull =>
      'Ya estás siguiendo 10 precios. Detén uno primero en Ajustes → Tarjetas.';

  @override
  String get cardFaresWatchFailed =>
      'No se pudo cambiar el seguimiento del precio. Inténtalo de nuevo.';

  @override
  String get cardFaresFlagSeparate => 'Tickets separados';

  @override
  String get cardFaresFlagOvernight => 'Escala nocturna';

  @override
  String get cardFaresFlagAirport => 'Cambia de aeropuerto';

  @override
  String get cardFaresFlagShort => 'Escala corta';

  @override
  String get cardFaresFlagLong => 'Escala larga';

  @override
  String get cardFaresNoteSeparate =>
      'Aerolíneas distintas en un tramo, así que pueden ser tickets separados. Si pierdes la conexión, el siguiente vuelo podría no estar cubierto. Revísalo en el sitio de reservas.';

  @override
  String get cardFaresNoteOvernight => 'Una escala dura toda la noche.';

  @override
  String get cardFaresNoteAirport => 'Una conexión sale desde otro aeropuerto.';

  @override
  String get cardFaresNoteShort => 'Una escala dura menos de una hora.';

  @override
  String get cardFaresNoteLong => 'Una escala dura más de 8 horas.';

  @override
  String get cardFaresOutbound => 'Ida';

  @override
  String get cardFaresReturn => 'Regreso';

  @override
  String cardFaresEmissions(int kg) {
    return 'Aproximadamente $kg kg de CO₂ por pasajero';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return 'Escala de $time en $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'el siguiente vuelo sale de $place';
  }

  @override
  String get cardFaresViewFailed => 'No se pudieron cargar estas tarifas.';

  @override
  String get cardFaresTryAgain => 'Reintentar';

  @override
  String get cardFaresMorning => 'Mañana';

  @override
  String get cardFaresAfternoon => 'Tarde';

  @override
  String get cardFaresEvening => 'Noche';

  @override
  String get cardFaresNight => 'Madrugada';

  @override
  String get cardFaresTime => 'Hora';

  @override
  String get cardFaresAirlines => 'Aerolíneas';

  @override
  String get cardFaresBagIncluded => 'Equipaje incluido';

  @override
  String get cardFaresNoMatch => 'Ningún vuelo coincide con estos filtros.';

  @override
  String get cardFaresOpenInChat => 'Abrir en el chat';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Mostrar vuelos $route el $date';
  }

  @override
  String get cardFaresEdit => 'Editar búsqueda';

  @override
  String get cardFaresDetails => 'Detalles';

  @override
  String get cardFaresSinceStart => 'desde que empezaste a seguirlo';

  @override
  String get cardFareCalOneWay => 'Solo ida';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Regresar después de $n noches',
      one: 'Regresar después de 1 noche',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Bajas';

  @override
  String get cardFareCalUsual => 'Habituales';

  @override
  String get cardFareCalHigh => 'Altas';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Más barato: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Ver tarifas';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: sin precio';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'Desde $from · a cualquier lugar';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'Desde $from · al extranjero';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'Desde $from · mismo país';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'menos de $price';
  }

  @override
  String get cardFlightSearchTitle => 'Buscar vuelos';

  @override
  String get cardFlightSearchReturn => 'Ida y vuelta';

  @override
  String get cardFlightSearchOneWay => 'Solo ida';

  @override
  String get cardFlightSearchFrom => 'Origen';

  @override
  String get cardFlightSearchTo => 'Destino';

  @override
  String get cardFlightSearchPlaceHint => 'Ciudad o aeropuerto';

  @override
  String get cardFlightSearchAnywhere => 'Cualquier lugar';

  @override
  String get cardFlightSearchSwap => 'Intercambiar lugares';

  @override
  String get cardFlightSearchPickDates => 'Elegir fechas';

  @override
  String get cardFlightSearchPickDate => 'Elegir una fecha';

  @override
  String get cardFlightSearchWholeMonth => 'Todo el mes';

  @override
  String get cardFlightSearchNights => 'Noches de viaje';

  @override
  String get cardFlightSearchAdults => 'Adultos';

  @override
  String get cardFlightSearchChildren => 'Menores (2 a 11)';

  @override
  String get cardFlightSearchInfants => 'Bebés (menores de 2)';

  @override
  String get cardFlightSearchNotNow => 'Ahora no';

  @override
  String get cardFlightSearchSent => 'Buscando…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Vuelos $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Más barato ahora';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Los últimos $n días',
      one: 'El último día',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'de $low a $high';
  }

  @override
  String get cardFareTrendNote =>
      'Estos han sido los precios, no un pronóstico. Pueden cambiar en cualquier momento.';

  @override
  String get cardFareWatchesTitle => 'Seguimientos de precios';

  @override
  String get cardFareWatchesNone =>
      'No estás siguiendo tarifas. Toca Seguir precio en una tarjeta de tarifas para empezar.';

  @override
  String get cardFareWatchesNoPrice => 'Sin precio todavía';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Objetivo: $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Cualquier baja importante';

  @override
  String cardFareWatchesLow(String price) {
    return 'más bajo $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'termina el $date';
  }

  @override
  String get cardsFareWatches => 'Seguimientos de precios';

  @override
  String get cardsFareWatchesNone =>
      'No hay seguimientos de precios. Toca Seguir precio en una tarjeta de vuelos para recibir una notificación cuando baje.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Ahora $price · termina el $date';
  }

  @override
  String get cardFromBot => 'Escrito por el bot; puede equivocarse';

  @override
  String get cardFullRecipe => 'Receta completa';

  @override
  String get cardGate => 'Puerta';

  @override
  String get cardGo => 'Empezar';

  @override
  String get cardHeads => 'Cara';

  @override
  String get cardHolidays => 'Días feriados';

  @override
  String get cardHoursShort => 'horas';

  @override
  String get cardHumidity => 'Humedad';

  @override
  String get cardItsTime => '¡Es hora!';

  @override
  String get cardJustNow => 'justo ahora';

  @override
  String get cardLast24h => 'Últimas 24 horas';

  @override
  String get cardLast30Days => 'Últimos 30 días';

  @override
  String get cardListen => 'Escuchar';

  @override
  String get cardLiveNow => 'Ahora mismo';

  @override
  String get cardLongWeekend => 'Fin de semana largo';

  @override
  String get cardLostShort => 'P';

  @override
  String get cardMarket24h => '24/7';

  @override
  String get cardMarketCap => 'Cap. de mercado';

  @override
  String get cardMarketClosed => 'Cerrado';

  @override
  String get cardMarketOpen => 'Abierto';

  @override
  String get cardMarketPost => 'Fuera de horario';

  @override
  String get cardMarketPre => 'Preapertura';

  @override
  String get cardMessage => 'Mensaje';

  @override
  String get cardMinutesShort => 'min';

  @override
  String get cardMoonFirstQuarter => 'Cuarto creciente';

  @override
  String get cardMoonFull => 'Luna llena';

  @override
  String get cardMoonLastQuarter => 'Cuarto menguante';

  @override
  String get cardMoonNew => 'Luna nueva';

  @override
  String get cardMoonWaningCrescent => 'Luna menguante';

  @override
  String get cardMoonWaningGibbous => 'Gibosa menguante';

  @override
  String get cardMoonWaxingCrescent => 'Luna creciente';

  @override
  String get cardMoonWaxingGibbous => 'Gibosa creciente';

  @override
  String get cardMore => 'Más';

  @override
  String get cardNext24h => 'Próximas 24 horas';

  @override
  String get cardNoAlerts => 'Sin alertas';

  @override
  String get cardNoAlertsLong =>
      'No hay avisos meteorológicos vigentes aquí en este momento.';

  @override
  String get cardNoChart => 'Sin gráfica para este rango';

  @override
  String get cardNoGames => 'Sin partidos';

  @override
  String get cardNoHolidays => 'No quedan más días feriados este año.';

  @override
  String get cardNoQuakes => 'No hubo sismos de esa magnitud recientemente.';

  @override
  String get cardNoStorms => 'Ninguna activa';

  @override
  String get cardNoStormsLong =>
      'No hay tormentas tropicales activas en este momento.';

  @override
  String get cardNotAdvice => 'No es asesoría financiera';

  @override
  String get cardNow => 'Ahora';

  @override
  String get cardNutritionFacts => 'Información nutricional';

  @override
  String get cardOpen => 'Abrir';

  @override
  String get cardOpenSource => 'Abrir la fuente';

  @override
  String get cardParcel => 'Envío';

  @override
  String get cardParcelDelivered => 'Entregado';

  @override
  String get cardParcelInTransit => 'En camino';

  @override
  String get cardParcelOrdered => 'Etiqueta creada';

  @override
  String get cardParcelOut => 'En reparto';

  @override
  String get cardParcelProblem => 'Problema';

  @override
  String get cardParcelNoLive =>
      'No hay estado en vivo para este número aquí. La página de la paquetería tiene lo más reciente.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Rastrear en $site';
  }

  @override
  String get cardPin => 'Fijar en widgets';

  @override
  String get cardPinFailed => 'No se pudo fijar esta tarjeta';

  @override
  String get cardPinned => 'Fijado en tus widgets';

  @override
  String get cardPinnedWaiting =>
      'Fijado. Permite que este bot aparezca en tus widgets para verlo ahí';

  @override
  String get cardPlayedShort => 'PJ';

  @override
  String get cardPointsShort => 'Pts';

  @override
  String get cardPrevClose => 'Cierre ant.';

  @override
  String get cardPros => 'Pros';

  @override
  String get cardProsCons => 'Pros y contras';

  @override
  String get cardQuiz => 'Cuestionario';

  @override
  String get cardRain => 'Lluvia';

  @override
  String get cardRainChance => 'Probabilidad de lluvia';

  @override
  String get cardRandom => 'Aleatorio';

  @override
  String get cardReadMore => 'Leer más';

  @override
  String get cardReferenceRates =>
      'Tipos de cambio de referencia del banco central, publicados a diario';

  @override
  String get cardRefresh => 'Actualizar';

  @override
  String get cardReport => 'Reportar dato erróneo';

  @override
  String get cardReported => 'Gracias, lo revisaremos';

  @override
  String get cardSameTime => 'misma hora';

  @override
  String get cardScores => 'Marcadores';

  @override
  String get cardSecondsShort => 's';

  @override
  String get cardServings => 'Porciones';

  @override
  String get cardShareImage => 'Compartir como imagen';

  @override
  String get cardStandings => 'Clasificación';

  @override
  String get cardStorms => 'Tormentas tropicales';

  @override
  String get cardSunMoon => 'Sol y luna';

  @override
  String get cardSunrise => 'Amanecer';

  @override
  String get cardSunset => 'Atardecer';

  @override
  String get cardSwap => 'Intercambiar';

  @override
  String get cardSynonyms => 'Similares:';

  @override
  String get cardTails => 'Cruz';

  @override
  String get cardTeam => 'Equipo';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Hora en cada lugar';

  @override
  String get cardTimeline => 'Cronología';

  @override
  String get cardToday => 'Hoy';

  @override
  String get cardTomorrow => 'Mañana';

  @override
  String get cardTranslation => 'Traducción';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Quitar de widgets';

  @override
  String get cardUnpinned => 'Se quitó de tus widgets';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'extremo';

  @override
  String get cardUvHigh => 'alto';

  @override
  String get cardUvLow => 'bajo';

  @override
  String get cardUvModerate => 'moderado';

  @override
  String get cardUvVeryHigh => 'muy alto';

  @override
  String get cardVolume => 'Volumen';

  @override
  String get cardWatchlist => 'Lista de seguimiento';

  @override
  String get cardWeather => 'Clima';

  @override
  String get cardWeatherAlerts => 'Alertas meteorológicas';

  @override
  String get cardWebsite => 'Sitio web';

  @override
  String get cardWind => 'Viento';

  @override
  String get cardWonShort => 'G';

  @override
  String get cardWorldClock => 'Reloj mundial';

  @override
  String get cardYesterday => 'Ayer';

  @override
  String get cardQuakesWorld => 'Sismos más fuertes de hoy';

  @override
  String cardMinutesAgo(int n) {
    return 'hace $n min';
  }

  @override
  String cardHoursAgo(int n) {
    return 'hace $n h';
  }

  @override
  String cardStale(String ago) {
    return 'No se pudo actualizar · de hace $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Actualizado $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Retrasado $minutes min';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'Máx. $high  Mín. $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Sensación $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n días';
  }

  @override
  String cardUntil(String when) {
    return 'Hasta $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n alertas vigentes',
      one: '1 alerta vigente',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Principalmente $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Polen de aliso',
      'birch': 'Polen de abedul',
      'grass': 'Polen de gramíneas',
      'mugwort': 'Polen de artemisa',
      'olive': 'Polen de olivo',
      'ragweed': 'Polen de ambrosía',
      'other': 'Polen',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h h $m min';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Hora dorada desde las $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct% iluminada';
  }

  @override
  String cardMoonrise(String time) {
    return 'Sale a las $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Se pone a las $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Cambio en $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up suben · $down bajan';
  }

  @override
  String cardRatesOf(String date) {
    return 'Tipos de cambio del $date';
  }

  @override
  String cardAtTime(String when) {
    return 'A las $when';
  }

  @override
  String cardInDays(int n) {
    return 'en $n días';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct% del recorrido';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Sismos cerca de $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sismos',
      one: '1 sismo',
      zero: 'Ninguno',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '$depth de profundidad';
  }

  @override
  String cardAway(String distance) {
    return 'a $distance';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n activas',
      one: '1 activa',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return 'Alerta $level';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n partidos',
      one: '1 partido',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n en vivo';
  }

  @override
  String cardMinutes(int n) {
    return '$n min';
  }

  @override
  String cardExpected(String date) {
    return 'Previsto para el $date';
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
      other: '$n pasos',
      one: '1 paso',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Victorias: $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Porción: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed de $total comprobaciones aprobadas';
  }

  @override
  String cardTotal(int n) {
    return 'Total $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Después de $n años';
  }

  @override
  String get cardsSettingsTitle => 'Tarjetas';

  @override
  String get cardsSettingsRow =>
      'Ciudad de origen, unidades y fuentes de datos';

  @override
  String get cardsSettingsIntro =>
      'Los bots responden sobre el clima, precios, tipos de cambio, hora y más con tarjetas de datos reales actualizadas. Tu ciudad de origen se usa cuando preguntas sin indicar un lugar.';

  @override
  String get cardsSettingsSaveFailed =>
      'No se pudo guardar. Inténtalo de nuevo.';

  @override
  String get cardsHomeCity => 'Ciudad de origen';

  @override
  String get cardsHomeClear => 'Borrar';

  @override
  String get cardsHomeNone =>
      'Sin definir. Los bots usan la ciudad principal de tu zona horaria hasta que elijas una.';

  @override
  String get cardsHomeSearch => 'Buscar tu ciudad';

  @override
  String get cardsHomePrivacy =>
      'Solo se guarda la ciudad, nunca tu dirección; se envía a los servicios del clima como coordenadas aproximadas.';

  @override
  String get cardsUnits => 'Unidades';

  @override
  String get cardsTemperature => 'Temperatura';

  @override
  String get cardsWind => 'Viento';

  @override
  String get cardsRain => 'Lluvia';

  @override
  String get cardsDistance => 'Distancia';

  @override
  String get cardsPrices => 'Precios';

  @override
  String get cardsRedUp => 'Rojo significa suba';

  @override
  String get cardsRedUpHint =>
      'Muestra los precios en alza en rojo y los que bajan en verde, como los mercados de China, Japón y Corea.';

  @override
  String get cardsSources => 'Fuentes de datos';

  @override
  String get cardsSourcesIntro =>
      'Las tarjetas indican de dónde salieron sus datos y cuándo. Estos servicios los proporcionan:';

  @override
  String get cardFewerServings => 'Menos porciones';

  @override
  String get cardMoreServings => 'Más porciones';

  @override
  String get cropTitle => 'Mover y ajustar escala';

  @override
  String get cropDone => 'Listo';

  @override
  String get cropPosition => 'Posición de la imagen';

  @override
  String get cropMoveUp => 'Mover arriba';

  @override
  String get cropMoveDown => 'Mover abajo';

  @override
  String get cropMoveLeft => 'Mover a la izquierda';

  @override
  String get cropMoveRight => 'Mover a la derecha';

  @override
  String get cropRotate => 'Rotar';

  @override
  String get cropMirror => 'Reflejar';

  @override
  String get cropReset => 'Restablecer';

  @override
  String get cropZoom => 'Zoom';

  @override
  String get cropZoomIn => 'Acercar';

  @override
  String get cropZoomOut => 'Alejar';

  @override
  String get cropSoft => 'Muy ampliada: la imagen puede verse poco nítida';

  @override
  String get cropAnimatedStill => 'Las imágenes animadas quedan fijas';

  @override
  String get cropBackground => 'Fondo';

  @override
  String get cropBackgroundNone => 'Ninguno';

  @override
  String cropBackgroundBot(String name) {
    return 'Color de $name';
  }

  @override
  String get cropBackgroundWhite => 'Blanco';

  @override
  String get cropBackgroundBlack => 'Negro';

  @override
  String get cropUnreadable =>
      'Esta imagen no se puede abrir aquí. Prueba con un JPEG o PNG.';

  @override
  String cropTooBig(String size) {
    return 'Este archivo pesa $size, más del límite de 40 MB.';
  }

  @override
  String get botPicture => 'Imagen';

  @override
  String botPictureTitle(String name) {
    return 'Imagen de $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Cambiar la imagen de $name';
  }

  @override
  String get botPicturePaste => 'Pegar imagen';

  @override
  String get botPictureDraw => 'Crear una con IA';

  @override
  String get botPictureDrawHelp => 'Casama dibuja dos para elegir';

  @override
  String get botPictureRecrop => 'Volver a recortar';

  @override
  String get botPictureMascot => 'Usar una mascota en su lugar';

  @override
  String get botPictureRemove => 'Quitar imagen';

  @override
  String get botPictureRecent => 'Recientes';

  @override
  String get botPictureUpdated => 'Imagen actualizada';

  @override
  String get botPictureRemoved => 'Imagen quitada';

  @override
  String get botPictureFailed => 'No se pudo guardar la imagen';

  @override
  String botPictureDrop(String name) {
    return 'Suelta para usar como imagen de $name';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Usar como imagen de $name';
  }

  @override
  String get botPictureUseAsBot => 'Usar como imagen de un bot';

  @override
  String get botPictureWhichBot => '¿Qué bot recibe esta imagen?';

  @override
  String botDrawTitle(String name) {
    return 'Una imagen para $name';
  }

  @override
  String get botDrawIntro =>
      'Elige un estilo, agrega unas palabras si quieres y Casama dibuja dos imágenes para elegir.';

  @override
  String get botDrawDescribe => 'Descríbelo (opcional)';

  @override
  String get botDrawHint => 'Un búho amigable con lentes para leer';

  @override
  String get botDrawMake => 'Crear 2';

  @override
  String get botDrawMore => 'Crear 2 más';

  @override
  String get botDrawPick => 'Toca una para usarla';

  @override
  String get botDrawCost =>
      'Cada imagen usa créditos de imagen, como cualquier imagen que crea Casama.';

  @override
  String get botDrawWorking => 'Dibujando…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '3D suave';

  @override
  String get botDrawStyleWatercolor => 'Acuarela';

  @override
  String get botDrawStyleFlat => 'Ícono plano';

  @override
  String get botDrawStylePixel => 'Pixel art';

  @override
  String get botDrawStyleLine => 'Dibujo lineal';

  @override
  String get botDrawStylePhoto => 'Foto';

  @override
  String get sharePictureStays =>
      'Su imagen permanece en este espacio de trabajo: la copia recibe su mascota anterior o sus iniciales.';

  @override
  String savedResetRefills(String amount) {
    return 'Recarga $amount de créditos';
  }

  @override
  String get savedResetClearsDaily => 'Borra el límite de hoy';

  @override
  String get savedResetGivesHours => 'Devuelve horas de computadora';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count días',
      one: 'Queda 1 día',
      zero: 'Vence hoy',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Modelos';

  @override
  String get modelsRowHelp => 'Modelos de Casama o tus propias claves';

  @override
  String get modelsIntro =>
      'Elige si Casama ejecuta tus bots o conecta tus propias claves de modelo. Las claves se guardan cifradas y nunca se vuelven a mostrar.';

  @override
  String get whoRunsYourBots => 'Quién ejecuta tus bots';

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
      'Incluido con tu plan; usa créditos del espacio de trabajo';

  @override
  String get whoRunsCasamaOffHelp => 'En pausa en tu plan actual';

  @override
  String get whoRunsOwn => 'Tu propio proveedor';

  @override
  String get whoRunsOwnHelp =>
      'Facturado directamente por tu proveedor; no usa créditos de Casama';

  @override
  String get whoRunsCasamaShort => 'Modelos de Casama, incluidos con tu plan';

  @override
  String get whoRunsCasamaCost => 'Usa créditos';

  @override
  String get whoRunsOwnShort => 'Tus claves, facturadas por tu proveedor';

  @override
  String get whoRunsOwnCost => 'Sin créditos de Casama';

  @override
  String get whoRunsOwnNeedsKey =>
      'Para usar tu propio proveedor, agrega primero abajo una clave de chat de ese proveedor en Agregar una clave.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Elige abajo un modelo para esta clave para cambiar.';

  @override
  String get whoRunsAdminOnly =>
      'Solo los administradores del espacio de trabajo pueden cambiar quién ejecuta tus bots.';

  @override
  String get botModelSource => 'Fuente del modelo';

  @override
  String get botModelSourceWorkspace => 'Predeterminado del espacio de trabajo';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Una de tus claves';

  @override
  String get useCasamaFallback =>
      'Si falla mi proveedor, usar los modelos de Casama';

  @override
  String get useCasamaFallbackHelp =>
      'Cuando tu clave alcance un límite de velocidad o cuota, recurre a los modelos de Casama usando los créditos de tu espacio de trabajo.';

  @override
  String get keyCoversOpenRouter =>
      'Chat, imágenes, video, lectura en voz alta, mensajes de voz y dictado';

  @override
  String get keyCoversGoogle => 'Chat y llamadas en vivo';

  @override
  String get keyCoversOpenAi => 'Chat y búsqueda en la memoria';

  @override
  String get keyCoversChat => 'Chat';

  @override
  String get ownProviderPrivacyNote =>
      'Con tu propio proveedor, se aplican sus condiciones a lo que le envían tus bots. La configuración de no entrenamiento de Casama solo se aplica con la clave de Casama.';

  @override
  String get creditsOwnProviderNote =>
      'Los modelos con tu propio proveedor no usan créditos.';

  @override
  String get routineWaitingForModel => 'Esperando un modelo';

  @override
  String get ownProviderRequiredTitle =>
      'Conecta un modelo para seguir chateando';

  @override
  String get ownProviderRequiredBody =>
      'Los modelos de Casama no están disponibles en este plan ahora. Agrega tu propia clave de modelo o mejora tu plan.';

  @override
  String get modelNoToolsWarning =>
      'Este modelo no admite herramientas, así que el bot solo puede responder con texto.';

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
  String get appBrowserTitle => 'Navegador en este teléfono';

  @override
  String get appBrowserTitleMac => 'Navegador en esta Mac';

  @override
  String get appBrowserTitleLinux => 'Navegador en esta computadora';

  @override
  String get appBrowserTitleWindows => 'Navegador en esta PC';

  @override
  String get appBrowserHelp =>
      'Un pequeño navegador dentro de Casama que los bots que autorices pueden usar mientras observas, solo mientras tengas su chat abierto en este teléfono. Tus sesiones se quedan en este teléfono.';

  @override
  String get appBrowserHelpMac =>
      'Un pequeño navegador dentro de Casama que los bots que autorices pueden usar mientras observas, mientras Casama esté abierto en esta Mac. Tus sesiones se quedan en esta Mac.';

  @override
  String get appBrowserHelpLinux =>
      'Un pequeño navegador dentro de Casama que los bots que autorices pueden usar mientras observas, mientras Casama esté abierto en esta computadora. Tus sesiones se quedan en esta computadora.';

  @override
  String get appBrowserHelpWindows =>
      'Un pequeño navegador dentro de Casama que los bots que autorices pueden usar mientras observas, mientras Casama esté abierto en esta PC. Tus sesiones se quedan en esta PC.';

  @override
  String get appBrowserSwitchHelp =>
      'Los bots que autorices pueden abrir páginas aquí mientras su chat esté abierto en este teléfono.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Los bots que autorices pueden abrir páginas aquí mientras Casama esté abierto en esta Mac.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Los bots que autorices pueden abrir páginas aquí mientras Casama esté abierto en esta computadora.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Los bots que autorices pueden abrir páginas aquí mientras Casama esté abierto en esta PC.';

  @override
  String get appBrowserOn => 'Activado';

  @override
  String get appBrowserOff => 'Desactivado';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Desactivado: $reason';
  }

  @override
  String get appBrowserReasonOff => 'aún no disponible.';

  @override
  String get appBrowserReasonNotTester =>
      'por ahora solo para quienes prueban versiones anticipadas.';

  @override
  String get appBrowserReasonSystemOff =>
      'aún no disponible en este dispositivo.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'un administrador lo desactivó para este espacio de trabajo.';

  @override
  String get appBrowserReasonUnavailable =>
      'este servidor no tiene conexiones de dispositivos.';

  @override
  String get appBrowserReasonUnsupported =>
      'el navegador de este dispositivo no puede ejecutarlo.';

  @override
  String get appBrowserReasonNeedsMacos14 => 'requiere macOS 14 o posterior.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Instala WebKitGTK para usar el navegador aquí: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Instala o actualiza Microsoft Edge WebView2 para usar el navegador aquí.';

  @override
  String get appBrowserGetWebview2 => 'Obtener WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Emparejado en una instalación anterior. Actívalo de nuevo para emparejar este dispositivo.';

  @override
  String get appBrowserAllBots => 'Todos tus bots';

  @override
  String get appBrowserAllBotsHelp =>
      'Todos los bots con los que puedes chatear pueden usar este navegador. Desactívalo para elegir bots individuales.';

  @override
  String get appBrowserModeHeader => 'Cuando un bot necesita un navegador';

  @override
  String get appBrowserModeAlways => 'Siempre este dispositivo';

  @override
  String get appBrowserModeAlwaysHelp =>
      'Los bots abren cada página aquí mientras tengas su chat abierto. Su computadora se usa solo cuando lo pides.';

  @override
  String get appBrowserOpenTooltip => 'Abrir el navegador';

  @override
  String get appBrowserBotsBrowseHere => 'Los bots navegan aquí';

  @override
  String get appBrowserBotsBrowseHereHelp =>
      'Cada página de tus chats se abre en este navegador mientras observas';

  @override
  String get appBrowserModeAsk => 'Preguntar cuando ayude';

  @override
  String get appBrowserModeAskHelp =>
      'Ofrecer una opción cuando un sitio necesite tu inicio de sesión o bloquee la computadora del bot.';

  @override
  String get appBrowserModeComputer => 'Siempre la computadora del bot';

  @override
  String get appBrowserModeComputerHelp =>
      'No ofrecer nunca el navegador de este dispositivo a menos que lo pidas en el chat.';

  @override
  String get appBrowserModeDevice => 'Preferir este dispositivo';

  @override
  String get appBrowserModeDeviceHelp =>
      'Usar el navegador de este dispositivo para inicios de sesión y sitios bloqueados sin preguntar.';

  @override
  String get appBrowserNeverAsk => 'Computadora del bot (no preguntar)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Computadora Linux';

  @override
  String get appBrowserDeviceWindows => 'PC con Windows';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting =>
      'Esperándote. Deja este chat abierto para continuar en tu navegador.';

  @override
  String browserWaitingSite(String site) {
    return 'Esperándote. Deja este chat abierto para continuar con $site en tu navegador.';
  }

  @override
  String get browserWaitEnded => 'Se dejó de esperar tu navegador.';

  @override
  String get browserHandBackWaiting =>
      'Es tu turno en el navegador. Completa el paso en la página y luego toca Devolver el control.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Es tu turno en $site. Completa el paso en la página y luego toca Devolver el control.';
  }

  @override
  String get browserHandBackEnded =>
      'Se dejó de esperar a que devolvieras el control del navegador.';

  @override
  String get browserChoiceCardLabel => 'Elección de navegador';

  @override
  String browserChoiceTitle(String bot, String site) {
    return '¿Dónde debería abrir $site $bot?';
  }

  @override
  String get browserChoiceSubtitleSignIn =>
      'Este sitio requiere que inicies sesión.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Este sitio impidió el acceso a la computadora de $bot.';
  }

  @override
  String get browserChoiceOnPhone => 'En este teléfono';

  @override
  String get browserChoiceOnMac => 'En esta Mac';

  @override
  String get browserChoiceOnLinux => 'En esta computadora';

  @override
  String get browserChoiceOnWindows => 'En esta PC';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Tú miras y puedes iniciar sesión personalmente. Lo que lee va a la IA.';

  @override
  String get browserChoiceInChrome => 'En tu Chrome';

  @override
  String get browserChoiceInChromeHelp =>
      'Con sesión ya iniciada en tus sitios.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'En la computadora de $bot';
  }

  @override
  String get browserChoiceOnComputerHelp => 'Sigue funcionando si sales.';

  @override
  String browserChoiceRemember(String site) {
    return 'Recordar para $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return 'Se abrió $site en este teléfono';
  }

  @override
  String browserChoicePickedMac(String site) {
    return 'Se abrió $site en esta Mac';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return 'Se abrió $site en esta computadora';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return 'Se abrió $site en esta PC';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return 'Se abrió $site en tu Chrome';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return 'Se abrió $site en la computadora de $bot';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Sin respuesta a tiempo; permaneció en la computadora de $bot';
  }

  @override
  String get appBrowserConsentTitle =>
      '¿Permitir que los bots usen el navegador en Casama?';

  @override
  String get appBrowserConsentPages =>
      'Las páginas que un bot lee aquí se envían a Casama y al modelo de IA del bot, igual que las páginas que lee en su propia computadora.';

  @override
  String get appBrowserConsentSignIns =>
      'Tus inicios de sesión se quedan en este dispositivo. Los bots nunca ven contraseñas, números de tarjeta ni códigos; tú los escribes.';

  @override
  String get appBrowserConsentWatch =>
      'Funciona solo mientras tengas abierto aquí el chat del bot. Puedes observar, tomar el control o detenerlo en cualquier momento.';

  @override
  String get appBrowserConsentYours =>
      'Lo que navegas por tu cuenta nunca se envía a ningún lado.';

  @override
  String get appBrowserBots => 'Bots que pueden usarlo';

  @override
  String get appBrowserBotsHelp =>
      'Solo los bots activados aquí pueden usar el navegador en este dispositivo.';

  @override
  String get appBrowserNoBots => 'Todavía no hay bots.';

  @override
  String get appBrowserSites => 'Sitios';

  @override
  String get appBrowserSitesHelp =>
      'Sitios en los que respondiste Siempre o Nunca. Quita uno para que te pregunte otra vez la próxima vez.';

  @override
  String get appBrowserNoSites =>
      'Todavía no hay sitios. Un bot pregunta la primera vez que abre un sitio.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Quitar $site';
  }

  @override
  String get appBrowserKinds => 'Sitios que permanecen desactivados';

  @override
  String get appBrowserKindsHelp =>
      'Estos tipos de sitios permanecen desactivados a menos que los actives. Cuando uno está activado, un bot igual pregunta siempre.';

  @override
  String get appBrowserKindBanking => 'Banca y pagos';

  @override
  String get appBrowserKindHealth => 'Salud';

  @override
  String get appBrowserKindPasswords => 'Administradores de contraseñas';

  @override
  String get appBrowserKindGovernment => 'Gobierno e identidad';

  @override
  String get appBrowserSignIn => 'Iniciar sesión en un sitio';

  @override
  String get appBrowserSignInHelp =>
      'Abre un sitio, inicia sesión y luego deja que tus bots lo usen. Nada de lo que hagas allí se envía a ningún lado.';

  @override
  String get appBrowserClearData => 'Borrar datos de navegación';

  @override
  String get appBrowserClearDataHelp =>
      'Cierra la sesión de este navegador en todos los sitios y borra lo que guardaron.';

  @override
  String get appBrowserClearDataConfirm =>
      '¿Borrar las sesiones y los datos de sitios de este navegador?';

  @override
  String get appBrowserClearDataDone => 'Datos de navegación borrados';

  @override
  String get appBrowserUnpair => 'Desvincular este dispositivo';

  @override
  String get appBrowserUnpairConfirm =>
      '¿Desvincular el navegador de este dispositivo? Los bots no podrán usarlo hasta que lo actives de nuevo.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot está trabajando';
  }

  @override
  String get appBrowserTakeOver => 'Tomar el control';

  @override
  String get appBrowserHandBack => 'Devolver el control';

  @override
  String get appBrowserYourTurn => 'Tu turno';

  @override
  String appBrowserPaused(String bot) {
    return '$bot está en pausa mientras usas la página';
  }

  @override
  String get appBrowserAway => 'En pausa: el chat no está abierto';

  @override
  String appBrowserDone(String bot) {
    return '$bot ha terminado';
  }

  @override
  String appBrowserDoneFailed(String bot) {
    return '$bot se detuvo antes de terminar';
  }

  @override
  String get appBrowserDoneHint =>
      'La respuesta está en tu chat. Esta página sigue abierta por si quieres echar un vistazo.';

  @override
  String get appBrowserBackToChat => 'Volver al chat';

  @override
  String get appBrowserStayHere => 'Quedarme aquí';

  @override
  String get appBrowserAddress => 'Dirección del sitio';

  @override
  String get appBrowserBack => 'Atrás';

  @override
  String get appBrowserForward => 'Adelante';

  @override
  String get appBrowserReload => 'Volver a cargar';

  @override
  String get appBrowserAllowSite => 'Permitir que mis bots usen este sitio';

  @override
  String appBrowserSiteAdded(String site) {
    return 'Se agregó $site. Tus bots pueden usarlo aquí.';
  }

  @override
  String get appBrowserAddressRefused =>
      'No se puede abrir esa dirección aquí.';

  @override
  String get appBrowserSecure => 'Conexión segura';

  @override
  String get appBrowserNotSecure => 'No es seguro';

  @override
  String get appBrowserCardLabel => 'Navegador integrado';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot quiere abrir $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'En Casama en este dispositivo, con tus sesiones. Siempre le permite abrir este sitio de ahora en adelante.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'En esta Mac, con tus sesiones. Siempre le permite abrir este sitio de ahora en adelante.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'En esta computadora, con tus sesiones. Siempre le permite abrir este sitio de ahora en adelante.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'En esta PC, con tus sesiones. Siempre le permite abrir este sitio de ahora en adelante.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Los sitios de banca y pagos piden permiso cada vez.',
      'health': 'Los sitios de salud piden permiso cada vez.',
      'passwords': 'Los sitios de administradores de contraseñas piden permiso cada vez.',
      'government':
          'Los sitios de identificación oficial piden permiso cada vez.',
      'other': 'Estos sitios piden permiso cada vez.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Una vez';

  @override
  String get appBrowserAlways => 'Siempre';

  @override
  String get appBrowserNever => 'Nunca';

  @override
  String appBrowserStepAskTitle(String bot) {
    return '¿Permitir que $bot haga esto?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'En Casama en este dispositivo, con tus sesiones.';

  @override
  String get appBrowserStepAskHelpMac => 'En esta Mac, con tus sesiones.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'En esta computadora, con tus sesiones.';

  @override
  String get appBrowserStepAskHelpWindows => 'En esta PC, con tus sesiones.';

  @override
  String appBrowserStepClick(String name) {
    return 'Tocar “$name”';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Escribir en “$name”';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Presionar una tecla en “$name”';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Subir un archivo a “$name”';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'No permitir';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Teléfono Android';

  @override
  String get toolOnThisPhone => 'en este dispositivo';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bots en los navegadores integrados de miembros';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Los miembros pueden permitir que los bots usen un navegador dentro de Casama en su teléfono o computadora mientras observan.';

  @override
  String appBrowserAwaySummary(String bot, int steps) {
    String _temp0 = intl.Intl.pluralLogic(
      steps,
      locale: localeName,
      other: '$steps pasos',
      one: '1 paso',
    );
    return '$bot siguió avanzando mientras no estabas · $_temp0';
  }

  @override
  String appBrowserNeedsYouTitle(String bot) {
    return '$bot te necesita';
  }

  @override
  String get appBrowserNeedsYouBody => 'Abre Casama para continuar.';

  @override
  String appBrowserStillUsingTitle(String bot) {
    return '$bot sigue usando tu navegador';
  }

  @override
  String get appBrowserStillUsingBody => 'Vuelve para que pueda terminar.';

  @override
  String appBrowserFinishedTitle(String bot) {
    return '$bot terminó';
  }

  @override
  String appBrowserFinishedOnSiteTitle(String bot, String site) {
    return '$bot terminó en $site';
  }

  @override
  String get appBrowserFinishedBody => 'Toca para ver.';

  @override
  String get appBrowserKeepGoing => 'Seguir cuando salgo de la app';

  @override
  String get appBrowserKeepGoingHelp =>
      'Termina tareas del navegador en segundo plano con una notificación silenciosa (hasta 10 min, se pausa con batería baja).';

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
  String get vendorRenewalUsd => 'Lo que cuesta una renovación (USD)';

  @override
  String get vendorRenewalMonths => 'Meses que cubre una renovación';

  @override
  String get vendorSeeSpend => 'Ver gasto';

  @override
  String get costSpent => 'Gastado';

  @override
  String get costCharged => 'Cobrado';

  @override
  String get costMargin => 'Margen';

  @override
  String get costMarginNone => 'No se cobró nada';

  @override
  String get costNotRecorded => 'Sin registrar';

  @override
  String get costNotRecordedHint =>
      'Muestra qué significa esto y de qué servicios se trata';

  @override
  String get costNotRecordedHelp =>
      'Algunos servicios reportan su propio total. Cuando el suyo es mayor que lo que registró este servidor, la diferencia aparece aquí. Es gasto real que todavía no está vinculado a ninguna función, clave o espacio de trabajo.';

  @override
  String get costNotRecordedWhy =>
      'Lo que reportan los servicios por encima de esto';

  @override
  String get costNotRecordedNone =>
      'Coincide con lo que reportan los servicios';

  @override
  String get costNotRecordedAllMatch =>
      'Cada servicio que reporta un total coincide con lo que registró este servidor.';

  @override
  String get costNotRecordedNoList =>
      'La lista de servicios no está disponible ahora. Inténtalo en un momento.';

  @override
  String get costNoVendorFigures => 'Ningún servicio reportó un total';

  @override
  String get costNoVendorFiguresHelp =>
      'Ningún servicio reportó su propio total en este período, así que no hay con qué comparar.';

  @override
  String costNoFigureFrom(String names) {
    return 'Sin total de: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count servicios',
      one: '1 servicio',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Ellos dicen $theirs · registramos $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Ellos dicen $theirs · registramos $ours · $gap sin registrar';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Ellos dicen $theirs · registramos $ours · no falta nada';
  }

  @override
  String get costNoVendorFigure =>
      'Este servicio no informó ningún total propio en este período.';

  @override
  String get costNoVendorFigureKind =>
      'Este servicio no reporta un total propio.';

  @override
  String costUpdated(String when) {
    return 'Actualizado $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'frente a los $days días anteriores',
      one: 'frente al día anterior',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'sin período anterior para comparar';

  @override
  String get costChangeNew => 'Nuevo';

  @override
  String get costChangeNewSpoken => 'nuevo en este período';

  @override
  String get costChangeFlat => 'sin cambios';

  @override
  String costChangeUp(String amount) {
    return 'subió $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'bajó $amount';
  }

  @override
  String costPoints(String count) {
    return '$count pts';
  }

  @override
  String get costOther => 'Otro';

  @override
  String get costNotLabelled => 'Sin etiqueta';

  @override
  String get costNotLabelledHelp =>
      'Estos costos se registraron sin una etiqueta para esta agrupación, así que no se pueden desglosar más. Igual forman parte del total.';

  @override
  String get costGroupService => 'Servicio';

  @override
  String get costGroupKey => 'Clave';

  @override
  String get costGroupApp => 'Apps y MCP';

  @override
  String get costGroupFeature => 'Función';

  @override
  String get costGroupModel => 'Modelo';

  @override
  String get costGroupWorkspace => 'Espacio de trabajo';

  @override
  String get costGroupBy => 'Agrupar por';

  @override
  String get costFilters => 'Filtros';

  @override
  String get costNoFilters =>
      'Ninguno. Abre una fila y elige Mostrar en la tabla para acotar la vista.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Quitar filtro $name';
  }

  @override
  String get costIncludeFixed => 'Incluir cargos fijos';

  @override
  String get costIncludeFixedHelp =>
      'Suma suscripciones y renovaciones a Gastado, repartidas de manera uniforme entre los días que cubren.';

  @override
  String get costOptions => 'Período y filtros';

  @override
  String get costPeriod => 'Período';

  @override
  String costPeriodDays(int days) {
    return '$days días';
  }

  @override
  String get costPeriodCustom => 'Personalizado';

  @override
  String costLastDays(int days) {
    return 'Últimos $days días';
  }

  @override
  String get costChangeDates => 'Cambiar fechas';

  @override
  String get costDone => 'Listo';

  @override
  String get costDaysUtc => 'Los días están en UTC.';

  @override
  String get costDailySpend => 'Gasto diario';

  @override
  String costStackedBy(String group) {
    return 'Apilado por $group: los mayores primero, luego Otro.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Gráfica de gasto diario, $days días, $total en total. El día más alto fue $peakDay con $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Gráfica de gasto diario, $days días, sin gastos.';
  }

  @override
  String get costSourceMetered => 'Medido';

  @override
  String get costSourceCounted => 'Contado';

  @override
  String get costSourceFixed => 'Fijo';

  @override
  String get costSourceEstimated => 'Estimado';

  @override
  String get costSourceMeteredHelp =>
      'Un costo real registrado para cada llamada.';

  @override
  String get costSourceCountedHelp =>
      'El conteo propio de este servidor multiplicado por un precio unitario.';

  @override
  String get costSourceFixedHelp =>
      'Un cargo repartido de manera uniforme entre los días que cubre.';

  @override
  String get costSourceEstimatedHelp =>
      'Calculado según la longitud del texto. El costo real es al menos este.';

  @override
  String get costEstimated => 'estimado';

  @override
  String get costColShare => 'Porcentaje';

  @override
  String get costColChange => 'Cambio';

  @override
  String get costColCalls => 'Llamadas';

  @override
  String get costColSource => 'Fuente';

  @override
  String get costColFailed => 'Fallidas';

  @override
  String get costColFees => 'Comisiones de proveedores';

  @override
  String get costColTokens => 'Costo de tokens';

  @override
  String get costTokenCost => 'Costo de tokens';

  @override
  String get costFailureRate => 'Tasa de fallos';

  @override
  String costSortBy(String column) {
    return 'Ordenar por $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, ordenado de menor a mayor';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, ordenado de mayor a menor';
  }

  @override
  String get costOpenRowHint => 'Abre los detalles';

  @override
  String costSpokenSpent(String amount) {
    return 'gastado $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'comisiones de proveedores $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share del total';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count llamadas';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate fallidas';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'costo estimado de tokens $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'cobrado $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count llamadas';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate fallidas';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount tokens, estimado';
  }

  @override
  String get costOpenBilling => 'Abrir página de facturación';

  @override
  String get costByDay => 'Por día';

  @override
  String get costSplitBy => 'Dividir por';

  @override
  String get costShowInTable => 'Mostrar en la tabla';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Acota la tabla a $name y la agrupa por $group.';
  }

  @override
  String get costNothingRecorded => 'No se registró nada aquí en este período.';

  @override
  String costLastUsed(String when) {
    return 'último uso $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Y $count más. Muéstralos en la tabla.',
      one: 'Y 1 más. Muéstralo en la tabla.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Para qué sirve';

  @override
  String get costKeyService => 'Servicio';

  @override
  String get costKeySetting => 'Ajuste';

  @override
  String get costKeySetIn => 'Dónde está configurada';

  @override
  String get costKeyVault => 'Elemento del almacén';

  @override
  String get costKeyStatus => 'Estado';

  @override
  String get costKeyConfigured => 'Configurada';

  @override
  String get costKeyNotConfigured => 'Sin configurar';

  @override
  String get costKeyLastUsed => 'Último uso';

  @override
  String get costKeyNotUsed => 'No en este período';

  @override
  String get costKeyCap => 'Tope de gasto';

  @override
  String costKeyCapLeft(String left, String cap) {
    return 'Queda $left de $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share del tope usado';
  }

  @override
  String get costKeyNoCap => 'Ninguno';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'No se gastó nada en estos $days días',
      one: 'No se gastó nada en este día',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'No se gastó nada en estos días';

  @override
  String get costEmptyFiltered =>
      'No se gastó nada que coincida con estos filtros';

  @override
  String get costEmptyGroup => 'Nada que mostrar para esta agrupación';

  @override
  String get costAppsNote =>
      'Apps y servidores MCP: Gastado es lo que facturó el proveedor. Costo de tokens es una estimación de lo que costaron sus resultados en tokens del modelo y ya forma parte del gasto en modelos.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount en cargos fijos de este período queda fuera. Activa Incluir cargos fijos para sumarlo.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Los espacios de trabajo pagaron $amount con sus propias claves. Ese dinero no es de este servidor, así que queda fuera.';
  }

  @override
  String get costOlderServerTitle => 'Este servidor necesita actualizarse';

  @override
  String get costOlderServer =>
      'Los costos por servicio, clave y app llegan en una versión más nueva del servidor. Actualiza el servidor y vuelve a comprobar.';

  @override
  String get costCheckAgain => 'Comprobar de nuevo';

  @override
  String get costSpendCardTitle => 'Gasto, últimos 30 días';

  @override
  String get costSpendCardOpen => 'Costos';

  @override
  String get costSpendCardHint => 'Abre la pestaña Costos';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Gasto en los últimos 30 días: $spent gastados, $charged cobrados, $margin de margen';
  }

  @override
  String get costSort => 'Ordenar por';

  @override
  String get costSortName => 'Nombre';

  @override
  String get costByWorkspace => 'Por espacio de trabajo';

  @override
  String get costTopTools => 'Herramientas más usadas';

  @override
  String get costToolList => 'Lista de herramientas enviada al modelo';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Y $count herramientas más.',
      one: 'Y 1 herramienta más.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Usar el bot de Telegram de Casama';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Habla con $bot en Telegram. Un toque, sin configurar nada.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Tu Telegram está conectado en otro espacio de trabajo. Conectarlo aquí lo mueve.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Tus mensajes allí van a $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Tus mensajes allí van a $other. Toca para enviarlos a $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Los mensajes de Telegram ahora van a $bot.';
  }

  @override
  String get telegramFinish => 'Terminar en Telegram';

  @override
  String get telegramFinishHelp =>
      'Presiona Iniciar en Telegram. Haz esto solo en tu propia cuenta de Telegram. Se actualiza cuando estés conectado.';

  @override
  String get telegramOpenAgain => 'Abrir Telegram de nuevo';

  @override
  String get telegramConnected => 'Telegram está conectado';

  @override
  String telegramConnectedHelp(String name) {
    return 'Conectado como $name. Escribe al bot en Telegram cuando quieras; el chat también aparece aquí en General.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Escribe al bot en Telegram cuando quieras; el chat también aparece aquí en General.';

  @override
  String get telegramConnect => 'Conectar Telegram';

  @override
  String get telegramDisconnect => 'Desconectar Telegram';

  @override
  String get telegramDisconnectConfirm => '¿Desconectar Telegram?';

  @override
  String get telegramDisconnectHelp =>
      'Tus bots dejan de responder en Telegram. Tu historial de chats permanece aquí.';

  @override
  String get telegramPickBot => 'Los mensajes de Telegram van a';

  @override
  String get telegramNeedsBot =>
      'Crea un bot primero y luego conecta Telegram.';

  @override
  String get telegramNotOffered =>
      'Este servidor no tiene un bot propio de Telegram. Puedes conectar tu propio bot desde Apps de chat de un bot.';

  @override
  String get chatAppsSettingsHelp =>
      'Habla con tus bots desde las apps de chat que ya usas. Los mensajes llegan a tu chat General, así que puedes continuar aquí.';

  @override
  String get chatAppsPerBot =>
      'El correo y tus propios bots se configuran por bot: abre un bot y luego Apps de chat.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack y más';

  @override
  String get chatAppsSlackHelp =>
      'Slack se agrega por espacio de trabajo de Slack, para un bot. Elige el bot y luego Agregar a Slack.';

  @override
  String get chatAppsSlackPickBot => 'Agregar Slack para';

  @override
  String get slackAnyoneInWorkspace =>
      'Cualquiera en este espacio de trabajo de Slack';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Todas las personas del espacio de trabajo pueden hablar con el bot, no solo quienes están en la lista. Las aprobaciones siguen requiriendo a alguien de la lista.';

  @override
  String get discordUseCasama => 'Usar el bot de Discord de Casama';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Habla con $bot en Discord. Inicia sesión con Discord una vez y luego escribe al bot o usa /ask en cualquier parte.';
  }

  @override
  String get discordOtherWorkspace =>
      'Tu Discord está conectado en otro espacio de trabajo. Conectarlo aquí lo mueve.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Los mensajes de Discord ahora van a $bot.';
  }

  @override
  String get discordFinish => 'Terminar en Discord';

  @override
  String get discordFinishHelp =>
      'Inicia sesión con Discord en tu navegador y autoriza a Casama. Haz esto solo con tu propia cuenta de Discord. Se actualiza cuando estés conectado.';

  @override
  String get discordOpenAgain =>
      'Abrir de nuevo el inicio de sesión de Discord';

  @override
  String get discordConnected => 'Discord está conectado';

  @override
  String discordConnectedHelp(String name) {
    return 'Conectado como $name. Escribe al bot de Casama en Discord o usa /ask en cualquier parte; el chat también aparece aquí en General.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Escribe al bot de Casama en Discord o usa /ask en cualquier parte; el chat también aparece aquí en General.';

  @override
  String get discordConnect => 'Conectar Discord';

  @override
  String get discordDisconnect => 'Desconectar Discord';

  @override
  String get discordDisconnectConfirm => '¿Desconectar Discord?';

  @override
  String get discordDisconnectHelp =>
      'Tus bots dejan de responder en Discord. Tu historial de chats permanece aquí.';

  @override
  String get discordPickBot => 'Los mensajes de Discord van a';

  @override
  String get discordNeedsBot => 'Crea un bot primero y luego conecta Discord.';

  @override
  String get discordNotOffered =>
      'Este servidor no tiene una app propia de Discord. Puedes conectar tu propia app de Discord desde Apps de chat de un bot.';

  @override
  String get inactiveAccountsNote =>
      'Si dejas de usar Casama: después de 30 días, tus rutinas y seguimientos se pausan hasta que regreses. Después de 6 meses, se eliminan los archivos guardados de tus computadoras, y después de 12 meses (24 si alguna vez pagaste), se elimina tu cuenta. Te enviamos un correo antes de eliminar nada. Las cuentas con un plan de pago nunca se ven afectadas.';

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
  String get inactivityModeOff => 'Desactivado';

  @override
  String get inactivityModeReport => 'Reportar';

  @override
  String get inactivityModeOn => 'Activado';

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
    return 'activo $when';
  }

  @override
  String get inactivityStateResting => 'En reposo';

  @override
  String get inactivityStateFilesSoon => 'Los archivos se eliminarán pronto';

  @override
  String get inactivityStateRemovalSoon => 'Eliminación próxima';

  @override
  String get inactivityStateRemoving => 'Eliminándose';

  @override
  String get inactivityKept => 'Conservada';

  @override
  String get keepAccount => 'Conservar esta cuenta';

  @override
  String get keepAccountHelp =>
      'Nunca se pone en reposo ni se elimina por falta de uso';

  @override
  String get computerFilesRemoved => 'Archivos guardados eliminados';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Esta computadora no se usó durante 6 meses, así que sus archivos guardados se eliminaron el $date. Empieza de cero.';
  }

  @override
  String get downloadSavedFiles => 'Descargar archivos guardados';

  @override
  String get downloadSavedFilesHelp =>
      'Un archivo .tar.gz de su carpeta de inicio, sin activarla';

  @override
  String get liveActivity => 'Actividad en vivo';

  @override
  String get liveRowHelp =>
      'Lista de espera, registros y descargas en tiempo real';

  @override
  String get liveRefresh => 'Actualizar';

  @override
  String get liveTabActivity => 'Actividad';

  @override
  String get liveTabAlerts => 'Alertas';

  @override
  String get liveGroupAll => 'Todo';

  @override
  String get liveGroupWaitlist => 'Lista de espera';

  @override
  String get liveGroupAccounts => 'Cuentas';

  @override
  String get liveGroupMoney => 'Dinero';

  @override
  String get liveGroupWebsite => 'Sitio web';

  @override
  String get liveGroupGrowth => 'Crecimiento';

  @override
  String get liveGroupSupport => 'Soporte';

  @override
  String get liveKindWaitlistJoined => 'Se unió a la lista de espera';

  @override
  String get liveKindWaitlistAdmitted => 'Admitido desde la lista de espera';

  @override
  String get liveKindSignup => 'Cuenta nueva';

  @override
  String get liveKindSignupRefused => 'Registro rechazado';

  @override
  String get liveKindFirstChat => 'Primer chat';

  @override
  String get liveKindMilestone =>
      'Otros primeros hitos (bot, computadora, llamada, rutina)';

  @override
  String get liveKindSubscription => 'Suscripción nueva';

  @override
  String get liveKindSubscriptionEnded => 'Suscripción finalizada';

  @override
  String get liveKindPurchase => 'Créditos comprados';

  @override
  String get liveKindSupportTicket => 'Ticket de soporte';

  @override
  String get liveKindFeedback => 'Comentarios';

  @override
  String get liveKindAccountDeleted => 'Cuenta eliminada';

  @override
  String get liveKindDownloadClick => 'Clic en descarga';

  @override
  String get liveKindQrOpen => 'Código QR de descarga abierto';

  @override
  String get liveKindStartClick => 'Clic en Empezar gratis';

  @override
  String get liveKindInviteOpen => 'Enlace de invitación abierto';

  @override
  String get liveNow => 'ahora';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes min';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours h';
  }

  @override
  String get liveTestSent => 'Alerta de prueba enviada a tus dispositivos';

  @override
  String get liveTodayWaitlist => 'Se unieron hoy';

  @override
  String get liveTodaySignups => 'Cuentas hoy';

  @override
  String get liveTodayDownloads => 'Descargas hoy';

  @override
  String get liveTodayMoney => 'Dinero hoy';

  @override
  String get liveRetry => 'Reintentar';

  @override
  String get liveEmpty =>
      'Nada todavía. La actividad nueva aparece aquí en segundos.';

  @override
  String get liveOlder => 'Mostrar anteriores';

  @override
  String get liveAlertsHelp =>
      'Elige qué envía notificaciones a tus teléfonos, Mac y navegadores. Cuando ocurren muchas cosas a la vez, recibes un resumen en lugar de una notificación por cada una.';

  @override
  String get livePauseAll => 'Pausar todas las alertas';

  @override
  String get livePauseAllHelp => 'La actividad sigue apareciendo aquí';

  @override
  String get liveSendTest => 'Enviar una alerta de prueba';

  @override
  String get liveSendTestHelp =>
      'Comprueba que las alertas lleguen a este dispositivo';

  @override
  String get liveAlertsFooter =>
      'Las alertas esperan durante tus horas de silencio (Ajustes → Notificaciones) y llegan después en un resumen. En un navegador, permite notificaciones para este sitio para recibirlas ahí.';

  @override
  String get liveStatusOn => 'En vivo: se actualiza cada pocos segundos';

  @override
  String get liveStatusPaused => 'En vivo. Las alertas están en pausa';

  @override
  String get liveGroupApp => 'App';

  @override
  String get liveKindAppFirstOpen => 'App abierta por primera vez';

  @override
  String get liveKindAppReinstall => 'App reinstalada';

  @override
  String get liveKindSigninStarted => 'Empezó a iniciar sesión';

  @override
  String get liveKindTrialStarted => 'Prueba iniciada';

  @override
  String get liveKindRenewal => 'Suscripción renovada';

  @override
  String get liveKindRefund => 'Reembolso';

  @override
  String get liveKindDisputeOpened => 'Disputa abierta';

  @override
  String get liveKindPlanCancelFailed => 'Plan no cancelado';

  @override
  String get liveKindStoreReview => 'Reseña en la tienda';

  @override
  String get liveKindStoreCrashes => 'Informes de fallos de la tienda';

  @override
  String get liveKindDay2Return => 'Regresó el día 2';

  @override
  String get liveKindWeek1Return => 'Regresó la semana 1';

  @override
  String get liveKindDeviceGone => 'App probablemente eliminada';

  @override
  String get liveKindPartnerInterest => 'Creador interesado en Partners';

  @override
  String get liveKindCreatorOpen => 'Enlace de creador abierto';

  @override
  String get liveKindPartnerClaimed => 'Código de creador usado';

  @override
  String get liveKindGiftOpen => 'Enlace de regalo abierto';

  @override
  String get liveKindCompRedeemed => 'Plan de regalo canjeado';

  @override
  String get liveKindReferralRewarded => 'Invitación completada';

  @override
  String get liveKindNewsletterConfirmed => 'Suscripción al boletín';

  @override
  String get liveKindTestimonialSubmitted => 'Testimonio por revisar';

  @override
  String get liveDailyDigest => 'Resumen de la mañana';

  @override
  String get liveDailyDigestHelp =>
      'El embudo y las descargas de ayer, a las 9 en tu zona horaria';

  @override
  String get liveFunnelClicks => 'Clics';

  @override
  String get liveFunnelOpens => 'Primeras aperturas';

  @override
  String get liveFunnelSignups => 'Cuentas';

  @override
  String get liveFunnelChats => 'Primeros chats';

  @override
  String get liveFunnelPaying => 'De pago';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => 'Por persona';

  @override
  String get liveSearch => 'Buscar correo, país, origen';

  @override
  String get liveNoMatches => 'Nada coincide con esa búsqueda';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos',
      one: '1 paso',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'probable';

  @override
  String get liveStepClick => 'Hizo clic en descargar';

  @override
  String get liveStepOpen => 'Abrió la app';

  @override
  String get liveStepSignup => 'Creó una cuenta';

  @override
  String get liveStepChat => 'Primer chat';

  @override
  String get liveStepPaying => 'De pago';

  @override
  String get liveJourneyTitle => 'Qué ocurrió';

  @override
  String get liveJourneyVisitor => 'Visitante';

  @override
  String get liveJourneyWho => 'Quién';

  @override
  String get liveJourneyFrom => 'Desde dónde';

  @override
  String get liveJourneyDevice => 'Dispositivo';

  @override
  String get liveJourneyTimeline => 'Cronología';

  @override
  String get liveJourneyNow => 'Ahora';

  @override
  String get liveJourneySource => 'Origen';

  @override
  String get liveJourneyCampaign => 'Campaña';

  @override
  String get liveJourneyLanding => 'Primera página';

  @override
  String get liveJourneyClickedFrom => 'Hizo clic en';

  @override
  String get liveJourneyPlatform => 'Plataforma';

  @override
  String get liveJourneyStore => 'Desde';

  @override
  String get liveJourneyVersion => 'Versión';

  @override
  String get liveJourneyCountry => 'País';

  @override
  String get liveJourneyLikelyHelp =>
      'Vinculado a un clic en el sitio web por dispositivo, país y hora, no por un enlace. Tómalo como una buena estimación.';

  @override
  String get liveJourneyPlan => 'Plan';

  @override
  String get liveJourneyMessages => 'Mensajes enviados';

  @override
  String get liveJourneyBots => 'Bots';

  @override
  String get liveJourneyDevices => 'Sesión iniciada en';

  @override
  String get liveJourneyLastActive => 'Última actividad';

  @override
  String get liveJourneyJoined => 'Cuenta creada';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap después';
  }

  @override
  String get liveJourneyNone => 'Aún no se sabe nada más sobre esto.';

  @override
  String get liveJourneyCopyEmail => 'Copiar correo';

  @override
  String get liveJourneyCopied => 'Correo copiado';

  @override
  String get liveJourneyOpenAdmin => 'Abrir en Administración';

  @override
  String get liveJourneyGone =>
      'Esto tiene más de 30 días, así que sus detalles se borraron.';

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
  String get planChangeTitle => 'Confirmar cambio de plan';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Cambiar a $plan';
  }

  @override
  String get planChangeChargedNow => 'Cobrado ahora';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Incluye $tax de impuestos';
  }

  @override
  String get planChangeCredit => 'Crédito por tiempo no usado';

  @override
  String planChangeThen(String amount, String period) {
    return 'Luego $amount / $period (antes de impuestos)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Próximo cobro el $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Confirmar y pagar';

  @override
  String get planChangeHaveCode => '¿Tienes un código?';

  @override
  String get planChangeCodeLabel => 'Código de descuento';

  @override
  String get planChangeCodeHint => 'Ingresa el código';

  @override
  String get planChangeApply => 'Aplicar';

  @override
  String get planChangeRemove => 'Quitar';

  @override
  String get planChangeDiscountApplied => 'Descuento aplicado';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '$percent% de descuento en cada renovación';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$percent% de descuento en $count renovaciones',
      one: '$percent% de descuento en 1 renovación',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '$amount de descuento en cada renovación';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$amount de descuento en $count renovaciones',
      one: '$amount de descuento en 1 renovación',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '$percent% de descuento en cada renovación; termina si cambias de plan otra vez';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '$amount de descuento en cada renovación; termina si cambias de plan otra vez';
  }

  @override
  String get planChangeInvalidCode =>
      'Ese código no se puede usar en este plan.';

  @override
  String get planChangeCodeCostsMore =>
      'Este código reemplazaría tu descuento actual y costaría más.';

  @override
  String get planChangeCodeEndsLasting =>
      'Este código terminaría tu descuento permanente actual.';

  @override
  String get planChangeCodeNotBetter => 'Ya tienes un descuento igual o mejor.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Reemplaza tu descuento actual del $percent%';
  }

  @override
  String get planChangeReplacesDiscount => 'Reemplaza tu descuento actual';

  @override
  String get planChangePriceMoved =>
      'El total cambió desde que abriste esto. Revisa el monto actualizado y confirma de nuevo.';

  @override
  String get planChangePeriodWeek => 'semana';

  @override
  String get planChangePeriodMonth => 'mes';

  @override
  String get planChangePeriodYear => 'año';

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
  String get partnerProgramTitle =>
      '¿Haces videos, publicaciones o un boletín?';

  @override
  String get partnerProgramSubtitle =>
      'Gana el 30% de lo que paguen las personas que envíes, durante un año';

  @override
  String get partnerYourCode => 'Tu código de creador';

  @override
  String get partnerPaused => 'En pausa';

  @override
  String get partnerPortal => 'Ganancias y pagos';

  @override
  String partnerShareText(String link, String code) {
    return 'Prueba Casama, colegas de IA que trabajan para ti. Usa mi código $code al registrarte: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name te envió a Casama.';
  }

  @override
  String get partnerClaimed =>
      'Código de creador agregado. ¡Te damos la bienvenida a Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Gracias por apoyar a $name. ¡Te damos la bienvenida a Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'Ese código de creador no existe. Revísalo e inténtalo de nuevo.';

  @override
  String get partnerErrOwnCode =>
      'Ese es tu propio código. Compártelo con tu audiencia.';

  @override
  String get partnerErrWindowClosed =>
      'Los códigos de creador solo pueden ingresarse en los primeros días después de registrarte.';

  @override
  String get partnerErrAlreadyPaying =>
      'Los códigos de creador son para cuentas nuevas, antes del primer pago.';

  @override
  String get partnerErrAlready => 'Ya ingresaste el código de un creador.';

  @override
  String get partnerErrReferred =>
      'Te uniste con la invitación de una amistad, así que no se puede agregar un código de creador.';

  @override
  String get partnerErrOff =>
      'Los códigos de creador no están disponibles en este servidor.';

  @override
  String get referralHaveCodeAny => '¿Tienes un código?';

  @override
  String get referralCodeHintAny => 'Código de una amistad o de un creador';

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
  String get testimonialStateLive => 'Publicado';

  @override
  String get testimonialStateDraft => 'Borrador';

  @override
  String get testimonialStateHidden => 'Oculto';

  @override
  String get testimonialStateWithdrawn => 'Retirado';

  @override
  String get testimonialPlaceSiteHome => 'inicio de casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'precios de casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'Planes de la app';

  @override
  String get testimonialPlaceAppSignin => 'Inicio de sesión de la app';

  @override
  String get testimonialSourceEmail => 'Correo electrónico';

  @override
  String get testimonialSourceInApp => 'En la app';

  @override
  String get testimonialSourceOther => 'Otro';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count estrellas',
      one: '1 estrella',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Lo que dicen de Casama';

  @override
  String get testimonialAskTitle => '¿Te gusta Casama?';

  @override
  String get testimonialAskSubtitle => 'Cuéntanos en una frase.';

  @override
  String get testimonialAskHint => '¿Qué es lo que te gusta?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama puede citarme en casama.ai y en la app como $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama puede citarme en casama.ai y en la app como alguien que usa Casama';

  @override
  String get testimonialAskSend => 'Enviar';

  @override
  String get testimonialAskNotNow => 'Ahora no';

  @override
  String get testimonialAskThanks => '¡Gracias! Leemos cada uno.';

  @override
  String get communityTitle => 'Comunidad';

  @override
  String get communitySentence =>
      'Casama es de código abierto. Si te resulta útil, una estrella en GitHub ayuda a que otras personas lo encuentren.';

  @override
  String get communityStarOnGitHub => 'Dar estrella en GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Chatea con el equipo y otras personas que usan Casama';

  @override
  String get starAskTitle => 'Casama en GitHub';

  @override
  String get starAskNotNow => 'Ahora no';

  @override
  String get cloudSignInTitle => 'Inicia sesión con tu cuenta de Casama';

  @override
  String get cloudSignInBody =>
      'La licencia personal gratuita viene de tu cuenta de Casama. Solo la licencia va a este servidor; tus chats permanecen en él.';

  @override
  String get cloudSignInEmail => 'Correo electrónico';

  @override
  String get cloudSignInSendCode => 'Enviar código';

  @override
  String get cloudSignInCode => 'Código del correo';

  @override
  String get cloudSignInVerify => 'Iniciar sesión';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Enviamos un código a $email. Ingrésalo aquí.';
  }

  @override
  String get licenseSetupTitle => 'Obtén tu licencia personal gratuita';

  @override
  String get licenseSetupBody =>
      'Este servidor necesita una licencia antes de que los bots puedan ejecutarse. El uso personal es gratis para una persona: inicia sesión con tu cuenta de Casama y la licencia se renueva en línea cada 30 días.';

  @override
  String get licensePersonalButton => 'Obtener licencia personal gratuita';

  @override
  String get licensePersonalNote =>
      'Personal: una persona, para uso personal, en tu propia computadora o servidor.';

  @override
  String get licenseBusinessTitle => 'O ingresa una clave empresarial';

  @override
  String get licenseBusinessHint => 'Pega tu clave de licencia';

  @override
  String get licenseBusinessSave => 'Usar esta clave';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return '¿Usas Casama en el trabajo o con un equipo? Business cuesta $monthlyPrice al mes por usuario activo ($yearlyMonthlyPrice con facturación anual). Escribe a $email.';
  }

  @override
  String get licenseActivated =>
      'Licencia activa. Tus bots ya pueden ejecutarse.';

  @override
  String get licenseOtherServer => 'Usar otro servidor';

  @override
  String get licenseRenew => 'Renovar';

  @override
  String get licenseRenewTitle => 'Renovar la licencia de este servidor';

  @override
  String licenseGraceBanner(String date) {
    return 'La licencia de este servidor venció. Los bots siguen ejecutándose hasta el $date; renuévala antes.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'La licencia de este servidor venció. Renuévala pronto para que los bots sigan ejecutándose.';

  @override
  String get licenseExpiredBanner =>
      'La licencia de este servidor venció, así que las nuevas ejecuciones de bots están en pausa. Tus datos están seguros: aún puedes iniciar sesión, leer y exportar. Renueva para volver a iniciar los bots.';

  @override
  String get licenseErrorRequired =>
      'Este servidor necesita primero una licencia. Obtén la licencia personal gratuita o ingresa una clave empresarial.';

  @override
  String licenseErrorSeats(String email) {
    return 'Todos los puestos de la licencia de este servidor están ocupados. Para más personas se necesita una licencia Business: escribe a $email.';
  }

  @override
  String get licenseErrorExpired =>
      'La licencia de este servidor venció, así que las nuevas ejecuciones de bots están en pausa. Tus datos están seguros. Renueva la licencia para volver a iniciar los bots.';

  @override
  String get licenseEditionPersonal => 'Personal';

  @override
  String get licenseEditionTrial => 'Prueba';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Exportación de auditoría';

  @override
  String get licenseFeatureAuditForwarding => 'Reenvío de auditoría';

  @override
  String get licenseFeatureRoles => 'Roles avanzados';

  @override
  String get setupLicenseTitle => 'Licencia personal gratuita';

  @override
  String get setupLicenseBody =>
      'Inicia sesión con tu cuenta de Casama para obtener la licencia personal gratuita para este servidor: una persona, uso personal. También puedes hacerlo más tarde.';

  @override
  String get setupLicenseSignIn => 'Iniciar sesión con Casama';

  @override
  String get setupLicenseReady =>
      'La licencia personal gratuita viene incluida con tu servidor.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Sesión iniciada como $email. La licencia personal gratuita viene incluida con tu servidor.';
  }

  @override
  String get setupLicenseSkipped =>
      'Aún sin licencia. Tu servidor pedirá una cuando inicie.';

  @override
  String setupLicenseFailed(String error) {
    return 'No se pudo crear la licencia personal ($error). Tu servidor pedirá una cuando inicie.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'El servidor de Casama se ejecuta dentro de Docker Desktop, una app gratuita que usa WSL 2 para mantenerlo separado del resto de tu PC.';

  @override
  String get setupDockerStep1Windows =>
      'Ejecuta el instalador que se descarga y mantén activada la opción “Use WSL 2”.';

  @override
  String localUpdateAvailable(String version) {
    return 'Hay una actualización del servidor lista: $version';
  }

  @override
  String get localUpdateButton => 'Actualizar';

  @override
  String get localUpdateLater => 'Más tarde';

  @override
  String localUpdateTitle(String version) {
    return 'Actualizar tu servidor a $version';
  }

  @override
  String get localUpdateBody =>
      'Primero se respalda la base de datos. Si la versión nueva no inicia, tu servidor vuelve a la versión que tiene ahora.';

  @override
  String localUpdateDone(String version) {
    return 'Actualizado a $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'La versión nueva no inició, así que tu servidor volvió a la versión que tenía. No se perdió nada y se guardó una copia de seguridad de la base de datos.';

  @override
  String localUpdateFailed(String detail) {
    return 'La actualización falló: $detail';
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
  String get shCloudScreenTitle => 'Modelos de Casama Cloud';

  @override
  String get shCloudPitch =>
      'Modelos de Casama, sin claves que administrar. Se pagan con un plan de Casama Cloud.';

  @override
  String get shCloudTurnOn => 'Activar';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Activado · pagado por $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, pagado por $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Desactivado. Solo un administrador de este servidor puede activarlo.';

  @override
  String get shCloudManage => 'Administrar';

  @override
  String get shCloudSignInBody =>
      'Inicia sesión con tu cuenta de Casama para elegir quién paga los modelos de Casama Cloud. Tus bots, chats y memoria permanecen en este servidor.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Sesión iniciada en Casama Cloud como $email';
  }

  @override
  String get shCloudOtherAccount => 'Usar otra cuenta';

  @override
  String get shCloudContinue => 'Continuar';

  @override
  String get shCloudPayerTitle => '¿Quién paga?';

  @override
  String get shCloudPayerBody =>
      'Los modelos de Casama Cloud se pagan desde un espacio de trabajo de Casama Cloud que poseas o administres. Su plan, el uso incluido y el límite diario se comparten con todo lo demás que usa.';

  @override
  String get shCloudPayerNone =>
      'Todavía no administras ningún espacio de trabajo de Casama Cloud. Crea uno desde el cual pagar; empieza vacío.';

  @override
  String get shCloudCreateWorkspace => 'Crear uno';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Espacio de trabajo de $name';
  }

  @override
  String get shCloudNoPlan => 'Sin plan todavía';

  @override
  String shCloudCovered(String plan) {
    return 'Tu plan $plan cubre esto.';
  }

  @override
  String get shCloudPlanTitle => 'Elige un plan';

  @override
  String get shCloudPlanBody =>
      'Los modelos de Casama Cloud vienen incluidos con cualquier plan de Casama Cloud: el mismo uso incluido, límite diario y recargas que en Cloud. Sin costo aparte por autoalojar.';

  @override
  String get shCloudTryFirst => 'Pruébalo primero';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Uso gratuito para probar: cerca de $amount en mensajes, una vez por cuenta de Casama. Sin comprar nada.';
  }

  @override
  String get shCloudTrialUsed =>
      'El uso gratuito de prueba ya se agotó en esta cuenta de Casama. Elige un plan para continuar.';

  @override
  String get shCloudIntervalWeek => 'Semanal';

  @override
  String get shCloudIntervalMonth => 'Mensual';

  @override
  String get shCloudIntervalYear => 'Anual';

  @override
  String get shCloudWaitingForPlan =>
      'Termina el pago en tu navegador. Esta pantalla continúa por sí sola cuando llegue el plan.';

  @override
  String get shCloudWaitingTimedOut =>
      'El plan todavía no llegó. Un pago puede tardar unos minutos en reflejarse.';

  @override
  String get shCloudCheckAgain => 'Comprobar de nuevo';

  @override
  String get shCloudGiftCode => '¿Tienes un código de regalo?';

  @override
  String get shCloudGiftCodeLabel => 'Código de regalo';

  @override
  String get shCloudRedeem => 'Canjear';

  @override
  String get shCloudNoWayToBuy =>
      'No se pueden comprar planes en esta app. Compra uno en casama.ai con la misma cuenta y vuelve a comprobar aquí.';

  @override
  String get shCloudPurchasePending =>
      'Tu compra está esperando aprobación. Esto continúa cuando se apruebe.';

  @override
  String get shCloudPurchaseFailed =>
      'La compra no se completó. No se realizó ningún cargo.';

  @override
  String get shCloudConnecting => 'Conectando este servidor a Casama Cloud…';

  @override
  String get shCloudLoading => 'Cargando…';

  @override
  String get shCloudReviewTitle => 'Revisar antes de activar';

  @override
  String get shCloudReviewPays => 'Quién paga';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan en $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Uso gratuito de prueba en $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Qué bots cambian';

  @override
  String get shCloudReviewAll => 'Todos los bots';

  @override
  String get shCloudReviewNoKey => 'Solo bots sin una clave válida';

  @override
  String get shCloudReviewPick => 'Elegir bots';

  @override
  String get shCloudReviewNoBots =>
      'Este servidor todavía no tiene bots. Los bots nuevos pueden usar Casama Cloud.';

  @override
  String get shCloudReviewDefault =>
      'Los bots nuevos también usan Casama Cloud';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Modelo de Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Sin clave válida';

  @override
  String shCloudStepDown(String from) {
    return 'Las respuestas pueden ser más breves o menos detalladas que con $from. Prueba primero con un bot.';
  }

  @override
  String get shCloudReviewJobs => 'Memoria, imágenes y voz';

  @override
  String get shCloudJobMemory => 'Búsqueda en la memoria';

  @override
  String get shCloudJobImages => 'Imágenes';

  @override
  String get shCloudJobTts => 'Lectura en voz alta';

  @override
  String get shCloudJobStt => 'Dictado';

  @override
  String get shCloudJobOwnKey => 'Tu propia clave';

  @override
  String get shCloudJobMemoryOptIn =>
      'Usar Casama Cloud también para la memoria';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'La memoria se vuelve a indexar en segundo plano; la búsqueda sigue funcionando mientras tanto.';

  @override
  String get shCloudJobLiveNote =>
      'La voz en vivo, las llamadas telefónicas y el video siguen usando tus propias claves.';

  @override
  String get shCloudWhatGoes => 'Qué va a Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'Los mensajes al modelo pasan por Casama Cloud y no se guardan. El uso (modelo, tokens, costo) aparece en tu factura de Cloud. Los bots, chats, memoria, archivos y computadoras permanecen en este servidor.';

  @override
  String get shCloudWhatGoesLink => 'Qué envía este servidor';

  @override
  String get shCloudFallback =>
      'Si Casama Cloud se agota o no responde, usar mi propia clave';

  @override
  String get shCloudFallbackHelp =>
      'Cada respuesta generada con tu propia clave lo indica.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString personas usan este servidor y el plan $plan cubre $seatsString. Cada persona adicional se factura al precio por persona extra de Casama Cloud.';
  }

  @override
  String get shCloudApply => 'Activar Casama Cloud';

  @override
  String get shCloudPickOne =>
      'Elige al menos un bot o deja que los bots nuevos lo usen.';

  @override
  String get shCloudPolicyTitle => 'Quién puede usarlo';

  @override
  String get shCloudPolicyEveryone => 'Todos en este servidor';

  @override
  String get shCloudPolicyChosen => 'Solo personas elegidas';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString personas elegidas',
      one: '1 persona elegida',
      zero: 'Aún no se eligió a nadie',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Límite diario por persona';

  @override
  String get shCloudNoLimit => 'Sin límite';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount al día';
  }

  @override
  String get shCloudPolicySaved => 'Guardado';

  @override
  String get shCloudDoneTitle => 'Casama Cloud está activado';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots ahora usan Casama Cloud.',
      one: '1 bot ahora usa Casama Cloud.',
      zero: 'Los bots nuevos usan Casama Cloud.',
    );
    return '$_temp0 El uso aparece en la pantalla Uso de este servidor y en tu factura de Cloud.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Saluda a $bot';
  }

  @override
  String get shCloudDone => 'Listo';

  @override
  String get shCloudUsageTitle => 'Uso';

  @override
  String shCloudIncludedLeft(String amount) {
    return 'Queda $amount de uso incluido este mes';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Hoy: $spend de $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Hoy: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount en créditos';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return 'Queda $amount de uso gratuito de prueba';
  }

  @override
  String get shCloudPriceNote =>
      'Al precio que cobra Casama Cloud. Las mismas llamadas aparecen en tu factura de Cloud bajo el nombre de este servidor.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Tú hoy: $spend de $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Ya se usó el 80% del uso incluido de Casama Cloud de este mes.';

  @override
  String get shCloudWarnDaily =>
      'Ya se usó el 80% del límite de hoy de Casama Cloud.';

  @override
  String get shCloudTopUp => 'Recargar';

  @override
  String get shCloudUseOwnKey => 'Usar mi propia clave';

  @override
  String get shCloudStopOutOfCredits =>
      'No queda uso de Casama Cloud para este mes.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'El límite de hoy de Casama Cloud se agotó. Se restablece a las $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'El límite de hoy de Casama Cloud se agotó. Se restablece mañana.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud necesita un plan en $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'El plan de Casama Cloud en $workspace finalizó.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'El plan en $workspace no cubre a todas las personas que usan Casama Cloud aquí.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Alcanzaste el límite de hoy de Casama Cloud en este servidor.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Tu administrador aún no activó Casama Cloud para ti.';

  @override
  String get shCloudStopDisconnected =>
      'Se desconectó Casama Cloud de este servidor.';

  @override
  String get shCloudStopUnreachable =>
      'No se puede acceder a Casama Cloud ahora. Intentando de nuevo.';

  @override
  String get shCloudSeePlans => 'Ver planes';

  @override
  String get shCloudRenew => 'Renovar';

  @override
  String get shCloudAskAdmin => 'Pedir a un administrador';

  @override
  String get shCloudAskAdminBody =>
      'Solo un administrador de este servidor puede cambiar Casama Cloud. Pídeselo a uno de ellos; los bots y rutinas continuarán por sí solos cuando se resuelva.';

  @override
  String get shCloudReconnect => 'Reconectar';

  @override
  String get shCloudFallbackActive =>
      'Mientras tanto responde tu propia clave, y cada respuesta lo indica.';

  @override
  String get shCloudUseOwnKeyTitle => '¿Usar tu propia clave mientras tanto?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Mientras Casama Cloud no pueda responder, los bots responden con tu propia clave y cada respuesta lo indica. Puedes desactivarlo en cualquier momento en esta pantalla.';

  @override
  String get shCloudAddKeyFirst =>
      'Agrega primero una clave propia en la pantalla Modelos.';

  @override
  String get shCloudRoutinesWait =>
      'Las rutinas esperan y continúan por sí solas cuando se resuelva.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'La memoria se está poniendo al día: $doneString de $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'La búsqueda usa palabras para los recuerdos aún no reindexados.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Los mensajes al modelo ahora pasan por Casama Cloud, pagado por $workspace.';
  }

  @override
  String get shCloudGotIt => 'Entendido';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Pagado por $workspace';
  }

  @override
  String get shCloudPaidBy => 'Pagado por';

  @override
  String get shCloudChangePayer => 'Cambiar';

  @override
  String get shCloudChangeBots => 'Cambiar bots';

  @override
  String get shCloudFallbackSection => 'Cuando Casama Cloud no pueda responder';

  @override
  String get shCloudTurnOff => 'Desactivar';

  @override
  String get shCloudOffTitle => '¿Desactivar Casama Cloud?';

  @override
  String get shCloudOffBody =>
      'Estos bots vuelven a su clave anterior si sigue funcionando o, si no, a la clave predeterminada del espacio de trabajo. Nada más cambia y puedes volver a activarlo en cualquier momento.';

  @override
  String get shCloudOffBotsNone =>
      'Ningún bot usa Casama Cloud en este momento.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud está desactivado';

  @override
  String shCloudOffBackTo(String key) {
    return 'De vuelta a $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Necesita una clave';

  @override
  String get shCloudAddKey => 'Agregar una clave';

  @override
  String get shCloudSignInAgain =>
      'Terminó tu sesión de Casama Cloud. Vuelve a iniciar sesión para continuar.';

  @override
  String get cloudAccountSection => 'Cuenta de Casama Cloud';

  @override
  String cloudAccountRow(String email) {
    return 'Sesión iniciada como $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Se usa para la licencia de este servidor y los modelos de Casama Cloud';

  @override
  String get cloudAccountSignOut => 'Cerrar sesión en Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'Este dispositivo olvida tu sesión de Casama Cloud. Este servidor, su licencia y los modelos de Casama Cloud siguen funcionando.';

  @override
  String get cloudAccountDelete => 'Eliminar cuenta de Casama Cloud';

  @override
  String get cloudAccountDeleteHelp =>
      'Elimina tu cuenta en Casama Cloud. Este servidor y sus datos se conservan.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Escribe $email para eliminar tu cuenta de Casama Cloud. Los espacios de trabajo en la nube que solo te pertenecen a ti se eliminan con ella, y los modelos de Casama Cloud dejan de funcionar en los servidores que esos espacios pagan. Un plan que compraste en la web se cancela automáticamente. Un plan comprado en el App Store o Google Play no: cancélalo en esa tienda.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Tu cuenta de Casama Cloud se eliminó. Sus datos se eliminarán de forma definitiva el $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Mover a Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Mover a mi propio servidor';

  @override
  String get wsMoveSettingsHelp =>
      'Lleva los bots, chats, memoria y archivos de este espacio de trabajo a otro servidor';

  @override
  String get wsMoveTitle => 'Mover este espacio de trabajo';

  @override
  String get wsMoveIntro =>
      'Todo viene contigo: bots, chats, memoria, rutinas, archivos y computadoras. Una vez allá, esta copia sigue legible, pero deja de funcionar.';

  @override
  String get wsMoveCloudOption => 'Mover a Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Inicia sesión con tu cuenta de Casama y elige adónde va.';

  @override
  String get wsMoveServerOption => 'Mover a mi propio servidor';

  @override
  String get wsMoveServerOptionHelp =>
      'En ese servidor, abre Ajustes › Traer un espacio de trabajo aquí y copia su código de traslado.';

  @override
  String get wsMoveInstallServer => 'Instalar Servidor Casama';

  @override
  String get wsMoveInstallServerHelp =>
      '¿Aún no tienes servidor? Ejecuta uno en esta computadora primero.';

  @override
  String get wsMoveReceiveOption => 'Traer un espacio de trabajo aquí';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Obtén un código de traslado para este espacio de trabajo, para usarlo en el servidor donde está ahora el otro espacio de trabajo.';

  @override
  String get wsMoveOwnerOnly =>
      'Solo quien es propietario del espacio de trabajo puede moverlo.';

  @override
  String get wsMoveCloudPickTitle => '¿Adónde debería ir?';

  @override
  String get wsMoveCloudNew => 'Un espacio de trabajo nuevo';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Empieza vacío en Casama Cloud, llamado $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Los elementos movidos van junto a lo que ya hay. A los nombres repetidos se les agrega “(moved)”.';

  @override
  String get wsMoveServerTitle => 'Mover a tu propio servidor';

  @override
  String get wsMoveServerAddress => 'Dirección del servidor';

  @override
  String get wsMoveServerCode => 'Código de traslado';

  @override
  String get wsMoveCheckButton => 'Comprobar';

  @override
  String get wsMoveReceiveTitle => 'Traer un espacio de trabajo aquí';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'En el servidor donde está ahora el espacio de trabajo, abre Ajustes › Mover a mi propio servidor e ingresa esta dirección y este código. El código funciona una sola vez, hasta las $time, y trae todo a $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Dirección de este servidor';

  @override
  String get wsMoveReceiveCode => 'Código de traslado';

  @override
  String get wsMoveCopy => 'Copiar';

  @override
  String get wsMoveCopied => 'Copiado';

  @override
  String get wsMoveCheckTitle => 'Listo para mover';

  @override
  String wsMoveCheckTo(String name) {
    return 'A $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutos',
      one: '1 minuto',
    );
    return '$size por copiar, aproximadamente $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString minutos',
      one: '1 minuto',
    );
    return 'Cerca del final, los bots hacen una pausa de aproximadamente $_temp0 y luego continúan allá.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'Es una pausa larga. Elige un momento tranquilo.';

  @override
  String get wsMoveCheckComes => 'Qué viene contigo';

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
      other: '$nString recuerdos',
      one: '1 recuerdo',
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
      other: '$nString rutinas',
      one: '1 rutina',
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
      other: '$nString archivos',
      one: '1 archivo',
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
      other: '$nString computadoras',
      one: '1 computadora',
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
      other: '$nString personas',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'Qué te necesitará después';

  @override
  String wsMoveReconnect(String names) {
    return 'Vuelve a iniciar sesión en estas apps allá: $names';
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
      other: '$nString personas reciben',
      one: '1 persona recibe',
    );
    return '$_temp0 una invitación por correo';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (con invitación)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'Los planes de ChatGPT se quedan atrás. Vuelve a iniciar sesión en ChatGPT allá.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString computadoras empiezan',
      one: '1 computadora empieza',
    );
    return '$_temp0 de cero allá, con su carpeta personal restaurada.';
  }

  @override
  String get wsMoveResetNote =>
      'Las aprobaciones, el acceso total y el acceso al dispositivo parten de los valores predeterminados del nuevo servidor.';

  @override
  String get wsMoveBringKeys => 'Llevar mis claves';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Van $nString claves',
      one: 'Va 1 clave',
    );
    String _temp1 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'las',
      one: 'la',
    );
    return '$_temp0 también, de modo que solo el servidor nuevo pueda leer$_temp1.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Volverás a agregar allá las claves de modelos y apps de chat.';

  @override
  String get wsMoveDoesntFit =>
      'Este espacio de trabajo no cabe en el plan de allá';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan alcanza. Elígelo en Casama Cloud y vuelve a comprobar.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have de $limit';
  }

  @override
  String get wsMoveOverPeople => 'Personas';

  @override
  String get wsMoveOverBots => 'Bots';

  @override
  String get wsMoveOverComputers => 'Computadoras';

  @override
  String get wsMoveOverStorage => 'Almacenamiento';

  @override
  String get wsMoveUpdateSource =>
      'Actualiza primero este servidor. Es anterior al servidor al que te mueves.';

  @override
  String get wsMoveUpdateTarget =>
      'El servidor al que te mueves necesita actualizarse primero.';

  @override
  String get wsMoveStart => 'Iniciar traslado';

  @override
  String get wsMoveCheckAgain => 'Comprobar de nuevo';

  @override
  String get wsMoveProgressTitle => 'Moviendo';

  @override
  String get wsMoveStepStarting => 'Preparando todo';

  @override
  String get wsMoveStepCopying =>
      'Copiando archivos mientras todo sigue funcionando';

  @override
  String get wsMoveStepPausing =>
      'Pausando bots para copiar los últimos cambios';

  @override
  String get wsMoveStepFinishing => 'Enviando chats, memoria y ajustes';

  @override
  String get wsMoveStepImporting => 'El servidor nuevo lo está importando';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done de $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Puedes cerrar la app. El traslado sigue y recibirás una notificación cuando termine.';

  @override
  String get wsMoveFailedTitle => 'El traslado se detuvo';

  @override
  String get wsMoveFailedBody =>
      'No cambió nada aquí: este espacio de trabajo sigue funcionando.';

  @override
  String get wsMoveTryAgain => 'Reintentar';

  @override
  String get wsMoveNewCodeNeeded =>
      'Para intentarlo de nuevo, obtén un código de traslado nuevo.';

  @override
  String get wsMoveDoneTitle => 'Movido';

  @override
  String wsMoveDoneBody(String server) {
    return 'Todo llegó a $server.';
  }

  @override
  String get wsMoveDoneNeeds => 'Algunas cosas te necesitan allá:';

  @override
  String get wsMoveOpenThere => 'Abrir allá';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Vuelve a iniciar sesión en $name';
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
      other: '$nString personas',
      one: '1 persona',
    );
    return 'Se invitó por correo a $_temp0';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Reconectar $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Dale al remitente de $name la nueva dirección de webhook';
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
      other: '$nString días',
      one: '1 día',
    );
    return 'Los webhooks que sigan enviándose aquí se reenvían durante $_temp0.';
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
    return 'Revisa las aprobaciones de $_temp0';
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
    return 'Conecta modelos de Casama Cloud en Ajustes o elige otro modelo para $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Agrega allá tus claves de modelos';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString elementos cambiaron',
      one: '1 elemento cambió',
    );
    return '$_temp0 de nombre a “(moved)”';
  }

  @override
  String get wsMoveAfterReindex =>
      'La búsqueda en la memoria se pone al día en unos minutos.';

  @override
  String get wsMoveAfterNothing => 'No queda nada más por hacer.';

  @override
  String get wsMoveSubTitle => 'Tus suscripciones';

  @override
  String get wsMoveSubToCloud =>
      'Los bots en Casama Cloud funcionan con tu plan de Cloud. Si pagaste una licencia Business para este servidor, cancélala cuando ya no la necesites.';

  @override
  String get wsMoveSubFromCloud =>
      'Tu plan de Casama Cloud se sigue renovando. Cancélalo cuando ya estés instalado en tu propio servidor.';

  @override
  String get wsMoveSubManage => 'Administrar plan';

  @override
  String get wsMovedTitle => 'Este espacio de trabajo se movió';

  @override
  String get wsMovedBodyCloud =>
      'Ahora está en Casama Cloud. Inicia sesión allá para continuar. Esta copia es de solo lectura.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Ahora está en $host. Inicia sesión allá para continuar. Esta copia es de solo lectura.';
  }

  @override
  String get wsMovedSignInCloud => 'Iniciar sesión en Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Abrir $host';
  }

  @override
  String get wsMovedViewOld => 'Ver la copia anterior';

  @override
  String get languageDevice => 'Idioma del dispositivo';

  @override
  String get shortcutQuickAsk => 'Pregunta rápida';

  @override
  String shortcutAskBot(String name) {
    return 'Preguntar a $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Ejecutar $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'espacio de trabajo cambiar equipo organizacion rol workspace organización';

  @override
  String get settingsWordsAboutYou =>
      'perfil nombre foto avatar pronombres sobre mi estilo respuesta datos memoria recuerdos';

  @override
  String get settingsWordsPeople =>
      'miembros invitar equipo usuarios administradores roles enlace codigo invitacion unirse quitar código';

  @override
  String get settingsWordsWorkspaceSettings =>
      'espacio de trabajo nombre icono logo cifrado memoria pagos stripe tarjeta gestores contraseñas bot extension chrome galeria acceso total permisos aprobaciones preguntar contrasenas extensión galería';

  @override
  String get settingsWordsSettingsDomains =>
      'dominio sitio web dns personalizado comprar conectar sitios';

  @override
  String get settingsWordsUsage =>
      'costo gasto dinero creditos tokens limites uso créditos límites';

  @override
  String get settingsWordsBilling =>
      'plan suscripcion mejorar pro plus max pago factura tarjeta precios suscripción';

  @override
  String get settingsWordsInviteFriends =>
      'referidos credito recompensa compartir invitaciones crédito';

  @override
  String get settingsWordsAdminConsole =>
      'consola administracion admin administración';

  @override
  String get settingsWordsAppearance =>
      'tema modo oscuro claro noche colores fuentes tamaño texto fondo pantalla estilo estilos efectos movimiento animaciones tamano haptica háptica tactil táctil vibracion vibración vibrar feedback trackpad apariencia';

  @override
  String get settingsWordsQuietHours =>
      'no molestar dnd silencio silenciar notificaciones horario';

  @override
  String get settingsWordsPushPrefsTitle =>
      'notificaciones push alertas respuestas sonidos avisos';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'llamadas telefono sonar pantalla bloqueada completa entrante contestar teléfono';

  @override
  String get settingsWordsEmailTips =>
      'correo email boletin consejos novedades cancelar suscripcion boletín suscripción';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'correo galeria resumen selecciones mensuales galería';

  @override
  String get settingsWordsNewsletterTitle =>
      'correo boletin mensual novedades suscribirse cancelar suscripcion boletín suscripción';

  @override
  String get settingsWordsWakeWord =>
      'voz oye manos libres microfono mic escuchar micrófono';

  @override
  String get settingsWordsShowBotSteps =>
      'pasos herramientas detalles progreso';

  @override
  String get settingsWordsShowReplyUsage =>
      'costo tokens precio uso por respuesta';

  @override
  String get settingsWordsCheckForUpdates =>
      'actualizar actualizaciones version descargar automatico versión automático';

  @override
  String get settingsWordsOpenAtLogin =>
      'inicio sesion arrancar abrir automaticamente sesión automáticamente';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'actividad en vivo dynamic island pantalla bloqueada otros dispositivos';

  @override
  String get settingsWordsShowBotsInNotch => 'notch barra menus dynamic island';

  @override
  String get settingsWordsNotchOnHover =>
      'notch pasar cursor raton mouse ratón';

  @override
  String get settingsWordsLanguage =>
      'idioma region español traduccion región espanol traducción';

  @override
  String get settingsWordsIntegrations =>
      'apps conectar conexiones gmail google slack calendario plugins herramientas mcp';

  @override
  String get settingsWordsSkills =>
      'habilidades catalogo instrucciones capacidades catálogo';

  @override
  String get settingsWordsCasamaLink =>
      'acceso remoto direccion tunel autoalojar telefono dirección túnel teléfono';

  @override
  String get settingsWordsServiceKeys => 'claves api buscar mapas datos';

  @override
  String get settingsWordsModelsTitle =>
      'claves api openai anthropic openrouter gemini modelos proveedores ollama modelos locales';

  @override
  String get settingsWordsModelKeys =>
      'claves api openai anthropic openrouter gemini modelos proveedores ollama modelos locales';

  @override
  String get settingsWordsAccount =>
      'correo cambiar correo contraseña cerrar sesion todos lados inicio contrasena sesión';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa dos factores autenticador totp otp codigo seguridad código';

  @override
  String get settingsWordsPairDevice =>
      'codigo qr escanear iniciar sesion vincular telefono otro dispositivo código sesión teléfono';

  @override
  String get settingsWordsPasskeys =>
      'passkey llave de acceso face id touch id huella biometria biometría';

  @override
  String get settingsWordsWidgetsTitle =>
      'widgets pantalla inicio bloqueada controles centro control fijar atajo';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'tarjetas clima unidades celsius fahrenheit ciudad inicio ubicacion moneda acciones rojo verde fuentes datos ubicación';

  @override
  String get settingsWordsAppLock =>
      'bloqueo app pin codigo face id touch id huella biometria windows hello capturas privacidad código biometría';

  @override
  String get settingsWordsPrivacy =>
      'exportar datos descargar eliminar cuenta analitica historial retencion personas bloqueadas bloquear analítica retención';

  @override
  String get settingsWordsSecrets =>
      'secretos contraseñas credenciales boveda variables entorno contrasenas bóveda';

  @override
  String get settingsWordsComputers => 'computadoras docker sandbox escritorio';

  @override
  String get settingsWordsDeviceConnections =>
      'dispositivos ubicacion salud lugares carpetas vigiladas apps navegadores extension chrome permisos telefono ubicación extensión teléfono';

  @override
  String get settingsWordsUseThisComputer =>
      'acompañante esta computadora mac archivos locales acompanante';

  @override
  String get settingsWordsHelpAndSupport =>
      'ayuda soporte contacto ticket error reporte comentarios guias comunidad github estrella codigo abierto discord ideas estado guías código';

  @override
  String get settingsWordsSignOut => 'cerrar sesion salir sesión';

  @override
  String get notifDoIt => 'Hazlo';

  @override
  String get notifNotNow => 'Ahora no';

  @override
  String get notifAllow => 'Permitir';

  @override
  String get notifDeny => 'Denegar';

  @override
  String get notifApprove => 'Aprobar';

  @override
  String get notifReview => 'Revisar';

  @override
  String get notifReply => 'Responder';

  @override
  String get notifSend => 'Enviar';

  @override
  String get notifReplyPlaceholder => 'Responder…';

  @override
  String get notifChannelReplies => 'Respuestas';

  @override
  String get notifChannelRepliesDescription =>
      'Un bot respondió algo que preguntaste';

  @override
  String get notifChannelNeedsYou => 'Te necesita';

  @override
  String get notifChannelNeedsYouDescription =>
      'Aprobaciones, contraseñas y tomas de control que esperan tus bots';

  @override
  String get notifChannelRoutines => 'Rutinas y resúmenes';

  @override
  String get notifChannelRoutinesDescription =>
      'Resultados de rutinas y el resumen de la mañana';

  @override
  String get notifChannelSuggestions => 'Sugerencias';

  @override
  String get notifChannelSuggestionsDescription =>
      'Cosas que tus bots ofrecen hacer por ti';

  @override
  String get notifChannelAccount => 'Cuenta';

  @override
  String get notifChannelAccountDescription =>
      'Créditos, proyectos y tu servidor';

  @override
  String get notifCallChannel => 'Llamadas';

  @override
  String get notifCallLive => 'En una llamada';

  @override
  String get notifCallMuted => 'Silenciado';

  @override
  String get notifCallReconnecting => 'Reconectando';

  @override
  String get notifCallMute => 'Silenciar';

  @override
  String get notifCallUnmute => 'Activar micrófono';

  @override
  String get notifCallEnd => 'Finalizar llamada';

  @override
  String get notifFromYourWatch => 'Desde tu reloj';

  @override
  String get notifLiveOpen => 'Abrir';

  @override
  String get notifLiveStop => 'Detener';

  @override
  String get notifLiveReview => 'Revisar';

  @override
  String get notifLiveAllow => 'Permitir';

  @override
  String get notifLiveDeny => 'Denegar';

  @override
  String get notifLiveNeedsOk => 'Necesita tu confirmación';

  @override
  String get notifLiveNeedsYou => 'Te necesita';

  @override
  String get notifLiveWorking => 'Trabajando';

  @override
  String get notifLiveTakeOver => 'Quiere que tomes el control';

  @override
  String get notifLiveFinished => 'Terminado';

  @override
  String get notifLiveProblem => 'Se detuvo con un problema';

  @override
  String get notifLiveBotWorking => 'Un bot está trabajando';

  @override
  String get notifLiveBotsAtWork => 'Bots trabajando';

  @override
  String get notifLiveStepOne => '1 paso';

  @override
  String notifLiveSteps(int count) {
    return '$count pasos';
  }

  @override
  String get notifAlarmTitle => 'Alarma de Casama';

  @override
  String get notifAlarmStop => 'Detener';

  @override
  String get widgetIosNeedsYouDescription =>
      'Mira qué bots te están esperando y responde las solicitudes simples.';

  @override
  String get widgetIosBotDescription =>
      'Sigue de cerca lo que está haciendo uno de tus bots.';

  @override
  String get widgetIosAskDescription =>
      'Pregunta a un bot o inicia una llamada con un toque, con ideas para probar.';

  @override
  String get widgetIosRoutinesDescription =>
      'Mira qué se ejecuta después y ejecuta una rutina ahora.';

  @override
  String get widgetIosTodayDescription =>
      'Tu día en un solo lugar: lo que requiere tu atención, lo que sigue y tus créditos.';

  @override
  String get widgetIosBriefDescription =>
      'Lee lo que tu bot te contó esta mañana.';

  @override
  String get widgetIosLibraryDescription =>
      'Abre lo que tus bots crearon últimamente.';

  @override
  String get widgetIosTasksDescription =>
      'Mira cómo va el tablero, con lo que te espera primero.';

  @override
  String get widgetIosCreditsDescription =>
      'Revisa cuánto de tus créditos usaste.';

  @override
  String get widgetIosInlineDescription =>
      'Mira lo más importante, encima del reloj.';

  @override
  String get widgetIosCanvasDescription =>
      'Muestra lo que ponen ahí tus bots: un versículo, una cuenta regresiva, una racha, una lista o una imagen.';

  @override
  String get widgetMacNeedsYouDescription =>
      'Mira qué bots te están esperando.';

  @override
  String get widgetMacRoutinesDescription => 'Mira qué se ejecuta después.';

  @override
  String get widgetAskCasama => 'Preguntar a Casama';

  @override
  String get widgetControlAskDescription =>
      'Abre Pregunta rápida con el teclado listo.';

  @override
  String get widgetTalkToBot => 'Hablar con un bot';

  @override
  String widgetTalkToName(String name) {
    return 'Hablar con $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Inicia una llamada de voz con el bot que elijas.';

  @override
  String get widgetRunRoutine => 'Ejecutar una rutina';

  @override
  String get widgetControlRunDescription =>
      'Ejecuta la rutina que elijas, sin abrir Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Pregunta cualquier cosa a $bot';
  }

  @override
  String get widgetFallbackBrief => 'Resumen de la mañana';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot terminó $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'Al $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Nada programado';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot quiere que tomes el control';
  }

  @override
  String get widgetFallbackDay => 'día';

  @override
  String get widgetFallbackDays => 'días';

  @override
  String get widgetSampleVerse => 'Estad quietos, y conoced que yo soy Dios.';

  @override
  String get widgetSampleVerseRef => 'Sal 46:10';

  @override
  String get widgetSampleVerseShort =>
      'Estad quietos, y conoced que yo soy Dios. · Sal 46:10';

  @override
  String get widgetSampleVerseTiny => 'Estad quietos, y conoced…';

  @override
  String get widgetSampleCanvasName => 'Versículo diario';

  @override
  String get widgetSampleNeedFlights => 'Buscar vuelos a Lisboa';

  @override
  String get widgetSampleNeedDentist => '¿Pasar el dentista al viernes?';

  @override
  String get widgetSampleBotText =>
      'Tres correos necesitan respuesta y la factura de Acme tiene dos días de vencida.';

  @override
  String get widgetSampleStep => 'Leyendo tu bandeja de entrada';

  @override
  String get widgetSampleRoutineInbox => 'Repaso de bandeja de entrada';

  @override
  String get widgetSampleRoutineBrief => 'Resumen de la mañana';

  @override
  String get widgetSampleRoutineWeekly => 'Informe semanal';

  @override
  String get widgetSampleWeekdays => 'Entre semana';

  @override
  String get widgetSampleEveryDay => 'Todos los días';

  @override
  String get widgetSampleFridays => 'Viernes a las 16:00';

  @override
  String get widgetSampleBrief =>
      'Tres correos necesitan respuesta y la factura de Acme tiene dos días de vencida. Lluvia desde las 15:00, así que sal temprano para recoger a las 16:30. Tu primera reunión es a las 10:00 con Dana.';

  @override
  String get widgetSamplePricing => 'Página de precios del T4';

  @override
  String get widgetSampleLogoIdeas => 'Ideas de logo';

  @override
  String get widgetSampleTripPlan => 'Plan de viaje';

  @override
  String get widgetSampleLaunchPost => 'Redactar la publicación de lanzamiento';

  @override
  String get widgetSampleStarterInbox => 'Resume mi bandeja de entrada';

  @override
  String get widgetSampleStarterFriday => 'Planifica mi viernes';

  @override
  String get widgetSampleWorking => 'Trabajando · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'Quedan US\$5.70';

  @override
  String get widgetSampleSpentToday => 'US\$0.80 hoy';

  @override
  String get widgetSampleMorning =>
      'Buenos días. Dos reuniones hoy, la primera a las 10:00 con el equipo de diseño. Lluvia después de las 15:00, así que lleva abrigo. Tu vuelo a Lisboa está confirmado para el viernes.';

  @override
  String get widgetSampleLisbonPlan => 'Plan de viaje a Lisboa';

  @override
  String get widgetSampleAgo => 'Milo · hace 2 h';

  @override
  String get widgetSampleLaunchEmail => 'Redactar el correo de lanzamiento';

  @override
  String get widgetSampleInReviewBy => 'En revisión · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo quiere buscar precios de vuelos a Lisboa';

  @override
  String get widgetSampleUpNextAt => 'A continuación · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · en 18 min';

  @override
  String get widgetSampleDate => 'Miércoles, 18 de noviembre';

  @override
  String get widgetSampleNeedsCount => 'Te necesita · 1';

  @override
  String get widgetSampleSearchFlights => 'Buscar precios de vuelos a Lisboa';

  @override
  String get widgetSampleAskAda => 'Preguntar a Ada';

  @override
  String get widgetSampleAskMilo => 'Preguntar a Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Planifica mi día';

  @override
  String get widgetSampleWhatsNew => '✉️ ¿Qué hay de nuevo en mi bandeja?';

  @override
  String get widgetAndroidBotDescription =>
      'Sigue lo que está haciendo un bot ahora mismo';

  @override
  String get widgetAndroidTodayDescription =>
      'Ten todo tu día con tus bots en un solo lugar';

  @override
  String get widgetAndroidBriefDescription =>
      'Lee tu resumen de la mañana de un vistazo';

  @override
  String get widgetAndroidLibraryDescription =>
      'Abre lo que tus bots crearon últimamente';

  @override
  String get widgetAndroidTasksDescription =>
      'Sigue cómo va tu tablero de tareas';

  @override
  String get widgetAndroidCreditsDescription => 'Revisa cuánto usaste';

  @override
  String get widgetAndroidCanvasDescription =>
      'Muestra lo que ponen ahí tus bots, desde un versículo hasta una cuenta regresiva';

  @override
  String get widgetConfigBotTitle => 'Elige un bot';

  @override
  String get widgetConfigRoutinesTitle => 'Elige rutinas';

  @override
  String get widgetConfigRoutinesHint =>
      'Elige hasta cuatro, para las que inicias manualmente';

  @override
  String get widgetConfigAutomatic => 'Automático';

  @override
  String get widgetConfigAutomaticHint =>
      'Las próximas ejecuciones, entre todos tus bots';

  @override
  String get widgetConfigDone => 'Listo';

  @override
  String get widgetConfigSignedOutTitle => 'Nada que elegir todavía';

  @override
  String get widgetConfigSignedOut =>
      'Abre Casama e inicia sesión, luego elige aquí.';

  @override
  String get widgetConfigCanvasTitle => 'Elige un lienzo';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'El que un bot configuró más recientemente';

  @override
  String get widgetConfigCanvasNone =>
      'Todavía no hay lienzos. Pídele a un bot que ponga algo aquí.';

  @override
  String get iosUsageTracking =>
      'Si lo permites, Casama avisa a Meta cuando instalas la app, te registras o te suscribes después de ver un anuncio de Casama en Facebook o Instagram, para medir qué anuncios funcionan. Casama nunca muestra anuncios ni comparte tus chats o archivos.';

  @override
  String get iosUsageContacts =>
      'Tus bots pueden buscar personas que conoces, solo cuando activas Contactos en Conexiones del dispositivo.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama abre tu fototeca cuando eliges una foto para enviar a un bot o para tu perfil.';

  @override
  String get iosUsageLocationAlways =>
      'Avisa a tus bots cuando llegas a tus lugares guardados o sales de ellos, incluso con Casama cerrado. Solo se comparten el nombre del lugar y la hora, nunca tu ruta.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Guarda los lugares que nombres, como Casa o Trabajo, y deja que tus bots te recuerden cuándo salir para tu próxima cita. Solo se usa si activas Lugares en Conexiones del dispositivo.';

  @override
  String get iosUsageCamera =>
      'Casama usa la cámara cuando tomas una foto para enviar a un bot o para tu perfil.';

  @override
  String get iosUsageCalendars =>
      'Tus bots pueden responder preguntas sobre tu agenda y agregar eventos, solo cuando activas Calendario en Conexiones del dispositivo.';

  @override
  String get iosUsageSpeech =>
      'Cuando no se puede acceder al servicio de dictado de Casama, el reconocimiento de voz de tu dispositivo convierte lo que dices en texto.';

  @override
  String get iosUsageAlarmKit =>
      'Tus bots pueden configurar alarmas y temporizadores que suenan incluso en modo silencio, pero solo si permites Alarmas en Conexiones del dispositivo.';

  @override
  String get iosUsageHomeKit =>
      'Cuando permites Casa en Conexiones del dispositivo, tus bots pueden consultar y controlar tu hogar en HomeKit; los cambios siempre piden aprobación primero.';

  @override
  String get iosUsageMicrophone =>
      'Casama usa el micrófono para dictado y llamadas en vivo con tus bots. Solo después de que aceptes, tu voz va a proveedores de IA para responderte: Google Gemini para llamadas, OpenAI para convertir el dictado en texto.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama solo lee datos de Apple Salud; nunca escribe en ella.';

  @override
  String get iosUsageFaceId =>
      'Casama usa Face ID para desbloquear la app cuando activas el bloqueo de la app y para confirmar acciones riesgosas.';

  @override
  String get iosUsageHealthShare =>
      'Tus bots pueden ver resúmenes diarios de tu sueño, actividad, entrenamientos y frecuencia cardíaca en Apple Salud, solo cuando activas Apple Salud en Conexiones del dispositivo. Casama nunca escribe en Apple Salud y nunca usa esos datos para anuncios.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama graba tu voz cuando le preguntas algo a un bot y la envía a tu servidor de Casama, donde un proveedor de IA (OpenAI, en Casama Cloud) la convierte en texto para tu bot.';

  @override
  String get macUsageContacts =>
      'Tus bots pueden buscar personas que conoces, solo cuando activas Contactos en Conexiones del dispositivo.';

  @override
  String get macUsageSpeech =>
      'Cuando no se puede acceder al servicio de dictado de Casama, el reconocimiento de voz de tu dispositivo convierte lo que dices en texto.';

  @override
  String get macUsageMicrophone =>
      'Casama usa el micrófono para dictado y llamadas en vivo con tus bots. Solo después de que aceptes, tu voz va a proveedores de IA para responderte: Google Gemini para llamadas, OpenAI para convertir el dictado en texto.';

  @override
  String get macUsageAppleEvents =>
      'Pregunta rápida lee el título de la ventana frontal y la pestaña actual de tu navegador solo cuando presionas el atajo.';

  @override
  String get nativeNameFileProvider => 'Computadoras de Casama';

  @override
  String get nativeNameNotifications => 'Notificaciones de Casama';

  @override
  String get nativeNameSafari => 'Casama para Safari';

  @override
  String get nativeNameAskCasama => 'Preguntar a Casama';

  @override
  String get nativeComputer => 'Computadora';

  @override
  String get nativeSafariSignInIos =>
      'Abre Casama en este dispositivo -> Ajustes -> Iniciar sesión en otro dispositivo, o pega abajo un enlace de inicio de sesión.';

  @override
  String get nativeSafariSignInMac =>
      'Abre Casama en esta Mac -> Ajustes -> Iniciar sesión en otro dispositivo, o pega abajo un enlace de inicio de sesión.';

  @override
  String get linuxDesktopComment =>
      'Bots que hacen el trabajo, en cada pantalla tuya';

  @override
  String get linuxDesktopKeywords => 'IA;asistente;agente;bot;chat;';

  @override
  String macMenuAbout(String appName) {
    return 'Acerca de $appName';
  }

  @override
  String get macMenuPreferences => 'Preferencias…';

  @override
  String get macMenuServices => 'Servicios';

  @override
  String macMenuHide(String appName) {
    return 'Ocultar $appName';
  }

  @override
  String get macMenuHideOthers => 'Ocultar otros';

  @override
  String get macMenuShowAll => 'Mostrar todo';

  @override
  String macMenuQuit(String appName) {
    return 'Salir de $appName';
  }

  @override
  String get macMenuEdit => 'Edición';

  @override
  String get macMenuUndo => 'Deshacer';

  @override
  String get macMenuRedo => 'Rehacer';

  @override
  String get macMenuCut => 'Cortar';

  @override
  String get macMenuCopy => 'Copiar';

  @override
  String get macMenuPaste => 'Pegar';

  @override
  String get macMenuPasteAndMatchStyle => 'Pegar con el mismo estilo';

  @override
  String get macMenuDelete => 'Eliminar';

  @override
  String get macMenuSelectAll => 'Seleccionar todo';

  @override
  String get macMenuFind => 'Buscar';

  @override
  String get macMenuFindEllipsis => 'Buscar…';

  @override
  String get macMenuFindAndReplace => 'Buscar y reemplazar…';

  @override
  String get macMenuFindNext => 'Buscar siguiente';

  @override
  String get macMenuFindPrevious => 'Buscar anterior';

  @override
  String get macMenuUseSelectionForFind => 'Usar selección para buscar';

  @override
  String get macMenuJumpToSelection => 'Ir a la selección';

  @override
  String get macMenuSpellingAndGrammar => 'Ortografía y gramática';

  @override
  String get macMenuSpelling => 'Ortografía';

  @override
  String get macMenuShowSpelling => 'Mostrar ortografía y gramática';

  @override
  String get macMenuCheckDocumentNow => 'Verificar documento ahora';

  @override
  String get macMenuCheckSpellingWhileTyping =>
      'Verificar ortografía mientras se escribe';

  @override
  String get macMenuCheckGrammar => 'Verificar gramática con la ortografía';

  @override
  String get macMenuCorrectSpelling => 'Corregir ortografía automáticamente';

  @override
  String get macMenuSubstitutions => 'Sustituciones';

  @override
  String get macMenuShowSubstitutions => 'Mostrar sustituciones';

  @override
  String get macMenuSmartCopyPaste => 'Copiado/pegado inteligente';

  @override
  String get macMenuSmartQuotes => 'Comillas tipográficas';

  @override
  String get macMenuSmartDashes => 'Guiones inteligentes';

  @override
  String get macMenuSmartLinks => 'Enlaces inteligentes';

  @override
  String get macMenuDataDetectors => 'Detectores de datos';

  @override
  String get macMenuTextReplacement => 'Reemplazar texto';

  @override
  String get macMenuTransformations => 'Transformaciones';

  @override
  String get macMenuMakeUpperCase => 'Todo en mayúsculas';

  @override
  String get macMenuMakeLowerCase => 'Todo en minúsculas';

  @override
  String get macMenuCapitalize => 'Mayúsculas iniciales';

  @override
  String get macMenuSpeech => 'Lectura';

  @override
  String get macMenuStartSpeaking => 'Iniciar lectura';

  @override
  String get macMenuStopSpeaking => 'Detener lectura';

  @override
  String get macMenuView => 'Visualización';

  @override
  String get macMenuEnterFullScreen => 'Ver en pantalla completa';

  @override
  String get macMenuWindow => 'Ventana';

  @override
  String get macMenuMinimize => 'Minimizar';

  @override
  String get macMenuZoom => 'Zoom';

  @override
  String get macMenuBringAllToFront => 'Traer todo al frente';

  @override
  String get macMenuHelp => 'Ayuda';

  @override
  String get macMenuCheckForUpdates => 'Buscar actualizaciones…';

  @override
  String get macMenuSettings => 'Ajustes…';

  @override
  String get macMenuFile => 'Archivo';

  @override
  String get macMenuNewChat => 'Nuevo chat';

  @override
  String get macMenuNewBot => 'Nuevo bot…';

  @override
  String get macMenuQuickAsk => 'Pregunta rápida';

  @override
  String get macMenuSearch => 'Buscar…';

  @override
  String get macMenuCloseWindow => 'Cerrar ventana';

  @override
  String get macMenuGo => 'Ir';

  @override
  String get macMenuBots => 'Bots';

  @override
  String get macMenuInbox => 'Buzón';

  @override
  String get macMenuBoard => 'Tablero';

  @override
  String get macMenuComputer => 'Computadora';

  @override
  String get macMenuPages => 'Páginas';

  @override
  String get macMenuCasamaHelp => 'Ayuda de Casama';

  @override
  String get macMenuSendFeedback => 'Enviar comentarios…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Rutina';

  @override
  String get siriRoutines => 'Rutinas';

  @override
  String get siriCanvas => 'Lienzo';

  @override
  String get siriAutomatic => 'Automático';

  @override
  String get siriAutomaticSubtitle =>
      'Lo que un bot configuró más recientemente';

  @override
  String get siriChooseCanvas => 'Elegir un lienzo';

  @override
  String get siriChooseCanvasDescription =>
      'Muestra lo último que colocó un bot, o un lienzo concreto.';

  @override
  String get siriChooseBot => 'Elegir un bot';

  @override
  String get siriChooseBotDescription =>
      'Elige el bot que muestra este widget.';

  @override
  String get siriChooseRoutines => 'Elegir rutinas';

  @override
  String get siriChooseRoutinesDescription =>
      'Muestra las próximas ejecuciones o hasta cuatro rutinas que elijas.';

  @override
  String get siriOpenCasama => 'Abrir Casama';

  @override
  String get siriWhere => 'Dónde';

  @override
  String get siriTalkToBot => 'Hablar con un bot';

  @override
  String get siriTalkToBotDescription =>
      'Inicia una llamada de voz con el bot que elijas.';

  @override
  String get siriRunRoutine => 'Ejecutar una rutina';

  @override
  String get siriRunRoutineControlDescription =>
      'Ejecuta la rutina que elijas, sin abrir Casama.';

  @override
  String get siriCallAction => 'Acción de llamada';

  @override
  String get siriAction => 'Acción';

  @override
  String get siriStopBot => 'Detener el bot';

  @override
  String get siriRun => 'Ejecución';

  @override
  String get siriAnswerRequest => 'Responder la solicitud de un bot';

  @override
  String get siriRequest => 'Solicitud';

  @override
  String get siriAllow => 'Permitir';

  @override
  String get siriFromWidget => 'Desde un widget';

  @override
  String get siriRunRoutineNow => 'Ejecutar una rutina ahora';

  @override
  String get siriAcceptSuggestion => 'Hacer lo que sugiere un bot';

  @override
  String get siriSuggestion => 'Sugerencia';

  @override
  String get siriBotStatusDescription => 'Cómo va un bot y qué está haciendo';

  @override
  String get siriNextRoutineDescription =>
      'La próxima rutina y cuándo se ejecuta';

  @override
  String get siriAskCasama => 'Preguntar a Casama';

  @override
  String get siriAskVoiceDescription => 'Preguntar algo por voz a un bot';

  @override
  String get siriWhatWaiting => 'Qué espera tu confirmación';

  @override
  String get siriAsk => 'Preguntar';

  @override
  String get siriShortNeedsYou => 'Te necesita';

  @override
  String get siriOpeningToFinish => 'Abriendo Casama para terminar.';

  @override
  String get siriName => 'Nombre';

  @override
  String get siriTitle => 'Título';

  @override
  String get siriChat => 'Chat';

  @override
  String get siriBotSubtitle =>
      'Un bot en Casama, un asistente de IA con el que chateas';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Una rutina que $bot ejecuta en Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Un chat con $bot en Casama';
  }

  @override
  String get siriBotInCasama => 'Bot en Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Rutina · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Chat con $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'rutina';

  @override
  String get siriKeywordChat => 'chat';

  @override
  String get siriAskBot => 'Preguntar a un bot';

  @override
  String get siriAskBotDescription =>
      'Envía una pregunta a uno de tus bots de Casama (asistentes de IA) en un chat nuevo y lee la respuesta. Si no nombras un bot, responde el último con el que hablaste.';

  @override
  String get siriCategoryBots => 'Bots';

  @override
  String get siriAskBotParamDescription =>
      'A qué bot preguntar. Déjalo vacío para el último con el que hablaste.';

  @override
  String get siriQuestion => 'Pregunta';

  @override
  String get siriQuestionDescription =>
      'Qué preguntar al bot, con tus propias palabras.';

  @override
  String get siriWhatShouldIAsk => '¿Qué quieres que pregunte?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Preguntar a $bot: $question';
  }

  @override
  String get siriRestOnScreen => 'El resto está en la pantalla.';

  @override
  String get siriRestOnScreenEllipsis => '… El resto está en la pantalla.';

  @override
  String get siriRunRoutineDescription =>
      'Ejecuta ahora una de las rutinas de tus bots de Casama. El resultado llega en la app y como notificación, igual que cuando la rutina se ejecuta sola.';

  @override
  String get siriRoutineParamDescription => 'Qué rutina ejecutar ahora.';

  @override
  String siriSummaryRun(String routine) {
    return 'Ejecutar $routine';
  }

  @override
  String get siriWhatNeedsMe => 'Qué me necesita';

  @override
  String get siriWhatNeedsMeDescription =>
      'Dice cuántas cosas te están esperando en Casama: la solicitud de un bot para tu confirmación, una toma de control o una sugerencia. Respóndelas en la app.';

  @override
  String get siriOpenBot => 'Abrir un bot';

  @override
  String get siriOpenBotDescription =>
      'Abre tu chat con uno de tus bots de Casama.';

  @override
  String get siriOpenBotPersonDescription =>
      'Abre el chat de un bot de Casama.';

  @override
  String get siriOpenChat => 'Abrir un chat';

  @override
  String get siriOpenChatDescription =>
      'Abre uno de tus chats con un bot de Casama.';

  @override
  String get siriOpenRoutine => 'Abrir el bot de una rutina';

  @override
  String get siriOpenRoutineDescription =>
      'Abre el bot que ejecuta una de tus rutinas de Casama.';

  @override
  String get siriTalkDescription =>
      'Abre el modo de voz con uno de tus bots de Casama. Disponible en el botón Acción.';

  @override
  String get siriAskGetReply => 'Preguntar a un bot y obtener la respuesta';

  @override
  String get siriAskGetReplyDescription =>
      'Envía una pregunta a un bot de Casama y devuelve el texto de su respuesta para encadenarlo en Atajos.';

  @override
  String get siriGetLastReply => 'Obtener la última respuesta';

  @override
  String get siriGetLastReplyDescription =>
      'Devuelve el texto de la respuesta más reciente de un chat con un bot de Casama.';

  @override
  String get siriStartComputer => 'Iniciar una computadora';

  @override
  String get siriStartComputerDescription =>
      'Activa una computadora de Casama después de confirmar.';

  @override
  String get siriComputerName => 'Nombre de la computadora';

  @override
  String get siriYourComputer => 'tu computadora de Casama';

  @override
  String siriStartConfirm(String computer) {
    return '¿Iniciar $computer?';
  }

  @override
  String get siriOpenToStartComputer =>
      'Abre Casama para iniciar tu computadora.';

  @override
  String get siriFocusTitle => 'Definir filtro de Enfoque de Casama';

  @override
  String get siriFocusDescription =>
      'Muestra solo los bots elegidos y, opcionalmente, retiene los avisos proactivos mientras este Enfoque esté activo.';

  @override
  String get siriFocusBots => 'Bots para mostrar';

  @override
  String get siriFocusHold => 'Retener avisos proactivos';

  @override
  String get siriFocusShowOne => 'Mostrar 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Mostrar $count bots';
  }

  @override
  String get siriFocusHoldCheckIns => 'Retener avisos';

  @override
  String get siriFocusAllowCheckIns => 'Permitir avisos';

  @override
  String get siriFocusAllBots => 'Todos los bots';

  @override
  String get siriFocusAllVisible => 'Todos los bots visibles';

  @override
  String get siriToolAsk => 'Preguntar a un bot de Casama';

  @override
  String get siriToolAskDescription =>
      'Hace una pregunta a uno de los bots de Casama de la persona y devuelve su respuesta.';

  @override
  String get siriCategoryAssistants => 'Asistentes';

  @override
  String get siriToolBotDescription => 'A qué bot de Casama preguntar.';

  @override
  String get siriToolQuestionDescription => 'Qué preguntar al bot.';

  @override
  String get siriToolRun => 'Ejecutar una rutina de Casama';

  @override
  String get siriToolRunDescription =>
      'Ejecuta una rutina guardada de Casama después de confirmar con la persona.';

  @override
  String get siriCategoryAutomation => 'Automatización';

  @override
  String get siriToolRoutineDescription => 'La rutina que se va a ejecutar.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return '¿Ejecutar $routine con $bot?';
  }

  @override
  String get siriToolNeeds => 'Qué necesita mi atención en Casama';

  @override
  String get siriToolNeedsDescription =>
      'Comprueba cuántas aprobaciones, tomas de control o sugerencias están esperando en Casama.';

  @override
  String get siriOpenToCheck => 'Abre Casama para revisar qué te necesita.';

  @override
  String get siriToolStop => 'Detener un bot de Casama';

  @override
  String get siriToolStopDescription =>
      'Detiene un bot que está ejecutando una tarea en Casama ahora mismo.';

  @override
  String get siriToolStopBotDescription => 'El bot que se va a detener.';

  @override
  String siriStoppedBot(String bot) {
    return 'Se detuvo a $bot.';
  }

  @override
  String get siriToolCall => 'Llamar a un bot de Casama';

  @override
  String get siriToolCallDescription =>
      'Abre Casama e inicia una llamada de voz en vivo con el bot elegido.';

  @override
  String get siriCategoryCommunication => 'Comunicación';

  @override
  String get siriToolCallBotDescription => 'El bot al que llamar.';

  @override
  String siriCalling(String bot) {
    return 'Llamando a $bot.';
  }

  @override
  String siriBotIn(String app) {
    return 'Un bot en $app';
  }

  @override
  String get siriMe => 'Yo';

  @override
  String get siriABot => 'un bot';

  @override
  String get siriFavorited => 'Favorito';

  @override
  String siriSentTo(String bot) {
    return 'Enviado a $bot';
  }

  @override
  String get siriMessage => 'Mensaje';

  @override
  String get siriNone => 'Ninguno';

  @override
  String get siriErrorOneBot =>
      'Casama envía mensajes a un bot a la vez. ¿Qué bot?';

  @override
  String get siriErrorTextOnly =>
      'Siri puede enviar texto a un bot. Agrega archivos, imágenes y lugares en Casama.';

  @override
  String get siriErrorNoBot => 'No encontré ese bot en Casama.';

  @override
  String get siriWhatShouldISend => '¿Qué debo enviar?';

  @override
  String get siriAskCasamaBot => 'Preguntar a un bot de Casama';

  @override
  String siriAskName(String bot) {
    return 'Preguntar a $bot';
  }

  @override
  String get siriAskAboutThis => 'Preguntar a Casama sobre esto';

  @override
  String siriPhraseAsk(String app) {
    return 'Pregunta a $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Pregunta a un bot en $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Pregunta a $bot en $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Habla con un bot en $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Habla con $bot en $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Ejecuta una rutina en $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Ejecuta $routine en $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'Qué necesita mi atención en $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'Qué tengo pendiente en $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Pregúntale algo a $app';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Ejecuta mi $routine en $app';
  }

  @override
  String get siriABotSubject => 'Un bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot necesita tu confirmación.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot necesita que tomes el control.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot tiene una sugerencia.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot te necesita.';
  }

  @override
  String get siriOneThingNeedsYou => 'Una cosa te necesita.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count cosas te necesitan.';
  }

  @override
  String get siriUnlockPhone => 'Desbloquea tu teléfono e inténtalo de nuevo.';

  @override
  String get siriGeminiOff =>
      'Gemini está desactivado para Casama en este teléfono (Casama → Ajustes → Privacidad).';

  @override
  String get suggestionActionTurnOn => 'Activar';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Recordarme $date';
  }

  @override
  String get suggestionActionPickTime => 'Elegir una hora';

  @override
  String get suggestionActionPutAwayAll => 'Descartar todas';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Descartar las $count ideas',
      one: 'Descartar 1 idea',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Abrir';

  @override
  String get suggestionActionGotIt => 'Entendido';

  @override
  String get suggestionActionLater => 'Más tarde';

  @override
  String get suggestionActionSomethingElse => 'Otra cosa';

  @override
  String get suggestionTurnedOn => 'Activado';

  @override
  String suggestionReminderSet(String date) {
    return 'Recordatorio programado para $date';
  }

  @override
  String get suggestionSnoozed => 'Guardada para después';

  @override
  String get suggestionSnoozedExpired => 'Descartada – pospuesta dos veces';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ideas descartadas',
      one: '1 idea descartada',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Deshacer';

  @override
  String get suggestionLaterTomorrow => 'Mañana por la mañana';

  @override
  String get suggestionLaterEvening => 'Esta tarde';

  @override
  String get suggestionLaterNextWeek => 'La próxima semana';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ideas más en espera',
      one: '1 idea más en espera',
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
      other: '$name · $count resultados de rutinas hoy',
      one: '$name · 1 resultado de rutina hoy',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count actualizaciones hoy',
      one: '$name · 1 actualización hoy',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados de rutinas hoy',
      one: '1 resultado de rutina hoy',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actualizaciones hoy',
      one: '1 actualización hoy',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Desde ayer: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '1 página',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados de rutinas',
      one: '1 resultado de rutina',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count actualizaciones',
      one: '1 actualización',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Activar';

  @override
  String get notifOpen => 'Abrir';

  @override
  String get notifGotIt => 'Entendido';

  @override
  String get notifRemindMe => 'Recordarme';

  @override
  String get notifLater => 'Más tarde';

  @override
  String get watchTurnOn => 'Activar';

  @override
  String get watchGotIt => 'Entendido';

  @override
  String get watchRemindMe => 'Recordar';

  @override
  String get watchLater => 'Más tarde';

  @override
  String get watchOpen => 'Abrir';

  @override
  String get costModeLabel => 'Vista de costes';

  @override
  String get costModePaid => 'Pagado';

  @override
  String get costModeEstimated => 'Estimado';

  @override
  String get costPaid => 'Pagado';

  @override
  String get costEstimatedTitle => 'Estimado';

  @override
  String get costMarginListPrices => 'Margen a precios de lista';

  @override
  String get costFreePlan => 'Plan gratuito';

  @override
  String costFreePlanCalls(String count) {
    return 'Plan gratuito · $count llamadas';
  }

  @override
  String costCapUsage(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String get costShareOfOwnServers => 'Parte de servidores propios';

  @override
  String costIncludedCredit(String amount) {
    return '$amount/mes incluido';
  }

  @override
  String costAtListPrices(String amount) {
    return '$amount a precios de lista';
  }

  @override
  String costEmptyPaidDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'No se pagó nada en estos $days días',
      one: 'No se pagó nada en este día',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyPaidRange => 'No se pagó nada en estos días';

  @override
  String get costEmptyPaidFiltered =>
      'No se pagó nada que coincida con estos filtros';

  @override
  String costSpokenPaid(String amount) {
    return 'pagado $amount';
  }

  @override
  String costSpokenEstimated(String amount) {
    return 'estimado $amount';
  }

  @override
  String costSpendCardPaidSemantics(
    String paid,
    String charged,
    String margin,
  ) {
    return 'Gasto en los últimos 30 días: $paid pagado, $charged cobrado, $margin margen a precios de lista';
  }

  @override
  String get vendorBillingFree => 'Plan gratuito';

  @override
  String get vendorBillingMetered => 'Por uso';

  @override
  String get vendorBillingFreeHelp =>
      'El uso se detiene en el límite y cuenta como 0 \$ pagados.';

  @override
  String get vendorBillingMeteredHelp => 'El uso se paga al coste registrado.';

  @override
  String get vendorIncludedUsd => 'Crédito mensual incluido (USD)';

  @override
  String get vendorIncludedUsdHelp =>
      'El uso hasta este importe cada mes natural cuenta como 0 \$ pagados.';

  @override
  String upgradePromptIncludedIn(String plan) {
    return 'Incluido en $plan y superiores.';
  }

  @override
  String get payFeedbackTitle => 'Pregunta rápida';

  @override
  String get payFeedbackPrompt =>
      '¿Qué haría que para ti valiera la pena pagar por Casama?';

  @override
  String get payFeedbackHint =>
      'Una función, un límite o un flujo de trabajo por el que pagarías con gusto…';

  @override
  String get suggestBrowserLookup =>
      'Busca en un navegador las principales noticias de tecnología de hoy y resume las 3 mejores historias.';

  @override
  String get suggestMorningBrief =>
      'Prepara mi resumen de la mañana para mañana a las 8:00 con mis prioridades y el clima.';
}
