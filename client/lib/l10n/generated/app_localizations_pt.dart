// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

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
  String get tabTitleCall => 'Chamada';

  @override
  String get tabTitleProject => 'Projeto';

  @override
  String get tabTitleGroupChat => 'Chat em grupo';

  @override
  String get loading => 'Carregando…';

  @override
  String get retry => 'Tente novamente';

  @override
  String get keepGoing => 'Continuar';

  @override
  String get keepGoingMessage => 'Continue de onde você parou.';

  @override
  String get startOver => 'Recomeçar';

  @override
  String get continueRunHint =>
      'Continua de onde parou, com um novo orçamento, em vez de recomeçar o pedido.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get delete => 'Excluir';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Fechar';

  @override
  String get create => 'Criar';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get somethingWentWrong => 'Algo deu errado';

  @override
  String get errorViewHint => 'Reiniciar o app deve resolver.';

  @override
  String get signInTitle => 'Entrar no Casama';

  @override
  String get signUpTitle => 'Crie sua conta';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Senha';

  @override
  String get signIn => 'Entrar';

  @override
  String get signUp => 'Criar conta';

  @override
  String get haveAccount => 'Já tem conta? Entre';

  @override
  String get needAccount => 'Primeira vez aqui? Crie uma conta';

  @override
  String get magicLink => 'Enviar link de acesso por e-mail';

  @override
  String get magicLinkSent => 'Confira seu e-mail para acessar o link.';

  @override
  String get continueWithGoogle => 'Continuar com Google';

  @override
  String get continueWithApple => 'Continuar com Apple';

  @override
  String get continueWithEmail => 'Continuar com e-mail';

  @override
  String get moreSignInOptions => 'Mais opções';

  @override
  String get usePasswordInstead => 'Usar senha';

  @override
  String get checkInboxTitle => 'Confira sua caixa de entrada';

  @override
  String checkInboxBody(String email) {
    return 'Enviamos um link de acesso e um código de 6 dígitos para $email. Toque no link ou digite o código aqui.';
  }

  @override
  String get emailCodeLabel => 'Código de 6 dígitos';

  @override
  String get resendLink => 'Enviar novamente';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Enviar novamente em ${secondsString}s';
  }

  @override
  String get useDifferentEmail => 'Usar outro e-mail';

  @override
  String get authWrongPassword =>
      'Este e-mail e esta senha não combinam. Tente novamente ou entre com um link por e-mail.';

  @override
  String get authEmailNotConfirmed =>
      'Confirme seu e-mail primeiro: abra o link que enviamos para você.';

  @override
  String get authCodeInvalid =>
      'Este código está errado ou expirou. Confira o e-mail mais recente ou envie um novo.';

  @override
  String get authTooManyTries =>
      'Muitas tentativas. Aguarde um minuto e tente novamente.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds segundos',
      one: '$seconds segundo',
    );
    return 'Muitas solicitações ao mesmo tempo. Tente novamente em $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'Você já pode tentar novamente.';

  @override
  String computerInUseBy(String name) {
    return '$name está usando este computador';
  }

  @override
  String get authAccountExists =>
      'Já existe uma conta com este e-mail. Entre nela.';

  @override
  String get authSignupDisabled =>
      'Este servidor não está aceitando novos cadastros.';

  @override
  String get useMagicLinkInstead => 'Enviar link por e-mail';

  @override
  String get invalidEmail => 'Digite um e-mail válido';

  @override
  String get passwordTooShort => 'Use pelo menos 6 caracteres';

  @override
  String get signOut => 'Sair';

  @override
  String get onboardingTitle => 'Configure seu espaço de trabalho';

  @override
  String get createWorkspace => 'Criar um espaço de trabalho';

  @override
  String get workspaceName => 'Nome do espaço de trabalho';

  @override
  String get joinWorkspace => 'Entrar com código de convite';

  @override
  String get inviteCode => 'Código de convite';

  @override
  String get join => 'Entrar';

  @override
  String get addModelKeyTitle => 'Adicionar chave de modelo';

  @override
  String get addModelKeyBody =>
      'Os bots usam sua própria chave de provedor de modelo. Ela é armazenada criptografada e nunca mais é exibida.';

  @override
  String get provider => 'Provedor';

  @override
  String get label => 'Rótulo';

  @override
  String get apiKey => 'Chave de API';

  @override
  String get baseUrl => 'URL base';

  @override
  String get testKey => 'Testar chave';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'A chave funciona ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Falha ao testar a chave: $error';
  }

  @override
  String get createFirstBot => 'Crie seu primeiro bot';

  @override
  String get botName => 'Nome do bot';

  @override
  String get model => 'Modelo';

  @override
  String get persona => 'Instruções';

  @override
  String get personaHint =>
      'O que este bot faz e como deve trabalhar. Uma persona preenche isso; edite livremente.';

  @override
  String get modelKey => 'Chave de modelo';

  @override
  String get navComputer => 'Computador';

  @override
  String get navChats => 'Chats';

  @override
  String get navTasks => 'Tarefas';

  @override
  String get settingsConnectionsSection => 'Conexões';

  @override
  String get advanced => 'Avançado';

  @override
  String get settingsAdvancedSummary => 'Segredos, computadores, dispositivos';

  @override
  String get bots => 'Bots';

  @override
  String get newBot => 'Novo bot';

  @override
  String get noBots => 'Nenhum bot ainda';

  @override
  String get botStatusIdle => 'Inativo';

  @override
  String get botStatusWorking => 'Trabalhando';

  @override
  String get botStatusWaiting => 'Aguardando você';

  @override
  String sidebarMoreWorking(int count) {
    return 'mais $count trabalhando';
  }

  @override
  String get botStatusDisabled => 'Desativado';

  @override
  String costToday(String cost) {
    return '$cost hoje';
  }

  @override
  String get newChat => 'Novo chat';

  @override
  String get conversations => 'Conversas';

  @override
  String messageHint(String bot) {
    return 'Mensagem para $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Mensagem para $bot · @ para mencionar um app';
  }

  @override
  String get mentionSectionBots => 'Bots';

  @override
  String get mentionSectionApps => 'Apps';

  @override
  String get mentionSectionAddToBot => 'Adicionar a este bot';

  @override
  String get mentionSectionConnect => 'Conectar';

  @override
  String get mentionSectionStartGroup => 'Iniciar chat em grupo';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'App';

  @override
  String get mentionAddAction => 'Adicionar';

  @override
  String get mentionConnectAction => 'Conectar';

  @override
  String get mentionMaxApps => 'Você pode mencionar até 3 apps por mensagem.';

  @override
  String get mentionRemovedApp => 'App removido';

  @override
  String get send => 'Enviar';

  @override
  String get stop => 'Parar';

  @override
  String get thinking => 'Pensando…';

  @override
  String get checkingItsWork => 'Revisando o trabalho…';

  @override
  String get mapFullScreen => 'Tela cheia';

  @override
  String get mapTitle => 'Mapa';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Interrompido.';

  @override
  String emptyChat(String bot) {
    return 'Diga olá para $bot.';
  }

  @override
  String get toolRunning => 'Executando';

  @override
  String get toolFailedLabel => 'Falhou';

  @override
  String get toolOutput => 'Saída';

  @override
  String get remembered => 'Lembrou de algo';

  @override
  String skillLoaded(String name) {
    return 'Habilidade $name carregada';
  }

  @override
  String checkpointSaved(String label) {
    return 'Ponto de restauração salvo: $label';
  }

  @override
  String computerState(String state) {
    return 'Computador $state';
  }

  @override
  String get activity => 'Atividade';

  @override
  String get timelineTitle => 'Linha do tempo de execuções';

  @override
  String get allEvents => 'Tudo';

  @override
  String get filterTools => 'Ferramentas';

  @override
  String get filterMessages => 'Mensagens';

  @override
  String get filterSystem => 'Sistema';

  @override
  String get restore => 'Restaurar';

  @override
  String get restoreConfirm =>
      'Voltar para este ponto de restauração? Os arquivos alterados desde então serão substituídos.';

  @override
  String get restored => 'Ponto de restauração restaurado.';

  @override
  String get noRuns => 'Nenhuma execução ainda.';

  @override
  String get computerTitle => 'Computador';

  @override
  String get computerStart => 'Iniciar';

  @override
  String get computerSleep => 'Repousar';

  @override
  String get screen => 'Tela';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Arquivos';

  @override
  String get noScreen =>
      'Nada na tela ainda. A página do navegador do bot aparece aqui.';

  @override
  String get refresh => 'Atualizar';

  @override
  String get upload => 'Enviar arquivo';

  @override
  String get download => 'Baixar';

  @override
  String get emptyFolder => 'Esta pasta está vazia';

  @override
  String get noCheckpoints =>
      'Eles são salvos automaticamente antes de alterações arriscadas, para que você possa desfazê-las.';

  @override
  String get computerAsleep =>
      'O computador está em repouso. Os arquivos estão salvos e ele desperta quando necessário.';

  @override
  String get connectTerminal => 'Conectar';

  @override
  String get terminalDisconnected => 'Desconectado.';

  @override
  String get terminalReconnecting => 'Servidor reiniciando, reconectando…';

  @override
  String get memory => 'Memória';

  @override
  String get noMemories => 'Nada lembrado ainda.';

  @override
  String get noMemoriesMatch => 'Nenhuma memória corresponde.';

  @override
  String get clearSearch => 'Limpar';

  @override
  String get addMemory => 'Adicionar memória';

  @override
  String get addMemoryHelp =>
      'Algo que o bot deve sempre saber sobre você ou seu trabalho.';

  @override
  String get addMemoryFactHint =>
      'Por exemplo: Nosso ano fiscal começa em abril.';

  @override
  String get addMemoryPreferenceHint =>
      'Por exemplo: Mantenha os resumos com menos de cinco tópicos.';

  @override
  String get memoryAdded => 'Memória adicionada';

  @override
  String get pin => 'Fixar';

  @override
  String get unpin => 'Desafixar';

  @override
  String get deleteMemoryConfirm => 'Esquecer isto? Não é possível desfazer.';

  @override
  String get skills => 'Habilidades';

  @override
  String get noSkills =>
      'Nenhuma habilidade ainda. Habilidades são instruções que os bots carregam quando relevante.';

  @override
  String get newSkill => 'Nova habilidade';

  @override
  String get skillName => 'Nome (minúsculas, hifens)';

  @override
  String get skillDescription => 'Descrição em uma linha';

  @override
  String get skillBody => 'Instruções (Markdown)';

  @override
  String get enabled => 'Ativado';

  @override
  String get settings => 'Configurações';

  @override
  String get workspace => 'Espaço de trabalho';

  @override
  String get switchWorkspace => 'Trocar espaço de trabalho';

  @override
  String get modelKeys => 'Chaves de modelo';

  @override
  String get moreProviders => 'Mais provedores';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, servidores personalizados';

  @override
  String get toolPermissions => 'Permissões de ferramentas';

  @override
  String get devicesAdvancedSummary =>
      'Tempo de retenção, modelos privados, bots com acesso';

  @override
  String get companionAdvancedSummary =>
      'Comandos, ferramentas locais (MCP), agentes de código';

  @override
  String get noKeys => 'Nenhuma chave de modelo ainda.';

  @override
  String get addKey => 'Adicionar chave';

  @override
  String get usage => 'Uso';

  @override
  String get language => 'Idioma';

  @override
  String inviteSent(String email) {
    return 'Convite enviado para $email.';
  }

  @override
  String get botProfile => 'Perfil do bot';

  @override
  String get groupMembers => 'Bots neste chat';

  @override
  String get groupMembersHelp =>
      'Cada um mantém sua própria memória e configurações. Toque em um para abrir o perfil.';

  @override
  String get botAdvancedSummary =>
      'Apps de chat, links, regras, monitoramentos, plugins, atividade';

  @override
  String get botActivityRow => 'Cada execução, passo a passo';

  @override
  String get createBotAdvancedSummary => 'Chave de modelo e modelo';

  @override
  String get botProfileSection => 'Perfil';

  @override
  String get botBrain => 'Cérebro';

  @override
  String get botAbilities => 'Capacidades';

  @override
  String get botSchedule => 'Agenda';

  @override
  String get chatComputerLive => 'Trabalhando no computador dele';

  @override
  String get autonomy => 'Autonomia';

  @override
  String get autonomyAskAlways => 'Perguntar antes de agir';

  @override
  String get autonomyAskRisky => 'Perguntar em ações arriscadas';

  @override
  String get autonomyAutonomous => 'Agir por conta própria';

  @override
  String get saved => 'Salvo.';

  @override
  String get justNow => 'agora mesmo';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'há $nString minutos',
      one: 'há $nString minuto',
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
      other: 'há $nString horas',
      one: 'há $nString hora',
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
      other: 'há $nString dias',
      one: 'há $nString dia',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Um bot';

  @override
  String get addIntegration => 'Adicionar integração';

  @override
  String get addSecret => 'Adicionar segredo';

  @override
  String get allowedHosts => 'Hosts permitidos';

  @override
  String get allowedHostsHelp =>
      'Separados por vírgula, por exemplo api.github.com';

  @override
  String get alwaysAllow => 'Permitir sempre';

  @override
  String get approval => 'Aprovação';

  @override
  String get approvalAlreadyDecided =>
      'Esta solicitação já foi decidida ou expirou.';

  @override
  String get approvals => 'Aprovações';

  @override
  String get approve => 'Aprovar';

  @override
  String get approved => 'Aprovado';

  @override
  String get authHeaderOptional => 'Cabeçalho Authorization (opcional)';

  @override
  String get authSecretName => 'Nome do segredo de autenticação (opcional)';

  @override
  String get authSecretNameHelp =>
      'Nome de um segredo de Configurações › Segredos, enviado como bearer token';

  @override
  String get baseUrlOptional => 'URL base (opcional)';

  @override
  String get blankBot => 'Em branco';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Escolher modelo';

  @override
  String get createBotNeedsModel =>
      'Escolha um modelo acima para criar este bot.';

  @override
  String get createBotKeyRejected =>
      'O provedor recusou esta chave. Confira em Configurações → Chaves de modelo ou escolha outra chave.';

  @override
  String get createBotDiscardTitle => 'Descartar este bot?';

  @override
  String get createBotDiscardBody => 'O que você preencheu aqui será perdido.';

  @override
  String get searchModels => 'Buscar modelos ou digitar um ID';

  @override
  String get recommendedModels => 'Recomendados';

  @override
  String get allModels => 'Todos os modelos';

  @override
  String useCustomModel(String id) {
    return 'Usar “$id”';
  }

  @override
  String modelListFallback(String reason) {
    return 'Mostrando modelos sugeridos. $reason Você ainda pode digitar qualquer ID de modelo.';
  }

  @override
  String get noModelsFound => 'Nenhum modelo corresponde.';

  @override
  String get addModelKeyFirst =>
      'Adicione uma chave de modelo primeiro. Seu bot a usa para pensar; ela fica criptografada e nunca mais é exibida.';

  @override
  String get composioToolkits =>
      'Toolkits (separados por vírgula, por exemplo github, gmail)';

  @override
  String get copySecret => 'Copiar segredo';

  @override
  String get cronExpression => 'Expressão cron';

  @override
  String get cronHelp => 'minuto hora dia mês dia-da-semana';

  @override
  String get denied => 'Recusado';

  @override
  String get deny => 'Recusar';

  @override
  String get everyHour => 'A cada hora';

  @override
  String get expired => 'Expirado';

  @override
  String get inbox => 'Caixa de entrada';

  @override
  String get integrationName => 'Nome';

  @override
  String get integrationNameHelp => 'Letras minúsculas, números e sublinhados';

  @override
  String get integrationType => 'Tipo';

  @override
  String get integrations => 'Integrações';

  @override
  String get kindMcp => 'Servidor MCP';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Marcar tudo como lido';

  @override
  String get newRoutine => 'Nova rotina';

  @override
  String get noIntegrationsForBot =>
      'Adicione integrações em Configurações primeiro e depois ative-as para este bot aqui.';

  @override
  String get noRoutines => 'Nenhuma rotina ainda';

  @override
  String get noSecrets => 'Nenhum segredo ainda';

  @override
  String get notifications => 'Notificações';

  @override
  String get openInbox => 'Abrir caixa de entrada';

  @override
  String get pipedreamApps => 'Apps (separados por vírgula)';

  @override
  String get pipedreamClientId => 'Client ID';

  @override
  String get pipedreamClientSecret => 'Client secret';

  @override
  String get pipedreamProject => 'ID do projeto';

  @override
  String get riskHigh => 'Risco alto';

  @override
  String get riskLow => 'Risco baixo';

  @override
  String get riskMedium => 'Risco médio';

  @override
  String get routineGithub => 'Em eventos do GitHub';

  @override
  String get routineInstructions => 'Instruções';

  @override
  String get routineInstructionsHint => 'O que o bot deve fazer cada vez?';

  @override
  String get routineName => 'Nome';

  @override
  String get routineEditTitle => 'Editar rotina';

  @override
  String get routineEditSubtitle =>
      'Altere o que ela faz e quando é executada.';

  @override
  String get routineRecentRuns => 'Execuções recentes';

  @override
  String get routineNoRuns => 'Ainda não foi executada.';

  @override
  String get routineSaved => 'Rotina salva';

  @override
  String get routineStarted => 'Rotina iniciada';

  @override
  String get routineWebhook => 'Por webhook';

  @override
  String get routines => 'Rotinas';

  @override
  String get routineAdvancedSummary =>
      'Gatilhos do GitHub e webhook, cron, fuso horário';

  @override
  String get routineRepeatDaily => 'Todos os dias';

  @override
  String get routineRepeatWeekdays => 'Dias úteis';

  @override
  String get routineRepeatWeekly => 'Toda semana';

  @override
  String get routineDay => 'Dia';

  @override
  String get routineTimeLabel => 'Horário';

  @override
  String get routineRunsAt => 'Roda às';

  @override
  String routineTimesIn(String timezone) {
    return 'Os horários estão em $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Personalizado: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Outros gatilhos';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'A cada $nString minutos',
      one: 'A cada $nString minuto',
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
      other: 'A cada $nString horas',
      one: 'A cada $nString hora',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'A cada hora aos :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Todos os dias às $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Dias úteis às $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Fins de semana às $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days às $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Dia $day de todo mês às $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items e $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'domingos',
      'mon': 'segundas-feiras',
      'tue': 'terças-feiras',
      'wed': 'quartas-feiras',
      'thu': 'quintas-feiras',
      'fri': 'sextas-feiras',
      'sat': 'sábados',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'domingo',
      'mon': 'segunda-feira',
      'tue': 'terça-feira',
      'wed': 'quarta-feira',
      'thu': 'quinta-feira',
      'fri': 'sexta-feira',
      'sat': 'sábado',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Veja seu bot trabalhar ao vivo';

  @override
  String get headlessScreenEmpty =>
      'Este computador roda só com o navegador para ficar leve. Você verá as páginas da web dele aqui quando ele abrir uma. Mude para o modo Desktop para assistir e controlar apps também.';

  @override
  String get headlessScreenChecking =>
      'Verificando páginas a cada poucos segundos';

  @override
  String get headlessBrowserOnly => 'Apenas navegador';

  @override
  String get switchedToDesktopHere =>
      'Mudou para Desktop. A tela aparece aqui assim que iniciar.';

  @override
  String get desktopBarLabel => 'Desktop · usa mais memória';

  @override
  String get switchToBrowserOnly => 'Mudar para apenas navegador';

  @override
  String get switchingToBrowserOnly => 'Mudando para apenas navegador…';

  @override
  String get switchedToBrowserOnly =>
      'Mudou para apenas navegador. Agora usa menos memória.';

  @override
  String get runNow => 'Executar agora';

  @override
  String get secretName => 'Nome';

  @override
  String get secretNameHelp => 'Maiúsculas, por exemplo GITHUB_TOKEN';

  @override
  String get secretValue => 'Valor';

  @override
  String get secrets => 'Segredos';

  @override
  String get serverUrl => 'URL do servidor';

  @override
  String get specUrl => 'URL da especificação OpenAPI';

  @override
  String get startFrom => 'Persona';

  @override
  String get storedEncrypted => 'Armazenado criptografado; nunca mais exibido';

  @override
  String get taskBlocked => 'Bloqueada';

  @override
  String get taskDoing => 'Em andamento';

  @override
  String get taskDone => 'Concluída';

  @override
  String get taskTodo => 'A fazer';

  @override
  String get test => 'Testar';

  @override
  String get timezone => 'Fuso horário';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Repete';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Ver execução';

  @override
  String get webhookCreated => 'Webhook criado';

  @override
  String get webhookSecret => 'Segredo de assinatura';

  @override
  String get webhookShownOnce =>
      'Copie o segredo de assinatura agora. Ele é exibido apenas uma vez.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Falha na conexão: $error';
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
      other: 'Conectado, $nString ferramentas',
      one: 'Conectado, $nString ferramenta',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Próxima: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Enviado apenas para $hosts';
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
    return 'Inclui rotinas: $names.';
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
      other: '$nString ferramentas',
      one: '$nString ferramenta',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'O bot voltou ao controle';

  @override
  String get botComputer => 'Computador';

  @override
  String get botComputerDefault =>
      'O computador privado dele se tiver um, caso contrário o computador da equipe';

  @override
  String get botInControl => 'Bot no controle';

  @override
  String get computerName => 'Nome';

  @override
  String get computers => 'Computadores';

  @override
  String get connectingLive => 'Conectando…';

  @override
  String get dismiss => 'Dispensar';

  @override
  String get renameTopic => 'Renomear';

  @override
  String get library => 'Biblioteca';

  @override
  String get navLibrary => 'Biblioteca';

  @override
  String get librarySearchHint => 'Buscar na Biblioteca';

  @override
  String get libraryFilterAll => 'Tudo';

  @override
  String get libraryFilterPages => 'Sites e jogos';

  @override
  String get libraryFilterImages => 'Imagens';

  @override
  String get libraryFilterVideos => 'Vídeos';

  @override
  String get libraryFilterAudio => 'Áudio';

  @override
  String get libraryFilterDocuments => 'Documentos';

  @override
  String get libraryFilterFiles => 'Arquivos';

  @override
  String get creationKindPage => 'Página';

  @override
  String get creationKindImage => 'Imagem';

  @override
  String get creationKindVideo => 'Vídeo';

  @override
  String get creationKindAudio => 'Áudio';

  @override
  String get creationKindDocument => 'Documento';

  @override
  String get creationKindFile => 'Arquivo';

  @override
  String get libraryPinned => 'Fixados';

  @override
  String get libraryToday => 'Hoje';

  @override
  String get libraryYesterday => 'Ontem';

  @override
  String get libraryThisWeek => 'Esta semana';

  @override
  String get libraryEarlier => 'Anteriores';

  @override
  String get videoCantPlay =>
      'Este vídeo não pode ser reproduzido neste dispositivo.';

  @override
  String get libraryEmptyTitle => 'O que vamos criar primeiro?';

  @override
  String get libraryEmptyBody =>
      'Escolha uma opção e seu bot começa. Tudo o que seus bots criam vem para cá automaticamente.';

  @override
  String get libraryNoMatch => 'Nada aqui corresponde.';

  @override
  String get libraryStarterGame => 'Um joguinho';

  @override
  String get libraryStarterGamePrompt =>
      'Crie um joguinho que eu possa jogar no navegador.';

  @override
  String get libraryStarterLogo => 'Um logotipo';

  @override
  String get libraryStarterLogoPrompt => 'Crie um logotipo para o meu projeto.';

  @override
  String get libraryStarterSite => 'Um site de uma página';

  @override
  String get libraryStarterSitePrompt =>
      'Crie um site de uma página para o meu negócio.';

  @override
  String get libraryStarterVideo => 'Um vídeo curto';

  @override
  String get libraryStarterVideoPrompt => 'Crie um vídeo curto de ';

  @override
  String get libraryStarterCard => 'Um cartão de aniversário';

  @override
  String get libraryStarterCardPrompt => 'Crie um cartão de aniversário para ';

  @override
  String get libraryStarterReport => 'Um relatório';

  @override
  String get libraryStarterReportPrompt =>
      'Pesquise e escreva um relatório sobre ';

  @override
  String get libraryStarterElse => 'Outra coisa…';

  @override
  String get creationOpen => 'Abrir';

  @override
  String get creationPlay => 'Reproduzir';

  @override
  String get creationView => 'Ver';

  @override
  String get creationChangeIt => 'Alterar';

  @override
  String creationChangeDraft(String title) {
    return 'Sobre “$title”: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Feito por $bot';
  }

  @override
  String creationVersion(int n) {
    return 'versão $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'Do seu chat com $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Feito por $bot';
  }

  @override
  String get creationFromHelp => 'Ir para a conversa';

  @override
  String get creationDetails => 'Detalhes';

  @override
  String get creationAlongside => 'Feito junto';

  @override
  String creationDeleted(String title) {
    return '“$title” excluído';
  }

  @override
  String get showInLibrary => 'Mostrar na Biblioteca';

  @override
  String get pinInLibrary => 'Fixar na Biblioteca';

  @override
  String get libraryItemNotFound =>
      'Isso ainda não está na Biblioteca. Tente novamente em instantes.';

  @override
  String creationPinned(String title) {
    return '“$title” fixado';
  }

  @override
  String creationUnpinned(String title) {
    return '“$title” desafixado';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Atualizado · versão $version';
  }

  @override
  String get madeHere => 'Feito aqui';

  @override
  String madeHereEmpty(String bot) {
    return '$bot ainda não criou nada.';
  }

  @override
  String get madeHereThisChat => 'Neste chat';

  @override
  String madeHereByBot(String bot) {
    return 'Feito por $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Outras coisas que $bot criou';
  }

  @override
  String madeHereCount(String count) {
    return 'Feito aqui ($count)';
  }

  @override
  String get sidePanelComputer => 'Computador';

  @override
  String get madeForTicket => 'Feito para este ticket';

  @override
  String get libraryCantChangePicked =>
      'Apenas a pessoa para quem foi feito ou os gerentes do bot podem alterar isso.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens excluídos',
      one: '$count item excluído',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selecionados',
      one: '$count selecionado',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Mais recentes';

  @override
  String get librarySortOpened => 'Abertos recentemente';

  @override
  String get librarySortName => 'Nome';

  @override
  String get libraryScopeMine => 'Feitos para mim';

  @override
  String get libraryScopeWorkspace => 'Todo o espaço de trabalho';

  @override
  String get libraryFilterSort => 'Ordenar e filtrar';

  @override
  String get creationWhoCanSee => 'Quem pode ver';

  @override
  String get libraryTile => 'Biblioteca';

  @override
  String get libraryTileHelp => 'O que ele criou';

  @override
  String get regenerateReply => 'Gerar novamente';

  @override
  String get deleteMessage => 'Excluir mensagem';

  @override
  String get deleteMessageTitle => 'Excluir esta mensagem?';

  @override
  String get deleteMessageBody =>
      'Ela é removida para todos neste chat. As mensagens ao redor ficam.';

  @override
  String get messageDeleted => 'Mensagem excluída';

  @override
  String get findInChat => 'Buscar no chat';

  @override
  String get findInChatHint => 'Buscar neste chat';

  @override
  String findInChatCount(int index, int count) {
    return '$index de $count';
  }

  @override
  String get findInChatNone => 'Nenhum resultado';

  @override
  String get findPrevious => 'Resultado anterior';

  @override
  String get findNext => 'Próximo resultado';

  @override
  String get closeFind => 'Fechar busca';

  @override
  String get pinTopic => 'Fixar';

  @override
  String get unpinTopic => 'Desafixar';

  @override
  String get inAppAlertReview => 'Revisar';

  @override
  String get forBot => 'Para o bot';

  @override
  String get handBack => 'Devolver o controle';

  @override
  String get handBackNote => 'Recado para o bot (opcional)';

  @override
  String get handBackNoteHint => 'Por exemplo: Já entrei na conta, pode seguir';

  @override
  String get live => 'Ao vivo';

  @override
  String get liveView => 'Visualização ao vivo';

  @override
  String get liveViewHelp =>
      'Veja este computador ao vivo e assuma o controle quando precisar.';

  @override
  String get newComputer => 'Novo computador';

  @override
  String get newComputerHelp =>
      'Um computador privado pertence a um bot. Os arquivos dele ficam separados do computador da equipe.';

  @override
  String get openLiveView => 'Abrir visualização ao vivo';

  @override
  String get liveExpand => 'Tela cheia';

  @override
  String get liveCopy => 'Copiar';

  @override
  String get liveScreenshot => 'Captura de tela';

  @override
  String get liveScreenshots => 'Capturas de tela';

  @override
  String get liveScreenshotsHelp =>
      'O vídeo ao vivo não passa por esta rede, então a tela atualiza cerca de uma vez por segundo.';

  @override
  String get liveReconnecting => 'Reconectando…';

  @override
  String get liveReconnectingHelp =>
      'O vídeo ao vivo foi interrompido (o servidor pode estar reiniciando). Tentando novamente; capturas de tela aparecem enquanto isso.';

  @override
  String get liveTryAgain => 'Tente novamente';

  @override
  String get liveDroppedHelp =>
      'O vídeo ao vivo não voltou, então a tela atualiza cerca de uma vez por segundo. Toque em Tente novamente.';

  @override
  String get liveMore => 'Mais';

  @override
  String get liveSaveScreenshot => 'Salvar captura de tela';

  @override
  String get liveCopyFromComputer => 'Copiar do computador';

  @override
  String get livePasteToComputer => 'Colar no computador';

  @override
  String get liveRotateHint => 'Vire o celular de lado para uma tela maior';

  @override
  String get liveWatching => 'Assistindo';

  @override
  String get liveCopied => 'Copiado do computador.';

  @override
  String get liveNothingCopied =>
      'Nada foi copiado. Selecione algo no computador primeiro.';

  @override
  String get livePasteEmpty => 'Sua área de transferência está vazia.';

  @override
  String get liveMinimize => 'Voltar ao painel lateral';

  @override
  String get liveShownFullScreen =>
      'A visualização ao vivo está aberta em tela cheia.';

  @override
  String get liveStillWatching => 'Ainda assistindo?';

  @override
  String get liveStillWatchingHelp =>
      'O computador entra em repouso quando ninguém está assistindo, para economizar energia.';

  @override
  String get liveKeepWatching => 'Continuar assistindo';

  @override
  String get livePausedToSavePower => 'Pausado para economizar energia';

  @override
  String get livePausedToSavePowerHelp =>
      'Ninguém estava assistindo, então o computador pode descansar. Retomar acorda ele de novo.';

  @override
  String get liveResume => 'Retomar';

  @override
  String get paused => 'Pausado';

  @override
  String get pausedUserInControl =>
      'Pausado: uma pessoa está no controle da tela';

  @override
  String get letBotUseTerminal => 'Permitir que use terminal e arquivos';

  @override
  String get screenHandedBack => 'Controle devolvido';

  @override
  String get privateComputer => 'Computador privado';

  @override
  String get profileDesktop => 'Desktop';

  @override
  String get profileHeadless => 'Sem interface';

  @override
  String get rename => 'Renomear';

  @override
  String get rightClickNextTap => 'Clique direito no próximo toque';

  @override
  String get screenshotMode =>
      'Capturas de tela (vídeo ao vivo indisponível nesta rede)';

  @override
  String get showKeyboard => 'Teclado';

  @override
  String get someoneElseInControl => 'Outra pessoa está no controle';

  @override
  String get switchToDesktop => 'Mudar para Desktop';

  @override
  String get switchToHeadless => 'Mudar para sem interface';

  @override
  String get switchProfileConfirm =>
      'O computador reinicia para mudar. Seus arquivos são mantidos, mas qualquer coisa em execução nele agora para.';

  @override
  String get switchProfileButton => 'Mudar';

  @override
  String get switchingToDesktop => 'Mudando para Desktop…';

  @override
  String get switchingToHeadless => 'Mudando para sem interface…';

  @override
  String get switchedToDesktop =>
      'Mudou para Desktop. Abra a visualização ao vivo para ver a tela.';

  @override
  String get switchedToHeadless =>
      'Mudou para sem interface. Agora usa menos memória.';

  @override
  String get takeControl => 'Assumir o controle';

  @override
  String get takeoverCompleted => 'Controle devolvido';

  @override
  String get takeoverDismissed => 'Recusado';

  @override
  String get takeoverPrivacy =>
      'Enquanto você está no controle, o bot fica pausado e nada do que você digita ou vê é enviado para ele.';

  @override
  String get liveShellOnTooltip =>
      'Permitir que o bot continue usando o terminal e os arquivos enquanto você está no controle';

  @override
  String get liveShellOffTooltip =>
      'Pausar o terminal e os arquivos do bot também enquanto você está no controle';

  @override
  String get liveShellOnNote =>
      'O bot pode continuar usando o terminal e os arquivos. Ele ainda não pode ver nem usar a tela até você devolver o controle.';

  @override
  String get liveShellOffNote =>
      'O bot fica totalmente pausado até você devolver o controle.';

  @override
  String get teamComputer => 'Computador da equipe';

  @override
  String get withDesktop => 'Com desktop';

  @override
  String get withDesktopHelp =>
      'Adiciona uma tela que você pode assistir ao vivo; usa mais memória';

  @override
  String get youAreInControl => 'Você está no controle';

  @override
  String botAsksForHelp(String reason) {
    return 'O bot pergunta: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot precisa da sua ajuda';
  }

  @override
  String deleteComputerConfirm(String name) {
    return 'Excluir $name? Os arquivos, snapshots e pontos de restauração também serão excluídos.';
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
    return 'Computador de $bot';
  }

  @override
  String get micPermissionNeeded => 'Permita o acesso ao microfone para ditar.';

  @override
  String get dictationEmpty => 'Nenhuma fala foi captada. Tente novamente.';

  @override
  String get startCall => 'Iniciar chamada de voz';

  @override
  String get stopDictation => 'Parar e transcrever';

  @override
  String get dictate => 'Ditar';

  @override
  String get dictateOnDevice => 'Ditar com este dispositivo';

  @override
  String get stopListening => 'Parar de ouvir';

  @override
  String get dictationRetry => 'Tente novamente';

  @override
  String get dictationSayAgain => 'Diga novamente';

  @override
  String get dictationFailed => 'Não foi possível transformar isso em texto.';

  @override
  String get dictationFailedUseDevice =>
      'Não foi possível transformar isso em texto. Diga novamente e seu dispositivo vai ouvir.';

  @override
  String get dictationNoServiceUseDevice =>
      'O ditado não está configurado neste espaço de trabalho. Seu dispositivo pode ouvir no lugar.';

  @override
  String get dictationDeviceFailed =>
      'O ditado do seu dispositivo parou de funcionar, então o microfone voltou para o do Casama.';

  @override
  String get dictationDevicePermission =>
      'Permita o reconhecimento de fala para ditar com este dispositivo.';

  @override
  String get readAloud => 'Ler em voz alta';

  @override
  String get callConnecting => 'Conectando…';

  @override
  String get callLive => 'Ao vivo';

  @override
  String get callEnded => 'Chamada encerrada';

  @override
  String get callEndedIdle => 'Chamada encerrada após 2 minutos de silêncio.';

  @override
  String get callFailed => 'Não foi possível conectar a chamada.';

  @override
  String get callListening => 'Ouvindo';

  @override
  String get callSpeaking => 'Falando';

  @override
  String get callWorking => 'Trabalhando nisso';

  @override
  String get callMutedState => 'Microfone mudo';

  @override
  String get callCaptions => 'Legendas';

  @override
  String get callSpeaker => 'Viva-voz';

  @override
  String get callEarpiece => 'Telefone';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Fones de ouvido';

  @override
  String get callAudioOutput => 'Reproduzir chamada por';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Alterando a foto',
      'memory_search': 'Buscando nas suas memórias',
      'memory_write': 'Salvando na memória',
      'memory': 'Atualizando a memória',
      'knowledge_search': 'Pesquisando no conhecimento',
      'web_search': 'Pesquisando na web',
      'web': 'Lendo uma página da web',
      'browser_open': 'Abrindo um site',
      'browser_click': 'Clicando na página',
      'browser_type': 'Digitando na página',
      'browser_press': 'Pressionando uma tecla',
      'browser_scroll': 'Rolando a página',
      'browser_look': 'Olhando a página',
      'desktop_click': 'Clicando na tela',
      'desktop_type': 'Digitando',
      'desktop_press': 'Pressionando teclas',
      'desktop_launch': 'Abrindo um app',
      'desktop_look': 'Olhando a tela',
      'shell': 'Trabalhando no computador dele',
      'files_read': 'Lendo um arquivo',
      'files_write': 'Escrevendo um arquivo',
      'files_list': 'Listando arquivos',
      'files_search': 'Buscando arquivos',
      'files_from_chat': 'Pegando um arquivo do chat',
      'http': 'Contatando um serviço',
      'data_search': 'Buscando dados',
      'data_call': 'Obtendo dados',
      'skills_load': 'Preparando uma habilidade',
      'skills_create': 'Aprendendo uma nova habilidade',
      'skills_update': 'Melhorando uma habilidade',
      'checkpoint': 'Salvando um ponto de controle',
      'computer_restart': 'Reiniciando o computador dele',
      'takeover': 'Pedindo para você assumir o controle',
      'delegate': 'Pedindo ajuda a um auxiliar',
      'routines_list': 'Verificando suas rotinas',
      'routines_create': 'Configurando uma rotina',
      'routines_update': 'Atualizando uma rotina',
      'routines_delete': 'Removendo uma rotina',
      'watchers_create': 'Configurando um monitoramento',
      'watchers_list': 'Verificando seus monitoramentos',
      'watchers_delete': 'Removendo um monitoramento',
      'tasks_list': 'Verificando suas tarefas',
      'tasks_create': 'Adicionando uma tarefa',
      'tasks': 'Atualizando suas tarefas',
      'notify_user': 'Enviando um recado para você',
      'usage_report': 'Verificando o uso',
      'device_read': 'Lendo dados do seu dispositivo',
      'device_access': 'Pedindo acesso ao dispositivo',
      'pages_publish': 'Publicando uma página',
      'pages': 'Atualizando uma página',
      'media': 'Criando uma imagem',
      'media_video': 'Criando um vídeo',
      'bots_create': 'Criando um novo bot',
      'bots_update': 'Atualizando um bot',
      'bots_list': 'Verificando seus bots',
      'bots_archive': 'Arquivando um bot',
      'channel_send': 'Enviando uma mensagem',
      'links_ask': 'Perguntando ao assistente de um contato',
      'logins_list': 'Verificando logins salvos',
      'replay_run': 'Repetindo passos salvos',
      'replay_save': 'Salvando estes passos',
      'setup_apply': 'Sugerindo uma configuração',
      'sidebar_organize': 'Organizando sua barra lateral',
      'suggestions_add': 'Adicionando uma sugestão',
      'teach_save_draft': 'Salvando um rascunho de habilidade',
      'welcome_name': 'Escolhendo um nome',
      'secrets_request': 'Pedindo um segredo a você',
      'pages_list': 'Verificando suas páginas',
      'pages_share': 'Alterando quem pode ver uma página',
      'projects_create': 'Iniciando um projeto',
      'projects_status': 'Verificando um projeto',
      'projects_update': 'Atualizando um projeto',
      'projects': 'Planejando um projeto',
      'payments': 'Pedindo para fazer um pagamento',
      'voice_call': 'Ligando para uma empresa',
      'voice_call_user': 'Ligando para você',
      'tools_load': 'Preparando',
      'ui_show': 'Mostrando algo para você',
      'start_task': 'Iniciando isso no chat',
      'adult_sites_turn_on': 'Pedindo para ativar sites adultos',
      'connections_attach': 'Começando a usar um app',
      'other': 'Trabalhando nisso',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Alterou a foto',
      'memory_search': 'Buscou nas suas memórias',
      'memory_write': 'Salvou na memória',
      'memory': 'Atualizou a memória',
      'knowledge_search': 'Pesquisou no conhecimento',
      'web_search': 'Pesquisou na web',
      'web': 'Leu uma página da web',
      'browser_open': 'Abriu um site',
      'browser_click': 'Clicou na página',
      'browser_type': 'Digitou na página',
      'browser_press': 'Pressionou uma tecla',
      'browser_scroll': 'Rolou a página',
      'browser_look': 'Olhou a página',
      'desktop_click': 'Clicou na tela',
      'desktop_type': 'Digitou',
      'desktop_press': 'Pressionou teclas',
      'desktop_launch': 'Abriu um app',
      'desktop_look': 'Olhou a tela',
      'shell': 'Trabalhou no computador dele',
      'files_read': 'Leu um arquivo',
      'files_write': 'Escreveu um arquivo',
      'files_list': 'Listou arquivos',
      'files_search': 'Buscou arquivos',
      'files_from_chat': 'Pegou um arquivo do chat',
      'http': 'Contatou um serviço',
      'data_search': 'Buscou dados',
      'data_call': 'Obteve dados',
      'skills_load': 'Usou uma habilidade',
      'skills_create': 'Aprendeu uma nova habilidade',
      'skills_update': 'Melhorou uma habilidade',
      'checkpoint': 'Salvou um ponto de controle',
      'computer_restart': 'Reiniciou o computador dele',
      'takeover': 'Pediu para você assumir o controle',
      'delegate': 'Pediu ajuda a um auxiliar',
      'routines_list': 'Verificou suas rotinas',
      'routines_create': 'Configurou uma rotina',
      'routines_update': 'Atualizou uma rotina',
      'routines_delete': 'Removeu uma rotina',
      'watchers_create': 'Configurou um monitoramento',
      'watchers_list': 'Verificou seus monitoramentos',
      'watchers_delete': 'Removeu um monitoramento',
      'tasks_list': 'Verificou suas tarefas',
      'tasks_create': 'Adicionou uma tarefa',
      'tasks': 'Atualizou suas tarefas',
      'notify_user': 'Enviou um recado para você',
      'usage_report': 'Verificou o uso',
      'device_read': 'Leu dados do seu dispositivo',
      'device_access': 'Pediu acesso ao dispositivo',
      'pages_publish': 'Publicou uma página',
      'pages': 'Atualizou uma página',
      'media': 'Criou uma imagem',
      'media_video': 'Criou um vídeo',
      'bots_create': 'Criou um novo bot',
      'bots_update': 'Atualizou um bot',
      'bots_list': 'Verificou seus bots',
      'bots_archive': 'Arquivou um bot',
      'channel_send': 'Enviou uma mensagem',
      'links_ask': 'Perguntou ao assistente de um contato',
      'logins_list': 'Verificou logins salvos',
      'replay_run': 'Repetiu passos salvos',
      'replay_save': 'Salvou estes passos',
      'setup_apply': 'Sugeriu uma configuração',
      'sidebar_organize': 'Organizou sua barra lateral',
      'suggestions_add': 'Adicionou uma sugestão',
      'teach_save_draft': 'Salvou um rascunho de habilidade',
      'welcome_name': 'Escolheu um nome',
      'secrets_request': 'Pediu um segredo a você',
      'pages_list': 'Verificou suas páginas',
      'pages_share': 'Alterou quem pode ver uma página',
      'projects_create': 'Iniciou um projeto',
      'projects_status': 'Verificou um projeto',
      'projects_update': 'Atualizou um projeto',
      'projects': 'Planejou um projeto',
      'payments': 'Pediu para fazer um pagamento',
      'voice_call': 'Ligou para uma empresa',
      'voice_call_user': 'Ligou para você',
      'tools_load': 'Preparou',
      'ui_show': 'Mostrou algo para você',
      'start_task': 'Iniciou no chat',
      'adult_sites_turn_on': 'Pediu para ativar sites adultos',
      'connections_attach': 'Começou a usar um app',
      'other': 'Concluído',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Usando $app';
  }

  @override
  String toolUsedApp(String app) {
    return 'Usou $app';
  }

  @override
  String get toolDetails => 'Detalhes';

  @override
  String approvalAsking(String bot) {
    return '$bot está pedindo seu OK';
  }

  @override
  String get approvalLookClosely => 'Confira bem antes de permitir';

  @override
  String approvalAttachConnection(String app) {
    return 'Comece a usar $app, já conectado neste espaço de trabalho';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Deixar $bot fazer isso sem perguntar';
  }

  @override
  String get pageShareToPublic => 'Qualquer pessoa com o link poderá abrir';

  @override
  String get pageShareToWorkspace =>
      'Todos neste espaço de trabalho poderão abrir';

  @override
  String get pageShareToPrivate => 'Somente você poderá abrir';

  @override
  String approvalAllowedLine(String what) {
    return 'Permitido: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Recusado: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Sem resposta a tempo: $what';
  }

  @override
  String get callToolFailed => 'Isso não funcionou';

  @override
  String get callToolNeedsOk => 'Precisa do seu OK para continuar';

  @override
  String get callToolAllow => 'Permitir';

  @override
  String get callToolNotNow => 'Agora não';

  @override
  String get callToolAllowed => 'Permitido. O resultado aparecerá no chat';

  @override
  String get callToolDeclined => 'Você disse agora não';

  @override
  String get callToolBackground =>
      'Ainda trabalhando. O resultado aparecerá no chat';

  @override
  String get callToolInChat => 'O resultado aparecerá no chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '${secondsString}s';
  }

  @override
  String get callNeedsKeyTitle =>
      'Chamadas precisam de uma chave de IA do Google';

  @override
  String get callNeedsKeyBody =>
      'Chamadas ao vivo rodam no Gemini Live do Google, então este espaço de trabalho precisa de uma chave de IA do Google. Ela só é usada em chamadas: leitura em voz alta, ditado, imagens e vídeos rodam pelo OpenRouter. O Google oferece uma gratuita no AI Studio: crie lá, adicione em Chaves de modelo e as chamadas funcionam na hora. Apenas proprietários e admins do espaço de trabalho podem adicionar chaves.';

  @override
  String get callAddKey => 'Adicionar chave de IA do Google';

  @override
  String get callGetFreeKey => 'Obter chave gratuita do Google';

  @override
  String get callMicUnmute => 'Ativar mic';

  @override
  String get videoUnmute => 'Ativar som';

  @override
  String get callMicMute => 'Silenciar mic';

  @override
  String get videoMute => 'Silenciar som';

  @override
  String get hangUp => 'Desligar';

  @override
  String callWith(String bot) {
    return 'Chamada com $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'Encerrar chamada com $from e ligar para $to?';
  }

  @override
  String get callSwitchBody =>
      'Você pode estar em uma chamada por vez. A chamada atual é salva no chat dela antes.';

  @override
  String get callSwitchConfirm => 'Encerrar e ligar';

  @override
  String get callVoiceConsentTitle => 'Sua voz vai para o Google';

  @override
  String get callVoiceConsentBody =>
      'Em uma chamada, o Casama envia sua voz e o que você diz para o Google Gemini, que ouve você e fala as respostas do seu bot. O texto da chamada também vai para o modelo de IA que seu bot usa, pelo OpenRouter. Nada é enviado antes de você concordar. Você pode desativar isso a qualquer momento em Configurações › Privacidade.';

  @override
  String get callVoiceConsentAgree => 'Concordar e ligar';

  @override
  String get callVoiceConsentNotNow => 'Agora não';

  @override
  String get callEndedLost =>
      'A chamada terminou porque a conexão caiu por tempo demais.';

  @override
  String get callMinimize => 'Minimizar';

  @override
  String get callEndCall => 'Encerrar chamada';

  @override
  String get callEndAndAnswer => 'Encerrar e atender';

  @override
  String get callReconnecting => 'Reconectando…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutos',
      one: '$count minuto',
      zero: 'menos de 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Chamada com $bot, $time, toque para voltar';
  }

  @override
  String callReturnBar(String bot) {
    return 'Em chamada com $bot, toque para voltar';
  }

  @override
  String get callOpen => 'Abrir chamada';

  @override
  String get callOnHold => 'Em espera';

  @override
  String get callNotificationLive => 'Em chamada';

  @override
  String get callNotificationMuted => 'Silenciado';

  @override
  String get callNotificationChannel => 'Chamadas';

  @override
  String callTabTitle(String time) {
    return 'Em chamada · $time';
  }

  @override
  String get callMenuShow => 'Mostrar chamada';

  @override
  String get callJobWorking => 'Trabalhando nisso';

  @override
  String callJobStrip(String task) {
    return 'Trabalhando em: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Precisa de você: $task';
  }

  @override
  String get callTileWatching => 'Ao vivo';

  @override
  String get callTileDone => 'Concluído';

  @override
  String get callTileNeedsYou => 'Precisa de você';

  @override
  String callTileLabel(String state) {
    return 'Tela do bot, $state. Toque para ver em tamanho real';
  }

  @override
  String get callTileHide => 'Ocultar tela';

  @override
  String get screenCardLive => 'ao vivo';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Tela de $bot, $state';
  }

  @override
  String get screenCardOpen => 'Abrir em tela cheia';

  @override
  String get screenCardYouHave => 'A tela está com você';

  @override
  String screenCardHeldBy(String name) {
    return '$name está com a tela';
  }

  @override
  String get screenCardMore => 'Mais opções';

  @override
  String screenCardIntro(String bot) {
    return 'Tela de $bot. Toque para assistir, arraste para mover.';
  }

  @override
  String get screenCardHideForNow => 'Ocultar por enquanto';

  @override
  String get screenCardDontShow => 'Não mostrar automaticamente';

  @override
  String get screenCardTurnedOff =>
      'O cartão de tela está desativado. Ative novamente em Configurações.';

  @override
  String get screenCardOfferOff =>
      'Ocultando muito o cartão de tela? Você pode desativá-lo.';

  @override
  String get screenCardTurnOff => 'Desativar';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot precisa de você na tela';
  }

  @override
  String callRecapTitle(String length) {
    return 'Chamada · $length';
  }

  @override
  String get callRecapStarted => 'Iniciado na chamada';

  @override
  String get callRecapTaskDone => 'Concluído';

  @override
  String get callRecapTaskFailed => 'Não terminou';

  @override
  String get callRecapTaskStopped => 'Interrompido';

  @override
  String get callRecapTaskRunning => 'Ainda trabalhando';

  @override
  String get callRecapOpenRun => 'Ver o que ele fez';

  @override
  String get summarizeCalls => 'Resumir chamadas';

  @override
  String get summarizeCallsHelp =>
      'Após cada chamada, o cartão mostra sobre o que foi e os próximos passos. Usa um pouco do modelo menor do bot.';

  @override
  String callCardVoice(String length) {
    return 'Chamada de voz · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Chamada telefônica · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Chamada caiu · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Chamada perdida de $name';
  }

  @override
  String callCardLive(String name) {
    return 'Em chamada com $name';
  }

  @override
  String get callCardLiveElsewhere => 'Em chamada em outro dispositivo';

  @override
  String get callCardReturn => 'Voltar à chamada';

  @override
  String callCardBotHungUp(String name) {
    return '$name desligou';
  }

  @override
  String get callCardEndedQuiet => 'Encerrada após um período em silêncio';

  @override
  String get callCardEndedLimit => 'Encerrada no limite da chamada';

  @override
  String get callCardWritingSummary => 'Escrevendo um resumo…';

  @override
  String callCardSummaryBy(String name) {
    return 'Resumo por $name';
  }

  @override
  String get callCardNextSteps => 'Próximos passos';

  @override
  String get callCardDoIt => 'Fazer';

  @override
  String get callCardDismissStep => 'Dispensar';

  @override
  String get callCardStepStarted => 'Iniciado';

  @override
  String get callCardStepFailed => 'Não foi possível iniciar. Tente novamente.';

  @override
  String get callCardDoneOnCall => 'Feito na chamada';

  @override
  String callCardMore(int count) {
    return 'mais $count';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Transcrição · $count turnos',
      one: 'Transcrição · $count turno',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Transcrição';

  @override
  String get callCardSearchTranscript => 'Buscar na transcrição';

  @override
  String get callCardNoMatches => 'Nenhum resultado';

  @override
  String get callCardYou => 'Você';

  @override
  String get callCardCallBack => 'Ligar de volta';

  @override
  String get callCardCopy => 'Copiar';

  @override
  String get callCardCopied => 'Copiado';

  @override
  String get callCardShare => 'Compartilhar';

  @override
  String get callCardMoreActions => 'Mais';

  @override
  String get callCardDelete => 'Excluir chamada';

  @override
  String get callCardDeleteTitle => 'Excluir esta chamada?';

  @override
  String get callCardDeleteBody =>
      'O cartão e a transcrição são removidos deste chat. Os trabalhos iniciados mantêm seus resultados.';

  @override
  String get callCardDeleted => 'Chamada excluída';

  @override
  String get callCardDeleteFailed => 'Não foi possível excluir a chamada';

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

    return 'Resposta iniciada em $msString ms';
  }

  @override
  String get voiceSettings => 'Voz';

  @override
  String get voiceSettingsHelp =>
      'Voz de leitura em voz alta e as ferramentas que um bot tem em chamadas';

  @override
  String get callTools => 'Ferramentas em chamadas';

  @override
  String get callToolsHelp =>
      'As chamadas já incluem memória, busca na web, recados para você, rotinas e tickets, e passam trabalhos maiores para o chat. Adicione ferramentas de apps conectados para o bot usar ao vivo; cada uma soma um pouco ao custo da chamada.';

  @override
  String get callToolsNone =>
      'Este bot ainda não tem apps conectados ativados. Ative um nas Integrações dele e escolha as ferramentas aqui.';

  @override
  String get openIntegrations => 'Abrir integrações';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ferramentas de apps conectados adicionadas',
      one: '$countString ferramenta de app conectado adicionada',
      zero: 'Apenas as ferramentas de voz integradas',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'ID da voz (opcional)';

  @override
  String get voiceIdHelp =>
      'Um nome de voz Gemini, como Kore ou Puck; vazio usa Kore';

  @override
  String get useThisComputer => 'Usar este computador para bots';

  @override
  String get companionDesktopOnly =>
      'Apenas o app para computador (macOS, Windows, Linux) pode atuar como computador para bots.';

  @override
  String get companionIntro =>
      'Permita que os bots escolhidos trabalhem neste computador: executem comandos, editem arquivos nas pastas que você escolher, naveguem e usem apps. Tudo o que fazem aparece na tela e pode ser interrompido. Desativado até você aprovar cada capacidade.';

  @override
  String get thisComputer => 'Este computador';

  @override
  String get companionOnline =>
      'Ativado: os bots que você permitir podem usar este computador';

  @override
  String get companionError =>
      'Não foi possível conectar ao Casama; tentando novamente';

  @override
  String get companionOff => 'Desativado';

  @override
  String get companionCapabilities => 'O que os bots podem fazer';

  @override
  String get companionCapabilitiesHelp =>
      'Aprove cada opção. Ações de alto risco sempre perguntam, seja qual for a autonomia do bot.';

  @override
  String get capShell => 'Executar comandos (dentro das pastas compartilhadas)';

  @override
  String get capFiles => 'Ler e editar arquivos em pastas compartilhadas';

  @override
  String get capBrowser => 'Usar um navegador (próprio, separado do seu)';

  @override
  String get capDesktop => 'Usar apps do computador';

  @override
  String get sharedFolders => 'Pastas compartilhadas';

  @override
  String get sharedFoldersHelp => 'Os bots só alcançam estas pastas.';

  @override
  String get addFolder => 'Adicionar pasta';

  @override
  String get botsAllowed => 'Bots permitidos';

  @override
  String get botsAllowedHelp =>
      'Bots permitidos também podem trabalhar neste computador. Cada um mantém o próprio computador e o usa, a menos que uma tarefa precise deste.';

  @override
  String get worksOnTitle => 'Onde trabalha';

  @override
  String worksOnSubtitle(String bot) {
    return 'Onde $bot executa comandos, usa arquivos e navega para você.';
  }

  @override
  String get worksOnAuto => 'Automático';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot escolhe a cada passo: o próprio computador, a menos que a tarefa precise do seu.';
  }

  @override
  String get worksOnBot => 'Apenas o computador do bot';

  @override
  String get worksOnBotHelp => 'Seu computador não é usado de forma alguma.';

  @override
  String get worksOnMine => 'Apenas meu computador';

  @override
  String get worksOnMineHelp =>
      'Tudo acontece no seu computador, então ele precisa estar ligado.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Tudo acontece em $computer, então ele precisa estar ligado.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Trabalha em: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Onde $bot trabalha';
  }

  @override
  String get placesSubtitle =>
      'Escolha o computador para visualizar aqui. “Onde trabalha” decide onde o bot faz o trabalho.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Mostrando $computer. Trabalha em: $mode. Alterar';
  }

  @override
  String get placeYoursOnline => 'Seu computador · Online';

  @override
  String get placeYoursOffline => 'Seu computador · Offline';

  @override
  String get placeTeamComputer => 'Computador da equipe';

  @override
  String placeBotsOwn(String bot) {
    return 'Computador próprio de $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action em $computer';
  }

  @override
  String get botYourComputer => 'Seu computador';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone =>
      'Não permitido em nenhum dos seus computadores';

  @override
  String botYourComputerHow(String bot) {
    return 'Para deixar $bot trabalhar no seu computador também, abra o Casama nele e ative em Configurações → Usar este computador para bots → Bots permitidos. Ele mantém o próprio computador de qualquer forma.';
  }

  @override
  String get routineWhere => 'Onde trabalha';

  @override
  String get routineWhereHelp =>
      'Onde esta rotina executa comandos e usa arquivos.';

  @override
  String get routineWhereBot => 'O computador do bot';

  @override
  String get routineWhereBotHelp =>
      'Roda com o seu computador ligado ou desligado.';

  @override
  String get routineWhereMine => 'Meu computador quando estiver ligado';

  @override
  String get routineWhereMineHelp =>
      'Para trabalho nos seus próprios arquivos e apps. A execução avisa quando o computador estava desligado.';

  @override
  String get routineUsesComputer => 'Usa um computador';

  @override
  String get routineUsesComputerOn =>
      'Pode salvar arquivos, executar comandos e navegar por páginas.';

  @override
  String get routineUsesComputerOff =>
      'Lê apenas seus apps, a web e a memória. Mais rápido, e nunca acorda um computador.';

  @override
  String get computerBotsAllowed => 'Bots permitidos';

  @override
  String get unpairComputer => 'Parar de usar este computador e desvincular';

  @override
  String botActingHere(String bot, String action) {
    return '$bot está trabalhando neste computador: $action';
  }

  @override
  String get quickAsk => 'Pergunta rápida';

  @override
  String get quickAskHint => 'Pergunte qualquer coisa a um bot…';

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
  String get cloudModelsTitle => 'Modelos na nuvem';

  @override
  String get cloudModelsHelp =>
      'Aplica-se a todos os servidores Cloud em segundos.';

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
  String get connectionsTitle => 'Conexões de apps';

  @override
  String get connectionsServerComposio => 'Conta Composio do Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Apps sem login próprio conectam em um clique pela conta Composio deste servidor.';

  @override
  String get connectionsOwnAccounts => 'Contas próprias das pessoas';

  @override
  String get connectionsOwnAccountsHelp =>
      'Cada pessoa usa sua própria conta Composio, Pipedream ou Zapier.';

  @override
  String get connectionsNoComposioKey =>
      'Adicione COMPOSIO_API_KEY a este servidor para usar a conta do Casama.';

  @override
  String get connectionsGoogleTitle => 'Apps do Google';

  @override
  String get connectionsGoogleComposio => 'Pelo Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Agenda, Drive e mais funcionam na hora.';

  @override
  String get connectionsGoogleDirect => 'Servidores próprios do Google';

  @override
  String get connectionsGoogleDirectHelp =>
      'Requer inscrição no Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Apenas o proprietário da instância pode abrir o console de administração.';

  @override
  String get runs24h => 'Execuções (24 h)';

  @override
  String get failedRuns24h => 'Execuções com falha (24 h)';

  @override
  String get cost24h => 'Gasto (24 h)';

  @override
  String get computersRunning => 'Computadores ativos';

  @override
  String get devicesOnline => 'Computadores pessoais online';

  @override
  String get editQuotas => 'Editar cotas';

  @override
  String get maxBots => 'Limite de bots';

  @override
  String get monthlyUsd => 'Limite mensal de gastos (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'O Casama $latest está disponível (sua versão: $current)';
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
      other: '$nString espaços de trabalho',
      one: '$nString espaço de trabalho',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'entrou $when';
  }

  @override
  String quotasFor(String name) {
    return 'Cotas de $name';
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
      other: '$nString membros',
      one: '$nString membro',
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
    return '$usd em 30 dias';
  }

  @override
  String get connectingToServer => 'Conectando ao Casama…';

  @override
  String get cannotReachServer =>
      'Não foi possível alcançar seu servidor Casama';

  @override
  String get connectionFailed =>
      'Não foi possível alcançar seu servidor Casama. Verifique sua conexão e tente novamente.';

  @override
  String get serverNotResponding =>
      'Seu servidor Casama não está respondendo agora. Tente novamente em instantes.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Verifique sua conexão ou se o servidor em $url está em execução.';
  }

  @override
  String get serverUnreachableBody =>
      'Verifique se você está online. Se estiver, o servidor pode estar reiniciando, então vamos continuar tentando.';

  @override
  String retryingIn(int seconds) {
    return 'Tentando novamente em ${seconds}s';
  }

  @override
  String get retryingNow => 'Tentando…';

  @override
  String get upgradeTitle => 'Faça upgrade do seu plano';

  @override
  String get notNow => 'Agora não';

  @override
  String get seePlans => 'Ver planos';

  @override
  String get billing => 'Cobrança';

  @override
  String get billingOffSelfHosted =>
      'A cobrança está desativada neste servidor. Ele roda com licença própria: o uso pessoal é gratuito para uma pessoa, e equipes usam uma licença Business.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restoreStarted => 'Verificando suas compras…';

  @override
  String get plans => 'Planos';

  @override
  String get currentPlan => 'Plano atual';

  @override
  String subscribeFor(String price) {
    return 'Assinar por $price';
  }

  @override
  String get subscribeOnWeb => 'Assinar na web';

  @override
  String get credits => 'Créditos';

  @override
  String get creditHistory => 'Histórico de créditos';

  @override
  String get creditReasonPurchase => 'Créditos comprados';

  @override
  String get creditReasonGrant => 'Créditos adicionados';

  @override
  String get creditReasonRefund => 'Reembolso';

  @override
  String get creditReasonAdjustment => 'Ajuste';

  @override
  String get creditReasonExpire => 'Créditos expirados';

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
  String get limitBotsUnlimited => 'Bots ilimitados';

  @override
  String get unlimitedValue => 'Ilimitado';

  @override
  String trialDaysFree(int n) {
    return '$n dias grátis';
  }

  @override
  String get extraPeople => 'Pessoas extras';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price por pessoa ao mês, além das $seats que seu plano inclui.';
  }

  @override
  String get extraPeopleSaved => 'Pessoas extras atualizadas';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString horas de computador por mês';
  }

  @override
  String limitCredits(String amount) {
    return '$amount créditos por mês';
  }

  @override
  String get viaWeb => 'Cobrado na web';

  @override
  String get viaAppStore => 'Cobrado pela App Store';

  @override
  String get viaGooglePlay => 'Cobrado pelo Google Play';

  @override
  String get yourPlan => 'Seu plano';

  @override
  String planEndsOn(String date) {
    return 'Termina em $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Renova em $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Créditos: $amount';
  }

  @override
  String get manageSubscription => 'Gerenciar assinatura';

  @override
  String get compViaCasama => 'Grátis pelo Casama';

  @override
  String compFreeUntil(String date) {
    return 'Grátis até $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Compra de teste. Aplicam-se limites de testador: $credits de créditos por mês e $daily por dia.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Manter $plan';
  }

  @override
  String get haveGiftCode => 'Tem um código de presente?';

  @override
  String get redeemCodeTitle => 'Resgatar código de presente';

  @override
  String get redeemCodeIntro =>
      'Digite o código que você recebeu. O plano vai para o espaço de trabalho que você escolher, sem nada a pagar.';

  @override
  String get redeemCodeLabel => 'Código de presente';

  @override
  String get redeemCodeChecking => 'Verificando…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months meses de $plan, grátis',
      one: '$months mês de $plan, grátis',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'Este código não existe ou não pode mais ser usado.';

  @override
  String get redeemCodeWorkspace => 'Espaço de trabalho';

  @override
  String get redeemCodeSubmit => 'Resgatar';

  @override
  String get redeemCodeFinePrint =>
      'Um código de presente por pessoa. Quando acabar, o espaço de trabalho passa para o plano Grátis, a menos que você escolha um plano.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan é seu';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Seu espaço de trabalho tem $plan grátis até $date. Abra o Casama em qualquer dispositivo para usar.';
  }

  @override
  String get redeemCodeOpenBilling => 'Abrir cobrança';

  @override
  String get redeemCodeNoWorkspace =>
      'Um código de presente vai para um espaço de trabalho do qual você é proprietário. Crie um primeiro e abra o link novamente.';

  @override
  String get redeemCodeUnavailable =>
      'Isso não está disponível nesta versão do app.';

  @override
  String usageComputerHours(String hours) {
    return 'Computadores na nuvem: $hours h';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Visualização ao vivo: $minutes min';
  }

  @override
  String get thisMonth => 'Este mês';

  @override
  String get noBillableUsage => 'Nenhum uso cobrável ainda.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Conecte um Casama auto-hospedado a este espaço de trabalho. Endereço público e notificações são gratuitos; computadores na nuvem e créditos de modelo são cobrados aqui.';

  @override
  String get linkCloudNewKey => 'Nova chave do Casama Link';

  @override
  String get linkCloudKeyCreated => 'Chave criada';

  @override
  String get linkCloudKeyOnce =>
      'Copie agora; ela é exibida apenas uma vez. Defina no seu servidor com CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Copiar';

  @override
  String get revoke => 'Revogar';

  @override
  String get instanceName => 'Nome do servidor';

  @override
  String get server => 'Servidor';

  @override
  String get serverAddress => 'Endereço do servidor';

  @override
  String get serverAddressInvalid =>
      'Digite um endereço de servidor como https://casama.example.com ou http://192.168.1.20:8080.';

  @override
  String get connect => 'Conectar';

  @override
  String get changeServer => 'Usar outro servidor';

  @override
  String serverIs(String host) {
    return 'Servidor: $host';
  }

  @override
  String get continueWithSso => 'Continuar com SSO';

  @override
  String get workEmail => 'E-mail corporativo';

  @override
  String get privacy => 'Privacidade';

  @override
  String get exportMyData => 'Exportar meus dados';

  @override
  String get exportMyDataHelp =>
      'Bots, chats, execuções, memórias e configurações. Sem segredos.';

  @override
  String exportReady(String kb) {
    return 'Exportação pronta ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Manter histórico de execuções por';

  @override
  String get runHistoryRetentionHelp =>
      'Eventos de execução mais antigos são excluídos automaticamente.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString dias',
      one: '$countString dia',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Excluir minha conta';

  @override
  String get deleteAccountHelp =>
      'Apaga seus dados após um curto período de carência.';

  @override
  String get deleteAccountQuestion => 'Excluir sua conta?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Os espaços de trabalho em que você é a única pessoa proprietária são excluídos com sua conta, incluindo os bots e computadores deles. Um plano que você comprou na web é cancelado automaticamente. Um plano comprado na App Store ou no Google Play não é: cancele-o nessa loja. Digite $email para confirmar.';
  }

  @override
  String get accountDeleted => 'Exclusão de conta agendada';

  @override
  String accountDeletedBody(String date) {
    return 'Você foi desconectado. Seus dados serão apagados em $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString passos',
      one: '$countString passo',
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
      other: 'Mostrar $countString passos anteriores',
      one: 'Mostrar $countString passo anterior',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Copiado';

  @override
  String get jumpToLatest => 'Ir para o mais recente';

  @override
  String get chatViewFullTable => 'Ver tabela completa';

  @override
  String get chatShowMore => 'Mostrar mais';

  @override
  String get chatShowLess => 'Mostrar menos';

  @override
  String get chatTableTitle => 'Tabela';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Pergunte qualquer coisa a $bot, ou toque em uma ideia abaixo para começar.';
  }

  @override
  String get suggestPlanDay => 'Me ajude a planejar meu dia';

  @override
  String get suggestWriteMessage => 'Me ajude a escrever uma mensagem';

  @override
  String get suggestExplain => 'Pesquise algo e explique de forma simples';

  @override
  String get suggestCapabilities => 'Com o que você pode me ajudar?';

  @override
  String connectedAppSummary(String app) {
    return '$app conectado';
  }

  @override
  String serverNotChecked(String host) {
    return 'O Casama não verificou este servidor. Conecte apenas se confiar em $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'O Casama não verificou este servidor. Conecte apenas se confiar em quem o executa.';

  @override
  String get serverAddressLabel => 'Endereço do servidor';

  @override
  String get serverAddressHelp =>
      'Cole o endereço do servidor. Se houver uma chave nele, ela é armazenada criptografada e fica fora do chat.';

  @override
  String get serverChecking => 'Verificando o servidor…';

  @override
  String serverSignInOn(String host) {
    return 'Você vai entrar em $host.';
  }

  @override
  String get serverUseKey => 'Usar uma chave';

  @override
  String get serverUseSignIn => 'Entrar com conta';

  @override
  String serverSignInUnavailable(String name) {
    return '$name não aceita login pelo navegador a partir deste servidor Casama. Use uma chave.';
  }

  @override
  String get serverNoSignIn => 'Este servidor funciona sem login.';

  @override
  String get serverHeaderLabel => 'Nome do cabeçalho (opcional)';

  @override
  String get serverToolsTitle => 'Ferramentas que pode usar';

  @override
  String get serverToolsHelp =>
      'Desative as que você não quiser. Os bots ainda perguntam antes de passos arriscados.';

  @override
  String addedInChatBy(String bot) {
    return 'Adicionado no chat por $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name roda no seu próprio computador. Abra o Casama nesse computador e ative Usar este computador para adicionar.';
  }

  @override
  String get connectAppsTitle => 'Conecte seus apps';

  @override
  String get moreApps => 'Mais';

  @override
  String addAppTile(String app) {
    return 'Adicionar $app a este bot';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app adicionado a $bot';
  }

  @override
  String get connectAppsHint =>
      'Deixe-me ler e agir nas ferramentas que você já usa.';

  @override
  String connectAppTile(String app) {
    return 'Conectar $app';
  }

  @override
  String get showComputer => 'Mostrar computador';

  @override
  String get hideComputer => 'Ocultar computador';

  @override
  String get moreActions => 'Mais';

  @override
  String get noConversations => 'Nenhuma conversa ainda';

  @override
  String get untitledChat => 'Nova conversa';

  @override
  String get listening => 'Ouvindo…';

  @override
  String get orLabel => 'ou';

  @override
  String get notificationsPrimerBubble => 'Não perca nada!';

  @override
  String get notificationsPrimerTitle => 'Ativar notificações';

  @override
  String get notificationsPrimerBody =>
      'Seus bots avisam quando precisam de uma decisão sua ou quando o trabalho está pronto.';

  @override
  String get notificationsPrimerBlockedBody =>
      'O Chrome está bloqueando notificações para este site. Permita pelo cadeado na barra de endereços e toque em Ativar novamente.';

  @override
  String get notificationsTurnOn => 'Ativar';

  @override
  String get autoUpdates => 'Atualizar automaticamente';

  @override
  String get autoUpdatesHelp => 'Instala novas versões quando você sair.';

  @override
  String get upToDate => 'O Casama está atualizado';

  @override
  String get noReleasesToCheck =>
      'Nenhuma versão foi publicada para este computador ainda, então não há com o que comparar esta versão.';

  @override
  String updateReady(String version) {
    return 'Casama $version está disponível';
  }

  @override
  String appVersion(String version) {
    return 'Versão $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Novidades no Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Entendi';

  @override
  String get whatsNewSubtitle =>
      'Veja o que mudou desde sua última atualização.';

  @override
  String get whatsNew010Calls =>
      'Ligue para seus bots e resolva as coisas conversando. Eles respondem em voz alta, com legendas.';

  @override
  String get whatsNew010Looks =>
      'Deixe o Casama com a sua cara: temas, esquemas de cores, fontes e papéis de parede em Configurações → Aparência, com mais opções na galeria.';

  @override
  String get whatsNew010AboutYou =>
      'Conte aos seus bots sobre você uma única vez, em Configurações → Sobre você: como chamar você e como prefere as respostas.';

  @override
  String get whatsNew010SignIn =>
      'Entre com uma chave de acesso, Apple, Google ou um código do seu e-mail.';

  @override
  String get openAtLogin => 'Abrir ao iniciar sessão';

  @override
  String get openAtLoginHelp => 'Pronto para o atalho de pergunta rápida.';

  @override
  String get signInTagline =>
      'Colegas que continuam trabalhando depois que você fecha o app.';

  @override
  String get signInTagline2 => 'Conheça sua equipe de IA.';

  @override
  String get signInTagline3 => 'IA que não só conversa. Ela resolve.';

  @override
  String get signInTagline4 => 'Colegas capazes que perguntam antes de agir.';

  @override
  String get signInTagline5 => 'Passe a tarefa. Volte e ela estará pronta.';

  @override
  String get noBotsHelp =>
      'Um bot é um colega com seu próprio computador. Crie um para começar a conversar.';

  @override
  String get newBotSubtitle =>
      'Um colega com seu próprio computador e memória.';

  @override
  String get appearance => 'Aparência';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI ou outro provedor compatível';

  @override
  String get signOutConfirm =>
      'Você pode entrar novamente a qualquer momento; seus bots continuam trabalhando.';

  @override
  String get roleOwner => 'Proprietário';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get roleMember => 'Membro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get createWorkspaceBody =>
      'Um espaço de trabalho reúne seus bots, os computadores deles e as pessoas com quem você trabalha.';

  @override
  String get workspaceNameHint => 'Minha equipe';

  @override
  String get orJoinWithCode => 'ou entre com um código de convite';

  @override
  String get getOpenRouterKey => 'Obter chave do OpenRouter';

  @override
  String get createFirstBotBody =>
      'Dê um nome e um modelo a ele. Você pode mudar os dois depois.';

  @override
  String stepOf(int step, int total) {
    return 'Passo $step de $total';
  }

  @override
  String get providerHintOpenRouter => 'recomendado: chat, imagens, vídeo, voz';

  @override
  String get providerHintGoogle => 'apenas chamadas ao vivo';

  @override
  String get providerHintCompatible => 'Qualquer API compatível com OpenAI';

  @override
  String get providerHintSearch => 'busca na web';

  @override
  String get noRoutinesHelp =>
      'Uma rotina é um trabalho que o bot faz depois por conta própria: uma vez no horário escolhido, em uma programação ou quando chega um webhook.';

  @override
  String get routineOnce => 'Uma vez';

  @override
  String lastRun(String when) {
    return 'Última: $when';
  }

  @override
  String get routineOff => 'Desativada';

  @override
  String get routineEnds => 'Termina';

  @override
  String get routineEndsNever => 'Nunca';

  @override
  String get routineEndsOnDate => 'Em uma data';

  @override
  String get routineEndsAfterRuns => 'Após algumas execuções';

  @override
  String get routineEndDate => 'Último dia';

  @override
  String get routineRunCountLabel => 'Execuções';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n execuções',
      one: '$n execução',
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
      other: '$n execuções restantes',
      one: '$n execução restante',
      zero: 'Nenhuma execução restante',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Quando termina';

  @override
  String get routineEndTitle => 'Quando termina';

  @override
  String get routineEndSubtitle =>
      'Ela se desativa nesse momento. Um novo número de execuções conta a partir de agora.';

  @override
  String deleteRoutineTitle(String name) {
    return 'Excluir “$name”?';
  }

  @override
  String get deleteRoutineBody =>
      'Ela não será executada novamente. Os resultados já publicados continuam na conversa.';

  @override
  String get triggerOnce => 'Uma vez';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Em $nString min';
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
      other: 'Em $nString horas',
      one: 'Em $nString hora',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Amanhã $time';
  }

  @override
  String get integrationNeedsName => 'Dê um nome com pelo menos uma letra.';

  @override
  String integrationNeedsField(String field) {
    return 'Preencha $field para salvar.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Salvo como $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Use um endereço completo começando com https://';

  @override
  String get openFile => 'Abrir';

  @override
  String get saveFile => 'Salvar';

  @override
  String get shareFile => 'Compartilhar';

  @override
  String savedFile(String name) {
    return '$name salvo';
  }

  @override
  String noAppToOpen(String name) {
    return 'Nenhum app neste dispositivo abre $name. Em vez disso, salve o arquivo.';
  }

  @override
  String get previewUnavailable =>
      'Sem pré-visualização para este tipo de arquivo. Abra ou salve para ver.';

  @override
  String get openInSystemPlayer => 'Abrir no seu player de vídeo';

  @override
  String get playMedia => 'Reproduzir';

  @override
  String get fullScreen => 'Tela cheia';

  @override
  String get exitFullScreen => 'Sair da tela cheia';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Abrir no navegador';

  @override
  String get convertingToPdf => 'Preparando pré-visualização…';

  @override
  String tableFirstRows(int count) {
    return 'Mostrando as primeiras $count linhas';
  }

  @override
  String get imageCouldNotLoad => 'Não foi possível carregar esta imagem';

  @override
  String get mediaKindImage => 'Imagem';

  @override
  String get mediaKindVideo => 'Vídeo';

  @override
  String get mediaKindAudio => 'Áudio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Abrir arquivo';

  @override
  String get attach => 'Anexar';

  @override
  String get attachFiles => 'Arquivos';

  @override
  String get attachPhotos => 'Biblioteca de fotos';

  @override
  String get attachCamera => 'Tirar foto';

  @override
  String get attachScan => 'Escanear documento';

  @override
  String get scanFailed =>
      'Não foi possível escanear o documento. Tente novamente.';

  @override
  String get dropToAttach => 'Solte arquivos para anexar';

  @override
  String uploadFailed(String name) {
    return 'Não foi possível enviar $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'Não foi possível anexar $name: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'Não foi possível anexar $name';
  }

  @override
  String get sendWithoutIt => 'Enviar sem ele';

  @override
  String get sendWithoutThem => 'Enviar sem eles';

  @override
  String get removeAttachment => 'Remover';

  @override
  String get editPhoto => 'Editar foto';

  @override
  String get retryUpload => 'Tente novamente';

  @override
  String get uploadingAttachments => 'Enviando…';

  @override
  String get notSent => 'Não enviado';

  @override
  String get deleteChat => 'Excluir chat';

  @override
  String get deleteChatTitle => 'Excluir este chat?';

  @override
  String deleteChatBody(String bot) {
    return 'As mensagens dele são excluídas para todos que podem ver o chat. O que $bot criou aqui continua na Biblioteca, os registros de uso permanecem, e o que ele guardou na memória a partir do chat continua lá.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir também os $count itens criados aqui',
      one: 'Excluir também o $count item criado aqui',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Desativado: eles ficam na Biblioteca.';

  @override
  String get chatDeleted => 'Chat excluído';

  @override
  String get deleteAllChats => 'Excluir todos os chats';

  @override
  String get deleteAllChatsRow =>
      'Começar de novo com um histórico limpo. As memórias ficam.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Excluir todos os chats com $bot?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Todo chat com $bot que você pode excluir é apagado, com suas mensagens, fotos e arquivos. Chats em grupo ficam. Registros de uso ficam e o que $bot lembrou fica na memória dele.';
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
      other: '$nString chats excluídos.',
      one: '$nString chat excluído.',
      zero: 'Nenhum chat para excluir.',
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
          '$nString chats foram mantidos porque o bot ainda está trabalhando neles.',
      one:
          '$nString chat foi mantido porque o bot ainda está trabalhando nele.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n bots estão neste chat. Cada um mantém sua própria memória e configurações.',
      one:
          '$n bot está neste chat. Cada um mantém sua própria memória e configurações.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Digite @ e um nome para perguntar diretamente a um bot.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone: $lead responde primeiro e distribui as partes quando há trabalho para dividir; senão, cada bot responde na sua vez e o último encerra a rodada.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Sem menção, o bot que falou por último responde ($lead no início).';
  }

  @override
  String get messageNotSent =>
      'Seus arquivos não foram enviados, então a mensagem não foi enviada. Ela voltou para a caixa.';

  @override
  String get chatSendsWhenDone => 'Envia quando esta resposta terminar';

  @override
  String get noComputerForFiles =>
      'Este bot não tem computador para guardar arquivos.';

  @override
  String fileTooLarge(String name) {
    return '$name passa de 25 MB e é grande demais para anexar. Em vez disso, envie um link dele pelo Google Drive, Dropbox, iCloud ou qualquer armazenamento em nuvem.';
  }

  @override
  String get secretsHelp =>
      'Os bots colocam um segredo nas solicitações pelo nome. Ele só é enviado aos hosts que você permitir e o modelo nunca o vê.';

  @override
  String deleteSecretTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String get deleteSecretBody =>
      'Bots que o usam deixarão de alcançar esse serviço.';

  @override
  String get hide => 'Ocultar';

  @override
  String get show => 'Mostrar';

  @override
  String get deleteMemoryTitle => 'Excluir esta memória?';

  @override
  String get noMemoriesHelp =>
      'Conforme você conversa, o bot guarda o que importa: fatos, preferências e resumos de trabalhos anteriores.';

  @override
  String get memoryHelp =>
      'Memórias fixadas estão sempre no contexto do bot. Edite o que estiver errado; memórias excluídas somem para sempre.';

  @override
  String get memoryFact => 'Fato';

  @override
  String get memoryPreference => 'Preferência';

  @override
  String get memorySummary => 'Resumo';

  @override
  String get memoryEpisode => 'Episódio';

  @override
  String get pinned => 'Fixado';

  @override
  String get editMemory => 'Editar memória';

  @override
  String get editMemoryHelp =>
      'O bot usa isso na próxima vez que for relevante.';

  @override
  String get modelKeysIntro =>
      'Os bots pensam com suas próprias chaves de provedor de modelo. As chaves ficam armazenadas criptografadas e nunca mais são exibidas.';

  @override
  String get casamaCloudKeyHint => 'Pago com seus créditos';

  @override
  String get casamaCloudIncluded => 'Incluído';

  @override
  String get casamaCloudModelLocked => 'O Casama escolhe este modelo.';

  @override
  String get serverVoiceSetUp =>
      'Este servidor fornece voz, então não há chave para adicionar. A chave própria de um espaço de trabalho é usada primeiro.';

  @override
  String modelKeysFor(String workspace) {
    return 'Chaves pertencem a um espaço de trabalho. Estas são de $workspace.';
  }

  @override
  String get yourKeys => 'Suas chaves';

  @override
  String get keyWorking => 'Funcionando';

  @override
  String get keyFailing => 'Com falha';

  @override
  String get keyUntested => 'Não testada';

  @override
  String get skillsHelp =>
      'Uma habilidade é um conjunto de instruções que um bot carrega quando uma tarefa pede, como seu estilo para relatórios.';

  @override
  String get skillsForAllBots => 'Todos os bots';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Apenas para $bot';
  }

  @override
  String get skillsRemovedBot => 'Um bot removido';

  @override
  String deleteSkillTitle(String name) {
    return 'Excluir a habilidade “$name”?';
  }

  @override
  String get editSkill => 'Editar habilidade';

  @override
  String get deleteSkill => 'Excluir habilidade';

  @override
  String get skillDescriptionHelp =>
      'Os bots leem isto para decidir quando a habilidade se aplica.';

  @override
  String get skillBodyHint => '# Passos\n1. …';

  @override
  String get computersHelp =>
      'Cada bot trabalha em um computador: o computador da equipe que todos compartilham, ou um privado. Os arquivos ficam nele entre os chats.';

  @override
  String get computersEmptyTitle => 'Nenhum computador ainda';

  @override
  String get thisDevice => 'Este dispositivo';

  @override
  String get personalComputerConnected => 'Conectado';

  @override
  String get personalComputerOffline => 'Offline';

  @override
  String computerCpus(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n CPUs',
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
    return '$size de disco';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Último uso $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Visto por último $when';
  }

  @override
  String get computerSaved => 'Salvo';

  @override
  String get computerSavedHelp =>
      'Os arquivos dele são mantidos enquanto estiver parado';

  @override
  String computerCanUse(Object list) {
    return 'Os bots podem usar: $list';
  }

  @override
  String get computerCanUseNothing => 'Os bots ainda não podem usá-lo';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Arquivos';

  @override
  String get computerCapBrowser => 'Navegador';

  @override
  String get computerCapDesktop => 'Tela';

  @override
  String get computerCapMcp => 'Ferramentas locais';

  @override
  String get computerCapMessages => 'Mensagens';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name está offline. Abra o Casama nele e ative “Usar este computador para bots”. Seu próprio computador nunca consome as horas de computador do seu plano.';
  }

  @override
  String get yourComputerOffline => 'Seu computador está offline';

  @override
  String get howToFix => 'Como resolver';

  @override
  String get computerHoursUsedTitle => 'Horas de computador esgotadas';

  @override
  String get personalScreenNote =>
      'Este é o seu próprio computador, então você vê uma nova captura de tela a cada poucos segundos em vez de visualização ao vivo.';

  @override
  String get renameComputer => 'Renomear computador';

  @override
  String deleteComputerTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String get privacyIntro =>
      'Seus chats, memórias e arquivos pertencem a você. Exporte-os a qualquer momento ou exclua sua conta.';

  @override
  String get yourData => 'Seus dados';

  @override
  String get shareAnalytics => 'Compartilhar dados de uso';

  @override
  String get shareAnalyticsHelp =>
      'Relatórios de uso e falhas. Nunca suas mensagens ou arquivos.';

  @override
  String get measureAds => 'Ajudar a medir nossos anúncios';

  @override
  String get measureAdsHelp =>
      'Permite que o Casama avise à Meta quando alguém que viu nosso anúncio se cadastra ou assina. O Casama nunca exibe anúncios.';

  @override
  String get measureAdsNeedsUsageData =>
      'Ative Compartilhar dados de uso para usar isso.';

  @override
  String get trackingTile => 'Permitir rastreamento';

  @override
  String get trackingAllowed =>
      'Permitido. O SDK da Meta roda neste dispositivo e o Casama pode avisar à Meta quando você se cadastrar ou assinar após ver nosso anúncio. Altere no app Ajustes.';

  @override
  String get trackingNotAllowed =>
      'Não permitido. Nada deste dispositivo vai para a Meta. Altere no app Ajustes.';

  @override
  String get trackingNotAsked =>
      'O Casama ainda não pediu. Até você permitir, nada deste dispositivo vai para a Meta.';

  @override
  String get trackingOpenSettings => 'Abrir Ajustes';

  @override
  String get workspaceAnalytics => 'Dados de uso deste espaço de trabalho';

  @override
  String get workspaceAnalyticsHelp =>
      'Dados de uso deste espaço de trabalho. Relatórios de falha continuam ativados.';

  @override
  String get dangerZone => 'Zona de perigo';

  @override
  String get quotasHelp => 'Deixe um campo vazio para não definir limite.';

  @override
  String get serviceOff => 'Desligado';

  @override
  String get serviceDown => 'Fora do ar';

  @override
  String get serviceOk => 'OK';

  @override
  String get sendInvite => 'Enviar convite';

  @override
  String get thinking0 => 'Modelo';

  @override
  String get saveChanges => 'Salvar alterações';

  @override
  String get autonomyAskAlwaysHelp =>
      'Confirma com você antes de qualquer ação que altere algo.';

  @override
  String get autonomyAskRiskyHelp =>
      'Trabalha por conta própria, mas pergunta antes de qualquer coisa arriscada, como excluir arquivos ou gastar dinheiro.';

  @override
  String get autonomyAutonomousHelp =>
      'Age sem perguntar. Melhor para rotinas em que você confia.';

  @override
  String get usageSubtitle => 'Gasto com modelos neste mês';

  @override
  String get skillsRowHelp =>
      'Instruções que os bots carregam quando uma tarefa precisa';

  @override
  String get integrationsRowHelp => 'Servidores MCP e apps conectados';

  @override
  String get secretsRowHelp =>
      'Tokens e senhas, enviados apenas onde você permitir';

  @override
  String get computersRowHelp => 'O computador da equipe e os privados';

  @override
  String get companionRowHelp =>
      'Permite que os bots usem apps e arquivos deste dispositivo';

  @override
  String get privacyRowHelp => 'Exporte seus dados ou exclua sua conta';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Nenhuma integração ainda';

  @override
  String get integrationsHelp =>
      'As integrações dão mais ferramentas aos bots: um servidor MCP, uma fonte OpenAPI, Composio ou Pipedream. Cada ferramenta leva o nome da sua integração.';

  @override
  String get botIntegrationsHelp =>
      'Ative as integrações que este bot pode usar. As ferramentas aparecem na próxima vez que ele rodar.';

  @override
  String get openSettings => 'Abrir Configurações';

  @override
  String get noRunsHelp =>
      'Cada vez que este bot trabalha, a partir de um chat, uma rotina ou um webhook, a execução aparece aqui com o que ele fez e quanto custou.';

  @override
  String get runCompleted => 'Concluído';

  @override
  String get runWaiting => 'Aguardando';

  @override
  String get runWorking => 'Trabalhando';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Rotina';

  @override
  String get noEventsForFilter => 'Nada desse tipo nesta execução.';

  @override
  String get runStatusFailed => 'Falhou';

  @override
  String get runStatusStopped => 'Interrompido';

  @override
  String get quickAskIntro =>
      'Envie um pedido rápido. Ele inicia um novo chat com o bot que você escolher.';

  @override
  String quickAskIntroBot(String name) {
    return 'Envie um pedido rápido. Ele inicia um novo chat com $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return 'O que $bot deve fazer?';
  }

  @override
  String get stateProvisioning => 'Configurando';

  @override
  String get stateStarting => 'Iniciando';

  @override
  String get computerRestoringFiles => 'Restaurando arquivos…';

  @override
  String get stateRunning => 'Em execução';

  @override
  String get stateIdle => 'Inativo';

  @override
  String get stateSleeping => 'Em repouso';

  @override
  String get stateStopped => 'Parado';

  @override
  String get stateError => 'Erro';

  @override
  String get terminalHelp =>
      'Um terminal neste computador. Os bots usam o mesmo, para que você possa ver e corrigir o que fizeram.';

  @override
  String get up => 'Subir';

  @override
  String get emptyFolderHelp =>
      'Arquivos que seus bots criam e arquivos que você envia aparecem aqui.';

  @override
  String deleteFileTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String get botComputerAuto => 'Automático';

  @override
  String get botComputerHelp =>
      'O próprio computador do bot: onde ele executa comandos, navega e guarda os arquivos dele.';

  @override
  String get billingOffTitle => 'Sem cobrança aqui';

  @override
  String revokeKeyTitle(String name) {
    return 'Revogar a chave de $name?';
  }

  @override
  String get revokeKeyBody =>
      'Esse servidor para de usar computadores na nuvem e créditos imediatamente.';

  @override
  String get handBackHelp =>
      'O bot continua de onde você parou. Diga a ele o que você fez, se ajudar.';

  @override
  String get serverHelp =>
      'Use seu próprio servidor Casama. Digite o endereço que você ou seu admin configuraram.';

  @override
  String get ssoHelp =>
      'Digite seu e-mail corporativo e vamos levar você à página de acesso da sua empresa.';

  @override
  String get colorScheme => 'Esquema de cores';

  @override
  String get searchThemes => 'Buscar esquemas';

  @override
  String get noThemesFound => 'Nenhum esquema corresponde.';

  @override
  String get noAppsMatch =>
      'Nenhum app corresponde. Você pode adicionar seu próprio servidor em Avançado.';

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
  String get familyAll => 'Todos';

  @override
  String get familyPurple => 'Roxo';

  @override
  String get familyBlue => 'Azul';

  @override
  String get familyTeal => 'Turquesa';

  @override
  String get familyGreen => 'Verde';

  @override
  String get familyWarm => 'Quente';

  @override
  String get familyRed => 'Vermelho e rosa';

  @override
  String get familyNeutral => 'Neutro';

  @override
  String get background => 'Plano de fundo';

  @override
  String get backgroundPattern => 'Padrão';

  @override
  String get backgroundColors => 'Cores';

  @override
  String get backgroundThemeColors => 'Tema';

  @override
  String get patternStrength => 'Intensidade do padrão';

  @override
  String get wallpaperEverywhere => 'Mostrar em todas as telas';

  @override
  String get wallpaperEverywhereHelp =>
      'Desative para manter apenas atrás dos chats.';

  @override
  String get resetBackground => 'Restaurar padrão';

  @override
  String get copyMessage => 'Copiar';

  @override
  String get selectText => 'Selecionar texto';

  @override
  String get shareMessage => 'Compartilhar';

  @override
  String get messageCopied => 'Copiado';

  @override
  String get botUiBroken => 'Não foi possível exibir esta parte da resposta.';

  @override
  String get botUiSent => 'Enviado';

  @override
  String get botUiConnected => 'Conectado';

  @override
  String get draftNewEmail => 'Novo e-mail';

  @override
  String get draftNewMessage => 'Nova mensagem';

  @override
  String get draftNewPost => 'Nova publicação';

  @override
  String get draftReadyToSend => 'Pronto para enviar';

  @override
  String get draftReadyToPost => 'Pronto para publicar';

  @override
  String get draftEdited => 'Editado';

  @override
  String get draftSendEmail => 'Enviar e-mail';

  @override
  String get draftSend => 'Enviar';

  @override
  String get draftPost => 'Publicar';

  @override
  String get draftDiscard => 'Descartar';

  @override
  String get draftEdit => 'Editar';

  @override
  String get draftDoneEditing => 'Concluído';

  @override
  String get draftFrom => 'De';

  @override
  String get draftTo => 'Para';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Cco';

  @override
  String get draftSubject => 'Assunto';

  @override
  String get botCardNewEvent => 'Novo evento';

  @override
  String get botCardEvent => 'Evento';

  @override
  String get botCardReadyToAdd => 'Pronto para adicionar';

  @override
  String get botCardAddToCalendar => 'Adicionar à agenda';

  @override
  String get botCardChange => 'Alterar';

  @override
  String get botCardSkip => 'Pular';

  @override
  String get botCardAllDay => 'Dia inteiro';

  @override
  String botCardMore(int count) {
    return '+$count mais';
  }

  @override
  String get botCardAgenda => 'Agenda';

  @override
  String get botCardMessages => 'Mensagens';

  @override
  String botCardUnread(int count) {
    return '$count não lidas';
  }

  @override
  String get botCardReply => 'Responder';

  @override
  String botCardReplyTo(String name) {
    return 'Responder a $name';
  }

  @override
  String get botCardTasks => 'Tarefas';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done de $total concluídas';
  }

  @override
  String get botCardSaveChanges => 'Salvar alterações';

  @override
  String get botCardChoose => 'Escolher';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Quem você quer dizer?';

  @override
  String get botCardNoneOfThese => 'Nenhum destes';

  @override
  String get botCardReminder => 'Lembrete';

  @override
  String get botCardRoutine => 'Rotina';

  @override
  String get botCardWatcher => 'Monitorando';

  @override
  String get botCardScheduled => 'Agendado';

  @override
  String botCardNext(String when) {
    return 'Próxima: $when';
  }

  @override
  String get botCardCancelIt => 'Cancelar';

  @override
  String get botIcon => 'Ícone';

  @override
  String get botIconInitials => 'Iniciais';

  @override
  String get errorDetailsTitle => 'O que deu errado';

  @override
  String get exportLabel => 'Exportar';

  @override
  String get openTimeline => 'Abrir linha do tempo de execuções';

  @override
  String get details => 'Detalhes';

  @override
  String get themes => 'Temas';

  @override
  String get myThemes => 'Seus temas';

  @override
  String get saveTheme => 'Salvar tema atual';

  @override
  String get themeName => 'Nome do tema';

  @override
  String get importTheme => 'Importar tema';

  @override
  String get themeCode => 'Código do tema';

  @override
  String get themeCodeHelp =>
      'Cole um código que alguém compartilhou com você. Ele começa com casama-theme:';

  @override
  String get invalidThemeCode => 'Esse não é um código de tema do Casama.';

  @override
  String themeImported(String name) {
    return '$name adicionado aos seus temas';
  }

  @override
  String get themeCodeCopied =>
      'Código do tema copiado. Qualquer pessoa pode colar em Aparência → Importar tema.';

  @override
  String get shareTheme => 'Compartilhar código';

  @override
  String deleteThemeTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String get fonts => 'Fontes';

  @override
  String get headingFont => 'Títulos';

  @override
  String get bodyFont => 'Texto';

  @override
  String get fontsHelp =>
      'Google Sans e Noto Serif vêm com o app e funcionam offline. Outras fontes do Google são baixadas na primeira vez que você as escolhe.';

  @override
  String get searchFonts => 'Buscar no Google Fonts';

  @override
  String get suggestedFonts => 'Sugeridas';

  @override
  String get allFonts => 'Todas as fontes do Google';

  @override
  String get noFontsFound => 'Nenhuma fonte com esse nome';

  @override
  String get resetFonts => 'Usar padrões';

  @override
  String get fontSample => 'Seus bots, trabalhando junto com você.';

  @override
  String get backgroundPhoto => 'Foto';

  @override
  String get yourPhoto => 'Sua foto';

  @override
  String get browsePhotos => 'Explorar fotos';

  @override
  String get removePhoto => 'Remover foto';

  @override
  String get photoBlur => 'Desfoque';

  @override
  String get photoDim => 'Escurecer';

  @override
  String photoBy(String name) {
    return 'Foto de $name no Unsplash';
  }

  @override
  String get searchPhotos => 'Buscar fotos';

  @override
  String get photosUnavailable => 'Não foi possível carregar as fotos.';

  @override
  String get noPhotos => 'Nenhuma foto encontrada';

  @override
  String get photoHelp =>
      'A foto fica sob os desenhos. Desfoque e escurecimento mantêm o texto legível por cima.';

  @override
  String get periodToday => 'Hoje';

  @override
  String get periodWeek => 'Esta semana';

  @override
  String get periodYear => 'Este ano';

  @override
  String get totalSpend => 'Gasto';

  @override
  String get tokensIn => 'Tokens de entrada';

  @override
  String get tokensOut => 'Tokens de saída';

  @override
  String get runsLabel => 'Execuções';

  @override
  String get spendByDay => 'Gasto por dia';

  @override
  String get byBot => 'Por bot';

  @override
  String get byModel => 'Por modelo';

  @override
  String get everythingMetered => 'Tudo medido';

  @override
  String get bySource => 'Por origem';

  @override
  String get byPerson => 'Por pessoa';

  @override
  String get usageAllBots => 'Todos os bots';

  @override
  String get usageAllModels => 'Todos os modelos';

  @override
  String get usageAllSources => 'Todas as origens';

  @override
  String get usageEveryone => 'Todos';

  @override
  String get usageJustMe => 'Apenas eu';

  @override
  String get usageClearFilters => 'Limpar';

  @override
  String get usageFilterBot => 'Filtrar por bot';

  @override
  String get usageFilterModel => 'Filtrar por modelo';

  @override
  String get usageFilterSource => 'Filtrar por origem';

  @override
  String get usageFilterPerson => 'Filtrar por pessoa';

  @override
  String get usageSourceChat => 'Chats';

  @override
  String get usageSourceChatApp => 'Apps de chat';

  @override
  String get usageSourceRoutine => 'Rotinas';

  @override
  String get usageSourceApi => 'API e outros agentes';

  @override
  String get usageSourceOther => 'Outro';

  @override
  String get usageNoPerson => 'Automático';

  @override
  String get usageUnnamedPerson => 'Membro sem nome';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n execuções',
      one: '$n execução',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Exportar CSV';

  @override
  String get exportJson => 'Exportar JSON';

  @override
  String get askBotAboutUsage => 'Perguntar a um bot sobre isto';

  @override
  String get noUsageYet => 'Nenhum uso neste período ainda.';

  @override
  String get otherModel => 'Computadores e outros';

  @override
  String get deletedBot => 'Sem vínculo com um bot';

  @override
  String get usageHelp =>
      'Os custos são estimativas com base na contagem de tokens e nos preços publicados. A fatura do seu provedor de modelos é a palavra final.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Aqui está meu uso do Casama para $period. Me ajude a entender para onde vai o dinheiro e como eu poderia gastar menos. Você também pode conferir os números ao vivo com sua ferramenta de uso.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Entrada do modelo';

  @override
  String get kindTokensOut => 'Saída do modelo';

  @override
  String get kindComputer => 'Tempo de computador na nuvem';

  @override
  String get kindModels => 'Modelos de IA';

  @override
  String get creditsThisMonth => 'Créditos deste mês';

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
      other: 'Cerca de mais $nString execuções no seu custo habitual',
      one: 'Cerca de mais $nString execução no seu custo habitual',
      zero: 'Menos de mais uma execução no seu custo habitual',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Seus créditos acabaram. Adicione mais para manter seus bots funcionando.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 crédito = $price. Seu plano adiciona $amount todo mês; os créditos não usados valem por mais um mês.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 crédito = $price. Os pacotes de créditos da App Store ou do Google Play nunca expiram; pacotes de créditos comprados na web duram 12 meses.';
  }

  @override
  String get creditsDailyLabel => 'Limite de hoje';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used de $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'O que seu plano pode gastar por dia nos modelos, voz e apps do Casama, independentemente dos créditos restantes.';

  @override
  String get creditsDailyReached =>
      'O limite de hoje foi atingido, então seus bots estão pausados. Faça upgrade para ter um limite diário maior.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Reinicia em cerca de $n horas.',
      one: 'Reinicia em cerca de $n hora.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Reinicia em menos de uma hora.';

  @override
  String get creditsHoursLabel => 'Horas de computador';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used de $limit h';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Tempo em que os computadores dos seus bots rodam neste mês. Quando acaba, o chat continua funcionando; apenas o computador para. Reinicia em $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'As horas de computador deste mês acabaram, então seu computador não pode iniciar. O chat ainda funciona. Reinicia em $date. Faça upgrade para ter mais horas.';
  }

  @override
  String get kindStream => 'Visualização ao vivo';

  @override
  String get kindTts => 'Ler em voz alta';

  @override
  String get computerMissingTitle => 'Computador não encontrado';

  @override
  String get computerMissingHelp =>
      'Ele pode ter sido removido ou a lista está desatualizada. Atualize para verificar novamente.';

  @override
  String get computerMissingBotHelp =>
      'O computador deste bot pode ter sido removido ou a lista está desatualizada. Atualize ou escolha outro computador para este bot.';

  @override
  String get computerChoose => 'Escolher computador';

  @override
  String get personaWork => 'Trabalho';

  @override
  String get personaResearch => 'Pesquisa';

  @override
  String get personaBuild => 'Desenvolvimento';

  @override
  String get personaCreate => 'Criação';

  @override
  String get personaLife => 'Vida';

  @override
  String get personaOther => 'Outro';

  @override
  String get blankBotHelp =>
      'Comece do zero e escreva suas próprias instruções.';

  @override
  String get browse => 'Explorar';

  @override
  String get browseAllPersonas => 'Ver tudo';

  @override
  String get botIdentity => 'Nome e ícone';

  @override
  String get serviceKeys => 'Chaves de serviço';

  @override
  String get noServiceKeys => 'Nenhuma chave de serviço ainda.';

  @override
  String get serviceKeysHelp => 'Suas próprias chaves de busca, mapas ou dados';

  @override
  String get serviceKeysIntro =>
      'O Casama executa os modelos, a voz e as imagens para você. Adicione uma chave aqui apenas para usar seu próprio serviço de busca, mapas ou dados. As chaves ficam criptografadas e nunca mais são exibidas.';

  @override
  String get choosePersona => 'Escolha uma persona';

  @override
  String get choosePersonaHelp =>
      'Cada uma vem com instruções, um visual e, às vezes, habilidades e rotinas. Você pode alterar qualquer coisa depois.';

  @override
  String get searchPersonas => 'Buscar personas';

  @override
  String get noPersonasFound => 'Nenhuma persona corresponde a isso';

  @override
  String get previewPersona => 'Prévia';

  @override
  String get personaInstructions => 'Instruções';

  @override
  String get personaTryAsking => 'Experimente perguntar';

  @override
  String usePersona(String name) {
    return 'Usar $name';
  }

  @override
  String get loadPersona => 'Carregar uma persona';

  @override
  String get replaceInstructionsTitle => 'Substituir as instruções?';

  @override
  String replaceInstructionsBody(String name) {
    return 'As instruções atuais do bot serão substituídas pelas de $name. Habilidades e rotinas ficam como estão.';
  }

  @override
  String get replace => 'Substituir';

  @override
  String get appsTitle => 'Apps';

  @override
  String get appsSubtitle =>
      'Dê aos seus bots as ferramentas que sua equipe já usa.';

  @override
  String get connectedTab => 'Conectados';

  @override
  String get browseTab => 'Explorar';

  @override
  String get searchApps => 'Buscar apps';

  @override
  String get popularApps => 'Populares';

  @override
  String get allApps => 'Todos os apps';

  @override
  String get appCatDeveloper => 'Desenvolvimento';

  @override
  String get appCatProductivity => 'Produtividade';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Pagamentos';

  @override
  String get appCatDesign => 'Design';

  @override
  String get appCatSales => 'Vendas e suporte';

  @override
  String get appCatData => 'Dados e busca';

  @override
  String get appCatAutomation => 'Automação';

  @override
  String get authOneClick => 'Um clique';

  @override
  String get authApiKey => 'Chave de API';

  @override
  String get authNone => 'Sem login';

  @override
  String get authAdminSetup => 'Precisa configurar';

  @override
  String get connectedBadge => 'Conectado';

  @override
  String get whatBotsCanDo => 'O que seus bots podem fazer';

  @override
  String continueWith(String app) {
    return 'Continuar com $app';
  }

  @override
  String get signInTab => 'Entrar';

  @override
  String get connectNoSignIn => 'Este app funciona sem login.';

  @override
  String finishSignIn(String app) {
    return 'Conclua o login em $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app abriu no seu navegador. Aprove o acesso lá e esta tela se atualiza sozinha.';
  }

  @override
  String get reopenSignIn => 'Abrir página de login de novo';

  @override
  String appConnected(String app) {
    return '$app está conectado';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app já está conectado neste espaço de trabalho. Use essa conexão ou adicione outra conta.';
  }

  @override
  String get useConnection => 'Usar esta';

  @override
  String get addAnotherAccount => 'Adicionar outra conta';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ferramentas prontas para seus bots.',
      one: '$countString ferramenta pronta para seus bots.',
      zero: 'Pronto para usar.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Quais bots podem usar?';

  @override
  String get whichBotsHelp =>
      'Os bots ainda perguntam antes de qualquer coisa arriscada.';

  @override
  String get doneLabel => 'Concluído';

  @override
  String openApp(String app) {
    return 'Abrir $app';
  }

  @override
  String get pasteLabel => 'Colar';

  @override
  String get connectingLabel => 'Conectando…';

  @override
  String get connectFailedTitle => 'Não foi possível conectar';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Ou conecte $app por um destes. Entre uma vez e peça ao seu bot para usar $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'O login fica armazenado criptografado e nunca mais é exibido. Desconecte quando quiser.';

  @override
  String get composioHelp =>
      'Centenas de apps, com o login resolvido para você.';

  @override
  String get pipedreamHelp => 'Milhares de apps pelo Pipedream Connect.';

  @override
  String get customServer => 'Servidor personalizado';

  @override
  String get customServerHelp =>
      'Qualquer servidor MCP ou especificação OpenAPI. Para desenvolvedores.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usado por $countString bots',
      one: 'Usado por $countString bot',
      zero: 'Ainda não liberado para nenhum bot',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Pronto';

  @override
  String get statusNeedsAttention => 'Precisa de atenção';

  @override
  String get statusChecking => 'Verificando';

  @override
  String get toolsHelp =>
      'Ferramentas somente leitura rodam por conta própria. Ferramentas que fazem alterações perguntam antes quando um bot leu algo não confiável, e as marcadas como “Sempre pergunta” esperam por você todas as vezes.';

  @override
  String get botsWithAccess => 'Bots com acesso';

  @override
  String get reconnect => 'Reconectar';

  @override
  String get disconnect => 'Desconectar';

  @override
  String disconnectTitle(String app) {
    return 'Desconectar $app?';
  }

  @override
  String get disconnectBody =>
      'Os bots perdem as ferramentas dele na hora e o login salvo é excluído.';

  @override
  String get testConnection => 'Testar conexão';

  @override
  String get signedInOAuth => 'Conectado com sua conta';

  @override
  String get signedInKey => 'Conectado com uma chave de API';

  @override
  String get signedInNone => 'Não precisa de login';

  @override
  String get noConnectionsTitle => 'Conecte seu primeiro app';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail e muito mais. A maioria leva um clique.';

  @override
  String get browseApps => 'Explorar apps';

  @override
  String providerSetupTitle(String provider) {
    return 'Conectar $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider entra nos apps para você, assim você nunca lida com as chaves deles.';
  }

  @override
  String get getFreeKey => 'Obter chave gratuita';

  @override
  String connectedThroughHub(String provider) {
    return 'Pelo $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Apps pelo $provider';
  }

  @override
  String get addAnApp => 'Adicionar um app';

  @override
  String searchProviderApps(String provider) {
    return 'Buscar apps de $provider';
  }

  @override
  String get accountConnected => 'Conectado';

  @override
  String get accountPending => 'Aguardando login';

  @override
  String get accountError => 'Problema no login';

  @override
  String get providerReconnectHint =>
      'Entre diretamente pelo Casama para ter custos menores por chamada de app';

  @override
  String get noProviderAccounts =>
      'Nenhum app ainda. Adicione um e entre nele.';

  @override
  String get projectId => 'ID do projeto';

  @override
  String get toolRiskLow => 'Somente leitura';

  @override
  String get toolRiskMedium => 'Faz alterações';

  @override
  String get toolRiskHigh => 'Sempre pergunta';

  @override
  String get askWhichBot => 'Qual bot deve olhar isso?';

  @override
  String get computerWake => 'Despertar';

  @override
  String get computerAsleepTitle => 'O computador está em repouso';

  @override
  String get computerAsleepFilesHelp =>
      'Desperte-o para ver e enviar arquivos.';

  @override
  String get computerFilesTimedOut =>
      'Os arquivos demoraram demais para carregar. Verifique se o computador está ligado e tente novamente.';

  @override
  String get computerGoingToSleep => 'Entrando em repouso';

  @override
  String get liveViewWakesHelp =>
      'Este computador está em repouso. Abrir a visualização ao vivo o desperta; ele volta a repousar após um tempo sem uso.';

  @override
  String get wakeAndWatch => 'Despertar e assistir ao vivo';

  @override
  String get chatGptPlan => 'Plano do ChatGPT';

  @override
  String get continueWithChatGpt => 'Continuar com ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Execute seus bots com seu plano do ChatGPT em vez de uma chave de API. As chamadas de modelo contam nos limites do seu plano e só você pode usar.';

  @override
  String get chatGptDesktopOnly =>
      'Para conectar seu plano do ChatGPT, abra o app para computador ou execute “casama credential chatgpt” na CLI.';

  @override
  String get chatGptWaiting => 'Conclua o login com ChatGPT no navegador…';

  @override
  String chatGptConnected(String account) {
    return 'Plano do ChatGPT conectado ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Você entrou, mas o uso do plano não foi permitido. Reconecte e permita, ou adicione uma chave de API.';

  @override
  String get orAddApiKey => 'Ou adicione uma chave de API';

  @override
  String get planOnlyYou => 'Só você pode usar';

  @override
  String get planOtherMember => 'Plano de outro membro';

  @override
  String get planConnected => 'Conectado';

  @override
  String get planUsageOff => 'Uso do plano desativado';

  @override
  String get planNeedsReconnect => 'Entrar novamente';

  @override
  String get useNextModelAtLimit =>
      'Usar o próximo modelo do bot no limite do meu plano';

  @override
  String get useNextModelAtLimitHelp =>
      'Desativado: a execução para quando seu limite do ChatGPT é atingido. Ativado: continua no próximo modelo do bot, o que pode gerar custos.';

  @override
  String get manageUsage => 'Gerenciar uso';

  @override
  String get removeKey => 'Remover';

  @override
  String removeKeyConfirm(String label) {
    return 'Remover $label? Os bots que o usam param de funcionar até você dar outra chave.';
  }

  @override
  String get removeKeyChatGptNote => 'Seu login do ChatGPT também é revogado.';

  @override
  String modelFallbackNotice(String message) {
    return 'Mudou para o próximo modelo: $message';
  }

  @override
  String get twoStepSignIn => 'Login em duas etapas';

  @override
  String get twoStepHelp =>
      'Pede um código de um app autenticador sempre que você entrar.';

  @override
  String get signInWithPasskey => 'Entrar com chave de acesso';

  @override
  String get account => 'Conta';

  @override
  String get accountRow => 'E-mail, senha e sair de todos os lugares';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get newPassword => 'Nova senha';

  @override
  String get newPasswordAgain => 'Nova senha novamente';

  @override
  String get passwordsDontMatch => 'As senhas não coincidem';

  @override
  String get newPasswordTitle => 'Escolha uma nova senha';

  @override
  String get newPasswordBody =>
      'Você entrou. Escolha uma nova senha para entrar com seu e-mail.';

  @override
  String get savePassword => 'Salvar senha';

  @override
  String get passwordSaved => 'Senha salva.';

  @override
  String get passwordTitle => 'Senha';

  @override
  String get passwordRow =>
      'Defina ou altere a senha para entrar com seu e-mail';

  @override
  String get passwordHelp =>
      'Use pelo menos 6 caracteres. Você ainda pode entrar com Google, Apple, chave de acesso ou link por e-mail.';

  @override
  String passwordCodeSent(String email) {
    return 'Para manter sua conta segura, digite o código que acabamos de enviar para $email.';
  }

  @override
  String get changeEmailTitle => 'Alterar e-mail';

  @override
  String get changeEmailHelp =>
      'Enviaremos um link de confirmação para o seu endereço atual e para o novo. A alteração acontece quando ambos forem confirmados.';

  @override
  String get newEmail => 'Novo e-mail';

  @override
  String get changeEmailSend => 'Enviar confirmação';

  @override
  String get changeEmailRow => 'Altere o e-mail que você usa para entrar';

  @override
  String changeEmailSent(String email) {
    return 'Confira as duas caixas de entrada. $email passa a ser seu e-mail quando os dois links forem confirmados.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Aguardando confirmação: $email';
  }

  @override
  String get signOutEverywhere => 'Sair de todos os lugares';

  @override
  String get signOutEverywhereHelp =>
      'Todos os celulares, computadores e navegadores, incluindo este';

  @override
  String get signOutEverywhereConfirm =>
      'Sair em todos os dispositivos, incluindo este? Use isto se perdeu um dispositivo ou acha que outra pessoa está conectada.';

  @override
  String get passkeySuggestTitle => 'Entrar mais rápido na próxima vez?';

  @override
  String get passkeySuggestBody =>
      'Adicione uma chave de acesso e entre com Face ID, impressão digital ou o bloqueio de tela. Sem precisar de senha ou e-mail.';

  @override
  String get passkeys => 'Chaves de acesso';

  @override
  String get passkeysRow =>
      'Entre com Face ID, impressão digital ou seu bloqueio de tela';

  @override
  String get passkeysHelp =>
      'Uma chave de acesso conecta você com Face ID, impressão digital ou bloqueio de tela, sem senha ou e-mail. Cada celular, computador ou gerenciador de senhas guarda a própria.';

  @override
  String get passkeyAdd => 'Adicionar chave de acesso';

  @override
  String get passkeyAddAnother => 'Adicionar outra chave de acesso';

  @override
  String get passkeyAdded =>
      'Chave de acesso adicionada. Na próxima vez, entre com ela.';

  @override
  String get passkeyRename => 'Renomear';

  @override
  String get passkeyRenameTitle => 'Renomear chave de acesso';

  @override
  String get passkeyNameLabel => 'Nome';

  @override
  String get passkeyRemove => 'Remover';

  @override
  String passkeyRemoveConfirm(String name) {
    return 'Remover “$name”? Você não poderá mais entrar com ela.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Adicionada $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Último uso $when';
  }

  @override
  String get twoStepSetUp => 'Configurar app autenticador';

  @override
  String get twoStepAddAnother => 'Adicionar outro autenticador';

  @override
  String get twoStepScan =>
      'Escaneie este código com um app autenticador (como 1Password, Google Authenticator ou Authy) ou digite a chave de configuração e depois informe o código de 6 dígitos exibido.';

  @override
  String get twoStepKey => 'Chave de configuração';

  @override
  String get twoStepCode => 'Código de 6 dígitos';

  @override
  String get twoStepVerify => 'Verificar';

  @override
  String get twoStepNowOn => 'O login em duas etapas está ativado.';

  @override
  String get twoStepAuthenticators => 'Apps autenticadores';

  @override
  String get twoStepRename => 'Renomear';

  @override
  String get twoStepRenameTitle => 'Renomear autenticador';

  @override
  String get twoStepNameLabel => 'Nome';

  @override
  String get twoStepNameHint => 'Por exemplo: Celular do trabalho';

  @override
  String get twoStepRemove => 'Remover';

  @override
  String get twoStepRemoveConfirm =>
      'Remover este app autenticador? Se for o único, você entrará apenas com sua senha.';

  @override
  String get twoStepPromptTitle => 'Digite seu código';

  @override
  String get twoStepPromptBody =>
      'Abra seu app autenticador e digite o código de 6 dígitos para concluir o login.';

  @override
  String get twoStepPromptAccount => 'Entrando como';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Nova senha para';

  @override
  String get connectAiAppAccount => 'Ele ganha acesso a';

  @override
  String joinAsAccount(String email, String server) {
    return 'Você entrará como $email em $server.';
  }

  @override
  String get requireTwoStep =>
      'Exigir login em duas etapas para proprietários e admins';

  @override
  String get requireTwoStepHelp =>
      'Proprietários e admins precisam usá-lo. Ative o seu primeiro.';

  @override
  String get twoStepNeededForAdmin =>
      'Este espaço de trabalho exige login em duas etapas para proprietários e admins. Configure-o ou entre novamente com seu código para usar as configurações de admin.';

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
  String get unsuspendWorkspace => 'Remover suspensão';

  @override
  String get suspendReason => 'Motivo';

  @override
  String get suspendWorkspaceHelp =>
      'Os computadores param e os bots deixam de rodar. Nada é excluído, e você pode remover a suspensão a qualquer momento.';

  @override
  String workspaceSuspended(String reason) {
    return 'Suspenso: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Este espaço de trabalho está suspenso, então os bots não rodam e os computadores não iniciam. Fale com quem administra este servidor.';

  @override
  String get abuseKind_mining_pool => 'Mineração de cripto bloqueada';

  @override
  String get abuseKind_blocked_port => 'Porta de e-mail bloqueada';

  @override
  String get abuseKind_egress_flood => 'Excesso de tráfego';

  @override
  String get abuseKind_signup_blocked => 'Cadastro recusado';

  @override
  String get abuseKind_suspended => 'Espaço de trabalho suspenso';

  @override
  String get abuseKind_unsuspended => 'Suspensão removida';

  @override
  String get kindLocalMcp => 'Em um computador';

  @override
  String get capMcp => 'Ferramentas locais (MCP)';

  @override
  String get localMcpServers => 'Ferramentas locais (MCP)';

  @override
  String get localMcpHelp =>
      'Servidores MCP neste computador ou na sua rede que seus bots podem usar, como T3 Code, Claude Code, Codex ou apps de design. Os tokens e logins ficam neste computador.';

  @override
  String get localMcpAdd => 'Adicionar servidor MCP local';

  @override
  String get localMcpEmpty => 'Nenhum servidor MCP local ainda.';

  @override
  String get localMcpName => 'Nome';

  @override
  String get localMcpStdio => 'Um comando';

  @override
  String get localMcpLoopback => 'Um endereço';

  @override
  String get localMcpCommand => 'Comando';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Endereço';

  @override
  String get localMcpFolder => 'Pasta de trabalho (opcional)';

  @override
  String get localMcpEnv =>
      'Ambiente (um KEY=value por linha, mantido neste computador)';

  @override
  String get localMcpNeedsCapability =>
      'Ative Ferramentas locais (MCP) acima para que os bots possam usá-las.';

  @override
  String get localMcpBadUrl =>
      'Use um endereço http:// neste computador ou na sua rede, como http://127.0.0.1:3845/mcp, ou um endereço https://.';

  @override
  String get localMcpBadFolder =>
      'Escolha uma pasta dentro de uma das pastas compartilhadas.';

  @override
  String get codingAgents => 'Agentes de código';

  @override
  String get codingAgentsHelp =>
      'Os bots podem passar tarefas de programação para estes agentes neste computador. Eles usam seus próprios logins e trabalham nas pastas que você compartilhar.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString agentes de código encontrados',
      one: '$nString agente de código encontrado',
      zero: 'Nenhum agente de código encontrado',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Este servidor ainda não foi salvo no espaço de trabalho. Remova-o e adicione novamente.';

  @override
  String get localMcpSignInKind => 'Login';

  @override
  String get localMcpAuthNone => 'Nenhum';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Cabeçalho';

  @override
  String get localMcpAuthOAuth => 'Navegador';

  @override
  String get localMcpToken => 'Token (mantido neste computador)';

  @override
  String get localMcpHeaderName => 'Nome do cabeçalho';

  @override
  String get localMcpHeaderValue =>
      'Valor do cabeçalho (mantido neste computador)';

  @override
  String get localMcpOAuthHelp =>
      'O Casama abre seu navegador para você entrar neste servidor. O login fica neste computador.';

  @override
  String get localMcpNetworkWarning =>
      'Este servidor não está neste computador. Os bots que podem usar este computador conseguem alcançá-lo.';

  @override
  String get localMcpSignIn => 'Entrar';

  @override
  String get localMcpNeedsSignIn => 'Precisa entrar';

  @override
  String get localMcpEdit => 'Editar servidor MCP local';

  @override
  String get localMcpImport => 'Adicionar de outros apps';

  @override
  String get localMcpImportHelp =>
      'Servidores MCP já configurados no T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex ou Windsurf neste computador.';

  @override
  String get localMcpImportNone =>
      'Nenhum servidor MCP encontrado em outros apps neste computador.';

  @override
  String get localMcpImportAdded => 'Já adicionado';

  @override
  String get localMcpImportRemote =>
      'Na internet, então normalmente adicionado em Conexões. Adicione aqui apenas se só este computador puder alcançá-lo.';

  @override
  String get mcpQuestionDecline => 'Recusar';

  @override
  String get mcpQuestionSend => 'Enviar';

  @override
  String get cardMcpQuestion => 'Pergunta';

  @override
  String get cardMcpSignIn => 'Login';

  @override
  String get mcpSignInHereHelp =>
      'Entre para que seus bots possam usar novamente.';

  @override
  String localMcpSignedIn(String name) {
    return 'Conectado a $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'De $source';
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
      other: 'Adicionar $nString servidores',
      one: 'Adicionar $nString servidor',
      zero: 'Adicionar',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (mantido neste computador)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name precisa que você entre';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Abra o Casama em $device e entre por lá.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Abra o Casama no computador em que esta ferramenta roda e entre por lá.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection pergunta';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return '$connection respondido';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Pergunta de $connection recusada';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Pergunta de $connection encerrada';
  }

  @override
  String get codingAgentsNone =>
      'Nenhum agente de código encontrado. Instale o Claude Code, o Codex ou o agente de linha de comando do Cursor para passar tarefas de programação.';

  @override
  String get codingAgentsNeedShell =>
      'Agentes de código rodam como comandos, então precisam de Executar comandos ativado.';

  @override
  String get allowCommands => 'Ativar';

  @override
  String get codingAgentAllow => 'Permitir';

  @override
  String get codingAgentAllowed => 'Permitido';

  @override
  String get codingAgentsAllowHelp =>
      'Um agente com Permitir ao lado ainda não rodou neste computador. Permita uma vez e os bots poderão passar tarefas a ele.';

  @override
  String get ownAgentsAdd => 'Adicionar o seu';

  @override
  String get ownAgentYours => 'Seu';

  @override
  String get ownAgentNotFound => 'Não encontrado neste computador';

  @override
  String get ownAgentsHelp =>
      'Seus próprios agentes rodam apenas neste computador, em chats que agem para você. Ninguém mais no espaço de trabalho pode vê-los ou alterá-los.';

  @override
  String get ownAgentFormTitle => 'Adicionar seu próprio agente';

  @override
  String get ownAgentEditTitle => 'Editar seu agente';

  @override
  String get ownAgentName => 'Nome';

  @override
  String get ownAgentBin => 'Nome do comando';

  @override
  String get ownAgentCommand => 'Comando';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Coloque $task onde vai a tarefa; o Casama coloca aspas automaticamente. Todo comando começa com o nome do comando. Você também pode usar $folder e $result_file quando o agente escreve a resposta em um arquivo.';
  }

  @override
  String get ownAgentResult => 'Lendo a resposta';

  @override
  String get ownAgentResultTail => 'O final da saída dele';

  @override
  String get ownAgentResultJson => 'Uma linha JSON com um campo result';

  @override
  String get ownAgentResultStream => 'Um fluxo de linhas JSON';

  @override
  String get ownAgentResultField => 'Um campo JSON';

  @override
  String get ownAgentResultFile => 'Escrito em um arquivo';

  @override
  String get ownAgentResultFieldName => 'Nome do campo';

  @override
  String get ownAgentTimeLimit => 'Limite de tempo (minutos)';

  @override
  String get ownAgentTest => 'Testar';

  @override
  String get ownAgentTestHelp =>
      'O teste pede para ele responder apenas com a palavra pong neste computador e mostra o que foi impresso.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Ele respondeu: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Não respondeu como esperado (código $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Não terminou a tempo.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Preencha um nome, um nome de comando e um comando com $task.';
  }

  @override
  String get board => 'Quadro';

  @override
  String get newTicket => 'Novo ticket';

  @override
  String get newTicketSubtitle =>
      'Uma tarefa para um dos seus bots, acompanhada no quadro.';

  @override
  String get allProjects => 'Todos os projetos';

  @override
  String get manageProjects => 'Gerenciar projetos';

  @override
  String get filterByProject => 'Filtrar por projeto';

  @override
  String get moveTo => 'Mover para';

  @override
  String get noMatchingTickets => 'Nenhum ticket correspondente';

  @override
  String get noMatchingTicketsHelp =>
      'Nenhum ticket corresponde a estes filtros.';

  @override
  String get clearFilters => 'Limpar filtros';

  @override
  String get ticketTitle => 'Título';

  @override
  String get ticketDetails => 'Detalhes';

  @override
  String get taskInReview => 'Em revisão';

  @override
  String get priority => 'Prioridade';

  @override
  String get priorityUrgent => 'Urgente';

  @override
  String get priorityHigh => 'Alta';

  @override
  String get priorityMedium => 'Média';

  @override
  String get priorityLow => 'Baixa';

  @override
  String get priorityNone => 'Sem prioridade';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterMine => 'Minhas';

  @override
  String get filterBots => 'Bots';

  @override
  String get assignee => 'Responsável';

  @override
  String get unassigned => 'Sem responsável';

  @override
  String get assignToMe => 'Eu';

  @override
  String get reviewRequired => 'Precisa de revisão';

  @override
  String get reviewRequiredHelp =>
      'O bot termina em revisão em vez de concluído.';

  @override
  String get comments => 'Comentários';

  @override
  String get addComment => 'Adicionar comentário';

  @override
  String get sendComment => 'Enviar';

  @override
  String get openThread => 'Abrir conversa do bot';

  @override
  String get deleteTicket => 'Excluir ticket';

  @override
  String get ticketResult => 'Resultado';

  @override
  String get noCommentsYet =>
      'Nenhum comentário ainda. Deixe um recado para o bot ou para sua equipe.';

  @override
  String get noTickets => 'Dê algo para seus bots fazerem';

  @override
  String get noTicketsHelp =>
      'Passe uma tarefa ou um objetivo inteiro. Você pode acompanhar o andamento por aqui.';

  @override
  String get tasksStartTicket => 'Adicionar um ticket';

  @override
  String get tasksStartTicketHelp =>
      'Uma tarefa. Atribua a um bot e ele começa.';

  @override
  String get tasksStartProject => 'Iniciar um projeto';

  @override
  String get tasksStartProjectHelp =>
      'Um objetivo maior. Um bot planeja em tickets e espera seu OK.';

  @override
  String get tasksExamples => 'Ou comece com um destes';

  @override
  String get tasksExampleResearch =>
      'Pesquise meus três principais concorrentes';

  @override
  String get tasksExampleDraft =>
      'Escreva um rascunho de anúncio de lançamento';

  @override
  String get tasksExampleTidy => 'Organize meus arquivos';

  @override
  String get ticketStatus => 'Status';

  @override
  String get spaces => 'Espaços de trabalho';

  @override
  String get newWorkspace => 'Novo espaço de trabalho';

  @override
  String get newWorkspaceSubtitle =>
      'Um espaço separado para uma equipe, com seus próprios bots, chats e pessoas.';

  @override
  String get joinWorkspaceHelp =>
      'Cole o link de convite que alguém enviou para você.';

  @override
  String get inviteLinkField => 'Link de convite';

  @override
  String get workspaceIcon => 'Ícone';

  @override
  String get workspaceColor => 'Cor';

  @override
  String get workspaceSettings => 'Configurações do espaço de trabalho';

  @override
  String get workspaceSettingsHelp => 'Nome, ícone, cor e links de convite';

  @override
  String get inviteLinks => 'Links de convite';

  @override
  String get inviteLinksHelp =>
      'Qualquer pessoa com um link pode entrar após fazer login, até ele expirar, os usos acabarem ou você revogá-lo.';

  @override
  String get createInviteLink => 'Criar link';

  @override
  String get linkExpires => 'Expira';

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
      other: 'Em $daysString dias',
      one: 'Em $daysString dia',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Usos';

  @override
  String get linkUnlimited => 'Ilimitado';

  @override
  String linkUses(String uses) {
    return '$uses usados';
  }

  @override
  String get linkRevoked => 'Revogado';

  @override
  String get revokeLink => 'Revogar';

  @override
  String get linkCopied => 'Link de convite copiado.';

  @override
  String get inviteRole => 'Função';

  @override
  String get shareLinkLabel => 'Compartilhar';

  @override
  String get botFolder => 'Pasta';

  @override
  String get noFolder => 'Sem pasta';

  @override
  String get newFolder => 'Nova pasta…';

  @override
  String get folderName => 'Nome da pasta';

  @override
  String get archiveBot => 'Arquivar bot';

  @override
  String archiveBotTitle(String name) {
    return 'Arquivar $name?';
  }

  @override
  String get archiveBotBody =>
      'Ele sai da barra lateral e para de executar. Os chats e o histórico ficam salvos, e você pode trazê-lo de volta em Bots arquivados.';

  @override
  String get archive => 'Arquivar';

  @override
  String get archivedBots => 'Bots arquivados';

  @override
  String get unarchive => 'Trazer de volta';

  @override
  String botArchived(String name) {
    return '$name arquivado.';
  }

  @override
  String get deleteBot => 'Apagar bot';

  @override
  String deleteBotTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String deleteBotBody(String name) {
    return 'Todas as conversas com $name são apagadas de vez, com mensagens, fotos e arquivos, e $name para de rodar e sai da barra lateral. Os chats em grupo e os registros de uso são mantidos. As configurações e a memória dele vão para Bots arquivados.';
  }

  @override
  String botDeleted(String name) {
    return '$name apagado.';
  }

  @override
  String get settingsHistory => 'Histórico de configurações';

  @override
  String get settingsHistoryHelp =>
      'Cada alteração nas configurações deste bot e quem a fez';

  @override
  String get noHistory => 'Nenhuma alteração ainda.';

  @override
  String get restoreSettings => 'Restaurar estas configurações';

  @override
  String restoreSettingsBody(String fields) {
    return 'Voltar $fields para como estavam antes desta alteração? As configurações atuais permanecem no histórico.';
  }

  @override
  String changedByBot(String name) {
    return 'Alterado por $name';
  }

  @override
  String get changedByPerson => 'Alterado por uma pessoa';

  @override
  String get changedBySystem => 'Alterado pelo Casama';

  @override
  String get fieldName => 'nome';

  @override
  String get fieldInstructions => 'instruções';

  @override
  String get fieldModel => 'modelo';

  @override
  String get fieldAutonomy => 'autonomia';

  @override
  String get fieldBudget => 'orçamento';

  @override
  String get fieldComputer => 'computador';

  @override
  String get fieldArchived => 'arquivado';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot precisa de uma chave de $service';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Apenas para $hosts';
  }

  @override
  String get secretRequestHelp => 'Vai direto para o cofre. O bot nunca vê.';

  @override
  String secretSaved(String name) {
    return '$name salvo';
  }

  @override
  String get secretDeclined => 'Recusado';

  @override
  String secretWhat(String service) {
    return 'Chave de $service';
  }

  @override
  String totpWhat(String service) {
    return 'Código de acesso de $service';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Devolvido: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Login compartilhado para $host';
  }

  @override
  String get shareLogin => 'Compartilhar login';

  @override
  String get shareLoginUsername => 'E-mail ou nome de usuário';

  @override
  String get shareLoginPassword => 'Senha';

  @override
  String get shareLoginRemember => 'Lembrar para a próxima vez';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Usado apenas em $host. $bot nunca vê sua senha.';
  }

  @override
  String get shareLoginSave => 'Salvar e entrar';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot precisa que você entre em $host';
  }

  @override
  String get signInOnPage => 'Entrar na página';

  @override
  String loginOnPageLine(String host) {
    return 'Entrando em $host na página';
  }

  @override
  String get loginOnPageHelp =>
      'Entre na página e toque em Devolver o controle.';

  @override
  String get back => 'Voltar';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Não compartilhado: sua agenda',
      'reminders': 'Não compartilhado: seus lembretes',
      'contacts': 'Não compartilhado: seus contatos',
      'places': 'Não compartilhado: seus lugares',
      'photos': 'Não compartilhado: suas fotos',
      'health': 'Não compartilhado: seus dados de saúde',
      'notifications': 'Não compartilhado: suas notificações',
      'activity': 'Não compartilhado: sua atividade no computador',
      'browserTab': 'Não compartilhado: sua guia atual do navegador',
      'browserHistory':
          'Não compartilhado: seu histórico e favoritos do navegador',
      'alarm': 'Não compartilhado: seus alarmes',
      'home': 'Não compartilhado: seus acessórios do app Casa',
      'other': 'Não compartilhado: os dados do seu dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Recusar';

  @override
  String get signInCode => 'Código de acesso';

  @override
  String get secretKindValue => 'Chave ou senha';

  @override
  String get totpSeedLabel =>
      'Chave de configuração, link otpauth:// ou o código que você vê agora';

  @override
  String get totpSeedHelp =>
      'Uma chave de configuração da verificação em duas etapas do site permite que o bot gere cada código depois (ele nunca vê a chave). Ou digite o código que você vê agora: ele vai direto para o bot.';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot precisa de um código de acesso de $service';
  }

  @override
  String get search => 'Buscar';

  @override
  String get searchHint =>
      'Buscar chats, memórias, habilidades, tickets e arquivos';

  @override
  String get searchEmptyPrompt => 'Digite pelo menos 2 caracteres.';

  @override
  String searchNoResults(String query) {
    return 'Nada encontrado para “$query”.';
  }

  @override
  String get searchMessages => 'Mensagens';

  @override
  String get searchChats => 'Chats';

  @override
  String get searchTickets => 'Tickets';

  @override
  String get searchFiles => 'Arquivos';

  @override
  String get searchFilesAsleep =>
      'Arquivos em computadores em repouso não são pesquisados. Inicie um computador para incluir os arquivos dele.';

  @override
  String get searchSearching => 'Pesquisando…';

  @override
  String get searchJumpHint => 'Buscar ou ir para…';

  @override
  String get searchRecent => 'Recentes';

  @override
  String get searchClearRecent => 'Limpar';

  @override
  String get searchRemoveRecent => 'Remover das buscas recentes';

  @override
  String get searchJumpBackIn => 'Voltar para';

  @override
  String get searchNeedsYou => 'Precisa de você';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n itens aguardando você',
      one: '$n item aguardando você',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Ir para';

  @override
  String get searchTopHits => 'Principais resultados';

  @override
  String get searchScopeAll => 'Tudo';

  @override
  String get searchMemories => 'Memórias';

  @override
  String get searchKeepTyping =>
      'Continue digitando para buscar mensagens, memórias e arquivos.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Perguntar a $bot sobre “$query”';
  }

  @override
  String get searchAskBotHelp => 'Inicia um novo chat com esta pergunta';

  @override
  String get searchKeysHint =>
      '↑ ↓ para mover   ↵ para abrir   esc para fechar';

  @override
  String get searchClear => 'Limpar busca';

  @override
  String get installFor => 'Instalar para';

  @override
  String get wholeWorkspace => 'Todo o espaço de trabalho';

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
      other: '$countString arquivos',
      one: '$countString arquivo',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Instalar';

  @override
  String skillInstalled(String name) {
    return '$name instalado.';
  }

  @override
  String get noResults => 'Nenhum resultado.';

  @override
  String get importFromGitHub => 'Importar do GitHub';

  @override
  String get importFromGitHubHelp =>
      'Cole um link para uma pasta com um SKILL.md. Você verá todos os arquivos antes de qualquer instalação. Repositórios privados usam um segredo GITHUB_TOKEN permitido para api.github.com.';

  @override
  String get preview => 'Prévia';

  @override
  String get skillScriptsNote =>
      'Scripts em uma habilidade só rodam no computador de um bot, nunca no servidor.';

  @override
  String get binaryFile => '(arquivo binário)';

  @override
  String skillUpdate(String name) {
    return 'Atualizar $name';
  }

  @override
  String get checkingForUpdates => 'Verificando atualizações…';

  @override
  String get skillUpToDate => 'Já está atualizado.';

  @override
  String get update => 'Atualizar';

  @override
  String get filesAdded => 'Adicionados';

  @override
  String get filesChanged => 'Alterados';

  @override
  String get filesRemoved => 'Removidos';

  @override
  String get fromCatalog => 'Do catálogo';

  @override
  String get savedByBot => 'Salvo por um bot';

  @override
  String get checkForUpdates => 'Verificar atualizações';

  @override
  String get attachSkill => 'Anexar uma habilidade';

  @override
  String get rerunSetup => 'Executar configuração novamente';

  @override
  String get rerunSetupHelp =>
      'Responda às perguntas de configuração novamente e revise uma nova proposta';

  @override
  String get trace => 'Rastreamento';

  @override
  String get openTrace => 'Abrir rastreamento';

  @override
  String get editMessage => 'Editar';

  @override
  String get editMessageHelp =>
      'Enviar executa a conversa novamente a partir daqui. A versão original fica salva; alterne pelas setas.';

  @override
  String get previousVersion => 'Versão anterior';

  @override
  String get nextVersion => 'Próxima versão';

  @override
  String get quietHours => 'Horário silencioso';

  @override
  String get quietHoursHelp =>
      'As notificações aguardam o fim do horário silencioso; sua caixa de entrada continua recebendo. Aprovações de um chat em que você está ainda chegam.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start até $end';
  }

  @override
  String get off => 'Desativado';

  @override
  String get botNotifications => 'Notificações deste bot';

  @override
  String get botNotificationsHelp => 'Se este bot segue seu horário silencioso';

  @override
  String get botMayCall => 'Pode me ligar';

  @override
  String get botMayCallHelp =>
      'Este bot pode ligar para você quando algo merecer uma chamada. Desativado: envia uma notificação em vez disso.';

  @override
  String get quietDefault => 'Seguir meu horário silencioso';

  @override
  String get quietAlways => 'Sempre me notificar';

  @override
  String get quietCustom => 'Horário silencioso próprio';

  @override
  String get from => 'De';

  @override
  String get until => 'Até';

  @override
  String get shareAsTemplate => 'Compartilhar como modelo';

  @override
  String get shareAsTemplateRow =>
      'Um arquivo ou link com suas instruções, habilidades e rotinas';

  @override
  String get shareAsTemplateHelp =>
      'Inclui instruções, habilidades, rotinas e os serviços que usa. Nunca chaves ou segredos.';

  @override
  String get copyLink => 'Copiar link';

  @override
  String get includeMemories => 'Incluir memórias';

  @override
  String get includeMemoriesHelp =>
      'O que ele aprendeu sobre você. Compartilhe com cuidado.';

  @override
  String get saveAsFile => 'Salvar como arquivo';

  @override
  String get notABotTemplate =>
      'Este arquivo não é um modelo de bot do Casama.';

  @override
  String get importBot => 'Importar bot';

  @override
  String botImported(String name) {
    return '$name está pronto.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name está pronto. Conecte $services em Integrações para que possa usá-los.';
  }

  @override
  String get whatComesWithIt => 'O que vem junto';

  @override
  String get connectAfterImport => 'Conectar após importar';

  @override
  String get importRoutines => 'Agendar rotinas dele';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Manter suas $countString memórias',
      one: 'Manter sua $countString memória',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Iniciando a rotina…';

  @override
  String get offlineSaved => 'Offline. Mostrando mensagens salvas.';

  @override
  String get loadEarlierMessages => 'Mensagens anteriores';

  @override
  String get chatLoadFailedTitle => 'Este chat não carregou';

  @override
  String get chatLoadFailedBody => 'Verifique sua conexão e tente novamente.';

  @override
  String get projects => 'Projetos';

  @override
  String get newProject => 'Novo projeto';

  @override
  String get noProjects => 'Nenhum projeto ainda';

  @override
  String get projectsHelp =>
      'Um projeto mantém um trabalho reunido: chat, plano, tarefas, arquivos e tudo o que for feito para ele. Trabalhe nele com um bot ou deixe o bot planejar e trabalhar sozinho.';

  @override
  String get newProjectHelp =>
      'Mantém um trabalho reunido: chat, plano, tarefas, arquivos e tudo o que for feito para ele.';

  @override
  String get startPlanning => 'Começar a planejar';

  @override
  String get projectTitle => 'Título';

  @override
  String get projectGoal => 'Objetivo';

  @override
  String get projectDoneWhen => 'Concluído quando';

  @override
  String get projectLead => 'Bot líder';

  @override
  String get projectBudget => 'Orçamento';

  @override
  String get projectGoalHint =>
      'O que deve existir no final? Uma landing page no ar no meu domínio…';

  @override
  String get projectDoneHint => 'Opcional. Como você vai saber que terminou';

  @override
  String get projectBudgetHint => 'Opcional. O trabalho pausa quando for gasto';

  @override
  String get projectThread => 'Chat do projeto';

  @override
  String get approvePlan => 'Aprovar o plano';

  @override
  String get pause => 'Pausar';

  @override
  String get resume => 'Retomar';

  @override
  String get milestones => 'Marcos';

  @override
  String get needsSignoff => 'precisa da sua aprovação';

  @override
  String get signOff => 'Aprovar';

  @override
  String get projectPlan => 'Plano';

  @override
  String get tickets => 'Tickets';

  @override
  String get projectTimeline => 'Linha do tempo';

  @override
  String get projectPlanning => 'Planejando';

  @override
  String get projectActive => 'Ativo';

  @override
  String get projectPaused => 'Pausado';

  @override
  String get projectBlocked => 'Bloqueado';

  @override
  String get projectDone => 'Concluído';

  @override
  String get projectCancelled => 'Cancelado';

  @override
  String get projectName => 'Nome';

  @override
  String get projectNameHint => 'Space Dodger, newsletter de primavera…';

  @override
  String get createProject => 'Criar projeto';

  @override
  String projectWorksAlone(String bot) {
    return 'Deixar $bot trabalhar nisso sozinho';
  }

  @override
  String get projectWorksAloneHelp =>
      'Ele cria um rascunho de plano para você aprovar e depois trabalha em sessões até atingir o objetivo. Nada começa antes da sua aprovação.';

  @override
  String get projectWorksAloneOn =>
      'Trabalha em sessões até atingir o objetivo.';

  @override
  String get projectWorksAloneOff => 'Vocês trabalham juntos no chat dele.';

  @override
  String get projectMade => 'Feito neste projeto';

  @override
  String projectMadeEmpty(String bot) {
    return 'Nada ainda. O que $bot criar no chat deste projeto aparece aqui.';
  }

  @override
  String get projectSeeAll => 'Ver tudo';

  @override
  String get projectTodos => 'Tarefas';

  @override
  String get projectFiles => 'Arquivos';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder no computador de $bot';
  }

  @override
  String get projectMarkDone => 'Marcar como concluído';

  @override
  String get projectReopen => 'Reabrir';

  @override
  String get projectCover => 'Capa';

  @override
  String get projectCoverNone => 'Nenhuma';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Veleiro',
      'mountain': 'Montanha',
      'seedling': 'Muda',
      'compass': 'Bússola',
      'lantern': 'Lanterna',
      'telescope': 'Telescópio',
      'map': 'Mapa',
      'chess': 'Xadrez',
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
      other: '$countString itens',
      one: '$countString item',
      zero: 'Nada ainda',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Projeto';

  @override
  String get creationMoveToProject => 'Mover para projeto';

  @override
  String get creationNoProject => 'Sem projeto';

  @override
  String get makeProject => 'Transformar em projeto';

  @override
  String get makeProjectTitle => 'Transformar este tópico em projeto';

  @override
  String makeProjectHelp(String bot) {
    return 'O que $bot criou neste tópico fica arquivado no projeto, assim como o que ele criar aqui depois.';
  }

  @override
  String get openProject => 'Abrir projeto';

  @override
  String get theBot => 'o bot';

  @override
  String get forYou => 'Para você';

  @override
  String get inboxNeedsYou => 'Precisa de você';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Precisa de você ($nString)';
  }

  @override
  String get inboxBriefs => 'Resumos';

  @override
  String get inboxUpdates => 'Atualizações';

  @override
  String get inboxEmptyHelp =>
      'Solicitações, resumos da manhã, notificações e novas páginas dos seus bots aparecem aqui.';

  @override
  String get inboxNeedsYouEmpty => 'Nada precisa de você agora';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Quando um bot precisar de uma decisão, da sua ajuda ou tiver uma ideia, aparece aqui.';

  @override
  String get noBriefs => 'Nenhum resumo da manhã ainda';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot publicou $title';
  }

  @override
  String get forYouEmpty => 'Nada para você agora';

  @override
  String get forYouEmptyHelp =>
      'Ative os avisos nas configurações de um bot para receber um resumo da manhã e sugestões ao longo do dia.';

  @override
  String morningBriefFrom(String name) {
    return 'Resumo da manhã de $name';
  }

  @override
  String get suggestions => 'Sugestões';

  @override
  String suggestedBy(String name) {
    return 'Sugerido por $name';
  }

  @override
  String get dismissSuggestion => 'Dispensar esta sugestão?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Escolha se $bot pode mencionar isso novamente.';
  }

  @override
  String get justThisOnce => 'Só desta vez';

  @override
  String justThisOnceHelp(String bot) {
    return 'Ocultar por enquanto. Se ainda importar depois, $bot pode sugerir novamente.';
  }

  @override
  String get dontSuggestAgain => 'Não sugerir mais';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Removido de vez. $bot vai lembrar que você prefere não ver.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Entendi. $bot não vai sugerir isso novamente.';
  }

  @override
  String get doIt => 'Fazer';

  @override
  String get checkins => 'Avisos';

  @override
  String get checkinsHelp =>
      'Um resumo da manhã e uma verificação a cada poucas horas sobre o que precisa de você. Desativado por padrão.';

  @override
  String get briefTime => 'Resumo da manhã às';

  @override
  String get scanEvery => 'Verificar a cada';

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
  String get dailyCap => 'Limite diário';

  @override
  String get on => 'Ativado';

  @override
  String get actionRules => 'Regras de ação';

  @override
  String get actionRulesRow => 'O que pode fazer sem perguntar';

  @override
  String get actionRulesHelp =>
      'Regras decidem por ação: permitir, permitir dentro de limites, perguntar antes ou passar para você concluir. A regra mais específica vence; sem regra, a autonomia do bot decide. Bots não podem alterar suas próprias regras.';

  @override
  String get addRule => 'Adicionar regra';

  @override
  String get addRuleHelp =>
      'Escolha o que o bot está fazendo e como deve lidar com isso.';

  @override
  String get noRules =>
      'Nenhuma regra ainda. O nível de autonomia do bot decide.';

  @override
  String get otherTools => 'Ferramentas específicas';

  @override
  String get workspaceRule => 'Regra do espaço de trabalho';

  @override
  String get catSend => 'Enviando mensagens';

  @override
  String get catPay => 'Pagamentos';

  @override
  String get catDelete => 'Excluindo';

  @override
  String get catPublish => 'Publicando';

  @override
  String get catShare => 'Compartilhamento e convites';

  @override
  String get catSignIn => 'Fazendo login';

  @override
  String get whenTheBot => 'Quando o bot estiver';

  @override
  String get itShould => 'Ele deve';

  @override
  String get ruleAllow => 'Prosseguir';

  @override
  String get ruleAllowLimits => 'Prosseguir dentro dos limites';

  @override
  String get ruleAsk => 'Perguntar antes';

  @override
  String get ruleHandOff => 'Passar para eu concluir';

  @override
  String get ruleDomains =>
      'Apenas para estes domínios (separados por vírgula)';

  @override
  String get ruleMaxAmount => 'Até este valor';

  @override
  String get ruleForWorkspace => 'Para todo bot no espaço de trabalho';

  @override
  String get watchers => 'Monitoramentos';

  @override
  String get watchersRow => 'O que está acompanhando de perto';

  @override
  String get noWatchers => 'Não está monitorando nada';

  @override
  String get watchersHelp =>
      'Peça ao bot “me avise quando…” e ele monitora uma página, uma resposta, um resultado ou um horário. As verificações não custam nada até algo mudar.';

  @override
  String get watcherActive => 'Monitorando';

  @override
  String get watcherPaused => 'Pausado';

  @override
  String get watcherDone => 'Concluído';

  @override
  String get watcherExpired => 'Expirado';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'disparou $countString vezes',
      one: 'disparou $countString vez',
      zero: 'ainda não disparou',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Conectar um app de IA';

  @override
  String connectAiAppAsk(String app) {
    return '$app quer usar o Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'Ele pode listar seus bots, pedir que façam tarefas e ler resultados no espaço de trabalho que você escolher, como você. As aprovações e regras dos seus bots continuam valendo.';

  @override
  String get connectAiAppSendsTo => 'Depois de permitir, você volta para';

  @override
  String get connectAiAppUnknown =>
      'O Casama não reconhece este endereço. Qualquer pessoa pode dar qualquer nome a um app, então só permita se você iniciou esta conexão e confia neste site.';

  @override
  String get connectAiAppDone => 'Pronto. Você pode voltar para o app de IA.';

  @override
  String get refuse => 'Recusar';

  @override
  String get allow => 'Permitir';

  @override
  String get connectAiApps => 'Conectar apps de IA';

  @override
  String get connectAiAppsHelp =>
      'Apps compatíveis com MCP conectam-se a este endereço e fazem login, ou usam uma chave de API. Eles agem como a pessoa que os conectou.';

  @override
  String get connectedAiApps => 'Apps de IA conectados';

  @override
  String get connectedAiAppsHelp =>
      'Apps que você conectou ao entrar. Desconecte um e ele perde acesso a este espaço de trabalho na hora.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Apps que pessoas neste espaço de trabalho conectaram ao entrar. Desconecte um e ele perde acesso na hora.';

  @override
  String get noConnectedAiApps => 'Nenhum app de IA conectado ainda.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Usado $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Conectado $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Ele para de funcionar neste espaço de trabalho na hora. Para usar novamente, conecte de novo pelo app.';

  @override
  String get mcpApprovals => 'Permitir aprovações de apps de IA';

  @override
  String get mcpApprovalsHelp =>
      'Apps conectados podem aprovar as ações dos seus bots.';

  @override
  String get newApiKey => 'Nova chave de API';

  @override
  String get apiKeyName => 'Nome';

  @override
  String get newGroupChat => 'Novo chat em grupo';

  @override
  String get groupChats => 'Chats em grupo';

  @override
  String groupWhoAnswers(String names) {
    return '$names vão responder';
  }

  @override
  String get groupEveryoneAnswers => 'Todos vão responder';

  @override
  String get groupMentionHint => '@mencione um bot ou @everyone';

  @override
  String routineRan(String name) {
    return 'Rotina “$name” executada';
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
      other: '$countString itens aguardando você',
      one: '$countString item aguardando você',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Reúna de 2 a 10 bots em um chat. @Nome pergunta a um bot; @everyone pede ao líder para planejar e dividir o trabalho.';

  @override
  String get groupCreate => 'Criar chat em grupo';

  @override
  String get groupCrewEmpty => 'Escolha bots abaixo para montar o grupo.';

  @override
  String get groupLeadShort => 'Líder';

  @override
  String get groupMakeLead => 'Tornar líder';

  @override
  String groupRemoveBot(String name) {
    return 'Remover $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Escolha mais $count bots',
      one: 'Escolha mais $count bot',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Já são 10 bots, o máximo que um grupo pode ter.';

  @override
  String get groupLeadHint =>
      'O líder planeja o trabalho quando você usa @everyone. Toque em outro bot no topo para torná-lo líder.';

  @override
  String groupLeadIs(String name) {
    return '$name lidera: planeja o trabalho quando você usa @everyone. Toque em outro bot no topo para torná-lo líder.';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return 'Escolha mais 1 bot. $name lidera; toque em outro bot no topo para torná-lo líder.';
  }

  @override
  String get groupNeedTwoBots =>
      'Um chat em grupo precisa de pelo menos dois bots. Crie outro bot primeiro.';

  @override
  String get groupSearchBots => 'Buscar bots';

  @override
  String get groupNoMatch => 'Nenhum bot corresponde a esse nome.';

  @override
  String get groupTitle => 'Nome (opcional)';

  @override
  String get groupPickBots => 'Bots';

  @override
  String get groupLead => 'Lidera o grupo';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Páginas';

  @override
  String get pagesRow => 'Relatórios e painéis que ele publicou';

  @override
  String get noPages => 'Nenhuma página ainda';

  @override
  String get pagesHelp =>
      'Peça a um bot um relatório, painel ou rastreador e ele pode publicar como uma página. As páginas abrem no seu navegador e ficam privadas até você compartilhar.';

  @override
  String get pagePrivate => 'Só eu';

  @override
  String get pageWorkspace => 'Espaço de trabalho';

  @override
  String get pagePublic => 'Qualquer pessoa com o link';

  @override
  String get pageRefreshes => 'Atualiza conforme a programação';

  @override
  String get pageCardOpen => 'Página · Toque para abrir';

  @override
  String get exportPdf => 'Exportar PDF';

  @override
  String get pageMakePublicTitle => 'Tornar esta página pública?';

  @override
  String get pageMakePublicBody =>
      'Qualquer pessoa com o link pode abri-la, incluindo os dados nela. Você pode revogar quando quiser; o link para de funcionar.';

  @override
  String get pageMakePublic => 'Tornar pública';

  @override
  String get pagePublicLinkTitle => 'Link público';

  @override
  String get pagePublicLinkBody =>
      'Copiado. Não aparece em mecanismos de busca.';

  @override
  String deletePageTitle(String title) {
    return 'Excluir “$title”?';
  }

  @override
  String get openPages => 'Abrir em Páginas';

  @override
  String get discard => 'Descartar';

  @override
  String get discardChangesTitle => 'Descartar alterações?';

  @override
  String get discardChangesBody => 'Suas edições não foram salvas.';

  @override
  String get keepEditing => 'Continuar editando';

  @override
  String get teachTask => 'Ensinar uma tarefa';

  @override
  String get teachWhichBot => 'Qual bot deve aprender isso?';

  @override
  String get teachRecording => 'Gravando';

  @override
  String get teachRecordingPaused => 'Gravação interrompida';

  @override
  String get teachRecordingHelp =>
      'Faça a tarefa normalmente. Cada passo é salvo com o que está na tela; campos de senha nunca são salvos.';

  @override
  String get teachStop => 'Parar';

  @override
  String get teachMarkSecret => 'Marcar como segredo';

  @override
  String get teachMarkSecretHelp =>
      'O que você acabou de digitar é apagado da gravação e vira uma entrada secreta que o bot solicita.';

  @override
  String get teachDraftTitle => 'Nova habilidade';

  @override
  String get teachDrafting =>
      'Escrevendo uma habilidade a partir da sua gravação…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString passos',
      one: '$countString passo',
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
      other: '$countString passos',
      one: '$countString passo',
    );
    return 'O que você mostrou ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Confira os passos, as entradas e as verificações de sucesso, depois salve. Você já pode testar na hora.';

  @override
  String get teachDraftFailed =>
      'O bot não conseguiu escrever um rascunho. Escreva os passos você mesmo a partir da gravação abaixo ou descarte.';

  @override
  String get teachAlreadySaved => 'Esta habilidade está salva';

  @override
  String get teachSaveAndTry => 'Salvar e testar';

  @override
  String teachSaved(String name) {
    return '$name salvo';
  }

  @override
  String get teachDiscardTitle => 'Descartar esta gravação?';

  @override
  String get teachDiscardBody =>
      'Todos os passos, snapshots e capturas de tela registrados são excluídos.';

  @override
  String teachStepClick(int x, int y) {
    return 'Clicar em $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Digitar “$text”';
  }

  @override
  String teachStepSecret(String name) {
    return 'Digitar segredo $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Pressionar $key';
  }

  @override
  String get teachStepScroll => 'Rolar';

  @override
  String get plugins => 'Plugins';

  @override
  String get pluginsRow => 'Habilidades e ferramentas de pacotes de plugin';

  @override
  String get noPlugins => 'Nenhum plugin ainda';

  @override
  String get pluginsHelp =>
      'Plugins são pacotes Agent Plugins 1.0 no GitHub. Eles podem trazer habilidades e ferramentas MCP; os servidores deles rodam no computador deste bot, nunca nos servidores do Casama.';

  @override
  String get addPlugin => 'Adicionar plugin';

  @override
  String get addPluginHelp =>
      'Cole um link do GitHub para a pasta do plugin. Você verá o que ele adiciona antes de qualquer instalação.';

  @override
  String get pluginAdds => 'Ele adiciona';

  @override
  String pluginStdio(String command) {
    return 'Roda no computador do bot: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Conecta-se a $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Comunica-se com: $hosts';
  }

  @override
  String get pluginSkill => 'Habilidade';

  @override
  String get pluginHosts => 'Rede';

  @override
  String get pluginServerError => 'Não foi possível iniciar';

  @override
  String get pluginRunsOnComputer => 'Roda no computador do bot';

  @override
  String get pluginWhereToolsRun => 'Onde suas ferramentas rodam';

  @override
  String get pluginWhereToolsRunHelp =>
      'No seu próprio computador, as ferramentas podem usar o que está lá, e só você pode usá-las, nos seus próprios chats. Servidores na internet não são afetados.';

  @override
  String get pluginPlaceBot => 'O computador do bot';

  @override
  String pluginPlaceMine(String name) {
    return 'Meu computador: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Roda em $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'As ferramentas funcionam apenas em chats com a pessoa dona do computador';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Offline: as ferramentas voltam a funcionar quando o app do Casama estiver aberto lá';

  @override
  String get pluginUpToDate => 'Já está atualizado';

  @override
  String get checkForUpdate => 'Verificar atualização';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String uninstallPluginTitle(String name) {
    return 'Desinstalar $name?';
  }

  @override
  String get uninstallPluginBody =>
      'As habilidades, ferramentas, arquivos e segredos salvos dele são removidos deste bot.';

  @override
  String updatePluginTitle(String name) {
    return 'Atualizar $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Novas habilidades: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Habilidades alteradas: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Habilidades removidas: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Novos servidores de ferramentas: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Servidores de ferramentas alterados: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Servidores de ferramentas removidos: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Comunica-se com novos hosts: $hosts';
  }

  @override
  String get pluginDiffNone => 'Nenhuma alteração no que ele adiciona.';

  @override
  String get next => 'Próximo';

  @override
  String get botNameLabel => 'Nome';

  @override
  String get importAgent => 'Importar um agente';

  @override
  String get importAgentHelp =>
      'Traga um bot do OpenClaw ou Hermes Agent, ou cole uma configuração do Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark ou Instinct: persona, habilidades, agendamentos e memórias. Você revisa tudo antes de criar. Arquivos de chaves e configurações nunca são lidos.';

  @override
  String get importAgentPickFolder => 'Escolher a pasta';

  @override
  String get importAgentPickZip => 'Enviar um ZIP da pasta';

  @override
  String get importPasteChoice => 'Colar configuração de um bot';

  @override
  String get importPasteChoiceHelp =>
      'Do Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct ou outro app';

  @override
  String get importPasteTitle => 'Colar configuração de um bot';

  @override
  String get importPasteHelp =>
      'Envie ao seu bot o prompt abaixo e cole a resposta inteira dele. Você revisa tudo antes de o novo bot ser criado.';

  @override
  String get importPasteSource => 'Onde está seu bot agora?';

  @override
  String get importPasteOther => 'Em outro lugar';

  @override
  String get importPasteStep1 => '1. Envie este prompt ao seu bot';

  @override
  String get importPasteReply => '2. Cole a resposta dele';

  @override
  String get importPasteSafety =>
      'Linhas que parecem chaves, senhas ou números de cartão são removidas. Entre nos apps dele novamente após importar.';

  @override
  String get importPasteSubtitle => 'Configuração colada';

  @override
  String get agentImportReviewHelp =>
      'Desmarque o que não quiser. Nada é criado até você importar.';

  @override
  String get agentImportNoPersona =>
      'Nenhum arquivo de persona foi encontrado.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString habilidades',
      one: '$countString habilidade',
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
      other: '$countString rotinas',
      one: '$countString rotina',
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
      other: '$countString memórias',
      one: '$countString memória',
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
      other: '$countString outros arquivos',
      one: '$countString outro arquivo',
    );
    return 'Copiar $_temp0 para ~/imported/ no computador dele';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Não importado: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Importado $name e $countString arquivos copiados para o computador dele';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$name importado. Os outros arquivos ainda não puderam ser copiados; dê um computador a ele e importe novamente para copiá-los.';
  }

  @override
  String get importMemoryTitle => 'Importar memórias do ChatGPT ou Claude';

  @override
  String get importMemoryHelp =>
      'Copie este prompt no ChatGPT ou Claude e cole a resposta abaixo.';

  @override
  String get importMemoryPick =>
      'Mantenha o que estiver certo; desmarque o resto.';

  @override
  String get importMemoryPaste => 'A resposta dele';

  @override
  String get importMemoryNone => 'Nenhuma memória encontrada nessa resposta.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString memórias adicionadas',
      one: '$countString memória adicionada',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Rotinas e habilidades como arquivos';

  @override
  String get routinesAsFilesHelp =>
      'Cada rotina e habilidade como um arquivo Markdown: exporte, edite em qualquer lugar, importe de volta ou mantenha em um repositório GitHub.';

  @override
  String get exportFiles => 'Exportar como arquivos';

  @override
  String get importFiles => 'Importar arquivos';

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

    return '$createdString novos, $updatedString alterados, $unchangedString sem alteração';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Importados: $createdString novos, $updatedString alterados';
  }

  @override
  String get gitSync => 'Sincronização Git';

  @override
  String get gitSyncOff => 'Desativada';

  @override
  String get gitSyncHelp =>
      'As alterações no Casama vão por commit para o repositório, e os pushes nele atualizam o Casama após verificação. Se um arquivo mudar nos dois lugares, o Casama mantém sua versão e abre um pull request. Precisa de um segredo GITHUB_TOKEN permitido para api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Precisa de um segredo GITHUB_TOKEN';

  @override
  String gitSyncedWhen(String when) {
    return 'Sincronizado $when';
  }

  @override
  String get gitSyncPr => 'Pull request aguardando você';

  @override
  String get syncNow => 'Sincronizar agora';

  @override
  String get syncQueued => 'Sincronizando em até um minuto';

  @override
  String get gitBranch => 'Branch';

  @override
  String get gitFolder => 'Pasta no repositório (opcional)';

  @override
  String get gitSyncOn => 'Sincronização ativada';

  @override
  String get gitSyncRemove => 'Parar sincronização';

  @override
  String get gitWebhookTitle => 'Adicione este webhook ao repositório';

  @override
  String get gitWebhookHelp =>
      'Nas configurações do repositório, adicione um webhook para eventos push com este endereço e segredo (content type application/json). O segredo é mostrado apenas agora.';

  @override
  String get gitWebhookUrl => 'URL do payload';

  @override
  String get gitWebhookSecret => 'Segredo';

  @override
  String get knowledge => 'Conhecimento';

  @override
  String get knowledgeRow => 'Documentos que pode pesquisar e citar';

  @override
  String get noKnowledge => 'Nenhum conhecimento ainda';

  @override
  String get knowledgeHelp =>
      'Dê a ele arquivos, um site ou um repositório GitHub. Ele pesquisa neles quando for relevante e mostra de qual documento veio a resposta.';

  @override
  String get addKnowledge => 'Adicionar conhecimento';

  @override
  String get addKnowledgeHelp =>
      'Arquivos PDF, Word, Markdown, HTML, CSV ou texto; um site (um domínio, seguindo o robots.txt dele); ou os documentos de um repositório. Sites e repositórios atualizam diariamente.';

  @override
  String get knowledgeFiles => 'Arquivos';

  @override
  String get knowledgeWebsite => 'Site';

  @override
  String get knowledgePickFiles => 'Escolher arquivos';

  @override
  String get knowledgeWebsiteUrl => 'Endereço do site';

  @override
  String get knowledgeRepoUrl => 'Link do GitHub';

  @override
  String get knowledgeShareAll =>
      'Compartilhar com todo bot no espaço de trabalho';

  @override
  String get knowledgeShared => 'Todo o espaço de trabalho';

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
      one: '$docsString documento',
    );
    return '$_temp0, $chunksString trechos';
  }

  @override
  String get knowledgeError => 'Não foi possível ler';

  @override
  String get knowledgeSyncing => 'Lendo…';

  @override
  String get knowledgePending => 'Aguardando leitura';

  @override
  String get add => 'Adicionar';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot sugere uma habilidade: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot sugere melhorar $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Usa: $tools';
  }

  @override
  String get saveSkill => 'Salvar habilidade';

  @override
  String get applyEdit => 'Aplicar alteração';

  @override
  String skillSaved(String name) {
    return '$name salvo';
  }

  @override
  String skillUpdated(String name) {
    return '$name atualizado';
  }

  @override
  String get skillStats => 'Como está indo';

  @override
  String get skillNotUsedYet => 'Ainda não usada';

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

    return 'Usado $usesString vezes · $rateString% deu certo · $failuresString falhas · $correctionsString correções';
  }

  @override
  String skillLastFailure(String date) {
    return 'Último problema: $date';
  }

  @override
  String get skillHistory => 'Versões anteriores';

  @override
  String get replays => 'Replays';

  @override
  String get replaysRow => 'Passos gravados que ele executa sem pensar';

  @override
  String get noReplays => 'Nenhum replay ainda';

  @override
  String get replaysHelp =>
      'Um replay é uma sequência gravada de passos no navegador ou na área de trabalho que o bot executa direto, o que é mais rápido e mais barato. Se um passo parar de funcionar, o bot assume o controle dali e pode atualizar o replay. Salve um a partir de uma gravação de ensino ou peça ao bot para salvar o que acabou de fazer.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString passos',
      one: '$countString passo',
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
      other: 'executado $runsString vezes',
      one: 'executado $runsString vez',
      zero: 'executado 0 vezes',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString precisaram de ajuda',
      one: '$failuresString precisou de ajuda',
      zero: '0 precisaram de ajuda',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Executar $name';
  }

  @override
  String get runReplayHelp => 'Confira os valores que ele preenche e execute.';

  @override
  String get run => 'Executar';

  @override
  String get saveAsReplay => 'Também salvar como replay';

  @override
  String replaySaved(String name) {
    return 'Replay $name salvo';
  }

  @override
  String get passwordManagers => 'Gerenciadores de senhas';

  @override
  String get passwordManagersRow =>
      'Logins do 1Password ou Bitwarden para bots';

  @override
  String get noPasswordManagers => 'Nenhum gerenciador de senhas conectado';

  @override
  String get passwordManagersHelp =>
      'Os bots podem entrar com logins dos cofres que você escolher. Eles nunca veem a senha: ela é preenchida no navegador apenas nos sites desse próprio login.';

  @override
  String get connectPasswordManager => 'Conectar gerenciador de senhas';

  @override
  String get pmWorkspace => 'Todo o espaço de trabalho';

  @override
  String get pmJustMe => 'Só eu';

  @override
  String get pmNoVaults => 'Nenhum cofre escolhido ainda';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString cofres',
      one: '$countString cofre',
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
      one: '$countString login',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Usa um servidor 1Password Connect com o token de uma conta de serviço.';

  @override
  String get pmBitwardenHelp =>
      'Usa a API de gerenciamento de cofres do Bitwarden (bw serve) para as coleções da sua organização.';

  @override
  String get pmConnectUrl => 'Endereço do servidor Connect';

  @override
  String get pmConnectToken => 'Token do Connect';

  @override
  String get pmBwUrl => 'Endereço do bw serve';

  @override
  String get pmBwToken => 'Token de acesso (opcional)';

  @override
  String get pmForWorkspace => 'Para todo o espaço de trabalho';

  @override
  String get pmChooseVaults => 'Cofres que os bots podem usar';

  @override
  String get pmChooseVaultsHelp =>
      'Apenas logins nos cofres ou coleções que você marcar ficam disponíveis para os bots.';

  @override
  String get welcomeGettingReady => 'Preparando seu espaço…';

  @override
  String get setUpManually => 'Configurar manualmente';

  @override
  String get tryAgain => 'Tente novamente';

  @override
  String get inviteLinkCopied =>
      'Link de convite copiado. Envie para as pessoas com quem você trabalha.';

  @override
  String get inviteFriends => 'Convidar amigos';

  @override
  String inviteFriendsRow(String amount) {
    return 'Ganhe $amount de uso gratuito para cada amigo que entrar';
  }

  @override
  String get inviteFriendsRowPlain => 'Compartilhe o Casama com seus amigos';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Indique o Casama, ganhe $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Compartilhe o Casama com amigos';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Envie seu link a um amigo. Quando ele se cadastrar e terminar o primeiro chat, você ganha $amount de uso gratuito.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Envie seu link a um amigo. Ele pode se cadastrar na hora.';

  @override
  String get inviteFriendsYourCode =>
      'Seu código de convite. Toque para copiar.';

  @override
  String get inviteFriendsShare => 'Compartilhar link';

  @override
  String get inviteFriendsCopyLink => 'Copiar link';

  @override
  String get inviteFriendsCopied => 'Copiado. Envie para um amigo.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Venha para o Casama comigo, onde colegas de IA resolvem tarefas para você: $link (código de convite $code)';
  }

  @override
  String get inviteFriendsProgress => 'Seus convites';

  @override
  String get inviteFriendsJoined => 'Amigos que entraram';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ainda não terminaram o primeiro chat',
      one: '$countString ainda não terminou o primeiro chat',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Uso grátis ganho';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mais $countString amigos podem render uma recompensa para você',
      one: 'Mais $countString amigo pode render uma recompensa para você',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Você já ganhou o máximo que os convites dão. Obrigado!';

  @override
  String get inviteFriendsHow => 'Como funciona';

  @override
  String get inviteFriendsStep1 =>
      'Compartilhe seu link ou código com um amigo';

  @override
  String get inviteFriendsStep2 =>
      'A pessoa convidada faz o cadastro e informa seu código em até uma semana';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Quando terminar o primeiro chat, você ganha $amount de uso gratuito';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Ele começa a usar os próprios colegas de IA';

  @override
  String get inviteFriendsUnavailable =>
      'Convites não estão disponíveis neste servidor.';

  @override
  String get referralHaveCode => 'Tem o código de um amigo?';

  @override
  String get referralCodeHint => 'Código de convite';

  @override
  String get referralUse => 'Usar';

  @override
  String get referralRedeemed =>
      'Código de convite adicionado. Boas-vindas ao Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'Você entrou pelo convite de $name. Boas-vindas ao Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Você entrou pelo convite de $name.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Você entrou pelo convite de um amigo.';

  @override
  String referralInvitedBy(String name) {
    return '$name convidou você';
  }

  @override
  String get referralInvitedByFriend => 'Um amigo convidou você';

  @override
  String get referralWelcomeTitle => 'Boas-vindas ao Casama';

  @override
  String get referralWelcomeHelp =>
      'Colegas de IA que trabalham para você nos próprios computadores deles. Aceite o convite para seu amigo receber o crédito.';

  @override
  String get referralAccept => 'Aceitar convite';

  @override
  String get referralGetStarted => 'Começar';

  @override
  String get referralInvalid => 'Este convite não funciona';

  @override
  String get referralInvalidHelp =>
      'O código pode estar digitado errado. Você ainda pode se cadastrar e usar o Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Dê $amount, ganhe $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Envie seu link a um amigo. Quando ele se cadastrar com seu código e terminar o primeiro chat, cada um ganha $amount de uso gratuito.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Envie seu link a um amigo. Quando ele se cadastrar com seu código e terminar o primeiro chat, você ganha $reward de uso gratuito e ele ganha $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Quando terminar o primeiro chat, cada um ganha $amount de uso gratuito';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Quando terminar o primeiro chat, você ganha $reward e ele ganha $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Venha para o Casama comigo, onde colegas de IA resolvem tarefas para você. Cadastre-se com meu código de convite $code e ganhe $amount de uso gratuito: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Digite em até uma semana após o cadastro e ganhe $amount de uso gratuito depois do seu primeiro chat.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Seu bônus de boas-vindas de $amount está no seu espaço de trabalho.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Seu bônus de boas-vindas de $amount chega depois do seu primeiro chat.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Colegas de IA que trabalham para você nos próprios computadores deles. Aceite o convite e ganhe $amount de uso gratuito depois do seu primeiro chat.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Tudo certo! Seu bônus de boas-vindas de $amount chega depois do seu primeiro chat.';
  }

  @override
  String get connectManaged => 'Entrar pelo Composio';

  @override
  String connectManagedHelp(String app) {
    return 'O Casama conecta $app pelo Composio, que cuida do login. Você pode desconectar a qualquer momento.';
  }

  @override
  String get sharing => 'Compartilhamento';

  @override
  String get sharingRow => 'Quem pode conversar, editar ou gerenciar';

  @override
  String get sharingHelp =>
      'Todos no espaço de trabalho podem conversar com um bot, a menos que você o torne privado. As pessoas que você adicionar podem conversar, editar as configurações dele ou também gerenciar quem tem acesso. Um bot trabalhando para alguém usa apenas o computador pessoal e as conexões dessa pessoa.';

  @override
  String get sharingPrivate => 'Privado';

  @override
  String get sharingPrivateOn => 'Apenas você e as pessoas abaixo podem vê-lo';

  @override
  String get sharingPrivateOff =>
      'Todos no espaço de trabalho podem conversar com ele';

  @override
  String get sharingPeople => 'Pessoas';

  @override
  String get sharingOnlyCreator => 'Apenas quem o criou';

  @override
  String get sharingEveryoneChats =>
      'Todos podem conversar; adicione quem deve editá-lo';

  @override
  String sharingEveryoneRole(String role) {
    return 'Todos que têm a função $role';
  }

  @override
  String get accessChat => 'Pode conversar';

  @override
  String get accessEdit => 'Pode editar';

  @override
  String get accessAdmin => 'Pode gerenciar';

  @override
  String get sharingSaved => 'Compartilhamento salvo';

  @override
  String get triggerCalendar => 'Reuniões';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Perto das reuniões correspondentes ($minutesString min)',
      one: 'Perto das reuniões correspondentes ($minutesString min)',
      zero: 'No início das reuniões correspondentes',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Conecte o Google Agenda ou o Outlook primeiro.';

  @override
  String get calendarTriggerCalendar => 'Agenda';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString min',
      zero: 'No início',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Apenas reuniões com pessoas de fora da minha empresa';

  @override
  String get calendarVideoLink => 'Apenas reuniões com link de vídeo';

  @override
  String get calendarTitleMatch => 'Apenas títulos que contenham (opcional)';

  @override
  String get fullAccess => 'Acesso total';

  @override
  String get fullAccessHelp =>
      'Os bots agem sem perguntar antes, nos computadores deles e no seu Mac. Pagamentos, alterações de senha e suas próprias regras de “perguntar” continuam pedindo sua confirmação.';

  @override
  String get fullAccessConfirmTitle => 'Ativar acesso total?';

  @override
  String get fullAccessConfirmBody =>
      'Todo bot neste espaço de trabalho poderá enviar mensagens, excluir arquivos, executar comandos no seu Mac e adicionar conexões sem perguntar antes. Pagamentos e alterações de senha continuam pedindo sua confirmação.';

  @override
  String get fullAccessTurnOn => 'Ativar';

  @override
  String get botToBot => 'Bots podem conversar entre si';

  @override
  String get botToBotHelp =>
      'Os bots podem se @mencionar, enviar mensagens e passar tarefas uns para os outros.';

  @override
  String get capMessages => 'Mensagens (iMessage)';

  @override
  String get chatApps => 'Apps de chat';

  @override
  String get chatAppsRow => 'Telegram, e-mail, SMS, Slack, WhatsApp e mais';

  @override
  String get botEmail => 'Endereço de e-mail';

  @override
  String get botEmailRow => 'Dê a este bot seu próprio endereço';

  @override
  String botEmailClaimTitle(String name) {
    return 'Dê a $name um endereço de e-mail';
  }

  @override
  String get botEmailClaimHelp =>
      'As pessoas podem escrever para ele, e ele responde por e-mail. Encaminhe qualquer coisa: contas, reservas, newsletters.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'O nome não pode ser alterado depois.';

  @override
  String get botEmailNameLabel => 'Nome';

  @override
  String botEmailWillBe(String address) {
    return 'Endereço do seu bot: $address.';
  }

  @override
  String get botEmailClaim => 'Criar endereço';

  @override
  String get botEmailTaken => 'Esse nome já está em uso. Tente um destes:';

  @override
  String get botEmailClaimed => 'Seu bot tem um endereço';

  @override
  String get botEmailClaimedHelp =>
      'Um e-mail de boas-vindas está a caminho para você. Responda a ele ou encaminhe qualquer coisa.';

  @override
  String get botEmailCopy => 'Copiar';

  @override
  String get botEmailCopied => 'Copiado';

  @override
  String get botEmailContacts => 'Adicionar aos contatos';

  @override
  String botEmailWrite(String name) {
    return 'Escrever para $name';
  }

  @override
  String get botEmailPaused =>
      'Pausado. Ainda recebe e guarda e-mails, mas não responde nada.';

  @override
  String get botEmailPause => 'Pausar';

  @override
  String get botEmailResume => 'Retomar';

  @override
  String get botEmailSenders => 'Remetentes permitidos';

  @override
  String get botEmailSendersHelp =>
      'Apenas estas pessoas recebem respostas. E-mails de desconhecidos são guardados e não iniciam nada.';

  @override
  String get botEmailEditSenders => 'Editar em Apps de chat';

  @override
  String get botEmailMove => 'Mover para outro bot';

  @override
  String get botEmailMoveHelp =>
      'O endereço e os e-mails dele vão para o outro bot.';

  @override
  String get botEmailRelease => 'Liberar endereço';

  @override
  String get botEmailReleaseHelp =>
      'Para de receber de vez. O nome nunca mais é concedido.';

  @override
  String botEmailReleaseConfirm(String address) {
    return 'Liberar $address? Ele para de receber na hora e o nome nunca mais é concedido.';
  }

  @override
  String get botEmailReleaseNow => 'Liberar';

  @override
  String get botEmailMoved => 'Movido';

  @override
  String botEmailNewBotRow(String name) {
    return 'Dê a $name um endereço de e-mail';
  }

  @override
  String get botEmailInbox => 'Caixa de entrada';

  @override
  String get botEmailInboxRow => 'E-mails guardados, desconhecidos e arquivos';

  @override
  String get botEmailEmpty => 'Nenhum e-mail ainda';

  @override
  String get botEmailStrangers => 'Desconhecidos';

  @override
  String get botEmailAll => 'Todos os e-mails';

  @override
  String get botEmailUnconfirmed => 'Não foi possível confirmar este remetente';

  @override
  String get botEmailAllow => 'Permitir';

  @override
  String get botEmailBlock => 'Bloquear';

  @override
  String get botEmailBlocked => 'Bloqueado. Novos e-mails daqui são recusados.';

  @override
  String get botEmailUnblock => 'Desbloquear';

  @override
  String get botEmailOpenChat => 'Abrir chat';

  @override
  String get botEmailFiles => 'Arquivos';

  @override
  String get botEmailNewSenders => 'Avisar sobre novos remetentes';

  @override
  String get botEmailNewSendersHelp =>
      'No máximo uma vez por dia. Desativado até você ativar.';

  @override
  String get botEmailTryTitle => 'O que experimentar';

  @override
  String get botEmailTryForward => 'Encaminhe uma conta ou reserva';

  @override
  String get botEmailTryForwardHelp =>
      'Encaminhe qualquer coisa para o endereço acima. Ele lê e responde aqui.';

  @override
  String get botEmailTryReceipts => 'Guardar meus recibos';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Cria uma rotina que arquiva os e-mails enviados para $address.';
  }

  @override
  String get botEmailTryDigest => 'Um resumo por semana';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Cria uma rotina que reúne newsletters de $address em um resumo semanal.';
  }

  @override
  String get botEmailTryCopied => 'Endereço copiado';

  @override
  String get botEmailTryMade => 'Rotina criada';

  @override
  String get botEmailReceiptsName => 'Guardar meus recibos';

  @override
  String get botEmailReceiptsInstructions =>
      'Arquive o recibo deste e-mail: para que foi, quanto e quando. Não diga nada, a menos que algo pareça errado.';

  @override
  String get botEmailDigestName => 'Resumo semanal de newsletters';

  @override
  String get botEmailDigestInstructions =>
      'Reúna as newsletters desta semana e envie um resumo curto: apenas as manchetes que vale saber, nada mais.';

  @override
  String get botEmailTriggerTag => 'Tag do endereço';

  @override
  String get botEmailTriggerTagHelp =>
      'Apenas e-mails para esta tag, como compras em ada+compras@. Somente endereços de e-mail.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Ouvir remetentes não confirmados também';

  @override
  String get botEmailTriggerAutomatic => 'Ouvir e-mails automáticos também';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used de $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used usados';
  }

  @override
  String get botEmailStorageFull =>
      'A caixa de e-mail está cheia, então novos e-mails são recusados. Exclua e-mails antigos para liberar espaço.';

  @override
  String get botEmailSelect => 'Selecionar';

  @override
  String get botEmailSelectDone => 'Concluído';

  @override
  String get botEmailDelete => 'Excluir';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Excluir $n e-mails',
      one: 'Excluir $n e-mail',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Excluir estes $n e-mails?',
      one: 'Excluir este e-mail?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'O texto e os arquivos deles somem para sempre. Cópias que já estão em um chat ficam lá.';

  @override
  String get botEmailDeleteOlder => 'Excluir e-mails mais antigos';

  @override
  String get botEmailOlder30Days => 'Mais antigos que 30 dias';

  @override
  String get botEmailOlder6Months => 'Mais antigos que 6 meses';

  @override
  String get botEmailOlderYear => 'Mais antigos que um ano';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Excluir todos os e-mails com mais de 30 dias?',
      'months6': 'Excluir todos os e-mails com mais de 6 meses?',
      'other': 'Excluir todos os e-mails com mais de um ano?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n e-mails excluídos',
      one: '$n e-mail excluído',
      zero: 'Nada para excluir',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n endereços de e-mail do bot',
      one: '$n endereço de e-mail do bot',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew =>
      'Os bots escrevem para novas pessoas por e-mail';

  @override
  String get botEmailPerkRepliesOnly => 'Os bots respondem a você por e-mail';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Conectar um app de chat';

  @override
  String get chatAppsEmpty => 'Nenhum app de chat ainda';

  @override
  String get chatAppsHelp =>
      'Permita que as pessoas enviem mensagens para este bot pelo Telegram, e-mail, SMS, Slack, WhatsApp, Messenger, Feishu ou iMessage. Ele só responde às pessoas na lista permitida; todo o resto é registrado aqui.';

  @override
  String get chatAppsAddHelp =>
      'Cole as credenciais das configurações de desenvolvedor do app. Elas ficam armazenadas criptografadas e nunca mais são exibidas.';

  @override
  String get chatAppsKind => 'App';

  @override
  String get chatAppsSenders => 'Remetentes permitidos';

  @override
  String get chatAppsSendersHelp =>
      'Um por linha: endereços de e-mail (ou *@empresa.com), números de telefone ou IDs de usuário. Não sabe um ID? Deixe vazio, envie uma mensagem ao bot e copie o ID em Atividade.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Ative “Usar este computador para bots” com Mensagens permitido no app para computador do seu Mac primeiro.';

  @override
  String chatAppsConnected(String name) {
    return '$name está conectado';
  }

  @override
  String get chatAppsTelegramDone =>
      'O Telegram já está enviando mensagens aqui. Envie uma mensagem ao seu bot para testar.';

  @override
  String get chatAppsPasteUrl =>
      'Cole este endereço nas configurações de webhook do app.';

  @override
  String get chatAppsWebhookUrl => 'Endereço do webhook';

  @override
  String get chatAppsVerifyToken => 'Token de verificação';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString remetentes permitidos',
      one: '$countString remetente permitido',
      zero: 'Ninguém permitido',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Atividade';

  @override
  String get chatAppsNoActivity => 'Nenhuma mensagem ainda.';

  @override
  String get chatAppsIgnored => 'Ignorado: não está na lista permitida';

  @override
  String get chatAppsAllow => 'Permitir';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender agora pode enviar mensagens para este bot';
  }

  @override
  String get chatAppsRoutine => 'Iniciou uma rotina';

  @override
  String get chatAppsFailed => 'Não foi possível enviar';

  @override
  String get chatAppsSent => 'Enviado';

  @override
  String get chatAppsAnswered => 'Respondido';

  @override
  String get chatAppsRemove => 'Desconectar';

  @override
  String get chBotToken => 'Token do bot';

  @override
  String get chAddress => 'Endereço de e-mail';

  @override
  String get chApiKey => 'Chave de API';

  @override
  String get chSigningSecret => 'Segredo de assinatura';

  @override
  String get chPhoneNumber => 'Número de telefone';

  @override
  String get chAccountSid => 'Account SID';

  @override
  String get chAuthToken => 'Token de autenticação';

  @override
  String get chPhoneNumberId => 'ID do número de telefone';

  @override
  String get chAccessToken => 'Token de acesso';

  @override
  String get chAppSecret => 'Segredo do app';

  @override
  String get chPageToken => 'Token de acesso da página';

  @override
  String get chAppId => 'ID do app';

  @override
  String get chEncryptKey => 'Chave de criptografia';

  @override
  String get chVerificationToken => 'Token de verificação';

  @override
  String get chPublicKey => 'Chave pública';

  @override
  String get chTrackerUser => 'ID de usuário do bot no rastreador';

  @override
  String get chSiteUrl => 'Endereço do site (https://…)';

  @override
  String get chAccountEmail => 'E-mail da conta';

  @override
  String get routineMessage => 'Quando chegar uma mensagem correspondente';

  @override
  String get triggerMessage => 'Mensagens';

  @override
  String get messageTriggerHelp =>
      'Inicia quando um e-mail ou mensagem de chat para este bot corresponder. Conecte o app em Apps de chat primeiro.';

  @override
  String get messageTriggerAnyApp => 'Qualquer app';

  @override
  String get messageTriggerSender => 'De (endereço, número ou *@empresa.com)';

  @override
  String get messageTriggerSubject => 'Assunto contém';

  @override
  String get messageTriggerWords => 'Mensagem contém';

  @override
  String callIncoming(String name) {
    return '$name está ligando';
  }

  @override
  String get callAnswer => 'Atender';

  @override
  String get callDecline => 'Recusar';

  @override
  String get callFullScreenTitle => 'Chamadas na tela bloqueada';

  @override
  String get callFullScreenOff =>
      'Desativado: a chamada de um bot aparece apenas como notificação. Toque para permitir que chamadas toquem em tela cheia.';

  @override
  String get encryption => 'Criptografar conteúdo';

  @override
  String get encryptionHelp =>
      'Mensagens, memórias, tickets, páginas e conhecimento são criptografados antes de serem armazenados, com a própria chave deste espaço de trabalho. A busca passa a encontrar por títulos e significado, não por palavras exatas no texto criptografado.';

  @override
  String get encryptionOff => 'Desativado';

  @override
  String get encryptionUnavailable =>
      'Indisponível: este servidor não tem chave de criptografia configurada';

  @override
  String get encryptionEncrypting =>
      'Ativando: criptografando o que já está armazenado';

  @override
  String get encryptionOnServer => 'Ativado, com a chave do servidor';

  @override
  String get encryptionOnKms => 'Ativado, com AWS KMS';

  @override
  String get encryptionDecrypting =>
      'Desativando: descriptografando o que está armazenado';

  @override
  String get encryptionConfirm =>
      'O conteúdo será criptografado com a chave deste espaço de trabalho. Se o espaço de trabalho for excluído, a chave é destruída e o conteúdo não poderá ser recuperado. A busca por palavra exata deixa de corresponder ao texto criptografado.';

  @override
  String get encryptionTurnOn => 'Ativar';

  @override
  String get encryptionRotate => 'Girar chave';

  @override
  String get encryptionKeyManaged =>
      'O Casama cria e guarda a chave deste espaço de trabalho para você, protegida pela própria chave do servidor. Não há nada para salvar ou copiar.';

  @override
  String get encryptionRotateTitle => 'Girar a chave?';

  @override
  String get encryptionRotateBody =>
      'A chave do espaço de trabalho é protegida novamente com a chave atual do servidor. Seu conteúdo continua legível e nada precisa ser criptografado de novo. Faça isso após trocar a chave do servidor ou periodicamente.';

  @override
  String get encryptionRotateHelp =>
      'Protege novamente a chave do espaço de trabalho com a chave atual do servidor';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Última rotação: $when';
  }

  @override
  String get memoryBackend => 'Onde a memória fica salva';

  @override
  String get memoryBuiltIn => 'Integrada';

  @override
  String get memoryBackendHelp => 'Memória de longo prazo dos bots';

  @override
  String get memoryBackendSheetHelp =>
      'Mantenha a memória dos seus bots no Honcho ou Supermemory com sua própria conta. A tela de memória, as exportações e a exclusão funcionam da mesma forma.';

  @override
  String get memoryHonchoWorkspace => 'Espaço de trabalho do Honcho';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Deixe vazio para usar um criado para este espaço de trabalho do Casama';

  @override
  String get memoryBaseUrl => 'Endereço do servidor (opcional)';

  @override
  String get memoryBaseUrlHelp =>
      'Apenas para Honcho ou Supermemory auto-hospedado';

  @override
  String get memoryCopyExisting => 'Copiar memórias atuais para lá';

  @override
  String get memoryUseBuiltIn => 'Usar memória integrada novamente';

  @override
  String get providerHintData => 'dados pagos (lugares, e-mails, SEO)';

  @override
  String get kindA2a => 'Agente de IA (A2A)';

  @override
  String get a2aAgentUrl => 'Endereço do agente ou URL do agent card';

  @override
  String get a2aAgentToken => 'Token de acesso (opcional)';

  @override
  String get a2a => 'Agent-to-Agent (A2A)';

  @override
  String get a2aHelp =>
      'Agentes externos podem passar tarefas para bots que você publicar.';

  @override
  String get chromeExtensionSwitch => 'Casama para Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Os membros podem usar a extensão do navegador com este espaço de trabalho.';

  @override
  String get chromeActSwitch => 'Bots nos navegadores dos membros';

  @override
  String get chromeActSwitchHelp =>
      'Os membros podem deixar os bots abrirem páginas e agirem no próprio Chrome, em um grupo de guias que podem interromper.';

  @override
  String get a2aPublish => 'Publicar como agente A2A';

  @override
  String get a2aPublishHelp =>
      'Agentes externos com uma chave de API do espaço de trabalho podem passar tarefas para este bot.';

  @override
  String get a2aWorkspaceOff =>
      'Ative o agent-to-agent nas configurações do espaço de trabalho primeiro.';

  @override
  String get a2aCardUrl => 'Agent card';

  @override
  String get phoneCalls => 'Chamadas telefônicas';

  @override
  String get phoneCallsHelp =>
      'Permita que os bots liguem para empresas para você pela sua conta Twilio. Toda chamada pede seu OK antes conforme as aprovações habituais.';

  @override
  String get twilioSid => 'Account SID';

  @override
  String get twilioToken => 'Token de autenticação';

  @override
  String get twilioFrom => 'As chamadas saem de';

  @override
  String get phoneCallsPersonal => 'Permitir ligar para números pessoais';

  @override
  String get phoneCallsCap => 'Chamadas por dia';

  @override
  String get phoneCallsOff => 'Não conectado';

  @override
  String get outCall => 'Ligar';

  @override
  String get outCallRinging => 'Chamando…';

  @override
  String get outCallLive => 'Na chamada';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Encerrada após ${secondsString}s';
  }

  @override
  String get outCallEndedByYou => 'Você encerrou a chamada';

  @override
  String get outCallTakenOver => 'Você assumiu a chamada';

  @override
  String get outCallFailed => 'Não completou';

  @override
  String get outCallNothingYet => 'Nada foi dito ainda.';

  @override
  String get outCallTakeOver => 'Assumir o controle';

  @override
  String get outCallEnd => 'Encerrar chamada';

  @override
  String get outCallYourPhone => 'Seu número de telefone';

  @override
  String get outCallYourPhoneHelp =>
      'Formato internacional, como +14155550123. Deixe vazio para usar o salvo.';

  @override
  String get payments => 'Pagamentos';

  @override
  String get paymentsHelp =>
      'Permita que bots paguem estabelecimentos com cartões virtuais de uso único que você aprova toda vez. Use sua própria conta Stripe Issuing.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent gastos neste mês de $cap';
  }

  @override
  String get paymentsSheetHelp =>
      'Cada cartão é aprovado por você com o valor exibido, funciona uma vez nesse estabelecimento por uma hora e nunca para valores mobiliários, cripto, cartões-presente ou transferências.';

  @override
  String get paymentsStripeKey => 'Chave secreta do Stripe (com Issuing)';

  @override
  String get paymentsWebhookSecret => 'Segredo de assinatura do webhook';

  @override
  String get paymentsWebhook => 'Aponte um webhook do Stripe para cá';

  @override
  String get paymentsCardholder => 'Nome nos cartões';

  @override
  String get paymentsAddress => 'Endereço de cobrança';

  @override
  String get paymentsCity => 'Cidade';

  @override
  String get paymentsState => 'Estado ou região';

  @override
  String get paymentsZip => 'CEP';

  @override
  String get paymentsCountry => 'País (2 letras)';

  @override
  String get paymentsCap => 'Limite do espaço de trabalho por mês (USD)';

  @override
  String get paymentsBotCap => 'Limite por bot por mês (USD)';

  @override
  String get links => 'Bots vinculados';

  @override
  String get linksRow => 'Vincule-se ao bot de um contato confiável';

  @override
  String get linksHelp =>
      'Seu bot pode pedir ao bot de um contato vinculado coisas como um horário para jantar. Cada bot responde seguindo as regras da própria pessoa e compartilha apenas o necessário; vocês dois veem cada troca.';

  @override
  String get linksEmpty => 'Nenhum bot vinculado ainda';

  @override
  String get linksInvite => 'Convidar um contato';

  @override
  String get linksContactName => 'Nome do contato';

  @override
  String get linksInviteReady => 'Enviar este convite';

  @override
  String get linksInviteHelp =>
      'Envie para o seu contato. Ele aceita no Casama com um dos bots dele. Funciona uma vez, por 7 dias.';

  @override
  String get linksAccept => 'Aceitar convite';

  @override
  String get linksAcceptHelp =>
      'Cole o convite que seu contato enviou para você.';

  @override
  String get linksInviteText => 'Convite';

  @override
  String linksActive(String bot) {
    return 'Vinculado a $bot';
  }

  @override
  String get linksPending => 'Aguardando seu contato aceitar';

  @override
  String get linksRevoked => 'Desvinculado';

  @override
  String get linksExchanges => 'Trocas';

  @override
  String get linksNoExchanges => 'Nada perguntado ainda.';

  @override
  String get linksNoAnswer => 'Sem resposta';

  @override
  String get linksWorking => 'Trabalhando…';

  @override
  String get linksRevoke => 'Desvincular';

  @override
  String get wakeWord => 'Palavra de ativação';

  @override
  String get wakeWordRow =>
      'Diga uma frase para iniciar uma chamada com um bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'Ouvindo “$phrase”';
  }

  @override
  String get wakeWordHelp =>
      'Enquanto o Casama estiver aberto, este dispositivo ouve sua frase e inicia uma chamada ao vivo com o bot que você escolher.';

  @override
  String get wakeWordListen => 'Ouvir a palavra de ativação';

  @override
  String get wakeWordPhrase => 'Frase';

  @override
  String get wakeWordPhraseHelp => 'Duas ou três palavras, como “ei casama”';

  @override
  String get wakeWordBot => 'Chamar este bot';

  @override
  String get wakeWordDownloading => 'Baixando o modelo local…';

  @override
  String get wakeWordTest => 'Testar frase';

  @override
  String get wakeWordTesting => 'Ouvindo… diga sua frase';

  @override
  String get wakeWordHeard => 'Ouviu!';

  @override
  String get wakeWordStopTest => 'Parar';

  @override
  String get wakeWordPrivacy =>
      'A escuta acontece neste dispositivo com um modelo de código aberto (cerca de 18 MB, baixado uma vez). Nada é enviado a lugar nenhum até a chamada começar.';

  @override
  String get secretStore => 'Onde os segredos ficam salvos';

  @override
  String get secretStoreVault => 'Cofre deste servidor';

  @override
  String get secretStoreHelp =>
      'Mantenha os segredos nomeados dos bots no seu próprio projeto Infisical. O Casama guarda apenas o nome de cada segredo e onde ele pode ser usado.';

  @override
  String get secretStoreSite => 'Endereço do Infisical';

  @override
  String get secretStoreProject => 'ID do projeto';

  @override
  String get secretStoreEnv => 'Ambiente';

  @override
  String get secretStoreClientId => 'Client ID da identidade de máquina';

  @override
  String get secretStoreClientSecret => 'Client secret';

  @override
  String get secretStoreMove => 'Mover segredos atuais para o Infisical';

  @override
  String get secretStoreBack => 'Usar o cofre deste servidor novamente';

  @override
  String get localServer => 'Executar o Casama neste computador';

  @override
  String get setupTitleMac => 'Configurar o Casama neste Mac';

  @override
  String get setupTitle => 'Configurar o Casama neste computador';

  @override
  String get setupEntryMac => 'Executar neste Mac';

  @override
  String get setupEntry => 'Executar neste computador';

  @override
  String get setupEntryHelp =>
      'Seu próprio servidor privado neste computador. Grátis para uso pessoal.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Servidor';

  @override
  String get setupStepAccount => 'Conta';

  @override
  String get setupStepModel => 'Modelo de IA';

  @override
  String get setupStepPhone => 'Celular';

  @override
  String get setupDockerChecking => 'Verificando o Docker…';

  @override
  String get setupDockerMissingTitle => 'Primeiro, instale o Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'O servidor do Casama roda dentro do Docker Desktop, um app gratuito que o mantém separado do resto do seu Mac.';

  @override
  String get setupDockerMissingBodyLinux =>
      'O servidor do Casama roda dentro do Docker, que o mantém separado do resto do seu computador.';

  @override
  String get setupDockerGetMac => 'Baixar Docker Desktop';

  @override
  String get setupDockerGetLinux => 'Abrir guia de instalação do Docker';

  @override
  String get setupDockerStep1 =>
      'Abra o arquivo baixado e arraste o Docker para Aplicativos.';

  @override
  String get setupDockerStep2 => 'Abra o Docker e aceite os termos.';

  @override
  String get setupDockerStep3 => 'Volte para cá. Esta página continua sozinha.';

  @override
  String get setupDockerWaiting => 'Aguardando o Docker…';

  @override
  String get setupDockerStoppedTitle => 'O Docker precisa estar em execução';

  @override
  String get setupDockerStoppedBodyMac =>
      'O Docker está instalado, mas não está aberto. Depois que iniciar, o que pode levar um minuto, esta página continua sozinha.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'O Docker está instalado, mas não está em execução. Inicie com este comando e esta página continua sozinha.';

  @override
  String get setupDockerOpen => 'Abrir Docker';

  @override
  String get setupDockerOpening => 'Iniciando o Docker…';

  @override
  String get setupDockerPermissionTitle => 'O Docker precisa da sua permissão';

  @override
  String get setupDockerPermissionBody =>
      'O Docker está rodando, mas seu usuário não tem permissão para usá-lo. Execute este comando e depois saia e entre novamente na sessão.';

  @override
  String get setupDockerComposeTitle => 'O Docker está sem o Compose';

  @override
  String get setupDockerComposeBody =>
      'Este Docker não tem o Compose v2. O Docker Desktop já inclui; no Linux, instale o pacote docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Pulado';

  @override
  String get setupArtDocker => 'Primeiro, a caixa onde seu servidor mora.';

  @override
  String get setupArtServer => 'Construindo sua casa. Esta é a parte demorada.';

  @override
  String get setupArtAccount => 'Seu servidor está rodando!';

  @override
  String get setupArtModel => 'Agora dê um cérebro a ele.';

  @override
  String get setupArtPhone => 'Último passo: leve com você.';

  @override
  String get setupDockerSlowTitle => 'Está demorando?';

  @override
  String get setupDockerSlowMenuBar =>
      'Procure a baleia na barra de menus. O Docker estará pronto quando parar de se mexer.';

  @override
  String get setupDockerSlowTerms =>
      'Se o Docker mostrar uma janela pedindo para aceitar os termos, conclua isso primeiro. Entrar no Docker é opcional.';

  @override
  String get setupDockerSlowRestart =>
      'Ainda travado? Encerre o Docker pelo menu dele e pressione Verificar novamente.';

  @override
  String get setupDockerSlowInstalled =>
      'Já instalou? Abra o Docker uma vez em Aplicativos para ele se configurar.';

  @override
  String get setupDockerSlowOther =>
      'Usando OrbStack ou Colima em vez disso? Inicie-o. O Casama funciona com qualquer Docker que responda a docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Execute docker info no terminal para ver o que o Docker responde.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'O Docker disse: $detail';
  }

  @override
  String get setupDockerRecheck => 'Verificar novamente';

  @override
  String get setupDockerGuide => 'Guia de solução de problemas';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Apenas $gb GB de espaço em disco livres. O servidor precisa de cerca de $need GB.';
  }

  @override
  String get setupServerTitle => 'Baixar e iniciar seu servidor';

  @override
  String get setupServerBody =>
      'Um download de cerca de 2,5 GB que leva de 5 a 10 minutos na primeira vez, e cerca de 10 GB em disco após configurar. Você pode continuar usando seu computador.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Um download de $download GB e cerca de $disk GB em disco após configurar. A primeira vez leva de 5 a 10 minutos. Você pode continuar usando seu computador.';
  }

  @override
  String get setupServerBodyNothing =>
      'Tudo o que ele precisa já está neste computador, então inicia em um ou dois minutos.';

  @override
  String get setupServerStart => 'Iniciar';

  @override
  String get setupServerStageDownload => 'Baixando o servidor';

  @override
  String get setupServerStagePrepare => 'Preparando';

  @override
  String get setupServerStageParts => 'Baixando os componentes';

  @override
  String setupServerDownloaded(int megabytes) {
    return '$megabytes MB até agora';
  }

  @override
  String get setupServerStagePartsNote => 'O passo mais demorado';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$done de $total baixados até agora';
  }

  @override
  String get setupServerStageStart => 'Iniciando';

  @override
  String get setupServerStageWait => 'Aguardando resposta';

  @override
  String get setupServerKeepOpen =>
      'Mantenha o Casama aberto até isso terminar.';

  @override
  String get setupServerFailed => 'O servidor não iniciou.';

  @override
  String get setupServerConnecting => 'Pronto. Conectando…';

  @override
  String get setupShowDetails => 'Mostrar detalhes';

  @override
  String get setupHideDetails => 'Ocultar detalhes';

  @override
  String get setupAccountTitle => 'Crie sua conta';

  @override
  String get setupAccountBody =>
      'Ela fica apenas neste computador e é dona deste servidor. Nenhum e-mail é enviado.';

  @override
  String get setupAccountName => 'Seu nome';

  @override
  String get setupAccountNameMissing => 'Digite seu nome';

  @override
  String get setupAccountCreate => 'Criar conta';

  @override
  String get setupAccountHave => 'Já tenho uma conta aqui';

  @override
  String get setupAccountNew => 'Criar uma nova conta';

  @override
  String get setupAccountSignInTitle => 'Entre no seu servidor';

  @override
  String get setupAccountSignInBody =>
      'Use a conta que você criou neste servidor.';

  @override
  String get setupAccountClosed =>
      'Este servidor já tem proprietário. Entre com essa conta.';

  @override
  String get setupAccountPreparing => 'Preparando seu espaço…';

  @override
  String get setupModelTitle => 'Dê um modelo aos seus bots';

  @override
  String get setupModelBody =>
      'Os bots precisam de um modelo de IA para pensar. Entre com um plano do ChatGPT ou cole uma chave do OpenRouter, Google ou outro provedor.';

  @override
  String get setupSkip => 'Pular por enquanto';

  @override
  String get setupPhoneTitle => 'Conectar seu celular';

  @override
  String get setupPhoneBody =>
      'O Casama Link dá a este computador um endereço privado, para que seu celular chegue até ele de qualquer lugar. Você aprova uma vez com uma conta gratuita do Casama Cloud. Seus chats ficam neste computador.';

  @override
  String get setupPhoneTurnOn => 'Dar um endereço a este computador';

  @override
  String get setupPhoneScanTitle => 'Escaneie isto com a câmera do seu celular';

  @override
  String get setupPhoneScanBody =>
      'Isso abre o Casama no celular e faz o login. Se o Casama ainda não estiver no celular, a página que abrir mostra onde baixar.';

  @override
  String get setupPhoneWaiting => 'Aguardando seu celular…';

  @override
  String get setupPhoneConnected => 'Celular conectado';

  @override
  String get setupPhoneConnectedBody =>
      'Seu celular está conectado. Mostre um novo código para adicionar outro dispositivo.';

  @override
  String get setupPhoneOwnerOnly =>
      'Apenas o proprietário deste servidor pode dar um endereço a ele.';

  @override
  String get setupFinish => 'Concluir';

  @override
  String get setupCardTitle => 'Concluir configuração';

  @override
  String get setupCardModel =>
      'Adicione um modelo de IA para seus bots poderem responder.';

  @override
  String get setupCardPhone => 'Conecte seu celular a este computador.';

  @override
  String get setupCardOpen => 'Continuar configuração';

  @override
  String get desktopUsers => 'Usuários na área de trabalho ao mesmo tempo';

  @override
  String get desktopUsersHelp =>
      'Os bots neste computador da equipe compartilham uma tela. Os outros aguardam (e continuam trabalhando no terminal, arquivos e navegador) enquanto estiver em uso.';

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
      'calendar': '$bot gostaria de usar sua agenda',
      'reminders': '$bot gostaria de usar seus lembretes',
      'contacts': '$bot gostaria de usar seus contatos',
      'places': '$bot gostaria de usar seus lugares',
      'photos': '$bot gostaria de usar suas fotos',
      'health': '$bot gostaria de usar seus dados de saúde',
      'notifications': '$bot gostaria de usar suas notificações',
      'activity': '$bot gostaria de usar sua atividade no computador',
      'browserTab': '$bot gostaria de usar sua guia atual do navegador',
      'browserHistory':
          '$bot gostaria de usar seu histórico e favoritos do navegador',
      'alarm': '$bot gostaria de usar seus alarmes',
      'home': '$bot gostaria de usar seus acessórios do app Casa',
      'other': '$bot gostaria de usar os dados do seu dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Apenas nos seus próprios chats. Você pode interromper a qualquer momento em Configurações → Conexões do dispositivo.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Permitido usar sua agenda',
      'reminders': 'Permitido usar seus lembretes',
      'contacts': 'Permitido usar seus contatos',
      'places': 'Permitido usar seus lugares',
      'photos': 'Permitido usar suas fotos',
      'health': 'Permitido usar seus dados de saúde',
      'notifications': 'Permitido usar suas notificações',
      'activity': 'Permitido usar sua atividade no computador',
      'browserTab': 'Permitido usar sua guia atual do navegador',
      'browserHistory': 'Permitido usar seu histórico e favoritos do navegador',
      'alarm': 'Permitido usar seus alarmes',
      'home': 'Permitido usar seus acessórios do app Casa',
      'other': 'Permitido usar os dados do seu dispositivo',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Não compartilhado';

  @override
  String get deviceKindCalendar => 'agenda';

  @override
  String get deviceKindReminders => 'lembretes';

  @override
  String get deviceKindContacts => 'contatos';

  @override
  String get deviceKindPlaces => 'lugares';

  @override
  String get deviceKindPhotos => 'fotos';

  @override
  String get deviceKindHealth => 'dados de saúde';

  @override
  String get deviceKindNotifications => 'notificações';

  @override
  String get deviceKindActivity => 'atividade no computador';

  @override
  String get deviceKindBrowserTab => 'guia atual do navegador';

  @override
  String get deviceKindBrowserHistory => 'histórico e favoritos do navegador';

  @override
  String get deviceKindAlarm => 'alarmes';

  @override
  String get deviceKindHome => 'acessórios do app Casa';

  @override
  String get deviceBrowserAsks => 'O que os bots podem pedir ao navegador';

  @override
  String get deviceBrowserAsksHelp =>
      'O Casama para Chrome responde ao vivo e nada é guardado. Ative ou desative nas configurações da extensão.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Parar de deixar $bot perguntar';
  }

  @override
  String get deviceConnections => 'Conexões do dispositivo';

  @override
  String get deviceConnectionsHelp =>
      'Compartilhe dados deste dispositivo com seus bots. Cada tipo fica desativado até você ativar, e apenas bots que você permitir podem ler, somente nos seus próprios chats.';

  @override
  String get deviceConnectionsNone =>
      'Este dispositivo ainda não pode compartilhar dados. No celular, abra o Casama e ative o que quiser compartilhar.';

  @override
  String get deviceKeepFor => 'Manter por';

  @override
  String get deviceKeepLiveOnly => 'Apenas ao vivo';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString dias',
      one: '$countString dia',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Apenas modelos privados';

  @override
  String get devicePrivateModelHelp =>
      'Apenas bots em um modelo local podem ler';

  @override
  String get deviceNoBots =>
      'Nenhum bot ainda. Um bot pede quando precisa disso, ou permita um agora.';

  @override
  String get deviceAllowBot => 'Permitir um bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Qual bot pode ler sua agenda?',
      'reminders': 'Qual bot pode ler seus lembretes?',
      'contacts': 'Qual bot pode ler seus contatos?',
      'places': 'Qual bot pode ler seus lugares?',
      'photos': 'Qual bot pode ler suas fotos?',
      'health': 'Qual bot pode ler seus dados de saúde?',
      'notifications': 'Qual bot pode ler suas notificações?',
      'activity': 'Qual bot pode ler sua atividade no computador?',
      'browserTab': 'Qual bot pode ler sua guia atual do navegador?',
      'browserHistory':
          'Qual bot pode ler seu histórico e favoritos do navegador?',
      'alarm': 'Qual bot pode ler seus alarmes?',
      'home': 'Qual bot pode ler seus acessórios do app Casa?',
      'other': 'Qual bot pode ler os dados do seu dispositivo?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'O Casama não tem permissão. Permita nas configurações do sistema e tente novamente.';

  @override
  String get deviceOtherDevices => 'Seus outros dispositivos';

  @override
  String get deviceForget => 'Esquecer este dispositivo';

  @override
  String get deviceBrowsers => 'Navegadores que os bots podem usar';

  @override
  String get deviceBrowsersHelp =>
      'Pareado no Casama para Chrome. Os bots que você permitiu trabalham lá no próprio grupo de guias, conectados como você.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bots',
      one: '$count bot',
      zero: 'Nenhum bot ainda',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Online';

  @override
  String get deviceBrowserOffline => 'Offline';

  @override
  String get deviceBrowserUnpair => 'Desparear este navegador';

  @override
  String get deviceBrowserAllBots => 'Todos os bots';

  @override
  String get deviceChromeNotPaired => 'Casama para Chrome: não pareado';

  @override
  String get deviceChromeHowToPair =>
      'Instale o Casama para Chrome, entre na conta e abra Mais → “Deixar bots usarem este navegador”.';

  @override
  String get deviceConnectionsRowHelp =>
      'Agenda, contatos e mais deste dispositivo';

  @override
  String get healthExtraCycle => 'Monitoramento de ciclo';

  @override
  String get healthExtraGlucose => 'Glicemia';

  @override
  String get healthExtraBloodPressure => 'Pressão arterial';

  @override
  String get appleHealth => 'Apple Health';

  @override
  String get appleHealthAbout =>
      'Lê resumos diários de sono, atividade, treinos e coração do Apple Health (HealthKit), apenas quando isto está ativado. O Casama nunca grava no Apple Health.';

  @override
  String get healthNotMedical =>
      'Apenas resumos diários (sono, atividade, treinos, coração). Os bots descrevem como você se compara ao seu habitual e nunca dão orientações médicas.';

  @override
  String get healthNeedsEncryption =>
      'Dados de saúde precisam de criptografia em repouso. Ative para um espaço de trabalho do qual você é proprietário e tente novamente.';

  @override
  String get placeAddHere => 'Adicionar onde estou agora';

  @override
  String get placeName => 'Nomeie este lugar (Casa, Trabalho, Academia)';

  @override
  String get placeNoLocation =>
      'Sua localização não está disponível. Permita localização para o Casama e tente novamente.';

  @override
  String get placesHelp =>
      'Os bots ficam sabendo quando você chega ou sai destes lugares. Apenas o nome do lugar e o horário são compartilhados, nunca seu trajeto.';

  @override
  String get watchedAppsHelp =>
      'Apenas notificações destes apps são compartilhadas. Códigos de uso único são ocultados antes que qualquer coisa saia do celular.';

  @override
  String get watchedAppAdd => 'Adicionar app (nome ou ID do pacote)';

  @override
  String get providerHintMaps => 'tempos de deslocamento para sair agora';

  @override
  String routineDevice(String event, String detail) {
    return 'No seu celular: $event $detail';
  }

  @override
  String get ctxSelection => 'Texto selecionado';

  @override
  String get ctxAddScreenshot => 'Adicionar captura de tela';

  @override
  String get ctxScreenshotAdded => 'Captura de tela adicionada';

  @override
  String get ctxScreenshotFailed =>
      'Não foi possível capturar a tela. Permita gravação de tela para o Casama nas configurações do sistema.';

  @override
  String get watchedFolders => 'Pastas monitoradas';

  @override
  String get watchedFoldersHelp =>
      'Um novo arquivo em uma destas pastas pode iniciar uma rotina (por exemplo, arquivar novos PDFs em Downloads). Apenas o nome é compartilhado; os bots só leem o arquivo se trabalharem neste computador.';

  @override
  String get whyTitle => 'Por que estou vendo isso?';

  @override
  String whyData(String data) {
    return 'Usado: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Urgência: $urgency';
  }

  @override
  String get heldMeeting =>
      'Ele aguardou enquanto você estava em uma reunião e veio com seu resumo.';

  @override
  String get heldFocus =>
      'Ele aguardou enquanto o Foco estava ativado e veio com seu resumo.';

  @override
  String get heldDriving =>
      'Ele aguardou enquanto você dirigia e veio com seu resumo.';

  @override
  String get heldCap =>
      'O bot já havia enviado 5 mensagens hoje, então esta aguardou pelo seu resumo.';

  @override
  String get heldLow =>
      'Não era urgente, então aguardou pelo seu resumo em vez de vibrar seu celular.';

  @override
  String get lessLikeThis => 'Menos como isto';

  @override
  String get lessLikeThisDone => 'Entendi, menos itens assim';

  @override
  String get widgetStatusWorking => 'Trabalhando…';

  @override
  String get widgetStatusOff => 'Desativado';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner =>
      'Suspenso pelo proprietário da instância';

  @override
  String get previewHi => 'Oi!';

  @override
  String get previewAsk => 'Pode organizar minhas notas?';

  @override
  String get previewOnIt => 'Pode deixar';

  @override
  String get previewDone => 'Pronto! Agora estão em três pastas.';

  @override
  String get previewMessage => 'Mensagem';

  @override
  String get fontPreviewGreeting => 'Bom dia';

  @override
  String get photosFromUnsplash => 'Fotos do Unsplash';

  @override
  String get showBotSteps => 'Mostrar passos do bot';

  @override
  String get showBotStepsHelp => 'Comandos e erros técnicos em cada chat.';

  @override
  String get showScreenCard => 'Mostrar tela do bot enquanto ele trabalha';

  @override
  String get showScreenCardHelp =>
      'Um pequeno cartão ao vivo no chat. Toque nele para assistir em tela cheia.';

  @override
  String get showReplyUsage => 'Mostrar uso nas respostas';

  @override
  String get showReplyUsageHelp =>
      'Quanto cada resposta custou, em uma linha abaixo dela.';

  @override
  String get openLinksInApp => 'Abrir links no app';

  @override
  String get openLinksInAppHelp =>
      'Links da web abrem em um navegador dentro do Casama. Desativado: abrem no seu navegador padrão.';

  @override
  String replyUsageTokens(String count) {
    return '$count tokens';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount nas suas chaves';
  }

  @override
  String get replyUsageOnPlan => 'No seu plano do ChatGPT';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount até agora';
  }

  @override
  String get replyUsageTooltip => 'Quanto esta resposta custou';

  @override
  String get replyUsageTitle => 'Quanto esta resposta custou';

  @override
  String get replyUsageFromCredits => 'Dos seus créditos';

  @override
  String get replyUsageYourKeys => 'Nas suas próprias chaves';

  @override
  String get replyUsageTotal => 'Total';

  @override
  String get replyUsageTime => 'Tempo';

  @override
  String get replyUsageTokensLabel => 'Tokens';

  @override
  String get replyUsageSteps => 'Passos';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Inclui $n execuções auxiliares',
      one: 'Inclui $n execução auxiliar',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'Nada foi cobrado por esta resposta.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 crédito = $price. Suas próprias chaves e planos são cobrados pelo provedor deles, não pelo Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Abrir execução';

  @override
  String get replyUsageLoadFailed =>
      'Não foi possível carregar o uso desta resposta.';

  @override
  String get replyUsageOurCost => 'Nosso custo';

  @override
  String get replyUsageMargin => 'Margem';

  @override
  String replyUsageItemCost(String amount) {
    return 'Nosso custo $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Nosso custo e margem são exibidos para você porque você administra este servidor. Ninguém mais os vê.';

  @override
  String get kindSpeechToText => 'Voz para texto';

  @override
  String get kindVoice => 'Chamadas de voz';

  @override
  String get kindImages => 'Imagens';

  @override
  String get kindVideo => 'Vídeo';

  @override
  String get kindSearch => 'Buscas na web';

  @override
  String get kindData => 'Consultas de dados';

  @override
  String get kindPhone => 'Chamadas telefônicas';

  @override
  String get kindApps => 'Ações em apps';

  @override
  String get activityReady => 'Preparando…';

  @override
  String get activitySearching => 'Pesquisando na web…';

  @override
  String get activityBrowsing => 'Navegando na web…';

  @override
  String get activityComputer => 'Trabalhando no computador dele…';

  @override
  String get activityFiles => 'Verificando arquivos…';

  @override
  String get activityImage => 'Criando uma imagem…';

  @override
  String get activityVideo => 'Criando um vídeo…';

  @override
  String get activityMemory => 'Consultando o que sabe…';

  @override
  String get activityApps => 'Usando seus apps…';

  @override
  String get activityScheduling => 'Configurando uma agenda…';

  @override
  String get activityWorking => 'Trabalhando nisso…';

  @override
  String get activityWaitingForScreen =>
      'Aguardando você devolver o controle da tela…';

  @override
  String get runFailedPlain =>
      'Algo deu errado. Tente novamente ou abra Detalhes para ver o motivo.';

  @override
  String get newKeyTitle => 'Copie sua nova chave';

  @override
  String get newKeyHelp =>
      'Ela é exibida apenas esta vez. Cole no app que você está conectando e toque em Concluído.';

  @override
  String get copyKey => 'Copiar chave';

  @override
  String get keyCopied => 'Chave copiada';

  @override
  String revokeApiKeyTitle(String name) {
    return 'Revogar “$name”?';
  }

  @override
  String get revokeApiKeyBody =>
      'Apps que usam esta chave param de conectar na hora. Isso não pode ser desfeito; para reconectar, crie uma nova chave.';

  @override
  String unlinkTitle(String name) {
    return 'Desvincular “$name”?';
  }

  @override
  String get unlinkBody =>
      'Os bots param de conversar entre si na hora. Vincular novamente exige um novo convite.';

  @override
  String get alreadyMember => 'Você já está neste espaço de trabalho.';

  @override
  String get askAdminToInvite =>
      'Apenas proprietários e admins podem convidar pessoas. Peça um link de convite a um deles.';

  @override
  String get askBeforeJoining => 'Perguntar antes de alguém entrar';

  @override
  String get askBeforeJoiningHelp =>
      'Um admin aprova cada pessoa que usar o link.';

  @override
  String get askToJoin => 'Pedir para entrar';

  @override
  String get customLinks => 'Links personalizados';

  @override
  String get customLinksHelp =>
      'Links com própria função, validade ou número de usos.';

  @override
  String get emailAddresses => 'Endereços de e-mail';

  @override
  String get emailAddressesHelp =>
      'Cole um ou mais, separados por vírgulas ou quebras de linha.';

  @override
  String get getCode => 'Obter código';

  @override
  String get getNewCode => 'Obter novo código';

  @override
  String get getStarted => 'Começar';

  @override
  String get welcomeCta => 'Vamos lá';

  @override
  String get inviteAsAdmin => 'Convidar como admins';

  @override
  String get inviteByEmail => 'Convidar por e-mail';

  @override
  String get inviteExpired => 'Expirado';

  @override
  String inviteExpires(String when) {
    return 'Expira $when';
  }

  @override
  String get inviteInvalid => 'Este convite não funciona';

  @override
  String get inviteInvalidHelp =>
      'Ele pode ter expirado, esgotado os usos ou sido desativado. Peça um novo.';

  @override
  String get inviteLink => 'Link de convite';

  @override
  String get inviteLinkApprovalHelp =>
      'Qualquer pessoa com este link pode pedir para entrar. Você aprova abaixo.';

  @override
  String get inviteLinkHelp =>
      'Qualquer pessoa com este link pode entrar como membro. Compartilhe em um chat ou e-mail.';

  @override
  String get inviteLinkOrCode => 'Link ou código de convite';

  @override
  String inviteOtherServer(String host) {
    return 'Este convite é para $host, e este app está conectado a outro servidor.';
  }

  @override
  String get inviteRenewed =>
      'O convite funciona por mais 7 dias. Envie o novo link para a pessoa.';

  @override
  String inviteSentTo(String email) {
    return 'Entre com $email para aceitar.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Entre em $workspace no Casama: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name convidou você para entrar';
  }

  @override
  String get invitedToJoin => 'Você recebeu um convite para entrar';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString convites enviados.',
      one: '$countString convite enviado.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Você entrará como admin';

  @override
  String get joinAsMember => 'Você entrará como membro';

  @override
  String get joinByDomain => 'Entrar por domínio de e-mail';

  @override
  String get joinByDomainHelp => 'Endereços verificados entram sem convite.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Qualquer pessoa com um e-mail @$domain verificado pode entrar';
  }

  @override
  String get joinByDomainUnavailable =>
      'Disponível quando você entra com um e-mail corporativo verificado (não gmail.com e semelhantes).';

  @override
  String get joinNeedsApproval =>
      'Um admin aprova novas pessoas antes de entrarem.';

  @override
  String get joinRequestSent => 'Solicitação enviada';

  @override
  String joinRequestSentHelp(String name) {
    return 'Um admin de $name vai analisar o pedido. Você receberá uma notificação quando entrar.';
  }

  @override
  String get joinWithLinkOrCode => 'Entrar com link ou código';

  @override
  String get spacesInvite => 'Convidar pessoas';

  @override
  String spacesInviteTo(String name) {
    return 'Para $name';
  }

  @override
  String get spacesNew => 'Novo espaço de trabalho';

  @override
  String get spacesNewHint => 'Seus próprios bots, pessoas e cobrança';

  @override
  String get spacesJoin => 'Entrar em um espaço de trabalho';

  @override
  String get spacesJoinHint => 'Com um link ou código de convite';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Entrar em $name';
  }

  @override
  String get joinedBotsHelp =>
      'Estes bots estão aqui para ajudar. Diga olá para um deles para começar.';

  @override
  String get joinedNoBots =>
      'Ainda não há bots aqui. Crie um ou dê uma olhada antes.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString membros',
      one: '$countString membro',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Membros';

  @override
  String openToDomain(String domain) {
    return 'Aberto para @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Abrir $name';
  }

  @override
  String get pendingInvites => 'Convites ainda não aceitos';

  @override
  String get people => 'Pessoas';

  @override
  String get workspaceAdvancedSummary =>
      'Segredos, memória, criptografia, pagamentos, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Código de convite, domínio de e-mail, links personalizados';

  @override
  String get inviteLinkToCopy => 'Link de convite pronto para copiar';

  @override
  String linkMade(String when) {
    return 'Criado $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Cobranças por servidor, servidores do Casama Link e chaves';

  @override
  String get billingChargesSummary => 'Cobranças por servidor';

  @override
  String get billingUsageRow => 'O que os bots usaram e quanto custou';

  @override
  String billingUsageSoFar(String amount) {
    return 'Neste mês até agora: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Contagem de tokens, exportação JSON';

  @override
  String get peopleHelp => 'Convide pessoas e decida quem entra.';

  @override
  String get peopleRow => 'Convidar pessoas, aprovar solicitações, ver membros';

  @override
  String get qrCode => 'Código QR';

  @override
  String get remove => 'Remover';

  @override
  String get resendInvite => 'Enviar novamente';

  @override
  String get resetLink => 'Redefinir link';

  @override
  String get resetLinkHelp =>
      'O link atual para de funcionar na hora e você recebe um novo. Quem já está dentro continua.';

  @override
  String get revokeInvite => 'Cancelar convite';

  @override
  String scanToJoin(String name) {
    return 'Escaneie para entrar em $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Enviar $countString convites';
  }

  @override
  String get sendInvitesYourself => 'Envie estes convites você mesmo';

  @override
  String get sendInvitesYourselfHelp =>
      'O e-mail não está configurado neste servidor. Envie o link para cada pessoa e ela entra com esse endereço.';

  @override
  String get signInToJoin => 'Entrar para participar';

  @override
  String get startOwnWorkspace => 'Iniciar meu próprio espaço de trabalho';

  @override
  String switchToServer(String host) {
    return 'Mudar para $host';
  }

  @override
  String get waitingToJoin => 'Aguardando aprovação';

  @override
  String welcomeToWorkspace(String name) {
    return 'Boas-vindas a $name';
  }

  @override
  String get workspacesYouCanJoin => 'Espaços de trabalho disponíveis';

  @override
  String get yourTeamIsHere => 'Sua equipe já está aqui';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Pessoas em $domain usam estes espaços de trabalho. Entre em um ou crie o seu.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Fácil de ler em voz alta ou digitar. Funciona por 48 horas. As pessoas digitam em Entrar com link ou código.';

  @override
  String get inviteSomeoneNew =>
      'Convidar alguém novo para o espaço de trabalho';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app só faz login em um endereço seguro (https), e este servidor Casama está em $address. Sirva o Casama por https para usar o login.';
  }

  @override
  String get aboutYou => 'Sobre você';

  @override
  String get aboutYouRow =>
      'Como seus bots chamam você e o que sabem sobre você';

  @override
  String get aboutYouIntro =>
      'Seus bots leem isto para chamar você pelo nome e responder do jeito que você gosta. Só você vê.';

  @override
  String get photoChange => 'Alterar foto de perfil';

  @override
  String get photoTake => 'Tirar foto';

  @override
  String get photoChoose => 'Escolher foto';

  @override
  String get photoUseGoogle => 'Usar minha foto do Google';

  @override
  String get photoRemove => 'Remover foto';

  @override
  String get photoUnreadable =>
      'Esse arquivo não é uma foto que o Casama possa usar. Tente um JPEG ou PNG.';

  @override
  String get whatToCallYou => 'Como os bots devem chamar você?';

  @override
  String get pronounsOptional => 'Pronomes (opcional)';

  @override
  String get aboutMe => 'Sobre mim';

  @override
  String get aboutMeHint =>
      'Seu trabalho, as pessoas na sua vida, do que você gosta. Qualquer coisa que ajude.';

  @override
  String get replyStyle => 'Como prefiro as respostas';

  @override
  String get replyStyleHint =>
      'Por exemplo: respostas curtas, sem emojis, explique como se fosse novidade para mim';

  @override
  String get learnAboutMe => 'Aprender sobre mim nos chats';

  @override
  String get learnAboutMeHelp =>
      'Os bots salvam fatos sobre você. Edite a qualquer momento.';

  @override
  String get adultSites => 'Sites adultos';

  @override
  String get adultSitesHelp =>
      'Os bots podem abrir sites adultos quando você pedir. Apenas para maiores de 18 anos.';

  @override
  String get adultSitesConfirmTitle => 'Ativar sites adultos?';

  @override
  String get adultSitesConfirmBody =>
      'Você confirma que tem 18 anos ou mais. Quando você pedir, os bots podem abrir sites adultos para você e listar o conteúdo em texto. Funciona quando você pede no Casama na web ou no app para computador, nunca em chats compartilhados.';

  @override
  String get adultSitesConfirm => 'Tenho 18 anos ou mais';

  @override
  String get adultSitesApprovalDetail =>
      'Permitir significa que você confirma ter 18 anos ou mais e ativa sites adultos para sua conta. Você pode desativar em Sobre você.';

  @override
  String useInThisSpace(String workspace) {
    return 'Usar o que compartilhei em $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Desativado: apenas seu nome e estilo de resposta são usados aqui.';

  @override
  String get learnedAboutYou => 'O que os bots aprenderam';

  @override
  String get noLearnedFacts =>
      'Nada ainda. Fatos que os bots aprendem sobre você no chat aparecem aqui.';

  @override
  String get addFact => 'Adicionar fato';

  @override
  String get editFact => 'Editar fato';

  @override
  String get deleteFactTitle => 'Excluir este fato?';

  @override
  String get deleteFactConfirm => 'Seus bots não saberão mais disso.';

  @override
  String get importToProfile => 'Importar do ChatGPT ou Claude';

  @override
  String get savedToProfile => 'Salvo no seu perfil';

  @override
  String get undo => 'Desfazer';

  @override
  String get suggestedLookApplied => 'Novo tema aplicado';

  @override
  String get suggestedLookUnavailable => 'Este app não tem esse tema';

  @override
  String get removedFromProfile => 'Removido do seu perfil';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString fatos adicionados',
      one: '$countString fato adicionado',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Seus bots usarão isso em todo espaço de trabalho. Você pode mudar depois em Configurações → Sobre você.';

  @override
  String get nameStepBubble => 'Prazer em conhecer você!';

  @override
  String get heardFromTitle => 'Como você ficou sabendo da gente?';

  @override
  String get heardFromHelp =>
      'Um toque nos ajuda a ver o que está funcionando. Você pode pular.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Um amigo';

  @override
  String get heardFromSearch => 'Busca';

  @override
  String get heardFromAiAssistant => 'Um assistente de IA';

  @override
  String get heardFromOther => 'Outro';

  @override
  String get heardFromSkip => 'Pular';

  @override
  String get nameStepHint => 'Seu nome';

  @override
  String get skillCatalogSubtitle =>
      'Habilidades prontas que seus bots carregam quando uma tarefa pede.';

  @override
  String get skillCategoryWork => 'Trabalho';

  @override
  String get skillCategoryWriting => 'Escrita';

  @override
  String get skillCategoryResearch => 'Pesquisa';

  @override
  String get skillCategoryData => 'Dados';

  @override
  String get skillCategoryMoney => 'Finanças';

  @override
  String get skillCategoryBuild => 'Criação';

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
      one: '$countString habilidade',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Instalada';

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
    return 'Os bots carregam sozinhos quando a tarefa combina, ou digite /$name no chat para usar.';
  }

  @override
  String get skillInstructions => 'Instruções';

  @override
  String get skillAlreadyEverywhere => 'Instalada em todo lugar possível.';

  @override
  String get gallery => 'Galeria';

  @override
  String get galleryEmpty => 'Nada na galeria corresponde.';

  @override
  String get galleryOffline =>
      'Não foi possível acessar a galeria agora. Os visuais e habilidades integrados continuam aqui.';

  @override
  String get galleryUse => 'Usar';

  @override
  String get galleryInstall => 'Instalar';

  @override
  String get galleryReport => 'Denunciar';

  @override
  String get galleryShare => 'Compartilhar na Galeria';

  @override
  String galleryBy(String name) {
    return 'Por $name';
  }

  @override
  String get galleryFeatured => 'Destaques';

  @override
  String get galleryAll => 'Tudo';

  @override
  String get galleryThemes => 'Temas';

  @override
  String get gallerySchemes => 'Cores';

  @override
  String get galleryWallpapers => 'Papéis de parede';

  @override
  String get gallerySkills => 'Habilidades';

  @override
  String get fromGallery => 'Galeria';

  @override
  String galleryApplied(String name) {
    return 'Usando $name';
  }

  @override
  String get gallerySeeAll => 'Ver tudo';

  @override
  String get galleryInUse => 'Em uso';

  @override
  String galleryInstalled(String name) {
    return '$name instalado';
  }

  @override
  String get galleryPreviewDark => 'Prévia no escuro';

  @override
  String get galleryPreviewLight => 'Prévia no claro';

  @override
  String get galleryClearSearch => 'Limpar busca';

  @override
  String get galleryOfflineTitle => 'A galeria está offline';

  @override
  String galleryNoMatches(String query) {
    return 'Nada corresponde a “$query”';
  }

  @override
  String get galleryInstructions => 'Instruções';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern em $palette';
  }

  @override
  String get galleryImage => 'Imagem';

  @override
  String get galleryMeshGradient => 'um gradiente em malha';

  @override
  String get galleryOwnDoodles => 'Desenhos próprios';

  @override
  String get galleryLightAndDark => 'Claro e escuro';

  @override
  String get galleryContribute =>
      'Criou um visual que gostou? Compartilhe, e todo mundo no Casama pode encontrá-lo aqui.';

  @override
  String get galleryTypeTheme => 'Tema';

  @override
  String get galleryTypeScheme => 'Esquema de cores';

  @override
  String get galleryTypeWallpaper => 'Papel de parede';

  @override
  String get galleryTypeSkill => 'Habilidade';

  @override
  String get galleryBehindChats => 'Atrás dos seus chats';

  @override
  String celebrateNewBot(String name) {
    return 'Dê oi para $name!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name está pronto!';
  }

  @override
  String get celebrateJoined => 'Você entrou! Boas-vindas ao espaço.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name está tudo pronto.';
  }

  @override
  String get fewerEffects => 'Menos efeitos';

  @override
  String get fewerEffectsHelp =>
      'Sem celebrações, abas saltando ou bots animados.';

  @override
  String get haptics => 'Resposta tátil';

  @override
  String get trackpadHaptics => 'Resposta tátil do trackpad';

  @override
  String get hapticsHelp =>
      'Toques suaves quando algo acontece ou um bot precisa de você.';

  @override
  String get watchHaptics => 'Tátil';

  @override
  String get settingsAppSection => 'App';

  @override
  String get settingsSecuritySection => 'Login e segurança';

  @override
  String get customize => 'Personalizar';

  @override
  String get customizeColors => 'Cores';

  @override
  String get appearanceCustomLook => 'Tema personalizado';

  @override
  String get appearanceCustomHelp =>
      'Suas próprias alterações. Salve como um tema para mantê-las.';

  @override
  String get appearanceFromGallery => 'Da Galeria';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Mostrar todos os $countString';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Mudou para $name';
  }

  @override
  String appearanceSaved(String name) {
    return '$name salvo nos seus temas';
  }

  @override
  String get appearanceAboutTheme => 'Sobre este tema';

  @override
  String settingsOnDevServer(String host) {
    return 'Configurações · servidor de desenvolvimento $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Você: $text';
  }

  @override
  String get chatPreviewPhoto => 'Foto';

  @override
  String get chatPreviewVideo => 'Vídeo';

  @override
  String get chatPreviewVoice => 'Mensagem de voz';

  @override
  String get chatPreviewNone => 'Nenhuma mensagem ainda';

  @override
  String get chatTimeYesterday => 'Ontem';

  @override
  String get chatDayToday => 'Hoje';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day às $time';
  }

  @override
  String get anyPriority => 'Qualquer prioridade';

  @override
  String get readingAloud => 'Lendo em voz alta';

  @override
  String get readAloudPreparing => 'Preparando…';

  @override
  String get readAloudPaused => 'Pausado';

  @override
  String get stopReading => 'Parar leitura';

  @override
  String get readAloudSpeed => 'Velocidade de reprodução';

  @override
  String readAloudTimeLeft(String time) {
    return 'Faltam $time';
  }

  @override
  String get readAloudShowMessage => 'Mostrar a mensagem sendo lida';

  @override
  String mentionOpenProfile(String name) {
    return '$name, abrir perfil';
  }

  @override
  String get paywallSubtitle =>
      'Mais bots, mais tempo de computador e créditos novos todo mês, para seus bots continuarem trabalhando.';

  @override
  String get paywallPerkBots => 'Bots';

  @override
  String get paywallPerkBotsBody =>
      'Uma equipe inteira, cada um com seu trabalho.';

  @override
  String get paywallPerkComputers => 'Tempo de computador';

  @override
  String get paywallPerkComputersBody =>
      'Os bots ganham os próprios computadores para navegar, programar e construir.';

  @override
  String get paywallPerkCredits => 'Créditos mensais';

  @override
  String get paywallPerkCreditsBody => 'Para modelos, buscas e ferramentas.';

  @override
  String get paywallPerkSeats => 'Vagas';

  @override
  String get paywallPerkSeatsBody =>
      'Traga sua equipe para o mesmo espaço de trabalho.';

  @override
  String paywallHours(String hours) {
    return '$hours h';
  }

  @override
  String get paywallWeekly => 'Semanal';

  @override
  String get paywallMonthly => 'Mensal';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallPerMonth => '/ mês';

  @override
  String get paywallPerYear => '/ ano';

  @override
  String get paywallContinue => 'Continuar';

  @override
  String get paywallContinueCheckout => 'Ir para o pagamento';

  @override
  String get paywallRestore => 'Restaurar';

  @override
  String get paywallFineStore =>
      'Renova automaticamente. Cancele quando quiser nas configurações da loja.';

  @override
  String get paywallFineWeb =>
      'Renova automaticamente. Cancele quando quiser em Cobrança.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, com renovação automática até você cancelar. O pagamento é cobrado na sua Conta Apple. Cancele a qualquer momento nas configurações da sua Conta Apple pelo menos 24 horas antes da renovação.',
      'google_play':
          '$price, com renovação automática até você cancelar. O pagamento é cobrado na sua conta do Google Play. Cancele a qualquer momento nas configurações da sua conta do Google Play pelo menos 24 horas antes da renovação.',
      'other':
          '$price, com renovação automática até você cancelar. O pagamento é cobrado na sua conta da loja. Cancele a qualquer momento nas configurações da sua conta da loja pelo menos 24 horas antes da renovação.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Grátis por $days dias, depois $price, com renovação automática até você cancelar.',
      one:
          'Grátis por $days dia, depois $price, com renovação automática até você cancelar.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Grátis por $days dias, depois $price, com renovação automática até você cancelar.',
      one:
          'Grátis por $days dia, depois $price, com renovação automática até você cancelar.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Grátis por $days dias, depois $price, com renovação automática até você cancelar.',
      one:
          'Grátis por $days dia, depois $price, com renovação automática até você cancelar.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 O pagamento é cobrado na sua Conta Apple ao fim do teste grátis. Cancele nas configurações da sua Conta Apple pelo menos 24 horas antes do fim do teste grátis e não haverá cobrança.',
      'google_play':
          '$_temp1 O pagamento é cobrado na sua conta do Google Play ao fim do teste grátis. Cancele nas configurações da sua conta do Google Play pelo menos 24 horas antes do fim do teste grátis e não haverá cobrança.',
      'other':
          '$_temp2 O pagamento é cobrado na sua conta da loja ao fim do teste grátis. Cancele nas configurações da sua conta da loja pelo menos 24 horas antes do fim do teste grátis e não haverá cobrança.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Iniciar teste grátis';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias grátis, depois $price/ano',
      one: '$days dia grátis, depois $price/ano',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias grátis, depois $price/mês',
      one: '$days dia grátis, depois $price/mês',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, com renovação automática até você cancelar. Cancele a qualquer momento em Cobrança; você mantém o plano até o fim do período.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Grátis por $days dias, depois $price, com renovação automática até você cancelar.',
      one:
          'Grátis por $days dia, depois $price, com renovação automática até você cancelar.',
    );
    return '$_temp0 Cancele em Cobrança antes do fim do teste grátis e não haverá cobrança.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price por semana',
      'year': '$price por ano',
      'other': '$price por mês',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Termos de Uso';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get aiConsentTitle => 'Seus chats vão para empresas de IA';

  @override
  String get aiConsentBody =>
      'Para escrever respostas, o Casama envia o que você compartilha com seus bots para provedores externos de IA. Nada é enviado até você concordar.';

  @override
  String get aiConsentUpdatedNotice =>
      'Adicionamos páginas da web a esta lista.';

  @override
  String get aiConsentWhatTitle => 'O que é enviado';

  @override
  String get aiConsentWhat =>
      'Suas mensagens, arquivos e fotos, sua voz em chamadas, mensagens de voz e ditado, o que os bots lembram sobre você, as páginas da web que seus bots abrem para você (no computador deles ou no navegador deste dispositivo) e quaisquer dados do celular que você ativar, como agenda ou saúde.';

  @override
  String get aiConsentWhoTitle => 'Quem recebe';

  @override
  String get aiConsentWho =>
      'O OpenRouter, que repassa para a empresa que cria o modelo que você usa, como DeepSeek, Google ou OpenAI. As chamadas usam o Google Gemini, e a OpenAI transforma mensagens de voz e ditado em texto. Buscas na web vão para Parallel, Serper ou DeepSeek. Com sua própria chave de API, os dados vão para esse provedor.';

  @override
  String get aiConsentWhyTitle => 'O que fazem com isso';

  @override
  String get aiConsentWhy =>
      'Eles usam para escrever a resposta. Você pode interromper isso a qualquer momento em Configurações › Privacidade, e a política de privacidade traz os detalhes.';

  @override
  String get aiConsentAgree => 'Concordar e continuar';

  @override
  String get aiConsentTile => 'Provedores de IA';

  @override
  String get aiConsentTileOn =>
      'Permitido. O que você compartilha com bots vai para provedores externos de IA para escrever respostas.';

  @override
  String get aiConsentWithdrawQuestion =>
      'Parar de compartilhar com provedores de IA?';

  @override
  String get aiConsentWithdrawBody =>
      'Os bots não podem responder sem eles. O Casama pergunta novamente antes que qualquer outra coisa seja enviada.';

  @override
  String get aiConsentWithdraw => 'Parar de compartilhar';

  @override
  String get planChanged => 'Plano alterado';

  @override
  String get purchasesRestored => 'Compras restauradas';

  @override
  String get creditsAdded => 'Créditos adicionados';

  @override
  String get purchasePending =>
      'Aguardando aprovação da compra. Ela é adicionada assim que for aprovada.';

  @override
  String get purchaseFailed =>
      'A compra não foi concluída e você não foi cobrado.';

  @override
  String get purchaseVerifyFailed =>
      'Ainda não foi possível confirmar sua compra. Tentaremos novamente automaticamente; se não aparecer em breve, toque em Restaurar compras.';

  @override
  String paywallTitleFor(String plan) {
    return 'Expanda sua equipe com $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Boas-vindas ao $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n meses grátis',
      one: '$n mês grátis',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Mudar para $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Você assina pela App Store. Para mudar de plano, use a App Store no dispositivo em que assinou.',
      'google_play': 'Você assina pelo Google Play. Para mudar de plano, use o Google Play no dispositivo em que assinou.',
      'other': 'Você assina por uma loja de apps. Para mudar de plano, use essa loja no dispositivo em que assinou.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Você assina na web. Mude de plano aqui pelo checkout da web ou gerencie sua assinatura.';

  @override
  String get subscribedOutsideAppNote =>
      'Sua assinatura é cobrada fora deste app, portanto não pode ser alterada aqui.';

  @override
  String get outOfCreditsTitle => 'Seus créditos acabaram';

  @override
  String get outOfCreditsPaidBody =>
      'Seus bots ficam pausados até você adicionar créditos. Os pacotes de créditos da App Store ou do Google Play nunca expiram; pacotes de créditos comprados na web duram 12 meses.';

  @override
  String get outOfCreditsFreeBody =>
      'Faça upgrade para ter mais créditos todo mês, mais bots e mais tempo de computador.';

  @override
  String get addCredits => 'Adicionar créditos';

  @override
  String get seePlansButton => 'Ver planos';

  @override
  String get paywallAskAdmin =>
      'Apenas proprietários e admins do espaço de trabalho podem mudar o plano. Peça a um deles para fazer upgrade.';

  @override
  String get upgradeToPro => 'Fazer upgrade para o Pro';

  @override
  String get upgradeToProBody =>
      'Mais bots, tempo de computador e créditos mensais.';

  @override
  String get manageTab => 'Gerenciar';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Memória';

  @override
  String get vitalsDisk => 'Disco';

  @override
  String get fixItTitle => 'Não está funcionando bem?';

  @override
  String get fixItSubtitle =>
      'Tente nesta ordem. Cada opção vai um pouco mais fundo.';

  @override
  String get fixRestart => 'Reiniciar';

  @override
  String get fixRestartHelp => 'Cerca de 20 segundos · nada é perdido';

  @override
  String get fixResetSystem => 'Redefinir sistema';

  @override
  String get fixResetSystemHelp => 'Um sistema novo · seus arquivos ficam';

  @override
  String get fixErase => 'Apagar tudo';

  @override
  String get fixEraseHelp => 'Como novo · pode ser desfeito por 7 dias';

  @override
  String get fixResetAction => 'Redefinir…';

  @override
  String get fixEraseAction => 'Apagar…';

  @override
  String get computerRestarting => 'Reiniciando…';

  @override
  String get computerRestarted =>
      'Reiniciado. Todos os seus arquivos estão lá.';

  @override
  String get computerUpdateTitle => 'Atualização disponível';

  @override
  String get computerUpdateBody =>
      'Novas ferramentas e correções estão prontas. Atualizar reinicia este computador: seus arquivos ficam, janelas abertas e programas em execução fecham.';

  @override
  String get computerUpdateBotWorking =>
      'Um bot está trabalhando neste computador agora. Atualizar interrompe o que ele está fazendo.';

  @override
  String get computerUpdateNow => 'Atualizar agora';

  @override
  String get computerUpdateLater => 'Mais tarde';

  @override
  String get computerUpdateConfirmTitle => 'Atualizar este computador?';

  @override
  String get computerUpdateMenu => 'Atualizar computador';

  @override
  String get computerUpdating => 'Atualizando…';

  @override
  String get computerUpdated => 'Atualizado. Todos os seus arquivos estão lá.';

  @override
  String get computerUpdateBusyTitle => 'Um comando ainda está em execução';

  @override
  String get computerUpdateBusyBody =>
      'Atualizar agora o interrompe. Aguarde terminar ou atualize assim mesmo.';

  @override
  String get computerUpdateAnyway => 'Atualizar assim mesmo';

  @override
  String resetSheetTitle(String name) {
    return 'Redefinir $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots não podem usá-lo por cerca de um minuto.';
  }

  @override
  String get resetSheetBusyNone =>
      'Ele não poderá ser usado por cerca de um minuto.';

  @override
  String get resetOptionSystem => 'Redefinir sistema, manter meus arquivos';

  @override
  String get resetOptionSystemHelp =>
      'Corrige instalações quebradas, configurações e programas travados.';

  @override
  String get resetOptionErase => 'Apagar tudo';

  @override
  String get resetOptionEraseHelp => 'Voltar a um computador novinho em folha.';

  @override
  String get resetKept => 'Mantidos';

  @override
  String get resetRemoved => 'Removidos';

  @override
  String get resetKeptFiles => 'Seus arquivos em workspace';

  @override
  String get resetKeptSettings => 'Nome, configurações e bots';

  @override
  String get resetKeptRestorePoints => 'Pontos de restauração';

  @override
  String get resetRemovedApps => 'Apps e ferramentas que você instalou';

  @override
  String get resetRemovedPrograms => 'Programas em execução';

  @override
  String get resetRemovedCaches => 'Caches e configurações da pasta pessoal';

  @override
  String get resetRemovedFiles =>
      'Todos os arquivos, espaço de trabalho também';

  @override
  String get resetSavePoint => 'Salvar um ponto de restauração antes';

  @override
  String get resetSavePointHelp => 'Para você poder desfazer isso por 7 dias';

  @override
  String eraseTypeName(String name) {
    return 'Digite $name para confirmar';
  }

  @override
  String get resetConfirmSystem => 'Redefinir sistema';

  @override
  String get resetConfirmErase => 'Apagar tudo';

  @override
  String get resetStepSaving => 'Salvando um ponto de restauração';

  @override
  String get resetStepWipingSystem => 'Removendo apps e configurações';

  @override
  String get resetStepWipingErase => 'Apagando todos os arquivos';

  @override
  String get resetStepRestarting => 'Iniciando um sistema novo';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Redefinindo… $stepString de $totalString';
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

    return 'Apagando… $stepString de $totalString';
  }

  @override
  String get resetLeaveHint => 'Você pode sair desta tela. Continua sozinho.';

  @override
  String get resetDone => 'Sistema novo pronto';

  @override
  String get eraseDone => 'Computador apagado';

  @override
  String get resetFailed => 'A redefinição não terminou';

  @override
  String get resetUndoHint =>
      'Desfazer coloca tudo de volta como estava. O ponto de restauração fica por 7 dias.';

  @override
  String get restoredPrevious => 'Colocado de volta como estava';

  @override
  String get usageThisMonth => 'Este mês';

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
      'Cobrado apenas enquanto estiver ligado. Em repouso não custa nada.';

  @override
  String get usageNone => 'Ainda não usado neste mês';

  @override
  String get sleepTimerTitle => 'Entra em repouso após';

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
      'Nunca enquanto um bot estiver trabalhando ou você estiver usando. Uma espera maior mantém ligado por mais tempo, o que custa mais.';

  @override
  String sleepTimerSaved(String label) {
    return 'Entra em repouso após $label sem atividade';
  }

  @override
  String get storageTitle => 'Armazenamento';

  @override
  String storageOf(String total) {
    return 'de $total';
  }

  @override
  String get storageFiles => 'Seus arquivos';

  @override
  String get storageApps => 'Apps e ferramentas';

  @override
  String get storageCaches => 'Caches';

  @override
  String get storageBrowser => 'Navegador';

  @override
  String get storageOther => 'Outro';

  @override
  String get storageFree => 'Livre';

  @override
  String storageFreeUp(String size) {
    return 'Liberar $size';
  }

  @override
  String get storageNothingToClean => 'Nenhum cache para limpar';

  @override
  String storageFreed(String size) {
    return '$size liberados';
  }

  @override
  String get storageAsleep =>
      'Desperte o computador para ver o que ocupa espaço.';

  @override
  String get processesTitle => 'Em execução agora';

  @override
  String get processesNone => 'Nada está rodando além do próprio computador.';

  @override
  String get processesAsleep => 'Nada roda enquanto está em repouso.';

  @override
  String get processStop => 'Parar';

  @override
  String processStopTitle(String name) {
    return 'Parar $name?';
  }

  @override
  String get processStopMessage =>
      'Tudo o que não tiver sido salvo será perdido.';

  @override
  String processStopped(String name) {
    return '$name parado';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu% de CPU · $memory';
  }

  @override
  String get usedByTitle => 'Usado por';

  @override
  String get usedByNone => 'Nenhum bot usa este computador ainda.';

  @override
  String botLastActive(String when) {
    return 'Ativo $when';
  }

  @override
  String get botNeverActive => 'Ainda não ativo';

  @override
  String get restorePointsTitle => 'Pontos de restauração';

  @override
  String get restorePointsNone =>
      'Nenhum ainda. Os bots salvam um antes de alterações arriscadas.';

  @override
  String get restorePointSaveNow => 'Salvar um ponto de restauração agora';

  @override
  String get restorePointSaveTitle => 'Salvar ponto de restauração';

  @override
  String get restorePointDefaultLabel => 'Salvo manualmente';

  @override
  String get restorePointSaved => 'Ponto de restauração salvo';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Mostrar todos os $nString';
  }

  @override
  String get historyTitle => 'Histórico';

  @override
  String get historyNone => 'Nada aconteceu ainda.';

  @override
  String get historyStarted => 'Despertou';

  @override
  String get historySlept => 'Entrou em repouso';

  @override
  String get historySleptIdle => 'Entrou em repouso (sem atividade)';

  @override
  String get historyRestarted => 'Reiniciou';

  @override
  String get historyReset => 'Redefiniu o sistema';

  @override
  String get historyErased => 'Apagou tudo';

  @override
  String get historyCheckpointCreated => 'Salvou um ponto de restauração';

  @override
  String get historyCheckpointRestored => 'Restaurou um ponto de restauração';

  @override
  String historyStorageCleaned(String size) {
    return 'Liberou $size';
  }

  @override
  String get historyStorageCleanedPlain => 'Liberou espaço';

  @override
  String historyProcessStopped(String name) {
    return 'Parou $name';
  }

  @override
  String get historyUpdated => 'Alterou as configurações';

  @override
  String get historyYou => 'você';

  @override
  String get yourDataTitle => 'Seus dados';

  @override
  String get downloadAllFiles => 'Baixar todos os arquivos';

  @override
  String get downloadAllFilesHelp => 'Um .zip de tudo no espaço de trabalho';

  @override
  String get downloadNothing => 'Ainda não há arquivos para baixar.';

  @override
  String get deleteComputerHelp =>
      'Remove o computador e os pontos de restauração dele';

  @override
  String get manageComputer => 'Gerenciar';

  @override
  String get restartComputer => 'Reiniciar';

  @override
  String get resetComputerMenu => 'Redefinir…';

  @override
  String get moreFixes => 'Mais correções';

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
  String get remoteUpdateTitle => 'Hora de atualizar o Casama';

  @override
  String get remoteUpdateBody =>
      'Esta versão do Casama não tem mais suporte. Atualize para continuar.';

  @override
  String get remoteUpdateNoLink =>
      'Esta versão do Casama não tem mais suporte. Atualize de onde você instalou.';

  @override
  String get remoteMaintenanceTitle => 'O Casama está em manutenção';

  @override
  String get openLink => 'Abrir';

  @override
  String get routineIdeas => 'Ideias';

  @override
  String get routineIdeasHelp => 'Comece com uma ideia e mude o que quiser.';

  @override
  String get pluginDirectory => 'Plugins revisados';

  @override
  String get pluginDirectoryHelp =>
      'Verificado pelo Casama e fixado na versão verificada.';

  @override
  String get pluginOrPaste => 'Ou adicione um de um link do GitHub';

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
  String get paywallBillingPeriod => 'Período de cobrança';

  @override
  String get paywallNotSoldTitle => 'Sem planos neste servidor';

  @override
  String get paywallNotSoldBody =>
      'Este servidor não vende planos, então não há upgrade disponível aqui.';

  @override
  String get paywallPlansFailedTitle => 'Os planos não carregaram';

  @override
  String get paywallPlansFailedBody =>
      'Verifique sua conexão e tente novamente.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'A App Store não está mostrando planos',
      'google_play': 'O Google Play não está mostrando planos',
      'other': 'A loja não está mostrando planos',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Verifique se você entrou na App Store neste dispositivo e tente novamente.',
      'google_play': 'Verifique se você entrou no Google Play neste dispositivo e tente novamente.',
      'other': 'Verifique se você entrou na loja neste dispositivo e tente novamente.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Economize até $pct%';
  }

  @override
  String get paywallMostPopular => 'Mais popular';

  @override
  String get paywallTaglinePlus => 'Para você e alguns bots';

  @override
  String get paywallTaglinePro => 'Para uma equipe ativa e um time pequeno';

  @override
  String get paywallTaglineMax =>
      'Para equipes com bots trabalhando o dia todo';

  @override
  String get paywallPerMonthShort => '/mês';

  @override
  String paywallBilledYearly(String price) {
    return '$price cobrados anualmente';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Sai por $price/mês';
  }

  @override
  String get paywallBilledMonthly => 'Cobrado mensalmente';

  @override
  String get paywallBilledWeekly => 'Cobrado semanalmente';

  @override
  String get paywallPerWeekShort => '/sem';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'São $price por semana';
  }

  @override
  String get paywallBilledYearlyPlain => 'Cobrado anualmente';

  @override
  String get paywallPerYearShort => '/ano';

  @override
  String paywallStartTrial(int n) {
    return 'Iniciar teste grátis de $n dias';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'Assinar $plan';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pessoas',
      one: '$count pessoa',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString horas de computador';
  }

  @override
  String get billingChangePlan => 'Mudar de plano';

  @override
  String get billingChangePlanBody =>
      'Compare todos os planos, mensais ou anuais.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'O que o $plan oferece';
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
  String get updatesRow => 'Atualizações';

  @override
  String get updatesRowSubtitle => 'Novidades do seu espaço de trabalho';

  @override
  String get updatesEmpty => 'Nenhuma atualização';

  @override
  String get updatesEmptyHelp =>
      'Avisos do espaço de trabalho e novas páginas aparecem aqui. O que seus bots enviam para você fica nos chats deles.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n itens precisam de você',
      one: '$n item precisa de você',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Trabalhando nisso: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Agora não: $title';
  }

  @override
  String openTopic(String title) {
    return 'Abrir $title';
  }

  @override
  String get newTopic => 'Novo tópico';

  @override
  String get topics => 'Tópicos';

  @override
  String get olderTopics => 'Anteriores';

  @override
  String get generalChat => 'Geral';

  @override
  String get allTopics => 'Todos os tópicos';

  @override
  String get cardSecrets => 'Segredos';

  @override
  String get cardApproval => 'Aprovação';

  @override
  String get cardTakeover => 'Assumir o controle';

  @override
  String get cardDevice => 'Acesso ao dispositivo';

  @override
  String get cardSuggestion => 'Sugestão';

  @override
  String get formBack => 'Voltar';

  @override
  String get formNext => 'Próximo';

  @override
  String get formSkip => 'Pular';

  @override
  String formStep(int n, int total) {
    return 'Pergunta $n de $total';
  }

  @override
  String get cardSuggestions => 'Sugestões';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Encontrei $n coisas que valem conferir',
      one: 'Encontrei $n coisa que vale conferir',
      zero: 'Não encontrei nada que valha conferir',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Iniciada $when';
  }

  @override
  String get suggestionStartedPlain => 'Iniciada';

  @override
  String get suggestionPutAway => 'Guardada';

  @override
  String get suggestionExpired => 'Expirada';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Expirada: $title';
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
      other: 'Expira em $nString minutos',
      one: 'Expira em $nString minuto',
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
      other: 'Expira em $nString horas',
      one: 'Expira em $nString hora',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sugestões resolvidas',
      one: '$n sugestão resolvida',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Usar este servidor no celular';

  @override
  String get linkIntro =>
      'Dê a este servidor um endereço que seu celular alcança de qualquer lugar. Sem domínio e sem configurar roteador.';

  @override
  String get linkIntroDetails =>
      'Conecta este servidor a uma conta gratuita do Casama Cloud. O tráfego do seu celular vai pelo Cloudflare direto para este computador, nunca pelos servidores do Casama.';

  @override
  String get linkTurnOn => 'Usar no celular';

  @override
  String get linkSignupsNote =>
      'Novos cadastros ficam fechados enquanto estiver ativado. Apenas quem já tem conta aqui pode entrar.';

  @override
  String get linkStepSignIn => 'Vincular este servidor';

  @override
  String get linkSignInBody =>
      'Aprove este código na página que acabou de abrir no navegador. Confira se a página mostra o mesmo código.';

  @override
  String get linkSignInOpen => 'Abrir página de novo';

  @override
  String get linkStepAddress => 'Obter um endereço';

  @override
  String get linkStepRestart => 'Reiniciar o servidor';

  @override
  String get linkStepConnect => 'Conectar';

  @override
  String get linkStateOnline => 'Online';

  @override
  String get linkStateStarting => 'Iniciando';

  @override
  String get linkStateOffline => 'Offline';

  @override
  String get linkStateAttention => 'Precisa de atenção';

  @override
  String get linkStateOff => 'Desativado';

  @override
  String get linkAddress => 'Endereço';

  @override
  String get linkLocalAddress => 'Neste computador';

  @override
  String get linkShowCode => 'Mostrar código de acesso';

  @override
  String get linkCheck => 'Verificar novamente';

  @override
  String get linkTurnOff => 'Desativar';

  @override
  String get linkTurnOffConfirm =>
      'Desativar acesso remoto? O endereço para de funcionar e os celulares perdem este servidor até você ativar novamente. Ele recupera o mesmo endereço.';

  @override
  String get linkTurningOff => 'Desativando';

  @override
  String get linkNeedsOwner =>
      'Apenas o proprietário deste servidor pode ativar isso.';

  @override
  String get linkTwoStepTip =>
      'Este servidor agora pode ser acessado pela internet. O login em duas etapas garante que uma senha adivinhada não baste.';

  @override
  String get linkProblemNotLinked =>
      'Este servidor não está vinculado ao Casama Cloud. Ative novamente para vincular.';

  @override
  String get linkProblemCloudUnreachable =>
      'Não foi possível alcançar o Casama Cloud agora. Se o endereço estava funcionando, continua funcionando.';

  @override
  String get linkProblemKeyRejected =>
      'O Casama Cloud não aceita mais a chave deste servidor. Ative novamente para vincular.';

  @override
  String get linkProblemSuspended =>
      'O Casama Cloud desativou o acesso remoto deste servidor.';

  @override
  String get linkProblemRemoved =>
      'Este servidor foi removido do espaço de trabalho no Casama Cloud. Ative novamente para vincular.';

  @override
  String get linkProblemPlanLimit =>
      'Seu plano do Casama Cloud conecta menos servidores. Remova um lá ou faça upgrade.';

  @override
  String get linkProblemUnknownServer =>
      'O Casama Cloud não tem mais endereço para este servidor. Ative novamente.';

  @override
  String get linkProblemAddressChanged =>
      'O endereço deste servidor mudou. Ative novamente para usar o novo.';

  @override
  String get connectProblemConnectorMissing =>
      'O conector não está rodando. Verifique se o Docker está em execução e tente novamente.';

  @override
  String get connectProblemConnectorBlocked =>
      'Esta rede bloqueia a conexão. Uma VPN ou firewall restritivo costumam causar isso (porta de saída 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Tudo conectado, mas o endereço ainda não responde. Um endereço novo pode levar um minuto.';

  @override
  String get linkServers => 'Servidores vinculados';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Seu plano conecta $limit servidores.',
      one: 'Seu plano conecta $limit servidor.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Nenhum servidor vinculado ainda. No seu próprio servidor, abra Configurações e depois Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return 'Remover $name? O endereço dele para de funcionar. O servidor pode ser vinculado de novo depois.';
  }

  @override
  String get linkStatusActive => 'Tem um endereço';

  @override
  String get linkStatusParked => 'Não visto recentemente';

  @override
  String get linkStatusSuspended => 'Suspenso';

  @override
  String get pairDevice => 'Entrar em outro dispositivo';

  @override
  String get pairDeviceRow => 'Mostrar um código para o celular escanear';

  @override
  String get pairDeviceHelp =>
      'Escaneie com a câmera do celular. Ou no Casama no celular: Entrar e depois Escanear um código.';

  @override
  String get pairDeviceWarning =>
      'Quem escanear entra como você. Funciona uma vez, por alguns minutos.';

  @override
  String pairDeviceServer(String host) {
    return 'Conecta em $host';
  }

  @override
  String get pairDeviceNewCode => 'Novo código';

  @override
  String get pairDeviceExpired => 'Este código expirou.';

  @override
  String get pairDeviceNotReachable =>
      'Este servidor só responde neste computador, então um celular ainda não consegue alcançá-lo.';

  @override
  String get pairDeviceNotReachableOther =>
      'O endereço deste servidor só funciona na própria rede dele. Peça a quem o administra um endereço acessível por outros.';

  @override
  String get pairDeviceCopyLink => 'Copiar link';

  @override
  String get pairDeviceLinkCopied =>
      'Link copiado. Cole no Casama para Chrome ou em outro dispositivo.';

  @override
  String get pairDeviceConnectChrome => 'Conectar Chrome';

  @override
  String get pairDeviceChromeDone => 'O Casama para Chrome está conectado.';

  @override
  String get pairDeviceChromeFinish =>
      'Conclua na aba do Casama para Chrome que foi aberta.';

  @override
  String get pairDeviceChromeMissing =>
      'O Casama para Chrome não está instalado neste navegador.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'O Casama para Chrome não conseguiu entrar. $error';
  }

  @override
  String get scanToSignIn => 'Escanear um código do computador';

  @override
  String get scanToSignInTitle => 'Escanear o código';

  @override
  String get scanToSignInHelp =>
      'Em um computador em que você esteja conectado, abra Configurações e depois Entrar em outro dispositivo.';

  @override
  String pairSignInTo(String host) {
    return 'Entrar em $host?';
  }

  @override
  String get pairSignInBody =>
      'O código conecta este dispositivo à conta que o exibiu.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Este dispositivo usa $current agora. Entrar em $host faz a troca.';
  }

  @override
  String get pairSigningIn => 'Entrando';

  @override
  String get pairCodeInvalid =>
      'Esse código não é mais válido. Gere um novo e escaneie novamente.';

  @override
  String get pairLinkInvalid => 'Este não é um código de acesso do Casama.';

  @override
  String get linkServerTitle => 'Vincular um servidor';

  @override
  String linkServerBody(String name) {
    return '$name quer se conectar à sua conta do Casama Cloud.';
  }

  @override
  String get linkServerCode => 'Código no servidor';

  @override
  String get linkServerCheck =>
      'Só vincule se você iniciou isso no seu próprio servidor e ele mostra este mesmo código.';

  @override
  String get linkServerWhat =>
      'Ele recebe um endereço público e pode enviar notificações a você. Não pode gastar seus créditos.';

  @override
  String get linkServerApprove => 'Vincular';

  @override
  String get linkServerDone => 'Vinculado';

  @override
  String linkServerDoneBody(String name) {
    return 'Volte para $name. Ele continua sozinho.';
  }

  @override
  String get linkServerInvalid =>
      'Esse código não é mais válido. Comece novamente no seu servidor.';

  @override
  String get linkServerEnterCode => 'O código que seu servidor exibe';

  @override
  String get linkServerFind => 'Buscar';

  @override
  String get linkServerNeedAdmin =>
      'Apenas proprietários e admins de um espaço de trabalho podem vincular um servidor.';

  @override
  String get localDockerStopped =>
      'O Docker não está rodando, então seu servidor está parado';

  @override
  String get localDockerStoppedBody =>
      'Seu servidor Casama roda no Docker neste computador. Abra o Docker e o Casama reconecta sozinho quando o servidor voltar, o que pode levar um minuto.';

  @override
  String get serverOfflineTitle => 'Seu servidor está offline';

  @override
  String get serverOfflineBody =>
      'O computador que o executa está ligado e ativo? Ele reconecta sozinho.';

  @override
  String get signUpsClosed =>
      'Este servidor não está aceitando novas contas. Entre com uma conta que você já tenha aqui.';

  @override
  String get signUpsByInvitation =>
      'Novas contas aqui são por convite. Use o e-mail com o qual você recebeu o convite.';

  @override
  String get linkPrivateNotifications => 'Notificações privadas';

  @override
  String get linkPrivateNotificationsHelp =>
      'As notificações chegam ao celular pelo Casama Cloud. Com isso ativado, não trazem texto e dizem apenas “Nova atividade”; o app carrega o resto deste servidor.';

  @override
  String get linkInvites => 'Permitir cadastro de pessoas convidadas';

  @override
  String get linkInvitesHelp =>
      'Desativado: ninguém pode criar uma conta nova. Ativado: quem você convidar por e-mail pode. Mudar essa opção reinicia o servidor.';

  @override
  String get linkKeepAwake =>
      'Manter este Mac ativo enquanto estiver na tomada';

  @override
  String get linkKeepAwakeHelp =>
      'Os celulares só alcançam este servidor enquanto este computador estiver ativo e o Casama aberto.';

  @override
  String get linkLiveView => 'Visualização ao vivo fora daqui';

  @override
  String get linkLiveViewIncluded =>
      'Incluída no seu plano. Longe deste computador, a tela do bot transmite ao vivo pelo servidor de retransmissão do Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Disponível a partir do Plus no Casama Cloud. Longe deste computador, você vê a tela do bot cerca de uma vez por segundo. Neste computador está sempre ao vivo.';

  @override
  String get liveAwayNeedsPlan =>
      'Longe do computador do servidor, o vídeo ao vivo está disponível a partir do Plus no Casama Cloud. Até lá, a tela atualiza cerca de uma vez por segundo.';

  @override
  String get chatShareExport => 'Compartilhar ou exportar';

  @override
  String get chatShareExportHelp =>
      'Salve este chat como arquivo ou crie um link somente leitura.';

  @override
  String get chatExportMarkdown => 'Exportar como Markdown';

  @override
  String get chatExportMarkdownHelp =>
      'Um arquivo de texto que qualquer pessoa pode ler';

  @override
  String get chatExportJson => 'Exportar como JSON';

  @override
  String get chatExportJsonHelp => 'Para outros apps e scripts';

  @override
  String get chatShareLink => 'Compartilhar link somente leitura';

  @override
  String get chatShareLinkHelp =>
      'Qualquer pessoa com o link pode ler este chat';

  @override
  String get chatStopSharing => 'Parar de compartilhar o link';

  @override
  String get chatStopSharingHelp => 'O link para de funcionar';

  @override
  String get chatMakePublicTitle => 'Compartilhar este chat com um link?';

  @override
  String get chatMakePublicBody =>
      'Qualquer pessoa com o link pode ler este chat como você o vê. Arquivos anexados são listados pelo nome, não compartilhados. Você pode parar a qualquer momento.';

  @override
  String get chatMakePublic => 'Criar link';

  @override
  String get chatLinkTitle => 'Link somente leitura';

  @override
  String get chatLinkBody =>
      'Copiado. Não aparece em mecanismos de busca. Criar um novo link desativa este.';

  @override
  String get chatSharingStopped => 'O link não funciona mais';

  @override
  String get creationDuplicate => 'Duplicar';

  @override
  String creationDuplicated(String title) {
    return 'Cópia criada: “$title”';
  }

  @override
  String get slackInstall => 'Adicionar ao Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Conecte um espaço de trabalho do Slack em um passo. $bot responde a @menções e mensagens diretas lá.';
  }

  @override
  String get slackInstallFinish => 'Conclua no Slack e depois volte para cá.';

  @override
  String get helpAndSupport => 'Ajuda e suporte';

  @override
  String get helpAndSupportRow =>
      'Pergunte à Ajuda do Casama, fale conosco, guias';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Respostas instantâneas dos nossos guias e da sua conta. Uma pessoa está a um toque.';

  @override
  String get supportIntro =>
      'Dúvidas, problema com uma compra ou algo que não funciona? Escreva para nós.';

  @override
  String supportSelfHosted(String host) {
    return 'Seu espaço de trabalho roda em $host. Para login, contas e planos, pergunte a quem administra esse servidor. Podemos ajudar com o app em si.';
  }

  @override
  String get supportTalkToPerson => 'Falar com uma pessoa';

  @override
  String get contactSupport => 'Falar com o suporte';

  @override
  String contactSupportRow(String email) {
    return 'Escreva para nossa equipe em $email';
  }

  @override
  String get sendFeedback => 'Enviar feedback';

  @override
  String get sendFeedbackRow => 'Ideias, elogios e críticas. Lemos todos.';

  @override
  String get feedbackHelp =>
      'Conte o que você gostaria que o Casama fizesse, o que você ama ou o que atrapalhou.';

  @override
  String get feedbackKindPrompt => 'Que tipo de feedback?';

  @override
  String get feedbackKindIdea => 'Ideia';

  @override
  String get feedbackKindLike => 'Gostei';

  @override
  String get feedbackKindDislike => 'Não gostei';

  @override
  String get feedbackKindConfusing => 'Confuso';

  @override
  String get feedbackMessageLabel => 'Seu feedback';

  @override
  String get feedbackMessageHint =>
      'Por exemplo: Queria poder fixar um chat no topo.';

  @override
  String get feedbackContactOk =>
      'O Casama pode entrar em contato comigo sobre isso';

  @override
  String get feedbackContactOkHelp =>
      'Podemos enviar um e-mail com uma pergunta ou avisar quando estiver pronto.';

  @override
  String get feedbackNote =>
      'A versão do app e seu plano são enviados junto. Problema com sua conta ou compra? Use Falar com o suporte.';

  @override
  String get feedbackThanks => 'Valeu! Lemos cada mensagem.';

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
  String get supportIdeasBoard => 'Mural de ideias';

  @override
  String get supportIdeasBoardHelp =>
      'Veja o que outros pediram e vote no que você quer em seguida';

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
      'Conte o que está acontecendo. Responderemos por e-mail.';

  @override
  String get contactSupportHelpMail =>
      'Conte o que está acontecendo. Isso abre seu app de e-mail com os detalhes preenchidos.';

  @override
  String get supportSend => 'Enviar';

  @override
  String get supportWriteEmail => 'Abrir e-mail';

  @override
  String get supportTopicPrompt => 'Sobre o que é?';

  @override
  String get supportTopicBilling => 'Cobrança e compras';

  @override
  String get supportTopicBroken => 'Algo não está funcionando';

  @override
  String get supportTopicAccount => 'Conta e login';

  @override
  String get supportTopicQuestion => 'Uma dúvida ou ideia';

  @override
  String get supportTopicOther => 'Outra coisa';

  @override
  String get supportMessageLabel => 'Sua mensagem';

  @override
  String get supportMessageHint => 'O que aconteceu e o que você esperava?';

  @override
  String get supportMessageMore =>
      'Adicione uma ou duas frases: o que você estava fazendo e o que deu errado.';

  @override
  String get supportIncludeChat =>
      'Incluir minha conversa com a Ajuda do Casama';

  @override
  String get supportIncludeChatHelp =>
      'Assim você não precisa explicar tudo duas vezes.';

  @override
  String get supportDetailsNote =>
      'Adicionamos a versão do app e os IDs do seu espaço de trabalho e conta para localizar sua conta. Nunca seus chats.';

  @override
  String get supportSentTitle => 'Mensagem enviada';

  @override
  String supportSentBody(String email, String reference) {
    return 'Responderemos para $email. Sua referência é $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'Nenhum app de e-mail encontrado, então copiamos sua mensagem. Cole em um e-mail para $email.';
  }

  @override
  String get supportGuides => 'Guias e perguntas frequentes';

  @override
  String get supportGuidesHelp => 'Ajuda passo a passo para tudo no Casama';

  @override
  String get introVideoTitle => 'Veja como o Casama funciona';

  @override
  String get introVideoSubtitle => 'Um vídeo de 1 min e meio';

  @override
  String get supportIntroVideo => 'Assistir ao vídeo de introdução';

  @override
  String get introVideoFailed =>
      'Não foi possível reproduzir o vídeo. Verifique sua conexão e tente novamente.';

  @override
  String get introVideoOnYoutube => 'Assistir no YouTube';

  @override
  String get introVideoReplay => 'Ver de novo';

  @override
  String get supportIntroVideoHelp =>
      'Veja o que o Casama pode fazer em 1 min e meio';

  @override
  String get supportRate => 'Avaliar o Casama';

  @override
  String get supportRateHelp =>
      'Conte aos outros o que você acha na página da loja';

  @override
  String get supportIds => 'IDs de suporte';

  @override
  String get supportIdsHelp =>
      'O suporte pode pedir estes códigos. Eles localizam sua conta e compras, sem dar acesso a ninguém.';

  @override
  String supportWorkspaceId(String name) {
    return 'ID do espaço de trabalho · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Também é seu ID de compra na App Store e no Google Play';

  @override
  String get supportAccountId => 'ID da conta';

  @override
  String get supportCopyAll => 'Copiar todos os detalhes';

  @override
  String get supportCopyAllHelp =>
      'Versão do app, plataforma e IDs, para colar em uma mensagem';

  @override
  String get supportNewChat => 'Nova conversa';

  @override
  String get supportAskHint => 'Pergunte qualquer coisa sobre o Casama';

  @override
  String get supportAiNote =>
      'A Ajuda do Casama usa IA e pode cometer erros. Ela vê seu plano e erros do bot, não seus chats.';

  @override
  String get supportGreeting =>
      'Oi! Sou a Ajuda do Casama. Pergunte sobre o Casama, seu plano ou algum problema. Se eu não conseguir resolver, passo para nossa equipe de suporte.';

  @override
  String get supportStarterPurchase => 'Minha compra não foi concluída';

  @override
  String get supportStarterCancel => 'Como cancelo meu plano?';

  @override
  String get supportStarterBot => 'Meu bot não está respondendo';

  @override
  String get supportStarterHowTo => 'O que meus bots podem fazer?';

  @override
  String get supportAskPerson => 'Falar com uma pessoa';

  @override
  String get supportHandoffTitle => 'Enviar isto para nossa equipe de suporte?';

  @override
  String get supportHandoffButton => 'Revisar e enviar';

  @override
  String get supportThinking => 'Verificando…';

  @override
  String get supportAssistantError =>
      'A Ajuda do Casama não conseguiu responder. Tente novamente ou fale com uma pessoa.';

  @override
  String get supportAssistantLimit =>
      'A Ajuda do Casama não pode responder mais agora. Uma pessoa pode ajudar.';

  @override
  String get purchaseHelp => 'Problema com uma compra? Peça ajuda';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Denunciar';

  @override
  String get reportAndBlock => 'Denunciar e bloquear';

  @override
  String get reportReply => 'Denunciar resposta';

  @override
  String get reportBot => 'Denunciar bot';

  @override
  String get reportBotRow =>
      'Algo no nome, na descrição ou nas respostas não está certo';

  @override
  String get reportPerson => 'Denunciar pessoa';

  @override
  String get reportGalleryItem => 'Denunciar item da galeria';

  @override
  String get reportGalleryRequest => 'Denunciar solicitação';

  @override
  String get reportWorkspace => 'Denunciar espaço de trabalho';

  @override
  String get reportHelp =>
      'Conte às pessoas que administram este servidor o que há de errado. Elas analisam todas as denúncias.';

  @override
  String get reportPersonHelp =>
      'Conte às pessoas que administram este servidor o que aconteceu. Também bloquearemos essa pessoa para você.';

  @override
  String get reportNote => 'Mais alguma coisa que deveriam saber (opcional)';

  @override
  String reportAlsoBlock(String name) {
    return 'Também bloquear $name';
  }

  @override
  String get reportSent => 'Obrigado. Sua denúncia foi enviada para análise.';

  @override
  String get reportReasonSpam => 'Spam ou golpe';

  @override
  String get reportReasonSexual => 'Conteúdo sexual';

  @override
  String get reportReasonViolence => 'Violência ou ameaças';

  @override
  String get reportReasonHarassment => 'Assédio ou discurso de ódio';

  @override
  String get reportReasonIllegal => 'Ilegal ou perigoso';

  @override
  String get reportReasonImpersonation => 'Falsidade ideológica';

  @override
  String get reportReasonOther => 'Outro motivo';

  @override
  String get thisPerson => 'esta pessoa';

  @override
  String blockPerson(String name) {
    return 'Bloquear $name';
  }

  @override
  String blocked(String name) {
    return '$name está bloqueado';
  }

  @override
  String get blockHelp =>
      'Pessoas bloqueadas não podem convidar você para um espaço de trabalho, e você não receberá mensagens delas.';

  @override
  String get blockedPeople => 'Pessoas bloqueadas';

  @override
  String get blockedPeopleRow =>
      'Pessoas que não podem convidar ou contatar você';

  @override
  String get noBlockedPeople => 'Ninguém está bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get emailTips => 'Dicas e novidades por e-mail';

  @override
  String get emailTipsHelp =>
      'Dicas iniciais e novidades ocasionais. E-mails sobre seu plano e sua conta sempre chegam.';

  @override
  String get reportsInApp => 'Denúncias no app';

  @override
  String get reportsNone =>
      'Nenhuma denúncia aberta. As denúncias enviadas pelo app aparecem aqui.';

  @override
  String get reportsPublicLinks => 'Links públicos denunciados';

  @override
  String get reportsNoLinks => 'Nenhum link público foi denunciado.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count denúncias',
      one: '$count denúncia',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Remover do ar';

  @override
  String get reportsRestore => 'Restaurar';

  @override
  String get reportKindReply => 'Resposta de bot';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Pessoa';

  @override
  String get reportKindGallery => 'Item da galeria';

  @override
  String get reportKindWorkspace => 'Espaço de trabalho';

  @override
  String get reportMarkActioned => 'Resolvida';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Suspender o espaço de trabalho $name';
  }

  @override
  String get reportDismiss => 'Dispensar: nada de errado';

  @override
  String get supportWebTitle => 'Ajuda do Casama no site';

  @override
  String get supportWebOn => 'Ativado';

  @override
  String get supportWebOff => 'Desativado';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count endereços IP pausados',
      one: '$count endereço IP pausado',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Mostrar $count perguntas sem resposta';
  }

  @override
  String get ticketsOpen => 'Abertas';

  @override
  String get ticketsClosed => 'Fechadas';

  @override
  String get ticketsAll => 'Todas';

  @override
  String get ticketsNone => 'Nenhuma mensagem aqui.';

  @override
  String get ticketClose => 'Fechar';

  @override
  String get ticketReopen => 'Reabrir';

  @override
  String get serviceStatus => 'Status';

  @override
  String get supportStatus => 'Status do Casama Cloud';

  @override
  String get supportStatusHelp => 'Confira se algo está fora do ar agora';

  @override
  String get galleryChatSuggestionLabel => 'Da galeria';

  @override
  String get galleryChatAdd => 'Adicionar';

  @override
  String galleryChatAdded(String name) {
    return '$name adicionado';
  }

  @override
  String galleryChatReads(String things) {
    return 'Lê: $things';
  }

  @override
  String get galleryChatRunsCode => 'Executa código';

  @override
  String get galleryChatComputer => 'Usa um computador';

  @override
  String galleryChatNeeds(String apps) {
    return 'Requer: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Rascunho de habilidade';

  @override
  String get galleryChatShowInstructions => 'Mostrar instruções';

  @override
  String get galleryChatHideInstructions => 'Ocultar instruções';

  @override
  String get galleryChatSaveSkill => 'Salvar nas minhas habilidades';

  @override
  String get galleryChatSaved => 'Salvo';

  @override
  String get galleryChatSavedSkill => 'Salvo nas suas habilidades';

  @override
  String get galleryChatSubmit => 'Enviar para a galeria';

  @override
  String galleryChatSubmitTitle(String name) {
    return 'Enviar $name para a galeria?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Um mantenedor analisa antes. Quando entrar, qualquer pessoa pode encontrá-lo e usá-lo. Seu nome de exibição aparece como autor, nunca seu e-mail.';

  @override
  String get galleryChatSent => 'Enviado';

  @override
  String get galleryChatSubmitted => 'Enviado para análise na galeria';

  @override
  String get galleryChatSubmissionsOff =>
      'Este servidor não aceita envios para a galeria.';

  @override
  String get galleryPicksTitle => 'Escolhas para você';

  @override
  String get galleryPicksHelp =>
      'Comece com um conjunto de habilidades, apps e rotinas que combinam. Você pode mudar tudo depois.';

  @override
  String get galleryPicksAdd => 'Adicionar este conjunto';

  @override
  String get galleryPicksSkip => 'Pular por enquanto';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Adicionar $name';
  }

  @override
  String get galleryPicksBestMatch => 'Melhor opção';

  @override
  String get galleryPicksInside => 'O que vem dentro';

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
      other: '$count habilidades',
      one: '$count habilidade',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rotinas',
      one: '$count rotina',
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
      other: '$count visuais',
      one: '$count visual',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$name adicionado';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$name adicionado. Conecte $apps em Apps para concluir.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Um administrador analisará $name antes de adicioná-lo.';
  }

  @override
  String get galleryPolicyTitle => 'Galeria';

  @override
  String get galleryPolicyRow =>
      'O que as pessoas aqui podem adicionar da galeria';

  @override
  String get galleryPolicyMode => 'Quem pode adicionar';

  @override
  String get galleryPolicyOpen => 'Aberto';

  @override
  String get galleryPolicyOpenHelp =>
      'Qualquer pessoa aqui pode adicionar tudo o que não estiver bloqueado.';

  @override
  String get galleryPolicyApproval => 'Perguntar antes';

  @override
  String get galleryPolicyApprovalHelp =>
      'Adicionar pede confirmação a um administrador primeiro para o que você escolher abaixo.';

  @override
  String get galleryPolicyAllowlist => 'Apenas permitidos';

  @override
  String get galleryPolicyAllowlistHelp =>
      'As pessoas só podem adicionar o que está na lista de permitidos.';

  @override
  String get galleryPolicyApprovalFor => 'Perguntar antes para';

  @override
  String get galleryPolicyRunsCode => 'Itens que executam código';

  @override
  String get galleryPolicyApps => 'Itens que conectam apps';

  @override
  String get galleryPolicyAll => 'Tudo';

  @override
  String get galleryPolicyAllowed => 'Permitidos';

  @override
  String get galleryPolicyAllowedHelp =>
      'Adicionados sem perguntar. Em “Apenas permitidos”, são os únicos itens que as pessoas podem adicionar.';

  @override
  String get galleryPolicyBlocked => 'Bloqueados';

  @override
  String get galleryPolicyBlockedHelp =>
      'Ninguém aqui pode adicionar estes itens.';

  @override
  String get galleryPolicyAddItem => 'Adicionar da galeria';

  @override
  String get galleryPolicyNone => 'Nada ainda';

  @override
  String get galleryPolicySearch => 'Buscar na galeria';

  @override
  String get galleryPolicyNoResults => 'Nada na galeria corresponde.';

  @override
  String get galleryPolicySaved => 'Regras da galeria salvas';

  @override
  String galleryPolicyRemove(String name) {
    return 'Remover $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Apenas administradores e proprietários podem alterar isso.';

  @override
  String get galleryPolicyWaiting => 'Aguardando aprovação';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name solicitou';
  }

  @override
  String get galleryPolicyApprove => 'Aprovar';

  @override
  String get galleryPolicyDecline => 'Recusar';

  @override
  String galleryPolicyApproved(String name) {
    return '$name aprovado e adicionado';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name recusado';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Aprovado, mas não foi possível adicionar $name. $error';
  }

  @override
  String get galleryDigestEmails => 'Destaques mensais da galeria';

  @override
  String get galleryDigestHelp =>
      'Até seis habilidades, apps e rotinas novos que combinam com o que você usa, uma vez por mês.';

  @override
  String get newsletterTitle => 'E-mail mensal do Casama';

  @override
  String get newsletterHelp =>
      'Novidades e próximos passos, no máximo uma vez por mês.';

  @override
  String get newsletterSignUp =>
      'Quero receber o e-mail mensal do Casama: novidades e o que vem por aí, no máximo uma vez por mês.';

  @override
  String get newsletterCardTitle => 'Receber o e-mail mensal do Casama?';

  @override
  String get newsletterCardBody =>
      'Novidades e próximos passos, no máximo uma vez por mês. Cancele quando quiser.';

  @override
  String get newsletterCardYes => 'Sim, quero receber';

  @override
  String get newsletterCardNo => 'Não, obrigado';

  @override
  String get newsletterCardDone =>
      'Você está na lista. Desative quando quiser em Configurações.';

  @override
  String get galleryKindApp => 'App';

  @override
  String get galleryKindApps => 'Apps';

  @override
  String get galleryKindBot => 'Bot inicial';

  @override
  String get galleryKindBots => 'Bots iniciais';

  @override
  String get galleryKindRoutine => 'Rotina';

  @override
  String get galleryKindRoutines => 'Rotinas';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugins';

  @override
  String get galleryKindSet => 'Kit inicial';

  @override
  String get galleryKindSets => 'Kits iniciais';

  @override
  String get galleryTabBrowse => 'Explorar';

  @override
  String get galleryTabInstalled => 'Instalados';

  @override
  String get gallerySearchEverything => 'Buscar tudo';

  @override
  String get galleryNewBadge => 'Novo';

  @override
  String get galleryRowPicks => 'Seleção';

  @override
  String get galleryRowNew => 'Novos';

  @override
  String get galleryRowTrending => 'Em alta esta semana';

  @override
  String get galleryRowMostUsed => 'Mais usados';

  @override
  String get galleryRowWorksWith => 'Funciona com o que você já tem';

  @override
  String get galleryRowSets => 'Kits iniciais';

  @override
  String get galleryRowSeasonal => 'Da temporada';

  @override
  String get galleryFilterFree => 'Grátis';

  @override
  String get galleryFilterPlan => 'Usa créditos';

  @override
  String get galleryFilterSelfHosted => 'Funciona auto-hospedado';

  @override
  String get galleryFilterComputer => 'Precisa de um computador';

  @override
  String get galleryNoFilterMatches => 'Nada corresponde a estes filtros';

  @override
  String get galleryClearFilters => 'Limpar filtros';

  @override
  String get galleryRequestThis => 'Pedir isto';

  @override
  String get galleryAskCasama => 'Pedir ao Casama para criar';

  @override
  String galleryAskPrompt(String query) {
    return 'Crie algo para mim para isto: $query';
  }

  @override
  String get galleryAccessTitle => 'O que pode acessar';

  @override
  String galleryAccessReads(String things) {
    return 'Lê: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Executa código';

  @override
  String get galleryAccessComputer => 'Usa um computador';

  @override
  String get galleryAccessNothing => 'Não lê nem altera nada seu';

  @override
  String get galleryCreditsNone => 'Não usa créditos';

  @override
  String get galleryCreditsLow => 'Usa poucos créditos';

  @override
  String get galleryCreditsMedium => 'Usa alguns créditos';

  @override
  String get galleryCreditsHigh => 'Usa muitos créditos';

  @override
  String get galleryTryIt => 'Experimentar';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usado por $shown pessoas',
      one: 'Usado por $shown pessoa',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent% das execuções terminam';
  }

  @override
  String get galleryAbout => 'Sobre';

  @override
  String get galleryMadeByCasama => 'Feito pelo Casama';

  @override
  String get galleryMadeByCommunity => 'Feito pela comunidade';

  @override
  String get galleryMadeReviewed => 'Revisado';

  @override
  String get galleryReviewedHelp => 'Os testes passaram nesta versão';

  @override
  String galleryMoreFrom(String name) {
    return 'Mais de $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Versão $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Atualizado em $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Remix de $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'O que mudou em $name';
  }

  @override
  String get galleryBreaking => 'Funciona de outro jeito';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens na galeria',
      one: '$count item na galeria',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => 'Nada na galeria deste autor ainda.';

  @override
  String get galleryInstalledWorkspace => 'Neste espaço de trabalho';

  @override
  String get galleryInstalledDevice => 'Visuais neste dispositivo';

  @override
  String get galleryInstalledEmptyTitle => 'Nada adicionado ainda';

  @override
  String get galleryInstalledEmpty =>
      'Habilidades, apps, rotinas e visuais adicionados da galeria aparecem aqui, com atualizações.';

  @override
  String get galleryInstalledError =>
      'Não foi possível carregar o que está instalado.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count atualizações',
      one: '$count atualização',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Atualizar';

  @override
  String galleryUpdated(String name) {
    return '$name atualizado';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Versão $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return 'Atualizar $name?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'A nova versão pode fazer mais do que a que você tem:';

  @override
  String get galleryUpdateBreakingHelp =>
      'A nova versão funciona de outro jeito; confira depois de atualizar.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Agora lê: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Agora pode: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Agora executa código';

  @override
  String get galleryUpdateNowComputer => 'Agora usa um computador';

  @override
  String get galleryRemove => 'Remover';

  @override
  String galleryRemoveTitle(String name) {
    return 'Remover $name?';
  }

  @override
  String get galleryRemoveHelp =>
      'Ele é removido deste espaço de trabalho. Você pode adicioná-lo novamente da galeria.';

  @override
  String galleryRemoved(String name) {
    return '$name removido';
  }

  @override
  String get galleryRetired => 'Não está mais na galeria';

  @override
  String get galleryRetiredReplaced =>
      'Não está mais na galeria; há um substituto';

  @override
  String get gallerySeeReplacement => 'Ver substituto';

  @override
  String get galleryForgetLook => 'Remover desta lista';

  @override
  String galleryWizardTitle(String name) {
    return 'Adicionar $name';
  }

  @override
  String get galleryWizardAdd => 'Adicionar';

  @override
  String get galleryWizardRequired => 'Preencha este campo';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Inclui $count itens',
      one: 'Inclui $count item',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Do que precisa';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count habilidades, adicionadas para você',
      one: '$count habilidade, adicionada para você',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Apps para conectar: $apps';
  }

  @override
  String get galleryWizardBot => 'Adicionar a qual bot';

  @override
  String get galleryWizardPickBot => 'Escolha um bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Onde ficam as rotinas do conjunto. Sem um bot, elas ficam de fora.';

  @override
  String get galleryWizardSetNotAdded => 'Não adicionado';

  @override
  String get galleryWizardNeedsTitle => 'Conecte seus apps';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name funciona depois que estes estiverem conectados.';
  }

  @override
  String get galleryWizardSkillAdded => 'Adicionado';

  @override
  String get galleryWizardConnected => 'Conectado';

  @override
  String get galleryWizardConnect => 'Conectar';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Conecte $name em Configurações → Apps.';
  }

  @override
  String get galleryWizardContinue => 'Continuar';

  @override
  String get galleryWizardSkip => 'Depois';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name está pronto';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Você o encontrará junto com suas outras coisas.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Para funcionar por completo, precisa destes apps conectados: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Aguardando aprovação';

  @override
  String get galleryWizardPendingHelp =>
      'Seu espaço de trabalho pergunta a um administrador primeiro. Será adicionado assim que ele aprovar.';

  @override
  String get galleryRequestsTitle => 'Solicitações';

  @override
  String get galleryRequestsHelp =>
      'Ideias para a galeria. Vote nas que você quer; criadores escolhem entre as mais votadas.';

  @override
  String get galleryRequestsLinkHelp =>
      'Peça algo que ainda não existe aqui ou vote';

  @override
  String get galleryRequestsTop => 'Em alta';

  @override
  String get galleryRequestsNew => 'Recentes';

  @override
  String get galleryRequestsEmpty =>
      'Nenhuma solicitação ainda. Seja o primeiro.';

  @override
  String get galleryRequestsError =>
      'Não foi possível carregar as solicitações.';

  @override
  String get galleryRequestNew => 'Nova solicitação';

  @override
  String get galleryRequestNewHelp =>
      'Diga o que você gostaria que alguém criasse. Solicitações parecidas são agrupadas.';

  @override
  String get galleryRequestKind => 'Tipo';

  @override
  String get galleryRequestTitleLabel => 'O que ele deve fazer?';

  @override
  String get galleryRequestTitleLength => 'Use de 4 a 80 caracteres.';

  @override
  String get galleryRequestDetails => 'Detalhes (opcional)';

  @override
  String get galleryRequestSend => 'Enviar solicitação';

  @override
  String get galleryRequestSent => 'Solicitação enviada';

  @override
  String galleryRequestSimilar(String title) {
    return '“$title” já tinha sido pedido, então seu voto foi para ele';
  }

  @override
  String get galleryRequestMine => 'Sua';

  @override
  String get galleryRequestVote => 'Votar';

  @override
  String get galleryRequestOpen => 'Aberta';

  @override
  String get galleryRequestPlanned => 'Planejada';

  @override
  String get galleryRequestDone => 'Concluída';

  @override
  String get galleryRequestDeclined => 'Recusada';

  @override
  String get gallerySubmitStart => 'Enviar para a galeria';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Compartilhe um visual, habilidade, rotina ou bot que você criou';

  @override
  String get gallerySubmitPick => 'O que você quer compartilhar?';

  @override
  String get gallerySubmitPickHelp =>
      'Escolha algo que você criou. Passa por análise antes de entrar na galeria.';

  @override
  String get galleryLooksMine => 'Seus visuais';

  @override
  String get gallerySubmitCurrentScheme => 'Esquema de cores em uso';

  @override
  String get gallerySubmitCurrentWallpaper => 'Papel de parede em uso';

  @override
  String get gallerySubmitMyWallpaper => 'Meu papel de parede';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Enviar um app',
      'bot': 'Enviar um bot inicial',
      'routine': 'Enviar uma rotina',
      'plugin': 'Enviar um plugin',
      'set': 'Enviar um kit inicial',
      'theme': 'Enviar um tema',
      'scheme': 'Enviar um esquema de cores',
      'wallpaper': 'Enviar um papel de parede',
      'other': 'Enviar uma habilidade',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Seu nome de exibição aparece como autor. Seu e-mail nunca é compartilhado.';

  @override
  String get gallerySubmitName => 'Nome';

  @override
  String get gallerySubmitNameLength => 'Use de 1 a 60 caracteres.';

  @override
  String get gallerySubmitTags => 'Tags';

  @override
  String get gallerySubmitTagsHelp => 'Até seis, separadas por vírgulas';

  @override
  String get gallerySubmitLicense => 'Licença';

  @override
  String gallerySubmitRemix(String name) {
    return 'Dá crédito ao original: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed =>
      'Dá crédito ao item original da galeria';

  @override
  String get gallerySubmitSend => 'Enviar';

  @override
  String get gallerySubmitted => 'Enviado para análise';

  @override
  String get gallerySubmissionsTitle => 'Meus envios';

  @override
  String get gallerySubmissionsHelp =>
      'O que você enviou para a galeria e em que pé está.';

  @override
  String get gallerySubmissionsSent => 'Enviado';

  @override
  String get gallerySubmissionsEmpty => 'Nada enviado ainda.';

  @override
  String get gallerySubmissionsError =>
      'Não foi possível carregar seus envios.';

  @override
  String get gallerySubmissionOpen => 'Em análise';

  @override
  String get gallerySubmissionMerged => 'Na galeria';

  @override
  String get gallerySubmissionClosed => 'Não aceito';

  @override
  String get gallerySubmissionFailed => 'Não foi possível enviar';

  @override
  String get galleryMyItems => 'Seus itens na galeria';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count denúncias abertas',
      one: '$count denúncia aberta',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Um bot';

  @override
  String get islandNeedsOk => 'Precisa do seu OK';

  @override
  String get islandTakeOver => 'Quer que você assuma o controle';

  @override
  String get islandWriting => 'Escrevendo uma resposta';

  @override
  String get islandWorking => 'Trabalhando';

  @override
  String get islandFinished => 'Concluído';

  @override
  String get islandStoppedProblem => 'Parou com um problema';

  @override
  String get islandOnThisMac => 'Neste Mac';

  @override
  String get islandStale => 'Abra o Casama para ver o mais recente';

  @override
  String get islandOpen => 'Abrir';

  @override
  String get islandStop => 'Parar';

  @override
  String get islandAllow => 'Permitir';

  @override
  String get islandDeny => 'Recusar';

  @override
  String get islandReview => 'Revisar';

  @override
  String get islandNothing => 'Nenhum bot está trabalhando agora';

  @override
  String get islandQuickAsk => 'Pergunta rápida…';

  @override
  String get islandOpenCasama => 'Abrir o Casama';

  @override
  String get islandSettings => 'Ajustes…';

  @override
  String get islandQuit => 'Encerrar o Casama';

  @override
  String get islandAskHint => 'Pergunte a um bot…';

  @override
  String get islandNeedsYou => 'Precisa de você';

  @override
  String get islandDropHere => 'Solte para perguntar a um bot';

  @override
  String get siriSignedOut => 'Entre no Casama primeiro.';

  @override
  String get siriOpenToFinish => 'Abra o Casama para concluir.';

  @override
  String get siriTooMany =>
      'Muitos pedidos em um minuto. Abra o Casama para continuar.';

  @override
  String get siriNoCredits =>
      'Seus créditos acabaram. Abra o Casama para adicionar mais.';

  @override
  String get siriOffline => 'O Casama está sem conexão com a internet agora.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot precisa do seu OK primeiro. Abra o Casama para revisar.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot encontrou um problema. Abra o Casama para ver o que aconteceu.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot respondeu. Abra o Casama para ler.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot ainda está trabalhando nisso. Você receberá uma notificação quando terminar.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot respondeu.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return '$routine iniciada.';
  }

  @override
  String get siriNothingNeedsYou => 'Nada precisa de você agora.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count coisas precisam de você.',
      one: '$count coisa precisa de você.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Aguardando você: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Computadores não estão disponíveis para esta conta.';

  @override
  String get siriNoComputers =>
      'Você não tem computadores neste espaço de trabalho.';

  @override
  String siriStartingComputer(String computer) {
    return 'Iniciando $computer.';
  }

  @override
  String get siriComputerFailed =>
      'Não foi possível iniciar o computador agora.';

  @override
  String get siriWhichBotToStop => 'Qual bot devo parar?';

  @override
  String get siriBotNotRunning => 'Esse bot não está em execução agora.';

  @override
  String get siriStopped => 'Parado.';

  @override
  String get siriStopFailed => 'Não foi possível parar o bot agora.';

  @override
  String get focusFilterShowingAll => 'Filtro de Foco · Mostrando todos';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Filtro de Foco · $count visíveis',
      one: 'Filtro de Foco · $count visível',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'O Casama é para pessoas a partir de 13 anos';

  @override
  String get under13Body =>
      'Esta conta não pode usar o Casama com base na faixa etária declarada. Você pode sair ou exportar seus dados de outra conta.';

  @override
  String get siriSpotlightSetting => 'Mostrar no Spotlight e na Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Nomes de bots, nomes de rotinas e títulos de chats aparecem no Spotlight e na Siri neste dispositivo. Nunca o que é dito no chat. Fica desativado com o bloqueio do app ligado.';

  @override
  String get geminiSetting => 'Deixar o Gemini usar o Casama';

  @override
  String get geminiSettingHelp =>
      'Quando você pede ao Gemini para usar o Casama, ele pode perguntar aos seus bots, ver o que precisa de você e executar suas rotinas neste celular. Ele nunca aprova nada: as solicitações abrem aqui. As respostas ficam ocultas em um espaço de trabalho privado, com “Ocultar texto da resposta” ou com o bloqueio do app ativado.';

  @override
  String get geminiOff =>
      'O Gemini está desativado para o Casama neste celular. Ative em Casama: Configurações, Privacidade.';

  @override
  String get islandBotWorking => 'Um bot está trabalhando';

  @override
  String get islandOnThisComputer => 'neste computador';

  @override
  String get islandOnACall => 'Em chamada';

  @override
  String get islandStartElsewhere => 'Bots que você inicia em outro lugar';

  @override
  String get islandStartElsewhereHelp =>
      'Mostre também na Tela Bloqueada deste iPhone o que você inicia em outro dispositivo, como seu Mac.';

  @override
  String get islandBotsAtWork => 'Bots trabalhando';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etapas',
      one: '$count etapa',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Mostrar bots no notch';

  @override
  String get showBotsInNotchHelp =>
      'O que seus bots estão fazendo, ao redor da câmera. O ícone da barra de menus mostra de qualquer jeito.';

  @override
  String get notchOnHover => 'Abrir o notch ao passar o cursor';

  @override
  String get notchOnHoverHelp => 'Desativado: clique no notch para abrir.';

  @override
  String get sitePublishToWeb => 'Publicar na Web';

  @override
  String get sitePublishToWebHelp => 'Dê a ela um endereço web próprio.';

  @override
  String get siteAddressName => 'Nome do endereço';

  @override
  String get siteAddressRules =>
      '3 a 40 letras minúsculas, números e hífens, começando e terminando com letra ou número.';

  @override
  String get siteAddressChecking => 'Verificando…';

  @override
  String get siteAddressAvailable => 'Disponível';

  @override
  String get siteAddressTaken => 'Este nome não está disponível.';

  @override
  String get siteAnyoneCanOpen =>
      'Qualquer pessoa com o endereço poderá abrir.';

  @override
  String get sitePublish => 'Publicar';

  @override
  String get siteOnTheWeb => 'Na web';

  @override
  String get siteSearchEngines => 'Permitir que buscadores encontrem';

  @override
  String get siteSearchEnginesHelp =>
      'Lista o site no Google e em outros buscadores.';

  @override
  String get siteSearchEnginesPaid => 'Precisa de um plano pago.';

  @override
  String get siteUseOwnDomain => 'Usar seu próprio domínio';

  @override
  String get siteUnpublish => 'Remover da web';

  @override
  String get siteUnpublishTitle => 'Remover este site da web?';

  @override
  String get siteUnpublishBody =>
      'Ele para de abrir nos seus endereços web. Ele continua na sua Biblioteca.';

  @override
  String get siteHostLive => 'No ar';

  @override
  String get siteHostWaitingForDns => 'Aguardando DNS';

  @override
  String get siteHostGettingCertificate => 'Obtendo certificado';

  @override
  String get siteHostNeedsAttention => 'Requer atenção';

  @override
  String get siteHostPaused => 'Pausado';

  @override
  String get siteHostSuspended => 'Suspenso';

  @override
  String get settingsDomains => 'Domínios';

  @override
  String get settingsDomainsHelp =>
      'Abra seus sites em um domínio que você possui.';

  @override
  String get settingsSearchHint => 'Buscar configurações';

  @override
  String settingsSearchNone(String query) {
    return 'Nenhuma configuração corresponde a “$query”.';
  }

  @override
  String get domainsEmpty =>
      'Conecte um domínio seu, como padaria.com, e seu site abrirá lá.';

  @override
  String get domainsConnectOwn => 'Conectar um domínio próprio';

  @override
  String get domainStateLive => 'No ar';

  @override
  String get domainStateWaitingDns => 'Aguardando DNS';

  @override
  String get domainStateWaitingCert => 'Obtendo o certificado';

  @override
  String get domainStatePaused => 'Pausado';

  @override
  String get domainStateNeedsAttention => 'Requer atenção';

  @override
  String get domainNoSite => 'Nenhum site ainda';

  @override
  String get domainConnectField => 'Seu domínio';

  @override
  String get domainConnectHelp =>
      'Digite como padaria.com, www.padaria.com ou loja.padaria.com.';

  @override
  String get domainConnectSite => 'Site para exibir';

  @override
  String get domainSiteNone => 'Nenhum';

  @override
  String get domainSiteNoneHelp =>
      'O domínio não exibe nada até você escolher um site.';

  @override
  String get domainConnect => 'Conectar';

  @override
  String get domainClaimTitle => 'Mostre que é seu';

  @override
  String get domainClaimBody =>
      'Outro espaço de trabalho conectou este domínio. Adicione este registro para mostrar que é seu e toque em Conectar novamente.';

  @override
  String get domainRecordType => 'Tipo';

  @override
  String get domainRecordName => 'Nome';

  @override
  String get domainRecordValue => 'Valor';

  @override
  String get domainSite => 'Site';

  @override
  String get domainPickSite => 'Escolher um Site';

  @override
  String get domainHosts => 'Endereços';

  @override
  String get domainPrimary => 'Principal';

  @override
  String get domainPrimaryHelp =>
      'Visitantes chegam aqui; os outros endereços redirecionam para este.';

  @override
  String get domainMakePrimary => 'Tornar principal';

  @override
  String get domainRecordsTitle => 'Registros para adicionar';

  @override
  String get domainRecordsAtCloudflare =>
      'Adicione estes no Cloudflare. Defina os registros como somente DNS.';

  @override
  String domainRecordsAt(String provider) {
    return 'Adicione estes nas configurações de DNS em $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Adicione estes onde o DNS do seu domínio é gerenciado, geralmente na empresa em que você o comprou.';

  @override
  String get domainRecordsNone => 'Nada a adicionar. Tudo pronto.';

  @override
  String get domainRecordOptional => 'Opcional';

  @override
  String domainRecordForward(String from, String to) {
    return 'Ative o encaminhamento de $from para $to na empresa onde você comprou o domínio.';
  }

  @override
  String get domainRecordFound => 'Encontrado';

  @override
  String get domainRecordNotFound => 'Ainda não encontrado';

  @override
  String get domainCheckAgain => 'Verificar novamente';

  @override
  String get domainCheckTooSoon =>
      'Acabamos de verificar. Tente novamente em alguns segundos.';

  @override
  String get domainChecksItself =>
      'Também verificamos sozinhos, então você pode sair desta tela.';

  @override
  String get domainHistory => 'Histórico';

  @override
  String get domainEventConnected => 'Conectado';

  @override
  String get domainEventProved => 'Registros encontrados';

  @override
  String get domainEventLive => 'No ar';

  @override
  String get domainEventNeedsDns => 'Ainda aguardando DNS';

  @override
  String get domainEventFailed => 'Não foi possível concluir a configuração';

  @override
  String get domainEventDisconnected =>
      'Registros removidos, então foi desconectado';

  @override
  String get domainEventPaused => 'Pausado: seu plano não cobre isso';

  @override
  String get domainEventResumed => 'Ativo novamente';

  @override
  String get domainEventRemoved => 'Desconectado';

  @override
  String get domainEventClaim => 'Pedido para mostrar que é seu';

  @override
  String get domainEventClaimAttempt =>
      'Outro espaço de trabalho tentou conectá-lo';

  @override
  String get domainEventOverLimit => 'Acima do limite do seu plano';

  @override
  String get domainEventSuspended => 'Suspenso';

  @override
  String get domainEventOther => 'Atualizado';

  @override
  String domainDisconnectTitle(String name) {
    return 'Desconectar $name?';
  }

  @override
  String get domainDisconnectBody =>
      'Seu site para de abrir neste domínio. Você pode remover os registros dele na sua empresa de DNS depois.';

  @override
  String get domainsFind => 'Encontrar um domínio';

  @override
  String get domainsEmptyBuy =>
      'Compre um domínio para seu site ou conecte um que você já possui.';

  @override
  String get domainFindField => 'Nome ou algumas palavras';

  @override
  String get domainFindHint => 'padaria';

  @override
  String get domainFindHelp => 'Os preços são anuais e antes dos impostos.';

  @override
  String get domainFindNone => 'Nenhum nome encontrado. Tente outras palavras.';

  @override
  String get domainFindNotOffered =>
      'A compra de domínios não está disponível neste app. Você ainda pode conectar um domínio que já possui.';

  @override
  String domainPricePerYear(String price) {
    return '$price por ano mais impostos';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Renova por $price';
  }

  @override
  String get domainReasonTaken => 'Ocupado';

  @override
  String get domainReasonPremium => 'Nome premium, não vendido aqui';

  @override
  String get domainReasonNotSold => 'Não vendido aqui';

  @override
  String get domainBuy => 'Comprar';

  @override
  String domainBuyTitle(String name) {
    return 'Comprar $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price no primeiro ano, depois $renew por ano, mais impostos.';
  }

  @override
  String get domainBuyFinal =>
      'As vendas são finais depois que o domínio é registrado. Se não puder ser registrado, você recebe reembolso integral.';

  @override
  String get domainBuyTerms => 'Aceito os termos de domínio';

  @override
  String get domainBuyReadTerms => 'Ler os termos';

  @override
  String get domainRenewAuto => 'Renovar automaticamente';

  @override
  String get domainRenewAutoHelp =>
      'A cobrança é feita na sua forma de pagamento salva cerca de duas semanas antes do vencimento.';

  @override
  String get domainBuySite => 'Site para exibir';

  @override
  String get domainBuyPayInBrowser =>
      'Conclua o pagamento no navegador. Esta tela acompanha tudo.';

  @override
  String get domainContactTitle => 'Dados de contato';

  @override
  String get domainContactHelp =>
      'A pessoa ou empresa em cujo nome o domínio é registrado. Registradores mantêm esses dados privados.';

  @override
  String get domainContactFirstName => 'Nome';

  @override
  String get domainContactLastName => 'Sobrenome';

  @override
  String get domainContactOrganization => 'Empresa (opcional)';

  @override
  String get domainContactAddress1 => 'Endereço';

  @override
  String get domainContactAddress2 => 'Complemento (opcional)';

  @override
  String get domainContactCity => 'Cidade';

  @override
  String get domainContactState => 'Estado ou região';

  @override
  String get domainContactZip => 'CEP';

  @override
  String get domainContactCountry => 'Código do país';

  @override
  String get domainContactCountryHint => 'BR';

  @override
  String get domainContactPhone => 'Telefone';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'E-mail';

  @override
  String get domainContactRequired => 'Obrigatório';

  @override
  String get domainContactCountryInvalid =>
      'Use um código de duas letras, como BR';

  @override
  String get domainContactPhoneInvalid =>
      'Use o formato internacional, como +1 415 555 0100';

  @override
  String get domainContactEmailInvalid => 'Digite um e-mail válido';

  @override
  String get domainContactSave => 'Salvar';

  @override
  String get domainContactSaved => 'Dados de contato salvos.';

  @override
  String get domainContactChangeNote =>
      'As alterações valem para todos os domínios que este espaço de trabalho comprou. Um novo e-mail precisa ser confirmado novamente.';

  @override
  String get domainOrderTitle => 'Seu pedido';

  @override
  String get domainOrderWaitingPayment =>
      'Aguardando seu pagamento no navegador.';

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
    return 'Não foi possível registrar $name. Reembolsando você agora…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'Não foi possível registrar $name, então reembolsamos o valor integral.';
  }

  @override
  String get domainOrderAbandoned =>
      'Este checkout não foi pago, então nada foi cobrado.';

  @override
  String get domainOrderNeedsAttention =>
      'Algo deu errado com este pedido. Fomos avisados e vamos resolver.';

  @override
  String domainOrderDone(String name) {
    return '$name é seu.';
  }

  @override
  String get domainOrderLeave =>
      'Você pode sair desta tela. Avisaremos quando estiver pronto.';

  @override
  String get domainOrderBack => 'Voltar para Domínios';

  @override
  String domainRenewsOn(String date) {
    return 'Renova em $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price por ano mais impostos';
  }

  @override
  String get domainRenewNow => 'Renovar agora';

  @override
  String get domainRenewPayInBrowser =>
      'Conclua o pagamento no navegador. A nova data aparece aqui depois que for pago.';

  @override
  String get domainRenewCharged =>
      'Renovado. A nova data aparece aqui em um minuto.';

  @override
  String get domainRegistration => 'Registro';

  @override
  String domainExpired(String date) {
    return 'Expirou em $date. Renove em até 25 dias após essa data para mantê-lo.';
  }

  @override
  String get domainLapsed =>
      'Este domínio caducou. Escreva para o suporte para saber se é possível restaurá-lo; isso não é garantido.';

  @override
  String get domainSuspendedLine =>
      'Este domínio está suspenso. Escreva para o suporte para saber o motivo.';

  @override
  String get domainVerifyTitle => 'Confirme o e-mail do registrante';

  @override
  String get domainVerifyBody =>
      'O registrador enviou um e-mail para o endereço do registrante. Abra-o e confirme, ou o domínio para de funcionar.';

  @override
  String get domainVerifySendAgain => 'Enviar novamente';

  @override
  String get domainVerifySent =>
      'Enviado. Verifique a caixa de entrada do registrante.';

  @override
  String get domainDnsRecords => 'Registros DNS';

  @override
  String get domainDnsRecordsHelp =>
      'E-mail, subdomínios e verificações do site';

  @override
  String get domainMoveOut => 'Mover para outro registrador';

  @override
  String domainMoveOutAfter(String date) {
    return 'Pode ser movido após $date';
  }

  @override
  String get domainMoveOutHelp =>
      'Obter um código de transferência para outro registrador';

  @override
  String domainMoveOutTitle(String name) {
    return 'Mover $name?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Isso desbloqueia o domínio e exibe o código de transferência uma vez. Digite $name para confirmar.';
  }

  @override
  String get domainMoveOutConfirm => 'Obter código de transferência';

  @override
  String domainMoveOutLocked(String date) {
    return 'Pode ser movido após $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Código de transferência';

  @override
  String get domainTransferCodeBody =>
      'Entregue este código ao novo registrador. Ele é exibido apenas esta vez, então copie agora.';

  @override
  String get domainTransferCode => 'Código';

  @override
  String get domainUnlocked => 'Desbloqueado para transferência';

  @override
  String get domainLockAgain => 'Bloquear novamente';

  @override
  String get domainLocked => 'Bloqueado novamente.';

  @override
  String get domainReauthTitle => 'Entrar novamente';

  @override
  String get domainReauthSendCode => 'Enviar código por e-mail';

  @override
  String domainReauthCodeSent(String email) {
    return 'Enviamos um código para $email.';
  }

  @override
  String get domainReauthCode => 'Código do e-mail';

  @override
  String get domainReauthSignIn => 'Entrar';

  @override
  String get domainReauthSignOut =>
      'Saia e entre novamente, depois tente mais uma vez.';

  @override
  String get dnsRecordsEmpty => 'Nenhum registro ainda.';

  @override
  String get dnsRecordAdd => 'Adicionar registro';

  @override
  String get dnsRecordEdit => 'Editar registro';

  @override
  String get dnsRecordManaged => 'Usado pelo seu site do Casama';

  @override
  String get dnsRecordType => 'Tipo';

  @override
  String get dnsRecordHost => 'Nome';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Deixe vazio para o próprio $name ou digite www, loja…';
  }

  @override
  String get dnsRecordAnswer => 'Valor';

  @override
  String get dnsRecordTtl => 'TTL (segundos)';

  @override
  String get dnsRecordPriority => 'Prioridade';

  @override
  String get dnsRecordSave => 'Salvar';

  @override
  String get dnsRecordDeleteTitle => 'Excluir este registro?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 segundos ou mais';

  @override
  String get dnsRecordAnswerRequired => 'Obrigatório';

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
      'Domínios comprados nos seus espaços de trabalho';

  @override
  String get deleteAccountDomainsBody =>
      'Esses domínios continuam registrados até expirarem. Eles não serão renovados, e seus sites sairão do ar.';

  @override
  String get whatsNew010Sites =>
      'Coloque uma página na web em seu próprio endereço e use seu próprio domínio nela.';

  @override
  String get inAppAlertOpen => 'Abrir';

  @override
  String get pushPrefsTitle => 'Notificações';

  @override
  String get pushPrefsHelp =>
      'Escolha o que faz seus dispositivos vibrarem. Tudo continua chegando na sua Caixa de entrada.';

  @override
  String get pushAllOn => 'Tudo ativado';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Respostas desativadas',
      'needsYou': '“Precisa de você” desativado',
      'routines': 'Rotinas e resumos desativados',
      'suggestions': 'Sugestões e avisos desativados',
      'other': 'Conta desativada',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count tipos desativados';
  }

  @override
  String get pushReplies => 'Respostas';

  @override
  String get pushRepliesHelp =>
      'Quando um bot responde a algo que você perguntou, se você tiver saído do chat.';

  @override
  String get pushNeedsYou => 'Precisa de você';

  @override
  String get pushNeedsYouHelp =>
      'Aprovações, senhas e controles manuais que seus bots estão aguardando.';

  @override
  String get pushNeedsYouOffWarning =>
      'Desativado: seus bots vão esperar até você abrir o app.';

  @override
  String get pushRoutines => 'Rotinas e resumos';

  @override
  String get pushRoutinesHelp =>
      'Resultados das rotinas e seu resumo da manhã.';

  @override
  String get pushSuggestions => 'Sugestões e avisos';

  @override
  String get pushSuggestionsHelp =>
      'Coisas que seus bots oferecem fazer para você.';

  @override
  String get pushAccount => 'Conta';

  @override
  String get pushAccountHelp => 'Créditos acabando, projetos e seu servidor.';

  @override
  String get pushHideReplyText => 'Ocultar texto da resposta';

  @override
  String get pushHideReplyTextHelp =>
      'As notificações dizem que um bot respondeu, sem mostrar o texto.';

  @override
  String get reactToMessage => 'Reagir';

  @override
  String get moreReactions => 'Mais reações';

  @override
  String get reactionsTitle => 'Reações';

  @override
  String get reactionsAll => 'Todas';

  @override
  String get reactionsYou => 'Você';

  @override
  String get reactionsTapToRemove => 'Toque para remover';

  @override
  String get reactionsNone => 'Nenhuma reação ainda.';

  @override
  String get reactionsLoadFailed => 'Não foi possível carregar quem reagiu.';

  @override
  String get searchEmoji => 'Buscar emoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reações',
      one: '$count reação',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reações',
      one: '$count reação',
    );
    return '$emoji, $_temp0, incluindo a sua';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Reagir com $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Remover sua reação $emoji';
  }

  @override
  String get packsShelfTitle => 'Pacotes';

  @override
  String get packsShelfHelp =>
      'Bots, habilidades e rotinas que funcionam juntos, adicionados de uma vez.';

  @override
  String get packReviewed => 'Revisado';

  @override
  String get packNotReviewed => 'Não revisado pelo Casama';

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
      other: '$count habilidades',
      one: '$count habilidade',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rotinas',
      one: '$count rotina',
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
      other: '$count visuais',
      one: '$count visual',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ferramentas',
      one: '$count ferramenta',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Kit inicial';

  @override
  String get packAddFromLink => 'Adicionar um pacote por link';

  @override
  String get packAddFromLinkHelp =>
      'Cole um link do GitHub para um pacote e veja o que ele adiciona antes.';

  @override
  String get packAddFromFile => 'Adicionar de um arquivo';

  @override
  String get packAddFromFileHelp => 'Escolha o arquivo .zip de um pacote.';

  @override
  String get packLinkLabel => 'Link do GitHub';

  @override
  String get packFileUnreadable => 'Esse arquivo não é um .zip de pacote.';

  @override
  String get packFileTooBig => 'Esse arquivo é grande demais para um pacote.';

  @override
  String packSource(String where, String commit) {
    return '$where em $commit';
  }

  @override
  String get packFromFile => 'De um arquivo';

  @override
  String get packFromShare => 'Compartilhado com você';

  @override
  String get packAlreadyHere => 'Este espaço de trabalho já tem este pacote.';

  @override
  String get packOpenInstalled => 'Ver pacotes instalados';

  @override
  String get packAdd => 'Adicionar pacote';

  @override
  String packWizardTitle(String name) {
    return 'Adicionar $name';
  }

  @override
  String get packWhatsInside => 'O que vem dentro';

  @override
  String get packWhatsInsideHelp => 'Desmarque o que não quiser.';

  @override
  String get packSectionBots => 'Bots';

  @override
  String get packSectionSkills => 'Habilidades';

  @override
  String get packSectionRoutines => 'Rotinas';

  @override
  String get packSectionApps => 'Apps';

  @override
  String get packSectionLooks => 'Visuais';

  @override
  String get packSectionIncludes => 'Da galeria';

  @override
  String get packSectionTools => 'Ferramentas';

  @override
  String get packSkillRunsScripts => 'Executa scripts no computador do bot';

  @override
  String get packSkillForWorkspace => 'Para todo o espaço de trabalho';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Executa cerca de $count vezes por semana',
      one: 'Executa cerca de $count vez por semana',
      zero: 'Executa de vez em quando',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Comunica-se com $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Conecta-se a $url';
  }

  @override
  String get packIncludeMissing => 'Não encontrado na galeria';

  @override
  String get packLookHelp =>
      'Você pode usá-lo neste dispositivo depois de adicionar.';

  @override
  String get packNothingTicked => 'Marque pelo menos um item para adicionar.';

  @override
  String get packQuestions => 'Algumas perguntas';

  @override
  String get packQuestionsHelp =>
      'O pacote preenche isto nos bots e rotinas dele.';

  @override
  String get packSecretsTitle => 'Chaves e configurações';

  @override
  String get packSecretsHelp =>
      'As ferramentas do pacote precisam disto para funcionar.';

  @override
  String get packReachTitle => 'O que pode alcançar';

  @override
  String get packReachHelp =>
      'Identificado pelo Casama a partir dos arquivos do pacote.';

  @override
  String get packReachRunsCode => 'Executa código';

  @override
  String get packReachComputer => 'Usa o computador do bot';

  @override
  String packReachHosts(String hosts) {
    return 'Comunica-se com $hosts';
  }

  @override
  String get packReachNoHosts => 'Não se comunica com outros sites';

  @override
  String packReachSecrets(String names) {
    return 'Usa as chaves: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count execuções agendadas por semana',
      one: 'Cerca de $count execução agendada por semana',
      zero: 'Nenhuma execução agendada',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'O Casama não revisou este pacote. Adicione-o apenas se confiar na origem. As rotinas dele começam desativadas.';

  @override
  String get packPickBotTitle => 'Qual bot recebe?';

  @override
  String get packPickBotHelp =>
      'Este pacote não traz nenhum bot. Escolha um para as rotinas e ferramentas dele.';

  @override
  String packDoneTitle(String name) {
    return '$name foi adicionado';
  }

  @override
  String get packDoneHelp => 'Veja o que ele adicionou.';

  @override
  String get packPendingHelp =>
      'Perguntamos a um administrador. O pacote será adicionado assim que ele aprovar.';

  @override
  String get packStatusInstalled => 'Adicionado';

  @override
  String get packStatusPending => 'Aguardando um administrador';

  @override
  String get packStatusSkipped => 'Pulado';

  @override
  String get packStatusFailed => 'Não funcionou';

  @override
  String get packStatusDevice => 'Neste dispositivo';

  @override
  String get packConnectTitle => 'Conecte os apps dele';

  @override
  String get packConnectHelp =>
      'Os bots dele funcionam por completo quando estes estiverem conectados.';

  @override
  String get packLooksTitle => 'Usar um visual neste dispositivo?';

  @override
  String get packUseLook => 'Usar';

  @override
  String get packLookInUse => 'Em uso';

  @override
  String get packInstalledTitle => 'Esse pacote já está aqui';

  @override
  String get packsInstalledTitle => 'Pacotes instalados';

  @override
  String get packsInstalledRow =>
      'Pacotes que este espaço de trabalho adicionou, com atualizações';

  @override
  String get packsInstalledEmpty =>
      'Nenhum pacote ainda. Encontre um na estante Pacotes ou adicione por um link.';

  @override
  String get packEditedBadge => 'Editado por você';

  @override
  String get packRemove => 'Remover';

  @override
  String get packUpToDate => 'Este pacote está atualizado.';

  @override
  String get packCantCheck =>
      'Este pacote veio de um arquivo ou link e não pode verificar atualizações.';

  @override
  String packUpdateTitle(String name) {
    return 'Atualizar $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'Novos: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Removidos: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Alterado: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Novos sites com que se comunica: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Novas chaves necessárias: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Novos agendamentos: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Execuções agendadas por semana: $from → $to';
  }

  @override
  String get packDiffNone => 'Nada perceptível mudou.';

  @override
  String get packEditedTitle => 'Coisas que você alterou';

  @override
  String get packEditedHelp => 'Sua versão continua a menos que você troque.';

  @override
  String get packTakeTheirs => 'Usar a versão do pacote';

  @override
  String get packReachGrewTitle => 'Ele alcança mais coisas';

  @override
  String get packReachGrewHelp =>
      'A nova versão pode alcançar mais do que a que você tem.';

  @override
  String get packReachConfirm => 'Já conferi o que ele pode alcançar agora';

  @override
  String packUpdated(String name) {
    return '$name foi atualizado.';
  }

  @override
  String packRemoveTitle(String name) {
    return 'Remover $name?';
  }

  @override
  String get packRemoveBody =>
      'As ferramentas e chaves dele saem, assim como habilidades e rotinas que você não alterou. As conexões de apps continuam.';

  @override
  String get packRemoveBots => 'Também excluir os bots que este pacote criou';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Pacote removido. $count itens foram mantidos porque você os alterou.',
      one: 'Pacote removido. $count item foi mantido porque você o alterou.',
      zero: 'Pacote removido.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Compartilhar como pacote';

  @override
  String get sharePackRow => 'Empacote bots e habilidades para outra pessoa';

  @override
  String get sharePackHelp =>
      'Chaves, chats, memórias, Sobre você e a escolha do modelo nunca são incluídos.';

  @override
  String get sharePackBots => 'Bots';

  @override
  String get sharePackBotsHelp =>
      'Escolha até 5. Cada um leva suas instruções, habilidades e rotinas.';

  @override
  String get sharePackSkills => 'Habilidades do espaço de trabalho';

  @override
  String get sharePackName => 'Nome';

  @override
  String get sharePackSummary => 'Uma linha sobre ele';

  @override
  String get sharePackLook => 'Incluir o tema deste dispositivo';

  @override
  String get sharePackCheck => 'Verificar e compartilhar';

  @override
  String get sharePackFindingsTitle => 'Algumas linhas parecem chaves';

  @override
  String get sharePackFindingsHelp =>
      'Verifique isto antes de compartilhar. Volte para corrigir ou compartilhe se for seguro.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, linha $line: $what';
  }

  @override
  String get sharePackGoBack => 'Voltar';

  @override
  String get sharePackAnyway => 'Compartilhar mesmo assim';

  @override
  String get sharePackLinkTitle => 'Link do seu pacote';

  @override
  String sharePackLinkHelp(String date) {
    return 'Qualquer pessoa conectada ao Casama pode abri-lo até $date.';
  }

  @override
  String get sharePackShare => 'Compartilhar';

  @override
  String get sharePackSaveFile => 'Salvar como arquivo';

  @override
  String get sharePackLinkCopied => 'Link copiado.';

  @override
  String get sharePackStop => 'Parar de compartilhar';

  @override
  String get sharePackStopped => 'O link não funciona mais.';

  @override
  String pluginFromPack(String pack) {
    return 'Do pacote $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Atualize ou remova com o pacote dele em Galeria → Pacotes instalados.';

  @override
  String get pluginSettings => 'Configurações';

  @override
  String get pluginEditSettings => 'Editar configurações';

  @override
  String get pluginSettingsSaved => 'Configurações salvas.';

  @override
  String get galleryPolicyKeyHelp =>
      'Você também pode digitar um repositório (repo/owner:name) ou um pacote (pack/name).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Adicionar $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Pacote: $name';
  }

  @override
  String get reportPackShare => 'Denunciar este pacote';

  @override
  String get appLock => 'Bloqueio do app';

  @override
  String get appLockRow => 'Pedir para desbloquear o Casama ao abrir';

  @override
  String get appLockHelp =>
      'O Casama pede para ser desbloqueado ao abrir e depois de um tempo ausente. Enquanto estiver ativado, sua sessão fica guardada nas chaves deste dispositivo.';

  @override
  String get appLockSwitch => 'Bloquear o Casama';

  @override
  String get appLockLocked => 'O Casama está bloqueado';

  @override
  String get appLockUnlock => 'Desbloquear';

  @override
  String get appLockUnlockWithPasskey => 'Desbloquear com chave de acesso';

  @override
  String get appLockUnlockReason => 'Desbloquear o Casama';

  @override
  String get appLockTurnOnReason => 'Ativar o bloqueio do app';

  @override
  String get appLockConfirmReason => 'Confirme que é você';

  @override
  String get appLockConfirmTitle => 'Confirme que é você';

  @override
  String get approvalConfirmTitle => 'Permitir esta ação?';

  @override
  String get approvalConfirmBody =>
      'Esta é uma solicitação de alto risco. Permitir que o bot continue?';

  @override
  String get approvalConfirmAllow => 'Permitir';

  @override
  String appLockUnlockWith(String method) {
    return 'Use $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID ou seu código';

  @override
  String get appLockDeviceAndroid => 'sua digital, rosto ou bloqueio de tela';

  @override
  String get appLockDeviceMac => 'Touch ID ou a senha do seu Mac';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'o bloqueio de tela do seu dispositivo';

  @override
  String appLockMethodDevice(String method) {
    return 'Desbloqueia com $method';
  }

  @override
  String get appLockMethodPin => 'Desbloqueia com um PIN de 6 dígitos';

  @override
  String get appLockMethodPasskey => 'Desbloqueia com uma chave de acesso';

  @override
  String get appLockPinHint => 'Digite seu PIN';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PIN incorreto. Restam $count tentativas.',
      one: 'PIN incorreto. Resta $count tentativa.',
      zero: 'PIN incorreto.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Muitas tentativas de PIN incorretas. Saia e entre novamente para abrir o Casama.';

  @override
  String get appLockFailed => 'Não funcionou. Tente novamente.';

  @override
  String get appLockUnavailable =>
      'Este dispositivo não consegue desbloquear o Casama agora. Saia e entre novamente para voltar.';

  @override
  String get appLockSignOutConfirm =>
      'Sair desativa o bloqueio do app neste dispositivo. Entre novamente para abrir o Casama.';

  @override
  String get appLockCallRinging =>
      'Há uma chamada tocando. Desbloqueie para atender.';

  @override
  String get appLockRequiredTitle => 'Ative o bloqueio do app';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace exige o bloqueio do app em todos os dispositivos que abrem o Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Este navegador não pode usar chaves de acesso com este servidor, então não pode bloquear o Casama. Abra o Casama no app do seu celular ou computador.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Ativado. Exigido por $workspace';
  }

  @override
  String get appLockTurnOn => 'Ativar';

  @override
  String get appLockTurnedOn => 'O bloqueio do app está ativado';

  @override
  String get appLockNoWayHere =>
      'Este navegador não pode usar chaves de acesso com este servidor, então não é possível bloquear o Casama aqui.';

  @override
  String get appLockNotChecked => 'Não foi possível confirmar que é você.';

  @override
  String get appLockPinSetupTitle => 'Escolha um PIN';

  @override
  String get appLockPinAgainTitle => 'Digite o PIN novamente';

  @override
  String get appLockPinSetupBody =>
      '6 dígitos. Você vai digitá-lo para abrir o Casama.';

  @override
  String get appLockPinNext => 'Continuar';

  @override
  String get appLockPinMismatch =>
      'Os PINs não conferem. Escolha outro novamente.';

  @override
  String get appLockPinNotSaved =>
      'Não foi possível salvar o PIN neste dispositivo.';

  @override
  String get appLockPinChanged => 'PIN alterado';

  @override
  String get appLockChangePin => 'Alterar PIN';

  @override
  String get appLockAfter => 'Bloquear após';

  @override
  String get appLockAfterHelp =>
      'Tempo em segundo plano, minimizado ou atrás de outros apps em um computador.';

  @override
  String get appLockAfterImmediately => 'Imediatamente';

  @override
  String get appLockAfterOneMinute => '1 minuto';

  @override
  String get appLockAfterFiveMinutes => '5 minutos';

  @override
  String get appLockAfterFifteenMinutes => '15 minutos';

  @override
  String get appLockAfterOneHour => '1 hora';

  @override
  String get appLockBlockScreenshots => 'Bloquear capturas de tela';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Capturas de tela, gravações e compartilhamento de tela não mostram nada do Casama.';

  @override
  String get appLockLockNow => 'Bloquear agora';

  @override
  String get appLockPrivacySection => 'Mais privacidade';

  @override
  String get appLockAskBeforeRisky => 'Confirmar ações arriscadas';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Desbloqueie novamente antes de excluir sua conta, criar chaves, alterar cobrança, exportar dados, aprovar pedidos de alto risco e assumir o controle de um computador.';

  @override
  String get requireAppLock => 'Exigir o bloqueio do app';

  @override
  String get requireAppLockHelp =>
      'Os membros precisam bloquear o Casama em cada dispositivo antes de abrir. Na web, isso exige uma chave de acesso.';

  @override
  String get requireAppLockOwnFirst =>
      'Ative o bloqueio do app neste dispositivo primeiro.';

  @override
  String get permLocation => 'Localização';

  @override
  String get permLocationAlways => 'Localização em segundo plano';

  @override
  String get permCamera => 'Câmera';

  @override
  String get permMicrophone => 'Microfone';

  @override
  String get permSpeech => 'Reconhecimento de voz';

  @override
  String get permPhotos => 'Fotos';

  @override
  String get permContacts => 'Contatos';

  @override
  String get permCalendar => 'Calendários';

  @override
  String get permHealth => 'Saúde';

  @override
  String get permNotifications => 'Notificações';

  @override
  String get permNotificationAccess => 'Acesso às notificações';

  @override
  String get permAccessibility => 'Acessibilidade';

  @override
  String get permScreenRecording => 'Gravação de Tela';

  @override
  String get permAutomation => 'Automação';

  @override
  String get permFullDisk => 'Acesso Total ao Disco';

  @override
  String get permSharedFolders => 'Pastas compartilhadas';

  @override
  String get permLocalTools => 'Ferramentas locais';

  @override
  String get cardPermissions => 'Permissões';

  @override
  String permissionsTitle(String device) {
    return 'Ative isto em $device';
  }

  @override
  String get permStateOn => 'Ativado';

  @override
  String get permStateOff => 'Desativado';

  @override
  String get permStateNotAsked => 'Ainda não pedido';

  @override
  String get permStateLimited => 'Limitado';

  @override
  String get permStateUnknown => 'Desconhecido';

  @override
  String get permStateUnavailable => 'Não disponível neste dispositivo';

  @override
  String get permStateUpdate => 'Atualize o Casama para ativar isto aqui';

  @override
  String get permTurnOn => 'Ativar';

  @override
  String get permOpenSettings => 'Abrir configurações';

  @override
  String get permOpenHealth => 'Abrir Saúde';

  @override
  String get permHealthIosHow =>
      'Em Saúde, toque na sua foto, depois em Apps, depois em Casama, e ative o que seus bots podem ler.';

  @override
  String get permChoose => 'Escolher';

  @override
  String get permRestart => 'Reiniciar o Casama';

  @override
  String get permRestartToFinish => 'Reinicie o Casama para concluir';

  @override
  String permOpenedOn(String device) {
    return 'Aberto em $device';
  }

  @override
  String permSentTo(String device) {
    return 'Enviado para $device: toque na notificação lá';
  }

  @override
  String permOffline(String device) {
    return '$device está offline';
  }

  @override
  String permRestarting(String device) {
    return 'Reiniciando o Casama em $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Só o dono de $device pode ativar isto';
  }

  @override
  String get permNotNowLine => 'Agora não';

  @override
  String get permContinue => 'Continuar';

  @override
  String get permContinueMessage => 'Já ativei, pode continuar.';

  @override
  String get permContinuedLine => 'Ativado';

  @override
  String get permissionsScreenTitle => 'Permissões';

  @override
  String get permissionsScreenHelp =>
      'O que os bots podem usar neste dispositivo. Nada é pedido até você tocar.';

  @override
  String get permissionsRowHelp =>
      'Localização, tela, microfone e mais neste dispositivo';

  @override
  String permOtherDevice(String device) {
    return 'Isto era para $device. Abra o Casama lá para ativar.';
  }

  @override
  String get permAnotherDevice => 'outro dispositivo';

  @override
  String get permissionsNone => 'Nada para ativar neste dispositivo.';

  @override
  String get widgetNeedsYou => 'Precisa de você';

  @override
  String get widgetAllClear => 'Tudo em ordem';

  @override
  String get widgetAllow => 'Permitir';

  @override
  String get widgetDeny => 'Recusar';

  @override
  String get widgetReview => 'Revisar';

  @override
  String get widgetOpen => 'Abrir';

  @override
  String get widgetDoIt => 'Fazer';

  @override
  String get widgetRunNow => 'Executar agora';

  @override
  String get widgetStarted => 'Iniciado';

  @override
  String get widgetStop => 'Parar';

  @override
  String get widgetAsk => 'Perguntar';

  @override
  String widgetAskBot(String bot) {
    return 'Perguntar a $bot';
  }

  @override
  String get widgetTalk => 'Conversar';

  @override
  String get widgetTry => 'Testar';

  @override
  String get widgetUpNext => 'A seguir';

  @override
  String get widgetNoRoutines => 'Nenhuma rotina ainda';

  @override
  String get widgetWorking => 'Trabalhando';

  @override
  String get widgetWaiting => 'Esperando você';

  @override
  String get widgetIdle => 'Inativo';

  @override
  String widgetRepliedAt(String time) {
    return 'Respondeu às $time';
  }

  @override
  String get widgetBrief => 'Resumo';

  @override
  String widgetBriefAt(String time) {
    return 'Resumo às $time';
  }

  @override
  String get widgetNoBrief => 'Sem resumo ainda';

  @override
  String get widgetToday => 'Hoje';

  @override
  String get widgetCredits => 'Créditos';

  @override
  String widgetCreditsLeft(String amount) {
    return 'Restam $amount';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount hoje';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n% usado';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Renova às $time';
  }

  @override
  String get widgetFinished => 'Concluído';

  @override
  String get widgetLibrary => 'Biblioteca';

  @override
  String get widgetNoCreations => 'Nada feito ainda';

  @override
  String get widgetTasks => 'Tarefas';

  @override
  String get widgetTodo => 'A fazer';

  @override
  String get widgetInProgress => 'Em andamento';

  @override
  String get widgetInReview => 'Em revisão';

  @override
  String get widgetBlocked => 'Bloqueadas';

  @override
  String get widgetSignIn => 'Abra o Casama para entrar';

  @override
  String get widgetNoBots => 'Conheça seu primeiro bot';

  @override
  String widgetAsOf(String time) {
    return 'às $time';
  }

  @override
  String get widgetUpdateServer =>
      'Atualize seu servidor do Casama para usar este widget';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot precisa do seu OK';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot sugere';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot precisa que você assuma o controle';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Próximo resumo: $time';
  }

  @override
  String get widgetNothingNext => 'Nada agendado';

  @override
  String get widgetsTitle => 'Widgets';

  @override
  String get widgetsRow => 'Seus bots na tela inicial e na Tela Bloqueada';

  @override
  String get widgetsIntro =>
      'Os widgets mostram o que seus bots estão fazendo e o que espera por você, sem abrir o Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Rotinas';

  @override
  String get widgetDescNeedsYou => 'Veja quais bots estão esperando você';

  @override
  String get widgetDescBot => 'Veja o que um bot está fazendo';

  @override
  String get widgetDescAsk => 'Pergunte ou fale com um bot com um toque';

  @override
  String get widgetDescRoutines => 'Veja o que roda em seguida e execute agora';

  @override
  String get widgetDescToday => 'Veja todo o seu dia em um widget grande';

  @override
  String get widgetDescBrief => 'Leia seu resumo da manhã';

  @override
  String get widgetDescLibrary => 'Veja o que seus bots criaram ultimamente';

  @override
  String get widgetDescTasks => 'Veja como está o quadro de tarefas';

  @override
  String get widgetDescCredits => 'Acompanhe seus créditos de perto';

  @override
  String get widgetsAddToHome => 'Adicionar à tela inicial';

  @override
  String get widgetsPinUnsupported =>
      'Seu inicializador não permite adicionar widgets por aqui. Toque e segure um espaço vazio na tela inicial, toque em Widgets e escolha o Casama.';

  @override
  String get widgetsHowToAdd => 'Como adicionar';

  @override
  String get widgetsHowToIos =>
      'Toque e segure um espaço vazio na Tela de Início, toque em Editar, depois em Adicionar Widget e escolha o Casama.';

  @override
  String get widgetsHowToMac =>
      'Clique na data e hora na barra de menus, depois em Editar Widgets e escolha o Casama. Ou clique com o botão direito na mesa e escolha Editar Widgets.';

  @override
  String get widgetsLockScreen => 'Tela Bloqueada e controles';

  @override
  String get widgetsLockScreenHelp =>
      'Toque e segure a Tela Bloqueada, toque em Personalizar, depois em Tela Bloqueada, e toque no espaço abaixo do relógio para adicionar Precisa de você, A seguir, Bot ou Créditos. Uma solicitação fica oculta até você desbloquear.';

  @override
  String get widgetsControlsHelp =>
      'Abra a Central de Controle, toque e segure, toque em Adicionar um Controle e escolha Perguntar ao Casama, Falar com um bot ou Executar rotina. Eles também cabem nos cantos da Tela Bloqueada e no botão de Ação.';

  @override
  String get widgetsShowDetails => 'Mostrar detalhes nos widgets';

  @override
  String get widgetsShowDetailsHelp =>
      'Com o bloqueio do app ativado, os widgets mostram apenas números e nomes de bots, e os botões abrem o Casama. Ative para mostrar também solicitações, mensagens e nomes de rotinas.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Só importa enquanto o bloqueio do app está ativado. Sem ele, os widgets mostram detalhes.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace exige o bloqueio do app, então os widgets mantêm os detalhes ocultos.';
  }

  @override
  String get widgetsPinBot => 'Fixar um bot na tela inicial';

  @override
  String get widgetsPinBotHelp =>
      'Coloca o bot na tela inicial como um ícone próprio. Toque nele para conversar.';

  @override
  String get widgetsPin => 'Fixar';

  @override
  String get widgetNudgeNeedsYou =>
      'Responda a pedidos pela tela inicial com o widget Precisa de você.';

  @override
  String get widgetNudgeRoutines =>
      'Execute rotinas pela tela inicial com o widget Rotinas.';

  @override
  String get widgetNameCanvas => 'Quadro';

  @override
  String get widgetDescCanvas =>
      'Mostra o que seus bots colocam ali, como um versículo do dia ou uma contagem regressiva';

  @override
  String get canvasEmpty => 'Peça a um bot para colocar algo aqui';

  @override
  String get canvasTry =>
      'Tente: coloque um versículo do dia na minha Tela Bloqueada';

  @override
  String get canvasAutomatic => 'Automático';

  @override
  String canvasIn(String time) {
    return 'em $time';
  }

  @override
  String canvasSince(String time) {
    return 'há $time';
  }

  @override
  String get canvasNow => 'Agora';

  @override
  String canvasLeft(String n) {
    return 'Faltam $n';
  }

  @override
  String get canvasLeftUnit => 'faltam';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dias',
      one: 'dia',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widgets';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot quer mostrar isto nos seus widgets';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Depois que você disser sim, $bot pode alterar isso sem perguntar. Você pode parar quando quiser em Configurações, Widgets.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot colocou isto nos seus widgets';
  }

  @override
  String get canvasShow => 'Mostrar nos meus widgets';

  @override
  String get canvasShowing => 'Mostrando nos seus widgets';

  @override
  String canvasNotShown(String bot) {
    return 'Não mostrado. $bot pode perguntar outro dia.';
  }

  @override
  String get canvasGone => 'Não está mais nos seus widgets';

  @override
  String get canvasNotPlaced => 'Adicione o widget Quadro para vê-lo.';

  @override
  String get canvasHowToIos =>
      'Toque e segure a Tela de Início ou a Tela Bloqueada, toque em Editar, depois em Adicionar Widget e escolha Casama, depois Quadro.';

  @override
  String get canvasHowToMac =>
      'Clique com o botão direito na mesa, escolha Editar Widgets e selecione Casama, depois Quadro.';

  @override
  String get canvasHowToElsewhere =>
      'Adicione o widget Quadro do Casama no seu celular ou Mac para vê-lo lá.';

  @override
  String get canvasAdded => 'Widget Quadro adicionado';

  @override
  String get canvasLockScreen => 'Na Tela Bloqueada';

  @override
  String get widgetsFromBots => 'Dos seus bots';

  @override
  String get widgetsFromBotsEmpty =>
      'Nada ainda. Peça a um bot algo como “Coloque um versículo do dia na minha Tela Bloqueada”.';

  @override
  String canvasSetAt(String time) {
    return 'Definido $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Mostrando em $devices';
  }

  @override
  String get canvasNoWidget => 'Nenhum widget Quadro posicionado ainda';

  @override
  String get canvasPausedLine => 'Pausado';

  @override
  String get canvasWaitingLine => 'Aguardando seu sim';

  @override
  String get canvasHideLocked => 'Ocultar com o celular bloqueado';

  @override
  String get canvasPause => 'Pausar';

  @override
  String get canvasResume => 'Retomar';

  @override
  String get canvasClear => 'Limpar';

  @override
  String canvasClearTitle(String name) {
    return 'Limpar $name?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Ele sai dos seus widgets. $bot pode colocar algo ali de novo.';
  }

  @override
  String get canvasAllowedBots => 'Bots nos seus widgets';

  @override
  String get canvasMayShow => 'Pode mostrar coisas nos seus widgets';

  @override
  String canvasStopTitle(String bot) {
    return 'Parar $bot?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'O que $bot mostra nos seus widgets é limpo, e ele terá que pedir permissão de novo.';
  }

  @override
  String get canvasStop => 'Parar';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Celular Android';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Mostrar';

  @override
  String get widgetLowRisk => 'Baixo risco';

  @override
  String get widgetThisMonth => 'Este mês';

  @override
  String get watchNow => 'Agora';

  @override
  String get watchAsk => 'Perguntar';

  @override
  String watchAskBot(String bot) {
    return 'Perguntar a $bot';
  }

  @override
  String get watchBots => 'Bots';

  @override
  String get watchUpNext => 'A seguir';

  @override
  String get watchBrief => 'Resumo';

  @override
  String get watchSettings => 'Configurações';

  @override
  String get watchChat => 'Chat';

  @override
  String get watchTalk => 'Conversar';

  @override
  String get watchCredits => 'Créditos';

  @override
  String get watchNeedsYou => 'Precisa de você';

  @override
  String get watchNeedsYouOne => '1 precisa de você';

  @override
  String watchNeedsYouMany(String count) {
    return '$count precisam de você';
  }

  @override
  String get watchNeedsOk => 'Precisa do seu OK';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot precisa do seu OK';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot sugere';
  }

  @override
  String get watchTakeOver => 'Quer que você assuma o controle';

  @override
  String get watchAllClear => 'Tudo em ordem';

  @override
  String get watchNothingWaiting => 'Nada precisa de você';

  @override
  String get watchAllow => 'Permitir';

  @override
  String get watchDeny => 'Recusar';

  @override
  String get watchHoldToAllow => 'Segure para permitir';

  @override
  String get watchHoldHint => 'Permitir isto? Toque duas vezes para permitir.';

  @override
  String get watchReview => 'Revisar';

  @override
  String get watchReviewOnIphone => 'Revisar no iPhone';

  @override
  String get watchReviewOnPhone => 'Revisar no celular';

  @override
  String get watchWhyHighRisk => 'Alto risco: responda no celular';

  @override
  String get watchWhyPayment => 'Pagamentos são respondidos no celular';

  @override
  String get watchWhySetting => 'Suas configurações mantêm isto no celular';

  @override
  String get watchWhyWorkspace =>
      'Seu espaço de trabalho mantém isto no celular';

  @override
  String get watchWhyNotYours => 'Só quem iniciou este chat pode permitir';

  @override
  String get watchHighRisk => 'Alto risco';

  @override
  String get watchMediumRisk => 'Médio risco';

  @override
  String get watchLowRisk => 'Baixo risco';

  @override
  String get watchAllowed => 'Permitido';

  @override
  String get watchDenied => 'Recusado';

  @override
  String get watchDone => 'Feito';

  @override
  String get watchAlreadyAnswered => 'Já respondido';

  @override
  String get watchLockToAllow =>
      'Defina um código neste relógio para permitir por ele';

  @override
  String get watchDoIt => 'Fazer';

  @override
  String get watchNotNow => 'Agora não';

  @override
  String get watchOpenOnIphone => 'Abrir no iPhone';

  @override
  String get watchOpenOnPhone => 'Abrir no celular';

  @override
  String get watchSentToPhone => 'Enviado para seu celular';

  @override
  String get watchWorking => 'Trabalhando';

  @override
  String watchIsWorking(String bot) {
    return '$bot está trabalhando';
  }

  @override
  String get watchWaitingForYou => 'Esperando você';

  @override
  String watchRepliedAt(String time) {
    return 'Respondeu às $time';
  }

  @override
  String get watchIdle => 'Inativo';

  @override
  String get watchOff => 'Desativado';

  @override
  String watchStepCount(String count) {
    return 'Etapa $count';
  }

  @override
  String get watchStop => 'Parar';

  @override
  String get watchStopped => 'Parado';

  @override
  String get watchFinished => 'Concluído';

  @override
  String get watchProblem => 'Parou com um problema';

  @override
  String get watchCouldntFinish => 'Não concluído';

  @override
  String get watchListening => 'Ouvindo…';

  @override
  String get watchTapToStop => 'Toque para parar';

  @override
  String get watchTypeInstead => 'Digitar';

  @override
  String get watchSending => 'Enviando…';

  @override
  String get watchHeard => 'Entendido';

  @override
  String get watchUndo => 'Desfazer';

  @override
  String get watchKeptOffline =>
      'Salvo. Será enviado quando você ficar online de novo';

  @override
  String watchKeptOld(String time) {
    return 'Enviar o que você pediu às $time?';
  }

  @override
  String get watchSend => 'Enviar';

  @override
  String get watchDiscard => 'Descartar';

  @override
  String get watchMicDenied =>
      'Permita o microfone em Ajustes para perguntar por voz';

  @override
  String get watchNoDictation =>
      'Este servidor não tem serviço de voz. Use “Digitar”';

  @override
  String get watchDidntCatch => 'Não entendi. Tente novamente';

  @override
  String get watchReply => 'Responder';

  @override
  String get watchReadAloud => 'Ler em voz alta';

  @override
  String get watchStopReading => 'Parar leitura';

  @override
  String get watchContinuesOnIphone => 'Continua no iPhone';

  @override
  String get watchContinuesOnPhone => 'Continua no celular';

  @override
  String get watchReplyReady => 'Resposta pronta';

  @override
  String get watchYou => 'Você';

  @override
  String get watchQuickYes => 'Sim';

  @override
  String get watchQuickNo => 'Não';

  @override
  String get watchQuickTellMore => 'Me diga mais';

  @override
  String get watchQuickNotNow => 'Agora não';

  @override
  String get watchRunNow => 'Executar agora';

  @override
  String get watchStarted => 'Iniciado';

  @override
  String watchInMinutes(String minutes) {
    return 'em $minutes min';
  }

  @override
  String get watchNoRoutines => 'Nenhuma rotina ainda';

  @override
  String watchBriefAt(String time) {
    return 'Resumo às $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Resumo às $time amanhã';
  }

  @override
  String get watchNoBrief => 'Nenhum resumo configurado';

  @override
  String get watchNoBots => 'Nenhum bot ainda. Crie um no seu celular';

  @override
  String get watchSigningIn => 'Entrando';

  @override
  String watchSignedInAs(String name) {
    return 'Conectado como $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Abra o Casama no iPhone para concluir';

  @override
  String get watchOpenPhoneToFinish => 'Abra o Casama no celular para concluir';

  @override
  String get watchUseCode => 'Entrar com um código';

  @override
  String get watchCodeHelp =>
      'Digite no Casama no celular ou computador: Configurações → Relógio';

  @override
  String get watchNewCode => 'Novo código';

  @override
  String get watchSignedOut => 'Este relógio está desconectado';

  @override
  String get watchOpenToSignIn => 'Abra o Casama para entrar';

  @override
  String watchAsOf(String time) {
    return 'às $time';
  }

  @override
  String get watchOffline => 'Offline';

  @override
  String get watchCouldntReach => 'Sem conexão com o Casama';

  @override
  String get watchTryAgain => 'Tentar novamente';

  @override
  String get watchServerTooOld =>
      'Atualize seu servidor do Casama para usar o relógio';

  @override
  String get watchOutOfCredits => 'Sem créditos';

  @override
  String get watchTalkOnPhone => 'Iniciando a chamada no seu celular';

  @override
  String get watchSignOut => 'Desconectar este relógio';

  @override
  String get watchHideDetails => 'Ocultar detalhes ao abaixar o pulso';

  @override
  String get watchReadRepliesAloud => 'Ler respostas em voz alta';

  @override
  String get watchAskUses => 'Bot para Perguntar';

  @override
  String get watchWorkspace => 'Espaço de trabalho';

  @override
  String get watchSignedInAsLabel => 'Conectado como';

  @override
  String get watchCompNeedsYou => 'Precisa de você';

  @override
  String get watchCompAsk => 'Perguntar a um bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'A seguir';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou =>
      'Quantas solicitações aguardam e a primeira delas';

  @override
  String get watchCompDescAsk => 'Pergunte a um bot por voz com um toque';

  @override
  String get watchCompDescBot => 'Onde um bot está e o que está fazendo';

  @override
  String get watchCompDescUpNext => 'A próxima rotina e quando ela roda';

  @override
  String get watchCompDescCredits => 'Créditos usados neste período';

  @override
  String get watchNeedYouShort => 'aguardam';

  @override
  String get watchControlAsk => 'Perguntar ao Casama';

  @override
  String get watchControlTalk => 'Falar com um bot';

  @override
  String get watchControlRun => 'Executar uma rotina';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count precisam de você. Primeiro: $text';
  }

  @override
  String get watchPhoneTitle => 'Relógio';

  @override
  String get watchPhoneIntro =>
      'Responda aos bots, pergunte por voz e veja quem está trabalhando, direto do pulso.';

  @override
  String get watchPhoneWatches => 'Relógios conectados';

  @override
  String get watchPhoneNone =>
      'Nenhum relógio conectado ainda. Abra o Casama no relógio e ele entra sozinho.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Último uso $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Ainda não usado';

  @override
  String get watchPhoneRemove => 'Remover';

  @override
  String watchPhoneRemoveTitle(String name) {
    return 'Remover $name?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Ele sai na hora. Você pode conectá-lo novamente depois.';

  @override
  String get watchPhoneUseCode => 'Conectar um relógio com código';

  @override
  String get watchPhoneCodeHint => 'O código no seu relógio';

  @override
  String watchPhoneCodeAsk(String name) {
    return 'Conectar $name?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Ele será conectado a $workspace como você. Só permita um código exibido no seu próprio relógio.';
  }

  @override
  String get watchPhoneCodeAllow => 'Conectar';

  @override
  String get watchPhoneCodeWrong =>
      'Esse código não funcionou. Confira no relógio';

  @override
  String get watchPhoneCodeTaken =>
      'Este relógio ainda está conectado a outra conta. Remova-o lá em Configurações → Relógio e gere um novo código';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Conectado a $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'Conectado a outro espaço de trabalho';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name está conectado';
  }

  @override
  String get watchPhoneAllowTitle => 'Permitir pelo relógio';

  @override
  String get watchPhoneAllowMedium => 'Risco baixo e médio';

  @override
  String get watchPhoneAllowMediumBody =>
      'Baixo risco com um toque, médio risco mantendo pressionado. Alto risco e pagamentos sempre precisam do celular.';

  @override
  String get watchPhoneAllowLow => 'Apenas baixo risco';

  @override
  String get watchPhoneAllowNone => 'Nunca';

  @override
  String get watchPhoneDetails => 'Mostrar detalhes no relógio';

  @override
  String get watchPhoneDetailsBody =>
      'Desativado: o relógio mostra quantidades e nomes dos bots, não o que os bots escreveram.';

  @override
  String get watchPhoneQuickReplies => 'Respostas rápidas';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Respostas curtas que você pode enviar por uma notificação de resposta. Até seis.';

  @override
  String get watchPhoneQuickAdd => 'Adicionar resposta rápida';

  @override
  String get watchPhoneQuickReset => 'Usar respostas padrão';

  @override
  String get watchPhoneHowTo => 'Adicionar o Casama ao mostrador';

  @override
  String get watchPhoneHowToApple =>
      'Toque e segure o mostrador, toque em Editar e escolha o Casama para uma complicação. Gire a Digital Crown no mostrador para encontrar o Casama na Pilha Inteligente.';

  @override
  String get watchPhoneHowToWear =>
      'Toque e segure o mostrador para adicionar uma complicação do Casama. Deslize para a esquerda a partir do mostrador e toque em + para adicionar um bloco do Casama.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Conectando $name…';
  }

  @override
  String get watchPhoneLockAsk => 'Conectar seu relógio?';

  @override
  String get watchPhoneNudge =>
      'O Casama também está no seu relógio. Responda aos bots do seu pulso.';

  @override
  String get watchPhoneHandoffTitle => 'Do seu relógio';

  @override
  String get watchPhoneRow => 'Seus bots no Apple Watch ou no relógio Wear OS';

  @override
  String get watchPhoneAllowLowBody =>
      'Baixo risco com um toque. Tudo o mais precisa do celular.';

  @override
  String get watchPhoneAllowNoneBody =>
      'O relógio só pode recusar. Permita no celular.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Desativado porque o bloqueio do app está ativado, então seu relógio não mostra palavras dos chats. Ative para vê-las.';

  @override
  String get watchPhoneQuickHint => 'Uma resposta curta';

  @override
  String get watchPhoneQuickTooLong => 'Até 40 caracteres';

  @override
  String get watchPhoneQuickMoveUp => 'Mover para cima';

  @override
  String get watchPhoneQuickMoveDown => 'Mover para baixo';

  @override
  String get watchPhoneQuickDelete => 'Excluir esta resposta';

  @override
  String get watchPhoneCodeBody =>
      'No relógio, abra o Casama e escolha Entrar com um código.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking =>
      'Quem está trabalhando e o que está fazendo';

  @override
  String get watchCompDescBrief => 'O resumo desta manhã';

  @override
  String get watchCodeWaiting => 'Aguardando o código…';

  @override
  String watchCodeA11y(String code) {
    return 'Código de login $code';
  }

  @override
  String get watchChooseBot => 'Escolha um bot';

  @override
  String get watchChannelRequests => 'Solicitações';

  @override
  String get watchChannelReplies => 'Respostas';

  @override
  String get watchChannelRuns => 'Bots trabalhando';

  @override
  String get watchChannelOther => 'Outros';

  @override
  String get watchOtherWorkspace =>
      'Isto está em outro espaço de trabalho. Responda no celular';

  @override
  String get watchReplySent => 'Enviado';

  @override
  String get watchReplyNotSent => 'Não foi possível enviar sua resposta';

  @override
  String watchAskDropped(String time) {
    return 'Não foi possível enviar o que você pediu às $time';
  }

  @override
  String get watchNeedsHttps =>
      'Este relógio só alcança seu servidor por https ou na rede local';

  @override
  String get watchSignIn => 'Entrar';

  @override
  String get watchNotOnWatch =>
      'Este relógio não pode responder a esta solicitação. Abra no celular';

  @override
  String watchMoreOnPhone(String count) {
    return 'mais $count no celular';
  }

  @override
  String get watchShareCrashReports => 'Compartilhar relatórios de falhas';

  @override
  String get showList => 'Mostrar a lista';

  @override
  String get hideList => 'Ocultar a lista';

  @override
  String get panePickLibrary => 'Escolha algo na Biblioteca para ver aqui.';

  @override
  String get panePickSetting => 'Escolha uma configuração para ver aqui.';

  @override
  String get trackpad => 'Trackpad';

  @override
  String get trackpadHint =>
      'Um dedo move o ponteiro, dois rolam, um toque clica.';

  @override
  String get trackpadTakeControl => 'Assuma o controle para usar o trackpad.';

  @override
  String get foldScreenTitle => 'Tela dobrável';

  @override
  String get foldRowHelp => 'O que o Casama vê das telas deste dispositivo';

  @override
  String get foldScreenHelp =>
      'Como este dispositivo está sendo segurado e onde fica a dobra, segundo o Casama agora. Abra, feche ou dobre o dispositivo e os números acompanham. Copie-os se alguma tela parecer estranha.';

  @override
  String get foldPose => 'Postura';

  @override
  String get foldWindow => 'Janela';

  @override
  String get foldInsets => 'Área segura';

  @override
  String get foldStrip => 'Faixa lateral';

  @override
  String get foldFold => 'Dobra';

  @override
  String get foldHinge => 'Dobradiça';

  @override
  String get foldSystemSays => 'O que o sistema informa';

  @override
  String get inviteGateLine =>
      'O Casama Cloud é só para convidados por enquanto.';

  @override
  String get inviteGateSelfHost =>
      'Executar o Casama no seu próprio servidor é aberto a todos.';

  @override
  String get joinTheWaitlist => 'Entrar na lista de espera';

  @override
  String get iHaveAnInvite => 'Tenho um convite';

  @override
  String get waitlistSubtitle =>
      'Liberamos o acesso aos poucos. Você receberá um e-mail quando chegar a sua vez.';

  @override
  String get waitlistNote => 'O que você pediria para um bot fazer primeiro?';

  @override
  String get waitlistNoteHint => 'Opcional';

  @override
  String get waitlistSelfHosting =>
      'Eu executo o Casama no meu próprio servidor';

  @override
  String get waitlistNewsletter =>
      'Também quero receber o e-mail mensal do Casama (no máximo uma vez por mês)';

  @override
  String get waitlistAppleRelay =>
      'Este é o endereço privado que a Apple criou para você. Mantenha-o se for entrar com a Apple; a Apple encaminha nosso e-mail para sua Caixa de entrada.';

  @override
  String get waitlistJoinedTitle => 'Você está na lista.';

  @override
  String get waitlistJoinedBody =>
      'Liberamos o acesso aos poucos. Você receberá um e-mail quando chegar a sua vez, e nada mais, a menos que tenha pedido o e-mail mensal. Conhece alguém que usa o Casama? Um convite dessa pessoa libera a entrada na hora.';

  @override
  String get waitlistJoinedCode => 'Tem um código de convite? Digite aqui.';

  @override
  String get waitlistJoinedSelfHost =>
      'Não quer esperar? O Casama é de código aberto. Execute-o no seu próprio computador hoje mesmo.';

  @override
  String get waitlistRunItYourself => 'Rodar por conta própria';

  @override
  String get inviteSubtitle =>
      'Digite seu código de convite ou cole o link do convite.';

  @override
  String get inviteCodeLabel => 'Código de convite';

  @override
  String get inviteNotFound =>
      'Esse código não corresponde a nenhum convite. Confira e tente novamente.';

  @override
  String inviteFromName(String name) {
    return '$name convidou você para o Casama';
  }

  @override
  String get inviteFromFriend => 'Um amigo convidou você para o Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Seu convite: $label';
  }

  @override
  String get inviteFromCasama => 'Seu convite para o Casama';

  @override
  String get inviteChooseSignIn =>
      'Agora escolha como você vai entrar. Use o endereço que deseja para sua conta.';

  @override
  String get inviteGoneHelp =>
      'Esses convites acabaram. Digite seu e-mail para entrar na lista de espera, na frente da fila.';

  @override
  String get inviteEmailHelp =>
      'Vamos liberar este endereço e enviar um link de login para ele.';

  @override
  String inviteCheckInbox(String email) {
    return 'Você entrou. Confira $email para ver o link de login ou digite o código aqui.';
  }

  @override
  String get inviteWaitlistedTitle => 'Você está na lista de espera';

  @override
  String get inviteWaitlisted =>
      'Esses convites acabaram, mas você está na frente da fila.';

  @override
  String get inviteUseEmailHere =>
      'Neste dispositivo, use Continuar com E-mail. Apple e Google funcionam com um convite nos apps para iPhone, Mac e Android.';

  @override
  String get inviteDifferentCode => 'Usar outro código';

  @override
  String get inviteRefusedHelp =>
      'Entre na lista de espera e enviaremos um e-mail quando chegar a sua vez, ou digite um código de convite se tiver um.';

  @override
  String get inviteRefusedWaitlisted =>
      'O Casama Cloud é só para convidados por enquanto. Enviaremos um e-mail quando chegar a sua vez. Tem um código de convite? Use agora.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count convites restantes',
      one: '$count convite restante',
      zero: 'Nenhum convite restante',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used de $total usados. Cada um permite que um amigo crie uma conta.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Seus convites são liberados após seu primeiro chat concluído.';

  @override
  String get inviteWaitingTitle => 'Esperando seu convite';

  @override
  String get inviteWaitingUses => 'Deixá-los entrar usa um dos seus convites.';

  @override
  String get inviteWaitingNoneLeft =>
      'Você ganha um convite de volta quando um amigo convidado concluir o primeiro chat.';

  @override
  String get inviteWaitingLetIn => 'Liberar acesso';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Liberar acesso para $email';
  }

  @override
  String get inviteWaitingDone =>
      'Ele receberá um e-mail para se cadastrar em alguns minutos.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Guardei um dos meus $count convites do Casama para você.',
      one: 'Guardei um dos meus $count convites do Casama para você.',
    );
    return '$_temp0 O Casama é só para convidados por enquanto, e isto dá acesso imediato: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Guardei um dos meus $count convites do Casama para você.',
      one: 'Guardei um dos meus $count convites do Casama para você.',
    );
    return '$_temp0 O Casama é só para convidados por enquanto. Isto dá acesso imediato e você ganha $amount de uso gratuito após seu primeiro chat: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Para quem é?';

  @override
  String get inviteNameHelp =>
      'Adicione o primeiro nome e a página do convite cumprimenta a pessoa pelo nome. Você pode deixar vazio.';

  @override
  String get inviteNameHint => 'Primeiro nome';

  @override
  String get inviteNameShare => 'Compartilhar convite';

  @override
  String get inviteAskTitle => 'Quem mais usaria isto?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Você tem $count convites para o Casama. Cada um dá acesso imediato a um amigo.',
      one:
          'Você tem $count convites para o Casama. Cada um dá acesso imediato a um amigo.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Cada um ganha $amount de uso gratuito após o primeiro chat dele.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Você ganha $amount de uso gratuito após o primeiro chat dele.';
  }

  @override
  String get inviteAskSend => 'Enviar um convite';

  @override
  String get inviteAskNotNow => 'Agora não';

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
      one: '$count recarga guardada',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Usar até $date';
  }

  @override
  String get savedResetUse => 'Usar recarga';

  @override
  String get savedResetConfirmTitle => 'Usar esta recarga?';

  @override
  String get savedResetConfirmDaily =>
      'Limpa o limite de hoje para que seus bots possam trabalhar novamente hoje. Isto não pode ser desfeito.';

  @override
  String get savedResetConfirmComputer =>
      'Devolve as horas de computador deste mês. Isto não pode ser desfeito.';

  @override
  String get savedResetOwnerRequired =>
      'Apenas um proprietário do espaço de trabalho pode usar.';

  @override
  String get savedResetPaused =>
      'Pausada por enquanto. Tente novamente mais tarde.';

  @override
  String get savedResetPeriodLimit =>
      'Você já usou a recarga deste período. Pode usar esta no próximo período.';

  @override
  String get savedResetNothingToRefill =>
      'Nada para recarregar ainda. Guarde para quando os créditos estiverem acabando.';

  @override
  String get savedResetNoBillingPeriod =>
      'Disponível assim que seu plano terminar de ser configurado.';

  @override
  String get savedResetUnavailable => 'Não disponível agora.';

  @override
  String savedResetDone(String amount) {
    return 'Recarga usada: $amount adicionados';
  }

  @override
  String get savedResetDoneNoCredits => 'Recarga usada';

  @override
  String savedResetConfirm(String amount) {
    return 'Recarrega $amount dos créditos incluídos neste período. Isto não pode ser desfeito.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Ativar recargas guardadas';

  @override
  String get resetsOffNote => 'Desativado: ninguém recebe recargas guardadas.';

  @override
  String get resetsDecrease => 'Diminuir';

  @override
  String get resetsIncrease => 'Aumentar';

  @override
  String get resetsSettings => 'Configurações';

  @override
  String get resetsCampaigns => 'Campanhas';

  @override
  String get resetsStatLive => 'No ar';

  @override
  String get resetsStatGiven => 'Concedidas';

  @override
  String get resetsStatUsed => 'Usadas';

  @override
  String get resetsStatRefilled => 'Recarregado';

  @override
  String get resetsFilterActive => 'Ativas';

  @override
  String get resetsFilterEnded => 'Encerradas';

  @override
  String get resetsFilterAll => 'Todas';

  @override
  String get resetsStateDraft => 'Rascunho';

  @override
  String get resetsStateScheduled => 'Agendada';

  @override
  String get resetsStateLive => 'No ar';

  @override
  String get resetsStatePaused => 'Pausada';

  @override
  String get resetsStateEnded => 'Encerrada';

  @override
  String get resetsStateCancelled => 'Cancelada';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used de $budget de orçamento';
  }

  @override
  String resetsGivenN(String count) {
    return '$count concedidas';
  }

  @override
  String resetsUsedN(String count) {
    return '$count usadas';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Começa em $start · Termina em $end';
  }

  @override
  String get resetsToday => 'hoje';

  @override
  String get resetsTomorrow => 'amanhã';

  @override
  String get resetsYesterday => 'ontem';

  @override
  String get resetsAudienceEveryone => 'Todo espaço de trabalho';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count espaços de trabalho',
      one: '$count espaço de trabalho',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Entrou antes de $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Atingiu um limite nos últimos $days dias',
      one: 'Atingiu um limite no último $days dia',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Cancelar campanha';

  @override
  String get resetsCancelConfirm => 'Cancelar esta campanha?';

  @override
  String get resetsCancelConfirmBody =>
      'Para de conceder recargas guardadas. Isto não pode ser desfeito.';

  @override
  String get resetsDeleteConfirm => 'Excluir esta campanha?';

  @override
  String get resetsDeleteConfirmBody =>
      'O rascunho é removido definitivamente.';

  @override
  String get resetsNoCampaigns =>
      'Nenhuma campanha ainda. Inicie uma para dar recargas guardadas a vários espaços de trabalho de uma vez.';

  @override
  String get resetsNoMatches => 'Nenhuma campanha aqui.';

  @override
  String get resetsEditCampaign => 'Editar campanha';

  @override
  String get resetsSectionBasics => 'Básico';

  @override
  String get resetsSectionAudience => 'Público';

  @override
  String get resetsSectionTiming => 'Horário';

  @override
  String get resetsSectionRefill => 'Recarga';

  @override
  String get resetsSectionWhat => 'O que recarrega';

  @override
  String get resetsSectionNotify => 'Notificações';

  @override
  String get resetsPreviewLabel => 'O que as pessoas veem';

  @override
  String get resetsMonthly => 'Mensal';

  @override
  String get resetsYearly => 'Anual';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Planos';

  @override
  String get resetsPlansHint =>
      'Não marque nenhum para incluir todos os planos.';

  @override
  String get resetsWorkspacesLabel => 'Espaços de trabalho';

  @override
  String get resetsWorkspacesHint =>
      'Deixe vazio para incluir todos os espaços de trabalho.';

  @override
  String get resetsSearchWorkspaces => 'Buscar espaços de trabalho pelo nome';

  @override
  String get resetsNoWorkspaceMatch => 'Nenhum espaço de trabalho corresponde.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Somente $name';
  }

  @override
  String get resetsJoinedBefore => 'Entrou antes de';

  @override
  String get resetsLimitedDaysLabel => 'Atingiu um limite nos últimos N dias';

  @override
  String get resetsStartsLabel => 'Começa';

  @override
  String get resetsEndsLabel => 'Expira';

  @override
  String resetsPercentValue(int percent) {
    return 'Recarregar $percent% dos créditos incluídos';
  }

  @override
  String get resetsCapLabel => 'Máximo por uso';

  @override
  String get resetsBudgetLabel => 'Orçamento total';

  @override
  String get resetsOptional => 'Opcional';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Alcança cerca de $count espaços de trabalho · $credits em créditos · custa cerca de $cost';
  }

  @override
  String get resetsEstimating => 'Calculando o alcance…';

  @override
  String get resetsEstimateNeedsFields =>
      'Preencha os campos para ver o alcance.';

  @override
  String get resetsLockedNote =>
      'Esta campanha está em andamento: apenas mensagem, expiração, orçamento e lembrete podem mudar.';

  @override
  String get resetsRequired => 'Obrigatório.';

  @override
  String get resetsTooLong => 'No máximo 120 caracteres.';

  @override
  String get resetsDaysInvalid => 'Digite de 1 a 365 dias.';

  @override
  String get resetsMoneyInvalid => 'Digite 0 ou mais.';

  @override
  String get resetsExpiryBeforeStart => 'Escolha um término após o início.';

  @override
  String resetsGivenTo(String name) {
    return 'Recarga guardada concedida para $name';
  }

  @override
  String get resetsCampaignSaved => 'Campanha salva';

  @override
  String get resetsDefaultMessage =>
      'Uma recarga guardada, por nossa conta. Use quando atingir um limite.';

  @override
  String resetsGiveName(String name) {
    return 'Recarga guardada para $name';
  }

  @override
  String get resetsOneWorkspace => 'Um espaço de trabalho';

  @override
  String get resetsPickWorkspace =>
      'Escolha um espaço de trabalho para ver as recargas guardadas dele.';

  @override
  String get resetsAllHistory => 'Todo o histórico';

  @override
  String get resetsAllWorkspaces => 'Todos os espaços de trabalho';

  @override
  String get resetsNoEvents => 'Nada aqui ainda.';

  @override
  String get resetsEventGiven => 'Recarga guardada concedida';

  @override
  String get resetsEventUsed => 'Recarga guardada usada';

  @override
  String get resetsEventRevoked => 'Recolhida';

  @override
  String get resetsEventUndone => 'Recarga desfeita';

  @override
  String get resetsEventExpired => 'Expirou sem uso';

  @override
  String get resetsEventCreated => 'Campanha criada';

  @override
  String get resetsEventEdited => 'Campanha editada';

  @override
  String get resetsEventStarted => 'Campanha iniciada';

  @override
  String get resetsEventEnded => 'Campanha encerrada';

  @override
  String get resetsEventScheduled => 'Campanha agendada';

  @override
  String get resetsEventPaused => 'Campanha pausada';

  @override
  String get resetsEventResumed => 'Campanha retomada';

  @override
  String get resetsEventCancelled => 'Campanha cancelada';

  @override
  String get resetsEventDeleted => 'Campanha excluída';

  @override
  String get resetsEventSettings => 'Configurações alteradas';

  @override
  String get resetsRevokeConfirm => 'Recolher esta recarga guardada?';

  @override
  String get resetsRevokeConfirmBody =>
      'O espaço de trabalho a perde antes de usar.';

  @override
  String get resetsUndoConfirm => 'Desfazer esta recarga?';

  @override
  String get resetsUndoConfirmBody =>
      'Os créditos que ela adicionou são retirados novamente.';

  @override
  String get resetsPerPeriod => 'Usos por espaço de trabalho por período';

  @override
  String get resetsMaxHeld => 'Máximo de recargas guardadas';

  @override
  String get resetsNotifyOwners => 'Notificar proprietários da instância';

  @override
  String get resetsNewCampaign => 'Nova campanha';

  @override
  String get resetsName => 'Nome';

  @override
  String get resetsMessage => 'Mensagem para as pessoas';

  @override
  String get resetsPlans =>
      'Códigos dos planos, separados por vírgulas (vazio significa todos)';

  @override
  String get resetsWorkspaces =>
      'IDs dos espaços de trabalho, separados por vírgulas (vazio significa todos)';

  @override
  String get resetsBefore => 'Criado antes de (data e hora, opcional)';

  @override
  String get resetsLimitedDays =>
      'Atingiu um limite nos últimos N dias (opcional)';

  @override
  String get resetsStart => 'Começa (data e hora)';

  @override
  String get resetsExpiry => 'Expira (data e hora)';

  @override
  String get resetsPercent => 'Créditos incluídos a recarregar (%)';

  @override
  String get resetsCap => 'Máximo em dólares por uso (opcional)';

  @override
  String get resetsBudget =>
      'Orçamento total de créditos em dólares (opcional)';

  @override
  String get resetsDaily => 'Limpar o limite de modelos de hoje';

  @override
  String get resetsComputer => 'Recarregar as horas de computador deste mês';

  @override
  String get resetsArrival => 'Notificar ao chegar';

  @override
  String get resetsReminder => 'Lembrar antes de expirar';

  @override
  String get resetsPreviewSave => 'Pré-visualizar e salvar';

  @override
  String get resetsSchedule => 'Agendar';

  @override
  String get resetsPause => 'Pausar';

  @override
  String get resetsResume => 'Retomar';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count espaços de trabalho. Recarga máxima: $credits. Custo estimado: $cost.',
      one:
          '$count espaço de trabalho. Recarga máxima: $credits. Custo estimado: $cost.',
      zero:
          '0 espaços de trabalho. Recarga máxima: $credits. Custo estimado: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace =>
      'ID do espaço de trabalho (vazio para todo o histórico)';

  @override
  String get resetsHistory => 'Carregar histórico';

  @override
  String get resetsGive => 'Conceder uma recarga guardada';

  @override
  String get resetsCopyCsv => 'Copiar CSV';

  @override
  String get resetsRevoke => 'Recolher';

  @override
  String get resetsUndo => 'Desfazer recarga não usada';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention =>
      'Serviços de fornecedores precisam de atenção';

  @override
  String get vendorNotSetUp => 'Não configurado';

  @override
  String get vendorCheckNow => 'Verificar agora';

  @override
  String get vendorLimit => 'Limite ou valor pré-pago';

  @override
  String get vendorWarnAt => 'Avisar em';

  @override
  String get vendorExpiry => 'Expira';

  @override
  String get vendorHistory => 'Leituras recentes';

  @override
  String get vendorSave => 'Salvar';

  @override
  String get vendorEnabled => 'Monitoramento ativado';

  @override
  String get vendorUnknown => 'Desconhecido';

  @override
  String get vendorLow => 'Baixo';

  @override
  String get vendorOut => 'Esgotado';

  @override
  String get vendorOk => 'OK';

  @override
  String get vendorNoReading => 'Sem leitura ainda';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count precisam de atenção',
      one: '$count precisa de atenção',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count OK';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count não configurados';
  }

  @override
  String get vendorNoVendors => 'Nenhum serviço para monitorar ainda.';

  @override
  String get vendorCheckAll => 'Verificar tudo';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Verificando $done de $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serviços verificados',
      one: '$count serviço verificado',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count verificações falharam',
      one: '$count verificação falhou',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Precisa de atenção';

  @override
  String get vendorGroupHealthy => 'Saudável';

  @override
  String get vendorGroupIdle => 'Não configurado ou desativado';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mostrar mais $count',
      one: 'Mostrar mais $count',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Mostrar menos';

  @override
  String get vendorOff => 'Desativado';

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
    return 'Restam $amount';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Avisa abaixo de $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Reinicia $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Renova em $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Expirou em $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count minutos',
      one: 'em $count minuto',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count horas',
      one: 'em $count hora',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'em $count dias',
      one: 'em $count dia',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Verificado $when';
  }

  @override
  String get vendorSourceApi => 'Do serviço';

  @override
  String get vendorSourceOwnCount => 'Contado pelo Casama';

  @override
  String get vendorSourceManual => 'Inserido manualmente';

  @override
  String vendorReadingError(String error) {
    return 'Última verificação falhou: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Adicione a chave no servidor para começar a verificar.';

  @override
  String get vendorOffHint => 'O monitoramento está desativado.';

  @override
  String get vendorPickOne => 'Escolha um serviço para ver os detalhes.';

  @override
  String get vendorSectionStatus => 'Status';

  @override
  String get vendorSectionActions => 'Ações';

  @override
  String get vendorSectionAlerts => 'Alertas';

  @override
  String get vendorSectionPlan => 'Plano';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Avisar em $percent% usado';
  }

  @override
  String get vendorWarnAtHelp => 'O medidor fica âmbar aqui.';

  @override
  String get vendorPeriod => 'Período';

  @override
  String get vendorPeriodNone => 'Não definido';

  @override
  String get vendorPeriodDay => 'Diário';

  @override
  String get vendorPeriodMonth => 'Mensal';

  @override
  String get vendorPeriodBilling => 'Cada período de faturamento';

  @override
  String get vendorPeriodPrepaid => 'Pré-pago';

  @override
  String get vendorDateNotSet => 'Não definido';

  @override
  String get vendorClearDate => 'Limpar data';

  @override
  String get vendorLimitInvalid => 'Digite um número acima de 0.';

  @override
  String get vendorAmountInvalid => 'Digite 0 ou mais.';

  @override
  String get vendorMonthsInvalid => 'Digite de 1 a 120 meses.';

  @override
  String get vendorWarnAtInvalid => 'Escolha um ponto entre 1% e 100%.';

  @override
  String get vendorSaved => 'Configurações salvas';

  @override
  String get vendorCheckDone => 'Verificado';

  @override
  String get vendorHistoryEmpty => 'Sem leituras ainda.';

  @override
  String get vendorCheckFailed => 'Falha na verificação';

  @override
  String get vendorResets => 'Renovações';

  @override
  String get vendorSource => 'Origem';

  @override
  String get vendorBilling => 'Cobrança e recarga';

  @override
  String get vendorBalanceWarning => 'Avisar abaixo do saldo';

  @override
  String get vendorPeriodStart => 'O período começa';

  @override
  String get vendorInvalidSettings =>
      'Digite um limite positivo, um aviso entre 0 e 1 e datas válidas.';

  @override
  String get card24hRange => 'Variação em 24 horas';

  @override
  String get card52wRange => 'Variação em 52 semanas';

  @override
  String get cardAgain => 'Novamente';

  @override
  String get cardAgoSuffix => 'atrás';

  @override
  String get cardAirQuality => 'Qualidade do ar';

  @override
  String get cardAqiAdviceBad =>
      'Todos devem reduzir esforços longos ou intensos ao ar livre; mantenha as janelas fechadas.';

  @override
  String get cardAqiAdviceGood => 'Ótimo dia para ficar ao ar livre.';

  @override
  String get cardAqiAdviceModerate =>
      'Bom para a maioria das pessoas; pessoas muito sensíveis podem preferir pegar leve.';

  @override
  String get cardAqiAdviceSensitive =>
      'Crianças, idosos e pessoas com asma devem limitar esforços prolongados ao ar livre.';

  @override
  String get cardAqiGood => 'Boa';

  @override
  String get cardAqiHazardous => 'Perigosa';

  @override
  String get cardAqiModerate => 'Moderada';

  @override
  String get cardAqiSensitive => 'Insalubre para grupos sensíveis';

  @override
  String get cardAqiUnhealthy => 'Insalubre';

  @override
  String get cardAqiVeryUnhealthy => 'Muito insalubre';

  @override
  String get cardBaggage => 'Bagagem';

  @override
  String get cardCalcAmount => 'Valor';

  @override
  String get cardCalcBill => 'Conta';

  @override
  String get cardCalcDiscount => 'Desconto';

  @override
  String get cardCalcDiscountTitle => 'Desconto';

  @override
  String get cardCalcGross => 'Com impostos';

  @override
  String get cardCalcGrowth => 'Crescimento';

  @override
  String get cardCalcInterest => 'Juros';

  @override
  String get cardCalcLoan => 'Empréstimo';

  @override
  String get cardCalcMonthly => 'Por mês';

  @override
  String get cardCalcMonthlyPayment => 'Parcela mensal';

  @override
  String get cardCalcNet => 'Antes dos impostos';

  @override
  String get cardCalcPeople => 'Pessoas';

  @override
  String get cardCalcPerPerson => 'Cada pessoa paga';

  @override
  String get cardCalcPrice => 'Preço';

  @override
  String get cardCalcPrincipal => 'Principal';

  @override
  String get cardCalcRate => 'Taxa anual';

  @override
  String get cardCalcSavings => 'Economia';

  @override
  String get cardCalcStart => 'Começar com';

  @override
  String get cardCalcTax => 'Imposto';

  @override
  String get cardCalcTaxIncluded => 'Imposto incluído';

  @override
  String get cardCalcTaxRate => 'Alíquota';

  @override
  String get cardCalcTip => 'Gorjeta';

  @override
  String get cardCalcTipAmount => 'Gorjeta';

  @override
  String get cardCalcTipSplit => 'Gorjeta e divisão';

  @override
  String get cardCalcTotal => 'Total';

  @override
  String get cardCalcTotalInterest => 'Total de juros';

  @override
  String get cardCalcTotalPaid => 'Total pago';

  @override
  String get cardCalcUnits => 'Converter unidades';

  @override
  String get cardCalcValue => 'Valor';

  @override
  String get cardCalcVat => 'Imposto';

  @override
  String get cardCalcYears => 'Anos';

  @override
  String get cardCalcYouPay => 'Você paga';

  @override
  String get cardCalcYouPutIn => 'Você coloca';

  @override
  String get cardCalcYouSave => 'Você economiza';

  @override
  String get cardCall => 'Chamada';

  @override
  String get cardCaloriesWord => 'Calorias';

  @override
  String get cardComparison => 'Comparação';

  @override
  String get cardCondClear => 'Céu limpo';

  @override
  String get cardCondCloudy => 'Nublado';

  @override
  String get cardCondDrizzle => 'Garoa';

  @override
  String get cardCondFog => 'Nevoeiro';

  @override
  String get cardCondHail => 'Granizo';

  @override
  String get cardCondHeavyRain => 'Chuva forte';

  @override
  String get cardCondHeavySnow => 'Neve forte';

  @override
  String get cardCondLightRain => 'Chuva leve';

  @override
  String get cardCondLightSnow => 'Neve leve';

  @override
  String get cardCondMostlyClear => 'Poucas nuvens';

  @override
  String get cardCondPartlyCloudy => 'Parcialmente nublado';

  @override
  String get cardCondRain => 'Chuva';

  @override
  String get cardCondShowers => 'Pancadas de chuva';

  @override
  String get cardCondSleet => 'Chuva congelante';

  @override
  String get cardCondSnow => 'Neve';

  @override
  String get cardCondThunder => 'Tempestades';

  @override
  String get cardCons => 'Contras';

  @override
  String get cardCopied => 'Copiado';

  @override
  String get cardCopy => 'Copiar como texto';

  @override
  String get cardCouldntUpdate => 'Não foi possível atualizar';

  @override
  String get cardCurrency => 'Moeda';

  @override
  String get cardDayLength => 'Duração do dia';

  @override
  String get cardDayRange => 'Variação do dia';

  @override
  String get cardDays => 'dias';

  @override
  String get cardDelay => 'Atraso';

  @override
  String get cardDictionary => 'Dicionário';

  @override
  String get cardEmail => 'E-mail';

  @override
  String get cardFlightCancelled => 'Cancelado';

  @override
  String get cardFlightDiverted => 'Desviado';

  @override
  String get cardFlightInAir => 'No ar';

  @override
  String get cardFlightIncident => 'Incidente';

  @override
  String get cardFlightLanded => 'Pousado';

  @override
  String get cardFlightScheduled => 'No horário';

  @override
  String cardStaysFromNight(String price) {
    return 'a partir de $price por noite';
  }

  @override
  String get cardStaysANight => 'por noite';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n noites',
      one: '$n noite',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hóspedes',
      one: '$n hóspede',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n quartos',
      one: '$n quarto',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Melhores';

  @override
  String get cardStaysSortCheapest => 'Mais baratos';

  @override
  String get cardStaysSortTopRated => 'Mais bem avaliados';

  @override
  String get cardStaysSortClosest => 'Mais próximos';

  @override
  String get cardStaysFilterFreeCancel => 'Cancelamento grátis';

  @override
  String get cardStaysFilterBreakfast => 'Café da manhã';

  @override
  String get cardStaysFilterPayAtHotel => 'Pagar no hotel';

  @override
  String get cardStaysFilterStars => '4 estrelas ou mais';

  @override
  String get cardStaysFilterRated => 'Nota 8+';

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
    return '$km km do centro';
  }

  @override
  String cardStaysStars(int n) {
    return '$n estrelas';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price por $n noites',
      one: '$price por $n noite',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n outros sites',
      one: '+$n outro site',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Ver oferta';

  @override
  String get cardStaysView => 'Ver';

  @override
  String cardStaysShowAll(int n) {
    return 'Mostrar todos os $n';
  }

  @override
  String get cardStaysShowFewer => 'Mostrar menos';

  @override
  String get cardStaysNone => 'Nada corresponde a estes filtros.';

  @override
  String get cardStaysNoMap => 'Nenhum destes lugares tem ponto no mapa.';

  @override
  String get cardStaysNoDeals => 'Sem preços para estas datas.';

  @override
  String get cardStaysCheck => 'O preço é verificado no site de reservas.';

  @override
  String cardStaysCompare(int n) {
    return 'Comparar ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Marque até 4 para comparar';

  @override
  String get cardStaysComparePick => 'Escolha para comparar';

  @override
  String get cardStaysCompareTitle => 'Comparar';

  @override
  String get cardStaysRowNight => 'Preço por noite';

  @override
  String get cardStaysRowTotal => 'Total';

  @override
  String get cardStaysRowRating => 'Avaliação';

  @override
  String get cardStaysRowStars => 'Estrelas';

  @override
  String get cardStaysRowDistance => 'Distância';

  @override
  String get cardStaysYes => 'Sim';

  @override
  String get cardStaysNo => 'Não';

  @override
  String get cardStaysTermFreeCancel => 'Cancelamento grátis';

  @override
  String get cardStaysTermBreakfast => 'Café da manhã incluído';

  @override
  String get cardStaysTermNoBreakfast => 'Sem café da manhã';

  @override
  String get cardStaysTermPayAtHotel => 'Pagar no hotel';

  @override
  String get cardStaysTermNonRefundable => 'Não reembolsável';

  @override
  String get cardStaysDetailsTitle => 'Hospedagem';

  @override
  String get cardStaysCheapest => 'Mais baratos';

  @override
  String get cardStaysAmenities => 'Comodidades';

  @override
  String cardStaysCheckIn(String time) {
    return 'Check-in $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Check-out $time';
  }

  @override
  String get cardStaysNearby => 'Por perto';

  @override
  String get cardStaysHotelSite => 'Site do hotel';

  @override
  String get cardStaysBook => 'Reservar para mim';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Reservar $name em $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Foto $n de $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · preço por mês';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Mais barato: $month, cerca de $price por noite';
  }

  @override
  String get cardStaysTrendNote => 'Uma previsão, não preços em tempo real.';

  @override
  String get cardStaysTrendPick => 'Escolher datas';

  @override
  String get cardStaysSearchTitle => 'Encontrar um lugar para ficar';

  @override
  String get cardStaysSearchWhere => 'Onde';

  @override
  String get cardStaysSearchWhereHint => 'Cidade, região ou hotel';

  @override
  String get cardStaysSearchDates => 'Escolher datas';

  @override
  String get cardStaysSearchAdults => 'Adultos';

  @override
  String get cardStaysSearchRooms => 'Quartos';

  @override
  String get cardStaysSearchBudget => 'Orçamento por noite (opcional)';

  @override
  String get cardStaysSearchNotNow => 'Agora não';

  @override
  String get cardStaysSearchGo => 'Buscar hospedagens';

  @override
  String get cardStaysSearchSent => 'Buscando';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Hospedagens em $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Menos: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Mais: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Piscina';

  @override
  String get cardStaysAmenityParking => 'Estacionamento';

  @override
  String get cardStaysAmenityPets => 'Aceita pets';

  @override
  String get cardStaysAmenityGym => 'Academia';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Cozinha';

  @override
  String get cardStaysAmenityWifi => 'Wi-Fi';

  @override
  String get cardStaysAmenityAirCon => 'Ar-condicionado';

  @override
  String get cardProductsTitle => 'Coisas para comprar';

  @override
  String cardProductsFrom(String price) {
    return 'a partir de $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'abaixo de $price';
  }

  @override
  String get cardProductsSortBest => 'Melhores';

  @override
  String get cardProductsSortCheapest => 'Mais baratos';

  @override
  String get cardProductsSortTopRated => 'Mais bem avaliados';

  @override
  String get cardProductsOnSale => 'Em oferta';

  @override
  String get cardProductsRated => 'Nota 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'e outras lojas';

  @override
  String cardProductsShowAll(int n) {
    return 'Mostrar todos os $n';
  }

  @override
  String get cardProductsShowFewer => 'Mostrar menos';

  @override
  String get cardProductsShowMore => 'Mostrar mais';

  @override
  String get cardProductsNone => 'Nada corresponde a estes filtros.';

  @override
  String get cardProductsCheck => 'O preço é verificado na loja.';

  @override
  String get cardProductsBuy => 'Comprar';

  @override
  String get cardProductsCompareStores => 'Comparar lojas';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Comparar lojas para $title';
  }

  @override
  String get cardProductsBuyForMe => 'Comprar para mim';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Comprar $title em $store';
  }

  @override
  String get cardProductsRowPrice => 'Preço';

  @override
  String get cardProductsRowStore => 'Loja';

  @override
  String get cardProductsRowRating => 'Avaliação';

  @override
  String get cardProductsRowDelivery => 'Entrega';

  @override
  String cardProductsDelivery(String text) {
    return 'Entrega: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'por $brand';
  }

  @override
  String get cardProductsOffers => 'Lojas';

  @override
  String get cardProductsLowest => 'Menor total';

  @override
  String cardProductsTotal(String price) {
    return 'Total $price';
  }

  @override
  String get cardProductsOutOfStock => 'Sem estoque';

  @override
  String get cardProductsFeatures => 'Sobre o produto';

  @override
  String get cardProductsReviews => 'O que dizem os compradores';

  @override
  String get cardCheckoutTitle => 'Confira antes de eu pagar';

  @override
  String get cardCheckoutTotal => 'Total';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Abrir a página';

  @override
  String get cardCheckoutCancel => 'Cancelar';

  @override
  String get cardCheckoutChange => 'Alterar';

  @override
  String get cardCheckoutConfirm => 'Confirmar e pagar';

  @override
  String get cardCheckoutCancelLabel => 'Cancelar isto';

  @override
  String get cardCheckoutChangeLabel => 'Alterar algo';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Confirmar $total em $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Confirmar $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Confirmado';

  @override
  String get cardCheckoutChanging => 'Alterando';

  @override
  String get cardCheckoutCancelled => 'Cancelado';

  @override
  String get cardBookingTitle => 'Sua reserva';

  @override
  String cardBookingWith(String site) {
    return 'Reservado em $site';
  }

  @override
  String get cardBookingCheckIn => 'Check-in';

  @override
  String get cardBookingCheckOut => 'Check-out';

  @override
  String get cardBookingConfirmation => 'Número de confirmação';

  @override
  String get cardBookingCopy => 'Copiar o número de confirmação';

  @override
  String get cardBookingPaid => 'Pago';

  @override
  String get cardBookingPayAtHotel => 'Pagar no hotel';

  @override
  String cardBookingCancelBy(String date) {
    return 'Cancelamento grátis até $date';
  }

  @override
  String get cardBookingDirections => 'Como chegar';

  @override
  String get cardBookingManage => 'Gerenciar reserva';

  @override
  String get cardBookingCalendar => 'Adicionar ao calendário';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Adicionar $name ao meu calendário';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Pedido $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Feito em $date';
  }

  @override
  String get cardOrderStepOrdered => 'Pedido feito';

  @override
  String get cardOrderStepShipped => 'Enviado';

  @override
  String get cardOrderStepOut => 'Saiu para entrega';

  @override
  String get cardOrderStepDelivered => 'Entregue';

  @override
  String get cardOrderCancelled => 'Cancelado';

  @override
  String get cardOrderReturned => 'Devolvido';

  @override
  String cardOrderArrives(String date) {
    return 'Chega em $date';
  }

  @override
  String get cardOrderTracking => 'Código de rastreio';

  @override
  String get cardOrderCopy => 'Copiar o código de rastreio';

  @override
  String get cardOrderTrack => 'Rastrear';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Rastrear $number';
  }

  @override
  String get cardOrderPage => 'Página do pedido';

  @override
  String get cardFaresBest => 'Melhores';

  @override
  String get cardFaresCheapest => 'Mais baratos';

  @override
  String get cardFaresFastest => 'Mais rápidos';

  @override
  String get cardFaresDirectOnly => 'Somente diretos';

  @override
  String get cardFaresDirect => 'Direto';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n paradas',
      one: '$n parada',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Reservar';

  @override
  String cardFaresFromPrice(String price) {
    return 'a partir de $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n viajantes',
      one: '$n viajante',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n noites',
      one: '$n noite',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Econômica';

  @override
  String get cardFaresPremium => 'Econômica premium';

  @override
  String get cardFaresBusiness => 'Executiva';

  @override
  String get cardFaresFirst => 'Primeira classe';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Geralmente $low–$high para esta viagem';
  }

  @override
  String get cardFaresLevelLow => 'Baixo agora';

  @override
  String get cardFaresLevelTypical => 'Normal agora';

  @override
  String get cardFaresLevelHigh => 'Alto agora';

  @override
  String cardFaresShowAll(int n) {
    return 'Mostrar todos os $n';
  }

  @override
  String get cardFaresShowFewer => 'Mostrar menos';

  @override
  String get cardFaresNoDirect => 'Nenhum voo direto nesta busca.';

  @override
  String get cardFaresOutboundOnly =>
      'Os preços são para toda a viagem; escolha o voo de volta no Google Voos.';

  @override
  String get cardFaresSeeAll => 'Ver tudo no Google Voos';

  @override
  String get cardFaresCheck =>
      'Os preços são para todos os viajantes e são conferidos novamente no site de reservas.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin bagagem de mão, $checked bagagens despachadas';
  }

  @override
  String get cardFaresAffiliate =>
      'O Casama pode receber uma comissão quando você reserva por estes links. Isso não muda o preço.';

  @override
  String cardFaresCompare(String site) {
    return 'Comparar em $site';
  }

  @override
  String get cardFaresWatch => 'Monitorar preço';

  @override
  String cardFaresWatching(String date) {
    return 'Monitorando · termina em $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Monitorando por $price ou menos · termina em $date';
  }

  @override
  String get cardFaresWatchStop => 'Parar';

  @override
  String get cardFaresWatchTitle => 'Monitorar este preço';

  @override
  String get cardFaresWatchBody =>
      'O Casama verifica este preço algumas vezes por dia e envia uma notificação quando ele cai. O monitoramento termina sozinho quando a data passar ou após 60 dias.';

  @override
  String get cardFaresWatchTarget =>
      'Avisar quando estiver abaixo de (opcional)';

  @override
  String get cardFaresWatchAnyDrop => 'Deixe vazio para qualquer queda grande';

  @override
  String get cardFaresWatchStart => 'Monitorar';

  @override
  String get cardFaresWatchStarted =>
      'Monitorando este preço. Você receberá uma notificação quando ele cair.';

  @override
  String get cardFaresWatchStopped => 'Monitoramento deste preço encerrado.';

  @override
  String get cardFaresWatchFull =>
      'Você já está monitorando 10 preços. Pare um em Configurações → Cartões primeiro.';

  @override
  String get cardFaresWatchFailed =>
      'Não foi possível alterar o monitoramento de preço. Tente novamente.';

  @override
  String get cardFaresFlagSeparate => 'Passagens separadas';

  @override
  String get cardFaresFlagOvernight => 'Escala noturna';

  @override
  String get cardFaresFlagAirport => 'Troca de aeroporto';

  @override
  String get cardFaresFlagShort => 'Conexão curta';

  @override
  String get cardFaresFlagLong => 'Conexão longa';

  @override
  String get cardFaresNoteSeparate =>
      'Companhias aéreas diferentes em um trecho, então podem ser passagens separadas. Se perder a conexão, o próximo voo pode não estar coberto. Confira no site de reservas.';

  @override
  String get cardFaresNoteOvernight => 'Uma conexão dura a noite toda.';

  @override
  String get cardFaresNoteAirport => 'Uma conexão parte de outro aeroporto.';

  @override
  String get cardFaresNoteShort => 'Uma conexão tem menos de uma hora.';

  @override
  String get cardFaresNoteLong => 'Uma conexão tem mais de 8 horas.';

  @override
  String get cardFaresOutbound => 'Ida';

  @override
  String get cardFaresReturn => 'Volta';

  @override
  String cardFaresEmissions(int kg) {
    return 'Cerca de $kg kg de CO₂ por viajante';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return 'Conexão de $time em $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'próximo voo parte de $place';
  }

  @override
  String get cardFaresViewFailed => 'Não foi possível carregar estas tarifas.';

  @override
  String get cardFaresTryAgain => 'Tentar novamente';

  @override
  String get cardFaresMorning => 'Manhã';

  @override
  String get cardFaresAfternoon => 'Tarde';

  @override
  String get cardFaresEvening => 'Noite';

  @override
  String get cardFaresNight => 'Madrugada';

  @override
  String get cardFaresTime => 'Horário';

  @override
  String get cardFaresAirlines => 'Companhias';

  @override
  String get cardFaresBagIncluded => 'Bagagem incluída';

  @override
  String get cardFaresNoMatch => 'Nenhum voo corresponde a estes filtros.';

  @override
  String get cardFaresOpenInChat => 'Abrir no chat';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Mostrar voos $route em $date';
  }

  @override
  String get cardFaresEdit => 'Editar busca';

  @override
  String get cardFaresDetails => 'Detalhes';

  @override
  String get cardFaresSinceStart => 'desde que começou a monitorar';

  @override
  String get cardFareCalOneWay => 'Só ida';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Volta após $n noites',
      one: 'Volta após $n noite',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Baixo';

  @override
  String get cardFareCalUsual => 'Normal';

  @override
  String get cardFareCalHigh => 'Alto';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Mais barato: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Ver tarifas';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: sem preço';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'De $from · qualquer lugar';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'De $from · exterior';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'De $from · mesmo país';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'abaixo de $price';
  }

  @override
  String get cardFlightSearchTitle => 'Buscar voos';

  @override
  String get cardFlightSearchReturn => 'Ida e volta';

  @override
  String get cardFlightSearchOneWay => 'Só ida';

  @override
  String get cardFlightSearchFrom => 'De';

  @override
  String get cardFlightSearchTo => 'Para';

  @override
  String get cardFlightSearchPlaceHint => 'Cidade ou aeroporto';

  @override
  String get cardFlightSearchAnywhere => 'Qualquer lugar';

  @override
  String get cardFlightSearchSwap => 'Inverter origem e destino';

  @override
  String get cardFlightSearchPickDates => 'Escolher datas';

  @override
  String get cardFlightSearchPickDate => 'Escolher uma data';

  @override
  String get cardFlightSearchWholeMonth => 'Mês inteiro';

  @override
  String get cardFlightSearchNights => 'Noites fora';

  @override
  String get cardFlightSearchAdults => 'Adultos';

  @override
  String get cardFlightSearchChildren => 'Crianças (2 a 11)';

  @override
  String get cardFlightSearchInfants => 'Bebês (menos de 2)';

  @override
  String get cardFlightSearchNotNow => 'Agora não';

  @override
  String get cardFlightSearchSent => 'Buscando…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Voos $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Mais barato agora';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Últimos $n dias',
      one: 'Último $n dia',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'de $low a $high';
  }

  @override
  String get cardFareTrendNote =>
      'Isso mostra como os preços se comportaram, não uma previsão. Eles podem mudar a qualquer momento.';

  @override
  String get cardFareWatchesTitle => 'Monitoramentos de preço';

  @override
  String get cardFareWatchesNone =>
      'Você não está monitorando nenhuma tarifa. Toque em Monitorar preço em um cartão de voos para começar.';

  @override
  String get cardFareWatchesNoPrice => 'Sem preço ainda';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Meta $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Qualquer queda grande';

  @override
  String cardFareWatchesLow(String price) {
    return 'menor $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'termina em $date';
  }

  @override
  String get cardsFareWatches => 'Monitoramentos de preço';

  @override
  String get cardsFareWatchesNone =>
      'Nenhum monitoramento de preço. Toque em Monitorar preço em um cartão de tarifas aéreas para receber uma notificação quando baixar.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Agora $price · termina em $date';
  }

  @override
  String get cardFromBot => 'Escrito pelo bot; pode estar errado';

  @override
  String get cardFullRecipe => 'Receita completa';

  @override
  String get cardGate => 'Portão';

  @override
  String get cardGo => 'Começar';

  @override
  String get cardHeads => 'Cara';

  @override
  String get cardHolidays => 'Feriados';

  @override
  String get cardHoursShort => 'horas';

  @override
  String get cardHumidity => 'Umidade';

  @override
  String get cardItsTime => 'Chegou a hora!';

  @override
  String get cardJustNow => 'agora mesmo';

  @override
  String get cardLast24h => 'Últimas 24 horas';

  @override
  String get cardLast30Days => 'Últimos 30 dias';

  @override
  String get cardListen => 'Ouvir';

  @override
  String get cardLiveNow => 'Agora';

  @override
  String get cardLongWeekend => 'Feriado prolongado';

  @override
  String get cardLostShort => 'D';

  @override
  String get cardMarket24h => '24h';

  @override
  String get cardMarketCap => 'Valor de mercado';

  @override
  String get cardMarketClosed => 'Fechado';

  @override
  String get cardMarketOpen => 'Aberto';

  @override
  String get cardMarketPost => 'Pós-mercado';

  @override
  String get cardMarketPre => 'Pré-mercado';

  @override
  String get cardMessage => 'Mensagem';

  @override
  String get cardMinutesShort => 'min';

  @override
  String get cardMoonFirstQuarter => 'Quarto crescente';

  @override
  String get cardMoonFull => 'Lua cheia';

  @override
  String get cardMoonLastQuarter => 'Quarto minguante';

  @override
  String get cardMoonNew => 'Lua nova';

  @override
  String get cardMoonWaningCrescent => 'Minguante côncava';

  @override
  String get cardMoonWaningGibbous => 'Minguante convexa';

  @override
  String get cardMoonWaxingCrescent => 'Crescente côncava';

  @override
  String get cardMoonWaxingGibbous => 'Crescente convexa';

  @override
  String get cardMore => 'Mais';

  @override
  String get cardNext24h => 'Próximas 24 horas';

  @override
  String get cardNoAlerts => 'Sem alertas';

  @override
  String get cardNoAlertsLong =>
      'Nenhum alerta meteorológico em vigor aqui agora.';

  @override
  String get cardNoChart => 'Sem gráfico para este período';

  @override
  String get cardNoGames => 'Sem jogos';

  @override
  String get cardNoHolidays => 'Não há mais feriados este ano.';

  @override
  String get cardNoQuakes => 'Nenhum terremoto desse porte recentemente.';

  @override
  String get cardNoStorms => 'Nenhuma ativa';

  @override
  String get cardNoStormsLong => 'Nenhuma tempestade tropical ativa agora.';

  @override
  String get cardNotAdvice => 'Não é recomendação financeira';

  @override
  String get cardNow => 'Agora';

  @override
  String get cardNutritionFacts => 'Informação nutricional';

  @override
  String get cardOpen => 'Abrir';

  @override
  String get cardOpenSource => 'Abrir a fonte';

  @override
  String get cardParcel => 'Encomenda';

  @override
  String get cardParcelDelivered => 'Entregue';

  @override
  String get cardParcelInTransit => 'A caminho';

  @override
  String get cardParcelOrdered => 'Etiqueta emitida';

  @override
  String get cardParcelOut => 'Saiu para entrega';

  @override
  String get cardParcelProblem => 'Problema';

  @override
  String get cardParcelNoLive =>
      'Sem status em tempo real para este código aqui. A página da transportadora tem o mais recente.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Rastrear em $site';
  }

  @override
  String get cardPin => 'Fixar nos widgets';

  @override
  String get cardPinFailed => 'Não foi possível fixar este cartão';

  @override
  String get cardPinned => 'Fixado nos seus widgets';

  @override
  String get cardPinnedWaiting =>
      'Fixado. Permita este bot nos seus widgets para ver lá';

  @override
  String get cardPlayedShort => 'J';

  @override
  String get cardPointsShort => 'Pts';

  @override
  String get cardPrevClose => 'Fech. ant.';

  @override
  String get cardPros => 'Prós';

  @override
  String get cardProsCons => 'Prós e contras';

  @override
  String get cardQuiz => 'Quiz';

  @override
  String get cardRain => 'Chuva';

  @override
  String get cardRainChance => 'Chance de chuva';

  @override
  String get cardRandom => 'Aleatório';

  @override
  String get cardReadMore => 'Ler mais';

  @override
  String get cardReferenceRates =>
      'Taxas de referência do banco central, publicadas diariamente';

  @override
  String get cardRefresh => 'Atualizar';

  @override
  String get cardReport => 'Informar dado incorreto';

  @override
  String get cardReported => 'Obrigado, vamos verificar';

  @override
  String get cardSameTime => 'mesmo horário';

  @override
  String get cardScores => 'Placares';

  @override
  String get cardSecondsShort => 's';

  @override
  String get cardServings => 'Porções';

  @override
  String get cardShareImage => 'Compartilhar como imagem';

  @override
  String get cardStandings => 'Classificação';

  @override
  String get cardStorms => 'Tempestades tropicais';

  @override
  String get cardSunMoon => 'Sol e lua';

  @override
  String get cardSunrise => 'Nascer do sol';

  @override
  String get cardSunset => 'Pôr do sol';

  @override
  String get cardSwap => 'Inverter';

  @override
  String get cardSynonyms => 'Parecidos:';

  @override
  String get cardTails => 'Coroa';

  @override
  String get cardTeam => 'Equipe';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Horário em cada lugar';

  @override
  String get cardTimeline => 'Linha do tempo';

  @override
  String get cardToday => 'Hoje';

  @override
  String get cardTomorrow => 'Amanhã';

  @override
  String get cardTranslation => 'Tradução';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Remover dos widgets';

  @override
  String get cardUnpinned => 'Removido dos seus widgets';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'extremo';

  @override
  String get cardUvHigh => 'alto';

  @override
  String get cardUvLow => 'baixo';

  @override
  String get cardUvModerate => 'moderado';

  @override
  String get cardUvVeryHigh => 'muito alto';

  @override
  String get cardVolume => 'Volume';

  @override
  String get cardWatchlist => 'Lista de acompanhamento';

  @override
  String get cardWeather => 'Clima';

  @override
  String get cardWeatherAlerts => 'Alertas do clima';

  @override
  String get cardWebsite => 'Site';

  @override
  String get cardWind => 'Vento';

  @override
  String get cardWonShort => 'V';

  @override
  String get cardWorldClock => 'Relógio mundial';

  @override
  String get cardYesterday => 'Ontem';

  @override
  String get cardQuakesWorld => 'Terremotos mais fortes hoje';

  @override
  String cardMinutesAgo(int n) {
    return 'há $n min';
  }

  @override
  String cardHoursAgo(int n) {
    return 'há $n h';
  }

  @override
  String cardStale(String ago) {
    return 'Não foi possível atualizar · de $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Atualizado $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Atraso de $minutes min';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'Máx. $high  Mín. $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Sensação $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n dias';
  }

  @override
  String cardUntil(String when) {
    return 'Até $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n alertas em vigor',
      one: '$n alerta em vigor',
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
      'alder': 'Pólen de amieiro',
      'birch': 'Pólen de bétula',
      'grass': 'Pólen de gramíneas',
      'mugwort': 'Pólen de artemísia',
      'olive': 'Pólen de oliveira',
      'ragweed': 'Pólen de ambrósia',
      'other': 'Pólen',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '${h}h ${m}m';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Hora dourada a partir das $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct% iluminada';
  }

  @override
  String cardMoonrise(String time) {
    return 'Nasce às $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Se põe às $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Variação em $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up em alta · $down em baixa';
  }

  @override
  String cardRatesOf(String date) {
    return 'Taxas de $date';
  }

  @override
  String cardAtTime(String when) {
    return 'Às $when';
  }

  @override
  String cardInDays(int n) {
    return 'em $n dias';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct% do caminho';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Terremotos perto de $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n terremotos',
      one: '$n terremoto',
      zero: 'Nenhum',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '$depth de profundidade';
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
      other: '$n ativas',
      one: '$n ativa',
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
      other: '$n jogos',
      one: '$n jogo',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n ao vivo';
  }

  @override
  String cardMinutes(int n) {
    return '$n min';
  }

  @override
  String cardExpected(String date) {
    return 'Previsão: $date';
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
      other: '$n passos',
      one: '$n passo',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Vitórias $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Porção: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed de $total verificações aprovadas';
  }

  @override
  String cardTotal(int n) {
    return 'Total $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Após $n anos';
  }

  @override
  String get cardsSettingsTitle => 'Cartões';

  @override
  String get cardsSettingsRow => 'Cidade natal, unidades e fontes de dados';

  @override
  String get cardsSettingsIntro =>
      'Os bots respondem sobre clima, preços, cotações, horários e muito mais com cartões de dados reais sempre atualizados. Sua cidade natal é usada quando você pergunta sem dizer um lugar.';

  @override
  String get cardsSettingsSaveFailed =>
      'Não foi possível salvar. Tente novamente.';

  @override
  String get cardsHomeCity => 'Cidade natal';

  @override
  String get cardsHomeClear => 'Limpar';

  @override
  String get cardsHomeNone =>
      'Não definida. Os bots usam a cidade principal do seu fuso horário até você escolher uma.';

  @override
  String get cardsHomeSearch => 'Buscar sua cidade';

  @override
  String get cardsHomePrivacy =>
      'Apenas uma cidade é guardada, nunca seu endereço; ela é enviada aos serviços de clima como coordenadas aproximadas.';

  @override
  String get cardsUnits => 'Unidades';

  @override
  String get cardsTemperature => 'Temperatura';

  @override
  String get cardsWind => 'Vento';

  @override
  String get cardsRain => 'Chuva';

  @override
  String get cardsDistance => 'Distância';

  @override
  String get cardsPrices => 'Preços';

  @override
  String get cardsRedUp => 'Vermelho indica alta';

  @override
  String get cardsRedUpHint =>
      'Mostra preços em alta em vermelho e em queda em verde, como nos mercados da China, Japão e Coreia.';

  @override
  String get cardsSources => 'Fontes de dados';

  @override
  String get cardsSourcesIntro =>
      'Os cartões informam de onde vieram os dados e quando. Estes serviços os fornecem:';

  @override
  String get cardFewerServings => 'Menos porções';

  @override
  String get cardMoreServings => 'Mais porções';

  @override
  String get cropTitle => 'Mover e ajustar';

  @override
  String get cropDone => 'Concluído';

  @override
  String get cropPosition => 'Posição da imagem';

  @override
  String get cropMoveUp => 'Mover para cima';

  @override
  String get cropMoveDown => 'Mover para baixo';

  @override
  String get cropMoveLeft => 'Mover para a esquerda';

  @override
  String get cropMoveRight => 'Mover para a direita';

  @override
  String get cropRotate => 'Girar';

  @override
  String get cropMirror => 'Espelhar';

  @override
  String get cropReset => 'Redefinir';

  @override
  String get cropZoom => 'Zoom';

  @override
  String get cropZoomIn => 'Ampliar';

  @override
  String get cropZoomOut => 'Reduzir';

  @override
  String get cropSoft => 'Zoom muito próximo: a imagem pode parecer borrada';

  @override
  String get cropAnimatedStill => 'Imagens animadas ficam estáticas';

  @override
  String get cropBackground => 'Fundo';

  @override
  String get cropBackgroundNone => 'Nenhum';

  @override
  String cropBackgroundBot(String name) {
    return 'Cor de $name';
  }

  @override
  String get cropBackgroundWhite => 'Branco';

  @override
  String get cropBackgroundBlack => 'Preto';

  @override
  String get cropUnreadable =>
      'Não foi possível abrir esta imagem aqui. Tente um JPEG ou PNG.';

  @override
  String cropTooBig(String size) {
    return 'Este arquivo tem $size, acima do limite de 40 MB.';
  }

  @override
  String get botPicture => 'Imagem';

  @override
  String botPictureTitle(String name) {
    return 'Imagem de $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Alterar a imagem de $name';
  }

  @override
  String get botPicturePaste => 'Colar imagem';

  @override
  String get botPictureDraw => 'Criar uma com IA';

  @override
  String get botPictureDrawHelp => 'O Casama desenha duas para escolher';

  @override
  String get botPictureRecrop => 'Recortar novamente';

  @override
  String get botPictureMascot => 'Usar um mascote';

  @override
  String get botPictureRemove => 'Remover imagem';

  @override
  String get botPictureRecent => 'Recentes';

  @override
  String get botPictureUpdated => 'Imagem atualizada';

  @override
  String get botPictureRemoved => 'Imagem removida';

  @override
  String get botPictureFailed => 'Não foi possível salvar a imagem';

  @override
  String botPictureDrop(String name) {
    return 'Solte para usar como imagem de $name';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Usar como imagem de $name';
  }

  @override
  String get botPictureUseAsBot => 'Usar como imagem de um bot';

  @override
  String get botPictureWhichBot => 'Qual bot recebe esta imagem?';

  @override
  String botDrawTitle(String name) {
    return 'Uma imagem para $name';
  }

  @override
  String get botDrawIntro =>
      'Escolha um visual, adicione algumas palavras se quiser, e o Casama desenha duas imagens para você escolher.';

  @override
  String get botDrawDescribe => 'Descreva (opcional)';

  @override
  String get botDrawHint => 'Uma coruja simpática usando óculos de leitura';

  @override
  String get botDrawMake => 'Criar 2';

  @override
  String get botDrawMore => 'Criar mais 2';

  @override
  String get botDrawPick => 'Toque em uma para usar';

  @override
  String get botDrawCost =>
      'Cada imagem usa créditos de imagem, como qualquer imagem criada pelo Casama.';

  @override
  String get botDrawWorking => 'Desenhando…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '3D suave';

  @override
  String get botDrawStyleWatercolor => 'Aquarela';

  @override
  String get botDrawStyleFlat => 'Ícone plano';

  @override
  String get botDrawStylePixel => 'Pixel Art';

  @override
  String get botDrawStyleLine => 'Traço';

  @override
  String get botDrawStylePhoto => 'Foto';

  @override
  String get sharePictureStays =>
      'A imagem dele fica neste espaço de trabalho: a cópia recebe o mascote anterior ou as iniciais.';

  @override
  String savedResetRefills(String amount) {
    return 'Recarrega $amount de créditos';
  }

  @override
  String get savedResetClearsDaily => 'Limpa o limite de hoje';

  @override
  String get savedResetGivesHours => 'Devolve horas de computador';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltam $count dias',
      one: 'Falta $count dia',
      zero: 'Expira hoje',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Modelos';

  @override
  String get modelsRowHelp => 'Modelos do Casama ou suas próprias chaves';

  @override
  String get modelsIntro =>
      'Escolha: o Casama executa seus bots, ou você conecta suas próprias chaves de modelo. As chaves são armazenadas criptografadas e nunca mais são exibidas.';

  @override
  String get whoRunsYourBots => 'Quem executa seus bots';

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
      'Incluído no seu plano; usa créditos do espaço de trabalho';

  @override
  String get whoRunsCasamaOffHelp => 'Pausado no seu plano atual';

  @override
  String get whoRunsOwn => 'Seu próprio provedor';

  @override
  String get whoRunsOwnHelp =>
      'Cobrado diretamente pelo seu provedor; não usa créditos do Casama';

  @override
  String get whoRunsCasamaShort => 'Modelos do Casama, incluídos no seu plano';

  @override
  String get whoRunsCasamaCost => 'Usa créditos';

  @override
  String get whoRunsOwnShort => 'Suas chaves, cobradas pelo seu provedor';

  @override
  String get whoRunsOwnCost => 'Sem créditos do Casama';

  @override
  String get whoRunsOwnNeedsKey =>
      'Para usar seu próprio provedor, adicione uma chave de chat dele em Adicionar uma chave abaixo primeiro.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Escolha um modelo para esta chave abaixo para trocar.';

  @override
  String get whoRunsAdminOnly =>
      'Somente administradores do espaço de trabalho podem mudar quem executa seus bots.';

  @override
  String get botModelSource => 'Origem do modelo';

  @override
  String get botModelSourceWorkspace => 'Padrão do espaço de trabalho';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Uma das suas chaves';

  @override
  String get useCasamaFallback =>
      'Se meu provedor falhar, usar modelos do Casama';

  @override
  String get useCasamaFallbackHelp =>
      'Quando sua chave atingir um limite de taxa ou cota, recorrer aos modelos do Casama usando créditos do seu espaço de trabalho.';

  @override
  String get keyCoversOpenRouter =>
      'Chat, imagens, vídeo, leitura em voz alta, mensagens de voz e ditado';

  @override
  String get keyCoversGoogle => 'Chat e chamadas ao vivo';

  @override
  String get keyCoversOpenAi => 'Chat e busca na memória';

  @override
  String get keyCoversChat => 'Chat';

  @override
  String get ownProviderPrivacyNote =>
      'Com seu próprio provedor, os termos desse provedor se aplicam ao que seus bots enviam a ele. A configuração de não treinamento do Casama só vale na chave do Casama.';

  @override
  String get creditsOwnProviderNote =>
      'Modelos do seu próprio provedor não usam créditos.';

  @override
  String get routineWaitingForModel => 'Aguardando um modelo';

  @override
  String get ownProviderRequiredTitle =>
      'Conecte um modelo para continuar conversando';

  @override
  String get ownProviderRequiredBody =>
      'Os modelos do Casama não estão disponíveis neste plano agora. Adicione sua própria chave de modelo ou faça upgrade do plano.';

  @override
  String get modelNoToolsWarning =>
      'Este modelo não oferece suporte a ferramentas, então o bot só pode responder em texto.';

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
  String get appBrowserTitle => 'Navegador neste celular';

  @override
  String get appBrowserTitleMac => 'Navegador neste Mac';

  @override
  String get appBrowserTitleLinux => 'Navegador neste computador';

  @override
  String get appBrowserTitleWindows => 'Navegador neste PC';

  @override
  String get appBrowserHelp =>
      'Um pequeno navegador dentro do Casama que os bots que você permitir podem usar enquanto você acompanha, somente com o chat deles aberto neste celular. Seus logins ficam neste celular.';

  @override
  String get appBrowserHelpMac =>
      'Um pequeno navegador dentro do Casama que os bots que você permitir podem usar enquanto você acompanha, enquanto o Casama estiver aberto neste Mac. Seus logins ficam neste Mac.';

  @override
  String get appBrowserHelpLinux =>
      'Um pequeno navegador dentro do Casama que os bots que você permitir podem usar enquanto você acompanha, enquanto o Casama estiver aberto neste computador. Seus logins ficam neste computador.';

  @override
  String get appBrowserHelpWindows =>
      'Um pequeno navegador dentro do Casama que os bots que você permitir podem usar enquanto você acompanha, enquanto o Casama estiver aberto neste PC. Seus logins ficam neste PC.';

  @override
  String get appBrowserSwitchHelp =>
      'Os bots que você permitir podem abrir páginas aqui enquanto o chat deles estiver aberto neste celular.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Os bots que você permitir podem abrir páginas aqui enquanto o Casama estiver aberto neste Mac.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Os bots que você permitir podem abrir páginas aqui enquanto o Casama estiver aberto neste computador.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Os bots que você permitir podem abrir páginas aqui enquanto o Casama estiver aberto neste PC.';

  @override
  String get appBrowserOn => 'Ativado';

  @override
  String get appBrowserOff => 'Desativado';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Desativado: $reason';
  }

  @override
  String get appBrowserReasonOff => 'ainda não disponível.';

  @override
  String get appBrowserReasonNotTester =>
      'apenas para testadores por enquanto.';

  @override
  String get appBrowserReasonSystemOff =>
      'ainda não disponível neste dispositivo.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'um administrador desativou neste espaço de trabalho.';

  @override
  String get appBrowserReasonUnavailable =>
      'este servidor não tem conexões de dispositivos.';

  @override
  String get appBrowserReasonUnsupported =>
      'o navegador deste dispositivo não consegue executá-lo.';

  @override
  String get appBrowserReasonNeedsMacos14 =>
      'precisa do macOS 14 ou posterior.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Instale o WebKitGTK para usar o navegador aqui: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Instale ou atualize o Microsoft Edge WebView2 para usar o navegador aqui.';

  @override
  String get appBrowserGetWebview2 => 'Obter WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Pareado em uma instalação anterior. Ative novamente para parear este dispositivo.';

  @override
  String get appBrowserAllBots => 'Todos os seus bots';

  @override
  String get appBrowserAllBotsHelp =>
      'Todos os bots com quem você pode conversar podem usar este navegador. Desative para escolher bots individuais.';

  @override
  String get appBrowserModeHeader => 'Quando um bot precisar de um navegador';

  @override
  String get appBrowserModeAlways => 'Sempre este dispositivo';

  @override
  String get appBrowserModeAlwaysHelp =>
      'Os bots abrem todas as páginas aqui enquanto o chat deles estiver aberto. O computador deles só é usado quando você pedir.';

  @override
  String get appBrowserOpenTooltip => 'Abrir o navegador';

  @override
  String get appBrowserBotsBrowseHere => 'Os bots navegam aqui';

  @override
  String get appBrowserBotsBrowseHereHelp =>
      'Todas as páginas nos seus chats abrem neste navegador enquanto você acompanha';

  @override
  String get appBrowserModeAsk => 'Perguntar quando ajudar';

  @override
  String get appBrowserModeAskHelp =>
      'Oferece uma escolha quando um site pedir seu login ou bloquear o computador do bot.';

  @override
  String get appBrowserModeComputer => 'Sempre o computador do bot';

  @override
  String get appBrowserModeComputerHelp =>
      'Nunca oferecer o navegador deste dispositivo, a menos que você peça no chat.';

  @override
  String get appBrowserModeDevice => 'Preferir este dispositivo';

  @override
  String get appBrowserModeDeviceHelp =>
      'Usar o navegador deste dispositivo para logins e sites bloqueados sem perguntar.';

  @override
  String get appBrowserNeverAsk => 'Computador do bot (não perguntar)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Computador Linux';

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
      'Esperando você. Mantenha este chat aberto para continuar no navegador.';

  @override
  String browserWaitingSite(String site) {
    return 'Esperando você. Mantenha este chat aberto para continuar em $site no navegador.';
  }

  @override
  String get browserWaitEnded => 'Parou de aguardar seu navegador.';

  @override
  String get browserHandBackWaiting =>
      'Sua vez no navegador. Faça a etapa na página e toque em Devolver o controle.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Sua vez em $site. Faça a etapa na página e toque em Devolver o controle.';
  }

  @override
  String get browserHandBackEnded =>
      'Parou de aguardar você devolver o controle do navegador.';

  @override
  String get browserChoiceCardLabel => 'Escolha de navegador';

  @override
  String browserChoiceTitle(String bot, String site) {
    return 'Onde $bot deve abrir $site?';
  }

  @override
  String get browserChoiceSubtitleSignIn => 'Este site precisa do seu login.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Este site bloqueou o computador de $bot.';
  }

  @override
  String get browserChoiceOnPhone => 'Neste celular';

  @override
  String get browserChoiceOnMac => 'Neste Mac';

  @override
  String get browserChoiceOnLinux => 'Neste computador';

  @override
  String get browserChoiceOnWindows => 'Neste PC';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Você acompanha e pode fazer login por conta própria. O que ele lê vai para a IA.';

  @override
  String get browserChoiceInChrome => 'No seu Chrome';

  @override
  String get browserChoiceInChromeHelp => 'Já conectado aos seus sites.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'No computador de $bot';
  }

  @override
  String get browserChoiceOnComputerHelp =>
      'Continua rodando mesmo se você sair.';

  @override
  String browserChoiceRemember(String site) {
    return 'Lembrar para $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return '$site aberto neste celular';
  }

  @override
  String browserChoicePickedMac(String site) {
    return '$site aberto neste Mac';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return '$site aberto neste computador';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return '$site aberto neste PC';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '$site aberto no seu Chrome';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$site aberto no computador de $bot';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Sem resposta a tempo; ficou no computador de $bot';
  }

  @override
  String get appBrowserConsentTitle =>
      'Permitir que bots usem o navegador no Casama?';

  @override
  String get appBrowserConsentPages =>
      'As páginas que um bot lê aqui são enviadas ao Casama e ao modelo de IA do bot, assim como as páginas que ele lê no próprio computador.';

  @override
  String get appBrowserConsentSignIns =>
      'Seus logins ficam neste dispositivo. Os bots nunca veem senhas, números de cartão ou códigos; você mesmo os digita.';

  @override
  String get appBrowserConsentWatch =>
      'Só funciona enquanto o chat do bot estiver aberto aqui. Você pode acompanhar, assumir o controle ou parar quando quiser.';

  @override
  String get appBrowserConsentYours =>
      'O que você navega por conta própria nunca é enviado a lugar nenhum.';

  @override
  String get appBrowserBots => 'Bots que podem usar';

  @override
  String get appBrowserBotsHelp =>
      'Apenas os bots ativados aqui podem usar o navegador neste dispositivo.';

  @override
  String get appBrowserNoBots => 'Nenhum bot ainda.';

  @override
  String get appBrowserSites => 'Sites';

  @override
  String get appBrowserSitesHelp =>
      'Sites em que você respondeu Sempre ou Nunca. Remova um para perguntar de novo na próxima vez.';

  @override
  String get appBrowserNoSites =>
      'Nenhum site ainda. Um bot pergunta na primeira vez que abre um site.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Remover $site';
  }

  @override
  String get appBrowserKinds => 'Sites que permanecem desativados';

  @override
  String get appBrowserKindsHelp =>
      'Estes tipos de sites ficam desativados a menos que você os ative. Quando um estiver ativado, o bot ainda pergunta todas as vezes.';

  @override
  String get appBrowserKindBanking => 'Bancos e pagamentos';

  @override
  String get appBrowserKindHealth => 'Saúde';

  @override
  String get appBrowserKindPasswords => 'Gerenciadores de senhas';

  @override
  String get appBrowserKindGovernment => 'Governo e identidade';

  @override
  String get appBrowserSignIn => 'Entrar em um site';

  @override
  String get appBrowserSignInHelp =>
      'Abra um site, faça login você mesmo e deixe seus bots usá-lo. Nada do que você faz lá é enviado a lugar nenhum.';

  @override
  String get appBrowserClearData => 'Limpar dados de navegação';

  @override
  String get appBrowserClearDataHelp =>
      'Encerra a sessão deste navegador em todos os sites e limpa o que os sites salvaram.';

  @override
  String get appBrowserClearDataConfirm =>
      'Limpar logins e dados de sites deste navegador?';

  @override
  String get appBrowserClearDataDone => 'Dados de navegação limpos';

  @override
  String get appBrowserUnpair => 'Desparear este dispositivo';

  @override
  String get appBrowserUnpairConfirm =>
      'Desparear o navegador deste dispositivo? Os bots não poderão usá-lo até você ativar novamente.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot está trabalhando';
  }

  @override
  String get appBrowserTakeOver => 'Assumir o controle';

  @override
  String get appBrowserHandBack => 'Devolver o controle';

  @override
  String get appBrowserYourTurn => 'Sua vez';

  @override
  String appBrowserPaused(String bot) {
    return '$bot está pausado enquanto você usa a página';
  }

  @override
  String get appBrowserAway => 'Pausado: o chat não está aberto';

  @override
  String get appBrowserAddress => 'Endereço do site';

  @override
  String get appBrowserBack => 'Voltar';

  @override
  String get appBrowserForward => 'Avançar';

  @override
  String get appBrowserReload => 'Recarregar';

  @override
  String get appBrowserAllowSite => 'Permitir que meus bots usem este site';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site adicionado. Seus bots podem usá-lo aqui.';
  }

  @override
  String get appBrowserAddressRefused =>
      'Não é possível abrir esse endereço aqui.';

  @override
  String get appBrowserSecure => 'Conexão segura';

  @override
  String get appBrowserNotSecure => 'Não seguro';

  @override
  String get appBrowserCardLabel => 'Navegador no app';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot quer abrir $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'No Casama neste dispositivo, com seus logins. “Sempre” permite abrir este site daqui em diante.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Neste Mac, com seus logins. “Sempre” permite abrir este site daqui em diante.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Neste computador, com seus logins. “Sempre” permite abrir este site daqui em diante.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Neste PC, com seus logins. “Sempre” permite abrir este site daqui em diante.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking':
          'Sites de bancos e pagamentos pedem confirmação todas as vezes.',
      'health': 'Sites de saúde pedem confirmação todas as vezes.',
      'passwords':
          'Sites de gerenciadores de senhas pedem confirmação todas as vezes.',
      'government':
          'Sites de documentos do governo pedem confirmação todas as vezes.',
      'other': 'Estes sites pedem confirmação todas as vezes.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Uma vez';

  @override
  String get appBrowserAlways => 'Sempre';

  @override
  String get appBrowserNever => 'Nunca';

  @override
  String appBrowserStepAskTitle(String bot) {
    return 'Permitir que $bot faça isto?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'No Casama neste dispositivo, com seus logins.';

  @override
  String get appBrowserStepAskHelpMac => 'Neste Mac, com seus logins.';

  @override
  String get appBrowserStepAskHelpLinux => 'Neste computador, com seus logins.';

  @override
  String get appBrowserStepAskHelpWindows => 'Neste PC, com seus logins.';

  @override
  String appBrowserStepClick(String name) {
    return 'Tocar em “$name”';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Digitar em “$name”';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Pressionar uma tecla em “$name”';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Enviar um arquivo para “$name”';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'Não permitir';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Celular Android';

  @override
  String get toolOnThisPhone => 'neste dispositivo';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bots nos navegadores no app dos membros';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Os membros podem permitir que bots usem um navegador dentro do Casama no celular ou computador deles, enquanto acompanham.';

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
  String get vendorRenewalUsd => 'Custo de uma renovação (USD)';

  @override
  String get vendorRenewalMonths => 'Meses cobertos por uma renovação';

  @override
  String get vendorSeeSpend => 'Ver gastos';

  @override
  String get costSpent => 'Gasto';

  @override
  String get costCharged => 'Cobrado';

  @override
  String get costMargin => 'Margem';

  @override
  String get costMarginNone => 'Nada foi cobrado';

  @override
  String get costNotRecorded => 'Não registrado';

  @override
  String get costNotRecordedHint =>
      'Mostra o que isto significa e a quais serviços se refere';

  @override
  String get costNotRecordedHelp =>
      'Alguns serviços informam o próprio total. Quando o deles é maior que o registrado por este servidor, a diferença aparece aqui. É um gasto real ainda sem vínculo com recurso, chave ou espaço de trabalho.';

  @override
  String get costNotRecordedWhy => 'O que os serviços informam acima disto';

  @override
  String get costNotRecordedNone => 'Corresponde ao que os serviços informam';

  @override
  String get costNotRecordedAllMatch =>
      'Todo serviço que informa um total corresponde ao que este servidor registrou.';

  @override
  String get costNotRecordedNoList =>
      'A lista de serviços não está disponível agora. Tente novamente em instantes.';

  @override
  String get costNoVendorFigures => 'Nenhum serviço informou um total';

  @override
  String get costNoVendorFiguresHelp =>
      'Nenhum serviço informou seu próprio total neste período, então não há com o que comparar.';

  @override
  String costNoFigureFrom(String names) {
    return 'Sem total de: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serviços',
      one: '$count serviço',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Eles informam $theirs · registramos $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Eles informam $theirs · registramos $ours · $gap não registrado';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Eles informam $theirs · registramos $ours · nada faltando';
  }

  @override
  String get costNoVendorFigure =>
      'Este serviço não informou um total próprio neste período.';

  @override
  String get costNoVendorFigureKind =>
      'Este serviço não informa um total próprio.';

  @override
  String costUpdated(String when) {
    return 'Atualizado $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'vs os $days dias anteriores',
      one: 'vs o $days dia anterior',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'sem período anterior para comparar';

  @override
  String get costChangeNew => 'Novo';

  @override
  String get costChangeNewSpoken => 'novo neste período';

  @override
  String get costChangeFlat => 'sem alteração';

  @override
  String costChangeUp(String amount) {
    return 'alta de $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'queda de $amount';
  }

  @override
  String costPoints(String count) {
    return '$count pts';
  }

  @override
  String get costOther => 'Outro';

  @override
  String get costNotLabelled => 'Sem rótulo';

  @override
  String get costNotLabelledHelp =>
      'Esses custos foram registrados sem rótulo para este agrupamento, então não podem ser divididos mais. Eles ainda fazem parte do total.';

  @override
  String get costGroupService => 'Serviço';

  @override
  String get costGroupKey => 'Chave';

  @override
  String get costGroupApp => 'Apps e MCP';

  @override
  String get costGroupFeature => 'Recurso';

  @override
  String get costGroupModel => 'Modelo';

  @override
  String get costGroupWorkspace => 'Espaço de trabalho';

  @override
  String get costGroupBy => 'Agrupar por';

  @override
  String get costFilters => 'Filtros';

  @override
  String get costNoFilters =>
      'Nenhum. Abra uma linha e escolha Mostrar na tabela para filtrar a visualização.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Remover filtro $name';
  }

  @override
  String get costIncludeFixed => 'Incluir contas fixas';

  @override
  String get costIncludeFixedHelp =>
      'Soma assinaturas e renovações ao valor gasto, distribuídas igualmente pelos dias que cobrem.';

  @override
  String get costOptions => 'Período e filtros';

  @override
  String get costPeriod => 'Período';

  @override
  String costPeriodDays(int days) {
    return '$days dias';
  }

  @override
  String get costPeriodCustom => 'Personalizado';

  @override
  String costLastDays(int days) {
    return 'Últimos $days dias';
  }

  @override
  String get costChangeDates => 'Alterar datas';

  @override
  String get costDone => 'Concluído';

  @override
  String get costDaysUtc => 'Os dias estão em UTC.';

  @override
  String get costDailySpend => 'Gasto diário';

  @override
  String costStackedBy(String group) {
    return 'Empilhado por $group: os maiores primeiro, depois Outro.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Gráfico de gasto diário, $days dias, $total no total. O dia mais alto foi $peakDay com $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Gráfico de gasto diário, $days dias, nada gasto.';
  }

  @override
  String get costSourceMetered => 'Medido';

  @override
  String get costSourceCounted => 'Contado';

  @override
  String get costSourceFixed => 'Fixo';

  @override
  String get costSourceEstimated => 'Estimado';

  @override
  String get costSourceMeteredHelp =>
      'Um custo real registrado para cada chamada.';

  @override
  String get costSourceCountedHelp =>
      'A contagem deste próprio servidor multiplicada por um preço unitário.';

  @override
  String get costSourceFixedHelp =>
      'Uma fatura distribuída igualmente pelos dias que cobre.';

  @override
  String get costSourceEstimatedHelp =>
      'Calculado pelo tamanho do texto. O custo real é de pelo menos isto.';

  @override
  String get costEstimated => 'estimado';

  @override
  String get costColShare => 'Fatia';

  @override
  String get costColChange => 'Variação';

  @override
  String get costColCalls => 'Chamadas';

  @override
  String get costColSource => 'Origem';

  @override
  String get costColFailed => 'Com falha';

  @override
  String get costColFees => 'Taxas de fornecedores';

  @override
  String get costColTokens => 'Custo de tokens';

  @override
  String get costTokenCost => 'Custo de tokens';

  @override
  String get costFailureRate => 'Taxa de falha';

  @override
  String costSortBy(String column) {
    return 'Ordenar por $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, ordenado do menor para o maior';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, ordenado do maior para o menor';
  }

  @override
  String get costOpenRowHint => 'Abre os detalhes';

  @override
  String costSpokenSpent(String amount) {
    return 'gasto $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'taxas de fornecedores $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share do total';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count chamadas';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate com falha';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'custo estimado de tokens de $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'cobrado $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count chamadas';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate com falha';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount tokens, estimado';
  }

  @override
  String get costOpenBilling => 'Abrir página de cobrança';

  @override
  String get costByDay => 'Por dia';

  @override
  String get costSplitBy => 'Dividir por';

  @override
  String get costShowInTable => 'Mostrar na tabela';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Filtra a tabela para $name e agrupa por $group.';
  }

  @override
  String get costNothingRecorded => 'Nada registrado aqui neste período.';

  @override
  String costLastUsed(String when) {
    return 'último uso $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'E mais $count. Mostrar na tabela.',
      one: 'E mais $count. Mostrar na tabela.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Para que serve';

  @override
  String get costKeyService => 'Serviço';

  @override
  String get costKeySetting => 'Configuração';

  @override
  String get costKeySetIn => 'Onde está definida';

  @override
  String get costKeyVault => 'Item do cofre';

  @override
  String get costKeyStatus => 'Status';

  @override
  String get costKeyConfigured => 'Definida';

  @override
  String get costKeyNotConfigured => 'Não definida';

  @override
  String get costKeyLastUsed => 'Último uso';

  @override
  String get costKeyNotUsed => 'Não usado neste período';

  @override
  String get costKeyCap => 'Limite de gasto';

  @override
  String costKeyCapLeft(String left, String cap) {
    return 'Resta $left de $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share do limite usado';
  }

  @override
  String get costKeyNoCap => 'Nenhum';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nada foi gasto nestes $days dias',
      one: 'Nada foi gasto neste $days dia',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Nada foi gasto nestes dias';

  @override
  String get costEmptyFiltered =>
      'Nada foi gasto que corresponda a estes filtros';

  @override
  String get costEmptyGroup => 'Nada para listar neste agrupamento';

  @override
  String get costAppsNote =>
      'Apps e servidores MCP: Gasto é o que o fornecedor cobrou. Custo de tokens é uma estimativa do quanto os resultados custaram em tokens de modelo e já faz parte do gasto com modelos.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount em contas fixas neste período ficou de fora. Ative Incluir contas fixas para somar.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Os espaços de trabalho pagaram $amount com suas próprias chaves. Esse dinheiro não é deste servidor, então fica de fora.';
  }

  @override
  String get costOlderServerTitle => 'Este servidor precisa de atualização';

  @override
  String get costOlderServer =>
      'Os custos por serviço, chave e app vêm em uma versão mais recente do servidor. Atualize o servidor e verifique novamente.';

  @override
  String get costCheckAgain => 'Verificar novamente';

  @override
  String get costSpendCardTitle => 'Gasto nos últimos 30 dias';

  @override
  String get costSpendCardOpen => 'Custos';

  @override
  String get costSpendCardHint => 'Abre a aba Custos';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Gasto nos últimos 30 dias: $spent gasto, $charged cobrado, $margin de margem';
  }

  @override
  String get costSort => 'Ordenar por';

  @override
  String get costSortName => 'Nome';

  @override
  String get costByWorkspace => 'Por espaço de trabalho';

  @override
  String get costTopTools => 'Principais ferramentas';

  @override
  String get costToolList => 'Lista de ferramentas enviada ao modelo';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'E mais $count ferramentas.',
      one: 'E mais $count ferramenta.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Usar o bot do Telegram do Casama';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Fale com $bot no Telegram. Um toque, nada para configurar.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Seu Telegram está conectado em outro espaço de trabalho. Conectar aqui transfere a conexão.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Suas mensagens lá vão para $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Suas mensagens lá vão para $other. Toque para enviar para $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'As mensagens do Telegram agora vão para $bot.';
  }

  @override
  String get telegramFinish => 'Concluir no Telegram';

  @override
  String get telegramFinishHelp =>
      'Pressione Começar no Telegram. Só faça isso na sua própria conta do Telegram. Isto atualiza assim que você conectar.';

  @override
  String get telegramOpenAgain => 'Abrir o Telegram novamente';

  @override
  String get telegramConnected => 'O Telegram está conectado';

  @override
  String telegramConnectedHelp(String name) {
    return 'Conectado como $name. Envie mensagem ao bot no Telegram quando quiser; o chat também aparece aqui em Geral.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Envie mensagem ao bot no Telegram quando quiser; o chat também aparece aqui em Geral.';

  @override
  String get telegramConnect => 'Conectar Telegram';

  @override
  String get telegramDisconnect => 'Desconectar Telegram';

  @override
  String get telegramDisconnectConfirm => 'Desconectar o Telegram?';

  @override
  String get telegramDisconnectHelp =>
      'Seus bots param de responder no Telegram. O histórico de chat continua aqui.';

  @override
  String get telegramPickBot => 'Mensagens do Telegram vão para';

  @override
  String get telegramNeedsBot =>
      'Crie um bot primeiro e depois conecte o Telegram.';

  @override
  String get telegramNotOffered =>
      'Este servidor não tem um bot do Telegram próprio. Você pode conectar seu próprio bot em Apps de chat do bot.';

  @override
  String get chatAppsSettingsHelp =>
      'Converse com seus bots pelos apps de chat que você já usa. As mensagens chegam ao seu chat Geral para você continuar daqui.';

  @override
  String get chatAppsPerBot =>
      'E-mail e seus próprios bots são configurados por bot: abra um bot e vá em Apps de chat.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack e mais';

  @override
  String get chatAppsSlackHelp =>
      'O Slack é adicionado por espaço de trabalho do Slack, para um bot. Escolha o bot e toque em Adicionar ao Slack.';

  @override
  String get chatAppsSlackPickBot => 'Adicionar Slack para';

  @override
  String get slackAnyoneInWorkspace =>
      'Qualquer pessoa neste espaço de trabalho do Slack';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Todos no espaço de trabalho podem falar com o bot, não só as pessoas listadas. Aprovações ainda exigem alguém da lista.';

  @override
  String get discordUseCasama => 'Usar o bot do Discord do Casama';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Fale com $bot no Discord. Entre com o Discord uma vez e envie mensagem ao bot ou use /ask em qualquer lugar.';
  }

  @override
  String get discordOtherWorkspace =>
      'Seu Discord está conectado em outro espaço de trabalho. Conectar aqui transfere a conexão.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'As mensagens do Discord agora vão para $bot.';
  }

  @override
  String get discordFinish => 'Concluir no Discord';

  @override
  String get discordFinishHelp =>
      'Entre com o Discord no navegador e autorize o Casama. Só faça isso com sua própria conta do Discord. Isto atualiza assim que você conectar.';

  @override
  String get discordOpenAgain => 'Abrir login do Discord novamente';

  @override
  String get discordConnected => 'O Discord está conectado';

  @override
  String discordConnectedHelp(String name) {
    return 'Conectado como $name. Envie mensagem ao bot do Casama no Discord ou use /ask em qualquer lugar; o chat também aparece aqui em Geral.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Envie mensagem ao bot do Casama no Discord ou use /ask em qualquer lugar; o chat também aparece aqui em Geral.';

  @override
  String get discordConnect => 'Conectar Discord';

  @override
  String get discordDisconnect => 'Desconectar Discord';

  @override
  String get discordDisconnectConfirm => 'Desconectar o Discord?';

  @override
  String get discordDisconnectHelp =>
      'Seus bots param de responder no Discord. O histórico de chat continua aqui.';

  @override
  String get discordPickBot => 'Mensagens do Discord vão para';

  @override
  String get discordNeedsBot =>
      'Crie um bot primeiro e depois conecte o Discord.';

  @override
  String get discordNotOffered =>
      'Este servidor não tem um app do Discord próprio. Você pode conectar seu próprio app do Discord em Apps de chat do bot.';

  @override
  String get inactiveAccountsNote =>
      'Se você parar de usar o Casama: após 30 dias, suas rotinas e monitoramentos pausam até você voltar. Após 6 meses, os arquivos salvos dos computadores são removidos e, após 12 meses (24 se você já tiver pago alguma vez), sua conta também é. Enviamos um e-mail antes de qualquer remoção. Contas em um plano pago nunca são afetadas.';

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
  String get inactivityModeOff => 'Desativado';

  @override
  String get inactivityModeReport => 'Denúncia';

  @override
  String get inactivityModeOn => 'Ativado';

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
    return 'ativo $when';
  }

  @override
  String get inactivityStateResting => 'Em repouso';

  @override
  String get inactivityStateFilesSoon => 'Arquivos removidos em breve';

  @override
  String get inactivityStateRemovalSoon => 'Remoção em breve';

  @override
  String get inactivityStateRemoving => 'Sendo removida';

  @override
  String get inactivityKept => 'Mantida';

  @override
  String get keepAccount => 'Manter esta conta';

  @override
  String get keepAccountHelp => 'Nunca pausada nem removida por inatividade';

  @override
  String get computerFilesRemoved => 'Arquivos salvos removidos';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Este computador ficou sem uso por 6 meses, então os arquivos salvos dele foram removidos em $date. Ele começa do zero.';
  }

  @override
  String get downloadSavedFiles => 'Baixar arquivos salvos';

  @override
  String get downloadSavedFilesHelp =>
      'Um .tar.gz da pasta inicial dele, sem despertá-lo';

  @override
  String get liveActivity => 'Atividade ao Vivo';

  @override
  String get liveRowHelp =>
      'Lista de espera, cadastros e downloads em tempo real';

  @override
  String get liveRefresh => 'Atualizar';

  @override
  String get liveTabActivity => 'Atividade';

  @override
  String get liveTabAlerts => 'Alertas';

  @override
  String get liveGroupAll => 'Tudo';

  @override
  String get liveGroupWaitlist => 'Lista de espera';

  @override
  String get liveGroupAccounts => 'Contas';

  @override
  String get liveGroupMoney => 'Dinheiro';

  @override
  String get liveGroupWebsite => 'Site';

  @override
  String get liveGroupGrowth => 'Crescimento';

  @override
  String get liveGroupSupport => 'Suporte';

  @override
  String get liveKindWaitlistJoined => 'Entrou na lista de espera';

  @override
  String get liveKindWaitlistAdmitted => 'Liberado da lista de espera';

  @override
  String get liveKindSignup => 'Nova conta';

  @override
  String get liveKindSignupRefused => 'Cadastro recusado';

  @override
  String get liveKindFirstChat => 'Primeiro chat';

  @override
  String get liveKindMilestone =>
      'Outras estreias (bot, computador, chamada, rotina)';

  @override
  String get liveKindSubscription => 'Nova assinatura';

  @override
  String get liveKindSubscriptionEnded => 'Assinatura encerrada';

  @override
  String get liveKindPurchase => 'Créditos comprados';

  @override
  String get liveKindSupportTicket => 'Ticket de suporte';

  @override
  String get liveKindFeedback => 'Feedback';

  @override
  String get liveKindAccountDeleted => 'Conta excluída';

  @override
  String get liveKindDownloadClick => 'Clique em download';

  @override
  String get liveKindQrOpen => 'QR code de download aberto';

  @override
  String get liveKindStartClick => 'Clicou em Começar grátis';

  @override
  String get liveKindInviteOpen => 'Link de convite aberto';

  @override
  String get liveNow => 'agora';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes min';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours h';
  }

  @override
  String get liveTestSent => 'Alerta de teste enviado para seus dispositivos';

  @override
  String get liveTodayWaitlist => 'Entraram hoje';

  @override
  String get liveTodaySignups => 'Contas hoje';

  @override
  String get liveTodayDownloads => 'Downloads hoje';

  @override
  String get liveTodayMoney => 'Receita hoje';

  @override
  String get liveRetry => 'Tentar novamente';

  @override
  String get liveEmpty =>
      'Nada ainda. Novas atividades aparecem aqui em segundos.';

  @override
  String get liveOlder => 'Mostrar anteriores';

  @override
  String get liveAlertsHelp =>
      'Escolha o que envia push para seus celulares, Macs e navegadores. Quando muita coisa acontece ao mesmo tempo, você recebe um único resumo em vez de um push para cada evento.';

  @override
  String get livePauseAll => 'Pausar todos os alertas';

  @override
  String get livePauseAllHelp => 'A atividade continua aparecendo aqui';

  @override
  String get liveSendTest => 'Enviar um alerta de teste';

  @override
  String get liveSendTestHelp =>
      'Confira se os alertas chegam neste dispositivo';

  @override
  String get liveAlertsFooter =>
      'Os alertas aguardam durante seu horário de silêncio (Configurações → Notificações) e chegam como um único resumo depois. No navegador, permita notificações para este site para recebê-los lá.';

  @override
  String get liveStatusOn => 'Ao vivo: atualiza a cada poucos segundos';

  @override
  String get liveStatusPaused => 'Ao vivo. Os alertas estão pausados';

  @override
  String get liveGroupApp => 'App';

  @override
  String get liveKindAppFirstOpen => 'App aberto pela primeira vez';

  @override
  String get liveKindAppReinstall => 'App reinstalado';

  @override
  String get liveKindSigninStarted => 'Começou a entrar';

  @override
  String get liveKindTrialStarted => 'Teste grátis iniciado';

  @override
  String get liveKindRenewal => 'Assinatura renovada';

  @override
  String get liveKindRefund => 'Reembolso';

  @override
  String get liveKindDisputeOpened => 'Disputa aberta';

  @override
  String get liveKindPlanCancelFailed => 'Plano não cancelado';

  @override
  String get liveKindStoreReview => 'Avaliação na loja';

  @override
  String get liveKindStoreCrashes => 'Relatórios de falhas da loja';

  @override
  String get liveKindDay2Return => 'Voltou no dia 2';

  @override
  String get liveKindWeek1Return => 'Voltou na semana 1';

  @override
  String get liveKindDeviceGone => 'App provavelmente excluído';

  @override
  String get liveKindPartnerInterest => 'Criador interessado em Parceiros';

  @override
  String get liveKindCreatorOpen => 'Link de criador aberto';

  @override
  String get liveKindPartnerClaimed => 'Código de criador usado';

  @override
  String get liveKindGiftOpen => 'Link de presente aberto';

  @override
  String get liveKindCompRedeemed => 'Plano de presente resgatado';

  @override
  String get liveKindReferralRewarded => 'Convite convertido';

  @override
  String get liveKindNewsletterConfirmed => 'Inscrição na newsletter';

  @override
  String get liveKindTestimonialSubmitted => 'Depoimento para revisar';

  @override
  String get liveDailyDigest => 'Resumo da manhã';

  @override
  String get liveDailyDigestHelp =>
      'Funil e downloads de ontem, às 9h no seu fuso horário';

  @override
  String get liveFunnelClicks => 'Cliques';

  @override
  String get liveFunnelOpens => 'Primeiras aberturas';

  @override
  String get liveFunnelSignups => 'Contas';

  @override
  String get liveFunnelChats => 'Primeiros chats';

  @override
  String get liveFunnelPaying => 'Pagos';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => 'Por pessoa';

  @override
  String get liveSearch => 'Buscar e-mail, país, origem';

  @override
  String get liveNoMatches => 'Nada corresponde a essa busca';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etapas',
      one: '$count etapa',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'provável';

  @override
  String get liveStepClick => 'Clicou em baixar';

  @override
  String get liveStepOpen => 'Abriu o app';

  @override
  String get liveStepSignup => 'Criou uma conta';

  @override
  String get liveStepChat => 'Primeiro chat';

  @override
  String get liveStepPaying => 'Pagante';

  @override
  String get liveJourneyTitle => 'O que aconteceu';

  @override
  String get liveJourneyVisitor => 'Visitante';

  @override
  String get liveJourneyWho => 'Quem';

  @override
  String get liveJourneyFrom => 'De onde';

  @override
  String get liveJourneyDevice => 'Dispositivo';

  @override
  String get liveJourneyTimeline => 'Linha do tempo';

  @override
  String get liveJourneyNow => 'Agora';

  @override
  String get liveJourneySource => 'Origem';

  @override
  String get liveJourneyCampaign => 'Campanha';

  @override
  String get liveJourneyLanding => 'Primeira página';

  @override
  String get liveJourneyClickedFrom => 'Clicou em';

  @override
  String get liveJourneyPlatform => 'Plataforma';

  @override
  String get liveJourneyStore => 'De';

  @override
  String get liveJourneyVersion => 'Versão';

  @override
  String get liveJourneyCountry => 'País';

  @override
  String get liveJourneyLikelyHelp =>
      'Relacionado a um clique no site por dispositivo, país e horário, não por um link. Considere um bom palpite.';

  @override
  String get liveJourneyPlan => 'Plano';

  @override
  String get liveJourneyMessages => 'Mensagens enviadas';

  @override
  String get liveJourneyBots => 'Bots';

  @override
  String get liveJourneyDevices => 'Conectado em';

  @override
  String get liveJourneyLastActive => 'Última atividade';

  @override
  String get liveJourneyJoined => 'Conta criada';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap depois';
  }

  @override
  String get liveJourneyNone => 'Nada mais se sabe sobre este ainda.';

  @override
  String get liveJourneyCopyEmail => 'Copiar e-mail';

  @override
  String get liveJourneyCopied => 'E-mail copiado';

  @override
  String get liveJourneyOpenAdmin => 'Abrir no Admin';

  @override
  String get liveJourneyGone =>
      'Este tem mais de 30 dias, então os detalhes já foram apagados.';

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
  String get planChangeTitle => 'Confirmar mudança de plano';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Mudar para $plan';
  }

  @override
  String get planChangeChargedNow => 'Cobrado agora';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Inclui $tax de impostos';
  }

  @override
  String get planChangeCredit => 'Crédito pelo tempo não usado';

  @override
  String planChangeThen(String amount, String period) {
    return 'Depois $amount / $period (antes dos impostos)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Próxima cobrança em $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Confirmar e pagar';

  @override
  String get planChangeHaveCode => 'Tem um código?';

  @override
  String get planChangeCodeLabel => 'Código de desconto';

  @override
  String get planChangeCodeHint => 'Digite o código';

  @override
  String get planChangeApply => 'Aplicar';

  @override
  String get planChangeRemove => 'Remover';

  @override
  String get planChangeDiscountApplied => 'Desconto aplicado';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '$percent% de desconto em cada renovação';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$percent% de desconto em $count renovações',
      one: '$percent% de desconto em $count renovação',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '$amount de desconto em cada renovação';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$amount de desconto em $count renovações',
      one: '$amount de desconto em $count renovação',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '$percent% de desconto em cada renovação; termina se você mudar de plano novamente';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '$amount de desconto em cada renovação; termina se você mudar de plano novamente';
  }

  @override
  String get planChangeInvalidCode =>
      'Esse código não pode ser usado neste plano.';

  @override
  String get planChangeCodeCostsMore =>
      'Esse código substituiria seu desconto atual e custaria mais.';

  @override
  String get planChangeCodeEndsLasting =>
      'Esse código encerraria seu desconto contínuo atual.';

  @override
  String get planChangeCodeNotBetter =>
      'Você já tem um desconto igual ou melhor.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Substitui seu desconto atual de $percent%';
  }

  @override
  String get planChangeReplacesDiscount => 'Substitui seu desconto atual';

  @override
  String get planChangePriceMoved =>
      'O total mudou desde que você abriu isto. Confira o valor atualizado e confirme novamente.';

  @override
  String get planChangePeriodWeek => 'semana';

  @override
  String get planChangePeriodMonth => 'mês';

  @override
  String get planChangePeriodYear => 'ano';

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
  String get partnerSection => 'Parceiros Casama';

  @override
  String get partnerProgramTitle => 'Faz vídeos, posts ou uma newsletter?';

  @override
  String get partnerProgramSubtitle =>
      'Ganhe 30% do que as pessoas que você indicar pagarem, durante um ano';

  @override
  String get partnerYourCode => 'Seu código de criador';

  @override
  String get partnerPaused => 'Pausado';

  @override
  String get partnerPortal => 'Ganhos e repasses';

  @override
  String partnerShareText(String link, String code) {
    return 'Experimente o Casama, colegas de IA que trabalham para você. Use meu código $code ao se cadastrar: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name indicou o Casama para você.';
  }

  @override
  String get partnerClaimed =>
      'Código de criador adicionado. Boas-vindas ao Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Obrigado por apoiar $name. Boas-vindas ao Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'Esse código de criador não existe. Confira e tente novamente.';

  @override
  String get partnerErrOwnCode =>
      'Esse é o seu próprio código. Compartilhe com seu público.';

  @override
  String get partnerErrWindowClosed =>
      'Códigos de criador só podem ser inseridos nos primeiros dias após o cadastro.';

  @override
  String get partnerErrAlreadyPaying =>
      'Códigos de criador são para contas novas, antes do primeiro pagamento.';

  @override
  String get partnerErrAlready => 'Você já inseriu o código de um criador.';

  @override
  String get partnerErrReferred =>
      'Você entrou com o convite de um amigo, então não é possível adicionar um código de criador.';

  @override
  String get partnerErrOff =>
      'Códigos de criador não estão disponíveis neste servidor.';

  @override
  String get referralHaveCodeAny => 'Tem um código?';

  @override
  String get referralCodeHintAny => 'Código de amigo ou criador';

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
  String get testimonialStateLive => 'No ar';

  @override
  String get testimonialStateDraft => 'Rascunho';

  @override
  String get testimonialStateHidden => 'Oculto';

  @override
  String get testimonialStateWithdrawn => 'Retirado';

  @override
  String get testimonialPlaceSiteHome => 'página inicial casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'preços casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'Planos no app';

  @override
  String get testimonialPlaceAppSignin => 'Login no app';

  @override
  String get testimonialSourceEmail => 'E-mail';

  @override
  String get testimonialSourceInApp => 'No app';

  @override
  String get testimonialSourceOther => 'Outro';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count estrelas',
      one: '$count estrela',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'O que as pessoas dizem sobre o Casama';

  @override
  String get testimonialAskTitle => 'Curtindo o Casama?';

  @override
  String get testimonialAskSubtitle => 'Conte em uma frase.';

  @override
  String get testimonialAskHint => 'Do que você mais gosta nele?';

  @override
  String testimonialAskConsent(String name) {
    return 'O Casama pode citar isto em casama.ai e no app como $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'O Casama pode me citar em casama.ai e no app como alguém que usa o Casama';

  @override
  String get testimonialAskSend => 'Enviar';

  @override
  String get testimonialAskNotNow => 'Agora não';

  @override
  String get testimonialAskThanks => 'Obrigado! Lemos todas as mensagens.';

  @override
  String get communityTitle => 'Comunidade';

  @override
  String get communitySentence =>
      'O Casama é código aberto. Se ele ajuda você, uma estrela no GitHub ajuda outras pessoas a encontrá-lo.';

  @override
  String get communityStarOnGitHub => 'Dar estrela no GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Converse com a equipe e outras pessoas que usam o Casama';

  @override
  String get starAskTitle => 'Casama no GitHub';

  @override
  String get starAskNotNow => 'Agora não';

  @override
  String get cloudSignInTitle => 'Entrar com sua conta do Casama';

  @override
  String get cloudSignInBody =>
      'A licença pessoal gratuita vem da sua conta do Casama. Apenas a licença vai para este servidor; seus chats ficam nele.';

  @override
  String get cloudSignInEmail => 'E-mail';

  @override
  String get cloudSignInSendCode => 'Enviar código';

  @override
  String get cloudSignInCode => 'Código do e-mail';

  @override
  String get cloudSignInVerify => 'Entrar';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Enviamos um código para $email. Digite-o aqui.';
  }

  @override
  String get licenseSetupTitle => 'Obtenha sua licença pessoal gratuita';

  @override
  String get licenseSetupBody =>
      'Este servidor precisa de uma licença para que os bots possam rodar. O uso pessoal é grátis para uma pessoa: entre com sua conta do Casama e a licença se renova online a cada 30 dias.';

  @override
  String get licensePersonalButton => 'Obter licença pessoal gratuita';

  @override
  String get licensePersonalNote =>
      'Pessoal: uma pessoa, para uso pessoal, no seu próprio computador ou servidor.';

  @override
  String get licenseBusinessTitle => 'Ou digite uma chave comercial';

  @override
  String get licenseBusinessHint => 'Cole sua chave de licença';

  @override
  String get licenseBusinessSave => 'Usar esta chave';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Usando o Casama no trabalho ou em equipe? A edição Business custa $monthlyPrice por usuário ativo ao mês ($yearlyMonthlyPrice na cobrança anual). Escreva para $email.';
  }

  @override
  String get licenseActivated => 'Licença ativa. Seus bots podem rodar.';

  @override
  String get licenseOtherServer => 'Usar outro servidor';

  @override
  String get licenseRenew => 'Renovar';

  @override
  String get licenseRenewTitle => 'Renovar a licença deste servidor';

  @override
  String licenseGraceBanner(String date) {
    return 'A licença deste servidor venceu. Os bots continuam rodando até $date; renove antes disso.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'A licença deste servidor venceu. Renove logo para manter os bots rodando.';

  @override
  String get licenseExpiredBanner =>
      'A licença deste servidor expirou, então novas execuções de bots estão pausadas. Seus dados estão seguros: você ainda pode entrar, ler e exportar. Renove para iniciar os bots novamente.';

  @override
  String get licenseErrorRequired =>
      'Este servidor precisa de uma licença primeiro. Obtenha a licença pessoal gratuita ou digite uma chave comercial.';

  @override
  String licenseErrorSeats(String email) {
    return 'Todas as vagas da licença deste servidor estão ocupadas. Mais pessoas precisam de uma licença Business: escreva para $email.';
  }

  @override
  String get licenseErrorExpired =>
      'A licença deste servidor expirou, então novas execuções de bots estão pausadas. Seus dados estão seguros. Renove a licença para iniciar os bots novamente.';

  @override
  String get licenseEditionPersonal => 'Pessoal';

  @override
  String get licenseEditionTrial => 'Teste';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Exportação de auditoria';

  @override
  String get licenseFeatureAuditForwarding => 'Encaminhamento de auditoria';

  @override
  String get licenseFeatureRoles => 'Papéis avançados';

  @override
  String get setupLicenseTitle => 'Licença pessoal gratuita';

  @override
  String get setupLicenseBody =>
      'Entre com sua conta do Casama para obter a licença pessoal gratuita para este servidor: uma pessoa, uso pessoal. Você também pode fazer depois.';

  @override
  String get setupLicenseSignIn => 'Entrar com o Casama';

  @override
  String get setupLicenseReady =>
      'A licença pessoal gratuita vem com seu servidor.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Conectado como $email. A licença pessoal gratuita vem com seu servidor.';
  }

  @override
  String get setupLicenseSkipped =>
      'Sem licença ainda. Seu servidor pede uma quando inicia.';

  @override
  String setupLicenseFailed(String error) {
    return 'Não foi possível gerar a licença pessoal ($error). Seu servidor pede uma quando inicia.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'O servidor do Casama roda dentro do Docker Desktop, um app gratuito que usa o WSL 2 para mantê-lo separado do restante do seu PC.';

  @override
  String get setupDockerStep1Windows =>
      'Execute o instalador que for baixado e deixe “Use WSL 2” ativado.';

  @override
  String localUpdateAvailable(String version) {
    return 'Uma atualização do servidor está pronta: $version';
  }

  @override
  String get localUpdateButton => 'Atualizar';

  @override
  String get localUpdateLater => 'Depois';

  @override
  String localUpdateTitle(String version) {
    return 'Atualizar seu servidor para $version';
  }

  @override
  String get localUpdateBody =>
      'O banco de dados passa por backup antes. Se a nova versão não iniciar, seu servidor volta para a versão atual.';

  @override
  String localUpdateDone(String version) {
    return 'Atualizado para $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'A nova versão não iniciou, então seu servidor voltou para a versão anterior. Nada foi perdido e um backup do banco de dados foi salvo.';

  @override
  String localUpdateFailed(String detail) {
    return 'A atualização falhou: $detail';
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
  String get shCloudScreenTitle => 'Modelos do Casama Cloud';

  @override
  String get shCloudPitch =>
      'Os modelos do Casama, sem chaves para gerenciar. Pagos por um plano do Casama Cloud.';

  @override
  String get shCloudTurnOn => 'Ativar';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Ativado · pago por $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, pago por $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Desativado. Apenas um administrador deste servidor pode ativar.';

  @override
  String get shCloudManage => 'Gerenciar';

  @override
  String get shCloudSignInBody =>
      'Entre com sua conta do Casama para escolher quem paga pelos modelos do Casama Cloud. Seus bots, chats e memória ficam neste servidor.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Conectado ao Casama Cloud como $email';
  }

  @override
  String get shCloudOtherAccount => 'Usar outra conta';

  @override
  String get shCloudContinue => 'Continuar';

  @override
  String get shCloudPayerTitle => 'Quem paga?';

  @override
  String get shCloudPayerBody =>
      'Os modelos do Casama Cloud são pagos por um espaço de trabalho do Casama Cloud que você possui ou administra. O plano, o uso incluído e o limite diário dele são compartilhados com tudo o mais que ele usa.';

  @override
  String get shCloudPayerNone =>
      'Você ainda não administra um espaço de trabalho do Casama Cloud. Crie um para pagar por ele; começa vazio.';

  @override
  String get shCloudCreateWorkspace => 'Criar um';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Espaço de trabalho de $name';
  }

  @override
  String get shCloudNoPlan => 'Sem plano ainda';

  @override
  String shCloudCovered(String plan) {
    return 'Seu plano $plan cobre isto.';
  }

  @override
  String get shCloudPlanTitle => 'Escolha um plano';

  @override
  String get shCloudPlanBody =>
      'Os modelos do Casama Cloud vêm em qualquer plano do Casama Cloud: o mesmo uso incluído, limite diário e pacotes de créditos do Casama Cloud. Sem preço separado para auto-hospedagem.';

  @override
  String get shCloudTryFirst => 'Testar antes';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Uso gratuito para testar: cerca de $amount em mensagens, uma vez por conta do Casama. Nada para comprar.';
  }

  @override
  String get shCloudTrialUsed =>
      'O uso gratuito para testar já acabou nesta conta do Casama. Escolha um plano para continuar.';

  @override
  String get shCloudIntervalWeek => 'Semanal';

  @override
  String get shCloudIntervalMonth => 'Mensal';

  @override
  String get shCloudIntervalYear => 'Anual';

  @override
  String get shCloudWaitingForPlan =>
      'Conclua o pagamento no navegador. Esta tela continua sozinha quando o plano chegar.';

  @override
  String get shCloudWaitingTimedOut =>
      'O plano ainda não chegou. Um pagamento pode levar alguns minutos para aparecer.';

  @override
  String get shCloudCheckAgain => 'Verificar novamente';

  @override
  String get shCloudGiftCode => 'Tem um código de presente?';

  @override
  String get shCloudGiftCodeLabel => 'Código de presente';

  @override
  String get shCloudRedeem => 'Resgatar';

  @override
  String get shCloudNoWayToBuy =>
      'Não é possível comprar planos neste app. Compre um em casama.ai com a mesma conta e verifique novamente aqui.';

  @override
  String get shCloudPurchasePending =>
      'Sua compra está aguardando aprovação. Isto continua quando for aprovada.';

  @override
  String get shCloudPurchaseFailed =>
      'A compra não foi concluída. Nada foi cobrado.';

  @override
  String get shCloudConnecting => 'Conectando este servidor ao Casama Cloud…';

  @override
  String get shCloudLoading => 'Carregando…';

  @override
  String get shCloudReviewTitle => 'Confira antes de ativar';

  @override
  String get shCloudReviewPays => 'Quem paga';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan em $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Uso gratuito para testar em $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Quais bots mudam';

  @override
  String get shCloudReviewAll => 'Todos os bots';

  @override
  String get shCloudReviewNoKey => 'Somente bots sem uma chave funcionando';

  @override
  String get shCloudReviewPick => 'Escolher bots';

  @override
  String get shCloudReviewNoBots =>
      'Este servidor ainda não tem bots. Novos bots podem usar o Casama Cloud.';

  @override
  String get shCloudReviewDefault => 'Novos bots também usam o Casama Cloud';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Modelo do Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Sem chave funcionando';

  @override
  String shCloudStepDown(String from) {
    return 'As respostas podem ser mais curtas ou menos cuidadosas do que com $from. Teste em um bot primeiro.';
  }

  @override
  String get shCloudReviewJobs => 'Memória, imagens e voz';

  @override
  String get shCloudJobMemory => 'Busca na memória';

  @override
  String get shCloudJobImages => 'Imagens';

  @override
  String get shCloudJobTts => 'Leitura em voz alta';

  @override
  String get shCloudJobStt => 'Ditado';

  @override
  String get shCloudJobOwnKey => 'Sua própria chave';

  @override
  String get shCloudJobMemoryOptIn => 'Usar o Casama Cloud para memória também';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'A memória é reindexada em segundo plano; a busca continua funcionando enquanto isso.';

  @override
  String get shCloudJobLiveNote =>
      'Voz ao vivo, chamadas telefônicas e vídeo continuam usando suas próprias chaves.';

  @override
  String get shCloudWhatGoes => 'O que vai para o Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'As mensagens ao modelo passam pelo Casama Cloud e não são armazenadas. O uso (modelo, tokens, custo) aparece na sua fatura do Casama Cloud. Bots, chats, memória, arquivos e computadores ficam neste servidor.';

  @override
  String get shCloudWhatGoesLink => 'O que este servidor envia';

  @override
  String get shCloudFallback =>
      'Se o Casama Cloud acabar ou ficar inacessível, usar minha própria chave';

  @override
  String get shCloudFallbackHelp =>
      'Toda resposta vinda da sua própria chave avisa isso.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString pessoas usam este servidor e o plano $plan cobre $seatsString. Cada pessoa extra é cobrada pelo preço de pessoa extra do Casama Cloud.';
  }

  @override
  String get shCloudApply => 'Ativar o Casama Cloud';

  @override
  String get shCloudPickOne =>
      'Escolha pelo menos um bot ou deixe que novos bots usem.';

  @override
  String get shCloudPolicyTitle => 'Quem pode usar';

  @override
  String get shCloudPolicyEveryone => 'Todos neste servidor';

  @override
  String get shCloudPolicyChosen => 'Apenas pessoas escolhidas';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pessoas escolhidas',
      one: '$countString pessoa escolhida',
      zero: 'Ninguém escolhido ainda',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Limite diário por pessoa';

  @override
  String get shCloudNoLimit => 'Sem limite';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount por dia';
  }

  @override
  String get shCloudPolicySaved => 'Salvo';

  @override
  String get shCloudDoneTitle => 'O Casama Cloud está ativado';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bots agora usam o Casama Cloud.',
      one: '$countString bot agora usa o Casama Cloud.',
      zero: 'Novos bots usam o Casama Cloud.',
    );
    return '$_temp0 O uso aparece na tela Uso deste servidor e na sua fatura do Casama Cloud.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Dizer oi para $bot';
  }

  @override
  String get shCloudDone => 'Concluído';

  @override
  String get shCloudUsageTitle => 'Uso';

  @override
  String shCloudIncludedLeft(String amount) {
    return '$amount de uso incluído restante neste mês';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Hoje: $spend de $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Hoje: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount em créditos';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return '$amount de uso gratuito restante para testar';
  }

  @override
  String get shCloudPriceNote =>
      'Pelo preço que o Casama Cloud cobra. As mesmas chamadas aparecem na sua fatura do Casama Cloud com o nome deste servidor.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Você hoje: $spend de $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'O Casama Cloud já usou 80% do uso incluído deste mês.';

  @override
  String get shCloudWarnDaily =>
      'O Casama Cloud já usou 80% do limite de hoje.';

  @override
  String get shCloudTopUp => 'Recarregar';

  @override
  String get shCloudUseOwnKey => 'Usar minha própria chave';

  @override
  String get shCloudStopOutOfCredits =>
      'O Casama Cloud ficou sem uso disponível neste mês.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'O limite de hoje do Casama Cloud acabou. Ele reinicia às $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'O limite de hoje do Casama Cloud acabou. Ele reinicia amanhã.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'O Casama Cloud precisa de um plano em $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'O plano do Casama Cloud em $workspace terminou.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'O plano em $workspace não cobre todas as pessoas que usam o Casama Cloud aqui.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Você atingiu o limite diário do Casama Cloud neste servidor.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Seu administrador ainda não ativou o Casama Cloud para você.';

  @override
  String get shCloudStopDisconnected =>
      'O Casama Cloud foi desconectado deste servidor.';

  @override
  String get shCloudStopUnreachable =>
      'Não foi possível alcançar o Casama Cloud agora. Tentando novamente.';

  @override
  String get shCloudSeePlans => 'Ver planos';

  @override
  String get shCloudRenew => 'Renovar';

  @override
  String get shCloudAskAdmin => 'Pedir a um admin';

  @override
  String get shCloudAskAdminBody =>
      'Apenas um administrador deste servidor pode alterar o Casama Cloud. Peça a um deles; os bots e as rotinas voltam a funcionar sozinhos quando isso for resolvido.';

  @override
  String get shCloudReconnect => 'Reconectar';

  @override
  String get shCloudFallbackActive =>
      'Sua própria chave está respondendo enquanto isso, e cada resposta avisa isso.';

  @override
  String get shCloudUseOwnKeyTitle => 'Usar sua própria chave enquanto isso?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Enquanto o Casama Cloud não puder responder, os bots respondem com sua própria chave, e cada resposta dessas avisa isso. Desative quando quiser nesta tela.';

  @override
  String get shCloudAddKeyFirst =>
      'Adicione uma chave sua na tela Modelos primeiro.';

  @override
  String get shCloudRoutinesWait =>
      'As rotinas aguardam e continuam sozinhas quando isso for resolvido.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'A memória está sendo atualizada: $doneString de $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'A busca usa palavras para memórias ainda não reindexadas.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'As mensagens ao modelo agora passam pelo Casama Cloud, pago por $workspace.';
  }

  @override
  String get shCloudGotIt => 'Entendi';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Pago por $workspace';
  }

  @override
  String get shCloudPaidBy => 'Pago por';

  @override
  String get shCloudChangePayer => 'Alterar';

  @override
  String get shCloudChangeBots => 'Alterar bots';

  @override
  String get shCloudFallbackSection =>
      'Quando o Casama Cloud não puder responder';

  @override
  String get shCloudTurnOff => 'Desativar';

  @override
  String get shCloudOffTitle => 'Desativar o Casama Cloud?';

  @override
  String get shCloudOffBody =>
      'Esses bots voltam para a chave anterior, se ela ainda funcionar; caso contrário, para a chave padrão do espaço de trabalho. Nada mais muda, e você pode ativar de novo quando quiser.';

  @override
  String get shCloudOffBotsNone => 'Nenhum bot usa o Casama Cloud agora.';

  @override
  String get shCloudOffDoneTitle => 'O Casama Cloud está desativado';

  @override
  String shCloudOffBackTo(String key) {
    return 'Volta para $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Precisa de uma chave';

  @override
  String get shCloudAddKey => 'Adicionar chave';

  @override
  String get shCloudSignInAgain =>
      'Sua sessão do Casama Cloud expirou. Entre novamente para continuar.';

  @override
  String get cloudAccountSection => 'Conta do Casama Cloud';

  @override
  String cloudAccountRow(String email) {
    return 'Conectado como $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Usada para a licença deste servidor e modelos do Casama Cloud';

  @override
  String get cloudAccountSignOut => 'Sair do Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'Este dispositivo esquece seu login do Casama Cloud. Este servidor, a licença dele e os modelos do Casama Cloud continuam funcionando.';

  @override
  String get cloudAccountDelete => 'Excluir conta do Casama Cloud';

  @override
  String get cloudAccountDeleteHelp =>
      'Exclui sua conta no Casama Cloud. Este servidor e os dados dele continuam intactos.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Digite $email para excluir sua conta do Casama Cloud. Os espaços de trabalho do Casama Cloud que só você possui são excluídos junto, e os modelos do Casama Cloud param nos servidores pagos por eles. Um plano que você comprou na web é cancelado automaticamente. Um plano comprado na App Store ou no Google Play não é: cancele-o nessa loja.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Sua conta do Casama Cloud foi excluída. Os dados dela serão apagados definitivamente em $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Mover para o Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Mover para meu próprio servidor';

  @override
  String get wsMoveSettingsHelp =>
      'Leve os bots, chats, memória e arquivos deste espaço de trabalho para outro servidor';

  @override
  String get wsMoveTitle => 'Mover este espaço de trabalho';

  @override
  String get wsMoveIntro =>
      'Tudo vai junto: bots, chats, memória, rotinas, arquivos e computadores. Quando chegar lá, esta cópia continua legível, mas para de funcionar.';

  @override
  String get wsMoveCloudOption => 'Mover para o Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Entre com sua conta do Casama e escolha para onde vai.';

  @override
  String get wsMoveServerOption => 'Mover para meu próprio servidor';

  @override
  String get wsMoveServerOptionHelp =>
      'Nesse servidor, abra Configurações › Trazer um espaço de trabalho para cá e copie o código de transferência.';

  @override
  String get wsMoveInstallServer => 'Instalar o servidor Casama';

  @override
  String get wsMoveInstallServerHelp =>
      'Sem servidor ainda? Execute um neste computador primeiro.';

  @override
  String get wsMoveReceiveOption => 'Trazer um espaço de trabalho para cá';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Obtenha um código de transferência para este espaço de trabalho, para usar no servidor onde o outro espaço de trabalho está agora.';

  @override
  String get wsMoveOwnerOnly =>
      'Apenas o proprietário do espaço de trabalho pode movê-lo.';

  @override
  String get wsMoveCloudPickTitle => 'Para onde ele deve ir?';

  @override
  String get wsMoveCloudNew => 'Um novo espaço de trabalho';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Começa vazio no Casama Cloud, com o nome $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Os itens movidos ficam ao lado do que já existe lá. Nomes repetidos recebem “(moved)”.';

  @override
  String get wsMoveServerTitle => 'Mover para seu próprio servidor';

  @override
  String get wsMoveServerAddress => 'Endereço do servidor';

  @override
  String get wsMoveServerCode => 'Código de transferência';

  @override
  String get wsMoveCheckButton => 'Verificar';

  @override
  String get wsMoveReceiveTitle => 'Trazer um espaço de trabalho para cá';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'No servidor onde o espaço de trabalho está agora, abra Configurações › Mover para meu próprio servidor e digite este endereço e código. O código vale uma vez, até $time, e traz tudo para $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Endereço deste servidor';

  @override
  String get wsMoveReceiveCode => 'Código de transferência';

  @override
  String get wsMoveCopy => 'Copiar';

  @override
  String get wsMoveCopied => 'Copiado';

  @override
  String get wsMoveCheckTitle => 'Pronto para mover';

  @override
  String wsMoveCheckTo(String name) {
    return 'Para $name';
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
      one: '$minutesString minuto',
    );
    return '$size para copiar, cerca de $_temp0';
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
      one: '$minutesString minuto',
    );
    return 'Perto do fim, os bots pausam por cerca de $_temp0 e depois continuam lá.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'Essa pausa é longa. Escolha um horário tranquilo.';

  @override
  String get wsMoveCheckComes => 'O que vai junto';

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
      other: '$nString chats',
      one: '$nString chat',
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
      other: '$nString memórias',
      one: '$nString memória',
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
      other: '$nString rotinas',
      one: '$nString rotina',
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
      other: '$nString arquivos',
      one: '$nString arquivo',
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
      other: '$nString computadores',
      one: '$nString computador',
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
      other: '$nString pessoas',
      one: '$nString pessoa',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'O que precisa de você depois';

  @override
  String wsMoveReconnect(String names) {
    return 'Entre nestes apps novamente lá: $names';
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
      other: '$nString pessoas recebem',
      one: '$nString pessoa recebe',
    );
    return '$_temp0 um convite por e-mail';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (convidado)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'Planos do ChatGPT ficam para trás. Entre no ChatGPT novamente lá.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString computadores começam',
      one: '$nString computador começa',
    );
    return '$_temp0 do zero lá, com a pasta pessoal restaurada.';
  }

  @override
  String get wsMoveResetNote =>
      'Aprovações, acesso total e acesso ao dispositivo voltam para os padrões do novo servidor.';

  @override
  String get wsMoveBringKeys => 'Levar minhas chaves';

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
          '$nString chaves vão junto, protegidas para que só o novo servidor possa lê-las.',
      one:
          '$nString chave vai junto, protegida para que só o novo servidor possa lê-la.',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Você adicionará novamente suas chaves de modelo e de apps de chat lá.';

  @override
  String get wsMoveDoesntFit =>
      'Este espaço de trabalho não cabe no plano de lá';

  @override
  String wsMoveNeedsPlan(String plan) {
    return 'O plano $plan comporta. Escolha-o no Casama Cloud e verifique novamente.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have de $limit';
  }

  @override
  String get wsMoveOverPeople => 'Pessoas';

  @override
  String get wsMoveOverBots => 'Bots';

  @override
  String get wsMoveOverComputers => 'Computadores';

  @override
  String get wsMoveOverStorage => 'Armazenamento';

  @override
  String get wsMoveUpdateSource =>
      'Atualize este servidor primeiro. Ele é mais antigo que o servidor de destino.';

  @override
  String get wsMoveUpdateTarget =>
      'O servidor de destino precisa ser atualizado primeiro.';

  @override
  String get wsMoveStart => 'Iniciar transferência';

  @override
  String get wsMoveCheckAgain => 'Verificar novamente';

  @override
  String get wsMoveProgressTitle => 'Movendo';

  @override
  String get wsMoveStepStarting => 'Preparando';

  @override
  String get wsMoveStepCopying =>
      'Copiando arquivos enquanto tudo continua funcionando';

  @override
  String get wsMoveStepPausing =>
      'Pausando os bots para copiar as últimas alterações';

  @override
  String get wsMoveStepFinishing => 'Enviando chats, memória e configurações';

  @override
  String get wsMoveStepImporting => 'O novo servidor está importando tudo';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done de $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Você pode fechar o app. A transferência continua, e você recebe uma notificação quando terminar.';

  @override
  String get wsMoveFailedTitle => 'A transferência parou';

  @override
  String get wsMoveFailedBody =>
      'Nada mudou aqui: este espaço de trabalho continua funcionando.';

  @override
  String get wsMoveTryAgain => 'Tentar novamente';

  @override
  String get wsMoveNewCodeNeeded =>
      'Para tentar de novo, gere um novo código de transferência.';

  @override
  String get wsMoveDoneTitle => 'Movido';

  @override
  String wsMoveDoneBody(String server) {
    return 'Tudo chegou em $server.';
  }

  @override
  String get wsMoveDoneNeeds => 'Algumas coisas precisam de você lá:';

  @override
  String get wsMoveOpenThere => 'Abrir lá';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Entre em $name novamente';
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
      other: '$nString pessoas foram',
      one: '$nString pessoa foi',
    );
    return '$_temp0 convidada por e-mail';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Reconectar $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Informe ao remetente de $name o novo endereço de webhook';
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
      other: '$nString dias',
      one: '$nString dia',
    );
    return 'Webhooks ainda enviados para cá serão repassados por $_temp0.';
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
    return 'Confira as aprovações para $_temp0';
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
    return 'Conecte os modelos do Casama Cloud em Configurações, ou escolha outro modelo, para $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Adicione suas chaves de modelo lá';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString itens foram renomeados “(moved)”',
      one: '$nString item foi renomeado “(moved)”',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveAfterReindex =>
      'A busca na memória fica em dia em alguns minutos.';

  @override
  String get wsMoveAfterNothing => 'Nada mais a fazer.';

  @override
  String get wsMoveSubTitle => 'Suas assinaturas';

  @override
  String get wsMoveSubToCloud =>
      'Os bots no Casama Cloud rodam no seu plano do Casama Cloud. Se você pagava uma licença comercial para este servidor, cancele quando não precisar mais.';

  @override
  String get wsMoveSubFromCloud =>
      'Seu plano do Casama Cloud continua renovando. Cancele quando estiver tudo certo no seu próprio servidor.';

  @override
  String get wsMoveSubManage => 'Gerenciar plano';

  @override
  String get wsMovedTitle => 'Este espaço de trabalho foi movido';

  @override
  String get wsMovedBodyCloud =>
      'Ele está no Casama Cloud agora. Entre lá para continuar. Esta cópia está somente para leitura.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Ele está em $host agora. Entre lá para continuar. Esta cópia está somente para leitura.';
  }

  @override
  String get wsMovedSignInCloud => 'Entrar no Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Abrir $host';
  }

  @override
  String get wsMovedViewOld => 'Ver a cópia antiga';

  @override
  String get languageDevice => 'Idioma do dispositivo';

  @override
  String get shortcutQuickAsk => 'Pergunta rápida';

  @override
  String shortcutAskBot(String name) {
    return 'Perguntar a $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Executar $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'espaço espaco de trabalho workspace alternar trocar equipe organização organizacao papel função funcao';

  @override
  String get settingsWordsAboutYou =>
      'perfil nome foto imagem avatar pronomes sobre mim estilo de resposta fatos memória memoria';

  @override
  String get settingsWordsPeople =>
      'membros convidar equipe usuários usuarios administradores papéis papeis link de convite código codigo entrar remover';

  @override
  String get settingsWordsWorkspaceSettings =>
      'espaço espaco de trabalho nome ícone icone logotipo criptografia memória memoria pagamentos stripe cartão cartao gerenciador senhas bot para extensão extensao chrome galeria acesso total permissões permissoes aprovações aprovacoes perguntar ignorar';

  @override
  String get settingsWordsSettingsDomains =>
      'domínio dominio site website dns personalizado comprar conectar sites';

  @override
  String get settingsWordsUsage =>
      'custo gasto gastos dinheiro créditos creditos tokens limites uso';

  @override
  String get settingsWordsBilling =>
      'plano assinatura upgrade pro plus max pagamento fatura cartão cartao preço preco';

  @override
  String get settingsWordsInviteFriends =>
      'indicação indicacao crédito credito recompensa compartilhar convite';

  @override
  String get settingsWordsAdminConsole =>
      'console admin administração administracao';

  @override
  String get settingsWordsAppearance =>
      'tema modo escuro claro noite cores fontes fonte tamanho do texto fundo papel de parede visual estilo efeitos movimento animações animacoes aparência aparencia tatil tátil haptico háptico vibracao vibrração vibrar retorno feedback trackpad';

  @override
  String get settingsWordsQuietHours =>
      'não nao perturbe dnd dormir silenciar mudo notificações notificacoes agendar horário horario de silêncio silencio';

  @override
  String get settingsWordsPushPrefsTitle =>
      'notificações notificacoes push alertas respostas sons';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'chamadas ligação ligacao celular tocar tela bloqueada cheia recebida atender';

  @override
  String get settingsWordsEmailTips =>
      'email e-mail newsletter dicas novidades cancelar inscrição inscricao';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'email e-mail galeria resumo mensal escolhas';

  @override
  String get settingsWordsNewsletterTitle =>
      'email e-mail newsletter mensal novidades atualizações atualizacoes inscrever cancelar';

  @override
  String get settingsWordsWakeWord =>
      'voz ei mãos maos livres microfone mic ouvir comando de';

  @override
  String get settingsWordsShowBotSteps =>
      'etapas ferramentas detalhes progresso passos';

  @override
  String get settingsWordsShowReplyUsage =>
      'custo tokens preço preco uso por resposta';

  @override
  String get settingsWordsCheckForUpdates =>
      'atualizar atualizações atualizacoes versão versao upgrade baixar automático automatico';

  @override
  String get settingsWordsOpenAtLogin =>
      'inicialização inicializacao abrir login iniciar automaticamente ao ligar';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'atividade ao vivo dynamic island tela bloqueada outros dispositivos';

  @override
  String get settingsWordsShowBotsInNotch =>
      'notch barra de menus dynamic island camera';

  @override
  String get settingsWordsNotchOnHover => 'notch passar o cursor mouse';

  @override
  String get settingsWordsLanguage =>
      'idioma localização localizacao inglês ingles português portugues tradução traducao';

  @override
  String get settingsWordsIntegrations =>
      'apps conectar conexões conexoes gmail google slack agenda calendário calendario plugins ferramentas mcp';

  @override
  String get settingsWordsSkills =>
      'habilidades skills catálogo catalogo capacidades instruções instrucoes';

  @override
  String get settingsWordsCasamaLink =>
      'acesso remoto endereço endereco túnel tunel auto hospedagem celular';

  @override
  String get settingsWordsServiceKeys => 'chaves api busca mapas dados';

  @override
  String get settingsWordsModelsTitle =>
      'chaves api openai anthropic openrouter gemini modelos provedores ollama locais';

  @override
  String get settingsWordsModelKeys =>
      'chaves api openai anthropic openrouter gemini modelos provedores ollama locais';

  @override
  String get settingsWordsAccount =>
      'email e-mail alterar senha sair de tudo login conta';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa dois fatores autenticador totp otp código codigo de segurança seguranca';

  @override
  String get settingsWordsPairDevice =>
      'código codigo qr code escanear entrar parear celular outro dispositivo';

  @override
  String get settingsWordsPasskeys =>
      'chave de acesso chave-senha passkey face id touch digital biometria';

  @override
  String get settingsWordsWidgetsTitle =>
      'widgets tela inicial bloqueada controles central de controle fixar atalho';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'cartões cartoes clima unidades celsius fahrenheit cidade natal localização localizacao moeda ações acoes vermelho verde fontes de dados';

  @override
  String get settingsWordsAppLock =>
      'bloqueio do app pin senha código codigo face id touch digital biometria windows hello capturas de tela privacidade bloqueada';

  @override
  String get settingsWordsPrivacy =>
      'dados exportar baixar excluir conta análise analise rastreamento histórico historico retenção retencao pessoas bloqueadas bloquear';

  @override
  String get settingsWordsSecrets =>
      'segredos senhas credenciais cofre variáveis variaveis de ambiente';

  @override
  String get settingsWordsComputers =>
      'computadores máquinas maquinas docker sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      'dispositivos localização localizacao saúde saude lugares pastas apps observados navegadores extensão extensao chrome permissões permissoes do celular';

  @override
  String get settingsWordsUseThisComputer =>
      'companion este computador mac arquivos locais';

  @override
  String get settingsWordsHelpAndSupport =>
      'ajuda suporte contato ticket relatar bug feedback documentação documentacao comunidade github estrela código codigo aberto discord ideias quadro status';

  @override
  String get settingsWordsSignOut =>
      'sair encerrar sessão sessao desconectar logout';

  @override
  String get notifDoIt => 'Fazer';

  @override
  String get notifNotNow => 'Agora não';

  @override
  String get notifAllow => 'Permitir';

  @override
  String get notifDeny => 'Recusar';

  @override
  String get notifApprove => 'Aprovar';

  @override
  String get notifReview => 'Revisar';

  @override
  String get notifReply => 'Responder';

  @override
  String get notifSend => 'Enviar';

  @override
  String get notifReplyPlaceholder => 'Responder…';

  @override
  String get notifChannelReplies => 'Respostas';

  @override
  String get notifChannelRepliesDescription =>
      'Um bot respondeu a algo que você perguntou';

  @override
  String get notifChannelNeedsYou => 'Precisa de você';

  @override
  String get notifChannelNeedsYouDescription =>
      'Aprovações, senhas e controles manuais que seus bots aguardam';

  @override
  String get notifChannelRoutines => 'Rotinas e resumos';

  @override
  String get notifChannelRoutinesDescription =>
      'Resultados de rotinas e o resumo da manhã';

  @override
  String get notifChannelSuggestions => 'Sugestões';

  @override
  String get notifChannelSuggestionsDescription =>
      'Coisas que seus bots oferecem fazer para você';

  @override
  String get notifChannelAccount => 'Conta';

  @override
  String get notifChannelAccountDescription =>
      'Créditos, projetos e seu servidor';

  @override
  String get notifCallChannel => 'Chamadas';

  @override
  String get notifCallLive => 'Em chamada';

  @override
  String get notifCallMuted => 'Microfone desligado';

  @override
  String get notifCallReconnecting => 'Reconectando';

  @override
  String get notifCallMute => 'Silenciar';

  @override
  String get notifCallUnmute => 'Ativar som';

  @override
  String get notifCallEnd => 'Encerrar chamada';

  @override
  String get notifFromYourWatch => 'Do seu relógio';

  @override
  String get notifLiveOpen => 'Abrir';

  @override
  String get notifLiveStop => 'Parar';

  @override
  String get notifLiveReview => 'Revisar';

  @override
  String get notifLiveAllow => 'Permitir';

  @override
  String get notifLiveDeny => 'Recusar';

  @override
  String get notifLiveNeedsOk => 'Precisa do seu OK';

  @override
  String get notifLiveNeedsYou => 'Precisa de você';

  @override
  String get notifLiveWorking => 'Trabalhando';

  @override
  String get notifLiveTakeOver => 'Quer que você assuma o controle';

  @override
  String get notifLiveFinished => 'Concluído';

  @override
  String get notifLiveProblem => 'Parou com um problema';

  @override
  String get notifLiveBotWorking => 'Um bot está trabalhando';

  @override
  String get notifLiveBotsAtWork => 'Bots trabalhando';

  @override
  String get notifLiveStepOne => '1 etapa';

  @override
  String notifLiveSteps(int count) {
    return '$count etapas';
  }

  @override
  String get notifAlarmTitle => 'Alarme do Casama';

  @override
  String get notifAlarmStop => 'Parar';

  @override
  String get widgetIosNeedsYouDescription =>
      'Veja quais bots estão esperando você e responda aos pedidos simples.';

  @override
  String get widgetIosBotDescription =>
      'Acompanhe o que um dos seus bots está fazendo.';

  @override
  String get widgetIosAskDescription =>
      'Pergunte a um bot ou inicie uma chamada com um toque, com ideias para testar.';

  @override
  String get widgetIosRoutinesDescription =>
      'Veja o que roda a seguir e execute uma rotina agora.';

  @override
  String get widgetIosTodayDescription =>
      'Veja seu dia em um só lugar: o que precisa de você, o que roda a seguir e seus créditos.';

  @override
  String get widgetIosBriefDescription =>
      'Leia o que seu bot contou nesta manhã.';

  @override
  String get widgetIosLibraryDescription =>
      'Abra o que seus bots criaram ultimamente.';

  @override
  String get widgetIosTasksDescription =>
      'Veja como está o quadro, com o que espera por você primeiro.';

  @override
  String get widgetIosCreditsDescription =>
      'Confira quanto dos seus créditos você já usou.';

  @override
  String get widgetIosInlineDescription =>
      'Veja o que mais importa, acima do relógio.';

  @override
  String get widgetIosCanvasDescription =>
      'Mostre o que seus bots colocaram aqui: um versículo, uma contagem regressiva, uma sequência, uma lista ou uma imagem.';

  @override
  String get widgetMacNeedsYouDescription =>
      'Veja quais bots estão esperando você.';

  @override
  String get widgetMacRoutinesDescription => 'Veja o que roda em seguida.';

  @override
  String get widgetAskCasama => 'Perguntar ao Casama';

  @override
  String get widgetControlAskDescription =>
      'Abre a pergunta rápida com o teclado aberto.';

  @override
  String get widgetTalkToBot => 'Falar com um bot';

  @override
  String widgetTalkToName(String name) {
    return 'Falar com $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Inicia uma chamada de voz com o bot que você escolher.';

  @override
  String get widgetRunRoutine => 'Executar uma rotina';

  @override
  String get widgetControlRunDescription =>
      'Executa a rotina que você escolher, sem abrir o Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Pergunte qualquer coisa a $bot';
  }

  @override
  String get widgetFallbackBrief => 'Resumo da manhã';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot concluiu $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'Às $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Nada previsto';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot quer que você assuma o controle';
  }

  @override
  String get widgetFallbackDay => 'dia';

  @override
  String get widgetFallbackDays => 'dias';

  @override
  String get widgetSampleVerse => 'Aquietai-vos e sabei que eu sou Deus.';

  @override
  String get widgetSampleVerseRef => 'Sl 46:10';

  @override
  String get widgetSampleVerseShort =>
      'Aquietai-vos e sabei que eu sou Deus. · Sl 46:10';

  @override
  String get widgetSampleVerseTiny => 'Aquietai-vos e sabei…';

  @override
  String get widgetSampleCanvasName => 'Versículo do dia';

  @override
  String get widgetSampleNeedFlights => 'Pesquisar voos para Lisboa';

  @override
  String get widgetSampleNeedDentist => 'Mudar o dentista para sexta?';

  @override
  String get widgetSampleBotText =>
      'Três e-mails precisam de resposta, e a fatura da Acme está dois dias atrasada.';

  @override
  String get widgetSampleStep => 'Lendo sua caixa de entrada';

  @override
  String get widgetSampleRoutineInbox => 'Limpeza da caixa de entrada';

  @override
  String get widgetSampleRoutineBrief => 'Resumo da manhã';

  @override
  String get widgetSampleRoutineWeekly => 'Relatório semanal';

  @override
  String get widgetSampleWeekdays => 'Dias úteis';

  @override
  String get widgetSampleEveryDay => 'Todos os dias';

  @override
  String get widgetSampleFridays => 'Sextas às 16:00';

  @override
  String get widgetSampleBrief =>
      'Três e-mails precisam de resposta, e a fatura da Acme está dois dias atrasada. Chuva a partir das 15:00, então saia cedo para buscar às 16:30. Sua primeira reunião é às 10:00 com Dana.';

  @override
  String get widgetSamplePricing => 'Página de preços Q4';

  @override
  String get widgetSampleLogoIdeas => 'Ideias de logotipo';

  @override
  String get widgetSampleTripPlan => 'Plano de viagem';

  @override
  String get widgetSampleLaunchPost => 'Rascunhar post de lançamento';

  @override
  String get widgetSampleStarterInbox => 'Resumir minha caixa de entrada';

  @override
  String get widgetSampleStarterFriday => 'Planejar minha sexta';

  @override
  String get widgetSampleWorking => 'Trabalhando · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'Restam US\$ 5,70';

  @override
  String get widgetSampleSpentToday => 'US\$ 0,80 hoje';

  @override
  String get widgetSampleMorning =>
      'Bom dia. Duas reuniões hoje, a primeira às 10:00 com a equipe de design. Chuva depois das 15:00, então leve casaco. Seu voo para Lisboa está confirmado para sexta-feira.';

  @override
  String get widgetSampleLisbonPlan => 'Plano de viagem a Lisboa';

  @override
  String get widgetSampleAgo => 'Milo · há 2 h';

  @override
  String get widgetSampleLaunchEmail => 'Rascunhar e-mail de lançamento';

  @override
  String get widgetSampleInReviewBy => 'Em revisão · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo quer buscar preços de voos para Lisboa';

  @override
  String get widgetSampleUpNextAt => 'A seguir · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · em 18 min';

  @override
  String get widgetSampleDate => 'Quarta-feira, 18 de novembro';

  @override
  String get widgetSampleNeedsCount => 'Precisa de você · 1';

  @override
  String get widgetSampleSearchFlights => 'Buscar preços de voos para Lisboa';

  @override
  String get widgetSampleAskAda => 'Perguntar a Ada';

  @override
  String get widgetSampleAskMilo => 'Perguntar a Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Planejar meu dia';

  @override
  String get widgetSampleWhatsNew => '✉️ Novidades da caixa de entrada?';

  @override
  String get widgetAndroidBotDescription =>
      'Acompanhe o que um bot está fazendo agora';

  @override
  String get widgetAndroidTodayDescription =>
      'Reúna todo o seu dia com seus bots em um só lugar';

  @override
  String get widgetAndroidBriefDescription =>
      'Leia seu resumo da manhã num relance';

  @override
  String get widgetAndroidLibraryDescription =>
      'Abra o que seus bots criaram ultimamente';

  @override
  String get widgetAndroidTasksDescription =>
      'Acompanhe o andamento do quadro de tarefas';

  @override
  String get widgetAndroidCreditsDescription => 'Confira quanto você já usou';

  @override
  String get widgetAndroidCanvasDescription =>
      'Mostre o que seus bots colocaram aqui, de um versículo a uma contagem regressiva';

  @override
  String get widgetConfigBotTitle => 'Escolha um bot';

  @override
  String get widgetConfigRoutinesTitle => 'Escolha rotinas';

  @override
  String get widgetConfigRoutinesHint =>
      'Escolha até quatro das que você inicia manualmente';

  @override
  String get widgetConfigAutomatic => 'Automático';

  @override
  String get widgetConfigAutomaticHint =>
      'As próximas execuções, entre todos os bots';

  @override
  String get widgetConfigDone => 'Concluído';

  @override
  String get widgetConfigSignedOutTitle => 'Nada para escolher ainda';

  @override
  String get widgetConfigSignedOut =>
      'Abra o Casama e entre para escolher aqui.';

  @override
  String get widgetConfigCanvasTitle => 'Escolha um quadro';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'O que um bot definiu mais recentemente';

  @override
  String get widgetConfigCanvasNone =>
      'Nenhum quadro ainda. Peça a um bot para colocar algo aqui.';

  @override
  String get iosUsageTracking =>
      'Se você permitir, o Casama avisa a Meta quando você instalar, se cadastrar ou assinar após ver um anúncio do Casama no Facebook ou Instagram, para medirmos quais anúncios funcionam. O Casama nunca exibe anúncios e nunca compartilha seus chats ou arquivos.';

  @override
  String get iosUsageContacts =>
      'Seus bots podem consultar pessoas que você conhece, somente quando você ativar Contatos em Conexões de dispositivos.';

  @override
  String get iosUsagePhotoLibrary =>
      'O Casama abre sua biblioteca de fotos quando você escolhe uma foto para enviar a um bot ou usar no seu perfil.';

  @override
  String get iosUsageLocationAlways =>
      'Avise seus bots quando você chegar ou sair dos seus lugares salvos, mesmo com o Casama fechado. Apenas o nome do lugar e o horário são compartilhados, nunca seu trajeto.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Salve lugares que você nomear, como Casa ou Trabalho, e deixe seus bots lembrarem quando sair para seu próximo compromisso. Usado somente se você ativar Lugares em Conexões de dispositivos.';

  @override
  String get iosUsageCamera =>
      'O Casama usa a câmera quando você tira uma foto para enviar a um bot ou usar no seu perfil.';

  @override
  String get iosUsageCalendars =>
      'Seus bots podem responder perguntas sobre sua agenda e adicionar eventos, somente quando você ativar Calendário em Conexões de dispositivos.';

  @override
  String get iosUsageSpeech =>
      'Quando o serviço de ditado do Casama não estiver acessível, o reconhecimento de voz do próprio dispositivo transforma o que você fala em texto.';

  @override
  String get iosUsageAlarmKit =>
      'Seus bots podem definir alarmes e timers que tocam mesmo no modo silencioso, somente quando você permitir Alarmes em Conexões de dispositivos.';

  @override
  String get iosUsageHomeKit =>
      'Seus bots podem verificar e controlar sua casa do HomeKit quando você permitir Casa em Conexões de dispositivos; alterações sempre pedem aprovação antes.';

  @override
  String get iosUsageMicrophone =>
      'O Casama usa o microfone para ditado e chamadas ao vivo com seus bots. Só depois que você concordar, sua voz é enviada a provedores de IA para responder a você: Google Gemini nas chamadas e OpenAI para transformar ditado em texto.';

  @override
  String get iosUsageHealthUpdate =>
      'O Casama apenas lê dados do Apple Saúde; nunca escreve neles.';

  @override
  String get iosUsageFaceId =>
      'O Casama usa o Face ID para desbloquear o app quando o bloqueio do app está ativado e para confirmar ações arriscadas.';

  @override
  String get iosUsageHealthShare =>
      'Seus bots podem ver resumos diários do seu sono, atividade, treinos e coração no Apple Saúde, somente quando você ativar o Apple Saúde em Conexões de dispositivos. O Casama nunca grava no Apple Saúde e nunca usa esses dados para anúncios.';

  @override
  String get iosUsageWatchMicrophone =>
      'O Casama grava sua voz quando você pergunta algo a um bot e a envia ao seu servidor do Casama, onde um provedor de IA (OpenAI, no Casama Cloud) a transforma em texto para o bot.';

  @override
  String get macUsageContacts =>
      'Seus bots podem consultar pessoas que você conhece, somente quando você ativar Contatos em Conexões de dispositivos.';

  @override
  String get macUsageSpeech =>
      'Quando o serviço de ditado do Casama não estiver acessível, o reconhecimento de voz do próprio dispositivo transforma o que você fala em texto.';

  @override
  String get macUsageMicrophone =>
      'O Casama usa o microfone para ditado e chamadas ao vivo com seus bots. Só depois que você concordar, sua voz é enviada a provedores de IA para responder a você: Google Gemini nas chamadas e OpenAI para transformar ditado em texto.';

  @override
  String get macUsageAppleEvents =>
      'A Pergunta rápida lê o título da janela em primeiro plano e a aba atual do navegador, somente quando você pressiona o atalho.';

  @override
  String get nativeNameFileProvider => 'Computadores Casama';

  @override
  String get nativeNameNotifications => 'Notificações do Casama';

  @override
  String get nativeNameSafari => 'Casama para Safari';

  @override
  String get nativeNameAskCasama => 'Perguntar ao Casama';

  @override
  String get nativeComputer => 'Computador';

  @override
  String get nativeSafariSignInIos =>
      'Abra o Casama neste dispositivo -> Configurações -> Entrar em Outro Dispositivo, ou cole um link de login abaixo.';

  @override
  String get nativeSafariSignInMac =>
      'Abra o Casama neste Mac -> Configurações -> Entrar em Outro Dispositivo, ou cole um link de login abaixo.';

  @override
  String get linuxDesktopComment =>
      'Bots que fazem o trabalho, em todas as suas telas';

  @override
  String get linuxDesktopKeywords => 'IA;assistente;agente;bot;chat;';

  @override
  String macMenuAbout(String appName) {
    return 'Sobre o $appName';
  }

  @override
  String get macMenuPreferences => 'Preferências…';

  @override
  String get macMenuServices => 'Serviços';

  @override
  String macMenuHide(String appName) {
    return 'Ocultar $appName';
  }

  @override
  String get macMenuHideOthers => 'Ocultar Outros';

  @override
  String get macMenuShowAll => 'Mostrar Tudo';

  @override
  String macMenuQuit(String appName) {
    return 'Encerrar $appName';
  }

  @override
  String get macMenuEdit => 'Editar';

  @override
  String get macMenuUndo => 'Desfazer';

  @override
  String get macMenuRedo => 'Refazer';

  @override
  String get macMenuCut => 'Cortar';

  @override
  String get macMenuCopy => 'Copiar';

  @override
  String get macMenuPaste => 'Colar';

  @override
  String get macMenuPasteAndMatchStyle => 'Colar com o Mesmo Estilo';

  @override
  String get macMenuDelete => 'Apagar';

  @override
  String get macMenuSelectAll => 'Selecionar Tudo';

  @override
  String get macMenuFind => 'Buscar';

  @override
  String get macMenuFindEllipsis => 'Buscar…';

  @override
  String get macMenuFindAndReplace => 'Buscar e Substituir…';

  @override
  String get macMenuFindNext => 'Buscar Seguinte';

  @override
  String get macMenuFindPrevious => 'Buscar Anterior';

  @override
  String get macMenuUseSelectionForFind => 'Usar Seleção para Buscar';

  @override
  String get macMenuJumpToSelection => 'Ir para Seleção';

  @override
  String get macMenuSpellingAndGrammar => 'Ortografia e Gramática';

  @override
  String get macMenuSpelling => 'Ortografia';

  @override
  String get macMenuShowSpelling => 'Mostrar Ortografia e Gramática';

  @override
  String get macMenuCheckDocumentNow => 'Verificar o Documento Agora';

  @override
  String get macMenuCheckSpellingWhileTyping =>
      'Verificar Ortografia Durante Digitação';

  @override
  String get macMenuCheckGrammar => 'Verificar Gramática com Ortografia';

  @override
  String get macMenuCorrectSpelling => 'Corrigir Ortografia Automaticamente';

  @override
  String get macMenuSubstitutions => 'Substituições';

  @override
  String get macMenuShowSubstitutions => 'Mostrar Substituições';

  @override
  String get macMenuSmartCopyPaste => 'Copiar/Colar Inteligente';

  @override
  String get macMenuSmartQuotes => 'Aspas Inteligentes';

  @override
  String get macMenuSmartDashes => 'Hifens Inteligentes';

  @override
  String get macMenuSmartLinks => 'Links Inteligentes';

  @override
  String get macMenuDataDetectors => 'Detectores de Dados';

  @override
  String get macMenuTextReplacement => 'Substituição de Texto';

  @override
  String get macMenuTransformations => 'Maiúsculas/Minúsculas';

  @override
  String get macMenuMakeUpperCase => 'Tudo em Maiúsculas';

  @override
  String get macMenuMakeLowerCase => 'Tudo em Minúsculas';

  @override
  String get macMenuCapitalize => 'Letras Iniciais em Maiúsculas';

  @override
  String get macMenuSpeech => 'Fala';

  @override
  String get macMenuStartSpeaking => 'Começar a Falar';

  @override
  String get macMenuStopSpeaking => 'Parar de Falar';

  @override
  String get macMenuView => 'Visualizar';

  @override
  String get macMenuEnterFullScreen => 'Entrar em Tela Cheia';

  @override
  String get macMenuWindow => 'Janela';

  @override
  String get macMenuMinimize => 'Minimizar';

  @override
  String get macMenuZoom => 'Zoom';

  @override
  String get macMenuBringAllToFront => 'Trazer Todas para a Frente';

  @override
  String get macMenuHelp => 'Ajuda';

  @override
  String get macMenuCheckForUpdates => 'Buscar Atualizações…';

  @override
  String get macMenuSettings => 'Ajustes…';

  @override
  String get macMenuFile => 'Arquivo';

  @override
  String get macMenuNewChat => 'Novo Chat';

  @override
  String get macMenuNewBot => 'Novo Bot…';

  @override
  String get macMenuQuickAsk => 'Pergunta Rápida';

  @override
  String get macMenuSearch => 'Buscar…';

  @override
  String get macMenuCloseWindow => 'Fechar Janela';

  @override
  String get macMenuGo => 'Ir';

  @override
  String get macMenuBots => 'Bots';

  @override
  String get macMenuInbox => 'Caixa de Entrada';

  @override
  String get macMenuBoard => 'Quadro';

  @override
  String get macMenuComputer => 'Computador';

  @override
  String get macMenuPages => 'Páginas';

  @override
  String get macMenuCasamaHelp => 'Ajuda do Casama';

  @override
  String get macMenuSendFeedback => 'Enviar Feedback…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Rotina';

  @override
  String get siriRoutines => 'Rotinas';

  @override
  String get siriCanvas => 'Quadro';

  @override
  String get siriAutomatic => 'Automático';

  @override
  String get siriAutomaticSubtitle => 'O que um bot definiu mais recentemente';

  @override
  String get siriChooseCanvas => 'Escolher um quadro';

  @override
  String get siriChooseCanvasDescription =>
      'Mostra o que um bot definiu mais recentemente ou um quadro específico.';

  @override
  String get siriChooseBot => 'Escolher um bot';

  @override
  String get siriChooseBotDescription =>
      'Escolha o bot que este widget mostra.';

  @override
  String get siriChooseRoutines => 'Escolher rotinas';

  @override
  String get siriChooseRoutinesDescription =>
      'Mostra as próximas execuções ou até quatro rotinas escolhidas por você.';

  @override
  String get siriOpenCasama => 'Abrir o Casama';

  @override
  String get siriWhere => 'Onde';

  @override
  String get siriTalkToBot => 'Falar com um bot';

  @override
  String get siriTalkToBotDescription =>
      'Inicia uma chamada de voz com o bot escolhido.';

  @override
  String get siriRunRoutine => 'Executar uma rotina';

  @override
  String get siriRunRoutineControlDescription =>
      'Executa a rotina escolhida, sem abrir o Casama.';

  @override
  String get siriCallAction => 'Ação da chamada';

  @override
  String get siriAction => 'Ação';

  @override
  String get siriStopBot => 'Parar o bot';

  @override
  String get siriRun => 'Execução';

  @override
  String get siriAnswerRequest => 'Responder à solicitação de um bot';

  @override
  String get siriRequest => 'Solicitação';

  @override
  String get siriAllow => 'Permitir';

  @override
  String get siriFromWidget => 'De um widget';

  @override
  String get siriRunRoutineNow => 'Executar uma rotina agora';

  @override
  String get siriAcceptSuggestion => 'Fazer o que um bot sugere';

  @override
  String get siriSuggestion => 'Sugestão';

  @override
  String get siriBotStatusDescription =>
      'Onde um bot está e o que está fazendo';

  @override
  String get siriNextRoutineDescription => 'A próxima rotina e quando ela roda';

  @override
  String get siriAskCasama => 'Perguntar ao Casama';

  @override
  String get siriAskVoiceDescription => 'Pergunte algo a um bot por voz';

  @override
  String get siriWhatWaiting => 'O que está aguardando seu OK';

  @override
  String get siriAsk => 'Perguntar';

  @override
  String get siriShortNeedsYou => 'Precisa de você';

  @override
  String get siriOpeningToFinish => 'Abrindo o Casama para concluir.';

  @override
  String get siriName => 'Nome';

  @override
  String get siriTitle => 'Título';

  @override
  String get siriChat => 'Chat';

  @override
  String get siriBotSubtitle =>
      'Um bot no Casama, um assistente de IA com quem você conversa';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Uma rotina que $bot executa no Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Um chat com $bot no Casama';
  }

  @override
  String get siriBotInCasama => 'Bot no Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Rotina · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Chat com $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'rotina';

  @override
  String get siriKeywordChat => 'chat';

  @override
  String get siriAskBot => 'Perguntar a um bot';

  @override
  String get siriAskBotDescription =>
      'Envia uma pergunta para um dos seus bots do Casama (assistentes de IA) em um novo chat e lê a resposta. Sem um bot escolhido, quem responde é o último bot com quem você falou.';

  @override
  String get siriCategoryBots => 'Bots';

  @override
  String get siriAskBotParamDescription =>
      'A qual bot perguntar. Deixe vazio para o último bot com quem você falou.';

  @override
  String get siriQuestion => 'Pergunta';

  @override
  String get siriQuestionDescription =>
      'O que perguntar ao bot, com suas palavras.';

  @override
  String get siriWhatShouldIAsk => 'O que devo perguntar?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Perguntar a $bot $question';
  }

  @override
  String get siriRestOnScreen => 'O restante está na tela.';

  @override
  String get siriRestOnScreenEllipsis => '… O restante está na tela.';

  @override
  String get siriRunRoutineDescription =>
      'Executa agora uma rotina dos seus bots do Casama. O resultado chega no app e como notificação, como quando a rotina roda sozinha.';

  @override
  String get siriRoutineParamDescription => 'Qual rotina executar agora.';

  @override
  String siriSummaryRun(String routine) {
    return 'Executar $routine';
  }

  @override
  String get siriWhatNeedsMe => 'O que precisa de mim';

  @override
  String get siriWhatNeedsMeDescription =>
      'Diz quantas coisas no Casama estão esperando você: um pedido de OK de um bot, um controle manual ou uma sugestão. Responda no app.';

  @override
  String get siriOpenBot => 'Abrir um bot';

  @override
  String get siriOpenBotDescription =>
      'Abre seu chat com um dos seus bots do Casama.';

  @override
  String get siriOpenBotPersonDescription => 'Abre o chat de um bot do Casama.';

  @override
  String get siriOpenChat => 'Abrir um chat';

  @override
  String get siriOpenChatDescription =>
      'Abre um dos seus chats com um bot do Casama.';

  @override
  String get siriOpenRoutine => 'Abrir o bot de uma rotina';

  @override
  String get siriOpenRoutineDescription =>
      'Abre o bot que executa uma das suas rotinas do Casama.';

  @override
  String get siriTalkDescription =>
      'Abre o modo de voz com um dos seus bots do Casama. Disponível no botão de Ação.';

  @override
  String get siriAskGetReply => 'Perguntar a um bot e obter a resposta';

  @override
  String get siriAskGetReplyDescription =>
      'Envia uma pergunta a um bot do Casama e retorna o texto da resposta para encadear no Atalhos.';

  @override
  String get siriGetLastReply => 'Obter a última resposta';

  @override
  String get siriGetLastReplyDescription =>
      'Retorna o texto da resposta mais recente de um chat com bot do Casama.';

  @override
  String get siriStartComputer => 'Iniciar um computador';

  @override
  String get siriStartComputerDescription =>
      'Desperta um computador do Casama após confirmação.';

  @override
  String get siriComputerName => 'Nome do computador';

  @override
  String get siriYourComputer => 'seu computador do Casama';

  @override
  String siriStartConfirm(String computer) {
    return 'Iniciar $computer?';
  }

  @override
  String get siriOpenToStartComputer =>
      'Abra o Casama para iniciar seu computador.';

  @override
  String get siriFocusTitle => 'Definir Filtro de Foco do Casama';

  @override
  String get siriFocusDescription =>
      'Mostra apenas os bots escolhidos e, se quiser, segura avisos proativos enquanto este Foco estiver ativo.';

  @override
  String get siriFocusBots => 'Bots a exibir';

  @override
  String get siriFocusHold => 'Segurar avisos proativos';

  @override
  String get siriFocusShowOne => 'Mostrar 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Mostrar $count bots';
  }

  @override
  String get siriFocusHoldCheckIns => 'Segurar avisos';

  @override
  String get siriFocusAllowCheckIns => 'Permitir avisos';

  @override
  String get siriFocusAllBots => 'Todos os bots';

  @override
  String get siriFocusAllVisible => 'Todos os bots visíveis';

  @override
  String get siriToolAsk => 'Perguntar a um bot do Casama';

  @override
  String get siriToolAskDescription =>
      'Faz uma pergunta a um dos bots do Casama da pessoa e retorna a resposta.';

  @override
  String get siriCategoryAssistants => 'Assistentes';

  @override
  String get siriToolBotDescription => 'A qual bot do Casama perguntar.';

  @override
  String get siriToolQuestionDescription => 'O que perguntar ao bot.';

  @override
  String get siriToolRun => 'Executar uma rotina do Casama';

  @override
  String get siriToolRunDescription =>
      'Executa uma rotina salva do Casama após confirmar com a pessoa.';

  @override
  String get siriCategoryAutomation => 'Automação';

  @override
  String get siriToolRoutineDescription => 'A rotina a executar.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return 'Executar $routine com $bot?';
  }

  @override
  String get siriToolNeeds => 'O que precisa de mim no Casama';

  @override
  String get siriToolNeedsDescription =>
      'Verifica quantas aprovações, controles manuais ou sugestões estão aguardando no Casama.';

  @override
  String get siriOpenToCheck => 'Abra o Casama para ver o que precisa de você.';

  @override
  String get siriToolStop => 'Parar um bot do Casama';

  @override
  String get siriToolStopDescription =>
      'Para um bot que está executando uma tarefa no Casama.';

  @override
  String get siriToolStopBotDescription => 'O bot a parar.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot parado.';
  }

  @override
  String get siriToolCall => 'Ligar para um bot do Casama';

  @override
  String get siriToolCallDescription =>
      'Abre o Casama e inicia uma chamada de voz ao vivo com o bot escolhido.';

  @override
  String get siriCategoryCommunication => 'Comunicação';

  @override
  String get siriToolCallBotDescription => 'O bot para ligar.';

  @override
  String siriCalling(String bot) {
    return 'Ligando para $bot.';
  }

  @override
  String siriBotIn(String app) {
    return 'Um bot em $app';
  }

  @override
  String get siriMe => 'Eu';

  @override
  String get siriABot => 'um bot';

  @override
  String get siriFavorited => 'Favoritado';

  @override
  String siriSentTo(String bot) {
    return 'Enviado para $bot';
  }

  @override
  String get siriMessage => 'Mensagem';

  @override
  String get siriNone => 'Nenhum';

  @override
  String get siriErrorOneBot => 'O Casama envia para um bot por vez. Qual bot?';

  @override
  String get siriErrorTextOnly =>
      'A Siri pode enviar texto para um bot. Adicione arquivos, imagens e lugares no Casama.';

  @override
  String get siriErrorNoBot => 'Não encontrei esse bot no Casama.';

  @override
  String get siriWhatShouldISend => 'O que devo enviar?';

  @override
  String get siriAskCasamaBot => 'Perguntar ao bot do Casama';

  @override
  String siriAskName(String bot) {
    return 'Perguntar a $bot';
  }

  @override
  String get siriAskAboutThis => 'Perguntar ao Casama sobre isto';

  @override
  String siriPhraseAsk(String app) {
    return 'Perguntar ao $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Perguntar a um bot no $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Perguntar para $bot no $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Falar com um bot no $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Falar com $bot no $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Executar uma rotina no $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Executar $routine no $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'O que precisa de mim no $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'O que está pendente no $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Perguntar algo ao $app';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Executar minha rotina $routine no $app';
  }

  @override
  String get siriABotSubject => 'Um bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot precisa do seu OK.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot precisa que você assuma o controle.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot tem uma sugestão.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot precisa de você.';
  }

  @override
  String get siriOneThingNeedsYou => 'Uma coisa precisa de você.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count coisas precisam de você.';
  }

  @override
  String get siriUnlockPhone => 'Desbloqueie seu celular e tente novamente.';

  @override
  String get siriGeminiOff =>
      'O Gemini está desativado para o Casama neste celular (Casama → Configurações → Privacidade).';

  @override
  String get suggestionActionTurnOn => 'Ativar';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Lembrar-me $date';
  }

  @override
  String get suggestionActionPickTime => 'Escolher horário';

  @override
  String get suggestionActionPutAwayAll => 'Guardar todas';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Guardar todas as $count ideias',
      one: 'Guardar $count ideia',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Abrir';

  @override
  String get suggestionActionGotIt => 'Entendi';

  @override
  String get suggestionActionLater => 'Depois';

  @override
  String get suggestionActionSomethingElse => 'Outro motivo';

  @override
  String get suggestionTurnedOn => 'Ativado';

  @override
  String suggestionReminderSet(String date) {
    return 'Lembrete definido para $date';
  }

  @override
  String get suggestionSnoozed => 'Salva para depois';

  @override
  String get suggestionSnoozedExpired => 'Guardada – adiada duas vezes';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ideias guardadas',
      one: '$count ideia guardada',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Desfazer';

  @override
  String get suggestionLaterTomorrow => 'Amanhã de manhã';

  @override
  String get suggestionLaterEvening => 'Hoje à noite';

  @override
  String get suggestionLaterNextWeek => 'Próxima semana';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mais $count ideias aguardando',
      one: 'Mais $count ideia aguardando',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count ideias',
      one: '$name · $count ideia',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count resultados de rotinas hoje',
      one: '$name · $count resultado de rotina hoje',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count atualizações hoje',
      one: '$name · $count atualização hoje',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados de rotinas hoje',
      one: '$count resultado de rotina hoje',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count atualizações hoje',
      one: '$count atualização hoje',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Desde ontem: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados de rotinas',
      one: '$count resultado de rotina',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count atualizações',
      one: '$count atualização',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Ativar';

  @override
  String get notifOpen => 'Abrir';

  @override
  String get notifGotIt => 'Entendi';

  @override
  String get notifRemindMe => 'Lembrar-me';

  @override
  String get notifLater => 'Depois';

  @override
  String get watchTurnOn => 'Ativar';

  @override
  String get watchGotIt => 'Entendi';

  @override
  String get watchRemindMe => 'Lembrar';

  @override
  String get watchLater => 'Depois';

  @override
  String get watchOpen => 'Abrir';

  @override
  String get costModeLabel => 'Visão de custos';

  @override
  String get costModePaid => 'Pago';

  @override
  String get costModeEstimated => 'Estimado';

  @override
  String get costPaid => 'Pago';

  @override
  String get costEstimatedTitle => 'Estimado';

  @override
  String get costMarginListPrices => 'Margem a preços de tabela';

  @override
  String get costFreePlan => 'Plano gratuito';

  @override
  String costFreePlanCalls(String count) {
    return 'Plano gratuito · $count chamadas';
  }

  @override
  String costCapUsage(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String get costShareOfOwnServers => 'Parcela de servidores próprios';

  @override
  String costIncludedCredit(String amount) {
    return '$amount/mês incluído';
  }

  @override
  String costAtListPrices(String amount) {
    return '$amount a preços de tabela';
  }

  @override
  String costEmptyPaidDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nada foi pago nestes $days dias',
      one: 'Nada foi pago neste dia',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyPaidRange => 'Nada foi pago nestes dias';

  @override
  String get costEmptyPaidFiltered => 'Nada foi pago com estes filtros';

  @override
  String costSpokenPaid(String amount) {
    return 'pago $amount';
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
    return 'Gasto nos últimos 30 dias: $paid pago, $charged cobrado, $margin de margem a preços de tabela';
  }

  @override
  String get vendorBillingFree => 'Plano gratuito';

  @override
  String get vendorBillingMetered => 'Por uso';

  @override
  String get vendorBillingFreeHelp =>
      'O uso para no limite e conta como US\$ 0 pago.';

  @override
  String get vendorBillingMeteredHelp => 'O uso é pago pelo custo registrado.';

  @override
  String get vendorIncludedUsd => 'Crédito mensal incluído (USD)';

  @override
  String get vendorIncludedUsdHelp =>
      'O uso até este valor em cada mês civil conta como US\$ 0 pago.';
}
