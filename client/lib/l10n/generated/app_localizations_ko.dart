// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

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
  String get tabTitleChat => '채팅';

  @override
  String get tabTitleCall => '통화';

  @override
  String get tabTitleProject => '프로젝트';

  @override
  String get tabTitleGroupChat => '그룹 채팅';

  @override
  String get loading => '불러오는 중…';

  @override
  String get retry => '다시 시도';

  @override
  String get keepGoing => '계속하기';

  @override
  String get keepGoingMessage => '멈춘 곳부터 계속 진행해 주세요.';

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get edit => '편집';

  @override
  String get close => '닫기';

  @override
  String get create => '만들기';

  @override
  String get continueLabel => '계속';

  @override
  String get somethingWentWrong => '문제가 발생했어요';

  @override
  String get errorViewHint => '앱을 다시 시작하면 해결될 거예요.';

  @override
  String get signInTitle => 'Casama에 로그인';

  @override
  String get signUpTitle => '계정 만들기';

  @override
  String get email => '이메일';

  @override
  String get password => '비밀번호';

  @override
  String get signIn => '로그인';

  @override
  String get signUp => '계정 만들기';

  @override
  String get haveAccount => '계정이 있나요? 로그인';

  @override
  String get needAccount => '처음이신가요? 계정 만들기';

  @override
  String get magicLink => '이메일로 로그인 링크 받기';

  @override
  String get magicLinkSent => '이메일에서 로그인 링크를 확인해 주세요.';

  @override
  String get continueWithGoogle => 'Google로 계속하기';

  @override
  String get continueWithApple => 'Apple로 계속하기';

  @override
  String get continueWithEmail => '이메일로 계속하기';

  @override
  String get moreSignInOptions => '다른 옵션';

  @override
  String get usePasswordInstead => '대신 비밀번호 사용';

  @override
  String get checkInboxTitle => '받은편지함을 확인해 주세요';

  @override
  String checkInboxBody(String email) {
    return '$email 주소로 로그인 링크와 6자리 코드를 보냈어요. 링크를 누르거나 여기에 코드를 입력해 주세요.';
  }

  @override
  String get emailCodeLabel => '6자리 코드';

  @override
  String get resendLink => '다시 보내기';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString초 후 다시 보내기';
  }

  @override
  String get useDifferentEmail => '다른 이메일 사용';

  @override
  String get authWrongPassword =>
      '이메일과 비밀번호가 일치하지 않아요. 다시 시도하거나 이메일 링크로 로그인해 보세요.';

  @override
  String get authEmailNotConfirmed => '먼저 이메일을 인증해 주세요. 보내드린 링크를 열어 보세요.';

  @override
  String get authCodeInvalid => '코드가 틀렸거나 만료되었어요. 가장 최근 이메일을 확인하거나 새로 보내 보세요.';

  @override
  String get authTooManyTries => '시도 횟수가 너무 많아요. 잠시 후 다시 시도해 주세요.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds초',
      one: '1초',
    );
    return '요청이 너무 많아요. $_temp0 후에 다시 시도해 주세요.';
  }

  @override
  String get tooManyRequestsReady => '이제 다시 시도할 수 있어요.';

  @override
  String get authAccountExists => '이미 이 이메일로 가입된 계정이 있어요. 로그인해 주세요.';

  @override
  String get authSignupDisabled => '이 서버에서는 새 회원가입을 받지 않고 있어요.';

  @override
  String get useMagicLinkInstead => '대신 이메일로 링크 받기';

  @override
  String get invalidEmail => '올바른 이메일 주소를 입력해 주세요';

  @override
  String get passwordTooShort => '6자 이상 입력해 주세요';

  @override
  String get signOut => '로그아웃';

  @override
  String get onboardingTitle => '워크스페이스 설정하기';

  @override
  String get createWorkspace => '워크스페이스 만들기';

  @override
  String get workspaceName => '워크스페이스 이름';

  @override
  String get joinWorkspace => '초대 코드로 참여하기';

  @override
  String get inviteCode => '초대 코드';

  @override
  String get join => '참여하기';

  @override
  String get addModelKeyTitle => '모델 키 추가';

  @override
  String get addModelKeyBody =>
      '봇이 내 모델 제공업체 키를 사용해요. 키는 암호화되어 저장되며 다시 표시되지 않아요.';

  @override
  String get provider => '제공업체';

  @override
  String get label => '라벨';

  @override
  String get apiKey => 'API 키';

  @override
  String get baseUrl => '기본 URL';

  @override
  String get testKey => '키 테스트';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return '키 정상 작동 ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return '키 테스트 실패: $error';
  }

  @override
  String get createFirstBot => '첫 번째 봇 만들기';

  @override
  String get botName => '봇 이름';

  @override
  String get model => '모델';

  @override
  String get persona => '지침';

  @override
  String get personaHint =>
      '이 봇이 하는 일과 일하는 방식이에요. 페르소나를 고르면 자동으로 채워지며, 자유롭게 수정할 수 있어요.';

  @override
  String get modelKey => '모델 키';

  @override
  String get navComputer => '컴퓨터';

  @override
  String get navChats => '채팅';

  @override
  String get navTasks => '작업';

  @override
  String get settingsConnectionsSection => '연결';

  @override
  String get advanced => '고급';

  @override
  String get settingsAdvancedSummary => '시크릿, 컴퓨터, 기기';

  @override
  String get bots => '봇';

  @override
  String get newBot => '새 봇';

  @override
  String get noBots => '아직 봇이 없어요';

  @override
  String get botStatusIdle => '대기 중';

  @override
  String get botStatusWorking => '작업 중';

  @override
  String get botStatusWaiting => '응답 기다리는 중';

  @override
  String sidebarMoreWorking(int count) {
    return '$count개 더 작업 중';
  }

  @override
  String get botStatusDisabled => '비활성화됨';

  @override
  String costToday(String cost) {
    return '오늘 $cost';
  }

  @override
  String get newChat => '새 채팅';

  @override
  String get conversations => '대화';

  @override
  String messageHint(String bot) {
    return '$bot에게 메시지 보내기';
  }

  @override
  String messageHintWithApps(String bot) {
    return '$bot에게 메시지 보내기 · @로 앱 멘션';
  }

  @override
  String get mentionSectionBots => '봇';

  @override
  String get mentionSectionApps => '앱';

  @override
  String get mentionSectionAddToBot => '이 봇에 추가';

  @override
  String get mentionSectionConnect => '연결하기';

  @override
  String get mentionSectionStartGroup => '그룹 채팅 시작하기';

  @override
  String get mentionBadgeBot => '봇';

  @override
  String get mentionBadgeApp => '앱';

  @override
  String get mentionAddAction => '추가';

  @override
  String get mentionConnectAction => '연결';

  @override
  String get mentionMaxApps => '메시지당 최대 3개의 앱까지 멘션할 수 있어요.';

  @override
  String get mentionRemovedApp => '제거된 앱';

  @override
  String get send => '보내기';

  @override
  String get stop => '중지';

  @override
  String get thinking => '생각 중…';

  @override
  String get checkingItsWork => '답변 확인 중…';

  @override
  String get mapFullScreen => '전체 화면';

  @override
  String get mapTitle => '지도';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => '중지되었어요.';

  @override
  String emptyChat(String bot) {
    return '$bot에게 인사해 보세요.';
  }

  @override
  String get toolRunning => '실행 중';

  @override
  String get toolFailedLabel => '실패';

  @override
  String get toolOutput => '출력';

  @override
  String get remembered => '기억에 저장했어요';

  @override
  String skillLoaded(String name) {
    return '$name 스킬을 불러왔어요';
  }

  @override
  String checkpointSaved(String label) {
    return '복원 지점 저장됨: $label';
  }

  @override
  String computerState(String state) {
    return '컴퓨터 $state';
  }

  @override
  String get activity => '활동';

  @override
  String get timelineTitle => '실행 타임라인';

  @override
  String get allEvents => '전체';

  @override
  String get filterTools => '도구';

  @override
  String get filterMessages => '메시지';

  @override
  String get filterSystem => '시스템';

  @override
  String get restore => '복원';

  @override
  String get restoreConfirm => '이 복원 지점으로 되돌릴까요? 그 이후 변경된 파일이 대체돼요.';

  @override
  String get restored => '복원 지점을 복원했어요.';

  @override
  String get noRuns => '아직 실행 기록이 없어요.';

  @override
  String get computerTitle => '컴퓨터';

  @override
  String get computerStart => '시작';

  @override
  String get computerSleep => '절전';

  @override
  String get screen => '화면';

  @override
  String get terminal => '터미널';

  @override
  String get files => '파일';

  @override
  String get noScreen => '화면에 아직 아무것도 없어요. 봇이 여는 브라우저 페이지가 여기에 표시돼요.';

  @override
  String get refresh => '새로고침';

  @override
  String get upload => '업로드';

  @override
  String get download => '다운로드';

  @override
  String get emptyFolder => '이 폴더는 비어 있어요';

  @override
  String get noCheckpoints => '위험한 변경 전에 자동으로 저장되므로 언제든 되돌릴 수 있어요.';

  @override
  String get computerAsleep => '컴퓨터가 절전 상태예요. 파일은 안전하게 저장되어 있고 필요할 때 깨어나요.';

  @override
  String get connectTerminal => '연결';

  @override
  String get terminalDisconnected => '연결이 끊겼어요.';

  @override
  String get terminalReconnecting => '서버 재시작 중, 다시 연결하고 있어요…';

  @override
  String get memory => '기억';

  @override
  String get noMemories => '아직 기억하는 내용이 없어요.';

  @override
  String get noMemoriesMatch => '일치하는 기억이 없어요.';

  @override
  String get clearSearch => '지우기';

  @override
  String get addMemory => '기억 추가';

  @override
  String get addMemoryHelp => '봇이 나나 내 업무에 대해 항상 알아두면 좋은 내용이에요.';

  @override
  String get addMemoryFactHint => '예: 회계연도는 4월에 시작해요.';

  @override
  String get addMemoryPreferenceHint => '예: 요약은 글머리 기호 5개 이내로 정리해 줘.';

  @override
  String get memoryAdded => '기억이 추가되었어요';

  @override
  String get pin => '고정';

  @override
  String get unpin => '고정 해제';

  @override
  String get deleteMemoryConfirm => '이 기억을 삭제할까요? 되돌릴 수 없어요.';

  @override
  String get skills => '스킬';

  @override
  String get noSkills => '아직 스킬이 없어요. 스킬은 봇이 필요할 때 불러오는 지침이에요.';

  @override
  String get newSkill => '새 스킬';

  @override
  String get skillName => '이름 (소문자, 하이픈)';

  @override
  String get skillDescription => '한 줄 설명';

  @override
  String get skillBody => '지침 (Markdown)';

  @override
  String get enabled => '활성화됨';

  @override
  String get settings => '설정';

  @override
  String get workspace => '워크스페이스';

  @override
  String get switchWorkspace => '워크스페이스 전환';

  @override
  String get modelKeys => '모델 키';

  @override
  String get moreProviders => '더 많은 제공업체';

  @override
  String get integrationsAdvancedSummary => 'Composio, Pipedream, 사용자 지정 서버';

  @override
  String get toolPermissions => '도구 권한';

  @override
  String get devicesAdvancedSummary => '보관 기간, 비공개 모델, 접근 권한이 있는 봇';

  @override
  String get companionAdvancedSummary => '명령어, 로컬 도구 (MCP), 코딩 에이전트';

  @override
  String get noKeys => '아직 모델 키가 없어요.';

  @override
  String get addKey => '키 추가';

  @override
  String get usage => '사용량';

  @override
  String get language => '언어';

  @override
  String inviteSent(String email) {
    return '$email 주소로 초대를 보냈어요.';
  }

  @override
  String get botProfile => '봇 프로필';

  @override
  String get groupMembers => '이 채팅의 봇들';

  @override
  String get groupMembersHelp => '각 봇은 고유한 기억과 설정을 유지해요. 프로필을 열려면 봇을 누르세요.';

  @override
  String get botAdvancedSummary => '채팅 앱, 링크, 규칙, 지켜보기, 플러그인, 활동';

  @override
  String get botActivityRow => '모든 실행을 단계별로 확인';

  @override
  String get createBotAdvancedSummary => '모델 키 및 모델';

  @override
  String get botProfileSection => '프로필';

  @override
  String get botBrain => '두뇌';

  @override
  String get botAbilities => '능력';

  @override
  String get botSchedule => '일정';

  @override
  String get chatComputerLive => '컴퓨터에서 작업 중';

  @override
  String get autonomy => '자율성';

  @override
  String get autonomyAskAlways => '실행 전 항상 묻기';

  @override
  String get autonomyAskRisky => '위험한 작업만 묻기';

  @override
  String get autonomyAutonomous => '스스로 판단해 실행';

  @override
  String get saved => '저장되었어요.';

  @override
  String get justNow => '방금 전';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString분 전',
      one: '1분 전',
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
      other: '$nString시간 전',
      one: '1시간 전',
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
      other: '$nString일 전',
      one: '어제',
    );
    return '$_temp0';
  }

  @override
  String get aBot => '봇';

  @override
  String get addIntegration => '연동 추가';

  @override
  String get addSecret => '시크릿 추가';

  @override
  String get allowedHosts => '허용된 호스트';

  @override
  String get allowedHostsHelp => '쉼표로 구분 (예: api.github.com)';

  @override
  String get alwaysAllow => '항상 허용';

  @override
  String get approval => '승인';

  @override
  String get approvalAlreadyDecided => '이미 처리되었거나 만료된 요청이에요.';

  @override
  String get approvals => '승인 요청';

  @override
  String get approve => '승인';

  @override
  String get approved => '승인됨';

  @override
  String get authHeaderOptional => 'Authorization 헤더 (선택)';

  @override
  String get authSecretName => '인증 시크릿 이름 (선택)';

  @override
  String get authSecretNameHelp => '‘설정 › 시크릿’의 시크릿 이름으로, Bearer 토큰으로 전송돼요';

  @override
  String get baseUrlOptional => '기본 URL (선택)';

  @override
  String get blankBot => '빈 템플릿';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => '모델 선택';

  @override
  String get searchModels => '모델 검색 또는 모델 ID 입력';

  @override
  String get recommendedModels => '추천 모델';

  @override
  String get allModels => '모든 모델';

  @override
  String useCustomModel(String id) {
    return '“$id” 사용';
  }

  @override
  String modelListFallback(String reason) {
    return '추천 모델을 표시하고 있어요. $reason 원하는 모델 ID를 직접 입력할 수도 있어요.';
  }

  @override
  String get noModelsFound => '일치하는 모델이 없어요.';

  @override
  String get addModelKeyFirst =>
      '먼저 모델 키를 추가해 주세요. 봇이 생각하는 데 사용하며, 암호화되어 저장되고 다시 표시되지 않아요.';

  @override
  String get composioToolkits => '툴킷 (쉼표로 구분, 예: github, gmail)';

  @override
  String get copySecret => '시크릿 복사';

  @override
  String get cronExpression => 'Cron 표현식';

  @override
  String get cronHelp => '분 시 일 월 요일';

  @override
  String get denied => '거절됨';

  @override
  String get deny => '거절';

  @override
  String get everyHour => '매시간';

  @override
  String get expired => '만료됨';

  @override
  String get inbox => '수신함';

  @override
  String get integrationName => '이름';

  @override
  String get integrationNameHelp => '소문자, 숫자, 밑줄(_)';

  @override
  String get integrationType => '유형';

  @override
  String get integrations => '연동';

  @override
  String get kindMcp => 'MCP 서버';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => '모두 읽음으로 표시';

  @override
  String get newRoutine => '새 루틴';

  @override
  String get noIntegrationsForBot => '먼저 ‘설정’에서 연동을 추가한 뒤, 여기에서 이 봇에 켜 주세요.';

  @override
  String get noRoutines => '아직 루틴이 없어요';

  @override
  String get noSecrets => '아직 시크릿이 없어요';

  @override
  String get notifications => '알림';

  @override
  String get openInbox => '수신함 열기';

  @override
  String get pipedreamApps => '앱 (쉼표로 구분)';

  @override
  String get pipedreamClientId => '클라이언트 ID';

  @override
  String get pipedreamClientSecret => '클라이언트 시크릿';

  @override
  String get pipedreamProject => '프로젝트 ID';

  @override
  String get riskHigh => '높은 위험';

  @override
  String get riskLow => '낮은 위험';

  @override
  String get riskMedium => '보통 위험';

  @override
  String get routineGithub => 'GitHub 이벤트 시';

  @override
  String get routineInstructions => '지침';

  @override
  String get routineInstructionsHint => '봇이 매번 어떤 작업을 해야 하나요?';

  @override
  String get routineName => '이름';

  @override
  String get routineEditTitle => '루틴 편집';

  @override
  String get routineEditSubtitle => '할 일과 실행 시점을 변경해요.';

  @override
  String get routineRecentRuns => '최근 실행';

  @override
  String get routineNoRuns => '아직 실행되지 않았어요.';

  @override
  String get routineSaved => '루틴이 저장되었어요';

  @override
  String get routineStarted => '루틴이 시작되었어요';

  @override
  String get routineWebhook => '웹훅 수신 시';

  @override
  String get routines => '루틴';

  @override
  String get routineAdvancedSummary => 'GitHub 및 웹훅 트리거, cron, 시간대';

  @override
  String get routineRepeatDaily => '매일';

  @override
  String get routineRepeatWeekdays => '평일';

  @override
  String get routineRepeatWeekly => '매주';

  @override
  String get routineDay => '요일';

  @override
  String get routineTimeLabel => '시간';

  @override
  String get routineRunsAt => '실행 시각';

  @override
  String routineTimesIn(String timezone) {
    return '시간대 기준: $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return '사용자 지정: $schedule';
  }

  @override
  String get routineOtherTriggers => '기타 트리거';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString분마다',
      one: '매분',
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
      other: '$nString시간마다',
      one: '매시간',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return '매시간 $minute분';
  }

  @override
  String cronDailyAt(String time) {
    return '매일 $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return '평일 $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return '주말 $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return '매월 $day일 $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items 및 $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': '매주 일요일',
      'mon': '매주 월요일',
      'tue': '매주 화요일',
      'wed': '매주 수요일',
      'thu': '매주 목요일',
      'fri': '매주 금요일',
      'sat': '매주 토요일',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': '일요일',
      'mon': '월요일',
      'tue': '화요일',
      'wed': '수요일',
      'thu': '목요일',
      'fri': '금요일',
      'sat': '토요일',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => '봇의 작업을 실시간으로 보기';

  @override
  String get headlessScreenEmpty =>
      '이 컴퓨터는 가볍게 유지하기 위해 브라우저 전용으로 실행돼요. 봇이 웹 페이지를 열면 여기에서 볼 수 있어요. 앱도 보고 조작하려면 데스크톱으로 전환하세요.';

  @override
  String get headlessScreenChecking => '몇 초마다 새 페이지를 확인하고 있어요';

  @override
  String get headlessBrowserOnly => '브라우저 전용';

  @override
  String get switchedToDesktopHere => '데스크톱으로 전환했어요. 준비되면 화면이 여기에 표시돼요.';

  @override
  String get desktopBarLabel => '데스크톱 · 메모리 사용량이 많아요';

  @override
  String get switchToBrowserOnly => '브라우저 전용으로 전환';

  @override
  String get switchingToBrowserOnly => '브라우저 전용으로 전환 중…';

  @override
  String get switchedToBrowserOnly => '브라우저 전용으로 전환했어요. 이제 메모리를 덜 사용해요.';

  @override
  String get runNow => '지금 실행';

  @override
  String get secretName => '이름';

  @override
  String get secretNameHelp => '대문자 (예: GITHUB_TOKEN)';

  @override
  String get secretValue => '값';

  @override
  String get secrets => '시크릿';

  @override
  String get serverUrl => '서버 URL';

  @override
  String get specUrl => 'OpenAPI 스펙 URL';

  @override
  String get startFrom => '페르소나';

  @override
  String get storedEncrypted => '암호화되어 저장되며 다시 표시되지 않아요';

  @override
  String get taskBlocked => '차단됨';

  @override
  String get taskDoing => '진행 중';

  @override
  String get taskDone => '완료';

  @override
  String get taskTodo => '할 일';

  @override
  String get test => '테스트';

  @override
  String get timezone => '시간대';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => '반복';

  @override
  String get triggerWebhook => '웹훅';

  @override
  String get viewRun => '실행 보기';

  @override
  String get webhookCreated => '웹훅 생성됨';

  @override
  String get webhookSecret => '서명 시크릿';

  @override
  String get webhookShownOnce => '지금 서명 시크릿을 복사해 두세요. 한 번만 표시돼요.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return '연결 실패: $error';
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
      other: '연결됨, 도구 $nString개',
      one: '연결됨, 도구 1개',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return '다음 실행: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return '$hosts에만 전송';
  }

  @override
  String requestedAgo(String when) {
    return '$when 요청됨';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return '포함된 루틴: $names.';
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
      other: '도구 $nString개',
      one: '도구 1개',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => '봇이 다시 조작 중이에요';

  @override
  String get botComputer => '컴퓨터';

  @override
  String get botComputerDefault => '전용 컴퓨터가 있으면 그것을, 없으면 팀 컴퓨터를 사용해요';

  @override
  String get botInControl => '봇이 조작 중';

  @override
  String get computerName => '이름';

  @override
  String get computers => '컴퓨터';

  @override
  String get connectingLive => '연결 중…';

  @override
  String get dismiss => '닫기';

  @override
  String get renameTopic => '이름 변경';

  @override
  String get library => '라이브러리';

  @override
  String get navLibrary => '라이브러리';

  @override
  String get librarySearchHint => '라이브러리 검색';

  @override
  String get libraryFilterAll => '전체';

  @override
  String get libraryFilterPages => '사이트 및 게임';

  @override
  String get libraryFilterImages => '이미지';

  @override
  String get libraryFilterVideos => '동영상';

  @override
  String get libraryFilterAudio => '오디오';

  @override
  String get libraryFilterDocuments => '문서';

  @override
  String get libraryFilterFiles => '파일';

  @override
  String get creationKindPage => '페이지';

  @override
  String get creationKindImage => '이미지';

  @override
  String get creationKindVideo => '동영상';

  @override
  String get creationKindAudio => '오디오';

  @override
  String get creationKindDocument => '문서';

  @override
  String get creationKindFile => '파일';

  @override
  String get libraryPinned => '고정됨';

  @override
  String get libraryToday => '오늘';

  @override
  String get libraryYesterday => '어제';

  @override
  String get libraryThisWeek => '이번 주';

  @override
  String get libraryEarlier => '이전';

  @override
  String get videoCantPlay => '이 기기에서는 이 동영상을 재생할 수 없어요.';

  @override
  String get libraryEmptyTitle => '무엇부터 만들어 볼까요?';

  @override
  String get libraryEmptyBody =>
      '하나를 고르면 봇이 바로 시작해요. 봇들이 만든 모든 결과물은 여기에 자동으로 모여요.';

  @override
  String get libraryNoMatch => '일치하는 항목이 없어요.';

  @override
  String get libraryStarterGame => '간단한 게임';

  @override
  String get libraryStarterGamePrompt => '브라우저에서 즐길 수 있는 간단한 게임을 만들어 줘.';

  @override
  String get libraryStarterLogo => '로고';

  @override
  String get libraryStarterLogoPrompt => '내 프로젝트를 위한 로고를 디자인해 줘.';

  @override
  String get libraryStarterSite => '한 페이지 사이트';

  @override
  String get libraryStarterSitePrompt => '내 비즈니스를 위한 한 페이지 웹사이트를 만들어 줘.';

  @override
  String get libraryStarterVideo => '짧은 영상';

  @override
  String get libraryStarterVideoPrompt => '다음 주제로 짧은 영상을 만들어 줘: ';

  @override
  String get libraryStarterCard => '생일 카드';

  @override
  String get libraryStarterCardPrompt => '다음 사람에게 보낼 생일 카드를 만들어 줘: ';

  @override
  String get libraryStarterReport => '보고서';

  @override
  String get libraryStarterReportPrompt => '다음 주제에 대해 조사하고 보고서를 작성해 줘: ';

  @override
  String get libraryStarterElse => '다른 것…';

  @override
  String get creationOpen => '열기';

  @override
  String get creationPlay => '실행';

  @override
  String get creationView => '보기';

  @override
  String get creationChangeIt => '수정하기';

  @override
  String creationChangeDraft(String title) {
    return '“$title” 관련: ';
  }

  @override
  String creationMadeBy(String bot) {
    return '$bot 제작';
  }

  @override
  String creationVersion(int n) {
    return '버전 $n';
  }

  @override
  String creationFromChat(String bot) {
    return '$bot와의 대화에서';
  }

  @override
  String creationFromBot(String bot) {
    return '$bot 제작';
  }

  @override
  String get creationFromHelp => '대화로 이동';

  @override
  String get creationDetails => '세부 정보';

  @override
  String get creationAlongside => '함께 만든 항목';

  @override
  String creationDeleted(String title) {
    return '“$title” 삭제됨';
  }

  @override
  String get showInLibrary => '라이브러리에서 보기';

  @override
  String get pinInLibrary => '라이브러리에 고정';

  @override
  String get libraryItemNotFound => '아직 라이브러리에 없어요. 잠시 후 다시 시도해 주세요.';

  @override
  String creationPinned(String title) {
    return '“$title” 고정됨';
  }

  @override
  String creationUnpinned(String title) {
    return '“$title” 고정 해제됨';
  }

  @override
  String pageCardUpdated(int version) {
    return '업데이트됨 · 버전 $version';
  }

  @override
  String get madeHere => '여기서 만든 항목';

  @override
  String madeHereEmpty(String bot) {
    return '아직 $bot에서 만든 항목이 없어요.';
  }

  @override
  String get madeHereThisChat => '이 채팅에서';

  @override
  String madeHereByBot(String bot) {
    return '$bot 제작';
  }

  @override
  String madeHereElsewhere(String bot) {
    return '$bot의 다른 결과물';
  }

  @override
  String madeHereCount(String count) {
    return '여기서 만든 항목 ($count)';
  }

  @override
  String get sidePanelComputer => '컴퓨터';

  @override
  String get madeForTicket => '이 티켓을 위해 제작됨';

  @override
  String get libraryCantChangePicked => '생성 대상 사용자나 봇 관리자만 변경할 수 있어요.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 항목 삭제됨',
      one: '1개 항목 삭제됨',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 선택됨',
      one: '1개 선택됨',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => '최신순';

  @override
  String get librarySortOpened => '최근 열어본 순';

  @override
  String get librarySortName => '이름순';

  @override
  String get libraryScopeMine => '나를 위해 만든 항목';

  @override
  String get libraryScopeWorkspace => '전체 워크스페이스';

  @override
  String get libraryFilterSort => '정렬 및 필터';

  @override
  String get creationWhoCanSee => '공개 범위';

  @override
  String get libraryTile => '라이브러리';

  @override
  String get libraryTileHelp => '봇이 만든 결과물';

  @override
  String get regenerateReply => '다시 생성';

  @override
  String get deleteMessage => '메시지 삭제';

  @override
  String get deleteMessageTitle => '이 메시지를 삭제할까요?';

  @override
  String get deleteMessageBody => '이 채팅의 모든 참여자에게서 삭제돼요. 주변 메시지는 그대로 남아요.';

  @override
  String get messageDeleted => '메시지가 삭제되었어요';

  @override
  String get findInChat => '채팅에서 찾기';

  @override
  String get findInChatHint => '이 채팅에서 찾기';

  @override
  String findInChatCount(int index, int count) {
    return '$count개 중 $index번째';
  }

  @override
  String get findInChatNone => '일치하는 결과 없음';

  @override
  String get findPrevious => '이전 결과';

  @override
  String get findNext => '다음 결과';

  @override
  String get closeFind => '검색 닫기';

  @override
  String get pinTopic => '고정';

  @override
  String get unpinTopic => '고정 해제';

  @override
  String get inAppAlertReview => '확인하기';

  @override
  String get forBot => '대상 봇';

  @override
  String get handBack => '봇에게 돌려주기';

  @override
  String get handBackNote => '봇에게 남길 메모 (선택)';

  @override
  String get handBackNoteHint => '예: 로그인해 두었으니 계속 진행해 줘';

  @override
  String get live => '실시간';

  @override
  String get liveView => '실시간 보기';

  @override
  String get liveViewHelp => '이 컴퓨터를 실시간으로 보고 필요할 때 직접 조작할 수 있어요.';

  @override
  String get newComputer => '새 컴퓨터';

  @override
  String get newComputerHelp => '전용 컴퓨터는 한 봇에게만 속하며, 파일은 팀 컴퓨터와 분리되어 보관돼요.';

  @override
  String get openLiveView => '실시간 보기 열기';

  @override
  String get liveExpand => '전체 화면';

  @override
  String get liveCopy => '복사';

  @override
  String get liveScreenshot => '스크린샷';

  @override
  String get liveScreenshots => '스크린샷';

  @override
  String get liveScreenshotsHelp =>
      '이 네트워크에서는 실시간 영상을 전송할 수 없어 화면이 약 1초마다 새로고침돼요.';

  @override
  String get liveReconnecting => '다시 연결 중…';

  @override
  String get liveReconnectingHelp =>
      '실시간 영상 연결이 끊겼어요 (서버가 재시작 중일 수 있어요). 다시 연결하는 중이며, 그사이 스크린샷이 표시돼요.';

  @override
  String get liveTryAgain => '다시 시도';

  @override
  String get liveDroppedHelp =>
      '실시간 영상을 다시 연결하지 못해 화면이 약 1초마다 새로고침돼요. ‘다시 시도’를 눌러 보세요.';

  @override
  String get liveMore => '더보기';

  @override
  String get liveSaveScreenshot => '스크린샷 저장';

  @override
  String get liveCopyFromComputer => '컴퓨터에서 복사';

  @override
  String get livePasteToComputer => '컴퓨터에 붙여넣기';

  @override
  String get liveRotateHint => '더 크게 보려면 휴대폰을 가로로 돌려 보세요';

  @override
  String get liveWatching => '보는 중';

  @override
  String get liveCopied => '컴퓨터에서 복사했어요.';

  @override
  String get liveNothingCopied => '복사된 내용이 없어요. 먼저 컴퓨터에서 항목을 선택해 주세요.';

  @override
  String get livePasteEmpty => '클립보드가 비어 있어요.';

  @override
  String get liveMinimize => '측면 패널로 돌아가기';

  @override
  String get liveShownFullScreen => '실시간 보기가 전체 화면으로 열려 있어요.';

  @override
  String get liveStillWatching => '계속 보고 계신가요?';

  @override
  String get liveStillWatchingHelp =>
      '전력을 절약하기 위해 아무도 보지 않을 때는 컴퓨터가 절전 상태로 들어가요.';

  @override
  String get liveKeepWatching => '계속 보기';

  @override
  String get livePausedToSavePower => '전력 절약을 위해 일시 정지됨';

  @override
  String get livePausedToSavePowerHelp =>
      '보는 사람이 없어 컴퓨터를 쉬게 했어요. ‘재개’를 누르면 다시 깨어나요.';

  @override
  String get liveResume => '재개';

  @override
  String get paused => '일시 정지됨';

  @override
  String get pausedUserInControl => '일시 정지됨: 사용자가 화면을 조작 중이에요';

  @override
  String get letBotUseTerminal => '터미널 및 파일 사용 허용';

  @override
  String get screenHandedBack => '화면을 봇에게 돌려줬어요';

  @override
  String get privateComputer => '전용 컴퓨터';

  @override
  String get profileDesktop => '데스크톱';

  @override
  String get profileHeadless => '헤드리스';

  @override
  String get rename => '이름 변경';

  @override
  String get rightClickNextTap => '다음 탭에서 오른쪽 클릭';

  @override
  String get screenshotMode => '스크린샷 모드 (이 네트워크에서는 실시간 영상 사용 불가)';

  @override
  String get showKeyboard => '키보드';

  @override
  String get someoneElseInControl => '다른 사람이 조작 중이에요';

  @override
  String get switchToDesktop => '데스크톱으로 전환';

  @override
  String get switchToHeadless => '헤드리스로 전환';

  @override
  String get switchProfileConfirm =>
      '전환을 위해 컴퓨터가 재시작돼요. 파일은 유지되지만 현재 실행 중인 작업은 모두 중지돼요.';

  @override
  String get switchProfileButton => '전환';

  @override
  String get switchingToDesktop => '데스크톱으로 전환 중…';

  @override
  String get switchingToHeadless => '헤드리스로 전환 중…';

  @override
  String get switchedToDesktop => '데스크톱으로 전환했어요. 화면을 보려면 실시간 보기를 여세요.';

  @override
  String get switchedToHeadless => '헤드리스 모드로 전환했어요. 이제 메모리를 덜 사용해요.';

  @override
  String get takeControl => '직접 조작';

  @override
  String get takeoverCompleted => '봇에게 돌려줌';

  @override
  String get takeoverDismissed => '거절됨';

  @override
  String get takeoverPrivacy =>
      '화면을 직접 조작하는 동안 봇은 일시 정지되며, 입력하거나 보는 내용은 봇에게 전송되지 않아요.';

  @override
  String get liveShellOnTooltip => '직접 조작하는 동안에도 봇이 터미널과 파일을 계속 사용하도록 허용';

  @override
  String get liveShellOffTooltip => '직접 조작하는 동안 봇의 터미널과 파일 사용도 일시 정지';

  @override
  String get liveShellOnNote =>
      '봇이 터미널과 파일은 계속 사용할 수 있어요. 화면을 봇에게 돌려주기 전까지는 화면을 보거나 조작할 수 없어요.';

  @override
  String get liveShellOffNote => '화면을 봇에게 돌려줄 때까지 봇이 완전히 일시 정지돼요.';

  @override
  String get teamComputer => '팀 컴퓨터';

  @override
  String get withDesktop => '데스크톱 포함';

  @override
  String get withDesktopHelp => '실시간으로 볼 수 있는 화면을 추가해요. 메모리를 더 사용해요';

  @override
  String get youAreInControl => '직접 조작 중이에요';

  @override
  String botAsksForHelp(String reason) {
    return '봇의 요청: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot에게 도움이 필요해요';
  }

  @override
  String deleteComputerConfirm(String name) {
    return '$name 컴퓨터를 삭제할까요? 파일, 스냅샷, 복원 지점도 함께 삭제돼요.';
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
    return '$bot의 컴퓨터';
  }

  @override
  String get micPermissionNeeded => '받아쓰기를 사용하려면 마이크 접근을 허용해 주세요.';

  @override
  String get dictationEmpty => '음성이 들리지 않았어요. 다시 시도해 주세요.';

  @override
  String get startCall => '음성 통화 시작';

  @override
  String get stopDictation => '중지하고 텍스트로 변환';

  @override
  String get dictate => '받아쓰기';

  @override
  String get dictateOnDevice => '이 기기로 받아쓰기';

  @override
  String get stopListening => '듣기 중지';

  @override
  String get dictationRetry => '다시 시도';

  @override
  String get dictationSayAgain => '다시 말해 주세요';

  @override
  String get dictationFailed => '텍스트로 변환하지 못했어요.';

  @override
  String get dictationFailedUseDevice =>
      '텍스트로 변환하지 못했어요. 다시 말씀하시면 이 기기에서 인식할게요.';

  @override
  String get dictationNoServiceUseDevice =>
      '이 워크스페이스에 받아쓰기가 설정되어 있지 않아요. 대신 이 기기에서 들을 수 있어요.';

  @override
  String get dictationDeviceFailed => '기기의 받아쓰기 작동이 멈춰 Casama 마이크로 다시 전환했어요.';

  @override
  String get dictationDevicePermission => '이 기기로 받아쓰려면 음성 인식 권한을 허용해 주세요.';

  @override
  String get readAloud => '소리 내어 읽기';

  @override
  String get callConnecting => '연결 중…';

  @override
  String get callLive => '통화 중';

  @override
  String get callEnded => '통화 종료됨';

  @override
  String get callEndedIdle => '2분 동안 소리가 없어 통화를 종료했어요.';

  @override
  String get callFailed => '통화를 연결할 수 없어요.';

  @override
  String get callListening => '듣는 중';

  @override
  String get callSpeaking => '말하는 중';

  @override
  String get callWorking => '작업 중';

  @override
  String get callMutedState => '음소거됨';

  @override
  String get callCaptions => '자막';

  @override
  String get callSpeaker => '스피커';

  @override
  String get callEarpiece => '수화기';

  @override
  String get callBluetooth => '블루투스';

  @override
  String get callHeadphones => '헤드폰';

  @override
  String get callAudioOutput => '통화 오디오 출력';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': '프로필 사진 변경 중',
      'memory_search': '기억 검색 중',
      'memory_write': '기억에 저장 중',
      'memory': '기억 업데이트 중',
      'knowledge_search': '지식 찾아보는 중',
      'web_search': '웹 검색 중',
      'web': '웹 페이지 읽는 중',
      'browser_open': '웹사이트 여는 중',
      'browser_click': '페이지 클릭 중',
      'browser_type': '페이지에 입력 중',
      'browser_press': '키 누르는 중',
      'browser_scroll': '페이지 스크롤 중',
      'browser_look': '페이지 확인 중',
      'desktop_click': '화면 클릭 중',
      'desktop_type': '입력 중',
      'desktop_press': '키 누르는 중',
      'desktop_launch': '앱 여는 중',
      'desktop_look': '화면 확인 중',
      'shell': '컴퓨터에서 작업 중',
      'files_read': '파일 읽는 중',
      'files_write': '파일 쓰는 중',
      'files_list': '파일 목록 확인 중',
      'files_search': '파일 검색 중',
      'files_from_chat': '채팅에서 파일 가져오는 중',
      'http': '서비스에 연결 중',
      'data_search': '데이터 찾는 중',
      'data_call': '데이터 가져오는 중',
      'skills_load': '스킬 준비 중',
      'skills_create': '새 스킬 익히는 중',
      'skills_update': '스킬 개선 중',
      'checkpoint': '체크포인트 저장 중',
      'computer_restart': '컴퓨터 재시작 중',
      'takeover': '직접 조작 요청 중',
      'delegate': '도우미에게 요청 중',
      'routines_list': '루틴 확인 중',
      'routines_create': '루틴 설정 중',
      'routines_update': '루틴 업데이트 중',
      'routines_delete': '루틴 삭제 중',
      'watchers_create': '지켜보기 설정 중',
      'watchers_list': '지켜보기 확인 중',
      'watchers_delete': '지켜보기 삭제 중',
      'tasks_list': '작업 확인 중',
      'tasks_create': '작업 추가 중',
      'tasks': '작업 업데이트 중',
      'notify_user': '알림 보내는 중',
      'usage_report': '사용량 확인 중',
      'device_read': '기기 데이터 읽는 중',
      'device_access': '기기 접근 권한 요청 중',
      'pages_publish': '페이지 게시 중',
      'pages': '페이지 업데이트 중',
      'media': '이미지 만드는 중',
      'media_video': '동영상 만드는 중',
      'bots_create': '새 봇 만드는 중',
      'bots_update': '봇 업데이트 중',
      'bots_list': '봇 확인 중',
      'bots_archive': '봇 보관 중',
      'channel_send': '메시지 보내는 중',
      'links_ask': '연락처의 어시스턴트에게 묻는 중',
      'logins_list': '저장된 로그인 확인 중',
      'replay_run': '저장된 단계 실행 중',
      'replay_save': '단계 저장 중',
      'setup_apply': '설정 제안 중',
      'sidebar_organize': '사이드바 정리 중',
      'suggestions_add': '제안 추가 중',
      'teach_save_draft': '스킬 초안 저장 중',
      'welcome_name': '이름 고르는 중',
      'secrets_request': '시크릿 요청 중',
      'pages_list': '페이지 확인 중',
      'pages_share': '페이지 공개 범위 변경 중',
      'projects_create': '프로젝트 시작 중',
      'projects_status': '프로젝트 확인 중',
      'projects_update': '프로젝트 업데이트 중',
      'projects': '프로젝트 계획 중',
      'payments': '결제 승인 요청 중',
      'voice_call': '업체에 전화 거는 중',
      'voice_call_user': '전화 거는 중',
      'tools_load': '준비 중',
      'ui_show': '내용 표시 중',
      'start_task': '채팅에서 작업 시작 중',
      'adult_sites_turn_on': '성인 사이트 허용 요청 중',
      'connections_attach': '앱 사용 시작 중',
      'other': '작업 중',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': '프로필 사진 변경 완료',
      'memory_search': '기억 검색 완료',
      'memory_write': '기억에 저장 완료',
      'memory': '기억 업데이트 완료',
      'knowledge_search': '지식 확인 완료',
      'web_search': '웹 검색 완료',
      'web': '웹 페이지 읽기 완료',
      'browser_open': '웹사이트 열기 완료',
      'browser_click': '페이지 클릭 완료',
      'browser_type': '페이지 입력 완료',
      'browser_press': '키 입력 완료',
      'browser_scroll': '페이지 스크롤 완료',
      'browser_look': '페이지 확인 완료',
      'desktop_click': '화면 클릭 완료',
      'desktop_type': '입력 완료',
      'desktop_press': '키 입력 완료',
      'desktop_launch': '앱 열기 완료',
      'desktop_look': '화면 확인 완료',
      'shell': '컴퓨터 작업 완료',
      'files_read': '파일 읽기 완료',
      'files_write': '파일 쓰기 완료',
      'files_list': '파일 목록 확인 완료',
      'files_search': '파일 검색 완료',
      'files_from_chat': '채팅에서 파일 가져오기 완료',
      'http': '서비스 연결 완료',
      'data_search': '데이터 검색 완료',
      'data_call': '데이터 가져오기 완료',
      'skills_load': '스킬 사용 완료',
      'skills_create': '새 스킬 학습 완료',
      'skills_update': '스킬 개선 완료',
      'checkpoint': '체크포인트 저장 완료',
      'computer_restart': '컴퓨터 재시작 완료',
      'takeover': '직접 조작 요청 완료',
      'delegate': '도우미 요청 완료',
      'routines_list': '루틴 확인 완료',
      'routines_create': '루틴 설정 완료',
      'routines_update': '루틴 업데이트 완료',
      'routines_delete': '루틴 삭제 완료',
      'watchers_create': '지켜보기 설정 완료',
      'watchers_list': '지켜보기 확인 완료',
      'watchers_delete': '지켜보기 삭제 완료',
      'tasks_list': '작업 확인 완료',
      'tasks_create': '작업 추가 완료',
      'tasks': '작업 업데이트 완료',
      'notify_user': '알림 전송 완료',
      'usage_report': '사용량 확인 완료',
      'device_read': '기기 데이터 읽기 완료',
      'device_access': '기기 접근 권한 요청 완료',
      'pages_publish': '페이지 게시 완료',
      'pages': '페이지 업데이트 완료',
      'media': '이미지 제작 완료',
      'media_video': '동영상 제작 완료',
      'bots_create': '새 봇 생성 완료',
      'bots_update': '봇 업데이트 완료',
      'bots_list': '봇 확인 완료',
      'bots_archive': '봇 보관 완료',
      'channel_send': '메시지 전송 완료',
      'links_ask': '연락처의 어시스턴트에게 문의 완료',
      'logins_list': '저장된 로그인 확인 완료',
      'replay_run': '저장된 단계 실행 완료',
      'replay_save': '단계 저장 완료',
      'setup_apply': '설정 제안 완료',
      'sidebar_organize': '사이드바 정리 완료',
      'suggestions_add': '제안 추가 완료',
      'teach_save_draft': '스킬 초안 저장 완료',
      'welcome_name': '이름 선택 완료',
      'secrets_request': '시크릿 요청 완료',
      'pages_list': '페이지 확인 완료',
      'pages_share': '페이지 공개 범위 변경 완료',
      'projects_create': '프로젝트 시작 완료',
      'projects_status': '프로젝트 확인 완료',
      'projects_update': '프로젝트 업데이트 완료',
      'projects': '프로젝트 계획 완료',
      'payments': '결제 승인 요청 완료',
      'voice_call': '업체 통화 완료',
      'voice_call_user': '전화 통화 완료',
      'tools_load': '준비 완료',
      'ui_show': '내용 표시 완료',
      'start_task': '채팅에서 시작 완료',
      'adult_sites_turn_on': '성인 사이트 허용 요청 완료',
      'connections_attach': '앱 사용 시작 완료',
      'other': '완료',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return '$app 사용 중';
  }

  @override
  String toolUsedApp(String app) {
    return '$app 사용 완료';
  }

  @override
  String get toolDetails => '세부 정보';

  @override
  String approvalAsking(String bot) {
    return '$bot의 사전 확인 요청';
  }

  @override
  String get approvalLookClosely => '허용하기 전에 내용을 꼼꼼히 확인해 주세요';

  @override
  String approvalAttachConnection(String app) {
    return '이 워크스페이스에 이미 연결된 $app 사용 시작';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return '$bot 봇이 묻지 않고 이 작업을 하도록 하기';
  }

  @override
  String get pageShareToPublic => '링크가 있는 사람은 누구나 열 수 있어요';

  @override
  String get pageShareToWorkspace => '이 워크스페이스의 모든 사람이 열 수 있어요';

  @override
  String get pageShareToPrivate => '나만 열 수 있어요';

  @override
  String approvalAllowedLine(String what) {
    return '허용됨: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return '거절됨: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return '시간 내 응답 없음: $what';
  }

  @override
  String get callToolFailed => '작동하지 않았어요';

  @override
  String get callToolNeedsOk => '진행하려면 승인이 필요해요';

  @override
  String get callToolAllow => '허용';

  @override
  String get callToolNotNow => '나중에';

  @override
  String get callToolAllowed => '허용했어요. 결과는 채팅에 표시돼요';

  @override
  String get callToolDeclined => '나중에 하기로 했어요';

  @override
  String get callToolBackground => '아직 작업 중이에요. 결과는 채팅에 표시돼요';

  @override
  String get callToolInChat => '결과는 채팅에 표시돼요';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString초';
  }

  @override
  String get callNeedsKeyTitle => '통화에는 Google AI 키가 필요해요';

  @override
  String get callNeedsKeyBody =>
      '실시간 통화는 Google의 Gemini Live로 작동하므로 이 워크스페이스에 Google AI 키가 필요해요. 이 키는 통화에만 사용되며, 소리 내어 읽기, 받아쓰기, 이미지 및 동영상은 OpenRouter에서 실행돼요. Google은 AI Studio에서 무료 키를 제공하므로, 거기서 키를 만들어 ‘모델 키’에 추가하면 바로 통화할 수 있어요. 워크스페이스 소유자와 관리자만 키를 추가할 수 있어요.';

  @override
  String get callAddKey => 'Google AI 키 추가';

  @override
  String get callGetFreeKey => 'Google에서 무료 키 받기';

  @override
  String get callMicUnmute => '마이크 켜기';

  @override
  String get videoUnmute => '소리 켜기';

  @override
  String get callMicMute => '마이크 끄기';

  @override
  String get videoMute => '소리 끄기';

  @override
  String get hangUp => '통화 종료';

  @override
  String callWith(String bot) {
    return '$bot와의 통화';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return '$from 통화를 끝내고 $to에게 통화를 걸까요?';
  }

  @override
  String get callSwitchBody => '한 번에 하나의 통화만 할 수 있어요. 현재 통화는 먼저 채팅에 저장돼요.';

  @override
  String get callSwitchConfirm => '종료하고 통화하기';

  @override
  String get callVoiceConsentTitle => '음성 데이터가 Google로 전송돼요';

  @override
  String get callVoiceConsentBody =>
      '통화 중에는 Casama가 내 음성과 말한 내용을 Google Gemini로 전송하고, Google Gemini가 이를 듣고 봇의 답장을 음성으로 말해요. 통화 내용은 OpenRouter를 통해 봇이 사용하는 AI 모델로도 전달돼요. 동의하기 전까지는 아무것도 전송되지 않으며, ‘설정 › 개인정보 보호’에서 언제든 중지할 수 있어요.';

  @override
  String get callVoiceConsentAgree => '동의하고 통화하기';

  @override
  String get callVoiceConsentNotNow => '나중에';

  @override
  String get callEndedLost => '연결이 너무 오래 끊겨 통화가 종료되었어요.';

  @override
  String get callMinimize => '최소화';

  @override
  String get callEndCall => '통화 종료';

  @override
  String get callEndAndAnswer => '종료하고 받기';

  @override
  String get callReconnecting => '다시 연결 중…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분',
      one: '1분',
      zero: '1분 미만',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return '$bot 통화 중, $time, 누르면 돌아가요';
  }

  @override
  String callReturnBar(String bot) {
    return '$bot 통화 중, 누르면 돌아가요';
  }

  @override
  String get callOpen => '통화 열기';

  @override
  String get callOnHold => '대기 중';

  @override
  String get callNotificationLive => '통화 중';

  @override
  String get callNotificationMuted => '음소거됨';

  @override
  String get callNotificationChannel => '통화';

  @override
  String callTabTitle(String time) {
    return '통화 중 · $time';
  }

  @override
  String get callMenuShow => '통화 보기';

  @override
  String get callJobWorking => '작업 중';

  @override
  String callJobStrip(String task) {
    return '작업 중: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return '확인 필요: $task';
  }

  @override
  String get callTileWatching => '실시간 보기';

  @override
  String get callTileDone => '완료';

  @override
  String get callTileNeedsYou => '확인 필요';

  @override
  String callTileLabel(String state) {
    return '봇의 화면, $state. 크게 보려면 누르세요';
  }

  @override
  String get callTileHide => '화면 숨기기';

  @override
  String get screenCardLive => '실시간';

  @override
  String screenCardLabel(String bot, String state) {
    return '$bot의 화면, $state';
  }

  @override
  String get screenCardOpen => '전체 화면 열기';

  @override
  String get screenCardYouHave => '화면을 조작 중이에요';

  @override
  String screenCardHeldBy(String name) {
    return '$name 님이 화면을 조작 중이에요';
  }

  @override
  String get screenCardMore => '더 많은 옵션';

  @override
  String screenCardIntro(String bot) {
    return '$bot의 화면이에요. 누르면 크게 보고, 드래그해서 옮길 수 있어요.';
  }

  @override
  String get screenCardHideForNow => '지금은 숨기기';

  @override
  String get screenCardDontShow => '자동으로 표시 안 함';

  @override
  String get screenCardTurnedOff => '화면 카드가 꺼져 있어요. 설정에서 다시 켜 주세요.';

  @override
  String get screenCardOfferOff => '화면 카드를 자주 숨기시나요? 자동으로 뜨지 않게 끌 수 있어요.';

  @override
  String get screenCardTurnOff => '끄기';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot의 화면에 확인이 필요해요';
  }

  @override
  String callRecapTitle(String length) {
    return '통화 · $length';
  }

  @override
  String get callRecapStarted => '통화 중 시작됨';

  @override
  String get callRecapTaskDone => '완료';

  @override
  String get callRecapTaskFailed => '완료되지 않음';

  @override
  String get callRecapTaskStopped => '중지됨';

  @override
  String get callRecapTaskRunning => '아직 작업 중';

  @override
  String get callRecapOpenRun => '작업 내용 보기';

  @override
  String get summarizeCalls => '통화 요약';

  @override
  String get summarizeCallsHelp =>
      '통화가 끝날 때마다 무슨 내용이었는지와 다음 할 일을 카드로 정리해 줘요. 봇의 소형 모델을 조금 사용해요.';

  @override
  String callCardVoice(String length) {
    return '음성 통화 · $length';
  }

  @override
  String callCardPhone(String length) {
    return '전화 통화 · $length';
  }

  @override
  String callCardDropped(String length) {
    return '통화 끊김 · $length';
  }

  @override
  String callCardMissed(String name) {
    return '$name의 부재중 통화';
  }

  @override
  String callCardLive(String name) {
    return '통화 중: $name';
  }

  @override
  String get callCardLiveElsewhere => '다른 기기에서 통화 중';

  @override
  String get callCardReturn => '통화로 돌아가기';

  @override
  String callCardBotHungUp(String name) {
    return '$name 측에서 통화를 종료했어요';
  }

  @override
  String get callCardEndedQuiet => '조용한 상태가 이어져 통화를 종료했어요';

  @override
  String get callCardEndedLimit => '통화 시간 한도에 도달해 종료되었어요';

  @override
  String get callCardWritingSummary => '요약 작성 중…';

  @override
  String callCardSummaryBy(String name) {
    return '$name의 요약';
  }

  @override
  String get callCardNextSteps => '다음 단계';

  @override
  String get callCardDoIt => '실행하기';

  @override
  String get callCardDismissStep => '닫기';

  @override
  String get callCardStepStarted => '시작됨';

  @override
  String get callCardStepFailed => '시작할 수 없었어요. 다시 시도해 주세요.';

  @override
  String get callCardDoneOnCall => '통화 중 완료됨';

  @override
  String callCardMore(int count) {
    return '$count개 더보기';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '대화 기록 · $count회',
      one: '대화 기록 · 1회',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => '대화 기록';

  @override
  String get callCardSearchTranscript => '대화 기록 검색';

  @override
  String get callCardNoMatches => '일치하는 결과 없음';

  @override
  String get callCardYou => '나';

  @override
  String get callCardCallBack => '다시 통화하기';

  @override
  String get callCardCopy => '복사';

  @override
  String get callCardCopied => '복사됨';

  @override
  String get callCardShare => '공유';

  @override
  String get callCardMoreActions => '더보기';

  @override
  String get callCardDelete => '통화 삭제';

  @override
  String get callCardDeleteTitle => '이 통화를 삭제할까요?';

  @override
  String get callCardDeleteBody =>
      '카드와 대화 기록이 이 채팅에서 삭제돼요. 통화 중 시작된 작업의 결과물은 그대로 남아요.';

  @override
  String get callCardDeleted => '통화가 삭제되었어요';

  @override
  String get callCardDeleteFailed => '통화를 삭제할 수 없었어요';

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

    return '$msString ms 만에 응답 시작';
  }

  @override
  String get voiceSettings => '음성';

  @override
  String get voiceSettingsHelp => '읽기 음성과 통화 중 봇이 사용할 도구';

  @override
  String get callTools => '통화 중 도구';

  @override
  String get callToolsHelp =>
      '통화에는 이미 기억, 웹 검색, 나에게 보내는 알림, 루틴, 티켓 기능이 포함되어 있고, 큰 작업은 채팅으로 넘겨 처리해요. 통화 중 실시간으로 쓸 연결된 앱 도구를 추가해 보세요. 도구를 추가할 때마다 통화 비용이 조금씩 올라가요.';

  @override
  String get callToolsNone =>
      '이 봇에 켜진 연결된 앱이 아직 없어요. ‘연동’에서 앱을 켠 뒤 여기에서 도구를 선택하세요.';

  @override
  String get openIntegrations => '연동 열기';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '연결된 앱 도구 $countString개 추가됨',
      one: '연결된 앱 도구 1개 추가됨',
      zero: '기본 제공 음성 도구만 사용',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => '음성 ID (선택)';

  @override
  String get voiceIdHelp =>
      'Gemini 음성 이름(예: Kore 또는 Puck)을 입력하세요. 비워 두면 Kore가 사용돼요';

  @override
  String get useThisComputer => '이 컴퓨터를 봇에 사용';

  @override
  String get companionDesktopOnly =>
      '데스크톱 앱(macOS, Windows, Linux)만 봇 컴퓨터로 사용할 수 있어요.';

  @override
  String get companionIntro =>
      '선택한 봇이 이 컴퓨터에서 작업하도록 허용해요. 명령을 실행하고, 지정한 폴더의 파일을 편집하고, 브라우저와 앱을 사용할 수 있어요. 모든 작업은 화면에 표시되며 언제든 중지할 수 있어요. 각 기능은 직접 승인하기 전까지 꺼져 있어요.';

  @override
  String get thisComputer => '이 컴퓨터';

  @override
  String get companionOnline => '켜짐: 허용된 봇이 이 컴퓨터를 사용할 수 있어요';

  @override
  String get companionError => 'Casama에 연결할 수 없어 다시 시도 중이에요';

  @override
  String get companionOff => '꺼짐';

  @override
  String get companionCapabilities => '봇이 할 수 있는 작업';

  @override
  String get companionCapabilitiesHelp =>
      '각 항목을 승인해 주세요. 봇의 자율성 설정과 관계없이 위험한 작업은 항상 먼저 물어봐요.';

  @override
  String get capShell => '명령 실행 (공유 폴더 내)';

  @override
  String get capFiles => '공유 폴더의 파일 읽기 및 편집';

  @override
  String get capBrowser => '브라우저 사용 (사용자 브라우저와 분리된 전용 브라우저)';

  @override
  String get capDesktop => '데스크톱 앱 사용';

  @override
  String get sharedFolders => '공유 폴더';

  @override
  String get sharedFoldersHelp => '봇은 이 폴더들에만 접근할 수 있어요.';

  @override
  String get addFolder => '폴더 추가';

  @override
  String get botsAllowed => '허용된 봇';

  @override
  String get botsAllowedHelp =>
      '허용된 봇은 이 컴퓨터에서도 작업할 수 있어요. 각 봇은 전용 컴퓨터를 따로 유지하며, 작업에 이 컴퓨터가 필요할 때만 이 컴퓨터를 사용해요.';

  @override
  String get worksOnTitle => '작업 위치';

  @override
  String worksOnSubtitle(String bot) {
    return '$bot의 명령 실행, 파일 사용, 웹 탐색이 이루어지는 곳이에요.';
  }

  @override
  String get worksOnAuto => '자동';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot의 선택에 맡겨요. 작업에 내 컴퓨터가 꼭 필요한 경우에만 내 컴퓨터를 쓰고, 평소에는 전용 컴퓨터를 사용해요.';
  }

  @override
  String get worksOnBot => '봇의 컴퓨터만 사용';

  @override
  String get worksOnBotHelp => '내 컴퓨터는 전혀 사용하지 않아요.';

  @override
  String get worksOnMine => '내 컴퓨터만 사용';

  @override
  String get worksOnMineHelp => '모든 작업이 내 컴퓨터에서 실행되므로 컴퓨터가 켜져 있어야 해요.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return '모든 작업이 $computer에서 실행되므로 켜져 있어야 해요.';
  }

  @override
  String worksOnLine(String mode) {
    return '작업 위치: $mode';
  }

  @override
  String placesTitle(String bot) {
    return '$bot의 작업 위치';
  }

  @override
  String get placesSubtitle =>
      '여기서 볼 컴퓨터를 선택하세요. 봇이 실제로 작업하는 위치는 ‘작업 위치’ 설정에 따라 결정돼요.';

  @override
  String placesBarLabel(String computer, String mode) {
    return '표시 중: $computer · 작업 위치: $mode · 변경';
  }

  @override
  String get placeYoursOnline => '내 컴퓨터 · 온라인';

  @override
  String get placeYoursOffline => '내 컴퓨터 · 오프라인';

  @override
  String get placeTeamComputer => '팀 컴퓨터';

  @override
  String placeBotsOwn(String bot) {
    return '$bot의 전용 컴퓨터';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$computer에서 $action';
  }

  @override
  String get botYourComputer => '내 컴퓨터';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone => '내 컴퓨터에서 허용되지 않음';

  @override
  String botYourComputerHow(String bot) {
    return '$bot의 작업을 내 컴퓨터에서도 하게 하려면 해당 컴퓨터에서 Casama를 열고 ‘설정 → 이 컴퓨터를 봇에 사용 → 허용된 봇’에서 켜 주세요. 어느 쪽이든 전용 컴퓨터는 그대로 유지돼요.';
  }

  @override
  String get routineWhere => '작업 위치';

  @override
  String get routineWhereHelp => '이 루틴이 명령을 실행하고 파일을 사용하는 위치예요.';

  @override
  String get routineWhereBot => '봇의 컴퓨터';

  @override
  String get routineWhereBotHelp => '내 컴퓨터가 켜져 있는지 여부와 관계없이 실행돼요.';

  @override
  String get routineWhereMine => '켜져 있을 때 내 컴퓨터';

  @override
  String get routineWhereMineHelp =>
      '내 컴퓨터의 파일과 앱을 다루는 작업용이에요. 컴퓨터가 꺼져 있었으면 실행 기록에 표시돼요.';

  @override
  String get computerBotsAllowed => '허용된 봇';

  @override
  String get unpairComputer => '이 컴퓨터 사용 중지 및 연결 해제';

  @override
  String botActingHere(String bot, String action) {
    return '이 컴퓨터에서 $bot 작업 중: $action';
  }

  @override
  String get quickAsk => '빠른 질문';

  @override
  String get quickAskHint => '봇에게 무엇이든 물어보세요…';

  @override
  String get bot => '봇';

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
  String get cloudModelsTitle => '클라우드 모델';

  @override
  String get cloudModelsHelp => '모든 Cloud 서버에 몇 초 안에 적용돼요.';

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
  String get connectionsTitle => '앱 연결';

  @override
  String get connectionsServerComposio => 'Casama의 Composio 계정';

  @override
  String get connectionsServerComposioHelp =>
      '자체 로그인이 없는 앱도 이 서버의 Composio 계정을 통해 클릭 한 번으로 연결할 수 있어요.';

  @override
  String get connectionsOwnAccounts => '사용자 본인 계정';

  @override
  String get connectionsOwnAccountsHelp =>
      '각 사용자가 본인의 Composio, Pipedream 또는 Zapier 계정을 사용해요.';

  @override
  String get connectionsNoComposioKey =>
      'Casama 계정을 사용하려면 이 서버에 COMPOSIO_API_KEY를 추가하세요.';

  @override
  String get connectionsGoogleTitle => 'Google 앱';

  @override
  String get connectionsGoogleComposio => 'Composio를 통해 연결';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, 캘린더, 드라이브 등을 바로 사용할 수 있어요.';

  @override
  String get connectionsGoogleDirect => 'Google 자체 서버';

  @override
  String get connectionsGoogleDirectHelp =>
      'Google Workspace Developer Preview 등록이 필요해요.';

  @override
  String get notInstanceOwner => '인스턴스 소유자만 관리자 콘솔을 열 수 있어요.';

  @override
  String get runs24h => '실행 (24시간)';

  @override
  String get failedRuns24h => '실패한 실행 (24시간)';

  @override
  String get cost24h => '지출 (24시간)';

  @override
  String get computersRunning => '실행 중인 컴퓨터';

  @override
  String get devicesOnline => '온라인 상태인 개인 컴퓨터';

  @override
  String get editQuotas => '할당량 편집';

  @override
  String get maxBots => '봇 수 한도';

  @override
  String get monthlyUsd => '월간 지출 한도 (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest 버전을 사용할 수 있어요 (현재 버전: $current)';
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
      other: '워크스페이스 $nString개',
      one: '워크스페이스 1개',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return '$when 로그인됨';
  }

  @override
  String quotasFor(String name) {
    return '$name 할당량';
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
      other: '멤버 $nString명',
      one: '멤버 1명',
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
      other: '봇 $nString개',
      one: '봇 1개',
    );
    return '$_temp0';
  }

  @override
  String cost30d(String usd) {
    return '30일 동안 $usd';
  }

  @override
  String get connectingToServer => 'Casama에 연결 중…';

  @override
  String get cannotReachServer => 'Casama 서버에 연결할 수 없어요';

  @override
  String get connectionFailed =>
      'Casama 서버에 연결하지 못했어요. 연결 상태를 확인하고 다시 시도해 주세요.';

  @override
  String get serverNotResponding => 'Casama 서버가 지금 응답하지 않아요. 잠시 후 다시 시도해 주세요.';

  @override
  String cannotReachServerHelp(String url) {
    return '연결 상태를 확인하거나 $url 서버가 실행 중인지 확인해 주세요.';
  }

  @override
  String get serverUnreachableBody =>
      '온라인 상태인지 확인해 주세요. 온라인 상태라면 서버가 재시작 중일 수 있으니 계속 다시 시도할게요.';

  @override
  String retryingIn(int seconds) {
    return '$seconds초 후 다시 시도';
  }

  @override
  String get retryingNow => '시도 중…';

  @override
  String get upgradeTitle => '플랜 업그레이드';

  @override
  String get notNow => '나중에';

  @override
  String get seePlans => '플랜 보기';

  @override
  String get billing => '결제';

  @override
  String get billingOffSelfHosted =>
      '이 서버에서는 결제가 꺼져 있어요. 자체 라이선스로 실행되며, 1인 개인 사용은 무료이고 팀은 Business 라이선스를 사용해요.';

  @override
  String get restorePurchases => '구매 복원';

  @override
  String get restoreStarted => '구매 내역 확인 중…';

  @override
  String get plans => '플랜';

  @override
  String get currentPlan => '현재 플랜';

  @override
  String subscribeFor(String price) {
    return '$price에 구독하기';
  }

  @override
  String get subscribeOnWeb => '웹에서 구독하기';

  @override
  String get credits => '크레딧';

  @override
  String get creditHistory => '크레딧 내역';

  @override
  String get creditReasonPurchase => '크레딧 구매';

  @override
  String get creditReasonGrant => '크레딧 지급';

  @override
  String get creditReasonRefund => '환불';

  @override
  String get creditReasonAdjustment => '조정';

  @override
  String get creditReasonExpire => '크레딧 만료';

  @override
  String limitBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $countString개',
      one: '봇 1개',
    );
    return '$_temp0';
  }

  @override
  String get limitBotsUnlimited => '무제한 봇';

  @override
  String get unlimitedValue => '무제한';

  @override
  String trialDaysFree(int n) {
    return '$n일 무료';
  }

  @override
  String get extraPeople => '추가 인원';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '플랜에 포함된 $seats명 외에는 1인당 월 $price의 요금이 추가돼요.';
  }

  @override
  String get extraPeopleSaved => '추가 인원이 업데이트되었어요';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '월간 컴퓨터 사용 시간 $hoursString시간';
  }

  @override
  String limitCredits(String amount) {
    return '월간 크레딧 $amount';
  }

  @override
  String get viaWeb => '웹에서 결제 중';

  @override
  String get viaAppStore => 'App Store에서 결제 중';

  @override
  String get viaGooglePlay => 'Google Play에서 결제 중';

  @override
  String get yourPlan => '내 플랜';

  @override
  String planEndsOn(String date) {
    return '$date에 종료';
  }

  @override
  String planRenewsOn(String date) {
    return '$date에 갱신';
  }

  @override
  String creditsBalance(String amount) {
    return '크레딧: $amount';
  }

  @override
  String get manageSubscription => '구독 관리';

  @override
  String get compViaCasama => 'Casama 무료 제공';

  @override
  String compFreeUntil(String date) {
    return '$date까지 무료';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return '테스트 결제예요. 테스터 한도가 적용돼요: 월간 크레딧 $credits, 일일 $daily.';
  }

  @override
  String compKeepPlan(String plan) {
    return '$plan 플랜 유지';
  }

  @override
  String get haveGiftCode => '선물 코드가 있나요?';

  @override
  String get redeemCodeTitle => '선물 코드 사용하기';

  @override
  String get redeemCodeIntro => '받으신 코드를 입력하세요. 선택한 워크스페이스에 별도 결제 없이 플랜이 적용돼요.';

  @override
  String get redeemCodeLabel => '선물 코드';

  @override
  String get redeemCodeChecking => '확인 중…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$plan $months개월 무료',
      one: '$plan 1개월 무료',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid => '존재하지 않거나 더 이상 사용할 수 없는 코드예요.';

  @override
  String get redeemCodeWorkspace => '워크스페이스';

  @override
  String get redeemCodeSubmit => '사용하기';

  @override
  String get redeemCodeFinePrint =>
      '선물 코드는 1인당 한 번만 사용할 수 있어요. 기간이 끝나면 다른 플랜을 선택하지 않는 한 워크스페이스는 무료 플랜으로 전환돼요.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan 플랜이 적용되었어요';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return '이 워크스페이스에서 $date까지 $plan 플랜을 무료로 이용할 수 있어요. 어떤 기기에서든 Casama를 열어 사용해 보세요.';
  }

  @override
  String get redeemCodeOpenBilling => '결제 열기';

  @override
  String get redeemCodeNoWorkspace =>
      '선물 코드는 내가 소유한 워크스페이스에만 적용할 수 있어요. 먼저 워크스페이스를 만든 뒤 링크를 다시 열어 주세요.';

  @override
  String get redeemCodeUnavailable => '이 앱 버전에서는 사용할 수 없어요.';

  @override
  String usageComputerHours(String hours) {
    return '클라우드 컴퓨터: $hours시간';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return '실시간 보기: $minutes분';
  }

  @override
  String get thisMonth => '이번 달';

  @override
  String get noBillableUsage => '아직 청구 가능한 사용량이 없어요.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      '자체 호스팅 Casama를 이 워크스페이스에 연결해요. 공개 주소와 알림은 무료이며, 클라우드 컴퓨터와 모델 크레딧은 여기로 청구돼요.';

  @override
  String get linkCloudNewKey => '새 Casama Link 키';

  @override
  String get linkCloudKeyCreated => '키 생성됨';

  @override
  String get linkCloudKeyOnce =>
      '지금 복사해 두세요. 한 번만 표시돼요. 서버의 CASAMA_CLOUD_URL에 설정하면 돼요.';

  @override
  String get copy => '복사';

  @override
  String get revoke => '폐기';

  @override
  String get instanceName => '서버 이름';

  @override
  String get server => '서버';

  @override
  String get serverAddress => '서버 주소';

  @override
  String get serverAddressInvalid =>
      'https://casama.example.com 또는 http://192.168.1.20:8080 같은 서버 주소를 입력하세요.';

  @override
  String get connect => '연결';

  @override
  String get changeServer => '다른 서버 사용';

  @override
  String serverIs(String host) {
    return '서버: $host';
  }

  @override
  String get continueWithSso => 'SSO로 계속하기';

  @override
  String get workEmail => '회사 이메일';

  @override
  String get privacy => '개인정보 보호';

  @override
  String get exportMyData => '내 데이터 내보내기';

  @override
  String get exportMyDataHelp => '봇, 채팅, 실행 기록, 기억, 설정이 포함돼요. 시크릿은 제외돼요.';

  @override
  String exportReady(String kb) {
    return '내보내기 준비 완료 ($kb KB)';
  }

  @override
  String get runHistoryRetention => '실행 기록 보관 기간';

  @override
  String get runHistoryRetentionHelp => '오래된 실행 이벤트는 자동으로 삭제돼요.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString일',
      one: '1일',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => '내 계정 삭제';

  @override
  String get deleteAccountHelp => '짧은 유예 기간 후 데이터가 영구 삭제돼요.';

  @override
  String get deleteAccountQuestion => '계정을 삭제할까요?';

  @override
  String deleteAccountConfirm(String email) {
    return '나만 소유자인 워크스페이스는 봇과 컴퓨터를 포함해 계정과 함께 삭제돼요. 웹에서 구입한 플랜은 자동으로 해지돼요. App Store나 Google Play에서 구입한 플랜은 해지되지 않아요. 해당 스토어에서 해지해 주세요. 확인하려면 $email 주소를 입력하세요.';
  }

  @override
  String get accountDeleted => '계정 삭제 예약됨';

  @override
  String accountDeletedBody(String date) {
    return '로그아웃되었어요. 데이터는 $date에 삭제될 예정이에요.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString단계',
      one: '1단계',
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
      other: '이전 $countString단계 보기',
      one: '이전 1단계 보기',
    );
    return '$_temp0';
  }

  @override
  String get copied => '복사됨';

  @override
  String get jumpToLatest => '최신 메시지로 이동';

  @override
  String get chatViewFullTable => '전체 표 보기';

  @override
  String get chatTableTitle => '표';

  @override
  String chatEmptySubtitle(String bot) {
    return '$bot에게 무엇이든 물어보거나, 아래 아이디어를 눌러 시작해 보세요.';
  }

  @override
  String get suggestPlanDay => '오늘 하루 계획 세우는 것 도와줘';

  @override
  String get suggestWriteMessage => '메시지 작성하는 것 도와줘';

  @override
  String get suggestExplain => '자료를 찾아서 쉽게 설명해 줘';

  @override
  String get suggestCapabilities => '어떤 일을 도와줄 수 있나요?';

  @override
  String connectedAppSummary(String app) {
    return '$app 연결됨';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama가 아직 확인하지 않은 서버예요. $host 호스트를 신뢰하는 경우에만 연결하세요.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama가 아직 확인하지 않은 서버예요. 운영자를 신뢰하는 경우에만 연결하세요.';

  @override
  String get serverAddressLabel => '서버 주소';

  @override
  String get serverAddressHelp =>
      '서버 주소를 붙여넣으세요. 주소에 키가 포함되어 있어도 암호화되어 저장되며 채팅에는 남지 않아요.';

  @override
  String get serverChecking => '서버 확인 중…';

  @override
  String serverSignInOn(String host) {
    return '$host에서 로그인하게 돼요.';
  }

  @override
  String get serverUseKey => '대신 키 사용';

  @override
  String get serverUseSignIn => '대신 로그인';

  @override
  String serverSignInUnavailable(String name) {
    return '$name 서버에서는 이 Casama 서버를 통한 브라우저 로그인을 지원하지 않아요. 키를 사용해 주세요.';
  }

  @override
  String get serverNoSignIn => '이 서버는 로그인 없이 작동해요.';

  @override
  String get serverHeaderLabel => '헤더 이름 (선택)';

  @override
  String get serverToolsTitle => '사용할 수 있는 도구';

  @override
  String get serverToolsHelp =>
      '원하지 않는 도구는 끌 수 있어요. 위험한 단계 앞에서는 봇이 여전히 먼저 물어봐요.';

  @override
  String addedInChatBy(String bot) {
    return '$bot의 채팅에서 추가됨';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name 서버는 내 컴퓨터에서 실행돼요. 추가하려면 해당 컴퓨터에서 Casama를 열고 ‘이 컴퓨터를 봇에 사용’을 켜 주세요.';
  }

  @override
  String get connectAppsTitle => '앱 연결하기';

  @override
  String get moreApps => '더보기';

  @override
  String addAppTile(String app) {
    return '이 봇에 $app 추가';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$bot에 $app 추가됨';
  }

  @override
  String get connectAppsHint => '내가 이미 쓰고 있는 도구에서 봇이 내용을 읽고 행동할 수 있게 해 주세요.';

  @override
  String connectAppTile(String app) {
    return '$app 연결';
  }

  @override
  String get showComputer => '컴퓨터 보기';

  @override
  String get hideComputer => '컴퓨터 숨기기';

  @override
  String get moreActions => '더보기';

  @override
  String get noConversations => '아직 대화가 없어요';

  @override
  String get untitledChat => '새 대화';

  @override
  String get listening => '듣는 중…';

  @override
  String get orLabel => '또는';

  @override
  String get notificationsPrimerBubble => '중요한 알림을 놓치지 마세요!';

  @override
  String get notificationsPrimerTitle => '알림 켜기';

  @override
  String get notificationsPrimerBody => '봇이 사용자의 결정이 필요하거나 작업이 완료되면 바로 알려드려요.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome에서 이 사이트의 알림을 차단하고 있어요. 주소창의 자물쇠 아이콘에서 알림을 허용한 뒤 ‘켜기’를 다시 눌러 주세요.';

  @override
  String get notificationsTurnOn => '켜기';

  @override
  String get autoUpdates => '자동 업데이트';

  @override
  String get autoUpdatesHelp => '앱을 종료할 때 새 버전을 설치해요.';

  @override
  String get upToDate => 'Casama가 최신 버전이에요';

  @override
  String get noReleasesToCheck => '이 컴퓨터용으로 게시된 릴리스가 아직 없어 현재 버전과 비교할 수 없어요.';

  @override
  String updateReady(String version) {
    return 'Casama $version 버전을 사용할 수 있어요';
  }

  @override
  String appVersion(String version) {
    return '버전 $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Casama $version의 새로운 기능';
  }

  @override
  String get whatsNewGotIt => '확인';

  @override
  String get whatsNewSubtitle => '이전 업데이트 이후 달라진 점이에요.';

  @override
  String get whatsNew010Calls => '봇에게 통화를 걸어 대화해 보세요. 자막과 함께 소리 내어 답해 줘요.';

  @override
  String get whatsNew010Looks =>
      'Casama를 나답게 꾸며 보세요. ‘설정 → 화면 모드’에서 테마, 색상 테마, 글꼴, 배경화면을 바꿀 수 있고 갤러리에서 더 많이 찾을 수 있어요.';

  @override
  String get whatsNew010AboutYou =>
      '‘설정 → 내 정보’에서 봇에게 나를 한 번만 알려주세요. 호칭과 원하는 답변 방식을 설정할 수 있어요.';

  @override
  String get whatsNew010SignIn => '패스키, Apple, Google 또는 이메일 코드로 로그인하세요.';

  @override
  String get openAtLogin => '로그인 시 열기';

  @override
  String get openAtLoginHelp => '빠른 질문 단축키를 바로 사용할 수 있게 대기해요.';

  @override
  String get signInTagline => '앱을 닫아도 계속 일하는 AI 팀원.';

  @override
  String get signInTagline2 => '나의 AI 크루를 만나보세요.';

  @override
  String get signInTagline3 => '말만 하는 AI가 아니라, 실제로 일을 끝내는 AI.';

  @override
  String get signInTagline4 => '실행하기 전에 먼저 물어보는 유능한 팀원.';

  @override
  String get signInTagline5 => '일을 맡겨 두세요. 돌아오면 끝나 있을 거예요.';

  @override
  String get noBotsHelp => '봇은 전용 컴퓨터를 가진 팀원이에요. 대화를 시작하려면 봇을 하나 만들어 보세요.';

  @override
  String get newBotSubtitle => '전용 컴퓨터와 기억을 가진 팀원이에요.';

  @override
  String get appearance => '화면 모드';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI 또는 호환되는 다른 제공업체';

  @override
  String get signOutConfirm => '언제든 다시 로그인할 수 있어요. 봇들은 계속 작업해요.';

  @override
  String get roleOwner => '소유자';

  @override
  String get roleAdmin => '관리자';

  @override
  String get roleMember => '멤버';

  @override
  String get themeLight => '라이트';

  @override
  String get themeSystem => '시스템';

  @override
  String get themeDark => '다크';

  @override
  String get createWorkspaceBody => '워크스페이스에는 봇들과 컴퓨터, 그리고 함께 일하는 사람들이 모여 있어요.';

  @override
  String get workspaceNameHint => '우리 팀';

  @override
  String get orJoinWithCode => '또는 초대 코드로 참여하기';

  @override
  String get getOpenRouterKey => 'OpenRouter 키 받기';

  @override
  String get createFirstBotBody => '이름과 모델을 정해 주세요. 둘 다 나중에 바꿀 수 있어요.';

  @override
  String stepOf(int step, int total) {
    return '$total단계 중 $step단계';
  }

  @override
  String get providerHintOpenRouter => '추천: 채팅, 이미지, 동영상, 음성';

  @override
  String get providerHintGoogle => '실시간 통화 전용';

  @override
  String get providerHintCompatible => 'OpenAI 호환 API 모두 지원';

  @override
  String get providerHintSearch => '웹 검색';

  @override
  String get noRoutinesHelp =>
      '루틴은 정해진 시간에 한 번, 반복 일정에 따라, 또는 웹훅이 도착했을 때 봇이 스스로 처리하는 작업이에요.';

  @override
  String get routineOnce => '한 번만';

  @override
  String lastRun(String when) {
    return '마지막 실행: $when';
  }

  @override
  String get routineOff => '꺼짐';

  @override
  String get routineEnds => '종료';

  @override
  String get routineEndsNever => '종료 안 함';

  @override
  String get routineEndsOnDate => '특정 날짜에';

  @override
  String get routineEndsAfterRuns => '실행 횟수 후';

  @override
  String get routineEndDate => '마지막 날';

  @override
  String get routineRunCountLabel => '실행 횟수';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n회 실행',
      one: '1회 실행',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return '$when 종료';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n회 실행 남음',
      one: '1회 실행 남음',
      zero: '남은 실행 없음',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => '종료 시점';

  @override
  String get routineEndTitle => '종료 시점';

  @override
  String get routineEndSubtitle =>
      '그 시점이 되면 자동으로 꺼져요. 새로운 실행 횟수는 지금부터 다시 계산해요.';

  @override
  String deleteRoutineTitle(String name) {
    return '“$name” 루틴을 삭제할까요?';
  }

  @override
  String get deleteRoutineBody => '더 이상 실행되지 않아요. 이미 대화에 올린 결과물은 그대로 남아요.';

  @override
  String get triggerOnce => '한 번만';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString분 후';
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
      other: '$nString시간 후',
      one: '1시간 후',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return '내일 $time';
  }

  @override
  String get integrationNeedsName => '최소 한 글자 이상의 이름을 입력해 주세요.';

  @override
  String integrationNeedsField(String field) {
    return '저장하려면 $field 항목을 입력해 주세요.';
  }

  @override
  String integrationSavedAs(String name) {
    return '$name 이름으로 저장됨';
  }

  @override
  String get integrationUrlInvalid => 'https://로 시작하는 전체 주소를 입력해 주세요';

  @override
  String get openFile => '열기';

  @override
  String get saveFile => '저장';

  @override
  String get shareFile => '공유';

  @override
  String savedFile(String name) {
    return '$name 저장됨';
  }

  @override
  String noAppToOpen(String name) {
    return '이 기기에 $name 파일을 열 수 있는 앱이 없어요. 대신 저장해 보세요.';
  }

  @override
  String get previewUnavailable => '이 파일 형식은 미리보기를 지원하지 않아요. 보려면 열거나 저장하세요.';

  @override
  String get openInSystemPlayer => '동영상 플레이어로 열기';

  @override
  String get playMedia => '재생';

  @override
  String get fullScreen => '전체 화면';

  @override
  String get exitFullScreen => '전체 화면 나가기';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count페이지',
      one: '1페이지',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => '브라우저에서 열기';

  @override
  String get convertingToPdf => '미리보기 준비 중…';

  @override
  String tableFirstRows(int count) {
    return '처음 $count행 표시 중';
  }

  @override
  String get imageCouldNotLoad => '이 이미지를 불러올 수 없어요';

  @override
  String get mediaKindImage => '이미지';

  @override
  String get mediaKindVideo => '동영상';

  @override
  String get mediaKindAudio => '오디오';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => '파일 열기';

  @override
  String get attach => '첨부';

  @override
  String get attachFiles => '파일';

  @override
  String get attachPhotos => '사진 보관함';

  @override
  String get attachCamera => '사진 찍기';

  @override
  String get attachScan => '문서 스캔';

  @override
  String get scanFailed => '문서를 스캔하지 못했어요. 다시 시도해 주세요.';

  @override
  String get dropToAttach => '여기에 파일을 놓아 첨부';

  @override
  String uploadFailed(String name) {
    return '$name 업로드 실패';
  }

  @override
  String attachFailed(String name, String reason) {
    return '$name 첨부 실패: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return '$name 첨부 실패';
  }

  @override
  String get sendWithoutIt => '첨부 없이 보내기';

  @override
  String get sendWithoutThem => '첨부 없이 보내기';

  @override
  String get removeAttachment => '제거';

  @override
  String get editPhoto => '사진 편집';

  @override
  String get retryUpload => '다시 시도';

  @override
  String get uploadingAttachments => '업로드 중…';

  @override
  String get notSent => '전송되지 않음';

  @override
  String get deleteChat => '채팅 삭제';

  @override
  String get deleteChatTitle => '이 채팅을 삭제할까요?';

  @override
  String deleteChatBody(String bot) {
    return '이 채팅에 접근할 수 있는 모든 사람에게서 메시지가 삭제돼요. 여기서 $bot의 작업으로 만든 결과물은 라이브러리에 남고, 사용량 기록과 봇의 기억에 저장된 내용도 유지돼요.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '여기서 만든 항목 $count개도 함께 삭제',
      one: '여기서 만든 항목 1개도 함께 삭제',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp => '끄기: 라이브러리에 그대로 남아요.';

  @override
  String get chatDeleted => '채팅이 삭제되었어요';

  @override
  String get deleteAllChats => '모든 채팅 삭제';

  @override
  String get deleteAllChatsRow => '깨끗한 대화 기록으로 새로 시작해요. 기억은 그대로 남아요.';

  @override
  String deleteAllChatsTitle(String bot) {
    return '$bot 채팅을 모두 삭제할까요?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return '삭제할 수 있는 $bot 채팅은 메시지, 사진, 파일과 함께 모두 삭제돼요. 그룹 채팅은 그대로 남고, 사용량 기록과 $bot의 기억도 유지돼요.';
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
      other: '채팅 $nString개를 삭제했어요.',
      one: '채팅 1개를 삭제했어요.',
      zero: '삭제할 채팅이 없어요.',
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
      other: '봇이 아직 작업 중인 채팅 $nString개는 유지되었어요.',
      one: '봇이 아직 작업 중인 채팅 1개는 유지되었어요.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '이 채팅에 봇 $n개가 있어요. 각 봇은 고유한 기억과 설정을 유지해요.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention => '@와 이름을 입력해 특정 봇에게 직접 질문해 보세요.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone을 입력하면 $lead에게 작업을 계획하고 각 봇에게 역할을 나누어 달라고 요청해요.';
  }

  @override
  String groupTipNoMention(String lead) {
    return '멘션이 없으면 마지막으로 말한 봇이 답해요 (처음에는 $lead).';
  }

  @override
  String get messageNotSent => '파일이 업로드되지 않아 메시지가 전송되지 않았어요. 입력창에 다시 담아 두었어요.';

  @override
  String get chatSendsWhenDone => '이 답장이 끝나면 전송돼요';

  @override
  String get noComputerForFiles => '이 봇에는 파일을 저장할 컴퓨터가 없어요.';

  @override
  String fileTooLarge(String name) {
    return '$name 파일 크기가 25 MB를 초과해 첨부할 수 없어요.';
  }

  @override
  String get secretsHelp =>
      '봇이 요청을 보낼 때 시크릿 이름으로 참조해요. 허용된 호스트로만 전송되며 모델은 값을 볼 수 없어요.';

  @override
  String deleteSecretTitle(String name) {
    return '$name 시크릿을 삭제할까요?';
  }

  @override
  String get deleteSecretBody => '이 시크릿을 사용하는 봇들이 해당 서비스에 접근할 수 없게 돼요.';

  @override
  String get hide => '숨기기';

  @override
  String get show => '표시';

  @override
  String get deleteMemoryTitle => '이 기억을 삭제할까요?';

  @override
  String get noMemoriesHelp =>
      '대화를 나누는 동안 봇이 사실, 선호도, 지난 작업 요약 등 중요한 내용을 기억해요.';

  @override
  String get memoryHelp =>
      '고정된 기억은 항상 봇의 맥락에 포함돼요. 잘못된 내용은 수정할 수 있고, 삭제한 기억은 영구히 사라져요.';

  @override
  String get memoryFact => '사실';

  @override
  String get memoryPreference => '선호도';

  @override
  String get memorySummary => '요약';

  @override
  String get memoryEpisode => '에피소드';

  @override
  String get pinned => '고정됨';

  @override
  String get editMemory => '기억 편집';

  @override
  String get editMemoryHelp => '다음에 관련 작업이 있을 때 봇이 이 내용을 참고해요.';

  @override
  String get modelKeysIntro =>
      '봇이 내 모델 제공업체 키로 생각해요. 키는 암호화되어 저장되며 다시 표시되지 않아요.';

  @override
  String get casamaCloudKeyHint => '크레딧에서 차감됨';

  @override
  String get casamaCloudIncluded => '포함됨';

  @override
  String get casamaCloudModelLocked => 'Casama가 이 모델을 선택해요.';

  @override
  String get serverVoiceSetUp =>
      '이 서버에서 음성을 제공하므로 키를 추가할 필요가 없어요. 워크스페이스의 자체 API 키가 우선 사용돼요.';

  @override
  String modelKeysFor(String workspace) {
    return '키는 하나의 워크스페이스에 속해요. $workspace 워크스페이스의 키예요.';
  }

  @override
  String get yourKeys => '내 API 키';

  @override
  String get keyWorking => '정상 작동';

  @override
  String get keyFailing => '오류';

  @override
  String get keyUntested => '테스트 안 됨';

  @override
  String get skillsHelp => '스킬은 보고서 작성 스타일처럼 작업에 필요할 때 봇이 불러오는 지침 묶음이에요.';

  @override
  String get skillsForAllBots => '모든 봇';

  @override
  String skillsOnlyForBot(String bot) {
    return '$bot 전용';
  }

  @override
  String get skillsRemovedBot => '제거된 봇';

  @override
  String deleteSkillTitle(String name) {
    return '“$name” 스킬을 삭제할까요?';
  }

  @override
  String get editSkill => '스킬 편집';

  @override
  String get deleteSkill => '스킬 삭제';

  @override
  String get skillDescriptionHelp => '봇이 이 설명을 읽고 스킬을 언제 적용할지 결정해요.';

  @override
  String get skillBodyHint => '# 단계\n1. …';

  @override
  String get computersHelp =>
      '각 봇은 모두가 함께 쓰는 팀 컴퓨터나 전용 컴퓨터에서 작업해요. 대화가 바뀌어도 파일은 그 컴퓨터에 그대로 남아요.';

  @override
  String get computersEmptyTitle => '아직 컴퓨터가 없어요';

  @override
  String get thisDevice => '이 기기';

  @override
  String get personalComputerConnected => '연결됨';

  @override
  String get personalComputerOffline => '오프라인';

  @override
  String computerCpus(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'CPU $n개',
      one: 'CPU 1개',
    );
    return '$_temp0';
  }

  @override
  String computerMemory(Object size) {
    return 'RAM $size';
  }

  @override
  String computerDisk(Object size) {
    return '디스크 $size';
  }

  @override
  String computerLastUsed(Object when) {
    return '마지막 사용: $when';
  }

  @override
  String computerLastSeen(Object when) {
    return '마지막 접속: $when';
  }

  @override
  String get computerSaved => '저장됨';

  @override
  String get computerSavedHelp => '중지된 동안에도 파일은 유지돼요';

  @override
  String computerCanUse(Object list) {
    return '봇이 사용할 수 있는 기능: $list';
  }

  @override
  String get computerCanUseNothing => '봇이 아직 사용할 수 없어요';

  @override
  String get computerCapShell => '터미널';

  @override
  String get computerCapFiles => '파일';

  @override
  String get computerCapBrowser => '브라우저';

  @override
  String get computerCapDesktop => '화면';

  @override
  String get computerCapMcp => '로컬 도구';

  @override
  String get computerCapMessages => '메시지';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name 기기가 오프라인 상태예요. 해당 기기에서 Casama를 열고 ‘이 컴퓨터를 봇에 사용’을 켜 주세요. 내 컴퓨터는 플랜의 컴퓨터 사용 시간을 소모하지 않아요.';
  }

  @override
  String get yourComputerOffline => '내 컴퓨터가 오프라인 상태예요';

  @override
  String get howToFix => '해결 방법';

  @override
  String get computerHoursUsedTitle => '컴퓨터 사용 시간 소진';

  @override
  String get personalScreenNote => '내 컴퓨터이므로 실시간 보기 대신 몇 초마다 새 스크린샷이 표시돼요.';

  @override
  String get renameComputer => '컴퓨터 이름 변경';

  @override
  String deleteComputerTitle(String name) {
    return '$name 컴퓨터를 삭제할까요?';
  }

  @override
  String get privacyIntro => '채팅, 기억, 파일은 내 소유예요. 언제든 내보내거나 계정을 삭제할 수 있어요.';

  @override
  String get yourData => '내 데이터';

  @override
  String get shareAnalytics => '사용 데이터 공유';

  @override
  String get shareAnalyticsHelp => '사용량 및 충돌 보고서만 전송되며, 메시지나 파일은 절대 포함되지 않아요.';

  @override
  String get measureAds => '광고 성과 측정 돕기';

  @override
  String get measureAdsHelp =>
      'Casama 광고를 본 사람이 가입하거나 구독할 때 Casama가 Meta에 알릴 수 있게 해요. Casama는 광고를 절대 표시하지 않아요.';

  @override
  String get measureAdsNeedsUsageData => '이 기능을 사용하려면 ‘사용 데이터 공유’를 켜 주세요.';

  @override
  String get trackingTile => '추적 허용';

  @override
  String get trackingAllowed =>
      '허용됨. 이 기기에서 Meta의 SDK가 실행되며, Casama 광고를 본 후 가입하거나 구독할 때 Casama가 Meta에 알릴 수 있어요. 기기의 ‘설정’ 앱에서 변경할 수 있어요.';

  @override
  String get trackingNotAllowed =>
      '허용 안 됨. 이 기기에서 Meta로 전송되는 정보는 없어요. 기기의 ‘설정’ 앱에서 변경할 수 있어요.';

  @override
  String get trackingNotAsked =>
      'Casama가 아직 요청하지 않았어요. 허용하기 전까지는 이 기기에서 Meta로 아무것도 전송되지 않아요.';

  @override
  String get trackingOpenSettings => '설정 열기';

  @override
  String get workspaceAnalytics => '이 워크스페이스의 사용 데이터';

  @override
  String get workspaceAnalyticsHelp =>
      '이 워크스페이스의 사용량 데이터예요. 충돌 보고서는 계속 켜져 있어요.';

  @override
  String get dangerZone => '위험 구역';

  @override
  String get quotasHelp => '제한을 두지 않으려면 비워 두세요.';

  @override
  String get serviceOff => '꺼짐';

  @override
  String get serviceDown => '중단됨';

  @override
  String get serviceOk => '정상';

  @override
  String get sendInvite => '초대 보내기';

  @override
  String get thinking0 => '모델';

  @override
  String get saveChanges => '변경 사항 저장';

  @override
  String get autonomyAskAlwaysHelp => '무언가를 바꾸는 모든 작업 전에 먼저 확인해요.';

  @override
  String get autonomyAskRiskyHelp =>
      '스스로 작업하지만 파일 삭제나 결제처럼 위험한 작업 앞에서는 먼저 물어봐요.';

  @override
  String get autonomyAutonomousHelp => '묻지 않고 바로 실행해요. 신뢰하는 루틴에 적합해요.';

  @override
  String get usageSubtitle => '이번 달 모델 지출';

  @override
  String get skillsRowHelp => '작업에 필요할 때 봇이 불러오는 지침';

  @override
  String get integrationsRowHelp => 'MCP 서버 및 연결된 앱';

  @override
  String get secretsRowHelp => '토큰과 비밀번호 (허용한 곳에만 전송)';

  @override
  String get computersRowHelp => '팀 컴퓨터 및 전용 컴퓨터';

  @override
  String get companionRowHelp => '봇이 이 기기의 앱과 파일을 사용하도록 허용';

  @override
  String get privacyRowHelp => '데이터 내보내기 또는 계정 삭제';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => '아직 연동이 없어요';

  @override
  String get integrationsHelp =>
      '연동은 MCP 서버, OpenAPI 소스, Composio, Pipedream 등을 통해 봇에게 더 많은 도구를 제공해요. 각 도구에는 연동 이름이 붙어요.';

  @override
  String get botIntegrationsHelp => '이 봇이 사용할 수 있는 연동을 켜세요. 도구는 다음 실행부터 적용돼요.';

  @override
  String get openSettings => '설정 열기';

  @override
  String get noRunsHelp =>
      '이 봇이 채팅, 루틴, 웹훅을 통해 일할 때마다 수행한 작업과 비용이 여기에 실행 기록으로 남아요.';

  @override
  String get runCompleted => '완료';

  @override
  String get runWaiting => '대기 중';

  @override
  String get runWorking => '작업 중';

  @override
  String get triggerChat => '채팅';

  @override
  String get triggerRoutine => '루틴';

  @override
  String get noEventsForFilter => '이 실행에는 해당 유형의 이벤트가 없어요.';

  @override
  String get runStatusFailed => '실패';

  @override
  String get runStatusStopped => '중지됨';

  @override
  String get quickAskIntro => '빠른 요청을 보내세요. 선택한 봇과의 새 채팅이 시작돼요.';

  @override
  String quickAskIntroBot(String name) {
    return '빠른 요청을 보내세요. $name 봇과의 새 채팅이 시작돼요.';
  }

  @override
  String quickAskHintBot(String bot) {
    return '$bot에게 어떤 일을 시킬까요?';
  }

  @override
  String get stateProvisioning => '설정 중';

  @override
  String get stateStarting => '시작 중';

  @override
  String get computerRestoringFiles => '파일 복원 중…';

  @override
  String get stateRunning => '실행 중';

  @override
  String get stateIdle => '대기 중';

  @override
  String get stateSleeping => '절전 중';

  @override
  String get stateStopped => '중지됨';

  @override
  String get stateError => '오류';

  @override
  String get terminalHelp =>
      '이 컴퓨터의 셸이에요. 봇도 같은 셸을 사용하므로 봇이 한 작업을 직접 보고 수정할 수 있어요.';

  @override
  String get up => '위로';

  @override
  String get emptyFolderHelp => '봇이 만든 파일과 내가 업로드한 파일이 여기에 표시돼요.';

  @override
  String deleteFileTitle(String name) {
    return '$name 파일을 삭제할까요?';
  }

  @override
  String get botComputerAuto => '자동';

  @override
  String get botComputerHelp => '봇의 전용 컴퓨터예요. 여기서 명령을 실행하고, 웹을 탐색하고, 파일을 보관해요.';

  @override
  String get billingOffTitle => '결제 기능 꺼짐';

  @override
  String revokeKeyTitle(String name) {
    return '$name 키를 폐기할까요?';
  }

  @override
  String get revokeKeyBody => '해당 서버는 즉시 클라우드 컴퓨터와 크레딧 사용을 중단해요.';

  @override
  String get handBackHelp =>
      '내가 멈춘 지점부터 봇이 이어서 진행해요. 도움이 된다면 무엇을 했는지 메모로 남겨 주세요.';

  @override
  String get serverHelp => '내 Casama 서버를 사용해요. 직접 설정했거나 관리자가 알려준 주소를 입력하세요.';

  @override
  String get ssoHelp => '회사 이메일을 입력하면 회사의 로그인 페이지로 이동해요.';

  @override
  String get colorScheme => '색상 테마';

  @override
  String get searchThemes => '색상 테마 검색';

  @override
  String get noThemesFound => '일치하는 색상 테마가 없어요.';

  @override
  String get noAppsMatch => '일치하는 앱이 없어요. ‘고급’에서 직접 서버를 추가할 수 있어요.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '앱 $count개',
      one: '앱 1개',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => '전체';

  @override
  String get familyPurple => '퍼플';

  @override
  String get familyBlue => '블루';

  @override
  String get familyTeal => '틸';

  @override
  String get familyGreen => '그린';

  @override
  String get familyWarm => '웜';

  @override
  String get familyRed => '레드 및 핑크';

  @override
  String get familyNeutral => '뉴트럴';

  @override
  String get background => '배경';

  @override
  String get backgroundPattern => '패턴';

  @override
  String get backgroundColors => '색상';

  @override
  String get backgroundThemeColors => '테마';

  @override
  String get patternStrength => '패턴 진하기';

  @override
  String get wallpaperEverywhere => '모든 화면에 표시';

  @override
  String get wallpaperEverywhereHelp => '끄면 채팅 화면 배경에만 표시돼요.';

  @override
  String get resetBackground => '기본값으로 재설정';

  @override
  String get copyMessage => '복사';

  @override
  String get selectText => '텍스트 선택';

  @override
  String get shareMessage => '공유';

  @override
  String get messageCopied => '복사됨';

  @override
  String get botUiBroken => '답장의 이 부분은 표시할 수 없어요.';

  @override
  String get botUiSent => '전송됨';

  @override
  String get botUiConnected => '연결됨';

  @override
  String get draftNewEmail => '새 이메일';

  @override
  String get draftNewMessage => '새 메시지';

  @override
  String get draftNewPost => '새 게시물';

  @override
  String get draftReadyToSend => '전송 준비 완료';

  @override
  String get draftReadyToPost => '게시 준비 완료';

  @override
  String get draftEdited => '수정됨';

  @override
  String get draftSendEmail => '이메일 보내기';

  @override
  String get draftSend => '보내기';

  @override
  String get draftPost => '게시';

  @override
  String get draftDiscard => '버리기';

  @override
  String get draftEdit => '편집';

  @override
  String get draftDoneEditing => '완료';

  @override
  String get draftFrom => '보낸 사람';

  @override
  String get draftTo => '받는 사람';

  @override
  String get draftCc => '참조';

  @override
  String get draftBcc => '숨은참조';

  @override
  String get draftSubject => '제목';

  @override
  String get botCardNewEvent => '새 일정';

  @override
  String get botCardEvent => '일정';

  @override
  String get botCardReadyToAdd => '추가 준비 완료';

  @override
  String get botCardAddToCalendar => '캘린더에 추가';

  @override
  String get botCardChange => '변경';

  @override
  String get botCardSkip => '건너뛰기';

  @override
  String get botCardAllDay => '종일';

  @override
  String botCardMore(int count) {
    return '+$count개 더보기';
  }

  @override
  String get botCardAgenda => '일정 목록';

  @override
  String get botCardMessages => '메시지';

  @override
  String botCardUnread(int count) {
    return '읽지 않음 $count개';
  }

  @override
  String get botCardReply => '답장';

  @override
  String botCardReplyTo(String name) {
    return '$name 님에게 답장';
  }

  @override
  String get botCardTasks => '할 일';

  @override
  String botCardDoneOf(int done, int total) {
    return '$total개 중 $done개 완료';
  }

  @override
  String get botCardSaveChanges => '변경 사항 저장';

  @override
  String get botCardChoose => '선택';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => '어느 분을 말씀하시는 건가요?';

  @override
  String get botCardNoneOfThese => '해당 없음';

  @override
  String get botCardReminder => '미리 알림';

  @override
  String get botCardRoutine => '루틴';

  @override
  String get botCardWatcher => '지켜보기';

  @override
  String get botCardScheduled => '설정됨';

  @override
  String botCardNext(String when) {
    return '다음: $when';
  }

  @override
  String get botCardCancelIt => '취소하기';

  @override
  String get botIcon => '아이콘';

  @override
  String get botIconInitials => '이니셜';

  @override
  String get errorDetailsTitle => '문제 내용';

  @override
  String get exportLabel => '내보내기';

  @override
  String get openTimeline => '실행 타임라인 열기';

  @override
  String get details => '세부 정보';

  @override
  String get themes => '테마';

  @override
  String get myThemes => '내 테마';

  @override
  String get saveTheme => '현재 테마 저장';

  @override
  String get themeName => '테마 이름';

  @override
  String get importTheme => '테마 가져오기';

  @override
  String get themeCode => '테마 코드';

  @override
  String get themeCodeHelp => '다른 사람이 공유한 코드를 붙여넣으세요. casama-theme:으로 시작해요.';

  @override
  String get invalidThemeCode => '올바른 Casama 테마 코드가 아니에요.';

  @override
  String themeImported(String name) {
    return '내 테마에 $name 추가됨';
  }

  @override
  String get themeCodeCopied => '테마 코드가 복사되었어요. ‘화면 모드 → 테마 가져오기’에 붙여넣을 수 있어요.';

  @override
  String get shareTheme => '코드 공유';

  @override
  String deleteThemeTitle(String name) {
    return '$name 테마를 삭제할까요?';
  }

  @override
  String get fonts => '글꼴';

  @override
  String get headingFont => '제목';

  @override
  String get bodyFont => '본문';

  @override
  String get fontsHelp =>
      'Google Sans와 Noto Serif는 앱에 내장되어 있어 오프라인에서도 작동해요. 다른 Google Fonts는 처음 선택할 때 다운로드돼요.';

  @override
  String get searchFonts => '모든 Google Fonts 검색';

  @override
  String get suggestedFonts => '추천';

  @override
  String get allFonts => '모든 Google Fonts';

  @override
  String get noFontsFound => '해당 이름의 글꼴이 없어요';

  @override
  String get resetFonts => '기본 글꼴 사용';

  @override
  String get fontSample => '나와 함께 호흡을 맞춰 일하는 봇들.';

  @override
  String get backgroundPhoto => '사진';

  @override
  String get yourPhoto => '내 사진';

  @override
  String get browsePhotos => '사진 둘러보기';

  @override
  String get removePhoto => '사진 제거';

  @override
  String get photoBlur => '흐리게';

  @override
  String get photoDim => '어둡게';

  @override
  String photoBy(String name) {
    return 'Unsplash · $name 님의 사진';
  }

  @override
  String get searchPhotos => '사진 검색';

  @override
  String get photosUnavailable => '사진을 불러올 수 없어요.';

  @override
  String get noPhotos => '사진이 없어요';

  @override
  String get photoHelp =>
      '사진은 두들 아래에 배치돼요. 흐리게 및 어둡게 효과로 위쪽 텍스트를 선명하게 유지할 수 있어요.';

  @override
  String get periodToday => '오늘';

  @override
  String get periodWeek => '이번 주';

  @override
  String get periodYear => '올해';

  @override
  String get totalSpend => '지출';

  @override
  String get tokensIn => '입력 토큰';

  @override
  String get tokensOut => '출력 토큰';

  @override
  String get runsLabel => '실행';

  @override
  String get spendByDay => '일별 지출';

  @override
  String get byBot => '봇별';

  @override
  String get byModel => '모델별';

  @override
  String get everythingMetered => '전체 측정 항목';

  @override
  String get bySource => '출처별';

  @override
  String get byPerson => '사용자별';

  @override
  String get usageAllBots => '모든 봇';

  @override
  String get usageAllModels => '모든 모델';

  @override
  String get usageAllSources => '모든 출처';

  @override
  String get usageEveryone => '전체';

  @override
  String get usageJustMe => '나만';

  @override
  String get usageClearFilters => '지우기';

  @override
  String get usageFilterBot => '봇별 필터';

  @override
  String get usageFilterModel => '모델별 필터';

  @override
  String get usageFilterSource => '출처별 필터';

  @override
  String get usageFilterPerson => '사용자별 필터';

  @override
  String get usageSourceChat => '채팅';

  @override
  String get usageSourceChatApp => '채팅 앱';

  @override
  String get usageSourceRoutine => '루틴';

  @override
  String get usageSourceApi => 'API 및 기타 에이전트';

  @override
  String get usageSourceOther => '기타';

  @override
  String get usageNoPerson => '자동';

  @override
  String get usageUnnamedPerson => '이름 없는 멤버';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n회 실행',
      one: '1회 실행',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'CSV 내보내기';

  @override
  String get exportJson => 'JSON 내보내기';

  @override
  String get askBotAboutUsage => '봇에게 이 내용 물어보기';

  @override
  String get noUsageYet => '이 기간에 아직 사용량이 없어요.';

  @override
  String get otherModel => '컴퓨터 및 기타';

  @override
  String get deletedBot => '연결된 봇 없음';

  @override
  String get usageHelp =>
      '비용은 토큰 수와 게시된 요금을 기준으로 한 추정치예요. 정확한 금액은 모델 제공업체의 청구서를 기준으로 해요.';

  @override
  String usageAskPrompt(String period, String summary) {
    return '다음은 $period 기간의 Casama 사용량이야. 비용이 어디에 쓰이는지, 어떻게 줄일 수 있는지 알려 줘. 사용량 도구로 실시간 수치를 확인해도 좋아.\n\n$summary';
  }

  @override
  String get kindTokensIn => '모델 입력';

  @override
  String get kindTokensOut => '모델 출력';

  @override
  String get kindComputer => '클라우드 컴퓨터 시간';

  @override
  String get kindModels => 'AI 모델';

  @override
  String get creditsThisMonth => '이번 달 크레딧';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent% 사용됨';
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
      other: '평소 비용 기준 약 $nString회 실행 남음',
      one: '평소 비용 기준 약 1회 실행 남음',
      zero: '평소 비용 기준 1회 미만 남음',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut => '크레딧이 모두 소진되었어요. 봇이 계속 일할 수 있도록 크레딧을 추가해 주세요.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1크레딧 = $price 기준이에요. 플랜에 따라 매월 $amount씩 추가되며, 사용하지 않은 크레딧은 다음 달로 1개월 이월돼요.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1크레딧 = $price 기준이에요. App Store 또는 Google Play에서 구매한 크레딧 팩은 만료되지 않으며, 웹에서 구매한 크레딧 팩은 12개월간 유효해요.';
  }

  @override
  String get creditsDailyLabel => '오늘의 한도';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$cap 중 $used';
  }

  @override
  String get creditsDailyExplainer =>
      '남은 크레딧과 관계없이 플랜에서 매일 Casama의 모델, 음성, 앱에 쓸 수 있는 한도예요.';

  @override
  String get creditsDailyReached =>
      '오늘의 한도에 도달해 봇들이 일시 정지되었어요. 일일 한도를 높이려면 업그레이드해 주세요.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '약 $n시간 후 초기화돼요.',
      one: '약 1시간 후 초기화돼요.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => '1시간 이내에 초기화돼요.';

  @override
  String get creditsHoursLabel => '컴퓨터 사용 시간';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$limit시간 중 $used시간';
  }

  @override
  String creditsHoursExplainer(String date) {
    return '이번 달 봇 컴퓨터가 실행되는 시간이에요. 시간이 소진되어도 채팅은 계속 작동하며 컴퓨터만 멈춰요. $date에 초기화돼요.';
  }

  @override
  String creditsHoursReached(String date) {
    return '이번 달 컴퓨터 사용 시간을 모두 써서 컴퓨터를 시작할 수 없어요. 채팅은 계속 사용할 수 있어요. $date에 초기화돼요. 더 많은 시간을 쓰려면 업그레이드해 주세요.';
  }

  @override
  String get kindStream => '실시간 보기';

  @override
  String get kindTts => '소리 내어 읽기';

  @override
  String get computerMissingTitle => '컴퓨터를 찾을 수 없어요';

  @override
  String get computerMissingHelp =>
      '삭제되었거나 목록이 최신이 아닐 수 있어요. 새로고침해 다시 확인해 보세요.';

  @override
  String get computerMissingBotHelp =>
      '이 봇의 컴퓨터가 삭제되었거나 목록이 최신이 아닐 수 있어요. 새로고침하거나 이 봇에 다른 컴퓨터를 선택해 주세요.';

  @override
  String get computerChoose => '컴퓨터 선택';

  @override
  String get personaWork => '업무';

  @override
  String get personaResearch => '리서치';

  @override
  String get personaBuild => '개발';

  @override
  String get personaCreate => '창작';

  @override
  String get personaLife => '일상';

  @override
  String get personaOther => '기타';

  @override
  String get blankBotHelp => '처음부터 시작해 나만의 지침을 직접 작성해요.';

  @override
  String get browse => '둘러보기';

  @override
  String get browseAllPersonas => '전체 보기';

  @override
  String get botIdentity => '이름 및 아이콘';

  @override
  String get serviceKeys => '서비스 키';

  @override
  String get noServiceKeys => '아직 서비스 키가 없어요.';

  @override
  String get serviceKeysHelp => '내 검색, 지도 또는 데이터 키';

  @override
  String get serviceKeysIntro =>
      'Casama가 모델, 음성, 이미지를 대신 실행해 드려요. 내 검색, 지도 또는 데이터 서비스를 직접 쓰고 싶을 때만 여기에 키를 추가하세요. 키는 암호화되어 저장되며 다시 표시되지 않아요.';

  @override
  String get choosePersona => '페르소나 선택';

  @override
  String get choosePersonaHelp =>
      '각 페르소나에는 지침, 스타일, 그리고 때로는 스킬과 루틴이 포함되어 있어요. 나중에 언제든 무엇이든 바꿀 수 있어요.';

  @override
  String get searchPersonas => '페르소나 검색';

  @override
  String get noPersonasFound => '일치하는 페르소나가 없어요';

  @override
  String get previewPersona => '미리보기';

  @override
  String get personaInstructions => '지침';

  @override
  String get personaTryAsking => '이렇게 물어보세요';

  @override
  String usePersona(String name) {
    return '$name 사용';
  }

  @override
  String get loadPersona => '페르소나 불러오기';

  @override
  String get replaceInstructionsTitle => '지침을 교체할까요?';

  @override
  String replaceInstructionsBody(String name) {
    return '봇의 현재 지침이 $name의 지침으로 대체돼요. 스킬과 루틴은 그대로 유지돼요.';
  }

  @override
  String get replace => '교체';

  @override
  String get appsTitle => '앱';

  @override
  String get appsSubtitle => '팀이 이미 사용 중인 도구를 봇에게 연결해 주세요.';

  @override
  String get connectedTab => '연결됨';

  @override
  String get browseTab => '둘러보기';

  @override
  String get searchApps => '앱 검색';

  @override
  String get popularApps => '인기';

  @override
  String get allApps => '모든 앱';

  @override
  String get appCatDeveloper => '개발자';

  @override
  String get appCatProductivity => '생산성';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => '결제';

  @override
  String get appCatDesign => '디자인';

  @override
  String get appCatSales => '영업 및 지원';

  @override
  String get appCatData => '데이터 및 검색';

  @override
  String get appCatAutomation => '자동화';

  @override
  String get authOneClick => '원클릭';

  @override
  String get authApiKey => 'API 키';

  @override
  String get authNone => '로그인 불필요';

  @override
  String get authAdminSetup => '설정 필요';

  @override
  String get connectedBadge => '연결됨';

  @override
  String get whatBotsCanDo => '봇이 할 수 있는 작업';

  @override
  String continueWith(String app) {
    return '$app 계정으로 계속하기';
  }

  @override
  String get signInTab => '로그인';

  @override
  String get connectNoSignIn => '이 앱은 로그인 없이 작동해요.';

  @override
  String finishSignIn(String app) {
    return '$app 로그인 마저 하기';
  }

  @override
  String finishSignInHelp(String app) {
    return '브라우저에서 $app 페이지가 열렸어요. 거기서 접근을 승인하면 자동으로 업데이트돼요.';
  }

  @override
  String get reopenSignIn => '로그인 페이지 다시 열기';

  @override
  String appConnected(String app) {
    return '$app 연결됨';
  }

  @override
  String appAlreadyConnected(String app) {
    return '이 워크스페이스에 $app 연결이 이미 있어요. 기존 연결을 사용하거나 다른 계정을 추가하세요.';
  }

  @override
  String get useConnection => '기존 연결 사용';

  @override
  String get addAnotherAccount => '다른 계정 추가';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇이 쓸 수 있는 도구 $countString개가 준비되었어요.',
      one: '봇이 쓸 수 있는 도구 1개가 준비되었어요.',
      zero: '사용할 준비가 되었어요.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => '어느 봇이 사용할 수 있나요?';

  @override
  String get whichBotsHelp => '위험한 작업을 하기 전에는 봇이 여전히 먼저 물어봐요.';

  @override
  String get doneLabel => '완료';

  @override
  String openApp(String app) {
    return '$app 열기';
  }

  @override
  String get pasteLabel => '붙여넣기';

  @override
  String get connectingLabel => '연결 중…';

  @override
  String get connectFailedTitle => '연결할 수 없어요';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return '또는 다음 서비스 중 하나로 $app 연결을 설정하세요. 한 번만 로그인하면 봇에게 $app 사용을 요청할 수 있어요.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote => '로그인 정보는 암호화되어 저장되며 다시 표시되지 않아요. 언제든 연결을 끊을 수 있어요.';

  @override
  String get composioHelp => '수백 개의 앱을 연결하고, 로그인은 대신 처리해 드려요.';

  @override
  String get pipedreamHelp => 'Pipedream Connect를 통해 수천 개의 앱을 연결해요.';

  @override
  String get customServer => '사용자 지정 서버';

  @override
  String get customServerHelp => '모든 MCP 서버 또는 OpenAPI 스펙 지원 (개발자용).';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $countString개에서 사용 중',
      one: '봇 1개에서 사용 중',
      zero: '아직 어떤 봇에도 할당되지 않음',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => '준비됨';

  @override
  String get statusNeedsAttention => '확인 필요';

  @override
  String get statusChecking => '확인 중';

  @override
  String get toolsHelp =>
      '읽기 전용 도구는 알아서 실행돼요. 변경을 일으키는 도구는 봇이 신뢰할 수 없는 내용을 읽었을 때 먼저 물어보며, “항상 물어봄”으로 표시된 도구는 매번 승인을 기다려요.';

  @override
  String get botsWithAccess => '접근 권한이 있는 봇';

  @override
  String get reconnect => '다시 연결';

  @override
  String get disconnect => '연결 해제';

  @override
  String disconnectTitle(String app) {
    return '$app 연결을 해제할까요?';
  }

  @override
  String get disconnectBody => '봇들이 즉시 해당 도구를 사용할 수 없게 되며, 저장된 로그인 정보도 삭제돼요.';

  @override
  String get testConnection => '연결 테스트';

  @override
  String get signedInOAuth => '내 계정으로 로그인됨';

  @override
  String get signedInKey => 'API 키로 연결됨';

  @override
  String get signedInNone => '로그인 필요 없음';

  @override
  String get noConnectionsTitle => '첫 번째 앱 연결하기';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail 등 대부분 클릭 한 번이면 돼요.';

  @override
  String get browseApps => '앱 둘러보기';

  @override
  String providerSetupTitle(String provider) {
    return '$provider 연결';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider에서 대신 앱에 로그인해 주므로 직접 키를 다룰 필요가 없어요.';
  }

  @override
  String get getFreeKey => '무료 키 받기';

  @override
  String connectedThroughHub(String provider) {
    return '$provider 통해 연결됨';
  }

  @override
  String providerAppsTitle(String provider) {
    return '$provider 통해 연결된 앱';
  }

  @override
  String get addAnApp => '앱 추가';

  @override
  String searchProviderApps(String provider) {
    return '$provider 앱 검색';
  }

  @override
  String get accountConnected => '로그인됨';

  @override
  String get accountPending => '로그인 대기 중';

  @override
  String get accountError => '로그인 문제';

  @override
  String get providerReconnectHint => '앱 호출 비용을 낮추려면 Casama로 직접 로그인하세요';

  @override
  String get noProviderAccounts => '아직 앱이 없어요. 앱을 추가하고 로그인해 보세요.';

  @override
  String get projectId => '프로젝트 ID';

  @override
  String get toolRiskLow => '읽기 전용';

  @override
  String get toolRiskMedium => '변경 작업';

  @override
  String get toolRiskHigh => '항상 물어봄';

  @override
  String get askWhichBot => '어느 봇이 이걸 확인하도록 할까요?';

  @override
  String get computerWake => '깨우기';

  @override
  String get computerAsleepTitle => '컴퓨터가 절전 상태예요';

  @override
  String get computerAsleepFilesHelp => '파일을 보거나 업로드하려면 컴퓨터를 깨워 주세요.';

  @override
  String get computerFilesTimedOut =>
      '파일을 불러오는 데 시간이 너무 오래 걸려요. 컴퓨터가 켜져 있는지 확인한 뒤 다시 시도해 주세요.';

  @override
  String get computerGoingToSleep => '절전 모드로 전환 중';

  @override
  String get liveViewWakesHelp =>
      '이 컴퓨터는 절전 상태예요. 실시간 보기를 열면 깨어나며, 일정 시간 사용하지 않으면 다시 절전 상태로 들어가요.';

  @override
  String get wakeAndWatch => '깨우고 실시간 보기';

  @override
  String get chatGptPlan => 'ChatGPT 플랜';

  @override
  String get continueWithChatGpt => 'ChatGPT로 계속하기';

  @override
  String get chatGptConnectHelp =>
      'API 키 대신 ChatGPT 플랜으로 봇을 실행하세요. 모델 호출은 플랜 한도에 포함되며, 본인만 사용할 수 있어요.';

  @override
  String get chatGptDesktopOnly =>
      'ChatGPT 플랜을 연결하려면 데스크톱 앱을 열거나 CLI에서 \"casama credential chatgpt\"를 실행하세요.';

  @override
  String get chatGptWaiting => '브라우저에서 ChatGPT 로그인을 완료해 주세요…';

  @override
  String chatGptConnected(String account) {
    return 'ChatGPT 플랜이 연결되었어요 ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      '로그인했지만 플랜 사용량이 허용되지 않았어요. 다시 연결해 허용하거나 API 키를 추가해 주세요.';

  @override
  String get orAddApiKey => '또는 API 키 추가';

  @override
  String get planOnlyYou => '나만 사용할 수 있어요';

  @override
  String get planOtherMember => '다른 멤버의 플랜';

  @override
  String get planConnected => '연결됨';

  @override
  String get planUsageOff => '플랜 사용량 꺼짐';

  @override
  String get planNeedsReconnect => '다시 로그인';

  @override
  String get useNextModelAtLimit => '내 플랜 한도 도달 시 봇의 다음 모델 사용';

  @override
  String get useNextModelAtLimitHelp =>
      '끄기: ChatGPT 한도에 도달하면 실행이 멈춰요. 켜기: 봇의 다음 모델로 이어서 실행하며, 비용이 발생할 수 있어요.';

  @override
  String get manageUsage => '사용량 관리';

  @override
  String get removeKey => '제거';

  @override
  String removeKeyConfirm(String label) {
    return '$label 키를 제거할까요? 다른 키를 지정할 때까지 이 키를 쓰는 봇들은 작동을 멈춰요.';
  }

  @override
  String get removeKeyChatGptNote => 'ChatGPT 로그인도 함께 해제돼요.';

  @override
  String modelFallbackNotice(String message) {
    return '다음 모델로 전환됨: $message';
  }

  @override
  String get twoStepSignIn => '2단계 로그인';

  @override
  String get twoStepHelp => '로그인할 때마다 인증 앱의 코드를 입력해요.';

  @override
  String get signInWithPasskey => '패스키로 로그인';

  @override
  String get account => '계정';

  @override
  String get accountRow => '이메일, 비밀번호 및 모든 기기에서 로그아웃';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get newPasswordAgain => '새 비밀번호 확인';

  @override
  String get passwordsDontMatch => '비밀번호가 일치하지 않아요';

  @override
  String get newPasswordTitle => '새 비밀번호 선택';

  @override
  String get newPasswordBody => '로그인되었어요. 이메일로 로그인할 때 사용할 새 비밀번호를 정해 주세요.';

  @override
  String get savePassword => '비밀번호 저장';

  @override
  String get passwordSaved => '비밀번호가 저장되었어요.';

  @override
  String get passwordTitle => '비밀번호';

  @override
  String get passwordRow => '이메일 로그인에 사용할 비밀번호를 설정하거나 변경해요';

  @override
  String get passwordHelp =>
      '6자 이상 입력하세요. Google, Apple, 패스키 또는 이메일 링크로도 계속 로그인할 수 있어요.';

  @override
  String passwordCodeSent(String email) {
    return '계정 보호를 위해 방금 $email 주소로 보낸 이메일의 코드를 입력해 주세요.';
  }

  @override
  String get changeEmailTitle => '이메일 변경';

  @override
  String get changeEmailHelp =>
      '현재 이메일 주소와 새 이메일 주소로 각각 확인 링크를 보내드려요. 두 주소에서 모두 확인을 마쳐야 변경이 완료돼요.';

  @override
  String get newEmail => '새 이메일';

  @override
  String get changeEmailSend => '확인 링크 보내기';

  @override
  String get changeEmailRow => '로그인에 사용하는 이메일을 변경해요';

  @override
  String changeEmailSent(String email) {
    return '두 받은편지함을 모두 확인해 주세요. 두 링크를 모두 확인하면 $email 주소가 내 이메일이 돼요.';
  }

  @override
  String changeEmailPending(String email) {
    return '확인 대기 중: $email';
  }

  @override
  String get signOutEverywhere => '모든 기기에서 로그아웃';

  @override
  String get signOutEverywhereHelp => '이 기기를 포함한 모든 휴대폰, 컴퓨터, 브라우저';

  @override
  String get signOutEverywhereConfirm =>
      '이 기기를 포함한 모든 기기에서 로그아웃할까요? 기기를 분실했거나 다른 사람이 로그인한 것 같을 때 사용하세요.';

  @override
  String get passkeySuggestTitle => '다음부터 더 빠르게 로그인할까요?';

  @override
  String get passkeySuggestBody =>
      '패스키를 추가하면 비밀번호나 이메일 없이 Face ID, 지문 또는 화면 잠금으로 로그인할 수 있어요.';

  @override
  String get passkeys => '패스키';

  @override
  String get passkeysRow => 'Face ID, 지문 또는 화면 잠금으로 로그인';

  @override
  String get passkeysHelp =>
      '패스키를 사용하면 비밀번호나 이메일 없이 Face ID, 지문 또는 화면 잠금으로 로그인할 수 있어요. 휴대폰, 컴퓨터, 비밀번호 관리자마다 별도로 저장돼요.';

  @override
  String get passkeyAdd => '패스키 추가';

  @override
  String get passkeyAddAnother => '다른 패스키 추가';

  @override
  String get passkeyAdded => '패스키가 추가되었어요. 다음부터 이 패스키로 로그인하세요.';

  @override
  String get passkeyRename => '이름 변경';

  @override
  String get passkeyRenameTitle => '패스키 이름 변경';

  @override
  String get passkeyNameLabel => '이름';

  @override
  String get passkeyRemove => '제거';

  @override
  String passkeyRemoveConfirm(String name) {
    return '“$name” 패스키를 제거할까요? 더 이상 이 패스키로 로그인할 수 없게 돼요.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return '추가됨: $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return '마지막 사용: $when';
  }

  @override
  String get twoStepSetUp => '인증 앱 설정';

  @override
  String get twoStepAddAnother => '다른 인증 앱 추가';

  @override
  String get twoStepScan =>
      '1Password, Google Authenticator 또는 Authy 같은 인증 앱으로 이 코드를 스캔하거나 설정 키를 입력한 뒤, 표시되는 6자리 코드를 입력해 주세요.';

  @override
  String get twoStepKey => '설정 키';

  @override
  String get twoStepCode => '6자리 코드';

  @override
  String get twoStepVerify => '인증';

  @override
  String get twoStepNowOn => '2단계 로그인이 켜졌어요.';

  @override
  String get twoStepAuthenticators => '인증 앱';

  @override
  String get twoStepRename => '이름 변경';

  @override
  String get twoStepRenameTitle => '인증 앱 이름 변경';

  @override
  String get twoStepNameLabel => '이름';

  @override
  String get twoStepNameHint => '예: 회사 휴대폰';

  @override
  String get twoStepRemove => '제거';

  @override
  String get twoStepRemoveConfirm =>
      '이 인증 앱을 제거할까요? 등록된 유일한 앱이라면 앞으로 비밀번호만으로 로그인하게 돼요.';

  @override
  String get twoStepPromptTitle => '코드 입력';

  @override
  String get twoStepPromptBody => '로그인을 마치려면 인증 앱을 열고 6자리 코드를 입력해 주세요.';

  @override
  String get twoStepPromptAccount => '로그인 계정';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => '새 비밀번호 설정 대상';

  @override
  String get connectAiAppAccount => '접근 권한 범위';

  @override
  String joinAsAccount(String email, String server) {
    return '$server 서버에 $email 계정으로 참여하게 돼요.';
  }

  @override
  String get requireTwoStep => '소유자와 관리자에게 2단계 로그인 필수 적용';

  @override
  String get requireTwoStepHelp =>
      '소유자와 관리자는 반드시 사용해야 해요. 먼저 본인의 2단계 로그인을 켜 주세요.';

  @override
  String get twoStepNeededForAdmin =>
      '이 워크스페이스는 소유자와 관리자에게 2단계 로그인을 요구해요. 관리자 설정을 사용하려면 2단계 로그인을 설정하거나 코드로 다시 로그인해 주세요.';

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
  String get suspendWorkspace => '일시 정지';

  @override
  String get unsuspendWorkspace => '일시 정지 해제';

  @override
  String get suspendReason => '사유';

  @override
  String get suspendWorkspaceHelp =>
      '컴퓨터가 멈추고 봇들도 실행을 멈춰요. 아무것도 삭제되지 않으며 언제든 해제할 수 있어요.';

  @override
  String workspaceSuspended(String reason) {
    return '일시 정지됨: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      '이 워크스페이스는 이용이 정지되어 봇을 실행하거나 컴퓨터를 시작할 수 없어요. 이 서버 운영자에게 문의해 주세요.';

  @override
  String get abuseKind_mining_pool => '암호화폐 채굴 차단됨';

  @override
  String get abuseKind_blocked_port => '메일 포트 차단됨';

  @override
  String get abuseKind_egress_flood => '트래픽 폭주';

  @override
  String get abuseKind_signup_blocked => '회원가입 거부됨';

  @override
  String get abuseKind_suspended => '워크스페이스 일시 정지됨';

  @override
  String get abuseKind_unsuspended => '일시 정지 해제됨';

  @override
  String get kindLocalMcp => '컴퓨터에서 실행';

  @override
  String get capMcp => '로컬 도구 (MCP)';

  @override
  String get localMcpServers => '로컬 도구 (MCP)';

  @override
  String get localMcpHelp =>
      'T3 Code, Claude Code, Codex 또는 디자인 앱처럼 이 컴퓨터나 네트워크에 있는 MCP 서버를 봇이 사용할 수 있어요. 토큰과 로그인 정보는 이 컴퓨터에만 보관돼요.';

  @override
  String get localMcpAdd => '로컬 MCP 서버 추가';

  @override
  String get localMcpEmpty => '아직 로컬 MCP 서버가 없어요.';

  @override
  String get localMcpName => '이름';

  @override
  String get localMcpStdio => '명령어';

  @override
  String get localMcpLoopback => '주소';

  @override
  String get localMcpCommand => '명령어';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => '주소';

  @override
  String get localMcpFolder => '작업 폴더 (선택)';

  @override
  String get localMcpEnv => '환경 변수 (한 줄에 KEY=value 형식 하나씩, 이 컴퓨터에만 보관)';

  @override
  String get localMcpNeedsCapability =>
      '봇이 사용할 수 있도록 위에서 ‘로컬 도구 (MCP)’를 켜 주세요.';

  @override
  String get localMcpBadUrl =>
      '이 컴퓨터나 내 네트워크의 http:// 주소(예: http://127.0.0.1:3845/mcp) 또는 https:// 주소를 입력하세요.';

  @override
  String get localMcpBadFolder => '공유 폴더 중 하나 내부의 폴더를 선택하세요.';

  @override
  String get codingAgents => '코딩 에이전트';

  @override
  String get codingAgentsHelp =>
      '봇이 이 컴퓨터에 있는 코딩 에이전트에게 코딩 작업을 넘길 수 있어요. 내 로그인 정보를 사용해 공유한 폴더 안에서 작업해요.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '코딩 에이전트 $nString개를 찾았어요',
      one: '코딩 에이전트 1개를 찾았어요',
      zero: '코딩 에이전트를 찾지 못했어요',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      '이 서버가 아직 워크스페이스에 저장되지 않았어요. 제거한 뒤 다시 추가해 주세요.';

  @override
  String get localMcpSignInKind => '로그인 방식';

  @override
  String get localMcpAuthNone => '없음';

  @override
  String get localMcpAuthToken => '토큰';

  @override
  String get localMcpAuthHeader => '헤더';

  @override
  String get localMcpAuthOAuth => '브라우저';

  @override
  String get localMcpToken => '토큰 (이 컴퓨터에만 보관)';

  @override
  String get localMcpHeaderName => '헤더 이름';

  @override
  String get localMcpHeaderValue => '헤더 값 (이 컴퓨터에만 보관)';

  @override
  String get localMcpOAuthHelp =>
      '이 서버에 로그인할 수 있도록 Casama가 브라우저를 열어요. 로그인 정보는 이 컴퓨터에만 남아요.';

  @override
  String get localMcpNetworkWarning =>
      '이 서버는 이 컴퓨터에 있지 않아요. 이 컴퓨터를 사용할 수 있는 봇은 이 서버에도 접근할 수 있어요.';

  @override
  String get localMcpSignIn => '로그인';

  @override
  String get localMcpNeedsSignIn => '로그인 필요';

  @override
  String get localMcpEdit => '로컬 MCP 서버 편집';

  @override
  String get localMcpImport => '다른 앱에서 추가';

  @override
  String get localMcpImportHelp =>
      '이 컴퓨터의 T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex 또는 Windsurf에 이미 설정된 MCP 서버들이에요.';

  @override
  String get localMcpImportNone => '이 컴퓨터의 다른 앱에서 MCP 서버를 찾지 못했어요.';

  @override
  String get localMcpImportAdded => '이미 추가됨';

  @override
  String get localMcpImportRemote =>
      '인터넷상에 있으므로 보통 ‘연결’에서 추가해요. 이 컴퓨터에서만 접근할 수 있는 경우에만 여기에 추가하세요.';

  @override
  String get mcpQuestionDecline => '거절';

  @override
  String get mcpQuestionSend => '보내기';

  @override
  String get cardMcpQuestion => '질문';

  @override
  String get cardMcpSignIn => '로그인';

  @override
  String get mcpSignInHereHelp => '봇이 다시 사용할 수 있도록 로그인해 주세요.';

  @override
  String localMcpSignedIn(String name) {
    return '$name에 로그인됨';
  }

  @override
  String localMcpImportFrom(String source) {
    return '$source에서 가져옴';
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
      other: '서버 $nString개 추가',
      one: '서버 1개 추가',
      zero: '추가',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (이 컴퓨터에만 보관)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name 로그인 필요';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return '$device 기기에서 Casama를 열고 거기서 로그인해 주세요.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      '이 도구가 실행 중인 컴퓨터에서 Casama를 열고 거기서 로그인해 주세요.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection의 질문';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return '$connection에 답변함';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return '$connection의 질문 거절함';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return '$connection의 질문 닫힘';
  }

  @override
  String get codingAgentsNone =>
      '코딩 에이전트를 찾지 못했어요. 코딩 작업을 맡기려면 Claude Code, Codex 또는 Cursor의 명령줄 에이전트를 설치해 주세요.';

  @override
  String get codingAgentsNeedShell => '코딩 에이전트는 명령어로 실행되므로 ‘명령 실행’이 켜져 있어야 해요.';

  @override
  String get allowCommands => '켜기';

  @override
  String get codingAgentAllow => '허용';

  @override
  String get codingAgentAllowed => '허용됨';

  @override
  String get codingAgentsAllowHelp =>
      '옆에 ‘허용’이 표시된 에이전트는 아직 이 컴퓨터에서 실행된 적이 없어요. 한 번 허용해 두면 봇이 작업을 맡길 수 있어요.';

  @override
  String get ownAgentsAdd => '직접 추가';

  @override
  String get ownAgentYours => '내 에이전트';

  @override
  String get ownAgentNotFound => '이 컴퓨터에서 찾을 수 없음';

  @override
  String get ownAgentsHelp =>
      '직접 추가한 에이전트는 이 컴퓨터에서만, 내 대신 작업하는 채팅에서 실행돼요. 워크스페이스의 다른 사람은 보거나 바꿀 수 없어요.';

  @override
  String get ownAgentFormTitle => '직접 에이전트 추가';

  @override
  String get ownAgentEditTitle => '에이전트 편집';

  @override
  String get ownAgentName => '이름';

  @override
  String get ownAgentBin => '명령어 이름';

  @override
  String get ownAgentCommand => '명령어';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return '작업 내용이 들어갈 자리에 $task를 넣으세요. Casama가 따옴표 처리를 해 줘요. 안의 모든 명령은 명령어 이름으로 시작해야 해요. $folder도 사용할 수 있고, 에이전트가 답을 파일로 쓸 때는 $result_file을 사용할 수 있어요.';
  }

  @override
  String get ownAgentResult => '답변 읽기 방식';

  @override
  String get ownAgentResultTail => '출력의 마지막 부분';

  @override
  String get ownAgentResultJson => 'result 필드가 있는 JSON 한 줄';

  @override
  String get ownAgentResultStream => 'JSON 줄 스트림';

  @override
  String get ownAgentResultField => 'JSON 필드';

  @override
  String get ownAgentResultFile => '파일에 기록됨';

  @override
  String get ownAgentResultFieldName => '필드 이름';

  @override
  String get ownAgentTimeLimit => '제한 시간 (분)';

  @override
  String get ownAgentTest => '테스트';

  @override
  String get ownAgentTestHelp =>
      '테스트를 실행하면 이 컴퓨터에서 pong이라는 단어 하나만 답하도록 요청하고 출력 결과를 보여 줘요.';

  @override
  String ownAgentTestPassed(String reply) {
    return '응답 결과: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return '예상대로 응답하지 않았어요 (종료 코드 $code).';
  }

  @override
  String get ownAgentTestTimedOut => '시간 내에 완료되지 않았어요.';

  @override
  String ownAgentBadCommand(String task) {
    return '이름, 명령어 이름, 그리고 $task가 포함된 명령어를 입력해 주세요.';
  }

  @override
  String get board => '보드';

  @override
  String get newTicket => '새 티켓';

  @override
  String get newTicketSubtitle => '봇에게 맡기고 보드에서 진행 상황을 확인하는 작업이에요.';

  @override
  String get allProjects => '모든 프로젝트';

  @override
  String get manageProjects => '프로젝트 관리';

  @override
  String get filterByProject => '프로젝트별 필터';

  @override
  String get moveTo => '이동';

  @override
  String get noMatchingTickets => '일치하는 티켓이 없어요';

  @override
  String get noMatchingTicketsHelp => '이 필터와 일치하는 티켓이 없어요.';

  @override
  String get clearFilters => '필터 지우기';

  @override
  String get ticketTitle => '제목';

  @override
  String get ticketDetails => '세부 정보';

  @override
  String get taskInReview => '검토 중';

  @override
  String get priority => '우선순위';

  @override
  String get priorityUrgent => '긴급';

  @override
  String get priorityHigh => '높음';

  @override
  String get priorityMedium => '보통';

  @override
  String get priorityLow => '낮음';

  @override
  String get priorityNone => '우선순위 없음';

  @override
  String get filterAll => '전체';

  @override
  String get filterMine => '내 작업';

  @override
  String get filterBots => '봇';

  @override
  String get assignee => '담당자';

  @override
  String get unassigned => '미지정';

  @override
  String get assignToMe => '나';

  @override
  String get reviewRequired => '검토 필요';

  @override
  String get reviewRequiredHelp => '봇이 작업을 끝낼 때 ‘완료’ 대신 ‘검토 중’ 상태로 마무리해요.';

  @override
  String get comments => '댓글';

  @override
  String get addComment => '댓글 추가';

  @override
  String get sendComment => '보내기';

  @override
  String get openThread => '봇의 스레드 열기';

  @override
  String get deleteTicket => '티켓 삭제';

  @override
  String get ticketResult => '결과';

  @override
  String get noCommentsYet => '아직 댓글이 없어요. 봇이나 팀을 위한 메모를 남겨 보세요.';

  @override
  String get noTickets => '봇에게 할 일을 맡겨 보세요';

  @override
  String get noTicketsHelp =>
      '작업 하나를 넘기거나 전체 목표를 맡겨 보세요. 여기서 진행 상황을 지켜볼 수 있어요.';

  @override
  String get tasksStartTicket => '티켓 추가';

  @override
  String get tasksStartTicketHelp => '하나의 작업 단위예요. 봇에게 배정하면 바로 시작해요.';

  @override
  String get tasksStartProject => '프로젝트 시작';

  @override
  String get tasksStartProjectHelp => '더 큰 목표예요. 봇이 티켓들로 계획을 세우고 승인을 기다려요.';

  @override
  String get tasksExamples => '또는 다음 예시로 시작해 보세요';

  @override
  String get tasksExampleResearch => '주요 경쟁사 3곳 조사해 줘';

  @override
  String get tasksExampleDraft => '출시 안내 초안 작성해 줘';

  @override
  String get tasksExampleTidy => '내 파일 정리해 줘';

  @override
  String get ticketStatus => '상태';

  @override
  String get spaces => '워크스페이스';

  @override
  String get newWorkspace => '새 워크스페이스';

  @override
  String get newWorkspaceSubtitle => '고유한 봇과 채팅, 멤버를 가진 팀을 위한 별도의 공간이에요.';

  @override
  String get joinWorkspaceHelp => '누군가 보내준 초대 링크를 붙여넣으세요.';

  @override
  String get inviteLinkField => '초대 링크';

  @override
  String get workspaceIcon => '아이콘';

  @override
  String get workspaceColor => '색상';

  @override
  String get workspaceSettings => '워크스페이스 설정';

  @override
  String get workspaceSettingsHelp => '이름, 아이콘, 색상 및 초대 링크';

  @override
  String get inviteLinks => '초대 링크';

  @override
  String get inviteLinksHelp =>
      '링크가 있는 사람은 누구나 로그인 후 참여할 수 있어요. 만료되거나 사용 횟수를 모두 소진하거나 폐기할 때까지 유효해요.';

  @override
  String get createInviteLink => '링크 만들기';

  @override
  String get linkExpires => '만료';

  @override
  String get linkNever => '만료 안 함';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$daysString일 후',
      one: '1일 후',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => '사용 횟수';

  @override
  String get linkUnlimited => '무제한';

  @override
  String linkUses(String uses) {
    return '$uses회 사용됨';
  }

  @override
  String get linkRevoked => '폐기됨';

  @override
  String get revokeLink => '폐기';

  @override
  String get linkCopied => '초대 링크가 복사되었어요.';

  @override
  String get inviteRole => '역할';

  @override
  String get shareLinkLabel => '공유';

  @override
  String get botFolder => '폴더';

  @override
  String get noFolder => '폴더 없음';

  @override
  String get newFolder => '새 폴더…';

  @override
  String get folderName => '폴더 이름';

  @override
  String get archiveBot => '봇 보관';

  @override
  String archiveBotTitle(String name) {
    return '$name 봇을 보관할까요?';
  }

  @override
  String get archiveBotBody =>
      '사이드바에서 사라지고 실행을 멈춰요. 채팅과 기록은 유지되며 ‘보관된 봇’에서 다시 불러올 수 있어요.';

  @override
  String get archive => '보관';

  @override
  String get archivedBots => '보관된 봇';

  @override
  String get unarchive => '다시 불러오기';

  @override
  String botArchived(String name) {
    return '$name 봇이 보관되었어요.';
  }

  @override
  String get settingsHistory => '설정 기록';

  @override
  String get settingsHistoryHelp => '이 봇의 설정 변경 이력과 변경한 사람';

  @override
  String get noHistory => '아직 변경 기록이 없어요.';

  @override
  String get restoreSettings => '이 설정 복원';

  @override
  String restoreSettingsBody(String fields) {
    return '$fields 항목을 이 변경 전 상태로 되돌릴까요? 현재 설정은 기록에 남아요.';
  }

  @override
  String changedByBot(String name) {
    return '$name 봇이 변경함';
  }

  @override
  String get changedByPerson => '사용자가 변경함';

  @override
  String get changedBySystem => 'Casama가 변경함';

  @override
  String get fieldName => '이름';

  @override
  String get fieldInstructions => '지침';

  @override
  String get fieldModel => '모델';

  @override
  String get fieldAutonomy => '자율성';

  @override
  String get fieldBudget => '예산';

  @override
  String get fieldComputer => '컴퓨터';

  @override
  String get fieldArchived => '보관 여부';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot에게 $service 키가 필요해요';
  }

  @override
  String secretRequestHosts(String hosts) {
    return '$hosts 전용';
  }

  @override
  String get secretRequestHelp => '금고로 바로 저장돼요. 봇은 값을 절대 볼 수 없어요.';

  @override
  String secretSaved(String name) {
    return '$name 저장됨';
  }

  @override
  String get secretDeclined => '거절됨';

  @override
  String secretWhat(String service) {
    return '$service 키';
  }

  @override
  String totpWhat(String service) {
    return '$service 로그인 코드';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return '봇에게 돌려줌: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return '$host 로그인 공유됨';
  }

  @override
  String get shareLogin => '로그인 공유';

  @override
  String get shareLoginUsername => '이메일 또는 사용자 이름';

  @override
  String get shareLoginPassword => '비밀번호';

  @override
  String get shareLoginRemember => '다음에도 기억하기';

  @override
  String shareLoginHelp(String host, String bot) {
    return '$host에서만 사용돼요. $bot에게는 비밀번호가 절대 보이지 않아요.';
  }

  @override
  String get shareLoginSave => '저장하고 로그인';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot의 작업에 $host 로그인이 필요해요';
  }

  @override
  String get signInOnPage => '페이지에서 로그인';

  @override
  String loginOnPageLine(String host) {
    return '페이지에서 $host 로그인 중';
  }

  @override
  String get loginOnPageHelp => '페이지에서 로그인한 뒤 ‘봇에게 돌려주기’를 누르세요.';

  @override
  String get back => '뒤로';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '공유되지 않음: 내 캘린더',
      'reminders': '공유되지 않음: 내 미리 알림',
      'contacts': '공유되지 않음: 내 연락처',
      'places': '공유되지 않음: 내 장소',
      'photos': '공유되지 않음: 내 사진',
      'health': '공유되지 않음: 내 건강 데이터',
      'notifications': '공유되지 않음: 내 알림',
      'activity': '공유되지 않음: 내 컴퓨터 활동',
      'browserTab': '공유되지 않음: 내 현재 브라우저 탭',
      'browserHistory': '공유되지 않음: 내 브라우저 방문 기록 및 북마크',
      'alarm': '공유되지 않음: 내 알람',
      'home': '공유되지 않음: 내 홈 액세서리',
      'other': '공유되지 않음: 내 기기 데이터',
    });
    return '$_temp0';
  }

  @override
  String get decline => '거절';

  @override
  String get signInCode => '로그인 코드';

  @override
  String get secretKindValue => '키 또는 비밀번호';

  @override
  String get totpSeedLabel => '설정 키, otpauth:// 링크 또는 현재 표시된 코드';

  @override
  String get totpSeedHelp =>
      '사이트의 2단계 설정에서 받은 설정 키를 입력하면 봇이 이후 코드를 자동으로 생성해요 (봇은 키를 절대 볼 수 없어요). 또는 지금 보이는 코드를 바로 입력하면 봇에게 직접 전달돼요.';

  @override
  String get scanQrCode => 'QR 코드 스캔';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot에게 $service 로그인 코드가 필요해요';
  }

  @override
  String get search => '검색';

  @override
  String get searchHint => '채팅, 기억, 스킬, 티켓, 파일 검색';

  @override
  String get searchEmptyPrompt => '2자 이상 입력해 주세요.';

  @override
  String searchNoResults(String query) {
    return '“$query”에 대한 검색 결과가 없어요.';
  }

  @override
  String get searchMessages => '메시지';

  @override
  String get searchChats => '채팅';

  @override
  String get searchTickets => '티켓';

  @override
  String get searchFiles => '파일';

  @override
  String get searchFilesAsleep =>
      '절전 상태인 컴퓨터의 파일은 검색되지 않아요. 파일을 포함하려면 컴퓨터를 시작하세요.';

  @override
  String get searchJumpHint => '검색 또는 이동…';

  @override
  String get searchRecent => '최근 검색';

  @override
  String get searchClearRecent => '지우기';

  @override
  String get searchRemoveRecent => '최근 검색에서 제거';

  @override
  String get searchJumpBackIn => '이어서 보기';

  @override
  String get searchNeedsYou => '확인 필요';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '확인할 항목 $n개가 기다리고 있어요',
      one: '확인할 항목 1개가 기다리고 있어요',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => '이동';

  @override
  String get searchTopHits => '상위 검색 결과';

  @override
  String get searchScopeAll => '전체';

  @override
  String get searchMemories => '기억';

  @override
  String get searchKeepTyping => '계속 입력해 메시지, 기억, 파일을 검색하세요.';

  @override
  String searchAskBot(String bot, String query) {
    return '$bot에게 “$query”에 대해 물어보기';
  }

  @override
  String get searchAskBotHelp => '이 질문으로 새 채팅을 시작해요';

  @override
  String get searchKeysHint => '↑ ↓ 이동   ↵ 열기   esc 닫기';

  @override
  String get searchClear => '검색 지우기';

  @override
  String get installFor => '설치 대상';

  @override
  String get wholeWorkspace => '전체 워크스페이스';

  @override
  String get skillCatalog => '스킬 카탈로그';

  @override
  String get searchSkills => '스킬 검색';

  @override
  String get all => '전체';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '파일 $countString개',
      one: '파일 1개',
    );
    return '$_temp0';
  }

  @override
  String get install => '설치';

  @override
  String skillInstalled(String name) {
    return '$name 설치됨.';
  }

  @override
  String get noResults => '결과가 없어요.';

  @override
  String get importFromGitHub => 'GitHub에서 가져오기';

  @override
  String get importFromGitHubHelp =>
      'SKILL.md가 있는 폴더 링크를 붙여넣으세요. 설치 전에 모든 파일을 미리 확인할 수 있어요. 비공개 저장소는 api.github.com에 허용된 GITHUB_TOKEN 시크릿을 사용해요.';

  @override
  String get preview => '미리보기';

  @override
  String get skillScriptsNote => '스킬의 스크립트는 서버가 아니라 봇의 컴퓨터에서만 실행돼요.';

  @override
  String get binaryFile => '(바이너리 파일)';

  @override
  String skillUpdate(String name) {
    return '$name 업데이트';
  }

  @override
  String get checkingForUpdates => '업데이트 확인 중…';

  @override
  String get skillUpToDate => '이미 최신 버전이에요.';

  @override
  String get update => '업데이트';

  @override
  String get filesAdded => '추가됨';

  @override
  String get filesChanged => '변경됨';

  @override
  String get filesRemoved => '제거됨';

  @override
  String get fromCatalog => '카탈로그에서';

  @override
  String get savedByBot => '봇이 저장함';

  @override
  String get checkForUpdates => '업데이트 확인';

  @override
  String get attachSkill => '스킬 첨부';

  @override
  String get rerunSetup => '설정 다시 실행';

  @override
  String get rerunSetupHelp => '설정 질문에 다시 답하고 새 제안을 검토해요';

  @override
  String get trace => '추적';

  @override
  String get openTrace => '추적 열기';

  @override
  String get editMessage => '편집';

  @override
  String get editMessageHelp =>
      '보내면 여기부터 대화를 다시 실행해요. 원래 버전은 유지되며 화살표로 전환할 수 있어요.';

  @override
  String get previousVersion => '이전 버전';

  @override
  String get nextVersion => '다음 버전';

  @override
  String get quietHours => '방해 금지 시간';

  @override
  String get quietHoursHelp =>
      '방해 금지 시간이 끝날 때까지 알림이 대기하며, 수신함에는 계속 쌓여요. 현재 보고 있는 채팅의 승인 요청은 바로 전달돼요.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start~$end';
  }

  @override
  String get off => '꺼짐';

  @override
  String get botNotifications => '이 봇의 알림';

  @override
  String get botNotificationsHelp => '이 봇이 내 방해 금지 시간을 따를지 여부예요';

  @override
  String get botMayCall => '전화 걸기 허용';

  @override
  String get botMayCallHelp => '전화할 만한 일이 생기면 이 봇이 전화를 걸 수 있어요. 끄면 대신 알림을 보내요.';

  @override
  String get quietDefault => '내 방해 금지 시간 따르기';

  @override
  String get quietAlways => '항상 알림 받기';

  @override
  String get quietCustom => '자체 방해 금지 시간 사용';

  @override
  String get from => '시작';

  @override
  String get until => '종료';

  @override
  String get shareAsTemplate => '템플릿으로 공유';

  @override
  String get shareAsTemplateRow => '지침, 스킬, 루틴이 담긴 파일 또는 링크';

  @override
  String get shareAsTemplateHelp =>
      '지침, 스킬, 루틴, 사용 중인 서비스가 포함돼요. 키나 시크릿은 절대 포함되지 않아요.';

  @override
  String get copyLink => '링크 복사';

  @override
  String get includeMemories => '기억 포함';

  @override
  String get includeMemoriesHelp => '봇이 나에 대해 배운 내용이에요. 주의해서 공유하세요.';

  @override
  String get saveAsFile => '파일로 저장';

  @override
  String get notABotTemplate => 'Casama 봇 템플릿 파일이 아니에요.';

  @override
  String get importBot => '봇 가져오기';

  @override
  String botImported(String name) {
    return '$name 준비 완료.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name 준비 완료. 봇이 사용할 수 있도록 ‘연동’에서 $services 연결을 설정하세요.';
  }

  @override
  String get whatComesWithIt => '포함된 항목';

  @override
  String get connectAfterImport => '가져온 후 연결';

  @override
  String get importRoutines => '루틴 일정 예약';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기억 $countString개 유지',
      one: '기억 1개 유지',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => '루틴 시작 중…';

  @override
  String get offlineSaved => '오프라인 상태예요. 저장된 메시지를 표시하고 있어요.';

  @override
  String get loadEarlierMessages => '이전 메시지';

  @override
  String get chatLoadFailedTitle => '이 채팅을 불러오지 못했어요';

  @override
  String get chatLoadFailedBody => '연결 상태를 확인한 뒤 다시 시도해 주세요.';

  @override
  String get projects => '프로젝트';

  @override
  String get newProject => '새 프로젝트';

  @override
  String get noProjects => '아직 프로젝트가 없어요';

  @override
  String get projectsHelp =>
      '프로젝트는 채팅, 계획, 할 일, 파일, 그리고 프로젝트에서 만든 모든 결과물을 한곳에 모아 둬요. 봇과 함께 작업하거나, 봇이 계획을 세우고 혼자 진행하도록 맡길 수 있어요.';

  @override
  String get newProjectHelp =>
      '채팅, 계획, 할 일, 파일, 그리고 프로젝트에서 만든 모든 결과물을 한곳에 모아 둬요.';

  @override
  String get startPlanning => '계획 시작';

  @override
  String get projectTitle => '제목';

  @override
  String get projectGoal => '목표';

  @override
  String get projectDoneWhen => '완료 기준';

  @override
  String get projectLead => '담당 봇';

  @override
  String get projectBudget => '예산';

  @override
  String get projectGoalHint => '최종적으로 어떤 결과물이 나와야 하나요? 예: 내 도메인에 랜딩 페이지 게시…';

  @override
  String get projectDoneHint => '선택 사항. 완료 여부를 판단할 기준이에요';

  @override
  String get projectBudgetHint => '선택 사항. 예산을 모두 쓰면 작업이 일시 정지돼요';

  @override
  String get projectThread => '프로젝트 채팅';

  @override
  String get approvePlan => '계획 승인';

  @override
  String get pause => '일시 정지';

  @override
  String get resume => '재개';

  @override
  String get milestones => '마일스톤';

  @override
  String get needsSignoff => '승인이 필요해요';

  @override
  String get signOff => '완료 승인';

  @override
  String get projectPlan => '계획';

  @override
  String get tickets => '티켓';

  @override
  String get projectTimeline => '타임라인';

  @override
  String get projectPlanning => '계획 중';

  @override
  String get projectActive => '진행 중';

  @override
  String get projectPaused => '일시 정지됨';

  @override
  String get projectBlocked => '차단됨';

  @override
  String get projectDone => '완료';

  @override
  String get projectCancelled => '취소됨';

  @override
  String get projectName => '이름';

  @override
  String get projectNameHint => '우주 피하기 게임, 봄 뉴스레터…';

  @override
  String get createProject => '프로젝트 만들기';

  @override
  String projectWorksAlone(String bot) {
    return '$bot 봇이 혼자 진행하도록 맡기기';
  }

  @override
  String get projectWorksAloneHelp =>
      '봇이 승인받을 계획을 초안으로 작성한 뒤, 목표를 달성할 때까지 세션 단위로 작업해요. 승인하기 전에는 아무것도 시작되지 않아요.';

  @override
  String get projectWorksAloneOn => '목표를 달성할 때까지 세션 단위로 작업해요.';

  @override
  String get projectWorksAloneOff => '채팅에서 함께 작업해요.';

  @override
  String get projectMade => '이 프로젝트에서 만든 항목';

  @override
  String projectMadeEmpty(String bot) {
    return '아직 아무것도 없어요. 이 프로젝트의 채팅에서 $bot 봇이 만든 결과물이 여기에 표시돼요.';
  }

  @override
  String get projectSeeAll => '전체 보기';

  @override
  String get projectTodos => '할 일';

  @override
  String get projectFiles => '파일';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$bot의 컴퓨터 내 $folder';
  }

  @override
  String get projectMarkDone => '완료로 표시';

  @override
  String get projectReopen => '다시 열기';

  @override
  String get projectCover => '커버';

  @override
  String get projectCoverNone => '없음';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': '범선',
      'mountain': '산',
      'seedling': '새싹',
      'compass': '나침반',
      'lantern': '랜턴',
      'telescope': '망원경',
      'map': '지도',
      'chess': '체스',
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
      other: '$countString개',
      one: '1개',
      zero: '아직 없음',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => '프로젝트';

  @override
  String get creationMoveToProject => '프로젝트로 이동';

  @override
  String get creationNoProject => '프로젝트 없음';

  @override
  String get makeProject => '프로젝트로 만들기';

  @override
  String get makeProjectTitle => '이 주제를 프로젝트로 만들기';

  @override
  String makeProjectHelp(String bot) {
    return '이 주제에서 $bot 봇이 만든 결과물이 이 프로젝트로 정리되며, 앞으로 여기서 만드는 것도 함께 모여요.';
  }

  @override
  String get openProject => '프로젝트 열기';

  @override
  String get theBot => '봇';

  @override
  String get forYou => '내 소식';

  @override
  String get inboxNeedsYou => '확인 필요';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '확인 필요 ($nString)';
  }

  @override
  String get inboxBriefs => '브리핑';

  @override
  String get inboxUpdates => '업데이트';

  @override
  String get inboxEmptyHelp => '봇의 요청, 아침 브리핑, 알림, 새로 만든 페이지가 여기에 모여요.';

  @override
  String get inboxNeedsYouEmpty => '지금은 확인할 항목이 없어요';

  @override
  String get inboxNeedsYouEmptyHelp =>
      '봇이 결정이나 도움이 필요하거나 제안할 아이디어가 있을 때 여기에 표시돼요.';

  @override
  String get noBriefs => '아직 아침 브리핑이 없어요';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot 봇이 “$title” 게시';
  }

  @override
  String get forYouEmpty => '지금은 새 소식이 없어요';

  @override
  String get forYouEmptyHelp => '아침 브리핑과 하루 중 제안을 받으려면 봇 설정에서 ‘먼저 말 걸기’를 켜세요.';

  @override
  String morningBriefFrom(String name) {
    return '$name의 아침 브리핑';
  }

  @override
  String get suggestions => '제안';

  @override
  String suggestedBy(String name) {
    return '$name의 제안';
  }

  @override
  String get dismissSuggestion => '이 제안을 닫을까요?';

  @override
  String dismissSuggestionHelp(String bot) {
    return '$bot 봇이 나중에 다시 제안할 수 있을지 선택하세요.';
  }

  @override
  String get justThisOnce => '이번 한 번만';

  @override
  String justThisOnceHelp(String bot) {
    return '일단은 숨겨 둬요. 나중에 여전히 중요하다면 $bot 봇이 다시 제안할 수 있어요.';
  }

  @override
  String get dontSuggestAgain => '다시 제안하지 않기';

  @override
  String dontSuggestAgainHelp(String bot) {
    return '영구히 숨겨요. 원하지 않는다는 점을 $bot 봇이 기억해요.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return '알겠어요. $bot 봇이 다시는 그 제안을 하지 않을 거예요.';
  }

  @override
  String get doIt => '실행하기';

  @override
  String get checkins => '먼저 말 걸기';

  @override
  String get checkinsHelp =>
      '아침 브리핑을 보내고, 몇 시간마다 내가 확인해야 할 일이 있는지 살펴봐요. 기본값은 꺼짐이에요.';

  @override
  String get briefTime => '아침 브리핑 시각';

  @override
  String get scanEvery => '확인 간격';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString시간',
      one: '1시간',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => '일일 한도';

  @override
  String get on => '켜짐';

  @override
  String get actionRules => '작업 규칙';

  @override
  String get actionRulesRow => '묻지 않고 할 수 있는 작업';

  @override
  String get actionRulesHelp =>
      '규칙은 작업별로 허용, 한도 내 허용, 먼저 물어보기, 직접 마무리하도록 넘기기 중 하나를 정해요. 가장 구체적인 규칙이 우선하며, 규칙이 없으면 봇의 자율성 수준을 따라요. 봇은 자신의 규칙을 바꿀 수 없어요.';

  @override
  String get addRule => '규칙 추가';

  @override
  String get addRuleHelp => '봇이 하려는 작업과 처리 방식을 선택하세요.';

  @override
  String get noRules => '아직 규칙이 없어요. 봇의 자율성 수준에 따라 결정돼요.';

  @override
  String get otherTools => '특정 도구';

  @override
  String get workspaceRule => '워크스페이스 규칙';

  @override
  String get catSend => '메시지 보내기';

  @override
  String get catPay => '결제';

  @override
  String get catDelete => '삭제';

  @override
  String get catPublish => '게시';

  @override
  String get catShare => '공유 및 초대';

  @override
  String get catSignIn => '로그인';

  @override
  String get whenTheBot => '봇이 다음 작업을 할 때';

  @override
  String get itShould => '처리 방법';

  @override
  String get ruleAllow => '바로 진행';

  @override
  String get ruleAllowLimits => '한도 내에서 바로 진행';

  @override
  String get ruleAsk => '먼저 물어보기';

  @override
  String get ruleHandOff => '내가 마무리하도록 넘기기';

  @override
  String get ruleDomains => '다음 도메인으로만 (쉼표로 구분)';

  @override
  String get ruleMaxAmount => '최대 금액';

  @override
  String get ruleForWorkspace => '워크스페이스의 모든 봇에 적용';

  @override
  String get watchers => '지켜보기 목록';

  @override
  String get watchersRow => '지켜보고 있는 항목';

  @override
  String get noWatchers => '지켜보고 있는 항목이 없어요';

  @override
  String get watchersHelp =>
      '봇에게 “…할 때 알려줘”라고 말하면 페이지, 답장, 결과 또는 시간을 지켜봐요. 변화가 생기기 전까지는 비용이 들지 않아요.';

  @override
  String get watcherActive => '지켜보는 중';

  @override
  String get watcherPaused => '일시 정지됨';

  @override
  String get watcherDone => '완료';

  @override
  String get watcherExpired => '만료됨';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString회 실행됨',
      one: '1회 실행됨',
      zero: '아직 실행 안 됨',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'AI 앱 연결';

  @override
  String connectAiAppAsk(String app) {
    return '$app에서 Casama 사용을 요청해요';
  }

  @override
  String get connectAiAppHelpShort =>
      '선택한 워크스페이스에서 내 권한으로 봇 목록을 보고, 작업을 요청하고, 결과를 읽을 수 있어요. 봇의 승인과 규칙은 그대로 적용돼요.';

  @override
  String get connectAiAppSendsTo => '허용하면 돌아갈 위치';

  @override
  String get connectAiAppUnknown =>
      'Casama에서 인식하지 못한 주소예요. 앱 이름은 누구나 마음대로 지을 수 있으므로 직접 연결을 시작했고 이 사이트를 신뢰하는 경우에만 허용하세요.';

  @override
  String get connectAiAppDone => '완료되었어요. AI 앱으로 돌아갈 수 있어요.';

  @override
  String get refuse => '거부';

  @override
  String get allow => '허용';

  @override
  String get connectAiApps => 'AI 앱 연결';

  @override
  String get connectAiAppsHelp =>
      'MCP를 지원하는 앱은 이 주소에 연결해 로그인하거나 API 키를 사용해요. 연결한 사람의 권한으로 작동해요.';

  @override
  String get connectedAiApps => '연결된 AI 앱';

  @override
  String get connectedAiAppsHelp =>
      '로그인해서 연결한 앱들이에요. 연결을 해제하면 즉시 이 워크스페이스 접근 권한을 잃어요.';

  @override
  String get connectedAiAppsAdminHelp =>
      '이 워크스페이스 멤버들이 로그인해서 연결한 앱들이에요. 연결을 해제하면 즉시 접근 권한을 잃어요.';

  @override
  String get noConnectedAiApps => '아직 연결된 AI 앱이 없어요.';

  @override
  String mcpConnectionUsed(String when) {
    return '마지막 사용: $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return '연결됨: $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      '이 워크스페이스에서 즉시 작동이 멈춰요. 다시 사용하려면 해당 앱에서 새로 연결하세요.';

  @override
  String get mcpApprovals => 'AI 앱의 승인 허용';

  @override
  String get mcpApprovalsHelp => '연결된 앱이 내 봇의 작업을 승인할 수 있어요.';

  @override
  String get newApiKey => '새 API 키';

  @override
  String get apiKeyName => '이름';

  @override
  String get newGroupChat => '새 그룹 채팅';

  @override
  String get groupChats => '그룹 채팅';

  @override
  String groupWhoAnswers(String names) {
    return '$names 응답 예정';
  }

  @override
  String get groupEveryoneAnswers => '모두 응답 예정';

  @override
  String get groupMentionHint => '봇을 @멘션하거나 @everyone을 입력하세요';

  @override
  String routineRan(String name) {
    return '루틴 “$name” 실행됨';
  }

  @override
  String groupBotCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $countString개',
      one: '봇 1개',
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
      other: '확인할 항목 $countString개',
      one: '확인할 항목 1개',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      '봇 2~10개를 한 채팅에 모아 보세요. @이름은 한 봇에게만, @everyone은 대표 봇에게 계획을 세워 일을 나누어 달라고 요청해요.';

  @override
  String get groupCreate => '그룹 채팅 만들기';

  @override
  String get groupCrewEmpty => '아래에서 그룹에 넣을 봇을 선택하세요.';

  @override
  String get groupLeadShort => '대표';

  @override
  String get groupMakeLead => '대표로 지정';

  @override
  String groupRemoveBot(String name) {
    return '$name 제거';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $count개 더 선택하세요',
      one: '봇 1개 더 선택하세요',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => '그룹 채팅에는 최대 10개의 봇까지 넣을 수 있어요.';

  @override
  String get groupLeadHint =>
      '@everyone을 입력하면 대표 봇이 작업을 계획해요. 상단에서 다른 봇을 눌러 대표를 바꿀 수 있어요.';

  @override
  String get groupNeedTwoBots => '그룹 채팅에는 최소 2개의 봇이 필요해요. 먼저 다른 봇을 만들어 주세요.';

  @override
  String get groupSearchBots => '봇 검색';

  @override
  String get groupNoMatch => '그 이름과 일치하는 봇이 없어요.';

  @override
  String get groupTitle => '이름 (선택)';

  @override
  String get groupPickBots => '봇';

  @override
  String get groupLead => '그룹 대표';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => '페이지';

  @override
  String get pagesRow => '봇이 게시한 보고서와 대시보드';

  @override
  String get noPages => '아직 페이지가 없어요';

  @override
  String get pagesHelp =>
      '봇에게 보고서, 대시보드, 트래커를 만들어 달라고 하면 페이지로 게시할 수 있어요. 페이지는 브라우저에서 열리며, 공유하기 전까지는 비공개로 유지돼요.';

  @override
  String get pagePrivate => '나만 보기';

  @override
  String get pageWorkspace => '워크스페이스';

  @override
  String get pagePublic => '링크가 있는 모든 사람';

  @override
  String get pageRefreshes => '일정에 따라 새로고침됨';

  @override
  String get pageCardOpen => '페이지 · 눌러서 열기';

  @override
  String get exportPdf => 'PDF 내보내기';

  @override
  String get pageMakePublicTitle => '이 페이지를 공개할까요?';

  @override
  String get pageMakePublicBody =>
      '링크가 있는 누구나 페이지 안의 데이터를 포함해 열람할 수 있어요. 언제든 비공개로 되돌릴 수 있으며, 그러면 링크 작동이 멈춰요.';

  @override
  String get pageMakePublic => '공개하기';

  @override
  String get pagePublicLinkTitle => '공개 링크';

  @override
  String get pagePublicLinkBody => '복사되었어요. 검색 엔진에는 노출되지 않아요.';

  @override
  String deletePageTitle(String title) {
    return '“$title” 삭제할까요?';
  }

  @override
  String get openPages => '페이지에서 열기';

  @override
  String get discard => '버리기';

  @override
  String get discardChangesTitle => '변경 사항을 버릴까요?';

  @override
  String get discardChangesBody => '수정한 내용이 저장되지 않았어요.';

  @override
  String get keepEditing => '계속 편집';

  @override
  String get teachTask => '작업 가르치기';

  @override
  String get teachWhichBot => '어느 봇에게 가르칠까요?';

  @override
  String get teachRecording => '녹화 중';

  @override
  String get teachRecordingPaused => '녹화 중지됨';

  @override
  String get teachRecordingHelp =>
      '평소처럼 작업을 직접 해 보세요. 화면에 표시된 내용과 함께 각 단계가 저장되며, 비밀번호 입력란은 절대 저장되지 않아요.';

  @override
  String get teachStop => '중지';

  @override
  String get teachMarkSecret => '시크릿으로 표시';

  @override
  String get teachMarkSecretHelp =>
      '방금 입력한 내용은 녹화에서 지워지고, 대신 봇이 필요할 때 요청하는 시크릿 입력값이 돼요.';

  @override
  String get teachDraftTitle => '새 스킬';

  @override
  String get teachDrafting => '녹화 내용을 바탕으로 스킬 작성 중…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString단계',
      one: '1단계',
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
      other: '$countString단계',
      one: '1단계',
    );
    return '시범 보인 내용 ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      '단계, 입력값, 성공 확인 조건을 검토한 뒤 저장하세요. 바로 시험해 볼 수 있어요.';

  @override
  String get teachDraftFailed =>
      '봇이 초안을 작성하지 못했어요. 아래 녹화 내용을 보고 직접 단계를 작성하거나 버리세요.';

  @override
  String get teachAlreadySaved => '이 스킬이 저장되었어요';

  @override
  String get teachSaveAndTry => '저장하고 실행';

  @override
  String teachSaved(String name) {
    return '$name 저장됨';
  }

  @override
  String get teachDiscardTitle => '이 녹화를 버릴까요?';

  @override
  String get teachDiscardBody => '캡처된 모든 단계, 스냅샷, 스크린샷이 삭제돼요.';

  @override
  String teachStepClick(int x, int y) {
    return '$x, $y 위치 클릭';
  }

  @override
  String teachStepType(String text) {
    return '“$text” 입력';
  }

  @override
  String teachStepSecret(String name) {
    return '시크릿 $name 입력';
  }

  @override
  String teachStepKey(String key) {
    return '$key 키 누르기';
  }

  @override
  String get teachStepScroll => '스크롤';

  @override
  String get plugins => '플러그인';

  @override
  String get pluginsRow => '플러그인 패키지의 스킬과 도구';

  @override
  String get noPlugins => '아직 플러그인이 없어요';

  @override
  String get pluginsHelp =>
      '플러그인은 GitHub의 Agent Plugins 1.0 패키지예요. 스킬과 MCP 도구를 추가할 수 있으며, 서버는 Casama 서버가 아니라 이 봇의 컴퓨터에서 실행돼요.';

  @override
  String get addPlugin => '플러그인 추가';

  @override
  String get addPluginHelp =>
      '플러그인 폴더의 GitHub 링크를 붙여넣으세요. 설치되기 전에 무엇이 추가되는지 먼저 볼 수 있어요.';

  @override
  String get pluginAdds => '추가되는 항목';

  @override
  String pluginStdio(String command) {
    return '봇의 컴퓨터에서 실행: $command';
  }

  @override
  String pluginRemote(String url) {
    return '$url에 연결됨';
  }

  @override
  String pluginTalksTo(String hosts) {
    return '통신 대상: $hosts';
  }

  @override
  String get pluginSkill => '스킬';

  @override
  String get pluginHosts => '네트워크';

  @override
  String get pluginServerError => '시작할 수 없어요';

  @override
  String get pluginRunsOnComputer => '봇의 컴퓨터에서 실행';

  @override
  String get pluginWhereToolsRun => '도구가 실행되는 위치';

  @override
  String get pluginWhereToolsRunHelp =>
      '내 컴퓨터에서는 도구가 그 컴퓨터에 있는 것을 사용할 수 있고, 내 채팅에서 나만 쓸 수 있어요. 인터넷에 있는 서버에는 영향이 없어요.';

  @override
  String get pluginPlaceBot => '봇의 컴퓨터';

  @override
  String pluginPlaceMine(String name) {
    return '내 컴퓨터: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return '$name에서 실행';
  }

  @override
  String get pluginRunsOnDeviceHelp => '이 도구는 해당 컴퓨터 소유자와의 채팅에서만 작동해요';

  @override
  String get pluginRunsOnDeviceOffline =>
      '오프라인: 해당 기기에서 Casama 앱을 열면 도구가 다시 작동해요';

  @override
  String get pluginUpToDate => '이미 최신 버전이에요';

  @override
  String get checkForUpdate => '업데이트 확인';

  @override
  String get uninstall => '설치 제거';

  @override
  String uninstallPluginTitle(String name) {
    return '$name 플러그인을 제거할까요?';
  }

  @override
  String get uninstallPluginBody => '이 봇에서 해당 플러그인의 스킬, 도구, 파일, 저장된 시크릿이 제거돼요.';

  @override
  String updatePluginTitle(String name) {
    return '$name 업데이트';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return '새 스킬: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return '변경된 스킬: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return '제거된 스킬: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return '새 도구 서버: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return '변경된 도구 서버: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return '제거된 도구 서버: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return '새로 통신하는 호스트: $hosts';
  }

  @override
  String get pluginDiffNone => '추가되는 항목에 변경이 없어요.';

  @override
  String get next => '다음';

  @override
  String get botNameLabel => '이름';

  @override
  String get importAgent => '에이전트 가져오기';

  @override
  String get importAgentHelp =>
      'OpenClaw 또는 Hermes Agent에서 봇을 가져오거나, Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct의 설정을 붙여넣으세요. 페르소나, 스킬, 일정, 기억이 함께 가져와지며, 생성되기 전에 모든 내용을 직접 확인해요. 키와 설정 파일은 절대 읽지 않아요.';

  @override
  String get importAgentPickFolder => '폴더 선택';

  @override
  String get importAgentPickZip => '폴더의 ZIP 파일 업로드';

  @override
  String get importPasteChoice => '봇 설정 붙여넣기';

  @override
  String get importPasteChoiceHelp =>
      'Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct 또는 다른 앱에서';

  @override
  String get importPasteTitle => '봇 설정 붙여넣기';

  @override
  String get importPasteHelp =>
      '봇에게 아래 프롬프트를 보낸 뒤 전체 답장을 붙여넣으세요. 새 봇이 만들어지기 전에 모든 내용을 확인할 수 있어요.';

  @override
  String get importPasteSource => '봇이 현재 어디에 있나요?';

  @override
  String get importPasteOther => '다른 곳';

  @override
  String get importPasteStep1 => '1. 봇에게 이 프롬프트를 보내세요';

  @override
  String get importPasteReply => '2. 답장을 붙여넣으세요';

  @override
  String get importPasteSafety =>
      '키, 비밀번호, 카드 번호처럼 보이는 줄은 자동으로 제거돼요. 가져온 뒤에는 봇이 쓰는 앱에 다시 로그인해 주세요.';

  @override
  String get importPasteSubtitle => '붙여넣은 설정';

  @override
  String get agentImportReviewHelp =>
      '원하지 않는 항목은 체크를 해제하세요. 가져오기를 누르기 전까지는 아무것도 생성되지 않아요.';

  @override
  String get agentImportNoPersona => '페르소나 파일을 찾을 수 없어요.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스킬 $countString개',
      one: '스킬 1개',
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
      other: '루틴 $countString개',
      one: '루틴 1개',
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
      other: '기억 $countString개',
      one: '기억 1개',
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
      other: '다른 파일 $countString개',
      one: '다른 파일 1개',
    );
    return '봇 컴퓨터의 ~/imported/ 폴더로 $_temp0 복사';
  }

  @override
  String agentImportSkipped(String files) {
    return '가져오지 않음: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$name 봇을 가져오고 파일 $countString개를 컴퓨터로 복사했어요';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$name 봇을 가져왔어요. 나머지 파일은 아직 복사하지 못했어요. 컴퓨터를 연결한 뒤 다시 가져오면 복사할 수 있어요.';
  }

  @override
  String get importMemoryTitle => 'ChatGPT 또는 Claude에서 기억 가져오기';

  @override
  String get importMemoryHelp =>
      '이 프롬프트를 ChatGPT 또는 Claude에 복사해 입력한 뒤, 아래에 답장을 붙여넣으세요.';

  @override
  String get importMemoryPick => '맞는 내용은 남기고 나머지는 체크를 해제하세요.';

  @override
  String get importMemoryPaste => '답장 내용';

  @override
  String get importMemoryNone => '해당 답장에서 기억을 찾지 못했어요.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기억 $countString개 추가됨',
      one: '기억 1개 추가됨',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => '루틴 및 스킬 파일로 관리';

  @override
  String get routinesAsFilesHelp =>
      '모든 루틴과 스킬을 Markdown 파일로 관리해요. 내보내서 어디서든 편집하고 다시 가져오거나 GitHub 저장소에 보관할 수 있어요.';

  @override
  String get exportFiles => '파일로 내보내기';

  @override
  String get importFiles => '파일 가져오기';

  @override
  String get importFilesApply => '적용';

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

    return '새 항목 $createdString개, 변경 $updatedString개, 변경 없음 $unchangedString개';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return '가져오기 완료: 새 항목 $createdString개, 변경 $updatedString개';
  }

  @override
  String get gitSync => 'Git 동기화';

  @override
  String get gitSyncOff => '꺼짐';

  @override
  String get gitSyncHelp =>
      'Casama에서의 변경 사항이 저장소에 커밋되고, 저장소에 푸시하면 검증 후 Casama에 반영돼요. 양쪽에서 파일이 모두 변경된 경우 Casama 버전을 유지하고 풀 리퀘스트를 열어요. api.github.com에 허용된 GITHUB_TOKEN 시크릿이 필요해요.';

  @override
  String get gitSyncNeedsToken => 'GITHUB_TOKEN 시크릿이 필요해요';

  @override
  String gitSyncedWhen(String when) {
    return '동기화됨: $when';
  }

  @override
  String get gitSyncPr => '확인 대기 중인 풀 리퀘스트';

  @override
  String get syncNow => '지금 동기화';

  @override
  String get syncQueued => '1분 내에 동기화 예정';

  @override
  String get gitBranch => '브랜치';

  @override
  String get gitFolder => '저장소 내 폴더 (선택)';

  @override
  String get gitSyncOn => '동기화 켜짐';

  @override
  String get gitSyncRemove => '동기화 중지';

  @override
  String get gitWebhookTitle => '저장소에 이 웹훅 추가';

  @override
  String get gitWebhookHelp =>
      '저장소 설정에서 이 주소와 시크릿으로 push 이벤트 웹훅을 추가하세요 (콘텐츠 형식 application/json). 시크릿은 지금만 표시돼요.';

  @override
  String get gitWebhookUrl => 'Payload URL';

  @override
  String get gitWebhookSecret => '시크릿';

  @override
  String get knowledge => '지식';

  @override
  String get knowledgeRow => '봇이 검색하고 인용할 수 있는 문서';

  @override
  String get noKnowledge => '아직 지식이 없어요';

  @override
  String get knowledgeHelp =>
      '파일, 웹사이트 또는 GitHub 저장소를 등록하세요. 필요할 때 내용을 검색하고 어떤 문서에서 답을 찾았는지 알려줘요.';

  @override
  String get addKnowledge => '지식 추가';

  @override
  String get addKnowledgeHelp =>
      'PDF, Word, Markdown, HTML, CSV, 텍스트 파일이나 웹사이트(하나의 도메인, robots.txt 준수) 또는 저장소의 문서를 추가할 수 있어요. 웹사이트와 저장소는 매일 새로고침돼요.';

  @override
  String get knowledgeFiles => '파일';

  @override
  String get knowledgeWebsite => '웹사이트';

  @override
  String get knowledgePickFiles => '파일 선택';

  @override
  String get knowledgeWebsiteUrl => '웹사이트 주소';

  @override
  String get knowledgeRepoUrl => 'GitHub 링크';

  @override
  String get knowledgeShareAll => '워크스페이스의 모든 봇과 공유';

  @override
  String get knowledgeShared => '전체 워크스페이스';

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
      other: '문서 $docsString개',
      one: '문서 1개',
    );
    return '$_temp0, 구절 $chunksString개';
  }

  @override
  String get knowledgeError => '읽을 수 없어요';

  @override
  String get knowledgeSyncing => '읽는 중…';

  @override
  String get knowledgePending => '읽기 대기 중';

  @override
  String get add => '추가';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot 봇의 스킬 제안: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot 봇의 $name 개선 제안';
  }

  @override
  String skillUsesTools(String tools) {
    return '사용 도구: $tools';
  }

  @override
  String get saveSkill => '스킬 저장';

  @override
  String get applyEdit => '변경 적용';

  @override
  String skillSaved(String name) {
    return '$name 저장됨';
  }

  @override
  String skillUpdated(String name) {
    return '$name 업데이트됨';
  }

  @override
  String get skillStats => '사용 현황';

  @override
  String get skillNotUsedYet => '아직 사용되지 않음';

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

    return '$usesString회 사용 · 성공률 $rateString% · 실패 $failuresString회 · 수정 $correctionsString회';
  }

  @override
  String skillLastFailure(String date) {
    return '마지막 오류: $date';
  }

  @override
  String get skillHistory => '이전 버전';

  @override
  String get replays => '리플레이';

  @override
  String get replaysRow => '생각할 필요 없이 바로 실행하는 녹화된 단계';

  @override
  String get noReplays => '아직 리플레이가 없어요';

  @override
  String get replaysHelp =>
      '리플레이는 봇이 그대로 실행하는 브라우저 또는 데스크톱 단계 기록으로, 더 빠르고 저렴해요. 더 이상 작동하지 않는 단계가 있으면 거기서부터 봇이 직접 조작해 이어서 처리하고 리플레이를 업데이트할 수 있어요. 작업 가르치기 녹화에서 저장하거나, 봇에게 방금 한 일을 저장해 달라고 해 보세요.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString단계',
      one: '1단계',
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
      other: '$runsString회 실행',
      one: '1회 실행',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '도움 필요 $failuresString회',
      one: '도움 필요 1회',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return '$name 실행';
  }

  @override
  String get runReplayHelp => '입력될 값을 확인한 뒤 실행하세요.';

  @override
  String get run => '실행';

  @override
  String get saveAsReplay => '리플레이로도 저장';

  @override
  String replaySaved(String name) {
    return '리플레이 $name 저장됨';
  }

  @override
  String get passwordManagers => '비밀번호 관리자';

  @override
  String get passwordManagersRow => '봇용 1Password 또는 Bitwarden 로그인';

  @override
  String get noPasswordManagers => '연결된 비밀번호 관리자가 없어요';

  @override
  String get passwordManagersHelp =>
      '선택한 금고의 로그인 정보로 봇이 로그인할 수 있어요. 비밀번호는 봇에게 절대 보이지 않으며, 해당 로그인의 사이트에서만 브라우저에 입력돼요.';

  @override
  String get connectPasswordManager => '비밀번호 관리자 연결';

  @override
  String get pmWorkspace => '전체 워크스페이스';

  @override
  String get pmJustMe => '나만';

  @override
  String get pmNoVaults => '아직 선택한 금고가 없어요';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '금고 $countString개',
      one: '금고 1개',
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
      other: '로그인 $countString개',
      one: '로그인 1개',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp => '서비스 계정의 토큰으로 1Password Connect 서버를 사용해요.';

  @override
  String get pmBitwardenHelp =>
      '조직 컬렉션용 Bitwarden Vault Management API(bw serve)를 사용해요.';

  @override
  String get pmConnectUrl => 'Connect 서버 주소';

  @override
  String get pmConnectToken => 'Connect 토큰';

  @override
  String get pmBwUrl => 'bw serve 주소';

  @override
  String get pmBwToken => '액세스 토큰 (선택)';

  @override
  String get pmForWorkspace => '전체 워크스페이스용';

  @override
  String get pmChooseVaults => '봇이 사용할 수 있는 금고';

  @override
  String get pmChooseVaultsHelp => '체크한 금고 또는 컬렉션에 있는 로그인 정보만 봇이 사용할 수 있어요.';

  @override
  String get welcomeGettingReady => '공간을 준비하고 있어요…';

  @override
  String get setUpManually => '직접 설정';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get inviteLinkCopied => '초대 링크가 복사되었어요. 함께 일하는 사람들에게 보내세요.';

  @override
  String get inviteFriends => '친구 초대';

  @override
  String inviteFriendsRow(String amount) {
    return '친구가 가입할 때마다 무료 사용량 $amount 적립';
  }

  @override
  String get inviteFriendsRowPlain => '친구에게 Casama 공유하기';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Casama를 선물하고 $amount 받기';
  }

  @override
  String get inviteFriendsHeadlinePlain => '친구에게 Casama 공유';

  @override
  String inviteFriendsHelp(String amount) {
    return '친구에게 링크를 보내세요. 친구가 가입하고 첫 채팅을 마치면 무료 사용량 $amount만큼 받을 수 있어요.';
  }

  @override
  String get inviteFriendsHelpPlain => '친구에게 링크를 보내세요. 바로 가입할 수 있어요.';

  @override
  String get inviteFriendsYourCode => '내 초대 코드예요. 눌러서 복사하세요.';

  @override
  String get inviteFriendsShare => '링크 공유';

  @override
  String get inviteFriendsCopyLink => '링크 복사';

  @override
  String get inviteFriendsCopied => '복사되었어요. 친구에게 보내세요.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'AI 팀원이 일을 척척 처리해 주는 Casama를 함께 써 보세요: $link (초대 코드 $code)';
  }

  @override
  String get inviteFriendsProgress => '내 초대 현황';

  @override
  String get inviteFriendsJoined => '가입한 친구';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString명이 아직 첫 채팅을 마치지 않았어요',
      one: '1명이 아직 첫 채팅을 마치지 않았어요',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => '적립된 무료 사용량';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '보상을 더 받을 수 있는 친구가 $countString명 남았어요',
      one: '보상을 더 받을 수 있는 친구가 1명 남았어요',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached => '초대로 받을 수 있는 최대 보상을 모두 받았어요. 감사합니다!';

  @override
  String get inviteFriendsHow => '이용 방법';

  @override
  String get inviteFriendsStep1 => '친구에게 링크나 코드를 공유하세요';

  @override
  String get inviteFriendsStep2 => '친구가 가입하고 일주일 안에 내 코드를 입력해요';

  @override
  String inviteFriendsStep3(String amount) {
    return '친구가 첫 채팅을 마치면 무료 사용량 $amount만큼 받아요';
  }

  @override
  String get inviteFriendsStep3Plain => '친구가 자신만의 AI 팀원과 함께 바로 시작해요';

  @override
  String get inviteFriendsUnavailable => '이 서버에서는 초대를 사용할 수 없어요.';

  @override
  String get referralHaveCode => '친구의 코드가 있나요?';

  @override
  String get referralCodeHint => '초대 코드';

  @override
  String get referralUse => '사용';

  @override
  String get referralRedeemed => '초대 코드가 적용되었어요. Casama에 오신 걸 환영해요!';

  @override
  String referralRedeemedFrom(String name) {
    return '$name 님의 초대로 참여했어요. Casama에 오신 걸 환영해요!';
  }

  @override
  String referralJoinedThrough(String name) {
    return '$name 님의 초대로 참여했어요.';
  }

  @override
  String get referralJoinedThroughFriend => '친구의 초대로 참여했어요.';

  @override
  String referralInvitedBy(String name) {
    return '$name 님이 초대했어요';
  }

  @override
  String get referralInvitedByFriend => '친구가 초대했어요';

  @override
  String get referralWelcomeTitle => 'Casama에 오신 걸 환영해요';

  @override
  String get referralWelcomeHelp =>
      '전용 컴퓨터에서 나를 위해 일하는 AI 팀원이에요. 초대를 수락하면 친구가 크레딧을 받아요.';

  @override
  String get referralAccept => '초대 수락';

  @override
  String get referralGetStarted => '시작하기';

  @override
  String get referralInvalid => '사용할 수 없는 초대예요';

  @override
  String get referralInvalidHelp =>
      '코드를 잘못 입력했을 수 있어요. 그래도 가입해서 Casama를 이용할 수 있어요.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return '$amount 선물하고 $amount 받기';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return '친구에게 링크를 보내세요. 친구가 내 코드로 가입하고 첫 채팅을 마치면 친구와 나 모두 무료 사용량 $amount씩 받아요.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return '친구에게 링크를 보내세요. 친구가 내 코드로 가입하고 첫 채팅을 마치면 나는 무료 사용량 $reward, 친구는 $welcome만큼 받아요.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return '친구가 첫 채팅을 마치면 친구와 나 모두 무료 사용량 $amount씩 받아요';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return '친구가 첫 채팅을 마치면 나는 $reward, 친구는 $welcome만큼 받아요';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'AI 팀원이 일을 척척 처리해 주는 Casama를 함께 써 보세요. 초대 코드 $code 입력하고 가입하면 무료 사용량 $amount만큼 받을 수 있어요: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return '가입 후 일주일 안에 입력하면 첫 채팅 후 무료 사용량 $amount만큼 받아요.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return '환영 보너스 $amount 크레딧이 워크스페이스에 지급되었어요.';
  }

  @override
  String referralWelcomePending(String amount) {
    return '첫 채팅을 마치면 환영 보너스 $amount 크레딧이 지급돼요.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return '전용 컴퓨터에서 나를 위해 일하는 AI 팀원이에요. 초대를 수락하고 첫 채팅을 마치면 무료 사용량 $amount만큼 받아요.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return '참여 완료! 첫 채팅을 마치면 환영 보너스 $amount 크레딧이 지급돼요.';
  }

  @override
  String get connectManaged => 'Composio로 로그인';

  @override
  String connectManagedHelp(String app) {
    return 'Casama는 로그인을 처리해 주는 Composio를 통해 $app 연결을 지원해요. 언제든 연결을 해제할 수 있어요.';
  }

  @override
  String get sharing => '공유';

  @override
  String get sharingRow => '채팅, 편집, 관리 권한이 있는 사람';

  @override
  String get sharingHelp =>
      '비공개로 설정하지 않으면 워크스페이스의 모든 사람이 봇과 채팅할 수 있어요. 추가한 사람은 채팅하거나 설정을 편집하거나 접근 권한을 관리할 수 있어요. 봇은 누군가를 위해 일할 때 그 사람의 개인 컴퓨터와 연결만 사용해요.';

  @override
  String get sharingPrivate => '비공개';

  @override
  String get sharingPrivateOn => '나와 아래 사람들만 볼 수 있어요';

  @override
  String get sharingPrivateOff => '워크스페이스의 모든 사람이 채팅할 수 있어요';

  @override
  String get sharingPeople => '사용자';

  @override
  String get sharingOnlyCreator => '만든 사람만';

  @override
  String get sharingEveryoneChats => '모든 사람이 채팅할 수 있어요. 편집할 사람을 추가하세요';

  @override
  String sharingEveryoneRole(String role) {
    return '모든 $role';
  }

  @override
  String get accessChat => '채팅 가능';

  @override
  String get accessEdit => '편집 가능';

  @override
  String get accessAdmin => '관리 가능';

  @override
  String get sharingSaved => '공유 설정이 저장되었어요';

  @override
  String get triggerCalendar => '회의';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '일치하는 회의 전후 ($minutesString분)',
      zero: '일치하는 회의 시작 시',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      '먼저 Google 캘린더 또는 Outlook을 연결해 주세요.';

  @override
  String get calendarTriggerCalendar => '캘린더';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString분',
      zero: '시작 시',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests => '회사 외부인이 참석하는 회의만';

  @override
  String get calendarVideoLink => '화상 링크가 있는 회의만';

  @override
  String get calendarTitleMatch => '제목에 다음이 포함된 경우만 (선택)';

  @override
  String get fullAccess => '전체 접근';

  @override
  String get fullAccessHelp =>
      '봇이 전용 컴퓨터와 내 Mac에서 먼저 묻지 않고 바로 실행해요. 결제, 비밀번호 변경 및 직접 정한 “물어보기” 규칙은 여전히 먼저 확인해요.';

  @override
  String get fullAccessConfirmTitle => '전체 접근을 켤까요?';

  @override
  String get fullAccessConfirmBody =>
      '이 워크스페이스의 모든 봇이 먼저 묻지 않고 메시지를 보내고, 파일을 삭제하고, 내 Mac에서 명령을 실행하고, 연결을 추가해요. 결제와 비밀번호 변경은 여전히 먼저 물어봐요.';

  @override
  String get fullAccessTurnOn => '켜기';

  @override
  String get botToBot => '봇끼리 대화 허용';

  @override
  String get botToBotHelp => '봇들이 서로 @멘션하고, 메시지를 보내고, 작업을 넘길 수 있어요.';

  @override
  String get capMessages => '메시지 (iMessage)';

  @override
  String get chatApps => '채팅 앱';

  @override
  String get chatAppsRow => 'Telegram, 이메일, SMS, Slack, WhatsApp 등';

  @override
  String get botEmail => '이메일 주소';

  @override
  String get botEmailRow => '이 봇에게 고유 이메일 주소 만들기';

  @override
  String botEmailClaimTitle(String name) {
    return '$name에게 이메일 주소 만들기';
  }

  @override
  String get botEmailClaimHelp =>
      '사람들이 이 주소로 메일을 보내면 봇이 이메일로 답장해요. 청구서, 예약 내역, 뉴스레터 등 무엇이든 전달해 보세요.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => '이름은 나중에 바꿀 수 없어요.';

  @override
  String get botEmailNameLabel => '이름';

  @override
  String botEmailWillBe(String address) {
    return '봇의 주소: $address.';
  }

  @override
  String get botEmailClaim => '주소 만들기';

  @override
  String get botEmailTaken => '이미 사용 중인 이름이에요. 다음 중 하나를 사용해 보세요:';

  @override
  String get botEmailClaimed => '봇의 이메일 주소가 만들어졌어요';

  @override
  String get botEmailClaimedHelp => '환영 메일이 가고 있어요. 답장하거나 원하는 메일을 전달해 보세요.';

  @override
  String get botEmailCopy => '복사';

  @override
  String get botEmailCopied => '복사됨';

  @override
  String get botEmailContacts => '연락처에 추가';

  @override
  String botEmailWrite(String name) {
    return '$name에게 메일 쓰기';
  }

  @override
  String get botEmailPaused => '일시 정지됨. 메일은 계속 받아서 보관하지만 답장하지 않아요.';

  @override
  String get botEmailPause => '일시 정지';

  @override
  String get botEmailResume => '재개';

  @override
  String get botEmailSenders => '허용된 발신자';

  @override
  String get botEmailSendersHelp =>
      '여기에 있는 사람에게만 답장해요. 모르는 사람이 보낸 메일은 보관만 하고 아무 작업도 시작하지 않아요.';

  @override
  String get botEmailEditSenders => '채팅 앱에서 편집';

  @override
  String get botEmailMove => '다른 봇으로 옮기기';

  @override
  String get botEmailMoveHelp => '주소와 메일이 다른 봇으로 옮겨져요.';

  @override
  String get botEmailRelease => '주소 반납';

  @override
  String get botEmailReleaseHelp => '수신을 영구히 중단해요. 이 이름은 다시는 다른 사람에게 부여되지 않아요.';

  @override
  String botEmailReleaseConfirm(String address) {
    return '$address 주소를 반납할까요? 즉시 수신이 중단되며 이 이름은 다시 사용할 수 없어요.';
  }

  @override
  String get botEmailReleaseNow => '반납';

  @override
  String get botEmailMoved => '옮겨졌어요';

  @override
  String botEmailNewBotRow(String name) {
    return '$name에게 이메일 주소 만들기';
  }

  @override
  String get botEmailInbox => '수신함';

  @override
  String get botEmailInboxRow => '보관된 메일, 모르는 발신자, 파일';

  @override
  String get botEmailEmpty => '아직 메일이 없어요';

  @override
  String get botEmailStrangers => '모르는 발신자';

  @override
  String get botEmailAll => '모든 메일';

  @override
  String get botEmailUnconfirmed => '이 발신자를 확인할 수 없어요';

  @override
  String get botEmailAllow => '허용';

  @override
  String get botEmailBlock => '차단';

  @override
  String get botEmailBlocked => '차단됨. 여기서 오는 새 메일은 거부돼요.';

  @override
  String get botEmailUnblock => '차단 해제';

  @override
  String get botEmailOpenChat => '채팅 열기';

  @override
  String get botEmailFiles => '파일';

  @override
  String get botEmailNewSenders => '새 발신자 알림';

  @override
  String get botEmailNewSendersHelp => '하루 최대 한 번 알려줘요. 켜기 전까지는 꺼져 있어요.';

  @override
  String get botEmailTryTitle => '이렇게 활용해 보세요';

  @override
  String get botEmailTryForward => '청구서나 예약 메일 전달하기';

  @override
  String get botEmailTryForwardHelp => '위 주소로 무엇이든 전달해 보세요. 내용을 읽고 여기서 답해 줘요.';

  @override
  String get botEmailTryReceipts => '영수증 모아 두기';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return '$address 주소로 보낸 메일을 정리하는 루틴을 만들어요.';
  }

  @override
  String get botEmailTryDigest => '주간 뉴스레터 요약';

  @override
  String botEmailTryDigestHelp(String address) {
    return '$address 주소로 오는 뉴스레터를 모아 주간 요약으로 정리하는 루틴을 만들어요.';
  }

  @override
  String get botEmailTryCopied => '주소 복사됨';

  @override
  String get botEmailTryMade => '루틴이 만들어졌어요';

  @override
  String get botEmailReceiptsName => '영수증 모아 두기';

  @override
  String get botEmailReceiptsInstructions =>
      '이 메일에서 영수증을 정리해 줘. 용도, 금액, 날짜를 기록하고 이상이 없는 한 별도 답장은 하지 마.';

  @override
  String get botEmailDigestName => '주간 뉴스레터 다이제스트';

  @override
  String get botEmailDigestInstructions =>
      '이번 주 뉴스레터를 모아 알아둘 만한 핵심 헤드라인만 짧게 요약해서 보내 줘.';

  @override
  String get botEmailTriggerTag => '주소 태그';

  @override
  String get botEmailTriggerTagHelp =>
      'ada+shop@의 shop처럼 이 태그로 온 메일만 받아요. 이메일 주소에만 적용돼요.';

  @override
  String get botEmailTriggerUnconfirmed => '확인되지 않은 발신자 메일도 받기';

  @override
  String get botEmailTriggerAutomatic => '자동 발송 메일도 받기';

  @override
  String botEmailStorage(String used, String limit) {
    return '$limit 중 $used';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used 사용됨';
  }

  @override
  String get botEmailStorageFull =>
      '메일함이 가득 차서 새 메일을 받을 수 없어요. 공간을 확보하려면 오래된 메일을 삭제하세요.';

  @override
  String get botEmailSelect => '선택';

  @override
  String get botEmailSelectDone => '완료';

  @override
  String get botEmailDelete => '삭제';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '메일 $n개 삭제',
      one: '메일 1개 삭제',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '메일 $n개를 삭제할까요?',
      one: '이 메일을 삭제할까요?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      '텍스트와 파일이 영구적으로 삭제돼요. 이미 채팅에 복사된 내용은 그대로 남아요.';

  @override
  String get botEmailDeleteOlder => '오래된 메일 삭제';

  @override
  String get botEmailOlder30Days => '30일 지난 메일';

  @override
  String get botEmailOlder6Months => '6개월 지난 메일';

  @override
  String get botEmailOlderYear => '1년 지난 메일';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': '30일이 지난 메일을 모두 삭제할까요?',
      'months6': '6개월이 지난 메일을 모두 삭제할까요?',
      'other': '1년이 지난 메일을 모두 삭제할까요?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '메일 $n개 삭제됨',
      one: '메일 1개 삭제됨',
      zero: '삭제할 메일이 없어요',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '봇 이메일 주소 $n개',
      one: '봇 이메일 주소 1개',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew => '봇이 새로운 사람에게 이메일을 보낼 수 있어요';

  @override
  String get botEmailPerkRepliesOnly => '봇이 이메일로 답장해 드려요';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => '채팅 앱 연결';

  @override
  String get chatAppsEmpty => '아직 채팅 앱이 없어요';

  @override
  String get chatAppsHelp =>
      '사람들이 Telegram, 이메일, SMS, Slack, WhatsApp, Messenger, Feishu, iMessage로 이 봇에게 메시지를 보낼 수 있어요. 허용 목록에 있는 사람에게만 답장하며, 그 외의 메시지는 여기에 기록돼요.';

  @override
  String get chatAppsAddHelp =>
      '앱의 개발자 설정에서 받은 인증 정보를 붙여넣으세요. 암호화되어 저장되며 다시 표시되지 않아요.';

  @override
  String get chatAppsKind => '앱';

  @override
  String get chatAppsSenders => '허용된 발신자';

  @override
  String get chatAppsSendersHelp =>
      '한 줄에 하나씩 입력하세요: 이메일 주소(또는 *@company.com), 전화번호, 사용자 ID. ID를 모르겠다면 비워 두고 봇에게 메시지를 보낸 뒤 ‘활동’에서 ID를 복사하세요.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      '먼저 Mac의 데스크톱 앱에서 ‘메시지’를 허용한 상태로 ‘이 컴퓨터를 봇에 사용’을 켜 주세요.';

  @override
  String chatAppsConnected(String name) {
    return '$name 연결됨';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram이 이미 여기로 메시지를 보내고 있어요. 봇에게 메시지를 보내 시험해 보세요.';

  @override
  String get chatAppsPasteUrl => '이 주소를 앱의 웹훅 설정에 붙여넣으세요.';

  @override
  String get chatAppsWebhookUrl => '웹훅 주소';

  @override
  String get chatAppsVerifyToken => '확인 토큰';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '허용된 발신자 $countString명',
      one: '허용된 발신자 1명',
      zero: '허용된 발신자 없음',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => '활동';

  @override
  String get chatAppsNoActivity => '아직 메시지가 없어요.';

  @override
  String get chatAppsIgnored => '무시됨: 허용 목록에 없음';

  @override
  String get chatAppsAllow => '허용';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender 님이 이제 이 봇에게 메시지를 보낼 수 있어요';
  }

  @override
  String get chatAppsRoutine => '루틴 시작됨';

  @override
  String get chatAppsFailed => '보내지 못했어요';

  @override
  String get chatAppsSent => '전송됨';

  @override
  String get chatAppsAnswered => '답장함';

  @override
  String get chatAppsRemove => '연결 해제';

  @override
  String get chBotToken => '봇 토큰';

  @override
  String get chAddress => '이메일 주소';

  @override
  String get chApiKey => 'API 키';

  @override
  String get chSigningSecret => '서명 시크릿';

  @override
  String get chPhoneNumber => '전화번호';

  @override
  String get chAccountSid => '계정 SID';

  @override
  String get chAuthToken => '인증 토큰';

  @override
  String get chPhoneNumberId => '전화번호 ID';

  @override
  String get chAccessToken => '액세스 토큰';

  @override
  String get chAppSecret => '앱 시크릿';

  @override
  String get chPageToken => '페이지 액세스 토큰';

  @override
  String get chAppId => '앱 ID';

  @override
  String get chEncryptKey => '암호화 키';

  @override
  String get chVerificationToken => '인증 토큰';

  @override
  String get chPublicKey => '공개 키';

  @override
  String get chTrackerUser => '트래커 내 봇의 사용자 ID';

  @override
  String get chSiteUrl => '사이트 주소 (https://…)';

  @override
  String get chAccountEmail => '계정 이메일';

  @override
  String get routineMessage => '일치하는 메시지가 도착할 때';

  @override
  String get triggerMessage => '메시지';

  @override
  String get messageTriggerHelp =>
      '이 봇에게 온 이메일이나 채팅 메시지가 조건과 일치할 때 시작돼요. 먼저 ‘채팅 앱’에서 앱을 연결해 주세요.';

  @override
  String get messageTriggerAnyApp => '모든 앱';

  @override
  String get messageTriggerSender => '보낸 사람 (이메일 주소, 번호 또는 *@company.com)';

  @override
  String get messageTriggerSubject => '제목 포함 단어';

  @override
  String get messageTriggerWords => '메시지 포함 단어';

  @override
  String callIncoming(String name) {
    return '$name에게 전화가 왔어요';
  }

  @override
  String get callAnswer => '받기';

  @override
  String get callDecline => '거절';

  @override
  String get callFullScreenTitle => '잠금 화면에서 통화 표시';

  @override
  String get callFullScreenOff => '꺼짐: 봇의 통화가 알림으로만 표시돼요. 켜면 전체 화면으로 벨이 울려요.';

  @override
  String get encryption => '콘텐츠 암호화';

  @override
  String get encryptionHelp =>
      '메시지, 기억, 티켓, 페이지, 지식은 저장되기 전에 이 워크스페이스의 고유 키로 암호화돼요. 그 후에는 암호화된 텍스트의 정확한 단어가 아니라 제목과 의미로 검색돼요.';

  @override
  String get encryptionOff => '꺼짐';

  @override
  String get encryptionUnavailable => '사용할 수 없음: 이 서버에 암호화 키가 설정되어 있지 않아요';

  @override
  String get encryptionEncrypting => '켜는 중: 이미 저장된 내용을 암호화하고 있어요';

  @override
  String get encryptionOnServer => '켜짐 (서버 키 사용)';

  @override
  String get encryptionOnKms => '켜짐 (AWS KMS 사용)';

  @override
  String get encryptionDecrypting => '끄는 중: 저장된 내용을 복호화하고 있어요';

  @override
  String get encryptionConfirm =>
      '콘텐츠가 이 워크스페이스의 키로 암호화돼요. 워크스페이스가 삭제되면 키도 파기되어 콘텐츠를 복구할 수 없게 돼요. 암호화된 텍스트에서는 정확한 단어 일치 검색이 작동하지 않아요.';

  @override
  String get encryptionTurnOn => '켜기';

  @override
  String get encryptionRotate => '키 교체';

  @override
  String get encryptionKeyManaged =>
      'Casama가 이 워크스페이스 키를 생성해 서버 키로 감싸 안전하게 보관해 드려요. 따로 저장하거나 복사할 필요가 없어요.';

  @override
  String get encryptionRotateTitle => '키를 교체할까요?';

  @override
  String get encryptionRotateBody =>
      '서버의 현재 키로 워크스페이스 키를 다시 감싸요. 콘텐츠는 그대로 읽을 수 있으며 다시 암호화할 필요가 없어요. 서버 키를 변경한 후나 정기적으로 실행하세요.';

  @override
  String get encryptionRotateHelp => '서버의 현재 키로 워크스페이스 키를 다시 감싸요';

  @override
  String encryptionRotatedWhen(String when) {
    return '마지막 교체: $when';
  }

  @override
  String get memoryBackend => '기억 저장 위치';

  @override
  String get memoryBuiltIn => '기본 내장';

  @override
  String get memoryBackendHelp => '봇의 장기 기억';

  @override
  String get memoryBackendSheetHelp =>
      '내 계정으로 Honcho 또는 Supermemory에 봇의 기억을 보관해요. 기억 화면, 내보내기, 삭제 기능은 동일하게 작동해요.';

  @override
  String get memoryHonchoWorkspace => 'Honcho 워크스페이스';

  @override
  String get memoryHonchoWorkspaceHelp =>
      '비워 두면 이 Casama 워크스페이스 전용으로 생성된 공간을 사용해요';

  @override
  String get memoryBaseUrl => '서버 주소 (선택)';

  @override
  String get memoryBaseUrlHelp => '자체 호스팅 Honcho 또는 Supermemory용';

  @override
  String get memoryCopyExisting => '현재 기억 복사하기';

  @override
  String get memoryUseBuiltIn => '기본 내장 기억 다시 사용';

  @override
  String get providerHintData => '유료 데이터 (장소, 이메일, SEO)';

  @override
  String get kindA2a => 'AI 에이전트 (A2A)';

  @override
  String get a2aAgentUrl => '에이전트 주소 또는 에이전트 카드 URL';

  @override
  String get a2aAgentToken => '액세스 토큰 (선택)';

  @override
  String get a2a => 'Agent-to-Agent (A2A)';

  @override
  String get a2aHelp => '외부 에이전트가 내가 게시한 봇에게 작업을 맡길 수 있어요.';

  @override
  String get chromeExtensionSwitch => 'Casama for Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      '멤버들이 이 워크스페이스에서 브라우저 확장 프로그램을 사용할 수 있어요.';

  @override
  String get chromeActSwitch => '멤버 브라우저에서 봇 사용';

  @override
  String get chromeActSwitchHelp =>
      '멤버들이 봇에게 자신의 Chrome에서 페이지를 열고 작업하도록 허용할 수 있어요. 봇은 사용자가 언제든 중지할 수 있는 전용 탭 그룹에서 작업해요.';

  @override
  String get a2aPublish => 'A2A 에이전트로 게시';

  @override
  String get a2aPublishHelp => '워크스페이스 API 키를 가진 외부 에이전트가 이 봇에게 작업을 맡길 수 있어요.';

  @override
  String get a2aWorkspaceOff => '먼저 워크스페이스 설정에서 Agent-to-Agent를 켜 주세요.';

  @override
  String get a2aCardUrl => '에이전트 카드';

  @override
  String get phoneCalls => '전화 통화';

  @override
  String get phoneCallsHelp =>
      'Twilio 계정을 통해 봇이 업체에 전화를 걸 수 있게 해요. 전화를 걸 때마다 기존 승인 규칙에 따라 먼저 물어봐요.';

  @override
  String get twilioSid => '계정 SID';

  @override
  String get twilioToken => '인증 토큰';

  @override
  String get twilioFrom => '발신 번호';

  @override
  String get phoneCallsPersonal => '개인 번호로 전화 걸기 허용';

  @override
  String get phoneCallsCap => '하루 통화 한도';

  @override
  String get phoneCallsOff => '연결되지 않음';

  @override
  String get outCall => '통화';

  @override
  String get outCallRinging => '연결 중…';

  @override
  String get outCallLive => '통화 중';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString초 후 종료됨';
  }

  @override
  String get outCallEndedByYou => '통화를 종료했어요';

  @override
  String get outCallTakenOver => '통화를 직접 넘겨받았어요';

  @override
  String get outCallFailed => '연결되지 않았어요';

  @override
  String get outCallNothingYet => '아직 오간 대화가 없어요.';

  @override
  String get outCallTakeOver => '직접 조작';

  @override
  String get outCallEnd => '통화 종료';

  @override
  String get outCallYourPhone => '내 전화번호';

  @override
  String get outCallYourPhoneHelp =>
      '국제 전화 형식(예: +821012345678). 비워 두면 저장된 번호를 사용해요.';

  @override
  String get payments => '결제';

  @override
  String get paymentsHelp =>
      '봇이 매번 승인받은 일회용 가상 카드로 가맹점에 결제할 수 있게 해요. 본인의 Stripe Issuing 계정을 연결해 사용해요.';

  @override
  String paymentsOn(String spent, String cap) {
    return '이번 달 $cap 중 $spent 사용';
  }

  @override
  String get paymentsSheetHelp =>
      '모든 카드는 표시된 금액으로 직접 승인하며, 해당 가맹점에서 1시간 동안 1회만 사용할 수 있어요. 증권, 암호화폐, 기프트 카드, 계좌 이체에는 절대 사용되지 않아요.';

  @override
  String get paymentsStripeKey => 'Stripe 시크릿 키 (Issuing 포함)';

  @override
  String get paymentsWebhookSecret => '웹훅 서명 시크릿';

  @override
  String get paymentsWebhook => '여기에 Stripe 웹훅을 연결하세요';

  @override
  String get paymentsCardholder => '카드 명의자 이름';

  @override
  String get paymentsAddress => '청구지 주소';

  @override
  String get paymentsCity => '시/군/구';

  @override
  String get paymentsState => '시/도';

  @override
  String get paymentsZip => '우편번호';

  @override
  String get paymentsCountry => '국가 (2글자 코드)';

  @override
  String get paymentsCap => '워크스페이스 월간 한도 (USD)';

  @override
  String get paymentsBotCap => '봇별 월간 한도 (USD)';

  @override
  String get links => '연결된 봇';

  @override
  String get linksRow => '신뢰하는 연락처의 봇과 연결';

  @override
  String get linksHelp =>
      '내 봇이 연결된 연락처의 봇에게 저녁 식사 시간 같은 일정을 물어볼 수 있어요. 각 봇은 소유자의 규칙을 따르며 필요한 내용만 공유하고, 모든 대화 내역은 양쪽 모두에게 보여요.';

  @override
  String get linksEmpty => '아직 연결된 봇이 없어요';

  @override
  String get linksInvite => '연락처 초대';

  @override
  String get linksContactName => '연락처 이름';

  @override
  String get linksInviteReady => '이 초대 보내기';

  @override
  String get linksInviteHelp =>
      '연락처에 보내세요. 상대방이 Casama에서 자신의 봇 중 하나로 수락해요. 7일 동안 1회 사용할 수 있어요.';

  @override
  String get linksAccept => '초대 수락';

  @override
  String get linksAcceptHelp => '연락처가 보낸 초대장을 붙여넣으세요.';

  @override
  String get linksInviteText => '초대장';

  @override
  String linksActive(String bot) {
    return '$bot에 연결됨';
  }

  @override
  String get linksPending => '연락처의 수락을 기다리는 중';

  @override
  String get linksRevoked => '연결 해제됨';

  @override
  String get linksExchanges => '대화 내역';

  @override
  String get linksNoExchanges => '아직 물어본 내용이 없어요.';

  @override
  String get linksNoAnswer => '응답 없음';

  @override
  String get linksWorking => '작업 중…';

  @override
  String get linksRevoke => '연결 끊기';

  @override
  String get wakeWord => '호출어';

  @override
  String get wakeWordRow => '말을 걸어 봇과 통화 시작하기';

  @override
  String wakeWordOnRow(String phrase) {
    return '“$phrase” 대기 중';
  }

  @override
  String get wakeWordHelp =>
      'Casama가 열려 있는 동안 이 기기가 설정한 말을 듣고 있다가 선택한 봇과 실시간 통화를 시작해요.';

  @override
  String get wakeWordListen => '호출어 듣기';

  @override
  String get wakeWordPhrase => '호출어';

  @override
  String get wakeWordPhraseHelp => '“헤이 Casama”처럼 두세 단어로 입력하세요';

  @override
  String get wakeWordBot => '통화할 봇';

  @override
  String get wakeWordDownloading => '기기 내 모델 다운로드 중…';

  @override
  String get wakeWordTest => '호출어 테스트';

  @override
  String get wakeWordTesting => '듣는 중… 호출어를 말해 보세요';

  @override
  String get wakeWordHeard => '인식됨!';

  @override
  String get wakeWordStopTest => '중지';

  @override
  String get wakeWordPrivacy =>
      '음성 인식은 오픈소스 모델(약 18 MB, 한 번만 다운로드)을 통해 이 기기에서 처리돼요. 통화가 시작되기 전까지는 아무 데이터도 외부로 전송되지 않아요.';

  @override
  String get secretStore => '시크릿 보관 위치';

  @override
  String get secretStoreVault => '이 서버의 금고';

  @override
  String get secretStoreHelp =>
      '내 Infisical 프로젝트에 봇의 시크릿을 보관해요. Casama에는 각 시크릿의 이름과 사용 허용 위치만 저장돼요.';

  @override
  String get secretStoreSite => 'Infisical 주소';

  @override
  String get secretStoreProject => '프로젝트 ID';

  @override
  String get secretStoreEnv => '환경';

  @override
  String get secretStoreClientId => '머신 ID 클라이언트 ID';

  @override
  String get secretStoreClientSecret => '클라이언트 시크릿';

  @override
  String get secretStoreMove => '현재 시크릿을 Infisical로 옮기기';

  @override
  String get secretStoreBack => '이 서버의 금고 다시 사용';

  @override
  String get localServer => '이 컴퓨터에서 Casama 실행';

  @override
  String get setupTitleMac => '이 Mac에 Casama 설정';

  @override
  String get setupTitle => '이 컴퓨터에 Casama 설정';

  @override
  String get setupEntryMac => '이 Mac에서 실행';

  @override
  String get setupEntry => '이 컴퓨터에서 실행';

  @override
  String get setupEntryHelp => '이 컴퓨터에 나만의 비공개 서버를 띄워요. 개인 사용은 무료예요.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => '서버';

  @override
  String get setupStepAccount => '계정';

  @override
  String get setupStepModel => 'AI 모델';

  @override
  String get setupStepPhone => '휴대폰';

  @override
  String get setupDockerChecking => 'Docker 확인 중…';

  @override
  String get setupDockerMissingTitle => '먼저 Docker를 설치하세요';

  @override
  String get setupDockerMissingBodyMac =>
      'Casama 서버는 나머지 Mac 환경과 분리해 실행해 주는 무료 앱인 Docker Desktop 안에서 실행돼요.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Casama 서버는 나머지 컴퓨터 환경과 분리해 실행해 주는 Docker 안에서 실행돼요.';

  @override
  String get setupDockerGetMac => 'Docker Desktop 다운로드';

  @override
  String get setupDockerGetLinux => 'Docker 설치 가이드 열기';

  @override
  String get setupDockerStep1 => '다운로드된 파일을 열고 Docker를 ‘응용 프로그램’으로 드래그하세요.';

  @override
  String get setupDockerStep2 => 'Docker를 열고 약관에 동의하세요.';

  @override
  String get setupDockerStep3 => '여기로 돌아오세요. 이 페이지는 자동으로 다음 단계로 넘어가요.';

  @override
  String get setupDockerWaiting => 'Docker 대기 중…';

  @override
  String get setupDockerStoppedTitle => 'Docker가 실행 중이어야 해요';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker가 설치되어 있지만 열려 있지 않아요. 시작되는 데 1분 정도 걸릴 수 있으며, 시작되면 이 페이지가 자동으로 이어서 진행돼요.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker가 설치되어 있지만 실행 중이지 않아요. 이 명령어로 시작하면 이 페이지가 자동으로 이어서 진행돼요.';

  @override
  String get setupDockerOpen => 'Docker 열기';

  @override
  String get setupDockerOpening => 'Docker 시작 중…';

  @override
  String get setupDockerPermissionTitle => 'Docker 권한이 필요해요';

  @override
  String get setupDockerPermissionBody =>
      'Docker는 실행 중이지만 현재 사용자에게 사용 권한이 없어요. 이 명령어를 실행한 뒤 로그아웃했다가 다시 로그인하세요.';

  @override
  String get setupDockerComposeTitle => 'Docker에 Compose가 없어요';

  @override
  String get setupDockerComposeBody =>
      '이 Docker에 Compose v2가 없어요. Docker Desktop에는 포함되어 있으며, Linux에서는 docker-compose-plugin 패키지를 설치하세요.';

  @override
  String get setupStepSkipped => '건너뜀';

  @override
  String get setupArtDocker => '먼저 서버가 들어갈 상자를 준비해요.';

  @override
  String get setupArtServer => '서버의 집을 짓는 중이에요. 이 과정이 가장 오래 걸려요.';

  @override
  String get setupArtAccount => '서버가 실행 중이에요!';

  @override
  String get setupArtModel => '이제 두뇌를 연결해 주세요.';

  @override
  String get setupArtPhone => '마지막 단계: 어디서나 함께 쓰기.';

  @override
  String get setupDockerSlowTitle => '시간이 좀 걸리나요?';

  @override
  String get setupDockerSlowMenuBar =>
      '메뉴 막대에서 고래 아이콘을 찾아보세요. 움직임이 멈추면 Docker가 준비된 거예요.';

  @override
  String get setupDockerSlowTerms =>
      'Docker에서 약관 동의를 요청하는 창이 뜨면 먼저 완료해 주세요. Docker 로그인은 선택 사항이에요.';

  @override
  String get setupDockerSlowRestart =>
      '여전히 멈춰 있나요? Docker 메뉴에서 종료한 뒤 ‘다시 확인’을 누르세요.';

  @override
  String get setupDockerSlowInstalled =>
      '이미 설치하셨나요? 초기 설정을 마칠 수 있도록 ‘응용 프로그램’에서 Docker를 한 번 열어 주세요.';

  @override
  String get setupDockerSlowOther =>
      'OrbStack이나 Colima를 대신 사용 중인가요? 실행해 주세요. Casama는 docker info에 응답하는 모든 Docker와 호환돼요.';

  @override
  String get setupDockerSlowTerminal =>
      '터미널에서 docker info를 실행해 Docker가 출력하는 내용을 확인해 보세요.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker 응답: $detail';
  }

  @override
  String get setupDockerRecheck => '다시 확인';

  @override
  String get setupDockerGuide => '문제 해결 가이드';

  @override
  String setupDiskLow(String gb, String need) {
    return '디스크 여유 공간이 $gb GB뿐이에요. 서버에는 약 $need GB가 필요해요.';
  }

  @override
  String get setupServerTitle => '서버를 다운로드하고 시작하세요';

  @override
  String get setupServerBody =>
      '처음에는 약 2.5 GB를 다운로드하는 데 5~10분 걸리고, 설정이 끝나면 약 10 GB의 디스크 공간을 사용해요. 기다리는 동안 컴퓨터를 계속 사용해도 돼요.';

  @override
  String setupServerBodySized(String download, String disk) {
    return '$download GB를 다운로드하고, 설정이 끝나면 약 $disk GB의 디스크 공간을 사용해요. 처음에는 5~10분 걸려요. 기다리는 동안 컴퓨터를 계속 사용해도 돼요.';
  }

  @override
  String get setupServerBodyNothing =>
      '필요한 파일이 이미 이 컴퓨터에 모두 있으므로 1~2분 안에 시작돼요.';

  @override
  String get setupServerStart => '시작';

  @override
  String get setupServerStageDownload => '서버 다운로드 중';

  @override
  String get setupServerStagePrepare => '준비 중';

  @override
  String get setupServerStageParts => '구성 요소 다운로드 중';

  @override
  String setupServerDownloaded(int megabytes) {
    return '현재 $megabytes MB';
  }

  @override
  String get setupServerStagePartsNote => '가장 오래 걸리는 단계예요';

  @override
  String setupServerPartsCount(int done, int total) {
    return '현재 $total개 중 $done개 다운로드됨';
  }

  @override
  String get setupServerStageStart => '시작하는 중';

  @override
  String get setupServerStageWait => '응답을 기다리는 중';

  @override
  String get setupServerKeepOpen => '이 작업이 끝날 때까지 Casama를 열어 두세요.';

  @override
  String get setupServerFailed => '서버가 시작되지 않았어요.';

  @override
  String get setupServerConnecting => '준비 완료. 연결 중…';

  @override
  String get setupShowDetails => '자세히 보기';

  @override
  String get setupHideDetails => '자세히 숨기기';

  @override
  String get setupAccountTitle => '계정 만들기';

  @override
  String get setupAccountBody =>
      '이 계정은 이 컴퓨터에만 있으며 이 서버의 소유자예요. 이메일은 발송되지 않아요.';

  @override
  String get setupAccountName => '이름';

  @override
  String get setupAccountNameMissing => '이름을 입력해 주세요';

  @override
  String get setupAccountCreate => '계정 만들기';

  @override
  String get setupAccountHave => '여기에 이미 계정이 있어요';

  @override
  String get setupAccountNew => '대신 새 계정 만들기';

  @override
  String get setupAccountSignInTitle => '내 서버에 로그인';

  @override
  String get setupAccountSignInBody => '이 서버에서 만든 계정을 사용하세요.';

  @override
  String get setupAccountClosed => '이 서버에는 이미 소유자가 있어요. 그 계정으로 로그인해 주세요.';

  @override
  String get setupAccountPreparing => '공간을 준비하고 있어요…';

  @override
  String get setupModelTitle => '봇에게 모델 연결하기';

  @override
  String get setupModelBody =>
      '봇이 생각하려면 AI 모델이 필요해요. ChatGPT 플랜으로 로그인하거나 OpenRouter, Google 또는 다른 제공업체의 키를 붙여넣으세요.';

  @override
  String get setupSkip => '지금은 건너뛰기';

  @override
  String get setupPhoneTitle => '휴대폰 연결';

  @override
  String get setupPhoneBody =>
      'Casama Link가 이 컴퓨터에 비공개 주소를 부여해 어디서나 휴대폰으로 연결할 수 있어요. 무료 Casama Cloud 계정으로 한 번만 승인하면 돼요. 채팅 내역은 이 컴퓨터에만 남아요.';

  @override
  String get setupPhoneTurnOn => '이 컴퓨터에 주소 부여하기';

  @override
  String get setupPhoneScanTitle => '휴대폰 카메라로 스캔하세요';

  @override
  String get setupPhoneScanBody =>
      '휴대폰에서 Casama가 열리고 바로 로그인돼요. 휴대폰에 아직 Casama가 없다면 열리는 페이지에서 설치 방법을 안내해요.';

  @override
  String get setupPhoneWaiting => '휴대폰을 기다리는 중…';

  @override
  String get setupPhoneConnected => '휴대폰 연결됨';

  @override
  String get setupPhoneConnectedBody =>
      '휴대폰이 로그인되었어요. 다른 기기를 추가하려면 새 코드를 표시하세요.';

  @override
  String get setupPhoneOwnerOnly => '이 서버의 소유자만 주소를 부여할 수 있어요.';

  @override
  String get setupFinish => '완료';

  @override
  String get setupCardTitle => '설정 마저 하기';

  @override
  String get setupCardModel => '봇이 답변할 수 있도록 AI 모델을 추가하세요.';

  @override
  String get setupCardPhone => '휴대폰을 이 컴퓨터에 연결하세요.';

  @override
  String get setupCardOpen => '설정 계속하기';

  @override
  String get desktopUsers => '동시 데스크톱 사용자';

  @override
  String get desktopUsersHelp =>
      '이 팀 컴퓨터의 봇들은 하나의 화면을 공유해요. 화면이 사용 중일 때 다른 봇은 기다리면서 셸, 파일, 브라우저 작업은 계속할 수 있어요.';

  @override
  String desktopUsersCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $countString개',
      one: '봇 1개',
    );
    return '$_temp0';
  }

  @override
  String deviceAccessAsk(String kind, String bot) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '$bot 봇이 내 캘린더를 사용하려고 해요',
      'reminders': '$bot 봇이 내 미리 알림을 사용하려고 해요',
      'contacts': '$bot 봇이 내 연락처를 사용하려고 해요',
      'places': '$bot 봇이 내 장소를 사용하려고 해요',
      'photos': '$bot 봇이 내 사진을 사용하려고 해요',
      'health': '$bot 봇이 내 건강 데이터를 사용하려고 해요',
      'notifications': '$bot 봇이 내 알림을 사용하려고 해요',
      'activity': '$bot 봇이 내 컴퓨터 활동을 사용하려고 해요',
      'browserTab': '$bot 봇이 내 현재 브라우저 탭을 사용하려고 해요',
      'browserHistory': '$bot 봇이 내 브라우저 방문 기록 및 북마크를 사용하려고 해요',
      'alarm': '$bot 봇이 내 알람을 사용하려고 해요',
      'home': '$bot 봇이 내 홈 액세서리를 사용하려고 해요',
      'other': '$bot 봇이 내 기기 데이터를 사용하려고 해요',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      '내 개인 채팅에서만 사용돼요. ‘설정 → 기기 연결’에서 언제든 중지할 수 있어요.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '사용 허용됨: 내 캘린더',
      'reminders': '사용 허용됨: 내 미리 알림',
      'contacts': '사용 허용됨: 내 연락처',
      'places': '사용 허용됨: 내 장소',
      'photos': '사용 허용됨: 내 사진',
      'health': '사용 허용됨: 내 건강 데이터',
      'notifications': '사용 허용됨: 내 알림',
      'activity': '사용 허용됨: 내 컴퓨터 활동',
      'browserTab': '사용 허용됨: 내 현재 브라우저 탭',
      'browserHistory': '사용 허용됨: 내 브라우저 방문 기록 및 북마크',
      'alarm': '사용 허용됨: 내 알람',
      'home': '사용 허용됨: 내 홈 액세서리',
      'other': '사용 허용됨: 내 기기 데이터',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => '공유 안 함';

  @override
  String get deviceKindCalendar => '캘린더';

  @override
  String get deviceKindReminders => '미리 알림';

  @override
  String get deviceKindContacts => '연락처';

  @override
  String get deviceKindPlaces => '장소';

  @override
  String get deviceKindPhotos => '사진';

  @override
  String get deviceKindHealth => '건강 데이터';

  @override
  String get deviceKindNotifications => '알림';

  @override
  String get deviceKindActivity => '컴퓨터 활동';

  @override
  String get deviceKindBrowserTab => '현재 브라우저 탭';

  @override
  String get deviceKindBrowserHistory => '브라우저 방문 기록 및 북마크';

  @override
  String get deviceKindAlarm => '알람';

  @override
  String get deviceKindHome => '홈 액세서리';

  @override
  String get deviceBrowserAsks => '봇이 브라우저에 요청할 수 있는 항목';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama for Chrome이 실시간으로 응답하며 아무 내용도 저장되지 않아요. 확장 프로그램 설정에서 켜거나 끌 수 있어요.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return '$bot의 요청 허용 중지';
  }

  @override
  String get deviceConnections => '기기 연결';

  @override
  String get deviceConnectionsHelp =>
      '이 기기의 데이터를 봇과 공유해요. 각 항목은 켜기 전까지 꺼져 있으며, 허용한 봇만 내 개인 채팅에서 읽을 수 있어요.';

  @override
  String get deviceConnectionsNone =>
      '이 기기에서는 아직 데이터를 공유할 수 없어요. 휴대폰에서 Casama를 열고 공유할 항목을 켜 주세요.';

  @override
  String get deviceKeepFor => '보관 기간';

  @override
  String get deviceKeepLiveOnly => '실시간만';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString일',
      one: '1일',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => '비공개 모델만 허용';

  @override
  String get devicePrivateModelHelp => '로컬 모델을 사용하는 봇만 읽을 수 있어요';

  @override
  String get deviceNoBots => '아직 봇이 없어요. 봇이 필요할 때 요청하거나 지금 바로 허용할 수 있어요.';

  @override
  String get deviceAllowBot => '봇 허용';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '어느 봇이 내 캘린더를 읽도록 허용할까요?',
      'reminders': '어느 봇이 내 미리 알림을 읽도록 허용할까요?',
      'contacts': '어느 봇이 내 연락처를 읽도록 허용할까요?',
      'places': '어느 봇이 내 장소를 읽도록 허용할까요?',
      'photos': '어느 봇이 내 사진을 읽도록 허용할까요?',
      'health': '어느 봇이 내 건강 데이터를 읽도록 허용할까요?',
      'notifications': '어느 봇이 내 알림을 읽도록 허용할까요?',
      'activity': '어느 봇이 내 컴퓨터 활동을 읽도록 허용할까요?',
      'browserTab': '어느 봇이 내 현재 브라우저 탭을 읽도록 허용할까요?',
      'browserHistory': '어느 봇이 내 브라우저 방문 기록 및 북마크를 읽도록 허용할까요?',
      'alarm': '어느 봇이 내 알람을 읽도록 허용할까요?',
      'home': '어느 봇이 내 홈 액세서리를 읽도록 허용할까요?',
      'other': '어느 봇이 내 기기 데이터를 읽도록 허용할까요?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama에 권한이 없어요. 시스템 설정에서 허용한 뒤 다시 시도해 주세요.';

  @override
  String get deviceOtherDevices => '내 다른 기기';

  @override
  String get deviceForget => '이 기기 지우기';

  @override
  String get deviceBrowsers => '봇이 사용할 수 있는 브라우저';

  @override
  String get deviceBrowsersHelp =>
      'Casama for Chrome에서 연결되었어요. 허용한 봇들이 내 계정으로 로그인된 상태에서 전용 탭 그룹으로 작업해요.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $count개',
      one: '봇 1개',
      zero: '아직 봇이 없어요',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => '온라인';

  @override
  String get deviceBrowserOffline => '오프라인';

  @override
  String get deviceBrowserUnpair => '이 브라우저 연결 해제';

  @override
  String get deviceBrowserAllBots => '모든 봇';

  @override
  String get deviceChromeNotPaired => 'Casama for Chrome: 연결 안 됨';

  @override
  String get deviceChromeHowToPair =>
      'Casama for Chrome을 설치하고 로그인한 뒤 ‘더보기 → 봇이 이 브라우저를 사용하도록 허용’을 여세요.';

  @override
  String get deviceConnectionsRowHelp => '이 기기의 캘린더, 연락처 등';

  @override
  String get healthExtraCycle => '생리 주기 추적';

  @override
  String get healthExtraGlucose => '혈당';

  @override
  String get healthExtraBloodPressure => '혈압';

  @override
  String get appleHealth => 'Apple 건강';

  @override
  String get appleHealthAbout =>
      '이 설정이 켜져 있을 때만 Apple 건강(HealthKit)에서 수면, 활동, 운동, 심박수의 일일 요약을 읽어요. Casama는 Apple 건강에 데이터를 절대 기록하지 않아요.';

  @override
  String get healthNotMedical =>
      '일일 요약(수면, 활동, 운동, 심박수)만 다뤄요. 봇은 평소와 비교해 설명할 뿐 의학적 조언은 하지 않아요.';

  @override
  String get healthNeedsEncryption =>
      '건강 데이터를 사용하려면 저장 데이터 암호화가 필요해요. 소유한 워크스페이스에서 암호화를 켠 뒤 다시 시도해 주세요.';

  @override
  String get placeAddHere => '현재 위치 추가';

  @override
  String get placeName => '장소 이름 (집, 직장, 헬스장)';

  @override
  String get placeNoLocation =>
      '위치 정보를 가져올 수 없어요. Casama의 위치 권한을 허용한 뒤 다시 시도해 주세요.';

  @override
  String get placesHelp =>
      '이 장소에 도착하거나 떠날 때 봇이 알림을 받아요. 장소 이름과 시간만 공유되며 이동 경로는 절대 공유되지 않아요.';

  @override
  String get watchedAppsHelp =>
      '이 앱들의 알림만 공유돼요. 일회용 인증 코드는 기기를 떠나기 전에 자동으로 가려져요.';

  @override
  String get watchedAppAdd => '앱 추가 (이름 또는 패키지 ID)';

  @override
  String get providerHintMaps => '지금 출발 시 이동 시간';

  @override
  String routineDevice(String event, String detail) {
    return '내 휴대폰에서: $event $detail';
  }

  @override
  String get ctxSelection => '선택한 텍스트';

  @override
  String get ctxAddScreenshot => '스크린샷 추가';

  @override
  String get ctxScreenshotAdded => '스크린샷 추가됨';

  @override
  String get ctxScreenshotFailed =>
      '스크린샷을 찍지 못했어요. 시스템 설정에서 Casama의 화면 기록을 허용해 주세요.';

  @override
  String get watchedFolders => '지켜보는 폴더';

  @override
  String get watchedFoldersHelp =>
      '이 폴더 중 하나에 새 파일이 생기면 루틴을 시작할 수 있어요 (예: 다운로드 폴더의 새 PDF 정리). 파일 이름만 공유되며, 봇이 이 컴퓨터에서 작업하는 경우에만 파일을 읽어요.';

  @override
  String get whyTitle => '왜 이 항목이 보이나요?';

  @override
  String whyData(String data) {
    return '사용된 정보: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return '긴급도: $urgency';
  }

  @override
  String get heldMeeting => '회의 중일 때 기다렸다가 브리핑과 함께 전달했어요.';

  @override
  String get heldFocus => '집중 모드가 켜져 있을 때 기다렸다가 브리핑과 함께 전달했어요.';

  @override
  String get heldDriving => '운전 중일 때 기다렸다가 브리핑과 함께 전달했어요.';

  @override
  String get heldCap => '봇이 오늘 이미 메시지 5개를 보내서 이 항목은 브리핑까지 기다렸다가 보냈어요.';

  @override
  String get heldLow => '긴급하지 않아 휴대폰 알림을 울리는 대신 브리핑에 모아 전달했어요.';

  @override
  String get lessLikeThis => '이런 알림 줄이기';

  @override
  String get lessLikeThisDone => '알겠어요, 이런 알림을 줄일게요';

  @override
  String get widgetStatusWorking => '작업 중…';

  @override
  String get widgetStatusOff => '꺼짐';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner => '인스턴스 소유자에 의해 일시 정지됨';

  @override
  String get previewHi => '안녕!';

  @override
  String get previewAsk => '내 메모 좀 정리해 줄 수 있어?';

  @override
  String get previewOnIt => '바로 할게요';

  @override
  String get previewDone => '완료! 이제 세 개의 폴더로 정리되었어요.';

  @override
  String get previewMessage => '메시지';

  @override
  String get fontPreviewGreeting => '좋은 아침이에요';

  @override
  String get photosFromUnsplash => 'Unsplash 사진';

  @override
  String get showBotSteps => '봇의 작업 단계 표시';

  @override
  String get showBotStepsHelp => '모든 채팅에서 명령어와 기술 오류를 표시해요.';

  @override
  String get showScreenCard => '작업 중 봇의 화면 표시';

  @override
  String get showScreenCardHelp => '채팅에 작은 라이브 카드를 표시해요. 누르면 전체 화면으로 볼 수 있어요.';

  @override
  String get showReplyUsage => '답장에 사용량 표시';

  @override
  String get showReplyUsageHelp => '각 답장 아래 한 줄로 비용을 표시해요.';

  @override
  String get openLinksInApp => '앱 안에서 링크 열기';

  @override
  String get openLinksInAppHelp =>
      '웹 링크를 Casama 내부 브라우저에서 열어요. 끄면 기본 브라우저에서 열려요.';

  @override
  String replyUsageTokens(String count) {
    return '토큰 $count개';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '내 API 키로 $amount';
  }

  @override
  String get replyUsageOnPlan => 'ChatGPT 플랜으로 실행';

  @override
  String replyUsageSoFar(String amount) {
    return '지금까지 $amount';
  }

  @override
  String get replyUsageTooltip => '이 답장의 비용';

  @override
  String get replyUsageTitle => '이 답장의 비용';

  @override
  String get replyUsageFromCredits => '보유 크레딧에서 차감';

  @override
  String get replyUsageYourKeys => '내 API 키 사용';

  @override
  String get replyUsageTotal => '합계';

  @override
  String get replyUsageTime => '시간';

  @override
  String get replyUsageTokensLabel => '토큰';

  @override
  String get replyUsageSteps => '단계';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '보조 실행 $n회 포함',
      one: '보조 실행 1회 포함',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => '이 답장에는 측정된 사용량이 없어요.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1크레딧 = $price 기준이에요. 내 API 키와 플랜은 Casama가 아니라 해당 제공업체에서 청구해요.';
  }

  @override
  String get replyUsageOpenRun => '실행 열기';

  @override
  String get replyUsageLoadFailed => '이 답장의 사용량을 불러오지 못했어요.';

  @override
  String get replyUsageOurCost => '원가';

  @override
  String get replyUsageMargin => '마진';

  @override
  String replyUsageItemCost(String amount) {
    return '원가 $amount';
  }

  @override
  String get replyUsageAdminNote =>
      '이 서버를 직접 운영하고 있으므로 원가와 마진이 표시돼요. 다른 사람에게는 보이지 않아요.';

  @override
  String get kindSpeechToText => '음성 텍스트 변환';

  @override
  String get kindVoice => '음성 통화';

  @override
  String get kindImages => '이미지';

  @override
  String get kindVideo => '동영상';

  @override
  String get kindSearch => '웹 검색';

  @override
  String get kindData => '데이터 조회';

  @override
  String get kindPhone => '전화 통화';

  @override
  String get kindApps => '앱 작업';

  @override
  String get activityReady => '준비 중…';

  @override
  String get activitySearching => '웹 검색 중…';

  @override
  String get activityBrowsing => '웹 탐색 중…';

  @override
  String get activityComputer => '컴퓨터에서 작업 중…';

  @override
  String get activityFiles => '파일 확인 중…';

  @override
  String get activityImage => '이미지 만드는 중…';

  @override
  String get activityVideo => '동영상 만드는 중…';

  @override
  String get activityMemory => '기억 확인 중…';

  @override
  String get activityApps => '앱 사용 중…';

  @override
  String get activityScheduling => '일정 설정 중…';

  @override
  String get activityWorking => '작업 중…';

  @override
  String get activityWaitingForScreen => '화면을 봇에게 돌려주기를 기다리는 중…';

  @override
  String get runFailedPlain => '문제가 발생했어요. 다시 시도하거나 ‘세부 정보’를 열어 원인을 확인하세요.';

  @override
  String get newKeyTitle => '새 키 복사하기';

  @override
  String get newKeyHelp => '이번 한 번만 표시돼요. 연결할 앱에 붙여넣은 뒤 ‘완료’를 누르세요.';

  @override
  String get copyKey => '키 복사';

  @override
  String get keyCopied => '키 복사됨';

  @override
  String revokeApiKeyTitle(String name) {
    return '“$name” 키를 폐기할까요?';
  }

  @override
  String get revokeApiKeyBody =>
      '이 키를 사용하는 앱은 즉시 연결이 끊겨요. 되돌릴 수 없으며, 다시 연결하려면 새 키를 만들어야 해요.';

  @override
  String unlinkTitle(String name) {
    return '“$name” 연결을 끊을까요?';
  }

  @override
  String get unlinkBody => '봇들이 즉시 서로 대화를 멈춰요. 다시 연결하려면 새 초대장이 필요해요.';

  @override
  String get alreadyMember => '이미 이 워크스페이스에 참여하고 있어요.';

  @override
  String get askAdminToInvite => '소유자와 관리자만 사람을 초대할 수 있어요. 초대 링크를 요청해 주세요.';

  @override
  String get askBeforeJoining => '참여하기 전에 먼저 물어보기';

  @override
  String get askBeforeJoiningHelp => '링크를 사용하는 사람마다 관리자가 승인해요.';

  @override
  String get askToJoin => '참여 요청';

  @override
  String get customLinks => '맞춤 링크';

  @override
  String get customLinksHelp => '고유한 역할, 만료 기한, 사용 횟수를 지정한 링크예요.';

  @override
  String get emailAddresses => '이메일 주소';

  @override
  String get emailAddressesHelp => '쉼표나 줄 바꿈으로 구분해 하나 이상 붙여넣으세요.';

  @override
  String get getCode => '코드 받기';

  @override
  String get getNewCode => '새 코드 받기';

  @override
  String get getStarted => '시작하기';

  @override
  String get welcomeCta => '시작하기';

  @override
  String get inviteAsAdmin => '관리자로 초대';

  @override
  String get inviteByEmail => '이메일로 초대';

  @override
  String get inviteExpired => '만료됨';

  @override
  String inviteExpires(String when) {
    return '만료: $when';
  }

  @override
  String get inviteInvalid => '사용할 수 없는 초대예요';

  @override
  String get inviteInvalidHelp =>
      '만료되었거나, 사용 횟수가 다 되었거나, 비활성화되었을 수 있어요. 새 초대를 요청해 주세요.';

  @override
  String get inviteLink => '초대 링크';

  @override
  String get inviteLinkApprovalHelp =>
      '이 링크가 있는 누구나 참여를 요청할 수 있어요. 아래에서 승인할 수 있어요.';

  @override
  String get inviteLinkHelp => '이 링크가 있는 누구나 멤버로 참여할 수 있어요. 채팅이나 이메일로 공유하세요.';

  @override
  String get inviteLinkOrCode => '초대 링크 또는 코드';

  @override
  String inviteOtherServer(String host) {
    return '이 초대는 $host 서버용이지만, 현재 앱은 다른 서버에 연결되어 있어요.';
  }

  @override
  String get inviteRenewed => '초대가 7일간 연장되었어요. 새 링크를 보내 주세요.';

  @override
  String inviteSentTo(String email) {
    return '수락하려면 $email 계정으로 로그인하세요.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Casama의 $workspace에 참여하세요: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name 님이 초대했어요';
  }

  @override
  String get invitedToJoin => '초대받았어요';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '초대 $countString개를 보냈어요.',
      one: '초대를 보냈어요.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => '관리자로 참여하게 돼요';

  @override
  String get joinAsMember => '멤버로 참여하게 돼요';

  @override
  String get joinByDomain => '이메일 도메인으로 참여';

  @override
  String get joinByDomainHelp => '인증된 주소는 초대 없이 바로 참여해요.';

  @override
  String joinByDomainSwitch(String domain) {
    return '인증된 @$domain 이메일을 가진 누구나 참여할 수 있어요';
  }

  @override
  String get joinByDomainUnavailable =>
      '인증된 회사 이메일(gmail.com 등 제외)로 로그인했을 때 사용할 수 있어요.';

  @override
  String get joinNeedsApproval => '관리자가 승인한 뒤 참여할 수 있어요.';

  @override
  String get joinRequestSent => '요청 전송됨';

  @override
  String joinRequestSentHelp(String name) {
    return '$name의 관리자가 확인할 거예요. 참여가 승인되면 알림을 보내드릴게요.';
  }

  @override
  String get joinWithLinkOrCode => '링크 또는 코드로 참여';

  @override
  String get spacesInvite => '사람 초대하기';

  @override
  String spacesInviteTo(String name) {
    return '$name에 초대';
  }

  @override
  String get spacesNew => '새 워크스페이스';

  @override
  String get spacesNewHint => '독립된 봇, 멤버, 결제 관리';

  @override
  String get spacesJoin => '워크스페이스 참여';

  @override
  String get spacesJoinHint => '초대 링크 또는 코드로 참여';

  @override
  String joinWorkspaceNamed(String name) {
    return '$name 참여하기';
  }

  @override
  String get joinedBotsHelp => '이 봇들이 도와드릴 준비가 되어 있어요. 먼저 인사해 보세요.';

  @override
  String get joinedNoBots => '아직 봇이 없어요. 새 봇을 만들거나 먼저 둘러보세요.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $countString명',
      one: '멤버 1명',
    );
    return '$_temp0';
  }

  @override
  String get members => '멤버';

  @override
  String openToDomain(String domain) {
    return '@$domain 도메인에 열림';
  }

  @override
  String openWorkspace(String name) {
    return '$name 열기';
  }

  @override
  String get pendingInvites => '아직 수락되지 않은 초대';

  @override
  String get people => '멤버';

  @override
  String get workspaceAdvancedSummary => '시크릿, 기억, 암호화, 결제, MCP';

  @override
  String get peopleAdvancedSummary => '초대 코드, 이메일 도메인, 맞춤 링크';

  @override
  String get inviteLinkToCopy => '복사할 수 있는 초대 링크';

  @override
  String linkMade(String when) {
    return '$when 생성됨';
  }

  @override
  String get billingAdvancedSummary => '서버별 요금, Casama Link 서버 및 키';

  @override
  String get billingChargesSummary => '서버별 요금';

  @override
  String get billingUsageRow => '봇 사용 내역과 비용';

  @override
  String billingUsageSoFar(String amount) {
    return '이번 달 현재까지: $amount';
  }

  @override
  String get usageAdvancedSummary => '토큰 수, JSON 내보내기';

  @override
  String get peopleHelp => '사람을 초대하고 누가 들어올 수 있는지 정하세요.';

  @override
  String get peopleRow => '초대, 요청 승인, 멤버 보기';

  @override
  String get qrCode => 'QR 코드';

  @override
  String get remove => '제거';

  @override
  String get resendInvite => '다시 보내기';

  @override
  String get resetLink => '링크 재설정';

  @override
  String get resetLinkHelp =>
      '현재 링크는 즉시 작동을 멈추고 새 링크가 만들어져요. 이미 참여한 사람은 그대로 남아요.';

  @override
  String get revokeInvite => '초대 취소';

  @override
  String scanToJoin(String name) {
    return '스캔해서 $name에 참여하기';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '초대 $countString개 보내기';
  }

  @override
  String get sendInvitesYourself => '이 초대를 직접 보내세요';

  @override
  String get sendInvitesYourselfHelp =>
      '이 서버에 이메일이 설정되어 있지 않아요. 각 사람에게 링크를 보내면 그 주소로 로그인해 참여할 수 있어요.';

  @override
  String get signInToJoin => '로그인하고 참여하기';

  @override
  String get startOwnWorkspace => '대신 내 워크스페이스 시작하기';

  @override
  String switchToServer(String host) {
    return '$host 서버로 전환';
  }

  @override
  String get waitingToJoin => '참여 대기 중';

  @override
  String welcomeToWorkspace(String name) {
    return '$name에 오신 걸 환영해요';
  }

  @override
  String get workspacesYouCanJoin => '참여할 수 있는 워크스페이스';

  @override
  String get yourTeamIsHere => '팀이 이미 여기에 있어요';

  @override
  String yourTeamIsHereHelp(String domain) {
    return '$domain 소속 구성원들이 이 워크스페이스를 사용 중이에요. 참여하거나 새로 만들어 보세요.';
  }

  @override
  String get inviteCodeCardHelp =>
      '읽어주거나 입력하기 쉬워요. 48시간 동안 유효하며, ‘링크 또는 코드로 참여’에 입력하면 돼요.';

  @override
  String get inviteSomeoneNew => '워크스페이스에 새 사람 초대하기';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app 로그인은 보안(https) 주소에서만 작동해요. 현재 Casama 서버 주소: $address. 로그인을 사용하려면 Casama를 https로 연결해 주세요.';
  }

  @override
  String get aboutYou => '내 정보';

  @override
  String get aboutYouRow => '봇이 나를 부르는 이름과 나에 대해 아는 내용';

  @override
  String get aboutYouIntro =>
      '봇들이 이 내용을 읽고 내 이름으로 부르며 내가 원하는 방식으로 답해 줘요. 나만 볼 수 있어요.';

  @override
  String get photoChange => '프로필 사진 변경';

  @override
  String get photoTake => '사진 찍기';

  @override
  String get photoChoose => '사진 선택';

  @override
  String get photoUseGoogle => '내 Google 사진 사용';

  @override
  String get photoRemove => '사진 제거';

  @override
  String get photoUnreadable =>
      'Casama에서 사용할 수 없는 사진 파일이에요. JPEG 또는 PNG 파일을 사용해 주세요.';

  @override
  String get whatToCallYou => '봇이 나를 어떻게 부를까요?';

  @override
  String get pronounsOptional => '호칭/대명사 (선택)';

  @override
  String get aboutMe => '내 소개';

  @override
  String get aboutMeHint => '하는 일, 주변 사람들, 관심사 등 도움이 될 만한 무엇이든 적어 보세요.';

  @override
  String get replyStyle => '원하는 답장 스타일';

  @override
  String get replyStyleHint => '예: 짧게 답해 줘, 이모지는 쓰지 마, 처음 접하는 사람처럼 쉽게 설명해 줘';

  @override
  String get learnAboutMe => '채팅에서 내 정보 배우기';

  @override
  String get learnAboutMeHelp => '봇이 나에 관한 사실을 저장해요. 언제든 편집할 수 있어요.';

  @override
  String get adultSites => '성인 사이트';

  @override
  String get adultSitesHelp =>
      '요청할 때 봇이 성인 웹사이트를 열 수 있어요. 만 19세 이상만 사용할 수 있어요.';

  @override
  String get adultSitesConfirmTitle => '성인 사이트를 켤까요?';

  @override
  String get adultSitesConfirmBody =>
      '만 19세 이상임을 확인해요. 요청하면 봇이 성인 웹사이트를 열어 내용을 텍스트로 정리해 줄 수 있어요. 웹이나 데스크톱 앱의 Casama에서 요청할 때만 작동하며, 공유 채팅에서는 절대 작동하지 않아요.';

  @override
  String get adultSitesConfirm => '만 19세 이상이에요';

  @override
  String get adultSitesApprovalDetail =>
      '‘허용’을 누르면 만 19세 이상임을 확인하고, 내 계정에서 성인 사이트를 켜게 돼요. ‘내 정보’에서 언제든 끌 수 있어요.';

  @override
  String useInThisSpace(String workspace) {
    return '$workspace에서 내가 공유한 내용 사용';
  }

  @override
  String get useInThisSpaceHelp => '끄면 여기에서는 내 이름과 답장 스타일만 사용해요.';

  @override
  String get learnedAboutYou => '봇이 배운 내용';

  @override
  String get noLearnedFacts => '아직 아무것도 없어요. 채팅에서 봇이 나에 대해 배운 사실이 여기에 표시돼요.';

  @override
  String get addFact => '사실 추가';

  @override
  String get editFact => '사실 편집';

  @override
  String get deleteFactTitle => '이 사실을 삭제할까요?';

  @override
  String get deleteFactConfirm => '봇이 더 이상 이 내용을 알지 못하게 돼요.';

  @override
  String get importToProfile => 'ChatGPT 또는 Claude에서 가져오기';

  @override
  String get savedToProfile => '프로필에 저장됨';

  @override
  String get undo => '실행 취소';

  @override
  String get suggestedLookApplied => '새 테마 적용됨';

  @override
  String get suggestedLookUnavailable => '이 앱에는 해당 테마가 없어요';

  @override
  String get removedFromProfile => '프로필에서 제거됨';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사실 $countString개 추가됨',
      one: '사실 1개 추가됨',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      '봇들이 모든 워크스페이스에서 이 이름을 사용해요. 나중에 ‘설정 → 내 정보’에서 바꿀 수 있어요.';

  @override
  String get nameStepBubble => '만나서 반가워요!';

  @override
  String get heardFromTitle => 'Casama를 어떻게 알게 되셨나요?';

  @override
  String get heardFromHelp =>
      '한 번만 눌러 주시면 어떤 경로가 효과적인지 파악하는 데 도움이 돼요. 건너뛰셔도 괜찮아요.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => '지인 추천';

  @override
  String get heardFromSearch => '검색';

  @override
  String get heardFromAiAssistant => 'AI 어시스턴트';

  @override
  String get heardFromOther => '기타';

  @override
  String get heardFromSkip => '건너뛰기';

  @override
  String get nameStepHint => '이름';

  @override
  String get skillCatalogSubtitle => '작업에 필요할 때 봇이 바로 불러오는 기성 스킬이에요.';

  @override
  String get skillCategoryWork => '업무';

  @override
  String get skillCategoryWriting => '글쓰기';

  @override
  String get skillCategoryResearch => '리서치';

  @override
  String get skillCategoryData => '데이터';

  @override
  String get skillCategoryMoney => '금융';

  @override
  String get skillCategoryBuild => '개발';

  @override
  String get skillCategoryLife => '생활';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스킬 $countString개',
      one: '스킬 1개',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => '설치됨';

  @override
  String skillInstalledFor(String names) {
    return '$names에 설치됨';
  }

  @override
  String installSkillFor(String name) {
    return '$name 설치 대상';
  }

  @override
  String skillUseHint(String name) {
    return '작업에 맞으면 봇이 스스로 불러오며, 채팅에서 /$name 명령을 입력해 직접 쓸 수도 있어요.';
  }

  @override
  String get skillInstructions => '지침';

  @override
  String get skillAlreadyEverywhere => '설치할 수 있는 모든 곳에 이미 설치되었어요.';

  @override
  String get gallery => '갤러리';

  @override
  String get galleryEmpty => '갤러리에서 일치하는 항목이 없어요.';

  @override
  String get galleryOffline => '지금은 갤러리에 연결할 수 없어요. 기본 스타일과 스킬은 그대로 사용할 수 있어요.';

  @override
  String get galleryUse => '사용';

  @override
  String get galleryInstall => '설치';

  @override
  String get galleryReport => '신고';

  @override
  String get galleryShare => '갤러리에 공유';

  @override
  String galleryBy(String name) {
    return '제작: $name';
  }

  @override
  String get galleryFeatured => '추천';

  @override
  String get galleryAll => '전체';

  @override
  String get galleryThemes => '테마';

  @override
  String get gallerySchemes => '색상';

  @override
  String get galleryWallpapers => '배경화면';

  @override
  String get gallerySkills => '스킬';

  @override
  String get fromGallery => '갤러리';

  @override
  String galleryApplied(String name) {
    return '$name 사용 중';
  }

  @override
  String get gallerySeeAll => '전체 보기';

  @override
  String get galleryInUse => '사용 중';

  @override
  String galleryInstalled(String name) {
    return '$name 설치됨';
  }

  @override
  String get galleryPreviewDark => '다크 모드 미리보기';

  @override
  String get galleryPreviewLight => '라이트 모드 미리보기';

  @override
  String get galleryClearSearch => '검색 지우기';

  @override
  String get galleryOfflineTitle => '갤러리가 오프라인 상태예요';

  @override
  String galleryNoMatches(String query) {
    return '“$query”에 맞는 항목이 없어요';
  }

  @override
  String get galleryInstructions => '지침';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$palette 위 $pattern';
  }

  @override
  String get galleryImage => '이미지';

  @override
  String get galleryMeshGradient => '메시 그라디언트';

  @override
  String get galleryOwnDoodles => '나만의 두들';

  @override
  String get galleryLightAndDark => '라이트 및 다크';

  @override
  String get galleryContribute =>
      '마음에 드는 스타일을 만드셨나요? 공유하면 Casama의 모든 사람이 여기서 찾을 수 있어요.';

  @override
  String get galleryTypeTheme => '테마';

  @override
  String get galleryTypeScheme => '색상 테마';

  @override
  String get galleryTypeWallpaper => '배경화면';

  @override
  String get galleryTypeSkill => '스킬';

  @override
  String get galleryBehindChats => '채팅 배경';

  @override
  String celebrateNewBot(String name) {
    return '$name에게 인사해 보세요!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name 준비 완료!';
  }

  @override
  String get celebrateJoined => '참여 완료! 워크스페이스에 오신 걸 환영해요.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name 설정 완료.';
  }

  @override
  String get fewerEffects => '효과 줄이기';

  @override
  String get fewerEffectsHelp => '축하 효과, 튀는 탭, 움직이는 봇 애니메이션을 꺼요.';

  @override
  String get settingsAppSection => '앱';

  @override
  String get settingsSecuritySection => '로그인 및 보안';

  @override
  String get customize => '사용자 지정';

  @override
  String get customizeColors => '색상';

  @override
  String get appearanceCustomLook => '사용자 지정 테마';

  @override
  String get appearanceCustomHelp => '직접 바꾼 설정이에요. 유지하려면 테마로 저장하세요.';

  @override
  String get appearanceFromGallery => '갤러리에서';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '모두 보기 ($countString)';
  }

  @override
  String appearanceSwitched(String name) {
    return '$name 테마로 전환됨';
  }

  @override
  String appearanceSaved(String name) {
    return '내 테마에 $name 저장됨';
  }

  @override
  String get appearanceAboutTheme => '이 테마 정보';

  @override
  String settingsOnDevServer(String host) {
    return '설정 · 개발 서버 $host';
  }

  @override
  String chatPreviewYou(String text) {
    return '나: $text';
  }

  @override
  String get chatPreviewPhoto => '사진';

  @override
  String get chatPreviewVideo => '동영상';

  @override
  String get chatPreviewVoice => '음성 메모';

  @override
  String get chatPreviewNone => '아직 메시지가 없어요';

  @override
  String get chatTimeYesterday => '어제';

  @override
  String get chatDayToday => '오늘';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day $time';
  }

  @override
  String get anyPriority => '모든 우선순위';

  @override
  String get readingAloud => '소리 내어 읽는 중';

  @override
  String get readAloudPreparing => '준비 중…';

  @override
  String get readAloudPaused => '일시 정지됨';

  @override
  String get stopReading => '읽기 중지';

  @override
  String get readAloudSpeed => '재생 속도';

  @override
  String readAloudTimeLeft(String time) {
    return '$time 남음';
  }

  @override
  String get readAloudShowMessage => '읽고 있는 메시지 보기';

  @override
  String mentionOpenProfile(String name) {
    return '$name, 프로필 열기';
  }

  @override
  String get paywallSubtitle =>
      '더 많은 봇, 더 넉넉한 컴퓨터 사용 시간, 매월 새로 지급되는 크레딧으로 봇들이 계속 일할 수 있어요.';

  @override
  String get paywallPerkBots => '봇';

  @override
  String get paywallPerkBotsBody => '각자의 역할을 맡은 든든한 팀원들.';

  @override
  String get paywallPerkComputers => '컴퓨터 시간';

  @override
  String get paywallPerkComputersBody => '봇이 웹을 탐색하고, 코딩하고, 결과물을 만드는 전용 컴퓨터.';

  @override
  String get paywallPerkCredits => '월간 크레딧';

  @override
  String get paywallPerkCreditsBody => '모델, 검색, 도구 사용을 위한 크레딧.';

  @override
  String get paywallPerkSeats => '멤버 수';

  @override
  String get paywallPerkSeatsBody => '팀원들을 같은 워크스페이스에 초대하세요.';

  @override
  String paywallHours(String hours) {
    return '$hours시간';
  }

  @override
  String get paywallWeekly => '주간';

  @override
  String get paywallMonthly => '월간';

  @override
  String get paywallYearly => '연간';

  @override
  String get paywallPerMonth => '/월';

  @override
  String get paywallPerYear => '/년';

  @override
  String get paywallContinue => '계속';

  @override
  String get paywallContinueCheckout => '결제 계속하기';

  @override
  String get paywallRestore => '복원';

  @override
  String get paywallFineStore => '자동으로 갱신돼요. 스토어 설정에서 언제든 해지할 수 있어요.';

  @override
  String get paywallFineWeb => '자동으로 갱신돼요. ‘결제’에서 언제든 해지할 수 있어요.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '해지할 때까지 $price에 자동으로 갱신돼요. 요금은 Apple 계정에 청구되며, 갱신 최소 24시간 전까지 Apple 계정 설정에서 언제든 해지할 수 있어요.',
      'google_play':
          '해지할 때까지 $price에 자동으로 갱신돼요. 요금은 Google Play 계정에 청구되며, 갱신 최소 24시간 전까지 Google Play 계정 설정에서 언제든 해지할 수 있어요.',
      'other':
          '해지할 때까지 $price에 자동으로 갱신돼요. 요금은 스토어 계정에 청구되며, 갱신 최소 24시간 전까지 스토어 계정 설정에서 언제든 해지할 수 있어요.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 동안 무료이고, 이후에는 해지할 때까지 $price에 자동으로 갱신돼요.',
      one: '1일 동안 무료이고, 이후에는 해지할 때까지 $price에 자동으로 갱신돼요.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 동안 무료이고, 이후에는 해지할 때까지 $price에 자동으로 갱신돼요.',
      one: '1일 동안 무료이고, 이후에는 해지할 때까지 $price에 자동으로 갱신돼요.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 동안 무료이고, 이후에는 해지할 때까지 $price에 자동으로 갱신돼요.',
      one: '1일 동안 무료이고, 이후에는 해지할 때까지 $price에 자동으로 갱신돼요.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 요금은 무료 체험이 끝날 때 Apple 계정에 청구되며, 무료 체험 종료 최소 24시간 전까지 Apple 계정 설정에서 해지하면 요금이 청구되지 않아요.',
      'google_play':
          '$_temp1 요금은 무료 체험이 끝날 때 Google Play 계정에 청구되며, 무료 체험 종료 최소 24시간 전까지 Google Play 계정 설정에서 해지하면 요금이 청구되지 않아요.',
      'other':
          '$_temp2 요금은 무료 체험이 끝날 때 스토어 계정에 청구되며, 무료 체험 종료 최소 24시간 전까지 스토어 계정 설정에서 해지하면 요금이 청구되지 않아요.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => '무료 체험 시작';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 무료 체험 후 $price/년',
      one: '1일 무료 체험 후 $price/년',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 무료 체험 후 $price/월',
      one: '1일 무료 체험 후 $price/월',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '해지할 때까지 $price에 자동으로 갱신돼요. ‘결제’에서 언제든 해지할 수 있으며, 결제 기간이 끝날 때까지 플랜을 계속 이용할 수 있어요.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 무료 체험 후에는 해지할 때까지 $price에 자동 갱신돼요.',
      one: '1일 무료 체험 후에는 해지할 때까지 $price에 자동 갱신돼요.',
    );
    return '$_temp0 무료 체험이 끝나기 전에 ‘결제’에서 해지하면 요금이 청구되지 않아요.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '매주 $price',
      'year': '매년 $price',
      'other': '매월 $price',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => '이용약관';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get aiConsentTitle => '채팅 내용이 AI 회사로 전송돼요';

  @override
  String get aiConsentBody =>
      '답장을 작성하기 위해 Casama가 봇과 공유한 내용을 외부 AI 제공업체로 전송해요. 동의하기 전까지는 아무것도 전송되지 않아요.';

  @override
  String get aiConsentUpdatedNotice => '이 목록에 웹 페이지가 추가되었어요.';

  @override
  String get aiConsentWhatTitle => '전송되는 내용';

  @override
  String get aiConsentWhat =>
      '메시지, 파일과 사진, 통화 중 음성, 음성 메시지와 받아쓰기, 봇이 나에 대해 기억하는 내용, 봇이 나를 위해 여는 웹 페이지(봇 전용 컴퓨터 또는 이 기기의 브라우저), 그리고 캘린더나 건강처럼 내가 켠 휴대폰 데이터가 전송돼요.';

  @override
  String get aiConsentWhoTitle => '전송받는 곳';

  @override
  String get aiConsentWho =>
      '사용 중인 모델을 만든 회사(예: DeepSeek, Google, OpenAI)로 전달하는 OpenRouter에 전송돼요. 통화에는 Google Gemini가 사용되며, 음성 메시지와 받아쓰기의 텍스트 변환은 OpenAI가 처리해요. 웹 검색은 Parallel, Serper 또는 DeepSeek로 전송돼요. 내 API 키를 사용하는 경우에는 대신 해당 제공업체로 전송돼요.';

  @override
  String get aiConsentWhyTitle => '사용 목적';

  @override
  String get aiConsentWhy =>
      '답장을 작성하는 데 사용해요. ‘설정 › 개인정보 보호’에서 언제든 중지할 수 있으며, 자세한 내용은 개인정보 처리방침에서 확인할 수 있어요.';

  @override
  String get aiConsentAgree => '동의하고 계속하기';

  @override
  String get aiConsentTile => 'AI 제공업체';

  @override
  String get aiConsentTileOn => '허용됨. 봇과 공유한 내용이 답장을 작성하기 위해 외부 AI 제공업체로 전송돼요.';

  @override
  String get aiConsentWithdrawQuestion => 'AI 제공업체와 공유를 중지할까요?';

  @override
  String get aiConsentWithdrawBody =>
      '제공업체 없이는 봇이 답장할 수 없어요. 다른 내용을 보내기 전에 Casama가 다시 물어봐요.';

  @override
  String get aiConsentWithdraw => '공유 중지';

  @override
  String get planChanged => '플랜이 변경되었어요';

  @override
  String get purchasesRestored => '구매 내역이 복원되었어요';

  @override
  String get creditsAdded => '크레딧이 추가되었어요';

  @override
  String get purchasePending => '구매 승인을 기다리는 중이에요. 승인되는 즉시 추가돼요.';

  @override
  String get purchaseFailed => '결제가 진행되지 않았으며 요금은 청구되지 않았어요.';

  @override
  String get purchaseVerifyFailed =>
      '아직 구매 내역을 확인하지 못했어요. 자동으로 다시 시도하며, 잠시 후에도 반영되지 않으면 ‘구매 복원’을 눌러 주세요.';

  @override
  String paywallTitleFor(String plan) {
    return '$plan 플랜으로 크루를 키워 보세요';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return '$plan 플랜에 오신 걸 환영해요!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n개월 무료',
      one: '1개월 무료',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return '$plan 플랜으로 전환';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Store에서 구독 중이에요. 플랜을 변경하려면 구독한 기기의 App Store를 이용해 주세요.',
      'google_play':
          'Google Play에서 구독 중이에요. 플랜을 변경하려면 구독한 기기의 Google Play를 이용해 주세요.',
      'other': '앱 스토어에서 구독 중이에요. 플랜을 변경하려면 구독한 기기의 해당 스토어를 이용해 주세요.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      '웹에서 구독 중이에요. 여기서 웹 결제로 플랜을 변경하거나 구독을 관리할 수 있어요.';

  @override
  String get subscribedOutsideAppNote => '이 구독은 앱 외부에서 청구되므로 여기서 변경할 수 없어요.';

  @override
  String get outOfCreditsTitle => '크레딧이 모두 소진되었어요';

  @override
  String get outOfCreditsPaidBody =>
      '크레딧을 추가할 때까지 봇들이 일시 정지돼요. App Store 또는 Google Play에서 구매한 크레딧 팩은 만료되지 않으며, 웹에서 구매한 크레딧 팩은 12개월간 유효해요.';

  @override
  String get outOfCreditsFreeBody =>
      '매월 더 많은 크레딧과 더 많은 봇, 더 넉넉한 컴퓨터 사용 시간을 받으려면 업그레이드해 주세요.';

  @override
  String get addCredits => '크레딧 추가';

  @override
  String get seePlansButton => '플랜 보기';

  @override
  String get paywallAskAdmin =>
      '워크스페이스 소유자와 관리자만 플랜을 변경할 수 있어요. 업그레이드를 요청해 주세요.';

  @override
  String get upgradeToPro => 'Pro로 업그레이드';

  @override
  String get upgradeToProBody => '더 많은 봇, 컴퓨터 사용 시간, 월간 크레딧을 이용할 수 있어요.';

  @override
  String get manageTab => '관리';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => '메모리';

  @override
  String get vitalsDisk => '디스크';

  @override
  String get fixItTitle => '제대로 작동하지 않나요?';

  @override
  String get fixItSubtitle => '순서대로 시도해 보세요. 아래로 갈수록 더 강하게 초기화해요.';

  @override
  String get fixRestart => '재시작';

  @override
  String get fixRestartHelp => '약 20초 · 데이터는 손실되지 않아요';

  @override
  String get fixResetSystem => '시스템 재설정';

  @override
  String get fixResetSystemHelp => '깨끗한 새 시스템 · 파일은 유지돼요';

  @override
  String get fixErase => '모두 지우기';

  @override
  String get fixEraseHelp => '새 기기처럼 초기화 · 7일 동안 되돌릴 수 있어요';

  @override
  String get fixResetAction => '재설정…';

  @override
  String get fixEraseAction => '지우기…';

  @override
  String get computerRestarting => '재시작 중…';

  @override
  String get computerRestarted => '재시작되었어요. 모든 파일이 그대로 있어요.';

  @override
  String get computerUpdateTitle => '업데이트 가능';

  @override
  String get computerUpdateBody =>
      '새로운 도구와 수정 사항이 준비되었어요. 업데이트하면 이 컴퓨터가 재시작되며, 파일은 유지되지만 열려 있는 창과 실행 중인 프로그램은 닫혀요.';

  @override
  String get computerUpdateBotWorking =>
      '지금 봇이 이 컴퓨터에서 작업 중이에요. 업데이트하면 진행 중인 작업이 멈춰요.';

  @override
  String get computerUpdateNow => '지금 업데이트';

  @override
  String get computerUpdateLater => '나중에';

  @override
  String get computerUpdateConfirmTitle => '이 컴퓨터를 업데이트할까요?';

  @override
  String get computerUpdateMenu => '컴퓨터 업데이트';

  @override
  String get computerUpdating => '업데이트 중…';

  @override
  String get computerUpdated => '업데이트되었어요. 모든 파일이 그대로 있어요.';

  @override
  String get computerUpdateBusyTitle => '명령어가 아직 실행 중이에요';

  @override
  String get computerUpdateBusyBody =>
      '지금 업데이트하면 중지돼요. 끝날 때까지 기다리거나 바로 업데이트하세요.';

  @override
  String get computerUpdateAnyway => '그래도 업데이트';

  @override
  String resetSheetTitle(String name) {
    return '$name 재설정';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots 봇들이 약 1분 동안 사용할 수 없게 돼요.';
  }

  @override
  String get resetSheetBusyNone => '약 1분 동안 사용할 수 없게 돼요.';

  @override
  String get resetOptionSystem => '시스템 재설정, 파일 유지';

  @override
  String get resetOptionSystemHelp => '망가진 설치, 설정, 멈춘 프로그램을 복구해요.';

  @override
  String get resetOptionErase => '모두 지우기';

  @override
  String get resetOptionEraseHelp => '완전히 새로운 컴퓨터 상태로 되돌려요.';

  @override
  String get resetKept => '유지됨';

  @override
  String get resetRemoved => '제거됨';

  @override
  String get resetKeptFiles => 'workspace 폴더의 내 파일';

  @override
  String get resetKeptSettings => '이름, 설정, 봇';

  @override
  String get resetKeptRestorePoints => '복원 지점';

  @override
  String get resetRemovedApps => '설치한 앱과 도구';

  @override
  String get resetRemovedPrograms => '실행 중인 프로그램';

  @override
  String get resetRemovedCaches => '캐시 및 홈 폴더 설정';

  @override
  String get resetRemovedFiles => '모든 파일 및 워크스페이스 포함';

  @override
  String get resetSavePoint => '먼저 복원 지점 저장';

  @override
  String get resetSavePointHelp => '7일 동안 이 작업을 되돌릴 수 있도록 해요';

  @override
  String eraseTypeName(String name) {
    return '확인하려면 $name 입력';
  }

  @override
  String get resetConfirmSystem => '시스템 재설정';

  @override
  String get resetConfirmErase => '모두 지우기';

  @override
  String get resetStepSaving => '복원 지점 저장 중';

  @override
  String get resetStepWipingSystem => '앱과 설정 제거 중';

  @override
  String get resetStepWipingErase => '모든 파일 지우는 중';

  @override
  String get resetStepRestarting => '새 시스템 시작 중';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '재설정 중… $totalString 중 $stepString';
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

    return '지우는 중… $totalString 중 $stepString';
  }

  @override
  String get resetLeaveHint => '이 화면을 나가도 돼요. 백그라운드에서 계속 진행돼요.';

  @override
  String get resetDone => '새 시스템 준비 완료';

  @override
  String get eraseDone => '컴퓨터가 지워졌어요';

  @override
  String get resetFailed => '재설정을 완료하지 못했어요';

  @override
  String get resetUndoHint => '실행 취소하면 모든 것을 이전 상태로 되돌려요. 복원 지점은 7일간 보관돼요.';

  @override
  String get restoredPrevious => '이전 상태로 되돌렸어요';

  @override
  String get usageThisMonth => '이번 달';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString시간 $minutesString분';
  }

  @override
  String get usageCostNote => '켜져 있는 동안에만 과금돼요. 절전 상태에서는 비용이 들지 않아요.';

  @override
  String get usageNone => '이번 달에는 아직 사용하지 않았어요';

  @override
  String get sleepTimerTitle => '자동 절전 대기 시간';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString분';
  }

  @override
  String get sleepTimerHour => '1시간';

  @override
  String get sleepTimerHelp =>
      '봇이 작업 중이거나 내가 사용 중일 때는 절대 절전 상태로 들어가지 않아요. 대기 시간이 길수록 컴퓨터가 오래 켜져 있어 비용이 더 들어요.';

  @override
  String sleepTimerSaved(String label) {
    return '활동이 없으면 $label 후 절전 상태로 전환돼요';
  }

  @override
  String get storageTitle => '저장 공간';

  @override
  String storageOf(String total) {
    return '/ 전체 $total';
  }

  @override
  String get storageFiles => '내 파일';

  @override
  String get storageApps => '앱 및 도구';

  @override
  String get storageCaches => '캐시';

  @override
  String get storageBrowser => '브라우저';

  @override
  String get storageOther => '기타';

  @override
  String get storageFree => '남은 공간';

  @override
  String storageFreeUp(String size) {
    return '$size 비우기';
  }

  @override
  String get storageNothingToClean => '비울 캐시가 없어요';

  @override
  String storageFreed(String size) {
    return '$size 비움';
  }

  @override
  String get storageAsleep => '무엇이 공간을 차지하는지 보려면 컴퓨터를 깨워 주세요.';

  @override
  String get processesTitle => '현재 실행 중';

  @override
  String get processesNone => '컴퓨터 자체 외에는 실행 중인 항목이 없어요.';

  @override
  String get processesAsleep => '절전 중에는 아무것도 실행되지 않아요.';

  @override
  String get processStop => '중지';

  @override
  String processStopTitle(String name) {
    return '$name 중지할까요?';
  }

  @override
  String get processStopMessage => '저장하지 않은 내용은 모두 사라져요.';

  @override
  String processStopped(String name) {
    return '$name 중지됨';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · CPU $cpu% · $memory';
  }

  @override
  String get usedByTitle => '사용 중인 봇';

  @override
  String get usedByNone => '아직 이 컴퓨터를 사용하는 봇이 없어요.';

  @override
  String botLastActive(String when) {
    return '마지막 활동: $when';
  }

  @override
  String get botNeverActive => '아직 활동 없음';

  @override
  String get restorePointsTitle => '복원 지점';

  @override
  String get restorePointsNone => '아직 없어요. 봇이 위험한 변경 전에 자동으로 저장해요.';

  @override
  String get restorePointSaveNow => '지금 복원 지점 저장';

  @override
  String get restorePointSaveTitle => '복원 지점 저장';

  @override
  String get restorePointDefaultLabel => '직접 저장함';

  @override
  String get restorePointSaved => '복원 지점 저장됨';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '모두 보기 ($nString)';
  }

  @override
  String get historyTitle => '기록';

  @override
  String get historyNone => '아직 기록이 없어요.';

  @override
  String get historyStarted => '깨어남';

  @override
  String get historySlept => '절전 상태로 전환됨';

  @override
  String get historySleptIdle => '절전 상태로 전환됨 (활동 없음)';

  @override
  String get historyRestarted => '재시작됨';

  @override
  String get historyReset => '시스템 재설정됨';

  @override
  String get historyErased => '모두 지워짐';

  @override
  String get historyCheckpointCreated => '복원 지점 저장됨';

  @override
  String get historyCheckpointRestored => '복원 지점 복원됨';

  @override
  String historyStorageCleaned(String size) {
    return '$size 비움';
  }

  @override
  String get historyStorageCleanedPlain => '공간 확보됨';

  @override
  String historyProcessStopped(String name) {
    return '$name 중지됨';
  }

  @override
  String get historyUpdated => '설정 변경됨';

  @override
  String get historyYou => '나';

  @override
  String get yourDataTitle => '내 데이터';

  @override
  String get downloadAllFiles => '모든 파일 다운로드';

  @override
  String get downloadAllFilesHelp => '워크스페이스의 모든 파일이 담긴 .zip';

  @override
  String get downloadNothing => '아직 다운로드할 파일이 없어요.';

  @override
  String get deleteComputerHelp => '컴퓨터와 복원 지점을 모두 삭제해요';

  @override
  String get manageComputer => '관리';

  @override
  String get restartComputer => '재시작';

  @override
  String get resetComputerMenu => '재설정…';

  @override
  String get moreFixes => '더 많은 복구 옵션';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString분';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString시간';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString일';
  }

  @override
  String get remoteUpdateTitle => 'Casama를 업데이트할 시간이에요';

  @override
  String get remoteUpdateBody =>
      '이 버전의 Casama는 더 이상 지원되지 않아요. 계속 사용하려면 업데이트해 주세요.';

  @override
  String get remoteUpdateNoLink =>
      '이 버전의 Casama는 더 이상 지원되지 않아요. 앱을 설치한 곳에서 업데이트해 주세요.';

  @override
  String get remoteMaintenanceTitle => 'Casama가 점검 중이에요';

  @override
  String get openLink => '열기';

  @override
  String get routineIdeas => '아이디어';

  @override
  String get routineIdeasHelp => '아이디어에서 시작해 원하는 대로 바꿀 수 있어요.';

  @override
  String get pluginDirectory => '검토된 플러그인';

  @override
  String get pluginDirectoryHelp => 'Casama가 확인했으며 검증된 버전에 고정되어 있어요.';

  @override
  String get pluginOrPaste => '또는 GitHub 링크로 추가';

  @override
  String byAuthor(String name) {
    return '제작: $name';
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
  String get paywallBillingPeriod => '결제 주기';

  @override
  String get paywallNotSoldTitle => '이 서버에는 플랜이 없어요';

  @override
  String get paywallNotSoldBody => '이 서버에서는 플랜을 판매하지 않으므로 업그레이드할 항목이 없어요.';

  @override
  String get paywallPlansFailedTitle => '플랜을 불러오지 못했어요';

  @override
  String get paywallPlansFailedBody => '연결 상태를 확인한 뒤 다시 시도해 주세요.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Store에 플랜이 표시되지 않아요',
      'google_play': 'Google Play에 플랜이 표시되지 않아요',
      'other': '스토어에 플랜이 표시되지 않아요',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': '이 기기에서 App Store에 로그인되어 있는지 확인한 뒤 다시 시도해 주세요.',
      'google_play': '이 기기에서 Google Play에 로그인되어 있는지 확인한 뒤 다시 시도해 주세요.',
      'other': '이 기기에서 스토어에 로그인되어 있는지 확인한 뒤 다시 시도해 주세요.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return '최대 $pct% 할인';
  }

  @override
  String get paywallMostPopular => '가장 인기';

  @override
  String get paywallTaglinePlus => '나와 몇 개의 봇을 위한 플랜';

  @override
  String get paywallTaglinePro => '바쁜 크루와 소규모 팀을 위한 플랜';

  @override
  String get paywallTaglineMax => '하루 종일 일하는 봇을 둔 팀을 위한 플랜';

  @override
  String get paywallPerMonthShort => '/월';

  @override
  String paywallBilledYearly(String price) {
    return '연간 $price 결제';
  }

  @override
  String paywallWorksOutTo(String price) {
    return '월 $price 상당';
  }

  @override
  String get paywallBilledMonthly => '매월 결제';

  @override
  String get paywallBilledWeekly => '매주 결제';

  @override
  String get paywallPerWeekShort => '/주';

  @override
  String paywallPerWeekWorksOut(String price) {
    return '주당 $price 상당';
  }

  @override
  String get paywallBilledYearlyPlain => '매년 결제';

  @override
  String get paywallPerYearShort => '/년';

  @override
  String paywallStartTrial(int n) {
    return '$n일 무료 체험 시작';
  }

  @override
  String paywallGetPlan(String plan) {
    return '$plan 플랜 구독하기';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count명',
      one: '1명',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '컴퓨터 사용 시간 $hoursString시간';
  }

  @override
  String get billingChangePlan => '플랜 변경';

  @override
  String get billingChangePlanBody => '월간 및 연간 모든 플랜을 비교해 보세요.';

  @override
  String paywallWhatYouGet(String plan) {
    return '$plan 플랜 혜택';
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
  String get updatesRow => '업데이트';

  @override
  String get updatesRowSubtitle => '내 워크스페이스 소식';

  @override
  String get updatesEmpty => '업데이트 없음';

  @override
  String get updatesEmptyHelp =>
      '워크스페이스 공지와 새 페이지가 여기에 표시돼요. 봇이 보낸 내용은 각 봇의 채팅에 있어요.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '확인 필요한 항목 $n개',
      one: '확인 필요한 항목 1개',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return '진행 중: $title';
  }

  @override
  String suggestionClosed(String title) {
    return '나중에: $title';
  }

  @override
  String openTopic(String title) {
    return '$title 열기';
  }

  @override
  String get newTopic => '새 주제';

  @override
  String get topics => '주제';

  @override
  String get olderTopics => '이전';

  @override
  String get generalChat => '일반';

  @override
  String get allTopics => '모든 주제';

  @override
  String get cardSecrets => '시크릿';

  @override
  String get cardApproval => '승인';

  @override
  String get cardTakeover => '직접 조작하기';

  @override
  String get cardDevice => '기기 접근';

  @override
  String get cardSuggestion => '제안';

  @override
  String get formBack => '뒤로';

  @override
  String get formNext => '다음';

  @override
  String get formSkip => '건너뛰기';

  @override
  String formStep(int n, int total) {
    return '$total개 중 $n번째 질문';
  }

  @override
  String get cardSuggestions => '제안';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '살펴볼 만한 항목 $n개를 찾았어요',
      one: '살펴볼 만한 항목 1개를 찾았어요',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return '$when 시작됨';
  }

  @override
  String get suggestionStartedPlain => '시작됨';

  @override
  String get suggestionPutAway => '나중에 보기';

  @override
  String get suggestionExpired => '만료됨';

  @override
  String suggestionExpiredTitle(String title) {
    return '만료됨: $title';
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
      other: '$nString분 후 만료',
      one: '1분 후 만료',
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
      other: '$nString시간 후 만료',
      one: '1시간 후 만료',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '제안 $n개 처리됨',
      one: '제안 1개 처리됨',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => '휴대폰에서 이 서버 사용';

  @override
  String get linkIntro =>
      '이 서버에 어디서나 휴대폰으로 접속할 수 있는 주소를 부여해요. 도메인이나 공유기 설정이 필요 없어요.';

  @override
  String get linkIntroDetails =>
      '이 서버를 무료 Casama Cloud 계정에 연결해요. 휴대폰 트래픽은 Casama 서버를 거치지 않고 Cloudflare를 통해 이 컴퓨터로 바로 전달돼요.';

  @override
  String get linkTurnOn => '휴대폰에서 사용';

  @override
  String get linkSignupsNote =>
      '이 기능이 켜져 있는 동안 새 회원가입은 닫혀요. 이미 이 서버에 계정이 있는 사람만 로그인할 수 있어요.';

  @override
  String get linkStepSignIn => '이 서버 연결';

  @override
  String get linkSignInBody =>
      '브라우저에 방금 열린 페이지에서 이 코드를 승인하세요. 페이지에 같은 코드가 표시되어 있는지 확인하세요.';

  @override
  String get linkSignInOpen => '페이지 다시 열기';

  @override
  String get linkStepAddress => '주소 받기';

  @override
  String get linkStepRestart => '서버 재시작';

  @override
  String get linkStepConnect => '연결';

  @override
  String get linkStateOnline => '온라인';

  @override
  String get linkStateStarting => '시작 중';

  @override
  String get linkStateOffline => '오프라인';

  @override
  String get linkStateAttention => '확인 필요';

  @override
  String get linkStateOff => '꺼짐';

  @override
  String get linkAddress => '주소';

  @override
  String get linkLocalAddress => '이 컴퓨터에서';

  @override
  String get linkShowCode => '로그인 코드 보기';

  @override
  String get linkCheck => '다시 확인';

  @override
  String get linkTurnOff => '끄기';

  @override
  String get linkTurnOffConfirm =>
      '원격 접근을 끌까요? 주소 작동이 멈추며, 다시 켜기 전까지 휴대폰에서 이 서버에 연결할 수 없어요. 다시 켜면 기존 주소가 그대로 복원돼요.';

  @override
  String get linkTurningOff => '끄는 중';

  @override
  String get linkNeedsOwner => '이 서버의 소유자만 켤 수 있어요.';

  @override
  String get linkTwoStepTip =>
      '이제 인터넷에서 이 서버에 접속할 수 있어요. 2단계 로그인을 켜 두면 추측한 비밀번호만으로는 접속할 수 없어요.';

  @override
  String get linkProblemNotLinked =>
      '이 서버가 Casama Cloud에 연결되어 있지 않아요. 다시 켜서 연결해 주세요.';

  @override
  String get linkProblemCloudUnreachable =>
      '지금은 Casama Cloud에 연결할 수 없어요. 주소가 작동 중이었다면 계속 작동해요.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud가 더 이상 이 서버의 키를 수락하지 않아요. 다시 켜서 연결해 주세요.';

  @override
  String get linkProblemSuspended => 'Casama Cloud에서 이 서버의 원격 접근을 껐어요.';

  @override
  String get linkProblemRemoved =>
      'Casama Cloud의 워크스페이스에서 이 서버가 제거되었어요. 다시 켜서 연결해 주세요.';

  @override
  String get linkProblemPlanLimit =>
      '현재 Casama Cloud 플랜에서 연결할 수 있는 서버 수를 초과했어요. 기존 서버를 제거하거나 플랜을 업그레이드해 주세요.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud에 이 서버의 주소가 더 이상 없어요. 다시 켜 주세요.';

  @override
  String get linkProblemAddressChanged =>
      '이 서버의 주소가 변경되었어요. 새 주소를 사용하려면 다시 켜 주세요.';

  @override
  String get connectProblemConnectorMissing =>
      '커넥터가 실행 중이 아니에요. Docker가 실행 중인지 확인한 뒤 다시 확인하세요.';

  @override
  String get connectProblemConnectorBlocked =>
      '이 네트워크에서 연결을 차단하고 있어요. 보통 VPN이나 엄격한 방화벽(아웃바운드 포트 7844) 때문이에요.';

  @override
  String get linkProblemAddressUnanswered =>
      '모두 연결되었지만 주소가 아직 응답하지 않아요. 새 주소는 1분 정도 걸릴 수 있어요.';

  @override
  String get linkServers => '연결된 서버';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '내 플랜에서 서버 $limit대를 연결할 수 있어요.',
      one: '내 플랜에서 서버 1대를 연결할 수 있어요.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      '아직 연결된 서버가 없어요. 내 서버에서 ‘설정 → Casama Link’를 여세요.';

  @override
  String linkServerRemoveConfirm(String name) {
    return '$name 서버를 제거할까요? 주소 작동이 멈추지만 나중에 언제든 다시 연결할 수 있어요.';
  }

  @override
  String get linkStatusActive => '주소 있음';

  @override
  String get linkStatusParked => '최근 접속 없음';

  @override
  String get linkStatusSuspended => '일시 정지됨';

  @override
  String get pairDevice => '다른 기기에서 로그인';

  @override
  String get pairDeviceRow => '휴대폰으로 스캔할 코드 표시';

  @override
  String get pairDeviceHelp =>
      '휴대폰 카메라로 스캔하세요. 또는 휴대폰 Casama에서 ‘로그인 → 코드 스캔’을 선택하세요.';

  @override
  String get pairDeviceWarning => '스캔하는 사람은 누구나 내 계정으로 로그인돼요. 몇 분 동안 1회만 유효해요.';

  @override
  String pairDeviceServer(String host) {
    return '$host에 로그인';
  }

  @override
  String get pairDeviceNewCode => '새 코드';

  @override
  String get pairDeviceExpired => '이 코드는 만료되었어요.';

  @override
  String get pairDeviceNotReachable =>
      '이 서버는 이 컴퓨터에서만 응답하므로 아직 휴대폰에서 연결할 수 없어요.';

  @override
  String get pairDeviceNotReachableOther =>
      '이 서버의 주소는 자체 네트워크에서만 작동해요. 운영자에게 외부에서도 접속할 수 있는 주소를 문의해 주세요.';

  @override
  String get pairDeviceCopyLink => '링크 복사';

  @override
  String get pairDeviceLinkCopied =>
      '링크가 복사되었어요. Casama for Chrome이나 다른 기기에 붙여넣으세요.';

  @override
  String get pairDeviceConnectChrome => 'Chrome 연결';

  @override
  String get pairDeviceChromeDone => 'Casama for Chrome에 로그인되었어요.';

  @override
  String get pairDeviceChromeFinish => '방금 열린 Casama for Chrome 탭에서 마저 완료하세요.';

  @override
  String get pairDeviceChromeMissing =>
      '이 브라우저에 Casama for Chrome이 설치되어 있지 않아요.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama for Chrome에 로그인하지 못했어요. $error';
  }

  @override
  String get scanToSignIn => '컴퓨터의 코드 스캔';

  @override
  String get scanToSignInTitle => '코드 스캔';

  @override
  String get scanToSignInHelp => '로그인된 컴퓨터에서 ‘설정 → 다른 기기에서 로그인’을 여세요.';

  @override
  String pairSignInTo(String host) {
    return '$host 서버에 로그인할까요?';
  }

  @override
  String get pairSignInBody => '이 코드를 표시한 계정으로 이 기기에 로그인해요.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return '이 기기는 현재 $current 서버를 사용 중이에요. $host 서버로 로그인하면 전환돼요.';
  }

  @override
  String get pairSigningIn => '로그인 중';

  @override
  String get pairCodeInvalid => '이 코드는 더 이상 유효하지 않아요. 새 코드를 띄워 다시 스캔하세요.';

  @override
  String get pairLinkInvalid => 'Casama 로그인 코드가 아니에요.';

  @override
  String get linkServerTitle => '서버 연결';

  @override
  String linkServerBody(String name) {
    return '$name 서버가 내 Casama Cloud 계정에 연결하려고 해요.';
  }

  @override
  String get linkServerCode => '서버에 표시된 코드';

  @override
  String get linkServerCheck => '내 서버에서 직접 시작했고 동일한 코드가 표시되는 경우에만 연결하세요.';

  @override
  String get linkServerWhat => '공개 주소를 받고 알림을 보낼 수 있어요. 내 크레딧은 사용할 수 없어요.';

  @override
  String get linkServerApprove => '연결';

  @override
  String get linkServerDone => '연결됨';

  @override
  String linkServerDoneBody(String name) {
    return '$name 화면으로 돌아가세요. 이후 과정은 자동으로 이어져요.';
  }

  @override
  String get linkServerInvalid => '이 코드는 더 이상 유효하지 않아요. 서버에서 다시 시작하세요.';

  @override
  String get linkServerEnterCode => '서버에 표시된 코드';

  @override
  String get linkServerFind => '찾기';

  @override
  String get linkServerNeedAdmin => '워크스페이스 소유자와 관리자만 서버를 연결할 수 있어요.';

  @override
  String get localDockerStopped => 'Docker가 실행 중이 아니어서 서버가 중지되었어요';

  @override
  String get localDockerStoppedBody =>
      '내 Casama 서버는 이 컴퓨터의 Docker에서 실행돼요. Docker를 열면 서버가 복구되는 대로 Casama가 자동으로 다시 연결해요. 1분 정도 걸릴 수 있어요.';

  @override
  String get serverOfflineTitle => '서버가 오프라인 상태예요';

  @override
  String get serverOfflineBody =>
      '서버를 실행하는 컴퓨터가 켜져 있고 깨어 있는지 확인해 주세요. 자동으로 다시 연결돼요.';

  @override
  String get signUpsClosed => '이 서버에서는 새 계정을 받지 않아요. 여기에 이미 있는 계정으로 로그인해 주세요.';

  @override
  String get signUpsByInvitation =>
      '이 서버의 새 계정은 초대를 통해서만 가입할 수 있어요. 초대받은 이메일 주소를 사용해 주세요.';

  @override
  String get linkPrivateNotifications => '비공개 알림';

  @override
  String get linkPrivateNotificationsHelp =>
      '알림이 Casama Cloud를 통해 휴대폰으로 전달돼요. 이 옵션을 켜면 본문 내용 없이 “새 알림”이라고만 표시되고, 나머지 내용은 앱이 이 서버에서 불러와요.';

  @override
  String get linkInvites => '초대받은 사람의 가입 허용';

  @override
  String get linkInvitesHelp =>
      '끄면 아무도 새 계정을 만들 수 없어요. 켜면 이메일로 초대한 사람은 만들 수 있어요. 바꾸면 서버가 다시 시작돼요.';

  @override
  String get linkKeepAwake => '전원 연결 시 이 Mac 깨어 있음 유지';

  @override
  String get linkKeepAwakeHelp =>
      '이 컴퓨터가 깨어 있고 Casama가 열려 있는 동안에만 휴대폰에서 이 서버에 연결할 수 있어요.';

  @override
  String get linkLiveView => '외부에서 실시간 보기';

  @override
  String get linkLiveViewIncluded =>
      '플랜에 포함되어 있어요. 이 컴퓨터에서 떨어져 있을 때도 봇의 화면이 Casama Cloud의 릴레이를 통해 실시간으로 재생돼요.';

  @override
  String get linkLiveViewPlan =>
      'Casama Cloud Plus 이상 플랜에 포함돼요. 업그레이드 전에는 이 컴퓨터에서 떨어져 있을 때 봇의 화면이 약 1초마다 업데이트돼요.';

  @override
  String get liveAwayNeedsPlan =>
      '서버의 컴퓨터에서 떨어져 있을 때 실시간 영상은 Casama Cloud Plus 이상 플랜에서 제공돼요. 그 전까지는 화면이 약 1초마다 업데이트돼요.';

  @override
  String get chatShareExport => '공유 또는 내보내기';

  @override
  String get chatShareExportHelp => '이 채팅을 파일로 저장하거나 읽기 전용 링크를 만들어요.';

  @override
  String get chatExportMarkdown => 'Markdown으로 내보내기';

  @override
  String get chatExportMarkdownHelp => '누구나 읽을 수 있는 텍스트 파일';

  @override
  String get chatExportJson => 'JSON으로 내보내기';

  @override
  String get chatExportJsonHelp => '다른 앱 및 스크립트용';

  @override
  String get chatShareLink => '읽기 전용 링크 공유';

  @override
  String get chatShareLinkHelp => '링크가 있는 누구나 이 채팅을 읽을 수 있어요';

  @override
  String get chatStopSharing => '링크 공유 중지';

  @override
  String get chatStopSharingHelp => '링크 작동이 멈춰요';

  @override
  String get chatMakePublicTitle => '링크로 이 채팅을 공유할까요?';

  @override
  String get chatMakePublicBody =>
      '링크가 있는 누구나 내가 보는 그대로 이 채팅을 읽을 수 있어요. 첨부 파일은 이름만 표시되며 공유되지 않아요. 검색 엔진에는 노출되지 않아요.';

  @override
  String get chatMakePublic => '링크 만들기';

  @override
  String get chatLinkTitle => '읽기 전용 링크';

  @override
  String get chatLinkBody => '복사되었어요. 검색 엔진에는 노출되지 않아요. 새 링크를 만들면 기존 링크는 중지돼요.';

  @override
  String get chatSharingStopped => '링크가 더 이상 작동하지 않아요';

  @override
  String get creationDuplicate => '복제';

  @override
  String creationDuplicated(String title) {
    return '사본 생성됨: “$title”';
  }

  @override
  String get slackInstall => 'Slack에 추가';

  @override
  String slackInstallHelp(String bot) {
    return 'Slack 워크스페이스를 한 번에 연결해요. $bot 봇이 @멘션과 다이렉트 메시지에 답장해요.';
  }

  @override
  String get slackInstallFinish => 'Slack에서 완료한 뒤 여기로 돌아오세요.';

  @override
  String get helpAndSupport => '도움말 및 지원';

  @override
  String get helpAndSupportRow => 'Casama 도움말에 질문, 문의, 가이드';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      '가이드와 내 계정을 바탕으로 즉시 답변해 드려요. 언제든 담당자에게 연결할 수도 있어요.';

  @override
  String get supportIntro =>
      '궁금한 점이 있거나, 결제에 문제가 있거나, 작동하지 않는 기능이 있나요? 메시지를 보내 주세요.';

  @override
  String supportSelfHosted(String host) {
    return '이 워크스페이스는 $host에서 실행 중이에요. 로그인, 계정, 플랜에 관한 문의는 해당 서버 운영자에게 해 주세요. 앱 자체에 관한 문제는 저희가 도와드릴 수 있어요.';
  }

  @override
  String get supportTalkToPerson => '담당자와 대화';

  @override
  String get contactSupport => '지원팀에 문의';

  @override
  String contactSupportRow(String email) {
    return '$email 주소로 팀에 메일 보내기';
  }

  @override
  String get sendFeedback => '의견 보내기';

  @override
  String get sendFeedbackRow => '아이디어, 좋은 점, 아쉬운 점 모두 보내 주세요. 하나하나 꼼꼼히 읽어요.';

  @override
  String get feedbackHelp => 'Casama가 해주었으면 하는 일, 마음에 드는 점, 불편했던 점을 알려 주세요.';

  @override
  String get feedbackKindPrompt => '어떤 종류의 의견인가요?';

  @override
  String get feedbackKindIdea => '아이디어';

  @override
  String get feedbackKindLike => '좋아요';

  @override
  String get feedbackKindDislike => '아쉬워요';

  @override
  String get feedbackKindConfusing => '헷갈려요';

  @override
  String get feedbackMessageLabel => '의견 내용';

  @override
  String get feedbackMessageHint => '예: 채팅을 상단에 고정할 수 있으면 좋겠어요.';

  @override
  String get feedbackContactOk => '이 내용으로 연락해도 좋아요';

  @override
  String get feedbackContactOkHelp => '이메일로 추가 질문을 드리거나 반영되었을 때 알려드릴 수 있어요.';

  @override
  String get feedbackNote =>
      '앱 버전과 플랜 정보가 함께 전송돼요. 계정이나 결제 문제는 ‘지원팀에 문의’를 이용해 주세요.';

  @override
  String get feedbackThanks => '감사해요! 보내주신 의견은 모두 읽고 있어요.';

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
  String get supportIdeasBoard => '아이디어 게시판';

  @override
  String get supportIdeasBoardHelp => '다른 사람들이 요청한 기능을 보고 원하는 기능에 투표하세요';

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
  String get contactSupportHelp => '무슨 일이 있는지 알려 주세요. 이메일로 답변드릴게요.';

  @override
  String get contactSupportHelpMail =>
      '무슨 일이 있는지 알려 주세요. 세부 정보가 채워진 상태로 이메일 앱이 열려요.';

  @override
  String get supportSend => '보내기';

  @override
  String get supportWriteEmail => '이메일 열기';

  @override
  String get supportTopicPrompt => '어떤 주제인가요?';

  @override
  String get supportTopicBilling => '결제 및 구매';

  @override
  String get supportTopicBroken => '작동하지 않는 기능';

  @override
  String get supportTopicAccount => '계정 및 로그인';

  @override
  String get supportTopicQuestion => '질문 또는 아이디어';

  @override
  String get supportTopicOther => '기타';

  @override
  String get supportMessageLabel => '메시지';

  @override
  String get supportMessageHint => '무슨 일이 있었고, 어떻게 되기를 기대하셨나요?';

  @override
  String get supportMessageMore => '무엇을 하고 있었고 어떤 문제가 생겼는지 한두 문장으로 덧붙여 주세요.';

  @override
  String get supportIncludeChat => 'Casama 도움말과의 대화 포함';

  @override
  String get supportIncludeChatHelp => '같은 내용을 두 번 설명하지 않아도 되도록 해요.';

  @override
  String get supportDetailsNote =>
      '계정을 찾을 수 있도록 앱 버전, 워크스페이스 ID, 계정 ID가 함께 전송돼요. 채팅 내용은 절대 포함되지 않아요.';

  @override
  String get supportSentTitle => '메시지를 보냈어요';

  @override
  String supportSentBody(String email, String reference) {
    return '$email 주소로 답변해 드릴게요. 접수 번호: $reference';
  }

  @override
  String supportNoMailApp(String email) {
    return '이메일 앱을 찾을 수 없어 메시지를 복사해 두었어요. $email 주소로 보내는 이메일에 붙여넣어 주세요.';
  }

  @override
  String get supportGuides => '가이드 및 FAQ';

  @override
  String get supportGuidesHelp => 'Casama의 모든 기능을 단계별로 안내해요';

  @override
  String get introVideoTitle => 'Casama 작동 방식 보기';

  @override
  String get introVideoSubtitle => '1분 30초 소개 영상';

  @override
  String get supportIntroVideo => '소개 영상 보기';

  @override
  String get introVideoFailed => '영상을 재생할 수 없어요. 연결 상태를 확인한 뒤 다시 시도해 주세요.';

  @override
  String get introVideoOnYoutube => 'YouTube에서 보기';

  @override
  String get introVideoReplay => '다시 재생';

  @override
  String get supportIntroVideoHelp => '1분 30초 만에 Casama로 할 수 있는 일 살펴보기';

  @override
  String get supportRate => 'Casama 평가하기';

  @override
  String get supportRateHelp => '스토어 페이지에 다른 분들을 위한 후기를 남겨 주세요';

  @override
  String get supportIds => '지원 ID';

  @override
  String get supportIdsHelp =>
      '지원팀이 이 ID를 요청할 수 있어요. 계정과 구매 내역을 찾는 데만 쓰이며 누구에게도 접근 권한을 주지 않아요.';

  @override
  String supportWorkspaceId(String name) {
    return '워크스페이스 ID · $name';
  }

  @override
  String get supportWorkspaceIdHelp => 'App Store 및 Google Play의 구매 ID로도 사용돼요';

  @override
  String get supportAccountId => '계정 ID';

  @override
  String get supportCopyAll => '모든 정보 복사';

  @override
  String get supportCopyAllHelp => '메시지에 붙여넣을 수 있는 앱 버전, 플랫폼, ID';

  @override
  String get supportNewChat => '새 대화';

  @override
  String get supportAskHint => 'Casama에 대해 무엇이든 물어보세요';

  @override
  String get supportAiNote =>
      'Casama 도움말은 AI이므로 실수할 수 있어요. 내 채팅은 보지 않으며 플랜과 봇 오류만 확인해요.';

  @override
  String get supportGreeting =>
      '안녕하세요! Casama 도움말이에요. Casama, 플랜, 또는 겪고 계신 문제에 대해 물어보세요. 제가 해결하지 못하면 지원팀에 전달해 드릴게요.';

  @override
  String get supportStarterPurchase => '결제가 진행되지 않았어요';

  @override
  String get supportStarterCancel => '플랜을 어떻게 해지하나요?';

  @override
  String get supportStarterBot => '봇이 답장을 안 해요';

  @override
  String get supportStarterHowTo => '내 봇들이 어떤 일을 할 수 있나요?';

  @override
  String get supportAskPerson => '상담원에게 문의하기';

  @override
  String get supportHandoffTitle => '지원팀에 이 내용을 보낼까요?';

  @override
  String get supportHandoffButton => '확인하고 보내기';

  @override
  String get supportThinking => '확인하고 있어요…';

  @override
  String get supportAssistantError =>
      'Casama 도움말이 답하지 못했어요. 다시 시도하거나 상담원에게 문의해 보세요.';

  @override
  String get supportAssistantLimit =>
      '지금은 Casama 도움말이 더 답할 수 없어요. 상담원이 도와드릴 수 있어요.';

  @override
  String get purchaseHelp => '결제에 문제가 있나요? 도움받기';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => '신고';

  @override
  String get reportAndBlock => '신고 및 차단';

  @override
  String get reportReply => '답변 신고';

  @override
  String get reportBot => '봇 신고';

  @override
  String get reportBotRow => '이름이나 설명, 답변에 문제가 있어요';

  @override
  String get reportPerson => '사용자 신고';

  @override
  String get reportGalleryItem => '갤러리 항목 신고';

  @override
  String get reportGalleryRequest => '요청 신고';

  @override
  String get reportWorkspace => '워크스페이스 신고';

  @override
  String get reportHelp => '이 서버를 운영하는 담당자에게 무엇이 잘못되었는지 알려 주세요. 모든 신고를 검토해요.';

  @override
  String get reportPersonHelp =>
      '이 서버를 운영하는 담당자에게 무슨 일이 있었는지 알려 주세요. 이 사용자도 함께 차단해 드려요.';

  @override
  String get reportNote => '추가로 알릴 내용 (선택)';

  @override
  String reportAlsoBlock(String name) {
    return '$name 님도 함께 차단하기';
  }

  @override
  String get reportSent => '감사해요. 신고가 접수되어 검토될 예정이에요.';

  @override
  String get reportReasonSpam => '스팸 또는 사기';

  @override
  String get reportReasonSexual => '성적인 콘텐츠';

  @override
  String get reportReasonViolence => '폭력 또는 협박';

  @override
  String get reportReasonHarassment => '괴롭힘 또는 혐오 발언';

  @override
  String get reportReasonIllegal => '불법 또는 위험한 내용';

  @override
  String get reportReasonImpersonation => '사칭';

  @override
  String get reportReasonOther => '기타';

  @override
  String get thisPerson => '이 사용자';

  @override
  String blockPerson(String name) {
    return '$name 님 차단하기';
  }

  @override
  String blocked(String name) {
    return '$name 님이 차단되었어요';
  }

  @override
  String get blockHelp => '차단한 사용자는 워크스페이스에 초대할 수 없으며, 메시지도 받지 않아요.';

  @override
  String get blockedPeople => '차단한 사용자';

  @override
  String get blockedPeopleRow => '초대하거나 연락할 수 없는 사용자';

  @override
  String get noBlockedPeople => '차단한 사용자가 없어요';

  @override
  String get unblock => '차단 해제';

  @override
  String get emailTips => '이메일로 팁 및 소식 받기';

  @override
  String get emailTipsHelp => '시작 팁과 가끔 전해 드리는 소식이에요. 플랜과 계정에 관한 이메일은 항상 발송돼요.';

  @override
  String get reportsInApp => '앱에서 신고된 항목';

  @override
  String get reportsNone => '처리 대기 중인 신고가 없어요. 사람들이 앱에서 보낸 신고가 여기에 표시돼요.';

  @override
  String get reportsPublicLinks => '신고된 공개 링크';

  @override
  String get reportsNoLinks => '신고된 공개 링크가 없어요.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '신고 $count건',
      one: '신고 1건',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => '내리기';

  @override
  String get reportsRestore => '복구하기';

  @override
  String get reportKindReply => '봇 답변';

  @override
  String get reportKindBot => '봇';

  @override
  String get reportKindPerson => '사용자';

  @override
  String get reportKindGallery => '갤러리 항목';

  @override
  String get reportKindWorkspace => '워크스페이스';

  @override
  String get reportMarkActioned => '조치 완료';

  @override
  String reportSuspendWorkspace(String name) {
    return '$name 워크스페이스 정지하기';
  }

  @override
  String get reportDismiss => '기각: 문제없음';

  @override
  String get supportWebTitle => '웹사이트 Casama 도움말';

  @override
  String get supportWebOn => '켜짐';

  @override
  String get supportWebOff => '꺼짐';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'IP 주소 $count개 일시 정지됨',
      one: 'IP 주소 1개 일시 정지됨',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return '답변하지 못한 질문 $count개 보기';
  }

  @override
  String get ticketsOpen => '진행 중';

  @override
  String get ticketsClosed => '종료됨';

  @override
  String get ticketsAll => '전체';

  @override
  String get ticketsNone => '메시지가 없어요.';

  @override
  String get ticketClose => '닫기';

  @override
  String get ticketReopen => '다시 열기';

  @override
  String get serviceStatus => '상태';

  @override
  String get supportStatus => 'Casama Cloud 상태';

  @override
  String get supportStatusHelp => '지금 장애가 있는 서비스가 있는지 확인해요';

  @override
  String get galleryChatSuggestionLabel => '갤러리에서 가져옴';

  @override
  String get galleryChatAdd => '추가';

  @override
  String galleryChatAdded(String name) {
    return '$name 추가됨';
  }

  @override
  String galleryChatReads(String things) {
    return '읽기: $things';
  }

  @override
  String get galleryChatRunsCode => '코드 실행';

  @override
  String get galleryChatComputer => '컴퓨터 사용';

  @override
  String galleryChatNeeds(String apps) {
    return '필요한 앱: $apps';
  }

  @override
  String get galleryChatDraftLabel => '스킬 초안';

  @override
  String get galleryChatShowInstructions => '지침 보기';

  @override
  String get galleryChatHideInstructions => '지침 숨기기';

  @override
  String get galleryChatSaveSkill => '내 스킬에 저장';

  @override
  String get galleryChatSaved => '저장됨';

  @override
  String get galleryChatSavedSkill => '내 스킬에 저장했어요';

  @override
  String get galleryChatSubmit => '갤러리에 제출';

  @override
  String galleryChatSubmitTitle(String name) {
    return '$name 항목을 갤러리에 제출할까요?';
  }

  @override
  String get galleryChatSubmitBody =>
      '관리자가 먼저 검토해요. 등록되면 누구나 찾아서 사용할 수 있어요. 이메일은 공개되지 않고 표시 이름만 작성자로 표시돼요.';

  @override
  String get galleryChatSent => '보냄';

  @override
  String get galleryChatSubmitted => '검토를 위해 갤러리에 보냈어요';

  @override
  String get galleryChatSubmissionsOff => '이 서버는 갤러리 제출을 받지 않아요.';

  @override
  String get galleryPicksTitle => '맞춤 추천';

  @override
  String get galleryPicksHelp =>
      '잘 어울리는 스킬, 앱, 루틴 세트로 시작해 보세요. 나중에 언제든 바꿀 수 있어요.';

  @override
  String get galleryPicksAdd => '이 세트 추가';

  @override
  String get galleryPicksSkip => '나중에 하기';

  @override
  String galleryPicksAddNamed(String name) {
    return '$name 추가';
  }

  @override
  String get galleryPicksBestMatch => '가장 잘 맞음';

  @override
  String get galleryPicksInside => '구성 내용';

  @override
  String galleryPicksBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $count개',
      one: '봇 1개',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스킬 $count개',
      one: '스킬 1개',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '루틴 $count개',
      one: '루틴 1개',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '앱 $count개',
      one: '앱 1개',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '플러그인 $count개',
      one: '플러그인 1개',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스타일 $count개',
      one: '스타일 1개',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$name 추가됨';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$name 항목을 추가했어요. ‘앱’에서 $apps 연결을 완료해 주세요.';
  }

  @override
  String galleryPicksPending(String name) {
    return '관리자가 $name 항목을 확인한 후 추가해요.';
  }

  @override
  String get galleryPolicyTitle => '갤러리';

  @override
  String get galleryPolicyRow => '이 워크스페이스에서 갤러리에서 추가할 수 있는 항목';

  @override
  String get galleryPolicyMode => '추가 권한';

  @override
  String get galleryPolicyOpen => '자유롭게 허용';

  @override
  String get galleryPolicyOpenHelp => '차단되지 않은 항목은 누구나 추가할 수 있어요.';

  @override
  String get galleryPolicyApproval => '먼저 물어보기';

  @override
  String get galleryPolicyApprovalHelp =>
      '아래에서 선택한 항목을 추가할 때 먼저 관리자에게 승인을 요청해요.';

  @override
  String get galleryPolicyAllowlist => '허용 목록만';

  @override
  String get galleryPolicyAllowlistHelp => '허용 목록에 있는 항목만 추가할 수 있어요.';

  @override
  String get galleryPolicyApprovalFor => '먼저 물어볼 항목';

  @override
  String get galleryPolicyRunsCode => '코드를 실행하는 항목';

  @override
  String get galleryPolicyApps => '앱을 연결하는 항목';

  @override
  String get galleryPolicyAll => '모든 항목';

  @override
  String get galleryPolicyAllowed => '허용됨';

  @override
  String get galleryPolicyAllowedHelp =>
      '승인 없이 바로 추가돼요. ‘허용 목록만’을 선택하면 이 목록의 항목만 추가할 수 있어요.';

  @override
  String get galleryPolicyBlocked => '차단됨';

  @override
  String get galleryPolicyBlockedHelp => '누구도 이 항목을 추가할 수 없어요.';

  @override
  String get galleryPolicyAddItem => '갤러리에서 추가';

  @override
  String get galleryPolicyNone => '아직 항목이 없어요';

  @override
  String get galleryPolicySearch => '갤러리 검색';

  @override
  String get galleryPolicyNoResults => '갤러리에서 일치하는 항목이 없어요.';

  @override
  String get galleryPolicySaved => '갤러리 규칙을 저장했어요';

  @override
  String galleryPolicyRemove(String name) {
    return '$name 삭제';
  }

  @override
  String get galleryPolicyAdminsOnly => '관리자와 소유자만 변경할 수 있어요.';

  @override
  String get galleryPolicyWaiting => '승인 대기 중';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name 님이 요청함';
  }

  @override
  String get galleryPolicyApprove => '승인';

  @override
  String get galleryPolicyDecline => '거절';

  @override
  String galleryPolicyApproved(String name) {
    return '$name 항목이 승인되어 추가되었어요';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name 항목이 거절되었어요';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return '승인되었지만 $name 항목을 추가하지 못했어요. $error';
  }

  @override
  String get galleryDigestEmails => '월간 갤러리 소식';

  @override
  String get galleryDigestHelp =>
      '사용 패턴에 맞는 새로운 스킬, 앱, 루틴을 한 달에 한 번 최대 6개 보내드려요.';

  @override
  String get newsletterTitle => 'Casama 월간 이메일';

  @override
  String get newsletterHelp => '새 소식과 앞으로의 계획을 한 달에 최대 한 번 보내드려요.';

  @override
  String get newsletterSignUp =>
      'Casama 월간 이메일을 받고 싶어요. 새 소식과 앞으로의 계획을 한 달에 최대 한 번 보내 주세요.';

  @override
  String get newsletterCardTitle => 'Casama 월간 이메일을 받아볼까요?';

  @override
  String get newsletterCardBody =>
      '새 소식과 앞으로의 계획을 한 달에 최대 한 번 보내드려요. 언제든 그만 받을 수 있어요.';

  @override
  String get newsletterCardYes => '네, 보내 주세요';

  @override
  String get newsletterCardNo => '괜찮아요';

  @override
  String get newsletterCardDone => '신청되었어요. 설정에서 언제든 끌 수 있어요.';

  @override
  String get galleryKindApp => '앱';

  @override
  String get galleryKindApps => '앱';

  @override
  String get galleryKindBot => '스타터 봇';

  @override
  String get galleryKindBots => '스타터 봇';

  @override
  String get galleryKindRoutine => '루틴';

  @override
  String get galleryKindRoutines => '루틴';

  @override
  String get galleryKindPlugin => '플러그인';

  @override
  String get galleryKindPlugins => '플러그인';

  @override
  String get galleryKindSet => '스타터 세트';

  @override
  String get galleryKindSets => '스타터 세트';

  @override
  String get galleryTabBrowse => '둘러보기';

  @override
  String get galleryTabInstalled => '설치됨';

  @override
  String get gallerySearchEverything => '전체 검색';

  @override
  String get galleryNewBadge => '신규';

  @override
  String get galleryRowPicks => '엄선';

  @override
  String get galleryRowNew => '신규';

  @override
  String get galleryRowTrending => '이번 주 인기';

  @override
  String get galleryRowMostUsed => '가장 많이 사용됨';

  @override
  String get galleryRowWorksWith => '현재 연결된 앱과 호환';

  @override
  String get galleryRowSets => '스타터 세트';

  @override
  String get galleryRowSeasonal => '시즌 인기';

  @override
  String get galleryFilterFree => '무료';

  @override
  String get galleryFilterPlan => '크레딧 사용';

  @override
  String get galleryFilterSelfHosted => '자체 호스팅 지원';

  @override
  String get galleryFilterComputer => '컴퓨터 필요';

  @override
  String get galleryNoFilterMatches => '이 필터와 일치하는 항목이 없어요';

  @override
  String get galleryClearFilters => '필터 지우기';

  @override
  String get galleryRequestThis => '제작 요청하기';

  @override
  String get galleryAskCasama => 'Casama에 만들어 달라고 하기';

  @override
  String galleryAskPrompt(String query) {
    return '이 작업을 위한 항목을 만들어 줘: $query';
  }

  @override
  String get galleryAccessTitle => '접근 가능한 항목';

  @override
  String galleryAccessReads(String things) {
    return '읽기: $things';
  }

  @override
  String get galleryAccessRunsCode => '코드 실행';

  @override
  String get galleryAccessComputer => '컴퓨터 사용';

  @override
  String get galleryAccessNothing => '내 정보를 읽거나 변경하지 않아요';

  @override
  String get galleryCreditsNone => '크레딧 사용 안 함';

  @override
  String get galleryCreditsLow => '크레딧 적게 사용';

  @override
  String get galleryCreditsMedium => '크레딧 보통 사용';

  @override
  String get galleryCreditsHigh => '크레딧 많이 사용';

  @override
  String get galleryTryIt => '사용해 보기';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$shown명 사용 중',
      one: '1명 사용 중',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '실행 완료율 $percent%';
  }

  @override
  String get galleryAbout => '정보';

  @override
  String get galleryMadeByCasama => 'Casama 제작';

  @override
  String get galleryMadeByCommunity => '커뮤니티 제작';

  @override
  String get galleryMadeReviewed => '검토 완료';

  @override
  String get galleryReviewedHelp => '이 버전의 테스트를 통과했어요';

  @override
  String galleryMoreFrom(String name) {
    return '$name 님의 다른 항목';
  }

  @override
  String galleryVersion(int version) {
    return '버전 $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return '업데이트: $date';
  }

  @override
  String galleryRemixOf(String name) {
    return '$name 리믹스';
  }

  @override
  String galleryChangesTitle(String name) {
    return '$name 변경 사항';
  }

  @override
  String get galleryBreaking => '작동 방식 변경됨';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '갤러리 항목 $count개',
      one: '갤러리 항목 1개',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => '이 작성자가 갤러리에 올린 항목이 아직 없어요.';

  @override
  String get galleryInstalledWorkspace => '이 워크스페이스에 설치됨';

  @override
  String get galleryInstalledDevice => '이 기기의 스타일';

  @override
  String get galleryInstalledEmptyTitle => '아직 추가된 항목이 없어요';

  @override
  String get galleryInstalledEmpty =>
      '갤러리에서 추가한 스킬, 앱, 루틴, 스타일과 업데이트가 여기에 표시돼요.';

  @override
  String get galleryInstalledError => '설치된 항목을 불러오지 못했어요.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '업데이트 $count개',
      one: '업데이트 1개',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => '업데이트';

  @override
  String galleryUpdated(String name) {
    return '$name 업데이트됨';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return '버전 $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return '$name 항목을 업데이트할까요?';
  }

  @override
  String get galleryUpdateAccessHelp => '새 버전은 현재 버전보다 더 많은 작업을 할 수 있어요:';

  @override
  String get galleryUpdateBreakingHelp => '새 버전은 작동 방식이 다르므로 업데이트한 뒤 확인해 주세요.';

  @override
  String galleryUpdateNowReads(String things) {
    return '이제 읽기 가능: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return '이제 다음 작업 가능: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => '이제 코드 실행 가능';

  @override
  String get galleryUpdateNowComputer => '이제 컴퓨터를 사용해요';

  @override
  String get galleryRemove => '삭제';

  @override
  String galleryRemoveTitle(String name) {
    return '$name 항목을 삭제할까요?';
  }

  @override
  String get galleryRemoveHelp => '이 워크스페이스에서 삭제돼요. 갤러리에서 언제든 다시 추가할 수 있어요.';

  @override
  String galleryRemoved(String name) {
    return '$name 삭제됨';
  }

  @override
  String get galleryRetired => '갤러리에 더 이상 없음';

  @override
  String get galleryRetiredReplaced => '갤러리에 더 이상 없으며 대체 항목이 있어요';

  @override
  String get gallerySeeReplacement => '대체 항목 보기';

  @override
  String get galleryForgetLook => '이 목록에서 삭제';

  @override
  String galleryWizardTitle(String name) {
    return '$name 추가';
  }

  @override
  String get galleryWizardAdd => '추가';

  @override
  String get galleryWizardRequired => '이 항목을 입력해 주세요';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '항목 $count개 포함',
      one: '항목 1개 포함',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => '필요한 항목';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스킬 $count개, 자동으로 추가됨',
      one: '스킬 1개, 자동으로 추가됨',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return '연결할 앱: $apps';
  }

  @override
  String get galleryWizardBot => '어떤 봇에 추가할까요';

  @override
  String get galleryWizardPickBot => '봇 선택';

  @override
  String get galleryWizardSetBotHelp => '세트의 루틴이 들어갈 봇이에요. 선택하지 않으면 루틴은 제외돼요.';

  @override
  String get galleryWizardSetNotAdded => '추가되지 않음';

  @override
  String get galleryWizardNeedsTitle => '앱 연결';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '아래 앱을 연결하면 $name 항목이 작동해요.';
  }

  @override
  String get galleryWizardSkillAdded => '추가됨';

  @override
  String get galleryWizardConnected => '연결됨';

  @override
  String get galleryWizardConnect => '연결하기';

  @override
  String galleryWizardConnectInApps(String name) {
    return '설정 → 앱에서 $name 항목을 연결해 주세요.';
  }

  @override
  String get galleryWizardContinue => '계속';

  @override
  String get galleryWizardSkip => '나중에';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name 준비 완료';
  }

  @override
  String get galleryWizardDoneHelp => '다른 항목들과 함께 보관함에서 찾을 수 있어요.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return '모든 기능을 쓰려면 다음 앱을 연결해야 해요: $apps';
  }

  @override
  String get galleryWizardPendingTitle => '승인 대기 중';

  @override
  String get galleryWizardPendingHelp =>
      '이 워크스페이스에서는 관리자의 승인이 필요해요. 승인되면 바로 추가돼요.';

  @override
  String get galleryRequestsTitle => '요청 게시판';

  @override
  String get galleryRequestsHelp =>
      '갤러리에 있었으면 하는 아이디어예요. 원하는 항목에 투표하면 제작자가 인기 요청부터 참고해 만들어요.';

  @override
  String get galleryRequestsLinkHelp => '아직 없는 항목을 요청하거나 투표하기';

  @override
  String get galleryRequestsTop => '인기순';

  @override
  String get galleryRequestsNew => '최신순';

  @override
  String get galleryRequestsEmpty => '아직 요청이 없어요. 첫 요청을 남겨 보세요.';

  @override
  String get galleryRequestsError => '요청을 불러오지 못했어요.';

  @override
  String get galleryRequestNew => '새 요청';

  @override
  String get galleryRequestNewHelp =>
      '누군가 만들어 주길 바라는 기능을 적어 주세요. 비슷한 요청은 하나로 합쳐져요.';

  @override
  String get galleryRequestKind => '종류';

  @override
  String get galleryRequestTitleLabel => '어떤 기능을 원하나요?';

  @override
  String get galleryRequestTitleLength => '4~80자로 입력해 주세요.';

  @override
  String get galleryRequestDetails => '자세한 내용 (선택)';

  @override
  String get galleryRequestSend => '요청 보내기';

  @override
  String get galleryRequestSent => '요청을 보냈어요';

  @override
  String galleryRequestSimilar(String title) {
    return '“$title” 요청이 이미 있어서 해당 항목에 투표했어요';
  }

  @override
  String get galleryRequestMine => '내 요청';

  @override
  String get galleryRequestVote => '투표';

  @override
  String get galleryRequestOpen => '접수됨';

  @override
  String get galleryRequestPlanned => '계획됨';

  @override
  String get galleryRequestDone => '완료됨';

  @override
  String get galleryRequestDeclined => '반려됨';

  @override
  String get gallerySubmitStart => '갤러리에 제출';

  @override
  String get gallerySubmissionsLinkHelp => '직접 만든 스타일, 스킬, 루틴, 봇 공유하기';

  @override
  String get gallerySubmitPick => '무엇을 공유할까요?';

  @override
  String get gallerySubmitPickHelp => '직접 만든 항목을 선택하세요. 검토 후 갤러리에 등록돼요.';

  @override
  String get galleryLooksMine => '내 스타일';

  @override
  String get gallerySubmitCurrentScheme => '사용 중인 색 구성표';

  @override
  String get gallerySubmitCurrentWallpaper => '사용 중인 배경화면';

  @override
  String get gallerySubmitMyWallpaper => '내 배경화면';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': '앱 제출',
      'bot': '스타터 봇 제출',
      'routine': '루틴 제출',
      'plugin': '플러그인 제출',
      'set': '스타터 세트 제출',
      'theme': '테마 제출',
      'scheme': '색상 테마 제출',
      'wallpaper': '배경화면 제출',
      'other': '스킬 제출',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp => '표시 이름이 작성자로 표시돼요. 이메일은 절대 공유되지 않아요.';

  @override
  String get gallerySubmitName => '이름';

  @override
  String get gallerySubmitNameLength => '1~60자로 입력해 주세요.';

  @override
  String get gallerySubmitTags => '태그';

  @override
  String get gallerySubmitTagsHelp => '쉼표로 구분해 최대 6개';

  @override
  String get gallerySubmitLicense => '라이선스';

  @override
  String gallerySubmitRemix(String name) {
    return '원본 출처 표시: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed => '원본 갤러리 항목 출처 표시';

  @override
  String get gallerySubmitSend => '제출';

  @override
  String get gallerySubmitted => '검토를 위해 보냈어요';

  @override
  String get gallerySubmissionsTitle => '내 제출 내역';

  @override
  String get gallerySubmissionsHelp => '갤러리에 보낸 항목과 진행 상태예요.';

  @override
  String get gallerySubmissionsSent => '보낸 항목';

  @override
  String get gallerySubmissionsEmpty => '아직 보낸 항목이 없어요.';

  @override
  String get gallerySubmissionsError => '제출 내역을 불러오지 못했어요.';

  @override
  String get gallerySubmissionOpen => '검토 중';

  @override
  String get gallerySubmissionMerged => '갤러리에 등록됨';

  @override
  String get gallerySubmissionClosed => '승인되지 않음';

  @override
  String get gallerySubmissionFailed => '전송하지 못했어요';

  @override
  String get galleryMyItems => '갤러리에 등록한 내 항목';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '미처리 신고 $count건',
      one: '미처리 신고 1건',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => '봇';

  @override
  String get islandNeedsOk => '승인 필요';

  @override
  String get islandTakeOver => '직접 조작 요청';

  @override
  String get islandWriting => '답변 작성 중';

  @override
  String get islandWorking => '작업 중';

  @override
  String get islandFinished => '완료됨';

  @override
  String get islandStoppedProblem => '문제로 중단됨';

  @override
  String get islandOnThisMac => '이 Mac에서';

  @override
  String get islandStale => '최신 내용을 보려면 Casama를 여세요';

  @override
  String get islandOpen => '열기';

  @override
  String get islandStop => '중지';

  @override
  String get islandAllow => '허용';

  @override
  String get islandDeny => '거부';

  @override
  String get islandReview => '검토';

  @override
  String get islandNothing => '지금 작업 중인 봇이 없어요';

  @override
  String get islandQuickAsk => '빠른 질문…';

  @override
  String get islandOpenCasama => 'Casama 열기';

  @override
  String get islandSettings => '설정…';

  @override
  String get islandQuit => 'Casama 종료';

  @override
  String get islandAskHint => '봇에게 물어보기…';

  @override
  String get islandNeedsYou => '확인 필요';

  @override
  String get islandDropHere => '놓아서 봇에게 물어보기';

  @override
  String get siriSignedOut => '먼저 Casama에 로그인해 주세요.';

  @override
  String get siriOpenToFinish => '완료하려면 Casama를 열어 주세요.';

  @override
  String get siriTooMany => '잠깐 사이에 요청이 너무 많아요. 계속하려면 Casama를 열어 주세요.';

  @override
  String get siriNoCredits => '크레딧이 부족해요. Casama를 열어 추가해 주세요.';

  @override
  String get siriOffline => '지금은 Casama가 인터넷에 연결할 수 없어요.';

  @override
  String siriNeedsYou(String bot) {
    return '먼저 $bot 봇의 승인이 필요해요. Casama를 열어 확인해 주세요.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot 봇에 문제가 생겼어요. Casama를 열어 내용을 확인해 주세요.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot 봇이 답했어요. Casama를 열어 확인해 주세요.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot 봇이 아직 작업 중이에요. 끝나면 알림을 보내드릴게요.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot 봇이 답했어요.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return '$routine 루틴을 시작했어요.';
  }

  @override
  String get siriNothingNeedsYou => '지금은 확인이 필요한 항목이 없어요.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '확인이 필요한 항목이 $count개 있어요.',
      one: '확인이 필요한 항목이 1개 있어요.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return '답변을 기다리는 봇: $bots.';
  }

  @override
  String get siriComputersUnavailable => '이 계정에서는 컴퓨터를 사용할 수 없어요.';

  @override
  String get siriNoComputers => '이 워크스페이스에는 컴퓨터가 없어요.';

  @override
  String siriStartingComputer(String computer) {
    return '$computer 컴퓨터를 시작하고 있어요.';
  }

  @override
  String get siriComputerFailed => '지금은 컴퓨터를 시작할 수 없어요.';

  @override
  String get siriWhichBotToStop => '어떤 봇을 멈출까요?';

  @override
  String get siriBotNotRunning => '그 봇은 지금 실행 중이 아니에요.';

  @override
  String get siriStopped => '멈췄어요.';

  @override
  String get siriStopFailed => '지금은 봇을 멈출 수 없어요.';

  @override
  String get focusFilterShowingAll => '집중 모드 필터 · 모두 표시 중';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '집중 모드 필터 · $count개 표시 중',
      one: '집중 모드 필터 · 1개 표시 중',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama는 만 13세 이상부터 이용할 수 있어요';

  @override
  String get under13Body =>
      '이 계정은 입력된 연령대에 따라 Casama를 이용할 수 없어요. 로그아웃하거나 다른 계정에서 데이터를 내보낼 수 있어요.';

  @override
  String get siriSpotlightSetting => 'Spotlight 및 Siri에 표시';

  @override
  String get siriSpotlightSettingHelp =>
      '봇 이름, 루틴 이름, 대화 제목이 이 기기의 Spotlight 및 Siri에 표시돼요. 대화 내용은 절대 표시되지 않으며, 앱 잠금이 켜져 있으면 꺼져요.';

  @override
  String get geminiSetting => 'Gemini가 Casama를 사용하도록 허용';

  @override
  String get geminiSettingHelp =>
      'Gemini에게 Casama를 사용해 달라고 하면, Gemini가 이 휴대폰에서 내 봇에게 질문하고, 확인이 필요한 항목을 보고, 루틴을 실행할 수 있어요. Gemini는 아무것도 승인하지 않으며, 요청은 여기에서 열려요. 비공개 워크스페이스이거나 ‘답변 내용 숨기기’ 또는 앱 잠금이 켜져 있으면 답변은 표시되지 않아요.';

  @override
  String get geminiOff =>
      '이 휴대폰에서 Casama의 Gemini 연동이 꺼져 있어요. Casama의 설정 → 개인정보 보호에서 켜 주세요.';

  @override
  String get islandBotWorking => '봇이 작업 중이에요';

  @override
  String get islandOnThisComputer => '이 컴퓨터에서';

  @override
  String get islandOnACall => '통화 중';

  @override
  String get islandStartElsewhere => '다른 기기에서 시작한 봇';

  @override
  String get islandStartElsewhereHelp =>
      'Mac 등 다른 기기에서 시작한 작업을 이 휴대폰의 잠금 화면에도 표시해요.';

  @override
  String get islandBotsAtWork => '작업 중인 봇';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count단계',
      one: '1단계',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => '노치에 봇 표시';

  @override
  String get showBotsInNotchHelp =>
      '카메라 주변에 봇이 하는 작업을 표시해요. 메뉴 막대 아이콘에는 항상 표시돼요.';

  @override
  String get notchOnHover => '마우스를 올리면 노치 열기';

  @override
  String get notchOnHoverHelp => '끄면 노치를 클릭해야 열려요.';

  @override
  String get sitePublishToWeb => '웹에 게시';

  @override
  String get sitePublishToWebHelp => '고유한 웹 주소를 부여해요.';

  @override
  String get siteAddressName => '주소 이름';

  @override
  String get siteAddressRules =>
      '영문 소문자, 숫자, 하이픈을 조합해 3~40자로 입력하고, 시작과 끝은 영문자 또는 숫자로 입력해 주세요.';

  @override
  String get siteAddressChecking => '확인 중…';

  @override
  String get siteAddressAvailable => '사용 가능';

  @override
  String get siteAddressTaken => '이미 사용 중인 이름이에요.';

  @override
  String get siteAnyoneCanOpen => '주소를 아는 사람이라면 누구나 열 수 있게 돼요.';

  @override
  String get sitePublish => '게시';

  @override
  String get siteOnTheWeb => '웹에 게시됨';

  @override
  String get siteSearchEngines => '검색 엔진에 노출 허용';

  @override
  String get siteSearchEnginesHelp => 'Google 및 다른 검색 엔진에 표시되도록 허용해요.';

  @override
  String get siteSearchEnginesPaid => '유료 플랜이 필요해요.';

  @override
  String get siteUseOwnDomain => '내 도메인 사용';

  @override
  String get siteUnpublish => '게시 취소';

  @override
  String get siteUnpublishTitle => '이 사이트 게시를 취소할까요?';

  @override
  String get siteUnpublishBody => '웹 주소로 더 이상 열리지 않아요. 라이브러리에 항목은 그대로 남아 있어요.';

  @override
  String get siteHostLive => '게시 중';

  @override
  String get siteHostWaitingForDns => 'DNS 대기 중';

  @override
  String get siteHostGettingCertificate => '인증서 발급 중';

  @override
  String get siteHostNeedsAttention => '확인 필요';

  @override
  String get siteHostPaused => '일시 중지됨';

  @override
  String get siteHostSuspended => '정지됨';

  @override
  String get settingsDomains => '도메인';

  @override
  String get settingsDomainsHelp => '보유한 도메인으로 사이트를 열 수 있어요.';

  @override
  String get settingsSearchHint => '설정 검색';

  @override
  String settingsSearchNone(String query) {
    return '“$query” 검색 결과와 일치하는 설정이 없어요.';
  }

  @override
  String get domainsEmpty => 'bakery.com처럼 보유한 도메인을 연결하면 그 주소에서 사이트가 열려요.';

  @override
  String get domainsConnectOwn => '보유한 도메인 연결';

  @override
  String get domainStateLive => '게시 중';

  @override
  String get domainStateWaitingDns => 'DNS 대기 중';

  @override
  String get domainStateWaitingCert => '인증서 발급 중';

  @override
  String get domainStatePaused => '일시 중지됨';

  @override
  String get domainStateNeedsAttention => '확인 필요';

  @override
  String get domainNoSite => '아직 연결된 사이트 없음';

  @override
  String get domainConnectField => '내 도메인';

  @override
  String get domainConnectHelp =>
      'bakery.com, www.bakery.com, shop.bakery.com 형식으로 입력해 주세요.';

  @override
  String get domainConnectSite => '표시할 사이트';

  @override
  String get domainSiteNone => '없음';

  @override
  String get domainSiteNoneHelp => '사이트를 선택할 때까지 도메인에 아무것도 표시되지 않아요.';

  @override
  String get domainConnect => '연결';

  @override
  String get domainClaimTitle => '소유권 확인';

  @override
  String get domainClaimBody =>
      '다른 워크스페이스에서 이 도메인을 이미 연결했어요. 소유권을 확인하려면 아래 레코드를 추가한 뒤 ‘연결’을 다시 탭해 주세요.';

  @override
  String get domainRecordType => '유형';

  @override
  String get domainRecordName => '이름';

  @override
  String get domainRecordValue => '값';

  @override
  String get domainSite => '사이트';

  @override
  String get domainPickSite => '사이트 선택';

  @override
  String get domainHosts => '주소';

  @override
  String get domainPrimary => '기본 주소';

  @override
  String get domainPrimaryHelp => '방문자가 이 주소로 접속하며, 다른 주소는 이 주소로 자동 연결돼요.';

  @override
  String get domainMakePrimary => '기본 주소로 설정';

  @override
  String get domainRecordsTitle => '추가할 레코드';

  @override
  String get domainRecordsAtCloudflare =>
      'Cloudflare에서 이 레코드를 추가하고 ‘DNS 전용’으로 설정하세요.';

  @override
  String domainRecordsAt(String provider) {
    return '$provider의 DNS 설정에서 이 레코드를 추가하세요.';
  }

  @override
  String get domainRecordsGeneric =>
      '보통 도메인을 구입한 업체의 DNS 관리 페이지에서 이 레코드를 추가하세요.';

  @override
  String get domainRecordsNone => '추가할 항목이 없어요. 모든 설정이 완료되었어요.';

  @override
  String get domainRecordOptional => '선택';

  @override
  String domainRecordForward(String from, String to) {
    return '도메인을 구입한 업체에서 $from 주소를 $to 주소로 전달(포워딩)하도록 켜 주세요.';
  }

  @override
  String get domainRecordFound => '확인됨';

  @override
  String get domainRecordNotFound => '아직 확인되지 않음';

  @override
  String get domainCheckAgain => '다시 확인';

  @override
  String get domainCheckTooSoon => '방금 확인했어요. 몇 초 뒤에 다시 시도해 주세요.';

  @override
  String get domainChecksItself => '자동으로도 계속 확인하므로 이 화면을 나가셔도 괜찮아요.';

  @override
  String get domainHistory => '기록';

  @override
  String get domainEventConnected => '연결됨';

  @override
  String get domainEventProved => '레코드 확인됨';

  @override
  String get domainEventLive => '게시 중';

  @override
  String get domainEventNeedsDns => '아직 DNS 대기 중';

  @override
  String get domainEventFailed => '설정을 완료하지 못했어요';

  @override
  String get domainEventDisconnected => '레코드가 삭제되어 연결이 해제되었어요';

  @override
  String get domainEventPaused => '일시 중지됨: 현재 플랜에서 지원되지 않아요';

  @override
  String get domainEventResumed => '다시 켜짐';

  @override
  String get domainEventRemoved => '연결 해제됨';

  @override
  String get domainEventClaim => '소유권 확인 요청됨';

  @override
  String get domainEventClaimAttempt => '다른 워크스페이스에서 연결을 시도했어요';

  @override
  String get domainEventOverLimit => '플랜 한도 초과';

  @override
  String get domainEventSuspended => '정지됨';

  @override
  String get domainEventOther => '업데이트됨';

  @override
  String domainDisconnectTitle(String name) {
    return '$name 연결을 해제할까요?';
  }

  @override
  String get domainDisconnectBody =>
      '이 도메인에서 사이트가 더 이상 열리지 않아요. 나중에 DNS 업체에서 해당 레코드를 삭제할 수 있어요.';

  @override
  String get domainsFind => '도메인 찾기';

  @override
  String get domainsEmptyBuy => '사이트용 도메인을 구입하거나 보유한 도메인을 연결하세요.';

  @override
  String get domainFindField => '이름 또는 몇 가지 단어';

  @override
  String get domainFindHint => '빵집';

  @override
  String get domainFindHelp => '표시된 가격은 연간 요금이며 세금 별도예요.';

  @override
  String get domainFindNone => '이름을 찾지 못했어요. 다른 단어로 시도해 보세요.';

  @override
  String get domainFindNotOffered =>
      '이 앱에서는 도메인 구입을 지원하지 않아요. 보유한 도메인은 연결할 수 있어요.';

  @override
  String domainPricePerYear(String price) {
    return '연 $price (세금 별도)';
  }

  @override
  String domainRenewsAt(String price) {
    return '갱신 시 $price';
  }

  @override
  String get domainReasonTaken => '사용 중';

  @override
  String get domainReasonPremium => '프리미엄 도메인이라 여기에서 판매하지 않아요';

  @override
  String get domainReasonNotSold => '여기에서 판매하지 않는 도메인이에요';

  @override
  String get domainBuy => '구입';

  @override
  String domainBuyTitle(String name) {
    return '$name 구입';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '첫해 $price, 이후 매년 $renew (세금 별도).';
  }

  @override
  String get domainBuyFinal =>
      '도메인이 등록되면 취소 및 환불이 불가해요. 등록할 수 없는 경우에는 전액 환불해 드려요.';

  @override
  String get domainBuyTerms => '도메인 이용약관에 동의해요';

  @override
  String get domainBuyReadTerms => '약관 읽기';

  @override
  String get domainRenewAuto => '자동 갱신';

  @override
  String get domainRenewAutoHelp => '만료 약 2주 전에 저장된 결제 수단으로 자동 청구돼요.';

  @override
  String get domainBuySite => '표시할 사이트';

  @override
  String get domainBuyPayInBrowser =>
      '브라우저에서 결제를 완료해 주세요. 이 화면에 진행 상황이 바로 반영돼요.';

  @override
  String get domainContactTitle => '연락처 정보';

  @override
  String get domainContactHelp =>
      '도메인을 등록할 개인 또는 사업자 정보예요. 등록 대행업체가 이 정보를 비공개로 보호해요.';

  @override
  String get domainContactFirstName => '이름';

  @override
  String get domainContactLastName => '성';

  @override
  String get domainContactOrganization => '사업자명 (선택)';

  @override
  String get domainContactAddress1 => '주소';

  @override
  String get domainContactAddress2 => '상세 주소 (선택)';

  @override
  String get domainContactCity => '시/군/구';

  @override
  String get domainContactState => '시/도';

  @override
  String get domainContactZip => '우편번호';

  @override
  String get domainContactCountry => '국가 코드';

  @override
  String get domainContactCountryHint => 'US';

  @override
  String get domainContactPhone => '전화번호';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => '이메일';

  @override
  String get domainContactRequired => '필수 항목';

  @override
  String get domainContactCountryInvalid => 'KR, US 등 두 글자 코드를 입력해 주세요';

  @override
  String get domainContactPhoneInvalid =>
      '+1 415 555 0100 같은 국제 전화 형식으로 입력해 주세요';

  @override
  String get domainContactEmailInvalid => '올바른 이메일을 입력해 주세요';

  @override
  String get domainContactSave => '저장';

  @override
  String get domainContactSaved => '연락처 정보를 저장했어요.';

  @override
  String get domainContactChangeNote =>
      '변경 사항은 이 워크스페이스에서 구입한 모든 도메인에 적용돼요. 새 이메일은 다시 인증해야 해요.';

  @override
  String get domainOrderTitle => '주문 내역';

  @override
  String get domainOrderWaitingPayment => '브라우저에서 결제를 기다리고 있어요.';

  @override
  String domainOrderRegistering(String name) {
    return '$name 등록 중…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return '$name 설정 중…';
  }

  @override
  String domainOrderRefunding(String name) {
    return '$name 도메인을 등록하지 못했어요. 지금 환불을 진행하고 있어요…';
  }

  @override
  String domainOrderRefunded(String name) {
    return '$name 도메인을 등록하지 못해 전액 환불해 드렸어요.';
  }

  @override
  String get domainOrderAbandoned => '결제가 완료되지 않아 청구되지 않았어요.';

  @override
  String get domainOrderNeedsAttention =>
      '이 주문에 문제가 발생했어요. 담당팀에 전달되었으니 곧 해결해 드릴게요.';

  @override
  String domainOrderDone(String name) {
    return '$name 도메인을 확보했어요.';
  }

  @override
  String get domainOrderLeave => '이 화면을 나가셔도 괜찮아요. 준비되면 알려 드릴게요.';

  @override
  String get domainOrderBack => '도메인으로 돌아가기';

  @override
  String domainRenewsOn(String date) {
    return '갱신일: $date';
  }

  @override
  String domainExpiresOn(String date) {
    return '만료일: $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '연 $price (세금 별도)';
  }

  @override
  String get domainRenewNow => '지금 갱신';

  @override
  String get domainRenewPayInBrowser =>
      '브라우저에서 결제를 완료해 주세요. 결제가 끝나면 새 날짜가 여기에 표시돼요.';

  @override
  String get domainRenewCharged => '갱신되었어요. 잠시 후 새 날짜가 여기에 표시돼요.';

  @override
  String get domainRegistration => '등록 정보';

  @override
  String domainExpired(String date) {
    return '$date에 만료되었어요. 유지하려면 만료일로부터 25일 이내에 갱신하세요.';
  }

  @override
  String get domainLapsed =>
      '이 도메인은 기간이 지나 실효되었어요. 복구 가능 여부는 고객지원으로 문의해 주세요(복구가 보장되지는 않아요).';

  @override
  String get domainSuspendedLine => '이 도메인은 정지되었어요. 사유를 확인하려면 고객지원으로 문의해 주세요.';

  @override
  String get domainVerifyTitle => '등록자 이메일 인증';

  @override
  String get domainVerifyBody =>
      '등록 대행업체가 등록자의 이메일 주소로 메일을 보냈어요. 메일을 열어 인증하지 않으면 도메인이 작동하지 않아요.';

  @override
  String get domainVerifySendAgain => '다시 보내기';

  @override
  String get domainVerifySent => '보냈어요. 등록자의 수신함을 확인해 주세요.';

  @override
  String get domainDnsRecords => 'DNS 레코드';

  @override
  String get domainDnsRecordsHelp => '이메일, 하위 도메인 및 사이트 확인용';

  @override
  String get domainMoveOut => '다른 등록 대행업체로 이전';

  @override
  String domainMoveOutAfter(String date) {
    return '$date 이후에 이전할 수 있어요';
  }

  @override
  String get domainMoveOutHelp => '다른 등록 대행업체용 이전 코드 받기';

  @override
  String domainMoveOutTitle(String name) {
    return '$name 도메인을 이전할까요?';
  }

  @override
  String domainMoveOutBody(String name) {
    return '이 작업을 진행하면 도메인 잠금이 해제되고 이전 코드가 한 번만 표시돼요. 확인하려면 $name 입력란에 도메인을 입력해 주세요.';
  }

  @override
  String get domainMoveOutConfirm => '이전 코드 받기';

  @override
  String domainMoveOutLocked(String date) {
    return '$date 이후에 이전할 수 있어요.';
  }

  @override
  String get domainTransferCodeTitle => '이전 코드';

  @override
  String get domainTransferCodeBody =>
      '이 코드를 새 등록 대행업체에 전달하세요. 이 한 번만 표시되므로 지금 복사해 두세요.';

  @override
  String get domainTransferCode => '코드';

  @override
  String get domainUnlocked => '이전을 위해 잠금 해제됨';

  @override
  String get domainLockAgain => '다시 잠그기';

  @override
  String get domainLocked => '다시 잠겼어요.';

  @override
  String get domainReauthTitle => '다시 로그인';

  @override
  String get domainReauthSendCode => '이메일로 코드 받기';

  @override
  String domainReauthCodeSent(String email) {
    return '$email 주소로 코드를 보냈어요.';
  }

  @override
  String get domainReauthCode => '이메일로 받은 코드';

  @override
  String get domainReauthSignIn => '로그인';

  @override
  String get domainReauthSignOut => '로그아웃 후 다시 로그인한 다음 한 번 더 시도해 주세요.';

  @override
  String get dnsRecordsEmpty => '아직 레코드가 없어요.';

  @override
  String get dnsRecordAdd => '레코드 추가';

  @override
  String get dnsRecordEdit => '레코드 편집';

  @override
  String get dnsRecordManaged => 'Casama 사이트에서 사용 중';

  @override
  String get dnsRecordType => '유형';

  @override
  String get dnsRecordHost => '이름';

  @override
  String dnsRecordHostHelp(String name) {
    return '$name 자체 주소라면 비워 두고, 아니면 www, shop 등을 입력하세요…';
  }

  @override
  String get dnsRecordAnswer => '값';

  @override
  String get dnsRecordTtl => 'TTL (초)';

  @override
  String get dnsRecordPriority => '우선순위';

  @override
  String get dnsRecordSave => '저장';

  @override
  String get dnsRecordDeleteTitle => '이 레코드를 삭제할까요?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300초 이상 입력해 주세요';

  @override
  String get dnsRecordAnswerRequired => '필수 항목';

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
  String get deleteAccountDomains => '워크스페이스에서 구입한 도메인';

  @override
  String get deleteAccountDomainsBody =>
      '이 도메인은 만료될 때까지 등록이 유지돼요. 더 이상 갱신되지 않고, 연결된 사이트는 오프라인이 돼요.';

  @override
  String get whatsNew010Sites => '페이지를 고유 주소로 웹에 게시하고 보유한 도메인을 연결해 보세요.';

  @override
  String get inAppAlertOpen => '열기';

  @override
  String get pushPrefsTitle => '알림';

  @override
  String get pushPrefsHelp => '기기로 푸시 알림을 보낼 항목을 선택하세요. 모든 내용은 여전히 수신함에 모여요.';

  @override
  String get pushAllOn => '모두 켜짐';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': '답변 꺼짐',
      'needsYou': '확인 필요 꺼짐',
      'routines': '루틴 및 브리핑 꺼짐',
      'suggestions': '제안 및 먼저 말 걸기 꺼짐',
      'other': '계정 꺼짐',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count개 유형 꺼짐';
  }

  @override
  String get pushReplies => '답변';

  @override
  String get pushRepliesHelp => '대화를 나간 사이에 봇이 질문에 답했을 때 알려 드려요.';

  @override
  String get pushNeedsYou => '확인 필요';

  @override
  String get pushNeedsYouHelp => '봇이 기다리고 있는 승인, 암호, 직접 조작 요청이에요.';

  @override
  String get pushNeedsYouOffWarning => '끄면 앱을 열 때까지 봇이 기다리게 돼요.';

  @override
  String get pushRoutines => '루틴 및 브리핑';

  @override
  String get pushRoutinesHelp => '루틴 결과와 아침 브리핑이에요.';

  @override
  String get pushSuggestions => '제안 및 먼저 말 걸기';

  @override
  String get pushSuggestionsHelp => '봇이 대신 해 주겠다고 제안하는 항목이에요.';

  @override
  String get pushAccount => '계정';

  @override
  String get pushAccountHelp => '크레딧 부족, 프로젝트, 서버 관련 알림이에요.';

  @override
  String get pushHideReplyText => '답변 내용 숨기기';

  @override
  String get pushHideReplyTextHelp => '답변 본문 없이 봇이 답했다는 사실만 알림에 표시해요.';

  @override
  String get reactToMessage => '반응';

  @override
  String get moreReactions => '반응 더 보기';

  @override
  String get reactionsTitle => '반응';

  @override
  String get reactionsAll => '전체';

  @override
  String get reactionsYou => '나';

  @override
  String get reactionsTapToRemove => '탭하여 삭제';

  @override
  String get reactionsNone => '아직 반응이 없어요.';

  @override
  String get reactionsLoadFailed => '누가 반응했는지 불러오지 못했어요.';

  @override
  String get searchEmoji => '이모지 검색';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '반응 $count개',
      one: '반응 1개',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '반응 $count개',
      one: '반응 1개',
    );
    return '$emoji, $_temp0, 내 반응 포함';
  }

  @override
  String reactionQuick(String emoji) {
    return '$emoji 반응 남기기';
  }

  @override
  String reactionRemove(String emoji) {
    return '$emoji 반응 지우기';
  }

  @override
  String get packsShelfTitle => '팩';

  @override
  String get packsShelfHelp => '함께 작동하는 봇, 스킬, 루틴을 한 번에 추가해요.';

  @override
  String get packReviewed => '검토 완료';

  @override
  String get packNotReviewed => 'Casama에서 검토하지 않음';

  @override
  String packCountBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '봇 $count개',
      one: '봇 1개',
    );
    return '$_temp0';
  }

  @override
  String packCountSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스킬 $count개',
      one: '스킬 1개',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '루틴 $count개',
      one: '루틴 1개',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '앱 $count개',
      one: '앱 1개',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스타일 $count개',
      one: '스타일 1개',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '도구 $count개',
      one: '도구 1개',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '항목 $count개',
      one: '항목 1개',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => '스타터 세트';

  @override
  String get packAddFromLink => '링크로 팩 추가';

  @override
  String get packAddFromLinkHelp => '팩의 GitHub 링크를 붙여넣고 무엇이 추가되는지 먼저 확인하세요.';

  @override
  String get packAddFromFile => '파일에서 추가';

  @override
  String get packAddFromFileHelp => '팩의 .zip 파일을 선택하세요.';

  @override
  String get packLinkLabel => 'GitHub 링크';

  @override
  String get packFileUnreadable => '팩의 .zip 파일이 아니에요.';

  @override
  String get packFileTooBig => '팩으로 추가하기엔 파일이 너무 커요.';

  @override
  String packSource(String where, String commit) {
    return '$where ($commit)';
  }

  @override
  String get packFromFile => '파일에서 가져옴';

  @override
  String get packFromShare => '공유받음';

  @override
  String get packAlreadyHere => '이 워크스페이스에 이미 있는 팩이에요.';

  @override
  String get packOpenInstalled => '설치된 팩 보기';

  @override
  String get packAdd => '팩 추가';

  @override
  String packWizardTitle(String name) {
    return '$name 추가';
  }

  @override
  String get packWhatsInside => '구성 내용';

  @override
  String get packWhatsInsideHelp => '원하지 않는 항목은 체크를 해제하세요.';

  @override
  String get packSectionBots => '봇';

  @override
  String get packSectionSkills => '스킬';

  @override
  String get packSectionRoutines => '루틴';

  @override
  String get packSectionApps => '앱';

  @override
  String get packSectionLooks => '스타일';

  @override
  String get packSectionIncludes => '갤러리에서 가져옴';

  @override
  String get packSectionTools => '도구';

  @override
  String get packSkillRunsScripts => '봇의 컴퓨터에서 스크립트 실행';

  @override
  String get packSkillForWorkspace => '워크스페이스 전체용';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '주 $count회 정도 실행',
      one: '주 1회 정도 실행',
      zero: '가끔 실행',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return '$host에 연결';
  }

  @override
  String packToolRemote(String url) {
    return '$url에 연결';
  }

  @override
  String get packIncludeMissing => '갤러리에서 찾을 수 없어요';

  @override
  String get packLookHelp => '추가한 뒤 이 기기에서 사용할 수 있어요.';

  @override
  String get packNothingTicked => '추가할 항목을 하나 이상 선택해 주세요.';

  @override
  String get packQuestions => '간단한 질문 몇 가지';

  @override
  String get packQuestionsHelp => '팩이 이 내용을 봇과 루틴에 채워 넣어요.';

  @override
  String get packSecretsTitle => '키 및 설정';

  @override
  String get packSecretsHelp => '팩의 도구가 작동하려면 아래 항목이 필요해요.';

  @override
  String get packReachTitle => '접근 가능한 범위';

  @override
  String get packReachHelp => 'Casama가 팩 파일을 분석해 정리한 내용이에요.';

  @override
  String get packReachRunsCode => '코드 실행';

  @override
  String get packReachComputer => '봇의 컴퓨터 사용';

  @override
  String packReachHosts(String hosts) {
    return '$hosts에 연결';
  }

  @override
  String get packReachNoHosts => '다른 사이트와 통신하지 않아요';

  @override
  String packReachSecrets(String names) {
    return '사용하는 키: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '주 약 $count회 예약 실행',
      one: '주 약 1회 예약 실행',
      zero: '예약된 실행 없음',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama가 검토하지 않은 팩이에요. 신뢰할 수 있는 출처일 때만 추가하세요. 포함된 루틴은 꺼진 상태로 시작돼요.';

  @override
  String get packPickBotTitle => '어떤 봇에 넣을까요?';

  @override
  String get packPickBotHelp => '이 팩에는 봇이 포함되어 있지 않아요. 루틴과 도구를 추가할 봇을 선택하세요.';

  @override
  String packDoneTitle(String name) {
    return '$name 추가 완료';
  }

  @override
  String get packDoneHelp => '추가된 항목을 확인하세요.';

  @override
  String get packPendingHelp => '관리자에게 요청을 보냈어요. 승인되면 팩이 추가돼요.';

  @override
  String get packStatusInstalled => '추가됨';

  @override
  String get packStatusPending => '관리자 승인 대기 중';

  @override
  String get packStatusSkipped => '건너뜀';

  @override
  String get packStatusFailed => '실패함';

  @override
  String get packStatusDevice => '이 기기에 있음';

  @override
  String get packConnectTitle => '앱 연결하기';

  @override
  String get packConnectHelp => '이 앱들을 연결해야 봇이 모든 기능을 발휘할 수 있어요.';

  @override
  String get packLooksTitle => '이 기기에 스타일을 적용할까요?';

  @override
  String get packUseLook => '사용';

  @override
  String get packLookInUse => '사용 중';

  @override
  String get packInstalledTitle => '이 팩은 이미 설치되어 있어요';

  @override
  String get packsInstalledTitle => '설치된 팩';

  @override
  String get packsInstalledRow => '이 워크스페이스에 추가한 팩 및 업데이트';

  @override
  String get packsInstalledEmpty => '아직 팩이 없어요. 팩 목록에서 찾거나 링크로 추가해 보세요.';

  @override
  String get packEditedBadge => '직접 수정됨';

  @override
  String get packRemove => '삭제';

  @override
  String get packUpToDate => '최신 상태예요.';

  @override
  String get packCantCheck => '파일이나 링크로 추가한 팩은 업데이트를 확인할 수 없어요.';

  @override
  String packUpdateTitle(String name) {
    return '$name 업데이트';
  }

  @override
  String packDiffAdded(String names) {
    return '새 항목: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return '삭제됨: $names';
  }

  @override
  String packDiffChanged(String name) {
    return '변경됨: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return '새로 연결하는 사이트: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return '새로 필요한 키: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return '새 일정: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return '주간 예약 실행: $from → $to';
  }

  @override
  String get packDiffNone => '체감할 만한 변경 사항이 없어요.';

  @override
  String get packEditedTitle => '직접 수정한 항목';

  @override
  String get packEditedHelp => '전환하지 않는 한 직접 수정한 버전이 유지돼요.';

  @override
  String get packTakeTheirs => '팩 버전 사용';

  @override
  String get packReachGrewTitle => '접근 범위가 넓어졌어요';

  @override
  String get packReachGrewHelp => '새 버전은 현재 버전보다 더 넓은 범위에 접근할 수 있어요.';

  @override
  String get packReachConfirm => '새로 넓어진 접근 범위를 확인했어요';

  @override
  String packUpdated(String name) {
    return '$name 팩을 업데이트했어요.';
  }

  @override
  String packRemoveTitle(String name) {
    return '$name 팩을 삭제할까요?';
  }

  @override
  String get packRemoveBody =>
      '도구와 키, 그리고 수정하지 않은 스킬과 루틴이 삭제돼요. 앱 연결은 그대로 유지돼요.';

  @override
  String get packRemoveBots => '이 팩으로 만든 봇도 함께 삭제';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '팩을 삭제했어요. 직접 수정한 $count개 항목은 그대로 남아 있어요.',
      one: '팩을 삭제했어요. 직접 수정한 1개 항목은 그대로 남아 있어요.',
      zero: '팩을 삭제했어요.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => '팩으로 공유';

  @override
  String get sharePackRow => '다른 사람과 공유할 봇과 스킬 묶기';

  @override
  String get sharePackHelp => '키, 대화, 기억, ‘나에 대한 정보’, 모델 선택은 절대 포함되지 않아요.';

  @override
  String get sharePackBots => '봇';

  @override
  String get sharePackBotsHelp => '최대 5개까지 선택하세요. 각 봇의 지침, 스킬, 루틴이 함께 포함돼요.';

  @override
  String get sharePackSkills => '워크스페이스 스킬';

  @override
  String get sharePackName => '이름';

  @override
  String get sharePackSummary => '한 줄 소개';

  @override
  String get sharePackLook => '이 기기의 테마 포함';

  @override
  String get sharePackCheck => '확인 후 공유';

  @override
  String get sharePackFindingsTitle => '키처럼 보이는 줄이 있어요';

  @override
  String get sharePackFindingsHelp =>
      '공유하기 전에 아래 내용을 확인해 주세요. 돌아가서 수정하거나, 안전하다면 그대로 공유할 수 있어요.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, $line번째 줄: $what';
  }

  @override
  String get sharePackGoBack => '돌아가기';

  @override
  String get sharePackAnyway => '그대로 공유';

  @override
  String get sharePackLinkTitle => '내 팩 링크';

  @override
  String sharePackLinkHelp(String date) {
    return 'Casama에 로그인한 누구나 $date까지 열 수 있어요.';
  }

  @override
  String get sharePackShare => '공유';

  @override
  String get sharePackSaveFile => '파일로 저장';

  @override
  String get sharePackLinkCopied => '링크를 복사했어요.';

  @override
  String get sharePackStop => '공유 중지';

  @override
  String get sharePackStopped => '링크가 더 이상 작동하지 않아요.';

  @override
  String pluginFromPack(String pack) {
    return '$pack 팩에서 가져옴';
  }

  @override
  String get pluginFromPackHelp => '갤러리 → 설치된 팩에서 해당 팩과 함께 업데이트하거나 삭제할 수 있어요.';

  @override
  String get pluginSettings => '설정';

  @override
  String get pluginEditSettings => '설정 수정';

  @override
  String get pluginSettingsSaved => '설정을 저장했어요.';

  @override
  String get galleryPolicyKeyHelp =>
      '저장소(repo/owner:name) 또는 팩(pack/name)을 직접 입력할 수도 있어요.';

  @override
  String galleryPolicyUseKey(String key) {
    return '$key 추가';
  }

  @override
  String galleryApprovalPack(String name) {
    return '팩: $name';
  }

  @override
  String get reportPackShare => '이 팩 신고하기';

  @override
  String get appLock => '앱 잠금';

  @override
  String get appLockRow => 'Casama를 열 때 잠금 해제 요청하기';

  @override
  String get appLockHelp =>
      'Casama를 열거나 일정 시간 자리를 비운 뒤 돌아올 때 잠금 해제를 요청해요. 켜져 있는 동안 로그인 정보는 이 기기의 키체인에 보관돼요.';

  @override
  String get appLockSwitch => 'Casama 잠그기';

  @override
  String get appLockLocked => 'Casama가 잠겨 있어요';

  @override
  String get appLockUnlock => '잠금 해제';

  @override
  String get appLockUnlockWithPasskey => '패스키로 잠금 해제';

  @override
  String get appLockUnlockReason => 'Casama 잠금 해제';

  @override
  String get appLockTurnOnReason => '앱 잠금 켜기';

  @override
  String get appLockConfirmReason => '본인 확인';

  @override
  String get appLockConfirmTitle => '본인 확인';

  @override
  String appLockUnlockWith(String method) {
    return '$method 인증을 사용해 주세요.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID 또는 암호';

  @override
  String get appLockDeviceAndroid => '지문, 얼굴 또는 화면 잠금';

  @override
  String get appLockDeviceMac => 'Touch ID 또는 Mac 암호';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => '기기의 화면 잠금';

  @override
  String appLockMethodDevice(String method) {
    return '$method 인증으로 잠금 해제';
  }

  @override
  String get appLockMethodPin => '6자리 PIN으로 잠금 해제';

  @override
  String get appLockMethodPasskey => '패스키로 잠금 해제';

  @override
  String get appLockPinHint => 'PIN 입력';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PIN이 맞지 않아요. $count번 더 시도할 수 있어요.',
      one: 'PIN이 맞지 않아요. 1번 더 시도할 수 있어요.',
      zero: 'PIN이 맞지 않아요.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'PIN을 여러 번 잘못 입력했어요. 로그아웃한 뒤 다시 로그인해 Casama를 열어 주세요.';

  @override
  String get appLockFailed => '인증하지 못했어요. 다시 시도해 주세요.';

  @override
  String get appLockUnavailable =>
      '지금은 이 기기에서 Casama를 잠금 해제할 수 없어요. 로그아웃한 뒤 다시 로그인해 주세요.';

  @override
  String get appLockSignOutConfirm =>
      '로그아웃하면 이 기기의 앱 잠금이 꺼져요. Casama를 열려면 다시 로그인해 주세요.';

  @override
  String get appLockCallRinging => '전화가 오고 있어요. 받으려면 잠금을 해제해 주세요.';

  @override
  String get appLockRequiredTitle => '앱 잠금 켜기';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace에서는 Casama를 여는 모든 기기에 앱 잠금이 필요해요.';
  }

  @override
  String get appLockRequiredNoWay =>
      '이 브라우저는 이 서버에서 패스키를 사용할 수 없어 Casama를 잠글 수 없어요. 휴대폰이나 컴퓨터 앱에서 Casama를 열어 주세요.';

  @override
  String appLockRequiredBy(String workspace) {
    return '켜짐 · $workspace 필수 설정';
  }

  @override
  String get appLockTurnOn => '켜기';

  @override
  String get appLockTurnedOn => '앱 잠금이 켜졌어요';

  @override
  String get appLockNoWayHere =>
      '이 브라우저는 이 서버에서 패스키를 사용할 수 없어 여기서 Casama를 잠글 수 없어요.';

  @override
  String get appLockNotChecked => '본인 확인을 완료하지 못했어요.';

  @override
  String get appLockPinSetupTitle => 'PIN 선택';

  @override
  String get appLockPinAgainTitle => 'PIN 다시 입력';

  @override
  String get appLockPinSetupBody => '6자리 숫자예요. Casama를 열 때 입력하게 돼요.';

  @override
  String get appLockPinNext => '계속';

  @override
  String get appLockPinMismatch => 'PIN이 일치하지 않아요. 다시 설정해 주세요.';

  @override
  String get appLockPinNotSaved => '이 기기에 PIN을 저장하지 못했어요.';

  @override
  String get appLockPinChanged => 'PIN이 변경되었어요';

  @override
  String get appLockChangePin => 'PIN 변경';

  @override
  String get appLockAfter => '잠금 대기 시간';

  @override
  String get appLockAfterHelp => '백그라운드 전환, 최소화 또는 컴퓨터에서 다른 앱 뒤로 가려진 시간이에요.';

  @override
  String get appLockAfterImmediately => '즉시';

  @override
  String get appLockAfterOneMinute => '1분';

  @override
  String get appLockAfterFiveMinutes => '5분';

  @override
  String get appLockAfterFifteenMinutes => '15분';

  @override
  String get appLockAfterOneHour => '1시간';

  @override
  String get appLockBlockScreenshots => '스크린샷 차단';

  @override
  String get appLockBlockScreenshotsHelp =>
      '스크린샷, 화면 기록, 화면 공유에서 Casama 화면이 보이지 않게 가려요.';

  @override
  String get appLockLockNow => '지금 잠그기';

  @override
  String get appLockPrivacySection => '추가 개인정보 보호';

  @override
  String get appLockAskBeforeRisky => '민감한 작업 확인';

  @override
  String get appLockAskBeforeRiskyHelp =>
      '계정 삭제, 키 생성, 결제 변경, 데이터 내보내기, 고위험 요청 승인, 컴퓨터 직접 조작 전에는 다시 잠금을 해제해야 해요.';

  @override
  String get requireAppLock => '앱 잠금 필수 사용';

  @override
  String get requireAppLockHelp =>
      '멤버는 앱을 열기 전에 모든 기기에서 Casama를 잠가야 해요. 웹에서는 패스키가 필요해요.';

  @override
  String get requireAppLockOwnFirst => '먼저 이 기기에서 앱 잠금을 켜 주세요.';

  @override
  String get permLocation => '위치';

  @override
  String get permLocationAlways => '백그라운드 위치';

  @override
  String get permCamera => '카메라';

  @override
  String get permMicrophone => '마이크';

  @override
  String get permSpeech => '음성 인식';

  @override
  String get permPhotos => '사진';

  @override
  String get permContacts => '연락처';

  @override
  String get permCalendar => '캘린더';

  @override
  String get permHealth => '건강';

  @override
  String get permNotifications => '알림';

  @override
  String get permNotificationAccess => '알림 접근';

  @override
  String get permAccessibility => '손쉬운 사용';

  @override
  String get permScreenRecording => '화면 기록';

  @override
  String get permAutomation => '자동화';

  @override
  String get permFullDisk => '전체 디스크 접근 권한';

  @override
  String get permSharedFolders => '공유 폴더';

  @override
  String get permLocalTools => '로컬 도구';

  @override
  String get cardPermissions => '권한';

  @override
  String permissionsTitle(String device) {
    return '$device의 권한 켜기';
  }

  @override
  String get permStateOn => '켜짐';

  @override
  String get permStateOff => '꺼짐';

  @override
  String get permStateNotAsked => '아직 요청 안 함';

  @override
  String get permStateLimited => '제한됨';

  @override
  String get permStateUnknown => '알 수 없음';

  @override
  String get permStateUnavailable => '이 기기에서 사용 불가';

  @override
  String get permStateUpdate => '여기서 켜려면 Casama를 업데이트해 주세요';

  @override
  String get permTurnOn => '켜기';

  @override
  String get permOpenSettings => '설정 열기';

  @override
  String get permOpenHealth => '건강 앱 열기';

  @override
  String get permHealthIosHow =>
      '건강 앱에서 내 프로필 사진을 탭한 뒤 앱 → Casama로 이동해 봇이 읽을 수 있는 항목을 켜 주세요.';

  @override
  String get permChoose => '선택';

  @override
  String get permRestart => 'Casama 다시 시작';

  @override
  String get permRestartToFinish => '완료하려면 Casama를 다시 시작하세요';

  @override
  String permOpenedOn(String device) {
    return '$device에서 열림';
  }

  @override
  String permSentTo(String device) {
    return '$device에 보냈어요: 해당 기기의 알림을 탭하세요';
  }

  @override
  String permOffline(String device) {
    return '$device 오프라인';
  }

  @override
  String permRestarting(String device) {
    return '$device에서 Casama 다시 시작 중';
  }

  @override
  String permOnlyOwner(String device) {
    return '$device 소유자만 이 항목을 켤 수 있어요';
  }

  @override
  String get permNotNowLine => '나중에';

  @override
  String get permContinue => '계속';

  @override
  String get permContinueMessage => '권한 켰어요, 계속 진행해 주세요.';

  @override
  String get permContinuedLine => '켜짐';

  @override
  String get permissionsScreenTitle => '권한';

  @override
  String get permissionsScreenHelp =>
      '이 기기에서 봇이 사용할 수 있는 항목이에요. 탭하기 전에는 묻지 않아요.';

  @override
  String get permissionsRowHelp => '이 기기의 위치, 화면, 마이크 등';

  @override
  String permOtherDevice(String device) {
    return '이 요청은 $device용이에요. 해당 기기에서 Casama를 열어 켜 주세요.';
  }

  @override
  String get permAnotherDevice => '다른 기기';

  @override
  String get permissionsNone => '이 기기에서는 켤 항목이 없어요.';

  @override
  String get widgetNeedsYou => '확인 필요';

  @override
  String get widgetAllClear => '모두 완료';

  @override
  String get widgetAllow => '허용';

  @override
  String get widgetDeny => '거부';

  @override
  String get widgetReview => '검토';

  @override
  String get widgetOpen => '열기';

  @override
  String get widgetDoIt => '실행';

  @override
  String get widgetRunNow => '지금 실행';

  @override
  String get widgetStarted => '시작됨';

  @override
  String get widgetStop => '중지';

  @override
  String get widgetAsk => '질문';

  @override
  String widgetAskBot(String bot) {
    return '$bot에게 질문';
  }

  @override
  String get widgetTalk => '통화';

  @override
  String get widgetTry => '해 보기';

  @override
  String get widgetUpNext => '다음 일정';

  @override
  String get widgetNoRoutines => '아직 루틴이 없어요';

  @override
  String get widgetWorking => '작업 중';

  @override
  String get widgetWaiting => '답변 대기 중';

  @override
  String get widgetIdle => '대기 중';

  @override
  String widgetRepliedAt(String time) {
    return '$time 답변';
  }

  @override
  String get widgetBrief => '브리핑';

  @override
  String widgetBriefAt(String time) {
    return '$time 브리핑';
  }

  @override
  String get widgetNoBrief => '아직 브리핑 없음';

  @override
  String get widgetToday => '오늘';

  @override
  String get widgetCredits => '크레딧';

  @override
  String widgetCreditsLeft(String amount) {
    return '$amount 남음';
  }

  @override
  String widgetSpentToday(String amount) {
    return '오늘 $amount';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n% 사용';
  }

  @override
  String widgetResetsAt(String time) {
    return '$time 초기화';
  }

  @override
  String get widgetFinished => '완료됨';

  @override
  String get widgetLibrary => '라이브러리';

  @override
  String get widgetNoCreations => '아직 만든 항목 없음';

  @override
  String get widgetTasks => '작업';

  @override
  String get widgetTodo => '할 일';

  @override
  String get widgetInProgress => '진행 중';

  @override
  String get widgetInReview => '검토 중';

  @override
  String get widgetBlocked => '차단됨';

  @override
  String get widgetSignIn => 'Casama를 열어 로그인';

  @override
  String get widgetNoBots => '첫 번째 봇을 만나보세요';

  @override
  String widgetAsOf(String time) {
    return '$time 기준';
  }

  @override
  String get widgetUpdateServer => '이 위젯을 사용하려면 Casama 서버를 업데이트하세요';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot 봇 확인 필요';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot 봇의 제안';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot 봇이 직접 조작을 요청해요';
  }

  @override
  String widgetNextBrief(String time) {
    return '다음 브리핑 $time';
  }

  @override
  String get widgetNothingNext => '예정된 항목 없음';

  @override
  String get widgetsTitle => '위젯';

  @override
  String get widgetsRow => '홈 화면과 잠금 화면에서 만나는 내 봇';

  @override
  String get widgetsIntro =>
      'Casama를 열지 않아도 위젯에서 봇이 하는 일과 확인이 필요한 항목을 바로 볼 수 있어요.';

  @override
  String get widgetNameBot => '봇';

  @override
  String get widgetNameRoutines => '루틴';

  @override
  String get widgetDescNeedsYou => '어떤 봇이 내 답변을 기다리는지 확인해요';

  @override
  String get widgetDescBot => '한 봇이 무엇을 하고 있는지 확인해요';

  @override
  String get widgetDescAsk => '한 번의 탭으로 봇에게 질문하거나 대화해요';

  @override
  String get widgetDescRoutines => '다음에 실행될 루틴을 보고 바로 실행해요';

  @override
  String get widgetDescToday => '큰 위젯 하나로 하루 일정을 한눈에 봐요';

  @override
  String get widgetDescBrief => '아침 브리핑을 읽어요';

  @override
  String get widgetDescLibrary => '최근 봇이 만든 항목을 확인해요';

  @override
  String get widgetDescTasks => '작업 보드 현황을 확인해요';

  @override
  String get widgetDescCredits => '크레딧 잔액을 수시로 확인해요';

  @override
  String get widgetsAddToHome => '홈 화면에 추가';

  @override
  String get widgetsPinUnsupported =>
      '이 런처에서는 여기에서 위젯을 추가할 수 없어요. 홈 화면의 빈 공간을 길게 누른 뒤 위젯을 탭하고 Casama를 선택하세요.';

  @override
  String get widgetsHowToAdd => '추가 방법';

  @override
  String get widgetsHowToIos =>
      '홈 화면의 빈 공간을 길게 누른 뒤 편집 → 위젯 추가를 탭하고 Casama를 선택하세요.';

  @override
  String get widgetsHowToMac =>
      '메뉴 막대에서 날짜와 시간을 클릭한 뒤 ‘위젯 편집’을 눌러 Casama를 선택하세요. 또는 데스크톱을 오른쪽 클릭하고 ‘위젯 편집’을 선택하세요.';

  @override
  String get widgetsLockScreen => '잠금 화면 및 제어기';

  @override
  String get widgetsLockScreenHelp =>
      '잠금 화면을 길게 누른 뒤 ‘사용자화’ → ‘잠금 화면’을 탭하고, 시계 아래 공간을 탭해 확인 필요, 다음 일정, 봇 또는 크레딧을 추가하세요. 잠금을 해제하기 전까지 요청 내용은 숨겨져요.';

  @override
  String get widgetsControlsHelp =>
      '제어 센터를 열고 길게 누른 뒤 ‘제어 항목 추가’를 탭해 Casama에 묻기, 봇과 말하기, 루틴 실행을 선택하세요. 잠금 화면 하단 모서리나 동작 버튼에도 넣을 수 있어요.';

  @override
  String get widgetsShowDetails => '위젯에 세부 정보 표시';

  @override
  String get widgetsShowDetailsHelp =>
      '앱 잠금이 켜져 있으면 위젯에 숫자와 봇 이름만 표시되고 버튼을 누르면 Casama가 열려요. 요청, 메시지, 루틴 이름도 표시하려면 이 옵션을 켜 주세요.';

  @override
  String get widgetsShowDetailsNoLock =>
      '앱 잠금이 켜져 있을 때만 적용돼요. 잠금이 꺼져 있으면 위젯에 세부 정보가 표시돼요.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace에서 앱 잠금을 필수로 요구하므로 위젯의 세부 정보가 숨겨져요.';
  }

  @override
  String get widgetsPinBot => '홈 화면에 봇 고정';

  @override
  String get widgetsPinBotHelp => '홈 화면에 봇을 별도 아이콘으로 추가해요. 탭하면 바로 대화할 수 있어요.';

  @override
  String get widgetsPin => '고정';

  @override
  String get widgetNudgeNeedsYou => '‘확인 필요’ 위젯을 추가해 홈 화면에서 바로 요청에 답해 보세요.';

  @override
  String get widgetNudgeRoutines => '‘루틴’ 위젯을 추가해 홈 화면에서 바로 루틴을 실행해 보세요.';

  @override
  String get widgetNameCanvas => '캔버스';

  @override
  String get widgetDescCanvas => '오늘의 문구나 카운트다운 등 봇이 올려둔 내용을 표시해요';

  @override
  String get canvasEmpty => '봇에게 여기에 무언가 표시해 달라고 부탁해 보세요';

  @override
  String get canvasTry => '예: 내 잠금 화면에 오늘의 명언을 띄워 줘';

  @override
  String get canvasAutomatic => '자동';

  @override
  String canvasIn(String time) {
    return '$time 남음';
  }

  @override
  String canvasSince(String time) {
    return '$time 지남';
  }

  @override
  String get canvasNow => '지금';

  @override
  String canvasLeft(String n) {
    return '$n개 남음';
  }

  @override
  String get canvasLeftUnit => '남음';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '일',
      one: '일',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => '위젯';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot 봇이 이 내용을 위젯에 표시하려고 해요';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return '한 번 허용하면 $bot 봇이 묻지 않고 내용을 바꿀 수 있어요. 설정 → 위젯에서 언제든 중지할 수 있어요.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot 봇이 위젯에 이 내용을 표시했어요';
  }

  @override
  String get canvasShow => '내 위젯에 표시';

  @override
  String get canvasShowing => '위젯에 표시 중';

  @override
  String canvasNotShown(String bot) {
    return '표시하지 않았어요. $bot 봇이 나중에 다시 물어볼 수 있어요.';
  }

  @override
  String get canvasGone => '위젯에서 삭제됨';

  @override
  String get canvasNotPlaced => '보려면 캔버스 위젯을 추가하세요.';

  @override
  String get canvasHowToIos =>
      '홈 화면이나 잠금 화면을 길게 누른 뒤 편집 → 위젯 추가를 탭하고 Casama, 그리고 캔버스를 선택하세요.';

  @override
  String get canvasHowToMac =>
      '데스크톱을 오른쪽 클릭하고 ‘위젯 편집’을 선택한 뒤 Casama, 그리고 캔버스를 선택하세요.';

  @override
  String get canvasHowToElsewhere => '확인하려면 휴대폰이나 Mac에 Casama의 캔버스 위젯을 추가하세요.';

  @override
  String get canvasAdded => '캔버스 위젯 추가됨';

  @override
  String get canvasLockScreen => '잠금 화면에서';

  @override
  String get widgetsFromBots => '봇이 표시한 항목';

  @override
  String get widgetsFromBotsEmpty =>
      '아직 없어요. 봇에게 “내 잠금 화면에 오늘의 문구를 띄워 줘”처럼 요청해 보세요.';

  @override
  String canvasSetAt(String time) {
    return '$time 설정됨';
  }

  @override
  String canvasOnDevices(String devices) {
    return '$devices에 표시 중';
  }

  @override
  String get canvasNoWidget => '아직 배치된 캔버스 위젯 없음';

  @override
  String get canvasPausedLine => '일시 중지됨';

  @override
  String get canvasWaitingLine => '승인 대기 중';

  @override
  String get canvasHideLocked => '잠긴 휴대폰에서 숨기기';

  @override
  String get canvasPause => '일시 중지';

  @override
  String get canvasResume => '재개';

  @override
  String get canvasClear => '지우기';

  @override
  String canvasClearTitle(String name) {
    return '$name 지울까요?';
  }

  @override
  String canvasClearMessage(String bot) {
    return '위젯에서 사라져요. $bot 봇이 나중에 다시 내용을 올릴 수 있어요.';
  }

  @override
  String get canvasAllowedBots => '위젯을 사용하는 봇';

  @override
  String get canvasMayShow => '내 위젯에 항목 표시 허용';

  @override
  String canvasStopTitle(String bot) {
    return '$bot 중지할까요?';
  }

  @override
  String canvasStopMessage(String bot) {
    return '$bot 봇이 위젯에 표시하던 내용이 지워지며, 다시 표시하려면 승인을 요청해야 해요.';
  }

  @override
  String get canvasStop => '중지';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Android 휴대폰';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => '보기';

  @override
  String get widgetLowRisk => '낮은 위험';

  @override
  String get widgetThisMonth => '이번 달';

  @override
  String get watchNow => '지금';

  @override
  String get watchAsk => '질문';

  @override
  String watchAskBot(String bot) {
    return '$bot에게 질문';
  }

  @override
  String get watchBots => '봇';

  @override
  String get watchUpNext => '다음 일정';

  @override
  String get watchBrief => '브리핑';

  @override
  String get watchSettings => '설정';

  @override
  String get watchChat => '채팅';

  @override
  String get watchTalk => '통화';

  @override
  String get watchCredits => '크레딧';

  @override
  String get watchNeedsYou => '확인 필요';

  @override
  String get watchNeedsYouOne => '1건 확인 필요';

  @override
  String watchNeedsYouMany(String count) {
    return '$count건 확인 필요';
  }

  @override
  String get watchNeedsOk => '승인 필요';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot 봇 확인 필요';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot 봇의 제안';
  }

  @override
  String get watchTakeOver => '직접 조작 요청';

  @override
  String get watchAllClear => '모두 완료';

  @override
  String get watchNothingWaiting => '확인 필요한 항목 없음';

  @override
  String get watchAllow => '허용';

  @override
  String get watchDeny => '거부';

  @override
  String get watchHoldToAllow => '길게 눌러 허용';

  @override
  String get watchHoldHint => '허용할까요? 허용하려면 두 번 탭하세요.';

  @override
  String get watchReview => '검토';

  @override
  String get watchReviewOnIphone => 'iPhone에서 검토';

  @override
  String get watchReviewOnPhone => '휴대폰에서 검토';

  @override
  String get watchWhyHighRisk => '고위험 요청: 휴대폰에서 응답하세요';

  @override
  String get watchWhyPayment => '결제는 휴대폰에서 응답해야 해요';

  @override
  String get watchWhySetting => '설정에 따라 휴대폰에서만 응답할 수 있어요';

  @override
  String get watchWhyWorkspace => '워크스페이스 설정에 따라 휴대폰에서만 응답할 수 있어요';

  @override
  String get watchWhyNotYours => '이 대화를 시작한 사용자만 허용할 수 있어요';

  @override
  String get watchHighRisk => '높은 위험';

  @override
  String get watchMediumRisk => '보통 위험';

  @override
  String get watchLowRisk => '낮은 위험';

  @override
  String get watchAllowed => '허용됨';

  @override
  String get watchDenied => '거부됨';

  @override
  String get watchDone => '완료됨';

  @override
  String get watchAlreadyAnswered => '이미 응답함';

  @override
  String get watchLockToAllow => '워치에서 허용하려면 워치 암호를 설정하세요';

  @override
  String get watchDoIt => '실행';

  @override
  String get watchNotNow => '나중에';

  @override
  String get watchOpenOnIphone => 'iPhone에서 열기';

  @override
  String get watchOpenOnPhone => '휴대폰에서 열기';

  @override
  String get watchSentToPhone => '휴대폰으로 보냄';

  @override
  String get watchWorking => '작업 중';

  @override
  String watchIsWorking(String bot) {
    return '$bot 봇 작업 중';
  }

  @override
  String get watchWaitingForYou => '답변 대기 중';

  @override
  String watchRepliedAt(String time) {
    return '$time 답변';
  }

  @override
  String get watchIdle => '대기 중';

  @override
  String get watchOff => '꺼짐';

  @override
  String watchStepCount(String count) {
    return '$count단계';
  }

  @override
  String get watchStop => '중지';

  @override
  String get watchStopped => '중지됨';

  @override
  String get watchFinished => '완료됨';

  @override
  String get watchProblem => '문제로 중단됨';

  @override
  String get watchCouldntFinish => '완료하지 못함';

  @override
  String get watchListening => '듣는 중…';

  @override
  String get watchTapToStop => '탭하여 중지';

  @override
  String get watchTypeInstead => '직접 입력';

  @override
  String get watchSending => '전송 중…';

  @override
  String get watchHeard => '인식됨';

  @override
  String get watchUndo => '실행 취소';

  @override
  String get watchKeptOffline => '저장됨. 온라인으로 돌아오면 전송돼요';

  @override
  String watchKeptOld(String time) {
    return '$time에 물었던 내용을 보낼까요?';
  }

  @override
  String get watchSend => '보내기';

  @override
  String get watchDiscard => '삭제';

  @override
  String get watchMicDenied => '음성으로 질문하려면 설정에서 마이크를 허용하세요';

  @override
  String get watchNoDictation => '이 서버는 음성 서비스를 지원하지 않아요. ‘직접 입력’을 사용해 주세요';

  @override
  String get watchDidntCatch => '잘 듣지 못했어요. 다시 시도해 주세요';

  @override
  String get watchReply => '답변';

  @override
  String get watchReadAloud => '소리 내어 읽기';

  @override
  String get watchStopReading => '읽기 중지';

  @override
  String get watchContinuesOnIphone => 'iPhone에서 계속';

  @override
  String get watchContinuesOnPhone => '휴대폰에서 계속';

  @override
  String get watchReplyReady => '답변 준비됨';

  @override
  String get watchYou => '나';

  @override
  String get watchQuickYes => '네';

  @override
  String get watchQuickNo => '아니요';

  @override
  String get watchQuickTellMore => '자세히 알려줘';

  @override
  String get watchQuickNotNow => '지금은 아니요';

  @override
  String get watchRunNow => '지금 실행';

  @override
  String get watchStarted => '시작됨';

  @override
  String watchInMinutes(String minutes) {
    return '$minutes분 후';
  }

  @override
  String get watchNoRoutines => '아직 루틴 없음';

  @override
  String watchBriefAt(String time) {
    return '$time 브리핑';
  }

  @override
  String watchBriefTomorrow(String time) {
    return '내일 $time 브리핑';
  }

  @override
  String get watchNoBrief => '설정된 브리핑 없음';

  @override
  String get watchNoBots => '아직 봇이 없어요. 휴대폰에서 만들어 보세요';

  @override
  String get watchSigningIn => '로그인하는 중';

  @override
  String watchSignedInAs(String name) {
    return '$name 님으로 로그인됨';
  }

  @override
  String get watchOpenPhoneToFinishIphone => '완료하려면 iPhone에서 Casama를 여세요';

  @override
  String get watchOpenPhoneToFinish => '완료하려면 휴대폰에서 Casama를 여세요';

  @override
  String get watchUseCode => '코드로 로그인';

  @override
  String get watchCodeHelp => '휴대폰이나 컴퓨터의 Casama에서 입력하세요: 설정 → 워치';

  @override
  String get watchNewCode => '새 코드';

  @override
  String get watchSignedOut => '이 워치는 로그아웃되어 있어요';

  @override
  String get watchOpenToSignIn => 'Casama를 열어 로그인';

  @override
  String watchAsOf(String time) {
    return '$time 기준';
  }

  @override
  String get watchOffline => '오프라인';

  @override
  String get watchCouldntReach => 'Casama에 연결할 수 없어요';

  @override
  String get watchTryAgain => '다시 시도';

  @override
  String get watchServerTooOld => '워치를 사용하려면 Casama 서버를 업데이트하세요';

  @override
  String get watchOutOfCredits => '크레딧 부족';

  @override
  String get watchTalkOnPhone => '휴대폰에서 통화를 시작하고 있어요';

  @override
  String get watchSignOut => '이 워치에서 로그아웃';

  @override
  String get watchHideDetails => '손목을 내리면 세부 정보 숨기기';

  @override
  String get watchReadRepliesAloud => '답변 소리 내어 읽기';

  @override
  String get watchAskUses => '‘질문’ 담당 봇';

  @override
  String get watchWorkspace => '워크스페이스';

  @override
  String get watchSignedInAsLabel => '로그인 계정';

  @override
  String get watchCompNeedsYou => '확인 필요';

  @override
  String get watchCompAsk => '봇에게 질문';

  @override
  String get watchCompBot => '봇';

  @override
  String get watchCompUpNext => '다음 일정';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou => '대기 중인 요청 수와 첫 번째 요청을 표시해요';

  @override
  String get watchCompDescAsk => '한 번의 탭으로 봇에게 음성으로 질문해요';

  @override
  String get watchCompDescBot => '봇의 현재 상태와 작업 내용을 표시해요';

  @override
  String get watchCompDescUpNext => '다음 루틴과 실행 시간을 표시해요';

  @override
  String get watchCompDescCredits => '이번 기간에 사용한 크레딧이에요';

  @override
  String get watchNeedYouShort => '확인 필요';

  @override
  String get watchControlAsk => 'Casama에 질문';

  @override
  String get watchControlTalk => '봇과 대화';

  @override
  String get watchControlRun => '루틴 실행';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count건이 확인을 기다리고 있어요. 첫 번째 항목: $text';
  }

  @override
  String get watchPhoneTitle => '워치';

  @override
  String get watchPhoneIntro => '손목 위에서 바로 봇에게 응답하고, 음성으로 묻고, 누가 작업 중인지 확인하세요.';

  @override
  String get watchPhoneWatches => '로그인된 워치';

  @override
  String get watchPhoneNone => '아직 로그인된 워치가 없어요. 워치에서 Casama를 열면 자동으로 로그인돼요.';

  @override
  String watchPhoneLastUsed(String time) {
    return '마지막 사용: $time';
  }

  @override
  String get watchPhoneNeverUsed => '아직 사용 안 함';

  @override
  String get watchPhoneRemove => '삭제';

  @override
  String watchPhoneRemoveTitle(String name) {
    return '$name 워치를 삭제할까요?';
  }

  @override
  String get watchPhoneRemoveBody => '즉시 로그아웃돼요. 나중에 다시 로그인할 수 있어요.';

  @override
  String get watchPhoneUseCode => '코드로 워치 로그인';

  @override
  String get watchPhoneCodeHint => '워치에 표시된 코드';

  @override
  String watchPhoneCodeAsk(String name) {
    return '$name 워치에 로그인할까요?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return '$workspace에 내 계정으로 로그인돼요. 본인 워치에 표시된 코드만 허용해 주세요.';
  }

  @override
  String get watchPhoneCodeAllow => '로그인하기';

  @override
  String get watchPhoneCodeWrong => '코드가 올바르지 않아요. 워치에서 코드를 확인해 주세요';

  @override
  String get watchPhoneCodeTaken =>
      '이 워치는 아직 다른 계정에 로그인되어 있어요. 해당 계정의 설정 → 워치에서 삭제한 뒤 새 코드를 받아 주세요';

  @override
  String watchPhoneElsewhere(String workspace) {
    return '$workspace에 로그인됨';
  }

  @override
  String get watchPhoneElsewhereUnknown => '다른 워크스페이스에 로그인됨';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name 로그인됨';
  }

  @override
  String get watchPhoneAllowTitle => '워치에서 허용하기';

  @override
  String get watchPhoneAllowMedium => '낮음 및 보통 위험';

  @override
  String get watchPhoneAllowMediumBody =>
      '낮은 위험은 한 번 탭으로, 보통 위험은 길게 눌러 허용해요. 높은 위험과 결제는 항상 휴대폰이 필요해요.';

  @override
  String get watchPhoneAllowLow => '낮은 위험만';

  @override
  String get watchPhoneAllowNone => '허용 안 함';

  @override
  String get watchPhoneDetails => '워치에 세부 정보 표시';

  @override
  String get watchPhoneDetailsBody => '끄면 워치에 개수와 봇 이름만 표시되고 봇이 작성한 내용은 숨겨져요.';

  @override
  String get watchPhoneQuickReplies => '빠른 답장';

  @override
  String get watchPhoneQuickRepliesBody =>
      '답변 알림에서 바로 보낼 수 있는 짧은 답장이에요. 최대 6개까지 설정할 수 있어요.';

  @override
  String get watchPhoneQuickAdd => '빠른 답장 추가';

  @override
  String get watchPhoneQuickReset => '기본 답장 사용';

  @override
  String get watchPhoneHowTo => '시계 페이스에 Casama 추가하기';

  @override
  String get watchPhoneHowToApple =>
      '시계 페이스를 길게 누른 뒤 편집을 탭하고 컴플리케이션에서 Casama를 선택하세요. 시계 페이스에서 Digital Crown을 돌리면 스마트 스택에서도 Casama를 찾을 수 있어요.';

  @override
  String get watchPhoneHowToWear =>
      '시계 페이스를 길게 눌러 Casama 컴플리케이션을 추가하세요. 페이스에서 왼쪽으로 스와이프한 뒤 +를 탭하면 Casama 타일을 추가할 수 있어요.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return '$name 로그인 중…';
  }

  @override
  String get watchPhoneLockAsk => '워치에 로그인할까요?';

  @override
  String get watchPhoneNudge => 'Casama는 워치에서도 쓸 수 있어요. 손목에서 바로 봇에게 응답해 보세요.';

  @override
  String get watchPhoneHandoffTitle => '워치에서 보냄';

  @override
  String get watchPhoneRow => 'Apple Watch 또는 Wear OS 워치에서 만나는 내 봇';

  @override
  String get watchPhoneAllowLowBody =>
      '낮은 위험만 한 번 탭으로 허용해요. 나머지는 모두 휴대폰이 필요해요.';

  @override
  String get watchPhoneAllowNoneBody => '워치에서는 거부만 할 수 있어요. 허용은 휴대폰에서 해 주세요.';

  @override
  String get watchPhoneDetailsLockOff =>
      '앱 잠금이 켜져 있어 워치에 대화 내용이 표시되지 않도록 꺼졌어요. 내용을 보려면 다시 켜 주세요.';

  @override
  String get watchPhoneQuickHint => '짧은 답장';

  @override
  String get watchPhoneQuickTooLong => '최대 40자';

  @override
  String get watchPhoneQuickMoveUp => '위로 이동';

  @override
  String get watchPhoneQuickMoveDown => '아래로 이동';

  @override
  String get watchPhoneQuickDelete => '이 답장 삭제';

  @override
  String get watchPhoneCodeBody => '워치에서 Casama를 열고 ‘코드로 로그인’을 선택하세요.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => '작업 중인 봇과 진행 내용';

  @override
  String get watchCompDescBrief => '오늘 아침 브리핑';

  @override
  String get watchCodeWaiting => '코드 입력을 기다리는 중…';

  @override
  String watchCodeA11y(String code) {
    return '로그인 코드 $code';
  }

  @override
  String get watchChooseBot => '봇 선택';

  @override
  String get watchChannelRequests => '요청';

  @override
  String get watchChannelReplies => '답변';

  @override
  String get watchChannelRuns => '작업 중인 봇';

  @override
  String get watchChannelOther => '기타';

  @override
  String get watchOtherWorkspace => '다른 워크스페이스의 알림이에요. 휴대폰에서 응답해 주세요';

  @override
  String get watchReplySent => '전송됨';

  @override
  String get watchReplyNotSent => '답장을 보내지 못했어요';

  @override
  String watchAskDropped(String time) {
    return '$time에 질문한 내용을 보내지 못했어요';
  }

  @override
  String get watchNeedsHttps => '이 워치는 https 또는 홈 네트워크를 통해서만 서버에 연결할 수 있어요';

  @override
  String get watchSignIn => '로그인';

  @override
  String get watchNotOnWatch => '이 워치에서는 응답할 수 없어요. 휴대폰에서 열어 주세요';

  @override
  String watchMoreOnPhone(String count) {
    return '휴대폰에 $count건 더 있음';
  }

  @override
  String get watchShareCrashReports => '비정상 종료 리포트 공유';

  @override
  String get showList => '목록 보기';

  @override
  String get hideList => '목록 숨기기';

  @override
  String get panePickLibrary => '여기에서 보려면 라이브러리에서 항목을 선택하세요.';

  @override
  String get panePickSetting => '여기에서 보려면 설정을 선택하세요.';

  @override
  String get trackpad => '트랙패드';

  @override
  String get trackpadHint => '한 손가락으로 포인터를 움직이고, 두 손가락으로 스크롤하며, 탭하면 클릭돼요.';

  @override
  String get trackpadTakeControl => '트랙패드를 사용하려면 직접 조작을 시작하세요.';

  @override
  String get foldScreenTitle => '폴더블 화면';

  @override
  String get foldRowHelp => 'Casama가 인식하는 이 기기의 화면 상태';

  @override
  String get foldScreenHelp =>
      'Casama가 현재 인식하는 기기 상태와 접힌 위치예요. 기기를 펼치거나 닫고 접으면 수치도 실시간으로 따라 바뀌어요. 화면 배치가 이상하면 수치를 복사해 알려 주세요.';

  @override
  String get foldPose => '접힘 상태';

  @override
  String get foldWindow => '창';

  @override
  String get foldInsets => '안전 영역';

  @override
  String get foldStrip => '측면 스트립';

  @override
  String get foldFold => '접힘';

  @override
  String get foldHinge => '힌지';

  @override
  String get foldSystemSays => '시스템 보고 값';

  @override
  String get inviteGateLine => '현재 Casama Cloud는 초대로만 가입할 수 있어요.';

  @override
  String get inviteGateSelfHost => '내 서버에서는 누구나 Casama를 실행할 수 있어요.';

  @override
  String get joinTheWaitlist => '대기자 명단 등록';

  @override
  String get iHaveAnInvite => '초대 코드가 있어요';

  @override
  String get waitlistSubtitle => '순서대로 조금씩 초대하고 있어요. 차례가 되면 이메일 한 통을 보내 드려요.';

  @override
  String get waitlistNote => '봇에게 가장 먼저 맡기고 싶은 일은 무엇인가요?';

  @override
  String get waitlistNoteHint => '선택';

  @override
  String get waitlistSelfHosting => '내 서버에서 Casama를 실행 중이에요';

  @override
  String get waitlistNewsletter => 'Casama 월간 이메일도 함께 받기 (한 달에 최대 한 번)';

  @override
  String get waitlistAppleRelay =>
      'Apple이 만들어 준 비공개 주소예요. ‘Apple로 로그인’을 사용할 예정이라면 그대로 유지하세요. Apple이 Casama 메일을 수신함으로 전달해 드려요.';

  @override
  String get waitlistJoinedTitle => '대기자 명단에 등록되었어요.';

  @override
  String get waitlistJoinedBody =>
      '순서대로 조금씩 초대하고 있어요. 월간 이메일을 신청하지 않으셨다면 차례가 되었을 때 이메일 한 통만 보내 드려요. 이미 Casama를 쓰는 지인이 있나요? 지인의 초대를 받으면 바로 시작할 수 있어요.';

  @override
  String get waitlistJoinedCode => '초대 코드가 있나요? 여기에 입력하세요.';

  @override
  String get waitlistJoinedSelfHost =>
      '기다리기 싫으신가요? Casama는 오픈 소스예요. 지금 바로 내 컴퓨터에서 실행해 보세요.';

  @override
  String get waitlistRunItYourself => '직접 실행하기';

  @override
  String get inviteSubtitle => '초대 코드를 입력하거나 초대 링크를 붙여넣으세요.';

  @override
  String get inviteCodeLabel => '초대 코드';

  @override
  String get inviteNotFound => '일치하는 초대 코드가 없어요. 확인 후 다시 시도해 주세요.';

  @override
  String inviteFromName(String name) {
    return '$name 님이 Casama에 초대했어요';
  }

  @override
  String get inviteFromFriend => '친구가 Casama에 초대했어요';

  @override
  String inviteFromCampaign(String label) {
    return '내 초대 코드: $label';
  }

  @override
  String get inviteFromCasama => 'Casama 초대장';

  @override
  String get inviteChooseSignIn => '이제 로그인 방법을 선택하세요. 계정에 사용할 이메일 주소를 이용해 주세요.';

  @override
  String get inviteGoneHelp =>
      '이 초대장은 모두 소진되었어요. 이메일을 입력하시면 대기자 명단의 앞쪽 순서로 등록해 드려요.';

  @override
  String get inviteEmailHelp => '이 주소로 가입을 허용한 뒤 로그인 링크를 보내 드려요.';

  @override
  String inviteCheckInbox(String email) {
    return '가입이 승인되었어요. $email 주소로 온 로그인 링크를 확인하거나 해당 코드를 여기에 입력하세요.';
  }

  @override
  String get inviteWaitlistedTitle => '대기자 명단에 등록되었어요';

  @override
  String get inviteWaitlisted => '이 초대장은 모두 소진되었지만, 대기자 명단 앞쪽 순서에 등록되었어요.';

  @override
  String get inviteUseEmailHere =>
      '이 기기에서는 ‘이메일로 계속하기’를 이용해 주세요. Apple 및 Google 로그인은 iPhone, Mac, Android 앱에서 초대와 함께 사용할 수 있어요.';

  @override
  String get inviteDifferentCode => '다른 코드 사용';

  @override
  String get inviteRefusedHelp =>
      '대기자 명단에 등록하면 차례가 되었을 때 이메일로 알려 드려요. 초대 코드가 있다면 입력해 주세요.';

  @override
  String get inviteRefusedWaitlisted =>
      '현재 Casama Cloud는 초대로만 가입할 수 있어요. 차례가 되면 이메일로 알려 드릴게요. 초대 코드가 있다면 지금 사용해 주세요.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '남은 초대 $count장',
      one: '남은 초대 1장',
      zero: '남은 초대 없음',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$total장 중 $used장 사용됨. 한 장당 친구 한 명이 계정을 만들 수 있어요.';
  }

  @override
  String get inviteFriendsInvitesLocked => '첫 대화를 마치면 초대 권한이 열려요.';

  @override
  String get inviteWaitingTitle => '초대를 기다리는 중';

  @override
  String get inviteWaitingUses => '수락하면 초대장 한 장을 사용하게 돼요.';

  @override
  String get inviteWaitingNoneLeft => '초대한 친구가 첫 대화를 마치면 초대장 한 장을 돌려받아요.';

  @override
  String get inviteWaitingLetIn => '수락하기';

  @override
  String inviteWaitingLetInLabel(String email) {
    return '$email 님 수락';
  }

  @override
  String get inviteWaitingDone => '몇 분 내로 가입 안내 이메일이 발송돼요.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Casama 초대장 $count장 중 하나를 남겨 두었어요.',
      one: 'Casama 초대장을 한 장 남겨 두었어요.',
    );
    return '$_temp0 현재 Casama는 초대로만 가입할 수 있으며, 이 링크로 바로 시작할 수 있어요: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Casama 초대장 $count장 중 하나를 남겨 두었어요.',
      one: 'Casama 초대장을 한 장 남겨 두었어요.',
    );
    return '$_temp0 현재 Casama는 초대로만 가입할 수 있어요. 이 링크로 바로 시작할 수 있고, 첫 대화를 마치면 $amount의 무료 사용량도 받을 수 있어요: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name 님, $text';
  }

  @override
  String get inviteNameTitle => '누구에게 보낼까요?';

  @override
  String get inviteNameHelp =>
      '받는 분의 이름을 입력하면 초대 페이지에서 이름으로 인사해요. 비워 두셔도 괜찮아요.';

  @override
  String get inviteNameHint => '이름';

  @override
  String get inviteNameShare => '초대장 공유';

  @override
  String get inviteAskTitle => '함께 쓸 사람이 또 있나요?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Casama 초대장 $count장을 보유하고 있어요. 한 장당 친구 한 명이 바로 시작할 수 있어요.',
      one: 'Casama 초대장 1장을 보유하고 있어요. 친구가 바로 시작할 수 있어요.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return '친구가 첫 대화를 마치면 두 분 모두 각각 $amount의 무료 사용량을 받아요.';
  }

  @override
  String inviteAskReward(String amount) {
    return '친구가 첫 대화를 마치면 $amount의 무료 사용량을 받아요.';
  }

  @override
  String get inviteAskSend => '초대장 보내기';

  @override
  String get inviteAskNotNow => '나중에';

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
      other: '초기화권 $count개 보유',
      one: '초기화권 1개 보유',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return '$date까지 사용';
  }

  @override
  String get savedResetUse => '초기화권 사용';

  @override
  String get savedResetConfirmTitle => '이 초기화권을 사용할까요?';

  @override
  String get savedResetConfirmDaily =>
      '오늘 한도를 초기화해 봇이 오늘 다시 작업할 수 있게 해요. 이 작업은 되돌릴 수 없어요.';

  @override
  String get savedResetConfirmComputer =>
      '이번 달 컴퓨터 사용 시간을 되돌려줘요. 이 작업은 되돌릴 수 없어요.';

  @override
  String get savedResetOwnerRequired => '워크스페이스 소유자만 사용할 수 있어요.';

  @override
  String get savedResetPaused => '잠시 일시 중지되었어요. 나중에 다시 확인해 주세요.';

  @override
  String get savedResetPeriodLimit =>
      '이번 기간의 초기화권을 이미 사용했어요. 이 초기화권은 다음 기간에 사용할 수 있어요.';

  @override
  String get savedResetNothingToRefill => '아직 채울 사용량이 없어요. 부족할 때를 위해 아껴 두세요.';

  @override
  String get savedResetNoBillingPeriod => '플랜 설정이 완료되면 사용할 수 있어요.';

  @override
  String get savedResetUnavailable => '지금은 사용할 수 없어요.';

  @override
  String savedResetDone(String amount) {
    return '초기화권 사용 완료: $amount 추가됨';
  }

  @override
  String get savedResetDoneNoCredits => '초기화권 사용 완료';

  @override
  String savedResetConfirm(String amount) {
    return '이번 기간에 포함된 크레딧 중 $amount만큼 다시 채워줘요. 이 작업은 되돌릴 수 없어요.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => '초기화권 사용 설정';

  @override
  String get resetsOffNote => '꺼짐: 아무도 초기화권을 받지 않아요.';

  @override
  String get resetsDecrease => '줄이기';

  @override
  String get resetsIncrease => '늘리기';

  @override
  String get resetsSettings => '설정';

  @override
  String get resetsCampaigns => '캠페인';

  @override
  String get resetsStatLive => '진행 중';

  @override
  String get resetsStatGiven => '지급됨';

  @override
  String get resetsStatUsed => '사용됨';

  @override
  String get resetsStatRefilled => '충전됨';

  @override
  String get resetsFilterActive => '활성';

  @override
  String get resetsFilterEnded => '종료됨';

  @override
  String get resetsFilterAll => '전체';

  @override
  String get resetsStateDraft => '초안';

  @override
  String get resetsStateScheduled => '예약됨';

  @override
  String get resetsStateLive => '진행 중';

  @override
  String get resetsStatePaused => '일시 중지됨';

  @override
  String get resetsStateEnded => '종료됨';

  @override
  String get resetsStateCancelled => '취소됨';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '예산 $budget 중 $used 사용';
  }

  @override
  String resetsGivenN(String count) {
    return '$count개 지급됨';
  }

  @override
  String resetsUsedN(String count) {
    return '$count개 사용됨';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return '시작 $start · 종료 $end';
  }

  @override
  String get resetsToday => '오늘';

  @override
  String get resetsTomorrow => '내일';

  @override
  String get resetsYesterday => '어제';

  @override
  String get resetsAudienceEveryone => '모든 워크스페이스';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '워크스페이스 $count개',
      one: '워크스페이스 1개',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return '$date 이전 가입';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '최근 $days일간 한도에 도달함',
      one: '오늘 한도에 도달함',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => '캠페인 취소';

  @override
  String get resetsCancelConfirm => '이 캠페인을 취소할까요?';

  @override
  String get resetsCancelConfirmBody => '초기화권 지급을 중단해요. 이 작업은 되돌릴 수 없어요.';

  @override
  String get resetsDeleteConfirm => '이 캠페인을 삭제할까요?';

  @override
  String get resetsDeleteConfirmBody => '초안이 영구적으로 삭제돼요.';

  @override
  String get resetsNoCampaigns =>
      '아직 캠페인이 없어요. 캠페인을 시작해 여러 워크스페이스에 한 번에 초기화권을 지급해 보세요.';

  @override
  String get resetsNoMatches => '일치하는 캠페인이 없어요.';

  @override
  String get resetsEditCampaign => '캠페인 수정';

  @override
  String get resetsSectionBasics => '기본 정보';

  @override
  String get resetsSectionAudience => '대상';

  @override
  String get resetsSectionTiming => '기간';

  @override
  String get resetsSectionRefill => '충전량';

  @override
  String get resetsSectionWhat => '초기화 대상';

  @override
  String get resetsSectionNotify => '알림';

  @override
  String get resetsPreviewLabel => '사용자에게 표시되는 내용';

  @override
  String get resetsMonthly => '매월';

  @override
  String get resetsYearly => '매년';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => '플랜';

  @override
  String get resetsPlansHint => '모두 체크 해제하면 모든 플랜이 포함돼요.';

  @override
  String get resetsWorkspacesLabel => '워크스페이스';

  @override
  String get resetsWorkspacesHint => '비워 두면 모든 워크스페이스가 포함돼요.';

  @override
  String get resetsSearchWorkspaces => '이름으로 워크스페이스 검색';

  @override
  String get resetsNoWorkspaceMatch => '일치하는 워크스페이스가 없어요.';

  @override
  String resetsOnlyWorkspace(String name) {
    return '$name만';
  }

  @override
  String get resetsJoinedBefore => '이전 가입일';

  @override
  String get resetsLimitedDaysLabel => '최근 N일 이내 한도 도달';

  @override
  String get resetsStartsLabel => '시작';

  @override
  String get resetsEndsLabel => '만료';

  @override
  String resetsPercentValue(int percent) {
    return '포함된 크레딧의 $percent% 재충전';
  }

  @override
  String get resetsCapLabel => '1회 사용당 최대 금액';

  @override
  String get resetsBudgetLabel => '총 예산';

  @override
  String get resetsOptional => '선택';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return '대상 약 $count개 워크스페이스 · 크레딧 $credits · 예상 비용 약 $cost';
  }

  @override
  String get resetsEstimating => '대상 규모 계산 중…';

  @override
  String get resetsEstimateNeedsFields => '대상 규모를 보려면 필드를 입력해 주세요.';

  @override
  String get resetsLockedNote => '진행 중인 캠페인이에요. 메시지, 만료일, 예산, 알림만 바꿀 수 있어요.';

  @override
  String get resetsRequired => '필수 항목이에요.';

  @override
  String get resetsTooLong => '최대 120자까지 입력할 수 있어요.';

  @override
  String get resetsDaysInvalid => '1~365일 사이로 입력해 주세요.';

  @override
  String get resetsMoneyInvalid => '0 이상으로 입력해 주세요.';

  @override
  String get resetsExpiryBeforeStart => '시작 이후 날짜를 종료일로 선택해 주세요.';

  @override
  String resetsGivenTo(String name) {
    return '$name 님에게 초기화권을 지급했어요';
  }

  @override
  String get resetsCampaignSaved => '캠페인을 저장했어요';

  @override
  String get resetsDefaultMessage => '한도에 도달했을 때 사용하실 수 있는 초기화권을 드려요.';

  @override
  String resetsGiveName(String name) {
    return '$name 님에게 드리는 초기화권';
  }

  @override
  String get resetsOneWorkspace => '단일 워크스페이스';

  @override
  String get resetsPickWorkspace => '초기화권을 확인할 워크스페이스를 선택하세요.';

  @override
  String get resetsAllHistory => '전체 기록';

  @override
  String get resetsAllWorkspaces => '모든 워크스페이스';

  @override
  String get resetsNoEvents => '아직 내역이 없어요.';

  @override
  String get resetsEventGiven => '초기화권 지급됨';

  @override
  String get resetsEventUsed => '초기화권 사용됨';

  @override
  String get resetsEventRevoked => '회수됨';

  @override
  String get resetsEventUndone => '충전 취소됨';

  @override
  String get resetsEventExpired => '미사용 만료됨';

  @override
  String get resetsEventCreated => '캠페인 생성됨';

  @override
  String get resetsEventEdited => '캠페인 수정됨';

  @override
  String get resetsEventStarted => '캠페인 시작됨';

  @override
  String get resetsEventEnded => '캠페인 종료됨';

  @override
  String get resetsEventScheduled => '캠페인 예약됨';

  @override
  String get resetsEventPaused => '캠페인 일시 중지됨';

  @override
  String get resetsEventResumed => '캠페인 재개됨';

  @override
  String get resetsEventCancelled => '캠페인 취소됨';

  @override
  String get resetsEventDeleted => '캠페인 삭제됨';

  @override
  String get resetsEventSettings => '설정 변경됨';

  @override
  String get resetsRevokeConfirm => '이 초기화권을 회수할까요?';

  @override
  String get resetsRevokeConfirmBody => '사용하기 전에 워크스페이스에서 회수돼요.';

  @override
  String get resetsUndoConfirm => '이 충전을 취소할까요?';

  @override
  String get resetsUndoConfirmBody => '추가되었던 크레딧이 다시 차감돼요.';

  @override
  String get resetsPerPeriod => '기간당 워크스페이스별 사용 횟수';

  @override
  String get resetsMaxHeld => '최대 보유 초기화권 수';

  @override
  String get resetsNotifyOwners => '인스턴스 소유자에게 알림';

  @override
  String get resetsNewCampaign => '새 캠페인';

  @override
  String get resetsName => '이름';

  @override
  String get resetsMessage => '사용자에게 보낼 메시지';

  @override
  String get resetsPlans => '쉼표로 구분한 플랜 코드 (비워 두면 전체)';

  @override
  String get resetsWorkspaces => '쉼표로 구분한 워크스페이스 ID (비워 두면 전체)';

  @override
  String get resetsBefore => '생성 일시 기준 이전 (날짜 및 시간, 선택)';

  @override
  String get resetsLimitedDays => '최근 N일 이내 한도 도달 (선택)';

  @override
  String get resetsStart => '시작 (날짜 및 시간)';

  @override
  String get resetsExpiry => '만료 (날짜 및 시간)';

  @override
  String get resetsPercent => '다시 채울 포함된 크레딧 (%)';

  @override
  String get resetsCap => '1회 사용당 최대 금액(USD, 선택)';

  @override
  String get resetsBudget => '총 크레딧 예산(USD, 선택)';

  @override
  String get resetsDaily => '오늘 모델 한도 초기화';

  @override
  String get resetsComputer => '이번 달 컴퓨터 사용 시간 채우기';

  @override
  String get resetsArrival => '지급 시 알림';

  @override
  String get resetsReminder => '만료 전 알림';

  @override
  String get resetsPreviewSave => '미리 보기 및 저장';

  @override
  String get resetsSchedule => '예약';

  @override
  String get resetsPause => '일시 중지';

  @override
  String get resetsResume => '재개';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '워크스페이스 $count개. 최대 충전: $credits. 예상 비용: $cost.',
      one: '워크스페이스 1개. 최대 충전: $credits. 예상 비용: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace => '워크스페이스 ID (비워 두면 전체 기록)';

  @override
  String get resetsHistory => '기록 불러오기';

  @override
  String get resetsGive => '초기화권 지급';

  @override
  String get resetsCopyCsv => 'CSV 복사';

  @override
  String get resetsRevoke => '회수하기';

  @override
  String get resetsUndo => '미사용 충전 취소';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => '외부 서비스 확인 필요';

  @override
  String get vendorNotSetUp => '설정 안 됨';

  @override
  String get vendorCheckNow => '지금 확인';

  @override
  String get vendorLimit => '한도 또는 선불 금액';

  @override
  String get vendorWarnAt => '경고 기준';

  @override
  String get vendorExpiry => '만료일';

  @override
  String get vendorHistory => '최근 측정 내역';

  @override
  String get vendorSave => '저장';

  @override
  String get vendorEnabled => '모니터링 사용';

  @override
  String get vendorUnknown => '알 수 없음';

  @override
  String get vendorLow => '부족';

  @override
  String get vendorOut => '소진됨';

  @override
  String get vendorOk => '정상';

  @override
  String get vendorNoReading => '아직 측정 내역 없음';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 확인 필요',
      one: '1개 확인 필요',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count개 정상';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count개 미설정';
  }

  @override
  String get vendorNoVendors => '아직 모니터링할 서비스가 없어요.';

  @override
  String get vendorCheckAll => '모두 확인';

  @override
  String vendorCheckingProgress(int done, int total) {
    return '$total개 중 $done개 확인 중';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '서비스 $count개 확인함',
      one: '서비스 1개 확인함',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '확인 $count건 실패',
      one: '확인 1건 실패',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => '확인 필요';

  @override
  String get vendorGroupHealthy => '정상';

  @override
  String get vendorGroupIdle => '미설정 또는 꺼짐';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 더 보기',
      one: '1개 더 보기',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => '접기';

  @override
  String get vendorOff => '꺼짐';

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
    return '$amount 남음';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return '$amount 미만 시 경고';
  }

  @override
  String vendorResetsWhen(String when) {
    return '$when 초기화';
  }

  @override
  String vendorRenewsOn(String date) {
    return '$date 갱신';
  }

  @override
  String vendorExpiredOn(String date) {
    return '$date 만료';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분 후',
      one: '1분 후',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간 후',
      one: '1시간 후',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 후',
      one: '1일 후',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return '$when 확인';
  }

  @override
  String get vendorSourceApi => '서비스 제공';

  @override
  String get vendorSourceOwnCount => 'Casama 집계';

  @override
  String get vendorSourceManual => '수동 입력';

  @override
  String vendorReadingError(String error) {
    return '마지막 확인 실패: $error';
  }

  @override
  String get vendorNotSetUpHint => '확인을 시작하려면 서버에 키를 추가해 주세요.';

  @override
  String get vendorOffHint => '모니터링이 꺼져 있어요.';

  @override
  String get vendorPickOne => '세부 정보를 볼 서비스를 선택하세요.';

  @override
  String get vendorSectionStatus => '상태';

  @override
  String get vendorSectionActions => '작업';

  @override
  String get vendorSectionAlerts => '알림';

  @override
  String get vendorSectionPlan => '플랜';

  @override
  String vendorWarnAtValue(int percent) {
    return '사용량 $percent% 도달 시 경고';
  }

  @override
  String get vendorWarnAtHelp => '이 지점에 도달하면 게이지가 주황색으로 바뀌어요.';

  @override
  String get vendorPeriod => '주기';

  @override
  String get vendorPeriodNone => '설정 안 됨';

  @override
  String get vendorPeriodDay => '매일';

  @override
  String get vendorPeriodMonth => '매월';

  @override
  String get vendorPeriodBilling => '결제 주기마다';

  @override
  String get vendorPeriodPrepaid => '선불';

  @override
  String get vendorDateNotSet => '설정 안 됨';

  @override
  String get vendorClearDate => '날짜 지우기';

  @override
  String get vendorLimitInvalid => '0보다 큰 숫자를 입력해 주세요.';

  @override
  String get vendorAmountInvalid => '0 이상을 입력해 주세요.';

  @override
  String get vendorMonthsInvalid => '1~120개월 사이로 입력해 주세요.';

  @override
  String get vendorWarnAtInvalid => '1%에서 100% 사이로 선택해 주세요.';

  @override
  String get vendorSaved => '설정을 저장했어요';

  @override
  String get vendorCheckDone => '확인됨';

  @override
  String get vendorHistoryEmpty => '아직 측정 내역이 없어요.';

  @override
  String get vendorCheckFailed => '확인 실패';

  @override
  String get vendorResets => '초기화';

  @override
  String get vendorSource => '출처';

  @override
  String get vendorBilling => '결제 및 충전';

  @override
  String get vendorBalanceWarning => '잔액 미만 시 경고';

  @override
  String get vendorPeriodStart => '주기 시작일';

  @override
  String get vendorInvalidSettings => '양수인 한도, 0~1 사이의 경고 값, 올바른 날짜를 입력해 주세요.';

  @override
  String get card24hRange => '24시간 범위';

  @override
  String get card52wRange => '52주 범위';

  @override
  String get cardAgain => '다시';

  @override
  String get cardAgoSuffix => '전';

  @override
  String get cardAirQuality => '대기질';

  @override
  String get cardAqiAdviceBad => '모두 장시간이나 격렬한 실외 활동을 줄이고 창문을 닫아 두세요.';

  @override
  String get cardAqiAdviceGood => '외출하기 좋은 날씨예요.';

  @override
  String get cardAqiAdviceModerate =>
      '대부분의 사람에게 무난하며, 매우 민감한 분은 무리하지 않는 것이 좋아요.';

  @override
  String get cardAqiAdviceSensitive => '어린이, 노약자, 천식이 있는 분은 장시간 실외 활동을 자제하세요.';

  @override
  String get cardAqiGood => '좋음';

  @override
  String get cardAqiHazardous => '매우 나쁨';

  @override
  String get cardAqiModerate => '보통';

  @override
  String get cardAqiSensitive => '민감군 영향';

  @override
  String get cardAqiUnhealthy => '나쁨';

  @override
  String get cardAqiVeryUnhealthy => '매우 나쁨';

  @override
  String get cardBaggage => '수하물';

  @override
  String get cardCalcAmount => '금액';

  @override
  String get cardCalcBill => '요금';

  @override
  String get cardCalcDiscount => '할인';

  @override
  String get cardCalcDiscountTitle => '할인';

  @override
  String get cardCalcGross => '세금 포함';

  @override
  String get cardCalcGrowth => '증가율';

  @override
  String get cardCalcInterest => '이자';

  @override
  String get cardCalcLoan => '대출';

  @override
  String get cardCalcMonthly => '매월';

  @override
  String get cardCalcMonthlyPayment => '월 납입금';

  @override
  String get cardCalcNet => '세전';

  @override
  String get cardCalcPeople => '인원';

  @override
  String get cardCalcPerPerson => '1인당 부담액';

  @override
  String get cardCalcPrice => '가격';

  @override
  String get cardCalcPrincipal => '원금';

  @override
  String get cardCalcRate => '연이율';

  @override
  String get cardCalcSavings => '절약액';

  @override
  String get cardCalcStart => '시작 금액';

  @override
  String get cardCalcTax => '세금';

  @override
  String get cardCalcTaxIncluded => '세금 포함';

  @override
  String get cardCalcTaxRate => '세율';

  @override
  String get cardCalcTip => '팁';

  @override
  String get cardCalcTipAmount => '팁';

  @override
  String get cardCalcTipSplit => '팁 및 더치페이';

  @override
  String get cardCalcTotal => '합계';

  @override
  String get cardCalcTotalInterest => '총이자';

  @override
  String get cardCalcTotalPaid => '총 납입액';

  @override
  String get cardCalcUnits => '단위 변환';

  @override
  String get cardCalcValue => '값';

  @override
  String get cardCalcVat => '부가세';

  @override
  String get cardCalcYears => '기간(년)';

  @override
  String get cardCalcYouPay => '지출 금액';

  @override
  String get cardCalcYouPutIn => '투자 원금';

  @override
  String get cardCalcYouSave => '절감 금액';

  @override
  String get cardCall => '통화';

  @override
  String get cardCaloriesWord => '칼로리';

  @override
  String get cardComparison => '비교';

  @override
  String get cardCondClear => '맑음';

  @override
  String get cardCondCloudy => '흐림';

  @override
  String get cardCondDrizzle => '이슬비';

  @override
  String get cardCondFog => '안개';

  @override
  String get cardCondHail => '우박';

  @override
  String get cardCondHeavyRain => '폭우';

  @override
  String get cardCondHeavySnow => '폭설';

  @override
  String get cardCondLightRain => '약한 비';

  @override
  String get cardCondLightSnow => '약한 눈';

  @override
  String get cardCondMostlyClear => '대체로 맑음';

  @override
  String get cardCondPartlyCloudy => '구름 조금';

  @override
  String get cardCondRain => '비';

  @override
  String get cardCondShowers => '소나기';

  @override
  String get cardCondSleet => '진눈깨비';

  @override
  String get cardCondSnow => '눈';

  @override
  String get cardCondThunder => '뇌우';

  @override
  String get cardCons => '단점';

  @override
  String get cardCopied => '복사됨';

  @override
  String get cardCopy => '텍스트로 복사';

  @override
  String get cardCouldntUpdate => '업데이트하지 못했어요';

  @override
  String get cardCurrency => '통화';

  @override
  String get cardDayLength => '낮 길이';

  @override
  String get cardDayRange => '하루 기온차';

  @override
  String get cardDays => '일';

  @override
  String get cardDelay => '지연';

  @override
  String get cardDictionary => '사전';

  @override
  String get cardEmail => '이메일';

  @override
  String get cardFlightCancelled => '결항';

  @override
  String get cardFlightDiverted => '회항';

  @override
  String get cardFlightInAir => '비행 중';

  @override
  String get cardFlightIncident => '특이사항';

  @override
  String get cardFlightLanded => '착륙';

  @override
  String get cardFlightScheduled => '정시';

  @override
  String cardStaysFromNight(String price) {
    return '1박 $price~';
  }

  @override
  String get cardStaysANight => '1박';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n박',
      one: '1박',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '투숙객 $n명',
      one: '투숙객 1명',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '객실 $n개',
      one: '객실 1개',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => '추천순';

  @override
  String get cardStaysSortCheapest => '최저가순';

  @override
  String get cardStaysSortTopRated => '평점순';

  @override
  String get cardStaysSortClosest => '거리순';

  @override
  String get cardStaysFilterFreeCancel => '무료 취소';

  @override
  String get cardStaysFilterBreakfast => '조식';

  @override
  String get cardStaysFilterPayAtHotel => '현장 결제';

  @override
  String get cardStaysFilterStars => '4성급 이상';

  @override
  String get cardStaysFilterRated => '평점 8+ 이상';

  @override
  String get cardStaysList => '목록';

  @override
  String get cardStaysMap => '지도';

  @override
  String get cardStaysEdit => '편집';

  @override
  String cardStaysRating(String value, String max) {
    return '$value / $max';
  }

  @override
  String cardStaysKm(String km) {
    return '도심에서 $km km';
  }

  @override
  String cardStaysStars(int n) {
    return '$n성급';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n박 $price',
      one: '1박 $price',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '외 $n개 사이트',
      one: '외 1개 사이트',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => '상품 보기';

  @override
  String get cardStaysView => '보기';

  @override
  String cardStaysShowAll(int n) {
    return '$n개 모두 보기';
  }

  @override
  String get cardStaysShowFewer => '간략히 보기';

  @override
  String get cardStaysNone => '이 필터와 일치하는 항목이 없어요.';

  @override
  String get cardStaysNoMap => '지도에 표시할 수 있는 위치 정보가 없는 장소들이에요.';

  @override
  String get cardStaysNoDeals => '이 날짜에 이용 가능한 요금이 없어요.';

  @override
  String get cardStaysCheck => '요금은 예약 사이트에서 확인했어요.';

  @override
  String cardStaysCompare(int n) {
    return '비교 ($n)';
  }

  @override
  String get cardStaysCompareHint => '비교할 항목을 최대 4개까지 선택하세요';

  @override
  String get cardStaysComparePick => '비교할 항목 선택';

  @override
  String get cardStaysCompareTitle => '비교';

  @override
  String get cardStaysRowNight => '1박 요금';

  @override
  String get cardStaysRowTotal => '합계';

  @override
  String get cardStaysRowRating => '평점';

  @override
  String get cardStaysRowStars => '성급';

  @override
  String get cardStaysRowDistance => '거리';

  @override
  String get cardStaysYes => '있음';

  @override
  String get cardStaysNo => '없음';

  @override
  String get cardStaysTermFreeCancel => '무료 취소';

  @override
  String get cardStaysTermBreakfast => '조식 포함';

  @override
  String get cardStaysTermNoBreakfast => '조식 미포함';

  @override
  String get cardStaysTermPayAtHotel => '호텔 현장 결제';

  @override
  String get cardStaysTermNonRefundable => '환불 불가';

  @override
  String get cardStaysDetailsTitle => '숙소';

  @override
  String get cardStaysCheapest => '최저가';

  @override
  String get cardStaysAmenities => '편의시설';

  @override
  String cardStaysCheckIn(String time) {
    return '체크인 $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return '체크아웃 $time';
  }

  @override
  String get cardStaysNearby => '주변';

  @override
  String get cardStaysHotelSite => '호텔 웹사이트';

  @override
  String get cardStaysBook => '대신 예약하기';

  @override
  String cardStaysBookLabel(String name, String site) {
    return '$site에서 $name 예약하기';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return '사진 $n / $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · 월별 요금';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return '가장 저렴한 시기: $month, 1박 약 $price';
  }

  @override
  String get cardStaysTrendNote => '실시간 요금이 아닌 예상 추세예요.';

  @override
  String get cardStaysTrendPick => '날짜 선택';

  @override
  String get cardStaysSearchTitle => '숙소 찾기';

  @override
  String get cardStaysSearchWhere => '어디로';

  @override
  String get cardStaysSearchWhereHint => '도시, 지역 또는 호텔';

  @override
  String get cardStaysSearchDates => '날짜 선택';

  @override
  String get cardStaysSearchAdults => '성인';

  @override
  String get cardStaysSearchRooms => '객실';

  @override
  String get cardStaysSearchBudget => '1박 예산 (선택)';

  @override
  String get cardStaysSearchNotNow => '나중에';

  @override
  String get cardStaysSearchGo => '숙소 검색';

  @override
  String get cardStaysSearchSent => '검색 중';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return '$where 숙소, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return '접기: $label';
  }

  @override
  String cardStaysMore(String label) {
    return '더 보기: $label';
  }

  @override
  String get cardStaysAmenityPool => '수영장';

  @override
  String get cardStaysAmenityParking => '주차';

  @override
  String get cardStaysAmenityPets => '반려동물 동반 가능';

  @override
  String get cardStaysAmenityGym => '피트니스 센터';

  @override
  String get cardStaysAmenitySpa => '스파';

  @override
  String get cardStaysAmenityKitchen => '주방';

  @override
  String get cardStaysAmenityWifi => 'Wi-Fi';

  @override
  String get cardStaysAmenityAirCon => '에어컨';

  @override
  String get cardProductsTitle => '쇼핑 목록';

  @override
  String cardProductsFrom(String price) {
    return '$price~';
  }

  @override
  String cardProductsUnder(String price) {
    return '$price 이하';
  }

  @override
  String get cardProductsSortBest => '추천순';

  @override
  String get cardProductsSortCheapest => '최저가순';

  @override
  String get cardProductsSortTopRated => '평점순';

  @override
  String get cardProductsOnSale => '할인 중';

  @override
  String get cardProductsRated => '평점 4+ 이상';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => '외 다른 스토어';

  @override
  String cardProductsShowAll(int n) {
    return '$n개 모두 보기';
  }

  @override
  String get cardProductsShowFewer => '간략히 보기';

  @override
  String get cardProductsShowMore => '더 보기';

  @override
  String get cardProductsNone => '이 필터와 일치하는 항목이 없어요.';

  @override
  String get cardProductsCheck => '가격은 스토어에서 확인했어요.';

  @override
  String get cardProductsBuy => '구입';

  @override
  String get cardProductsCompareStores => '스토어 비교';

  @override
  String cardProductsCompareLabel(String title) {
    return '$title 판매 스토어 비교';
  }

  @override
  String get cardProductsBuyForMe => '대신 구입하기';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return '$store에서 $title 구입하기';
  }

  @override
  String get cardProductsRowPrice => '가격';

  @override
  String get cardProductsRowStore => '스토어';

  @override
  String get cardProductsRowRating => '평점';

  @override
  String get cardProductsRowDelivery => '배송';

  @override
  String cardProductsDelivery(String text) {
    return '배송: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return '$brand';
  }

  @override
  String get cardProductsOffers => '스토어';

  @override
  String get cardProductsLowest => '최저 총액';

  @override
  String cardProductsTotal(String price) {
    return '총 $price';
  }

  @override
  String get cardProductsOutOfStock => '품절';

  @override
  String get cardProductsFeatures => '상세 정보';

  @override
  String get cardProductsReviews => '구매자 후기';

  @override
  String get cardCheckoutTitle => '결제 전 확인';

  @override
  String get cardCheckoutTotal => '합계';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => '페이지 열기';

  @override
  String get cardCheckoutCancel => '취소';

  @override
  String get cardCheckoutChange => '변경';

  @override
  String get cardCheckoutConfirm => '확인 및 결제';

  @override
  String get cardCheckoutCancelLabel => '취소하기';

  @override
  String get cardCheckoutChangeLabel => '내용 변경하기';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return '$seller에서 $total 결제 승인';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return '$total 결제 승인';
  }

  @override
  String get cardCheckoutConfirmed => '승인됨';

  @override
  String get cardCheckoutChanging => '변경 중';

  @override
  String get cardCheckoutCancelled => '취소됨';

  @override
  String get cardBookingTitle => '내 예약';

  @override
  String cardBookingWith(String site) {
    return '$site에서 예약함';
  }

  @override
  String get cardBookingCheckIn => '체크인';

  @override
  String get cardBookingCheckOut => '체크아웃';

  @override
  String get cardBookingConfirmation => '예약 번호';

  @override
  String get cardBookingCopy => '예약 번호 복사';

  @override
  String get cardBookingPaid => '결제 완료';

  @override
  String get cardBookingPayAtHotel => '호텔 현장 결제';

  @override
  String cardBookingCancelBy(String date) {
    return '$date까지 무료 취소';
  }

  @override
  String get cardBookingDirections => '길찾기';

  @override
  String get cardBookingManage => '예약 관리';

  @override
  String get cardBookingCalendar => '캘린더에 추가';

  @override
  String cardBookingCalendarLabel(String name) {
    return '내 캘린더에 $name 추가';
  }

  @override
  String cardOrderNumber(String id) {
    return '주문 $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return '$date 주문';
  }

  @override
  String get cardOrderStepOrdered => '주문 완료';

  @override
  String get cardOrderStepShipped => '발송됨';

  @override
  String get cardOrderStepOut => '배송 중';

  @override
  String get cardOrderStepDelivered => '배송 완료';

  @override
  String get cardOrderCancelled => '취소됨';

  @override
  String get cardOrderReturned => '반품됨';

  @override
  String cardOrderArrives(String date) {
    return '$date 도착 예정';
  }

  @override
  String get cardOrderTracking => '운송장 번호';

  @override
  String get cardOrderCopy => '운송장 번호 복사';

  @override
  String get cardOrderTrack => '배송 조회';

  @override
  String cardOrderTrackLabel(String number) {
    return '$number 배송 조회';
  }

  @override
  String get cardOrderPage => '주문 페이지';

  @override
  String get cardFaresBest => '추천순';

  @override
  String get cardFaresCheapest => '최저가순';

  @override
  String get cardFaresFastest => '최단 시간순';

  @override
  String get cardFaresDirectOnly => '직항만';

  @override
  String get cardFaresDirect => '직항';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '경유 $n회',
      one: '경유 1회',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => '예약';

  @override
  String cardFaresFromPrice(String price) {
    return '$price~';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '여행객 $n명',
      one: '여행객 1명',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n박',
      one: '1박',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => '일반석';

  @override
  String get cardFaresPremium => '프리미엄 일반석';

  @override
  String get cardFaresBusiness => '비즈니스석';

  @override
  String get cardFaresFirst => '일등석';

  @override
  String cardFaresTypical(String low, String high) {
    return '이 여정의 평소 요금: $low–$high';
  }

  @override
  String get cardFaresLevelLow => '현재 저렴한 편';

  @override
  String get cardFaresLevelTypical => '현재 보통 수준';

  @override
  String get cardFaresLevelHigh => '현재 비싼 편';

  @override
  String cardFaresShowAll(int n) {
    return '$n개 모두 보기';
  }

  @override
  String get cardFaresShowFewer => '간략히 보기';

  @override
  String get cardFaresNoDirect => '이 검색 조건에 맞는 직항편이 없어요.';

  @override
  String get cardFaresOutboundOnly =>
      '표시된 가격은 왕복 전체 요금이에요. Google 항공편에서 귀국편을 선택하세요.';

  @override
  String get cardFaresSeeAll => 'Google 항공편에서 전체 보기';

  @override
  String get cardFaresCheck => '모든 탑승객 기준 요금이며, 예약 사이트에서 다시 확인돼요.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '기내 수하물 $cabin개, 위탁 수하물 $checked개';
  }

  @override
  String get cardFaresAffiliate =>
      '이 링크를 통해 예약하시면 Casama가 수수료를 받을 수 있어요. 결제 금액에는 영향이 없어요.';

  @override
  String cardFaresCompare(String site) {
    return '$site에서 비교';
  }

  @override
  String get cardFaresWatch => '가격 지켜보기';

  @override
  String cardFaresWatching(String date) {
    return '지켜보는 중 · $date 종료';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return '$price 이하일 때 알림 · $date 종료';
  }

  @override
  String get cardFaresWatchStop => '중지';

  @override
  String get cardFaresWatchTitle => '이 가격 지켜보기';

  @override
  String get cardFaresWatchBody =>
      'Casama가 하루에 몇 번씩 이 가격을 확인하고, 가격이 내려가면 알림을 보내 드려요. 해당 날짜가 지나거나 60일이 지나면 자동으로 종료돼요.';

  @override
  String get cardFaresWatchTarget => '이 금액 이하일 때 알림 받기 (선택)';

  @override
  String get cardFaresWatchAnyDrop => '큰 폭으로 하락할 때마다 받으려면 비워 두세요';

  @override
  String get cardFaresWatchStart => '지켜보기';

  @override
  String get cardFaresWatchStarted => '이 가격을 지켜보고 있어요. 가격이 내려가면 알림을 보내 드려요.';

  @override
  String get cardFaresWatchStopped => '가격 지켜보기를 중지했어요.';

  @override
  String get cardFaresWatchFull =>
      '이미 10개의 가격을 지켜보고 있어요. 먼저 설정 → 카드에서 하나를 중지해 주세요.';

  @override
  String get cardFaresWatchFailed => '가격 지켜보기 설정을 변경하지 못했어요. 다시 시도해 주세요.';

  @override
  String get cardFaresFlagSeparate => '별도 발권';

  @override
  String get cardFaresFlagOvernight => '1박 경유';

  @override
  String get cardFaresFlagAirport => '공항 이동';

  @override
  String get cardFaresFlagShort => '짧은 경유 시간';

  @override
  String get cardFaresFlagLong => '긴 경유 시간';

  @override
  String get cardFaresNoteSeparate =>
      '편도 구간에 서로 다른 항공사가 포함되어 있어 별도 티켓으로 발권될 수 있어요. 연결편을 놓치면 다음 항공편이 보장되지 않을 수 있으니 예약 사이트에서 확인해 주세요.';

  @override
  String get cardFaresNoteOvernight => '야간 경유가 포함되어 있어요.';

  @override
  String get cardFaresNoteAirport => '연결편이 다른 공항에서 출발해요.';

  @override
  String get cardFaresNoteShort => '경유 시간이 1시간 미만이에요.';

  @override
  String get cardFaresNoteLong => '경유 시간이 8시간을 초과해요.';

  @override
  String get cardFaresOutbound => '출국편';

  @override
  String get cardFaresReturn => '귀국편';

  @override
  String cardFaresEmissions(int kg) {
    return '여행객 1인당 CO₂ 약 $kg kg';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return '$place에서 $time 경유';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return '다음 항공편은 $place에서 출발';
  }

  @override
  String get cardFaresViewFailed => '항공권 요금을 불러오지 못했어요.';

  @override
  String get cardFaresTryAgain => '다시 시도';

  @override
  String get cardFaresMorning => '오전';

  @override
  String get cardFaresAfternoon => '오후';

  @override
  String get cardFaresEvening => '저녁';

  @override
  String get cardFaresNight => '심야';

  @override
  String get cardFaresTime => '시간대';

  @override
  String get cardFaresAirlines => '항공사';

  @override
  String get cardFaresBagIncluded => '수하물 포함';

  @override
  String get cardFaresNoMatch => '이 필터와 일치하는 항공편이 없어요.';

  @override
  String get cardFaresOpenInChat => '채팅에서 열기';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return '$date $route 항공편 보기';
  }

  @override
  String get cardFaresEdit => '검색 수정';

  @override
  String get cardFaresDetails => '세부 정보';

  @override
  String get cardFaresSinceStart => '지켜보기 시작 이후';

  @override
  String get cardFareCalOneWay => '편도';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n박 후 귀국',
      one: '1박 후 귀국',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => '저렴함';

  @override
  String get cardFareCalUsual => '보통';

  @override
  String get cardFareCalHigh => '비쌈';

  @override
  String cardFareCalCheapest(String day, String price) {
    return '최저가: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => '항공권 보기';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: 요금 없음';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return '$from 출발 · 모든 지역';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return '$from 출발 · 해외';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return '$from 출발 · 국내';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return '$price 이하';
  }

  @override
  String get cardFlightSearchTitle => '항공편 검색';

  @override
  String get cardFlightSearchReturn => '왕복';

  @override
  String get cardFlightSearchOneWay => '편도';

  @override
  String get cardFlightSearchFrom => '출발지';

  @override
  String get cardFlightSearchTo => '도착지';

  @override
  String get cardFlightSearchPlaceHint => '도시 또는 공항';

  @override
  String get cardFlightSearchAnywhere => '모든 지역';

  @override
  String get cardFlightSearchSwap => '출발·도착지 바꾸기';

  @override
  String get cardFlightSearchPickDates => '날짜 선택';

  @override
  String get cardFlightSearchPickDate => '날짜 선택';

  @override
  String get cardFlightSearchWholeMonth => '한 달 전체';

  @override
  String get cardFlightSearchNights => '체류 기간(박)';

  @override
  String get cardFlightSearchAdults => '성인';

  @override
  String get cardFlightSearchChildren => '소아 (만 2~11세)';

  @override
  String get cardFlightSearchInfants => '유아 (만 2세 미만)';

  @override
  String get cardFlightSearchNotNow => '나중에';

  @override
  String get cardFlightSearchSent => '검색 중…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return '$route 항공편, $dates';
  }

  @override
  String get cardFareTrendNow => '현재 최저가';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '최근 $n일',
      one: '지난 1일',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return '$low~$high';
  }

  @override
  String get cardFareTrendNote => '예상치가 아닌 실제 기록된 가격이에요. 요금은 언제든 변동될 수 있어요.';

  @override
  String get cardFareWatchesTitle => '가격 지켜보기';

  @override
  String get cardFareWatchesNone =>
      '지켜보고 있는 항공권이 없어요. 항공권 카드에서 ‘가격 지켜보기’를 탭해 시작해 보세요.';

  @override
  String get cardFareWatchesNoPrice => '아직 가격 정보 없음';

  @override
  String cardFareWatchesTarget(String price) {
    return '목표가 $price';
  }

  @override
  String get cardFareWatchesAnyDrop => '큰 폭 하락 시';

  @override
  String cardFareWatchesLow(String price) {
    return '최저 $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return '$date 종료';
  }

  @override
  String get cardsFareWatches => '가격 지켜보기';

  @override
  String get cardsFareWatchesNone =>
      '지켜보는 가격이 없어요. 항공권 카드에서 ‘가격 지켜보기’를 탭하면 가격이 내릴 때 알림을 받을 수 있어요.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return '현재 $price · $date 종료';
  }

  @override
  String get cardFromBot => '봇이 작성한 내용이며 부정확할 수 있어요';

  @override
  String get cardFullRecipe => '전체 레시피';

  @override
  String get cardGate => '탑승구';

  @override
  String get cardGo => '시작';

  @override
  String get cardHeads => '앞면';

  @override
  String get cardHolidays => '공휴일';

  @override
  String get cardHoursShort => '시간';

  @override
  String get cardHumidity => '습도';

  @override
  String get cardItsTime => '시간이 되었어요!';

  @override
  String get cardJustNow => '방금 전';

  @override
  String get cardLast24h => '최근 24시간';

  @override
  String get cardLast30Days => '최근 30일';

  @override
  String get cardListen => '듣기';

  @override
  String get cardLiveNow => '지금';

  @override
  String get cardLongWeekend => '연휴';

  @override
  String get cardLostShort => '패';

  @override
  String get cardMarket24h => '연중무휴';

  @override
  String get cardMarketCap => '시가총액';

  @override
  String get cardMarketClosed => '장 마감';

  @override
  String get cardMarketOpen => '장중';

  @override
  String get cardMarketPost => '시간 외 거래';

  @override
  String get cardMarketPre => '프리마켓';

  @override
  String get cardMessage => '메시지';

  @override
  String get cardMinutesShort => '분';

  @override
  String get cardMoonFirstQuarter => '상현달';

  @override
  String get cardMoonFull => '보름달';

  @override
  String get cardMoonLastQuarter => '하현달';

  @override
  String get cardMoonNew => '삭(신월)';

  @override
  String get cardMoonWaningCrescent => '그믐달';

  @override
  String get cardMoonWaningGibbous => '하현망달';

  @override
  String get cardMoonWaxingCrescent => '초승달';

  @override
  String get cardMoonWaxingGibbous => '상현망달';

  @override
  String get cardMore => '더 보기';

  @override
  String get cardNext24h => '향후 24시간';

  @override
  String get cardNoAlerts => '특보 없음';

  @override
  String get cardNoAlertsLong => '현재 이 지역에 발효 중인 기상특보가 없어요.';

  @override
  String get cardNoChart => '이 기간의 차트가 없어요';

  @override
  String get cardNoGames => '경기 없음';

  @override
  String get cardNoHolidays => '올해 남은 공휴일이 없어요.';

  @override
  String get cardNoQuakes => '최근 해당 규모의 지진이 없었어요.';

  @override
  String get cardNoStorms => '활동 중 없음';

  @override
  String get cardNoStormsLong => '현재 활동 중인 태풍이 없어요.';

  @override
  String get cardNotAdvice => '투자 조언이 아니에요';

  @override
  String get cardNow => '지금';

  @override
  String get cardNutritionFacts => '영양 정보';

  @override
  String get cardOpen => '열기';

  @override
  String get cardOpenSource => '원본 열기';

  @override
  String get cardParcel => '택배';

  @override
  String get cardParcelDelivered => '배송 완료';

  @override
  String get cardParcelInTransit => '배송 중';

  @override
  String get cardParcelOrdered => '운송장 등록됨';

  @override
  String get cardParcelOut => '배달 출발';

  @override
  String get cardParcelProblem => '문제 발생';

  @override
  String get cardParcelNoLive =>
      '여기에서 이 번호의 실시간 배송 상태를 제공하지 않아요. 택배사 페이지에서 최신 정보를 확인하세요.';

  @override
  String cardParcelTrackOn(String site) {
    return '$site에서 조회';
  }

  @override
  String get cardPin => '위젯에 고정';

  @override
  String get cardPinFailed => '이 카드를 고정하지 못했어요';

  @override
  String get cardPinned => '위젯에 고정되었어요';

  @override
  String get cardPinnedWaiting => '고정되었어요. 위젯에서 보려면 이 봇이 위젯을 사용하도록 허용해 주세요';

  @override
  String get cardPlayedShort => '경기';

  @override
  String get cardPointsShort => '승점';

  @override
  String get cardPrevClose => '전일 종가';

  @override
  String get cardPros => '장점';

  @override
  String get cardProsCons => '장단점';

  @override
  String get cardQuiz => '퀴즈';

  @override
  String get cardRain => '비';

  @override
  String get cardRainChance => '강수 확률';

  @override
  String get cardRandom => '무작위';

  @override
  String get cardReadMore => '더 읽기';

  @override
  String get cardReferenceRates => '매일 고시되는 중앙은행 기준 환율';

  @override
  String get cardRefresh => '새로고침';

  @override
  String get cardReport => '잘못된 데이터 신고';

  @override
  String get cardReported => '감사해요. 내용을 확인해 볼게요';

  @override
  String get cardSameTime => '시차 없음';

  @override
  String get cardScores => '점수';

  @override
  String get cardSecondsShort => '초';

  @override
  String get cardServings => '인분';

  @override
  String get cardShareImage => '이미지로 공유';

  @override
  String get cardStandings => '순위';

  @override
  String get cardStorms => '태풍';

  @override
  String get cardSunMoon => '해와 달';

  @override
  String get cardSunrise => '일출';

  @override
  String get cardSunset => '일몰';

  @override
  String get cardSwap => '바꾸기';

  @override
  String get cardSynonyms => '유의어:';

  @override
  String get cardTails => '뒷면';

  @override
  String get cardTeam => '팀';

  @override
  String get cardTerminal => '터미널';

  @override
  String get cardTimeIn => '장소별 체류 시간';

  @override
  String get cardTimeline => '타임라인';

  @override
  String get cardToday => '오늘';

  @override
  String get cardTomorrow => '내일';

  @override
  String get cardTranslation => '번역';

  @override
  String get cardTsunami => '쓰나미';

  @override
  String get cardUnpin => '위젯에서 삭제';

  @override
  String get cardUnpinned => '위젯에서 삭제되었어요';

  @override
  String get cardUv => '자외선';

  @override
  String get cardUvExtreme => '위험';

  @override
  String get cardUvHigh => '높음';

  @override
  String get cardUvLow => '낮음';

  @override
  String get cardUvModerate => '보통';

  @override
  String get cardUvVeryHigh => '매우 높음';

  @override
  String get cardVolume => '거래량';

  @override
  String get cardWatchlist => '관심 목록';

  @override
  String get cardWeather => '날씨';

  @override
  String get cardWeatherAlerts => '기상특보';

  @override
  String get cardWebsite => '웹사이트';

  @override
  String get cardWind => '바람';

  @override
  String get cardWonShort => '승';

  @override
  String get cardWorldClock => '세계 시계';

  @override
  String get cardYesterday => '어제';

  @override
  String get cardQuakesWorld => '오늘 발생한 가장 강한 지진';

  @override
  String cardMinutesAgo(int n) {
    return '$n분 전';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n시간 전';
  }

  @override
  String cardStale(String ago) {
    return '업데이트하지 못함 · $ago 기준';
  }

  @override
  String cardUpdated(String ago) {
    return '$ago 업데이트됨';
  }

  @override
  String cardDelayed(int minutes) {
    return '$minutes분 지연';
  }

  @override
  String cardHighLow(String high, String low) {
    return '최고 $high  최저 $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return '체감 $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n일';
  }

  @override
  String cardUntil(String when) {
    return '$when까지';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '특보 $n건 발효 중',
      one: '특보 1건 발효 중',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return '주요 물질: $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': '오리나무 꽃가루',
      'birch': '자작나무 꽃가루',
      'grass': '잔디 꽃가루',
      'mugwort': '쑥 꽃가루',
      'olive': '올리브 꽃가루',
      'ragweed': '돼지풀 꽃가루',
      'other': '꽃가루',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h시간 $m분';
  }

  @override
  String cardGoldenHour(String time) {
    return '$time부터 골든아워';
  }

  @override
  String cardMoonLit(int pct) {
    return '조도 $pct%';
  }

  @override
  String cardMoonrise(String time) {
    return '일출 $time';
  }

  @override
  String cardMoonset(String time) {
    return '일몰 $time';
  }

  @override
  String cardRangeChange(String range) {
    return '$range 변동';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up 상승 · $down 하락';
  }

  @override
  String cardRatesOf(String date) {
    return '$date 기준 환율';
  }

  @override
  String cardAtTime(String when) {
    return '$when 기준';
  }

  @override
  String cardInDays(int n) {
    return '$n일 후';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct% 완료';
  }

  @override
  String cardQuakesNear(String place) {
    return '$place 인근 지진';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '지진 $n건',
      one: '지진 1건',
      zero: '없음',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '깊이 $depth';
  }

  @override
  String cardAway(String distance) {
    return '$distance 거리';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '활동 중 $n개',
      one: '활동 중 1개',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return '$level 경보';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n경기',
      one: '1경기',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n경기 진행 중';
  }

  @override
  String cardMinutes(int n) {
    return '$n분';
  }

  @override
  String cardExpected(String date) {
    return '$date 도착 예정';
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
      other: '$n걸음',
      one: '1걸음',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return '$n승';
  }

  @override
  String cardServingSize(String size) {
    return '1회 제공량: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$total개 중 $passed개 통과';
  }

  @override
  String cardTotal(int n) {
    return '합계 $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return '$n년 후';
  }

  @override
  String get cardsSettingsTitle => '카드';

  @override
  String get cardsSettingsRow => '기준 도시, 단위 및 데이터 출처';

  @override
  String get cardsSettingsIntro =>
      '봇이 날씨, 가격, 환율, 시간 등을 최신 실제 데이터 카드로 답해 드려요. 장소를 말하지 않고 질문하면 기준 도시를 사용해요.';

  @override
  String get cardsSettingsSaveFailed => '저장하지 못했어요. 다시 시도해 주세요.';

  @override
  String get cardsHomeCity => '기준 도시';

  @override
  String get cardsHomeClear => '지우기';

  @override
  String get cardsHomeNone => '설정되지 않았어요. 직접 선택하기 전까지 시간대의 대표 도시를 사용해요.';

  @override
  String get cardsHomeSearch => '도시 검색';

  @override
  String get cardsHomePrivacy =>
      '주소는 저장되지 않고 도시 정보만 보관되며, 날씨 서비스에는 대략적인 좌표만 전달돼요.';

  @override
  String get cardsUnits => '단위';

  @override
  String get cardsTemperature => '기온';

  @override
  String get cardsWind => '풍속';

  @override
  String get cardsRain => '강수량';

  @override
  String get cardsDistance => '거리';

  @override
  String get cardsPrices => '가격';

  @override
  String get cardsRedUp => '상승을 빨간색으로 표시';

  @override
  String get cardsRedUpHint => '한국·중국·일본 시장 방식대로 가격 상승을 빨간색, 하락을 초록색으로 표시해요.';

  @override
  String get cardsSources => '데이터 출처';

  @override
  String get cardsSourcesIntro =>
      '카드는 데이터의 출처와 기준 시점을 함께 표시해요. 아래 서비스에서 데이터를 제공해요:';

  @override
  String get cardFewerServings => '인분 줄이기';

  @override
  String get cardMoreServings => '인분 늘리기';

  @override
  String get cropTitle => '이동 및 크기 조절';

  @override
  String get cropDone => '완료';

  @override
  String get cropPosition => '사진 위치';

  @override
  String get cropMoveUp => '위로 이동';

  @override
  String get cropMoveDown => '아래로 이동';

  @override
  String get cropMoveLeft => '왼쪽으로 이동';

  @override
  String get cropMoveRight => '오른쪽으로 이동';

  @override
  String get cropRotate => '회전';

  @override
  String get cropMirror => '좌우 반전';

  @override
  String get cropReset => '초기화';

  @override
  String get cropZoom => '확대/축소';

  @override
  String get cropZoomIn => '확대';

  @override
  String get cropZoomOut => '축소';

  @override
  String get cropSoft => '크게 확대되어 사진이 흐리게 보일 수 있어요';

  @override
  String get cropAnimatedStill => '움직이는 이미지는 정지 상태로 표시돼요';

  @override
  String get cropBackground => '배경';

  @override
  String get cropBackgroundNone => '없음';

  @override
  String cropBackgroundBot(String name) {
    return '$name 색상';
  }

  @override
  String get cropBackgroundWhite => '흰색';

  @override
  String get cropBackgroundBlack => '검은색';

  @override
  String get cropUnreadable => '여기서 열 수 없는 사진이에요. JPEG 또는 PNG 형식으로 시도해 주세요.';

  @override
  String cropTooBig(String size) {
    return '이 파일은 $size로 40 MB 제한을 초과해요.';
  }

  @override
  String get botPicture => '사진';

  @override
  String botPictureTitle(String name) {
    return '$name의 사진';
  }

  @override
  String botPictureChange(String name) {
    return '$name의 사진 변경';
  }

  @override
  String get botPicturePaste => '사진 붙여넣기';

  @override
  String get botPictureDraw => 'AI로 만들기';

  @override
  String get botPictureDrawHelp => 'Casama가 두 장을 그려 드려요';

  @override
  String get botPictureRecrop => '다시 자르기';

  @override
  String get botPictureMascot => '대신 마스코트 사용';

  @override
  String get botPictureRemove => '사진 삭제';

  @override
  String get botPictureRecent => '최근';

  @override
  String get botPictureUpdated => '사진이 업데이트되었어요';

  @override
  String get botPictureRemoved => '사진이 삭제되었어요';

  @override
  String get botPictureFailed => '사진을 저장하지 못했어요';

  @override
  String botPictureDrop(String name) {
    return '놓아서 $name의 사진으로 사용';
  }

  @override
  String botPictureUseAs(String name) {
    return '$name의 사진으로 사용';
  }

  @override
  String get botPictureUseAsBot => '봇 사진으로 사용';

  @override
  String get botPictureWhichBot => '어떤 봇에 이 사진을 사용할까요?';

  @override
  String botDrawTitle(String name) {
    return '$name의 사진';
  }

  @override
  String get botDrawIntro =>
      '스타일을 고르고 원하시면 간단한 설명을 추가하세요. Casama가 선택할 수 있는 두 장의 그림을 그려 드려요.';

  @override
  String get botDrawDescribe => '설명 (선택)';

  @override
  String get botDrawHint => '안경을 쓴 다정한 부엉이';

  @override
  String get botDrawMake => '2장 만들기';

  @override
  String get botDrawMore => '2장 더 만들기';

  @override
  String get botDrawPick => '하나를 탭해서 사용하세요';

  @override
  String get botDrawCost => '각 사진은 Casama가 생성하는 다른 이미지와 마찬가지로 이미지 크레딧을 사용해요.';

  @override
  String get botDrawWorking => '그리는 중…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '소프트 3D';

  @override
  String get botDrawStyleWatercolor => '수채화';

  @override
  String get botDrawStyleFlat => '플랫 아이콘';

  @override
  String get botDrawStylePixel => '픽셀 아트';

  @override
  String get botDrawStyleLine => '라인 아트';

  @override
  String get botDrawStylePhoto => '사진';

  @override
  String get sharePictureStays =>
      '기존 사진은 이 워크스페이스에 그대로 남고, 복제본에는 이전 마스코트나 이니셜이 적용돼요.';

  @override
  String savedResetRefills(String amount) {
    return '크레딧 $amount 충전';
  }

  @override
  String get savedResetClearsDaily => '오늘의 한도 비우기';

  @override
  String get savedResetGivesHours => '컴퓨터 사용 시간 복구';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 남음',
      one: '1일 남음',
      zero: '오늘 만료',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => '모델';

  @override
  String get modelsRowHelp => 'Casama 모델 또는 내 API 키';

  @override
  String get modelsIntro =>
      'Casama가 봇을 실행할지, 아니면 내 모델 API 키를 연결할지 선택하세요. 키는 암호화되어 저장되며 다시 표시되지 않아요.';

  @override
  String get whoRunsYourBots => '봇 실행 주체';

  @override
  String adminModelAccessPlan(String plan) {
    return '$plan plan (monthly, yearly and weekly)';
  }

  @override
  String get adminModelAccessFollowDefault => 'Follow default';

  @override
  String get whoRunsCasama => 'Casama';

  @override
  String get whoRunsCasamaHelp => '플랜에 포함됨 · 워크스페이스 크레딧 사용';

  @override
  String get whoRunsCasamaOffHelp => '현재 플랜에서는 일시 중지됨';

  @override
  String get whoRunsOwn => '내 API 제공업체';

  @override
  String get whoRunsOwnHelp => '제공업체에서 직접 청구 · Casama 크레딧 미사용';

  @override
  String get whoRunsCasamaShort => '플랜에 포함된 Casama 모델';

  @override
  String get whoRunsCasamaCost => '크레딧 사용';

  @override
  String get whoRunsOwnShort => '내 API 키 · 제공업체에서 직접 청구';

  @override
  String get whoRunsOwnCost => 'Casama 크레딧 미사용';

  @override
  String get whoRunsOwnNeedsKey =>
      '내 API 제공업체를 사용하려면 먼저 아래 ‘키 추가’에서 채팅 키를 추가해 주세요.';

  @override
  String get whoRunsOwnNeedsModel => '전환하려면 아래에서 이 키의 모델을 선택하세요.';

  @override
  String get whoRunsAdminOnly => '워크스페이스 관리자만 봇 실행 주체를 변경할 수 있어요.';

  @override
  String get botModelSource => '모델 출처';

  @override
  String get botModelSourceWorkspace => '워크스페이스 기본값';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => '내 API 키 중 하나';

  @override
  String get useCasamaFallback => '내 제공업체가 실패하면 Casama 모델 사용';

  @override
  String get useCasamaFallbackHelp =>
      '내 API 키가 요청 제한이나 할당량에 도달하면 워크스페이스 크레딧을 사용해 Casama 모델로 전환해요.';

  @override
  String get keyCoversOpenRouter => '채팅, 이미지, 동영상, 소리 내어 읽기, 음성 메시지 및 받아쓰기';

  @override
  String get keyCoversGoogle => '채팅 및 실시간 통화';

  @override
  String get keyCoversOpenAi => '채팅 및 기억 검색';

  @override
  String get keyCoversChat => '채팅';

  @override
  String get ownProviderPrivacyNote =>
      '직접 연결한 제공업체를 사용하면 봇이 전송하는 내용에 해당 제공업체의 약관이 적용돼요. Casama의 학습 제외 설정은 Casama 키에만 적용돼요.';

  @override
  String get creditsOwnProviderNote => '직접 연결한 제공업체의 모델은 크레딧을 사용하지 않아요.';

  @override
  String get routineWaitingForModel => '모델 대기 중';

  @override
  String get ownProviderRequiredTitle => '대화를 계속하려면 모델을 연결하세요';

  @override
  String get ownProviderRequiredBody =>
      '현재 이 플랜에서는 Casama 모델을 사용할 수 없어요. 내 모델 키를 추가하거나 플랜을 업그레이드해 주세요.';

  @override
  String get modelNoToolsWarning => '이 모델은 도구를 지원하지 않아 봇이 텍스트로만 답할 수 있어요.';

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
  String get appBrowserTitle => '이 휴대폰의 브라우저';

  @override
  String get appBrowserTitleMac => '이 Mac의 브라우저';

  @override
  String get appBrowserTitleLinux => '이 컴퓨터의 브라우저';

  @override
  String get appBrowserTitleWindows => '이 PC의 브라우저';

  @override
  String get appBrowserHelp =>
      '이 휴대폰에서 대화를 열어 둔 동안, 허용한 봇이 사용자가 보는 앞에서 사용할 수 있는 Casama 내 작은 브라우저예요. 로그인 정보는 이 휴대폰에만 남아요.';

  @override
  String get appBrowserHelpMac =>
      '이 Mac에서 Casama가 열려 있는 동안, 허용한 봇이 사용자가 보는 앞에서 사용할 수 있는 Casama 내 작은 브라우저예요. 로그인 정보는 이 Mac에만 남아요.';

  @override
  String get appBrowserHelpLinux =>
      '이 컴퓨터에서 Casama가 열려 있는 동안, 허용한 봇이 사용자가 보는 앞에서 사용할 수 있는 Casama 내 작은 브라우저예요. 로그인 정보는 이 컴퓨터에만 남아요.';

  @override
  String get appBrowserHelpWindows =>
      '이 PC에서 Casama가 열려 있는 동안, 허용한 봇이 사용자가 보는 앞에서 사용할 수 있는 Casama 내 작은 브라우저예요. 로그인 정보는 이 PC에만 남아요.';

  @override
  String get appBrowserSwitchHelp =>
      '이 휴대폰에서 대화를 열어 두는 동안 허용한 봇이 여기서 페이지를 열 수 있어요.';

  @override
  String get appBrowserSwitchHelpMac =>
      '이 Mac에서 Casama가 열려 있는 동안 허용한 봇이 여기서 페이지를 열 수 있어요.';

  @override
  String get appBrowserSwitchHelpLinux =>
      '이 컴퓨터에서 Casama가 열려 있는 동안 허용한 봇이 여기서 페이지를 열 수 있어요.';

  @override
  String get appBrowserSwitchHelpWindows =>
      '이 PC에서 Casama가 열려 있는 동안 허용한 봇이 여기서 페이지를 열 수 있어요.';

  @override
  String get appBrowserOn => '켜짐';

  @override
  String get appBrowserOff => '꺼짐';

  @override
  String appBrowserSwitchedOff(String reason) {
    return '꺼짐: $reason';
  }

  @override
  String get appBrowserReasonOff => '아직 사용할 수 없어요.';

  @override
  String get appBrowserReasonNotTester => '현재 테스터에게만 제공돼요.';

  @override
  String get appBrowserReasonSystemOff => '아직 이 기기에서 사용할 수 없어요.';

  @override
  String get appBrowserReasonWorkspaceOff => '관리자가 이 워크스페이스에서 껐어요.';

  @override
  String get appBrowserReasonUnavailable => '이 서버에 기기 연결 기능이 없어요.';

  @override
  String get appBrowserReasonUnsupported => '이 기기의 브라우저에서 실행할 수 없어요.';

  @override
  String get appBrowserReasonNeedsMacos14 => 'macOS 14 이상이 필요해요.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return '여기에서 브라우저를 사용하려면 WebKitGTK를 설치하세요: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      '여기에서 브라우저를 사용하려면 Microsoft Edge WebView2를 설치하거나 업데이트하세요.';

  @override
  String get appBrowserGetWebview2 => 'WebView2 받기';

  @override
  String get appBrowserReasonNoToken =>
      '이전 설치에서 연결되었어요. 이 기기를 다시 연결하려면 껐다가 켜 주세요.';

  @override
  String get appBrowserAllBots => '모든 봇';

  @override
  String get appBrowserAllBotsHelp =>
      '대화할 수 있는 모든 봇이 이 브라우저를 사용할 수 있어요. 개별 봇을 선택하려면 끄세요.';

  @override
  String get appBrowserModeHeader => '봇이 브라우저를 필요로 할 때';

  @override
  String get appBrowserModeAsk => '도움이 될 때 물어보기';

  @override
  String get appBrowserModeAskHelp =>
      '사이트에 내 로그인이 필요하거나 봇의 컴퓨터를 차단할 때 선택할 수 있게 해요.';

  @override
  String get appBrowserModeComputer => '항상 봇의 컴퓨터 사용';

  @override
  String get appBrowserModeComputerHelp =>
      '채팅에서 직접 요청하지 않는 한 이 기기의 브라우저를 제안하지 않아요.';

  @override
  String get appBrowserModeDevice => '이 기기 우선 사용';

  @override
  String get appBrowserModeDeviceHelp =>
      '로그인이 필요하거나 차단된 사이트에서 묻지 않고 이 기기의 브라우저를 사용해요.';

  @override
  String get appBrowserNeverAsk => '봇의 컴퓨터 (묻지 않음)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Linux 컴퓨터';

  @override
  String get appBrowserDeviceWindows => 'Windows PC';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting => '기다리고 있어요. 브라우저에서 계속하려면 이 대화를 열어 두세요.';

  @override
  String browserWaitingSite(String site) {
    return '기다리고 있어요. 브라우저에서 $site 작업을 계속하려면 이 대화를 열어 두세요.';
  }

  @override
  String get browserWaitEnded => '브라우저 대기를 중단했어요.';

  @override
  String get browserHandBackWaiting =>
      '브라우저에서 직접 진행할 차례예요. 페이지에서 해당 단계를 마친 뒤 ‘봇에게 돌려주기’를 탭하세요.';

  @override
  String browserHandBackWaitingSite(String site) {
    return '$site에서 직접 진행할 차례예요. 페이지에서 해당 단계를 마친 뒤 ‘봇에게 돌려주기’를 탭하세요.';
  }

  @override
  String get browserHandBackEnded => '브라우저를 돌려주길 기다리는 것을 중단했어요.';

  @override
  String get browserChoiceCardLabel => '브라우저 선택';

  @override
  String browserChoiceTitle(String bot, String site) {
    return '$bot 봇이 $site 주소를 어디서 열까요?';
  }

  @override
  String get browserChoiceSubtitleSignIn => '이 사이트는 내 로그인이 필요해요.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return '이 사이트가 $bot 봇의 컴퓨터 접근을 차단했어요.';
  }

  @override
  String get browserChoiceOnPhone => '이 휴대폰에서';

  @override
  String get browserChoiceOnMac => '이 Mac에서';

  @override
  String get browserChoiceOnLinux => '이 컴퓨터에서';

  @override
  String get browserChoiceOnWindows => '이 PC에서';

  @override
  String get browserChoiceOnDeviceHelp =>
      '화면을 보면서 직접 로그인할 수 있어요. 봇이 읽는 내용은 AI에게 전달돼요.';

  @override
  String get browserChoiceInChrome => '내 Chrome에서';

  @override
  String get browserChoiceInChromeHelp => '이미 사이트에 로그인되어 있어요.';

  @override
  String browserChoiceOnComputer(String bot) {
    return '$bot 봇의 컴퓨터에서';
  }

  @override
  String get browserChoiceOnComputerHelp => '화면을 나가도 계속 작업해요.';

  @override
  String browserChoiceRemember(String site) {
    return '$site 설정 기억하기';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return '이 휴대폰에서 $site 열림';
  }

  @override
  String browserChoicePickedMac(String site) {
    return '이 Mac에서 $site 열림';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return '이 컴퓨터에서 $site 열림';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return '이 PC에서 $site 열림';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '내 Chrome에서 $site 열림';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$bot 봇의 컴퓨터에서 $site 열림';
  }

  @override
  String browserChoiceExpired(String bot) {
    return '시간 내에 응답하지 않아 $bot 봇의 컴퓨터에 머물렀어요';
  }

  @override
  String get appBrowserConsentTitle => '봇이 Casama 앱 안의 브라우저를 사용하도록 허용할까요?';

  @override
  String get appBrowserConsentPages =>
      '봇이 여기서 읽는 페이지는 자체 컴퓨터에서 읽을 때와 마찬가지로 Casama와 봇의 AI 모델로 전송돼요.';

  @override
  String get appBrowserConsentSignIns =>
      '로그인 정보는 이 기기에만 남아요. 비밀번호, 카드 번호, 인증 코드는 내가 직접 입력하며 봇은 절대 볼 수 없어요.';

  @override
  String get appBrowserConsentWatch =>
      '여기서 봇과의 대화를 열어 둔 동안에만 작동해요. 언제든 지켜보거나, 직접 조작하거나, 중지할 수 있어요.';

  @override
  String get appBrowserConsentYours => '내가 직접 둘러보는 내용은 어디에도 전송되지 않아요.';

  @override
  String get appBrowserBots => '사용 가능한 봇';

  @override
  String get appBrowserBotsHelp => '여기에서 켠 봇만 이 기기의 브라우저를 사용할 수 있어요.';

  @override
  String get appBrowserNoBots => '아직 봇이 없어요.';

  @override
  String get appBrowserSites => '사이트';

  @override
  String get appBrowserSitesHelp =>
      '‘항상’ 또는 ‘허용 안 함’으로 답한 사이트예요. 다음에 다시 물어보게 하려면 삭제하세요.';

  @override
  String get appBrowserNoSites => '아직 사이트가 없어요. 봇이 사이트를 처음 열 때 물어봐요.';

  @override
  String appBrowserRemoveSite(String site) {
    return '$site 삭제';
  }

  @override
  String get appBrowserKinds => '항상 꺼 두는 사이트';

  @override
  String get appBrowserKindsHelp =>
      '이 유형의 사이트는 직접 켜기 전까지 꺼져 있어요. 켜 두더라도 봇이 매번 먼저 물어봐요.';

  @override
  String get appBrowserKindBanking => '금융 및 결제';

  @override
  String get appBrowserKindHealth => '건강';

  @override
  String get appBrowserKindPasswords => '비밀번호 관리자';

  @override
  String get appBrowserKindGovernment => '정부 및 신분증';

  @override
  String get appBrowserSignIn => '사이트에 로그인';

  @override
  String get appBrowserSignInHelp =>
      '사이트를 열어 직접 로그인한 뒤 봇이 사용하게 해 주세요. 로그인 과정은 어디에도 전송되지 않아요.';

  @override
  String get appBrowserClearData => '인터넷 사용 기록 삭제';

  @override
  String get appBrowserClearDataHelp =>
      '이 브라우저에서 모든 사이트를 로그아웃하고 사이트가 저장한 데이터를 지워요.';

  @override
  String get appBrowserClearDataConfirm => '이 브라우저의 로그인 정보와 사이트 데이터를 삭제할까요?';

  @override
  String get appBrowserClearDataDone => '브라우저 데이터를 삭제했어요';

  @override
  String get appBrowserUnpair => '이 기기 연결 해제';

  @override
  String get appBrowserUnpairConfirm =>
      '이 기기의 브라우저 연결을 해제할까요? 다시 켤 때까지 봇이 사용할 수 없어요.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot 봇 작업 중';
  }

  @override
  String get appBrowserTakeOver => '직접 조작하기';

  @override
  String get appBrowserHandBack => '봇에게 돌려주기';

  @override
  String get appBrowserYourTurn => '내 차례';

  @override
  String appBrowserPaused(String bot) {
    return '페이지를 사용하는 동안 $bot 봇이 일시 중지되었어요';
  }

  @override
  String get appBrowserAway => '일시 중지됨: 채팅이 열려 있지 않음';

  @override
  String get appBrowserAddress => '사이트 주소';

  @override
  String get appBrowserBack => '뒤로';

  @override
  String get appBrowserForward => '앞으로';

  @override
  String get appBrowserReload => '새로고침';

  @override
  String get appBrowserAllowSite => '봇이 이 사이트를 사용하도록 허용';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site 추가됨. 이제 봇이 여기서 사용할 수 있어요.';
  }

  @override
  String get appBrowserAddressRefused => '이 주소는 여기서 열 수 없어요.';

  @override
  String get appBrowserSecure => '보안 연결';

  @override
  String get appBrowserNotSecure => '안전하지 않음';

  @override
  String get appBrowserCardLabel => '앱 내 브라우저';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot 봇이 $site 주소를 열려고 해요';
  }

  @override
  String get appBrowserSiteAskHelp =>
      '이 기기의 Casama에서 내 로그인 정보로 열어요. ‘항상’을 누르면 앞으로 이 사이트를 바로 열 수 있어요.';

  @override
  String get appBrowserSiteAskHelpMac =>
      '이 Mac에서 내 로그인 정보로 열어요. ‘항상’을 누르면 앞으로 이 사이트를 바로 열 수 있어요.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      '이 컴퓨터에서 내 로그인 정보로 열어요. ‘항상’을 누르면 앞으로 이 사이트를 바로 열 수 있어요.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      '이 PC에서 내 로그인 정보로 열어요. ‘항상’을 누르면 앞으로 이 사이트를 바로 열 수 있어요.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': '금융 및 결제 사이트는 매번 확인을 요청해요.',
      'health': '건강 사이트는 매번 확인을 요청해요.',
      'passwords': '비밀번호 관리자 사이트는 매번 확인을 요청해요.',
      'government': '정부·신분증 사이트는 매번 확인을 요청해요.',
      'other': '해당 사이트는 매번 확인을 요청해요.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => '이번만';

  @override
  String get appBrowserAlways => '항상';

  @override
  String get appBrowserNever => '허용 안 함';

  @override
  String appBrowserStepAskTitle(String bot) {
    return '$bot 봇에게 이 작업을 허용할까요?';
  }

  @override
  String get appBrowserStepAskHelp => '이 기기의 Casama에서 내 로그인 정보로 실행해요.';

  @override
  String get appBrowserStepAskHelpMac => '이 Mac에서 내 로그인 정보로 실행해요.';

  @override
  String get appBrowserStepAskHelpLinux => '이 컴퓨터에서 내 로그인 정보로 실행해요.';

  @override
  String get appBrowserStepAskHelpWindows => '이 PC에서 내 로그인 정보로 실행해요.';

  @override
  String appBrowserStepClick(String name) {
    return '“$name” 탭하기';
  }

  @override
  String appBrowserStepType(String name) {
    return '“$name”에 입력하기';
  }

  @override
  String appBrowserStepPress(String name) {
    return '“$name”에서 키 누르기';
  }

  @override
  String appBrowserStepUpload(String name) {
    return '“$name”에 파일 업로드하기';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => '허용 안 함';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Android 휴대폰';

  @override
  String get toolOnThisPhone => '이 기기에서';

  @override
  String get appBrowserWorkspaceSwitch => '멤버의 앱 내 브라우저에서 봇 사용';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      '멤버가 지켜보는 동안 봇이 휴대폰이나 컴퓨터의 Casama 내 브라우저를 사용할 수 있게 해요.';

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
  String get vendorRenewalUsd => '갱신 비용 (USD)';

  @override
  String get vendorRenewalMonths => '갱신 적용 기간(개월)';

  @override
  String get vendorSeeSpend => '지출 보기';

  @override
  String get costSpent => '지출';

  @override
  String get costCharged => '청구액';

  @override
  String get costMargin => '마진';

  @override
  String get costMarginNone => '청구된 금액 없음';

  @override
  String get costNotRecorded => '미기록';

  @override
  String get costNotRecordedHint => '이게 무엇을 의미하고 어떤 서비스와 관련 있는지 표시해요';

  @override
  String get costNotRecordedHelp =>
      '일부 서비스는 자체 총액을 보고해요. 보고된 금액이 이 서버에 기록된 금액보다 크면 그 차이가 여기에 표시돼요. 아직 특정 기능, 키, 워크스페이스와 연결되지 않은 실제 지출이에요.';

  @override
  String get costNotRecordedWhy => '기록보다 서비스가 더 많이 보고한 금액';

  @override
  String get costNotRecordedNone => '서비스 보고 금액과 일치함';

  @override
  String get costNotRecordedAllMatch => '총액을 보고하는 모든 서비스가 이 서버의 기록과 일치해요.';

  @override
  String get costNotRecordedNoList => '지금 서비스 목록을 불러올 수 없어요. 잠시 후 다시 시도해 주세요.';

  @override
  String get costNoVendorFigures => '총액을 보고한 서비스가 없어요';

  @override
  String get costNoVendorFiguresHelp => '이 기간에 자체 총액을 보고한 서비스가 없어 비교할 내용이 없어요.';

  @override
  String costNoFigureFrom(String names) {
    return '총액 보고 없음: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '서비스 $count개',
      one: '서비스 1개',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return '서비스 보고 $theirs · 서버 기록 $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return '서비스 보고 $theirs · 서버 기록 $ours · 미기록 $gap';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return '서비스 보고 $theirs · 서버 기록 $ours · 누락 없음';
  }

  @override
  String get costNoVendorFigure => '이 서비스는 이 기간의 자체 총액을 제공하지 않았어요.';

  @override
  String get costNoVendorFigureKind => '이 서비스는 자체 총액을 보고하지 않아요.';

  @override
  String costUpdated(String when) {
    return '$when 업데이트됨';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '이전 $days일 대비',
      one: '전일 대비',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => '비교할 이전 기간이 없어요';

  @override
  String get costChangeNew => '신규';

  @override
  String get costChangeNewSpoken => '이 기간에 새로 추가됨';

  @override
  String get costChangeFlat => '변동 없음';

  @override
  String costChangeUp(String amount) {
    return '$amount 증가';
  }

  @override
  String costChangeDown(String amount) {
    return '$amount 감소';
  }

  @override
  String costPoints(String count) {
    return '$count%p';
  }

  @override
  String get costOther => '기타';

  @override
  String get costNotLabelled => '분류되지 않음';

  @override
  String get costNotLabelledHelp =>
      '이 기준에 대한 분류 없이 기록된 비용이라 더 이상 나눌 수 없어요. 여전히 전체 합계에는 포함돼요.';

  @override
  String get costGroupService => '서비스';

  @override
  String get costGroupKey => '키';

  @override
  String get costGroupApp => '앱 및 MCP';

  @override
  String get costGroupFeature => '기능';

  @override
  String get costGroupModel => '모델';

  @override
  String get costGroupWorkspace => '워크스페이스';

  @override
  String get costGroupBy => '분류 기준';

  @override
  String get costFilters => '필터';

  @override
  String get costNoFilters => '없음. 행을 열고 ‘표에서 보기’를 선택해 범위를 좁혀 보세요.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return '$name 필터 삭제';
  }

  @override
  String get costIncludeFixed => '고정 비용 포함';

  @override
  String get costIncludeFixedHelp => '구독 및 갱신 비용을 적용 일수에 걸쳐 고르게 나누어 지출에 포함해요.';

  @override
  String get costOptions => '기간 및 필터';

  @override
  String get costPeriod => '기간';

  @override
  String costPeriodDays(int days) {
    return '$days일';
  }

  @override
  String get costPeriodCustom => '직접 설정';

  @override
  String costLastDays(int days) {
    return '최근 $days일';
  }

  @override
  String get costChangeDates => '날짜 변경';

  @override
  String get costDone => '완료';

  @override
  String get costDaysUtc => '날짜 기준은 UTC예요.';

  @override
  String get costDailySpend => '일별 지출';

  @override
  String costStackedBy(String group) {
    return '$group 기준 누적: 상위 항목과 기타로 나뉘어요.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return '일별 지출 차트, $days일간, 총 $total. 지출이 가장 많았던 날: $peakDay, $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return '일별 지출 차트, $days일간, 지출 없음.';
  }

  @override
  String get costSourceMetered => '사용량 기반';

  @override
  String get costSourceCounted => '자체 집계';

  @override
  String get costSourceFixed => '고정 금액';

  @override
  String get costSourceEstimated => '추정치';

  @override
  String get costSourceMeteredHelp => '각 호출마다 기록된 실제 비용이에요.';

  @override
  String get costSourceCountedHelp => '이 서버의 자체 집계 수량에 단가를 곱한 값이에요.';

  @override
  String get costSourceFixedHelp => '청구액을 적용 기간 일수로 고르게 나눈 비용이에요.';

  @override
  String get costSourceEstimatedHelp =>
      '텍스트 길이를 바탕으로 계산했어요. 실제 비용은 최소 이 이상이에요.';

  @override
  String get costEstimated => '추정';

  @override
  String get costColShare => '비중';

  @override
  String get costColChange => '변동';

  @override
  String get costColCalls => '호출';

  @override
  String get costColSource => '출처';

  @override
  String get costColFailed => '실패';

  @override
  String get costColFees => '제공업체 요금';

  @override
  String get costColTokens => '토큰 비용';

  @override
  String get costTokenCost => '토큰 비용';

  @override
  String get costFailureRate => '실패율';

  @override
  String costSortBy(String column) {
    return '$column 기준 정렬';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, 낮은 순으로 정렬됨';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, 높은 순으로 정렬됨';
  }

  @override
  String get costOpenRowHint => '세부 정보 열기';

  @override
  String costSpokenSpent(String amount) {
    return '지출 $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return '제공업체 요금 $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '전체의 $share';
  }

  @override
  String costSpokenCalls(String count) {
    return '호출 $count회';
  }

  @override
  String costSpokenFailed(String rate) {
    return '실패 $rate';
  }

  @override
  String costSpokenTokens(String amount) {
    return '예상 토큰 비용 $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return '청구 $amount';
  }

  @override
  String costCallsCount(String count) {
    return '호출 $count회';
  }

  @override
  String costFailedShare(String rate) {
    return '실패 $rate';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount 토큰, 추정치';
  }

  @override
  String get costOpenBilling => '결제 페이지 열기';

  @override
  String get costByDay => '일별';

  @override
  String get costSplitBy => '분류 기준';

  @override
  String get costShowInTable => '표에서 보기';

  @override
  String costShowInTableHelp(String name, String group) {
    return '표를 $name 항목으로 좁히고 $group 기준으로 묶어 봐요.';
  }

  @override
  String get costNothingRecorded => '이 기간에 기록된 내역이 없어요.';

  @override
  String costLastUsed(String when) {
    return '마지막 사용: $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '외 $count개 더. 표에서 확인하세요.',
      one: '외 1개 더. 표에서 확인하세요.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => '용도';

  @override
  String get costKeyService => '서비스';

  @override
  String get costKeySetting => '설정';

  @override
  String get costKeySetIn => '설정 위치';

  @override
  String get costKeyVault => 'Vault 항목';

  @override
  String get costKeyStatus => '상태';

  @override
  String get costKeyConfigured => '설정됨';

  @override
  String get costKeyNotConfigured => '미설정';

  @override
  String get costKeyLastUsed => '마지막 사용';

  @override
  String get costKeyNotUsed => '이 기간에 사용 안 함';

  @override
  String get costKeyCap => '지출 상한';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '상한 $cap 중 $left 남음';
  }

  @override
  String costKeyCapUsed(String share) {
    return '상한의 $share 사용';
  }

  @override
  String get costKeyNoCap => '없음';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '이 $days일간 지출이 없었어요',
      one: '이날 지출이 없었어요',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => '이 기간에 지출이 없었어요';

  @override
  String get costEmptyFiltered => '이 필터와 일치하는 지출이 없어요';

  @override
  String get costEmptyGroup => '이 분류에 표시할 항목이 없어요';

  @override
  String get costAppsNote =>
      '앱 및 MCP 서버: 지출은 제공업체가 청구한 금액이에요. 토큰 비용은 해당 결과가 모델 토큰으로 얼마인지 추정한 값이며 이미 모델 지출에 포함되어 있어요.';

  @override
  String costFixedLeftOut(String amount) {
    return '이 기간의 고정 비용($amount)은 제외되었어요. 포함하려면 ‘고정 비용 포함’을 켜 주세요.';
  }

  @override
  String costOwnKeys(String amount) {
    return '워크스페이스들이 자체 API 키로 결제한 금액($amount)은 이 서버의 비용이 아니므로 제외되었어요.';
  }

  @override
  String get costOlderServerTitle => '이 서버의 업데이트가 필요해요';

  @override
  String get costOlderServer =>
      '서비스, 키, 앱별 비용은 최신 서버 버전에서 제공돼요. 서버를 업데이트한 뒤 다시 확인해 주세요.';

  @override
  String get costCheckAgain => '다시 확인';

  @override
  String get costSpendCardTitle => '지출, 최근 30일';

  @override
  String get costSpendCardOpen => '비용';

  @override
  String get costSpendCardHint => '비용 탭 열기';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return '최근 30일 지출: $spent 지출, $charged 청구, $margin 마진';
  }

  @override
  String get costSort => '정렬';

  @override
  String get costSortName => '이름';

  @override
  String get costByWorkspace => '워크스페이스별';

  @override
  String get costTopTools => '주요 도구';

  @override
  String get costToolList => '모델에 전송된 도구 목록';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '외 도구 $count개.',
      one: '외 도구 1개.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Casama의 Telegram 봇 사용';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Telegram에서 $bot 봇과 대화하세요. 탭 한 번이면 별도 설정 없이 바로 쓸 수 있어요.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Telegram이 다른 워크스페이스에 연결되어 있어요. 여기서 연결하면 이쪽으로 옮겨져요.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return '거기서 보낸 메시지는 $bot 봇에게 전달돼요.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return '거기서 보낸 메시지는 지금 $other에게 전달되고 있어요. 탭하면 $bot 봇에게 보내도록 바꿀 수 있어요.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return '이제 Telegram 메시지가 $bot 봇에게 전달돼요.';
  }

  @override
  String get telegramFinish => 'Telegram에서 완료하기';

  @override
  String get telegramFinishHelp =>
      'Telegram에서 ‘시작’을 누르세요. 본인 Telegram 계정으로만 진행해 주세요. 연결되면 이 화면이 자동으로 업데이트돼요.';

  @override
  String get telegramOpenAgain => 'Telegram 다시 열기';

  @override
  String get telegramConnected => 'Telegram이 연결되었어요';

  @override
  String telegramConnectedHelp(String name) {
    return '$name 계정으로 연결되었어요. 언제든 Telegram에서 봇에게 메시지를 보내세요. 대화 내용은 여기 ‘일반’에서도 볼 수 있어요.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      '언제든 Telegram에서 봇에게 메시지를 보내세요. 대화 내용은 여기 ‘일반’에서도 볼 수 있어요.';

  @override
  String get telegramConnect => 'Telegram 연결';

  @override
  String get telegramDisconnect => 'Telegram 연결 해제';

  @override
  String get telegramDisconnectConfirm => 'Telegram 연결을 해제할까요?';

  @override
  String get telegramDisconnectHelp =>
      '봇이 더 이상 Telegram에서 답하지 않아요. 대화 기록은 여기에 그대로 남아요.';

  @override
  String get telegramPickBot => 'Telegram 메시지 수신 봇';

  @override
  String get telegramNeedsBot => '먼저 봇을 만든 뒤 Telegram을 연결하세요.';

  @override
  String get telegramNotOffered =>
      '이 서버에는 기본 Telegram 봇이 없어요. 봇의 ‘채팅 앱’ 설정에서 직접 봇을 연결할 수 있어요.';

  @override
  String get chatAppsSettingsHelp =>
      '이미 쓰고 있는 채팅 앱에서 봇과 대화하세요. 메시지는 ‘일반’ 채팅에도 모여 여기에서 바로 이어갈 수 있어요.';

  @override
  String get chatAppsPerBot => '이메일과 개인 봇은 봇별로 설정해요. 봇을 열고 ‘채팅 앱’으로 들어가세요.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack 등';

  @override
  String get chatAppsSlackHelp =>
      'Slack은 봇 하나당 Slack 워크스페이스별로 추가해요. 봇을 고른 뒤 ‘Slack에 추가’를 누르세요.';

  @override
  String get chatAppsSlackPickBot => 'Slack을 추가할 봇';

  @override
  String get slackAnyoneInWorkspace => '이 Slack 워크스페이스의 누구나';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      '목록에 있는 사람뿐 아니라 워크스페이스의 누구나 봇과 대화할 수 있어요. 승인 요청은 여전히 목록에 있는 사람의 확인이 필요해요.';

  @override
  String get discordUseCasama => 'Casama의 Discord 봇 사용';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Discord에서 $bot 봇과 대화하세요. Discord로 한 번 로그인하면 어디서나 봇에게 메시지를 보내거나 /ask 명령을 쓸 수 있어요.';
  }

  @override
  String get discordOtherWorkspace =>
      'Discord가 다른 워크스페이스에 연결되어 있어요. 여기서 연결하면 이쪽으로 옮겨져요.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return '이제 Discord 메시지가 $bot 봇에게 전달돼요.';
  }

  @override
  String get discordFinish => 'Discord에서 완료하기';

  @override
  String get discordFinishHelp =>
      '브라우저에서 Discord에 로그인하고 Casama를 허용하세요. 본인 Discord 계정으로만 진행해 주세요. 연결되면 이 화면이 자동으로 업데이트돼요.';

  @override
  String get discordOpenAgain => 'Discord 로그인 다시 열기';

  @override
  String get discordConnected => 'Discord가 연결되었어요';

  @override
  String discordConnectedHelp(String name) {
    return '$name 계정으로 연결되었어요. Discord에서 Casama 봇에게 메시지를 보내거나 어디서나 /ask를 사용해 보세요. 대화 내용은 여기 ‘일반’에서도 볼 수 있어요.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Discord에서 Casama 봇에게 메시지를 보내거나 어디서나 /ask를 사용해 보세요. 대화 내용은 여기 ‘일반’에서도 볼 수 있어요.';

  @override
  String get discordConnect => 'Discord 연결';

  @override
  String get discordDisconnect => 'Discord 연결 해제';

  @override
  String get discordDisconnectConfirm => 'Discord 연결을 해제할까요?';

  @override
  String get discordDisconnectHelp =>
      '봇이 더 이상 Discord에서 답하지 않아요. 대화 기록은 여기에 그대로 남아요.';

  @override
  String get discordPickBot => 'Discord 메시지 수신 봇';

  @override
  String get discordNeedsBot => '먼저 봇을 만든 뒤 Discord를 연결하세요.';

  @override
  String get discordNotOffered =>
      '이 서버에는 기본 Discord 앱이 없어요. 봇의 ‘채팅 앱’ 설정에서 직접 Discord 앱을 연결할 수 있어요.';

  @override
  String get inactiveAccountsNote =>
      'Casama 사용을 중단하면 30일 후 돌아오실 때까지 루틴과 지켜보기가 일시 중지돼요. 6개월 후에는 컴퓨터의 저장된 파일이 삭제되고, 12개월 후(결제한 적이 있으면 24개월)에는 계정이 삭제돼요. 무엇이든 삭제되기 전에 이메일로 미리 알려 드리며, 유료 플랜 계정은 영향을 받지 않아요.';

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
  String get inactivityModeOff => '꺼짐';

  @override
  String get inactivityModeReport => '보고';

  @override
  String get inactivityModeOn => '켜짐';

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
    return '$when 활동';
  }

  @override
  String get inactivityStateResting => '휴면 중';

  @override
  String get inactivityStateFilesSoon => '파일 곧 삭제됨';

  @override
  String get inactivityStateRemovalSoon => '계정 곧 삭제됨';

  @override
  String get inactivityStateRemoving => '삭제 중';

  @override
  String get inactivityKept => '유지됨';

  @override
  String get keepAccount => '이 계정 유지하기';

  @override
  String get keepAccountHelp => '미사용으로 휴면 전환되거나 삭제되지 않음';

  @override
  String get computerFilesRemoved => '저장된 파일 삭제됨';

  @override
  String computerFilesRemovedHelp(String date) {
    return '이 컴퓨터가 6개월 동안 사용되지 않아 $date에 저장된 파일이 삭제되었어요. 새로 시작돼요.';
  }

  @override
  String get downloadSavedFiles => '저장된 파일 다운로드';

  @override
  String get downloadSavedFilesHelp => '깨우지 않고 홈 폴더를 .tar.gz로 받기';

  @override
  String get liveActivity => '실시간 현황';

  @override
  String get liveRowHelp => '대기자 명단, 가입, 다운로드가 발생하는 즉시 표시해요';

  @override
  String get liveRefresh => '새로고침';

  @override
  String get liveTabActivity => '활동';

  @override
  String get liveTabAlerts => '알림';

  @override
  String get liveGroupAll => '전체';

  @override
  String get liveGroupWaitlist => '대기자 명단';

  @override
  String get liveGroupAccounts => '계정';

  @override
  String get liveGroupMoney => '결제·매출';

  @override
  String get liveGroupWebsite => '웹사이트';

  @override
  String get liveGroupGrowth => '성장';

  @override
  String get liveGroupSupport => '지원';

  @override
  String get liveKindWaitlistJoined => '대기자 명단 등록';

  @override
  String get liveKindWaitlistAdmitted => '대기자 명단에서 초대됨';

  @override
  String get liveKindSignup => '새 계정';

  @override
  String get liveKindSignupRefused => '가입 거절됨';

  @override
  String get liveKindFirstChat => '첫 대화';

  @override
  String get liveKindMilestone => '기타 첫 활동 (봇, 컴퓨터, 통화, 루틴)';

  @override
  String get liveKindSubscription => '신규 구독';

  @override
  String get liveKindSubscriptionEnded => '구독 종료';

  @override
  String get liveKindPurchase => '크레딧 구입';

  @override
  String get liveKindSupportTicket => '지원 티켓';

  @override
  String get liveKindFeedback => '피드백';

  @override
  String get liveKindAccountDeleted => '계정 삭제됨';

  @override
  String get liveKindDownloadClick => '다운로드 클릭';

  @override
  String get liveKindQrOpen => '다운로드 QR 코드 열림';

  @override
  String get liveKindStartClick => '무료 시작 클릭';

  @override
  String get liveKindInviteOpen => '초대 링크 열림';

  @override
  String get liveNow => '방금';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes분';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours시간';
  }

  @override
  String get liveTestSent => '기기로 테스트 알림을 보냈어요';

  @override
  String get liveTodayWaitlist => '오늘 대기 등록';

  @override
  String get liveTodaySignups => '오늘 가입';

  @override
  String get liveTodayDownloads => '오늘 다운로드';

  @override
  String get liveTodayMoney => '오늘 매출';

  @override
  String get liveRetry => '다시 시도';

  @override
  String get liveEmpty => '아직 내역이 없어요. 새 활동이 생기면 몇 초 안에 여기에 표시돼요.';

  @override
  String get liveOlder => '이전 항목 보기';

  @override
  String get liveAlertsHelp =>
      '휴대폰, Mac, 브라우저로 푸시 알림을 받을 항목을 선택하세요. 한꺼번에 많은 일이 일어나면 일일이 보내지 않고 하나의 요약으로 보내 드려요.';

  @override
  String get livePauseAll => '모든 알림 일시 중지';

  @override
  String get livePauseAllHelp => '활동 내역은 여기에 계속 표시돼요';

  @override
  String get liveSendTest => '테스트 알림 보내기';

  @override
  String get liveSendTestHelp => '이 기기에 알림이 도착하는지 확인해요';

  @override
  String get liveAlertsFooter =>
      '방해 금지 시간(설정 → 알림) 동안에는 알림이 대기했다가 끝난 뒤 하나의 요약으로 도착해요. 브라우저에서 받으려면 이 사이트의 알림을 허용해 주세요.';

  @override
  String get liveStatusOn => '실시간: 몇 초마다 자동 업데이트';

  @override
  String get liveStatusPaused => '실시간 · 알림 일시 중지됨';

  @override
  String get liveGroupApp => '앱';

  @override
  String get liveKindAppFirstOpen => '앱 첫 실행';

  @override
  String get liveKindAppReinstall => '앱 재설치';

  @override
  String get liveKindSigninStarted => '로그인 시작';

  @override
  String get liveKindTrialStarted => '무료 체험 시작';

  @override
  String get liveKindRenewal => '구독 갱신';

  @override
  String get liveKindRefund => '환불';

  @override
  String get liveKindDisputeOpened => '결제 이의제기 발생';

  @override
  String get liveKindPlanCancelFailed => '플랜 해지 안 됨';

  @override
  String get liveKindStoreReview => '스토어 리뷰';

  @override
  String get liveKindStoreCrashes => '스토어 비정상 종료 리포트';

  @override
  String get liveKindDay2Return => '2일 차 재방문';

  @override
  String get liveKindWeek1Return => '1주 차 재방문';

  @override
  String get liveKindDeviceGone => '앱 삭제 추정';

  @override
  String get liveKindPartnerInterest => '크리에이터 파트너 관심';

  @override
  String get liveKindCreatorOpen => '크리에이터 링크 열림';

  @override
  String get liveKindPartnerClaimed => '크리에이터 코드 사용됨';

  @override
  String get liveKindGiftOpen => '선물 링크 열림';

  @override
  String get liveKindCompRedeemed => '선물 플랜 사용됨';

  @override
  String get liveKindReferralRewarded => '초대 보상 달성';

  @override
  String get liveKindNewsletterConfirmed => '뉴스레터 구독';

  @override
  String get liveKindTestimonialSubmitted => '검토할 후기';

  @override
  String get liveDailyDigest => '아침 요약';

  @override
  String get liveDailyDigestHelp => '내 시간대 오전 9시에 보내는 어제의 퍼널과 다운로드 현황';

  @override
  String get liveFunnelClicks => '클릭';

  @override
  String get liveFunnelOpens => '첫 실행';

  @override
  String get liveFunnelSignups => '계정';

  @override
  String get liveFunnelChats => '첫 대화';

  @override
  String get liveFunnelPaying => '결제';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => '사용자별';

  @override
  String get liveSearch => '이메일, 국가, 유입 경로 검색';

  @override
  String get liveNoMatches => '검색과 일치하는 항목이 없어요';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count단계',
      one: '1단계',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => '추정';

  @override
  String get liveStepClick => '다운로드 클릭';

  @override
  String get liveStepOpen => '앱 열기';

  @override
  String get liveStepSignup => '계정 생성';

  @override
  String get liveStepChat => '첫 대화';

  @override
  String get liveStepPaying => '결제';

  @override
  String get liveJourneyTitle => '진행 내역';

  @override
  String get liveJourneyVisitor => '방문자';

  @override
  String get liveJourneyWho => '사용자';

  @override
  String get liveJourneyFrom => '유입 경로';

  @override
  String get liveJourneyDevice => '기기';

  @override
  String get liveJourneyTimeline => '타임라인';

  @override
  String get liveJourneyNow => '현재';

  @override
  String get liveJourneySource => '출처';

  @override
  String get liveJourneyCampaign => '캠페인';

  @override
  String get liveJourneyLanding => '첫 페이지';

  @override
  String get liveJourneyClickedFrom => '클릭 위치';

  @override
  String get liveJourneyPlatform => '플랫폼';

  @override
  String get liveJourneyStore => '유입처';

  @override
  String get liveJourneyVersion => '버전';

  @override
  String get liveJourneyCountry => '국가';

  @override
  String get liveJourneyLikelyHelp =>
      '링크가 아닌 기기, 국가, 시간대를 기준으로 웹사이트 클릭과 연결한 결과예요. 참고용 추정치로 봐 주세요.';

  @override
  String get liveJourneyPlan => '플랜';

  @override
  String get liveJourneyMessages => '보낸 메시지';

  @override
  String get liveJourneyBots => '봇';

  @override
  String get liveJourneyDevices => '로그인 기기';

  @override
  String get liveJourneyLastActive => '마지막 활동';

  @override
  String get liveJourneyJoined => '가입일';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap 후';
  }

  @override
  String get liveJourneyNone => '이 항목에 대해 아직 추가로 알려진 정보가 없어요.';

  @override
  String get liveJourneyCopyEmail => '이메일 복사';

  @override
  String get liveJourneyCopied => '이메일을 복사했어요';

  @override
  String get liveJourneyOpenAdmin => '관리자 화면에서 열기';

  @override
  String get liveJourneyGone => '30일이 지나 세부 정보가 삭제되었어요.';

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
  String get planChangeTitle => '플랜 변경 확인';

  @override
  String planChangeSwitchTo(String plan) {
    return '$plan 플랜으로 전환';
  }

  @override
  String get planChangeChargedNow => '지금 청구 금액';

  @override
  String planChangeTaxIncluded(String tax) {
    return '세금 $tax 포함';
  }

  @override
  String get planChangeCredit => '미사용 기간 차감액';

  @override
  String planChangeThen(String amount, String period) {
    return '이후 $amount / $period (세금 별도)';
  }

  @override
  String planChangeNextBilling(String date) {
    return '다음 결제일: $date';
  }

  @override
  String get planChangeConfirmAndPay => '확인 및 결제';

  @override
  String get planChangeHaveCode => '코드가 있나요?';

  @override
  String get planChangeCodeLabel => '할인 코드';

  @override
  String get planChangeCodeHint => '코드 입력';

  @override
  String get planChangeApply => '적용';

  @override
  String get planChangeRemove => '삭제';

  @override
  String get planChangeDiscountApplied => '할인이 적용되었어요';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '매 갱신 시 $percent% 할인';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count회 갱신 동안 $percent% 할인',
      one: '1회 갱신 동안 $percent% 할인',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '매 갱신 시 $amount 할인';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count회 갱신 동안 $amount 할인',
      one: '1회 갱신 동안 $amount 할인',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '플랜을 다시 바꾸기 전까지 매 갱신 시 $percent% 할인';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '플랜을 다시 바꾸기 전까지 매 갱신 시 $amount 할인';
  }

  @override
  String get planChangeInvalidCode => '이 플랜에서는 사용할 수 없는 코드예요.';

  @override
  String get planChangeCodeCostsMore => '이 코드를 적용하면 현재 할인이 대체되어 비용이 더 많이 들어요.';

  @override
  String get planChangeCodeEndsLasting => '이 코드를 적용하면 현재 적용된 장기 할인이 종료돼요.';

  @override
  String get planChangeCodeNotBetter => '이미 같거나 더 좋은 할인을 적용받고 있어요.';

  @override
  String planChangeReplacesPercent(String percent) {
    return '현재 $percent% 할인 대체';
  }

  @override
  String get planChangeReplacesDiscount => '현재 할인 대체';

  @override
  String get planChangePriceMoved =>
      '이 화면을 연 사이에 합계 금액이 변경되었어요. 바뀐 금액을 확인한 뒤 다시 진행해 주세요.';

  @override
  String get planChangePeriodWeek => '주';

  @override
  String get planChangePeriodMonth => '월';

  @override
  String get planChangePeriodYear => '년';

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
  String get partnerSection => 'Casama 파트너';

  @override
  String get partnerProgramTitle => '영상, 게시물 또는 뉴스레터를 만드시나요?';

  @override
  String get partnerProgramSubtitle => '초대한 사용자가 결제한 금액의 30%를 1년 동안 수익으로 받으세요';

  @override
  String get partnerYourCode => '내 크리에이터 코드';

  @override
  String get partnerPaused => '일시 중지됨';

  @override
  String get partnerPortal => '수익 및 정산';

  @override
  String partnerShareText(String link, String code) {
    return '나 대신 일해 주는 AI 팀원, Casama를 써 보세요. 가입할 때 내 코드 $code 입력: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name 님이 Casama를 추천했어요.';
  }

  @override
  String get partnerClaimed => '크리에이터 코드가 추가되었어요. Casama에 오신 것을 환영해요!';

  @override
  String partnerClaimedFrom(String name) {
    return '$name 님을 응원해 주셔서 감사해요. Casama에 오신 것을 환영해요!';
  }

  @override
  String get partnerErrNotFound => '존재하지 않는 크리에이터 코드예요. 확인 후 다시 시도해 주세요.';

  @override
  String get partnerErrOwnCode => '본인의 코드예요. 시청자나 구독자에게 공유해 보세요.';

  @override
  String get partnerErrWindowClosed => '크리에이터 코드는 가입 후 초기 며칠 이내에만 입력할 수 있어요.';

  @override
  String get partnerErrAlreadyPaying => '크리에이터 코드는 첫 결제 전 신규 계정에서만 사용할 수 있어요.';

  @override
  String get partnerErrAlready => '이미 다른 크리에이터 코드를 입력했어요.';

  @override
  String get partnerErrReferred => '친구의 초대로 가입했기 때문에 크리에이터 코드를 추가할 수 없어요.';

  @override
  String get partnerErrOff => '이 서버에서는 크리에이터 코드를 사용할 수 없어요.';

  @override
  String get referralHaveCodeAny => '코드가 있나요?';

  @override
  String get referralCodeHintAny => '친구 또는 크리에이터 코드';

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
  String get testimonialStateLive => '게시 중';

  @override
  String get testimonialStateDraft => '초안';

  @override
  String get testimonialStateHidden => '숨김';

  @override
  String get testimonialStateWithdrawn => '철회됨';

  @override
  String get testimonialPlaceSiteHome => 'casama.ai 홈';

  @override
  String get testimonialPlaceSitePricing => 'casama.ai 요금제';

  @override
  String get testimonialPlaceAppPaywall => '앱 플랜';

  @override
  String get testimonialPlaceAppSignin => '앱 로그인';

  @override
  String get testimonialSourceEmail => '이메일';

  @override
  String get testimonialSourceInApp => '앱 내';

  @override
  String get testimonialSourceOther => '기타';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '별 $count개',
      one: '별 1개',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Casama 사용자 후기';

  @override
  String get testimonialAskTitle => 'Casama가 마음에 드시나요?';

  @override
  String get testimonialAskSubtitle => '한 문장으로 들려주세요.';

  @override
  String get testimonialAskHint => '어떤 점이 좋으신가요?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama가 이 의견을 casama.ai와 앱에서 $name 이름으로 인용해도 좋아요';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama가 이 의견을 casama.ai와 앱에서 Casama 사용자로 인용해도 좋아요';

  @override
  String get testimonialAskSend => '보내기';

  @override
  String get testimonialAskNotNow => '나중에';

  @override
  String get testimonialAskThanks => '감사해요! 모든 후기를 꼼꼼히 읽고 있어요.';

  @override
  String get communityTitle => '커뮤니티';

  @override
  String get communitySentence =>
      'Casama는 오픈 소스예요. 도움이 되셨다면 GitHub에 별(Star)을 눌러 다른 사람들도 찾을 수 있게 해 주세요.';

  @override
  String get communityStarOnGitHub => 'GitHub에서 별 누르기';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp => '팀과 다른 Casama 사용자들과 이야기해 보세요';

  @override
  String get starAskTitle => 'GitHub의 Casama';

  @override
  String get starAskNotNow => '나중에';

  @override
  String get cloudSignInTitle => 'Casama 계정으로 로그인';

  @override
  String get cloudSignInBody =>
      '무료 개인용 라이선스는 Casama 계정에서 발급돼요. 라이선스만 이 서버로 전달되며 대화 내용은 서버에 그대로 남아요.';

  @override
  String get cloudSignInEmail => '이메일';

  @override
  String get cloudSignInSendCode => '코드 보내기';

  @override
  String get cloudSignInCode => '이메일로 받은 코드';

  @override
  String get cloudSignInVerify => '로그인';

  @override
  String cloudSignInCodeSent(String email) {
    return '$email 주소로 코드를 보냈어요. 여기에 입력하세요.';
  }

  @override
  String get licenseSetupTitle => '무료 개인용 라이선스 받기';

  @override
  String get licenseSetupBody =>
      '이 서버에서 봇을 실행하려면 라이선스가 필요해요. 개인 용도는 1인까지 무료이며, Casama 계정으로 로그인하면 30일마다 온라인으로 자동 갱신돼요.';

  @override
  String get licensePersonalButton => '무료 개인용 라이선스 받기';

  @override
  String get licensePersonalNote => '개인용: 1인, 개인 용도, 내 컴퓨터 또는 내 서버에서 사용.';

  @override
  String get licenseBusinessTitle => '또는 Business 키 입력';

  @override
  String get licenseBusinessHint => '라이선스 키 붙여넣기';

  @override
  String get licenseBusinessSave => '이 키 사용';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return '직장이나 팀에서 Casama를 사용하나요? Business는 활성 사용자 1인당 월 $monthlyPrice예요(연간 결제 시 월 $yearlyMonthlyPrice). $email 주소로 문의해 주세요.';
  }

  @override
  String get licenseActivated => '라이선스가 활성화되었어요. 이제 봇을 실행할 수 있어요.';

  @override
  String get licenseOtherServer => '다른 서버 사용';

  @override
  String get licenseRenew => '갱신';

  @override
  String get licenseRenewTitle => '이 서버의 라이선스 갱신';

  @override
  String licenseGraceBanner(String date) {
    return '이 서버의 라이선스가 만료되었어요. $date까지는 봇이 계속 실행되니 그전에 갱신해 주세요.';
  }

  @override
  String get licenseGraceBannerSoon =>
      '이 서버의 라이선스가 만료되었어요. 봇을 계속 실행하려면 곧 갱신해 주세요.';

  @override
  String get licenseExpiredBanner =>
      '이 서버의 라이선스가 만료되어 새로운 봇 실행이 일시 중지되었어요. 데이터는 안전하게 보관되며 로그인, 열람, 내보내기는 계속 가능해요. 봇을 다시 실행하려면 라이선스를 갱신해 주세요.';

  @override
  String get licenseErrorRequired =>
      '이 서버에는 먼저 라이선스가 필요해요. 무료 개인용 라이선스를 받거나 Business 키를 입력해 주세요.';

  @override
  String licenseErrorSeats(String email) {
    return '이 서버 라이선스의 모든 자리가 사용 중이에요. 인원을 더 추가하려면 Business 라이선스가 필요해요: $email 주소로 문의해 주세요.';
  }

  @override
  String get licenseErrorExpired =>
      '이 서버의 라이선스가 만료되어 새로운 봇 실행이 일시 중지되었어요. 데이터는 안전해요. 봇을 다시 시작하려면 라이선스를 갱신해 주세요.';

  @override
  String get licenseEditionPersonal => 'Personal';

  @override
  String get licenseEditionTrial => '체험';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => '감사 로그 내보내기';

  @override
  String get licenseFeatureAuditForwarding => '감사 로그 전달';

  @override
  String get licenseFeatureRoles => '고급 역할';

  @override
  String get setupLicenseTitle => '무료 개인용 라이선스';

  @override
  String get setupLicenseBody =>
      'Casama 계정으로 로그인해 이 서버용 무료 개인용 라이선스를 받으세요. 1인 개인 용도로 제공되며 나중에 설정할 수도 있어요.';

  @override
  String get setupLicenseSignIn => 'Casama로 로그인';

  @override
  String get setupLicenseReady => '무료 개인용 라이선스가 이 서버에 기본 포함돼요.';

  @override
  String setupLicenseReadyFor(String email) {
    return '$email 계정으로 로그인되었어요. 무료 개인용 라이선스가 이 서버에 기본 포함돼요.';
  }

  @override
  String get setupLicenseSkipped => '아직 라이선스가 없어요. 서버가 시작될 때 라이선스를 요청해요.';

  @override
  String setupLicenseFailed(String error) {
    return '개인용 라이선스를 만들지 못했어요($error). 서버가 시작될 때 다시 요청해요.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Casama 서버는 PC의 나머지 환경과 분리하기 위해 WSL 2를 사용하는 무료 앱인 Docker Desktop 안에서 실행돼요.';

  @override
  String get setupDockerStep1Windows =>
      '다운로드된 설치 프로그램을 실행하고 “Use WSL 2” 옵션을 켠 상태로 유지하세요.';

  @override
  String localUpdateAvailable(String version) {
    return '서버 업데이트가 준비되었어요: $version';
  }

  @override
  String get localUpdateButton => '업데이트';

  @override
  String get localUpdateLater => '나중에';

  @override
  String localUpdateTitle(String version) {
    return '서버를 $version 버전으로 업데이트할까요?';
  }

  @override
  String get localUpdateBody =>
      '먼저 데이터베이스를 백업해요. 새 버전이 시작되지 않으면 서버가 현재 버전으로 자동 복구돼요.';

  @override
  String localUpdateDone(String version) {
    return '$version 버전으로 업데이트되었어요.';
  }

  @override
  String get localUpdateRolledBack =>
      '새 버전이 시작되지 않아 서버를 이전 버전으로 되돌렸어요. 손실된 내용은 없으며 데이터베이스 백업이 저장되어 있어요.';

  @override
  String localUpdateFailed(String detail) {
    return '업데이트하지 못했어요: $detail';
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
  String get shCloudScreenTitle => 'Casama Cloud 모델';

  @override
  String get shCloudPitch =>
      'API 키를 관리할 필요 없이 쓰는 Casama 모델이에요. Casama Cloud 플랜으로 결제돼요.';

  @override
  String get shCloudTurnOn => '켜기';

  @override
  String shCloudOnPaidBy(String workspace) {
    return '켜짐 · $workspace에서 결제';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud · $workspace에서 결제';
  }

  @override
  String get shCloudMemberOff => '켜져 있지 않아요. 이 서버의 관리자만 켤 수 있어요.';

  @override
  String get shCloudManage => '관리';

  @override
  String get shCloudSignInBody =>
      'Casama Cloud 모델 요금을 결제할 주체를 선택하려면 Casama 계정으로 로그인하세요. 봇, 대화, 기억은 이 서버에 그대로 남아요.';

  @override
  String shCloudSignedInAs(String email) {
    return '$email 계정으로 Casama Cloud에 로그인됨';
  }

  @override
  String get shCloudOtherAccount => '다른 계정 사용';

  @override
  String get shCloudContinue => '계속';

  @override
  String get shCloudPayerTitle => '결제 주체';

  @override
  String get shCloudPayerBody =>
      'Casama Cloud 모델 요금은 본인이 소유하거나 운영하는 Casama Cloud 워크스페이스에서 결제돼요. 해당 플랜과 포함된 사용량, 일일 한도는 그 워크스페이스의 다른 사용량과 공유돼요.';

  @override
  String get shCloudPayerNone =>
      '아직 운영 중인 Casama Cloud 워크스페이스가 없어요. 결제에 사용할 새 워크스페이스를 만들어 보세요(빈 상태로 시작돼요).';

  @override
  String get shCloudCreateWorkspace => '만들기';

  @override
  String shCloudWorkspaceNamed(String name) {
    return '$name의 워크스페이스';
  }

  @override
  String get shCloudNoPlan => '아직 플랜이 없어요';

  @override
  String shCloudCovered(String plan) {
    return '현재 $plan 플랜에서 지원돼요.';
  }

  @override
  String get shCloudPlanTitle => '플랜 선택';

  @override
  String get shCloudPlanBody =>
      'Casama Cloud 모델은 어떤 Casama Cloud 플랜에나 포함되어 있어요. 포함된 사용량, 일일 한도, 추가 충전도 Cloud와 동일하며 자체 호스팅에 대한 별도 요금은 없어요.';

  @override
  String get shCloudTryFirst => '먼저 사용해 보기';

  @override
  String shCloudTryFirstBody(String amount) {
    return '무료 체험 사용량: Casama 계정당 1회 약 $amount 상당의 메시지가 제공돼요. 결제는 필요 없어요.';
  }

  @override
  String get shCloudTrialUsed =>
      '이 Casama 계정의 무료 체험 사용량을 모두 사용했어요. 계속하려면 플랜을 선택해 주세요.';

  @override
  String get shCloudIntervalWeek => '매주';

  @override
  String get shCloudIntervalMonth => '매월';

  @override
  String get shCloudIntervalYear => '매년';

  @override
  String get shCloudWaitingForPlan =>
      '브라우저에서 결제를 완료해 주세요. 플랜이 반영되면 이 화면이 자동으로 다음 단계로 넘어가요.';

  @override
  String get shCloudWaitingTimedOut =>
      '아직 플랜이 도착하지 않았어요. 결제 반영에는 몇 분 정도 걸릴 수 있어요.';

  @override
  String get shCloudCheckAgain => '다시 확인';

  @override
  String get shCloudGiftCode => '선물 코드가 있나요?';

  @override
  String get shCloudGiftCodeLabel => '선물 코드';

  @override
  String get shCloudRedeem => '사용하기';

  @override
  String get shCloudNoWayToBuy =>
      '이 앱에서는 플랜을 구입할 수 없어요. 같은 계정으로 casama.ai에서 구입한 뒤 여기서 다시 확인해 주세요.';

  @override
  String get shCloudPurchasePending => '결제 승인을 기다리고 있어요. 승인되면 자동으로 계속 진행돼요.';

  @override
  String get shCloudPurchaseFailed => '결제가 완료되지 않았어요. 청구된 금액은 없어요.';

  @override
  String get shCloudConnecting => '이 서버를 Casama Cloud에 연결하는 중…';

  @override
  String get shCloudLoading => '불러오는 중…';

  @override
  String get shCloudReviewTitle => '켜기 전에 확인';

  @override
  String get shCloudReviewPays => '결제 주체';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$workspace ($email)의 $plan';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return '$workspace ($email)에서 무료 체험 사용량 이용';
  }

  @override
  String get shCloudReviewBots => '전환할 봇';

  @override
  String get shCloudReviewAll => '모든 봇';

  @override
  String get shCloudReviewNoKey => '작동하는 키가 없는 봇만';

  @override
  String get shCloudReviewPick => '봇 선택';

  @override
  String get shCloudReviewNoBots =>
      '이 서버에 아직 봇이 없어요. 새로 만드는 봇은 Casama Cloud를 사용할 수 있어요.';

  @override
  String get shCloudReviewDefault => '새 봇도 Casama Cloud 사용';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Casama Cloud 모델';

  @override
  String get shCloudNoKeyYet => '작동하는 키 없음';

  @override
  String shCloudStepDown(String from) {
    return '$from 모델보다 답변이 짧거나 덜 세심할 수 있어요. 먼저 봇 하나만 시험해 보세요.';
  }

  @override
  String get shCloudReviewJobs => '기억, 이미지 및 음성';

  @override
  String get shCloudJobMemory => '기억 검색';

  @override
  String get shCloudJobImages => '이미지';

  @override
  String get shCloudJobTts => '소리 내어 읽기';

  @override
  String get shCloudJobStt => '받아쓰기';

  @override
  String get shCloudJobOwnKey => '내 API 키';

  @override
  String get shCloudJobMemoryOptIn => '기억에도 Casama Cloud 사용';

  @override
  String get shCloudJobMemoryOptInHelp =>
      '백그라운드에서 기억 색인이 다시 생성되며, 그동안에도 검색은 계속 작동해요.';

  @override
  String get shCloudJobLiveNote => '실시간 음성, 전화 통화, 동영상은 계속 내 API 키를 사용해요.';

  @override
  String get shCloudWhatGoes => 'Casama Cloud로 전송되는 정보';

  @override
  String get shCloudReviewPrivacy =>
      '모델로 보내는 메시지는 Casama Cloud를 통과하며 저장되지 않아요. 사용량(모델, 토큰, 비용)은 Cloud 청구서에 표시돼요. 봇, 대화, 기억, 파일, 컴퓨터는 이 서버에 그대로 남아요.';

  @override
  String get shCloudWhatGoesLink => '이 서버가 보내는 내용';

  @override
  String get shCloudFallback => 'Casama Cloud 한도가 소진되거나 연결할 수 없으면 내 API 키 사용';

  @override
  String get shCloudFallbackHelp => '내 API 키로 생성된 모든 답변에는 그 사실이 표시돼요.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '현재 $usedString명이 이 서버를 사용하고 있으며 $plan 플랜은 $seatsString명을 포함해요. 추가 인원마다 Casama Cloud의 추가 사용자 요금이 청구돼요.';
  }

  @override
  String get shCloudApply => 'Casama Cloud 켜기';

  @override
  String get shCloudPickOne => '봇을 하나 이상 선택하거나 새 봇이 사용하도록 설정하세요.';

  @override
  String get shCloudPolicyTitle => '사용 가능 대상';

  @override
  String get shCloudPolicyEveryone => '이 서버의 모든 사람';

  @override
  String get shCloudPolicyChosen => '선택한 사람만';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString명 선택됨',
      one: '1명 선택됨',
      zero: '아직 선택된 사람 없음',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => '1인당 일일 한도';

  @override
  String get shCloudNoLimit => '제한 없음';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '하루 $amount';
  }

  @override
  String get shCloudPolicySaved => '저장됨';

  @override
  String get shCloudDoneTitle => 'Casama Cloud가 켜졌어요';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이제 봇 $countString개가 Casama Cloud를 사용해요.',
      one: '이제 봇 1개가 Casama Cloud를 사용해요.',
      zero: '새 봇부터 Casama Cloud를 사용해요.',
    );
    return '$_temp0 사용량은 이 서버의 ‘사용량’ 화면과 Cloud 청구서에 표시돼요.';
  }

  @override
  String shCloudSayHi(String bot) {
    return '$bot 봇에게 인사하기';
  }

  @override
  String get shCloudDone => '완료';

  @override
  String get shCloudUsageTitle => '사용량';

  @override
  String shCloudIncludedLeft(String amount) {
    return '이번 달 남은 포함 사용량: $amount';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return '오늘: $spend / $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return '오늘: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '크레딧 $amount';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return '남은 무료 체험 사용량: $amount';
  }

  @override
  String get shCloudPriceNote =>
      'Casama Cloud 요금 기준으로 청구돼요. 동일한 요청 내역이 Cloud 청구서에 이 서버 이름으로 표시돼요.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return '오늘 내 사용량: $spend / $limit';
  }

  @override
  String get shCloudWarnIncluded => 'Casama Cloud가 이번 달 포함 사용량의 80%를 사용했어요.';

  @override
  String get shCloudWarnDaily => 'Casama Cloud가 오늘 한도의 80%를 사용했어요.';

  @override
  String get shCloudTopUp => '충전하기';

  @override
  String get shCloudUseOwnKey => '내 API 키 사용';

  @override
  String get shCloudStopOutOfCredits => '이번 달 Casama Cloud 사용량을 모두 썼어요.';

  @override
  String shCloudStopDailyCap(String time) {
    return '오늘의 Casama Cloud 한도를 모두 사용했어요. $time에 초기화돼요.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      '오늘의 Casama Cloud 한도를 모두 사용했어요. 내일 초기화돼요.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud를 사용하려면 $workspace에 플랜이 필요해요.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return '$workspace의 Casama Cloud 플랜이 종료되었어요.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return '$workspace의 플랜으로는 여기서 Casama Cloud를 사용하는 모든 인원을 포함할 수 없어요.';
  }

  @override
  String get shCloudStopMemberLimit => '이 서버의 오늘 Casama Cloud 한도에 도달했어요.';

  @override
  String get shCloudStopMemberNotAllowed => '관리자가 아직 Casama Cloud 사용을 켜지 않았어요.';

  @override
  String get shCloudStopDisconnected => '이 서버와 Casama Cloud의 연결이 해제되었어요.';

  @override
  String get shCloudStopUnreachable =>
      '지금은 Casama Cloud에 연결할 수 없어요. 다시 시도하고 있어요.';

  @override
  String get shCloudSeePlans => '플랜 보기';

  @override
  String get shCloudRenew => '갱신';

  @override
  String get shCloudAskAdmin => '관리자에게 문의';

  @override
  String get shCloudAskAdminBody =>
      '이 서버의 관리자만 Casama Cloud 설정을 변경할 수 있어요. 관리자에게 문의해 주세요. 문제가 해결되면 봇과 루틴은 자동으로 계속 진행돼요.';

  @override
  String get shCloudReconnect => '다시 연결';

  @override
  String get shCloudFallbackActive =>
      '그동안 내 API 키로 응답하고 있으며, 각 답변에 그 사실이 표시돼요.';

  @override
  String get shCloudUseOwnKeyTitle => '그동안 내 API 키를 사용할까요?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Casama Cloud가 답할 수 없는 동안 봇이 내 API 키로 답하며, 해당 답변에는 그 사실이 표시돼요. 이 화면에서 언제든 끌 수 있어요.';

  @override
  String get shCloudAddKeyFirst => '먼저 ‘모델’ 화면에서 내 API 키를 추가해 주세요.';

  @override
  String get shCloudRoutinesWait => '루틴은 대기하다가 문제가 해결되면 자동으로 이어서 실행돼요.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '기억 색인 동기화 중: $totalString개 중 $doneString개';
  }

  @override
  String get shCloudMemoryCatchingUpHelp => '아직 다시 색인되지 않은 기억은 단어 기반으로 검색해요.';

  @override
  String shCloudMemberNotice(String workspace) {
    return '이제 모델로 전달되는 메시지가 Casama Cloud를 거치며, 비용은 $workspace에서 결제해요.';
  }

  @override
  String get shCloudGotIt => '확인';

  @override
  String shCloudChipPaidBy(String workspace) {
    return '$workspace에서 결제';
  }

  @override
  String get shCloudPaidBy => '결제 주체';

  @override
  String get shCloudChangePayer => '변경';

  @override
  String get shCloudChangeBots => '봇 변경';

  @override
  String get shCloudFallbackSection => 'Casama Cloud가 답할 수 없을 때';

  @override
  String get shCloudTurnOff => '끄기';

  @override
  String get shCloudOffTitle => 'Casama Cloud를 끌까요?';

  @override
  String get shCloudOffBody =>
      '이 봇들은 이전에 쓰던 키가 여전히 작동하면 그 키로, 그렇지 않으면 워크스페이스 기본 키로 돌아가요. 다른 항목은 바뀌지 않으며 언제든 다시 켤 수 있어요.';

  @override
  String get shCloudOffBotsNone => '지금 Casama Cloud를 사용하는 봇이 없어요.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud가 꺼졌어요';

  @override
  String shCloudOffBackTo(String key) {
    return '$key 키로 복귀';
  }

  @override
  String get shCloudOffNeedsKey => '키 필요';

  @override
  String get shCloudAddKey => '키 추가';

  @override
  String get shCloudSignInAgain =>
      'Casama Cloud 로그인이 만료되었어요. 계속하려면 다시 로그인해 주세요.';

  @override
  String get cloudAccountSection => 'Casama Cloud 계정';

  @override
  String cloudAccountRow(String email) {
    return '$email 계정으로 로그인됨';
  }

  @override
  String get cloudAccountRowHelp => '이 서버의 라이선스와 Casama Cloud 모델에 사용돼요';

  @override
  String get cloudAccountSignOut => 'Casama Cloud에서 로그아웃';

  @override
  String get cloudAccountSignOutBody =>
      '이 기기에서 Casama Cloud 로그인 정보를 지워요. 이 서버와 라이선스, Casama Cloud 모델은 계속 작동해요.';

  @override
  String get cloudAccountDelete => 'Casama Cloud 계정 삭제';

  @override
  String get cloudAccountDeleteHelp =>
      'Casama Cloud 계정을 삭제해요. 이 서버와 데이터는 그대로 유지돼요.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Casama Cloud 계정을 삭제하려면 $email 주소를 입력하세요. 본인만 소유한 Cloud 워크스페이스도 함께 삭제되며, 해당 워크스페이스가 결제하던 서버의 Casama Cloud 모델이 중지돼요. 웹에서 구입한 플랜은 자동으로 해지돼요. App Store나 Google Play에서 구입한 플랜은 해지되지 않아요. 해당 스토어에서 해지해 주세요.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Casama Cloud 계정이 삭제되었어요. 데이터는 $date에 영구적으로 삭제돼요.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Casama Cloud로 이동';

  @override
  String get wsMoveSettingsToServer => '내 서버로 이동';

  @override
  String get wsMoveSettingsHelp => '이 워크스페이스의 봇, 대화, 기억, 파일을 다른 서버로 옮겨요';

  @override
  String get wsMoveTitle => '이 워크스페이스 이동';

  @override
  String get wsMoveIntro =>
      '봇, 대화, 기억, 루틴, 파일, 컴퓨터가 모두 함께 이동해요. 이동이 완료되면 이 사본은 읽기 전용으로 남고 작동은 멈춰요.';

  @override
  String get wsMoveCloudOption => 'Casama Cloud로 이동';

  @override
  String get wsMoveCloudOptionHelp => 'Casama 계정으로 로그인해 이동할 곳을 선택하세요.';

  @override
  String get wsMoveServerOption => '내 서버로 이동';

  @override
  String get wsMoveServerOptionHelp =>
      '대상 서버에서 설정 › 워크스페이스 가져오기를 열어 이동 코드를 복사하세요.';

  @override
  String get wsMoveInstallServer => 'Casama 서버 설치';

  @override
  String get wsMoveInstallServerHelp => '아직 서버가 없나요? 먼저 이 컴퓨터에서 서버를 실행해 보세요.';

  @override
  String get wsMoveReceiveOption => '여기로 워크스페이스 가져오기';

  @override
  String get wsMoveReceiveOptionHelp =>
      '현재 다른 워크스페이스가 있는 서버에서 사용할 수 있도록 이 워크스페이스의 이동 코드를 받으세요.';

  @override
  String get wsMoveOwnerOnly => '워크스페이스 소유자만 이동할 수 있어요.';

  @override
  String get wsMoveCloudPickTitle => '어디로 옮길까요?';

  @override
  String get wsMoveCloudNew => '새 워크스페이스';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Casama Cloud에 $name 이름의 빈 워크스페이스로 시작해요.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      '이동된 항목은 기존 항목과 나란히 배치돼요. 이름이 겹치면 뒤에 “(moved)”가 붙어요.';

  @override
  String get wsMoveServerTitle => '내 서버로 이동';

  @override
  String get wsMoveServerAddress => '서버 주소';

  @override
  String get wsMoveServerCode => '이동 코드';

  @override
  String get wsMoveCheckButton => '확인';

  @override
  String get wsMoveReceiveTitle => '여기로 워크스페이스 가져오기';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return '현재 워크스페이스가 있는 서버에서 설정 › 내 서버로 이동을 열고 이 주소와 코드를 입력하세요. 코드는 $time까지 1회만 사용할 수 있으며, 모든 항목을 $name 워크스페이스로 가져와요.';
  }

  @override
  String get wsMoveReceiveAddress => '이 서버의 주소';

  @override
  String get wsMoveReceiveCode => '이동 코드';

  @override
  String get wsMoveCopy => '복사';

  @override
  String get wsMoveCopied => '복사됨';

  @override
  String get wsMoveCheckTitle => '이동 준비 완료';

  @override
  String wsMoveCheckTo(String name) {
    return '대상: $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString분',
      one: '1분',
    );
    return '복사할 용량 $size, 예상 소요 시간 약 $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString분',
      one: '1분',
    );
    return '마지막 단계에서 봇이 약 $_temp0 동안 일시 중지된 뒤 새 서버에서 계속 진행해요.';
  }

  @override
  String get wsMoveCheckLongPause => '일시 중지 시간이 다소 길어요. 한가한 시간대에 진행해 주세요.';

  @override
  String get wsMoveCheckComes => '함께 이동하는 항목';

  @override
  String wsMoveCountBots(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '봇 $nString개',
      one: '봇 1개',
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
      other: '대화 $nString개',
      one: '대화 1개',
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
      other: '기억 $nString개',
      one: '기억 1개',
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
      other: '루틴 $nString개',
      one: '루틴 1개',
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
      other: '파일 $nString개',
      one: '파일 1개',
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
      other: '컴퓨터 $nString대',
      one: '컴퓨터 1대',
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
      other: '사용자 $nString명',
      one: '사용자 1명',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => '이동 후 필요한 작업';

  @override
  String wsMoveReconnect(String names) {
    return '새 서버에서 다음 앱에 다시 로그인해 주세요: $names';
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
      other: '$nString명이',
      one: '1명이',
    );
    return '$_temp0 이메일 초대를 받아요';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (초대됨)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'ChatGPT 플랜은 함께 이동하지 않아요. 새 서버에서 ChatGPT에 다시 로그인해 주세요.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '컴퓨터 $nString대가',
      one: '컴퓨터 1대가',
    );
    return '$_temp0 홈 폴더가 복원된 상태로 새 서버에서 새로 시작해요.';
  }

  @override
  String get wsMoveResetNote => '승인, 전체 접근, 기기 접근 설정은 새 서버의 기본값으로 초기화돼요.';

  @override
  String get wsMoveBringKeys => '내 API 키 함께 가져오기';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '키 $nString개가',
      one: '키 1개가',
    );
    return '$_temp0 새 서버에서만 읽을 수 있도록 암호화되어 함께 이동해요.';
  }

  @override
  String get wsMoveNoKeysHelp => '새 서버에서 모델 및 채팅 앱 키를 다시 추가해야 해요.';

  @override
  String get wsMoveDoesntFit => '이 워크스페이스는 대상 서버의 플랜 한도를 초과해요';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan 플랜에서 이용할 수 있어요. Casama Cloud에서 선택한 뒤 다시 확인해 주세요.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have / $limit';
  }

  @override
  String get wsMoveOverPeople => '사용자';

  @override
  String get wsMoveOverBots => '봇';

  @override
  String get wsMoveOverComputers => '컴퓨터';

  @override
  String get wsMoveOverStorage => '저장 공간';

  @override
  String get wsMoveUpdateSource => '먼저 이 서버를 업데이트해 주세요. 이동할 대상 서버보다 버전이 낮아요.';

  @override
  String get wsMoveUpdateTarget => '먼저 이동할 대상 서버를 업데이트해 주세요.';

  @override
  String get wsMoveStart => '이동 시작';

  @override
  String get wsMoveCheckAgain => '다시 확인';

  @override
  String get wsMoveProgressTitle => '이동 중';

  @override
  String get wsMoveStepStarting => '준비 중';

  @override
  String get wsMoveStepCopying => '모든 기능을 계속 사용하면서 파일을 복사하는 중';

  @override
  String get wsMoveStepPausing => '마지막 변경 사항을 복사하기 위해 봇 일시 중지 중';

  @override
  String get wsMoveStepFinishing => '대화, 기억 및 설정 전송 중';

  @override
  String get wsMoveStepImporting => '새 서버에서 항목을 가져오는 중';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done / $total';
  }

  @override
  String get wsMoveProgressLeave => '앱을 닫아도 괜찮아요. 이동은 계속 진행되며 완료되면 알림을 보내 드려요.';

  @override
  String get wsMoveFailedTitle => '이동이 중단되었어요';

  @override
  String get wsMoveFailedBody => '여기는 바뀐 내용이 없어요. 이 워크스페이스는 계속 정상 작동해요.';

  @override
  String get wsMoveTryAgain => '다시 시도';

  @override
  String get wsMoveNewCodeNeeded => '다시 시도하려면 새 이동 코드를 발급받으세요.';

  @override
  String get wsMoveDoneTitle => '이동 완료';

  @override
  String wsMoveDoneBody(String server) {
    return '모든 항목이 $server에 도착했어요.';
  }

  @override
  String get wsMoveDoneNeeds => '새 서버에서 몇 가지 확인이 필요해요:';

  @override
  String get wsMoveOpenThere => '새 서버에서 열기';

  @override
  String wsMoveAfterReconnect(String name) {
    return '$name에 다시 로그인';
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
      other: '$nString명에게',
      one: '1명에게',
    );
    return '$_temp0 이메일 초대를 보냈어요';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return '$name 다시 연결';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return '$name의 발신 측에 새 웹훅 주소를 입력해 주세요';
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
      other: '$nString일',
      one: '1일',
    );
    return '기존 주소로 들어오는 웹훅은 $_temp0 동안 새 서버로 전달돼요.';
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
      other: '봇 $nString개',
      one: '봇 1개',
    );
    return '$_temp0의 승인 설정을 확인하세요';
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
      other: '봇 $nString개',
      one: '봇 1개',
    );
    return '$_temp0에 대해 설정에서 Casama Cloud 모델을 연결하거나 다른 모델을 선택하세요';
  }

  @override
  String get wsMoveAfterKeys => '새 서버에서 모델 키를 추가하세요';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '항목 $nString개의',
      one: '항목 1개의',
    );
    return '$_temp0 이름 뒤에 “(moved)”가 붙었어요';
  }

  @override
  String get wsMoveAfterReindex => '기억 검색은 몇 분 뒤에 동기화돼요.';

  @override
  String get wsMoveAfterNothing => '더 할 작업이 없어요.';

  @override
  String get wsMoveSubTitle => '내 구독';

  @override
  String get wsMoveSubToCloud =>
      'Casama Cloud의 봇은 Cloud 플랜으로 작동해요. 이 서버용 비즈니스 라이선스를 결제하고 있었다면 필요 없어졌을 때 해지해 주세요.';

  @override
  String get wsMoveSubFromCloud =>
      'Casama Cloud 플랜은 계속 갱신돼요. 내 서버에 안정적으로 자리 잡으면 해지하세요.';

  @override
  String get wsMoveSubManage => '플랜 관리';

  @override
  String get wsMovedTitle => '이 워크스페이스가 이동되었어요';

  @override
  String get wsMovedBodyCloud =>
      '이제 Casama Cloud에 있어요. 계속하려면 거기에서 로그인하세요. 이 사본은 읽기 전용이에요.';

  @override
  String wsMovedBodyServer(String host) {
    return '이제 $host에 있어요. 계속하려면 거기에서 로그인하세요. 이 사본은 읽기 전용이에요.';
  }

  @override
  String get wsMovedSignInCloud => 'Casama Cloud에 로그인';

  @override
  String wsMovedOpenServer(String host) {
    return '$host 열기';
  }

  @override
  String get wsMovedViewOld => '이전 사본 보기';

  @override
  String get languageDevice => '기기 언어';

  @override
  String get shortcutQuickAsk => '빠른 질문';

  @override
  String shortcutAskBot(String name) {
    return '$name에게 물어보기';
  }

  @override
  String shortcutRunRoutine(String name) {
    return '$name 실행';
  }

  @override
  String get settingsWordsWorkspace =>
      '워크스페이스 전환 변경 팀 조직 역할 workspace switch change team organization org role';

  @override
  String get settingsWordsAboutYou =>
      '프로필 이름 사진 아바타 대명사 내 소개 답변 스타일 정보 기억 profile name photo picture avatar pronouns about me reply style facts memory';

  @override
  String get settingsWordsPeople =>
      '멤버 초대 팀 사용자 관리자 역할 초대 링크 코드 참여 삭제 members invite team users admins roles invite link code join remove';

  @override
  String get settingsWordsWorkspaceSettings =>
      '워크스페이스 이름 아이콘 로고 암호화 기억 결제 카드 비밀번호 관리자 봇 간 대화 크롬 확장 프로그램 갤러리 전체 접근 권한 승인 먼저 물어보기 우회 workspace name icon logo encryption memory payments stripe card password managers bot to bot chrome extension gallery full access permissions approvals ask bypass';

  @override
  String get settingsWordsSettingsDomains =>
      '도메인 웹사이트 맞춤 dns 구입 연결 사이트 domain website custom dns buy connect sites';

  @override
  String get settingsWordsUsage =>
      '비용 지출 금액 크레딧 토큰 한도 cost spend spending money credits tokens limits';

  @override
  String get settingsWordsBilling =>
      '플랜 구독 업그레이드 프로 플러스 맥스 결제 청구서 카드 요금 plan subscription upgrade pro plus max payment invoice card pricing';

  @override
  String get settingsWordsInviteFriends =>
      '추천 크레딧 리워드 공유 referral credit reward share';

  @override
  String get settingsWordsAdminConsole => '관리자 콘솔 admin console';

  @override
  String get settingsWordsAppearance =>
      '테마 다크 모드 라이트 모드 야간 색상 글꼴 폰트 텍스트 크기 배경 배경화면 스타일 효과 모션 애니메이션 theme dark mode light mode night colors fonts font text size background wallpaper look style themes effects motion animations';

  @override
  String get settingsWordsQuietHours =>
      '방해 금지 수면 무음 알림 끄기 일정 do not disturb dnd sleep mute silence notifications schedule';

  @override
  String get settingsWordsPushPrefsTitle =>
      '알림 푸시 답변 소리 notifications push alerts replies sounds';

  @override
  String get settingsWordsCallFullScreenTitle =>
      '통화 전화 벨소리 잠금 화면 전체 화면 수신 응답 calls phone ring ringing lock screen full screen incoming answer';

  @override
  String get settingsWordsEmailTips =>
      '이메일 뉴스레터 팁 소식 수신 거부 email newsletter tips news unsubscribe';

  @override
  String get settingsWordsGalleryDigestEmails =>
      '이메일 갤러리 다이제스트 월간 소식 email gallery digest monthly picks';

  @override
  String get settingsWordsNewsletterTitle =>
      '이메일 뉴스레터 월간 소식 업데이트 구독 수신 거부 email newsletter monthly news updates subscribe unsubscribe';

  @override
  String get settingsWordsWakeWord =>
      '음성 호출 핸즈프리 마이크 듣기 voice hey hands free microphone mic listen';

  @override
  String get settingsWordsShowBotSteps =>
      '단계 도구 세부 정보 진행 상황 steps tools details progress';

  @override
  String get settingsWordsShowReplyUsage =>
      '비용 토큰 가격 답변당 사용량 cost tokens price usage per reply';

  @override
  String get settingsWordsCheckForUpdates =>
      '업데이트 버전 업그레이드 다운로드 자동 update updates version upgrade download automatic';

  @override
  String get settingsWordsOpenAtLogin =>
      '시작 프로그램 실행 로그인 부팅 자동 시작 startup launch login boot start automatically';

  @override
  String get settingsWordsIslandStartElsewhere =>
      '실시간 현황 다이나믹 아일랜드 잠금 화면 다른 기기 live activity dynamic island lock screen other devices';

  @override
  String get settingsWordsShowBotsInNotch =>
      '노치 메뉴 막대 다이나믹 아일랜드 notch menu bar dynamic island';

  @override
  String get settingsWordsNotchOnHover => '노치 마우스 호버 notch hover mouse';

  @override
  String get settingsWordsLanguage =>
      '언어 로캘 영어 한국어 번역 language locale english translation';

  @override
  String get settingsWordsIntegrations =>
      '앱 연결 gmail google slack 캘린더 플러그인 도구 mcp apps connect connections calendar plugins tools';

  @override
  String get settingsWordsSkills =>
      '스킬 카탈로그 기능 지침 skills catalog abilities instructions';

  @override
  String get settingsWordsCasamaLink =>
      '원격 접속 주소 터널 자체 호스팅 휴대폰 remote access address tunnel self host phone';

  @override
  String get settingsWordsServiceKeys =>
      'api 키 검색 지도 데이터 api keys search maps data';

  @override
  String get settingsWordsModelsTitle =>
      'api 키 openai anthropic openrouter gemini 모델 제공업체 ollama 로컬 모델 models providers local models';

  @override
  String get settingsWordsModelKeys =>
      'api 키 openai anthropic openrouter gemini 모델 제공업체 ollama 로컬 모델 models providers local models';

  @override
  String get settingsWordsAccount =>
      '이메일 변경 비밀번호 모든 기기 로그아웃 로그인 email change password sign out everywhere login';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2단계 인증 mfa 인증 앱 totp otp 보안 코드 2fa two factor authenticator security code';

  @override
  String get settingsWordsPairDevice =>
      'qr 코드 스캔 로그인 휴대폰 연결 다른 기기 qr code scan sign in pair phone another device';

  @override
  String get settingsWordsPasskeys =>
      '패스키 face id touch id 지문 생체 인증 passkey fingerprint biometric';

  @override
  String get settingsWordsWidgetsTitle =>
      '위젯 홈 화면 잠금 화면 제어기 제어 센터 고정 바로가기 widgets home screen lock screen controls control center glance pin shortcut';

  @override
  String get settingsWordsCardsSettingsTitle =>
      '카드 날씨 단위 섭씨 화씨 기준 도시 위치 통화 주식 상승 빨간색 초록색 데이터 출처 cards weather units celsius fahrenheit home city location currency stocks red green data sources';

  @override
  String get settingsWordsAppLock =>
      '앱 잠금 pin 암호 face id touch id 지문 생체 인증 windows hello 스크린샷 개인정보 보호 잠금 화면 app lock passcode fingerprint biometric screenshots privacy lock screen';

  @override
  String get settingsWordsPrivacy =>
      '데이터 내보내기 다운로드 계정 삭제 분석 추적 기록 보관 차단한 사용자 차단 data export download delete account analytics tracking history retention blocked people block';

  @override
  String get settingsWordsSecrets =>
      '시크릿 비밀번호 자격 증명 볼트 환경 변수 secrets passwords credentials vault environment variables';

  @override
  String get settingsWordsComputers =>
      '컴퓨터 머신 docker 샌드박스 데스크톱 computers machines sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      '기기 위치 건강 장소 폴더 감시 앱 브라우저 크롬 확장 프로그램 휴대폰 권한 devices location health places folders watched apps browsers chrome extension phone permissions';

  @override
  String get settingsWordsUseThisComputer =>
      '컴패니언 이 컴퓨터 mac 로컬 파일 companion this computer local files';

  @override
  String get settingsWordsHelpAndSupport =>
      '도움말 지원 문의 티켓 버그 제보 피드백 문서 커뮤니티 github 별 오픈 소스 discord 아이디어 보드 상태 help support contact ticket bug report feedback docs community star open source ideas board status';

  @override
  String get settingsWordsSignOut => '로그아웃 log out logout sign out';

  @override
  String get notifDoIt => '실행';

  @override
  String get notifNotNow => '나중에';

  @override
  String get notifAllow => '허용';

  @override
  String get notifDeny => '거부';

  @override
  String get notifApprove => '승인';

  @override
  String get notifReview => '검토';

  @override
  String get notifReply => '답장';

  @override
  String get notifSend => '보내기';

  @override
  String get notifReplyPlaceholder => '답장 입력…';

  @override
  String get notifChannelReplies => '답변';

  @override
  String get notifChannelRepliesDescription => '질문에 봇이 답했어요';

  @override
  String get notifChannelNeedsYou => '확인 필요';

  @override
  String get notifChannelNeedsYouDescription => '봇이 기다리는 승인, 암호, 직접 조작 요청';

  @override
  String get notifChannelRoutines => '루틴 및 브리핑';

  @override
  String get notifChannelRoutinesDescription => '루틴 실행 결과와 아침 브리핑';

  @override
  String get notifChannelSuggestions => '제안';

  @override
  String get notifChannelSuggestionsDescription => '봇이 대신 해 주겠다고 제안하는 항목';

  @override
  String get notifChannelAccount => '계정';

  @override
  String get notifChannelAccountDescription => '크레딧, 프로젝트 및 서버 알림';

  @override
  String get notifCallChannel => '통화';

  @override
  String get notifCallLive => '통화 중';

  @override
  String get notifCallMuted => '음소거됨';

  @override
  String get notifCallReconnecting => '다시 연결 중';

  @override
  String get notifCallMute => '음소거';

  @override
  String get notifCallUnmute => '음소거 해제';

  @override
  String get notifCallEnd => '통화 종료';

  @override
  String get notifFromYourWatch => '워치에서 보냄';

  @override
  String get notifLiveOpen => '열기';

  @override
  String get notifLiveStop => '중지';

  @override
  String get notifLiveReview => '검토';

  @override
  String get notifLiveAllow => '허용';

  @override
  String get notifLiveDeny => '거부';

  @override
  String get notifLiveNeedsOk => '승인 필요';

  @override
  String get notifLiveNeedsYou => '확인 필요';

  @override
  String get notifLiveWorking => '작업 중';

  @override
  String get notifLiveTakeOver => '직접 조작 요청';

  @override
  String get notifLiveFinished => '완료됨';

  @override
  String get notifLiveProblem => '문제로 중단됨';

  @override
  String get notifLiveBotWorking => '봇이 작업 중이에요';

  @override
  String get notifLiveBotsAtWork => '작업 중인 봇';

  @override
  String get notifLiveStepOne => '1단계';

  @override
  String notifLiveSteps(int count) {
    return '$count단계';
  }

  @override
  String get notifAlarmTitle => 'Casama 알람';

  @override
  String get notifAlarmStop => '중단';

  @override
  String get widgetIosNeedsYouDescription =>
      '내 답변을 기다리는 봇을 확인하고 간단한 요청에 바로 응답해요.';

  @override
  String get widgetIosBotDescription => '봇이 지금 무엇을 하고 있는지 살펴봐요.';

  @override
  String get widgetIosAskDescription => '탭 한 번으로 봇에게 질문하거나 통화를 시작해요.';

  @override
  String get widgetIosRoutinesDescription => '다음에 실행될 루틴을 확인하고 지금 바로 실행해요.';

  @override
  String get widgetIosTodayDescription =>
      '확인이 필요한 항목, 다음 일정, 크레딧까지 오늘 하루를 한곳에 모아 봐요.';

  @override
  String get widgetIosBriefDescription => '오늘 아침 봇이 보내 준 내용을 읽어요.';

  @override
  String get widgetIosLibraryDescription => '최근에 봇이 만든 결과물을 바로 열어요.';

  @override
  String get widgetIosTasksDescription => '작업 보드 현황과 기다리는 작업을 우선순위로 확인해요.';

  @override
  String get widgetIosCreditsDescription => '크레딧을 얼마나 사용했는지 확인해요.';

  @override
  String get widgetIosInlineDescription => '시계 위에서 가장 중요한 한 가지를 한눈에 확인해요.';

  @override
  String get widgetIosCanvasDescription =>
      '오늘의 말씀, 카운트다운, 연속 기록, 목록, 사진 등 봇이 올려둔 내용을 표시해요.';

  @override
  String get widgetMacNeedsYouDescription => '내 답변을 기다리는 봇을 확인해요.';

  @override
  String get widgetMacRoutinesDescription => '다음에 무엇이 실행되는지 확인해요.';

  @override
  String get widgetAskCasama => 'Casama에 질문';

  @override
  String get widgetControlAskDescription => '키보드가 바로 열린 상태로 빠른 질문을 열어요.';

  @override
  String get widgetTalkToBot => '봇과 통화';

  @override
  String widgetTalkToName(String name) {
    return '$name 봇과 통화';
  }

  @override
  String get widgetControlTalkDescription => '선택한 봇과 음성 통화를 시작해요.';

  @override
  String get widgetRunRoutine => '루틴 실행';

  @override
  String get widgetControlRunDescription => 'Casama를 열지 않고 선택한 루틴을 실행해요.';

  @override
  String widgetFallbackAskBot(String bot) {
    return '$bot에게 무엇이든 물어보세요';
  }

  @override
  String get widgetFallbackBrief => '아침 브리핑';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot 봇이 $title 완료함';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return '$time 기준';
  }

  @override
  String get widgetFallbackNothingNext => '예정된 일정 없음';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot 봇이 직접 조작을 요청해요';
  }

  @override
  String get widgetFallbackDay => '일';

  @override
  String get widgetFallbackDays => '일';

  @override
  String get widgetSampleVerse => '너희는 가만히 있어 내가 하나님 됨을 알지어다.';

  @override
  String get widgetSampleVerseRef => '시편 46:10';

  @override
  String get widgetSampleVerseShort => '너희는 가만히 있어 내가 하나님 됨을 알지어다 · 시편 46:10';

  @override
  String get widgetSampleVerseTiny => '너희는 가만히 있어…';

  @override
  String get widgetSampleCanvasName => '오늘의 말씀';

  @override
  String get widgetSampleNeedFlights => '리스본행 항공편 찾기';

  @override
  String get widgetSampleNeedDentist => '치과 예약을 금요일로 옮길까요?';

  @override
  String get widgetSampleBotText => '이메일 3건에 답장이 필요하고, Acme 청구서 기한이 이틀 지났어요.';

  @override
  String get widgetSampleStep => '수신함 읽는 중';

  @override
  String get widgetSampleRoutineInbox => '수신함 정리';

  @override
  String get widgetSampleRoutineBrief => '아침 브리핑';

  @override
  String get widgetSampleRoutineWeekly => '주간 보고서';

  @override
  String get widgetSampleWeekdays => '평일';

  @override
  String get widgetSampleEveryDay => '매일';

  @override
  String get widgetSampleFridays => '매주 금요일 16:00';

  @override
  String get widgetSampleBrief =>
      '이메일 3건에 답장이 필요하고, Acme 청구서 기한이 이틀 지났어요. 오후 3시부터 비 예보가 있으니 4시 30분 픽업에 맞춰 일찍 출발하세요. 첫 회의는 오전 10시 Dana와 있어요.';

  @override
  String get widgetSamplePricing => '4분기 가격 페이지';

  @override
  String get widgetSampleLogoIdeas => '로고 아이디어';

  @override
  String get widgetSampleTripPlan => '여행 계획';

  @override
  String get widgetSampleLaunchPost => '출시 안내 글 초안 작성';

  @override
  String get widgetSampleStarterInbox => '수신함 요약해 줘';

  @override
  String get widgetSampleStarterFriday => '금요일 일정 짜 줘';

  @override
  String get widgetSampleWorking => '작업 중 · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'US\$5.70 남음';

  @override
  String get widgetSampleSpentToday => '오늘 US\$0.80';

  @override
  String get widgetSampleMorning =>
      '좋은 아침이에요. 오늘 회의가 두 개 있는데, 첫 회의는 오전 10시에 디자인팀과 있어요. 오후 3시 이후 비가 오니 외투를 챙기세요. 금요일 리스본행 항공편이 확정되었어요.';

  @override
  String get widgetSampleLisbonPlan => '리스본 여행 계획';

  @override
  String get widgetSampleAgo => 'Milo · 2시간 전';

  @override
  String get widgetSampleLaunchEmail => '출시 안내 이메일 초안 작성';

  @override
  String get widgetSampleInReviewBy => '검토 중 · Ada';

  @override
  String get widgetSampleNeedAndroid => 'Milo 봇이 리스본행 항공권 가격을 검색하려고 해요';

  @override
  String get widgetSampleUpNextAt => '다음 일정 · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · 18분 후';

  @override
  String get widgetSampleDate => '11월 18일 수요일';

  @override
  String get widgetSampleNeedsCount => '확인 필요 · 1';

  @override
  String get widgetSampleSearchFlights => '리스본행 항공권 가격 검색';

  @override
  String get widgetSampleAskAda => 'Ada에게 질문';

  @override
  String get widgetSampleAskMilo => 'Milo에게 질문';

  @override
  String get widgetSamplePlanDay => '☀️ 오늘 하루 계획 세워 줘';

  @override
  String get widgetSampleWhatsNew => '✉️ 수신함에 새 소식 뭐 있어?';

  @override
  String get widgetAndroidBotDescription => '봇이 지금 무엇을 하고 있는지 실시간으로 살펴봐요';

  @override
  String get widgetAndroidTodayDescription => '봇과 함께하는 오늘 하루를 한곳에 모아 봐요';

  @override
  String get widgetAndroidBriefDescription => '아침 브리핑을 한눈에 읽어요';

  @override
  String get widgetAndroidLibraryDescription => '최근에 봇이 만든 결과물을 열어요';

  @override
  String get widgetAndroidTasksDescription => '작업 보드 현황을 추적해요';

  @override
  String get widgetAndroidCreditsDescription => '얼마나 사용했는지 확인해요';

  @override
  String get widgetAndroidCanvasDescription => '문구부터 카운트다운까지 봇이 올려둔 내용을 표시해요';

  @override
  String get widgetConfigBotTitle => '봇 선택';

  @override
  String get widgetConfigRoutinesTitle => '루틴 선택';

  @override
  String get widgetConfigRoutinesHint => '직접 실행할 루틴을 최대 4개까지 선택하세요';

  @override
  String get widgetConfigAutomatic => '자동';

  @override
  String get widgetConfigAutomaticHint => '봇 전체에서 다음에 실행될 루틴을 표시해요';

  @override
  String get widgetConfigDone => '완료';

  @override
  String get widgetConfigSignedOutTitle => '아직 선택할 항목이 없어요';

  @override
  String get widgetConfigSignedOut => 'Casama를 열어 로그인한 뒤 여기에서 선택하세요.';

  @override
  String get widgetConfigCanvasTitle => '캔버스 선택';

  @override
  String get widgetConfigCanvasAutomaticHint => '봇이 가장 최근에 설정한 캔버스';

  @override
  String get widgetConfigCanvasNone =>
      '아직 캔버스가 없어요. 봇에게 여기에 무언가 띄워 달라고 요청해 보세요.';

  @override
  String get iosUsageTracking =>
      '허용하면 Facebook이나 Instagram에서 Casama 광고를 본 뒤 앱을 설치하거나 가입, 구독할 때 Casama가 Meta에 알려 어떤 광고가 효과적인지 측정해요. Casama는 광고를 절대 표시하지 않으며 대화나 파일도 절대 공유하지 않아요.';

  @override
  String get iosUsageContacts => '기기 연결에서 연락처를 켠 경우에만 봇이 지인을 찾아볼 수 있어요.';

  @override
  String get iosUsagePhotoLibrary =>
      '봇에게 보내거나 프로필에 사용할 사진을 고를 때 Casama가 사진 라이브러리를 열어요.';

  @override
  String get iosUsageLocationAlways =>
      'Casama가 닫혀 있을 때도 지정한 장소에 도착하거나 떠날 때 봇에게 알려 줘요. 장소 이름과 시간만 공유되며 이동 경로는 절대 공유되지 않아요.';

  @override
  String get iosUsageLocationWhenInUse =>
      '집이나 직장처럼 직접 이름을 붙인 장소를 저장하고, 다음 일정에 맞춰 언제 출발해야 할지 봇이 알려 줘요. ‘기기 연결’에서 ‘장소’를 켠 경우에만 사용돼요.';

  @override
  String get iosUsageCamera => '봇에게 보내거나 프로필에 사용할 사진을 찍을 때 Casama가 카메라를 사용해요.';

  @override
  String get iosUsageCalendars =>
      '기기 연결에서 캘린더를 켠 경우에만 봇이 일정 질문에 답하고 이벤트를 추가할 수 있어요.';

  @override
  String get iosUsageSpeech =>
      'Casama 받아쓰기 서비스에 연결할 수 없을 때 기기 자체 음성 인식으로 말한 내용을 텍스트로 변환해요.';

  @override
  String get iosUsageAlarmKit =>
      '기기 연결에서 알람을 허용한 경우에만 봇이 무음 모드에서도 울리는 알람과 타이머를 설정할 수 있어요.';

  @override
  String get iosUsageHomeKit =>
      '기기 연결에서 홈을 허용하면 봇이 HomeKit 홈을 확인하고 제어할 수 있으며, 변경 시 항상 먼저 승인을 요청해요.';

  @override
  String get iosUsageMicrophone =>
      'Casama는 봇과의 받아쓰기와 실시간 통화를 위해 마이크를 사용해요. 동의하신 후에만 음성이 AI 제공업체로 전송돼요(통화는 Google Gemini, 받아쓰기 텍스트 변환은 OpenAI).';

  @override
  String get iosUsageHealthUpdate =>
      'Casama는 Apple 건강 데이터를 읽기만 하며 절대 기록하지 않아요.';

  @override
  String get iosUsageFaceId =>
      'Casama는 앱 잠금을 켰을 때 앱 잠금을 해제하고 민감한 작업을 확인하기 위해 Face ID를 사용해요.';

  @override
  String get iosUsageHealthShare =>
      '기기 연결에서 Apple 건강을 켠 경우에만 봇이 수면, 활동, 운동, 심박수 일일 요약을 볼 수 있어요. Casama는 Apple 건강에 절대 기록하지 않으며 이 데이터를 광고에 사용하지도 않아요.';

  @override
  String get iosUsageWatchMicrophone =>
      '봇에게 질문할 때 음성을 녹음해 Casama 서버로 보내며, AI 제공업체(Casama Cloud의 OpenAI)가 이를 봇을 위한 텍스트로 변환해요.';

  @override
  String get macUsageContacts => '기기 연결에서 연락처를 켠 경우에만 봇이 지인을 찾아볼 수 있어요.';

  @override
  String get macUsageSpeech =>
      'Casama 받아쓰기 서비스에 연결할 수 없을 때 기기 자체 음성 인식으로 말한 내용을 텍스트로 변환해요.';

  @override
  String get macUsageMicrophone =>
      'Casama는 봇과의 받아쓰기와 실시간 통화를 위해 마이크를 사용해요. 동의하신 후에만 음성이 AI 제공업체로 전송돼요(통화는 Google Gemini, 받아쓰기 텍스트 변환은 OpenAI).';

  @override
  String get macUsageAppleEvents =>
      '단축키를 눌렀을 때만 빠른 질문이 앞쪽 윈도우의 제목과 브라우저의 현재 탭을 읽어요.';

  @override
  String get nativeNameFileProvider => 'Casama 컴퓨터';

  @override
  String get nativeNameNotifications => 'Casama 알림';

  @override
  String get nativeNameSafari => 'Safari용 Casama';

  @override
  String get nativeNameAskCasama => 'Casama에 묻기';

  @override
  String get nativeComputer => '컴퓨터';

  @override
  String get nativeSafariSignInIos =>
      '이 기기에서 Casama 열기 -> 설정 -> 다른 기기에서 로그인으로 이동하거나 아래에 로그인 링크를 붙여넣으세요.';

  @override
  String get nativeSafariSignInMac =>
      '이 Mac에서 Casama 열기 -> 설정 -> 다른 기기에서 로그인으로 이동하거나 아래에 로그인 링크를 붙여넣으세요.';

  @override
  String get linuxDesktopComment => '내 모든 화면에서 대신 일해 주는 봇';

  @override
  String get linuxDesktopKeywords => 'AI;어시스턴트;에이전트;봇;채팅;';

  @override
  String macMenuAbout(String appName) {
    return '$appName에 관하여';
  }

  @override
  String get macMenuPreferences => '환경설정…';

  @override
  String get macMenuServices => '서비스';

  @override
  String macMenuHide(String appName) {
    return '$appName 가리기';
  }

  @override
  String get macMenuHideOthers => '기타 가리기';

  @override
  String get macMenuShowAll => '모두 보기';

  @override
  String macMenuQuit(String appName) {
    return '$appName 종료';
  }

  @override
  String get macMenuEdit => '편집';

  @override
  String get macMenuUndo => '실행 취소';

  @override
  String get macMenuRedo => '실행 복귀';

  @override
  String get macMenuCut => '오려두기';

  @override
  String get macMenuCopy => '복사하기';

  @override
  String get macMenuPaste => '붙여넣기';

  @override
  String get macMenuPasteAndMatchStyle => '붙여넣고 스타일 일치시키기';

  @override
  String get macMenuDelete => '삭제';

  @override
  String get macMenuSelectAll => '모두 선택';

  @override
  String get macMenuFind => '찾기';

  @override
  String get macMenuFindEllipsis => '찾기…';

  @override
  String get macMenuFindAndReplace => '찾기 및 바꾸기…';

  @override
  String get macMenuFindNext => '다음 찾기';

  @override
  String get macMenuFindPrevious => '이전 찾기';

  @override
  String get macMenuUseSelectionForFind => '선택 부분을 찾기에 사용';

  @override
  String get macMenuJumpToSelection => '선택 부분으로 이동';

  @override
  String get macMenuSpellingAndGrammar => '맞춤법 및 문법';

  @override
  String get macMenuSpelling => '맞춤법';

  @override
  String get macMenuShowSpelling => '맞춤법 및 문법 보기';

  @override
  String get macMenuCheckDocumentNow => '지금 문서 검사';

  @override
  String get macMenuCheckSpellingWhileTyping => '입력하는 동안 맞춤법 검사';

  @override
  String get macMenuCheckGrammar => '맞춤법과 함께 문법 검사';

  @override
  String get macMenuCorrectSpelling => '자동으로 맞춤법 수정';

  @override
  String get macMenuSubstitutions => '대체';

  @override
  String get macMenuShowSubstitutions => '대체 보기';

  @override
  String get macMenuSmartCopyPaste => '스마트 복사/붙여넣기';

  @override
  String get macMenuSmartQuotes => '스마트 인용 부호';

  @override
  String get macMenuSmartDashes => '스마트 대시';

  @override
  String get macMenuSmartLinks => '스마트 링크';

  @override
  String get macMenuDataDetectors => '데이터 감지기';

  @override
  String get macMenuTextReplacement => '텍스트 대치';

  @override
  String get macMenuTransformations => '변형';

  @override
  String get macMenuMakeUpperCase => '대문자로 만들기';

  @override
  String get macMenuMakeLowerCase => '소문자로 만들기';

  @override
  String get macMenuCapitalize => '첫 글자만 대문자로';

  @override
  String get macMenuSpeech => '말하기';

  @override
  String get macMenuStartSpeaking => '말하기 시작';

  @override
  String get macMenuStopSpeaking => '말하기 중단';

  @override
  String get macMenuView => '보기';

  @override
  String get macMenuEnterFullScreen => '전체 화면 시작';

  @override
  String get macMenuWindow => '윈도우';

  @override
  String get macMenuMinimize => '최소화';

  @override
  String get macMenuZoom => '확대/축소';

  @override
  String get macMenuBringAllToFront => '모두 앞으로 가져오기';

  @override
  String get macMenuHelp => '도움말';

  @override
  String get macMenuCheckForUpdates => '업데이트 확인…';

  @override
  String get macMenuSettings => '설정…';

  @override
  String get macMenuFile => '파일';

  @override
  String get macMenuNewChat => '새로운 대화';

  @override
  String get macMenuNewBot => '새 봇…';

  @override
  String get macMenuQuickAsk => '빠른 질문';

  @override
  String get macMenuSearch => '검색…';

  @override
  String get macMenuCloseWindow => '윈도우 닫기';

  @override
  String get macMenuGo => '이동';

  @override
  String get macMenuBots => '봇';

  @override
  String get macMenuInbox => '수신함';

  @override
  String get macMenuBoard => '보드';

  @override
  String get macMenuComputer => '컴퓨터';

  @override
  String get macMenuPages => '페이지';

  @override
  String get macMenuCasamaHelp => 'Casama 도움말';

  @override
  String get macMenuSendFeedback => '피드백 보내기…';

  @override
  String get siriBot => '봇';

  @override
  String get siriRoutine => '루틴';

  @override
  String get siriRoutines => '루틴';

  @override
  String get siriCanvas => '캔버스';

  @override
  String get siriAutomatic => '자동';

  @override
  String get siriAutomaticSubtitle => '봇이 가장 최근에 설정한 항목';

  @override
  String get siriChooseCanvas => '캔버스 선택';

  @override
  String get siriChooseCanvasDescription => '봇이 가장 최근에 설정한 내용이나 캔버스 하나를 표시해요.';

  @override
  String get siriChooseBot => '봇 선택';

  @override
  String get siriChooseBotDescription => '이 위젯에 표시할 봇을 선택해요.';

  @override
  String get siriChooseRoutines => '루틴 선택';

  @override
  String get siriChooseRoutinesDescription =>
      '다음 실행 예정 루틴을 보거나 최대 4개의 루틴을 선택해 표시해요.';

  @override
  String get siriOpenCasama => 'Casama 열기';

  @override
  String get siriWhere => '위치';

  @override
  String get siriTalkToBot => '봇과 통화';

  @override
  String get siriTalkToBotDescription => '선택한 봇과 음성 통화를 시작해요.';

  @override
  String get siriRunRoutine => '루틴 실행';

  @override
  String get siriRunRoutineControlDescription => 'Casama를 열지 않고도 선택한 루틴을 실행해요.';

  @override
  String get siriCallAction => '통화 동작';

  @override
  String get siriAction => '동작';

  @override
  String get siriStopBot => '봇 중지';

  @override
  String get siriRun => '실행';

  @override
  String get siriAnswerRequest => '봇의 요청에 응답';

  @override
  String get siriRequest => '요청';

  @override
  String get siriAllow => '허용';

  @override
  String get siriFromWidget => '위젯에서 실행';

  @override
  String get siriRunRoutineNow => '지금 루틴 실행';

  @override
  String get siriAcceptSuggestion => '봇의 제안 실행';

  @override
  String get siriSuggestion => '제안';

  @override
  String get siriBotStatusDescription => '봇의 현재 상태와 작업 내용';

  @override
  String get siriNextRoutineDescription => '다음 루틴과 실행 시간';

  @override
  String get siriAskCasama => 'Casama에 묻기';

  @override
  String get siriAskVoiceDescription => '음성으로 봇에게 질문해요';

  @override
  String get siriWhatWaiting => '승인을 기다리는 항목';

  @override
  String get siriAsk => '묻기';

  @override
  String get siriShortNeedsYou => '확인 필요';

  @override
  String get siriOpeningToFinish => '완료하기 위해 Casama를 여는 중이에요.';

  @override
  String get siriName => '이름';

  @override
  String get siriTitle => '제목';

  @override
  String get siriChat => '채팅';

  @override
  String get siriBotSubtitle => 'Casama에서 대화할 수 있는 AI 어시스턴트 봇';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Casama에서 $bot 봇이 실행하는 루틴';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Casama에서 $bot 봇과 나눈 대화';
  }

  @override
  String get siriBotInCasama => 'Casama의 봇';

  @override
  String siriRoutineDot(String bot) {
    return '루틴 · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return '$bot 봇과의 대화';
  }

  @override
  String get siriKeywordBot => '봇';

  @override
  String get siriKeywordRoutine => '루틴';

  @override
  String get siriKeywordChat => '채팅';

  @override
  String get siriAskBot => '봇에게 물어보기';

  @override
  String get siriAskBotDescription =>
      '새 채팅에서 Casama 봇(AI 어시스턴트)에게 질문을 보내고 답변을 읽어 줘요. 봇 이름을 말하지 않으면 가장 최근에 대화한 봇이 답해요.';

  @override
  String get siriCategoryBots => '봇';

  @override
  String get siriAskBotParamDescription =>
      '질문할 봇이에요. 비워 두면 가장 최근에 대화한 봇에게 물어요.';

  @override
  String get siriQuestion => '질문';

  @override
  String get siriQuestionDescription => '봇에게 물어볼 내용을 말로 자유롭게 입력하세요.';

  @override
  String get siriWhatShouldIAsk => '무엇을 물어볼까요?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return '$bot에게 $question 물어보기';
  }

  @override
  String get siriRestOnScreen => '나머지 내용은 화면에서 확인하세요.';

  @override
  String get siriRestOnScreenEllipsis => '… 나머지 내용은 화면에서 확인하세요.';

  @override
  String get siriRunRoutineDescription =>
      'Casama 봇의 루틴 중 하나를 지금 실행해요. 루틴이 혼자 실행될 때와 마찬가지로 결과는 앱과 알림으로 도착해요.';

  @override
  String get siriRoutineParamDescription => '지금 실행할 루틴이에요.';

  @override
  String siriSummaryRun(String routine) {
    return '$routine 실행';
  }

  @override
  String get siriWhatNeedsMe => '확인이 필요한 항목';

  @override
  String get siriWhatNeedsMeDescription =>
      'Casama에서 나를 기다리는 항목 수를 알려 줘요. 봇의 승인 요청, 직접 조작 요청, 제안이 포함되며 앱에서 응답할 수 있어요.';

  @override
  String get siriOpenBot => '봇 열기';

  @override
  String get siriOpenBotDescription => 'Casama 봇과의 대화를 열어요.';

  @override
  String get siriOpenBotPersonDescription => 'Casama 봇의 대화를 열어요.';

  @override
  String get siriOpenChat => '채팅 열기';

  @override
  String get siriOpenChatDescription => 'Casama 봇과의 채팅 중 하나를 열어요.';

  @override
  String get siriOpenRoutine => '루틴의 봇 열기';

  @override
  String get siriOpenRoutineDescription => 'Casama 루틴을 실행하는 봇을 열어요.';

  @override
  String get siriTalkDescription => 'Casama 봇과 음성 모드를 열어요. 동작 버튼에서도 사용할 수 있어요.';

  @override
  String get siriAskGetReply => '봇에게 묻고 답변 받기';

  @override
  String get siriAskGetReplyDescription =>
      'Casama 봇에게 질문을 보내고 단축어에서 이어서 쓸 수 있도록 답변 텍스트를 반환해요.';

  @override
  String get siriGetLastReply => '마지막 답변 가져오기';

  @override
  String get siriGetLastReplyDescription => 'Casama 봇 대화에서 가장 최근 답변 텍스트를 가져와요.';

  @override
  String get siriStartComputer => '컴퓨터 시작';

  @override
  String get siriStartComputerDescription => '확인 후 Casama 컴퓨터를 깨워요.';

  @override
  String get siriComputerName => '컴퓨터 이름';

  @override
  String get siriYourComputer => 'Casama 컴퓨터';

  @override
  String siriStartConfirm(String computer) {
    return '$computer 컴퓨터를 시작할까요?';
  }

  @override
  String get siriOpenToStartComputer => '컴퓨터를 시작하려면 Casama를 열어 주세요.';

  @override
  String get siriFocusTitle => 'Casama 집중 모드 필터 설정';

  @override
  String get siriFocusDescription =>
      '이 집중 모드가 켜진 동안 선택한 봇만 표시하고 선택적으로 먼저 말 걸기를 보류해요.';

  @override
  String get siriFocusBots => '표시할 봇';

  @override
  String get siriFocusHold => '먼저 말 걸기 보류';

  @override
  String get siriFocusShowOne => '봇 1개 표시';

  @override
  String siriFocusShowMany(int count) {
    return '봇 $count개 표시';
  }

  @override
  String get siriFocusHoldCheckIns => '먼저 말 걸기 보류';

  @override
  String get siriFocusAllowCheckIns => '먼저 말 걸기 허용';

  @override
  String get siriFocusAllBots => '모든 봇';

  @override
  String get siriFocusAllVisible => '모든 봇 표시';

  @override
  String get siriToolAsk => 'Casama 봇에게 물어보기';

  @override
  String get siriToolAskDescription => 'Casama 봇에게 질문을 보내고 답변을 받아와요.';

  @override
  String get siriCategoryAssistants => '어시스턴트';

  @override
  String get siriToolBotDescription => '질문할 Casama 봇이에요.';

  @override
  String get siriToolQuestionDescription => '봇에게 물어볼 내용이에요.';

  @override
  String get siriToolRun => 'Casama 루틴 실행';

  @override
  String get siriToolRunDescription => '확인 후 저장된 Casama 루틴을 실행해요.';

  @override
  String get siriCategoryAutomation => '자동화';

  @override
  String get siriToolRoutineDescription => '실행할 루틴이에요.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return '$bot 봇과 함께 $routine 루틴을 실행할까요?';
  }

  @override
  String get siriToolNeeds => 'Casama에서 확인이 필요한 항목';

  @override
  String get siriToolNeedsDescription =>
      'Casama에서 대기 중인 승인, 직접 조작 요청, 제안이 몇 개인지 확인해요.';

  @override
  String get siriOpenToCheck => '확인이 필요한 항목을 보려면 Casama를 열어 주세요.';

  @override
  String get siriToolStop => 'Casama 봇 중지';

  @override
  String get siriToolStopDescription => '현재 Casama에서 작업을 실행 중인 봇을 중지해요.';

  @override
  String get siriToolStopBotDescription => '중지할 봇이에요.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot 봇을 중지했어요.';
  }

  @override
  String get siriToolCall => 'Casama 봇과 통화';

  @override
  String get siriToolCallDescription => 'Casama를 열고 선택한 봇과 실시간 음성 통화를 시작해요.';

  @override
  String get siriCategoryCommunication => '커뮤니케이션';

  @override
  String get siriToolCallBotDescription => '통화할 봇이에요.';

  @override
  String siriCalling(String bot) {
    return '$bot 봇에게 전화를 거는 중이에요.';
  }

  @override
  String siriBotIn(String app) {
    return '$app의 봇';
  }

  @override
  String get siriMe => '나';

  @override
  String get siriABot => '봇';

  @override
  String get siriFavorited => '즐겨찾기함';

  @override
  String siriSentTo(String bot) {
    return '$bot 봇에게 보냄';
  }

  @override
  String get siriMessage => '메시지';

  @override
  String get siriNone => '없음';

  @override
  String get siriErrorOneBot => 'Casama는 한 번에 한 봇에게만 보낼 수 있어요. 어떤 봇에게 보낼까요?';

  @override
  String get siriErrorTextOnly =>
      'Siri에서는 봇에게 텍스트만 보낼 수 있어요. 파일, 사진, 장소는 Casama에서 추가해 주세요.';

  @override
  String get siriErrorNoBot => 'Casama에서 그 봇을 찾지 못했어요.';

  @override
  String get siriWhatShouldISend => '무엇을 보낼까요?';

  @override
  String get siriAskCasamaBot => 'Casama 봇에게 물어보기';

  @override
  String siriAskName(String bot) {
    return '$bot에게 물어보기';
  }

  @override
  String get siriAskAboutThis => '이 내용에 대해 Casama에게 물어보기';

  @override
  String siriPhraseAsk(String app) {
    return '$app에 물어봐';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return '$app 봇에게 물어봐';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return '$app의 $bot 봇에게 물어봐';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return '$app 봇과 통화해';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return '$app의 $bot 봇과 통화해';
  }

  @override
  String siriPhraseRunIn(String app) {
    return '$app 루틴 실행해';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return '$app에서 $routine 루틴 실행해';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return '$app에서 내가 확인할 거 뭐 있어';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return '$app에 기다리는 거 뭐 있어';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return '$app에 뭐 좀 물어봐';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return '$app에서 내 $routine 루틴 실행해';
  }

  @override
  String get siriABotSubject => '봇';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot 봇의 승인이 필요해요.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot 봇이 직접 조작을 요청해요.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot 봇이 제안을 보냈어요.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot 봇이 확인을 기다리고 있어요.';
  }

  @override
  String get siriOneThingNeedsYou => '확인이 필요한 항목이 1개 있어요.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '확인이 필요한 항목이 $count개 있어요.';
  }

  @override
  String get siriUnlockPhone => '휴대폰 잠금을 해제한 뒤 다시 시도해 주세요.';

  @override
  String get siriGeminiOff =>
      '이 휴대폰에서 Casama의 Gemini 연동이 꺼져 있어요 (Casama → 설정 → 개인정보 보호).';
}
